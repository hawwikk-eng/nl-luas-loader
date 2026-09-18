_DEBUG = _IS_IN_MARKET;
local l_clipboard_0 = select(2, pcall(require, "neverlose/clipboard"));
local l_gradient_0 = select(2, pcall(require, "neverlose/gradient"));
local _ = select(2, pcall(require, "neverlose/md5"));
local l_inspect_0 = select(2, pcall(require, "neverlose/inspect"));
local l_base64_0_status, l_base64_0 = pcall(require, "neverlose/base64");
local l_AddSphereOverlay_0_tmp_status, l_AddSphereOverlay_0_tmp = pcall(require, "neverlose/debugoverlay");
local l_AddSphereOverlay_0 = l_AddSphereOverlay_0_tmp_status and l_AddSphereOverlay_0_tmp.AddSphereOverlay or nil;
local v7 = {};
local v8 = {};
local v9 = {};
local v10 = {};
local v11 = {};
local v12 = {};
local v13 = {};
local v14 = {};
local v15 = {};
local v16 = {};
local v17 = {};
local v18 = {};
local v19 = {};
local v20 = {};
local v21 = {};
local v22 = {};
local v23 = {};
local v24 = {};
local v25 = {};
local v26 = {};
local v27 = {};
local v28 = {};
local v29 = {};
local v30 = {};
local v31 = {};
local v32 = {};
local v33 = {};
local v34 = {};
local _ = {};
local v36 = {};
local v37 = {};
local v38 = {};
local v39 = {};
local v40 = true;
local v41 = false;
v14.last_update = "14th October 2024 17:38pm";
v14.discord_role = v40 and "beta" or "live";
v14.discord_token = "armTiNqB1pkx2450U9CYcBXP2J8gTxkk";
local v42 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
local function v45(v43, v44)
    return v43 * 2 ^ v44;
end;
local function v48(v46, v47)
    return math.floor(v46 / v47);
end;
encode_base64 = function(v49)
    -- upvalues: v45 (ref), v42 (ref), v48 (ref)
    local v50 = "";
    local v51 = "";
    local _ = 0;
    local v53 = 1;
    local v54 = #v49;
    while v53 <= v54 do
        local v55 = string.byte(v49, v53);
        local v56 = v53 + 1 <= v54 and string.byte(v49, v53 + 1) or 0;
        local v57 = v53 + 2 <= v54 and string.byte(v49, v53 + 2) or 0;
        v53 = v53 + 3;
        local v58 = v45(v55, 16) + v45(v56, 8) + v57;
        v50 = v50 .. v42:sub(v48(v58, 262144) % 64 + 1, v48(v58, 262144) % 64 + 1) .. v42:sub(v48(v58, 4096) % 64 + 1, v48(v58, 4096) % 64 + 1) .. v42:sub(v48(v58, 64) % 64 + 1, v48(v58, 64) % 64 + 1) .. v42:sub(v58 % 64 + 1, v58 % 64 + 1);
        if v54 < v53 then
            v51 = v51 .. string.rep("=", 3 - v54 % 3);
        end;
    end;
    return v50 .. v51;
end;
decode_base64 = function(v59)
    -- upvalues: v45 (ref), v48 (ref)
    local v60 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    local v61 = "";
    local _ = 0;
    local v63 = 1;
    local v64 = #v59;
    while v63 <= v64 do
        local v65 = v60:find(v59:sub(v63, v63)) - 1;
        local v66 = v60:find(v59:sub(v63 + 1, v63 + 1)) - 1;
        local v67 = v60:find(v59:sub(v63 + 2, v63 + 2)) - 1;
        local v68 = v60:find(v59:sub(v63 + 3, v63 + 3)) - 1;
        v63 = v63 + 4;
        local v69 = v45(v65, 18) + v45(v66, 12) + v45(v67, 6) + v68;
        v61 = v61 .. string.char(v48(v69, 65536) % 256) .. string.char(v48(v69, 256) % 256) .. string.char(v69 % 256);
    end;
    return v61;
end;
if not l_base64_0 then
    l_base64_0 = { encode = encode_base64, decode = decode_base64 };
end;
xor_encrypt_decrypt = function(v70, v71)
    local v72 = "";
    for v73 = 1, #v70 do
        local v74 = v70:byte(v73);
        local v75 = v71:byte((v73 - 1) % #v71 + 1);
        v72 = v72 .. string.char(bit.bxor(v74, v75));
    end;
    return v72;
end;
local function _(v76, v77)
    local v78 = xor_encrypt_decrypt(v76, v77);
    return encode_base64(v78);
end;
local function _(v80, v81)
    local v82 = decode_base64(v80);
    return xor_encrypt_decrypt(v82, v81);
end;
local l_hashing_0 = select(2, pcall(require, "neverlose/hashing"));
local function _(v85)
    local v86 = "";
    for v87 = 1, #v85 do
        v86 = v86 .. string.char((string.byte(v85, v87) + 5) % 256);
    end;
    return v86;
end;
local function v92(v89)
    local v90 = "";
    for v91 = 1, #v89 do
        v90 = v90 .. string.char((string.byte(v89, v91) - 5 + 256) % 256);
    end;
    return v90;
end;
generate_verification_code = function(v93, v94)
    -- upvalues: l_hashing_0 (ref)
    local v95 = v93 .. ":" .. v94;
    local v96 = l_hashing_0.sha256(v95);
    print("Data to hash: " .. v95);
    print("SHA-256 Hash: " .. v96);
    return v96;
end;
local v97 = bit.lshift(1, 0);
local v98 = bit.lshift(1, 1);
local _ = bit.lshift(1, 3);
local _ = bit.lshift(1, 4);
local _ = bit.lshift(1, 5);
local _ = bit.lshift(1, 6);
local _ = bit.lshift(1, 7);
local _ = bit.lshift(1, 8);
local _ = bit.lshift(1, 9);
local _ = bit.lshift(1, 10);
v12.vec3_t = ffi.typeof("struct { float x, y, z; }");
v12.native_getCollideable = utils.get_vfunc(3, "void*(__thiscall*)(void* ecx)");
v12.native_getMins = utils.get_vfunc(1, "$*(__thiscall*)(void* ecx)", v12.vec3_t);
v12.native_getMaxs = utils.get_vfunc(2, "$*(__thiscall*)(void* ecx)", v12.vec3_t);
math.diff = function(v107, v108)
    return math.abs(v107 - v108);
end;
getmetatable(color()).override = function(v109, v110, v111)
    local v112 = v109:clone();
    v112[v110] = v111;
    return v112;
end;
math.static_lerp = function(v113, v114, v115)
    return v113 + (v114 - v113) * v115;
end;
math.lerp = function(v116, v117, v118)
    if v116 == v117 then
        return v117;
    else
        v118 = v118 * (globals.frametime * 170);
        local v119 = v116 + (v117 - v116) * v118;
        if math.abs(v119 - v117) < 0.01 then
            return v117;
        else
            return v119;
        end;
    end;
end;
v14.exclude_random = function(v120, v121, v122)
    local v123 = math.random(v121, v120 - 1);
    local v124 = math.random(v120 + 1, v122);
    return math.random(0, 1) == 1 and v124 or v123;
end;
v14.username = common.get_username();
v14.steamid = panorama.MyPersonaAPI.GetXuid();
v14.steam_name = panorama.MyPersonaAPI.GetName();
v14.screen_size = render.screen_size();
v14.screen_center = v14.screen_size / 2;
local v125 = vector(2560, 1440);
v14.dpi_scale = v14.screen_size / v125;
if ({
    robertica = true, 
    Netflix234 = true, 
    ceenai = true, 
    david2020 = true, 
    xRazor = true, 
    Andreic2001 = true
})[v14.username] then
    error("blacklisted");
    return;
else
    v20.list = {};
    v20.get = function(v126)
        -- upvalues: v20 (ref)
        return v20.list[v126];
    end;
    v20.parse = function()
        -- upvalues: v20 (ref)
        v20.list = {};
        local v127 = ui.get_binds();
        for v128 = 1, #v127 do
            local v129 = v127[v128];
            if v129.active then
                v20.list[v129.name] = v129.value;
            end;
        end;
    end;
    v125 = function(v130, v131, v132)
        -- upvalues: l_inspect_0 (ref)
        return function(...)
            -- upvalues: v132 (ref), v130 (ref), v131 (ref), l_inspect_0 (ref)
            local l_status_0, l_result_0 = pcall(v132, ...);
            if not l_status_0 then
                local v135 = "safe call failed [" .. v130 .. "] -> " .. l_result_0;
                if v131 or _DEBUG then
                    print_raw(v135, "\npayload->", l_inspect_0({
                        ...
                    }));
                end;
                return false, v135;
            else
                return l_result_0, l_status_0;
            end;
        end;
    end;
    v15.black = color(0, 255);
    v15.white = color(255);
    v13.shared_data = {
        team = 0, 
        throw_time = 0, 
        pin_pulled = false, 
        movetype = -1, 
        able_to_render = false, 
        scoped = false
    };
    v13.collect_shared = function()
        -- upvalues: v13 (ref)
        local v136 = entity.get_local_player();
        if v136 == nil then
            return;
        else
            local v137 = v136:get_player_weapon();
            if v137 == nil then
                return;
            else
                v13.shared_data.scoped = v136.m_bIsScoped;
                v13.shared_data.movetype = v136.m_MoveType;
                v13.shared_data.pin_pulled = v137.m_bPinPulled;
                v13.shared_data.throw_time = v137.m_fThrowTime;
                v13.shared_data.team = v136.m_iTeamNum;
                v13.shared_data.velocity = v136.m_vecVelocity;
                return;
            end;
        end;
    end;
    v13.collect_render_shared_info = function()
        -- upvalues: v13 (ref)
        local v138 = entity.get_local_player();
        v13.shared_data.able_to_render = false;
        if v138 == nil then
            return;
        elseif not v138:is_alive() then
            return;
        else
            v13.shared_data.able_to_render = true;
            return;
        end;
    end;
    v14.with_icon = function(v139, v140, v141)
        local v142 = ui.get_icon(v139);
        if v141 ~= nil then
            v142 = "\a" .. (type(v141) == "string" and v141 or v141:to_hex()) .. v142 .. "\aDEFAULT";
        end;
        return v142 .. " " .. v140;
    end;
    v14.hitgroups = {
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
    v14.wpn2act = {
        inferno = "Burned", 
        knife = "Knifed", 
        hegrenade = "Naded"
    };
    v14.branded_printing = function(v143)
        -- upvalues: v8 (ref)
        local l_accent_0 = v8.elements.visuals.accent;
        local v145 = string.format("[%s] %s", "\a" .. l_accent_0:to_hex() .. "Lua\aDEFAULTSense", v143);
        print_raw(v145);
        print_dev(v145);
    end;
    v8.elements = {};
    v8.refs = {};
    v8.global_update_callback = v125("global_update", true, function()
        -- upvalues: v8 (ref)
        for _, v147 in pairs(v8.refs) do
            for _, v149 in pairs(v147) do
                if v149 ~= nil and v149.condition then
                    v149.update_value(v149.ref);
                    v149.ref:visibility(v149.condition() or false);
                end;
            end;
        end;
    end);
    v8.reverse_tbl = function(v150)
        local l_v150_0 = v150;
        local _ = #l_v150_0;
        local v153 = {};
        for v154, v155 in pairs(l_v150_0) do
            if v154 ~= "_len" then
                v153[v155] = true;
            end;
        end;
        return v153;
    end;
    v8.new_element = function(v156, v157, v158, v159, v160)
        -- upvalues: v8 (ref)
        if v158 == nil then
            v158 = true;
        end;
        if type(v159) ~= "userdata" then
            error("Failed to create " .. v157 .. ": " .. type(v159));
            return;
        else
            if v8.refs[v156] == nil then
                v8.refs[v156] = {};
                v8.elements[v156] = {};
            end;
            if v8.refs[v156][v157] ~= nil then
                error(string.format("[UI_HANDLER] Element already exists: %s->%s", v156, v157));
            end;
            v8.refs[v156][v157] = {
                ref = v159, 
                condition = v160, 
                config = v158
            };
            local function v170(v161)
                -- upvalues: v8 (ref), v156 (ref), v157 (ref)
                local v162 = v161:type();
                local v163 = v161:get();
                if v162 == "selectable" then
                    local v164 = v8.reverse_tbl(v163);
                    v8.elements[v156][v157] = v164;
                    v8.elements[v156][v157]._len = value_list_num;
                elseif v162 == "listable" then
                    local v165 = v161:list();
                    local v166 = #v165;
                    local v167 = {};
                    for v168, v169 in ipairs(v163) do
                        v167[v165[v169]] = v168;
                    end;
                    v8.elements[v156][v157] = v167;
                    v8.elements[v156][v157]._len = v166;
                else
                    v8.elements[v156][v157] = v163;
                end;
            end;
            v8.refs[v156][v157].update_value = v170;
            v159:set_callback(v170, true);
            v159:set_callback(v8.global_update_callback);
            return v159;
        end;
    end;
    v8.groups = {};
    v7 = {
        __index = function(_, v172, _)
            -- upvalues: v8 (ref)
            return function(v174, ...)
                -- upvalues: v8 (ref), v172 (ref)
                local v175 = nil;
                if not v174.__name or not v174.__name:lower():find("sol.lua") then
                    local v176 = string.format("%s%s", v174[2] == nil and "unk" or v174[2], v174[1]);
                    v175 = v8.groups[v176];
                    if v175 == nil then
                        if v174[2] ~= nil then
                            v8.groups[v176] = ui.create(v174[1], v174[2]);
                        else
                            v8.groups[v176] = ui.create(v174[1]);
                        end;
                        v175 = v8.groups[v176];
                    end;
                else
                    v175 = v174;
                end;
                local v177 = v175[v172](v175, ...);
                return function(v178, v179, v180, v181)
                    -- upvalues: v8 (ref), v177 (ref)
                    v8.new_element(v178, v179, v180, v177, v181);
                    return function(v182)
                        -- upvalues: v177 (ref)
                        if v182 ~= nil then
                            v182(v177:create());
                        end;
                        return v177;
                    end;
                end;
            end;
        end
    };
    v7 = setmetatable(v7, v7);
    v9.defensive_state = 0;
    v9.update_defensive_state = function(_)
        -- upvalues: v9 (ref)
        if utils.net_channel() == nil then
            return;
        else
            local v184 = entity.get_local_player();
            if v184 == nil then
                return;
            else
                local l_tickcount_0 = globals.tickcount;
                local v186 = v184:get_simulation_time();
                local v187 = to_ticks(v186.current - v186.old);
                if v187 < 0 then
                    v9.defensive_state = l_tickcount_0 + math.abs(v187);
                end;
                return;
            end;
        end;
    end;
    local v189 = {
        prev_simulation_time = 0, 
        diff = 0, 
        defensive = false, 
        def_tk = 0
    };
    local function v191(v190)
        return math.floor(0.5 + v190 / globals.tickinterval);
    end;
    sim_diff = function()
        -- upvalues: v191 (ref), v189 (ref)
        local v192 = v191(entity.get_local_player().m_flSimulationTime);
        local v193 = v192 - v189.prev_simulation_time;
        v189.prev_simulation_time = v192;
        diff_sim = v193;
        return diff_sim;
    end;
    local function _(v194)
        return math.floor(0.5 + v194 / globals.tickinterval);
    end;
    v10.register = function(v196, v197, v198)
        -- upvalues: v125 (ref)
        events[v196]:set(v125(v197, v196 ~= "shutdown", v198));
    end;
    local v199 = 0;
    local v200 = nil;
    v10.register("post_render", "finish_clean", function()
        -- upvalues: v200 (ref)
        local v201 = entity.get_local_player();
        if v201 == nil or not v201:is_alive() then
            return;
        else
            v200 = globals.commandack;
            return;
        end;
    end);
    v9.reset = function()
        -- upvalues: v9 (ref)
        local l_v9_0 = v9;
        local l_v9_1 = v9;
        local v204 = nil;
        l_v9_1.tickbase_diff = nil;
        l_v9_0.tickbase_max = v204;
        v9.old_tick_count = 0;
        v9.cur = 0;
    end;
    v9.reset();
    v9.current_cmd = 0;
    local function v206(v205)
        -- upvalues: v9 (ref)
        v9.current_cmd = v205.command_number;
    end;
    v9.setup_defensive_data = function(v207)
        -- upvalues: v9 (ref)
        if v207.command_number == v9.current_cmd + 1 then
            v9.current_cmd = 0;
            local l_m_nTickBase_0 = entity.get_local_player().m_nTickBase;
            if v9.tickbase_max ~= nil then
                v9.tickbase_diff = l_m_nTickBase_0 - v9.tickbase_max;
            end;
            v9.tickbase_max = math.max(l_m_nTickBase_0, v9.tickbase_max or 0);
        end;
    end;
    v9.is_defensive2 = function()
        -- upvalues: v200 (ref), v199 (ref), v189 (ref), v11 (ref), v9 (ref)
        local v209 = entity.get_local_player();
        if v209 == nil or not v209:is_alive() or v200 ~= globals.commandack then
            return;
        else
            local v210 = v209.m_nTickBase or 0;
            if v199 ~= nil then
                v189.diff = v210 - v199;
                if math.abs(v210 - v199) > 64 then
                    v199 = 0;
                end;
            end;
            v199 = math.max(v210, v199 or 0);
            if v11.get_value("hideshots") and not v11.get_value("hideshots_config") == "Break LC" then
                return false;
            else
                return v9.tickbase_diff ~= nil and v9.tickbase_diff <= -1 and v9.tickbase_diff >= -14;
            end;
        end;
    end;
    local v211 = 0;
    v9.is_defensive = function()
        -- upvalues: v211 (ref)
        local v212 = entity.get_local_player();
        local l_m_nTickBase_1 = v212.m_nTickBase;
        if v212 == nil or not v212:is_alive() then
            return;
        else
            if math.abs(l_m_nTickBase_1 - v211) > 64 then
                v211 = 0;
            end;
            local v214 = 0;
            if v211 < l_m_nTickBase_1 then
                v211 = l_m_nTickBase_1;
            elseif l_m_nTickBase_1 < v211 then
                v214 = math.min(14, math.max(0, v211 - l_m_nTickBase_1 - 1));
            end;
            return v214 > 1;
        end;
    end;
    v7.tabs = {};
    v7.tabs.homepage = ui.create(v14.with_icon("house", "Homepage", "{Link Active}"), "Homepage", 2);
    v7.tabs.homepage2 = ui.create(v14.with_icon("house", "Homepage", "{Link Active}"), "LUASENSE\t", 1);
    v7.tabs.homepage3 = ui.create(v14.with_icon("house", "Homepage", "{Link Active}"), "RECOMMENDATIONS\t\t\t", 2);
    v7.tabs.verify = ui.create(v14.with_icon("house", "Homepage", "{Link Active}"), "VERIFY\t\t", 2);
    v7.tabs.antiaim_misc = ui.create(v14.with_icon("shield", "Anti-Aim", "{Link Active}"), "Helpers", 1);
    v7.tabs.antiaim_builder_choose = ui.create(v14.with_icon("shield", "Anti-Aim", "{Link Active}"), v14.with_icon("stars", "Presets", "{Link Active}"), 1);
    v7.tabs.antiaim_main = ui.create(v14.with_icon("shield", "Anti-Aim", "{Link Active}"), "Main", 1);
    v7.tabs.antiaim_builder_list = ui.create(v14.with_icon("shield", "Anti-Aim", "{Link Active}"), "Builders", 2);
    v7.tabs.antiaim_builder = ui.create(v14.with_icon("shield", "Anti-Aim", "{Link Active}"), "Builder", 2);
    v7.tabs.antiaim_defensive = ui.create(v14.with_icon("shield", "Anti-Aim", "{Link Active}"), "Defensive Builder", 2);
    v7.tabs.visuals_main_select = ui.create(v14.with_icon("palette", "Visuals", "{Link Active}"), "Select");
    v7.tabs.visuals_main = ui.create(v14.with_icon("palette", "Visuals", "{Link Active}"), "Main");
    v7.tabs.visuals_onscreen = ui.create(v14.with_icon("palette", "Visuals", "{Link Active}"), "On-Screen");
    v7.tabs.visuals_misc = ui.create(v14.with_icon("palette", "Visuals", "{Link Active}"), "Misc");
    v7.tabs.configs = ui.create(v14.with_icon("palette", "Visuals", "{Link Active}"), "config system", 1);
    v7.tabs.misc = ui.create(v14.with_icon("palette", "Visuals", "{Link Active}"), "Main", 2);
    v8.configs = {};
    db.luasense_old_configs = db.luasense_old_configs or {};
    v8.configs.configs_db = db.luasense_old_configs;
    v8.configs.parse_json_tooltips = function()
        -- upvalues: v8 (ref), l_clipboard_0 (ref)
        local v220 = {};
        for v221, v222 in pairs(v8.refs) do
            local v223 = {};
            for v224, _ in pairs(v222) do
                v223[v224] = v8.refs[v221][v224].ref:tooltip();
            end;
            v220[v221] = v223;
        end;
        if l_clipboard_0 then
            l_clipboard_0.set(json.stringify(v220));
        end;
    end;
    v8.configs.apply_tooltips = function(v226)
        -- upvalues: v8 (ref)
        for v227, v228 in pairs(v226) do
            for v229, v230 in pairs(v228) do
                if v8.refs[v227] and v8.refs[v227][v229] then
                    v8.refs[v227][v229].ref:tooltip(v230);
                end;
            end;
        end;
    end;
    v8.configs.parse = function()
        local v231 = {};
        for v232, v233 in pairs(v8.refs) do
            local v234 = {};
            for v235, v236 in pairs(v233) do
                if v236.config then
                    local v238 = v236.ref:get();
                    if type(v238) == "userdata" then
                        local v240 = getmetatable(v238);
                        if v240 and v240.__name == "sol.ImColor" then
                            v238 = v238:to_hex();
                        end;
                    end;
                    v234[v235] = v238;
                end;
            end;
            v231[v232] = v234;
        end;
        return v231;
    end;
    v8.configs.load = function(v240, v241)
        -- upvalues: v8 (ref), v17 (ref)
        if v241 then
            for _, v243 in pairs(v8.refs) do
                for _, v245 in pairs(v243) do
                    if v245.config then
                        v245.ref:reset();
                        v245.update_value(v245.ref);
                    end;
                end;
            end;
        end;
        for v246, v247 in pairs(v240) do
            do
                local l_v246_0 = v246;
                if v8.refs[l_v246_0] ~= nil then
                    for v249, v250 in pairs(v247) do
                        do
                            local l_v249_0, l_v250_0 = v249, v250;
                            if v8.refs[l_v246_0][l_v249_0] ~= nil then
                                pcall(function()
                                    -- upvalues: l_v250_0 (ref), v8 (ref), l_v246_0 (ref), l_v249_0 (ref)
                                    if type(l_v250_0) == "string" and l_v250_0:match("^#?%x%x%x%x%x%x%x%x$") then
                                        local v253 = color(l_v250_0);
                                        v8.refs[l_v246_0][l_v249_0].ref:set(v253);
                                    else
                                        v8.refs[l_v246_0][l_v249_0].ref:set(l_v250_0);
                                    end;
                                    v8.refs[l_v246_0][l_v249_0].update_value(v8.refs[l_v246_0][l_v249_0].ref);
                                end);
                            end;
                        end;
                    end;
                end;
            end;
        end;
        v8.global_update_callback();
        v17.adjust();
    end;
    v17.database = db.luasense_draggable or {};
    v17.adjust = function()
        -- upvalues: v14 (ref), v17 (ref)
        local v254 = vector(2560, 1440);
        local v255 = v14.screen_size / v254;
        for _, v257 in pairs(v17.items) do
            v17.database[v257 .. "_pos_x"] = v17.database[v257 .. "_pos_x"] * v255.x;
            v17.database[v257 .. "_pos_x"] = v17.database[v257 .. "_pos_x"] * v255.y;
        end;
    end;
    v17.in_bounds = function(v258, v259)
        local v260 = ui.get_mouse_position();
        return v260.x >= v258.x and v260.x <= v259.x and v260.y >= v258.y and v260.y <= v259.y;
    end;
    v7.visual_list = {
        v14.with_icon("circle", " Visuals", "{Link Active}"), 
        v14.with_icon("circle", " Misc", "{Link Active}")
    };
    v7.list(v7.tabs.visuals_main_select, "", v7.visual_list)("aa", "active_misc_visual");
    v7.is_active_check = false;
    v10.register("render", "active_misc_visual", function(_)
        -- upvalues: v8 (ref), v7 (ref), v14 (ref)
        if v8.elements.aa.active_misc_visual == 1 then
            v7.is_active_check = false;
            v8.refs.aa.active_misc_visual.ref:update(v14.with_icon("circle-check", " Visuals", "{Link Active}"), v14.with_icon("circle", " Misc", "{Link Active}"));
        elseif v8.elements.aa.active_misc_visual == 2 then
            v8.refs.aa.active_misc_visual.ref:update(v14.with_icon("circle", " Visuals", "{Link Active}"), v14.with_icon("circle-check", " Misc", "{Link Active}"));
        end;
    end);
    v7.color_picker(v7.tabs.visuals_main, v14.with_icon("palette", "Accent", "{Link Active}"), color("96C83CFF"))("visuals", "accent", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 2;
    end);
    v7.combo(v7.tabs.visuals_main, v14.with_icon("location-dot", "Watermark position", "{Link Active}"), {
        [1] = "Bottom", 
        [2] = "Left", 
        [3] = "Right", 
        [4] = "Custom"
    })("visuals", "watermark_position", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 2;
    end);
    v7.switch(v7.tabs.visuals_misc, v14.with_icon("crosshairs", "Aimbot logs", "{Link Active}"))("visuals", "aimbot_logs", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 2;
    end);
    v7.switch(v7.tabs.visuals_onscreen, v14.with_icon("star", "R8 Helper", "{Link Active}"))("visuals", "r8_help", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 2;
    end);
    v7.switch(v7.tabs.visuals_onscreen, v14.with_icon("plus", "Kibit hitmarker", "{Link Active}"))("visuals", "plus_hitmarker", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 2;
    end)(function(v262)
        -- upvalues: v7 (ref)
        v7.color_picker(v262, "Color", color(88, 255, 209, 255))("visuals", "plus_hitmarker_color", true)();
    end);
    local l_world_to_screen_0 = render.world_to_screen;
    local l_rect_0 = render.rect;
    local l_screen_size_0 = render.screen_size;
    local _ = ui.find;
    local v267 = 0.5;
    local v268 = 1;
    local v269 = {};
    local function v278()
        -- upvalues: v8 (ref), v269 (ref), v267 (ref), l_world_to_screen_0 (ref), l_screen_size_0 (ref), l_rect_0 (ref)
        if not v8.elements.visuals.plus_hitmarker then
            return;
        else
            for v270, v271 in pairs(v269) do
                if v271.FadeTime <= 0 then
                    v269[v270] = nil;
                else
                    v271.WaitTime = v271.WaitTime - globals.frametime;
                    if v271.WaitTime <= 0 then
                        v271.FadeTime = v271.FadeTime - 1 / v267 * globals.frametime;
                    end;
                    if v271.Position.x ~= nil and v271.Position.y ~= nil and v271.Position.z ~= nil and v271.Reason == nil then
                        local v272 = l_world_to_screen_0(vector(v271.Position.x, v271.Position.y, v271.Position.z));
                        if v272 ~= nil then
                            local l_x_0 = v272.x;
                            local l_y_0 = v272.y;
                            local v275 = l_screen_size_0();
                            local l_plus_hitmarker_color_0 = v8.elements.visuals.plus_hitmarker_color;
                            local v277 = l_plus_hitmarker_color_0:override("a", l_plus_hitmarker_color_0.a * v271.FadeTime);
                            l_rect_0(vector(l_x_0 - 1 / v275.x * v275.x, l_y_0 - 5 / v275.y * v275.y), vector(l_x_0 + 1 / v275.x * v275.x, l_y_0 + 5 / v275.y * v275.y), v277, 0, true);
                            l_rect_0(vector(l_x_0 - 5 / v275.x * v275.x, l_y_0 - 1 / v275.y * v275.y), vector(l_x_0 + 5 / v275.x * v275.x, l_y_0 + 1 / v275.y * v275.y), v277, 0, true);
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
    local function v280(v279)
        -- upvalues: v269 (ref), v268 (ref)
        v269[v279.id] = {
            FadeTime = 1, 
            Position = v279.aim, 
            WaitTime = v268, 
            Reason = v279.state
        };
    end;
    events.render:set(function(_)
        -- upvalues: v278 (ref)
        v278();
    end);
    events.round_start:set(function()
        -- upvalues: v269 (ref)
        v269 = {};
    end);
    events.player_spawned:set(function(_)
        -- upvalues: v269 (ref)
        v269 = {};
    end);
    local v286 = esp.enemy:new_text("R8 Helper", "\a2FD500FFDMG+", function(v283)
        local v284 = entity.get_local_player();
        local v285 = v284:get_origin():dist((v283:get_origin()));
        if not v284 then
            return;
        elseif v284:is_alive() and v284:get_player_weapon():get_weapon_index() == 64 and v283.m_ArmorValue == 0 then
            if v285 < 585 then
                return "\a2FD500FFDMG+";
            else
                return " ";
            end;
        else
            return;
        end;
    end);
    local v287 = v7.switch(v7.tabs.visuals_misc, v14.with_icon("face-dotted", "Keep Model Transparency", "{Link Active}"))("visuals", "keep_scope", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 2;
    end)();
    v9.localplayer_transparency = function()
        -- upvalues: v287 (ref)
        local v288 = entity.get_local_player();
        if v288 == nil or not v288:is_alive() then
            return;
        elseif v287:get() then
            return (not not v288.m_bIsScoped or v288.m_bResumeZoom) and 100 or 255;
        else
            return;
        end;
    end;
    local v289 = {
        mod_forcedata = 1, 
        cl_disable_ragdolls = 1, 
        cl_csm_world_shadows_in_viewmodelcascade = 0, 
        gameinstructor_enable = 0, 
        fog_enable_water_fog = 0, 
        cl_disablehtmlmotd = 1, 
        cl_autohelp = 0, 
        cl_showhelp = 0, 
        cl_freezecameffects_showholiday = 0, 
        cl_freezecampanel_position_dynamic = 0, 
        cl_disablefreezecam = 1, 
        cl_csm_sprite_shadows = 0, 
        cl_csm_rope_shadows = 0, 
        cl_csm_viewmodel_shadows = 0, 
        cl_foot_contact_shadows = 0, 
        cl_csm_world_shadows = 0, 
        cl_csm_shadows = 0, 
        cl_csm_static_prop_shadows = 0, 
        r_shadows = 0, 
        r_3dsky = 0, 
        func_break_max_pieces = 0, 
        r_dynamic = 0, 
        r_dynamiclighting = 0, 
        r_eyemove = 0, 
        r_eyegloss = 0, 
        cl_showerror = 0, 
        mat_disable_bloom = 1, 
        dsp_slow_cpu = 1, 
        r_drawsprites = 0, 
        r_drawropes = 0, 
        r_drawrain = 0, 
        r_drawdecals = 0, 
        violence_hblood = 0, 
        cl_csm_entity_shadows = 0, 
        cl_csm_translucent_shadows = 0
    };
    local v290 = v7.switch(v7.tabs.visuals_misc, v14.with_icon("star", "FPS Booster", "{Link Active}"))("visuals", "fps_boost", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 2;
    end)();
    v290:set_callback(function(v291)
        -- upvalues: v289 (ref), v290 (ref), v28 (ref)
        local v292 = v291:get() and 0 or 1;
        for v293, v294 in pairs(v289) do
            if cvar[v293] then
                cvar[v293]:int(v291:get() and v294 or v292);
            end;
        end;
        if v290:get() then
            v28.push("Refreshed Game CVARs to optimize FPS!");
        end;
    end);
    v290:tooltip("Disabling useless game cvars to make game feel smoother");
    v16.gradient = l_gradient_0 and l_gradient_0.text_animate("S E N S E", -2, {
        color(255, 255, 255), 
        color(91, 91, 91)
    }) or nil;
    v16.build_text = function(v295, v296)
        -- upvalues: v16 (ref), v8 (ref), v40 (ref)
        if v16.gradient then
            v16.gradient:animate();
        end;
        local v297 = "\a" .. (v296 and v296 or v8.elements.visuals.accent:to_hex()) .. "L U A " .. (v16.gradient and v16.gradient:get_animated_text() or "S E N S E");
        if not v295 and v40 then
            v297 = v297 .. " \aEB6161FF[BETA]";
        end;
        return v297, (render.measure_text(1, "s", v297));
    end;
    v17.menu = {};
    v17.items = {
        [1] = "watermark", 
        [2] = "slowed_down"
    };
    local v298 = v14.screen_size / 2;
    v16.starting_padding = 15;
    v16.positions = {
        Bottom = (function()
            -- upvalues: v16 (ref), v298 (ref), v14 (ref)
            local _, v300 = v16.build_text();
            return vector(v298.x - v300.x / 2, v14.screen_center.y + v14.screen_center.y - v16.starting_padding);
        end)(), 
        Right = (function()
            -- upvalues: v16 (ref), v14 (ref)
            local _, v302 = v16.build_text();
            return vector(v14.screen_size.x - v302.x - v16.starting_padding, v14.screen_center.y);
        end)(), 
        Left = vector(v16.starting_padding, v14.screen_center.y)
    };
    for v303, v304 in pairs(v17.items) do
        v17.database[v304 .. "_pos_x"] = v17.database[v304 .. "_pos_x"] or v303 * 25;
        v17.database[v304 .. "_pos_y"] = v17.database[v304 .. "_pos_y"] or v303 * 25;
        v17.menu[v304] = {
            pos_x = v17.database[v304 .. "_pos_x"], 
            pos_y = v17.database[v304 .. "_pos_y"]
        };
    end;
    v17.drag = {};
    v17.current_drugging_item = nil;
    v17.hovered_something = false;
    v17.drag_handle = function(v305, v306, v307, v308)
        -- upvalues: v17 (ref), v14 (ref)
        if v308 == nil then
            v308 = 0;
        end;
        if v17.drag[v307] == nil then
            v17.drag[v307] = {};
            v17.drag[v307].drag_position = vector(0, 0);
            v17.drag[v307].is_dragging = false;
        end;
        local v309 = ui.get_mouse_position();
        local v310 = vector();
        if v17.in_bounds(v305, v305 + v306) then
            v17.hovered_something = true;
            if common.is_button_down(1) and v17.drag[v307].is_dragging == false and (v17.current_drugging_item == nil or v17.current_drugging_item == v307) then
                v17.drag[v307].is_dragging = true;
                v17.current_drugging_item = v307;
                v17.drag[v307].drag_position = v305 - v309;
            end;
        end;
        if not v17.in_bounds(v310, v14.screen_size) then
            v17.drag[v307].is_dragging = false;
        end;
        if not common.is_button_down(1) then
            v17.drag[v307].is_dragging = false;
            v17.current_drugging_item = nil;
        end;
        if v17.drag[v307].is_dragging and ui.get_alpha() > 0 then
            maxValue = v14.screen_size - v306;
            v17.database[v307 .. "_pos_x"] = math.clamp(v309.x + v17.drag[v307].drag_position.x, 0, maxValue.x);
            v17.database[v307 .. "_pos_y"] = math.clamp(v309.y + v17.drag[v307].drag_position.y, 0, maxValue.y);
        end;
        render.rect_outline(v305 - 6, v305 + v306 + 6, color(255, 255, 255, ui.get_alpha() * 150 * v308), 1, 4);
    end;
    events.mouse_input:set(function()
        -- upvalues: v17 (ref)
        if (v17.hovered_something or v17.current_drugging_item) and ui.get_alpha() > 0 then
            return false;
        else
            return;
        end;
    end);
    v11.dormant = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot");
    v11.hitboxes = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes");
    v11.multipoint = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint");
    v11.inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter");
    v11.slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk");
    v11.fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
    v11.pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch");
    v11.yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw");
    v11.yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base");
    v11.yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset");
    v11.yaw_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab");
    v11.yaw_hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden");
    v11.yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier");
    v11.yaw_modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset");
    v11.body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw");
    v11.left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit");
    v11.right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit");
    v11.body_yaw_options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options");
    v11.body_yaw_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding");
    v11.freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding");
    v11.disable_yaw_modif = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers");
    v11.body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding");
    v11.extended_angles = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles");
    v11.extended_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch");
    v11.extended_roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll");
    v11.fakelag = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled");
    v11.fakelag_limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit");
    v11.fakelag_var = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability");
    v11.hitchance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance");
    v11.doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
    v11.doubletap_config = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options");
    v11.doubletap_fakelag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit");
    v11.min_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
    v11.prefer_body = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim");
    v11.prefer_safety = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points");
    v11.quick_peek = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist");
    v11.retreat_mode = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode");
    v11.hideshots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
    v11.hideshots_config = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options");
    v11.fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency");
    v11.legs = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement");
    v11.scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay");
    v11._vars = {};
    for v311, v312 in pairs(v11) do
        if v311 ~= "_vars" then
            v11._vars[v311] = {
                time = -1, 
                overriden = false, 
                var = v312
            };
        end;
    end;
    v11.deoverride_unused = function(v313)
        -- upvalues: v11 (ref)
        local l_realtime_0 = globals.realtime;
        local v315 = to_time(16);
        for v316, v317 in pairs(v11._vars) do
            if v317.overriden and (v313 or v317.time + v315 < l_realtime_0) then
                v317.var:override();
                if not v317.keep_enabled then
                    v317.var:disabled(false);
                end;
                v11._vars[v316].overriden = false;
            end;
        end;
    end;
    v11.override = v125("refs.override", true, function(v318, v319, v320)
        -- upvalues: v11 (ref)
        local v321 = v11._vars[v318];
        if v321 == nil then
            return;
        else
            if type(v319) == "table" and v319._len then
                v319._len = nil;
            end;
            v321.var:override(v319);
            if not v320 then
                v321.var:disabled(false);
            end;
            v11._vars[v318].overriden = true;
            v11._vars[v318].keep_enabled = v320 or false;
            v321.time = globals.realtime;
            return v321.var;
        end;
    end);
    v11.get_value = function(v322)
        -- upvalues: v11 (ref)
        local v323 = v11._vars[v322];
        if v323 == nil then
            return;
        else
            v323 = v323.var;
            local v324 = v323:get_override();
            if v324 ~= nil then
                return v324;
            else
                return v323:get();
            end;
        end;
    end;
    v7.switch(v7.tabs.misc, v14.with_icon("block-brick", "Avoid Collisions", "{Link Active}"))("aa", "avoid_collisions", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 1;
    end)(function(v325)
        -- upvalues: v7 (ref), v14 (ref)
        v7.switch(v325, v14.with_icon("duck", "Disable on crouch", "{Link Active}"))("aa", "avoid_collisions_duck");
        v7.slider(v325, v14.with_icon("line-height", "Distance", "{Link Active}"), 1, 16, 8)("aa", "avoid_collisions_dst");
    end);
    v7.switch(v7.tabs.misc, v14.with_icon("duck", "Duck Avoid Collisions", "{Link Active}"))("aa", "auto_duck", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 1;
    end)();
    v7.switch(v7.tabs.misc, v14.with_icon("line-height", "Avoid Fall Damage", "{Link Active}"))("aa", "fall_dmg", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 1;
    end)();
    v7.switch(v7.tabs.misc, v14.with_icon("arrows-to-eye", "Cheat revealer [SOON]", "{Link Active}"))("misc", "cheat_revel", false, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 1;
    end)():disabled(true);
    local function v337(v326)
        local l_x_1 = entity.get_local_player().m_vecOrigin.x;
        local l_y_1 = entity.get_local_player().m_vecOrigin.y;
        local l_z_0 = entity.get_local_player().m_vecOrigin.z;
        local v330 = math.pi * 2;
        for v331 = 0, v330, v330 / 8 do
            local v332 = 10 * math.cos(v331) + l_x_1;
            local v333 = 10 * math.sin(v331) + l_y_1;
            local v334 = utils.trace_line(vector(v332, v333, l_z_0), vector(v332, v333, l_z_0 - v326), entity.get_local_player());
            local l_fraction_0 = v334.fraction;
            local _ = v334.entity;
            if l_fraction_0 ~= 1 then
                return true;
            end;
        end;
        return false;
    end;
    events.createmove:set(function(v338)
        -- upvalues: v8 (ref), v337 (ref)
        if not v8.elements.aa.fall_dmg then
            return;
        else
            me = entity.get_local_player();
            if me == nil then
                return;
            else
                if me.m_vecVelocity.z >= -500 then
                    no_fall_damage = false;
                elseif v337(15) then
                    no_fall_damage = false;
                elseif v337(75) then
                    no_fall_damage = true;
                end;
                if me.m_vecVelocity.z < -500 then
                    if no_fall_damage then
                        v338.in_duck = 1;
                    else
                        v338.in_duck = 0;
                    end;
                end;
                return;
            end;
        end;
    end);
    v30.cache = nil;
    v30.set = function(v339)
        -- upvalues: v30 (ref)
        if v339 ~= v30.cache then
            common.set_clan_tag(v339);
            local l_v30_0 = v30;
            if v339 == "" then

            end;
            l_v30_0.cache = v339;
        end;
    end;
    v30.anim = function(v341, v342)
        local v343 = utils.net_channel();
        if v343 == nil then
            return;
        else
            local v344 = "               " .. v341 .. "                      ";
            local v345 = v343.latency[0] / globals.tickinterval;
            local v346 = (globals.tickcount + v345) / (0.3 / globals.tickinterval);
            v346 = v342[math.floor(v346 % #v342) + 1] + 1;
            return string.sub(v344, v346, v346 + 15);
        end;
    end;
    v30.clear = function(v347)
        -- upvalues: v30 (ref)
        if v347 and v30.cache ~= nil then
            v30.set("");
        end;
    end;
    v7.switch(v7.tabs.misc, v14.with_icon("water-ladder", "Fast Ladder", "{Link Active}"))("aa", "fast_ladder", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 1;
    end);
    v7.switch(v7.tabs.misc, v14.with_icon("tag", "Clantag", "{Link Active}"))("misc", "clantag", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 1;
    end)():set_callback(function(v348)
        -- upvalues: v30 (ref)
        v30.clear(not v348:get());
    end);
    v9.manual_yaw_ui = {
        [1] = "Disabled", 
        [2] = "Forward", 
        [3] = "Local view", 
        [4] = "Left", 
        [5] = "Right", 
        [6] = "Freestanding"
    };
    v7.combo(v7.tabs.antiaim_misc, "Manual Yaw", v9.manual_yaw_ui)("aa", "manuals", true);
    v9.states = {
        air_crouch = 7, 
        air = 6, 
        moving_crouch = 5, 
        crouching = 4, 
        slowwalk = 3, 
        moving = 2, 
        standing = 1, 
        unknown = -1
    };
    v9.state_to_string = {
        [1] = "Standing", 
        [2] = "Moving", 
        [3] = "Slowwalk", 
        [4] = "Crouching", 
        [5] = "Move & Crouch", 
        [6] = "Air", 
        [7] = "Air & Crouch"
    };
    v9.string_to_state = {};
    for v349, v350 in ipairs(v9.state_to_string) do
        v9.string_to_state[v350] = v349;
    end;
    v9.flags = {
        is_fakelag = false, 
        is_jumping = false, 
        is_slowwalk = false, 
        is_not_moving = false, 
        on_ground = false, 
        is_crouching = false, 
        raw = 0
    };
    v9.player_state = 1;
    v9.update_player_state = function(v351)
        -- upvalues: v9 (ref), v97 (ref), v11 (ref)
        local v352 = entity.get_local_player();
        if v352 == nil then
            return;
        else
            local l_m_fFlags_0 = v352.m_fFlags;
            v9.flags.is_crouching = v352.m_flDuckAmount > 0.9;
            v9.flags.on_ground = bit.band(l_m_fFlags_0, v97) ~= 0;
            v9.flags.is_not_moving = v352.m_vecVelocity:length() < 2;
            v9.flags.is_slowwalk = v11.get_value("slow_walk");
            v9.flags.is_jumping = v351.in_jump;
            v9.flags.is_fakelag = not v11.doubletap:get();
            if v11.get_value("fake_duck") and v9.flags.on_ground then
                v9.player_state = v9.states.crouching;
                return;
            elseif v9.flags.is_crouching and (v9.flags.is_jumping or not v9.flags.on_ground) then
                v9.player_state = v9.states.air_crouch;
                return;
            elseif v9.flags.is_jumping or not v9.flags.on_ground then
                v9.player_state = v9.states.air;
                return;
            elseif v9.flags.is_slowwalk then
                v9.player_state = v9.states.slowwalk;
                return;
            elseif not v9.flags.is_crouching and v9.flags.is_not_moving then
                v9.player_state = v9.states.standing;
                return;
            elseif v9.flags.is_crouching and not v9.flags.is_not_moving and not v9.flags.is_slowwalk then
                v9.player_state = v9.states.moving_crouch;
                return;
            elseif v9.flags.is_crouching and v9.flags.is_not_moving then
                v9.player_state = v9.states.crouching;
                return;
            elseif not v9.flags.is_crouching and not v9.flags.is_not_moving and not v9.flags.is_slowwalk then
                v9.player_state = v9.states.moving;
                return;
            else
                v9.player_state = v9.states.unknown;
                return;
            end;
        end;
    end;
    local v354 = 360 / (math.pi * 2);
    v18.change_yaw = function(v355, v356, v357)
        -- upvalues: v354 (ref)
        if math.abs(v357.plane.normal.z) > 0.1 or v357.plane.normal:length() < 0.1 then
            return;
        else
            local v358 = nil;
            if v357.plane.normal.y < v357.plane.normal.x then
                v358 = math.atan2(v357.plane.normal.y, v357.plane.normal.x) * v354 + 180;
            else
                v358 = math.atan2(v357.plane.normal.y, v357.plane.normal.x) * v354 - 180;
            end;
            local v359 = math.normalize_yaw(v356 - v358);
            if math.abs(v359) > 90 then
                return;
            else
                if v355.sidemove < -10 and v359 < 0 then
                    v359 = 1;
                elseif v355.sidemove > 10 and v359 > 0 then
                    v359 = -1;
                end;
                if v359 > 0 then
                    v358 = v358 + 90;
                else
                    v358 = v358 - 90;
                end;
                v358 = math.normalize_yaw(90 - v358);
                local l_end_pos_0 = v357.end_pos;
                l_end_pos_0.x = l_end_pos_0.x + math.sin(math.rad(v358)) * 45;
                l_end_pos_0.y = l_end_pos_0.y + math.cos(math.rad(v358)) * 45;
                v355.move_yaw = math.normalize_yaw(90 - v358);
                v355.in_speed = 0;
                local v361 = 0;
                v355.in_moveright = 0;
                v355.in_moveleft = v361;
                v355.forwardmove = 450;
                v355.sidemove = 0;
                return;
            end;
        end;
    end;
    v18.handle = function(v362)
        -- upvalues: v8 (ref), v32 (ref), v9 (ref), v13 (ref), v12 (ref), v18 (ref)
        if not v8.elements.aa.avoid_collisions then
            return;
        elseif v32.active then
            return;
        elseif v9.player_state == v9.states.air_crouch and v8.elements.aa.avoid_collisions_duck then
            return;
        elseif v13.shared_data.movetype ~= 2 or v9.player_state ~= v9.states.air and v9.player_state ~= v9.states.air_crouch then
            return;
        elseif v362.forwardmove < 0 then
            return;
        else
            local v363 = entity.get_local_player();
            if v363 == nil then
                return;
            else
                local l_m_vecVelocity_0 = v363.m_vecVelocity;
                local v365 = l_m_vecVelocity_0:length2d();
                if v365 < 150 then
                    return;
                else
                    local v366 = v363[0];
                    local v367 = v12.native_getCollideable(v366);
                    local v368 = v12.native_getMins(v367);
                    local v369 = v12.native_getMaxs(v367);
                    local v370 = vector(v368.x, v368.y, v368.z) * 0.85;
                    local v371 = vector(v369.x, v369.y, v369.z) * 0.85;
                    local v372 = render.camera_angles();
                    v372.x = 0;
                    local _ = math.atan2(l_m_vecVelocity_0.y, l_m_vecVelocity_0.x);
                    local v374 = v363:get_origin();
                    local v375 = vector():angles(v372.x, v372.y);
                    local l_avoid_collisions_dst_0 = v8.elements.aa.avoid_collisions_dst;
                    local v377 = v374 + v375 * (v365 * (globals.tickinterval * l_avoid_collisions_dst_0));
                    local v378 = utils.trace_hull(v374, v377, v370, v371, entity.get_players(false, false), 33636363, 0);
                    if v378.entity == nil then
                        return;
                    elseif v378.entity:get_classname() == "CDynamicProp" then
                        return;
                    elseif bit.band(v378.contents, 536870912) ~= 0 then
                        return;
                    else
                        v18.change_yaw(v362, v372.y, v378);
                        return;
                    end;
                end;
            end;
        end;
    end;
    v9.manual_yaws = {
        Forward = 180, 
        Left = -90, 
        Right = 90, 
        ["Local view"] = 0
    };
    v9.is_manuals = function()
        -- upvalues: v8 (ref), v9 (ref)
        local l_manuals_0 = v8.elements.aa.manuals;
        if v8.elements.aa.freestanding_disablers[v9.state_to_string[v9.player_state]] and l_manuals_0 == "Freestanding" then
            return false, l_manuals_0;
        else
            return l_manuals_0 ~= "Disabled", l_manuals_0;
        end;
    end;
    v9.conditions = {};
    v9.condition_names = {};
    v9.conditions_by_team = {};
    v9.create_ui = function(v380, v381, v382, v383, v384)
        -- upvalues: v8 (ref), v7 (ref), v11 (ref), v14 (ref), v9 (ref)
        local v385 = {};
        local v386 = v380 .. v382[1] .. v381 .. tostring(v383);
        local v387 = "\n\aFFFFFF00" .. v386;
        local function v388()
            -- upvalues: v8 (ref), v382 (ref), v381 (ref), v380 (ref), v384 (ref)
            return v8.elements.aa["condition_combo_" .. v382[1] .. v381] == v380 and v8.elements.aa[v381] == v382[1] and (not (v384 ~= nil) or v384());
        end;
        if v380 ~= "Global" and group == nil and v381 ~= "conditional_teams_manual" then
            v385.switch = v7.switch(v383, "Override " .. v380)("aa", v386 .. "override", true, v388);
            local l_v388_0 = v388;
            do
                local l_l_v388_0_0 = l_v388_0;
                v388 = function()
                    -- upvalues: v8 (ref), v386 (ref), l_l_v388_0_0 (ref)
                    return v8.elements.aa[v386 .. "override"] and l_l_v388_0_0();
                end;
            end;
        end;
        if v383 == v7.tabs.antiaim_defensive then
            local v391 = v11.pitch:list();
            table.remove(v391, 1);
            table.insert(v391, "Zero");
            table.insert(v391, "Exploit");
            v385.pitch = v7.combo(v383, v11.pitch:name() .. v387, v391)("aa", v386 .. "pitch", true, v388);
        end;
        if v380 ~= "Manuals" then
            local v392 = {
                [1] = "Left And Right", 
                [2] = "Local View", 
                [3] = "Static"
            };
            if v383 == v7.tabs.antiaim_defensive then
                table.insert(v392, "Side Based");
                table.insert(v392, "Spin Bot");
                table.insert(v392, "Random");
                table.remove(v392, 2);
                table.remove(v392, 2);
                table.remove(v392, 2);
            end;
            do
                local l_v392_0 = v392;
                v385.yaw = v7.combo(v383, v14.with_icon("angle", v11.yaw:name(), "{Link Active}") .. v387, l_v392_0)("aa", v386 .. "yaw", true, v388)(function(v394)
                    -- upvalues: v385 (ref), v7 (ref), v11 (ref), v387 (ref), v386 (ref), v8 (ref), l_v392_0 (ref)
                    v385.static_yaw_offset = v7.slider(v394, "Yaw " .. v11.yaw_offset:name() .. v387, -180, 180, 0)("aa", v386 .. "static_yaw_offset", true, function()
                        -- upvalues: v8 (ref), v386 (ref), l_v392_0 (ref)
                        return v8.elements.aa[v386 .. "yaw"] == l_v392_0[3] or v8.elements.aa[v386 .. "yaw"] == l_v392_0[4];
                    end);
                    v385.random_yaw_offset = v7.slider(v394, "Offset variability" .. v387, 0, 180, 0)("aa", v386 .. "random_yaw_offset", true, function()
                        -- upvalues: v8 (ref), v386 (ref), l_v392_0 (ref)
                        return v8.elements.aa[v386 .. "yaw"] == l_v392_0[1] or v8.elements.aa[v386 .. "yaw"] == l_v392_0[2];
                    end);
                    v385.left_yaw_offset = v7.slider(v394, "Left " .. v11.yaw_offset:name() .. v387, -180, 180, 0)("aa", v386 .. "left_yaw_offset", true, function()
                        -- upvalues: v8 (ref), v386 (ref), l_v392_0 (ref)
                        return v8.elements.aa[v386 .. "yaw"] == l_v392_0[1] or v8.elements.aa[v386 .. "yaw"] == l_v392_0[2];
                    end);
                    v385.right_yaw_offset = v7.slider(v394, "Right " .. v11.yaw_offset:name() .. v387, -180, 180, 0)("aa", v386 .. "right_yaw_offset", true, function()
                        -- upvalues: v8 (ref), v386 (ref), l_v392_0 (ref)
                        return v8.elements.aa[v386 .. "yaw"] == l_v392_0[1] or v8.elements.aa[v386 .. "yaw"] == l_v392_0[2];
                    end);
                    v385.yaw_swap_delay = v7.slider(v394, "Delay" .. v387, 1, 14, 0)("aa", v386 .. "yaw_swap_delay", true, function()
                        -- upvalues: v8 (ref), v386 (ref), l_v392_0 (ref)
                        return v8.elements.aa[v386 .. "yaw"] == l_v392_0[2];
                    end);
                end);
            end;
        end;
        local v395 = {
            [1] = "None", 
            [2] = "Additive"
        };
        v385.yaw_modifier = v7.combo(v383, v14.with_icon("fan", v11.yaw_modifier:name(), "{Link Active}") .. v387, v395)("aa", v386 .. "yaw_modifier", true, v388)(function(v396)
            -- upvalues: v385 (ref), v7 (ref), v11 (ref), v387 (ref), v386 (ref), v8 (ref)
            v385.yaw_modifier_offset = v7.slider(v396, v11.yaw_modifier_offset:name() .. v387, -180, 180, 0)("aa", v386 .. "yaw_modifier_offset", true);
            v385.yaw_modifier_offset_factor = v7.slider(v396, "Offset variability" .. v387, 0, 180, 0)("aa", v386 .. "yaw_modifier_offset_factor", true, function()
                -- upvalues: v8 (ref), v386 (ref)
                return v8.elements.aa[v386 .. "yaw_modifier"] == "Additive";
            end);
        end);
        v385.body_yaw = v7.switch(v383, v14.with_icon("shield", v11.body_yaw:name(), "{Link Active}") .. v387, true)("aa", v386 .. "body_yaw", true, v388)(function(v397)
            -- upvalues: v385 (ref), v7 (ref), v11 (ref), v387 (ref), v386 (ref), v8 (ref)
            v385.left_limit = v7.slider(v397, v11.left_limit:name() .. v387, 0, 60, 60)("aa", v386 .. "left_limit", true);
            v385.right_limit = v7.slider(v397, v11.right_limit:name() .. v387, 0, 60, 60)("aa", v386 .. "right_limit", true);
            v385.body_yaw_options = v7.selectable(v397, v11.body_yaw_options:name() .. v387, v11.body_yaw_options:list())("aa", v386 .. "body_yaw_options", true);
            v385.body_yaw_speed = v7.slider(v397, "Delay" .. v387, 1, 14, 1)("aa", v386 .. "body_yaw_speed", true, function()
                -- upvalues: v8 (ref), v386 (ref)
                return v8.elements.aa[v386 .. "body_yaw"];
            end);
            v385.body_speed_random = v7.switch(v397, "Randomize Delay" .. v387)("aa", v386 .. "body_speed_random", true);
            v385.body_yaw_freestanding = v7.combo(v397, v11.body_yaw_freestanding:name() .. v387, v11.body_yaw_freestanding:list())("aa", v386 .. "body_yaw_freestanding", true);
        end);
        for v398, v399 in pairs(v385) do
            if type(v399) == "function" then
                v385[v398] = v385[v398]();
            end;
        end;
        local v400 = v382[2] == 2;
        v7.button(v383, v14.with_icon("share", "Send to " .. (v400 and "CT" or "T"), "{Link Active}"), function()
            -- upvalues: v385 (ref), v9 (ref), v380 (ref), v400 (ref), v381 (ref), v383 (ref), v8 (ref)
            for v401, v402 in pairs(v385) do
                local v403 = v9.conditions_by_team[v380 .. tostring(not v400) .. v381 .. tostring(v383)];
                v9.conditions[v403].ui[v401]:set(v402:get());
            end;
            v8.global_update_callback();
        end, true)("aa", "send_button" .. v380 .. v382[1] .. v381 .. tostring(v383), false, v388);
        return v385;
    end;
    local v407 = (function()
        -- upvalues: v9 (ref)
        local v404 = {};
        for _, v406 in ipairs(v9.state_to_string) do
            table.insert(v404, v406);
        end;
        return v404;
    end)();
    v7.selectable(v7.tabs.antiaim_misc, v14.with_icon("shield-halved", "Force Defensive", "{Link Active}"), v407)("aa", "force_defensive_cond", true);
    table.remove(v407, 1);
    table.remove(v407, 3);
    v7.combo(v7.tabs.antiaim_misc, v14.with_icon("gitter", "Auto Lag Exploit", "{Link Active}"), {
        [1] = "Disabled", 
        [2] = "Default", 
        [3] = "Smart"
    })("aa", "auto_lag_exploit");
    v14.menu_combo_sanitizer = function(v408)
        local v409 = {};
        for v410, v411 in pairs(v408) do
            table.insert(v409, type(v410) == "string" and v410 or v411);
        end;
        return v409;
    end;
    v22.base_speed = 0.07;
    v22._list = {};
    v22.new = function(v412, v413, v414, v415)
        -- upvalues: v22 (ref)
        if not v414 then
            v414 = v22.base_speed;
        end;
        local v416 = type(v413) ~= "number";
        if v22._list[v412] == nil then
            v22._list[v412] = v415 and v415 or v416 and color(0, 0, 0, 0) or 0;
        end;
        local v417 = nil;
        if v416 then
            v417 = v413.lerp;
        else
            v417 = math.lerp;
        end;
        v22._list[v412] = v417(v22._list[v412], v413, v414);
        return v22._list[v412];
    end;
    v7.switch(v7.tabs.visuals_misc, v14.with_icon("telescope", "Scope Overlay", "{Link Active}"))("visuals", "scope_overlay", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 2;
    end)(function(v418)
        -- upvalues: v7 (ref), v14 (ref), v8 (ref), v15 (ref)
        v7.combo(v418, v14.with_icon("pen-swirl", "Style", "{Link Active}"), {
            [1] = "Default", 
            [2] = "T", 
            [3] = "X"
        })("visuals", "scope_overlay_style", true, function()
            -- upvalues: v8 (ref)
            return v8.elements.visuals.scope_overlay;
        end);
        v7.selectable(v418, v14.with_icon("gear", "Settings", "{Link Active}"), {
            [1] = "Spread based", 
            [2] = "Glow", 
            [3] = "Animated zoom"
        })("visuals", "scope_overlay_settings", true, function()
            -- upvalues: v8 (ref)
            return v8.elements.visuals.scope_overlay;
        end);
        v7.slider(v418, v14.with_icon("arrow-down-big-small", "Size", "{Link Active}"), 0, 300, 100)("visuals", "scope_overlay_size", true, function()
            -- upvalues: v8 (ref)
            return v8.elements.visuals.scope_overlay;
        end);
        v7.slider(v418, v14.with_icon("arrows-left-right-to-line", "Gap", "{Link Active}"), 0, 300, 5)("visuals", "scope_overlay_gap", true, function()
            -- upvalues: v8 (ref)
            return v8.elements.visuals.scope_overlay;
        end);
        v7.color_picker(v418, "First Color", v15.white)("visuals", "scope_overlay_accent_color", true, function()
            -- upvalues: v8 (ref)
            return v8.elements.visuals.scope_overlay;
        end);
        v7.color_picker(v418, "Second Color", v15.white:override("a", 0))("visuals", "scope_overlay_breath_color", true, function()
            -- upvalues: v8 (ref)
            return v8.elements.visuals.scope_overlay;
        end);
    end);
    v21.rotation = 0;
    v21.shadow_anim = 0;
    v21.handle = function()
        -- upvalues: v8 (ref), v11 (ref), v13 (ref), v22 (ref), v14 (ref), v21 (ref)
        local l_scope_overlay_0 = v8.elements.visuals.scope_overlay;
        if not l_scope_overlay_0 then
            return;
        else
            local v420 = entity.get_local_player();
            if v420 == nil then
                return;
            else
                local v421 = v420:get_player_weapon();
                if v421 == nil then
                    return;
                else
                    v11.override("scope_overlay", "Remove All");
                    local v422 = v8.elements.visuals.scope_overlay_settings["Animated zoom"];
                    local l_scoped_0 = v13.shared_data.scoped;
                    local v424 = l_scope_overlay_0 and l_scoped_0 and 1 or 0;
                    local v425 = v422 and v22.new("scope_overlay", v424) or v424;
                    if v425 < 0.1 then
                        return;
                    else
                        local l_scope_overlay_style_0 = v8.elements.visuals.scope_overlay_style;
                        local v427 = v8.elements.visuals.scope_overlay_settings["Spread based"];
                        local l_scope_overlay_size_0 = v8.elements.visuals.scope_overlay_size;
                        local l_scope_overlay_gap_0 = v8.elements.visuals.scope_overlay_gap;
                        local l_scope_overlay_accent_color_0 = v8.elements.visuals.scope_overlay_accent_color;
                        local l_scope_overlay_breath_color_0 = v8.elements.visuals.scope_overlay_breath_color;
                        local l_Glow_0 = v8.elements.visuals.scope_overlay_settings.Glow;
                        local v433 = v427 and v22.new("spread_dependensy", v421:get_inaccuracy() * 75) + l_scope_overlay_gap_0 or l_scope_overlay_gap_0;
                        local v434 = {
                            l_scope_overlay_accent_color_0:override("a", l_scope_overlay_accent_color_0.a * v425), 
                            l_scope_overlay_breath_color_0:override("a", l_scope_overlay_breath_color_0.a * v425)
                        };
                        l_scope_overlay_size_0 = l_scope_overlay_size_0 * v425;
                        local v435 = v14.screen_size / 2;
                        v21.rotation = v22.new("scop_ratator", l_scope_overlay_style_0 == "X" and 45 or 90);
                        v21.shadow_anim = v22.new("scope_shadow_anim", l_Glow_0 and 15 or 1);
                        if v21.rotation ~= 90 then
                            render.push_rotation(v21.rotation, v14.screen_size / 2);
                        end;
                        if v21.shadow_anim ~= 1 then
                            render.shadow(v435 - vector(l_scope_overlay_size_0 + v433, -1), v435 - vector(v433, 0), v434[1], v21.shadow_anim);
                            render.shadow(v435 + vector(v433, 1), v435 + vector(l_scope_overlay_size_0 + v433, 0), v434[1], v21.shadow_anim);
                            render.shadow(v435 + vector(0, v433), v435 + vector(-1, l_scope_overlay_size_0 + v433), v434[1], v21.shadow_anim);
                        end;
                        render.gradient(v435 - vector(l_scope_overlay_size_0 + v433, -1), v435 - vector(v433, 0), v434[2], v434[1], v434[2], v434[1]);
                        render.gradient(v435 + vector(l_scope_overlay_size_0 + v433, 1), v435 + vector(v433, 0), v434[2], v434[1], v434[2], v434[1]);
                        if l_scope_overlay_style_0 ~= "T" then
                            if v21.shadow_anim ~= 1 then
                                render.shadow(v435 - vector(-1, l_scope_overlay_size_0 + v433), v435 - vector(0, v433), v434[1], v21.shadow_anim);
                            end;
                            render.gradient(v435 - vector(-1, l_scope_overlay_size_0 + v433), v435 - vector(0, v433), v434[2], v434[2], v434[1], v434[1]);
                        end;
                        render.gradient(v435 + vector(1, l_scope_overlay_size_0 + v433), v435 + vector(0, v433), v434[2], v434[2], v434[1], v434[1]);
                        if v21.rotation ~= 90 then
                            render.pop_rotation();
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end;
    v9.hidden_configs_def = {
        Defensive = "hKRtaXNjiadjbGFudGFnw6x1bmxvY2tfc3Bpa2UAp2FpX3BlZWvCrmFpX3BlZWtfbm90aWZ5wrNhdXRvcGVla19wZXJmb21hbmNlMq1haV9wZWVrX2RlYnVnwq5uYWRlX3N0YWJpbGl6ZcKvYXV0b3BlZWtfc2FmZXR5CLJhdXRvcGVla19oaXRncm91cHOQomFh3gLV2UlTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJhbmRvbV95YXdfb2Zmc2V0ANlNTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldDIA2UdTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldADZTE1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2UJTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2ThBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0MvHZOUFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0MhfZQ0FpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2UJBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldDIA2UNBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQyANkwU2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3plN0YXRpY9k3U2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF9saW1pdDzZQkFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0Mi/ZTEFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2TlBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXfD2UdBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX3JhbmRvbWl6ZcLZSU1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2UJNYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKoRGlzYWJsZWTZQk1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF9saW1pdDzZNk1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF9saW1pdDzZNE1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXfD2U1Nb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZRlNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2UZTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9lMTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZSkFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdk1TWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpb3ZlcnJpZGXC2VFNYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2ThTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF9saW1pdDzZQE1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2UxNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfcmFuZG9taXplwtlEU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2UFNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF9saW1pdDzZPlN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZQE1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfbGltaXQ82U9NYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdlPTWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfd2F5cwPZTE1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2T5NYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilvdmVycmlkZcLZUVN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfd2F5cwOpYXV0b19kdWNrwtk+QWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKoRGlzYWJsZWTZPUFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXKoRGlzYWJsZWTZNkNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd8PZRkFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2TpNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19zd2FwX2RlbGF5A9k8TW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0Ktk4Q3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfbGltaXQ82TtDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcqhEaXNhYmxlZNlCQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0A9k9TW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZSFN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2UZTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdk9U3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0MgDZUlN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2UlTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0ANlGTW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZR1N0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdlVQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZQVN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0ANlGTW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0MgDZMFN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd6ZTdGF0aWPZNUdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X2xpbWl0PNlGTWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5DZOUdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZRlN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQA2UVNYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUBp21hbnVhbHOoRGlzYWJsZWTZRkdsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2ThNYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcqhEaXNhYmxlZNk8R2xvYmFsVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQyANlSQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQHZO0dsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0ANk7TW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19zd2FwX2RlbGF5ZWTC2T9TdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXfD2UNNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5Adk/TW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyqERpc2FibGVk2UZBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X2xpbWl0PNlEQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXfD2VJBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfcmFuZG9taXplwtlVQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfd2F5cwPZVUFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2VZBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZT0FpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2UhBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKoRGlzYWJsZWTZSkFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5AdlMQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXllZMLZPkFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3qFNwaW4gQm902VJDcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANk6TW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcPZOk1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcGl0Y2inRXhwbG9pdNlBTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXTh2ThNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd6pTaWRlIEJhc2Vk2TZTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXfD2UFBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfd2F5cwPZOFN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X2xpbWl0PNlETW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQA2TlTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82UVNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQA2UhTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2UVNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5ZWTC2UdTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0MgDZPUNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcGl0Y2ikRG93btlIU2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQyANlBTW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKoRGlzYWJsZWTZRkFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfbGltaXQ82UhNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2UNBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3w9lPTW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZTk1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQHZVEFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQHZTk1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfd2F5cwPZR01vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtlLTW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfcmFuZG9taXplwtlFQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyqERpc2FibGVk2T1Nb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3w9lMQWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQHZP01vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZSkFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0ANlATW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF9saW1pdDzZRU1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2TRNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3w9lKTW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2VFNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2T9Dcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2UJTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfbGltaXQ82T5Dcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0MuTZRFN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyqERpc2FibGVk2T9Dcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldDIr2UdNYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5DZUUNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQHZPFN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilwaXRjaKdFeHBsb2l02T5TbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZImNvbmRpdGlvbl9jb21ib19UY29uZGl0aW9uYWxfdGVhbXOsQWlyICYgQ3JvdWNo2U1Nb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZRlN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2UxTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtk2Q3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKW92ZXJyaWRlw9lNTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldDIA2U5Nb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldDIA2T1Dcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V05Nk+Q3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQr2T5Dcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXllZMLZOkNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXKoRGlzYWJsZWTZQUNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0A9lHQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2URDcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX3JhbmRvbWl6ZcLZOUNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF9saW1pdDzZPkNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZQ0Nyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2T1TbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQyANlHU2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5ZWTC2UdTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZO01vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V06Nk2U3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKW92ZXJyaWRlw9lMTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldADZPk1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyqERpc2FibGVk2T1TdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0ANlATW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd6hTcGluIEJvdNk6U3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcqhEaXNhYmxlZNlITW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfcmFuZG9taXplwtlJTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX3JhbmRvbWl6ZcLZRE1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKW92ZXJyaWRlw9lKQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldDIA2UBTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0ANk+U2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldDIA2TpBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQyF9lBQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19zd2FwX2RlbGF5ZWTC2UdBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZQkFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2TxBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfbGltaXQ82UhBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2TxBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2UxBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANlCQWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfc3dhcF9kZWxheWVkwtlSTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZQ0FpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2TVBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd6pTaWRlIEJhc2Vk2T1BaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtk4QWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnORpkppdHRlctkzQWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X2xpbWl0PNkyQWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfbGltaXQ82TBBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXfD2T5BaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX3JhbmRvbWl6ZcLZQUFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdk7QWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2TZBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkE2TxNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2TdBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V08dk7TW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfeWF3X29mZnNldDLo2StBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3plN0YXRpY9k8TW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQyKtlMTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2UdNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF9saW1pdDzZVU1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2U9Nb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0ANlKTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2T1Nb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X2xpbWl0PNlJQWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX3JhbmRvbWl6ZcLZS01vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfd2F5cwPZPUFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfbGltaXQ82TpTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyqERpc2FibGVk2UFTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldADZTVN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtlFTW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANk8TW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0ANlMQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2UNBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZQkFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0Mu3ZO0FpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3w9lDQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0Mi/ZTEFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2U1BaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZRkFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2T9BaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKoRGlzYWJsZWTZQUFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5AdlDQWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXllZMLZRlN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2UNTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X2xpbWl0PNlEQWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldDIA2UFNYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF9saW1pdDzZQU1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtlRU2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANk0TWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcLZRk1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfbGltaXQ82VVNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9lITW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyqERpc2FibGVk2UFTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZRk1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2UBDcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKW92ZXJyaWRlw9lLTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdlLQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0ANlEQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKoRGlzYWJsZWTZPk1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3w9k7Q3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXeoU3BpbiBCb3TZOUFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcPZQU1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXBpdGNopERvd27ZSlNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0ANk/TW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3qFNwaW4gQm902UFBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldC/ZNVNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3w9lIU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANlLTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0ANk+U3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19zd2FwX2RlbGF5ZWTC2UVTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2UhTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2TVTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcPZQ01hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2UJNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnORpkppdHRlctk5U2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyqERpc2FibGVk2TxTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQA2U5Nb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2TVTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcPZPFN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZSE1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZPk1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X2xpbWl0PNk7TW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQq2VJDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9lMTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfd2F5cwPZTVNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfcmFuZG9taXplwtkwQWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKW92ZXJyaWRlw9lQU2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2URNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd8PZUFNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9k9TWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5DZUE1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANlDU2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX3JhbmRvbWl6ZcLZSU1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2TxTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcGl0Y2inRXhwbG9pdNlQTW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2UBNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X2xpbWl0PNk9U2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXllZMLZNkdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF9saW1pdDzZPU1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldDIq2TFTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3plN0YXRpY9lFR2xvYmFsQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdk4U3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82UNTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfcmFuZG9taXplwtlHU3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2TVTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd8PZP0dsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldADZR1Nsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZR01hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANk6QWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd8PZQFN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpb3ZlcnJpZGXD2UVNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpb3ZlcnJpZGXD2UlTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQyANlCTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXBpdGNopERvd27ZSFN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZS1N0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldADZRE1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9kxQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd6ZTdGF0aWPZL01vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3plN0YXRpY9k8TWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXBpdGNopERvd27ZRENyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X2xpbWl0PNlOQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtk7TW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpb3ZlcnJpZGXD2TZNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXemU3RhdGlj2URNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZQ0FpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpb3ZlcnJpZGXD2ThHbG9iYWxDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcqhEaXNhYmxlZNlBTW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2SNjb25kaXRpb25fY29tYm9fQ1Rjb25kaXRpb25hbF90ZWFtc6xBaXIgJiBDcm91Y2jZOk1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXfD2UFNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZR01vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0ANk/U2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3w9lFTW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0ANk5QWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0ANlAU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd8PZQlNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF9saW1pdDzZPVN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQA2VBTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQHZTE1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2TxNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfeWF3X29mZnNldDLo2T9TdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2UdTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2UVTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2UFTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZQ0Nyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfbGltaXQ82UhTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2U5Dcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2UBTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0ANlRQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9k6TW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfeWF3X29mZnNldOjZQkNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZPk1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0ANk5U3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyqERpc2FibGVk2TdBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXBpdGNopERvd27ZPVN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19zd2FwX2RlbGF5ZWTC2U5TdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2T5Nb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilvdmVycmlkZcPZQENyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2T5TdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZOkFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2UhDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQA2UJNYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2TxDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXeoU3BpbiBCb3TZOU1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcqhEaXNhYmxlZNk3TW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF9saW1pdDzZPEdsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5DZN0dsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82TxHbG9iYWxDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19zd2FwX2RlbGF5ZWTC2UVBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfbGltaXQ82VFBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2VRBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2U5BaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2UdBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcqhEaXNhYmxlZNk9U2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfeWF3X29mZnNldADZSUFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2UtBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5ZWTC2UpDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZPUdsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2UlDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQyANk8R2xvYmFsQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQyANlBTWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfbGltaXQ82U9Dcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfcmFuZG9taXplwtlCTW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfcmFuZG9taXplwtlFTW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdlGTWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfd2F5cwPZSUNyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnORpkppdHRlctlETW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2URNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0MiHZQ01hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKoRGlzYWJsZWTZSk1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0ANk5TW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3qlNpZGUgQmFzZWTZRE1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5AdlPTW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQHZT01vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2T5Nb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd8PZPlN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQyANlGTW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2UtNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2T5TbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0MgDZPFNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZQkdsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX3JhbmRvbWl6ZcLZR0FpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X2xpbWl0PNlAR2xvYmFsVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZREdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9lFR2xvYmFsVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANk+R2xvYmFsVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2UJNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKoRGlzYWJsZWTZPEFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF9saW1pdDzZO0dsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQyANk8R2xvYmFsVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJhbmRvbV95YXdfb2Zmc2V0ANlLQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0ANlKQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2VFBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2ZmtGZvcmNlX2RlZmVuc2l2ZV9jb25kl6hTdGFuZGluZ6ZNb3ZpbmeoU2xvd3dhbGupQ3JvdWNoaW5nrU1vdmUgJiBDcm91Y2ijQWlyrEFpciAmIENyb3VjaLJhdXRvX3RlbGVwb3J0X2NvbmSQs2F1dG9fdGVsZXBvcnRfdGlja3MKuWF1dG9fdGVsZXBvcnRfc3RhcnRfdGlja3MKt2F1dG9fdGVsZXBvcnRfdmlzdWFsaXNlw7BhdXRvX2xhZ19leHBsb2l0qERpc2FibGVkrWFjdGl2ZV9wcmVzZXQBrmF2b2lkX2JhY2tzdGFiwtk6Q3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF9saW1pdDzZP0Nyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2URDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZQUNyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKW92ZXJyaWRlw9k+Q3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcGl0Y2ikRG93brVhdm9pZF9jb2xsaXNpb25zX2R1Y2vC2U1TbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZOkdsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2TdNYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X2xpbWl0PNlIQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZTE1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2UNNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJhbmRvbV95YXdfb2Zmc2V0ANkxU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd6ZTdGF0aWPZRU1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfd2F5cwPZP1Nsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilvdmVycmlkZcPZQENyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldDIr2ThBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXllZMLZPEdsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZPUdsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2UtBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQA2TRBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyqERpc2FibGVk2UBBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXBpdGNoqUZha2UgRG93btlLQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANlDTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0MuHZQk1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfeWF3X29mZnNldOHZQ01vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQh2UNNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheWVkwtlBTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2UZNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V00M7ZTU1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANlBQWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQA2TtNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd8PZN0dsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXKoRGlzYWJsZWTZO1N0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3rkxlZnQgQW5kIFJpZ2h02U5Nb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2UVNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXTQztlLQWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdlLQWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9lQTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2VdNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2VZNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQHZVk1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9lTTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXCrWZsdWNjX2Zha2VsYWfC2UJBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2UJBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2UFBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0Mu3ZLEFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3plN0YXRpY9k6QWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZOlNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXemUmFuZG9t2T9BaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2UFBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2UtBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldDIA2UxBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQyANlDQWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZL0dsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3rkxlZnQgQW5kIFJpZ2h02UJBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2T9BaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2TFBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3w9kzQWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X2xpbWl0PNk0QWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF9saW1pdDzZOUFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2T5BaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZO0FpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKW92ZXJyaWRlw9k4QWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcGl0Y2ikRG93btk2QWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3qFNwaW4gQm902URBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZREFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJhbmRvbV95YXdfb2Zmc2V0ANlDQWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0MgDZQkFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldADZQ0FpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQA2T5BaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF9saW1pdDzZO0FpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X2xpbWl0PNk6QWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilvdmVycmlkZcPZTEFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2UBBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5AdlDQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZQUFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V07dlCQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0L9lCQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheWVkwtlAQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZPkFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyqERpc2FibGVk2UVBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXTQxtlMQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZS0FpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQHZOEFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0F9lIQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfcmFuZG9taXplwtk6QWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd8PZPUFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82UJBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnORpkppdHRlctlHQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2VFTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2URBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilvdmVycmlkZcPZQUFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXBpdGNopERvd27ZP0FpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd6hTcGluIEJvdNlNQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2VBBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZRE1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdk5TW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19zd2FwX2RlbGF5A9lMQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZSFNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZP1Nsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0MgCzb3RoZXJfYWlyX2hpdGNoYW5jZQC4YWlyX2hpdGNoYW5jZV9hY3RpdmVfd3BzkNlGTW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0MgCtYWlyX2hpdGNoYW5jZcLZQ1Nsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKoRGlzYWJsZWSzc2NvdXRfYWlyX2hpdGNoYW5jZQC2cmV2b2x2ZXJfYWlyX2hpdGNoYW5jZQC1cGlzdG9sc19haXJfaGl0Y2hhbmNlANlHQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkBqHNhZmVoZWFkwrBzYWZlaGVhZF90cmlnZ2VykLZmcmVlc3RhbmRpbmdfZGlzYWJsZXJzkNlRU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdlJQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZOUNyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF9saW1pdDzZN0Nyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXfD2UVDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2UhDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2UhDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2UlDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANk9Q3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQOrZmFzdF9sYWRkZXLC2T9Dcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19zd2FwX2RlbGF5ZWTC2T9Dcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQrsGF2b2lkX2NvbGxpc2lvbnPC2TZHbG9iYWxDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfbGltaXQ82T9Dcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfeWF3X29mZnNldDLk2UhDcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2TtTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZQENyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXfD2U1Dcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZQk1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldCHZOkdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQA2UBNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19zd2FwX2RlbGF5AdlRU3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yALRhdm9pZF9jb2xsaXNpb25zX2RzdAjZR0Nyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdk8Q3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19zd2FwX2RlbGF5A9k0R2xvYmFsQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd8PZRlNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQA2URBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldNDG2UxNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfc3dhcF9kZWxheWVkwtlHU3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldDIA2T9TdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpb3ZlcnJpZGXD2TxTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQA2T9Dcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2UpBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfd2F5cwPZOUFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZS0FpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2VBNYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfd2F5cwPZTU1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfcmFuZG9taXplwtk/TWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3w9k+U2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2TtNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2UZDcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5Adk+U3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2TRNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKW92ZXJyaWRlw9k6U3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd65MZWZ0IEFuZCBSaWdodNkuTW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd6ZTdGF0aWPZPUdsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldDIA2UxTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZq1mcmVlX3N0YW5kaW5nwtlFTW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQyAKhmYWxsX2RtZ8LZPE1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF9saW1pdDzZRk1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2T9TbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2UJBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2T5TbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXllZMLZRUdsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfd2F5cwPZR1N0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9lFQWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0ANk2U2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3w9k5U2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X2xpbWl0PNk+U2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnORpkppdHRlctlDU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZQFNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpb3ZlcnJpZGXD2TNNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXfD2TtTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd6ZSYW5kb23ZSVNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2UhTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldDIA2UlTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQyANlHU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQA2UJNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19zd2FwX2RlbGF5ZWTC2UhTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5ZWTC2UZTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5AdlEU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKoRGlzYWJsZWTZS1Nsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldADZUlNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2VFTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2U5TbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2UBTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3w9lCU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X2xpbWl0PNlDU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF9saW1pdDzZSFNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2TxNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19zd2FwX2RlbGF5ZWTC2T9Nb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2UZNYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdlAQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZP1N0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0MgDZSFN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0MgDZRk1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2UlDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0ANlJQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXllZMLZPlN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQyANlBQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXfD2U1BaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0MgDZTEFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldDIA2U1BaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZU0Nyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANlMQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldACxY29uZGl0aW9uYWxfdGVhbXOhVNk3TW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcqhEaXNhYmxlZNk8QWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X2xpbWl0PNlLQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9lDQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZNUFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3plN0YXRpY9k6QWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcPZSEFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZPU1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpb3ZlcnJpZGXD2UJBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2TVBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcqhEaXNhYmxlZNk3QWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQTZOUFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXllZMLZOUFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldBfZOEFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V08dk5QWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQy8dkxQWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcPZTU1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZSE1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF9saW1pdDzZR01vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X2xpbWl0PNlFTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3w9lJTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcqhEaXNhYmxlZNlLTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5AdlNTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5ZWTC2UlTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJhbmRvbV95YXdfb2Zmc2V0ANk8TW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZPU1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2TdTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X2xpbWl0PNlDU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZNU1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3w9k9U3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2TdNYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X2xpbWl0PNk/U3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0ANk4TWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82TZNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82T5TdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZQUdsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtlIU3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQyANk9U3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilwaXRjaKdFeHBsb2l02UNDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X2xpbWl0PNlHTW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2ThNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcqhEaXNhYmxlZNlHTW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldDIA2TNNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpb3ZlcnJpZGXD2T1Nb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X2xpbWl0PNlQTWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2UhTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5ZWTC2T9NYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpb3ZlcnJpZGXC2URTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX3JhbmRvbWl6ZcLZRk1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5ZWTC2UpTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldADZNU1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X2xpbWl0PNlATW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZUFN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9lNU3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2UdTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZR1N0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfc3dhcF9kZWxheWVkwtlGTW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZQ1N0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKoRGlzYWJsZWTZQlN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF9saW1pdDzZLkdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXeuTGVmdCBBbmQgUmlnaHTZPEdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZPVNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQA2TtHbG9iYWxUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZO0dsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheWVkwtk7U2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2T5TbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZS01hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZREdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdk1TW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXemU3RhdGlj2UFHbG9iYWxUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX3JhbmRvbWl6ZcLZQ01vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2UdTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZUk1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2TtHbG9iYWxUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5DZR1Nsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdlHU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2UhDcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldDIA2T9NYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2UlDcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQyANlCQWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0ANlFTWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9lCTWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfcmFuZG9taXplwtk4U2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82T1TbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXBpdGNop0V4cGxvaXTZPVNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnORpkppdHRlctlJQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZQlNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZR0Nyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0ANk8TWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19vcHRpb25zkNlIQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0ANk9QWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF9saW1pdDzZSENyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXllZMLZSFNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZNEFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXemU3RhdGlj2TtNYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilwaXRjaKREb3du2UBBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V07dlIU2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0ANk2TW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X2xpbWl0PK1hbmltX2JyZWFrZXJzwtlCTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQy4dk2U2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKW92ZXJyaWRlw9lDTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0MiGyYW5pbV9icmVha2Vyc19saXN0kNlDTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVyumFuaW1icmVha2VyX2ppdHRlcl9zbGlkaW5nwtkyQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXemU3RhdGlj2T5Dcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfeWF3X29mZnNldOTZO01vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXBpdGNop0V4cGxvaXSvbW92ZV9sZWFuX3ZhbHVlGdk3Q3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcPZVk1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANkzR2xvYmFsVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3w9k/U2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0ANlNTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2UxNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQyAKhob21lcGFnZZCndmlzdWFsc94AI7JzY29wZV9vdmVybGF5X3NpemVksXZpZXdtb2RlbF9jaGFuZ2VywrV2aWV3bW9kZWxfY2hhbmdlcl9mb3ZEsXNjb3BlX292ZXJsYXlfZ2FwBbN2aWV3bW9kZWxfY2hhbmdlcl95ZLpzY29wZV9vdmVybGF5X2FjY2VudF9jb2xvcqhGRkZGRkZGRrpzY29wZV9vdmVybGF5X2JyZWF0aF9jb2xvcqhGRkZGRkYwMK1ub3RpZmljYXRpb25zwq1tYW51YWxfYXJyb3dzwq1zY29wZV9vdmVybGF5wqlmcHNfYm9vc3TCsmZpcmVkX25vdGlmeV9jb2xvcqg5NkM4M0NGRrJ3YXRlcm1hcmtfcG9zaXRpb26lUmlnaHSpZ2FtZXNlbnNlw6thaW1ib3RfbG9nc8KmYWNjZW50qDk2QzgzQ0ZGp3I4X2hlbHDDuWNlbnRlcmVkX2luZGljYXRvcnNfY29sb3KoRkZGRkZGRkaxbWlzc19ub3RpZnlfY29sb3KoOTZDODNDRkaybWFudWFsX2Fycm93c190eXBlp0RlZmF1bHSwaGl0X25vdGlmeV9jb2xvcqg5NkM4M0NGRrRtYW51YWxfYXJyb3dzX2NvbG9yMag5NkM4M0NGRr1tYW51YWxfYXJyb3dzX2NvbG9yMV9kaXNhYmxlZKgwMDAwMDA5NrN2aWV3bW9kZWxfY2hhbmdlcl960Jy0bWFudWFsX2Fycm93c19jb2xvcjKoOTZDODNDRkaybWFudWFsX2Fycm93c19zaXplGbN2aWV3bW9kZWxfY2hhbmdlcl94zM22bWFudWFsX2Fycm93c19pbnZlcnRlZMKzc2NvcGVfb3ZlcmxheV9zdHlsZadEZWZhdWx0tGFzcGVjdF9yYXRpb19jaGFuZ2Vyw7NjZW50ZXJlZF9pbmRpY2F0b3Jzwrphc3BlY3RfcmF0aW9fY2hhbmdlcl92YWx1ZcyEtnNjb3BlX292ZXJsYXlfc2V0dGluZ3OQq3Nsb3dlZF9kb3duwq1nc19pbmRpY2F0b3JzmqRPU0FBokRUokZTok1EpFNBRkWkRFVDS6RQSU5HokRBrUhJVENIQU5DRSBPVlKkQk9EWQ=="
    };
    v407 = l_base64_0.decode(v9.hidden_configs_def.Defensive);
    local v436 = msgpack.unpack(v407);
    v9.hidden_configs_def.Defensive = v436;
    v9.hidden_configs_meta = {
        Meta = "haRtaXNjibJhdXRvcGVla19oaXRncm91cHOVAQIDBAWtYWlfcGVla19kZWJ1Z8KsdW5sb2NrX3NwaWtlAKtjaGVhdF9yZXZlbMOnYWlfcGVla8KuYWlfcGVla19ub3RpZnnCs2F1dG9wZWVrX3BlcmZvbWFuY2Uep2NsYW50YWfCr2F1dG9wZWVrX3NhZmV0eQioaG9tZXBhZ2WQp3Zpc3VhbHPeACirYWltYm90X2xvZ3PCp3I4X2hlbHDCs2NlbnRlcmVkX2luZGljYXRvcnPCqWluZF9zdHlsZaZNb2Rlcm6mYWNjZW50qEYwRjBGMDhDrnBsdXNfaGl0bWFya2VywrNzY29wZV9vdmVybGF5X3N0eWxlp0RlZmF1bHS0cGx1c19oaXRtYXJrZXJfY29sb3KoNThGRkQxRka9bWFudWFsX2Fycm93c19jb2xvcjFfZGlzYWJsZWSoRkZGRkZGOTaqbGVnYWN5X2luZMK2c2NvcGVfb3ZlcmxheV9zZXR0aW5nc5CwaGl0X25vdGlmeV9jb2xvcqg2RTZFNkVGRrN2aWV3bW9kZWxfY2hhbmdlcl960NO6YXNwZWN0X3JhdGlvX2NoYW5nZXJfdmFsdWXMhLJtYW51YWxfYXJyb3dzX3R5cGWnRGVmYXVsdK1ub3RpZmljYXRpb25zwrRtYW51YWxfYXJyb3dzX2NvbG9yMahENTE2MTZGRrljZW50ZXJlZF9pbmRpY2F0b3JzX2NvbG9yqEZGRkZGRkZGunNjb3BlX292ZXJsYXlfYWNjZW50X2NvbG9yqEZGRkZGRjg3unNjb3BlX292ZXJsYXlfYnJlYXRoX2NvbG9yqEZGRkZGRjAwtG1hbnVhbF9hcnJvd3NfY29sb3IyqDk2QzgzQ0ZGsm1hbnVhbF9hcnJvd3Nfc2l6ZRmrc2xvd2VkX2Rvd27Ctm1hbnVhbF9hcnJvd3NfaW52ZXJ0ZWTDqWdhbWVzZW5zZcKpZnBzX2Jvb3N0wrJzY29wZV9vdmVybGF5X3NpemXMm61nc19pbmRpY2F0b3JzkaJGU7JmaXJlZF9ub3RpZnlfY29sb3KoNkU2RTZFRka0YXNwZWN0X3JhdGlvX2NoYW5nZXLDqmtlZXBfc2NvcGXDrXNjb3BlX292ZXJsYXnCsXNjb3BlX292ZXJsYXlfZ2FwALF2aWV3bW9kZWxfY2hhbmdlcsK1dmlld21vZGVsX2NoYW5nZXJfZm92OrN2aWV3bW9kZWxfY2hhbmdlcl94LbN2aWV3bW9kZWxfY2hhbmdlcl950NOtbWFudWFsX2Fycm93c8Kyd2F0ZXJtYXJrX3Bvc2l0aW9upkJvdHRvbbFtaXNzX25vdGlmeV9jb2xvcqg2RTZFNkVGRqJhYd4Cv9lGQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZOk1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkE2TxNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQn2ThDcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF9saW1pdDzZO0Nyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVypkNlbnRlctlCQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V04dk9TW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldAbZSFN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2UZTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdlSU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZSVN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQK2UZNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJhbmRvbV95YXdfb2Zmc2V0ANlHU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2VVBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANlBU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2TBTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXeuTGVmdCBBbmQgUmlnaHTZNUdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X2xpbWl0PNlGTWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2TlHbG9iYWxUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2UZTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V06NlFTWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdlGR2xvYmFsQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZOE1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVypE5vbmXZUkNyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2TtHbG9iYWxDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfeWF3X29mZnNldADZP1N0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd8PZQ01vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2T9Nb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXKkTm9uZdlGQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZREFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3w9lSQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX3JhbmRvbWl6ZcLZVUFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2VVBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdlWQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2U9BaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V00L3ZSEFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcqROb25l2UpBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZPkFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3qFNwaW4gQm902VJDcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANk6TW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcPZOk1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcGl0Y2ikRG93btlBTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXTn2ThNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd6hTcGluIEJvdNk2U3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3w9lBQWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2ThTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF9saW1pdDzZOUFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2TlTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82TtBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilvdmVycmlkZcLZOEFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXBpdGNopERvd27ZNkFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd65MZWZ0IEFuZCBSaWdodNlEQWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2URBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZQkFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldADZQ0FpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQA2UhNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXTQsNk7QWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfbGltaXQ82U9Nb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANlOTW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdlAQWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZTk1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfd2F5cwPZR01vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtlLTW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfcmFuZG9taXplwtlFQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVypE5vbmXZPU1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXfD2UxBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdk/TW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X2xpbWl0PNlMQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZQE1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfbGltaXQ82UVNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnORpkppdHRlctk0TW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd8PZSk1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtk9QWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF9saW1pdDy0Zm9yY2VfZGVmZW5zaXZlX2NvbmSVqFNsb3d3YWxrqUNyb3VjaGluZ61Nb3ZlICYgQ3JvdWNoo0FpcqxBaXIgJiBDcm91Y2jZQlN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZUVNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQHZRFN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVypkNlbnRlcrBhdXRvX2xhZ19leHBsb2l0qERpc2FibGVk2UdNYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2U1BaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZPFN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilwaXRjaKREb3du2T5TbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZImNvbmRpdGlvbl9jb21ib19UY29uZGl0aW9uYWxfdGVhbXOoU3RhbmRpbmfZTU1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0ANlIU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANlMU2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZNkNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcPZQ1Nsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKkTm9uZdlHQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2VFTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2T5Dcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldCXZOUNyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF9saW1pdDzZN0Nyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXfD2UVDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2UhDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2UhDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2UlDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANk9Q3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZQ0Nyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2T9Dcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQl2TZHbG9iYWxDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfbGltaXQ82UdTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZO01vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V06Nk2U3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKW92ZXJyaWRlw9lMTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldADZTUNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtk9U3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZQE1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXeoU3BpbiBCb3TZOlN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXKkTm9uZdlRU3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANlJTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX3JhbmRvbWl6ZcLZRE1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKW92ZXJyaWRlwtk0R2xvYmFsQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd8PZQFNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXT72URBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldPfZP1N0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilvdmVycmlkZcLZPFNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfeWF3X29mZnNldOnZP0Nyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldAXZSEFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX3JhbmRvbWl6ZcLZPEFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldADZTEFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2VBNYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfd2F5cwPZUk1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2T9NYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXfD2T5TbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZO01vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZRkNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2T5TdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZNE1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpb3ZlcnJpZGXD2TpTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3rkxlZnQgQW5kIFJpZ2h02S5Nb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3rkxlZnQgQW5kIFJpZ2h02UFBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQHZTFN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2ZmrWFjdGl2ZV9wcmVzZXQB2TxNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2TxNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfbGltaXQ82UZNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0Btk/U2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJhbmRvbV95YXdfb2Zmc2V0ANlDQWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5DZTE1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnORpkppdHRlctlFR2xvYmFsQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9lHU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2UxBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9k2U2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3w9k9TW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF9saW1pdDzZPlNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZQ1Nsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2UBTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKW92ZXJyaWRlwtkzTW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3w9lBU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXT72UlTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0ANlFTW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yB9lBTWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2UdTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldADZNE1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpb3ZlcnJpZGXD2UZNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X2xpbWl0PNlGU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZRFNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVypE5vbmXZS1Nsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldADZUlNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2VFTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2U5TbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2UBTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3w9lCU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X2xpbWl0PNlDU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF9saW1pdDzZSFNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5DZOUFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcPZQU1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXBpdGNopERvd27ZRk1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2T9Nb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXeoU3BpbiBCb3TZQUFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0Jdk1U2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXfD2UhTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2UlDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0ANlFU2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5AdlBQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXfD2TVTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcPZQ01hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2UJNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnORpkppdHRlctk5U2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVypkNlbnRlctlMQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldADZN01vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXKmQ2VudGVy2TVTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcPZPFN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZQ0FpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQI2T5Nb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF9saW1pdDzZOkFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpb3ZlcnJpZGXD2VJDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9k9TW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilvdmVycmlkZcLZQkFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQHZNUFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVypE5vbmXZP1N0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZRlN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfc3BlZWQB2TlBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQA2TpNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X3NwZWVkAdlQTWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2URNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19zcGVlZATZR01vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtk8U2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X3NwZWVkAdk/U2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtlATW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZSU1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKmQ2VudGVy2UtNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2URNYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19zcGVlZATZSVN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2TxNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnORpkppdHRlctk9TW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZSkFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X3NwZWVkAdlDU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZNU1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3w9k/R2xvYmFsQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0ANk3TWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF9saW1pdDzZR01hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANk4TWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82TZNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82UpDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZQUdsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtlCTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXBpdGNopERvd27ZSFN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZQ0Nyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfbGltaXQ82URNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfd2F5cwPZOU1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19zcGVlZAHZPE1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZQ01vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfc3BlZWQE2UZNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtlOQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtk7TW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpb3ZlcnJpZGXD2TZNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXeuTGVmdCBBbmQgUmlnaHTZRE1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0ANlKTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfc3BlZWQB2ThHbG9iYWxDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcqROb25l2TVNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF9saW1pdDzZQE1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2TpNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3w9lBTW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2UdNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZP1Nsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd8PZRk1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQA2UNTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyoNlAU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd8PZLkdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXeuTGVmdCBBbmQgUmlnaHTZPVN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQA2T1TbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0L9k7R2xvYmFsVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQA2TtTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZPlNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0L9lLTWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtlER2xvYmFsVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2UNDcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X2xpbWl0PNlBR2xvYmFsVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2U5Dcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2UBTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V00M3ZUUNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfd2F5cwPZOk1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXTo2UdTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQHZPk1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0B9k5U3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVypkNlbnRlctk/TWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0ANlOU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfcmFuZG9taXplwtk+TW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpb3ZlcnJpZGXC2UBDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJhbmRvbV95YXdfb2Zmc2V0ANk+U3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQK2T1TbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXBpdGNopERvd27ZSENyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldADZQk1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZPENyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd65MZWZ0IEFuZCBSaWdodNk5TWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVypE5vbmXZN01vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82TxHbG9iYWxDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnOQ2TdHbG9iYWxDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X2xpbWl0PNlFQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X2xpbWl0PNlRQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfcmFuZG9taXplwtlUQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9lOQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V00L3ZR0FpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVypkNlbnRlctk9U2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfeWF3X29mZnNldOnZSUFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2UpDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZPUdsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2UFNYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZT0Nyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2UJNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2UVNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2UZNYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9lJQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2URNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZQ01hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKkTm9uZdlKTWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2TlNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXeuTGVmdCBBbmQgUmlnaHTZRE1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5AdlPTW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQHZT01vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2T5Nb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd8PZRk1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnOQ2UtNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2TxTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2UJHbG9iYWxDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2UdBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF9saW1pdDzZQEdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2URHbG9iYWxUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfd2F5cwPZRUdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZPkdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0ANlCTW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVypE5vbmXZPEFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF9saW1pdDzZPEdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZS0FpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldADZSkNyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0ANlRQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZrphbmltYnJlYWtlcl9qaXR0ZXJfc2xpZGluZ8PZOkNyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82T9Dcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnORpkppdHRlctlEQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2UFDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilvdmVycmlkZcLZPkNyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXBpdGNopERvd27ZTVNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZqlhdXRvX2R1Y2vC2TdNYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X2xpbWl0PKhmYWxsX2RtZ8LZTE1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2UNNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJhbmRvbV95YXdfb2Zmc2V0ANkxU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd65MZWZ0IEFuZCBSaWdodNlFTW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9k/U2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKW92ZXJyaWRlwtk8R2xvYmFsQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0ANk9R2xvYmFsQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZS0FpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZNEFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXKkTm9uZdlAQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilwaXRjaKlGYWtlIERvd27ZS0FpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgCwc2FmZWhlYWRfdHJpZ2dlcpGoU3RhbmRpbmfZQk1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfeWF3X29mZnNldOfZQ01vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQp2UFNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZRk1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXTn2U1Nb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgPZQUFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0ANk7TW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXfD2TdHbG9iYWxUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVypE5vbmXZO1N0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3qFNwaW4gQm902U5Nb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2UVNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXTn2UtBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2UtBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2VBNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldNC92VdNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2VZNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQGyYWN0aXZlX21pc2NfdmlzdWFsAtlTTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2UJBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQI2UJBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2SxBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd65MZWZ0IEFuZCBSaWdodNk6QWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZOlNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXeuTGVmdCBBbmQgUmlnaHTZP0FpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQPZQUFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZQ0FpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2S9HbG9iYWxDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd65MZWZ0IEFuZCBSaWdodNlCQWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9k/QWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfcmFuZG9taXplwtkxQWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd8PZM0FpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF9saW1pdDzZNEFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ8sGF2b2lkX2NvbGxpc2lvbnPCq2Zhc3RfbGFkZGVywtlGU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19zcGVlZATZSVNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV9zcGVlZF9yYW5kb23C2U1BaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZPUNyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfc3BlZWQB2UBDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtlGQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19zcGVlZATZSUNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV9zcGVlZF9yYW5kb23C2UdDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19zcGVlZATZQE1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfc3BlZWQB2UNNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtlBTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfc3BlZWQB2URNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZTk1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZOkFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV9zcGVlZF9yYW5kb23C2UFBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19zcGVlZATZTU1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtk2QWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X3NwZWVkAdk5QWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtlAQWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19zcGVlZATZQ0FpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV9zcGVlZF9yYW5kb23C2T9BaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfc3BlZWQB2UJBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV9zcGVlZF9yYW5kb23C2UlBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X3NwZWVkAdlMQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZR0Nyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0ANk8TWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZSENyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZPUFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfbGltaXQ82UhTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQA2TRBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3rkxlZnQgQW5kIFJpZ2h02TtNYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilwaXRjaKREb3du2UBBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V07dlIU2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0ANk2TW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X2xpbWl0PNk2U2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKW92ZXJyaWRlw9lDTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2TJDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd65MZWZ0IEFuZCBSaWdodNk+Q3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXTh2TtNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilwaXRjaKREb3du2TdDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKW92ZXJyaWRlw9lWTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2UlTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJhbmRvbV95YXdfb2Zmc2V0ANk/U2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0ANlNTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2UxNYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtlCU3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtlDQWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZMFNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd65MZWZ0IEFuZCBSaWdodNk3U2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF9saW1pdDzZTEFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2TlBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXfD2UdBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX3JhbmRvbWl6ZcLZSU1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2UJNYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKkTm9uZdlCTWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X2xpbWl0PNk2TWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X2xpbWl0PNk0TWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd8PZTU1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0CtlGU2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQHZRlNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2UxNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0ANlKQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2TVNYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcPZUU1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZOFNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X2xpbWl0PNlATWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldB/ZTE1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2URTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX3JhbmRvbWl6ZcLZQU1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X2xpbWl0PNk+U3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnORpkppdHRlctlATWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZT01hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2U9NYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9lMTWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX3JhbmRvbWl6ZcLZPk1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKW92ZXJyaWRlw9lRU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9k+QWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKkTm9uZdk9QWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcqZDZW50ZXLZNkNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd8PZPkFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X2xpbWl0PNlCQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0JdlAQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQPZRUFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldCPZS0FpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQHZOkFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXfD2URNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQHZQU1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVypE5vbmXZRU1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZRE1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0ANlNTWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2UFNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX3JhbmRvbWl6ZcLZOlNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXKmQ2VudGVy2TlNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2TtNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldCfZPE1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldAbZU0Nyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANlOTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0CtlAU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilvdmVycmlkZcLZPE1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilwaXRjaKREb3du2SNjb25kaXRpb25fY29tYm9fQ1Rjb25kaXRpb25hbF90ZWFtc6hTdGFuZGluZ9kzTW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKW92ZXJyaWRlw9lQU3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2TpHbG9iYWxUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0ANk/U3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJhbmRvbV95YXdfb2Zmc2V0ANlFU3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X3NwZWVkBNlHU3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnORpkppdHRlctlHU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2UJTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfbGltaXQ82UFTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZTVN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfcmFuZG9taXplwtlKU3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXT92UVTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2UdTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldBjZSFN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZSFN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZQkFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5DZPlN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtk7U3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfc3BlZWQB2T1TdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZN1N0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfbGltaXQ82TVTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd8PZQ1N0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2UZTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9lHU3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IK2TtTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZPFN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfeWF3X29mZnNldADZR01hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtlBTWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfbGltaXQ82T5NYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd8PZOk1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfc3BlZWQE2UJNYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2UVNYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2UZNYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANk5R2xvYmFsVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X3NwZWVkBNk2R2xvYmFsVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X2xpbWl0PNkzR2xvYmFsVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3w9k8R2xvYmFsVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0ANlMQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2T9BaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXeoU3BpbiBCb3TZQUFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXBpdGNopERvd27ZREFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKW92ZXJyaWRlwtlHQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2UNBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtlAQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19zcGVlZAHZQkFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2TxBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfbGltaXQ82UhBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2UtBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2T5BaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcqROb25l2TVBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd65MZWZ0IEFuZCBSaWdodNlWTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2UhBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2URBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZO0FpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3w9k9QWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZSUFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2U1BaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZRkFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2T9BaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKkTm9uZdlBQWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2T5BaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZN0FpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfc3BlZWQB2TdBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19zd2FwX2RlbGF5Adk4QWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQA2TpBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0ANkxQWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcPZTEFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQA2UtNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfc3BlZWQB2U1Nb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2UhNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfbGltaXQ82UdNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZRU1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd8PZPEdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZRU1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilvdmVycmlkZcLZSE1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZQ1N0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfbGltaXQ82UhTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQA2T1NYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZRU1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldADZRUdsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQHZOkdsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfc3BlZWQE2T9TdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2URTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX3JhbmRvbWl6ZcLZP01hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilvdmVycmlkZcPZL01vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3rkxlZnQgQW5kIFJpZ2h02ThNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcqROb25l2T1NYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtlHTW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2UtTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXTp2T1TdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXBpdGNopERvd260YXZvaWRfY29sbGlzaW9uc19kc3QI2T5TdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZMVN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXeuTGVmdCBBbmQgUmlnaHTZPUdsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV9zcGVlZF9yYW5kb23C2VBNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZSU1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2T1Nb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtlJU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZPFN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19zcGVlZAHZSE1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZRU1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19zcGVlZATZPk1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtk7TWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfc3BlZWQE2UZNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANlNU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2ZmsWNvbmRpdGlvbmFsX3RlYW1zokNU2UZTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5Adk7U2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXeuTGVmdCBBbmQgUmlnaHS1YXZvaWRfY29sbGlzaW9uc19kdWNrwtlQTWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2TpHbG9iYWxDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19zd2FwX2RlbGF5AdlEQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfbGltaXQ82UxNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9lHU2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2UNTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfcmFuZG9taXplwtk4U2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82T1TbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZO1Nsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X3NwZWVkAdk+U2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV9zcGVlZF9yYW5kb23C2UJTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2ThTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF9saW1pdDzZPFNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilwaXRjaKREb3du2UhTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2UZTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0ANlKU2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2VFTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2VBTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQHZUFNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9lNU2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2UFTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZQlNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF9saW1pdDzZR1Nsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19vcHRpb25zkNlFU2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X3NwZWVkBNlIU2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtk9TW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF9saW1pdDzZMUNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXeuTGVmdCBBbmQgUmlnaHTZP0Nyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZPUNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXTh2TpDcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVypkNlbnRlctlBQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXTh2UhDcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2UdDcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX2RlbGF5ZWRfdGltZQHZR0Nyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9lEQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXC2TlDcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82T5Dcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2TxDcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfc3BlZWQB2T9Dcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV9zcGVlZF9yYW5kb23C2UNBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJhbmRvbV95YXdfb2Zmc2V0ANlAQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilvdmVycmlkZcLZPUNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcGl0Y2ikRG93btk7Q3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXeoU3BpbiBCb3TZSUNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQG2UlDcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJhbmRvbV95YXdfb2Zmc2V0ANlEQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKg2UtDcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXTQudlRQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdlAQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd8PZQkNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZSENyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2TVNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd65MZWZ0IEFuZCBSaWdodNlDTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZQk1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldCnZQE1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2T5Nb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcqZDZW50ZXLZTE1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3ID2UtNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2UtNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2UhNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9yYW5kb21pemXCtmZyZWVzdGFuZGluZ19kaXNhYmxlcnOQsWJhY2tzdGFiX2Rpc3RhbmNlzQETrmF2b2lkX2JhY2tzdGFiw6tmbGlja19yaWdodFqqZmxpY2tfbGVmdNDYrWZsaWNrX2V4cGxvaXTCr3NhZmVoZWFkX2hlaWdodEqoc2FmZWhlYWTCs290aGVyX2Fpcl9oaXRjaGFuY2UAtXBpc3RvbHNfYWlyX2hpdGNoYW5jZQC2cmV2b2x2ZXJfYWlyX2hpdGNoYW5jZQCzc2NvdXRfYWlyX2hpdGNoYW5jZTy4YWlyX2hpdGNoYW5jZV9hY3RpdmVfd3BzkaVTY291dK1haXJfaGl0Y2hhbmNlwq9tb3ZlX2xlYW5fdmFsdWUysmFuaW1fYnJlYWtlcnNfbGlzdJEBrWFuaW1fYnJlYWtlcnPD2TtHbG9iYWxUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5DZUEFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtlLQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZRkFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfbGltaXQ82UdTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldADZQ0FpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXfD2VRBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3RpbWUB2UpBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldADZQ0FpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpb3ZlcnJpZGXC2UxBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0CtlKQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2UdBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmanbWFudWFsc6hEaXNhYmxlZNk8QWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X2xpbWl0PNk6QWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd8PZRUFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldNCQ2UJBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQA2UNBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0ANk1QWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXeoU3BpbiBCb3TZN0FpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcGl0Y2ikRG93btk6QWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilvdmVycmlkZcLZPUFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2ThBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2TNBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82TJBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF9saW1pdDzZMEFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd8PZPkFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfcmFuZG9taXplwtlCQWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANk7QWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2TZBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2ThBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZN0FpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQA2TlBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2TlBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2StBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3rkxlZnQgQW5kIFJpZ2h02TBBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpb3ZlcnJpZGXD2VFNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2UdNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF9saW1pdDzZRE1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3w9lSTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX3JhbmRvbWl6ZcLZVU1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9kZWxheWVkX3dheXMD2VVNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF90aW1lAdlPTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldNCy2UhNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKmQ2VudGVy2UpNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZS01vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldADZUFN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfZGVsYXllZF93YXlzA9lNQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2UBDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0Bdk/TW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V00MLZOVNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF9saW1pdDzZPENyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZQUFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V07a1jb25maWdfc3lzdGVtgapjbG91ZF9saXN0AQ=="
    };
    v407 = l_base64_0.decode(v9.hidden_configs_meta.Meta);
    v436 = msgpack.unpack(v407);
    v9.hidden_configs_meta.Meta = v436;
    v9.hidden_configs = {
        Aggresive = "haJhYd4CWdlJQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZR0Nyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X3NwZWVkBNlATW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19zcGVlZAHZQ01vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV9zcGVlZF9yYW5kb23C2UFNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19zcGVlZAHZRE1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtlOTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtk6QWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZQUFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X3NwZWVkBNlNTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV9zcGVlZF9yYW5kb23C2TZBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfc3BlZWQB2TlBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV9zcGVlZF9yYW5kb23C2TdTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X2xpbWl0PNlDQWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZP0FpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19zcGVlZAHZQFNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXT72UFTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZLk1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXeuTGVmdCBBbmQgUmlnaHTZR1N0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZPlN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtk7U3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfc3BlZWQB2UdNYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZOk1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfc3BlZWQE2UBNYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0H9lDQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZQlN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZOUFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldBvZN0FpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfc3BlZWQB2TVTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd8PZR01hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZOkdsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfc3BlZWQE2T1NYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtk9R2xvYmFsQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZPU1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV9zcGVlZF9yYW5kb23C2UlTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtlBTWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfbGltaXQ82UhNYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV9zcGVlZF9yYW5kb23C2ThBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfeWF3X29mZnNldOrZPk1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtk0R2xvYmFsQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd8PZRk1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnORpkppdHRlctk+U2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQA2UtNYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2UhTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV9zcGVlZF9yYW5kb23C2TVNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd65MZWZ0IEFuZCBSaWdodNk8U2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19zd2FwX2RlbGF5AdlDTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZOlNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXKkTm9uZdlBU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQAq2ZsaWNrX3JpZ2h0WtlJQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZNlNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd8PZR0Nyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5AdlMQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldADZU0Nyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANlHU3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IK2UdTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldADZR1Nsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19vcHRpb25zkNlRQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtlHQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfbGltaXQ82UxNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0ANlFTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKW92ZXJyaWRlw9k5Q3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X2xpbWl0PNlCTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXBpdGNopERvd27ZO01vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0ANlIQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVypE5vbmXZOENyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X2xpbWl0PNkxQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd65MZWZ0IEFuZCBSaWdodNlMQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZP0FpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd65MZWZ0IEFuZCBSaWdodNlBQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcGl0Y2ikRG93btlEQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpb3ZlcnJpZGXC2UdBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZQkFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2T1BaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X2xpbWl0PNlHTW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2TpBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3w9lJTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcqhBZGRpdGl2ZdlLTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5AdlBQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXTh2UVBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2TlTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82ThTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF9saW1pdDzZPENyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZQUFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V06Nk4TW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXKoQWRkaXRpdmXZQ0FpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnOQ2T1BaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X2xpbWl0PNlBR2xvYmFsQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2TpHbG9iYWxUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0ANlDQWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZPEFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldCfZNUFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyqEFkZGl0aXZl2TdBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19zd2FwX2RlbGF5Adk2TWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X2xpbWl0PNk8U2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V06dlCTWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVypE5vbmXZQENyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2T1TbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0ANlATWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZPk1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3w9lSQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZS0Nyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldNC52UFNYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF9saW1pdDzZSlNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0ANlRU2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANk7Q3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXeoU3BpbiBCb3TZOU1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd65MZWZ0IEFuZCBSaWdodNlIU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19vcHRpb25zkNlITW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyqEFkZGl0aXZl2UhNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfbGltaXQ82UdNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZRU1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd8PZOk1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2TxNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQA2T1Nb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0BtlXTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANlQTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXTQrtlSU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZSVN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQK2UhTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2UFTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldADZRVNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZN01vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXKoQWRkaXRpdmXZQk1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZOU1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcqROb25l2TVNYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcPZPEdsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5DZN0dsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82TZHbG9iYWxDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfbGltaXQ82UZHbG9iYWxDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANk6R2xvYmFsQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZPEdsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZO0dsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0ANk9R2xvYmFsQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZS0FpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2URNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd8PZP01vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcqhBZGRpdGl2Zdk8TW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZP1Nsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilvdmVycmlkZcLZPU1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfbGltaXQ82UhNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2TpTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3rkxlZnQgQW5kIFJpZ2h02UBNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3rkxlZnQgQW5kIFJpZ2h02U5Nb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQK2UZTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0ANlHU2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQA2UpTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldP3ZRE1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5AdlRU3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANk/U3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3w9lCU3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X2xpbWl0PNkjY29uZGl0aW9uX2NvbWJvX0NUY29uZGl0aW9uYWxfdGVhbXOoU3RhbmRpbmfZPk1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVypE5vbmXZO01vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZTFN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2UFNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF9saW1pdDzZRk1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnOQ2TNNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpb3ZlcnJpZGXD2TpNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3w9kvR2xvYmFsQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXeuTGVmdCBBbmQgUmlnaHTZPE1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldAbZPU1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpb3ZlcnJpZGXC2TpNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0Btk6TW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilwaXRjaKREb3dutGZvcmNlX2RlZmVuc2l2ZV9jb25klahTdGFuZGluZ6hTbG93d2Fsa6lDcm91Y2hpbmetTW92ZSAmIENyb3VjaKNBaXLZQENyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpb3ZlcnJpZGXC2SxBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd65MZWZ0IEFuZCBSaWdodNk9Q3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilwaXRjaKREb3du2TpBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0CtlQQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2UZBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X2xpbWl0PNlFQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X2xpbWl0PNlDQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd8O0YXZvaWRfY29sbGlzaW9uc19kc3QI2VVBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yKalhdXRvX2R1Y2vC2UdBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcqROb25l2UlBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5AdlLQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0ANlKQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQA2UxBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0Ctk+QWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXeoU3BpbiBCb3TZQEFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcGl0Y2ikRG93btlDQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilvdmVycmlkZcLZK0FpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXeuTGVmdCBBbmQgUmlnaHStYWN0aXZlX3ByZXNldAGuYXZvaWRfYmFja3N0YWLDsWNvbmRpdGlvbmFsX3RlYW1zoVSyYWN0aXZlX21pc2NfdmlzdWFsAtlJU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZQ0FpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2UxBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJhbmRvbV95YXdfb2Zmc2V0ANlGTW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZSFNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZP0Nyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZPE1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZSFN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZP1N0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZQENyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2UpDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZPUdsb2JhbENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2URNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZPEdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZQ01vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2U5Nb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2UJBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2TpBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJhbmRvbV95YXdfb2Zmc2V0ANlEQWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2UNBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJhbmRvbV95YXdfb2Zmc2V0ANlJQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZOUFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZPlNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJhbmRvbV95YXdfb2Zmc2V0ANk+U3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2T9TbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2U1BaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyYW5kb21feWF3X29mZnNldADZSVN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2T1Nb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJhbmRvbV95YXdfb2Zmc2V0ANlWQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2UhTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2TtNYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19zcGVlZATZPlNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZL01vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3plN0YXRpY9lCTWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X2xpbWl0PNlEQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfbGltaXQ8p21hbnVhbHOoRGlzYWJsZWStYW5pbV9icmVha2Vyc8OyYW5pbV9icmVha2Vyc19saXN0kgED2T5TdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVyumFuaW1icmVha2VyX2ppdHRlcl9zbGlkaW5nw9k7TW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcGl0Y2ikRG93btlSU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZRU1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19zcGVlZATZO1Nsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X3NwZWVkAdk+U2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV9zcGVlZF9yYW5kb23C2UhTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2UFTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZRVNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19zcGVlZATZNkdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF9saW1pdDzZN0Nyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpb3ZlcnJpZGXD2VZNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZM0dsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd8PZTFNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2T9TbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2TZDcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpb3ZlcnJpZGXD2UdNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZP1Nsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd8PZRU1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldADZPE1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF9saW1pdDzZQFN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXfD2UJTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfbGltaXQ82UVNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2TVTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd8PZQE1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2TlTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXKkTm9uZdlCTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0H9k2U3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3w9lGTW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldAbZOFN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X2xpbWl0PNlDQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF9saW1pdDzZOVN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF9saW1pdDzZQENyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXfD2TlBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnORpkppdHRlctk+U2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2UNTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtlGQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZQ01vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQU2TlTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXKkTm9uZdk7U3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2UhNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXTQsNlAU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilvdmVycmlkZcPZPk1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKW92ZXJyaWRlwtk4QWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcGl0Y2ikRG93btk+U3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQK2TZBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXeuTGVmdCBBbmQgUmlnaHTZR01vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtlEQWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2TxDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXeuTGVmdCBBbmQgUmlnaHTZQkFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldADZSk1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5Adk/TW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X2xpbWl0PNlKTW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2UBNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X2xpbWl0PNk8U3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19zd2FwX2RlbGF5AdlBQWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2TRNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3w9k/QWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVypE5vbmXZQUNyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKW92ZXJyaWRlwtlLU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V06dk+Q3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcGl0Y2ikRG93btlNQWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2U1Nb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZNVNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKW92ZXJyaWRlw9lFTW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZMFNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd65MZWZ0IEFuZCBSaWdodNk9TWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2TtNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldAbZO0FpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3w9kuR2xvYmFsVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd65MZWZ0IEFuZCBSaWdodNk8R2xvYmFsVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0ANk9U2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldC/ZQlNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZPU1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXfD2UNTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X2xpbWl0PNk/Q3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0ENk+R2xvYmFsVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2T1Dcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19zd2FwX2RlbGF5Adk7Q3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXKoQWRkaXRpdmXZQkNyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldP3ZSUNyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IU2UFNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZNkFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZT01vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2TRBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVypE5vbmXZQU1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVypE5vbmXZO0FpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0I9lHTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfbGltaXQ82UJBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2TlDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfbGltaXQ82TpDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X2xpbWl0PNk/Q3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZRENyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtkyQWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfbGltaXQ82TNBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82ThBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2T1BaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtlCU2xvd3dhbGtUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtk3QWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilwaXRjaKREb3du2TVBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd6ZSYW5kb23ZQ0FpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2UFBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfeWF3X29mZnNldADZQkFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZNk1vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd65MZWZ0IEFuZCBSaWdodNlGTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldPbZPkFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVypE5vbmXZPVNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcGl0Y2ikRG93btlMQWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZN0FpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXTt2TtTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd65MZWZ0IEFuZCBSaWdodNlLTW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtlJU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZPEFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZPUFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfbGltaXQ82UJBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnOQ2UdBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZSFNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZNEFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXeuTGVmdCBBbmQgUmlnaHTZQ1Nsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKkTm9uZdlAQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfeWF3X29mZnNldPbZMkNyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3rkxlZnQgQW5kIFJpZ2h02UNNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5Adk+Q3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXT22T1BaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyqEFkZGl0aXZl2UtTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2UtBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IH2U1TbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmavbW92ZV9sZWFuX3ZhbHVlGdlFTW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0ANk5QWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3w9k7QWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfbGltaXQ8rWFpcl9oaXRjaGFuY2XDqHNhZmVoZWFkwtlGQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZma4YWlyX2hpdGNoYW5jZV9hY3RpdmVfd3BzkaVTY291dNlQTWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2UJNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKkTm9uZdlJTW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldACzc2NvdXRfYWlyX2hpdGNoYW5jZTy2cmV2b2x2ZXJfYWlyX2hpdGNoYW5jZQC1cGlzdG9sc19haXJfaGl0Y2hhbmNlALNvdGhlcl9haXJfaGl0Y2hhbmNlANk7TW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXfD2UhBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2U1Nb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvchTZNUFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3rkxlZnQgQW5kIFJpZ2h02UNBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0ALBzYWZlaGVhZF90cmlnZ2VykNlETW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQA2T5BaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF9saW1pdDzZOE1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3plJhbmRvbdk/R2xvYmFsQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0ANlATW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZR01hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANk1TWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXfD2UlDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZN01hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfbGltaXQ82T9TdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2ThNYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF9saW1pdDzZNk1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF9saW1pdDzZPlN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0ANlEU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKkTm9uZdk6U3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcqROb25l2UhTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQA2T1TdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXBpdGNopERvd27ZQ0Nyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfbGltaXQ8tmZyZWVzdGFuZGluZ19kaXNhYmxlcnORrEFpciAmIENyb3VjaNlKQ3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2T9NYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpb3ZlcnJpZGXC2UtBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQA2UFNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZPE1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilwaXRjaKREb3du2U1BaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldADZQ01hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKkTm9uZdk8U3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0ANlKTWFudWFsc0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2TVNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF9saW1pdDzZUU1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZPVN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQA2TNNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXfD2UJTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2T9TdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpb3ZlcnJpZGXC2UVTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfc3BlZWQE2TpTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3rkxlZnQgQW5kIFJpZ2h02UhTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2T9NYW51YWxzQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXfD2UdTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldBjZRlN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X3lhd19vZmZzZXTo2UVTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2UZNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0ANlDU3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcqROb25l2TxTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcGl0Y2ikRG93btk9U3RhbmRpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2ThTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF9saW1pdDzZTE1hbnVhbHNDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2UNTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X2xpbWl0PNlIQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANlCQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X2xpbWl0PNk+TW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXTQxtlNU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2UVNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IO2TZTdGFuZGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpb3ZlcnJpZGXD2UhDcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnORpkppdHRlctkxU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd6ZTdGF0aWPZOk1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpb3ZlcnJpZGXD2TdTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X2xpbWl0PNlBTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXT22U1Nb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2VJNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtlDU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZQ0Nyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2ThHbG9iYWxDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcqROb25l2TBBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXfD2TBTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXemU3RhdGlj2TFBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKW92ZXJyaWRlw9k0TW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcPZSU1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2TtNYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilwaXRjaKREb3du2T5NYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilvdmVycmlkZcPZQU1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfZnJlZXN0YW5kaW5no09mZtk3TWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF9saW1pdDzZPFNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilwaXRjaKREb3du2UZNYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANk0TWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcPZPEdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZOUdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19zcGVlZATZNUdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X2xpbWl0PNk3R2xvYmFsVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcqROb25l2TlHbG9iYWxUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2TtHbG9iYWxUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZImNvbmRpdGlvbl9jb21ib19UY29uZGl0aW9uYWxfdGVhbXOjQWly2UtNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfc3BlZWQB2T9Nb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXTQwtlMQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5DZRkFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWxlZnRfbGltaXQ82URBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd8PZT0FpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2UpBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZQEFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfc3BlZWQB2TxBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfbGltaXQ82UxBaXIgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANk+QWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXKkTm9uZdlAQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZQkFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldB7ZREFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtlGQWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldADZQ0FpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXJpZ2h0X3lhd19vZmZzZXQA2TtBaXJDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilvdmVycmlkZcLZNk1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF9saW1pdDzZQFNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpb3ZlcnJpZGXC2UZNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANlIU3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZPFN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19zcGVlZAHZRlN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X3N3YXBfZGVsYXkB2TRNYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3w9lAQWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd19zcGVlZATZOUFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcPZQkFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldA7ZQUFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0H9k/QWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19zd2FwX2RlbGF5CNlEQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXT22UxNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0CtlCQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtlOQWlyICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V00NTZSUFpciAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfc3BlZWQB2UxBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twq9zYWZlaGVhZF9oZWlnaHRKrWZsaWNrX2V4cGxvaXTCqmZsaWNrX2xlZnTQ2LFiYWNrc3RhYl9kaXN0YW5jZc0BE9k6QWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcOwYXV0b19sYWdfZXhwbG9pdKhEaXNhYmxlZLVhdm9pZF9jb2xsaXNpb25zX2R1Y2vC2TpBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3w9lFQWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V00JDZMUFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXfD2U1Dcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZM0FpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpbGVmdF9saW1pdDzZNEFpckNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82UBBaXJUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19zd2FwX2RlbGF5Adk+QWlyQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2UhDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQA2UVDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXKkTm9uZdk5TW92aW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19zd2FwX2RlbGF5Adk6QWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilvdmVycmlkZcLZPVN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXQA2TtTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZRUdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZR1Nsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXRfZmFjdG9yANk7R2xvYmFsVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnOQ2UFDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd8PZN0Nyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXfD2T9NYW51YWxzVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXQA2ThTbG93d2Fsa1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF9saW1pdDzZTkNyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZPVNsb3d3YWxrVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnORpkppdHRlctlJQ3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldAbZR0Nyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0ANk8TWFudWFsc1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZSENyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmlnaHRfeWF3X29mZnNldADZO01vdmUgJiBDcm91Y2hDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKW92ZXJyaWRlw9lETW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpc3RhdGljX3lhd19vZmZzZXQA2UJNb3ZlICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilsZWZ0X3lhd19vZmZzZXT4sGF2b2lkX2NvbGxpc2lvbnPC2TdNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXJpZ2h0X2xpbWl0PNk2U2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKW92ZXJyaWRlw9k+TW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82TFTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3plN0YXRpY9lDTW92ZSAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVyq2Zhc3RfbGFkZGVywtlGU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfc3dhcF9kZWxheQHZRFNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVypE5vbmXZOE1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVypE5vbmXZQEdsb2JhbFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19mcmVlc3RhbmRpbmejT2Zm2TxBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpcmlnaHRfbGltaXQ82UFBaXIgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV95YXdfb3B0aW9uc5GmSml0dGVy2UBTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V00M2oZmFsbF9kbWfC2VBNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXdfbW9kaWZpZXJfb2Zmc2V0X2ZhY3RvcgDZPk1vdmluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3w9lATW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZOEFpclRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0F9k5QWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKXN0YXRpY195YXdfb2Zmc2V0CNkwQWlyVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKW92ZXJyaWRlw9k7U3RhbmRpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcil5YXeuTGVmdCBBbmQgUmlnaHTZUU1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X2ZyZWVzdGFuZGluZ6NPZmbZPkNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19vcHRpb25zkaZKaXR0ZXLZTE1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnORpkppdHRlctlGTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF9saW1pdDzZT01vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd19tb2RpZmllcl9vZmZzZXTQxtlLTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0CtlNTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcmFuZG9tX3lhd19vZmZzZXQA2U1Nb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldArZP01vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKXlhd65MZWZ0IEFuZCBSaWdodNlBTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpcGl0Y2ikRG93btlETW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpb3ZlcnJpZGXD2UJNb3ZlICYgQ3JvdWNoVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X29wdGlvbnORpkppdHRlctk9TW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF9saW1pdDzZTE1vdmUgJiBDcm91Y2hUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpeWF3X21vZGlmaWVyX29mZnNldF9mYWN0b3IA2TVTdGFuZGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilvdmVycmlkZcPZRENyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpeWF3X21vZGlmaWVypE5vbmXZOkNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcil5YXdfbW9kaWZpZXKoQWRkaXRpdmXZP0Nyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZPENyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19zcGVlZAHZR1N0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpbGVmdF95YXdfb2Zmc2V0ANlAU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3lhd8PZNkNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd8PZPkNyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilyaWdodF95YXdfb2Zmc2V0Bdk9Q3JvdWNoaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWxlZnRfeWF3X29mZnNldAXZP0Nyb3VjaGluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilzdGF0aWNfeWF3X29mZnNldAXZP1N0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZRlN0YW5kaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfc3BlZWQB2TpNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChCdWlsZGVyKWJvZHlfeWF3X3NwZWVkAdlETW92aW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfc3BlZWQE2UdNb3ZpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZPFNsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19zcGVlZAHZP1Nsb3d3YWxrQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZRE1hbnVhbHNUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X3NwZWVkBNlKQWlyICYgQ3JvdWNoQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfc3BlZWQB2UpDcm91Y2hpbmdDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZSFN0YW5kaW5nVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZOU1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19zcGVlZAHZPE1vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZQ01vdmluZ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfc3BlZWQE2UZNb3ZpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtlKTW92ZSAmIENyb3VjaFRjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoRGVmZW5zaXZlIEJ1aWxkZXIpYm9keV95YXdfc3BlZWQB2UZTbG93d2Fsa0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X3NwZWVkBNlJU2xvd3dhbGtDVGNvbmRpdGlvbmFsX3RlYW1zbWVudV9ncm91cChEZWZlbnNpdmUgQnVpbGRlcilib2R5X3NwZWVkX3JhbmRvbcLZTUFpciAmIENyb3VjaENUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfc3BlZWRfcmFuZG9twtk9Q3JvdWNoaW5nQ1Rjb25kaXRpb25hbF90ZWFtc21lbnVfZ3JvdXAoQnVpbGRlcilib2R5X3lhd19zcGVlZAHZQENyb3VjaGluZ0NUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKEJ1aWxkZXIpYm9keV9zcGVlZF9yYW5kb23C2UZDcm91Y2hpbmdUY29uZGl0aW9uYWxfdGVhbXNtZW51X2dyb3VwKERlZmVuc2l2ZSBCdWlsZGVyKWJvZHlfeWF3X3NwZWVkBK1jb25maWdfc3lzdGVthKxpbXBvcnRfbGFiZWzOzUhuCKxleHBvcnRfbGFiZWzOoIWNz6pjbG91ZF9saXN0AatlcnJvcl9sYWJlbM6k//hqp3Zpc3VhbHPeACixdmlld21vZGVsX2NoYW5nZXLDtXZpZXdtb2RlbF9jaGFuZ2VyX2ZvdjWzdmlld21vZGVsX2NoYW5nZXJfeACzdmlld21vZGVsX2NoYW5nZXJfeQCzdmlld21vZGVsX2NoYW5nZXJfetCcrW5vdGlmaWNhdGlvbnPCrW1hbnVhbF9hcnJvd3PCs2NlbnRlcmVkX2luZGljYXRvcnPCuWNlbnRlcmVkX2luZGljYXRvcnNfY29sb3KoRkZGRkZGRkayZmlyZWRfbm90aWZ5X2NvbG9yqENDQ0NDQzVDsndhdGVybWFya19wb3NpdGlvbqRMZWZ0q2FpbWJvdF9sb2dzw6ZhY2NlbnSoRjBGMEYwOEOxbWlzc19ub3RpZnlfY29sb3KoQ0NDQ0NDNUOncjhfaGVscMOrc2xvd2VkX2Rvd27DrnBsdXNfaGl0bWFya2VywqpsZWdhY3lfaW5kwrRtYW51YWxfYXJyb3dzX2NvbG9yMahENTE2MTZGRr1tYW51YWxfYXJyb3dzX2NvbG9yMV9kaXNhYmxlZKhGRkZGRkY5NrRhc3BlY3RfcmF0aW9fY2hhbmdlcsO0bWFudWFsX2Fycm93c19jb2xvcjKoOTZDODNDRkaybWFudWFsX2Fycm93c19zaXplGbJzY29wZV9vdmVybGF5X3NpemVktm1hbnVhbF9hcnJvd3NfaW52ZXJ0ZWTDsXNjb3BlX292ZXJsYXlfZ2FwBaprZWVwX3Njb3Blw7pzY29wZV9vdmVybGF5X2FjY2VudF9jb2xvcqhGRkZGRkZGRrBoaXRfbm90aWZ5X2NvbG9yqENDQ0NDQzVDunNjb3BlX292ZXJsYXlfYnJlYXRoX2NvbG9yqEZGRkZGRjAwumFzcGVjdF9yYXRpb19jaGFuZ2VyX3ZhbHVlzIKpZ2FtZXNlbnNlwrZzY29wZV9vdmVybGF5X3NldHRpbmdzkKlmcHNfYm9vc3TDs3Njb3BlX292ZXJsYXlfc3R5bGWnRGVmYXVsdLJtYW51YWxfYXJyb3dzX3R5cGWnRGVmYXVsdLRwbHVzX2hpdG1hcmtlcl9jb2xvcqg1OEZGRDFGRq1nc19pbmRpY2F0b3JzkqJEVKRCT0RZqWluZF9zdHlsZaVJZGVhbK1zY29wZV9vdmVybGF5w6hob21lcGFnZZCkbWlzY4inY2xhbnRhZ8KzYXV0b3BlZWtfcGVyZm9tYW5jZR6sdW5sb2NrX3NwaWtlAK9hdXRvcGVla19zYWZldHkIrWFpX3BlZWtfZGVidWfCp2FpX3BlZWvCsmF1dG9wZWVrX2hpdGdyb3Vwc5UBAgMEBa5haV9wZWVrX25vdGlmecI="
    };
    v407 = l_base64_0.decode(v9.hidden_configs.Aggresive);
    v436 = msgpack.unpack(v407);
    v9.hidden_configs.Aggresive = v436;
    v9.set_ui = v125("set_ui", true, function(v437)
        -- upvalues: v14 (ref), v11 (ref)
        for v438, v439 in pairs(v437) do
            local l_v439_0 = v439;
            if type(v439) == "table" then
                l_v439_0 = v14.menu_combo_sanitizer(l_v439_0);
            end;
            v11.override(v438, l_v439_0);
        end;
    end);
    v9.get_cond_values = function(v441)
        -- upvalues: v9 (ref)
        local v442 = v9.conditions[v441];
        if v442 == nil then
            return;
        else
            local v443 = {};
            for v444, _ in pairs(v442.ui) do
                local v446 = v442.name .. v442.team .. v442.team_selector .. tostring(v442.group);
                v443[v444] = v9.active_table.aa[v446 .. v444];
            end;
            return v443;
        end;
    end;
    v9.is_custom_active = true;
    v9.get_active_idx = function()
        -- upvalues: v9 (ref)
        local v447 = -1;
        local v448 = -1;
        local v449 = nil;
        for v450, v451 in pairs(v9.conditions) do
            local v452 = v451.name .. v451.team .. v451.team_selector .. tostring(v451.group);
            local v453 = v9.active_table.aa[v452 .. "override"];
            if v451.condition() and (v453 == nil or v453 == true) and v448 < v451.priority then
                v449 = v451;
                v447 = v450;
                v448 = v451.priority;
            end;
        end;
        return v447;
    end;
    v9.current_side = false;
    v9.desync_delta = 0;
    v9.get_desync_delta = function()
        -- upvalues: v9 (ref)
        local v454 = entity.get_local_player();
        if v454 == nil then
            return;
        else
            v9.desync_delta = math.normalize_yaw(v454.m_flPoseParameter[11] * 120 - 60) / 2;
            return;
        end;
    end;
    v9.get_desync_side = function()
        -- upvalues: v9 (ref)
        v9.current_side = rage.antiaim:inverter();
    end;
    flick = function(v455, v456, _)
        local v458 = c_math.min(v455, v456);
        target = c_math.max(v455, v456);
        start = v458;
        return this;
    end;
    v407 = false;
    v436 = 0;
    local v459 = 0;
    local v460 = 0;
    local v461 = 0;
    local v462 = 0;
    local v463 = 0;
    local v464 = 0;
    local v465 = 0;
    local _ = 4;
    local _ = false;
    v9.set_yaw_right_left = v125("set yaw right left", true, function(v468, v469)
        -- upvalues: v465 (ref), v407 (ref), v11 (ref), v8 (ref), v459 (ref), v462 (ref), v460 (ref), v461 (ref), v463 (ref), v464 (ref)
        if v469.left_and_right then
            v465 = v465 + 1;
            if not v469.body_speed_random then
                if v465 >= v469.body_yaw_speed then
                    v465 = 0;
                    v407 = not v407;
                end;
            elseif v465 >= utils.random_int(1, 5) then
                v465 = 0;
                v407 = not v407;
            end;
            local l_yaw_modifier_offset_0 = v469.yaw_modifier_offset;
            v11.override("yaw_modifier", "Disabled");
            v469.yaw_modifier_offset = math.random(l_yaw_modifier_offset_0, l_yaw_modifier_offset_0 - v469.yaw_modifier_offset_factor);
            if v8.elements.aa.flick_exploit then
                if v407 then
                    v459 = v8.elements.aa.flick_left;
                    v11.override("inverter", true);
                    v468.force_defensive = true;
                    v469.yaw_hidden = true;
                    v469.left_limit = -v469.left_limit;
                    v469.right_limit = -v469.right_limit;
                else
                    v459 = v8.elements.aa.flick_right;
                    v11.override("inverter", false);
                    v468.force_defensive = false;
                    v469.left_limit = v469.left_limit;
                    v469.right_limit = v469.right_limit;
                end;
            else
                v469.yaw_hidden = false;
                if v469.yaw_modifier == "Additive" then
                    v462 = v469.yaw_modifier_offset / 2;
                else
                    v462 = 0;
                end;
                v460 = math.floor(v462 * 0.7);
                v461 = math.ceil(-v462 * 0.7);
                v463 = v469.left_yaw_offset + v460;
                v464 = v469.right_yaw_offset + v461;
                if v407 then
                    if v469.yaw_modifier == "Additive" then
                        v459 = utils.random_float(v463, v463 - v469.random_yaw_offset);
                    else
                        v459 = utils.random_float(v469.left_yaw_offset, v469.left_yaw_offset - v469.random_yaw_offset);
                    end;
                    v11.override("inverter", true);
                    v469.yaw_hidden = false;
                    v469.left_limit = v469.left_limit;
                    v469.right_limit = -v469.right_limit;
                else
                    if v469.yaw_modifier == "Additive" then
                        v459 = utils.random_float(v464, v464 - v469.random_yaw_offset);
                    else
                        v459 = utils.random_float(v469.right_yaw_offset, v469.right_yaw_offset - v469.random_yaw_offset);
                    end;
                    v11.override("inverter", false);
                    v469.yaw_hidden = false;
                    v469.left_limit = -v469.left_limit;
                    v469.right_limit = v469.right_limit;
                end;
            end;
            v469.yaw_offset = v459;
            v469.body_yaw_options = {};
        else
            v469.yaw_offset = v469.static_yaw_offset;
        end;
    end);
    v9.swap_last_update_hidden = 0;
    v9.swap_current_hidden = false;
    v9.swapping = false;
    v9.set_spin_bot = v125("set yaw spinbot", true, function(v471)
        if v471.yaw_spinbot then
            v471.yaw_offset = -180 + globals.tickcount % 9 * 40 + utils.random_float(-30, 30);
        else
            v471.yaw_offset = 0;
        end;
    end);
    v9.set_yaw_random = v125("set yaw random", true, function(v472)
        if v472.yaw_random then
            v472.yaw_offset = math.normalize_yaw(math.random(-180, 180), -180, 180);
        else
            v472.yaw_offset = 0;
        end;
    end);
    v9.set_yaw_sidebased = v125("set yaw sidebased", true, function(v473, v474)
        -- upvalues: v9 (ref)
        if v474.side_based then
            local l_current_side_0 = v9.current_side;
            if v9.swapping then
                l_current_side_0 = not v9.swap_current;
            end;
            if math.diff(v473.tickcount, v9.swap_last_update_hidden) > 3 then
                v9.swap_current_hidden = not v9.swap_current_hidden;
                v9.swap_last_update_hidden = v473.tickcount;
            end;
            v474.yaw_offset = (l_current_side_0 and 42 or math.random(-10, -41)) - (v474.yaw_offset == nil and 0 or v474.yaw_offset);
            v474.yaw_hidden = true;
            v474.yaw_offset = math.normalize_yaw(v474.yaw_offset);
        else
            v474.yaw_offset = 0;
        end;
    end);
    v9.flucc_fakelag_last = 0;
    v9.speed = 0;
    local _ = false;
    v9.set_yaw_base = function(_, v478)
        -- upvalues: v9 (ref)
        local v479, v480 = v9.is_manuals();
        v478.freestanding = false;
        local v481 = v9.manual_yaws[v480];
        if v479 then
            if v481 then
                v478.yaw_offset = v481;
            else
                v478.yaw_offset = 0;
            end;
            if v480 == "At Target" then
                v478.yaw_base = "At Target";
            else
                v478.yaw_base = "Local View";
            end;
            if v480 == "Freestanding" then
                v478.yaw_base = "At Target";
            end;
            v478.yaw = "Backward";
            v478.freestanding = v480 == "Freestanding";
        end;
        v478.left_and_right = false;
        v478.side_based = false;
        v478.yaw_random = false;
        v478.yaw_spinbot = false;
        v478.yaw_swap_hold = false;
        if v478.yaw == "Static" then
            v478.yaw_base = "At Target";
            v478.yaw = "Backward";
        elseif v478.yaw == "Local view" then
            v478.yaw_base = "Local View";
            v478.yaw = "Backward";
        elseif v478.yaw == "Left And Right" then
            v478.yaw_base = "At Target";
            v478.yaw = "Backward";
            v478.left_and_right = true;
        elseif v478.yaw == "Hold" then
            v478.yaw_base = "At Target";
            v478.yaw = "Backward";
            v478.yaw_swap_hold = true;
        elseif v478.yaw == "Side Based" then
            v478.yaw_base = "At Target";
            v478.yaw = "Backward";
            v478.side_based = true;
        elseif v478.yaw == "Spin Bot" then
            v478.yaw_base = "At Target";
            v478.yaw = "Backward";
            v478.yaw_spinbot = true;
        elseif v478.yaw == "Random" then
            v478.yaw_base = "At Target";
            v478.yaw = "Backward";
            v478.yaw_random = true;
        end;
    end;
    v9.delayed_jitter_step = 1;
    v9.last_update = 0;
    v9.swap_last_update = 0;
    v9.swap_current = false;
    v9.swapping = false;
    local v482 = 0;
    v9.hold_yaw = function(_, v484)
        -- upvalues: v482 (ref), v459 (ref), v9 (ref)
        if v484.yaw_swap_hold then
            if entity.get_local_player() == nil then
                return;
            else
                if globals.choked_commands == 0 then
                    v482 = v482 + 1;
                end;
                if v482 >= 8 then
                    v482 = 0;
                end;
                if v482 == 0 then
                    v484.inverter = false;
                    v459 = v484.right_yaw_offset;
                elseif v482 == 1 then
                    v484.inverter = true;
                    v459 = v484.left_yaw_offset;
                elseif v482 == 2 then
                    v484.inverter = true;
                    v459 = v484.left_yaw_offset;
                elseif v482 == 3 then
                    v484.inverter = true;
                    v459 = v484.left_yaw_offset;
                elseif v482 == 4 then
                    v484.inverter = false;
                    v459 = v484.right_yaw_offset;
                elseif v482 == 5 then
                    v484.inverter = true;
                    v459 = v484.left_yaw_offset;
                elseif v482 == 6 then
                    v484.inverter = false;
                    v459 = v484.right_yaw_offset;
                elseif v482 == 7 then
                    v484.inverter = false;
                    v459 = v484.right_yaw_offset;
                end;
                v484.yaw_offset = v459;
                v484.body_yaw_options = {};
                v9.swapping = true;
            end;
        end;
    end;
    local v485 = 0;
    v9.delayed_side = function(_, v487)
        -- upvalues: v9 (ref), v485 (ref), v11 (ref)
        v9.swapping = false;
        if not v487.yaw_swap_delayed or not v487.left_and_right then
            return;
        elseif entity.get_local_player() == nil then
            return;
        else
            local l_yaw_swap_delay_0 = v487.yaw_swap_delay;
            if globals.commandack % l_yaw_swap_delay_0 < l_yaw_swap_delay_0 / 2 then
                if globals.choked_commands == 0 then
                    v485 = v487.left_yaw_offset;
                    v11.override("inverter", true);
                end;
            elseif globals.choked_commands == 0 then
                v485 = v487.right_yaw_offset;
                v11.override("inverter", false);
            end;
            v487.yaw_offset = v485;
            v487.body_yaw_options = {};
            v9.swapping = true;
            return;
        end;
    end;
    v7.presets_list = {
        v14.with_icon("circle", " Custom Builder", "{Link Active}"), 
        v14.with_icon("circle", " Aggresive Preset", "{Link Active}"), 
        v14.with_icon("circle", " Meta Preset", "{Link Active}")
    };
    v7.list(v7.tabs.antiaim_builder_choose, "", v7.presets_list)("aa", "active_preset");
    v10.register("render", "preset_list", function(_)
        -- upvalues: v8 (ref), v14 (ref)
        if v8.elements.aa.active_preset == 1 then
            v8.refs.aa.active_preset.ref:update(v14.with_icon("circle-check", " Custom Builder", "{Link Active}"), v14.with_icon("circle", " Aggresive Preset", "{Link Active}"), v14.with_icon("circle", " Meta Preset", "{Link Active}"));
        elseif v8.elements.aa.active_preset == 2 then
            v8.refs.aa.active_preset.ref:update(v14.with_icon("circle", " Custom Builder", "{Link Active}"), v14.with_icon("circle-check", " Aggresive Preset", "{Link Active}"), v14.with_icon("circle", " Meta Preset", "{Link Active}"));
        elseif v8.elements.aa.active_preset == 3 then
            v8.refs.aa.active_preset.ref:update(v14.with_icon("circle", " Custom Builder", "{Link Active}"), v14.with_icon("circle", " Aggresive Preset", "{Link Active}"), v14.with_icon("circle-check", " Meta Preset", "{Link Active}"));
        end;
    end);
    v9.avoid_backstab = v125("avoid_backstab", true, function(_, v491)
        -- upvalues: v8 (ref), v38 (ref)
        if not v8.elements.aa.avoid_backstab then
            return;
        else
            local v492 = entity.get_local_player():get_origin();
            local v493 = false;
            entity.get_players(true, false, function(v494)
                -- upvalues: v492 (ref), v8 (ref), v493 (ref)
                local v495 = v494:get_player_weapon();
                if v495 == nil then
                    return;
                else
                    if v495:get_weapon_info().weapon_type == 0 and v494:get_origin():dist(v492) < v8.elements.aa.backstab_distance then
                        v493 = true;
                    end;
                    return;
                end;
            end);
            if not v493 then
                return;
            else
                v491.yaw_offset = 180;
                v491.yaw_base = "At Target";
                v491.yaw_modifier = "Disabled";
                v491.body_yaw_options = {};
                v38.is_handling = false;
                return;
            end;
        end;
    end);
    v9.active_table = v8.elements;
    v9.handle_update = function(v496)
        -- upvalues: v13 (ref), v9 (ref), v8 (ref), v38 (ref)
        if v13.shared_data.team ~= 2 and v13.shared_data.team ~= 3 then
            return;
        else
            v9.update_defensive_state(v496);
            if globals.choked_commands == 0 then
                local v497 = false;
                if v8.elements.aa.active_preset == 1 then
                    v9.active_table = v8.elements;
                elseif v8.elements.aa.active_preset == 2 then
                    v9.active_table = v9.hidden_configs.Aggresive;
                    v8.elements.aa.force_defensive_cond = {
                        ["Air & Crouch"] = true, 
                        ["Move & Crouch"] = true, 
                        Crouching = true, 
                        Slowwalk = true, 
                        Standing = true
                    };
                    v497 = true;
                elseif v8.elements.aa.active_preset == 3 then
                    v9.active_table = v9.hidden_configs_meta.Meta;
                    v8.elements.aa.force_defensive_cond = {
                        ["Air & Crouch"] = true, 
                        Air = true, 
                        ["Move & Crouch"] = true, 
                        Crouching = true, 
                        Slowwalk = true, 
                        Moving = false, 
                        Standing = false
                    };
                    v497 = true;
                elseif v8.elements.aa.active_preset == 4 then
                    v9.active_table = v9.hidden_configs_def.Defensive;
                    v8.elements.aa.force_defensive_cond = {
                        ["Air & Crouch"] = true, 
                        Air = true, 
                        ["Move & Crouch"] = true, 
                        Crouching = true, 
                        Slowwalk = true, 
                        Moving = true, 
                        Standing = true
                    };
                    v497 = true;
                end;
                v8.refs.aa.force_defensive_cond.ref:disabled(v497);
                v9.get_desync_delta(v496);
                v9.get_desync_side(v496);
                local v498 = {};
                local v499 = v9.get_active_idx();
                v498 = v9.get_cond_values(v499);
                v9.set_yaw_base(v496, v498);
                local v500 = v9.is_manuals();
                if not v500 and v499:find("Defensive Builder") then
                    if v498.pitch == "Zero" then
                        v498.pitch = "Disabled";
                    elseif v498.pitch == "Fake Down" then
                        v498.pitch = "Fake Down";
                    elseif v498.pitch == "Fake Up" then
                        v498.pitch = "Fake Up";
                    elseif v498.pitch == "Exploit" then
                        v498.pitch = v496.tickcount % 6 > 3 and "Fake Down" or "Fake Up";
                        rage.antiaim:override_hidden_pitch(math.random(-89, 89));
                    end;
                    if v498.side_based then
                        v9.set_yaw_sidebased(v496, v498);
                    elseif v498.yaw_spinbot then
                        v9.set_spin_bot(v498);
                    elseif v498.yaw_random then
                        v9.set_yaw_random(v498);
                    elseif v498.left_and_right then
                        v9.set_yaw_right_left(v496, v498);
                    end;
                elseif not v500 then
                    v498.yaw_hidden = false;
                    v498.pitch = "Down";
                    v9.set_yaw_right_left(v496, v498);
                else
                    v498.yaw_hidden = false;
                    v498.pitch = "Down";
                end;
                v9.hold_yaw(v496, v498);
                v9.delayed_side(v496, v498);
                v9.avoid_backstab(v496, v498);
                v38.handle(v496, v498);
                v498.yaw_backstab = v8.elements.aa.avoid_backstab;
                v9.set_ui(v498);
            end;
            return;
        end;
    end;
    v9.condition_combos = {};
    v9.teams = {
        T = 2, 
        CT = 3
    };
    v7.combo(v7.tabs.antiaim_builder, v14.with_icon("screen-users", "Team", "{Link Active}"), {
        [1] = "T", 
        [2] = "CT"
    })("aa", "conditional_teams", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_preset == 1;
    end);
    v7.label(v7.tabs.antiaim_builder, v14.with_icon("check", "Config already pre-\a{Link Active}configured\aDEFAULT!", "{Link Active}"))("aa", "dawdaw111", false, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_preset ~= 1;
    end);
    v9.create_condition = function(v501, v502, v503, v504, v505, v506, v507)
        -- upvalues: v13 (ref), v9 (ref), v8 (ref), v7 (ref), v14 (ref)
        condition = function()
            -- upvalues: v506 (ref), v13 (ref), v505 (ref)
            return v506() and v13.shared_data.team == v505[2];
        end;
        local v508 = v502 .. v501 .. v505[1] .. tostring(v504);
        v9.conditions[v508] = {
            name = v501, 
            team = v505[1], 
            condition = condition, 
            team_selector = v502, 
            group = v504
        };
        local l_v507_0 = v507;
        v507 = function()
            -- upvalues: v8 (ref), l_v507_0 (ref)
            return v8.elements.aa.active_preset == 1 and (not (l_v507_0 ~= nil) or l_v507_0());
        end;
        if v9.condition_combos[v505[1] .. v502] == nil then
            v9.condition_combos[v505[1] .. v502] = {
                ref = v7.combo(v504, v14.with_icon("filter", v505[1] .. " Condition", "{Link Active}"), {
                    [1] = "Loading..."
                })("aa", "condition_combo_" .. v505[1] .. v502, true, function()
                    -- upvalues: v507 (ref), v8 (ref), v502 (ref), v505 (ref)
                    return v507() and v8.elements.aa[v502] == v505[1];
                end)(), 
                conditions = {}, 
                priority = v503
            };
        end;
        local v510 = v505[2] == 2;
        v9.conditions_by_team[v501 .. tostring(v510) .. v502 .. tostring(v504)] = v508;
        v9.conditions[v508].ui = v9.create_ui(v501, v502, v505, v504, v507);
        v9.conditions[v508].priority = v503;
        v9.conditions[v508].team_selector = v502;
        if v504 ~= v7.tabs.antiaim_defensive then
            table.insert(v9.condition_combos[v505[1] .. v502].conditions, v501);
            v8.refs.aa["condition_combo_" .. v505[1] .. v502].ref:update(v9.condition_combos[v505[1] .. v502].conditions);
        end;
    end;
    v9.create_full_menu = function()
        -- upvalues: v9 (ref), v7 (ref), v13 (ref)
        for v511, v512 in pairs(v9.teams) do
            local v513 = {
                [1] = v511, 
                [2] = v512
            };
            do
                local l_v512_0 = v512;
                v9.create_condition("Global", "conditional_teams", 1, v7.tabs.antiaim_builder, v513, function()
                    -- upvalues: v13 (ref), l_v512_0 (ref)
                    return v13.shared_data.team == l_v512_0;
                end);
                v9.create_condition("Manuals", "conditional_teams", 4, v7.tabs.antiaim_builder, v513, function()
                    -- upvalues: v9 (ref), v13 (ref), l_v512_0 (ref)
                    return v9.is_manuals() and v13.shared_data.team == l_v512_0;
                end);
                v9.create_condition("Manuals", "conditional_teams", 5, v7.tabs.antiaim_defensive, v513, function()
                    -- upvalues: v9 (ref), v13 (ref), l_v512_0 (ref)
                    return v9.is_manuals() and v13.shared_data.team == l_v512_0 and v9.is_defensive();
                end);
                for v515, v516 in ipairs(v9.state_to_string) do
                    do
                        local l_v515_0 = v515;
                        v9.create_condition(v516, "conditional_teams", 2, v7.tabs.antiaim_builder, v513, function()
                            -- upvalues: v9 (ref), l_v515_0 (ref), v13 (ref), l_v512_0 (ref)
                            return v9.player_state == l_v515_0 and v13.shared_data.team == l_v512_0;
                        end);
                        v9.create_condition(v516, "conditional_teams", 3, v7.tabs.antiaim_defensive, v513, function()
                            -- upvalues: v9 (ref), l_v515_0 (ref), v13 (ref), l_v512_0 (ref)
                            return v9.player_state == l_v515_0 and v13.shared_data.team == l_v512_0 and v9.is_defensive();
                        end);
                    end;
                end;
            end;
        end;
    end;
    v9.create_full_menu();
    v14.reason_redirect = {
        ["prediction error"] = "pred. error"
    };
    v26.last_tick_triggered = 0;
    v26.bullet_impact = function(v518)
        -- upvalues: v8 (ref), v26 (ref), v28 (ref)
        if not v8.elements.visuals.notifications then
            return;
        else
            local v519 = entity.get_local_player();
            if v519 == nil or not v519:is_alive() then
                return;
            else
                local v520 = entity.get(v518.userid, true);
                if v520 == nil or not v520:is_alive() or v520:is_dormant() or not v520:is_enemy() then
                    return;
                elseif v26.last_tick_triggered == globals.tickcount then
                    return;
                else
                    v26.last_tick_triggered = globals.tickcount;
                    local v521 = vector(v518.x, v518.y, v518.z);
                    local v522 = v520:get_eye_position();
                    local v523 = v519:get_eye_position();
                    if v523:closest_ray_point(v522, v521):dist(v523) > 53 then
                        return;
                    else
                        local l_fired_notify_color_0 = v8.elements.visuals.fired_notify_color;
                        local v525 = l_fired_notify_color_0:to_hex();
                        v28.push(string.format("\a%s%s\aDEFAULT fired at you!", v525, v520:get_name()), l_fired_notify_color_0);
                        return;
                    end;
                end;
            end;
        end;
    end;
    v26.aim_ack = function(v526)
        -- upvalues: v280 (ref), v8 (ref), v14 (ref), v28 (ref)
        v280(v526);
        if not v8.elements.visuals.aimbot_logs and not v8.elements.visuals.notifications then
            return;
        else
            local l_target_0 = v526.target;
            if l_target_0 == nil then
                return;
            else
                local v528 = v14.reason_redirect[v526.state] or v526.state;
                local v529 = l_target_0:get_name();
                local l_m_iHealth_0 = l_target_0.m_iHealth;
                local l_spread_0 = v526.spread;
                local l_backtrack_0 = v526.backtrack;
                local l_hitchance_0 = v526.hitchance;
                local l_damage_0 = v526.damage;
                local l_wanted_damage_0 = v526.wanted_damage;
                local v536 = v14.hitgroups[v526.hitgroup] or "?";
                local v537 = v14.hitgroups[v526.wanted_hitgroup] or "?";
                local v538 = v8.elements.visuals.accent:to_hex();
                if v528 == nil then
                    local v539 = string.format("\a%sRegistered \aDEFAULTshot at %s's %s for \a%s%d(%d) \aDEFAULTdamage (hp: \a%s%d\aDEFAULT) (aimed: \a%s%s\aDEFAULT) (bt: \a%s%s\aDEFAULT) (spread: \a%s%.1f\194\176\aDEFAULT)", v538, v529, v536, v538, l_damage_0, l_wanted_damage_0, v538, l_m_iHealth_0, v538, v537, v538, l_backtrack_0, v538, l_spread_0);
                    v14.branded_printing(v539);
                    return;
                else
                    local v540 = string.format("\a%sMissed \aDEFAULTshot at %s's %s due to \a%s%s \aDEFAULT(hc: \a%s%d%%\aDEFAULT) (damage: \a%s%d\aDEFAULT) (bt: \a%s%s\aDEFAULT)", v538, v529, v537, v538, v528, v538, l_hitchance_0, v538, l_wanted_damage_0, v538, l_backtrack_0);
                    local v541 = string.format("\a%sMissed \aDEFAULTshot at \a%s%s\aDEFAULT's %s due to \a%s%s\aDEFAULT(%d%%) [damage: \a%s%d \aDEFAULT bt: \a%s%s\aDEFAULT", v538, v529, v538, v537, v538, v528, l_hitchance_0, v538, l_wanted_damage_0, v538, l_backtrack_0);
                    if l_spread_0 ~= nil then
                        v540 = string.format("%s (spread: \a%s%.1f\194\176\aDEFAULT)", v540, v538, l_spread_0);
                    end;
                    v14.branded_printing(v540);
                    if v8.elements.visuals.notifications then
                        v540 = v8.elements.visuals.miss_notify_color;
                        v541 = "\a" .. v540:to_hex();
                        v28.push(string.format("Missed %s%s\aDEFAULT's %s%s\aDEFAULT due to %s%s\aDEFAULT!", v541, v529, v541, v537, v541, v528), v540);
                    end;
                    return;
                end;
            end;
        end;
    end;
    v28.hurt = function(v542)
        -- upvalues: v14 (ref), v8 (ref), v28 (ref)
        local v543 = entity.get_local_player();
        local v544 = entity.get(v542.userid, true);
        local v545 = entity.get(v542.attacker, true);
        if v543 == nil or v544 == nil or v545 == nil then
            return;
        elseif v544 == v543 or v545 ~= v543 then
            return;
        else
            local v546 = v14.wpn2act[v542.weapon] or "Hit";
            local v547 = v14.hitgroups[v542.hitgroup] or "?";
            local l_hit_notify_color_0 = v8.elements.visuals.hit_notify_color;
            local v549 = l_hit_notify_color_0:to_hex();
            v28.push(string.format("%s \a%s%s\aDEFAULT's \a%s%s \aDEFAULTfor \a%s%s\aDEFAULT!", v546, v549, v544:get_name(), v549, v547, v549, v542.dmg_health), l_hit_notify_color_0);
            return;
        end;
    end;
    v26.handle_hurt = function(v550)
        -- upvalues: v14 (ref), v8 (ref)
        local v551 = entity.get_local_player();
        local v552 = entity.get(v550.userid, true);
        local v553 = entity.get(v550.attacker, true);
        if v551 == nil or v552 == nil or v553 == nil then
            return;
        elseif v552 == v551 or v553 ~= v551 then
            return;
        else
            local v554 = v14.wpn2act[v550.weapon];
            if v554 == nil then
                return;
            else
                local v555 = v8.elements.visuals.accent:to_hex();
                local v556 = v552:get_name();
                local v557 = string.format("%s \a%s%s \aDEFAULTfor \a%s%d \aDEFAULTdamage (%d health remaining)", v554, v555, v556:lower(), v555, v550.dmg_health, v550.health);
                v14.branded_printing(v557);
                return;
            end;
        end;
    end;
    v26.player_hurt = function(v558)
        -- upvalues: v8 (ref), v26 (ref), v28 (ref)
        if v8.elements.visuals.aimbot_logs then
            v26.handle_hurt(v558);
        end;
        if v8.elements.visuals.notifications then
            v28.hurt(v558);
        end;
    end;
    v32.VEC_HULL_DUCK = {
        mins = vector(-16, -16, 0), 
        maxs = vector(16, 16, 54)
    };
    v32.VEC_HULL_STAND = {
        mins = vector(-16, -16, 0), 
        maxs = vector(16, 16, 72)
    };
    v32.collision_bounds = function(v559, v560, v561)
        -- upvalues: v12 (ref)
        v559 = v559[0];
        local v562 = v12.native_getCollideable(v559);
        local v563 = v12.native_getMins(v562);
        local v564 = v12.native_getMaxs(v562);
        if not v560 and not v561 then
            return vector(v563[0].x, v563[0].y, v563[0].z), vector(v564[0].x, v564[0].y, v564[0].z);
        else
            v563[0].x = v560.x;
            v563[0].y = v560.y;
            v563[0].z = v560.z;
            v564[0].x = v561.x;
            v564[0].y = v561.y;
            v564[0].z = v561.z;
            return;
        end;
    end;
    v32.simulate = function(v565, v566, v567, v568, v569, v570, v571, v572, v573, v574, v575)
        -- upvalues: v32 (ref)
        local v576 = entity.get_local_player();
        if v576 == nil then
            return;
        else
            local v577, v578 = v32.collision_bounds(v576);
            local l_in_duck_0 = v565.in_duck;
            local l_in_jump_0 = v565.in_jump;
            local l_in_bullrush_0 = v565.in_bullrush;
            local l_m_flDuckAmount_0 = v576.m_flDuckAmount;
            v32.collision_bounds(v576, v566, v567);
            v565.in_duck = v568;
            v565.in_jump = v570;
            v565.in_bullrush = v569;
            v576.m_flDuckAmount = v571;
            local v583 = v576:simulate_movement(v574, v575, v572);
            local l_huge_0 = math.huge;
            for v585 = 1, v573 do
                v583:think();
                if l_huge_0 == math.huge and v583.did_hit_collision then
                    l_huge_0 = v585;
                end;
            end;
            v32.collision_bounds(v576, v577, v578);
            v576.m_flDuckAmount = l_m_flDuckAmount_0;
            v565.in_duck = l_in_duck_0;
            v565.in_jump = l_in_jump_0;
            v565.in_bullrush = l_in_bullrush_0;
            return v583, l_huge_0;
        end;
    end;
    v32.active = false;
    v32.works_until = 0;
    v32.createmove = function(v586)
        -- upvalues: v32 (ref), v8 (ref), v98 (ref)
        if math.diff(v32.works_until, v586.tickcount) < 8 then
            v586.in_duck = true;
            return;
        else
            v32.active = false;
            if not v8.elements.aa.auto_duck then
                return;
            else
                local v587 = entity.get_local_player();
                if v587 == nil then
                    return;
                else
                    local l_m_MoveType_0 = v587.m_MoveType;
                    local l_m_fFlags_1 = v587.m_fFlags;
                    if v587.m_hGroundEntity ~= nil and not v586.in_jump or l_m_MoveType_0 == 9 then
                        return;
                    else
                        local v590 = v587:get_origin();
                        local l_m_vecVelocity_1 = v587.m_vecVelocity;
                        l_m_vecVelocity_1.z = 0;
                        local _, v593 = v32.simulate(v586, v32.VEC_HULL_STAND.mins, v32.VEC_HULL_STAND.maxs, false, true, true, 0, bit.band(l_m_fFlags_1, bit.bnot(v98)), 32);
                        local _, v595 = v32.simulate(v586, v32.VEC_HULL_DUCK.mins, v32.VEC_HULL_DUCK.maxs, true, true, true, 1, bit.bor(l_m_fFlags_1, v98), 32);
                        local _, _ = v32.simulate(v586, v32.VEC_HULL_STAND.mins, v32.VEC_HULL_STAND.maxs, false, true, false, 0, bit.band(l_m_fFlags_1, bit.bnot(v98)), 48, v590, l_m_vecVelocity_1);
                        if v593 < v595 then
                            v32.active = true;
                            v586.in_duck = true;
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end;
    v19.list = {};
    v19.new = function(v598, v599, v600)
        -- upvalues: v19 (ref)
        table.insert(v19.list, {
            visible_name = v598, 
            condition_fn = v599, 
            render_fn = v600, 
            data = {
                offset = 0
            }
        });
    end;
    v19.start_position = vector(v14.screen_size.x / 100 + 2, v14.screen_size.y - v14.screen_size.y / 100 * 35);
    v19.pad = 37;
    v19.colors = {
        magic1 = color(0, 0, 0, 0), 
        magic2 = color(0, 0, 0, 45)
    };
    v19.font = render.load_font("Calibri", 23, "bda");
    v19.draw_one = function(v601, v602, v603, v604, v605)
        -- upvalues: v19 (ref), v15 (ref)
        local v606 = render.measure_text(v19.font, nil, v601);
        local v607 = v19.start_position.x / 1.9;
        local v608 = v19.start_position.y + v602;
        local v609 = v608 + (v606.y + 6);
        render.gradient(vector(v607, v19.start_position.y + v602), vector(v607 + v606.x / 2, v609), v19.colors.magic1, v19.colors.magic2, v19.colors.magic1, v19.colors.magic2);
        render.gradient(vector(v607 + v606.x / 2, v19.start_position.y + v602), vector(v607 + v606.x, v609), v19.colors.magic2, v19.colors.magic1, v19.colors.magic2, v19.colors.magic1);
        local v610 = vector(v19.start_position.x, v19.start_position.y + 4 + v602);
        render.text(v19.font, v610, v603, nil, v601);
        if v604 and v605 then
            local v611 = vector(x + v606.x + 18, v608 + v606.y / 2 + 2);
            render.circle_outline(v611, v15.black, 10.5, 90, 1, 4);
            render.circle_outline(v611, v604, 10, 90, v605, 3);
        end;
    end;
    v19.render = function()
        -- upvalues: v8 (ref), v19 (ref)
        if not v8.elements.visuals.gamesense then
            return;
        else
            local v612 = 0;
            local _ = v19.start_position.x;
            for _, v615 in ipairs(v19.list) do
                if v615.condition_fn() then
                    local v616, v617, v618, v619 = v615.render_fn();
                    if v616 ~= nil then
                        v19.draw_one(v616, v612, v617, v618, v619);
                        v612 = v612 - v19.pad;
                    end;
                end;
            end;
            return;
        end;
    end;
    v19.new("OSAA", function()
        -- upvalues: v8 (ref), v11 (ref)
        return v8.elements.visuals.gs_indicators.OSAA and v11.get_value("hideshots");
    end, function()
        return "OSAA", color(255, 200);
    end);
    v19.new("DT", function()
        -- upvalues: v8 (ref), v11 (ref)
        return v8.elements.visuals.gs_indicators.DT and v11.get_value("doubletap");
    end, function()
        return "DT", rage.exploit:get() == 1 and color(255, 200) or color(255, 0, 0, 255);
    end);
    v19.new("FS", function()
        -- upvalues: v8 (ref), v11 (ref)
        return v8.elements.visuals.gs_indicators.FS and v11.get_value("freestanding");
    end, function()
        return "FS", color(255, 200);
    end);
    v19.new("MD", function()
        -- upvalues: v8 (ref), v20 (ref)
        return v8.elements.visuals.gs_indicators.MD and v20.get("Min. Damage") ~= nil;
    end, function()
        return "MD", color(255, 200);
    end);
    v19.new("SAFE", function()
        -- upvalues: v8 (ref), v11 (ref)
        return v8.elements.visuals.gs_indicators.SAFE and v11.get_value("prefer_safety") == "Force";
    end, function()
        return "SAFE", color(255, 200);
    end);
    v19.new("DUCK", function()
        -- upvalues: v8 (ref), v11 (ref)
        return v8.elements.visuals.gs_indicators.DUCK and v11.get_value("fake_duck");
    end, function()
        return "DUCK", color(255, 200);
    end);
    v19.new("PING", function()
        -- upvalues: v8 (ref), v11 (ref)
        return v8.elements.visuals.gs_indicators.PING and v11.get_value("fake_latency") > 0;
    end, function()
        -- upvalues: v11 (ref)
        local v620 = entity.get_local_player();
        if v620 == nil then
            return;
        else
            local l_m_iPing_0 = v620:get_resource().m_iPing;
            local v622 = math.abs(l_m_iPing_0 % 360) / (v11.get_value("fake_latency") / 2);
            v622 = math.min(v622, 1);
            return "PING", color(255 - 125 * v622, 200 * v622, 0);
        end;
    end);
    v19.new("DA", function()
        -- upvalues: v8 (ref), v11 (ref)
        return v8.elements.visuals.gs_indicators.DA and v11.get_value("dormant");
    end, function()
        return "DA", color(255, 200);
    end);
    v19.new("HITCHANCE OVR", function()
        -- upvalues: v8 (ref), v20 (ref)
        return v8.elements.visuals.gs_indicators["HITCHANCE OVR"] and v20.get("Hit Chance") ~= nil;
    end, function()
        return "HITCHANCE OVR", color(255, 200);
    end);
    v19.new("BODY", function()
        -- upvalues: v8 (ref), v11 (ref)
        return v8.elements.visuals.gs_indicators.BODY and v11.get_value("prefer_body") == "Force";
    end, function()
        return "BODY", color(255, 200);
    end);
    v25.handle = function(v623)
        -- upvalues: v8 (ref), v13 (ref)
        if not v8.elements.aa.fast_ladder then
            return;
        elseif v13.shared_data.movetype ~= 9 then
            return;
        elseif math.abs(v623.forwardmove) < 50 then
            return;
        else
            local _ = entity.get_local_player();
            if v623.sidemove == 0 then
                v623.view_angles.y = v623.view_angles.y + 45;
            end;
            if v623.in_forward and v623.sidemove < 0 then
                v623.view_angles.y = v623.view_angles.y + 90;
            end;
            if v623.in_back and v623.sidemove > 0 then
                v623.view_angles.y = v623.view_angles.y + 90;
            end;
            v623.in_moveleft = v623.in_back;
            v623.in_moveright = v623.in_forward;
            if v623.view_angles.x < 0 then
                v623.view_angles.x = -45;
            end;
            return;
        end;
    end;
    v27.animlayer_offset = 10640;
    v27.animlayer_t = ffi.typeof("    struct {\n        char pad_0x0000[0x18];\n        uint32_t seq;\n        float prev_cycle;\n        float weight;\n        float weight_delta_rate;\n        float playback_rate;\n        float cycle;\n        void *entity;\n        char pad_0x0038[0x4];\n    }**\n");
    v27.get_anim_layer = function(v625)
        -- upvalues: v27 (ref)
        local v626 = ffi.cast("void***", v625[0]);
        if v626 == ffi.NULL then
            return false;
        else
            return ffi.cast(v27.animlayer_t, ffi.cast("char*", v626) + v27.animlayer_offset)[0];
        end;
    end;
    v7.switch(v7.tabs.antiaim_misc, v14.with_icon("bone-break", "Animations", "{Link Active}"))("aa", "anim_breakers", true, nil)(function(v627)
        -- upvalues: v7 (ref), v8 (ref)
        v7.listable(v627, "", {
            [1] = "Move Lean", 
            [2] = "Static in Air", 
            [3] = "Jitter", 
            [4] = "Moonwalk", 
            [5] = "Fakewalk"
        })("aa", "anim_breakers_list", true);
        v7.switch(v627, "Jitter Sliding")("aa", "animbreaker_jitter_sliding", true, function()
            -- upvalues: v8 (ref)
            return v8.elements.aa.anim_breakers_list.Sliding ~= nil;
        end);
        local v628 = {
            [-1] = "Auto", 
            [25] = "Default"
        };
        v7.slider(v627, "Lean", -1, 100, 25, 0.1, function(v629)
            -- upvalues: v628 (ref)
            return v628[v629];
        end)("aa", "move_lean_value", true, function()
            -- upvalues: v8 (ref)
            return v8.elements.aa.anim_breakers_list["Move Lean"] ~= nil;
        end);
    end);
    v7.switch(v7.tabs.misc, v14.with_icon("person-ski-jumping", "Air Hitchance", "{Link Active}"))("aa", "air_hitchance", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 1;
    end)(function(v630)
        -- upvalues: v7 (ref), v8 (ref)
        v7.selectable(v630, "Weapons", {
            [1] = "Scout", 
            [2] = "Revolver", 
            [3] = "Pistols", 
            [4] = "Other"
        }, {})("aa", "air_hitchance_active_wps");
        local function v632(v631)
            -- upvalues: v8 (ref)
            return function()
                -- upvalues: v8 (ref), v631 (ref)
                return v8.elements.aa.air_hitchance_active_wps[v631];
            end;
        end;
        v7.slider(v630, "Scout", 0, 100, 0, nil, "%")("aa", "scout_air_hitchance", true, v632("Scout"));
        v7.slider(v630, "Revolver", 0, 100, 0, nil, "%")("aa", "revolver_air_hitchance", true, v632("Revolver"));
        v7.slider(v630, "Pistols", 0, 100, 0, nil, "%")("aa", "pistols_air_hitchance", true, v632("Pistols"));
        v7.slider(v630, "Other", 0, 100, 0, nil, "%")("aa", "other_air_hitchance", true, v632("Other"));
    end);
    v7.switch(v7.tabs.antiaim_misc, v14.with_icon("user-helmet-safety", "  Safe Head", "{Link Active}"))("aa", "safehead", true, nil)(function(v633)
        -- upvalues: v7 (ref), v14 (ref)
        v7.slider(v633, "Height Difference", 0, 100, 40, nil, "%")("aa", "safehead_height", true);
        v7.label(v633, v14.with_icon("address-card", "% is the amount of height advantage in % you have for it to trigger", "{Link Active}"));
        v7.selectable(v633, "Triggers", {
            [1] = "Standing", 
            [2] = "Crouching", 
            [3] = "Air & Crouch", 
            [4] = "Air & Crouch Knife", 
            [5] = "Air & Crouch Zeus"
        })("aa", "safehead_trigger", true);
    end);
    v7.switch(v7.tabs.antiaim_misc, v14.with_icon("brain", "  Flick exploit", "{Link Active}"))("aa", "flick_exploit", true, nil)(function(v634)
        -- upvalues: v7 (ref)
        v7.slider(v634, "Left yaw", -180, 180, -40, nil, "")("aa", "flick_left", true);
        v7.slider(v634, "Right yaw", -180, 180, 90, nil, "")("aa", "flick_right", true);
    end);
    v38.conditions = function()
        -- upvalues: v8 (ref), v9 (ref)
        if not v8.elements.aa.safehead then
            return;
        else
            local l_safehead_trigger_0 = v8.elements.aa.safehead_trigger;
            local v636 = entity.get_local_player();
            if v636 == nil then
                return;
            else
                local v637 = v636:get_player_weapon();
                if v637 == nil then
                    return;
                else
                    local v638 = entity.get_threat(false);
                    if not v638 or v638 == nil then
                        return;
                    else
                        local v639 = v637:get_classname();
                        local v640 = v636:get_hitbox_position(0) + vector(0, 0, 4);
                        local v641 = v638:get_eye_position();
                        local v642 = math.floor(v640.z - v641.z);
                        local l_player_state_0 = v9.player_state;
                        local v644 = l_safehead_trigger_0.Standing and (not (l_player_state_0 ~= 1) or l_player_state_0 == 4) and v8.elements.aa.safehead_height < v642;
                        local v645 = l_safehead_trigger_0.Crouching and (not (l_player_state_0 ~= 1) or l_player_state_0 == 5) and v8.elements.aa.safehead_height < v642;
                        local v646 = l_safehead_trigger_0["Air & Crouch"] and l_player_state_0 == 7 and v8.elements.aa.safehead_height < v642;
                        local v647 = l_safehead_trigger_0["Air & Crouch Knife"] and l_player_state_0 == 7 and v639 == "CKnife";
                        local v648 = l_safehead_trigger_0["Air & Crouch Zeus"] and l_player_state_0 == 7 and v639 == "CWeaponTaser";
                        return v644 or v645 or v646 or v647 or v648;
                    end;
                end;
            end;
        end;
    end;
    v38.is_handling = false;
    v38.handle = v125("safehead.handle", true, function(_, v650)
        -- upvalues: v8 (ref), v38 (ref)
        if not v8.elements.aa.safehead then
            return;
        else
            local v651 = v38.conditions();
            if v651 then
                v650.yaw_offset = 0;
                v650.static_yaw_offset = 0;
                v650.yaw_modifier = "Disabled";
                v650.yaw_modifier_offset = 0;
                v650.left_limit = v651 == 4 and 60 or 0;
                v650.right_limit = v651 == 4 and 60 or 0;
                v650.body_yaw_options = {};
                v38.is_handling = true;
            end;
            return;
        end;
    end);
    v7.switch(v7.tabs.antiaim_misc, v14.with_icon("sword", "Avoid Backstab", "{Link Active}"))("aa", "avoid_backstab", true, nil)(function(v652)
        -- upvalues: v7 (ref)
        v7.slider(v652, "Distance", 0, 700, 275, nil, "ft")("aa", "backstab_distance", true, nil);
    end);
    v7.selectable(v7.tabs.antiaim_misc, v14.with_icon("person", "Freestanding disablers", "{Link Active}"), v9.state_to_string)("aa", "freestanding_disablers", true, nil);
    v37.handle = function(_)
        -- upvalues: v9 (ref), v8 (ref), v11 (ref)
        if v9.flags.on_ground or not v8.elements.aa.air_hitchance then
            return;
        else
            local v654 = entity.get_local_player();
            if v654 == nil then
                return;
            else
                local v655 = v654:get_player_weapon();
                if v655 == nil then
                    return;
                else
                    v655 = v655:get_weapon_info();
                    local v656 = nil;
                    local l_air_hitchance_active_wps_0 = v8.elements.aa.air_hitchance_active_wps;
                    if v655.is_revolver and l_air_hitchance_active_wps_0.Revolver then
                        v656 = "revolver";
                    elseif v655.weapon_type == 1 and l_air_hitchance_active_wps_0.Pistols then
                        v656 = "pistols";
                    elseif v655.console_name == "weapon_ssg08" and l_air_hitchance_active_wps_0.Scout then
                        v656 = "scout";
                    elseif l_air_hitchance_active_wps_0.Other then
                        v656 = "other";
                    end;
                    if v656 == nil then
                        return;
                    else
                        local v658 = v8.elements.aa[v656 .. "_air_hitchance"];
                        v11.override("hitchance", v658, true);
                        return;
                    end;
                end;
            end;
        end;
    end;
    v27.jitterSliding = false;
    v27.random_float = 0;
    v27.handle_number = function()
        -- upvalues: v27 (ref)
        v27.random_float = utils.random_float(0, 1);
    end;
    v27.handle = function(v659)
        -- upvalues: v8 (ref), v9 (ref), v27 (ref), v11 (ref)
        if not v8.elements.aa.anim_breakers then
            return;
        else
            local v660 = entity.get_local_player();
            if v659 == nil or v660 == nil or v659 ~= v660 then
                return;
            else
                if v9.flags.on_ground and v8.elements.aa.anim_breakers_list["Static in Air"] then
                    v660.m_flPoseParameter[6] = 1;
                end;
                local l_move_lean_value_0 = v8.elements.aa.move_lean_value;
                if v8.elements.aa.anim_breakers_list["Move Lean"] and l_move_lean_value_0 ~= -1 then
                    v27.get_anim_layer(v660)[12].weight = l_move_lean_value_0 / 10;
                end;
                if v8.elements.aa.anim_breakers_list.Jitter then
                    local v662 = v27.get_anim_layer(v660);
                    v660.m_flPoseParameter[0] = utils.random_float(0, 1);
                    v662[12].weight = utils.random_float(0, 1);
                    v11.override("legs", "Sliding");
                end;
                if v8.elements.aa.anim_breakers_list.Smoothing then
                    local _ = v27.get_anim_layer(v660);
                    v660.m_flPoseParameter[2] = 0;
                end;
                if v8.elements.aa.anim_breakers_list.Moonwalk then
                    local _ = v27.get_anim_layer(v660);
                    v660.m_flPoseParameter[7] = 0;
                end;
                if v8.elements.aa.anim_breakers_list.Fakewalk then
                    local v665 = v27.get_anim_layer(v660);
                    v665[12].weight = 0;
                    v665[6].weight = 0;
                end;
                return;
            end;
        end;
    end;
    v27.jitterSliding = false;
    v27.move_lean = function(v666)
        -- upvalues: v8 (ref), v13 (ref)
        v666.animate_move_lean = v8.elements.aa.anim_breakers and v8.elements.aa.anim_breakers_list["Move Lean"] and v13.shared_data.velocity:length() > 3;
    end;
    v7.switch(v7.tabs.visuals_onscreen, v14.with_icon("tag", "Centered Indicators", "{Link Active}"))("visuals", "centered_indicators", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 2;
    end)(function(v667)
        -- upvalues: v7 (ref), v14 (ref), v8 (ref), v15 (ref)
        v7.combo(v667, v14.with_icon("", "Style", "{Link Active}"), {
            [1] = "Ideal"
        })("visuals", "ind_style", true, function()
            -- upvalues: v8 (ref)
            return v8.elements.visuals.centered_indicators;
        end);
        v7.color_picker(v667, "Gradient Color", v15.white:override("a", 255))("visuals", "centered_indicators_color", true, function()
            -- upvalues: v8 (ref)
            return v8.elements.visuals.centered_indicators;
        end);
    end);
    local v668 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
    local v669 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
    local _ = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding");
    local v671 = false;
    v39.handle = v125("centered.handle", true, function()
        -- upvalues: v8 (ref), v671 (ref), v668 (ref), v669 (ref)
        if not v8.elements.visuals.centered_indicators then
            return;
        else
            v671 = v8.elements.visuals.ind_style == "Ideal";
            if not v671 then
                return;
            elseif not globals.is_in_game then
                return;
            elseif entity.get_local_player() == nil then
                return;
            else
                local v672 = 0;
                local v673 = render.screen_size().x / 2;
                local v674 = render.screen_size().y / 2 + 20;
                render.text(1, vector(v673, v674), color(220, 135, 49, 255), nil, "LUASENSE YAW");
                v672 = v672 + 10;
                if v8.elements.aa.manuals == "Left" then
                    render.text(1, vector(v673, v674 + v672), color(209, 159, 230, 255), nil, "LEFT");
                    v672 = v672 + 10;
                elseif v8.elements.aa.manuals == "Right" then
                    render.text(1, vector(v673, v674 + v672), color(209, 159, 230, 255), nil, "RIGHT");
                    v672 = v672 + 10;
                elseif v8.elements.aa.manuals == "Freestanding" then
                    render.text(1, vector(v673, v674 + v672), color(209, 159, 230, 255), nil, "FREESTAND");
                    v672 = v672 + 10;
                else
                    render.text(1, vector(v673, v674 + v672), color(209, 159, 230, 255), nil, "DYNAMIC");
                    v672 = v672 + 10;
                end;
                if v668:get() then
                    if rage.exploit:get() == 1 then
                        render.text(1, vector(v673, v674 + v672), color(0, 255, 0, 255), nil, "DT");
                    else
                        render.text(1, vector(v673, v674 + v672), color(255, 0, 0, 255), nil, "DT");
                    end;
                    v672 = v672 + 10;
                end;
                if v669:get() then
                    render.text(1, vector(v673, v674 + v672), color(120, 128, 200, 255), nil, "AA");
                    v672 = v672 + 10;
                end;
                return;
            end;
        end;
    end);
    v7.switch(v7.tabs.visuals_onscreen, v14.with_icon("sparkles", "Game\a96C83CFFSense", "{Link Active}"))("visuals", "gamesense", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 2;
    end)(function(v675)
        -- upvalues: v7 (ref), v14 (ref), v19 (ref)
        v7.selectable(v675, v14.with_icon("sparkles", "Indicators", "{Link Active}"), (function()
            -- upvalues: v19 (ref)
            local v676 = {};
            for _, v678 in pairs(v19.list) do
                table.insert(v676, v678.visible_name);
            end;
            return v676;
        end)())("visuals", "gs_indicators", true);
    end);
    local _ = v7.switch(v7.tabs.visuals_onscreen, v14.with_icon("envelope", "Notifications", "{Link Active}"))("visuals", "notifications", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 2;
    end)(function(v679)
        -- upvalues: v7 (ref)
        v7.color_picker(v679, "Miss", color("96C83CFF"))("visuals", "miss_notify_color", true)();
        v7.color_picker(v679, "Hit", color("96C83CFF"))("visuals", "hit_notify_color", true)();
        v7.color_picker(v679, "Fired at you", color("96C83CFF"))("visuals", "fired_notify_color", true)();
        v7.switch(v679, "Legacy Version")("visuals", "legacy_ind", true)();
    end);
    v23.cvar = cvar.r_aspectratio;
    v23.cvar_float_raw = v23.cvar.float;
    v23.handle = function(_)
        -- upvalues: v22 (ref), v8 (ref), v23 (ref)
        local v682 = v22.new("aspect_ratio", v8.elements.visuals.aspect_ratio_changer_value / 100, nil, v8.elements.visuals.aspect_ratio_changer_value / 100);
        if v8.elements.visuals.aspect_ratio_changer_value == 50 then
            v682 = 0;
        end;
        if not v8.elements.visuals.aspect_ratio_changer then
            v682 = 0;
        end;
        if v682 ~= v23.cvar_float_raw(v23.cvar) then
            v23.cvar_float_raw(v23.cvar, v682);
        end;
    end;
    v23.destroy = function()
        -- upvalues: v23 (ref)
        v23.cvar_float_raw(v23.cvar, 0);
    end;
    v23.ratios = {
        [161] = "16:10", 
        [177] = "16:9", 
        [125] = "5:4", 
        [150] = "3:2", 
        [133] = "4:3"
    };
    v7.switch(v7.tabs.visuals_misc, v14.with_icon("glasses-round", "Aspect Ratio", "{Link Active}"))("visuals", "aspect_ratio_changer", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 2;
    end)(function(v683)
        -- upvalues: v7 (ref), v23 (ref), v8 (ref)
        v7.slider(v683, "Value", 50, 300, 0, 0.01, function(v684)
            -- upvalues: v23 (ref)
            return v23.ratios[v684] or v684 == 50 and 0;
        end)("visuals", "aspect_ratio_changer_value", true, function()
            -- upvalues: v8 (ref)
            return v8.elements.visuals.aspect_ratio_changer;
        end);
        local v685 = 0;
        for v686, v687 in pairs(v23.ratios) do
            v685 = v685 + 1;
            do
                local l_v686_0 = v686;
                v7.button(v683, v687, function()
                    -- upvalues: v8 (ref), l_v686_0 (ref)
                    v8.refs.visuals.aspect_ratio_changer_value.ref:set(l_v686_0);
                end, true)("visuals", "aspect_ratio_changer_" .. v685, false, function()
                    -- upvalues: v8 (ref)
                    return v8.elements.visuals.aspect_ratio_changer;
                end);
            end;
        end;
    end);
    v24.cvars = {
        viewmodel_fov = cvar.viewmodel_fov, 
        viewmodel_offset_x = cvar.viewmodel_offset_x, 
        viewmodel_offset_y = cvar.viewmodel_offset_y, 
        viewmodel_offset_z = cvar.viewmodel_offset_z
    };
    v24.handle = function()
        -- upvalues: v8 (ref), v24 (ref)
        if v8.elements.visuals.viewmodel_changer then
            v24.cvars.viewmodel_fov:float(v8.elements.visuals.viewmodel_changer_fov, true);
            v24.cvars.viewmodel_offset_x:float(v8.elements.visuals.viewmodel_changer_x / 100, true);
            v24.cvars.viewmodel_offset_y:float(v8.elements.visuals.viewmodel_changer_y / 100, true);
            v24.cvars.viewmodel_offset_z:float(v8.elements.visuals.viewmodel_changer_z / 100, true);
        else
            v24.cvars.viewmodel_fov:float(68);
            v24.cvars.viewmodel_offset_x:float(2.5);
            v24.cvars.viewmodel_offset_y:float(0);
            v24.cvars.viewmodel_offset_z:float(-1.5);
        end;
    end;
    v24.destroy = function()
        -- upvalues: v24 (ref)
        v24.cvars.viewmodel_fov:float(68);
        v24.cvars.viewmodel_offset_x:float(2.5);
        v24.cvars.viewmodel_offset_y:float(0);
        v24.cvars.viewmodel_offset_z:float(-1.5);
    end;
    v7.switch(v7.tabs.visuals_misc, v14.with_icon("hands", "View Model", "{Link Active}"))("visuals", "viewmodel_changer", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 2;
    end)(function(v689)
        -- upvalues: v7 (ref), v14 (ref), v8 (ref)
        v7.slider(v689, v14.with_icon("street-view", "Field of View", "{Link Active}"), 0, 100, 68)("visuals", "viewmodel_changer_fov", true, function()
            -- upvalues: v8 (ref)
            return v8.elements.visuals.viewmodel_changer;
        end);
        v7.slider(v689, v14.with_icon("sliders-simple", "X Axis", "{Link Active}"), -3000, 3000, 205, 0.01)("visuals", "viewmodel_changer_x", true, function()
            -- upvalues: v8 (ref)
            return v8.elements.visuals.viewmodel_changer;
        end);
        v7.slider(v689, v14.with_icon("sliders-simple", "Y Axis", "{Link Active}"), -3000, 3000, 100, 0.01)("visuals", "viewmodel_changer_y", true, function()
            -- upvalues: v8 (ref)
            return v8.elements.visuals.viewmodel_changer;
        end);
        v7.slider(v689, v14.with_icon("sliders-simple", "Z Axis", "{Link Active}"), -3000, 3000, -100, 0.01)("visuals", "viewmodel_changer_z", true, function()
            -- upvalues: v8 (ref)
            return v8.elements.visuals.viewmodel_changer;
        end);
        v7.button(v689, v14.with_icon("arrow-right", "Default Values", "{Link Active}"), function()
            -- upvalues: v8 (ref)
            v8.refs.visuals.viewmodel_changer_fov.ref:set(68);
            v8.refs.visuals.viewmodel_changer_x.ref:set(205);
            v8.refs.visuals.viewmodel_changer_y.ref:set(0);
            v8.refs.visuals.viewmodel_changer_z.ref:set(-150);
        end, true)("visuals", "viewmodel_changer_default", false, function()
            -- upvalues: v8 (ref)
            return v8.elements.visuals.viewmodel_changer;
        end);
    end);
    v30.handle = function()
        -- upvalues: v8 (ref), v30 (ref)
        if not v8.elements.misc.clantag then
            return;
        elseif not globals.is_connected then
            return;
        else
            local v690 = v30.anim("luasense", {
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
            });
            v30.set(v690);
            return;
        end;
    end;
    v28.draw = function(v691, v692, v693, v694)
        -- upvalues: v14 (ref), v15 (ref)
        v692 = math.floor(v692);
        local v695 = v693 * 255;
        local l_v691_0 = v691;
        local v697 = render.measure_text(1, nil, l_v691_0);
        local v698 = vector(27, 12);
        local v699 = v697 + v698;
        local v700 = 11;
        local v701 = color(23, 23, 23, v695);
        v694 = v694:override("a", v695);
        local v702 = vector(v14.screen_size.x / 2 - v697.x / 2 - v698.x, v14.screen_size.y - v692);
        render.shadow(v702, v702 + v699, v694, 45, 1, v700);
        render.rect(v702, v702 + v699, v701, v700);
        render.text(1, v702 + v699 / 2, v15.white:override("a", v695), "c", l_v691_0);
    end;
    v28.per_notify_offset = 35;
    v28.base_offset = 100 * v14.dpi_scale.x;
    v28.show_time = 3;
    v28.anim_speed = v22.base_speed / 3;
    v28.list = {};
    v28.push = function(v703, v704)
        -- upvalues: v28 (ref), v8 (ref), v14 (ref)
        table.insert(v28.list, 1, {
            offset = 50, 
            state = 0, 
            text = v8.elements.visuals.legacy_ind and "\a" .. v704:to_hex() .. "L \aDEFAULT" .. v703 or v14.with_icon("triangle-exclamation", v703, v704 or v8.elements.visuals.accent), 
            shows_until = globals.realtime + v28.show_time, 
            color = v704 or v8.elements.visuals.accent
        });
    end;
    v28.handle = function()
        -- upvalues: v28 (ref)
        if #v28.list == 0 then
            return;
        else
            local l_base_offset_0 = v28.base_offset;
            local l_realtime_1 = globals.realtime;
            for v707, v708 in pairs(v28.list) do
                l_base_offset_0 = l_base_offset_0 + v28.per_notify_offset;
                local l_l_base_offset_0_0 = l_base_offset_0;
                local v710 = v708.shows_until < l_realtime_1 or v707 > 3;
                local v711 = v710 and 0 or 1;
                v28.list[v707].state = math.lerp(v708.state, v711, v28.anim_speed);
                v28.list[v707].offset = math.lerp(v708.offset, l_l_base_offset_0_0, v28.anim_speed);
                v28.draw(v708.text, v28.list[v707].offset, v28.list[v707].state, v708.color);
                if v708.state < 0.01 and v710 then
                    table.remove(v28.list, v707);
                end;
            end;
            return;
        end;
    end;
    v10.register("render", "notifications", v28.handle);
    local v712 = vector(315, 332) * 0.85;
    local v713 = render.load_image("        ", v712);
    local v714 = v7.texture(v7.tabs.homepage2, v713, v712, color(255, 255, 255, 255), "f")("aa", "menu_img_object", false)():visibility(false);
    do
        local l_v712_0, l_v714_0 = v712, v714;
        local function v719(v717)
            -- upvalues: l_v712_0 (ref), l_v714_0 (ref)
            if v717 and #v717 > 0 then
                local v718 = render.load_image(v717, l_v712_0);
                l_v714_0:set(v718);
                l_v714_0:visibility(true);
            end;
        end;
        local l_status_4, _ = pcall(function()
            return network.get("https://raw.githubusercontent.com/zxjapan/ls_config/main/t_LSLOGO.png", {}, v719);
        end);
    end;
    v7.switch(v7.tabs.visuals_onscreen, v14.with_icon("gauge-simple-min", "Slowed Down", "{Link Active}"))("visuals", "slowed_down", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 2;
    end);
    v7.switch(v7.tabs.visuals_onscreen, v14.with_icon("code-simple", "Manual Arrows", "{Link Active}"))("visuals", "manual_arrows", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 2;
    end)(function(v720)
        -- upvalues: v7 (ref), v15 (ref)
        v7.combo(v720, "Type", {
            [1] = "Default"
        }, {})("visuals", "manual_arrows_type");
        v7.color_picker(v720, "Color 1 Active", color("96C83CFF"))("visuals", "manual_arrows_color1", true);
        v7.color_picker(v720, "Color 1 Disabled", v15.black:override("a", 150))("visuals", "manual_arrows_color1_disabled", true);
        v7.color_picker(v720, "Color 2", color("96C83CFF"))("visuals", "manual_arrows_color2", true);
        v7.slider(v720, "Size", 5, 55, 25)("visuals", "manual_arrows_size", true);
        v7.switch(v720, "Inverted")("visuals", "manual_arrows_inverted", true);
    end);
    v29.default_padding = 85;
    v29.default_grayscale = 0.85;
    v29.alternative = function()
        -- upvalues: v9 (ref), v29 (ref), v22 (ref), v8 (ref), v14 (ref)
        local _, v722 = v9.is_manuals();
        local v723 = v722 == "Left";
        local v724 = v722 == "Right";
        local v725 = v29.get_velocity_offset();
        v725 = vector(v22.new("manual_arrows_offset", v725), 0);
        local l_default_grayscale_0 = v29.default_grayscale;
        local l_manual_arrows_color1_0 = v8.elements.visuals.manual_arrows_color1;
        local v728 = l_manual_arrows_color1_0:grayscale(l_default_grayscale_0);
        local l_manual_arrows_color2_0 = v8.elements.visuals.manual_arrows_color2;
        local v730 = l_manual_arrows_color2_0:grayscale(l_default_grayscale_0);
        local v731 = not v8.elements.visuals.manual_arrows_inverted;
        local v732 = {
            right = {
                [1] = nil, 
                [2] = nil, 
                [3] = nil, 
                [4] = nil, 
                [5] = 0.1, 
                [1] = v14.screen_center + v725, 
                [2] = v724 and l_manual_arrows_color1_0 or v728, 
                [3] = v9.current_side and l_manual_arrows_color2_0 or v730, 
                [4] = v731 and 180 or 0
            }, 
            left = {
                [1] = nil, 
                [2] = nil, 
                [3] = nil, 
                [4] = nil, 
                [5] = 0.1, 
                [1] = v14.screen_center - v725, 
                [2] = v723 and l_manual_arrows_color1_0 or v728, 
                [3] = v9.current_side and v730 or l_manual_arrows_color2_0, 
                [4] = v731 and 0 or 180
            }
        };
        v29.circle_triangle(unpack(v732.right));
        v29.circle_triangle(unpack(v732.left));
    end;
    v29.get_velocity_offset = function()
        -- upvalues: v14 (ref), v29 (ref), v13 (ref)
        local l_x_3 = v14.dpi_scale.x;
        local v734 = v29.default_padding * l_x_3;
        local v735 = math.clamp(v13.shared_data.velocity:length() / (17 * l_x_3), 0, 200 * l_x_3);
        return v734 * 0.75 + v735;
    end;
    v29.generator_sizes = vector(25, 10);
    v29.generate_arrows_polygons = function(v736)
        -- upvalues: v29 (ref), v8 (ref), v22 (ref), v14 (ref)
        local v737 = v29.get_velocity_offset();
        if v8.elements.visuals.manual_arrows_inverted then
            v737 = -v737 - v29.generator_sizes.x;
        end;
        v737 = vector(v22.new("manual_arrows_offset", v737), 0);
        local v738 = {
            left = v14.screen_center - v737, 
            right = v14.screen_center + v737
        };
        local l_x_4 = v29.generator_sizes.x;
        local l_y_2 = v29.generator_sizes.y;
        local v741 = {
            left = {
                vector(0, -l_y_2), 
                vector(-l_x_4, 0), 
                vector(0, l_y_2)
            }, 
            right = {
                vector(0, -l_y_2), 
                vector(l_x_4, 0), 
                vector(0, l_y_2)
            }
        };
        for v742, v743 in pairs(v741) do
            for v744, v745 in ipairs(v743) do
                v741[v742][v744] = v745 * v736 + v738[v742];
            end;
        end;
        return v741, v738;
    end;
    v29.default = function()
        -- upvalues: v8 (ref), v14 (ref), v29 (ref), v9 (ref), v15 (ref)
        local v746 = v8.elements.visuals.manual_arrows_size / 35 * v14.dpi_scale.y;
        local v747, v748 = v29.generate_arrows_polygons(v746);
        local l_manual_arrows_color1_1 = v8.elements.visuals.manual_arrows_color1;
        local l_manual_arrows_color2_1 = v8.elements.visuals.manual_arrows_color2;
        local _, v752 = v9.is_manuals();
        local v753 = v752 == "Left";
        local v754 = v752 == "Right";
        if v8.elements.visuals.manual_arrows_inverted then
            local l_v754_0 = v754;
            v754 = v753;
            v753 = l_v754_0;
        end;
        local v756;
        if not v753 then
            v756 = v754;
        else
            v756 = v753;
        end;
        local v757 = 0.6;
        local v758 = v15.black:override("a", 255 * v757);
        local l_manual_arrows_color1_disabled_0 = v8.elements.visuals.manual_arrows_color1_disabled;
        local v760 = v753 and l_manual_arrows_color1_1 or l_manual_arrows_color1_disabled_0;
        local v761 = v754 and l_manual_arrows_color1_1 or l_manual_arrows_color1_disabled_0;
        local l_left_0 = v747.left;
        local l_right_0 = v747.right;
        local v764 = v748.left + vector(2, 0);
        local v765 = v748.right - vector(3, 0);
        local v766 = 15 * v746 / 1.5;
        v766 = vector(0, v766);
        local v767 = vector(1, v766.y);
        if v753 or not v756 then
            render.poly_blur(1, 0.2, unpack(l_left_0));
            render.poly(v760:override("a", v760.a * v757), unpack(v747.left));
            render.poly_line(v760, l_left_0[#l_left_0], unpack(l_left_0));
            render.rect(v764 + v767, v764 - v766, not v9.current_side and l_manual_arrows_color2_1 or v758, 0, true);
        end;
        if v754 or not v756 then
            render.poly_blur(1, 0.2, unpack(l_right_0));
            render.poly(v761:override("a", v761.a * v757), unpack(v747.right));
            render.poly_line(v761, l_right_0[#l_right_0], unpack(l_right_0));
            render.rect(v765 + v767, v765 - v766, v9.current_side and l_manual_arrows_color2_1 or v758, 0, true);
        end;
    end;
    v29.handle = function()
        -- upvalues: v8 (ref), v13 (ref), v29 (ref)
        if not v8.elements.visuals.manual_arrows or not v13.shared_data.able_to_render then
            return;
        elseif v8.elements.visuals.manual_arrows_type == "Alternative" then
            v29.alternative();
            return;
        else
            v29.default();
            return;
        end;
    end;
    v7.label(v7.tabs.homepage, v14.with_icon("user", "User ", "{Link Active}") .. v14.with_icon("arrow-right-long", " " .. v14.username .. (v40 and " \aEB6161FF [BETA]" or ""), "{Link Active}"));
    v7.label(v7.tabs.homepage, v14.with_icon("pen-to-square", "Last update: \a{Link Active} " .. v14.last_update, "{Link Active}"));
    v7.button(v7.tabs.verify, v14.with_icon("discord", "\n", "{Link Active}"), function()

    end, true);
    v7.button(v7.tabs.verify, v14.with_icon("hand-point-right", "Join Server", "{Link Active}"), function()
        panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/XWzN4Yztby");
    end, true);
    v7.button(v7.tabs.homepage3, v14.with_icon("youtube", "YT", "{Link Active}"), function()
        panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://en.neverlose.cc/market/item?id=RuE7C8");
    end, true);
    v7.button(v7.tabs.homepage3, v14.with_icon("star", "Config", "{Link Active}"), function()
        panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://en.neverlose.cc/market/item?id=RuE7C8");
    end, true);
    v7.current_code = "";
    v7.button(v7.tabs.verify, v14.with_icon("key", "Get Code", "{Link Active}"), function(v768)
        -- upvalues: v8 (ref), v7 (ref), v40 (ref), v92 (ref)
        v768:disabled(true);
        v8.refs.homepage.code.ref:visibility(false);
        v8.refs.homepage.code2.ref:visibility(false);
        v7.current_code = generate_verification_code("branbabe", v40 and "luasensecatboy8237176" or "liveluasensecatboy8237176");
        print(v92(generate_verification_code("branbabe", v40 and "luasensecatboy8237176" or "liveluasensecatboy8237176")));
        v8.refs.homepage.code.ref:set(v7.current_code);
        v8.refs.homepage.code.ref:visibility(true);
        v8.refs.homepage.code2.ref:visibility(true);
    end, true);
    v7.button(v7.tabs.verify, v14.with_icon("copy", " Copy", "{Link Active}"), function()
        -- upvalues: l_clipboard_0 (ref), v7 (ref), v8 (ref), v28 (ref)
        if l_clipboard_0 then
            l_clipboard_0.set(v7.current_code);
        end;
        local l_accent_1 = v8.elements.visuals.accent;
        v28.push(string.format("Code [\a%s%s\aDEFAULT] has been copied!", l_accent_1:to_hex(), v7.current_code), l_accent_1);
    end, true)("homepage", "code2", false)():visibility(false);
    v7.input(v7.tabs.verify, "", "to be aquired")("homepage", "code", false)():visibility(false):set_callback(function()
        -- upvalues: v8 (ref), v7 (ref)
        v8.refs.homepage.code.ref:set(v7.current_code);
    end);
    v7.load_by_url = v125("load_by_url", true, function(v770, v771)
        -- upvalues: v125 (ref), l_base64_0 (ref), v8 (ref), v28 (ref)
        v770:disabled(true);
        network.get(v771, {}, v125("load_default", true, function(v772)
            -- upvalues: l_base64_0 (ref), v8 (ref), v28 (ref), v770 (ref)
            local v773 = l_base64_0.decode(v772);
            local v774 = msgpack.unpack(v773);
            v8.configs.load(v774);
            v28.push("Config has been successfully imported!");
            v770:disabled(false);
        end));
    end);
    v7.slider(v7.tabs.misc, v14.with_icon("trash-clock", "Fake Latency", "{Link Active}"), 0, 200, 0, 1, "ms")("misc", "unlock_spike", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual ~= 1;
    end);
    v7.switch(v7.tabs.misc, v14.with_icon("microchip-ai", "AI-Peek", "{Link Active}"))("misc", "ai_peek", true, function()
        -- upvalues: v8 (ref)
        return v8.elements.aa.active_misc_visual == 3;
    end)(function(v775)
        -- upvalues: v7 (ref)
        v7.switch(v775, "Notify")("misc", "ai_peek_notify");
        v7.slider(v775, "Perfomance impact", 30, 100, 50)("misc", "autopeek_perfomance");
        v7.slider(v775, "Safety ticks", 1, 32, 8)("misc", "autopeek_safety");
        v7.listable(v775, "Hitgroups", {
            [1] = "Stomach", 
            [2] = "Arms", 
            [3] = "Legs", 
            [4] = "Head", 
            [5] = "Chest"
        }, {
            [1] = "Stomach", 
            [2] = "Chest"
        })("misc", "autopeek_hitgroups");
        v7.switch(v775, "Debug")("misc", "ai_peek_debug");
    end);
    v33.peek_states = {
        MOVE_BACK = 3, 
        COOLDOWN = 2, 
        MOVING = 1, 
        STANDBY = 0
    };
    v33.context = {
        distance = 0, 
        timestamp = 0, 
        direction = 0, 
        can_autopeek = false, 
        state = v33.peek_states.STANDBY, 
        original_position = vector()
    };
    v33.minimum_damage = function(v776)
        -- upvalues: v11 (ref)
        local v777 = v11.get_value("min_damage");
        local l_m_iHealth_1 = v776.m_iHealth;
        if v777 > 100 then
            return l_m_iHealth_1 + (v777 - 100);
        else
            return math.min(math.max(1, v777), l_m_iHealth_1);
        end;
    end;
    v33.can_autopeek = (function()
        -- upvalues: v8 (ref), v11 (ref)
        local function v784()
            local v779 = entity.get_local_player();
            if v779 == nil then
                return false;
            else
                local v780 = v779:get_player_weapon();
                if v780 == nil then
                    return false;
                else
                    local v781 = v779.m_nTickBase * globals.tickinterval;
                    local l_m_flNextAttack_0 = v779.m_flNextAttack;
                    local l_m_flNextPrimaryAttack_0 = v780.m_flNextPrimaryAttack;
                    return l_m_flNextAttack_0 <= v781 and l_m_flNextPrimaryAttack_0 <= v781;
                end;
            end;
        end;
        return function(v785)
            -- upvalues: v8 (ref), v11 (ref), v784 (ref)
            for _, v787 in ipairs({
                [1] = "in_forward", 
                [2] = "in_back", 
                [3] = "in_moveleft", 
                [4] = "in_moveright", 
                [5] = "in_jump", 
                [6] = "in_duck"
            }) do
                if v785[v787] then
                    return false;
                end;
            end;
            if not v8.elements.misc.ai_peek then
                return false;
            elseif not v11.get_value("doubletap") or not v11.get_value("quick_peek") then
                return false;
            else
                local v788 = entity.get_local_player();
                if v788 == nil then
                    return false;
                else
                    local v789 = v788:get_player_weapon();
                    if v789 == nil then
                        return false;
                    elseif v789:get_weapon_info().weapon_type == 0 then
                        return false;
                    elseif rage.exploit:get() < 1 then
                        return false;
                    elseif not v784() then
                        return false;
                    else
                        return true;
                    end;
                end;
            end;
        end;
    end)();
    v33.get_max_peek_distance = function()
        local v790 = entity.get_local_player():get_player_weapon();
        if not v790 then
            return;
        else
            return v790:get_max_speed(), 2.5 / 10;
        end;
    end;
    v33.select_target = function()
        local v791 = entity.get_local_player();
        if v791 == nil then
            return;
        else
            local v792 = v791:get_eye_position();
            local v793 = vector():angles(render.camera_angles());
            local l_huge_1 = math.huge;
            local v795 = nil;
            local function v799(v796)
                -- upvalues: v792 (ref), v793 (ref), l_huge_1 (ref), v795 (ref)
                if not v796:is_alive() then
                    return;
                elseif v796.m_bGunGameImmunity then
                    return;
                else
                    local v797 = v796:get_hitbox_position(2);
                    if v797:length() <= 0 then
                        return;
                    else
                        local v798 = v797:dist_to_ray(v792, v793);
                        if v798 < l_huge_1 then
                            l_huge_1 = v798;
                            v795 = v796;
                        end;
                        return;
                    end;
                end;
            end;
            entity.get_players(true, false, v799);
            return v795;
        end;
    end;
    v33.find_peek_positions = function(v800)
        -- upvalues: v33 (ref), v8 (ref), v97 (ref), l_AddSphereOverlay_0 (ref)
        local v801 = entity.get_local_player();
        if v801 == nil then
            return;
        else
            local v802 = render.camera_angles();
            local v803 = v801:get_origin();
            local l_m_vecVelocity_2 = v801.m_vecVelocity;
            local v805 = v803:to((v800:get_origin()));
            local v806, v807 = v33.get_max_peek_distance();
            if not v806 then
                return {};
            else
                local v808 = {};
                for v809 = 0, 360, 360 / math.floor(v8.elements.misc.autopeek_perfomance / 100 * 16) do
                    local v810 = v801:simulate_movement(nil, vector():angles(0, v802.y + v809):scaled(v806) - l_m_vecVelocity_2);
                    v810:think(to_ticks(v807));
                    if bit.band(v810.flags, v97) ~= 0 then
                        local v811 = v803:to(v810.origin);
                        local v812 = math.deg(math.acos(v805:dot(v811)));
                        if v8.elements.misc.ai_peek_debug then
                            l_AddSphereOverlay_0(v810.origin, 5, 7, 7, 255, 255, 255, 255, globals.tickinterval * 2);
                        end;
                        local v813 = v810.origin + vector(0, 0, v810.view_offset);
                        table.insert(v808, {
                            [1] = v813, 
                            [2] = v802.y + v809, 
                            [3] = v810.origin:dist(v803), 
                            [4] = v812
                        });
                    else
                        break;
                    end;
                end;
                table.sort(v808, function(v814, v815)
                    return math.abs(90 - v814[4]) < math.abs(90 - v815[4]);
                end);
                return v808;
            end;
        end;
    end;
    v33.select_hitboxes = (function()
        -- upvalues: v8 (ref)
        local function v827(v816, v817)
            local v818 = entity.get_local_player();
            if v818 == nil then
                return;
            else
                local v819 = v818:get_player_weapon();
                if v819 == nil then
                    return;
                else
                    local v820 = v819:get_weapon_info();
                    local v821 = ({
                        [1] = 4, 
                        [2] = 1.25, 
                        [3] = nil, 
                        [4] = nil, 
                        [5] = nil, 
                        [6] = 0.75
                    })[v817] or 1;
                    local v822 = ({
                        [1] = nil, 
                        [2] = true, 
                        [3] = true, 
                        [4] = true, 
                        [1] = v816.m_bHasHelmet
                    })[v817];
                    local v823 = v820.damage * v821;
                    if v822 then
                        local v824 = v820.armor_ratio / 2;
                        local l_m_ArmorValue_0 = v816.m_ArmorValue;
                        local v826 = nil;
                        if l_m_ArmorValue_0 < v823 * v824 / 2 then
                            v826 = l_m_ArmorValue_0 * 4;
                        else
                            v826 = v823;
                        end;
                        v823 = v823 - v826 * (1 - v824);
                    end;
                    return v823;
                end;
            end;
        end;
        return function(v828, v829)
            -- upvalues: v8 (ref), v827 (ref)
            local v830 = {
                Head = {
                    [1] = 1, 
                    [2] = {
                        [1] = 0
                    }
                }, 
                Chest = {
                    [1] = 2, 
                    [2] = {
                        [1] = 4, 
                        [2] = 5, 
                        [3] = 6
                    }
                }, 
                Stomach = {
                    [1] = 3, 
                    [2] = {
                        [1] = 2, 
                        [2] = 3
                    }
                }, 
                Arms = {
                    [1] = 4, 
                    [2] = {
                        [1] = 13, 
                        [2] = 14, 
                        [3] = 16, 
                        [4] = 18
                    }
                }, 
                Legs = {
                    [1] = 6, 
                    [2] = {
                        [1] = 7, 
                        [2] = 8, 
                        [3] = 9, 
                        [4] = 10
                    }
                }
            };
            local v831 = {
                [1] = "Stomach", 
                [2] = "Arms", 
                [3] = "Legs", 
                [4] = "Head", 
                [5] = "Chest"
            };
            local v832 = {};
            local l_autopeek_hitgroups_0 = v8.elements.misc.autopeek_hitgroups;
            for _, v835 in ipairs(v831) do
                if l_autopeek_hitgroups_0[v835] then
                    local v836, v837 = unpack(v830[v835]);
                    if v827(v828, v836) >= v829 then
                        for _, v839 in ipairs(v837) do
                            table.insert(v832, v839);
                        end;
                    end;
                end;
            end;
            return v832;
        end;
    end)();
    v33.ensure_safety = {};
    v33.setup_command = function(v840)
        -- upvalues: v33 (ref), v11 (ref), v8 (ref), v28 (ref)
        if not v33.can_autopeek(v840) then
            v33.context.can_autopeek = false;
            v33.context.state = v33.peek_states.STANDBY;
            return;
        else
            v11.override("retreat_mode", {
                [1] = "On Shot"
            });
            local v841 = common.get_timestamp();
            if v33.context.state == v33.peek_states.COOLDOWN then
                if v841 < v33.context.timestamp then
                    v33.context.can_autopeek = false;
                    return;
                else
                    v33.context.state = v33.peek_states.STANDBY;
                end;
            end;
            local v842 = entity.get_local_player();
            local v843 = v842:get_origin();
            if ({
                [v33.peek_states.MOVING] = true, 
                [v33.peek_states.MOVE_BACK] = true
            })[v33.context.state] then
                if v33.context.state == v33.peek_states.MOVING and not v33.context.autopeek_target or not v33.context.autopeek_target:is_alive() then
                    v33.context.state = v33.peek_states.STANDBY;
                    return;
                else
                    local v844 = v843:dist(v33.context.original_position);
                    if v33.context.distance * 1.1 < v844 then
                        rage.exploit:force_teleport();
                        v33.context.state = v33.peek_states.MOVE_BACK;
                    elseif v33.context.state == v33.peek_states.MOVE_BACK and v844 < 5 then
                        v33.context.state = v33.peek_states.COOLDOWN;
                        v33.context.timestamp = v841 + g_peek_cooldown:get() * 100 / 2;
                    end;
                    v840.move_yaw = v33.context.direction;
                    local v845, v846, v847 = unpack(({
                        [false] = {
                            [1] = 450, 
                            [2] = true, 
                            [3] = false
                        }, 
                        [true] = {
                            [1] = 0, 
                            [2] = false, 
                            [3] = false
                        }
                    })[v33.context.state == v33.peek_states.MOVE_BACK]);
                    if v33.context.state == v33.peek_states.MOVE_BACK then
                        v11.override("retreat_mode", {
                            [1] = "On Shot", 
                            [2] = "On Key Release"
                        });
                    end;
                    v840.forwardmove = v845;
                    v840.in_forward = v846;
                    v840.in_back = v847;
                    v840.sidemove = 0;
                    v840.in_left = false;
                    v840.in_right = false;
                    v840.in_moveleft = false;
                    v840.in_moveright = false;
                    v840.in_jump = false;
                    return;
                end;
            else
                local v848 = v33.select_target();
                if not v848 then
                    v33.context.can_autopeek = false;
                    return;
                else
                    v33.context.can_autopeek = true;
                    local v849 = v33.minimum_damage(v848);
                    local v850 = v33.select_hitboxes(v848, v849);
                    local v851 = v33.find_peek_positions(v848);
                    local v852 = nil;
                    local v853 = nil;
                    local v854 = nil;
                    local v855 = false;
                    for _, v857 in ipairs(v851) do
                        local v858, v859, v860 = unpack(v857);
                        local _ = common.get_timestamp();
                        for _, v863 in ipairs(v850) do
                            local v864 = v848:get_hitbox_position(v863);
                            if v864:length() > 0 then
                                local v865, v866 = utils.trace_bullet(v842, v858, v864);
                                local l_entity_1 = v866.entity;
                                if (not l_entity_1 or not l_entity_1:is_player() or l_entity_1:is_enemy()) and v849 <= v865 then
                                    v855 = true;
                                    v853 = v859;
                                    v852 = v865;
                                    v854 = v860;
                                end;
                            end;
                            if v855 then
                                break;
                            end;
                        end;
                        if v855 then
                            break;
                        end;
                    end;
                    local v868 = v848:get_index();
                    if not v853 then
                        v33.ensure_safety[v868] = 0;
                        return;
                    else
                        v33.ensure_safety[v868] = v33.ensure_safety[v868] + 1;
                        if v8.elements.misc.autopeek_safety > v33.ensure_safety[v868] then
                            return;
                        else
                            v33.context.state = v33.peek_states.MOVING;
                            v33.context.direction = v853;
                            v33.context.original_position = v843;
                            v33.context.autopeek_target = v848;
                            v33.context.distance = v854;
                            if v8.elements.misc.ai_peek_notify then
                                v28.push(string.format("AI-Peeking %s for %d damage", v848:get_name(), v852));
                            end;
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
    v33.aim_fire = function()
        -- upvalues: v33 (ref)
        if v33.context.state ~= v33.peek_states.COOLDOWN and v33.context.state ~= v33.peek_states.STANDBY then
            v33.context.state = v33.peek_states.COOLDOWN;
            v33.ensure_safety = {};
            v33.context.timestamp = common.get_timestamp() + 1500;
        end;
    end;
    v34.handle = v125("slowed_down", true, function()
        -- upvalues: v13 (ref), v8 (ref), v22 (ref), v17 (ref), v15 (ref)
        if not v13.shared_data.able_to_render or not v8.elements.visuals.slowed_down then
            return;
        else
            local v869 = entity.get_local_player();
            if v869 == nil then
                return;
            else
                local v870 = ui.get_alpha();
                local v871 = v870 == 1 and 0.5 or v869.m_flVelocityModifier;
                local v872 = v22.new("velocity_modifier", v17.current_drugging_item == "slowed_down" and 100 or v871 == 1 and 0 or 255);
                if v872 < 0.03 then
                    return;
                else
                    local v873 = vector(v17.database.slowed_down_pos_x, v17.database.slowed_down_pos_y);
                    local l_v873_0 = v873;
                    local v875 = v8.elements.visuals.accent:alpha_modulate(v872);
                    local v876 = "Max velocity reduced by";
                    local v877 = render.measure_text(1, nil, v876 .. " 100%");
                    local v878 = vector(v877.x + 3, 6);
                    render.text(1, v873, v15.white:alpha_modulate(v872), nil, string.format(v876 .. " %d%%", v871 * 100));
                    v873 = v873 + vector(0, 15);
                    local v879 = {
                        [1] = v873 - 1, 
                        [2] = v873 + v878 + 1
                    };
                    render.rect(v879[1], v879[2], v15.black:alpha_modulate(math.min(200, v872)), 2);
                    render.shadow(v879[1], v879[2], v875, 25, 0, 3);
                    render.rect(v873 + 1, v873 + v878 * vector(v871, 1) - 1, v875, 2);
                    v17.drag_handle(l_v873_0, v878 + vector(1, 15), "slowed_down", v870);
                    return;
                end;
            end;
        end;
    end);
    v10.register("render", "sloweddown.handle", v34.handle);
    v10.register("createmove", "autopeek.setup_command", v33.setup_command);
    v10.register("aim_fire", "autopeek.aim_fire", v33.aim_fire);
    v11.last_update = 0;
    v10.register("render", "reverse_overrides", function()
        -- upvalues: v11 (ref)
        local l_tickcount_1 = globals.tickcount;
        if l_tickcount_1 == v11.last_update then
            return;
        else
            v11.last_update = l_tickcount_1;
            v11.deoverride_unused();
            return;
        end;
    end);
    v10.register("render", "r8_helper", function()
        -- upvalues: v8 (ref), v286 (ref)
        if v8.elements.visuals.r8_help then
            v286:set(true);
        end;
        if not v8.elements.visuals.r8_help then
            v286:set(false);
        end;
    end);
    v31.latest_prediction = nil;
    v31.stabilized_angle = nil;
    v31.stabilize = function(_)
        -- upvalues: v31 (ref)
        v31.stabilized_angle = nil;
        if v31.latest_prediction == nil then
            return;
        else
            return;
        end;
    end;
    v31.store = function(v882)
        -- upvalues: v31 (ref)
        v31.latest_prediction = v882;
    end;
    v31.override_view = function(_)
        -- upvalues: v31 (ref)
    end;
    v31.createmove = function(_)
        -- upvalues: v31 (ref)
        if v31.stabilized_angle == nil then
            return;
        else
            return;
        end;
    end;
    v29.circle_triangle = function(v885, v886, v887, v888, v889)
        -- upvalues: v8 (ref)
        local v890 = 360 * v889;
        local l_manual_arrows_size_0 = v8.elements.visuals.manual_arrows_size;
        local v892 = v888 - v890 / 2;
        render.circle_gradient(v885, v886:override("a", 0), v886, l_manual_arrows_size_0, v892, v889);
        render.circle_outline(v885, v887, l_manual_arrows_size_0, v892, v889, l_manual_arrows_size_0 / 12.5);
    end;
    v36.active_by_cond = false;
    v36.position = {};
    v36.exploit_active = false;
    v36.handle = function(_)
        -- upvalues: v36 (ref), v9 (ref), v11 (ref)
        rage.exploit:allow_charge(true);
        v36.active_by_cond = false;
        v36.position = {};
        if not v36.exploit_active then
            return;
        else
            local _ = v9.state_to_string[v9.player_state];
            return;
        end;
    end;
    v36.stupid = function(v895)
        -- upvalues: v8 (ref), v11 (ref)
        if v8.elements.aa.auto_lag_exploit ~= "Default" then
            return;
        else
            v11.override("doubletap_config", "Always on", true);
            v11.override("doubletap", v895.tickcount % 20 ~= 0, true);
            return;
        end;
    end;
    v36.exploit = function(_)
        -- upvalues: v36 (ref), v8 (ref), v11 (ref), v9 (ref)
        v36.exploit_active = false;
        if v8.elements.aa.auto_lag_exploit ~= "Smart" then
            return;
        else
            v36.exploit_active = true;
            v11.fake_latency:override(v8.elements.misc.unlock_spike);
            v11.override("doubletap_config", "Always on", true);
            v11.override("doubletap", true, true);
            if rage.exploit:get() ~= 1 then
                rage.exploit:force_charge();
                return;
            else
                rage.exploit:allow_charge(true);
                rage.exploit:allow_defensive(true);
                local v897 = v9.defensive_state - 1;
                local l_tickcount_2 = globals.tickcount;
                if v897 < l_tickcount_2 and math.diff(v897, l_tickcount_2) < 16 then
                    rage.exploit:force_teleport();
                end;
                return;
            end;
        end;
    end;
    v10.register("createmove", "autoteleport.stupid", v36.stupid);
    v10.register("createmove", "autoteleport.exploit", v36.exploit);
    v10.register("createmove", "autoteleport.handle", v36.handle);
    v10.register("render", "main_render", function()
        -- upvalues: v17 (ref), v20 (ref), v19 (ref), v14 (ref)
        v17.hovered_something = false;
        v20.parse();
        v19.render();
        v14.screen_size = render.screen_size();
        v14.screen_center = v14.screen_size / 2;
    end);
    v10.register("render", "watermark", function()
        -- upvalues: v8 (ref), v16 (ref), v17 (ref), v15 (ref)
        if not globals.is_in_game then
            return;
        else
            local v899 = nil;
            local l_watermark_position_0 = v8.elements.visuals.watermark_position;
            local v901, v902 = v16.build_text();
            if v16.positions[l_watermark_position_0] ~= nil then
                v899 = v16.positions[l_watermark_position_0];
            else
                v899 = vector(v17.database.watermark_pos_x, v17.database.watermark_pos_y);
                v17.drag_handle(v899, v902, "watermark", 1);
            end;
            v899 = v899 + v902;
            render.text(1, v899 - v902, v15.white, "s", v901);
            return;
        end;
    end);
    v10.register("createmove", "force_def", function(_)
        -- upvalues: v8 (ref), v9 (ref), v11 (ref)
        if not v8.elements.aa.force_defensive_cond[v9.state_to_string[v9.player_state]] then
            return;
        else
            v11.override("doubletap_config", "Always on");
            return;
        end;
    end);
    v10.register("createmove", "createmove.collect_shared", v13.collect_shared);
    v10.register("createmove", "unlock_spike", function()
        -- upvalues: v8 (ref), v11 (ref)
        if v8.elements.misc.unlock_spike > 0 then
            v11.override("fake_latency", v8.elements.misc.unlock_spike, true);
        end;
    end);
    v10.register("render", "createmove.collect_render_shared_info", v13.collect_render_shared_info);
    v10.register("localplayer_transparency", "conditional_antiaims.localplayer_transparency", v9.localplayer_transparency);
    v10.register("grenade_prediction", "nades.store", v31.store);
    v10.register("grenade_override_view", "nades.override_view", v31.override_view);
    v10.register("createmove", "nades.createmove", v31.createmove);
    v10.register("round_prestart", "conditional_antiaims.reset", v9.reset);
    v10.register("createmove_run", "set_command_start", v206);
    v10.register("createmove", "conditional_antiaims.setup_defensive_data", v9.setup_defensive_data);
    v10.register("render", "scope_overlay", v21.handle);
    v10.register("render", "clantag.handle", v30.handle);
    v10.register("shutdown", "clantag.clear", function()
        -- upvalues: v30 (ref)
        v30.clear(true);
    end);
    v10.register("render", "manual_arrows.handle", v29.handle);
    v10.register("render", "centered.handle", v39.handle);
    v10.register("render", "aspect_ratio", v23.handle);
    v10.register("shutdown", "aspect_ratio", v23.destroy);
    v10.register("render", "viewmodel", v24.handle);
    v10.register("shutdown", "viewmodel", v24.destroy);
    v10.register("shutdown", "draggables_shut", function()
        -- upvalues: v17 (ref)
        db.luasense_draggable = v17.database;
    end);
    v10.register("post_update_clientside_animation", "animbreaker.handle", v27.handle);
    v10.register("render", "animbreaker.handle_number", v27.handle);
    v10.register("createmove", "animbreaker.move_lean", v27.move_lean);
    v10.register("createmove", "update_state", v9.update_player_state);
    v10.register("createmove", "avoid coll", v18.handle);
    v10.register("createmove", "fast_ladder", v25.handle);
    v10.register("createmove", "conditions_update", v9.handle_update);
    v10.register("createmove", "autoduck.createmove", v32.createmove);
    v10.register("createmove", "air_hitchance.handle", v37.handle);
    v10.register("aim_ack", "hitlogs.aim_ack", v26.aim_ack);
    v10.register("player_hurt", "hitlogs.player_hurt", v26.player_hurt);
    v10.register("bullet_impact", "hitlogs.bullet_impact", v26.bullet_impact);

    local v949 = false;
    local v950 = false;
    local v951 = false;
    local v952 = 0;
    v7.button(v7.tabs.homepage, v14.with_icon("file-export", "Export", "{Link Active}"), v125("export_config", true, function()
        -- upvalues: v949 (ref), v8 (ref), l_base64_0 (ref), l_clipboard_0 (ref), v28 (ref)
        v949 = true;
        local v953 = v8.configs.parse();
        local v954 = msgpack.pack(v953);
        local v955 = l_base64_0.encode(v954);
        if l_clipboard_0 then
            l_clipboard_0.set(v955);
            v28.push("Config has been successfully exported!");
        else
            v28.push("Clipboard not available - use Save instead");
        end;
    end), true)("config_system", "export", false);
    v7.button(v7.tabs.homepage, v14.with_icon("file-import", "Import", "{Link Active}"), v125("import_config", true, function()
        -- upvalues: l_clipboard_0 (ref), l_base64_0 (ref), v950 (ref), v8 (ref), v28 (ref), v951 (ref)
        if not l_clipboard_0 then
            v951 = true;
            v28.push("Clipboard not available");
            return;
        end;
        local v956 = l_clipboard_0.get();
        local l_status_3, l_result_3 = pcall(function()
            -- upvalues: l_base64_0 (ref), v956 (ref)
            return l_base64_0.decode(v956);
        end);
        local v959 = msgpack.unpack(l_result_3);
        if l_status_3 then
            v950 = true;
            v8.configs.load(v959);
            v28.push("Config has been successfully imported!");
        else
            v951 = true;
        end;
    end), true)("config_system", "import", false);
    local _ = v7.label(v7.tabs.homepage, "\226\156\133 Successfully exported config!")("config_system", "export_label", true, function()
        -- upvalues: v8 (ref), v949 (ref)
        return v949;
    end);
    local _ = v7.label(v7.tabs.homepage, "\226\156\133 Successfully imported config!")("config_system", "import_label", true, function()
        -- upvalues: v8 (ref), v950 (ref)
        return v950;
    end);
    local _ = v7.label(v7.tabs.homepage, "\226\157\140 Something went wrong!")("config_system", "error_label", true, function()
        -- upvalues: v8 (ref), v951 (ref)
        return v951;
    end);
    v7.set_export_visible = function()
        -- upvalues: v949 (ref), v8 (ref), v952 (ref)
        if v949 then
            v8.refs.config_system.export_label.ref:visibility(true);
            v952 = v952 + 1;
            if v952 >= 65 then
                v952 = 0;
                v949 = false;
                v8.refs.config_system.export_label.ref:visibility(false);
            end;
        end;
    end;
    v7.set_import_visible = function()
        -- upvalues: v950 (ref), v8 (ref), v952 (ref)
        if v950 then
            v8.refs.config_system.import_label.ref:visibility(true);
            v952 = v952 + 1;
            if v952 >= 65 then
                v952 = 0;
                v950 = false;
                v8.refs.config_system.import_label.ref:visibility(false);
            end;
        end;
    end;
    v7.set_error_visible = function()
        -- upvalues: v951 (ref), v8 (ref), v952 (ref)
        if v951 then
            v8.refs.config_system.error_label.ref:visibility(true);
            v952 = v952 + 1;
            if v952 >= 65 then
                v952 = 0;
                v951 = false;
                v8.refs.config_system.error_label.ref:visibility(false);
            end;
        end;
    end;
    v10.register("render", "menu.set_export_visible", v7.set_export_visible);
    v10.register("render", "menu.set_import_visible", v7.set_import_visible);
    v10.register("render", "menu.set_error_visible", v7.set_error_visible);
    v7.configs_list = v7.list(v7.tabs.homepage, v14.with_icon("list-ul", "Saved Configs", "{Link Active}"), {})("config_system", "saved_list", false);
    v7.input(v7.tabs.homepage, "Config Name", "Type Here")("config_system", "config_name", false);
    v7.button(v7.tabs.homepage, v14.with_icon("plus", " Save ", "{Link Active}"), function()
        local v962 = v8.refs.config_system.config_name.ref:get();
        if not v962 or v962 == "" then
            v28.push("please enter a valid config name");
            return;
        else
            local v963 = v8.configs.parse();
            v8.configs.configs_db[v962] = v963;
            db.luasense_old_configs = v8.configs.configs_db;
            v7.update_saved_list();
            v28.push("config saved : " .. v962);
            return;
        end;
    end, true)("config_system", "save", false);
    v7.button(v7.tabs.homepage, v14.with_icon("folder-open", " Load ", "{Link Active}"), function()
        local v965 = v8.refs.config_system.saved_list.ref:get();
        if not v965 or v965 <= 0 then
            v28.push("please select valid config to load");
            return;
        else
            local v966 = v7.get_config_name_from_index(v965);
            if not v966 then
                v28.push("no config found");
                return;
            else
                local v967 = v8.configs.configs_db[v966];
                if not v967 then
                    v28.push("no config found with name : " .. v966);
                    return;
                else
                    v8.configs.load(v967, true);
                    v28.push("config loaded : " .. v966);
                    return;
                end;
            end;
        end;
    end, true)("config_system", "load", false);
    v7.button(v7.tabs.homepage, "\aFF0000FFdelete\aDEFAULT", function()
        local v968 = v8.refs.config_system.saved_list.ref:get();
        if not v968 or v968 <= 0 then
            v28.push("no config selected");
            return;
        else
            local v969 = v7.get_config_name_from_index(v968);
            if not v969 then
                v28.push("no config found");
                return;
            else
                v8.configs.configs_db[v969] = nil;
                db.luasense_old_configs = v8.configs.configs_db;
                v7.update_saved_list();
                v28.push("config deleted : " .. v969);
                return;
            end;
        end;
    end, true)("config_system", "remove", false);
    v7.update_saved_list = function()
        local v971 = v8.configs.configs_db or {};
        local v972 = {};
        local v973 = {};
        for v974, _ in pairs(v971) do
            table.insert(v972, v974);
        end;
        table.sort(v972);
        for _, v976 in ipairs(v972) do
            table.insert(v973, v14.with_icon("list-ul", v976, "{Link Active}"));
        end;
        v8.refs.config_system.saved_list.ref:update(v973);
        if #v973 > 0 then
            v8.refs.config_system.saved_list.ref:set(1);
        end;
    end;
    v7.get_config_name_from_index = function(v981)
        local v982 = v8.configs.configs_db or {};
        local v983 = {};
        for v984, _ in pairs(v982) do
            table.insert(v983, v984);
        end;
        table.sort(v983);
        return v983[v981];
    end;
    v8.refs.config_system.saved_list.ref:set_callback(function()
        v8.global_update_callback();
        local v986 = v8.refs.config_system.saved_list.ref:get();
        local v987 = v7.get_config_name_from_index(v986);
        if v987 then
            v8.refs.config_system.config_name.ref:set(v987);
        end;
    end);
    v7.update_saved_list();
    local _ = l_gradient_0 and l_gradient_0.text_animate("S E N S E", -2, {
        color(255, 255, 255), 
        color(91, 91, 91)
    }) or nil;
    local v965 = ui.get_icon("kaaba");
    v10.register("render", "sidebar", function()
        -- upvalues: v16 (ref), v965 (ref)
        if ui.get_alpha() < 0.5 then
            return;
        else
            local v966 = v16.build_text(true, "{Link Active}");
            ui.sidebar(v966, "\a{Link Active}" .. v965);
            return;
        end;
    end);
    v8.global_update_callback();
    return;
end;
