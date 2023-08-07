const std = @import("std");
const micro = @import("../deps/microzig/build.zig");
const Chip = micro.Chip;
const MemoryRegion = micro.MemoryRegion;

fn root_dir() []const u8 {
    return std.fs.path.dirname(@src().file) orelse ".";
}

pub const fe310 = Chip.from_standard_paths(root_dir(), .{
    .name = "FE310-G002",
    .cpu = micro.cpus.riscv32_imac,
    .memory_regions = &.{
        MemoryRegion{ .offset = 0x2001_0000, .length = 0x6A120, .kind = .flash },
        MemoryRegion{ .offset = 0x8000_0000, .length = 0x4000, .kind = .ram }, // 4k
        MemoryRegion{ .offset = 0x0800_0000, .length = 0x2000, .kind = .{ .custom = .{ .name = "itim", .executable = true, .readable = true, .writeable = true } } },
    },
});
