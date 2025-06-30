-- i hate managing my karabiner json, so we generate it instead :)
local serde = require("@lune/serde")
local process = require("@lune/process")

local is_work_laptop = process.env["IS_WORK_LAPTOP"] == "true"
local app_browser = "'/applications/Zen.app'"
local app_terminal = "/applications/ghostty.app"
local app_chat = "/applications/Slack.app"

if is_work_laptop then
    app_browser = "/applications/Arc.app"
    app_terminal = "/applications/WezTerm.app"
end

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
local hyper_key_shift_mods = { "left_shift", "left_command", "left_control", "left_option" }

local main_rules = {
    make_mod("caps-lock is hyperkey", from("caps_lock"), to(hyper_key_mods[1], { table.unpack(hyper_key_mods, 2) })),
    make_mod("caps-lock+shift is hyperkey+shft", from("caps_lock", { "left_shift" }), to("left_shift", hyper_key_mods)),
    make_mod("hyper+q - term", from("q", hyper_key_mods), to_cmd(`/usr/bin/open {app_terminal}`)),
    make_mod(
        "hyper+shift+q - term (new window)",
        from("q", hyper_key_shift_mods),
        to_cmd(`/usr/bin/open -n {app_terminal}`)
    ),
    make_mod("hyper+w - browser", from("w", hyper_key_mods), to_cmd(`/usr/bin/open {app_browser}`)),
    make_mod(
        "hyper+shift+w - browser (new window)",
        from("w", hyper_key_shift_mods),
        to_cmd(`/usr/bin/open -n {app_browser}`)
    ),
    make_mod("cmd+l - locks screen", from("l", { "command" }), to("q", { "control", "command" })),
    make_mod("window - fill", from("f", hyper_key_mods), to("f", { "left_control", "fn" })),
}

if is_work_laptop then
    table.insert(main_rules, make_mod("hyper+e - chat", from("e", hyper_key_mods), to_cmd(`/usr/bin/open {app_chat}`)))
end

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
                rules = main_rules,
            },

            -- tofu 65
            devices = {
                {
                    identifiers = {
                        is_keyboard = true,
                        is_pointing_device = true,
                        product_id = 5158,
                        vendor_id = 17498,
                    },
                    ignore = false,
                },
            },
        },
    },
}

print(serde.encode("json", k, true))
