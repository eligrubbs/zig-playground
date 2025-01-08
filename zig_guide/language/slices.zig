const expect = @import("std").testing.expect;

fn total(values: []const u8) usize {
    var sum: usize = 0;
    for (values) |v| sum += v;
    return sum;
}

test "slices" {
    const array = [_]u8{ 1, 2, 3, 4, 5 };
    const slice = array[0..3];
    try expect(total(slice) == 6);
}


test "slice coerces to pointer when start and end of slice known" {
    const array = [_]u8{ 1, 2, 3, 4, 5 };
    const slice = array[0..3];
    try expect(@TypeOf(slice) == *const [3]u8);
}


test "can slice at end" {
    var array: [5]u8 = [_]u8{ 1, 2, 3, 4, 5 };
    const slice: *const [5]u8 = array[0..];
    try expect(@TypeOf(slice) == *const [5]u8); // fails if I get rid of any or all of slice's annotation
}