const constant: i32 = 5; // signed 32-bit constant
var variable: u32 = 5000; // unsigned 32-bit variable

// @as performs an explicit type coercion
const inferred_constant = @as(i32, 5);
var inferred_variable = @as(u32, 5000);

const std = @import("std");

pub fn main() void {
    std.debug.print("Hello, {s}!\n", .{"World"});
}


const expect = std.testing.expect;
test "undefined test" {
    // const b: u32 = undefined;
    // try expect(b != 2); // fails
    // try expect(b == 2); // fails
    // try expect((b==2) or (b != 2));// fails because using undefined
    // try expect(b == b); // also fails

    try expect(true);
}