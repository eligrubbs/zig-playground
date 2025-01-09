const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    const args = try std.process.argsAlloc(std.heap.page_allocator);
    defer std.process.argsFree(std.heap.page_allocator, args);

    if (args.len < 2) return error.ExpectedArgument;

    // Could pipe error up if I wanted to. need to add `catch |err|` and `return err;` 
    const f = std.fmt.parseFloat(f32, args[1]) catch {
        std.debug.print("Can't convert `{s}` to float. Try again with a number.\n", .{args[1]});
        return;
    };

    const c = (f - 32) * (5.0 / 9.0);
    try stdout.print("{d:.1}c\n", .{c});
}
