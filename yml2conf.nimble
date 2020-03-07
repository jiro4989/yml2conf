# Package

version       = "0.1.0"
author        = "jiro4989"
description   = "A config file generator with yaml."
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["yml2conf"]



# Dependencies

requires "nim >= 1.0.6"
requires "yaml >= 0.12.0"
