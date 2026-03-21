target("basename")
    set_kind("binary")
    add_deps("common")
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
    add_tests("test_basename_trailing_separator_1", {
        runargs = "c///",
        trim_output = false,
        plain = true,
        pass_outputs = "c\n",
    })
    add_tests("test_basename_trailing_separator_2", {
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
    add_tests("test_basename_match_all", {
        runargs = {"./compiler/analyzer.cpp///", "analyzer.cpp"},
        trim_output = false,
        plain = true,
        pass_outputs = "analyzer.cpp\n",
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

target("dirname")
    set_kind("binary")
    add_deps("common")
    add_files("dirname/*.cpp")
    add_tests("test_dirname_0", {
        trim_output = false,
        plain = true,
        should_fail = true,
    })
    add_tests("test_dirname_null", {
        runargs = "",
        trim_output = false,
        plain = true,
        pass_outputs = ".\n",
    })
    add_tests("test_dirname_all_separator_1", {
        runargs = "/",
        trim_output = false,
        plain = true,
        pass_outputs = {"/\n", "\\\n"},
    })
    add_tests("test_dirname_all_separator_2", {
        runargs = "//",
        trim_output = false,
        plain = true,
        pass_outputs = {"/\n", "\\\n"},
    })
    add_tests("test_dirname_all_separator_3", {
        runargs = "///",
        trim_output = false,
        plain = true,
        pass_outputs = {"/\n", "\\\n"},
    })
    add_tests("test_dirname_1", {
        runargs = "abc",
        trim_output = false,
        plain = true,
        pass_outputs = ".\n",
    })
    add_tests("test_dirname_1_trailing_separator_1", {
        runargs = "abc/",
        trim_output = false,
        plain = true,
        pass_outputs = ".\n",
    })
    add_tests("test_dirname_1_trailing_separator_2", {
        runargs = "abc//",
        trim_output = false,
        plain = true,
        pass_outputs = ".\n",
    })
    add_tests("test_dirname_1_trailing_separator_3", {
        runargs = "abc///",
        trim_output = false,
        plain = true,
        pass_outputs = ".\n",
    })
    add_tests("test_dirname_2", {
        runargs = "数据处理/0321",
        trim_output = false,
        plain = true,
        pass_outputs = "数据处理\n",
    })
    add_tests("test_dirname_2_trailing_separator_1", {
        runargs = "数据处理/0321/",
        trim_output = false,
        plain = true,
        pass_outputs = "数据处理\n",
    })
    add_tests("test_dirname_2_trailing_separator_2", {
        runargs = "数据处理/0321//",
        trim_output = false,
        plain = true,
        pass_outputs = "数据处理\n",
    })
    add_tests("test_dirname_2_trailing_separator_3", {
        runargs = "数据处理/0321///",
        trim_output = false,
        plain = true,
        pass_outputs = "数据处理\n",
    })
    add_tests("test_dirname_2_middle_separator_2", {
        runargs = "music//Music_Beethoven.mp3",
        trim_output = false,
        plain = true,
        pass_outputs = "music\n",
    })
    add_tests("test_dirname_2_middle_separator_3", {
        runargs = "music///Music_Beethoven.mp3",
        trim_output = false,
        plain = true,
        pass_outputs = "music\n",
    })
    add_tests("test_dirname_2_middle_trailing_separator", {
        runargs = "music///Music_Beethoven.mp3///",
        trim_output = false,
        plain = true,
        pass_outputs = "music\n",
    })
    add_tests("test_dirname_3", {
        runargs = "c:/music/Music_Beethoven.mp3",
        trim_output = false,
        plain = true,
        pass_outputs = "c:/music\n",
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

