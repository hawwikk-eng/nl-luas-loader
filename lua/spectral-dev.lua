local l_base64_0 = require("neverlose/base64");
local l_smoothy_0 = require("neverlose/smoothy");
local _ = require("neverlose/inspect");
local v3 = "\226\128\138";
local v4 = nil;
v4 = {
    name = "Spectral", 
    build = "Dev", 
    date = "01.01.25", 
    user = common.get_username()
};
local function v6(v5)
    return math.floor(0.5 + v5);
end;
local v7 = nil;
v7 = {
    rage = {
        main = {
            enabled = {
                ui.find("Aimbot", "Ragebot", "Main", "Enabled"), 
                ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot")
            }, 
            hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
            double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
            hide_shots_options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
            double_tap_lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options")
        }, 
        selection = {
            min_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
        }
    }, 
    aa = {
        angles = {
            enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
            pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
            yaw = {
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden")
            }, 
            yaw_modifier = {
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset")
            }, 
            body_yaw = {
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
            }, 
            freestanding = {
                ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding")
            }, 
            extended_angles = {
                ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll")
            }
        }, 
        misc = {
            fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
            slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
            leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
        }
    }, 
    visuals = {
        world = {
            main = {
                force_thirdperson = {
                    ui.find("Visuals", "World", "Main", "Force Thirdperson"), 
                    ui.find("Visuals", "World", "Main", "Force Thirdperson", "Distance")
                }, 
                scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
            }, 
            other = {
                world_marker = ui.find("Visuals", "World", "Other", "Hit Marker", "3D Marker"), 
                damage_marker = ui.find("Visuals", "World", "Other", "Hit Marker", "Damage Marker"), 
                grenade_prediction = {
                    color = ui.find("Visuals", "World", "Other", "Grenade Prediction", "Color"), 
                    color_hit = {
                        ui.find("Visuals", "World", "Other", "Grenade Prediction", "Color Hit")
                    }
                }
            }
        }
    }, 
    misc = {
        main = {
            in_game = {
                clan_tag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag")
            }, 
            other = {
                weapon_actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions")
            }
        }
    }
};
local v8 = nil;
v8 = {};
local v9 = ffi.typeof("char[?]");
local v10 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 7, "int(__thiscall*)(void*)");
local v11 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 9, "void(__thiscall*)(void*, const char*, int)");
local v12 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 11, "int(__thiscall*)(void*, int, const char*, int)");
do
    local l_v9_0, l_v10_0, l_v11_0, l_v12_0 = v9, v10, v11, v12;
    v8.get = function()
        -- upvalues: l_v10_0 (ref), l_v9_0 (ref), l_v12_0 (ref)
        local v17 = l_v10_0();
        if v17 > 0 then
            local v18 = l_v9_0(v17);
            l_v12_0(0, v18, v17);
            return ffi.string(v18, v17 - 1);
        else
            return "";
        end;
    end;
    v8.set = function(...)
        -- upvalues: l_v11_0 (ref)
        local v19 = table.concat({
            ...
        });
        local v20 = string.len(v19);
        l_v11_0(v19, v20);
    end;
end;
v9 = nil;
v9 = {};
v10 = function(v21)
    local v22 = {};
    local v23 = 0;
    for v24 in v21:gmatch(".[\128-\191]*") do
        v23 = v23 + 1;
        v22[v23] = v24;
    end;
    return v22, v23;
end;
do
    local l_v10_1 = v10;
    v9.wave = function(v26, v27, v28, v29)
        -- upvalues: l_v10_1 (ref)
        if not v29 then
            v29 = globals.realtime;
        end;
        local v30 = {};
        local v31, v32 = l_v10_1(v26);
        local v33 = 1 / (v32 - 1);
        local v34 = v28.r - v27.r;
        local v35 = v28.g - v27.g;
        local v36 = v28.b - v27.b;
        local v37 = v28.a - v27.a;
        local v38 = color():alpha_modulate(255);
        for v39 = 1, v32 do
            local v40 = math.abs((v29 - 1) % 2 - 1);
            v38.r = v27.r + v34 * v40;
            v38.g = v27.g + v35 * v40;
            v38.b = v27.b + v36 * v40;
            v38.a = v27.a + v37 * v40;
            local v41 = "\a" .. v38:to_hex() .. v31[v39];
            table.insert(v30, v41);
            v29 = v29 + v33;
        end;
        return table.concat(v30);
    end;
end;
v10 = nil;
v10 = {};
v11 = v4.name:lower();
v12 = "ui/beepclear.wav";
local v42 = "resource/warning.wav";
local l_playvol_0 = cvar.playvol;
do
    local l_v11_1, l_v12_1, l_v42_0, l_l_playvol_0_0 = v11, v12, v42, l_playvol_0;
    local function v49(v48)
        -- upvalues: l_v11_1 (ref)
        if v48 == nil then
            v48 = "{Link Active}";
        end;
        return "[" .. "\a" .. v48 .. l_v11_1 .. "\aDEFAULT" .. "]";
    end;
    v10.err = function(v50, ...)
        -- upvalues: v49 (ref), l_l_playvol_0_0 (ref), l_v42_0 (ref)
        local v51 = table.concat({
            nil, 
            "", 
            [1] = v49(), 
            v50, 
            ...
        });
        print_raw(v51);
        l_l_playvol_0_0:call(l_v42_0, 1);
    end;
    v10.msg = function(v52, ...)
        -- upvalues: v49 (ref), l_l_playvol_0_0 (ref), l_v12_1 (ref)
        local v53 = table.concat({
            nil, 
            " ", 
            [1] = v49(), 
            v52, 
            ...
        });
        print_raw(v53);
        l_l_playvol_0_0:call(l_v12_1, 1);
    end;
    v10.raw = function(v54, ...)
        -- upvalues: v49 (ref)
        local v55 = table.concat({
            nil, 
            " ", 
            [1] = v49(), 
            v54, 
            ...
        });
        print_raw(v55);
    end;
end;
v11 = nil;
v11 = {};
v12 = v4.name:lower() .. "-db";
v42 = db[v12] or {};
do
    local l_v12_2, l_v42_1 = v12, v42;
    v11.get = function(v58)
        -- upvalues: l_v42_1 (ref)
        return l_v42_1[v58];
    end;
    v11.set = function(v59, v60)
        -- upvalues: l_v42_1 (ref)
        l_v42_1[v59] = v60;
    end;
    v11.flush = function()
        -- upvalues: l_v42_1 (ref), l_v12_2 (ref)
        l_v42_1 = {};
        db[l_v12_2] = {};
    end;
    l_playvol_0 = function()
        -- upvalues: l_v12_2 (ref), l_v42_1 (ref)
        db[l_v12_2] = l_v42_1;
    end;
    events.shutdown(l_playvol_0);
end;
v12 = nil;
v12 = {};
v42 = 0;
l_playvol_0 = 0;
v12.is_onground = false;
v12.is_moving = false;
v12.is_crouched = false;
v12.abs_body_yaw = 0;
v12.velocity2d = 0;
v12.duck_amount = 0;
v12.eye_position = vector();
v12.team_num = 0;
v12.sent_packets = 0;
local function v65(v61, v62)
    local v63 = v61:get_anim_state();
    if v63 == nil then
        return 0;
    else
        local v64 = math.normalize_yaw(v63.eye_yaw - v63.abs_yaw);
        if v62 ~= nil then
            v64 = math.clamp(v64, -v62, v62);
        end;
        return v64;
    end;
end;
do
    local l_v42_2, l_l_playvol_0_1, l_v65_0 = v42, l_playvol_0, v65;
    local function v72(v69)
        -- upvalues: l_v42_2 (ref), v12 (ref), l_v65_0 (ref)
        local v70 = entity.get_local_player();
        if v70 == nil then
            return;
        else
            l_v42_2 = v70.m_fFlags;
            v12.velocity2d = v70.m_vecVelocity:length2d();
            if v69.choked_commands == 0 then
                local v71 = rage.antiaim:get_max_desync();
                v12.max_body_yaw = v71;
                v12.abs_body_yaw = l_v65_0(v70, v71);
                v12.duck_amount = v70.m_flDuckAmount;
                v12.eye_position = v70:get_eye_position();
                v12.sent_packets = v12.sent_packets + 1;
            end;
            v12.is_moving = v12.velocity2d > 3.63;
            v12.is_crouched = v12.duck_amount > 0;
            v12.team_num = v70.m_iTeamNum;
            return;
        end;
    end;
    local function v75(_)
        -- upvalues: l_l_playvol_0_1 (ref), v12 (ref), l_v42_2 (ref)
        local v74 = entity.get_local_player();
        if v74 == nil then
            return;
        else
            l_l_playvol_0_1 = v74.m_fFlags;
            v12.is_onground = bit.band(l_v42_2, 1) == 1 and bit.band(l_l_playvol_0_1, 1) == 1;
            return;
        end;
    end;
    events.createmove(v72);
    events.createmove_run(v75);
end;
v42 = nil;
v42 = {};
l_playvol_0 = 0;
v42.max_defensive_ticks = 0;
v42.defensive_ticks = 0;
do
    local l_l_playvol_0_2, l_v65_1 = l_playvol_0, v65;
    l_v65_1 = function(v78)
        -- upvalues: l_l_playvol_0_2 (ref), v42 (ref)
        local l_m_nTickBase_0 = v78.m_nTickBase;
        if math.abs(l_m_nTickBase_0 - l_l_playvol_0_2) > 64 then
            l_l_playvol_0_2 = 0;
        end;
        local v80 = 0;
        if l_l_playvol_0_2 < l_m_nTickBase_0 then
            l_l_playvol_0_2 = l_m_nTickBase_0;
        elseif l_m_nTickBase_0 < l_l_playvol_0_2 then
            v80 = math.min(14, math.max(0, l_l_playvol_0_2 - l_m_nTickBase_0 - 1));
        end;
        if v80 > 0 then
            if v42.max_defensive_ticks == 0 then
                v42.max_defensive_ticks = v80;
            end;
            v42.defensive_ticks = v80;
        else
            v42.defensive_ticks = 0;
            v42.max_defensive_ticks = 0;
        end;
    end;
    local function v82()
        -- upvalues: l_v65_1 (ref)
        local v81 = entity.get_local_player();
        if v81 == nil then
            return;
        else
            l_v65_1(v81);
            return;
        end;
    end;
    events.createmove(v82);
end;
l_playvol_0 = nil;
l_playvol_0 = {};
v65 = nil;
local function v83()
    -- upvalues: v12 (ref), v7 (ref)
    if v12.is_onground then
        if v7.aa.misc.slow_walk:get() then
            return "Slow Walk";
        elseif not v12.is_moving then
            if v12.is_crouched then
                return "Crouch";
            else
                return "Standing";
            end;
        elseif v12.is_crouched then
            return "Crouch Move";
        else
            return "Moving";
        end;
    else
        return v12.is_crouched and "Air Crouch" or "Air";
    end;
end;
do
    local l_v65_2, l_v83_0 = v65, v83;
    local function v86()
        -- upvalues: l_v65_2 (ref), l_v83_0 (ref)
        l_v65_2 = l_v83_0();
    end;
    l_playvol_0.get = function()
        -- upvalues: l_v65_2 (ref)
        return l_v65_2;
    end;
    events.createmove(v86);
end;
v65 = nil;
v65 = {};
v83 = {};
local v87 = {};
local function v90(v88, v89)
    return v88:lower() .. "::" .. v89;
end;
local function v95(...)
    local v91 = {};
    local v92 = true;
    local v93 = select("#", ...);
    if v93 > 0 then
        for v94 = 1, v93 do
            v91[select(v94, ...)] = v94;
        end;
        v92 = false;
    end;
    return v91, v92;
end;
local function v105(v96)
    if v96:type() == "color_picker" then
        local v97 = v96:list();
        local v98 = {
            v96:get()
        };
        if v97[1] == "" then
            return {
                "", 
                v98:to_hex()
            };
        else
            local v99 = {};
            for v100 = 1, #v97 do
                local v101 = v97[v100];
                local v102 = v96:get(v101);
                local v103 = {};
                for v104 = 1, #v102 do
                    v103[v104] = v102[v104]:to_hex();
                end;
                v99[v101] = v103;
            end;
            return {
                [1] = v98[1], 
                [2] = v99
            };
        end;
    else
        return {
            v96:get()
        };
    end;
end;
local function v112(v106, v107)
    if v106:type() == "color_picker" then
        if v107[1] == "" then
            v106:set(color(v107[2]));
            return;
        else
            for v108, v109 in pairs(v107[2]) do
                local v110 = {};
                for v111 = 1, #v109 do
                    v110[v111] = color(v109[v111]);
                end;
                v106:set(v108, v110);
            end;
            v106:set(v107[1]);
            return;
        end;
    else
        v106:set(unpack(v107));
        return;
    end;
end;
v65.encode = function(v113)
    -- upvalues: l_base64_0 (ref)
    local l_status_0, l_result_0 = pcall(json.stringify, v113);
    if not l_status_0 then
        return false, l_result_0;
    else
        local l_status_1, l_result_1 = pcall(l_base64_0.encode, l_result_0);
        if not l_status_1 then
            return false, l_result_1;
        else
            return true, l_result_1;
        end;
    end;
end;
v65.decode = function(v118)
    -- upvalues: l_base64_0 (ref)
    local l_status_2, l_result_2 = pcall(l_base64_0.decode, v118);
    if not l_status_2 then
        return false, l_result_2;
    else
        local l_status_3, l_result_3 = pcall(json.parse, l_result_2);
        if not l_status_3 then
            return false, l_result_3;
        else
            return true, l_result_3;
        end;
    end;
end;
do
    local l_v83_1, l_v87_0, l_v90_0, l_v95_0, l_v105_0, l_v112_0 = v83, v87, v90, v95, v105, v112;
    v65.import = function(v129, ...)
        -- upvalues: l_v95_0 (ref), l_v87_0 (ref), l_v112_0 (ref)
        local v130, v131 = l_v95_0(...);
        for v132, v133 in pairs(v129) do
            local v134 = l_v87_0[v132];
            if v134 ~= nil and (v131 or v130[v134.category]) then
                l_v112_0(v134.ref, v133);
            end;
        end;
        return true;
    end;
    v65.export = function(...)
        -- upvalues: l_v95_0 (ref), l_v83_1 (ref), l_v105_0 (ref)
        local v135 = {};
        local v136, v137 = l_v95_0(...);
        for v138 = 1, #l_v83_1 do
            local v139 = l_v83_1[v138];
            local l_ref_0 = v139.ref;
            local l_hash_0 = v139.hash;
            local l_category_0 = v139.category;
            if v137 or v136[l_category_0] then
                local l_status_4, l_result_4 = pcall(l_v105_0, l_ref_0);
                if l_status_4 then
                    v135[l_hash_0] = l_result_4;
                end;
            end;
        end;
        return true, v135;
    end;
    v65.push = function(v145, v146, v147)
        -- upvalues: l_v90_0 (ref), l_v87_0 (ref), v10 (ref), l_v83_1 (ref)
        local v148 = l_v90_0(v145, v146);
        local v149 = {
            ref = v147, 
            hash = v148, 
            category = v145
        };
        if l_v87_0[v148] == nil then
            l_v87_0[v148] = v149;
        else
            v10.err("Found config collision: \"" .. v146 .. "\" for \"" .. v147:name() .. "\" item");
        end;
        table.insert(l_v83_1, v149);
        return v147;
    end;
end;
v83 = nil;
v83 = {};
v87 = "everlast-presets";
v90 = {};
v95 = {};
v105 = db[v87] or {};
v112 = function(v150)
    return string.match(v150, "^()%s*$") and "" or string.match(v150, "^%s*(.*%S)");
end;
local function v156(v151, v152)
    -- upvalues: v65 (ref)
    local v153 = {};
    if type(v152) == "string" then
        local v154, v155 = v65.decode(v152);
        if not v154 then
            return nil;
        else
            v152 = v155;
        end;
    end;
    v153.name = v151;
    v153.content = v152;
    return v153;
end;
do
    local l_v87_1, l_v90_1, l_v95_1, l_v105_1, l_v112_1, l_v156_0 = v87, v90, v95, v105, v112, v156;
    local function v166(v163)
        -- upvalues: v65 (ref), l_v156_0 (ref)
        local v164, v165 = v65.export();
        if not v164 then
            return nil;
        else
            return l_v156_0(v163, v165);
        end;
    end;
    local function v170(v167)
        -- upvalues: l_v95_1 (ref)
        for v168 = #l_v95_1, 1, -1 do
            local v169 = l_v95_1[v168];
            if v169.name == v167 then
                return v169, v168;
            end;
        end;
        return nil, -1;
    end;
    local function v171()
        -- upvalues: l_v87_1 (ref), l_v105_1 (ref)
        db[l_v87_1] = l_v105_1;
    end;
    v83.load = function(v172)
        -- upvalues: l_v112_1 (ref), v170 (ref), v65 (ref), v10 (ref)
        v172 = l_v112_1(v172);
        local v173 = v170(v172);
        if v173 == nil or v173.content == nil then
            return;
        elseif not v65.import(v173.content) then
            return;
        else
            v10.msg("Config loaded");
            return;
        end;
    end;
    v83.save = function(v174)
        -- upvalues: l_v112_1 (ref), v170 (ref), v166 (ref), l_v105_1 (ref), l_v90_1 (ref), v65 (ref), v171 (ref)
        v174 = l_v112_1(v174);
        local v175, v176 = v170(v174);
        if v175 == nil then
            local v177 = v166(v174);
            if v177 == nil then
                return false, "Unable to create new preset";
            else
                v175 = v177;
                table.insert(l_v105_1, v177);
            end;
        end;
        if v176 ~= -1 and v176 <= #l_v90_1 then
            return false, "Can't modify in-built preset";
        else
            local v178, v179 = v65.export();
            if not v178 then
                return false, "Unable to export config";
            else
                v175.content = v179;
                v171();
                return true, nil;
            end;
        end;
    end;
    v83.delete = function(v180)
        -- upvalues: l_v112_1 (ref), v170 (ref), l_v90_1 (ref), l_v105_1 (ref)
        v180 = l_v112_1(v180);
        local _, v182 = v170(v180);
        if v182 ~= -1 and v182 <= #l_v90_1 then
            return false, "Can't delete in-built preset";
        else
            local v183 = v182 - #l_v90_1;
            table.remove(l_v105_1, v183);
            return true, nil;
        end;
    end;
    v83.get = function(v184)
        -- upvalues: l_v95_1 (ref)
        return l_v95_1[v184];
    end;
    v83.get_list = function()
        -- upvalues: l_v95_1 (ref), l_v90_1 (ref)
        local v185 = #l_v95_1;
        if v185 == 0 then
            return {
                [1] = "Profiles are empty"
            };
        else
            local v186 = {};
            for v187 = 1, v185 do
                local l_name_0 = l_v95_1[v187].name;
                if v187 <= #l_v90_1 then
                    l_name_0 = "\a{Link Active}" .. ui.get_icon("sparkles") .. "  " .. "\aDEFAULT" .. l_name_0;
                end;
                v186[v187] = l_name_0;
            end;
            return v186;
        end;
    end;
    v83.update_data = function()
        -- upvalues: l_v95_1 (ref), l_v90_1 (ref), l_v105_1 (ref)
        l_v95_1 = {};
        for v189 = 1, #l_v90_1 do
            table.insert(l_v95_1, l_v90_1[v189]);
        end;
        table.sort(l_v105_1, function(v190, v191)
            return v190.name < v191.name;
        end);
        for v192 = 1, #l_v105_1 do
            table.insert(l_v95_1, l_v105_1[v192]);
        end;
    end;
    table.insert(l_v90_1, l_v156_0("Author", "eyJhbnRpLWFpbTo6QWlyIENyb3VjaF9ib2R5X3lhdyI6W3RydWVdLCJhbnRpLWFpbTo6QWlyIENyb3VjaF9kZWxheSI6WzAuMF0sImFudGktYWltOjpBaXIgQ3JvdWNoX2VuYWJsZWQiOlt0cnVlXSwiYW50aS1haW06OkFpciBDcm91Y2hfZnJlZXN0YW5kaW5nIjpbIk9mZiJdLCJhbnRpLWFpbTo6QWlyIENyb3VjaF9sZWZ0X2xpbWl0IjpbNjAuMF0sImFudGktYWltOjpBaXIgQ3JvdWNoX21vZGlmaWVyX29mZnNldCI6Wy01MS4wXSwiYW50aS1haW06OkFpciBDcm91Y2hfb3B0aW9ucyI6W1siSml0dGVyIl1dLCJhbnRpLWFpbTo6QWlyIENyb3VjaF9waXRjaCI6WyJEb3duIl0sImFudGktYWltOjpBaXIgQ3JvdWNoX3JpZ2h0X2xpbWl0IjpbNjAuMF0sImFudGktYWltOjpBaXIgQ3JvdWNoX3lhdyI6WyJCYWNrd2FyZCJdLCJhbnRpLWFpbTo6QWlyIENyb3VjaF95YXdfYmFzZSI6WyJBdCBUYXJnZXQiXSwiYW50aS1haW06OkFpciBDcm91Y2hfeWF3X2xlZnQiOlszLjBdLCJhbnRpLWFpbTo6QWlyIENyb3VjaF95YXdfbW9kaWZpZXIiOlsiQ2VudGVyIl0sImFudGktYWltOjpBaXIgQ3JvdWNoX3lhd19yaWdodCI6WzEzLjBdLCJhbnRpLWFpbTo6QWlyX2JvZHlfeWF3IjpbdHJ1ZV0sImFudGktYWltOjpBaXJfZGVsYXkiOlswLjBdLCJhbnRpLWFpbTo6QWlyX2VuYWJsZWQiOlt0cnVlXSwiYW50aS1haW06OkFpcl9mcmVlc3RhbmRpbmciOlsiT2ZmIl0sImFudGktYWltOjpBaXJfbGVmdF9saW1pdCI6WzYwLjBdLCJhbnRpLWFpbTo6QWlyX21vZGlmaWVyX29mZnNldCI6WzEzLjBdLCJhbnRpLWFpbTo6QWlyX29wdGlvbnMiOltbIkppdHRlciJdXSwiYW50aS1haW06OkFpcl9waXRjaCI6WyJEb3duIl0sImFudGktYWltOjpBaXJfcmlnaHRfbGltaXQiOls2MC4wXSwiYW50aS1haW06OkFpcl95YXciOlsiQmFja3dhcmQiXSwiYW50aS1haW06OkFpcl95YXdfYmFzZSI6WyJBdCBUYXJnZXQiXSwiYW50aS1haW06OkFpcl95YXdfbGVmdCI6Wy00MC4wXSwiYW50aS1haW06OkFpcl95YXdfbW9kaWZpZXIiOlsiQ2VudGVyIl0sImFudGktYWltOjpBaXJfeWF3X3JpZ2h0IjpbMzAuMF0sImFudGktYWltOjpDcm91Y2ggTW92ZV9ib2R5X3lhdyI6W3RydWVdLCJhbnRpLWFpbTo6Q3JvdWNoIE1vdmVfZGVsYXkiOls0LjBdLCJhbnRpLWFpbTo6Q3JvdWNoIE1vdmVfZW5hYmxlZCI6W3RydWVdLCJhbnRpLWFpbTo6Q3JvdWNoIE1vdmVfZnJlZXN0YW5kaW5nIjpbIk9mZiJdLCJhbnRpLWFpbTo6Q3JvdWNoIE1vdmVfbGVmdF9saW1pdCI6WzYwLjBdLCJhbnRpLWFpbTo6Q3JvdWNoIE1vdmVfbW9kaWZpZXJfb2Zmc2V0IjpbLTQ2LjBdLCJhbnRpLWFpbTo6Q3JvdWNoIE1vdmVfb3B0aW9ucyI6W1siSml0dGVyIl1dLCJhbnRpLWFpbTo6Q3JvdWNoIE1vdmVfcGl0Y2giOlsiRG93biJdLCJhbnRpLWFpbTo6Q3JvdWNoIE1vdmVfcmlnaHRfbGltaXQiOls2MC4wXSwiYW50aS1haW06OkNyb3VjaCBNb3ZlX3lhdyI6WyJCYWNrd2FyZCJdLCJhbnRpLWFpbTo6Q3JvdWNoIE1vdmVfeWF3X2Jhc2UiOlsiQXQgVGFyZ2V0Il0sImFudGktYWltOjpDcm91Y2ggTW92ZV95YXdfbGVmdCI6WzAuMF0sImFudGktYWltOjpDcm91Y2ggTW92ZV95YXdfbW9kaWZpZXIiOlsiQ2VudGVyIl0sImFudGktYWltOjpDcm91Y2ggTW92ZV95YXdfcmlnaHQiOlsxMy4wXSwiYW50aS1haW06OkNyb3VjaF9ib2R5X3lhdyI6W3RydWVdLCJhbnRpLWFpbTo6Q3JvdWNoX2RlbGF5IjpbMi4wXSwiYW50aS1haW06OkNyb3VjaF9lbmFibGVkIjpbdHJ1ZV0sImFudGktYWltOjpDcm91Y2hfZnJlZXN0YW5kaW5nIjpbIk9mZiJdLCJhbnRpLWFpbTo6Q3JvdWNoX2xlZnRfbGltaXQiOls2MC4wXSwiYW50aS1haW06OkNyb3VjaF9tb2RpZmllcl9vZmZzZXQiOls0Ni4wXSwiYW50aS1haW06OkNyb3VjaF9vcHRpb25zIjpbWyJKaXR0ZXIiXV0sImFudGktYWltOjpDcm91Y2hfcGl0Y2giOlsiRG93biJdLCJhbnRpLWFpbTo6Q3JvdWNoX3JpZ2h0X2xpbWl0IjpbNjAuMF0sImFudGktYWltOjpDcm91Y2hfeWF3IjpbIkJhY2t3YXJkIl0sImFudGktYWltOjpDcm91Y2hfeWF3X2Jhc2UiOlsiQXQgVGFyZ2V0Il0sImFudGktYWltOjpDcm91Y2hfeWF3X2xlZnQiOlstMTkuMF0sImFudGktYWltOjpDcm91Y2hfeWF3X21vZGlmaWVyIjpbIkRpc2FibGVkIl0sImFudGktYWltOjpDcm91Y2hfeWF3X3JpZ2h0IjpbNDYuMF0sImFudGktYWltOjpNb3ZpbmdfYm9keV95YXciOlt0cnVlXSwiYW50aS1haW06Ok1vdmluZ19kZWxheSI6WzAuMF0sImFudGktYWltOjpNb3ZpbmdfZW5hYmxlZCI6W3RydWVdLCJhbnRpLWFpbTo6TW92aW5nX2ZyZWVzdGFuZGluZyI6WyJPZmYiXSwiYW50aS1haW06Ok1vdmluZ19sZWZ0X2xpbWl0IjpbNjAuMF0sImFudGktYWltOjpNb3ZpbmdfbW9kaWZpZXJfb2Zmc2V0IjpbLTI0LjBdLCJhbnRpLWFpbTo6TW92aW5nX29wdGlvbnMiOltbIkppdHRlciJdXSwiYW50aS1haW06Ok1vdmluZ19waXRjaCI6WyJEb3duIl0sImFudGktYWltOjpNb3ZpbmdfcmlnaHRfbGltaXQiOls2MC4wXSwiYW50aS1haW06Ok1vdmluZ195YXciOlsiQmFja3dhcmQiXSwiYW50aS1haW06Ok1vdmluZ195YXdfYmFzZSI6WyJBdCBUYXJnZXQiXSwiYW50aS1haW06Ok1vdmluZ195YXdfbGVmdCI6Wy0yNS4wXSwiYW50aS1haW06Ok1vdmluZ195YXdfbW9kaWZpZXIiOlsiQ2VudGVyIl0sImFudGktYWltOjpNb3ZpbmdfeWF3X3JpZ2h0IjpbMzAuMF0sImFudGktYWltOjpTbG93IFdhbGtfYm9keV95YXciOlt0cnVlXSwiYW50aS1haW06OlNsb3cgV2Fsa19kZWxheSI6WzIuMF0sImFudGktYWltOjpTbG93IFdhbGtfZW5hYmxlZCI6W3RydWVdLCJhbnRpLWFpbTo6U2xvdyBXYWxrX2ZyZWVzdGFuZGluZyI6WyJPZmYiXSwiYW50aS1haW06OlNsb3cgV2Fsa19sZWZ0X2xpbWl0IjpbNjAuMF0sImFudGktYWltOjpTbG93IFdhbGtfbW9kaWZpZXJfb2Zmc2V0IjpbLTguMF0sImFudGktYWltOjpTbG93IFdhbGtfb3B0aW9ucyI6W1siSml0dGVyIl1dLCJhbnRpLWFpbTo6U2xvdyBXYWxrX3BpdGNoIjpbIkRvd24iXSwiYW50aS1haW06OlNsb3cgV2Fsa19yaWdodF9saW1pdCI6WzYwLjBdLCJhbnRpLWFpbTo6U2xvdyBXYWxrX3lhdyI6WyJCYWNrd2FyZCJdLCJhbnRpLWFpbTo6U2xvdyBXYWxrX3lhd19iYXNlIjpbIkxvY2FsIFZpZXciXSwiYW50aS1haW06OlNsb3cgV2Fsa195YXdfbGVmdCI6WzAuMF0sImFudGktYWltOjpTbG93IFdhbGtfeWF3X21vZGlmaWVyIjpbIkNlbnRlciJdLCJhbnRpLWFpbTo6U2xvdyBXYWxrX3lhd19yaWdodCI6WzAuMF0sImFudGktYWltOjpTdGFuZGluZ19ib2R5X3lhdyI6W3RydWVdLCJhbnRpLWFpbTo6U3RhbmRpbmdfZGVsYXkiOlsxLjBdLCJhbnRpLWFpbTo6U3RhbmRpbmdfZW5hYmxlZCI6W3RydWVdLCJhbnRpLWFpbTo6U3RhbmRpbmdfZnJlZXN0YW5kaW5nIjpbIk9mZiJdLCJhbnRpLWFpbTo6U3RhbmRpbmdfbGVmdF9saW1pdCI6WzYwLjBdLCJhbnRpLWFpbTo6U3RhbmRpbmdfbW9kaWZpZXJfb2Zmc2V0IjpbMjQuMF0sImFudGktYWltOjpTdGFuZGluZ19vcHRpb25zIjpbWyJKaXR0ZXIiXV0sImFudGktYWltOjpTdGFuZGluZ19waXRjaCI6WyJEb3duIl0sImFudGktYWltOjpTdGFuZGluZ19yaWdodF9saW1pdCI6WzYwLjBdLCJhbnRpLWFpbTo6U3RhbmRpbmdfeWF3IjpbIkJhY2t3YXJkIl0sImFudGktYWltOjpTdGFuZGluZ195YXdfYmFzZSI6WyJBdCBUYXJnZXQiXSwiYW50aS1haW06OlN0YW5kaW5nX3lhd19sZWZ0IjpbLTM1LjBdLCJhbnRpLWFpbTo6U3RhbmRpbmdfeWF3X21vZGlmaWVyIjpbIkRpc2FibGVkIl0sImFudGktYWltOjpTdGFuZGluZ195YXdfcmlnaHQiOlszMC4wXSwiYW50aS1haW06OmFuaW1hdGlvbnMuZW5hYmxlZCI6W3RydWVdLCJhbnRpLWFpbTo6YW5pbWF0aW9ucy5sZWdhY3lhbmltYXRpb25zIjpbMjQ1NTE1OTU3OC4wXSwiYW50aS1haW06OmFuaW1hdGlvbnMubW9vbl93YWxrX2luX2Fpcl9tb2RlIjpbZmFsc2VdLCJhbnRpLWFpbTo6YW5pbWF0aW9ucy5tb29uX3dhbGtfbW9kZSI6W2ZhbHNlXSwiYW50aS1haW06OmFuaW1hdGlvbnMubW92ZV9sZWFuX2ZvcmNlIjpbMTAwLjBdLCJhbnRpLWFpbTo6YW5pbWF0aW9ucy5vbl9ncm91bmRfZm9yY2UiOlt0cnVlXSwiYW50aS1haW06OmFuaW1hdGlvbnMub3B0aW9ucyI6W1siTW92ZSBMZWFuIl1dLCJhbnRpLWFpbTo6YW50aWFpbV9vbl91c2UuZV9maXgiOlt0cnVlXSwiYW50aS1haW06OmFudGlhaW1fb25fdXNlLmVuYWJsZWQiOlt0cnVlXSwiYW50aS1haW06OmF2b2lkX2JhY2tzdGFiLmVuYWJsZWQiOlt0cnVlXSwiYW50aS1haW06OmJ1aWxkZXIuY29uZGl0aW9uIjpbIk1vdmluZyJdLCJhbnRpLWFpbTo6YnVpbGRlci5lbmFibGVkIjpbdHJ1ZV0sImFudGktYWltOjpkZWZlbnNpdmUuY29uZGl0aW9uIjpbIkNyb3VjaCJdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlLmVuYWJsZWQiOltmYWxzZV0sImFudGktYWltOjpkZWZlbnNpdmVfQWlyIENyb3VjaF9lbmFibGVkIjpbdHJ1ZV0sImFudGktYWltOjpkZWZlbnNpdmVfQWlyIENyb3VjaF9waXRjaCI6WyJQcm9ncmVzc2l2ZSJdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX0FpciBDcm91Y2hfcGl0Y2hfb2Zmc2V0IjpbMC4wXSwiYW50aS1haW06OmRlZmVuc2l2ZV9BaXIgQ3JvdWNoX3lhdyI6WyJKaXR0ZXIiXSwiYW50aS1haW06OmRlZmVuc2l2ZV9BaXIgQ3JvdWNoX3lhd19vZmZzZXQiOls3OC4wXSwiYW50aS1haW06OmRlZmVuc2l2ZV9BaXJfZW5hYmxlZCI6W2ZhbHNlXSwiYW50aS1haW06OmRlZmVuc2l2ZV9BaXJfcGl0Y2giOlsiUHJvZ3Jlc3NpdmUiXSwiYW50aS1haW06OmRlZmVuc2l2ZV9BaXJfcGl0Y2hfb2Zmc2V0IjpbMjUuMF0sImFudGktYWltOjpkZWZlbnNpdmVfQWlyX3lhdyI6WyJQb3Zvcm90bmlraSJdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX0Fpcl95YXdfb2Zmc2V0IjpbNzMuMF0sImFudGktYWltOjpkZWZlbnNpdmVfQ3JvdWNoIE1vdmVfZW5hYmxlZCI6W3RydWVdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX0Nyb3VjaCBNb3ZlX3BpdGNoIjpbIlByb2dyZXNzaXZlIl0sImFudGktYWltOjpkZWZlbnNpdmVfQ3JvdWNoIE1vdmVfcGl0Y2hfb2Zmc2V0IjpbMC4wXSwiYW50aS1haW06OmRlZmVuc2l2ZV9Dcm91Y2ggTW92ZV95YXciOlsiUG92b3JvdG5pa2kiXSwiYW50aS1haW06OmRlZmVuc2l2ZV9Dcm91Y2ggTW92ZV95YXdfb2Zmc2V0IjpbMzAuMF0sImFudGktYWltOjpkZWZlbnNpdmVfQ3JvdWNoX2VuYWJsZWQiOlt0cnVlXSwiYW50aS1haW06OmRlZmVuc2l2ZV9Dcm91Y2hfcGl0Y2giOlsiVXAiXSwiYW50aS1haW06OmRlZmVuc2l2ZV9Dcm91Y2hfcGl0Y2hfb2Zmc2V0IjpbLTkuMF0sImFudGktYWltOjpkZWZlbnNpdmVfQ3JvdWNoX3lhdyI6WyJQcm9ncmVzc2l2ZSBTcGluIl0sImFudGktYWltOjpkZWZlbnNpdmVfQ3JvdWNoX3lhd19vZmZzZXQiOlstMy4wXSwiYW50aS1haW06OmRlZmVuc2l2ZV9Nb3ZpbmdfZW5hYmxlZCI6W2ZhbHNlXSwiYW50aS1haW06OmRlZmVuc2l2ZV9Nb3ZpbmdfcGl0Y2giOlsiRGVmYXVsdCJdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX01vdmluZ19waXRjaF9vZmZzZXQiOlswLjBdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX01vdmluZ195YXciOlsiRGVmYXVsdCJdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX01vdmluZ195YXdfb2Zmc2V0IjpbMC4wXSwiYW50aS1haW06OmRlZmVuc2l2ZV9TbG93IFdhbGtfZW5hYmxlZCI6W3RydWVdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX1Nsb3cgV2Fsa19waXRjaCI6WyJQcm9ncmVzc2l2ZSJdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX1Nsb3cgV2Fsa19waXRjaF9vZmZzZXQiOlswLjBdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX1Nsb3cgV2Fsa195YXciOlsiUG92b3JvdG5pa2kiXSwiYW50aS1haW06OmRlZmVuc2l2ZV9TbG93IFdhbGtfeWF3X29mZnNldCI6Wy0yNC4wXSwiYW50aS1haW06OmRlZmVuc2l2ZV9TdGFuZGluZ19lbmFibGVkIjpbZmFsc2VdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX1N0YW5kaW5nX3BpdGNoIjpbIlplcm8iXSwiYW50aS1haW06OmRlZmVuc2l2ZV9TdGFuZGluZ19waXRjaF9vZmZzZXQiOls4OS4wXSwiYW50aS1haW06OmRlZmVuc2l2ZV9TdGFuZGluZ195YXciOlsiU3BpbiJdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX1N0YW5kaW5nX3lhd19vZmZzZXQiOlsyNS4wXSwiYW50aS1haW06OmVkZ2VfeWF3LmVuYWJsZWQiOltmYWxzZV0sImFudGktYWltOjpmb3JjZV9kZWZlbnNpdmUuY29uZGl0aW9ucyI6W1siU2xvdyBXYWxrIiwiQWlyIiwiQWlyIENyb3VjaCIsIkNyb3VjaCIsIkNyb3VjaCBNb3ZlIl1dLCJhbnRpLWFpbTo6Zm9yY2VfZGVmZW5zaXZlLmVuYWJsZWQiOlt0cnVlXSwiYW50aS1haW06OmZyZWVzdGFuZGluZy5ib2R5X2ZyZWVzdGFuZGluZyI6W2ZhbHNlXSwiYW50aS1haW06OmZyZWVzdGFuZGluZy5kaXNhYmxlX3lhd19tb2RpZmllcnMiOltmYWxzZV0sImFudGktYWltOjpmcmVlc3RhbmRpbmcuZW5hYmxlZCI6W2ZhbHNlXSwiYW50aS1haW06Om1hbnVhbF95YXcuYm9keV9mcmVlc3RhbmRpbmciOltmYWxzZV0sImFudGktYWltOjptYW51YWxfeWF3LmRpc2FibGVfYWxsX21vZGlmaWVycyI6W2ZhbHNlXSwiYW50aS1haW06Om1hbnVhbF95YXcuZGlzYWJsZV95YXdfbW9kaWZpZXJzIjpbdHJ1ZV0sImFudGktYWltOjptYW51YWxfeWF3LnNlbGVjdCI6WyJEaXNhYmxlZCJdLCJhbnRpLWFpbTo6c2FmZV9oZWFkLmNvbmRpdGlvbnMiOltbIktuaWZlIl1dLCJhbnRpLWFpbTo6c2FmZV9oZWFkLmVuYWJsZWQiOlt0cnVlXSwibW92ZW1lbnQ6OmZhc3RfbGFkZGVyLmVuYWJsZWQiOlt0cnVlXSwib3RoZXI6OmNsYW50YWcuZW5hYmxlZCI6W2ZhbHNlXSwib3RoZXI6OnBpbmdfc3Bpa2UuZW5hYmxlZCI6W2ZhbHNlXSwib3RoZXI6OnBpbmdfc3Bpa2UudmFsdWUiOlsxMDAwLjBdLCJvdGhlcjo6dmlld21vZGVsLmVuYWJsZWQiOltmYWxzZV0sIm90aGVyOjp2aWV3bW9kZWwuZm92IjpbNjgwLjBdLCJvdGhlcjo6dmlld21vZGVsLm9mZnNldF94IjpbMjUuMF0sIm90aGVyOjp2aWV3bW9kZWwub2Zmc2V0X3kiOlswLjBdLCJvdGhlcjo6dmlld21vZGVsLm9mZnNldF96IjpbLTE1LjBdLCJvdGhlcjo6dmlld21vZGVsLm9wcG9zaXRlX2tuaWZlX2hhbmQiOlt0cnVlXSwicmFnZWJvdDo6YWltYm90X2xvZ3MuZW5hYmxlZCI6W3RydWVdLCJyYWdlYm90OjphaW1ib3RfbG9ncy5vdXRwdXQiOltbIkNvbnNvbGUiLCJOb3RpZnkiLCJTY3JlZW4iXV0sInJhZ2Vib3Q6OmRvcm1hbnRfYWltYm90LmF1dG9fc2NvcGUiOlt0cnVlXSwicmFnZWJvdDo6ZG9ybWFudF9haW1ib3QuZGFtYWdlIjpbNS4wXSwicmFnZWJvdDo6ZG9ybWFudF9haW1ib3QuZW5hYmxlZCI6W3RydWVdLCJyYWdlYm90Ojpkb3JtYW50X2FpbWJvdC5oaXRib3hlcyI6W1siSGVhZCIsIkNoZXN0IiwiU3RvbWFjaCIsIkxlZ3MiXV0sInJhZ2Vib3Q6OmRvcm1hbnRfYWltYm90LmhpdGNoYW5jZSI6WzY4LjBdLCJyYWdlYm90OjpncmVuYWRlX3Rocm93X2ZpeC5lbmFibGVkIjpbdHJ1ZV0sInJhZ2Vib3Q6Om5vX2ZhbGxfZGFtYWdlLmVuYWJsZWQiOlt0cnVlXSwicmFnZWJvdDo6cHJlZGljdF9lbmVtaWVzLmVuYWJsZWQiOltmYWxzZV0sInJhZ2Vib3Q6OnN1cGVyX3Rvc3MuZW5hYmxlZCI6W3RydWVdLCJ2aXN1YWxzOjphbnRpYWltX2Fycm93cy5jb2xvciI6WyJNYW51YWwiLHsiRGVzeW5jIjpbIjIxQTNERUZGIl0sIk1hbnVhbCI6WyJGRkZGRkZGRiJdfV0sInZpc3VhbHM6OmFudGlhaW1fYXJyb3dzLmVuYWJsZWQiOlt0cnVlXSwidmlzdWFsczo6YW50aWFpbV9hcnJvd3MudHlwZSI6WyJEZWZhdWx0Il0sInZpc3VhbHM6OmFzcGVjdF9yYXRpby5lbmFibGVkIjpbZmFsc2VdLCJ2aXN1YWxzOjphc3BlY3RfcmF0aW8udmFsdWUiOlsxNDUuMF0sInZpc3VhbHM6OmRhbWFnZV9pbmRpY2F0b3IuZW5hYmxlZCI6W2ZhbHNlXSwidmlzdWFsczo6ZGFtYWdlX2luZGljYXRvci5mb250IjpbIkRlZmF1bHQiXSwidmlzdWFsczo6Zm92YW5pbWF0aW9ucy5lbmFibGVkIjpbZmFsc2VdLCJ2aXN1YWxzOjpmb3ZhbmltYXRpb25zLnNlbGVjdCI6W1siRmlyc3QgUGVyc29uIiwiVGhpcmQgUGVyc29uIl1dLCJ2aXN1YWxzOjpnc19pbmRpY2F0b3JzLmVuYWJsZWQiOlt0cnVlXSwidmlzdWFsczo6Z3NfaW5kaWNhdG9ycy5saXN0IjpbWyJNaW5pbXVtIGRhbWFnZSIsIkRvcm1hbnQgQWltYm90IiwiSGl0Y2hhbmNlIG92ZXJyaWRlIiwiRmFrZSBMYXRlbmN5IiwiRmFrZSBEdWNrIiwiRnJlZXN0YW5kaW5nIiwiQm9tYiBJbmZvcm1hdGlvbiIsIkhpZGUgU2hvdHMiLCJEb3VibGUgVGFwIl1dLCJ2aXN1YWxzOjpoaXRfbWFya2VyLmVuYWJsZWQiOlt0cnVlXSwidmlzdWFsczo6aW5kaWNhdGVfc3RhdGUuZW5hYmxlZCI6W3RydWVdLCJ2aXN1YWxzOjppbmRpY2F0ZV9zdGF0ZS5vZmZzZXQiOlsyNC4wXSwidmlzdWFsczo6aW5kaWNhdGVfc3RhdGUudHlwZSI6WyJBbHRlcm5hdGl2ZSJdLCJ2aXN1YWxzOjpraWJpdF9tYXJrZXIuY29sb3IiOlsiVmVydGljYWwiLHsiSG9yaXpvbnRhbCI6WyIwMEZGRkZGRiJdLCJWZXJ0aWNhbCI6WyIwMEZGMDBGRiJdfV0sInZpc3VhbHM6OmtpYml0X21hcmtlci5lbmFibGVkIjpbZmFsc2VdLCJ2aXN1YWxzOjpsYWJlbC5lbmFibGVkIjpbMjAxNjk2MjI2Mi4wXSwidmlzdWFsczo6c2NvcGVfb3ZlcmxheS5lbmFibGVkIjpbdHJ1ZV0sInZpc3VhbHM6OnNjb3BlX292ZXJsYXkub2Zmc2V0IjpbNi4wXSwidmlzdWFsczo6c2NvcGVfb3ZlcmxheS5wb3NpdGlvbiI6WzExMi4wXSwidmlzdWFsczo6c2NvcGVfb3ZlcmxheS50X3N0eWxlIjpbZmFsc2VdLCJ2aXN1YWxzOjp3YXRlcm1hcmsuY29sb3IiOlsiR3JhZGllbnQiLHsiR3JhZGllbnQiOlsiRkZGRkZGMDAiLCIyRTJFMkUwMCJdLCJTaW5nbGUiOlsiRkZGRkZGQzgiXX1dLCJ2aXN1YWxzOjp3YXRlcm1hcmsucG9zaXRpb24iOlsiQm90dG9tIl0sInZpc3VhbHM6OndhdGVybWFyay5yZW1vdmFscyI6W1siU3BhY2VzIiwiQnVpbGQiXV19"));
    v83.update_data();
    events.shutdown(v171);
end;
v87 = nil;
v87 = {};
v90 = ui.create("Windows"):visibility(false);
v95 = {};
v105 = nil;
v112 = nil;
v156 = function(v193)
    local l_status_5, l_result_5 = pcall(json.parse, v193);
    return l_status_5 and l_result_5 or nil;
end;
local function v199(v196, v197, v198)
    return v196.x >= v197.x and v196.x <= v198.x and v196.y >= v197.y and v196.y <= v198.y;
end;
local v200 = {
    mouse_pos = vector(), 
    mouse_pos_prev = vector(), 
    mouse_down = false, 
    mouse_clicked = false, 
    mouse_down_duration = 0, 
    mouse_delta = vector(), 
    mouse_clicked_pos = vector()
};
do
    local l_v90_2, l_v95_2, l_v105_2, l_v112_2, l_v156_1, l_v199_0, l_v200_0 = v90, v95, v105, v112, v156, v199, v200;
    l_v200_0.update_mouse_inputs = function()
        -- upvalues: l_v200_0 (ref)
        local l_frametime_0 = globals.frametime;
        local v209 = ui.get_mouse_position();
        local v210 = common.is_button_down(1);
        l_v200_0.mouse_pos_prev = l_v200_0.mouse_pos;
        l_v200_0.mouse_pos = v209;
        l_v200_0.mouse_delta = l_v200_0.mouse_pos - l_v200_0.mouse_pos_prev;
        l_v200_0.mouse_down = v210;
        l_v200_0.mouse_clicked = v210 and l_v200_0.mouse_down_duration < 0;
        local l_l_v200_0_0 = l_v200_0;
        local v212;
        if v210 then
            if l_v200_0.mouse_down_duration < 0 then
                v212 = 0;
                goto label0 --[[  true, true  ]];
            else
                v212 = l_v200_0.mouse_down_duration + l_frametime_0;
                if v212 then
                    goto label0;
                end;
            end;
        end;
        v212 = -1;
        ::label0::;
        l_l_v200_0_0.mouse_down_duration = v212;
        if l_v200_0.mouse_clicked then
            l_v200_0.mouse_clicked_pos = l_v200_0.mouse_pos;
        end;
    end;
    local v213 = {};
    v213.__index = v213;
    v213.__new = function(v214, v215, v216)
        -- upvalues: l_v90_2 (ref), l_v156_1 (ref), l_v95_2 (ref)
        local v217 = l_v90_2:value(v215, "{ }");
        local v218 = l_v156_1(v217:get());
        local v219 = vector(0, 0);
        local v220 = vector(0, 0);
        local v221 = vector(0, 0);
        if type(v216) == "table" then
            if v216.pos ~= nil then
                v219.x = v216.pos.x or 0;
                v219.y = v216.pos.y or 0;
            end;
            if v216.size ~= nil then
                v220.x = v216.size.x or 0;
                v220.y = v216.size.y or 0;
            end;
            if v216.anchor ~= nil then
                v221.x = v216.anchor.x or 0;
                v221.y = v216.anchor.y or 0;
            end;
        end;
        if v218 ~= nil and v218.pos ~= nil then
            v219.x = v218.pos.x or 0;
            v219.y = v218.pos.y or 0;
        end;
        local v222 = {
            is_active = true, 
            is_hovered = false, 
            is_dragged = false, 
            item = v217, 
            name = v215, 
            pos = v219, 
            size = v220, 
            anchor = v221
        };
        table.insert(l_v95_2, v222);
        return setmetatable(v222, v214);
    end;
    v213.get_pos = function(v223)
        return v223.pos;
    end;
    v213.get_size = function(v224)
        return v224.size;
    end;
    v213.get_anchor = function(v225)
        return v225.anchor;
    end;
    v213.set_pos = function(v226, v227)
        local v228 = v227:clone();
        if v226.pos ~= v228 then
            local v229 = vector(v228.x + v226.size.x * v226.anchor.x, v228.y + v226.size.y * v226.anchor.y);
            local v230 = {
                pos = {
                    x = v229.x, 
                    y = v229.y
                }
            };
            v226.item:set(json.stringify(v230));
        end;
        v226.pos = v228;
        return v226;
    end;
    v213.set_size = function(v231, v232)
        local v233 = v232 - v231.size;
        local v234 = v231.pos - v233 * v231.anchor;
        v231.size = v232;
        v231:set_pos(v234);
        return v231;
    end;
    v213.set_anchor = function(v235, v236)
        v235.anchor = v236;
        return v235;
    end;
    local function v242()
        -- upvalues: l_v95_2 (ref), l_v199_0 (ref), l_v200_0 (ref), l_v105_2 (ref)
        local v237 = nil;
        if ui.get_alpha() > 0 then
            for v238 = 1, #l_v95_2 do
                local v239 = l_v95_2[v238];
                local l_pos_0 = v239.pos;
                local l_size_0 = v239.size;
                if v239.is_active and l_v199_0(l_v200_0.mouse_pos, l_pos_0, l_pos_0 + l_size_0) then
                    v237 = v239;
                end;
            end;
        end;
        l_v105_2 = v237;
    end;
    local function v243()
        -- upvalues: l_v200_0 (ref), l_v112_2 (ref), l_v105_2 (ref)
        if not l_v200_0.mouse_down then
            l_v112_2 = nil;
            return;
        else
            if l_v200_0.mouse_clicked and l_v105_2 ~= nil then
                l_v112_2 = l_v105_2;
            end;
            return;
        end;
    end;
    local function v246()
        -- upvalues: l_v95_2 (ref)
        for v244 = 1, #l_v95_2 do
            local v245 = l_v95_2[v244];
            v245.is_dragged = false;
            v245.is_hovered = false;
        end;
    end;
    local function v247()
        -- upvalues: l_v105_2 (ref)
        if l_v105_2 == nil then
            return;
        else
            l_v105_2.is_hovered = true;
            return;
        end;
    end;
    local function v249()
        -- upvalues: l_v112_2 (ref), l_v200_0 (ref)
        if l_v112_2 == nil then
            return;
        else
            local v248 = l_v112_2.pos + l_v200_0.mouse_delta;
            l_v112_2:set_pos(v248);
            l_v112_2.is_dragged = true;
            return;
        end;
    end;
    local function v250()
        -- upvalues: l_v200_0 (ref), v242 (ref), v243 (ref), v246 (ref), v247 (ref), v249 (ref)
        l_v200_0.update_mouse_inputs();
        v242();
        v243();
        v246();
        v247();
        v249();
    end;
    local function v252(v251)
        -- upvalues: l_v112_2 (ref), l_v105_2 (ref)
        if not (l_v112_2 ~= nil or l_v105_2 ~= nil) then
            return;
        else
            v251.in_attack = false;
            v251.in_attack2 = false;
            return;
        end;
    end;
    v87.new = function(v253, v254)
        -- upvalues: v213 (ref)
        return v213:__new(v253, v254);
    end;
    events.render(v250);
    events.createmove(v252);
end;
v90 = nil;
v90 = {};
v95 = 1;
v105 = 2;
v112 = 3;
v156 = function(v255)
    -- upvalues: v3 (ref)
    return v3:rep(v255);
end;
do
    local l_v156_2, l_v199_1 = v156, v199;
    l_v199_1 = function(v258, v259, v260, v261)
        -- upvalues: l_v156_2 (ref)
        return l_v156_2(v260) .. "\a{Link Active}" .. v258 .. l_v156_2(v261) .. "\aDEFAULT" .. v259;
    end;
    v200 = function(v262, v263, v264)
        -- upvalues: l_v156_2 (ref)
        return l_v156_2(v264) .. "\a{Link Active}" .. v262 .. l_v156_2(4) .. "\aDEFAULT" .. v263 .. l_v156_2(v264);
    end;
    local function v269(v265, v266, v267)
        -- upvalues: l_v156_2 (ref)
        local v268 = l_v156_2(v266) .. v265 .. l_v156_2(v266);
        if v267 ~= nil then
            v268 = v268 .. v267;
        end;
        return v268;
    end;
    local function v271(v270)
        return function()
            -- upvalues: v270 (ref)
            panorama.SteamOverlayAPI.OpenExternalBrowserURL(v270);
        end;
    end;
    local _ = {};
    local v273 = ui.get_icon("sparkles");
    local l_name_1 = v4.name;
    do
        local l_v273_0, l_l_name_1_0 = v273, l_name_1;
        local function v279()
            -- upvalues: v9 (ref), l_l_name_1_0 (ref), l_v273_0 (ref)
            local v277 = ui.get_style();
            local v278 = v9.wave(l_l_name_1_0, v277["Link Active"], v277["Disabled Text"], globals.realtime);
            ui.sidebar(v278, l_v273_0);
        end;
        events.render(v279);
    end;
    v273 = {};
    l_name_1 = {};
    local v280 = ui.get_icon("house");
    l_name_1.controls = ui.create(v280, "##CONTROLS", v95);
    l_name_1.logo = ui.create(v280, "##LOGO", v95);
    l_name_1.recommendations = ui.create(v280, "Recommendations", v95);
    l_name_1.configs = ui.create(v280, "Configs", v95);
    l_name_1.date = ui.create(v280, "##DATE", v95);
    l_name_1.main = ui.create(v280, "##MAIN", v95);
    l_name_1.themes = ui.create(v280, "##THEMES", v95);
    l_name_1.socials2 = ui.create(v280, "##SOCIALS2", v95);
    l_name_1.socials = ui.create(v280, "##SOCIALS", v95);
    l_name_1.configs = ui.create(v280, "##CONFIGS", v105);
    l_name_1.main2 = ui.create(v280, "##MAIN2", v95);
    v280 = l_name_1.socials2:button(v200(ui.get_icon("discord"), "Discord Server", 36), v271("https://discord.com/invite/Ns5wwbReVw"), true);
    local v281 = {};
    local function v284()
        -- upvalues: l_v199_1 (ref)
        local v282 = common.get_system_time();
        local v283 = string.format("Time: \a{Link Active}%02d:%02d:%02d", v282.hours, v282.minutes, v282.seconds);
        return (l_v199_1(ui.get_icon("clock"), v283, 0, 4));
    end;
    l_name_1.main:label(l_v199_1(ui.get_icon("circle-user"), string.format("User: \a{Link Active}%s", v4.user), 0, 5));
    l_name_1.main:label(l_v199_1(ui.get_icon("code-branch"), string.format("Build: \a{Link Active}%s", v4.build), 0, 5));
    local v285 = l_name_1.main:label(v284());
    do
        local l_v284_0, l_v285_0 = v284, v285;
        local function v288()
            -- upvalues: l_v285_0 (ref), l_v284_0 (ref), v288 (ref)
            l_v285_0:name(l_v284_0());
            utils.execute_after(1, v288);
        end;
        v288();
    end;
    v284 = {};
    v285 = function()
        -- upvalues: v65 (ref), v10 (ref), v8 (ref)
        local v289, v290 = v65.export();
        if not v289 then
            v10.err(v290);
            return;
        else
            local v291, v292 = v65.encode(v290);
            if not v291 then
                v10.err(v292);
                return;
            else
                v10.msg("Config exported");
                v8.set(v292);
                return;
            end;
        end;
    end;
    local function v297()
        -- upvalues: v65 (ref), v8 (ref), v10 (ref)
        local v293, v294 = v65.decode(v8.get());
        if not v293 then
            v10.err(v294);
            return;
        else
            local v295, v296 = v65.import(v294);
            if not v295 then
                v10.err(v296);
                return;
            else
                v10.msg("Config imported");
                return;
            end;
        end;
    end;
    local v298 = l_name_1.configs:list("##PRESET_LIST", v83.get_list());
    local v299 = l_name_1.configs:input("##PRESET_NAME", "Default");
    do
        local l_v298_0, l_v299_0 = v298, v299;
        l_name_1.configs:button(v269("\aFF3232FF" .. ui.get_icon("trash"), 3), function()
            -- upvalues: v83 (ref), l_v299_0 (ref), v10 (ref), l_v298_0 (ref)
            local v302, v303 = v83.delete(l_v299_0:get());
            if not v302 then
                v10.err(v303);
                return;
            else
                v83.update_data();
                l_v298_0:update(v83.get_list());
                return;
            end;
        end, true);
        l_name_1.configs:button(v269("\a{Link Active}" .. ui.get_icon("copy"), 3), v285, true);
        l_name_1.configs:button(v269("\a{Link Active}" .. ui.get_icon("clipboard"), 3), v297, true);
        l_name_1.configs:button(v200(ui.get_icon("file-zipper"), "Save", 3), function()
            -- upvalues: v83 (ref), l_v299_0 (ref), v10 (ref), l_v298_0 (ref)
            local v304, v305 = v83.save(l_v299_0:get());
            if not v304 then
                v10.err(v305);
                return;
            else
                v83.update_data();
                l_v298_0:update(v83.get_list());
                return;
            end;
        end, true);
        l_name_1.configs:button(v200(ui.get_icon("arrow-down-to-line"), "Load", 3), function()
            -- upvalues: v83 (ref), l_v299_0 (ref)
            v83.load(l_v299_0:get());
        end, true);
        l_v298_0:set_callback(function(v306)
            -- upvalues: v83 (ref), l_v299_0 (ref)
            local v307 = v306:get();
            if v307 == nil or v307 < 0 then
                return;
            else
                local v308 = v83.get(v307);
                if v308 == nil then
                    return;
                else
                    l_v299_0:set(v308.name);
                    return;
                end;
            end;
        end, true);
    end;
    v285 = {};
    l_name_1.main:visibility(true);
    l_name_1.themes:visibility(true);
    l_name_1.socials2:visibility(true);
    l_name_1.socials:visibility(true);
    l_name_1.configs:visibility(true);
    l_name_1.main2:visibility(true);
    v90.home = v273;
    l_name_1 = {};
    v280 = {};
    v281 = ui.get_icon("shield");
    v280.main = ui.create(v281, "MAIN", v95);
    v280.other = ui.create(v281, "##OTHER", v95);
    v280.builder = ui.create(v281, "BUILDER", v105);
    v280.builder_layout = ui.create(v281, "##BUILDER_LAYOUT", v105);
    v281 = {
        select = v65.push("Anti-Aim", "manual_yaw.select", v280.main:combo(l_v199_1(ui.get_icon("rotate"), "Manual Yaw", 0, 6), {
            [1] = "Disabled", 
            [2] = "Left", 
            [3] = "Right", 
            [4] = "Forward", 
            [5] = "Backward"
        }))
    };
    v284 = v281.select:create();
    v281.disable_yaw_modifiers = v65.push("Anti-Aim", "manual_yaw.disable_yaw_modifiers", v284:switch("Disable Yaw Modifiers"));
    v281.body_freestanding = v65.push("Anti-Aim", "manual_yaw.body_freestanding", v284:switch("Body Freestanding"));
    l_name_1.manual_yaw = v281;
    v284 = {
        enabled = v65.push("Anti-Aim", "freestanding.enabled", v280.main:switch(l_v199_1(ui.get_icon("arrows-split-up-and-left"), "Freestanding", 0, 6)))
    };
    v285 = v284.enabled:create();
    v284.disable_yaw_modifiers = v65.push("Anti-Aim", "freestanding.disable_yaw_modifiers", v285:switch("Disable Yaw Modifiers"));
    v284.disable_all_modifiers = v65.push("Anti-Aim", "manual_yaw.disable_all_modifiers", v285:switch("Disable Body Modifiers"));
    v284.body_freestanding = v65.push("Anti-Aim", "freestanding.body_freestanding", v285:switch("Body Freestanding"));
    l_name_1.freestanding = v284;
    v285 = {
        enabled = v65.push("Anti-Aim", "animations.enabled", v280.other:switch(l_v199_1(ui.get_icon("person-sign"), "\aADAD61FF" .. "Animations", 0, 6.5)))
    };
    v297 = v285.enabled:create();
    v285.options = v65.push("Anti-Aim", "animations.options", v297:selectable("Options", {
        [1] = "Landing Pitch", 
        [2] = "Force Falling", 
        [3] = "Move Lean", 
        [4] = "Leg Breaker"
    }));
    v285.move_lean_force = v65.push("Anti-Aim", "animations.move_lean_force", v297:slider("Move Lean Force", 0, 100, 100, nil, "%"));
    v285.on_ground_force = v65.push("Anti-Aim", "animations.on_ground_force", v297:switch("On Ground Force"));
    v285.moonwalk_mode = v65.push("Anti-Aim", "animations.moon_walk_mode", v297:switch("Moonwalk Mode"));
    v285.moonwalk_in_air_mode = v65.push("Anti-Aim", "animations.moon_walk_in_air_mode", v297:switch("Moonwalk In Air Mode"));
    do
        local l_v280_0, l_v285_1 = v280, v285;
        l_v285_1.options:set_callback(function(v311)
            -- upvalues: l_v285_1 (ref)
            local v312 = v311:get("Move Lean");
            local v313 = v311:get("Leg Breaker");
            l_v285_1.move_lean_force:visibility(v312);
            l_v285_1.on_ground_force:visibility(v312);
            l_v285_1.moonwalk_mode:visibility(v313);
            l_v285_1.moonwalk_in_air_mode:visibility(v313);
        end, true);
        l_name_1.animations = l_v285_1;
        l_name_1.avoid_backstab = {
            enabled = v65.push("Anti-Aim", "avoid_backstab.enabled", l_v280_0.other:switch(l_v199_1(ui.get_icon("sword"), "\a{Link Active}Avoid\aDEFAULT Backstab", 0, 6)))
        };
        v298 = {
            enabled = v65.push("Anti-Aim", "antiaim_on_use.enabled", l_v280_0.other:switch(l_v199_1(ui.get_icon("unlock"), "Anti-Aim On Use", 0, 7)))
        };
        v299 = v298.enabled:create();
        v298.e_fix = v65.push("Anti-Aim", "antiaim_on_use.e_fix", v299:switch("Bombsite E Fix"));
        l_name_1.antiaim_on_use = v298;
        l_name_1.edge_yaw = {
            enabled = v65.push("Anti-Aim", "edge_yaw.enabled", l_v280_0.other:switch(l_v199_1(ui.get_icon("table-pivot"), "\a{Link Active}Edge\aDEFAULT Yaw", 0, 6)))
        };
        local v314 = {};
        local v315 = {
            [1] = "Standing", 
            [2] = "Moving", 
            [3] = "Slow Walk", 
            [4] = "Air", 
            [5] = "Air Crouch", 
            [6] = "Crouch", 
            [7] = "Crouch Move"
        };
        v314.enabled = v65.push("Anti-Aim", "force_defensive.enabled", l_v280_0.other:switch(l_v199_1(ui.get_icon("wind"), "Force Defensive", 0, 6)));
        local v316 = v314.enabled:create();
        v314.conditions = v65.push("Anti-Aim", "force_defensive.conditions", v316:selectable("Conditions", v315));
        l_name_1.force_defensive = v314;
        v315 = {
            enabled = v65.push("Anti-Aim", "tickbase.enabled", l_v280_0.other:switch(l_v199_1(ui.get_icon("clock"), "Tickbase", 0, 6)))
        };
        v316 = v315.enabled:create();
        v315.randomize = v65.push("Anti-Aim", "tickbase.randomize", v316:switch("Randomize"));
        v315.choke = v65.push("Anti-Aim", "tickbase.choke", v316:slider("Choke", 2, 22, 16, nil, "t"));
        v315.type = v65.push("Anti-Aim", "tickbase.type", v316:combo("Type", {
            [1] = "Default", 
            [2] = "Ways"
        }));
        v315.sliders = v65.push("Anti-Aim", "tickbase.sliders", v316:slider("Sliders", 3, 6, 3, nil));
        for v317 = 1, 6 do
            v315[v317] = v65.push("Anti-Aim", "tickbase." .. v317, v316:slider(string.format("- %d", v317), 2, 22, 16, nil, "t"));
        end;
        local v318 = nil;
        local function v322(v319)
            -- upvalues: v315 (ref)
            local v320 = v319:get();
            for v321 = 1, 6 do
                v315[v321]:visibility(v321 <= v320);
            end;
        end;
        do
            local l_v322_0 = v322;
            local function v330(v324)
                -- upvalues: v315 (ref), l_v322_0 (ref)
                local v325 = v324:get();
                local v326 = v325 == "Default";
                local v327 = v325 == "Ways";
                if v326 then
                    for v328 = 1, 6 do
                        local v329 = false;
                        if v328 <= 2 then
                            v329 = true;
                        end;
                        v315[v328]:visibility(v329);
                    end;
                end;
                v315.sliders:visibility(v327);
                if v327 then
                    v315.sliders:set_callback(l_v322_0, true);
                else
                    v315.sliders:unset_callback(l_v322_0);
                end;
            end;
            local function v334(v331)
                -- upvalues: v315 (ref), l_v322_0 (ref), v330 (ref)
                local v332 = v331:get();
                if not v332 then
                    v315.sliders:visibility(false);
                    v315.sliders:unset_callback(l_v322_0);
                    for v333 = 1, 6 do
                        v315[v333]:visibility(false);
                    end;
                end;
                v315.choke:visibility(not v332);
                v315.type:visibility(v332);
                if v332 then
                    v315.type:set_callback(v330, true);
                else
                    v315.type:unset_callback(v330);
                end;
            end;
            v315.randomize:set_callback(v334, true);
        end;
        l_name_1.tickbase = v315;
        v316 = {
            enabled = v65.push("Anti-Aim", "safe_head.enabled", l_v280_0.other:switch(l_v199_1(ui.get_icon("face-head-bandage"), "\a{Link Active}Safe\aDEFAULT Head", 0, 5)))
        };
        v318 = v316.enabled:create();
        v316.conditions = v65.push("Anti-Aim", "safe_head.conditions", v318:selectable("Conditions", {
            [1] = "Knife", 
            [2] = "Zeus", 
            [3] = "Distance"
        }));
        l_name_1.safe_head = v316;
        v318 = {};
        v322 = {
            [1] = "Standing", 
            [2] = "Moving", 
            [3] = "Slow Walk", 
            [4] = "Air", 
            [5] = "Air Crouch", 
            [6] = "Crouch", 
            [7] = "Crouch Move"
        };
        local function v337(v335, v336)
            -- upvalues: v65 (ref)
            return {
                enabled = v65.push("Anti-Aim", "defensive_" .. v335 .. "_enabled", v336:switch("Enable " .. v335)), 
                pitch = v65.push("Anti-Aim", "defensive_" .. v335 .. "_pitch", v336:combo("Pitch##PITCH{" .. v335 .. "}", {
                    [1] = "Default", 
                    [2] = "Up", 
                    [3] = "Down", 
                    [4] = "Zero", 
                    [5] = "Random", 
                    [6] = "Progressive", 
                    [7] = "Static Random", 
                    [8] = "Custom"
                })), 
                pitch_offset = v65.push("Anti-Aim", "defensive_" .. v335 .. "_pitch_offset", v336:slider("Offset##PITCH_OFFSET{" .. v335 .. "}", -89, 89, 0, nil)), 
                pitch_from = v65.push("Anti-Aim", "defensive_" .. v335 .. "_pitch_from", v336:slider("From Offset##PITCH_FROM_OFFSET{" .. v335 .. "}", -89, 89, 0, nil)), 
                pitch_to = v65.push("Anti-Aim", "defensive_" .. v335 .. "_pitch_to", v336:slider("To Offset##PITCH_TO_OFFSET{" .. v335 .. "}", -89, 89, 0, nil)), 
                yaw = v65.push("Anti-Aim", "defensive_" .. v335 .. "_yaw", v336:combo("Yaw##YAW{" .. v335 .. "}", {
                    [1] = "Default", 
                    [2] = "Jitter", 
                    [3] = "Opposite", 
                    [4] = "Spin", 
                    [5] = "Random", 
                    [6] = "Povorotniki", 
                    [7] = "Progressive Spin", 
                    [8] = "Static Random", 
                    [9] = "Custom"
                })), 
                yaw_offset = v65.push("Anti-Aim", "defensive_" .. v335 .. "_yaw_offset", v336:slider("Offset##YAW_OFFSET{" .. v335 .. "}", -180, 180, 0, nil)), 
                yaw_from = v65.push("Anti-Aim", "defensive_" .. v335 .. "_yaw_from", v336:slider("From Offset##YAW_FROM_OFFSET{" .. v335 .. "}", -180, 180, 0, nil)), 
                yaw_to = v65.push("Anti-Aim", "defensive_" .. v335 .. "_yaw_to", v336:slider("To Offset##YAW_TO_OFFSET{" .. v335 .. "}", -180, 180, 0, nil))
            };
        end;
        do
            local l_v322_1, l_v337_0 = v322, v337;
            local function v344(v340)
                -- upvalues: l_v322_1 (ref), l_v337_0 (ref)
                local v341 = {};
                for v342 = 1, #l_v322_1 do
                    local v343 = l_v322_1[v342];
                    v341[v343] = l_v337_0(v343, v340);
                end;
                return v341;
            end;
            v318.enabled = v65.push("Anti-Aim", "defensive.enabled", l_v280_0.other:switch(l_v199_1(ui.get_icon("eye-slash"), "Defensive", 0, 4)));
            local v345 = v318.enabled:create();
            v318.condition = v65.push("Anti-Aim", "defensive.condition", v345:combo("Condition", l_v322_1));
            v318.layout = v344(v345);
            v318.list = l_v322_1;
            l_name_1.defensive = v318;
        end;
        v322 = {};
        v337 = {
            [1] = "Standing", 
            [2] = "Moving", 
            [3] = "Slow Walk", 
            [4] = "Air", 
            [5] = "Air Crouch", 
            [6] = "Crouch", 
            [7] = "Crouch Move"
        };
        local function v365(v346)
            -- upvalues: v65 (ref), l_v280_0 (ref), v7 (ref)
            local v347 = {};
            if v346 ~= "Shared" then
                v347.enabled = v65.push("Anti-Aim", v346 .. "_enabled", l_v280_0.builder_layout:switch("Enable " .. v346));
            end;
            v347.pitch = v65.push("Anti-Aim", v346 .. "_pitch", l_v280_0.builder_layout:combo("Pitch", v7.aa.angles.pitch:list()));
            v347.yaw = v65.push("Anti-Aim", v346 .. "_yaw", l_v280_0.builder_layout:combo("Yaw", v7.aa.angles.yaw[1]:list()));
            local v348 = v347.yaw:create();
            v347.yaw_base = v65.push("Anti-Aim", v346 .. "_yaw_base", v348:combo("Base", v7.aa.angles.yaw[2]:list()));
            v347.yaw_left = v65.push("Anti-Aim", v346 .. "_yaw_left", v348:slider("\a{Link Active}~\aDEFAULT Left Offset", -180, 180, 0, nil));
            v347.yaw_right = v65.push("Anti-Aim", v346 .. "_yaw_right", v348:slider("\a{Link Active}~\aDEFAULT Right Offset", -180, 180, 0, nil));
            v347.yaw_modifier = v65.push("Anti-Aim", v346 .. "_yaw_modifier", l_v280_0.builder_layout:combo("Yaw Modifier", v7.aa.angles.yaw_modifier[1]:list()));
            v348 = v347.yaw_modifier:create();
            v347.yaw_modifier_mode = v65.push("Anti-Aim", v346 .. "_yaw_modifier_mode", v348:combo("Mode", {
                [1] = "Default", 
                [2] = "Random", 
                [3] = "Custom"
            }));
            v347.modifier_offset = v65.push("Anti-Aim", v346 .. "_modifier_offset", v348:slider("Offset", -180, 180, 0, nil));
            v347.modifier_min_offset = v65.push("Anti-Aim", v346 .. "_modifier_min_offset", v348:slider("Min Offset", -180, 180, 0, nil));
            v347.modifier_max_offset = v65.push("Anti-Aim", v346 .. "_modifier_max_offset", v348:slider("Max Offset", -180, 180, 0, nil));
            v347.modifier_sliders = v65.push("Anti-Aim", v346 .. "_modifier_sliders", v348:slider("Sliders", 3, 6, 3, nil));
            for v349 = 1, 6 do
                v347["modifier_offset_" .. v349] = v65.push("Anti-Aim", v346 .. "_modifier_offset_" .. v349, v348:slider("- " .. v349, -180, 180, 0, nil));
            end;
            v347.yaw_modifier_mode:tooltip("- Default: Selects an offset from the slider\n\n" .. "- Random: Selects a random offset from the min and max offset\n\n" .. "- Custom: Randomly select an offset from the sliders");
            local _ = nil;
            local function v354(v351)
                -- upvalues: v347 (ref)
                local v352 = v351:get();
                for v353 = 1, 6 do
                    v347["modifier_offset_" .. v353]:visibility(v353 <= v352);
                end;
            end;
            do
                local l_v354_0 = v354;
                local function v362(v356)
                    -- upvalues: v347 (ref), l_v354_0 (ref)
                    local v357 = v356:get();
                    local v358 = v357 == "Default";
                    local v359 = v357 == "Random";
                    local v360 = v357 == "Custom";
                    v347.modifier_offset:visibility(v358);
                    v347.modifier_min_offset:visibility(v359);
                    v347.modifier_max_offset:visibility(v359);
                    v347.modifier_sliders:visibility(v360);
                    if v360 then
                        v347.modifier_sliders:set_callback(l_v354_0, true);
                    else
                        v347.modifier_sliders:unset_callback(l_v354_0);
                    end;
                    if not v360 then
                        for v361 = 1, 6 do
                            v347["modifier_offset_" .. v361]:visibility(false);
                        end;
                    end;
                end;
                v347.yaw_modifier_mode:set_callback(v362, true);
            end;
            v347.body_yaw = v65.push("Anti-Aim", v346 .. "_body_yaw", l_v280_0.builder_layout:switch("Body Yaw"));
            v348 = v347.body_yaw:create();
            v347.body_yaw_mode = v65.push("Anti-Aim", v346 .. "_body_yaw_mode", v348:combo("Mode", {
                [1] = "Default", 
                [2] = "Ticks", 
                [3] = "Random"
            }));
            v347.body_yaw_ticks = v65.push("Anti-Aim", v346 .. "_body_yaw_ticks", v348:slider("##TICKS", 3, 16, 1, nil, "t"));
            v347.body_yaw_random_ticks = v65.push("Anti-Aim", v346 .. "_body_yaw_random_ticks", v348:slider("##RANDOM_TICKS", 4, 16, 1, nil, "t"));
            v347.left_limit = v65.push("Anti-Aim", v346 .. "_left_limit", v348:slider("Left Limit", 0, 60, 60, nil));
            v347.right_limit = v65.push("Anti-Aim", v346 .. "_right_limit", v348:slider("Right Limit", 0, 60, 60, nil));
            v347.options = v65.push("Anti-Aim", v346 .. "_options", v348:selectable("Options", v7.aa.angles.body_yaw[5]:list()));
            v347.delay = v65.push("Anti-Aim", v346 .. "_delay", v348:slider("Delay", 0, 8, 0, nil));
            v347.freestanding = v65.push("Anti-Aim", v346 .. "_freestanding", v348:combo("Freestanding", v7.aa.angles.body_yaw[6]:list()));
            v347.body_yaw_mode:set_callback(function(v363)
                -- upvalues: v347 (ref)
                v347.body_yaw_ticks:visibility(v363:get() == "Ticks");
                v347.body_yaw_random_ticks:visibility(v363:get() == "Random");
            end, true);
            v347.options:set_callback(function(v364)
                -- upvalues: v347 (ref)
                v347.delay:visibility(v364:get("Jitter"));
            end, true);
            return v347;
        end;
        do
            local l_v337_1, l_v365_0 = v337, v365;
            local function v371()
                -- upvalues: l_v337_1 (ref), l_v365_0 (ref)
                local v368 = {};
                for v369 = 1, #l_v337_1 do
                    local v370 = l_v337_1[v369];
                    v368[v370] = l_v365_0(v370);
                end;
                return v368;
            end;
            v322.enabled = v65.push("Anti-Aim", "builder.enabled", l_v280_0.builder:switch(l_v199_1(ui.get_icon("shield-check"), "Enable Builder", 0, 7)));
            v322.condition = v65.push("Anti-Aim", "builder.condition", l_v280_0.builder:combo("Condition", l_v337_1));
            v322.list = l_v337_1;
            v322.layout = v371();
            l_name_1.builder = v322;
        end;
        v90.antiaim = l_name_1;
    end;
    v280 = {};
    v281 = {};
    v284 = ui.get_icon("sparkles");
    v281.switcher = ui.create(v284, "##SWITCHER", v95);
    v281.ragebot = ui.create(v284, "##RAGEBOT", v105);
    v281.ragebot2 = ui.create(v284, "##RAGEBOT2", v95);
    v281.panels = ui.create(v284, "##PANELS", v95);
    v281.visuals = ui.create(v284, "##VISUALS", v95);
    v281.visuals2 = ui.create(v284, "##VISUALS2", v105);
    v281.visuals3 = ui.create(v284, "##VISUALS3", v105);
    v281.other = ui.create(v284, "##OTHER", v105);
    v284 = {};
    do
        local l_v281_0 = v281;
        l_v281_0.switcher:list("##SELECT", {
            l_v199_1(ui.get_icon("person-rifle"), "Ragebot", 0, 5), 
            l_v199_1(ui.get_icon("moon-stars"), "Visuals", 1, 5), 
            l_v199_1(ui.get_icon("volcano"), "Miscellaneous", 1, 5)
        }):set_callback(function(v373)
            -- upvalues: l_v281_0 (ref)
            local v374 = v373:get();
            local v375 = v374 == 1;
            local v376 = v374 == 1;
            local v377 = v374 == 2;
            local v378 = v374 == 2;
            local v379 = v374 == 2;
            local v380 = v374 == 3;
            l_v281_0.ragebot:visibility(v375);
            l_v281_0.ragebot2:visibility(v376);
            l_v281_0.panels:visibility(v377);
            l_v281_0.visuals:visibility(v377);
            l_v281_0.visuals2:visibility(v378);
            l_v281_0.visuals3:visibility(v379);
            l_v281_0.other:visibility(v380);
        end, true);
        v285 = {
            enabled = v65.push("Ragebot", "aimbot_logs.enabled", l_v281_0.ragebot:switch(l_v199_1(ui.get_icon("list-timeline"), "Aimbot Logs", 0, 7)))
        };
        v297 = v285.enabled:create();
        v285.output = v65.push("Ragebot", "aimbot_logs.output", v297:selectable("Output", {
            [1] = "Console", 
            [2] = "Notify", 
            [3] = "Screen"
        }));
        v285.color = v65.push("Visuals", "aimbot_logs.color", v297:color_picker("Hit color"));
        v285.misscolor = v65.push("Visuals", "aimbot_logs.misscolor", v297:color_picker("Miss color"));
        v280.aimbot_logs = v285;
        v297 = {
            enabled = v65.push("Ragebot", "dormant_aimbot.enabled", l_v281_0.ragebot:switch(l_v199_1(ui.get_icon("scanner-gun"), "\aADAD61FF" .. "Dormant Aimbot", 0, 6)))
        };
        v298 = v297.enabled:create();
        v297.hitboxes = v65.push("Ragebot", "dormant_aimbot.hitboxes", v298:selectable("Hitboxes", {
            [1] = "Head", 
            [2] = "Chest", 
            [3] = "Stomach", 
            [4] = "Legs"
        }));
        v297.hitchance = v65.push("Ragebot", "dormant_aimbot.hitchance", v298:slider("Accuracy", 50, 85, 60, nil, "%"));
        v297.damage = v65.push("Ragebot", "dormant_aimbot.damage", v298:slider("Min. Damage", -1, 130, -1, nil, function(v381)
            if v381 == -1 then
                return "Auto";
            elseif v381 > 100 then
                return "+" .. v381 - 100;
            else
                return nil;
            end;
        end));
        v297.auto_scope = v65.push("Ragebot", "dormant_aimbot.auto_scope", v298:switch("Auto Scope"));
        v280.dormant_aimbot = v297;
        v280.fast_ladder = {
            enabled = v65.push("Movement", "fast_ladder.enabled", l_v281_0.ragebot:switch(l_v199_1(ui.get_icon("water-ladder"), "\a{Link Active}Fast\aDEFAULT Ladder", 0, 6)))
        };
        v280.grenade_throw_fix = {
            enabled = v65.push("Ragebot", "grenade_throw_fix.enabled", l_v281_0.ragebot2:switch(l_v199_1(ui.get_icon("bomb"), "\a{Link Active}Grenade\aDEFAULT Throw Fix", 0, 7)))
        };
        local v382 = {
            enabled = v65.push("Ragebot", "super_toss.enabled", l_v281_0.ragebot2:switch(l_v199_1(ui.get_icon("bomb"), "\aADAD61FF" .. "Super Toss", 0, 7)))
        };
        v280.super_toss = v382;
        v382.enabled:tooltip("This feature allows you to stabilize your grenade prediction");
        v280.clantag = {
            enabled = v65.push("Other", "clantag.enabled", l_v281_0.other:switch(l_v199_1(ui.get_icon("tags"), "\a{Link Active}Spectral\aDEFAULT Clantag", 0, 7)))
        };
        local v383 = {
            enabled = v65.push("Other", "viewmodel.enabled", l_v281_0.other:switch(l_v199_1(ui.get_icon("gun"), "Viewmodel", 0, 7)))
        };
        local v384 = v383.enabled:create();
        v383.fov = v65.push("Other", "viewmodel.fov", v384:slider("Field of View", 0, 1000, 680, 0.1));
        v383.offset_x = v65.push("Other", "viewmodel.offset_x", v384:slider("Offset X", -100, 100, 25, 0.1));
        v383.offset_y = v65.push("Other", "viewmodel.offset_y", v384:slider("Offset Y", -100, 100, 0, 0.1));
        v383.offset_z = v65.push("Other", "viewmodel.offset_z", v384:slider("Offset Z", -100, 100, -15, 0.1));
        v383.opposite_knife_hand = v65.push("Other", "viewmodel.opposite_knife_hand", v384:switch("Opposite knife hand"));
        v280.viewmodel = v383;
        v384 = {
            enabled = v65.push("Ragebot", "ping_spike.enabled", l_v281_0.ragebot2:switch(l_v199_1(ui.get_icon("wifi"), "\aADAD61FF" .. "Fake Latency", 0, 5)))
        };
        local v385 = v384.enabled:create();
        v384.value = v65.push("Ragebot", "ping_spike.value", v385:slider("Value", 0, 1000, 1000, 1, "ms"));
        v384.enabled:tooltip("This feature allows you to overdrive the neverlose's values of ping spok");
        v280.ping_spike = v384;
        v280.no_fall_damage = {
            enabled = v65.push("Ragebot", "no_fall_damage.enabled", l_v281_0.other:switch(l_v199_1(ui.get_icon("person-falling"), "No Fall Damage", 1, 8)))
        };
        local v386 = {
            label = l_v281_0.visuals:label(l_v199_1(ui.get_icon("marker"), "Watermark", 0, 5))
        };
        local v387 = v386.label:create();
        v386.style = v65.push("Visuals", "watermark.style", v387:combo("Style", {
            [1] = "Simple", 
            [2] = "Default"
        }));
        v386.color = v65.push("Visuals", "watermark.color", v387:color_picker("Color", color(153, 178, 255, 255)));
        v280.watermark = v386;
        v387 = {
            enabled = l_v281_0.visuals:switch(l_v199_1(ui.get_icon("keyboard"), "Keybinds", 0, 5))
        };
        local v388 = v387.enabled:create();
        v387.color = v65.push("Visuals", "keybinds.color", v388:color_picker("Color", color(153, 178, 255, 255)));
        v280.keybinds = v387;
        v388 = {
            enabled = v65.push("Visuals", "scope_overlay.enabled", l_v281_0.visuals:switch(l_v199_1(ui.get_icon("crosshairs"), "\a{Link Active}Scope\aDEFAULT Overlay", 0, 6)))
        };
        local v389 = v388.enabled:create();
        v388.color = v65.push("Visuals", "scope_overlay.color", v389:color_picker("Color"));
        v388.position = v65.push("Visuals", "scope_overlay.position", v389:slider("Position", 0, 500, 105, nil, "px"));
        v388.offset = v65.push("Visuals", "scope_overlay.offset", v389:slider("Offset", 0, 500, 10, nil, "px"));
        v388.t_style = v65.push("Visuals", "scope_overlay.t_style", v389:switch("T Style"));
        v280.scope_overlay = v388;
        v389 = {
            enabled = v65.push("Visuals", "antiaim_arrows.enabled", l_v281_0.visuals:switch(l_v199_1(ui.get_icon("arrows-left-right"), "Anti-Aim Arrows", 0, 6)))
        };
        local v390 = v389.enabled:create();
        v389.color = v65.push("Visuals", "antiaim_arrows.color", v390:color_picker("Color", {
            Manual = {
                color("BEEC28FF")
            }, 
            Desync = {
                color("21A3DEFF")
            }
        }));
        v389.type = v65.push("Visuals", "antiaim_arrows.type", v390:combo("Type", {
            [1] = "Default", 
            [2] = "Alternative"
        }));
        v280.antiaim_arrows = v389;
        v390 = {
            enabled = v65.push("Visuals", "indicate_state.enabled", l_v281_0.visuals:switch(l_v199_1(ui.get_icon("wand-magic-sparkles"), "\a{Link Active}Indicate\aDEFAULT State", 0, 5)))
        };
        local v391 = v390.enabled:create();
        v390.type = v65.push("Visuals", "indicate_state.type", v391:combo("Type", {
            [1] = "Default", 
            [2] = "Alternative"
        }));
        v390.offset = v65.push("Visuals", "indicate_state.offset", v391:slider("Offset", 10, 400, 10, nil, "px"));
        v390.color = v65.push("Visuals", "indicate_state.color", v391:color_picker("Color"));
        v280.indicate_state = v390;
        v391 = {
            enabled = v65.push("Visuals", "damage_indicator.enabled", l_v281_0.visuals2:switch(l_v199_1(ui.get_icon("hundred-points"), "Damage Indicator", 0, 6)))
        };
        local v392 = v391.enabled:create();
        v391.color = v65.push("Visuals", "damage_indicator.color", v392:color_picker("Color"));
        v391.font = v65.push("Visuals", "damage_indicator.font", v392:combo("Font", {
            [1] = "Default", 
            [2] = "Small"
        }));
        v280.damage_indicator = v391;
        v392 = {
            enabled = v65.push("Visuals", "velocity_warning.enabled", l_v281_0.visuals2:switch(l_v199_1(ui.get_icon("triangle-exclamation"), "Velocity Warning", 0, 6)))
        };
        local v393 = v392.enabled:create();
        v392.color = v65.push("Visuals", "velocity_warning.color", v393:color_picker("Color"));
        v280.velocity_warning = v392;
        v393 = {
            enabled = v65.push("Visuals", "hit_marker.enabled", l_v281_0.visuals2:switch(l_v199_1(ui.get_icon("xmark-large"), "\a{Link Active}Hit\aDEFAULT Marker", 0, 7)))
        };
        local v394 = v393.enabled:create();
        v393.color = v65.push("Visuals", "hit_marker.color", v394:color_picker("Color"));
        v280.hit_marker = v393;
        v394 = {
            enabled = v65.push("Visuals", "fovanimations.enabled", l_v281_0.visuals2:switch(l_v199_1(ui.get_icon("telescope"), "Scope Animations", 0, 4)))
        };
        local v395 = v394.enabled:create();
        v394.select = v65.push("Visuals", "fovanimations.select", v395:selectable("Select", {
            [1] = "First Person", 
            [2] = "Third Person"
        }));
        v280.fovanimations = v394;
        v395 = {
            enabled = v65.push("Visuals", "kibit_marker.enabled", l_v281_0.visuals2:switch(l_v199_1(ui.get_icon("plus-large"), "\a{Link Active}Kibit\aDEFAULT Marker", 0, 6)))
        };
        local v396 = v395.enabled:create();
        v395.color = v65.push("Visuals", "kibit_marker.color", v396:color_picker("Color", {
            Vertical = {
                color("00FF00FF")
            }, 
            Horizontal = {
                color("00FFFFFF")
            }
        }));
        v280.kibit_marker = v395;
        v396 = {};
        local function v399(v397, v398)
            -- upvalues: l_v156_2 (ref)
            return l_v156_2(v398) .. v397 .. l_v156_2(v398);
        end;
        local v400 = {
            [133] = "4:3", 
            [125] = "5:4", 
            [166] = "16:9", 
            [160] = "16:10"
        };
        v396.enabled = v65.push("Visuals", "aspect_ratio.enabled", l_v281_0.visuals:switch(l_v199_1(ui.get_icon("display-code"), "Aspect Ratio", 0, 5)));
        local v401 = v396.enabled:create();
        do
            local l_v400_0 = v400;
            v396.value = v65.push("Visuals", "aspect_ratio.value", v401:slider("Ratio", 0, 250, 0, 0.01, function(v403)
                -- upvalues: l_v400_0 (ref)
                return l_v400_0[v403] or nil;
            end));
            v401:button(v399("5:4", 6), function()
                -- upvalues: v396 (ref)
                v396.value:set(125);
            end, true);
            v401:button(v399("4:3", 6), function()
                -- upvalues: v396 (ref)
                v396.value:set(133);
            end, true);
            v401:button(v399("16:9", 6), function()
                -- upvalues: v396 (ref)
                v396.value:set(166);
            end, true);
            v401:button(v399("16:10", 5), function()
                -- upvalues: v396 (ref)
                v396.value:set(160);
            end, true);
            v280.aspect_ratio = v396;
        end;
        v280.label = {
            enabled = v65.push("Visuals", "label.enabled", l_v281_0.visuals3:label("\a{Link Active}\226\156\166\aDEFAULT spectral loves \a{Link Active}you"))
        };
        v90.features = v280;
    end;
end;
v95 = nil;
v95 = {};
v105 = 2;
v112 = function(v404)
    return v404.Border;
end;
v156 = function(v405)
    local v406, v407, v408, v409 = v405["Link Active"]:to_hsl();
    return color():as_hsl(v406, v407 - 0.25, v408 - 0.1, v409 * 0.75);
end;
v199 = function(v410)
    local v411, v412, v413, v414 = v410["Main Window Background"]:to_hsl();
    return color():as_hsl(v411, v412, v413 + 0.05, v414);
end;
v200 = function(v415)
    return v415["Main Window Background"];
end;
do
    local l_v105_3, l_v112_3, l_v156_3, l_v199_2, l_v200_1 = v105, v112, v156, v199, v200;
    v95.draw = function(v421, v422, v423, v424)
        -- upvalues: l_v112_3 (ref), l_v200_1 (ref), l_v199_2 (ref), l_v105_3 (ref)
        local v425 = l_v112_3(v423);
        local v426 = l_v200_1(v423);
        local v427 = l_v199_2(v423);
        if v424 ~= nil then
            v425 = v425:alpha_modulate(v425.a * v424);
            v426 = v426:alpha_modulate(v426.a * v424);
            v427 = v427:alpha_modulate(v427.a * v424);
        end;
        render.gradient(v421, v422, v426, v426, v427, v427, l_v105_3);
        render.rect_outline(v421, v422, v425, 1, l_v105_3);
    end;
    v95.line = function(v428, v429, v430, v431)
        -- upvalues: l_v105_3 (ref), l_v156_3 (ref)
        local v432 = ((v429.x - v428.x) * 0.5 - l_v105_3 * 2) * 0.66;
        if v432 < 5 then
            return;
        else
            local v433 = (v428.x + v429.x) * 0.5;
            local v434 = v429.y - 1;
            local v435 = l_v156_3(v430);
            local v436 = v435:alpha_modulate(0);
            if v431 ~= nil then
                v435 = v435:alpha_modulate(v435.a * v431);
            end;
            render.gradient(vector(v433, v434), vector(v433 - v432, v434 - 1), v435, v436, v435, v436);
            render.gradient(vector(v433, v434), vector(v433 + v432, v434 - 1), v435, v436, v435, v436);
            return;
        end;
    end;
end;
v105 = nil;
v112 = {};
v156 = 12;
v199 = 6;
v200 = 5;
local function v442(v437, v438, v439, v440)
    local v441 = v439:clone();
    v441.a = v441.a * 0.5 * v440;
    render.shadow(v437, v438, v441, 24, 0, 12);
    render.rect(v437, v438, color(20, 20, 20, 255 * v440), 12);
end;
do
    local l_v112_4, l_v156_4, l_v199_3, l_v200_2, l_v442_0 = v112, v156, v199, v200, v442;
    local function v472()
        -- upvalues: l_v112_4 (ref), l_v156_4 (ref), l_v199_3 (ref), l_v442_0 (ref), l_v200_2 (ref)
        local v448 = 1;
        local l_realtime_0 = globals.realtime;
        local v450 = render.screen_size();
        local v451 = vector(v450.x * 0.5, v450.y * 0.8);
        local _ = ui.get_style();
        local v453 = ui.get_icon("triangle-exclamation");
        local v454 = #l_v112_4;
        local v455 = color(200, 200, 200);
        for v456 = v454, 1, -1 do
            local v457 = l_v112_4[v456];
            local v458 = v454 - v456 + 1;
            local v459 = v457.time < l_realtime_0 or v458 > 6;
            local v460 = v457.alpha:update(0.1, not v459);
            if v459 and v460 <= 0.01 then
                table.remove(l_v112_4, v456);
            end;
        end;
        for v461 = 1, #l_v112_4 do
            local v462 = l_v112_4[v461];
            local v463 = string.format("\a%s%s \a%s%s", v462.hex, v453, "DEFAULT", v462.text);
            local l_value_0 = v462.alpha.value;
            local v465 = v451:clone();
            local v466 = render.measure_text(v448, "s", v463);
            local v467 = v466 + vector(l_v156_4, l_v199_3) * 2;
            local v468 = v455:alpha_modulate(v455.a * l_value_0);
            local v469 = v467:clone();
            v465.x = v465.x - v469.x * 0.5;
            l_v442_0(v465, v465 + v469, v462.color, l_value_0);
            local _ = nil;
            local v471 = v465:clone() + (v467 - v466) * 0.5;
            v471.y = v471.y - 1;
            render.text(v448, v471, v468, "s", v463);
            v451.y = v451.y - (v469.y + l_v200_2) * l_value_0;
        end;
    end;
    local _ = nil;
    local v474 = 0;
    local v475 = {
        hegrenade = "naded", 
        knife = "knifed", 
        inferno = "burned"
    };
    local v476 = {
        [0] = "generic", 
        [1] = "head", 
        [2] = "chest", 
        [3] = "stomach", 
        [4] = "chest", 
        [5] = "chest", 
        [6] = "legs", 
        [7] = "legs", 
        [8] = "head", 
        [9] = nil, 
        [10] = "gear"
    };
    local v477 = false;
    local v478 = false;
    local v479 = false;
    do
        local l_v474_0, l_v475_0, l_v476_0, l_v477_0, l_v478_0, l_v479_0 = v474, v475, v476, v477, v478, v479;
        local function v487(v486)
            -- upvalues: l_v476_0 (ref)
            return l_v476_0[v486] or "?";
        end;
        local function v490(v488, v489)
            return (v488:gsub("%${(.-)}", (string.format("\a%s%%1\aDEFAULT", v489))));
        end;
        local function v494(v491, v492)
            -- upvalues: l_smoothy_0 (ref), l_v112_4 (ref)
            local v493 = {
                hex = v491:to_hex(), 
                color = v491, 
                text = v492, 
                time = globals.realtime + 3, 
                alpha = l_smoothy_0.new(0)
            };
            table.insert(l_v112_4, v493);
            return v493;
        end;
        local function v509(v495)
            -- upvalues: l_v475_0 (ref), v487 (ref), l_v477_0 (ref), l_v474_0 (ref), v10 (ref), v490 (ref), v90 (ref), l_v478_0 (ref), v4 (ref), l_v479_0 (ref), v494 (ref)
            local l_target_0 = v495.target;
            local l_damage_0 = v495.damage;
            local _ = v495.wanted_damage;
            local _ = l_v475_0[v495.weapon];
            local l_backtrack_0 = v495.backtrack;
            local l_hitchance_0 = v495.hitchance;
            local v502 = l_target_0:get_name();
            local v503 = v487(v495.wanted_hitgroup);
            local v504 = v487(v495.hitgroup);
            if l_v477_0 then
                local v505 = string.format("registered ${%sth} ${shot} at ${%s}'s ${%s} for ${%d} damage (history = ${%dt}, wanted hitbox = ${%s}, hitchance = ${%s}%%)", l_v474_0, v502:lower(), v504, l_damage_0, l_backtrack_0, v503, l_hitchance_0);
                v10.raw(v490(v505, "\a" .. v90.features.aimbot_logs.color:get():to_hex()));
            end;
            if l_v478_0 then
                local v506 = string.format("[${%s}] registered ${%sth} ${shot} at ${%s}'s ${%s} for ${%d} damage (history = ${%dt}, wanted hitbox = ${%s}, hitchance = ${%s}%%)", v4.name:lower(), l_v474_0, v502:lower(), v504, l_damage_0, l_backtrack_0, v503, l_hitchance_0);
                print_dev(v490(v506, "\a" .. v90.features.aimbot_logs.color:get():to_hex()));
            end;
            if l_v479_0 then
                local v507 = string.format("hit ${%s}'s ${%s} for ${%d}!", v502, v504, l_damage_0);
                local v508 = v90.features.aimbot_logs.color:get();
                v494(v508, v490(v507, v508:to_hex()));
            end;
        end;
        local function v523(v510, _, v512, _, _)
            -- upvalues: l_v475_0 (ref), l_v477_0 (ref), v10 (ref), v490 (ref), v90 (ref), l_v478_0 (ref), v4 (ref), l_v479_0 (ref), v494 (ref)
            local v515 = l_v475_0[v510.weapon];
            if v515 == nil then
                return;
            else
                local v516 = v512:get_name();
                local l_dmg_health_0 = v510.dmg_health;
                local l_health_0 = v510.health;
                if l_v477_0 then
                    local v519 = string.format("%s ${%s}'s ${generic} for ${%d} damage (${%s} health remaining)", v515, v516, l_dmg_health_0, l_health_0);
                    v10.raw(v490(v519, "\a" .. v90.features.aimbot_logs.color:get():to_hex()));
                end;
                if l_v478_0 then
                    local v520 = string.format("[${%s}] %s ${%s}'s ${generic} for ${%d} damage (${%s} health remaining)", v4.name:lower(), v515, v516, l_dmg_health_0, l_health_0);
                    print_dev(v490(v520, "\a" .. v90.features.aimbot_logs.color:get():to_hex()));
                end;
                if l_v479_0 then
                    local v521 = string.format("%s ${%s}'s ${generic} for ${%d} damage (${%s} health remaining)", v515, v516, l_dmg_health_0, l_health_0);
                    local v522 = v90.features.aimbot_logs.color:get();
                    v494(v522, v490(v521, v522:to_hex()));
                end;
                return;
            end;
        end;
        local function v536(v524)
            -- upvalues: v487 (ref), l_v477_0 (ref), l_v474_0 (ref), v10 (ref), v490 (ref), v90 (ref), l_v478_0 (ref), v4 (ref), l_v479_0 (ref), v494 (ref)
            local l_state_0 = v524.state;
            local l_target_1 = v524.target;
            local l_backtrack_1 = v524.backtrack;
            local l_hitchance_1 = v524.hitchance;
            local l_spread_0 = v524.spread;
            if l_spread_0 == nil then
                spread2 = 0;
            else
                spread2 = math.floor(l_spread_0);
            end;
            local v530 = l_target_1:get_name();
            local v531 = v487(v524.wanted_hitgroup);
            if l_v477_0 then
                local v532 = string.format("missed ${%sth} shot ${%s}'s ${%s} due to ${%s} (history = ${%dt}, spread = ${%s\194\176} or chance of hit at ${%s} = ${%s}%%)", l_v474_0, v530:lower(), v531, l_state_0, l_backtrack_1, spread2, v531, l_hitchance_1);
                v10.raw(v490(v532, "\a" .. v90.features.aimbot_logs.misscolor:get():to_hex()));
            end;
            if l_v478_0 then
                local v533 = string.format("[${%s}] missed ${%sth} shot ${%s}'s ${%s} due to ${%s} (history = ${%dt}, spread = ${%s\194\176} or chance of hit at ${%s} = ${%s}%%)", v4.name:lower(), l_v474_0, v530:lower(), v531, l_state_0, l_backtrack_1, spread2, v531, l_hitchance_1);
                print_dev(v490(v533, "\a" .. v90.features.aimbot_logs.misscolor:get():to_hex()));
            end;
            if l_v479_0 then
                local v534 = string.format("missed ${%s}'s ${%s} due to ${%s}!", v530, v531, l_state_0);
                local v535 = v90.features.aimbot_logs.misscolor:get();
                v494(v535, v490(v534, v535:to_hex()));
            end;
        end;
        local function v538(v537)
            -- upvalues: l_v474_0 (ref), v536 (ref), v509 (ref)
            l_v474_0 = l_v474_0 + 1;
            if v537.state ~= nil then
                v536(v537);
            else
                v509(v537);
            end;
        end;
        events.player_hurt:set(function(v539)
            -- upvalues: l_v477_0 (ref), v523 (ref)
            local v540 = entity.get_local_player();
            local v541 = entity.get(v539.userid, true);
            local v542 = entity.get(v539.attacker, true);
            if l_v477_0 and v542 == v540 and v541 ~= v540 then
                v523(v539, v540, v541, v542);
            end;
        end);
        local function v552(v543)
            -- upvalues: v487 (ref), l_v477_0 (ref), v10 (ref), v490 (ref), v90 (ref), l_v478_0 (ref), l_v479_0 (ref), v494 (ref)
            local l_userid_0 = v543.userid;
            local l_dmg_health_1 = v543.dmg_health;
            local v546 = l_userid_0:get_name();
            local v547 = v487(v543.hitgroup);
            if l_v477_0 then
                local v548 = string.format("${dormant} hit ${%s}'s ${%s} for ${%d} damage", v546, v547, l_dmg_health_1);
                v10.raw(v490(v548, "\a" .. v90.features.aimbot_logs.color:get():to_hex()));
            end;
            if l_v478_0 then
                local v549 = string.format("${dormant} hit ${%s}'s ${%s} for ${%d} damage", v546, v547, l_dmg_health_1);
                print_dev(v490(v549, "\a" .. v90.features.aimbot_logs.color:get():to_hex()));
            end;
            if l_v479_0 then
                local v550 = string.format("${dormant} hit ${%s}'s ${%s} for ${%d} damage", v546, v547, l_dmg_health_1);
                local v551 = v90.features.aimbot_logs.color:get();
                v494(v551, v490(v550, v551:to_hex()));
            end;
        end;
        local function v563(v553)
            -- upvalues: l_v477_0 (ref), v10 (ref), v490 (ref), v90 (ref), l_v478_0 (ref), l_v479_0 (ref), v494 (ref)
            local l_userid_1 = v553.userid;
            local v555 = math.floor(0.5 + v553.accuracy * 100);
            local v556 = v553.aim_point:lower();
            local v557 = l_userid_1:get_name();
            local v558 = v553.aim_hitbox:lower();
            if l_v477_0 then
                local v559 = string.format("${dormant} missed ${%s}'s ${%s} [accuracy: ${%d%%}, point: ${%s}]", v557, v558, v555, v556);
                v10.raw(v490(v559, "\a" .. v90.features.aimbot_logs.misscolor:get():to_hex()));
            end;
            if l_v478_0 then
                local v560 = string.format("${dormant} missed ${%s}'s ${%s}", v557, v558);
                print_dev(v490(v560, "\a" .. v90.features.aimbot_logs.misscolor:get():to_hex()));
            end;
            if l_v479_0 then
                local v561 = string.format("${dormant} missed ${%s}'s ${%s}", v557, v558);
                local v562 = v90.features.aimbot_logs.misscolor:get();
                v494(v562, v490(v561, v562:to_hex()));
            end;
        end;
        local l_aimbot_logs_0 = v90.features.aimbot_logs;
        local function v566(v565)
            -- upvalues: l_v477_0 (ref), l_v478_0 (ref), l_v479_0 (ref), v472 (ref)
            l_v477_0 = v565:get("Console");
            l_v478_0 = v565:get("Notify");
            l_v479_0 = v565:get("Screen");
            events.render(v472, l_v479_0);
        end;
        do
            local l_v566_0 = v566;
            local function v570(v568)
                -- upvalues: l_aimbot_logs_0 (ref), l_v566_0 (ref), v472 (ref), v538 (ref), v552 (ref), v563 (ref)
                local v569 = v568:get();
                if v569 then
                    l_aimbot_logs_0.output:set_callback(l_v566_0, true);
                else
                    l_aimbot_logs_0.output:unset_callback(l_v566_0);
                    events.render(v472, false);
                end;
                events.aim_ack(v538, v569);
                events.dormant_hit(v552, v569);
                events.dormant_miss(v563, v569);
            end;
            l_aimbot_logs_0.enabled:set_callback(v570, true);
        end;
    end;
    v474 = nil;
    v475 = 5;
    v476 = nil;
    v477 = nil;
    v478 = nil;
    v479 = nil;
    local v571 = nil;
    local v572 = false;
    local v573 = false;
    local v574 = 1;
    local v575 = 0;
    local v576 = {
        [0] = "Generic", 
        [1] = "Head", 
        [2] = "Chest", 
        [3] = "Stomach", 
        [4] = "Chest", 
        [5] = "Chest", 
        [6] = "Legs", 
        [7] = "Legs", 
        [8] = "Head", 
        [9] = nil, 
        [10] = "Gear"
    };
    local v577 = {
        [1] = {
            hitbox = "Stomach", 
            scale = 5, 
            vec = vector(0, 0, 40)
        }, 
        [2] = {
            hitbox = "Chest", 
            scale = 6, 
            vec = vector(0, 0, 50)
        }, 
        [3] = {
            hitbox = "Head", 
            scale = 3, 
            vec = vector(0, 0, 58)
        }, 
        [4] = {
            hitbox = "Legs", 
            scale = 4, 
            vec = vector(0, 0, 20)
        }
    };
    local function v581(v578, v579)
        for v580 = 1, #v578 do
            if v578[v580] == v579 then
                return true;
            end;
        end;
        return false;
    end;
    local function v583(v582)
        return v582 >= 1 and v582 <= 6;
    end;
    local function v588()
        local v584 = {};
        local v585 = entity.get_player_resource();
        for v586 = 1, globals.max_players do
            local v587 = entity.get(v586);
            if v587 ~= nil and v585.m_bConnected[v586] and v587:is_enemy() and v587:is_dormant() then
                table.insert(v584, v587);
            end;
        end;
        return v584;
    end;
    local function v595(v589, v590, v591)
        local v592 = v589:to(v590):angles();
        local v593 = math.rad(v592.y + 90);
        local v594 = vector(math.cos(v593), math.sin(v593), 0) * v591;
        return {
            [1] = {
                text = "Middle", 
                vec = v590
            }, 
            [2] = {
                text = "Left", 
                vec = v590 + v594
            }, 
            [3] = {
                text = "Right", 
                vec = v590 - v594
            }
        };
    end;
    local function v603(v596, v597, v598, v599)
        local v600, v601 = utils.trace_bullet(v596, v597, v598, v599);
        if v601 ~= nil then
            local l_entity_0 = v601.entity;
            if l_entity_0 == nil then
                return 0, v601;
            elseif l_entity_0:is_player() and not l_entity_0:is_enemy() then
                return 0, v601;
            end;
        end;
        return v600, v601;
    end;
    do
        local l_v475_1, l_v476_1, l_v477_1, l_v478_1, l_v479_1, l_v571_0, l_v572_0, l_v573_0, l_v574_0, l_v575_0, l_v576_0, l_v577_0, l_v581_0, l_v583_0, l_v588_0, l_v595_0, l_v603_0 = v475, v476, v477, v478, v479, v571, v572, v573, v574, v575, v576, v577, v581, v583, v588, v595, v603;
        local function v660(v621)
            -- upvalues: v7 (ref), l_v575_0 (ref), l_v583_0 (ref), l_v588_0 (ref), v90 (ref), l_v574_0 (ref), l_v577_0 (ref), l_v581_0 (ref), l_v595_0 (ref), l_v603_0 (ref), l_v476_1 (ref), l_v478_1 (ref), l_v479_1 (ref), l_v477_1 (ref), l_v571_0 (ref), l_v475_1 (ref), l_v573_0 (ref)
            v7.rage.main.enabled[2]:override(false);
            local v622 = entity.get_local_player();
            if v622 == nil then
                return;
            else
                local v623 = v622:get_player_weapon();
                if v623 == nil then
                    return;
                else
                    local v624 = v623:get_weapon_info();
                    if v624 == nil then
                        return;
                    else
                        local v625 = v623:get_inaccuracy();
                        if v625 == nil then
                            return;
                        else
                            local l_tickcount_0 = globals.tickcount;
                            local v627 = v622:get_eye_position();
                            local l_current_0 = v622:get_simulation_time().current;
                            local v629 = bit.band(v622.m_fFlags, bit.lshift(1, 0)) ~= 0;
                            if l_tickcount_0 < l_v575_0 then
                                return;
                            elseif v621.in_jump and not v629 then
                                return;
                            else
                                local l_weapon_type_0 = v624.weapon_type;
                                if not l_v583_0(l_weapon_type_0) or v623.m_iClip1 <= 0 then
                                    return false;
                                else
                                    local v631 = l_v588_0();
                                    local v632 = v90.features.dormant_aimbot.hitboxes:get();
                                    if l_tickcount_0 % #v631 ~= 0 then
                                        l_v574_0 = l_v574_0 + 1;
                                    else
                                        l_v574_0 = 1;
                                    end;
                                    local v633 = v631[l_v574_0];
                                    if v633 == nil then
                                        return;
                                    else
                                        local v634 = v633:get_bbox();
                                        local v635 = v633:get_origin();
                                        local l_m_flDuckAmount_0 = v633.m_flDuckAmount;
                                        local v637 = v90.features.dormant_aimbot.hitchance:get();
                                        local v638 = v90.features.dormant_aimbot.damage:get();
                                        if v638 == -1 then
                                            v638 = v7.rage.selection.min_damage:get();
                                        end;
                                        if v638 > 100 then
                                            v638 = v638 - 100 + v633.m_iHealth;
                                        end;
                                        local v639 = {};
                                        for v640 = 1, #l_v577_0 do
                                            local v641 = l_v577_0[v640];
                                            local l_vec_0 = v641.vec;
                                            local l_scale_0 = v641.scale;
                                            local l_hitbox_0 = v641.hitbox;
                                            if l_hitbox_0 == "Head" then
                                                l_vec_0 = l_vec_0 - vector(0, 0, 10 * l_m_flDuckAmount_0);
                                            end;
                                            if l_hitbox_0 == "Chest" then
                                                l_vec_0 = l_vec_0 - vector(0, 0, 4 * l_m_flDuckAmount_0);
                                            end;
                                            if #v632 ~= 0 then
                                                if l_v581_0(v632, l_hitbox_0) then
                                                    table.insert(v639, {
                                                        vec = l_vec_0, 
                                                        scale = l_scale_0, 
                                                        hitbox = l_hitbox_0
                                                    });
                                                end;
                                            else
                                                table.insert(v639, 1, {
                                                    vec = l_vec_0, 
                                                    scale = l_scale_0, 
                                                    hitbox = l_hitbox_0
                                                });
                                            end;
                                        end;
                                        if not (v624.is_revolver and not (v623.m_flNextPrimaryAttack >= l_current_0) or math.max(v622.m_flNextAttack, v623.m_flNextPrimaryAttack, v623.m_flNextSecondaryAttack) < l_current_0) then
                                            return;
                                        else
                                            local v645 = nil;
                                            local v646 = nil;
                                            if math.floor(v634.alpha * 100) + 5 <= v637 then
                                                return;
                                            else
                                                for v647 = 1, #v639 do
                                                    local v648 = v639[v647];
                                                    local v649 = l_v595_0(v627, v635 + v648.vec, v648.scale);
                                                    for v650 = 1, #v649 do
                                                        local v651 = v649[v650];
                                                        local l_vec_1 = v651.vec;
                                                        local v654, v655 = l_v603_0(v622, v627, l_vec_1, function(v653)
                                                            -- upvalues: v633 (ref)
                                                            return v653 == v633;
                                                        end);
                                                        if (v655 == nil or not v655:is_visible()) and v654 ~= 0 and v638 < v654 then
                                                            v645 = l_vec_1;
                                                            v646 = v654;
                                                            l_v476_1 = v633;
                                                            l_v478_1 = v648.hitbox;
                                                            l_v479_1 = v654;
                                                            l_v477_1 = v651.text;
                                                            l_v571_0 = v634.alpha;
                                                            break;
                                                        end;
                                                    end;
                                                    if v645 and v646 then
                                                        break;
                                                    end;
                                                end;
                                                if not v645 or not v646 then
                                                    return;
                                                else
                                                    local v656 = v627:to(v645):angles();
                                                    v621.block_movement = 1;
                                                    if v90.features.dormant_aimbot.auto_scope:get() then
                                                        local v657 = not v621.in_jump and v629;
                                                        local v658 = v622.m_bIsScoped or v622.m_bResumeZoom;
                                                        local v659 = v624.weapon_type == l_v475_1;
                                                        if not v658 and v659 and v657 then
                                                            v621.in_attack2 = true;
                                                        end;
                                                    end;
                                                    if v625 < 0.01 then
                                                        v621.view_angles = v656;
                                                        v621.in_attack = true;
                                                        l_v573_0 = true;
                                                    end;
                                                    return;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        local function v662(v661)
            -- upvalues: l_v573_0 (ref), l_v572_0 (ref), l_v476_1 (ref), l_v478_1 (ref), l_v479_1 (ref), l_v477_1 (ref), l_v571_0 (ref)
            utils.execute_after(0.03, function()
                -- upvalues: v661 (ref), l_v573_0 (ref), l_v572_0 (ref), l_v476_1 (ref), l_v478_1 (ref), l_v479_1 (ref), l_v477_1 (ref), l_v571_0 (ref)
                if entity.get(v661.userid, true) == entity.get_local_player() then
                    if l_v573_0 and not l_v572_0 then
                        events.dormant_miss:call({
                            userid = l_v476_1, 
                            aim_hitbox = l_v478_1, 
                            aim_damage = l_v479_1, 
                            aim_point = l_v477_1, 
                            accuracy = l_v571_0
                        });
                    end;
                    l_v572_0 = false;
                    l_v573_0 = false;
                    l_v476_1 = nil;
                    l_v478_1 = nil;
                    l_v479_1 = nil;
                    l_v477_1 = nil;
                    l_v571_0 = nil;
                end;
            end);
        end;
        local function v668(v663)
            -- upvalues: l_v573_0 (ref), l_v572_0 (ref), l_v576_0 (ref), l_v477_1 (ref), l_v478_1 (ref), l_v479_1 (ref)
            local v664 = entity.get_local_player();
            local v665 = entity.get(v663.userid, true);
            local v666 = entity.get(v663.attacker, true);
            if v665 == nil or v666 ~= v664 then
                return;
            else
                local v667 = v665:get_bbox();
                if v667 == nil then
                    return;
                else
                    if v665:is_dormant() and l_v573_0 == true then
                        l_v572_0 = true;
                        events.dormant_hit:call({
                            userid = v665, 
                            attacker = v666, 
                            health = v663.health, 
                            armor = v663.armor, 
                            weapon = v663.weapon, 
                            dmg_health = v663.dmg_health, 
                            dmg_armor = v663.dmg_armor, 
                            hitgroup = v663.hitgroup, 
                            accuracy = v667.alpha, 
                            hitbox = l_v576_0[v663.hitgroup], 
                            aim_point = l_v477_1, 
                            aim_hitbox = l_v478_1, 
                            aim_damage = l_v479_1
                        });
                    end;
                    return;
                end;
            end;
        end;
        local function v669()
            -- upvalues: v7 (ref)
            v7.rage.main.enabled[2]:override();
        end;
        v90.features.dormant_aimbot.enabled:set_callback(function(v670)
            -- upvalues: v7 (ref), v669 (ref), v660 (ref), v662 (ref), v668 (ref)
            local v671 = v670:get();
            if not v671 then
                v7.rage.main.enabled[2]:override();
            end;
            events.shutdown(v669, v671);
            events.createmove(v660, v671);
            events.weapon_fire(v662, v671);
            events.player_hurt(v668, v671);
        end, true);
    end;
    v475 = nil;
    v476 = false;
    v477 = math.pi * 2;
    v478 = v477 / 8;
    do
        local l_v476_2, l_v477_2, l_v478_2, l_v479_2, l_v571_1 = v476, v477, v478, v479, v571;
        l_v479_2 = function(v677, v678)
            -- upvalues: l_v477_2 (ref), l_v478_2 (ref)
            local v679 = v677:get_origin();
            for v680 = 0, l_v477_2, l_v478_2 do
                local v681 = math.sin(v680);
                local v682 = math.cos(v680);
                local v683 = v679.x + v682 * 10;
                local v684 = v679.y + v681 * 10;
                local v685 = vector(v683, v684, v679.z);
                local v686 = v685:clone();
                v686.z = v686.z - v678;
                if utils.trace_line(v685, v686, v677).fraction < 1 then
                    return true;
                end;
            end;
            return false;
        end;
        l_v571_1 = function(v687)
            -- upvalues: l_v476_2 (ref), l_v479_2 (ref)
            local v688 = entity.get_local_player();
            if v688 == nil then
                return;
            elseif v688.m_vecVelocity.z >= -500 then
                l_v476_2 = false;
                return;
            else
                if l_v479_2(v688, 15) then
                    l_v476_2 = false;
                elseif l_v479_2(v688, 75) then
                    l_v476_2 = true;
                end;
                v687.in_duck = l_v476_2;
                return;
            end;
        end;
        v90.features.no_fall_damage.enabled:set_callback(function(v689)
            -- upvalues: l_v571_1 (ref)
            events.createmove(l_v571_1, v689:get());
        end, true);
    end;
    v476 = nil;
    v477 = 9;
    v478 = function(v690)
        local l_x_0 = render.camera_angles().x;
        if v690.forwardmove > 0 and l_x_0 < 45 then
            v690.view_angles.x = 89;
            v690.in_moveright = 1;
            v690.in_moveleft = 0;
            v690.in_forward = 0;
            v690.in_back = 1;
            if v690.sidemove == 0 then
                v690.view_angles.y = v690.view_angles.y + 90;
            end;
            if v690.sidemove < 0 then
                v690.view_angles.y = v690.view_angles.y + 150;
            end;
            if v690.sidemove > 0 then
                v690.view_angles.y = v690.view_angles.y + 30;
            end;
        end;
        if v690.forwardmove < 0 then
            v690.view_angles.x = 89;
            v690.in_moveleft = 1;
            v690.in_moveright = 0;
            v690.in_forward = 1;
            v690.in_back = 0;
            if v690.sidemove == 0 then
                v690.view_angles.y = v690.view_angles.y + 90;
            end;
            if v690.sidemove > 0 then
                v690.view_angles.y = v690.view_angles.y + 150;
            end;
            if v690.sidemove < 0 then
                v690.view_angles.y = v690.view_angles.y + 30;
            end;
        end;
    end;
    do
        local l_v477_3, l_v478_3, l_v479_3 = v477, v478, v479;
        l_v479_3 = function(v695)
            -- upvalues: l_v477_3 (ref), l_v478_3 (ref)
            local v696 = entity.get_local_player();
            if v696 == nil then
                return;
            elseif v696.m_MoveType ~= l_v477_3 then
                return;
            else
                l_v478_3(v695);
                return;
            end;
        end;
        v90.features.fast_ladder.enabled:set_callback(function(v697)
            -- upvalues: l_v479_3 (ref)
            events.createmove(l_v479_3, v697:get());
        end, true);
    end;
    v477 = nil;
    v478 = 0.3;
    v479 = function(v698, v699, v700)
        return v698 + v700 * (v699 - v698);
    end;
    do
        local l_v478_4, l_v479_4, l_v571_2, l_v572_1, l_v575_1 = v478, v479, v571, v572, v575;
        l_v571_2 = function(v706, v707, v708, v709)
            -- upvalues: l_v479_4 (ref), l_v478_4 (ref)
            v706.x = v706.x - 10 + math.abs(v706.x) / 9;
            local v710 = vector():angles(v706);
            local v711 = v709 * 1.25;
            local v712 = math.clamp(v707 * 0.9, 15, 750);
            local v713 = math.clamp(v708, 0, 1);
            v712 = v712 * l_v479_4(l_v478_4, 1, v713);
            local l_v710_0 = v710;
            for _ = 1, 8 do
                l_v710_0 = (v710 * (l_v710_0 * v712 + v711):length() - v711) / v712;
                l_v710_0:normalize();
            end;
            local v716 = l_v710_0.angles(l_v710_0);
            if v716.x > -10 then
                v716.x = 0.9 * v716.x + 9;
            else
                v716.x = 1.125 * v716.x + 11.25;
            end;
            return v716;
        end;
        l_v572_1 = function(v717)
            -- upvalues: l_v571_2 (ref)
            local v718 = entity.get_local_player();
            if v718 == nil then
                return;
            else
                local v719 = v718:get_player_weapon();
                if v719 == nil then
                    return;
                else
                    local v720 = v719:get_weapon_info();
                    if v720 == nil then
                        return;
                    else
                        v717.angles = l_v571_2(v717.angles, v720.throw_velocity, v719.m_flThrowStrength, v717.velocity);
                        return;
                    end;
                end;
            end;
        end;
        v573 = vector();
        v574 = vector();
        l_v575_1 = function(v721)
            -- upvalues: l_v571_2 (ref)
            if v721.jitter_move ~= true then
                return;
            else
                local v722 = entity.get_local_player();
                if v722 == nil then
                    return;
                else
                    local v723 = v722:get_player_weapon();
                    if v723 == nil then
                        return;
                    else
                        local v724 = v723:get_weapon_info();
                        if v724 == nil or v724.weapon_type ~= 9 then
                            return;
                        elseif v723.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) then
                            return;
                        else
                            v721.in_speed = true;
                            local v725 = v722:simulate_movement();
                            v725:think();
                            v721.view_angles = l_v571_2(v721.view_angles, v724.throw_velocity, v723.m_flThrowStrength, v725.velocity);
                            return;
                        end;
                    end;
                end;
            end;
        end;
        v90.features.super_toss.enabled:set_callback(function(v726)
            -- upvalues: l_v575_1 (ref), l_v572_1 (ref)
            local v727 = v726:get();
            events.createmove(l_v575_1, v727);
            events.grenade_override_view(l_v572_1, v727);
        end, true);
    end;
    v478 = nil;
    v479 = function()
        -- upvalues: v7 (ref)
        v7.misc.main.other.weapon_actions:override();
    end;
    v571 = function(_)
        -- upvalues: v7 (ref)
        v7.misc.main.other.weapon_actions:override({});
    end;
    do
        local l_v479_5, l_v571_3 = v479, v571;
        v90.features.grenade_throw_fix.enabled:set_callback(function(v731)
            -- upvalues: l_v479_5 (ref), l_v571_3 (ref)
            local v732 = v731:get();
            events.shutdown(l_v479_5, v732);
            events.createmove(l_v571_3, v732);
        end);
    end;
    v479 = nil;
    v571 = cvar.r_aspectratio;
    do
        local l_v571_4, l_v572_2, l_v573_1, l_v574_1 = v571, v572, v573, v574;
        l_v572_2 = function(v737)
            -- upvalues: l_v571_4 (ref)
            if v737 == 0 then
                l_v571_4:float(0, false);
            else
                l_v571_4:float(v737, true);
            end;
        end;
        l_v573_1 = function()
            -- upvalues: l_v572_2 (ref)
            l_v572_2(0);
        end;
        l_v574_1 = v90.features.aspect_ratio;
        v575 = function(v738)
            -- upvalues: l_v572_2 (ref)
            l_v572_2(v738:get() * 0.01);
        end;
        do
            local l_v575_2 = v575;
            v576 = function(v740)
                -- upvalues: l_v574_1 (ref), l_v575_2 (ref), l_v572_2 (ref), l_v573_1 (ref)
                local v741 = v740:get();
                if v741 then
                    l_v574_1.value:set_callback(l_v575_2, true);
                else
                    l_v574_1.value:unset_callback(l_v575_2);
                    l_v572_2(0);
                end;
                events.shutdown(l_v573_1, v741);
            end;
            l_v574_1.enabled:set_callback(v576, true);
        end;
    end;
end;
v112 = nil;
v156 = nil;
v156 = {};
v199 = {};
v199.__index = v199;
v200 = false;
v442 = false;
local v742 = 0;
local v743 = false;
local function v747(v744, v745)
    if v744 == nil then
        return false;
    else
        for v746 = 1, #v744 do
            if v744[v746] == v745 then
                return true;
            end;
        end;
        return false;
    end;
end;
local function v751(v748, v749)
    for v750 = #v748, 1, -1 do
        if v748[v750] == v749 then
            table.remove(v748, v750);
            return true;
        end;
    end;
    return false;
end;
do
    local l_v200_3, l_v442_1, l_v742_0, l_v743_0, l_v747_0, l_v751_0 = v200, v442, v742, v743, v747, v751;
    local function v760(v758, v759)
        -- upvalues: l_v442_1 (ref), l_v747_0 (ref), l_v200_3 (ref), l_v742_0 (ref), l_v743_0 (ref), l_v751_0 (ref)
        if v759.choked_commands ~= 0 then
            l_v442_1 = l_v747_0(v758.options, "Jitter");
            l_v200_3 = rage.antiaim:inverter();
            return;
        else
            l_v442_1 = l_v747_0(v758.options, "Jitter");
            l_v200_3 = not rage.antiaim:inverter();
            if v758.body_yaw and l_v442_1 and v758.delay ~= nil and v758.delay > 0 then
                l_v742_0 = l_v742_0 + 1;
                if l_v742_0 > v758.delay then
                    l_v742_0 = 0;
                    l_v743_0 = not l_v743_0;
                end;
                l_v200_3 = l_v743_0;
                v758.inverter = l_v200_3;
                l_v751_0(v758.options, "Jitter");
            end;
            return;
        end;
    end;
    local function v763(v761, v762)
        -- upvalues: v760 (ref)
        v760(v761, v762);
    end;
    local function v766(v764, _)
        -- upvalues: l_v442_1 (ref), l_v200_3 (ref)
        if v764.body_yaw == nil or not l_v442_1 then
            return;
        elseif v764.yaw_modifier == "Offset" then
            if l_v200_3 then
                if v764.yaw_add == nil then
                    v764.yaw_add = 0;
                end;
                v764.yaw_add = v764.yaw_add + v764.modifier_offset;
            end;
            v764.yaw_modifier = "Disabled";
            v764.modifier_offset = 0;
            return;
        elseif v764.yaw_modifier == "Center" then
            if v764.yaw_add == nil then
                v764.yaw_add = 0;
            end;
            if l_v200_3 then
                v764.yaw_add = v764.yaw_add + v764.modifier_offset * 0.5;
            else
                v764.yaw_add = v764.yaw_add - v764.modifier_offset * 0.5;
            end;
            v764.yaw_modifier = "Disabled";
            v764.modifier_offset = 0;
            return;
        else
            return;
        end;
    end;
    local function v770(v767, _)
        -- upvalues: l_v200_3 (ref)
        if v767.yaw_left ~= nil and v767.yaw_right ~= nil then
            if v767.yaw_add == nil then
                v767.yaw_add = 0;
            end;
            local v769 = l_v200_3 and v767.yaw_left or v767.yaw_right;
            v767.yaw_add = v767.yaw_add + v769;
        end;
    end;
    local function v772(v771)
        -- upvalues: v7 (ref)
        v7.aa.angles.enabled:override(v771.enabled);
        v7.aa.angles.pitch:override(v771.pitch);
        v7.aa.angles.yaw[1]:override(v771.yaw);
        v7.aa.angles.yaw[2]:override(v771.yaw_base);
        v7.aa.angles.yaw[3]:override(v771.yaw_add);
        v7.aa.angles.yaw[4]:override(v771.avoid_backstab);
        v7.aa.angles.yaw[5]:override(v771.hidden);
        v7.aa.angles.yaw_modifier[1]:override(v771.yaw_modifier);
        v7.aa.angles.yaw_modifier[2]:override(v771.modifier_offset);
        v7.aa.angles.body_yaw[1]:override(v771.body_yaw);
        v7.aa.angles.body_yaw[2]:override(v771.inverter);
        v7.aa.angles.body_yaw[3]:override(v771.left_limit);
        v7.aa.angles.body_yaw[4]:override(v771.right_limit);
        v7.aa.angles.body_yaw[5]:override(v771.options);
        v7.aa.angles.body_yaw[6]:override(v771.freestanding_body_yaw);
        v7.aa.angles.freestanding[1]:override(v771.freestanding);
        v7.aa.angles.freestanding[2]:override(v771.disable_yaw_modifiers);
        v7.aa.angles.freestanding[3]:override(v771.body_freestanding);
        v7.aa.angles.extended_angles[1]:override(v771.extended_angles);
        v7.aa.angles.extended_angles[2]:override(v771.extended_pitch);
        v7.aa.angles.extended_angles[3]:override(v771.extended_roll);
    end;
    v199.clear = function(v773)
        for v774 in pairs(v773) do
            v773[v774] = nil;
        end;
    end;
    v199.update = function(v775, v776)
        -- upvalues: v763 (ref), v766 (ref), v770 (ref), v772 (ref)
        if v776 ~= nil then
            v763(v775, v776);
            v766(v775, v776);
            v770(v775, v776);
        end;
        v772(v775);
    end;
end;
setmetatable(v156, v199);
v199 = {};
v200 = v90.antiaim.manual_yaw;
v442 = {
    Forward = 180, 
    Right = 90, 
    Left = -90, 
    Backward = 0
};
do
    local l_v200_4, l_v442_2, l_v742_1 = v200, v442, v742;
    l_v742_1 = function()
        -- upvalues: l_v442_2 (ref), l_v200_4 (ref)
        return l_v442_2[l_v200_4.select:get()];
    end;
    v199.update = function(_, v781)
        -- upvalues: l_v742_1 (ref), l_v200_4 (ref)
        local v782 = l_v742_1();
        if v782 == nil then
            return false;
        else
            if v781.yaw_add == nil then
                v781.yaw_add = 0;
            end;
            v781.yaw_add = v781.yaw_add + v782;
            v781.yaw_base = "Local View";
            if l_v200_4.body_freestanding:get() then
                v781.body_yaw = true;
                v781.left_limit = 60;
                v781.right_limit = 60;
                v781.options = {};
                v781.freestanding_body_yaw = "Peek Fake";
            end;
            if l_v200_4.disable_yaw_modifiers:get() then
                v781.yaw_left = 0;
                v781.yaw_right = 0;
                v781.yaw_modifier = "Disabled";
                v781.body_yaw = true;
                v781.inverter = false;
                v781.left_limit = 0;
                v781.right_limit = 0;
                v781.options = {};
                v781.freestanding_body_yaw = "Off";
            end;
            v781.freestanding = false;
            return true;
        end;
    end;
end;
v200 = {};
v442 = v90.antiaim.freestanding;
do
    local l_v442_3 = v442;
    v200.update = function(_, v785)
        -- upvalues: l_v442_3 (ref)
        if not l_v442_3.enabled:get() then
            v785.freestanding = false;
            return false;
        else
            v785.hidden = false;
            v785.freestanding = true;
            v785.disable_yaw_modifiers = l_v442_3.disable_yaw_modifiers:get();
            v785.body_freestanding = l_v442_3.body_freestanding:get();
            if l_v442_3.disable_all_modifiers:get() then
                v785.yaw_left = 0;
                v785.yaw_right = 0;
                v785.yaw_modifier = "Disabled";
                v785.body_yaw = true;
                v785.inverter = false;
                v785.left_limit = 0;
                v785.right_limit = 0;
                v785.options = {};
                v785.freestanding_body_yaw = "Off";
            end;
            return true;
        end;
    end;
end;
v442 = {};
v742 = v90.antiaim.animations;
v743 = ffi.typeof("            struct {\n                float  m_flLayerAnimtime;\n                float  m_flLayerFadeOuttime;\n\n                // dispatch flags\n                void  *m_pDispatchedStudioHdr;\n                int    m_nDispatchedSrc;\n                int    m_nDispatchedDst;\n\n                int    m_nOrder;\n                int    m_nSequence;\n                float  m_flPrevCycle;\n                float  m_flWeight;\n                float  m_flWeightDeltaRate;\n\n                // used for automatic crossfades between sequence changes;\n                float  m_flPlaybackRate;\n                float  m_flCycle;\n                int    m_pOwner;\n                int    m_nInvalidatePhysicsBits;\n            } **\n        ");
do
    local l_v742_2, l_v743_1, l_v747_1, l_v751_1 = v742, v743, v747, v751;
    l_v747_1 = function(v790)
        -- upvalues: l_v743_1 (ref)
        return ffi.cast(l_v743_1, ffi.cast("uintptr_t", v790[0]) + 10640)[0];
    end;
    l_v751_1 = function(v791, _)
        -- upvalues: l_v742_2 (ref)
        if not l_v742_2.options:get("Force Falling") then
            return;
        else
            v791.m_flPoseParameter[6] = 0.5;
            return;
        end;
    end;
    local function v796(v793, v794)
        -- upvalues: l_v742_2 (ref), v12 (ref), v7 (ref)
        if not l_v742_2.options:get("Leg Breaker") then
            return;
        elseif v12.is_onground then
            v793.m_flPoseParameter[0] = 1;
            v7.aa.misc.leg_movement:override("Sliding");
            if l_v742_2.moonwalk_mode:get() then
                v793.m_flPoseParameter[7] = 0;
                v7.aa.misc.leg_movement:override("Walking");
            end;
            return;
        else
            if l_v742_2.moonwalk_in_air_mode:get() then
                local v795 = v794[6];
                v795.m_flWeight = 1;
                v795.m_flCycle = globals.curtime * 0.55 % 1;
            end;
            return;
        end;
    end;
    local function v801(_, v798)
        -- upvalues: l_v742_2 (ref), v12 (ref)
        if not l_v742_2.options:get("Move Lean") then
            return;
        elseif v12.is_onground and not l_v742_2.on_ground_force:get() then
            return;
        else
            local l_m_flWeight_0 = v798[12].m_flWeight;
            local v800 = l_v742_2.move_lean_force:get() * 1000;
            v798[12].m_flWeight = math.clamp(l_m_flWeight_0 + l_m_flWeight_0 * v800, 0, 1);
            return;
        end;
    end;
    local function v804(v802, v803)
        -- upvalues: l_v742_2 (ref)
        if not l_v742_2.options:get("Landing Pitch") then
            return;
        else
            if v803.landing then
                v802.m_flPoseParameter[12] = 0.5;
            end;
            return;
        end;
    end;
    local function v808(v805)
        -- upvalues: l_v747_1 (ref), v12 (ref), v804 (ref), l_v751_1 (ref), v801 (ref), v796 (ref)
        if entity.get_local_player() ~= v805 then
            return;
        else
            local v806 = v805:get_anim_state();
            if v806 == nil then
                return;
            else
                local v807 = l_v747_1(v805);
                if v807 == nil then
                    return;
                else
                    if v12.is_onground then
                        v804(v805, v806);
                    else
                        l_v751_1(v805, v807);
                    end;
                    v801(v805, v807);
                    v796(v805, v807);
                    return;
                end;
            end;
        end;
    end;
    local function v810(v809)
        -- upvalues: v808 (ref)
        events.post_update_clientside_animation(v808, v809:get());
    end;
    l_v742_2.enabled:set_callback(v810, true);
end;
v742 = {};
v743 = v90.antiaim.avoid_backstab;
do
    local l_v743_2 = v743;
    v742.update = function(_, v813)
        -- upvalues: l_v743_2 (ref)
        v813.avoid_backstab = l_v743_2.enabled:get();
    end;
end;
v743 = {};
v747 = v90.antiaim.force_defensive;
v751 = v90.antiaim.tickbase;
do
    local l_v747_2, l_v751_2 = v747, v751;
    local function v817(v816)
        -- upvalues: l_v747_2 (ref)
        return l_v747_2.conditions:get(v816);
    end;
    local function v818()
        -- upvalues: v7 (ref)
        v7.rage.main.hide_shots_options:override("Break LC");
        v7.rage.main.double_tap_lag_options:override("Always On");
    end;
    local function v823(v819)
        -- upvalues: l_v751_2 (ref)
        if not l_v751_2.enabled:get() then
            return;
        elseif not l_v751_2.randomize:get() then
            v819.force_defensive = v819.command_number % l_v751_2.choke:get() == 0;
            return;
        else
            local v820 = l_v751_2.type:get();
            if v820 == "Default" then
                local v821 = math.random(l_v751_2[1]:get(), l_v751_2[2]:get());
                v819.force_defensive = v819.command_number % v821 == 0;
                return;
            elseif v820 == "Ways" then
                local v822 = l_v751_2[math.random(1, l_v751_2.sliders:get())]:get();
                v819.force_defensive = v819.command_number % v822 == 0;
                return;
            else
                return;
            end;
        end;
    end;
    v743.update = function(v824, v825, v826)
        -- upvalues: l_v747_2 (ref), v817 (ref), v818 (ref), v823 (ref)
        if not l_v747_2.enabled:get() then
            return;
        elseif not v817(v826) then
            return;
        else
            v825.hidden = false;
            v818();
            v823(v824);
            return;
        end;
    end;
end;
v747 = {};
v751 = v90.antiaim.edge_yaw;
do
    local l_v751_3 = v751;
    v747.update = function(v828, v829)
        -- upvalues: l_v751_3 (ref)
        if not l_v751_3.enabled:get() then
            return false;
        else
            local v830 = entity.get_local_player();
            if v830 == nil then
                return false;
            else
                local v831 = v830:get_eye_position();
                if v831 == nil then
                    return false;
                else
                    local v832 = 0;
                    local v833 = {};
                    for v834 = 18, 360, 18 do
                        local v835 = v831 + vector():angles(0, v834) * 32;
                        local v836 = utils.trace_line(v831, v835, v830, 4294967295, 1);
                        local l_entity_1 = v836.entity;
                        if v836.fraction ~= 1 and l_entity_1 ~= nil and not v836:did_hit_non_world() then
                            v832 = v832 + 1;
                            table.insert(v833, v834);
                        end;
                    end;
                    if v832 < 2 then
                        return false;
                    else
                        local l_view_angles_0 = v828.view_angles;
                        local v839 = (v833[1] + v833[v832]) * 0.5;
                        local v840 = math.normalize_yaw(-l_view_angles_0.y + v839);
                        if math.abs(v840) > 90 then
                            return;
                        else
                            v840 = v840 * 2 + 180;
                            if v829.yaw_add == nil then
                                v829.yaw_add = 0;
                            end;
                            v829.yaw_add = v829.yaw_add + v840;
                            v829.yaw_base = "Local View";
                            v829.hidden = false;
                            return true;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v751 = {};
local l_safe_head_0 = v90.antiaim.safe_head;
do
    local l_l_safe_head_0_0 = l_safe_head_0;
    local function v853()
        -- upvalues: v12 (ref), l_l_safe_head_0_0 (ref)
        local v843 = entity.get_local_player();
        if v843 == nil then
            return nil;
        else
            local v844 = entity.get_threat();
            if v844 == nil then
                return nil;
            else
                local v845 = v843:get_player_weapon();
                if v845 == nil then
                    return nil;
                else
                    local v846 = v845:get_weapon_info();
                    local v847 = v845:get_weapon_index() == 31;
                    local v848 = v846.weapon_type == 0 and not v847;
                    local v849 = not v12.is_onground;
                    local v850 = v12.duck_amount >= 0.66;
                    local v851 = v843:get_origin();
                    local v852 = (v844:get_origin() - v851):length2dsqr();
                    if v849 and v850 then
                        if v848 and l_l_safe_head_0_0.conditions:get("Knife") then
                            return "Knife";
                        elseif v847 and l_l_safe_head_0_0.conditions:get("Zeus") then
                            return "Zeus";
                        end;
                    end;
                    if v849 and v850 and v852 > 1000000 and l_l_safe_head_0_0.conditions:get("Distance") then
                        if not v848 or v847 then
                            return;
                        else
                            return "Distance";
                        end;
                    else
                        return nil;
                    end;
                end;
            end;
        end;
    end;
    v751.update = function(_, v855)
        -- upvalues: l_l_safe_head_0_0 (ref), v853 (ref)
        if not l_l_safe_head_0_0.enabled:get() then
            return false;
        else
            local v856 = v853();
            if v856 == nil then
                return false;
            else
                v855.hidden = false;
                v855.pitch = "Down";
                if v856 == "Knife" then
                    v855.yaw_add = 0;
                    v855.yaw_base = "At Target";
                    v855.yaw_modifier = "Disabled";
                    v855.body_yaw = true;
                    v855.inverter = false;
                    v855.left_limit = 0;
                    v855.right_limit = 0;
                    v855.options = {};
                    v855.freestanding_body_yaw = "Off";
                end;
                if v856 == "Zeus" then
                    v855.yaw_add = 0;
                    v855.yaw_base = "At Target";
                    v855.yaw_modifier = "Disabled";
                    v855.body_yaw = true;
                    v855.inverter = false;
                    v855.left_limit = 0;
                    v855.right_limit = 0;
                    v855.options = {};
                    v855.freestanding_body_yaw = "Off";
                end;
                if v856 == "Distance" then
                    v855.yaw_add = -0;
                    v855.yaw_base = "At Target";
                    v855.yaw_modifier = "Disabled";
                    v855.body_yaw = true;
                    v855.inverter = false;
                    v855.left_limit = 0;
                    v855.right_limit = 0;
                    v855.options = {};
                    v855.freestanding_body_yaw = "Off";
                end;
                return true;
            end;
        end;
    end;
end;
l_safe_head_0 = {};
local v857 = 0;
local v858 = 0;
local l_defensive_0 = v90.antiaim.defensive;
local l_list_0 = l_defensive_0.list;
local l_layout_0 = l_defensive_0.layout;
local function v870(v862, v863)
    v862.enabled:visibility(v863);
    if not v862.enabled:get() then
        v863 = false;
    end;
    v862.pitch:visibility(v863);
    local v864 = v862.pitch:get();
    local v865 = v864 == "Custom";
    local v866 = v864 == "Static Random";
    local l_pitch_offset_0 = v862.pitch_offset;
    local l_l_pitch_offset_0_0 = l_pitch_offset_0;
    l_pitch_offset_0 = l_pitch_offset_0.visibility;
    local v869;
    if v863 then
        v869 = v865;
    else
        v869 = v863;
    end;
    l_pitch_offset_0(l_l_pitch_offset_0_0, v869);
    l_pitch_offset_0 = v862.pitch_from;
    l_l_pitch_offset_0_0 = l_pitch_offset_0;
    l_pitch_offset_0 = l_pitch_offset_0.visibility;
    if v863 then
        v869 = v866;
    else
        v869 = v863;
    end;
    l_pitch_offset_0(l_l_pitch_offset_0_0, v869);
    l_pitch_offset_0 = v862.pitch_to;
    l_l_pitch_offset_0_0 = l_pitch_offset_0;
    l_pitch_offset_0 = l_pitch_offset_0.visibility;
    if v863 then
        v869 = v866;
    else
        v869 = v863;
    end;
    l_pitch_offset_0(l_l_pitch_offset_0_0, v869);
    v862.yaw:visibility(v863);
    v864 = v862.yaw:get();
    v865 = v864 == "Spin" or v864 == "Custom";
    v866 = v864 == "Static Random";
    l_pitch_offset_0 = v862.yaw_offset;
    l_l_pitch_offset_0_0 = l_pitch_offset_0;
    l_pitch_offset_0 = l_pitch_offset_0.visibility;
    if v863 then
        v869 = v865;
    else
        v869 = v863;
    end;
    l_pitch_offset_0(l_l_pitch_offset_0_0, v869);
    l_pitch_offset_0 = v862.yaw_from;
    l_l_pitch_offset_0_0 = l_pitch_offset_0;
    l_pitch_offset_0 = l_pitch_offset_0.visibility;
    if v863 then
        v869 = v866;
    else
        v869 = v863;
    end;
    l_pitch_offset_0(l_l_pitch_offset_0_0, v869);
    l_pitch_offset_0 = v862.yaw_to;
    l_l_pitch_offset_0_0 = l_pitch_offset_0;
    l_pitch_offset_0 = l_pitch_offset_0.visibility;
    if v863 then
        v869 = v866;
    else
        v869 = v863;
    end;
    l_pitch_offset_0(l_l_pitch_offset_0_0, v869);
end;
do
    local l_v857_0, l_v858_0, l_l_defensive_0_0, l_l_list_0_0, l_l_layout_0_0, l_v870_0 = v857, v858, l_defensive_0, l_list_0, l_layout_0, v870;
    do
        local l_l_l_list_0_0_0, l_l_l_layout_0_0_0, l_l_v870_0_0 = l_l_list_0_0, l_l_layout_0_0, l_v870_0;
        local function v880(v881)
            -- upvalues: l_l_defensive_0_0 (ref), l_l_l_list_0_0_0 (ref), l_l_l_layout_0_0_0 (ref), v880 (ref), l_l_v870_0_0 (ref)
            local v882 = l_l_defensive_0_0.condition:get();
            if v881 == nil then
                v882 = nil;
            end;
            for v883 = 1, #l_l_l_list_0_0_0 do
                local v884 = l_l_l_list_0_0_0[v883];
                local v885 = l_l_l_layout_0_0_0[v884];
                if v885 ~= nil then
                    local v886 = v884 == v882;
                    if v886 then
                        v885.enabled:set_callback(v880);
                        v885.pitch:set_callback(v880);
                        v885.yaw:set_callback(v880);
                    else
                        v885.enabled:unset_callback(v880);
                        v885.pitch:unset_callback(v880);
                        v885.yaw:unset_callback(v880);
                    end;
                    l_l_v870_0_0(v885, v886);
                end;
            end;
        end;
        l_l_defensive_0_0.condition:set_callback(v880, true);
    end;
    l_l_list_0_0 = function(v887)
        -- upvalues: l_l_defensive_0_0 (ref)
        return l_l_defensive_0_0.layout[v887];
    end;
    l_l_layout_0_0 = function(v888)
        -- upvalues: v42 (ref), l_v857_0 (ref)
        local v889 = v888.pitch:get();
        if v889 == "Up" then
            return -89;
        elseif v889 == "Down" then
            return 89;
        elseif v889 == "Zero" then
            return 0;
        elseif v889 == "Random" then
            return utils.random_int(-89, 89);
        elseif v889 == "Progressive" then
            return (globals.curtime * 7 % 2 - 1) * 89;
        elseif v889 == "Static Random" then
            if v42.defensive_ticks == v42.max_defensive_ticks then
                if utils.random_int(1, 100) < 50 then
                    l_v857_0 = v888.pitch_from:get();
                else
                    l_v857_0 = v888.pitch_to:get();
                end;
            end;
            return l_v857_0;
        elseif v889 == "Custom" then
            return v888.pitch_offset:get();
        else
            return nil;
        end;
    end;
    l_v870_0 = function(v890)
        -- upvalues: v12 (ref), v42 (ref), l_v858_0 (ref)
        local v891 = v890.yaw:get();
        if v891 == "Jitter" then
            return bit.band(v12.sent_packets, 1) ~= 0 and -90 or 90;
        elseif v891 == "Opposite" then
            return 180;
        elseif v891 == "Spin" then
            return globals.curtime * (v890.yaw_offset:get() * 12) % 360;
        elseif v891 == "Random" then
            return utils.random_int(-180, 180);
        elseif v891 == "Povorotniki" then
            if globals.tickcount % 3 == 1 then
                return bit.band(v12.sent_packets, 1) ~= 0 and -90 or 90;
            else
                return bit.band(v12.sent_packets, 1) ~= 0 and 90 or -90;
            end;
        elseif v891 == "Progressive Spin" then
            return (globals.curtime * 7 % 3 - 1) * 179;
        elseif v891 == "Static Random" then
            if v42.defensive_ticks == v42.max_defensive_ticks then
                if utils.random_int(1, 100) < 50 then
                    l_v858_0 = v890.yaw_from:get();
                else
                    l_v858_0 = v890.yaw_to:get();
                end;
            end;
            return l_v858_0;
        elseif v891 == "Custom" then
            return -v890.yaw_offset:get();
        else
            return nil;
        end;
    end;
    local function v892()
        -- upvalues: v7 (ref)
        v7.rage.main.hide_shots_options:override("Break LC");
        v7.rage.main.double_tap_lag_options:override("Always On");
    end;
    local function v896(v893)
        -- upvalues: l_l_layout_0_0 (ref), l_v870_0 (ref)
        local v894 = l_l_layout_0_0(v893);
        local v895 = l_v870_0(v893);
        if v894 ~= nil then
            rage.antiaim:override_hidden_pitch(v894);
        end;
        if v895 ~= nil then
            rage.antiaim:override_hidden_yaw_offset(v895);
        end;
    end;
    l_safe_head_0.update = function(_, v898)
        -- upvalues: l_l_defensive_0_0 (ref), l_playvol_0 (ref), l_l_list_0_0 (ref), v892 (ref), v896 (ref)
        if not l_l_defensive_0_0.enabled:get() then
            return false;
        elseif rage.exploit:get() == 0 then
            return false;
        else
            local v899 = l_playvol_0.get();
            local v900 = l_l_list_0_0(v899);
            if v900 == nil or not v900.enabled:get() then
                return false;
            else
                v898.hidden = true;
                v892();
                v896(v900);
                if globals.tickcount % 3 == 1 then
                    return;
                else
                    v898.yaw_left = 0;
                    v898.yaw_right = 0;
                    v898.yaw_modifier = "Disabled";
                    v898.body_yaw = true;
                    v898.inverter = false;
                    v898.left_limit = 0;
                    v898.right_limit = 0;
                    v898.options = {};
                    v898.freestanding_body_yaw = "Off";
                    return true;
                end;
            end;
        end;
    end;
end;
v857 = {};
v858 = 3;
l_defensive_0 = 34;
l_list_0 = 10000;
l_layout_0 = false;
do
    local l_v858_1, l_l_defensive_0_1, l_l_list_0_1, l_l_layout_0_1, l_v870_1 = v858, l_defensive_0, l_list_0, l_layout_0, v870;
    l_v870_1 = function(v906, v907)
        -- upvalues: l_l_list_0_1 (ref)
        return (v906:get_origin() - v907):length2dsqr() < l_l_list_0_1;
    end;
    local function v910(v908)
        -- upvalues: v90 (ref), l_l_defensive_0_1 (ref)
        if not v908.m_bInBombZone then
            return false;
        elseif v90.antiaim.antiaim_on_use.e_fix:get() then
            local v909 = v908:get_player_weapon();
            if v909 == nil then
                return false;
            else
                return v909:get_classid() == l_l_defensive_0_1;
            end;
        else
            return true;
        end;
    end;
    local function v916(v911)
        -- upvalues: l_v858_1 (ref), l_v870_1 (ref)
        if v911.m_iTeamNum ~= l_v858_1 then
            return false;
        else
            local v912 = v911:get_origin();
            local v913 = entity.get_entities("CPlantedC4");
            for v914 = 1, #v913 do
                local v915 = v913[v914];
                if v915.m_bBombTicking and l_v870_1(v915, v912) then
                    return true;
                end;
            end;
            return false;
        end;
    end;
    local function v922(v917)
        local v918 = render.camera_angles();
        local v919 = v917:get_eye_position();
        local v920 = v919 + vector():angles(v918) * 128;
        local v921 = utils.trace_line(v919, v920, v917, 4294967295, 0);
        if v921.entity == nil or v921.fraction == 1 then
            return false;
        elseif v917.m_bInBombZone then
            if v921.entity:get_classname():find("CWeapon") then
                return true;
            else
                return false;
            end;
        else
            return true;
        end;
    end;
    local function v926(v923, v924)
        local l_entity_2 = v924.entity;
        if l_entity_2 == nil then
            return false;
        elseif l_entity_2:get_classid() ~= 97 then
            return false;
        else
            return (l_entity_2:get_origin() - v923:get_origin()):length2dsqr() < 3000;
        end;
    end;
    local function v928(v927)
        -- upvalues: v910 (ref), v916 (ref)
        return v910(v927) or v916(v927);
    end;
    local function v936(v929)
        local v930 = render.camera_angles();
        local v931 = v929:get_eye_position();
        local v932 = v931 + vector():angles(v930) * 128;
        local v933 = vector(-1, -1, -1);
        local v934 = vector(1, 1, 1);
        local v935 = bit.bor(1, 2, 8, 16384, 33554432);
        return utils.trace_hull(v931, v932, v933, v934, v929, v935, 0);
    end;
    v857.think = function(v937, _)
        -- upvalues: v90 (ref), v928 (ref), l_l_layout_0_1 (ref), v936 (ref), v926 (ref), v922 (ref)
        if not v90.antiaim.antiaim_on_use.enabled:get() then
            return false;
        else
            local v939 = entity.get_local_player();
            if v939 == nil then
                return false;
            else
                local v940 = v937.in_use == true;
                local v941 = v928(v939);
                if not v940 or v941 then
                    l_l_layout_0_1 = false;
                    return false;
                else
                    local v942 = v936(v939);
                    if v926(v939, v942) then
                        return false;
                    else
                        if not l_l_layout_0_1 then
                            l_l_layout_0_1 = true;
                            if v922(v939) then
                                return false;
                            end;
                        end;
                        return true;
                    end;
                end;
            end;
        end;
    end;
    v857.update = function(v943, v944, v945)
        v943.in_use = 0;
        if v944.yaw_add == nil then
            v944.yaw_add = 0;
        end;
        if v945 ~= "Legit AA" then
            v944.pitch = "Disabled";
            v944.yaw_base = "Local View";
        end;
        v944.yaw_add = v944.yaw_add + 180;
        v944.freestanding = false;
        v944.extended_angles = false;
        v944.hidden = false;
        return true;
    end;
end;
v858 = {};
l_defensive_0 = v90.antiaim.builder;
l_list_0 = l_defensive_0.list;
l_layout_0 = l_defensive_0.layout;
v870 = function(v946, v947)
    if v946.enabled ~= nil then
        v946.enabled:visibility(v947);
        if not v946.enabled:get() then
            v947 = false;
        end;
    end;
    v946.pitch:visibility(v947);
    v946.yaw:visibility(v947);
    local l_yaw_modifier_0 = v946.yaw_modifier;
    local l_l_yaw_modifier_0_0 = l_yaw_modifier_0;
    l_yaw_modifier_0 = l_yaw_modifier_0.visibility;
    local v950;
    if v947 then
        v950 = v946.yaw:get() ~= "Disabled";
    else
        v950 = v947;
    end;
    l_yaw_modifier_0(l_l_yaw_modifier_0_0, v950);
    v946.body_yaw:visibility(v947);
end;
do
    local l_l_defensive_0_2, l_l_list_0_2, l_l_layout_0_2 = l_defensive_0, l_list_0, l_layout_0;
    do
        local l_l_l_list_0_2_0, l_l_l_layout_0_2_0, l_v870_2 = l_l_list_0_2, l_l_layout_0_2, v870;
        local function v957(v958)
            -- upvalues: l_l_defensive_0_2 (ref), l_l_l_list_0_2_0 (ref), l_l_l_layout_0_2_0 (ref), v957 (ref), l_v870_2 (ref)
            local v959 = l_l_defensive_0_2.condition:get();
            if v958 == nil then
                v959 = nil;
            end;
            for v960 = 1, #l_l_l_list_0_2_0 do
                local v961 = l_l_l_list_0_2_0[v960];
                local v962 = l_l_l_layout_0_2_0[v961];
                if v962 ~= nil then
                    local v963 = v961 == v959;
                    if v963 then
                        if v962.enabled ~= nil then
                            v962.enabled:set_callback(v957);
                        end;
                        v962.yaw:set_callback(v957);
                    else
                        if v962.enabled ~= nil then
                            v962.enabled:unset_callback(v957);
                        end;
                        v962.yaw:unset_callback(v957);
                    end;
                    l_v870_2(v962, v963);
                end;
            end;
        end;
        local function v966(v964)
            -- upvalues: l_l_defensive_0_2 (ref), v957 (ref)
            local v965 = v964:get();
            if v965 then
                l_l_defensive_0_2.condition:set_callback(v957, true);
            else
                l_l_defensive_0_2.condition:unset_callback(v957);
                v957(nil);
            end;
            l_l_defensive_0_2.condition:visibility(v965);
        end;
        l_l_defensive_0_2.enabled:set_callback(v966, true);
    end;
    l_l_list_0_2 = function(v967)
        -- upvalues: l_l_defensive_0_2 (ref)
        local v968 = l_l_defensive_0_2.layout[v967];
        if v968 == nil or v968.enabled ~= nil and not v968.enabled:get() then
            return l_l_defensive_0_2.layout.Shared;
        else
            return v968;
        end;
    end;
    l_l_layout_0_2 = function(v969, v970)
        v969.pitch = v970.pitch:get();
        v969.yaw = v970.yaw:get();
        v969.yaw_base = v970.yaw_base:get();
        v969.yaw_left = v970.yaw_left:get();
        v969.yaw_right = v970.yaw_right:get();
        v969.yaw_modifier = v970.yaw_modifier:get();
        local v971 = v970.yaw_modifier_mode:get();
        v969.modifier_offset = v970.modifier_offset:get();
        if v971 == "Random" then
            v969.modifier_offset = utils.random_int(v970.modifier_min_offset:get(), v970.modifier_max_offset:get());
        end;
        if v971 == "Custom" then
            v969.modifier_offset = v970["modifier_offset_" .. math.random(1, v970.modifier_sliders:get())]:get();
        end;
        v969.hidden = false;
        v969.body_yaw = v970.body_yaw:get();
        v971 = v970.body_yaw_mode:get();
        if v971 == "Ticks" then
            local v972 = v970.body_yaw_ticks:get();
            if globals.tickcount % v972 <= 1 then
                v969.body_yaw = false;
            end;
        end;
        if v971 == "Random" then
            local v973 = utils.random_int(1, v970.body_yaw_ticks:get());
            if globals.tickcount % v973 <= 1 then
                v969.body_yaw = false;
            end;
        end;
        v969.left_limit = v970.left_limit:get();
        v969.right_limit = v970.right_limit:get();
        v969.options = v970.options:get();
        v969.delay = v970.delay:get();
        v969.freestanding_body_yaw = v970.freestanding:get();
    end;
    v858.update = function(_, v975)
        -- upvalues: l_l_defensive_0_2 (ref), l_playvol_0 (ref), l_l_list_0_2 (ref), l_l_layout_0_2 (ref)
        if not l_l_defensive_0_2.enabled:get() then
            return false;
        else
            local v976 = l_playvol_0.get();
            local v977 = l_l_list_0_2(v976);
            if v977 == nil then
                return false;
            else
                l_l_layout_0_2(v975, v977);
                return true;
            end;
        end;
    end;
end;
do
    local l_v156_5, l_v199_4, l_v200_5, l_v742_3, l_v743_3, l_v747_3, l_v751_4, l_l_safe_head_0_1, l_v857_1, l_v858_2 = v156, v199, v200, v742, v743, v747, v751, l_safe_head_0, v857, v858;
    l_defensive_0 = function(v988)
        -- upvalues: l_v156_5 (ref), v7 (ref), l_playvol_0 (ref), l_v743_3 (ref), l_v857_1 (ref), l_v858_2 (ref), l_v742_3 (ref), l_v199_4 (ref), l_l_safe_head_0_1 (ref), l_v200_5 (ref), l_v747_3 (ref), l_v751_4 (ref)
        l_v156_5:clear();
        v7.rage.main.hide_shots_options:override();
        v7.rage.main.double_tap_lag_options:override();
        local v989 = l_playvol_0.get();
        l_v743_3.update(v988, l_v156_5, v989);
        if l_v857_1.think(v988, l_v156_5) then
            local _, v991 = l_v858_2.update(v988, l_v156_5, "Legit AA");
            l_v857_1.update(v988, l_v156_5, v991);
        else
            l_v858_2.update(v988, l_v156_5);
            l_v742_3.update(v988, l_v156_5);
            if not l_v199_4.update(v988, l_v156_5) then
                l_l_safe_head_0_1.update(v988, l_v156_5);
                if not l_v200_5.update(v988, l_v156_5) then
                    l_v747_3.update(v988, l_v156_5);
                end;
                l_v751_4.update(v988, l_v156_5);
            end;
        end;
        l_v156_5:update(v988);
    end;
    events.createmove(l_defensive_0);
end;
v156 = nil;
v199 = nil;
v200 = v90.features.watermark;
v442 = {};
v742 = 1;
v743 = v87.new("watermark_simple");
v747 = render.screen_size();
v743:set_pos(vector(v747.x * 0.495, v747.y * 0.985));
v747 = function(v992, v993)
    return string.gsub(v992, "%a", "%1" .. v993, #v992 - 1);
end;
do
    local l_v200_6, l_v442_4, l_v742_4 = v200, v442, v742;
    do
        local l_l_v742_4_0, l_v743_4, l_v747_4, l_v751_5 = l_v742_4, v743, v747, v751;
        l_v751_5 = function()
            -- upvalues: l_v747_4 (ref), v4 (ref)
            local v1001 = l_v747_4("spectral", "");
            return string.format("%s [%s]", v1001, v4.build:lower());
        end;
        l_v442_4.render = function()
            -- upvalues: l_v743_4 (ref), l_v751_5 (ref), l_l_v742_4_0 (ref), v9 (ref), l_v200_6 (ref)
            local v1002 = l_v743_4:get_pos():clone();
            local v1003 = l_v751_5();
            local v1004 = render.measure_text(l_l_v742_4_0, nil, v1003);
            v1003 = v9.wave(v1003, l_v200_6.color:get(), color(), globals.realtime);
            render.text(l_l_v742_4_0, v1002, color(), "s", v1003);
            l_v743_4:set_size(v1004:clone());
        end;
    end;
    l_v742_4 = {};
    v743 = 14;
    v747 = 8;
    v751 = 8;
    l_safe_head_0 = render.load_font("museo500", 14.2, "a");
    v857 = {};
    v857.__index = v857;
    v857.new = function(v1005)
        return setmetatable({}, {
            __index = v1005
        });
    end;
    v858 = {};
    l_defensive_0 = v857:new();
    v858.logo = l_defensive_0;
    l_list_0 = vector();
    l_layout_0 = vector();
    v870 = vector();
    local v1006 = ui.get_icon("stars");
    local v1007 = "spectral";
    do
        local l_v743_5, l_v747_5, l_v751_6, l_l_safe_head_0_2, l_v858_3 = v743, v747, v751, l_safe_head_0, v858;
        do
            local l_l_list_0_3, l_l_layout_0_3, l_v870_3, l_v1006_0, l_v1007_0 = l_list_0, l_layout_0, v870, v1006, v1007;
            l_defensive_0.get_size = function(_)
                -- upvalues: l_l_list_0_3 (ref)
                return l_l_list_0_3:clone();
            end;
            l_defensive_0.compute = function(_)
                -- upvalues: l_l_layout_0_3 (ref), l_l_safe_head_0_2 (ref), l_v1006_0 (ref), l_v870_3 (ref), l_v1007_0 (ref), l_l_list_0_3 (ref)
                l_l_layout_0_3 = render.measure_text(l_l_safe_head_0_2, nil, l_v1006_0);
                l_v870_3 = render.measure_text(l_l_safe_head_0_2, nil, l_v1007_0);
                l_l_list_0_3.x = l_l_layout_0_3.x + l_v870_3.x + 5;
                l_l_list_0_3.y = math.max(l_l_layout_0_3.y, l_v870_3.y);
                return true;
            end;
            l_defensive_0.draw = function(_, v1021)
                -- upvalues: l_v200_6 (ref), l_l_safe_head_0_2 (ref), l_v1006_0 (ref), l_l_layout_0_3 (ref), l_v1007_0 (ref)
                local v1022 = l_v200_6.color:get();
                render.text(l_l_safe_head_0_2, v1021, v1022, "s", l_v1006_0);
                v1021.x = v1021.x + l_l_layout_0_3.x + 5;
                render.text(l_l_safe_head_0_2, v1021, v1022, "s", l_v1007_0);
            end;
        end;
        l_list_0 = v857:new();
        l_v858_3.user = l_list_0;
        l_layout_0 = vector();
        v870 = vector();
        v1006 = common.get_username();
        do
            local l_l_layout_0_4, l_v870_4, l_v1006_1 = l_layout_0, v870, v1006;
            l_list_0.get_size = function(_)
                -- upvalues: l_l_layout_0_4 (ref)
                return l_l_layout_0_4:clone();
            end;
            l_list_0.compute = function(_)
                -- upvalues: l_v870_4 (ref), l_l_safe_head_0_2 (ref), l_v1006_1 (ref), l_l_layout_0_4 (ref)
                l_v870_4 = render.measure_text(l_l_safe_head_0_2, nil, l_v1006_1);
                l_l_layout_0_4.x = l_v870_4.x;
                l_l_layout_0_4.y = l_v870_4.y;
                return true;
            end;
            l_list_0.draw = function(_, v1029)
                -- upvalues: l_l_safe_head_0_2 (ref), l_v1006_1 (ref)
                render.text(l_l_safe_head_0_2, v1029, color(), "s", l_v1006_1);
            end;
        end;
        l_layout_0 = v857:new();
        l_v858_3.fps = l_layout_0;
        v870 = vector();
        v1006 = vector();
        v1007 = nil;
        local v1030 = 0;
        local v1031 = 0;
        do
            local l_v870_5, l_v1006_2, l_v1007_1, l_v1030_0, l_v1031_0 = v870, v1006, v1007, v1030, v1031;
            local function v1037()
                -- upvalues: l_v1030_0 (ref)
                return l_v1030_0 <= 0;
            end;
            local function v1039(v1038)
                -- upvalues: l_v1030_0 (ref)
                l_v1030_0 = l_v1030_0 - v1038;
            end;
            local function v1041(v1040)
                -- upvalues: l_v1031_0 (ref), l_v1030_0 (ref)
                l_v1031_0 = math.floor(1 / v1040);
                l_v1030_0 = 1;
            end;
            l_layout_0.get_size = function(_)
                -- upvalues: l_v870_5 (ref)
                return l_v870_5:clone();
            end;
            l_layout_0.compute = function(_)
                -- upvalues: v1037 (ref), v1041 (ref), v1039 (ref), l_v1007_1 (ref), l_v1031_0 (ref), l_v1006_2 (ref), l_l_safe_head_0_2 (ref), l_v870_5 (ref)
                local l_frametime_1 = globals.frametime;
                if v1037() then
                    v1041(l_frametime_1);
                end;
                v1039(l_frametime_1);
                l_v1007_1 = string.format("%d fps", l_v1031_0);
                l_v1006_2 = render.measure_text(l_l_safe_head_0_2, nil, l_v1007_1);
                l_v870_5.x = l_v1006_2.x;
                l_v870_5.y = l_v1006_2.y;
                return true;
            end;
            l_layout_0.draw = function(_, v1046)
                -- upvalues: l_l_safe_head_0_2 (ref), l_v1007_1 (ref)
                render.text(l_l_safe_head_0_2, v1046, color(), "s", l_v1007_1);
            end;
        end;
        v870 = v857:new();
        l_v858_3.ping = v870;
        v1006 = vector();
        v1007 = vector();
        v1030 = nil;
        do
            local l_v1006_3, l_v1007_2, l_v1030_1 = v1006, v1007, v1030;
            v870.get_size = function(_)
                -- upvalues: l_v1006_3 (ref)
                return l_v1006_3:clone();
            end;
            v870.compute = function(_)
                -- upvalues: l_v1030_1 (ref), l_v1007_2 (ref), l_l_safe_head_0_2 (ref), l_v1006_3 (ref)
                local v1052 = utils.net_channel();
                if v1052 == nil then
                    return false;
                else
                    local v1053 = math.floor(v1052.latency[1] * 1000);
                    l_v1030_1 = string.format("%d ms", v1053);
                    l_v1007_2 = render.measure_text(l_l_safe_head_0_2, nil, l_v1030_1);
                    l_v1006_3.x = l_v1007_2.x;
                    l_v1006_3.y = l_v1007_2.y;
                    return true;
                end;
            end;
            v870.draw = function(_, v1055)
                -- upvalues: l_l_safe_head_0_2 (ref), l_v1030_1 (ref)
                render.text(l_l_safe_head_0_2, v1055, color(), "s", l_v1030_1);
            end;
        end;
        v1006 = v857:new();
        l_v858_3.time = v1006;
        v1007 = vector();
        v1030 = vector();
        v1031 = nil;
        local function v1057(v1056)
            return string.format("%02d:%02d", v1056.hours, v1056.minutes);
        end;
        do
            local l_v1007_3, l_v1030_2, l_v1031_1, l_v1057_0 = v1007, v1030, v1031, v1057;
            v1006.get_size = function(_)
                -- upvalues: l_v1007_3 (ref)
                return l_v1007_3:clone();
            end;
            v1006.compute = function(_)
                -- upvalues: l_v1031_1 (ref), l_v1057_0 (ref), l_v1030_2 (ref), l_l_safe_head_0_2 (ref), l_v1007_3 (ref)
                l_v1031_1 = l_v1057_0(common.get_system_time());
                l_v1030_2 = render.measure_text(l_l_safe_head_0_2, nil, l_v1031_1);
                l_v1007_3.x = l_v1030_2.x;
                l_v1007_3.y = l_v1030_2.y;
                return true;
            end;
            v1006.draw = function(_, v1065)
                -- upvalues: l_l_safe_head_0_2 (ref), l_v1031_1 (ref)
                render.text(l_l_safe_head_0_2, v1065, color(), "s", l_v1031_1);
            end;
        end;
        l_v742_4.render = function()
            -- upvalues: l_v858_3 (ref), l_v747_5 (ref), l_v751_6 (ref), l_v743_5 (ref)
            local v1066 = render.screen_size();
            local v1067 = vector(v1066.x - 10, 10);
            local v1068 = vector();
            local v1069 = {};
            table.insert(v1069, l_v858_3.logo);
            table.insert(v1069, l_v858_3.user);
            table.insert(v1069, l_v858_3.fps);
            table.insert(v1069, l_v858_3.ping);
            table.insert(v1069, l_v858_3.time);
            for v1070 = #v1069, 1, -1 do
                local v1071 = v1069[v1070];
                if v1071:compute() then
                    local v1072 = v1071:get_size();
                    v1068.x = v1068.x + v1072.x;
                    v1068.y = math.max(v1068.y, v1072.y);
                else
                    table.remove(v1069, v1070);
                end;
            end;
            v1068.x = v1068.x + l_v747_5 * 2;
            v1068.y = v1068.y + l_v751_6 * 2;
            local _ = nil;
            v1068.x = v1068.x + l_v743_5 * (#v1069 - 1);
            v1067.x = v1067.x - v1068.x;
            local _ = nil;
            local v1075 = 8;
            local v1076 = color(0, 0, 0, 50);
            local v1077 = color(0, 0, 0, 5);
            render.blur(v1067, v1067 + v1068, 0.25, 1, v1075);
            render.rect(v1067, v1067 + v1068, v1076, v1075);
            render.rect_outline(v1067, v1067 + v1068, v1077, 1, v1075);
            v1067.x = v1067.x + l_v747_5;
            v1067.y = v1067.y + l_v751_6;
            for v1078 = 1, #v1069 do
                if v1078 ~= 1 then
                    v1067.x = v1067.x + l_v743_5;
                end;
                local v1079 = v1069[v1078];
                v1079:draw(v1067:clone());
                local v1080 = v1079:get_size();
                v1067.x = v1067.x + v1080.x;
            end;
        end;
    end;
    v743 = nil;
    v747 = function(v1081)
        -- upvalues: l_v442_4 (ref), l_v742_4 (ref)
        local v1082 = v1081:get();
        events.render(l_v442_4.render, v1082 == "Simple");
        events.render(l_v742_4.render, v1082 == "Default");
    end;
    l_v200_6.style:set_callback(v747, true);
end;
v200 = nil;
v442 = v90.features.keybinds;
v742 = {};
v743 = 10;
v747 = 8;
v751 = 8;
l_safe_head_0 = render.load_font("museo500", 14.2, "a");
v857 = v87.new("keybinds", {
    pos = vector(200, 200), 
    anchor = vector(0, 0)
});
v858 = {};
l_defensive_0 = l_smoothy_0.new(0);
l_list_0 = l_smoothy_0.new(130);
l_layout_0 = function(v1083, v1084)
    if next(v1084) == nil then
        v1084 = v1083:get();
        if next(v1084) == nil then
            v1084 = v1083:list();
        end;
    end;
    local v1085 = {};
    for v1086 = 1, #v1084 do
        v1085[#v1085 + 1] = v1084[v1086]:sub(1, 1):lower();
    end;
    return table.concat(v1085, ", ");
end;
v870 = function(v1087)
    return v1087:lower();
end;
do
    local l_v442_5 = v442;
    do
        local l_v743_6, l_v747_6, l_v751_7, l_l_safe_head_0_3, l_v857_2, l_v858_4, l_l_defensive_0_3, l_l_list_0_4, l_l_layout_0_5, l_v870_6 = v743, v747, v751, l_safe_head_0, v857, v858, l_defensive_0, l_list_0, l_layout_0, v870;
        local function v1102(v1099, _, v1101)
            -- upvalues: l_l_layout_0_5 (ref)
            if type(v1101) == "boolean" then
                return v1101 and "on" or "off";
            elseif type(v1101) == "table" then
                return l_l_layout_0_5(v1099, v1101);
            else
                return tostring(v1101):lower();
            end;
        end;
        local function v1121(v1103, v1104)
            -- upvalues: v1102 (ref), l_v870_6 (ref), l_v858_4 (ref), l_smoothy_0 (ref)
            local v1105 = {};
            local v1106 = false;
            local v1107 = 0;
            local v1108 = 0;
            for _, v1110 in pairs(ui.get_binds()) do
                local v1111 = v1110.reference:id();
                local v1112 = v1102(v1110.reference, v1110.mode, v1110.value);
                local v1113 = l_v870_6(v1110.name);
                if v1110.active then
                    v1106 = true;
                    v1105[v1111] = v1110;
                end;
                l_v858_4[v1111] = l_v858_4[v1111] or {
                    value_width = 0, 
                    name_width = 0, 
                    height = 0, 
                    alpha = l_smoothy_0.new(0), 
                    name = v1113, 
                    mode = v1110.mode, 
                    value = v1110.value, 
                    reference = v1110.reference
                };
                local v1114 = l_v858_4[v1111];
                local v1115 = render.measure_text(v1103, v1104, v1113);
                local v1116 = render.measure_text(v1103, v1104, v1112);
                v1114.name = v1113;
                v1114.value = v1112;
                v1114.mode = v1110.mode;
                v1114.reference = v1110.reference;
                v1114.height = math.max(v1115.y, v1116.y);
                v1114.name_width = v1115.x;
                v1114.value_width = v1116.x;
            end;
            for v1117, v1118 in pairs(l_v858_4) do
                local v1119 = v1105[v1117] ~= nil;
                local v1120 = v1118.alpha(0.05, v1119);
                if v1120 <= 0 then
                    l_v858_4[v1117] = nil;
                elseif v1120 > 0 or v1119 then
                    if v1107 < v1118.name_width then
                        v1107 = v1118.name_width;
                    end;
                    if v1108 < v1118.value_width then
                        v1108 = v1118.value_width;
                    end;
                end;
            end;
            return l_v858_4, v1106, v1107, v1108;
        end;
        v742.render = function()
            -- upvalues: v1121 (ref), l_l_safe_head_0_3 (ref), l_v442_5 (ref), l_l_defensive_0_3 (ref), l_v857_2 (ref), l_l_list_0_4 (ref), l_v747_6 (ref), l_v743_6 (ref), l_v751_7 (ref)
            local v1122, v1123, v1124, v1125 = v1121(l_l_safe_head_0_3, nil);
            local v1126 = ui.get_alpha() == 1 or next(v1122) ~= nil and v1123;
            local v1127 = l_v442_5.enabled:get() and v1126;
            alpha = l_l_defensive_0_3(0.05, v1127);
            if alpha <= 0 then
                return;
            else
                local v1128 = l_v857_2:get_pos();
                local v1129 = vector(0, 29);
                local v1130 = 8;
                v1128 = v1128:clone();
                v1129.x = l_l_list_0_4(0.05, math.max(130, v1129.x, v1124 + v1125 + 20 + l_v747_6 * 2));
                local _ = nil;
                local v1132 = color(0, 0, 0, 50 * alpha);
                local v1133 = color(0, 0, 0, 5 * alpha);
                render.blur(v1128, v1128 + v1129, 0.25, alpha, v1130);
                render.rect(v1128, v1128 + v1129, v1132, v1130);
                render.rect_outline(v1128, v1128 + v1129, v1133, 1, v1130);
                v1132 = nil;
                v1133 = 6;
                local v1134 = ui.get_icon("keyboard");
                local v1135 = "keybindings";
                local v1136 = render.measure_text(l_l_safe_head_0_3, nil, v1134);
                local v1137 = render.measure_text(l_l_safe_head_0_3, nil, v1135);
                local v1138 = l_v442_5.color:get();
                local v1139 = v1128 + v1129 / 2;
                local v1140 = vector(v1136.x + v1137.x + v1133, math.max(v1136.y, v1137.y));
                v1138.a = v1138.a * alpha;
                v1139.x = v1139.x - v1140.x / 2;
                v1139.y = v1139.y - v1140.y / 2;
                render.text(l_l_safe_head_0_3, v1139, v1138, "s", v1134);
                v1139.x = v1139.x + v1136.x + v1133;
                render.text(l_l_safe_head_0_3, v1139 - vector(0, 1), v1138, "s", v1135);
                v1128.y = v1128.y + v1129.y + 5;
                v1133 = nil;
                v1134 = 0;
                v1135 = vector(v1129.x, 0);
                v1136 = 0;
                for _, v1142 in pairs(v1122) do
                    local l_height_0 = v1142.height;
                    local l_value_1 = v1142.alpha.value;
                    v1135.y = math.max(0, v1135.y + l_height_0 * l_value_1);
                    v1136 = math.max(v1136, l_value_1);
                    v1134 = v1134 + l_value_1;
                end;
                v1135.y = v1135.y + l_v743_6 * (v1134 - 1);
                if v1136 > 0 then
                    v1135.y = v1135.y + l_v751_7 * 2;
                    v1137 = nil;
                    v1138 = color(0, 0, 0, 50 * v1136);
                    v1139 = color(0, 0, 0, 5 * v1136);
                    render.push_clip_rect(v1128, v1128 + v1135);
                    render.blur(v1128, v1128 + v1135, 0.25, v1136, v1130);
                    render.rect(v1128, v1128 + v1135, v1138, v1130);
                    render.rect_outline(v1128, v1128 + v1135, v1139, 1, v1130);
                    v1128.x = v1128.x + l_v747_6;
                    v1128.y = v1128.y + l_v751_7;
                    for _, v1146 in pairs(v1122) do
                        local l_value_2 = v1146.alpha.value;
                        local v1148 = v1128:clone();
                        local v1149 = v1148:clone();
                        local v1150 = v1148:clone();
                        v1150.x = v1150.x + v1129.x - v1146.value_width - l_v747_6 - v1130;
                        render.text(l_l_safe_head_0_3, v1149, color(255, 255, 255, 255 * l_value_2), "d", v1146.name);
                        render.text(l_l_safe_head_0_3, v1150, color(255, 255, 255, 100 * l_value_2), "d", v1146.value);
                        v1128.y = v1128.y + (v1146.height + l_v743_6) * l_value_2;
                    end;
                    render.pop_clip_rect();
                end;
                l_v857_2:set_size(v1129);
                return;
            end;
        end;
    end;
    events.render(v742.render);
end;
v442 = nil;
v742 = 9.25925925925926E-4;
v743 = l_smoothy_0.new(0);
v747 = 0;
v751 = 0;
l_safe_head_0 = color();
v857 = false;
v858 = false;
l_defensive_0 = false;
l_list_0 = false;
l_layout_0 = function(v1151)
    -- upvalues: v7 (ref)
    v7.visuals.world.main.scope_overlay:override(v1151 and "Remove All" or nil);
end;
do
    local l_v742_5, l_v743_7, l_v747_7, l_v751_8, l_l_safe_head_0_4, l_v857_3, l_v858_5, l_l_defensive_0_4, l_l_list_0_5, l_l_layout_0_6, l_v870_7 = v742, v743, v747, v751, l_safe_head_0, v857, v858, l_defensive_0, l_list_0, l_layout_0, v870;
    l_v870_7 = function()
        -- upvalues: l_l_layout_0_6 (ref)
        l_l_layout_0_6(false);
    end;
    local function v1181()
        -- upvalues: l_v743_7 (ref), l_v751_8 (ref), l_v742_5 (ref), l_v747_7 (ref), l_l_safe_head_0_4 (ref), l_l_defensive_0_4 (ref), l_l_list_0_5 (ref), l_v857_3 (ref), l_v858_5 (ref)
        local v1163 = entity.get_local_player();
        if v1163 == nil or not v1163:is_alive() then
            return;
        else
            local l_m_bIsScoped_0 = v1163.m_bIsScoped;
            local v1165 = l_v743_7(0.05, l_m_bIsScoped_0);
            if v1165 == 0 then
                return;
            else
                local v1166 = render.screen_size();
                local v1167 = v1166 * 0.5;
                local v1168 = l_v751_8 * v1166.y * l_v742_5;
                local v1169 = l_v747_7 * v1166.y * l_v742_5;
                v1168 = math.floor(v1168);
                v1169 = math.floor(v1169);
                local v1170 = v1169 - v1168;
                local v1171 = l_l_safe_head_0_4:clone();
                local v1172 = l_l_safe_head_0_4:clone();
                v1171.a = v1171.a * v1165;
                v1172.a = 0;
                if not l_l_defensive_0_4 then
                    local v1173 = vector(v1167.x, v1167.y - v1168 + 1);
                    local v1174 = vector(v1173.x + 1, v1167.y - v1169);
                    render.gradient(v1173, v1174, v1171, v1171, v1172, v1172);
                end;
                if not l_l_list_0_5 then
                    local v1175 = vector(v1167.x, v1167.y + v1168);
                    local v1176 = vector(v1175.x + 1, v1167.y + v1169);
                    render.gradient(v1175, v1176, v1171, v1171, v1172, v1172);
                end;
                if not l_v857_3 then
                    local v1177 = vector(v1167.x - v1168 + 1, v1167.y);
                    local v1178 = vector(v1177.x - v1170, v1167.y + 1);
                    render.gradient(v1177, v1178, v1171, v1172, v1171, v1172);
                end;
                if not l_v858_5 then
                    local v1179 = vector(v1167.x + v1168, v1167.y);
                    local v1180 = vector(v1179.x + v1170, v1167.y + 1);
                    render.gradient(v1179, v1180, v1171, v1172, v1171, v1172);
                end;
                return;
            end;
        end;
    end;
    local function v1183(v1182)
        -- upvalues: l_v870_7 (ref), v1181 (ref)
        events.shutdown(l_v870_7, v1182);
        events.render(v1181, v1182);
    end;
    local l_scope_overlay_0 = v90.features.scope_overlay;
    local function v1186(v1185)
        -- upvalues: l_v747_7 (ref)
        l_v747_7 = v1185:get();
    end;
    local function v1188(v1187)
        -- upvalues: l_v751_8 (ref)
        l_v751_8 = v1187:get();
    end;
    local function v1190(v1189)
        -- upvalues: l_l_safe_head_0_4 (ref)
        l_l_safe_head_0_4 = v1189:get();
    end;
    local function v1192(v1191)
        -- upvalues: l_l_defensive_0_4 (ref)
        l_l_defensive_0_4 = v1191:get();
    end;
    do
        local l_v1186_0, l_v1188_0, l_v1190_0, l_v1192_0 = v1186, v1188, v1190, v1192;
        local function v1199(v1197)
            -- upvalues: l_scope_overlay_0 (ref), l_v1186_0 (ref), l_v1188_0 (ref), l_v1190_0 (ref), l_v1192_0 (ref), l_l_layout_0_6 (ref), v1183 (ref)
            local v1198 = v1197:get();
            if v1198 then
                l_scope_overlay_0.position:set_callback(l_v1186_0, true);
                l_scope_overlay_0.offset:set_callback(l_v1188_0, true);
                l_scope_overlay_0.color:set_callback(l_v1190_0, true);
                l_scope_overlay_0.t_style:set_callback(l_v1192_0, true);
            else
                l_scope_overlay_0.position:unset_callback(l_v1186_0);
                l_scope_overlay_0.offset:unset_callback(l_v1188_0);
                l_scope_overlay_0.color:unset_callback(l_v1190_0);
                l_scope_overlay_0.t_style:unset_callback(l_v1192_0);
            end;
            l_l_layout_0_6(v1198);
            v1183(v1198);
        end;
        l_scope_overlay_0.enabled:set_callback(v1199, true);
    end;
end;
v742 = nil;
v743 = nil;
v747 = false;
v751 = false;
do
    local l_v743_8, l_v747_8, l_v751_9, l_l_safe_head_0_5, l_v857_4, l_v858_6 = v743, v747, v751, l_safe_head_0, v857, v858;
    l_l_safe_head_0_5 = function()
        -- upvalues: v7 (ref), l_v751_9 (ref), l_v747_8 (ref)
        local v1206 = v7.visuals.world.main.force_thirdperson[1]:get();
        return l_v751_9 and v1206 or l_v747_8 and not v1206;
    end;
    l_v857_4 = function(v1207)
        -- upvalues: l_v743_8 (ref), l_smoothy_0 (ref), l_l_safe_head_0_5 (ref)
        if l_v743_8 == nil then
            l_v743_8 = l_smoothy_0.new(v1207.fov);
        end;
        if not l_l_safe_head_0_5() then
            l_v743_8.value = v1207.fov;
        else
            v1207.fov = l_v743_8:update(0.05, v1207.fov);
        end;
    end;
    l_v858_6 = v90.features.fovanimations;
    l_defensive_0 = function(v1208)
        -- upvalues: l_v747_8 (ref), l_v751_9 (ref)
        l_v747_8 = v1208:get("First Person");
        l_v751_9 = v1208:get("Third Person");
    end;
    do
        local l_l_defensive_0_5 = l_defensive_0;
        l_list_0 = function(v1210)
            -- upvalues: l_v858_6 (ref), l_l_defensive_0_5 (ref), l_v857_4 (ref)
            local v1211 = v1210:get();
            if v1211 then
                l_v858_6.select:set_callback(l_l_defensive_0_5, true);
            else
                l_v858_6.select:unset_callback(l_l_defensive_0_5);
            end;
            events.override_view(l_v857_4, v1211);
        end;
        l_v858_6.enabled:set_callback(l_list_0, true);
    end;
end;
v743 = nil;
v747 = render.load_font("Verdana", 16, "ad");
v751 = 40;
l_safe_head_0 = vector(1, 0.6666666666666666);
v857 = vector(2, 0);
v858 = color(17, 17, 17, 128);
l_defensive_0 = l_smoothy_0.new(0);
l_list_0 = l_smoothy_0.new(0);
l_layout_0 = l_smoothy_0.new(0);
v870 = l_smoothy_0.new(0);
local v1212 = l_smoothy_0.new(0);
local v1213 = l_smoothy_0.new(0);
local v1214 = l_smoothy_0.new(0);
local v1215 = l_smoothy_0.new(0);
local v1216 = {};
local v1217 = nil;
local function v1222(v1218, v1219, v1220)
    local v1221 = v1218 * 0.5;
    if v1219 ~= nil then
        v1221.x = v1221.x + v1219 * (v1218.y / 1080);
    end;
    if v1220 ~= nil then
        v1221.y = v1221.y + v1220 * (v1218.y / 1080);
    end;
    return v1221;
end;
do
    local l_v747_9, l_v751_10, l_l_safe_head_0_6, l_v857_5, l_v858_7, l_l_defensive_0_6, l_l_list_0_6, l_l_layout_0_7, l_v870_8, l_v1212_0, l_v1213_0, l_v1214_0, l_v1215_0, l_v1216_0, l_v1217_0, l_v1222_0 = v747, v751, l_safe_head_0, v857, v858, l_defensive_0, l_list_0, l_layout_0, v870, v1212, v1213, v1214, v1215, v1216, v1217, v1222;
    local function v1278()
        -- upvalues: v90 (ref), v12 (ref), l_l_defensive_0_6 (ref), l_l_list_0_6 (ref), l_l_layout_0_7 (ref), l_v870_8 (ref), l_v1212_0 (ref), l_v1213_0 (ref), l_v1214_0 (ref), l_v1215_0 (ref), l_v1217_0 (ref), l_v1216_0 (ref), l_v1222_0 (ref), l_v751_10 (ref), l_v747_9 (ref), v6 (ref), l_l_safe_head_0_6 (ref), l_v858_7 (ref), l_v857_5 (ref)
        local v1239 = entity.get_local_player();
        local v1240 = v90.antiaim.manual_yaw.select:get();
        local v1241 = v1239 ~= nil and v1239:is_alive();
        local v1242 = v1241 and v1239.m_bIsScoped;
        local v1243 = v1241 and v1240 == "Left";
        local v1244 = v1241 and v1240 == "Right";
        local v1245 = v1241 and v1240 == "Forward";
        local v1246 = v1241 and v1240 == "Backward";
        local v1247 = v1241 and v12.abs_body_yaw < -10;
        local v1248 = v1241 and v12.abs_body_yaw > 10;
        local v1249 = l_l_defensive_0_6:update(0.05, v1241);
        local v1250 = l_l_list_0_6:update(0.05, v1242);
        local v1251 = l_l_layout_0_7:update(0.05, v1243 and v1249 or 0);
        local v1252 = l_v870_8:update(0.05, v1244 and v1249 or 0);
        local v1253 = l_v1212_0:update(0.05, v1245 and v1249 or 0);
        local _ = l_v1213_0:update(0.05, v1246 and v1249 or 0);
        local v1255 = l_v1214_0:update(0.05, v1247 and v1249 or 0);
        local v1256 = l_v1215_0:update(0.05, v1248 and v1249 or 0);
        if v1249 <= 0 then
            return;
        else
            local v1257 = render.screen_size();
            if l_v1217_0 == "Default" then
                local v1258 = l_v1216_0.Manual[1] or color();
                local _ = nil;
                local v1260 = l_v1222_0(v1257, -l_v751_10) - vector(1, 0);
                local v1261 = v1258:clone();
                v1261.a = v1261.a * v1251;
                local v1262 = "<";
                local v1263 = "rs";
                local v1264 = render.measure_text(l_v747_9, v1263, v1262);
                v1260.y = v1260.y - v6(v1264.y * 0.5) - 1;
                if v1242 then
                    v1260.y = v1260.y - v1250 * 15;
                else
                    v1260.y = v1260.y - v1250 * 15;
                end;
                render.text(l_v747_9, v1260, v1261, v1263, v1262);
                v1260 = nil;
                v1261 = l_v1222_0(v1257, l_v751_10);
                v1262 = v1258:clone();
                v1262.a = v1262.a * v1252;
                v1263 = ">";
                v1264 = "s";
                local v1265 = render.measure_text(l_v747_9, v1264, v1263);
                v1261.y = v1261.y - v6(v1265.y * 0.5) - 1;
                if v1242 then
                    v1261.y = v1261.y - v1250 * 15;
                else
                    v1261.y = v1261.y - v1250 * 15;
                end;
                render.text(l_v747_9, v1261, v1262, v1264, v1263);
                v1261 = nil;
                v1262 = l_v1222_0(v1257, l_v751_10);
                v1263 = v1258:clone();
                v1263.a = v1263.a * v1253;
                v1264 = "^";
                v1265 = "s";
                local v1266 = render.measure_text(l_v747_9, v1265, v1264);
                v1262.x = v1262.x - v6(v1266.y * 3.56) - 1;
                v1262.y = v1262.y - v6(v1266.y * 3) - 1;
                render.text(l_v747_9, v1262, v1263, v1265, v1264);
                render.text(l_v747_9, v1262, v1263, v1265, v1264);
            end;
            if l_v1217_0 == "Alternative" then
                local v1267 = l_l_safe_head_0_6 * 13.5;
                local v1268 = l_v1216_0.Manual[1] or color();
                local v1269 = l_v1216_0.Desync[1] or color();
                local _ = nil;
                local v1271 = l_v1222_0(v1257, -l_v751_10) - vector(1, 0);
                local v1272 = l_v858_7:lerp(v1268, v1251);
                v1272.a = v1272.a * v1249;
                local v1273 = l_v858_7:lerp(v1269, v1255);
                v1273.a = v1273.a * v1249;
                render.rect(v1271 - vector(0, v1267.y), v1271 + vector(l_v857_5.x, v1267.y), v1273);
                v1271.x = v1271.x - l_v857_5.x + 1;
                local v1274 = v1271 + vector(0, -v1267.y);
                local v1275 = v1271 + vector(0, v1267.y);
                local v1276 = v1271 + vector(-v1267.x, 0);
                render.poly(v1272, v1274, v1275, v1276);
                v1271 = nil;
                v1272 = l_v1222_0(v1257, l_v751_10) + vector(1, 0);
                v1273 = l_v858_7:lerp(v1268, v1252);
                v1273.a = v1273.a * v1249;
                v1274 = l_v858_7:lerp(v1269, v1256);
                v1274.a = v1274.a * v1249;
                render.rect(v1272 - vector(0, v1267.y), v1272 + vector(0, v1267.y), v1274);
                v1272.x = v1272.x + l_v857_5.x;
                v1275 = v1272 + vector(0, -v1267.y);
                v1276 = v1272 + vector(0, v1267.y);
                local v1277 = v1272 + vector(v1267.x, 0);
                render.poly(v1273, v1275, v1276, v1277);
            end;
            return;
        end;
    end;
    local function v1280(v1279)
        -- upvalues: v1278 (ref)
        events.render(v1278, v1279);
    end;
    local l_antiaim_arrows_0 = v90.features.antiaim_arrows;
    local function v1286(v1282)
        -- upvalues: l_v1216_0 (ref)
        local v1283 = v1282:list();
        for v1284 = 1, #v1283 do
            local v1285 = v1283[v1284];
            l_v1216_0[v1285] = v1282:get(v1285);
        end;
    end;
    local function v1288(v1287)
        -- upvalues: l_v1217_0 (ref)
        l_v1217_0 = v1287:get();
    end;
    do
        local l_v1286_0, l_v1288_0 = v1286, v1288;
        local function v1293(v1291)
            -- upvalues: l_antiaim_arrows_0 (ref), l_v1286_0 (ref), l_v1288_0 (ref), v1280 (ref)
            local v1292 = v1291:get();
            if v1292 then
                l_antiaim_arrows_0.color:set_callback(l_v1286_0, true);
                l_antiaim_arrows_0.type:set_callback(l_v1288_0, true);
            else
                l_antiaim_arrows_0.color:unset_callback(l_v1286_0);
                l_antiaim_arrows_0.type:unset_callback(l_v1288_0);
            end;
            v1280(v1292);
        end;
        l_antiaim_arrows_0.enabled:set_callback(v1293, true);
    end;
end;
v747 = nil;
v751 = render.load_font("Verdana", 12, "ad");
l_safe_head_0 = 2;
v857 = 1;
v858 = color():alpha_modulate(255);
l_defensive_0 = "Default";
l_list_0 = {};
l_layout_0 = l_smoothy_0.new();
v870 = l_smoothy_0.new();
v1212 = l_smoothy_0.new();
v1213 = l_smoothy_0.new();
v1214 = l_smoothy_0.new();
v1215 = "";
v1216 = color():alpha_modulate(255);
v1217 = "";
v1222 = color():alpha_modulate(255);
local function v1297(v1294, v1295)
    -- upvalues: v6 (ref)
    local v1296 = v6(#v1294 * v1295);
    return (string.sub(v1294, 1, v1296));
end;
local function v1306()
    -- upvalues: v90 (ref), v7 (ref)
    local v1298 = entity.get_local_player();
    local v1299 = v90.antiaim.manual_yaw.select:get();
    local v1300 = v1298 ~= nil and v1298:is_alive();
    local _ = v1300 and v1298.m_bIsScoped;
    local v1302 = v1300 and v1299 == "Left";
    local v1303 = v1300 and v1299 == "Right";
    local v1304 = "spectral";
    local v1305 = color(218, 118, 0);
    if v7.aa.angles.freestanding[1]:get() then
        v1304 = "freestand";
        v1305 = color(177, 151, 255);
    end;
    if v1303 or v1302 then
        v1304 = "fake yaw";
        v1305 = color(177, 151, 255);
    end;
    return v1304, v1305;
end;
local function v1309()
    -- upvalues: v7 (ref)
    local v1307 = "dynamic";
    local v1308 = color(209, 139, 230);
    if v7.aa.angles.yaw[2]:get() == "Local View" then
        v1307 = "default";
        v1308 = color(255, 0, 0);
    end;
    return v1307, v1308;
end;
local function v1315(v1310, v1311, v1312, v1313, v1314)
    render.text(v1310, v1311, v1312, v1313, v1314);
    v1311.y = v1311.y + v1310.height;
end;
do
    local l_v751_11, l_v858_8, l_l_defensive_0_7, l_l_list_0_7, l_l_layout_0_8, l_v870_9, l_v1212_1, l_v1213_1 = v751, v858, l_defensive_0, l_list_0, l_layout_0, v870, v1212, v1213;
    do
        local l_l_l_layout_0_8_0, l_l_v870_9_0, l_l_v1212_1_0, l_l_v1213_1_0, l_v1214_1, l_v1215_1, l_v1216_1, l_v1217_1, l_v1222_1, l_v1297_0, l_v1306_0, l_v1309_0, l_v1315_0 = l_l_layout_0_8, l_v870_9, l_v1212_1, l_v1213_1, v1214, v1215, v1216, v1217, v1222, v1297, v1306, v1309, v1315;
        local function v1343(v1337, v1338, v1339)
            -- upvalues: l_v1306_0 (ref), l_l_v870_9_0 (ref), l_v1215_1 (ref), l_v1216_1 (ref), l_v1315_0 (ref), l_v1297_0 (ref)
            local v1340, v1341 = l_v1306_0();
            local v1342 = l_l_v870_9_0:update(0.05, v1340 == l_v1215_1);
            if v1342 <= 0.1 then
                l_v1215_1 = v1340;
                l_v1216_1 = v1341;
            end;
            l_v1315_0(v1337, v1338, l_v1216_1, v1339, l_v1297_0(l_v1215_1, v1342));
        end;
        local function v1352(v1344, v1345, v1346)
            -- upvalues: l_v1309_0 (ref), l_l_v1212_1_0 (ref), l_v1217_1 (ref), l_v1222_1 (ref), v7 (ref), l_v1315_0 (ref), l_v1297_0 (ref)
            local v1347, v1348 = l_v1309_0();
            local v1349 = l_l_v1212_1_0:update(0.05, v1347 == l_v1217_1);
            if v1349 <= 0.1 then
                l_v1217_1 = v1347;
                l_v1222_1 = v1348;
            end;
            local v1350 = v7.aa.angles.freestanding[1]:get() and rage.antiaim:get_target(true) ~= nil;
            local l_l_v1217_1_0 = l_v1217_1;
            if v1350 and l_l_v1217_1_0 == "dynamic" then
                l_l_v1217_1_0 = l_l_v1217_1_0 .. "+";
            end;
            l_v1315_0(v1344, v1345, l_v1222_1, v1346, l_v1297_0(l_l_v1217_1_0, v1349));
        end;
        local function v1359(v1353, v1354, v1355, v1356)
            -- upvalues: v7 (ref), l_v1315_0 (ref), l_v1297_0 (ref)
            if v1356 <= 0.1 then
                return;
            else
                local v1357 = "dt";
                local v1358 = rage.exploit:get() == 1 and color(0, 255, 0, 255) or color(255, 0, 0, 255);
                if v7.aa.misc.fake_duck:get() then
                    v1357 = v1357 .. " " .. "(fakeduck)";
                end;
                l_v1315_0(v1353, v1354, v1358, v1355, l_v1297_0(v1357, v1356));
                return;
            end;
        end;
        local function v1366(v1360, v1361, v1362, v1363)
            -- upvalues: v7 (ref), l_v1315_0 (ref), l_v1297_0 (ref)
            if v1363 <= 0.1 then
                return;
            else
                local v1364 = "aa";
                local v1365 = color(209, 139, 230);
                if v7.aa.misc.fake_duck:get() then
                    if not v7.rage.main.double_tap:get() then
                        v1364 = v1364 .. " " .. "(fakeduck)";
                    end;
                    v1365 = color(255, 0, 0);
                end;
                l_v1315_0(v1360, v1361, v1365, v1362, l_v1297_0(v1364, v1363));
                return;
            end;
        end;
        l_l_list_0_7.update = function()
            -- upvalues: v7 (ref), l_l_l_layout_0_8_0 (ref), l_l_v1213_1_0 (ref), l_v1214_1 (ref)
            local v1367 = entity.get_local_player();
            local v1368 = v1367 ~= nil and v1367:is_alive();
            local v1369 = v7.rage.main.double_tap:get();
            local v1370 = v7.rage.main.hide_shots:get();
            l_l_l_layout_0_8_0:update(0.05, v1368);
            l_l_v1213_1_0:update(0.05, v1369);
            l_v1214_1:update(0.05, v1370);
        end;
        l_l_list_0_7.draw = function()
            -- upvalues: l_l_l_layout_0_8_0 (ref), l_l_v1213_1_0 (ref), l_v1214_1 (ref), v1343 (ref), l_v751_11 (ref), v1352 (ref), v1359 (ref), v1366 (ref)
            local l_value_3 = l_l_l_layout_0_8_0.value;
            local l_value_4 = l_l_v1213_1_0.value;
            local l_value_5 = l_v1214_1.value;
            if l_value_3 == 0 then
                return;
            else
                local v1374 = render.screen_size() / 2 + vector(0, 40);
                local v1375 = "s";
                v1343(l_v751_11, v1374, v1375);
                v1352(l_v751_11, v1374, v1375);
                v1359(l_v751_11, v1374, v1375, l_value_4);
                v1366(l_v751_11, v1374, v1375, l_value_5);
                return;
            end;
        end;
        l_l_list_0_7.render = function()
            -- upvalues: l_l_list_0_7 (ref)
            l_l_list_0_7.update();
            l_l_list_0_7.draw();
        end;
    end;
    l_l_layout_0_8 = {};
    l_v870_9 = l_smoothy_0.new();
    l_v1212_1 = l_smoothy_0.new();
    l_v1213_1 = l_smoothy_0.new();
    v1214 = l_smoothy_0.new();
    v1215 = function()
        -- upvalues: v12 (ref)
        if not v12.is_onground then
            return "AIR";
        elseif v12.is_crouched then
            return "DUCK";
        elseif v12.is_moving then
            return "RUN";
        else
            return "STAND";
        end;
    end;
    v1216 = function(v1376, v1377, v1378, v1379, v1380, v1381, v1382, v1383)
        -- upvalues: v6 (ref)
        local v1384 = render.measure_text(v1376, v1379, v1380);
        local v1385 = v6(-v1384.x * (1 - v1382) * 0.5 + 8 * v1382);
        local v1386 = v1377 + vector(v1385, 0);
        local v1387 = v1378:alpha_modulate(v1378.a * v1381);
        if v1383 then
            local v1388 = v1386 + vector(0, v1384.y * 0.5);
            render.shadow(v1388, v1388 + vector(v1384.x, 0), v1387);
        end;
        render.text(v1376, v1386, v1387:alpha_modulate(255 * v1381), v1379, v1380);
        v1377.y = v1377.y + v6(v1384.y * 0.81 * v1381);
    end;
    do
        local l_l_v870_9_1, l_l_v1212_1_1, l_l_v1213_1_1, l_v1214_2, l_v1215_2, l_v1216_2, l_v1217_2, l_v1222_2, l_v1297_1, l_v1306_1, l_v1309_1 = l_v870_9, l_v1212_1, l_v1213_1, v1214, v1215, v1216, v1217, v1222, v1297, v1306, v1309;
        l_v1217_2 = function(v1400, v1401, v1402, v1403, v1404)
            -- upvalues: v9 (ref), l_v858_8 (ref), l_v1216_2 (ref)
            local v1405 = v9.wave("spectral", l_v858_8, color(111, 111, 111), globals.realtime);
            l_v1216_2(v1400, v1401, l_v858_8:alpha_modulate(255), v1402, v1405, v1403, v1404, true);
            v1401.y = v1401.y + 1;
        end;
        l_v1222_2 = function(v1406, v1407, v1408, v1409, v1410)
            -- upvalues: l_v1216_2 (ref), l_v858_8 (ref), v4 (ref)
            l_v1216_2(v1406, v1407, l_v858_8, v1408, v4.build:lower(), v1409, v1410, true);
            v1407.y = v1407.y + 1;
        end;
        l_v1297_1 = function(v1411, v1412, v1413, v1414, v1415)
            -- upvalues: l_v1216_2 (ref), l_v858_8 (ref), l_v1215_2 (ref)
            l_v1216_2(v1411, v1412, l_v858_8, v1413, "" .. l_v1215_2():lower() .. "", v1414, v1415, true);
            v1412.y = v1412.y + 1;
        end;
        l_v1306_1 = function(v1416, v1417, v1418, v1419, v1420)
            -- upvalues: l_v858_8 (ref), l_v1216_2 (ref)
            if v1419 <= 0.01 then
                return;
            else
                local v1421 = "dt";
                local v1422 = color(69, 69, 69, 255):lerp(l_v858_8, rage.exploit:get());
                l_v1216_2(v1416, v1417, v1422:alpha_modulate(100), v1418, v1421, v1419, v1420);
                return;
            end;
        end;
        l_v1309_1 = function(v1423, v1424, v1425, v1426, v1427)
            -- upvalues: l_l_v1213_1_1 (ref), l_v1216_2 (ref)
            if v1426 <= 0.01 then
                return;
            else
                local v1428 = math.max(l_l_v1213_1_1.value, rage.exploit:get());
                local v1429 = "hide";
                local v1430 = color(69, 69, 69, 255):lerp(color(255, 255, 255), v1428);
                l_v1216_2(v1423, v1424, v1430, v1425, v1429, v1426, v1427);
                return;
            end;
        end;
        l_l_layout_0_8.update = function()
            -- upvalues: v7 (ref), l_l_v870_9_1 (ref), l_l_v1212_1_1 (ref), l_l_v1213_1_1 (ref), l_v1214_2 (ref)
            local v1431 = entity.get_local_player();
            local v1432 = v1431 ~= nil and v1431:is_alive();
            local v1433 = v1432 and v1431.m_bIsScoped;
            local v1434 = v7.rage.main.double_tap:get();
            local v1435 = v7.rage.main.hide_shots:get();
            l_l_v870_9_1:update(0.05, v1432);
            l_l_v1212_1_1:update(0.05, v1433);
            l_l_v1213_1_1:update(0.05, v1434);
            l_v1214_2:update(0.05, v1435);
        end;
        l_l_layout_0_8.draw = function()
            -- upvalues: l_l_v870_9_1 (ref), l_l_v1212_1_1 (ref), l_l_v1213_1_1 (ref), l_v1214_2 (ref), v90 (ref), l_v1217_2 (ref), l_v1222_2 (ref), l_v1297_1 (ref), l_v1306_1 (ref), l_v1309_1 (ref)
            local l_value_6 = l_l_v870_9_1.value;
            local l_value_7 = l_l_v1212_1_1.value;
            local l_value_8 = l_l_v1213_1_1.value;
            local l_value_9 = l_v1214_2.value;
            if l_value_6 == 0 then
                return;
            else
                local v1440 = render.screen_size() / 2 + vector(0, v90.features.indicate_state.offset:get());
                local v1441 = "s";
                l_v1217_2(4, v1440, v1441, l_value_6, l_value_7);
                l_v1222_2(1, v1440, v1441, l_value_6, l_value_7);
                l_v1297_1(1, v1440, v1441, l_value_6, l_value_7);
                l_v1306_1(1, v1440, v1441, l_value_6 * l_value_8, l_value_7);
                l_v1309_1(1, v1440, v1441, l_value_6 * l_value_9, l_value_7);
                return;
            end;
        end;
        l_l_layout_0_8.render = function()
            -- upvalues: l_l_layout_0_8 (ref)
            l_l_layout_0_8.update();
            l_l_layout_0_8.draw();
        end;
    end;
    l_v870_9 = function()
        -- upvalues: l_l_defensive_0_7 (ref), l_l_list_0_7 (ref), v90 (ref), l_l_layout_0_8 (ref)
        if l_l_defensive_0_7 == "Default" then
            l_l_list_0_7.render();
            v90.features.indicate_state.color:visibility(false);
            v90.features.indicate_state.offset:visibility(false);
            return;
        elseif l_l_defensive_0_7 == "Alternative" then
            l_l_layout_0_8.render();
            v90.features.indicate_state.color:visibility(true);
            v90.features.indicate_state.offset:visibility(true);
            return;
        else
            return;
        end;
    end;
    l_v1212_1 = function(v1442)
        -- upvalues: l_v870_9 (ref)
        events.render(l_v870_9, v1442);
    end;
    l_v1213_1 = v90.features.indicate_state;
    v1214 = function(v1443)
        -- upvalues: l_v858_8 (ref)
        l_v858_8 = v1443:get();
    end;
    v1215 = function(v1444)
        -- upvalues: l_l_defensive_0_7 (ref)
        l_l_defensive_0_7 = v1444:get();
    end;
    do
        local l_v1214_3, l_v1215_3 = v1214, v1215;
        v1216 = function(v1447)
            -- upvalues: l_v1213_1 (ref), l_v1214_3 (ref), l_v1215_3 (ref), l_v1212_1 (ref)
            local v1448 = v1447:get();
            if v1448 then
                l_v1213_1.color:set_callback(l_v1214_3, true);
                l_v1213_1.type:set_callback(l_v1215_3, true);
            else
                l_v1213_1.color:unset_callback(l_v1214_3);
                l_v1213_1.type:unset_callback(l_v1215_3);
            end;
            l_v1212_1(v1448);
        end;
        l_v1213_1.enabled:set_callback(v1216, true);
    end;
end;
v751 = nil;
l_safe_head_0 = {
    Small = 2, 
    Default = 1
};
v857 = 4;
v858 = 4;
l_defensive_0 = l_smoothy_0.new(0);
l_list_0 = nil;
l_layout_0 = color();
v870 = render.screen_size();
v1212 = v87.new("damage_indicator", {
    pos = vector(v870.x * 0.5 + 5, v870.y * 0.5 - 5), 
    anchor = vector(0, 1)
});
do
    local l_l_safe_head_0_7, l_v857_6, l_v858_9, l_l_defensive_0_8, l_l_list_0_8, l_l_layout_0_9, l_v1212_2, l_v1213_2, l_v1214_4, l_v1215_4 = l_safe_head_0, v857, v858, l_defensive_0, l_list_0, l_layout_0, v1212, v1213, v1214, v1215;
    l_v1213_2 = function()
        -- upvalues: l_l_safe_head_0_7 (ref), l_l_list_0_8 (ref), l_v1212_2 (ref), l_l_defensive_0_8 (ref), v7 (ref), l_v857_6 (ref), l_v858_9 (ref), l_l_layout_0_9 (ref)
        local v1459 = entity.get_local_player();
        if v1459 == nil or not v1459:is_alive() then
            return;
        else
            local v1460 = l_l_safe_head_0_7[l_l_list_0_8];
            if v1460 == nil then
                return;
            else
                local l_is_dragged_0 = l_v1212_2.is_dragged;
                local v1462 = ui.get_alpha() > 0 and (l_is_dragged_0 and 0.5 or 1);
                local v1463 = l_l_defensive_0_8:update(0.05, v1462);
                local v1464 = l_v1212_2:get_pos();
                local v1465 = tostring(v7.rage.selection.min_damage:get());
                local v1466 = "cs";
                local v1467 = render.measure_text(v1460, v1466, v1465) + vector(l_v857_6, l_v858_9) * 2 + vector(1, 0);
                local v1468 = v1464 + v1467 * 0.5 + vector(1, 0);
                local v1469 = color(200, 200, 200, 128);
                v1469.a = v1469.a * v1463;
                render.rect_outline(v1464, v1464 + v1467, v1469, 1, 4);
                render.text(v1460, v1468, l_l_layout_0_9, v1466, v1465);
                l_v1212_2:set_size(v1467);
                return;
            end;
        end;
    end;
    l_v1214_4 = function(v1470)
        -- upvalues: l_v1213_2 (ref)
        events.render(l_v1213_2, v1470);
    end;
    l_v1215_4 = v90.features.damage_indicator;
    v1216 = function(v1471)
        -- upvalues: l_l_layout_0_9 (ref)
        l_l_layout_0_9 = v1471:get();
    end;
    v1217 = function(v1472)
        -- upvalues: l_l_list_0_8 (ref)
        l_l_list_0_8 = v1472:get();
    end;
    do
        local l_v1216_3, l_v1217_3 = v1216, v1217;
        v1222 = function(v1475)
            -- upvalues: l_v1215_4 (ref), l_v1216_3 (ref), l_v1217_3 (ref), l_v1214_4 (ref)
            local v1476 = v1475:get();
            if v1476 then
                l_v1215_4.color:set_callback(l_v1216_3, true);
                l_v1215_4.font:set_callback(l_v1217_3, true);
            else
                l_v1215_4.color:unset_callback(l_v1216_3);
                l_v1215_4.font:unset_callback(l_v1217_3);
            end;
            l_v1214_4(v1476);
        end;
        l_v1215_4.enabled:set_callback(v1222, true);
    end;
end;
l_safe_head_0 = nil;
v857 = v90.features.velocity_warning;
v858 = 8;
l_defensive_0 = 8;
l_list_0 = render.load_font("museo500", 14.2, "a");
l_layout_0 = l_smoothy_0.new();
v870 = v87.new("velocity_warning");
v1212 = render.screen_size();
v870:set_anchor(vector(0.5, 0));
v870:set_pos(vector(v1212.x * 0.5, v1212.y * 0.3));
v1212 = function(v1477)
    if v1477 == nil or not v1477:is_alive() then
        return 1;
    else
        return v1477.m_flVelocityModifier;
    end;
end;
do
    local l_v857_7, l_v858_10, l_l_defensive_0_9, l_l_list_0_9, l_l_layout_0_10, l_v870_10, l_v1212_3, l_v1213_3 = v857, v858, l_defensive_0, l_list_0, l_layout_0, v870, v1212, v1213;
    l_v1213_3 = function()
        -- upvalues: l_v1212_3 (ref), l_l_layout_0_10 (ref), l_v870_10 (ref), l_l_list_0_9 (ref), l_v857_7 (ref), l_l_defensive_0_9 (ref), l_v858_10 (ref)
        local v1486 = entity.get_local_player();
        local v1487 = l_v1212_3(v1486);
        local v1488 = l_l_layout_0_10:update(0.05, v1487 < 1 or ui.get_alpha() > 0);
        local v1489 = l_v870_10:get_pos();
        local v1490 = l_v870_10:get_size();
        local _ = nil;
        local v1492 = 8;
        local v1493 = color(0, 0, 0, 50 * v1488);
        local v1494 = color(0, 0, 0, 5 * v1488);
        render.blur(v1489, v1489 + v1490, 0.25, v1488, v1492);
        render.rect(v1489, v1489 + v1490, v1493, v1492);
        render.rect_outline(v1489, v1489 + v1490, v1494, 1, v1492);
        v1492 = nil;
        v1493 = 6;
        v1494 = ui.get_icon("triangle-exclamation");
        local v1495 = "velocity";
        local v1496 = string.format("%d%%", v1487 * 100);
        local v1497 = render.measure_text(l_l_list_0_9, nil, v1494);
        local v1498 = render.measure_text(l_l_list_0_9, nil, v1495);
        local v1499 = render.measure_text(l_l_list_0_9, nil, v1496);
        local v1500 = l_v857_7.color:get();
        local v1501 = v1489 + v1490 / 2;
        local v1502 = vector(v1497.x + v1498.x + v1493 + v1499.x + v1493, math.max(v1497.y, v1498.y, v1499.y));
        v1500.a = v1500.a * v1488;
        v1501.x = v1501.x - v1502.x / 2;
        v1501.y = v1501.y - v1502.y / 2;
        render.text(l_l_list_0_9, v1501, v1500, "s", v1494);
        v1501.x = v1501.x + v1497.x + v1493;
        render.text(l_l_list_0_9, v1501 - vector(0, 1), v1500, "s", v1495);
        v1501.x = v1501.x + v1498.x + v1493;
        render.text(l_l_list_0_9, v1501 - vector(0, 1), color(255, 255, 255, 255 * v1488), "s", v1496);
        l_v870_10:set_size(v1502 + vector(l_l_defensive_0_9, l_v858_10) * 2);
    end;
    v1214 = function(v1503)
        -- upvalues: l_v1213_3 (ref)
        events.render(l_v1213_3, v1503:get());
    end;
    l_v857_7.enabled:set_callback(v1214, true);
end;
v857 = nil;
v858 = 0;
l_defensive_0 = color();
do
    local l_v858_11, l_l_defensive_0_10, l_l_list_0_10, l_l_layout_0_11, l_v870_11, l_v1212_4 = v858, l_defensive_0, l_list_0, l_layout_0, v870, v1212;
    l_l_list_0_10 = function()
        -- upvalues: l_v858_11 (ref), l_l_defensive_0_10 (ref)
        if not globals.is_in_game or l_v858_11 <= 0 then
            return;
        else
            local v1510 = 1;
            if l_v858_11 < 0.25 then
                v1510 = l_v858_11 / 0.25;
            end;
            local v1511 = l_l_defensive_0_10:clone();
            v1511.a = v1511.a * v1510;
            local v1512 = render.screen_size() * 0.5;
            render.line(vector(v1512.x - 10, v1512.y - 10), vector(v1512.x - 5, v1512.y - 5), v1511);
            render.line(vector(v1512.x + 10, v1512.y - 10), vector(v1512.x + 5, v1512.y - 5), v1511);
            render.line(vector(v1512.x + 10, v1512.y + 10), vector(v1512.x + 5, v1512.y + 5), v1511);
            render.line(vector(v1512.x - 10, v1512.y + 10), vector(v1512.x - 5, v1512.y + 5), v1511);
            l_v858_11 = math.max(l_v858_11 - globals.frametime, 0);
            return;
        end;
    end;
    l_l_layout_0_11 = function(v1513)
        -- upvalues: l_v858_11 (ref)
        local v1514 = entity.get_local_player();
        local v1515 = entity.get(v1513.userid, true);
        local v1516 = entity.get(v1513.attacker, true);
        if v1515 == v1514 or v1516 ~= v1514 then
            return;
        else
            l_v858_11 = 0.5;
            return;
        end;
    end;
    l_v870_11 = function(v1517)
        -- upvalues: l_v858_11 (ref), l_l_list_0_10 (ref), l_l_layout_0_11 (ref)
        if not v1517 then
            l_v858_11 = 0;
        end;
        events.render(l_l_list_0_10, v1517);
        events.player_hurt(l_l_layout_0_11, v1517);
    end;
    l_v1212_4 = v90.features.hit_marker;
    v1213 = function(v1518)
        -- upvalues: l_l_defensive_0_10 (ref)
        l_l_defensive_0_10 = v1518:get();
    end;
    do
        local l_v1213_4 = v1213;
        v1214 = function(v1520)
            -- upvalues: l_v1212_4 (ref), l_v1213_4 (ref), l_v870_11 (ref)
            local v1521 = v1520:get();
            if v1521 then
                l_v1212_4.color:set_callback(l_v1213_4, true);
            else
                l_v1212_4.color:unset_callback(l_v1213_4);
            end;
            l_v870_11(v1521);
        end;
        l_v1212_4.enabled:set_callback(v1214, true);
    end;
end;
v858 = nil;
l_defensive_0 = {};
l_list_0 = {};
do
    local l_l_defensive_0_11, l_l_list_0_11, l_l_layout_0_12, l_v870_12, l_v1212_5, l_v1213_5 = l_defensive_0, l_list_0, l_layout_0, v870, v1212, v1213;
    l_l_layout_0_12 = function()
        -- upvalues: l_l_list_0_11 (ref), l_l_defensive_0_11 (ref)
        if not globals.is_in_game then
            return;
        else
            local _ = globals.frametime;
            local l_realtime_1 = globals.realtime;
            local v1530 = l_l_list_0_11.Horizontal[1] or color();
            local v1531 = l_l_list_0_11.Vertical[1] or color();
            for v1532 = #l_l_defensive_0_11, 1, -1 do
                if l_l_defensive_0_11[v1532].time < l_realtime_1 then
                    table.remove(l_l_defensive_0_11, v1532);
                end;
            end;
            for v1533 = 1, #l_l_defensive_0_11 do
                local v1534 = l_l_defensive_0_11[v1533];
                local v1535 = 1;
                local v1536 = v1534.time - l_realtime_1;
                if v1536 < 0.5 then
                    v1535 = v1536 / 0.5;
                end;
                local v1537 = render.world_to_screen(v1534.point);
                if v1537 ~= nil then
                    local v1538 = vector(v1537.x - 5, v1537.y - 1);
                    local v1539 = vector(v1537.x + 5, v1537.y + 1);
                    local v1540 = vector(v1537.x - 1, v1537.y - 5);
                    local v1541 = vector(v1537.x + 1, v1537.y + 5);
                    render.rect(v1538, v1539, v1530:alpha_modulate(v1530.a * v1535));
                    render.rect(v1540, v1541, v1531:alpha_modulate(v1531.a * v1535));
                end;
            end;
            return;
        end;
    end;
    l_v870_12 = function(v1542)
        -- upvalues: l_l_defensive_0_11 (ref)
        if v1542.state ~= nil then
            return;
        else
            local v1543 = globals.realtime + 3;
            table.insert(l_l_defensive_0_11, {
                time = v1543, 
                point = v1542.aim
            });
            return;
        end;
    end;
    l_v1212_5 = function(v1544)
        -- upvalues: l_l_defensive_0_11 (ref), l_l_layout_0_12 (ref), l_v870_12 (ref)
        if not v1544 then
            for v1545 = 1, #l_l_defensive_0_11 do
                l_l_defensive_0_11[v1545] = nil;
            end;
        end;
        events.render(l_l_layout_0_12, v1544);
        events.aim_ack(l_v870_12, v1544);
    end;
    l_v1213_5 = v90.features.kibit_marker;
    v1214 = function(v1546)
        -- upvalues: l_l_list_0_11 (ref)
        local v1547 = v1546:list();
        for v1548 = 1, #v1547 do
            local v1549 = v1547[v1548];
            l_l_list_0_11[v1549] = v1546:get(v1549);
        end;
    end;
    do
        local l_v1214_5 = v1214;
        v1215 = function(v1551)
            -- upvalues: l_v1213_5 (ref), l_v1214_5 (ref), l_v1212_5 (ref)
            local v1552 = v1551:get();
            if v1552 then
                l_v1213_5.color:set_callback(l_v1214_5, true);
            else
                l_v1213_5.color:unset_callback(l_v1214_5);
            end;
            l_v1212_5(v1552);
        end;
        l_v1213_5.enabled:set_callback(v1215, true);
    end;
end;
v199 = nil;
v200 = nil;
v442 = {
    [1] = "        ", 
    [2] = "        ", 
    [3] = "        ", 
    [4] = "sp      ", 
    [5] = "spe     ", 
    [6] = "spec    ", 
    [7] = "spect   ", 
    [8] = "spectr  ", 
    [9] = "spectra ", 
    [10] = "spectral", 
    [11] = "spectral", 
    [12] = "spectral", 
    [13] = "spectral", 
    [14] = "spectral", 
    [15] = "spectral", 
    [16] = "spectral", 
    [17] = "spectral", 
    [18] = "spectral", 
    [19] = "spectral", 
    [20] = "spectral", 
    [21] = "spectral", 
    [22] = "spectral", 
    [23] = "spectral", 
    [24] = " pectral", 
    [25] = "  ectral", 
    [26] = "   ctral", 
    [27] = "    tral", 
    [28] = "     ral", 
    [29] = "      al", 
    [30] = "       l", 
    [31] = "        ", 
    [32] = "        ", 
    [33] = "        "
};
v742 = nil;
v743 = nil;
do
    local l_v743_9 = v743;
    v742 = function(v1554)
        -- upvalues: l_v743_9 (ref)
        if l_v743_9 == v1554 then
            return;
        else
            common.set_clan_tag(v1554);
            l_v743_9 = v1554;
            return;
        end;
    end;
end;
do
    local l_v442_6, l_v742_6, l_v743_10, l_v747_10, l_v751_12 = v442, v742, v743, v747, v751;
    l_v743_10 = function()
        -- upvalues: l_v742_6 (ref)
        l_v742_6("");
    end;
    l_v747_10 = function()
        -- upvalues: l_v442_6 (ref), l_v742_6 (ref)
        local v1560 = utils.net_channel();
        if v1560 == nil then
            return;
        else
            local v1561 = to_ticks(v1560.latency[1]);
            local v1562 = (globals.tickcount + v1561) / 17;
            local v1563 = l_v442_6[math.floor(0.5 + v1562) % #l_v442_6 + 1];
            if v1563 == nil then
                return;
            else
                l_v742_6(v1563);
                return;
            end;
        end;
    end;
    l_v751_12 = function(v1564)
        -- upvalues: l_v743_10 (ref), l_v747_10 (ref)
        if not v1564 then
            l_v743_10();
        end;
        events.shutdown(l_v743_10, v1564);
        events.net_update_start(l_v747_10, v1564);
    end;
    l_safe_head_0 = v90.features.clantag;
    v857 = function(v1565)
        -- upvalues: v7 (ref), l_v751_12 (ref)
        local v1566 = v1565:get();
        if not v1566 then
            v7.misc.main.in_game.clan_tag:override();
        else
            v7.misc.main.in_game.clan_tag:override(false);
        end;
        l_v751_12(v1566);
    end;
    l_safe_head_0.enabled:set_callback(v857, true);
end;
v442 = nil;
v742 = 0;
v743 = cvar.cl_righthand;
v747 = cvar.viewmodel_fov;
v751 = cvar.viewmodel_offset_x;
l_safe_head_0 = cvar.viewmodel_offset_y;
v857 = cvar.viewmodel_offset_z;
v858 = 0;
do
    local l_v742_7, l_v743_11, l_v747_11, l_v751_13, l_l_safe_head_0_8, l_v857_8, l_v858_12, l_l_defensive_0_12, l_l_list_0_12, l_l_layout_0_13, l_v870_13, l_v1212_6, l_v1213_6, l_v1214_6, l_v1215_5 = v742, v743, v747, v751, l_safe_head_0, v857, v858, l_defensive_0, l_list_0, l_layout_0, v870, v1212, v1213, v1214, v1215;
    l_l_defensive_0_12 = function()
        -- upvalues: l_v742_7 (ref)
        local v1582 = entity.get_local_player();
        if v1582 == nil then
            return false;
        else
            local v1583 = v1582:get_player_weapon();
            if v1583 == nil then
                return false;
            else
                local v1584 = v1583:get_weapon_info();
                if v1584 == nil then
                    return false;
                else
                    return v1584.weapon_type == l_v742_7;
                end;
            end;
        end;
    end;
    l_l_list_0_12 = function(v1585)
        return tonumber(v1585:string());
    end;
    l_l_layout_0_13 = function(v1586)
        -- upvalues: l_v743_11 (ref)
        if l_v743_11:string() == "1" then
            l_v743_11:int(v1586 and 0 or 1, true);
        else
            l_v743_11:int(v1586 and 1 or 0, true);
        end;
    end;
    l_v870_13 = function()
        -- upvalues: l_v747_11 (ref), l_l_list_0_12 (ref), l_v751_13 (ref), l_l_safe_head_0_8 (ref), l_v857_8 (ref), l_v743_11 (ref)
        l_v747_11:float(l_l_list_0_12(l_v747_11), false);
        l_v751_13:float(l_l_list_0_12(l_v751_13), false);
        l_l_safe_head_0_8:float(l_l_list_0_12(l_l_safe_head_0_8), false);
        l_v857_8:float(l_l_list_0_12(l_v857_8), false);
        l_v743_11:int(l_v743_11:string() == "1" and 1 or 0, false);
    end;
    l_v1212_6 = function()
        -- upvalues: l_v870_13 (ref)
        l_v870_13();
    end;
    l_v1213_6 = function(v1587)
        -- upvalues: l_v858_12 (ref), l_l_layout_0_13 (ref), l_l_defensive_0_12 (ref)
        if l_v858_12 ~= 0 then
            l_l_layout_0_13(l_l_defensive_0_12());
        end;
        l_v858_12 = v1587.weaponselect;
    end;
    l_v1214_6 = function(v1588)
        -- upvalues: l_v870_13 (ref), l_v1213_6 (ref), l_v1212_6 (ref)
        if not v1588 then
            l_v870_13();
            events.createmove(l_v1213_6, false);
        end;
        events.shutdown(l_v1212_6, v1588);
    end;
    l_v1215_5 = v90.features.viewmodel;
    v1216 = function(v1589)
        -- upvalues: l_v747_11 (ref)
        l_v747_11:float(v1589:get() * 0.1, true);
    end;
    v1217 = function(v1590)
        -- upvalues: l_v751_13 (ref)
        l_v751_13:float(v1590:get() * 0.1, true);
    end;
    v1222 = function(v1591)
        -- upvalues: l_l_safe_head_0_8 (ref)
        l_l_safe_head_0_8:float(v1591:get() * 0.1, true);
    end;
    v1297 = function(v1592)
        -- upvalues: l_v857_8 (ref)
        l_v857_8:float(v1592:get() * 0.1, true);
    end;
    v1306 = function(v1593)
        -- upvalues: l_v743_11 (ref), l_l_layout_0_13 (ref), l_l_defensive_0_12 (ref), l_v1213_6 (ref)
        local v1594 = v1593:get();
        if not v1594 then
            l_v743_11:int(l_v743_11:string() == "1" and 1 or 0, false);
        else
            l_l_layout_0_13(l_l_defensive_0_12());
        end;
        events.createmove(l_v1213_6, v1594);
    end;
    do
        local l_v1216_4, l_v1217_4, l_v1222_3, l_v1297_2, l_v1306_2 = v1216, v1217, v1222, v1297, v1306;
        v1309 = function(v1600)
            -- upvalues: l_v1215_5 (ref), l_v1216_4 (ref), l_v1217_4 (ref), l_v1222_3 (ref), l_v1297_2 (ref), l_v1306_2 (ref), l_v1214_6 (ref)
            local v1601 = v1600:get();
            if v1601 then
                l_v1215_5.fov:set_callback(l_v1216_4, true);
                l_v1215_5.offset_x:set_callback(l_v1217_4, true);
                l_v1215_5.offset_y:set_callback(l_v1222_3, true);
                l_v1215_5.offset_z:set_callback(l_v1297_2, true);
                l_v1215_5.opposite_knife_hand:set_callback(l_v1306_2, true);
            else
                l_v1215_5.fov:unset_callback(l_v1216_4);
                l_v1215_5.offset_x:unset_callback(l_v1217_4);
                l_v1215_5.offset_y:unset_callback(l_v1222_3);
                l_v1215_5.offset_z:unset_callback(l_v1297_2);
                l_v1215_5.opposite_knife_hand:unset_callback(l_v1306_2);
            end;
            l_v1214_6(v1601);
        end;
        l_v1215_5.enabled:set_callback(v1309, true);
    end;
end;
v742 = nil;
v743 = ui.find("Miscellaneous", "Main", "Other", "Fake Latency");
v747 = v90.features.ping_spike.value:get();
do
    local l_v743_12, l_v751_14, l_l_safe_head_0_9, l_v857_9 = v743, v751, l_safe_head_0, v857;
    l_v751_14 = function()
        -- upvalues: l_v743_12 (ref), v90 (ref)
        l_v743_12:override(v90.features.ping_spike.value:get());
    end;
    l_l_safe_head_0_9 = function()
        -- upvalues: l_v743_12 (ref)
        l_v743_12:override();
    end;
    l_v857_9 = function(v1606)
        -- upvalues: l_l_safe_head_0_9 (ref), l_v751_14 (ref)
        if not v1606 then
            l_l_safe_head_0_9();
        end;
        events.shutdown(l_l_safe_head_0_9, v1606);
        events.render(l_v751_14, v1606);
    end;
    v90.features.ping_spike.enabled:set_callback(function(v1607)
        -- upvalues: l_v751_14 (ref), l_l_safe_head_0_9 (ref), l_v857_9 (ref)
        local v1608 = v1607:get();
        if v1608 == true then
            events.render(l_v751_14, v1608);
        else
            v1608 = false;
            l_l_safe_head_0_9();
        end;
        l_v857_9(v1608);
    end, true);
end;
