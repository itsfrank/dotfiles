-- i hate managing my karabiner json, so we generate it instead :)
local serde = require("@lune/serde")

local function to(key: string, mods: { string }?)
    return { key_code = key, modifiers = mods }
end
local function to_cmd(cmd: string)
    return { { shell_command = cmd } }
end
local function from(key: string, mods: { string }?)
    return {
        key_code = key,
        modifiers = {
            mandatory = mods,
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

local hyper_key_mods = { "left_command", "left_control", "left_option" }
local k = {
    global = {
        show_profile_name_in_menu_bar = true,
    },
    profiles = {
        {
            name = "none",
            virtual_hid_keyboard = {
                keyboard_type_v2 = "ansi",
            },
        },
        {
            name = "main",
            selected = true,
            virtual_hid_keyboard = {
                keyboard_type_v2 = "ansi",
            },
            complex_modifications = {
                rules = {
                    make_mod(
                        "caps-lock is hyperkey",
                        from("caps_lock"),
                        to(hyper_key_mods[1], { table.unpack(hyper_key_mods, 2) })
                    ),
                    make_mod("window - fill", from("f", hyper_key_mods), to("f", { "left_control", "fn" })),
                    make_mod(
                        "hyper+q - term",
                        from("q", hyper_key_mods),
                        to_cmd("/usr/bin/open /applications/ghostty.app")
                    ),
                    make_mod(
                        "hyper+w - browser",
                        from("w", hyper_key_mods),
                        to_cmd("/usr/bin/open '/applications/Zen Browser.app'")
                    ),
                    make_mod("cmd+l - locks screen", from("l", { "command" }), to("q", { "control", "command" })),
                },
            },
        },
    },
}

print(serde.encode("json", k, true))
