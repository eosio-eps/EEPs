---
EEP: 5
title: Silent alerting through on-chain permissions
author: Alexandre Bourget <alex@eoscanada.com>
status: Draft
type: RFC
category: N/A
created: 2019-01-10
---

## Abstract

When critical network-level events happen, block producers need to
notify other block producers quickly, sometimes to take swift
action. It is also a desirable property that the alert be kept under
wrap, and not published directly to the blockchain. Also, block
producers don't want people to trigger their alerts for any reasons.

We hereby propose a protocol to allow BPs to receive alerts that can
only be triggered by some specific accounts (like the top 40 BPs or
so), and do not show up on chain, yet use on-chain permissions to
validate the authenticity of the alerts.

## Specification

The specification involves:
* a simple proxy able to forward `/v1/chain` calls to a remote EOSIO node
* intercepting calls to `/v1/chain/push_transaction`
* forwarding that call to a remote EOSIO node
* interpreting the response
* triggering an alert

To submit an alert, someone would need to craft a transaction to an
action on a contract that: a) `require_auth`'s the sending account,
and b) always fails. Upon submission through
`/v1/chain/push_transaction`, only an edge node would be able to
notice that this transaction exists, would execute it and it would
fail with one of two errors: a) authorization failure error, or b)
assertion failure.

By reading the response from the speculative execution of that
transaction, the proxy would know that the account sending the
transaction authorized the trigger of an alert.  Then, according to
local configuration, a proxy could execute some program which would
trigger a notification to registered employees. For example, it could
require 3 alerts from top-21 BPs, before waking up its employees, or 5
alerts from top 50.

By proxying `/v1/chain/get_required_keys`, `/v1/chain/get_info` calls
to a real network EOSIO node, one can use any tools (like `cleos` or
EOSIO-compatible libraries) to send the alert signal.

In case the network is completely broken (ex: all EOSIO nodes are
frozen), those sending alerts might have more pain crafting and
signing the transactions, but the protocol would still work provided
that the implementation has the following fallback mechanism: the
proxy would keep a cache of permissions for the accounts it is allowed
to receive notifications from (trusted accounts, or dynamic BP
accounts), and do local signature verification.

To avoid being used as a forwarder, the proxy would only attempt to
execute or check transactions that have a single action, with
signature `alwaysfail(account notifier)`
[that action would need to exist on a well-known contract, ideally the system contract],
that is configured as stated above.


## Follow-up discussions

are happening here: https://github.com/EOSIO/eosio.contracts/issues/169


## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
