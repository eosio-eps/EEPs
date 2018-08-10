---
EEP: 1
title: EEP Purpose and Guidelines
status: Active
type: Meta
author: NEED TO NAME AUTHORS
created: 2018-xx-yy
---

## What is an EEP?

EEP stands for EOS Enhancement Proposal. An EEP is a design document providing information to the EOS community, or describing a new feature for EOS or its processes or environment. The EEP should provide a concise technical specification of the feature and a rationale for the feature. The EEP author is responsible for building consensus within the community and documenting dissenting opinions.

## EEP Rationale

We intend EEPs to be the primary mechanisms for proposing new features, for collecting community input on an issue, and for documenting the design decisions that have gone into EOS. Because the EEPs are maintained as text files in a versioned repository, their revision history is the historical record of the feature proposal.

For EOS implementers, EEPs are a convenient way to track the progress of their implementation. Ideally each implementation maintainer would list the EEPs that they have implemented. This will give end users a convenient way to know the current status of a given implementation or library.

## EEP Types

There are three types of EEP:

- A **Standard Track EEP** describes any change that affects most or all EOS implementations, such as a change to the the network protocol, a change in block or transaction validity rules, proposed application standards/conventions, or any change or addition that affects the interoperability of applications using EOS. Furthermore Standard EEPs can be broken down into the following categories. Standards Track EEPs consist of three parts, a design document, implementation, and finally if warranted an update to the [formal specification].
  - **Core** - improvements requiring a consensus fork, as well as changes that are not necessarily consensus critical but may be relevant to [“core dev” discussions] [FLAG - DO WE ALSO HAVE CONSENSUS FORKS ON EOS?] [FLAG - WE DON'T HAVE CORE DEVS, SHOULD THAT BE REPLACED BY SOMETHING?]
  - **Networking** - includes improvements around [devp2p] and [Light Ethereum Subprotocol], as well as proposed improvements to network protocol specifications of [whisper] and [swarm]. [FLAG - Do these make sense/do we have a similar thing? [devp2p] and [Light Ethereum Subprotocol] and  specifications of [whisper] and [swarm]]
  - **Interface** - includes improvements around client [API/RPC] specifications and standards, and also certain language-level standards like method names and [contract ABIs]. The label “interface” aligns with the [FLAG - DO WE NEED TO CHANCE interfaces repo] [interfaces repo] and discussion should primarily occur in that repository before an EEP is submitted to the EEPs repository.
  - **ERC** - [FLAG - WE NEED TO MAKE AN EQUIVALENT NAME FOR ERC] application-level standards and conventions, including contract standards such as token standards, name registries, URI schemes, library/package formats, and wallet formats.
- An **Informational EEP** describes an EOS design issue, or provides general guidelines or information to the EOS community, but does not propose a new feature. Informational EEPs do not necessarily represent EOS community consensus or a recommendation, so users and implementers are free to ignore Informational EEPs or follow their advice.
- A **Meta EEP** describes a process surrounding EOS or proposes a change to (or an event in) a process. Process EEPs are like Standard Track EEPs but apply to areas other than the EOS protocol itself. They may propose an implementation, but not to EOS's codebase; they often require community consensus; unlike Informational EEPs, they are more than recommendations, and users are typically not free to ignore them. Examples include procedures, guidelines, changes to the decision-making process, and changes to the tools or environment used in EOS development. Any meta-EEP is also considered a Process EEP.

It is highly recommended that a single EEP contain a single key proposal or new idea. The more focused the EEP, the more successful it tends to be. A change to one client doesn't require an EEP; a change that affects multiple clients, or defines a standard for multiple apps to use, does.

An EEP must meet certain minimum criteria. It must be a clear and complete description of the proposed enhancement. The enhancement must represent a net improvement. The proposed implementation, if applicable, must be solid and must not complicate the protocol unduly.

## EEP Work Flow

Parties involved in the process are you, the champion or *EEP author*, the [*EEP editors*](#eep-editors), and the [*EOS Core Developers*]. [FLAG - WE WILL NEED TO MAKE A NEW HASHTAG TO REPLACE #eep-editors AND WE DON'T HAVE CORE DEVS]

:warning: Before you begin, vet your idea, this will save you time. Ask the EOS community first if an idea is original to avoid wasting time on something that will be be rejected based on prior research (searching the Internet does not always do the trick). It also helps to make sure the idea is applicable to the entire community and not just the author. Just because an idea sounds good to the author does not mean it will work for most people in most areas where EOS is used. Examples of appropriate public forums to gauge interest around your EEP include [the EOS subreddit], [the Issues section of this repository], and [SHOULD WE LIST A SITE LIKE EOS GO FORUMS?]. In particular, [the Issues section of this repository] is an excellent place to discuss your proposal with the community and start creating more formalized language around your EEP.

Your role as the champion is to write the EEP using the style and format described below, shepherd the discussions in the appropriate forums, and build community consensus around the idea. Following is the process that a successful EEP will move along:

```
[ WIP ] -> [ DRAFT ] -> [ LAST CALL ] -> [ ACCEPTED ] -> [ FINAL ]
```

Each status change is requested by the EEP author and reviewed by the EEP editors. Use a pull request to update the status. Please include a link to where people should continue discussing your EEP. The EEP editors will process these requests as per the conditions below.

* **Work in progress (WIP)** -- Once the champion has asked the EOS community whether an idea has any chance of support, they will write a draft EEP as a [pull request]. Consider including an implementation if this will aid people in studying the EEP.
  * :arrow_right: Draft -- If agreeable, EEP editor will assign the EEP a number (generally the issue or PR number related to the EEP) and merge your pull request. The EEP editor will not unreasonably deny an EEP.
  * :x: Draft -- Reasons for denying draft status include being too unfocused, too broad, duplication of effort, being technically unsound, not providing proper motivation or addressing backwards compatibility, or not in keeping with the [EOS philosophy].
* **Draft** -- Once the first draft has been merged, you may submit follow-up pull requests with further changes to your draft until such point as you believe the EEP to be mature and ready to proceed to the next status. An EEP in draft status must be implemented to be considered for promotion to the next status (ignore this requirement for core EEPs).
  * :arrow_right: Last Call -- If agreeable, the EEP editor will assign Last Call status and set a review end date, normally 14 days later.
  * :x: Last Call -- A request for Last Call status will be denied if material changes are still expected to be made to the draft. We hope that EEPs only enter Last Call once, so as to avoid unnecessary noise on the RSS feed. Last Call will be denied if the implementation is not complete and supported by the community.
* **Last Call** -- This EEP will listed prominently on the [NEED WEBSITE CREATED] website [NEED TO CREATE AN RSS] (subscribe via RSS at [last-call.xml](/last-call.xml)).
  * :x: -- A Last Call which results in material changes or substantial unaddressed complaints will cause the EEP to revert to Draft.
  * :arrow_right: Accepted (Core EEPs only) -- After the review end date, the [IF WE HAVE SOMETHING SIMILAR TO CORE DEVS] EOS Core Developers will vote on whether to accept this change. If yes, the status will upgrade to Accepted.
  * :arrow_right: Final (Not core EEPs) -- A successful Last Call without material changes or unaddressed complaints will become Final.
* **Accepted (Core EEPs only)** -- This is being implemented by [FLAGGING FOR CORE DEV] EOS Core Developers.
  * :arrow_right: Final -- Standards Track Core EEPs must be implemented in at least three viable EOS clients [WILL WE NEED A DIFFERENT AMOUNT?] before it can be considered Final. When the implementation is complete and supported by the community, the status will be changed to “Final”.
* **Final** -- This EEP represents the current state-of-the-art. A Final EEP should only be updated to correct errata.

Other exceptional statuses include:

* Deferred -- This is for core EEPs that have been put off for a future hard fork.
* Rejected -- An EEP that is fundamentally broken and will not be implemented.
* Active -- This is similar to Final, but denotes an EEP which which may be updated without changing its EEP number.
* Superseded -- An EEP which was previously final but is no longer considered state-of-the-art. Another EEP will be in Final status and reference the Superseded EEP.

## What belongs in a successful EEP?

Each EEP should have the following parts:

- Preamble - RFC 822 style headers containing metadata about the EEP, including the EEP number, a short descriptive title (limited to a maximum of 44 characters), and the author details. See [LEAVING THIS IN AS WE'LL NEED TO CREATE OUR OWN VERSION AND THEN EDIT THIS LINK] [below](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-1.md#eip-header-preamble) for details.
- Simple Summary - “If you can’t explain it simply, you don’t understand it well enough.” Provide a simplified and layman-accessible explanation of the EEP.
- Abstract - a short (~200 word) description of the technical issue being addressed.
- Motivation (*optional) - The motivation is critical for EEPs that want to change the EOS.IO protocol. It should clearly explain why the existing protocol specification is inadequate to address the problem that the EEP solves. EEP submissions without sufficient motivation may be rejected outright.
- Specification - The technical specification should describe the syntax and semantics of any new feature. The specification should be detailed enough to allow competing, interoperable implementations for any of the current EOS platforms [FLAG FOR EDIT >] (cpp-ethereum, go-ethereum, parity, ethereumJ, ethereumjs-lib, [and others](https://github.com/ethereum/wiki/wiki/Clients).
- Rationale - The rationale fleshes out the specification by describing what motivated the design and why particular design decisions were made. It should describe alternate designs that were considered and related work, e.g. how the feature is supported in other languages. The rationale may also provide evidence of consensus within the community, and should discuss important objections or concerns raised during discussion.
- Backwards Compatibility - All EEPs that introduce backwards incompatibilities must include a section describing these incompatibilities and their severity. The EEP must explain how the author proposes to deal with these incompatibilities. EEP submissions without a sufficient backwards compatibility treatise may be rejected outright.
- Test Cases - Test cases for an implementation are mandatory for EEPs that are affecting consensus changes. Other EEPs can choose to include links to test cases if applicable.
- Implementations - The implementations must be completed before any EEP is given status “Final”, but it need not be completed before the EEP is merged as draft. While there is merit to the approach of reaching consensus on the specification and rationale before writing code, the principle of “rough consensus and running code” is still useful when it comes to resolving many discussions of API details.
- Copyright Waiver - All EEPs must be in the public domain. See the bottom of this EEP for an example copyright waiver.

## EEP Formats and Templates

EEPs should be written in [markdown] format.
Image files should be included in a subdirectory of the `assets` folder for that EEP as follow: `assets/eep-X` (for eep **X**). When linking to an image in the EEP, use relative links such as `../assets/eep-X/image.png`.

## EEP Header Preamble

Each EEP must begin with an RFC 822 style header preamble, preceded and followed by three hyphens (`---`). The headers must appear in the following order. Headers marked with "*" are optional and are described below. All other headers are required.

` eep:` <EEP number> (this is determined by the EEP editor)

` title:` <EEP title>

` author:` <a list of the author's or authors' name(s) and/or username(s), or name(s) and email(s). Details are below.>

` * discussions-to:` <url>

` status:` <Draft | Last Call | Accepted | Final | Active | Deferred | Rejected | Superseded>

`* review-period-end: YYYY-MM-DD

` type: `<Standards Track (Core, Networking, Interface, ERC)  | Informational | Meta>

` * category:` <Core | Networking | Interface | ERC>

` created:` <date created on, in ISO 8601 (yyyy-mm-dd) format>

` * requires:` <EEP number(s)>

` * replaces:` <EEP number(s)>

` * superseded-by:` <EEP number(s)>

` * resolution:` <url>

#### Author header

The author header optionally lists the names, email addresses or usernames of the authors/owners of the EEP. Those who prefer anonymity may use a username only, or a first name and a username. The format of the author header value must be:

Random J. User &lt;address@dom.ain&gt;

or

Random J. User (@username)

if the email address or GitHub username is included, and

Random J. User

if the email address is not given.

Note: The resolution header is required for Standards Track EEPs only. It contains a URL that should point to an email message or other web resource where the pronouncement about the EEP is made.

While an EEP is a draft, a discussions-to header will indicate the mailing list or URL where the EEP is being discussed. As mentioned above, examples for places to discuss your EEP include [FLAG AS THERE IS CURRENTLY NOT A GITTER SETUP?] [EOS topics on Gitter](https://gitter.im/eos/topics), an issue in this repo or in a fork of this repo, [FLAG, IS THERE AN EQUIVALENT TO SET UP?][Ethereum Magicians](https://ethereum-magicians.org/) (this is suitable for EEPs that may be contentious or have a strong governance aspect), and [Reddit r/eos](https://www.reddit.com/r/eos/). No discussions-to header is necessary if the EEP is being discussed privately with the author.

The type header specifies the type of EEP: Standards Track, Meta, or Informational. If the track is Standards please include the subcategory (core, networking, interface, or ERC).

The category header specifies the EEP's category. This is required for standards-track EEPs only.

The created header records the date that the EEP was assigned a number. Both headers should be in yyyy-mm-dd format, e.g. 2001-08-14.

EEPs may have a requires header, indicating the EEP numbers that this EEP depends on.

EEPs may also have a superseded-by header indicating that an EEP has been rendered obsolete by a later document; the value is the number of the EEP that replaces the current document. The newer EEP must have a Replaces header containing the number of the EEP that it rendered obsolete.

Headers that permit lists must separate elements with commas.

## Auxiliary Files

EEPs may include auxiliary files such as diagrams. Such files must be named EEP-XXXX-Y.ext, where “XXXX” is the EEP number, “Y” is a serial number (starting at 1), and “ext” is replaced by the actual file extension (e.g. “png”).

## Transferring EEP Ownership

It occasionally becomes necessary to transfer ownership of EEPs to a new champion. In general, we'd like to retain the original author as a co-author of the transferred EEP, but that's really up to the original author. A good reason to transfer ownership is because the original author no longer has the time or interest in updating it or following through with the EEP process, or has fallen off the face of the 'net (i.e. is unreachable or isn't responding to email). A bad reason to transfer ownership is because you don't agree with the direction of the EEP. We try to build consensus around an EEP, but if that's not possible, you can always submit a competing EEP.

If you are interested in assuming ownership of an EEP, send a message asking to take over, addressed to both the original author and the EEP editor. If the original author doesn't respond to email in a timely manner, the EEP editor will make a unilateral decision (it's not like such decisions can't be reversed :)).

## EEP Editors

The current EEP editors are

` * PERSON 1 (@aperson1)` 

` * PERSON 2 (@person2)`

` * PERSON 3 (@person3)`

` * PERSON 4 (@person4)`

` * PERSON 5 (@person5)`

` * PERSON 6 (@person6)`

## EEP Editor Responsibilities

For each new EEP that comes in, an editor does the following:

- Read the EEP to check if it is ready: sound and complete. The ideas must make technical sense, even if they don't seem likely to get to final status.
- The title should accurately describe the content.
- Check the EEP for language (spelling, grammar, sentence structure, etc.), markup (Github flavored Markdown), code style

If the EEP isn't ready, the editor will send it back to the author for revision, with specific instructions.

Once the EEP is ready for the repository, the EEP editor will:

- Assign an EEP number (generally the PR number or, if preferred by the author, the Issue # if there was discussion in the Issues section of this repository about this EEP)

- Merge the corresponding pull request

- Send a message back to the EEP author with the next step.

Many EEPs are written and maintained by developers with write access to the Ethereum codebase. The EEP editors monitor EEP changes, and correct any structure, grammar, spelling, or markup mistakes we see.

The editors don't pass judgment on EEPs. We merely do the administrative & editorial part.

## History

This document was derived heavily from [Ethereum's EIP-1] written by Martin Becze, Hudson Jameson, and others, which was derived from [Bitcoin's BIP-0001] written by Amir Taaki which in turn was derived from [Python's PEP-0001]. In many places text was simply copied and modified. Although the PEP-0001 text was written by Barry Warsaw, Jeremy Hylton, and David Goodger, they are not responsible for its use in the EOS Enhancement Process, and should not be bothered with technical questions specific to EOS or the EEP. Please direct all comments to the EEP editors.












[markdown]: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet
[Ethereum's EIP-1]: https://github.com/ethereum/EIPs/
[Bitcoin's BIP-0001]: https://github.com/bitcoin/bips
[Python's PEP-0001]: https://www.python.org/dev/peps/

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
