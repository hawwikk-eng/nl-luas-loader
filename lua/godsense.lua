_G.SCRIPT_NAME = "godsense";
local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
local l_smoothy_0 = require("neverlose/smoothy");
local _ = require("neverlose/csgo_weapons");
local l_pui_0 = require("neverlose/pui");
local v5 = render.screen_size();
local v31 = {
    new = function(_, v7, v8)
        -- upvalues: v5 (ref)
        local v9 = v8 or vector();
        local v10 = ui.create("DRAGGING$$$)$)$)$");
        local v11 = {};
        local v13 = {
            dragging = false, 
            mouse_pos = vector(0, 0), 
            mouse_pos_diff = vector(0, 0), 
            size = vector(0, 0), 
            position = vector(0, 0), 
            reference = (function()
                -- upvalues: v10 (ref), v7 (ref), v9 (ref)
                local v12 = {
                    v10:slider(("%s:dragging_x"):format(v7), -16384, 16384, v9.x), 
                    v10:slider(("%s:dragging_y"):format(v7), -16384, 16384, v9.y)
                };
                v12[1]:visibility(false);
                v12[2]:visibility(false);
                return v12;
            end)()
        };
        v11.intersects = function(_, v15, v16, v17)
            return v15.x >= v16.x and v15.x <= v16.x + v17.x and v15.y >= v16.y and v15.y <= v16.y + v17.y;
        end;
        v11.set_position = function(v18, v19)
            v18.reference[1]:set(v19.x);
            v18.reference[2]:set(v19.y);
        end;
        v11.is_dragging = function(v20)
            return v20.dragging;
        end;
        v11.update = function(v21, v22)
            -- upvalues: v5 (ref)
            local v23 = ui.get_mouse_position();
            local v24 = ui.get_position();
            local v25 = ui.get_size();
            local v26 = ui.get_alpha() > 0 and common.is_button_down(1);
            local v27 = v21:intersects(v23, v21.position, v22) and not v21:intersects(v23, v24, v25);
            v21.mouse_pos_diff = -(v21.mouse_pos - v23);
            if v26 and v21.intersected == nil then
                v21.intersected = v27;
            end;
            if v26 and v21.intersected then
                v21.dragging = true;
            elseif not v26 then
                v21.dragging = false;
                v21.intersected = nil;
            end;
            if v21.dragging then
                local v28 = v22 * 0.5;
                local v29 = vector(v21.reference[1]:get() + v21.mouse_pos_diff.x, v21.reference[2]:get() + v21.mouse_pos_diff.y);
                v21.reference[1]:set(math.max(-v28.x, math.min(v5.x - v28.x, v29.x)));
                v21.reference[2]:set(math.max(-v28.y, math.min(v5.y - v28.y, v29.y)));
            end;
            local v30 = vector(v21.reference[1]:get(), v21.reference[2]:get());
            v21.mouse_pos = v23;
            v21.size = v22;
            v21.position = v30;
        end;
        return setmetatable(v11, {
            __index = v13
        });
    end
};
local _ = {
    name = common.get_username(), 
    version = "Debug"
};
local v35 = {
    get_original = function(_, v34)
        return tonumber(v34:string());
    end
};
local v63 = {
    animate = function(_, v37, v38, v39, v40)
        if not v40 or v40:gsub(" ", "") == "" then
            return v40;
        else
            local v41 = "";
            local v42 = globals.realtime * v37;
            local v43 = 1;
            local v44 = #v40;
            while v43 <= v44 do
                local v45 = v40:byte(v43);
                if v45 == 92 and v40:sub(v43 + 1, v43 + 1) == "a" then
                    v41 = v41 .. v40:sub(v43, v43 + 7);
                    v43 = v43 + 8;
                else
                    local v46 = nil;
                    if v45 >= 240 then
                        v46 = v40:sub(v43, v43 + 3);
                        v43 = v43 + 4;
                    elseif v45 >= 224 then
                        v46 = v40:sub(v43, v43 + 2);
                        v43 = v43 + 3;
                    elseif v45 >= 192 then
                        v46 = v40:sub(v43, v43 + 1);
                        v43 = v43 + 2;
                    else
                        v46 = v40:sub(v43, v43);
                        v43 = v43 + 1;
                    end;
                    local v47 = (math.sin(v42 + v43 / 3) + 1) / 2;
                    v41 = v41 .. "\a" .. v38:lerp(v39, math.clamp(v47, 0, 1)):to_hex() .. v46;
                end;
            end;
            return v41;
        end;
    end, 
    format = function(_, v49, v50, v51, v52, v53, v54)
        if not v51 then
            v51 = 0;
        end;
        if not v52 then
            v52 = 0;
        end;
        if not v53 then
            v53 = 0;
        end;
        if not v50 then
            v50 = "ERROR";
        end;
        local v55 = "\226\128\138";
        local v56 = ui.get_icon(v49);
        if string.gsub(v56, " ", "") == "" then
            v56 = v49;
        end;
        if v54 then
            v56 = "\a" .. v54 .. v56 .. "\r";
        else
            v56 = "\v" .. v56 .. "\r";
        end;
        return string.rep(v55, v51) .. v56 .. string.rep(v55, v52) .. v50 .. string.rep(v55, v53);
    end, 
    colored = function(_, ...)
        local v58 = "";
        for _, v60 in pairs({
            ...
        }) do
            local v61 = v60[2];
            local v62 = v60[1];
            v58 = v58 .. "\a" .. v61:to_hex() .. v62;
        end;
        return v58;
    end
};
local v64 = nil;
v64 = {
    rage = {
        main = {
            dormant_aimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
            hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
            hide_shots_options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
            double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
            double_tap_lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
            peek_assist = {
                ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
                ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Style"), 
                ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Auto Stop"), 
                ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode")
            }
        }, 
        selection = {
            hit_chance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
            minimum_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
            safe_points = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
            body_aim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim")
        }
    }, 
    antiaim = {
        angles = {
            enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
            pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
            yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
            yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
            yaw_add = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
            avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
            hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
            yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
            modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
            body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
            inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
            left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
            right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
            options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
            freestanding_body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
            freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
            freestand_peek = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
            disable_yaw_modifiers = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
            body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
            extended_angles = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
            extended_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
            extended_roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll")
        }, 
        fake_lag = {
            enabled = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
            limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit")
        }, 
        misc = {
            fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
            slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
            leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
        }
    }, 
    ping_spike = ui.find("Miscellaneous", "Main", "Other", "Fake Latency")
};
local v65 = {
    states = {
        [1] = "Standing", 
        [2] = "Running", 
        [3] = "Slowwalking", 
        [4] = "Crouching", 
        [5] = "Sneaking", 
        [6] = "Air", 
        [7] = "Air Crouching"
    }, 
    teams = {
        [1] = "T", 
        [2] = "CT"
    }
};
local v66 = render.screen_size();
local v67 = {};
point = "\226\128\162";
local v68 = {};
local v69 = {
    l_pui_0.create(v63:format("land-mine-on", "", 0, 0, 0), "   ", 2), 
    l_pui_0.create(v63:format("land-mine-on", "", 0, 0, 0), "", 2), 
    l_pui_0.create(v63:format("land-mine-on", "", 0, 0, 0), "  ", 1), 
    l_pui_0.create(v63:format("land-mine-on", "", 0, 0, 0), "\n\n", 2), 
    l_pui_0.create(v63:format("land-mine-on", "", 0, 0, 0), "\n", 1)
};
v69[1]:label(v63:format("diamond-exclamation", "The script is under work and some functions may not work as you suppose.", 2, 2, 2));
v69[1]:label(v63:format("circle-info", "Welcome User - \v" .. common.get_username(), 2, 2));
v69[1]:label(v63:format("circle-info", "Author script - \vuwuplayer\r", 2, 2));
v69[2]:button(v63:format("discord", "Join Discord", 6, 2, 6), function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/XYaNWJJTFv");
end, true);
v69[2]:button(v63:format("gears", "Crewqx fig", 7, 2, 8), function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=w8hKN5");
end, true);
local v70 = {
    label = v69[4]:label(v63:format("pen", "Watermark", 2, 4, 2))
};
local v71 = v70.label:create();
v70.render_mode = v71:slider(v63:format(point, "Render Mode", 2, 2, 2), 0, 1, 0, 1, function(v72)
    if v72 == 0 then
        return "GODSENSE";
    elseif v72 == 1 then
        return "Nyanza old";
    else
        return;
    end;
end);
v70.font = v71:combo(v63:format(point, "Font", 2, 2, 2), {
    [1] = "Default", 
    [2] = "Pixel", 
    [3] = "Bold", 
    [4] = "Console"
});
v70.pos = v71:combo(v63:format(point, "Position", 2, 2, 2), {
    [1] = "Left", 
    [2] = "Right", 
    [3] = "Bottom", 
    [4] = "Custom"
});
v70.mode = v71:selectable(v63:format(point, "Mode Text", 2, 2, 2), {
    [1] = "Pulse", 
    [2] = "Encoding", 
    [3] = "Rainbow"
}):depend({
    [1] = nil, 
    [2] = 0, 
    [1] = v70.render_mode
});
v70.mode_color = v71:slider(v63:format(point, "Mode Accent", 2, 2, 2), 0, 1, 0, 1, function(v73)
    if v73 == 0 then
        return "Static";
    elseif v73 == 1 then
        return "Gradient";
    else
        return;
    end;
end):depend({
    [1] = nil, 
    [2] = "Rainbow", 
    [3] = true, 
    [1] = v70.mode
});
v70.static_color = v71:color_picker(v63:format("brush", "Accent", 2, 2, 2)):depend({
    [1] = nil, 
    [2] = 0, 
    [1] = v70.mode_color
}, {
    [1] = nil, 
    [2] = "Rainbow", 
    [3] = true, 
    [1] = v70.mode
});
v70.gradient_color = v71:color_picker(v63:format("brush", "Accent", 2, 2, 2), {
    First = {
        color(255, 255, 255, 255)
    }, 
    Second = {
        color(160, 124, 156, 255)
    }
}):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v70.mode_color
}, {
    [1] = nil, 
    [2] = "Rainbow", 
    [3] = true, 
    [1] = v70.mode
});
v70.text = v71:input(v63:format("pen-clip", "Text", 2, 2, 2), _G.SCRIPT_NAME):depend({
    [1] = nil, 
    [2] = 0, 
    [1] = v70.render_mode
});
v70.custom_x = v71:slider("x", 0, render.screen_size().x, render.screen_size().x / 2):visibility(false);
v70.custom_y = v71:slider("y", 0, render.screen_size().y, render.screen_size().y - 20):visibility(false);
v68.watermark = v70;
v71 = {
    list = v69[3]:list(v63:format("", "", 0, 0, 0), {}), 
    name = v69[3]:input(v63:format("", "", 0, 0, 0), ""), 
    save = v69[5]:button(v63:format("file-plus", "", 4, 4, 0, "FFFFFFFF\v"), nil, true)
};
v71.save:tooltip("Create / Save presets");
v71.load = v69[5]:button(v63:format("download", "", 4, 4, 0, "FFFFFFFF\v"), nil, true);
v71.load:tooltip("Load presets");
v71.export = v69[5]:button(v63:format("file-export", "", 5, 4, 0, "FFFFFFFF\v"), nil, true);
v71.export:tooltip("Export presets");
v71.import = v69[5]:button(v63:format("file-import", "", 5, 5, 0, "FFFFFFFF\v"), nil, true);
v71.import:tooltip("Import presets");
v71.delete = v69[5]:button(v63:format("trash", "", 16, 16, 0, "ff7a7aFF"), nil, true);
v71.delete:tooltip("Delete presets");
v68.presets = v71;
v67.info = v68;
v69 = {};
v70 = {};
v71 = {};
local v74 = l_pui_0.create(v63:format("user-secret", "", 0, 0, 0), "Team / Builder Configurator", 1);
v71.team = v74:list(v63:format("", "", 0, 0, 0), {
    [1] = "\v" .. point .. "\r  Terrorists", 
    [2] = "\v" .. point .. "\r  Counter-Terrorists"
});
v71.state = v74:combo(v63:format("users", "Conditions", 2, 2, 2), v65.states);
v70.conf = v71;
v74 = {};
local v75 = l_pui_0.create(v63:format("user-secret", "", 0, 0, 0), "Extra settings", 2);
v74.avoid_backstab = {
    switch = v75:switch(v63:format("sword", "Avoid Backstab", 2, 4, 2))
};
local v76 = {
    switch = v75:switch(v63:format("helmet-safety", "Safe Head", 2, 4, 2))
};
local v77 = v76.switch:create();
v76.states = v77:selectable(v63:format(point, "States", 2, 2, 2), {
    [1] = "Zeus x27", 
    [2] = "Knife", 
    [3] = "Difference high."
}):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v76.switch
});
v76.states:tooltip("- \vZeus\r / \vKnife\r working only in Air Crouching. \n\n -\vDifference high.\r working when you upper then enemy.");
v76.high_slider = v77:slider(v63:format("slider", "\a{Small Text}Height", 5, 2, 2, "\a{Small Text}"), 0, 200, 25, 1, "u."):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v76.switch
}, {
    [1] = nil, 
    [2] = "Difference high.", 
    [1] = v76.states
});
v74.safe_head = v76;
v77 = {
    label = v75:label(v63:format("gear", "Warmup AA", 2, 4, 2))
};
local v78 = v77.label:create();
v77.mode = v78:selectable(v63:format("gear", "Mode", 2, 2, 2), {
    [1] = "Warmup", 
    [2] = "No Enemies"
});
v77.pitch = v78:combo(v63:format(point, "Pitch", 5, 2, 2), "Disabled", "Down"):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v77.mode
});
v77.yaw = v78:combo(v63:format(point, "Yaw", 5, 2, 2), "Spin", "Random"):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v77.mode
});
v77.range = v78:slider(v63:format("arrow-rotate-right", "Range", 5, 2, 2), 1, 360, 360, 1, "\194\176"):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v77.mode
});
v77.speed = v78:slider(v63:format("bolt", "Speed", 6, 2, 2), 1, 10, 3, 1, "t"):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v77.mode
});
v74.warmup_aa = v77;
v78 = {
    select = v75:label(v63:format("puzzle", "Hotkeys", 2, 4, 2))
};
local v79 = v78.select:create();
local v80 = {
    switch = v79:switch(v63:format("arrows-turn-to-dots", "Freestanding", 2, 4, 2)), 
    prefer_manual = v79:switch(v63:format(point, "\a{Small Text}Prefer Manual", 10, 2, 2, "\a{Small Text}")), 
    yaw_mod = v79:switch(v63:format(point, "\a{Small Text}Disable Yaw Modifiers", 10, 2, 2, "\a{Small Text}")), 
    disablers = v79:selectable(v63:format("ban", "\a{Small Text}Disablers", 10, 3, 2, "\a{Small Text}"), v65.states)
};
v80.switch:tooltip("\a{Small Text}Bind on key");
v78.freestanding = v80;
local v81 = {
    label = v79:label(" \a{Small Text}\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128")
};
local v82 = {
    side = v79:combo(v63:format("arrows-spin", "Manual Yaw", 2, 4, 2), {
        [1] = "Disabled", 
        [2] = "Left", 
        [3] = "Right", 
        [4] = "Forward"
    }), 
    static = v79:switch(v63:format(point, "\a{Small Text}Static", 10, 2, 2, "\a{Small Text}"))
};
v82.inverter = v79:switch(v63:format(point, "\a{Small Text}Inverted", 10, 2, 2, "\a{Small Text}")):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v82.static
});
v78.manuals = v82;
v74.addon_aa = v78;
v79 = {
    label = v75:label(v63:format("globe", "Animations", 2, 4, 2))
};
v80 = v79.label:create();
v79.jitter_legs = {
    switch = v80:switch(v63:format("object-intersect", "Jitter Legs", 2, 3, 2))
};
v79.select = v80:selectable(v63:format("list", "Animations", 2, 3, 2), {
    [1] = "Falling", 
    [2] = "Leaning", 
    [3] = "Interpolating"
});
v79.falling = {
    value = v80:slider(v63:format("person-falling-burst", "\a{Small Text}Falling", 2, 2, 2, "\a{Small Text}"), 0, 100, 0, 1, function(v83)
        if v83 == 0 then
            return "Off";
        else
            return v83 .. "%";
        end;
    end):depend({
        [1] = nil, 
        [2] = "Falling", 
        [1] = v79.select
    })
};
v79.leaning = {
    value = v80:slider(v63:format("person-running", "\a{Small Text}Leaning", 2, 4, 2, "\a{Small Text}"), 0, 100, 0, 1, function(v84)
        if v84 == 0 then
            return "Default";
        elseif v84 == 25 then
            return "Low";
        elseif v84 == 75 then
            return "High";
        elseif v84 == 100 then
            return "Max.";
        else
            return v84 .. "%";
        end;
    end):depend({
        [1] = nil, 
        [2] = "Leaning", 
        [1] = v79.select
    })
};
v79.interpolating = {
    value = v80:slider(v63:format("heat", "\a{Small Text}Interpolating", 2, 4, 2, "\a{Small Text}"), 0, 14, 9, 1, function(v85)
        if v85 == 0 then
            return "Default";
        elseif v85 == 9 then
            return "Medium";
        elseif v85 == 14 then
            return "Extreme";
        else
            return v85 .. "t";
        end;
    end):depend({
        [1] = nil, 
        [2] = "Interpolating", 
        [1] = v79.select
    })
};
v74.animfix = v79;
v70.extra = v74;
v69.main = v70;
v71 = {};
v74 = {
    group = l_pui_0.create(v63:format("user-secret", "", 0, 0, 0), "Tickbase Builder", 2)
};
v74.hide_shots = v74.group:combo(v63:format("eye-slash", "Hide Shots Mode", 1, 2, 2), {
    [1] = "Favor Fire Rate", 
    [2] = "Favor Fake Lag", 
    [3] = "Break LC"
});
v74.disable_on_grenade = v74.group:switch(v63:format("bug", "Disable on Grenade", 2, 2, 2));
v74.select = v74.group:selectable(v63:format("bars", "Break LC", 2, 2, 2, "\v"), v65.states);
v71.break_lc = v74;
v75 = l_pui_0.create(v63:format("user-secret", "", 0, 0, 0), "\n", 1);
local v86 = {};
do
    local l_v74_0, l_v86_0 = v74, v86;
    for _, v90 in pairs(v65.states) do
        l_v86_0[v90] = {};
        do
            local l_v90_0 = v90;
            for v92, v93 in pairs(v65.teams) do
                l_v86_0[l_v90_0][v93] = {};
                local v94 = l_v86_0[l_v90_0][v93];
                local l_team_0 = v70.conf.team;
                local l_state_0 = v70.conf.state;
                v94.yaw = v75:combo(v63:format("rotate", "Yaw mode", 2, 3, 2), {
                    [1] = "1-Way", 
                    [2] = "2-Way"
                }):depend({
                    [1] = l_team_0, 
                    [2] = v92
                }, {
                    [1] = l_state_0, 
                    [2] = l_v90_0
                });
                v94.offset = v75:slider(v63:format("\a{Small Text}" .. point, "Offset", 7, 3, 2), -180, 180, 0, 1, "\194\176"):depend({
                    [1] = nil, 
                    [2] = "1-Way", 
                    [1] = v94.yaw
                }, {
                    [1] = l_team_0, 
                    [2] = v92
                }, {
                    [1] = l_state_0, 
                    [2] = l_v90_0
                });
                local v97 = v94.yaw:create();
                v94.yaw_left = v97:slider(v63:format(point, "Left Offset", 3, 2, 2), -180, 180, 0, 1, "\194\176"):depend({
                    [1] = nil, 
                    [2] = "2-Way", 
                    [1] = v94.yaw
                });
                v94.yaw_right = v97:slider(v63:format(point, "Right Offset", 3, 2, 2), -180, 180, 0, 1, "\194\176"):depend({
                    [1] = nil, 
                    [2] = "2-Way", 
                    [1] = v94.yaw
                });
                local v98 = v97:label(" \a{Small Text}\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128"):depend({
                    [1] = nil, 
                    [2] = "2-Way", 
                    [1] = v94.yaw
                });
                v94.delay_method = v97:slider(v63:format(point, "Delay mode", 3, 2, 2), 0, 3, 0, 1, function(v99)
                    if v99 == 0 then
                        return "Off";
                    elseif v99 == 1 then
                        return "Default";
                    elseif v99 == 2 then
                        return "Shuffle";
                    elseif v99 == 3 then
                        return "Ways";
                    else
                        return nil;
                    end;
                end):depend({
                    [1] = nil, 
                    [2] = "2-Way", 
                    [1] = v94.yaw
                });
                v94.delay_default = v97:slider(v63:format(point, "Way", 7, 2, 2, "\a{Small Text}"), 2, 20, 0, 1, "t"):depend({
                    [1] = nil, 
                    [2] = "2-Way", 
                    [1] = v94.yaw
                }, {
                    [1] = nil, 
                    [2] = 1, 
                    [1] = v94.delay_method
                });
                v94.delay_random_min = v97:slider(v63:format("angle-right", "Min.", 7, 2, 2, "\a{Small Text}"), 2, 20, 0, 1, "t"):depend({
                    [1] = nil, 
                    [2] = "2-Way", 
                    [1] = v94.yaw
                }, {
                    [1] = nil, 
                    [2] = 2, 
                    [1] = v94.delay_method
                });
                v94.delay_random_max = v97:slider(v63:format("angle-right", "Max.", 7, 2, 2, "\a{Small Text}"), 2, 20, 0, 1, "t"):depend({
                    [1] = nil, 
                    [2] = "2-Way", 
                    [1] = v94.yaw
                }, {
                    [1] = nil, 
                    [2] = 2, 
                    [1] = v94.delay_method
                });
                v94.delay_custom_sliders = v97:slider(v63:format("code-fork", "Ways", 5, 2, 2, "\a{Small Text}"), 2, 8, 2):depend({
                    [1] = nil, 
                    [2] = "2-Way", 
                    [1] = v94.yaw
                }, {
                    [1] = nil, 
                    [2] = 3, 
                    [1] = v94.delay_method
                });
                do
                    local l_v94_0, l_l_team_0_0, l_l_state_0_0 = v94, l_team_0, l_state_0;
                    for v103 = 1, 8 do
                        do
                            local l_v103_0 = v103;
                            l_v94_0["delay_" .. l_v103_0] = v97:slider(v63:format("arrow-right", ("[" .. "%s" .. "]"):format(l_v103_0), 5 + 2 * l_v103_0, 2, 2, "\a{Small Text}"), 2, 20, 0, 1, "t"):depend({
                                [1] = nil, 
                                [2] = "2-Way", 
                                [1] = l_v94_0.yaw
                            }, {
                                [1] = nil, 
                                [2] = 3, 
                                [1] = l_v94_0.delay_method
                            }, {
                                [1] = l_v94_0.delay_custom_sliders, 
                                [2] = function()
                                    -- upvalues: l_v103_0 (ref), l_v94_0 (ref)
                                    if l_v103_0 <= 2 then
                                        return true;
                                    else
                                        return l_v94_0.delay_custom_sliders.value >= l_v103_0;
                                    end;
                                end
                            });
                        end;
                    end;
                    l_v94_0.delay_shuffle = v97:button(v63:format("shuffle", "Shuffle", 3, 2, 2), function()
                        -- upvalues: l_v94_0 (ref)
                        for v105 = 1, l_v94_0.delay_custom_sliders.value do
                            local v106 = "delay_" .. v105;
                            if l_v94_0[v106] then
                                local v107 = math.random(2, 20);
                                l_v94_0[v106]:set(v107);
                            end;
                        end;
                    end, true):depend({
                        [1] = nil, 
                        [2] = "2-Way", 
                        [1] = l_v94_0.yaw
                    }, {
                        [1] = nil, 
                        [2] = 3, 
                        [1] = l_v94_0.delay_method
                    });
                    l_v94_0.delay_reset = v97:button(v63:format("trash", "Reset", 3, 2, 2), function()
                        -- upvalues: l_v94_0 (ref)
                        l_v94_0.delay_custom_sliders:set(2);
                        for v108 = 1, 8 do
                            local v109 = "delay_" .. v108;
                            if l_v94_0[v109] then
                                l_v94_0[v109]:set(2);
                            end;
                        end;
                    end, true):depend({
                        [1] = nil, 
                        [2] = "2-Way", 
                        [1] = l_v94_0.yaw
                    }, {
                        [1] = nil, 
                        [2] = 3, 
                        [1] = l_v94_0.delay_method
                    });
                    l_v94_0.modifier = v75:combo(v63:format("gear", "Modifier", 2, 3, 2), {
                        [1] = "Disabled", 
                        [2] = "Center", 
                        [3] = "Offset", 
                        [4] = "Random", 
                        [5] = "Spin", 
                        [6] = "3-Way", 
                        [7] = "5-Way"
                    }):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    });
                    v97 = l_v94_0.modifier:create();
                    l_v94_0.randomize = v97:switch(v63:format("shuffle", "Modification", 2, 4, 2)):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = "Disabled", 
                        [3] = true, 
                        [1] = l_v94_0.modifier
                    });
                    l_v94_0.modifier_mode = v97:combo(v63:format("gears", "Mode", 2, 2, 2), "Default", "Custom"):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = "Disabled", 
                        [3] = true, 
                        [1] = l_v94_0.modifier
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.randomize
                    });
                    l_v94_0.min = v97:slider(v63:format("angle-right", "Min.", 5, 4, 2, "\a{Small Text}"), -180, 180, 0, 1, "\194\176"):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = "Disabled", 
                        [3] = true, 
                        [1] = l_v94_0.modifier
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.randomize
                    }, {
                        [1] = nil, 
                        [2] = "Default", 
                        [1] = l_v94_0.modifier_mode
                    });
                    l_v94_0.max = v97:slider(v63:format("angle-right", "Max.", 5, 4, 2, "\a{Small Text}"), -180, 180, 0, 1, "\194\176"):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = "Disabled", 
                        [3] = true, 
                        [1] = l_v94_0.modifier
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.randomize
                    }, {
                        [1] = nil, 
                        [2] = "Default", 
                        [1] = l_v94_0.modifier_mode
                    });
                    l_v94_0.modifier_custom_sliders = v97:slider(v63:format(point, "Sliders", 7, 5, 2), 2, 6, 2):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = "Disabled", 
                        [3] = true, 
                        [1] = l_v94_0.modifier
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.randomize
                    }, {
                        [1] = nil, 
                        [2] = "Custom", 
                        [1] = l_v94_0.modifier_mode
                    });
                    for v110 = 1, 6 do
                        do
                            local l_v110_0 = v110;
                            l_v94_0["modifier_sliders_" .. l_v110_0] = v97:slider(v63:format("angle-right", ("%s"):format(l_v110_0), 10 + 5 * l_v110_0, 2, 2, "\a{Small Text}"), -180, 180, 0, 1, "\194\176"):depend({
                                [1] = l_l_team_0_0, 
                                [2] = v92
                            }, {
                                [1] = l_l_state_0_0, 
                                [2] = l_v90_0
                            }, {
                                [1] = nil, 
                                [2] = "Disabled", 
                                [3] = true, 
                                [1] = l_v94_0.modifier
                            }, {
                                [1] = nil, 
                                [2] = true, 
                                [1] = l_v94_0.randomize
                            }, {
                                [1] = nil, 
                                [2] = "Custom", 
                                [1] = l_v94_0.modifier_mode
                            }, {
                                [1] = l_v94_0.modifier_custom_sliders, 
                                [2] = function()
                                    -- upvalues: l_v110_0 (ref), l_v94_0 (ref)
                                    if l_v110_0 <= 2 then
                                        return true;
                                    else
                                        return l_v94_0.modifier_custom_sliders.value >= l_v110_0;
                                    end;
                                end
                            });
                        end;
                    end;
                    l_v94_0.modifier_offset = v75:slider(v63:format(point, "Offset", 6, 4, 2, "\a{Small Text}"), -180, 180, 0, 1, "\194\176"):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = "Disabled", 
                        [3] = true, 
                        [1] = l_v94_0.modifier
                    }, {
                        [1] = nil, 
                        [2] = false, 
                        [1] = l_v94_0.randomize
                    });
                    l_v94_0.body_yaw = v75:switch(v63:format("microchip", "Body Yaw", 2, 5, 2)):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    });
                    v97 = l_v94_0.body_yaw:create();
                    l_v94_0.jitterbutton = v97:switch(v63:format(point, "Jitter", 2, 2, 2), true):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.body_yaw
                    });
                    l_v94_0.mode = v97:combo(v63:format(point, "Mode", 2, 2, 2), {
                        [1] = "Static", 
                        [2] = "Ticks", 
                        [3] = "Random"
                    }):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.body_yaw
                    });
                    l_v94_0.mode_ticks = v97:slider(v63:format("clock", "Ticks", 5, 2, 2), 4, 16, 4, 1, "t"):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.body_yaw
                    }, {
                        [1] = nil, 
                        [2] = "Ticks", 
                        [1] = l_v94_0.mode
                    });
                    l_v94_0.mode_random = v97:slider(v63:format(point, "Random", 5, 2, 2), 4, 16, 4, 1, "\194\176"):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.body_yaw
                    }, {
                        [1] = nil, 
                        [2] = "Random", 
                        [1] = l_v94_0.mode
                    });
                    l_v94_0.limit_mode = v97:combo(v63:format(point, "Desync Method", 2, 2, 2), {
                        [1] = "Default", 
                        [2] = "Random", 
                        [3] = "Tick Swap"
                    }):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.body_yaw
                    });
                    l_v94_0.left_limit = v97:slider(v63:format("angle-right", "Left Limit", 5, 2, 2, "\a{Small Text}"), 0, 60, 60, 1, "\194\176"):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.body_yaw
                    }, {
                        [1] = nil, 
                        [2] = "Default", 
                        [1] = l_v94_0.limit_mode
                    });
                    l_v94_0.right_limit = v97:slider(v63:format("angle-right", "Right Limit", 5, 2, 2, "\a{Small Text}"), 0, 60, 60, 1, "\194\176"):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.body_yaw
                    }, {
                        [1] = nil, 
                        [2] = "Default", 
                        [1] = l_v94_0.limit_mode
                    });
                    l_v94_0.minimum_limit = v97:slider(v63:format(point, "Min.", 5, 2, 2, "\a{Small Text}"), 0, 60, 60, 1, "\194\176"):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.body_yaw
                    }, {
                        [1] = nil, 
                        [2] = "Random", 
                        [1] = l_v94_0.limit_mode
                    });
                    l_v94_0.maximum_limit = v97:slider(v63:format(point, "Max.", 5, 2, 2, "\a{Small Text}"), 0, 60, 60, 1, "\194\176"):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.body_yaw
                    }, {
                        [1] = nil, 
                        [2] = "Random", 
                        [1] = l_v94_0.limit_mode
                    });
                    l_v94_0.sb_speed = v97:slider(v63:format("clock", "Tick", 4, 2, 2, "\a{Small Text}"), 2, 20, 0, 1, "t"):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.body_yaw
                    }, {
                        [1] = nil, 
                        [2] = "Tick Swap", 
                        [1] = l_v94_0.limit_mode
                    });
                    l_v94_0.from_limit = v97:slider(v63:format("angle-right", "[1]", 8, 2, 2, "\a{Small Text}"), 0, 60, 60, 1, "\194\176"):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.body_yaw
                    }, {
                        [1] = l_v94_0.limit_mode, 
                        [2] = function()
                            -- upvalues: l_v94_0 (ref)
                            return l_v94_0.limit_mode:get() == "Tick Swap";
                        end
                    });
                    l_v94_0.to_limit = v97:slider(v63:format("angle-right", "[2]", 8, 2, 2, "\a{Small Text}"), 0, 60, 60, 1, "\194\176"):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.body_yaw
                    }, {
                        [1] = l_v94_0.limit_mode, 
                        [2] = function()
                            -- upvalues: l_v94_0 (ref)
                            return l_v94_0.limit_mode:get() == "Tick Swap";
                        end
                    });
                    l_v94_0.choke = l_v74_0.group:combo(v63:format("line-height", "Tickbase", 2, 2, 2), {
                        [1] = "Default", 
                        [2] = "Custom"
                    }):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = l_v74_0.select, 
                        [2] = function()
                            -- upvalues: l_v74_0 (ref), l_v90_0 (ref)
                            return l_v74_0.select:get(l_v90_0);
                        end
                    });
                    v98 = l_v94_0.choke:create();
                    l_v94_0.random_choke = v98:switch(v63:format(point, "Randomaze", 2, 2, 2)):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = "Custom", 
                        [1] = l_v94_0.choke
                    });
                    l_v94_0.choke_slider = v98:slider(v63:format("wifi-exclamation", "Choke", 10, 2, 2), 2, 22, 16, 1, "t"):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = "Custom", 
                        [1] = l_v94_0.choke
                    }, {
                        [1] = nil, 
                        [2] = false, 
                        [1] = l_v94_0.random_choke
                    });
                    l_v94_0.choke_method = v98:combo(v63:format(point, "Mode", 2, 2, 2), {
                        [1] = "Default", 
                        [2] = "Custom"
                    }):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = "Custom", 
                        [1] = l_v94_0.choke
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.random_choke
                    });
                    l_v94_0.choke_from = v98:slider(v63:format("angle-right", "[1]", 6, 2, 2, "\a{Small Text}"), 2, 22, 16, 1, "t"):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = "Custom", 
                        [1] = l_v94_0.choke
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.random_choke
                    }, {
                        [1] = nil, 
                        [2] = "Default", 
                        [1] = l_v94_0.choke_method
                    });
                    l_v94_0.choke_to = v98:slider(v63:format("angle-right", "[2]", 6, 2, 2, "\a{Small Text}"), 2, 22, 16, 1, "t"):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = "Custom", 
                        [1] = l_v94_0.choke
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.random_choke
                    }, {
                        [1] = nil, 
                        [2] = "Default", 
                        [1] = l_v94_0.choke_method
                    });
                    l_v94_0.choke_sliders = v98:slider(v63:format(point, "Count", 6, 2, 2), 2, 8, 2):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = "Custom", 
                        [1] = l_v94_0.choke
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.random_choke
                    }, {
                        [1] = nil, 
                        [2] = "Custom", 
                        [1] = l_v94_0.choke_method
                    });
                    for v112 = 1, 8 do
                        do
                            local l_v112_0 = v112;
                            l_v94_0["choke1_" .. l_v112_0] = v98:slider(v63:format("angle-right", ("[" .. "%s" .. "]"):format(l_v112_0), 8 + 3 * l_v112_0, 2, 2, "\a{Small Text}"), 2, 22, 0, 1, "t"):depend({
                                [1] = l_l_team_0_0, 
                                [2] = v92
                            }, {
                                [1] = l_l_state_0_0, 
                                [2] = l_v90_0
                            }, {
                                [1] = nil, 
                                [2] = "Custom", 
                                [1] = l_v94_0.choke
                            }, {
                                [1] = nil, 
                                [2] = true, 
                                [1] = l_v94_0.random_choke
                            }, {
                                [1] = nil, 
                                [2] = "Custom", 
                                [1] = l_v94_0.choke_method
                            }, {
                                [1] = l_v94_0.choke_sliders, 
                                [2] = function()
                                    -- upvalues: l_v112_0 (ref), l_v94_0 (ref)
                                    if l_v112_0 <= 2 then
                                        return true;
                                    else
                                        return l_v94_0.choke_sliders.value >= l_v112_0;
                                    end;
                                end
                            });
                        end;
                    end;
                    l_v94_0.tick_shuffle = v98:button(v63:format("shuffle", "Shuffle", 3, 2, 2), function()
                        -- upvalues: l_v94_0 (ref)
                        for v114 = 1, l_v94_0.choke_sliders.value do
                            local v115 = "choke1_" .. v114;
                            if l_v94_0[v115] then
                                local v116 = math.random(2, 20);
                                l_v94_0[v115]:set(v116);
                            end;
                        end;
                    end, true):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = "Custom", 
                        [1] = l_v94_0.choke
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.random_choke
                    }, {
                        [1] = nil, 
                        [2] = "Custom", 
                        [1] = l_v94_0.choke_method
                    });
                    l_v94_0.tick_reset = v98:button(v63:format("trash", "Reset", 3, 2, 2), function()
                        -- upvalues: l_v94_0 (ref)
                        l_v94_0.choke_sliders:set(2);
                        for v117 = 1, 8 do
                            local v118 = "choke1_" .. v117;
                            if l_v94_0[v118] then
                                l_v94_0[v118]:set(2);
                            end;
                        end;
                    end, true):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    }, {
                        [1] = nil, 
                        [2] = "Custom", 
                        [1] = l_v94_0.choke
                    }, {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v94_0.random_choke
                    }, {
                        [1] = nil, 
                        [2] = "Custom", 
                        [1] = l_v94_0.choke_method
                    });
                    l_v94_0.send_to_opposite = v75:button(v63:format("rotate", "Send to the opposite side", 23, 2, 23), function()
                        -- upvalues: l_l_team_0_0 (ref), l_l_state_0_0 (ref), l_v86_0 (ref)
                        local v119 = l_l_team_0_0:get() == 1 and "CT" or "T";
                        local v120 = l_l_state_0_0:get();
                        local v121 = l_v86_0[v120][l_l_team_0_0:get() == 1 and "T" or "CT"];
                        local v122 = l_v86_0[v120][v119];
                        local v123 = {
                            delay_shuffle = true, 
                            tick_shuffle = true, 
                            tick_reset = true, 
                            delay_reset = true, 
                            send_to_opposite = true
                        };
                        local v124 = {
                            [1] = "delay_custom_sliders", 
                            [2] = "choke_sliders"
                        };
                        for _, v126 in ipairs(v124) do
                            if v121[v126] and v122[v126] then
                                v122[v126]:set(v121[v126]:get());
                            end;
                        end;
                        for v127, v128 in pairs(v121) do
                            if not v123[v127] and v127 ~= "delay_custom_sliders" and v127 ~= "choke_sliders" then
                                for v129, v130 in pairs(v122) do
                                    if v129 == v127 then
                                        v130:set(v128:get());
                                    end;
                                end;
                            end;
                        end;
                    end, true):depend({
                        [1] = l_l_team_0_0, 
                        [2] = v92
                    }, {
                        [1] = l_l_state_0_0, 
                        [2] = l_v90_0
                    });
                    l_v86_0[l_v90_0][v93] = l_v94_0;
                    v71.builder = l_v86_0;
                end;
            end;
        end;
    end;
    v69.angles = v71;
    v67.antiaim = v69;
end;
v74 = {};
v75 = {
    l_pui_0.create(v63:format("gears", "", 0, 0, 0), "Movement", 1), 
    l_pui_0.create(v63:format("gears", "", 0, 0, 0), "Ragebot", 1), 
    l_pui_0.create(v63:format("gears", "", 0, 0, 0), "Visuals", 2)
};
v86 = {
    no_fall_damage = v75[1]:switch(v63:format("person-falling", "No Fall Damage", 4, 7, 0)), 
    fast_ladder = v75[1]:switch(v63:format("star-shooting", "Fast Ladder", 4, 6, 0)), 
    edge_quick_stop = v75[1]:switch(v63:format("person-walking-dashed-line-arrow-right", "Edge Quick Stop", 3, 5, 0))
};
v86.edge_quick_stop:tooltip("Mechanics from Minecraft.");
v74.movement = v86;
v76 = {};
v77 = {
    switch = v75[3]:switch(v63:format("x-ray", "Aspect Ratio", 2, 6, 2))
};
v78 = v77.switch:create();
v77.value = v78:slider(v63:format(point, "Value", 2, 2, 2), 1, 200, 177, 0.01, function(v131)
    if v131 == 177 then
        return "16:9";
    elseif v131 == 161 then
        return "16:10";
    elseif v131 == 150 then
        return "3:2";
    elseif v131 == 133 then
        return "4:3";
    elseif v131 == 125 then
        return "5:4";
    elseif v131 == 50 then
        return "Off";
    else
        return nil;
    end;
end):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v77.switch
});
do
    local l_v77_0, l_v78_0 = v77, v78;
    v79 = l_v78_0:button(" 4:3 ", function()
        -- upvalues: l_v77_0 (ref)
        l_v77_0.value:set(133);
    end, true):depend({
        [1] = nil, 
        [2] = true, 
        [1] = l_v77_0.switch
    });
    v80 = l_v78_0:button(" 5:4 ", function()
        -- upvalues: l_v77_0 (ref)
        l_v77_0.value:set(125);
    end, true):depend({
        [1] = nil, 
        [2] = true, 
        [1] = l_v77_0.switch
    });
    v81 = l_v78_0:button(" 16:9 ", function()
        -- upvalues: l_v77_0 (ref)
        l_v77_0.value:set(177);
    end, true):depend({
        [1] = nil, 
        [2] = true, 
        [1] = l_v77_0.switch
    });
    v82 = l_v78_0:button(" 16:10 ", function()
        -- upvalues: l_v77_0 (ref)
        l_v77_0.value:set(161);
    end, true):depend({
        [1] = nil, 
        [2] = true, 
        [1] = l_v77_0.switch
    });
    local l_r_aspectratio_0 = cvar.r_aspectratio;
    do
        local l_l_r_aspectratio_0_0 = l_r_aspectratio_0;
        local function v136()
            -- upvalues: l_l_r_aspectratio_0_0 (ref), v35 (ref)
            l_l_r_aspectratio_0_0:float(v35:get_original(l_l_r_aspectratio_0_0));
        end;
        local function v138()
            -- upvalues: l_v77_0 (ref), v136 (ref), l_l_r_aspectratio_0_0 (ref)
            if not l_v77_0.switch:get() then
                v136();
                return;
            else
                local v137 = l_v77_0.value:get() * 0.01;
                l_l_r_aspectratio_0_0:float(v137, true);
                return;
            end;
        end;
        if l_v77_0.switch.set_callback then
            l_v77_0.switch:set_callback(v138, true);
        end;
        if l_v77_0.value.set_callback then
            l_v77_0.value:set_callback(v138, true);
        end;
        if events and events.shutdown then
            events.shutdown(v136);
        end;
        v76.aspect_ratio = l_v77_0;
    end;
    l_v78_0 = {
        switch = v75[3]:switch(v63:format("hand-sparkles", "Viewmodel Changer", 2, 3, 2))
    };
    v79 = l_v78_0.switch:create();
    l_v78_0.fov = v79:slider(v63:format(point, "Field of View", 2, 2, 2), 0, 100, 60):depend({
        [1] = nil, 
        [2] = true, 
        [1] = l_v78_0.switch
    });
    l_v78_0.x = v79:slider(v63:format(point, "Offset X", 2, 2, 2), -100, 100, 10, 0.1):depend({
        [1] = nil, 
        [2] = true, 
        [1] = l_v78_0.switch
    });
    l_v78_0.y = v79:slider(v63:format(point, "Offset Y", 2, 2, 2), -100, 100, 10, 0.1):depend({
        [1] = nil, 
        [2] = true, 
        [1] = l_v78_0.switch
    });
    l_v78_0.z = v79:slider(v63:format(point, "Offset Z", 2, 2, 2), -100, 100, -15, 0.1):depend({
        [1] = nil, 
        [2] = true, 
        [1] = l_v78_0.switch
    });
    viewmodel_hand = v79:combo(v63:format(point, "\a{Small Text}Main Hand", 2, 2, 2, "\a{Small Text}"), "Right", "Left"):depend({
        [1] = nil, 
        [2] = true, 
        [1] = l_v78_0.switch
    });
    oppositeviewmodel_hand = v79:switch(v63:format(point, "\a{Small Text}Knife Left Hand", 2, 2, 2, "\a{Small Text}")):depend({
        [1] = nil, 
        [2] = "Right", 
        [1] = viewmodel_hand
    }):depend({
        [1] = nil, 
        [2] = true, 
        [1] = l_v78_0.switch
    });
    oppositeviewmodel_hand2 = v79:switch(v63:format(point, "\a{Small Text}Knife Right Hand", 2, 2, 2, "\a{Small Text}")):depend({
        [1] = nil, 
        [2] = "Left", 
        [1] = viewmodel_hand
    }):depend({
        [1] = nil, 
        [2] = true, 
        [1] = l_v78_0.switch
    });
    defaultviewmodel = v79:button(v63:format("gear", "Restore Default", 2, 2, 2), nil, true):depend({
        [1] = nil, 
        [2] = true, 
        [1] = l_v78_0.switch
    });
    mypreset = v79:button(v63:format("gear", "Default Preset", 2, 2, 2), nil, true):depend({
        [1] = nil, 
        [2] = true, 
        [1] = l_v78_0.switch
    });
    v80 = cvar.viewmodel_fov;
    v81 = cvar.viewmodel_offset_x;
    v82 = cvar.viewmodel_offset_y;
    l_r_aspectratio_0 = cvar.viewmodel_offset_z;
    local l_cl_righthand_0 = cvar.cl_righthand;
    do
        local l_v80_0, l_v81_0, l_v82_0, l_l_r_aspectratio_0_1 = v80, v81, v82, l_r_aspectratio_0;
        local function v144()
            -- upvalues: l_v80_0 (ref), v35 (ref), l_v81_0 (ref), l_v82_0 (ref), l_l_r_aspectratio_0_1 (ref)
            l_v80_0:float(v35:get_original(l_v80_0), false);
            l_v81_0:float(v35:get_original(l_v81_0), false);
            l_v82_0:float(v35:get_original(l_v82_0), false);
            l_l_r_aspectratio_0_1:float(v35:get_original(l_l_r_aspectratio_0_1), false);
        end;
        local function v149()
            -- upvalues: l_v78_0 (ref), l_v80_0 (ref), l_v81_0 (ref), l_v82_0 (ref), l_l_r_aspectratio_0_1 (ref), v144 (ref)
            local v145 = l_v78_0.x:get();
            local v146 = l_v78_0.y:get();
            local v147 = l_v78_0.z:get();
            local v148 = l_v78_0.fov:get();
            if l_v78_0.switch:get() then
                l_v80_0:float(v148, true);
                l_v81_0:float(v145 * 0.1, true);
                l_v82_0:float(v146 * 0.1, true);
                l_l_r_aspectratio_0_1:float(v147 * 0.1, true);
            else
                v144();
            end;
        end;
        local function v151()
            -- upvalues: l_v78_0 (ref)
            local l_cl_righthand_1 = cvar.cl_righthand;
            if viewmodel_hand:get() == "Left" and l_v78_0.switch:get() then
                l_cl_righthand_1:int(0);
            elseif viewmodel_hand:get() == "Right" and l_v78_0.switch:get() then
                l_cl_righthand_1:int(1);
            end;
        end;
        local function v156()
            -- upvalues: l_v78_0 (ref)
            local l_cl_righthand_2 = cvar.cl_righthand;
            local v153 = entity.get_local_player();
            if v153 == nil or not v153:is_alive() then
                return false;
            else
                local v154 = v153:get_player_weapon();
                if v154 == nil then
                    return false;
                else
                    local v155 = v154:get_classname() == "CKnife";
                    if viewmodel_hand:get() == "Left" and l_v78_0.switch:get() and oppositeviewmodel_hand2:get() and v155 then
                        l_cl_righthand_2:int(1);
                    elseif viewmodel_hand:get() == "Right" and l_v78_0.switch:get() and oppositeviewmodel_hand:get() and v155 then
                        l_cl_righthand_2:int(0);
                    end;
                    return;
                end;
            end;
        end;
        local function v157()
            -- upvalues: l_v78_0 (ref)
            if defaultviewmodel:get() then
                l_v78_0.fov:set(60);
                l_v78_0.x:set(10);
                l_v78_0.y:set(10);
                l_v78_0.z:set(-15);
            end;
            if mypreset:get() then
                l_v78_0.fov:set(66);
                l_v78_0.x:set(-14);
                l_v78_0.y:set(-16);
                l_v78_0.z:set(2);
            end;
        end;
        events.shutdown(v144);
        l_v78_0.switch:set_callback(v149, true);
        l_v78_0.x:set_callback(v149);
        l_v78_0.y:set_callback(v149);
        l_v78_0.z:set_callback(v149);
        viewmodel_hand:set_callback(v151);
        viewmodel_hand:set_callback(v156);
        events.createmove:set(v151);
        events.createmove:set(v156);
        defaultviewmodel:set_callback(v157, true);
        mypreset:set_callback(v157, true);
        l_v78_0.fov:set_callback(v149);
        v76.viewmodel_changer = l_v78_0;
    end;
    v79 = {
        switch = v75[3]:switch(v63:format("crosshairs", "Better Scope Overlay", 2, 6, 0))
    };
    v80 = v79.switch:create();
    v79.options = v80:selectable(v63:format(point, "Options", 2, 2, 2), {
        [1] = "Inverted"
    }):depend({
        [1] = nil, 
        [2] = true, 
        [1] = v79.switch
    });
    v79.length = v80:slider(v63:format(point, "Length", 2, 2, 0), 10, 300, 220):depend({
        [1] = nil, 
        [2] = true, 
        [1] = v79.switch
    });
    v79.gap = v80:slider(v63:format(point, "Gap", 2, 2, 0), 1, 300, 12):depend({
        [1] = nil, 
        [2] = true, 
        [1] = v79.switch
    });
    v79.colors = {
        main = v80:color_picker(v63:format(point, "Main Accent", 2, 2, 0), color(255, 255, 255, 255)):depend({
            [1] = nil, 
            [2] = true, 
            [1] = v79.switch
        }), 
        edge = v80:color_picker(v63:format(point, "Edge Accent", 2, 2, 0), color(0, 0, 0, 50)):depend({
            [1] = nil, 
            [2] = true, 
            [1] = v79.switch
        })
    };
    v76.scope_overlay = v79;
    v80 = {
        switch = v75[3]:switch(v63:format("arrows-repeat", "Manual Arrows", 2, 6, 2))
    };
    v81 = v80.switch:create();
    v80.font = v81:combo(v63:format(point, "Font", 2, 2, 2), {
        [1] = "Default", 
        [2] = "Small", 
        [3] = "Console", 
        [4] = "Bold"
    }):depend({
        [1] = nil, 
        [2] = true, 
        [1] = v80.switch
    });
    v80.color = v81:color_picker(v63:format(point, "Color", 2, 2, 2), color(240, 185, 201, 255)):depend({
        [1] = nil, 
        [2] = true, 
        [1] = v80.switch
    });
    v80.offset = v81:slider(v63:format(point, "Offset", 2, 2, 2), 0, 200, 25):depend({
        [1] = nil, 
        [2] = true, 
        [1] = v80.switch
    });
    v80.symbols = {
        left = v81:input(v63:format(point, "Left Symbol", 2, 2, 0), "<"):depend({
            [1] = nil, 
            [2] = true, 
            [1] = v80.switch
        }), 
        right = v81:input(v63:format(point, "Right Symbol", 2, 2, 0), ">"):depend({
            [1] = nil, 
            [2] = true, 
            [1] = v80.switch
        }), 
        forward = v81:input(v63:format(point, "Forward Symbol", 2, 2, 0), "^"):depend({
            [1] = nil, 
            [2] = true, 
            [1] = v80.switch
        })
    };
    v76.manual_arrows = v80;
    v81 = {
        select = v75[3]:selectable(v63:format("wand-sparkles", " Hit Marker", 2, 4, 2), {
            [1] = "2D", 
            [2] = "3D"
        })
    };
    v82 = v81.select:create();
    v81.color = v82:color_picker(" Color 2D", color(255, 255, 255, 140)):depend({
        [1] = nil, 
        [2] = "2D", 
        [1] = v81.select
    });
    v81.time = v82:slider(v63:format(point, "Duration", 2, 2, 2), 0, 100, 2, 0.1, "s"):depend({
        [1] = nil, 
        [2] = "2D", 
        [1] = v81.select
    });
    v81.color2 = v82:color_picker(" Color 3D", color(255, 255, 255, 255)):depend({
        [1] = nil, 
        [2] = "3D", 
        [1] = v81.select
    });
    v81.time2 = v82:slider(v63:format(point, "Duration", 2, 2, 2), 0, 100, 20, 0.1, "s"):depend({
        [1] = nil, 
        [2] = "3D", 
        [1] = v81.select
    });
    v76.hitmarker = v81;
    v76.player_transparency = {
        switch = v75[3]:switch(v63:format("transporter-2", "Keep Model Transparency", 2, 6, 2))
    };
    v76.remove_sleeves = {
        switch = v75[3]:switch(v63:format("shirt-long-sleeve", "Remove Sleeves", 2, 4, 2))
    };
    l_cl_righthand_0 = {
        switch = v75[3]:switch(v63:format("layer-plus", "Damage Indicator", 2, 5, 0))
    };
    l_cl_righthand_0.mode = l_cl_righthand_0.switch:create():combo(v63:format(point, "\a{Small Text}Mode", 3, 3, 3, "\a{Small Text}"), {
        [1] = "Default", 
        [2] = "Advanced"
    }):depend({
        [1] = nil, 
        [2] = true, 
        [1] = l_cl_righthand_0.switch
    });
    v76.dmg_indicator = l_cl_righthand_0;
    v74.visuals = v76;
end;
v77 = {};
v78 = {
    switch = v75[2]:switch(v63:format("cloud-check", "Unlock Ping Spike", 2, 4, 2), false)
};
v78.switch:set_callback(function(v158)
    local v159 = v158:get();
    cvar.sv_maxunlag:float(v159 and 0.4 or 0.1);
end);
v77.latency = v78;
v77.fakeduck = {
    unlock = v75[2]:switch(v63:format("forward-fast", "Custom FD Speed", 3, 5, 2)), 
    freeze_period = v75[2]:switch(v63:format("wind", "Fakeduck on Freezetime", 3, 5, 2))
};
v80 = {
    switch = v75[2]:switch(v63:format("code", "Log Events", 2, 4, 2))
};
v81 = v80.switch:create();
v82 = {
    select = v81:selectable(v63:format(point, "Log Events", 2, 2, 2), "Purchases Events", "Ragebot Events"):depend({
        [1] = nil, 
        [2] = true, 
        [1] = v80.switch
    })
};
v80.mode = v82;
v80.colors = {
    prefix = v81:color_picker(v63:format("", "Prefix Color", 10, 2, 2)):depend({
        [1] = nil, 
        [2] = true, 
        [1] = v80.switch
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v82.select
    }), 
    main = v81:color_picker(v63:format("", "Main Color", 10, 2, 2)):depend({
        [1] = nil, 
        [2] = true, 
        [1] = v80.switch
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v82.select
    })
};
v80.cstm_input = {
    input = v81:input(v63:format(point, "Prefix", 2, 2, 0), _G.SCRIPT_NAME):depend({
        [1] = nil, 
        [2] = true, 
        [1] = v80.switch
    }, {
        [1] = nil, 
        [2] = "Ragebot Events", 
        [1] = v82.select
    })
};
v77.logging = v80;
v74.aimbot = v77;
v67.misc = v74;
v68 = {};
preset = {
    init = function(v160)
        -- upvalues: l_base64_0 (ref), v63 (ref), v67 (ref)
        v160.encrypt_data = function(_, v162)
            -- upvalues: l_base64_0 (ref)
            return l_base64_0.encode(json.stringify(v162));
        end;
        v160.decrypt_data = function(_, v164)
            -- upvalues: l_base64_0 (ref)
            local l_status_0, l_result_0 = pcall(function()
                -- upvalues: l_base64_0 (ref), v164 (ref)
                return json.parse(l_base64_0.decode(v164));
            end);
            if not l_status_0 then
                return nil;
            else
                return l_result_0;
            end;
        end;
        v160.database = db.godsense_presets or {};
        v160.system_presets = {
            v63:format("", "\a{Link Active}Advanced " .. point, 0, 0, 0), 
            v63:format("", "\a{Link Active}Agressive " .. point, 0, 0, 0), 
            v63:format("", "\a{Link Active}Experemental " .. point, 0, 0, 0)
        };
        v160.separator = v63:format("", string.rep("\226\148\128", 39), 0, 0, 0);
        if not v160.database[v160.system_presets[1]] or #v160.database == 0 then
            v160.database[v160.system_presets[1]] = "eyJhdXRob3IiOiJTcXYxazIyOCIsImNvbmZpZyI6eyJhbnRpYWltIjp7ImFuZ2xlcyI6eyJicmVha19sYyI6eyJkaXNhYmxlX29uX2dyZW5hZGUiOnRydWUsImhpZGVfc2hvdHMiOiJCcmVhayBMQyIsInNlbGVjdCI6WyJTbG93d2Fsa2luZyIsIkNyb3VjaGluZyIsIlNuZWFraW5nIiwiQWlyIENyb3VjaGluZyIsIn4iXX0sImJ1aWxkZXIiOnsiQWlyIjp7IkNUIjp7ImJvZHlfeWF3Ijp0cnVlLCJjaG9rZSI6IkRlZmF1bHQiLCJjaG9rZTFfMSI6Mi4wLCJjaG9rZTFfMiI6Mi4wLCJjaG9rZTFfMyI6Mi4wLCJjaG9rZTFfNCI6Mi4wLCJjaG9rZTFfNSI6Mi4wLCJjaG9rZTFfNiI6Mi4wLCJjaG9rZTFfNyI6Mi4wLCJjaG9rZTFfOCI6Mi4wLCJjaG9rZV9mcm9tIjoxNi4wLCJjaG9rZV9tZXRob2QiOiJEZWZhdWx0IiwiY2hva2Vfc2xpZGVyIjoxNi4wLCJjaG9rZV9zbGlkZXJzIjoyLjAsImNob2tlX3RvIjoxNi4wLCJkZWxheV8xIjoyLjAsImRlbGF5XzIiOjIuMCwiZGVsYXlfMyI6Mi4wLCJkZWxheV80IjoyLjAsImRlbGF5XzUiOjIuMCwiZGVsYXlfNiI6Mi4wLCJkZWxheV83IjoyLjAsImRlbGF5XzgiOjIuMCwiZGVsYXlfY3VzdG9tX3NsaWRlcnMiOjIuMCwiZGVsYXlfZGVmYXVsdCI6Mi4wLCJkZWxheV9tZXRob2QiOjAuMCwiZGVsYXlfcmFuZG9tX21heCI6Mi4wLCJkZWxheV9yYW5kb21fbWluIjoyLjAsImZyb21fbGltaXQiOjYwLjAsImppdHRlcmJ1dHRvbiI6dHJ1ZSwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfbW9kZSI6IkRlZmF1bHQiLCJtYXgiOjAuMCwibWF4aW11bV9saW1pdCI6NjAuMCwibWluIjowLjAsIm1pbmltdW1fbGltaXQiOjYwLjAsIm1vZGUiOiJTdGF0aWMiLCJtb2RlX3JhbmRvbSI6NC4wLCJtb2RlX3RpY2tzIjo0LjAsIm1vZGlmaWVyIjoiRGlzYWJsZWQiLCJtb2RpZmllcl9jdXN0b21fc2xpZGVycyI6Mi4wLCJtb2RpZmllcl9tb2RlIjoiRGVmYXVsdCIsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzEiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18yIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMyI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc181IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNiI6MC4wLCJvZmZzZXQiOjAuMCwicmFuZG9tX2Nob2tlIjpmYWxzZSwicmFuZG9taXplIjpmYWxzZSwicmlnaHRfbGltaXQiOjYwLjAsInNiX3NwZWVkIjoyLjAsInRvX2xpbWl0Ijo2MC4wLCJ5YXciOiIxLVdheSIsInlhd19sZWZ0IjowLjAsInlhd19yaWdodCI6MC4wfSwiVCI6eyJib2R5X3lhdyI6dHJ1ZSwiY2hva2UiOiJEZWZhdWx0IiwiY2hva2UxXzEiOjIuMCwiY2hva2UxXzIiOjIuMCwiY2hva2UxXzMiOjIuMCwiY2hva2UxXzQiOjIuMCwiY2hva2UxXzUiOjIuMCwiY2hva2UxXzYiOjIuMCwiY2hva2UxXzciOjIuMCwiY2hva2UxXzgiOjIuMCwiY2hva2VfZnJvbSI6MTYuMCwiY2hva2VfbWV0aG9kIjoiRGVmYXVsdCIsImNob2tlX3NsaWRlciI6MTYuMCwiY2hva2Vfc2xpZGVycyI6Mi4wLCJjaG9rZV90byI6MTYuMCwiZGVsYXlfMSI6Mi4wLCJkZWxheV8yIjoyLjAsImRlbGF5XzMiOjIuMCwiZGVsYXlfNCI6Mi4wLCJkZWxheV81IjoyLjAsImRlbGF5XzYiOjIuMCwiZGVsYXlfNyI6Mi4wLCJkZWxheV84IjoyLjAsImRlbGF5X2N1c3RvbV9zbGlkZXJzIjoyLjAsImRlbGF5X2RlZmF1bHQiOjIuMCwiZGVsYXlfbWV0aG9kIjowLjAsImRlbGF5X3JhbmRvbV9tYXgiOjIuMCwiZGVsYXlfcmFuZG9tX21pbiI6Mi4wLCJmcm9tX2xpbWl0Ijo2MC4wLCJqaXR0ZXJidXR0b24iOnRydWUsImxlZnRfbGltaXQiOjYwLjAsImxpbWl0X21vZGUiOiJEZWZhdWx0IiwibWF4IjowLjAsIm1heGltdW1fbGltaXQiOjYwLjAsIm1pbiI6MC4wLCJtaW5pbXVtX2xpbWl0Ijo2MC4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6NC4wLCJtb2RpZmllciI6IkRpc2FibGVkIiwibW9kaWZpZXJfY3VzdG9tX3NsaWRlcnMiOjIuMCwibW9kaWZpZXJfbW9kZSI6IkRlZmF1bHQiLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18xIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMiI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzMiOjAuMCwibW9kaWZpZXJfc2xpZGVyc180IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzYiOjAuMCwib2Zmc2V0IjowLjAsInJhbmRvbV9jaG9rZSI6ZmFsc2UsInJhbmRvbWl6ZSI6ZmFsc2UsInJpZ2h0X2xpbWl0Ijo2MC4wLCJzYl9zcGVlZCI6Mi4wLCJ0b19saW1pdCI6NjAuMCwieWF3IjoiMS1XYXkiLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmlnaHQiOjAuMH19LCJBaXIgQ3JvdWNoaW5nIjp7IkNUIjp7ImJvZHlfeWF3Ijp0cnVlLCJjaG9rZSI6IkRlZmF1bHQiLCJjaG9rZTFfMSI6Mi4wLCJjaG9rZTFfMiI6Mi4wLCJjaG9rZTFfMyI6Mi4wLCJjaG9rZTFfNCI6Mi4wLCJjaG9rZTFfNSI6Mi4wLCJjaG9rZTFfNiI6Mi4wLCJjaG9rZTFfNyI6Mi4wLCJjaG9rZTFfOCI6Mi4wLCJjaG9rZV9mcm9tIjoxNi4wLCJjaG9rZV9tZXRob2QiOiJEZWZhdWx0IiwiY2hva2Vfc2xpZGVyIjoxNi4wLCJjaG9rZV9zbGlkZXJzIjoyLjAsImNob2tlX3RvIjoxNi4wLCJkZWxheV8xIjoyLjAsImRlbGF5XzIiOjIuMCwiZGVsYXlfMyI6Mi4wLCJkZWxheV80IjoyLjAsImRlbGF5XzUiOjIuMCwiZGVsYXlfNiI6Mi4wLCJkZWxheV83IjoyLjAsImRlbGF5XzgiOjIuMCwiZGVsYXlfY3VzdG9tX3NsaWRlcnMiOjIuMCwiZGVsYXlfZGVmYXVsdCI6Mi4wLCJkZWxheV9tZXRob2QiOjIuMCwiZGVsYXlfcmFuZG9tX21heCI6Ni4wLCJkZWxheV9yYW5kb21fbWluIjozLjAsImZyb21fbGltaXQiOjYwLjAsImppdHRlcmJ1dHRvbiI6dHJ1ZSwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfbW9kZSI6IkRlZmF1bHQiLCJtYXgiOjAuMCwibWF4aW11bV9saW1pdCI6NjAuMCwibWluIjowLjAsIm1pbmltdW1fbGltaXQiOjYwLjAsIm1vZGUiOiJTdGF0aWMiLCJtb2RlX3JhbmRvbSI6NC4wLCJtb2RlX3RpY2tzIjo0LjAsIm1vZGlmaWVyIjoiU3BpbiIsIm1vZGlmaWVyX2N1c3RvbV9zbGlkZXJzIjoyLjAsIm1vZGlmaWVyX21vZGUiOiJDdXN0b20iLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18xIjotMTAuMCwibW9kaWZpZXJfc2xpZGVyc18yIjo1LjAsIm1vZGlmaWVyX3NsaWRlcnNfMyI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc181IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNiI6MC4wLCJvZmZzZXQiOjAuMCwicmFuZG9tX2Nob2tlIjpmYWxzZSwicmFuZG9taXplIjp0cnVlLCJyaWdodF9saW1pdCI6NjAuMCwic2Jfc3BlZWQiOjIuMCwidG9fbGltaXQiOjYwLjAsInlhdyI6IjItV2F5IiwieWF3X2xlZnQiOi0xNy4wLCJ5YXdfcmlnaHQiOjQwLjB9LCJUIjp7ImJvZHlfeWF3Ijp0cnVlLCJjaG9rZSI6IkRlZmF1bHQiLCJjaG9rZTFfMSI6Mi4wLCJjaG9rZTFfMiI6Mi4wLCJjaG9rZTFfMyI6Mi4wLCJjaG9rZTFfNCI6Mi4wLCJjaG9rZTFfNSI6Mi4wLCJjaG9rZTFfNiI6Mi4wLCJjaG9rZTFfNyI6Mi4wLCJjaG9rZTFfOCI6Mi4wLCJjaG9rZV9mcm9tIjoxNi4wLCJjaG9rZV9tZXRob2QiOiJEZWZhdWx0IiwiY2hva2Vfc2xpZGVyIjoxNi4wLCJjaG9rZV9zbGlkZXJzIjoyLjAsImNob2tlX3RvIjoxNi4wLCJkZWxheV8xIjoyLjAsImRlbGF5XzIiOjIuMCwiZGVsYXlfMyI6Mi4wLCJkZWxheV80IjoyLjAsImRlbGF5XzUiOjIuMCwiZGVsYXlfNiI6Mi4wLCJkZWxheV83IjoyLjAsImRlbGF5XzgiOjIuMCwiZGVsYXlfY3VzdG9tX3NsaWRlcnMiOjIuMCwiZGVsYXlfZGVmYXVsdCI6Mi4wLCJkZWxheV9tZXRob2QiOjIuMCwiZGVsYXlfcmFuZG9tX21heCI6Ni4wLCJkZWxheV9yYW5kb21fbWluIjozLjAsImZyb21fbGltaXQiOjYwLjAsImppdHRlcmJ1dHRvbiI6dHJ1ZSwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfbW9kZSI6IkRlZmF1bHQiLCJtYXgiOjAuMCwibWF4aW11bV9saW1pdCI6NjAuMCwibWluIjowLjAsIm1pbmltdW1fbGltaXQiOjYwLjAsIm1vZGUiOiJTdGF0aWMiLCJtb2RlX3JhbmRvbSI6NC4wLCJtb2RlX3RpY2tzIjo0LjAsIm1vZGlmaWVyIjoiU3BpbiIsIm1vZGlmaWVyX2N1c3RvbV9zbGlkZXJzIjoyLjAsIm1vZGlmaWVyX21vZGUiOiJDdXN0b20iLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18xIjotMTAuMCwibW9kaWZpZXJfc2xpZGVyc18yIjo1LjAsIm1vZGlmaWVyX3NsaWRlcnNfMyI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc181IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNiI6MC4wLCJvZmZzZXQiOjAuMCwicmFuZG9tX2Nob2tlIjpmYWxzZSwicmFuZG9taXplIjp0cnVlLCJyaWdodF9saW1pdCI6NjAuMCwic2Jfc3BlZWQiOjIuMCwidG9fbGltaXQiOjYwLjAsInlhdyI6IjItV2F5IiwieWF3X2xlZnQiOi0xNy4wLCJ5YXdfcmlnaHQiOjQwLjB9fSwiQ3JvdWNoaW5nIjp7IkNUIjp7ImJvZHlfeWF3Ijp0cnVlLCJjaG9rZSI6IkN1c3RvbSIsImNob2tlMV8xIjo1LjAsImNob2tlMV8yIjoxMy4wLCJjaG9rZTFfMyI6MTIuMCwiY2hva2UxXzQiOjQuMCwiY2hva2UxXzUiOjE2LjAsImNob2tlMV82IjoyLjAsImNob2tlMV83IjoyLjAsImNob2tlMV84IjoyLjAsImNob2tlX2Zyb20iOjE2LjAsImNob2tlX21ldGhvZCI6IkN1c3RvbSIsImNob2tlX3NsaWRlciI6MTYuMCwiY2hva2Vfc2xpZGVycyI6NS4wLCJjaG9rZV90byI6MTYuMCwiZGVsYXlfMSI6Mi4wLCJkZWxheV8yIjoyLjAsImRlbGF5XzMiOjIuMCwiZGVsYXlfNCI6Mi4wLCJkZWxheV81IjoyLjAsImRlbGF5XzYiOjIuMCwiZGVsYXlfNyI6Mi4wLCJkZWxheV84IjoyLjAsImRlbGF5X2N1c3RvbV9zbGlkZXJzIjoyLjAsImRlbGF5X2RlZmF1bHQiOjIuMCwiZGVsYXlfbWV0aG9kIjoyLjAsImRlbGF5X3JhbmRvbV9tYXgiOjEwLjAsImRlbGF5X3JhbmRvbV9taW4iOjUuMCwiZnJvbV9saW1pdCI6NDIuMCwiaml0dGVyYnV0dG9uIjp0cnVlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9tb2RlIjoiVGljayBTd2FwIiwibWF4IjowLjAsIm1heGltdW1fbGltaXQiOjYwLjAsIm1pbiI6MC4wLCJtaW5pbXVtX2xpbWl0Ijo2MC4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6NC4wLCJtb2RpZmllciI6IlNwaW4iLCJtb2RpZmllcl9jdXN0b21fc2xpZGVycyI6NC4wLCJtb2RpZmllcl9tb2RlIjoiQ3VzdG9tIiwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMSI6LTkuMCwibW9kaWZpZXJfc2xpZGVyc18yIjotNC4wLCJtb2RpZmllcl9zbGlkZXJzXzMiOjIuMCwibW9kaWZpZXJfc2xpZGVyc180Ijo0LjAsIm1vZGlmaWVyX3NsaWRlcnNfNSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzYiOjAuMCwib2Zmc2V0IjowLjAsInJhbmRvbV9jaG9rZSI6dHJ1ZSwicmFuZG9taXplIjp0cnVlLCJyaWdodF9saW1pdCI6NjAuMCwic2Jfc3BlZWQiOjguMCwidG9fbGltaXQiOjYwLjAsInlhdyI6IjItV2F5IiwieWF3X2xlZnQiOi0yMi4wLCJ5YXdfcmlnaHQiOjQ0LjB9LCJUIjp7ImJvZHlfeWF3Ijp0cnVlLCJjaG9rZSI6IkN1c3RvbSIsImNob2tlMV8xIjo1LjAsImNob2tlMV8yIjoxMy4wLCJjaG9rZTFfMyI6MTIuMCwiY2hva2UxXzQiOjQuMCwiY2hva2UxXzUiOjE2LjAsImNob2tlMV82IjoyLjAsImNob2tlMV83IjoyLjAsImNob2tlMV84IjoyLjAsImNob2tlX2Zyb20iOjE2LjAsImNob2tlX21ldGhvZCI6IkN1c3RvbSIsImNob2tlX3NsaWRlciI6MTYuMCwiY2hva2Vfc2xpZGVycyI6NS4wLCJjaG9rZV90byI6MTYuMCwiZGVsYXlfMSI6Mi4wLCJkZWxheV8yIjoyLjAsImRlbGF5XzMiOjIuMCwiZGVsYXlfNCI6Mi4wLCJkZWxheV81IjoyLjAsImRlbGF5XzYiOjIuMCwiZGVsYXlfNyI6Mi4wLCJkZWxheV84IjoyLjAsImRlbGF5X2N1c3RvbV9zbGlkZXJzIjoyLjAsImRlbGF5X2RlZmF1bHQiOjIuMCwiZGVsYXlfbWV0aG9kIjoyLjAsImRlbGF5X3JhbmRvbV9tYXgiOjEwLjAsImRlbGF5X3JhbmRvbV9taW4iOjUuMCwiZnJvbV9saW1pdCI6NDIuMCwiaml0dGVyYnV0dG9uIjp0cnVlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9tb2RlIjoiVGljayBTd2FwIiwibWF4IjowLjAsIm1heGltdW1fbGltaXQiOjYwLjAsIm1pbiI6MC4wLCJtaW5pbXVtX2xpbWl0Ijo2MC4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6NC4wLCJtb2RpZmllciI6IlNwaW4iLCJtb2RpZmllcl9jdXN0b21fc2xpZGVycyI6NC4wLCJtb2RpZmllcl9tb2RlIjoiQ3VzdG9tIiwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMSI6LTkuMCwibW9kaWZpZXJfc2xpZGVyc18yIjotNC4wLCJtb2RpZmllcl9zbGlkZXJzXzMiOjIuMCwibW9kaWZpZXJfc2xpZGVyc180Ijo0LjAsIm1vZGlmaWVyX3NsaWRlcnNfNSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzYiOjAuMCwib2Zmc2V0IjowLjAsInJhbmRvbV9jaG9rZSI6dHJ1ZSwicmFuZG9taXplIjp0cnVlLCJyaWdodF9saW1pdCI6NjAuMCwic2Jfc3BlZWQiOjguMCwidG9fbGltaXQiOjYwLjAsInlhdyI6IjItV2F5IiwieWF3X2xlZnQiOi0yMi4wLCJ5YXdfcmlnaHQiOjQ0LjB9fSwiUnVubmluZyI6eyJDVCI6eyJib2R5X3lhdyI6dHJ1ZSwiY2hva2UiOiJEZWZhdWx0IiwiY2hva2UxXzEiOjIuMCwiY2hva2UxXzIiOjIuMCwiY2hva2UxXzMiOjIuMCwiY2hva2UxXzQiOjIuMCwiY2hva2UxXzUiOjIuMCwiY2hva2UxXzYiOjIuMCwiY2hva2UxXzciOjIuMCwiY2hva2UxXzgiOjIuMCwiY2hva2VfZnJvbSI6MTYuMCwiY2hva2VfbWV0aG9kIjoiRGVmYXVsdCIsImNob2tlX3NsaWRlciI6MTYuMCwiY2hva2Vfc2xpZGVycyI6Mi4wLCJjaG9rZV90byI6MTYuMCwiZGVsYXlfMSI6Mi4wLCJkZWxheV8yIjoyLjAsImRlbGF5XzMiOjIuMCwiZGVsYXlfNCI6Mi4wLCJkZWxheV81IjoyLjAsImRlbGF5XzYiOjIuMCwiZGVsYXlfNyI6Mi4wLCJkZWxheV84IjoyLjAsImRlbGF5X2N1c3RvbV9zbGlkZXJzIjoyLjAsImRlbGF5X2RlZmF1bHQiOjIuMCwiZGVsYXlfbWV0aG9kIjowLjAsImRlbGF5X3JhbmRvbV9tYXgiOjIuMCwiZGVsYXlfcmFuZG9tX21pbiI6Mi4wLCJmcm9tX2xpbWl0Ijo2MC4wLCJqaXR0ZXJidXR0b24iOnRydWUsImxlZnRfbGltaXQiOjYwLjAsImxpbWl0X21vZGUiOiJEZWZhdWx0IiwibWF4IjowLjAsIm1heGltdW1fbGltaXQiOjYwLjAsIm1pbiI6MC4wLCJtaW5pbXVtX2xpbWl0Ijo2MC4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6NC4wLCJtb2RpZmllciI6IkRpc2FibGVkIiwibW9kaWZpZXJfY3VzdG9tX3NsaWRlcnMiOjIuMCwibW9kaWZpZXJfbW9kZSI6IkRlZmF1bHQiLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18xIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMiI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzMiOjAuMCwibW9kaWZpZXJfc2xpZGVyc180IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzYiOjAuMCwib2Zmc2V0IjowLjAsInJhbmRvbV9jaG9rZSI6ZmFsc2UsInJhbmRvbWl6ZSI6ZmFsc2UsInJpZ2h0X2xpbWl0Ijo2MC4wLCJzYl9zcGVlZCI6Mi4wLCJ0b19saW1pdCI6NjAuMCwieWF3IjoiMi1XYXkiLCJ5YXdfbGVmdCI6LTE5LjAsInlhd19yaWdodCI6MzkuMH0sIlQiOnsiYm9keV95YXciOnRydWUsImNob2tlIjoiRGVmYXVsdCIsImNob2tlMV8xIjoyLjAsImNob2tlMV8yIjoyLjAsImNob2tlMV8zIjoyLjAsImNob2tlMV80IjoyLjAsImNob2tlMV81IjoyLjAsImNob2tlMV82IjoyLjAsImNob2tlMV83IjoyLjAsImNob2tlMV84IjoyLjAsImNob2tlX2Zyb20iOjE2LjAsImNob2tlX21ldGhvZCI6IkRlZmF1bHQiLCJjaG9rZV9zbGlkZXIiOjE2LjAsImNob2tlX3NsaWRlcnMiOjIuMCwiY2hva2VfdG8iOjE2LjAsImRlbGF5XzEiOjIuMCwiZGVsYXlfMiI6Mi4wLCJkZWxheV8zIjoyLjAsImRlbGF5XzQiOjIuMCwiZGVsYXlfNSI6Mi4wLCJkZWxheV82IjoyLjAsImRlbGF5XzciOjIuMCwiZGVsYXlfOCI6Mi4wLCJkZWxheV9jdXN0b21fc2xpZGVycyI6Mi4wLCJkZWxheV9kZWZhdWx0IjoyLjAsImRlbGF5X21ldGhvZCI6MC4wLCJkZWxheV9yYW5kb21fbWF4IjoyLjAsImRlbGF5X3JhbmRvbV9taW4iOjIuMCwiZnJvbV9saW1pdCI6NjAuMCwiaml0dGVyYnV0dG9uIjp0cnVlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9tb2RlIjoiRGVmYXVsdCIsIm1heCI6MC4wLCJtYXhpbXVtX2xpbWl0Ijo2MC4wLCJtaW4iOjAuMCwibWluaW11bV9saW1pdCI6NjAuMCwibW9kZSI6IlN0YXRpYyIsIm1vZGVfcmFuZG9tIjo0LjAsIm1vZGVfdGlja3MiOjQuMCwibW9kaWZpZXIiOiJEaXNhYmxlZCIsIm1vZGlmaWVyX2N1c3RvbV9zbGlkZXJzIjoyLjAsIm1vZGlmaWVyX21vZGUiOiJEZWZhdWx0IiwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzIiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18zIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNCI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzUiOjAuMCwibW9kaWZpZXJfc2xpZGVyc182IjowLjAsIm9mZnNldCI6MC4wLCJyYW5kb21fY2hva2UiOmZhbHNlLCJyYW5kb21pemUiOmZhbHNlLCJyaWdodF9saW1pdCI6NjAuMCwic2Jfc3BlZWQiOjIuMCwidG9fbGltaXQiOjYwLjAsInlhdyI6IjItV2F5IiwieWF3X2xlZnQiOi0xOS4wLCJ5YXdfcmlnaHQiOjM5LjB9fSwiU2xvd3dhbGtpbmciOnsiQ1QiOnsiYm9keV95YXciOnRydWUsImNob2tlIjoiQ3VzdG9tIiwiY2hva2UxXzEiOjIuMCwiY2hva2UxXzIiOjIuMCwiY2hva2UxXzMiOjIuMCwiY2hva2UxXzQiOjIuMCwiY2hva2UxXzUiOjIuMCwiY2hva2UxXzYiOjIuMCwiY2hva2UxXzciOjIuMCwiY2hva2UxXzgiOjIuMCwiY2hva2VfZnJvbSI6MTEuMCwiY2hva2VfbWV0aG9kIjoiQ3VzdG9tIiwiY2hva2Vfc2xpZGVyIjoxNi4wLCJjaG9rZV9zbGlkZXJzIjoyLjAsImNob2tlX3RvIjoxNi4wLCJkZWxheV8xIjoyLjAsImRlbGF5XzIiOjIuMCwiZGVsYXlfMyI6Mi4wLCJkZWxheV80IjoyLjAsImRlbGF5XzUiOjIuMCwiZGVsYXlfNiI6Mi4wLCJkZWxheV83IjoyLjAsImRlbGF5XzgiOjIuMCwiZGVsYXlfY3VzdG9tX3NsaWRlcnMiOjIuMCwiZGVsYXlfZGVmYXVsdCI6NS4wLCJkZWxheV9tZXRob2QiOjIuMCwiZGVsYXlfcmFuZG9tX21heCI6OS4wLCJkZWxheV9yYW5kb21fbWluIjoxMi4wLCJmcm9tX2xpbWl0IjozOS4wLCJqaXR0ZXJidXR0b24iOnRydWUsImxlZnRfbGltaXQiOjYwLjAsImxpbWl0X21vZGUiOiJUaWNrIFN3YXAiLCJtYXgiOjYuMCwibWF4aW11bV9saW1pdCI6MjYuMCwibWluIjotMTIuMCwibWluaW11bV9saW1pdCI6MjIuMCwibW9kZSI6IlN0YXRpYyIsIm1vZGVfcmFuZG9tIjoxNS4wLCJtb2RlX3RpY2tzIjo1LjAsIm1vZGlmaWVyIjoiU3BpbiIsIm1vZGlmaWVyX2N1c3RvbV9zbGlkZXJzIjo1LjAsIm1vZGlmaWVyX21vZGUiOiJEZWZhdWx0IiwibW9kaWZpZXJfb2Zmc2V0IjotMTAuMCwibW9kaWZpZXJfc2xpZGVyc18xIjo0OS4wLCJtb2RpZmllcl9zbGlkZXJzXzIiOi0yNy4wLCJtb2RpZmllcl9zbGlkZXJzXzMiOjExLjAsIm1vZGlmaWVyX3NsaWRlcnNfNCI6MjcuMCwibW9kaWZpZXJfc2xpZGVyc181IjotNjAuMCwibW9kaWZpZXJfc2xpZGVyc182IjowLjAsIm9mZnNldCI6MC4wLCJyYW5kb21fY2hva2UiOnRydWUsInJhbmRvbWl6ZSI6ZmFsc2UsInJpZ2h0X2xpbWl0Ijo2MC4wLCJzYl9zcGVlZCI6NS4wLCJ0b19saW1pdCI6NjAuMCwieWF3IjoiMi1XYXkiLCJ5YXdfbGVmdCI6LTI3LjAsInlhd19yaWdodCI6NDAuMH0sIlQiOnsiYm9keV95YXciOnRydWUsImNob2tlIjoiQ3VzdG9tIiwiY2hva2UxXzEiOjIuMCwiY2hva2UxXzIiOjIuMCwiY2hva2UxXzMiOjIuMCwiY2hva2UxXzQiOjIuMCwiY2hva2UxXzUiOjIuMCwiY2hva2UxXzYiOjIuMCwiY2hva2UxXzciOjIuMCwiY2hva2UxXzgiOjIuMCwiY2hva2VfZnJvbSI6MTEuMCwiY2hva2VfbWV0aG9kIjoiQ3VzdG9tIiwiY2hva2Vfc2xpZGVyIjoxNi4wLCJjaG9rZV9zbGlkZXJzIjoyLjAsImNob2tlX3RvIjoxNi4wLCJkZWxheV8xIjoyLjAsImRlbGF5XzIiOjIuMCwiZGVsYXlfMyI6Mi4wLCJkZWxheV80IjoyLjAsImRlbGF5XzUiOjIuMCwiZGVsYXlfNiI6Mi4wLCJkZWxheV83IjoyLjAsImRlbGF5XzgiOjIuMCwiZGVsYXlfY3VzdG9tX3NsaWRlcnMiOjIuMCwiZGVsYXlfZGVmYXVsdCI6NS4wLCJkZWxheV9tZXRob2QiOjIuMCwiZGVsYXlfcmFuZG9tX21heCI6OS4wLCJkZWxheV9yYW5kb21fbWluIjoxMi4wLCJmcm9tX2xpbWl0IjozOS4wLCJqaXR0ZXJidXR0b24iOnRydWUsImxlZnRfbGltaXQiOjYwLjAsImxpbWl0X21vZGUiOiJUaWNrIFN3YXAiLCJtYXgiOjYuMCwibWF4aW11bV9saW1pdCI6MjYuMCwibWluIjotMTIuMCwibWluaW11bV9saW1pdCI6MjIuMCwibW9kZSI6IlN0YXRpYyIsIm1vZGVfcmFuZG9tIjoxNS4wLCJtb2RlX3RpY2tzIjo1LjAsIm1vZGlmaWVyIjoiU3BpbiIsIm1vZGlmaWVyX2N1c3RvbV9zbGlkZXJzIjo1LjAsIm1vZGlmaWVyX21vZGUiOiJEZWZhdWx0IiwibW9kaWZpZXJfb2Zmc2V0IjotMTAuMCwibW9kaWZpZXJfc2xpZGVyc18xIjo0OS4wLCJtb2RpZmllcl9zbGlkZXJzXzIiOi0yNy4wLCJtb2RpZmllcl9zbGlkZXJzXzMiOjExLjAsIm1vZGlmaWVyX3NsaWRlcnNfNCI6MjcuMCwibW9kaWZpZXJfc2xpZGVyc181IjotNjAuMCwibW9kaWZpZXJfc2xpZGVyc182IjowLjAsIm9mZnNldCI6MC4wLCJyYW5kb21fY2hva2UiOnRydWUsInJhbmRvbWl6ZSI6ZmFsc2UsInJpZ2h0X2xpbWl0Ijo2MC4wLCJzYl9zcGVlZCI6NS4wLCJ0b19saW1pdCI6NjAuMCwieWF3IjoiMi1XYXkiLCJ5YXdfbGVmdCI6LTI3LjAsInlhd19yaWdodCI6NDAuMH19LCJTbmVha2luZyI6eyJDVCI6eyJib2R5X3lhdyI6dHJ1ZSwiY2hva2UiOiJDdXN0b20iLCJjaG9rZTFfMSI6NC4wLCJjaG9rZTFfMiI6MTAuMCwiY2hva2UxXzMiOjQuMCwiY2hva2UxXzQiOjEyLjAsImNob2tlMV81IjoyLjAsImNob2tlMV82IjoyLjAsImNob2tlMV83IjoyLjAsImNob2tlMV84IjoyLjAsImNob2tlX2Zyb20iOjE2LjAsImNob2tlX21ldGhvZCI6IkN1c3RvbSIsImNob2tlX3NsaWRlciI6MTYuMCwiY2hva2Vfc2xpZGVycyI6NS4wLCJjaG9rZV90byI6MTYuMCwiZGVsYXlfMSI6Mi4wLCJkZWxheV8yIjoyLjAsImRlbGF5XzMiOjIuMCwiZGVsYXlfNCI6Mi4wLCJkZWxheV81IjoyLjAsImRlbGF5XzYiOjIuMCwiZGVsYXlfNyI6Mi4wLCJkZWxheV84IjoyLjAsImRlbGF5X2N1c3RvbV9zbGlkZXJzIjoyLjAsImRlbGF5X2RlZmF1bHQiOjIuMCwiZGVsYXlfbWV0aG9kIjoyLjAsImRlbGF5X3JhbmRvbV9tYXgiOjYuMCwiZGVsYXlfcmFuZG9tX21pbiI6NC4wLCJmcm9tX2xpbWl0Ijo2MC4wLCJqaXR0ZXJidXR0b24iOnRydWUsImxlZnRfbGltaXQiOjYwLjAsImxpbWl0X21vZGUiOiJEZWZhdWx0IiwibWF4IjowLjAsIm1heGltdW1fbGltaXQiOjYwLjAsIm1pbiI6MC4wLCJtaW5pbXVtX2xpbWl0Ijo2MC4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6NC4wLCJtb2RpZmllciI6IlNwaW4iLCJtb2RpZmllcl9jdXN0b21fc2xpZGVycyI6My4wLCJtb2RpZmllcl9tb2RlIjoiQ3VzdG9tIiwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMSI6LTExLjAsIm1vZGlmaWVyX3NsaWRlcnNfMiI6OC4wLCJtb2RpZmllcl9zbGlkZXJzXzMiOi03LjAsIm1vZGlmaWVyX3NsaWRlcnNfNCI6MTAuMCwibW9kaWZpZXJfc2xpZGVyc181IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNiI6MC4wLCJvZmZzZXQiOjAuMCwicmFuZG9tX2Nob2tlIjp0cnVlLCJyYW5kb21pemUiOnRydWUsInJpZ2h0X2xpbWl0Ijo2MC4wLCJzYl9zcGVlZCI6Mi4wLCJ0b19saW1pdCI6NjAuMCwieWF3IjoiMi1XYXkiLCJ5YXdfbGVmdCI6LTE1LjAsInlhd19yaWdodCI6NDEuMH0sIlQiOnsiYm9keV95YXciOnRydWUsImNob2tlIjoiQ3VzdG9tIiwiY2hva2UxXzEiOjQuMCwiY2hva2UxXzIiOjEwLjAsImNob2tlMV8zIjo0LjAsImNob2tlMV80IjoxMi4wLCJjaG9rZTFfNSI6Mi4wLCJjaG9rZTFfNiI6Mi4wLCJjaG9rZTFfNyI6Mi4wLCJjaG9rZTFfOCI6Mi4wLCJjaG9rZV9mcm9tIjoxNi4wLCJjaG9rZV9tZXRob2QiOiJDdXN0b20iLCJjaG9rZV9zbGlkZXIiOjE2LjAsImNob2tlX3NsaWRlcnMiOjUuMCwiY2hva2VfdG8iOjE2LjAsImRlbGF5XzEiOjIuMCwiZGVsYXlfMiI6Mi4wLCJkZWxheV8zIjoyLjAsImRlbGF5XzQiOjIuMCwiZGVsYXlfNSI6Mi4wLCJkZWxheV82IjoyLjAsImRlbGF5XzciOjIuMCwiZGVsYXlfOCI6Mi4wLCJkZWxheV9jdXN0b21fc2xpZGVycyI6Mi4wLCJkZWxheV9kZWZhdWx0IjoyLjAsImRlbGF5X21ldGhvZCI6Mi4wLCJkZWxheV9yYW5kb21fbWF4Ijo2LjAsImRlbGF5X3JhbmRvbV9taW4iOjQuMCwiZnJvbV9saW1pdCI6NjAuMCwiaml0dGVyYnV0dG9uIjp0cnVlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9tb2RlIjoiRGVmYXVsdCIsIm1heCI6MC4wLCJtYXhpbXVtX2xpbWl0Ijo2MC4wLCJtaW4iOjAuMCwibWluaW11bV9saW1pdCI6NjAuMCwibW9kZSI6IlN0YXRpYyIsIm1vZGVfcmFuZG9tIjo0LjAsIm1vZGVfdGlja3MiOjQuMCwibW9kaWZpZXIiOiJTcGluIiwibW9kaWZpZXJfY3VzdG9tX3NsaWRlcnMiOjMuMCwibW9kaWZpZXJfbW9kZSI6IkN1c3RvbSIsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzEiOi0xMS4wLCJtb2RpZmllcl9zbGlkZXJzXzIiOjguMCwibW9kaWZpZXJfc2xpZGVyc18zIjotNy4wLCJtb2RpZmllcl9zbGlkZXJzXzQiOjEwLjAsIm1vZGlmaWVyX3NsaWRlcnNfNSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzYiOjAuMCwib2Zmc2V0IjowLjAsInJhbmRvbV9jaG9rZSI6dHJ1ZSwicmFuZG9taXplIjp0cnVlLCJyaWdodF9saW1pdCI6NjAuMCwic2Jfc3BlZWQiOjIuMCwidG9fbGltaXQiOjYwLjAsInlhdyI6IjItV2F5IiwieWF3X2xlZnQiOi0xNS4wLCJ5YXdfcmlnaHQiOjQxLjB9fSwiU3RhbmRpbmciOnsiQ1QiOnsiYm9keV95YXciOnRydWUsImNob2tlIjoiRGVmYXVsdCIsImNob2tlMV8xIjoyLjAsImNob2tlMV8yIjoyLjAsImNob2tlMV8zIjoyLjAsImNob2tlMV80IjoyLjAsImNob2tlMV81IjoyLjAsImNob2tlMV82IjoyLjAsImNob2tlMV83IjoyLjAsImNob2tlMV84IjoyLjAsImNob2tlX2Zyb20iOjE2LjAsImNob2tlX21ldGhvZCI6IkRlZmF1bHQiLCJjaG9rZV9zbGlkZXIiOjE2LjAsImNob2tlX3NsaWRlcnMiOjIuMCwiY2hva2VfdG8iOjE2LjAsImRlbGF5XzEiOjIuMCwiZGVsYXlfMiI6Mi4wLCJkZWxheV8zIjoyLjAsImRlbGF5XzQiOjIuMCwiZGVsYXlfNSI6Mi4wLCJkZWxheV82IjoyLjAsImRlbGF5XzciOjIuMCwiZGVsYXlfOCI6Mi4wLCJkZWxheV9jdXN0b21fc2xpZGVycyI6Mi4wLCJkZWxheV9kZWZhdWx0IjoyLjAsImRlbGF5X21ldGhvZCI6Mi4wLCJkZWxheV9yYW5kb21fbWF4Ijo1LjAsImRlbGF5X3JhbmRvbV9taW4iOjIuMCwiZnJvbV9saW1pdCI6NjAuMCwiaml0dGVyYnV0dG9uIjp0cnVlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9tb2RlIjoiUmFuZG9tIiwibWF4IjowLjAsIm1heGltdW1fbGltaXQiOjYwLjAsIm1pbiI6MC4wLCJtaW5pbXVtX2xpbWl0Ijo1MC4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6NC4wLCJtb2RpZmllciI6IkRpc2FibGVkIiwibW9kaWZpZXJfY3VzdG9tX3NsaWRlcnMiOjIuMCwibW9kaWZpZXJfbW9kZSI6IkRlZmF1bHQiLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18xIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMiI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzMiOjAuMCwibW9kaWZpZXJfc2xpZGVyc180IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzYiOjAuMCwib2Zmc2V0IjowLjAsInJhbmRvbV9jaG9rZSI6ZmFsc2UsInJhbmRvbWl6ZSI6ZmFsc2UsInJpZ2h0X2xpbWl0Ijo2MC4wLCJzYl9zcGVlZCI6Mi4wLCJ0b19saW1pdCI6NjAuMCwieWF3IjoiMi1XYXkiLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmlnaHQiOjAuMH0sIlQiOnsiYm9keV95YXciOnRydWUsImNob2tlIjoiRGVmYXVsdCIsImNob2tlMV8xIjoyLjAsImNob2tlMV8yIjoyLjAsImNob2tlMV8zIjoyLjAsImNob2tlMV80IjoyLjAsImNob2tlMV81IjoyLjAsImNob2tlMV82IjoyLjAsImNob2tlMV83IjoyLjAsImNob2tlMV84IjoyLjAsImNob2tlX2Zyb20iOjE2LjAsImNob2tlX21ldGhvZCI6IkRlZmF1bHQiLCJjaG9rZV9zbGlkZXIiOjE2LjAsImNob2tlX3NsaWRlcnMiOjIuMCwiY2hva2VfdG8iOjE2LjAsImRlbGF5XzEiOjIuMCwiZGVsYXlfMiI6Mi4wLCJkZWxheV8zIjoyLjAsImRlbGF5XzQiOjIuMCwiZGVsYXlfNSI6Mi4wLCJkZWxheV82IjoyLjAsImRlbGF5XzciOjIuMCwiZGVsYXlfOCI6Mi4wLCJkZWxheV9jdXN0b21fc2xpZGVycyI6Mi4wLCJkZWxheV9kZWZhdWx0IjoyLjAsImRlbGF5X21ldGhvZCI6Mi4wLCJkZWxheV9yYW5kb21fbWF4Ijo1LjAsImRlbGF5X3JhbmRvbV9taW4iOjIuMCwiZnJvbV9saW1pdCI6NjAuMCwiaml0dGVyYnV0dG9uIjp0cnVlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9tb2RlIjoiUmFuZG9tIiwibWF4IjowLjAsIm1heGltdW1fbGltaXQiOjYwLjAsIm1pbiI6MC4wLCJtaW5pbXVtX2xpbWl0Ijo1MC4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6NC4wLCJtb2RpZmllciI6IkRpc2FibGVkIiwibW9kaWZpZXJfY3VzdG9tX3NsaWRlcnMiOjIuMCwibW9kaWZpZXJfbW9kZSI6IkRlZmF1bHQiLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18xIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMiI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzMiOjAuMCwibW9kaWZpZXJfc2xpZGVyc180IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzYiOjAuMCwib2Zmc2V0IjowLjAsInJhbmRvbV9jaG9rZSI6ZmFsc2UsInJhbmRvbWl6ZSI6ZmFsc2UsInJpZ2h0X2xpbWl0Ijo2MC4wLCJzYl9zcGVlZCI6Mi4wLCJ0b19saW1pdCI6NjAuMCwieWF3IjoiMi1XYXkiLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmlnaHQiOjAuMH19fX0sIm1haW4iOnsiY29uZiI6eyJzdGF0ZSI6IlN0YW5kaW5nIiwidGVhbSI6MS4wfSwiZXh0cmEiOnsiYWRkb25fYWEiOnsiZnJlZXN0YW5kaW5nIjp7ImRpc2FibGVycyI6WyJ+Il0sInByZWZlcl9tYW51YWwiOnRydWUsInN3aXRjaCI6ZmFsc2UsInlhd19tb2QiOmZhbHNlfSwibWFudWFscyI6eyJpbnZlcnRlciI6ZmFsc2UsInNpZGUiOiJEaXNhYmxlZCIsInN0YXRpYyI6ZmFsc2V9fSwiYW5pbWZpeCI6eyJmYWxsaW5nIjp7InZhbHVlIjoxMDAuMH0sImludGVycG9sYXRpbmciOnsidmFsdWUiOjE0LjB9LCJqaXR0ZXJfbGVncyI6eyJzd2l0Y2giOnRydWV9LCJsZWFuaW5nIjp7InZhbHVlIjoxMDAuMH0sInNlbGVjdCI6WyJMZWFuaW5nIiwifiJdfSwiYXZvaWRfYmFja3N0YWIiOnsic3dpdGNoIjp0cnVlfSwic2FmZV9oZWFkIjp7ImhpZ2hfc2xpZGVyIjoyMDAuMCwic3RhdGVzIjpbIlpldXMgeDI3IiwiS25pZmUiLCJ+Il0sInN3aXRjaCI6dHJ1ZX0sIndhcm11cF9hYSI6eyJtb2RlIjpbIldhcm11cCIsIk5vIEVuZW1pZXMiLCJ+Il0sInBpdGNoIjoiRGlzYWJsZWQiLCJyYW5nZSI6MzYwLjAsInNwZWVkIjozLjAsInlhdyI6IlNwaW4ifX19fSwiaW5mbyI6eyJwcmVzZXRzIjp7Imxpc3QiOjcuMCwibmFtZSI6ImFkdmFuY2VkIHJlYWwifSwid2F0ZXJtYXJrIjp7ImZvbnQiOiJCb2xkIiwiZ3JhZGllbnRfY29sb3IiOlsiU2Vjb25kIiwiIzg1OTVBQUZGIiwifiJdLCJtb2RlIjpbIkVuY29kaW5nIiwifiJdLCJtb2RlX2NvbG9yIjoxLjAsInBvcyI6IlJpZ2h0Iiwic3RhdGljX2NvbG9yIjoiI0ZGRkZGRkZGIiwidGV4dCI6IkdPRFNFTlNFIERFViJ9fSwibWlzYyI6eyJhaW1ib3QiOnsiZmFrZWR1Y2siOnsiZnJlZXplX3BlcmlvZCI6dHJ1ZSwidW5sb2NrIjp0cnVlfSwibGF0ZW5jeSI6eyJzd2l0Y2giOnRydWV9LCJsb2dnaW5nIjp7ImNvbG9ycyI6eyJtYWluIjoiI0Q2Q0NFMkZGIiwicHJlZml4IjoiI0ZGRkZGRkZGIn0sImNzdG1faW5wdXQiOnsiaW5wdXQiOiIifSwibW9kZSI6eyJzZWxlY3QiOlsiUHVyY2hhc2VzIEV2ZW50cyIsIlJhZ2Vib3QgRXZlbnRzIiwifiJdfSwic3dpdGNoIjp0cnVlfX0sIm1vdmVtZW50Ijp7ImVkZ2VfcXVpY2tfc3RvcCI6ZmFsc2UsImZhc3RfbGFkZGVyIjp0cnVlLCJub19mYWxsX2RhbWFnZSI6dHJ1ZX0sInZpc3VhbHMiOnsiYXNwZWN0X3JhdGlvIjp7InN3aXRjaCI6dHJ1ZSwidmFsdWUiOjEyOC4wfSwiZG1nX2luZGljYXRvciI6eyJtb2RlIjoiRGVmYXVsdCIsInN3aXRjaCI6dHJ1ZX0sImhpdG1hcmtlciI6eyJjb2xvciI6IiNGRkZGRkY4QyIsImNvbG9yMiI6IiNGRkZGRkZGRiIsInNlbGVjdCI6WyIyRCIsIjNEIiwifiJdLCJ0aW1lIjo1LjAsInRpbWUyIjoxNS4wfSwibWFudWFsX2Fycm93cyI6eyJjb2xvciI6IiNGMEI5QzlGRiIsImZvbnQiOiJEZWZhdWx0Iiwib2Zmc2V0IjoyNS4wLCJzd2l0Y2giOnRydWUsInN5bWJvbHMiOnsiZm9yd2FyZCI6Il4iLCJsZWZ0IjoiPCIsInJpZ2h0IjoiPiJ9fSwicGxheWVyX3RyYW5zcGFyZW5jeSI6eyJzd2l0Y2giOnRydWV9LCJyZW1vdmVfc2xlZXZlcyI6eyJzd2l0Y2giOnRydWV9LCJzY29wZV9vdmVybGF5Ijp7ImNvbG9ycyI6eyJlZGdlIjoiIzAwMDAwMDMyIiwibWFpbiI6IiNGRkZGRkY2QSJ9LCJnYXAiOjguMCwibGVuZ3RoIjo4NS4wLCJvcHRpb25zIjpbIkludmVydGVkIiwifiJdLCJzd2l0Y2giOnRydWV9LCJ2aWV3bW9kZWxfY2hhbmdlciI6eyJmb3YiOjY2LjAsInN3aXRjaCI6dHJ1ZSwieCI6LTE0LjAsInkiOi0xNi4wLCJ6IjoyLjB9fX19LCJ3YXRlcm1hcmtfcG9zaXRpb24iOnsicG9zIjoiUmlnaHQiLCJ4IjoxMzY2LjAsInkiOjk2NC4wfX0=";
        end;
        if not v160.database[v160.system_presets[2]] or #v160.database == 0 then
            v160.database[v160.system_presets[2]] = "eyJhdXRob3IiOiJTcXYxazIyOCIsImNvbmZpZyI6eyJhbnRpYWltIjp7ImFuZ2xlcyI6eyJicmVha19sYyI6eyJkaXNhYmxlX29uX2dyZW5hZGUiOnRydWUsImhpZGVfc2hvdHMiOiJGYXZvciBGaXJlIFJhdGUiLCJzZWxlY3QiOlsiQ3JvdWNoaW5nIiwiU25lYWtpbmciLCJBaXIgQ3JvdWNoaW5nIiwifiJdfSwiYnVpbGRlciI6eyJBaXIiOnsiQ1QiOnsiYm9keV95YXciOnRydWUsImNob2tlIjoiRGVmYXVsdCIsImNob2tlMV8xIjoyLjAsImNob2tlMV8yIjoyLjAsImNob2tlMV8zIjoyLjAsImNob2tlMV80IjoyLjAsImNob2tlMV81IjoyLjAsImNob2tlMV82IjoyLjAsImNob2tlMV83IjoyLjAsImNob2tlMV84IjoyLjAsImNob2tlX2Zyb20iOjE2LjAsImNob2tlX21ldGhvZCI6IkRlZmF1bHQiLCJjaG9rZV9zbGlkZXIiOjE2LjAsImNob2tlX3NsaWRlcnMiOjIuMCwiY2hva2VfdG8iOjE2LjAsImRlbGF5XzEiOjIuMCwiZGVsYXlfMiI6Mi4wLCJkZWxheV8zIjoyLjAsImRlbGF5XzQiOjIuMCwiZGVsYXlfNSI6Mi4wLCJkZWxheV82IjoyLjAsImRlbGF5XzciOjIuMCwiZGVsYXlfOCI6Mi4wLCJkZWxheV9jdXN0b21fc2xpZGVycyI6Mi4wLCJkZWxheV9kZWZhdWx0IjoyLjAsImRlbGF5X21ldGhvZCI6MC4wLCJkZWxheV9yYW5kb21fbWF4IjoyLjAsImRlbGF5X3JhbmRvbV9taW4iOjIuMCwiZnJvbV9saW1pdCI6NjAuMCwiaml0dGVyYnV0dG9uIjp0cnVlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9tb2RlIjoiRGVmYXVsdCIsIm1heCI6MC4wLCJtYXhpbXVtX2xpbWl0Ijo2MC4wLCJtaW4iOjAuMCwibWluaW11bV9saW1pdCI6NjAuMCwibW9kZSI6IlN0YXRpYyIsIm1vZGVfcmFuZG9tIjo0LjAsIm1vZGVfdGlja3MiOjQuMCwibW9kaWZpZXIiOiJEaXNhYmxlZCIsIm1vZGlmaWVyX2N1c3RvbV9zbGlkZXJzIjoyLjAsIm1vZGlmaWVyX21vZGUiOiJEZWZhdWx0IiwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzIiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18zIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNCI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzUiOjAuMCwibW9kaWZpZXJfc2xpZGVyc182IjowLjAsIm9mZnNldCI6MC4wLCJyYW5kb21fY2hva2UiOmZhbHNlLCJyYW5kb21pemUiOmZhbHNlLCJyaWdodF9saW1pdCI6NjAuMCwic2Jfc3BlZWQiOjIuMCwidG9fbGltaXQiOjYwLjAsInlhdyI6IjEtV2F5IiwieWF3X2xlZnQiOjAuMCwieWF3X3JpZ2h0IjowLjB9LCJUIjp7ImJvZHlfeWF3Ijp0cnVlLCJjaG9rZSI6IkRlZmF1bHQiLCJjaG9rZTFfMSI6Mi4wLCJjaG9rZTFfMiI6Mi4wLCJjaG9rZTFfMyI6Mi4wLCJjaG9rZTFfNCI6Mi4wLCJjaG9rZTFfNSI6Mi4wLCJjaG9rZTFfNiI6Mi4wLCJjaG9rZTFfNyI6Mi4wLCJjaG9rZTFfOCI6Mi4wLCJjaG9rZV9mcm9tIjoxNi4wLCJjaG9rZV9tZXRob2QiOiJEZWZhdWx0IiwiY2hva2Vfc2xpZGVyIjoxNi4wLCJjaG9rZV9zbGlkZXJzIjoyLjAsImNob2tlX3RvIjoxNi4wLCJkZWxheV8xIjoyLjAsImRlbGF5XzIiOjIuMCwiZGVsYXlfMyI6Mi4wLCJkZWxheV80IjoyLjAsImRlbGF5XzUiOjIuMCwiZGVsYXlfNiI6Mi4wLCJkZWxheV83IjoyLjAsImRlbGF5XzgiOjIuMCwiZGVsYXlfY3VzdG9tX3NsaWRlcnMiOjIuMCwiZGVsYXlfZGVmYXVsdCI6Mi4wLCJkZWxheV9tZXRob2QiOjAuMCwiZGVsYXlfcmFuZG9tX21heCI6Mi4wLCJkZWxheV9yYW5kb21fbWluIjoyLjAsImZyb21fbGltaXQiOjYwLjAsImppdHRlcmJ1dHRvbiI6dHJ1ZSwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfbW9kZSI6IkRlZmF1bHQiLCJtYXgiOjAuMCwibWF4aW11bV9saW1pdCI6NjAuMCwibWluIjowLjAsIm1pbmltdW1fbGltaXQiOjYwLjAsIm1vZGUiOiJTdGF0aWMiLCJtb2RlX3JhbmRvbSI6NC4wLCJtb2RlX3RpY2tzIjo0LjAsIm1vZGlmaWVyIjoiRGlzYWJsZWQiLCJtb2RpZmllcl9jdXN0b21fc2xpZGVycyI6Mi4wLCJtb2RpZmllcl9tb2RlIjoiRGVmYXVsdCIsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzEiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18yIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMyI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc181IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNiI6MC4wLCJvZmZzZXQiOjAuMCwicmFuZG9tX2Nob2tlIjpmYWxzZSwicmFuZG9taXplIjpmYWxzZSwicmlnaHRfbGltaXQiOjYwLjAsInNiX3NwZWVkIjoyLjAsInRvX2xpbWl0Ijo2MC4wLCJ5YXciOiIxLVdheSIsInlhd19sZWZ0IjowLjAsInlhd19yaWdodCI6MC4wfX0sIkFpciBDcm91Y2hpbmciOnsiQ1QiOnsiYm9keV95YXciOnRydWUsImNob2tlIjoiRGVmYXVsdCIsImNob2tlMV8xIjoyLjAsImNob2tlMV8yIjoyLjAsImNob2tlMV8zIjoyLjAsImNob2tlMV80IjoyLjAsImNob2tlMV81IjoyLjAsImNob2tlMV82IjoyLjAsImNob2tlMV83IjoyLjAsImNob2tlMV84IjoyLjAsImNob2tlX2Zyb20iOjE2LjAsImNob2tlX21ldGhvZCI6IkRlZmF1bHQiLCJjaG9rZV9zbGlkZXIiOjE2LjAsImNob2tlX3NsaWRlcnMiOjIuMCwiY2hva2VfdG8iOjE2LjAsImRlbGF5XzEiOjIuMCwiZGVsYXlfMiI6Mi4wLCJkZWxheV8zIjoyLjAsImRlbGF5XzQiOjIuMCwiZGVsYXlfNSI6Mi4wLCJkZWxheV82IjoyLjAsImRlbGF5XzciOjIuMCwiZGVsYXlfOCI6Mi4wLCJkZWxheV9jdXN0b21fc2xpZGVycyI6Mi4wLCJkZWxheV9kZWZhdWx0IjoyLjAsImRlbGF5X21ldGhvZCI6MC4wLCJkZWxheV9yYW5kb21fbWF4IjoyLjAsImRlbGF5X3JhbmRvbV9taW4iOjIuMCwiZnJvbV9saW1pdCI6MzQuMCwiaml0dGVyYnV0dG9uIjp0cnVlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9tb2RlIjoiVGljayBTd2FwIiwibWF4IjowLjAsIm1heGltdW1fbGltaXQiOjYwLjAsIm1pbiI6MC4wLCJtaW5pbXVtX2xpbWl0Ijo0Ni4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6NC4wLCJtb2RpZmllciI6IkNlbnRlciIsIm1vZGlmaWVyX2N1c3RvbV9zbGlkZXJzIjoyLjAsIm1vZGlmaWVyX21vZGUiOiJEZWZhdWx0IiwibW9kaWZpZXJfb2Zmc2V0IjotMTMuMCwibW9kaWZpZXJfc2xpZGVyc18xIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMiI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzMiOjAuMCwibW9kaWZpZXJfc2xpZGVyc180IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzYiOjAuMCwib2Zmc2V0IjowLjAsInJhbmRvbV9jaG9rZSI6ZmFsc2UsInJhbmRvbWl6ZSI6ZmFsc2UsInJpZ2h0X2xpbWl0Ijo2MC4wLCJzYl9zcGVlZCI6NC4wLCJ0b19saW1pdCI6NTIuMCwieWF3IjoiMi1XYXkiLCJ5YXdfbGVmdCI6LTE0LjAsInlhd19yaWdodCI6MjguMH0sIlQiOnsiYm9keV95YXciOnRydWUsImNob2tlIjoiRGVmYXVsdCIsImNob2tlMV8xIjoyLjAsImNob2tlMV8yIjoyLjAsImNob2tlMV8zIjoyLjAsImNob2tlMV80IjoyLjAsImNob2tlMV81IjoyLjAsImNob2tlMV82IjoyLjAsImNob2tlMV83IjoyLjAsImNob2tlMV84IjoyLjAsImNob2tlX2Zyb20iOjE2LjAsImNob2tlX21ldGhvZCI6IkRlZmF1bHQiLCJjaG9rZV9zbGlkZXIiOjE2LjAsImNob2tlX3NsaWRlcnMiOjIuMCwiY2hva2VfdG8iOjE2LjAsImRlbGF5XzEiOjIuMCwiZGVsYXlfMiI6Mi4wLCJkZWxheV8zIjoyLjAsImRlbGF5XzQiOjIuMCwiZGVsYXlfNSI6Mi4wLCJkZWxheV82IjoyLjAsImRlbGF5XzciOjIuMCwiZGVsYXlfOCI6Mi4wLCJkZWxheV9jdXN0b21fc2xpZGVycyI6Mi4wLCJkZWxheV9kZWZhdWx0IjoyLjAsImRlbGF5X21ldGhvZCI6MC4wLCJkZWxheV9yYW5kb21fbWF4IjoyLjAsImRlbGF5X3JhbmRvbV9taW4iOjIuMCwiZnJvbV9saW1pdCI6MzQuMCwiaml0dGVyYnV0dG9uIjp0cnVlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9tb2RlIjoiVGljayBTd2FwIiwibWF4IjowLjAsIm1heGltdW1fbGltaXQiOjYwLjAsIm1pbiI6MC4wLCJtaW5pbXVtX2xpbWl0Ijo0Ni4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6NC4wLCJtb2RpZmllciI6IkNlbnRlciIsIm1vZGlmaWVyX2N1c3RvbV9zbGlkZXJzIjoyLjAsIm1vZGlmaWVyX21vZGUiOiJEZWZhdWx0IiwibW9kaWZpZXJfb2Zmc2V0IjotMTMuMCwibW9kaWZpZXJfc2xpZGVyc18xIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMiI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzMiOjAuMCwibW9kaWZpZXJfc2xpZGVyc180IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzYiOjAuMCwib2Zmc2V0IjowLjAsInJhbmRvbV9jaG9rZSI6ZmFsc2UsInJhbmRvbWl6ZSI6ZmFsc2UsInJpZ2h0X2xpbWl0Ijo2MC4wLCJzYl9zcGVlZCI6NC4wLCJ0b19saW1pdCI6NTIuMCwieWF3IjoiMi1XYXkiLCJ5YXdfbGVmdCI6LTE0LjAsInlhd19yaWdodCI6MjguMH19LCJDcm91Y2hpbmciOnsiQ1QiOnsiYm9keV95YXciOnRydWUsImNob2tlIjoiRGVmYXVsdCIsImNob2tlMV8xIjoyLjAsImNob2tlMV8yIjoyLjAsImNob2tlMV8zIjoyLjAsImNob2tlMV80IjoyLjAsImNob2tlMV81IjoyLjAsImNob2tlMV82IjoyLjAsImNob2tlMV83IjoyLjAsImNob2tlMV84IjoyLjAsImNob2tlX2Zyb20iOjE2LjAsImNob2tlX21ldGhvZCI6IkRlZmF1bHQiLCJjaG9rZV9zbGlkZXIiOjE2LjAsImNob2tlX3NsaWRlcnMiOjIuMCwiY2hva2VfdG8iOjE2LjAsImRlbGF5XzEiOjIuMCwiZGVsYXlfMiI6Mi4wLCJkZWxheV8zIjoyLjAsImRlbGF5XzQiOjIuMCwiZGVsYXlfNSI6Mi4wLCJkZWxheV82IjoyLjAsImRlbGF5XzciOjIuMCwiZGVsYXlfOCI6Mi4wLCJkZWxheV9jdXN0b21fc2xpZGVycyI6Mi4wLCJkZWxheV9kZWZhdWx0IjoyLjAsImRlbGF5X21ldGhvZCI6MC4wLCJkZWxheV9yYW5kb21fbWF4IjoyLjAsImRlbGF5X3JhbmRvbV9taW4iOjQuMCwiZnJvbV9saW1pdCI6NTAuMCwiaml0dGVyYnV0dG9uIjp0cnVlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9tb2RlIjoiVGljayBTd2FwIiwibWF4IjowLjAsIm1heGltdW1fbGltaXQiOjYwLjAsIm1pbiI6MC4wLCJtaW5pbXVtX2xpbWl0Ijo0NS4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6MTYuMCwibW9kaWZpZXIiOiJEaXNhYmxlZCIsIm1vZGlmaWVyX2N1c3RvbV9zbGlkZXJzIjoyLjAsIm1vZGlmaWVyX21vZGUiOiJEZWZhdWx0IiwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzIiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18zIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNCI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzUiOjAuMCwibW9kaWZpZXJfc2xpZGVyc182IjowLjAsIm9mZnNldCI6MC4wLCJyYW5kb21fY2hva2UiOmZhbHNlLCJyYW5kb21pemUiOmZhbHNlLCJyaWdodF9saW1pdCI6NjAuMCwic2Jfc3BlZWQiOjkuMCwidG9fbGltaXQiOjYwLjAsInlhdyI6IjItV2F5IiwieWF3X2xlZnQiOi0yNy4wLCJ5YXdfcmlnaHQiOjM1LjB9LCJUIjp7ImJvZHlfeWF3Ijp0cnVlLCJjaG9rZSI6IkRlZmF1bHQiLCJjaG9rZTFfMSI6Mi4wLCJjaG9rZTFfMiI6Mi4wLCJjaG9rZTFfMyI6Mi4wLCJjaG9rZTFfNCI6Mi4wLCJjaG9rZTFfNSI6Mi4wLCJjaG9rZTFfNiI6Mi4wLCJjaG9rZTFfNyI6Mi4wLCJjaG9rZTFfOCI6Mi4wLCJjaG9rZV9mcm9tIjoxNi4wLCJjaG9rZV9tZXRob2QiOiJEZWZhdWx0IiwiY2hva2Vfc2xpZGVyIjoxNi4wLCJjaG9rZV9zbGlkZXJzIjoyLjAsImNob2tlX3RvIjoxNi4wLCJkZWxheV8xIjoyLjAsImRlbGF5XzIiOjIuMCwiZGVsYXlfMyI6Mi4wLCJkZWxheV80IjoyLjAsImRlbGF5XzUiOjIuMCwiZGVsYXlfNiI6Mi4wLCJkZWxheV83IjoyLjAsImRlbGF5XzgiOjIuMCwiZGVsYXlfY3VzdG9tX3NsaWRlcnMiOjIuMCwiZGVsYXlfZGVmYXVsdCI6Mi4wLCJkZWxheV9tZXRob2QiOjAuMCwiZGVsYXlfcmFuZG9tX21heCI6Mi4wLCJkZWxheV9yYW5kb21fbWluIjo0LjAsImZyb21fbGltaXQiOjUwLjAsImppdHRlcmJ1dHRvbiI6dHJ1ZSwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfbW9kZSI6IlRpY2sgU3dhcCIsIm1heCI6MC4wLCJtYXhpbXVtX2xpbWl0Ijo2MC4wLCJtaW4iOjAuMCwibWluaW11bV9saW1pdCI6NDUuMCwibW9kZSI6IlN0YXRpYyIsIm1vZGVfcmFuZG9tIjo0LjAsIm1vZGVfdGlja3MiOjE2LjAsIm1vZGlmaWVyIjoiRGlzYWJsZWQiLCJtb2RpZmllcl9jdXN0b21fc2xpZGVycyI6Mi4wLCJtb2RpZmllcl9tb2RlIjoiRGVmYXVsdCIsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzEiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18yIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMyI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc181IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNiI6MC4wLCJvZmZzZXQiOjAuMCwicmFuZG9tX2Nob2tlIjpmYWxzZSwicmFuZG9taXplIjpmYWxzZSwicmlnaHRfbGltaXQiOjYwLjAsInNiX3NwZWVkIjo5LjAsInRvX2xpbWl0Ijo2MC4wLCJ5YXciOiIyLVdheSIsInlhd19sZWZ0IjotMjcuMCwieWF3X3JpZ2h0IjozNS4wfX0sIlJ1bm5pbmciOnsiQ1QiOnsiYm9keV95YXciOnRydWUsImNob2tlIjoiRGVmYXVsdCIsImNob2tlMV8xIjoyLjAsImNob2tlMV8yIjoyLjAsImNob2tlMV8zIjoyLjAsImNob2tlMV80IjoyLjAsImNob2tlMV81IjoyLjAsImNob2tlMV82IjoyLjAsImNob2tlMV83IjoyLjAsImNob2tlMV84IjoyLjAsImNob2tlX2Zyb20iOjE2LjAsImNob2tlX21ldGhvZCI6IkRlZmF1bHQiLCJjaG9rZV9zbGlkZXIiOjE2LjAsImNob2tlX3NsaWRlcnMiOjIuMCwiY2hva2VfdG8iOjE2LjAsImRlbGF5XzEiOjIuMCwiZGVsYXlfMiI6Mi4wLCJkZWxheV8zIjoyLjAsImRlbGF5XzQiOjIuMCwiZGVsYXlfNSI6Mi4wLCJkZWxheV82IjoyLjAsImRlbGF5XzciOjIuMCwiZGVsYXlfOCI6Mi4wLCJkZWxheV9jdXN0b21fc2xpZGVycyI6Mi4wLCJkZWxheV9kZWZhdWx0IjoyLjAsImRlbGF5X21ldGhvZCI6MC4wLCJkZWxheV9yYW5kb21fbWF4IjoyLjAsImRlbGF5X3JhbmRvbV9taW4iOjIuMCwiZnJvbV9saW1pdCI6NjAuMCwiaml0dGVyYnV0dG9uIjp0cnVlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9tb2RlIjoiRGVmYXVsdCIsIm1heCI6MC4wLCJtYXhpbXVtX2xpbWl0Ijo2MC4wLCJtaW4iOjAuMCwibWluaW11bV9saW1pdCI6NjAuMCwibW9kZSI6IlN0YXRpYyIsIm1vZGVfcmFuZG9tIjo0LjAsIm1vZGVfdGlja3MiOjQuMCwibW9kaWZpZXIiOiJDZW50ZXIiLCJtb2RpZmllcl9jdXN0b21fc2xpZGVycyI6Mi4wLCJtb2RpZmllcl9tb2RlIjoiRGVmYXVsdCIsIm1vZGlmaWVyX29mZnNldCI6LTE5LjAsIm1vZGlmaWVyX3NsaWRlcnNfMSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzIiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18zIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNCI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzUiOjAuMCwibW9kaWZpZXJfc2xpZGVyc182IjowLjAsIm9mZnNldCI6MC4wLCJyYW5kb21fY2hva2UiOmZhbHNlLCJyYW5kb21pemUiOmZhbHNlLCJyaWdodF9saW1pdCI6NjAuMCwic2Jfc3BlZWQiOjIuMCwidG9fbGltaXQiOjYwLjAsInlhdyI6IjItV2F5IiwieWF3X2xlZnQiOi0yMC4wLCJ5YXdfcmlnaHQiOjE5LjB9LCJUIjp7ImJvZHlfeWF3Ijp0cnVlLCJjaG9rZSI6IkRlZmF1bHQiLCJjaG9rZTFfMSI6Mi4wLCJjaG9rZTFfMiI6Mi4wLCJjaG9rZTFfMyI6Mi4wLCJjaG9rZTFfNCI6Mi4wLCJjaG9rZTFfNSI6Mi4wLCJjaG9rZTFfNiI6Mi4wLCJjaG9rZTFfNyI6Mi4wLCJjaG9rZTFfOCI6Mi4wLCJjaG9rZV9mcm9tIjoxNi4wLCJjaG9rZV9tZXRob2QiOiJEZWZhdWx0IiwiY2hva2Vfc2xpZGVyIjoxNi4wLCJjaG9rZV9zbGlkZXJzIjoyLjAsImNob2tlX3RvIjoxNi4wLCJkZWxheV8xIjoyLjAsImRlbGF5XzIiOjIuMCwiZGVsYXlfMyI6Mi4wLCJkZWxheV80IjoyLjAsImRlbGF5XzUiOjIuMCwiZGVsYXlfNiI6Mi4wLCJkZWxheV83IjoyLjAsImRlbGF5XzgiOjIuMCwiZGVsYXlfY3VzdG9tX3NsaWRlcnMiOjIuMCwiZGVsYXlfZGVmYXVsdCI6Mi4wLCJkZWxheV9tZXRob2QiOjAuMCwiZGVsYXlfcmFuZG9tX21heCI6Mi4wLCJkZWxheV9yYW5kb21fbWluIjoyLjAsImZyb21fbGltaXQiOjYwLjAsImppdHRlcmJ1dHRvbiI6dHJ1ZSwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfbW9kZSI6IkRlZmF1bHQiLCJtYXgiOjAuMCwibWF4aW11bV9saW1pdCI6NjAuMCwibWluIjowLjAsIm1pbmltdW1fbGltaXQiOjYwLjAsIm1vZGUiOiJTdGF0aWMiLCJtb2RlX3JhbmRvbSI6NC4wLCJtb2RlX3RpY2tzIjo0LjAsIm1vZGlmaWVyIjoiQ2VudGVyIiwibW9kaWZpZXJfY3VzdG9tX3NsaWRlcnMiOjIuMCwibW9kaWZpZXJfbW9kZSI6IkRlZmF1bHQiLCJtb2RpZmllcl9vZmZzZXQiOi0xOS4wLCJtb2RpZmllcl9zbGlkZXJzXzEiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18yIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMyI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc181IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNiI6MC4wLCJvZmZzZXQiOjAuMCwicmFuZG9tX2Nob2tlIjpmYWxzZSwicmFuZG9taXplIjpmYWxzZSwicmlnaHRfbGltaXQiOjYwLjAsInNiX3NwZWVkIjoyLjAsInRvX2xpbWl0Ijo2MC4wLCJ5YXciOiIyLVdheSIsInlhd19sZWZ0IjotMjAuMCwieWF3X3JpZ2h0IjoxOS4wfX0sIlNsb3d3YWxraW5nIjp7IkNUIjp7ImJvZHlfeWF3Ijp0cnVlLCJjaG9rZSI6IkRlZmF1bHQiLCJjaG9rZTFfMSI6Mi4wLCJjaG9rZTFfMiI6Mi4wLCJjaG9rZTFfMyI6Mi4wLCJjaG9rZTFfNCI6Mi4wLCJjaG9rZTFfNSI6Mi4wLCJjaG9rZTFfNiI6Mi4wLCJjaG9rZTFfNyI6Mi4wLCJjaG9rZTFfOCI6Mi4wLCJjaG9rZV9mcm9tIjoxNi4wLCJjaG9rZV9tZXRob2QiOiJEZWZhdWx0IiwiY2hva2Vfc2xpZGVyIjoxNi4wLCJjaG9rZV9zbGlkZXJzIjoyLjAsImNob2tlX3RvIjoxNi4wLCJkZWxheV8xIjoyLjAsImRlbGF5XzIiOjIuMCwiZGVsYXlfMyI6Mi4wLCJkZWxheV80IjoyLjAsImRlbGF5XzUiOjIuMCwiZGVsYXlfNiI6Mi4wLCJkZWxheV83IjoyLjAsImRlbGF5XzgiOjIuMCwiZGVsYXlfY3VzdG9tX3NsaWRlcnMiOjIuMCwiZGVsYXlfZGVmYXVsdCI6Mi4wLCJkZWxheV9tZXRob2QiOjAuMCwiZGVsYXlfcmFuZG9tX21heCI6Mi4wLCJkZWxheV9yYW5kb21fbWluIjoyLjAsImZyb21fbGltaXQiOjYwLjAsImppdHRlcmJ1dHRvbiI6dHJ1ZSwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfbW9kZSI6IkRlZmF1bHQiLCJtYXgiOjAuMCwibWF4aW11bV9saW1pdCI6NjAuMCwibWluIjowLjAsIm1pbmltdW1fbGltaXQiOjYwLjAsIm1vZGUiOiJTdGF0aWMiLCJtb2RlX3JhbmRvbSI6NC4wLCJtb2RlX3RpY2tzIjo0LjAsIm1vZGlmaWVyIjoiRGlzYWJsZWQiLCJtb2RpZmllcl9jdXN0b21fc2xpZGVycyI6Mi4wLCJtb2RpZmllcl9tb2RlIjoiRGVmYXVsdCIsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzEiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18yIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMyI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc181IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNiI6MC4wLCJvZmZzZXQiOjAuMCwicmFuZG9tX2Nob2tlIjpmYWxzZSwicmFuZG9taXplIjpmYWxzZSwicmlnaHRfbGltaXQiOjYwLjAsInNiX3NwZWVkIjoyLjAsInRvX2xpbWl0Ijo2MC4wLCJ5YXciOiIxLVdheSIsInlhd19sZWZ0IjowLjAsInlhd19yaWdodCI6MC4wfSwiVCI6eyJib2R5X3lhdyI6dHJ1ZSwiY2hva2UiOiJEZWZhdWx0IiwiY2hva2UxXzEiOjIuMCwiY2hva2UxXzIiOjIuMCwiY2hva2UxXzMiOjIuMCwiY2hva2UxXzQiOjIuMCwiY2hva2UxXzUiOjIuMCwiY2hva2UxXzYiOjIuMCwiY2hva2UxXzciOjIuMCwiY2hva2UxXzgiOjIuMCwiY2hva2VfZnJvbSI6MTYuMCwiY2hva2VfbWV0aG9kIjoiRGVmYXVsdCIsImNob2tlX3NsaWRlciI6MTYuMCwiY2hva2Vfc2xpZGVycyI6Mi4wLCJjaG9rZV90byI6MTYuMCwiZGVsYXlfMSI6Mi4wLCJkZWxheV8yIjoyLjAsImRlbGF5XzMiOjIuMCwiZGVsYXlfNCI6Mi4wLCJkZWxheV81IjoyLjAsImRlbGF5XzYiOjIuMCwiZGVsYXlfNyI6Mi4wLCJkZWxheV84IjoyLjAsImRlbGF5X2N1c3RvbV9zbGlkZXJzIjoyLjAsImRlbGF5X2RlZmF1bHQiOjIuMCwiZGVsYXlfbWV0aG9kIjowLjAsImRlbGF5X3JhbmRvbV9tYXgiOjIuMCwiZGVsYXlfcmFuZG9tX21pbiI6Mi4wLCJmcm9tX2xpbWl0Ijo2MC4wLCJqaXR0ZXJidXR0b24iOnRydWUsImxlZnRfbGltaXQiOjYwLjAsImxpbWl0X21vZGUiOiJEZWZhdWx0IiwibWF4IjowLjAsIm1heGltdW1fbGltaXQiOjYwLjAsIm1pbiI6MC4wLCJtaW5pbXVtX2xpbWl0Ijo2MC4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6NC4wLCJtb2RpZmllciI6IkRpc2FibGVkIiwibW9kaWZpZXJfY3VzdG9tX3NsaWRlcnMiOjIuMCwibW9kaWZpZXJfbW9kZSI6IkRlZmF1bHQiLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18xIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMiI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzMiOjAuMCwibW9kaWZpZXJfc2xpZGVyc180IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzYiOjAuMCwib2Zmc2V0IjowLjAsInJhbmRvbV9jaG9rZSI6ZmFsc2UsInJhbmRvbWl6ZSI6ZmFsc2UsInJpZ2h0X2xpbWl0Ijo2MC4wLCJzYl9zcGVlZCI6Mi4wLCJ0b19saW1pdCI6NjAuMCwieWF3IjoiMS1XYXkiLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmlnaHQiOjAuMH19LCJTbmVha2luZyI6eyJDVCI6eyJib2R5X3lhdyI6dHJ1ZSwiY2hva2UiOiJEZWZhdWx0IiwiY2hva2UxXzEiOjIuMCwiY2hva2UxXzIiOjIuMCwiY2hva2UxXzMiOjIuMCwiY2hva2UxXzQiOjIuMCwiY2hva2UxXzUiOjIuMCwiY2hva2UxXzYiOjIuMCwiY2hva2UxXzciOjIuMCwiY2hva2UxXzgiOjIuMCwiY2hva2VfZnJvbSI6MTYuMCwiY2hva2VfbWV0aG9kIjoiRGVmYXVsdCIsImNob2tlX3NsaWRlciI6Mi4wLCJjaG9rZV9zbGlkZXJzIjoyLjAsImNob2tlX3RvIjoxNi4wLCJkZWxheV8xIjoyLjAsImRlbGF5XzIiOjIuMCwiZGVsYXlfMyI6Mi4wLCJkZWxheV80IjoyLjAsImRlbGF5XzUiOjIuMCwiZGVsYXlfNiI6Mi4wLCJkZWxheV83IjoyLjAsImRlbGF5XzgiOjIuMCwiZGVsYXlfY3VzdG9tX3NsaWRlcnMiOjIuMCwiZGVsYXlfZGVmYXVsdCI6OC4wLCJkZWxheV9tZXRob2QiOjAuMCwiZGVsYXlfcmFuZG9tX21heCI6Mi4wLCJkZWxheV9yYW5kb21fbWluIjoyLjAsImZyb21fbGltaXQiOjYwLjAsImppdHRlcmJ1dHRvbiI6dHJ1ZSwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfbW9kZSI6IlJhbmRvbSIsIm1heCI6MC4wLCJtYXhpbXVtX2xpbWl0Ijo2MC4wLCJtaW4iOjAuMCwibWluaW11bV9saW1pdCI6NDQuMCwibW9kZSI6IlN0YXRpYyIsIm1vZGVfcmFuZG9tIjo0LjAsIm1vZGVfdGlja3MiOjQuMCwibW9kaWZpZXIiOiJEaXNhYmxlZCIsIm1vZGlmaWVyX2N1c3RvbV9zbGlkZXJzIjoyLjAsIm1vZGlmaWVyX21vZGUiOiJEZWZhdWx0IiwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzIiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18zIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNCI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzUiOjAuMCwibW9kaWZpZXJfc2xpZGVyc182IjowLjAsIm9mZnNldCI6MC4wLCJyYW5kb21fY2hva2UiOmZhbHNlLCJyYW5kb21pemUiOmZhbHNlLCJyaWdodF9saW1pdCI6NjAuMCwic2Jfc3BlZWQiOjIuMCwidG9fbGltaXQiOjYwLjAsInlhdyI6IjItV2F5IiwieWF3X2xlZnQiOi0yMC4wLCJ5YXdfcmlnaHQiOjM4LjB9LCJUIjp7ImJvZHlfeWF3Ijp0cnVlLCJjaG9rZSI6IkRlZmF1bHQiLCJjaG9rZTFfMSI6Mi4wLCJjaG9rZTFfMiI6Mi4wLCJjaG9rZTFfMyI6Mi4wLCJjaG9rZTFfNCI6Mi4wLCJjaG9rZTFfNSI6Mi4wLCJjaG9rZTFfNiI6Mi4wLCJjaG9rZTFfNyI6Mi4wLCJjaG9rZTFfOCI6Mi4wLCJjaG9rZV9mcm9tIjoxNi4wLCJjaG9rZV9tZXRob2QiOiJEZWZhdWx0IiwiY2hva2Vfc2xpZGVyIjoyLjAsImNob2tlX3NsaWRlcnMiOjIuMCwiY2hva2VfdG8iOjE2LjAsImRlbGF5XzEiOjIuMCwiZGVsYXlfMiI6Mi4wLCJkZWxheV8zIjoyLjAsImRlbGF5XzQiOjIuMCwiZGVsYXlfNSI6Mi4wLCJkZWxheV82IjoyLjAsImRlbGF5XzciOjIuMCwiZGVsYXlfOCI6Mi4wLCJkZWxheV9jdXN0b21fc2xpZGVycyI6Mi4wLCJkZWxheV9kZWZhdWx0Ijo4LjAsImRlbGF5X21ldGhvZCI6MC4wLCJkZWxheV9yYW5kb21fbWF4IjoyLjAsImRlbGF5X3JhbmRvbV9taW4iOjIuMCwiZnJvbV9saW1pdCI6NjAuMCwiaml0dGVyYnV0dG9uIjp0cnVlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9tb2RlIjoiUmFuZG9tIiwibWF4IjowLjAsIm1heGltdW1fbGltaXQiOjYwLjAsIm1pbiI6MC4wLCJtaW5pbXVtX2xpbWl0Ijo0NC4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6NC4wLCJtb2RpZmllciI6IkRpc2FibGVkIiwibW9kaWZpZXJfY3VzdG9tX3NsaWRlcnMiOjIuMCwibW9kaWZpZXJfbW9kZSI6IkRlZmF1bHQiLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18xIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMiI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzMiOjAuMCwibW9kaWZpZXJfc2xpZGVyc180IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzYiOjAuMCwib2Zmc2V0IjowLjAsInJhbmRvbV9jaG9rZSI6ZmFsc2UsInJhbmRvbWl6ZSI6ZmFsc2UsInJpZ2h0X2xpbWl0Ijo2MC4wLCJzYl9zcGVlZCI6Mi4wLCJ0b19saW1pdCI6NjAuMCwieWF3IjoiMi1XYXkiLCJ5YXdfbGVmdCI6LTIwLjAsInlhd19yaWdodCI6MzguMH19LCJTdGFuZGluZyI6eyJDVCI6eyJib2R5X3lhdyI6dHJ1ZSwiY2hva2UiOiJEZWZhdWx0IiwiY2hva2UxXzEiOjIuMCwiY2hva2UxXzIiOjIuMCwiY2hva2UxXzMiOjIuMCwiY2hva2UxXzQiOjIuMCwiY2hva2UxXzUiOjIuMCwiY2hva2UxXzYiOjIuMCwiY2hva2UxXzciOjIuMCwiY2hva2UxXzgiOjIuMCwiY2hva2VfZnJvbSI6MTYuMCwiY2hva2VfbWV0aG9kIjoiRGVmYXVsdCIsImNob2tlX3NsaWRlciI6MTYuMCwiY2hva2Vfc2xpZGVycyI6Mi4wLCJjaG9rZV90byI6MTYuMCwiZGVsYXlfMSI6Mi4wLCJkZWxheV8yIjoyLjAsImRlbGF5XzMiOjIuMCwiZGVsYXlfNCI6Mi4wLCJkZWxheV81IjoyLjAsImRlbGF5XzYiOjIuMCwiZGVsYXlfNyI6Mi4wLCJkZWxheV84IjoyLjAsImRlbGF5X2N1c3RvbV9zbGlkZXJzIjoyLjAsImRlbGF5X2RlZmF1bHQiOjIuMCwiZGVsYXlfbWV0aG9kIjowLjAsImRlbGF5X3JhbmRvbV9tYXgiOjIuMCwiZGVsYXlfcmFuZG9tX21pbiI6Mi4wLCJmcm9tX2xpbWl0Ijo2MC4wLCJqaXR0ZXJidXR0b24iOnRydWUsImxlZnRfbGltaXQiOjYwLjAsImxpbWl0X21vZGUiOiJEZWZhdWx0IiwibWF4IjowLjAsIm1heGltdW1fbGltaXQiOjYwLjAsIm1pbiI6MC4wLCJtaW5pbXVtX2xpbWl0Ijo2MC4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6NC4wLCJtb2RpZmllciI6IkRpc2FibGVkIiwibW9kaWZpZXJfY3VzdG9tX3NsaWRlcnMiOjIuMCwibW9kaWZpZXJfbW9kZSI6IkRlZmF1bHQiLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18xIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMiI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzMiOjAuMCwibW9kaWZpZXJfc2xpZGVyc180IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzYiOjAuMCwib2Zmc2V0IjowLjAsInJhbmRvbV9jaG9rZSI6ZmFsc2UsInJhbmRvbWl6ZSI6ZmFsc2UsInJpZ2h0X2xpbWl0Ijo2MC4wLCJzYl9zcGVlZCI6Mi4wLCJ0b19saW1pdCI6NjAuMCwieWF3IjoiMi1XYXkiLCJ5YXdfbGVmdCI6LTE5LjAsInlhd19yaWdodCI6MzIuMH0sIlQiOnsiYm9keV95YXciOnRydWUsImNob2tlIjoiRGVmYXVsdCIsImNob2tlMV8xIjoyLjAsImNob2tlMV8yIjoyLjAsImNob2tlMV8zIjoyLjAsImNob2tlMV80IjoyLjAsImNob2tlMV81IjoyLjAsImNob2tlMV82IjoyLjAsImNob2tlMV83IjoyLjAsImNob2tlMV84IjoyLjAsImNob2tlX2Zyb20iOjE2LjAsImNob2tlX21ldGhvZCI6IkRlZmF1bHQiLCJjaG9rZV9zbGlkZXIiOjE2LjAsImNob2tlX3NsaWRlcnMiOjIuMCwiY2hva2VfdG8iOjE2LjAsImRlbGF5XzEiOjIuMCwiZGVsYXlfMiI6Mi4wLCJkZWxheV8zIjoyLjAsImRlbGF5XzQiOjIuMCwiZGVsYXlfNSI6Mi4wLCJkZWxheV82IjoyLjAsImRlbGF5XzciOjIuMCwiZGVsYXlfOCI6Mi4wLCJkZWxheV9jdXN0b21fc2xpZGVycyI6Mi4wLCJkZWxheV9kZWZhdWx0IjoyLjAsImRlbGF5X21ldGhvZCI6MC4wLCJkZWxheV9yYW5kb21fbWF4IjoyLjAsImRlbGF5X3JhbmRvbV9taW4iOjIuMCwiZnJvbV9saW1pdCI6NjAuMCwiaml0dGVyYnV0dG9uIjp0cnVlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9tb2RlIjoiRGVmYXVsdCIsIm1heCI6MC4wLCJtYXhpbXVtX2xpbWl0Ijo2MC4wLCJtaW4iOjAuMCwibWluaW11bV9saW1pdCI6NjAuMCwibW9kZSI6IlN0YXRpYyIsIm1vZGVfcmFuZG9tIjo0LjAsIm1vZGVfdGlja3MiOjQuMCwibW9kaWZpZXIiOiJEaXNhYmxlZCIsIm1vZGlmaWVyX2N1c3RvbV9zbGlkZXJzIjoyLjAsIm1vZGlmaWVyX21vZGUiOiJEZWZhdWx0IiwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzIiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18zIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNCI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzUiOjAuMCwibW9kaWZpZXJfc2xpZGVyc182IjowLjAsIm9mZnNldCI6MC4wLCJyYW5kb21fY2hva2UiOmZhbHNlLCJyYW5kb21pemUiOmZhbHNlLCJyaWdodF9saW1pdCI6NjAuMCwic2Jfc3BlZWQiOjIuMCwidG9fbGltaXQiOjYwLjAsInlhdyI6IjItV2F5IiwieWF3X2xlZnQiOi0xOS4wLCJ5YXdfcmlnaHQiOjMyLjB9fX19LCJtYWluIjp7ImNvbmYiOnsic3RhdGUiOiJTbmVha2luZyIsInRlYW0iOjEuMH0sImV4dHJhIjp7ImFkZG9uX2FhIjp7ImZyZWVzdGFuZGluZyI6eyJkaXNhYmxlcnMiOlsifiJdLCJwcmVmZXJfbWFudWFsIjp0cnVlLCJzd2l0Y2giOmZhbHNlLCJ5YXdfbW9kIjpmYWxzZX0sIm1hbnVhbHMiOnsiaW52ZXJ0ZXIiOmZhbHNlLCJzaWRlIjoiRGlzYWJsZWQiLCJzdGF0aWMiOmZhbHNlfX0sImFuaW1maXgiOnsiZmFsbGluZyI6eyJ2YWx1ZSI6MC4wfSwiaW50ZXJwb2xhdGluZyI6eyJ2YWx1ZSI6MC4wfSwiaml0dGVyX2xlZ3MiOnsic3dpdGNoIjpmYWxzZX0sImxlYW5pbmciOnsidmFsdWUiOjEwMC4wfSwic2VsZWN0IjpbIkxlYW5pbmciLCJ+Il19LCJhdm9pZF9iYWNrc3RhYiI6eyJzd2l0Y2giOnRydWV9LCJzYWZlX2hlYWQiOnsiaGlnaF9zbGlkZXIiOjI1LjAsInN0YXRlcyI6WyJ+Il0sInN3aXRjaCI6ZmFsc2V9LCJ3YXJtdXBfYWEiOnsibW9kZSI6WyJ+Il0sInBpdGNoIjoiRGlzYWJsZWQiLCJyYW5nZSI6MzYwLjAsInNwZWVkIjozLjAsInlhdyI6IlNwaW4ifX19fSwiaW5mbyI6eyJwcmVzZXRzIjp7Imxpc3QiOjUuMCwibmFtZSI6IjMzMyJ9LCJ3YXRlcm1hcmsiOnsiZm9udCI6IkRlZmF1bHQiLCJncmFkaWVudF9jb2xvciI6WyJTZWNvbmQiLCIjQTg4RDdDRkYiLCJ+Il0sIm1vZGUiOlsifiJdLCJtb2RlX2NvbG9yIjoxLjAsInBvcyI6IkxlZnQiLCJyZW5kZXJfbW9kZSI6MS4wLCJzdGF0aWNfY29sb3IiOiIjRkZGRkZGRkYiLCJ0ZXh0IjoiZ29kc2Vuc2UifX0sIm1pc2MiOnsiYWltYm90Ijp7ImZha2VkdWNrIjp7ImZyZWV6ZV9wZXJpb2QiOnRydWUsInVubG9jayI6dHJ1ZX0sImxhdGVuY3kiOnsic3dpdGNoIjp0cnVlfSwibG9nZ2luZyI6eyJjb2xvcnMiOnsibWFpbiI6IiNGRkZGRkZGRiIsInByZWZpeCI6IiNGRkZGRkZGRiJ9LCJjc3RtX2lucHV0Ijp7ImlucHV0IjoiZ29kc2Vuc2UifSwibW9kZSI6eyJzZWxlY3QiOlsiUHVyY2hhc2VzIEV2ZW50cyIsIlJhZ2Vib3QgRXZlbnRzIiwifiJdfSwic3dpdGNoIjp0cnVlfX0sIm1vdmVtZW50Ijp7ImVkZ2VfcXVpY2tfc3RvcCI6ZmFsc2UsImZhc3RfbGFkZGVyIjp0cnVlLCJub19mYWxsX2RhbWFnZSI6dHJ1ZX0sInZpc3VhbHMiOnsiYXNwZWN0X3JhdGlvIjp7InN3aXRjaCI6dHJ1ZSwidmFsdWUiOjEyOC4wfSwiZG1nX2luZGljYXRvciI6eyJtb2RlIjoiQWR2YW5jZWQiLCJzd2l0Y2giOnRydWV9LCJoaXRtYXJrZXIiOnsiY29sb3IiOiIjRkZGRkZGOEMiLCJjb2xvcjIiOiIjRkZGRkZGRkYiLCJzZWxlY3QiOlsiMkQiLCIzRCIsIn4iXSwidGltZSI6NS4wLCJ0aW1lMiI6NS4wfSwibWFudWFsX2Fycm93cyI6eyJjb2xvciI6IiNGMEI5QzlGRiIsImZvbnQiOiJCb2xkIiwib2Zmc2V0Ijo3NS4wLCJzd2l0Y2giOnRydWUsInN5bWJvbHMiOnsiZm9yd2FyZCI6Il4iLCJsZWZ0IjoiPCIsInJpZ2h0IjoiPiJ9fSwicGxheWVyX3RyYW5zcGFyZW5jeSI6eyJzd2l0Y2giOnRydWV9LCJyZW1vdmVfc2xlZXZlcyI6eyJzd2l0Y2giOnRydWV9LCJzY29wZV9vdmVybGF5Ijp7ImNvbG9ycyI6eyJlZGdlIjoiIzAwMDAwMDAwIiwibWFpbiI6IiNGRkZGRkZGRiJ9LCJnYXAiOjguMCwibGVuZ3RoIjoyMjAuMCwib3B0aW9ucyI6WyJ+Il0sInN3aXRjaCI6dHJ1ZX0sInZpZXdtb2RlbF9jaGFuZ2VyIjp7ImZvdiI6NTIuMCwic3dpdGNoIjp0cnVlLCJ4Ijo0LjAsInkiOjcuMCwieiI6Ny4wfX19fSwid2F0ZXJtYXJrX3Bvc2l0aW9uIjp7InBvcyI6IkxlZnQiLCJ4IjoxMjgwLjAsInkiOjE0MjAuMH19";
        end;
        if not v160.database[v160.system_presets[3]] or #v160.database == 0 then
            v160.database[v160.system_presets[3]] = "eyJhdXRob3IiOiJTcXYxazIyOCIsImNvbmZpZyI6eyJhbnRpYWltIjp7ImFuZ2xlcyI6eyJicmVha19sYyI6eyJkaXNhYmxlX29uX2dyZW5hZGUiOnRydWUsImhpZGVfc2hvdHMiOiJGYXZvciBGaXJlIFJhdGUiLCJzZWxlY3QiOlsiU3RhbmRpbmciLCJTbG93d2Fsa2luZyIsIkNyb3VjaGluZyIsIlNuZWFraW5nIiwiQWlyIiwiQWlyIENyb3VjaGluZyIsIn4iXX0sImJ1aWxkZXIiOnsiQWlyIjp7IkNUIjp7ImJvZHlfeWF3Ijp0cnVlLCJjaG9rZSI6IkN1c3RvbSIsImNob2tlMV8xIjo1LjAsImNob2tlMV8yIjoxMC4wLCJjaG9rZTFfMyI6NS4wLCJjaG9rZTFfNCI6MTUuMCwiY2hva2UxXzUiOjIuMCwiY2hva2UxXzYiOjIuMCwiY2hva2UxXzciOjIuMCwiY2hva2UxXzgiOjIuMCwiY2hva2VfZnJvbSI6MTYuMCwiY2hva2VfbWV0aG9kIjoiQ3VzdG9tIiwiY2hva2Vfc2xpZGVyIjoxNi4wLCJjaG9rZV9zbGlkZXJzIjo0LjAsImNob2tlX3RvIjoxNi4wLCJkZWxheV8xIjoyLjAsImRlbGF5XzIiOjIuMCwiZGVsYXlfMyI6Mi4wLCJkZWxheV80IjoyLjAsImRlbGF5XzUiOjIuMCwiZGVsYXlfNiI6Mi4wLCJkZWxheV83IjoyLjAsImRlbGF5XzgiOjIuMCwiZGVsYXlfY3VzdG9tX3NsaWRlcnMiOjIuMCwiZGVsYXlfZGVmYXVsdCI6Mi4wLCJkZWxheV9tZXRob2QiOjIuMCwiZGVsYXlfcmFuZG9tX21heCI6OC4wLCJkZWxheV9yYW5kb21fbWluIjo1LjAsImZyb21fbGltaXQiOjYwLjAsImppdHRlcmJ1dHRvbiI6dHJ1ZSwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfbW9kZSI6IkRlZmF1bHQiLCJtYXgiOjAuMCwibWF4aW11bV9saW1pdCI6NjAuMCwibWluIjowLjAsIm1pbmltdW1fbGltaXQiOjYwLjAsIm1vZGUiOiJTdGF0aWMiLCJtb2RlX3JhbmRvbSI6NC4wLCJtb2RlX3RpY2tzIjo0LjAsIm1vZGlmaWVyIjoiU3BpbiIsIm1vZGlmaWVyX2N1c3RvbV9zbGlkZXJzIjo1LjAsIm1vZGlmaWVyX21vZGUiOiJDdXN0b20iLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18xIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMiI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzMiOjAuMCwibW9kaWZpZXJfc2xpZGVyc180IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNSI6LTEwLjAsIm1vZGlmaWVyX3NsaWRlcnNfNiI6MC4wLCJvZmZzZXQiOjAuMCwicmFuZG9tX2Nob2tlIjp0cnVlLCJyYW5kb21pemUiOnRydWUsInJpZ2h0X2xpbWl0Ijo2MC4wLCJzYl9zcGVlZCI6Mi4wLCJ0b19saW1pdCI6NjAuMCwieWF3IjoiMi1XYXkiLCJ5YXdfbGVmdCI6LTI2LjAsInlhd19yaWdodCI6MjkuMH0sIlQiOnsiYm9keV95YXciOnRydWUsImNob2tlIjoiQ3VzdG9tIiwiY2hva2UxXzEiOjUuMCwiY2hva2UxXzIiOjEwLjAsImNob2tlMV8zIjo1LjAsImNob2tlMV80IjoxNS4wLCJjaG9rZTFfNSI6Mi4wLCJjaG9rZTFfNiI6Mi4wLCJjaG9rZTFfNyI6Mi4wLCJjaG9rZTFfOCI6Mi4wLCJjaG9rZV9mcm9tIjoxNi4wLCJjaG9rZV9tZXRob2QiOiJDdXN0b20iLCJjaG9rZV9zbGlkZXIiOjE2LjAsImNob2tlX3NsaWRlcnMiOjQuMCwiY2hva2VfdG8iOjE2LjAsImRlbGF5XzEiOjIuMCwiZGVsYXlfMiI6Mi4wLCJkZWxheV8zIjoyLjAsImRlbGF5XzQiOjIuMCwiZGVsYXlfNSI6Mi4wLCJkZWxheV82IjoyLjAsImRlbGF5XzciOjIuMCwiZGVsYXlfOCI6Mi4wLCJkZWxheV9jdXN0b21fc2xpZGVycyI6Mi4wLCJkZWxheV9kZWZhdWx0IjoyLjAsImRlbGF5X21ldGhvZCI6Mi4wLCJkZWxheV9yYW5kb21fbWF4Ijo4LjAsImRlbGF5X3JhbmRvbV9taW4iOjUuMCwiZnJvbV9saW1pdCI6NjAuMCwiaml0dGVyYnV0dG9uIjp0cnVlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9tb2RlIjoiRGVmYXVsdCIsIm1heCI6MC4wLCJtYXhpbXVtX2xpbWl0Ijo2MC4wLCJtaW4iOjAuMCwibWluaW11bV9saW1pdCI6NjAuMCwibW9kZSI6IlN0YXRpYyIsIm1vZGVfcmFuZG9tIjo0LjAsIm1vZGVfdGlja3MiOjQuMCwibW9kaWZpZXIiOiJTcGluIiwibW9kaWZpZXJfY3VzdG9tX3NsaWRlcnMiOjUuMCwibW9kaWZpZXJfbW9kZSI6IkN1c3RvbSIsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzEiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18yIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMyI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc181IjotMTAuMCwibW9kaWZpZXJfc2xpZGVyc182IjowLjAsIm9mZnNldCI6MC4wLCJyYW5kb21fY2hva2UiOnRydWUsInJhbmRvbWl6ZSI6dHJ1ZSwicmlnaHRfbGltaXQiOjYwLjAsInNiX3NwZWVkIjoyLjAsInRvX2xpbWl0Ijo2MC4wLCJ5YXciOiIyLVdheSIsInlhd19sZWZ0IjotMjYuMCwieWF3X3JpZ2h0IjoyOS4wfX0sIkFpciBDcm91Y2hpbmciOnsiQ1QiOnsiYm9keV95YXciOnRydWUsImNob2tlIjoiQ3VzdG9tIiwiY2hva2UxXzEiOjE1LjAsImNob2tlMV8yIjo3LjAsImNob2tlMV8zIjozLjAsImNob2tlMV80IjoxNi4wLCJjaG9rZTFfNSI6OS4wLCJjaG9rZTFfNiI6Mi4wLCJjaG9rZTFfNyI6Mi4wLCJjaG9rZTFfOCI6Mi4wLCJjaG9rZV9mcm9tIjoxNi4wLCJjaG9rZV9tZXRob2QiOiJDdXN0b20iLCJjaG9rZV9zbGlkZXIiOjEwLjAsImNob2tlX3NsaWRlcnMiOjUuMCwiY2hva2VfdG8iOjE2LjAsImRlbGF5XzEiOjIuMCwiZGVsYXlfMiI6Mi4wLCJkZWxheV8zIjoyLjAsImRlbGF5XzQiOjIuMCwiZGVsYXlfNSI6Mi4wLCJkZWxheV82IjoyLjAsImRlbGF5XzciOjIuMCwiZGVsYXlfOCI6Mi4wLCJkZWxheV9jdXN0b21fc2xpZGVycyI6Mi4wLCJkZWxheV9kZWZhdWx0Ijo1LjAsImRlbGF5X21ldGhvZCI6MS4wLCJkZWxheV9yYW5kb21fbWF4Ijo2LjAsImRlbGF5X3JhbmRvbV9taW4iOjQuMCwiZnJvbV9saW1pdCI6NjAuMCwiaml0dGVyYnV0dG9uIjp0cnVlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9tb2RlIjoiRGVmYXVsdCIsIm1heCI6MC4wLCJtYXhpbXVtX2xpbWl0Ijo2MC4wLCJtaW4iOjAuMCwibWluaW11bV9saW1pdCI6NjAuMCwibW9kZSI6IlN0YXRpYyIsIm1vZGVfcmFuZG9tIjo0LjAsIm1vZGVfdGlja3MiOjQuMCwibW9kaWZpZXIiOiJTcGluIiwibW9kaWZpZXJfY3VzdG9tX3NsaWRlcnMiOjYuMCwibW9kaWZpZXJfbW9kZSI6IkN1c3RvbSIsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzEiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18yIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMyI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzQiOjEwLjAsIm1vZGlmaWVyX3NsaWRlcnNfNSI6LTEwLjAsIm1vZGlmaWVyX3NsaWRlcnNfNiI6LTEwLjAsIm9mZnNldCI6MC4wLCJyYW5kb21fY2hva2UiOnRydWUsInJhbmRvbWl6ZSI6dHJ1ZSwicmlnaHRfbGltaXQiOjYwLjAsInNiX3NwZWVkIjoyLjAsInRvX2xpbWl0Ijo2MC4wLCJ5YXciOiIyLVdheSIsInlhd19sZWZ0IjotMTkuMCwieWF3X3JpZ2h0IjozOC4wfSwiVCI6eyJib2R5X3lhdyI6dHJ1ZSwiY2hva2UiOiJDdXN0b20iLCJjaG9rZTFfMSI6MTUuMCwiY2hva2UxXzIiOjcuMCwiY2hva2UxXzMiOjMuMCwiY2hva2UxXzQiOjE2LjAsImNob2tlMV81Ijo5LjAsImNob2tlMV82IjoyLjAsImNob2tlMV83IjoyLjAsImNob2tlMV84IjoyLjAsImNob2tlX2Zyb20iOjE2LjAsImNob2tlX21ldGhvZCI6IkN1c3RvbSIsImNob2tlX3NsaWRlciI6MTAuMCwiY2hva2Vfc2xpZGVycyI6NS4wLCJjaG9rZV90byI6MTYuMCwiZGVsYXlfMSI6Mi4wLCJkZWxheV8yIjoyLjAsImRlbGF5XzMiOjIuMCwiZGVsYXlfNCI6Mi4wLCJkZWxheV81IjoyLjAsImRlbGF5XzYiOjIuMCwiZGVsYXlfNyI6Mi4wLCJkZWxheV84IjoyLjAsImRlbGF5X2N1c3RvbV9zbGlkZXJzIjoyLjAsImRlbGF5X2RlZmF1bHQiOjUuMCwiZGVsYXlfbWV0aG9kIjoxLjAsImRlbGF5X3JhbmRvbV9tYXgiOjYuMCwiZGVsYXlfcmFuZG9tX21pbiI6NC4wLCJmcm9tX2xpbWl0Ijo2MC4wLCJqaXR0ZXJidXR0b24iOnRydWUsImxlZnRfbGltaXQiOjYwLjAsImxpbWl0X21vZGUiOiJEZWZhdWx0IiwibWF4IjowLjAsIm1heGltdW1fbGltaXQiOjYwLjAsIm1pbiI6MC4wLCJtaW5pbXVtX2xpbWl0Ijo2MC4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6NC4wLCJtb2RpZmllciI6IlNwaW4iLCJtb2RpZmllcl9jdXN0b21fc2xpZGVycyI6Ni4wLCJtb2RpZmllcl9tb2RlIjoiQ3VzdG9tIiwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzIiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18zIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNCI6MTAuMCwibW9kaWZpZXJfc2xpZGVyc181IjotMTAuMCwibW9kaWZpZXJfc2xpZGVyc182IjotMTAuMCwib2Zmc2V0IjowLjAsInJhbmRvbV9jaG9rZSI6dHJ1ZSwicmFuZG9taXplIjp0cnVlLCJyaWdodF9saW1pdCI6NjAuMCwic2Jfc3BlZWQiOjIuMCwidG9fbGltaXQiOjYwLjAsInlhdyI6IjItV2F5IiwieWF3X2xlZnQiOi0xOS4wLCJ5YXdfcmlnaHQiOjM4LjB9fSwiQ3JvdWNoaW5nIjp7IkNUIjp7ImJvZHlfeWF3Ijp0cnVlLCJjaG9rZSI6IkN1c3RvbSIsImNob2tlMV8xIjoxNy4wLCJjaG9rZTFfMiI6MTEuMCwiY2hva2UxXzMiOjYuMCwiY2hva2UxXzQiOjEzLjAsImNob2tlMV81Ijo5LjAsImNob2tlMV82IjoyLjAsImNob2tlMV83IjoyLjAsImNob2tlMV84IjoyLjAsImNob2tlX2Zyb20iOjE2LjAsImNob2tlX21ldGhvZCI6IkN1c3RvbSIsImNob2tlX3NsaWRlciI6MTYuMCwiY2hva2Vfc2xpZGVycyI6NS4wLCJjaG9rZV90byI6MTYuMCwiZGVsYXlfMSI6Mi4wLCJkZWxheV8yIjoyLjAsImRlbGF5XzMiOjIuMCwiZGVsYXlfNCI6Mi4wLCJkZWxheV81IjoyLjAsImRlbGF5XzYiOjIuMCwiZGVsYXlfNyI6Mi4wLCJkZWxheV84IjoyLjAsImRlbGF5X2N1c3RvbV9zbGlkZXJzIjoyLjAsImRlbGF5X2RlZmF1bHQiOjIuMCwiZGVsYXlfbWV0aG9kIjoyLjAsImRlbGF5X3JhbmRvbV9tYXgiOjQuMCwiZGVsYXlfcmFuZG9tX21pbiI6Mi4wLCJmcm9tX2xpbWl0Ijo0Mi4wLCJqaXR0ZXJidXR0b24iOnRydWUsImxlZnRfbGltaXQiOjYwLjAsImxpbWl0X21vZGUiOiJEZWZhdWx0IiwibWF4IjowLjAsIm1heGltdW1fbGltaXQiOjYwLjAsIm1pbiI6MC4wLCJtaW5pbXVtX2xpbWl0Ijo0Ny4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6NC4wLCJtb2RpZmllciI6IlNwaW4iLCJtb2RpZmllcl9jdXN0b21fc2xpZGVycyI6Ni4wLCJtb2RpZmllcl9tb2RlIjoiQ3VzdG9tIiwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzIiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18zIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNCI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzUiOi0xMC4wLCJtb2RpZmllcl9zbGlkZXJzXzYiOi0xMC4wLCJvZmZzZXQiOjAuMCwicmFuZG9tX2Nob2tlIjp0cnVlLCJyYW5kb21pemUiOnRydWUsInJpZ2h0X2xpbWl0Ijo2MC4wLCJzYl9zcGVlZCI6Ny4wLCJ0b19saW1pdCI6NjAuMCwieWF3IjoiMi1XYXkiLCJ5YXdfbGVmdCI6LTI1LjAsInlhd19yaWdodCI6NDQuMH0sIlQiOnsiYm9keV95YXciOnRydWUsImNob2tlIjoiQ3VzdG9tIiwiY2hva2UxXzEiOjE3LjAsImNob2tlMV8yIjoxMS4wLCJjaG9rZTFfMyI6Ni4wLCJjaG9rZTFfNCI6MTMuMCwiY2hva2UxXzUiOjkuMCwiY2hva2UxXzYiOjIuMCwiY2hva2UxXzciOjIuMCwiY2hva2UxXzgiOjIuMCwiY2hva2VfZnJvbSI6MTYuMCwiY2hva2VfbWV0aG9kIjoiQ3VzdG9tIiwiY2hva2Vfc2xpZGVyIjoxNi4wLCJjaG9rZV9zbGlkZXJzIjo1LjAsImNob2tlX3RvIjoxNi4wLCJkZWxheV8xIjoyLjAsImRlbGF5XzIiOjIuMCwiZGVsYXlfMyI6Mi4wLCJkZWxheV80IjoyLjAsImRlbGF5XzUiOjIuMCwiZGVsYXlfNiI6Mi4wLCJkZWxheV83IjoyLjAsImRlbGF5XzgiOjIuMCwiZGVsYXlfY3VzdG9tX3NsaWRlcnMiOjIuMCwiZGVsYXlfZGVmYXVsdCI6Mi4wLCJkZWxheV9tZXRob2QiOjIuMCwiZGVsYXlfcmFuZG9tX21heCI6NC4wLCJkZWxheV9yYW5kb21fbWluIjoyLjAsImZyb21fbGltaXQiOjQyLjAsImppdHRlcmJ1dHRvbiI6dHJ1ZSwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfbW9kZSI6IkRlZmF1bHQiLCJtYXgiOjAuMCwibWF4aW11bV9saW1pdCI6NjAuMCwibWluIjowLjAsIm1pbmltdW1fbGltaXQiOjQ3LjAsIm1vZGUiOiJTdGF0aWMiLCJtb2RlX3JhbmRvbSI6NC4wLCJtb2RlX3RpY2tzIjo0LjAsIm1vZGlmaWVyIjoiU3BpbiIsIm1vZGlmaWVyX2N1c3RvbV9zbGlkZXJzIjo2LjAsIm1vZGlmaWVyX21vZGUiOiJDdXN0b20iLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18xIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMiI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzMiOjAuMCwibW9kaWZpZXJfc2xpZGVyc180IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNSI6LTEwLjAsIm1vZGlmaWVyX3NsaWRlcnNfNiI6LTEwLjAsIm9mZnNldCI6MC4wLCJyYW5kb21fY2hva2UiOnRydWUsInJhbmRvbWl6ZSI6dHJ1ZSwicmlnaHRfbGltaXQiOjYwLjAsInNiX3NwZWVkIjo3LjAsInRvX2xpbWl0Ijo2MC4wLCJ5YXciOiIyLVdheSIsInlhd19sZWZ0IjotMjUuMCwieWF3X3JpZ2h0Ijo0NC4wfX0sIlJ1bm5pbmciOnsiQ1QiOnsiYm9keV95YXciOnRydWUsImNob2tlIjoiRGVmYXVsdCIsImNob2tlMV8xIjoyLjAsImNob2tlMV8yIjoyLjAsImNob2tlMV8zIjoyLjAsImNob2tlMV80IjoyLjAsImNob2tlMV81IjoyLjAsImNob2tlMV82IjoyLjAsImNob2tlMV83IjoyLjAsImNob2tlMV84IjoyLjAsImNob2tlX2Zyb20iOjE2LjAsImNob2tlX21ldGhvZCI6IkRlZmF1bHQiLCJjaG9rZV9zbGlkZXIiOjE2LjAsImNob2tlX3NsaWRlcnMiOjIuMCwiY2hva2VfdG8iOjE2LjAsImRlbGF5XzEiOjMuMCwiZGVsYXlfMiI6MTQuMCwiZGVsYXlfMyI6Mi4wLCJkZWxheV80IjoyLjAsImRlbGF5XzUiOjIuMCwiZGVsYXlfNiI6Mi4wLCJkZWxheV83IjoyLjAsImRlbGF5XzgiOjIuMCwiZGVsYXlfY3VzdG9tX3NsaWRlcnMiOjIuMCwiZGVsYXlfZGVmYXVsdCI6Mi4wLCJkZWxheV9tZXRob2QiOjIuMCwiZGVsYXlfcmFuZG9tX21heCI6Ni4wLCJkZWxheV9yYW5kb21fbWluIjozLjAsImZyb21fbGltaXQiOjYwLjAsImppdHRlcmJ1dHRvbiI6dHJ1ZSwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfbW9kZSI6IkRlZmF1bHQiLCJtYXgiOjAuMCwibWF4aW11bV9saW1pdCI6NjAuMCwibWluIjotNi4wLCJtaW5pbXVtX2xpbWl0Ijo2MC4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6NC4wLCJtb2RpZmllciI6IlNwaW4iLCJtb2RpZmllcl9jdXN0b21fc2xpZGVycyI6NS4wLCJtb2RpZmllcl9tb2RlIjoiQ3VzdG9tIiwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzIiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18zIjotMy4wLCJtb2RpZmllcl9zbGlkZXJzXzQiOjMuMCwibW9kaWZpZXJfc2xpZGVyc181IjotMTQuMCwibW9kaWZpZXJfc2xpZGVyc182IjowLjAsIm9mZnNldCI6MC4wLCJyYW5kb21fY2hva2UiOmZhbHNlLCJyYW5kb21pemUiOnRydWUsInJpZ2h0X2xpbWl0Ijo2MC4wLCJzYl9zcGVlZCI6Mi4wLCJ0b19saW1pdCI6NjAuMCwieWF3IjoiMi1XYXkiLCJ5YXdfbGVmdCI6LTIwLjAsInlhd19yaWdodCI6MzkuMH0sIlQiOnsiYm9keV95YXciOnRydWUsImNob2tlIjoiRGVmYXVsdCIsImNob2tlMV8xIjoyLjAsImNob2tlMV8yIjoyLjAsImNob2tlMV8zIjoyLjAsImNob2tlMV80IjoyLjAsImNob2tlMV81IjoyLjAsImNob2tlMV82IjoyLjAsImNob2tlMV83IjoyLjAsImNob2tlMV84IjoyLjAsImNob2tlX2Zyb20iOjE2LjAsImNob2tlX21ldGhvZCI6IkRlZmF1bHQiLCJjaG9rZV9zbGlkZXIiOjE2LjAsImNob2tlX3NsaWRlcnMiOjIuMCwiY2hva2VfdG8iOjE2LjAsImRlbGF5XzEiOjMuMCwiZGVsYXlfMiI6MTQuMCwiZGVsYXlfMyI6Mi4wLCJkZWxheV80IjoyLjAsImRlbGF5XzUiOjIuMCwiZGVsYXlfNiI6Mi4wLCJkZWxheV83IjoyLjAsImRlbGF5XzgiOjIuMCwiZGVsYXlfY3VzdG9tX3NsaWRlcnMiOjIuMCwiZGVsYXlfZGVmYXVsdCI6Mi4wLCJkZWxheV9tZXRob2QiOjIuMCwiZGVsYXlfcmFuZG9tX21heCI6Ni4wLCJkZWxheV9yYW5kb21fbWluIjozLjAsImZyb21fbGltaXQiOjYwLjAsImppdHRlcmJ1dHRvbiI6dHJ1ZSwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfbW9kZSI6IkRlZmF1bHQiLCJtYXgiOjAuMCwibWF4aW11bV9saW1pdCI6NjAuMCwibWluIjotNi4wLCJtaW5pbXVtX2xpbWl0Ijo2MC4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6NC4wLCJtb2RpZmllciI6IlNwaW4iLCJtb2RpZmllcl9jdXN0b21fc2xpZGVycyI6NS4wLCJtb2RpZmllcl9tb2RlIjoiQ3VzdG9tIiwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzIiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18zIjotMy4wLCJtb2RpZmllcl9zbGlkZXJzXzQiOjMuMCwibW9kaWZpZXJfc2xpZGVyc181IjotMTQuMCwibW9kaWZpZXJfc2xpZGVyc182IjowLjAsIm9mZnNldCI6MC4wLCJyYW5kb21fY2hva2UiOmZhbHNlLCJyYW5kb21pemUiOnRydWUsInJpZ2h0X2xpbWl0Ijo2MC4wLCJzYl9zcGVlZCI6Mi4wLCJ0b19saW1pdCI6NjAuMCwieWF3IjoiMi1XYXkiLCJ5YXdfbGVmdCI6LTIwLjAsInlhd19yaWdodCI6MzkuMH19LCJTbG93d2Fsa2luZyI6eyJDVCI6eyJib2R5X3lhdyI6dHJ1ZSwiY2hva2UiOiJDdXN0b20iLCJjaG9rZTFfMSI6Ni4wLCJjaG9rZTFfMiI6MTAuMCwiY2hva2UxXzMiOjIwLjAsImNob2tlMV80IjozLjAsImNob2tlMV81Ijo0LjAsImNob2tlMV82IjoyLjAsImNob2tlMV83IjoyLjAsImNob2tlMV84IjoyLjAsImNob2tlX2Zyb20iOjE2LjAsImNob2tlX21ldGhvZCI6IkN1c3RvbSIsImNob2tlX3NsaWRlciI6MTYuMCwiY2hva2Vfc2xpZGVycyI6NS4wLCJjaG9rZV90byI6MTYuMCwiZGVsYXlfMSI6NS4wLCJkZWxheV8yIjo5LjAsImRlbGF5XzMiOjMuMCwiZGVsYXlfNCI6My4wLCJkZWxheV81IjoyLjAsImRlbGF5XzYiOjIuMCwiZGVsYXlfNyI6Mi4wLCJkZWxheV84IjoyLjAsImRlbGF5X2N1c3RvbV9zbGlkZXJzIjo0LjAsImRlbGF5X2RlZmF1bHQiOjIuMCwiZGVsYXlfbWV0aG9kIjozLjAsImRlbGF5X3JhbmRvbV9tYXgiOjIuMCwiZGVsYXlfcmFuZG9tX21pbiI6Mi4wLCJmcm9tX2xpbWl0Ijo2MC4wLCJqaXR0ZXJidXR0b24iOnRydWUsImxlZnRfbGltaXQiOjYwLjAsImxpbWl0X21vZGUiOiJEZWZhdWx0IiwibWF4IjowLjAsIm1heGltdW1fbGltaXQiOjYwLjAsIm1pbiI6MC4wLCJtaW5pbXVtX2xpbWl0Ijo2MC4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6NC4wLCJtb2RpZmllciI6IlNwaW4iLCJtb2RpZmllcl9jdXN0b21fc2xpZGVycyI6Ni4wLCJtb2RpZmllcl9tb2RlIjoiQ3VzdG9tIiwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzIiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18zIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNCI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzUiOjAuMCwibW9kaWZpZXJfc2xpZGVyc182IjotMjUuMCwib2Zmc2V0IjowLjAsInJhbmRvbV9jaG9rZSI6dHJ1ZSwicmFuZG9taXplIjp0cnVlLCJyaWdodF9saW1pdCI6NjAuMCwic2Jfc3BlZWQiOjIuMCwidG9fbGltaXQiOjYwLjAsInlhdyI6IjItV2F5IiwieWF3X2xlZnQiOi0yMS4wLCJ5YXdfcmlnaHQiOjQxLjB9LCJUIjp7ImJvZHlfeWF3Ijp0cnVlLCJjaG9rZSI6IkN1c3RvbSIsImNob2tlMV8xIjo2LjAsImNob2tlMV8yIjoxMC4wLCJjaG9rZTFfMyI6MjAuMCwiY2hva2UxXzQiOjMuMCwiY2hva2UxXzUiOjQuMCwiY2hva2UxXzYiOjIuMCwiY2hva2UxXzciOjIuMCwiY2hva2UxXzgiOjIuMCwiY2hva2VfZnJvbSI6MTYuMCwiY2hva2VfbWV0aG9kIjoiQ3VzdG9tIiwiY2hva2Vfc2xpZGVyIjoxNi4wLCJjaG9rZV9zbGlkZXJzIjo1LjAsImNob2tlX3RvIjoxNi4wLCJkZWxheV8xIjo1LjAsImRlbGF5XzIiOjkuMCwiZGVsYXlfMyI6My4wLCJkZWxheV80IjozLjAsImRlbGF5XzUiOjIuMCwiZGVsYXlfNiI6Mi4wLCJkZWxheV83IjoyLjAsImRlbGF5XzgiOjIuMCwiZGVsYXlfY3VzdG9tX3NsaWRlcnMiOjQuMCwiZGVsYXlfZGVmYXVsdCI6Mi4wLCJkZWxheV9tZXRob2QiOjMuMCwiZGVsYXlfcmFuZG9tX21heCI6Mi4wLCJkZWxheV9yYW5kb21fbWluIjoyLjAsImZyb21fbGltaXQiOjYwLjAsImppdHRlcmJ1dHRvbiI6dHJ1ZSwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfbW9kZSI6IkRlZmF1bHQiLCJtYXgiOjAuMCwibWF4aW11bV9saW1pdCI6NjAuMCwibWluIjowLjAsIm1pbmltdW1fbGltaXQiOjYwLjAsIm1vZGUiOiJTdGF0aWMiLCJtb2RlX3JhbmRvbSI6NC4wLCJtb2RlX3RpY2tzIjo0LjAsIm1vZGlmaWVyIjoiU3BpbiIsIm1vZGlmaWVyX2N1c3RvbV9zbGlkZXJzIjo2LjAsIm1vZGlmaWVyX21vZGUiOiJDdXN0b20iLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18xIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMiI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzMiOjAuMCwibW9kaWZpZXJfc2xpZGVyc180IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzYiOi0yNS4wLCJvZmZzZXQiOjAuMCwicmFuZG9tX2Nob2tlIjp0cnVlLCJyYW5kb21pemUiOnRydWUsInJpZ2h0X2xpbWl0Ijo2MC4wLCJzYl9zcGVlZCI6Mi4wLCJ0b19saW1pdCI6NjAuMCwieWF3IjoiMi1XYXkiLCJ5YXdfbGVmdCI6LTIxLjAsInlhd19yaWdodCI6NDEuMH19LCJTbmVha2luZyI6eyJDVCI6eyJib2R5X3lhdyI6dHJ1ZSwiY2hva2UiOiJDdXN0b20iLCJjaG9rZTFfMSI6MTguMCwiY2hva2UxXzIiOjUuMCwiY2hva2UxXzMiOjguMCwiY2hva2UxXzQiOjExLjAsImNob2tlMV81IjoyLjAsImNob2tlMV82IjoyLjAsImNob2tlMV83IjoyLjAsImNob2tlMV84IjoyLjAsImNob2tlX2Zyb20iOjE2LjAsImNob2tlX21ldGhvZCI6IkN1c3RvbSIsImNob2tlX3NsaWRlciI6MTYuMCwiY2hva2Vfc2xpZGVycyI6NC4wLCJjaG9rZV90byI6MTYuMCwiZGVsYXlfMSI6MTUuMCwiZGVsYXlfMiI6OS4wLCJkZWxheV8zIjo2LjAsImRlbGF5XzQiOjQuMCwiZGVsYXlfNSI6Ni4wLCJkZWxheV82IjoyLjAsImRlbGF5XzciOjIuMCwiZGVsYXlfOCI6Mi4wLCJkZWxheV9jdXN0b21fc2xpZGVycyI6NS4wLCJkZWxheV9kZWZhdWx0IjoyLjAsImRlbGF5X21ldGhvZCI6Mi4wLCJkZWxheV9yYW5kb21fbWF4Ijo5LjAsImRlbGF5X3JhbmRvbV9taW4iOjUuMCwiZnJvbV9saW1pdCI6MjguMCwiaml0dGVyYnV0dG9uIjp0cnVlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9tb2RlIjoiVGljayBTd2FwIiwibWF4IjowLjAsIm1heGltdW1fbGltaXQiOjYwLjAsIm1pbiI6MC4wLCJtaW5pbXVtX2xpbWl0Ijo2MC4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6NC4wLCJtb2RpZmllciI6IlNwaW4iLCJtb2RpZmllcl9jdXN0b21fc2xpZGVycyI6NC4wLCJtb2RpZmllcl9tb2RlIjoiRGVmYXVsdCIsIm1vZGlmaWVyX29mZnNldCI6LTEwLjAsIm1vZGlmaWVyX3NsaWRlcnNfMSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzIiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18zIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNCI6LTE0LjAsIm1vZGlmaWVyX3NsaWRlcnNfNSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzYiOjAuMCwib2Zmc2V0IjowLjAsInJhbmRvbV9jaG9rZSI6dHJ1ZSwicmFuZG9taXplIjpmYWxzZSwicmlnaHRfbGltaXQiOjYwLjAsInNiX3NwZWVkIjo4LjAsInRvX2xpbWl0Ijo1MC4wLCJ5YXciOiIyLVdheSIsInlhd19sZWZ0IjotMjEuMCwieWF3X3JpZ2h0IjozNy4wfSwiVCI6eyJib2R5X3lhdyI6dHJ1ZSwiY2hva2UiOiJDdXN0b20iLCJjaG9rZTFfMSI6MTguMCwiY2hva2UxXzIiOjUuMCwiY2hva2UxXzMiOjguMCwiY2hva2UxXzQiOjExLjAsImNob2tlMV81IjoyLjAsImNob2tlMV82IjoyLjAsImNob2tlMV83IjoyLjAsImNob2tlMV84IjoyLjAsImNob2tlX2Zyb20iOjE2LjAsImNob2tlX21ldGhvZCI6IkN1c3RvbSIsImNob2tlX3NsaWRlciI6MTYuMCwiY2hva2Vfc2xpZGVycyI6NC4wLCJjaG9rZV90byI6MTYuMCwiZGVsYXlfMSI6MTUuMCwiZGVsYXlfMiI6OS4wLCJkZWxheV8zIjo2LjAsImRlbGF5XzQiOjQuMCwiZGVsYXlfNSI6Ni4wLCJkZWxheV82IjoyLjAsImRlbGF5XzciOjIuMCwiZGVsYXlfOCI6Mi4wLCJkZWxheV9jdXN0b21fc2xpZGVycyI6NS4wLCJkZWxheV9kZWZhdWx0IjoyLjAsImRlbGF5X21ldGhvZCI6Mi4wLCJkZWxheV9yYW5kb21fbWF4Ijo5LjAsImRlbGF5X3JhbmRvbV9taW4iOjUuMCwiZnJvbV9saW1pdCI6MjguMCwiaml0dGVyYnV0dG9uIjp0cnVlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9tb2RlIjoiVGljayBTd2FwIiwibWF4IjowLjAsIm1heGltdW1fbGltaXQiOjYwLjAsIm1pbiI6MC4wLCJtaW5pbXVtX2xpbWl0Ijo2MC4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6NC4wLCJtb2RpZmllciI6IlNwaW4iLCJtb2RpZmllcl9jdXN0b21fc2xpZGVycyI6NC4wLCJtb2RpZmllcl9tb2RlIjoiRGVmYXVsdCIsIm1vZGlmaWVyX29mZnNldCI6LTEwLjAsIm1vZGlmaWVyX3NsaWRlcnNfMSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzIiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18zIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNCI6LTE0LjAsIm1vZGlmaWVyX3NsaWRlcnNfNSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzYiOjAuMCwib2Zmc2V0IjowLjAsInJhbmRvbV9jaG9rZSI6dHJ1ZSwicmFuZG9taXplIjpmYWxzZSwicmlnaHRfbGltaXQiOjYwLjAsInNiX3NwZWVkIjo4LjAsInRvX2xpbWl0Ijo1MC4wLCJ5YXciOiIyLVdheSIsInlhd19sZWZ0IjotMjEuMCwieWF3X3JpZ2h0IjozNy4wfX0sIlN0YW5kaW5nIjp7IkNUIjp7ImJvZHlfeWF3Ijp0cnVlLCJjaG9rZSI6IkRlZmF1bHQiLCJjaG9rZTFfMSI6Mi4wLCJjaG9rZTFfMiI6Mi4wLCJjaG9rZTFfMyI6Mi4wLCJjaG9rZTFfNCI6Mi4wLCJjaG9rZTFfNSI6Mi4wLCJjaG9rZTFfNiI6Mi4wLCJjaG9rZTFfNyI6Mi4wLCJjaG9rZTFfOCI6Mi4wLCJjaG9rZV9mcm9tIjoxNi4wLCJjaG9rZV9tZXRob2QiOiJEZWZhdWx0IiwiY2hva2Vfc2xpZGVyIjoxNi4wLCJjaG9rZV9zbGlkZXJzIjoyLjAsImNob2tlX3RvIjoxNi4wLCJkZWxheV8xIjoyLjAsImRlbGF5XzIiOjIuMCwiZGVsYXlfMyI6Mi4wLCJkZWxheV80IjoyLjAsImRlbGF5XzUiOjIuMCwiZGVsYXlfNiI6Mi4wLCJkZWxheV83IjoyLjAsImRlbGF5XzgiOjIuMCwiZGVsYXlfY3VzdG9tX3NsaWRlcnMiOjIuMCwiZGVsYXlfZGVmYXVsdCI6Mi4wLCJkZWxheV9tZXRob2QiOjIuMCwiZGVsYXlfcmFuZG9tX21heCI6OC4wLCJkZWxheV9yYW5kb21fbWluIjoyLjAsImZyb21fbGltaXQiOjYwLjAsImppdHRlcmJ1dHRvbiI6dHJ1ZSwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfbW9kZSI6IkRlZmF1bHQiLCJtYXgiOjAuMCwibWF4aW11bV9saW1pdCI6NjAuMCwibWluIjowLjAsIm1pbmltdW1fbGltaXQiOjYwLjAsIm1vZGUiOiJTdGF0aWMiLCJtb2RlX3JhbmRvbSI6NC4wLCJtb2RlX3RpY2tzIjo0LjAsIm1vZGlmaWVyIjoiRGlzYWJsZWQiLCJtb2RpZmllcl9jdXN0b21fc2xpZGVycyI6Mi4wLCJtb2RpZmllcl9tb2RlIjoiRGVmYXVsdCIsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzEiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18yIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMyI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc181IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNiI6MC4wLCJvZmZzZXQiOjAuMCwicmFuZG9tX2Nob2tlIjpmYWxzZSwicmFuZG9taXplIjpmYWxzZSwicmlnaHRfbGltaXQiOjYwLjAsInNiX3NwZWVkIjoyLjAsInRvX2xpbWl0Ijo2MC4wLCJ5YXciOiIyLVdheSIsInlhd19sZWZ0IjotMjAuMCwieWF3X3JpZ2h0IjozNC4wfSwiVCI6eyJib2R5X3lhdyI6dHJ1ZSwiY2hva2UiOiJEZWZhdWx0IiwiY2hva2UxXzEiOjIuMCwiY2hva2UxXzIiOjIuMCwiY2hva2UxXzMiOjIuMCwiY2hva2UxXzQiOjIuMCwiY2hva2UxXzUiOjIuMCwiY2hva2UxXzYiOjIuMCwiY2hva2UxXzciOjIuMCwiY2hva2UxXzgiOjIuMCwiY2hva2VfZnJvbSI6MTYuMCwiY2hva2VfbWV0aG9kIjoiRGVmYXVsdCIsImNob2tlX3NsaWRlciI6MTYuMCwiY2hva2Vfc2xpZGVycyI6Mi4wLCJjaG9rZV90byI6MTYuMCwiZGVsYXlfMSI6Mi4wLCJkZWxheV8yIjoyLjAsImRlbGF5XzMiOjIuMCwiZGVsYXlfNCI6Mi4wLCJkZWxheV81IjoyLjAsImRlbGF5XzYiOjIuMCwiZGVsYXlfNyI6Mi4wLCJkZWxheV84IjoyLjAsImRlbGF5X2N1c3RvbV9zbGlkZXJzIjoyLjAsImRlbGF5X2RlZmF1bHQiOjIuMCwiZGVsYXlfbWV0aG9kIjoyLjAsImRlbGF5X3JhbmRvbV9tYXgiOjguMCwiZGVsYXlfcmFuZG9tX21pbiI6Mi4wLCJmcm9tX2xpbWl0Ijo2MC4wLCJqaXR0ZXJidXR0b24iOnRydWUsImxlZnRfbGltaXQiOjYwLjAsImxpbWl0X21vZGUiOiJEZWZhdWx0IiwibWF4IjowLjAsIm1heGltdW1fbGltaXQiOjYwLjAsIm1pbiI6MC4wLCJtaW5pbXVtX2xpbWl0Ijo2MC4wLCJtb2RlIjoiU3RhdGljIiwibW9kZV9yYW5kb20iOjQuMCwibW9kZV90aWNrcyI6NC4wLCJtb2RpZmllciI6IkRpc2FibGVkIiwibW9kaWZpZXJfY3VzdG9tX3NsaWRlcnMiOjIuMCwibW9kaWZpZXJfbW9kZSI6IkRlZmF1bHQiLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfc2xpZGVyc18xIjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfMiI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzMiOjAuMCwibW9kaWZpZXJfc2xpZGVyc180IjowLjAsIm1vZGlmaWVyX3NsaWRlcnNfNSI6MC4wLCJtb2RpZmllcl9zbGlkZXJzXzYiOjAuMCwib2Zmc2V0IjowLjAsInJhbmRvbV9jaG9rZSI6ZmFsc2UsInJhbmRvbWl6ZSI6ZmFsc2UsInJpZ2h0X2xpbWl0Ijo2MC4wLCJzYl9zcGVlZCI6Mi4wLCJ0b19saW1pdCI6NjAuMCwieWF3IjoiMi1XYXkiLCJ5YXdfbGVmdCI6LTIwLjAsInlhd19yaWdodCI6MzQuMH19fX0sIm1haW4iOnsiY29uZiI6eyJzdGF0ZSI6IlNuZWFraW5nIiwidGVhbSI6MS4wfSwiZXh0cmEiOnsiYWRkb25fYWEiOnsiZnJlZXN0YW5kaW5nIjp7ImRpc2FibGVycyI6WyJ+Il0sInByZWZlcl9tYW51YWwiOnRydWUsInN3aXRjaCI6ZmFsc2UsInlhd19tb2QiOmZhbHNlfSwibWFudWFscyI6eyJpbnZlcnRlciI6ZmFsc2UsInNpZGUiOiJEaXNhYmxlZCIsInN0YXRpYyI6ZmFsc2V9fSwiYW5pbWZpeCI6eyJmYWxsaW5nIjp7InZhbHVlIjowLjB9LCJpbnRlcnBvbGF0aW5nIjp7InZhbHVlIjo5LjB9LCJqaXR0ZXJfbGVncyI6eyJzd2l0Y2giOnRydWV9LCJsZWFuaW5nIjp7InZhbHVlIjoxMDAuMH0sInNlbGVjdCI6WyJMZWFuaW5nIiwifiJdfSwiYXZvaWRfYmFja3N0YWIiOnsic3dpdGNoIjp0cnVlfSwic2FmZV9oZWFkIjp7ImhpZ2hfc2xpZGVyIjoyNS4wLCJzdGF0ZXMiOlsiWmV1cyB4MjciLCJLbmlmZSIsIn4iXSwic3dpdGNoIjp0cnVlfSwid2FybXVwX2FhIjp7Im1vZGUiOlsiV2FybXVwIiwiTm8gRW5lbWllcyIsIn4iXSwicGl0Y2giOiJEaXNhYmxlZCIsInJhbmdlIjozNjAuMCwic3BlZWQiOjMuMCwieWF3IjoiU3BpbiJ9fX19LCJpbmZvIjp7InByZXNldHMiOnsibGlzdCI6Ny4wLCJuYW1lIjoiZXhwZXJlbWVudGFsIHJlYWwifSwid2F0ZXJtYXJrIjp7ImZvbnQiOiJCb2xkIiwiZ3JhZGllbnRfY29sb3IiOlsiU2Vjb25kIiwiI0ZGRkZGRkZGIiwifiJdLCJtb2RlIjpbIn4iXSwibW9kZV9jb2xvciI6MC4wLCJwb3MiOiJDdXN0b20iLCJzdGF0aWNfY29sb3IiOiIjQUI2MDg4RkYiLCJ0ZXh0IjoiQ1JFV1FYIEdPRE1PREUgdjMuLi5MT0FESU5HIOKWiOKWiOKWiOKWiOKWiOKWiOKWiOKWiFtdIDk5JeKVreKIqeKVriJ9fSwibWlzYyI6eyJhaW1ib3QiOnsiZmFrZWR1Y2siOnsiZnJlZXplX3BlcmlvZCI6dHJ1ZSwidW5sb2NrIjp0cnVlfSwibGF0ZW5jeSI6eyJzd2l0Y2giOnRydWV9LCJsb2dnaW5nIjp7ImNvbG9ycyI6eyJtYWluIjoiI0ZGRkZGRkZGIiwicHJlZml4IjoiI0ZGRkZGRkZGIn0sImNzdG1faW5wdXQiOnsiaW5wdXQiOiJnb2RzZW5zZSJ9LCJtb2RlIjp7InNlbGVjdCI6WyJQdXJjaGFzZXMgRXZlbnRzIiwiUmFnZWJvdCBFdmVudHMiLCJ+Il19LCJzd2l0Y2giOnRydWV9fSwibW92ZW1lbnQiOnsiZWRnZV9xdWlja19zdG9wIjpmYWxzZSwiZmFzdF9sYWRkZXIiOnRydWUsIm5vX2ZhbGxfZGFtYWdlIjp0cnVlfSwidmlzdWFscyI6eyJhc3BlY3RfcmF0aW8iOnsic3dpdGNoIjp0cnVlLCJ2YWx1ZSI6MTMwLjB9LCJkbWdfaW5kaWNhdG9yIjp7Im1vZGUiOiJBZHZhbmNlZCIsInN3aXRjaCI6dHJ1ZX0sImhpdG1hcmtlciI6eyJjb2xvciI6IiNGRkZGRkY4QyIsImNvbG9yMiI6IiNGRkZGRkZGRiIsInNlbGVjdCI6WyIyRCIsIjNEIiwifiJdLCJ0aW1lIjoyLjAsInRpbWUyIjoyLjB9LCJtYW51YWxfYXJyb3dzIjp7ImNvbG9yIjoiI0YwQjlDOUZGIiwiZm9udCI6IkJvbGQiLCJvZmZzZXQiOjQ1LjAsInN3aXRjaCI6dHJ1ZSwic3ltYm9scyI6eyJmb3J3YXJkIjoiXiIsImxlZnQiOiI8IiwicmlnaHQiOiI+In19LCJwbGF5ZXJfdHJhbnNwYXJlbmN5Ijp7InN3aXRjaCI6dHJ1ZX0sInJlbW92ZV9zbGVldmVzIjp7InN3aXRjaCI6ZmFsc2V9LCJzY29wZV9vdmVybGF5Ijp7ImNvbG9ycyI6eyJlZGdlIjoiIzAwMDAwMDAwIiwibWFpbiI6IiNGRkZGRkZGRiJ9LCJnYXAiOjcuMCwibGVuZ3RoIjozMDAuMCwib3B0aW9ucyI6WyJ+Il0sInN3aXRjaCI6dHJ1ZX0sInZpZXdtb2RlbF9jaGFuZ2VyIjp7ImZvdiI6NjYuMCwic3dpdGNoIjp0cnVlLCJ4IjowLjAsInkiOi0yMS4wLCJ6IjozNi4wfX19fSwid2F0ZXJtYXJrX3Bvc2l0aW9uIjp7InBvcyI6IkN1c3RvbSIsIngiOjE0MDEuMCwieSI6OTg4LjB9fQ==";
        end;
        utils.execute_after(0.1, function()
            -- upvalues: v67 (ref), v160 (ref)
            v67.info.presets.name:set("");
            v160:update();
            v67.info.presets.save:set_callback(function()
                -- upvalues: v160 (ref)
                v160:save();
            end);
            v67.info.presets.load:set_callback(function()
                -- upvalues: v160 (ref)
                v160:load();
            end);
            v67.info.presets.delete:set_callback(function()
                -- upvalues: v160 (ref)
                v160:delete();
            end);
            v67.info.presets.export:set_callback(function()
                -- upvalues: v160 (ref)
                v160:export();
            end);
            v67.info.presets.import:set_callback(function()
                -- upvalues: v160 (ref)
                v160:import();
            end);
            v67.info.presets.list:set_callback(function()
                -- upvalues: v160 (ref), v67 (ref)
                v160:disabler();
                cvar.playvol:call("ui\\csgo_ui_contract_type1", 1);
                local v167 = v67.info.presets.list:get();
                local v168 = v67.info.presets.list:list()[v167];
                if v168 and v168 ~= "" and not v160:is_separator(v168) then
                    local v169 = v160:clean_name(v168);
                    v67.info.presets.name:set(v169);
                end;
            end);
        end);
        events.shutdown:set(function()
            -- upvalues: v160 (ref)
            db.godsense_presets = v160.database;
        end);
    end, 
    get_preset_names = function(v170)
        local v171 = {};
        for v172 = #v170.system_presets, 1, -1 do
            table.insert(v171, 1, v170.system_presets[v172]);
        end;
        for v173, _ in pairs(v170.database) do
            local v175 = false;
            for _, v177 in ipairs(v170.system_presets) do
                if v177 == v173 then
                    v175 = true;
                    break;
                end;
            end;
            if not v175 then
                table.insert(v171, v173);
            end;
        end;
        return v171;
    end, 
    utf8_len = function(_, v179)
        local _, v181 = v179:gsub("[^\128-\193]", "");
        return v181;
    end, 
    clean_name = function(_, v183)
        return (v183:gsub("[%z\001-\031]", ""):gsub("{.-}", ""):gsub("[\226\128\162\226\156\166]", ""):match("^%s*(.-)%s*$") or ""):gsub("^DEFAULT", ""):match("^%s*(.-)%s*$") or "";
    end, 
    update = function(v184)
        -- upvalues: v67 (ref)
        local v185 = {};
        for _, v187 in ipairs(v184.system_presets) do
            v185[v187] = v187;
        end;
        for v188, _ in pairs(v184.database) do
            if not v185[v188] then
                v185[v188] = v188;
            end;
        end;
        local v190 = {};
        for v191 in pairs(v185) do
            if not v184:is_system_preset(v191) then
                table.insert(v190, v191);
            end;
        end;
        table.sort(v190);
        local v192 = {};
        for _, v194 in ipairs(v184.system_presets) do
            table.insert(v192, v194);
        end;
        if #v190 > 0 then
            table.insert(v192, v184.separator);
        end;
        for _, v196 in ipairs(v190) do
            table.insert(v192, v196);
        end;
        v67.info.presets.list:update(v192);
    end, 
    is_system_preset = function(v197, v198)
        for _, v200 in ipairs(v197.system_presets) do
            if v198 == v200 then
                return true;
            end;
        end;
        return false;
    end, 
    is_separator = function(v201, v202)
        return v202 == v201.separator;
    end, 
    save = function(v203)
        -- upvalues: v67 (ref), l_pui_0 (ref)
        local v204 = v67.info.presets.name:get();
        if not v204 or v204 == "" then
            print_raw("[godsense] Invalid preset name");
            common.add_event("Invalid preset name", "gears");
            cvar.playvol:call("ui\\weapon_cant_buy", 1);
            return;
        elseif v203:utf8_len(v204) < 2 or v203:utf8_len(v204) > 20 then
            print_raw("[godsense] Preset name must be between 2 and 20 characters");
            common.add_event("Preset name must be between 2 and 20 characters", "gears");
            cvar.playvol:call("ui\\weapon_cant_buy", 1);
            return;
        elseif v203:is_system_preset(v204) then
            print_raw("[godsense] Cannot modify system preset");
            common.add_event("Cannot modify system preset", "gears");
            cvar.playvol:call("ui\\weapon_cant_buy", 1);
            return;
        else
            local v205 = {
                config = l_pui_0.save(), 
                author = common.get_username(), 
                watermark_position = {
                    x = v67.info.watermark.custom_x:get(), 
                    y = v67.info.watermark.custom_y:get(), 
                    pos = v67.info.watermark.pos:get()
                }
            };
            v203.database[v204] = v203:encrypt_data(v205);
            db.godsense_presets = v203.database;
            print_raw("[godsense] Preset saved successfully");
            common.add_event("Preset saved successfully", "gears");
            cvar.playvol:call("ui\\beepclear", 1);
            v203:update();
            local v206 = v67.info.presets.list:list();
            for v207, v208 in ipairs(v206) do
                if v208 == v204 then
                    v67.info.presets.list:set(v207);
                    break;
                end;
            end;
            return;
        end;
    end, 
    load = function(v209)
        -- upvalues: v67 (ref), l_pui_0 (ref)
        local v210 = v67.info.presets.list:get();
        local v211 = v67.info.presets.list:list()[v210];
        if not v211 or not v209.database[v211] then
            print_raw("[godsense] Failed to load");
            common.add_event("Failed to load", "gears");
            cvar.playvol:call("ui\\weapon_cant_buy", 1);
            return;
        else
            local v212 = v209:decrypt_data(v209.database[v211]);
            if not v212 then
                print_raw("[godsense] Failed to decrypt preset");
                common.add_event("Failed to decrypt preset", "gears");
                cvar.playvol:call("ui\\weapon_cant_buy", 1);
                return;
            else
                pcall(function()
                    -- upvalues: l_pui_0 (ref), v212 (ref)
                    l_pui_0.load(v212.config);
                end);
                if v212.watermark_position then
                    v67.info.watermark.custom_x:set(v212.watermark_position.x);
                    v67.info.watermark.custom_y:set(v212.watermark_position.y);
                    if v212.watermark_position.pos then
                        v67.info.watermark.pos:set(v212.watermark_position.pos);
                    end;
                end;
                print_raw("[godsense] Preset loaded successfully");
                common.add_event("Preset loaded successfully", "gears");
                cvar.playvol:call("ui\\beepclear", 1);
                return;
            end;
        end;
    end, 
    delete = function(v213)
        -- upvalues: v67 (ref)
        local v214 = v67.info.presets.list:get();
        local v215 = v67.info.presets.list:list()[v214];
        if not v215 or v215 == "" then
            print_raw("[godsense] Invalid name");
            common.add_event("Invalid name", "gears");
            cvar.playvol:call("ui\\weapon_cant_buy", 1);
            return;
        elseif not v213.database[v215] then
            print_raw("[godsense] Preset doesn't exist");
            common.add_event("Preset doesn't exist", "gears");
            cvar.playvol:call("ui\\weapon_cant_buy", 1);
            return;
        elseif v213:is_system_preset(v215) then
            print_raw("[godsense] Cannot delete system preset");
            common.add_event("Cannot delete system preset", "gears");
            cvar.playvol:call("ui\\weapon_cant_buy", 1);
            return;
        else
            v213.database[v215] = nil;
            db.godsense_presets = v213.database;
            print_raw("[godsense] Preset has been deleted");
            common.add_event("Preset has been deleted", "gears");
            cvar.playvol:call("ui\\beepclear", 1);
            v213:update();
            return;
        end;
    end, 
    export = function(v216)
        -- upvalues: v67 (ref), l_clipboard_0 (ref)
        local v217 = v67.info.presets.list:get();
        local v218 = v67.info.presets.list:list()[v217];
        if not v218 or not v216.database[v218] then
            print("[godsense] Preset doesn't exist");
            common.add_event("Preset doesn't exist", "gears");
            cvar.playvol:call("ui\\weapon_cant_buy", 1);
            return;
        else
            l_clipboard_0.set(v216.database[v218]);
            print_raw("[godsense] Preset has been exported to clipboard");
            common.add_event("Preset has been exported to clipboard", "gears");
            cvar.playvol:call("ui\\beepclear", 1);
            return;
        end;
    end, 
    import = function(v219)
        -- upvalues: l_clipboard_0 (ref), v67 (ref)
        if l_clipboard_0.get() == nil then
            print_raw("[godsense] Clipboard is empty");
            common.add_event("Clipboard is empty", "gears");
            cvar.playvol:call("ui\\weapon_cant_buy", 1);
            return;
        else
            local v220 = v67.info.presets.name:get();
            if not v220 or v220 == "" then
                print_raw("[godsense] Please enter a name for the imported preset");
                common.add_event("Please enter a name for the imported preset", "gears");
                cvar.playvol:call("ui\\weapon_cant_buy", 1);
                return;
            elseif v219:is_system_preset(v220) then
                print_raw("[godsense] Cannot import to system preset");
                common.add_event("Cannot import to system preset", "gears");
                cvar.playvol:call("ui\\weapon_cant_buy", 1);
                return;
            else
                v219.database[v220] = l_clipboard_0.get();
                db.godsense_presets = v219.database;
                print_raw("[godsense] Imported successfully");
                common.add_event("Imported successfully", "gears");
                cvar.playvol:call("ui\\beepclear", 1);
                v219:update();
                local v221 = v67.info.presets.list:list();
                for v222, v223 in ipairs(v221) do
                    if v223 == v220 then
                        v67.info.presets.list:set(v222);
                        break;
                    end;
                end;
                return;
            end;
        end;
    end, 
    disabler = function(v224)
        -- upvalues: v67 (ref)
        local v225 = v67.info.presets.list:list()[v67.info.presets.list:get()];
        local v226 = false;
        for _, v228 in ipairs(v224.system_presets) do
            if v228 == v225 then
                v226 = true;
                break;
            end;
        end;
        local v229 = v225 == v224.separator;
        local v230;
        if not v226 then
            v230 = v229;
        else
            v230 = v226;
        end;
        v67.info.presets.save:disabled(v229);
        v67.info.presets.delete:disabled(v230);
        v67.info.presets.import:disabled(v230);
        v67.info.presets.export:disabled(v230);
        v67.info.presets.load:disabled(v229);
    end
};
v69 = {
    get = function()
        -- upvalues: v64 (ref)
        local v231 = entity.get_local_player();
        if v231 == nil or not v231:is_alive() then
            return;
        else
            local v232 = v231:get_anim_state();
            if v232 == nil then
                return;
            else
                local l_m_flDuckAmount_0 = v231.m_flDuckAmount;
                local v234 = v231.m_vecVelocity:length2d();
                if v232.on_ground and not v232.landed_on_ground_this_frame then
                    if v64.antiaim.misc.slow_walk:get() then
                        return "Slowwalking";
                    elseif v234 < 5 then
                        if l_m_flDuckAmount_0 > 0 then
                            return "Crouching";
                        else
                            return "Standing";
                        end;
                    elseif l_m_flDuckAmount_0 > 0 then
                        return "Sneaking";
                    else
                        return "Running";
                    end;
                else
                    return l_m_flDuckAmount_0 > 0 and "Air Crouching" or "Air";
                end;
            end;
        end;
    end
};
v70 = {};
v71 = {
    Left = -90, 
    Forward = 180, 
    Right = 90
};
do
    local l_v71_0 = v71;
    v70.think = function()
        -- upvalues: v67 (ref), l_v71_0 (ref)
        local v236 = v67.antiaim.main.extra.addon_aa.manuals.side:get();
        if v236 == "Disabled" then
            return false, 0;
        else
            local v237 = l_v71_0[v236];
            if not v237 then
                return false, 0;
            else
                return true, v237;
            end;
        end;
    end;
    v70.update = function(_, v239, _)
        -- upvalues: v70 (ref), v67 (ref)
        local v241, v242 = v70.think();
        local v243 = v67.antiaim.main.extra.addon_aa.manuals.static:get();
        local v244 = v67.antiaim.main.extra.addon_aa.manuals.inverter:get();
        if v241 then
            v239.yaw_offset = v242;
            v239.yaw_base = "Local View";
            v239.pitch = "Down";
            if v243 then
                v239.yaw_modifier = "Disabled";
                rage.antiaim:inverter(v244);
            end;
        end;
    end;
end;
v71 = {};
v74 = function()
    -- upvalues: v64 (ref)
    local v245 = entity.get_local_player();
    if v245 == nil or not v245:is_alive() then
        return;
    else
        local v246 = v245:get_anim_state();
        if v246 == nil then
            return;
        else
            local l_m_flDuckAmount_1 = v245.m_flDuckAmount;
            local v248 = v245.m_vecVelocity:length2d();
            if v246.on_ground and not v246.landed_on_ground_this_frame then
                if v64.antiaim.misc.slow_walk:get() then
                    return "Slowwalking";
                elseif v248 < 5 then
                    return l_m_flDuckAmount_1 > 0 and "Crouching" or "Standing";
                else
                    return l_m_flDuckAmount_1 > 0 and "Sneaking" or "Running";
                end;
            else
                return l_m_flDuckAmount_1 > 0 and "Air Crouching" or "Air";
            end;
        end;
    end;
end;
do
    local l_v74_1 = v74;
    v71.think = function(_)
        -- upvalues: v67 (ref), l_v74_1 (ref)
        if not v67.antiaim.main.extra.addon_aa.freestanding.switch:get() then
            return false;
        else
            local v251 = l_v74_1();
            if v251 and v67.antiaim.main.extra.addon_aa.freestanding.disablers:get(v251) then
                return false;
            else
                return true;
            end;
        end;
    end;
    v71.update = function(v252, v253)
        -- upvalues: v71 (ref), v67 (ref)
        v253.freestanding = v71.think(v252);
        if v253.freestanding and v67.antiaim.main.extra.addon_aa.freestanding.yaw_mod:get() then
            v253.disable_yaw_modifiers = true;
            v253.yaw_modifier = "Disabled";
            v253.modifier_offset = 0;
        end;
    end;
end;
v74 = {};
v75 = 1;
v86 = 0;
v74.think = function(_)
    -- upvalues: v69 (ref), v67 (ref)
    local v255 = entity.get_local_player();
    if v255 == nil or not v255:is_alive() then
        return false;
    else
        local v256 = v255:get_player_weapon();
        if v256 == nil then
            return false;
        else
            local v257 = v69.get();
            if not v67.antiaim.angles.break_lc.select:get(v257) then
                return false;
            else
                local l_m_fThrowTime_0 = v256.m_fThrowTime;
                if v67.antiaim.angles.break_lc.disable_on_grenade:get() and v256:get_weapon_info().weapon_type == 9 or l_m_fThrowTime_0 ~= nil and l_m_fThrowTime_0 ~= 0 then
                    return false;
                else
                    return true;
                end;
            end;
        end;
    end;
end;
do
    local l_v75_0, l_v86_1 = v75, v86;
    v74.update = function(v261, v262, v263)
        -- upvalues: v74 (ref), l_v86_1 (ref), l_v75_0 (ref), v67 (ref)
        if not v74.think(v261) then
            return;
        else
            local v264 = v263.choke:get();
            local v265 = v263.random_choke:get();
            local v266 = v263.choke_slider:get();
            local v267 = v263.choke_method:get();
            local v268 = v263.choke_from:get();
            local v269 = v263.choke_to:get();
            local v270 = v263.choke_sliders:get();
            if v261.choked_commands == 0 then
                l_v86_1 = l_v86_1 + 1;
                local v271 = v263["choke1_" .. l_v75_0]:get() or 1;
                if math.max(v271, 1) <= v270 then
                    l_v86_1 = 0;
                    l_v75_0 = l_v75_0 + 1;
                    if v270 < l_v75_0 then
                        l_v75_0 = 1;
                    end;
                end;
            end;
            if v264 == "Custom" then
                if not v265 then
                    if globals.tickcount % v266 == 0 then
                        v262.lag_options = "Always On";
                    end;
                elseif v267 == "Default" then
                    local v272 = 1;
                    if globals.tickcount % v268 == 0 then
                        v272 = v272 + 1;
                        if v272 >= 3 then
                            v272 = 1;
                        end;
                    end;
                    local _ = v272 == 1 and v268 or v269;
                    chockefromto = math.random(v268, v269);
                    if globals.tickcount % chockefromto == 0 then
                        v262.lag_options = "Always On";
                    end;
                else
                    local v274 = v263["choke1_" .. l_v75_0]:get() or 1;
                    if globals.tickcount % v274 == 0 then
                        v262.lag_options = "Always On";
                    end;
                end;
            else
                v262.lag_options = "Always On";
            end;
            v262.hs_options = v67.antiaim.angles.break_lc.hide_shots:get();
            return;
        end;
    end;
end;
v75 = {};
v86 = 0;
v75.think = function()
    -- upvalues: v67 (ref)
    local v275 = entity.get_local_player();
    if v275 == nil or not v275:is_alive() then
        return false;
    else
        local v276 = entity.get_game_rules();
        if v276 == nil then
            return false;
        else
            local _ = v67.antiaim.main.extra.warmup_aa.mode:get(1);
            local _ = v67.antiaim.main.extra.warmup_aa.mode:get(2);
            local v279 = true;
            for v280 = 1, globals.max_players do
                local v281 = entity.get(v280);
                if v281 ~= nil then
                    local v282 = v281:get_resource();
                    if v282.m_bConnected and v282.m_bConnected == true and v281:is_enemy() and v281:is_alive() then
                        v279 = false;
                        break;
                    end;
                end;
            end;
            if not v276.m_bWarmupPeriod and not v279 then
                local _ = v276.m_bWarmupPeriod;
            end;
            return {
                Warmup = v276.m_bWarmupPeriod, 
                ["No Enemies"] = v279
            };
        end;
    end;
end;
do
    local l_v86_2 = v86;
    v75.update = function(_, v286, v287)
        -- upvalues: v75 (ref), v67 (ref), l_v86_2 (ref)
        local v288 = v75.think();
        if type(v288) ~= "boolean" and not v288 then
            return;
        else
            local v289 = entity.get_game_rules();
            local v290 = v67.antiaim.main.extra.warmup_aa.mode:get(1);
            local v291 = v67.antiaim.main.extra.warmup_aa.mode:get(2);
            local v292 = true;
            entity.get_players(true, true, function(v293)
                -- upvalues: v292 (ref)
                if v293 and v293:is_alive() then
                    v292 = false;
                    return true;
                else
                    return;
                end;
            end);
            local v294 = v67.antiaim.main.extra.warmup_aa.yaw:get();
            local v295 = v67.antiaim.main.extra.warmup_aa.range:get();
            local v296 = v67.antiaim.main.extra.warmup_aa.speed:get();
            if v289.m_bWarmupPeriod and v290 or v292 == true and v291 then
                v286.pitch = v67.antiaim.main.extra.warmup_aa.pitch:get();
                v286.yaw = "Backward";
                v286.yaw_modifier = "Disabled";
                if v294 == "Random" then
                    if globals.tickcount % v296 == 0 then
                        l_v86_2 = utils.random_int(-v295, v295);
                    end;
                    v286.yaw_offset = l_v86_2;
                end;
                if v294 == "Spin" then
                    v286.yaw_offset = globals.framecount * (v296 * 1) % v295;
                end;
                v286.body_yaw = false;
                v286.modifier_offset = 0;
                rage.antiaim:inverter(true);
                rage.exploit:allow_charge(true);
                v287.no_choke = false;
            end;
            return;
        end;
    end;
end;
v86 = {};
v76 = {
    reset = function(_)
        -- upvalues: v64 (ref)
        for _, v299 in pairs(v64.antiaim.angles) do
            v299:override();
        end;
    end, 
    define = function(v300)
        v300.pitch = nil;
        v300.yaw = nil;
        v300.yaw_offset = nil;
        v300.yaw_base = nil;
        v300.yaw_modifier = nil;
        v300.modifier_offset = nil;
        v300.left_limit = nil;
        v300.right_limit = nil;
        v300.body_yaw = nil;
        v300.disable_yaw_modifiers = nil;
        v300.body_freestanding = nil;
        v300.freestanding = nil;
        v300.freestand_peek = nil;
        v300.lag_options = nil;
        v300.hs_options = nil;
        v300.avoid_backstab = nil;
        v300.ignore_inverter = false;
    end, 
    run = function(v301)
        -- upvalues: v64 (ref)
        local v302 = v301.pitch or "Disabled";
        v64.antiaim.angles.pitch:override(v302);
        local v303 = v301.yaw or "Backward";
        v64.antiaim.angles.yaw:override(v303);
        local v304 = v301.yaw_offset or 0;
        v64.antiaim.angles.yaw_add:override(v304);
        local v305 = v301.yaw_base or "At Target";
        v64.antiaim.angles.yaw_base:override(v305);
        local v306 = v301.yaw_modifier or "Disabled";
        v64.antiaim.angles.yaw_modifier:override(v306);
        local v307 = v301.modifier_offset or 0;
        v64.antiaim.angles.modifier_offset:override(v307);
        local v308 = v301.left_limit or 0;
        local v309 = v301.right_limit or 0;
        v64.antiaim.angles.left_limit:override(v308);
        v64.antiaim.angles.right_limit:override(v309);
        local v310 = v301.body_yaw or false;
        v64.antiaim.angles.body_yaw:override(v310);
        local v311 = v301.disable_yaw_modifiers or false;
        v64.antiaim.angles.disable_yaw_modifiers:override(v311);
        local v312 = v301.body_freestanding or false;
        v64.antiaim.angles.body_freestanding:override(v312);
        local v313 = v301.body_yaw_options or {};
        v64.antiaim.angles.options:override(v313);
        local v314 = v301.freestanding or false;
        v64.antiaim.angles.freestanding:override(v314);
        local v315 = v301.freestand_peek or "Off";
        v64.antiaim.angles.freestand_peek:override(v315);
        local v316 = v301.lag_options or "On Peek";
        v64.rage.main.double_tap_lag_options:override(v316);
        local v317 = v301.hs_options or "Favor Fire Rate";
        v64.rage.main.hide_shots_options:override(v317);
        local v318 = v301.avoid_backstab or false;
        v64.antiaim.angles.avoid_backstab:override(v318);
    end
};
v76:reset();
do
    local l_v76_0 = v76;
    v86.create_antiaim = function()
        -- upvalues: l_v76_0 (ref)
        return setmetatable({}, {
            __index = l_v76_0
        });
    end;
end;
v76 = {};
v77 = function(v320, v321)
    local v322 = v320:get_hitbox_position(3);
    local _ = v321:get_eye_position();
    local v324 = v321:simulate_movement();
    v324:think(16);
    local v325 = v324.origin + vector(0, 0, v324.view_offset);
    local v326, _ = utils.trace_bullet(v321, v325, v322);
    if v326 ~= 0 and v320.m_iHealth <= v326 then
        return true;
    else
        return false;
    end;
end;
v78 = function(v328, v329)
    local v330 = v329:get_eye_position();
    local v331 = v328:get_hitbox_position(0);
    local v332, _ = utils.trace_bullet(v329, v330, v331);
    if v328.m_iHealth <= v332 then
        return true;
    else
        local v334 = v329:simulate_movement();
        v334:think(32);
        local v335, _ = utils.trace_bullet(v329, v334.origin + vector(0, 0, v334.view_offset), v331);
        if v328.m_iHealth <= v335 then
            return true;
        else
            return false;
        end;
    end;
end;
do
    local l_v77_1, l_v78_1, l_v79_0 = v77, v78, v79;
    v76.think = function(_)
        -- upvalues: v67 (ref), v69 (ref), l_v77_1 (ref)
        local v341 = entity.get_local_player();
        if v341 == nil or not v341:is_alive() then
            return false;
        else
            local v342 = v341:get_player_weapon();
            if v342 == nil then
                return false;
            elseif not v67.antiaim.main.extra.safe_head.switch:get() then
                return false;
            else
                local v343 = entity.get_threat();
                if v343 == nil or not v343:is_alive() then
                    return false;
                else
                    local v344 = v342:get_classname();
                    local v345 = v344 == "CKnife";
                    local v346 = v344 == "CWeaponTaser";
                    local v347 = v341:get_origin() - v343:get_origin();
                    local v348 = v67.antiaim.main.extra.safe_head.high_slider:get();
                    return {
                        ["Air Crouch"] = v69.get() == "Air Crouching", 
                        ["Zeus x27"] = v346, 
                        Knife = v345, 
                        ["Difference high"] = v348 <= v347.z
                    }, l_v77_1(v341, v343);
                end;
            end;
        end;
    end;
    l_v79_0 = 0;
    v76.update = function(v349, v350, _)
        -- upvalues: v76 (ref), v69 (ref), v67 (ref), l_v77_1 (ref), l_v78_1 (ref), l_v79_0 (ref)
        local v352, v353 = v76.think(v349);
        if type(v352) == "boolean" and not v352 then
            return;
        else
            local v354 = entity.get_local_player();
            if v354 == nil or not v354:is_alive() then
                return false;
            else
                local v355 = v354:get_player_weapon();
                if v355 == nil then
                    return false;
                else
                    local v356 = entity.get_threat();
                    if v356 == nil or not v356:is_alive() then
                        return false;
                    else
                        local v357 = v355:get_classname() == "CKnife";
                        local v358 = v355:get_classname() == "CWeaponTaser";
                        local v359 = v354.m_vecVelocity:length();
                        local v360 = v354.m_flDuckAmount > 0 and 45 or 60;
                        local v361 = math.ceil(v354:get_origin().z + v360 - (v356:get_origin().z or 0));
                        local v362 = v355:get_weapon_info();
                        local v363 = v362 and (v362.max_speed_alt or v362.max_speed) or 250;
                        if v354.m_bIsScoped and v362 ~= nil and v362.max_speed_alt ~= nil then
                            v363 = v362.max_speed_alt;
                        end;
                        if v354.m_flDuckAmount > 0 then
                            v363 = v363 * 0.34;
                        end;
                        local v364 = v359 > 1.1001 and v359 < v363 - v363 * 0.1;
                        local v365 = v349.in_forward == true or (v349.forwardmove or 0) > 0;
                        local v366 = v349.in_back == true or (v349.forwardmove or 0) < 0;
                        local v367 = v349.in_moveright == true or (v349.sidemove or 0) > 0;
                        local v368 = v349.in_moveleft == true or (v349.sidemove or 0) < 0;
                        local l_m_iTeamNum_0 = v354.m_iTeamNum;
                        local v370 = false;
                        local v371 = v69.get();
                        local v372 = v371 == "Air Crouching" or v371 == "Air";
                        local v373 = v371 == "Crouching" or v371 == "Sneaking";
                        local v374 = v371 == "Standing";
                        local v375 = v67.antiaim.main.extra.safe_head.high_slider:get();
                        local v376 = v354:get_origin() - v356:get_origin();
                        if v357 and v371 == "Air Crouching" and v67.antiaim.main.extra.safe_head.states:get("Knife") and not l_v77_1(v354, v356) then
                            v370 = (l_m_iTeamNum_0 == 3 and -35 or -20) < v361;
                        end;
                        if v358 and v371 == "Air Crouching" and v67.antiaim.main.extra.safe_head.states:get("Zeus x27") and not l_v77_1(v354, v356) then
                            v370 = (l_m_iTeamNum_0 == 3 and -35 or -20) < v361;
                        end;
                        if v375 <= v376.z and v67.antiaim.main.extra.safe_head.states:get("Difference high.") and not l_v77_1(v354, v356) then
                            local v377 = v374 and (l_m_iTeamNum_0 == 3 and -6 or 20) <= v361 or not (not v373 or v372) and not ((l_m_iTeamNum_0 == 3 and -20 or -4) > v361) or v372 and (l_m_iTeamNum_0 == 3 and -35 or -20) < v361;
                            local v378 = v356.m_fFlags or 0;
                            local v379 = bit.band(v378, 1) ~= 0;
                            local v380 = v356.m_vecVelocity:length2d();
                            local l_v353_0 = v353;
                            local v382 = not v379 and not (v380 <= 75) or l_v353_0 ~= true;
                            if v377 and v382 then
                                local v383 = l_v78_1(v354, v356);
                                local l_tickcount_0 = globals.tickcount;
                                if v383 == false then
                                    v370 = true;
                                    l_v79_0 = l_tickcount_0 + 16;
                                elseif v383 == true then
                                    v370 = false;
                                    l_v79_0 = 0;
                                else
                                    v370 = l_tickcount_0 <= l_v79_0;
                                end;
                            end;
                        end;
                        if not v370 then
                            return;
                        else
                            v350.pitch = "Down";
                            v350.yaw_base = "At Target";
                            local v385 = nil;
                            if v374 then
                                v385 = 35;
                            elseif v372 then
                                v385 = 32;
                            elseif v365 and (v349.forwardmove or 0) > 0 then
                                if v364 then
                                    v385 = v367 and (v349.sidemove or 0) > 0 and 33 or v368 and (v349.sidemove or 0) < 0 and 20 or 20;
                                else
                                    v385 = v367 and (v349.sidemove or 0) > 0 and 38 or v368 and (v349.sidemove or 0) < 0 and 14 or 26;
                                end;
                            elseif v366 and (v349.forwardmove or 0) < 0 then
                                if v364 then
                                    v385 = v367 and (v349.sidemove or 0) > 0 and 30 or v368 and (v349.sidemove or 0) < 0 and 20 or 30;
                                else
                                    v385 = v367 and (v349.sidemove or 0) > 0 and 30 or v368 and (v349.sidemove or 0) < 0 and 20 or 30;
                                end;
                            else
                                v385 = v367 and (v349.sidemove or 0) > 0 and 38 or v368 and (v349.sidemove or 0) < 0 and 20 or 32;
                            end;
                            local v386 = 45;
                            if true then
                                v385 = -v385;
                            end;
                            v350.yaw_offset = v385 + v386;
                            v350.yaw_modifier = "Disabled";
                            v350.body_yaw_options = {};
                            v350.left_limit = 1;
                            v350.right_limit = 1;
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v77 = {};
v78 = v86.create_antiaim();
v79 = 1;
v80 = 1;
v81 = 0;
v82 = 0;
local v387 = false;
local v388 = false;
local v389 = 0;
local v390 = 0;
local v391 = false;
v77.get_exploit_values = function(v392, v393)
    return ({
        [1] = -v392, 
        [2] = -v392 / 2, 
        [3] = -v392 / 3, 
        [4] = v392 / 3, 
        [5] = v392 / 2, 
        [6] = v392
    })[v393 or 1];
end;
v77.get_preset = function(v394, v395)
    -- upvalues: v67 (ref)
    local v396 = v67.antiaim.angles.builder[v394];
    if v396 == nil then
        return nil;
    else
        return v396[v395];
    end;
end;
do
    local l_v78_2, l_v79_1, l_v80_1, l_v81_1, l_v82_1, l_v387_0, l_v388_0, l_v389_0, l_v390_0, l_v391_0 = v78, v79, v80, v81, v82, v387, v388, v389, v390, v391;
    v77.update_yaw = function(v407, v408, v409, _)
        -- upvalues: l_v79_1 (ref), l_v81_1 (ref), l_v387_0 (ref)
        v408.pitch = "Down";
        v408.yaw_base = "At Target";
        if not v409.yaw:get() then
            v408.yaw_offset = 0;
            return;
        else
            local v411 = v409.yaw:get();
            local v412 = v409.delay_method:get();
            local v413 = v409.yaw_left:get();
            local v414 = v409.yaw_right:get();
            local v415 = v409.delay_default:get();
            local v416 = v409.delay_random_min:get();
            local v417 = v409.delay_random_max:get();
            local v418 = v409.delay_custom_sliders:get();
            local v419 = v409["delay_" .. l_v79_1]:get() or 1;
            v419 = math.max(v419, 1);
            local v420 = 1.4;
            if v411 == "1-Way" then
                v408.yaw = "Backward";
                v408.yaw_offset = v409.offset:get();
            elseif v411 == "2-Way" then
                v408.yaw = "Backward";
                if v412 ~= 0 and v407.choked_commands == 0 then
                    l_v81_1 = l_v81_1 + 1;
                    if v412 == 1 then
                        if l_v81_1 >= v415 / v420 then
                            l_v81_1 = 0;
                            l_v387_0 = not l_v387_0;
                        end;
                    elseif v412 == 2 then
                        if l_v81_1 >= utils.random_int(v416, v417) / v420 then
                            l_v81_1 = 0;
                            l_v387_0 = not l_v387_0;
                        end;
                    elseif l_v81_1 >= v419 / v420 then
                        l_v81_1 = 0;
                        l_v387_0 = not l_v387_0;
                        l_v79_1 = l_v79_1 + 1;
                        if v418 < l_v79_1 then
                            l_v79_1 = 1;
                        end;
                    end;
                end;
                if v412 ~= 0 then
                    rage.antiaim:inverter(l_v387_0);
                    v408.yaw_offset = l_v387_0 and v413 or v414;
                else
                    v408.yaw_offset = rage.antiaim:inverter() and v413 or v414;
                end;
            end;
            return;
        end;
    end;
    v77.update_body_yaw = function(v421, v422, v423)
        -- upvalues: v64 (ref), l_v388_0 (ref), l_v389_0 (ref), l_v390_0 (ref), l_v391_0 (ref)
        local v424 = v423.body_yaw:get();
        local v425 = v423.mode:get();
        local v426 = v423.mode_ticks:get();
        local v427 = v423.mode_random:get();
        local v428 = v423.jitterbutton:get();
        if not v424 then
            v422.body_yaw = false;
            v422.left_limit = 60;
            v422.right_limit = 60;
            return;
        else
            if v425 == "Static" then
                v422.body_yaw = true;
            elseif v425 == "Ticks" and not v64.antiaim.misc.fake_duck:get() then
                if globals.tickcount % v426 == 0 then
                    l_v388_0 = not l_v388_0;
                    l_v389_0 = 0;
                end;
                if not l_v388_0 then
                    l_v389_0 = l_v389_0 + 1;
                end;
                if l_v389_0 >= utils.random_int(2, 6) then
                    l_v388_0 = true;
                    l_v389_0 = 0;
                end;
                local v429 = utils.random_int(3, 6);
                v429 = (not (v429 ~= 1) or v429 == 2) and 9 or v429 + 1;
                v422.body_yaw = l_v388_0;
            elseif v425 == "Random" and not v64.antiaim.misc.fake_duck:get() then
                v422.body_yaw = globals.tickcount % v427 == 0;
            end;
            local v430 = v423.limit_mode:get();
            local v431 = v423.minimum_limit:get();
            local v432 = v423.maximum_limit:get();
            local v433 = v423.from_limit:get();
            local v434 = v423.to_limit:get();
            if not v428 and not v423.delay_method:get() then
                rage.antiaim:inverter(v423.inverter:get());
            end;
            local v435 = rage.antiaim:inverter();
            if v430 == "Tick Swap" then
                if v421.choked_commands == 0 then
                    l_v390_0 = l_v390_0 + 1;
                end;
                if l_v390_0 >= v423.sb_speed:get() then
                    l_v390_0 = 0;
                    l_v391_0 = not l_v391_0;
                end;
                v435 = l_v391_0;
            end;
            local v436 = 0;
            local v437 = 0;
            if v430 == "Default" then
                v436 = v423.left_limit:get();
                v437 = v423.right_limit:get();
            elseif v430 == "Random" then
                v436 = math.random(v431, v432);
                v437 = math.random(v431, v432);
            else
                v436 = v435 and v433 or v434;
                v437 = v435 and v433 or v434;
            end;
            v422.left_limit = v436;
            v422.right_limit = v437;
            if not v428 then
                v422.body_yaw_options = {};
            else
                v422.body_yaw_options = {
                    [1] = "Jitter"
                };
            end;
            return;
        end;
    end;
    v77.update_modifier = function(v438, v439, v440)
        -- upvalues: l_v80_1 (ref), l_v82_1 (ref)
        local v441 = v440.modifier:get();
        local v442 = v440.modifier_mode:get();
        local v443 = v440.randomize:get();
        local v444 = v440.min:get();
        local v445 = v440.max:get();
        local v446 = v440.modifier_custom_sliders:get();
        local v447 = v440.modifier_offset:get();
        if v443 then
            if v442 == "Default" then
                v439.modifier_offset = math.random(v444, v445);
            elseif v442 == "Custom" then
                if v438.choked_commands == 0 then
                    local v448 = v440["modifier_sliders_" .. l_v80_1]:get() or 1;
                    v448 = math.max(v448, 1);
                    l_v82_1 = l_v82_1 + 1;
                    if v448 <= l_v82_1 then
                        l_v82_1 = 0;
                        l_v80_1 = l_v80_1 + 1;
                        if v446 < l_v80_1 then
                            l_v80_1 = 1;
                        end;
                    end;
                end;
                v439.modifier_offset = v440["modifier_sliders_" .. l_v80_1]:get() or 0;
            end;
        else
            v439.modifier_offset = v447;
        end;
        v439.yaw_modifier = v441;
    end;
    v77.update = function(v449, v450, v451)
        -- upvalues: l_v78_2 (ref), l_v80_1 (ref), l_v82_1 (ref), l_v79_1 (ref), l_v81_1 (ref), l_v387_0 (ref), l_v388_0 (ref), l_v389_0 (ref), l_v390_0 (ref), l_v391_0 (ref), v77 (ref), v67 (ref), v75 (ref), v76 (ref), v74 (ref), v70 (ref), v71 (ref)
        l_v78_2:define();
        if v450 == nil then
            return;
        else
            local v452 = v450 .. v451.m_iTeamNum;
            if last_condition_hash ~= v452 then
                last_condition_hash = v452;
                l_v80_1 = 1;
                l_v82_1 = 0;
                l_v79_1 = 1;
                l_v81_1 = 0;
                l_v387_0 = false;
                l_v388_0 = false;
                l_v389_0 = 0;
                l_v390_0 = 0;
                l_v391_0 = false;
            end;
            local v453 = v451.m_iTeamNum == 3 and "CT" or "T";
            local v454 = v77.get_preset(v450, v453);
            if v454 == nil then
                return;
            else
                l_v78_2.avoid_backstab = v67.antiaim.main.extra.avoid_backstab.switch:get();
                local v455 = false;
                local v456 = entity.get_game_rules();
                if v456 then
                    local v457 = v67.antiaim.main.extra.warmup_aa.mode:get(1);
                    local v458 = v67.antiaim.main.extra.warmup_aa.mode:get(2);
                    local v459 = true;
                    do
                        local l_v459_0 = v459;
                        entity.get_players(true, true, function(v461)
                            -- upvalues: l_v459_0 (ref)
                            if v461 and v461:is_alive() then
                                l_v459_0 = false;
                                return true;
                            else
                                return;
                            end;
                        end);
                        v455 = v456.m_bWarmupPeriod and v457 or l_v459_0 and v458;
                    end;
                end;
                if v455 then
                    v75.update(v449, l_v78_2, v449);
                else
                    v77.update_yaw(v449, l_v78_2, v454, v451);
                    v77.update_body_yaw(v449, l_v78_2, v454);
                    v77.update_modifier(v449, l_v78_2, v454);
                    v76.update(v449, l_v78_2, v454);
                    v74.update(v449, l_v78_2, v454);
                    local v462 = v70.think();
                    local v463 = v71.think();
                    if v67.antiaim.main.extra.addon_aa.freestanding.prefer_manual:get() then
                        if v462 then
                            v70.update(v449, l_v78_2, v454);
                        elseif v463 then
                            v71.update(v449, l_v78_2);
                        end;
                    elseif v463 then
                        v71.update(v449, l_v78_2);
                    elseif v462 then
                        v70.update(v449, l_v78_2, v454);
                    end;
                end;
                l_v78_2:run();
                return;
            end;
        end;
    end;
    local function v467(v464)
        -- upvalues: v69 (ref), v77 (ref)
        local v465 = entity.get_local_player();
        local v466 = v69.get();
        v77.update(v464, v466, v465);
    end;
    events.createmove(v467);
end;
v78 = nil;
v79 = {};
v80 = ffi.typeof("        struct { \n            bool client_blend; \n            float blend_in; \n            void *studio_hdr; \n            int dispatch_sequence; \n            int second_dispatch_sequence; \n            uint32_t order; \n            uint32_t sequence; \n            float prev_cycle; \n            float weight; \n            float weight_delta_rate; \n            float playback_rate; \n            float cycle; \n            void *entity; \n            char pad_0x0038[0x4]; \n        } **\n    ");
v81 = {};
do
    local l_v80_2, l_v81_2, l_v82_2 = v80, v81, v82;
    v79.get_anim_overlay = function(v471, v472)
        -- upvalues: l_v80_2 (ref)
        return ffi.cast(l_v80_2, ffi.cast("char*", v471[0]) + 10640)[0][v472];
    end;
    l_v82_2 = false;
    v387 = function(v473)
        -- upvalues: l_v82_2 (ref), v67 (ref), v64 (ref)
        l_v82_2 = v473.in_use;
        if v67.antiaim.main.extra.animfix.jitter_legs.switch:get() then
            v64.antiaim.misc.leg_movement:override(v473.command_number % 3 == 0 and "Walking" or "Sliding");
        else
            v64.antiaim.misc.leg_movement:override();
        end;
    end;
    v388 = function(v474)
        -- upvalues: l_v81_2 (ref), v67 (ref), v79 (ref), l_v82_2 (ref)
        local v475 = entity.get_local_player();
        if v475 == nil or not v475:is_alive() then
            return;
        else
            local v476 = v475:get_player_weapon();
            if v476 == nil then
                return;
            elseif v475 ~= v474 then
                return;
            else
                local v477 = v475:get_index();
                if not l_v81_2[v477] then
                    l_v81_2[v477] = {
                        smoothed_pose_p = {}, 
                        smoothed_layers = {}
                    };
                    for v478 = 0, 12 do
                        l_v81_2[v477].smoothed_pose_p[v478] = 0;
                        l_v81_2[v477].smoothed_layers[v478] = 0;
                    end;
                end;
                local v479 = l_v81_2[v477];
                local l_v475_0 = v475;
                local l_animfix_0 = v67.antiaim.main.extra.animfix;
                if l_animfix_0.select:get("Interpolating") then
                    local v482 = l_animfix_0.interpolating.value:get();
                    if v482 > 0 then
                        local v483 = globals.tickinterval * v482;
                        for v484 = 0, 12 do
                            v479.smoothed_pose_p[v484] = v483 * v479.smoothed_pose_p[v484] + (1 - v483) * l_v475_0.m_flPoseParameter[v484];
                            l_v475_0.m_flPoseParameter[v484] = v479.smoothed_pose_p[v484];
                        end;
                        for v485 = 0, 12 do
                            local v486 = v79.get_anim_overlay(l_v475_0, v485);
                            v479.smoothed_layers[v485] = v483 * v479.smoothed_layers[v485] + (1 - v483) * v486.weight;
                            v486.weight = v479.smoothed_layers[v485];
                        end;
                    end;
                end;
                if l_animfix_0.select:get("Leaning") then
                    local v487 = l_animfix_0.leaning.value:get();
                    if v487 ~= 0 then
                        local v488 = v79.get_anim_overlay(v474, 12);
                        if v488 and v475.m_vecVelocity:length2d() > 5 then
                            v488.weight = v487 / 100;
                        end;
                    end;
                end;
                if v476:get_index() == 668 and l_v82_2 then
                    local v489 = v79.get_anim_overlay(v474, 10);
                    if v489 then
                        v489.weight = 1;
                        v489.sequence = 200;
                        v489.cycle = 0.1;
                    end;
                end;
                if l_animfix_0.jitter_legs.switch:get() then
                    v474.m_flPoseParameter[0] = (globals.clock_offset + globals.client_tick) % 3 == 0 and 0.2 or 0.6;
                end;
                if l_animfix_0.select:get("Falling") then
                    local v490 = l_animfix_0.falling.value:get();
                    if v490 ~= 0 then
                        v475.m_flPoseParameter[6] = v490 / 100;
                    else
                        v475.m_flPoseParameter[6] = 0;
                    end;
                else
                    v475.m_flPoseParameter[6] = 0;
                end;
                return;
            end;
        end;
    end;
    v389 = function()
        -- upvalues: l_v81_2 (ref)
        l_v81_2 = {};
    end;
    events.post_update_clientside_animation(v388);
    events.createmove(v387);
    events.round_start(v389);
    events.disconnect(v389);
end;
v80 = {};
v81 = v64.antiaim.misc.fake_duck;
do
    local l_v81_3 = v81;
    v80.createmove_run = function(v492)
        -- upvalues: l_v81_3 (ref), v67 (ref)
        if not l_v81_3:get() then
            return;
        else
            local v493 = false;
            if v67.misc and v67.misc.aimbot and v67.misc.aimbot.fakeduck then
                v493 = v67.misc.aimbot.fakeduck.unlock and v67.misc.aimbot.fakeduck.unlock:get() or false;
            end;
            if not v493 then
                return;
            else
                local v494 = entity.get_local_player();
                if not v494 or not v494:is_alive() then
                    return;
                else
                    local l_m_vecVelocity_0 = v494.m_vecVelocity;
                    if not l_m_vecVelocity_0 then
                        return;
                    else
                        if math.abs(l_m_vecVelocity_0.y) > 10 or math.abs(l_m_vecVelocity_0.x) > 10 then
                            local v496 = vector(v492.forwardmove, v492.sidemove);
                            if v496:length() > 0 then
                                v496:normalize();
                                local v497 = 159;
                                v492.forwardmove = v496.x * v497;
                                v492.sidemove = v496.y * v497;
                            end;
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end;
    events.createmove_run:set(function(v498)
        -- upvalues: v80 (ref)
        v80.createmove_run(v498);
    end);
end;
v81 = {};
v82 = 0;
v387 = false;
v388 = v64.antiaim.misc.fake_duck;
v389 = v64.rage.main.double_tap;
v390 = v64.rage.main.hide_shots;
do
    local l_v82_3, l_v387_1, l_v388_1, l_v389_1, l_v390_1 = v82, v387, v388, v389, v390;
    v81.createmove = function(v504)
        -- upvalues: v67 (ref), l_v389_1 (ref), l_v390_1 (ref), l_v387_1 (ref), l_v82_3 (ref), l_v388_1 (ref)
        local v505 = entity.get_local_player();
        if not v505 or not v505:is_alive() then
            return;
        else
            local v506 = entity.get_game_rules();
            if not v506 then
                return;
            else
                local v507 = false;
                if v67.misc and v67.misc.aimbot and v67.misc.aimbot.fakeduck then
                    v507 = v67.misc.aimbot.fakeduck.freeze_period and v67.misc.aimbot.fakeduck.freeze_period:get() or false;
                end;
                if not v506.m_bFreezePeriod or not v507 then
                    l_v389_1:override();
                    l_v390_1:override();
                    l_v387_1 = false;
                    l_v82_3 = 0;
                    return;
                else
                    if v506.m_bFreezePeriod == true and l_v388_1:get() then
                        l_v389_1:override(false);
                        l_v390_1:override(false);
                        v504.send_packet = false;
                        if l_v82_3 % 14 == 0 then
                            l_v387_1 = true;
                        elseif l_v82_3 % 14 == 6 then
                            v504.send_packet = true;
                        elseif l_v82_3 % 14 == 7 then
                            l_v387_1 = false;
                        end;
                        if l_v387_1 then
                            v504.in_duck = true;
                        else
                            v504.in_duck = false;
                        end;
                        l_v82_3 = l_v82_3 + 1;
                    else
                        l_v389_1:override();
                        l_v390_1:override();
                        l_v387_1 = false;
                        l_v82_3 = 0;
                    end;
                    return;
                end;
            end;
        end;
    end;
    v81.override_view = function(v508)
        -- upvalues: v67 (ref), l_v388_1 (ref)
        local v509 = entity.get_local_player();
        if not v509 or not v509:is_alive() then
            return;
        else
            local v510 = entity.get_game_rules();
            if not v510 then
                return;
            else
                local v511 = false;
                if v67.misc and v67.misc.aimbot and v67.misc.aimbot.fakeduck then
                    v511 = v67.misc.aimbot.fakeduck.freeze_period and v67.misc.aimbot.fakeduck.freeze_period:get() or false;
                end;
                if v510.m_bFreezePeriod == true and v511 and l_v388_1:get() then
                    local v512 = v509:get_origin();
                    if v512 then
                        v508.camera.z = v512.z + 64;
                    end;
                end;
                return;
            end;
        end;
    end;
    events.createmove:set(function(v513)
        -- upvalues: v81 (ref)
        v81.createmove(v513);
    end);
    events.override_view:set(function(v514)
        -- upvalues: v81 (ref)
        v81.override_view(v514);
    end);
    if v67.misc and v67.misc.aimbot and v67.misc.aimbot.fakeduck and v67.misc.aimbot.fakeduck.freeze_period then
        v67.misc.aimbot.fakeduck.freeze_period:set_callback(function()
            -- upvalues: l_v82_3 (ref), l_v387_1 (ref)
            l_v82_3 = 0;
            l_v387_1 = false;
        end);
    end;
end;
v82 = {
    aim_fire_tick = 0
};
v387 = {
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
};
v388 = {
    weapon_knife_survival_bowie = "Bowie Knife", 
    weapon_m4a4 = "M4a4", 
    weapon_incgrenade = "Molotov", 
    weapon_aug = "Aug", 
    weapon_knife_push = "Shadow Daggers", 
    weapon_ssg08 = "Ssg 08", 
    item_heavyassaultsuit = "Heavy Assault Suit", 
    weapon_awp = "Awp", 
    weapon_knife_flip = "Flip Knife", 
    weapon_g3sg1 = "G3sg1", 
    weapon_hegrenade = "HE", 
    weapon_scar20 = "Scar-20", 
    weapon_knife_gut = "Gut Knife", 
    weapon_m249 = "M249", 
    weapon_decoy = "Decoy", 
    weapon_negev = "Negev", 
    weapon_knife_tactical = "Huntsman Knife", 
    weapon_knife = "Ct Knife", 
    weapon_flashbang = "Flashbang", 
    weapon_knife_t = "T Knife", 
    weapon_knife_butterfly = "Butterfly Knife", 
    weapon_knifegg = "Golden Knife", 
    weapon_smokegrenade = "Smoke", 
    weapon_knife_ghost = "Spectral Shiv", 
    weapon_knife_falchion = "Falchion Knife", 
    weapon_shield = "Ballistic Shield", 
    weapon_molotov = "Molotov", 
    item_kevlar = "Kevlar", 
    weapon_knife_m9_bayonet = "M9 Bayonet", 
    weapon_bayonet = "Bayonet", 
    item_cutters = "Rescue Kit", 
    item_defuser = "Defuse Kit", 
    weapon_knife_karambit = "Karambit", 
    weapon_knife_widowmaker = "Talon Knife", 
    weapon_knife_stiletto = "Stiletto Knife", 
    weapon_elite = "Dual Berettas", 
    weapon_knife_ursus = "Ursus Knife", 
    weapon_fists = "Fists", 
    weapon_axe = "Axe", 
    weapon_spanner = "Wrench", 
    weapon_hammer = "Hammer", 
    weapon_snowball = "Snowball", 
    weapon_taser = "Zeus X27", 
    weapon_breachcharge = "Breach Charge", 
    weapon_tagrenade = "Tag", 
    weapon_bumpmine = "Bump Mine", 
    weapon_diversion = "Diversion Device", 
    weapon_healthshot = "Medi-Shot", 
    weapon_knife_gypsy_jackknife = "Navaja Knife", 
    weapon_tablet = "Tablet", 
    weapon_glock = "Glock-18", 
    weapon_c4 = "C4", 
    item_assaultsuit = "Kevlar + Helmet", 
    weapon_p250 = "P250", 
    weapon_tec9 = "Tec-9", 
    weapon_cz75a = "Cz75-auto", 
    weapon_deagle = "Desert Eagle", 
    weapon_revolver = "R8 Revolver", 
    weapon_usp_silencer = "Usp-s", 
    weapon_hkp2000 = "P2000", 
    weapon_fiveseven = "Five-Seven", 
    weapon_nova = "Nova", 
    weapon_xm1014 = "Xm1014", 
    weapon_sawedoff = "Sawed-Off", 
    weapon_mag7 = "Mag-7", 
    weapon_mac10 = "Mac-10", 
    weapon_mp7 = "Mp7", 
    weapon_ump45 = "Ump-45", 
    weapon_p90 = "P90", 
    weapon_bizon = "PP-Bizon", 
    weapon_mp9 = "Mp9", 
    weapon_mp5sd = "Mp5-SD", 
    weapon_galilar = "Galil Ar", 
    weapon_ak47 = "Ak-47", 
    weapon_sg556 = "Sg 553", 
    weapon_famas = "Famas", 
    weapon_m4a1_silencer = "M4a1-s"
};
v389 = {
    hegrenade = "Naded", 
    inferno = "Burned", 
    knife = "Knifed"
};
do
    local l_v387_2, l_v388_2, l_v389_2, l_v390_2 = v387, v388, v389, v390;
    l_v390_2 = function(v519)
        -- upvalues: l_v388_2 (ref)
        return l_v388_2[v519] or v519:gsub("^weapon_", ""):gsub("^item_", ""):gsub("_", " "):gsub(" ar$", ""):gsub(" m4a1", "m4a1");
    end;
    v82.console_print = function(_, v521)
        -- upvalues: v67 (ref)
        if not v67 or not v67.misc or not v67.misc.aimbot or not v67.misc.aimbot.logging then
            return;
        elseif not v67.misc.aimbot.logging.switch:get() then
            return;
        else
            local v522 = v67.misc.aimbot.logging.colors.prefix:get():to_hex();
            local v523 = v67.misc.aimbot.logging.cstm_input.input:get();
            local v524 = nil;
            if not v523 or v523 == "" then
                v524 = v521;
            else
                v524 = string.format("\a%s[%s] \226\128\162\aDEFAULT %s", v522, v523, v521);
            end;
            print_raw(v524);
            print_dev(v524);
            return;
        end;
    end;
    v82.on_aim_fire = function(v525, _)
        v525.aim_fire_tick = globals.server_tick;
    end;
    v82.on_aim_ack = function(v527, v528)
        -- upvalues: v67 (ref), l_v387_2 (ref)
        if not v67 or not v67.misc or not v67.misc.aimbot or not v67.misc.aimbot.logging then
            return;
        elseif not v67.misc.aimbot.logging.switch:get() then
            return;
        elseif not v67.misc.aimbot.logging.mode.select:get("Ragebot Events") then
            return;
        else
            local v529 = math.max(globals.server_tick - v527.aim_fire_tick - 1, 0);
            local l_target_0 = v528.target;
            if not l_target_0 then
                return;
            else
                local l_state_1 = v528.state;
                local v532 = l_target_0:get_name();
                local l_m_iHealth_0 = l_target_0.m_iHealth;
                local l_backtrack_0 = v528.backtrack;
                local l_hitchance_0 = v528.hitchance;
                local l_damage_0 = v528.damage;
                local l_wanted_damage_0 = v528.wanted_damage;
                local v538 = l_v387_2[v528.hitgroup] or "body";
                local v539 = l_v387_2[v528.wanted_hitgroup] or "body";
                local v540 = v67.misc.aimbot.logging.colors.main:get():to_hex();
                if l_state_1 == "correction" or l_state_1 == "backtrack failure" then
                    l_state_1 = "?";
                end;
                if not l_state_1 then
                    v527:console_print(string.format("Hit \a%s%s%s\aDEFAULT's \a%s%s\aDEFAULT%s for \a%s%d\aDEFAULT%s damage { hc: \a%s%d%%\aDEFAULT \a898989FF\194\183\aDEFAULT bt: \a%s%st\aDEFAULT }%s", v540, v532, l_m_iHealth_0 ~= 0 and string.format("\aDEFAULT(\aC6CBD1FF%shp\aDEFAULT)", l_m_iHealth_0) or "", v540, v538, v539 ~= v538 and string.format("(\aC6CBD1FF%s\aDEFAULT)", v539) or "", v540, l_damage_0, l_wanted_damage_0 ~= l_damage_0 and string.format("(\aC6CBD1FF%d\aDEFAULT)", l_wanted_damage_0) or "", v540, l_hitchance_0, v540, l_backtrack_0, v529 ~= 0 and string.format(" \aDEFAULT(delay=\a%s%.0fms\aDEFAULT)", v540, globals.tickinterval * v529 * 1000) or ""));
                else
                    v527:console_print(string.format("\aC6CBD1FFMissed \a%s%s\aDEFAULT's \a%s%s \aDEFAULTdue to \a%s%s\aDEFAULT { hc: \a%s%d%% \a898989FF\194\183\aDEFAULT bt: \a%s%dt\aDEFAULT } { damage: \a%s%shp\aDEFAULT }", v540, v532, v540, v539, v540, l_state_1, v540, l_hitchance_0, v540, l_backtrack_0, v540, l_wanted_damage_0));
                end;
                return;
            end;
        end;
    end;
    v82.on_player_hurt = function(v541, v542)
        -- upvalues: v67 (ref), l_v389_2 (ref)
        local v543 = entity.get_local_player();
        local v544 = entity.get(v542.userid, true);
        local v545 = entity.get(v542.attacker, true);
        if not v67 or not v67.misc or not v67.misc.aimbot or not v67.misc.aimbot.logging then
            return;
        elseif not v67.misc.aimbot.logging.switch:get() then
            return;
        elseif not v67.misc.aimbot.logging.mode.select:get("Ragebot Events") then
            return;
        elseif v544 == v543 or v545 ~= v543 or l_v389_2[v542.weapon] == nil then
            return;
        else
            local v546 = v67.misc.aimbot.logging.colors.main:get():to_hex();
            v541:console_print(string.format("\aC6CBD1FF%s \a%s%s%s \aDEFAULTfor \a%s%s \aDEFAULTdamage", l_v389_2[v542.weapon], v546, v544:get_name(), v542.health > 0 and string.format("\aDEFAULT(\aC6CBD1FF%shp\aDEFAULT)", v542.health) or "", v546, v542.dmg_health));
            return;
        end;
    end;
    v82.on_item_purchase = function(v547, v548)
        -- upvalues: v67 (ref), l_v390_2 (ref)
        local v549 = entity.get(v548.userid, true);
        if not v67 or not v67.misc or not v67.misc.aimbot or not v67.misc.aimbot.logging then
            return;
        elseif not v67.misc.aimbot.logging.switch:get() then
            return;
        elseif not v67.misc.aimbot.logging.mode.select:get("Purchases Events") then
            return;
        elseif v549 == nil or not v549:is_enemy() then
            return;
        else
            local l_weapon_0 = v548.weapon;
            if l_weapon_0 == "weapon_unknown" then
                return;
            else
                local v551 = v67.misc.aimbot.logging.colors.main:get():to_hex();
                v547:console_print(string.format("\a%s%s \aDEFAULTbought \a%s%s\aDEFAULT", v551, v549:get_name(), v551, l_v390_2(l_weapon_0)));
                return;
            end;
        end;
    end;
    if v64 and v64.logs_ref then
        v64.logs_ref:override("");
    end;
    events.aim_fire:set(function(v552)
        -- upvalues: v82 (ref)
        v82:on_aim_fire(v552);
    end);
    events.aim_ack:set(function(v553)
        -- upvalues: v82 (ref)
        v82:on_aim_ack(v553);
    end);
    events.player_hurt:set(function(v554)
        -- upvalues: v82 (ref)
        v82:on_player_hurt(v554);
    end);
    events.item_purchase:set(function(v555)
        -- upvalues: v82 (ref)
        v82:on_item_purchase(v555);
    end);
end;
v387 = {
    window = v31:new("watermark", vector(v66.x / 2, v66.y * 0.8))
};
v388 = l_smoothy_0.new(0);
v389 = function(v556, v557, v558)
    if not v558 then
        v558 = 1;
    end;
    local v559 = {
        color(255, 0, 0, 255), 
        color(255, 127, 0, 255), 
        color(255, 255, 0, 255), 
        color(0, 255, 0, 255), 
        color(0, 0, 255, 255), 
        color(75, 0, 130, 255), 
        color(148, 0, 211, 255), 
        color(255, 0, 0, 255)
    };
    local v560 = globals.realtime * 4 + (v557 or 0);
    local v561 = "";
    local v562 = #v556;
    local v563 = 1;
    local v564 = 0;
    while v563 <= v562 do
        local v565 = v556:byte(v563);
        if v565 == 92 and v556:sub(v563 + 1, v563 + 1) == "a" then
            v561 = v561 .. v556:sub(v563, v563 + 7);
            v563 = v563 + 8;
        else
            local v566 = nil;
            if v565 >= 240 then
                v566 = v556:sub(v563, v563 + 3);
                v563 = v563 + 4;
            elseif v565 >= 224 then
                v566 = v556:sub(v563, v563 + 2);
                v563 = v563 + 3;
            elseif v565 >= 192 then
                v566 = v556:sub(v563, v563 + 1);
                v563 = v563 + 2;
            else
                v566 = v556:sub(v563, v563);
                v563 = v563 + 1;
            end;
            local v567 = ((v562 > 1 and 1 - v564 / (v562 - 1) or 0) + v560 * 0.3) % 1 * (#v559 - 1);
            local v568 = math.floor(v567);
            local v569 = v567 - v568;
            local v570 = v559[v568 + 1];
            local v571 = v559[v568 + 2];
            v561 = v561 .. "\a" .. color(math.floor(v570.r + (v571.r - v570.r) * v569), math.floor(v570.g + (v571.g - v570.g) * v569), math.floor(v570.b + (v571.b - v570.b) * v569), math.floor(255 * v558)):to_hex() .. v566;
            v564 = v564 + 1;
        end;
    end;
    return v561;
end;
v390 = function(v572)
    local v573 = "abcdefghijklmnopqrstuvwxyz0123456789~!@#$%^&*+-/=?_<>";
    local v574 = #v572;
    local v575 = "";
    for _ = 1, v574 do
        local v577 = math.random(#v573);
        v575 = v575 .. v573:sub(v577, v577);
    end;
    local v578 = math.abs(globals.realtime * 0.5 % 2 - 1) * (v574 + 1);
    v578 = math.clamp(v578, 0, v574);
    return v572:sub(1, v578) .. v575.sub(v575, v578 + 1);
end;
do
    local l_v388_3, l_v389_3, l_v390_3, l_v391_1 = v388, v389, v390, v391;
    l_v391_1 = function()
        -- upvalues: v67 (ref), l_v390_3 (ref), l_v389_3 (ref), v63 (ref)
        local l_watermark_0 = v67.info.watermark;
        local v584 = l_watermark_0.render_mode:get();
        local v585 = l_watermark_0.mode_color:get();
        local v586 = l_watermark_0.mode:get("Rainbow");
        local v587 = l_watermark_0.mode:get("Encoding");
        local v588 = l_watermark_0.mode:get("Pulse");
        if v584 == 0 then
            local v589 = l_watermark_0.text:get();
            if not v589 or v589 == "" or v589:gsub(" ", "") == "" then
                return "", color(255, 255, 255, 255);
            else
                local v590 = v587 and l_v390_3(v589) or v589;
                local v591 = 1;
                if v588 then
                    v591 = math.sin(globals.realtime * 3) * 0.5 + 0.5;
                end;
                if v586 then
                    return l_v389_3(v590, nil, v591), color(255, 255, 255, math.floor(255 * v591));
                elseif v585 == 0 then
                    local v592 = l_watermark_0.static_color:get();
                    local v593 = color(v592.r, v592.g, v592.b, math.floor(v592.a * v591));
                    return "\a" .. v593:to_hex() .. v590, v593;
                else
                    local v594 = l_watermark_0.gradient_color:get("First")[1] or color(255, 255, 255, 255);
                    local v595 = l_watermark_0.gradient_color:get("Second")[1] or color(200, 200, 200, 255);
                    v594 = color(v594.r, v594.g, v594.b, math.floor(v594.a * v591));
                    v595 = color(v595.r, v595.g, v595.b, math.floor(v595.a * v591));
                    return v63:animate(4, v594, v595, v590), v594;
                end;
            end;
        elseif v584 == 1 then
            local v596 = color(148, 92, 97, 255);
            if v585 == 0 then
                local v597 = l_watermark_0.static_color:get();
                return "\a" .. v597:to_hex() .. "GODSENSE" .. "\a" .. v596:to_hex() .. " [SECRET]", v597;
            else
                local v598 = l_watermark_0.gradient_color:get("First")[1] or color(255, 255, 255, 255);
                local v599 = l_watermark_0.gradient_color:get("Second")[1] or color(200, 200, 200, 255);
                return v63:animate(4, v598, v599, "GODSENSE") .. "\a" .. v596:to_hex() .. " [SECRET]", v598;
            end;
        else
            return "", color(255, 255, 255, 255);
        end;
    end;
    local function v609()
        -- upvalues: v67 (ref), v387 (ref), v66 (ref)
        local l_watermark_1 = v67.info.watermark;
        local l_window_0 = v387.window;
        local v602 = l_watermark_1.pos:get();
        local v603 = l_watermark_1.render_mode:get();
        if v602 == "Custom" then
            l_window_0:set_position(vector(l_watermark_1.custom_x:get(), l_watermark_1.custom_y:get()));
        else
            local l_x_0 = v66.x;
            local l_y_0 = v66.y;
            local v606 = l_watermark_1.text:get();
            if v603 == 1 then
                v606 = "GODSENSE [SECRET]";
            end;
            if not v606 or v606 == "" or v606.gsub(v606, " ", "") == "" then
                return;
            else
                local v607 = ({
                    Pixel = 2, 
                    Default = 1, 
                    Console = 3, 
                    Bold = 4
                })[l_watermark_1.font:get()] or 1;
                local v608 = render.measure_text(v607, nil, v606);
                if v602 == "Left" then
                    l_window_0:set_position(vector(10, l_y_0 / 2 - v608.y / 2));
                elseif v602 == "Right" then
                    l_window_0:set_position(vector(l_x_0 - v608.x - 15, l_y_0 / 2 - v608.y / 2));
                elseif v602 == "Bottom" then
                    l_window_0:set_position(vector(l_x_0 / 2 - v608.x / 2, l_y_0 - v608.y - 10));
                end;
            end;
        end;
    end;
    v387.frame = function()
        -- upvalues: v67 (ref), v387 (ref), v609 (ref), l_v391_1 (ref), l_v388_3 (ref)
        if not v67 or not v67.info or not v67.info.watermark then
            return;
        else
            local l_window_1 = v387.window;
            local l_watermark_2 = v67.info.watermark;
            local v612 = l_watermark_2.render_mode:get();
            local v613 = l_watermark_2.text:get();
            if v612 == 1 then
                v613 = "GODSENSE [SECRET]";
            end;
            if not v613 or v613 == "" or v613.gsub(v613, " ", "") == "" then
                return;
            else
                local v614 = ({
                    Pixel = 2, 
                    Default = 1, 
                    Console = 3, 
                    Bold = 4
                })[l_watermark_2.font:get()] or 1;
                local v615 = l_watermark_2.pos:get();
                if v615 ~= "Custom" then
                    v609();
                elseif not l_window_1:is_dragging() then
                    l_window_1:set_position(vector(l_watermark_2.custom_x:get(), l_watermark_2.custom_y:get()));
                end;
                local v616, v617 = l_v391_1();
                if l_watermark_2.font:get() == "Console" and v612 == 0 and mode ~= "Rainbow" and mode ~= "Encoding" and mode ~= "Pulse" then
                    local v618 = "";
                    local v619 = 1;
                    while v619 <= #v616 do
                        if v616:sub(v619, v619 + 1) == "\a" and v619 + 7 <= #v616 then
                            v618 = v618 .. "\a" .. v616:sub(v619 + 1, v619 + 6);
                            v619 = v619 + 7;
                            while v619 <= #v616 and v616:sub(v619, v619 + 1) ~= "\a" do
                                local v620 = v616:sub(v619, v619);
                                local v621 = v620:byte(1);
                                if (v621 == 208 or v621 == 209) and v619 + 1 <= #v616 then
                                    v618 = v618 .. v616:sub(v619, v619 + 1):upper();
                                    v619 = v619 + 2;
                                else
                                    v618 = v618 .. v620:upper();
                                    v619 = v619 + 1;
                                end;
                            end;
                        else
                            local v622 = v616:sub(v619, v619);
                            local v623 = v622:byte(1);
                            if (v623 == 208 or v623 == 209) and v619 + 1 <= #v616 then
                                v618 = v618 .. v616:sub(v619, v619 + 1):upper();
                                v619 = v619 + 2;
                            else
                                v618 = v618 .. v622:upper();
                                v619 = v619 + 1;
                            end;
                        end;
                    end;
                    v616 = v618;
                end;
                local v624 = l_window_1:is_dragging();
                local v625 = render.measure_text(v614, nil, v616);
                l_v388_3(0.05, v624 and 0.6 or 1);
                local l_position_0 = l_window_1.position;
                if v615 == "Custom" and v624 then
                    l_watermark_2.custom_x:set(l_position_0.x);
                    l_watermark_2.custom_y:set(l_position_0.y);
                end;
                local v627 = color(v617.r, v617.g, v617.b, v617.a * l_v388_3.value);
                render.text(v614, l_position_0, v627, nil, v616);
                l_window_1:update(v625);
                return;
            end;
        end;
    end;
    events.render:set(function()
        -- upvalues: v387 (ref)
        v387.frame();
    end);
end;
v388 = nil;
v389 = function()
    -- upvalues: v67 (ref), v63 (ref)
    if ui.get_alpha() <= 0 then
        return;
    else
        local v628 = "g o d s e n s e  {  }";
        local v629 = 3;
        local v630 = v67.info.watermark.render_mode:get();
        if v67.info.watermark.mode_color:get() == 0 then
            local v631 = v67.info.watermark.static_color:get():to_hex();
            local v632 = "\a" .. v631 .. point;
            ui.sidebar("\a" .. v631 .. v628, v632);
        else
            local v633 = nil;
            local v634 = nil;
            if v630 == 1 then
                v633 = v67.info.watermark.gradient_color:get("First")[1];
                v634 = v67.info.watermark.gradient_color:get("Second")[1];
            else
                v633 = v67.info.watermark.gradient_color:get("First")[1];
                v634 = v67.info.watermark.gradient_color:get("Second")[1];
            end;
            local v635 = (math.sin(globals.realtime * v629) + 1) / 2;
            local v636 = "\a" .. v633.lerp(v633, v634, math.clamp(v635, 0, 1)):to_hex() .. point;
            local v637 = v63:animate(v629, v633, v634, v628);
            ui.sidebar(v637, v636);
        end;
        return;
    end;
end;
events.render(v389);
v389 = nil;
v390 = l_smoothy_0.new(0);
v391 = l_smoothy_0.new(0);
local v638 = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay");
do
    local l_v390_4, l_v391_2, l_v638_0 = v390, v391, v638;
    local function v652()
        -- upvalues: v67 (ref), l_v390_4 (ref), l_v391_2 (ref), l_v638_0 (ref), v66 (ref)
        local v642 = entity.get_local_player();
        if v642 == nil or not v642:is_alive() then
            return;
        elseif v642:get_player_weapon() == nil then
            return;
        else
            local v643 = v67.misc.visuals.scope_overlay.switch:get();
            local l_m_bIsScoped_0 = v642.m_bIsScoped;
            l_v390_4(0.05, v643);
            l_v391_2(0.05, v643 and l_m_bIsScoped_0);
            if l_v390_4.value <= 0 then
                l_v638_0:override();
                return;
            else
                l_v638_0:override("Remove All");
                local v645 = l_v390_4.value * l_v391_2.value;
                local v646 = v66 * 0.5;
                local v647 = v67.misc.visuals.scope_overlay.gap:get() * v66.y * (1 / v66.y);
                local v648 = v67.misc.visuals.scope_overlay.length:get() * v66.y * (1 / v66.y);
                v647 = math.floor(v647);
                v648 = math.floor(v648);
                local v649 = v648 - v647;
                local v650 = v67.misc.visuals.scope_overlay.colors.main:get();
                local v651 = v67.misc.visuals.scope_overlay.colors.edge:get();
                if v67.misc.visuals.scope_overlay.options:get(1) then
                    v650 = v67.misc.visuals.scope_overlay.colors.edge:get();
                    v651 = v67.misc.visuals.scope_overlay.colors.main:get();
                end;
                v650.a = v650.a * v645;
                v651.a = v651.a * v645;
                render.gradient(vector(v646.x, v646.y - v647 + 1), vector(v646.x + 1, v646.y - v648 * v645), v650, v650, v651, v651);
                render.gradient(vector(v646.x, v646.y + v647), vector(v646.x + 1, v646.y + v648 * v645), v650, v650, v651, v651);
                render.gradient(vector(v646.x - v647 + 1, v646.y), vector(v646.x - v647 + 1 - v649 * v645, v646.y + 1), v650, v651, v650, v651);
                render.gradient(vector(v646.x + v647, v646.y), vector(v646.x + v647 + v649 * v645 + 1, v646.y + 1), v650, v651, v650, v651);
                if should_rotate then
                    render.pop_rotation();
                end;
                return;
            end;
        end;
    end;
    events.render(v652);
end;
v390 = nil;
v391 = {
    Left = {
        text = v67.misc.visuals.manual_arrows.symbols.left, 
        size = vector(-10, 0), 
        alpha = l_smoothy_0.new(0)
    }, 
    Right = {
        text = v67.misc.visuals.manual_arrows.symbols.right, 
        size = vector(12, 0), 
        alpha = l_smoothy_0.new(0)
    }, 
    Forward = {
        text = v67.misc.visuals.manual_arrows.symbols.forward, 
        size = vector(0, -10), 
        alpha = l_smoothy_0.new(0)
    }
};
do
    local l_v391_3 = v391;
    v638 = function()
        -- upvalues: v67 (ref), l_v391_3 (ref)
        local v654 = entity.get_local_player();
        if v654 == nil or not v654:is_alive() then
            return;
        else
            local v655 = render.screen_size() / 2;
            local v656 = v67.misc.visuals.manual_arrows.switch:get();
            local v657 = v67.antiaim.main.extra.addon_aa.manuals.side:get();
            local v658 = ({
                Bold = 4, 
                Default = 1, 
                Console = 3, 
                Small = 2
            })[v67.misc.visuals.manual_arrows.font:get()];
            local v659 = v67.misc.visuals.manual_arrows.color:get();
            local v660 = v67.misc.visuals.manual_arrows.offset:get();
            local v661 = {
                Left = vector(-v660, 0), 
                Right = vector(v660, 0), 
                Forward = vector(0, -v660)
            };
            for v662, v663 in pairs(l_v391_3) do
                v663.alpha(0.04, v657 == v662 and v656);
                if v663.alpha.value > 0 then
                    local l_value_0 = v663.alpha.value;
                    if l_value_0 > 0 then
                        render.text(v658, v655 + v663.size + v661[v662], v659:alpha_modulate(l_value_0 * v659.a), "c", v663.text:get());
                    end;
                end;
            end;
            return;
        end;
    end;
    events.render(v638);
end;
v391 = nil;
v638 = {
    wait_time = 0.4, 
    time2 = globals.realtime, 
    time = globals.realtime, 
    alpha = l_smoothy_0.new(0)
};
do
    local l_v638_1 = v638;
    local function v672(v666)
        -- upvalues: v67 (ref), l_v638_1 (ref), l_smoothy_0 (ref)
        if v666.state ~= nil then
            return;
        else
            local v667 = v67.misc.visuals.hitmarker.time:get() / 10;
            local v668 = v67.misc.visuals.hitmarker.time2:get() / 10;
            local v669 = globals.realtime + v667;
            local v670 = globals.realtime + v668;
            local l_aim_0 = v666.aim;
            l_v638_1 = {
                time2 = v670, 
                time = v669, 
                point = l_aim_0, 
                alpha = l_smoothy_0.new(0)
            };
            return;
        end;
    end;
    local function v686()
        -- upvalues: v67 (ref), v66 (ref), l_v638_1 (ref)
        local v673 = entity.get_local_player();
        if v673 == nil then
            return;
        else
            local l_select_0 = v67.misc.visuals.hitmarker.select;
            local v675 = v66 / 2;
            local v676 = v67.misc.visuals.hitmarker.color:get();
            local v677 = v67.misc.visuals.hitmarker.color2:get();
            l_v638_1.alpha(0.025, globals.realtime <= l_v638_1.time and v673:is_alive());
            if l_v638_1.alpha.value <= 0 then
                return;
            else
                local l_value_1 = l_v638_1.alpha.value;
                if l_select_0:get(1) then
                    local v679 = v676:alpha_modulate(v676.a * l_value_1);
                    local v680 = 5;
                    local v681 = 10;
                    render.line(v675 + vector(v680, v680), v675 + vector(v681 / v66.x * v66.x, v681 / v66.y * v66.y), v679);
                    render.line(v675 - vector(v680, -v680), v675 - vector(v681 / v66.x * v66.x, -(v681 / v66.y) * v66.y), v679);
                    render.line(v675 - vector(v680, v680), v675 - vector(v681 / v66.x * v66.x, v681 / v66.y * v66.y), v679);
                    render.line(v675 + vector(v680, -v680), v675 + vector(v681 / v66.x * v66.x, -(v681 / v66.y) * v66.y), v679);
                end;
                if l_select_0:get(2) then
                    l_v638_1.alpha(0.025, globals.realtime <= l_v638_1.time2 and v673:is_alive());
                    local v682 = v677:alpha_modulate(v677.a * l_value_1);
                    local l_point_0 = l_v638_1.point;
                    if l_point_0 == nil then
                        return;
                    else
                        local v684 = l_point_0:to_screen();
                        local v685 = 5;
                        if v684 and v684.x then
                            render.rect(v684 - vector(v685, 0), v684 + vector(v685, 0), v682);
                            render.rect(v684 - vector(0, v685), v684 + vector(0, v685), v682);
                        end;
                    end;
                end;
                return;
            end;
        end;
    end;
    events.aim_ack(v672);
    events.render(v686);
end;
v638 = nil;
local function v689(v687)
    -- upvalues: v67 (ref)
    local v688 = entity.get_local_player();
    if v688 == nil or not v688:is_alive() then
        return v687;
    elseif not v67.misc.visuals.player_transparency.switch:get() then
        return v687;
    else
        if v688.m_bIsScoped or v688.m_bResumeZoom then
            v687 = 59;
        end;
        return v687;
    end;
end;
events.localplayer_transparency(v689);
v689 = nil;
local v690 = ui.find("Visuals", "World", "Main", "Force Thirdperson");
do
    local l_v690_0 = v690;
    local function v694(v692)
        -- upvalues: v67 (ref), l_v690_0 (ref)
        local v693 = entity.get_local_player();
        if v693 == nil or not v693:is_alive() then
            return;
        elseif not v67.misc.visuals.remove_sleeves.switch:get() then
            return;
        elseif l_v690_0:get() or l_v690_0:get_override() then
            return;
        elseif v692.name:find("sleeve") then
            return false;
        else
            return true;
        end;
    end;
    events.draw_model(v694);
end;
v690 = nil;
local v695 = render.screen_size();
local v696 = render.load_font("Verdana", 10, "ad");
do
    local l_v695_0, l_v696_0 = v695, v696;
    events.render:set(function()
        -- upvalues: v67 (ref), l_v696_0 (ref), l_v695_0 (ref)
        if not v67.misc.visuals.dmg_indicator.switch:get() then
            return;
        else
            local v699 = entity.get_local_player();
            if not v699 or v699.m_iHealth <= 0 then
                return;
            else
                local v700 = v67.misc.visuals.dmg_indicator.mode:get();
                local v701 = ui.get_binds();
                for _, v703 in pairs(v701) do
                    if v703.name == "Min. Damage" and v703.active then
                        if v700 == "Advanced" then
                            render.text(l_v696_0, vector(l_v695_0.x / 2 + 5, l_v695_0.y / 2 - 15), color(), "", v703.value);
                            break;
                        elseif v700 == "Default" then
                            render.text(1, vector(l_v695_0.x / 2 + 4, l_v695_0.y / 2 - 15), color(), "", v703.value);
                            break;
                        else
                            break;
                        end;
                    end;
                end;
                return;
            end;
        end;
    end);
end;
v695 = nil;
v696 = false;
local function v709(v704, v705)
    -- upvalues: v67 (ref)
    if not v67.misc.movement.no_fall_damage:get() then
        return false;
    else
        local v706 = v704:get_origin();
        local l_pi_0 = math.pi;
        for v708 = 0, l_pi_0 * 2, l_pi_0 / 4 do
            if utils.trace_line(v706, v706 + vector(10 * math.cos(v708), 10 * math.sin(v708), -v705), v704).fraction < 0.9921875 then
                return true;
            end;
        end;
        return false;
    end;
end;
do
    local l_v696_1, l_v709_0 = v696, v709;
    local function v714(v712)
        -- upvalues: v67 (ref), l_v696_1 (ref), l_v709_0 (ref)
        if not v67.misc.movement.no_fall_damage:get() then
            return false;
        else
            local v713 = entity.get_local_player();
            if v713 == nil or not v713:is_alive() then
                return;
            elseif v713.m_vecVelocity.z >= -500 then
                l_v696_1 = false;
                return;
            else
                v712.in_duck = not l_v709_0(v713, 15) and l_v709_0(v713, 75);
                return;
            end;
        end;
    end;
    events.createmove(v714);
end;
v696 = nil;
v709 = function(v715)
    if render.camera_angles().x < 45 and v715.forwardmove ~= 0 then
        local v716 = v715.forwardmove > 0;
        v715.view_angles.x = 89;
        local v717 = v716 and 0 or 1;
        v715.in_back = v716 and 1 or 0;
        v715.in_forward = v717;
        v717 = v716 and 0 or 1;
        v715.in_moveright = v716 and 1 or 0;
        v715.in_moveleft = v717;
        if v715.sidemove == 0 then
            v715.view_angles.y = v715.view_angles.y + 90;
        elseif v715.sidemove < 0 then
            v715.view_angles.y = v715.view_angles.y + (v716 and 150 or 30);
        elseif v715.sidemove > 0 then
            v715.view_angles.y = v715.view_angles.y + (v716 and 30 or 150);
        end;
    end;
end;
do
    local l_v709_1 = v709;
    local function v721(v719)
        -- upvalues: v67 (ref), l_v709_1 (ref)
        if not v67.misc.movement.fast_ladder:get() then
            return;
        else
            local v720 = entity.get_local_player();
            if not v720 or v720.m_MoveType ~= 9 then
                return;
            else
                l_v709_1(v719);
                return;
            end;
        end;
    end;
    events.createmove:set(v721);
end;
v709 = nil;
local function v723(v722)
    return v722:simulate_movement(v722.m_vecOrigin, v722.m_vecVelocity, v722.m_fFlags);
end;
do
    local l_v723_0 = v723;
    local function v728(v725)
        -- upvalues: v67 (ref), l_v723_0 (ref)
        if not v67.misc.movement.edge_quick_stop:get() then
            return;
        else
            local v726 = entity.get_local_player();
            if v726 == nil or not v726:is_alive() then
                return;
            elseif v726.m_MoveType == 9 or v726.m_MoveType == 8 then
                return;
            else
                local v727 = l_v723_0(v726);
                v727:think(4);
                if v727.velocity.z < 0 then
                    v725.block_movement = 2;
                end;
                return;
            end;
        end;
    end;
    events.createmove(v728);
end;
preset:init();
l_pui_0.setup(v67);
