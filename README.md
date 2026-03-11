# CrossBox

CrossBox is a collection of UNIX ([POSIX][posix.1-2024]) utilities, written with modern C/C++.

## Introduction

UNIX utilities -- such as `ls`, `cat`, `cp` -- are the essential tools for UNIX shell environment. While well-established implementations like [GNU coreutils][gnu-coreutils], [Uutils][uutils], [BusyBox][busybox] and [toybox][toybox] exist, CrossBox sets itself apart with a specific goal: **implementation using only the C++ Standard Library**.

By avoiding conditional compilation and system-specific dependencies, CrossBox achieves excellent portability. It can run on Linux, Windows, MacOS, or any other system with a compliant C++ compiler. This project also serves as an exploration of the limits of pure standard C/C++.

## Motivation

The primary motivation for CrossBox is to bring the UNIX command-line experience to Windows, an environment I enjoy working in.

Secondly, this project provides a practical playground to experiment with modern C++ standards, especially the `<filesystem>` library introduced in C++17/20.

## Progress and Roadmap

CrossBox is currently under active development.

### Current Features in v0.0.1

- [x] basename
- [ ] cal
- [ ] cat
- [ ] dirname
- [x] echo
- [x] false
- [x] true

### Planned Features in v0.0.2+

- cd
- cmp
- cp
- cut
- date
- du
- env
- hash
- head
- mkdir
- mv
- pwd
- rm
- tail

## Building

CrossBox uses [Xmake][xmake] as its building system.

**Build all utilities**:
```bash
xmake
```

**Build a specific utility (replace `<util>` with its name)**:
```bash
xmake build <util>
```

**Run tests**:
```bash
xmake test
```

**Package the project**:
```bash
xmake pack
```

## Reference

- The specification of POSIX.1-2024: [POSIX][posix.1-2024]
- Core GNU Utilities: [GNU coreutils][gnu-coreutils]
- Uutils: [Uutils][uutils]
- BusyBox: [BusyBox][busybox]
- Toybox: [Toybox][toybox]
- Xmake: [Xmake][xmake]

[posix.1-2024]:https://pubs.opengroup.org/onlinepubs/9799919799/
[gnu-coreutils]: https://www.gnu.org/software/coreutils/
[uutils]: https://github.com/uutils
[busybox]: https://busybox.net/
[toybox]: https://landley.net/toybox/
[xmake]: https://xmake.io/

