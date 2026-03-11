set_version("0.0.1")

set_languages("c++23")
add_rules("mode.debug", "mode.release")
set_policy("build.c++.modules", true)

includes("utilities")

includes("@builtin/xpack")

xpack("crossbox")
    set_formats("nsis", "wix", "zip", "deb", "rpm")
    set_title("CrossBox")
    set_author("Obvodny")
    set_description("CrossBox is a collection of cross-platform UNIX(POSIX) utilities.")
    add_targets("basename", "echo", "false", "true")

