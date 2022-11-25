# Minimal example of a CLAP plugin

Does nothing but the CLAP way :-)

## Building the plugin

```shell
git clone https://github.com/git-moss/clap-tutorials.git
cd clap-tutorials
git submodule update --init --recursive
```

For regular builds   
```shell
cmake -Bbuild -DCMAKE_BUILD_TYPE=Debug
cmake --build build --config Debug
```
The result CLAP file will be in the build folder. E.g. on Windows in `build/Debug/moss-clap.clap`.

For zig builds
```
zig build
# This assumes that your clap plugin directory is in the following `~/.clap`
zig build init
```
zig's build version does the following
1. Builds the library and renames it to `moss-clap.clap`
1. Copies the library to the clap plugin directory
