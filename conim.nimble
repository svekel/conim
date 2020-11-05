# Package

version       = "0.12.4"
author        = "Sven Keller"
description   = "Fork of Nim package manager (Nimble). Customized to handle own private projects."
license       = "BSD"

bin = @["conim"]
srcDir = "src"
skipFiles = @["nimble.nim", "nimble.nim.cfg"]

# Dependencies

requires "nim >= 0.13.0"

when defined(nimdistros):
  import distros
  if detectOs(Ubuntu):
    foreignDep "libssl-dev"
  else:
    foreignDep "openssl"

task test, "Run the Nimble tester!":
  withDir "tests":
    exec "nim c -r tester"
