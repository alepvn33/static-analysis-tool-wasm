(module
    (func $start
        block
            i32.const 42
            i64.const 1337
            i32.const 1
            br_if 0
            ;; the drops below are implicit when br_if branches out of the block
            drop
            drop
        end
    )
  (start $start))
