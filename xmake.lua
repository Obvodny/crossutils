set_version("0.0.1")
add_rules("mode.debug", "mode.release")

includes("utilities")

includes("@builtin/xpack")

xpack("crossbox")
    set_formats("nsis", "zip", "deb", "rpm")
    set_title("CrossBox")
    set_author("Obvodny")
    add_targets("false", "true")
