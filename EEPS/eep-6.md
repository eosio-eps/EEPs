---
EEP: 6
title: EOS Mainnet Extension Chains
status: Draft
type: RFC
author: Mathieu Bouliane, Richard Reiner, Guillaume Babin, Alexandre Bourget
created: 2019-04-20
---

## Abstract

This paper outlines a proposal for __EOS Mainnet Extensions__, which are side-chains of the EOS Mainnet which share user accounts with the Mainnet by means of an account-synchronizing Oracle, described below.

This approach provides easy and linear horizontal scalability, complementing the already-impressive vertical scalability of the EOSIO platform, and effectively multiplying available resources (RAM, CPU and Network bandwidth) with each network _without_ the creation of any new token.

This approach, by providing a horizontal multiplier to the vertical scalability of the EOSIO platform, helps to fully realize the scaling potential of EOS, and opens up competition for dapps: dapp developers needing a distributed database can choose the instance that fits their needs, at their price point, or even start their own, all the while keeping the accessible user base growing.



## Current state of affairs

The EOSIO platform provides a distributed database abstraction in which people with registered accounts can mutate database tables (by issuing a transaction), provided they follow on-chain rules (defined in smart contracts).

The EOS mainnet, launched in June 2018, provides impressive scalability (currently performing in the range of thousands of transactions per second), and shares its resources with all its users by means of two methods:

* a market for RAM allocation
* staking of the network token for CPU / Network bandwidth allocations

The governance of the EOS Mainnet is managed by delegated proof of stake, meaning that EOS holders vote for a number of entities that produce blocks, with a one token -> one-to-thirty vote setting.



## Key Aspects of this Proposal

1. On a Mainnet Extension, it is impossible to create an account, except that the `eosio` account can do so.

2. All account creations are done by synchronizing accounts existing on the EOS Mainnet accounts onto the Extension chain (including changes in authority). The accounts are synced by the BPs running the Extension network. This is done through an Oracle (see below).

3. The resources of the Extension network would be managed by the BPs as they offer the physical resources (see below).

4. The expectations placed on the BPs of an Extension network are clear: the BPs merely operate the network.  The BPs may jointly commit to service levels, which are reflected in the pricing of the resources of the particular Extension network.

5. The Extension network does not have its own token, and BPs are paid directly on the EOS Mainnet through a corresponding contract. EOS tokens can flow to the Extension network, through the same Oracle and set of BPs that run the Extension network, and live in the `eosio.token` contract over there.

6. Each chain Extension is free to experiment with governance, and the provided services.

    1. As an example, a BP in an Extension network can be ejected by supermajority vote (15/21) of the other BPs of that network, or other rules defined by them when they launch the Extension network.



## Trust model

Users of an Extension Network accept a level of trust in the BPs operating that network, both to some extent in individual BPs and to a greater degree, in the supermajority of those BPs.  They do this in order to obtain pragmatic benefits in terms of available resources, SLAs, etc.

In determining their level of trust in a particular Extension Network and its BPs, users may consider:

* The individual reputations of the BP entities
* The independence (or not) of the BP entities from one another
* The levels of transparency provided by the BPs, individually and collectively
* On some networks, bonds for correct operation may be posted by the BPs, individually or collectively.



## Resource allocation and BP incentivization mechanisms

All three physical resources (RAM, CPU and Network bandwidth) could be initially sold using EOS on the Mainnet and be allocated to the Extension Network. On top of the initial sale of resources, BPs could be rewarded from fees from secondary transactions of these resources, could capture an annual interest rate on held resources, could set resources pricing or use algorithmic market-making could be used like on the Mainnet.

Other mechanisms could be thought of, but all in all, something close to the cost (plus margin, of perhaps 100%) would be charged to those requiring a decentralized database.

CPU is absolutely transient. Net creates blockchain bloat, so a long-term fee could exist. RAM is clearly a long-term resource.

To help with cost expectations and decision making when choosing an Extension network, pricing of resources could be done in USD, based on a price feed ran by the Extension Network BPs.

Transfering EOS from Mainnet to the Extension Network could be charged at a fixed USD value (set by BPs), and the same for the reverse (from Exten Net to Mainnet), to account for the costs BPs will incur on Mainnet (and generally prevent spam). This fee could be adjusted by those BPs.

For EOS tokens locked in to allocate resources on the Extension Network, an interest rate would be taken (using an ever-increasing number like vote weighting on Mainnet, so that everyone is affected by changes in interest rate).



## Oracle design

Most operations would happen in a smart contract on the EOS mainnet, and corresponding operations would be transported through IBC to the Extension Network:

* Registration, unregistration of potential BPs
* Modifications of production schedule for the Extension Network: when hiring or firing a BP, or optimizing the handoff latency.
* Transferring EOS to the other network.
* Buying/selling of extension network resources.

The same Oracle can be used in reverse, sending transactions back to EOS Mainnet, like:

* Token withdrawals from the Extension Network
* Any sort of operational feedback useful to the different algorithms, like current resource usages, to adjust interest rate.

Transaction receipts on either network are observed by all BPs running the Extension network (like account creations/updates, modifications of the Extension network schedule, updated resources allocations, token transfers concerning the network, etc..).

These original transactions are then transformed into transactions targeting the _other_ network.  Using the Oracle software, each BP crafts the target transaction locally, then signs it and broadcasts to other BPs (on a small BP-only network) only the associated **signature + transaction hash prefix**. The reason for partial transaction hash propagation is that each node needs to come up with the transaction according to the rules agreed upon, and not broadcast the transaction itself (where others would simply cross-sign blindly).

Once one of them aggregates 15 signatures, it pushes it to the extension chain.

Smart contracts on each side must protect against missing block segments, and the Oracle must only propose changes in irreversible blocks.



## Thoughts on Future Scaling

When the EOS mainnet has 1 billion users, a good chunk of the RAM will be there solely to store user accounts.  At that point, some Extension Networks may sync only parts of the user base (while still disallowing local creation of accounts, which is key),  either by sub-`.domains`, or by having people opt into synchronization, by sending an initial transfer to have their account sync'd from then on.


## Follow up discussions

Please follow the GitHub issue https://github.com/eoscanada/EEPs/issues/32 for further discussion.


## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
