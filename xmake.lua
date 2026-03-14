set_version("0.0.1")

set_languages("c++23")
add_rules("mode.debug", "mode.release")
set_policy("build.c++.modules", true)

target("common")
    set_kind("static")
    add_files("common/*.cpp")
    add_files("common/*.mpp", {public = true})

includes("utilities")

includes("@builtin/xpack")

xpack("Crossutils")
    set_formats("nsis", "wix", "zip", "deb", "rpm")
    set_title("Crossutils")
    set_author("Obvodny")
    set_description("Crossutils is a collection of cross-platform UNIX (POSIX) utilities.")
    add_targets("basename", "echo", "false", "true")

