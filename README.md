# CYicesSample
Example how to directly use 
[The Yices SMT solver](http://yices.csl.sri.com) C-API via 
[CYices](https://github.com/AleGit/CYices) 
[system module](https://github.com/apple/swift-package-manager/blob/master/Documentation/SystemModules.md) in Swift.

## Prerequisite

Swift and Yices must have been downloaded and installed.

## Overview

- Package.swift resolves the dependency to system module CYices.
- main.swift converts and prints the Yices version C-String.
- the following commands:

  `git clone https://github.com/AleGit/CYicesSample.git`
  
  `cd CYicesSample`

  `swift build`
    
  `.build/debug/CYicesSample`
  
  should yield something like

  `Yices 2.4.1 is installed.`

   (Tested with Ubuntu 15.10 and Mac OS X 10.11) 
