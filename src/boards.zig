const std = @import("std");
const micro = @import("../deps/microzig/build.zig");
const Board = micro.Board;
const chips = @import("chips.zig");

fn root_dir() []const u8 {
    return std.fs.path.dirname(@src().file) orelse ".";
}

pub const redv = Board{
    .name = "SparkFun RED-V",
    .source = .{ .path = root_dir() ++ "/boards/sparkfun-redv.zig" },
    .chip = chips.fe310,
};
