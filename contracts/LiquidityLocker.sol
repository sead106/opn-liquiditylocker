// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LiquidityLocker {

    struct LockPosition {
        uint256 amount;
        uint256 unlockTime;
        bool released;
    }

    mapping(address => LockPosition) private positions;

    event Locked(
        address indexed user,
        uint256 amount,
        uint256 unlockTime
    );

    event Extended(
        address indexed user,
        uint256 newUnlockTime
    );

    event Released(
        address indexed user,
        uint256 amount
    );

    function lock(uint256 unlockTime)
        external
        payable
    {
        require(msg.value > 0, "Amount required");

        require(
            unlockTime > block.timestamp,
            "Invalid unlock time"
        );

        LockPosition storage p =
            positions[msg.sender];

        require(
            p.amount == 0 || p.released,
            "Active lock exists"
        );

        positions[msg.sender] = LockPosition({
            amount: msg.value,
            unlockTime: unlockTime,
            released: false
        });

        emit Locked(
            msg.sender,
            msg.value,
            unlockTime
        );
    }

    function extendLock(
        uint256 newUnlockTime
    )
        external
    {
        LockPosition storage p =
            positions[msg.sender];

        require(
            p.amount > 0,
            "No position"
        );

        require(
            !p.released,
            "Already released"
        );

        require(
            newUnlockTime >
            p.unlockTime,
            "Must extend"
        );

        p.unlockTime =
            newUnlockTime;

        emit Extended(
            msg.sender,
            newUnlockTime
        );
    }

    function release()
        external
    {
        LockPosition storage p =
            positions[msg.sender];

        require(
            p.amount > 0,
            "No position"
        );

        require(
            !p.released,
            "Already released"
        );

        require(
            block.timestamp >=
            p.unlockTime,
            "Still locked"
        );

        uint256 amount =
            p.amount;

        p.released = true;
        p.amount = 0;

        payable(msg.sender)
            .transfer(amount);

        emit Released(
            msg.sender,
            amount
        );
    }

    function getLock(
        address user
    )
        external
        view
        returns (
            uint256 amount,
            uint256 unlockTime,
            bool released
        )
    {
        LockPosition memory p =
            positions[user];

        return (
            p.amount,
            p.unlockTime,
            p.released
        );
    }
}
