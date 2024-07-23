# OS-Specific Config

These Lua files contain os-specific options, functions, etc, and only one of
these is meant to be `require()`-ed in `lua/config/options.lua`, as they all
define a `Platform` table containing functions and data for that platform.

This generates "Duplicate field" warnings in Lua, but it's fine because only
one version of them will be active at a time.

The `loader.lua` contains code to guess the platform, and will `require()` the
appropriate module.
