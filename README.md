# LiquidityLocker

Secure on-chain liquidity locking with transparent release conditions.

<p align="center">
<img src="./assets/preview.png" width="1000">
</p>

## Deployment

- Network: IOPN Testnet
- Contract Address: `0xd450F0Bf17696F54C3132D9333bE22895e07B564`
- Explorer: https://testnet.iopn.tech/address/0xd450F0Bf17696F54C3132D9333bE22895e07B564
- Live Demo: https://opn-liquiditylocker.vercel.app

A lightweight liquidity locking protocol built on OPN Chain for Builders Season 1.

A lightweight liquidity locking protocol built on OPN Chain for Builders Season 1.

---

## Overview

LiquidityLocker enables users to lock liquidity on-chain and release it only after a predefined unlock time.

The protocol focuses on transparency, simplicity, and verifiable lock conditions.

---

## Features

* Time-based liquidity locking
* User-controlled release
* Extend lock duration
* Public lock visibility
* Lightweight architecture

---

## Smart Contract

Contract:

contracts/LiquidityLocker.sol

Core functions:

* lock()
* extendLock()
* release()
* getLock()

---

## Architecture

User

↓

Lock Funds

↓

Store Unlock Timestamp

↓

Release Funds

---

## Deployment

Tech Stack:

* Solidity ^0.8.20
* Remix IDE
* GitHub
* Vercel

---

## Roadmap

### Phase 1

* Contract deployment
* Basic UI
* Testing

### Phase 2

* Dashboard
* Position history

---

## Status

Season 1 Builder Submission

Experimental Prototype

MIT License

---

## Tech Stack

* Solidity
* HTML
* CSS
* JavaScript
* OPN Chain
* Vercel
