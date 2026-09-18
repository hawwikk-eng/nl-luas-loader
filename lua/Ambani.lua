_DEBUG = true;
local _ = require("neverlose/inspect");
local l_smoothy_0 = require("neverlose/smoothy");
local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
local l_lambotruck_0 = require("neverlose/lambotruck");
local v5 = assert(require("neverlose/pui"), "Error with PUI");
local v6 = assert(require("neverlose/shoutout_salvatore"), "Error with [2] Library");
local v367 = new_class():struct("data")({
    player_team = {
        [1] = "terrorist", 
        [2] = "counter-terrorist"
    }, 
    states = {
        [1] = "standing", 
        [2] = "running", 
        [3] = "walking", 
        [4] = "crouching", 
        [5] = "crouch moving", 
        [6] = "jumping", 
        [7] = "crouch jumping"
    }, 
    menu = {}
}):struct("ref")({
    antiaim = {
        enable = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
        pitch = ui.find("Aimbot", "Anti aim", "Angles", "Pitch"), 
        yaw = ui.find("Aimbot", "Anti aim", "Angles", "Yaw"), 
        hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
        yawoffset = ui.find("Aimbot", "Anti aim", "Angles", "Yaw", "Offset"), 
        yawmodifier = ui.find("Aimbot", "Anti aim", "Angles", "Yaw Modifier"), 
        yawmodifieramount = ui.find("Aimbot", "Anti aim", "Angles", "Yaw Modifier", "Offset"), 
        bodyyawopt = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
        leftfake = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
        rightfake = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
        slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
        bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
        legmovement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
        freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
        freestanding_static = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
        yawtarget = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
        inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
        fbyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
        legs = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
        antibackstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab")
    }, 
    rage = {
        dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
        hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
        hs2 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
        fb = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
        dmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
        fakelag = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
        fakelag_enabled = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
        dtlag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
        fd = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
        ping = ui.find("Miscellaneous", "Main", "Other", "Fake Latency")
    }, 
    visuals = {
        scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
        force_thirdperson = ui.find("Visuals", "World", "Main", "Force Thirdperson")
    }
}):struct("colors")({
    accent = v5.accent, 
    gradient = "\b" .. v5.accent:to_hex() .. "\bFFFFFFFF"
}):struct("menu")({
    render = function(v7)
        -- upvalues: v5 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
        local v8 = "\f<house>";
        local v9 = "\f<gear>";
        local v10 = "\f<face-smile>";
        local v11 = {
            user = v5.label({
                [1] = nil, 
                [2] = "user", 
                [3] = 1, 
                [1] = v8
            }, v7.colors.gradient .. "[user : " .. common.get_username():lower() .. "]"), 
            build = v5.label({
                [1] = nil, 
                [2] = "user", 
                [3] = 1, 
                [1] = v8
            }, v7.colors.gradient .. "[build : dev ]"), 
            update = v5.label({
                [1] = nil, 
                [2] = "user", 
                [3] = 1, 
                [1] = v8
            }, v7.colors.gradient .. "[update : date]"), 
            youtube = v5.button({
                [1] = nil, 
                [2] = "info", 
                [3] = 1, 
                [1] = v8
            }, "\v\f<youtube>  " .. v7.colors.gradient .. "[youtube]", function()
                panorama.SteamOverlayAPI.OpenExternalBrowserURL("");
            end, true), 
            config = v5.button({
                [1] = nil, 
                [2] = "info", 
                [3] = 1, 
                [1] = v8
            }, "\v\f<file>  " .. v7.colors.gradient .. "[config]", function()
                panorama.SteamOverlayAPI.OpenExternalBrowserURL("");
            end, true), 
            discord = v5.button({
                [1] = nil, 
                [2] = "info", 
                [3] = 1, 
                [1] = v8
            }, "\v\f<discord>  " .. v7.colors.gradient .. "[discord]", function()
                panorama.SteamOverlayAPI.OpenExternalBrowserURL("");
            end, true), 
            select_team = v5.combo({
                [1] = nil, 
                [2] = "builder ", 
                [3] = 1, 
                [1] = v9
            }, v7.colors.gradient .. "[team]", v7.data.player_team), 
            select_state = v5.combo({
                [1] = nil, 
                [2] = "builder ", 
                [3] = 1, 
                [1] = v9
            }, v7.colors.gradient .. "[state]", v7.data.states)
        };
        v7.data.menu.label = v5.label({
            [1] = nil, 
            [2] = "builder ", 
            [3] = 1, 
            [1] = v9
        }, "                                      ");
        v7.data.menu.manual = v5.combo({
            [1] = nil, 
            [2] = "builder ", 
            [3] = 1, 
            [1] = v9
        }, v7.colors.gradient .. "[manual]", {
            [1] = "backward", 
            [2] = "left", 
            [3] = "right", 
            [4] = "forward"
        });
        v7.data.freestanding = v5.switch({
            [1] = nil, 
            [2] = "builder ", 
            [3] = 1, 
            [1] = v9
        }, v7.colors.gradient .. "[freestanding]", false, function(v12)
            -- upvalues: v7 (ref)
            return {
                disablers = v12:selectable("disablers", v7.data.states)
            };
        end);
        v7.data.airlag = v5.switch({
            [1] = nil, 
            [2] = "builder ", 
            [3] = 1, 
            [1] = v9
        }, v7.colors.gradient .. "[airlag]", false, function(v13)
            return {
                key = v13:hotkey("double tap keybind")
            };
        end);
        v7.data.addons = v5.selectable({
            [1] = nil, 
            [2] = "builder ", 
            [3] = 1, 
            [1] = v9
        }, v7.colors.gradient .. "[addons]", {
            [1] = "warmup aa", 
            [2] = "round end aa", 
            [3] = "safe head"
        }, function(_)

        end);
        for _, v16 in pairs(v7.data.player_team) do
            v7.data.menu[v16] = {};
            do
                local l_v16_0 = v16;
                for _, v19 in pairs(v7.data.states) do
                    v7.data.menu[l_v16_0][v19] = {};
                    local v20 = v7.data.menu[l_v16_0][v19];
                    v20.yaw_base = v5.combo({
                        [1] = nil, 
                        [2] = "YAW", 
                        [3] = 2, 
                        [1] = v9
                    }, "\v\f<person-walking-arrow-loop-left>   " .. v7.colors.gradient .. "[yaw base]", {
                        [1] = "at target", 
                        [2] = "local view"
                    }, function(v21)
                        return {
                            randomizer = v21:slider("randomization", 0, 90, 0, 1, function(v22)
                                return v22 .. "%";
                            end)
                        };
                    end);
                    v20.yaw_left = v5.slider({
                        [1] = nil, 
                        [2] = "YAW", 
                        [3] = 2, 
                        [1] = v9
                    }, "          \v\f<chevron-left>   " .. v7.colors.gradient .. "[left]", -180, 180, 0, 1);
                    v20.yaw_right = v5.slider({
                        [1] = nil, 
                        [2] = "YAW", 
                        [3] = 2, 
                        [1] = v9
                    }, "          \v\f<chevron-right>   " .. v7.colors.gradient .. "[right]", -180, 180, 0, 1);
                    v20.jitter = v5.combo({
                        [1] = nil, 
                        [2] = "YAW", 
                        [3] = 2, 
                        [1] = v9
                    }, "\v\f<gears>   " .. v7.colors.gradient .. "[jitter]", {
                        [1] = "off", 
                        [2] = "offset", 
                        [3] = "center", 
                        [4] = "random", 
                        [5] = "spin", 
                        [6] = "sanya"
                    }, function(v23, _)
                        local v25 = {
                            jitter_value = v23:slider("offset", -90, 90, 0, 1), 
                            delay_options = v23:combo("delay options", {
                                [1] = "normal", 
                                [2] = "cheat based", 
                                [3] = "algorithm"
                            })
                        };
                        v25.divider = v23:slider("divide ticks\nnormal", 1, 24, 14, 1, function(v26)
                            return v26 .. "%";
                        end):depend({
                            [1] = nil, 
                            [2] = "algorithm", 
                            [1] = v25.delay_options
                        });
                        v25.delay_type = v23:combo("delay type", {
                            [1] = "random", 
                            [2] = "fixed"
                        }):depend({
                            [1] = nil, 
                            [2] = "normal", 
                            [3] = "cheat based", 
                            [1] = v25.delay_options
                        });
                        v25.normal_min = v23:slider("min ticks\nnormal", 1, 24, 4, 1);
                        v25.normal_min:depend({
                            [1] = nil, 
                            [2] = "normal", 
                            [1] = v25.delay_options
                        });
                        v25.normal_min:depend({
                            [1] = nil, 
                            [2] = "random", 
                            [1] = v25.delay_type
                        });
                        v25.normal_max = v23:slider("max ticks\nnormal", 1, 24, 12, 1);
                        v25.normal_max:depend({
                            [1] = nil, 
                            [2] = "normal", 
                            [1] = v25.delay_options
                        });
                        v25.normal_max:depend({
                            [1] = nil, 
                            [2] = "random", 
                            [1] = v25.delay_type
                        });
                        v25.normal_fixed = v23:slider("fixed ticks\nnormal", 1, 24, 8, 1);
                        v25.normal_fixed:depend({
                            [1] = nil, 
                            [2] = "normal", 
                            [1] = v25.delay_options
                        });
                        v25.normal_fixed:depend({
                            [1] = nil, 
                            [2] = "fixed", 
                            [1] = v25.delay_type
                        });
                        v25.cheat_preset = v23:combo("cheat preset", {
                            [1] = "gamesense", 
                            [2] = "neverlose"
                        });
                        v25.cheat_preset:depend({
                            [1] = nil, 
                            [2] = "cheat based", 
                            [1] = v25.delay_options
                        });
                        for _, v28 in ipairs({
                            [1] = "gamesense", 
                            [2] = "neverlose"
                        }) do
                            local v29 = "\n" .. v28;
                            v25["min_" .. v28] = v23:slider("min ticks" .. v29, 1, 24, 4, 1);
                            v25["min_" .. v28]:depend({
                                [1] = nil, 
                                [2] = "cheat based", 
                                [1] = v25.delay_options
                            });
                            v25["min_" .. v28]:depend({
                                [1] = nil, 
                                [2] = "random", 
                                [1] = v25.delay_type
                            });
                            v25["min_" .. v28]:depend({
                                [1] = v25.cheat_preset, 
                                [2] = v28
                            });
                            v25["max_" .. v28] = v23:slider("max ticks" .. v29, 1, 24, 12, 1);
                            v25["max_" .. v28]:depend({
                                [1] = nil, 
                                [2] = "cheat based", 
                                [1] = v25.delay_options
                            });
                            v25["max_" .. v28]:depend({
                                [1] = nil, 
                                [2] = "random", 
                                [1] = v25.delay_type
                            });
                            v25["max_" .. v28]:depend({
                                [1] = v25.cheat_preset, 
                                [2] = v28
                            });
                            v25["fixed_" .. v28] = v23:slider("fixed ticks" .. v29, 1, 24, 8, 1);
                            v25["fixed_" .. v28]:depend({
                                [1] = nil, 
                                [2] = "cheat based", 
                                [1] = v25.delay_options
                            });
                            v25["fixed_" .. v28]:depend({
                                [1] = nil, 
                                [2] = "fixed", 
                                [1] = v25.delay_type
                            });
                            v25["fixed_" .. v28]:depend({
                                [1] = v25.cheat_preset, 
                                [2] = v28
                            });
                        end;
                        return v25;
                    end);
                    v20.body_yaw = v5.combo({
                        [1] = nil, 
                        [2] = "body", 
                        [3] = 2, 
                        [1] = v9
                    }, "\v\f<child-dress>     " .. v7.colors.gradient .. "[body yaw]", {
                        [1] = "off", 
                        [2] = "normal", 
                        [3] = "tick", 
                        [4] = "beast"
                    });
                    v20.tick_speed_1 = v5.slider({
                        [1] = nil, 
                        [2] = "body", 
                        [3] = 2, 
                        [1] = v9
                    }, "            \v\f<turn-down-right>   " .. v7.colors.gradient .. "[speed 1]", 0, 16, 8, 1):depend({
                        [1] = nil, 
                        [2] = "tick", 
                        [3] = false, 
                        [1] = v20.body_yaw
                    });
                    v20.tick_speed_2 = v5.slider({
                        [1] = nil, 
                        [2] = "body", 
                        [3] = 2, 
                        [1] = v9
                    }, "            \v\f<turn-down-right>   " .. v7.colors.gradient .. "[speed 2]", 0, 16, 8, 1):depend({
                        [1] = nil, 
                        [2] = "tick", 
                        [3] = false, 
                        [1] = v20.body_yaw
                    });
                    v20.limit = v5.slider({
                        [1] = nil, 
                        [2] = "body", 
                        [3] = 2, 
                        [1] = v9
                    }, "\v\f<angle>   " .. v7.colors.gradient .. "[fake limit]", 0, 61, 60, 1, function(v30)
                        if v30 == 61 then
                            return "random";
                        else
                            return v30;
                        end;
                    end):depend({
                        [1] = nil, 
                        [2] = "off", 
                        [3] = true, 
                        [1] = v20.body_yaw
                    });
                    v20.randomize_limit_value = v5.slider({
                        [1] = nil, 
                        [2] = "body", 
                        [3] = 2, 
                        [1] = v9
                    }, "            \v\f<turn-down-right>   " .. v7.colors.gradient .. "[limit 1]", 0, 60, 60, 1):depend({
                        [1] = nil, 
                        [2] = 61, 
                        [1] = v20.limit
                    }):depend({
                        [1] = nil, 
                        [2] = "off", 
                        [3] = true, 
                        [1] = v20.body_yaw
                    });
                    v20.randomize_limit_value2 = v5.slider({
                        [1] = nil, 
                        [2] = "body", 
                        [3] = 2, 
                        [1] = v9
                    }, "            \v\f<turn-down-right>   " .. v7.colors.gradient .. "[limit 2]", 0, 60, 60, 1):depend({
                        [1] = nil, 
                        [2] = 61, 
                        [1] = v20.limit
                    }):depend({
                        [1] = nil, 
                        [2] = "off", 
                        [3] = true, 
                        [1] = v20.body_yaw
                    });
                    v20.antibrute = v5.switch({
                        [1] = nil, 
                        [2] = "anti-brute", 
                        [3] = 2, 
                        [1] = v9
                    }, "\v\f<shuffle>   " .. v7.colors.gradient .. "[anti-bruteforce]", false);
                    v20.defensive_handler = v5.switch({
                        [1] = nil, 
                        [2] = "defensive handler", 
                        [3] = 2, 
                        [1] = v9
                    }, "\v\f<shield>   " .. v7.colors.gradient .. "[force defensive]", false, function(v31, _)
                        local v33 = {
                            method = v31:combo("method", {
                                [1] = "neverlose", 
                                [2] = "ambani"
                            })
                        };
                        v33.min_choke = v31:slider("min choke", 1, 24, 12, 1):depend({
                            [1] = nil, 
                            [2] = "ambani", 
                            [1] = v33.method
                        });
                        v33.max_choke = v31:slider("max choke", 1, 24, 12, 1):depend({
                            [1] = nil, 
                            [2] = "ambani", 
                            [1] = v33.method
                        });
                        return v33;
                    end);
                    do
                        local l_v19_0 = v19;
                        v7.data.menu.send_to_another_team = v5.button({
                            [1] = nil, 
                            [2] = "builder ", 
                            [3] = 1, 
                            [1] = v9
                        }, "                      send to " .. v7.colors.gradient .. "[opposite] team                   ", function()
                            -- upvalues: v11 (ref), v5 (ref), v7 (ref), l_v19_0 (ref), l_base64_0 (ref)
                            local v35 = v11.select_team:get();
                            local v36 = v11.select_state:get();
                            local _ = "state";
                            local v38 = v5.setup({
                                [1] = v7.data.menu[v35][l_v19_0]
                            }, true):save();
                            local v39 = l_base64_0.encode(json.stringify(v38));
                            local v40 = v35 == "counter-terrorist" and "terrorist" or "counter-terrorist";
                            local v41 = l_base64_0.decode(v39);
                            local v42 = json.parse(v41);
                            v5.setup({
                                [1] = v7.data.menu[v40][v36]
                            }, true):load(v42);
                        end, true):depend({
                            [1] = v11.select_state, 
                            [2] = l_v19_0
                        }):depend({
                            [1] = v11.select_team, 
                            [2] = l_v16_0
                        });
                        v5.traverse(v20, function(v43, _)
                            -- upvalues: v11 (ref), l_v19_0 (ref), l_v16_0 (ref)
                            v43:depend({
                                [1] = v11.select_state, 
                                [2] = l_v19_0
                            });
                            v43:depend({
                                [1] = v11.select_team, 
                                [2] = l_v16_0
                            });
                        end);
                    end;
                end;
            end;
        end;
        v7.data.menu.aspect_ratio = v5.switch({
            [1] = nil, 
            [2] = "visual", 
            [3] = 1, 
            [1] = v10
        }, "\v\f<image-landscape>     " .. v7.colors.gradient .. "[aspect ratio]", false, function(v45, v46)
            return {
                amount = v45:slider("aspect ratio", 0, 200, 0, 0.01):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v46
                })
            };
        end);
        v7.data.menu.viewmodel = v5.switch({
            [1] = nil, 
            [2] = "visual", 
            [3] = 1, 
            [1] = v10
        }, "\v\f<person-rifle>     " .. v7.colors.gradient .. "[viewmodel]", false, function(v47, v48)
            return {
                fov = v47:slider("fov", 0, 1000, 690, 0.1):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v48
                }), 
                x = v47:slider("x", -150, 150, 25, 0.1):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v48
                }), 
                y = v47:slider("y", -150, 150, 25, 0.1):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v48
                }), 
                z = v47:slider("z", -150, 150, 25, 0.1):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v48
                })
            };
        end);
        v7.data.menu.customscope = v5.switch({
            [1] = nil, 
            [2] = "visual", 
            [3] = 1, 
            [1] = v10
        }, "\v\f<gun>     " .. v7.colors.gradient .. "[scope overlay]", false, function(v49, v50)
            return {
                color = v49:label("color", color(255, 255, 255, 255)):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v50
                }), 
                line = v49:slider("line", 0, 200, 50, 1):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v50
                }), 
                gap = v49:slider("gap", 0, 200, 50, 1):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v50
                }), 
                rotate = v49:switch("rotate", false):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v50
                })
            };
        end);
        v7.data.menu.notifications = v5.switch({
            [1] = nil, 
            [2] = "visual", 
            [3] = 1, 
            [1] = v10
        }, "\v\f<calendar-lines-pen>     " .. v7.colors.gradient .. "[notifications]", false, function(v51, v52)
            return {
                purchases = v51:switch("purchases", false):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v52
                }), 
                antibrute = v51:switch("anti-bruteforce", false):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v52
                }), 
                hitlogs = v51:switch("hitlogs", false):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v52
                })
            };
        end);
        v7.data.menu.no_fall_damage = v5.switch({
            [1] = nil, 
            [2] = "movement", 
            [3] = 1, 
            [1] = v10
        }, "\v\f<person-falling>     " .. v7.colors.gradient .. "[no fall damage]", false);
        v7.data.menu.fast_ladder = v5.switch({
            [1] = nil, 
            [2] = "movement", 
            [3] = 1, 
            [1] = v10
        }, "\v\f<water-ladder>     " .. v7.colors.gradient .. "[fast ladder]", false);
        v7.data.menu.freezetime_fakeduck = v5.switch({
            [1] = nil, 
            [2] = "movement", 
            [3] = 1, 
            [1] = v10
        }, "\v\f<duck>     " .. v7.colors.gradient .. "[freezetime fake duck]", false);
        v7.data.menu.list = v5.list({
            [1] = nil, 
            [2] = "configs", 
            [3] = 2, 
            [1] = v8
        }, "\nsaved_configs", {});
        v7.data.menu.list:set_callback(function()
            -- upvalues: v7 (ref)
            v7.config:select_current_config();
        end);
        v7.data.menu.name = v5.input({
            [1] = nil, 
            [2] = "configs", 
            [3] = 2, 
            [1] = v8
        }, "Config name -");
        v7.data.menu.save = v5.button({
            [1] = nil, 
            [2] = "configs", 
            [3] = 2, 
            [1] = v8
        }, "Save", function()
            -- upvalues: v7 (ref)
            v7.config:save();
        end, true);
        v7.data.menu.load = v5.button({
            [1] = nil, 
            [2] = "configs", 
            [3] = 2, 
            [1] = v8
        }, "Load", function()
            -- upvalues: v7 (ref)
            v7.config:load();
        end, true);
        v7.data.menu.delete = v5.button({
            [1] = nil, 
            [2] = "configs", 
            [3] = 2, 
            [1] = v8
        }, "Remove", function()
            -- upvalues: v7 (ref)
            v7.config:delete();
        end, true);
        v7.data.menu.export = v5.button({
            [1] = nil, 
            [2] = "configs", 
            [3] = 2, 
            [1] = v8
        }, "Export", function()
            -- upvalues: l_clipboard_0 (ref), v7 (ref)
            l_clipboard_0.set(v7.config:export("config"));
        end, true);
        v7.data.menu.import = v5.button({
            [1] = nil, 
            [2] = "configs", 
            [3] = 2, 
            [1] = v8
        }, "Import", function()
            -- upvalues: l_clipboard_0 (ref), v7 (ref)
            local v53 = l_clipboard_0.get();
            if v53 and v53 ~= "" then
                v7.config:import(v53, "config");
            end;
        end, true);
        v7.data.menu.jitter_legs = v5.switch({
            [1] = nil, 
            [2] = "anims", 
            [3] = 2, 
            [1] = v10
        }, "\v\f<person-walking-with-cane>\r Jitter legs", false);
        local v54 = v7.data.menu.jitter_legs:create();
        v7.data.menu.jitter_legs_from = v54:slider("From\n", 1, 100, 0, 1, function(v55)
            return v55 / 100 .. "x";
        end):depend({
            [1] = nil, 
            [2] = true, 
            [1] = v7.data.menu.jitter_legs
        });
        v7.data.menu.jitter_legs_to = v54:slider("To\n", 1, 100, 0, 1, function(v56)
            return v56 / 100 .. "x";
        end):depend({
            [1] = nil, 
            [2] = true, 
            [1] = v7.data.menu.jitter_legs
        });
        v7.data.menu.interpolating = v5.switch({
            [1] = nil, 
            [2] = "anims", 
            [3] = 2, 
            [1] = v10
        }, "\v\f<person-walking>\r Interpolating", false);
        v7.data.menu.animations_fall_amount = v5.slider({
            [1] = nil, 
            [2] = "anims", 
            [3] = 2, 
            [1] = v10
        }, "\v\f<person-falling>\r Falling", 1, 100, 50, 1, function(v57)
            return v57 .. "%";
        end);
        v7.data.menu.animations_lean_amount = v5.slider({
            [1] = nil, 
            [2] = "anims", 
            [3] = 2, 
            [1] = v10
        }, "\v\f<person>\r Leaning", 1, 100, 0, 1, function(v58)
            return v58 .. "%";
        end);
        v7.data.menu.animations_slide_amount = v5.slider({
            [1] = nil, 
            [2] = "anims", 
            [3] = 2, 
            [1] = v10
        }, "\v\f<person-walking>\r Sliding", 1, 100, 50, 1, function(v59)
            return v59 .. "%";
        end):depend({
            [1] = nil, 
            [2] = false, 
            [1] = v7.data.menu.jitter_legs
        });
    end
}):struct("config")({
    config_file = "ambani.txt", 
    storage = {}, 
    default_configs = {
        hawiz = "{ambani:config}:W3siYW5pbWF0aW9uc19mYWxsX2Ftb3VudCI6MS4wLCJhbmltYXRpb25zX2xlYW5fYW1vdW50IjoxLjAsImFuaW1hdGlvbnNfc2xpZGVfYW1vdW50IjoyLjAsImFzcGVjdF9yYXRpbyI6dHJ1ZSwiY291bnRlci10ZXJyb3Jpc3QiOnsiY3JvdWNoIGp1bXBpbmciOnsiYW50aWJydXRlIjp0cnVlLCJib2R5X3lhdyI6Im5vcm1hbCIsImRlZmVuc2l2ZV9oYW5kbGVyIjp0cnVlLCJqaXR0ZXIiOiJzYW55YSIsImxpbWl0Ijo2MS4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUiOjYwLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZTIiOjYwLjAsInRpY2tfc3BlZWRfMSI6MTQuMCwidGlja19zcGVlZF8yIjoxNC4wLCJ5YXdfYmFzZSI6ImF0IHRhcmdldCIsInlhd19sZWZ0IjotMTcuMCwieWF3X3JpZ2h0IjozMC4wLCJ+ZGVmZW5zaXZlX2hhbmRsZXIiOnsibWF4X2Nob2tlIjoxMi4wLCJtZXRob2QiOiJuZXZlcmxvc2UiLCJtaW5fY2hva2UiOjEyLjB9LCJ+aml0dGVyIjp7ImNoZWF0X3ByZXNldCI6Im5ldmVybG9zZSIsImRlbGF5X29wdGlvbnMiOiJhbGdvcml0aG0iLCJkZWxheV90eXBlIjoicmFuZG9tIiwiZGl2aWRlciI6MTQuMCwiZml4ZWRfZ2FtZXNlbnNlIjozLjAsImZpeGVkX25ldmVybG9zZSI6Ny4wLCJqaXR0ZXJfdmFsdWUiOjExLjAsIm1heF9nYW1lc2Vuc2UiOjE1LjAsIm1heF9uZXZlcmxvc2UiOjExLjAsIm1pbl9nYW1lc2Vuc2UiOjkuMCwibWluX25ldmVybG9zZSI6NS4wLCJub3JtYWxfZml4ZWQiOjguMCwibm9ybWFsX21heCI6OC4wLCJub3JtYWxfbWluIjo0LjB9LCJ+eWF3X2Jhc2UiOnsicmFuZG9taXplciI6MC4wfX0sImNyb3VjaCBtb3ZpbmciOnsiYW50aWJydXRlIjp0cnVlLCJib2R5X3lhdyI6Im5vcm1hbCIsImRlZmVuc2l2ZV9oYW5kbGVyIjp0cnVlLCJqaXR0ZXIiOiJzYW55YSIsImxpbWl0Ijo2MS4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUiOjYwLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZTIiOjYwLjAsInRpY2tfc3BlZWRfMSI6MTAuMCwidGlja19zcGVlZF8yIjoxNC4wLCJ5YXdfYmFzZSI6ImF0IHRhcmdldCIsInlhd19sZWZ0IjotMjIuMCwieWF3X3JpZ2h0IjoyNi4wLCJ+ZGVmZW5zaXZlX2hhbmRsZXIiOnsibWF4X2Nob2tlIjoxMi4wLCJtZXRob2QiOiJuZXZlcmxvc2UiLCJtaW5fY2hva2UiOjEyLjB9LCJ+aml0dGVyIjp7ImNoZWF0X3ByZXNldCI6Im5ldmVybG9zZSIsImRlbGF5X29wdGlvbnMiOiJhbGdvcml0aG0iLCJkZWxheV90eXBlIjoicmFuZG9tIiwiZGl2aWRlciI6MTQuMCwiZml4ZWRfZ2FtZXNlbnNlIjo4LjAsImZpeGVkX25ldmVybG9zZSI6OC4wLCJqaXR0ZXJfdmFsdWUiOjkuMCwibWF4X2dhbWVzZW5zZSI6OS4wLCJtYXhfbmV2ZXJsb3NlIjo5LjAsIm1pbl9nYW1lc2Vuc2UiOjQuMCwibWluX25ldmVybG9zZSI6OC4wLCJub3JtYWxfZml4ZWQiOjguMCwibm9ybWFsX21heCI6MTAuMCwibm9ybWFsX21pbiI6OS4wfSwifnlhd19iYXNlIjp7InJhbmRvbWl6ZXIiOjAuMH19LCJjcm91Y2hpbmciOnsiYW50aWJydXRlIjp0cnVlLCJib2R5X3lhdyI6Im5vcm1hbCIsImRlZmVuc2l2ZV9oYW5kbGVyIjp0cnVlLCJqaXR0ZXIiOiJzYW55YSIsImxpbWl0Ijo2MS4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUiOjYwLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZTIiOjYwLjAsInRpY2tfc3BlZWRfMSI6MTQuMCwidGlja19zcGVlZF8yIjoxNi4wLCJ5YXdfYmFzZSI6ImF0IHRhcmdldCIsInlhd19sZWZ0IjotMjAuMCwieWF3X3JpZ2h0IjozNy4wLCJ+ZGVmZW5zaXZlX2hhbmRsZXIiOnsibWF4X2Nob2tlIjoxMi4wLCJtZXRob2QiOiJuZXZlcmxvc2UiLCJtaW5fY2hva2UiOjEyLjB9LCJ+aml0dGVyIjp7ImNoZWF0X3ByZXNldCI6Im5ldmVybG9zZSIsImRlbGF5X29wdGlvbnMiOiJjaGVhdCBiYXNlZCIsImRlbGF5X3R5cGUiOiJyYW5kb20iLCJkaXZpZGVyIjoxNC4wLCJmaXhlZF9nYW1lc2Vuc2UiOjguMCwiZml4ZWRfbmV2ZXJsb3NlIjo4LjAsImppdHRlcl92YWx1ZSI6MTIuMCwibWF4X2dhbWVzZW5zZSI6MTIuMCwibWF4X25ldmVybG9zZSI6OS4wLCJtaW5fZ2FtZXNlbnNlIjo0LjAsIm1pbl9uZXZlcmxvc2UiOjcuMCwibm9ybWFsX2ZpeGVkIjo4LjAsIm5vcm1hbF9tYXgiOjEyLjAsIm5vcm1hbF9taW4iOjQuMH0sIn55YXdfYmFzZSI6eyJyYW5kb21pemVyIjowLjB9fSwianVtcGluZyI6eyJhbnRpYnJ1dGUiOnRydWUsImJvZHlfeWF3Ijoibm9ybWFsIiwiZGVmZW5zaXZlX2hhbmRsZXIiOnRydWUsImppdHRlciI6Im9mZnNldCIsImxpbWl0Ijo2MC4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUiOjYwLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZTIiOjYwLjAsInRpY2tfc3BlZWRfMSI6OC4wLCJ0aWNrX3NwZWVkXzIiOjguMCwieWF3X2Jhc2UiOiJhdCB0YXJnZXQiLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmlnaHQiOjAuMCwifmRlZmVuc2l2ZV9oYW5kbGVyIjp7Im1heF9jaG9rZSI6MTIuMCwibWV0aG9kIjoibmV2ZXJsb3NlIiwibWluX2Nob2tlIjoxMi4wfSwifmppdHRlciI6eyJjaGVhdF9wcmVzZXQiOiJnYW1lc2Vuc2UiLCJkZWxheV9vcHRpb25zIjoibm9ybWFsIiwiZGVsYXlfdHlwZSI6InJhbmRvbSIsImRpdmlkZXIiOjE0LjAsImZpeGVkX2dhbWVzZW5zZSI6OC4wLCJmaXhlZF9uZXZlcmxvc2UiOjguMCwiaml0dGVyX3ZhbHVlIjo1LjAsIm1heF9nYW1lc2Vuc2UiOjEyLjAsIm1heF9uZXZlcmxvc2UiOjEyLjAsIm1pbl9nYW1lc2Vuc2UiOjQuMCwibWluX25ldmVybG9zZSI6NC4wLCJub3JtYWxfZml4ZWQiOjguMCwibm9ybWFsX21heCI6MS4wLCJub3JtYWxfbWluIjoxLjB9LCJ+eWF3X2Jhc2UiOnsicmFuZG9taXplciI6MC4wfX0sInJ1bm5pbmciOnsiYW50aWJydXRlIjp0cnVlLCJib2R5X3lhdyI6Im5vcm1hbCIsImRlZmVuc2l2ZV9oYW5kbGVyIjpmYWxzZSwiaml0dGVyIjoic2FueWEiLCJsaW1pdCI6NjEuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlIjo1OS4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUyIjo2MC4wLCJ0aWNrX3NwZWVkXzEiOjYuMCwidGlja19zcGVlZF8yIjo2LjAsInlhd19iYXNlIjoiYXQgdGFyZ2V0IiwieWF3X2xlZnQiOi0yNC4wLCJ5YXdfcmlnaHQiOjM2LjAsIn5kZWZlbnNpdmVfaGFuZGxlciI6eyJtYXhfY2hva2UiOjEyLjAsIm1ldGhvZCI6Im5ldmVybG9zZSIsIm1pbl9jaG9rZSI6MTIuMH0sIn5qaXR0ZXIiOnsiY2hlYXRfcHJlc2V0IjoibmV2ZXJsb3NlIiwiZGVsYXlfb3B0aW9ucyI6ImFsZ29yaXRobSIsImRlbGF5X3R5cGUiOiJyYW5kb20iLCJkaXZpZGVyIjo4LjAsImZpeGVkX2dhbWVzZW5zZSI6OC4wLCJmaXhlZF9uZXZlcmxvc2UiOjguMCwiaml0dGVyX3ZhbHVlIjoxNS4wLCJtYXhfZ2FtZXNlbnNlIjoxMi4wLCJtYXhfbmV2ZXJsb3NlIjo3LjAsIm1pbl9nYW1lc2Vuc2UiOjcuMCwibWluX25ldmVybG9zZSI6Ni4wLCJub3JtYWxfZml4ZWQiOjguMCwibm9ybWFsX21heCI6OS4wLCJub3JtYWxfbWluIjo4LjB9LCJ+eWF3X2Jhc2UiOnsicmFuZG9taXplciI6MC4wfX0sInN0YW5kaW5nIjp7ImFudGlicnV0ZSI6dHJ1ZSwiYm9keV95YXciOiJub3JtYWwiLCJkZWZlbnNpdmVfaGFuZGxlciI6ZmFsc2UsImppdHRlciI6ImNlbnRlciIsImxpbWl0Ijo2MS4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUiOjYwLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZTIiOjYwLjAsInRpY2tfc3BlZWRfMSI6MTQuMCwidGlja19zcGVlZF8yIjoxNS4wLCJ5YXdfYmFzZSI6ImF0IHRhcmdldCIsInlhd19sZWZ0IjotMjEuMCwieWF3X3JpZ2h0IjoyOC4wLCJ+ZGVmZW5zaXZlX2hhbmRsZXIiOnsibWF4X2Nob2tlIjoxMi4wLCJtZXRob2QiOiJuZXZlcmxvc2UiLCJtaW5fY2hva2UiOjEyLjB9LCJ+aml0dGVyIjp7ImNoZWF0X3ByZXNldCI6Im5ldmVybG9zZSIsImRlbGF5X29wdGlvbnMiOiJhbGdvcml0aG0iLCJkZWxheV90eXBlIjoicmFuZG9tIiwiZGl2aWRlciI6MTQuMCwiZml4ZWRfZ2FtZXNlbnNlIjoxMy4wLCJmaXhlZF9uZXZlcmxvc2UiOjguMCwiaml0dGVyX3ZhbHVlIjoxNS4wLCJtYXhfZ2FtZXNlbnNlIjoxMS4wLCJtYXhfbmV2ZXJsb3NlIjo4LjAsIm1pbl9nYW1lc2Vuc2UiOjguMCwibWluX25ldmVybG9zZSI6Ny4wLCJub3JtYWxfZml4ZWQiOjguMCwibm9ybWFsX21heCI6MTIuMCwibm9ybWFsX21pbiI6NC4wfSwifnlhd19iYXNlIjp7InJhbmRvbWl6ZXIiOjAuMH19LCJ3YWxraW5nIjp7ImFudGlicnV0ZSI6dHJ1ZSwiYm9keV95YXciOiJvZmYiLCJkZWZlbnNpdmVfaGFuZGxlciI6ZmFsc2UsImppdHRlciI6Im9mZiIsImxpbWl0Ijo2MC4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUiOjYwLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZTIiOjYwLjAsInRpY2tfc3BlZWRfMSI6OC4wLCJ0aWNrX3NwZWVkXzIiOjguMCwieWF3X2Jhc2UiOiJhdCB0YXJnZXQiLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmlnaHQiOjAuMCwifmRlZmVuc2l2ZV9oYW5kbGVyIjp7Im1heF9jaG9rZSI6MTIuMCwibWV0aG9kIjoibmV2ZXJsb3NlIiwibWluX2Nob2tlIjoxMi4wfSwifmppdHRlciI6eyJjaGVhdF9wcmVzZXQiOiJnYW1lc2Vuc2UiLCJkZWxheV9vcHRpb25zIjoibm9ybWFsIiwiZGVsYXlfdHlwZSI6InJhbmRvbSIsImRpdmlkZXIiOjE0LjAsImZpeGVkX2dhbWVzZW5zZSI6OC4wLCJmaXhlZF9uZXZlcmxvc2UiOjguMCwiaml0dGVyX3ZhbHVlIjowLjAsIm1heF9nYW1lc2Vuc2UiOjEyLjAsIm1heF9uZXZlcmxvc2UiOjEyLjAsIm1pbl9nYW1lc2Vuc2UiOjQuMCwibWluX25ldmVybG9zZSI6NC4wLCJub3JtYWxfZml4ZWQiOjguMCwibm9ybWFsX21heCI6MTIuMCwibm9ybWFsX21pbiI6NC4wfSwifnlhd19iYXNlIjp7InJhbmRvbWl6ZXIiOjAuMH19fSwiY3VzdG9tc2NvcGUiOnRydWUsImZhc3RfbGFkZGVyIjp0cnVlLCJmcmVlemV0aW1lX2Zha2VkdWNrIjp0cnVlLCJpbnRlcnBvbGF0aW5nIjpmYWxzZSwiaml0dGVyX2xlZ3MiOmZhbHNlLCJqaXR0ZXJfbGVnc19mcm9tIjo5NC4wLCJqaXR0ZXJfbGVnc190byI6MzcuMCwibGlzdCI6NS4wLCJtYW51YWwiOiJiYWNrd2FyZCIsIm5hbWUiOiJhc2Rhc2Rhc2QiLCJub19mYWxsX2RhbWFnZSI6dHJ1ZSwibm90aWZpY2F0aW9ucyI6ZmFsc2UsInRlcnJvcmlzdCI6eyJjcm91Y2gganVtcGluZyI6eyJhbnRpYnJ1dGUiOnRydWUsImJvZHlfeWF3Ijoibm9ybWFsIiwiZGVmZW5zaXZlX2hhbmRsZXIiOnRydWUsImppdHRlciI6InNhbnlhIiwibGltaXQiOjYxLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZSI6NjAuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlMiI6NjAuMCwidGlja19zcGVlZF8xIjoxMi4wLCJ0aWNrX3NwZWVkXzIiOjE1LjAsInlhd19iYXNlIjoiYXQgdGFyZ2V0IiwieWF3X2xlZnQiOi0xOC4wLCJ5YXdfcmlnaHQiOjQyLjAsIn5kZWZlbnNpdmVfaGFuZGxlciI6eyJtYXhfY2hva2UiOjI0LjAsIm1ldGhvZCI6Im5ldmVybG9zZSIsIm1pbl9jaG9rZSI6MTYuMH0sIn5qaXR0ZXIiOnsiY2hlYXRfcHJlc2V0IjoibmV2ZXJsb3NlIiwiZGVsYXlfb3B0aW9ucyI6ImFsZ29yaXRobSIsImRlbGF5X3R5cGUiOiJyYW5kb20iLCJkaXZpZGVyIjoxNC4wLCJmaXhlZF9nYW1lc2Vuc2UiOjMuMCwiZml4ZWRfbmV2ZXJsb3NlIjo3LjAsImppdHRlcl92YWx1ZSI6MTAuMCwibWF4X2dhbWVzZW5zZSI6MTUuMCwibWF4X25ldmVybG9zZSI6Ny4wLCJtaW5fZ2FtZXNlbnNlIjo5LjAsIm1pbl9uZXZlcmxvc2UiOjYuMCwibm9ybWFsX2ZpeGVkIjo4LjAsIm5vcm1hbF9tYXgiOjguMCwibm9ybWFsX21pbiI6NC4wfSwifnlhd19iYXNlIjp7InJhbmRvbWl6ZXIiOjAuMH19LCJjcm91Y2ggbW92aW5nIjp7ImFudGlicnV0ZSI6dHJ1ZSwiYm9keV95YXciOiJub3JtYWwiLCJkZWZlbnNpdmVfaGFuZGxlciI6dHJ1ZSwiaml0dGVyIjoic2FueWEiLCJsaW1pdCI6NjEuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlIjo2MC4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUyIjo2MC4wLCJ0aWNrX3NwZWVkXzEiOjEyLjAsInRpY2tfc3BlZWRfMiI6MTUuMCwieWF3X2Jhc2UiOiJhdCB0YXJnZXQiLCJ5YXdfbGVmdCI6LTE4LjAsInlhd19yaWdodCI6MzAuMCwifmRlZmVuc2l2ZV9oYW5kbGVyIjp7Im1heF9jaG9rZSI6MjAuMCwibWV0aG9kIjoibmV2ZXJsb3NlIiwibWluX2Nob2tlIjoxNi4wfSwifmppdHRlciI6eyJjaGVhdF9wcmVzZXQiOiJuZXZlcmxvc2UiLCJkZWxheV9vcHRpb25zIjoiYWxnb3JpdGhtIiwiZGVsYXlfdHlwZSI6InJhbmRvbSIsImRpdmlkZXIiOjE0LjAsImZpeGVkX2dhbWVzZW5zZSI6OC4wLCJmaXhlZF9uZXZlcmxvc2UiOjguMCwiaml0dGVyX3ZhbHVlIjoxNi4wLCJtYXhfZ2FtZXNlbnNlIjo5LjAsIm1heF9uZXZlcmxvc2UiOjkuMCwibWluX2dhbWVzZW5zZSI6NC4wLCJtaW5fbmV2ZXJsb3NlIjo4LjAsIm5vcm1hbF9maXhlZCI6OC4wLCJub3JtYWxfbWF4IjoxMC4wLCJub3JtYWxfbWluIjo5LjB9LCJ+eWF3X2Jhc2UiOnsicmFuZG9taXplciI6MS4wfX0sImNyb3VjaGluZyI6eyJhbnRpYnJ1dGUiOnRydWUsImJvZHlfeWF3Ijoibm9ybWFsIiwiZGVmZW5zaXZlX2hhbmRsZXIiOnRydWUsImppdHRlciI6InNhbnlhIiwibGltaXQiOjYxLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZSI6NjAuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlMiI6NjAuMCwidGlja19zcGVlZF8xIjoxNC4wLCJ0aWNrX3NwZWVkXzIiOjE2LjAsInlhd19iYXNlIjoiYXQgdGFyZ2V0IiwieWF3X2xlZnQiOi0yMi4wLCJ5YXdfcmlnaHQiOjM4LjAsIn5kZWZlbnNpdmVfaGFuZGxlciI6eyJtYXhfY2hva2UiOjEyLjAsIm1ldGhvZCI6Im5ldmVybG9zZSIsIm1pbl9jaG9rZSI6MTIuMH0sIn5qaXR0ZXIiOnsiY2hlYXRfcHJlc2V0IjoibmV2ZXJsb3NlIiwiZGVsYXlfb3B0aW9ucyI6ImFsZ29yaXRobSIsImRlbGF5X3R5cGUiOiJyYW5kb20iLCJkaXZpZGVyIjoxNC4wLCJmaXhlZF9nYW1lc2Vuc2UiOjguMCwiZml4ZWRfbmV2ZXJsb3NlIjo4LjAsImppdHRlcl92YWx1ZSI6MTIuMCwibWF4X2dhbWVzZW5zZSI6MTIuMCwibWF4X25ldmVybG9zZSI6OC4wLCJtaW5fZ2FtZXNlbnNlIjo0LjAsIm1pbl9uZXZlcmxvc2UiOjcuMCwibm9ybWFsX2ZpeGVkIjo4LjAsIm5vcm1hbF9tYXgiOjEyLjAsIm5vcm1hbF9taW4iOjQuMH0sIn55YXdfYmFzZSI6eyJyYW5kb21pemVyIjowLjB9fSwianVtcGluZyI6eyJhbnRpYnJ1dGUiOnRydWUsImJvZHlfeWF3Ijoibm9ybWFsIiwiZGVmZW5zaXZlX2hhbmRsZXIiOnRydWUsImppdHRlciI6Im9mZiIsImxpbWl0Ijo2MS4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUiOjYwLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZTIiOjYwLjAsInRpY2tfc3BlZWRfMSI6OC4wLCJ0aWNrX3NwZWVkXzIiOjEwLjAsInlhd19iYXNlIjoiYXQgdGFyZ2V0IiwieWF3X2xlZnQiOi0yMC4wLCJ5YXdfcmlnaHQiOjM1LjAsIn5kZWZlbnNpdmVfaGFuZGxlciI6eyJtYXhfY2hva2UiOjEyLjAsIm1ldGhvZCI6Im5ldmVybG9zZSIsIm1pbl9jaG9rZSI6MTIuMH0sIn5qaXR0ZXIiOnsiY2hlYXRfcHJlc2V0IjoiZ2FtZXNlbnNlIiwiZGVsYXlfb3B0aW9ucyI6Im5vcm1hbCIsImRlbGF5X3R5cGUiOiJyYW5kb20iLCJkaXZpZGVyIjoxNC4wLCJmaXhlZF9nYW1lc2Vuc2UiOjguMCwiZml4ZWRfbmV2ZXJsb3NlIjo4LjAsImppdHRlcl92YWx1ZSI6MC4wLCJtYXhfZ2FtZXNlbnNlIjoxMi4wLCJtYXhfbmV2ZXJsb3NlIjoxMi4wLCJtaW5fZ2FtZXNlbnNlIjo0LjAsIm1pbl9uZXZlcmxvc2UiOjQuMCwibm9ybWFsX2ZpeGVkIjo4LjAsIm5vcm1hbF9tYXgiOjYuMCwibm9ybWFsX21pbiI6Ni4wfSwifnlhd19iYXNlIjp7InJhbmRvbWl6ZXIiOjAuMH19LCJydW5uaW5nIjp7ImFudGlicnV0ZSI6dHJ1ZSwiYm9keV95YXciOiJub3JtYWwiLCJkZWZlbnNpdmVfaGFuZGxlciI6ZmFsc2UsImppdHRlciI6InNhbnlhIiwibGltaXQiOjYxLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZSI6NTguMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlMiI6NjAuMCwidGlja19zcGVlZF8xIjoxMC4wLCJ0aWNrX3NwZWVkXzIiOjE2LjAsInlhd19iYXNlIjoiYXQgdGFyZ2V0IiwieWF3X2xlZnQiOi0yNi4wLCJ5YXdfcmlnaHQiOjMwLjAsIn5kZWZlbnNpdmVfaGFuZGxlciI6eyJtYXhfY2hva2UiOjEyLjAsIm1ldGhvZCI6Im5ldmVybG9zZSIsIm1pbl9jaG9rZSI6MTIuMH0sIn5qaXR0ZXIiOnsiY2hlYXRfcHJlc2V0IjoibmV2ZXJsb3NlIiwiZGVsYXlfb3B0aW9ucyI6ImFsZ29yaXRobSIsImRlbGF5X3R5cGUiOiJyYW5kb20iLCJkaXZpZGVyIjoxNy4wLCJmaXhlZF9nYW1lc2Vuc2UiOjguMCwiZml4ZWRfbmV2ZXJsb3NlIjo4LjAsImppdHRlcl92YWx1ZSI6MjIuMCwibWF4X2dhbWVzZW5zZSI6MTIuMCwibWF4X25ldmVybG9zZSI6Ny4wLCJtaW5fZ2FtZXNlbnNlIjo3LjAsIm1pbl9uZXZlcmxvc2UiOjYuMCwibm9ybWFsX2ZpeGVkIjo4LjAsIm5vcm1hbF9tYXgiOjkuMCwibm9ybWFsX21pbiI6OC4wfSwifnlhd19iYXNlIjp7InJhbmRvbWl6ZXIiOjQuMH19LCJzdGFuZGluZyI6eyJhbnRpYnJ1dGUiOnRydWUsImJvZHlfeWF3Ijoibm9ybWFsIiwiZGVmZW5zaXZlX2hhbmRsZXIiOmZhbHNlLCJqaXR0ZXIiOiJzYW55YSIsImxpbWl0Ijo2MS4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUiOjYwLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZTIiOjYwLjAsInRpY2tfc3BlZWRfMSI6MTIuMCwidGlja19zcGVlZF8yIjoxNS4wLCJ5YXdfYmFzZSI6ImF0IHRhcmdldCIsInlhd19sZWZ0IjotMjIuMCwieWF3X3JpZ2h0IjozNC4wLCJ+ZGVmZW5zaXZlX2hhbmRsZXIiOnsibWF4X2Nob2tlIjoxMi4wLCJtZXRob2QiOiJuZXZlcmxvc2UiLCJtaW5fY2hva2UiOjEyLjB9LCJ+aml0dGVyIjp7ImNoZWF0X3ByZXNldCI6Im5ldmVybG9zZSIsImRlbGF5X29wdGlvbnMiOiJhbGdvcml0aG0iLCJkZWxheV90eXBlIjoicmFuZG9tIiwiZGl2aWRlciI6MTQuMCwiZml4ZWRfZ2FtZXNlbnNlIjoxMy4wLCJmaXhlZF9uZXZlcmxvc2UiOjguMCwiaml0dGVyX3ZhbHVlIjoyMC4wLCJtYXhfZ2FtZXNlbnNlIjoxMS4wLCJtYXhfbmV2ZXJsb3NlIjoxMC4wLCJtaW5fZ2FtZXNlbnNlIjo4LjAsIm1pbl9uZXZlcmxvc2UiOjcuMCwibm9ybWFsX2ZpeGVkIjo4LjAsIm5vcm1hbF9tYXgiOjEyLjAsIm5vcm1hbF9taW4iOjQuMH0sIn55YXdfYmFzZSI6eyJyYW5kb21pemVyIjowLjB9fSwid2Fsa2luZyI6eyJhbnRpYnJ1dGUiOnRydWUsImJvZHlfeWF3Ijoibm9ybWFsIiwiZGVmZW5zaXZlX2hhbmRsZXIiOmZhbHNlLCJqaXR0ZXIiOiJzYW55YSIsImxpbWl0Ijo2MS4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUiOjU4LjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZTIiOjYwLjAsInRpY2tfc3BlZWRfMSI6OC4wLCJ0aWNrX3NwZWVkXzIiOjguMCwieWF3X2Jhc2UiOiJhdCB0YXJnZXQiLCJ5YXdfbGVmdCI6LTI2LjAsInlhd19yaWdodCI6MzAuMCwifmRlZmVuc2l2ZV9oYW5kbGVyIjp7Im1heF9jaG9rZSI6MTIuMCwibWV0aG9kIjoibmV2ZXJsb3NlIiwibWluX2Nob2tlIjoxMi4wfSwifmppdHRlciI6eyJjaGVhdF9wcmVzZXQiOiJnYW1lc2Vuc2UiLCJkZWxheV9vcHRpb25zIjoiYWxnb3JpdGhtIiwiZGVsYXlfdHlwZSI6InJhbmRvbSIsImRpdmlkZXIiOjE0LjAsImZpeGVkX2dhbWVzZW5zZSI6OC4wLCJmaXhlZF9uZXZlcmxvc2UiOjguMCwiaml0dGVyX3ZhbHVlIjoyMi4wLCJtYXhfZ2FtZXNlbnNlIjoxMi4wLCJtYXhfbmV2ZXJsb3NlIjoxMi4wLCJtaW5fZ2FtZXNlbnNlIjo0LjAsIm1pbl9uZXZlcmxvc2UiOjQuMCwibm9ybWFsX2ZpeGVkIjo4LjAsIm5vcm1hbF9tYXgiOjExLjAsIm5vcm1hbF9taW4iOjguMH0sIn55YXdfYmFzZSI6eyJyYW5kb21pemVyIjo0LjB9fX0sInZpZXdtb2RlbCI6dHJ1ZSwifmFzcGVjdF9yYXRpbyI6eyJhbW91bnQiOjEyOC4wfSwifmN1c3RvbXNjb3BlIjp7ImdhcCI6NTQuMCwibGluZSI6MTIuMCwicm90YXRlIjp0cnVlfSwifm5vdGlmaWNhdGlvbnMiOnsiYW50aWJydXRlIjpmYWxzZSwiaGl0bG9ncyI6ZmFsc2UsInB1cmNoYXNlcyI6ZmFsc2V9LCJ+dmlld21vZGVsIjp7ImZvdiI6NjQyLjAsIngiOjExLjAsInkiOi01Ni4wLCJ6IjoyNS4wfX1d", 
        leka = "{ambani:config}:W3siYW5pbWF0aW9uc19mYWxsX2Ftb3VudCI6MTYuMCwiYW5pbWF0aW9uc19sZWFuX2Ftb3VudCI6MS4wLCJhbmltYXRpb25zX3NsaWRlX2Ftb3VudCI6NTAuMCwiYXNwZWN0X3JhdGlvIjp0cnVlLCJjb3VudGVyLXRlcnJvcmlzdCI6eyJjcm91Y2gganVtcGluZyI6eyJhbnRpYnJ1dGUiOnRydWUsImJvZHlfeWF3Ijoibm9ybWFsIiwiZGVmZW5zaXZlX2hhbmRsZXIiOnRydWUsImppdHRlciI6ImNlbnRlciIsImxpbWl0Ijo2MS4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUiOjYwLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZTIiOjYwLjAsInRpY2tfc3BlZWRfMSI6MTQuMCwidGlja19zcGVlZF8yIjoxNC4wLCJ5YXdfYmFzZSI6ImF0IHRhcmdldCIsInlhd19sZWZ0IjotMTcuMCwieWF3X3JpZ2h0IjoyNy4wLCJ+ZGVmZW5zaXZlX2hhbmRsZXIiOnsibWF4X2Nob2tlIjoyNC4wLCJtZXRob2QiOiJuZXZlcmxvc2UiLCJtaW5fY2hva2UiOjE2LjB9LCJ+aml0dGVyIjp7ImNoZWF0X3ByZXNldCI6ImdhbWVzZW5zZSIsImRlbGF5X29wdGlvbnMiOiJhbGdvcml0aG0iLCJkZWxheV90eXBlIjoiZml4ZWQiLCJkaXZpZGVyIjozLjAsImZpeGVkX2dhbWVzZW5zZSI6Mi4wLCJmaXhlZF9uZXZlcmxvc2UiOjQuMCwiaml0dGVyX3ZhbHVlIjoyNi4wLCJtYXhfZ2FtZXNlbnNlIjoxNS4wLCJtYXhfbmV2ZXJsb3NlIjoxMS4wLCJtaW5fZ2FtZXNlbnNlIjo5LjAsIm1pbl9uZXZlcmxvc2UiOjUuMCwibm9ybWFsX2ZpeGVkIjoyLjAsIm5vcm1hbF9tYXgiOjEuMCwibm9ybWFsX21pbiI6MS4wfSwifnlhd19iYXNlIjp7InJhbmRvbWl6ZXIiOjAuMH19LCJjcm91Y2ggbW92aW5nIjp7ImFudGlicnV0ZSI6dHJ1ZSwiYm9keV95YXciOiJub3JtYWwiLCJkZWZlbnNpdmVfaGFuZGxlciI6dHJ1ZSwiaml0dGVyIjoic2FueWEiLCJsaW1pdCI6NjEuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlIjo2MC4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUyIjo2MC4wLCJ0aWNrX3NwZWVkXzEiOjEwLjAsInRpY2tfc3BlZWRfMiI6MTQuMCwieWF3X2Jhc2UiOiJhdCB0YXJnZXQiLCJ5YXdfbGVmdCI6LTIyLjAsInlhd19yaWdodCI6MjYuMCwifmRlZmVuc2l2ZV9oYW5kbGVyIjp7Im1heF9jaG9rZSI6MTIuMCwibWV0aG9kIjoibmV2ZXJsb3NlIiwibWluX2Nob2tlIjoxMi4wfSwifmppdHRlciI6eyJjaGVhdF9wcmVzZXQiOiJuZXZlcmxvc2UiLCJkZWxheV9vcHRpb25zIjoiYWxnb3JpdGhtIiwiZGVsYXlfdHlwZSI6InJhbmRvbSIsImRpdmlkZXIiOjE0LjAsImZpeGVkX2dhbWVzZW5zZSI6OC4wLCJmaXhlZF9uZXZlcmxvc2UiOjguMCwiaml0dGVyX3ZhbHVlIjo5LjAsIm1heF9nYW1lc2Vuc2UiOjkuMCwibWF4X25ldmVybG9zZSI6OS4wLCJtaW5fZ2FtZXNlbnNlIjo0LjAsIm1pbl9uZXZlcmxvc2UiOjguMCwibm9ybWFsX2ZpeGVkIjo4LjAsIm5vcm1hbF9tYXgiOjEwLjAsIm5vcm1hbF9taW4iOjkuMH0sIn55YXdfYmFzZSI6eyJyYW5kb21pemVyIjowLjB9fSwiY3JvdWNoaW5nIjp7ImFudGlicnV0ZSI6dHJ1ZSwiYm9keV95YXciOiJub3JtYWwiLCJkZWZlbnNpdmVfaGFuZGxlciI6dHJ1ZSwiaml0dGVyIjoic2FueWEiLCJsaW1pdCI6NjEuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlIjo2MC4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUyIjo2MC4wLCJ0aWNrX3NwZWVkXzEiOjE0LjAsInRpY2tfc3BlZWRfMiI6MTYuMCwieWF3X2Jhc2UiOiJhdCB0YXJnZXQiLCJ5YXdfbGVmdCI6LTIwLjAsInlhd19yaWdodCI6MzcuMCwifmRlZmVuc2l2ZV9oYW5kbGVyIjp7Im1heF9jaG9rZSI6MTIuMCwibWV0aG9kIjoibmV2ZXJsb3NlIiwibWluX2Nob2tlIjoxMi4wfSwifmppdHRlciI6eyJjaGVhdF9wcmVzZXQiOiJuZXZlcmxvc2UiLCJkZWxheV9vcHRpb25zIjoiY2hlYXQgYmFzZWQiLCJkZWxheV90eXBlIjoicmFuZG9tIiwiZGl2aWRlciI6MTQuMCwiZml4ZWRfZ2FtZXNlbnNlIjo4LjAsImZpeGVkX25ldmVybG9zZSI6OC4wLCJqaXR0ZXJfdmFsdWUiOjEyLjAsIm1heF9nYW1lc2Vuc2UiOjEyLjAsIm1heF9uZXZlcmxvc2UiOjkuMCwibWluX2dhbWVzZW5zZSI6NC4wLCJtaW5fbmV2ZXJsb3NlIjo3LjAsIm5vcm1hbF9maXhlZCI6OC4wLCJub3JtYWxfbWF4IjoxMi4wLCJub3JtYWxfbWluIjo0LjB9LCJ+eWF3X2Jhc2UiOnsicmFuZG9taXplciI6MC4wfX0sImp1bXBpbmciOnsiYW50aWJydXRlIjp0cnVlLCJib2R5X3lhdyI6Im5vcm1hbCIsImRlZmVuc2l2ZV9oYW5kbGVyIjp0cnVlLCJqaXR0ZXIiOiJjZW50ZXIiLCJsaW1pdCI6NjAuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlIjo2MC4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUyIjo2MC4wLCJ0aWNrX3NwZWVkXzEiOjguMCwidGlja19zcGVlZF8yIjo4LjAsInlhd19iYXNlIjoiYXQgdGFyZ2V0IiwieWF3X2xlZnQiOi0xMy4wLCJ5YXdfcmlnaHQiOjIwLjAsIn5kZWZlbnNpdmVfaGFuZGxlciI6eyJtYXhfY2hva2UiOjEyLjAsIm1ldGhvZCI6Im5ldmVybG9zZSIsIm1pbl9jaG9rZSI6MTIuMH0sIn5qaXR0ZXIiOnsiY2hlYXRfcHJlc2V0IjoiZ2FtZXNlbnNlIiwiZGVsYXlfb3B0aW9ucyI6ImFsZ29yaXRobSIsImRlbGF5X3R5cGUiOiJyYW5kb20iLCJkaXZpZGVyIjo5LjAsImZpeGVkX2dhbWVzZW5zZSI6OC4wLCJmaXhlZF9uZXZlcmxvc2UiOjguMCwiaml0dGVyX3ZhbHVlIjoxNC4wLCJtYXhfZ2FtZXNlbnNlIjoxMi4wLCJtYXhfbmV2ZXJsb3NlIjoxMi4wLCJtaW5fZ2FtZXNlbnNlIjo0LjAsIm1pbl9uZXZlcmxvc2UiOjQuMCwibm9ybWFsX2ZpeGVkIjo4LjAsIm5vcm1hbF9tYXgiOjEuMCwibm9ybWFsX21pbiI6MS4wfSwifnlhd19iYXNlIjp7InJhbmRvbWl6ZXIiOjAuMH19LCJydW5uaW5nIjp7ImFudGlicnV0ZSI6dHJ1ZSwiYm9keV95YXciOiJ0aWNrIiwiZGVmZW5zaXZlX2hhbmRsZXIiOnRydWUsImppdHRlciI6InNhbnlhIiwibGltaXQiOjYxLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZSI6NTguMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlMiI6NjAuMCwidGlja19zcGVlZF8xIjoxMC4wLCJ0aWNrX3NwZWVkXzIiOjE2LjAsInlhd19iYXNlIjoiYXQgdGFyZ2V0IiwieWF3X2xlZnQiOi0yMS4wLCJ5YXdfcmlnaHQiOjI1LjAsIn5kZWZlbnNpdmVfaGFuZGxlciI6eyJtYXhfY2hva2UiOjEyLjAsIm1ldGhvZCI6Im5ldmVybG9zZSIsIm1pbl9jaG9rZSI6MTIuMH0sIn5qaXR0ZXIiOnsiY2hlYXRfcHJlc2V0IjoiZ2FtZXNlbnNlIiwiZGVsYXlfb3B0aW9ucyI6ImNoZWF0IGJhc2VkIiwiZGVsYXlfdHlwZSI6InJhbmRvbSIsImRpdmlkZXIiOjE0LjAsImZpeGVkX2dhbWVzZW5zZSI6OC4wLCJmaXhlZF9uZXZlcmxvc2UiOjguMCwiaml0dGVyX3ZhbHVlIjoyLjAsIm1heF9nYW1lc2Vuc2UiOjMuMCwibWF4X25ldmVybG9zZSI6Ni4wLCJtaW5fZ2FtZXNlbnNlIjoyLjAsIm1pbl9uZXZlcmxvc2UiOjQuMCwibm9ybWFsX2ZpeGVkIjo4LjAsIm5vcm1hbF9tYXgiOjkuMCwibm9ybWFsX21pbiI6OC4wfSwifnlhd19iYXNlIjp7InJhbmRvbWl6ZXIiOjQuMH19LCJzdGFuZGluZyI6eyJhbnRpYnJ1dGUiOnRydWUsImJvZHlfeWF3Ijoibm9ybWFsIiwiZGVmZW5zaXZlX2hhbmRsZXIiOmZhbHNlLCJqaXR0ZXIiOiJjZW50ZXIiLCJsaW1pdCI6NjEuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlIjo2MC4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUyIjo2MC4wLCJ0aWNrX3NwZWVkXzEiOjE0LjAsInRpY2tfc3BlZWRfMiI6MTUuMCwieWF3X2Jhc2UiOiJhdCB0YXJnZXQiLCJ5YXdfbGVmdCI6LTIxLjAsInlhd19yaWdodCI6MjguMCwifmRlZmVuc2l2ZV9oYW5kbGVyIjp7Im1heF9jaG9rZSI6MTIuMCwibWV0aG9kIjoibmV2ZXJsb3NlIiwibWluX2Nob2tlIjoxMi4wfSwifmppdHRlciI6eyJjaGVhdF9wcmVzZXQiOiJuZXZlcmxvc2UiLCJkZWxheV9vcHRpb25zIjoiYWxnb3JpdGhtIiwiZGVsYXlfdHlwZSI6InJhbmRvbSIsImRpdmlkZXIiOjE0LjAsImZpeGVkX2dhbWVzZW5zZSI6MTMuMCwiZml4ZWRfbmV2ZXJsb3NlIjo4LjAsImppdHRlcl92YWx1ZSI6MTUuMCwibWF4X2dhbWVzZW5zZSI6MTEuMCwibWF4X25ldmVybG9zZSI6OC4wLCJtaW5fZ2FtZXNlbnNlIjo4LjAsIm1pbl9uZXZlcmxvc2UiOjcuMCwibm9ybWFsX2ZpeGVkIjo4LjAsIm5vcm1hbF9tYXgiOjEyLjAsIm5vcm1hbF9taW4iOjQuMH0sIn55YXdfYmFzZSI6eyJyYW5kb21pemVyIjowLjB9fSwid2Fsa2luZyI6eyJhbnRpYnJ1dGUiOnRydWUsImJvZHlfeWF3Ijoib2ZmIiwiZGVmZW5zaXZlX2hhbmRsZXIiOmZhbHNlLCJqaXR0ZXIiOiJvZmYiLCJsaW1pdCI6NjAuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlIjo2MC4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUyIjo2MC4wLCJ0aWNrX3NwZWVkXzEiOjguMCwidGlja19zcGVlZF8yIjo4LjAsInlhd19iYXNlIjoiYXQgdGFyZ2V0IiwieWF3X2xlZnQiOjAuMCwieWF3X3JpZ2h0IjowLjAsIn5kZWZlbnNpdmVfaGFuZGxlciI6eyJtYXhfY2hva2UiOjEyLjAsIm1ldGhvZCI6Im5ldmVybG9zZSIsIm1pbl9jaG9rZSI6MTIuMH0sIn5qaXR0ZXIiOnsiY2hlYXRfcHJlc2V0IjoiZ2FtZXNlbnNlIiwiZGVsYXlfb3B0aW9ucyI6Im5vcm1hbCIsImRlbGF5X3R5cGUiOiJyYW5kb20iLCJkaXZpZGVyIjoxNC4wLCJmaXhlZF9nYW1lc2Vuc2UiOjguMCwiZml4ZWRfbmV2ZXJsb3NlIjo4LjAsImppdHRlcl92YWx1ZSI6MC4wLCJtYXhfZ2FtZXNlbnNlIjoxMi4wLCJtYXhfbmV2ZXJsb3NlIjoxMi4wLCJtaW5fZ2FtZXNlbnNlIjo0LjAsIm1pbl9uZXZlcmxvc2UiOjQuMCwibm9ybWFsX2ZpeGVkIjo4LjAsIm5vcm1hbF9tYXgiOjEyLjAsIm5vcm1hbF9taW4iOjQuMH0sIn55YXdfYmFzZSI6eyJyYW5kb21pemVyIjowLjB9fX0sImN1c3RvbXNjb3BlIjp0cnVlLCJmYXN0X2xhZGRlciI6dHJ1ZSwiZnJlZXpldGltZV9mYWtlZHVjayI6dHJ1ZSwiaW50ZXJwb2xhdGluZyI6ZmFsc2UsImppdHRlcl9sZWdzIjp0cnVlLCJqaXR0ZXJfbGVnc19mcm9tIjoxMDAuMCwiaml0dGVyX2xlZ3NfdG8iOjEwMC4wLCJsaXN0Ijo1LjAsIm1hbnVhbCI6ImJhY2t3YXJkIiwibmFtZSI6Ikxla2ExIiwibm9fZmFsbF9kYW1hZ2UiOnRydWUsIm5vdGlmaWNhdGlvbnMiOmZhbHNlLCJ0ZXJyb3Jpc3QiOnsiY3JvdWNoIGp1bXBpbmciOnsiYW50aWJydXRlIjp0cnVlLCJib2R5X3lhdyI6InRpY2siLCJkZWZlbnNpdmVfaGFuZGxlciI6dHJ1ZSwiaml0dGVyIjoic2FueWEiLCJsaW1pdCI6NjEuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlIjo2MC4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUyIjo2MC4wLCJ0aWNrX3NwZWVkXzEiOjEzLjAsInRpY2tfc3BlZWRfMiI6MTYuMCwieWF3X2Jhc2UiOiJhdCB0YXJnZXQiLCJ5YXdfbGVmdCI6LTIzLjAsInlhd19yaWdodCI6MzMuMCwifmRlZmVuc2l2ZV9oYW5kbGVyIjp7Im1heF9jaG9rZSI6MjQuMCwibWV0aG9kIjoibmV2ZXJsb3NlIiwibWluX2Nob2tlIjoxNi4wfSwifmppdHRlciI6eyJjaGVhdF9wcmVzZXQiOiJuZXZlcmxvc2UiLCJkZWxheV9vcHRpb25zIjoiYWxnb3JpdGhtIiwiZGVsYXlfdHlwZSI6InJhbmRvbSIsImRpdmlkZXIiOjYuMCwiZml4ZWRfZ2FtZXNlbnNlIjozLjAsImZpeGVkX25ldmVybG9zZSI6Ny4wLCJqaXR0ZXJfdmFsdWUiOjEzLjAsIm1heF9nYW1lc2Vuc2UiOjE1LjAsIm1heF9uZXZlcmxvc2UiOjcuMCwibWluX2dhbWVzZW5zZSI6OS4wLCJtaW5fbmV2ZXJsb3NlIjo2LjAsIm5vcm1hbF9maXhlZCI6OC4wLCJub3JtYWxfbWF4Ijo4LjAsIm5vcm1hbF9taW4iOjQuMH0sIn55YXdfYmFzZSI6eyJyYW5kb21pemVyIjowLjB9fSwiY3JvdWNoIG1vdmluZyI6eyJhbnRpYnJ1dGUiOnRydWUsImJvZHlfeWF3Ijoibm9ybWFsIiwiZGVmZW5zaXZlX2hhbmRsZXIiOnRydWUsImppdHRlciI6InNhbnlhIiwibGltaXQiOjYxLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZSI6NjAuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlMiI6NjAuMCwidGlja19zcGVlZF8xIjoxMi4wLCJ0aWNrX3NwZWVkXzIiOjE1LjAsInlhd19iYXNlIjoiYXQgdGFyZ2V0IiwieWF3X2xlZnQiOi0xOC4wLCJ5YXdfcmlnaHQiOjI2LjAsIn5kZWZlbnNpdmVfaGFuZGxlciI6eyJtYXhfY2hva2UiOjIwLjAsIm1ldGhvZCI6Im5ldmVybG9zZSIsIm1pbl9jaG9rZSI6MTYuMH0sIn5qaXR0ZXIiOnsiY2hlYXRfcHJlc2V0IjoibmV2ZXJsb3NlIiwiZGVsYXlfb3B0aW9ucyI6ImFsZ29yaXRobSIsImRlbGF5X3R5cGUiOiJyYW5kb20iLCJkaXZpZGVyIjoxNC4wLCJmaXhlZF9nYW1lc2Vuc2UiOjguMCwiZml4ZWRfbmV2ZXJsb3NlIjo4LjAsImppdHRlcl92YWx1ZSI6MTYuMCwibWF4X2dhbWVzZW5zZSI6OS4wLCJtYXhfbmV2ZXJsb3NlIjo5LjAsIm1pbl9nYW1lc2Vuc2UiOjQuMCwibWluX25ldmVybG9zZSI6OC4wLCJub3JtYWxfZml4ZWQiOjguMCwibm9ybWFsX21heCI6MTAuMCwibm9ybWFsX21pbiI6OS4wfSwifnlhd19iYXNlIjp7InJhbmRvbWl6ZXIiOjEuMH19LCJjcm91Y2hpbmciOnsiYW50aWJydXRlIjp0cnVlLCJib2R5X3lhdyI6Im5vcm1hbCIsImRlZmVuc2l2ZV9oYW5kbGVyIjp0cnVlLCJqaXR0ZXIiOiJzYW55YSIsImxpbWl0Ijo2MS4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUiOjYwLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZTIiOjYwLjAsInRpY2tfc3BlZWRfMSI6MTQuMCwidGlja19zcGVlZF8yIjoxNi4wLCJ5YXdfYmFzZSI6ImF0IHRhcmdldCIsInlhd19sZWZ0IjotMjIuMCwieWF3X3JpZ2h0IjozOC4wLCJ+ZGVmZW5zaXZlX2hhbmRsZXIiOnsibWF4X2Nob2tlIjoxMi4wLCJtZXRob2QiOiJuZXZlcmxvc2UiLCJtaW5fY2hva2UiOjEyLjB9LCJ+aml0dGVyIjp7ImNoZWF0X3ByZXNldCI6Im5ldmVybG9zZSIsImRlbGF5X29wdGlvbnMiOiJhbGdvcml0aG0iLCJkZWxheV90eXBlIjoicmFuZG9tIiwiZGl2aWRlciI6MTQuMCwiZml4ZWRfZ2FtZXNlbnNlIjo4LjAsImZpeGVkX25ldmVybG9zZSI6OC4wLCJqaXR0ZXJfdmFsdWUiOjEyLjAsIm1heF9nYW1lc2Vuc2UiOjEyLjAsIm1heF9uZXZlcmxvc2UiOjguMCwibWluX2dhbWVzZW5zZSI6NC4wLCJtaW5fbmV2ZXJsb3NlIjo3LjAsIm5vcm1hbF9maXhlZCI6OC4wLCJub3JtYWxfbWF4IjoxMi4wLCJub3JtYWxfbWluIjo0LjB9LCJ+eWF3X2Jhc2UiOnsicmFuZG9taXplciI6MC4wfX0sImp1bXBpbmciOnsiYW50aWJydXRlIjp0cnVlLCJib2R5X3lhdyI6Im5vcm1hbCIsImRlZmVuc2l2ZV9oYW5kbGVyIjp0cnVlLCJqaXR0ZXIiOiJvZmYiLCJsaW1pdCI6NjEuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlIjo2MC4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUyIjo2MC4wLCJ0aWNrX3NwZWVkXzEiOjguMCwidGlja19zcGVlZF8yIjoxMC4wLCJ5YXdfYmFzZSI6ImF0IHRhcmdldCIsInlhd19sZWZ0IjotMjAuMCwieWF3X3JpZ2h0IjozNS4wLCJ+ZGVmZW5zaXZlX2hhbmRsZXIiOnsibWF4X2Nob2tlIjoxMi4wLCJtZXRob2QiOiJuZXZlcmxvc2UiLCJtaW5fY2hva2UiOjEyLjB9LCJ+aml0dGVyIjp7ImNoZWF0X3ByZXNldCI6ImdhbWVzZW5zZSIsImRlbGF5X29wdGlvbnMiOiJub3JtYWwiLCJkZWxheV90eXBlIjoicmFuZG9tIiwiZGl2aWRlciI6MTQuMCwiZml4ZWRfZ2FtZXNlbnNlIjo4LjAsImZpeGVkX25ldmVybG9zZSI6OC4wLCJqaXR0ZXJfdmFsdWUiOjAuMCwibWF4X2dhbWVzZW5zZSI6MTIuMCwibWF4X25ldmVybG9zZSI6MTIuMCwibWluX2dhbWVzZW5zZSI6NC4wLCJtaW5fbmV2ZXJsb3NlIjo0LjAsIm5vcm1hbF9maXhlZCI6OC4wLCJub3JtYWxfbWF4Ijo2LjAsIm5vcm1hbF9taW4iOjYuMH0sIn55YXdfYmFzZSI6eyJyYW5kb21pemVyIjowLjB9fSwicnVubmluZyI6eyJhbnRpYnJ1dGUiOnRydWUsImJvZHlfeWF3Ijoibm9ybWFsIiwiZGVmZW5zaXZlX2hhbmRsZXIiOmZhbHNlLCJqaXR0ZXIiOiJzYW55YSIsImxpbWl0Ijo2MS4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUiOjU4LjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZTIiOjYwLjAsInRpY2tfc3BlZWRfMSI6MTAuMCwidGlja19zcGVlZF8yIjoxNi4wLCJ5YXdfYmFzZSI6ImF0IHRhcmdldCIsInlhd19sZWZ0IjotMjMuMCwieWF3X3JpZ2h0IjoyMS4wLCJ+ZGVmZW5zaXZlX2hhbmRsZXIiOnsibWF4X2Nob2tlIjoxMi4wLCJtZXRob2QiOiJuZXZlcmxvc2UiLCJtaW5fY2hva2UiOjEyLjB9LCJ+aml0dGVyIjp7ImNoZWF0X3ByZXNldCI6Im5ldmVybG9zZSIsImRlbGF5X29wdGlvbnMiOiJhbGdvcml0aG0iLCJkZWxheV90eXBlIjoicmFuZG9tIiwiZGl2aWRlciI6MTQuMCwiZml4ZWRfZ2FtZXNlbnNlIjo4LjAsImZpeGVkX25ldmVybG9zZSI6OC4wLCJqaXR0ZXJfdmFsdWUiOjAuMCwibWF4X2dhbWVzZW5zZSI6MTIuMCwibWF4X25ldmVybG9zZSI6Ny4wLCJtaW5fZ2FtZXNlbnNlIjo3LjAsIm1pbl9uZXZlcmxvc2UiOjYuMCwibm9ybWFsX2ZpeGVkIjo4LjAsIm5vcm1hbF9tYXgiOjkuMCwibm9ybWFsX21pbiI6OC4wfSwifnlhd19iYXNlIjp7InJhbmRvbWl6ZXIiOjQuMH19LCJzdGFuZGluZyI6eyJhbnRpYnJ1dGUiOnRydWUsImJvZHlfeWF3Ijoibm9ybWFsIiwiZGVmZW5zaXZlX2hhbmRsZXIiOmZhbHNlLCJqaXR0ZXIiOiJjZW50ZXIiLCJsaW1pdCI6NjEuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlIjo2MC4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUyIjo2MC4wLCJ0aWNrX3NwZWVkXzEiOjEyLjAsInRpY2tfc3BlZWRfMiI6MTUuMCwieWF3X2Jhc2UiOiJhdCB0YXJnZXQiLCJ5YXdfbGVmdCI6LTIyLjAsInlhd19yaWdodCI6MzQuMCwifmRlZmVuc2l2ZV9oYW5kbGVyIjp7Im1heF9jaG9rZSI6MTIuMCwibWV0aG9kIjoibmV2ZXJsb3NlIiwibWluX2Nob2tlIjoxMi4wfSwifmppdHRlciI6eyJjaGVhdF9wcmVzZXQiOiJuZXZlcmxvc2UiLCJkZWxheV9vcHRpb25zIjoibm9ybWFsIiwiZGVsYXlfdHlwZSI6InJhbmRvbSIsImRpdmlkZXIiOjE0LjAsImZpeGVkX2dhbWVzZW5zZSI6MTMuMCwiZml4ZWRfbmV2ZXJsb3NlIjo4LjAsImppdHRlcl92YWx1ZSI6MTkuMCwibWF4X2dhbWVzZW5zZSI6MTEuMCwibWF4X25ldmVybG9zZSI6MTAuMCwibWluX2dhbWVzZW5zZSI6OC4wLCJtaW5fbmV2ZXJsb3NlIjo3LjAsIm5vcm1hbF9maXhlZCI6OC4wLCJub3JtYWxfbWF4Ijo2LjAsIm5vcm1hbF9taW4iOjIuMH0sIn55YXdfYmFzZSI6eyJyYW5kb21pemVyIjowLjB9fSwid2Fsa2luZyI6eyJhbnRpYnJ1dGUiOnRydWUsImJvZHlfeWF3Ijoibm9ybWFsIiwiZGVmZW5zaXZlX2hhbmRsZXIiOmZhbHNlLCJqaXR0ZXIiOiJzYW55YSIsImxpbWl0Ijo2MS4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUiOjU4LjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZTIiOjYwLjAsInRpY2tfc3BlZWRfMSI6OC4wLCJ0aWNrX3NwZWVkXzIiOjguMCwieWF3X2Jhc2UiOiJhdCB0YXJnZXQiLCJ5YXdfbGVmdCI6LTI2LjAsInlhd19yaWdodCI6MzAuMCwifmRlZmVuc2l2ZV9oYW5kbGVyIjp7Im1heF9jaG9rZSI6MTIuMCwibWV0aG9kIjoibmV2ZXJsb3NlIiwibWluX2Nob2tlIjoxMi4wfSwifmppdHRlciI6eyJjaGVhdF9wcmVzZXQiOiJnYW1lc2Vuc2UiLCJkZWxheV9vcHRpb25zIjoiYWxnb3JpdGhtIiwiZGVsYXlfdHlwZSI6InJhbmRvbSIsImRpdmlkZXIiOjE0LjAsImZpeGVkX2dhbWVzZW5zZSI6OC4wLCJmaXhlZF9uZXZlcmxvc2UiOjguMCwiaml0dGVyX3ZhbHVlIjoyMi4wLCJtYXhfZ2FtZXNlbnNlIjoxMi4wLCJtYXhfbmV2ZXJsb3NlIjoxMi4wLCJtaW5fZ2FtZXNlbnNlIjo0LjAsIm1pbl9uZXZlcmxvc2UiOjQuMCwibm9ybWFsX2ZpeGVkIjo4LjAsIm5vcm1hbF9tYXgiOjExLjAsIm5vcm1hbF9taW4iOjguMH0sIn55YXdfYmFzZSI6eyJyYW5kb21pemVyIjo0LjB9fX0sInZpZXdtb2RlbCI6dHJ1ZSwifmFzcGVjdF9yYXRpbyI6eyJhbW91bnQiOjEyOS4wfSwifmN1c3RvbXNjb3BlIjp7ImdhcCI6My4wLCJsaW5lIjozMy4wLCJyb3RhdGUiOmZhbHNlfSwifm5vdGlmaWNhdGlvbnMiOnsiYW50aWJydXRlIjpmYWxzZSwiaGl0bG9ncyI6ZmFsc2UsInB1cmNoYXNlcyI6ZmFsc2V9LCJ+dmlld21vZGVsIjp7ImZvdiI6NjQyLjAsIngiOjExLjAsInkiOjI1LjAsInoiOjI1LjB9fV0=", 
        cola = "{ambani:config}:W3siYW5pbWF0aW9uc19mYWxsX2Ftb3VudCI6MjkuMCwiYW5pbWF0aW9uc19sZWFuX2Ftb3VudCI6MTAwLjAsImFuaW1hdGlvbnNfc2xpZGVfYW1vdW50Ijo1MC4wLCJhc3BlY3RfcmF0aW8iOnRydWUsImNvdW50ZXItdGVycm9yaXN0Ijp7ImNyb3VjaCBqdW1waW5nIjp7ImFudGlicnV0ZSI6dHJ1ZSwiYm9keV95YXciOiJub3JtYWwiLCJkZWZlbnNpdmVfaGFuZGxlciI6dHJ1ZSwiaml0dGVyIjoic2FueWEiLCJsaW1pdCI6NjEuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlIjoyOC4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUyIjo1OC4wLCJ0aWNrX3NwZWVkXzEiOjE0LjAsInRpY2tfc3BlZWRfMiI6MTQuMCwieWF3X2Jhc2UiOiJhdCB0YXJnZXQiLCJ5YXdfbGVmdCI6LTE2LjAsInlhd19yaWdodCI6NDAuMCwifmRlZmVuc2l2ZV9oYW5kbGVyIjp7Im1heF9jaG9rZSI6MTIuMCwibWV0aG9kIjoibmV2ZXJsb3NlIiwibWluX2Nob2tlIjoxMi4wfSwifmppdHRlciI6eyJjaGVhdF9wcmVzZXQiOiJuZXZlcmxvc2UiLCJkZWxheV9vcHRpb25zIjoiYWxnb3JpdGhtIiwiZGVsYXlfdHlwZSI6InJhbmRvbSIsImRpdmlkZXIiOjExLjAsImZpeGVkX2dhbWVzZW5zZSI6My4wLCJmaXhlZF9uZXZlcmxvc2UiOjcuMCwiaml0dGVyX3ZhbHVlIjoxMC4wLCJtYXhfZ2FtZXNlbnNlIjoxNS4wLCJtYXhfbmV2ZXJsb3NlIjoxMS4wLCJtaW5fZ2FtZXNlbnNlIjo5LjAsIm1pbl9uZXZlcmxvc2UiOjUuMCwibm9ybWFsX2ZpeGVkIjo4LjAsIm5vcm1hbF9tYXgiOjguMCwibm9ybWFsX21pbiI6NC4wfSwifnlhd19iYXNlIjp7InJhbmRvbWl6ZXIiOjAuMH19LCJjcm91Y2ggbW92aW5nIjp7ImFudGlicnV0ZSI6dHJ1ZSwiYm9keV95YXciOiJub3JtYWwiLCJkZWZlbnNpdmVfaGFuZGxlciI6dHJ1ZSwiaml0dGVyIjoic2FueWEiLCJsaW1pdCI6NjEuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlIjo2MC4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUyIjo2MC4wLCJ0aWNrX3NwZWVkXzEiOjEwLjAsInRpY2tfc3BlZWRfMiI6MTQuMCwieWF3X2Jhc2UiOiJhdCB0YXJnZXQiLCJ5YXdfbGVmdCI6LTI0LjAsInlhd19yaWdodCI6MjYuMCwifmRlZmVuc2l2ZV9oYW5kbGVyIjp7Im1heF9jaG9rZSI6MTIuMCwibWV0aG9kIjoibmV2ZXJsb3NlIiwibWluX2Nob2tlIjoxMi4wfSwifmppdHRlciI6eyJjaGVhdF9wcmVzZXQiOiJuZXZlcmxvc2UiLCJkZWxheV9vcHRpb25zIjoiYWxnb3JpdGhtIiwiZGVsYXlfdHlwZSI6InJhbmRvbSIsImRpdmlkZXIiOjkuMCwiZml4ZWRfZ2FtZXNlbnNlIjo4LjAsImZpeGVkX25ldmVybG9zZSI6OC4wLCJqaXR0ZXJfdmFsdWUiOjE0LjAsIm1heF9nYW1lc2Vuc2UiOjkuMCwibWF4X25ldmVybG9zZSI6OS4wLCJtaW5fZ2FtZXNlbnNlIjo0LjAsIm1pbl9uZXZlcmxvc2UiOjguMCwibm9ybWFsX2ZpeGVkIjo4LjAsIm5vcm1hbF9tYXgiOjEwLjAsIm5vcm1hbF9taW4iOjkuMH0sIn55YXdfYmFzZSI6eyJyYW5kb21pemVyIjowLjB9fSwiY3JvdWNoaW5nIjp7ImFudGlicnV0ZSI6dHJ1ZSwiYm9keV95YXciOiJub3JtYWwiLCJkZWZlbnNpdmVfaGFuZGxlciI6dHJ1ZSwiaml0dGVyIjoic2FueWEiLCJsaW1pdCI6NjEuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlIjo2MC4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUyIjo2MC4wLCJ0aWNrX3NwZWVkXzEiOjE0LjAsInRpY2tfc3BlZWRfMiI6MTYuMCwieWF3X2Jhc2UiOiJhdCB0YXJnZXQiLCJ5YXdfbGVmdCI6LTIwLjAsInlhd19yaWdodCI6MzcuMCwifmRlZmVuc2l2ZV9oYW5kbGVyIjp7Im1heF9jaG9rZSI6MTIuMCwibWV0aG9kIjoibmV2ZXJsb3NlIiwibWluX2Nob2tlIjoxMi4wfSwifmppdHRlciI6eyJjaGVhdF9wcmVzZXQiOiJuZXZlcmxvc2UiLCJkZWxheV9vcHRpb25zIjoiYWxnb3JpdGhtIiwiZGVsYXlfdHlwZSI6InJhbmRvbSIsImRpdmlkZXIiOjE0LjAsImZpeGVkX2dhbWVzZW5zZSI6OC4wLCJmaXhlZF9uZXZlcmxvc2UiOjguMCwiaml0dGVyX3ZhbHVlIjoxMi4wLCJtYXhfZ2FtZXNlbnNlIjoxMi4wLCJtYXhfbmV2ZXJsb3NlIjo5LjAsIm1pbl9nYW1lc2Vuc2UiOjQuMCwibWluX25ldmVybG9zZSI6OC4wLCJub3JtYWxfZml4ZWQiOjguMCwibm9ybWFsX21heCI6MTIuMCwibm9ybWFsX21pbiI6NC4wfSwifnlhd19iYXNlIjp7InJhbmRvbWl6ZXIiOjAuMH19LCJqdW1waW5nIjp7ImFudGlicnV0ZSI6dHJ1ZSwiYm9keV95YXciOiJub3JtYWwiLCJkZWZlbnNpdmVfaGFuZGxlciI6dHJ1ZSwiaml0dGVyIjoib2Zmc2V0IiwibGltaXQiOjYwLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZSI6NjAuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlMiI6NjAuMCwidGlja19zcGVlZF8xIjo4LjAsInRpY2tfc3BlZWRfMiI6OC4wLCJ5YXdfYmFzZSI6ImF0IHRhcmdldCIsInlhd19sZWZ0IjowLjAsInlhd19yaWdodCI6MC4wLCJ+ZGVmZW5zaXZlX2hhbmRsZXIiOnsibWF4X2Nob2tlIjoxMi4wLCJtZXRob2QiOiJuZXZlcmxvc2UiLCJtaW5fY2hva2UiOjEyLjB9LCJ+aml0dGVyIjp7ImNoZWF0X3ByZXNldCI6ImdhbWVzZW5zZSIsImRlbGF5X29wdGlvbnMiOiJub3JtYWwiLCJkZWxheV90eXBlIjoicmFuZG9tIiwiZGl2aWRlciI6MTQuMCwiZml4ZWRfZ2FtZXNlbnNlIjo4LjAsImZpeGVkX25ldmVybG9zZSI6OC4wLCJqaXR0ZXJfdmFsdWUiOjUuMCwibWF4X2dhbWVzZW5zZSI6MTIuMCwibWF4X25ldmVybG9zZSI6MTIuMCwibWluX2dhbWVzZW5zZSI6NC4wLCJtaW5fbmV2ZXJsb3NlIjo0LjAsIm5vcm1hbF9maXhlZCI6OC4wLCJub3JtYWxfbWF4IjoxLjAsIm5vcm1hbF9taW4iOjEuMH0sIn55YXdfYmFzZSI6eyJyYW5kb21pemVyIjowLjB9fSwicnVubmluZyI6eyJhbnRpYnJ1dGUiOnRydWUsImJvZHlfeWF3Ijoibm9ybWFsIiwiZGVmZW5zaXZlX2hhbmRsZXIiOmZhbHNlLCJqaXR0ZXIiOiJzYW55YSIsImxpbWl0Ijo2MS4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUiOjU5LjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZTIiOjYwLjAsInRpY2tfc3BlZWRfMSI6Ni4wLCJ0aWNrX3NwZWVkXzIiOjYuMCwieWF3X2Jhc2UiOiJhdCB0YXJnZXQiLCJ5YXdfbGVmdCI6LTI0LjAsInlhd19yaWdodCI6MzYuMCwifmRlZmVuc2l2ZV9oYW5kbGVyIjp7Im1heF9jaG9rZSI6MTIuMCwibWV0aG9kIjoibmV2ZXJsb3NlIiwibWluX2Nob2tlIjoxMi4wfSwifmppdHRlciI6eyJjaGVhdF9wcmVzZXQiOiJuZXZlcmxvc2UiLCJkZWxheV9vcHRpb25zIjoiY2hlYXQgYmFzZWQiLCJkZWxheV90eXBlIjoicmFuZG9tIiwiZGl2aWRlciI6MTQuMCwiZml4ZWRfZ2FtZXNlbnNlIjo4LjAsImZpeGVkX25ldmVybG9zZSI6OC4wLCJqaXR0ZXJfdmFsdWUiOjE1LjAsIm1heF9nYW1lc2Vuc2UiOjEyLjAsIm1heF9uZXZlcmxvc2UiOjcuMCwibWluX2dhbWVzZW5zZSI6Ny4wLCJtaW5fbmV2ZXJsb3NlIjo2LjAsIm5vcm1hbF9maXhlZCI6OC4wLCJub3JtYWxfbWF4Ijo5LjAsIm5vcm1hbF9taW4iOjguMH0sIn55YXdfYmFzZSI6eyJyYW5kb21pemVyIjowLjB9fSwic3RhbmRpbmciOnsiYW50aWJydXRlIjp0cnVlLCJib2R5X3lhdyI6Im5vcm1hbCIsImRlZmVuc2l2ZV9oYW5kbGVyIjpmYWxzZSwiaml0dGVyIjoiY2VudGVyIiwibGltaXQiOjYxLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZSI6NjAuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlMiI6NjAuMCwidGlja19zcGVlZF8xIjoxNC4wLCJ0aWNrX3NwZWVkXzIiOjE1LjAsInlhd19iYXNlIjoiYXQgdGFyZ2V0IiwieWF3X2xlZnQiOi0yMS4wLCJ5YXdfcmlnaHQiOjI4LjAsIn5kZWZlbnNpdmVfaGFuZGxlciI6eyJtYXhfY2hva2UiOjEyLjAsIm1ldGhvZCI6Im5ldmVybG9zZSIsIm1pbl9jaG9rZSI6MTIuMH0sIn5qaXR0ZXIiOnsiY2hlYXRfcHJlc2V0IjoibmV2ZXJsb3NlIiwiZGVsYXlfb3B0aW9ucyI6ImFsZ29yaXRobSIsImRlbGF5X3R5cGUiOiJyYW5kb20iLCJkaXZpZGVyIjoxMi4wLCJmaXhlZF9nYW1lc2Vuc2UiOjEzLjAsImZpeGVkX25ldmVybG9zZSI6OC4wLCJqaXR0ZXJfdmFsdWUiOjE1LjAsIm1heF9nYW1lc2Vuc2UiOjExLjAsIm1heF9uZXZlcmxvc2UiOjguMCwibWluX2dhbWVzZW5zZSI6OC4wLCJtaW5fbmV2ZXJsb3NlIjo3LjAsIm5vcm1hbF9maXhlZCI6OC4wLCJub3JtYWxfbWF4IjoxMi4wLCJub3JtYWxfbWluIjo0LjB9LCJ+eWF3X2Jhc2UiOnsicmFuZG9taXplciI6MC4wfX0sIndhbGtpbmciOnsiYW50aWJydXRlIjp0cnVlLCJib2R5X3lhdyI6Im9mZiIsImRlZmVuc2l2ZV9oYW5kbGVyIjpmYWxzZSwiaml0dGVyIjoib2ZmIiwibGltaXQiOjYwLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZSI6NjAuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlMiI6NjAuMCwidGlja19zcGVlZF8xIjo4LjAsInRpY2tfc3BlZWRfMiI6OC4wLCJ5YXdfYmFzZSI6ImF0IHRhcmdldCIsInlhd19sZWZ0IjowLjAsInlhd19yaWdodCI6MC4wLCJ+ZGVmZW5zaXZlX2hhbmRsZXIiOnsibWF4X2Nob2tlIjoxMi4wLCJtZXRob2QiOiJuZXZlcmxvc2UiLCJtaW5fY2hva2UiOjEyLjB9LCJ+aml0dGVyIjp7ImNoZWF0X3ByZXNldCI6ImdhbWVzZW5zZSIsImRlbGF5X29wdGlvbnMiOiJub3JtYWwiLCJkZWxheV90eXBlIjoicmFuZG9tIiwiZGl2aWRlciI6MTQuMCwiZml4ZWRfZ2FtZXNlbnNlIjo4LjAsImZpeGVkX25ldmVybG9zZSI6OC4wLCJqaXR0ZXJfdmFsdWUiOjAuMCwibWF4X2dhbWVzZW5zZSI6MTIuMCwibWF4X25ldmVybG9zZSI6MTIuMCwibWluX2dhbWVzZW5zZSI6NC4wLCJtaW5fbmV2ZXJsb3NlIjo0LjAsIm5vcm1hbF9maXhlZCI6OC4wLCJub3JtYWxfbWF4IjoxMi4wLCJub3JtYWxfbWluIjo0LjB9LCJ+eWF3X2Jhc2UiOnsicmFuZG9taXplciI6MC4wfX19LCJjdXN0b21zY29wZSI6dHJ1ZSwiZmFzdF9sYWRkZXIiOmZhbHNlLCJmcmVlemV0aW1lX2Zha2VkdWNrIjp0cnVlLCJpbnRlcnBvbGF0aW5nIjpmYWxzZSwiaml0dGVyX2xlZ3MiOnRydWUsImppdHRlcl9sZWdzX2Zyb20iOjk0LjAsImppdHRlcl9sZWdzX3RvIjozNy4wLCJsaXN0Ijo2LjAsIm1hbnVhbCI6ImJhY2t3YXJkIiwibmFtZSI6ImZhc3p0ZXN0MTIzIiwibm9fZmFsbF9kYW1hZ2UiOnRydWUsIm5vdGlmaWNhdGlvbnMiOmZhbHNlLCJ0ZXJyb3Jpc3QiOnsiY3JvdWNoIGp1bXBpbmciOnsiYW50aWJydXRlIjp0cnVlLCJib2R5X3lhdyI6Im5vcm1hbCIsImRlZmVuc2l2ZV9oYW5kbGVyIjp0cnVlLCJqaXR0ZXIiOiJzYW55YSIsImxpbWl0Ijo2MS4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUiOjYwLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZTIiOjYwLjAsInRpY2tfc3BlZWRfMSI6MTIuMCwidGlja19zcGVlZF8yIjoxNS4wLCJ5YXdfYmFzZSI6ImF0IHRhcmdldCIsInlhd19sZWZ0IjotMTkuMCwieWF3X3JpZ2h0Ijo0MS4wLCJ+ZGVmZW5zaXZlX2hhbmRsZXIiOnsibWF4X2Nob2tlIjoyMC4wLCJtZXRob2QiOiJuZXZlcmxvc2UiLCJtaW5fY2hva2UiOjE2LjB9LCJ+aml0dGVyIjp7ImNoZWF0X3ByZXNldCI6Im5ldmVybG9zZSIsImRlbGF5X29wdGlvbnMiOiJhbGdvcml0aG0iLCJkZWxheV90eXBlIjoicmFuZG9tIiwiZGl2aWRlciI6MTAuMCwiZml4ZWRfZ2FtZXNlbnNlIjozLjAsImZpeGVkX25ldmVybG9zZSI6Ny4wLCJqaXR0ZXJfdmFsdWUiOjEzLjAsIm1heF9nYW1lc2Vuc2UiOjE1LjAsIm1heF9uZXZlcmxvc2UiOjcuMCwibWluX2dhbWVzZW5zZSI6OS4wLCJtaW5fbmV2ZXJsb3NlIjo2LjAsIm5vcm1hbF9maXhlZCI6OC4wLCJub3JtYWxfbWF4Ijo4LjAsIm5vcm1hbF9taW4iOjQuMH0sIn55YXdfYmFzZSI6eyJyYW5kb21pemVyIjowLjB9fSwiY3JvdWNoIG1vdmluZyI6eyJhbnRpYnJ1dGUiOnRydWUsImJvZHlfeWF3Ijoibm9ybWFsIiwiZGVmZW5zaXZlX2hhbmRsZXIiOnRydWUsImppdHRlciI6InNhbnlhIiwibGltaXQiOjYxLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZSI6NjAuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlMiI6NjAuMCwidGlja19zcGVlZF8xIjoxMi4wLCJ0aWNrX3NwZWVkXzIiOjE1LjAsInlhd19iYXNlIjoiYXQgdGFyZ2V0IiwieWF3X2xlZnQiOi0xOC4wLCJ5YXdfcmlnaHQiOjMwLjAsIn5kZWZlbnNpdmVfaGFuZGxlciI6eyJtYXhfY2hva2UiOjIwLjAsIm1ldGhvZCI6Im5ldmVybG9zZSIsIm1pbl9jaG9rZSI6MTYuMH0sIn5qaXR0ZXIiOnsiY2hlYXRfcHJlc2V0IjoibmV2ZXJsb3NlIiwiZGVsYXlfb3B0aW9ucyI6ImFsZ29yaXRobSIsImRlbGF5X3R5cGUiOiJyYW5kb20iLCJkaXZpZGVyIjoxMi4wLCJmaXhlZF9nYW1lc2Vuc2UiOjguMCwiZml4ZWRfbmV2ZXJsb3NlIjo4LjAsImppdHRlcl92YWx1ZSI6MTQuMCwibWF4X2dhbWVzZW5zZSI6OS4wLCJtYXhfbmV2ZXJsb3NlIjo5LjAsIm1pbl9nYW1lc2Vuc2UiOjQuMCwibWluX25ldmVybG9zZSI6OC4wLCJub3JtYWxfZml4ZWQiOjguMCwibm9ybWFsX21heCI6MTAuMCwibm9ybWFsX21pbiI6OS4wfSwifnlhd19iYXNlIjp7InJhbmRvbWl6ZXIiOjAuMH19LCJjcm91Y2hpbmciOnsiYW50aWJydXRlIjp0cnVlLCJib2R5X3lhdyI6Im5vcm1hbCIsImRlZmVuc2l2ZV9oYW5kbGVyIjp0cnVlLCJqaXR0ZXIiOiJzYW55YSIsImxpbWl0Ijo2MS4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUiOjYwLjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZTIiOjYwLjAsInRpY2tfc3BlZWRfMSI6MTQuMCwidGlja19zcGVlZF8yIjoxNi4wLCJ5YXdfYmFzZSI6ImF0IHRhcmdldCIsInlhd19sZWZ0IjotMjIuMCwieWF3X3JpZ2h0IjozOC4wLCJ+ZGVmZW5zaXZlX2hhbmRsZXIiOnsibWF4X2Nob2tlIjoxMi4wLCJtZXRob2QiOiJuZXZlcmxvc2UiLCJtaW5fY2hva2UiOjEyLjB9LCJ+aml0dGVyIjp7ImNoZWF0X3ByZXNldCI6Im5ldmVybG9zZSIsImRlbGF5X29wdGlvbnMiOiJhbGdvcml0aG0iLCJkZWxheV90eXBlIjoicmFuZG9tIiwiZGl2aWRlciI6MTMuMCwiZml4ZWRfZ2FtZXNlbnNlIjo4LjAsImZpeGVkX25ldmVybG9zZSI6OC4wLCJqaXR0ZXJfdmFsdWUiOjEyLjAsIm1heF9nYW1lc2Vuc2UiOjEyLjAsIm1heF9uZXZlcmxvc2UiOjguMCwibWluX2dhbWVzZW5zZSI6NC4wLCJtaW5fbmV2ZXJsb3NlIjo3LjAsIm5vcm1hbF9maXhlZCI6OC4wLCJub3JtYWxfbWF4IjoxMi4wLCJub3JtYWxfbWluIjo0LjB9LCJ+eWF3X2Jhc2UiOnsicmFuZG9taXplciI6MC4wfX0sImp1bXBpbmciOnsiYW50aWJydXRlIjp0cnVlLCJib2R5X3lhdyI6Im5vcm1hbCIsImRlZmVuc2l2ZV9oYW5kbGVyIjp0cnVlLCJqaXR0ZXIiOiJvZmZzZXQiLCJsaW1pdCI6NjEuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlIjo2MC4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUyIjo2MC4wLCJ0aWNrX3NwZWVkXzEiOjguMCwidGlja19zcGVlZF8yIjoxMC4wLCJ5YXdfYmFzZSI6ImF0IHRhcmdldCIsInlhd19sZWZ0IjotMTUuMCwieWF3X3JpZ2h0IjozNS4wLCJ+ZGVmZW5zaXZlX2hhbmRsZXIiOnsibWF4X2Nob2tlIjoxMi4wLCJtZXRob2QiOiJuZXZlcmxvc2UiLCJtaW5fY2hva2UiOjEyLjB9LCJ+aml0dGVyIjp7ImNoZWF0X3ByZXNldCI6ImdhbWVzZW5zZSIsImRlbGF5X29wdGlvbnMiOiJub3JtYWwiLCJkZWxheV90eXBlIjoicmFuZG9tIiwiZGl2aWRlciI6MTQuMCwiZml4ZWRfZ2FtZXNlbnNlIjo4LjAsImZpeGVkX25ldmVybG9zZSI6OC4wLCJqaXR0ZXJfdmFsdWUiOjAuMCwibWF4X2dhbWVzZW5zZSI6MTIuMCwibWF4X25ldmVybG9zZSI6MTIuMCwibWluX2dhbWVzZW5zZSI6NC4wLCJtaW5fbmV2ZXJsb3NlIjo0LjAsIm5vcm1hbF9maXhlZCI6OC4wLCJub3JtYWxfbWF4Ijo2LjAsIm5vcm1hbF9taW4iOjYuMH0sIn55YXdfYmFzZSI6eyJyYW5kb21pemVyIjowLjB9fSwicnVubmluZyI6eyJhbnRpYnJ1dGUiOnRydWUsImJvZHlfeWF3Ijoibm9ybWFsIiwiZGVmZW5zaXZlX2hhbmRsZXIiOmZhbHNlLCJqaXR0ZXIiOiJzYW55YSIsImxpbWl0Ijo2MS4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUiOjU4LjAsInJhbmRvbWl6ZV9saW1pdF92YWx1ZTIiOjYwLjAsInRpY2tfc3BlZWRfMSI6MTAuMCwidGlja19zcGVlZF8yIjoxNi4wLCJ5YXdfYmFzZSI6ImF0IHRhcmdldCIsInlhd19sZWZ0IjotMjYuMCwieWF3X3JpZ2h0IjozMy4wLCJ+ZGVmZW5zaXZlX2hhbmRsZXIiOnsibWF4X2Nob2tlIjoxMi4wLCJtZXRob2QiOiJuZXZlcmxvc2UiLCJtaW5fY2hva2UiOjEyLjB9LCJ+aml0dGVyIjp7ImNoZWF0X3ByZXNldCI6Im5ldmVybG9zZSIsImRlbGF5X29wdGlvbnMiOiJhbGdvcml0aG0iLCJkZWxheV90eXBlIjoicmFuZG9tIiwiZGl2aWRlciI6MTQuMCwiZml4ZWRfZ2FtZXNlbnNlIjo4LjAsImZpeGVkX25ldmVybG9zZSI6OC4wLCJqaXR0ZXJfdmFsdWUiOjIyLjAsIm1heF9nYW1lc2Vuc2UiOjEyLjAsIm1heF9uZXZlcmxvc2UiOjcuMCwibWluX2dhbWVzZW5zZSI6Ny4wLCJtaW5fbmV2ZXJsb3NlIjo2LjAsIm5vcm1hbF9maXhlZCI6OC4wLCJub3JtYWxfbWF4Ijo5LjAsIm5vcm1hbF9taW4iOjguMH0sIn55YXdfYmFzZSI6eyJyYW5kb21pemVyIjo0LjB9fSwic3RhbmRpbmciOnsiYW50aWJydXRlIjp0cnVlLCJib2R5X3lhdyI6Im5vcm1hbCIsImRlZmVuc2l2ZV9oYW5kbGVyIjpmYWxzZSwiaml0dGVyIjoic2FueWEiLCJsaW1pdCI6NjEuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlIjo2MC4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUyIjo2MC4wLCJ0aWNrX3NwZWVkXzEiOjEyLjAsInRpY2tfc3BlZWRfMiI6MTUuMCwieWF3X2Jhc2UiOiJhdCB0YXJnZXQiLCJ5YXdfbGVmdCI6LTIyLjAsInlhd19yaWdodCI6MzQuMCwifmRlZmVuc2l2ZV9oYW5kbGVyIjp7Im1heF9jaG9rZSI6MTIuMCwibWV0aG9kIjoibmV2ZXJsb3NlIiwibWluX2Nob2tlIjoxMi4wfSwifmppdHRlciI6eyJjaGVhdF9wcmVzZXQiOiJuZXZlcmxvc2UiLCJkZWxheV9vcHRpb25zIjoiYWxnb3JpdGhtIiwiZGVsYXlfdHlwZSI6InJhbmRvbSIsImRpdmlkZXIiOjE0LjAsImZpeGVkX2dhbWVzZW5zZSI6MTMuMCwiZml4ZWRfbmV2ZXJsb3NlIjo4LjAsImppdHRlcl92YWx1ZSI6MTQuMCwibWF4X2dhbWVzZW5zZSI6MTEuMCwibWF4X25ldmVybG9zZSI6MTAuMCwibWluX2dhbWVzZW5zZSI6OC4wLCJtaW5fbmV2ZXJsb3NlIjo3LjAsIm5vcm1hbF9maXhlZCI6OC4wLCJub3JtYWxfbWF4IjoxMi4wLCJub3JtYWxfbWluIjo0LjB9LCJ+eWF3X2Jhc2UiOnsicmFuZG9taXplciI6MC4wfX0sIndhbGtpbmciOnsiYW50aWJydXRlIjp0cnVlLCJib2R5X3lhdyI6Im5vcm1hbCIsImRlZmVuc2l2ZV9oYW5kbGVyIjpmYWxzZSwiaml0dGVyIjoic2FueWEiLCJsaW1pdCI6NjEuMCwicmFuZG9taXplX2xpbWl0X3ZhbHVlIjo1OC4wLCJyYW5kb21pemVfbGltaXRfdmFsdWUyIjo2MC4wLCJ0aWNrX3NwZWVkXzEiOjguMCwidGlja19zcGVlZF8yIjo4LjAsInlhd19iYXNlIjoiYXQgdGFyZ2V0IiwieWF3X2xlZnQiOi0yNi4wLCJ5YXdfcmlnaHQiOjMwLjAsIn5kZWZlbnNpdmVfaGFuZGxlciI6eyJtYXhfY2hva2UiOjEyLjAsIm1ldGhvZCI6Im5ldmVybG9zZSIsIm1pbl9jaG9rZSI6MTIuMH0sIn5qaXR0ZXIiOnsiY2hlYXRfcHJlc2V0IjoiZ2FtZXNlbnNlIiwiZGVsYXlfb3B0aW9ucyI6ImFsZ29yaXRobSIsImRlbGF5X3R5cGUiOiJyYW5kb20iLCJkaXZpZGVyIjoxNC4wLCJmaXhlZF9nYW1lc2Vuc2UiOjguMCwiZml4ZWRfbmV2ZXJsb3NlIjo4LjAsImppdHRlcl92YWx1ZSI6MjIuMCwibWF4X2dhbWVzZW5zZSI6MTIuMCwibWF4X25ldmVybG9zZSI6MTIuMCwibWluX2dhbWVzZW5zZSI6NC4wLCJtaW5fbmV2ZXJsb3NlIjo0LjAsIm5vcm1hbF9maXhlZCI6OC4wLCJub3JtYWxfbWF4IjoxMS4wLCJub3JtYWxfbWluIjo4LjB9LCJ+eWF3X2Jhc2UiOnsicmFuZG9taXplciI6NC4wfX19LCJ2aWV3bW9kZWwiOnRydWUsIn5hc3BlY3RfcmF0aW8iOnsiYW1vdW50IjoxMzMuMH0sIn5jdXN0b21zY29wZSI6eyJnYXAiOjYuMCwibGluZSI6NDEuMCwicm90YXRlIjpmYWxzZX0sIn5ub3RpZmljYXRpb25zIjp7ImFudGlicnV0ZSI6ZmFsc2UsImhpdGxvZ3MiOmZhbHNlLCJwdXJjaGFzZXMiOmZhbHNlfSwifnZpZXdtb2RlbCI6eyJmb3YiOjY0Mi4wLCJ4IjoxMS4wLCJ5IjoyNS4wLCJ6IjoyNS4wfX1d"
    }, 
    display_name_map = {}, 
    persist_data = function(_, v61, v62)
        if not v62 or type(v61) ~= "string" then
            return false;
        else
            return files.write(v61, json.stringify(v62));
        end;
    end, 
    retrieve_data = function(_, v64)
        local v65 = files.read(v64);
        return v65 and json.parse(v65) or {};
    end, 
    select_current_config = function(v66)
        local v67 = v66.data.menu.list();
        local v68 = 1;
        for v69 in pairs(v66.default_configs) do
            if v67 == v68 or v67 == 0 then
                return v66.data.menu.name(v69);
            else
                v68 = v68 + 1;
            end;
        end;
        if next(v66.storage) ~= nil then
            if v67 == v68 then
                return nil;
            else
                v68 = v68 + 1;
            end;
        end;
        for v70 in pairs(v66.storage) do
            if v67 == v68 then
                return v66.data.menu.name(v70);
            else
                v68 = v68 + 1;
            end;
        end;
        return nil;
    end, 
    refresh_ui = function(v71)
        local v72 = {};
        v71.display_name_map = {};
        for v73 in pairs(v71.default_configs) do
            local v74 = "\a" .. ui.get_style()["Link Active"]:to_hex() .. "\226\128\162  \aDEFAULT" .. v73;
            table.insert(v72, v74);
            v71.display_name_map[v74] = v73;
        end;
        if next(v71.storage) ~= nil then
            table.insert(v72, "\a" .. ui.get_style()["Link Active"]:to_hex() .. "---------------------");
        end;
        for v75 in pairs(v71.storage) do
            table.insert(v72, v75);
            v71.display_name_map[v75] = v75;
        end;
        v71.data.menu.list:update(v72);
        v71:persist_data(v71.config_file, v71.storage);
        v71:select_current_config();
        return v71;
    end, 
    initialize = function(v76)
        v76.storage = v76:retrieve_data(v76.config_file) or {};
        v76:refresh_ui();
        return v76;
    end, 
    encode = function(_, v78)
        -- upvalues: l_base64_0 (ref)
        return l_base64_0.encode(json.stringify(v78));
    end, 
    decode = function(_, v80)
        -- upvalues: l_base64_0 (ref)
        return json.parse(l_base64_0.decode(v80));
    end, 
    export_config = function(v81)
        -- upvalues: v5 (ref)
        return v81:encode((v5.setup({
            [1] = v81.data.menu
        }, true):save()));
    end, 
    export = function(v82, v83, ...)
        local v84 = "export_" .. v83;
        if not v82[v84] then
            return nil, "Invalid export type";
        else
            local l_status_0, l_result_0 = pcall(v82[v84], v82, ...);
            if not l_status_0 then
                print("Export error:", l_result_0);
                return nil;
            else
                return "{ambani:" .. v83 .. "}:" .. l_result_0;
            end;
        end;
    end, 
    import_config = function(v87, v88)
        -- upvalues: v5 (ref)
        local v89 = v87:decode(v88);
        v5.setup({
            [1] = v87.data.menu
        }, true):load(v89);
    end, 
    validate_import = function(_, v91, v92)
        local v93 = v91:match("{ambani:(.+)}");
        return v93 and v93 == v92;
    end, 
    import = function(v94, v95, v96, ...)
        if not v94:validate_import(v95, v96) then
            return error("This is not valid ambani data. 1");
        else
            local v97 = v95:gsub("{ambani:" .. v96 .. "}:", "");
            local v98 = "import_" .. v96;
            local l_status_1, l_result_1 = pcall(v94[v98], v94, v97, ...);
            if not l_status_1 then
                print(l_result_1);
                return error("This is not valid ambani data. 2");
            else
                return true;
            end;
        end;
    end, 
    save = function(v101)
        local v102 = v101.data.menu.name();
        if not v102:match("%w") then
            return print("Invalid config name");
        elseif v101.default_configs[v102] then
            return print("Cannot overwrite default config: " .. v102);
        else
            local v103 = v101:export("config");
            v101.storage[v102] = v103;
            v101:refresh_ui();
            return true;
        end;
    end, 
    load = function(v104)
        local v105 = v104.data.menu.name();
        local v106 = v104.storage[v105] or v104.default_configs[v105];
        if not v106 then
            return print("Invalid config name");
        else
            return v104:import(v106, "config");
        end;
    end, 
    delete = function(v107)
        local v108 = v107.data.menu.name();
        if v107.default_configs[v108] then
            return print("Cannot delete default config: " .. v108);
        elseif not v107.storage[v108] then
            return print("Invalid config name");
        else
            v107.storage[v108] = nil;
            v107:refresh_ui();
            return true;
        end;
    end
}):struct("helpers")({
    last_tick = 0, 
    last_cheat = "neverlose", 
    last_message_time = 0, 
    active_messages = {}, 
    contains = function(_, v110, v111)
        for _, v113 in pairs(v110) do
            if v113 == v111 then
                return true;
            end;
        end;
        return false;
    end, 
    easeInOut = function(_, v115)
        return v115 > 0.5 and 4 * (v115 - 1) ^ 3 + 1 or 4 * v115 ^ 3;
    end, 
    clamp = function(_, v117, v118, v119)
        assert(v117 and v118 and v119, "not very useful error message here");
        if v119 < v118 then
            local l_v119_0 = v119;
            v119 = v118;
            v118 = l_v119_0;
        end;
        return math.max(v118, math.min(v119, v117));
    end, 
    in_air = function(_, v122)
        local l_m_fFlags_0 = v122.m_fFlags;
        return bit.band(l_m_fFlags_0, 1) == 0;
    end, 
    in_duck = function(_, v125)
        local l_m_fFlags_1 = v125.m_fFlags;
        return bit.band(l_m_fFlags_1, 4) == 4;
    end, 
    get_state = function(v127)
        local v128 = entity.get_local_player();
        local v129 = v128.m_vecVelocity:length2d();
        if v127:in_air(v128) or v127.antiaim.state.air then
            return v127:in_duck(v128) and "crouch jumping" or "jumping";
        elseif v129 > 3 and (v127:in_duck(v128) or v127.ref.rage.fd:get()) then
            return "crouch moving";
        elseif v127.ref.antiaim.slowwalk:get() then
            return "walking";
        elseif v127:in_duck(v128) or v127.ref.rage.fd:get() then
            return "crouching";
        else
            return v129 > 1.5 and "running" or "standing";
        end;
    end, 
    vec_closest_point_on_ray = function(_, v131, v132, v133)
        local v134 = v131 - v132;
        local v135 = v133 - v132;
        local v136 = #v135;
        v135.x = v135.x / v136;
        v135.y = v135.y / v136;
        v135.z = v135.z / v136;
        local v137 = v135.x * v134.x + v135.y * v134.y + v135.z * v134.z;
        if v137 < 0 then
            return v132;
        elseif v136 < v137 then
            return v133;
        else
            return vector(v132.x + v135.x * v137, v132.y + v135.y * v137, v132.z + v135.z * v137);
        end;
    end, 
    bullet_impact = function(v138, v139, v140, v141)
        v138.distance = v138:vec_closest_point_on_ray(v139, v140, v141):dist(v139);
        if v138.distance > 55 then
            return;
        else
            v138.tick_work = globals.tickcount;
            return;
        end;
    end, 
    add_notification = function(v142, v143)
        if #v142.active_messages >= 5 then
            table.remove(v142.active_messages, 1);
        end;
        table.insert(v142.active_messages, {
            text = v143, 
            start_time = globals.realtime, 
            expire_time = globals.realtime + 5
        });
        v142.last_message_time = globals.realtime;
    end, 
    extract_hex_colors = function(_, v145)
        local v146 = {};
        local v147 = 1;
        local v148 = "FFFFFF";
        for v149, v150, v151 in v145:gmatch("()%\a([A-Fa-f0-9]+)()") do
            if v150:upper() ~= "FFFFFFFF" then
                if v147 < v149 then
                    table.insert(v146, {
                        color = v148, 
                        text = v145:sub(v147, v149 - 1)
                    });
                end;
                v148 = v150;
                v147 = v151;
            end;
        end;
        if v147 <= #v145 then
            table.insert(v146, {
                color = v148, 
                text = v145:sub(v147)
            });
        end;
        return v146;
    end, 
    render_notifications = function(v152)
        if not globals.is_in_game or #v152.active_messages == 0 then
            return;
        else
            local l_realtime_0 = globals.realtime;
            local v154 = render.screen_size();
            local v155 = v154.x / 2;
            local v156 = v154.y / 1.2 - #v152.active_messages * 10;
            for v157 = #v152.active_messages, 1, -1 do
                if v152.active_messages[v157].expire_time < l_realtime_0 then
                    table.remove(v152.active_messages, v157);
                end;
            end;
            for v158, v159 in ipairs(v152.active_messages) do
                local v160 = 0.5;
                local v161 = 1;
                local v162 = l_realtime_0 - v159.start_time;
                local v163 = v159.expire_time - l_realtime_0;
                local l_text_0 = v159.text;
                local l_x_0 = render.measure_text(1, "c", l_text_0).x;
                local l_l_x_0_0 = l_x_0;
                local v167 = 255;
                local v168 = 0;
                if v162 < v160 then
                    local v169 = v162 / v160;
                    local v170 = 1 - (1 - v169) * (1 - v169);
                    v167 = math.floor(255 * v170);
                    v168 = (1 - v170) * 10;
                elseif v163 < v161 then
                    local v171 = v163 / v161;
                    local v172 = v171 * v171;
                    v167 = math.floor(255 * v172);
                    v168 = (1 - v172) * 10;
                end;
                if v162 < v160 then
                    local v173 = v162 / v160;
                    l_l_x_0_0 = l_x_0 * (1 - (1 - v173) * (1 - v173));
                elseif v163 < v161 then
                    local v174 = v163 / v161;
                    l_l_x_0_0 = l_x_0 * (v174 * v174);
                end;
                local v175 = v156 + (v158 - 1) * 34 + v168;
                local v176 = v155 - l_l_x_0_0 / 2 - 6;
                local v177 = v155 + l_l_x_0_0 / 2 + 6;
                local v178 = v152:extract_hex_colors(v159.text);
                local _ = 6;
                local v180 = color(v178[1].color);
                local v181 = color(v180.r, v180.g, v180.b, v180.a * (v167 / 255));
                local _ = 1;
                render.shadow(vector(v176, v175 - 9), vector(v177 - 3, v175 + 11), v181, 15, 1, 5);
                render.blur(vector(v176, v175 - 10), vector(v177 - 1, v175 + 13), 7, 1, 1);
                render.shadow(vector(v176 + 19, v175 - 10), vector(v176 + 19, v175 + 10), v181, 7, 1, 0);
                local v183 = 1;
                if v162 < v160 then
                    local v184 = v162 / v160;
                    v183 = 1 - (1 - v184) * (1 - v184 * 0.95);
                elseif v163 < v161 then
                    local v185 = v163 / v161;
                    v183 = v185 * v185;
                end;
                local v186 = l_x_0 * v183;
                local v187 = v155 - v186 / 2;
                local v188 = v155 + v186 / 2;
                local v189 = v175 - 12;
                local v190 = v175 + 16;
                render.push_clip_rect(vector(v187, v189), vector(v188, v190));
                render.text(1, vector(v155, v175 + 1), color(255, 255, 255, v167), "c", l_text_0);
                render.pop_clip_rect();
            end;
            return;
        end;
    end, 
    gradienttext = function(_, _, v193, v194, v195, v196, v197, v198, v199, v200, v201)
        local v202 = "";
        local v203 = globals.realtime / 2 % 1.2 * 2 - 1.2;
        for v204 = 0, #v193 do
            local v205 = v193:sub(v204, v204);
            local v206 = v204 / #v193;
            local l_v194_0 = v194;
            local l_v195_0 = v195;
            local l_v196_0 = v196;
            local l_v197_0 = v197;
            local v211 = v206 - v203;
            if v211 >= 0 and v211 <= 1.4 then
                if v211 > 0.7 then
                    v211 = 1.4 - v211;
                end;
                local v212 = v198 - l_v194_0;
                local v213 = v199 - l_v195_0;
                local v214 = v200 - l_v196_0;
                local v215 = v201 - l_v197_0;
                l_v194_0 = l_v194_0 + v212 * v211 / 0.8;
                l_v195_0 = l_v195_0 + v213 * v211 / 0.8;
                l_v196_0 = l_v196_0 + v214 * v211 / 0.8;
                l_v197_0 = l_v197_0 + v215 * v211 / 0.8;
            end;
            v202 = v202 .. "\a" .. color(l_v194_0, l_v195_0, l_v196_0, l_v197_0):to_hex() .. v205;
        end;
        return v202;
    end, 
    get_team = function(_)
        return entity.get_local_player().m_iTeamNum == 2 and "terrorist" or "counter-terrorist";
    end, 
    get_charge = function()
        local _ = entity.get_local_player();
        local l_m_flSimulationTime_0 = entity.get_local_player().m_flSimulationTime;
        return globals.tickcount - l_m_flSimulationTime_0 / globals.tickinterval;
    end, 
    normalize = function(_, v220)
        v220 = (v220 % 360 + 360) % 360;
        if v220 > 180 then
            v220 = v220 - 360;
        end;
        return v220;
    end, 
    detection = function(v221)
        -- upvalues: v6 (ref)
        local l_tickcount_0 = globals.tickcount;
        local v223 = entity.get_threat();
        v221.last_tick = l_tickcount_0;
        v221.last_threat = v223;
        local v224 = v6.get_software(v223);
        local v225 = v224 and tostring(v224.signature) or nil;
        if v225 == "GS" then
            v221.last_cheat = "gamesense";
        elseif v225 == "NL" then
            v221.last_cheat = "neverlose";
        else
            v221.last_cheat = "neverlose";
        end;
        return v221.last_cheat;
    end
}):struct("antiaim")({
    state = {
        counter2 = 0, 
        defensive_after = 0, 
        last_simtime = 0, 
        defensive_state = false, 
        activation_delay = 0, 
        current_safe_yaw = 0, 
        yaw_hold_ticks = 0, 
        current_slider = 1, 
        counter = 0, 
        round_ended = false, 
        last_rand = 0, 
        inverter_override_ticks = 0, 
        body_yaw_false_ticks = 0, 
        defensive_switch = false, 
        body_yaw_switch = false, 
        body_yaw_side = 0, 
        side = 0, 
        body_yaw_switch_delay = 0, 
        modifier_switch_delay = 0, 
        switch_delay = 0, 
        hold_delay = 0, 
        hold_time = 0, 
        was_defensive_last_tick = false, 
        in_air = false, 
        spam_fd_state = false, 
        spam_fd_tick = 0, 
        want_fd_true = false, 
        force_side = 0, 
        landed = globals.tickcount, 
        ab = {
            bruted_last_time = 0, 
            jitteralgo = 0, 
            stage = 0, 
            should_swap = {}, 
            time = {}, 
            fakelimit = {}, 
            delay = {}
        }
    }, 
    run = function(v226, v227)
        v226:apply_anti_aim(v227);
    end, 
    airlag = function(_, v229)
        if not entity.get_local_player():is_alive() or not globals.is_in_game then
            return;
        else
            if globals.tickcount % 10 == 0 then
                v229.force_defensive = true;
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override(math.random(10));
                rage.exploit:force_teleport();
                rage.exploit:allow_charge(false);
            else
                rage.exploit:allow_charge(true);
                rage.exploit:force_charge();
            end;
            return;
        end;
    end, 
    apply_anti_aim = function(v230, v231, _)
        if not entity.get_local_player():is_alive() or not globals.is_in_game then
            return;
        else
            v230.state.in_air = v231.in_jump;
            if v230.data.airlag:get() then
                v230:airlag(v231);
            end;
            local v233 = v230.helpers:get_state();
            local v234 = v230.helpers:get_team();
            local v235 = v230.data.menu[v234][v233];
            if v230:handle_special_modes(v235) then
                return;
            else
                if entity.get_game_rules().m_bFreezePeriod and v230.ref.rage.fd:get() and v230.data.menu.freezetime_fakeduck:get() then
                    if v230.ref.rage.dt:get() then
                        v230.ref.rage.dt:override(false);
                    else
                        v230.ref.rage.dt:override();
                    end;
                    if v230.ref.rage.hs:get() then
                        v230.ref.rage.hs:override(false);
                    else
                        v230.ref.rage.hs:override();
                    end;
                    if globals.choked_commands >= 7 then
                        v231.send_packet = false;
                        v231.in_duck = true;
                    else
                        v231.send_packet = false;
                        v231.in_duck = false;
                    end;
                else
                    v230.ref.rage.hs:override();
                    v230.ref.rage.dt:override();
                end;
                v230:handle_side_switching(v231, v235);
                local v236, _ = v230:calculate_offsets(v235);
                v230.ref.antiaim.inverter:override(v230.state.side == 0);
                v230.ref.antiaim.yawoffset:override(v236);
                if v235.limit:get() == 61 then
                    v230.ref.antiaim.leftfake:override(utils.random_int(v235.randomize_limit_value:get(), v235.randomize_limit_value2:get()));
                    v230.ref.antiaim.rightfake:override(utils.random_int(v235.randomize_limit_value:get(), v235.randomize_limit_value2:get()));
                else
                    v230.ref.antiaim.leftfake:override(v235.limit:get());
                    v230.ref.antiaim.rightfake:override(v235.limit:get());
                end;
                v230.ref.antiaim.bodyyawopt:override({});
                if v235.body_yaw:get() == "tick" then
                    local v238 = math.random(1, 8);
                    if globals.tickcount % math.random(v235.tick_speed_1:get(), v235.tick_speed_2:get()) == 0 then
                        v230.state.body_yaw_switch = not v230.state.body_yaw_switch;
                        v230.state.body_yaw_false_ticks = 0;
                    end;
                    if not v230.state.body_yaw_switch then
                        v230.state.body_yaw_false_ticks = v230.state.body_yaw_false_ticks + 1;
                    end;
                    if v230.state.body_yaw_switch then
                        v230.state.inverter_override_ticks = v230.state.inverter_override_ticks + 1;
                    end;
                    if v230.state.body_yaw_false_ticks >= math.random(2, 5) then
                        v230.state.body_yaw_switch = true;
                        v230.state.body_yaw_false_ticks = 0;
                    end;
                    v238 = (not (v238 ~= 1) or v238 == 2) and 9 or v238 + 1;
                    if v230.state.body_yaw_switch and v230.state.inverter_override_ticks < math.random(5, 9) and v230.state.inverter_override_ticks > 4 then
                        v230.ref.antiaim.inverter:override(v231.command_number % v238 == 0);
                        v230.state.inverter_override_ticks = 0;
                    end;
                    v230.ref.antiaim.bodyyaw:override(v230.state.body_yaw_switch);
                elseif v235.body_yaw:get() == "beast" then
                    local v239 = v230.state.side == 0;
                    if v230.state.counter2 % math.random(6, 8) == 0 then
                        v239 = not v239;
                    end;
                    v230.ref.antiaim.inverter:override(v239);
                    v230.ref.antiaim.bodyyaw:override(true);
                else
                    v230.ref.antiaim.bodyyaw:override(true);
                end;
                if v235.defensive_handler:get() and v235.defensive_handler.method:get() == "neverlose" then
                    local v240 = entity.get_local_player():get_player_weapon();
                    if v240 ~= nil then
                        v230.ref.rage.dtlag:override("disabled");
                        if math.max(v240.m_flNextPrimaryAttack, entity.get_local_player().m_flNextAttack) - globals.tickinterval - globals.curtime < 0 or entity.get_local_player().m_flNextAttack > globals.curtime and not v240:get_classname():find("Grenade") then
                            v230.ref.rage.dtlag:override("always on");
                        else
                            v230.ref.rage.dtlag:override("disabled");
                        end;
                    end;
                elseif v235.defensive_handler:get() and v235.defensive_handler.method:get() ~= "neverlose" then
                    local v241 = entity.get_local_player():get_player_weapon();
                    if v241 ~= nil then
                        v230.ref.rage.dtlag:override("on peek");
                        if math.max(v241.m_flNextPrimaryAttack, entity.get_local_player().m_flNextAttack) - globals.tickinterval - globals.curtime < 0 or entity.get_local_player().m_flNextAttack > globals.curtime and not v241:get_classname():find("Grenade") then
                            local v242 = math.random(v235.defensive_handler.min_choke:get(), v235.defensive_handler.max_choke:get());
                            v231.force_defensive = v231.command_number % v242 == 0;
                        else
                            v231.force_defensive = false;
                        end;
                    end;
                end;
                v230.ref.antiaim.enable:override(true);
                v230.ref.antiaim.pitch:override("down");
                v230.ref.antiaim.yawtarget:override("At Target");
                v230.ref.antiaim.yaw:override("Backward");
                v230:handle_safehead();
                v230:handle_manual_aa();
                v230:handle_freestanding();
                return;
            end;
        end;
    end, 
    get_algorithmic_delay = function(_, _, v245)
        if not entity.get_local_player() then
            return 14;
        else
            local v246 = utils.net_channel();
            return (globals.server_tick + v246.avg_latency[0] + v246.avg_latency[1]) % v245;
        end;
    end, 
    reset_antibruteforce = function(v247)
        v247.state.ab.bruted_last_time = 0;
        v247.state.ab.time = {};
        v247.state.ab.jitteralgo = 0;
        v247.state.ab.delay = {};
        v247.state.ab.fakelimit = {};
        v247.state.ab.should_swap = {};
    end, 
    shot_detection = function(v248, v249)
        if tick_work == globals.tickcount then
            return;
        elseif not globals.is_connected then
            return;
        else
            local v250 = entity.get_local_player();
            if v250 == nil or not v250:is_alive() then
                return;
            elseif not v249 or not v249.userid then
                return;
            else
                local v251 = entity.get(v249.userid, true);
                if v251 == nil or not v251:is_alive() or not v251:is_enemy() then
                    return;
                elseif v251:is_dormant() then
                    return;
                elseif math.abs(v248.state.ab.bruted_last_time - globals.curtime) <= 0.25 then
                    return;
                elseif globals.tickcount == v248.tickcount then
                    return;
                else
                    local v252 = v250:simulate_movement();
                    v252:think(1);
                    local v253 = v251:get_eye_position();
                    local v254 = v252.origin:closest_ray_point(v253, vector(v249.x, v249.y, v249.z)):dist(v252.origin);
                    if v254 > 45 then
                        return;
                    else
                        local _ = v250.m_flPoseParameter[11] * 120 - 60 > 0;
                        v248.state.ab.stage = v248.state.ab.stage >= 11 and 0 or v248.state.ab.stage + 1;
                        v248.state.ab.bruted_last_time = globals.curtime;
                        v248.state.ab.time[v251] = globals.curtime + 5;
                        v248.state.ab.jitteralgo = v248.state.ab.stage * 2 * (v250.m_flPoseParameter[11] * 120 - 60 > 0 and -1 or 1);
                        v248.state.ab.delay[v251] = math.random(-2, 4);
                        v248.state.ab.fakelimit[v251] = math.random(10, 60);
                        v248.state.ab.should_swap[v251] = true;
                        if v248.data.menu.notifications.antibrute:get() then
                            v248.helpers:add_notification("\a9d8ad1ff" .. ui.get_icon("head-side-cough") .. "\affffffff  Anti-Bruteforce updated by ['\a9d8ad1ff" .. v251:get_name() .. "\affffffff's] shot [\a9d8ad1ff" .. v248.state.ab.jitteralgo .. "\affffffff\194\176;\a9d8ad1ff" .. math.floor(tostring(v254)) .. "\affffffff]");
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end, 
    handle_side_switching = function(v256, v257, v258)
        if v257.choked_commands ~= 0 then
            return;
        else
            v256.state.switch_delay = v256.state.switch_delay + 1;
            if v258.jitter.delay_options:get() == "cheat based" then
                local v259 = v256.helpers:detection();
                if v258.jitter.delay_type:get() == "fixed" then
                    if v256.state.switch_delay >= v258.jitter["fixed_" .. v259]:get() then
                        v256.state.switch_delay = 0;
                        v256.state.side = 1 - v256.state.side;
                    end;
                elseif v258.jitter.delay_type:get() == "random" and v256.state.switch_delay >= utils.random_int(v258.jitter["min_" .. v259]:get(), v258.jitter["max_" .. v259]:get()) then
                    v256.state.switch_delay = 0;
                    v256.state.side = 1 - v256.state.side;
                end;
            elseif v258.jitter.delay_options:get() == "algorithm" then
                local v260 = v256:get_algorithmic_delay(v257, v258.jitter.divider:get());
                local v261 = math.random(1.88, 1.95);
                if v256.state.switch_delay >= v260 / v261 then
                    v256.state.switch_delay = 0;
                    v256.state.side = 1 - v256.state.side;
                end;
            elseif v258.jitter.delay_type:get() == "fixed" then
                if v256.state.switch_delay >= v258.jitter.normal_fixed:get() then
                    v256.state.switch_delay = 0;
                    v256.state.side = 1 - v256.state.side;
                end;
            elseif v258.jitter.delay_type:get() == "random" and v256.state.switch_delay >= utils.random_int(v258.jitter.normal_min:get(), v258.jitter.normal_max:get()) then
                v256.state.switch_delay = 0;
                v256.state.side = 1 - v256.state.side;
            end;
            return;
        end;
    end, 
    calculate_offsets = function(v262, v263)
        local v264 = 0;
        local v265 = 0;
        if globals.choked_commands == 0 then
            v262.state.counter2 = v262.state.counter2 + 1;
        end;
        if v263.jitter:get() == "offset" then
            v262.ref.antiaim.yawmodifier:override("off");
            v262.ref.antiaim.yawmodifieramount:override(0);
            v264 = v264 + (v262.state.side == 1 and v263.jitter.jitter_value:get() or 0);
        elseif v263.jitter:get() == "center" then
            v262.ref.antiaim.yawmodifier:override("off");
            v262.ref.antiaim.yawmodifieramount:override(0);
            v264 = v264 + (v262.state.side == 1 and v263.jitter.jitter_value:get() / 2 or -v263.jitter.jitter_value:get() / 2);
        elseif v263.jitter:get() == "random" then
            v262.ref.antiaim.yawmodifier:override("off");
            v262.ref.antiaim.yawmodifieramount:override(0);
            local v266 = math.random(0, v263.jitter.jitter_value:get()) - v263.jitter.jitter_value:get() / 1.5;
            v264 = v264 + v266;
            v262.state.last_rand = v266;
        elseif v263.jitter:get() == "sanya" then
            local v267 = {
                [1] = "Spin", 
                [2] = "Random", 
                [3] = "3-Way", 
                [4] = "Spin", 
                [5] = "3-Way", 
                [6] = "Offset", 
                [7] = "Spin", 
                [8] = "Spin"
            };
            v262.ref.antiaim.yawmodifier:visibility(false);
            if not v262.state.yaw_cycle or #v262.state.yaw_cycle == 0 then
                v262.state.yaw_cycle = {};
                for _, v269 in ipairs(v267) do
                    table.insert(v262.state.yaw_cycle, v269);
                end;
                for v270 = #v262.state.yaw_cycle, 2, -1 do
                    local v271 = math.random(v270);
                    local l_yaw_cycle_0 = v262.state.yaw_cycle;
                    local l_yaw_cycle_1 = v262.state.yaw_cycle;
                    local v274 = v262.state.yaw_cycle[v271];
                    l_yaw_cycle_1[v271] = v262.state.yaw_cycle[v270];
                    l_yaw_cycle_0[v270] = v274;
                end;
            end;
            if not v262.state.yaw_hold_ticks or v262.state.yaw_hold_ticks <= 0 then
                v262.state.current_yaw = table.remove(v262.state.yaw_cycle, 1);
                if #v262.state.yaw_cycle == 0 then
                    for _, v276 in ipairs(v267) do
                        table.insert(v262.state.yaw_cycle, v276);
                    end;
                    for v277 = #v262.state.yaw_cycle, 2, -1 do
                        local v278 = math.random(v277);
                        local l_yaw_cycle_2 = v262.state.yaw_cycle;
                        local l_yaw_cycle_3 = v262.state.yaw_cycle;
                        local v281 = v262.state.yaw_cycle[v278];
                        l_yaw_cycle_3[v278] = v262.state.yaw_cycle[v277];
                        l_yaw_cycle_2[v277] = v281;
                    end;
                end;
                v262.state.yaw_hold_ticks = math.random(1, 5);
            end;
            v262.ref.antiaim.yawmodifier:override(v262.state.current_yaw);
            v262.state.yaw_hold_ticks = v262.state.yaw_hold_ticks - 1;
            v262.ref.antiaim.yawmodifieramount:override(v263.jitter.jitter_value:get() + math.random(-1, 1) or v263.jitter.jitter_value:get());
            v264 = v264 + (v262.state.side == 1 and v263.jitter.jitter_value:get() / math.random(15, 20) or -v263.jitter.jitter_value:get() / math.random(15, 20));
        elseif v263.jitter:get() == "spin" then
            v262.ref.antiaim.yawmodifier:override("spin");
            v262.ref.antiaim.yawmodifieramount:override(v263.jitter.jitter_value:get());
        else
            v262.ref.antiaim.yawmodifier:override("off");
            v262.ref.antiaim.yawmodifieramount:override(0);
        end;
        local v282 = utils.random_int(-v263.yaw_base.randomizer:get(), v263.yaw_base.randomizer:get());
        if math.abs(v262.state.ab.bruted_last_time - globals.curtime) > 4.5 or not v263.antibrute:get() then
            v262.state.ab.jitteralgo = 0;
        end;
        if v263.antibrute:get() then
            v264 = v264 + (v262.state.side == 0 and v263.yaw_left.value + v282 or v263.yaw_right.value - v282) + v262.state.ab.jitteralgo;
        else
            v264 = v264 + (v262.state.side == 0 and v263.yaw_left.value + v282 or v263.yaw_right.value - v282);
        end;
        if v263.fakelimit_options == "jitter" then
            v265 = v262.state.side == 0 and v263.fakelimit or v263.fakelimit / 2;
        elseif v263.fakelimit_options == "L&R" then
            v265 = v262.state.side == 0 and v263.fakelimit_l or v263.fakelimit_r;
        else
            v265 = v263.fakelimit;
        end;
        return v264, v265;
    end, 
    handle_special_modes = function(v283, _)
        if not entity.get_local_player() then
            return;
        else
            local v285 = entity.get_game_rules();
            if v283.helpers:contains(v283.data.addons:get(), "warmup aa") and v285 and v285.m_bWarmupPeriod then
                v283.ref.antiaim.pitch:override("Disabled");
                local v286 = globals.tickcount * 32 % 360;
                v283.ref.antiaim.yawoffset:override(v286);
                v283.ref.antiaim.leftfake:override(0);
                v283.ref.antiaim.rightfake:override(0);
                v283.ref.antiaim.bodyyaw:override(false);
                v283.ref.antiaim.inverter:override(false);
                v283.ref.antiaim.hidden:override(false);
                v283.ref.antiaim.yawmodifier:override("Offset");
                v283.ref.antiaim.yawmodifieramount:override(0);
                return true;
            elseif v283.state.round_ended and not entity.get_threat(true) and v283.helpers:contains(v283.data.addons:get(), "round end aa") and not v285.m_bWarmupPeriod then
                v283.ref.antiaim.pitch:override("Disabled");
                local v287 = globals.tickcount * 32 % 360;
                v283.ref.antiaim.yawoffset:override(v287);
                v283.ref.antiaim.leftfake:override(0);
                v283.ref.antiaim.rightfake:override(0);
                v283.ref.antiaim.inverter:override(false);
                v283.ref.antiaim.hidden:override(false);
                v283.ref.antiaim.bodyyaw:override(false);
                v283.ref.antiaim.yawmodifier:override("Offset");
                v283.ref.antiaim.yawmodifieramount:override(0);
                return true;
            else
                return false;
            end;
        end;
    end, 
    handle_manual_aa = function(v288)
        local v289 = v288.data.menu.manual:get();
        if v289 == "left" then
            v288.ref.antiaim.yawoffset:override(-90);
            v288.ref.antiaim.freestanding:override(false);
            v288.ref.antiaim.yawtarget:override("Local view");
        elseif v289 == "right" then
            v288.ref.antiaim.yawoffset:override(90);
            v288.ref.antiaim.freestanding:override(false);
            v288.ref.antiaim.yawtarget:override("Local view");
        elseif v289 == "forward" then
            v288.ref.antiaim.yawoffset:override(180);
            v288.ref.antiaim.freestanding:override(false);
            v288.ref.antiaim.yawtarget:override("Local view");
        end;
    end, 
    handle_freestanding = function(v290)
        local v291 = v290.helpers:get_state();
        if v290.data.freestanding:get() and not v290.helpers:contains(v290.data.freestanding.disablers:get(), v291) and v290.data.menu.manual:get() == "backward" then
            v290.ref.antiaim.freestanding:override(true);
            v290.ref.antiaim.yawoffset:override(5);
            v290.ref.antiaim.yawmodifier:override("Offset");
            v290.ref.antiaim.yawmodifieramount:override(0);
            v290.ref.antiaim.leftfake:override(60);
            v290.ref.antiaim.rightfake:override(60);
            v290.ref.antiaim.inverter:override(math.random(0, 1) == 0);
            v290.ref.antiaim.hidden:override(false);
        else
            v290.ref.antiaim.freestanding:override(false);
        end;
    end, 
    handle_safehead = function(v292)
        local v293 = entity.get_local_player():get_player_weapon();
        local v294 = "";
        if v293 ~= nil then
            v294 = v293:get_classname();
        end;
        if v292.helpers:contains(v292.data.addons:get(), "safe head") and (v294 == "CKnife" or v294 == "CWeaponTaser") then
            v292.ref.antiaim.yawoffset:override(0);
            v292.ref.antiaim.yawmodifier:override("Offset");
            v292.ref.antiaim.yawmodifieramount:override(0);
            v292.ref.antiaim.leftfake:override(0);
            v292.ref.antiaim.rightfake:override(0);
            v292.ref.antiaim.inverter:override(true);
            v292.ref.antiaim.hidden:override(false);
        end;
    end
}):struct("hitlogs")({
    hitgroup_str = {
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
    main = function(v295, v296)
        local _ = entity.get_local_player();
        local v298 = entity.get(v296.target);
        local l_damage_0 = v296.damage;
        local l_wanted_damage_0 = v296.wanted_damage;
        local v301 = v295.hitgroup_str[v296.wanted_hitgroup];
        local l_hitchance_0 = v296.hitchance;
        local l_state_0 = v296.state;
        local l_backtrack_0 = v296.backtrack;
        local v305 = v296.spread or 0;
        if not v298 then
            return;
        else
            local l_m_iHealth_0 = v298.m_iHealth;
            local v307 = v295.hitgroup_str[v296.hitgroup];
            local v308 = "708ee0ff";
            local v309 = "d65151ff";
            if l_state_0 == nil then
                local v310 = string.format("\a9994ffff" .. ui.get_icon("crosshairs") .. " \affffffff Hit \a9994ffff%s\affffffff in the \a9994ffff%s\affffffff for \a9994ffff%d\affffffff(%.f) damage (hp: \a9994ffff%d\affffffff) (bt: \a9994ffff%s\affffffff)", v298:get_name(), v307, l_damage_0, l_wanted_damage_0, l_m_iHealth_0, l_backtrack_0);
                print_dev(("\affffffff\a" .. v308 .. "ambani bita\affffffff Hit \a" .. v308 .. "%s\affffffff's \a" .. v308 .. "%s\affffffff for \a" .. v308 .. "%d\affffffff(%.f) damage (hp: %d) (bt: \a" .. v308 .. "%s\affffffff) (spread: \a" .. v308 .. "%.2f\194\176\affffffff)"):format(v298:get_name(), v307, l_damage_0, l_wanted_damage_0, l_m_iHealth_0, l_backtrack_0, v305));
                print_raw(("\affffffff\a" .. v308 .. "ambani bita\affffffff Hit \a" .. v308 .. "%s\affffffff's \a" .. v308 .. "%s\affffffff for \a" .. v308 .. "%d\affffffff(%.f) damage (hp: %d) (bt: \a" .. v308 .. "%s\affffffff) (spread: \a" .. v308 .. "%.2f\194\176\affffffff)"):format(v298:get_name(), v307, l_damage_0, l_wanted_damage_0, l_m_iHealth_0, l_backtrack_0, v305));
                if v295.data.menu.notifications.hitlogs:get() then
                    v295.helpers:add_notification(v310);
                end;
            else
                local v311 = string.format("\aff9494ff" .. ui.get_icon("circle-xmark") .. "  \affffffffMissed \aff9494ff%s\affffffff in the \aff9494ff%s\affffffff due to \aff9494ff%s\affffffff (hc: \aff9494ff%.f\affffffff) (damage: \aff9494ff%.f\affffffff) (bt: \aff9494ff%.f\affffffff)", v298:get_name(), v301, l_state_0, l_hitchance_0, l_wanted_damage_0, l_backtrack_0);
                print_dev(("\affffffff\a" .. v309 .. "ambani bita\affffffff Missed \a" .. v309 .. "%s\affffffff's \a" .. v309 .. "%s\affffffff due to \a" .. v309 .. "%s\affffffff (hc: \a" .. v309 .. "%.f\affffffff) (damage: \a" .. v309 .. "%.f\affffffff) (bt: \a" .. v309 .. "%.f\affffffff) (spread: \a" .. v309 .. "%.2f\194\176\affffffff)"):format(v298:get_name(), v301, l_state_0, l_hitchance_0, l_wanted_damage_0, l_backtrack_0, v305));
                print_raw(("\affffffff\a" .. v309 .. "ambani bita\affffffff Missed \a" .. v309 .. "%s\affffffff's \a" .. v309 .. "%s\affffffff due to \a" .. v309 .. "%s\affffffff (hc: \a" .. v309 .. "%.f\affffffff) (damage: \a" .. v309 .. "%.f\affffffff) (bt: \a" .. v309 .. "%.f\affffffff) (spread: \a" .. v309 .. "%.2f\194\176\affffffff)"):format(v298:get_name(), v301, l_state_0, l_hitchance_0, l_wanted_damage_0, l_backtrack_0, v305));
                if v295.data.menu.notifications.hitlogs:get() then
                    v295.helpers:add_notification(v311);
                end;
            end;
            return;
        end;
    end, 
    on_grenades = function(_, v313)
        local v314 = entity.get(v313.userid, true);
        local v315 = entity.get_local_player();
        if v315 == nil then
            return;
        elseif not v314:is_enemy() then
            return;
        else
            local v316 = entity.get(v313.attacker, true);
            local v317 = "708ee0ff";
            if v316 == v315 then
                if v313.weapon == "hegrenade" then
                    print_dev(("\affffffff\a" .. v317 .. "ambani bita" .. "\affffffff Naded \a" .. v317 .. "%s\affffffff (hp: \a" .. v317 .. "%d\affffffff)\a" .. v317 .. "\affffffff for damage\a" .. v317 .. " %s"):format(v314:get_name(), v313.health, v313.dmg_health));
                    print_raw(("\affffffff\a" .. v317 .. "ambani bita" .. "\affffffff Naded \a" .. v317 .. "%s\affffffff (hp: \a" .. v317 .. "%d\affffffff)\a" .. v317 .. "\affffffff for damage\a" .. v317 .. " %s"):format(v314:get_name(), v313.health, v313.dmg_health));
                elseif v313.weapon == "inferno" then
                    print_dev(("\affffffff\a" .. v317 .. "ambani bita" .. "\affffffff Burned \a" .. v317 .. "%s\affffffff (hp: \a" .. v317 .. "%d\affffffff)\a" .. v317 .. "\affffffff for damage\a" .. v317 .. " %s"):format(v314:get_name(), v313.health, v313.dmg_health));
                    print_raw(("\affffffff\a" .. v317 .. "ambani bita" .. "\affffffff Burned \a" .. v317 .. "%s\affffffff (hp: \a" .. v317 .. "%d\affffffff)\a" .. v317 .. "\affffffff for damage\a" .. v317 .. " %s"):format(v314:get_name(), v313.health, v313.dmg_health));
                end;
            end;
            return;
        end;
    end, 
    on_item_purchase = function(v318, v319)
        local v320 = entity.get(v319.userid, true);
        if v320 == nil then
            return;
        elseif not v320:is_enemy() then
            return;
        else
            local v321 = v320:get_name();
            local l_weapon_0 = v319.weapon;
            local v323 = "708ee0ff";
            if l_weapon_0 == "weapon_unknown" then
                l_weapon_0 = "weapon_revolver";
            end;
            print_dev(string.format("\affffffff\a" .. v323 .. "ambani bita\affffffff \a" .. v323 .. "%s\a" .. "\affffffff bought \a" .. v323 .. "%s", v321, l_weapon_0));
            print_raw(string.format("\affffffff\a" .. v323 .. "ambani bita\affffffff \a" .. v323 .. "%s\a" .. "\affffffff bought \a" .. v323 .. "%s", v321, l_weapon_0));
            if v318.data.menu.notifications.purchases:get() then
                v318.helpers:add_notification("\a9d8ad1ff" .. ui.get_icon("sparkles") .. "  " .. v321 .. "\affffffff bought \a9d8ad1ff" .. l_weapon_0);
            end;
            return;
        end;
    end
}):struct("visual")({
    alpha_smoother = l_smoothy_0.new(0), 
    aspectratio_viewmodel = function(v324)
        cvar.sv_competitive_minspec:int(0);
        cvar.viewmodel_fov:float(v324.data.menu.viewmodel.fov:get() * 0.1);
        cvar.viewmodel_offset_x:float(v324.data.menu.viewmodel.x:get() * 0.1);
        cvar.viewmodel_offset_y:float(v324.data.menu.viewmodel.y:get() * 0.1);
        cvar.viewmodel_offset_z:float(v324.data.menu.viewmodel.z:get() * 0.1);
        cvar.r_aspectratio:float(v324.data.menu.aspect_ratio.amount:get() * 0.01);
    end, 
    scope_overlay = function(v325)
        if v325.data.menu.customscope:get() then
            local v326 = v325.data.menu.customscope.color:get_color();
            local v327 = entity.get_local_player();
            if not v327 or not v327:is_alive() then
                return;
            elseif not v327.m_bIsScoped then
                return;
            else
                local v328 = v325.alpha_smoother(0.05, v327.m_bIsScoped);
                if v328 == 0 then
                    return;
                else
                    local v329 = v325.data.menu.customscope.gap:get();
                    if v325.data.menu.customscope.rotate:get() then
                        v329 = math.max(v329, 20);
                    end;
                    local v330 = v325.data.menu.customscope.line:get() * 5;
                    local l_v329_0 = v329;
                    local v332 = render.screen_size();
                    local v333 = v332 * 0.5;
                    local v334 = math.floor(v330 * v332.y / 1080);
                    local v335 = math.floor(l_v329_0 * v332.y / 1080);
                    local v336 = v326:clone();
                    local v337 = v326:clone();
                    v336.a = v336.a * v328;
                    v337.a = 0;
                    if v325.data.menu.customscope.rotate:get() then
                        render.push_rotation(45, v332 / 2 + 1);
                    end;
                    render.gradient(vector(v333.x, v333.y - v335 + 1), vector(v333.x + 1, v333.y - (v334 - v335)), v336, v336, v337, v337);
                    render.gradient(vector(v333.x, v333.y + v335), vector(v333.x + 1, v333.y + (v334 - v335)), v336, v336, v337, v337);
                    render.gradient(vector(v333.x - v335 + 1, v333.y), vector(v333.x - (v334 - v335), v333.y + 1), v336, v337, v336, v337);
                    render.gradient(vector(v333.x + v335, v333.y), vector(v333.x + (v334 - v335), v333.y + 1), v336, v337, v336, v337);
                    if v325.data.menu.customscope.rotate:get() then
                        render.pop_rotation();
                    end;
                end;
            end;
        end;
    end
}):struct("defensive")({
    max_tickbase = 0, 
    defensive = 0, 
    cmd = 0, 
    on_createmove = function(v338, _)
        local l_m_nTickBase_0 = entity.get_local_player().m_nTickBase;
        if math.abs(l_m_nTickBase_0 - v338.max_tickbase) > 64 then
            v338.max_tickbase = 0;
        end;
        local v341 = 0;
        if v338.max_tickbase < l_m_nTickBase_0 then
            v338.max_tickbase = l_m_nTickBase_0;
        elseif l_m_nTickBase_0 < v338.max_tickbase then
            v341 = math.min(14, math.max(0, v338.max_tickbase - l_m_nTickBase_0 - 1));
        end;
        v338.defensive = v341;
    end
}):struct("animations")({
    smoothed_pose_p = {}, 
    smoothed_layers = {}, 
    animations = function(v342)
        -- upvalues: l_lambotruck_0 (ref)
        for v343 = 0, 12 do
            v342.smoothed_pose_p[v343] = 0;
            v342.smoothed_layers[v343] = 0;
        end;
        local v344 = entity.get_local_player();
        if v344 == nil then
            return;
        else
            v344.m_flPoseParameter[6] = v342.data.menu.animations_fall_amount:get() / 100;
            v344.m_flPoseParameter[0] = v342.data.menu.animations_slide_amount:get() / 40;
            if v342.data.menu.jitter_legs:get() then
                v344.m_flPoseParameter[0] = globals.tickcount % 4 >= 2 and v342.data.menu.jitter_legs_from:get() or v342.data.menu.jitter_legs_to:get() * 3 / (globals.tickcount % 8 >= 4 and 400 or 200);
                v342.ref.antiaim.legs:override(math.random(0, 1) == 0 and "default" or "sliding");
            else
                v342.ref.antiaim.legs:override();
            end;
            l_lambotruck_0.animation.overlay(v344[0], 12).m_flWeight = v342.data.menu.animations_lean_amount:get() / 100;
            if v342.data.menu.interpolating:get() then
                local v345 = globals.tickinterval * 2;
                for v346 = 0, 12 do
                    v342.smoothed_pose_p[v346] = v345 * v342.smoothed_pose_p[v346] + (1 - v345) * v344.m_flPoseParameter[v346];
                    v344.m_flPoseParameter[v346] = v342.smoothed_pose_p[v346];
                end;
                for v347 = 0, 12 do
                    v342.smoothed_layers[v347] = v345 * v342.smoothed_layers[v347] + (1 - v345) * l_lambotruck_0.animation.overlay(v344[0], v347).m_flWeight;
                    l_lambotruck_0.animation.overlay(v344[0], v347).m_flWeight = v342.smoothed_layers[v347];
                end;
            end;
            return;
        end;
    end
}):struct("no_fall_damage")({
    trace_fall = function(_, v349, v350)
        local v351 = math.pi * 2;
        local v352 = v351 / 8;
        if entity.get_local_player() ~= nil then
            local v353 = entity.get_local_player():get_origin();
            for v354 = 0, v351, v352 do
                local v355 = math.sin(v354);
                local v356 = math.cos(v354);
                local v357 = v353.x + v356 * 10;
                local v358 = v353.y + v355 * 10;
                local v359 = vector(v357, v358, v353.z);
                local v360 = v359:clone();
                v360.z = v360.z - v350;
                if utils.trace_line(v359, v360, v349).fraction ~= 1 then
                    return true;
                end;
            end;
        end;
        return false;
    end, 
    no_fall_damage = function(v361, v362)
        local v363 = entity.get_local_player();
        if v361.data.menu.no_fall_damage:get() then
            if v363 == nil then
                return;
            elseif v363.m_vecVelocity.z >= -500 then
                state = false;
                return;
            else
                if v361:trace_fall(v363, 15) then
                    state = false;
                elseif v361:trace_fall(v363, 75) then
                    state = true;
                end;
                v362.in_duck = state;
            end;
        end;
    end
}):struct("fast_ladder")({
    ladder_status = false, 
    fast_ladder = function(v364, v365)
        local v366 = entity.get_local_player();
        if (v366.m_MoveType == 9 and common.is_button_down(87) or v364.ladder_status) and v364.data.menu.fast_ladder:get() then
            v365.view_angles.y = math.floor(v365.view_angles.y + 0.5);
            v365.roll = 0;
            if v365.view_angles.x < 45 then
                v365.view_angles.x = 89;
                v365.in_moveright = 1;
                v365.in_moveleft = 0;
                v365.in_forward = 0;
                v365.in_back = 1;
                if v365.sidemove == 0 then
                    v365.view_angles.y = v365.view_angles.y + 90;
                elseif v365.sidemove < 0 then
                    v365.view_angles.y = v365.view_angles.y + 150;
                elseif v365.sidemove > 0 then
                    v365.view_angles.y = v365.view_angles.y + 30;
                end;
            end;
        elseif (v366.m_MoveType == 9 and common.is_button_down(83) or v364.ladder_status) and v364.data.menu.fast_ladder:get() then
            v365.view_angles.y = math.floor(v365.view_angles.y + 0.5);
            v365.roll = 0;
            if v365.view_angles.x < 45 then
                v365.view_angles.x = 89;
                v365.in_moveright = 0;
                v365.in_moveleft = 1;
                v365.in_forward = 1;
                v365.in_back = 0;
                if v365.sidemove == 0 then
                    v365.view_angles.y = v365.view_angles.y + 90;
                elseif v365.sidemove < 0 then
                    v365.view_angles.y = v365.view_angles.y + 150;
                elseif v365.sidemove > 0 then
                    v365.view_angles.y = v365.view_angles.y + 30;
                end;
            end;
        end;
    end
});
for _, v378 in ipairs({
    [1] = {
        [1] = "load", 
        [2] = function()
            -- upvalues: v367 (ref)
            v367.menu:render();
            v367.helpers:add_notification("\a708ee0ff" .. ui.get_icon("power-off") .. "\affffffff  Welcome ['\a708ee0ff" .. common.get_username() .. "\affffffff'] build \a708ee0ffbita");
            v367.config:initialize();
        end
    }, 
    [2] = {
        [1] = "level_init", 
        [2] = function()
            -- upvalues: v367 (ref)
            v367.antiaim.state.defensive_after = false;
            v367.antiaim.state.defensive_after = 0;
        end
    }, 
    [3] = {
        [1] = "bullet_impact", 
        [2] = function(v368)
            -- upvalues: v367 (ref)
            v367.antiaim:shot_detection(v368);
        end
    }, 
    [4] = {
        [1] = "item_purchase", 
        [2] = function(v369)
            -- upvalues: v367 (ref)
            v367.hitlogs:on_item_purchase(v369);
        end
    }, 
    [5] = {
        [1] = "createmove", 
        [2] = function(v370)
            -- upvalues: v367 (ref)
            v367.ref.rage.dtlag:override();
            v367.ref.rage.fd:override();
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override();
            v367.defensive:on_createmove(v370);
            v367.antiaim:run(v370);
            v367.no_fall_damage:no_fall_damage(v370);
            v367.fast_ladder:fast_ladder(v370);
        end
    }, 
    [6] = {
        [1] = "createmove_run", 
        [2] = function(_)
            -- upvalues: v367 (ref)
            local v372 = entity.get_local_player();
            if v372:is_alive() then
                if v372.m_MoveType == 9 and common.is_button_down(87) then
                    v367.fast_ladder.ladder_status = true;
                else
                    v367.fast_ladder.ladder_status = false;
                end;
            else
                v367.fast_ladder.ladder_status = false;
            end;
        end
    }, 
    [7] = {
        [1] = "post_update_clientside_animation", 
        [2] = function()
            -- upvalues: v367 (ref)
            if not entity.get_local_player():is_alive() then
                return;
            else
                v367.animations:animations();
                return;
            end;
        end
    }, 
    [8] = {
        [1] = "player_hurt", 
        [2] = function(v373)
            -- upvalues: v367 (ref)
            v367.hitlogs:on_grenades(v373);
        end
    }, 
    [9] = {
        [1] = "render", 
        [2] = function(_)
            -- upvalues: v367 (ref)
            v367.visual:aspectratio_viewmodel();
            v367.visual:scope_overlay();
            v367.helpers:render_notifications();
            local v375 = render.screen_size();
            v375.x = v375.x * 0.5;
            v375.y = v375.y * 0.9935;
            render.text(1, v375, color(255, 255, 255, globals.tickcount * 2 % 255), "cs", string.upper("L 3 G A C Y _ D 3 S Y N C"));
        end
    }, 
    [10] = {
        [1] = "round_end", 
        [2] = function()
            -- upvalues: v367 (ref)
            v367.antiaim.state.round_ended = true;
            v367.antiaim.state.defensive_after = 0;
        end
    }, 
    [11] = {
        [1] = "aim_ack", 
        [2] = function(v376)
            -- upvalues: v367 (ref)
            v367.hitlogs:main(v376);
        end
    }, 
    [12] = {
        [1] = "round_start", 
        [2] = function()
            -- upvalues: v367 (ref)
            v367.antiaim.state.round_ended = false;
            v367.antiaim.state.defensive_after = 0;
        end
    }
}) do
    if v378[1] == "load" then
        v378[2]();
    else
        events[v378[1]]:set(v378[2]);
    end;
end;
