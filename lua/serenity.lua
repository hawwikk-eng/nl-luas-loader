local l_mui_0 = require("neverlose/mui");
local l_liberia_0 = require("neverlose/liberia");
local l_smooth_0 = require("neverlose/smooth");
local l_clipboard_0 = require("neverlose/clipboard");
local l_lambotruck_0 = require("neverlose/lambotruck");
local l_system_0 = require("neverlose/dragging_system");
local l_monylinear_0 = require("neverlose/monylinear");
require("neverlose/extended_events");
local l_print_0 = require("neverlose/print");
l_print_0({
    inspect = true, 
    prefix = l_mui_0.header("!h<FF8080FF>[serenity.lua]!d ")
});
files.create_folder("nl\\Serenity");
if not pcall(function()
    -- upvalues: l_liberia_0 (ref)
    l_liberia_0.file_system.download_file("https://vh488226.eurodir.ru/serenity/Logo.png", "nl\\Serenity\\LogoFull.png", 5);
    l_liberia_0.file_system.download_file("https://vh488226.eurodir.ru/serenity/Logo_Small.png", "nl\\Serenity\\LogoSmall.png", 5);
    l_liberia_0.file_system.download_file("https://vh488226.eurodir.ru/serenity/Branch.png", "nl\\Serenity\\Branch.png", 5);
    l_liberia_0.file_system.download_file("https://vh488226.eurodir.ru/serenity/Leaflet.png", "nl\\Serenity\\Leaflet.png", 5);
    render.load_image_from_file("nl\\Serenity\\LogoFull.png", vector(1024, 1024));
end) then
    local error_font = render.load_font("Calibri", 12, "abod");
    cvar.clear:call();
    print_raw("\n");
    l_print_0("An unexpected error occurred while downloading the necessary components.");
    l_print_0("To correct this error, follow the instructions below:");
    l_print_0(" 1. Download the 'rar' archive with the necessary components from Discord:");
    l_print_0("     \aFF8080FFhttps://cdn.discordapp.com/attachments/1168745920473595925/1168745950123151370/Serenity.rar\aDEFAULT");
    l_print_0(" 2. Extract all images from the archive to the following directory: '...\\Counter-Strike Global Offensive\\nl\\Serenity'.");
    l_print_0(" 3. Restart the script.");
    l_print_0(" note: If this still does not work, join our discord and open a ticket and we will send you the required files.");
    print_raw("\n");
    events.render(function()
        -- upvalues: error_font (ref)
        for line_index = 1, 10 do
            render.text(error_font, vector(5, 5 + 14 * (line_index - 1)), color(), nil, "\aFF8080FF[serenity.lua]\aDEFAULT | \aB90000FFfailed to load file\aDEFAULT | An unexpected error occurred while downloading the necessary components. Please open the game console.");
        end;
    end);
    return;
else
    local serenity_logo_image = render.load_image_from_file("nl\\Serenity\\LogoFull.png", vector(1024, 1024));
    local serenity_config_db = db.serenity_recode;
    if not serenity_config_db then
        db.serenity_recode = {
            configs = {}
        };
        serenity_config_db = db.serenity_recode;
    end;
    local serenity_metadata = {
        username = common.get_username(), 
        screen = render.screen_size(), 
        update = "31.10.2023", 
        build = "Live", 
        conditions = {
            [1] = "Global / N", 
            [2] = "Global / CT", 
            [3] = "Global / T", 
            [4] = "Standing / N", 
            [5] = "Standing / CT", 
            [6] = "Standing / T", 
            [7] = "Moving / N", 
            [8] = "Moving / CT", 
            [9] = "Moving / T", 
            [10] = "Slow Move / N", 
            [11] = "Slow Move / CT", 
            [12] = "Slow Move / T", 
            [13] = "Crouch / N", 
            [14] = "Crouch / CT", 
            [15] = "Crouch / T", 
            [16] = "Crouch Move / N", 
            [17] = "Crouch Move / CT", 
            [18] = "Crouch Move / T", 
            [19] = "In Air / N", 
            [20] = "In Air / CT", 
            [21] = "In Air / T", 
            [22] = "Air Crouch / N", 
            [23] = "Air Crouch / CT", 
            [24] = "Air Crouch / T"
        }, 
        default_cvars = {
            viewmodel = {
                FOV = cvar.viewmodel_fov:float(), 
                x = cvar.viewmodel_offset_x:float(), 
                y = cvar.viewmodel_offset_y:float(), 
                z = cvar.viewmodel_offset_z:float()
            }, 
            aspectratio = cvar.r_aspectratio:float()
        }, 
        aspect_ratio = {
            [1] = {
                [1] = 16, 
                [2] = 9
            }, 
            [2] = {
                [1] = 16, 
                [2] = 10
            }, 
            [3] = {
                [1] = 4, 
                [2] = 3
            }, 
            [4] = {
                [1] = 2, 
                [2] = 3
            }
        }, 
        center = function(input_text, total_padding)
            if not total_padding then
                total_padding = 10;
            end;
            return string.rep(" ", math.floor(total_padding * 0.5)) .. input_text .. string.rep(" ", math.ceil(total_padding * 0.5));
        end, 
        split = function(input_string, delimiter)
            if not delimiter then
                delimiter = "%s";
            end;
            local split_result = {};
            for token in string.gmatch(input_string, "([^" .. delimiter .. "]+)") do
                table.insert(split_result, token);
            end;
            return split_result;
        end, 
        percentage = function(t, color_a, color_b)
            local r_interp = color_a.r * t + color_b.r * (1 - t);
            local g_interp = color_a.g * t + color_b.g * (1 - t);
            local b_interp = color_a.b * t + color_b.b * (1 - t);
            return color(r_interp, g_interp, b_interp, 255);
        end, 
        vector2angle = function(input_vector)
            local hypotenuse = 0;
            local yaw_angle = 0;
            local pitch_angle = 0;
            if input_vector.y == 0 and input_vector.x == 0 then
                yaw_angle = 0;
                if input_vector.z > 0 then
                    Pitch = 270;
                else
                    Pitch = 90;
                end;
            else
                yaw_angle = math.atan2(input_vector.y, input_vector.x) * 180 / math.pi;
                if yaw_angle < 0 then
                    yaw_angle = yaw_angle + 360;
                end;
                hypotenuse = math.sqrt(input_vector.x * input_vector.x + input_vector.y * input_vector.y);
                pitch_angle = math.atan2(-input_vector.z, hypotenuse) * 180 / math.pi;
                if pitch_angle < 0 then
                    pitch_angle = pitch_angle + 360;
                end;
            end;
            return vector(pitch_angle, yaw_angle, 0);
        end, 
        deg2rad = function(degrees)
            return degrees * (math.pi / 180);
        end
    };
    serenity_metadata.angle2vector = function(angle)
        -- upvalues: serenity_metadata (ref)
        local direction_vector = vector(0, 0, 0);
        local cos_pitch = math.cos(serenity_metadata.deg2rad(angle.x));
        local sin_pitch = math.sin(serenity_metadata.deg2rad(angle.x));
        local cos_yaw = math.cos(serenity_metadata.deg2rad(angle.y));
        local sin_yaw = math.sin(serenity_metadata.deg2rad(angle.y));
        local _ = math.cos(serenity_metadata.deg2rad(angle.z));
        local _ = math.sin(serenity_metadata.deg2rad(angle.z));
        direction_vector.x = cos_pitch * cos_yaw;
        direction_vector.y = cos_pitch * sin_yaw;
        direction_vector.z = -sin_pitch;
        return direction_vector;
    end;
    serenity_metadata.get_edge = function(start_pos, max_fraction, yaw_settings)
        -- upvalues: serenity_metadata (ref)
        local edge_hits = {};
        local camera_angles = render.camera_angles();
        local eye_angles = camera_angles or vector(0, 0, 0);
        local yaw_config = {
            yaw = yaw_settings and yaw_settings[1] or 180, 
            step = yaw_settings and yaw_settings[2] or 10
        };
        for test_yaw = camera_angles.y - yaw_config.yaw, camera_angles.y + yaw_config.yaw, yaw_config.step do
            test_yaw = math.normalize_yaw(test_yaw);
            local angle_vector = vector(0, test_yaw, 0);
            local trace_end = start_pos + serenity_metadata.angle2vector(angle_vector) * 64;
            local trace_result = utils.trace_line(start_pos, trace_end, lp, 33570827, 0);
            if trace_result.entity and (trace_result.entity:get_classname() == "CWorld" or trace_result.entity:get_classname() == "CBaseDoor") and trace_result.fraction <= max_fraction then
                edge_hits[#edge_hits + 1] = {
                    vec_trace_end = trace_result.end_pos, 
                    yaw_o = test_yaw, 
                    fract = trace_result.fraction
                };
            end;
        end;
        table.sort(edge_hits, function(edge_a, edge_b)
            return edge_a.yaw_o < edge_b.yaw_o;
        end);
        local final_yaw = nil;
        if #edge_hits >= 2 then
            local mid_point = edge_hits[1].vec_trace_end:lerp(edge_hits[#edge_hits].vec_trace_end, 0.5);
            final_yaw = serenity_metadata.vector2angle(start_pos - mid_point);
        end;
        return edge_hits, camera_angles, eye_angles, final_yaw;
    end;
    serenity_metadata.calc_angle = function(from_pos, to_pos)
        local angle_result = vector(0, 0, 0);
        local delta = vector(from_pos.x - to_pos.x, from_pos.y - to_pos.y, from_pos.z - to_pos.z);
        local distance_2d = math.sqrt(delta.x * delta.x + delta.y * delta.y);
        angle_result.x = math.atan(delta.z / distance_2d) * (180 / math.pi);
        angle_result.y = math.atan(delta.y / delta.x) * (180 / math.pi);
        angle_result.z = 0;
        if delta.x >= 0 then
            angle_result.y = angle_result.y + 180;
        end;
        return angle_result;
    end;
    serenity_metadata.to_console = function(console_text)
        -- upvalues: l_mui_0 (ref)
        return l_mui_0.header(console_text);
    end;
    local game_state = {
        lp = {}
    };
    game_state.lp.self = entity.get_local_player();
    game_state.lp.team = {
        name = "N", 
        index = -1
    };
    game_state.lp.ping = {
        real = 0, 
        incoming = 0
    };
    game_state.gears = {};
    local ui_references = {
        rage_bot = {
            Enabled = {
                dormant_aimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot")
            }, 
            ["Peek Assist"] = {
                self = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
                retreat = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode")
            }, 
            ["Double Tap"] = {
                self = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
                options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options")
            }, 
            ["Hide Shots"] = {
                self = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
                options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
            }, 
            ["Safe Points"] = {
                self = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points")
            }, 
            ["Body Aim"] = {
                self = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim")
            }
        }, 
        anti_aim = {
            ["Fake Lag"] = {
                self = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
                limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
                variability = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability")
            }, 
            Misc = {
                ["Fake Duck"] = {
                    self = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck")
                }
            }
        }, 
        world = {
            ["Override Zoom"] = {
                overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
            }
        }, 
        main = {
            ["Fake Latency"] = {
                self = ui.find("Miscellaneous", "Main", "Other", "Fake Latency")
            }, 
            Other = {
                weapon_action = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions")
            }
        }
    };
    local menu = {
        tabs = {
            home = {
                logotype = l_mui_0.create("!h<{Link Active}>!i<house>!d", "\n1", 1), 
                selected = l_mui_0.create("!h<{Link Active}>!i<house>!d", "\n2", 2), 
                informations = l_mui_0.create("!h<{Link Active}>!i<house>!d", "\n3", 2), 
                informations_2 = l_mui_0.create("!h<{Link Active}>!i<house>!d", "\n3.5", 1), 
                recommendations = l_mui_0.create("!h<{Link Active}>!i<house>!d", "\n4", 2), 
                configurations = l_mui_0.create("!h<{Link Active}>!i<house>!d", "\n5", 1), 
                configurations_2 = l_mui_0.create("!h<{Link Active}>!i<house>!d", "\n5.5", 2)
            }, 
            ["anti aim"] = {
                settings = l_mui_0.create("!h<{Link Active}>!i<rotate>!d", "\n1", 1), 
                settings_2 = l_mui_0.create("!h<{Link Active}>!i<rotate>!d", "\n1.33", 1), 
                settings_3 = l_mui_0.create("!h<{Link Active}>!i<rotate>!d", "\n1.66", 1), 
                builder = l_mui_0.create("!h<{Link Active}>!i<rotate>!d", "\n2", 2)
            }, 
            settings = {
                select = l_mui_0.create("!h<{Link Active}>!i<gear>!d", "\nSelect", 1), 
                misc_3 = l_mui_0.create("!h<{Link Active}>!i<gear>!d", "\nMisc 3", 2), 
                visuals = l_mui_0.create("!h<{Link Active}>!i<gear>!d", "\nVisuals 1", 2), 
                visuals_2 = l_mui_0.create("!h<{Link Active}>!i<gear>!d", "\nVisuals 2", 1), 
                misc = l_mui_0.create("!h<{Link Active}>!i<gear>!d", "\nMisc 1", 2), 
                misc_2 = l_mui_0.create("!h<{Link Active}>!i<gear>!d", "\nMisc 2", 1), 
                misc_4 = l_mui_0.create("!h<{Link Active}>!i<gear>!d", "\nMisc 4", 1)
            }
        }
    };
    menu.home = {
        logo = l_mui_0.texture(menu.tabs.home.logotype, serenity_logo_image, vector(270, 288), ui.get_style("Link Active")), 
        select = l_mui_0.table(menu.tabs.home.selected, "\n", {
            l_mui_0.header("!h<!s<Link Active>>!i<caret-right>!d  Informations"), 
            l_mui_0.header("!h<!s<Link Active>>!i<caret-right>!d  Recommendations"), 
            l_mui_0.header("!h<!s<Link Active>>!i<caret-right>!d  Configurations")
        }), 
        username = l_mui_0.text(menu.tabs.home.informations, ("!h<!s<Link Active>>!i<user>!d  Username: !h<!s<Link Active>>%s!d"):format(serenity_metadata.username)), 
        last_update = l_mui_0.text(menu.tabs.home.informations, ("!h<!s<Link Active>>!i<clock>!d  Last Update: !h<!s<Link Active>>%s!d"):format(serenity_metadata.update)), 
        current_build = l_mui_0.text(menu.tabs.home.informations, ("!h<!s<Link Active>>!i<block-brick>!d  Current Build: !h<!s<Link Active>>%s!d"):format(serenity_metadata.build)), 
        sidebar = l_mui_0.combo(menu.tabs.home.informations_2, "!h<!s<Link Active>>!i<bars>!d  Sidebar Style", {
            [1] = "Modern", 
            [2] = "Twinkle", 
            [3] = "Default", 
            [4] = "Static"
        }), 
        discord = l_mui_0.button(menu.tabs.home.recommendations, ("!mt<1>!h<!s<Link Active>>!i<discord>!d%s!d"):format(serenity_metadata.center("Discord", 10)), true, function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/V9KZZvMqzs");
        end), 
        youTube = l_mui_0.button(menu.tabs.home.recommendations, ("!mt<1>!h<!s<Link Active>>!i<youtube>!d%s!d"):format(serenity_metadata.center("YouTube", 17)), true, function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/@murfs");
        end), 
        config = l_mui_0.button(menu.tabs.home.recommendations, ("!mt<1>!h<!s<Link Active>>!i<link>!d%s!d"):format(serenity_metadata.center("Config", 12)), true, function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://en.neverlose.cc/market/?page=0&search=author:murfyy&sort=drec0&type=0&filter=0");
        end), 
        version = l_mui_0.button(menu.tabs.home.recommendations, ("!mt<1>!h<!s<Link Active>>!i<cart-shopping>!d%s!d"):format(serenity_metadata.center("Marketplace", 10)), true, function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://en.neverlose.cc/market/?page=0&search=author:%20murfyy&sort=drec0&type=2&filter=0");
        end), 
        name = l_mui_0.text_box(menu.tabs.home.configurations, "", ""), 
        save = l_mui_0.button(menu.tabs.home.configurations, serenity_metadata.center("!h<!s<Link Active>>!i<upload>!d  Save", 10), true), 
        export = l_mui_0.button(menu.tabs.home.configurations, serenity_metadata.center("!h<!s<Link Active>>!i<file-export>!d  Export", 4), true), 
        import = l_mui_0.button(menu.tabs.home.configurations, serenity_metadata.center("!h<!s<Link Active>>!i<file-import>!d  Import", 3), true), 
        list = l_mui_0.table(menu.tabs.home.configurations_2, "", {
            [1] = "~"
        }), 
        load = l_mui_0.button(menu.tabs.home.configurations_2, serenity_metadata.center("!h<!s<Link Active>>!i<download>!d  Load", 22), true), 
        remove = l_mui_0.button(menu.tabs.home.configurations_2, serenity_metadata.center("!h<!s<Link Active>>!i<trash>!d  Remove", 19), true)
    };
    menu["anti aim"] = {
        type = l_mui_0.table(menu.tabs["anti aim"].settings, "\n", {
            l_mui_0.header("!h<!s<Link Active>>!i<caret-right>!d  Disabled"), 
            l_mui_0.header("!h<!s<Link Active>>!i<caret-right>!d  Normal"), 
            l_mui_0.header("!h<!s<Link Active>>!i<caret-right>!d  Teams")
        }), 
        manual = l_mui_0.combo(menu.tabs["anti aim"].settings_2, "Manual Yaw", {
            [1] = "Disabled", 
            [2] = "At Target", 
            [3] = "Backward", 
            [4] = "Forward", 
            [5] = "Left", 
            [6] = "Right"
        }, function(parent_ui_element)
            -- upvalues: l_mui_0 (ref)
            return {
                static = l_mui_0.switch(parent_ui_element, "Static Manual", false), 
                magnet = l_mui_0.hotkey(parent_ui_element, "Magnetize", 0)
            };
        end), 
        tweaks = l_mui_0.multi_combo(menu.tabs["anti aim"].settings_2, "Tweaks", {
            [1] = "AA on Use", 
            [2] = "Edge Yaw", 
            [3] = "Avoid Backstab", 
            [4] = "Fast Ladder", 
            [5] = "Auto Teleport"
        }, function(ui_container)
            -- upvalues: l_mui_0 (ref)
            return {
                edge_yaw = l_mui_0.combo(ui_container, "Edge Yaw", {
                    [1] = "Always On", 
                    [2] = "On Fake Duck"
                }), 
                weapon = l_mui_0.multi_combo(ui_container, "[TP] Weapon", {
                    [1] = "Pistols", 
                    [2] = "Auto Snipers", 
                    [3] = "AWP", 
                    [4] = "SSG-08", 
                    [5] = "Heavy Pistols", 
                    [6] = "Knife / Taser"
                }), 
                delay = l_mui_0.slider(ui_container, "[TP] Delay", 0, 0, 24, 1, nil, function(delay_value)
                    if delay_value == 0 then
                        return "Off";
                    else
                        return ("%st"):format(delay_value);
                    end;
                end), 
                in_air = l_mui_0.switch(ui_container, "[TP] Only in Air", false)
            };
        end), 
        safe = l_mui_0.multi_combo(menu.tabs["anti aim"].settings_2, "Safe Head", {
            [1] = "Knife & Air Crouch", 
            [2] = "Enemy Below"
        }), 
        freestanding = l_mui_0.switch(menu.tabs["anti aim"].settings_2, "Freestanding", false, function(freestanding_ui_element)
            -- upvalues: l_mui_0 (ref)
            return {
                disablers = l_mui_0.multi_combo(freestanding_ui_element, "Disablers", {
                    [1] = "Manual", 
                    [2] = "Standing", 
                    [3] = "Moving", 
                    [4] = "Slow Move", 
                    [5] = "Crouch", 
                    [6] = "In Air"
                }), 
                DYM = l_mui_0.switch(freestanding_ui_element, "Disabled Yaw Modifier", false), 
                BF = l_mui_0.switch(freestanding_ui_element, "Body Freestanding", false)
            };
        end), 
        animations = l_mui_0.switch(menu.tabs["anti aim"].settings_2, "\aDE9B37FFAnim. Breakers", false, function(animations_ui_element)
            -- upvalues: l_mui_0 (ref)
            return {
                select = l_mui_0.multi_combo(animations_ui_element, "Select", {
                    [1] = "0 Pitch on Land", 
                    [2] = "Legs on Landing", 
                    [3] = "Legs in Air", 
                    [4] = "Body Lean"
                }), 
                landing = l_mui_0.combo(animations_ui_element, "Legs on Landing", {
                    [1] = "Static", 
                    [2] = "Backward", 
                    [3] = "Switch", 
                    [4] = "Shivering", 
                    [5] = "Moonwalk"
                }), 
                air = l_mui_0.combo(animations_ui_element, "Legs in Air", {
                    [1] = "Static", 
                    [2] = "Moonwalk"
                }), 
                lean = l_mui_0.slider(animations_ui_element, "Body Lean", 0, 0, 100, 1, nil, function(lean_value)
                    if lean_value == 0 then
                        return "Off";
                    else
                        return ("%s%%"):format(lean_value);
                    end;
                end)
            };
        end), 
        export = l_mui_0.button(menu.tabs["anti aim"].settings_3, ("!mt<1>!h<!s<Link Active>>!i<file-export>!d%s!d"):format(serenity_metadata.center("Export", 18)), true), 
        import = l_mui_0.button(menu.tabs["anti aim"].settings_3, ("!mt<1>!h<!s<Link Active>>!i<file-import>!d%s!d"):format(serenity_metadata.center("Import", 18)), true), 
        send = l_mui_0.button(menu.tabs["anti aim"].settings_3, ("  !h<!s<Link Active>>!i<share-nodes>!d%s!d"):format(serenity_metadata.center("Copy Condition to Opposing Team", 10)), true), 
        condition = l_mui_0.combo(menu.tabs["anti aim"].builder, "Condition", {
            [1] = "Global", 
            [2] = "Standing", 
            [3] = "Moving", 
            [4] = "Slow Move", 
            [5] = "Crouch", 
            [6] = "Crouch Move", 
            [7] = "In Air", 
            [8] = "Air Crouch"
        }), 
        team = l_mui_0.combo(menu.tabs["anti aim"].builder, "Team", {
            [1] = "Counter-Terrorists", 
            [2] = "Terrorists"
        })
    };
    menu.settings = {
        indicators = l_mui_0.switch(menu.tabs.settings.visuals_2, "Crosshair Indicators", false, function(indicators_ui_element)
            -- upvalues: l_mui_0 (ref)
            return {
                style = l_mui_0.combo(indicators_ui_element, "Style", {
                    [1] = "Modern", 
                    [2] = "Previous "
                }), 
                display = l_mui_0.multi_combo(indicators_ui_element, "Display", {
                    [1] = "Version", 
                    [2] = "Condition", 
                    [3] = "Binds"
                }), 
                binds = l_mui_0.multi_combo(indicators_ui_element, "Binds", {
                    [1] = "Double Tap", 
                    [2] = "Hide Shots", 
                    [3] = "Fake Duck", 
                    [4] = "Body Aim", 
                    [5] = "Freestanding"
                }), 
                additions = l_mui_0.multi_combo(indicators_ui_element, "Additions", {
                    [1] = "To Scope", 
                    [2] = "Header Glow"
                }), 
                colors = l_mui_0.color_edit(indicators_ui_element, "Colors", {
                    Header = {
                        color(255, 255, 255, 255), 
                        color(255, 255, 255, 255)
                    }, 
                    Condition = {
                        color(255, 255, 255, 255), 
                        color(255, 255, 255, 255)
                    }
                }), 
                revitalize = l_mui_0.switch(indicators_ui_element, "Revitalize", false)
            };
        end), 
        watermark = l_mui_0.combo(menu.tabs.settings.visuals_2, "Watermark", {
            [1] = "Simple", 
            [2] = "Serenity", 
            [3] = "Emoji", 
            [4] = "Anime"
        }, function(ui_element)
            -- upvalues: l_mui_0 (ref)
            return {
                position = l_mui_0.combo(ui_element, "Position", {
                    [1] = "Below", 
                    [2] = "Left", 
                    [3] = "Right"
                }), 
                type = l_mui_0.combo(ui_element, "Type", {
                    [1] = "Full", 
                    [2] = "Only Logo", 
                    [3] = "Only Text"
                }), 
                color = l_mui_0.color_edit(ui_element, "color", color(210, 166, 255, 255))
            };
        end), 
        damage = l_mui_0.switch(menu.tabs.settings.visuals_2, "Minimum Damage", false, function(damage_ui_element)
            -- upvalues: l_mui_0 (ref), serenity_metadata (ref)
            return {
                color = l_mui_0.color_edit(damage_ui_element, "Color", color(255, 255, 255, 255)), 
                show = l_mui_0.switch(damage_ui_element, "Display if Active", false), 
                x = l_mui_0.slider(damage_ui_element, "damage x", serenity_metadata.screen.x * 0.5, 0, serenity_metadata.screen.x, 1), 
                y = l_mui_0.slider(damage_ui_element, "damage y", serenity_metadata.screen.y * 0.5 - 11, 0, serenity_metadata.screen.y, 1)
            };
        end), 
        arrows = l_mui_0.switch(menu.tabs.settings.visuals_2, "Manual Arrows", false, function(arrows_ui_element)
            -- upvalues: l_mui_0 (ref)
            return {
                style = l_mui_0.combo(arrows_ui_element, "Style", {
                    [1] = "Teamskeet", 
                    [2] = "Simple"
                }), 
                display = l_mui_0.combo(arrows_ui_element, "Display", {
                    [1] = "Always On", 
                    [2] = "Only on Manual"
                }), 
                offset = l_mui_0.slider(arrows_ui_element, "Offset", 50, 15, 100, 1), 
                color = l_mui_0.color_edit(arrows_ui_element, "Color", color(255, 255, 255, 255)), 
                colors = l_mui_0.color_edit(arrows_ui_element, "Colors", {
                    Manual = {
                        color(255, 255, 255, 255)
                    }, 
                    Inveted = {
                        color(255, 255, 255, 255)
                    }
                })
            };
        end), 
        widgets = l_mui_0.switch(menu.tabs.settings.visuals_2, "Screen Widgets", false, function(widgets_ui_element)
            -- upvalues: l_mui_0 (ref), serenity_metadata (ref)
            return {
                display = l_mui_0.multi_combo(widgets_ui_element, "Displays", {
                    [1] = "Watermark", 
                    [2] = "Keybinds", 
                    [3] = "Spectators", 
                    [4] = "Velocity Warning", 
                    [5] = "Defensive Indicator"
                }), 
                style = l_mui_0.combo(widgets_ui_element, "Style", {
                    [1] = "Default", 
                    [2] = "Modern", 
                    [3] = "Simple"
                }), 
                color = l_mui_0.color_edit(widgets_ui_element, "Accent", color(255, 255, 255, 255)), 
                background = l_mui_0.color_edit(widgets_ui_element, "Background", color(20, 20, 20, 196)), 
                x_w = l_mui_0.slider(widgets_ui_element, "Watermark X", 0, 0, serenity_metadata.screen.x, 1), 
                y_w = l_mui_0.slider(widgets_ui_element, "Watermark Y", 0, 0, serenity_metadata.screen.y, 1), 
                x_k = l_mui_0.slider(widgets_ui_element, "Keybinds X", 5, 0, serenity_metadata.screen.x, 1), 
                y_k = l_mui_0.slider(widgets_ui_element, "Keybinds Y", serenity_metadata.screen.y * 0.5 + 5, 0, serenity_metadata.screen.y, 1), 
                x_s = l_mui_0.slider(widgets_ui_element, "Spectators X", 110, 0, serenity_metadata.screen.x, 1), 
                y_s = l_mui_0.slider(widgets_ui_element, "Spectators Y", serenity_metadata.screen.y * 0.5 + 5, 0, serenity_metadata.screen.y, 1), 
                x_v = l_mui_0.slider(widgets_ui_element, "Velocity Warning X", serenity_metadata.screen.x * 0.5 - 75, 0, serenity_metadata.screen.x, 1), 
                y_v = l_mui_0.slider(widgets_ui_element, "Velocity Warning Y", serenity_metadata.screen.y * 0.25 + 150, 0, serenity_metadata.screen.y, 1), 
                x_d = l_mui_0.slider(widgets_ui_element, "Defensive Indicator X", serenity_metadata.screen.x * 0.5 - 75, 0, serenity_metadata.screen.x, 1), 
                y_d = l_mui_0.slider(widgets_ui_element, "Defensive Indicator Y", serenity_metadata.screen.y * 0.25, 0, serenity_metadata.screen.y, 1)
            };
        end), 
        skeet = l_mui_0.switch(menu.tabs.settings.misc_4, "!h<95B806FF>$500!d Indicators", false, function(skeet_indicators_ui_element)
            -- upvalues: l_mui_0 (ref), serenity_metadata (ref)
            return {
                display = l_mui_0.multi_combo(skeet_indicators_ui_element, "Display", {
                    [1] = "Hit Chance", 
                    [2] = "Aimbot Stats", 
                    [3] = "Fake Latency", 
                    [4] = "Double Tap", 
                    [5] = "Hide Shots", 
                    [6] = "Dormant Aimbot", 
                    [7] = "Fake Duck", 
                    [8] = "Safe Points", 
                    [9] = "Body Aim", 
                    [10] = "Minimum Damage", 
                    [11] = "Freestanding", 
                    [12] = "Bomb Info", 
                    [13] = "Defusing"
                }), 
                spectators = l_mui_0.switch(skeet_indicators_ui_element, "Spectators", false), 
                offset = l_mui_0.slider(skeet_indicators_ui_element, "Spec. Offset", 0, 0, serenity_metadata.screen.y * 0.25, 1)
            };
        end), 
        logs = l_mui_0.switch(menu.tabs.settings.visuals, "Aimbot Logs", false, function(logs_ui_element)
            -- upvalues: l_mui_0 (ref), serenity_metadata (ref)
            return {
                select = l_mui_0.multi_combo(logs_ui_element, "Select", {
                    [1] = "Screen", 
                    [2] = "Console", 
                    [3] = "Top Left"
                }), 
                extended = l_mui_0.multi_combo(logs_ui_element, "Informative", {
                    [1] = "Console", 
                    [2] = "Top Left"
                }), 
                style = l_mui_0.combo(logs_ui_element, "Style", {
                    [1] = "Default", 
                    [2] = "Gamesense", 
                    [3] = "Modern"
                }), 
                offset = l_mui_0.slider(logs_ui_element, "Offset", 0, -(serenity_metadata.screen.x * 0.25), serenity_metadata.screen.x * 0.25, 1), 
                colors = l_mui_0.color_edit(logs_ui_element, "Colors", {
                    ["\aFFFFFF003\aDEFAULTHit"] = {
                        color(135, 178, 14, 255)
                    }, 
                    ["\aFFFFFF002\aDEFAULTMiss"] = {
                        color(238, 19, 20, 255)
                    }, 
                    ["\aFFFFFF001\aDEFAULTGlow"] = {
                        color(255, 255, 255, 125)
                    }
                })
            };
        end), 
        no_fall = l_mui_0.switch(menu.tabs.settings.visuals, "No Fall Damage", false), 
        drop_grenades = l_mui_0.switch(menu.tabs.settings.visuals, "Drop Grenades", false, function(drop_grenades_ui_element)
            -- upvalues: l_mui_0 (ref)
            return {
                bind = l_mui_0.hotkey(drop_grenades_ui_element, "Bind", 0), 
                discard = l_mui_0.multi_combo(drop_grenades_ui_element, "Drop", {
                    [1] = "High Explosive", 
                    [2] = "Molotov", 
                    [3] = "Smoke", 
                    [4] = "Flashbang"
                })
            };
        end), 
        clantag = l_mui_0.switch(menu.tabs.settings.misc_2, "Clantag", false), 
        trashtalk = l_mui_0.switch(menu.tabs.settings.misc_2, "Trashtalk", false, function(trashtalk_ui_element)
            -- upvalues: l_mui_0 (ref)
            return {
                language = l_mui_0.combo(trashtalk_ui_element, "Language", {
                    [1] = "English", 
                    [2] = "Russian"
                }), 
                delay = l_mui_0.slider(trashtalk_ui_element, "Delay", 0, 0, 99, 0.1, nil, function(tt_delay_value)
                    if tt_delay_value == 0 then
                        return "Rand";
                    else
                        return ("%ss"):format(tt_delay_value * 0.1);
                    end;
                end)
            };
        end), 
        scope = l_mui_0.switch(menu.tabs.settings.misc_2, "Custom Scope", false, function(scope_ui_element)
            -- upvalues: l_mui_0 (ref), serenity_metadata (ref)
            return {
                start = l_mui_0.slider(scope_ui_element, "Start", 8, 0, serenity_metadata.screen.x * 0.25, 1), 
                length = l_mui_0.slider(scope_ui_element, "Length", 128, 4, serenity_metadata.screen.x * 0.5, 1), 
                hidden = l_mui_0.multi_combo(scope_ui_element, "Hidden", {
                    [1] = "Up", 
                    [2] = "Down", 
                    [3] = "Left", 
                    [4] = "Right"
                }), 
                inverter = l_mui_0.switch(scope_ui_element, "Inverter", false), 
                color = l_mui_0.color_edit(scope_ui_element, "Color", color(255, 255, 255, 255))
            };
        end), 
        nade_fix = l_mui_0.switch(menu.tabs.settings.misc, "!h<DE9B37FF>Nade Fix!d", false, function(nade_fix_ui_element)
            -- upvalues: l_mui_0 (ref)
            return {
                on = l_mui_0.multi_combo(nade_fix_ui_element, "Turn On", {
                    [1] = "Lag Options", 
                    [2] = "Quick Switch"
                })
            };
        end), 
        aspect_ratio = l_mui_0.switch(menu.tabs.settings.misc, "Aspect Ratio", false, function(aspect_ratio_ui_element)
            -- upvalues: game_state (ref), l_mui_0 (ref), serenity_metadata (ref)
            game_state.gears.aspect_ratio = aspect_ratio_ui_element;
            return {
                offset = l_mui_0.slider(aspect_ratio_ui_element, "Offset", serenity_metadata.default_cvars.aspectratio * 100, 0, 300, 0.01, nil, function(slider_value)
                    -- upvalues: serenity_metadata (ref)
                    slider_value = slider_value / 100;
                    for _, ratio_pair in pairs(serenity_metadata.aspect_ratio) do
                        if slider_value == tonumber(("%.2f"):format(ratio_pair[1] / ratio_pair[2])) then
                            return ("%s:%s"):format(ratio_pair[1], ratio_pair[2]);
                        end;
                    end;
                end)
            };
        end), 
        viewmodel_changer = l_mui_0.switch(menu.tabs.settings.misc, "Viewmodel Changer", false, function(viewmodel_changer_ui_element)
            -- upvalues: l_mui_0 (ref), serenity_metadata (ref)
            return {
                FOV = l_mui_0.slider(viewmodel_changer_ui_element, "FOV", serenity_metadata.default_cvars.viewmodel.FOV * 10, -1000, 1000, 0.1), 
                x = l_mui_0.slider(viewmodel_changer_ui_element, "X", serenity_metadata.default_cvars.viewmodel.x * 10, -1500, 1500, 0.1), 
                y = l_mui_0.slider(viewmodel_changer_ui_element, "Y", serenity_metadata.default_cvars.viewmodel.y * 10, -1500, 1500, 0.1), 
                z = l_mui_0.slider(viewmodel_changer_ui_element, "Z", serenity_metadata.default_cvars.viewmodel.z * 10, -1500, 1500, 0.1), 
                reset = l_mui_0.button(viewmodel_changer_ui_element, serenity_metadata.center("!h<DE9B37FF>!i<broom>!d  Reset Settings", 33), true)
            };
        end), 
        auto_m_unm = l_mui_0.switch(menu.tabs.settings.misc, "Auto Mute / Unmute", false, function(auto_mute_unmute_ui_element)
            -- upvalues: l_mui_0 (ref)
            return {
                mode = l_mui_0.combo(auto_mute_unmute_ui_element, "Mode", {
                    [1] = "Mute", 
                    [2] = "Unmute"
                })
            };
        end), 
        radius = l_mui_0.switch(menu.tabs.settings.misc, "Grenade Radius", false, function(grenade_radius_ui_element)
            -- upvalues: l_mui_0 (ref)
            return {
                display = l_mui_0.multi_combo(grenade_radius_ui_element, "Display", {
                    [1] = "Smoke", 
                    [2] = "Molotov"
                }), 
                color_se = l_mui_0.color_edit(grenade_radius_ui_element, "Smoke", color(128, 128, 255, 128)), 
                color_ev = l_mui_0.color_edit(grenade_radius_ui_element, "Enemy Molotov", color(255, 128, 128, 255)), 
                color_tv = l_mui_0.color_edit(grenade_radius_ui_element, "Teammate's Molotov", color(128, 255, 128, 255))
            };
        end)
    };
    local settings_ui_elements = {
        widgets = menu.settings.widgets[0], 
        damage = menu.settings.damage[0], 
        aspect_ratio = game_state.gears.aspect_ratio
    };
    settings_ui_elements.widgets.x_w:visibility(false);
    settings_ui_elements.widgets.y_w:visibility(false);
    settings_ui_elements.widgets.x_k:visibility(false);
    settings_ui_elements.widgets.y_k:visibility(false);
    settings_ui_elements.widgets.x_s:visibility(false);
    settings_ui_elements.widgets.y_s:visibility(false);
    settings_ui_elements.widgets.x_v:visibility(false);
    settings_ui_elements.widgets.y_v:visibility(false);
    settings_ui_elements.widgets.x_d:visibility(false);
    settings_ui_elements.widgets.y_d:visibility(false);
    settings_ui_elements.damage.x:visibility(false);
    settings_ui_elements.damage.y:visibility(false);
    for _, ratio_pair in pairs(serenity_metadata.aspect_ratio) do
        local ratio_string = ("%s:%s"):format(ratio_pair[1], ratio_pair[2]);
        menu.settings.aspect_ratio[0][ratio_string] = l_mui_0.button(settings_ui_elements.aspect_ratio, (not (ratio_string ~= "4:3") or ratio_string == "8:11") and (" %s "):format(ratio_string) or ratio_string == "2:3" and ("  %s  "):format(ratio_string) or ratio_string or ratio_string, true);
        do
            local captured_ratio_pair = ratio_pair;
            menu.settings.aspect_ratio[0][ratio_string]:set_callback(function()
                -- upvalues: menu (ref), captured_ratio_pair (ref)
                menu.settings.aspect_ratio[0].offset:set(captured_ratio_pair[1] / captured_ratio_pair[2] * 100);
            end);
        end;
    end;
    get_team = function(player_team_name)
        -- upvalues: serenity_metadata (ref), menu (ref)
        if serenity_metadata.split(menu["anti aim"].type:list()[menu["anti aim"].type:get()], "  ")[2] == "Normal" then
            return ("%s / N"):format(player_team_name);
        else
            return ("%s / %s"):format(player_team_name, menu["anti aim"].team:get() == "Counter-Terrorists" and "CT" or "T");
        end;
    end;
    for conditionIndex = 1, #serenity_metadata.conditions do
        local conditionName = serenity_metadata.conditions[conditionIndex];
        local indentationSpacing = string.rep("", conditionIndex);
        menu["anti aim"][("%s / %s"):format(conditionName, "enable")] = l_mui_0.switch(menu.tabs["anti aim"].builder, ("%s%s"):format("Enable", indentationSpacing), false);
        menu["anti aim"][("%s / %s"):format(conditionName, "pitch")] = l_mui_0.combo(menu.tabs["anti aim"].builder, ("%s%s"):format("Pitch", indentationSpacing), {
            [1] = "Disabled", 
            [2] = "Down", 
            [3] = "Fake Up", 
            [4] = "Fake Down"
        });
        menu["anti aim"][("%s / %s"):format(conditionName, "yaw")] = l_mui_0.combo(menu.tabs["anti aim"].builder, ("%s%s"):format("Yaw", indentationSpacing), {
            [1] = "Disabled", 
            [2] = "Backward", 
            [3] = "Static", 
            [4] = "3-Way", 
            [5] = "5-Way"
        }, function(yawMenu)
            -- upvalues: l_mui_0 (ref)
            return {
                mode = l_mui_0.combo(yawMenu, "Mode", {
                    [1] = "Static", 
                    [2] = "L & R"
                }), 
                offset = l_mui_0.slider(yawMenu, "Offset", 0, -180, 180, 1, nil, "\194\176"), 
                offset_l = l_mui_0.slider(yawMenu, "Offset Left", 0, -180, 180, 1, nil, "\194\176"), 
                offset_r = l_mui_0.slider(yawMenu, "Offset Right", 0, -180, 180, 1, nil, "\194\176")
            };
        end);
        menu["anti aim"][("%s / %s"):format(conditionName, "yaw_modifier")] = l_mui_0.combo(menu.tabs["anti aim"].builder, ("%s%s"):format("Yaw Modifier", indentationSpacing), {
            [1] = "Disabled", 
            [2] = "Center", 
            [3] = "Progressive", 
            [4] = "Delay", 
            [5] = "Offset", 
            [6] = "Random", 
            [7] = "Spin", 
            [8] = "3-Way", 
            [9] = "5-Way"
        }, function(yawModifierMenu)
            -- upvalues: l_mui_0 (ref)
            return {
                mode = l_mui_0.combo(yawModifierMenu, "Mode", {
                    [1] = "Static", 
                    [2] = "L & R"
                }), 
                tick = l_mui_0.slider(yawModifierMenu, "Delay Tick", 1, 1, 16, 1, nil, function(delayTickValue)
                    return ("%st"):format(delayTickValue);
                end), 
                offset = l_mui_0.slider(yawModifierMenu, "Offset", 0, -180, 180, 1), 
                offset_l = l_mui_0.slider(yawModifierMenu, "Offset Left", 0, -180, 180, 1), 
                offset_r = l_mui_0.slider(yawModifierMenu, "Offset Right", 0, -180, 180, 1)
            };
        end);
        menu["anti aim"][("%s / %s"):format(conditionName, "body_yaw")] = l_mui_0.switch(menu.tabs["anti aim"].builder, ("%s%s"):format("Body Yaw", indentationSpacing), false, function(yawModifierSubmenu)
            -- upvalues: l_mui_0 (ref)
            return {
                mode = l_mui_0.combo(yawModifierSubmenu, "Mode", {
                    [1] = "Default", 
                    [2] = "Automatic"
                }), 
                limit_l = l_mui_0.slider(yawModifierSubmenu, "Limit Left", 60, -60, 60, 1, nil, "\194\176"), 
                limit_r = l_mui_0.slider(yawModifierSubmenu, "Limit Right", 60, -60, 60, 1, nil, "\194\176"), 
                options = l_mui_0.multi_combo(yawModifierSubmenu, "Options", {
                    [1] = "Avoid Overlap", 
                    [2] = "Jitter", 
                    [3] = "Randomize Jitter", 
                    [4] = "Anti Bruteforce"
                }), 
                delay = l_mui_0.slider(yawModifierSubmenu, "Jitter Delay", 0, 0, 100, 1, nil, function(jitterDelayValue)
                    if jitterDelayValue == 0 then
                        return "NL";
                    else
                        return ("%s%%"):format(jitterDelayValue);
                    end;
                end), 
                freestanding = l_mui_0.combo(yawModifierSubmenu, "Freestanding", {
                    [1] = "Off", 
                    [2] = "Peek Fake", 
                    [3] = "Peek Real"
                })
            };
        end);
        menu["anti aim"][("%s / %s"):format(conditionName, "defensive_aa")] = l_mui_0.switch(menu.tabs["anti aim"].builder, ("%s%s"):format("!h<DE9B37FF>Defensive Options", indentationSpacing), false, function(defensiveAAMenu)
            -- upvalues: l_mui_0 (ref)
            return {
                lc = l_mui_0.combo(defensiveAAMenu, "Lag Options", {
                    [1] = "Disabled", 
                    [2] = "Always On", 
                    [3] = "On Peek"
                }), 
                pitch = l_mui_0.combo(defensiveAAMenu, "Pitch", {
                    [1] = "Disabled", 
                    [2] = "Offset", 
                    [3] = "Switch", 
                    [4] = "Random", 
                    [5] = "Automatic"
                }), 
                pitch_offset = l_mui_0.slider(defensiveAAMenu, "Pitch Offset", 0, -90, 90, 1), 
                pitch_offset_1 = l_mui_0.slider(defensiveAAMenu, "Pitch Offset #1", 0, -90, 90, 1), 
                pitch_offset_2 = l_mui_0.slider(defensiveAAMenu, "Pitch Offset #2", 0, -90, 90, 1), 
                yaw = l_mui_0.combo(defensiveAAMenu, "Yaw", {
                    [1] = "Disabled", 
                    [2] = "Neverlose", 
                    [3] = "Offset", 
                    [4] = "Spin", 
                    [5] = "Switch", 
                    [6] = "Random", 
                    [7] = "3-Way", 
                    [8] = "5-Way"
                }), 
                yaw_offset = l_mui_0.slider(defensiveAAMenu, "Yaw Offset", 0, -180, 180, 1, nil, "\194\176"), 
                yaw_offset_1 = l_mui_0.slider(defensiveAAMenu, "Yaw Offset #1", 0, -180, 180, 1, nil, "\194\176"), 
                yaw_offset_2 = l_mui_0.slider(defensiveAAMenu, "Yaw Offset #2", 0, -180, 180, 1, nil, "\194\176"), 
                yaw_speed = l_mui_0.slider(defensiveAAMenu, "Yaw Speed", 0, 0, 100, 1, nil, "%")
            };
        end);
        do
            local conditionName = conditionName;
            menu["anti aim"][("%s / %s"):format(conditionName, "enable")]:set_callback(function(enableSwitch)
                -- upvalues: conditionName (ref), menu (ref), serenity_metadata (ref)
                local isActive = conditionName == get_team(menu["anti aim"].condition:get()) and serenity_metadata.split(menu["anti aim"].type:list()[menu["anti aim"].type:get()], "  ")[2] ~= "Disabled";
                menu["anti aim"][("%s / %s"):format(conditionName, "pitch")]:visibility(isActive and enableSwitch:get());
                menu["anti aim"][("%s / %s"):format(conditionName, "yaw")]:visibility(isActive and enableSwitch:get());
                menu["anti aim"][("%s / %s"):format(conditionName, "yaw")]:set_callback(function(yawCombo)
                    -- upvalues: menu (ref), conditionName (ref), isActive (ref), enableSwitch (ref)
                    local yawGear = menu["anti aim"][("%s / %s"):format(conditionName, "yaw")].gear;
                    yawGear.mode:visibility(yawCombo:get() ~= "Disabled");
                    yawGear.mode:set_callback(function(modeCombo)
                        -- upvalues: yawGear (ref), yawCombo (ref)
                        yawGear.offset:visibility(yawCombo:get() ~= "Disabled" and modeCombo:get() == "Static");
                        yawGear.offset_l:visibility(yawCombo:get() ~= "Disabled" and modeCombo:get() ~= "Static");
                        yawGear.offset_r:visibility(yawCombo:get() ~= "Disabled" and modeCombo:get() ~= "Static");
                    end, true);
                    menu["anti aim"][("%s / %s"):format(conditionName, "yaw_modifier")]:visibility(isActive and yawCombo:get() ~= "Disabled" and enableSwitch:get());
                    menu["anti aim"][("%s / %s"):format(conditionName, "yaw_modifier")]:set_callback(function(yawModifierCombo)
                        -- upvalues: menu (ref), conditionName (ref), yawCombo (ref)
                        local yawModifierGear = menu["anti aim"][("%s / %s"):format(conditionName, "yaw_modifier")].gear;
                        yawModifierGear.mode:visibility(yawCombo:get() ~= "Disabled" and yawModifierCombo:get() ~= "Disabled" and yawModifierCombo:get() ~= "Delay");
                        yawModifierGear.mode:set_callback(function(yawModifierModeCombo)
                            -- upvalues: yawModifierGear (ref), yawCombo (ref), yawModifierCombo (ref)
                            yawModifierGear.offset:visibility(yawCombo:get() ~= "Disabled" and yawModifierCombo:get() ~= "Disabled" and yawModifierModeCombo:get() == "Static" and yawModifierCombo:get() ~= "Delay");
                            yawModifierGear.tick:visibility(yawCombo:get() ~= "Disabled" and yawModifierCombo:get() == "Delay");
                            yawModifierGear.offset_l:visibility(yawCombo:get() ~= "Disabled" and yawModifierCombo:get() ~= "Disabled" and (not (yawModifierModeCombo:get() == "Static") or yawModifierCombo:get() == "Delay"));
                            yawModifierGear.offset_r:visibility(yawCombo:get() ~= "Disabled" and yawModifierCombo:get() ~= "Disabled" and (not (yawModifierModeCombo:get() == "Static") or yawModifierCombo:get() == "Delay"));
                        end, true);
                    end, true);
                end, true);
                menu["anti aim"][("%s / %s"):format(conditionName, "body_yaw")]:visibility(isActive and enableSwitch:get());
                menu["anti aim"][("%s / %s"):format(conditionName, "body_yaw")]:set_callback(function(bodyYawCombo)
                    -- upvalues: menu (ref), conditionName (ref)
                    local bodyYawGear = menu["anti aim"][("%s / %s"):format(conditionName, "body_yaw")].gear;
                    bodyYawGear.mode:visibility(bodyYawCombo:get());
                    bodyYawGear.mode:set_callback(function(bodyYawModeCombo)
                        -- upvalues: bodyYawGear (ref), bodyYawCombo (ref)
                        bodyYawGear.limit_l:visibility(bodyYawCombo:get() and bodyYawModeCombo:get() == "Default");
                        bodyYawGear.limit_r:visibility(bodyYawCombo:get() and bodyYawModeCombo:get() == "Default");
                    end, true);
                    bodyYawGear.options:visibility(bodyYawCombo:get());
                    bodyYawGear.options:set_callback(function(bodyYawOptions)
                        -- upvalues: bodyYawGear (ref), bodyYawCombo (ref)
                        bodyYawGear.delay:visibility(bodyYawCombo:get() and bodyYawOptions:get("Jitter"));
                    end, true);
                    bodyYawGear.freestanding:visibility(bodyYawCombo:get());
                end, true);
                menu["anti aim"][("%s / %s"):format(conditionName, "defensive_aa")]:visibility(isActive and enableSwitch:get());
                menu["anti aim"][("%s / %s"):format(conditionName, "defensive_aa")]:set_callback(function(defensiveAASwitch)
                    -- upvalues: menu (ref), conditionName (ref)
                    local defensiveAAGear = menu["anti aim"][("%s / %s"):format(conditionName, "defensive_aa")].gear;
                    defensiveAAGear.lc:visibility(defensiveAASwitch:get());
                    defensiveAAGear.pitch:visibility(defensiveAASwitch:get());
                    defensiveAAGear.pitch:set_callback(function(pitchCombo)
                        -- upvalues: defensiveAAGear (ref), defensiveAASwitch (ref)
                        defensiveAAGear.pitch_offset:visibility(defensiveAASwitch:get() and (pitchCombo:get() == "Offset" or pitchCombo:get() == "Random"));
                        defensiveAAGear.pitch_offset_1:visibility(defensiveAASwitch:get() and pitchCombo:get() == "Switch");
                        defensiveAAGear.pitch_offset_2:visibility(defensiveAASwitch:get() and pitchCombo:get() == "Switch");
                    end, true);
                    defensiveAAGear.yaw:visibility(defensiveAASwitch:get());
                    defensiveAAGear.yaw:set_callback(function(yawComboDefensive)
                        -- upvalues: defensiveAAGear (ref), defensiveAASwitch (ref)
                        defensiveAAGear.yaw_offset:visibility(defensiveAASwitch:get() and (yawComboDefensive:get() == "Offset" or not (yawComboDefensive:get() ~= "Random") or not (yawComboDefensive:get() ~= "Spin") or not (yawComboDefensive:get() ~= "3-Way") or yawComboDefensive:get() == "5-Way"));
                        defensiveAAGear.yaw_offset_1:visibility(defensiveAASwitch:get() and yawComboDefensive:get() == "Switch");
                        defensiveAAGear.yaw_offset_2:visibility(defensiveAASwitch:get() and yawComboDefensive:get() == "Switch");
                        defensiveAAGear.yaw_speed:visibility(defensiveAASwitch:get() and yawComboDefensive:get() == "Spin");
                    end, true);
                end, true);
            end, true);
        end;
    end;
    settings_ui_elements = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_";
    local v135 = {
        encode = function(inputString)
            -- upvalues: settings_ui_elements (ref)
            return (inputString:gsub(".", function(char)
                local binaryStr = "";
                local byteVal = char:byte();
                for bitIndex = 8, 1, -1 do
                    binaryStr = binaryStr .. (byteVal % 2 ^ bitIndex - byteVal % 2 ^ (bitIndex - 1) > 0 and "1" or "0");
                end;
                return binaryStr;
            end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(bits)
                -- upvalues: settings_ui_elements (ref)
                if #bits < 6 then
                    return "";
                else
                    local index = 0;
                    for bitPos = 1, 6 do
                        index = index + (bits:sub(bitPos, bitPos) == "1" and 2 ^ (6 - bitPos) or 0);
                    end;
                    return settings_ui_elements:sub(index + 1, index + 1);
                end;
            end) .. ({
                [1] = "", 
                [2] = "", 
                [3] = ""
            })[#inputString % 3 + 1];
        end, 
        decode = function(encodedString)
            -- upvalues: settings_ui_elements (ref)
            return (string.gsub(encodedString, "[^" .. settings_ui_elements .. "]", ""):gsub(".", function(char)
                -- upvalues: settings_ui_elements (ref)
                if char == "" then
                    return "";
                else
                    local binaryStr = "";
                    local charIndex = settings_ui_elements:find(char) - 1;
                    for bitIndex = 6, 1, -1 do
                        binaryStr = binaryStr .. (charIndex % 2 ^ bitIndex - charIndex % 2 ^ (bitIndex - 1) > 0 and "1" or "0");
                    end;
                    return binaryStr;
                end;
            end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(byteBits)
                if #byteBits ~= 8 then
                    return "";
                else
                    local byteVal = 0;
                    for bitPos = 1, 8 do
                        byteVal = byteVal + (byteBits:sub(bitPos, bitPos) == "1" and 2 ^ (8 - bitPos) or 0);
                    end;
                    return string.char(byteVal);
                end;
            end));
        end
    };
    local config_manager = {
        data = serenity_config_db.configs or {}, 
        list = {
            data = {}, 
            name = {}
        }, 
        defaults = {
            Default = "            W1siY29tYm8iLCJhbnRpIGFpbSIsIkluIEFpciAvIFQgLyB5YXdfbW9kaWZpZXIiLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkluIEFpciAvIFQgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJJbiBBaXIgLyBUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkluIEFpciAvIFQgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfciIsIkluIEFpciAvIFQgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiSW4gQWlyIC8gVCAvIHlhd19tb2RpZmllciIsMS4wLG51bGwsbnVsbCxbInRpY2siLCJJbiBBaXIgLyBUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkluIEFpciAvIFQgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfbCIsIkluIEFpciAvIFQgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiSW4gQWlyIC8gVCAvIHlhd19tb2RpZmllciIsIlN0YXRpYyIsbnVsbCxudWxsLFsibW9kZSIsIkluIEFpciAvIFQgLyB5YXdfbW9kaWZpZXIiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiSW4gQWlyIC8gVCAvIGJvZHlfeWF3IixmYWxzZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkluIEFpciAvIFQgLyBib2R5X3lhdyIsMC4wLG51bGwsbnVsbCxbImRlbGF5IiwiSW4gQWlyIC8gVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBUIC8gYm9keV95YXciLCJPZmYiLG51bGwsbnVsbCxbImZyZWVzdGFuZGluZyIsIkluIEFpciAvIFQgLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfbCIsIkluIEFpciAvIFQgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiSW4gQWlyIC8gVCAvIGJvZHlfeWF3IiwiRGVmYXVsdCIsbnVsbCxudWxsLFsibW9kZSIsIkluIEFpciAvIFQgLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfciIsIkluIEFpciAvIFQgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiSW4gQWlyIC8gVCAvIGJvZHlfeWF3IixbXSxudWxsLG51bGwsWyJvcHRpb25zIiwiSW4gQWlyIC8gVCAvIGJvZHlfeWF3Iiwic2VsZWN0YWJsZSJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiYW5pbWF0aW9ucyIsZmFsc2VdLFsic3dpdGNoIiwiYW50aSBhaW0iLCJhbmltYXRpb25zIiwiU3RhdGljIixudWxsLG51bGwsWyJhaXIiLCJhbmltYXRpb25zIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsImFuaW1hdGlvbnMiLDAuMCxudWxsLG51bGwsWyJsZWFuIiwiYW5pbWF0aW9ucyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiYW5pbWF0aW9ucyIsW10sbnVsbCxudWxsLFsic2VsZWN0IiwiYW5pbWF0aW9ucyIsInNlbGVjdGFibGUiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsImFuaW1hdGlvbnMiLCJTdGF0aWMiLG51bGwsbnVsbCxbImxhbmRpbmciLCJhbmltYXRpb25zIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBOIC8gZW5hYmxlIix0cnVlXSxbImNvbWJvIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gTiAvIHBpdGNoIiwiRG93biJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBOIC8geWF3IiwiQmFja3dhcmQiXSxbImNvbWJvIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gTiAvIHlhdyIsMC4wLG51bGwsbnVsbCxbIm9mZnNldCIsIkFpciBDcm91Y2ggLyBOIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBOIC8geWF3IiwiTCAmIFIiLG51bGwsbnVsbCxbIm1vZGUiLCJBaXIgQ3JvdWNoIC8gTiAvIHlhdyIsImNvbWJvIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBOIC8geWF3IiwtMjMuMCxudWxsLG51bGwsWyJvZmZzZXRfbCIsIkFpciBDcm91Y2ggLyBOIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBOIC8geWF3Iiw0Ni4wLG51bGwsbnVsbCxbIm9mZnNldF9yIiwiQWlyIENyb3VjaCAvIE4gLyB5YXciLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIE4gLyBlbmFibGUiLHRydWVdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkdsb2JhbCAvIE4gLyBwaXRjaCIsIkRpc2FibGVkIl0sWyJjb21ibyIsImFudGkgYWltIiwiR2xvYmFsIC8gTiAvIHlhdyIsIkRpc2FibGVkIl0sWyJjb21ibyIsImFudGkgYWltIiwiR2xvYmFsIC8gTiAvIHlhdyIsMC4wLG51bGwsbnVsbCxbIm9mZnNldCIsIkdsb2JhbCAvIE4gLyB5YXciLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiR2xvYmFsIC8gTiAvIHlhdyIsIlN0YXRpYyIsbnVsbCxudWxsLFsibW9kZSIsIkdsb2JhbCAvIE4gLyB5YXciLCJjb21ibyJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBOIC8geWF3IiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X2wiLCJHbG9iYWwgLyBOIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkdsb2JhbCAvIE4gLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfciIsIkdsb2JhbCAvIE4gLyB5YXciLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiR2xvYmFsIC8gTiAvIHlhd19tb2RpZmllciIsIkRpc2FibGVkIl0sWyJjb21ibyIsImFudGkgYWltIiwiR2xvYmFsIC8gTiAvIHlhd19tb2RpZmllciIsMC4wLG51bGwsbnVsbCxbIm9mZnNldCIsIkdsb2JhbCAvIE4gLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiR2xvYmFsIC8gTiAvIHlhd19tb2RpZmllciIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9yIiwiR2xvYmFsIC8gTiAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBOIC8geWF3X21vZGlmaWVyIiwxLjAsbnVsbCxudWxsLFsidGljayIsIkdsb2JhbCAvIE4gLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiR2xvYmFsIC8gTiAvIHlhd19tb2RpZmllciIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9sIiwiR2xvYmFsIC8gTiAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBOIC8geWF3X21vZGlmaWVyIiwiU3RhdGljIixudWxsLG51bGwsWyJtb2RlIiwiR2xvYmFsIC8gTiAvIHlhd19tb2RpZmllciIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBOIC8gYm9keV95YXciLGZhbHNlXSxbInN3aXRjaCIsImFudGkgYWltIiwiR2xvYmFsIC8gTiAvIGJvZHlfeWF3IiwwLjAsbnVsbCxudWxsLFsiZGVsYXkiLCJHbG9iYWwgLyBOIC8gYm9keV95YXciLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIE4gLyBib2R5X3lhdyIsIk9mZiIsbnVsbCxudWxsLFsiZnJlZXN0YW5kaW5nIiwiR2xvYmFsIC8gTiAvIGJvZHlfeWF3IiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIE4gLyBib2R5X3lhdyIsNjAuMCxudWxsLG51bGwsWyJsaW1pdF9sIiwiR2xvYmFsIC8gTiAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBOIC8gYm9keV95YXciLCJEZWZhdWx0IixudWxsLG51bGwsWyJtb2RlIiwiR2xvYmFsIC8gTiAvIGJvZHlfeWF3IiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIE4gLyBib2R5X3lhdyIsNjAuMCxudWxsLG51bGwsWyJsaW1pdF9yIiwiR2xvYmFsIC8gTiAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBOIC8gYm9keV95YXciLFtdLG51bGwsbnVsbCxbIm9wdGlvbnMiLCJHbG9iYWwgLyBOIC8gYm9keV95YXciLCJzZWxlY3RhYmxlIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBOIC8gZGVmZW5zaXZlX2FhIixmYWxzZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIE4gLyBkZWZlbnNpdmVfYWEiLCJEaXNhYmxlZCIsbnVsbCxudWxsLFsibGMiLCJHbG9iYWwgLyBOIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIE4gLyBkZWZlbnNpdmVfYWEiLCJEaXNhYmxlZCIsbnVsbCxudWxsLFsicGl0Y2giLCJHbG9iYWwgLyBOIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIE4gLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0IiwiR2xvYmFsIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiR2xvYmFsIC8gTiAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInlhd19vZmZzZXRfMSIsIkdsb2JhbCAvIE4gLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIE4gLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJwaXRjaF9vZmZzZXQiLCJHbG9iYWwgLyBOIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBOIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbInlhdyIsIkdsb2JhbCAvIE4gLyBkZWZlbnNpdmVfYWEiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiR2xvYmFsIC8gTiAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInlhd19vZmZzZXRfMiIsIkdsb2JhbCAvIE4gLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIE4gLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfc3BlZWQiLCJHbG9iYWwgLyBOIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBOIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0XzIiLCJHbG9iYWwgLyBOIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBOIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0XzEiLCJHbG9iYWwgLyBOIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBDVCAvIHlhd19tb2RpZmllciIsIkRpc2FibGVkIl0sWyJjb21ibyIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIENUIC8geWF3X21vZGlmaWVyIiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0IiwiQWlyIENyb3VjaCAvIENUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBDVCAvIHlhd19tb2RpZmllciIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9yIiwiQWlyIENyb3VjaCAvIENUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBDVCAvIHlhd19tb2RpZmllciIsMS4wLG51bGwsbnVsbCxbInRpY2siLCJBaXIgQ3JvdWNoIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIENUIC8geWF3X21vZGlmaWVyIiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X2wiLCJBaXIgQ3JvdWNoIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIENUIC8geWF3X21vZGlmaWVyIiwiU3RhdGljIixudWxsLG51bGwsWyJtb2RlIiwiQWlyIENyb3VjaCAvIENUIC8geWF3X21vZGlmaWVyIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBDVCAvIGJvZHlfeWF3IixmYWxzZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBDVCAvIGJvZHlfeWF3IiwwLjAsbnVsbCxudWxsLFsiZGVsYXkiLCJBaXIgQ3JvdWNoIC8gQ1QgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIENUIC8gYm9keV95YXciLCJPZmYiLG51bGwsbnVsbCxbImZyZWVzdGFuZGluZyIsIkFpciBDcm91Y2ggLyBDVCAvIGJvZHlfeWF3IiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBDVCAvIGJvZHlfeWF3Iiw2MC4wLG51bGwsbnVsbCxbImxpbWl0X2wiLCJBaXIgQ3JvdWNoIC8gQ1QgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIENUIC8gYm9keV95YXciLCJEZWZhdWx0IixudWxsLG51bGwsWyJtb2RlIiwiQWlyIENyb3VjaCAvIENUIC8gYm9keV95YXciLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIENUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfciIsIkFpciBDcm91Y2ggLyBDVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gQ1QgLyBib2R5X3lhdyIsW10sbnVsbCxudWxsLFsib3B0aW9ucyIsIkFpciBDcm91Y2ggLyBDVCAvIGJvZHlfeWF3Iiwic2VsZWN0YWJsZSJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIENUIC8gZGVmZW5zaXZlX2FhIixmYWxzZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBDVCAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJsYyIsIkFpciBDcm91Y2ggLyBDVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJEaXNhYmxlZCIsbnVsbCxudWxsLFsicGl0Y2giLCJBaXIgQ3JvdWNoIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIENUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldCIsIkFpciBDcm91Y2ggLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIENUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldF8xIiwiQWlyIENyb3VjaCAvIENUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJwaXRjaF9vZmZzZXQiLCJBaXIgQ3JvdWNoIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBDVCAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJ5YXciLCJBaXIgQ3JvdWNoIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIENUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldF8yIiwiQWlyIENyb3VjaCAvIENUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfc3BlZWQiLCJBaXIgQ3JvdWNoIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBDVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8yIiwiQWlyIENyb3VjaCAvIENUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJwaXRjaF9vZmZzZXRfMSIsIkFpciBDcm91Y2ggLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiR2xvYmFsIC8gQ1QgLyBlbmFibGUiLHRydWVdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkdsb2JhbCAvIENUIC8gcGl0Y2giLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkdsb2JhbCAvIENUIC8geWF3IiwiRGlzYWJsZWQiXSxbImNvbWJvIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBDVCAvIHlhdyIsMC4wLG51bGwsbnVsbCxbIm9mZnNldCIsIkdsb2JhbCAvIENUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkdsb2JhbCAvIENUIC8geWF3IiwiU3RhdGljIixudWxsLG51bGwsWyJtb2RlIiwiR2xvYmFsIC8gQ1QgLyB5YXciLCJjb21ibyJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBDVCAvIHlhdyIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9sIiwiR2xvYmFsIC8gQ1QgLyB5YXciLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiR2xvYmFsIC8gQ1QgLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfciIsIkdsb2JhbCAvIENUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkdsb2JhbCAvIENUIC8geWF3X21vZGlmaWVyIiwiRGlzYWJsZWQiXSxbImNvbWJvIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBDVCAvIHlhd19tb2RpZmllciIsMC4wLG51bGwsbnVsbCxbIm9mZnNldCIsIkdsb2JhbCAvIENUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkdsb2JhbCAvIENUIC8geWF3X21vZGlmaWVyIiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X3IiLCJHbG9iYWwgLyBDVCAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBDVCAvIHlhd19tb2RpZmllciIsMS4wLG51bGwsbnVsbCxbInRpY2siLCJHbG9iYWwgLyBDVCAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBDVCAvIHlhd19tb2RpZmllciIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9sIiwiR2xvYmFsIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiR2xvYmFsIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJTdGF0aWMiLG51bGwsbnVsbCxbIm1vZGUiLCJHbG9iYWwgLyBDVCAvIHlhd19tb2RpZmllciIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsZmFsc2VdLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJsYyIsIkdsb2JhbCAvIENUIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIENUIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbInBpdGNoIiwiR2xvYmFsIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiR2xvYmFsIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0IiwiR2xvYmFsIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIENUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldF8xIiwiR2xvYmFsIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIENUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0IiwiR2xvYmFsIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIENUIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbInlhdyIsIkdsb2JhbCAvIENUIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIENUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldF8yIiwiR2xvYmFsIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIENUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X3NwZWVkIiwiR2xvYmFsIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIENUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0XzIiLCJHbG9iYWwgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiR2xvYmFsIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJwaXRjaF9vZmZzZXRfMSIsIkdsb2JhbCAvIENUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBUIC8gZW5hYmxlIixmYWxzZV0sWyJjb21ibyIsImFudGkgYWltIiwiY29uZGl0aW9uIiwiQWlyIENyb3VjaCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkdsb2JhbCAvIFQgLyB5YXciLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkdsb2JhbCAvIFQgLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJHbG9iYWwgLyBUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkdsb2JhbCAvIFQgLyB5YXciLCJTdGF0aWMiLG51bGwsbnVsbCxbIm1vZGUiLCJHbG9iYWwgLyBUIC8geWF3IiwiY29tYm8iXV0sWyJjb21ibyIsImFudGkgYWltIiwiR2xvYmFsIC8gVCAvIHlhdyIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9sIiwiR2xvYmFsIC8gVCAvIHlhdyIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBUIC8geWF3IiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X3IiLCJHbG9iYWwgLyBUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkdsb2JhbCAvIFQgLyB5YXdfbW9kaWZpZXIiLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkdsb2JhbCAvIFQgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJHbG9iYWwgLyBUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkdsb2JhbCAvIFQgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfciIsIkdsb2JhbCAvIFQgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiR2xvYmFsIC8gVCAvIHlhd19tb2RpZmllciIsMS4wLG51bGwsbnVsbCxbInRpY2siLCJHbG9iYWwgLyBUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkdsb2JhbCAvIFQgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfbCIsIkdsb2JhbCAvIFQgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiR2xvYmFsIC8gVCAvIHlhd19tb2RpZmllciIsIlN0YXRpYyIsbnVsbCxudWxsLFsibW9kZSIsIkdsb2JhbCAvIFQgLyB5YXdfbW9kaWZpZXIiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiR2xvYmFsIC8gVCAvIGJvZHlfeWF3IixmYWxzZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIFQgLyBib2R5X3lhdyIsMC4wLG51bGwsbnVsbCxbImRlbGF5IiwiR2xvYmFsIC8gVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBUIC8gYm9keV95YXciLCJPZmYiLG51bGwsbnVsbCxbImZyZWVzdGFuZGluZyIsIkdsb2JhbCAvIFQgLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfbCIsIkdsb2JhbCAvIFQgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiR2xvYmFsIC8gVCAvIGJvZHlfeWF3IiwiRGVmYXVsdCIsbnVsbCxudWxsLFsibW9kZSIsIkdsb2JhbCAvIFQgLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfciIsIkdsb2JhbCAvIFQgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiR2xvYmFsIC8gVCAvIGJvZHlfeWF3IixbXSxudWxsLG51bGwsWyJvcHRpb25zIiwiR2xvYmFsIC8gVCAvIGJvZHlfeWF3Iiwic2VsZWN0YWJsZSJdXSxbImxpc3QiLCJhbnRpIGFpbSIsInR5cGUiLDIuMF0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gTiAvIGVuYWJsZSIsdHJ1ZV0sWyJjb21ibyIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBOIC8gcGl0Y2giLCJEb3duIl0sWyJjb21ibyIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBOIC8geWF3IiwiQmFja3dhcmQiXSxbImNvbWJvIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIE4gLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJTdGFuZGluZyAvIE4gLyB5YXciLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBOIC8geWF3IiwiTCAmIFIiLG51bGwsbnVsbCxbIm1vZGUiLCJTdGFuZGluZyAvIE4gLyB5YXciLCJjb21ibyJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIE4gLyB5YXciLC0xNi4wLG51bGwsbnVsbCxbIm9mZnNldF9sIiwiU3RhbmRpbmcgLyBOIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gTiAvIHlhdyIsNDUuMCxudWxsLG51bGwsWyJvZmZzZXRfciIsIlN0YW5kaW5nIC8gTiAvIHlhdyIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIE4gLyB5YXdfbW9kaWZpZXIiLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gTiAvIHlhd19tb2RpZmllciIsLTE3LjAsbnVsbCxudWxsLFsib2Zmc2V0IiwiU3RhbmRpbmcgLyBOIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gTiAvIHlhd19tb2RpZmllciIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9yIiwiU3RhbmRpbmcgLyBOIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gTiAvIHlhd19tb2RpZmllciIsMS4wLG51bGwsbnVsbCxbInRpY2siLCJTdGFuZGluZyAvIE4gLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBOIC8geWF3X21vZGlmaWVyIiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X2wiLCJTdGFuZGluZyAvIE4gLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBOIC8geWF3X21vZGlmaWVyIiwiU3RhdGljIixudWxsLG51bGwsWyJtb2RlIiwiU3RhbmRpbmcgLyBOIC8geWF3X21vZGlmaWVyIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gTiAvIGJvZHlfeWF3Iix0cnVlXSxbInN3aXRjaCIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBOIC8gYm9keV95YXciLDAuMCxudWxsLG51bGwsWyJkZWxheSIsIlN0YW5kaW5nIC8gTiAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIE4gLyBib2R5X3lhdyIsIk9mZiIsbnVsbCxudWxsLFsiZnJlZXN0YW5kaW5nIiwiU3RhbmRpbmcgLyBOIC8gYm9keV95YXciLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBOIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfbCIsIlN0YW5kaW5nIC8gTiAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIE4gLyBib2R5X3lhdyIsIkRlZmF1bHQiLG51bGwsbnVsbCxbIm1vZGUiLCJTdGFuZGluZyAvIE4gLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIE4gLyBib2R5X3lhdyIsNjAuMCxudWxsLG51bGwsWyJsaW1pdF9yIiwiU3RhbmRpbmcgLyBOIC8gYm9keV95YXciLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gTiAvIGJvZHlfeWF3IixbIkppdHRlciJdLG51bGwsbnVsbCxbIm9wdGlvbnMiLCJTdGFuZGluZyAvIE4gLyBib2R5X3lhdyIsInNlbGVjdGFibGUiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gTiAvIGRlZmVuc2l2ZV9hYSIsZmFsc2VdLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIE4gLyBkZWZlbnNpdmVfYWEiLCJPbiBQZWVrIixudWxsLG51bGwsWyJsYyIsIlN0YW5kaW5nIC8gTiAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIE4gLyBkZWZlbnNpdmVfYWEiLCJBdXRvbWF0aWMiLG51bGwsbnVsbCxbInBpdGNoIiwiU3RhbmRpbmcgLyBOIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gTiAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInlhd19vZmZzZXQiLCJTdGFuZGluZyAvIE4gLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gTiAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInlhd19vZmZzZXRfMSIsIlN0YW5kaW5nIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBOIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0IiwiU3RhbmRpbmcgLyBOIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIE4gLyBkZWZlbnNpdmVfYWEiLCJEaXNhYmxlZCIsbnVsbCxudWxsLFsieWF3IiwiU3RhbmRpbmcgLyBOIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gTiAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInlhd19vZmZzZXRfMiIsIlN0YW5kaW5nIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBOIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X3NwZWVkIiwiU3RhbmRpbmcgLyBOIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIE4gLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJwaXRjaF9vZmZzZXRfMiIsIlN0YW5kaW5nIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBOIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0XzEiLCJTdGFuZGluZyAvIE4gLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gQ1QgLyBlbmFibGUiLGZhbHNlXSxbImNvbWJvIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIENUIC8gcGl0Y2giLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gQ1QgLyB5YXciLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gQ1QgLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJTdGFuZGluZyAvIENUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gQ1QgLyB5YXciLCJTdGF0aWMiLG51bGwsbnVsbCxbIm1vZGUiLCJTdGFuZGluZyAvIENUIC8geWF3IiwiY29tYm8iXV0sWyJjb21ibyIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBDVCAvIHlhdyIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9sIiwiU3RhbmRpbmcgLyBDVCAvIHlhdyIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIENUIC8geWF3IiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X3IiLCJTdGFuZGluZyAvIENUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJTdGFuZGluZyAvIENUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfciIsIlN0YW5kaW5nIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBDVCAvIHlhd19tb2RpZmllciIsMS4wLG51bGwsbnVsbCxbInRpY2siLCJTdGFuZGluZyAvIENUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfbCIsIlN0YW5kaW5nIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBDVCAvIHlhd19tb2RpZmllciIsIlN0YXRpYyIsbnVsbCxudWxsLFsibW9kZSIsIlN0YW5kaW5nIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsZmFsc2VdLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIENUIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbImxjIiwiU3RhbmRpbmcgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIENUIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbInBpdGNoIiwiU3RhbmRpbmcgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIENUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldCIsIlN0YW5kaW5nIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzEiLCJTdGFuZGluZyAvIENUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIENUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0IiwiU3RhbmRpbmcgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJ5YXciLCJTdGFuZGluZyAvIENUIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzIiLCJTdGFuZGluZyAvIENUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIENUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X3NwZWVkIiwiU3RhbmRpbmcgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8yIiwiU3RhbmRpbmcgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8xIiwiU3RhbmRpbmcgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBUIC8gZW5hYmxlIixmYWxzZV0sWyJjb21ibyIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBUIC8gcGl0Y2giLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gVCAvIHlhdyIsIkRpc2FibGVkIl0sWyJjb21ibyIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBUIC8geWF3IiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0IiwiU3RhbmRpbmcgLyBUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gVCAvIHlhdyIsIlN0YXRpYyIsbnVsbCxudWxsLFsibW9kZSIsIlN0YW5kaW5nIC8gVCAvIHlhdyIsImNvbWJvIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gVCAvIHlhdyIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9sIiwiU3RhbmRpbmcgLyBUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gVCAvIHlhdyIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9yIiwiU3RhbmRpbmcgLyBUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gVCAvIHlhd19tb2RpZmllciIsIkRpc2FibGVkIl0sWyJjb21ibyIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBUIC8geWF3X21vZGlmaWVyIiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0IiwiU3RhbmRpbmcgLyBUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gVCAvIHlhd19tb2RpZmllciIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9yIiwiU3RhbmRpbmcgLyBUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gVCAvIHlhd19tb2RpZmllciIsMS4wLG51bGwsbnVsbCxbInRpY2siLCJTdGFuZGluZyAvIFQgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBUIC8geWF3X21vZGlmaWVyIiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X2wiLCJTdGFuZGluZyAvIFQgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBUIC8geWF3X21vZGlmaWVyIiwiU3RhdGljIixudWxsLG51bGwsWyJtb2RlIiwiU3RhbmRpbmcgLyBUIC8geWF3X21vZGlmaWVyIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gVCAvIGJvZHlfeWF3IixmYWxzZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gVCAvIGJvZHlfeWF3IiwwLjAsbnVsbCxudWxsLFsiZGVsYXkiLCJTdGFuZGluZyAvIFQgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBUIC8gYm9keV95YXciLCJPZmYiLG51bGwsbnVsbCxbImZyZWVzdGFuZGluZyIsIlN0YW5kaW5nIC8gVCAvIGJvZHlfeWF3IiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gVCAvIGJvZHlfeWF3Iiw2MC4wLG51bGwsbnVsbCxbImxpbWl0X2wiLCJTdGFuZGluZyAvIFQgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBUIC8gYm9keV95YXciLCJEZWZhdWx0IixudWxsLG51bGwsWyJtb2RlIiwiU3RhbmRpbmcgLyBUIC8gYm9keV95YXciLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfciIsIlN0YW5kaW5nIC8gVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIFQgLyBib2R5X3lhdyIsW10sbnVsbCxudWxsLFsib3B0aW9ucyIsIlN0YW5kaW5nIC8gVCAvIGJvZHlfeWF3Iiwic2VsZWN0YWJsZSJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBUIC8gZGVmZW5zaXZlX2FhIixmYWxzZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gVCAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJsYyIsIlN0YW5kaW5nIC8gVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIFQgLyBkZWZlbnNpdmVfYWEiLCJEaXNhYmxlZCIsbnVsbCxudWxsLFsicGl0Y2giLCJTdGFuZGluZyAvIFQgLyBkZWZlbnNpdmVfYWEiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldCIsIlN0YW5kaW5nIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldF8xIiwiU3RhbmRpbmcgLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIFQgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJwaXRjaF9vZmZzZXQiLCJTdGFuZGluZyAvIFQgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gVCAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJ5YXciLCJTdGFuZGluZyAvIFQgLyBkZWZlbnNpdmVfYWEiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldF8yIiwiU3RhbmRpbmcgLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIFQgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfc3BlZWQiLCJTdGFuZGluZyAvIFQgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8yIiwiU3RhbmRpbmcgLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIFQgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJwaXRjaF9vZmZzZXRfMSIsIlN0YW5kaW5nIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gTiAvIGVuYWJsZSIsdHJ1ZV0sWyJjb21ibyIsImFudGkgYWltIiwiTW92aW5nIC8gTiAvIHBpdGNoIiwiRG93biJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIk1vdmluZyAvIE4gLyB5YXciLCJCYWNrd2FyZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIk1vdmluZyAvIE4gLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJNb3ZpbmcgLyBOIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIk1vdmluZyAvIE4gLyB5YXciLCJMICYgUiIsbnVsbCxudWxsLFsibW9kZSIsIk1vdmluZyAvIE4gLyB5YXciLCJjb21ibyJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBOIC8geWF3IiwtMTguMCxudWxsLG51bGwsWyJvZmZzZXRfbCIsIk1vdmluZyAvIE4gLyB5YXciLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiTW92aW5nIC8gTiAvIHlhdyIsNDEuMCxudWxsLG51bGwsWyJvZmZzZXRfciIsIk1vdmluZyAvIE4gLyB5YXciLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiTW92aW5nIC8gTiAvIHlhd19tb2RpZmllciIsIkRpc2FibGVkIl0sWyJjb21ibyIsImFudGkgYWltIiwiTW92aW5nIC8gTiAvIHlhd19tb2RpZmllciIsLTE3LjAsbnVsbCxudWxsLFsib2Zmc2V0IiwiTW92aW5nIC8gTiAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBOIC8geWF3X21vZGlmaWVyIiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X3IiLCJNb3ZpbmcgLyBOIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIk1vdmluZyAvIE4gLyB5YXdfbW9kaWZpZXIiLDEuMCxudWxsLG51bGwsWyJ0aWNrIiwiTW92aW5nIC8gTiAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBOIC8geWF3X21vZGlmaWVyIiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X2wiLCJNb3ZpbmcgLyBOIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIk1vdmluZyAvIE4gLyB5YXdfbW9kaWZpZXIiLCJTdGF0aWMiLG51bGwsbnVsbCxbIm1vZGUiLCJNb3ZpbmcgLyBOIC8geWF3X21vZGlmaWVyIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIk1vdmluZyAvIE4gLyBib2R5X3lhdyIsdHJ1ZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIk1vdmluZyAvIE4gLyBib2R5X3lhdyIsMC4wLG51bGwsbnVsbCxbImRlbGF5IiwiTW92aW5nIC8gTiAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBOIC8gYm9keV95YXciLCJPZmYiLG51bGwsbnVsbCxbImZyZWVzdGFuZGluZyIsIk1vdmluZyAvIE4gLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBOIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfbCIsIk1vdmluZyAvIE4gLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gTiAvIGJvZHlfeWF3IiwiRGVmYXVsdCIsbnVsbCxudWxsLFsibW9kZSIsIk1vdmluZyAvIE4gLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBOIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfciIsIk1vdmluZyAvIE4gLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gTiAvIGJvZHlfeWF3IixbIkppdHRlciJdLG51bGwsbnVsbCxbIm9wdGlvbnMiLCJNb3ZpbmcgLyBOIC8gYm9keV95YXciLCJzZWxlY3RhYmxlIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBOIC8gZGVmZW5zaXZlX2FhIix0cnVlXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gTiAvIGRlZmVuc2l2ZV9hYSIsIk9uIFBlZWsiLG51bGwsbnVsbCxbImxjIiwiTW92aW5nIC8gTiAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBOIC8gZGVmZW5zaXZlX2FhIiwiQXV0b21hdGljIixudWxsLG51bGwsWyJwaXRjaCIsIk1vdmluZyAvIE4gLyBkZWZlbnNpdmVfYWEiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gTiAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInlhd19vZmZzZXQiLCJNb3ZpbmcgLyBOIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBOIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldF8xIiwiTW92aW5nIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gTiAvIGRlZmVuc2l2ZV9hYSIsLTIxLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0IiwiTW92aW5nIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gTiAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJ5YXciLCJNb3ZpbmcgLyBOIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIk1vdmluZyAvIE4gLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzIiLCJNb3ZpbmcgLyBOIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBOIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X3NwZWVkIiwiTW92aW5nIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gTiAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8yIiwiTW92aW5nIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gTiAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8xIiwiTW92aW5nIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIFQgLyBkZWZlbnNpdmVfYWEiLGZhbHNlXSxbInN3aXRjaCIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIFQgLyBkZWZlbnNpdmVfYWEiLCJEaXNhYmxlZCIsbnVsbCxudWxsLFsibGMiLCJBaXIgQ3JvdWNoIC8gVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gVCAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJwaXRjaCIsIkFpciBDcm91Y2ggLyBUIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldCIsIkFpciBDcm91Y2ggLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInlhd19vZmZzZXRfMSIsIkFpciBDcm91Y2ggLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldCIsIkFpciBDcm91Y2ggLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gVCAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJ5YXciLCJBaXIgQ3JvdWNoIC8gVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInlhd19vZmZzZXRfMiIsIkFpciBDcm91Y2ggLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInlhd19zcGVlZCIsIkFpciBDcm91Y2ggLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8yIiwiQWlyIENyb3VjaCAvIFQgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0XzEiLCJBaXIgQ3JvdWNoIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIFQgLyBib2R5X3lhdyIsZmFsc2VdLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gVCAvIGJvZHlfeWF3IiwwLjAsbnVsbCxudWxsLFsiZGVsYXkiLCJBaXIgQ3JvdWNoIC8gVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gVCAvIGJvZHlfeWF3IiwiT2ZmIixudWxsLG51bGwsWyJmcmVlc3RhbmRpbmciLCJBaXIgQ3JvdWNoIC8gVCAvIGJvZHlfeWF3IiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfbCIsIkFpciBDcm91Y2ggLyBUIC8gYm9keV95YXciLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBUIC8gYm9keV95YXciLCJEZWZhdWx0IixudWxsLG51bGwsWyJtb2RlIiwiQWlyIENyb3VjaCAvIFQgLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gVCAvIGJvZHlfeWF3Iiw2MC4wLG51bGwsbnVsbCxbImxpbWl0X3IiLCJBaXIgQ3JvdWNoIC8gVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gVCAvIGJvZHlfeWF3IixbXSxudWxsLG51bGwsWyJvcHRpb25zIiwiQWlyIENyb3VjaCAvIFQgLyBib2R5X3lhdyIsInNlbGVjdGFibGUiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIFQgLyB5YXdfbW9kaWZpZXIiLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBUIC8geWF3X21vZGlmaWVyIiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0IiwiQWlyIENyb3VjaCAvIFQgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIFQgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfciIsIkFpciBDcm91Y2ggLyBUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBUIC8geWF3X21vZGlmaWVyIiwxLjAsbnVsbCxudWxsLFsidGljayIsIkFpciBDcm91Y2ggLyBUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBUIC8geWF3X21vZGlmaWVyIiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X2wiLCJBaXIgQ3JvdWNoIC8gVCAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gVCAvIHlhd19tb2RpZmllciIsIlN0YXRpYyIsbnVsbCxudWxsLFsibW9kZSIsIkFpciBDcm91Y2ggLyBUIC8geWF3X21vZGlmaWVyIiwiY29tYm8iXV0sWyJjb21ibyIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIFQgLyB5YXciLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBUIC8geWF3IiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0IiwiQWlyIENyb3VjaCAvIFQgLyB5YXciLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIFQgLyB5YXciLCJTdGF0aWMiLG51bGwsbnVsbCxbIm1vZGUiLCJBaXIgQ3JvdWNoIC8gVCAvIHlhdyIsImNvbWJvIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBUIC8geWF3IiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X2wiLCJBaXIgQ3JvdWNoIC8gVCAvIHlhdyIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gVCAvIHlhdyIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9yIiwiQWlyIENyb3VjaCAvIFQgLyB5YXciLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIFQgLyBwaXRjaCIsIkRpc2FibGVkIl0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBUIC8gZW5hYmxlIixmYWxzZV0sWyJjb21ibyIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIENUIC8geWF3IiwiRGlzYWJsZWQiXSxbImNvbWJvIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gQ1QgLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJBaXIgQ3JvdWNoIC8gQ1QgLyB5YXciLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIENUIC8geWF3IiwiU3RhdGljIixudWxsLG51bGwsWyJtb2RlIiwiQWlyIENyb3VjaCAvIENUIC8geWF3IiwiY29tYm8iXV0sWyJjb21ibyIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIENUIC8geWF3IiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X2wiLCJBaXIgQ3JvdWNoIC8gQ1QgLyB5YXciLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIENUIC8geWF3IiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X3IiLCJBaXIgQ3JvdWNoIC8gQ1QgLyB5YXciLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIENUIC8gcGl0Y2giLCJEaXNhYmxlZCJdLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gQ1QgLyBlbmFibGUiLGZhbHNlXSxbInN3aXRjaCIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIE4gLyBkZWZlbnNpdmVfYWEiLHRydWVdLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gTiAvIGRlZmVuc2l2ZV9hYSIsIkFsd2F5cyBPbiIsbnVsbCxudWxsLFsibGMiLCJBaXIgQ3JvdWNoIC8gTiAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gTiAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJwaXRjaCIsIkFpciBDcm91Y2ggLyBOIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBOIC8gZGVmZW5zaXZlX2FhIiwxODAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0IiwiQWlyIENyb3VjaCAvIE4gLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBOIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldF8xIiwiQWlyIENyb3VjaCAvIE4gLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBOIC8gZGVmZW5zaXZlX2FhIiwtMjQuMCxudWxsLG51bGwsWyJwaXRjaF9vZmZzZXQiLCJBaXIgQ3JvdWNoIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIE4gLyBkZWZlbnNpdmVfYWEiLCJEaXNhYmxlZCIsbnVsbCxudWxsLFsieWF3IiwiQWlyIENyb3VjaCAvIE4gLyBkZWZlbnNpdmVfYWEiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIE4gLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzIiLCJBaXIgQ3JvdWNoIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIE4gLyBkZWZlbnNpdmVfYWEiLDY1LjAsbnVsbCxudWxsLFsieWF3X3NwZWVkIiwiQWlyIENyb3VjaCAvIE4gLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBOIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0XzIiLCJBaXIgQ3JvdWNoIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIE4gLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJwaXRjaF9vZmZzZXRfMSIsIkFpciBDcm91Y2ggLyBOIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gTiAvIGJvZHlfeWF3Iix0cnVlXSxbInN3aXRjaCIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIE4gLyBib2R5X3lhdyIsMC4wLG51bGwsbnVsbCxbImRlbGF5IiwiQWlyIENyb3VjaCAvIE4gLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIE4gLyBib2R5X3lhdyIsIk9mZiIsbnVsbCxudWxsLFsiZnJlZXN0YW5kaW5nIiwiQWlyIENyb3VjaCAvIE4gLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gTiAvIGJvZHlfeWF3Iiw2MC4wLG51bGwsbnVsbCxbImxpbWl0X2wiLCJBaXIgQ3JvdWNoIC8gTiAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gTiAvIGJvZHlfeWF3IiwiRGVmYXVsdCIsbnVsbCxudWxsLFsibW9kZSIsIkFpciBDcm91Y2ggLyBOIC8gYm9keV95YXciLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIE4gLyBib2R5X3lhdyIsNjAuMCxudWxsLG51bGwsWyJsaW1pdF9yIiwiQWlyIENyb3VjaCAvIE4gLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIE4gLyBib2R5X3lhdyIsWyJKaXR0ZXIiXSxudWxsLG51bGwsWyJvcHRpb25zIiwiQWlyIENyb3VjaCAvIE4gLyBib2R5X3lhdyIsInNlbGVjdGFibGUiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIE4gLyB5YXdfbW9kaWZpZXIiLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBOIC8geWF3X21vZGlmaWVyIiwtMTQuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJBaXIgQ3JvdWNoIC8gTiAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJBaXIgQ3JvdWNoIC8gTiAvIHlhd19tb2RpZmllciIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9yIiwiQWlyIENyb3VjaCAvIE4gLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIE4gLyB5YXdfbW9kaWZpZXIiLDEuMCxudWxsLG51bGwsWyJ0aWNrIiwiQWlyIENyb3VjaCAvIE4gLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQWlyIENyb3VjaCAvIE4gLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfbCIsIkFpciBDcm91Y2ggLyBOIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkFpciBDcm91Y2ggLyBOIC8geWF3X21vZGlmaWVyIiwiU3RhdGljIixudWxsLG51bGwsWyJtb2RlIiwiQWlyIENyb3VjaCAvIE4gLyB5YXdfbW9kaWZpZXIiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiSW4gQWlyIC8gVCAvIGRlZmVuc2l2ZV9hYSIsZmFsc2VdLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBUIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbImxjIiwiSW4gQWlyIC8gVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBUIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbInBpdGNoIiwiSW4gQWlyIC8gVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldCIsIkluIEFpciAvIFQgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkluIEFpciAvIFQgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzEiLCJJbiBBaXIgLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0IiwiSW4gQWlyIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiSW4gQWlyIC8gVCAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJ5YXciLCJJbiBBaXIgLyBUIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkluIEFpciAvIFQgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzIiLCJJbiBBaXIgLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X3NwZWVkIiwiSW4gQWlyIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiSW4gQWlyIC8gVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8yIiwiSW4gQWlyIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiSW4gQWlyIC8gVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8xIiwiSW4gQWlyIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiR2xvYmFsIC8gQ1QgLyBib2R5X3lhdyIsZmFsc2VdLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBDVCAvIGJvZHlfeWF3IiwwLjAsbnVsbCxudWxsLFsiZGVsYXkiLCJHbG9iYWwgLyBDVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBDVCAvIGJvZHlfeWF3IiwiT2ZmIixudWxsLG51bGwsWyJmcmVlc3RhbmRpbmciLCJHbG9iYWwgLyBDVCAvIGJvZHlfeWF3IiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIENUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfbCIsIkdsb2JhbCAvIENUIC8gYm9keV95YXciLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIENUIC8gYm9keV95YXciLCJEZWZhdWx0IixudWxsLG51bGwsWyJtb2RlIiwiR2xvYmFsIC8gQ1QgLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBDVCAvIGJvZHlfeWF3Iiw2MC4wLG51bGwsbnVsbCxbImxpbWl0X3IiLCJHbG9iYWwgLyBDVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBDVCAvIGJvZHlfeWF3IixbXSxudWxsLG51bGwsWyJvcHRpb25zIiwiR2xvYmFsIC8gQ1QgLyBib2R5X3lhdyIsInNlbGVjdGFibGUiXV0sWyJjb21ibyIsImFudGkgYWltIiwiR2xvYmFsIC8gVCAvIHBpdGNoIiwiRGlzYWJsZWQiXSxbInN3aXRjaCIsImFudGkgYWltIiwiR2xvYmFsIC8gVCAvIGRlZmVuc2l2ZV9hYSIsZmFsc2VdLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBUIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbImxjIiwiR2xvYmFsIC8gVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBUIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbInBpdGNoIiwiR2xvYmFsIC8gVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldCIsIkdsb2JhbCAvIFQgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIFQgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzEiLCJHbG9iYWwgLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0IiwiR2xvYmFsIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiR2xvYmFsIC8gVCAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJ5YXciLCJHbG9iYWwgLyBUIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkdsb2JhbCAvIFQgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzIiLCJHbG9iYWwgLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJHbG9iYWwgLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X3NwZWVkIiwiR2xvYmFsIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiR2xvYmFsIC8gVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8yIiwiR2xvYmFsIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiR2xvYmFsIC8gVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8xIiwiR2xvYmFsIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJtYW51YWwiLCJBdCBUYXJnZXQiXSxbImNvbWJvIiwiYW50aSBhaW0iLCJtYW51YWwiLDAuMCxudWxsLG51bGwsWyJtYWduZXQiLCJtYW51YWwiLCJob3RrZXkiXV0sWyJjb21ibyIsImFudGkgYWltIiwibWFudWFsIixmYWxzZSxudWxsLG51bGwsWyJzdGF0aWMiLCJtYW51YWwiLCJzd2l0Y2giXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkluIEFpciAvIENUIC8gYm9keV95YXciLGZhbHNlXSxbInN3aXRjaCIsImFudGkgYWltIiwiSW4gQWlyIC8gQ1QgLyBib2R5X3lhdyIsMC4wLG51bGwsbnVsbCxbImRlbGF5IiwiSW4gQWlyIC8gQ1QgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiSW4gQWlyIC8gQ1QgLyBib2R5X3lhdyIsIk9mZiIsbnVsbCxudWxsLFsiZnJlZXN0YW5kaW5nIiwiSW4gQWlyIC8gQ1QgLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBDVCAvIGJvZHlfeWF3Iiw2MC4wLG51bGwsbnVsbCxbImxpbWl0X2wiLCJJbiBBaXIgLyBDVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBDVCAvIGJvZHlfeWF3IiwiRGVmYXVsdCIsbnVsbCxudWxsLFsibW9kZSIsIkluIEFpciAvIENUIC8gYm9keV95YXciLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiSW4gQWlyIC8gQ1QgLyBib2R5X3lhdyIsNjAuMCxudWxsLG51bGwsWyJsaW1pdF9yIiwiSW4gQWlyIC8gQ1QgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiSW4gQWlyIC8gQ1QgLyBib2R5X3lhdyIsW10sbnVsbCxudWxsLFsib3B0aW9ucyIsIkluIEFpciAvIENUIC8gYm9keV95YXciLCJzZWxlY3RhYmxlIl1dLFsic2VsZWN0YWJsZSIsImFudGkgYWltIiwic2FmZSIsW11dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJmcmVlc3RhbmRpbmciLGZhbHNlXSxbInN3aXRjaCIsImFudGkgYWltIiwiZnJlZXN0YW5kaW5nIixmYWxzZSxudWxsLG51bGwsWyJCRiIsImZyZWVzdGFuZGluZyIsInN3aXRjaCJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiZnJlZXN0YW5kaW5nIixbXSxudWxsLG51bGwsWyJkaXNhYmxlcnMiLCJmcmVlc3RhbmRpbmciLCJzZWxlY3RhYmxlIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJmcmVlc3RhbmRpbmciLGZhbHNlLG51bGwsbnVsbCxbIkRZTSIsImZyZWVzdGFuZGluZyIsInN3aXRjaCJdXSxbInNlbGVjdGFibGUiLCJhbnRpIGFpbSIsInR3ZWFrcyIsW11dLFsic2VsZWN0YWJsZSIsImFudGkgYWltIiwidHdlYWtzIiwiQWx3YXlzIE9uIixudWxsLG51bGwsWyJlZGdlX3lhdyIsInR3ZWFrcyIsImNvbWJvIl1dLFsic2VsZWN0YWJsZSIsImFudGkgYWltIiwidHdlYWtzIixmYWxzZSxudWxsLG51bGwsWyJpbl9haXIiLCJ0d2Vha3MiLCJzd2l0Y2giXV0sWyJzZWxlY3RhYmxlIiwiYW50aSBhaW0iLCJ0d2Vha3MiLDAuMCxudWxsLG51bGwsWyJkZWxheSIsInR3ZWFrcyIsInNsaWRlciJdXSxbInNlbGVjdGFibGUiLCJhbnRpIGFpbSIsInR3ZWFrcyIsW10sbnVsbCxudWxsLFsid2VhcG9uIiwidHdlYWtzIiwic2VsZWN0YWJsZSJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBDVCAvIGJvZHlfeWF3IixmYWxzZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlN0YW5kaW5nIC8gQ1QgLyBib2R5X3lhdyIsMC4wLG51bGwsbnVsbCxbImRlbGF5IiwiU3RhbmRpbmcgLyBDVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIENUIC8gYm9keV95YXciLCJPZmYiLG51bGwsbnVsbCxbImZyZWVzdGFuZGluZyIsIlN0YW5kaW5nIC8gQ1QgLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIENUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfbCIsIlN0YW5kaW5nIC8gQ1QgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBDVCAvIGJvZHlfeWF3IiwiRGVmYXVsdCIsbnVsbCxudWxsLFsibW9kZSIsIlN0YW5kaW5nIC8gQ1QgLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTdGFuZGluZyAvIENUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfciIsIlN0YW5kaW5nIC8gQ1QgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU3RhbmRpbmcgLyBDVCAvIGJvZHlfeWF3IixbXSxudWxsLG51bGwsWyJvcHRpb25zIiwiU3RhbmRpbmcgLyBDVCAvIGJvZHlfeWF3Iiwic2VsZWN0YWJsZSJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gQ1QgLyBlbmFibGUiLGZhbHNlXSxbImNvbWJvIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBDVCAvIHBpdGNoIiwiRGlzYWJsZWQiXSxbImNvbWJvIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBDVCAvIHlhdyIsIkRpc2FibGVkIl0sWyJjb21ibyIsImFudGkgYWltIiwiTW92aW5nIC8gQ1QgLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJNb3ZpbmcgLyBDVCAvIHlhdyIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBDVCAvIHlhdyIsIlN0YXRpYyIsbnVsbCxudWxsLFsibW9kZSIsIk1vdmluZyAvIENUIC8geWF3IiwiY29tYm8iXV0sWyJjb21ibyIsImFudGkgYWltIiwiTW92aW5nIC8gQ1QgLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfbCIsIk1vdmluZyAvIENUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIk1vdmluZyAvIENUIC8geWF3IiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X3IiLCJNb3ZpbmcgLyBDVCAvIHlhdyIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBDVCAvIHlhd19tb2RpZmllciIsIkRpc2FibGVkIl0sWyJjb21ibyIsImFudGkgYWltIiwiTW92aW5nIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJNb3ZpbmcgLyBDVCAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBDVCAvIHlhd19tb2RpZmllciIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9yIiwiTW92aW5nIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiTW92aW5nIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLDEuMCxudWxsLG51bGwsWyJ0aWNrIiwiTW92aW5nIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiTW92aW5nIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfbCIsIk1vdmluZyAvIENUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIk1vdmluZyAvIENUIC8geWF3X21vZGlmaWVyIiwiU3RhdGljIixudWxsLG51bGwsWyJtb2RlIiwiTW92aW5nIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gQ1QgLyBib2R5X3lhdyIsZmFsc2VdLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBDVCAvIGJvZHlfeWF3IiwwLjAsbnVsbCxudWxsLFsiZGVsYXkiLCJNb3ZpbmcgLyBDVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBDVCAvIGJvZHlfeWF3IiwiT2ZmIixudWxsLG51bGwsWyJmcmVlc3RhbmRpbmciLCJNb3ZpbmcgLyBDVCAvIGJvZHlfeWF3IiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIk1vdmluZyAvIENUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfbCIsIk1vdmluZyAvIENUIC8gYm9keV95YXciLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIk1vdmluZyAvIENUIC8gYm9keV95YXciLCJEZWZhdWx0IixudWxsLG51bGwsWyJtb2RlIiwiTW92aW5nIC8gQ1QgLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBDVCAvIGJvZHlfeWF3Iiw2MC4wLG51bGwsbnVsbCxbImxpbWl0X3IiLCJNb3ZpbmcgLyBDVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBDVCAvIGJvZHlfeWF3IixbXSxudWxsLG51bGwsWyJvcHRpb25zIiwiTW92aW5nIC8gQ1QgLyBib2R5X3lhdyIsInNlbGVjdGFibGUiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIk1vdmluZyAvIENUIC8gZGVmZW5zaXZlX2FhIixmYWxzZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIk1vdmluZyAvIENUIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbImxjIiwiTW92aW5nIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJEaXNhYmxlZCIsbnVsbCxudWxsLFsicGl0Y2giLCJNb3ZpbmcgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInlhd19vZmZzZXQiLCJNb3ZpbmcgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzEiLCJNb3ZpbmcgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJwaXRjaF9vZmZzZXQiLCJNb3ZpbmcgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJEaXNhYmxlZCIsbnVsbCxudWxsLFsieWF3IiwiTW92aW5nIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzIiLCJNb3ZpbmcgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfc3BlZWQiLCJNb3ZpbmcgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJwaXRjaF9vZmZzZXRfMiIsIk1vdmluZyAvIENUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8xIiwiTW92aW5nIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIk1vdmluZyAvIFQgLyBlbmFibGUiLGZhbHNlXSxbImNvbWJvIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBUIC8gcGl0Y2giLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIk1vdmluZyAvIFQgLyB5YXciLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIk1vdmluZyAvIFQgLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJNb3ZpbmcgLyBUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIk1vdmluZyAvIFQgLyB5YXciLCJTdGF0aWMiLG51bGwsbnVsbCxbIm1vZGUiLCJNb3ZpbmcgLyBUIC8geWF3IiwiY29tYm8iXV0sWyJjb21ibyIsImFudGkgYWltIiwiTW92aW5nIC8gVCAvIHlhdyIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9sIiwiTW92aW5nIC8gVCAvIHlhdyIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBUIC8geWF3IiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X3IiLCJNb3ZpbmcgLyBUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIk1vdmluZyAvIFQgLyB5YXdfbW9kaWZpZXIiLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIk1vdmluZyAvIFQgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJNb3ZpbmcgLyBUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIk1vdmluZyAvIFQgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfciIsIk1vdmluZyAvIFQgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiTW92aW5nIC8gVCAvIHlhd19tb2RpZmllciIsMS4wLG51bGwsbnVsbCxbInRpY2siLCJNb3ZpbmcgLyBUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIk1vdmluZyAvIFQgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfbCIsIk1vdmluZyAvIFQgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiTW92aW5nIC8gVCAvIHlhd19tb2RpZmllciIsIlN0YXRpYyIsbnVsbCxudWxsLFsibW9kZSIsIk1vdmluZyAvIFQgLyB5YXdfbW9kaWZpZXIiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gVCAvIGJvZHlfeWF3IixmYWxzZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIk1vdmluZyAvIFQgLyBib2R5X3lhdyIsMC4wLG51bGwsbnVsbCxbImRlbGF5IiwiTW92aW5nIC8gVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBUIC8gYm9keV95YXciLCJPZmYiLG51bGwsbnVsbCxbImZyZWVzdGFuZGluZyIsIk1vdmluZyAvIFQgLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfbCIsIk1vdmluZyAvIFQgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gVCAvIGJvZHlfeWF3IiwiRGVmYXVsdCIsbnVsbCxudWxsLFsibW9kZSIsIk1vdmluZyAvIFQgLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfciIsIk1vdmluZyAvIFQgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gVCAvIGJvZHlfeWF3IixbXSxudWxsLG51bGwsWyJvcHRpb25zIiwiTW92aW5nIC8gVCAvIGJvZHlfeWF3Iiwic2VsZWN0YWJsZSJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gVCAvIGRlZmVuc2l2ZV9hYSIsZmFsc2VdLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBUIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbImxjIiwiTW92aW5nIC8gVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBUIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbInBpdGNoIiwiTW92aW5nIC8gVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldCIsIk1vdmluZyAvIFQgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIk1vdmluZyAvIFQgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzEiLCJNb3ZpbmcgLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0IiwiTW92aW5nIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gVCAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJ5YXciLCJNb3ZpbmcgLyBUIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIk1vdmluZyAvIFQgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzIiLCJNb3ZpbmcgLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJNb3ZpbmcgLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X3NwZWVkIiwiTW92aW5nIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8yIiwiTW92aW5nIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiTW92aW5nIC8gVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8xIiwiTW92aW5nIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gTiAvIGVuYWJsZSIsdHJ1ZV0sWyJjb21ibyIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gTiAvIHBpdGNoIiwiRG93biJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIE4gLyB5YXciLCJCYWNrd2FyZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIE4gLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJTbG93IE1vdmUgLyBOIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIE4gLyB5YXciLCJMICYgUiIsbnVsbCxudWxsLFsibW9kZSIsIlNsb3cgTW92ZSAvIE4gLyB5YXciLCJjb21ibyJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBOIC8geWF3IiwtMzAuMCxudWxsLG51bGwsWyJvZmZzZXRfbCIsIlNsb3cgTW92ZSAvIE4gLyB5YXciLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gTiAvIHlhdyIsNDIuMCxudWxsLG51bGwsWyJvZmZzZXRfciIsIlNsb3cgTW92ZSAvIE4gLyB5YXciLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gTiAvIHlhd19tb2RpZmllciIsIlByb2dyZXNzaXZlIl0sWyJjb21ibyIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gTiAvIHlhd19tb2RpZmllciIsLTE3LjAsbnVsbCxudWxsLFsib2Zmc2V0IiwiU2xvdyBNb3ZlIC8gTiAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBOIC8geWF3X21vZGlmaWVyIiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X3IiLCJTbG93IE1vdmUgLyBOIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIE4gLyB5YXdfbW9kaWZpZXIiLDEuMCxudWxsLG51bGwsWyJ0aWNrIiwiU2xvdyBNb3ZlIC8gTiAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBOIC8geWF3X21vZGlmaWVyIiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X2wiLCJTbG93IE1vdmUgLyBOIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIE4gLyB5YXdfbW9kaWZpZXIiLCJTdGF0aWMiLG51bGwsbnVsbCxbIm1vZGUiLCJTbG93IE1vdmUgLyBOIC8geWF3X21vZGlmaWVyIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIE4gLyBib2R5X3lhdyIsdHJ1ZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIE4gLyBib2R5X3lhdyIsMTUuMCxudWxsLG51bGwsWyJkZWxheSIsIlNsb3cgTW92ZSAvIE4gLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gTiAvIGJvZHlfeWF3IiwiT2ZmIixudWxsLG51bGwsWyJmcmVlc3RhbmRpbmciLCJTbG93IE1vdmUgLyBOIC8gYm9keV95YXciLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gTiAvIGJvZHlfeWF3Iiw2MC4wLG51bGwsbnVsbCxbImxpbWl0X2wiLCJTbG93IE1vdmUgLyBOIC8gYm9keV95YXciLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIE4gLyBib2R5X3lhdyIsIkRlZmF1bHQiLG51bGwsbnVsbCxbIm1vZGUiLCJTbG93IE1vdmUgLyBOIC8gYm9keV95YXciLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gTiAvIGJvZHlfeWF3Iiw2MC4wLG51bGwsbnVsbCxbImxpbWl0X3IiLCJTbG93IE1vdmUgLyBOIC8gYm9keV95YXciLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIE4gLyBib2R5X3lhdyIsWyJKaXR0ZXIiXSxudWxsLG51bGwsWyJvcHRpb25zIiwiU2xvdyBNb3ZlIC8gTiAvIGJvZHlfeWF3Iiwic2VsZWN0YWJsZSJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gTiAvIGRlZmVuc2l2ZV9hYSIsZmFsc2VdLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBOIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbImxjIiwiU2xvdyBNb3ZlIC8gTiAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBOIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbInBpdGNoIiwiU2xvdyBNb3ZlIC8gTiAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBOIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldCIsIlNsb3cgTW92ZSAvIE4gLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIE4gLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzEiLCJTbG93IE1vdmUgLyBOIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBOIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0IiwiU2xvdyBNb3ZlIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gTiAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJ5YXciLCJTbG93IE1vdmUgLyBOIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIE4gLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzIiLCJTbG93IE1vdmUgLyBOIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBOIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X3NwZWVkIiwiU2xvdyBNb3ZlIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gTiAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8yIiwiU2xvdyBNb3ZlIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gTiAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8xIiwiU2xvdyBNb3ZlIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gQ1QgLyBlbmFibGUiLGZhbHNlXSxbImNvbWJvIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBDVCAvIHBpdGNoIiwiRGlzYWJsZWQiXSxbImNvbWJvIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBDVCAvIHlhdyIsIkRpc2FibGVkIl0sWyJjb21ibyIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gQ1QgLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJTbG93IE1vdmUgLyBDVCAvIHlhdyIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBDVCAvIHlhdyIsIlN0YXRpYyIsbnVsbCxudWxsLFsibW9kZSIsIlNsb3cgTW92ZSAvIENUIC8geWF3IiwiY29tYm8iXV0sWyJjb21ibyIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gQ1QgLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfbCIsIlNsb3cgTW92ZSAvIENUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIENUIC8geWF3IiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X3IiLCJTbG93IE1vdmUgLyBDVCAvIHlhdyIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBDVCAvIHlhd19tb2RpZmllciIsIkRpc2FibGVkIl0sWyJjb21ibyIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJTbG93IE1vdmUgLyBDVCAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBDVCAvIHlhd19tb2RpZmllciIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9yIiwiU2xvdyBNb3ZlIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLDEuMCxudWxsLG51bGwsWyJ0aWNrIiwiU2xvdyBNb3ZlIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfbCIsIlNsb3cgTW92ZSAvIENUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIENUIC8geWF3X21vZGlmaWVyIiwiU3RhdGljIixudWxsLG51bGwsWyJtb2RlIiwiU2xvdyBNb3ZlIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gQ1QgLyBib2R5X3lhdyIsZmFsc2VdLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBDVCAvIGJvZHlfeWF3IiwwLjAsbnVsbCxudWxsLFsiZGVsYXkiLCJTbG93IE1vdmUgLyBDVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBDVCAvIGJvZHlfeWF3IiwiT2ZmIixudWxsLG51bGwsWyJmcmVlc3RhbmRpbmciLCJTbG93IE1vdmUgLyBDVCAvIGJvZHlfeWF3IiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIENUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfbCIsIlNsb3cgTW92ZSAvIENUIC8gYm9keV95YXciLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIENUIC8gYm9keV95YXciLCJEZWZhdWx0IixudWxsLG51bGwsWyJtb2RlIiwiU2xvdyBNb3ZlIC8gQ1QgLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBDVCAvIGJvZHlfeWF3Iiw2MC4wLG51bGwsbnVsbCxbImxpbWl0X3IiLCJTbG93IE1vdmUgLyBDVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBDVCAvIGJvZHlfeWF3IixbXSxudWxsLG51bGwsWyJvcHRpb25zIiwiU2xvdyBNb3ZlIC8gQ1QgLyBib2R5X3lhdyIsInNlbGVjdGFibGUiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIENUIC8gZGVmZW5zaXZlX2FhIixmYWxzZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIENUIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbImxjIiwiU2xvdyBNb3ZlIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJEaXNhYmxlZCIsbnVsbCxudWxsLFsicGl0Y2giLCJTbG93IE1vdmUgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInlhd19vZmZzZXQiLCJTbG93IE1vdmUgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzEiLCJTbG93IE1vdmUgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJwaXRjaF9vZmZzZXQiLCJTbG93IE1vdmUgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJEaXNhYmxlZCIsbnVsbCxudWxsLFsieWF3IiwiU2xvdyBNb3ZlIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzIiLCJTbG93IE1vdmUgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfc3BlZWQiLCJTbG93IE1vdmUgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJwaXRjaF9vZmZzZXRfMiIsIlNsb3cgTW92ZSAvIENUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8xIiwiU2xvdyBNb3ZlIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIFQgLyBlbmFibGUiLGZhbHNlXSxbImNvbWJvIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBUIC8gcGl0Y2giLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIFQgLyB5YXciLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIFQgLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJTbG93IE1vdmUgLyBUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIFQgLyB5YXciLCJTdGF0aWMiLG51bGwsbnVsbCxbIm1vZGUiLCJTbG93IE1vdmUgLyBUIC8geWF3IiwiY29tYm8iXV0sWyJjb21ibyIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gVCAvIHlhdyIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9sIiwiU2xvdyBNb3ZlIC8gVCAvIHlhdyIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBUIC8geWF3IiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X3IiLCJTbG93IE1vdmUgLyBUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIFQgLyB5YXdfbW9kaWZpZXIiLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIFQgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJTbG93IE1vdmUgLyBUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIFQgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfciIsIlNsb3cgTW92ZSAvIFQgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gVCAvIHlhd19tb2RpZmllciIsMS4wLG51bGwsbnVsbCxbInRpY2siLCJTbG93IE1vdmUgLyBUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIFQgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfbCIsIlNsb3cgTW92ZSAvIFQgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gVCAvIHlhd19tb2RpZmllciIsIlN0YXRpYyIsbnVsbCxudWxsLFsibW9kZSIsIlNsb3cgTW92ZSAvIFQgLyB5YXdfbW9kaWZpZXIiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gVCAvIGJvZHlfeWF3IixmYWxzZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIFQgLyBib2R5X3lhdyIsMC4wLG51bGwsbnVsbCxbImRlbGF5IiwiU2xvdyBNb3ZlIC8gVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBUIC8gYm9keV95YXciLCJPZmYiLG51bGwsbnVsbCxbImZyZWVzdGFuZGluZyIsIlNsb3cgTW92ZSAvIFQgLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfbCIsIlNsb3cgTW92ZSAvIFQgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gVCAvIGJvZHlfeWF3IiwiRGVmYXVsdCIsbnVsbCxudWxsLFsibW9kZSIsIlNsb3cgTW92ZSAvIFQgLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfciIsIlNsb3cgTW92ZSAvIFQgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gVCAvIGJvZHlfeWF3IixbXSxudWxsLG51bGwsWyJvcHRpb25zIiwiU2xvdyBNb3ZlIC8gVCAvIGJvZHlfeWF3Iiwic2VsZWN0YWJsZSJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gVCAvIGRlZmVuc2l2ZV9hYSIsZmFsc2VdLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBUIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbImxjIiwiU2xvdyBNb3ZlIC8gVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBUIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbInBpdGNoIiwiU2xvdyBNb3ZlIC8gVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldCIsIlNsb3cgTW92ZSAvIFQgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIFQgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzEiLCJTbG93IE1vdmUgLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0IiwiU2xvdyBNb3ZlIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gVCAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJ5YXciLCJTbG93IE1vdmUgLyBUIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIlNsb3cgTW92ZSAvIFQgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzIiLCJTbG93IE1vdmUgLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJTbG93IE1vdmUgLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X3NwZWVkIiwiU2xvdyBNb3ZlIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8yIiwiU2xvdyBNb3ZlIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiU2xvdyBNb3ZlIC8gVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8xIiwiU2xvdyBNb3ZlIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gTiAvIGVuYWJsZSIsdHJ1ZV0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIC8gTiAvIHBpdGNoIiwiRG93biJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCAvIE4gLyB5YXciLCJCYWNrd2FyZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCAvIE4gLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJDcm91Y2ggLyBOIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCAvIE4gLyB5YXciLCJMICYgUiIsbnVsbCxudWxsLFsibW9kZSIsIkNyb3VjaCAvIE4gLyB5YXciLCJjb21ibyJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBOIC8geWF3IiwtMjUuMCxudWxsLG51bGwsWyJvZmZzZXRfbCIsIkNyb3VjaCAvIE4gLyB5YXciLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIC8gTiAvIHlhdyIsNDYuMCxudWxsLG51bGwsWyJvZmZzZXRfciIsIkNyb3VjaCAvIE4gLyB5YXciLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIC8gTiAvIHlhd19tb2RpZmllciIsIkRpc2FibGVkIl0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIC8gTiAvIHlhd19tb2RpZmllciIsLTE3LjAsbnVsbCxudWxsLFsib2Zmc2V0IiwiQ3JvdWNoIC8gTiAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBOIC8geWF3X21vZGlmaWVyIiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X3IiLCJDcm91Y2ggLyBOIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCAvIE4gLyB5YXdfbW9kaWZpZXIiLDEuMCxudWxsLG51bGwsWyJ0aWNrIiwiQ3JvdWNoIC8gTiAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBOIC8geWF3X21vZGlmaWVyIiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X2wiLCJDcm91Y2ggLyBOIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCAvIE4gLyB5YXdfbW9kaWZpZXIiLCJTdGF0aWMiLG51bGwsbnVsbCxbIm1vZGUiLCJDcm91Y2ggLyBOIC8geWF3X21vZGlmaWVyIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCAvIE4gLyBib2R5X3lhdyIsdHJ1ZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCAvIE4gLyBib2R5X3lhdyIsMTguMCxudWxsLG51bGwsWyJkZWxheSIsIkNyb3VjaCAvIE4gLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gTiAvIGJvZHlfeWF3IiwiT2ZmIixudWxsLG51bGwsWyJmcmVlc3RhbmRpbmciLCJDcm91Y2ggLyBOIC8gYm9keV95YXciLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gTiAvIGJvZHlfeWF3Iiw2MC4wLG51bGwsbnVsbCxbImxpbWl0X2wiLCJDcm91Y2ggLyBOIC8gYm9keV95YXciLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCAvIE4gLyBib2R5X3lhdyIsIkRlZmF1bHQiLG51bGwsbnVsbCxbIm1vZGUiLCJDcm91Y2ggLyBOIC8gYm9keV95YXciLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gTiAvIGJvZHlfeWF3Iiw2MC4wLG51bGwsbnVsbCxbImxpbWl0X3IiLCJDcm91Y2ggLyBOIC8gYm9keV95YXciLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCAvIE4gLyBib2R5X3lhdyIsWyJKaXR0ZXIiXSxudWxsLG51bGwsWyJvcHRpb25zIiwiQ3JvdWNoIC8gTiAvIGJvZHlfeWF3Iiwic2VsZWN0YWJsZSJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gTiAvIGRlZmVuc2l2ZV9hYSIsdHJ1ZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCAvIE4gLyBkZWZlbnNpdmVfYWEiLCJPbiBQZWVrIixudWxsLG51bGwsWyJsYyIsIkNyb3VjaCAvIE4gLyBkZWZlbnNpdmVfYWEiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gTiAvIGRlZmVuc2l2ZV9hYSIsIkF1dG9tYXRpYyIsbnVsbCxudWxsLFsicGl0Y2giLCJDcm91Y2ggLyBOIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCAvIE4gLyBkZWZlbnNpdmVfYWEiLDE0NS4wLG51bGwsbnVsbCxbInlhd19vZmZzZXQiLCJDcm91Y2ggLyBOIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBOIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldF8xIiwiQ3JvdWNoIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gTiAvIGRlZmVuc2l2ZV9hYSIsLTI4LjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0IiwiQ3JvdWNoIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gTiAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJ5YXciLCJDcm91Y2ggLyBOIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCAvIE4gLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzIiLCJDcm91Y2ggLyBOIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBOIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X3NwZWVkIiwiQ3JvdWNoIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gTiAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8yIiwiQ3JvdWNoIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gTiAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8xIiwiQ3JvdWNoIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gQ1QgLyBlbmFibGUiLGZhbHNlXSxbImNvbWJvIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBDVCAvIHBpdGNoIiwiRGlzYWJsZWQiXSxbImNvbWJvIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBDVCAvIHlhdyIsIkRpc2FibGVkIl0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIC8gQ1QgLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJDcm91Y2ggLyBDVCAvIHlhdyIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBDVCAvIHlhdyIsIlN0YXRpYyIsbnVsbCxudWxsLFsibW9kZSIsIkNyb3VjaCAvIENUIC8geWF3IiwiY29tYm8iXV0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIC8gQ1QgLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfbCIsIkNyb3VjaCAvIENUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCAvIENUIC8geWF3IiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X3IiLCJDcm91Y2ggLyBDVCAvIHlhdyIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBDVCAvIHlhd19tb2RpZmllciIsIkRpc2FibGVkIl0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJDcm91Y2ggLyBDVCAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBDVCAvIHlhd19tb2RpZmllciIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9yIiwiQ3JvdWNoIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLDEuMCxudWxsLG51bGwsWyJ0aWNrIiwiQ3JvdWNoIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfbCIsIkNyb3VjaCAvIENUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCAvIENUIC8geWF3X21vZGlmaWVyIiwiU3RhdGljIixudWxsLG51bGwsWyJtb2RlIiwiQ3JvdWNoIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gQ1QgLyBib2R5X3lhdyIsZmFsc2VdLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBDVCAvIGJvZHlfeWF3IiwwLjAsbnVsbCxudWxsLFsiZGVsYXkiLCJDcm91Y2ggLyBDVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBDVCAvIGJvZHlfeWF3IiwiT2ZmIixudWxsLG51bGwsWyJmcmVlc3RhbmRpbmciLCJDcm91Y2ggLyBDVCAvIGJvZHlfeWF3IiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCAvIENUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfbCIsIkNyb3VjaCAvIENUIC8gYm9keV95YXciLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCAvIENUIC8gYm9keV95YXciLCJEZWZhdWx0IixudWxsLG51bGwsWyJtb2RlIiwiQ3JvdWNoIC8gQ1QgLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBDVCAvIGJvZHlfeWF3Iiw2MC4wLG51bGwsbnVsbCxbImxpbWl0X3IiLCJDcm91Y2ggLyBDVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBDVCAvIGJvZHlfeWF3IixbXSxudWxsLG51bGwsWyJvcHRpb25zIiwiQ3JvdWNoIC8gQ1QgLyBib2R5X3lhdyIsInNlbGVjdGFibGUiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCAvIENUIC8gZGVmZW5zaXZlX2FhIixmYWxzZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCAvIENUIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbImxjIiwiQ3JvdWNoIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJEaXNhYmxlZCIsbnVsbCxudWxsLFsicGl0Y2giLCJDcm91Y2ggLyBDVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBDVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInlhd19vZmZzZXQiLCJDcm91Y2ggLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzEiLCJDcm91Y2ggLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJwaXRjaF9vZmZzZXQiLCJDcm91Y2ggLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJEaXNhYmxlZCIsbnVsbCxudWxsLFsieWF3IiwiQ3JvdWNoIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzIiLCJDcm91Y2ggLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfc3BlZWQiLCJDcm91Y2ggLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJwaXRjaF9vZmZzZXRfMiIsIkNyb3VjaCAvIENUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBDVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8xIiwiQ3JvdWNoIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCAvIFQgLyBlbmFibGUiLGZhbHNlXSxbImNvbWJvIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBUIC8gcGl0Y2giLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCAvIFQgLyB5YXciLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCAvIFQgLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJDcm91Y2ggLyBUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCAvIFQgLyB5YXciLCJTdGF0aWMiLG51bGwsbnVsbCxbIm1vZGUiLCJDcm91Y2ggLyBUIC8geWF3IiwiY29tYm8iXV0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIC8gVCAvIHlhdyIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9sIiwiQ3JvdWNoIC8gVCAvIHlhdyIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBUIC8geWF3IiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X3IiLCJDcm91Y2ggLyBUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCAvIFQgLyB5YXdfbW9kaWZpZXIiLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCAvIFQgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJDcm91Y2ggLyBUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCAvIFQgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfciIsIkNyb3VjaCAvIFQgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIC8gVCAvIHlhd19tb2RpZmllciIsMS4wLG51bGwsbnVsbCxbInRpY2siLCJDcm91Y2ggLyBUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCAvIFQgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfbCIsIkNyb3VjaCAvIFQgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIC8gVCAvIHlhd19tb2RpZmllciIsIlN0YXRpYyIsbnVsbCxudWxsLFsibW9kZSIsIkNyb3VjaCAvIFQgLyB5YXdfbW9kaWZpZXIiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gVCAvIGJvZHlfeWF3IixmYWxzZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCAvIFQgLyBib2R5X3lhdyIsMC4wLG51bGwsbnVsbCxbImRlbGF5IiwiQ3JvdWNoIC8gVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBUIC8gYm9keV95YXciLCJPZmYiLG51bGwsbnVsbCxbImZyZWVzdGFuZGluZyIsIkNyb3VjaCAvIFQgLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfbCIsIkNyb3VjaCAvIFQgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gVCAvIGJvZHlfeWF3IiwiRGVmYXVsdCIsbnVsbCxudWxsLFsibW9kZSIsIkNyb3VjaCAvIFQgLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfciIsIkNyb3VjaCAvIFQgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gVCAvIGJvZHlfeWF3IixbXSxudWxsLG51bGwsWyJvcHRpb25zIiwiQ3JvdWNoIC8gVCAvIGJvZHlfeWF3Iiwic2VsZWN0YWJsZSJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gVCAvIGRlZmVuc2l2ZV9hYSIsZmFsc2VdLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBUIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbImxjIiwiQ3JvdWNoIC8gVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBUIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbInBpdGNoIiwiQ3JvdWNoIC8gVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldCIsIkNyb3VjaCAvIFQgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCAvIFQgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzEiLCJDcm91Y2ggLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0IiwiQ3JvdWNoIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gVCAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJ5YXciLCJDcm91Y2ggLyBUIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCAvIFQgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzIiLCJDcm91Y2ggLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X3NwZWVkIiwiQ3JvdWNoIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8yIiwiQ3JvdWNoIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIC8gVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8xIiwiQ3JvdWNoIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBOIC8gZW5hYmxlIix0cnVlXSxbImNvbWJvIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIE4gLyBwaXRjaCIsIkRvd24iXSxbImNvbWJvIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIE4gLyB5YXciLCJCYWNrd2FyZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gTiAvIHlhdyIsMC4wLG51bGwsbnVsbCxbIm9mZnNldCIsIkNyb3VjaCBNb3ZlIC8gTiAvIHlhdyIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIE4gLyB5YXciLCJMICYgUiIsbnVsbCxudWxsLFsibW9kZSIsIkNyb3VjaCBNb3ZlIC8gTiAvIHlhdyIsImNvbWJvIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gTiAvIHlhdyIsLTI1LjAsbnVsbCxudWxsLFsib2Zmc2V0X2wiLCJDcm91Y2ggTW92ZSAvIE4gLyB5YXciLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBOIC8geWF3Iiw0Ni4wLG51bGwsbnVsbCxbIm9mZnNldF9yIiwiQ3JvdWNoIE1vdmUgLyBOIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gTiAvIHlhd19tb2RpZmllciIsIkRpc2FibGVkIl0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBOIC8geWF3X21vZGlmaWVyIiwtMjQuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJDcm91Y2ggTW92ZSAvIE4gLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBOIC8geWF3X21vZGlmaWVyIiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X3IiLCJDcm91Y2ggTW92ZSAvIE4gLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBOIC8geWF3X21vZGlmaWVyIiwxLjAsbnVsbCxudWxsLFsidGljayIsIkNyb3VjaCBNb3ZlIC8gTiAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIE4gLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfbCIsIkNyb3VjaCBNb3ZlIC8gTiAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIE4gLyB5YXdfbW9kaWZpZXIiLCJTdGF0aWMiLG51bGwsbnVsbCxbIm1vZGUiLCJDcm91Y2ggTW92ZSAvIE4gLyB5YXdfbW9kaWZpZXIiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBOIC8gYm9keV95YXciLHRydWVdLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIE4gLyBib2R5X3lhdyIsMTguMCxudWxsLG51bGwsWyJkZWxheSIsIkNyb3VjaCBNb3ZlIC8gTiAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIE4gLyBib2R5X3lhdyIsIk9mZiIsbnVsbCxudWxsLFsiZnJlZXN0YW5kaW5nIiwiQ3JvdWNoIE1vdmUgLyBOIC8gYm9keV95YXciLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBOIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfbCIsIkNyb3VjaCBNb3ZlIC8gTiAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIE4gLyBib2R5X3lhdyIsIkRlZmF1bHQiLG51bGwsbnVsbCxbIm1vZGUiLCJDcm91Y2ggTW92ZSAvIE4gLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIE4gLyBib2R5X3lhdyIsNjAuMCxudWxsLG51bGwsWyJsaW1pdF9yIiwiQ3JvdWNoIE1vdmUgLyBOIC8gYm9keV95YXciLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gTiAvIGJvZHlfeWF3IixbIkppdHRlciJdLG51bGwsbnVsbCxbIm9wdGlvbnMiLCJDcm91Y2ggTW92ZSAvIE4gLyBib2R5X3lhdyIsInNlbGVjdGFibGUiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gTiAvIGRlZmVuc2l2ZV9hYSIsdHJ1ZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gTiAvIGRlZmVuc2l2ZV9hYSIsIk9uIFBlZWsiLG51bGwsbnVsbCxbImxjIiwiQ3JvdWNoIE1vdmUgLyBOIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gTiAvIGRlZmVuc2l2ZV9hYSIsIkF1dG9tYXRpYyIsbnVsbCxudWxsLFsicGl0Y2giLCJDcm91Y2ggTW92ZSAvIE4gLyBkZWZlbnNpdmVfYWEiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBOIC8gZGVmZW5zaXZlX2FhIiwxNDUuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0IiwiQ3JvdWNoIE1vdmUgLyBOIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIE4gLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzEiLCJDcm91Y2ggTW92ZSAvIE4gLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gTiAvIGRlZmVuc2l2ZV9hYSIsLTMxLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0IiwiQ3JvdWNoIE1vdmUgLyBOIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIE4gLyBkZWZlbnNpdmVfYWEiLCJEaXNhYmxlZCIsbnVsbCxudWxsLFsieWF3IiwiQ3JvdWNoIE1vdmUgLyBOIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gTiAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInlhd19vZmZzZXRfMiIsIkNyb3VjaCBNb3ZlIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBOIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X3NwZWVkIiwiQ3JvdWNoIE1vdmUgLyBOIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIE4gLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJwaXRjaF9vZmZzZXRfMiIsIkNyb3VjaCBNb3ZlIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBOIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0XzEiLCJDcm91Y2ggTW92ZSAvIE4gLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gQ1QgLyBlbmFibGUiLGZhbHNlXSxbImNvbWJvIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIENUIC8gcGl0Y2giLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gQ1QgLyB5YXciLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gQ1QgLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJDcm91Y2ggTW92ZSAvIENUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gQ1QgLyB5YXciLCJTdGF0aWMiLG51bGwsbnVsbCxbIm1vZGUiLCJDcm91Y2ggTW92ZSAvIENUIC8geWF3IiwiY29tYm8iXV0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBDVCAvIHlhdyIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9sIiwiQ3JvdWNoIE1vdmUgLyBDVCAvIHlhdyIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIENUIC8geWF3IiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X3IiLCJDcm91Y2ggTW92ZSAvIENUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJDcm91Y2ggTW92ZSAvIENUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfciIsIkNyb3VjaCBNb3ZlIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBDVCAvIHlhd19tb2RpZmllciIsMS4wLG51bGwsbnVsbCxbInRpY2siLCJDcm91Y2ggTW92ZSAvIENUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfbCIsIkNyb3VjaCBNb3ZlIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBDVCAvIHlhd19tb2RpZmllciIsIlN0YXRpYyIsbnVsbCxudWxsLFsibW9kZSIsIkNyb3VjaCBNb3ZlIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBDVCAvIGJvZHlfeWF3IixmYWxzZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gQ1QgLyBib2R5X3lhdyIsMC4wLG51bGwsbnVsbCxbImRlbGF5IiwiQ3JvdWNoIE1vdmUgLyBDVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIENUIC8gYm9keV95YXciLCJPZmYiLG51bGwsbnVsbCxbImZyZWVzdGFuZGluZyIsIkNyb3VjaCBNb3ZlIC8gQ1QgLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIENUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfbCIsIkNyb3VjaCBNb3ZlIC8gQ1QgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBDVCAvIGJvZHlfeWF3IiwiRGVmYXVsdCIsbnVsbCxudWxsLFsibW9kZSIsIkNyb3VjaCBNb3ZlIC8gQ1QgLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIENUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfciIsIkNyb3VjaCBNb3ZlIC8gQ1QgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBDVCAvIGJvZHlfeWF3IixbXSxudWxsLG51bGwsWyJvcHRpb25zIiwiQ3JvdWNoIE1vdmUgLyBDVCAvIGJvZHlfeWF3Iiwic2VsZWN0YWJsZSJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsZmFsc2VdLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIENUIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbImxjIiwiQ3JvdWNoIE1vdmUgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIENUIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbInBpdGNoIiwiQ3JvdWNoIE1vdmUgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIENUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldCIsIkNyb3VjaCBNb3ZlIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzEiLCJDcm91Y2ggTW92ZSAvIENUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIENUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0IiwiQ3JvdWNoIE1vdmUgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJ5YXciLCJDcm91Y2ggTW92ZSAvIENUIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0XzIiLCJDcm91Y2ggTW92ZSAvIENUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIENUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X3NwZWVkIiwiQ3JvdWNoIE1vdmUgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8yIiwiQ3JvdWNoIE1vdmUgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8xIiwiQ3JvdWNoIE1vdmUgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBUIC8gZW5hYmxlIixmYWxzZV0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBUIC8gcGl0Y2giLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gVCAvIHlhdyIsIkRpc2FibGVkIl0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBUIC8geWF3IiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0IiwiQ3JvdWNoIE1vdmUgLyBUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gVCAvIHlhdyIsIlN0YXRpYyIsbnVsbCxudWxsLFsibW9kZSIsIkNyb3VjaCBNb3ZlIC8gVCAvIHlhdyIsImNvbWJvIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gVCAvIHlhdyIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9sIiwiQ3JvdWNoIE1vdmUgLyBUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gVCAvIHlhdyIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9yIiwiQ3JvdWNoIE1vdmUgLyBUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gVCAvIHlhd19tb2RpZmllciIsIkRpc2FibGVkIl0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBUIC8geWF3X21vZGlmaWVyIiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0IiwiQ3JvdWNoIE1vdmUgLyBUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gVCAvIHlhd19tb2RpZmllciIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9yIiwiQ3JvdWNoIE1vdmUgLyBUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gVCAvIHlhd19tb2RpZmllciIsMS4wLG51bGwsbnVsbCxbInRpY2siLCJDcm91Y2ggTW92ZSAvIFQgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBUIC8geWF3X21vZGlmaWVyIiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X2wiLCJDcm91Y2ggTW92ZSAvIFQgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBUIC8geWF3X21vZGlmaWVyIiwiU3RhdGljIixudWxsLG51bGwsWyJtb2RlIiwiQ3JvdWNoIE1vdmUgLyBUIC8geWF3X21vZGlmaWVyIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gVCAvIGJvZHlfeWF3IixmYWxzZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gVCAvIGJvZHlfeWF3IiwwLjAsbnVsbCxudWxsLFsiZGVsYXkiLCJDcm91Y2ggTW92ZSAvIFQgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBUIC8gYm9keV95YXciLCJPZmYiLG51bGwsbnVsbCxbImZyZWVzdGFuZGluZyIsIkNyb3VjaCBNb3ZlIC8gVCAvIGJvZHlfeWF3IiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gVCAvIGJvZHlfeWF3Iiw2MC4wLG51bGwsbnVsbCxbImxpbWl0X2wiLCJDcm91Y2ggTW92ZSAvIFQgLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBUIC8gYm9keV95YXciLCJEZWZhdWx0IixudWxsLG51bGwsWyJtb2RlIiwiQ3JvdWNoIE1vdmUgLyBUIC8gYm9keV95YXciLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBUIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfciIsIkNyb3VjaCBNb3ZlIC8gVCAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIFQgLyBib2R5X3lhdyIsW10sbnVsbCxudWxsLFsib3B0aW9ucyIsIkNyb3VjaCBNb3ZlIC8gVCAvIGJvZHlfeWF3Iiwic2VsZWN0YWJsZSJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBUIC8gZGVmZW5zaXZlX2FhIixmYWxzZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gVCAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJsYyIsIkNyb3VjaCBNb3ZlIC8gVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIFQgLyBkZWZlbnNpdmVfYWEiLCJEaXNhYmxlZCIsbnVsbCxudWxsLFsicGl0Y2giLCJDcm91Y2ggTW92ZSAvIFQgLyBkZWZlbnNpdmVfYWEiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldCIsIkNyb3VjaCBNb3ZlIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldF8xIiwiQ3JvdWNoIE1vdmUgLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIFQgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJwaXRjaF9vZmZzZXQiLCJDcm91Y2ggTW92ZSAvIFQgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gVCAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJ5YXciLCJDcm91Y2ggTW92ZSAvIFQgLyBkZWZlbnNpdmVfYWEiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiQ3JvdWNoIE1vdmUgLyBUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldF8yIiwiQ3JvdWNoIE1vdmUgLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIFQgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfc3BlZWQiLCJDcm91Y2ggTW92ZSAvIFQgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkNyb3VjaCBNb3ZlIC8gVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8yIiwiQ3JvdWNoIE1vdmUgLyBUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJDcm91Y2ggTW92ZSAvIFQgLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJwaXRjaF9vZmZzZXRfMSIsIkNyb3VjaCBNb3ZlIC8gVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiSW4gQWlyIC8gTiAvIGVuYWJsZSIsdHJ1ZV0sWyJjb21ibyIsImFudGkgYWltIiwiSW4gQWlyIC8gTiAvIHBpdGNoIiwiRG93biJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkluIEFpciAvIE4gLyB5YXciLCJCYWNrd2FyZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkluIEFpciAvIE4gLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJJbiBBaXIgLyBOIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkluIEFpciAvIE4gLyB5YXciLCJMICYgUiIsbnVsbCxudWxsLFsibW9kZSIsIkluIEFpciAvIE4gLyB5YXciLCJjb21ibyJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBOIC8geWF3IiwtMjEuMCxudWxsLG51bGwsWyJvZmZzZXRfbCIsIkluIEFpciAvIE4gLyB5YXciLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiSW4gQWlyIC8gTiAvIHlhdyIsNDIuMCxudWxsLG51bGwsWyJvZmZzZXRfciIsIkluIEFpciAvIE4gLyB5YXciLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiSW4gQWlyIC8gTiAvIHlhd19tb2RpZmllciIsIkRpc2FibGVkIl0sWyJjb21ibyIsImFudGkgYWltIiwiSW4gQWlyIC8gTiAvIHlhd19tb2RpZmllciIsLTEwLjAsbnVsbCxudWxsLFsib2Zmc2V0IiwiSW4gQWlyIC8gTiAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBOIC8geWF3X21vZGlmaWVyIiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X3IiLCJJbiBBaXIgLyBOIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkluIEFpciAvIE4gLyB5YXdfbW9kaWZpZXIiLDEuMCxudWxsLG51bGwsWyJ0aWNrIiwiSW4gQWlyIC8gTiAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBOIC8geWF3X21vZGlmaWVyIiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X2wiLCJJbiBBaXIgLyBOIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkluIEFpciAvIE4gLyB5YXdfbW9kaWZpZXIiLCJTdGF0aWMiLG51bGwsbnVsbCxbIm1vZGUiLCJJbiBBaXIgLyBOIC8geWF3X21vZGlmaWVyIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkluIEFpciAvIE4gLyBib2R5X3lhdyIsdHJ1ZV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkluIEFpciAvIE4gLyBib2R5X3lhdyIsMC4wLG51bGwsbnVsbCxbImRlbGF5IiwiSW4gQWlyIC8gTiAvIGJvZHlfeWF3Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBOIC8gYm9keV95YXciLCJPZmYiLG51bGwsbnVsbCxbImZyZWVzdGFuZGluZyIsIkluIEFpciAvIE4gLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBOIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfbCIsIkluIEFpciAvIE4gLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiSW4gQWlyIC8gTiAvIGJvZHlfeWF3IiwiRGVmYXVsdCIsbnVsbCxudWxsLFsibW9kZSIsIkluIEFpciAvIE4gLyBib2R5X3lhdyIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBOIC8gYm9keV95YXciLDYwLjAsbnVsbCxudWxsLFsibGltaXRfciIsIkluIEFpciAvIE4gLyBib2R5X3lhdyIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiSW4gQWlyIC8gTiAvIGJvZHlfeWF3IixbIkppdHRlciJdLG51bGwsbnVsbCxbIm9wdGlvbnMiLCJJbiBBaXIgLyBOIC8gYm9keV95YXciLCJzZWxlY3RhYmxlIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBOIC8gZGVmZW5zaXZlX2FhIix0cnVlXSxbInN3aXRjaCIsImFudGkgYWltIiwiSW4gQWlyIC8gTiAvIGRlZmVuc2l2ZV9hYSIsIkFsd2F5cyBPbiIsbnVsbCxudWxsLFsibGMiLCJJbiBBaXIgLyBOIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkluIEFpciAvIE4gLyBkZWZlbnNpdmVfYWEiLCJEaXNhYmxlZCIsbnVsbCxudWxsLFsicGl0Y2giLCJJbiBBaXIgLyBOIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkluIEFpciAvIE4gLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfb2Zmc2V0IiwiSW4gQWlyIC8gTiAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiSW4gQWlyIC8gTiAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInlhd19vZmZzZXRfMSIsIkluIEFpciAvIE4gLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkluIEFpciAvIE4gLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJwaXRjaF9vZmZzZXQiLCJJbiBBaXIgLyBOIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBOIC8gZGVmZW5zaXZlX2FhIiwiRGlzYWJsZWQiLG51bGwsbnVsbCxbInlhdyIsIkluIEFpciAvIE4gLyBkZWZlbnNpdmVfYWEiLCJjb21ibyJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiSW4gQWlyIC8gTiAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInlhd19vZmZzZXRfMiIsIkluIEFpciAvIE4gLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkluIEFpciAvIE4gLyBkZWZlbnNpdmVfYWEiLDAuMCxudWxsLG51bGwsWyJ5YXdfc3BlZWQiLCJJbiBBaXIgLyBOIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBOIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0XzIiLCJJbiBBaXIgLyBOIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBOIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0XzEiLCJJbiBBaXIgLyBOIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBDVCAvIGVuYWJsZSIsZmFsc2VdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkluIEFpciAvIENUIC8gcGl0Y2giLCJEaXNhYmxlZCJdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkluIEFpciAvIENUIC8geWF3IiwiRGlzYWJsZWQiXSxbImNvbWJvIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBDVCAvIHlhdyIsMC4wLG51bGwsbnVsbCxbIm9mZnNldCIsIkluIEFpciAvIENUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkluIEFpciAvIENUIC8geWF3IiwiU3RhdGljIixudWxsLG51bGwsWyJtb2RlIiwiSW4gQWlyIC8gQ1QgLyB5YXciLCJjb21ibyJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBDVCAvIHlhdyIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9sIiwiSW4gQWlyIC8gQ1QgLyB5YXciLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiSW4gQWlyIC8gQ1QgLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfciIsIkluIEFpciAvIENUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkluIEFpciAvIENUIC8geWF3X21vZGlmaWVyIiwiRGlzYWJsZWQiXSxbImNvbWJvIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBDVCAvIHlhd19tb2RpZmllciIsMC4wLG51bGwsbnVsbCxbIm9mZnNldCIsIkluIEFpciAvIENUIC8geWF3X21vZGlmaWVyIiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkluIEFpciAvIENUIC8geWF3X21vZGlmaWVyIiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X3IiLCJJbiBBaXIgLyBDVCAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBDVCAvIHlhd19tb2RpZmllciIsMS4wLG51bGwsbnVsbCxbInRpY2siLCJJbiBBaXIgLyBDVCAvIHlhd19tb2RpZmllciIsInNsaWRlciJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBDVCAvIHlhd19tb2RpZmllciIsMC4wLG51bGwsbnVsbCxbIm9mZnNldF9sIiwiSW4gQWlyIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiSW4gQWlyIC8gQ1QgLyB5YXdfbW9kaWZpZXIiLCJTdGF0aWMiLG51bGwsbnVsbCxbIm1vZGUiLCJJbiBBaXIgLyBDVCAvIHlhd19tb2RpZmllciIsImNvbWJvIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsInRlYW0iLCJDb3VudGVyLVRlcnJvcmlzdHMiXSxbInN3aXRjaCIsImFudGkgYWltIiwiSW4gQWlyIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLGZhbHNlXSxbInN3aXRjaCIsImFudGkgYWltIiwiSW4gQWlyIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJEaXNhYmxlZCIsbnVsbCxudWxsLFsibGMiLCJJbiBBaXIgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJwaXRjaCIsIkluIEFpciAvIENUIC8gZGVmZW5zaXZlX2FhIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkluIEFpciAvIENUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsieWF3X29mZnNldCIsIkluIEFpciAvIENUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInlhd19vZmZzZXRfMSIsIkluIEFpciAvIENUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldCIsIkluIEFpciAvIENUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsIkRpc2FibGVkIixudWxsLG51bGwsWyJ5YXciLCJJbiBBaXIgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsImNvbWJvIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInlhd19vZmZzZXRfMiIsIkluIEFpciAvIENUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInlhd19zcGVlZCIsIkluIEFpciAvIENUIC8gZGVmZW5zaXZlX2FhIiwic2xpZGVyIl1dLFsic3dpdGNoIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsMC4wLG51bGwsbnVsbCxbInBpdGNoX29mZnNldF8yIiwiSW4gQWlyIC8gQ1QgLyBkZWZlbnNpdmVfYWEiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJhbnRpIGFpbSIsIkluIEFpciAvIENUIC8gZGVmZW5zaXZlX2FhIiwwLjAsbnVsbCxudWxsLFsicGl0Y2hfb2Zmc2V0XzEiLCJJbiBBaXIgLyBDVCAvIGRlZmVuc2l2ZV9hYSIsInNsaWRlciJdXSxbInN3aXRjaCIsImFudGkgYWltIiwiSW4gQWlyIC8gVCAvIGVuYWJsZSIsZmFsc2VdLFsiY29tYm8iLCJhbnRpIGFpbSIsIkluIEFpciAvIFQgLyBwaXRjaCIsIkRpc2FibGVkIl0sWyJjb21ibyIsImFudGkgYWltIiwiSW4gQWlyIC8gVCAvIHlhdyIsIkRpc2FibGVkIl0sWyJjb21ibyIsImFudGkgYWltIiwiSW4gQWlyIC8gVCAvIHlhdyIsMC4wLG51bGwsbnVsbCxbIm9mZnNldCIsIkluIEFpciAvIFQgLyB5YXciLCJzbGlkZXIiXV0sWyJjb21ibyIsImFudGkgYWltIiwiSW4gQWlyIC8gVCAvIHlhdyIsIlN0YXRpYyIsbnVsbCxudWxsLFsibW9kZSIsIkluIEFpciAvIFQgLyB5YXciLCJjb21ibyJdXSxbImNvbWJvIiwiYW50aSBhaW0iLCJJbiBBaXIgLyBUIC8geWF3IiwwLjAsbnVsbCxudWxsLFsib2Zmc2V0X2wiLCJJbiBBaXIgLyBUIC8geWF3Iiwic2xpZGVyIl1dLFsiY29tYm8iLCJhbnRpIGFpbSIsIkluIEFpciAvIFQgLyB5YXciLDAuMCxudWxsLG51bGwsWyJvZmZzZXRfciIsIkluIEFpciAvIFQgLyB5YXciLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsImNvbGxpc2lvbiIsZmFsc2VdLFsic3dpdGNoIiwic2V0dGluZ3MiLCJjb2xsaXNpb24iLDguMCxudWxsLG51bGwsWyJkaXN0YW5jZSIsImNvbGxpc2lvbiIsInNsaWRlciJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwiaW1wcm92ZW1lbnQiLGZhbHNlXSxbInN3aXRjaCIsInNldHRpbmdzIiwibGFnX2V4cGxvaXQiLGZhbHNlXSxbInN3aXRjaCIsInNldHRpbmdzIiwibGFnX2V4cGxvaXQiLDE4LjAsbnVsbCxudWxsLFsidGljayIsImxhZ19leHBsb2l0Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJjbGFudGFnIix0cnVlXSxbInN3aXRjaCIsInNldHRpbmdzIiwibG9ncyIsdHJ1ZV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsImxvZ3MiLDAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJsb2dzIiwic2xpZGVyIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJsb2dzIixbIkNvbnNvbGUiLCJUb3AgTGVmdCJdLG51bGwsbnVsbCxbImV4dGVuZGVkIiwibG9ncyIsInNlbGVjdGFibGUiXV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsImxvZ3MiLCJcdTAwMDdGRkZGRkYwMDNcdTAwMDdERUZBVUxUSGl0Iix7Ilx1MDAwN0ZGRkZGRjAwMVx1MDAwN0RFRkFVTFRHbG93IjpbIkZGRkZGRjdEIl0sIlx1MDAwN0ZGRkZGRjAwMlx1MDAwN0RFRkFVTFRNaXNzIjpbIkVFMTMxNEZGIl0sIlx1MDAwN0ZGRkZGRjAwM1x1MDAwN0RFRkFVTFRIaXQiOlsiODdCMjBFRkYiXX0sWyJjb2xvcnMiLCJsb2dzIiwiY29sb3JfcGlja2VyIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJsb2dzIiwiRGVmYXVsdCIsbnVsbCxudWxsLFsic3R5bGUiLCJsb2dzIiwiY29tYm8iXV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsImxvZ3MiLFsiU2NyZWVuIiwiQ29uc29sZSIsIlRvcCBMZWZ0Il0sbnVsbCxudWxsLFsic2VsZWN0IiwibG9ncyIsInNlbGVjdGFibGUiXV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsInZpZXdtb2RlbF9jaGFuZ2VyIixmYWxzZV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsInZpZXdtb2RlbF9jaGFuZ2VyIiwyNS4wLG51bGwsbnVsbCxbIngiLCJ2aWV3bW9kZWxfY2hhbmdlciIsInNsaWRlciJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwidmlld21vZGVsX2NoYW5nZXIiLDAuMCxudWxsLG51bGwsWyJ5Iiwidmlld21vZGVsX2NoYW5nZXIiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsInZpZXdtb2RlbF9jaGFuZ2VyIiwtMTUuMCxudWxsLG51bGwsWyJ6Iiwidmlld21vZGVsX2NoYW5nZXIiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsInZpZXdtb2RlbF9jaGFuZ2VyIiw2ODAuMCxudWxsLG51bGwsWyJGT1YiLCJ2aWV3bW9kZWxfY2hhbmdlciIsInNsaWRlciJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwiYXNwZWN0X3JhdGlvIixmYWxzZV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsImFzcGVjdF9yYXRpbyIsMTMzLjAsbnVsbCxudWxsLFsib2Zmc2V0IiwiYXNwZWN0X3JhdGlvIiwic2xpZGVyIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJkYW1hZ2UiLGZhbHNlXSxbInN3aXRjaCIsInNldHRpbmdzIiwiZGFtYWdlIiwiRkZGRkZGRkYiLG51bGwsbnVsbCxbImNvbG9yIiwiZGFtYWdlIiwiY29sb3JfcGlja2VyIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJkYW1hZ2UiLDUyOS4wLG51bGwsbnVsbCxbInkiLCJkYW1hZ2UiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsImRhbWFnZSIsOTYwLjAsbnVsbCxudWxsLFsieCIsImRhbWFnZSIsInNsaWRlciJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwiZGFtYWdlIixmYWxzZSxudWxsLG51bGwsWyJzaG93IiwiZGFtYWdlIiwic3dpdGNoIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJhdXRvX21fdW5tIixmYWxzZV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsImF1dG9fbV91bm0iLCJNdXRlIixudWxsLG51bGwsWyJtb2RlIiwiYXV0b19tX3VubSIsImNvbWJvIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJzY29wZSIsdHJ1ZV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsInNjb3BlIiw1LjAsbnVsbCxudWxsLFsic3RhcnQiLCJzY29wZSIsInNsaWRlciJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwic2NvcGUiLFtdLG51bGwsbnVsbCxbImhpZGRlbiIsInNjb3BlIiwic2VsZWN0YWJsZSJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwic2NvcGUiLCI5ODk4OThGRiIsbnVsbCxudWxsLFsiY29sb3IiLCJzY29wZSIsImNvbG9yX3BpY2tlciJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwic2NvcGUiLDEyMC4wLG51bGwsbnVsbCxbImxlbmd0aCIsInNjb3BlIiwic2xpZGVyIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJzY29wZSIsZmFsc2UsbnVsbCxudWxsLFsiaW52ZXJ0ZXIiLCJzY29wZSIsInN3aXRjaCJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwibm9fZmFsbCIsZmFsc2VdLFsic3dpdGNoIiwic2V0dGluZ3MiLCJuYWRlX3ByZWRpY3Rpb24iLGZhbHNlXSxbInN3aXRjaCIsInNldHRpbmdzIiwibmFkZV9wcmVkaWN0aW9uIiwiRkZGRkZGRkYiLG51bGwsbnVsbCxbImNvbG9yIiwibmFkZV9wcmVkaWN0aW9uIiwiY29sb3JfcGlja2VyIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJhcnJvd3MiLGZhbHNlXSxbInN3aXRjaCIsInNldHRpbmdzIiwiYXJyb3dzIiwiU2ltcGxlIixudWxsLG51bGwsWyJzdHlsZSIsImFycm93cyIsImNvbWJvIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJhcnJvd3MiLCJGRkZGRkZGRiIsbnVsbCxudWxsLFsiY29sb3IiLCJhcnJvd3MiLCJjb2xvcl9waWNrZXIiXV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsImFycm93cyIsNTAuMCxudWxsLG51bGwsWyJvZmZzZXQiLCJhcnJvd3MiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsImFycm93cyIsIkFsd2F5cyBPbiIsbnVsbCxudWxsLFsiZGlzcGxheSIsImFycm93cyIsImNvbWJvIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJhcnJvd3MiLCJNYW51YWwiLHsiSW52ZXRlZCI6WyJGRkZGRkZGRiJdLCJNYW51YWwiOlsiRkZGRkZGRkYiXX0sWyJjb2xvcnMiLCJhcnJvd3MiLCJjb2xvcl9waWNrZXIiXV0sWyJjb21ibyIsInNldHRpbmdzIiwid2F0ZXJtYXJrIiwiU2ltcGxlIl0sWyJjb21ibyIsInNldHRpbmdzIiwid2F0ZXJtYXJrIiwiRDJBNkZGRkYiLG51bGwsbnVsbCxbImNvbG9yIiwid2F0ZXJtYXJrIiwiY29sb3JfcGlja2VyIl1dLFsiY29tYm8iLCJzZXR0aW5ncyIsIndhdGVybWFyayIsIkZ1bGwiLG51bGwsbnVsbCxbInR5cGUiLCJ3YXRlcm1hcmsiLCJjb21ibyJdXSxbImNvbWJvIiwic2V0dGluZ3MiLCJ3YXRlcm1hcmsiLCJCZWxvdyIsbnVsbCxudWxsLFsicG9zaXRpb24iLCJ3YXRlcm1hcmsiLCJjb21ibyJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwiZHJvcF9ncmVuYWRlcyIsZmFsc2VdLFsic3dpdGNoIiwic2V0dGluZ3MiLCJkcm9wX2dyZW5hZGVzIiwwLjAsbnVsbCxudWxsLFsiYmluZCIsImRyb3BfZ3JlbmFkZXMiLCJob3RrZXkiXV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsImRyb3BfZ3JlbmFkZXMiLFtdLG51bGwsbnVsbCxbImRpc2NhcmQiLCJkcm9wX2dyZW5hZGVzIiwic2VsZWN0YWJsZSJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwicmFkaXVzIix0cnVlXSxbInN3aXRjaCIsInNldHRpbmdzIiwicmFkaXVzIiwiMTBGRjEwRkYiLG51bGwsbnVsbCxbImNvbG9yX3R2IiwicmFkaXVzIiwiY29sb3JfcGlja2VyIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJyYWRpdXMiLCIxMDEwRkY4MCIsbnVsbCxudWxsLFsiY29sb3Jfc2UiLCJyYWRpdXMiLCJjb2xvcl9waWNrZXIiXV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsInJhZGl1cyIsWyJTbW9rZSIsIk1vbG90b3YiXSxudWxsLG51bGwsWyJkaXNwbGF5IiwicmFkaXVzIiwic2VsZWN0YWJsZSJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwicmFkaXVzIiwiRkYxMDEwRkYiLG51bGwsbnVsbCxbImNvbG9yX2V2IiwicmFkaXVzIiwiY29sb3JfcGlja2VyIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJuYWRlX3dhcm5pbmciLGZhbHNlXSxbInN3aXRjaCIsInNldHRpbmdzIiwibmFkZV93YXJuaW5nIiwiRkZGRkZGRkYiLG51bGwsbnVsbCxbImNvbG9yIiwibmFkZV93YXJuaW5nIiwiY29sb3JfcGlja2VyIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJza2VldCIsZmFsc2VdLFsic3dpdGNoIiwic2V0dGluZ3MiLCJza2VldCIsMC4wLG51bGwsbnVsbCxbIm9mZnNldCIsInNrZWV0Iiwic2xpZGVyIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJza2VldCIsW10sbnVsbCxudWxsLFsiZGlzcGxheSIsInNrZWV0Iiwic2VsZWN0YWJsZSJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwic2tlZXQiLGZhbHNlLG51bGwsbnVsbCxbInNwZWN0YXRvcnMiLCJza2VldCIsInN3aXRjaCJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwidHJhc2h0YWxrIix0cnVlXSxbInN3aXRjaCIsInNldHRpbmdzIiwidHJhc2h0YWxrIiwxMy4wLG51bGwsbnVsbCxbImRlbGF5IiwidHJhc2h0YWxrIiwic2xpZGVyIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJ0cmFzaHRhbGsiLCJFbmdsaXNoIixudWxsLG51bGwsWyJsYW5ndWFnZSIsInRyYXNodGFsayIsImNvbWJvIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJ3aWRnZXRzIixmYWxzZV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsIndpZGdldHMiLCJEZWZhdWx0IixudWxsLG51bGwsWyJzdHlsZSIsIndpZGdldHMiLCJjb21ibyJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwid2lkZ2V0cyIsODg1LjAsbnVsbCxudWxsLFsieF92Iiwid2lkZ2V0cyIsInNsaWRlciJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwid2lkZ2V0cyIsIjQ4NDg0OEZGIixudWxsLG51bGwsWyJiYWNrZ3JvdW5kIiwid2lkZ2V0cyIsImNvbG9yX3BpY2tlciJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwid2lkZ2V0cyIsMC4wLG51bGwsbnVsbCxbInhfdyIsIndpZGdldHMiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsIndpZGdldHMiLFtdLG51bGwsbnVsbCxbImRpc3BsYXkiLCJ3aWRnZXRzIiwic2VsZWN0YWJsZSJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwid2lkZ2V0cyIsMC4wLG51bGwsbnVsbCxbInlfdyIsIndpZGdldHMiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsIndpZGdldHMiLDI3MC4wLG51bGwsbnVsbCxbInlfZCIsIndpZGdldHMiLCJzbGlkZXIiXV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsIndpZGdldHMiLDUuMCxudWxsLG51bGwsWyJ4X2siLCJ3aWRnZXRzIiwic2xpZGVyIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJ3aWRnZXRzIiw4ODUuMCxudWxsLG51bGwsWyJ4X2QiLCJ3aWRnZXRzIiwic2xpZGVyIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJ3aWRnZXRzIiw1NDUuMCxudWxsLG51bGwsWyJ5X2siLCJ3aWRnZXRzIiwic2xpZGVyIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJ3aWRnZXRzIiw0MjAuMCxudWxsLG51bGwsWyJ5X3YiLCJ3aWRnZXRzIiwic2xpZGVyIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJ3aWRnZXRzIiwxMTAuMCxudWxsLG51bGwsWyJ4X3MiLCJ3aWRnZXRzIiwic2xpZGVyIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJ3aWRnZXRzIiwiRkZGRkZGRkYiLG51bGwsbnVsbCxbImNvbG9yIiwid2lkZ2V0cyIsImNvbG9yX3BpY2tlciJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwid2lkZ2V0cyIsNTQ1LjAsbnVsbCxudWxsLFsieV9zIiwid2lkZ2V0cyIsInNsaWRlciJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwic3VwZXJfdG9zcyIsZmFsc2VdLFsic3dpdGNoIiwic2V0dGluZ3MiLCJzdXBlcl90b3NzIiwiTm90aGluZyIsbnVsbCxudWxsLFsiaWdub3JlIiwic3VwZXJfdG9zcyIsImNvbWJvIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJxdWlja19sYW5kaW5nIixmYWxzZV0sWyJzd2l0Y2giLCJzZXR0aW5ncyIsImluZGljYXRvcnMiLHRydWVdLFsic3dpdGNoIiwic2V0dGluZ3MiLCJpbmRpY2F0b3JzIiwiTW9kZXJuIixudWxsLG51bGwsWyJzdHlsZSIsImluZGljYXRvcnMiLCJjb21ibyJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwiaW5kaWNhdG9ycyIsWyJEb3VibGUgVGFwIiwiSGlkZSBTaG90cyIsIkZha2UgRHVjayIsIkJvZHkgQWltIiwiRnJlZXN0YW5kaW5nIl0sbnVsbCxudWxsLFsiYmluZHMiLCJpbmRpY2F0b3JzIiwic2VsZWN0YWJsZSJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwiaW5kaWNhdG9ycyIsWyJUbyBTY29wZSJdLG51bGwsbnVsbCxbImFkZGl0aW9ucyIsImluZGljYXRvcnMiLCJzZWxlY3RhYmxlIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJpbmRpY2F0b3JzIix0cnVlLG51bGwsbnVsbCxbInJldml0YWxpemUiLCJpbmRpY2F0b3JzIiwic3dpdGNoIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJpbmRpY2F0b3JzIixbIkJpbmRzIl0sbnVsbCxudWxsLFsiZGlzcGxheSIsImluZGljYXRvcnMiLCJzZWxlY3RhYmxlIl1dLFsic3dpdGNoIiwic2V0dGluZ3MiLCJpbmRpY2F0b3JzIiwiSGVhZGVyIix7IkNvbmRpdGlvbiI6WyJGRkZGRkZGRiIsIkZGRkZGRkZGIl0sIkhlYWRlciI6WyJGRkZGRkZGRiIsIkZGRkZGRkZGIl19LFsiY29sb3JzIiwiaW5kaWNhdG9ycyIsImNvbG9yX3BpY2tlciJdXSxbInN3aXRjaCIsInNldHRpbmdzIiwibmFkZV9maXgiLGZhbHNlXSxbInN3aXRjaCIsInNldHRpbmdzIiwibmFkZV9maXgiLFtdLG51bGwsbnVsbCxbIm9uIiwibmFkZV9maXgiLCJzZWxlY3RhYmxlIl1dXQ_serenity\n        "
        }, 
        get = function(config_key, copy_to_clipboard_flag)
            -- upvalues: l_mui_0 (ref), menu (ref), v135 (ref), l_clipboard_0 (ref)
            local saved_config_string = l_mui_0.configs.save(menu, config_key);
            saved_config_string = v135.encode(json.stringify(saved_config_string));
            if copy_to_clipboard_flag then
                l_clipboard_0.set(("%s_serenity"):format(saved_config_string));
                return;
            else
                return saved_config_string;
            end;
        end, 
        set = function(input_config_string, use_clipboard_flag)
            -- upvalues: l_clipboard_0 (ref), serenity_metadata (ref), v135 (ref), l_mui_0 (ref), menu (ref)
            local decoded_config_string = use_clipboard_flag and l_clipboard_0.get() or input_config_string;
            decoded_config_string = serenity_metadata.split(decoded_config_string, "_")[1];
            local parsed_config_table = json.parse(v135.decode(decoded_config_string), true);
            l_mui_0.configs.load(menu, parsed_config_table);
        end
    };
    config_manager.save = function()
        -- upvalues: menu (ref), config_manager (ref), l_print_0 (ref), serenity_metadata (ref), serenity_config_db (ref)
        local config_name = menu.home.name:get();
        if config_manager.defaults[config_name] then
            cvar.play:call("ui/weapon_cant_buy.wav");
            l_print_0("You cannot perform this action with this configuration.");
            return;
        else
            if string.len(config_name) < 1 or string.len(config_name) > 128 then
                config_name = serenity_metadata.username;
            end;
            if pcall(function()
                -- upvalues: config_manager (ref), config_name (ref), serenity_config_db (ref)
                local config_data = config_manager.get({
                    [1] = "anti aim", 
                    [2] = "settings"
                });
                config_manager.data[config_name] = config_data;
                serenity_config_db.configs = config_manager.data;
                db.serenity_recode = serenity_config_db;
                config_manager.update();
            end) then
                cvar.play:call("ui/beepclear.wav");
                l_print_0("The configuration was successfully saved.");
            else
                cvar.play:call("ui/weapon_cant_buy.wav");
                l_print_0("The configuration is wrong.");
            end;
            return;
        end;
    end;
    config_manager.load = function()
        -- upvalues: menu (ref), config_manager (ref), l_print_0 (ref)
        local selected_config_name = menu.home.list:list()[menu.home.list:get()];
        if pcall(function()
            -- upvalues: config_manager (ref), selected_config_name (ref)
            config_manager.set(config_manager.data[selected_config_name]);
        end) then
            cvar.play:call("ui/beepclear.wav");
            l_print_0("The configuration was successfully loaded.");
        else
            cvar.play:call("ui/weapon_cant_buy.wav");
            l_print_0("The configuration is wrong.");
        end;
    end;
    config_manager.update = function()
        -- upvalues: config_manager (ref), serenity_config_db (ref), menu (ref)
        for default_config_name, default_config_data in pairs(config_manager.defaults) do
            config_manager.data[default_config_name] = default_config_data;
        end;
        config_manager.list = {
            data = {}, 
            name = {}
        };
        for stored_config_name, stored_config_data in pairs(serenity_config_db.configs) do
            config_manager.list.data[stored_config_name] = stored_config_data;
            table.insert(config_manager.list.name, stored_config_name);
        end;
        table.sort(config_manager.list.name);
        menu.home.list:update(config_manager.list.name);
    end;
    config_manager.remove = function()
        -- upvalues: menu (ref), config_manager (ref), l_print_0 (ref), serenity_config_db (ref)
        local config_to_remove = menu.home.list:list()[menu.home.list:get()];
        if config_manager.defaults[config_to_remove] then
            cvar.play:call("ui/weapon_cant_buy.wav");
            l_print_0("You cannot perform this action with this configuration.");
            return;
        else
            for config_name_iter, _ in pairs(config_manager.data) do
                if config_name_iter == config_to_remove then
                    config_manager.data[config_name_iter] = nil;
                end;
            end;
            serenity_config_db.configs = config_manager.data;
            db.serenity_recode = serenity_config_db;
            config_manager.update();
            cvar.play:call("ui/beepclear.wav");
            l_print_0("The configuration was successfully removed.");
            return;
        end;
    end;
    config_manager.export = function()
        -- upvalues: config_manager (ref), l_print_0 (ref)
        if pcall(function()
            -- upvalues: config_manager (ref)
            config_manager.get({
                [1] = "anti aim", 
                [2] = "settings"
            }, true);
        end) then
            cvar.play:call("ui/beepclear.wav");
            l_print_0("The configuration was successfully saved to the clipboard.");
        else
            cvar.play:call("ui/weapon_cant_buy.wav");
            l_print_0("The configuration is wrong.");
        end;
    end;
    config_manager.export_aa = function()
        -- upvalues: config_manager (ref), l_print_0 (ref)
        if pcall(function()
            -- upvalues: config_manager (ref)
            config_manager.get({
                [1] = "anti aim"
            }, true);
        end) then
            cvar.play:call("ui/beepclear.wav");
            l_print_0("The configuration [Anti Aim] was successfully saved to the clipboard.");
        else
            cvar.play:call("ui/weapon_cant_buy.wav");
            l_print_0("The configuration is wrong.");
        end;
    end;
    config_manager.import = function()
        -- upvalues: config_manager (ref), l_print_0 (ref)
        if pcall(function()
            -- upvalues: config_manager (ref)
            config_manager.set(nil, true);
        end) then
            cvar.play:call("ui/beepclear.wav");
            l_print_0("The configuration was successfully loaded of clipboard.");
        else
            cvar.play:call("ui/weapon_cant_buy.wav");
            l_print_0("The configuration is wrong.");
        end;
    end;
    config_manager.update();
    menu["anti aim"].manual[0].magnet:tooltip("Turns the head towards the position where the bind is pressed.");
    menu.home.select:set_callback(function(home_tab_select)
        -- upvalues: menu (ref), serenity_metadata (ref)
        local home_tab_list = home_tab_select:list();
        for tab_index = 1, #home_tab_list do
            do
                local current_tab_index = tab_index;
                pcall(function()
                    -- upvalues: menu (ref), serenity_metadata (ref), home_tab_list (ref), current_tab_index (ref), home_tab_select (ref)
                    menu.tabs.home[serenity_metadata.split(home_tab_list[current_tab_index], "  ")[2]:lower()]:visibility(home_tab_list[current_tab_index] == home_tab_list[home_tab_select:get()]);
                end);
            end;
        end;
        menu.tabs.home.informations_2:visibility(home_tab_select:get() == 1);
        menu.tabs.home.configurations_2:visibility(home_tab_select:get() == 3);
    end, true);
    menu.home.list:set_callback(function(home_list)
        -- upvalues: config_manager (ref), menu (ref)
        local selected_config = home_list:list()[home_list:get()];
        if config_manager.defaults[selected_config] then
            selected_config = "";
        end;
        menu.home.name:set(selected_config);
    end);
    menu.home.save:set_callback(function()
        -- upvalues: config_manager (ref)
        config_manager.save();
    end);
    menu.home.load:set_callback(function()
        -- upvalues: config_manager (ref)
        config_manager.load();
    end);
    menu.home.remove:set_callback(function()
        -- upvalues: config_manager (ref), menu (ref)
        config_manager.remove();
        menu.home.list:set(menu.home.list:get());
    end);
    menu.home.export:set_callback(function()
        -- upvalues: config_manager (ref)
        config_manager.export();
    end);
    menu.home.import:set_callback(function()
        -- upvalues: config_manager (ref)
        config_manager.import();
    end);
    menu["anti aim"].export:set_callback(function()
        -- upvalues: config_manager (ref)
        config_manager.export_aa();
    end);
    menu["anti aim"].import:set_callback(function()
        -- upvalues: config_manager (ref)
        config_manager.import();
    end);
    menu.settings.indicators:set_callback(function(indicators_toggle)
        -- upvalues: menu (ref)
        local indicators_settings = menu.settings.indicators[0];
        indicators_settings.style:visibility(indicators_toggle:get());
        indicators_settings.display:visibility(indicators_toggle:get());
        indicators_settings.display:set_callback(function(indicators_display_selection)
            -- upvalues: indicators_settings (ref), indicators_toggle (ref)
            indicators_settings.binds:visibility(indicators_toggle:get() and indicators_display_selection:get("Binds"));
        end, true);
        indicators_settings.additions:visibility(indicators_toggle:get());
        indicators_settings.colors:visibility(indicators_toggle:get());
        indicators_settings.revitalize:visibility(indicators_toggle:get());
    end, true);
    menu.settings.damage:set_callback(function(damage_toggle)
        -- upvalues: menu (ref)
        local damage_settings = menu.settings.damage[0];
        damage_settings.color:visibility(damage_toggle:get());
        damage_settings.show:visibility(damage_toggle:get());
    end, true);
    menu.settings.arrows:set_callback(function(arrows_toggle)
        -- upvalues: menu (ref)
        local arrows_settings = menu.settings.arrows[0];
        arrows_settings.style:visibility(arrows_toggle:get());
        arrows_settings.display:visibility(arrows_toggle:get());
        arrows_settings.offset:visibility(arrows_toggle:get());
        arrows_settings.style:set_callback(function(arrows_style_selection)
            -- upvalues: arrows_settings (ref), arrows_toggle (ref)
            arrows_settings.color:visibility(arrows_toggle:get() and arrows_style_selection:get() == "Simple");
            arrows_settings.colors:visibility(arrows_toggle:get() and arrows_style_selection:get() == "Teamskeet");
        end, true);
    end, true);
    menu.settings.widgets:set_callback(function(widgets_toggle)
        -- upvalues: menu (ref)
        local widgets_settings = menu.settings.widgets[0];
        widgets_settings.display:visibility(widgets_toggle:get());
        widgets_settings.display:set_callback(function(widgets_display_selection)
            -- upvalues: widgets_settings (ref), widgets_toggle (ref)
            local should_show_appearance_settings = #widgets_display_selection:get() > 0;
            if #widgets_display_selection:get() == 1 and widgets_display_selection:get("Velocity Warning") then
                should_show_appearance_settings = false;
            end;
            widgets_settings.color:visibility(widgets_toggle:get() and should_show_appearance_settings);
            if #widgets_display_selection:get() == 1 and widgets_display_selection:get("Defensive Indicator") then
                should_show_appearance_settings = false;
            elseif #widgets_display_selection:get() == 2 and widgets_display_selection:get("Velocity Warning") and widgets_display_selection:get("Defensive Indicator") then
                should_show_appearance_settings = false;
            end;
            widgets_settings.style:visibility(widgets_toggle:get() and should_show_appearance_settings);
            widgets_settings.background:visibility(widgets_toggle:get() and should_show_appearance_settings);
        end, true);
    end, true);
    menu.settings.watermark:set_callback(function(watermark_mode)
        -- upvalues: menu (ref)
        local watermark_settings = menu.settings.watermark[0];
        watermark_settings.position:visibility(watermark_mode:get() == "Serenity" or watermark_mode:get() == "Emoji");
        watermark_settings.position:set_callback(function(watermark_position)
            -- upvalues: watermark_settings (ref), watermark_mode (ref)
            watermark_settings.type:visibility((not (watermark_mode:get() ~= "Serenity") or watermark_mode:get() == "Emoji") and watermark_position:get() == "Below");
        end, true);
    end, true);
    menu.settings.skeet:set_callback(function(skeet_toggle)
        -- upvalues: menu (ref)
        local skeet_settings = menu.settings.skeet[0];
        skeet_settings.display:visibility(skeet_toggle:get());
        skeet_settings.spectators:visibility(skeet_toggle:get());
        skeet_settings.spectators:set_callback(function(skeet_spectators_toggle)
            -- upvalues: skeet_settings (ref), skeet_toggle (ref)
            skeet_settings.offset:visibility(skeet_toggle:get() and skeet_spectators_toggle:get());
        end, true);
    end, true);
    menu.settings.scope:set_callback(function(scope_toggle)
        -- upvalues: menu (ref), ui_references (ref)
        local scope_settings = menu.settings.scope[0];
        scope_settings.start:visibility(scope_toggle:get());
        scope_settings.length:visibility(scope_toggle:get());
        scope_settings.hidden:visibility(scope_toggle:get());
        scope_settings.inverter:visibility(scope_toggle:get());
        scope_settings.color:visibility(scope_toggle:get());
        ui_references.world["Override Zoom"].overlay:override(scope_toggle:get() and "Remove All" or nil);
    end, true);
    menu.settings.radius:set_callback(function(radius_toggle)
        -- upvalues: menu (ref)
        local radius_settings = menu.settings.radius[0];
        radius_settings.display:visibility(radius_toggle:get());
        radius_settings.display:set_callback(function(radius_display_selection)
            -- upvalues: radius_settings (ref), radius_toggle (ref)
            radius_settings.color_se:visibility(radius_toggle:get() and radius_display_selection:get("Smoke"));
            radius_settings.color_ev:visibility(radius_toggle:get() and radius_display_selection:get("Molotov"));
            radius_settings.color_tv:visibility(radius_toggle:get() and radius_display_selection:get("Molotov"));
        end, true);
    end, true);
    menu.settings.logs:set_callback(function(logs_toggle)
        -- upvalues: menu (ref)
        local logs_settings = menu.settings.logs[0];
        logs_settings.select:visibility(logs_toggle:get());
        logs_settings.select:set_callback(function(logs_select_options)
            -- upvalues: logs_settings (ref), logs_toggle (ref)
            logs_settings.extended:visibility(logs_toggle:get() and #logs_select_options:get() ~= 0);
            logs_settings.style:visibility(logs_toggle:get() and logs_select_options:get("Screen"));
            logs_settings.offset:visibility(logs_toggle:get() and logs_select_options:get("Screen"));
            logs_settings.colors:visibility(logs_toggle:get() and #logs_select_options:get() ~= 0);
        end, true);
    end, true);
    menu.settings.trashtalk:set_callback(function(trashtalk_toggle)
        -- upvalues: menu (ref)
        local trashtalk_settings = menu.settings.trashtalk[0];
        trashtalk_settings.language:visibility(trashtalk_toggle:get());
        trashtalk_settings.delay:visibility(trashtalk_toggle:get());
    end, true);
    menu.settings.no_fall:tooltip("Prevents fall damage.\n\nNote: \aFF2C2CFFIt doesn't work with a 100% chance.");
    menu.settings.nade_fix:tooltip("Corrects errors when your grenades fly upwards or fail to register on the server.");
    menu.settings.nade_fix:set_callback(function(nade_fix_toggle)
        -- upvalues: menu (ref)
        menu.settings.nade_fix[0].on:visibility(nade_fix_toggle:get());
    end, true);
    menu["anti aim"].tweaks:set_callback(function(tweaks_options)
        -- upvalues: menu (ref)
        local tweaks_settings = menu["anti aim"].tweaks[0];
        tweaks_settings.weapon:visibility(tweaks_options:get("Auto Teleport"));
        tweaks_settings.weapon:set_callback(function(weapon_tweak_options)
            -- upvalues: tweaks_settings (ref), tweaks_options (ref)
            tweaks_settings.edge_yaw:visibility(tweaks_options:get("Edge Yaw"));
            tweaks_settings.delay:visibility(tweaks_options:get("Auto Teleport") and #weapon_tweak_options:get() > 0);
            tweaks_settings.in_air:visibility(tweaks_options:get("Auto Teleport") and #weapon_tweak_options:get() > 0);
        end, true);
    end, true);
    menu.settings.drop_grenades:set_callback(function(drop_grenades_toggle)
        -- upvalues: menu (ref)
        local drop_grenades_settings = menu.settings.drop_grenades[0];
        drop_grenades_settings.bind:visibility(drop_grenades_toggle:get());
        drop_grenades_settings.bind:set_callback(function(drop_grenades_bind)
            -- upvalues: drop_grenades_settings (ref), drop_grenades_toggle (ref)
            drop_grenades_settings.discard:visibility(drop_grenades_toggle:get() and drop_grenades_bind:key() ~= 0);
        end, true);
    end, true);
    menu.settings.auto_m_unm:set_callback(function(auto_mute_toggle)
        -- upvalues: menu (ref)
        menu.settings.auto_m_unm[0].mode:visibility(auto_mute_toggle:get());
    end, true);
    menu["anti aim"].animations:set_callback(function(animations_toggle)
        -- upvalues: menu (ref)
        local animations_settings = menu["anti aim"].animations[0];
        animations_settings.select:visibility(animations_toggle:get());
        animations_settings.select:set_callback(function(animations_select)
            -- upvalues: animations_settings (ref), animations_toggle (ref)
            animations_settings.landing:visibility(animations_toggle:get() and animations_select:get("Legs on Landing"));
            animations_settings.air:visibility(animations_toggle:get() and animations_select:get("Legs in Air"));
            animations_settings.lean:visibility(animations_toggle:get() and animations_select:get("Body Lean"));
        end, true);
    end, true);
    menu["anti aim"].condition:set_callback(function(anti_aim_condition_select)
        -- upvalues: serenity_metadata (ref), menu (ref)
        for condition_index = 1, #serenity_metadata.conditions do
            local condition_name = serenity_metadata.conditions[condition_index];
            local is_condition_enabled = condition_name == get_team(anti_aim_condition_select:get()) and serenity_metadata.split(menu["anti aim"].type:list()[menu["anti aim"].type:get()], "  ")[2] ~= "Disabled";
            menu["anti aim"][("%s / %s"):format(condition_name, "enable")]:visibility(is_condition_enabled);
            if condition_name == get_team("Global") then
                menu["anti aim"][("%s / %s"):format(condition_name, "enable")]:visibility(false);
                menu["anti aim"][("%s / %s"):format(condition_name, "enable")]:set(true);
            end;
            menu["anti aim"][("%s / %s"):format(condition_name, "enable")]:set(menu["anti aim"][("%s / %s"):format(condition_name, "enable")]:get());
        end;
    end, true);
    menu["anti aim"].type:set_callback(function(anti_aim_type_dropdown)
        -- upvalues: serenity_metadata (ref), menu (ref)
        local selected_aa_type = serenity_metadata.split(anti_aim_type_dropdown:list()[anti_aim_type_dropdown:get()], "  ")[2];
        menu["anti aim"].condition:visibility(selected_aa_type ~= "Disabled");
        menu["anti aim"].condition:set(menu["anti aim"].condition:get());
        menu["anti aim"].team:set(menu["anti aim"].team:get());
        menu["anti aim"].team:visibility(selected_aa_type == "Teams");
        menu["anti aim"].manual:visibility(selected_aa_type ~= "Disabled");
        menu["anti aim"].tweaks:visibility(selected_aa_type ~= "Disabled");
        menu["anti aim"].safe:visibility(selected_aa_type ~= "Disabled");
        menu["anti aim"].freestanding:visibility(selected_aa_type ~= "Disabled");
        menu["anti aim"].animations:visibility(selected_aa_type ~= "Disabled");
        menu["anti aim"].send:visibility(selected_aa_type == "Teams");
    end, true);
    menu["anti aim"].team:set_callback(function(_)
        -- upvalues: menu (ref)
        menu["anti aim"].condition:set(menu["anti aim"].condition:get());
    end, true);
    menu["anti aim"].send:set_callback(function(_)
        -- upvalues: menu (ref), l_print_0 (ref)
        local selected_condition = menu["anti aim"].condition:get();
        local team_role_map = {
            current = menu["anti aim"].team:get(), 
            opposite = menu["anti aim"].team:get()
        };
        if team_role_map.current == "Counter-Terrorists" then
            team_role_map.current = "CT";
            team_role_map.opposite = "T";
        elseif team_role_map.current == "Terrorists" then
            team_role_map.current = "T";
            team_role_map.opposite = "CT";
        end;
        local anti_aim_element_list = {
            [1] = {
                element = "enable"
            }, 
            [2] = {
                element = "pitch"
            }, 
            [3] = {
                element = "yaw"
            }, 
            [4] = {
                name = "mode", 
                element = "yaw"
            }, 
            [5] = {
                name = "offset", 
                element = "yaw"
            }, 
            [6] = {
                name = "offset_l", 
                element = "yaw"
            }, 
            [7] = {
                name = "offset_r", 
                element = "yaw"
            }, 
            [8] = {
                element = "yaw_modifier"
            }, 
            [9] = {
                name = "mode", 
                element = "yaw_modifier"
            }, 
            [10] = {
                name = "offset", 
                element = "yaw_modifier"
            }, 
            [11] = {
                name = "offset_l", 
                element = "yaw_modifier"
            }, 
            [12] = {
                name = "offset_r", 
                element = "yaw_modifier"
            }, 
            [13] = {
                element = "body_yaw"
            }, 
            [14] = {
                name = "limit_l", 
                element = "body_yaw"
            }, 
            [15] = {
                name = "limit_r", 
                element = "body_yaw"
            }, 
            [16] = {
                name = "options", 
                element = "body_yaw"
            }, 
            [17] = {
                name = "delay", 
                element = "body_yaw"
            }, 
            [18] = {
                name = "freestanding", 
                element = "body_yaw"
            }, 
            [19] = {
                element = "defensive_aa"
            }, 
            [20] = {
                name = "lc", 
                element = "defensive_aa"
            }, 
            [21] = {
                name = "pitch", 
                element = "defensive_aa"
            }, 
            [22] = {
                name = "pitch_offset", 
                element = "defensive_aa"
            }, 
            [23] = {
                name = "pitch_offset_1", 
                element = "defensive_aa"
            }, 
            [24] = {
                name = "pitch_offset_2", 
                element = "defensive_aa"
            }, 
            [25] = {
                name = "yaw", 
                element = "defensive_aa"
            }, 
            [26] = {
                name = "yaw_offset", 
                element = "defensive_aa"
            }, 
            [27] = {
                name = "yaw_offset_1", 
                element = "defensive_aa"
            }, 
            [28] = {
                name = "yaw_offset_2", 
                element = "defensive_aa"
            }
        };
        for elementIndex = 1, #anti_aim_element_list do
            local currentElement = anti_aim_element_list[elementIndex];
            if not currentElement.name then
                currentElement.value = menu["anti aim"][("%s / %s / %s"):format(selected_condition, team_role_map.current, currentElement.element)]:get();
            else
                currentElement.value = menu["anti aim"][("%s / %s / %s"):format(selected_condition, team_role_map.current, currentElement.element)][0][currentElement.name]:get();
            end;
        end;
        for copyIndex = 1, #anti_aim_element_list do
            local copiedElement = anti_aim_element_list[copyIndex];
            if not copiedElement.name then
                menu["anti aim"][("%s / %s / %s"):format(selected_condition, team_role_map.opposite, copiedElement.element)]:set(copiedElement.value);
            else
                menu["anti aim"][("%s / %s / %s"):format(selected_condition, team_role_map.opposite, copiedElement.element)][0][copiedElement.name]:set(copiedElement.value);
            end;
        end;
        cvar.play:call("ui/beepclear.wav");
        l_print_0(("%s condition sent from command %s to command %s"):format(selected_condition, team_role_map.current, team_role_map.opposite));
    end);
    local antiAimState = {
        main = {
            disabled = false, 
            legit_aa = {
                status = false, 
                timeout = globals.realtime
            }, 
            inverter = {
                yaw_tick = 1, 
                tick = 0, 
                active_tick = false, 
                active = false
            }, 
            converter = {
                SW = "Slow Move", 
                M = "Moving", 
                S = "Standing", 
                G = "Global", 
                C = "Crouch", 
                AC = "Air Crouch", 
                A = "In Air"
            }, 
            freestanding = {
                converter = {
                    ["In Air"] = "air", 
                    Crouch = "crouch", 
                    ["Slow Move"] = "slow_walk", 
                    Moving = "moving", 
                    Standing = "standing"
                }
            }, 
            manuals = {
                Right = 90, 
                Left = -90, 
                Forward = 180, 
                Backward = 0, 
                ["At Target"] = 2006
            }, 
            defensive = {
                delay = 0, 
                yaw_spin = 0, 
                pitch = {
                    Disabled = 12345, 
                    Automatic = 2023, 
                    Offset = 1337, 
                    Switch = -8989, 
                    Random = 2006
                }, 
                yaw = {
                    Neverlose = 12345, 
                    ["3-Way"] = 2020, 
                    Offset = 1337, 
                    Switch = -180180, 
                    ["5-Way"] = 2023, 
                    Spin = 360, 
                    Random = 2006
                }
            }, 
            animations = {
                pitch_on_land = {
                    status = false, 
                    tick = 1, 
                    timeout = 0
                }
            }, 
            auto_teleport = {
                worked = false
            }, 
            magnetize = {
                position = vector(0, 0, 0)
            }
        }, 
        reference = {
            enable = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
            pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
            yaw = {
                self = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
                base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
                offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
                backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
                hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden")
            }, 
            yaw_modifier = {
                self = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
                offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset")
            }, 
            body_yaw = {
                self = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
                inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
                limit_l = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
                limit_r = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
                options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
                freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
            }, 
            freestanding = {
                self = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
                DYM = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
                BF = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding")
            }, 
            fake_lag = {
                limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit")
            }, 
            misc = {
                leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
                fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck")
            }
        }
    };
    antiAimState.data = {
        get = function(_, conditionName, elementName, gearName)
            -- upvalues: antiAimState (ref)
            return antiAimState.data.builder(conditionName, elementName, gearName);
        end, 
        builder = function(conditionName, elementName, gearName)
            -- upvalues: menu (ref)
            if gearName then
                return menu["anti aim"][("%s / %s"):format(conditionName, elementName)].gear[gearName]:get();
            else
                return menu["anti aim"][("%s / %s"):format(conditionName, elementName)]:get();
            end;
        end
    };
    antiAimState.legit_aa = function(localPlayer, cmd)
        -- upvalues: antiAimState (ref)
        antiAimState.main.legit_aa.status = false;
        if not cmd.in_use then
            antiAimState.main.legit_aa.timeout = globals.realtime;
            return;
        else
            local legitAAData = {
                origin = localPlayer:get_origin(), 
                bomb = {
                    distance = 1000, 
                    c4 = entity.get_entities("CPlantedC4")
                }
            };
            if #legitAAData.bomb.c4 > 0 then
                for bombIndex = 1, #legitAAData.bomb.c4 do
                    local bombOrigin = legitAAData.bomb.c4[bombIndex]:get_origin();
                    local bombDistance = legitAAData.origin:dist(bombOrigin);
                    if bombDistance < legitAAData.bomb.distance then
                        legitAAData.bomb.distance = bombDistance;
                    end;
                end;
            end;
            legitAAData.hostage = {
                distance = 1000, 
                peoples = entity.get_entities("CHostage")
            };
            if #legitAAData.hostage.peoples > 0 then
                for hostageIndex = 1, #legitAAData.hostage.peoples do
                    local hostageOrigin = legitAAData.hostage.peoples[hostageIndex]:get_origin();
                    local hostageDistance = legitAAData.origin:dist(hostageOrigin);
                    if hostageDistance < legitAAData.hostage.distance then
                        legitAAData.hostage.distance = hostageDistance;
                    end;
                end;
            end;
            if legitAAData.hostage.distance < 65 and localPlayer.m_iTeamNum ~= 2 then
                return;
            elseif legitAAData.bomb.distance < 65 and localPlayer.m_iTeamNum ~= 2 then
                return;
            elseif cmd.in_use and globals.realtime - antiAimState.main.legit_aa.timeout < 0.02 then
                return;
            else
                cmd.in_use = false;
                antiAimState.main.legit_aa.status = true;
                return;
            end;
        end;
    end;-- continue
    antiAimState.edge_yaw = function(localPlayer, _)
        -- upvalues: menu (ref), l_liberia_0 (ref), antiAimState (ref), serenity_metadata (ref)
        pcall(function()
            -- upvalues: menu (ref), l_liberia_0 (ref), antiAimState (ref), localPlayer (ref), serenity_metadata (ref)
            if menu["anti aim"].tweaks[0].edge_yaw:get("Always On") then
                if l_liberia_0.anti_aim.condition.get_state("air") then
                    return;
                end;
            elseif not antiAimState.reference.misc.fake_duck:get() then
                return;
            end;
            if globals.choked_commands == 0 then
                antiAimState.main.edge_vector = localPlayer:get_eye_position();
            end;
            local _, _, edgeStart, edgeEnd = serenity_metadata.get_edge(antiAimState.main.edge_vector, 0.5, {
                [1] = 135, 
                [2] = 2
            });
            if edgeEnd then
                local l_y_0 = edgeStart.y;
                local l_y_1 = edgeEnd.y;
                local yawDelta = math.normalize_yaw(l_y_1 - l_y_0);
                if math.abs(yawDelta) < 90 then
                    yawDelta = 0;
                    l_y_0 = math.normalize_yaw(l_y_1 + 180);
                end;
                local finalYaw = -l_y_0;
                finalYaw = math.normalize_yaw(finalYaw + l_y_1 + 180);
                finalYaw = math.normalize_yaw(finalYaw + yawDelta);
                antiAimState.reference.yaw.offset:override(finalYaw);
                antiAimState.reference.freestanding.self:override(false);
                antiAimState.reference.yaw.hidden:override(false);
                antiAimState.reference.yaw.base:override("Local View");
            end;
        end);
    end;
    antiAimState.fast_ladder = function(localPlayer, cmd)
        local cameraAngles = render.camera_angles();
        if localPlayer.m_MoveType == 9 then
            if cmd.forwardmove > 0 and cameraAngles.x < 45 then
                cmd.view_angles.x = 89;
                cmd.view_angles.y = cmd.view_angles.y + 89;
                cmd.in_moveright = 1;
                cmd.in_moveleft = 0;
                cmd.in_forward = 0;
                cmd.in_back = 1;
            end;
            if cmd.forwardmove < 0 then
                cmd.view_angles.x = 89;
                cmd.view_angles.y = cmd.view_angles.y + 89;
                cmd.in_moveright = 0;
                cmd.in_moveleft = 1;
                cmd.in_forward = 1;
                cmd.in_back = 0;
            end;
            if cmd.sidemove == 0 then
                cmd.move_yaw = cmd.move_yaw + 90;
            end;
            if cmd.sidemove > 0 then
                cmd.move_yaw = cmd.move_yaw + 150;
            end;
            if cmd.sidemove < 0 then
                cmd.move_yaw = cmd.move_yaw + 30;
            end;
        end;
    end;
    antiAimState.extrapolate_position = function(position, ticks, entity)
        local l_m_vecVelocity_0 = entity.m_vecVelocity;
        for _ = 1, ticks do
            position = position + l_m_vecVelocity_0 * globals.tickinterval;
        end;
        return position;
    end;
    antiAimState.auto_teleport = function(localPlayer)
        -- upvalues: menu (ref), antiAimState (ref)
        if not menu["anti aim"].tweaks:get("Auto Teleport") then
            return;
        else
            local activeWeapon = localPlayer:get_player_weapon();
            if not activeWeapon then
                return;
            else
                local weaponType = activeWeapon:get_weapon_info().weapon_type;
                local weaponIndex = activeWeapon:get_weapon_index();
                local isPistol = weaponType == 1;
                local isRifle = weaponType == 5;
                local isAWP = weaponIndex == 9;
                local isScout = weaponIndex == 40;
                local isTaserOrZone = weaponIndex == 1 or weaponIndex == 64;
                local isKnife = weaponType == 0;
                local enemyPlayers = entity.get_players(true, false);
                local extrapolationDelay = menu["anti aim"].tweaks[0].delay:get();
                local targetPosition = antiAimState.extrapolate_position(localPlayer:get_hitbox_position(3), menu["anti aim"].tweaks[0].delay:get() * 16, localPlayer);
                if extrapolationDelay < 1 then
                    targetPosition = localPlayer:get_hitbox_position(0);
                end;
                for weaponSlot, isWeaponType in pairs({
                    [1] = isPistol, 
                    [2] = isRifle, 
                    [3] = isAWP, 
                    [4] = isScout, 
                    [5] = isTaserOrZone, 
                    [6] = isKnife, 
                    [7] = not isPistol and not isRifle and not isAWP and not isScout and not isTaserOrZone and not isKnife
                }) do
                    local weaponSlotName = menu["anti aim"].tweaks[0].weapon:list()[weaponSlot];
                    if weaponSlotName then
                        if menu["anti aim"].tweaks[0].in_air:get() and bit.band(localPlayer.m_fFlags, bit.lshift(1, 0)) ~= 0 then
                            return;
                        elseif menu["anti aim"].tweaks[0].weapon:get(weaponSlotName) and isWeaponType then
                            for enemyIndex = 1, #enemyPlayers do
                                local bulletDamage = utils.trace_bullet(enemyPlayers[enemyIndex], enemyPlayers[enemyIndex]:get_hitbox_position(0), targetPosition);
                                if enemyPlayers[enemyIndex]:is_alive() and enemyPlayers[enemyIndex]:is_visible(targetPosition) and bulletDamage > 0 and enemyPlayers[enemyIndex]:is_enemy() then
                                    if not antiAimState.main.auto_teleport.worked then
                                        rage.exploit:force_teleport();
                                        antiAimState.main.auto_teleport.worked = true;
                                    end;
                                else
                                    antiAimState.main.auto_teleport.worked = false;
                                end;
                            end;
                        end;
                    end;
                end;
                return;
            end;
        end;
    end;
    antiAimState.magnetize = function(localPlayer, userCmd)
        -- upvalues: menu (ref), antiAimState (ref), serenity_metadata (ref)
        local playerOrigin = localPlayer:get_origin();
        if menu["anti aim"].manual[0].magnet:get() then
            if antiAimState.main.magnetize.position == vector(0, 0, 0) then
                antiAimState.main.magnetize.position = playerOrigin;
            end;
        else
            antiAimState.main.magnetize.position = vector(0, 0, 0);
        end;
        if antiAimState.main.magnetize.position == vector(0, 0, 0) or antiAimState.main.magnetize.position:dist(playerOrigin) < 2 then
            return;
        else
            local eyePosition = localPlayer:get_eye_position();
            local angleToMagnetPos = serenity_metadata.calc_angle(eyePosition, antiAimState.main.magnetize.position);
            if angleToMagnetPos.y > -360 and angleToMagnetPos.y < 360 then
                antiAimState.reference.yaw.self:override("Backward");
                antiAimState.reference.yaw.base:override("Local View");
                if menu["anti aim"].manual[0].static:get() then
                    antiAimState.reference.yaw.hidden:override(false);
                    antiAimState.reference.yaw_modifier.self:override("Disabled");
                    antiAimState.reference.body_yaw.inverter:override(false);
                    antiAimState.reference.body_yaw.options:override({});
                end;
                antiAimState.reference.freestanding.self:override(false);
                userCmd.view_angles.y = 180 + angleToMagnetPos.y;
            end;
            return;
        end;
    end;
    antiAimState.animations = function(localPlayer, animationState)
        -- upvalues: antiAimState (ref), menu (ref), l_lambotruck_0 (ref), l_liberia_0 (ref)
        antiAimState.reference.misc.leg_movement:override(nil);
        if not menu["anti aim"].animations:get() or #menu["anti aim"].animations[0].select:get() == 0 then
            return;
        else
            local velocityDelta = math.abs(localPlayer.m_vecVelocity:length() - 1);
            local animationOverlays = {
                [6] = l_lambotruck_0.animation.overlay(animationState, 6), 
                [7] = l_lambotruck_0.animation.overlay(animationState, 7), 
                [12] = l_lambotruck_0.animation.overlay(animationState, 12)
            };
            if not animationOverlays[6] or not animationOverlays[12] then
                return;
            else
                if menu["anti aim"].animations[0].select:get("0 Pitch on Land") then
                    if not l_liberia_0.anti_aim.condition.get_state("air") then
                        antiAimState.main.animations.pitch_on_land.tick = antiAimState.main.animations.pitch_on_land.tick + 1;
                    else
                        antiAimState.main.animations.pitch_on_land.tick = 1;
                        antiAimState.main.animations.pitch_on_land.timeout = globals.realtime + 1;
                        antiAimState.main.animations.pitch_on_land.status = true;
                    end;
                    if antiAimState.main.animations.pitch_on_land.timeout + 0.5 <= globals.realtime then
                        antiAimState.main.animations.pitch_on_land.status = false;
                    end;
                    if antiAimState.main.animations.pitch_on_land.status and antiAimState.main.animations.pitch_on_land.tick > 1 and antiAimState.main.animations.pitch_on_land.timeout > globals.realtime then
                        localPlayer.m_flPoseParameter[12] = 0.5;
                    end;
                end;
                if menu["anti aim"].animations[0].select:get("Legs on Landing") then
                    local landingMode = menu["anti aim"].animations[0].landing:get();
                    if landingMode == "Static" then
                        antiAimState.reference.misc.leg_movement:override("Sliding");
                        localPlayer.m_flPoseParameter[0] = 0.25;
                    elseif landingMode == "Backward" then
                        antiAimState.reference.misc.leg_movement:override("Sliding");
                        localPlayer.m_flPoseParameter[0] = 0.5;
                    elseif landingMode == "Switch" then
                        antiAimState.reference.misc.leg_movement:override("Sliding");
                        localPlayer.m_flPoseParameter[0] = globals.tickcount % 4 >= 2 and 0.5 or 1;
                    elseif landingMode == "Shivering" then
                        if velocityDelta >= 3 and not l_liberia_0.anti_aim.condition.get_state("air") then
                            antiAimState.reference.misc.leg_movement:override(globals.tickcount % 4 >= 2 and "Sliding" or "Walking");
                            animationOverlays[7].m_flWeight = globals.tickcount % 4 >= 2 and 0 or 0.32;
                        end;
                    elseif landingMode == "Moonwalk" then
                        antiAimState.reference.misc.leg_movement:override("Walking");
                        localPlayer.m_flPoseParameter[7] = 1;
                        localPlayer.m_flPoseParameter[0] = 0.5;
                    end;
                end;
                if menu["anti aim"].animations[0].select:get("Legs in Air") and l_liberia_0.anti_aim.condition.get_state("air") then
                    local airMode = menu["anti aim"].animations[0].air:get();
                    if airMode == "Static" then
                        localPlayer.m_flPoseParameter[6] = 1;
                        animationOverlays[6].m_flWeight = 0;
                    elseif airMode == "Moonwalk" then
                        antiAimState.reference.misc.leg_movement:override("Walking");
                        localPlayer.m_flPoseParameter[7] = 1;
                        localPlayer.m_flPoseParameter[0] = 0.5;
                        animationOverlays[6].m_flWeight = 1;
                    end;
                end;
                if menu["anti aim"].animations[0].select:get("Body Lean") and velocityDelta >= 3 then
                    local leanAmount = menu["anti aim"].animations[0].lean:get();
                    animationOverlays[12].m_flWeight = animationOverlays[12].m_flWeight * (leanAmount * 0.05);
                end;
                return;
            end;
        end;
    end;
    antiAimState.builder = function(localPlayer)
        -- upvalues: serenity_metadata (ref), menu (ref), antiAimState (ref), game_state (ref), l_liberia_0 (ref), l_lambotruck_0 (ref), ui_references (ref)
        if serenity_metadata.split(menu["anti aim"].type:list()[menu["anti aim"].type:get()], "  ")[2] == "Disabled" then
            if not antiAimState.main.disabled then
                for _, referenceCategory in pairs(antiAimState.reference) do
                    if type(referenceCategory) == "table" then
                        for _, referenceElement in pairs(referenceCategory) do
                            referenceElement:override(nil);
                        end;
                    else
                        referenceCategory:override(nil);
                    end;
                end;
                antiAimState.main.inverter.tick = 0;
                antiAimState.main.disabled = true;
            end;
            return;
        else
            antiAimState.main.disabled = false;
            local l_self_0 = game_state.lp.self;
            if not l_self_0 or not l_self_0:is_alive() then
                return;
            else
                local teamName = "N";
                if serenity_metadata.split(menu["anti aim"].type:list()[menu["anti aim"].type:get()], "  ")[2] == "Teams" then
                    teamName = game_state.lp.team.name;
                end;
                local antiAimCondition = l_liberia_0.anti_aim.condition.get({
                    [1] = menu["anti aim"][("%s / %s / %s"):format("Standing", teamName, "enable")]:get() and "S" or "", 
                    [2] = menu["anti aim"][("%s / %s / %s"):format("Moving", teamName, "enable")]:get() and "M" or "", 
                    [3] = menu["anti aim"][("%s / %s / %s"):format("Slow Move", teamName, "enable")]:get() and "SW" or "", 
                    [4] = menu["anti aim"][("%s / %s / %s"):format("Crouch", teamName, "enable")]:get() and "C" or "", 
                    [5] = menu["anti aim"][("%s / %s / %s"):format("In Air", teamName, "enable")]:get() and "A" or "", 
                    [6] = menu["anti aim"][("%s / %s / %s"):format("Air Crouch", teamName, "enable")]:get() and "AC" or ""
                });
                antiAimCondition = ("%s / %s"):format(antiAimState.main.converter[antiAimCondition] or "Global", teamName);
                if menu["anti aim"][("%s / %s / %s"):format("Crouch Move", teamName, "enable")]:get() and l_liberia_0.anti_aim.condition.get_state("moving") and l_liberia_0.anti_aim.condition.get_state("crouch") then
                    antiAimCondition = ("%s / %s"):format("Crouch Move", teamName);
                end;
                local l_tweaks_0 = menu["anti aim"].tweaks;
                if globals.choked_commands == 0 then
                    local shouldInvert = antiAimState.data.get(teamName, antiAimCondition, "body_yaw") and not rage.antiaim:inverter() or false;
                    local invertDelayTicks = math.ceil(0.05 * antiAimState.data.get(teamName, antiAimCondition, "body_yaw", "delay"));
                    if invertDelayTicks > 0 and l_liberia_0.table.find(antiAimState.data.get(teamName, antiAimCondition, "body_yaw", "options"), "Jitter") ~= 0 then
                        if l_liberia_0.table.find(antiAimState.data.get(teamName, antiAimCondition, "body_yaw", "options"), "Randomize Jitter") ~= 0 then
                            invertDelayTicks = math.random(1, invertDelayTicks);
                        end;
                        if invertDelayTicks < antiAimState.main.inverter.tick then
                            antiAimState.main.inverter.active = not antiAimState.main.inverter.active;
                            antiAimState.main.inverter.tick = 0;
                        end;
                        antiAimState.reference.body_yaw.inverter:override(antiAimState.main.inverter.active);
                        antiAimState.main.inverter.tick = antiAimState.main.inverter.tick + 1;
                        shouldInvert = antiAimState.main.inverter.active;
                    else
                        antiAimState.main.inverter.tick = 0;
                    end;
                    antiAimState.reference.enable:override(true);
                    local pitchValue = antiAimState.data.get(teamName, antiAimCondition, "pitch");
                    antiAimState.reference.pitch:override(pitchValue);
                    local yawMode = antiAimState.data.get(teamName, antiAimCondition, "yaw");
                    if yawMode == "3-Way" or yawMode == "5-Way" then
                        antiAimState.reference.yaw.self:override("Backward");
                    else
                        antiAimState.reference.yaw.self:override(yawMode);
                    end;
                    local yawOffsetMode = antiAimState.data.get(teamName, antiAimCondition, "yaw", "mode");
                    if yawOffsetMode == "Static" then
                        antiAimState.reference.yaw.offset:override(antiAimState.data.get(teamName, antiAimCondition, "yaw", "offset"));
                    elseif yawOffsetMode == "L & R" then
                        antiAimState.reference.yaw.offset:override(antiAimState.data.get(teamName, antiAimCondition, "yaw", ("offset_%s"):format(shouldInvert and "l" or "r")));
                    end;
                    if yawMode == "3-Way" or yawMode == "5-Way" then
                        local yawWayCount, _ = yawMode:gsub("-Way", "");
                        local yawOffset = antiAimState.reference.yaw.offset:get_override();
                        local yawWayTable = {
                            [3] = {
                                [1] = nil, 
                                [2] = 0, 
                                [1] = -yawOffset, 
                                [3] = yawOffset
                            }, 
                            [5] = {
                                [1] = nil, 
                                [2] = nil, 
                                [3] = 0, 
                                [1] = -yawOffset, 
                                [2] = -yawOffset * 0.5, 
                                [4] = yawOffset * 0.5, 
                                [5] = yawOffset
                            }
                        };
                        local selectedYawOffset = l_lambotruck_0.numbers.ways("Way Yaw", yawWayTable[tonumber(yawWayCount)]);
                        antiAimState.reference.yaw.offset:override(selectedYawOffset);
                    end;
                    local yawModifierMode = antiAimState.data.get(teamName, antiAimCondition, "yaw_modifier");
                    if yawModifierMode == "3-Way" or yawModifierMode == "5-Way" then
                        antiAimState.reference.yaw_modifier.self:override("Center");
                    else
                        antiAimState.reference.yaw_modifier.self:override(yawModifierMode);
                    end;
                    local yawModifierOffsetMode = antiAimState.data.get(teamName, antiAimCondition, "yaw_modifier", "mode");
                    if yawModifierOffsetMode == "Static" then
                        antiAimState.reference.yaw_modifier.offset:override(antiAimState.data.get(teamName, antiAimCondition, "yaw_modifier", "offset"));
                    elseif yawModifierOffsetMode == "L & R" then
                        antiAimState.reference.yaw_modifier.offset:override(antiAimState.data.get(teamName, antiAimCondition, "yaw_modifier", ("offset_%s"):format(shouldInvert and "l" or "r")));
                    end;
                    if yawModifierMode == "3-Way" or yawModifierMode == "5-Way" then
                        local yawModifierWayCount, _ = yawModifierMode:gsub("-Way", "");
                        local yawModifierOffset = antiAimState.reference.yaw_modifier.offset:get_override();
                        local yawModifierWayTable = {
                            [3] = {
                                [1] = nil, 
                                [2] = 0, 
                                [1] = -yawModifierOffset, 
                                [3] = yawModifierOffset
                            }, 
                            [5] = {
                                [1] = nil, 
                                [2] = nil, 
                                [3] = 0, 
                                [1] = -yawModifierOffset, 
                                [2] = -yawModifierOffset * 0.5, 
                                [4] = yawModifierOffset * 0.5, 
                                [5] = yawModifierOffset
                            }
                        };
                        local selectedYawModifierOffset = l_lambotruck_0.numbers.ways("Way Yaw Modifier", yawModifierWayTable[tonumber(yawModifierWayCount)]);
                        antiAimState.reference.yaw_modifier.offset:override(selectedYawModifierOffset);
                    end;
                    if yawModifierMode == "Delay" then
                        antiAimState.reference.yaw.self:override("Backward");
                        antiAimState.reference.yaw_modifier.self:override("Disabled");
                        antiAimState.reference.yaw.offset:override(antiAimState.reference.yaw.offset:get_override() + antiAimState.data.get(teamName, antiAimCondition, "yaw_modifier", ("offset_%s"):format(antiAimState.main.inverter.active_tick and "l" or "r")));
                        antiAimState.main.inverter.yaw_tick = antiAimState.main.inverter.yaw_tick + 1;
                        if antiAimState.main.inverter.yaw_tick > antiAimState.data.get(teamName, antiAimCondition, "yaw_modifier", "tick") then
                            antiAimState.main.inverter.active_tick = not antiAimState.main.inverter.active_tick;
                            antiAimState.main.inverter.yaw_tick = 1;
                        end;
                    end;
                    if yawModifierMode == "Progressive" then
                        antiAimState.reference.yaw_modifier.self:override("Center");
                        antiAimState.reference.yaw_modifier.offset:override(globals.realtime * 32 % antiAimState.reference.yaw_modifier.offset:get_override());
                    end;
                    antiAimState.reference.body_yaw.self:override(antiAimState.data.get(teamName, antiAimCondition, "body_yaw"));
                    if antiAimState.data.get(teamName, antiAimCondition, "body_yaw", "mode") == "Default" then
                        antiAimState.reference.body_yaw.limit_l:override(antiAimState.data.get(teamName, antiAimCondition, "body_yaw", "limit_l"));
                        antiAimState.reference.body_yaw.limit_r:override(antiAimState.data.get(teamName, antiAimCondition, "body_yaw", "limit_r"));
                    else
                        local dynamicBodyYawLimit = globals.curtime * (globals.tickcount % 60) % 60;
                        antiAimState.reference.body_yaw.limit_l:override(dynamicBodyYawLimit);
                        antiAimState.reference.body_yaw.limit_r:override(dynamicBodyYawLimit);
                    end;
                    antiAimState.reference.body_yaw.options:override(antiAimState.data.get(teamName, antiAimCondition, "body_yaw", "options"));
                    antiAimState.reference.body_yaw.freestanding:override(antiAimState.data.get(teamName, antiAimCondition, "body_yaw", "freestanding"));
                    if invertDelayTicks > 0 then
                        local bodyYawOptions = antiAimState.data.get(teamName, antiAimCondition, "body_yaw", "options");
                        local jitterIndex = l_liberia_0.table.find(bodyYawOptions, "Jitter");
                        if jitterIndex ~= 0 then
                            table.remove(bodyYawOptions, jitterIndex);
                        end;
                        antiAimState.reference.body_yaw.options:override(bodyYawOptions);
                    end;
                end;
                antiAimState.reference.yaw.hidden:override(nil);
                ui_references.rage_bot["Double Tap"].options:override(nil);
                ui_references.rage_bot["Hide Shots"].options:override(nil);
                if antiAimState.data.get(teamName, antiAimCondition, "defensive_aa") then
                    local defensiveLcOption = antiAimState.data.get(teamName, antiAimCondition, "defensive_aa", "lc");
                    ui_references.rage_bot["Double Tap"].options:override(defensiveLcOption);
                    ui_references.rage_bot["Hide Shots"].options:override(defensiveLcOption == "Always On" and "Break LC" or nil);
                    antiAimState.reference.body_yaw.self:override(true);
                    antiAimState.reference.yaw.hidden:override(true);
                    local defensivePitchValue = antiAimState.data.get(teamName, antiAimCondition, "defensive_aa", "pitch");
                    defensivePitchValue = antiAimState.main.defensive.pitch[defensivePitchValue] or 0;
                    local defensivePitchOffset = antiAimState.data.get(teamName, antiAimCondition, "defensive_aa", "pitch_offset");
                    if defensivePitchValue == 1337 then
                        defensivePitchValue = defensivePitchOffset;
                    elseif defensivePitchValue == -8989 then
                        defensivePitchValue = globals.tickcount % 4 >= 2 and antiAimState.data.get(teamName, antiAimCondition, "defensive_aa", "pitch_offset_1") or antiAimState.data.get(teamName, antiAimCondition, "defensive_aa", "pitch_offset_2");
                    elseif defensivePitchValue == 2006 then
                        defensivePitchValue = math.random(-defensivePitchOffset, defensivePitchOffset);
                    elseif defensivePitchValue == 2023 then
                        defensivePitchValue = -(globals.curtime * 45 % 90);
                    end;
                    if defensivePitchValue ~= 12345 then
                        defensivePitchValue = math.clamp(defensivePitchValue, -89, 89);
                        rage.antiaim:override_hidden_pitch(defensivePitchValue);
                    end;
                    local defensiveYawValue = antiAimState.data.get(teamName, antiAimCondition, "defensive_aa", "yaw");
                    defensiveYawValue = antiAimState.main.defensive.yaw[defensiveYawValue] or 0;
                    local defensiveYawOffset = antiAimState.data.get(teamName, antiAimCondition, "defensive_aa", "yaw_offset");
                    if defensiveYawValue == 1337 then
                        defensiveYawValue = defensiveYawOffset;
                    elseif defensiveYawValue == 360 then
                        antiAimState.main.defensive.yaw_spin = antiAimState.main.defensive.yaw_spin + defensiveYawOffset * (antiAimState.data.get(teamName, antiAimCondition, "defensive_aa", "yaw_speed") / 360);
                        if antiAimState.main.defensive.yaw_spin >= 180 then
                            antiAimState.main.defensive.yaw_spin = -180;
                        elseif antiAimState.main.defensive.yaw_spin <= -180 then
                            antiAimState.main.defensive.yaw_spin = 180;
                        end;
                        defensiveYawValue = antiAimState.main.defensive.yaw_spin;
                    elseif defensiveYawValue == -180180 then
                        defensiveYawValue = globals.tickcount % 4 >= 2 and antiAimState.data.get(teamName, antiAimCondition, "defensive_aa", "yaw_offset_1") or antiAimState.data.get(teamName, antiAimCondition, "defensive_aa", "yaw_offset_2");
                    elseif defensiveYawValue == 2006 then
                        defensiveYawValue = math.random(-defensiveYawOffset, defensiveYawOffset);
                    elseif defensiveYawValue == 2020 then
                        defensiveYawValue = l_lambotruck_0.numbers.ways("Defensive / 3-Way", {
                            [1] = nil, 
                            [2] = 0, 
                            [1] = -defensiveYawOffset, 
                            [3] = defensiveYawOffset
                        });
                    elseif defensiveYawValue == 2023 then
                        defensiveYawValue = l_lambotruck_0.numbers.ways("Defensive / 5-Way", {
                            [1] = nil, 
                            [2] = nil, 
                            [3] = 0, 
                            [1] = -defensiveYawOffset, 
                            [2] = -defensiveYawOffset * 0.5, 
                            [4] = defensiveYawOffset * 0.5, 
                            [5] = defensiveYawOffset
                        });
                    end;
                    if defensiveYawValue ~= 12345 then
                        defensiveYawValue = math.clamp(defensiveYawValue, -180, 180);
                        rage.antiaim:override_hidden_yaw_offset(defensiveYawValue);
                    end;
                end;
                local safeOptionsRef = menu["anti aim"].safe;
                if #safeOptionsRef:get() ~= 0 and not antiAimState.main.legit_aa.status then
                    if safeOptionsRef:get("Knife & Air Crouch") then
                        local activeWeapon = l_self_0:get_player_weapon();
                        if activeWeapon then
                            local weaponInfo = activeWeapon:get_weapon_info();
                            if weaponInfo and weaponInfo.weapon_name == "weapon_knife" and l_liberia_0.anti_aim.condition.get_state("air_crouch") then
                                antiAimState.reference.yaw.offset:override(0);
                                antiAimState.reference.yaw_modifier.offset:override(0);
                                antiAimState.reference.yaw.hidden:override(false);
                                antiAimState.reference.body_yaw.self:override(false);
                            end;
                        end;
                    end;
                    if safeOptionsRef:get("Enemy Below") then
                        local threatEntity = entity.get_threat(true);
                        if threatEntity then
                            local originData = {
                                enemy = threatEntity:get_origin(), 
                                lp = l_self_0:get_origin()
                            };
                            if originData.enemy and originData.lp and originData.enemy.z <= originData.lp.z - 90 then
                                antiAimState.reference.yaw.offset:override(0);
                                antiAimState.reference.yaw_modifier.offset:override(0);
                                antiAimState.reference.yaw.hidden:override(false);
                                antiAimState.reference.body_yaw.self:override(false);
                            end;
                        end;
                    end;
                end;
                local manualYawSetting = menu["anti aim"].manual:get();
                if manualYawSetting ~= "Disabled" and manualYawSetting ~= "At Target" then
                    local manualYawOffset = antiAimState.main.manuals[manualYawSetting];
                    antiAimState.reference.freestanding.self:override(false);
                    if manualYawOffset then
                        antiAimState.reference.yaw.offset:override(manualYawOffset);
                        if manualYawSetting ~= "Backward" then
                            antiAimState.reference.yaw.hidden:override(false);
                        end;
                        if menu["anti aim"].manual[0].static:get() then
                            antiAimState.reference.yaw_modifier.self:override("Disabled");
                            antiAimState.reference.body_yaw.inverter:override(false);
                            antiAimState.reference.body_yaw.options:override({});
                        end;
                    end;
                end;
                antiAimState.reference.freestanding.self:override(false);
                if menu["anti aim"].freestanding:get() then
                    local freestandingMenu = menu["anti aim"].freestanding[0];
                    do
                        local freestandingConfig = freestandingMenu;
                        local l_status_0, _ = pcall(function()
                            -- upvalues: freestandingConfig (ref), manualYawSetting (ref), l_liberia_0 (ref), antiAimState (ref)
                            local freestandingDisablers = freestandingConfig.disablers:get();
                            local shouldEnableFreestanding = true;
                            for disablerIndex = 1, #freestandingDisablers do
                                local disablerName = freestandingDisablers[disablerIndex];
                                if disablerName == "Manual" then
                                    if manualYawSetting ~= "Disabled" and manualYawSetting ~= "At Target" then
                                        shouldEnableFreestanding = false;
                                    end;
                                elseif l_liberia_0.anti_aim.condition.get_state(antiAimState.main.freestanding.converter[disablerName]) then
                                    shouldEnableFreestanding = false;
                                end;
                            end;
                            antiAimState.reference.freestanding.self:override(shouldEnableFreestanding);
                            antiAimState.reference.freestanding.DYM:override(freestandingConfig.DYM:get());
                            antiAimState.reference.freestanding.BF:override(freestandingConfig.BF:get());
                        end);
                        if not l_status_0 then
                            antiAimState.reference.freestanding.self:override(true);
                            antiAimState.reference.freestanding.DYM:override(freestandingConfig.DYM:get());
                            antiAimState.reference.freestanding.BF:override(freestandingConfig.BF:get());
                        end;
                    end;
                end;
                antiAimState.reference.yaw.base:override(manualYawSetting == "At Target" and "At Target" or "Local View");
                if l_tweaks_0:get("AA on Use") then
                    antiAimState.legit_aa(l_self_0, localPlayer);
                    if antiAimState.main.legit_aa.status then
                        antiAimState.reference.freestanding.self:override(false);
                        antiAimState.reference.pitch:override("Disabled");
                        antiAimState.reference.yaw.offset:override(180);
                        antiAimState.reference.yaw.hidden:override(false);
                        antiAimState.reference.yaw.base:override("Local View");
                    end;
                end;
                antiAimState.reference.yaw.backstab:override(l_tweaks_0:get("Avoid Backstab"));
                if l_tweaks_0:get("Fast Ladder") then
                    antiAimState.fast_ladder(l_self_0, localPlayer);
                end;
                if l_tweaks_0:get("Edge Yaw") then
                    antiAimState.edge_yaw(l_self_0, localPlayer);
                end;
                if l_tweaks_0:get("Auto Teleport") then
                    antiAimState.auto_teleport(l_self_0);
                end;
                antiAimState.magnetize(l_self_0, localPlayer);
                return;
            end;
        end;
    end;
    pcall(function()
        ffi.cdef("        typedef unsigned long HANDLE;\n        typedef HANDLE HWND;\n        int GetPriorityClass(void* hProcess);\n        int SetPriorityClass(void* hProcess, int dwPriorityClass);\n        void* GetCurrentProcess();\n    ");
    end);
    local l_gradient_0 = render.gradient;
    local l_text_0 = render.text;
    local utils_ext = {
        is_bind = function(bindName)
            for _, bind in pairs(ui.get_binds()) do
                if bind.reference:name() == bindName and bind.active then
                    return bind;
                end;
            end;
            return false;
        end, 
        get = function(ref)
            if ref:get_override() ~= nil then
                return ref:get_override();
            else
                return ref:get();
            end;
        end, 
        add_spaces = function(text)
            local spaced = "";
            for i = 1, #text do
                spaced = spaced .. string.sub(text, i, i) .. " ";
            end;
            return spaced;
        end
    };
    utils_ext.crosshair_indicators = {
        converter = {
            SW = "SLOW MOVE", 
            M = "MOVING", 
            S = "STANDING", 
            G = "GLOBAL", 
            C = "CROUCH", 
            AC = "AIR CROUCH", 
            A = "IN AIR"
        }, 
        leaflets = {
            buttons = {
                D = false, 
                A = false
            }, 
            images = {
                branch = render.load_image_from_file("nl\\Serenity\\Branch.png", vector(600, 255)), 
                leaflet = render.load_image_from_file("nl\\Serenity\\Leaflet.png", vector(50, 60))
            }, 
            timeout = globals.realtime, 
            list = {}
        }, 
        executer = function()
            -- upvalues: game_state (ref), l_smooth_0 (ref), menu (ref), serenity_metadata (ref), utils_ext (ref), l_liberia_0 (ref), l_monylinear_0 (ref), ui_references (ref), antiAimState (ref)
            local l_self_1 = game_state.lp.self;
            local indicatorAlpha = 0;
            if not l_self_1 then
                indicatorAlpha = l_smooth_0.linear("Serenity", "Crosshair Indicators Alpha", ui.get_alpha() > 0);
            else
                indicatorAlpha = l_smooth_0.linear("Serenity", "Crosshair Indicators Alpha", l_self_1:is_alive() or ui.get_alpha() > 0);
            end;
            if not menu.settings.indicators:get() then
                indicatorAlpha = 0;
            end;
            if indicatorAlpha == 0 then
                return;
            else
                local scopedAlpha = 0;
                local screenX = serenity_metadata.screen.x * 0.5;
                local screenY = serenity_metadata.screen.y * 0.5;
                local indicatorsSettings = menu.settings.indicators[0];
                local indicatorStyle = indicatorsSettings.style:get();
                local showBranch = indicatorsSettings.revitalize:get();
                if indicatorsSettings.additions:get("To Scope") and l_self_1 then
                    scopedAlpha = l_smooth_0.linear("Serenity", "Crosshair Indicators Scope", l_self_1.m_bIsScoped);
                end;
                local indicatorData = {
                    header = ("serenity%s"):format(indicatorsSettings.display:get("Version") and (" %s"):format(serenity_metadata.build):lower() or ""), 
                    condition = utils_ext.crosshair_indicators.converter[l_liberia_0.anti_aim.condition.get()]
                };
                local sinePulse = math.sin(math.abs(-math.pi + globals.curtime * 2 % (math.pi * 1))) * 255;
                indicatorData.header = indicatorStyle == "Modern" and indicatorData.header:lower() or utils_ext.add_spaces(indicatorData.header:gsub(serenity_metadata.build:lower(), ""));
                local animatedHeader = {
                    header = l_monylinear_0:Animate(indicatorData.header, {
                        [1] = indicatorsSettings.colors:get("Header")[1], 
                        [2] = indicatorsSettings.colors:get("Header")[2]
                    }, 3), 
                    condition = l_monylinear_0:Animate(indicatorData.condition, {
                        [1] = indicatorsSettings.colors:get("Condition")[1], 
                        [2] = indicatorsSettings.colors:get("Condition")[2]
                    }, 3)
                };
                animatedHeader.header = indicatorStyle == "Modern" and animatedHeader.header:lower() or animatedHeader.header:upper() .. (indicatorsSettings.display:get("Version") and ("\a%sLUA"):format(color(255, 255, 255, sinePulse):to_hex()) or "");
                local textWidths = {
                    header = render.measure_text(indicatorStyle == "Modern" and 4 or 2, nil, animatedHeader.header).x * 0.5 + 5, 
                    condition = render.measure_text(2, nil, indicatorStyle == "Modern" and animatedHeader.condition or ("-%s-"):format(animatedHeader.condition or "MENU")).x * 0.5 + 5
                };
                local headerOffsetY = showBranch and 24 or 16;
                if indicatorsSettings.additions:get("Header Glow") then
                    render.shadow(vector(screenX - textWidths.header + 5 + (textWidths.header - (indicatorStyle == "Modern" and 1 or 0)) * scopedAlpha, screenY + headerOffsetY + 2), vector(screenX + textWidths.header - 5 + (textWidths.header - (indicatorStyle == "Modern" and 1 or 0)) * scopedAlpha, screenY + headerOffsetY + 2), indicatorsSettings.colors:get("Header")[1]);
                end;
                if showBranch then
                    local branchSize = {
                        size = vector(600, 255) * 0.08
                    };
                    render.shadow(vector(screenX - 16 + branchSize.size.x * 0.5 * scopedAlpha, screenY + 24), vector(screenX + 16 + branchSize.size.x * 0.5 * scopedAlpha, screenY + headerOffsetY), color("C577A6"));
                    render.texture(utils_ext.crosshair_indicators.leaflets.images.branch, vector(screenX - branchSize.size.x * 0.5 + branchSize.size.x * 0.5 * scopedAlpha, screenY - branchSize.size.y * 0.5 + headerOffsetY), branchSize.size, color(255, 255, 255, 255 * indicatorAlpha));
                    local _ = {};
                    for leafletIndex = 1, #utils_ext.crosshair_indicators.leaflets.list do
                        local leafletData = utils_ext.crosshair_indicators.leaflets.list[leafletIndex];
                        if leafletData then
                            if leafletData[3] > 255 then
                                leafletData[4] = true;
                            end;
                            if leafletData[3] < 0 then
                                leafletData[5] = true;
                            end;
                            render.texture(utils_ext.crosshair_indicators.leaflets.images.leaflet, vector(screenX + leafletData[1].x + leafletData[2].x + branchSize.size.x * 0.5 * scopedAlpha, screenY + 12 + leafletData[1].y + leafletData[2].y), vector(50, 60) * 0.1, color(255, 255, 255, leafletData[3] * indicatorAlpha));
                            local velocityDelta = vector(0, 0);
                            if utils_ext.crosshair_indicators.leaflets.buttons.A then
                                velocityDelta.x = velocityDelta.x + utils.random_float(0, 0.1);
                            end;
                            if utils_ext.crosshair_indicators.leaflets.buttons.D then
                                velocityDelta.x = velocityDelta.x - utils.random_float(0, 0.1);
                            end;
                            leafletData[2] = vector(velocityDelta.x + leafletData[2].x, velocityDelta.y + (leafletData[2].y + 0.1));
                            leafletData[3] = leafletData[4] and leafletData[3] - 1.5 or leafletData[3] + 1.5;
                        end;
                    end;
                    for leafletIndex = 1, #utils_ext.crosshair_indicators.leaflets.list do
                        local leafletData = utils_ext.crosshair_indicators.leaflets.list[leafletIndex];
                        if not leafletData or leafletData[5] then
                            table.remove(utils_ext.crosshair_indicators.leaflets.list, leafletIndex);
                        end;
                    end;
                    if utils_ext.crosshair_indicators.leaflets.timeout < globals.realtime and #utils_ext.crosshair_indicators.leaflets.list < 12 then
                        table.insert(utils_ext.crosshair_indicators.leaflets.list, {
                            [1] = nil, 
                            [2] = nil, 
                            [3] = 0, 
                            [4] = false, 
                            [5] = false, 
                            [1] = vector(utils.random_float(-24, 24), utils.random_float(0, 8)), 
                            [2] = vector(0, 0)
                        });
                        utils_ext.crosshair_indicators.leaflets.timeout = globals.realtime + utils.random_float(0, 0.5);
                    end;
                end;
                render.text(indicatorStyle == "Modern" and 4 or 2, vector(screenX + (textWidths.header - (indicatorStyle == "Modern" and 1 or 0)) * scopedAlpha, screenY + headerOffsetY), color(255, 255, 255, 255 * indicatorAlpha), "c", animatedHeader.header);
                if indicatorsSettings.display:get("Condition") then
                    if indicatorStyle == "Modern" then
                        headerOffsetY = headerOffsetY + 9;
                        render.text(2, vector(screenX + textWidths.condition * scopedAlpha, screenY + headerOffsetY), color(255, 255, 255, 255 * indicatorAlpha), "c", animatedHeader.condition);
                    else
                        headerOffsetY = headerOffsetY + 8;
                        render.text(2, vector(screenX + textWidths.condition * scopedAlpha, screenY + headerOffsetY), color(255, 255, 255, 255 * indicatorAlpha), "c", ("-%s\aDEFAULT-"):format(animatedHeader.condition or "MENU"));
                    end;
                else
                    headerOffsetY = headerOffsetY + 1;
                end;
                local bindsEnabled = indicatorsSettings.display:get("Binds");
                local indicators = {
                    references = {
                        [1] = {
                            name = "BA", 
                            show = indicatorStyle == "Modern" and "BODY" or "BODY AIM", 
                            active = bindsEnabled and indicatorsSettings.binds:get("Hide Shots") and ui_references.rage_bot["Body Aim"].self:get() == "Force"
                        }, 
                        [2] = {
                            name = "DT", 
                            show = indicatorStyle == "Modern" and ("\a%s%s"):format(serenity_metadata.percentage(rage.exploit:get(), color(64, 255, 64, 255), color(255, 64, 64, 255)):to_hex(), "DT") or "DT " .. ("\a%s%s"):format(serenity_metadata.percentage(rage.exploit:get(), color(64, 255, 64, 255), color(255, 64, 64, 255)):to_hex(), "RAPID"), 
                            active = bindsEnabled and indicatorsSettings.binds:get("Double Tap") and ui_references.rage_bot["Double Tap"].self:get()
                        }, 
                        [3] = {
                            name = "HS", 
                            show = indicatorStyle == "Modern" and "HS" or "HIDE SHOTS", 
                            active = bindsEnabled and indicatorsSettings.binds:get("Hide Shots") and ui_references.rage_bot["Hide Shots"].self:get()
                        }, 
                        [4] = {
                            name = "FD", 
                            show = indicatorStyle == "Modern" and "FD" or "DUCK", 
                            active = bindsEnabled and indicatorsSettings.binds:get("Fake Duck") and utils_ext.get(antiAimState.reference.misc.fake_duck)
                        }, 
                        [5] = {
                            name = "FS", 
                            show = indicatorStyle == "Modern" and "FS" or "FREESTANDING", 
                            active = bindsEnabled and indicatorsSettings.binds:get("Freestanding") and utils_ext.get(antiAimState.reference.freestanding.self)
                        }
                    }
                };
                indicators.executer = function()
                    -- upvalues: indicators (ref), l_smooth_0 (ref), headerOffsetY (ref), screenX (ref), scopedAlpha (ref), screenY (ref), indicatorAlpha (ref)
                    for refIndex = 1, #indicators.references do
                        local indicatorRef = indicators.references[refIndex];
                        local indicatorAlpha = l_smooth_0.linear("Serenity", ("Crosshair Indicators Bind %s"):format(indicatorRef.name), indicatorRef.active);
                        local textWidth = render.measure_text(2, nil, indicatorRef.show).x * 0.5 + 5;
                        headerOffsetY = headerOffsetY + 8 * indicatorAlpha;
                        render.text(2, vector(screenX + textWidth * scopedAlpha, screenY + headerOffsetY), color(255, 255, 255, 255 * indicatorAlpha * indicatorAlpha), "c", indicatorRef.show);
                    end;
                end;
                indicators.executer();
                return;
            end;
        end
    };
    utils_ext.minimum_damage = {
        element = l_system_0.register(menu.settings.damage[0].x, menu.settings.damage[0].y, 29, 12, function(widget)
            -- upvalues: menu (ref), utils_ext (ref), game_state (ref)
            if not widget.enable then
                return;
            else
                widget.name = "Minimum Damage";
                local posX = widget.position.x;
                local posY = widget.position.y;
                local width = widget.size.x;
                local height = widget.size.y;
                render.rect_outline(vector(posX, posY), vector(posX + width, posY + height), color(200, 200, 200, 255 * ui.get_alpha()), 1, 2);
                if menu.settings.damage[0].show:get() and utils_ext.is_bind("Min. Damage") == false and ui.get_alpha() < 0.5 then
                    return;
                else
                    local minDamageValue = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get();
                    if minDamageValue <= 0 then
                        minDamageValue = "AUTO";
                    end;
                    local alphaMod = 0;
                    if not game_state.lp.self then
                        alphaMod = ui.get_alpha() > 0 and 1 or 0;
                    else
                        alphaMod = (not not game_state.lp.self:is_alive() or ui.get_alpha() > 0) and 1 or 0;
                    end;
                    render.text(1, vector(posX + 2, posY - 1), menu.settings.damage[0].color:get():alpha_modulate(255 * alphaMod), nil, minDamageValue);
                    return;
                end;
            end;
        end, 8), 
        executer = function()
            -- upvalues: utils_ext (ref), menu (ref), game_state (ref)
            utils_ext.minimum_damage.element.enable = menu.settings.damage:get();
            if not menu.settings.damage:get() then
                return;
            elseif not game_state.lp.self and ui.get_alpha() < 0.5 then
                return;
            else
                utils_ext.minimum_damage.element:update();
                return;
            end;
        end
    };
    utils_ext.manual_arrows = {
        font = render.load_font("Calibri", vector(24, 25), "ab"), 
        executer = function()
            -- upvalues: game_state (ref), l_smooth_0 (ref), menu (ref), serenity_metadata (ref), antiAimState (ref), utils_ext (ref)
            local localPlayer = game_state.lp.self;
            local alpha = 0;
            if not localPlayer then
                alpha = l_smooth_0.linear("Serenity", "Manual Arrows Alpha", ui.get_alpha() > 0);
            else
                alpha = l_smooth_0.linear("Serenity", "Manual Arrows Alpha", localPlayer:is_alive() or ui.get_alpha() > 0);
            end;
            if not menu.settings.arrows:get() then
                alpha = 0;
            end;
            if alpha == 0 then
                return;
            else
                local centerX = serenity_metadata.screen.x * 0.5;
                local centerY = serenity_metadata.screen.y * 0.5;
                local arrowSettings = menu.settings.arrows[0];
                local arrowConfig = {
                    size = 16, 
                    offset = arrowSettings.offset:get(), 
                    style = arrowSettings.style:get(), 
                    display = arrowSettings.display:get(), 
                    inverted = antiAimState.main.inverter.tick ~= 0 and antiAimState.main.inverter.active or rage.antiaim:inverter(), 
                    teamskeet = {
                        arrowSettings.colors:get("Manual")[1]:alpha_modulate(255 * alpha), 
                        arrowSettings.colors:get("Inveted")[1]:alpha_modulate(255 * alpha)
                    }, 
                    press_manual = arrowSettings.color:get()
                };
                if arrowConfig.style == "Teamskeet" then
                    centerX = centerX + 1;
                    if arrowConfig.display == "Always On" or menu["anti aim"].manual:get("Right") then
                        render.poly(serenity_metadata.split(menu["anti aim"].type:list()[menu["anti aim"].type:get()], "  ")[2] ~= "Disabled" and menu["anti aim"].manual:get("Right") and arrowConfig.teamskeet[1] or color(20, 20, 20, 180), vector(centerX + arrowConfig.offset + arrowConfig.size * 0.8, centerY), vector(centerX + arrowConfig.offset, centerY - arrowConfig.size * 0.5), vector(centerX + arrowConfig.offset, centerY + arrowConfig.size * 0.5));
                    end;
                    render.rect(vector(centerX + arrowConfig.offset - 4, centerY - arrowConfig.size * 0.5), vector(centerX + arrowConfig.offset - 2, centerY + arrowConfig.size * 0.5), arrowConfig.inverted and arrowConfig.teamskeet[2] or color(20, 20, 20, 180));
                    centerX = centerX - 1;
                    if arrowConfig.display == "Always On" or menu["anti aim"].manual:get("Left") then
                        render.poly(serenity_metadata.split(menu["anti aim"].type:list()[menu["anti aim"].type:get()], "  ")[2] ~= "Disabled" and menu["anti aim"].manual:get("Left") and arrowConfig.teamskeet[1] or color(20, 20, 20, 180), vector(centerX - arrowConfig.offset - arrowConfig.size * 0.8, centerY), vector(centerX - arrowConfig.offset, centerY - arrowConfig.size * 0.5), vector(centerX - arrowConfig.offset, centerY + arrowConfig.size * 0.5));
                    end;
                    render.rect(vector(centerX - arrowConfig.offset + 2, centerY - arrowConfig.size * 0.5), vector(centerX - arrowConfig.offset + 4, centerY + arrowConfig.size * 0.5), not arrowConfig.inverted and arrowConfig.teamskeet[2] or color(20, 20, 20, 180));
                elseif arrowConfig.style == "Simple" then
                    local arrowColors = {
                        right = color(255, 255, 255, 128), 
                        left = color(255, 255, 255, 128)
                    };
                    if arrowConfig.display == "Always On" then
                        arrowColors.right = menu["anti aim"].manual:get("Right") and arrowConfig.press_manual or arrowColors.right;
                        arrowColors.left = menu["anti aim"].manual:get("Left") and arrowConfig.press_manual or arrowColors.left;
                    elseif arrowConfig.display == "Only on Manual" then
                        arrowColors.right = menu["anti aim"].manual:get("Right") and arrowConfig.press_manual or color(255, 255, 255, 0);
                        arrowColors.left = menu["anti aim"].manual:get("Left") and arrowConfig.press_manual or color(255, 255, 255, 0);
                    end;
                    render.text(utils_ext.manual_arrows.font, vector(centerX + arrowConfig.offset + 2, centerY + 2), arrowColors.right, "c", ">");
                    render.text(utils_ext.manual_arrows.font, vector(centerX - arrowConfig.offset - 2, centerY + 2), arrowColors.left, "c", "<");
                end;
                return;
            end;
        end
    };
    utils_ext.screen_widgets = {
        drawwing = function(posX, posY, width, height, text, alpha)
            -- upvalues: menu (ref)
            local style = menu.settings.widgets[0].style:get();
            local colors = {
                accent = menu.settings.widgets[0].color:get(), 
                background = menu.settings.widgets[0].background:get()
            };
            if style == "Default" then
                posY = posY + 1;
                height = height - 1;
                local modulatedColor = colors.background:alpha_modulate(colors.background.a * alpha);
                render.rect_outline(vector(posX - 1, posY - 1), vector(posX + width + 1, posY + height + 1), modulatedColor);
                modulatedColor = (colors.background * 0.5):alpha_modulate(colors.background.a * alpha);
                render.rect(vector(posX, posY), vector(posX + width, posY + height), modulatedColor);
                modulatedColor = (colors.background * 0.25):alpha_modulate(colors.background.a * alpha);
                render.rect(vector(posX + 2, posY + 2), vector(posX + width - 2, posY + height - 2), modulatedColor);
            elseif style == "Modern" then
                posX = posX - 1;
                width = width + 2;
                local accentModulated = colors.accent:alpha_modulate(colors.accent.a * alpha);
                local backgroundTransparent = colors.background:alpha_modulate(0);
                render.gradient(vector(posX - 1, posY - 1), vector(posX + width + 1, posY + height + 1), accentModulated, accentModulated, backgroundTransparent, backgroundTransparent, 5);
                render.rect(vector(posX, posY), vector(posX + width, posY + height), colors.background:alpha_modulate(colors.background.a * alpha), 5);
            elseif style == "Simple" then
                render.shadow(vector(posX, posY), vector(posX + width, posY + height), colors.accent:alpha_modulate(196 * alpha), 32, nil, 5);
                render.rect(vector(posX, posY), vector(posX + width, posY + height), colors.background:alpha_modulate(colors.background.a * alpha), 5);
            end;
            render.text(1, vector(posX + width * 0.5, posY + height * 0.5), color(255, 255, 255, 255 * alpha), "c", text);
        end, 
        spectators = {
            list = {}, 
            get = function(self, player)
                if not player then
                    self.list = {};
                    return self.list;
                else
                    local spectatorsList = {};
                    if player:is_alive() then
                        spectatorsList = player:get_spectators();
                    else
                        local observerTarget = player.m_hObserverTarget;
                        if not observerTarget then
                            self.list = {};
                            return self.list;
                        else
                            spectatorsList = observerTarget:get_spectators();
                        end;
                    end;
                    if spectatorsList == {} then
                        self.list = {};
                    end;
                    for i = 1, 64 do
                        self.list[i] = {
                            active = false, 
                            index = i
                        };
                    end;
                    if spectatorsList ~= nil then
                        for _, spectator in pairs(spectatorsList) do
                            local spectatorIndex = spectator:get_index();
                            do
                                local spectatorRef = spectator;
                                self.list[spectatorIndex] = {
                                    index = spectatorIndex, 
                                    avatar = spectatorRef:get_steam_avatar(), 
                                    active = (function()
                                        -- upvalues: spectatorRef (ref), player (ref)
                                        if spectatorRef == player then
                                            return false;
                                        else
                                            return true;
                                        end;
                                    end)()
                                };
                            end;
                        end;
                    end;
                    return self.list;
                end;
            end
        }, 
        velocity_warning = {
            interval = 0, 
            image = render.load_image_from_file("materials\\panorama\\images\\icons\\ui\\warning.svg", vector(35, 35)), 
            RGBHB = function(factor, customValue, flag)
                if not customValue then
                    customValue = 15;
                end;
                return (flag and 255 or 125) * (flag and 1.25 or 2) - (flag and 64 or 125) * factor, (flag and 200 or 195) * factor, customValue;
            end, 
            remap = function(value, min, max, from, to, clampFlag)
                if not from then
                    from = 0;
                end;
                if not to then
                    to = 1;
                end;
                local pct = (value - from) / (to - from);
                if clampFlag then
                    pct = math.min(1, math.max(0, PCT));
                end;
                return min + (max - min) * pct;
            end
        }, 
        defensive_indicator = {
            offset = 0, 
            time_out = 0, 
            image = render.load_image_from_file("nl\\Serenity\\LogoFull.png", vector(64, 64))
        }, 
        elements = {
            l_system_0.register(menu.settings.widgets[0].x_w, menu.settings.widgets[0].y_w, 100, 20, function(element)
                -- upvalues: serenity_metadata (ref), menu (ref), game_state (ref), utils_ext (ref)
                element.name = "Watermark";
                if not element.enable then
                    return;
                else
                    local posX = 0;
                    local posY = 0;
                    local l_x_2 = element.size.x;
                    local l_y_4 = element.size.y;
                    element.position.x = serenity_metadata.screen.x - l_x_2 - 5;
                    element.position.y = 5;
                    posX = element.position.x;
                    posY = element.position.y;
                    menu.settings.widgets[0].x_w:set(posX);
                    menu.settings.widgets[0].y_w:set(posY);
                    local colorHex = menu.settings.widgets[0].color:get():to_hex();
                    local watermarkText = ("\a%sserenity\aDEFAULT [%s] / %s   \a%s%s\aDEFAULT ms   \a%s%s\aDEFAULT time"):format(colorHex, serenity_metadata.build:lower(), serenity_metadata.username, colorHex, game_state.lp.ping.real, colorHex, common.get_date("%H:%M"));
                    utils_ext.screen_widgets.drawwing(posX, posY, l_x_2, l_y_4, watermarkText, 1 * (element.alpha / 255));
                    element.size.x = render.measure_text(1, nil, watermarkText).x + 7.5;
                    return;
                end;
            end, 8), 
            l_system_0.register(menu.settings.widgets[0].x_k, menu.settings.widgets[0].y_k, 100, 20, function(element)
                -- upvalues: menu (ref), utils_ext (ref), l_smooth_0 (ref)
                element.name = "Keybinds";
                if not element.enable then
                    return;
                else
                    local posX = element.position.x;
                    local posY = element.position.y;
                    local width = element.size.x;
                    local height = element.size.y;
                    if not element.global_alpha then
                        element.global_alpha = 0;
                    end;
                    local style = menu.settings.widgets[0].style:get();
                    local colorHex = menu.settings.widgets[0].color:get():to_hex();
                    utils_ext.screen_widgets.drawwing(posX, posY, width, height, ("\a%skeybinds\aDEFAULT"):format(style == "Default" and colorHex or color(255, 255, 255, 255):to_hex()), element.global_alpha / 255 * (element.alpha / 255));
                    if not element.size_x then
                        element.size_x = 0;
                    end;
                    element.size_x = 100;
                    local keybinds = {
                        offset = 2, 
                        alpha = ui.get_alpha() * 255, 
                        list = ui.get_binds()
                    };
                    keybinds.executer = function()
                        -- upvalues: keybinds (ref), l_smooth_0 (ref), element (ref), posX (ref), style (ref), posY (ref), width (ref)
                        for i = 1, #keybinds.list do
                            local bind = keybinds.list[i];
                            local alpha = l_smooth_0.linear("Serenity", ("Keybinds Alpha %s"):format(bind.reference:name()), bind.active) * (element.alpha / 255);
                            local modeStr = bind.mode == 1 and "holding" or "toggled";
                            if type(bind.value) == "number" then
                                modeStr = bind.value;
                            end;
                            modeStr = ("[%s]"):format(modeStr);
                            render.text(1, vector(posX + (style == "Simple" and 2 or 1), posY + 20 + keybinds.offset), color(255, 255, 255, 255 * alpha), nil, bind.name);
                            render.text(1, vector(posX + width - (style == "Simple" and 2 or 1), posY + 20 + keybinds.offset), color(255, 255, 255, 255 * alpha), "r", modeStr);
                            keybinds.offset = keybinds.offset + 13.5 * alpha;
                            local textWidth = render.measure_text(1, nil, bind.name).x + render.measure_text(1, nil, modeStr).x + 12;
                            if element.size_x < textWidth then
                                element.size_x = textWidth;
                            end;
                            keybinds.alpha = keybinds.alpha + alpha * 255;
                        end;
                    end;
                    keybinds.executer();
                    element.global_alpha = keybinds.alpha > 255 and 255 or keybinds.alpha;
                    element.size.x = l_smooth_0.unclamped_lerp(element.size.x, element.size_x, 16);
                    return;
                end;
            end, 8), 
            l_system_0.register(menu.settings.widgets[0].x_s, menu.settings.widgets[0].y_s, 100, 20, function(element)
                -- upvalues: menu (ref), utils_ext (ref), game_state (ref), l_smooth_0 (ref)
                element.name = "Spectators";
                if not element.enable then
                    return;
                else
                    local posX = element.position.x;
                    local posY = element.position.y;
                    local width = element.size.x;
                    local height = element.size.y;
                    if not element.global_alpha then
                        element.global_alpha = 0;
                    end;
                    local style = menu.settings.widgets[0].style:get();
                    local colorHex = menu.settings.widgets[0].color:get():to_hex();
                    utils_ext.screen_widgets.drawwing(posX, posY, width, height, ("\a%sspectators\aDEFAULT"):format(style == "Default" and colorHex or color(255, 255, 255, 255):to_hex()), element.global_alpha / 255 * (element.alpha / 255));
                    if not element.size_x then
                        element.size_x = 0;
                    end;
                    element.size_x = 100;
                    local spectators = {
                        offset = 2, 
                        alpha = ui.get_alpha() * 255, 
                        list = utils_ext.screen_widgets.spectators:get(game_state.lp.self)
                    };
                    spectators.executer = function()
                        -- upvalues: spectators (ref), l_smooth_0 (ref), element (ref), posX (ref), style (ref), posY (ref), width (ref), utils_ext (ref)
                        for i = 1, #spectators.list do
                            local spectator = spectators.list[i];
                            local entityObj = entity.get(spectator.index);
                            if entityObj then
                                local nameShort = string.sub(entityObj:get_name(), 1, 24);
                                local alpha = l_smooth_0.linear("Serenity", ("Spectators Alpha %s"):format(entityObj:get_name()), spectator.active) * (element.alpha / 255);
                                render.text(1, vector(posX + (style == "Simple" and 2 or 1), posY + 20 + spectators.offset), color(255, 255, 255, 255 * alpha), nil, nameShort);
                                if spectator.avatar and spectator.avatar.width >= 8 then
                                    render.texture(spectator.avatar, vector(posX + width - 10 - (style == "Simple" and 2 or 1), posY + 20 + 2 + spectators.offset), vector(10, 10), color(255, 255, 255, 255 * alpha), 2);
                                else
                                    render.texture(utils_ext.screen_widgets.spectators.undefined, vector(posX + width - 12 - (style == "Simple" and 2 or 1), posY + 20 + 2 + spectators.offset), vector(10, 10), color(255, 255, 255, 255 * alpha), 2);
                                end;
                                spectators.offset = spectators.offset + 13.5 * alpha;
                                local textWidth = (render.measure_text(1, nil, nameShort).x + 10 + 12) * alpha;
                                if element.size_x < textWidth then
                                    element.size_x = textWidth;
                                end;
                                spectators.alpha = spectators.alpha + alpha * 255;
                            end;
                        end;
                    end;
                    spectators.executer();
                    element.global_alpha = spectators.alpha > 255 and 255 or spectators.alpha;
                    element.size.x = l_smooth_0.unclamped_lerp(element.size.x, element.size_x, 16);
                    return;
                end;
            end, 8), 
            l_system_0.register(menu.settings.widgets[0].x_v, menu.settings.widgets[0].y_v, 150, 45, function(element)
                -- upvalues: l_smooth_0 (ref), serenity_metadata (ref), menu (ref), game_state (ref), utils_ext (ref)
                element.name = "Velocity Warning";
                if not element.enable then
                    return;
                else
                    local posX = element.position.x;
                    local posY = element.position.y;
                    local width = element.size.x;
                    local height = element.size.y;
                    local alpha = ui.get_alpha() * (element.alpha / 255);
                    render.rect_outline(vector(posX, posY), vector(posX + width, posY + height), color(255, 255, 255, 255 * alpha), 1, 3);
                    local mousePos = ui.get_mouse_position();
                    if alpha ~= 0 then
                        local mouseAlpha = l_smooth_0.linear("Serenity", "Velocity Warning Mouse Alpha", posX < mousePos.x and mousePos.x < posX + width and posY < mousePos.y and mousePos.y < posY + height) * alpha;
                        if mouseAlpha > 0 then
                            render.text(1, vector(posX, posY + height), color(222, 222, 222, 255 * mouseAlpha), nil, "Press RMB to center align");
                            if common.is_button_down(2) then
                                element.position.x = serenity_metadata.screen.x * 0.5 - element.size.x * 0.5 - 0.5;
                                menu.settings.widgets[0].x_v:set(element.position.x);
                            end;
                        end;
                    end;
                    posX = posX + 5;
                    posY = posY + 5;
                    local velocityModifier;
                    if game_state.lp.self == nil then
                        velocityModifier = alpha >= 0.5 and 0.5 or 1;
                    else
                        velocityModifier = game_state.lp.self:is_alive() and game_state.lp.self.m_flVelocityModifier or 0.5;
                    end;
                    local r, g, b = utils_ext.screen_widgets.velocity_warning.RGBHB(velocityModifier, 13);
                    local finalAlpha = utils_ext.screen_widgets.velocity_warning.remap(velocityModifier, 1, 0, 0.85, 1);
                    finalAlpha = (alpha > 0 and alpha or finalAlpha) * element.lp_alpha * (element.alpha / 255);
                    utils_ext.screen_widgets.velocity_warning.interval = utils_ext.screen_widgets.velocity_warning.interval + (1 - velocityModifier) * 0.7 + 0.3;
                    render.texture(utils_ext.screen_widgets.velocity_warning.image, vector(posX - 3, posY - 4), vector(41, 41), color(16, 16, 16, 255 * finalAlpha));
                    if finalAlpha > 0.7 then
                        render.rect(vector(posX + 13, posY + 11), vector(posX + 13 + 8, posY + 11 + 20), color(16, 16, 16, 255 * finalAlpha));
                    end;
                    local pulseAlpha = math.abs((utils_ext.screen_widgets.velocity_warning.interval * 0.01 % 2 - 1) * 255);
                    render.texture(utils_ext.screen_widgets.velocity_warning.image, vector(posX, posY), vector(35, 35), color(r, g, b, pulseAlpha * finalAlpha));
                    render.text(1, vector(posX + 35 + 8, posY + 3), color(255, 255, 255, 255 * finalAlpha), "b", string.format("%s %d%%", "Slowed down", velocityModifier * 100));
                    local barPosX = posX + 35 + 8;
                    local barPosY = posY + 3 + 17;
                    local barWidth = 95;
                    local barHeight = 12;
                    render.rect_outline(vector(barPosX, barPosY), vector(barPosX + barWidth, barPosY + barHeight), color(0, 0, 0, 255 * finalAlpha));
                    render.rect(vector(barPosX + 1, barPosY + 1), vector(barPosX + 1 + barWidth - 2, barPosY + 1 + barHeight - 2), color(16, 16, 16, 180 * finalAlpha));
                    render.rect(vector(barPosX + 1, barPosY + 1), vector(barPosX + 1 + math.floor((barWidth - 2) * velocityModifier), barPosY + 1 + barHeight - 2), color(r, g, b, 180 * finalAlpha));
                    return;
                end;
            end, 8), 
            l_system_0.register(menu.settings.widgets[0].x_d, menu.settings.widgets[0].y_d, 150, 65, function(element)
                -- upvalues: l_smooth_0 (ref), serenity_metadata (ref), menu (ref), ui_references (ref), utils_ext (ref)
                element.name = "Defensive Indicator";
                if not element.enable then
                    return;
                else
                    local posX = element.position.x;
                    local posY = element.position.y;
                    local width = element.size.x;
                    local height = element.size.y;
                    local alpha = ui.get_alpha() * (element.alpha / 255);
                    render.rect_outline(vector(posX, posY), vector(posX + width, posY + height), color(255, 255, 255, 255 * alpha), 1, 3);
                    local mousePos = ui.get_mouse_position();
                    if alpha ~= 0 then
                        local mouseAlpha = l_smooth_0.linear("Serenity", "Defensive Indicator Mouse Alpha", posX < mousePos.x and mousePos.x < posX + width and posY < mousePos.y and mousePos.y < posY + height) * alpha;
                        if mouseAlpha > 0 then
                            render.text(1, vector(posX, posY + height), color(222, 222, 222, 255 * mouseAlpha), nil, "Press RMB to center align");
                            if common.is_button_down(2) then
                                element.position.x = serenity_metadata.screen.x * 0.5 - element.size.x * 0.5 - 0.5;
                                menu.settings.widgets[0].x_d:set(element.position.x);
                            end;
                        end;
                    end;
                    local isActive = false;
                    if ui_references.rage_bot["Hide Shots"].self:get_override() or ui_references.rage_bot["Hide Shots"].self:get() then
                        if ui_references.rage_bot["Hide Shots"].options:get_override() then
                            isActive = ui_references.rage_bot["Hide Shots"].options:get_override() == "Break LC";
                        else
                            isActive = ui_references.rage_bot["Hide Shots"].options:get() == "Break LC";
                        end;
                    end;
                    if ui_references.rage_bot["Double Tap"].self:get_override() or ui_references.rage_bot["Double Tap"].self:get() then
                        if ui_references.rage_bot["Double Tap"].options:get_override() then
                            isActive = ui_references.rage_bot["Double Tap"].options:get_override() == "Always On";
                        else
                            isActive = ui_references.rage_bot["Double Tap"].options:get() == "Always On";
                        end;
                    end;
                    local pulseMultiplier = 1;
                    if globals.tickcount % 8 > utils.random_int(2, 7) and isActive then
                        pulseMultiplier = 3;
                    end;
                    if pulseMultiplier > 1 then
                        utils_ext.screen_widgets.defensive_indicator.time_out = globals.realtime + 0.24;
                    end;
                    local finalAlpha = (l_smooth_0.linear("Serenity", "Defensive Indicator", utils_ext.screen_widgets.defensive_indicator.time_out > globals.realtime) + alpha) * element.lp_alpha * (element.alpha / 255);
                    utils_ext.screen_widgets.defensive_indicator.offset = l_smooth_0.lerp(utils_ext.screen_widgets.defensive_indicator.offset, width * pulseMultiplier, 32);
                    posY = posY + 10;
                    local widgetColor = menu.settings.widgets[0].color:get();
                    render.texture(utils_ext.screen_widgets.defensive_indicator.image, vector(posX + width * 0.5 - 16 - 2, posY - 5), vector(32, 32), widgetColor * color(255, 255, 255, 255 * finalAlpha));
                    render.text(1, vector(posX + width * 0.5, posY + height * 0.25 + 15), color(255, 255, 255, 255 * finalAlpha), "c", "defensive choking");
                    render.shadow(vector(posX + width * 0.15, posY + height * 0.25 + 25), vector(posX + width - width * 0.15, posY + height * 0.25 + 30), widgetColor * color(255, 255, 255, 255 * finalAlpha), 24, nil, 3);
                    render.rect(vector(posX + utils_ext.screen_widgets.defensive_indicator.offset * 0.15, posY + height * 0.25 + 25), vector(posX + width - utils_ext.screen_widgets.defensive_indicator.offset * 0.15, posY + height * 0.25 + 30), widgetColor * color(255, 255, 255, 255 * finalAlpha), 3);
                    return;
                end;
            end, 8)
        }, 
        executer = function()
            -- upvalues: game_state (ref), utils_ext (ref), menu (ref), l_smooth_0 (ref)
            local alpha_state = 0;
            if not game_state.lp.self then
                alpha_state = ui.get_alpha() > 0 and 1 or 0;
            else
                alpha_state = (not not game_state.lp.self:is_alive() or ui.get_alpha() > 0) and 1 or 0;
            end;
            for i = 1, #utils_ext.screen_widgets.elements do
                local element = utils_ext.screen_widgets.elements[i];
                if not element.alpha then
                    element.alpha = 0;
                end;
                element.lp_alpha = alpha_state;
                element:update();
            end;
            for j = 1, #utils_ext.screen_widgets.elements do
                local element_inner = utils_ext.screen_widgets.elements[j];
                if not element_inner.alpha then
                    element_inner.alpha = 0;
                end;
                if menu.settings.widgets:get() and menu.settings.widgets[0].display:get(element_inner.name) then
                    element_inner.alpha = l_smooth_0.unclamped_lerp(element_inner.alpha, 255, 12);
                else
                    element_inner.alpha = l_smooth_0.unclamped_lerp(element_inner.alpha, 0, 12);
                end;
                element_inner.enable = element_inner.alpha ~= 0;
            end;
        end
    };
    utils_ext.watermark = {
        logo_16 = render.load_image_from_file("nl\\Serenity\\LogoSmall.png", vector(32, 32)), 
        always_mark = function()
            -- upvalues: menu (ref), serenity_metadata (ref), utils_ext (ref)
            if menu.settings.widgets:get() and menu.settings.widgets[0].display:get("Watermark") then
                return;
            elseif not menu.settings.watermark:get("Simple") then
                return;
            else
                local v477 = menu.settings.watermark[0].color:get():alpha_modulate(255);
                local v478 = v477:alpha_modulate(0);
                local v479 = "discord.gg/serenitylua";
                local v480 = render.measure_text(1, nil, v479);
                local v481 = vector(serenity_metadata.screen.x - v480.x - 10, 15);
                render.gradient(v481 - vector(45, 10), v481 + vector(v480.x + 5, 10), v478, v477, v478, v477, 4);
                render.texture(utils_ext.watermark.logo_16, v481 + vector(v480.x - 17, -7), vector(16, 16), color(16, 16, 16, 255));
                render.texture(utils_ext.watermark.logo_16, v481 + vector(v480.x - 18, -8), vector(16, 16), color(255, 255, 255, 255));
                render.text(1, v481 + vector(v480.x * 0.5 - 22, 0), color(), "c", v479);
                return;
            end;
        end, 
        executer = function()
            -- upvalues: menu (ref), l_monylinear_0 (ref), utils_ext (ref), serenity_metadata (ref)
            local watermark_settings = menu.settings.watermark[0];
            local watermark_type = menu.settings.watermark:get();
            local watermark_color = watermark_settings.color:get():alpha_modulate(255);
            if watermark_type == "Serenity" or watermark_type == "Emoji" then
                local watermark_position = watermark_settings.position:get();
                local animated_text = l_monylinear_0:Animate(watermark_type == "Emoji" and "\240\159\134\130 \240\159\133\180 \240\159\134\129 \240\159\133\180 \240\159\133\189 \240\159\133\184 \240\159\134\131 \240\159\134\136" or "S E R E N I T Y", {
                    watermark_color, 
                    color(60, 60, 60, 255)
                }, 2);
                if watermark_position == "Below" then
                    local watermark_display_type = watermark_settings.type:get();
                    if watermark_display_type == "Full" or watermark_display_type == "Only Logo" then
                        render.texture(utils_ext.watermark.logo, vector(serenity_metadata.screen.x * 0.5 - 12.5, serenity_metadata.screen.y - 50 + (watermark_display_type == "Only Logo" and 20 or 0)), vector(25, 25), watermark_color);
                    end;
                    if watermark_display_type == "Full" or watermark_display_type == "Only Text" then
                        render.text(1, vector(serenity_metadata.screen.x * 0.5, serenity_metadata.screen.y - 12.5), watermark_color, "c", ("%s"):format(animated_text));
                    end;
                else
                    local text_size = render.measure_text(1, nil, animated_text) * 0.5;
                    if watermark_position == "Left" then
                        render.text(1, vector(text_size.x + 20, serenity_metadata.screen.y * 0.5 + 10), watermark_color, "c", ("%s"):format(animated_text));
                    elseif watermark_position == "Right" then
                        render.text(1, vector(serenity_metadata.screen.x - text_size.x - 20, serenity_metadata.screen.y * 0.5 + 10), watermark_color, "c", ("%s"):format(animated_text));
                    end;
                end;
            elseif watermark_type == "Anime" then
                render.texture(utils_ext.watermark.anime, vector(5, serenity_metadata.screen.y * 0.5), vector(33.75, 47.8125));
                render.text(2, vector(42, serenity_metadata.screen.y * 0.5 + 25 - 8), color(255, 255, 255, 255), "l", ("Serenity  \a%s[%s]"):format(watermark_color:to_hex(), serenity_metadata.build):upper());
                render.text(2, vector(42, serenity_metadata.screen.y * 0.5 + 25 + 2), color(255, 255, 255, 255), "l", ("User  -  \a%s%s"):format(watermark_color:to_hex(), serenity_metadata.username):upper());
            end;
        end
    };
    utils_ext.skeet = {
        offset = 0, 
        font = render.load_font("Calibri", vector(24, 23.5), "ab"), 
        bomb = render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg", vector(64, 64)), 
        planting = {
            self = false, 
            time = 0, 
            site = ""
        }, 
        vars = {
            shots = 0, 
            hits = 0
        }, -- continue
        shadow = function(_, top_left_pos, bottom_right_pos, gradient_color)
            -- upvalues: l_gradient_0 (ref)
            local transparent_color = gradient_color:alpha_modulate(0);
            l_gradient_0(top_left_pos - vector(20), vector(top_left_pos.x + bottom_right_pos.x * 0.5, bottom_right_pos.y), transparent_color, gradient_color, transparent_color, gradient_color);
            l_gradient_0(vector(top_left_pos.x + bottom_right_pos.x * 0.5, top_left_pos.y), bottom_right_pos + vector(20), gradient_color, transparent_color, gradient_color, transparent_color);
        end, 
        render = function(render_data, text, text_color, show_bomb_icon)
            -- upvalues: serenity_metadata (ref), l_text_0 (ref)
            local formatted_text = show_bomb_icon and (" %s"):format(text) or text;
            local text_size = render.measure_text(render_data.font, nil, formatted_text);
            local icon_offset = show_bomb_icon and 32 or 0;
            text_size.x = icon_offset + text_size.x;
            local render_position = vector(25, serenity_metadata.screen.y / 1.55 - 1 + (text_size.y + 16) * render_data.offset);
            render_data:shadow(render_position - vector(10, 7), render_position + vector(text_size.x + 7, text_size.y + 2), color(0, 0, 0, 50));
            if show_bomb_icon then
                render.texture(render_data.bomb, render_position - vector(0, 6), vector(32, 32), text_color);
            end;
            l_text_0(render_data.font, render_position + vector(icon_offset, 0), color(0, 100), nil, formatted_text);
            l_text_0(render_data.font, render_position + vector(icon_offset, 1), color(0, 55), nil, formatted_text);
            l_text_0(render_data.font, render_position + vector(icon_offset + 1, 1), color(0, 100), nil, formatted_text);
            l_text_0(render_data.font, render_position + vector(icon_offset, 0), text_color, nil, formatted_text);
            return vector(render_position.x + render.measure_text(render_data.font, nil, formatted_text).x, render_position.y);
        end, 
        clear_planting_info = function(plant_info)
            plant_info.planting.self = false;
            plant_info.planting.time = 0;
            plant_info.planting.site = "";
        end, 
        bomb_begin_plant = function(plant_info, plant_data)
            local player_resource = entity.get_player_resource();
            if not player_resource then
                return;
            else
                local bombsite_centers = {
                    a = player_resource.m_bombsiteCenterA, 
                    b = player_resource.m_bombsiteCenterB
                };
                local site_entity = entity.get(plant_data.site);
                if not site_entity then
                    return;
                else
                    local site_center = site_entity.m_vecMins:lerp(site_entity.m_vecMaxs, 0.5);
                    if not site_center then
                        return;
                    else
                        local distance_sq = {
                            a = site_center:distsqr(bombsite_centers.a), 
                            b = site_center:distsqr(bombsite_centers.b)
                        };
                        plant_info.planting.self = true;
                        plant_info.planting.time = globals.curtime;
                        plant_info.planting.site = distance_sq.b > distance_sq.a and "A" or "B";
                        return;
                    end;
                end;
            end;
        end, 
        aim_ack = function(aim_data, shot_info)
            aim_data.vars.shots = aim_data.vars.shots + 1;
            if not shot_info.state then
                aim_data.vars.hits = aim_data.vars.hits + 1;
            end;
        end, 
        get_spectators = function(player)
            local spectators = nil;
            if player:is_alive() then
                spectators = player:get_spectators();
            else
                local observer_target = player.m_hObserverTarget;
                if not observer_target or not entity.get(observer_target) then
                    return;
                else
                    spectators = observer_target:get_spectators();
                end;
            end;
            return spectators;
        end, 
        executer = function(hud_handler)
            -- upvalues: game_state (ref), menu (ref), utils_ext (ref), ui_references (ref), serenity_metadata (ref), antiAimState (ref)
            local local_player = game_state.lp.self;
            if not local_player or not menu.settings.skeet:get() then
                return;
            else
                local skeet_config = {
                    gear = menu.settings.skeet[0]
                };
                hud_handler.offset = 1;
                if local_player:is_alive() or ui.get_alpha() > 0 then
                    local hitchance_bind_active = utils_ext.is_bind("Hit Chance");
                    if skeet_config.gear.display:get("Hit Chance") and hitchance_bind_active then
                        hud_handler:render("HITCHANCE OVR", color(255, 255, 255, 245), false);
                        hud_handler.offset = hud_handler.offset - 1;
                    end;
                    if skeet_config.gear.display:get("Aimbot Stats") then
                        local accuracy_percent = 0;
                        if hud_handler.vars.hits ~= 0 or hud_handler.vars.shots ~= 0 then
                            accuracy_percent = hud_handler.vars.hits / hud_handler.vars.shots * 100;
                        end;
                        hud_handler:render(("%i / %i (%.1f)"):format(hud_handler.vars.hits, hud_handler.vars.shots, accuracy_percent), color(255, 255, 255, 245), false);
                        hud_handler.offset = hud_handler.offset - 1;
                    end;
                    if skeet_config.gear.display:get("Fake Latency") and (ui_references.main["Fake Latency"].self:get_override() and ui_references.main["Fake Latency"].self:get_override() ~= 0 or ui_references.main["Fake Latency"].self:get() ~= 0) then
                        local incoming_latency = game_state.lp.ping.incoming;
                        local latency_color = color();
                        if incoming_latency < 0.5 then
                            latency_color = serenity_metadata.percentage(incoming_latency * 2, color(165, 195, 40), color(255, 235, 160));
                        else
                            latency_color = serenity_metadata.percentage((incoming_latency - 0.5) * 2, color(170, 235, 15), color(165, 195, 40));
                        end;
                        do
                            local safe_latency_color = latency_color;
                            pcall(function()
                                -- upvalues: utils_ext (ref), hud_handler (ref), safe_latency_color (ref)
                                local _ = utils_ext.is_bind("Fake Latency");
                                hud_handler:render("PING", safe_latency_color:alpha_modulate(205), false);
                                hud_handler.offset = hud_handler.offset - 1;
                            end);
                        end;
                    end;
                    if skeet_config.gear.display:get("Double Tap") and not antiAimState.reference.misc.fake_duck:get() and (ui_references.rage_bot["Double Tap"].self:get_override() or ui_references.rage_bot["Double Tap"].self:get()) then
                        local double_tap_color = color(255, 255, 255, 205);
                        if rage.exploit:get() ~= 1 then
                            double_tap_color = color(255, 0, 50, 245);
                        end;
                        hud_handler:render("DT", double_tap_color, false);
                        hud_handler.offset = hud_handler.offset - 1;
                    end;
                    if skeet_config.gear.display:get("Hide Shots") and not antiAimState.reference.misc.fake_duck:get() and not ui_references.rage_bot["Double Tap"].self:get_override() and not ui_references.rage_bot["Double Tap"].self:get() and (ui_references.rage_bot["Hide Shots"].self:get_override() or ui_references.rage_bot["Hide Shots"].self:get()) then
                        hud_handler:render("OSAA", color(255, 255, 255, 205), false);
                        hud_handler.offset = hud_handler.offset - 1;
                    end;
                    if skeet_config.gear.display:get("Dormant Aimbot") and (ui_references.rage_bot.Enabled.dormant_aimbot:get_override() or ui_references.rage_bot.Enabled.dormant_aimbot:get()) then
                        local dormant_aim_color = color(255, 255, 255, 205);
                        local dormant_threat = entity.get_threat();
                        if dormant_threat and dormant_threat:is_dormant() then
                            dormant_aim_color = color(255, 0, 50, 245);
                        end;
                        hud_handler:render("DA", dormant_aim_color, false);
                        hud_handler.offset = hud_handler.offset - 1;
                    end;
                    if skeet_config.gear.display:get("Fake Duck") and (antiAimState.reference.misc.fake_duck:get_override() or antiAimState.reference.misc.fake_duck:get()) then
                        hud_handler:render("DUCK", color(255, 255, 255, 205));
                        hud_handler.offset = hud_handler.offset - 1;
                    end;
                    if skeet_config.gear.display:get("Safe Points") and (ui_references.rage_bot["Safe Points"].self:get_override() and ui_references.rage_bot["Safe Points"].self:get_override() == "Force" or ui_references.rage_bot["Safe Points"].self:get() == "Force") then
                        hud_handler:render("SAFE", color(255, 255, 255, 205));
                        hud_handler.offset = hud_handler.offset - 1;
                    end;
                    if skeet_config.gear.display:get("Body Aim") and (ui_references.rage_bot["Body Aim"].self:get_override() and ui_references.rage_bot["Body Aim"].self:get_override() == "Force" or ui_references.rage_bot["Body Aim"].self:get() == "Force") then
                        hud_handler:render("BODY", color(255, 255, 255, 205));
                        hud_handler.offset = hud_handler.offset - 1;
                    end;
                    local min_damage_active = utils_ext.is_bind("Min. Damage");
                    if skeet_config.gear.display:get("Minimum Damage") and min_damage_active then
                        hud_handler:render("MD", color(255, 255, 255, 205));
                        hud_handler.offset = hud_handler.offset - 1;
                    end;
                    if skeet_config.gear.display:get("Freestanding") and (antiAimState.reference.freestanding.self:get_override() or antiAimState.reference.freestanding.self:get()) then
                        hud_handler:render("FS", color(255, 255, 255, 205));
                        hud_handler.offset = hud_handler.offset - 1;
                    end;
                end;
                entity.get_entities("CPlantedC4", false, function(planted_c4_entity)
                    -- upvalues: skeet_config (ref), serenity_metadata (ref), local_player (ref), hud_handler (ref)
                    if not planted_c4_entity or planted_c4_entity.m_bBombDefused then
                        return;
                    else
                        if skeet_config.gear.display:get("Bomb Info") or skeet_config.gear.display:get("Defusing") then
                            local bomb_timer_remaining = planted_c4_entity.m_flC4Blow - globals.curtime;
                            if bomb_timer_remaining >= 0 then
                                local defuse_info = {
                                    timer = 0, 
                                    start = planted_c4_entity.m_hBombDefuser ~= nil, 
                                    length = planted_c4_entity.m_flDefuseLength
                                };
                                defuse_info.timer = defuse_info.start and (planted_c4_entity.m_flDefuseCountDown - globals.curtime) / 1 or -1;
                                if defuse_info.timer > 0 and skeet_config.gear.display:get("Defusing") then
                                    local defuse_color = defuse_info.timer < bomb_timer_remaining and color(40, 140, 50, 200) or color(200, 24, 0, 200);
                                    render.rect(vector(0, 0), vector(20, serenity_metadata.screen.y), color(5, 5, 5, 200));
                                    render.rect(vector(1, serenity_metadata.screen.y - (serenity_metadata.screen.y + 70) / defuse_info.length * defuse_info.timer), vector(19, serenity_metadata.screen.y), defuse_color);
                                end;
                                local bomb_site_letter = planted_c4_entity.m_nBombSite == 0 and "A" or "B";
                                local current_player = local_player:is_alive() and local_player or local_player.m_hObserverTarget;
                                local player_health = current_player and current_player.m_iHealth or 0;
                                if skeet_config.gear.display:get("Bomb Info") then
                                    hud_handler:render(("%s - %.1fs"):format(bomb_site_letter, bomb_timer_remaining), color(255, 255, 255, 205), true);
                                    hud_handler.offset = hud_handler.offset - 1;
                                end;
                                if current_player then
                                    local distance_to_bomb = current_player:get_origin():dist(planted_c4_entity:get_origin());
                                    local explosion_damage = 0;
                                    explosion_damage = 500;
                                    local damage_falloff_factor = explosion_damage * 3.5;
                                    explosion_damage = explosion_damage * math.exp(-(distance_to_bomb * distance_to_bomb / (damage_falloff_factor * 2 / 3 * (damage_falloff_factor / 3))));
                                    explosion_damage = math.max(explosion_damage, 0);
                                    local armor_info = {
                                        bonus = 0.5, 
                                        ratio = 0.5, 
                                        value = current_player.m_ArmorValue or 0
                                    };
                                    if armor_info.value > 0 then
                                        local adjusted_damage = explosion_damage * armor_info.ratio;
                                        if (explosion_damage - adjusted_damage) * armor_info.bonus > armor_info.value then
                                            adjusted_damage = explosion_damage - armor_info.value * (1 / armor_info.bonus);
                                        end;
                                        explosion_damage = adjusted_damage;
                                    end;
                                    if skeet_config.gear.display:get("Bomb Info") and current_player then
                                        if player_health < explosion_damage then
                                            hud_handler:render("FATAL", color(255, 0, 50, 245), false);
                                            hud_handler.offset = hud_handler.offset - 1;
                                        elseif explosion_damage > 1 then
                                            hud_handler:render(("-%i HP"):format(explosion_damage), color(252, 243, 105, 205), false);
                                            hud_handler.offset = hud_handler.offset - 1;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                        return;
                    end;
                end);
                if hud_handler.planting.self and skeet_config.gear.display:get("Bomb Info") then
                    local planting_render_pos = hud_handler:render(("%s"):format(hud_handler.planting.site), color(252, 243, 105, 205), true);
                    hud_handler.offset = hud_handler.offset - 1;
                    local planting_timer = 3.125 - (3.125 + hud_handler.planting.time - globals.curtime);
                    if planting_timer > 3.125 then
                        planting_timer = 3.125;
                    end;
                    local planting_site_text_width = render.measure_text(hud_handler.font, nil, hud_handler.planting_site).x;
                    render.circle_outline(vector(planting_site_text_width + planting_render_pos.x + 48.5, planting_render_pos.y + 9), color(0, 0, 0, 200), 11, 0, 1, 5);
                    render.circle_outline(vector(planting_site_text_width + planting_render_pos.x + 48.5, planting_render_pos.y + 9), color(213, 213, 214, 255), 10, 0, planting_timer * 0.32114155788, 3);
                    if planting_timer * 0.32114155788 > 0.99 then
                        utils_ext.skeet:clear_planting_info();
                    end;
                end;
                return;
            end;
        end, 
        spectators = function(event)
            -- upvalues: game_state (ref), menu (ref), serenity_metadata (ref)
            local local_player = game_state.lp.self;
            if not local_player or not menu.settings.skeet:get() or not menu.settings.skeet[0].spectators:get() then
                return;
            else
                local spectators_list = event.get_spectators(local_player);
                if not spectators_list then
                    return;
                else
                    local vertical_offset = menu.settings.skeet[0].offset:get();
                    for spectator_index = 1, #spectators_list do
                        if spectators_list[spectator_index] and entity.get(spectators_list[spectator_index]) then
                            local spectator_name = spectators_list[spectator_index]:get_name();
                            if spectator_name ~= "GOTV" then
                                render.text(1, vector(serenity_metadata.screen.x - 10, 5 + vertical_offset), color(255, 200), "r", spectator_name);
                                vertical_offset = vertical_offset + 20;
                            end;
                        end;
                    end;
                    return;
                end;
            end;
        end
    };
    utils_ext.custom_scope = {
        executer = function()
            -- upvalues: game_state (ref), menu (ref), l_smooth_0 (ref), serenity_metadata (ref)
            local local_player = game_state.lp.self;
            if not local_player or not menu.settings.scope:get() then
                return;
            else
                local scope_alpha = l_smooth_0.linear("Slowed", "Custom Scope", local_player.m_bIsScoped and local_player:is_alive());
                if scope_alpha == 0 then
                    return;
                else
                    local center_x = serenity_metadata.screen.x * 0.5;
                    local center_y = serenity_metadata.screen.y * 0.5;
                    local scope_settings = {
                        gear = menu.settings.scope[0]
                    };
                    scope_settings.start = scope_settings.gear.start:get();
                    scope_settings.length = scope_settings.gear.length:get() * scope_alpha;
                    scope_settings.inverter = scope_settings.gear.inverter:get();
                    scope_settings.hidden = scope_settings.gear.hidden;
                    scope_settings.color_t = scope_settings.gear.color:get();
                    scope_settings.color_n = color(255, 255, 255, 255);
                    local color_alpha = scope_settings.color_t.a;
                    scope_settings.color_t = scope_settings.color_t:alpha_modulate((scope_settings.inverter and 0 or color_alpha) * scope_alpha);
                    scope_settings.color_n = scope_settings.color_t:alpha_modulate((scope_settings.inverter and color_alpha or 0) * scope_alpha);
                    if not scope_settings.hidden:get("Up") then
                        render.gradient(vector(center_x, center_y - scope_settings.start + 1), vector(center_x + 1, center_y - scope_settings.start - scope_settings.length - 1), scope_settings.color_t, scope_settings.color_t, scope_settings.color_n, scope_settings.color_n);
                    end;
                    if not scope_settings.hidden:get("Down") then
                        render.gradient(vector(center_x, center_y + scope_settings.start), vector(center_x + 1, center_y + scope_settings.start + scope_settings.length), scope_settings.color_t, scope_settings.color_t, scope_settings.color_n, scope_settings.color_n);
                    end;
                    if not scope_settings.hidden:get("Left") then
                        render.gradient(vector(center_x - scope_settings.start - scope_settings.length - 1, center_y), vector(center_x - scope_settings.start + 1, center_y + 1), scope_settings.color_n, scope_settings.color_t, scope_settings.color_n, scope_settings.color_t);
                    end;
                    if not scope_settings.hidden:get("Right") then
                        render.gradient(vector(center_x + scope_settings.start, center_y), vector(center_x + scope_settings.start + scope_settings.length, center_y + 1), scope_settings.color_t, scope_settings.color_n, scope_settings.color_t, scope_settings.color_n);
                    end;
                    return;
                end;
            end;
        end
    };
    utils_ext.clantag = {
        last = "", 
        multiplier_text = function(char, repeat_count)
            local result_string = "";
            for _ = 1, repeat_count do
                result_string = ("%s%s"):format(result_string, char);
            end;
            return result_string;
        end, 
        to_tick = function(base_text, tick_array, net_channel_info)
            -- upvalues: utils_ext (ref)
            local tick_index = (globals.tickcount + math.floor(net_channel_info.avg_latency[0] + 0.22 / globals.tickinterval + 0.5)) / math.floor(0.3 / globals.tickinterval + 0.5);
            tick_index = math.floor(tick_index % #tick_array);
            tick_index = tick_array[tick_index + 1] + (tick_index > 18 and 0.75 or 2);
            return string.sub(("%s%s%s"):format(utils_ext.clantag.multiplier_text(" ", 15), base_text, utils_ext.clantag.multiplier_text(" ", 22)), tick_index, tick_index + 15);
        end, 
        executer = function()
            -- upvalues: menu (ref), utils_ext (ref)
            if not menu.settings.clantag:get() then
                if utils_ext.clantag.last ~= "" then
                    common.set_clan_tag("");
                    ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"):override(nil);
                    utils_ext.clantag.last = "";
                end;
                return;
            else
                ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"):override(false);
                local net_channel = utils.net_channel();
                if not net_channel then
                    return;
                else
                    local current_tag = utils_ext.clantag.to_tick("serenity", {
                        [1] = 25, 
                        [2] = 24, 
                        [3] = 24, 
                        [4] = 23, 
                        [5] = 22, 
                        [6] = 21, 
                        [7] = 20, 
                        [8] = 19, 
                        [9] = 18, 
                        [10] = 17, 
                        [11] = 16, 
                        [12] = 15, 
                        [13] = 14, 
                        [14] = 13, 
                        [15] = 12, 
                        [16] = 12, 
                        [17] = 12, 
                        [18] = 12, 
                        [19] = 12, 
                        [20] = 12, 
                        [21] = 12, 
                        [22] = 11, 
                        [23] = 10, 
                        [24] = 9, 
                        [25] = 8, 
                        [26] = 7, 
                        [27] = 6, 
                        [28] = 5, 
                        [29] = 4, 
                        [30] = 3, 
                        [31] = 2, 
                        [32] = 1
                    }, net_channel);
                    local game_rules = entity.get_game_rules();
                    if not game_rules then
                        return;
                    else
                        if game_rules.m_gamePhase == 5 or game_rules.m_gamePhase == 4 then
                            current_tag = utils_ext.clantag.to_tick("serenity", {
                                [1] = 12
                            }, net_channel);
                        end;
                        if current_tag ~= utils_ext.clantag.last then
                            common.set_clan_tag(("\226\156\189 %s"):format(current_tag));
                        end;
                        utils_ext.clantag.last = current_tag;
                        return;
                    end;
                end;
            end;
        end
    };
    utils_ext.aimbot_logs = {
        image = render.load_image_from_file("nl\\Serenity\\LogoSmall.png", vector(16, 16)), 
        list = {}, 
        hit_groups = {
            [0] = "generic", 
            [1] = "head", 
            [2] = "chest", 
            [3] = "stomach", 
            [4] = "left arm", 
            [5] = "right arm", 
            [6] = "left leg", 
            [7] = "right leg", 
            [8] = "neck", 
            [9] = "generic", 
            [10] = "gear"
        }, 
        render = function()
            -- upvalues: game_state (ref), menu (ref), utils_ext (ref), serenity_metadata (ref), l_smooth_0 (ref)
            if not game_state.lp.self or not menu.settings.logs:get() then
                utils_ext.aimbot_logs.list = {};
                return;
            else
                local logs_settings = menu.settings.logs[0];
                local logs_style = logs_settings.style:get();
                local logs_offset = logs_settings.offset:get();
                local screen_center_x = serenity_metadata.screen.x * 0.5;
                local screen_three_quarters_y = serenity_metadata.screen.y * 0.75;
                local current_offset = logs_offset;
                local indices_to_remove = {};
                for log_index = #utils_ext.aimbot_logs.list, 1, -1 do
                    local log_entry = utils_ext.aimbot_logs.list[log_index];
                    if globals.curtime - log_entry.time < 4 and (#utils_ext.aimbot_logs.list <= 7 or log_index >= #utils_ext.aimbot_logs.list - 7) then
                        if log_entry.offset < 255 then
                            log_entry.offset = l_smooth_0.unclamped_lerp(log_entry.offset, 255, 16);
                        end;
                        if log_entry.position < 255 then
                            log_entry.position = l_smooth_0.unclamped_lerp(log_entry.position, 255, 16);
                        end;
                    elseif log_entry.position > 0 then
                        log_entry.position = l_smooth_0.unclamped_lerp(log_entry.position, -1, 16);
                    else
                        table.insert(indices_to_remove, log_index);
                    end;
                    local position_ratio = log_entry.position / 255;
                    current_offset = current_offset - log_entry.offset / 255 * (logs_style == "Default" and 35 or 30);
                    local formatted_log_text = "";
                    for _, color_text_pair in pairs(log_entry.object) do
                        local text_content = color_text_pair[2];
                        if color_text_pair[3] == "damage" then
                            text_content = log_entry.damage;
                        end;
                        formatted_log_text = formatted_log_text .. ("\a%02x%02x%02x%02x%s"):format(color_text_pair[1].r, color_text_pair[1].g, color_text_pair[1].b, 255, text_content);
                    end;
                    local text_width = render.measure_text(1, nil, formatted_log_text).x;
                    local text_position = vector(screen_center_x, screen_three_quarters_y - current_offset - 75);
                    local glow_color = menu.settings.logs[0].colors:get("\aFFFFFF001\aDEFAULTGlow")[1];
                    glow_color.a = glow_color.a * position_ratio;
                    if logs_style == "Default" then
                        render.shadow(text_position - vector(text_width * 0.5 + 15, 0), text_position + vector(text_width * 0.5 + 15, 25), glow_color, 24, nil, 4);
                        render.rect(text_position - vector(text_width * 0.5 + 15, 0), text_position + vector(text_width * 0.5 + 15, 25), color(16, 16, 16, 192 * position_ratio), 4);
                        render.texture(utils_ext.aimbot_logs.image, text_position + vector(-(text_width * 0.5) + 5 - 14, 4), vector(16, 16), log_entry.color * color(255, 255, 255, 255 * position_ratio));
                        render.text(1, text_position + vector(10, 12.5), color(255, 255, 255, 255 * position_ratio), "c", formatted_log_text);
                    elseif logs_style == "Gamesense" then
                        text_width = text_width + 6;
                        render.rect(text_position - vector(text_width * 0.5 + 5, 13.5), text_position + vector(text_width * 0.5 + 5, 13.5), color(30, 30, 30, 255 * position_ratio));
                        render.rect(text_position - vector(text_width * 0.5 + 4, 12.5), text_position + vector(text_width * 0.5 + 4, 12.5), color(60, 60, 60, 255 * position_ratio));
                        render.rect(text_position - vector(text_width * 0.5 + 3, 11.5), text_position + vector(text_width * 0.5 + 3, 11.5), color(40, 40, 40, 255 * position_ratio));
                        render.rect(text_position - vector(text_width * 0.5 + 1, 9.5), text_position + vector(text_width * 0.5 + 1, 9.5), color(50, 50, 50, 255 * position_ratio));
                        render.rect(text_position - vector(text_width * 0.5 + 0, 8.5), text_position + vector(text_width * 0.5 + 0, 8.5), color(60, 60, 60, 255 * position_ratio));
                        render.rect(text_position - vector(text_width * 0.5 - 1, 7.5), text_position + vector(text_width * 0.5 - 1, 7.5), color(20, 20, 20, 255 * position_ratio));
                        render.gradient(vector(screen_center_x - text_width * 0.5 + 1, screen_three_quarters_y - 8 - current_offset - 75), vector(screen_center_x, screen_three_quarters_y - 7 - current_offset - 75), color(30, 85, 155, 255 * position_ratio), color(245, 0, 255, 255 * position_ratio), color(30, 85, 155, 255 * position_ratio), color(245, 0, 255, 255 * position_ratio));
                        render.gradient(vector(screen_center_x, screen_three_quarters_y - 8 - current_offset - 75), vector(screen_center_x + text_width * 0.5 - 1, screen_three_quarters_y - 7 - current_offset - 75), color(245, 0, 255, 255 * position_ratio), color(225, 255, 0, 255 * position_ratio), color(245, 0, 255, 255 * position_ratio), color(225, 255, 0, 255 * position_ratio));
                        render.text(1, text_position, color(255, 255, 255, 255 * position_ratio), "c", formatted_log_text);
                    elseif logs_style == "Modern" then
                        local gradient_colors = {
                            full = log_entry.color:alpha_modulate(255 * position_ratio), 
                            ["nil"] = color(16, 16, 16, 0)
                        };
                        render.gradient(text_position - vector(text_width * 0.5 + 5 + 1, 11), text_position + vector(text_width * 0.5 + 5 + 1, 11), gradient_colors.full, gradient_colors.full, gradient_colors["nil"], gradient_colors["nil"], 5);
                        render.rect(text_position - vector(text_width * 0.5 + 5, 10), text_position + vector(text_width * 0.5 + 5, 10), gradient_colors["nil"]:alpha_modulate(196 * position_ratio), 5);
                        render.text(1, text_position, color(255, 255, 255, 255 * position_ratio), "c", formatted_log_text);
                    end;
                end;
                for remove_index = 1, #indices_to_remove do
                    table.remove(utils_ext.aimbot_logs.list, remove_index);
                end;
                return;
            end;
        end, 
        push = function(log_objects, user_entity, damage_amount, prefix_text, log_color_func)
            -- upvalues: utils_ext (ref)
            table.insert(utils_ext.aimbot_logs.list, {
                position = 0, 
                offset = 0, 
                object = log_objects, 
                userID = user_entity:get_xuid(), 
                damage = damage_amount, 
                prefix = prefix_text, 
                time = globals.curtime, 
                color = log_color_func or log_color_func(255, 255, 255, 255), 
                index = utils.random_float(-999999999, 999999999) + utils.random_float(-999999999, 999999999)
            });
        end, 
        fixed = function(number_value, decimal_places)
            if not decimal_places then
                decimal_places = 1;
            end;
            local l_v590_0 = number_value;
            pcall(function()
                -- upvalues: l_v590_0 (ref), decimal_places (ref), number_value (ref)
                l_v590_0 = string.format("%." .. tonumber(decimal_places) .. "f", number_value);
            end);
            return l_v590_0;
        end, 
        aim_ack = function(hit_info, is_valid_hit)
            -- upvalues: game_state (ref), menu (ref), utils_ext (ref), l_print_0 (ref), serenity_metadata (ref)
            local l_self_6 = game_state.lp.self;
            if not l_self_6 or not menu.settings.logs:get() then
                return;
            else
                local log_settings = menu.settings.logs[0];
                local colors = {
                    hit = log_settings.colors:get("\aFFFFFF003\aDEFAULTHit")[1], 
                    miss = log_settings.colors:get("\aFFFFFF002\aDEFAULTMiss")[1], 
                    other = color(222, 222, 222, 255)
                };
                local hex_colors = {
                    hit = colors.hit:to_hex(), 
                    miss = colors.miss:to_hex()
                };
                local log_settings_selector = log_settings.select;
                if is_valid_hit then
                    local attacker_entity = entity.get(hit_info.attacker, true);
                    if not attacker_entity then
                        return;
                    else
                        local l_weapon_0 = hit_info.weapon;
                        local action_text = "";
                        if l_weapon_0 == "hegrenade" then
                            action_text = "Naded";
                        elseif l_weapon_0 == "inferno" then
                            action_text = "Burned";
                        elseif l_weapon_0 == "knife" then
                            action_text = "Knifed";
                        elseif l_weapon_0 == "taser" then
                            action_text = "Zeused";
                        end;
                        if l_self_6 == attacker_entity and action_text ~= "" then
                            local victim_entity = entity.get(hit_info.userid, true);
                            if not victim_entity then
                                return;
                            else
                                local remaining_health = victim_entity.m_iHealth - hit_info.dmg_health;
                                if remaining_health < 0 then
                                    remaining_health = 0;
                                end;
                                local victim_name = victim_entity:get_name():gsub("\n", "");
                                if log_settings_selector:get("Screen") then
                                    utils_ext.aimbot_logs.push({
                                        [1] = {
                                            colors.other, 
                                            ("%s "):format(action_text)
                                        }, 
                                        [2] = {
                                            colors.hit, 
                                            ("%s"):format(victim_name)
                                        }, 
                                        [3] = {
                                            [1] = nil, 
                                            [2] = " for ", 
                                            [1] = colors.other
                                        }, 
                                        [4] = {
                                            [1] = nil, 
                                            [2] = nil, 
                                            [3] = "damage", 
                                            [1] = colors.hit, 
                                            [2] = ("%s"):format(hit_info.dmg_health)
                                        }, 
                                        [5] = {
                                            [1] = nil, 
                                            [2] = " damage", 
                                            [1] = colors.other
                                        }
                                    }, victim_entity, hit_info.dmg_health, remaining_health, colors.hit);
                                end;
                                if log_settings_selector:get("Console") then
                                    l_print_0(serenity_metadata.to_console(("%s \a%s%s\aDEFAULT for \a%s%s\aDEFAULT damage (\a%s%s\aDEFAULT health remaining)"):format(action_text, hex_colors.hit, victim_name, hex_colors.hit, hit_info.dmg_health, hex_colors.hit, remaining_health)));
                                end;
                                if log_settings_selector:get("Top Left") then
                                    print_dev(serenity_metadata.to_console(("\a%s[serenity]\aDEFAULT %s \a%s%s\aDEFAULT for \a%s%s\aDEFAULT damage (\a%s%s\aDEFAULT health remaining)"):format(hex_colors.hit, action_text, hex_colors.hit, victim_name, hex_colors.hit, hit_info.dmg_health, hex_colors.hit, remaining_health)));
                                end;
                            end;
                        end;
                        return;
                    end;
                else
                    local l_target_0 = hit_info.target;
                    if not l_target_0 then
                        return;
                    else
                        local target_health = l_target_0.m_iHealth;
                        local target_name_clean = l_target_0:get_name():gsub("\n", "");
                        local formatted_spread = utils_ext.aimbot_logs.fixed(hit_info.spread, 2) or "-";
                        local damage_hitgroup_info = {
                            damage = hit_info.wanted_damage, 
                            hitgroup = utils_ext.aimbot_logs.hit_groups[hit_info.wanted_hitgroup] or "?"
                        };
                        if not damage_hitgroup_info.damage then
                            damage_hitgroup_info.damage = "-";
                        end;
                        if not damage_hitgroup_info.hitgroup then
                            damage_hitgroup_info.hitgroup = "generic";
                        end;
                        local damage_hitgroup_diff_text = (function()
                            -- upvalues: hit_info (ref), colors (ref), utils_ext (ref)
                            local diff_text = "";
                            local is_damage_or_hitgroup_diff = {
                                damage = hit_info.damage ~= hit_info.wanted_damage, 
                                hitgroup = hit_info.hitgroup ~= hit_info.wanted_hitgroup
                            };
                            local state_color_hex = colors[hit_info.state and "miss" or "hit"]:to_hex();
                            if is_damage_or_hitgroup_diff.damage or is_damage_or_hitgroup_diff.hitgroup then
                                diff_text = ("%s"):format((function()
                                    -- upvalues: is_damage_or_hitgroup_diff (ref), hit_info (ref), state_color_hex (ref), utils_ext (ref)
                                    local formatted_diff_string = "";
                                    if is_damage_or_hitgroup_diff.damage then
                                        formatted_diff_string = hit_info.wanted_damage;
                                    end;
                                    if is_damage_or_hitgroup_diff.hitgroup then
                                        formatted_diff_string = ("\a%s%s \aDEFAULT/ \a%s%s \aDEFAULTdamage"):format(state_color_hex, utils_ext.aimbot_logs.hit_groups[hit_info.wanted_hitgroup], state_color_hex, formatted_diff_string);
                                    else
                                        formatted_diff_string = ("\a%s%s\aDEFAULT"):format(state_color_hex, formatted_diff_string);
                                    end;
                                    return formatted_diff_string;
                                end)());
                            else
                                diff_text = ("\a%snone\aDEFAULT"):format(state_color_hex);
                            end;
                            return diff_text;
                        end)();
                        if not hit_info.state then
                            if log_settings_selector:get("Screen") then
                                utils_ext.aimbot_logs.push({
                                    [1] = {
                                        [1] = nil, 
                                        [2] = "Hit ", 
                                        [1] = colors.hit
                                    }, 
                                    [2] = {
                                        colors.other, 
                                        ("%s's "):format(target_name_clean)
                                    }, 
                                    [3] = {
                                        colors.hit, 
                                        ("%s"):format(utils_ext.aimbot_logs.hit_groups[hit_info.hitgroup])
                                    }, 
                                    [4] = {
                                        [1] = nil, 
                                        [2] = " for ", 
                                        [1] = colors.other
                                    }, 
                                    [5] = {
                                        [1] = nil, 
                                        [2] = nil, 
                                        [3] = "damage", 
                                        [1] = colors.hit, 
                                        [2] = ("%s"):format(hit_info.damage)
                                    }, 
                                    [6] = {
                                        [1] = nil, 
                                        [2] = " damage (", 
                                        [1] = colors.other
                                    }, 
                                    [7] = {
                                        colors.hit, 
                                        ("%s"):format(target_health)
                                    }, 
                                    [8] = {
                                        [1] = nil, 
                                        [2] = " health remaining)", 
                                        [1] = colors.other
                                    }
                                }, l_target_0, hit_info.damage, target_health, colors.hit);
                            end;
                            if log_settings_selector:get("Console") then
                                local console_extended_info = "";
                                if log_settings.extended:get("Console") then
                                    console_extended_info = ("[spread: \a%s%s\aDEFAULT\194\176 | bt: \a%s%s\aDEFAULT t | hc: \a%s%s\aDEFAULT%% | mismatch: %s]"):format(hex_colors.hit, formatted_spread, hex_colors.hit, hit_info.backtrack, hex_colors.hit, hit_info.hitchance, damage_hitgroup_diff_text);
                                end;
                                l_print_0(serenity_metadata.to_console(("Hit \a%s%s\aDEFAULT in the \a%s%s\aDEFAULT for \a%s%s\aDEFAULT damage (\a%s%s\aDEFAULT health remaining) %s"):format(hex_colors.hit, target_name_clean, hex_colors.hit, utils_ext.aimbot_logs.hit_groups[hit_info.hitgroup], hex_colors.hit, hit_info.damage, hex_colors.hit, target_health, console_extended_info)));
                            end;
                            if log_settings_selector:get("Top Left") then
                                local top_left_extended_info = "";
                                if log_settings.extended:get("Top Left") then
                                    top_left_extended_info = ("[spread: \a%s%s\aDEFAULT\194\176 | bt: \a%s%s\aDEFAULT t | hc: \a%s%s\aDEFAULT%%]"):format(hex_colors.hit, formatted_spread, hex_colors.hit, hit_info.backtrack, hex_colors.hit, hit_info.hitchance);
                                end;
                                print_dev(serenity_metadata.to_console(("\a%s[serenity]\aDEFAULT Hit \a%s%s\aDEFAULT in the \a%s%s\aDEFAULT for \a%s%s\aDEFAULT damage (\a%s%s\aDEFAULT health remaining) %s"):format(hex_colors.hit, hex_colors.hit, target_name_clean, hex_colors.hit, utils_ext.aimbot_logs.hit_groups[hit_info.hitgroup], hex_colors.hit, hit_info.damage, hex_colors.hit, target_health, top_left_extended_info)));
                            end;
                        else
                            hit_info.state = hit_info.state == "correction" and "resolver" or hit_info.state;
                            if log_settings_selector:get("Screen") then
                                utils_ext.aimbot_logs.push({
                                    [1] = {
                                        [1] = nil, 
                                        [2] = "Missed ", 
                                        [1] = colors.miss
                                    }, 
                                    [2] = {
                                        colors.other, 
                                        ("%s's "):format(target_name_clean)
                                    }, 
                                    [3] = {
                                        colors.miss, 
                                        ("%s"):format(damage_hitgroup_info.hitgroup)
                                    }, 
                                    [4] = {
                                        [1] = nil, 
                                        [2] = " due to ", 
                                        [1] = colors.other
                                    }, 
                                    [5] = {
                                        colors.miss, 
                                        ("%s"):format(hit_info.state)
                                    }
                                }, l_target_0, 0, 0, colors.miss);
                            end;
                            if log_settings_selector:get("Console") then
                                local console_extended_info_miss = "";
                                if log_settings.extended:get("Console") then
                                    console_extended_info_miss = ("[spread: \a%s%s\aDEFAULT\194\176 | bt: \a%s%s\aDEFAULT t | hc: \a%s%s\aDEFAULT%% | mismatch: %s]"):format(hex_colors.miss, formatted_spread, hex_colors.miss, hit_info.backtrack, hex_colors.miss, hit_info.hitchance, damage_hitgroup_diff_text);
                                end;
                                l_print_0(serenity_metadata.to_console(("Missed \a%s%s\aDEFAULT in the \a%s%s\aDEFAULT due to \a%s%s\aDEFAULT %s"):format(hex_colors.miss, target_name_clean, hex_colors.miss, damage_hitgroup_info.hitgroup, hex_colors.miss, hit_info.state, console_extended_info_miss)));
                            end;
                            if log_settings_selector:get("Top Left") then
                                local top_left_extended_info_miss = "";
                                if log_settings.extended:get("Top Left") then
                                    top_left_extended_info_miss = ("[spread: \a%s%s\aDEFAULT\194\176 | bt: \a%s%s\aDEFAULT t | hc: \a%s%s\aDEFAULT%%]"):format(hex_colors.miss, formatted_spread, hex_colors.miss, hit_info.backtrack, hex_colors.miss, hit_info.hitchance);
                                end;
                                print_dev(serenity_metadata.to_console(("\a%s[serenity]\aDEFAULT Missed \a%s%s\aDEFAULT in the \a%s%s\aDEFAULT due to \a%s%s\aDEFAULT %s"):format(hex_colors.miss, hex_colors.miss, target_name_clean, hex_colors.miss, damage_hitgroup_info.hitgroup, hex_colors.miss, hit_info.state, top_left_extended_info_miss)));
                            end;
                        end;
                        return;
                    end;
                end;
            end;
        end
    };
    utils_ext.trashtalk = {
        list = {
            English = {
                [1] = {
                    [1] = "1"
                }, 
                [2] = {
                    [1] = "wow u got owned"
                }, 
                [3] = {
                    [1] = "lol"
                }, 
                [4] = {
                    [1] = "nice resolver"
                }, 
                [5] = {
                    [1] = "no serenity? fast die"
                }, 
                [6] = {
                    [1] = "HAHAHAHAH"
                }, 
                [7] = {
                    [1] = "thats a 1"
                }, 
                [8] = {
                    [1] = "cya"
                }, 
                [9] = {
                    [1] = "bad luck"
                }, 
                [10] = {
                    [1] = "ouch"
                }, 
                [11] = {
                    [1] = "iq?"
                }, 
                [12] = {
                    [1] = "wyd?"
                }, 
                [13] = {
                    [1] = "nn"
                }, 
                [14] = {
                    [1] = "wp"
                }, 
                [15] = {
                    [1] = "brain check?"
                }, 
                [16] = {
                    [1] = "are u new?"
                }, 
                [17] = {
                    [1] = "noob cheat"
                }, 
                [18] = {
                    [1] = "uninstall"
                }, 
                [19] = {
                    [1] = "nice config"
                }, 
                [20] = {
                    [1] = "baited"
                }, 
                [21] = {
                    [1] = "where r u going?"
                }, 
                [22] = {
                    [1] = "lost?"
                }, 
                [23] = {
                    [1] = "h$"
                }, 
                [24] = {
                    [1] = "nn down"
                }, 
                [25] = {
                    [1] = "weak dog"
                }, 
                [26] = {
                    [1] = "*DEAD*"
                }, 
                [27] = {
                    [1] = "you got owned"
                }
            }, 
            Russian = {
                [1] = {
                    [1] = "1"
                }, 
                [2] = {
                    [1] = "\208\187\208\190\208\187"
                }, 
                [3] = {
                    [1] = "\208\189\208\190\209\128\208\188 \209\128\208\181\208\183\208\184\208\186)"
                }, 
                [4] = {
                    [1] = "\208\189\208\181\209\130 serenity? \208\177\209\139\209\129\209\130\209\128\208\190 \209\131\208\188\208\181\209\128\208\176\208\181\209\136\209\140)"
                }, 
                [5] = {
                    [1] = "\208\144\208\165\208\144\208\165\208\144\208\165\208\165\208\144"
                }, 
                [6] = {
                    [1] = "\208\189\209\131 \209\130\209\131\209\130 1"
                }, 
                [7] = {
                    [1] = "\208\189\208\181 \208\191\208\190\208\178\208\181\208\183\208\187\208\190"
                }, 
                [8] = {
                    [1] = "\208\190\208\185)"
                }, 
                [9] = {
                    [1] = "\208\189\208\189"
                }, 
                [10] = {
                    [1] = "\209\131 \209\130\208\181\208\177\209\143 \208\188\208\190\208\183\208\179 \208\181\209\129\209\130\209\140?"
                }, 
                [11] = {
                    [1] = "\209\130\209\139 \208\189\209\140\209\142\208\186\208\176\208\188\208\181\209\128?"
                }, 
                [12] = {
                    [1] = "\209\131\208\182\208\176\209\129\208\189\209\139\208\185 \209\131 \209\130\208\181\208\177\209\143 \209\135\208\184\209\130)"
                }, 
                [13] = {
                    [1] = "\209\131\208\180\208\176\208\187\208\184\209\129\209\140"
                }, 
                [14] = {
                    [1] = "\208\189\208\176\208\185\209\129 \208\186\208\190\208\189\209\132\208\184\208\179 \208\176\209\133\208\176\209\133"
                }, 
                [15] = {
                    [1] = "\208\186\209\131\208\180\208\176 \209\130\209\139 \208\177\208\181\208\182\208\184\209\136\209\140?"
                }, 
                [16] = {
                    [1] = "\209\130\209\139 \208\191\208\190\209\130\208\181\209\128\209\143\208\187\209\129\209\143?"
                }, 
                [17] = {
                    [1] = "\208\189\208\189\209\135\208\184\208\186"
                }, 
                [18] = {
                    [1] = "\209\129\208\187\208\176\208\177\209\139\208\185 \208\191\208\181\209\129 \208\176\209\133\208\176\209\133\208\176"
                }, 
                [19] = {
                    [1] = "*\208\163\208\156\208\149\208\160*"
                }
            }
        }, 
        delay_message = function(delay_seconds, message)
            return utils.execute_after(delay_seconds, function()
                -- upvalues: message (ref)
                utils.console_exec(("say %s"):format(message));
            end);
        end, 
        executer = function(event_data)
            -- upvalues: game_state (ref), menu (ref), utils_ext (ref)
            local local_player = game_state.lp.self;
            if not local_player or not menu.settings.trashtalk:get() then
                return;
            else
                local context = {
                    delay = {
                        self = 1, 
                        this = menu.settings.trashtalk[0].delay:get() * 0.1
                    }, 
                    infos = {
                        victim = entity.get(event_data.userid, true), 
                        attacker = entity.get(event_data.attacker, true)
                    }
                };
                if context.delay.this == 0 then
                    context.delay.this = utils.random_float(0, 2);
                end;
                local language = menu.settings.trashtalk[0].language:get();
                if context.infos.victim ~= context.infos.attacker and context.infos.attacker == local_player then
                    local trash_lines = utils_ext.trashtalk.list[language][math.random(1, #utils_ext.trashtalk.list[language])];
                    for line_index = 1, #trash_lines do
                        local line = trash_lines[line_index];
                        local line_delay = #trash_lines[line_index] / 24 * context.delay.self;
                        context.delay.this = context.delay.this + line_delay;
                        utils_ext.trashtalk.delay_message(context.delay.this, line);
                    end;
                end;
                return;
            end;
        end
    };
    utils_ext.viewmodel_changer = {
        set_values = function(fov_value, offset_x, offset_y, offset_z)
            -- upvalues: serenity_metadata (ref)
            local values = {
                FOV = fov_value or serenity_metadata.default_cvars.viewmodel.FOV, 
                x = offset_x or serenity_metadata.default_cvars.viewmodel.x, 
                y = offset_y or serenity_metadata.default_cvars.viewmodel.y, 
                z = offset_z or serenity_metadata.default_cvars.viewmodel.z
            };
            cvar.viewmodel_fov:float(values.FOV, true);
            cvar.viewmodel_offset_x:float(values.x, true);
            cvar.viewmodel_offset_y:float(values.y, true);
            cvar.viewmodel_offset_z:float(values.z, true);
        end, 
        executer = function(enable)
            -- upvalues: menu (ref), utils_ext (ref)
            local settings = menu.settings.viewmodel_changer[0];
            if enable then
                utils_ext.viewmodel_changer.set_values(settings.FOV:get() * 0.1, settings.x:get() * 0.1, settings.y:get() * 0.1, settings.z:get() * 0.1);
            else
                utils_ext.viewmodel_changer.set_values();
            end;
        end
    };
    utils_ext.aspect_ratio = {
        set_values = function(aspect_ratio_value)
            -- upvalues: serenity_metadata (ref)
            local values = {
                offset = aspect_ratio_value or serenity_metadata.default_cvars.aspectratio
            };
            cvar.r_aspectratio:float(values.offset, true);
        end, 
        executer = function(enable)
            -- upvalues: menu (ref), utils_ext (ref)
            local settings = menu.settings.aspect_ratio[0];
            if enable then
                utils_ext.aspect_ratio.set_values(settings.offset:get() * 0.01);
            else
                utils_ext.aspect_ratio.set_values();
            end;
        end
    };
    utils_ext.nade_throw_fix = {
        executer = function(cmd)
            -- upvalues: game_state (ref), ui_references (ref), menu (ref)
            local local_player = game_state.lp.self;
            ui_references.main.Other.weapon_action:override(nil);
            if not local_player or not local_player:is_alive() or not menu.settings.nade_fix:get() then
                return;
            else
                local weapon = local_player:get_player_weapon();
                if not weapon then
                    return;
                else
                    local throw_time = weapon.m_fThrowTime;
                    local nade_fix_settings = menu.settings.nade_fix[0].on;
                    if throw_time ~= nil and throw_time ~= 0 then
                        if not nade_fix_settings:get("Lag Options") then
                            rage.exploit:allow_defensive(false);
                        end;
                        if not nade_fix_settings:get("Quick Switch") then
                            ui_references.main.Other.weapon_action:override({});
                        end;
                        return;
                    else
                        if cmd.in_attack then
                            local weapon_info = weapon:get_weapon_info();
                            if not weapon_info then
                                return;
                            elseif weapon_info.weapon_type == 9 then
                                if not nade_fix_settings:get("Lag Options") then
                                    rage.exploit:allow_defensive(false);
                                end;
                                if not nade_fix_settings:get("Quick Switch") then
                                    ui_references.main.Other.weapon_action:override({});
                                end;
                                return;
                            end;
                        end;
                        return;
                    end;
                end;
            end;
        end
    };
    utils_ext.no_fall_damage = {
        pre_render = function()
            -- upvalues: game_state (ref), utils_ext (ref), menu (ref)
            local local_player = game_state.lp.self;
            utils_ext.no_fall_damage.in_duck = nil;
            if not local_player or not menu.settings.no_fall:get() then
                utils_ext.no_fall_damage.in_duck = nil;
                return;
            elseif not globals.is_connected or not globals.is_in_game then
                return;
            else
                local player_origin = local_player:get_origin();
                if not player_origin then
                    return;
                else
                    if local_player.m_vecVelocity.z <= -500 then
                        local trace_fraction = utils.trace_line(player_origin, player_origin + vector(0, 0, -256), local_player).fraction;
                        if trace_fraction <= 0.26 and trace_fraction > 0.05 then
                            utils_ext.no_fall_damage.in_duck = true;
                        elseif trace_fraction <= 0.04 then
                            utils_ext.no_fall_damage.in_duck = false;
                        end;
                    end;
                    return;
                end;
            end;
        end, 
        createmove = function(cmd)
            -- upvalues: utils_ext (ref)
            if utils_ext.no_fall_damage.in_duck then
                cmd.in_duck = utils_ext.no_fall_damage.in_duck;
            end;
        end
    };
    utils_ext.radius = {
        inferno_list = {}, 
        mp_friendlyfire = cvar.mp_friendlyfire:int(), 
        executer = function()
            -- upvalues: menu (ref), utils_ext (ref), l_smooth_0 (ref)
            local local_player = entity.get_local_player();
            if not local_player or not menu.settings.radius:get() then
                return;
            else
                local radius_settings = menu.settings.radius[0];
                local smoke_grenades = entity.get_entities("CSmokeGrenadeProjectile");
                local global_times = {
                    tickcount = globals.tickcount, 
                    tickinterval = globals.tickinterval, 
                    realtime = globals.realtime
                };
                local inferno_entities = {};
                local previous_inferno_list = utils_ext.radius.inferno_list;
                utils_ext.radius.inferno_list = {};
                inferno_entities = entity.get_entities("CInferno");
                for i = 1, #inferno_entities do
                    local inferno_entity = inferno_entities[i];
                    if inferno_entity.m_fireCount > 0 then
                        utils_ext.radius.inferno_list[inferno_entity] = previous_inferno_list[inferno_entity] ~= nil and previous_inferno_list[inferno_entity] or global_times.realtime;
                        table.insert(smoke_grenades, inferno_entity);
                    end;
                end;
                for j = 1, #smoke_grenades do
                    local smoke_entity = smoke_grenades[j];
                    if smoke_entity then
                        local classname = smoke_entity:get_classname();
                        if classname == "CSmokeGrenadeProjectile" and radius_settings.display:get("Smoke") then
                            local origin = smoke_entity.m_vecOrigin;
                            if smoke_entity.m_bDidSmokeEffect then
                                local smoke_tick_start = smoke_entity.m_nSmokeEffectTickBegin;
                                if smoke_tick_start ~= nil then
                                    local elapsed_time = global_times.tickinterval * (global_times.tickcount - smoke_tick_start);
                                    if elapsed_time > 0 and 17.55 - elapsed_time > 0 then
                                        local radius = 125;
                                        if elapsed_time < 0.3 then
                                            radius = radius * 0.6 + radius * (elapsed_time / 0.3) * 0.4;
                                        end;
                                        local smoke_index = smoke_entity:get_index();
                                        local lerp_value = l_smooth_0.linear("Serenity", ("Grenade Radius / Smoke / #%s"):format(smoke_index), 17.55 - elapsed_time > 0.2);
                                        local color_smoke = radius_settings.color_se:get();
                                        color_smoke = color_smoke:alpha_modulate(color_smoke.a * lerp_value);
                                        render.circle_3d_outline(origin, color_smoke, radius, 0, 1, 1);
                                    end;
                                end;
                            end;
                        elseif classname == "CInferno" and radius_settings.display:get("Molotov") then
                            local inferno_origin = smoke_entity.m_vecOrigin;
                            local inferno_data = {
                                cells = {}, 
                                max_distance = 0, 
                                cell_max_1 = nil, 
                                cell_max_2 = nil
                            };
                            for cell_index = 1, 32 do
                                if smoke_entity.m_bFireIsBurning[cell_index] then
                                    table.insert(inferno_data.cells, vector(smoke_entity.m_fireXDelta[cell_index], smoke_entity.m_fireYDelta[cell_index], smoke_entity.m_fireZDelta[cell_index]));
                                end;
                            end;
                            for outer_cell_index = 1, #inferno_data.cells do
                                local outer_cell = inferno_data.cells[outer_cell_index];
                                for inner_cell_index = 1, #inferno_data.cells do
                                    local inner_cell = inferno_data.cells[inner_cell_index];
                                    local distance_between_cells = outer_cell:dist(inner_cell);
                                    if inferno_data.max_distance < distance_between_cells then
                                        inferno_data.max_distance = distance_between_cells;
                                        inferno_data.cell_max_1 = outer_cell;
                                        inferno_data.cell_max_2 = inner_cell;
                                    end;
                                end;
                            end;
                            if inferno_data.cell_max_1 ~= nil and inferno_data.cell_max_2 ~= nil then
                                local owner_entity = smoke_entity.m_hOwnerEntity;
                                local color_current = radius_settings.color_ev:get();
                                local is_friendly = false;
                                if owner_entity and utils_ext.radius.mp_friendlyfire == 0 and owner_entity ~= local_player and not owner_entity:is_enemy() then
                                    is_friendly = true;
                                    color_current = radius_settings.color_tv:get();
                                end;
                                local fire_effect_duration = math.max(0, tonumber(string.format("%.1f", 7.03125 - global_times.tickinterval * (global_times.tickcount - smoke_entity.m_nFireEffectTickBegin))));
                                local center_point = inferno_data.cell_max_1:lerp(inferno_data.cell_max_2, 0.5);
                                local inferno_index = smoke_entity:get_index();
                                local lerp_alpha = l_smooth_0.linear("Serenity", ("Grenade Radius / Inferno / #%s"):format(inferno_index), fire_effect_duration > 0.2);
                                color_current = color_current.alpha_modulate(color_current, color_current.a * lerp_alpha);
                                render.circle_3d_outline(inferno_origin + center_point, color_current, inferno_data.max_distance * 0.5 + 40, 0, 1, 1);
                            end;
                        end;
                    end;
                end;
                return;
            end;
        end
    };
    utils_ext.auto_m_unm = {
        object = {
            mode = "", 
            quantity = 0
        }, 
        executer = function()
            -- upvalues: menu (ref), utils_ext (ref)
            if not entity.get_local_player() or not menu.settings.auto_m_unm:get() then
                return;
            else
                local all_enemy_players = entity.get_players(false, true);
                local selected_mute_mode = menu.settings.auto_m_unm[0].mode:get();
                if utils_ext.auto_m_unm.object.quantity ~= #all_enemy_players or utils_ext.auto_m_unm.object.mode ~= selected_mute_mode then
                    for _, player in pairs(all_enemy_players) do
                        local player_xuid = panorama.MatchStatsAPI.GetPlayerXuid(player:get_index());
                        if panorama.GameStateAPI.IsSelectedPlayerMuted(player_xuid) ~= (selected_mute_mode == "Mute") then
                            panorama.GameStateAPI.ToggleMute(player_xuid);
                        end;
                    end;
                    utils_ext.auto_m_unm.object.quantity = #all_enemy_players;
                    utils_ext.auto_m_unm.object.mode = selected_mute_mode;
                end;
                return;
            end;
        end
    };
    utils_ext.drop_grenades = {
        enable = false, 
        list = {
            weapon_flashbang = "Flashbang", 
            weapon_smokegrenade = "Smoke", 
            weapon_incgrenade = "Molotov", 
            weapon_molotov = "Molotov", 
            weapon_hegrenade = "High Explosive"
        }, 
        executer = function()
            -- upvalues: menu (ref), utils_ext (ref)
            local local_player = entity.get_local_player();
            if local_player == nil or not local_player:is_alive() or not menu.settings.drop_grenades:get() or not menu.settings.drop_grenades[0].bind:get() then
                utils_ext.drop_grenades.enable = false;
                return;
            elseif utils_ext.drop_grenades.enable then
                return;
            else
                local player_weapons = local_player:get_player_weapon(true);
                if not player_weapons then
                    return;
                else
                    local delay_timer = 0.02;
                    utils.console_exec("+use;");
                    for weapon_index = 1, #player_weapons do
                        local weapon_info = player_weapons[weapon_index]:get_weapon_info();
                        do
                            local current_weapon_info = weapon_info;
                            if current_weapon_info and current_weapon_info.weapon_type == 9 then
                                local should_drop = false;
                                if menu.settings.drop_grenades[0].discard:get(utils_ext.drop_grenades.list[current_weapon_info.console_name] or "") then
                                    should_drop = true;
                                end;
                                if should_drop then
                                    utils.execute_after(delay_timer, function()
                                        -- upvalues: current_weapon_info (ref)
                                        utils.console_exec("use weapon_knife;");
                                        utils.console_exec(("use %s;"):format(current_weapon_info.console_name));
                                        utils.console_exec("drop;");
                                    end);
                                end;
                                delay_timer = delay_timer + 0.02;
                            end;
                        end;
                    end;
                    utils.execute_after(delay_timer, function()
                        utils.console_exec("-use;");
                    end);
                    utils_ext.drop_grenades.enable = true;
                    return;
                end;
            end;
        end
    };
    pcall(function()
        -- upvalues: utils_ext (ref)
        network.get("https://avatars.cloudflare.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_medium.jpg", {}, function(spectator_avatar_image_data)
            -- upvalues: utils_ext (ref)
            utils_ext.screen_widgets.spectators.undefined = render.load_image(spectator_avatar_image_data, vector(32, 32));
        end);
    end);
    pcall(function()
        -- upvalues: utils_ext (ref)
        network.get("https://vh488226.eurodir.ru/serenity/LogoFuSm.png", {}, function(logo_image_data)
            -- upvalues: utils_ext (ref)
            utils_ext.screen_widgets.defensive_indicator.image = render.load_image(logo_image_data, vector(64, 64));
            utils_ext.watermark.logo = render.load_image(logo_image_data, vector(64, 64));
        end);
    end);
    pcall(function()
        -- upvalues: utils_ext (ref)
        network.get("https://vh488226.eurodir.ru/serenity/Girl.png", {}, function(anime_watermark_image_data)
            -- upvalues: utils_ext (ref)
            utils_ext.watermark.anime = render.load_image(anime_watermark_image_data, vector(28.125, 39.84375));
        end);
    end);
    menu.settings.viewmodel_changer:set_callback(function(viewmodel_toggle)
        -- upvalues: utils_ext (ref), menu (ref)
        utils_ext.viewmodel_changer.executer(viewmodel_toggle:get());
        local viewmodel_settings = menu.settings.viewmodel_changer[0];
        viewmodel_settings.FOV:visibility(viewmodel_toggle:get());
        viewmodel_settings.x:visibility(viewmodel_toggle:get());
        viewmodel_settings.y:visibility(viewmodel_toggle:get());
        viewmodel_settings.z:visibility(viewmodel_toggle:get());
        viewmodel_settings.reset:visibility(viewmodel_toggle:get());
    end, true);
    menu.settings.viewmodel_changer[0].FOV:set_callback(function()
        -- upvalues: utils_ext (ref), menu (ref)
        utils_ext.viewmodel_changer.executer(menu.settings.viewmodel_changer:get());
    end);
    menu.settings.viewmodel_changer[0].x:set_callback(function()
        -- upvalues: utils_ext (ref), menu (ref)
        utils_ext.viewmodel_changer.executer(menu.settings.viewmodel_changer:get());
    end);
    menu.settings.viewmodel_changer[0].y:set_callback(function()
        -- upvalues: utils_ext (ref), menu (ref)
        utils_ext.viewmodel_changer.executer(menu.settings.viewmodel_changer:get());
    end);
    menu.settings.viewmodel_changer[0].z:set_callback(function()
        -- upvalues: utils_ext (ref), menu (ref)
        utils_ext.viewmodel_changer.executer(menu.settings.viewmodel_changer:get());
    end);
    menu.settings.viewmodel_changer[0].reset:set_callback(function()
        -- upvalues: menu (ref), serenity_metadata (ref)
        menu.settings.viewmodel_changer[0].FOV:set(serenity_metadata.default_cvars.viewmodel.FOV * 10);
        menu.settings.viewmodel_changer[0].x:set(serenity_metadata.default_cvars.viewmodel.x * 10);
        menu.settings.viewmodel_changer[0].y:set(serenity_metadata.default_cvars.viewmodel.y * 10);
        menu.settings.viewmodel_changer[0].z:set(serenity_metadata.default_cvars.viewmodel.z * 10);
    end, true);
    menu.settings.aspect_ratio:set_callback(function(aspect_ratio_toggle)
        -- upvalues: utils_ext (ref), menu (ref), serenity_metadata (ref)
        utils_ext.aspect_ratio.executer(menu.settings.aspect_ratio:get());
        local aspect_ratio_settings = menu.settings.aspect_ratio[0];
        aspect_ratio_settings.offset:visibility(aspect_ratio_toggle:get());
        for _, aspect_ratio_option in pairs(serenity_metadata.aspect_ratio) do
            aspect_ratio_settings[("%s:%s"):format(aspect_ratio_option[1], aspect_ratio_option[2])]:visibility(aspect_ratio_toggle:get());
        end;
    end, true);
    menu.settings.aspect_ratio[0].offset:set_callback(function()
        -- upvalues: utils_ext (ref), menu (ref)
        utils_ext.aspect_ratio.executer(menu.settings.aspect_ratio:get());
    end);
    local random_floats_array = {
        utils.random_float(1, 3), 
        utils.random_float(1, 3), 
        utils.random_float(1, 3), 
        utils.random_float(1, 3), 
        utils.random_float(1, 3), 
        utils.random_float(1, 3), 
        utils.random_float(1, 3), 
        utils.random_float(1, 3)
    };
    events.pre_render(function()
        -- upvalues: utils_ext (ref)
        utils_ext.no_fall_damage.pre_render();
        utils_ext.drop_grenades.executer();
    end);
    events.render(function()
        -- upvalues: game_state (ref), l_smooth_0 (ref), l_liberia_0 (ref), utils_ext (ref), menu (ref), l_monylinear_0 (ref), random_floats_array (ref), serenity_metadata (ref), l_mui_0 (ref)
        game_state.lp.self = entity.get_local_player();
        if game_state.lp.self then
            game_state.lp.team.index = game_state.lp.self.m_iTeamNum;
            game_state.lp.team.name = game_state.lp.team.index == 3 and "CT" or game_state.lp.team.index == 2 and "T" or "N";
            local net_channel_info = utils.net_channel();
            if net_channel_info then
                game_state.lp.ping.real = math.max(0, (math.floor(net_channel_info.avg_latency[1] * 1000)));
                game_state.lp.ping.incoming = math.min(math.max(0, math.abs((net_channel_info.latency[0] + net_channel_info.latency[1]) * 1000) / 200), 1);
            end;
        else
            game_state.lp.team.index = -1;
            game_state.lp.team.name = "N";
            game_state.lp.ping.real = 0;
            game_state.lp.ping.incoming = 0;
        end;
        l_smooth_0.new("Serenity");
        l_smooth_0.new("Slowed");
        l_smooth_0.update("Serenity", 12);
        l_smooth_0.update("Slowed", 8);
        l_liberia_0.anti_aim.condition.update();
        utils_ext.crosshair_indicators.executer();
        utils_ext.minimum_damage.executer();
        utils_ext.manual_arrows.executer();
        utils_ext.screen_widgets.executer();
        utils_ext.watermark.always_mark();
        utils_ext.watermark.executer();
        utils_ext.skeet:executer();
        utils_ext.skeet:spectators();
        utils_ext.custom_scope.executer();
        utils_ext.aimbot_logs.render();
        utils_ext.radius.executer();
        utils_ext.clantag.executer();
        utils_ext.auto_m_unm.executer();
        if ui.get_alpha() > 0 then
            local link_active_color = ui.get_style("Link Active");
            local link_active_fade = link_active_color:alpha_modulate(64);
            local sidebar_icon_id = "flower-tulip";
            local sidebar_label_text = "serenity.lua";
            local selected_sidebar_style = menu.home.sidebar:get();
            if selected_sidebar_style == "Modern" then
                sidebar_label_text = l_monylinear_0:Animate("\240\159\134\130\240\159\133\180\240\159\134\129\240\159\133\180\240\159\133\189\240\159\133\184\240\159\134\131\240\159\134\136", {
                    [1] = link_active_fade, 
                    [2] = link_active_fade, 
                    [3] = link_active_fade, 
                    [4] = link_active_fade, 
                    [5] = link_active_fade, 
                    [6] = link_active_fade, 
                    [7] = link_active_fade, 
                    [8] = link_active_fade, 
                    [9] = link_active_color, 
                    [10] = link_active_color, 
                    [11] = link_active_color, 
                    [12] = link_active_color, 
                    [13] = link_active_color, 
                    [14] = link_active_color, 
                    [15] = link_active_color, 
                    [16] = link_active_color
                }, 3, 1.5);
            elseif selected_sidebar_style == "Twinkle" then
                sidebar_label_text = ("%s%s%s%s%s%s%s%s"):format(l_monylinear_0:Animate("s", {
                    [1] = link_active_fade, 
                    [2] = link_active_color
                }, random_floats_array[1]), l_monylinear_0:Animate("e", {
                    [1] = link_active_fade, 
                    [2] = link_active_color
                }, random_floats_array[2]), l_monylinear_0:Animate("r", {
                    [1] = link_active_fade, 
                    [2] = link_active_color
                }, random_floats_array[3]), l_monylinear_0:Animate("e", {
                    [1] = link_active_fade, 
                    [2] = link_active_color
                }, random_floats_array[4]), l_monylinear_0:Animate("n", {
                    [1] = link_active_fade, 
                    [2] = link_active_color
                }, random_floats_array[5]), l_monylinear_0:Animate("i", {
                    [1] = link_active_fade, 
                    [2] = link_active_color
                }, random_floats_array[6]), l_monylinear_0:Animate("t", {
                    [1] = link_active_fade, 
                    [2] = link_active_color
                }, random_floats_array[7]), l_monylinear_0:Animate("y", {
                    [1] = link_active_fade, 
                    [2] = link_active_color
                }, random_floats_array[8]));
                sidebar_icon_id = l_monylinear_0:Animate(ui.get_icon(sidebar_icon_id), {
                    [1] = link_active_fade, 
                    [2] = link_active_color
                }, 3);
            elseif selected_sidebar_style == "Default" then
                sidebar_label_text = l_monylinear_0:Animate(("serenity ~ %s"):format(serenity_metadata.build):lower(), {
                    [1] = link_active_fade, 
                    [2] = link_active_color
                }, 3);
            elseif selected_sidebar_style == "Static" then
                sidebar_label_text = ("\a%sserenity ~ %s"):format(link_active_color:to_hex(), serenity_metadata.build):lower();
            end;
            l_mui_0.sidebar(sidebar_label_text, sidebar_icon_id);
        end;
    end);
    events.createmove(function(user_cmd)
        -- upvalues: antiAimState (ref), utils_ext (ref)
        antiAimState.builder(user_cmd);
        utils_ext.nade_throw_fix.executer(user_cmd);
        utils_ext.no_fall_damage.createmove(user_cmd);
        utils_ext.crosshair_indicators.leaflets.buttons = {
            A = bit.band(user_cmd.buttons, 512) == 512, 
            D = bit.band(user_cmd.buttons, 1024) == 1024
        };
    end);
    events.aim_ack(function(aim_ack_event)
        -- upvalues: utils_ext (ref)
        utils_ext.skeet:aim_ack(aim_ack_event);
        utils_ext.aimbot_logs.aim_ack(aim_ack_event);
    end);
    events.player_hurt(function(player_hurt_event)
        -- upvalues: utils_ext (ref)
        utils_ext.aimbot_logs.aim_ack(player_hurt_event, true);
    end);
    events.player_death(function(player_death_event)
        -- upvalues: utils_ext (ref)
        utils_ext.trashtalk.executer(player_death_event);
    end);
    events.round_start(function()
        -- upvalues: utils_ext (ref)
        utils_ext.skeet:clear_planting_info();
    end);
    events.bomb_abortplant(function()
        -- upvalues: utils_ext (ref)
        utils_ext.skeet:clear_planting_info();
    end);
    events.bomb_defused(function()
        -- upvalues: utils_ext (ref)
        utils_ext.skeet:clear_planting_info();
    end);
    events.bomb_planted(function()
        -- upvalues: utils_ext (ref)
        utils_ext.skeet:clear_planting_info();
    end);
    events.bomb_beginplant(function(bomb_begin_plant_event)
        -- upvalues: utils_ext (ref)
        utils_ext.skeet:bomb_begin_plant(bomb_begin_plant_event);
    end);
    events.post_update_clientside_animation(function(client_anim_player)
        -- upvalues: game_state (ref), antiAimState (ref)
        if client_anim_player ~= game_state.lp.self then
            return;
        else
            antiAimState.animations(client_anim_player, client_anim_player[0]);
            return;
        end;
    end);
    events.style_change(function(_)
        -- upvalues: menu (ref), l_mui_0 (ref)
        menu.home.logo:set(ui.get_style("Link Active"));
        menu.home.select:update({
            l_mui_0.header("!h<!s<Link Active>>!i<caret-right>!d  Informations"), 
            l_mui_0.header("!h<!s<Link Active>>!i<caret-right>!d  Recommendations"), 
            l_mui_0.header("!h<!s<Link Active>>!i<caret-right>!d  Configurations")
        });
        menu["anti aim"].type:update({
            l_mui_0.header("!h<!s<Link Active>>!i<caret-right>!d  Disabled"), 
            l_mui_0.header("!h<!s<Link Active>>!i<caret-right>!d  Normal"), 
            l_mui_0.header("!h<!s<Link Active>>!i<caret-right>!d  Teams")
        });
        for _, tab_name in pairs({
            [1] = "home", 
            [2] = "anti aim", 
            [3] = "settings"
        }) do
            local tab_object = menu[tab_name];
            if tab_object then
                for _, element in pairs(tab_object) do
                    do
                        local ui_element = element;
                        pcall(function()
                            -- upvalues: ui_element (ref), l_mui_0 (ref)
                            ui_element:name(l_mui_0.header(ui_element.default));
                        end);
                    end;
                end;
            end;
        end;
    end);
    events.mouse_input(function()
        -- upvalues: l_system_0 (ref)
        return l_system_0.get_anti_shot();
    end);
    events.shutdown(function()
        -- upvalues: ui_references (ref), utils_ext (ref)
        ui_references.world["Override Zoom"].overlay:override(nil);
        utils_ext.viewmodel_changer.executer();
        utils_ext.aspect_ratio.executer();
        ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"):override(nil);
        common.set_clan_tag("\000");
        cvar.sv_maxusrcmdprocessticks:int(16);
    end);
    return;
end;
