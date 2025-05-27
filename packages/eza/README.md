<p align="center">
<img src="https://raw.githubusercontent.com/rustic-rs/assets/main/logos/readme_header.png" height="400" />
</p>
<p align="center"><b>fast, encrypted, and deduplicated backups</b></p>

<p align="center">
<a href="https://crates.io/crates/rustic-rs"><img src="https://img.shields.io/crates/v/rustic-rs.svg" /></a>
<a href="https://docs.rs/rustic-rs/"><img src="https://img.shields.io/docsrs/rustic-rs?style=flat&amp;labelColor=1c1d42&amp;color=4f396a&amp;logo=Rust&amp;logoColor=white" /></a>
<a href="https://raw.githubusercontent.com/rustic-rs/rustic/main/"><img src="https://img.shields.io/badge/license-Apache2.0/MIT-blue.svg" /></a>
<a href="https://crates.io/crates/rustic-rs"><img src="https://img.shields.io/crates/d/rustic-rs.svg" /></a>
<a href="https://github.com/rustic-rs/rustic/actions/workflows/nightly.yml"><img src="https://github.com/rustic-rs/rustic/actions/workflows/nightly.yml/badge.svg" /></a>
<a href="https://github.com/rustic-rs/rustic/actions/workflows/release-image.yml"><img src="https://github.com/rustic-rs/rustic/actions/workflows/release-image.yml/badge.svg" /></a>
<p>

## About

`rustic` is a backup tool that provides fast, encrypted, deduplicated backups.

It reads and writes the [restic][1] repo format described in the
[design document][2] and can be used as a *restic* replacement in most cases.

It is implemented in [Rust](https://www.rust-lang.org/), a performant,
memory-efficient, and reliable cross-platform systems programming language.

Hence `rustic` supports all major operating systems (Linux, MacOs, *BSD), with
Windows support still being experimental.

### Stability

`rustic` currently is in **beta** state and misses regression tests. It is not
recommended to use it for production backups, yet.

## Features

- Backup data is **deduplicated** and **encrypted**.
- Backup storage can be local or cloud storages, including cold storages.
- Allows multiple clients to **concurrently** access a backup repository using
  lock-free operations.
- Backups by default are append-only on the repository.
- The operations are robustly designed and can be **safely aborted** and
  **efficiently resumed**.
- Snapshot organization is possible by hostname, backup paths, label and tags.
  Also a rich set of metadata is saved with each snapshot.
- Retention policies and cleaning of old backups can be **highly customized**.
- Follow-up backups only process changed files, but still create a complete
  backup snapshot.
- In-place restore only modifies files which are changed.
- Uses config files for easy configuration of all every-day commands, see
  [example config files](/config/).

## License

Licensed under either of:

- [Apache License, Version 2.0](./LICENSE-APACHE)
- [MIT license](./LICENSE-MIT)

at your option.

[//]: # (badges)
[//]: # (general links)
[1]: https://github.com/restic/restic
[2]: https://github.com/restic/restic/blob/master/doc/design.rst
[3]: https://github.com/rustic-rs/rustic/discussions
