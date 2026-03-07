target("echo")
    set_kind("binary")
    add_files("echo/*.cpp")
    add_tests("test_echo_0", {
        trim_output = false,
        plain = true,
        pass_outputs = "\n",
    })
    add_tests("test_echo_1", {
        runargs = "hello",
        trim_output = false,
        plain = true,
        pass_outputs = "hello\n",
    })
    add_tests("test_echo_2", {
        runargs = {"你好", "世界"},
        trim_output = false,
        plain = true,
        pass_outputs = "你好 世界\n",
    })
    add_tests("test_echo_3", {
        runargs = {"Play", "Musics:", "\a\a\a"},
        trim_output = false,
        plain = true,
        pass_outputs = "Play Musics: \a\a\a\n",
    })

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

