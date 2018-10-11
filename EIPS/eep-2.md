---
eip: 2
title: EOS Verificatoin of Web Properties
author: Josh Kauffman <josh@eoscanada.com>, Alexandre Bourget <alex@eoscanada.com>, Marc-Antoine Ross <marc@eoscanada.com>, Stephane Duschesneau <stephane@eoscanada.com>, Matthieu Vachon <matthieu.vachon@eoscanada.com>
status: Draft
type: Informational EEP
category: N/A
created: 2018-10-10
---

## Summary

There is currently no trusted mechanism by which an EOS account owner can have their account verified. By adopting a structure 
similar to [Keybase's](https://keybase.io) verification system, an EOS user will be able to link their account to multiple 
web properties that they are in control of. This can be used to increase trust of an account, so that another user will 
be more or less likely to enter into a transaction with them. 

The goal is to introduce increased trust into the ecosystem. We envision that Block Explorers will be able to scrape
data from this mechanism to display verified properties. 

## Motivation

The original motivation came from seeing ECAF send out messages to user accounts whom they were trying to reach.
Without an easy and verifiable means for another account to verify that this is the *the* ECAF EOS account, there 
is no reason to expect trust to be assumed. 

## Specification

1. A user controlling an EOS account who wishes to have their web property verified will push a transaction towards 
the EOS account `accountsjson` which exists on the EOS mainnet 
(chain ID: aca376f206b8fc25a6ed44dbdc66547c36c6c33e3a119ffbeaef943642f0e906)
2. The transaction should include a json string that contains the information which they wish to link to their account.
3. A user can update the information by sending a new transaction. The most recent transaction will be the only one
that the system uses.

### Proposed JSON:
```
{
  "name": "Long form name",
  "website": "https://example.com",
  "accounts": {
    "github": {
      "handle": "github_account_name",
      "claim": "https://gist.github.com/{ID}"
    },
  },
  "contract": {
    "repo": "https://github.com/org/repo",
    "rev": "abcdef123123123123abcdef"
  }
}
```

### Breakdown

**Name** - Max 100 characters. This field is to assign a name to the account that can be displayed by UIs (first name/last name, business name, pseudonym, etc...)

**Website** - The URL that an account wants to be associated to. It will need to host a .csv file named `claims.csv` in the path /.well-known/eosio-accounts/

**GitHub** - The URL of the gist with the filename `eosio-accounts-claims.csv`.

Each line of the .csv file should contain:

*First 8 bytes of the chain ID, followed by a comma, followed by an EOSIO account name*

Example of account `testtesttest` on the EOS mainnet:

aca376f2,testtesttest

### Implementation

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).


