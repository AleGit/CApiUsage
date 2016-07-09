# C API Usage

A demonstration how C APIs of shared libraries can be used in Swift 3. 
(Tested on Ubuntu 14.04 LTS)

- [The Yices SMT solver](http://yices.csl.sri.com) via [CYices](https://github.com/AleGit/CYices)
- Tptp Parsing via [CTptpParsing](https://github.com/AleGit/CTptpParsing)

## Prerequisite

[Swift](http://swift.org) and [Yices](http://yices.csl.sri.com/) must have been downloaded and installed.

## Installation

- Package.swift resolves the dependencies to system modules.
- Yices.swift implements functions `version` and `demo`
- Parsing.swift
- main.swift calls `Yices.version()`, `Yices.demo()`, and Parsing...()
- the following sequence of commands:

```
git clone https://github.com/AleGit/CYicesSample.git
cd CYicesSample
swift build         # downloads Packages, fails
cd Packages/CTptpParsing-1.x.y/
sudo make install   # /usr/local/lib/libTptpParsing.so
cd ../..
swift build -Xlinker -L/usr/local/lib
.build/debug/CYicesSample
```

  should yield something like

```
Yices 2.4.2 installed.
```

## Known issues
- The installation of libTptpParsing.so is still a hack.
- On macOS 10.12 beta 2 the library path must be passed to the linker.
```
swift build -Xlinker -L/usr/local/lib/
Als-Mac:CApiUsage al$ otool -L .build/debug/CApiUsage
.build/debug/CApiUsage:
	/usr/lib/libobjc.A.dylib (compatibility version 1.0.0, current version 228.0.0)
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1237.0.0)
	/usr/local/lib/libyices.2.dylib (compatibility version 2.4.0, current version 2.4.2)
	@rpath/libswiftCore.dylib (compatibility version 1.0.0, current version 800.0.33)
	@rpath/libswiftDarwin.dylib (compatibility version 1.0.0, current version 800.0.33)
	@rpath/libswiftDispatch.dylib (compatibility version 1.0.0, current version 800.0.33)
	@rpath/libswiftObjectiveC.dylib (compatibility version 1.0.0, current version 800.0.33)
	@rpath/libswiftSwiftOnoneSupport.dylib (compatibility version 1.0.0, current version 800.0.33)
	libTptpParsing.so (compatibility version 0.0.0, current version 0.0.0)
```
