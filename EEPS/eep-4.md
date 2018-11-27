---
EEP: 4
title: Creating standard `type` for use with eosio.forum contract
author: Josh Kauffman <josh@eoscanada.com>, Alexandre Bourget <alex@eoscanada.com>, Matthieu Vachon <matthieu.vachon@eoscanada.com>
status: WIP
type: RFC
category: N/A
created: 2018-11-22
---

## Summary

The `eosio.forum` contract, currently found in the [eoscanada/eosio.forum](https://github.com/eoscanada/eosio.forum)
repository allows for users to cast a vote on a proposal to register their sentiment on-chain. Since this contract
can be used for simple polls all the way up to chain-altering referenda, there exists a need to define the different
kinds of standard uses, as well as the expected inputs/outputs/displays for each.

*For the purpose of this EEP, we will ignore the messaging aspect of the `eosio.forum` contract (post, unpost, status)*

## Motivation

When the `eosio.forum` contract was announced as being in Beta in November 2018, one of the first things realized
is that there were no clear definitions for what should be within the `type` field when creating a new `proposal`.
Further, there was no clear definition of when certain `types` should dictate further action by Block Producers
based on the result of the vote, nor was there any convention for how UIs were expected to display/handle `proposals`.

There was also demand for different kinds of responses, as the majority of thought up until launching the beta
was around Yes/No questions, as that was what was relevant for a referendum question as outlined in the Constitution
that was available on the EOS mainnet. Namely, there was need to add definition around multiple choice questions 
(3 or more options) and around Multi-Select questions so as to make the contract more useful.

## Specification

### General Behaviour/Definitions (Apply to all proposal types)

Any `vote_value` that is submitted that does not fall into the expected results will be only be used to count
towards voter participation of the overall vote (if that metric is being observed). For example, for proposal type
`referendum-v1`, a `vote_value` of `7` shall not count towards `No` or `Yes`, but the staked amount will count towards
voter participation for the "15% voter participation threshold".

Votes are weighted using XYZ (CONFIRM WITH DENIS)

Proxy voting should be handled by first delegating the `staked` amount of a user towards its proxy. If the user
casts a vote on a `proposal`, then their `stake` shall be removed from their proxy and weighted towards their 
chosen `vote_value` on its own. 

### Referendum

`referendum-v1` should be seen as the only `type` that Block Producers should utilize as a signal 
to act upon. The available responses are always `0`:`No`, `1`:`Yes`
All UIs should display the voting buttons along with their value e.g. "0 - No" and "1 - Yes"
so that a user can easily verify their vote through any block explorer, without the need to already
have the knowledge that a `vote_value` of 0 properly signifies their vote of "No", and so on.

```
{
  "type":"referendum-v1",
  "content":"content here"
}
```

Example:
```
{
  "type":"referendum-v1",
  "content":"Should EOS change its symbol to SYS?"
}
```
**_Summary Notes_**

Standard `vote_value`: 

`0` - "No" 

`1` - "Yes" 

If a vote of `type`:`referendum-v1` passes the required thresholds as defined in the goverenance documents,
Block Producers should act upon the result of this referendum.

As of writing, Article XI of the Constitution reads as: 

"This Constitution and its subordinate documents shall not be amended except by a vote of the token holders with no less than 15% vote participation among tokens and no fewer than 10% more Yes than No votes, sustained for 30 continuous days within a 120 day period."

_See [pre-launch discussion](https://forums.eosgo.io/discussion/820/article-xvi-v0-3-0-draft-eos-io-constitution-amendment#latest) for further clarification_

"15% vote participation" is defined as `staked`:`total` / `total_EOS_currency_supply` being above 0.15 or not.

"10% more Yes than No votes" is defined as a check on whether `staked`:`1` > ( 0.55 * ( `staked`:`0` + `staked`:`1` )) 

### Yes/No Poll

`poll-yn-v1` should be used for any polling that uses only Yes/No responses, and 
is not being proposed as an actionable vote for Block Producers. This should only be used for polling sentiment.
The available responses are always `0`:`No`, `1`:`Yes`
All UIs should display the voting buttons along with their value e.g. "0 - No" and "1 - Yes"
so that a user can easily verify their vote through any block explorer, without the need to already
have the knowledge that a `vote_value` of 0 properly signifies their vote of "No", and so on.

```
{
  "type":"poll-yn-v1",
  "content":"content here"
}
```

Example:
```
{
  "type":"poll-yn-v1",
  "content":"Should EOS change its symbol to SYS?"
}
```

**_Summary Notes_**

Standard `vote_value`: 

`0` - "No" 

`1` - "Yes" 

As this `type` of poll is not used for an official chain-altering decision, Block Producers
should **not** act in any meaningful way to the results of these polls. This can be useful for 
determining a path to take in further discussions, or whether or not a question would be worthwhile
being proposed for a `referendum`. 

### Yes/No/Abstain Poll

`poll-yna-v1` should be used for any polling that uses only Yes/No/Abstain responses, and 
is not being proposed as an actionable vote for Block Producers. This should only be used for polling sentiment.
The available responses are always `0`:`No`, `1`:`Yes`, `2`:`Abstain`
All UIs should display the voting buttons along with their value e.g. "0 - No", "1 - Yes", and "2 - Abstain"
so that a user can easily verify their vote through any block explorer, without the need to already
have the knowledge that a `vote_value` of 0 properly signifies their vote of "No", and so on.

_For clarification, abstain is defined as "formally decline to vote either for or against a proposal or motion"_

```
{
  "type":"poll-yna-v1",
  "content":"content here"
}
```

Example:
```
{
  "type":"poll-yna-v1",
  "content":"Should EOS change its symbol to SYS?"
}
```

**_Summary Notes_**

Standard `vote_value`: 

`0` - "No" 

`1` - "Yes" 

`2` - "Abstain"

As this `type` of poll is not used for an official chain-altering decision, Block Producers
should **not** act in any meaningful way to the results of these polls. This can be useful for 
determining a path to take in further discussions, or whether or not a question would be worthwhile
being proposed for a `referendum`. 

The addition of "Abstain" allows a user to have their vote count towards participation
to help signal community enthusiasm, while essentially delegating their decision to those 
who cast a Yes or No vote. This can help for deciding if a vote should then become a
referendum, and whether or not it might receive enough voter participation.

### Options Poll

`options-v1` should be used for any polling that requires multiple custom responses (`proposer` can
specify up to 255 different responses, always leaving one option for `Abstain`). UIs should fetch the 
possible responses from the "options" array. All UIs should push a vote value equal to the positon of 
the repsonse in the table (0-indexed), and should display the button as "`value` - `response`" so 
that a user can easily verify their vote through any block explorer, while lowering the amount of RAM 
needed to vote.

```
{
  "type":"options-v1",
  "content":"content here"
  "options": [
    "option1"
    "option2"
    "option3"
    ]
}
```

Example
```
{
  "type":"options-v1",
  "content":"Should EOS change its symbol?"
  "options": [
    "EOS"
    "SYS"
    "SOE"
    "EEE"
    "B1"
    "Other"
    ]
}
```
In this example, if a user selected the option "SYS", then the expected `vote_value` will be `1`.

**_Summary Notes_**

There are no standard `options` defined for this `type`. Options are all `proposer`-defined.


### Multi-Select Poll (Checkboxes)

`multi-select-v1` should be used for any polling that requires multiple possible repsonses from
from a single user, with max of 8 possible responses as defined by `proposer`. UIs should fetch 
the possible responses from the "options" array. 

The `vote_value` pushed by this `type` of `proposal` functions differently from the previous types, 
as it will need to encode multiple values into an 8 bits unsigned integer (one byte). Within the 8 
bits available, a value of `0` will  signify "unselected" and a value of `1` will signify "selected". 
With up to 8 responses available, each bit will correspond to its index in the array (0-indexed), in 
big-endian form, highest index being the most significant bit in the final value.

```
{
  "type":"multi-select-v1",
  "content":"content here"
  "options": [
    "option1"
    "option2"
    "option3"
    ]
}
```

Example
```
{
  "type":"multi-select-v1",
  "content":"Which of these symbols should EOS change to? Select all that you like."
  "options": [
    "EOS"
    "SYS"
    "SOE"
    "EEE"
    "B1"
    "Other"
    ]
}
```

In this example, if a user selected the responses: EOS, B1, and Other, their vote in binary would be
represented as `00110001`. When converted to decimal, this will be represented by a `vote_value` of `49`.

**_Summary Notes_**

There are no standard `options` defined for this `type`. Options are all `proposer`-defined.
Each `vote_value` pushed to chain should be broken down from their decimal representation to their
binary representation. `0` will signify all unselected responses, while `1` will signify all selected responses. 

## References

* `eosio.forum` [repository](https://github.com/eoscanada/eosio.forum)
* EOS Referendum Working Group on [Telegram](https://t.me/joinchat/HGqkxFAlvsxpRP9c6WvflQ)
* EOS Nation's [Vote Tally Repository](https://github.com/EOS-Nation/eosvotes-tally)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
