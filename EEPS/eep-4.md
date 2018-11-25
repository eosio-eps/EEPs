---
EEP: 4
title: Creating standard `type` for use with eosio.forum contract
author: Josh Kauffman <josh@eoscanada.com>, Alexandre Bourget <alex@eoscanada.com>, Matthieu Vachon <matthieu.vachon@eoscanada.com>
status: WIP
type: RFC
category: N/A
created: 2018-11-22
---

STILL NEED TO INCORPORATE
Sections: the expected result of a vote as displayed on an explorer,
talk about proper JSON formatting, 
Next steps: UI integration and feedback

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

Referendum
-----------

`referendum-v1` should be seen as the only `type` that Block Producers should utilize as a signal 
to act upon. The available responses are always `0`:`No`, `1`:`Yes`
All UIs should display the voting buttons along with their value e.g. "0 - No" and "1 - Yes"
so that a user can easily verify their vote through any block explorer, without the need to already
have the knowledge that a `vote_value` of 0 properly signifies their vote of "No", and so on.

```
{
  "type":"referendum-v1",
  "content":`string`
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

Yes/No Poll
-----------

`poll-yn-v1` should be used for any polling that uses only Yes/No responses, and 
is not being proposed as an actionable vote for Block Producers. This should only be used for polling sentiment.
The available responses are always `0`:`No`, `1`:`Yes`
All UIs should display the voting buttons along with their value e.g. "0 - No" and "1 - Yes"
so that a user can easily verify their vote through any block explorer, without the need to already
have the knowledge that a `vote_value` of 0 properly signifies their vote of "No", and so on.

```
{
  "type":"poll-yn-v1",
  "content":`string`
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

Yes/No/Abstain Poll
-----------

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
  "content":`string`
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

Options Poll
-----------

`options-v1` should be used for any polling that requires multiple custom responses (`proposer` can
specify up to 256 different responses). UIs should fetch the possible responses from the "options" array
All UIs should push a vote value equal to the positon of the repsonse in the table, and
should display the button as "`value` - `response`" so that a user can easily
verify their vote through any block explorer, while lowering the amount of RAM needed to vote.

```
{
  "type":"options-v1",
  "content":`string`
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

**_Summary Notes_**

There are no standard `vote_value` defined for this `type`. Responses are all `proposer`-defined.


Multi-Select Poll (Checkboxes)
-----------

`multi-select-v1` should be used for any polling that requires multiple possible repsonses from
from a single user, with max of 8 possible responses as defined by `proposer`. UIs should fetch 
the possible responses from the "options" array. 

The `vote_value` pushed by this `type` of `proposal` functions different from the previous types, 
as it will need to encode multiple values into binary. NEED TO ADD ON HERE

```
{
  "type":"multi-select-v1",
  "content":`string`
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

**_Summary Notes_**

There are no standard `vote_value` defined for this `type`. Responses are all `proposer`-defined.

## References

* `eosio.forum` [repository](https://github.com/eoscanada/eosio.forum
* EOS Referendum Working Group on [Telegram](https://t.me/joinchat/HGqkxFAlvsxpRP9c6WvflQ)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
