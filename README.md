# EOSIPs [![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/ethereum/EOSIPs?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)
Ethereum Improvement Proposals (EOSIPs) describe standards for the Ethereum platform, including core protocol specifications, client APIs, and contract standards.

A browsable version of all current and draft EOSIPs can be found on [the official EOSIP site](http://eips.ethereum.org/).

# Contributing

 1. Review [EOSIP-1](EOSIPs/eip-1.md).
 2. Fork the repository by clicking "Fork" in the top right.
 3. Add your EOSIP to your fork of the repository. There is a [template EOSIP here](eip-X.md).
 4. Submit a Pull Request to Ethereum's [EOSIPs repository](https://github.com/ethereum/EOSIPs).

Your first PR should be a first draft of the final EOSIP. It must meet the formatting criteria enforced by the build (largely, correct metadata in the header). An editor will manually review the first PR for a new EOSIP and assign it a number before merging it. Make sure you include a `discussions-to` header with the URL to a discussion forum or open GitHub issue where people can discuss the EOSIP as a whole.

If your EOSIP requires images, the image files should be included in a subdirectory of the `assets` folder for that EOSIP as follow: `assets/eip-X` (for eip **X**). When linking to an image in the EOSIP, use relative links such as `../assets/eip-X/image.png`.

Once your first PR is merged, we have a bot that helps out by automatically merging PRs to draft EOSIPs. For this to work, it has to be able to tell that you own the draft being edited. Make sure that the 'author' line of your EOSIP contains either your Github username or your email address inside <triangular brackets>. If you use your email address, that address must be the one publicly shown on [your GitHub profile](https://github.com/settings/profile).

When you believe your EOSIP is mature and ready to progress past the draft phase, you should do one of two things:

 - **For a Standards Track EOSIP of type Core**, ask to have your issue added to [the agenda of an upcoming All Core Devs meeting](https://github.com/ethereum/pm/issues), where it can be discussed for inclusion in a future hard fork. If implementers agree to include it, the EOSIP editors will update the state of your EOSIP to 'Accepted'.
 - **For all other EOSIPs**, open a PR changing the state of your EOSIP to 'Final'. An editor will review your draft and ask if anyone objects to its being finalised. If the editor decides there is no rough consensus - for instance, because contributors point out significant issues with the EOSIP - they may close the PR and request that you fix the issues in the draft before trying again.

# EOSIP Status Terms
* **Draft** - an EOSIP that is open for consideration.
* **Accepted** - an EOSIP that is planned for immediate adoption, i.e. expected to be included in the next hard fork (for Core/Consensus layer EOSIPs).
* **Final** - an EOSIP that has been adopted in a previous hard fork (for Core/Consensus layer EOSIPs).
* **Deferred** - an EOSIP that is not being considered for immediate adoption. May be reconsidered in the future for a subsequent hard fork.

# Preferred Citation Format

The canonical URL for a EOSIP that has achieved draft status at any point is at https://eips.ethereum.org/. For example, the canonical URL for ERC-165 is https://eips.ethereum.org/EOSIPS/eip-165.
