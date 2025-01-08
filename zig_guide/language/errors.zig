const expect = @import("std").testing.expect;

const OopsError = error{Oops};
const OopsErrorBigger = error{Oops, Bob};

fn failingFunction() OopsError!void { // can't set to Bigger cuz OopsError is subset
    return error.Oops;
}

var problems: u32 = 98;

fn failFnCounter() OopsErrorBigger!void { // can set to either OopsError or OopsErrorBigger
    errdefer problems += 1;
    try failingFunction();
}

test "errdefer" {
    failFnCounter() catch |err| {
        try expect(err == OopsError.Oops);
        try expect(problems == 99);
        return;
    };
}



const FileOpenError = error{
    AccessDenied,
    OutOfMemory,
    FileNotFound,
};
const AllocationError = error{OutOfMemory};

test "error union" {
    const maybe_error: AllocationError!u16 = 10;
    const no_error = maybe_error catch 0;

    try expect(@TypeOf(no_error) == u16);
    try expect(no_error == 10);
}