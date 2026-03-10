set_version("0.0.1")

set_languages("c++23")
add_rules("mode.debug", "mode.release")
set_policy("build.c++.modules", true)

includes("utilities")

includes("@builtin/xpack")

xpack("crossbox")
    set_formats("nsis", "zip", "deb", "rpm")
    set_title("CrossBox")
    set_author("Obvodny")
    add_targets("basename", "echo", "false", "true")

