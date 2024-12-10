local serde = require("@lune/serde")

local hyper_key_mods = { "left_shift", "left_command", "left_control", "left_option" }

local function from(key: string, mods: { string }?)
    return {
        key_code = key,
        modifiers = {
            mandatory = mods,
        },
    }
end
local function to(key: string, mods: { string }?)
    return {
        key_code = key,
        modifiers = mods,
    }
end
local function to_cmd(cmd: string)
    return {
        {
            shell_command = cmd,
        },
    }
end
local function make_mod(desc: string, from, to)
    return {
        description = desc,
        manipulators = {
            { from = from, to = to, type = "basic" },
        },
    }
end

local k = {
    global = {
        show_profile_name_in_menu_bar = true,
    },
    profiles = {
        { name = "none" },
        {
            name = "main",
            selected = true,
            complex_modifications = {
                rules = {
                    make_mod(
                        "caps-lock is hyperkey",
                        from("caps_lock"),
                        to("left_shift", { "left_command", "left_control", "left_option" })
                    ),
                    make_mod("window - fill", from("f", hyper_key_mods), to("f", { "left_control", "fn" })),
                    make_mod(
                        "hyper+1 - term",
                        from("1", hyper_key_mods),
                        to_cmd("/usr/bin/open /applications/wezterm.app")
                    ),
                    make_mod(
                        "hyper+2 - browser",
                        from("2", hyper_key_mods),
                        to_cmd("/usr/bin/open '/applications/Zen Browser.app'")
                    ),
                },
            },
        },
    },
}

print(serde.encode("json", k, true))
