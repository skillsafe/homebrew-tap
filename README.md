# homebrew-tap

Homebrew tap for installing [AI SkillSafe](https://app.skillsafe.ai/) on macOS.

## Install

```sh
brew install --cask skillsafe/tap/ai-skillsafe
```

The first time, `brew install --cask <user>/<repo>/<cask>` auto-taps
`skillsafe/homebrew-tap` (the leading `homebrew-` is implicit). After that,
`brew upgrade --cask ai-skillsafe` keeps you on the latest version.

## What it installs

The Cask points at the **universal** macOS `.dmg` published on
[`skillsafe/ai-skillsafe-app`'s GitHub Releases](https://github.com/skillsafe/ai-skillsafe-app/releases) —
one binary that runs natively on both Apple Silicon (M1/M2/M3/M4) and Intel.
Requires macOS 11 Big Sur or later.

The app ships its own in-process auto-updater (Tauri's updater plugin), so
`auto_updates true` is set in the Cask. `brew upgrade` and the in-app updater
both keep the install fresh; whichever runs first wins.

## Maintenance

Cask source is regenerated after each release via
[`app-web/scripts/build-cask.mjs`](https://github.com/skillsafe/skillsafe-app/blob/main/app-web/scripts/build-cask.mjs)
in the private orchestration repo:

```sh
node app-web/scripts/build-cask.mjs --version <V>
```

The script downloads the published `.dmg`, hashes it, and writes
`Casks/ai-skillsafe.rb` in this repo (mounted at `homebrew-tap/` in the outer
private repo via a nested `.git/`). Commit + push to publish.

## Why a separate tap

Homebrew's main `homebrew-cask` repo prefers notarized macOS apps; the
current build is ad-hoc-signed. Once the app is notarized, the Cask can be
upstreamed and users will be able to drop the `skillsafe/tap/` prefix.
