# C API Usage

A demonstration how C APIs of shared libraries can be used in Swift 3. 
(Tested on Ubuntu 14.04 LTS)

- [The Yices SMT solver](http://yices.csl.sri.com) via [CYices](https://github.com/AleGit/CYices)
- Tptp Parsing via [CTptpParsing](https://github.com/AleGit/CTptpParsing)

## Prerequisite

[Swift](http://swift.org) and [Yices](http://yices.csl.sri.com/) must have been downloaded and installed.

## Yices

- Package.swift resolves the dependency to system module CYices.
- Demo.swift implements functions `version` and `demo`
- main.swift calls `Yices.version()` and `Yices.demo()`
- the following commands:

```
git clone https://github.com/AleGit/CYicesSample.git
cd CYicesSample
swift build
.build/debug/CYicesSample
```

  should yield something like

```
Yices 2.4.2 installed.
```
