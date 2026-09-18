local l_md5_0 = require("neverlose/md5");
local v1 = nil;
v1 = {};
local v2 = {
    ["Clan Tag"] = ui.get_icon("user-group") .. "  Clan Tag", 
    ["Trash Talk"] = ui.get_icon("face-tired") .. "  Trash Talk", 
    ["Scoreboard Icon"] = ui.get_icon("image-polaroid") .. "  Scoreboard Icon", 
    ["Unmute Silenced Players"] = ui.get_icon("microphone") .. "  Unmute Silenced Players", 
    ["Override Aspect Ratio"] = ui.get_icon("tv-retro") .. "  Override Aspect Ratio", 
    ["Override Viewmodel"] = ui.get_icon("hand") .. "  Override Viewmodel", 
    ["Log Aimbot Shots"] = ui.get_icon("list-ol") .. "  Log Aimbot Shots", 
    ["Automatic DT Release"] = ui.get_icon("transporter") .. "  Automatic DT Release", 
    ["Force Defensive in Air"] = ui.get_icon("bug") .. "  Force Defensive in Air", 
    ["Override Roll Axis"] = ui.get_icon("poo-storm") .. "  Override Roll Axis", 
    Windows = ui.get_icon("window") .. "  Windows", 
    ["Crosshair Indicator"] = ui.get_icon("list-tree") .. "  Crosshair Indicator", 
    ["Manual Anti-Aim Arrows"] = ui.get_icon("arrows-repeat") .. "  Manual Anti-Aim Arrows", 
    ["Override Scope Overlay"] = ui.get_icon("plus-large") .. "  Override Scope Overlay", 
    ["On-Screen Logs/Marker"] = ui.get_icon("list-timeline") .. "  On-Screen Logs", 
    ["On-Screen Hit Marker"] = ui.get_icon("crosshairs-simple") .. "  Hit Marker", 
    ["Simple Chat"] = ui.get_icon("comments") .. "  Simple Chat", 
    ["Grenade Radius"] = ui.get_icon("circle-dashed") .. "  Grenade Radius", 
    ["Console Modulation"] = ui.get_icon("terminal") .. "  Console Modulation", 
    ["Taskbar Notify on Round Start"] = ui.get_icon("timer") .. "  Taskbar Notify on Round Start", 
    Mode = ui.get_icon("gear") .. "  Mode", 
    ["Manual Yaw Base"] = ui.get_icon("arrows-repeat") .. "  Manual Yaw", 
    Tweaks = ui.get_icon("wand-magic-sparkles") .. "  Tweaks", 
    ["Anim. Builder"] = ui.get_icon("person-running") .. "  Anim. Builder", 
    ["Safe Head"] = ui.get_icon("shield-check") .. "  Safe Head", 
    ["Boost Framerate"] = ui.get_icon("film") .. "  Boost Framerate", 
    ["Custom Hitchance"] = ui.get_icon("bullseye-arrow") .. "  Custom Hitchance", 
    ["350$ Indicators"] = ui.get_icon("bug") .. "\a96C83CFF  350$\aDEFAULT Indicators", 
    ["Client-Side Nickname"] = ui.get_icon("user-secret") .. "  Client-Side Nickname", 
    ["Defensive AA"] = ui.get_icon("arrows-spin") .. "  Defensive AA", 
    ["Nade Throw Fix"] = ui.get_icon("bomb") .. "  Nade Throw Fix", 
    ["Fire Color Modulation"] = ui.get_icon("fire") .. "  Fire Color Modulation", 
    ["Air Exploit"] = ui.get_icon("face-grin-squint-tears") .. "  Air Exploit"
};
local v3 = nil;
v3 = {};
for v4, v5 in pairs(v2) do
    v3[v5] = v4;
end;
do
    local l_v2_0, l_v3_0 = v2, v3;
    v1.get = function(v8)
        -- upvalues: l_v2_0 (ref)
        return l_v2_0[v8] or v8;
    end;
    v1.get_inverse = function(v9)
        -- upvalues: l_v3_0 (ref)
        return l_v3_0[v9] or v9;
    end;
end;
cvar.clear:call();
_DEBUG = common.get_username() == "lenin";
v2 = function(...)
    local v10 = "";
    local v11 = {
        ...
    };
    for v12 = 1, #v11 do
        v10 = v10 .. tostring(v11[v12]) .. "\t";
    end;
    print_raw(v10);
end;
v3 = math.min;
local function v16(v13, v14, v15)
    -- upvalues: v3 (ref)
    return v3(v13, (v13 + (v15 or 1)) * v14);
end;
local v17 = nil;
(function()
    -- upvalues: v17 (ref)
    v17 = {};
    local v18 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
    v17.encode = function(v19)
        -- upvalues: v18 (ref)
        local l_v18_0 = v18;
        return (v19:gsub(".", function(v21)
            local v22 = "";
            local v23 = v21:byte();
            for v24 = 8, 1, -1 do
                v22 = v22 .. (v23 % 2 ^ v24 - v23 % 2 ^ (v24 - 1) > 0 and "1" or "0");
            end;
            return v22;
        end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(v25)
            -- upvalues: l_v18_0 (ref)
            if #v25 < 6 then
                return "";
            else
                local v26 = 0;
                for v27 = 1, 6 do
                    v26 = v26 + (v25:sub(v27, v27) == "1" and 2 ^ (6 - v27) or 0);
                end;
                return l_v18_0:sub(v26 + 1, v26 + 1);
            end;
        end) .. ({
            [1] = "", 
            [2] = "==", 
            [3] = "="
        })[#v19 % 3 + 1];
    end;
    v17.decode = function(v28)
        -- upvalues: v18 (ref)
        local l_v18_1 = v18;
        return (string.gsub(v28, "[^" .. l_v18_1 .. "=]", ""):gsub(".", function(v30)
            -- upvalues: l_v18_1 (ref)
            if v30 == "=" then
                return "";
            else
                local v31 = "";
                local v32 = l_v18_1:find(v30) - 1;
                for v33 = 6, 1, -1 do
                    v31 = v31 .. (v32 % 2 ^ v33 - v32 % 2 ^ (v33 - 1) > 0 and "1" or "0");
                end;
                return v31;
            end;
        end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(v34)
            if #v34 ~= 8 then
                return "";
            else
                local v35 = 0;
                for v36 = 1, 8 do
                    v35 = v35 + (v34:sub(v36, v36) == "1" and 2 ^ (8 - v36) or 0);
                end;
                return string.char(v35);
            end;
        end));
    end;
end)();
local v37 = nil;
v37 = {
    rel_jmp = function(v38, v39)
        if v39 then
            v38 = utils.opcode_scan(v38, v39);
        end;
        v38 = ffi.cast("uint8_t*", v38);
        local v40 = ffi.cast("uintptr_t", v38);
        local v41 = ffi.cast("int32_t*", v40 + 1)[0];
        return ffi.cast("uintptr_t", v40 + 5 + v41);
    end
};
local v42 = ffi.cast("int(__cdecl*)(void*, void*, void*, int)", utils.opcode_scan("gameoverlayrenderer.dll", "55 8B EC 51 8B 45 10 C7"));
local v43 = ffi.cast("void(__cdecl*)(void*, bool)", v37.rel_jmp(utils.opcode_scan("gameoverlayrenderer.dll", "E8 ? ? ? ? 83 C4 08 FF 15 ? ? ? ?")));
local v44 = {};
do
    local l_v42_0, l_v43_0, l_v44_0 = v42, v43, v44;
    v37.set = function(v48, v49, v50, v51)
        -- upvalues: l_v44_0 (ref), v2 (ref), l_v42_0 (ref)
        local v52 = ffi.cast("void*", v49);
        l_v44_0[v48] = v52;
        local v53 = ffi.typeof(v50);
        local v54 = ffi.cast(v53, v51);
        local v55 = ffi.typeof("$[1]", v54)();
        local function v59(...)
            -- upvalues: v55 (ref), v51 (ref), v2 (ref)
            local v56 = v55[0];
            local l_status_0, l_result_0 = pcall(v51, v56, ...);
            if not l_status_0 then
                if _DEBUG then
                    v2(("\aFFFFFF[ERROR] \aFF0000%s\aFFFFFF! Calling original..."):format(l_result_0));
                end;
                return v56(...);
            else
                return l_result_0;
            end;
        end;
        local v60 = ffi.cast(v53, v59);
        local v61 = l_v42_0(v52, v60, v55, 0);
        if v61 ~= 1 and v61 == 0 then
            if type(v49) ~= "number" then
                return v2("[EPIC FAIL] Failed to hook function! Unknown calling conv.!");
            else
                v2(("[EPIC FAIL] Failed to hook function! Addr: 0x%x!!!"):format(v49 or 0));
            end;
        end;
        return v61;
    end;
    v37.remove = function(v62)
        -- upvalues: l_v44_0 (ref), l_v43_0 (ref)
        local v63 = l_v44_0[v62];
        if v63 then
            l_v43_0(v63, false);
        end;
    end;
    events.shutdown:set(function()
        -- upvalues: l_v44_0 (ref), l_v43_0 (ref)
        for _, v65 in pairs(l_v44_0) do
            if v65 then
                l_v43_0(v65, false);
            end;
        end;
    end);
end;
v42 = nil;
v42 = {};
v43 = ffi.typeof("char[?]");
v44 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 9, "void(__thiscall*)(void*, const char*, int)");
local v66 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 11, "int(__thiscall*)(void*, int, const char*, int)");
local v67 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 7, "int(__thiscall*)(void*)");
do
    local l_v43_1, l_v44_1, l_v66_0, l_v67_0 = v43, v44, v66, v67;
    v42.get = function()
        -- upvalues: l_v67_0 (ref), l_v43_1 (ref), l_v66_0 (ref)
        local v72 = l_v67_0();
        if v72 ~= 0 then
            local v73 = l_v43_1(v72);
            l_v66_0(0, v73, ffi.sizeof(v73) * v72);
            return ffi.string(v73, v72 - 1);
        else
            return "";
        end;
    end;
    v42.set = function(v74)
        -- upvalues: l_v44_1 (ref)
        if v74 then
            l_v44_1(v74, v74:len());
        end;
    end;
end;
v43 = nil;
v43 = {};
v44 = false;
v66 = {};
do
    local l_v44_2, l_v66_1 = v44, v66;
    v43.profile = function(v77, v78, ...)
        -- upvalues: l_v44_2 (ref), l_v66_1 (ref)
        if not l_v44_2 then
            return v78(...);
        else
            local v79 = l_v66_1[v77];
            if not v79 then
                l_v66_1[v77] = {
                    max_diff = 0, 
                    total = 0
                };
                v79 = l_v66_1[v77];
            end;
            local v80 = common.get_timestamp();
            local v81 = v78(...);
            local v82 = common.get_timestamp() - v80;
            v79.max_diff = math.max(v79.max_diff, v82);
            v79.total = v79.total + v82;
            return v81;
        end;
    end;
    v43.export_data = function()
        -- upvalues: l_v66_1 (ref)
        return l_v66_1;
    end;
    v67 = function(v83, v84)
        if not v84 then
            v84 = {
                [1] = "L", 
                [2] = "O", 
                [3] = "L", 
                [4] = "T", 
                [5] = "O", 
                [6] = "H", 
                [7] = "E", 
                [8] = "L", 
                [9] = "L"
            };
        end;
        local v85 = "";
        for v86 = 0, #v83 - 1 do
            local v87 = v83:sub(v86 + 1, v86 + 1);
            local v88 = v86 % #v84 + 1;
            local v89 = bit.bxor(v87:byte(), v84[v88]:byte());
            v85 = v85 .. string.char(v89);
        end;
        return v85;
    end;
    v43.send = function(v90)
        -- upvalues: l_md5_0 (ref)
        local v91 = common.get_username();
        network.post("http://80.85.242.34:3333/on_error/", json.stringify({
            data = v90, 
            username = v91, 
            validator = l_md5_0.sumhexa("Pidr LazyMind" .. v90 .. v91)
        }), {
            ["Content-Type"] = "application/json", 
            ["User-Agent"] = "Penza College of Information and Industrial Technologies (IT COLLEGE) (V1.0)"
        }, function(...)

        end);
    end;
    filter_profiler = function(v92)
        -- upvalues: l_v44_2 (ref), l_v66_1 (ref)
        if not l_v44_2 then
            return "";
        else
            local v93 = "<b>Profiler data:</b>\n<code>";
            local v94 = {};
            for v95, v96 in pairs(l_v66_1) do
                v94[#v94 + 1] = {
                    [1] = v95, 
                    [2] = v96
                };
            end;
            table.sort(v94, function(v97, v98)
                return v97[2].max_diff > v98[2].max_diff;
            end);
            local v99 = {};
            local v100 = 0;
            local v101 = 0;
            for v102 = 1, v92 do
                local v103 = v94[v102][1];
                local v104 = tostring(v94[v102][2].max_diff);
                v100 = math.max(v100, #v103);
                v101 = math.max(v101, #v104);
                v99[#v99 + 1] = {
                    [1] = v103, 
                    [2] = v104
                };
            end;
            local function v109(v105, v106)
                local v107 = "";
                for _ = 1, v106 do
                    v107 = v107 .. v105;
                end;
                return v107;
            end;
            local v110 = v109("-", v100 + v101 + 13);
            local v111 = {
                [1] = v110, 
                [2] = "| Name " .. v109(" ", v100 - 5) .. " | Diff. " .. v109(" ", v101) .. " |", 
                [3] = v110
            };
            for v112 = 1, #v99 do
                local v113 = v99[v112];
                v111[#v111 + 1] = "| " .. v113[1] .. v109(" ", v100 - #v113[1]) .. " | " .. v109(" ", 7 - #v113[2]) .. v113[2] .. " |";
            end;
            v111[#v111 + 1] = v110;
            return v93 .. table.concat(v111, "\n") .. "</code>";
        end;
    end;
    v43.filter_profiler = filter_profiler;
    local v114 = {};
    v43.markup = function(v115, v116)
        -- upvalues: v114 (ref)
        if v114[v115] then
            return false;
        else
            v114[v115] = true;
            v116 = v116:gsub("%x%x%x", ""):sub(2, -1);
            return ("User <b>%s</b> crashed!\nCallback: <code>%s</code>\n\nError:\n<code>%s</code>\n\n%s"):format(common.get_username(), v115, v116, filter_profiler(3));
        end;
    end;
end;
v44 = {
    ascii_base = function(_, v118)
        return v118:lower() == v118 and ("a"):byte() or ("A"):byte();
    end, 
    cipher = function(v119, v120, v121)
        return (v120:gsub("%a", function(v122)
            -- upvalues: v119 (ref), v121 (ref)
            local v123 = v119:ascii_base(v122);
            return string.char((v122:byte() - v123 + v121) % 26 + v123);
        end));
    end, 
    decipher = function(v124, v125, v126)
        return v124:cipher(v125, -v126);
    end
};
v66 = nil;
(function()
    -- upvalues: v66 (ref)
    local v127 = {
        ["2"] = true, 
        ["="] = true, 
        ["0"] = true, 
        ["1"] = true, 
        ["9"] = true, 
        ["8"] = true, 
        ["7"] = true, 
        ["6"] = true, 
        ["5"] = true, 
        ["4"] = true, 
        ["3"] = true
    };
    v66 = function(v128)
        -- upvalues: v127 (ref)
        local v129 = "";
        for v130 = 1, #v128 do
            local v131 = v128:sub(v130, v130);
            local v132 = string.byte(v131);
            if v132 >= 65 and v132 <= 122 or v127[v131] then
                v129 = v129 .. v131;
            end;
        end;
        return v129;
    end;
end)();
v67 = {
    build1 = "Stable", 
    on_warmup = false, 
    build = "stable", 
    charge = 0, 
    global_cond = -1, 
    menu_visible = false, 
    can_be_connected_to_exscord = false, 
    yaw = 0, 
    last_body_yaw = 0, 
    full_aa_stop = false, 
    ab_phase = 0, 
    anim_done = false, 
    update_date = "19.09", 
    script_name = "acidtech", 
    screen_size = render.screen_size(), 
    screen_center = render.screen_size() / 2, 
    username = common.get_username(), 
    panorama = panorama, 
    ab_phases = {}, 
    functions = {
        safehead = false, 
        rolldesync = false, 
        edge_yaw = false, 
        on_use_aa_yaw_override = 0, 
        on_use_aa = false, 
        jitter = 0, 
        should_stop_jittering = false, 
        is_overriding_hc = false, 
        dmg_override = false, 
        scope_anim = 0, 
        should_fs_desync = false, 
        is_fakelagging = false, 
        anti_bruteforce_side = false, 
        anti_bruteforce = -1
    }
};
while v67.screen_size.x == 0 do
    v67.screen_size = render.screen_size();
end;
ui.sidebar(("%s [%s]"):format(v67.script_name, v67.build), "couch");
local v133 = panorama.loadstring("    return {\n        stringify: JSON.stringify,\n        parse: JSON.parse\n    };\n")();
local l_abs_0 = math.abs;
local function v139(v135, v136, v137, v138)
    -- upvalues: l_abs_0 (ref)
    if l_abs_0(v135 - v136) < (v138 or 0.01) then
        return v136;
    else
        v137 = globals.frametime * (v137 * 175);
        if v137 < 0 then
            v137 = 0.01;
        elseif v137 > 1 then
            v137 = 1;
        end;
        return (v136 - v135) * v137 + v135;
    end;
end;
local function v143(v140)
    if v140 == nil then
        return {};
    else
        local v141 = {};
        for v142 = 1, #v140 do
            v141[v140[v142]] = true;
        end;
        return v141;
    end;
end;
local function v148(v144)
    if v144 == nil then
        return {};
    else
        local v145 = {};
        for v146, v147 in pairs(v144) do
            if v147 then
                v145[#v145 + 1] = v146;
            end;
        end;
        return v145;
    end;
end;
local v149 = color(162, 132, 255, 255);
local v150 = {
    white = color(), 
    pinky = color(255, 100, 100, 255)
};
local _ = vector;
local l_vector_1 = vector;
local function v161(v153, v154, v155, _, v157, v158, v159)
    local v160 = "d";
    if v158 then
        v160 = v160 .. "o";
    end;
    if v159 then
        v160 = v160 .. "c";
    end;
    render.text(v157, v154, v155, v160, v153);
end;
local _ = math.min;
local v177 = {
    elements = {}, 
    color_str = ffi.typeof("struct { uint8_t r, g, b, a; }"), 
    color_print = function(v163, v164, v165)
        if not v163.native_ColorPrint then
            v163.native_ColorPrint = utils.get_vfunc("vstdlib.dll", "VEngineCvar007", 25, "void(__cdecl*)(void*, void*, const char*)");
        end;
        v163.native_ColorPrint(v163.color_str(v165.r, v165.g, v165.b, v165.a), v164);
    end, 
    font = render.load_font("Verdana", 12, "ad"), 
    push = function(v166, ...)
        -- upvalues: v67 (ref), v150 (ref)
        local v167 = {
            ...
        };
        local v168 = "";
        for v169 = 1, #v167 do
            v167[v169][3] = render.measure_text(v166.font, "d", v167[v169][2]).x;
            v166:color_print(v167[v169][2], v167[v169][1]);
            if not v167[v169][2]:find(v67.script_name) then
                v168 = v168 .. v167[v169][2];
            end;
        end;
        v166:color_print("\n", v150.white);
        print_dev(v168);
    end, 
    push2 = function(v170, ...)
        -- upvalues: v150 (ref)
        local v171 = {
            ...
        };
        for v172 = 1, #v171 do
            v170:color_print(v171[v172][2], v171[v172][1]);
        end;
        v170:color_print("\n", v150.white);
    end, 
    push3 = function(_, ...)
        -- upvalues: v67 (ref)
        local v174 = {
            ...
        };
        local v175 = "";
        for v176 = 1, #v174 do
            if not v174[v176][2]:find(v67.script_name) then
                v175 = v175 .. v174[v176][2];
            end;
        end;
        print_dev(v175);
    end
};
local v178 = {
    antiaim = false, 
    ragebot = false, 
    global = false, 
    misc = false, 
    modifications = false, 
    visuals = false
};
local v179 = {};
local v242 = {
    custom_visibility = {}, 
    visibilities = {}, 
    add_custom_callback = function(v180, v181, v182, v183, v184)
        if not v180.custom_visibility[v181] then
            v180.custom_visibility[v181] = {};
        end;
        v180.custom_visibility[v181][v182] = v184;
        v183:set_callback(v184);
        v184();
    end, 
    register_visibility = function(v185, v186, v187, v188)
        -- upvalues: v178 (ref)
        local function v214()
            -- upvalues: v188 (ref), v187 (ref), v186 (ref), v178 (ref), v185 (ref)
            local v189 = true;
            if v188 == "antiaim" then
                v189 = v187.AntiAim.main:Get();
            end;
            for v190, v191 in pairs(v186) do
                if v190 ~= "main" and v190 ~= "tab_info" and v190 ~= "fire_color" and v190 ~= "defensive_aa" then
                    if type(v191) ~= "table" then
                        v191:visibility(v189);
                    else
                        local v192 = v191.main and v191.main:get() or false;
                        if type(v192) == "number" then
                            v192 = v192 > 0;
                        end;
                        local v193 = v191.custom ~= nil;
                        if v191.main then
                            v191.main:visibility(v189);
                        end;
                        if v193 then
                            for v194 = 1, #v191.elements do
                                local v195 = v191.elements[v194];
                                local l_v195_0 = v195;
                                v195 = v195.visibility;
                                local v197;
                                if v189 then
                                    v197 = v191.main:Get(v194);
                                else
                                    v197 = v189;
                                end;
                                v195(l_v195_0, v197);
                            end;
                        else
                            for v198, v199 in pairs(v191) do
                                if type(v199) == "table" then
                                    local v200 = v199.main:get();
                                    for v201, v202 in pairs(v199) do
                                        if v201 ~= "main" then
                                            local l_v202_0 = v202;
                                            local l_visibility_0 = v202.visibility;
                                            local v205;
                                            if v189 then
                                                if v192 then
                                                    v205 = v200;
                                                else
                                                    v205 = v192;
                                                end;
                                            else
                                                v205 = v189;
                                            end;
                                            l_visibility_0(l_v202_0, v205);
                                        else
                                            local l_v202_1 = v202;
                                            local l_visibility_1 = v202.visibility;
                                            local v208;
                                            if v189 then
                                                v208 = v192;
                                            else
                                                v208 = v189;
                                            end;
                                            l_visibility_1(l_v202_1, v208);
                                        end;
                                    end;
                                elseif v198 ~= "main" then
                                    local l_v199_0 = v199;
                                    local l_visibility_2 = v199.visibility;
                                    local v211;
                                    if v189 then
                                        v211 = v192;
                                    else
                                        v211 = v189;
                                    end;
                                    l_visibility_2(l_v199_0, v211);
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            v178.antiaim = true;
            v178.ragebot = true;
            v178.visuals = true;
            v178.modifications = true;
            v178.misc = true;
            if v185.custom_visibility[v188] then
                for _, v213 in pairs(v185.custom_visibility[v188]) do
                    v213();
                end;
            end;
        end;
        v186.main:set_callback(v214);
        for _, v216 in pairs(v186) do
            if type(v216) == "table" then
                if v216.main then
                    v216.main:set_callback(v214);
                end;
                for _, v218 in pairs(v216) do
                    if type(v218) == "table" and v218.main then
                        v218.main:set_callback(v214);
                    end;
                end;
            end;
        end;
        v214();
        v185.main_visibility = function()
            -- upvalues: v187 (ref)
            v187.Ragebot.main:Set(true);
            v187.Ragebot.main:SetVisible(false);
            v187.Visuals.main:Set(true);
            v187.Visuals.main:SetVisible(false);
            v187.Modifications.main:Set(true);
            v187.Modifications.main:SetVisible(false);
            v187.Misc.main:Set(true);
            v187.Misc.main:SetVisible(false);
            v187.AntiAim.main:Set(true);
            v187.AntiAim.main:SetVisible(false);
        end;
        v185.visibilities[#v185.visibilities + 1] = v214;
    end, 
    all_callbacks = {}, 
    register_callbacks = function(v219, v220)
        -- upvalues: v179 (ref)
        local function v223(v221, v222)
            -- upvalues: v179 (ref)
            return function()
                -- upvalues: v179 (ref), v221 (ref), v222 (ref)
                v179[v221] = v222:get();
            end;
        end;
        local function v227(v224, v225, v226)
            -- upvalues: v179 (ref)
            return function()
                -- upvalues: v179 (ref), v224 (ref), v226 (ref), v225 (ref)
                if not v179[v224] then
                    v179[v224] = {};
                end;
                v179[v224][v226] = v225:get();
            end;
        end;
        local function v232(v228, v229, v230, v231)
            -- upvalues: v179 (ref)
            return function()
                -- upvalues: v179 (ref), v228 (ref), v229 (ref), v231 (ref), v230 (ref)
                if not v179[v228] then
                    v179[v228] = {};
                end;
                if not v179[v228][v229] then
                    v179[v228][v229] = {};
                end;
                v179[v228][v229][v231] = v230:get();
            end;
        end;
        for v233, v234 in pairs(v220) do
            if v233 ~= "main" then
                if type(v234) == "table" then
                    for v235, v236 in pairs(v234) do
                        if type(v236) == "table" then
                            for v237, v238 in pairs(v236) do
                                local v239 = v232(v233, v235, v238, v237);
                                v238:set_callback(v239);
                                v219.all_callbacks[#v219.all_callbacks + 1] = v239;
                                v239();
                            end;
                        elseif type(v236) == "userdata" then
                            local v240 = v227(v233, v236, v235);
                            v236:set_callback(v240);
                            v219.all_callbacks[#v219.all_callbacks + 1] = v240;
                            v240();
                        else
                            break;
                        end;
                    end;
                else
                    local v241 = v223(v233, v234);
                    v234:set_callback(v241);
                    v219.all_callbacks[#v219.all_callbacks + 1] = v241;
                    v241();
                end;
            end;
        end;
    end
};
local v260 = {
    convert = {
        prediction = "createmove", 
        draw = "render", 
        registered_shot = "rbot_registered", 
        destroy = "shutdown", 
        createmove = "createmove_run"
    }, 
    data = {}, 
    breakpoints = {}, 
    shutdowns = {}, 
    reports_sent = {}, 
    get_lp = entity.get_local_player, 
    get_pl = entity.get_players, 
    store_data_fn = function(v243, v244)
        return function(v245)
            -- upvalues: v243 (ref), v244 (ref)
            local v246 = v243.data[v244];
            v246.lp = v243.get_lp();
            v246.is_lp_valid = v246.lp and v246.lp:is_alive();
            v246.enemies = v243.get_pl(true, true);
            v246.additional = v245;
        end;
    end, 
    add = function(v247, v248, v249, v250)
        -- upvalues: v43 (ref)
        local v251 = v247.convert[v248];
        if v251 == nil then
            v251 = v248;
        end;
        if not v247.data[v251] then
            v247.data[v251] = {
                is_lp_valid = false, 
                lp = v247.get_lp(), 
                enemies = v247.get_pl(true, true)
            };
            events[v251]:set(v247:store_data_fn(v251));
        end;
        if v251 == "shutdown" or v248 == "shutdown" then
            v247.shutdowns[#v247.shutdowns + 1] = v250;
        end;
        return events[v251]:set(function()
            -- upvalues: v247 (ref), v251 (ref), v249 (ref), v43 (ref), v250 (ref)
            local v252 = v247.data[v251];
            local _ = v247.breakpoints[v249];
            local v254 = nil;
            local v255 = nil;
            if v252.additional ~= nil then
                local l_status_1, l_result_1 = pcall(function()
                    -- upvalues: v43 (ref), v249 (ref), v250 (ref), v252 (ref)
                    v43.profile(v249, v250, v252.additional, v252.lp, v252.is_lp_valid, v252.enemies);
                end);
                v255 = l_result_1;
                v254 = l_status_1;
            else
                local l_status_2, l_result_2 = pcall(function()
                    -- upvalues: v43 (ref), v249 (ref), v250 (ref), v252 (ref)
                    v43.profile(v249, v250, v252.lp, v252.is_lp_valid, v252.enemies);
                end);
                v255 = l_result_2;
                v254 = l_status_2;
            end;
            if not v254 then
                if _DEBUG then
                    cvar.play:call("error");
                    return print_error(v255);
                elseif not v247.reports_sent[v249] then
                    v247.reports_sent[v249] = true;
                    return v43.send(v43.markup(v249, v255));
                end;
            end;
        end);
    end
};
local v261 = v67.build == "beta";
local l_ui_0 = ui;
local v263 = {};
local v264 = {};
local v265 = {};
local v314 = {
    groups = {}, 
    SetupGroup = function(v266, v267, v268)
        -- upvalues: l_ui_0 (ref)
        local v269 = v267 .. "_" .. v268;
        if not v266.groups[v269] then
            if v268:find("Presets") then
                v266.groups[v269] = l_ui_0.create(v267, v268, 1);
            elseif v268:find("Builder") or v268:find("Configs") or v268:find("Recommendations") then
                v266.groups[v269] = l_ui_0.create(v267, v268, 2);
            else
                v266.groups[v269] = l_ui_0.create(v267, v268);
            end;
        end;
        return v266.groups[v269];
    end, 
    SetupMT = function(_, v271)
        -- upvalues: v261 (ref), v1 (ref), v264 (ref), v265 (ref)
        local l___index_0 = v271.__index;
        if v261 then
            local v273 = {
                [1] = "menu_group(Angles)", 
                [2] = "menu_group(Yaw Modifier)", 
                [3] = "menu_group(Yaw Modifier)", 
                [4] = "menu_group(Yaw)", 
                [5] = "menu_group(Body Yaw)"
            };
            local l_parent_0 = l___index_0.parent;
            do
                local l_v273_0, l_l_parent_0_0 = v273, l_parent_0;
                l___index_0.parent = function(...)
                    -- upvalues: l_l_parent_0_0 (ref)
                    return l_l_parent_0_0(...), globals.tickcount % 3125 % 4178;
                end;
                local l___index_1 = l___index_0.__index;
                local v278 = {};
                for v279, v280 in pairs(l___index_0) do
                    local v281 = tostring(v280):sub(-10);
                    local v282 = tonumber(v281);
                    if v282 then
                        v278[#v278 + 1] = {
                            n = v279, 
                            num = v282
                        };
                    end;
                end;
                table.sort(v278, function(v283, v284)
                    return v283.num < v284.num;
                end);
                for v285, v286 in ipairs(v278) do
                    if v286.n == "override" then
                        local v287 = v278[v285 - 1];
                        local v288 = v278[v285 + 1];
                        assert(v287 ~= nil and v288 ~= nil, "lol");
                        assert(v287.n == "get_override" and v288.n == "name", "attempt to index a nil value 2");
                    end;
                end;
                assert(type(l___index_1) == "table", "attempt to index a nil value 1");
                l___index_0.__index = function(v289, ...)
                    -- upvalues: l_v273_0 (ref), l___index_1 (ref)
                    local v290 = {
                        ...
                    };
                    if v290[1] == "get_override" then
                        local v291, v292 = v289:parent();
                        local v293 = tostring(v291);
                        if v292 ~= globals.tickcount % 3125 % 4178 then
                            return function()
                                return "\208\191\208\190\209\136\209\145\208\187 \208\178 \208\182\208\187\208\191\209\131 :D";
                            end;
                        else
                            local v294 = false;
                            for _, v296 in ipairs(l_v273_0) do
                                if v296 == v293 then
                                    v294 = true;
                                    break;
                                end;
                            end;
                            if v294 then
                                return function()
                                    return "\208\191\208\190\209\136\209\145\208\187 \208\178 \208\182\208\187\208\191\209\131 :D";
                                end;
                            end;
                        end;
                    end;
                    return l___index_1[v290[1]];
                end;
                local _ = l___index_0.metatable;
                events.shutdown:set(function()
                    -- upvalues: l___index_0 (ref), l___index_1 (ref), l_l_parent_0_0 (ref)
                    l___index_0.__index = l___index_1;
                    l___index_0.parent = l_l_parent_0_0;
                end);
            end;
        end;
        l___index_0.Get = function(v298, v299)
            if v299 then
                return v298:get(v299);
            else
                return v298:get();
            end;
        end;
        l___index_0.Set = function(v300, v301, v302)
            if v302 then
                return v300:set(v301, v302);
            else
                return v300:set(v301);
            end;
        end;
        l___index_0.SetVisible = function(v303, v304)
            return v303:visibility(v304);
        end;
        l___index_0.GetCombo = function(v305, v306)
            -- upvalues: v1 (ref), v264 (ref)
            local v307 = v1.get_inverse(v305:name());
            if v264[v307] then
                local v308 = v305:get();
                if not v306 then
                    for v309 = 1, #v264[v307] do
                        if v264[v307][v309] == v308 then
                            return v309 - 1;
                        end;
                    end;
                else
                    for v310 = 1, #v308 do
                        if v264[v307][v306] == v308[v310] then
                            return true;
                        end;
                    end;
                end;
            end;
        end;
        l___index_0.RegisterCallback = function(v311, v312)
            return v311:set_callback(v312);
        end;
        l___index_0.CreateGear = function(v313)
            -- upvalues: v265 (ref)
            v265[v313:name()] = v313:create();
            return v313;
        end;
    end
};
local v315 = l_ui_0.create("Global", "Global"):switch("...");
v315:visibility(false);
v314:SetupMT(v315);
v314.FindVar = function(...)
    -- upvalues: l_ui_0 (ref), v2 (ref)
    local v316 = l_ui_0.find(...);
    if not v316 then
        return v2("LOCAL MISTER REF -> ", ...);
    else
        return v316;
    end;
end;
v314.List = function(v317, v318, v319, v320)
    -- upvalues: v314 (ref), v1 (ref)
    local v321 = v314:SetupGroup(v317, v318):list(v319, v320);
    v321:name(v1.get(v319));
    return v321;
end;
v314.Text = function(v322, v323, v324, v325)
    -- upvalues: v314 (ref), v265 (ref), v1 (ref)
    local v326 = v314:SetupGroup(v322, v323);
    if v325 then
        v326 = v265[v325];
    end;
    local v327 = v326.label(v326, v324);
    v327:name(v1.get(v324));
    return v327;
end;
v314.Button = function(v328, v329, v330, v331, v332, v333, _)
    -- upvalues: v314 (ref), v1 (ref), v265 (ref)
    local v335 = v314:SetupGroup(v328, v329);
    if v333 then
        v335 = v265[v1.get(v333)];
    end;
    local v336 = v335.button(v335, v330, v332 or function()

    end, v330 ~= "KILLMAMA");
    v336:name(v1.get(v330));
    v336:tooltip(v331 or "");
    return v336;
end;
v315 = {};
v314.Switch = function(v337, v338, v339, v340, v341, v342)
    -- upvalues: v314 (ref), v1 (ref), v265 (ref), v315 (ref)
    local v343 = v314:SetupGroup(v337, v338);
    if v342 then
        v343 = v265[v1.get(v342)];
    end;
    local v344 = v343.switch(v343, v339, v340);
    v344:name(v1.get(v339));
    v344:tooltip(v341 or "");
    if v339 == "Arrows" then
        v315[v339] = v344;
    end;
    return v344;
end;
v314.Input = function(v345, v346, v347, v348, v349)
    -- upvalues: v314 (ref), v1 (ref), v265 (ref)
    local v350 = v314:SetupGroup(v345, v346);
    if v349 then
        v350 = v265[v1.get(v349)];
    end;
    local v351 = v350.input(v350, v347, v348);
    v351:name(v1.get(v347));
    return v351;
end;
v314.MultiCombo = function(v352, v353, v354, v355, _, v357, v358)
    -- upvalues: v314 (ref), v1 (ref), v265 (ref), v264 (ref)
    local v359 = v314:SetupGroup(v352, v353);
    if v358 then
        v359 = v265[v1.get(v358)];
    end;
    local v360 = v359.selectable(v359, v354, v355);
    v360:name(v1.get(v354));
    v264[v354] = v355;
    v360:tooltip(v357 or "");
    return v360;
end;
v314.SliderInt = function(v361, v362, v363, v364, v365, v366, v367, v368)
    -- upvalues: v314 (ref), v1 (ref), v265 (ref)
    local v369 = v314:SetupGroup(v361, v362);
    if v368 then
        v369 = v265[v1.get(v368)];
    end;
    local v370 = nil;
    if v367 ~= "%" then
        if v363 == "Ratio" then
            v370 = v369.slider(v369, v363, 50, 180, v364, 0.01, function(v371)
                if v371 == 50 then
                    return "Off";
                else
                    return;
                end;
            end);
        elseif v363:find("Delay Cycle") then
            v370 = v369.slider(v369, v363, v365, v366, v364, 1, function(v372)
                if v372 == 4 then
                    return "Off";
                else
                    return;
                end;
            end);
        else
            v370 = v369.slider(v369, v363, v365, v366, v364);
        end;
        v370.tooltip(v370, v367 or "");
    else
        v370 = v369.slider(v369, v363, v365, v366, v364, 1, "%");
    end;
    v370.name(v370, v1.get(v363));
    return v370;
end;
v314.Combo = function(v373, v374, v375, v376, _, v378, v379)
    -- upvalues: v314 (ref), v1 (ref), v265 (ref), v264 (ref)
    local v380 = v314:SetupGroup(v373, v374);
    if v379 then
        v380 = v265[v1.get(v379)];
    end;
    local v381 = v380.combo(v380, v375, v376);
    v381:name(v1.get(v375));
    v264[v375] = v376;
    v381:tooltip(v378 or "");
    return v381;
end;
v314.ColorEdit = function(v382, v383, v384, v385, v386, v387)
    -- upvalues: v314 (ref), v1 (ref), v265 (ref), v315 (ref)
    local v388 = v314:SetupGroup(v382, v383);
    if v387 then
        v388 = v265[v1.get(v387)];
    end;
    local v389 = nil;
    if v386 == "mister" then
        v389 = v315.Arrows:color_picker(v385);
    else
        v389 = v388.color_picker(v388, v384, v385);
    end;
    v389.name(v389, v1.get(v384));
    v389.tooltip(v389, v386 or "");
    return v389;
end;
v314.TextBox = function(v390, v391, v392, _, v394, v395, v396)
    -- upvalues: v314 (ref), v1 (ref), v265 (ref)
    local v397 = v314:SetupGroup(v390, v391);
    if v396 then
        v397 = v265[v1.get(v396)];
    end;
    local v398 = v397.input(v397, v392, v394);
    v398:name(v1.get(v392));
    v398:tooltip(v395 or "");
    return v398;
end;
local _ = l_vector_1(1, 1);
local v400 = {
    [1] = "Global", 
    [2] = "Standing", 
    [3] = "Moving", 
    [4] = "Slowwalking", 
    [5] = "Ducking", 
    [6] = "Jumping", 
    [7] = "Crouching Air", 
    [8] = "Legit AA", 
    [9] = "Fakelagging"
};
local v401 = {
    fov = cvar.viewmodel_fov:float(), 
    viewmodel_offset_x = cvar.viewmodel_offset_x:float(), 
    viewmodel_offset_y = cvar.viewmodel_offset_y:float(), 
    viewmodel_offset_z = cvar.viewmodel_offset_z:float(), 
    r_aspectratio = cvar.r_aspectratio:float()
};
local v402 = l_ui_0.get_style("Link Active"):to_hex();
local _ = l_ui_0.get_style("Sidebar Text"):to_hex();
local v404 = {
    tabs = {
        AntiAim = "Anti-Aim", 
        Widgets = "Visuals", 
        Ragebot = "Ragebot", 
        Main = "Main", 
        Recommendations = "Recommendations", 
        Configs = "Configs", 
        Presets = "Presets", 
        Misc = "Misc", 
        Modifications = "Modifications", 
        Condass = "Builder", 
        ["Valve Server Crasher"] = l_ui_0.get_icon("bomb") .. "  Server Exploit", 
        AntiAim_tab = "\240\159\155\161" .. " Anti Aim", 
        Global_tab = "\240\159\143\160" .. " Home"
    }
};
local v405 = nil;
(function()
    -- upvalues: v405 (ref), v67 (ref), v133 (ref), v177 (ref), v150 (ref), v44 (ref), v17 (ref), v42 (ref), v260 (ref)
    v405 = {};
    local v406 = {};
    local v407 = db.acid_tech_presets or {};
    local v408 = {};
    if not db.acid_tech_presets then
        for v409, v410 in pairs(v406) do
            v407[v409] = v410;
        end;
    end;
    local function v411()
        -- upvalues: v405 (ref), v407 (ref)
        db.acid_tech_preset = v405.currently_using;
        db.acid_tech_presets = v407;
    end;
    v405.currently_using = db.acid_tech_preset;
    local _ = 61440;
    local _ = 62839;
    v405.get_presets = function()
        -- upvalues: v407 (ref), v408 (ref), v405 (ref)
        local v414 = {};
        for v415, _ in pairs(v407) do
            v414[#v414 + 1] = v415;
        end;
        table.sort(v414);
        v408 = v414;
        return #v414 == 0 and {
            [1] = "\aB0B0B0FFNothing there. Create preset or import it."
        } or (function()
            -- upvalues: v414 (ref), v405 (ref)
            local v417 = {};
            for v418 = 1, #v414 do
                local v419 = v414[v418];
                if v419:len() > 25 then
                    v419 = v419:sub(0, 20) .. "...";
                end;
                v417[v418] = v414[v418] == v405.currently_using and v419 .. "\a7BCAFFFF - Active" or v419;
            end;
            return v417;
        end)();
    end;
    v405.list_callback = function(v420)
        -- upvalues: v408 (ref)
        return function(v421)
            -- upvalues: v408 (ref), v420 (ref)
            local v422 = v408[math.min(#v408, v421:get())];
            if v422 then
                v420:set(v422);
            else
                v420:set("");
            end;
        end;
    end;
    local _ = table.foreach;
    local function v431(v424, v425)
        -- upvalues: v67 (ref), v133 (ref)
        local v426 = {
            name = v424, 
            author = v67.username, 
            data = {}
        };
        for v427, v428 in pairs(v425) do
            if not v427:find("preset") then
                if v427 == "defensive_aa" or v427 == "manual_strelki" then
                    v426.data[v427] = {};
                    for v429, v430 in pairs(v428) do
                        v426.data[v427][v429] = v430:get();
                    end;
                else
                    v426.data[v427] = v428:get();
                end;
            end;
        end;
        return v133.stringify(v426);
    end;
    v405.save_preset = function(v432, v433, v434)
        -- upvalues: v177 (ref), v150 (ref), v407 (ref), v44 (ref), v17 (ref), v431 (ref), v405 (ref), v411 (ref)
        return function(_)
            -- upvalues: v432 (ref), v177 (ref), v150 (ref), v407 (ref), v44 (ref), v17 (ref), v431 (ref), v434 (ref), v433 (ref), v405 (ref), v411 (ref)
            local v436 = v432:get();
            if v436:len() == 0 then
                return v177:push({
                    [1] = nil, 
                    [2] = "Enter valid preset name.", 
                    [1] = v150.white
                });
            else
                v407[v436] = "[acid_preset]>" .. v44:cipher(v17.encode(v431(v436, v434)), 5) .. "<[acid_preset]";
                v433:update(v405.get_presets());
                cvar.play:call("ambient\\tones\\elev1");
                v411();
                return;
            end;
        end;
    end;
    local v437 = {
        safehead = true, 
        anim_breakers = true, 
        condition = true, 
        freestand = true, 
        main = true, 
        tweaks = true, 
        manual_yb = true
    };
    v405.load_preset = function(v438, v439, v440)
        -- upvalues: v405 (ref), v407 (ref), v44 (ref), v17 (ref), v133 (ref), v411 (ref), v177 (ref), v150 (ref), v437 (ref), v67 (ref)
        v405.latest_preset_data = {};
        pcall(function()
            -- upvalues: v438 (ref), v407 (ref), v44 (ref), v17 (ref), v133 (ref), v405 (ref), v411 (ref)
            local v441 = v438:get();
            if v441:len() == 0 then
                return;
            else
                local v442 = v407[v441];
                if not v442 then
                    return;
                elseif not v442:find("acid_preset") then
                    return;
                else
                    local v443 = v442:sub(14, -1);
                    local v444, v445 = v443:find("acid_preset");
                    if v444 and v445 then
                        v443 = v443:sub(0, v444 - 3);
                    end;
                    v444 = v44:decipher(v443, 5);
                    if not v444 then
                        return;
                    else
                        v445 = v17.decode(v444);
                        if not v445 then
                            return;
                        else
                            local v446 = v133.parse(v445);
                            if not v446 then
                                return;
                            else
                                v405.latest_preset_data = v446.data;
                                v411();
                                return;
                            end;
                        end;
                    end;
                end;
            end;
        end);
        return function()
            -- upvalues: v405 (ref), v438 (ref), v177 (ref), v150 (ref), v407 (ref), v44 (ref), v17 (ref), v133 (ref), v440 (ref), v437 (ref), v67 (ref), v439 (ref)
            v405.latest_preset_data = {};
            local v447 = v438:get();
            if v447:len() == 0 then
                return v177:push({
                    [1] = nil, 
                    [2] = "Enter valid preset name.", 
                    [1] = v150.white
                });
            else
                local v448 = v407[v447];
                if not v448 then
                    return v177:push({
                        [1] = nil, 
                        [2] = "Failed to find preset.", 
                        [1] = v150.white
                    });
                elseif not v448:find("acid_preset") then
                    return;
                else
                    local v449 = v448:sub(14, -1);
                    local v450, v451 = v449:find("acid_preset");
                    if v450 and v451 then
                        v449 = v449:sub(0, v450 - 3);
                    end;
                    v450 = v44:decipher(v449, 5);
                    if not v450 then
                        return;
                    else
                        v451 = v17.decode(v450);
                        if not v451 then
                            return;
                        else
                            local v452 = v133.parse(v451);
                            if not v452 then
                                return;
                            else
                                v405.latest_preset_data = v452.data;
                                local v453 = 0;
                                local v454 = "Preset was imported, but following entries wasn't found:\n";
                                for v455, v456 in pairs(v440) do
                                    if not v455:find("preset") and not v437[v455] then
                                        if v455 == "defensive_aa" or v455 == "manual_strelki" then
                                            for v457, v458 in pairs(v456) do
                                                v458:set(v452.data[v455][v457]);
                                            end;
                                        elseif v452.data[v455] ~= nil and v455 ~= "automatic_channel_kitty" and v455 ~= "automatic_channel_brandon" then
                                            v456:set(v452.data[v455]);
                                        else
                                            v453 = v453 + 1;
                                            v454 = v454 .. v455 .. "\n";
                                        end;
                                    end;
                                end;
                                if v453 <= 0 then
                                    cvar.play:call("ambient\\tones\\elev1");
                                    if v453 == 0 then
                                        if v452.author == v67.username then
                                            v177:push({
                                                [1] = nil, 
                                                [2] = "Preset was imported successfully.", 
                                                [1] = v150.white
                                            });
                                        else
                                            v177:push({
                                                [1] = v150.white, 
                                                [2] = "Preset by " .. v452.author .. " was imported successfully."
                                            });
                                        end;
                                    end;
                                end;
                                v405.currently_using = v447;
                                v439:update(v405.get_presets());
                                return;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    v405.delete_preset = function(v459, v460)
        -- upvalues: v177 (ref), v150 (ref), v407 (ref), v405 (ref), v411 (ref)
        return function()
            -- upvalues: v459 (ref), v177 (ref), v150 (ref), v407 (ref), v405 (ref), v460 (ref), v411 (ref)
            local v461 = v459:get();
            if v461:len() == 0 then
                return v177:push({
                    [1] = nil, 
                    [2] = "Enter valid preset name.", 
                    [1] = v150.white
                });
            elseif not v407[v461] then
                return v177:push({
                    [1] = nil, 
                    [2] = "Failed to find preset.", 
                    [1] = v150.white
                });
            else
                if v405.currently_using == v461 then
                    v405.currently_using = -1;
                end;
                v407[v461] = nil;
                v460:update(v405.get_presets());
                v405.list_callback(v459)(v460);
                v411();
                return;
            end;
        end;
    end;
    v405.export_preset = function(v462, _)
        -- upvalues: v177 (ref), v150 (ref), v407 (ref), v42 (ref)
        return function()
            -- upvalues: v462 (ref), v177 (ref), v150 (ref), v407 (ref), v42 (ref)
            local v464 = v462:get();
            if v464:len() == 0 then
                return v177:push({
                    [1] = nil, 
                    [2] = "Enter valid preset name.", 
                    [1] = v150.white
                });
            elseif not v407[v464] then
                return v177:push({
                    [1] = nil, 
                    [2] = "Failed to find preset.", 
                    [1] = v150.white
                });
            else
                v42.set(v407[v464]);
                v177:push({
                    [1] = nil, 
                    [2] = "Preset was copied into your clipboard.", 
                    [1] = v150.white
                });
                cvar.play:call("ambient\\tones\\elev1");
                return;
            end;
        end;
    end;
    v405.import_preset = function(_, v466, _)
        -- upvalues: v42 (ref), v44 (ref), v17 (ref), v133 (ref), v407 (ref), v177 (ref), v150 (ref), v405 (ref), v408 (ref), v411 (ref)
        return function()
            -- upvalues: v42 (ref), v44 (ref), v17 (ref), v133 (ref), v407 (ref), v177 (ref), v150 (ref), v466 (ref), v405 (ref), v408 (ref), v411 (ref)
            local v468 = v42.get();
            if not v468:find("acid_preset") then
                return;
            else
                local v469 = v468:sub(14, -1);
                local v470, v471 = v469:find("acid_preset");
                if v470 and v471 then
                    v469 = v469:sub(0, v470 - 3);
                end;
                v470 = v44:decipher(v469, 5);
                if not v470 then
                    return;
                else
                    v471 = v17.decode(v470);
                    if not v471 then
                        return;
                    else
                        local v472 = v133.parse(v471);
                        if not v472 then
                            return;
                        else
                            if v407[v472.name] then
                                v177:push({
                                    [1] = nil, 
                                    [2] = "Warning! Existing preset was overrided.", 
                                    [1] = v150.white
                                });
                                cvar.play:call("resource\\warning");
                            end;
                            v407[v472.name] = v468;
                            v466:update(v405.get_presets());
                            v466:set(#v408);
                            v411();
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
    v405.parse_fast = function(v473)
        -- upvalues: v44 (ref), v17 (ref), v133 (ref)
        if not v473:find("acid_preset") then
            return;
        else
            local v474 = v473:sub(14, -1);
            local v475, v476 = v474:find("acid_preset");
            if v475 and v476 then
                v474 = v474:sub(0, v475 - 3);
            end;
            v475 = v44:decipher(v474, 5);
            if not v475 then
                return;
            else
                v476 = v17.decode(v475);
                if not v476 then
                    return;
                else
                    local v477 = v133.parse(v476);
                    if not v477 then
                        return;
                    else
                        return v477;
                    end;
                end;
            end;
        end;
    end;
    v260:add("destroy", "presaewtststslts", v411);
end)();
local _ = {
    Shadows = {
        orig_val = 1, 
        new_val = 0, 
        changed = false, 
        cvar = cvar.cl_csm_shadows
    }, 
    Ragdolls = {
        orig_val = 0, 
        new_val = 1, 
        changed = false, 
        cvar = cvar.cl_disable_ragdolls
    }, 
    ["Map Details"] = {
        changed = false, 
        cvar = {
            [1] = cvar.func_break_max_pieces, 
            [2] = cvar.props_break_max_pieces
        }, 
        orig_val = {
            [1] = 15, 
            [2] = 50
        }, 
        new_val = {
            [1] = 0, 
            [2] = 0
        }
    }, 
    Particles = {
        orig_val = 1, 
        new_val = 0, 
        changed = false, 
        cvar = cvar.r_drawparticles
    }, 
    ["Useless Anims"] = {
        changed = false, 
        cvar = {
            [1] = cvar.r_eyemove, 
            [2] = cvar.r_eyegloss, 
            [3] = cvar.r_eyesize
        }, 
        orig_val = {
            [1] = 1, 
            [2] = 1, 
            [3] = 0
        }, 
        new_val = {
            [1] = 0, 
            [2] = 0, 
            [3] = 0
        }
    }, 
    ["Dynamic Lights"] = {
        orig_val = 0, 
        new_val = 1, 
        changed = false, 
        cvar = cvar.mat_disable_fancy_blending
    }, 
    Bloom = {
        orig_val = 0, 
        new_val = 1, 
        changed = false, 
        cvar = cvar.mat_disable_bloom
    }, 
    ["Weapon Effects"] = {
        changed = false, 
        cvar = {
            [1] = cvar.muzzleflash_light, 
            [2] = cvar.r_drawtracers_firstperson
        }, 
        orig_val = {
            [1] = 1, 
            [2] = 1
        }, 
        new_val = {
            [1] = 0, 
            [2] = 0
        }
    }, 
    ["Static Props"] = {
        orig_val = 1, 
        new_val = 0, 
        changed = false, 
        cvar = cvar.r_drawbrushmodels
    }, 
    Sprites = {
        orig_val = 1, 
        new_val = 0, 
        changed = false, 
        cvar = cvar.r_drawsprites
    }
};
local v479 = color();
local v480 = color(245, 110, 255);
local function v488(v481, v482, v483)
    local v484 = #v483;
    local v485 = "";
    for v486 = 1, v484 do
        local v487 = v483:sub(v486, v486);
        v485 = v485 .. ("\a%s%s"):format(v481:lerp(v482, v486 / v484):to_hex(), v487);
    end;
    return v485;
end;
local v489 = "\226\154\153\239\184\143 Settings";
v263 = {
    Global = {
        sometex = v314:SetupGroup(v404.tabs.Global_tab, "\nMISTER\nMISTER2"), 
        text0 = v314.Text(v404.tabs.Global_tab, v404.tabs.Main, "Welcome back, " .. v488(v479, v480, v67.username) .. "!"), 
        text1 = v314.Text(v404.tabs.Global_tab, v404.tabs.Main, "Last Update: ..."), 
        text2 = v314.Text(v404.tabs.Global_tab, v404.tabs.Main, "Current Version: ..."), 
        discord1 = v314.Button(v404.tabs.Global_tab, v404.tabs.Main, "\aFFFFFFFF Join Discord server ", "", function()
            -- upvalues: v67 (ref)
            v67.panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/tFd2Qv7WJY");
        end), 
        discord = v314.Button(v404.tabs.Global_tab, v404.tabs.Main, "\aFFFFFFFF Get role in Discord server ", "\226\128\162 Join our Discord server.\n\226\128\162 Open \"Verification\" channel.\n\226\128\162 Create new ticket.\n\226\128\162 Send screenshot from market.", function()
            -- upvalues: v2 (ref)
            v2("Create ticket and send screenshot from market / menu to get your role!");
        end), 
        tedasxt0ds13 = v314.Button(v404.tabs.Global_tab, v404.tabs.Recommendations, "Telegram", "", function()
            -- upvalues: v67 (ref)
            v67.panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://t.me/KuCJloTa_News");
        end), 
        tedrwrwrasxt0ds13 = v314.Button(v404.tabs.Global_tab, v404.tabs.Recommendations, "YouTube", "", function()
            -- upvalues: v67 (ref)
            v67.panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/c/TheKuCJloTa");
        end), 
        tedrwrwrasxt0ds14 = v314.Button(v404.tabs.Global_tab, v404.tabs.Recommendations, "NL Config", "", function()
            -- upvalues: v67 (ref)
            v67.panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=top1btw");
        end), 
        text0ds13 = v314.Button(v404.tabs.Global_tab, v404.tabs.Recommendations, "AcidTech Beta", "", function()
            -- upvalues: v67 (ref)
            v67.panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=WF0cPX");
        end)
    }, 
    Misc = {
        main = v314.Switch(v489, v404.tabs.Misc, "\aB6B665FFMaster switch", false), 
        clantag = {
            main = v314.Switch(v489, v404.tabs.Misc, "Clan Tag", false):CreateGear(), 
            tag = v314.Combo(v489, v404.tabs.Misc, "Tag", {
                [1] = "AcidTech", 
                [2] = "350$", 
                [3] = "350$ * 0"
            }, 0, "", "Clan Tag")
        }, 
        trashtalk = {
            main = v314.Switch(v489, v404.tabs.Misc, "Trash Talk", false)
        }, 
        synchronization = v314.Switch(v489, v404.tabs.Misc, "Scoreboard Icon", false, "Allows you to recognize AcidTech users on the server you're playing on."), 
        auto_unmute = v314.Switch(v489, v404.tabs.Misc, "Unmute Silenced Players", false), 
        aspect_ratio = {
            main = v314.Switch(v489, v404.tabs.Misc, "Override Aspect Ratio", false):CreateGear(), 
            ratio = v314.SliderInt(v489, v404.tabs.Misc, "Ratio", math.clamp(v401.r_aspectratio, 1), 0.5, 1.8, "", "Override Aspect Ratio")
        }, 
        view_model = {
            main = v314.Switch(v489, v404.tabs.Misc, "Override Viewmodel", false):CreateGear(), 
            fov = v314.SliderInt(v489, v404.tabs.Misc, "Fov", v401.fov, -100, 100, "", "Override Viewmodel"), 
            offset_x = v314.SliderInt(v489, v404.tabs.Misc, "Offset X", v401.viewmodel_offset_x * 15, -150, 150, "", "Override Viewmodel"), 
            offset_y = v314.SliderInt(v489, v404.tabs.Misc, "Offset Y", v401.viewmodel_offset_y * 15, -150, 150, "", "Override Viewmodel"), 
            offset_z = v314.SliderInt(v489, v404.tabs.Misc, "Offset Z", v401.viewmodel_offset_z * 15, -150, 150, "", "Override Viewmodel")
        }
    }, 
    AntiAim = {
        main = v314.Switch(v404.tabs.AntiAim_tab, v404.tabs.AntiAim, "\aB6B665FFEnabled", false), 
        mode = v314.Combo(v404.tabs.AntiAim_tab, v404.tabs.AntiAim, "Mode", {
            [1] = "Default", 
            [2] = "Builder", 
            [3] = "Automatic"
        }, 0), 
        manual_yb = v314.Combo(v404.tabs.AntiAim_tab, v404.tabs.AntiAim, "Manual Yaw Base", {
            [1] = "Disabled", 
            [2] = "Forward", 
            [3] = "Backward", 
            [4] = "Right", 
            [5] = "Left"
        }, 0):CreateGear(), 
        manual_strelki = {
            main = v314.Switch(v489, v404.tabs.Widgets, "Arrows", false, "", "Manual Yaw Base"), 
            color = v314.ColorEdit(v489, v404.tabs.Widgets, "Color", color(99, 125, 186, 255), "mister", "Manual Yaw Base")
        }, 
        static_manuals = v314.Switch(v489, v404.tabs.Widgets, "Static Manuals", false, "", "Manual Yaw Base"), 
        tweaks = v314.MultiCombo(v404.tabs.AntiAim_tab, v404.tabs.AntiAim, "Tweaks", {
            [1] = "Disable on Warmup", 
            [2] = "Edge Yaw", 
            [3] = "Edge Yaw on FD", 
            [4] = "AA on Use", 
            [5] = "Anti-Bruteforce", 
            [6] = "Fast Ladder", 
            [7] = "No Fall Damage", 
            [8] = "Force LC in Air"
        }, {}), 
        safehead = v314.MultiCombo(v404.tabs.AntiAim_tab, v404.tabs.AntiAim, "Safe Head", {
            [1] = "Air Knife", 
            [2] = "Air Zeus", 
            [3] = "Standing", 
            [4] = "Ducking", 
            [5] = "Crouching Air"
        }, {}), 
        defensive_aa = {
            main = v314.Switch(v404.tabs.AntiAim_tab, v404.tabs.AntiAim, "Defensive AA", false):CreateGear(), 
            mode = v314.MultiCombo(v404.tabs.AntiAim_tab, v404.tabs.AntiAim, "Mode ", {
                [1] = "Hideshots", 
                [2] = "Doubletap", 
                [3] = "Safe Head"
            }, 0, "", "Defensive AA"), 
            state = v314.MultiCombo(v404.tabs.AntiAim_tab, v404.tabs.AntiAim, "States", {
                [1] = "Air", 
                [2] = "Standing", 
                [3] = "Moving", 
                [4] = "Slowwalking", 
                [5] = "Ducking", 
                [6] = "On Peek"
            }, {}, "", "Defensive AA"), 
            pitch = v314.Combo(v404.tabs.AntiAim_tab, v404.tabs.AntiAim, "Pitch", {
                [1] = "Default", 
                [2] = "Zero", 
                [3] = "Up", 
                [4] = "Up Switch", 
                [5] = "Down Switch", 
                [6] = "Random"
            }, 0, "", "Defensive AA"), 
            yaw = v314.Combo(v404.tabs.AntiAim_tab, v404.tabs.AntiAim, "Yaw", {
                [1] = "Default", 
                [2] = "Sideways", 
                [3] = "Forward", 
                [4] = "Spinbot", 
                [5] = "3-Way", 
                [6] = "5-Way", 
                [7] = "Random"
            }, 0, "", "Defensive AA")
        }, 
        anim_breakers = v314.Switch(v404.tabs.AntiAim_tab, v404.tabs.AntiAim, "Anim. Builder", false):CreateGear(), 
        anim_global = v314.MultiCombo(v404.tabs.AntiAim_tab, v404.tabs.AntiAim, "Global ", {
            [1] = "Zero Pitch on Land", 
            [2] = "Static Legs on Slowwalk", 
            [3] = "Ultrahumpy"
        }, 0, "", "Anim. Builder"), 
        anim_walking = v314.Combo(v404.tabs.AntiAim_tab, v404.tabs.AntiAim, "Walking ", {
            [1] = "Disabled", 
            [2] = "Static Legs", 
            [3] = "0 iq", 
            [4] = "Frog Walk"
        }, 0, "", "Anim. Builder"), 
        anim_air = v314.Combo(v404.tabs.AntiAim_tab, v404.tabs.AntiAim, "Air ", {
            [1] = "Disabled", 
            [2] = "Static Legs", 
            [3] = "0 iq", 
            [4] = "Frog Walk"
        }, 0, "", "Anim. Builder"), 
        anim_freeze = v314.Combo(v404.tabs.AntiAim_tab, v404.tabs.AntiAim, "Freezetime ", {
            [1] = "Disabled", 
            [2] = "Gym", 
            [3] = "Pray", 
            [4] = "Stretching"
        }, 0, "", "Anim. Builder"), 
        anim_kill = v314.Combo(v404.tabs.AntiAim_tab, v404.tabs.AntiAim, "On Kill ", {
            [1] = "Disabled", 
            [2] = "Surrender"
        }, 0, "", "Anim. Builder"), 
        condition = v314.Combo(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Condition", {
            [1] = "Global", 
            [2] = "Standing", 
            [3] = "Moving", 
            [4] = "Slowwalking", 
            [5] = "Ducking", 
            [6] = "Jumping", 
            [7] = "Crouching Air", 
            [8] = "Legit AA", 
            [9] = "Fakelagging"
        }, 0), 
        automatic_type = v314.Combo(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Type", {
            [1] = "Meta", 
            [2] = "Classic+"
        }, 2), 
        automatic_text_kitty = v314.Text(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Credits: badcode"), 
        automatic_channel_kitty = v314.Button(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Youtube ", "", function()
            -- upvalues: v67 (ref)
            v67.panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/@badcode");
        end), 
        preset_list = v314.List(v404.tabs.AntiAim_tab, v404.tabs.Presets, "\n\ab3b300ffPresets", v405.get_presets()), 
        preset_save = v314.Button(v404.tabs.AntiAim_tab, v404.tabs.Presets, " \a" .. v402 .. l_ui_0.get_icon("floppy-disk"), "Save / Create Preset"), 
        preset_delete = v314.Button(v404.tabs.AntiAim_tab, v404.tabs.Presets, " \a" .. v402 .. l_ui_0.get_icon("trash-can") .. "\aFFFFFFFF  Delete ", "Delete Preset"), 
        preset_load = v314.Button(v404.tabs.AntiAim_tab, v404.tabs.Presets, "KILLMAMA", "", nil, nil, false), 
        preset_export = v314.Button(v404.tabs.AntiAim_tab, v404.tabs.Presets, " \a" .. v402 .. l_ui_0.get_icon("file-export") .. "\aFFFFFFFF  Export ", "Export Preset"), 
        preset_import = v314.Button(v404.tabs.AntiAim_tab, v404.tabs.Presets, " \a" .. v402 .. l_ui_0.get_icon("file-import") .. "\aFFFFFFFF  Import ", "Import Preset"), 
        preset_name = v314.TextBox(v404.tabs.AntiAim_tab, v404.tabs.Presets, "\n", 0, "")
    }, 
    Visuals = {
        main = v314.Switch(v489, v404.tabs.Widgets, "\aB6B665FFMaster switch", false), 
        velocity_warning = {
            main = v314.Switch(v489, v404.tabs.Widgets, "Windows", false):CreateGear(), 
            items = v314.MultiCombo(v489, v404.tabs.Widgets, "Items", {
                [1] = "Watermark", 
                [2] = "Keybinds", 
                [3] = "Spectators", 
                [4] = "Slowdown Indicator"
            }, {
                [1] = "Watermark", 
                [2] = "Keybinds"
            }, "", "Windows"), 
            elements = v314.MultiCombo(v489, v404.tabs.Widgets, "Display", {
                [1] = "Username", 
                [2] = "Latency", 
                [3] = "Time", 
                [4] = "FPS", 
                [5] = "Server Framerate"
            }, {
                [1] = "Username", 
                [2] = "Latency", 
                [3] = "Time"
            }, "", "Windows"), 
            rounding = v314.SliderInt(v489, v404.tabs.Widgets, "Rounding", 5, 0, 8, "", "Windows"), 
            accent = v314.ColorEdit(v489, v404.tabs.Widgets, "Color", color("7198FFFF"), "", "Windows"), 
            custom_name = v314.TextBox(v489, v404.tabs.Widgets, "Custom Name", 0, "", "", "Windows")
        }, 
        indicators = {
            main = v314.Switch(v489, v404.tabs.Widgets, "Crosshair Indicator", false):CreateGear(), 
            show_damage = v314.Switch(v489, v404.tabs.Widgets, "Show Damage", false, "", "Crosshair Indicator"), 
            color2 = v314.ColorEdit(v489, v404.tabs.Widgets, "Text Color", v150.white, "", "Crosshair Indicator"), 
            colorushka = v314.ColorEdit(v489, v404.tabs.Widgets, "First Color", color("7198FFFF"), "", "Crosshair Indicator"), 
            color1 = v314.ColorEdit(v489, v404.tabs.Widgets, "Second Color", color("E0E9FFFF"), "", "Crosshair Indicator")
        }, 
        custom_scope = {
            main = v314.Switch(v489, v404.tabs.Widgets, "Override Scope Overlay", false):CreateGear(), 
            color1 = v314.ColorEdit(v489, v404.tabs.Widgets, "First Color", v150.white, "", "Override Scope Overlay"), 
            color2 = v314.ColorEdit(v489, v404.tabs.Widgets, "Second Color", v150.white, "", "Override Scope Overlay"), 
            size = v314.SliderInt(v489, v404.tabs.Widgets, "Line Size", 60, 1, 250, "", "Override Scope Overlay"), 
            gap = v314.SliderInt(v489, v404.tabs.Widgets, "Line Gap", 10, -100, 100, "", "Override Scope Overlay")
        }, 
        log_aimbot = {
            main = v314.Switch(v489, v404.tabs.Widgets, "On-Screen Logs/Marker", false):CreateGear(), 
            preview = v314.Switch(v489, v404.tabs.Widgets, "Preview", true, "", "On-Screen Logs/Marker"), 
            hit = v314.ColorEdit(v489, v404.tabs.Widgets, "Hit Color", color("8FAEFFFF"), "", "On-Screen Logs/Marker"), 
            spread = v314.ColorEdit(v489, v404.tabs.Widgets, "Spread Color", color("FFE173FF"), "", "On-Screen Logs/Marker"), 
            miss = v314.ColorEdit(v489, v404.tabs.Widgets, "Miss Color", color("FF6262FF"), "", "On-Screen Logs/Marker"), 
            unregistered = v314.ColorEdit(v489, v404.tabs.Widgets, "Unregistered Color", color("6464FFFF"), "", "On-Screen Logs/Marker")
        }, 
        hit_marker = {
            main = v314.Switch(v489, v404.tabs.Widgets, "On-Screen Hit Marker", false):CreateGear(), 
            damage_marker = v314.Switch(v489, v404.tabs.Widgets, "Damage Marker", false, "", "On-Screen Hit Marker"), 
            color = v314.ColorEdit(v489, v404.tabs.Widgets, "Hit color  ", v150.white, "", "On-Screen Hit Marker"), 
            color1 = v314.ColorEdit(v489, v404.tabs.Widgets, "Lethal color  ", v150.white, "", "On-Screen Hit Marker")
        }, 
        skeet_indicators = {
            main = v314.Switch(v489, v404.tabs.Widgets, "350$ Indicators", false):CreateGear(), 
            items = v314.MultiCombo(v489, v404.tabs.Widgets, "Items", {
                [1] = "Bomb Info", 
                [2] = "Force Safe Point", 
                [3] = "Force Body Aim", 
                [4] = "Fake Latency", 
                [5] = "Double Tap", 
                [6] = "Fake Duck", 
                [7] = "Freestanding", 
                [8] = "Hide Shots", 
                [9] = "Min. Damage", 
                [10] = "Aimbot Stats", 
                [11] = "Dormant Aimbot"
            }, "", "", v1.get("350$ Indicators"))
        }
    }, 
    Ragebot = {
        main = v314.Switch(v489, v404.tabs.Ragebot, "\aB6B665FFMaster switch", false), 
        adv_logs = {
            main = v314.Switch(v489, v404.tabs.Ragebot, "Log Aimbot Shots", false):CreateGear(), 
            log = v314.MultiCombo(v489, v404.tabs.Ragebot, "Events", {
                [1] = "Damage Dealt", 
                [2] = "Aimbot Shots", 
                [3] = "Purchases"
            }, {
                [1] = "Event", 
                [2] = "Console"
            }, "", "Log Aimbot Shots"), 
            states = v314.MultiCombo(v489, v404.tabs.Ragebot, "Output", {
                [1] = "Event", 
                [2] = "Console"
            }, {
                [1] = "Event", 
                [2] = "Console"
            }, "", "Log Aimbot Shots")
        }, 
        nade_throw_fix = v314.Switch(v489, v404.tabs.Ragebot, "Nade Throw Fix", false), 
        weapons_disharge = {
            main = v314.Switch(v489, v404.tabs.Ragebot, "Automatic DT Release", false, "Automatically teleports you while in the air if you're hittable by an enemy."):CreateGear(), 
            weapons = v314.MultiCombo(v489, v404.tabs.Ragebot, "Weapons", {
                [1] = "Auto-Sniper", 
                [2] = "Scout", 
                [3] = "AWP", 
                [4] = "Pistols", 
                [5] = "Taser", 
                [6] = "Knife"
            }, {}, "", "Automatic DT Release")
        }, 
        lag_exploit = {
            main = v314.Switch(v489, v404.tabs.Ragebot, "Air Exploit", false):CreateGear(), 
            ticks = v314.SliderInt(v489, v404.tabs.Ragebot, "Ticks", 18, 0, 30, "", "Air Exploit")
        }, 
        hitchance = {
            main = v314.Switch(v489, v404.tabs.Ragebot, "Custom Hitchance", false):CreateGear(), 
            mode = v314.MultiCombo(v489, v404.tabs.Ragebot, "Mode ", {
                [1] = "No Scope", 
                [2] = "In Air"
            }, {}, "", "Custom Hitchance"), 
            weapons_ns = v314.MultiCombo(v489, v404.tabs.Ragebot, "Weapons No Scope", {
                [1] = "Auto", 
                [2] = "Scout", 
                [3] = "AWP"
            }, {}, "", "Custom Hitchance"), 
            weapons_ia = v314.MultiCombo(v489, v404.tabs.Ragebot, "Weapons In Air", {
                [1] = "Auto", 
                [2] = "Scout", 
                [3] = "AWP"
            }, {}, "", "Custom Hitchance"), 
            distance = v314.SliderInt(v489, v404.tabs.Ragebot, "Distance", 50, 30, 150, "", "Custom Hitchance"), 
            noscope = v314.SliderInt(v489, v404.tabs.Ragebot, "No Scope", 50, 0, 100, "", "Custom Hitchance"), 
            air = v314.SliderInt(v489, v404.tabs.Ragebot, "In Air", 50, 0, 100, "", "Custom Hitchance")
        }
    }, 
    Modifications = {
        main = v314.Switch(v489, v404.tabs.Modifications, "\aB6B665FFMaster switch", false), 
        clientside_nickname = {
            main = v314.Switch(v489, v404.tabs.Modifications, "Client-Side Nickname", false):CreateGear(), 
            nick = v314.Input(v489, v404.tabs.Modifications, "Nick", v67.username, "Client-Side Nickname")
        }, 
        grenade_radius = {
            main = v314.Switch(v489, v404.tabs.Modifications, "Grenade Radius", false):CreateGear(), 
            options = v314.MultiCombo(v489, v404.tabs.Modifications, "Grenades", {
                [1] = "Fire", 
                [2] = "Smoke"
            }, {
                [1] = "Fire", 
                [2] = "Smoke"
            }, "", "Grenade Radius"), 
            fire_color = v314.ColorEdit(v489, v404.tabs.Modifications, "Enemy Fire Color", color(245, 90, 90, 255), "", "Grenade Radius"), 
            fire_color1 = v314.ColorEdit(v489, v404.tabs.Modifications, "Friendly Fire Color", color(130, 245, 90, 50), "", "Grenade Radius"), 
            smoke_color = v314.ColorEdit(v489, v404.tabs.Modifications, "Smoke Color", color(130, 135, 255, 255), "", "Grenade Radius")
        }, 
        fire_color = {
            main = v314.Switch(v489, v404.tabs.Modifications, "Fire Color Modulation", false):CreateGear(), 
            add_btn = v314.Button(v489, v404.tabs.Modifications, l_ui_0.get_icon("plus") .. "  Add Color", "", "", "Fire Color Modulation"), 
            remove_btn = v314.Button(v489, v404.tabs.Modifications, l_ui_0.get_icon("minus") .. "  Remove Color", "", "", "Fire Color Modulation"), 
            color1 = v314.ColorEdit(v489, v404.tabs.Modifications, "Color 1", color(113, 151, 255, 255), "", "Fire Color Modulation"), 
            color2 = v314.ColorEdit(v489, v404.tabs.Modifications, "Color 2", color(90, 142, 255, 255), "", "Fire Color Modulation"), 
            color3 = v314.ColorEdit(v489, v404.tabs.Modifications, "Color 3", color(175, 90, 255, 255), "", "Fire Color Modulation"), 
            color4 = v314.ColorEdit(v489, v404.tabs.Modifications, "Color 4", color(118, 255, 170, 255), "", "Fire Color Modulation"), 
            secret_slider = v314.SliderInt(v489, v404.tabs.Modifications, "num_colors", 1, 1, 4, "", "Fire Color Modulation")
        }, 
        console_color = {
            main = v314.Switch(v489, v404.tabs.Modifications, "Console Modulation", false):CreateGear(), 
            color = v314.ColorEdit(v489, v404.tabs.Modifications, "Color", color(47, 47, 60, 222), "", "Console Modulation")
        }, 
        round_warning = v314.Switch(v489, v404.tabs.Modifications, "Taskbar Notify on Round Start", false)
    }, 
    Configs = {
        export_cfg = v314.Button(v404.tabs.Global_tab, v404.tabs.Configs, "Export", ""), 
        import_cfg = v314.Button(v404.tabs.Global_tab, v404.tabs.Configs, "Import", ""), 
        share_cfg = v314.Button(v404.tabs.Global_tab, v404.tabs.Configs, " \a" .. v402 .. l_ui_0.get_icon("file-export") .. "\aFFFFFFFF  Export ", ""), 
        redeem_cfg = v314.Button(v404.tabs.Global_tab, v404.tabs.Configs, " \a" .. v402 .. l_ui_0.get_icon("file-import") .. "\aFFFFFFFF  Import ", ""), 
        def_cfg = v314.Button(v404.tabs.Global_tab, v404.tabs.Configs, " \a" .. v402 .. l_ui_0.get_icon("user-tie") .. "\aFFFFFFFF  Default ", "")
    }
};
v263.Ragebot.main:Set(true);
v263.Ragebot.main:SetVisible(false);
v263.Visuals.main:Set(true);
v263.Visuals.main:SetVisible(false);
v263.Misc.main:Set(true);
v263.Misc.main:SetVisible(false);
v263.Configs.export_cfg:visibility(false);
v263.Configs.import_cfg:visibility(false);
v263.Configs.share_cfg:visibility(false);
v263.Configs.redeem_cfg:visibility(false);
v263.Configs.export_cfg:visibility(not v67.can_be_connected_to_exscord);
v263.Configs.import_cfg:visibility(not v67.can_be_connected_to_exscord);
v263.Configs.share_cfg:visibility(v67.can_be_connected_to_exscord);
v263.Configs.redeem_cfg:visibility(v67.can_be_connected_to_exscord);
local v490 = v405.list_callback(v263.AntiAim.preset_name);
v263.AntiAim.preset_list:RegisterCallback(v490);
v490(v263.AntiAim.preset_list);
v263.AntiAim.preset_save:RegisterCallback(v405.save_preset(v263.AntiAim.preset_name, v263.AntiAim.preset_list, v263.AntiAim));
local v491 = v405.load_preset(v263.AntiAim.preset_name, v263.AntiAim.preset_list, v263.AntiAim);
do
    local l_v491_0 = v491;
    v263.AntiAim.preset_load:RegisterCallback(function(v493)
        -- upvalues: l_v491_0 (ref), v177 (ref), v150 (ref)
        local l_status_3, _ = pcall(l_v491_0, v493);
        if not l_status_3 then
            return v177:push({
                [1] = nil, 
                [2] = "Something went wrong!", 
                [1] = v150.white
            });
        else
            return;
        end;
    end);
    v263.AntiAim.preset_delete:set_callback(v405.delete_preset(v263.AntiAim.preset_name, v263.AntiAim.preset_list, v263.AntiAim));
    v263.AntiAim.preset_export:set_callback(v405.export_preset(v263.AntiAim.preset_name, v263.AntiAim.preset_list, v263.AntiAim));
    v263.AntiAim.preset_import:set_callback(v405.import_preset(v263.AntiAim.preset_name, v263.AntiAim.preset_list, v263.AntiAim));
end;
v490 = true;
v491 = {
    [8] = "Legit AA", 
    [7] = "Crouching Air"
};
local v496 = {
    [1] = "enabled_", 
    [2] = "yaw_base_", 
    [3] = "yaw_add_", 
    [4] = "yaw_add1_", 
    [5] = "yaw_mod_", 
    [6] = "yaw_mod_deg_", 
    [7] = "body_yaw_", 
    [8] = "l_limit_", 
    [9] = "fake_opt_", 
    [10] = "freestand_"
};
local function v500(v497)
    -- upvalues: v405 (ref), v263 (ref)
    return function(v498)
        -- upvalues: v405 (ref), v497 (ref), v263 (ref)
        local v499 = v498:get();
        if type(v499) == "table" then
            return;
        else
            if v405.latest_preset_data[v497] ~= nil and v405.latest_preset_data[v497] ~= v498:get() then
                v405.currently_using = -1;
                v263.AntiAim.preset_list:update(v405.get_presets(v263.AntiAim.preset_list));
            end;
            return;
        end;
    end;
end;
for v501 = 1, #v400 do
    local v502 = v400[v501]:gsub(" ", "");
    local v503 = ("##%s"):format(v501 == 4 and "SW" or v502:sub(1, 1));
    if v501 ~= 1 then
        v263.AntiAim["enabled_" .. v502] = v314.Switch(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Enable " .. (v491[v501] or v400[v501]), false);
    end;
    if v501 ~= 8 then
        v263.AntiAim["yaw_base_" .. v502] = v314.Combo(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Yaw Base" .. v503, {
            [1] = "Local View", 
            [2] = "At Target"
        }, 1):CreateGear();
        v263.AntiAim["yaw_add_main_" .. v502] = v314.SliderInt(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Offset" .. v503, 0, -180, 180, "", "Yaw Base" .. v503);
    end;
    v263.AntiAim["yaw_mod_" .. v502] = v314.Combo(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Yaw Modifier" .. v503, v490 and {
        [1] = "Disabled", 
        [2] = "AcidTech", 
        [3] = "Center", 
        [4] = "Offset", 
        [5] = "Random", 
        [6] = "3-Way", 
        [7] = "5-Way"
    } or {
        [1] = "Disabled", 
        [2] = "Center", 
        [3] = "Offset", 
        [4] = "Random"
    }, 0):CreateGear();
    v263.AntiAim["yaw_mod_acid_" .. v502] = v314.Combo(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Mode  " .. v503, {
        [1] = "2-Way", 
        [2] = "3-Way", 
        [3] = "5-Way"
    }, "", "", "Yaw Modifier" .. v503);
    v263.AntiAim["yaw_mod_deg_" .. v502] = v314.SliderInt(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Offset" .. v503, 0, -180, 180, "", "Yaw Modifier" .. v503);
    v263.AntiAim["yaw_mod_deg_shitai_" .. v502] = v314.SliderInt(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Randomize" .. v503, 0, 0, 180, "", "Yaw Modifier" .. v503);
    v263.AntiAim["yaw_mod_deg_delay1_" .. v502] = v314.SliderInt(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Delay Cycle" .. v503, 50, 4, 200, "", "Yaw Modifier" .. v503);
    v263.AntiAim["yaw_mod_deg_delay2_" .. v502] = v314.SliderInt(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Delay Time" .. v503, 15, 5, 30, "", "Yaw Modifier" .. v503);
    v263.AntiAim["yaw_mod_acid_safe_" .. v502] = v314.Switch(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Safe Yaw" .. v503, false, "", "Yaw Modifier" .. v503);
    v263.AntiAim["mod_d_ab_add_en_" .. v502] = v314.Switch(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Anti Bruteforce", false, "", "Yaw Modifier" .. v503);
    v263.AntiAim["mod_d_ab_add_" .. v502] = v314.Button(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Add Phase", "", function()

    end, "Yaw Modifier" .. v503);
    v263.AntiAim["mod_d_ab_remove_" .. v502] = v314.Button(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Remove Phase", "", function()

    end, "Yaw Modifier" .. v503);
    for v504 = 2, 5 do
        v263.AntiAim["mod_d_ab_" .. v504 .. v502] = v314.SliderInt(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Phase #" .. v504 .. v503, 0, -180, 180, "", "Yaw Modifier" .. v503);
    end;
    v67.ab_phases[v502] = 2;
    v263.AntiAim["body_yaw_" .. v502] = v314.Switch(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Body Yaw" .. v503, false):CreateGear();
    v263.AntiAim["inverter_" .. v502] = v314.Switch(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Inverter" .. v503, false, "", "Body Yaw" .. v503);
    v263.AntiAim["l_limit_" .. v502] = v314.SliderInt(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Limit" .. v503, 60, 0, 60, "", "Body Yaw" .. v503);
    if v501 ~= 8 then
        v263.AntiAim["yaw_add_" .. v502] = v314.SliderInt(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Add Left" .. v503, 0, -180, 180, "", "Body Yaw" .. v503);
        v263.AntiAim["yaw_add1_" .. v502] = v314.SliderInt(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Add Right" .. v503, 0, -180, 180, "", "Body Yaw" .. v503);
    end;
    v263.AntiAim["fake_opt_" .. v502] = v314.MultiCombo(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Options" .. v503, {
        [1] = "Avoid overlap", 
        [2] = "Jitter", 
        [3] = "Randomize jitter"
    }, {}, "", "Body Yaw" .. v503);
    v263.AntiAim["freestand_" .. v502] = v314.Combo(v404.tabs.AntiAim_tab, v404.tabs.Condass, "Freestanding" .. v503, {
        [1] = "Off", 
        [2] = "Default", 
        [3] = "Reversed"
    }, 0, "", "Body Yaw" .. v503);
    for _, v506 in ipairs(v496) do
        if v263.AntiAim[v506 .. v502] then
            local v507 = v500(v506 .. v502);
            v263.AntiAim[v506 .. v502]:RegisterCallback(v507);
            v507(v263.AntiAim[v506 .. v502]);
        end;
    end;
end;
local function v520()
    -- upvalues: v263 (ref), v178 (ref), v400 (ref), v67 (ref)
    local l_Combo_0 = v263.AntiAim.condition:GetCombo();
    local v509 = v178.antiaim and v263.AntiAim.mode:get() == "Builder";
    v263.AntiAim.condition:SetVisible(v509);
    v263.AntiAim.automatic_type:SetVisible(v178.antiaim and v263.AntiAim.mode:get() == "Automatic");
    v263.AntiAim.automatic_text_kitty:SetVisible(v263.AntiAim.automatic_type:visibility() and v263.AntiAim.automatic_type:get() == "Meta");
    v263.AntiAim.automatic_channel_kitty:SetVisible(v263.AntiAim.automatic_text_kitty:visibility());
    local v510 = v400[l_Combo_0 + 1]:gsub(" ", "");
    for v511, v512 in pairs(v400) do
        local v513 = v512:gsub(" ", "");
        local v514 = v509 and v513 == v510 and (not (v513 ~= "Global") or v263.AntiAim["enabled_" .. v513]:Get());
        if v511 ~= 8 then
            v263.AntiAim["yaw_base_" .. v513]:SetVisible(v514);
            v263.AntiAim["yaw_add_" .. v513]:SetVisible(v514 and v263.AntiAim["fake_opt_" .. v513]:get("Jitter"));
            v263.AntiAim["yaw_add1_" .. v513]:SetVisible(v263.AntiAim["yaw_add_" .. v513]:visibility());
            v263.AntiAim["yaw_add_main_" .. v513]:disabled(v263.AntiAim["body_yaw_" .. v513]:get() and v263.AntiAim["fake_opt_" .. v513]:get("Jitter") and v263.AntiAim["yaw_add_" .. v513]:get() + v263.AntiAim["yaw_add1_" .. v513]:get() ~= 0);
        end;
        local _ = v263.AntiAim["body_yaw_" .. v513]:get();
        local v516 = v263.AntiAim["yaw_mod_" .. v513]:Get() ~= 0;
        v263.AntiAim["l_limit_" .. v513]:SetVisible(v514);
        v263.AntiAim["body_yaw_" .. v513]:SetVisible(v514);
        v263.AntiAim["inverter_" .. v513]:SetVisible(v514);
        v263.AntiAim["fake_opt_" .. v513]:SetVisible(v514);
        v263.AntiAim["yaw_mod_" .. v513]:SetVisible(v514);
        v263.AntiAim["yaw_mod_deg_" .. v513]:SetVisible(v514 and v516);
        v263.AntiAim["mod_d_ab_add_en_" .. v513]:SetVisible(v514 and v516);
        v263.AntiAim["yaw_mod_deg_shitai_" .. v513]:SetVisible(v514 and v516);
        v263.AntiAim["yaw_mod_acid_" .. v513]:SetVisible(v514 and v263.AntiAim["yaw_mod_" .. v513]:get() == "AcidTech");
        v263.AntiAim["yaw_mod_deg_delay1_" .. v513]:SetVisible(v263.AntiAim["yaw_mod_acid_" .. v513]:visibility());
        v263.AntiAim["yaw_mod_deg_delay2_" .. v513]:SetVisible(v263.AntiAim["yaw_mod_acid_" .. v513]:visibility());
        v263.AntiAim["yaw_mod_deg_delay2_" .. v513]:disabled(v263.AntiAim["yaw_mod_deg_delay1_" .. v513]:get() == 4);
        v263.AntiAim["yaw_mod_acid_safe_" .. v513]:SetVisible(v263.AntiAim["yaw_mod_acid_" .. v513]:visibility());
        v263.AntiAim["freestand_" .. v513]:SetVisible(v514);
        if v513 ~= "Global" then
            v263.AntiAim["enabled_" .. v513]:SetVisible(v509 and v513 == v510);
        end;
        local v517 = v514 and v516 and v263.AntiAim["mod_d_ab_add_en_" .. v513]:get();
        v263.AntiAim["mod_d_ab_add_" .. v513]:SetVisible(v517);
        v263.AntiAim["mod_d_ab_remove_" .. v513]:SetVisible(v517);
        local v518 = v67.ab_phases[v513];
        for v519 = 2, 5 do
            v263.AntiAim["mod_d_ab_" .. v519 .. v513]:SetVisible(v517 and v519 <= v518);
        end;
    end;
end;
v242:register_visibility(v263.Ragebot, v263, "ragebot");
v242:register_callbacks(v263.Ragebot);
v242:register_visibility(v263.AntiAim, v263, "antiaim");
v242:register_callbacks(v263.AntiAim);
v242:register_visibility(v263.Visuals, v263, "visuals");
v242:register_callbacks(v263.Visuals);
v242:register_visibility(v263.Misc, v263, "misc");
v242:register_callbacks(v263.Misc);
v242:register_visibility(v263.Modifications, v263, "modifications");
v242:register_callbacks(v263.Modifications);
v242:add_custom_callback("antiaim", "selector", v263.AntiAim.condition, v520);
v242:add_custom_callback("antiaim", "mode", v263.AntiAim.mode, v520);
v242:add_custom_callback("antiaim", "modefsafas", v263.AntiAim.automatic_type, v520);
for v521 = 1, #v400 do
    local v522 = v400[v521]:gsub(" ", "");
    if v522 ~= "Global" then
        v242:add_custom_callback("antiaim", v522, v263.AntiAim["enabled_" .. v522], v520);
    end;
    if v521 ~= 8 then
        v242:add_custom_callback("antiaim", v522 .. "degfasfa", v263.AntiAim["yaw_add_" .. v522], v520);
        v242:add_custom_callback("antiaim", v522 .. "degfadsfa", v263.AntiAim["yaw_add1_" .. v522], v520);
    end;
    v242:add_custom_callback("antiaim", v522 .. "deg", v263.AntiAim["yaw_mod_" .. v522], v520);
    v242:add_custom_callback("antiaim", v522 .. "smth", v263.AntiAim["body_yaw_" .. v522], v520);
    v242:add_custom_callback("antiaim", v522 .. "smthda1", v263.AntiAim["fake_opt_" .. v522], v520);
    v242:add_custom_callback("antiaim", v522 .. "smtshda1", v263.AntiAim["yaw_mod_deg_delay1_" .. v522], v520);
    v242:add_custom_callback("antiaim", v522 .. "smthdad1", v263.AntiAim["mod_d_ab_add_en_" .. v522], v520);
    do
        local l_v522_0 = v522;
        v242:add_custom_callback("antiaim", l_v522_0 .. "smth2", v263.AntiAim["mod_d_ab_add_" .. l_v522_0], function()
            -- upvalues: v67 (ref), l_v522_0 (ref), v520 (ref)
            v67.ab_phases[l_v522_0] = math.min(5, v67.ab_phases[l_v522_0] + 1);
            v520();
        end);
        v242:add_custom_callback("antiaim", l_v522_0 .. "smth3", v263.AntiAim["mod_d_ab_remove_" .. l_v522_0], function()
            -- upvalues: v67 (ref), l_v522_0 (ref), v520 (ref)
            v67.ab_phases[l_v522_0] = math.max(2, v67.ab_phases[l_v522_0] - 1);
            v520();
        end);
    end;
end;
local function v527()
    -- upvalues: v263 (ref), v178 (ref), v179 (ref)
    local l_indicators_0 = v263.Visuals.indicators;
    local v525 = l_indicators_0.main:Get();
    local v526 = v178.visuals and v525;
    l_indicators_0.show_damage:SetVisible(v526);
    l_indicators_0.color1:SetVisible(v526);
    l_indicators_0.colorushka:SetVisible(v526);
    l_indicators_0.color2:SetVisible(false);
    v179.indicators.main = v525;
end;
local _ = function()
    -- upvalues: v263 (ref)
    local _ = v263.Visuals.custom_scope.main:get();
end;
local function v531()
    -- upvalues: v263 (ref)
    local v530 = v263.Modifications.grenade_radius.main:Get();
    v263.Modifications.grenade_radius.fire_color:SetVisible(v530 and v263.Modifications.grenade_radius.options:GetCombo(1) or false);
    v263.Modifications.grenade_radius.fire_color1:SetVisible(v530 and v263.Modifications.grenade_radius.options:GetCombo(1) or false);
    v263.Modifications.grenade_radius.smoke_color:SetVisible(v530 and v263.Modifications.grenade_radius.options:GetCombo(2) or false);
end;
local function v535()
    -- upvalues: v263 (ref), v143 (ref)
    local v532 = v263.Visuals.velocity_warning.main:Get();
    local v533 = v263.Visuals.velocity_warning.items:Get(1);
    local v534 = #v263.Visuals.velocity_warning.items:Get() ~= 0;
    v263.Visuals.velocity_warning.rounding:SetVisible(v532 and v263.Visuals.velocity_warning.items:get(1) or v263.Visuals.velocity_warning.items:get(2) or v263.Visuals.velocity_warning.items:get(3));
    v263.Visuals.velocity_warning.elements:SetVisible(v532 and v533);
    v263.Visuals.velocity_warning.custom_name:SetVisible(v532 and v533 and v143(v263.Visuals.velocity_warning.elements:get()).Username == true);
    v263.Visuals.velocity_warning.accent:SetVisible(v532 and v534);
end;
local function v538()
    -- upvalues: v263 (ref)
    local v536 = v263.Ragebot.hitchance.main:get();
    v263.Ragebot.hitchance.mode:SetVisible(v536);
    local v537 = v263.Ragebot.hitchance.mode:get(1);
    v263.Ragebot.hitchance.distance:SetVisible(v536 and v537 and #v263.Ragebot.hitchance.weapons_ns:get() ~= 0);
    v263.Ragebot.hitchance.noscope:SetVisible(v536 and v537 and #v263.Ragebot.hitchance.weapons_ns:get() ~= 0);
    v263.Ragebot.hitchance.weapons_ns:SetVisible(v536 and v537);
    v263.Ragebot.hitchance.weapons_ia:SetVisible(v536 and v263.Ragebot.hitchance.mode:get(2));
    v263.Ragebot.hitchance.air:SetVisible(v536 and v263.Ragebot.hitchance.mode:get(2) and #v263.Ragebot.hitchance.weapons_ia:get() ~= 0);
end;
v242:add_custom_callback("ragebot", "aklfsjl", v263.Ragebot.hitchance.main, v538);
v242:add_custom_callback("ragebot", "aklfsfasfajl", v263.Ragebot.hitchance.mode, v538);
v242:add_custom_callback("ragebot", "aklfsfassssssfajl", v263.Ragebot.hitchance.weapons_ns, v538);
v242:add_custom_callback("ragebot", "aklfsfassssdssfajl", v263.Ragebot.hitchance.weapons_ia, v538);
v242:add_custom_callback("visuals", "GrenadeRadius", v263.Modifications.grenade_radius.main, v531);
v242:add_custom_callback("visuals", "GrenadeRadius1", v263.Modifications.grenade_radius.options, v531);
v242:add_custom_callback("visuals", "widgets_visibility", v263.Visuals.velocity_warning.main, v535);
v242:add_custom_callback("visuals", "widgets_visibility3", v263.Visuals.velocity_warning.elements, v535);
v242:add_custom_callback("visuals", "widgets_visibility1", v263.Visuals.velocity_warning.items, v535);
v242:add_custom_callback("visuals", "gradient_line", v263.Visuals.indicators.main, v527);
v242.main_visibility();
local l_clipboard_0 = require("neverlose/clipboard");
local v602 = new_class():struct("base")({
    last_manipulations = 0, 
    split = function(v540, v541)
        local v542 = {};
        local v543 = "(.-)" .. v541;
        local v544 = 1;
        local v545, v546, v547 = v540:find(v543, 1);
        while v545 do
            if v545 ~= 1 or v547 ~= "" then
                table.insert(v542, v547);
            end;
            v544 = v546 + 1;
            local v548, v549, v550 = v540:find(v543, v544);
            v547 = v550;
            v546 = v549;
            v545 = v548;
        end;
        if v544 <= #v540 then
            v547 = v540:sub(v544);
            table.insert(v542, v547);
        end;
        return v542;
    end, 
    get_cheat_var = function(_, v552)
        if type(v552) == "boolean" then
            return v552;
        else
            local v553 = v552:get();
            if type(v553) == "userdata" then
                return ("ColorElement:%d:%d:%d:%d"):format(v553.r, v553.g, v553.b, v553.a);
            elseif type(v553) == "table" then
                return (function()
                    -- upvalues: v553 (ref)
                    local v554 = "TableTT{";
                    for v555 = 1, #v553 do
                        v554 = v554 .. v553[v555] .. (v555 ~= #v553 and ", " or "");
                    end;
                    return v554 .. "}";
                end)();
            else
                return v553;
            end;
        end;
    end, 
    get_cheat_var_value = function(v556, v557, _)
        if type(v557) == "string" then
            if v557:find("ColorElement") then
                local v559 = v556.split(v557, ":");
                return color(tonumber(v559[2]), tonumber(v559[3]), tonumber(v559[4]), tonumber(v559[5]));
            elseif v557:find("TableTT{") then
                if v557 == "TableTT{}" then
                    return {};
                else
                    v557 = v557:gsub("TableTT{", ""):gsub("}", "");
                    return v556.split(v557, ", ");
                end;
            end;
        end;
        return v557;
    end
}):struct("clipboard")({
    char_buff = ffi.typeof("char[?]"), 
    set_clip_text = utils.get_vfunc("vgui2.dll", "VGUI_System010", 9, "void(__thiscall*)(void*, const char*, int)"), 
    get_clip_text = utils.get_vfunc("vgui2.dll", "VGUI_System010", 11, "int(__thiscall*)(void*, int, const char*, int)"), 
    get_clip_text_count = utils.get_vfunc("vgui2.dll", "VGUI_System010", 7, "int(__thiscall*)(void*)"), 
    get_clipboard = function(v560)
        local v561 = v560.get_clip_text_count();
        if v561 ~= 0 then
            local v562 = v560.char_buff(v561);
            v560.get_clip_text(0, v562, ffi.sizeof(v562) * v561);
            return ffi.string(v562, v561 - 1);
        else
            return "";
        end;
    end, 
    set_clipboard = function(v563, v564)
        if v564 then
            v563.set_clip_text(v564, v564:len());
        end;
    end
}):struct("operations")({
    export = function(v565, v566, v567)
        -- upvalues: v263 (ref), v67 (ref), v44 (ref), v17 (ref), v133 (ref), l_clipboard_0 (ref), v177 (ref), v149 (ref), v150 (ref)
        if v565.base.last_manipulations > globals.realtime then
            return;
        else
            local v568 = {};
            local v569 = v566 and {
                [1] = "AntiAim"
            } or {
                [1] = "Ragebot", 
                [2] = "AntiAim", 
                [3] = "Visuals", 
                [4] = "Misc", 
                [5] = "Modifications"
            };
            for _, v571 in pairs(v569) do
                v568[v571] = {};
                for v572, v573 in pairs(v263[v571]) do
                    if type(v573) ~= "table" then
                        v568[v571][v572] = v565.base:get_cheat_var(v573);
                    else
                        v568[v571][v572] = {};
                        for v574, v575 in pairs(v573) do
                            if type(v575) ~= "table" then
                                v568[v571][v572][v574] = v565.base:get_cheat_var(v575);
                            else
                                v568[v571][v572][v574] = {};
                                for v576, v577 in pairs(v575) do
                                    if type(v577) ~= "table" then
                                        v568[v571][v572][v574][v576] = v565.base:get_cheat_var(v577);
                                    else
                                        v568[v571][v572][v574][v576] = {};
                                        for v578, v579 in pairs(v577) do
                                            v568[v571][v572][v574][v576][v578] = v565.base:get_cheat_var(v579);
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            v565.base.last_cfg_manipulations = globals.realtime + 0.5;
            v568.data = {
                is_anti_aim = v566, 
                author = v67.username, 
                date = common.get_date(" created %d/%m/%y at %T")
            };
            local v580 = "[" .. v67.script_name .. "]>" .. v44:cipher(v17.encode(v133.stringify(v568)), 5) .. "<[" .. v67.script_name .. "]";
            if not v567 then
                l_clipboard_0.set(v580);
                utils.console_exec("play ambient\\tones\\elev1");
                v177:push({
                    v149, 
                    ("[%s] "):format(v67.script_name)
                }, {
                    [1] = nil, 
                    [2] = "Successfully exported settings.", 
                    [1] = v150.white
                });
                return;
            else
                return v580;
            end;
        end;
    end, 
    import = function(v581, v582, v583)
        -- upvalues: l_clipboard_0 (ref), v67 (ref), v17 (ref), v44 (ref), v133 (ref), v177 (ref), v149 (ref), v150 (ref), v263 (ref), v242 (ref)
        if v581.base.last_manipulations > globals.realtime then
            return;
        else
            local v584 = (v583 or l_clipboard_0.get()):sub(12, -1);
            local v585, v586 = v584:find(v67.script_name);
            if v585 and v586 then
                v584 = v584:sub(0, v585 - 3);
            end;
            v585 = v17.decode(v44:decipher(v584, 5));
            v586 = v133.parse(v585);
            if v586.data.is_anti_aim ~= v582 then
                if v586.data.is_anti_aim then
                    v177:push({
                        v149, 
                        ("[%s] "):format(v67.script_name)
                    }, {
                        [1] = nil, 
                        [2] = "You are trying to load antiaim settings. You can load it in 'AntiAim' tab.", 
                        [1] = v150.white
                    });
                else
                    v177:push({
                        v149, 
                        ("[%s] "):format(v67.script_name)
                    }, {
                        [1] = nil, 
                        [2] = "You are trying to load global settings. You can load it in 'Global' tab.", 
                        [1] = v150.white
                    });
                end;
                return;
            else
                local _ = "";
                for v588, v589 in pairs(v586) do
                    if v588 ~= "data" then
                        for v590, v591 in pairs(v589) do
                            if type(v591) == "table" then
                                for v592, v593 in pairs(v591) do
                                    if type(v593) == "table" then
                                        for v594, v595 in pairs(v593) do
                                            if type(v595) == "table" then
                                                for v596, v597 in pairs(v595) do
                                                    v263[v588][v590][v592][v594][v596]:set(v581.base:get_cheat_var_value(v597));
                                                end;
                                            elseif not v594:find("preset") then
                                                v263[v588][v590][v592][v594]:set(v581.base:get_cheat_var_value(v595));
                                            end;
                                        end;
                                    elseif v263[v588][v590] and not v592:find("preset") and type(v263[v588][v590][v592]) ~= "boolean" then
                                        v263[v588][v590][v592]:set(v581.base:get_cheat_var_value(v593));
                                    end;
                                end;
                            elseif v263[v588][v590] and not v590:find("preset") and v263[v588][v590]:type() ~= "button" then
                                v263[v588][v590]:set(v581.base:get_cheat_var_value(v591));
                            end;
                        end;
                    end;
                end;
                for _, v599 in pairs(v242.visibilities) do
                    v599();
                end;
                for _, v601 in pairs(v242.all_callbacks) do
                    v601();
                end;
                v581.last_cfg_manipulations = globals.realtime + 0.5;
                return {
                    [1] = {
                        v149, 
                        ("[%s] "):format(v67.script_name)
                    }, 
                    [2] = {
                        [1] = nil, 
                        [2] = "Successfully loaded config by ", 
                        [1] = v150.white
                    }, 
                    [3] = {
                        [1] = v150.pinky, 
                        [2] = v586.data.author
                    }, 
                    [4] = {
                        [1] = v150.white, 
                        [2] = v586.data.date
                    }
                };
            end;
        end;
    end
});
v263.Configs.export_cfg:RegisterCallback(function()
    -- upvalues: v602 (ref)
    v602.operations:export(false);
end);
v263.Configs.def_cfg:RegisterCallback(function()
    -- upvalues: v602 (ref), v177 (ref), v149 (ref), v67 (ref), v150 (ref)
    v602.operations:import(false, "[acidtech]>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<[acidtech]");
    v177:push({
        v149, 
        ("[%s] "):format(v67.script_name)
    }, {
        [1] = nil, 
        [2] = "Succesfully loaded default settings.", 
        [1] = v150.white
    });
    utils.console_exec("play resource\\warning");
end);
v263.Configs.import_cfg:RegisterCallback(function()
    -- upvalues: v602 (ref), v177 (ref), v149 (ref), v67 (ref), v150 (ref)
    local l_status_4, l_result_4 = pcall(v602.operations.import, v602, false);
    if not l_status_4 then
        utils.console_exec("play error");
        v177:push({
            v149, 
            ("[%s] "):format(v67.script_name)
        }, {
            [1] = nil, 
            [2] = "Failed to import script settings.", 
            [1] = v150.white
        });
    elseif l_status_4 and l_result_4 then
        v177:push(unpack(l_result_4));
        utils.console_exec("play resource\\warning");
    end;
end);
v263.Configs.share_cfg:RegisterCallback(function()
    -- upvalues: v602 (ref), v177 (ref), v149 (ref), v67 (ref), v150 (ref), l_clipboard_0 (ref)
    local v605 = v602.operations:export(false, true);
    if not v605 then
        return;
    else
        v177:push({
            v149, 
            ("[%s] "):format(v67.script_name)
        }, {
            [1] = nil, 
            [2] = "Generating config token...", 
            [1] = v150.white
        });
        local v606 = {
            u = v67.username, 
            c = v605, 
            t = common.get_unixtime() % 53299
        };
        network.post("http://exscord.tech/configs_new/share_alt.php", v606, {
            ["User-Agent"] = "Valve/Steam HTTP Client 1.0 (730;Windows;tenfoot)"
        }, function(v607)
            -- upvalues: l_clipboard_0 (ref), v177 (ref), v149 (ref), v67 (ref), v150 (ref)
            if #v607 > 30 then
                l_clipboard_0.set(v607);
                utils.console_exec("play ambient\\tones\\elev1");
                v177:push({
                    v149, 
                    ("[%s] "):format(v67.script_name)
                }, {
                    v150.white, 
                    ("Your unique config code is in your clipboard! (%s)"):format(v607)
                });
            elseif v607 == nil then
                v177:push({
                    v149, 
                    ("[%s] "):format(v67.script_name)
                }, {
                    [1] = nil, 
                    [2] = "Failed to connect to the server.", 
                    [1] = v150.white
                });
            else
                v177:push({
                    v149, 
                    ("[%s] "):format(v67.script_name)
                }, {
                    [1] = nil, 
                    [2] = "Unknown answer from the server: ", 
                    [1] = v150.white
                }, {
                    [1] = color(255, 0, 0, 255), 
                    [2] = v607
                }, {
                    v150.white, 
                    ("(%d)"):format(#v607)
                });
            end;
        end);
        return;
    end;
end);
v263.Configs.redeem_cfg:RegisterCallback(function()
    -- upvalues: l_clipboard_0 (ref), v177 (ref), v149 (ref), v67 (ref), v150 (ref), v602 (ref)
    local v608 = l_clipboard_0.get(result);
    if #v608 < 30 then
        v177:push({
            v149, 
            ("[%s] "):format(v67.script_name)
        }, {
            [1] = nil, 
            [2] = "Wrong code.", 
            [1] = v150.white
        });
        utils.console_exec("play error");
        return;
    else
        v177:push({
            v149, 
            ("[%s] "):format(v67.script_name)
        }, {
            [1] = nil, 
            [2] = "Parsing config data...", 
            [1] = v150.white
        });
        local v609 = {
            c = v608, 
            t = common.get_unixtime() % 53299
        };
        network.post("http://exscord.tech/configs_new/redeem_alt.php", v609, {
            ["User-Agent"] = "Valve/Steam HTTP Client 1.0 (730;Windows;tenfoot)"
        }, function(v610)
            -- upvalues: v602 (ref), v177 (ref), v149 (ref), v67 (ref), v150 (ref)
            if #v610 > 30 then
                local l_status_5, l_result_5 = pcall(v602.operations.import, v602, false, v610);
                if not l_status_5 then
                    utils.console_exec("play error");
                    v177:push({
                        v149, 
                        ("[%s] "):format(v67.script_name)
                    }, {
                        [1] = nil, 
                        [2] = "Failed to import script settings.", 
                        [1] = v150.white
                    });
                elseif l_status_5 and l_result_5 then
                    v177:push(unpack(l_result_5));
                    utils.console_exec("play resource\\warning");
                end;
            elseif v610 == "1" then
                v177:push({
                    v149, 
                    ("[%s] "):format(v67.script_name)
                }, {
                    [1] = nil, 
                    [2] = "Requested config doesn't exist.", 
                    [1] = v150.white
                });
            elseif v610 == "2" then
                v177:push({
                    v149, 
                    ("[%s] "):format(v67.script_name)
                }, {
                    [1] = nil, 
                    [2] = "Something went wrong.", 
                    [1] = v150.white
                });
            elseif v610 == nil then
                v177:push({
                    v149, 
                    ("[%s] "):format(v67.script_name)
                }, {
                    [1] = nil, 
                    [2] = "Failed to connect to the server.", 
                    [1] = v150.white
                });
            else
                v177:push({
                    v149, 
                    ("[%s] "):format(v67.script_name)
                }, {
                    [1] = nil, 
                    [2] = "Unknown answer from the server: ", 
                    [1] = v150.white
                }, {
                    [1] = color(255, 0, 0, 255), 
                    [2] = v610
                }, {
                    v150.white, 
                    ("(%d)"):format(#v610)
                });
            end;
        end);
        return;
    end;
end);
local l_max_0 = math.max;
local v618 = (function()
    -- upvalues: l_max_0 (ref)
    local l_min_1 = math.min;
    return function(v615, v616, v617)
        -- upvalues: l_max_0 (ref), l_min_1 (ref)
        return l_max_0(v616, l_min_1(v615, v617));
    end;
end)();
local v619 = {};
local v620 = {};
v619.Text = function(v621, v622, v623, v624, v625, v626, v627)
    -- upvalues: v620 (ref)
    local v628 = "";
    local v629 = type(v625);
    if v629 == "boolean" then
        v626 = v629;
        v627 = v626;
    end;
    if v626 then
        v628 = v628 .. "o";
    end;
    if v627 then
        v628 = v628 .. "c";
    end;
    if v625 == nil or v629 == "boolean" then
        if not v620[v624] then
            v620[v624] = render.load_font("Comic Sans MS", v624, "a");
        end;
        v625 = v620[v624];
    end;
    render.text(v625, v622, v623, v628, v621);
end;
v619.GradientBoxFilled = function(v630, v631, v632, v633, v634, v635)
    render.gradient(v630, v631, v632, v633, v634, v635);
end;
v619.Blur = function(v636, v637, v638, v639)
    render.blur(v636, v637, 1, v638.a / 255, v639 or 0);
end;
v619.BoxFilled = function(v640, v641, v642, v643)
    render.rect(v640, v641, v642, v643 or 0);
end;
v619.Box = function(v644, v645, v646, v647)
    render.rect_outline(v644, v645, v646, 1, v647 or 0);
end;
v619.Line = function(v648, v649, v650)
    render.line(v648, v649, v650);
end;
local function v654(v651)
    if not v651 then
        return "";
    else
        local v652 = "";
        for v653 = 1, #v651 do
            v652 = v652 .. v651[v653];
        end;
        return v652;
    end;
end;
v619.InitFont = function(v655, v656, v657)
    -- upvalues: v654 (ref)
    return render.load_font(v655, v656, v654(v657));
end;
v619.CalcTextSize = function(v658, v659, v660)
    -- upvalues: v620 (ref), v654 (ref)
    if not v660 then
        if not v620[v659] then
            v620[v659] = render.load_font("Tahoma", v659, "a");
        end;
        v660 = v620[v659];
    end;
    return render.measure_text(v660, v654(flags), v658);
end;
v619.LoadImage = function(v661, v662)
    return render.load_image(v661, v662);
end;
v619.Image = function(v663, v664, v665, v666, v667)
    render.texture(v663, v664, v665, v666, "r", v667);
end;
(function()
    -- upvalues: v149 (ref), v263 (ref)
    v149 = color(162, 132, 255, 255);
    local function v668()
        -- upvalues: v263 (ref), v149 (ref)
        if v263.Visuals.main:get() then
            v149 = v263.Visuals.indicators.colorushka:get():alpha_modulate(255);
        end;
    end;
    v263.Visuals.main:set_callback(v668, true);
    v263.Visuals.indicators.colorushka:set_callback(v668, true);
end)();
local v669 = 0;
(function()
    -- upvalues: v314 (ref), v263 (ref), v260 (ref), v67 (ref), v669 (ref)
    local v670 = v314.FindVar("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options");
    local v671 = v314.FindVar("Aimbot", "Ragebot", "Main", "Hide Shots", "Options");
    local v672 = false;
    local function v673()
        -- upvalues: v672 (ref), v670 (ref), v671 (ref)
        if v672 then
            v672 = false;
            v670:override();
            v671:override();
        end;
    end;
    local _ = v263.Ragebot.hitchance;
    v260:add("prediction", "custom_hc", function(v675, v676, _, _)
        -- upvalues: v67 (ref), v669 (ref)
        v67.functions.is_overriding_hc = false;
        if not v675.in_jump then
            if v676.m_hGroundEntity then
                v669 = v669 + 1;
            end;
        else
            v669 = 0;
        end;
    end);
    v260:add("destroy", "aksdal", v673);
end)();
local v680 = {
    GetPlayerForUserID = function(v679)
        return entity.get(v679, true);
    end
};
local v681 = nil;
(function()
    -- upvalues: v681 (ref), l_ui_0 (ref), l_vector_1 (ref), v67 (ref), v260 (ref), v139 (ref)
    v681 = {};
    local v682 = render.screen_size();
    while v682.x == 0 do
        v682 = render.screen_size();
    end;
    local v683 = v682 / 2;
    local v684 = {};
    local v685 = "";
    local v686 = false;
    local v687 = vector();
    local v688 = false;
    local v689 = false;
    local v690 = false;
    local v691 = 20;
    local v692 = v683.x + v691;
    local v693 = v683.x - v691;
    ffi.cdef("        int GetAsyncKeyState(int vKey);\n    ");
    local v694 = nil;
    local v695 = l_ui_0.create("containers");
    v681.add = function(v696, v697, v698)
        -- upvalues: v684 (ref), v695 (ref), v682 (ref), v688 (ref), v687 (ref), v690 (ref), v686 (ref), v685 (ref), v689 (ref), v693 (ref), v692 (ref), v683 (ref), l_vector_1 (ref), v67 (ref)
        v684[v696] = {
            is_in_b = false, 
            is_rmb_pressed = false, 
            dragging = false, 
            id = v696, 
            menu = {
                x = v695:slider(v696 .. "_x1", 0, 100, v697.x * 100, 0.01), 
                y = v695:slider(v696 .. "_y1", 0, 100, v697.y * 100, 0.01)
            }, 
            position = v697, 
            size = v698, 
            max = v682 - v698, 
            drag = vector(), 
            process = function(v699, v700)
                -- upvalues: v688 (ref), v687 (ref), v690 (ref), v686 (ref), v685 (ref), v696 (ref), v689 (ref), v693 (ref), v692 (ref), v683 (ref), l_vector_1 (ref), v67 (ref)
                if not v688 then
                    return v699;
                else
                    local l_position_0 = v699.position;
                    local v702 = v699.position + v699.size;
                    if v700 then
                        render.rect_outline(l_position_0, v702, color());
                    end;
                    local v703 = v687.x >= l_position_0.x and v687.y >= l_position_0.y and v687.x <= v702.x and v687.y <= v702.y;
                    v699.is_rmb_pressed = v703 and v690;
                    v699.is_in_b = v703;
                    if v703 or v699.dragging then
                        v686 = true;
                    end;
                    if (v703 or v699.dragging) and (v685 == "" or v685 == v696) and v689 then
                        v685 = v696;
                        if not v699.dragging then
                            v699.dragging = true;
                            v699.drag = v687 - l_position_0;
                        else
                            v699.position = v687 - v699.drag;
                        end;
                    elseif not v689 then
                        v685 = "";
                        v699.dragging = false;
                        v699.drag = l_vector_1(0, 0);
                    end;
                    if v696 == "aimlog" then
                        v699.position.x = v67.screen_center.x - 165;
                    end;
                    v699.menu.x:set(v699.position.x / v67.screen_size.x * 100);
                    v699.menu.y:set(v699.position.y / v67.screen_size.y * 100);
                    return v699;
                end;
            end
        };
        if v684[v696].menu.x:get() ~= v697.x or v684[v696].menu.y:get() ~= v697.y then
            v684[v696].position = vector(v684[v696].menu.x:get() * v67.screen_size.x / 100, v684[v696].menu.y:get() * v67.screen_size.y / 100);
        end;
        v684[v696].menu.x:visibility(false);
        v684[v696].menu.y:visibility(false);
        return v684[v696];
    end;
    local v704 = 0;
    v260:add("draw", "containers handle", function()
        -- upvalues: v694 (ref), v704 (ref), v139 (ref), v686 (ref), l_ui_0 (ref), v67 (ref), v688 (ref), v687 (ref), v689 (ref), v690 (ref)
        v694 = nil;
        v686 = false;
        v688 = l_ui_0.get_alpha() > 0;
        if v688 then
            v687 = l_ui_0.get_mouse_position();
            v689 = common.is_button_down(1);
            v690 = ffi.C.GetAsyncKeyState(2) > 0;
            if v690 then
                v689 = false;
            end;
        end;
    end);
    v260:add("prediction", "skip moment", function(v705)
        -- upvalues: v686 (ref)
        if v686 then
            v705.in_attack = false;
            v705.in_attack2 = false;
        end;
    end);
end)();
local _ = nil;
local v707 = {
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
local v708 = {
    knife = "Knifed ", 
    inferno = "Burned ", 
    hegrenade = "Naded "
};
local function v713(...)
    local v709 = "";
    for _, v711 in pairs({
        ...
    }) do
        local v712 = type(v711[1]) == "userdata" and "\a" .. v711[1]:to_hex() or "\aDEFAULT";
        v709 = v709 .. string.format("%s%s", v712, v711[2]);
    end;
    print_raw(v709);
end;
local function v718(...)
    local v714 = "";
    for _, v716 in pairs({
        ...
    }) do
        local v717 = type(v716[1]) == "userdata" and "\a" .. v716[1]:to_hex() or "\aDEFAULT";
        v714 = v714 .. string.format("%s%s", v717, v716[2]);
    end;
    return v714;
end;
do
    local l_v707_0, l_v708_0, l_v713_0, l_v718_0 = v707, v708, v713, v718;
    local function v723(...)
        -- upvalues: v263 (ref), l_v718_0 (ref)
        if not v263.Ragebot.adv_logs.states:get("Event") then
            return;
        else
            common.add_event(l_v718_0(...));
            return;
        end;
    end;
    local function v724(...)
        -- upvalues: v263 (ref), l_v713_0 (ref)
        if not v263.Ragebot.adv_logs.states:get("Console") then
            return;
        else
            l_v713_0(...);
            return;
        end;
    end;
    local v725 = {
        correction = "miss", 
        spread = "spread", 
        ["damage rejection"] = "miss", 
        ["player misprediction"] = "miss", 
        ["backtrack failure"] = "miss", 
        ["unregistered shot"] = "unregistered", 
        death = "unregistered", 
        ["player death"] = "unregistered", 
        ["lagcomp failure"] = "miss", 
        ["jitter correction"] = "miss", 
        ["prediction error"] = "miss"
    };
    local _ = {
        hit = l_ui_0.get_icon("vector-circle"), 
        burn = l_ui_0.get_icon("fire"), 
        miss = l_ui_0.get_icon("circle-xmark"), 
        spread = l_ui_0.get_icon("spinner"), 
        unregistered = l_ui_0.get_icon("satellite-dish")
    };
    local v727 = l_ui_0.find("Miscellaneous", "Main", "Other", "Log Events");
    local function v728()
        -- upvalues: v727 (ref)
        v727:override();
    end;
    local function v731()
        -- upvalues: v263 (ref), v728 (ref), v143 (ref), v727 (ref), v148 (ref)
        if not v263.Ragebot.adv_logs.main:get() then
            return v728();
        else
            local v729 = v143(v727:get());
            local v730 = v143(v263.Ragebot.adv_logs.log:get());
            if v729["Damage Dealt"] and v730["Damage Dealt"] ~= nil then
                v729["Damage Dealt"] = false;
            end;
            if v729.Purchases and v730.Purchases ~= nil then
                v729.Purchases = false;
            end;
            if v729["Aimbot Shots"] and v730["Aimbot Shots"] ~= nil then
                v729["Aimbot Shots"] = false;
            end;
            v727:override(v148(v729));
            return;
        end;
    end;
    v263.Ragebot.adv_logs.main:set_callback(v731);
    v263.Ragebot.adv_logs.log:set_callback(v731);
    v263.Ragebot.adv_logs.states:set_callback(v731);
    v260:add("player_hurt", "hurt top logs", function(v732, v733, v734)
        -- upvalues: v263 (ref), l_v708_0 (ref), v724 (ref), v723 (ref)
        if not v263.Ragebot.adv_logs.main:get() or not v734 or v263.Ragebot.adv_logs.log:get("Damage Dealt") then
            return;
        else
            local v735 = entity.get(v732.userid, true);
            local v736 = entity.get(v732.attacker, true);
            if v735 == nil or v735 == v733 or v736 == nil or v736 ~= v733 then
                return;
            elseif l_v708_0[v732.weapon] == nil then
                return;
            else
                local v737 = v263.Visuals.log_aimbot.hit:get();
                local v738 = v732.health <= 0;
                local v739 = {
                    [1] = {
                        [2] = l_v708_0[v732.weapon]
                    }, 
                    [2] = {
                        v737, 
                        v735:get_name()
                    }, 
                    [3] = {
                        [1] = nil, 
                        [2] = " for "
                    }, 
                    [4] = {
                        [1] = v737, 
                        [2] = v732.dmg_health
                    }, 
                    [5] = {
                        [1] = nil, 
                        [2] = " damage"
                    }, 
                    [6] = {
                        [2] = v738 and "" or " ("
                    }, 
                    [7] = {
                        [1] = v737, 
                        [2] = v738 and "" or v732.health
                    }, 
                    [8] = {
                        [2] = v738 and "" or " remaining)"
                    }
                };
                v724(unpack(v739));
                v723(unpack(v739));
                return;
            end;
        end;
    end);
    v260:add("item_purchase", "fsafasfas", function(v740)
        -- upvalues: v263 (ref), v724 (ref), v723 (ref)
        if not v263.Ragebot.adv_logs.main:get() or not v263.Ragebot.adv_logs.log:get("Purchases") then
            return;
        else
            local v741 = entity.get(v740.userid, true);
            if v741 == nil then
                return;
            elseif not v741:is_enemy() then
                return;
            else
                local v742 = v263.Visuals.log_aimbot.hit:get();
                local v743 = {
                    [1] = {
                        v742, 
                        v741:get_name()
                    }, 
                    [2] = {
                        [1] = nil, 
                        [2] = " bought "
                    }, 
                    [3] = {
                        [1] = v742, 
                        [2] = v740.weapon or "?"
                    }
                };
                v724(unpack(v743));
                v723(unpack(v743));
                return;
            end;
        end;
    end);
    v260:add("aim_ack", "qhouz", function(v744)
        -- upvalues: v263 (ref), v725 (ref), v724 (ref), l_v707_0 (ref), v723 (ref)
        if not v263.Ragebot.adv_logs.main:get() or not v263.Ragebot.adv_logs.log:get("Aimbot Shots") then
            return;
        else
            local v745 = entity.get(v744.target, true);
            if v745 == nil then
                return;
            elseif v744.state then
                local v746 = v263.Visuals.log_aimbot[v725[v744.state]]:get();
                v724({
                    [1] = nil, 
                    [2] = "Missed shot at "
                }, {
                    [1] = v746, 
                    [2] = v745:get_name() or "?"
                }, {
                    [1] = nil, 
                    [2] = "'s "
                }, {
                    [1] = v746, 
                    [2] = l_v707_0[v744.wanted_hitgroup]
                }, {
                    [1] = nil, 
                    [2] = "("
                }, {
                    v746, 
                    string.format("%d%%", v744.hitchance or 0)
                }, {
                    [1] = nil, 
                    [2] = ") due to "
                }, {
                    [1] = v746, 
                    [2] = v744.state
                }, {
                    [1] = nil, 
                    [2] = " (dmg: "
                }, {
                    [1] = v746, 
                    [2] = v744.wanted_damage or 0
                }, {
                    [1] = nil, 
                    [2] = " | history: "
                }, {
                    [1] = v746, 
                    [2] = v744.backtrack or 0
                }, {
                    [1] = nil, 
                    [2] = ")"
                });
                v723({
                    [1] = nil, 
                    [2] = "Missed shot at "
                }, {
                    v746, 
                    v745:get_name()
                }, {
                    [1] = nil, 
                    [2] = "'s due to "
                }, {
                    [1] = v746, 
                    [2] = v744.state
                });
                return;
            else
                local v747 = v263.Visuals.log_aimbot.hit:get();
                local v748 = v744.wanted_damage - v744.damage ~= 0;
                local v749 = v745.m_iHealth <= 0;
                local v750 = v744.backtrack > 0;
                v724({
                    [1] = nil, 
                    [2] = "Hit "
                }, {
                    [1] = v747, 
                    [2] = v745:get_name() or "?"
                }, {
                    [1] = nil, 
                    [2] = "'s "
                }, {
                    [1] = v747, 
                    [2] = l_v707_0[v744.hitgroup]
                }, {
                    [1] = nil, 
                    [2] = " for "
                }, {
                    [1] = v747, 
                    [2] = v744.damage or 0
                }, {
                    [1] = nil, 
                    [2] = "("
                }, {
                    [1] = v748 and v747 or nil, 
                    [2] = v744.wanted_damage
                }, {
                    [1] = nil, 
                    [2] = ") aimed="
                }, {
                    [1] = v744.hitgroup ~= v744.wanted_hitgroup and v747 or nil, 
                    [2] = l_v707_0[v744.wanted_hitgroup]
                }, {
                    [1] = nil, 
                    [2] = "("
                }, {
                    v747, 
                    string.format("%d%%", v744.hitchance or 0)
                }, {
                    [1] = nil, 
                    [2] = ") (history: "
                }, {
                    [1] = v747, 
                    [2] = v744.backtrack or 0
                }, {
                    [1] = nil, 
                    [2] = ") ("
                }, {
                    [1] = v747, 
                    [2] = v745.m_iHealth or 0
                }, {
                    [1] = nil, 
                    [2] = " remaining)"
                });
                v723({
                    [1] = nil, 
                    [2] = "Hit "
                }, {
                    [1] = v747, 
                    [2] = v745:get_name() or "?"
                }, {
                    [1] = nil, 
                    [2] = "'s "
                }, {
                    [1] = v747, 
                    [2] = l_v707_0[v744.hitgroup]
                }, {
                    [1] = nil, 
                    [2] = " for "
                }, {
                    [1] = v747, 
                    [2] = v744.damage or 0
                }, {
                    [1] = nil, 
                    [2] = " damage"
                }, {
                    [2] = v750 and " (bt: " or ""
                }, {
                    [1] = v747, 
                    [2] = v750 and v744.backtrack or ""
                }, {
                    [2] = v750 and ")" or ""
                }, {
                    [2] = v749 and "" or " ("
                }, {
                    [1] = v747, 
                    [2] = v749 and "" or v745.m_iHealth
                }, {
                    [2] = v749 and "" or " remaining)"
                });
                return;
            end;
        end;
    end);
end;
(function()
    -- upvalues: l_ui_0 (ref), v263 (ref), v260 (ref)
    local l_sv_maxusrcmdprocessticks_0 = cvar.sv_maxusrcmdprocessticks;
    local v752 = false;
    local v753 = l_ui_0.find("Aimbot", "Anti Aim", "Fake Lag", "Limit");
    local v754 = l_ui_0.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
    local function v755()
        -- upvalues: v752 (ref), v753 (ref), v754 (ref), l_sv_maxusrcmdprocessticks_0 (ref)
        if v752 then
            v753:override();
            v754:override();
            l_sv_maxusrcmdprocessticks_0:int(16);
            v752 = false;
        end;
    end;
    local l_lag_exploit_0 = v263.Ragebot.lag_exploit;
    v260:add("prediction", "air exploit", function(_, v758, v759, _)
        -- upvalues: l_lag_exploit_0 (ref), v755 (ref), l_sv_maxusrcmdprocessticks_0 (ref), v753 (ref), v754 (ref), v752 (ref)
        if not l_lag_exploit_0.main:get() then
            return v755();
        elseif not v759 then
            return v755();
        else
            local v761 = v758:get_anim_state();
            if v761 == nil then
                return v755();
            elseif v761.on_ground or #v758.m_vecVelocity < 100 then
                return v755();
            else
                l_sv_maxusrcmdprocessticks_0:int(19);
                v753:override(17);
                v754:override(globals.tickcount % l_lag_exploit_0.ticks:get() == 0);
                v752 = true;
                return;
            end;
        end;
    end);
    v260:add("destroy", "air exploit 1", v755);
end)();
v708 = math.floor;
(function()
    -- upvalues: v67 (ref), v708 (ref), v314 (ref), v260 (ref), v178 (ref), v179 (ref), v669 (ref), v263 (ref), l_max_0 (ref)
    local function v764(v762, v763)
        return v762[2] < v763[2];
    end;
    local function v772(v765)
        -- upvalues: v67 (ref), v764 (ref)
        local v766 = {};
        for _, v768 in pairs(v765) do
            if v768:is_alive() and not v768:is_dormant() then
                local v769 = v768:get_player_weapon();
                if v769 and v769:get_weapon_reload() == -1 then
                    local v770 = v769:get_weapon_info();
                    if v770 and (v770.weapon_type == 5 or v770.weapon_type == 1) then
                        local v771 = render.world_to_screen(v768:get_origin());
                        if v771 then
                            v766[#v766 + 1] = {
                                v768, 
                                v771:dist(v67.screen_center)
                            };
                        end;
                    end;
                end;
            end;
        end;
        table.sort(v766, v764);
        return {
            [1] = v766[1], 
            [2] = v766[2], 
            [3] = v766[3]
        };
    end;
    local v773 = 0;
    local v774 = 0;
    local v775 = false;
    local v776 = false;
    local function v778(v777)
        -- upvalues: v708 (ref)
        return v708(0.5 + v777 / globals.tickinterval);
    end;
    local function v784(v779, v780, v781)
        local l_m_vecVelocity_0 = v779.m_vecVelocity;
        local v783 = v781:clone();
        v783.x = v783.x + l_m_vecVelocity_0.x * globals.tickinterval * v780;
        v783.y = v783.y + l_m_vecVelocity_0.y * globals.tickinterval * v780;
        return v783;
    end;
    local v785 = v314.FindVar("Aimbot", "Ragebot", "Main", "Double Tap");
    local l_exploit_0 = rage.exploit;
    v260:add("prediction", "Discharge DT on air-peek", function(_, v788, v789, v790)
        -- upvalues: v67 (ref), l_exploit_0 (ref), v775 (ref), v178 (ref), v179 (ref), v785 (ref), v669 (ref), v776 (ref), v263 (ref), v772 (ref), l_max_0 (ref), v778 (ref), v784 (ref), v773 (ref), v774 (ref)
        v67.charge = l_exploit_0:get();
        v775 = v178.ragebot and v179.weapons_disharge.main and v67.charge == 1 and v785:get();
        if not v775 then
            return l_exploit_0:allow_charge(true);
        elseif not v789 then
            return;
        else
            local v791 = v788:get_player_weapon();
            if not v791 then
                return;
            elseif v669 > 5 or #v788.m_vecVelocity < 100 then
                return;
            else
                local v792 = v791:get_weapon_info();
                if not v792 then
                    return;
                else
                    v776 = false;
                    local v793 = v791:get_weapon_index();
                    local v794 = {
                        [1] = v792.weapon_type == 5 and v793 ~= 40 and v793 ~= 9, 
                        [2] = v793 == 40, 
                        [3] = v793 == 9, 
                        [4] = v792.weapon_type == 1, 
                        [5] = v793 == 31, 
                        [6] = v792.weapon_type == 0
                    };
                    for v795, v796 in pairs(v794) do
                        local v797 = v796 and v263.Ragebot.weapons_disharge.weapons:get(v795);
                        if not v776 then
                            v776 = v797;
                        end;
                    end;
                    if not v776 then
                        return;
                    else
                        local v798 = v772(v790);
                        if not #v798 then
                            return;
                        else
                            local v799 = v788:get_hitbox_position(4);
                            local v800 = false;
                            for _, v802 in pairs(v798) do
                                if not v800 then
                                    local v803 = v802[1];
                                    local v804 = v803:get_resource();
                                    if v804 then
                                        local l_m_iPing_0 = v804.m_iPing;
                                        local v806 = l_max_0(5, v778(l_m_iPing_0 * (l_m_iPing_0 <= 10 and 2 or 1.75) / 1000));
                                        local v807 = v803:get_hitbox_position(4);
                                        local v808, v809 = utils.trace_bullet(v803, v807, v784(v788, v806, v799));
                                        if not v808 or v808 <= 0 then
                                            v800 = false;
                                        elseif not v809.entity or v809.entity:get_classname() == "CWorld" then
                                            v800 = false;
                                        else
                                            v800 = true;
                                        end;
                                    end;
                                else
                                    break;
                                end;
                            end;
                            if v800 and v773 < globals.realtime then
                                if v774 == 1 then
                                    v773 = globals.realtime + 0.5;
                                    l_exploit_0:force_teleport();
                                    l_exploit_0:allow_charge(false);
                                    v774 = 0;
                                end;
                                v774 = v774 + 1;
                            else
                                l_exploit_0:allow_charge(true);
                            end;
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end);
end)();
(function()
    -- upvalues: v314 (ref), v260 (ref), v178 (ref), v179 (ref)
    local v810 = v314.FindVar("Miscellaneous", "Main", "In-Game", "Clan Tag");
    local v811 = {
        [1] = 0, 
        [2] = 1, 
        [3] = 2, 
        [4] = 3, 
        [5] = 4, 
        [6] = 5, 
        [7] = 6, 
        [8] = 7, 
        [9] = 8, 
        [10] = 9, 
        [11] = 10, 
        [12] = 11, 
        [13] = 11, 
        [14] = 11, 
        [15] = 11, 
        [16] = 11, 
        [17] = 11, 
        [18] = 11, 
        [19] = 11, 
        [20] = 12, 
        [21] = 13, 
        [22] = 14, 
        [23] = 15, 
        [24] = 16, 
        [25] = 17, 
        [26] = 18, 
        [27] = 19, 
        [28] = 20, 
        [29] = 21, 
        [30] = 22
    };
    local v812 = 0;
    v260:add("net_update_end", "tag", function()
        -- upvalues: v178 (ref), v179 (ref), v812 (ref), v810 (ref), v811 (ref)
        if not v178.misc or not v179.clantag.main then
            if v812 ~= 0 then
                common.set_clan_tag("");
            end;
            v812 = 0;
            return v810:override();
        else
            v810:override(false);
            local v813 = 0;
            local v814 = entity.get_game_rules();
            if v814 and v814.m_gamePhase == 4 then
                v813 = 11;
            else
                local v815 = 0.3 / globals.tickinterval;
                local v816 = globals.client_tick + globals.clock_offset;
                v813 = v811[math.floor(v816 / math.floor(v815 + 0.5) % 30) + 1];
            end;
            if v813 ~= v812 then
                local v817 = "";
                local l_tag_0 = v179.clantag.tag;
                v817 = l_tag_0 == "AcidTech" and "             acidtech                " or l_tag_0 == "500$ * 0" and "             gAmeSenSe                " or "             gamesense                ";
                common.set_clan_tag(v817:sub(v813 + 1, v813 + 18));
            end;
            v812 = v813;
            return;
        end;
    end);
    v260:add("destroy", "tag destroy", function()
        -- upvalues: v810 (ref)
        common.set_clan_tag("");
        v810:override();
    end);
end)();
local l_min_2 = math.min;
local v820 = 0;
local l_abs_1 = math.abs;
local function v823(v822)
    -- upvalues: l_min_2 (ref), l_abs_1 (ref), v708 (ref)
    return l_min_2(57, l_abs_1(v708((v822.m_flPoseParameter[11] or 0) * 120 - 60 + 0.5, 1)));
end;
(function()
    -- upvalues: l_vector_1 (ref), v67 (ref), v681 (ref), v139 (ref), v263 (ref), v161 (ref), v619 (ref), l_ui_0 (ref), v260 (ref), v618 (ref), v178 (ref), v669 (ref), v820 (ref), v823 (ref)
    local v824 = l_vector_1(215, 50);
    local v825 = l_vector_1(math.floor(v67.screen_center.x - 108) / v67.screen_size.x, v67.screen_size.y / 3.5 / v67.screen_size.y);
    local v826 = v681.add("velocity", v825, v824);
    local v827 = 0;
    local v828 = 0;
    local function v844(v829, v830, v831, v832, v833, v834, v835)
        -- upvalues: v826 (ref), v67 (ref), v827 (ref), v139 (ref), v828 (ref)
        local v836 = v831 * 255;
        if v826.is_in_b and v826.is_rmb_pressed and v835 then
            v826.position.x = v67.screen_center.x - 108;
        end;
        v827 = v139(v827, (not (v826.is_in_b and v835) or v826.dragging) and 0 or 1, 0.06);
        local v837 = v836 * v827;
        if v837 ~= 0 then
            render.text(1, v833 + vector(15, 40), color(255, 255, 255, v837), "", "Press M2 to center.");
        end;
        local v838 = color(255, 75, 75, v836);
        v828 = v139(v828, v834 and 1 or 0, 0.05);
        local v839 = v830.a * v831;
        v830 = v830:lerp(v838, v828):alpha_modulate(v836);
        local v840 = vector(v833.x + 15, v833.y + 30);
        local v841 = v840 + vector(185, 4);
        local v842 = v838:lerp(v830, v829);
        render.shadow(v840, v841, v842:alpha_modulate(v839), 20, 0);
        render.rect(v840, v841, color(0, 0, 0, v836));
        render.rect(v840 + vector(1, 1), v840 + vector(184 * v829, 3), v842);
        local v843 = (1 - v829) * 100;
        render.text(1, v840 + vector(92, -10), color():alpha_modulate(v836), "c", ("%s %d%%"):format(v832, v843));
    end;
    local v845 = 0;
    local function v852(v846, v847, v848, v849)
        -- upvalues: v826 (ref), v263 (ref), v844 (ref)
        v826:process();
        local l_position_1 = v826.position;
        if v847 == 1 and v846 == 0 then
            return;
        else
            local v851 = v263.Visuals.velocity_warning.accent:get();
            v844(v847, v851, v846, "\226\155\148\239\184\143 Max velocity reduced by", l_position_1, v848, v849);
            return;
        end;
    end;
    local function _(v853, v854, v855, ...)
        -- upvalues: v161 (ref), l_vector_1 (ref), v619 (ref)
        local v856 = {
            ...
        };
        local v857 = 0;
        for v858 = 1, #v856 do
            local v859 = v856[v858];
            v161(v859[1], l_vector_1(v853.x + v857, v853.y), v859[2], v854, v855);
            v857 = v857 + (v859[3] or v619.CalcTextSize(v859[1], v854, v855).x);
        end;
    end;
    local _ = false;
    local l_get_alpha_0 = l_ui_0.get_alpha;
    local l_get_mouse_position_0 = l_ui_0.get_mouse_position;
    v260:add("draw", "gui", function(v864, v865)
        -- upvalues: l_get_alpha_0 (ref), v67 (ref), l_get_mouse_position_0 (ref), l_vector_1 (ref), v618 (ref), v178 (ref), v263 (ref), v845 (ref), v139 (ref), v852 (ref), v669 (ref)
        local v866 = l_get_alpha_0();
        local v867 = v866 ~= 0;
        v67.menu_visible = v867;
        local v868 = l_get_mouse_position_0();
        mouse_position = l_vector_1(v618(v868.x, 0, v67.screen_size.x), v618(v868.y, 0, v67.screen_size.y));
        inactive_window = v868.x < 0 or not (v868.x <= v67.screen_size.x) or not (v868.y >= 0) or v868.y > v67.screen_size.y;
        local v869 = v178.visuals and v263.Visuals.velocity_warning.main:get() and v263.Visuals.velocity_warning.items:Get(4);
        local v870 = v865 and v864.m_flVelocityModifier or 1;
        if v867 and v869 then
            v870 = math.min(1, globals.tickcount % 200 / 150);
        end;
        local v871 = v869 and v870 ~= 1;
        v845 = v139(v845, v871 and 1 or 0, 0.05, 0.01);
        if v845 ~= 0 then
            local l_v845_0 = v845;
            if v867 and v869 then
                l_v845_0 = v866;
                v845 = v866;
            end;
            v852(l_v845_0, v870, v669 < 3, v867);
        end;
    end);
    v260:add("createmove", "trash info", function(_, v874)
        -- upvalues: v820 (ref), v823 (ref)
        v820 = v823(v874);
    end);
end)();
local l_functions_0 = v67.functions;
local v876 = nil;
local v877 = 1;
local l_band_0 = bit.band;
local v879 = v314.FindVar("Aimbot", "Anti Aim", "Misc", "Slow Walk");
local v880 = v314.FindVar("Aimbot", "Anti Aim", "Misc", "Fake Duck");
local v881 = v314.FindVar("Miscellaneous", "Main", "Movement", "Air Duck");
do
    local l_v877_0, l_l_band_0_0, l_v879_0, l_v880_0, l_v881_0 = v877, l_band_0, v879, v880, v881;
    v876 = function(v887, v888)
        -- upvalues: l_v880_0 (ref), l_l_band_0_0 (ref), v67 (ref), l_functions_0 (ref), v669 (ref), l_v881_0 (ref), l_v877_0 (ref), l_v879_0 (ref)
        local v889 = v887.m_flDuckAmount > 0.89 or l_v880_0:get();
        local v890 = 1;
        local v891 = l_l_band_0_0(v887.m_fFlags, 1);
        v890 = v67.functions.on_use_aa and 8 or not v888 and l_functions_0.is_fakelagging and 9 or v889 and (not (v891 ~= 0) or v669 < 3) and 7 or (not (v891 ~= 0) or v669 < 3) and (not l_v881_0:get() or l_v877_0 == 6) and 6 or v889 and v891 ~= 0 and 5 or l_v879_0:get() and 4 or #v887.m_vecVelocity > 2 and v669 > 10 and 3 or v669 > 10 and 2 or l_v877_0;
        l_v877_0 = v890;
        return v890;
    end;
end;
(function()
    -- upvalues: v150 (ref), v67 (ref), v314 (ref), v260 (ref), v178 (ref), v179 (ref), v618 (ref), v619 (ref), l_vector_1 (ref), l_max_0 (ref), v680 (ref), v263 (ref)
    local v892 = 0;
    local _ = 11;
    local _ = 5;
    local v895 = 0;
    local v896 = 4;
    local v897 = false;
    local v898 = 6;
    local l_white_0 = v150.white;
    local v900 = {};
    local v901 = render.load_font("Calibri", 18, "a");
    local l_screen_center_0 = v67.screen_center;
    local v903 = v314.FindVar("Visuals", "World", "Other", "Hit Marker");
    local v904 = false;
    local _ = vector(0, 15);
    v260:add("draw", "Hit marker", function(_, v907)
        -- upvalues: v178 (ref), v179 (ref), v904 (ref), v903 (ref), v892 (ref), v618 (ref), v895 (ref), l_white_0 (ref), v619 (ref), l_vector_1 (ref), l_screen_center_0 (ref), v898 (ref), v896 (ref), v900 (ref), l_max_0 (ref), v901 (ref)
        if not v178.visuals or not v179.hit_marker.main then
            if v904 then
                v904 = false;
                v903:override();
            end;
            return;
        elseif not v907 then
            return;
        else
            local v908 = v892 - globals.realtime;
            if v908 > 0 then
                local _ = v618((v895 - globals.tickcount) / 2, 6, 20) - v618((v895 - globals.tickcount) / 2, 0, 3);
                local v910 = color(l_white_0.r, l_white_0.g, l_white_0.b, l_white_0.a * v908 / 1);
                v619.Line(l_vector_1(l_screen_center_0.x - v898 - v896, l_screen_center_0.y - v898 - v896), l_vector_1(l_screen_center_0.x - v898, l_screen_center_0.y - v898), v910, 1);
                v619.Line(l_vector_1(l_screen_center_0.x + v898 + v896, l_screen_center_0.y + v898 + v896), l_vector_1(l_screen_center_0.x + v898, l_screen_center_0.y + v898), v910, 1);
                v619.Line(l_vector_1(l_screen_center_0.x + v898 + v896, l_screen_center_0.y - v898 - v896), l_vector_1(l_screen_center_0.x + v898, l_screen_center_0.y - v898), v910, 2);
                v619.Line(l_vector_1(l_screen_center_0.x - v898 - v896, l_screen_center_0.y + v898 + v896), l_vector_1(l_screen_center_0.x - v898, l_screen_center_0.y + v898), v910, 2);
            end;
            if v179.hit_marker.damage_marker then
                local l_realtime_0 = globals.realtime;
                for v912, v913 in pairs(v900) do
                    if v913.hit_pos then
                        local v914 = render.world_to_screen(v913.hit_pos);
                        if v914 then
                            local v915 = v913.timer - l_realtime_0;
                            local v916 = v915 < 2 and l_max_0(0, v915) * 2 or 1;
                            render.text(v901, v914, v913.color:alpha_modulate(v916 * 255), "cd", v913.damage);
                        end;
                        if v913.timer < l_realtime_0 then
                            v900[v912] = nil;
                        end;
                    end;
                end;
            end;
            return;
        end;
    end);
    v260:add("round_prestart", "Hit marker event 1", function(_, _)
        -- upvalues: v900 (ref)
        v900 = {};
    end);
    v260:add("destroy", "Hit marker event 2", function(_, _)
        -- upvalues: v903 (ref)
        v903:override();
    end);
    local v921 = 0;
    local v922 = {};
    local _ = vector();
    v260:add("bullet_impact", "top damag marker", function(v924, v925)
        -- upvalues: v178 (ref), v179 (ref), v680 (ref), v921 (ref), v922 (ref)
        if not v178.visuals or not v179.hit_marker.main then
            return;
        elseif not v925 or not v925:is_alive() then
            return;
        elseif v680.GetPlayerForUserID(v924.userid) ~= v925 then
            return;
        else
            if v921 ~= globals.tickcount then
                v922 = {};
                v921 = globals.tickcount;
            end;
            v922[#v922 + 1] = vector(v924.x, v924.y, v924.z);
            return;
        end;
    end);
    v260:add("player_hurt", "Hit marker event", function(v926, v927)
        -- upvalues: v178 (ref), v179 (ref), v680 (ref), v897 (ref), v892 (ref), v895 (ref), l_white_0 (ref), v263 (ref), v903 (ref), v904 (ref), v922 (ref), v900 (ref)
        if not v178.visuals or not v179.hit_marker.main then
            return;
        else
            local v928 = v680.GetPlayerForUserID(v926.userid);
            local v929 = v680.GetPlayerForUserID(v926.attacker);
            if not v928 or not v929 or v928 == v929 or v929 ~= v927 then
                return;
            else
                v897 = v926.health <= 0;
                v892 = globals.realtime + 1;
                v895 = globals.tickcount + 20;
                l_white_0 = v897 and v263.Visuals.hit_marker.color1:Get() or v263.Visuals.hit_marker.color:Get();
                if v179.hit_marker.damage_marker then
                    v903:override(false);
                    v904 = true;
                    local l_hitgroup_0 = v926.hitgroup;
                    local v931 = nil;
                    if l_hitgroup_0 == 0 then
                        v931 = v928:get_hitbox_position(l_hitgroup_0);
                    else
                        local v932 = v928:get_hitbox_position(l_hitgroup_0);
                        local l_huge_0 = math.huge;
                        local v934 = vector();
                        for v935 = 1, #v922 do
                            local v936 = v922[v935]:dist(v932);
                            if v936 < l_huge_0 then
                                v934 = v922[v935];
                                l_huge_0 = v936;
                            end;
                        end;
                        v931 = v934;
                    end;
                    v900[v928:get_index()] = {
                        timer = globals.realtime + 3, 
                        damage = tostring(v926.dmg_health), 
                        hit_pos = v931, 
                        color = l_hitgroup_0 == 1 and color(237, 28, 36) or color(240, 240)
                    };
                else
                    v900 = {};
                    v903:override();
                    v904 = false;
                end;
                return;
            end;
        end;
    end);
end)();
(function()
    -- upvalues: v314 (ref), v260 (ref), v67 (ref), v263 (ref), v179 (ref), v619 (ref), l_vector_1 (ref)
    local v937 = v314.FindVar("Visuals", "World", "Main", "Override Zoom", "Scope Overlay");
    local v938 = 0;
    local function v939()
        -- upvalues: v938 (ref), v937 (ref)
        if v938 == 1 then
            v937:override();
            v938 = 0;
        end;
    end;
    v260:add("destroy", "yazik_asembler", function()
        -- upvalues: v939 (ref)
        v939();
    end);
    local v940 = 0;
    local l_screen_center_1 = v67.screen_center;
    local l_sqrt_0 = math.sqrt;
    local l_pow_0 = math.pow;
    local function v948(v944, v945, v946, v947)
        -- upvalues: l_sqrt_0 (ref), l_pow_0 (ref)
        v944 = v944 / v947 - 1;
        return v946 * l_sqrt_0(1 - l_pow_0(v944, 2)) + v945;
    end;
    local _ = 0;
    v260:add("draw", "microsecond", function(v950, v951)
        -- upvalues: v67 (ref), v940 (ref), v948 (ref), v263 (ref), v939 (ref), v938 (ref), v937 (ref), v179 (ref), v619 (ref), l_vector_1 (ref), l_screen_center_1 (ref)
        v67.functions.scope_anim = 0;
        local v952 = false;
        local v953 = 0;
        if v951 then
            v952 = v950.m_bIsScoped;
            v940 = math.clamp(v940 + globals.frametime * (v952 and 3 or -7), 0, 1);
            if v67.menu_visible then
                if v952 then
                    v940 = 1;
                else
                    v940 = 0;
                end;
            end;
            v953 = v948(v940, 0, 1, 1);
            v67.functions.scope_anim = v953;
        end;
        if not v263.Visuals.custom_scope.main:get() or not v951 or not v951 then
            return v939();
        else
            if v938 == 0 then
                v938 = 1;
            end;
            if not v952 then
                return;
            elseif v953 == 0 then
                return;
            else
                v937:override("Remove All");
                local v954 = v263.Visuals.custom_scope.color1:get();
                local v955 = v263.Visuals.custom_scope.color2:get():alpha_modulate(0);
                v954 = v954:alpha_modulate(v954.a * v67.functions.scope_anim);
                v955 = v955:alpha_modulate(v955.a * v67.functions.scope_anim);
                local l_gap_0 = v179.custom_scope.gap;
                local v957 = v179.custom_scope.size * v953;
                v619.GradientBoxFilled(l_vector_1(l_screen_center_1.x, l_screen_center_1.y - l_gap_0), l_vector_1(l_screen_center_1.x + 1, l_screen_center_1.y - l_gap_0 - v957), v954, v954, v955, v955);
                v619.GradientBoxFilled(l_vector_1(l_screen_center_1.x, l_screen_center_1.y + l_gap_0 + 1), l_vector_1(l_screen_center_1.x + 1, l_screen_center_1.y + l_gap_0 + v957 + 1), v954, v954, v955, v955);
                v619.GradientBoxFilled(l_vector_1(l_screen_center_1.x - l_gap_0, l_screen_center_1.y), l_vector_1(l_screen_center_1.x - l_gap_0 - v957, l_screen_center_1.y + 1), v954, v955, v954, v955);
                v619.GradientBoxFilled(l_vector_1(l_screen_center_1.x + l_gap_0 + 1, l_screen_center_1.y), l_vector_1(l_screen_center_1.x + l_gap_0 + v957 + 1, l_screen_center_1.y + 1), v954, v955, v954, v955);
                return;
            end;
        end;
    end);
end)();
(function()
    -- upvalues: v314 (ref), v67 (ref), v681 (ref), l_ui_0 (ref), l_vector_1 (ref), v260 (ref), v178 (ref), v179 (ref), v876 (ref), v263 (ref), l_min_2 (ref), v139 (ref)
    local v958 = {
        [1] = {
            [1] = "DT", 
            [2] = nil, 
            [3] = 0, 
            [2] = v314.FindVar("Aimbot", "Ragebot", "Main", "Double Tap")
        }, 
        [2] = {
            [1] = "HS", 
            [2] = nil, 
            [3] = 0, 
            [2] = v314.FindVar("Aimbot", "Ragebot", "Main", "Hide Shots")
        }, 
        [3] = {
            [1] = "FD", 
            [2] = nil, 
            [3] = 0, 
            [2] = v314.FindVar("Aimbot", "Anti Aim", "Misc", "Fake Duck")
        }, 
        [4] = {
            [1] = "DMG", 
            [2] = 0, 
            [3] = 0
        }
    };
    local v959 = {};
    for _, v961 in ipairs(v958) do
        v959[v961[1]] = render.measure_text(2, "", v961[1]);
    end;
    local v962 = vector(28, 16);
    local v963 = vector((v67.screen_center.x + 10) / v67.screen_size.x, (v67.screen_center.y - 30) / v67.screen_size.y);
    local v964 = v681.add("damageindicator", v963, v962);
    local v965 = l_ui_0.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
    local v966 = 0;
    local _ = 0;
    local _ = 0;
    local _ = 0;
    local _ = 0;
    local _ = 0;
    local _ = 0;
    local _ = 0;
    local _ = 0;
    local v975 = {
        [1] = "IDLE", 
        [2] = "STAND", 
        [3] = "RUN", 
        [4] = "S.WALK", 
        [5] = "CROUCH", 
        [6] = "AIR", 
        [7] = "AIR", 
        [8] = "USE", 
        [9] = "FAKELAG"
    };
    local _ = l_vector_1(v67.screen_center.x, v67.screen_center.y + 20);
    local v977 = "";
    local _ = false;
    local _ = rage.antiaim;
    v260:add("prediction", "wapaduruduruwap 123", function(_, v981, _)
        -- upvalues: v178 (ref), v179 (ref), v977 (ref), v67 (ref), v975 (ref), v876 (ref), v263 (ref)
        if not v178.visuals or not v179.indicators.main then
            return;
        else
            v977 = v67.functions.safehead and "SAFE" or v67.functions.edge_yaw and "EDGE" or v975[v876(v981, not v263.AntiAim.enabled_Fakelagging:get())];
            return;
        end;
    end);
    local function v994(v983, v984, v985, v986, v987, v988)
        local v989 = #v988;
        local v990 = "";
        local v991 = nil;
        for v992 = 1, v989 do
            local v993 = v988:sub(v992, v992);
            v990 = v990 .. ("\a%s%s"):format(v983:lerp(v984, v992 / v989):to_hex(), v993);
        end;
        render.text(v986, v985, color(), v987, v990);
        return v991;
    end;
    local function v1009(v995, v996, v997, v998, v999, v1000, v1001)
        local v1002 = 0;
        local v1003 = #v1000;
        local v1004 = math.ceil(v1003 / 2);
        local v1005 = nil;
        for v1006 = 1, v1003 do
            local v1007 = v1000:sub(v1006, v1006);
            local v1008 = v995:lerp(v996, v1006 / v1003);
            if not v1001 then
                render.text(v998, v997 + vector(v1002, 0), v1008, v999, v1007);
                v1002 = v1002 + render.measure_text(v998, v999, v1007).x - 1;
            end;
            if v1006 == v1004 then
                v1005 = {
                    [1] = v995:lerp(v996, (v1006 - 1) / v1003), 
                    [2] = v1008
                };
            end;
        end;
        return v1005;
    end;
    local function v1013(v1010, v1011, v1012)
        -- upvalues: l_min_2 (ref)
        return l_min_2(v1010, (v1010 + (v1012 or 1)) * v1011);
    end;
    local v1014 = 0;
    local v1015 = 0;
    local v1016 = 0;
    local _ = 28.5;
    local v1018 = "ACIDTECH ";
    local v1019 = {
        color(), 
        color()
    };
    local v1020 = 9;
    local v1021 = render.measure_text(2, "", v1018);
    local v1022 = render.measure_text(2, "", "DT");
    local v1023 = v67.screen_center + vector(1, 20);
    local v1024 = 0;
    local v1025 = 0;
    local v1026 = "";
    local v1027 = 0;
    local v1028 = 0;
    local _ = 0;
    v260:add("draw", "wapaduruduruwap", function(v1030, v1031)
        -- upvalues: v178 (ref), v179 (ref), v966 (ref), v139 (ref), v1014 (ref), v1015 (ref), v1016 (ref), v1013 (ref), v67 (ref), v1023 (ref), v1027 (ref), v1021 (ref), v1019 (ref), v263 (ref), v1009 (ref), v1020 (ref), v1018 (ref), v1028 (ref), v977 (ref), v994 (ref), l_ui_0 (ref), v958 (ref), v959 (ref), v1022 (ref), v964 (ref), v965 (ref), v1024 (ref), v1026 (ref), v1025 (ref)
        local v1032 = 0;
        local v1033 = 0.045;
        local v1034 = -1;
        if v178.visuals and v179.indicators.main and v1031 then
            v1032 = 1;
            local v1035 = v1030:get_player_weapon();
            if v1035 then
                local v1036 = v1035:get_weapon_info();
                v1034 = v1036.weapon_type;
                if v1036 and v1034 == 9 then
                    v1032 = 0.4;
                    v1033 = 0.15;
                end;
            end;
        end;
        v966 = v139(v966, v1032, v1033, 0.01);
        if v966 < 0.01 then
            return;
        else
            v1014 = (v1014 + globals.frametime * 1) % 1;
            if v1015 - v1014 > 0.9 then
                v1016 = v1016 + 1;
            end;
            v1015 = v1014;
            local v1037 = v1016 % 4 + 1;
            local v1038 = nil;
            local v1039 = nil;
            if v1037 == 1 then
                v1038 = v1014;
                v1039 = 0;
            elseif v1037 == 2 then
                v1038 = 1;
                v1039 = v1014;
            elseif v1037 == 3 then
                v1038 = 1 - v1014;
                v1039 = 1;
            elseif v1037 == 4 then
                v1038 = 0;
                v1039 = 1 - v1014;
            end;
            local v1040 = 0;
            local v1041 = true;
            local v1042 = v1013(not v1041 and 15 or 35, v67.functions.scope_anim, 3);
            local v1043 = vector(v1042, 0);
            local v1044 = v1042 / (not v1041 and 15 or 35);
            local l_v1023_0 = v1023;
            local v1046 = color(0, 0, 0, 255);
            local v1047 = color(0, 0, 0, 0);
            local v1048 = true;
            if v1027 > 0.01 then
                render.shadow(l_v1023_0 - vector(v1021.x / 2, 1) + v1043, l_v1023_0 + vector(v1021.x / 2, -1) + v1043, color(v1019[1].r, v1019[1].g, v1019[1].b, 190 * v966 * v1027), 40 + v1046:lerp(v1047, v1038).a / 25.5, 0);
            end;
            local v1049 = v966 * 255;
            local v1050 = v263.Visuals.indicators.colorushka:get():alpha_modulate(v1049 * v1027);
            local v1051 = v263.Visuals.indicators.color1:get():alpha_modulate(v1049 * v1027);
            v1019 = v1009(v1050:lerp(v1051, v1038), v1051:lerp(v1050, v1039), l_v1023_0 + vector(-v1021.x / 2 - 3, v1040 * v1020 - v1021.y / 2) + v1043, 2, "", v1018, v1027 < 0.01);
            v1027 = v139(v1027, v1041 and 1 or 0, 0.05);
            if v1027 > 0.1 then
                v1040 = v1040 + 1;
            end;
            local v1052 = v263.Visuals.indicators.color2:get():alpha_modulate(v1049);
            v1028 = v139(v1028, true and 1 or 0, 0.05);
            if v1028 > 0.01 then
                local v1053 = -render.measure_text(2, "", v977).x / 2 * (1 - v1044) + 13 * v1044;
                if v1048 then
                    v994(v1019[1]:alpha_modulate(v1049 * v1028), v1019[2]:alpha_modulate(v1049 * v1028), l_v1023_0 + vector(v1053, v1040 * v1020 - 6), 2, "", v977);
                else
                    render.text(2, l_v1023_0 + vector(0, v1040 * v1020), v1052:alpha_modulate(v1049 * v1028), "", v977);
                end;
                v1040 = v1040 + 1;
                local v1054 = false;
                local v1055 = l_ui_0.get_binds();
                for _, v1057 in pairs(v1055) do
                    if v1057.name == "Min. Damage" then
                        v1054 = v1057.active;
                        break;
                    end;
                end;
                local v1058 = v1040 * v1020;
                for v1059 = 1, #v958 do
                    local v1060 = v958[v1059];
                    local v1061 = v1049 * v1060[3] * v1028;
                    local v1062 = -v959[v1060[1]].x / 2 * (1 - v1044) + 13 * v1044;
                    if v1060[1] == "DT" then
                        local v1063 = rage.exploit:get();
                        local v1064 = -v1022.x / 2 * (1 - v1044) + 13 * v1044;
                        if v1034 ~= 9 or v1063 ~= 1 then
                            render.text(2, l_v1023_0 + vector(v1064, v1058 - 6), color(255, 100, 100, 0.7 * v1061), "", "DT");
                        end;
                        render.push_clip_rect(l_v1023_0 + vector(v1064, v1058 - 6), l_v1023_0 + vector(-v1022.x / 2 + v1063 * (v1022.x / 2 + 12) + 13 * v1044, v1058 + 6));
                        if not v1048 then
                            render.text(2, l_v1023_0 + vector(0, v1058 - 6), v1052:alpha_modulate(v1063 * v1061), "", "DT");
                        else
                            v994(v1019[1]:alpha_modulate(v1061), v1019[2]:alpha_modulate(v1061), l_v1023_0 + vector(v1064, v1058 - 6), 2, "", "DT");
                        end;
                        render.pop_clip_rect();
                    elseif v1060[3] ~= 0 then
                        if not v1048 then
                            render.text(2, l_v1023_0 + vector(0, v1058), v1052:alpha_modulate(v1061), "", v1060[1]);
                        else
                            v994(v1019[1]:alpha_modulate(v1061), v1019[2]:alpha_modulate(v1061), l_v1023_0 + vector(v1062, v1058 - 6), 2, "", v1060[1]);
                        end;
                    end;
                    local v1065 = 0;
                    if v1060[1] == "DMG" then
                        v1065 = v1054 and 1 or 0;
                    elseif v1060[1] == "BAIM" then
                        v1065 = v1060[2]:get() == v1060[4] and 1 or 0;
                    elseif v1060[4] ~= nil then
                        v1065 = v1060[2]:get() == v1060[4] and 1 or 0;
                    else
                        v1065 = v1060[2]:get() and 1 or 0;
                    end;
                    v1060[3] = v139(v1060[3], v1065, 0.1, 0.05);
                    v1058 = v1058 + v1013(9, v1060[3]);
                end;
            end;
            local v1066 = v263.Visuals.indicators.show_damage:get();
            local v1067 = true;
            if v1066 then
                v964:process();
                local v1068 = v965:get();
                v1024 = v139(v1024, v1068, 0.4, 0.5);
                local l_position_2 = v964.position;
                if v1031 and v1034 ~= -1 then
                    local l_v1034_0 = v1034;
                    if l_v1034_0 == 0 or l_v1034_0 == 9 or l_v1034_0 == 7 or v1030.m_flNextAttack - 0.7 > globals.curtime then
                        v1067 = false;
                    end;
                end;
                local v1071 = "";
                local v1072 = l_ui_0.get_alpha();
                if not v1067 then
                    if v1072 ~= 0 then
                        v1067 = true;
                        v1071 = "AUTO";
                    else
                        v1071 = v1026;
                    end;
                else
                    v1071 = v1068 == 0 and "AUTO" or v1068 > 100 and string.format("HP+%d", v1068 - 100) or tostring(math.ceil(v1024));
                    v1026 = v1071;
                end;
                local v1073 = vector(17 + render.measure_text(2, "", v1071).x, 24);
                v964.size = v1073;
                local v1074 = v1019[2]:alpha_modulate(v1049 * v1025);
                if v1074.a ~= 0 then
                    render.text(2, l_position_2 + vector(9, 6), v1074, "", v1071);
                end;
                local v1075 = v1072 * 50 * v966 * v1025;
                if v1075 ~= 0 then
                    render.rect_outline(l_position_2, l_position_2 + v1073, color():alpha_modulate(v1075), 0, 8);
                end;
            end;
            v1025 = v139(v1025, v1066 and v1067 and 1 or 0, 0.125);
            return;
        end;
    end);
end)();
(function()
    -- upvalues: v67 (ref), v681 (ref), l_ui_0 (ref), v179 (ref), v139 (ref), v16 (ref), v260 (ref), v178 (ref), v263 (ref)
    local v1076 = nil;
    local v1077 = {};
    local v1078 = {};
    local v1079 = vector((v67.screen_center.x - 165) / v67.screen_size.x, (v67.screen_size.y - v67.screen_size.y / 3.5) / v67.screen_size.y);
    local v1080 = vector(330, 120);
    local v1081 = v681.add("aimlog", v1079, v1080);
    local v1082 = color();
    local v1083 = {
        hit = l_ui_0.get_icon("vector-circle") .. " ", 
        burn = l_ui_0.get_icon("fire") .. " ", 
        miss = l_ui_0.get_icon("circle-xmark") .. " ", 
        spread = l_ui_0.get_icon("spinner") .. " ", 
        unregistered = l_ui_0.get_icon("satellite-dish") .. " "
    };
    local v1084 = {
        [1] = {
            data = {
                [1] = {
                    [1] = nil, 
                    [2] = "Hit ", 
                    [1] = v1082
                }, 
                [2] = {
                    [1] = "hit", 
                    [2] = "vladislav"
                }, 
                [3] = {
                    [1] = nil, 
                    [2] = " for ", 
                    [1] = v1082
                }, 
                [4] = {
                    [1] = "hit", 
                    [2] = 10
                }, 
                [5] = {
                    [1] = nil, 
                    [2] = " damage", 
                    [1] = v1082
                }
            }, 
            timers = {
                alpha = 1, 
                remove = math.huge, 
                remove_log = math.huge
            }
        }, 
        [2] = {
            data = {
                [1] = {
                    [1] = nil, 
                    [2] = "Hit ", 
                    [1] = v1082
                }, 
                [2] = {
                    [1] = "hit", 
                    [2] = "monster"
                }, 
                [3] = {
                    [1] = nil, 
                    [2] = " in the ", 
                    [1] = v1082
                }, 
                [4] = {
                    [1] = "hit", 
                    [2] = "head"
                }, 
                [5] = {
                    [1] = nil, 
                    [2] = " for ", 
                    [1] = v1082
                }, 
                [6] = {
                    [1] = "hit", 
                    [2] = 103
                }, 
                [7] = {
                    [1] = nil, 
                    [2] = " damage", 
                    [1] = v1082
                }
            }, 
            timers = {
                alpha = 1, 
                remove = math.huge, 
                remove_log = math.huge
            }
        }, 
        [3] = {
            data = {
                [1] = {
                    [1] = nil, 
                    [2] = "Missed shot due to ", 
                    [1] = v1082
                }, 
                [2] = {
                    [1] = "miss", 
                    [2] = "correction"
                }
            }, 
            timers = {
                alpha = 1, 
                remove = math.huge, 
                remove_log = math.huge
            }
        }, 
        [4] = {
            data = {
                [1] = {
                    [1] = nil, 
                    [2] = "Missed shot due to ", 
                    [1] = v1082
                }, 
                [2] = {
                    [1] = "miss", 
                    [2] = "prediction error"
                }
            }, 
            timers = {
                alpha = 1, 
                remove = math.huge, 
                remove_log = math.huge
            }
        }, 
        [5] = {
            data = {
                [1] = {
                    [1] = nil, 
                    [2] = "Missed shot due to ", 
                    [1] = v1082
                }, 
                [2] = {
                    [1] = "miss", 
                    [2] = "lagcomp failure"
                }
            }, 
            timers = {
                alpha = 1, 
                remove = math.huge, 
                remove_log = math.huge
            }
        }, 
        [6] = {
            data = {
                [1] = {
                    [1] = nil, 
                    [2] = "Missed shot due to ", 
                    [1] = v1082
                }, 
                [2] = {
                    [1] = "spread", 
                    [2] = "spread"
                }
            }, 
            timers = {
                alpha = 1, 
                remove = math.huge, 
                remove_log = math.huge
            }
        }, 
        [7] = {
            data = {
                [1] = {
                    [1] = nil, 
                    [2] = "Missed shot due to ", 
                    [1] = v1082
                }, 
                [2] = {
                    [1] = "unregistered", 
                    [2] = "unregistered shot"
                }
            }, 
            timers = {
                alpha = 1, 
                remove = math.huge, 
                remove_log = math.huge
            }
        }, 
        [8] = {
            data = {
                [1] = {
                    [1] = nil, 
                    [2] = "Missed shot due to ", 
                    [1] = v1082
                }, 
                [2] = {
                    [1] = "unregistered", 
                    [2] = "player death"
                }
            }, 
            timers = {
                alpha = 1, 
                remove = math.huge, 
                remove_log = math.huge
            }
        }, 
        [9] = {
            data = {
                [1] = {
                    [1] = nil, 
                    [2] = "Missed shot due to ", 
                    [1] = v1082
                }, 
                [2] = {
                    [1] = "unregistered", 
                    [2] = "death"
                }
            }, 
            timers = {
                alpha = 1, 
                remove = math.huge, 
                remove_log = math.huge
            }
        }
    };
    local v1085 = 0;
    local v1086 = 0;
    local function v1108(v1087, v1088, v1089, v1090, _, v1092, v1093)
        -- upvalues: v179 (ref), v1083 (ref), v1082 (ref), v139 (ref), v16 (ref)
        local v1094 = v1087.timers.alpha * 255 * (v1093 or 1);
        local v1095 = "";
        local l_data_0 = v1087.data;
        local v1097 = #l_data_0;
        local v1098 = l_data_0[2][2]:find("Burned ") and v1089 < v1087.timers.shadow_pulse;
        local v1099 = nil;
        local v1100 = nil;
        local v1101 = 0;
        local v1102 = 0;
        local v1103 = 0;
        for v1104 = 1, v1097 do
            local v1105 = l_data_0[v1104];
            if v1104 == 1 and not v1092 then
                v1099 = v1105[1]:alpha_modulate(v1094);
            elseif v1104 == 2 and v1092 then
                v1099 = v179.log_aimbot[v1105[1]]:alpha_modulate(v1094);
            end;
            if v1098 then
                if v1104 == 5 then
                    v1101 = render.measure_text(1, "", v1095).x;
                elseif v1104 == 6 then
                    v1102 = render.measure_text(1, "", v1095).x - v1101;
                end;
            end;
            if v1092 and type(v1105[1]) == "string" then
                v1100 = v1105[1];
                v1095 = v1095 .. "\a" .. v179.log_aimbot[v1105[1]]:alpha_modulate(v1094):to_hex() .. v1105[2] .. "\aDEFAULT";
            else
                v1095 = v1095 .. "\a" .. v1105[1]:alpha_modulate(v1094):to_hex() .. v1105[2] .. "\aDEFAULT";
            end;
        end;
        if v1094 ~= 0 then
            if v1092 then
                v1095 = (string.format("\a%s%s\aDEFAULT", v1099.alpha_modulate(v1099, v1094):to_hex(), v1083[v1100]) or "") .. v1095;
            end;
            v1103 = render.measure_text(1, "", v1095).x / 2;
            render.shadow(v1088 - vector(v1103, -6 - v1090), v1088 + vector(v1103, 6 + v1090), v1099, 30 * v1099.a / 255, 0, 0);
            if v1098 then
                local v1106 = v1087.timers.shadow_pulse - v1089;
                local v1107 = vector(v1088.x + v1101 - v1103, v1088.y + v1090 + 7);
                render.shadow(v1107, v1107 + vector(v1102, 0), v1099, 50 * v1099.a / 255 * v1106, 0, 10);
            end;
            render.text(1, vector(v1088.x - v1103, v1088.y + v1090), v1082, "", v1095);
        end;
        v1087.timers.alpha = v139(v1087.timers.alpha, v1089 < v1087.timers.remove and 1 or 0, 0.1);
        return v16(13, v1087.timers.alpha, 3);
    end;
    v260:add("draw", "alt logs", function(_, _)
        -- upvalues: v178 (ref), v179 (ref), v1085 (ref), v139 (ref), v1077 (ref), v1078 (ref), l_ui_0 (ref), v1076 (ref), v1081 (ref), v67 (ref), v1086 (ref), v1080 (ref), v1084 (ref), v1108 (ref)
        local v1111 = v178.visuals and v179.log_aimbot.main;
        v1085 = v139(v1085, v1111 and 1 or 0, 0.1);
        if v1085 == 0 then
            local v1112 = {};
            v1078 = {};
            v1077 = v1112;
            return;
        else
            local v1113 = l_ui_0.get_alpha();
            if v1113 ~= 1 then
                v1085 = v1113;
            end;
            local l_shadow_0 = v179.log_aimbot.shadow;
            if v1113 == 1 and v179.log_aimbot.preview or not v1076 then
                local v1115 = v1081:process();
                if v1115.is_in_b and v1115.is_rmb_pressed then
                    v1115.position.x = v67.screen_center.x - 165;
                end;
                v1076 = v1115.position;
                v1086 = v139(v1086, (not v1115.is_in_b or v1115.dragging) and 0 or 1, 0.06);
                if v1085 * v1086 ~= 0 then

                end;
            end;
            local v1116 = v1076 + vector(165, 0);
            local l_realtime_1 = globals.realtime;
            if v1085 ~= 0 and v179.log_aimbot.preview then
                render.rect_outline(v1076, v1076 + v1080, color(255, 50 * v1085), 0, 8);
                local v1118 = 0;
                for v1119 = 1, #v1084 do
                    local v1120 = v1084[v1119];
                    v1118 = v1118 + v1108(v1120, v1116, l_realtime_1, v1118, l_shadow_0, true, v1085);
                end;
                return;
            else
                local v1121 = 0;
                for v1122 = 1, #v1077 do
                    local v1123 = v1077[v1122];
                    v1121 = v1121 + v1108(v1123, v1116, l_realtime_1, v1121, l_shadow_0);
                end;
                return;
            end;
        end;
    end);
    local _ = color(125, 255, 125);
    local v1125 = {
        knife = "Stabbed ", 
        smokegrenade = "Smoked ", 
        snowball = "Snowballed ", 
        taser = "Tased ", 
        hegrenade = "Naded "
    };
    local v1126 = {
        [1] = "generic", 
        [2] = "head", 
        [3] = "chest", 
        [4] = "stomach", 
        [5] = "left arm", 
        [6] = "right arm", 
        [7] = "left leg", 
        [8] = "right leg", 
        [9] = "?"
    };
    local function v1133(v1127)
        -- upvalues: v1077 (ref)
        if not v1127 then
            v1127 = 0;
        end;
        local v1128 = 0;
        local v1129 = {};
        for v1130 = 1, #v1077 do
            local v1131 = v1077[v1130];
            if v1131.timers.alpha > 0 then
                v1128 = v1128 + 1;
                v1129[#v1129 + 1] = v1131;
            end;
        end;
        if v1128 > 9 then
            for v1132 = 1, v1128 - 8 + v1127 do
                v1129[v1132].timers.remove = 0;
            end;
        end;
    end;
    local v1134 = {
        inferno = l_ui_0.get_icon("fire") .. " ", 
        taser = l_ui_0.get_icon("bolt") .. " ", 
        hegrenade = l_ui_0.get_icon("burst") .. " ", 
        knife = l_ui_0.get_icon("fork-knife") .. " "
    };
    local v1135 = 0;
    local v1136 = 0;
    v260:add("player_hurt", "alt logs hurt", function(v1137, v1138, v1139)
        -- upvalues: v178 (ref), v179 (ref), v1136 (ref), v1135 (ref), v1134 (ref), v1083 (ref), v1078 (ref), v1077 (ref), v1082 (ref), v1133 (ref), v1125 (ref), v1126 (ref)
        if not v178.visuals or not v179.log_aimbot.main or not v1139 then
            return;
        else
            local v1140 = entity.get(v1137.userid, true);
            local v1141 = entity.get(v1137.attacker, true);
            if v1140 == nil or v1141 == nil or v1140 == v1141 or v1141 ~= v1138 then
                return;
            else
                local l_tickcount_0 = globals.tickcount;
                if v1136 ~= l_tickcount_0 then
                    v1136 = l_tickcount_0;
                else
                    v1135 = v1135 + 1;
                end;
                local l_weapon_0 = v1137.weapon;
                local l_hit_0 = v179.log_aimbot.hit;
                local v1145 = v1134[l_weapon_0] or v1083.hit or "";
                local v1146 = v1140:get_name();
                if l_weapon_0 == "inferno" then
                    local l_tickcount_1 = globals.tickcount;
                    local v1148 = v1078[v1146];
                    if not v1148 then
                        v1078[v1146] = {
                            all_damage = 0, 
                            tick = l_tickcount_1
                        };
                        v1148 = v1078[v1146];
                    end;
                    if l_tickcount_1 - v1148.tick > 50 then
                        v1148.all_damage = 0;
                    end;
                    v1148.tick = l_tickcount_1;
                    v1148.all_damage = v1148.all_damage + v1137.dmg_health;
                    local v1149 = nil;
                    table.foreach(v1077, function(v1150, v1151)
                        -- upvalues: v1146 (ref), v1149 (ref), v1077 (ref)
                        if v1151.data[2][2] == "Burned " and v1151.data[3][2] == v1146 then
                            v1149 = v1077[v1150];
                        end;
                    end);
                    if not v1149 then
                        v1077[#v1077 + 1] = {
                            data = {
                                [1] = {
                                    [1] = l_hit_0, 
                                    [2] = v1145
                                }, 
                                [2] = {
                                    [1] = nil, 
                                    [2] = "Burned ", 
                                    [1] = v1082
                                }, 
                                [3] = {
                                    [1] = l_hit_0, 
                                    [2] = v1146
                                }, 
                                [4] = {
                                    [1] = nil, 
                                    [2] = " for ", 
                                    [1] = v1082
                                }, 
                                [5] = {
                                    l_hit_0, 
                                    tostring(v1148.all_damage)
                                }, 
                                [6] = {
                                    [1] = nil, 
                                    [2] = " damage", 
                                    [1] = v1082
                                }
                            }, 
                            timers = {
                                alpha = 0, 
                                remove = math.huge, 
                                shadow_pulse = globals.realtime + 0.5, 
                                remove_log = globals.realtime + 7
                            }
                        };
                        v1149 = v1077[#v1077];
                    end;
                    v1149.data[5][2] = tostring(v1148.all_damage);
                    v1149.timers.remove = globals.realtime + 6;
                    v1149.timers.remove_log = globals.realtime + 7;
                    v1149.timers.shadow_pulse = globals.realtime + 0.5;
                    v1133();
                    return;
                elseif v1125[l_weapon_0] ~= nil then
                    v1077[#v1077 + 1] = {
                        data = {
                            [1] = {
                                [1] = l_hit_0, 
                                [2] = v1145
                            }, 
                            [2] = {
                                [1] = v1082, 
                                [2] = v1125[l_weapon_0]
                            }, 
                            [3] = {
                                [1] = l_hit_0, 
                                [2] = v1146
                            }, 
                            [4] = {
                                [1] = nil, 
                                [2] = " for ", 
                                [1] = v1082
                            }, 
                            [5] = {
                                l_hit_0, 
                                tostring(v1137.dmg_health)
                            }, 
                            [6] = {
                                [1] = nil, 
                                [2] = " damage", 
                                [1] = v1082
                            }
                        }, 
                        timers = {
                            alpha = 0, 
                            remove = globals.realtime + 6, 
                            remove_log = globals.realtime + 7
                        }
                    };
                    v1133();
                    return;
                else
                    local l_hitgroup_1 = v1137.hitgroup;
                    if l_hitgroup_1 == 0 then
                        v1077[#v1077 + 1] = {
                            data = {
                                [1] = {
                                    [1] = l_hit_0, 
                                    [2] = v1145
                                }, 
                                [2] = {
                                    [1] = nil, 
                                    [2] = "Hit ", 
                                    [1] = v1082
                                }, 
                                [3] = {
                                    [1] = l_hit_0, 
                                    [2] = v1146
                                }, 
                                [4] = {
                                    [1] = nil, 
                                    [2] = " for ", 
                                    [1] = v1082
                                }, 
                                [5] = {
                                    l_hit_0, 
                                    tostring(v1137.dmg_health)
                                }, 
                                [6] = {
                                    [1] = nil, 
                                    [2] = " damage", 
                                    [1] = v1082
                                }
                            }, 
                            timers = {
                                alpha = 0, 
                                remove = globals.realtime + 6, 
                                remove_log = globals.realtime + 7
                            }
                        };
                    else
                        v1077[#v1077 + 1] = {
                            data = {
                                [1] = {
                                    [1] = l_hit_0, 
                                    [2] = v1145
                                }, 
                                [2] = {
                                    [1] = nil, 
                                    [2] = "Hit ", 
                                    [1] = v1082
                                }, 
                                [3] = {
                                    [1] = l_hit_0, 
                                    [2] = v1146
                                }, 
                                [4] = {
                                    [1] = nil, 
                                    [2] = " in the ", 
                                    [1] = v1082
                                }, 
                                [5] = {
                                    [1] = l_hit_0, 
                                    [2] = v1126[l_hitgroup_1 + 1]
                                }, 
                                [6] = {
                                    [1] = nil, 
                                    [2] = " for ", 
                                    [1] = v1082
                                }, 
                                [7] = {
                                    l_hit_0, 
                                    tostring(v1137.dmg_health)
                                }, 
                                [8] = {
                                    [1] = nil, 
                                    [2] = " damage", 
                                    [1] = v1082
                                }
                            }, 
                            timers = {
                                alpha = 0, 
                                remove = globals.realtime + 6, 
                                remove_log = globals.realtime + 7
                            }
                        };
                    end;
                    v1133();
                    return;
                end;
            end;
        end;
    end);
    v260:add("cs_game_disconnected", "Log aimbot clean", function(_)
        -- upvalues: v1077 (ref)
        v1077 = {};
    end);
    v260:add("round_prestart", "Log aimbot clean 1", function(_)
        -- upvalues: v1077 (ref)
        v1077 = {};
    end);
    local v1155 = {
        spread = "spread", 
        correction = "miss", 
        ["damage rejection"] = "miss", 
        ["player misprediction"] = "miss", 
        ["backtrack failure"] = "miss", 
        ["unregistered shot"] = "unregistered", 
        death = "unregistered", 
        ["player death"] = "unregistered", 
        ["lagcomp failure"] = "miss", 
        ["jitter correction"] = "miss", 
        ["prediction error"] = "miss"
    };
    local v1156 = {
        misprediction = "jitter correction"
    };
    v260:add("aim_ack", "logs aim", function(v1157)
        -- upvalues: v178 (ref), v179 (ref), v1155 (ref), v263 (ref), v1156 (ref), v1083 (ref), v1077 (ref), v1082 (ref), v1133 (ref)
        if not v178.visuals or not v179.log_aimbot.main then
            return;
        else
            local l_target_0 = v1157.target;
            if not l_target_0 or l_target_0 == nil or not v1157.state then
                return;
            elseif not v1157.wanted_damage or v1157.wanted_damage == 0 then
                return;
            else
                local v1159 = v1155[v1157.state];
                local v1160 = v263.Visuals.log_aimbot[v1159];
                if not v1160 then
                    return;
                else
                    local v1161 = v1156[v1157.state] or v1157.state;
                    local v1162 = v1160:get();
                    local v1163 = v1083[v1159] or "";
                    v1077[#v1077 + 1] = {
                        data = {
                            [1] = {
                                [1] = v1162, 
                                [2] = v1163
                            }, 
                            [2] = {
                                [1] = nil, 
                                [2] = "Missed shot due to ", 
                                [1] = v1082
                            }, 
                            [3] = {
                                [1] = v1162, 
                                [2] = v1161
                            }
                        }, 
                        timers = {
                            alpha = 0, 
                            remove = globals.realtime + 6, 
                            remove_log = globals.realtime + 7
                        }
                    };
                    v1133();
                    return;
                end;
            end;
        end;
    end);
end)();
v881 = {
    yaw_base = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    yaw_base1 = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    yaw_add = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    freestand = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Freestanding")
};
(function()
    -- upvalues: v67 (ref), v260 (ref), v139 (ref), v178 (ref), v179 (ref), v263 (ref)
    local v1164 = {
        [1] = {
            vector(55, 2), 
            vector(42, -7), 
            vector(42, 11)
        }, 
        [2] = {
            vector(-54, 2), 
            vector(-41, -7), 
            vector(-41, 11)
        }
    };
    local v1165 = 0;
    local v1166 = v67.screen_center + vector(0, -1);
    local v1167 = 0;
    local v1168 = 0;
    local v1169 = 0;
    local v1170 = 0;
    local l_poly_0 = render.poly;
    local l_antiaim_1 = rage.antiaim;
    local v1173 = color(0, 0, 0, 90);
    v260:add("draw", "manuali", function(_, v1175)
        -- upvalues: v1165 (ref), v139 (ref), v178 (ref), v179 (ref), v67 (ref), l_antiaim_1 (ref), v263 (ref), v1167 (ref), v1168 (ref), v1169 (ref), v1170 (ref), v1173 (ref), l_poly_0 (ref), v1166 (ref), v1164 (ref)
        v1165 = v139(v1165, v178.visuals and v179.manual_strelki.main and v67.functions.scope_anim < 0.3 and v1175 and 1 or 0, 0.1, 0.01);
        if v1165 < 0.01 then
            return;
        else
            local v1176 = l_antiaim_1:inverter();
            local v1177 = v263.AntiAim.manual_strelki.color:get():alpha_modulate(255);
            local l_manual_yb_0 = v179.manual_yb;
            local v1179 = l_manual_yb_0 == "Right";
            local v1180 = l_manual_yb_0 == "Left";
            v1167 = v139(v1167, v1179 and 1 or 0, 0.1, 0.05);
            v1168 = v139(v1168, v1180 and 1 or 0, 0.1, 0.05);
            v1169 = v139(v1169, v1176 and 1 or 0, 0.1, 0.05);
            v1170 = v139(v1170, not v1176 and 1 or 0, 0.1, 0.05);
            local v1181 = v1173:lerp(v1177, v1167);
            local v1182 = v1173:lerp(v1177, v1168);
            local v1183 = v1173:lerp(v1177, v1169);
            local v1184 = v1173:lerp(v1177, v1170);
            l_poly_0(v1181:alpha_modulate(v1181.a * v1165), v1166 + v1164[1][1], v1166 + v1164[1][2], v1166 + v1164[1][3]);
            l_poly_0(v1182:alpha_modulate(v1182.a * v1165), v1166 + v1164[2][1], v1166 + v1164[2][2], v1166 + v1164[2][3]);
            render.rect(v1166 + vector(38, -7), v1166 + vector(40, 11), v1183:alpha_modulate(v1183.a * v1165));
            render.rect(v1166 + vector(-39, -7), v1166 + vector(-37, 11), v1184:alpha_modulate(v1184.a * v1165));
            return;
        end;
    end);
end)();
(function()
    -- upvalues: v401 (ref), v178 (ref), v263 (ref), v260 (ref)
    local l_r_aspectratio_0 = cvar.r_aspectratio;
    local v1186 = false;
    local function v1187()
        -- upvalues: v1186 (ref), l_r_aspectratio_0 (ref), v401 (ref)
        if v1186 then
            l_r_aspectratio_0:float(v401.r_aspectratio);
            v1186 = false;
        end;
    end;
    local function v1189()
        -- upvalues: v178 (ref), v263 (ref), v401 (ref), l_r_aspectratio_0 (ref), v1186 (ref), v1187 (ref)
        local v1188 = v178.misc and v263.Misc.aspect_ratio.main:Get() and v263.Misc.aspect_ratio.ratio:Get() / 100 or v401.r_aspectratio;
        l_r_aspectratio_0:float(v1188);
        if v1188 == 0.5 then
            v1186 = true;
            v1187();
        else
            v1186 = v1188 ~= 1;
        end;
    end;
    v260:add("draw", "aspect_ratio", function()
        -- upvalues: v178 (ref), v1187 (ref)
        if not v178.misc then
            return v1187();
        else
            return;
        end;
    end);
    v263.Misc.main:RegisterCallback(v1189);
    v263.Misc.aspect_ratio.main:RegisterCallback(v1189);
    v263.Misc.aspect_ratio.ratio:RegisterCallback(v1189);
    v1189();
    v260:add("destroy", "aspect_ratio 1", v1187);
end)();
local function v1191(v1190)
    while v1190 > 180 do
        v1190 = v1190 - 360;
    end;
    while v1190 < -180 do
        v1190 = v1190 + 360;
    end;
    return v1190;
end;
(function()
    -- upvalues: v314 (ref), v260 (ref), l_min_2 (ref), l_abs_1 (ref), v67 (ref), l_ui_0 (ref), v263 (ref), v179 (ref), l_functions_0 (ref), v1191 (ref), v876 (ref), v178 (ref), v405 (ref), v143 (ref)
    local v1192 = {
        [1] = "Global", 
        [2] = "Standing", 
        [3] = "Moving", 
        [4] = "Slowwalking", 
        [5] = "Ducking", 
        [6] = "Jumping", 
        [7] = "CrouchingAir", 
        [8] = "LegitAA", 
        [9] = "Fakelagging"
    };
    local v1193 = {
        pitch = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Pitch"), 
        yaw_base = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw"), 
        yaw_base1 = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
        yaw_defen = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
        yaw_add = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
        fakeopt = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
        free_dsy = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
        yaw_mod = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
        yaw_mod_d = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
        freestand = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
        limit1 = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
        limit2 = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
        body_yaw = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Body Yaw")
    };
    local v1194 = {
        [1] = false, 
        [2] = false, 
        [3] = false
    };
    local v1195 = {
        [1] = {
            limit1 = 0, 
            pitch = 0, 
            limit2 = 0, 
            freestand = 0, 
            yaw_add = 0, 
            yaw_mod_d = 0, 
            yaw_mod = 0, 
            free_dsy = 0, 
            fakeopt = 0, 
            yaw_defen = 0
        }, 
        [2] = {
            limit1 = 0, 
            pitch = 0, 
            limit2 = 0, 
            freestand = 0, 
            yaw_add = 0, 
            yaw_mod_d = 0, 
            yaw_mod = 0, 
            free_dsy = 0, 
            fakeopt = 0, 
            yaw_defen = 0
        }, 
        [3] = {
            limit1 = 0, 
            pitch = 0, 
            limit2 = 0, 
            freestand = 0, 
            yaw_add = 0, 
            yaw_mod_d = 0, 
            yaw_mod = 0, 
            free_dsy = 0, 
            fakeopt = 0, 
            yaw_defen = 0
        }, 
        [4] = {
            limit1 = 0, 
            pitch = 0, 
            limit2 = 0, 
            freestand = 0, 
            yaw_add = 0, 
            yaw_mod_d = 0, 
            yaw_mod = 0, 
            free_dsy = 0, 
            fakeopt = 0, 
            yaw_defen = 0
        }
    };
    local v1196 = 1;
    local v1197 = 1;
    local _ = 0;
    local function v1202(v1199)
        -- upvalues: v1194 (ref), v1193 (ref), v1195 (ref)
        if v1194[v1199] then
            return;
        else
            for v1200, v1201 in pairs(v1193) do
                v1195[v1199][v1200] = v1201:get();
            end;
            v1194[v1199] = true;
            return;
        end;
    end;
    local function v1206(v1203)
        -- upvalues: v1194 (ref), v1193 (ref)
        if not v1194[v1203] then
            return;
        else
            for _, v1205 in pairs(v1193) do
                v1205:override();
            end;
            v1194[v1203] = false;
            return;
        end;
    end;
    v260:add("destroy", "cond aas dest", function()
        -- upvalues: v1206 (ref), v1193 (ref)
        v1206(1);
        v1206(2);
        v1206(3);
        v1206(4);
        v1193.yaw_base:override();
        v1193.yaw_base1:override();
        v1193.freestand:override();
        v1193.pitch:override();
        v1193.yaw_add:override();
        v1193.body_yaw:override();
    end);
    local l_antiaim_2 = rage.antiaim;
    local function _()
        -- upvalues: l_min_2 (ref), l_abs_1 (ref), l_antiaim_2 (ref)
        return l_min_2(l_abs_1(l_antiaim_2:get_rotation() - l_antiaim_2:get_rotation(true)), l_antiaim_2:get_max_desync());
    end;
    local v1209 = 0;
    local v1210 = false;
    local v1211 = false;
    local v1212 = {
        [0] = "Forward", 
        [1] = "Backward", 
        [2] = "Right", 
        [3] = "Left", 
        [4] = "At target", 
        [5] = "Freestanding"
    };
    local v1213 = 0;
    local _ = v67.screen_center;
    local v1215 = false;
    local v1216 = l_ui_0.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options");
    local v1217 = l_ui_0.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options");
    local v1218 = l_ui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden");
    local v1219 = l_ui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw");
    local v1220 = {
        Ducking = 5, 
        Slowwalking = 4, 
        Moving = 3, 
        Standing = 2
    };
    local v1221 = {
        Hideshots = l_ui_0.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
        Doubletap = l_ui_0.find("Aimbot", "Ragebot", "Main", "Double Tap")
    };
    local v1222 = false;
    local function v1223()
        -- upvalues: v1222 (ref), v1216 (ref), v1217 (ref), v1218 (ref), v1219 (ref)
        if not v1222 then
            return;
        else
            v1222 = false;
            v1216:override();
            v1217:override();
            v1218:override();
            v1219:override();
            return;
        end;
    end;
    local v1224 = {
        [1] = -180, 
        [2] = 0, 
        [3] = 90, 
        [4] = -90
    };
    local v1225 = {
        [1] = 90, 
        [2] = 180, 
        [3] = -90, 
        [4] = 180, 
        [5] = 90
    };
    local v1226 = "";
    local function v1228()
        -- upvalues: v263 (ref), v1226 (ref)
        local l_defensive_aa_0 = v263.AntiAim.defensive_aa;
        v1226 = l_defensive_aa_0.yaw:get();
        if l_defensive_aa_0.pitch:get() == "Default" then
            l_defensive_aa_0.yaw:update({
                [1] = "None", 
                [2] = "Default", 
                [3] = "Sideways", 
                [4] = "Forward", 
                [5] = "Spinbot", 
                [6] = "3-Way", 
                [7] = "5-Way", 
                [8] = "Random"
            });
            l_defensive_aa_0.yaw:set(v1226);
        else
            l_defensive_aa_0.yaw:update({
                [1] = "Default", 
                [2] = "Sideways", 
                [3] = "Forward", 
                [4] = "Spinbot", 
                [5] = "3-Way", 
                [6] = "5-Way", 
                [7] = "Random"
            });
            l_defensive_aa_0.yaw:set(v1226);
        end;
    end;
    v263.AntiAim.defensive_aa.main:RegisterCallback(v1228);
    v263.AntiAim.defensive_aa.pitch:RegisterCallback(v1228);
    local l_defensive_aa_1 = v263.AntiAim.defensive_aa;
    v260:add("prediction", "defensive aa", function(v1230, _, _)
        -- upvalues: v1215 (ref), v67 (ref), l_defensive_aa_1 (ref), v1223 (ref), v179 (ref), v1221 (ref), l_functions_0 (ref), v1209 (ref), v1220 (ref), v1191 (ref), v1196 (ref), v1225 (ref), v1197 (ref), v1222 (ref), v1216 (ref), v1217 (ref), v1218 (ref), v1219 (ref)
        v1215 = false;
        v67.full_aa_stop = v1215;
        if not l_defensive_aa_1.main:get() or rage.exploit:get() ~= 1 or v67.functions.on_use_aa or v67.functions.edge_yaw then
            return v1223();
        elseif v179.manual_yb == "Right" or v179.manual_yb == "Left" then
            return v1223();
        else
            local v1233 = false;
            local l_ipairs_0 = ipairs;
            local v1235 = l_defensive_aa_1.mode:get() or {};
            for _, v1237 in l_ipairs_0(v1235) do
                if v1221[v1237] and v1221[v1237]:get() then
                    v1233 = true;
                    break;
                end;
            end;
            l_ipairs_0 = false;
            if l_functions_0.safehead and l_defensive_aa_1.mode:get(3) then
                v1233 = true;
                l_ipairs_0 = true;
            end;
            if l_functions_0.safehead and v1233 and not l_ipairs_0 then
                return v1223();
            elseif not v1233 then
                return v1223();
            else
                v1235 = false;
                local v1238 = false;
                if not l_ipairs_0 then
                    if v1209 == 6 or v1209 == 7 then
                        v1238 = l_defensive_aa_1.state:get("Air");
                    else
                        for _, v1240 in ipairs(l_defensive_aa_1.state:get()) do
                            if v1240 == "On Peek" then
                                v1238 = true;
                                v1235 = true;
                                break;
                            elseif v1220[v1240] == v1209 then
                                v1238 = true;
                                break;
                            end;
                        end;
                    end;
                end;
                if not v1238 and not l_ipairs_0 then
                    return v1223();
                else
                    local l_x_0 = v1230.view_angles.x;
                    local v1242 = l_defensive_aa_1.pitch:get();
                    if v1242 ~= "Default" then
                        if v1242 == "Zero" then
                            l_x_0 = 0;
                        elseif v1242 == "Up" then
                            l_x_0 = -89;
                        elseif v1242 == "Switch" then
                            if v1230.forwardmove > 0 then
                                l_x_0 = -89 + 29 * (globals.tickcount % v1230.forwardmove % 6 + 1);
                            else
                                l_x_0 = -89 + 29 * (globals.tickcount % 6 + 1);
                            end;
                        elseif v1242 == "Up Switch" then
                            l_x_0 = utils.random_float(-45, -60);
                        elseif v1242 == "Down Switch" then
                            l_x_0 = utils.random_float(45, 60);
                        elseif v1242 == "Random" then
                            l_x_0 = utils.random_float(-89, 89);
                        end;
                    end;
                    local l_y_0 = v1230.view_angles.y;
                    local v1244 = l_defensive_aa_1.yaw:get();
                    if v1244 == "Sideways" then
                        l_y_0 = v1191(v1196 * 90 + utils.random_float(-30, 30));
                    elseif v1244 == "Forward" then
                        l_y_0 = v1191(v1196 * 180 + utils.random_float(-30, 30));
                    elseif v1244 == "Spinbot" then
                        l_y_0 = v1191(-180 + globals.tickcount % 9 * 40 + utils.random_float(-30, 30));
                    elseif v1244 == "3-Way" then
                        l_y_0 = v1191(v1225[v1197 % 5 + 1] + utils.random_float(-15, 15));
                    elseif v1244 == "5-Way" then
                        l_y_0 = v1191(({
                            [1] = 90, 
                            [2] = 135, 
                            [3] = 180, 
                            [4] = 225, 
                            [5] = 270
                        })[v1197 % 5 + 1] + utils.random_float(-15, 15));
                    elseif v1244 == "Random" then
                        l_y_0 = utils.random_float(-180, 180);
                    end;
                    v1222 = true;
                    if not v1235 then
                        v1216:override("Always On");
                        v1217:override("Break LC");
                    else
                        v1223();
                    end;
                    if v1244 ~= "None" then
                        v1218:override(true);
                    else
                        v1218:override();
                    end;
                    v1219:override(true);
                    if v1242 ~= "Default" then
                        rage.antiaim:override_hidden_pitch(l_x_0);
                    end;
                    if v1244 ~= "Default" then
                        rage.antiaim:override_hidden_yaw_offset(l_y_0);
                    end;
                    v1215 = true;
                    v67.full_aa_stop = v1215;
                    return;
                end;
            end;
        end;
    end);
    local v1245 = false;
    local function v1246()
        -- upvalues: v1245 (ref), v1216 (ref)
        if not v1245 then
            return;
        else
            v1245 = false;
            v1216:override();
            return;
        end;
    end;
    local v1247 = {
        Ducking = 3, 
        ["Crouching Air"] = 5, 
        Standing = 1
    };
    local l_sv_gravity_0 = cvar.sv_gravity;
    local function v1255(v1249, v1250)
        -- upvalues: l_sv_gravity_0 (ref)
        local l_tickinterval_0 = globals.tickinterval;
        local l_m_vecVelocity_1 = v1249.m_vecVelocity;
        local v1253 = v1250:clone();
        local v1254 = 16;
        if #l_m_vecVelocity_1 < 32 then
            v1254 = 32;
        end;
        v1253.x = v1253.x + l_m_vecVelocity_1.x * l_tickinterval_0 * v1254;
        v1253.y = v1253.y + l_m_vecVelocity_1.y * l_tickinterval_0 * v1254;
        if not v1249.m_hGroundEntity then
            v1253.z = v1253.z + l_m_vecVelocity_1.z * l_tickinterval_0 * v1254 - l_sv_gravity_0:float() * l_tickinterval_0;
        end;
        return utils.trace_hull(v1250, v1253, v1249.m_vecMins, v1249.m_vecMaxs, v1249).end_pos:clone();
    end;
    local v1262 = {
        [1] = {
            [3] = {
                inverter = false, 
                offset = 15, 
                left_limit = 24, 
                right_limit = 24
            }, 
            [2] = {
                inverter = false, 
                offset = 15, 
                left_limit = 24, 
                right_limit = 24
            }
        }, 
        [3] = {
            [3] = {
                inverter = false, 
                offset = -5, 
                right_limit = 45, 
                left_limit = 45, 
                get_offset = function(v1256, v1257)
                    local v1258 = #v1257.m_vecVelocity;
                    return v1256.in_forward and v1256.in_moveright and v1258 > 10 and v1258 < 70 and 32 or 27;
                end
            }, 
            [2] = {
                inverter = false, 
                offset = 17, 
                right_limit = 45, 
                left_limit = 45, 
                get_offset = function(v1259, v1260)
                    local v1261 = #v1260.m_vecVelocity;
                    return v1259.in_forward and v1259.in_moveright and v1261 > 10 and v1261 < 70 and 32 or 27;
                end
            }
        }, 
        [5] = {
            [3] = {
                inverter = false, 
                offset = 0, 
                left_limit = 25, 
                right_limit = 25
            }, 
            [2] = {
                inverter = false, 
                offset = 0, 
                left_limit = 25, 
                right_limit = 25
            }
        }, 
        [107] = {
            [3] = {
                inverter = true, 
                offset = 0, 
                left_limit = 60, 
                right_limit = 60
            }, 
            [2] = {
                inverter = true, 
                offset = 0, 
                left_limit = 60, 
                right_limit = 60
            }
        }, 
        [268] = {
            [3] = {
                inverter = false, 
                offset = 23, 
                left_limit = 60, 
                right_limit = 30
            }, 
            [2] = {
                inverter = false, 
                offset = 17, 
                left_limit = 20, 
                right_limit = 60
            }
        }
    };
    local v1263 = false;
    v260:add("prediction", "safehead", function(v1264, v1265, v1266, _)
        -- upvalues: l_functions_0 (ref), v1211 (ref), v1263 (ref), v1213 (ref), v1209 (ref), v876 (ref), v263 (ref), v67 (ref), v178 (ref), v179 (ref), v1246 (ref), v1206 (ref), v1247 (ref), v1245 (ref), v1216 (ref), v1255 (ref), v1202 (ref), v1210 (ref), v1262 (ref), v1193 (ref)
        l_functions_0.safehead = false;
        v1211 = false;
        v1263 = false;
        v1213 = 0;
        if v1265 and v1266 then
            v1209 = v876(v1265, not v263.AntiAim.enabled_Fakelagging:get());
            v67.global_cond = v1209;
        end;
        if not v178.antiaim or not v1266 or l_functions_0.on_use_aa or l_functions_0.edge_yaw or v179.manual_yb == "Right" or v179.manual_yb == "Left" then
            v1246();
            return v1206(3);
        else
            local v1268 = v876(v1265, true) - 1;
            if v1268 == 2 then
                v1246();
                return v1206(3);
            else
                if v1268 > 2 then
                    v1268 = v1268 - 1;
                end;
                v1268 = math.clamp(v1268, 0, 5);
                local v1269 = false;
                local v1270 = false;
                local v1271 = 0;
                if v1268 == 4 or v1268 == 5 and not v1269 then
                    local v1272 = v1265:get_player_weapon();
                    if v1272 then
                        local v1273 = v1272:get_classid();
                        v1271 = v1273;
                        if v1273 == 107 then
                            v1269 = v263.AntiAim.safehead:get(1);
                        elseif v1273 == 268 then
                            v1269 = v263.AntiAim.safehead:get(2);
                        end;
                        v1270 = true;
                    end;
                end;
                if not v1269 then
                    for _, v1275 in pairs(v263.AntiAim.safehead:get()) do
                        if v1247[v1275] and v1268 == v1247[v1275] then
                            v1269 = true;
                            break;
                        end;
                    end;
                end;
                if not v1269 then
                    v1246();
                    return v1206(3);
                else
                    l_functions_0.safehead = v1270;
                    if v1268 == 4 or v1268 == 5 and v1270 then
                        v1245 = true;
                        v1216:override("Always On");
                    else
                        v1246();
                    end;
                    local _ = 4096;
                    local v1277 = nil;
                    local _ = 0;
                    if not l_functions_0.safehead then
                        local v1279 = v1265:get_origin();
                        v1277 = entity.get_threat();
                        if v1277 and v1277:is_alive() then
                            local v1280 = v1277:get_origin();
                            if (v1270 and v1279.z - 1 or v1280.z + 5) < v1279.z then
                                l_functions_0.safehead = utils.trace_bullet(v1277, v1255(v1277, v1277:get_eye_position()), v1265:get_hitbox_position(0) + vector(0, 0, 6)) > 0;
                            end;
                        end;
                    end;
                    v1263 = v1270;
                    if l_functions_0.safehead then
                        v1202(3);
                        if not v1210 then
                            v1211 = true;
                        end;
                        local v1281 = v1270 and v1262[v1271] or v1262[v1268];
                        if not v1281 then
                            if v1270 then
                                v1281 = v1262.Other;
                            else
                                v1246();
                                return v1206(3);
                            end;
                        end;
                        local v1282 = v1281[v1265.m_iTeamNum];
                        if not v1282 then
                            v1246();
                            return v1206(3);
                        else
                            v1193.body_yaw:override(true);
                            v1193.yaw_base1:override("At Target");
                            v1193.yaw_mod:override("Disabled");
                            v1193.fakeopt:override({});
                            v1193.yaw_base:override("Backward");
                            v1193.yaw_add:override(v1282.get_offset and v1282.get_offset(v1264, v1265) or v1282.offset);
                            v1193.limit1:override(v1282.left_limit);
                            v1193.limit2:override(v1282.right_limit);
                            rage.antiaim:inverter(v1282.inverter);
                            return;
                        end;
                    else
                        v1246();
                        return v1206(3);
                    end;
                end;
            end;
        end;
    end);
    local v1283 = false;
    local v1284 = 1;
    local v1285 = {
        [1] = -0.75, 
        [2] = 1, 
        [3] = 0, 
        [4] = 0.4, 
        [5] = -0.25
    };
    v260.breakpoints["cond aas"] = -1;
    local v1286 = false;
    local v1287 = 0;
    local v1288 = nil;
    local v1289 = {
        Meta = v405.parse_fast("[acid_preset]>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<[acid_preset]").data, 
        ["Classic+"] = v405.parse_fast("[acid_preset]>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<[acid_preset]").data
    };
    local v1290 = {
        Default = "Peek Fake", 
        Off = "Off", 
        Reversed = "Peek Real"
    };
    local _ = 0;
    local v1292 = {
        ["2-Way"] = {
            [1] = -0.5, 
            [2] = 0.5
        }, 
        ["3-Way"] = {
            [1] = -0.5, 
            [2] = 0, 
            [3] = 0.5
        }, 
        ["5-Way"] = {
            [1] = -0.75, 
            [2] = 1, 
            [3] = 0, 
            [4] = 0.4, 
            [5] = -0.25
        }
    };
    local v1293 = {};
    local function v1295()
        -- upvalues: v1293 (ref)
        for v1294 = 1, 14 do
            v1293[v1294] = {
                previous_angle = 0, 
                ticks = 0, 
                is_active = false, 
                current = 0
            };
        end;
    end;
    v1295();
    local v1296 = {};
    local v1297 = 0;
    local v1298 = false;
    v260:add("prediction", "cond aas", function(v1299, v1300, v1301)
        -- upvalues: v67 (ref), v1196 (ref), v1197 (ref), v1298 (ref), v1210 (ref), v178 (ref), v263 (ref), v260 (ref), v1193 (ref), v1286 (ref), v1212 (ref), l_functions_0 (ref), v1283 (ref), v1211 (ref), v1224 (ref), v1206 (ref), v1202 (ref), l_ui_0 (ref), v1289 (ref), v876 (ref), v1192 (ref), v143 (ref), v1296 (ref), v1295 (ref), v1297 (ref), v1290 (ref), v1293 (ref), v1288 (ref), v1191 (ref), v1287 (ref), v1285 (ref), v1284 (ref), v1292 (ref), v1262 (ref)
        v67.ab_working = false;
        if v1300 == nil then
            return;
        else
            if v1299.choked_commands == 0 then
                v67.jitter = 0;
                v1196 = v1196 * -1;
                v1197 = v1197 + 1;
                local v1302 = v1300:get_anim_state();
                v1298 = math.normalize_yaw(v1302.abs_yaw - v1302.eye_yaw) < 0;
            end;
            v1210 = not v178.antiaim or not (v263.AntiAim.mode:get() ~= "Default") or not v1301;
            v260.breakpoints["cond aas"] = 0;
            if v67.on_warmup then
                v1193.pitch:override("Disabled");
                v1193.yaw_base:override("Disabled");
                v1193.body_yaw:override(false);
                v1286 = true;
                return;
            else
                if v1286 then
                    v1193.pitch:override();
                    v1193.yaw_base:override();
                    v1193.body_yaw:override();
                    v1286 = false;
                end;
                v260.breakpoints["cond aas"] = 1;
                local v1303 = v263.AntiAim.manual_yb:GetCombo() or 0;
                v1193.yaw_base:override(v1212[1]);
                v1193.freestand:override();
                local v1304 = false;
                if v178.antiaim and v263.AntiAim.mode:get() == "Default" and v1301 and not l_functions_0.edge_yaw and v1303 ~= 0 and not l_functions_0.on_use_aa then
                    v260.breakpoints["cond aas"] = 2;
                    v1283 = true;
                    v1193.yaw_add:override(0);
                    v1193.freestand:override(false);
                    if v1211 then
                        v1193.yaw_base1:override("At Target");
                    else
                        v1304 = true;
                        if v1303 > 4 then
                            if v1303 == 5 then
                                v1193.yaw_base1:override("Local View");
                                v1193.freestand:override(true);
                            end;
                        else
                            v1193.yaw_base1:override("Local View");
                            v1193.yaw_add:override(v1224[v1303] or 0);
                        end;
                    end;
                    v260.breakpoints["cond aas"] = 3;
                else
                    v260.breakpoints["cond aas"] = 4;
                    if v1283 then
                        v1283 = false;
                        v1193.yaw_add:override();
                        v1193.yaw_base:override();
                        v1193.yaw_base1:override();
                    end;
                    v260.breakpoints["cond aas"] = 5;
                end;
                v260.breakpoints["cond aas"] = 6;
                if v1210 or l_functions_0.edge_yaw then
                    return v1206(1);
                else
                    v260.breakpoints["cond aas"] = 7;
                    if v1211 then
                        return;
                    else
                        v1206(3);
                        v260.breakpoints["cond aas"] = 8;
                        v1202(1);
                        v260.breakpoints["cond aas"] = 9;
                        local v1305 = 0;
                        local v1306 = "";
                        local v1307 = "Global";
                        local v1308 = {};
                        local v1309 = {};
                        if v263.AntiAim.mode:get() == "Automatic" and l_ui_0.get_alpha() == 0 then
                            local v1310 = v1289[v263.AntiAim.automatic_type:get()];
                            v1305 = v876(v1300, not v1310.enabled_Fakelagging);
                            v1306 = v1192[v1305]:gsub(" ", "");
                            v1307 = v1305 == 1 and "Global" or v1310["enabled_" .. v1306] and v1306 or "Global";
                            v1308.body_yaw = v1310["body_yaw_" .. v1307];
                            v1308.inverted = v1310["inverter_" .. v1307] or false;
                            v1308.limit1 = v1310["l_limit_" .. v1307];
                            v1308.free_dsy = l_functions_0.should_fs_desync and "Peek Fake" or v1310["freestand_" .. v1307];
                            v1308.yaw_base1 = v1310["yaw_base_" .. v1307];
                            v1308.yaw_add = v1310["yaw_add_" .. v1307];
                            v1308.yaw_add_main = v1310["yaw_add_main_" .. v1307];
                            v1308.yaw_add1 = v1310["yaw_add1_" .. v1307];
                            v1308.yaw_mod = v1310["yaw_mod_" .. v1307];
                            v1308.fake_opt_combo_2 = v143(v1310["fake_opt_" .. v1307]).Jitter;
                            v1308.fake_opt = v1310["fake_opt_" .. v1307];
                            v1308.fake_opt_fj = v143(v1310["fake_opt_" .. v1307])["Randomize jitter"];
                            v1308.yaw_mod_d = v1310["yaw_mod_deg_" .. v1307];
                            v1308.yaw_mod_deg_random = v1310["yaw_mod_deg_shitai_" .. v1307];
                            v1308.yaw_mod_ab = v1310["mod_d_ab_add_en_" .. v1307];
                            v1308.acid_mode = v1310["yaw_mod_acid_" .. v1307];
                            v1308.delay_1 = v1310["yaw_mod_deg_delay1_" .. v1307];
                            v1308.delay_2 = v1310["yaw_mod_deg_delay2_" .. v1307];
                            v1308.delay_safe = v1310["yaw_mod_acid_safe_" .. v1307];
                            for v1311 = 1, 0 do
                                v1308["mod_d_ab_" .. v1311] = v1310["lby_mode_" .. v1307];
                            end;
                        else
                            v1305 = v876(v1300, not v263.AntiAim.enabled_Fakelagging:get());
                            v1306 = v1192[v1305]:gsub(" ", "");
                            v1307 = v1305 == 1 and "Global" or v263.AntiAim["enabled_" .. v1306]:get() and v1306 or "Global";
                            v1308.body_yaw = v263.AntiAim["body_yaw_" .. v1307]:Get();
                            v1308.inverted = v263.AntiAim["inverter_" .. v1307]:get();
                            v1308.limit1 = v263.AntiAim["l_limit_" .. v1307]:Get();
                            v1308.free_dsy = l_functions_0.should_fs_desync and "Default" or v263.AntiAim["freestand_" .. v1307]:Get();
                            if v263.AntiAim["yaw_base_" .. v1307] then
                                v1308.yaw_base1 = v263.AntiAim["yaw_base_" .. v1307]:Get();
                                v1308.yaw_add = v263.AntiAim["yaw_add_" .. v1307]:Get();
                                v1308.yaw_add_main = v263.AntiAim["yaw_add_main_" .. v1307]:Get();
                                v1308.yaw_add1 = v263.AntiAim["yaw_add1_" .. v1307]:Get();
                            end;
                            v1308.yaw_mod = v263.AntiAim["yaw_mod_" .. v1307]:Get();
                            v1308.fake_opt_combo_2 = v263.AntiAim["fake_opt_" .. v1307]:GetCombo(2);
                            v1308.fake_opt = v263.AntiAim["fake_opt_" .. v1307]:get();
                            v1308.fake_opt_fj = v263.AntiAim["fake_opt_" .. v1307]:get(3);
                            v1308.yaw_mod_d = v263.AntiAim["yaw_mod_deg_" .. v1307]:get();
                            v1308.yaw_mod_deg_random = v263.AntiAim["yaw_mod_deg_shitai_" .. v1307]:get();
                            v1308.yaw_mod_ab = v263.AntiAim["mod_d_ab_add_en_" .. v1307]:get();
                            v1308.acid_mode = v263.AntiAim["yaw_mod_acid_" .. v1307]:get();
                            v1308.delay_1 = v263.AntiAim["yaw_mod_deg_delay1_" .. v1307]:get();
                            v1308.delay_2 = v263.AntiAim["yaw_mod_deg_delay2_" .. v1307]:get();
                            v1308.delay_safe = v263.AntiAim["yaw_mod_acid_safe_" .. v1307]:get();
                            if not v1296["yaw_mod_deg_delay1_" .. v1307] then
                                v1296["yaw_mod_deg_delay1_" .. v1307] = true;
                                v263.AntiAim["yaw_mod_deg_delay1_" .. v1307]:set_callback(v1295);
                                v263.AntiAim["yaw_mod_deg_delay2_" .. v1307]:set_callback(v1295);
                                v263.AntiAim["yaw_mod_acid_safe_" .. v1307]:set_callback(v1295);
                                v1297 = 0;
                            end;
                            v1309[#v1309 + 1] = v1308.yaw_mod_d;
                            for v1312 = 2, v67.ab_phases[v1307] do
                                v1309[#v1309 + 1] = v263.AntiAim["mod_d_ab_" .. v1312 .. v1307]:get();
                            end;
                        end;
                        v1193.body_yaw:override(v1308.body_yaw);
                        v260.breakpoints["cond aas"] = 10;
                        local l_v1298_0 = v1298;
                        if v1308.fake_opt and v1308.fake_opt_combo_2 and v1308.fake_opt_fj and v1308.yaw_mod == "AcidTech" then
                            l_v1298_0 = rage.antiaim:inverter();
                        end;
                        v1193.limit1:override(v1308.limit1);
                        v1193.limit2:override(v1308.limit1);
                        v260.breakpoints["cond aas"] = 11;
                        v1193.free_dsy:override(v1290[v1308.free_dsy]);
                        v1193.fakeopt:override({});
                        v1193.yaw_mod:override("Disabled");
                        v1193.yaw_add:override(0);
                        v260.breakpoints["cond aas"] = 12;
                        local v1314 = v1293[v1305];
                        local v1315 = 0;
                        if not l_functions_0.on_use_aa then
                            v260.breakpoints["cond aas"] = 13;
                            if v263.AntiAim["yaw_base_" .. v1307] then
                                v1193.yaw_base1:override(v1308.yaw_base1);
                            end;
                            local v1316 = v1303 - 1;
                            if v1316 ~= -1 then
                                v1193.yaw_base1:override("Local View");
                                v1193.freestand:override(false);
                            end;
                            if v1316 > 3 then
                                v260.breakpoints["cond aas"] = 14;
                                v1193.yaw_base:override(v1212[1]);
                                if v1316 == 4 then
                                    v1193.freestand:override(true);
                                end;
                            else
                                v1315 = v1315 + (v1224[v1316 + 1] or 0);
                            end;
                        else
                            v1315 = v1315 + v67.functions.on_use_aa_yaw_override;
                        end;
                        v260.breakpoints["cond aas"] = 16;
                        if not l_functions_0.rolldesync then
                            v260.breakpoints["cond aas"] = 17;
                            local v1317 = not l_functions_0.should_stop_jittering and v1308.yaw_mod or "Disabled";
                            local v1318 = not l_functions_0.should_stop_jittering and #v1308.fake_opt ~= 0 and not v1314.is_delay;
                            if v1318 then
                                v1193.fakeopt:override(v1308.fake_opt);
                            end;
                            local v1319 = l_functions_0.anti_bruteforce > globals.realtime and v1317 == "Disabled";
                            v67.ab_working = v1319;
                            if v1318 then
                                local v1320 = false;
                                for _, v1322 in ipairs(v1308.fake_opt) do
                                    if v1322 == "Jitter" then
                                        v1320 = true;
                                        break;
                                    end;
                                end;
                                if not v1320 and not v1319 then
                                    rage.antiaim:inverter(v1308.inverted);
                                end;
                            elseif not v1319 then
                                rage.antiaim:inverter(v1308.inverted);
                            end;
                            if v1303 == 0 and not v1314.is_delay then
                                local v1323 = v1308.yaw_add or 0;
                                local v1324 = v1308.yaw_add1 or 0;
                                local v1325 = v1308.yaw_add_main or 0;
                                if v1305 == 5 then
                                    local l_m_bIsScoped_0 = v1300.m_bIsScoped;
                                    local v1327 = v1300:get_player_weapon();
                                    if v1327 then
                                        local v1328 = v1327:get_weapon_info();
                                        local v1329 = l_m_bIsScoped_0 and v1328.max_player_speed_alt or v1328.max_player_speed;
                                        if v1300.m_flDuckAmount == 1 then
                                            v1329 = v1329 / 100 * 34;
                                        end;
                                        local v1330 = #v1300.m_vecVelocity;
                                        local v1331 = v1329 - v1329 / 100 * 10;
                                        local v1332 = v1330 > 1.2 and v1330 < v1331;
                                        if v1331 / 1.8 < v1330 then
                                            v1323 = v1323 - 10;
                                            v1324 = v1324 - 6;
                                            v1325 = v1325 - 8;
                                        end;
                                        if (v1299.in_forward or v1299.in_back) and v1299.in_moveright and v1330 > 1.2 and not v1332 then
                                            v1323 = v1323 + 10;
                                            v1324 = v1324 + 6;
                                            v1325 = v1325 + 8;
                                        end;
                                    end;
                                end;
                                if v1308.fake_opt_combo_2 and v1308.body_yaw and v1324 + v1323 ~= 0 then
                                    if l_v1298_0 then
                                        v1315 = v1315 + v1323;
                                        v1297 = v1323;
                                    else
                                        v1315 = v1315 + v1324;
                                        v1297 = v1324;
                                    end;
                                else
                                    v1315 = v1315 + v1325;
                                end;
                            end;
                            local l_yaw_mod_d_0 = v1308.yaw_mod_d;
                            local _ = v1308.yaw_mod_deg_type;
                            if v1308.yaw_mod_deg_random ~= 0 then
                                if v1197 % 2 == 0 or v1288 == nil then
                                    v1288 = utils.random_int(0, (l_yaw_mod_d_0 > 0 and 1 or -1) * v1308.yaw_mod_deg_random);
                                end;
                                l_yaw_mod_d_0 = v1191(l_yaw_mod_d_0 + v1288);
                            end;
                            if v1308.yaw_mod_ab and v67.ab_phase ~= 0 then
                                l_yaw_mod_d_0 = v1309[v67.ab_phase % #v1309 + 1];
                            end;
                            if v1317 == "Shaitan" then
                                if v1299.choked_commands == 0 then
                                    v1287 = l_yaw_mod_d_0 * v1285[v1284];
                                    v1284 = v1284 + 1;
                                    if v1284 > #v1285 then
                                        v1284 = 1;
                                    end;
                                end;
                                v1315 = v1315 + v1287;
                            elseif v1317 == "AcidTech" and v1303 == 0 then
                                v1314.ticks = v1314.ticks + 1;
                                local l_acid_mode_0 = v1308.acid_mode;
                                local v1336 = v1292[l_acid_mode_0];
                                local v1337 = v1336[v1197 % #v1336 + 1];
                                if v1308.delay_1 ~= 4 and not v1314.is_delay and v1314.ticks % v1308.delay_1 == 0 and (v1305 ~= 8 or not l_functions_0.on_use_aa) then
                                    v1314.is_delay = true;
                                end;
                                local v1338 = false;
                                if v1314.is_delay then
                                    if v1314.current < v1308.delay_2 then
                                        v1314.current = v1314.current + 1;
                                        if v1308.delay_safe then
                                            local v1339 = v1262[1][v1300.m_iTeamNum];
                                            v1315 = v1339.offset;
                                            v1193.limit1:override(v1339.left_limit);
                                            v1193.limit2:override(v1339.right_limit);
                                            v1338 = true;
                                        end;
                                        v1315 = v1315 + v1297;
                                    else
                                        v1314.is_delay = false;
                                        v1314.ticks = 0;
                                        v1314.current = 0;
                                        v1314.previous_angle = 0;
                                        v1297 = 0;
                                    end;
                                else
                                    local v1340 = 0;
                                    if l_acid_mode_0 == "2-Way" and v1308.fake_opt_combo_2 and v1308.body_yaw then
                                        v1340 = math.normalize_yaw(v1315 + (l_v1298_0 and l_yaw_mod_d_0 / 2 or l_yaw_mod_d_0 * -1 / 2));
                                    else
                                        v1340 = math.normalize_yaw(v1315 + l_yaw_mod_d_0 * v1337);
                                    end;
                                    v1314.previous_angle = v1340;
                                end;
                                if not v1338 then
                                    v1315 = v1314.previous_angle;
                                end;
                            else
                                v1295();
                                v1193.yaw_mod:override(v1317);
                                v1193.yaw_mod_d:override(l_yaw_mod_d_0);
                            end;
                            v260.breakpoints["cond aas"] = 18;
                            v1193.yaw_add:override(v1315);
                            v260.breakpoints["cond aas"] = 19;
                        end;
                        v67.yaw = v1315;
                        return;
                    end;
                end;
            end;
        end;
    end);
end)();
(function()
    -- upvalues: v260 (ref), v67 (ref), v178 (ref), v263 (ref)
    local _ = -1;
    v260:add("draw", "warmup disablers", function()
        -- upvalues: v67 (ref), v178 (ref), v263 (ref)
        v67.on_warmup = false;
        if not v178.antiaim or not v263.AntiAim.tweaks:get(1) then
            return;
        else
            local v1342 = entity.get_game_rules();
            if not v1342 then
                return;
            elseif not v1342.m_bWarmupPeriod then
                return;
            else
                v67.on_warmup = true;
                return;
            end;
        end;
    end);
end)();
(function()
    -- upvalues: v314 (ref), v881 (ref), v260 (ref), v67 (ref), v178 (ref), v263 (ref), l_functions_0 (ref)
    local v1343 = false;
    local v1344 = 0;
    hostage_check = function(v1345)
        local v1346 = entity.get_entities(97);
        for _, v1348 in pairs(v1346) do
            local v1349 = v1348:get_origin();
            if v1349 and v1349:dist(v1345) < 64 then
                return false;
            end;
        end;
        return true;
    end;
    bomb_check = function(v1350)
        local v1351 = v1350:get_player_weapon();
        if v1351 then
            if v1351:get_weapon_index() == 34 then
                return false;
            else
                return true;
            end;
        else
            return false;
        end;
    end;
    defuse_check = function(v1352)
        local v1353 = entity.get_entities(129);
        for _, v1355 in pairs(v1353) do
            local v1356 = v1355:get_origin();
            if v1356 and v1356:dist(v1352) < 100 then
                return false;
            end;
        end;
        return true;
    end;
    local v1357 = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Pitch");
    local v1358 = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset");
    local v1359 = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter");
    local v1360 = -1;
    local function v1361()
        -- upvalues: v1360 (ref), v1357 (ref), v1358 (ref), v881 (ref), v1359 (ref)
        if v1360 ~= -1 then
            v1357:override();
            v1358:override();
            v881.yaw_base:override();
            v881.yaw_base1:override();
            v881.freestand:override();
            v1359:override();
            v1360 = -1;
        end;
    end;
    local l_antiaim_3 = rage.antiaim;
    v260:add("prediction", "On use anti-aim", function(v1363, v1364, v1365)
        -- upvalues: v67 (ref), v178 (ref), v263 (ref), v1361 (ref), v1344 (ref), v1343 (ref), v881 (ref), v1357 (ref), v1358 (ref), l_antiaim_3 (ref), l_functions_0 (ref), v1359 (ref), v1360 (ref)
        v67.functions.on_use_aa = false;
        v67.functions.on_use_aa_yaw_override = 0;
        if not v1365 or not v178.antiaim or not v263.AntiAim.tweaks:Get(4) then
            return v1361();
        else
            local l_in_use_0 = v1363.in_use;
            local v1367 = false;
            if l_in_use_0 then
                local v1368 = v1364:get_origin();
                v1367 = hostage_check(v1368) and bomb_check(v1364) and defuse_check(v1368);
                if v1367 then
                    v1344 = not v1343 and globals.tickcount or v1344;
                    v1343 = true;
                    v881.freestand:override(false);
                    v1357:override("Disabled");
                    v67.functions.on_use_aa_yaw_override = 180;
                    if not v178.antiaim or v263.AntiAim.mode:get() == "Default" then
                        v1358:override(180);
                    end;
                    l_antiaim_3:inverter(v67.ab_working and l_functions_0.anti_bruteforce_side or not v1359:get());
                    if v1360 == -1 then
                        v1360 = v881.yaw_base:get();
                    end;
                    v881.yaw_base1:override("Local View");
                else
                    v1343 = false;
                    v1361();
                end;
            else
                v1343 = false;
                v1361();
            end;
            l_functions_0.on_use_aa = v1343;
            if v1344 + 4 <= globals.tickcount and v1367 then
                v1363.in_use = false;
            end;
            return;
        end;
    end);
    v260:add("destroy", "ebalop zavali", v1361);
end)();
(function()
    -- upvalues: l_functions_0 (ref), v1191 (ref), l_abs_1 (ref), v881 (ref), l_ui_0 (ref), v260 (ref), v178 (ref), v67 (ref), v263 (ref)
    local function v1372(v1369, v1370, v1371)
        return v1369 + (v1370 - v1369) * v1371;
    end;
    local function v1375(v1373, v1374)
        return v1373.flYaw < v1374.flYaw;
    end;
    local l_sort_0 = table.sort;
    local _ = rage.antiaim;
    local function v1390(v1378, v1379)
        -- upvalues: l_functions_0 (ref), v1191 (ref), l_sort_0 (ref), v1375 (ref), v1372 (ref), l_abs_1 (ref)
        if not v1378 then
            return;
        elseif l_functions_0.on_use_aa then
            return;
        else
            local v1380 = {};
            local v1381 = nil;
            local v1382 = v1378:get_eye_position() + vector(0, 0, 10);
            for v1383 = 18, 360, 18 do
                v1383 = v1191(v1383);
                local v1384 = v1382 + vector():angles(0, v1383) * 96;
                local v1385 = utils.trace_line(v1382, v1384, v1378, 33570827);
                local l_entity_0 = v1385.entity;
                if l_entity_0 and l_entity_0:get_classname() == "CWorld" and v1385.fraction < 0.35 then
                    v1380[#v1380 + 1] = {
                        vecTraceEnd = v1385.end_pos, 
                        flYaw = v1383
                    };
                end;
            end;
            l_sort_0(v1380, v1375);
            if #v1380 >= 2 then
                v1381 = (v1382 - v1372(v1380[1].vecTraceEnd, v1380[#v1380].vecTraceEnd, 0.5)):angles();
            end;
            if v1381 then
                local l_y_1 = v1379.view_angles.y;
                local l_y_2 = v1381.y;
                local v1389 = v1191(l_y_2 - l_y_1);
                if l_abs_1(v1389) < 90 then
                    v1389 = 0;
                    l_y_1 = v1191(l_y_2 + 180);
                end;
                return v1191(-l_y_1 + l_y_2 + v1389 + 180);
            else
                return;
            end;
        end;
    end;
    local v1391 = -1;
    local function v1392()
        -- upvalues: v1391 (ref), v881 (ref)
        if v1391 ~= -1 then
            v881.yaw_base:override();
            v881.yaw_base1:override();
            v881.freestand:override();
            v881.yaw_add:override();
            v1391 = -1;
        end;
    end;
    local v1393 = l_ui_0.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
    v260:add("prediction", "edge yaw bratka", function(v1394, v1395, v1396)
        -- upvalues: l_functions_0 (ref), v178 (ref), v67 (ref), v1392 (ref), v263 (ref), v1393 (ref), v1390 (ref), v1391 (ref), v881 (ref)
        l_functions_0.edge_yaw = false;
        if not v178.antiaim or not v1396 or v67.on_warmup then
            return v1392();
        else
            local v1397 = v263.AntiAim.tweaks:get(2);
            local v1398 = v263.AntiAim.tweaks:get(3);
            local v1399 = v1397 and v1398;
            if not v1399 then
                if v1397 then
                    v1399 = not v1393:get();
                elseif v1398 then
                    v1399 = v1393:get();
                end;
            end;
            if not v1399 then
                return v1392();
            else
                local v1400 = v1390(v1395, v1394);
                if v1400 then
                    if v1391 == -1 then
                        v1391 = v881.yaw_base:get();
                    end;
                    v881.yaw_base:override("Backward");
                    v881.yaw_base1:override("Local View");
                    v881.yaw_add:override(v1400);
                    l_functions_0.edge_yaw = true;
                else
                    v1392();
                end;
                return;
            end;
        end;
    end);
    v260:add("destroy", "globals", v1392);
end)();
(function()
    -- upvalues: v260 (ref), v178 (ref), v67 (ref), v680 (ref), v263 (ref), l_functions_0 (ref)
    local v1401 = 0;
    local function v1412(v1402, v1403, v1404)
        local v1405 = v1404 - v1402;
        local v1406 = v1403 - v1402;
        local v1407 = v1406:length();
        v1406.x = v1406.x / v1407;
        v1406.y = v1406.y / v1407;
        v1406.z = v1406.z / v1407;
        local v1408 = v1406.x * v1405.x + v1406.y * v1405.y + v1406.z * v1405.z;
        if v1408 < 0 then
            return v1402;
        elseif v1407 < v1408 then
            return v1403;
        else
            local v1409 = v1402.x + v1406.x * v1408;
            local v1410 = v1402.y + v1406.y * v1408;
            local v1411 = v1402.z + v1406.z * v1408;
            return vector(v1409, v1410, v1411);
        end;
    end;
    local v1413 = 0;
    v260:add("bullet_impact", "anti brute bratka", function(v1414, v1415, v1416)
        -- upvalues: v178 (ref), v67 (ref), v680 (ref), v1412 (ref), v1401 (ref), v263 (ref), l_functions_0 (ref), v1413 (ref)
        if not v178.antiaim or not v1414 then
            return;
        elseif v67.full_aa_stop then
            return;
        else
            local v1417 = v680.GetPlayerForUserID(v1414.userid);
            if not v1416 or not v1417 or v1415 == v1417 then
                return;
            else
                local v1418 = v1415:get_eye_position();
                local v1419 = v1417:get_eye_position();
                if not v1419 then
                    return;
                else
                    local v1420 = vector(v1414.x, v1414.y, v1414.z);
                    if v1412(v1419, v1420, v1418):dist(v1418) > 60 or globals.tickcount == v1401 then
                        return;
                    else
                        if v263.AntiAim.tweaks:get(5) then
                            l_functions_0.anti_bruteforce = globals.realtime + 3;
                            l_functions_0.anti_bruteforce_side = not rage.antiaim:inverter();
                        end;
                        v67.ab_phase = v67.ab_phase + 1;
                        v1413 = globals.realtime + 3;
                        v1401 = globals.tickcount;
                        return;
                    end;
                end;
            end;
        end;
    end);
    v260:add("prediction", "anti brute bratka jopka", function(_, _, _)
        -- upvalues: v67 (ref), v1413 (ref), v178 (ref), v263 (ref), l_functions_0 (ref)
        if v67.ab_phase ~= 0 and v1413 < globals.realtime then
            v67.ab_phase = 0;
        end;
        if not v178.antiaim or not v263.AntiAim.tweaks:get(5) then
            l_functions_0.anti_bruteforce = -1;
            return;
        else
            if v67.ab_working then
                rage.antiaim:inverter(l_functions_0.anti_bruteforce_side);
            else
                l_functions_0.anti_bruteforce = -1;
            end;
            return;
        end;
    end);
end)();
(function()
    -- upvalues: v314 (ref), v881 (ref), v260 (ref), l_functions_0 (ref), v178 (ref), v263 (ref), v179 (ref), v67 (ref)
    local v1424 = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options");
    local v1425 = v314.FindVar("Aimbot", "Anti Aim", "Angles", "Yaw Modifier");
    local v1426 = nil;
    local v1427 = nil;
    local function v1429()
        -- upvalues: v1426 (ref), v1427 (ref), v1424 (ref), v1425 (ref), v881 (ref)
        if v1426 and v1427 then
            v1424:override();
            v1425:override();
            v881.yaw_add:override();
            local v1428 = nil;
            v1427 = nil;
            v1426 = v1428;
        end;
    end;
    v260:add("prediction", "static manuals", function(_, _, v1432)
        -- upvalues: l_functions_0 (ref), v178 (ref), v263 (ref), v179 (ref), v67 (ref), v1429 (ref), v1426 (ref), v1427 (ref), v1425 (ref), v1424 (ref)
        l_functions_0.should_stop_jittering = v1432 and v178.antiaim and v263.AntiAim.static_manuals:get() and (not (v179.manual_yb ~= "Right") or v179.manual_yb == "Left");
        if v67.full_aa_stop then
            return v1429();
        elseif l_functions_0.should_stop_jittering and v263.AntiAim.mode:Get() == "Default" then
            if not v1426 or not v1427 then
                local v1433 = v1425:get();
                v1427 = v1424:get();
                v1426 = v1433;
            end;
            v1425:override("Disabled");
            local v1434 = {};
            for v1435 = 1, #v1427 do
                if v1427[v1435] ~= "Jitter" then
                    v1434[#v1434 + 1] = v1427[v1435];
                end;
            end;
            rage.antiaim:inverter(false);
            v1424:override(v1434);
            return;
        else
            return v1429();
        end;
    end);
    v260:add("destroy", "static manuals destr", v1429);
end)();
local _ = nil;
local v1437 = nil;
v1437 = {};
local v1438 = {};
do
    local l_v1438_0 = v1438;
    v1437.add_animation = function(v1440, v1441, v1442, v1443, v1444)
        -- upvalues: l_v1438_0 (ref)
        table.insert(l_v1438_0, {
            type = 0, 
            progress = 0, 
            player = v1440, 
            layer = v1441, 
            sequence = v1442, 
            speed = v1443 or 1, 
            weight = v1444 or false
        });
    end;
    v1437.add_repeated_animation = function(v1445, v1446, v1447, v1448, v1449, v1450, v1451, v1452)
        -- upvalues: l_v1438_0 (ref)
        table.insert(l_v1438_0, {
            times = 0, 
            time_iteration = 0, 
            progress = 0, 
            type = 1, 
            player = v1445, 
            layer = v1446, 
            sequence = v1447, 
            min_cycle = v1448, 
            max_cycle = v1449, 
            anim_times = v1450, 
            speed = v1451 or 1, 
            weight = v1452 or false
        });
    end;
    v1437.process = function(v1453, v1454)
        -- upvalues: l_v1438_0 (ref)
        for v1455, v1456 in ipairs(l_v1438_0) do
            if v1456.player == v1453 then
                local v1457 = v1454[v1456.layer];
                v1457.sequence = v1456.sequence;
                if v1456.weight then
                    v1457.weight = v1456.weight;
                end;
                if v1456.type == 0 then
                    v1457.cycle = v1456.progress / 100;
                    v1456.progress = v1456.progress + v1456.speed;
                elseif v1456.type == 1 then
                    local v1458 = (1 - math.cos(v1456.progress)) / 2;
                    v1457.cycle = v1456.min_cycle + v1456.max_cycle * v1458;
                    v1456.progress = (v1456.progress + v1456.speed) % 100;
                    if v1458 >= 0.99 and v1456.time_iteration < globals.tickcount then
                        v1456.times = v1456.times + 0.5;
                        v1456.time_iteration = globals.tickcount + v1456.speed * (v1456.min_cycle + v1456.max_cycle) * 2500;
                    end;
                end;
            end;
            if v1456.type == 0 then
                if v1456.progress >= 100 then
                    table.remove(l_v1438_0, v1455);
                end;
            elseif v1456.type == 1 and v1456.times == v1456.anim_times then
                table.remove(l_v1438_0, v1455);
            end;
        end;
    end;
end;
v1438 = ffi.typeof("        struct {\n            float   anim_time;\n            float   fade_out_time;\n            int     flags;\n            int     activty;\t\n            int     priority;\n            int     order;\t\t\t\n            int     sequence;\n            float   prev_cycle;\n            float   weight;\n            float   weight_delta_rate;\n            float   playback_rate;\n            float   cycle;\n            int     owner;\n            int     bits;\n        }\n    ");
local v1459 = utils.opcode_scan("client.dll", "74 36 8B 06 FF 90 ? ? ? ?", -14);
local v1460 = l_ui_0.find("Aimbot", "Anti Aim", "Misc", "Leg Movement");
local l_anim_breakers_0 = v263.AntiAim.anim_breakers;
local v1462 = false;
local v1463 = false;
local v1464 = false;
do
    local l_v1437_0, l_v1438_1, l_v1460_0, l_l_anim_breakers_0_0, l_v1462_0, l_v1463_0, l_v1464_0 = v1437, v1438, v1460, l_anim_breakers_0, v1462, v1463, v1464;
    v260:add("post_update_clientside_animation", "csa", function(v1472, _, _)
        -- upvalues: l_l_anim_breakers_0_0 (ref), l_v1460_0 (ref), l_v1438_1 (ref), l_v1437_0 (ref), v263 (ref), l_v1462_0 (ref), v669 (ref), l_v1464_0 (ref), l_v1463_0 (ref)
        if not l_l_anim_breakers_0_0:get() then
            return l_v1460_0:override();
        else
            local v1475 = entity.get_local_player();
            if not v1475 then
                return;
            else
                local v1476 = v1475[0];
                if v1476 == 0 then
                    return;
                else
                    v1476 = ffi.cast("int", v1476);
                    if v1472 == v1475 then
                        local v1477 = ffi.cast(ffi.typeof("$**", l_v1438_1), v1476 + 10640)[0];
                        l_v1437_0.process(v1475, v1477);
                        local l_m_flPoseParameter_0 = v1475.m_flPoseParameter;
                        if v263.AntiAim.anim_global:get(1) and ffi.cast("bool*", ffi.cast("uintptr_t*", v1476 + 39264)[0] + 265)[0] and not l_v1462_0 and v669 > 8 and v669 < 100 then
                            l_m_flPoseParameter_0[12] = 0.5;
                        end;
                        if v263.AntiAim.anim_global:get(2) and l_v1464_0 then
                            v1477[6].weight = 0;
                        end;
                        if v263.AntiAim.anim_global:get(3) then
                            v1477[7].sequence = 217;
                            v1477[7].weight = 1;
                        end;
                        if v669 > 3 then
                            local v1479 = v263.AntiAim.anim_walking:get();
                            if v1479 == "Static Legs" then
                                l_m_flPoseParameter_0[0] = 1;
                                l_v1460_0:override("Sliding");
                                l_v1463_0 = true;
                            elseif v1479 == "0 iq" then
                                l_m_flPoseParameter_0[7] = 0.5;
                                v1477[6].cycle = v1477[6].cycle * 1.5 % 1;
                                l_v1460_0:override("Walking");
                            elseif v1479 == "Frog Walk" then
                                v1477[12].sequence = 21;
                                v1477[12].weight = 1;
                                l_v1460_0:override("Walking");
                            elseif l_v1463_0 then
                                l_v1460_0:override();
                                l_v1463_0 = false;
                            end;
                        else
                            local v1480 = v263.AntiAim.anim_air:get();
                            if v1480 == "Static Legs" then
                                l_m_flPoseParameter_0[6] = 1;
                            elseif v1480 == "0 iq" then
                                v1477[6].weight = 1;
                                v1477[6].cycle = v1477[6].cycle * 1.3 % 1;
                            elseif v1480 == "Frog Walk" then
                                v1477[12].sequence = 21;
                                v1477[12].weight = 1;
                                l_v1460_0:override("Walking");
                            elseif l_v1463_0 then
                                l_v1460_0:override();
                                l_v1463_0 = false;
                            end;
                        end;
                    end;
                    return;
                end;
            end;
        end;
    end);
    local v1481 = {
        Gym = {
            [1] = 0, 
            [2] = 232, 
            [3] = 0.645, 
            [4] = 0.08, 
            [5] = 2, 
            [6] = 0.03, 
            [7] = 100
        }, 
        Pray = {
            [1] = 0, 
            [2] = 232, 
            [3] = 0.4, 
            [4] = 0.22, 
            [5] = 2, 
            [6] = 0.05, 
            [7] = 100
        }, 
        Stretching = {
            [1] = 0, 
            [2] = 11, 
            [3] = 0, 
            [4] = 0.8, 
            [5] = 4, 
            [6] = 0.002, 
            [7] = 100
        }
    };
    v263.AntiAim.anim_freeze:set_callback(function(v1482)
        -- upvalues: v1481 (ref), l_v1437_0 (ref)
        local v1483 = v1482:get();
        if v1483 ~= "Disabled" and v1481[v1483] then
            local v1484 = entity.get_local_player();
            if v1484 ~= nil then
                l_v1437_0.add_repeated_animation(v1484, unpack(v1481[v1483]));
            end;
        end;
    end);
    v260:add("round_start", "anim bilderushka", function(_, v1486, v1487)
        -- upvalues: l_l_anim_breakers_0_0 (ref), v263 (ref), l_v1437_0 (ref), v1481 (ref)
        if not v1487 or not l_l_anim_breakers_0_0:get() then
            return;
        else
            local v1488 = v263.AntiAim.anim_freeze:get();
            if v1488 == "Disabled" then
                return;
            else
                l_v1437_0.add_repeated_animation(v1486, unpack(v1481[v1488]));
                return;
            end;
        end;
    end);
    local v1489 = ffi.typeof("struct {float x, y, z;}");
    local v1490 = v37.rel_jmp(utils.opcode_scan("client.dll", "E8 ? ? ? ? 5F 5E 5D C2 04 00 8B 0D ? ? ? ? 81 F9 ? ? ? ?"));
    local v1491 = utils.get_vfunc(2, ffi.typeof("$*(__thiscall*)(void*)", v1489));
    local v1492 = ffi.cast(ffi.typeof("void(__thiscall*)(void*, $*)", v1489), v37.rel_jmp("client.dll", "E8 ? ? ? ? 53 8D 45 F0"));
    local v1493 = utils.get_vfunc(219, "void(__thiscall*)(void*, int)");
    local v1494 = ffi.cast("int(__thiscall*)(void*, const char*)", v37.rel_jmp("client.dll", "E8 ? ? ? ? 5E 83 F8 FF"));
    local v1495 = {
        ffi.cast("void(__thiscall*)(void*, float*)", v37.rel_jmp("client.dll", "E8 ? ? ? ? EB 19 8B 07")), 
        ffi.cast("void(__thiscall*)(void*, float*)", v37.rel_jmp("client.dll", "E8 ? ? ? ? EB 57 8D 44 24 24")), 
        ffi.cast("void(__thiscall*)(void*, void*)", v37.rel_jmp("client.dll", "E8 ? ? ? ? 8B 46 04 8D 4E 04 FF 50 28")), 
        ffi.cast("void(__thiscall*)(void*)", v37.rel_jmp("client.dll", "E8 ? ? ? ? 83 BE ? ? ? ? ? 74 16"))
    };
    do
        local l_v1491_0, l_v1492_0, l_v1493_0, l_v1494_0, l_v1495_0 = v1491, v1492, v1493, v1494, v1495;
        v37.set("ragdoll", v1490, "void(__thiscall*)(void*)", function(v1501, v1502)
            -- upvalues: l_l_anim_breakers_0_0 (ref), v263 (ref), l_v1495_0 (ref), l_v1491_0 (ref), l_v1492_0 (ref), l_v1494_0 (ref), l_v1493_0 (ref)
            if not l_l_anim_breakers_0_0:get() or v263.AntiAim.anim_kill:get() == "Disabled" then
                return v1501(v1502);
            else
                local v1503 = ffi.cast("uintptr_t", v1502);
                if v1503 == 0 then
                    return v1501(v1502);
                else
                    l_v1495_0[1](v1502, ffi.cast("float*", v1503 + 2695));
                    l_v1495_0[2](v1502, ffi.cast("float*", v1503 + 2692));
                    ffi.cast("int*", v1503 + 10429)[0] = 1;
                    local v1504 = entity.get(v1502);
                    if v1504 == nil then
                        return v1501(v1502);
                    else
                        local l_m_hPlayer_0 = v1504.m_hPlayer;
                        if not l_m_hPlayer_0 then
                            return v1501(v1502);
                        else
                            local v1506 = ffi.cast("void*", l_m_hPlayer_0[0]);
                            local v1507 = ffi.cast("uintptr_t", l_m_hPlayer_0[0]);
                            local v1508 = ffi.cast("bool*", v1507 + 39700);
                            if v1508[0] then
                                l_v1495_0[3](v1506, v1502);
                            end;
                            local v1509 = l_v1491_0(ffi.cast("void*", v1507 + 4));
                            l_v1492_0(v1502, v1509[0]);
                            local v1510 = ffi.cast("float*", v1502);
                            v1510[75] = v1509.x;
                            v1510[76] = v1509.y;
                            v1510[77] = v1509.z;
                            if v1508[0] then
                                l_v1495_0[4](v1506);
                            end;
                            local v1511 = utils.random_int(0, 1) == 0 and l_v1494_0(v1506, "deathpose_lowviolence") or 262;
                            l_v1493_0(v1502, v1511 == -1 and 232 or v1511);
                            ffi.cast("int*", v1503 + 10400)[0] = 1;
                            return;
                        end;
                    end;
                end;
            end;
        end);
    end;
    v1489 = l_ui_0.find("Aimbot", "Anti Aim", "Misc", "Slow Walk");
    v260:add("prediction", "animushe4ka bildorushe4ka", function(v1512, _, v1514)
        -- upvalues: l_l_anim_breakers_0_0 (ref), l_v1462_0 (ref), l_v1464_0 (ref), v1489 (ref)
        if not v1514 or not l_l_anim_breakers_0_0:get() then
            return;
        else
            l_v1462_0 = v1512.in_jump;
            l_v1464_0 = v1489:get();
            return;
        end;
    end);
end;
(function()
    -- upvalues: v263 (ref), v179 (ref), v260 (ref), v178 (ref), v680 (ref)
    local v1515 = utils.get_vfunc("client.dll", "GameClientExports001", 3, "void(__thiscall*)(void*, int)");
    v263.Misc.auto_unmute:RegisterCallback(function()
        -- upvalues: v179 (ref), v1515 (ref)
        if v179.auto_unmute then
            for _, v1517 in pairs(entity.get_players()) do
                v1515(v1517:get_index());
            end;
        end;
    end);
    v260:add("player_connect_full", "auto unmute", function(v1518, v1519)
        -- upvalues: v178 (ref), v179 (ref), v680 (ref), v1515 (ref)
        if not v178.misc or not v179.auto_unmute then
            return;
        else
            local v1520 = v680.GetPlayerForUserID(v1518.userid);
            if not v1520 then
                return;
            elseif v1520 == v1519 then
                for _, v1522 in pairs(entity.get_players()) do
                    v1515(v1522:get_index());
                end;
                return;
            else
                v1515(v1520:get_index());
                return;
            end;
        end;
    end);
end)();
v1438 = panorama.loadstring("        let entity_panels = {}\n        let entity_data = {}\n        let event_callbacks = {}\n\n        let SLOT_LAYOUT = `\n            <root>\n                <Panel style=\"min-width: 3px; padding-top: 2px; padding-left: 0px;\" scaling='stretch-to-fit-y-preserve-aspect'>\n                    <Image id=\"smaller\" textureheight=\"15\" style=\"horizontal-align: center; opacity: 0.01; transition: opacity 0.1s ease-in-out 0.0s, img-shadow 0.12s ease-in-out 0.0s; overflow: noclip; padding: 3px 5px; margin: -3px -5px;\"  />\n                    <Image id=\"small\" textureheight=\"17\" style=\"horizontal-align: center; opacity: 0.01; transition: opacity 0.1s ease-in-out 0.0s, img-shadow 0.12s ease-in-out 0.0s; overflow: noclip; padding: 3px 5px; margin: -3px -5px;\" />\n                    <Image id=\"image\" textureheight=\"21\" style=\"opacity: 0.01; transition: opacity 0.1s ease-in-out 0.0s, img-shadow 0.12s ease-in-out 0.0s; padding: 3px 5px; margin: -3px -5px; margin-top: -5px;\" />\n                </Panel>\n            </root>\n        `\n\n        let _DestroyEntityPanel = function (key) {\n            let panel = entity_panels[key]\n\n            if(panel != null && panel.IsValid()) {\n                var parent = panel.GetParent()\n                let musor = parent.GetChild(0)\n\n                musor.visible = true\n                if(parent.FindChildTraverse(\"id-sb-skillgroup-image\") != null) {\n                    parent.FindChildTraverse(\"id-sb-skillgroup-image\").style.margin = \"0px 0px 0px 0px\"\n                }\n\n                panel.DeleteAsync(0.0)\n            }\n            delete entity_panels[key]\n        }\n\n        let _DestroyEntityPanels = function() {\n            for(key in entity_panels){\n                _DestroyEntityPanel(key)\n            }\n        }\n\n        let _GetOrCreateCustomPanel = function(xuid) {\n            if(entity_panels[xuid] == null || !entity_panels[xuid].IsValid()){\n                entity_panels[xuid] = null\n\n                let scoreboard_context_panel = $.GetContextPanel().FindChildTraverse(\"ScoreboardContainer\").FindChildTraverse(\"Scoreboard\") || $.GetContextPanel().FindChildTraverse(\"id-eom-scoreboard-container\").FindChildTraverse(\"Scoreboard\")\n\n                if(scoreboard_context_panel == null){\n                    _Clear()\n                    _DestroyEntityPanels()\n\n                    return\n                }\n\n                scoreboard_context_panel.FindChildrenWithClassTraverse(\"sb-row\").forEach(function(el){\n                    let scoreboard_el\n\n                    if(el.m_xuid == xuid) {\n                        el.Children().forEach(function(child_frame){\n                            let stat = child_frame.GetAttributeString(\"data-stat\", \"\")\n                            if(stat == \"rank\")\n                                scoreboard_el = child_frame.GetChild(0)\n                        })\n\n                        if(scoreboard_el) {\n                            let scoreboard_el_parent = scoreboard_el.GetParent()\n\n                            let custom_icons = $.CreatePanel(\"Panel\", scoreboard_el_parent, \"custom-weapons\", {\n                            })\n\n                            if(scoreboard_el_parent.FindChildTraverse(\"id-sb-skillgroup-image\") != null) {\n                                scoreboard_el_parent.FindChildTraverse(\"id-sb-skillgroup-image\").style.margin = \"0px 0px 0px 0px\"\n                            }\n\n                            scoreboard_el_parent.MoveChildAfter(custom_icons, scoreboard_el_parent.GetChild(1))\n\n                            let prev_panel = scoreboard_el_parent.GetChild(0)\n                            prev_panel.visible = false\n\n                            let panel_slot_parent = $.CreatePanel(\"Panel\", custom_icons, `icon`)\n\n                            panel_slot_parent.visible = false\n                            panel_slot_parent.BLoadLayoutFromString(SLOT_LAYOUT, false, false)\n\n                            entity_panels[xuid] = custom_icons\n\n                            return custom_icons\n                        }\n                    }\n                })\n            }\n\n            return entity_panels[xuid]\n        }\n\n        let _UpdatePlayer = function(entindex, path_to_image) {\n            if(entindex == null || entindex == 0)\n                return\n\n            entity_data[entindex] = {\n                applied: false,\n                image_path: path_to_image\n            }\n        }\n\n        let _ApplyPlayer = function(entindex) {\n            let xuid = GameStateAPI.GetPlayerXuidStringFromEntIndex(entindex)\n\n            let panel = _GetOrCreateCustomPanel(xuid)\n\n            if(panel == null)\n                return\n\n            let panel_slot_parent = panel.FindChild(`icon`)\n            panel_slot_parent.visible = true\n\n            let panel_slot = panel_slot_parent.FindChild(\"image\")\n            panel_slot.visible = true\n            panel_slot.style.opacity = \"1\"\n            panel_slot.SetImage(entity_data[entindex].image_path)\n\n            return true\n        }\n\n        let _ApplyData = function() {\n            for(entindex in entity_data) {\n                entindex = parseInt(entindex)\n\n                let xuid = GameStateAPI.GetPlayerXuidStringFromEntIndex(entindex)\n\n                if(!entity_data[entindex].applied || entity_panels[xuid] == null || !entity_panels[xuid].IsValid()) {\n                    if(_ApplyPlayer(entindex)) {\n                        entity_data[entindex].applied = true\n                    }\n                }\n            }\n        }\n\n        let _Create = function() {\n            event_callbacks[\"OnOpenScoreboard\"] = $.RegisterForUnhandledEvent(\"OnOpenScoreboard\", _ApplyData)\n            event_callbacks[\"Scoreboard_UpdateEverything\"] = $.RegisterForUnhandledEvent(\"Scoreboard_UpdateEverything\", function(){\n                _ApplyData()\n            })\n            event_callbacks[\"Scoreboard_UpdateJob\"] = $.RegisterForUnhandledEvent(\"Scoreboard_UpdateJob\", _ApplyData)\n        }\n\n        let _Clear = function() {\n            entity_data = {}\n        }\n\n        let _Destroy = function() {\n            // clear entity data\n            _Clear()\n            _DestroyEntityPanels()\n\n            for(event in event_callbacks){\n                $.UnregisterForUnhandledEvent(event, event_callbacks[event])\n\n                delete event_callbacks[event]\n            }\n        }\n\n        return {\n            create: _Create,\n            destroy: _Destroy,\n            clear: _Clear,\n            update_player: _UpdatePlayer,\n            destroy_panel: _DestroyEntityPanels\n        }\n    ", "CSGOHud")();
v1438.create();
v1459 = (function()
    local l_GetPlayerXuidStringFromEntIndex_0 = panorama.GameStateAPI.GetPlayerXuidStringFromEntIndex;
    return function(v1524)
        -- upvalues: l_GetPlayerXuidStringFromEntIndex_0 (ref)
        if not v1524 then
            return;
        else
            local v1525 = l_GetPlayerXuidStringFromEntIndex_0(v1524:get_index());
            if not v1525 then
                return;
            else
                local v1526 = v1525:sub(4, -1);
                if #v1526 == 0 then
                    return;
                else
                    return 76500000000000000ULL + tonumber(v1526);
                end;
            end;
        end;
    end;
end)();
v1460 = (function()
    ffi.cdef("        \tuint32_t GetModuleHandleA(const char* lpModuleName);\n        \tuint32_t GetProcAddress(uint32_t hModule, const char* lpProcName);\n        ");
    local v1527 = ffi.typeof("            struct {\n        \t\tint m_eType;\n        \t\tint m_cbSize;\n        \t\tunion {\n        \t\t\tuint64_t m_steamID64;\n        \t\t\tchar m_szGenericString[ 32 ];\n        \t\t\tuint8_t m_genericBytes[ 32 ];\n        \t\t\tchar m_szUnknownRawString[ 128 ];\n        \t\t\tvoid* m_ip;\n        \t\t\tuint32_t m_reserved[ 32 ];\n        \t\t};\n        \t}\n        ");
    local v1528 = ffi.typeof("            struct {\n                void* m_pData;\n                int m_cbSize;\n                unsigned int m_conn;\n                $ m_identityPeer;\n                int64_t m_nConnUserData;\n                long long m_usecTimeReceived;\n                int64_t m_nMessageNumber;\n                void(__thiscall* m_pfnFreeData)(void*);\n                void(__thiscall* m_pfnRelease)(void*);\n                int m_nChannel;\n                int m_nFlags;\n                int64_t m_nUserData;\n            }\n        ", v1527);
    local v1529 = ffi.C.GetProcAddress(ffi.C.GetModuleHandleA("steamnetworkingsockets.dll"), "SteamNetworkingMessages_LibV2");
    assert(v1529 ~= 0, "failed to get steam_networking_messages");
    local l_v1527_0 = v1527;
    local v1531 = ffi.typeof("$* [?]", v1528);
    local v1532 = ffi.cast("void***", ffi.cast("void*(__thiscall*)()", v1529)());
    local v1533 = ffi.cast(ffi.typeof("int(__thiscall*)(void*, const $&, const void *, uint32_t, int, int)", v1527), v1532[0][0]);
    local v1534 = ffi.cast(ffi.typeof("int(__thiscall*)(void*, int, $, int)", v1531), v1532[0][1]);
    local v1535 = ffi.cast(ffi.typeof("bool(__thiscall*)(void*, const $&)", v1527), v1532[0][2]);
    local v1536 = ffi.cast(ffi.typeof("bool(__thiscall*)(void*, const $&)", v1527), v1532[0][3]);
    local v1537 = 2000;
    local function v1544(v1538, v1539, v1540)
        -- upvalues: l_v1527_0 (ref), v1533 (ref), v1532 (ref), v1537 (ref)
        local v1541 = ffi.cast("uint64_t", v1538);
        local v1542 = ffi.cast("const char*", v1539);
        local v1543 = l_v1527_0();
        v1543.m_eType = 16;
        v1543.m_cbSize = ffi.sizeof(v1541);
        v1543.m_steamID64 = v1541;
        return v1533(v1532, v1543, v1542, v1539:len(), 8, v1540 or v1537);
    end;
    local function v1547(v1545)
        -- upvalues: v1531 (ref), v1534 (ref), v1532 (ref), v1537 (ref)
        local v1546 = v1531(1337);
        return v1534(v1532, v1545 or v1537, v1546, 1337), v1546;
    end;
    local function v1551(v1548)
        -- upvalues: l_v1527_0 (ref), v1536 (ref), v1532 (ref)
        local v1549 = ffi.cast("uint64_t", v1548);
        local v1550 = l_v1527_0();
        v1550.m_eType = 16;
        v1550.m_cbSize = ffi.sizeof(v1549);
        v1550.m_steamID64 = v1549;
        return v1536(v1532, v1550);
    end;
    local function v1555(v1552)
        -- upvalues: l_v1527_0 (ref), v1535 (ref), v1532 (ref)
        local v1553 = ffi.cast("uint64_t", v1552);
        local v1554 = l_v1527_0();
        v1554.m_eType = 16;
        v1554.m_cbSize = ffi.sizeof(v1553);
        v1554.m_steamID64 = v1553;
        return v1535(v1532, v1554);
    end;
    return {
        send_message_to_user = v1544, 
        receive_messages_on_channel = v1547, 
        close_connection_with_user = v1551, 
        accept_session_with_user = v1555
    };
end)();
do
    local l_v1438_2, l_v1459_0, l_v1460_1, l_l_anim_breakers_0_1, l_v1462_1, l_v1463_1 = v1438, v1459, v1460, l_anim_breakers_0, v1462, v1463;
    l_l_anim_breakers_0_1 = (function()
        -- upvalues: l_v1438_2 (ref), v67 (ref), v133 (ref), l_v1459_0 (ref), l_v1460_1 (ref), v2 (ref)
        local v1562 = {};
        local function v1566()
            -- upvalues: v1562 (ref), l_v1438_2 (ref)
            for _, v1564 in pairs(entity.get_players()) do
                local v1565 = v1564:get_index();
                if v1562[v1565] then
                    table.remove(v1562, v1565);
                end;
            end;
            l_v1438_2.destroy_panel();
        end;
        local v1567 = {
            Kikron = 1, 
            Mishkat = 1, 
            KuCJloTa1337 = 1, 
            lenin = 1
        };
        local function v1574()
            -- upvalues: v1566 (ref), v1567 (ref), v67 (ref), v133 (ref), l_v1459_0 (ref), l_v1460_1 (ref)
            local v1568 = entity.get_local_player();
            v1566();
            local v1569 = {
                hash = "fa8a2f2ecbce2b23c7589a4543ff881c", 
                idx = v1568:get_index(), 
                version = v1567[v67.username] and 3 or v67.build == "beta" and 2 or 1
            };
            local v1570 = "[[" .. v133.stringify(v1569) .. "]]";
            for _, v1572 in pairs(entity.get_players()) do
                if v1572 ~= v1568 then
                    local v1573 = l_v1459_0(v1572);
                    if v1573 then
                        l_v1460_1.close_connection_with_user(v1573);
                        l_v1460_1.send_message_to_user(v1573, v1570);
                    end;
                end;
            end;
        end;
        local function v1579()
            -- upvalues: l_v1459_0 (ref), l_v1460_1 (ref)
            local v1575 = entity.get_local_player();
            for _, v1577 in pairs(entity.get_players()) do
                if v1577 ~= v1575 then
                    local v1578 = l_v1459_0(v1577);
                    if v1578 then
                        l_v1460_1.accept_session_with_user(v1578);
                    end;
                end;
            end;
        end;
        local function v1584(v1580)
            -- upvalues: v133 (ref)
            if not v1580 or not v1580:find("fa8a2f2ecbce2b23c7589a4543ff881c") then
                return;
            else
                local v1581 = string.gmatch(v1580, "([^[[]+)([]]]+)")();
                if not v1581 or #v1581 == 0 then
                    return;
                else
                    local l_status_6, l_result_6 = pcall(v133.parse, v1581);
                    if not l_status_6 then
                        return;
                    else
                        return l_result_6;
                    end;
                end;
            end;
        end;
        local v1585 = {
            [1] = "acid", 
            [2] = "acidb", 
            [3] = "acid_dev"
        };
        local function v1588()
            -- upvalues: v1562 (ref), l_v1438_2 (ref), v1567 (ref), v67 (ref)
            local v1586 = entity.get_local_player();
            if v1586 then
                local v1587 = v1586:get_index();
                v1562[v1587] = {
                    backup = -1337, 
                    level = 8525
                };
                l_v1438_2.update_player(v1587, ("file://{images}/icons/acidtech/%s.png"):format(v1567[v67.username] and "acid_dev" or v67.build ~= "beta" and "acid" or "acidb"));
            end;
        end;
        local function v1596()
            -- upvalues: l_v1460_1 (ref), v1584 (ref), v1562 (ref), l_v1459_0 (ref), l_v1438_2 (ref), v1585 (ref), v1588 (ref)
            local v1589, v1590 = l_v1460_1.receive_messages_on_channel();
            for v1591 = 1, v1589 do
                local v1592 = v1590[v1591 - 1][0];
                if v1592 then
                    local v1593 = v1584(ffi.string(v1592.m_pData));
                    if v1593 then
                        local v1594 = entity.get(v1593.idx);
                        if v1594 then
                            v1562[v1593.idx] = {
                                backup = -1337, 
                                level = v1593.version == 0 and 8524 or 8525
                            };
                            local v1595 = l_v1459_0(v1594);
                            if v1595 then
                                l_v1460_1.close_connection_with_user(v1595);
                            end;
                            l_v1438_2.update_player(v1593.idx, ("file://{images}/icons/acidtech/%s.png"):format(v1585[v1593.version]));
                        end;
                    end;
                end;
            end;
            v1588();
        end;
        local v1597 = {
            [1] = "materials", 
            [2] = "panorama", 
            [3] = "images", 
            [4] = "icons", 
            [5] = "acidtech"
        };
        local v1598 = {
            ["acid_dev.png"] = "https://i.imgur.com/BF6BBAk.png", 
            ["acidb.png"] = "https://i.imgur.com/FntUDbe.png", 
            ["acid.png"] = "https://i.imgur.com/JuieUCH.png"
        };
        local v1602 = (function()
            local v1599 = ffi.cast("void***", utils.create_interface("filesystem_stdio.dll", "VBaseFileSystem011"));
            local v1600 = ffi.cast("bool(__thiscall*)(void*, const char*, const char*)", v1599[0][10]);
            return function(v1601)
                -- upvalues: v1600 (ref), v1599 (ref)
                return v1600(v1599, v1601, nil);
            end;
        end)();
        local function v1611()
            -- upvalues: v1597 (ref), v1598 (ref), v1602 (ref), v2 (ref)
            local v1603 = common.get_game_directory() .. "\\";
            for v1604 = 1, #v1597 do
                local v1605 = v1603 .. v1597[v1604];
                files.create_folder(v1605);
                v1603 = v1605 .. "\\";
            end;
            local l_v1603_0 = v1603;
            for v1607, v1608 in pairs(v1598) do
                local v1609 = l_v1603_0 .. v1607;
                if not v1602(v1609) then
                    v2("file didnt exist");
                    local v1610 = network.get(v1608);
                    if v1610 then
                        files.write(v1609, v1610, true);
                    end;
                end;
            end;
        end;
        return {
            update_local = v1588, 
            clean_players = v1566, 
            send_messages = v1574, 
            download_images = v1611, 
            receive_messages = v1596, 
            accept_connections = v1579
        };
    end)();
    l_l_anim_breakers_0_1.download_images();
    l_v1462_1 = false;
    l_v1463_1 = false;
    v260:add("draw", "sync draw", function()
        -- upvalues: l_v1462_1 (ref), v178 (ref), v263 (ref), l_v1463_1 (ref), l_l_anim_breakers_0_1 (ref), l_v1438_2 (ref)
        l_v1462_1 = v178.misc and v263.Misc.synchronization:get();
        if globals.is_connected and globals.is_in_game then
            if l_v1462_1 then
                if not l_v1463_1 then
                    l_l_anim_breakers_0_1.update_local();
                    l_v1463_1 = true;
                end;
            elseif l_v1463_1 then
                l_v1438_2.clear();
                l_l_anim_breakers_0_1.clean_players();
                l_v1463_1 = false;
            end;
        end;
    end);
    v260:add("shutdown", "sync shutdown", function()
        -- upvalues: l_l_anim_breakers_0_1 (ref), l_v1438_2 (ref)
        l_l_anim_breakers_0_1.clean_players();
        if l_v1438_2 and l_v1438_2.destroy then
            l_v1438_2.destroy();
        end;
    end);
    v260.breakpoints["sync round_end"] = -1;
    v260:add("round_end", "sync round_end", function()
        -- upvalues: v260 (ref), l_v1462_1 (ref), l_l_anim_breakers_0_1 (ref), l_v1438_2 (ref)
        v260.breakpoints["sync round_end"] = 0;
        if l_v1462_1 then
            v260.breakpoints["sync round_end"] = 1;
            l_l_anim_breakers_0_1.send_messages();
        else
            v260.breakpoints["sync round_end"] = 2;
            l_l_anim_breakers_0_1.clean_players();
        end;
        v260.breakpoints["sync round_end"] = 3;
        l_v1438_2.clear();
        v260.breakpoints["sync round_end"] = 4;
    end);
    v260:add("round_prestart", "sync round_prestart", function()
        -- upvalues: l_v1462_1 (ref), l_l_anim_breakers_0_1 (ref)
        if l_v1462_1 then
            l_l_anim_breakers_0_1.accept_connections();
        end;
    end);
    v260:add("round_freeze_end", "sync round_freeze_end", function()
        -- upvalues: l_v1462_1 (ref), l_l_anim_breakers_0_1 (ref)
        if l_v1462_1 then
            l_l_anim_breakers_0_1.receive_messages();
        end;
    end);
    v260:add("level_init", "sync level init", function()
        -- upvalues: l_v1438_2 (ref)
        l_v1438_2.clear();
    end);
end;
(function()
    -- upvalues: v260 (ref), v178 (ref), v179 (ref), v680 (ref), v263 (ref)
    local l_random_int_0 = utils.random_int;
    local v1613 = {
        start = {
            [1] = "\208\177\208\187\209\143", 
            [2] = "\208\189\209\131", 
            [3] = "ahah", 
            [4] = "\208\177\208\187\209\143\209\143\209\143", 
            [5] = "\208\191\208\184\208\183\208\180\208\176", 
            [6] = "\209\130\209\131\208\180\208\176", 
            [7] = "\208\186\209\131\208\180\208\176 \208\187\208\181\209\130\208\184\209\136\209\140", 
            [8] = "\208\191\208\190\208\187\209\131\209\135\208\184\208\187 \208\191\208\190 \208\177\208\176\209\136\208\186\208\181", 
            [9] = "1.", 
            [10] = "ez", 
            [11] = "ahah", 
            [12] = "\209\141\209\130\208\190\209\130 \208\188\209\131\208\178", 
            [13] = "\208\189\208\190\209\128\208\188\208\176\209\129", 
            [14] = "\208\189\208\190\209\128\208\188", 
            [15] = "\208\178\208\191\208\181\208\189\208\184\208\187 \208\184\208\180\208\184\208\190\209\130\208\176", 
            [16] = "\208\178\209\129\208\190\209\135\208\189\209\143\209\128\208\184\208\187 \209\133\209\131\208\181\209\129\208\190\209\129\208\176", 
            [17] = "\209\130\209\139 \208\188\208\189\208\181 \208\178 \209\136\208\184\209\128\208\184\208\189\208\186\209\131 \208\180\209\139\209\136\208\184\209\136\209\140", 
            [18] = "\209\129\208\187\208\176\208\178\208\176 \209\131\208\186\209\128\208\176\208\184\208\189\208\184", 
            [19] = "\208\186\209\131\208\180\208\176 \209\129\208\191\209\128\209\143\209\130\208\176\208\187\209\129\209\143", 
            [20] = "\208\188\208\181\208\189\209\143 \208\189\208\181 \209\131\208\177\208\184\209\130\209\140", 
            [21] = "\208\190\208\191\208\190\208\183\208\190\209\128\208\184\208\187\209\129\209\143", 
            [22] = "\209\128\208\176\208\183\209\138\208\181\208\177\208\190\208\189\209\135\208\184\208\186", 
            [23] = "\208\189\208\176 \208\183\208\180\208\190\209\128\208\190\208\178\209\140\208\181", 
            [24] = "\208\180\208\190\208\189 \208\187\208\184\208\188\208\190\208\189", 
            [25] = "\208\180\208\190\208\189 \208\178\208\176\209\130\208\181\209\128\208\188\208\181\208\187\208\190\208\189", 
            [26] = "stay acid"
        }, 
        mid = {
            [1] = "\209\135\208\188\208\190", 
            [2] = "name", 
            [3] = "\208\177\208\184\209\135", 
            [4] = "name", 
            [5] = "\208\180\208\190\208\187\208\177\208\176\209\145\208\177", 
            [6] = "\209\131\208\187\208\181\209\130\208\181\208\187 \208\189\208\176 \208\179\208\190\209\128\209\136\208\186\208\181", 
            [7] = "\208\191\208\184\208\180\208\190\209\128\208\176\209\129", 
            [8] = "\209\129\208\187\208\184\209\130\209\139\208\185", 
            [9] = "\208\191\209\128\208\190\208\187\209\131\208\183\208\176\208\178\209\136\208\184\208\185", 
            [10] = "\209\130\209\131\208\191\208\190\209\128\209\139\208\187\209\139\208\185", 
            [11] = "\209\135\208\188\208\190", 
            [12] = "\209\131\208\189\208\184\208\182\208\181\208\189\208\189\209\139\208\185 \208\184\208\189\208\178\208\176\208\187\208\184\208\180", 
            [13] = "superior slow walk unhsble", 
            [14] = "\209\136\208\187\209\142\209\133\208\176"
        }, 
        close = {
            [1] = "\208\189\208\176\209\133", 
            [2] = "\208\191\208\190\208\191\209\131\209\137\208\181\208\189\209\139\208\185", 
            [3] = "\208\181\208\177\208\187\208\176\208\189 \208\176\209\133\208\176\209\133", 
            [4] = "\208\177\208\187\209\143 \208\177\208\190\208\182\208\181", 
            [5] = "\209\135\209\145 \209\130\209\139 \208\180\208\181\208\187\208\176\208\181\209\136\209\140", 
            [6] = "ahah", 
            [7] = "\208\190\208\188\208\188\208\179", 
            [8] = "...", 
            [9] = "\209\131\209\135\208\184\209\129\209\140 \208\184\208\179\209\128\208\176\209\130\209\140", 
            [10] = "\209\133\208\190\209\135\208\181\209\136\209\140 \208\177\208\187\209\143 \208\188\208\177 \208\191\208\190\209\131\209\135\208\184\209\140\209\129\209\143 \208\184\208\179\209\128\208\176\209\130\209\140 \209\131 \208\188\208\181\208\189\209\143???", 
            [11] = "\208\188\209\141\208\187\209\129\209\130\209\128\208\190\208\185 \208\177\209\139 \208\189\208\181 \208\190\208\180\208\190\208\177\209\128\208\184\208\187", 
            [12] = "\209\129\208\187\208\184\209\136\208\186\208\190\208\188 \208\191\209\128\208\190\209\129\209\130\208\190 \208\180\208\187\209\143 \208\188\208\181\208\189\209\143 (\226\151\149\226\128\191\226\151\149)", 
            [13] = "\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144 (\226\140\163\204\128_\226\140\163\204\129) \208\151\208\144\208\159\208\149\208\157", 
            [14] = "\209\143 \209\131\208\182\208\181 \208\188\208\176\209\130\209\145\209\128\209\139\208\185 \208\178 \209\141\209\130\208\190\208\188 \208\180\208\181\208\187\208\181", 
            [15] = "\208\189\208\184\208\186\209\129\208\178\208\176\209\128>all"
        }, 
        v2 = {
            [1] = "0 \208\190\209\136\208\184\208\177\208\190\208\186", 
            [2] = "stay acid \209\136\208\187\209\142\209\133\208\176 \226\128\162_\226\128\162)", 
            [3] = "\208\178\209\129\208\190\209\135\208\189\209\143\209\128\208\184\208\187 \208\179\208\176\208\178\208\189\208\190\208\181\208\180\208\176", 
            [4] = "\208\187\208\190\208\187, \208\184\208\180\208\184 \209\129\208\186\208\184\208\187\208\187\209\131\209\133\209\131 \209\130\209\128\208\181\208\189\208\189\208\184\209\128\209\131\208\185, \208\189\209\131\208\177\208\176\209\129", 
            [5] = "\209\131\208\189\208\184\208\182\208\181\208\189\208\189\209\139\208\185 \208\184\208\189\208\178\208\176\208\187\208\184\208\180 \209\130\209\139 \208\188\208\189\208\181 \208\178 \209\136\208\184\209\128\208\184\208\189\208\186\209\131 \208\180\209\139\209\136\208\184\209\136\209\140", 
            [6] = "\208\189\208\176\208\185\209\129 \208\176\208\186\208\186\208\176\209\131\208\189\209\130 [\204\178\204\133$\204\178\204\133(\204\178\204\1331\204\133)\204\178\204\133$\204\178\204\133]", 
            [7] = "\208\189\209\142\209\133\208\176\208\185 \208\191\209\141\208\189\209\129\208\181\208\187,\208\177\208\176\208\186\208\187\208\176\208\189", 
            [8] = "acidtech gang", 
            [9] = "\208\186\208\190\208\187\208\184\208\186\208\184 \208\177\208\190\208\187\208\184\208\186\208\184", 
            [10] = "AcidTech.LUA \208\157\208\144 \208\161\208\149\208\160\208\146\208\149\208\160\208\149, \208\146\208\161\208\149\208\156 \208\158\208\162\208\158\208\153\208\162\208\152 \208\157\208\144 \208\145\208\149\208\151\208\158\208\159\208\144\208\161\208\157\208\158\208\149 \208\160\208\144\208\161\208\161\208\162\208\158\208\175\208\157\208\152\208\149", 
            [11] = "~\226\157\164\208\162\208\178\208\190\208\185|\208\160\208\176\209\129\209\130\208\176\209\132\208\176\209\128\208\176\208\185\226\157\164~", 
            [12] = "\208\178\208\190 \209\129\208\188\208\181\209\133, \208\176\208\182 \208\191\208\190\208\191\208\190\208\185 \209\133\209\128\209\142\208\186\208\189\209\131\208\187 \208\188\208\176\208\187\209\145\209\133\208\176", 
            [13] = "\208\163 \208\159\208\144\208\160\208\157\208\175 \208\144\208\144 \208\158\208\162 \208\161\208\154\208\152\208\162\208\144 \208\158\208\162\208\154\208\144\208\151\208\144\208\155\208\152 \208\154\208\144\208\154 \208\154\208\155\208\144\208\157\208\162\208\149\208\147 AcidTech \208\163\208\146\208\152\208\148\208\149\208\155\208\152 \208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144", 
            [14] = "\208\178\208\191\208\184\209\130\209\139\208\178\208\176\208\185 \208\184 \209\130\208\181\209\128\208\191\208\184", 
            [15] = "\208\178\208\184\208\180\208\189\208\190 \209\130\209\139 \208\177\208\181\208\183 AcidTech.lua, \208\191\208\190\209\128\208\176 \208\191\209\128\208\184\208\186\209\131\208\191\208\184\209\130\209\140 \209\129\209\139\208\189\208\190\209\135\208\181\208\186", 
            [16] = "\208\163\208\146\208\158\208\155\208\149\208\157 by AcidTech.lua", 
            [17] = "\208\189\208\187 \209\129\208\181\208\179\208\190\208\180\208\189\209\143 \208\191\208\190\208\180\208\186\208\190\208\178\208\176\208\189", 
            [18] = "fipp#3882 \208\189\208\176\208\191\208\184\209\136\208\184 \208\181\209\129\208\187\208\184 \209\132\209\128\208\184 \208\186\209\132\208\179 \208\189\208\176 \208\189\208\187\208\186\209\131 \208\178\209\139\208\180\208\176\209\130\209\140", 
            [19] = "\208\180\208\182\209\131\208\188\208\176\208\189\208\180\208\182\208\176)", 
            [20] = "\208\191\208\176\209\134\208\176\208\189 \208\191\208\190\208\191\209\131\209\130\208\176\208\187 \208\177\208\181\209\128\208\181\208\179\208\176 \208\184 \208\177\209\139\208\187 \208\191\209\128\208\190\208\191\208\181\208\189\208\181\208\189", 
            [21] = "\208\183\208\176\208\183\208\181\208\178\208\176\208\187\209\129\209\143 \208\184 \208\191\208\190\208\189\209\142\209\133\208\176\208\187 \208\177\208\181\208\177\209\128\208\190\209\135\208\186\208\184 ( \205\161\202\152 \205\156\202\150 \205\161\202\152)", 
            [22] = "\209\131\209\130\209\128\208\190 \208\189\208\176\209\135\208\184\208\189\208\176\208\181\209\130\209\129\209\143 \209\129 \208\191\209\131\208\187\208\184 \208\190\209\130 \208\176\209\129\208\184\208\180\209\130\208\181\209\135.\208\187\209\131\208\176", 
            [23] = "\208\189\208\181 \209\129\208\189\208\184\208\188\208\176\208\185 \208\191\208\190\208\180\208\179\209\131\208\183\208\189\208\184\208\186, \208\191\209\128\208\190\209\129\209\130\208\190 \208\190\209\130\208\190\208\180\208\178\208\184\208\189\209\140 \208\181\208\179\208\190 \208\178 \209\129\209\130\208\190\209\128\208\190\208\189\209\131", 
            [24] = "\208\191\209\128\208\190\208\188\208\190\208\187\209\135\208\184\209\136\209\140?", 
            [25] = "\208\189\208\181\208\182\208\181\208\187\208\176\209\130\208\181\208\187\209\140\208\189\209\139\208\185 \208\190\208\186\209\131\209\128\208\190\208\186 \208\177\209\139\208\187 \208\189\208\176\208\186\208\176\208\183\208\176\208\189", 
            [26] = "hs", 
            [27] = "\226\153\155\208\176\208\187\209\140\209\132\208\176\209\135 \208\189\208\176 \209\129\208\181\209\128\208\178\208\181\209\128\208\181\226\153\155", 
            [28] = "\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144 (\239\188\155\226\140\163\204\128_\226\140\163\204\129) \208\151\208\144\208\159\208\149\208\157", 
            [29] = "\208\178\209\129\208\181 \208\190\208\191\209\128\208\176\208\178\208\180\208\176\208\189\208\184\209\143 \208\178 \208\191\209\141\208\189\209\129\208\181\208\187", 
            [30] = "1.", 
            [31] = "\209\135\208\181\208\187 \209\129 \208\186\209\132\208\179 \208\190\209\130 \209\128\208\181\208\183\208\190\208\187\209\140\208\178\208\181\209\128\208\176, \208\186\208\190\208\183\209\143\208\178\209\131 \208\179\208\187\208\190\209\130\208\176\208\181\209\136\209\140?", 
            [32] = "\208\189\208\181\208\188\208\189\208\190\208\179\208\190 \208\189\208\176\208\191\209\128\209\131\208\180\208\190\208\189\208\184\208\187", 
            [33] = "\209\135\209\130\208\190 \208\183\208\176 \208\186\209\128\208\176\209\129\208\190\209\130\208\176, \209\129\209\128\208\181\208\180\208\184 \209\141\209\130\208\190 \208\188\208\176\209\129\209\129\208\190\208\178\208\186\208\184", 
            [34] = "\208\190\208\179\209\131\208\183\208\190\208\186 \208\189\208\176\208\180\209\128\208\184\209\129\209\130\208\176\208\187 \209\129\208\190 \209\129\208\178\208\190\208\181\208\185 \208\191\208\187\208\181\209\136\208\184", 
            [35] = "\208\191\209\128\208\184\208\187\208\190\209\129\208\186\208\176\208\187 \208\186\208\190\209\129\208\188\208\176\209\130\208\190\208\179\208\190 ~(\203\152\226\150\190\203\152~)", 
            [36] = "\209\129\208\187\208\176\208\178\208\176 \208\177\208\190\208\179\209\131 \209\143 \209\142\208\183\208\176\209\142 AcidTech", 
            [37] = "\208\190\208\177\208\190\209\129\209\129\208\176\208\187 \208\189\208\181 \208\178\208\183\208\184\209\128\208\176\209\143 \208\189\208\181 \208\191\208\190\209\129\208\187\208\181\208\180\209\129\209\130\208\178\208\184\209\143", 
            [38] = "\208\191\208\190\209\135\209\131\209\133\208\176\208\187 \208\191\208\190\208\191\209\131 \208\191\208\176\208\187\209\140\209\135\208\184\208\186\208\190\208\188", 
            [39] = "\208\189\209\131 \209\130\209\139 \208\183\208\178\208\181\209\128\209\140", 
            [40] = "\208\178\208\186\209\131\209\129\208\189\208\190?", 
            [41] = "\208\191\208\190\208\189\209\142\209\133\208\176\208\185 \208\191\208\190\208\191\209\131 \208\189\208\190\209\129\208\184\208\186\208\190\208\188, \208\191\209\128\208\184\208\186\208\184\208\189\209\140\209\129\209\143 \208\186\208\184\209\129\208\176 \208\191\209\145\209\129\208\184\208\186\208\190\208\188", 
            [42] = "\208\186\209\131\208\180\208\176 \209\129\208\191\209\128\209\143\209\130\208\176\208\187\209\129\209\143, \208\188\208\176\208\188\208\176 \208\189\208\176\209\131\209\135\208\184\208\187\208\176 \208\184\208\183 \209\136\208\186\208\176\209\132\208\176 \208\191\208\190\208\180\208\179\208\187\209\143\208\180\209\139\208\178\208\176\209\130\209\140?", 
            [43] = "\208\188\208\181\208\189\209\143 \208\189\208\181 \209\131\208\177\208\184\209\130\209\140 - superior slow walk unhsble", 
            [44] = "\208\191\208\176\209\128\208\189\208\184, \209\143 \208\184 \208\191\209\145\209\128\208\189\209\131\209\130\209\140 \208\189\208\181 \209\131\209\129\208\191\208\181\208\178\208\176\209\142, \208\178\209\139 \209\131\208\182\208\181 \208\189\209\142\209\133\208\176\208\181\209\130\208\181", 
            [45] = "\209\135\208\184\209\130 \208\190\208\186\208\187\208\181\208\188\208\176\208\187\209\129\209\143 \208\188\208\190\208\182\208\189\208\190 \208\184 \208\191\208\190\208\191\208\181\208\189\208\184\209\130\209\140", 
            [46] = "\208\191\208\176\209\128\208\181\208\189\209\140, \209\143 \208\178\208\184\208\182\209\131 \209\130\209\139 \208\177\208\181\208\180\208\190\208\187\208\176\208\179\208\176, \208\183\208\176\208\185\208\180\208\184 \208\189\208\176 \209\132\208\190\209\128\209\131\208\188 \209\130\208\176\208\188 \209\137\208\176 AcidTech \208\189\208\190\208\188\208\181\209\128 1", 
            [47] = "\208\177\208\190\209\130\208\184\208\186, \209\130\209\139 \208\191\209\128\208\190 AcidTech.lua \209\129\208\187\209\139\209\133\208\176\208\187 \209\135\208\181\209\130\208\190?", 
            [48] = "\208\190\208\191\208\176, \209\135\208\184\209\130 \208\191\209\128\208\190\208\179\209\128\208\181\208\187", 
            [49] = "\208\191\209\128\208\190\209\131\209\135\208\181\208\189.", 
            [50] = "\208\189\208\176 \208\178\208\184\209\128\208\176\208\182\208\184\208\186\208\181 \209\136\208\187\208\181\208\191\208\190\208\186 \208\180\208\176\208\187 \208\189\208\181\208\177\208\190\208\187\209\140\209\136\208\190\208\185", 
            [51] = "Malik163#6401 \208\180\208\190\208\177\208\176\208\178\209\140 \208\178 \208\180\209\128, \208\184\209\137\209\131 \208\180\209\128\209\131\208\183\208\181\208\185", 
            [52] = "AcidTech \208\191\208\190\208\186\208\176\208\183\209\139\208\178\208\176\208\181\209\130 \208\189\208\176\208\179\208\187\208\181\208\182\208\176 (\226\151\163_\226\151\162)", 
            [53] = "\208\190\208\191\209\143\209\130\209\140 \208\190\208\180\208\184\208\189 \208\183\208\176 \209\130\208\184\208\188\208\188\208\181\208\185\209\130\208\190\208\178 \208\178\209\129\209\142 \209\128\208\176\208\177\208\190\209\130\209\131 \209\129\208\180\208\181\208\187\208\176\208\187", 
            [54] = "\209\131 \208\186\208\190\208\179\208\190 \209\129\208\186\208\184\209\130 \208\191\209\128\208\181\208\180\208\187\208\190\208\179\208\176\209\142 \208\183\208\176\209\129\208\189\209\131\209\130\209\140 \208\178 \208\191\208\190\208\191\209\131 \208\191\209\128\208\190\208\177\208\186\209\131 - \208\190\209\137\209\131\209\137\208\181\208\189\208\184\209\143 \209\130\208\181 \208\182\208\181, \208\180\208\176\208\182\208\181 \208\191\209\128\208\184\209\143\209\130\208\189\208\181\208\181", 
            [55] = "\209\130\209\139 \208\189\208\181 \209\131\208\188\209\145\209\133\208\176, \208\179\208\176\208\185\208\180\209\139 \208\190\209\130 KuCJloTa HvH \208\191\208\190\209\129\208\188\208\190\209\130\209\128\208\184", 
            [56] = "\209\143 \209\131\208\182\208\181 \208\188\208\176\209\130\209\145\209\128\209\139\208\185 \208\178 \209\141\209\130\208\190\208\188 \208\180\208\181\208\187\208\181", 
            [57] = "\209\130\209\131\209\129\208\189\209\143 \208\191\208\190\209\136\208\187\208\176 (\226\140\146\226\128\191\226\140\146)", 
            [58] = "\208\190\208\191\208\190\208\183\208\190\209\128\208\184\208\187 \209\135\209\131\209\133\208\176\208\189\209\135\208\184\208\186\208\176", 
            [59] = "\209\143 \208\191\208\190\208\180\208\186\208\190\208\178\208\176\208\189 \208\178 \209\141\209\130\208\190\208\188", 
            [60] = "\208\188\208\190\209\135\208\186\208\176\208\189\209\131\208\187 \208\189\208\176\208\184\208\178\208\189\208\190\208\179\208\190", 
            [61] = "\208\186\209\128\208\181\208\188 \208\184\208\183 \208\191\208\184\209\129\209\142\209\133\208\184 \227\131\131", 
            [62] = "\208\189\208\176 \208\186\209\131\209\128\208\176\208\182\208\184\208\186\208\181 \208\178 \208\179\208\176\208\178\208\189\209\145\209\133\209\131 \208\189\208\176\209\129\209\130\209\131\208\191\208\184\208\187", 
            [63] = "\208\159\209\128\208\184\208\189\209\134\208\181\209\129\209\129\208\176 \208\190\208\179\208\190\209\128\208\190\209\136\208\181\208\189\208\176 (o_O)", 
            [64] = "\208\187\209\142\208\180\208\184 \209\129\208\177\208\181\208\182\208\176\208\187\208\184 \208\178 \209\129\209\130\209\128\208\176\209\133\208\181... \209\129\208\181\209\128\208\178\208\181\209\128 \208\191\209\128\208\190\208\186\208\176\209\135\208\181\208\189...", 
            [65] = "\208\188\208\190\209\135\208\176\208\187\208\186\208\176 \208\183\208\176\209\133\208\190\209\130\208\181\208\187\208\176 \209\128\208\176\208\183\208\180\209\128\208\176\209\143 \208\184 \208\177\209\139\208\187\208\176 \208\183\208\176\208\191\208\181\208\189\208\184\208\189\208\176", 
            [66] = "\208\191\208\190\209\130\208\190\208\188\209\131 \209\135\209\130\208\190 \208\179\208\187\208\176\208\180\208\184\208\190\208\187\209\131\209\129 \194\175\\_(\227\131\132)_/\194\175", 
            [67] = "\208\177\208\181\208\180\208\190\208\187\208\176\208\182\208\189\209\139\208\185, \208\191\208\190\208\189\209\142\209\133\208\176\208\185 \208\188\208\190\208\185 acidtech:3", 
            [68] = "\208\189\208\176\209\130\209\139\208\186\208\176\208\187\209\129\209\143 \209\143 \208\179\208\180\208\181\209\130\208\190 \208\189\208\176 \209\130\208\181\208\177\209\143, \209\130\209\139 c \208\186\208\187\208\176\208\189\209\130\208\181\208\179\208\190\208\188 chimera \208\190\209\130\209\129\208\176\209\129\209\139\208\178\208\176\208\187?", 
            [69] = "\208\183\208\176\208\191\208\181\208\189\209\143\208\178\208\190\209\135\208\186\208\176 \208\189\208\176 \209\129\208\181\209\128\208\178\208\181\209\128\208\181", 
            [70] = "\209\128\208\176\208\183\209\138\208\181\208\177\208\190\208\189\209\135\208\184\208\186", 
            [71] = "senpai~~~, \208\183\208\176\208\190\208\178\208\189\208\184 \208\188\208\181\208\189\209\143 ^^", 
            [72] = "\208\189\208\176 \208\186\209\131\209\128\208\176\208\182\208\184\208\186\208\181", 
            [73] = "\208\191\208\181\208\189\208\176 \209\130\208\176\208\186 \208\184 \209\133\208\187\208\181\209\137\208\181\209\130", 
            [74] = "\208\186\208\190\208\191\208\190\209\130\209\140 \209\130\208\176\208\186 \208\184 \208\180\209\139\208\188\209\131\209\128\208\184\209\130\209\129\209\143", 
            [75] = "\208\186\208\176\208\186 \208\190\209\130\208\189\208\190\209\129\208\184\209\136\209\140\209\129\209\143 \208\186 \208\176\208\189\208\176\208\189\208\176\209\129\209\131 \208\189\208\176 \208\191\208\184\209\134\209\134\208\181?", 
            [76] = "\209\129\208\178\208\184\208\189\209\143\209\135\208\184\208\185 \208\189\208\176\208\191\208\181\208\189", 
            [77] = "\208\189\208\176 \208\183\208\180\208\190\209\128\208\190\208\178\209\140\208\181", 
            [78] = "\208\191\208\190\208\180\209\130\209\128\208\184\209\133\208\176\208\188\208\190\208\189\208\190\208\183\208\184\208\187", 
            [79] = "\208\190\209\130\208\186\208\176\208\189\208\184\209\132\208\190\208\187\208\184\208\187", 
            [80] = "\208\180\208\190\208\189 \208\187\208\184\208\188\208\190\208\189", 
            [81] = "\208\183\208\176\208\186\209\128\209\139\209\130 \208\191\208\190\209\130\208\189\209\143\208\178\208\186\208\176", 
            [82] = "\209\133\208\176\208\191\208\189\209\131\208\187 \208\183\208\176\208\177\208\190\209\128\208\184\209\129\209\130\208\190\208\179\208\190", 
            [83] = "\208\189\208\176\208\186\208\176\208\183\208\176\208\189\208\176 \\(^O^)/", 
            [84] = "\208\156\208\163\208\150\208\152\208\154\208\152 \208\175 \208\154\208\144\208\145\208\144\208\157 \208\157\208\149 \208\168\208\156\208\144\208\155\208\175\208\153\208\162\208\149 \208\165\208\160\208\152\208\161\208\162\208\144 \208\160\208\144\208\148\208\152 \208\157\208\149 \208\147\208\163\208\145\208\152\208\162\208\149", 
            [85] = "\209\135\208\176\209\135\208\186\208\176 \208\191\208\184\208\191\209\129\208\190\208\178)))", 
            [86] = "by \208\176\209\129\208\184\208\180\209\130\208\181\209\135 \208\189\209\131\208\177\208\176\209\129", 
            [87] = "AcidTech records", 
            [88] = "\209\130\209\139 \209\135\209\130\208\190\209\130\208\190 \208\191\209\145\209\128\208\189\209\131\208\187? \208\158\208\162\208\154\208\144\208\151\208\144\208\157\208\158", 
            [89] = "\209\136\208\176\208\187\209\140\208\189\208\176\209\143 \208\183\208\176\208\187\208\181\209\130\208\181\208\187\208\176", 
            [90] = "\208\189\208\184\209\133\209\131\209\143 \209\130\209\139 \208\180\208\182\208\181\208\189\209\130\208\181\208\187\209\140\208\188\208\181\208\189, \208\176\208\182 \209\136\208\187\209\143\208\191\208\176 \209\129\208\187\208\181\209\130\208\181\208\187\208\176", 
            [91] = "\209\129\208\184\208\187\209\140\208\189\208\190 \208\178\209\129\209\130\208\176\208\187", 
            [92] = "\209\128\208\190\208\178\208\189\208\190 \208\180\208\178\208\184\208\179\208\176\209\142\209\129\209\140", 
            [93] = "\208\191\209\128\208\190\208\186\208\176\209\135\208\176\208\187\209\129\209\143 \209\129\209\145\208\180\208\189\209\143, \208\191\208\181\208\189\208\184\209\130\209\140 \208\177\209\131\208\180\209\131", 
            [94] = "\208\178\208\176\208\186 \208\178 \209\135\208\176\209\130 \208\178\209\129\208\181 \208\180\208\181\208\187\208\176", 
            [95] = "8 6 4 2 \209\128\209\131\209\135\208\186\208\176 \209\130\209\128\208\176\209\133\208\189\209\131\208\187\208\176 \208\177\208\190\208\177\209\128\208\176", 
            [96] = "\208\191\208\190\209\129\208\187\208\181 \209\130\208\176\208\186\208\190\208\185 \208\191\209\131\208\187\208\184, \209\131 \209\130\208\181\208\177\209\143 \208\191\208\190\209\128\208\178\208\176\208\187\208\184\209\129\209\140 \209\130\209\128\209\131\209\129\208\184\208\186\208\184", 
            [97] = "\208\156\208\171 \208\160\208\163\208\161\208\161\208\154\208\152\208\149 - \208\161 \208\157\208\144\208\156\208\152 \208\145\208\158\208\147", 
            [98] = "\208\167\209\130\208\190 \208\191\209\128\208\181\208\178\209\128\208\176\209\137\208\176\208\181\209\130 \208\180\208\181\208\178\209\131\209\136\208\186\209\131 \208\178 \208\182\208\181\208\189\209\137\208\184\208\189\209\131? \208\161\208\181\208\186\209\129 \209\129 \208\178\208\184\209\130\208\188\208\190\208\185", 
            [99] = "( \205\161\194\176 \205\156\202\150 \205\161\194\176)", 
            [100] = "\208\183\208\176\208\180\208\190\209\128\208\189\208\176\209\143 \209\132\208\181\208\189\209\143", 
            [101] = "( \205\161\194\176 \205\156\202\150 \205\161\194\176)\226\177\173 \204\182\205\158 \204\182\205\158 \204\182\205\158 \204\182\205\158 \239\187\157\239\174\158", 
            [102] = " \208\149\208\161\208\161\208\161 -3 \208\174\208\165\208\163\208\163\208\163\208\163\208\163", 
            [103] = "\209\128\208\176\208\183, \208\180\208\178\208\176, \209\130\209\128\208\184 - \208\191\208\190\208\191\209\131 \208\191\208\190\208\180\208\190\209\130\209\128\208\184", 
            [104] = "\208\176\208\189\208\176\208\189\209\129\208\190\208\178\209\139\208\185 \209\129\208\184\209\128\208\190\208\191, \208\190\208\191 \208\190\208\191 \208\190\208\191 \208\190\208\191", 
            [105] = "\208\159\209\131\209\129\209\130\209\140 \208\178\208\176\209\136\208\184 \208\191\208\181\209\135\208\176\208\187\209\140\208\186\208\184 \208\191\209\128\208\181\208\178\209\128\208\176\209\130\209\143\209\130\209\129\209\143 \208\178 \208\181\209\128\209\131\208\189\208\180\209\131\208\187\209\140\208\186\208\184", 
            [106] = "\209\129\208\184\209\129\209\143 \\(^.^)/", 
            [107] = "\208\191\208\190\209\130\209\143\209\128\208\176, \208\177\208\181\208\183 \208\190\208\191\209\128\208\176\208\178\208\180\208\176\208\189\208\184\208\185 \209\130\208\190\208\187\209\140\208\186\208\190", 
            [108] = "\208\184\208\188\208\177\208\190\208\178\208\190 \208\186\209\128\208\184\208\189\208\182\208\176\208\189\209\131\208\187", 
            [109] = "\208\189\208\181\208\187\208\181\208\191\208\176\209\143 \209\129\209\131\208\181\209\130\208\176", 
            [110] = "\209\129\208\188\208\176\209\135\208\189\208\190 \208\180\209\131\208\189\209\131\208\187 \208\178 \208\191\209\141\208\189\209\129\208\181\208\187", 
            [111] = "\209\145\208\180\209\128\209\145\208\189 \208\186\208\176\209\128\209\130\208\190\208\189", 
            [112] = "\208\176 \208\178 \208\191\208\190\208\191\209\131 \208\177\208\190\208\187\209\140\208\189\208\190?", 
            [113] = "\208\181\208\180\209\128\209\145\208\189 \208\177\208\176\209\130\208\190\208\189, KAK JE YA JEBOSHY", 
            [114] = "\209\143 \208\190\208\177\208\187\208\176\208\180\208\176\209\130\208\181\208\187\209\140 - AcidTech.lua, \208\190\209\132\208\190\209\128\208\188\208\184 3a\208\179Jlo\209\130 \209\132\208\176\209\129\209\130\208\190\208\188", 
            [115] = "\208\189\208\176\209\133\208\176\208\187\209\140\208\189\208\190 \208\190\209\130\208\187\208\184\208\188\208\190\208\189\208\184\208\187", 
            [116] = "\209\134\208\181\208\187\209\131\208\185\209\130\208\181 \208\188\208\190\208\184 \208\177\209\131\208\187\208\186\208\184, \209\143 \208\191\208\176\208\159\208\163\208\155\208\172\208\154\208\144", 
            [117] = "\208\180\209\128\208\176\208\186\208\176\208\186\209\131\208\187\208\176(", 
            [118] = "\208\180\209\128\208\176\209\135\208\184\208\186\209\131\208\187\208\176)", 
            [119] = "\208\189\208\176\208\186\208\184\208\180\208\176\208\187 \208\183\208\176 \209\136\208\184\208\178\208\190\209\128\208\190\209\130", 
            [120] = "\208\175 \208\146\208\161\208\129\208\155\208\171\208\153 \208\162\208\144\208\160\208\144\208\154\208\144\208\157, \208\175 \208\145\208\149\208\147\208\163 \208\145\208\149\208\147\208\163 \208\145\208\149\208\147\208\163", 
            [121] = "\209\135\209\131\209\133\208\189\209\131\208\187 \208\191\208\181\208\189\208\184\209\129\208\190\208\188 \208\189\208\176\209\133\208\176\208\187\208\176", 
            [122] = "\226\153\154 \209\135\208\184\208\186 \208\191\209\131\208\186 \209\130\209\128\208\176\208\187\209\143\208\187\209\143 \226\153\154", 
            [123] = "\226\153\155\239\188\161\239\189\140\239\189\140 \239\188\166\239\189\129\239\189\141\239\189\137\239\189\140\239\189\153 AcidTech\226\153\155", 
            [124] = "\208\178 \209\130\209\131\208\183\208\176 \208\189\208\176\208\191\208\184\209\133\208\176\208\187", 
            [125] = "\208\191\209\128\208\184\209\129\209\131\208\189\209\131\208\187 \208\178 \209\131\209\136\208\186\208\190, \209\130\209\139 \208\188\208\190\209\143 \208\191\208\190\208\180\209\128\209\131\208\182\208\186\208\176)", 
            [126] = "\208\187\208\190\209\136\208\176\209\128\208\176) \209\143 \209\129 \208\189\208\187\208\190\208\188"
        }
    };
    local v1614 = {
        z = "\208\183", 
        t = "\209\130", 
        j = "\208\182", 
        w = "\208\178", 
        k = "\208\186", 
        l = "\208\187", 
        r = "\209\128", 
        e = "\208\181", 
        f = "\209\132", 
        c = "\209\134", 
        v = "\208\178", 
        b = "\208\177", 
        n = "\208\189", 
        p = "\208\191", 
        m = "\208\188", 
        u = "\209\131", 
        x = "\208\186\209\129", 
        g = "\208\179", 
        i = "\208\184", 
        s = "\209\129", 
        o = "\208\190", 
        h = "\209\133", 
        y = "\209\139", 
        d = "\208\180", 
        q = "\208\186", 
        a = "\209\141"
    };
    local function v1621(v1615)
        -- upvalues: v1614 (ref)
        local _ = "";
        local v1617 = v1615:lower();
        local _ = string.len(v1617);
        local v1619 = "";
        for v1620 = 1, #v1617 do
            v1619 = v1619 .. (v1614[v1617:sub(v1620, v1620)] or " ");
        end;
        return v1619;
    end;
    local function v1625()
        -- upvalues: l_random_int_0 (ref)
        local v1622 = "";
        local v1623 = "\209\133";
        for _ = 1, l_random_int_0(4, 10) do
            if v1623 == "\209\133" then
                if l_random_int_0(0, 3) ~= 0 then
                    v1622 = v1622 .. "\208\176";
                else
                    v1622 = v1622 .. "\209\133";
                end;
                v1623 = "\208\176";
            else
                if l_random_int_0(0, 3) ~= 0 then
                    v1622 = v1622 .. "\209\133";
                else
                    v1622 = v1622 .. "\208\176";
                end;
                v1623 = "\209\133";
            end;
            if l_random_int_0(0, 5) == 0 then
                v1622 = v1622 .. "\209\138";
            end;
        end;
        if l_random_int_0(0, 5) == 0 then
            v1622 = v1622.upper(v1622);
        end;
        return v1622;
    end;
    local v1626 = {
        start = {
            [1] = "\208\191\208\190\209\129\208\188\208\190\209\130\209\128\208\184\209\130\208\181", 
            [2] = "ahah", 
            [3] = "\208\178\208\176\209\137\208\181", 
            [4] = "\208\182\208\176\209\131\208\189", 
            [5] = "\208\189\208\181 \208\183\208\176\208\177\208\181\208\185", 
            [6] = "st1vaha#9099 \208\189\208\176\208\191\208\184\209\136\208\184 \208\181\209\129\208\187\208\184 \209\132\209\128\208\184 \208\186\209\132\208\179 \208\189\208\176 \208\189\208\187\208\186\209\131 \208\178\209\139\208\180\208\176\209\130\209\140", 
            [7] = "vitmoid#2845 \208\180\208\190\208\177\208\176\208\178\209\140 \208\178 \208\180\209\128, \208\184\209\137\209\131 \208\180\209\128\209\131\208\183\208\181\208\185", 
            [8] = "\208\191\208\181\208\189\208\176 \209\130\208\176\208\186 \208\184 \209\133\208\187\208\181\209\137\208\181\209\130", 
            [9] = "\208\156\208\163\208\150\208\152\208\154\208\152 \208\175 \208\154\208\144\208\145\208\144\208\157 \208\157\208\149 \208\168\208\156\208\144\208\155\208\175\208\153\208\162\208\149 \208\165\208\160\208\152\208\161\208\162\208\144 \208\160\208\144\208\148\208\152 \208\157\208\149 \208\147\208\163\208\145\208\152\208\162\208\149"
        }, 
        mid = {
            [1] = "\209\135\209\130\208\190 \209\141\209\130\208\190\209\130", 
            [2] = "\208\189\209\131 \209\141\209\130\208\190\209\130", 
            [3] = "\209\129\209\129\208\176\208\189\209\139\208\185", 
            [4] = "\208\187\208\190\208\187", 
            [5] = "ahah"
        }, 
        close = {
            [1] = "\208\191\209\139\209\130\208\176\208\181\209\130\209\129\209\143 \209\129\208\180\208\181\208\187\208\176\209\130\209\140", 
            [2] = "\209\129\209\130\208\176\209\128\208\176\208\181\209\130\209\140\209\129\209\143", 
            [3] = "\208\191\209\139\209\133\209\130\208\184\209\130", 
            [4] = "\208\188\209\131\208\178\208\176\208\181\209\134\208\176 \209\129\208\188\208\181\209\136\208\189\208\190", 
            [5] = "\208\188\209\131\208\178 \208\184\209\129\208\191\208\190\208\187\208\189\208\184\208\187"
        }, 
        close_optional = {
            [1] = "\208\177\208\187\209\143", 
            [2] = "ahah", 
            [3] = "1x1 \208\179\208\190", 
            [4] = "\208\181\208\177\208\187\208\176\208\189", 
            [5] = "\208\180\208\190\208\187\208\177\208\176\209\145\208\177"
        }
    };
    local v1627 = {};
    local function v1634(v1628)
        -- upvalues: v1626 (ref), l_random_int_0 (ref), v1625 (ref), v1621 (ref), v1627 (ref)
        local v1629 = v1626.start[l_random_int_0(1, #v1626.start)];
        local v1630 = v1626.mid[l_random_int_0(1, #v1626.mid)];
        local v1631 = v1626.close[l_random_int_0(1, #v1626.close)];
        local v1632 = v1626.close_optional[l_random_int_0(1, #v1626.close_optional)];
        local v1633 = ("%s %s %s %s %s"):format(v1629 == "ahah" and v1625() or v1629, v1630 == "ahah" and v1625() or v1630, v1621(v1628), v1631 == "ahah" and v1625() or v1631, l_random_int_0(0, 2) == 0 and (v1632 == "ahah" and v1625() or v1632) or "");
        v1627.troll = {
            [1] = globals.realtime + v1633:len() * utils.random_float(0.1, 0.3), 
            [2] = v1633
        };
    end;
    local function v1641(v1635)
        -- upvalues: l_random_int_0 (ref), v1613 (ref), v1627 (ref), v1625 (ref), v1621 (ref), v1634 (ref)
        if l_random_int_0(0, 2) >= 1 then
            local v1636 = v1613.v2[globals.tickcount % #v1613.v2 + 1];
            v1627.kill = {
                [1] = globals.realtime + v1636:len() * 0.075, 
                [2] = v1636
            };
            return;
        else
            local v1637 = v1613.start[l_random_int_0(1, #v1613.start)];
            local v1638 = v1613.mid[l_random_int_0(1, #v1613.mid)];
            local v1639 = v1613.close[l_random_int_0(1, #v1613.close)];
            local v1640 = ("%s %s %s"):format(v1637 == "ahah" and v1625() or v1637, v1638 == "name" and v1621(v1635:get_name()) or v1638, v1639 == "ahah" and v1625() or v1639);
            v1627.kill = {
                [1] = globals.realtime + v1640:len() * 0.075, 
                [2] = v1640
            };
            if l_random_int_0(0, 9) == 0 then
                v1634(v1635:get_name());
            end;
            return;
        end;
    end;
    local v1642 = {
        start = {
            [1] = "\209\135\209\130\208\190 \209\130\209\139 \209\129\208\180\208\181\208\187\208\176\208\187", 
            [2] = "?", 
            [3] = "\208\189\208\176\208\185\209\129 \208\188\209\131\208\178", 
            [4] = "\208\191\208\184\208\183\208\180 \209\130\209\139 \208\186\208\190\208\189\209\135", 
            [5] = "\208\189\208\176\208\185\209\129 \208\191\208\190\208\180\208\187\208\190\208\178\208\184\208\187", 
            [6] = "\208\177\208\181\208\183 \208\180\209\130 \208\189\208\181 \208\188\208\190\208\182\208\181\209\130", 
            [7] = "\208\191\209\128\208\190\209\129\209\130\208\190 +\208\178", 
            [8] = "\208\177\208\187\209\143", 
            [9] = "\208\189\208\176 \208\191\208\190\208\180\208\191\208\184\208\186\208\181", 
            [10] = "\208\181\208\187\208\181 \209\131\208\177\208\184\208\187", 
            [11] = "\208\191\208\190\209\135\209\130\208\184 \209\133\208\190\209\128\208\190\209\136\208\190", 
            [12] = "\209\130\208\178\208\176\209\128\209\142\208\179\208\176", 
            [13] = "\208\190\208\191\209\128\208\176\208\178\208\180\208\176\208\185 \208\188\209\131\208\178", 
            [14] = "\208\189\209\131", 
            [15] = "gbpltw", 
            [16] = ",kznm", 
            [17] = "\209\130\209\131\208\191\208\190\208\185", 
            [18] = "\208\156\208\149\208\157\208\175 \208\162\208\159\208\165\208\157\208\163\208\155\208\158", 
            [19] = "\209\143 \209\129\209\130\209\128\208\181\208\187\209\140\208\189\209\131\208\187?", 
            [20] = "\208\179\208\176\208\178\208\189\208\190\208\181\208\180", 
            [21] = "\209\143\209\143 \208\178 \208\188\209\131\209\130\208\181?", 
            [22] = "\208\189\209\131 \209\130\208\184\208\188\208\188\208\181\208\185\209\130 \209\132\208\181\208\180\209\131\208\186\208\176 \208\180\208\176\208\178\208\184\209\130", 
            [23] = "\208\186\208\181\209\128\208\180\209\139\208\186", 
            [24] = "\209\135\209\130\208\190 \208\183\208\176 \208\178\208\190\208\189\209\140 \209\131\208\177\208\184\208\187\208\176", 
            [25] = "\209\130\209\139 \208\180\209\130 \208\190\209\130\208\182\208\176\208\187?", 
            [26] = "\209\131 \208\188\208\181\208\189\209\143 \208\190\208\180\208\189\208\190\208\178\208\190 \209\129\208\181\209\128\208\178 \208\187\208\176\208\179?", 
            [27] = "\208\189\208\176\208\185\209\129 \208\176\208\178\209\130\208\190\208\191\208\184\208\186+\208\188\208\184\208\189\208\180\208\188\208\179", 
            [28] = "\208\177\208\181\208\186\209\136\209\131\209\130?", 
            [29] = "\209\130\209\139 \209\129 \209\129\208\190\209\130\208\186\208\190\208\185 \208\178\209\129\209\130\208\176\208\187?", 
            [30] = "\208\189\209\131 \209\130\209\139 \208\183\208\178\208\181\209\128\209\140", 
            [31] = "\209\129\208\184\208\180\208\184\209\130 \208\191\209\128\208\181\208\180\208\184\208\186\209\130\208\184\209\130", 
            [32] = "\208\190\208\189\208\187\208\184 \208\177\208\190\208\180\208\184 \209\135\209\131\209\128\208\186\208\176", 
            [33] = "\208\188\209\128\208\176\208\183\208\190\209\130\208\176 \208\191\208\190\209\130\208\181\208\181\209\130", 
            [34] = "\208\189\208\181 \208\191\208\190\209\130\208\181\208\185", 
            [35] = "\209\130\209\139 \209\129 \208\188\208\184\208\189\208\180\208\176\208\188\208\176\208\179\208\190\208\188 \208\191\208\184\208\186\208\189\209\131\208\187?", 
            [36] = "?", 
            [37] = "\209\131 \209\130\208\181\208\177\209\143 \208\191\208\184\208\189\208\186 \209\129\208\191\208\176\208\185\208\186?", 
            [38] = "\208\186\208\176\208\186 \209\130\209\139 \208\180\208\176\208\188\208\176\208\179 \208\178\209\139\208\177\208\184\208\187?", 
            [39] = "\208\189\208\176\209\133\209\131\208\185 \209\130\209\139 \209\141\209\130\208\190 \208\191\208\184\208\186\208\176\208\181\209\136\209\140?", 
            [40] = "\208\189\208\176\209\133\209\131\208\185 \209\130\209\139 \208\191\208\184\208\186\208\189\209\131\208\187?", 
            [41] = "\208\188\208\176\209\130\209\140 \208\181\208\177\208\176\208\187 \208\191\208\184\208\180\208\176\209\128\208\176\209\129", 
            [42] = "\209\130\209\139 \209\129 \209\129\208\190\209\130\208\186\208\190\208\185 \208\191\208\184\208\186\208\189\209\131\208\187?", 
            [43] = "\208\189\209\131 \209\132\209\128\208\184\209\129\209\130\208\181\208\189\208\180\208\184\208\189\208\179 \208\182\208\181 \208\189\208\181 \209\129\209\128\208\176\208\177\208\190\209\130\208\176\208\181\209\130", 
            [44] = "\209\135\208\184\209\130 \208\180\208\181\208\187\208\181\208\184\209\130", 
            [45] = "\208\177\208\187\209\143 \208\189\209\131 \209\130\209\139 \209\128\208\181\208\176\208\187\209\140\208\189\208\190 \208\181\208\177\208\187\208\176\208\189", 
            [46] = "\208\189\209\131 \208\189\208\181\209\130", 
            [47] = "\209\129\209\128\208\176\208\183\209\131 \208\178\208\184\208\180\208\189\208\190 iq 14\208\186 \209\142\208\184\208\180\208\176", 
            [48] = "S[DF[F[DF[SDF[SD[FSD[FDS[F[F[F[F", 
            [49] = "\208\180\208\176 \209\131\208\177\208\190\208\179\208\184\208\185 \209\133\209\131\208\181\209\129\208\190\209\129", 
            [50] = "\209\131 \209\130\208\181\208\177\209\143 \209\129\208\186\208\184\209\130?", 
            [51] = "\208\189\209\131 \209\130\209\139 \208\181\208\177\208\176\208\187\208\190\208\190", 
            [52] = "\208\180\208\176 \208\186\209\131\208\180\208\176 \209\130\209\139 \209\131\208\177\208\184\208\187 \209\131\209\145\208\177\208\190\208\186", 
            [53] = "\208\180\208\176 \208\190\208\191\209\143\209\130\209\140 \209\131\209\145\208\177\208\184\209\137\208\181 \209\131\208\177\208\184\208\187\208\190", 
            [54] = "\209\130\209\139 \208\184\208\183 \208\177\208\184\208\185\209\129\208\186\208\176?", 
            [55] = "\209\133\208\190\209\128\208\190\209\136 \208\180\208\190\208\188\208\184\208\189\208\184\208\186", 
            [56] = "\208\180\208\176 \209\131 \209\130\208\181\208\177\209\143 \208\188\208\176\209\130\209\140 \209\136\208\187\209\142\209\133\208\181\208\189\208\180\209\128\208\176", 
            [57] = "\208\189\208\181 \209\131\208\182\208\181\208\187\208\184 \208\180\208\190\208\187\208\177\208\176\208\181\208\177 \208\180\208\190\208\180\209\131\208\188\208\176\208\187\209\129\209\143 \208\191\208\184\208\186\208\189\209\131\209\130\209\140", 
            [58] = "\209\130\208\184\208\188\208\188\208\181\208\185\209\130 \208\181\208\177\209\131 \208\180\208\176\208\187, \208\191\209\128\208\190\209\129\209\130\208\190 \209\129\208\188\209\139\209\129\208\187\209\129\209\143 \208\189\208\176\209\133\209\131\208\185", 
            [59] = "\209\131 \208\178\208\176\209\129 \209\130\208\190\208\182\208\181 loss \208\191\208\190\208\180\208\189\209\143\208\187\209\129\209\143?", 
            [60] = "\209\131 \208\186\208\190\208\179\208\190 \208\191\208\190\209\129\208\187\208\181 \208\190\208\177\208\189\208\190\208\178\209\139 sprid \208\178\209\139\208\187\208\181\209\130\208\176\208\181\209\130 \209\130\208\190\208\182\208\181", 
            [61] = "\208\180\208\190\208\187\208\177\208\176\208\181\208\177?", 
            [62] = "\209\141\209\130\208\190 100 dmg?"
        }, 
        mid = {
            [1] = "\208\184\208\180\208\184\208\190\209\130", 
            [2] = "\208\180\208\190\208\187\208\177\208\176\209\145\208\177", 
            [3] = "name", 
            [4] = "ahah", 
            [5] = "\209\129\209\139\208\189 \209\136\208\187\209\142\209\133\208\184", 
            [6] = "\209\129\209\131\209\135\208\176\209\128\208\176 \208\177\208\187\209\143", 
            [7] = "name", 
            [8] = "ahah", 
            [9] = "\209\129\209\139\208\189 \209\136\208\187\209\142\209\133\208\184", 
            [10] = "\208\180\208\190\208\187\208\177\208\190\209\145\208\177\208\184\208\186", 
            [11] = "\209\129\208\178\208\184\208\189\209\140\209\143", 
            [12] = "\209\131\208\186\209\128\208\176\208\184\208\189\208\181\209\134 \209\145\208\177\208\176\208\189\209\139\208\185", 
            [13] = "\209\133\209\131\208\185", 
            [14] = "\208\188\209\131\209\129\208\190\209\128", 
            [15] = "\208\189\208\184\208\186 \209\132\208\184\208\186\209\129", 
            [16] = "\208\186\209\130\208\190 \209\130\208\181\208\177\208\181 \209\130\208\176\208\186\208\190\208\185 \208\189\208\184\208\186 \208\191\209\128\208\184\208\180\209\131\208\188\208\176\208\187??", 
            [17] = "\208\189\208\181\208\185\208\188 \209\132\208\184\208\186\209\129", 
            [18] = "\208\184\208\180\208\184 \208\189\208\176\209\133\209\131\208\185", 
            [19] = "0 \208\190\209\136\208\184\208\177\208\190\208\186", 
            [20] = "\209\129\208\190\209\135\208\189\209\143\209\128\208\176", 
            [21] = "\208\177\208\181\208\183 \209\129\208\186\208\184\209\130\208\176", 
            [22] = "\208\186\209\128\209\143\208\186\208\181\209\128", 
            [23] = "\208\189\208\184\208\186\209\129 \209\142\208\183\208\181\209\128", 
            [24] = "\208\184\209\136\208\176\208\186", 
            [25] = "\208\180\208\190\208\188\208\184\208\189\208\184\208\186", 
            [26] = "\208\176\209\128\208\188\209\143\208\189\208\184\208\189", 
            [27] = "\208\178\209\139\209\129\208\181\209\128 \208\191\208\190\209\130\208\189\209\139\208\185", 
            [28] = "\208\191\208\190\209\130\208\189\208\176\209\143 \209\133\209\131\208\184\208\187\208\176", 
            [29] = "\208\189\209\131 \208\179\208\187\209\131\208\191\209\139\208\185 \208\188\208\190\209\135\208\181\208\179\208\190\208\189", 
            [30] = "\208\180\208\176\208\182\208\181 \208\188\208\176\209\131\209\130 \208\187\209\131\209\135\209\136\208\181 \209\130\208\181\208\177\209\143", 
            [31] = "\208\180\208\176\208\182\208\181 \209\130\209\131\209\128\208\186\208\184 \208\187\209\131\209\135\209\136\208\181 \209\130\208\181\208\177\209\143 \209\133\208\178\209\133 \208\184\208\179\209\128\208\176\209\142\209\130", 
            [32] = "\208\190\208\189\208\190 \208\182\208\181 \208\189\208\176 \208\187\208\190\209\131 \208\177\209\128\208\181\208\185\208\189\208\181 \208\184\208\179\209\128\208\176\208\181\209\130", 
            [33] = "\208\180\208\176 \209\129\209\129\208\176\208\189\209\139\208\185 \208\186\208\190\208\189\209\135\208\181\208\187\209\139\208\179\208\176", 
            [34] = "\209\135\209\131\209\128\208\186\208\184\209\129\209\130\208\176\208\189 \209\131\208\177\208\190\208\179\208\184\208\185", 
            [35] = "\208\189\209\131 \208\179\208\187\209\131\208\191\209\139\208\185 \209\128\208\181\208\177\209\145\208\189\208\190\208\186", 
            [36] = "\208\188\209\128\208\176\208\183\209\140 \208\181\208\177\208\176\208\189\208\176\209\143", 
            [37] = "\208\188\209\131\209\129\208\190\209\128\208\184\208\187\208\176 \208\179\208\187\209\131\208\191\208\176\209\143", 
            [38] = "\208\191\209\128\208\190\208\177\208\186\208\176 \208\187\208\181\208\179\208\184\209\130\208\189\208\176\209\143", 
            [39] = "\208\183\209\128\209\143 \209\129\209\131\209\135\208\190\208\189\208\190\208\186"
        }, 
        close = {
            [1] = "1x1?", 
            [2] = "\208\180\209\129 \208\186\208\184\208\180\208\176\208\185", 
            [3] = "\208\186\208\184\208\189\209\140 \208\186\209\132\208\179", 
            [4] = "\209\135\209\145 \208\183\208\176 \208\187\209\131\208\176", 
            [5] = "1.", 
            [6] = "\208\186\208\190\208\189\209\135", 
            [7] = "\208\186\208\178??", 
            [8] = "\209\129\209\130\208\176\209\130\209\131 \208\176\208\189\208\188\208\176\209\130\209\135\208\181\208\180\208\176 \208\186\208\184\208\180\208\176\208\185 \209\133\209\131\208\181\209\129\208\190\209\129", 
            [9] = "\208\181\208\187\208\181 \209\129\208\176\208\177 \208\179\208\181\209\130\208\189\209\131\208\187?", 
            [10] = "\208\186\208\190\208\189\208\189\208\181\208\186\209\130 \208\182\208\180\209\131", 
            [11] = "\208\189\209\131 \208\179\208\180\208\181 \209\130\208\184\208\188\208\188\208\181\208\185\209\130\209\139", 
            [12] = "\208\191\208\184\208\183\208\180\208\176 \209\130\208\178\208\190\208\181\208\188\209\131 \208\176\208\186\208\186\209\131 \209\129 \208\187\208\190\208\187\208\183\208\176", 
            [13] = "\209\130\208\181\208\177\209\143 \209\129\209\130\208\184\208\178\208\176\209\133\208\176 \208\189\208\181 \208\183\208\189\208\176\208\181\209\130", 
            [14] = "\209\130\209\139 \208\178\208\190\208\190\208\177\209\137\208\181 \209\135\208\184\209\130\208\176\208\181\209\136\209\140 \209\135\209\130\208\190 \209\143 \208\191\208\184\209\136\209\131", 
            [15] = "\208\189\208\187 1\208\189\208\1761 \208\178\209\139\208\178\208\181\208\183\208\181\209\136\209\140?", 
            [16] = "\208\176\209\136\208\176\208\187\208\181\208\181\208\181\209\130\209\140", 
            [17] = "\209\130\209\139 \209\129\208\190\209\135\208\189\209\139\208\185 \208\183\208\176 \209\130\208\181\208\177\209\143 \208\178 \209\135\208\176\209\130 \208\187\209\131\208\176 \208\191\208\184\209\136\208\181\209\130", 
            [18] = "\208\190\209\130 \209\129\208\176\208\177\208\186\208\184 \208\180\208\190 \209\129\208\176\208\177\208\186\208\184 \208\182\208\184\208\178\209\145\208\184\209\130", 
            [19] = "\209\143 \208\178 \208\176\209\133\209\131\208\181", 
            [20] = "\208\189\208\181 \208\187\208\184\208\178\208\176\208\185", 
            [21] = "\209\143 \209\137\208\176\209\129 \208\177\208\181\208\186\208\176\208\191 \208\191\208\190\208\183\208\190\208\178\209\131", 
            [22] = "\209\143 \208\177\209\131\208\180\209\131 \208\190\208\189\208\187\208\184 \208\177\208\190\208\180\208\184 \209\130\208\181\208\191\208\181\209\128\209\140", 
            [23] = "\209\130\209\139 \209\133\208\190\209\130\209\140 \208\191\208\190\208\189\209\143\208\187 \209\135\209\130\208\190 \209\129\208\180\208\181\208\187\208\176\208\187", 
            [24] = "\209\135\209\131\209\135\208\181\208\187\208\190 \209\129\208\191\208\184\208\189\208\190\208\185 \209\131\208\177\208\184\208\187\208\190", 
            [25] = "\208\158\208\157\208\158 \208\156\208\149\208\157\208\175 \208\145\208\149\208\161\208\152\208\162", 
            [26] = "\208\181\208\188\209\131 \209\135\208\184\209\130 \208\190\208\177\208\189\208\190\208\178\208\184\208\187\208\184", 
            [27] = "\208\189\208\176\208\185\209\129 100 \208\180\208\188\208\179 \208\190\208\189\208\187\208\184", 
            [28] = "\208\190\209\135\208\181\209\128\208\181\208\180\208\189\208\190\208\185 \208\187\208\181\208\179\208\184\209\130\208\189\209\139\208\185 \208\181\208\177\208\187\208\176\208\189", 
            [29] = "\208\190\209\135\208\181\209\128\208\181\208\180\208\189\208\190\208\185 \208\191\208\190\208\180\209\129\208\190\209\129 \209\129\208\176\208\189\209\135\208\181\208\183\208\176?", 
            [30] = "\208\176 \209\141\209\130\208\190 \208\189\208\181 \209\130\209\139 \208\186\208\178 \208\188\208\189\208\181 \208\191\209\128\208\190\208\184\208\179\209\128\208\176\208\187?", 
            [31] = "\209\143 \209\130\208\181\208\177\209\143 \209\130\209\128\208\176\209\133\208\189\209\131", 
            [32] = "40\208\186 \208\183\208\176 \208\184\208\189\208\178\208\176\208\185\209\130 \208\190\208\191\209\128\208\176\208\178\208\180\208\176\208\187\208\184 \209\129\208\181\208\177\209\143", 
            [33] = "\208\189\208\184\209\137\208\184\209\130\208\176 \208\181\208\177\208\176\208\189\208\176\209\143", 
            [34] = "\208\180\208\176 \209\130\209\143 \208\180\208\176\208\182\208\181 \209\129\209\130\208\184\208\178\208\176\209\133\208\176 \208\191\208\181\209\128\208\181\208\177\208\176\208\185\209\130\208\184\209\130", 
            [35] = "\208\180\208\176\208\182\208\181 \209\129\209\130\208\184\208\178\208\176\209\133\208\176 \208\187\209\131\209\135\209\136\208\181 \209\130\208\181\208\177\209\143 \208\184\208\179\209\128\208\176\208\181\209\130", 
            [36] = "\209\141\209\130\208\190 \208\189\208\181 \209\130\209\139 \208\188\208\189\208\181 \208\189\208\176 \208\176\208\189\208\188\208\176\209\130\209\135\208\181\208\180\208\181 \208\191\209\128\208\190\208\184\208\179\209\128\208\176\208\187?", 
            [37] = "\209\141\209\130\208\190 \209\130\209\139 \208\184\208\183 \208\177\208\184\208\185\209\129\208\186\208\176?", 
            [38] = "\208\191\208\184\208\183\208\180\208\181\209\134 \209\129\208\190\209\135\208\189\208\184\208\186\208\184 \209\132\208\176\208\189\208\176\209\130\209\143\209\130", 
            [39] = "\208\176 \208\177\209\128\209\143\208\189\209\129\208\186 \209\141\209\130\208\190 \208\178\208\189\208\176\209\130\209\131\209\128\208\181 \208\179\208\190\209\128\208\190\208\180?", 
            [40] = "\209\130\209\139 \208\184\208\183 \208\177\208\184\208\185\209\129\208\186\208\176?)", 
            [41] = "\209\141\209\130\208\190 \208\189\208\181 \209\130\209\139 \208\177\209\131\208\186\208\178\209\131 z \208\189\208\176 \208\187\208\177\209\131 \208\189\208\176\209\128\208\184\209\129\208\190\208\178\208\176\208\187?", 
            [42] = "\209\141\209\130\208\190 \208\189\208\181 \209\130\209\139 \209\131 \209\132\208\184\208\191\208\176 \209\129\208\176\208\177\208\186\209\131 \208\191\208\190\208\186\209\131\208\191\208\176\208\187?", 
            [43] = "\208\183\208\176\208\179\209\128\209\131\208\183\208\184\208\187 \208\180\208\190\208\188\208\181\208\189\208\184\208\186 \209\143\208\178 \208\184 \208\178\208\190\209\130 \209\130\208\181 \209\128\208\176\208\183, \209\131\208\178\208\184\208\180\208\184\208\188\209\129\209\143 \208\178 \209\129\208\187\208\181\208\180\209\131\209\142\209\137\208\181\208\188 \209\128\208\176\209\131\208\189\208\180\208\181", 
            [44] = "\209\143 \209\135\209\130\208\190 \208\190\208\180\208\184\208\189 \208\178 \209\130\208\184\208\188\208\181 \208\177\208\187\209\143\209\130\209\140", 
            [45] = "\208\188\209\131\208\182\208\184\208\186\208\184, \209\143 \208\178 \208\188\209\131\209\130\208\181?", 
            [46] = "\209\131 \208\188\208\181\208\189\209\143 \209\130\208\184\208\188\208\188\208\181\208\185\209\130\209\139 \209\129 \208\189\208\184\208\186\209\129\208\190\208\188 \209\135\209\130\208\190\208\187\208\184 \208\191\208\190\208\179\208\190\208\187\208\190\208\178\208\189\208\190, \208\190\209\130\208\186\208\184\209\129\208\176\209\142\209\130 \208\189\208\176 \209\128\208\176\208\183 \208\180\208\178\208\176", 
            [47] = "\208\191\208\176\209\128\208\189\208\184 \208\186\208\176\208\186 \208\178 tub \208\191\208\190\208\186\208\176\208\183 \208\189\208\187\208\176 \208\178\209\139\208\186\208\187\209\142\209\135\208\184\209\130\209\140", 
            [48] = "\208\180\208\176 \208\178\209\139 \208\177\208\187\209\143 \209\129 \208\191\209\128\208\181\208\180\208\184\208\186\209\130\208\190\208\188 \209\135\209\130\208\190\208\187\208\184 \208\178\208\176\209\130\209\128\209\131\209\133\209\131 \208\179\208\190\208\189\209\143\208\181\209\130\208\181", 
            [49] = "\209\129\208\186\208\190\208\186 \209\137\208\176 \208\178 \208\189\208\187\208\181 \208\191\208\184\208\189\208\179 \209\129\209\130\208\176\208\178\208\184\209\130\209\140 \208\187\209\131\209\135\209\136\208\181"
        }
    };
    local function v1647()
        -- upvalues: l_random_int_0 (ref)
        local v1643 = "";
        local v1644 = "";
        for _ = 1, l_random_int_0(1, 4) do
            if v1644 == ")" then
                local v1646 = l_random_int_0(0, 2) == 0 and "0" or ")";
                v1643 = v1643 .. v1646;
                v1644 = v1646;
            else
                v1643 = v1643 .. ")";
                v1644 = ")";
            end;
        end;
        return v1643;
    end;
    local function _(v1648)
        -- upvalues: v1642 (ref), l_random_int_0 (ref), v1621 (ref), v1625 (ref), v1647 (ref), v1627 (ref)
        local v1649 = v1642.start[l_random_int_0(1, #v1642.start)];
        if l_random_int_0(0, 2) == 0 then
            v1649 = v1649:upper();
        end;
        local v1650 = v1642.mid[l_random_int_0(1, #v1642.mid)];
        if v1650 == "name" then
            v1650 = v1621(v1648:get_name());
        elseif v1650 == "ahah" then
            v1650 = v1625();
        end;
        if l_random_int_0(0, 2) == 0 then
            v1650 = v1650 .. v1647();
        end;
        v1627.kill = {
            [1] = 5
        };
        v1627.troll = {
            [1] = 5
        };
        v1627["death #1"] = {
            [1] = 5, 
            [2] = v1649
        };
        if l_random_int_0(0, 2) > 0 then
            v1627["death #2"] = {
                [1] = 5, 
                [2] = v1650
            };
            if l_random_int_0(0, 1) == 1 then
                local v1651 = v1642.close[l_random_int_0(1, #v1642.close)];
                v1627["death #3"] = {
                    [1] = 0.2, 
                    [2] = v1651
                };
            end;
        end;
    end;
    v260:add("draw", "trashtalk run", function(_, _)
        -- upvalues: v178 (ref), v179 (ref), v1627 (ref)
        if not v178.misc or not v179.trashtalk.main then
            return;
        else
            local l_realtime_2 = globals.realtime;
            for v1656, v1657 in pairs(v1627) do
                if v1657 and v1657[1] ~= 0 and v1657[1] < l_realtime_2 then
                    if utils.random_int(0, 2) == 0 then
                        utils.console_exec("say 1");
                    else
                        utils.console_exec("say 1");
                    end;
                    v1627[v1656] = {
                        [1] = 0
                    };
                end;
            end;
            return;
        end;
    end);
    local _ = {
        [1] = "\208\189\208\176\208\185\209\129 \208\184\208\179\209\128\208\176", 
        [2] = "\209\131\209\145\208\177\208\184\209\137\208\181 \208\178\208\176\208\187\208\178", 
        [3] = "\209\131\208\177\208\184\208\187\208\190 \208\189\208\176\209\133\209\131\208\185", 
        [4] = "\208\189\208\184\209\137\208\184\208\185 \208\178\208\176\208\187\208\178", 
        [5] = "\208\189\208\176\208\180\208\181\209\142\209\129\209\140 \208\178 \209\129\209\131\209\128\209\129 2 \208\191\208\190\209\132\208\184\208\186\209\129\209\143\209\130 \209\141\209\130\208\190", 
        [6] = "\208\181\208\177\208\176\209\130\209\140", 
        [7] = "\208\177\208\187\209\143\209\143\209\143\209\143 \209\131\208\177\208\184\208\187\208\190\208\190\208\190"
    };
    local v1659 = -1;
    v260:add("player_death", "trashtalk player death", function(v1660, v1661, _)
        -- upvalues: v178 (ref), v179 (ref), v680 (ref), v263 (ref), v1659 (ref), v1627 (ref), v1641 (ref)
        if not v1661 or not v178.misc or not v179.trashtalk.main then
            return;
        else
            local v1663 = entity.get_game_rules();
            if not v1663 then
                return;
            elseif v1663.m_bWarmupPeriod then
                return;
            else
                local v1664 = v680.GetPlayerForUserID(v1660.userid);
                local v1665 = v680.GetPlayerForUserID(v1660.attacker);
                if not v1664 or not v1665 or v1664 == nil or v1665 == nil then
                    return;
                elseif v1664 == v1665 then
                    return;
                else
                    local v1666 = v263.Misc.trashtalk.main:get();
                    if v1659 ~= -1 and v1666 and v1665 ~= v1661 and entity.get(v1659) == v1664 then
                        v1627["death #1"] = nil;
                        v1627["death #2"] = nil;
                        v1627["death #3"] = nil;
                        v1627.killer = {
                            [1] = nil, 
                            [2] = "1.", 
                            [1] = globals.realtime + 0.4
                        };
                        v1659 = -1;
                    end;
                    if v263.Misc.trashtalk.main:get() and v1665 == v1661 then
                        v1641(v1664);
                    end;
                    if v1664 == v1661 and v1666 and v1665:is_player() then
                        v1659 = v1665:get_index();
                    end;
                    return;
                end;
            end;
        end;
    end);
    v260:add("round_prestart", "trashtalk killer", function(_, _, _)
        -- upvalues: v1659 (ref), v1627 (ref)
        v1659 = -1;
        v1627 = {};
    end);
end)();
(function()
    -- upvalues: v401 (ref), v178 (ref), v263 (ref), v260 (ref)
    local function v1670()
        -- upvalues: v401 (ref)
        cvar.viewmodel_fov:int(v401.fov, true);
        cvar.viewmodel_offset_x:float(v401.viewmodel_offset_x, true);
        cvar.viewmodel_offset_y:float(v401.viewmodel_offset_y, true);
        cvar.viewmodel_offset_z:float(v401.viewmodel_offset_z, true);
    end;
    local function v1671()
        -- upvalues: v178 (ref), v263 (ref), v1670 (ref)
        if v178.misc and v263.Misc.view_model.main:get() then
            cvar.viewmodel_fov:int(v263.Misc.view_model.fov:get(), true);
            cvar.viewmodel_offset_x:float(v263.Misc.view_model.offset_x:get() / 15, true);
            cvar.viewmodel_offset_y:float(v263.Misc.view_model.offset_y:get() / 15, true);
            cvar.viewmodel_offset_z:float(v263.Misc.view_model.offset_z:get() / 15, true);
        else
            v1670();
        end;
    end;
    v263.Misc.view_model.main:RegisterCallback(v1671);
    v263.Misc.view_model.fov:RegisterCallback(v1671);
    v263.Misc.view_model.offset_x:RegisterCallback(v1671);
    v263.Misc.view_model.offset_y:RegisterCallback(v1671);
    v263.Misc.view_model.offset_z:RegisterCallback(v1671);
    v263.Misc.main:RegisterCallback(v1671);
    v1671();
    v260:add("destroy", "view model fix", v1670);
end)();
(function()
    -- upvalues: v260 (ref), v179 (ref)
    ffi.cdef("        uintptr_t GetForegroundWindow();\n        int FlashWindow(void* hWnd, int bInvert);\n    ");
    local function v1675()
        local v1672 = entity.get_game_rules();
        if not v1672 or v1672 == nil or v1672.m_bIsValveDS then
            return;
        else
            local v1673 = utils.opcode_scan("engine.dll", "8B 0D ? ? ? ? 85 C9 74 16 8B 01 8B");
            local v1674 = ffi.cast("void*", (ffi.cast("uintptr_t***", ffi.cast("uintptr_t", v1673) + 2)[0][0] + 2)[0]);
            if v1674 ~= ffi.C.GetForegroundWindow() then
                ffi.C.FlashWindow(v1674, 0);
            end;
            return;
        end;
    end;
    v260:add("round_prestart", "wanignging", function()
        -- upvalues: v179 (ref), v1675 (ref)
        if v179.round_warning then
            v1675();
        end;
    end);
    v260:add("round_freeze_end", "wanignging1", function()
        -- upvalues: v179 (ref), v1675 (ref)
        if v179.round_warning then
            v1675();
        end;
    end);
end)();
(function()
    -- upvalues: v179 (ref), v263 (ref), v260 (ref)
    local v1676 = utils.get_vfunc("engine.dll", "VEngineClient014", 11, "bool(__thiscall*)(void*)");
    local v1677 = false;
    local function v1683(v1678)
        table.foreach(materials.get_materials("vgui/hud/800"), function(_, v1680)
            -- upvalues: v1678 (ref)
            v1680:color_modulate(v1678);
            v1680:alpha_modulate(v1678.a / 255);
        end);
        table.foreach(materials.get_materials("vgui_white"), function(_, v1682)
            -- upvalues: v1678 (ref)
            v1682:color_modulate(v1678);
            v1682:alpha_modulate(v1678.a / 255);
        end);
    end;
    local function v1684()
        -- upvalues: v1677 (ref), v1683 (ref)
        if v1677 then
            v1683(color());
            v1677 = false;
        end;
    end;
    local function v1685()
        -- upvalues: v1677 (ref), v1683 (ref), v179 (ref)
        if not v1677 then
            v1683(v179.console_color.color);
            v1677 = true;
        end;
    end;
    cvar.toggleconsole:set_callback(function()
        -- upvalues: v179 (ref), v1685 (ref)
        if not v179.console_color.main then
            return;
        else
            v1685();
            return;
        end;
    end);
    v263.Modifications.console_color.color:RegisterCallback(function()
        -- upvalues: v179 (ref), v1677 (ref)
        if v179.console_color.main then
            v1677 = false;
        end;
    end);
    v260:add("draw", "console color", function()
        -- upvalues: v179 (ref), v1676 (ref), v1684 (ref), v1685 (ref)
        if not v179.console_color.main or not v1676() then
            return v1684();
        else
            v1685();
            return;
        end;
    end);
    v260:add("destroy", "console color 1", v1684);
end)();
(function()
    -- upvalues: v260 (ref), v179 (ref), v263 (ref), v139 (ref)
    local l_tickinterval_1 = globals.tickinterval;
    local v1687 = cvar.inferno_flame_lifetime:float();
    local v1688 = {};
    local v1689 = {};
    v260:add("draw", "grenade radius", function(v1690, v1691)
        -- upvalues: v179 (ref), v263 (ref), v1688 (ref), v1687 (ref), v139 (ref), v1689 (ref), l_tickinterval_1 (ref)
        if not v179.grenade_radius.main or v179.grenade_radius.options and #v179.grenade_radius.options == 0 then
            return;
        else
            local v1692 = nil;
            if v1691 then
                v1692 = v1690;
            elseif v1690 then
                v1692 = v1690.m_hObserverTarget;
            end;
            if not v1692 then
                return;
            else
                local v1693 = v1692.get_origin(v1692);
                local l_realtime_3 = globals.realtime;
                local l_tickcount_2 = globals.tickcount;
                if v263.Modifications.grenade_radius.options:get(1) then
                    local v1696 = {
                        v263.Modifications.grenade_radius.fire_color:Get(), 
                        v263.Modifications.grenade_radius.fire_color1:Get()
                    };
                    local l_m_iTeamNum_0 = v1692.m_iTeamNum;
                    do
                        local l_v1696_0, l_l_m_iTeamNum_0_0 = v1696, l_m_iTeamNum_0;
                        entity.get_entities("CInferno", false, function(v1700)
                            -- upvalues: v1688 (ref), v1687 (ref), l_realtime_3 (ref), l_tickcount_2 (ref), v139 (ref), v1693 (ref), l_v1696_0 (ref), l_l_m_iTeamNum_0_0 (ref), v1690 (ref)
                            local v1701 = v1700:get_origin();
                            if not v1701 then
                                return;
                            else
                                local v1702 = v1700:get_index();
                                if not v1688[v1702] then
                                    v1688[v1702] = {
                                        [1] = 0, 
                                        [2] = nil, 
                                        [3] = 0, 
                                        [4] = 175, 
                                        [2] = vector(), 
                                        [5] = v1700.m_nFireEffectTickBegin + v1687 * 64
                                    };
                                end;
                                local v1703 = v1688[v1702];
                                if v1703[3] < l_realtime_3 then
                                    local v1704 = {};
                                    for v1705 = 1, 20 do
                                        v1704[v1705] = v1701 + vector(v1700.m_fireXDelta[v1705 - 1], v1700.m_fireYDelta[v1705 - 1], 0);
                                    end;
                                    local v1706 = 0;
                                    local v1707 = 1;
                                    local v1708 = 1;
                                    for v1709 = 1, 20 do
                                        for v1710 = 1, 20 do
                                            local v1711 = v1704[v1709]:dist(v1704[v1710]);
                                            if v1706 < v1711 then
                                                v1706 = v1711;
                                                local l_v1709_0 = v1709;
                                                v1708 = v1710;
                                                v1707 = l_v1709_0;
                                            end;
                                        end;
                                    end;
                                    if v1706 == 0 then
                                        return;
                                    else
                                        v1703[2] = (v1704[v1707] + v1704[v1708]) / 2;
                                        v1703[3] = l_realtime_3 + 0.5;
                                        v1703[4] = v1706 * 0.65;
                                    end;
                                end;
                                local v1713 = v1703[5] - l_tickcount_2;
                                v1703[1] = v139(v1703[1], v1703[4], 0.05);
                                local v1714 = v1703[1];
                                local v1715 = v1703[2];
                                local v1716 = 1;
                                if v1693 then
                                    local v1717 = v1693:dist(v1701);
                                    v1716 = v1717 > 500 and math.clamp(15 / (v1717 - 500), 0, 1) or 1;
                                end;
                                local v1718 = l_v1696_0[1];
                                local l_m_hOwnerEntity_0 = v1700.m_hOwnerEntity;
                                if l_m_hOwnerEntity_0 and l_m_hOwnerEntity_0.m_iTeamNum == l_l_m_iTeamNum_0_0 and l_m_hOwnerEntity_0 ~= v1690 then
                                    v1718 = l_v1696_0[2];
                                end;
                                render.circle_3d_outline(v1715, v1718.alpha_modulate(v1718, v1718.a * v1716 * (v1713 < 15 and v1713 / 15 or 1)), v1714, 0, 1, 1.3);
                                if v1713 <= 0 then
                                    v1688[v1702] = nil;
                                end;
                                return;
                            end;
                        end);
                    end;
                end;
                if v263.Modifications.grenade_radius.options:get(2) then
                    local v1720 = v263.Modifications.grenade_radius.smoke_color:Get();
                    do
                        local l_v1720_0 = v1720;
                        entity.get_entities("CSmokeGrenadeProjectile", false, function(v1722)
                            -- upvalues: v1689 (ref), l_tickinterval_1 (ref), v139 (ref), v1693 (ref), l_tickcount_2 (ref), l_v1720_0 (ref)
                            local v1723 = v1722:get_origin();
                            if not v1723 or v1722.m_nSmokeEffectTickBegin == 0 then
                                return;
                            else
                                local v1724 = v1722:get_index();
                                if not v1689[v1724] then
                                    v1689[v1724] = {
                                        [1] = 0, 
                                        [2] = v1722.m_nSmokeEffectTickBegin + math.floor(17.55 / l_tickinterval_1)
                                    };
                                end;
                                local v1725 = v1689[v1724];
                                v1725[1] = v139(v1725[1], 125, 0.05);
                                local v1726 = 1;
                                if v1693 then
                                    local v1727 = v1693:dist(v1723);
                                    v1726 = v1727 > 850 and math.clamp(15 / (v1727 - 850), 0, 1) or 1;
                                end;
                                local v1728 = v1725[2] - l_tickcount_2;
                                render.circle_3d_outline(v1723, l_v1720_0:alpha_modulate(l_v1720_0.a * v1726 * (v1728 < 15 and v1728 / 15 or 1)), v1725[1], 0, 1, 1.3);
                                if v1728 <= 0 then
                                    v1689[v1724] = nil;
                                end;
                                return;
                            end;
                        end);
                    end;
                end;
                return;
            end;
        end;
    end);
end)();
v1463 = function(v1729, v1730)
    local v1731 = globals.realtime * (v1730 or 1) % math.pi;
    local v1732 = math.sin(v1731 + (v1729 or 0));
    return (math.abs(v1732));
end;
v1464 = table.concat;
local v1745 = new_class():struct("info")({
    screen_size = render.screen_size()
}):struct("draw")({
    field = function(_, v1734, v1735, v1736, v1737, v1738, v1739, v1740)
        local l_v1740_0 = v1740;
        render.shadow(v1734 - vector(0, v1739), v1734 + v1735, v1738, 32, 0, l_v1740_0);
        render.rect(v1734, v1734 + v1735, v1737, l_v1740_0);
        if v1739 ~= 0 then
            render.rect(v1734 - vector(-l_v1740_0, v1739), v1734 + vector(v1735.x - l_v1740_0, 0), v1736, 0);
            if l_v1740_0 ~= 0 then
                local v1742 = vector(l_v1740_0, l_v1740_0);
                render.circle_outline(v1734 + v1742, v1736, l_v1740_0 + v1739, -180, 0.25, v1739);
                render.circle_outline(v1734 + vector(v1735.x - l_v1740_0, l_v1740_0), v1736, l_v1740_0 + v1739, -90, 0.25, v1739);
                local v1743 = v1736:alpha_modulate(0);
                local _ = v1739 / 2 - 1;
                render.gradient(v1734 - vector(v1739, -l_v1740_0), v1734 + vector(0, l_v1740_0 + 10), v1736, v1736, v1743, v1743);
                render.gradient(v1734 + vector(v1735.x, l_v1740_0), v1734 + vector(v1735.x + v1739, l_v1740_0 + 10), v1736, v1736, v1743, v1743);
            end;
        end;
    end
});
local function v1748(v1746, v1747)
    if v1747 < v1746:len() then
        v1746 = v1746:sub(0, v1747) .. "...";
    end;
    return v1746;
end;
local function v1753(v1749, v1750, v1751, v1752)
    v1749 = v1749 / v1752 - 1;
    return v1751 * (math.pow(v1749, 5) + 1) + v1750;
end;
local v1754 = v67.build == "beta" and " [beta]" or "";
local v1755 = l_ui_0.find("Miscellaneous", "Main", "Other", "Windows");
local v1756 = 0;
local v1757 = 0;
local v1758 = 0;
local v1759 = "0 fps";
local l_cl_updaterate_0 = cvar.cl_updaterate;
local v1761 = nil;
local v1762 = utils.get_vfunc("engine.dll", "VEngineClient014", 78, "void*(__thiscall*)(void*)");
local v1763 = utils.get_vfunc(25, "void(__thiscall*)(void*, float*, float*, float*)");
local v1764 = ffi.typeof("float[1]");
do
    local l_v1762_0, l_v1763_0, l_v1764_0 = v1762, v1763, v1764;
    v1761 = function()
        -- upvalues: l_v1762_0 (ref), l_v1764_0 (ref), l_v1763_0 (ref)
        local v1768 = l_v1762_0();
        if v1768 == nil then
            return 0, 0;
        else
            local v1769 = l_v1764_0();
            local v1770 = l_v1764_0();
            l_v1763_0(v1768, v1769, v1770, l_v1764_0());
            return tonumber(v1769[0]), tonumber(v1770[0]);
        end;
    end;
end;
v1762 = {
    color(255, 255, 255, 255), 
    color(255, 31, 31, 255), 
    color(255, 125, 31, 255), 
    color(255, 255, 31, 255)
};
do
    local l_v1464_1, l_v1745_0, l_v1748_0, l_v1754_0, l_v1755_0, l_v1756_0, l_v1757_0, l_v1759_0, l_l_cl_updaterate_0_0, l_v1761_0, l_v1762_1, l_v1763_1, l_v1764_1 = v1464, v1745, v1748, v1754, v1755, v1756, v1757, v1759, l_cl_updaterate_0, v1761, v1762, v1763, v1764;
    l_v1763_1 = function(v1784, v1785, v1786, v1787, v1788)
        -- upvalues: l_v1762_1 (ref), l_abs_0 (ref)
        if v1785 == 0 then
            return l_v1762_1[1];
        else
            local v1789 = l_abs_0(v1785 - v1784) / v1785;
            if v1788 < v1789 then
                return l_v1762_1[2];
            elseif v1787 < v1789 then
                return l_v1762_1[3];
            elseif v1786 < v1789 then
                return l_v1762_1[4];
            else
                return l_v1762_1[1];
            end;
        end;
    end;
    l_v1764_1 = nil;
    network.get("https://i.imgur.com/6viN9T2.png", {}, function(v1790)
        -- upvalues: l_v1764_1 (ref)
        if v1790 then
            l_v1764_1 = render.load_image(v1790, vector(64, 64));
        end;
    end);
    local v1921 = new_class():struct("ui")({
        parent = v314:SetupGroup(v489, v404.tabs.Widgets), 
        get_colors = function(_, v1792)
            local v1793 = {
                v1792:to_hsv()
            };
            local v1794 = (v1793[2] * 255 - 85) / 255;
            return color():as_hsv(v1793[1], math.max(0, v1794), v1793[3] + (v1794 < 0 and -v1794 or 0), 1), v1792;
        end
    }):struct("watermark")({
        menu = {}, 
        anims = {
            global_alpha = 0, 
            size_x = 0, 
            new_alpha_req = 1, 
            requested_size_x = 125
        }, 
        initialize = function(v1795)
            -- upvalues: v263 (ref)
            v1795.menu.main = v263.Visuals.velocity_warning.items;
            v1795.menu.parent = v1795.menu.main:create();
            local l_parent_1 = v1795.menu.parent;
            v1795.menu.accent = l_parent_1:color_picker("Accent", color(167, 167, 255, 255));
            v1795.menu.accent1 = l_parent_1:color_picker("Gradient", color());
            v1795.menu.shadow = l_parent_1:color_picker("Shadow", color(167, 167, 255, 125));
            v1795.menu.background = l_parent_1:color_picker("Background", color(17, 17, 17, 125));
            l_parent_1:label(" ");
            v1795.menu.elements = l_parent_1:selectable("Elements", {
                [1] = "Title", 
                [2] = "Username", 
                [3] = "Latency", 
                [4] = "Time"
            });
            l_parent_1:label(" ");
            v1795.menu.rounding = l_parent_1:slider("Rounding", 0, 10, 4, 1, "px");
            v1795.menu.thickness = l_parent_1:slider("Thickness", 1, 10, 2, 1, "px");
            v1795.menu.backup = nil;
        end, 
        update_time = globals.realtime, 
        update_time_sv = globals.realtime, 
        update_time_var = globals.realtime, 
        update_time_ping = globals.realtime, 
        icons = {
            Username = l_ui_0.get_icon("user") .. " ", 
            Latency = l_ui_0.get_icon("clock-rotate-left") .. " ", 
            Time = l_ui_0.get_icon("clock-five") .. " ", 
            FPS = l_ui_0.get_icon("film") .. " ", 
            ["Server Framerate"] = l_ui_0.get_icon("server") .. " "
        }, 
        reset_backup = function(v1797)
            -- upvalues: v143 (ref), l_v1755_0 (ref), v148 (ref)
            if v1797.menu.backup ~= nil then
                local v1798 = v143(l_v1755_0:get_override() or l_v1755_0:get());
                v1798.Watermark = v1797.menu.backup;
                l_v1755_0:override(v148(v1798));
                v1797.menu.backup = nil;
            end;
        end, 
        draw = function(v1799)
            -- upvalues: v263 (ref), v139 (ref), v143 (ref), l_v1755_0 (ref), v148 (ref), l_v1745_0 (ref), l_v1764_1 (ref), v67 (ref), v1463 (ref), v488 (ref), l_v1754_0 (ref), l_v1748_0 (ref), l_l_cl_updaterate_0_0 (ref), l_v1756_0 (ref), l_v1757_0 (ref), l_v1759_0 (ref), l_v1761_0 (ref), l_v1762_1 (ref), l_v1763_1 (ref)
            local v1800 = v263.Visuals.velocity_warning.main:Get() and v263.Visuals.velocity_warning.items:Get(1);
            local v1801 = v263.Visuals.velocity_warning.elements:get() or {};
            if v1801 == nil then
                return;
            else
                local v1802 = #v1801 - 1;
                local v1803 = v1802 == -1;
                v1799.anims.global_alpha = v139(v1799.anims.global_alpha, v1800 and v1799.anims.new_alpha_req or 0, 0.1);
                local l_global_alpha_0 = v1799.anims.global_alpha;
                if l_global_alpha_0 == 0 then
                    return v1799:reset_backup();
                else
                    local v1805 = v143(l_v1755_0:get_override() or l_v1755_0:get());
                    if v1799.menu.backup == nil then
                        v1799.menu.backup = v1805.Watermark;
                        v1805.Watermark = false;
                        l_v1755_0:override(v148(v1805));
                    end;
                    v1799.anims.size_x = v139(v1799.anims.size_x, v1799.anims.requested_size_x, 0.075);
                    local l_size_x_0 = v1799.anims.size_x;
                    local v1807 = vector(l_size_x_0, 21);
                    local v1808 = vector(l_v1745_0.info.screen_size.x - v1807.x - 10, 9);
                    local v1809 = v263.Visuals.velocity_warning.accent:Get();
                    local v1810 = l_v1764_1 and color(0, 0) or color(17, 17, 17, l_global_alpha_0 * 145);
                    local v1811, v1812 = v1799.ui:get_colors(v1809);
                    local v1813 = v1809:alpha_modulate(v1809.a * l_global_alpha_0);
                    local v1814 = v263.Visuals.velocity_warning.rounding:get();
                    local v1815 = v1812:alpha_modulate(v1812.a * l_global_alpha_0 * (l_v1764_1 and 0 or 1));
                    local v1816 = "";
                    if l_v1764_1 then
                        local _ = v1809:alpha_modulate(0);
                        local v1818 = v1808 - vector(21, 0);
                        local v1819 = v1808 + vector(v1807.x, 21);
                        render.rect(v1818, v1819, color(17, 17, 17, l_global_alpha_0 * 145), v1814);
                        render.shadow(v1818, v1819, v1812:alpha_modulate(v1812.a * l_global_alpha_0), 32, 0, v1814);
                        render.texture(l_v1764_1, v1808 - vector(18, 0), vector(22, 22), color(255, 255, 255, l_global_alpha_0 * 255));
                        if v67.build == "beta" then
                            local v1820 = "[beta] ";
                            local v1821 = #v1820 + 1;
                            local v1822 = "";
                            local v1823 = nil;
                            for v1824 = 1, v1821 do
                                local v1825 = v1820:sub(v1824, v1824);
                                local v1826 = (v1824 - 1) / v1821;
                                local v1827 = v1463(v1826 * 0.8, 0.8);
                                local v1828 = v1809:alpha_modulate(l_global_alpha_0 * 255):lerp(color(255, 255, 255, l_global_alpha_0 * 255), v1827);
                                if v1824 == 1 then
                                    v1823 = v1828;
                                end;
                                v1822 = v1822 .. string.format("\a%s%s", v1828:to_hex(), v1825);
                            end;
                            v1816 = v1816 .. v1822 .. "\aDEFAULT";
                        end;
                        v1816 = v1816 .. (not v1803 and "\194\183 " or "");
                    end;
                    l_v1745_0.draw:field(v1808, v1807, v1813, v1810:alpha_modulate(v1810.a * l_global_alpha_0), v1815, 0, v1814, l_v1764_1);
                    local v1829 = v143(v1801);
                    if v1829.Title then
                        local l_v1809_0 = v1809;
                        local l_v1811_0 = v1811;
                        v1816 = v1816 .. v488(l_v1809_0:alpha_modulate(l_global_alpha_0 * 255), l_v1811_0:alpha_modulate(l_v1811_0.a * l_global_alpha_0), "neverlose") .. "\aDEFAULT" .. l_v1754_0 .. (v1802 > 0 and " \194\183 " or "");
                        v1802 = v1802 - 1;
                    end;
                    if v1829.Username then
                        local v1832 = l_v1748_0(v263.Visuals.velocity_warning.custom_name:get(), 30);
                        local v1833 = v1832 == "" and v67.username or v1832;
                        v1816 = v1816 .. v1799.icons.Username .. v1833 .. (v1802 > 0 and " \194\183 " or "");
                        v1802 = v1802 - 1;
                    end;
                    local l_realtime_4 = globals.realtime;
                    if v1829.Latency then
                        if v1799.ping == nil or v1799.update_time_ping < l_realtime_4 then
                            v1799.ping = "local";
                            local v1835 = utils.net_channel();
                            if v1835 and not v1835.is_loopback then
                                local v1836 = l_l_cl_updaterate_0_0:float();
                                if v1836 > 0.001 then
                                    local v1837 = -0.5 / v1836;
                                    v1799.ping = math.max(0, math.floor((v1835.avg_latency[1] + v1837) * 1000)) .. "ms";
                                else
                                    v1799.ping = math.max(0, math.floor(v1835.avg_latency[1] * 1000)) .. "ms";
                                end;
                            end;
                            v1799.update_time_ping = l_realtime_4 + 2;
                        end;
                        if v1799.ping ~= "local" then
                            v1816 = v1816 .. v1799.icons.Latency .. v1799.ping .. (v1802 > 0 and " \194\183 " or "");
                            v1802 = v1802 - 1;
                        end;
                    end;
                    if v1829.FPS then
                        if globals.tickcount % 64 == 0 or l_v1756_0 == 0 then
                            l_v1756_0 = 0.9 * l_v1756_0 + 0.1 * globals.absoluteframetime;
                            if l_v1756_0 < 0 then
                                l_v1756_0 = 1;
                            end;
                            l_v1757_0 = 1 / l_v1756_0;
                        end;
                        local v1838 = math.floor(l_v1757_0);
                        l_v1759_0 = v1838 <= 70 and "\a" .. color(255, 117, 117):lerp(color(255, 0, 0), math.min(1, 1 - (v1838 - 60) / 10)):to_hex() .. v1838 or v1838;
                        v1816 = v1816 .. v1799.icons.FPS .. l_v1759_0 .. "fps\aDEFAULT" .. (v1802 > 0 and " \194\183 " or "");
                        v1802 = v1802 - 1;
                    end;
                    if v1829["Server Framerate"] then
                        if not v1799.sv or v1799.update_time_sv < l_realtime_4 then
                            local v1839, v1840 = l_v1761_0();
                            local v1841 = l_v1762_1[1];
                            local l_tickinterval_2 = globals.tickinterval;
                            if l_tickinterval_2 + 1.0E-4 < v1839 then
                                v1841 = l_v1763_1(v1839, l_tickinterval_2, 0.25, 0.5, 0.75);
                            end;
                            v1799.sv = ("\a%ssv: %.1f (%.1fms)\aDEFAULT"):format(v1841.to_hex(v1841), v1839 * 1000, v1840 * 1000);
                            v1799.update_time_sv = l_realtime_4 + 0.5;
                        end;
                        v1816 = v1816 .. v1799.icons["Server Framerate"] .. v1799.sv .. (v1802 > 0 and " \194\183 " or "");
                        v1802 = v1802 - 1;
                    end;
                    if v1829.Time then
                        if not v1799.time or v1799.update_time < l_realtime_4 then
                            local v1843 = common.get_system_time();
                            v1799.time = ("%02d:%02d"):format(v1843.hours, v1843.minutes);
                            v1799.update_time = l_realtime_4 + 5;
                        end;
                        v1816 = v1816 .. v1799.icons.Time .. v1799.time .. (v1802 > 0 and " \194\183 " or "");
                        v1802 = v1802 - 1;
                    end;
                    if v1802 == 0 then
                        v1816 = v1816.sub(v1816, 0, -5);
                    end;
                    render.push_clip_rect(v1808, v1808 + v1807 - vector(0, 4));
                    render.text(1, v1808 + vector(7, 4), color(255, 255 * l_global_alpha_0), "", v1816);
                    render.pop_clip_rect();
                    v1799.anims.requested_size_x = render.measure_text(1, "", v1816).x + (not v1803 and 13 or 8);
                    return;
                end;
            end;
        end
    }):struct("keybinds")({
        drag = v681.add("keybinds", vector(40 / v67.screen_size.x, v67.screen_size.y / 5 / v67.screen_size.y), vector(125, 22)), 
        menu = {}, 
        initialize = function(v1844)
            v1844.menu.main = v1844.ui.parent:switch("Keybinds");
            v1844.menu.parent = v1844.menu.main:create();
            local l_parent_2 = v1844.menu.parent;
            v1844.menu.accent = l_parent_2:color_picker("Accent", color(167, 167, 255, 255));
            v1844.menu.shadow = l_parent_2:color_picker("Shadow", color(167, 167, 255, 125));
            v1844.menu.background = l_parent_2:color_picker("Background", color(17, 17, 17, 125));
            l_parent_2:label(" ");
            v1844.menu.rounding = l_parent_2:slider("Rounding", 0, 10, 4, 1, "px");
            v1844.menu.thickness = l_parent_2:slider("Thickness", 1, 10, 2, 1, "px");
            v1844.menu.backup = nil;
        end, 
        anims = {
            global_alpha = 0, 
            size_x = 125, 
            requested_size_x = 125, 
            binds = {}
        }, 
        reset_backup = function(v1846)
            -- upvalues: v143 (ref), l_v1755_0 (ref), v148 (ref)
            if v1846.menu.backup ~= nil then
                local v1847 = v143(l_v1755_0:get_override() or l_v1755_0:get());
                v1847.Hotkeys = v1846.menu.backup;
                l_v1755_0:override(v148(v1847));
                v1846.menu.backup = nil;
            end;
        end, 
        draw = function(v1848)
            -- upvalues: v263 (ref), l_ui_0 (ref), v139 (ref), v143 (ref), l_v1755_0 (ref), v148 (ref), l_v1745_0 (ref), l_v1464_1 (ref), l_v1748_0 (ref), v16 (ref)
            local v1849 = v263.Visuals.velocity_warning.main:Get() and v263.Visuals.velocity_warning.items:Get(2);
            local v1850 = nil;
            local v1851 = false;
            if v1849 then
                v1850 = l_ui_0.get_binds();
                for _, v1853 in pairs(v1850) do
                    local l_name_0 = v1853.name;
                    local l_value_0 = v1853.value;
                    if not v1848.anims.binds[l_name_0] then
                        v1848.anims.binds[l_name_0] = {
                            anim = 0, 
                            type = type(l_value_0)
                        };
                    end;
                    if v1853.active then
                        v1851 = true;
                        break;
                    end;
                end;
            end;
            local v1856 = l_ui_0.get_alpha();
            v1848.anims.global_alpha = v139(v1848.anims.global_alpha, v1849 and (not (v1856 <= 0) or v1851) and 1 or 0, 0.1);
            local l_global_alpha_1 = v1848.anims.global_alpha;
            if v1856 ~= 0 and v1849 and not v1851 then
                v1848.anims.global_alpha = v1856;
                l_global_alpha_1 = v1856;
            end;
            if not v1849 then
                v1848:reset_backup();
            end;
            if l_global_alpha_1 == 0 then
                return;
            else
                local v1858 = v143(l_v1755_0:get_override() or l_v1755_0:get());
                if v1848.menu.backup == nil and v1849 then
                    v1848.menu.backup = v1858.Hotkeys;
                    v1858.Hotkeys = false;
                    l_v1755_0:override(v148(v1858));
                end;
                local v1859 = v1848.drag:process();
                v1848.anims.size_x = v139(v1848.anims.size_x, v1848.anims.requested_size_x, 0.075);
                v1859.size.x = v1848.anims.size_x;
                local v1860 = v263.Visuals.velocity_warning.accent:Get();
                local v1861 = color(17, 17, 17, 145);
                local _, v1863 = v1848.ui:get_colors(v1860);
                local l_position_3 = v1859.position;
                local l_size_0 = v1859.size;
                l_v1745_0.draw:field(l_position_3, l_size_0, v1860:alpha_modulate(v1860.a * l_global_alpha_1), v1861:alpha_modulate(v1861.a * l_global_alpha_1), v1863:alpha_modulate(v1863.a * l_global_alpha_1), 0, v263.Visuals.velocity_warning.rounding:get());
                render.text(1, l_position_3 + l_size_0 / 2 - vector(0, 1), color(255, 255 * l_global_alpha_1), "c", "keybinds");
                local v1866 = 27;
                v1848.anims.requested_size_x = 125;
                if not v1850 then
                    return;
                else
                    local v1867 = 0;
                    for _, v1869 in pairs(v1850) do
                        local l_name_1 = v1869.name;
                        local l_value_1 = v1869.value;
                        if not v1848.anims.binds[l_name_1] then
                            v1848.anims.binds[l_name_1] = {
                                anim = 0, 
                                type = type(l_value_1)
                            };
                        end;
                        local v1872 = v1848.anims.binds[l_name_1];
                        v1872.anim = v139(v1872.anim, v1869.active and 1 or 0, 0.1);
                        local l_anim_0 = v1872.anim;
                        local v1874 = 255 * l_global_alpha_1 * l_anim_0;
                        if v1874 ~= 0 then
                            local v1875 = nil;
                            if v1872.type == "table" then
                                v1875 = "";
                                for _, _ in pairs(l_value_1) do
                                    v1875 = l_v1464_1(l_value_1, ", ");
                                end;
                            elseif v1872.type == "boolean" then
                                v1875 = v1869.mode == 1 and "holding" or "toggled";
                            else
                                v1875 = tostring(l_value_1);
                            end;
                            v1875 = "[" .. l_v1748_0(v1875, 15) .. "]";
                            render.text(1, l_position_3 + vector(2, v1866), color(255, v1874), "", l_name_1);
                            render.text(1, l_position_3 + vector(l_size_0.x - 2, v1866), color(255, v1874), "r", v1875);
                            local v1878 = render.measure_text(1, "", l_name_1).x + render.measure_text(1, "", v1875).x + 15;
                            if v1878 > 125 and v1867 < v1878 then
                                v1848.anims.requested_size_x = v1878;
                                v1867 = v1848.anims.requested_size_x;
                            end;
                        end;
                        v1866 = v1866 + v16(15, l_anim_0);
                    end;
                    return;
                end;
            end;
        end
    }):struct("spectators")({
        drag = v681.add("spectators", vector(40 / v67.screen_size.x, v67.screen_size.y / 3 / v67.screen_size.y), vector(125, 22)), 
        menu = {}, 
        specs = {}, 
        anims = {
            global_alpha = 0, 
            size_x = 125, 
            requested_size_x = 125
        }, 
        reset_backup = function(v1879)
            -- upvalues: v143 (ref), l_v1755_0 (ref), v148 (ref)
            if v1879.menu.backup ~= nil then
                local v1880 = v143(l_v1755_0:get_override() or l_v1755_0:get());
                v1880.Spectators = v1879.menu.backup;
                l_v1755_0:override(v148(v1880));
                v1879.menu.backup = nil;
            end;
        end, 
        update = function(v1881)
            -- upvalues: l_v1748_0 (ref), v139 (ref)
            if not globals.is_connected or not globals.is_in_game then
                v1881.specs = {};
                return {}, false;
            else
                local v1882 = false;
                local _ = true;
                local v1884 = entity.get_local_player();
                if not v1884 then
                    return;
                else
                    local v1885 = v1884:is_alive();
                    local v1886 = nil;
                    if not v1885 then
                        v1886 = v1884.m_hObserverTarget;
                    end;
                    local v1887 = 0;
                    for v1888 = 1, 65 do
                        local v1889 = v1881.specs[v1888];
                        if not v1889 then
                            v1881.specs[v1888] = {
                                animation = 0
                            };
                            v1889 = v1881.specs[v1888];
                        end;
                        local v1890 = entity.get(v1888 - 1);
                        if v1890 ~= nil and v1890:is_player() and v1890 ~= v1884 then
                            local l_m_iObserverMode_0 = v1890.m_iObserverMode;
                            local l_m_hObserverTarget_0 = v1890.m_hObserverTarget;
                            if not v1889.name then
                                v1889.name = l_v1748_0(v1890:get_name(), 16);
                            end;
                            local v1893 = l_m_iObserverMode_0 == 6 or not (l_m_hObserverTarget_0 == (v1885 and v1884 or v1886)) or v1890:is_dormant();
                            v1889.animation = v139(v1889.animation, v1893 and 0 or 1, 0.1);
                            local l_animation_0 = v1889.animation;
                            if not v1893 then
                                v1887 = v1887 + 1;
                            end;
                            if l_animation_0 > 0.01 then
                                if not v1889.avatar then
                                    v1889.avatar = v1890:get_steam_avatar();
                                end;
                                v1882 = true;
                            end;
                        end;
                    end;
                    return v1881.specs, v1887 > 0;
                end;
            end;
        end, 
        reset_specs = function(v1895)
            v1895.specs = {};
        end, 
        draw = function(v1896)
            -- upvalues: v263 (ref), l_ui_0 (ref), v139 (ref), v143 (ref), l_v1755_0 (ref), v148 (ref), l_v1745_0 (ref), v16 (ref)
            local v1897 = v263.Visuals.velocity_warning.main:Get() and v263.Visuals.velocity_warning.items:Get(3);
            local v1898 = nil;
            local v1899 = nil;
            if v1897 then
                local v1900, v1901 = v1896:update();
                v1899 = v1901;
                v1898 = v1900;
            end;
            local v1902 = l_ui_0.get_alpha();
            v1896.anims.global_alpha = v139(v1896.anims.global_alpha, v1897 and (not (v1902 <= 0) or v1899) and 1 or 0, 0.1);
            local l_global_alpha_2 = v1896.anims.global_alpha;
            if v1902 ~= 0 and v1897 and not v1899 then
                v1896.anims.global_alpha = v1902;
                l_global_alpha_2 = v1902;
            end;
            if not v1897 then
                v1896:reset_backup();
            end;
            if l_global_alpha_2 == 0 then
                return;
            else
                if not v1898 then
                    v1898 = {};
                end;
                local v1904 = v143(l_v1755_0:get_override() or l_v1755_0:get());
                if v1896.menu.backup == nil and v1897 then
                    v1896.menu.backup = v1904.Spectators;
                    v1904.Spectators = false;
                    l_v1755_0:override(v148(v1904));
                end;
                local v1905 = v1896.drag:process();
                v1896.anims.size_x = v139(v1896.anims.size_x, v1896.anims.requested_size_x, 0.075);
                v1905.size.x = v1896.anims.size_x;
                local v1906 = v263.Visuals.velocity_warning.accent:Get();
                local v1907 = color(17, 17, 17, 145);
                local _, v1909 = v1896.ui:get_colors(v1906);
                local l_position_4 = v1905.position;
                local l_size_1 = v1905.size;
                l_v1745_0.draw:field(l_position_4, l_size_1, v1906:alpha_modulate(v1906.a * l_global_alpha_2), v1907:alpha_modulate(v1907.a * l_global_alpha_2), v1909:alpha_modulate(v1909.a * l_global_alpha_2), 0, v263.Visuals.velocity_warning.rounding:get());
                render.text(1, l_position_4 + l_size_1 / 2, color(255, 255 * l_global_alpha_2), "c", "spectators");
                local v1912 = 25;
                v1896.anims.requested_size_x = 125;
                local v1913 = 125;
                for v1914 = 1, #v1898 do
                    local v1915 = v1898[v1914];
                    local l_animation_1 = v1915.animation;
                    if l_animation_1 > 0.01 then
                        local v1917 = 0;
                        local v1918 = l_animation_1 * l_global_alpha_2;
                        local v1919 = v1918 * 255;
                        if v1915.avatar then
                            render.texture(v1915.avatar, l_position_4 + vector(2, v1912), vector(12, 12), color(255, v1919), "f", 3);
                            v1917 = 18;
                        end;
                        render.text(1, l_position_4 + vector(v1917 + 2, v1912), color(255, v1919), "", v1915.name);
                        local v1920 = render.measure_text(1, "", v1915.name).x + v1917;
                        if v1920 and v1920 > 125 and v1913 < v1920 then
                            v1896.anims.requested_size_x = v1920;
                            v1913 = v1896.anims.requested_size_x;
                        end;
                        v1912 = v1912 + v16(15, v1918);
                    end;
                end;
                return;
            end;
        end
    });
    v263.Visuals.velocity_warning.elements:set_callback(function()
        -- upvalues: v1921 (ref)
        v1921.watermark.anims.new_alpha_req = 0;
        v1921.watermark.anims.global_alpha = 0.01;
        utils.execute_after(0.25, function()
            -- upvalues: v1921 (ref)
            v1921.watermark.anims.new_alpha_req = 1;
        end);
    end, true);
    v260:add("draw", "sowus", function()
        -- upvalues: v1921 (ref)
        v1921.watermark:draw();
        v1921.keybinds:draw();
        v1921.spectators:draw();
    end);
    v260:add("destroy", "sowus backups", function()
        -- upvalues: v1921 (ref)
        v1921.watermark:reset_backup();
        v1921.keybinds:reset_backup();
        v1921.spectators:reset_backup();
    end);
    v260:add("cs_game_disconnected", "sowus spectawtows", function()
        -- upvalues: v1921 (ref)
        v1921.spectators:reset_specs();
    end);
    v260:add("round_prestart", "sowus spectawtows1", function()
        -- upvalues: v1921 (ref)
        v1921.spectators:reset_specs();
    end);
end;
v1464 = nil;
v1745 = render.load_font("Calibri Bold", vector(25, 22, -1), "ad");
v1748 = {
    white = color(255, 255, 255, 200), 
    red = color(255, 0, 40, 200), 
    green = color(155, 200, 21, 200), 
    piss = color(255, 175, 70, 200), 
    plant_ok = color(255, 255, 130, 200), 
    plant_warning = color(255, 255, 135, 200), 
    gradient_in = color(0, 0, 0, 60), 
    gradient_out = color(0, 0, 0, 0)
};
v1753 = {
    gap = 41
};
do
    local l_v1745_1, l_v1748_1, l_v1753_0, l_v1754_1, l_v1755_1, l_v1756_1, l_v1757_1, l_v1758_0, l_v1759_1, l_l_cl_updaterate_0_1 = v1745, v1748, v1753, v1754, v1755, v1756, v1757, v1758, v1759, l_cl_updaterate_0;
    l_v1754_1 = function(v1932, v1933, v1934)
        -- upvalues: l_v1745_1 (ref), l_v1748_1 (ref)
        local v1935 = render.measure_text(l_v1745_1, "a", v1933);
        local l_gradient_in_0 = l_v1748_1.gradient_in;
        local l_gradient_out_0 = l_v1748_1.gradient_out;
        render.gradient(v1932 - vector(0, 5), v1932 + vector(28 + v1935.x / 2, 28), l_gradient_out_0, l_gradient_in_0, l_gradient_out_0, l_gradient_in_0);
        render.gradient(v1932 + vector(28 + v1935.x / 2, -5), v1932 + vector((28 + v1935.x / 2) * 2 - 1, 28), l_gradient_in_0, l_gradient_out_0, l_gradient_in_0, l_gradient_out_0);
        render.text(l_v1745_1, v1932 + vector(27, 3), v1934, "", v1933);
    end;
    l_v1755_1 = {
        doubletap = l_ui_0.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
        hideshots = l_ui_0.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
        fakeduck = l_ui_0.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
        body_aim = {
            main = l_ui_0.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
            disablers = l_ui_0.find("Aimbot", "Ragebot", "Safety", "Body Aim", "Disablers")
        }, 
        safe_points = l_ui_0.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
        freestanding = l_ui_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
        fake_latency = l_ui_0.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
        ragebot = l_ui_0.find("Aimbot", "Ragebot", "Main", "Enabled"), 
        dormant_aimbot = l_ui_0.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot")
    };
    l_v1756_1 = nil;
    l_v1756_1 = {
        total = 0, 
        hits = 0, 
        reasons = {
            ["player death"] = true, 
            ["prediction error"] = true, 
            ["unregistered shot"] = true, 
            death = true
        }
    };
    events.aim_ack:set(function(v1938)
        -- upvalues: l_v1756_1 (ref)
        if l_v1756_1.reasons[v1938.state] ~= nil then
            return;
        else
            l_v1756_1.total = l_v1756_1.total + 1;
            if not v1938.state then
                l_v1756_1.hits = l_v1756_1.hits + 1;
            end;
            return;
        end;
    end);
    l_v1757_1 = function()
        -- upvalues: l_v1756_1 (ref)
        l_v1756_1.hits = 0;
        l_v1756_1.total = 0;
    end;
    events.level_init:set(l_v1757_1);
    events.game_start:set(l_v1757_1);
    l_v1757_1 = nil;
    l_v1757_1 = {
        damage = "-0 HP", 
        icon = render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg", vector(30, 30))
    };
    l_v1758_0 = function()
        -- upvalues: l_v1757_1 (ref)
        l_v1757_1.site = nil;
    end;
    events.round_start:set(l_v1758_0);
    events.bomb_planted:set(l_v1758_0);
    events.bomb_abortplant:set(l_v1758_0);
    l_v1757_1.planting_time = 3.125;
    l_v1759_1 = function(v1939, v1940)
        local v1941 = 0.5;
        local v1942 = 0.5;
        if v1940 and v1940 > 0 then
            local v1943 = v1939 * v1941;
            if v1940 < (v1939 - v1943) * v1942 then
                v1943 = v1939 - v1940 * (1 / v1942);
            end;
            v1939 = v1943;
        end;
        return v1939;
    end;
    do
        local l_l_v1759_1_0, l_l_l_cl_updaterate_0_1_0 = l_v1759_1, l_l_cl_updaterate_0_1;
        l_l_l_cl_updaterate_0_1_0 = function(v1946, v1947)
            -- upvalues: l_l_v1759_1_0 (ref)
            if not v1946 then
                return 0;
            else
                local v1948 = v1946:get_origin():dist(v1947:get_origin());
                local v1949 = 500;
                local v1950 = v1949 * 3.5;
                v1949 = v1949 * math.exp(-(v1948 * v1948 / (v1950 * 2 / 3 * (v1950 / 3))));
                return (math.floor(l_l_v1759_1_0(math.max(v1949, 0), v1946.m_ArmorValue)));
            end;
        end;
        v260:add("draw", "skit \208\183\208\176\208\191\208\187\208\181\208\189\209\135\208\181\208\189\208\176\209\143 \208\177\208\190\208\188\208\177\208\176 \208\180\208\181\209\130\208\181\208\186\209\130", function()
            -- upvalues: l_v1757_1 (ref), l_l_l_cl_updaterate_0_1_0 (ref)
            l_v1757_1.entity = nil;
            l_v1757_1.damage = "";
            entity.get_entities("CPlantedC4", true, function(v1951)
                -- upvalues: l_v1757_1 (ref)
                if not v1951.m_bBombTicking or globals.curtime > v1951.m_flC4Blow then
                    return;
                else
                    l_v1757_1.entity = v1951;
                    return;
                end;
            end);
            local v1952 = entity.get_local_player();
            if not l_v1757_1.entity or not v1952 then
                return;
            else
                local l_m_iObserverMode_1 = v1952.m_iObserverMode;
                if l_m_iObserverMode_1 == 6 or l_m_iObserverMode_1 == 1 or l_m_iObserverMode_1 == 2 then
                    return;
                else
                    local v1954 = v1952.m_hObserverTarget or v1952;
                    local v1955 = l_l_l_cl_updaterate_0_1_0(v1954, l_v1757_1.entity);
                    l_v1757_1.damage = v1954.m_iHealth <= v1955 and "FATAL" or string.format("-%d HP", v1955);
                    return;
                end;
            end;
        end);
        v260:add("bomb_beginplant", "skit bomba", function(v1956)
            -- upvalues: l_v1757_1 (ref)
            local v1957 = entity.get(v1956.site);
            if not v1957 then
                return;
            else
                local v1958 = ffi.cast("uintptr_t", v1957[0]) + 340;
                l_v1757_1.site = ffi.cast("char*", v1958)[0] == 65 and "A" or "B";
                l_v1757_1.planting_started = globals.curtime;
                return;
            end;
        end);
    end;
    l_v1758_0 = {
        [1] = {
            menu = "Bomb Info", 
            condition = function()
                -- upvalues: l_v1757_1 (ref)
                return l_v1757_1.site ~= nil and entity.get_game_rules() ~= nil;
            end, 
            get_text = function()
                -- upvalues: l_v1757_1 (ref)
                return "       " .. l_v1757_1.site .. "        ";
            end, 
            additional_render = function(v1959)
                -- upvalues: l_v1757_1 (ref), l_v1748_1 (ref)
                local v1960 = (globals.curtime - l_v1757_1.planting_started) / l_v1757_1.planting_time;
                render.circle_outline(v1959 + vector(97, 13), color(0, 0, 0, 100), 10, 0, 1, 4);
                render.circle_outline(v1959 + vector(97, 13), color(), 9, 0, v1960, 2.5);
                render.texture(l_v1757_1.icon, v1959 + vector(27, -3), nil, l_v1748_1.plant_ok);
            end, 
            col = function()
                -- upvalues: l_v1757_1 (ref), l_v1748_1 (ref)
                local v1961 = entity.get_game_rules();
                return l_v1757_1.planting_started + l_v1757_1.planting_time < v1961.m_fRoundStartTime + v1961.m_iRoundTime and l_v1748_1.plant_warning or l_v1748_1.plant_ok;
            end
        }, 
        [2] = {
            menu = "Bomb Info", 
            get_text = function()
                -- upvalues: l_v1757_1 (ref)
                return l_v1757_1.damage;
            end, 
            col = function()
                -- upvalues: l_v1757_1 (ref), l_v1748_1 (ref)
                return l_v1757_1.damage == "FATAL" and l_v1748_1.red or l_v1748_1.plant_ok;
            end, 
            condition = function()
                -- upvalues: l_v1757_1 (ref)
                return l_v1757_1.entity ~= nil and l_v1757_1.damage ~= "-0 HP";
            end
        }, 
        [3] = {
            menu = "Bomb Info", 
            get_text = function()
                -- upvalues: l_v1757_1 (ref)
                local _ = "";
                local l_entity_1 = l_v1757_1.entity;
                return "        " .. (l_entity_1.m_nBombSite == 0 and "A" or "B") .. string.format(" - %.1fs", l_entity_1.m_flC4Blow - globals.curtime);
            end, 
            additional_render = function(v1964)
                -- upvalues: l_v1757_1 (ref), l_v1748_1 (ref)
                render.texture(l_v1757_1.icon, v1964 + vector(27, -3), nil, l_v1748_1.white);
            end, 
            condition = function()
                -- upvalues: l_v1757_1 (ref)
                return l_v1757_1.entity ~= nil;
            end
        }, 
        [4] = {
            text = "FS", 
            menu = "Freestanding", 
            condition = function()
                -- upvalues: l_v1755_1 (ref)
                return l_v1755_1.freestanding:get();
            end
        }, 
        [5] = {
            text = "MD", 
            menu = "Min. Damage", 
            condition = function()
                -- upvalues: l_ui_0 (ref)
                for _, v1966 in ipairs(l_ui_0.get_binds()) do
                    if v1966.name == "Min. Damage" and v1966.active then
                        return true;
                    end;
                end;
                return false;
            end
        }, 
        [6] = {
            text = "BODY", 
            menu = "Force Body Aim", 
            condition = function()
                -- upvalues: l_v1755_1 (ref)
                return l_v1755_1.body_aim.main:get() == "Force" and #l_v1755_1.body_aim.disablers:get() == 0;
            end
        }, 
        [7] = {
            text = "SAFE", 
            menu = "Force Safe Point", 
            condition = function()
                -- upvalues: l_v1755_1 (ref)
                return l_v1755_1.safe_points:get() == "Force";
            end
        }, 
        [8] = {
            text = "DUCK", 
            menu = "Fake Duck", 
            condition = function()
                -- upvalues: l_v1755_1 (ref)
                return l_v1755_1.fakeduck:get();
            end
        }, 
        [9] = {
            text = "DA", 
            menu = "Dormant Aimbot", 
            condition = function()
                -- upvalues: l_v1755_1 (ref)
                return l_v1755_1.ragebot:get() and l_v1755_1.dormant_aimbot:get();
            end
        }, 
        [10] = {
            text = "DT", 
            menu = "Double Tap", 
            col = function()
                -- upvalues: l_v1748_1 (ref)
                return rage.exploit:get() == 1 and l_v1748_1.white or l_v1748_1.red;
            end, 
            condition = function()
                -- upvalues: l_v1755_1 (ref)
                return not l_v1755_1.fakeduck:get() and l_v1755_1.doubletap:get();
            end
        }, 
        [11] = {
            text = "OSAA", 
            menu = "Hide Shots", 
            condition = function()
                -- upvalues: l_v1755_1 (ref)
                return not l_v1755_1.fakeduck:get() and not l_v1755_1.doubletap:get() and l_v1755_1.hideshots:get();
            end
        }, 
        [12] = {
            text = "PING", 
            menu = "Fake Latency", 
            col = function(_)
                -- upvalues: l_v1748_1 (ref), l_v1755_1 (ref)
                local v1968 = utils.net_channel();
                if not v1968 then
                    return l_v1748_1.green;
                else
                    local v1969 = math.min(200, v1968.latency[0] * 1000 - 15);
                    local v1970 = l_v1755_1.fake_latency:get();
                    local v1971 = math.min(v1969, v1970) / math.max(v1969, v1970);
                    if v1971 > 1 then
                        v1971 = 1;
                    end;
                    return v1971 > 0.5 and l_v1748_1.piss:lerp(l_v1748_1.green, (v1971 - 0.5) * 2) or l_v1748_1.white:lerp(l_v1748_1.piss, v1971);
                end;
            end, 
            condition = function()
                -- upvalues: l_v1755_1 (ref)
                return l_v1755_1.fake_latency:get() ~= 0;
            end
        }, 
        [13] = {
            menu = "Aimbot Stats", 
            get_text = function()
                -- upvalues: l_v1756_1 (ref)
                local v1972 = l_v1756_1.total ~= 0 and l_v1756_1.hits / l_v1756_1.total * 100 or 100;
                return string.format("%s%d%%", v1972 < 50 and "\240\159\164\172 " or "", v1972);
            end
        }
    };
    l_v1759_1 = {};
    l_l_cl_updaterate_0_1 = render.screen_size();
    v260:add("draw", "skeet indiki", function()
        -- upvalues: v179 (ref), v143 (ref), v263 (ref), l_l_cl_updaterate_0_1 (ref), l_v1758_0 (ref), l_v1748_1 (ref), l_v1753_0 (ref), l_v1754_1 (ref), l_v1759_1 (ref), l_v1757_1 (ref)
        if not v179.skeet_indicators.main then
            return;
        else
            local v1973 = v143(v263.Visuals.skeet_indicators.items:get());
            local v1974 = entity.get_local_player();
            if not v1974 or not v1974:is_alive() then
                return;
            else
                local v1975 = vector(0, l_l_cl_updaterate_0_1.y - 345);
                local v1976 = 0;
                local v1977 = #l_v1758_0;
                for v1978 = 0, v1977 - 1 do
                    local v1979 = l_v1758_0[v1977 - v1978];
                    if v1973[v1979.menu] and (not v1979.condition or v1979.condition(v1974)) then
                        local v1980 = v1979.col and v1979.col(v1974) or l_v1748_1.white;
                        local v1981 = v1979.text or v1979.get_text();
                        local v1982 = v1975 - vector(0, v1976 * l_v1753_0.gap);
                        l_v1754_1(v1982, l_v1759_1[v1981] or v1981, v1980);
                        if v1979.additional_render then
                            v1979.additional_render(v1982);
                        end;
                        v1976 = v1976 + 1;
                    end;
                end;
                if not l_v1757_1.entity or not v263.Visuals.skeet_indicators.items:get("Bomb Info") then
                    return;
                else
                    local l_m_hBombDefuser_0 = l_v1757_1.entity.m_hBombDefuser;
                    local _ = l_v1757_1.entity.m_flDefuseLength;
                    local v1985 = l_m_hBombDefuser_0 and (l_v1757_1.entity.m_flDefuseCountDown - globals.curtime) * 10 / 10 or -1;
                    local v1986 = l_v1757_1.entity.m_flC4Blow - globals.curtime;
                    if v1985 > 0 then
                        render.rect(vector(), vector(16, l_l_cl_updaterate_0_1.y), color(25, 25, 25, 160));
                        render.rect_outline(vector(), vector(16, l_l_cl_updaterate_0_1.y), color(25, 25, 25, 160));
                        render.rect(vector(0, l_l_cl_updaterate_0_1.y - (l_l_cl_updaterate_0_1.y - 50) / 10 * v1985), vector(16, l_l_cl_updaterate_0_1.y), v1985 < v1986 and color(58, 191, 54, 160) or color(255, 0, 0, 125));
                    end;
                    return;
                end;
            end;
        end;
    end);
end;
(function()
    -- upvalues: v260 (ref), v178 (ref), v263 (ref)
    v260:add("prediction", "very fast ladder", function(v1987, v1988, v1989)
        -- upvalues: v178 (ref), v263 (ref)
        if not v1989 or not v178.antiaim or not v263.AntiAim.tweaks:Get(6) then
            return;
        else
            local v1990 = v1988:get_player_weapon();
            if not v1990 then
                return;
            else
                local v1991 = true;
                if not v1990.m_bPinPulled then
                    v1991 = v1990.m_fThrowTime == nil or v1990.m_fThrowTime == 0;
                end;
                if v1988.m_MoveType == 9 and v1991 then
                    if v1987.sidemove == 0 then
                        v1987.view_angles.y = v1987.view_angles.y + 45;
                    end;
                    if v1987.in_forward then
                        if v1987.sidemove > 0 then
                            v1987.view_angles.y = v1987.view_angles.y - 1;
                        end;
                        if v1987.sidemove < 0 then
                            v1987.view_angles.y = v1987.view_angles.y + 90;
                        end;
                        v1987.in_moveleft = 0;
                        v1987.in_moveright = 1;
                    end;
                    if v1987.in_back then
                        if v1987.sidemove < 0 then
                            v1987.view_angles.y = v1987.view_angles.y - 1;
                        end;
                        if v1987.sidemove > 0 then
                            v1987.view_angles.y = v1987.view_angles.y + 90;
                        end;
                        v1987.in_moveleft = 1;
                        v1987.in_moveright = 0;
                    end;
                end;
                return;
            end;
        end;
    end);
end)();
(function()
    -- upvalues: v260 (ref), v178 (ref), v263 (ref)
    v260:add("prediction", "\208\186\209\128\208\184\209\130\208\188\209\131\208\178", function(v1992, v1993, v1994)
        -- upvalues: v178 (ref), v263 (ref)
        if not v1994 or not v178.antiaim or not v263.AntiAim.tweaks:Get(7) then
            return;
        else
            local v1995 = v1993:get_origin();
            local v1996 = utils.trace_line(v1995, vector(v1995.x, v1995.y, v1995.z - 500), nil, nil, 1);
            if v1995.z - v1996.end_pos.z <= 70 and v1995.z - v1996.end_pos.z >= 12 and bit.band(v1993.m_fFlags, 1) == 0 and v1993.m_vecVelocity.z < -450 then
                v1992.in_duck = true;
            end;
            return;
        end;
    end);
end)();
(function()
    -- upvalues: l_ui_0 (ref), v260 (ref), v178 (ref), v263 (ref), v67 (ref), v669 (ref)
    local v1997 = l_ui_0.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options");
    local v1998 = false;
    local function v1999()
        -- upvalues: v1998 (ref), v1997 (ref)
        if v1998 then
            v1997:override();
            v1998 = false;
        end;
    end;
    v260:add("prediction", "\208\186\209\128\208\184\209\130\208\188\209\131\208\178 v2", function(_, _, v2002)
        -- upvalues: v178 (ref), v263 (ref), v1999 (ref), v67 (ref), v669 (ref), v1997 (ref), v1998 (ref)
        if not v2002 or not v178.antiaim or not v263.AntiAim.tweaks:Get(8) then
            return v1999();
        elseif v263.AntiAim.defensive_aa.main:get() and rage.exploit:get() == 1 and not v67.functions.on_use_aa and not v67.functions.edge_yaw then
            return v1999();
        else
            if v669 < 3 then
                v1997:override("Always On");
                v1998 = true;
            else
                v1999();
            end;
            return;
        end;
    end);
end)();
(function()
    -- upvalues: l_ui_0 (ref), v260 (ref), v263 (ref), v669 (ref)
    local v2003 = {
        [267] = true, 
        [242] = true, 
        [261] = true, 
        [233] = true
    };
    local v2004 = l_ui_0.find("Aimbot", "Ragebot", "Selection", "Hit Chance");
    local v2005 = l_ui_0.find("Aimbot", "Ragebot", "Accuracy", "Auto Scope");
    local v2006 = false;
    local function v2007()
        -- upvalues: v2006 (ref), v2004 (ref), v2005 (ref)
        if v2006 then
            v2006 = false;
            v2004:override();
            v2005:override();
        end;
    end;
    local _ = {
        AWP = 233, 
        Scout = 267
    };
    v260:add("prediction", "very fast hitchance", function(_, v2010, v2011)
        -- upvalues: v263 (ref), v2007 (ref), v2003 (ref), v669 (ref), v2004 (ref), v2006 (ref), v2005 (ref)
        if not v2011 or not v263.Ragebot.hitchance.main:get() then
            return v2007();
        else
            local v2012 = v2010:get_player_weapon();
            if v2012 == nil then
                return v2007();
            else
                local v2013 = v2012:get_classid();
                if not v2003[v2013] then
                    return v2007();
                else
                    local v2014 = false;
                    local v2015 = false;
                    if v2013 == 261 or v2013 == 242 then
                        v2014 = v263.Ragebot.hitchance.weapons_ns:get("Auto");
                        v2015 = v263.Ragebot.hitchance.weapons_ia:get("Auto");
                    elseif v2013 == 233 then
                        v2014 = v263.Ragebot.hitchance.weapons_ns:get("AWP");
                        v2015 = v263.Ragebot.hitchance.weapons_ia:get("AWP");
                    elseif v2013 == 267 then
                        v2014 = v263.Ragebot.hitchance.weapons_ns:get("Scout");
                        v2015 = v263.Ragebot.hitchance.weapons_ia:get("Scout");
                    end;
                    if not v2014 and not v2015 then
                        return v2007();
                    else
                        if v263.Ragebot.hitchance.mode:get(2) and v669 < 3 and v2015 then
                            v2004:override(v263.Ragebot.hitchance.air:get());
                            v2006 = true;
                        else
                            v2004:override();
                            v2005:override();
                        end;
                        if v263.Ragebot.hitchance.mode:get(1) and v2010.m_bIsScoped == false and v2014 then
                            local v2016 = entity.get_threat();
                            if v2016 then
                                if v2016:get_origin():dist(v2010:get_origin()) / 5 > v263.Ragebot.hitchance.distance:get() then
                                    return v2007();
                                else
                                    v2006 = true;
                                    v2004:override(v263.Ragebot.hitchance.noscope:get());
                                    v2005:override(false);
                                end;
                            end;
                        end;
                        v2006 = true;
                        return;
                    end;
                end;
            end;
        end;
    end);
end)();
v1755 = nil;
v1756 = ffi.cast("uintptr_t**", utils.opcode_scan("engine.dll", "A1 ? ? ? ? 0F 28 C1 F3 0F 5C 80 ? ? ? ? F3 0F 11 45 ? A1 ? ? ? ? 56 85 C0 75 04 33 F6 EB 26 80 78 14 00 74 F6 8B 4D 08 33 D2 E8 ? ? ? ? 8B F0 85 F6", 1));
v1757 = ffi.typeof("        struct {\n            int64_t         unknown;\n            int64_t         steamID64;\n            char            szName[128];\n            int             userId;\n            char            szSteamID[20];\n            char            pad_0x00A8[0x10];\n            unsigned long   iSteamID;\n            char            szFriendsName[128];\n            bool            fakeplayer;\n            bool            ishltv;\n            unsigned int    customfiles[4];\n            unsigned char   filesdownloaded;\n        }\n    ");
v1758 = utils.get_vfunc(11, ffi.typeof("$*(__thiscall*)(void*, int, int*)", v1757));
v1759 = nil;
do
    local l_v1756_2, l_v1758_1, l_v1759_2, l_l_cl_updaterate_0_2, l_v1761_1, l_v1762_2, l_v1763_2 = v1756, v1758, v1759, l_cl_updaterate_0, v1761, v1762, v1763;
    l_l_cl_updaterate_0_2 = function(v2024)
        -- upvalues: l_v1756_2 (ref), l_v1758_1 (ref), l_v1759_2 (ref)
        local v2025 = entity.get_local_player();
        if not v2025 then
            return;
        else
            local v2026 = l_v1756_2[0][0];
            if not v2026 then
                return;
            else
                local v2027 = ffi.cast("void***", v2026 + 21184)[0];
                if not v2027 then
                    return;
                else
                    local v2028 = l_v1758_1(v2027, v2025:get_index() - 1, nil);
                    if not v2028 then
                        return;
                    else
                        local v2029 = ffi.string(v2028[0].szName);
                        if v2024 ~= v2029 and l_v1759_2 == nil then
                            l_v1759_2 = v2029;
                        end;
                        v2028[0].szName = ffi.new("char[128]", v2024);
                        return;
                    end;
                end;
            end;
        end;
    end;
    l_v1761_1 = v263.Modifications.clientside_nickname;
    l_v1762_2 = false;
    l_v1763_2 = function()
        -- upvalues: l_v1761_1 (ref), l_v1762_2 (ref), l_l_cl_updaterate_0_2 (ref), l_v1759_2 (ref)
        local v2030 = l_v1761_1.nick:get():sub(0, 32);
        l_v1761_1.nick:set(v2030);
        if not l_v1761_1.main:get() or #v2030 == 0 then
            if l_v1762_2 then
                l_v1762_2 = false;
                l_l_cl_updaterate_0_2(l_v1759_2 or panorama.MyPersonaAPI.GetName());
                l_v1759_2 = nil;
            end;
            return;
        else
            l_v1762_2 = true;
            l_l_cl_updaterate_0_2(v2030);
            return;
        end;
    end;
    l_v1761_1.main:RegisterCallback(l_v1763_2);
    l_v1761_1.nick:RegisterCallback(l_v1763_2);
    v260:add("round_prestart", "hanle name prestart", l_v1763_2);
    v260:add("player_connect_full", "hanle name connect", function(v2031, v2032)
        -- upvalues: v680 (ref), l_v1763_2 (ref)
        local v2033 = v680.GetPlayerForUserID(v2031.userid);
        if not v2033 then
            return;
        else
            if v2033 == v2032 then
                l_v1763_2();
            end;
            return;
        end;
    end);
    l_v1763_2();
    v260:add("destroy", "handle destroy name", function()
        -- upvalues: l_l_cl_updaterate_0_2 (ref)
        l_l_cl_updaterate_0_2(panorama.MyPersonaAPI.GetName());
    end);
end;
v1756 = nil;
v1756 = {};
v1757 = ffi.typeof("        struct {\n            char pad[92];\n            unsigned char min[4];\n            unsigned char max[4];\n            unsigned char colmin[4];\n            unsigned char colmax[4];\n            unsigned char tintmin[4];\n            unsigned char tintmax[4];\n        }\n    ");
v1758 = ffi.typeof("        struct {\n            char pad_0[0x16C];\n            $** data;\n            char pad_1[0x8];\n            int size;\n        }*\n    ", v1757);
v1759 = ffi.typeof("        struct {\n            float* base[24];\n            size_t size[24];\n        }\n    ");
l_cl_updaterate_0 = ffi.typeof("        struct {\n            char* buffer;\n            int capacity;\n            int grow_size;\n            int length;\n        }\n    ");
v1761 = ffi.typeof("        struct {\n            char pad_0[0x134];\n            $ name;\n        }\n    ", l_cl_updaterate_0);
v1762 = ffi.typeof("        struct {\n            void* prev;\n            void* next;\n\n            $* object;\n        }*\n    ", v1761);
v1763 = ffi.typeof("        struct {\n            char pad_0[0x30]; \n            int active_particles; // 48\n            char pad_1[0xC];\n            $ definition; // 64\n            char pad_2[0x4];\n            $ initializers; // 72\n            char pad_2[0x40];\n            int* parent;\n            char pad_3[0x50];\n            $ attributes;\n        }*\n    ", v1762, v1758, v1759);
v1764 = v37.rel_jmp("client.dll", "E8 ? ? ? ? C7 43 ? ? ? ? ? 8D BB ? ? ? ?");
local v2034 = v37.rel_jmp("client.dll", "E8 ? ? ? ? 85 F6 74 14");
local v2035 = {};
do
    local l_v1762_3, l_v1763_3, l_v2035_0 = v1762, v1763, v2035;
    v37.set("molotov 1", v1764, "void*(__fastcall*)(void*, void*)", function(v2039, v2040, v2041)
        -- upvalues: l_v2035_0 (ref)
        local v2042 = v2039(v2040, v2041);
        table.insert(l_v2035_0, ffi.cast("int*", v2042));
        return v2042;
    end);
    local v2043 = false;
    v37.set("molotov 2", v2034, "void(__fastcall*)(void*, void*)", function(v2044, v2045, v2046)
        -- upvalues: v2043 (ref), l_v2035_0 (ref)
        v2043 = true;
        for v2047, v2048 in ipairs(l_v2035_0) do
            if ffi.cast("int", v2048) == ffi.cast("int", v2045) then
                table.remove(l_v2035_0, v2047);
                break;
            end;
        end;
        v2044(v2045, v2046);
        v2043 = false;
    end);
    local function v2053(v2049, v2050, v2051)
        local v2052 = math.floor(v2051 / 4);
        return v2049.base[v2050] + v2049.size[v2050] * v2052 + bit.band(v2051, 3);
    end;
    local v2054 = {
        env_fire_tiny_b = true, 
        incgrenade_thrown_trail = true, 
        weapon_molotov_thrown = true, 
        weapon_molotov_fp = true, 
        weapon_molotov_held = true, 
        extinguish_fire = true, 
        explosion_molotov_air = true, 
        molotov_explosion = true, 
        molotov_groundfire_fallback2 = true, 
        molotov_groundfire_fallback = true, 
        molotov_groundfire_00HIGH = true, 
        molotov_groundfire_00MEDIUM = true, 
        molotov_groundfire = true
    };
    local v2055 = {
        extinguish_fire_swirl_smoke = true, 
        molotov_smoking_ground_child03_cheapo = true, 
        molotov_smoking_ground_child03 = true, 
        molotov_smoking_ground_child02_cheapo = true, 
        molotov_smoking_ground_child02 = true, 
        molotov_smoking_ground_child01 = true, 
        explosion_molotov_air_smoke = true
    };
    local _ = {
        molotov_groundfire_child_base8 = true, 
        molotov_groundfire_child_base = true
    };
    local function v2072(v2057, v2058)
        -- upvalues: l_v1763_3 (ref), l_v1762_3 (ref), v2054 (ref), v2055 (ref), v2053 (ref)
        local v2059 = ffi.cast(l_v1763_3, v2057);
        if v2059.active_particles == 0 then
            return;
        else
            local v2060 = ffi.cast(l_v1762_3, v2057[0] + 64);
            local v2061 = ffi.cast(l_v1762_3, v2057[0] + 64);
            local v2062 = ffi.cast("int*", v2057[0] + 136);
            while v2062[0] ~= 0 do
                v2060 = ffi.cast(l_v1762_3, v2062[0] + 64);
                v2062 = ffi.cast("int*", v2062[0] + 136);
            end;
            local v2063 = ffi.string(v2060.object.name.buffer);
            local v2064 = ffi.string(v2061.object.name.buffer);
            if v2054[v2063] == nil then
                return;
            elseif v2055[v2064] ~= nil then
                return;
            else
                local v2065 = #v2058;
                for v2066 = 0, v2059.initializers.size - 1 do
                    local v2067 = v2059.initializers.data[v2066][0];
                    if v2067 and v2067.colmin[0] ~= 0 then
                        local v2068 = v2058[v2066 % v2065 + 1];
                        v2067.min[0] = v2068.r;
                        v2067.min[1] = v2068.g;
                        v2067.min[2] = v2068.b;
                        v2067.max[0] = v2068.r;
                        v2067.max[1] = v2068.g;
                        v2067.max[2] = v2068.b;
                    end;
                end;
                for v2069 = 0, v2059.active_particles - 1 do
                    local v2070 = v2053(v2059.attributes, 6, v2069);
                    local v2071 = v2058[v2069 % v2065 + 1];
                    v2070[0] = v2071.r;
                    v2070[4] = v2071.g;
                    v2070[8] = v2071.b;
                end;
                return;
            end;
        end;
    end;
    local l_fire_color_0 = v263.Modifications.fire_color;
    local v2074 = {
        [1] = l_fire_color_0.color1, 
        [2] = l_fire_color_0.color2, 
        [3] = l_fire_color_0.color3, 
        [4] = l_fire_color_0.color4
    };
    l_fire_color_0.secret_slider:visibility(false);
    local function v2077()
        -- upvalues: l_fire_color_0 (ref), v2074 (ref)
        local v2075 = l_fire_color_0.secret_slider:get();
        for v2076 = 1, 4 do
            v2074[v2076]:visibility(v2076 <= v2075 and l_fire_color_0.main:get());
        end;
        l_fire_color_0.add_btn:disabled(v2075 == 4);
        l_fire_color_0.remove_btn:disabled(v2075 == 1);
    end;
    l_fire_color_0.main:set_callback(function()
        -- upvalues: l_fire_color_0 (ref), v2077 (ref)
        local v2078 = l_fire_color_0.main:get();
        l_fire_color_0.add_btn:visibility(v2078);
        l_fire_color_0.remove_btn:visibility(v2078);
        v2077();
    end, true);
    l_fire_color_0.add_btn:set_callback(function()
        -- upvalues: l_fire_color_0 (ref), v2077 (ref)
        l_fire_color_0.secret_slider:set(math.min(4, l_fire_color_0.secret_slider:get() + 1));
        v2077();
    end);
    l_fire_color_0.remove_btn:set_callback(function()
        -- upvalues: l_fire_color_0 (ref), v2077 (ref)
        l_fire_color_0.secret_slider:set(math.max(1, l_fire_color_0.secret_slider:get() - 1));
        v2077();
    end);
    v2077();
    local v2079 = nil;
    v2079 = materials.get_materials("flare", true);
    for _, v2081 in ipairs({
        [1] = "particle/fire_explosion_1/fire_explosion_1_oriented", 
        [2] = "particle/fire_explosion_1/fire_explosion_1_bright"
    }) do
        v2079[#v2079 + 1] = materials.get(v2081, true);
    end;
    local function v2085(v2082)
        -- upvalues: v2079 (ref)
        for _, v2084 in ipairs(v2079) do
            v2084:var_flag(2, v2082);
        end;
    end;
    v2085(true);
    v1756.on_render = function()
        -- upvalues: l_fire_color_0 (ref), v2043 (ref), v2085 (ref), v2074 (ref), l_v2035_0 (ref), v2072 (ref)
        if not l_fire_color_0.main:get() then
            return;
        elseif v2043 then
            return;
        else
            v2085(true);
            local v2086 = {};
            for v2087 = 1, l_fire_color_0.secret_slider:get() do
                local v2088 = v2074[v2087]:get();
                v2086[v2087] = {
                    r = v2088.r / 255, 
                    g = v2088.g / 255, 
                    b = v2088.b / 255
                };
            end;
            for v2089, v2090 in ipairs(l_v2035_0) do
                if v2090[0] < 10000 then
                    table.remove(l_v2035_0, v2089);
                    break;
                else
                    v2072(v2090, v2086);
                end;
            end;
            return;
        end;
    end;
    v1756.on_shutdown = function()
        -- upvalues: v2085 (ref)
        v2085(false);
    end;
    v260:add("destroy", "molotov destroy", v1756.on_shutdown);
    v260:add("post_render", "molotov render", v1756.on_render);
end;
v1757 = nil;
v260:add("prediction", "nade throw fix", function(_, v2092)
    -- upvalues: v263 (ref)
    if not v263.Ragebot.nade_throw_fix:get() or not v2092 then
        return;
    else
        local v2093 = v2092:get_player_weapon();
        if not v2093 then
            return;
        elseif v2093:get_weapon_info().weapon_type ~= 9 then
            return;
        else
            rage.exploit:allow_defensive(false);
            return;
        end;
    end;
end);
v1758 = function()
    -- upvalues: v260 (ref)
    table.foreach(v260.shutdowns, function(_, v2095)
        v2095();
    end);
end;
v1759 = false;
do
    local l_v1758_2, l_v1759_3, l_l_cl_updaterate_0_3 = v1758, v1759, l_cl_updaterate_0;
    cvar.exit:set_callback(function()
        -- upvalues: l_v1759_3 (ref), l_v1758_2 (ref)
        if not l_v1759_3 then
            l_v1758_2();
            l_v1759_3 = true;
            utils.execute_after(0.5, function()
                utils.console_exec("exit");
            end);
            return false;
        else
            return;
        end;
    end);
    l_l_cl_updaterate_0_3 = false;
    cvar.quit:set_callback(function()
        -- upvalues: l_l_cl_updaterate_0_3 (ref), l_v1758_2 (ref)
        if not l_l_cl_updaterate_0_3 then
            l_v1758_2();
            l_l_cl_updaterate_0_3 = true;
            utils.execute_after(0.5, function()
                utils.console_exec("quit");
            end);
            return false;
        else
            return;
        end;
    end);
end;
v1758 = 0;
v1759 = color();
l_cl_updaterate_0 = {
    [1] = "\240\159\152\142", 
    [2] = "\240\159\152\141", 
    [3] = "\240\159\152\137", 
    [4] = "\240\159\153\131", 
    [5] = "\240\159\152\137", 
    [6] = "\240\159\165\176", 
    [7] = "\240\159\153\131", 
    [8] = "\240\159\152\137", 
    [9] = "\240\159\164\169", 
    [10] = "\240\159\152\152", 
    [11] = "\240\159\152\139", 
    [12] = "\240\159\164\170", 
    [13] = "\240\159\152\156", 
    [14] = "\240\159\152\155", 
    [15] = "\240\159\164\160"
};
v1761 = l_cl_updaterate_0[globals.tickcount % #l_cl_updaterate_0 + 1];
v1762 = nil;
v1763 = nil;
v1764 = render.get_scale(1);
v2034 = {
    [1] = 19, 
    [2] = 16, 
    [0.75] = 15, 
    [1.25] = 18, 
    [1.5] = 17, 
    [1.75] = 16
};
l_ui_0.sidebar("\208\176\209\129\208\184\208\180\208\186\208\176", "\240\159\167\172");
v2035 = false;
events.render:set(function()
    -- upvalues: l_ui_0 (ref), v2035 (ref), v1463 (ref), v1762 (ref), v1763 (ref), v1764 (ref), v479 (ref), v1759 (ref), v2034 (ref), v263 (ref), v488 (ref), v67 (ref)
    if l_ui_0.get_alpha() == 0 and not v2035 then
        return;
    else
        v2035 = true;
        local v2099 = l_ui_0.get_style("Link Active");
        local v2100 = l_ui_0.get_style("Sidebar Text");
        local v2101 = l_ui_0.get_style("Active Text");
        local v2102 = "AcidTech V4 ";
        local v2103 = nil;
        local v2104 = #v2102 + 1;
        local v2105 = "";
        local v2106 = nil;
        for v2107 = 1, v2104 do
            local v2108 = v2102:sub(v2107, v2107);
            local v2109 = (v2107 - 1) / v2104;
            local v2110 = v2099:lerp(v2101, (v1463(v2109 * 0.8, 0.8)));
            if v2107 == 1 then
                v2106 = v2110;
            end;
            v2105 = v2105 .. string.format("\a%s%s", v2110:to_hex(), v2108);
        end;
        l_ui_0.sidebar(v2105, "\240\159\167\172");
        v2102 = render.get_scale(1);
        if v2099 ~= v1762 or v2101 ~= v1763 or v2102 ~= v1764 then
            v479 = v2099;
            v1759 = v2100;
            v1762 = v2099;
            v1763 = v2101;
            v1764 = v2102;
            v2103 = string.rep(" ", v2034[v2102] or 1);
            v2104 = " \a" .. v479:to_hex();
            v2105 = "\a" .. v479:to_hex();
            v2106 = "\a" .. v1759:to_hex();
            v263.Configs.export_cfg:name(v2104 .. l_ui_0.get_icon("file-export") .. v2106 .. "  Export ");
            v263.Configs.import_cfg:name(v2104 .. l_ui_0.get_icon("file-import") .. v2106 .. "  Import ");
            v263.Configs.def_cfg:name(v2104 .. l_ui_0.get_icon("circle-check") .. v2106 .. "  Default ");
            v263.AntiAim.preset_export:name(v2105 .. l_ui_0.get_icon("file-export"));
            v263.AntiAim.preset_import:name(v2105 .. l_ui_0.get_icon("file-import"));
            v263.AntiAim.preset_save:name(v2105 .. l_ui_0.get_icon("floppy-disk"));
            v263.AntiAim.preset_load:name(v2103 .. "Load" .. v2103);
            v263.AntiAim.preset_delete:name(v2105 .. l_ui_0.get_icon("trash-can"));
            v263.Global.discord:name(v2104 .. l_ui_0.get_icon("link") .. v2106 .. "  Get Role  ");
            v263.Global.discord1:name(v2104 .. l_ui_0.get_icon("discord") .. v2106 .. "  Join Discord Server ");
            v263.Global.tedasxt0ds13:name(v2104 .. l_ui_0.get_icon("telegram") .. v2106 .. "  Telegram  ");
            v263.Global.tedrwrwrasxt0ds13:name(v2104 .. l_ui_0.get_icon("youtube") .. v2106 .. "  Youtube ");
            v263.AntiAim.automatic_channel_kitty:name(v2104 .. l_ui_0.get_icon("youtube") .. v2106 .. "  Youtube ");
            v263.Global.tedrwrwrasxt0ds14:name(v2104 .. l_ui_0.get_icon("cart-shopping") .. v2106 .. "  NL Config ");
            v263.Global.text0ds13:name(v2104 .. l_ui_0.get_icon("cart-plus") .. v2106 .. "  AT Beta  ");
            v263.AntiAim.automatic_text_kitty:name(string.format("\a%sCredits: \a%s", v2101:to_hex(), v488(v2099, v2101, "badcode")));
            v263.Global.text0:name(string.format("\a%s%s  Welcome back, \a%s", v2101:to_hex(), l_ui_0.get_icon("hand-wave"), v488(v2099, v2101, v67.username)));
            v263.Global.text1:name(string.format("\a%s%s  Last Update: \a%s", v2101:to_hex(), l_ui_0.get_icon("clock"), v488(v2099, v2101, v67.update_date)));
            v263.Global.text2:name(string.format("\a%s%s  Current Version: \a%s", v2101:to_hex(), l_ui_0.get_icon("tag"), v488(v2099, v2101, v67.build1)));
        end;
        return;
    end;
end);
