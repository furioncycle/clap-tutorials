const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const lib = b.addSharedLibrary("moss-clap", null, .unversioned);
    lib.linkLibC();
    lib.linkLibCpp();
    lib.addIncludePath("libs/clap/include");
    lib.addCSourceFiles(&.{"src/moss-main.c"}, &.{ "-Wall", "-W" });
    lib.setBuildMode(mode);
    lib.install();

    const libInit = b.step("init", "Install clap to clap directory");
    const install_clap = b.addSystemCommand(&[_][]const u8{ "cp", b.getInstallPath(.{ .lib = {} }, "libmoss-clap.so"), "./zig-out/lib/moss-clap.clap" });
    libInit.dependOn(&install_clap.step);
    libInit.dependOn(&lib.step);
}
