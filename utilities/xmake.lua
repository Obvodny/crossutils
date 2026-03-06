target("false")
    set_kind("binary")
    add_files("false/*.cpp")
    add_tests("test_false", {
        should_fail = true
    })

target("true")
    set_kind("binary")
    add_files("true/*.cpp")
    add_tests("test_true")
