# CYicesSample
*Does not work with snapshot 2016-01-26? Swift-build is missing.*

This small project demonstrates how to directly use the C-API of
[The Yices SMT solver](http://yices.csl.sri.com) via
[CYices](https://github.com/AleGit/CYices)
system module in Swift.
(Tested on Ubuntu 14.04 LTS, Ubuntu 15.10 and Mac OS X 10.11)

## Prerequisite

[Swift](http://swift.org) and [Yices](http://yices.csl.sri.com/) must have been downloaded and installed.

## Overview

- Package.swift resolves the dependency to system module CYices.
- Demo.swift implements functions `version` and `demo`
- main.swift calls `version()` and `demo()`
- the following commands:

```
git clone https://github.com/AleGit/CYicesSample.git
cd CYicesSample
swift build
.build/debug/CYicesSample
```

  should yield something like

```
Yices 2.4.1 installed.
```
