const expect = @import("std").testing.expect;

test "sentinel termination" {
    const terminated = [3:5]u8{ 3, 2, 1 };
    try expect(terminated.len == 3);
    try expect(@as(*const [4]u8, @ptrCast(&terminated))[3] == 5);
}

test "sentinel terminated slicing" {
    var x = [_:0]u8{255} ** 3;
    const y = x[0..3 :0];
    _ = y;
}

test "sentinel terminated slicing 2" {
    var x = [_:0]u8{255} ** 3;
    const y = x[0..2 :255];
    _ = y;
}