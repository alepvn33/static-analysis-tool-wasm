(module
    (func $foo (result i32)
        i32.const 5
    )

    (func $f (local $loc i32)
        call $foo
        local.set $loc
    )

    (start $f)
)