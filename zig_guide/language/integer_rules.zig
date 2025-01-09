const expect = @import("std").testing.expect;

test "@intCast" {
    const x: u64 = 255; // will cause line 6 to error if >= 256
    const y = @as(u8, @intCast(x));
    try expect(@TypeOf(y) == u8);
    try expect(y == 255);
}

test "well defined overflow" {
    var a: u8 = 255;
    a +%= 2;
    try expect(a == 1);
}