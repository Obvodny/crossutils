target("basename")
    set_kind("binary")
    add_files("basename/*.cpp")
    add_tests("test_basename_0", {
        trim_output = false,
        plain = true,
        should_fail = true,
    })
    add_tests("test_basename_null", {
        runargs = "",
        trim_output = false,
        plain = true,
        pass_outputs = "\n",
    })
    add_tests("test_basename_all_separator_1", {
        runargs = "/",
        trim_output = false,
        plain = true,
        pass_outputs = {"/\n", "\\\n"},
    })
    add_tests("test_basename_all_separator_2", {
        runargs = "//",
        trim_output = false,
        plain = true,
        pass_outputs = {"/\n", "\\\n"},
    })
    add_tests("test_basename_all_separator_3", {
        runargs = "///",
        trim_output = false,
        plain = true,
        pass_outputs = {"/\n", "\\\n"},
    })
    add_tests("test_basename_trailing_separator", {
        runargs = "c:/abc///",
        trim_output = false,
        plain = true,
        pass_outputs = "abc\n",
    })
    add_tests("test_basename_match", {
        runargs = {"c:/数据处理abc2.txt///", ".txt"},
        trim_output = false,
        plain = true,
        pass_outputs = "数据处理abc2\n",
    })
    add_tests("test_basename_not_match_0", {
        runargs = {"c:/Music_Beethoven.mp3///", ".md"},
        trim_output = false,
        plain = true,
        pass_outputs = "Music_Beethoven.mp3\n",
    })
    add_tests("test_basename_not_match_2", {
        runargs = {"c:/Music_Beethoven.mp3///", ".sp3"},
        trim_output = false,
        plain = true,
        pass_outputs = "Music_Beethoven.mp3\n",
    })


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

