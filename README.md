# EEPs [![Telegram](https://t.me/eos_enhancements_proposals)]
EOS Enchancement Proposals (EEPs) describe standards for the EOS platform, including core protocol specifications, client APIs, and contract standards.

A browsable version of all current and draft EEPs can be found on [NEED WEBSITE SET UP](http://test.com).

# Contributing

 1. Review [EEP-1](EEPS/eep-1.md).
 2. Fork the repository by clicking "Fork" in the top right.
 3. Add your EEP to your fork of the repository. There is a [template EEP here](eep-X.md).
 4. Submit a Pull Request to EOS's [EEPs repository](https://github.com/eoscanada/EEPs).

Your first PR should be a first draft of the final EEP. It must meet the formatting criteria enforced by the build (largely, correct metadata in the header). An editor will manually review the first PR for a new EEP and assign it a number before merging it. Make sure you include a `discussions-to` header with the URL to a discussion forum or open GitHub issue where people can discuss the EEP as a whole.

If your EEP requires images, the image files should be included in a subdirectory of the `assets` folder for that EEP as follow: `assets/eep-X` (for eep **X**). When linking to an image in the EEP, use relative links such as `../assets/eep-X/image.png`.

Once your first PR is merged, we have a bot that helps out by automatically merging PRs to draft EEPs. For this to work, it has to be able to tell that you own the draft being edited. Make sure that the 'author' line of your EEP contains either your GitHub username or your email address inside <triangular brackets>. If you use your email address, that address must be the one publicly shown on [your GitHub profile](https://github.com/settings/profile).

When you believe your EEP is mature and ready to progress past the draft phase, you should do one of two things:

 - **For a Standards Track EEP of type Core**, ask to have your issue added to [the agenda of an upcoming All Core Devs meeting](https://github.com/eos-mainnet/issues), where it can be discussed for inclusion in a future hard fork. If implementers agree to include it, the EEP editors will update the state of your EEP to 'Accepted'. //FLAG have pointed this to the EOS Mainnet Repo for the time being
 - **For all other EEPs**, open a PR changing the state of your EEP to 'Final'. An editor will review your draft and ask if anyone objects to its being finalised. If the editor decides there is no rough consensus - for instance, because contributors point out significant issues with the EEP - they may close the PR and request that you fix the issues in the draft before trying again.

# EEP Status Terms
* **Draft** - an EEP that is open for consideration.
* **Accepted** - an EEP that is planned for immediate adoption, i.e. expected to be included in the next hard fork (for Core/Consensus layer EEPs).
* **Final** - an EEP that has been adopted in a previous hard fork (for Core/Consensus layer EEPs).
* **Deferred** - an EEP that is not being considered for immediate adoption. May be reconsidered in the future for a subsequent hard fork.

# Preferred Citation Format

The canonical URL for an EEP that has achieved draft status at any point is at https://NEEDSITETOBEMADE.org/. For example, the canonical URL for EEP-165 is https://NEEDSITETOBEMADE.org/EEPs/eep-165.
