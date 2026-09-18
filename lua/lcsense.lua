local s1 = "lcsense"
local pui = require("neverlose/pui")
local t1, t2, t3, t4, t5, t6, t8, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30, t31, t32, t33, t34, t35, t36, v49, t94

do
	local t7, t9, t10, t11, t12, t13, t14, t15, t16, v46, v47, v48

	do
		local base64 = require("neverlose/base64")
		local clipboard = require("neverlose/clipboard")

		require("neverlose/inspect")

		local realtime = globals.realtime
		local v6 = common.get_username()

		t1 = {}
		t2 = {}
		t3 = {}
		t4 = {}
		t5 = {}
		t6 = {}
		t7 = {}
		t8 = {}
		t9 = {}
		t10 = {}
		t11 = {}
		t12 = {}
		t13 = {}
		t14 = {}
		t15 = {}
		t16 = {}
		t17 = {}
		t18 = {}
		t19 = {}
		t20 = {}
		t21 = {}
		t22 = {}
		t23 = {}
		t24 = {}
		t25 = {}
		t26 = {}
		t27 = {}
		t28 = {}
		t29 = {}
		t30 = {}
		t31 = {}
		t32 = {}
		t33 = {}
		t34 = {}
		t35 = {}
		t36 = {}

		local v44, v45, t84, v126, t90

		do
			local s4

			do
				local t37, t39, t57, v68, t58

				do
					local t38

					do
						local function v43(p1)
							return string.gsub(p1, "[\128-\191]", "")
						end

						function v44(p2)
							return tonumber(p2:string())
						end
						function v45(p3, p4)
							local v272 = p4 and "FF3E3EFF" or "{Link Active}"

							print_raw(string.format("[\a%slcsense\aDEFAULT] \a%s%s", "{Link Active}", v272, p3))
						end

						ffi.cdef("    typedef struct {\n        float x;\n        float y;\n        float z;\n    } Vector;\n\n    typedef struct {\n        int id;\n        int version;\n        int checksum;\n        char name[64];\n        int length;\n        Vector eyePosition;\n        Vector illumPosition;\n        Vector hullMin;\n        Vector hullMax;\n        Vector bbMin;\n        Vector bbMax;\n        int flags;\n        int numBones;\n        int boneIndex;\n        int numBoneControllers;\n        int boneControllerIndex;\n        int numHitboxSets;\n        int hitboxSetIndex;\n    } StudioHdr;\n\n    typedef struct {\n        int parent;\n        int bonecontroller[6];\n        float pos[3];\n        float quat[4];\n        float rot[3];\n        float posscale[3];\n        float rotscale[3];\n        float poseToBone[12];\n        float qAlignment[4];\n        int flags;\n        int proctype;\n        int procindex;\n        int physicsbone;\n        int surfacepropidx;\n        int contents;\n        int surfacepropLookup;\n    } mstudiobone_t;\n\n    typedef struct {\n        int sznameindex;\n        int numhitboxes;\n        int hitboxindex;\n    } mstudiohitboxset_t;\n\n    typedef struct {\n        int bone;\n        int group;\n        Vector bbmin;\n        Vector bbmax;\n        int szhitboxnameindex;\n        int unused[8];\n    } mstudiobbox_t;\n")
						v46 = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "uintptr_t(__thiscall*)(void*, int)")
						v47 = utils.get_vfunc("engine.dll", "VModelInfoClient004", 1, "void*(__thiscall*)(void*, int)")
						v48 = utils.get_vfunc("engine.dll", "VModelInfoClient004", 32, "StudioHdr*(__thiscall*)(void*, void*)")
						v49 = render.screen_size()
						t37 = {
							[1] = "Standing",
							[2] = "Running",
							[3] = "Slowing",
							[4] = "Crouching",
							[5] = "Sneaking",
							[6] = "Air",
							[7] = "Air Crouching",
							[8] = "Legit AA",
							[9] = "Freestanding"
						}
						t38 = {
							[1] = "person",
							[2] = "person-running",
							[3] = "person-walking",
							[4] = "person-praying",
							[5] = "person-hiking",
							[6] = "person-falling",
							[7] = "person-falling-burst",
							[8] = "E",
							[9] = "arrows-left-right"
						}

						for i = 1, #t38 do
							if i ~= 8 then
								t38[i] = ui.get_icon(t38[i])
							end
						end

						t39 = {
							[1] = "T",
							[2] = "CT"
						};
						({}).FL_ONGROUND = bit.lshift(1, 0)
						t1.rage = {
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
						}
						t1.antiaim = {
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
						}
						t1.misc = {
							movement = {},
							in_game = {},
							other = {
								fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"),
								skybox = ui.find("Visuals", "World", "Ambient", "Skybox Changer")
							}
						}

						function t3.new(p5, p6)
							-- upvalues: v49 (copy)
							local v275 = p6 or vector()
							local v276 = ui.create("DRAGGING$$$)$)$)$")
							local t40 = {}
							local t42 = {
								dragging = false,
								mouse_pos = vector(0, 0),
								mouse_pos_diff = vector(0, 0),
								size = vector(0, 0),
								position = vector(0, 0),
								reference = (function()
									-- upvalues: v276 (copy), p5 (copy), v275 (copy)
									local t41 = {
										v276:slider(("%s:dragging_x"):format(p5), -16384, 16384, v275.x),
										v276:slider(("%s:dragging_y"):format(p5), -16384, 16384, v275.y)
									}

									t41[1]:visibility(false)
									t41[2]:visibility(false)

									return t41
								end)()
							}

							function t40.intersects(_, p8, p9, p10)
								return p8.x >= p9.x and (p8.x <= p9.x + p10.x and (p8.y >= p9.y and not (p8.y > p9.y + p10.y)))
							end
							function t40.set_position(p11, p12)
								p11.reference[1]:set(p12.x)
								p11.reference[2]:set(p12.y)
							end
							function t40.is_dragging(p13)
								return p13.dragging
							end
							function t40.update(p14, p15)
								-- upvalues: v49 (copy)
								local v1050 = ui.get_mouse_position()
								local v1051 = ui.get_position()
								local v1052 = ui.get_size()
								local v1053 = ui.get_alpha() > 0 and common.is_button_down(1)
								local v1054 = p14:intersects(v1050, p14.position, p15) and not p14:intersects(v1050, v1051, v1052)

								p14.mouse_pos_diff = -(p14.mouse_pos - v1050)

								if v1053 and p14.intersected == nil then
									p14.intersected = v1054
								end

								if not v1053 or not p14.intersected then
									if not v1053 then
										p14.dragging = false
										p14.intersected = nil
									end
								else
									p14.dragging = true
								end

								if p14.dragging then
									local v1055 = p15 * 0.5
									local v1056 = vector(p14.reference[1]:get() + p14.mouse_pos_diff.x, p14.reference[2]:get() + p14.mouse_pos_diff.y)

									p14.reference[1]:set(math.max(-v1055.x, math.min(v49.x - v1055.x, v1056.x)))
									p14.reference[2]:set(math.max(-v1055.y, math.min(v49.y - v1055.y, v1056.y)))
								end

								local v1057 = vector(p14.reference[1]:get(), p14.reference[2]:get())

								p14.mouse_pos = v1050
								p14.size = p15
								p14.position = v1057
							end

							return setmetatable(t40, {
								__index = t42
							})
						end

						local function v54(p16)
							local t43 = {}
							local n1 = 0

							for match in string.gmatch(p16, ".[\128-\191]*") do
								n1 = n1 + 1
								t43[n1] = match
							end

							return t43, n1
						end

						function t4.wave(p17, p18, p19, p20, p21, p22, p23, p24, p25, p26)
							-- upvalues: v43 (copy)
							local t44 = {}
							local v294 = 1 / (string.len(v43(p17)) - 1)
							local v295 = p23 - p19
							local v296 = p24 - p20
							local v297 = p25 - p21
							local v298 = p26 - p22

							for match in string.gmatch(p17, ".[\128-\191]*") do
								local v300 = p18 % 2

								if v300 > 1 then
									v300 = 2 - v300
								end

								local v301 = p19 + v295 * v300
								local v302 = p20 + v296 * v300
								local v303 = p21 + v297 * v300
								local v304 = p22 + v298 * v300

								t44[#t44 + 1] = "\a"
								t44[#t44 + 1] = color(v301, v302, v303, v304):to_hex()
								t44[#t44 + 1] = match
								p18 = p18 + v294
							end

							return table.concat(t44)
						end
						function t4.text(p27, p28)
							local v307 = ui.get_icon(p27)

							if string.gsub(v307, " ", "") == "" then
								v307 = p27
							end

							local t45 = {}

							t45[#t45 + 1] = "\v"
							t45[#t45 + 1] = v307
							t45[#t45 + 1] = "\r"

							local v309 = table.concat(t45)
							local t46 = {}

							t46[#t46 + 1] = p28
							t46[#t46 + 1] = "  \aA0A0A02F~  {\r "
							t46[#t46 + 1] = v309
							t46[#t46 + 1] = "\aA0A0A02F }\r"

							return table.concat(t46)
						end
						function t4.antiaim(p29, p30)
							local v313 = ui.get_icon(p29)

							if string.gsub(v313, " ", "") == "" then
								v313 = p29
							end

							local t47 = {}

							t47[#t47 + 1] = "\v"
							t47[#t47 + 1] = v313
							t47[#t47 + 1] = "\r"

							local v315 = table.concat(t47)
							local t48 = {}

							t48[#t48 + 1] = p30
							t48[#t48 + 1] = "  \aA0A0A02F[\r "
							t48[#t48 + 1] = v315
							t48[#t48 + 1] = " \aA0A0A02F]\r"

							return table.concat(t48)
						end
						function t4.glitch(p31)
							-- upvalues: v54 (copy)
							local s2 = "abcdefghijklmnopqrstuvwxyz0123456789~!@#$%^&*+-/=?_<>"
							local _, v320 = v54(p31)
							local s3 = ""

							for _ = 1, v320 do
								local v323 = math.random(#s2)

								s3 = s3 .. s2:sub(v323, v323)
							end

							local v324 = math.abs(globals.realtime * 0.5 % 2 - 1) * (v320 + 1)
							local v325 = math.clamp(v324, 0, v320)

							return p31:sub(1, v325) .. s3:sub(v325 + 1)
						end
						function t4.text_colored(...)
							local t49 = {}

							for _, v in pairs({ ... }) do
								local v329 = v[2]
								local v330 = v[1]

								t49[#t49 + 1] = "\a"
								t49[#t49 + 1] = v329:to_hex()
								t49[#t49 + 1] = v330
							end

							return table.concat(t49)
						end
						function t4.gradient(p32, p33, ...)
							-- upvalues: v54 (copy)
							local t50 = {}
							local v334, v335 = v54(p32)

							if not (v335 < 2) then
								local t51 = { ... }
								local v337 = 1 / (v335 - 1)
								local v338 = #t51 - 1

								for i = 1, v335 do
									local v340 = v334[i]
									local v341 = (p33 + i * v337) % 2

									if v341 > 1 then
										v341 = 2 - v341
									end

									local v342 = math.floor(v341 * v338) + 1

									if v342 >= #t51 then
										v342 = #t51 - 1
									end

									local v343 = t51[v342]:lerp(t51[v342 + 1], v341 * v338 % 1)

									t50[#t50 + 1] = "\a" .. v343:to_hex()
									t50[#t50 + 1] = v340
								end

								return table.concat(t50)
							end

							return p32
						end
					end

					function t4.get_formatted_time(p34)
						local t52 = {}
						local v346 = math.floor(p34 / 3600)
						local v347 = math.floor(p34 % 3600 / 60)
						local v348 = p34 % 60

						if v346 > 0 then
							table.insert(t52, string.format("%dh", v346))
						end

						if v347 > 0 then
							table.insert(t52, string.format("%dm", v347))
						end

						table.insert(t52, string.format("%ds", v348))

						return table.concat(t52, " ")
					end

					local t53

					do
						local v55 = utils.get_vfunc("engine.dll", "VEngineClient014", 91, "float(__thiscall*)(void*)")

						local function v56(p35, p36, p37, p38)
							return p37 * p35 / p38 + p36
						end
						local function v57(p39, p40, p41, p42, p43)
							if type(p41) == "boolean" then
								p41 = p41 and 1 or 0
							end

							if type(p40) == "boolean" then
								p40 = p40 and 1 or 0
							end

							local v358 = p39(p42, p40, p41 - p40, p43)

							if type(p41) == "number" then
								if math.abs(p41 - v358) <= 0.001 then
									v358 = p41
								end

								if not (v358 % 1 < 0.0001) then
									if v358 % 1 > 0.9999 then
										v358 = math.ceil(v358)
									end
								else
									v358 = math.floor(v358)
								end
							end

							return v358
						end

						function t5.interp(p44, p45, p46, p47)
							-- upvalues: v56 (copy), v55 (copy), v57 (copy)
							if not p47 then
								p47 = v56
							end

							if type(p45) == "boolean" then
								p45 = p45 and 1 or 0
							end

							local v363 = globals.frametime / v55()

							return v57(p47, p44, p45, v363, p46)
						end

						s4 = "turn-down-right"
						t53 = {}

						local t54 = { pui.create("\v\f<house>", "Information", 1) }

						t54[1]:label(t4.text("user-secret", "Welcome back"))
						t54[1]:button(pui.string("\v@\r" .. v6), nil, true)
						t54[1]:label(t4.text("code-commit", "Build Version "))
						t54[1]:button(pui.string("\v" .. "Beta"), nil, true)
						t53.stats = {
							session_text = t54[1]:label(t4.text("clock", "Session")),
							session = t54[1]:button("", nil, true)
						}
					end

					local t56, v65

					do
						local v61 = pui.create("\v\f<house>", "Advertisement", 1)

						v61:label(t4.text("bug", "Discord server"))
						v61:button("\f<discord>", function()
							panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/XEtDSMx4vk")
						end, true)

						local t55 = {
							label = v61:label(t4.text("star", "Watermark"))
						}
						local v63 = t55.label:create()

						t55.mode = v63:listable(t4.text("list", "Options"), {
							[1] = "Customizable Text",
							[2] = "Customizable Color",
							[3] = "Customizable Font"
						})
						t55.text = v63:input(t4.text("message-text", "Text"), s1):depend({
							[1] = nil,
							[2] = 1,
							[1] = t55.mode
						})
						t55.glitch = v63:switch(t4.text("bug", "Glitch")):depend({
							[1] = nil,
							[2] = 1,
							[1] = t55.mode
						})
						t55.effects = v63:selectable(t4.text("sparkles", "Effects"), {
							[1] = "Gradient",
							[2] = "Pulse"
						}):depend({
							[1] = nil,
							[2] = 2,
							[1] = t55.mode
						})
						t55.color = v63:color_picker(t4.text("paintbrush", "Color"), {
							Inner = { color(175, 255, 55, 255) },
							Outter = { color(35, 128, 255, 255) }
						}):depend({
							[1] = nil,
							[2] = 2,
							[1] = t55.mode
						}, {
							[1] = nil,
							[2] = 1,
							[1] = t55.effects
						})
						t55.rainbow = v63:switch(t4.text("rainbow", "Rainbow")):depend({
							[1] = nil,
							[2] = 2,
							[1] = t55.mode
						}, {
							[1] = nil,
							[2] = "Gradient",
							[1] = t55.effects
						})
						t55.speed = v63:slider(t4.text("hourglass", "Speed"), -200, 200, 100, 0.01):depend({
							[1] = nil,
							[2] = 2,
							[1] = t55.mode
						}, {
							[1] = nil,
							[2] = "Gradient",
							[1] = t55.effects
						})
						t55.color_n = v63:color_picker(t4.text("eye-dropper", "Color")):depend({
							[1] = nil,
							[2] = 2,
							[1] = t55.mode
						}, {
							[1] = nil,
							[2] = "Gradient",
							[3] = true,
							[1] = t55.effects
						})
						t55.color_1 = v63:color_picker(t4.text("eye-dropper", "First Color"), color(255, 0, 0)):depend({
							[1] = nil,
							[2] = 2,
							[1] = t55.mode
						}, {
							[1] = nil,
							[2] = "Gradient",
							[1] = t55.effects
						})
						t55.color_2 = v63:color_picker(t4.text("eye-dropper", "Second Color")):depend({
							[1] = nil,
							[2] = 2,
							[1] = t55.mode
						}, {
							[1] = nil,
							[2] = "Gradient",
							[1] = t55.effects
						})
						t55.font = v63:combo(t4.text("font", "Font"), {
							[1] = "Default",
							[2] = "Small",
							[3] = "Console",
							[4] = "Bold",
							[5] = "Unique"
						}):depend({
							[1] = nil,
							[2] = 3,
							[1] = t55.mode
						})
						t53.watermark = t55
						t56 = {}
						v65 = pui.create("\v\f<house>", "Configs", 2)
						t56.list = v65:list("\n", {})
						t56.name = v65:input(t4.text("pen", "Name"), "")
						t56.create = v65:button(" \v\f<circle-plus> ", nil, true, "Create preset.")
						t56.load = v65:button("Load", nil, true, "Load selected preset.")
						t56.save = v65:button("Save", nil, true, "Save selected preset.")
						t56.import = v65:button("Import", nil, true, "Import new preset.")
						t56.export = v65:button("Export", nil, true, "Export selected preset.")

						local v66 = v65:switch(" ", false)

						v66:visibility(false)
						t56.delete = v65:button(" \aff0000ff\f<trash> ", nil, true):depend({
							[1] = nil,
							[2] = false,
							[1] = v66
						})
					end

					t56.delete_confirm = v65:button("         \a00FF00FF\f<trash-check> Confirm         ", nil, true)
					t56.delete_cancel = v65:button("          \aFF0000FF\f<trash-xmark> Cancel          ", nil, true)
					t56.information = {
						creator_text = v65:label(t4.text("user", "Author")),
						creator = v65:button("", nil, true),
						date_text = v65:label(t4.text("calendar", "Date updated")),
						date = v65:button("", nil, true)
					}
					t53.presets = t56
					t6.info = t53
					t57 = {}
					v68 = pui.create("\v\f<user>", "Selection", 1)
					t58 = {}

					local t59 = {
						team = v68:list("", {
							pui.string("\v•\r  Terrorist"),
							pui.string("\v•\r  Counter-Terrorist")
						}),
						state = v68:combo(t4.text("•", "State"), t37)
					}

					t59.state:visibility(false)
					t59.icon = v68:label("      \a{Small Text}\f<angle-right>")

					for i = 1, #t37 do
						t59[t37[i]] = v68:button((t59.state:get() == t37[i] and "\v" or "") .. t38[i], function(_)
							-- upvalues: t59 (copy), t37 (copy), i (copy), t38 (copy)
							t59.state:set(t37[i])

							for j = 1, #t37 do
								t59[t37[j]]:name(t38[j])
							end

							t59[t37[i]]:name("\v" .. t38[i])
						end, true, "Click to adjust " .. t37[i] .. " settings")
					end

					t58.configure = t59
				end

				local t65, v82, v83, t66

				do
					local t60 = {}
					local v73 = pui.create("\v\f<user>", "Tweaks", 1)
					local t61 = {
						select = v73:combo(t4.text("up-down-left-right", "Manuals"), {
							[1] = "Disabled",
							[2] = "Left",
							[3] = "Right",
							[4] = "Forward"
						})
					}
					local v75 = t61.select:create()

					t61.static = v75:switch(t4.text("face-icicles", "Static"))
					t61.inverter = v75:switch(t4.text("option", "Inverter")):depend({
						[1] = nil,
						[2] = true,
						[1] = t61.static
					})
					t60.manual_yaw = t61

					local t62 = {
						switch = v73:switch(t4.text("shield-halved", "Safe Head"))
					}
					local v77 = t62.switch:create()

					t62.states = v77:selectable(t4.text("list-check", "Conditions"), {
						[1] = "Air Crouch",
						[2] = "Zeus",
						[3] = "Knife",
						[4] = "Height Advantage"
					}):depend({
						[1] = nil,
						[2] = true,
						[1] = t62.switch
					})
					t62.height = v77:slider(t4.text("ruler-vertical", "Height"), 0, 200, 25, 1, "u.", "If value equals zero then safe head works only on the same height as your enemy."):depend({
						[1] = nil,
						[2] = true,
						[1] = t62.switch
					}, {
						[1] = nil,
						[2] = "Height Advantage",
						[1] = t62.states
					})
					t60.safe_head = t62

					local t63 = {
						enabled = v73:switch(t4.text("octagon-exclamation", "Legit AA"))
					}

					t63.mode = t63.enabled:create():combo(t4.text("up-down-left-right", "Yaw base"), {
						[1] = "Local View",
						[2] = "At Target"
					}):depend({
						[1] = nil,
						[2] = true,
						[1] = t63.enabled
					})
					t60.legit_aa = t63

					local t64 = {
						select = v73:combo(t4.text("dumbbell", "Warmup"), {
							[1] = "Disabled",
							[2] = "Warmup",
							[3] = "No Enemies",
							[4] = "Force"
						})
					}
					local v80 = t64.select:create()

					t64.pitch = v80:combo(t4.text("spinner", "Pitch"), "Disabled", "Down"):depend({
						[1] = nil,
						[2] = "Disabled",
						[3] = true,
						[1] = t64.select
					})
					t64.yaw = v80:combo(t4.text("group-arrows-rotate", "Yaw"), "Spin", "Distortion", "L&R"):depend({
						[1] = nil,
						[2] = "Disabled",
						[3] = true,
						[1] = t64.select
					})
					t64.range = v80:slider(t4.text(s4, "Range"), 1, 360, 360):depend({
						[1] = nil,
						[2] = "L&R",
						[3] = true,
						[1] = t64.yaw
					}, {
						[1] = nil,
						[2] = "Disabled",
						[3] = true,
						[1] = t64.select
					})
					t64.speed = v80:slider(t4.text(s4, "Speed"), 1, 128, 32, 1, "t"):depend({
						[1] = nil,
						[2] = "L&R",
						[3] = true,
						[1] = t64.yaw
					}, {
						[1] = nil,
						[2] = "Disabled",
						[3] = true,
						[1] = t64.select
					})
					t64.left_yaw = v80:slider(t4.text(s4, "Left Offset"), -180, 180, 0):depend({
						[1] = nil,
						[2] = "L&R",
						[1] = t64.yaw
					}, {
						[1] = nil,
						[2] = "Disabled",
						[3] = true,
						[1] = t64.select
					})
					t64.right_yaw = v80:slider(t4.text(s4, "Right Offset"), -180, 180, 0):depend({
						[1] = nil,
						[2] = "L&R",
						[1] = t64.yaw
					}, {
						[1] = nil,
						[2] = "Disabled",
						[3] = true,
						[1] = t64.select
					})
					t60.warmup_aa = t64
					t58.additional = t60
					t57.main = t58
					t65 = {}
					v82 = pui.create("\v\f<user>", "Builder", 2)
					v83 = pui.create("\v\f<user>", "\n globals", 2)
					t66 = {
						group = pui.create("\v\f<user>", "Snap builder", 2)
					}
					t66.select = t66.group:selectable(t4.text("bolt", "Break LC"), t37)

					local v85 = t66.select:create()

					t66.disable_on_grenade = v85:switch(t4.text("bomb", "Disable on Grenade"))
					t66.hide_shots = v85:combo(t4.text("bullseye-arrow", "Hide Shots"), {
						[1] = "Favor Fire Rate",
						[2] = "Favor Fake Lag",
						[3] = "Break LC"
					})
				end

				t65.break_lc = t66

				local t67 = {}

				for k, v in pairs(t37) do
					t67[v] = {}

					for k2, v2 in pairs(t39) do
						local v91, team, state

						do
							do
								t67[v][v2] = {}
								v91 = t67[v][v2]
								team = t58.configure.team
								state = t58.configure.state
								v91.funny_label = v68:label("\aA0A0A02F{\v " .. v .. " \aA0A0A02F}"):depend({
									[1] = team,
									[2] = k2
								}, {
									[1] = state,
									[2] = v
								})
								v91.send_to_opposite = v68:button("\v\f<share-nodes>\r Other team", function()
									-- upvalues: v2 (copy), state (copy), t67 (copy), v91 (copy)
									local v366 = v2 == "T" and "CT" or "T"
									local v367 = t67[state:get()][v366]

									for k3, v3 in pairs(v91) do
										for k4, v4 in pairs(v367) do
											if k3 == k4 and k3 ~= "send_to_opposite" then
												v4:set(v3:get())
											end
										end
									end
								end, true):depend({
									[1] = team,
									[2] = k2
								}, {
									[1] = state,
									[2] = v
								})
								v91.copy_to_clipboard = v68:button("\v\f<clipboard>", function()
									-- upvalues: v91 (copy), clipboard (copy)
									local t68 = {}

									for k5, v5 in pairs(v91) do
										if k5 ~= "send_to_opposite" and k5 ~= "copy_to_clipboard" then
											t68[#t68 + 1] = ("%s: %s"):format(k5, tostring(v5:get()))
										end
									end

									local v375 = table.concat(t68, "\n")

									clipboard.set(v375)
								end, true):depend({
									[1] = team,
									[2] = k2
								}, {
									[1] = state,
									[2] = v
								})
								v91.paste_from_clipboard = v68:button("\v\f<clipboard-check>", function()
									-- upvalues: clipboard (copy), v91 (copy)
									local v376 = clipboard.get()
									local t69 = {}
									local s5 = ""

									for i = 1, #v376 do
										local v380 = v376:sub(i, i)

										if v380 ~= "\n" then
											s5 = s5 .. v380
										else
											t69[#t69 + 1] = s5
											s5 = ""
										end
									end

									if s5 ~= "" then
										t69[#t69 + 1] = s5
									end

									local t70 = {}

									for _, v7 in pairs(t69) do
										local v384, v385 = string.match(v7, "^(.-):%s(.-)$")

										if v384 and v385 then
											t70[v384] = v385
										end
									end

									for k6, v8 in pairs(v91) do
										if k6 ~= "send_to_opposite" and k6 ~= "copy_to_clipboard" and k6 ~= "paste_from_clipboard" then
											local v388 = t70[k6]

											if v388 then
												if type(v8:get()) ~= "boolean" then
													if type(v8:get()) ~= "number" then
														v8:set(v388)
													else
														v8:set(tonumber(v388))
													end
												else
													v8:set(v388 == "true")
												end
											end
										end
									end
								end, true):depend({
									[1] = team,
									[2] = k2
								}, {
									[1] = state,
									[2] = v
								})

								if v == "Freestanding" or v == "Legit AA" then
									v91.allow_state = v82:switch(("Allow \v%s\r state"):format(v), true):depend({
										[1] = team,
										[2] = k2
									}, {
										[1] = state,
										[2] = v
									})
								end

								v91.yaw_mode = v82:slider(t4.text("pencil", "Mode"), 1, 2, 1, 1, function(p49)
									return p49 .. "-way"
								end):depend({
									[1] = team,
									[2] = k2
								}, {
									[1] = state,
									[2] = v
								})

								local v94 = v91.yaw_mode:create()

								v91.offset = v82:slider(t4.text("arrows-left-right", "Offset"), -180, 180, 0, 1, "°"):depend({
									[1] = nil,
									[2] = 1,
									[1] = v91.yaw_mode
								}, {
									[1] = team,
									[2] = k2
								}, {
									[1] = state,
									[2] = v
								})
								v91.yaw_left = v82:slider(t4.text("arrow-left", "Left"), -180, 180, 0, 1, "°"):depend({
									[1] = nil,
									[2] = 2,
									[1] = v91.yaw_mode
								}, {
									[1] = team,
									[2] = k2
								}, {
									[1] = state,
									[2] = v
								})
								v91.yaw_right = v82:slider(t4.text("arrow-right", "Right"), -180, 180, 0, 1, "°"):depend({
									[1] = nil,
									[2] = 2,
									[1] = v91.yaw_mode
								}, {
									[1] = team,
									[2] = k2
								}, {
									[1] = state,
									[2] = v
								})
								v91.yaw_random = v82:slider(t4.text("shuffle", "Randomize"), 0, 100, 0, 1, "%"):depend({
									[1] = team,
									[2] = k2
								}, {
									[1] = state,
									[2] = v
								})
								v91.delay = v94:switch(t4.text("hourglass", "Delay")):depend({
									[1] = nil,
									[2] = 2,
									[1] = v91.yaw_mode
								})
								v91.delay_logic = v94:combo(t4.text("server", "Logic"), {
									[1] = "Default",
									[2] = "Legacy"
								}):depend({
									[1] = nil,
									[2] = 2,
									[1] = v91.yaw_mode
								}, {
									[1] = nil,
									[2] = true,
									[1] = v91.delay
								})
								v91.delay_method = v94:combo(t4.text("calculator", "Method"), {
									[1] = "Default",
									[2] = "Random",
									[3] = "Custom"
								}):depend({
									[1] = nil,
									[2] = 2,
									[1] = v91.yaw_mode
								}, {
									[1] = nil,
									[2] = true,
									[1] = v91.delay
								})
								v91.delay_default = v94:slider(t4.text("clock", "Timing\r"), 1, 22, 0):depend({
									[1] = nil,
									[2] = 2,
									[1] = v91.yaw_mode
								}, {
									[1] = nil,
									[2] = "Default",
									[1] = v91.delay_method
								}, {
									[1] = nil,
									[2] = true,
									[1] = v91.delay
								})
								v91.delay_randomize = v94:slider(t4.text("shuffle", "Randomize") .. "##DELAY", 0, 100, 0, 1, "%"):depend({
									[1] = nil,
									[2] = 2,
									[1] = v91.yaw_mode
								}, {
									[1] = nil,
									[2] = "Default",
									[1] = v91.delay_method
								}, {
									[1] = nil,
									[2] = true,
									[1] = v91.delay
								})
								v91.delay_random_min = v94:slider(t4.text("clock", "Min. Timing\r"), 1, 22, 0):depend({
									[1] = nil,
									[2] = 2,
									[1] = v91.yaw_mode
								}, {
									[1] = nil,
									[2] = "Random",
									[1] = v91.delay_method
								}, {
									[1] = nil,
									[2] = true,
									[1] = v91.delay
								})
								v91.delay_random_max = v94:slider(t4.text("clock", "Max. Timing\r"), 1, 22, 0):depend({
									[1] = nil,
									[2] = 2,
									[1] = v91.yaw_mode
								}, {
									[1] = nil,
									[2] = "Random",
									[1] = v91.delay_method
								}, {
									[1] = nil,
									[2] = true,
									[1] = v91.delay
								})
								v91.delay_custom_sliders = v94:slider(t4.text("code-commit", "Sliders"), 1, 12, 2):depend({
									[1] = nil,
									[2] = 2,
									[1] = v91.yaw_mode
								}, {
									[1] = nil,
									[2] = "Custom",
									[1] = v91.delay_method
								}, {
									[1] = nil,
									[2] = true,
									[1] = v91.delay
								})

								for i = 1, 12 do
									v91["delay_" .. i] = v94:slider(t4.text(("%s"):format(i), "Timing"), 1, 22, 0):depend({
										[1] = nil,
										[2] = 2,
										[1] = v91.yaw_mode
									}, {
										[1] = nil,
										[2] = "Custom",
										[1] = v91.delay_method
									}, {
										[1] = nil,
										[2] = true,
										[1] = v91.delay
									}, {
										[1] = v91.delay_custom_sliders,
										[2] = function()
											-- upvalues: i (copy), v91 (copy)
											if not (i <= 2) then
												return not (v91.delay_custom_sliders.value < i)
											end

											return true
										end
									})
								end
							end

							v91.modifier = v82:combo(t4.text("arrows-rotate", "Modifier"), {
								[1] = "Disabled",
								[2] = "Center",
								[3] = "Offset",
								[4] = "Random",
								[5] = "Spin",
								[6] = "3-Way",
								[7] = "Bobro",
								[8] = "5-Way"
							}):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							})

							local v96 = v91.modifier:create()

							v91.modifier_mode = v96:combo(t4.text("calculator", "Mode"), {
								[1] = "Default",
								[2] = "Min/Max",
								[3] = "Custom"
							}):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = "Disabled",
								[3] = true,
								[1] = v91.modifier
							})
							v91.modifier_random = v96:slider(t4.text("shuffle", "Randomize"), 0, 100, 0, 1, "%"):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = "Disabled",
								[3] = true,
								[1] = v91.modifier
							}, {
								[1] = nil,
								[2] = "Min/Max",
								[3] = true,
								[1] = v91.modifier_mode
							})
							v91.modifier_offset = v96:slider(t4.text("arrows-left-right", "Offset"), -180, 180, 0, 1, "°"):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = "Disabled",
								[3] = true,
								[1] = v91.modifier
							}, {
								[1] = nil,
								[2] = "Default",
								[1] = v91.modifier_mode
							})
							v91.modifier_min = v96:slider(t4.text("dice-one", "Min"), -180, 180, 0, 1, "°"):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = "Disabled",
								[3] = true,
								[1] = v91.modifier
							}, {
								[1] = nil,
								[2] = "Min/Max",
								[1] = v91.modifier_mode
							})
							v91.modifier_max = v96:slider(t4.text("dice-six", "Max"), -180, 180, 0, 1, "°"):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = "Disabled",
								[3] = true,
								[1] = v91.modifier
							}, {
								[1] = nil,
								[2] = "Min/Max",
								[1] = v91.modifier_mode
							})
							v91.modifier_custom_sliders = v96:slider(t4.text("diagram-cells", "Sliders"), 2, 12, 2):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = "Disabled",
								[3] = true,
								[1] = v91.modifier
							}, {
								[1] = nil,
								[2] = "Custom",
								[1] = v91.modifier_mode
							})

							for i = 1, 12 do
								v91["modifier_sliders_" .. i] = v96:slider(t4.text("arrows-left-right", ("%s"):format(i)), -180, 180, 0, 1, "°"):depend({
									[1] = team,
									[2] = k2
								}, {
									[1] = state,
									[2] = v
								}, {
									[1] = nil,
									[2] = "Disabled",
									[3] = true,
									[1] = v91.modifier
								}, {
									[1] = nil,
									[2] = "Custom",
									[1] = v91.modifier_mode
								}, {
									[1] = v91.modifier_custom_sliders,
									[2] = function()
										-- upvalues: i (copy), v91 (copy)
										if not (i <= 2) then
											return not (v91.modifier_custom_sliders.value < i)
										end

										return true
									end
								})
							end

							v91.body_yaw = v82:switch(t4.text("arrows-turn-to-dots", "Body Yaw")):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							})

							local v98 = v91.body_yaw:create()

							v91.body_freestanding = v98:combo(t4.text("eye-slash", "Freestand"), {
								[1] = "Off",
								[2] = "Peek Fake",
								[3] = "Peek Real"
							}):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = true,
								[1] = v91.body_yaw
							})
							v91.mode = v98:combo(t4.text("calculator", "Mode"), {
								[1] = "Static",
								[2] = "Ticks",
								[3] = "Random"
							}):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = true,
								[1] = v91.body_yaw
							})
							v91.mode_ticks = v98:slider(t4.text("diagram-cells", "Ticks"), 4, 20, 4, 1, "t"):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = true,
								[1] = v91.body_yaw
							}, {
								[1] = nil,
								[2] = "Ticks",
								[1] = v91.mode
							})
							v91.mode_ticks_randomize = v98:slider(t4.text("shuffle", "Randomize##TICKS"), 0, 100, 0, 1, "%"):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = true,
								[1] = v91.body_yaw
							}, {
								[1] = nil,
								[2] = "Ticks",
								[1] = v91.mode
							})
							v91.mode_random = v98:slider(t4.text("dice", "Randomize"), 4, 20, 4, 1, "x"):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = true,
								[1] = v91.body_yaw
							}, {
								[1] = nil,
								[2] = "Random",
								[1] = v91.mode
							})
							v91.limit_mode = v98:combo(t4.text("server", "Limit Mode"), {
								[1] = "Static",
								[2] = "Random",
								[3] = "Switch",
								[4] = "Delay",
								[5] = "Sinewave"
							}):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = true,
								[1] = v91.body_yaw
							})
							v91.left_limit = v98:slider(t4.text("arrow-right", "Left Limit"), 0, 60, 60):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = true,
								[1] = v91.body_yaw
							}, {
								[1] = nil,
								[2] = "Static",
								[1] = v91.limit_mode
							})
							v91.right_limit = v98:slider(t4.text("arrow-left", "Right Limit"), 0, 60, 60):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = true,
								[1] = v91.body_yaw
							}, {
								[1] = nil,
								[2] = "Static",
								[1] = v91.limit_mode
							})
							v91.minimum_limit = v98:slider(t4.text("dice-one", "Min"), 0, 60, 60):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = true,
								[1] = v91.body_yaw
							}, {
								[1] = nil,
								[2] = "Random",
								[1] = v91.limit_mode
							})
							v91.maximum_limit = v98:slider(t4.text("dice-six", "Max"), 0, 60, 60):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = true,
								[1] = v91.body_yaw
							}, {
								[1] = nil,
								[2] = "Random",
								[1] = v91.limit_mode
							})
							v91.limit_delay = v98:slider(t4.text("hourglass", "Timing"), 1, 22, 0):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = true,
								[1] = v91.body_yaw
							}, {
								[1] = nil,
								[2] = "Delay",
								[1] = v91.limit_mode
							})
							v91.limit_delay_randomize = v98:slider(t4.text("shuffle", "Randomize##LIMIT"), 0, 100, 0, 1, "%"):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = true,
								[1] = v91.body_yaw
							}, {
								[1] = nil,
								[2] = "Delay",
								[1] = v91.limit_mode
							})
							v91.from_limit = v98:slider(t4.text("clock-one", "From"), 0, 60, 60):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = true,
								[1] = v91.body_yaw
							}, {
								[1] = v91.limit_mode,
								[2] = function()
									-- upvalues: v91 (copy)
									return v91.limit_mode:get() == "Switch" or (v91.limit_mode:get() == "Delay" or v91.limit_mode:get() == "Sinewave")
								end
							})
							v91.to_limit = v98:slider(t4.text("clock-eight", "To"), 0, 60, 60):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = true,
								[1] = v91.body_yaw
							}, {
								[1] = v91.limit_mode,
								[2] = function()
									-- upvalues: v91 (copy)
									return v91.limit_mode:get() == "Switch" or (v91.limit_mode:get() == "Delay" or v91.limit_mode:get() == "Sinewave")
								end
							})
							v91.sinewave_speed = v98:slider(t4.text("hourglass", "Speed"), 1, 10, 5, nil, "x"):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = true,
								[1] = v91.body_yaw
							}, {
								[1] = nil,
								[2] = "Sinewave",
								[1] = v91.limit_mode
							})
						end

						v91.body_yaw_options = v82:selectable(t4.text("list", "Options"), {
							[1] = "Avoid Overlap",
							[2] = "Jitter",
							[3] = "Randomize Jitter",
							[4] = "Anti Bruteforce"
						}):depend({
							[1] = team,
							[2] = k2
						}, {
							[1] = state,
							[2] = v
						}, {
							[1] = nil,
							[2] = true,
							[1] = v91.body_yaw
						})
						v91.choke = t66.group:combo(t4.text("battery-bolt", "Tickbase"), {
							[1] = "Default",
							[2] = "Custom"
						}):depend({
							[1] = team,
							[2] = k2
						}, {
							[1] = state,
							[2] = v
						}, {
							[1] = t66.select,
							[2] = function()
								-- upvalues: t66 (copy), k (copy)
								return t66.select:get(k)
							end
						})

						local v99 = v91.choke:create()

						v91.custom_choke = v99:switch(t4.text("gear", "Custom Timings")):depend({
							[1] = team,
							[2] = k2
						}, {
							[1] = state,
							[2] = v
						}, {
							[1] = nil,
							[2] = "Custom",
							[1] = v91.choke
						})
						v91.choke_slider = v99:slider(t4.text("hourglass", "Timing"), 2, 22, 16, 1, function(p50)
							if p50 ~= 16 then
								if p50 ~= 2 then
									return p50 .. "t"
								end

								return "fast"
							end

							return "NL"
						end):depend({
							[1] = team,
							[2] = k2
						}, {
							[1] = state,
							[2] = v
						}, {
							[1] = nil,
							[2] = "Custom",
							[1] = v91.choke
						}, {
							[1] = nil,
							[2] = false,
							[1] = v91.custom_choke
						})
						v91.choke_randomize = v99:slider(t4.text("shuffle", "Randomize"), 0, 100, 0, 1, "%"):depend({
							[1] = team,
							[2] = k2
						}, {
							[1] = state,
							[2] = v
						}, {
							[1] = nil,
							[2] = "Custom",
							[1] = v91.choke
						}, {
							[1] = nil,
							[2] = false,
							[1] = v91.custom_choke
						})
						v91.choke_method = v99:combo(t4.text("calculator", "Method"), {
							[1] = "Random",
							[2] = "Sequential"
						}):depend({
							[1] = team,
							[2] = k2
						}, {
							[1] = state,
							[2] = v
						}, {
							[1] = nil,
							[2] = "Custom",
							[1] = v91.choke
						}, {
							[1] = nil,
							[2] = true,
							[1] = v91.custom_choke
						})
						v91.choke_from = v99:slider(t4.text("dice-one", "Choke from"), 1, 22, 16, 1, function(p51)
							if p51 ~= 16 then
								if p51 ~= 2 then
									return p51 .. "t"
								end

								return "fast"
							end

							return "NL"
						end):depend({
							[1] = team,
							[2] = k2
						}, {
							[1] = state,
							[2] = v
						}, {
							[1] = nil,
							[2] = "Custom",
							[1] = v91.choke
						}, {
							[1] = nil,
							[2] = true,
							[1] = v91.custom_choke
						}, {
							[1] = nil,
							[2] = "Random",
							[1] = v91.choke_method
						})
						v91.choke_to = v99:slider(t4.text("dice-six", "Choke to"), 1, 22, 16, 1, function(p52)
							if p52 ~= 16 then
								if p52 ~= 2 then
									return p52 .. "t"
								end

								return "fast"
							end

							return "NL"
						end):depend({
							[1] = team,
							[2] = k2
						}, {
							[1] = state,
							[2] = v
						}, {
							[1] = nil,
							[2] = "Custom",
							[1] = v91.choke
						}, {
							[1] = nil,
							[2] = true,
							[1] = v91.custom_choke
						}, {
							[1] = nil,
							[2] = "Random",
							[1] = v91.choke_method
						})
						v91.choke_sliders = v99:slider(t4.text("", "Sliders"), 2, 12, 2):depend({
							[1] = team,
							[2] = k2
						}, {
							[1] = state,
							[2] = v
						}, {
							[1] = nil,
							[2] = "Custom",
							[1] = v91.choke
						}, {
							[1] = nil,
							[2] = true,
							[1] = v91.custom_choke
						}, {
							[1] = nil,
							[2] = "Sequential",
							[1] = v91.choke_method
						})

						for i = 1, 12 do
							v91["choke1_" .. i] = v99:slider(t4.text(("%s"):format(i), "Timing"), 1, 22, 0, 1, function(p53)
								if p53 ~= 16 then
									if p53 ~= 2 then
										return p53 .. "t"
									end

									return "fast"
								end

								return "NL"
							end):depend({
								[1] = team,
								[2] = k2
							}, {
								[1] = state,
								[2] = v
							}, {
								[1] = nil,
								[2] = "Custom",
								[1] = v91.choke
							}, {
								[1] = nil,
								[2] = true,
								[1] = v91.custom_choke
							}, {
								[1] = nil,
								[2] = "Sequential",
								[1] = v91.choke_method
							}, {
								[1] = v91.choke_sliders,
								[2] = function()
									-- upvalues: i (copy), v91 (copy)
									if not (i <= 2) then
										return not (v91.choke_sliders.value < i)
									end

									return true
								end
							})
						end

						t67[v][v2] = v91
						t65.builder = t67
					end
				end

				local t71 = {
					switch = v83:switch(t4.text("eye-slash", "Freestanding"))
				}
				local v102 = t71.switch:create()

				t71.prefer_manual = v102:switch(t4.text("check", "Prefer Manual"))

				local t72 = {}

				for i = 1, #t37 do
					t72[i] = t37[i]
				end

				table.remove(t72, 9)
				t71.disablers = v102:selectable(t4.text("power-off", "Disablers"), t72)
				t71.body_fs = v102:switch(t4.text("people-arrows", "Body Freestanding"))
				t71.yaw_mod = v102:switch(t4.text("left-right", "Disable Yaw Modifiers"))
				t65.freestanding = t71

				local t73 = {
					switch = v83:switch(t4.text("brain", "Anti Bruteforce"), false, "Anti-bruteforce with automatic preset to avoid headshot.")
				}
				local v106 = t73.switch:create()

				t73.states = v106:selectable(t4.text("person", "States"), t37):depend({
					[1] = nil,
					[2] = true,
					[1] = t73.switch
				})
				t73.timeout = v106:slider(t4.text("hourglass", "Timeout"), 5, 100, 30, 0.1, "s"):depend({
					[1] = nil,
					[2] = true,
					[1] = t73.switch
				}, {
					[1] = nil,
					[2] = true,
					[1] = t73.states
				})
				t73.mode = v106:combo(t4.text("arrows-repeat", "Mode"), {
					[1] = "Increasing",
					[2] = "Decreasing",
					[3] = "Alternating",
					[4] = "Meta"
				}):depend({
					[1] = nil,
					[2] = true,
					[1] = t73.switch
				}, {
					[1] = nil,
					[2] = true,
					[1] = t73.states
				})
				t73.notify = v106:switch(t4.text("alarm-exclamation", "Notify")):depend({
					[1] = nil,
					[2] = true,
					[1] = t73.switch
				}, {
					[1] = nil,
					[2] = true,
					[1] = t73.states
				})
				t65.anti_bruteforce = t73
				t57.angles = t65
				t6.antiaim = t57
			end

			local t74 = {}
			local t75 = {}
			local v109 = pui.create("\v\f<gear>", "Helpers", 2)
			local t76 = {
				label = v109:label(t4.text("wheelchair", "Fake Duck Settings"))
			}
			local v111 = t76.label:create()

			t76.freeze_period = v111:switch(t4.text("snowflake", "Unlock Freezetime"), false, "Allows you to fakeduck before the round start.")
			t76.unlock = v111:switch(t4.text("wheelchair-move", "Unlock Speed"), false, "Allows you to move a considerably faster while fake ducking.")
			t75.fakeduck = t76

			local t77 = {
				switch = v109:switch(t4.text("person-running", "Auto Switch \a565656FF[bind]"), false, "Automatically switches to your\nselected weapon when the\nenemy does the selected actions")
			}
			local v113 = t77.switch:create()

			t77.triggers = v113:selectable("Triggers", {
				[1] = "Enemy Shot",
				[2] = "Enemy Switch"
			})
			t77.weapon_select = v113:combo("Target Weapon", {
				[1] = "ssg08",
				[2] = "taser"
			})
			t77.distance_slider = v113:slider("Range Limit", 0, 1000, 500, true, "u")
			t75.autoswitch = t77
			t75.fall_damage = v109:switch(t4.text("person-falling-burst", "Avoid Fall Damage"), false, "Attempts to perform a jumpbug\nwhen possible.\n\nThis is a 1:1 replica from game\a7a9809ffsense\r")
			t75.fast_ladder = v109:switch(t4.text("water-ladder", "Fast Ladder"), false, "- Abuses the ladder movement\nmechanic and makes you move a\nlittle faster")
			t74.helpers = t75

			local v114 = pui.create("\v\f<gear>", "Misc", 2)
			local t78 = {}
			local t79 = {
				switch = v114:switch(t4.text("blanket", "Log Events"))
			}
			local v117 = t79.switch:create()
			local t80 = {
				select = v117:selectable("Events", {
					[1] = "Aimbot",
					[2] = "Connection problems",
					[3] = "Low FPS"
				}):depend({
					[1] = nil,
					[2] = true,
					[1] = t79.switch
				})
			}

			t79.mode = t80
			t79.customization = {
				prefix = v117:input("Prefix", "lcsense"):depend({
					[1] = nil,
					[2] = true,
					[1] = t79.switch
				}, {
					[1] = nil,
					[2] = "Aimbot",
					[1] = t80.select
				})
			}
			t79.colors = {
				hit = v117:color_picker(t4.text(s4, "Hit Color"), "5851E0FF"):depend({
					[1] = nil,
					[2] = true,
					[1] = t79.switch
				}, {
					[1] = nil,
					[2] = "Aimbot",
					[1] = t80.select
				}),
				miss = v117:color_picker(t4.text(s4, "Miss Color"), "E35F5FFF"):depend({
					[1] = nil,
					[2] = true,
					[1] = t79.switch
				}, {
					[1] = nil,
					[2] = "Aimbot",
					[1] = t80.select
				})
			}
			t78.logging = t79

			local t81 = {
				switch = v114:switch(t4.text("chart-line", "Unlock Fake Latency"), false, "Allows you to use maximum Fake Latency (200-300)")
			}
			local sv_maxunlag = cvar.sv_maxunlag

			local function v121()
				-- upvalues: sv_maxunlag (copy), v44 (copy)
				sv_maxunlag:float(v44(sv_maxunlag))
			end

			t81.switch:set_callback(function()
				-- upvalues: t81 (copy), v121 (copy), sv_maxunlag (copy)
				if t81.switch:get() then
					sv_maxunlag:float(2)

					return
				end

				return v121()
			end, true)
			t74.latency = t81
			t74.misc = t78

			local t82 = {}
			local v123 = v114:label(t4.text("person-circle-exclamation", "Player animations")):create()

			t82.interpolation = ({
				slidy = v123:slider(t4.text("code-pull-request-draft", "Interpolate"), 0, 14, 9, nil, function(p54)
					if p54 ~= 0 then
						if p54 ~= 9 then
							if p54 ~= 14 then
								return p54 .. "t"
							end

							return "High"
						end

						return "Medium"
					end

					return "Default"
				end, "Makes the game feel smoother by disabling specific engine mechanics that make the game reset the interpolation.")
			}).slidy

			local t83 = {
				switch = v123:switch(t4.text("ghost", "Jitter Legs"))
			}

			t83.from = v123:slider("From", 0, 100, 0, 0.01, "x"):depend({
				[1] = nil,
				[2] = true,
				[1] = t83.switch
			})
			t83.to = v123:slider("To", 0, 100, 0, 0.01, "x"):depend({
				[1] = nil,
				[2] = true,
				[1] = t83.switch
			})
			t82.jitter_legs = t83
			t82.leaning = {
				value = v123:slider(t4.text("person-walking-arrow-right", "Move lean"), -1, 100, 50, 1, function(p55)
					if p55 ~= -1 then
						return p55 .. "%"
					end

					return "Off"
				end)
			}
			t82.falling = {
				value = v123:slider(t4.text("person-falling", "Fall legs"), -1, 100, 50, 1, function(p56)
					if p56 ~= -1 then
						return p56 .. "%"
					end

					return "Off"
				end)
			}
			t82.skeet = {
				enables = v123:selectable(t4.text("\aDEFAULTG\a95b806ffS", "Fucker"), {
					[1] = "Ground",
					[2] = "Air"
				})
			}
			t74.player_animations = t82
			t6.misc = t74
			t84 = {}
			v126 = pui.create("\v\f<gear>", "Visuals", 1)

			local t85 = {
				options = v126:selectable(t4.text("filter", "Local Addons"), {
					[1] = "Remove Sleeves",
					[2] = "Keep Model Transparency",
					[3] = "Real Skybox"
				})
			}

			t85.skybox = t85.options:create():combo(t4.text("", "Skybox"), {
				[1] = "Night",
				[2] = "Night (2)",
				[3] = "Night (Flat)",
				[4] = "Clouds",
				[5] = "Clouds (2)",
				[6] = "Clouds (Dark)",
				[7] = "Daylight",
				[8] = "Daylight (2)",
				[9] = "Baggage",
				[10] = "Tibet",
				[11] = "Canals",
				[12] = "Assault",
				[13] = "Vertigo",
				[14] = "Italy",
				[15] = "Aztec",
				[16] = "Monastery",
				[17] = "Gray",
				[18] = "Clear",
				[19] = "Cobblestone",
				[20] = "Rainy",
				[21] = "Dusty"
			}):depend({
				[1] = t85.options,
				[2] = function()
					-- upvalues: t85 (copy)
					return t85.options:get("Real Skybox")
				end
			})
			t84.addons = t85.options
			t84.skybox = t85.skybox

			local t86 = {
				select = v126:selectable(t4.text("marker", "Hit Marker"), {
					[1] = "2D",
					[2] = "3D"
				})
			}
			local v129 = t86.select:create()

			t86.color = v129:color_picker("Color", {
				["2D"] = { color(255) },
				["3D"] = { color(255) }
			}):depend({
				[1] = nil,
				[2] = true,
				[1] = t86.select
			})
			t86.time = v129:slider("Duration", 0, 100, 1, 0.1, "s"):depend({
				[1] = nil,
				[2] = true,
				[1] = t86.select
			})
			t84.hitmarker = t86

			local t87 = {
				switch = v126:switch(t4.text("desktop", "Aspect Ratio"))
			}

			t87.value = t87.switch:create():slider(t4.text("⤷", "Value"), 1, 200, 133, 0.01, function(p57)
				if p57 ~= 133 then
					if p57 ~= 160 then
						if p57 ~= 150 then
							if p57 ~= 133 then
								if p57 ~= 125 then
									return nil
								end

								return "5:4"
							end

							return "4:3"
						end

						return "3:2"
					end

					return "16:10"
				end

				return "4:3"
			end)

			local r_aspectratio = cvar.r_aspectratio

			local function v132()
				-- upvalues: r_aspectratio (copy), v44 (copy)
				r_aspectratio:float(v44(r_aspectratio))
			end
			local function v133()
				-- upvalues: t87 (copy), v132 (copy), r_aspectratio (copy)
				if t87.switch:get() then
					local v393 = t87.value:get() * 0.01

					r_aspectratio:float(v393, true)

					return
				end

				return v132()
			end

			t87.switch:set_callback(v133, true)
			t87.value:set_callback(v133)
			events.shutdown(v132)
			t84.aspect_ratio = t87

			local t88 = {
				switch = v126:switch(t4.text("star", "Better Scope Overlay"))
			}
			local v135 = t88.switch:create()

			t88.options = v135:selectable("Options", {
				[1] = "Rotation",
				[2] = "Inverted"
			}):depend({
				[1] = nil,
				[2] = true,
				[1] = t88.switch
			})
			t88.animation = v135:switch(t4.text(s4, "Animated")):depend({
				[1] = nil,
				[2] = true,
				[1] = t88.switch
			}):depend({
				[1] = nil,
				[2] = "Rotation",
				[1] = t88.options
			})
			t88.length = v135:slider("Length", 10, 300, 185):depend({
				[1] = nil,
				[2] = true,
				[1] = t88.switch
			})
			t88.gap = v135:slider("Gap", 1, 300, 5):depend({
				[1] = nil,
				[2] = true,
				[1] = t88.switch
			})
			t88.colors = {
				main = v135:color_picker("Main Accent", color(255)):depend({
					[1] = nil,
					[2] = true,
					[1] = t88.switch
				}),
				edge = v135:color_picker("Edge Accent", color(0)):depend({
					[1] = nil,
					[2] = true,
					[1] = t88.switch
				})
			}
			t84.scope_overlay = t88

			local t89 = {
				switch = v126:switch(t4.text("up-down-left-right", "Manual Arrows"))
			}
			local v137 = t89.switch:create()

			t89.font = v137:combo("Font", {
				[1] = "Default",
				[2] = "Small",
				[3] = "Console",
				[4] = "Bold"
			}):depend({
				[1] = nil,
				[2] = true,
				[1] = t89.switch
			})
			t89.color = v137:color_picker("Color", color()):depend({
				[1] = nil,
				[2] = true,
				[1] = t89.switch
			})
			t89.offset = v137:slider("Offset", 0, 200, 35):depend({
				[1] = nil,
				[2] = true,
				[1] = t89.switch
			})
			t89.symbols = {
				left = v137:input("Left Symbol", "力量"):depend({
					[1] = nil,
					[2] = true,
					[1] = t89.switch
				}),
				right = v137:input("Right Symbol", "力量"):depend({
					[1] = nil,
					[2] = true,
					[1] = t89.switch
				}),
				forward = v137:input("Forward Symbol", "力量"):depend({
					[1] = nil,
					[2] = true,
					[1] = t89.switch
				})
			}
			t84.manual_arrows = t89
			t90 = {
				switch = v126:switch(t4.text("person-military-pointing", "Viewmodel Changer"))
			}

			local v139 = t90.switch:create()

			t90.fov = v139:slider(t4.text("eye", "FOV"), 0, 1000, 680, 0.1):depend({
				[1] = nil,
				[2] = true,
				[1] = t90.switch
			})
			t90.x = v139:slider(t4.text("X", "Offset"), -100, 100, 0, 0.1):depend({
				[1] = nil,
				[2] = true,
				[1] = t90.switch
			})
			t90.y = v139:slider(t4.text("Y", "Offset"), -100, 100, 0, 0.1):depend({
				[1] = nil,
				[2] = true,
				[1] = t90.switch
			})
			t90.z = v139:slider(t4.text("Z", "Offset"), -100, 100, 0, 0.1):depend({
				[1] = nil,
				[2] = true,
				[1] = t90.switch
			})
			t90.left = v139:switch(t4.text("gun", "Left hand"), false):depend({
				[1] = nil,
				[2] = true,
				[1] = t90.switch
			})
			t90.restore = v139:button("                              \v\f<arrow-rotate-left>\r Revert                              ", nil, true):depend({
				[1] = nil,
				[2] = true,
				[1] = t90.switch
			})
		end

		local viewmodel_fov = cvar.viewmodel_fov
		local viewmodel_offset_x = cvar.viewmodel_offset_x
		local viewmodel_offset_y = cvar.viewmodel_offset_y
		local viewmodel_offset_z = cvar.viewmodel_offset_z
		local cl_righthand = cvar.cl_righthand

		local function v145()
			-- upvalues: viewmodel_fov (copy), v44 (copy), viewmodel_offset_x (copy), viewmodel_offset_y (copy), viewmodel_offset_z (copy)
			viewmodel_fov:float(v44(viewmodel_fov), false)
			viewmodel_offset_x:float(v44(viewmodel_offset_x), false)
			viewmodel_offset_y:float(v44(viewmodel_offset_y), false)
			viewmodel_offset_z:float(v44(viewmodel_offset_z), false)
		end
		local function v146()
			-- upvalues: t90 (copy), v145 (copy), viewmodel_fov (copy), viewmodel_offset_x (copy), viewmodel_offset_y (copy), viewmodel_offset_z (copy), cl_righthand (copy)
			if t90.switch:get() then
				local v400 = t90.x:get()
				local v401 = t90.y:get()
				local v402 = t90.z:get()
				local v403 = t90.fov:get()
				local v404 = t90.left:get()

				viewmodel_fov:float(v403 * 0.1, true)
				viewmodel_offset_x:float(v400 * 0.1, true)
				viewmodel_offset_y:float(v401 * 0.1, true)
				viewmodel_offset_z:float(v402 * 0.1, true)
				cl_righthand:float(v404 and 0 or 1, true)

				return
			end

			return v145()
		end

		t90.switch:set_callback(v146, true)
		t90.x:set_callback(v146)
		t90.y:set_callback(v146)
		t90.z:set_callback(v146)
		t90.left:set_callback(v146)
		t90.restore:set_callback(function()
			-- upvalues: t90 (copy), v44 (copy), viewmodel_offset_x (copy), viewmodel_offset_y (copy), viewmodel_offset_z (copy), viewmodel_fov (copy), cl_righthand (copy)
			local x = t90.x
			local y = t90.y
			local z = t90.z
			local fov = t90.fov
			local left = t90.left

			x:set(v44(viewmodel_offset_x) * 10)
			y:set(v44(viewmodel_offset_y) * 10)
			z:set(v44(viewmodel_offset_z) * 10)
			fov:set(v44(viewmodel_fov) * 10)
			left:set(v44(cl_righthand) == 0)
		end)
		t90.fov:set_callback(v146)
		events.shutdown(v145)
		t84.viewmodel_changer = t90

		local t91 = {
			switch = v126:switch(t4.text("paintbrush", "Game\a95b806ffsense\r Indicators"))
		}
		local v148 = t91.switch:create()

		t91.bomb = v148:switch("Bomb"):depend({
			[1] = nil,
			[2] = true,
			[1] = t91.switch
		})
		t91.features = v148:selectable("Feature indicators", {
			[1] = "Force safe point",
			[2] = "Force body aim",
			[3] = "Ping spike",
			[4] = "Double tap",
			[5] = "Duck peek assist",
			[6] = "Freestanding",
			[7] = "On shot anti-aim",
			[8] = "Minimum damage override",
			[9] = "Hitchance override",
			[10] = "Dormant aimbot"
		}):depend({
			[1] = nil,
			[2] = true,
			[1] = t91.switch
		})
		t84.skeet_indicators = t91

		local t92 = {
			switch = v126:switch(t4.text("person-running", "Velocity Warning"))
		}

		t92.color = t92.switch:color_picker("Color"):depend({
			[1] = nil,
			[2] = true,
			[1] = t92.switch
		})
		t84.velocity_warning = t92

		local t93 = {
			switch = v126:switch(t4.text("person-circle-exclamation", "Damage Indicator"))
		}

		t93.min_only = t93.switch:create():switch(t4.text("⤷", "Mindmg Only")):depend({
			[1] = nil,
			[2] = true,
			[1] = t93.switch
		})
		t84.damage_indicator = t93
		t6.visuals = t84
		t94 = {
			update = function()
				-- upvalues: t4 (copy), realtime (copy), t6 (copy)
				if ui.get_alpha() ~= 0 then
					local v405 = t4.get_formatted_time(globals.realtime - realtime)

					t6.info.stats.session:name(string.format("\v%s", v405))

					return
				end
			end
		}

		function t7.new(p58, p59, p60)
			-- upvalues: t4 (copy), v45 (copy)
			local v409 = ({
				alpha = 0,
				text = p58,
				duration = globals.realtime + 3,
				color = p59 or ui.get_style()["Link Active"],
				icon = p60 or "bolt"
			}).color or color(255)

			common.add_event(t4.text_colored((function()
				-- upvalues: p58 (copy), v409 (copy)
				local t95 = {}

				for k, v in pairs(p58) do
					local v1061 = v or ""

					table.insert(t95, {
						[1] = v1061,
						[2] = k % 2 == 0 and v409 or color(255)
					})
				end

				return unpack(t95)
			end)()))
			v45(t4.text_colored((function()
				-- upvalues: p58 (copy), v409 (copy)
				local t96 = {}

				for k, v in pairs(p58) do
					local v1065 = v or ""

					table.insert(t96, {
						[1] = v1065,
						[2] = k % 2 == 0 and v409 or color(255)
					})
				end

				return unpack(t96)
			end)()))
		end

		local s6 = "densityhvhfrostluaidfk"
		local v153 = db[s6] or {}
		local t97 = {
			[1] = {
				data = "eyJhdXRob3IiOiJWXzEiLCJjb25maWciOiJleUpoYm5ScFlXbHRJanA3SW1GdVoyeGxjeUk2ZXlKaGJuUnBYMkp5ZFhSbFptOXlZMlVpT25zaWJXOWtaU0k2SWsxbGRHRWlMQ0p1YjNScFpua2lPbVpoYkhObExDSnpkR0YwWlhNaU9sc2lVM1JoYm1ScGJtY2lMQ0pTZFc1dWFXNW5JaXdpVTJ4dmQybHVaeUlzSWtOeWIzVmphR2x1WnlJc0lsTnVaV0ZyYVc1bklpd2lRV2x5SWl3aVFXbHlJRU55YjNWamFHbHVaeUlzSWt4bFoybDBJRUZCSWl3aWZpSmRMQ0p6ZDJsMFkyZ2lPblJ5ZFdVc0luUnBiV1Z2ZFhRaU9qTXdMakI5TENKaWNtVmhhMTlzWXlJNmV5SmthWE5oWW14bFgyOXVYMmR5Wlc1aFpHVWlPblJ5ZFdVc0ltaHBaR1ZmYzJodmRITWlPaUpDY21WaGF5Qk1ReUlzSW5ObGJHVmpkQ0k2V3lKVGRHRnVaR2x1WnlJc0lsSjFibTVwYm1jaUxDSlRiRzkzYVc1bklpd2lRM0p2ZFdOb2FXNW5JaXdpVTI1bFlXdHBibWNpTENKQmFYSWlMQ0pCYVhJZ1EzSnZkV05vYVc1bklpd2lUR1ZuYVhRZ1FVRWlMQ0pHY21WbGMzUmhibVJwYm1jaUxDSitJbDE5TENKaWRXbHNaR1Z5SWpwN0lrRnBjaUk2ZXlKRFZDSTZleUppYjJSNVgyWnlaV1Z6ZEdGdVpHbHVaeUk2SWs5bVppSXNJbUp2WkhsZmVXRjNJanAwY25WbExDSmliMlI1WDNsaGQxOXZjSFJwYjI1eklqcGJJa3BwZEhSbGNpSXNJbjRpWFN3aVkyaHZhMlVpT2lKRVpXWmhkV3gwSWl3aVkyaHZhMlV4WHpFaU9qSXVNQ3dpWTJodmEyVXhYeklpT2pJdU1Dd2lZMmh2YTJVeFh6TWlPakl1TUN3aVkyaHZhMlV4WHpRaU9qSXVNQ3dpWTJodmEyVXhYelVpT2pJdU1Dd2lZMmh2YTJVeFh6WWlPakl1TUN3aVkyaHZhMlZmWm5KdmJTSTZNVFl1TUN3aVkyaHZhMlZmYldWMGFHOWtJam9pVW1GdVpHOXRJaXdpWTJodmEyVmZjMnhwWkdWeUlqb3hOaTR3TENKamFHOXJaVjl6Ykdsa1pYSnpJam95TGpBc0ltTm9iMnRsWDNSdklqb3hOaTR3TENKamRYTjBiMjFmWTJodmEyVWlPbVpoYkhObExDSmtaV3hoZVNJNmRISjFaU3dpWkdWc1lYbGZNU0k2TWk0d0xDSmtaV3hoZVY4eUlqb3dMakFzSW1SbGJHRjVYek1pT2pBdU1Dd2laR1ZzWVhsZk5DSTZNQzR3TENKa1pXeGhlVjgxSWpveUxqQXNJbVJsYkdGNVh6WWlPakl1TUN3aVpHVnNZWGxmWTNWemRHOXRYM05zYVdSbGNuTWlPakl1TUN3aVpHVnNZWGxmWkdWbVlYVnNkQ0k2T1M0d0xDSmtaV3hoZVY5c2IyZHBZeUk2SWtSbFptRjFiSFFpTENKa1pXeGhlVjl0WlhSb2IyUWlPaUpFWldaaGRXeDBJaXdpWkdWc1lYbGZjbUZ1Wkc5dFgyMWhlQ0k2TWk0d0xDSmtaV3hoZVY5eVlXNWtiMjFmYldsdUlqb3lMakFzSW1aeWIyMWZiR2x0YVhRaU9qWXdMakFzSW14bFpuUmZiR2x0YVhRaU9qWXdMakFzSW14cGJXbDBYMjF2WkdVaU9pSlRkR0YwYVdNaUxDSnRZWGdpT2pBdU1Dd2liV0Y0YVcxMWJWOXNhVzFwZENJNk5qQXVNQ3dpYldsdUlqb3dMakFzSW0xcGJtbHRkVzFmYkdsdGFYUWlPall3TGpBc0ltMXZaR1VpT2lKVGRHRjBhV01pTENKdGIyUmxYM0poYm1SdmJTSTZOQzR3TENKdGIyUmxYM1JwWTJ0eklqbzBMakFzSW0xdlpHbG1hV1Z5SWpvaVJHbHpZV0pzWldRaUxDSnRiMlJwWm1sbGNsOWpkWE4wYjIxZmMyeHBaR1Z5Y3lJNk1pNHdMQ0p0YjJScFptbGxjbDl0YjJSbElqb2lSR1ZtWVhWc2RDSXNJbTF2WkdsbWFXVnlYMjltWm5ObGRDSTZMVEV6TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk1TSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpJaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh6SWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZOQ0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6VWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4Mklqb3dMakFzSW05bVpuTmxkQ0k2TUM0d0xDSnlZVzVrYjIxcGVtVWlPbVpoYkhObExDSnlhV2RvZEY5c2FXMXBkQ0k2TmpBdU1Dd2ljMkpmYzNCbFpXUWlPakV1TUN3aWMybHVaWGRoZG1WZmMzQmxaV1FpT2pVdU1Dd2lkRzlmYkdsdGFYUWlPall3TGpBc0lubGhkMTlzWldaMElqb3RNakF1TUN3aWVXRjNYMjF2WkdVaU9qSXVNQ3dpZVdGM1gzSnBaMmgwSWpvME1pNHdmU3dpVkNJNmV5SmliMlI1WDJaeVpXVnpkR0Z1WkdsdVp5STZJazltWmlJc0ltSnZaSGxmZVdGM0lqcDBjblZsTENKaWIyUjVYM2xoZDE5dmNIUnBiMjV6SWpwYklrcHBkSFJsY2lJc0luNGlYU3dpWTJodmEyVWlPaUpFWldaaGRXeDBJaXdpWTJodmEyVXhYekVpT2pJdU1Dd2lZMmh2YTJVeFh6SWlPakl1TUN3aVkyaHZhMlV4WHpNaU9qSXVNQ3dpWTJodmEyVXhYelFpT2pJdU1Dd2lZMmh2YTJVeFh6VWlPakl1TUN3aVkyaHZhMlV4WHpZaU9qSXVNQ3dpWTJodmEyVmZabkp2YlNJNk1UWXVNQ3dpWTJodmEyVmZiV1YwYUc5a0lqb2lVbUZ1Wkc5dElpd2lZMmh2YTJWZmMyeHBaR1Z5SWpveE5pNHdMQ0pqYUc5clpWOXpiR2xrWlhKeklqb3lMakFzSW1Ob2IydGxYM1J2SWpveE5pNHdMQ0pqZFhOMGIyMWZZMmh2YTJVaU9tWmhiSE5sTENKa1pXeGhlU0k2ZEhKMVpTd2laR1ZzWVhsZk1TSTZNaTR3TENKa1pXeGhlVjh5SWpvd0xqQXNJbVJsYkdGNVh6TWlPakF1TUN3aVpHVnNZWGxmTkNJNk1DNHdMQ0prWld4aGVWODFJam95TGpBc0ltUmxiR0Y1WHpZaU9qSXVNQ3dpWkdWc1lYbGZZM1Z6ZEc5dFgzTnNhV1JsY25NaU9qSXVNQ3dpWkdWc1lYbGZaR1ZtWVhWc2RDSTZOeTR3TENKa1pXeGhlVjlzYjJkcFl5STZJa1JsWm1GMWJIUWlMQ0prWld4aGVWOXRaWFJvYjJRaU9pSkVaV1poZFd4MElpd2laR1ZzWVhsZmNtRnVaRzl0WDIxaGVDSTZNaTR3TENKa1pXeGhlVjl5WVc1a2IyMWZiV2x1SWpveUxqQXNJbVp5YjIxZmJHbHRhWFFpT2pZd0xqQXNJbXhsWm5SZmJHbHRhWFFpT2pZd0xqQXNJbXhwYldsMFgyMXZaR1VpT2lKVGRHRjBhV01pTENKdFlYZ2lPakF1TUN3aWJXRjRhVzExYlY5c2FXMXBkQ0k2TmpBdU1Dd2liV2x1SWpvd0xqQXNJbTFwYm1sdGRXMWZiR2x0YVhRaU9qWXdMakFzSW0xdlpHVWlPaUpUZEdGMGFXTWlMQ0p0YjJSbFgzSmhibVJ2YlNJNk5DNHdMQ0p0YjJSbFgzUnBZMnR6SWpvMExqQXNJbTF2WkdsbWFXVnlJam9pVTNCcGJpSXNJbTF2WkdsbWFXVnlYMk4xYzNSdmJWOXpiR2xrWlhKeklqb3lMakFzSW0xdlpHbG1hV1Z5WDIxdlpHVWlPaUpFWldaaGRXeDBJaXdpYlc5a2FXWnBaWEpmYjJabWMyVjBJam90TVRNdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxOHhJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk1pSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpNaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTgwSWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZOU0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6WWlPakF1TUN3aWIyWm1jMlYwSWpvd0xqQXNJbkpoYm1SdmJXbDZaU0k2Wm1Gc2MyVXNJbkpwWjJoMFgyeHBiV2wwSWpvMk1DNHdMQ0p6WWw5emNHVmxaQ0k2TVM0d0xDSnphVzVsZDJGMlpWOXpjR1ZsWkNJNk5TNHdMQ0owYjE5c2FXMXBkQ0k2TmpBdU1Dd2llV0YzWDJ4bFpuUWlPaTB5TWk0d0xDSjVZWGRmYlc5a1pTSTZNaTR3TENKNVlYZGZjbWxuYUhRaU9qUXhMakI5ZlN3aVFXbHlJRU55YjNWamFHbHVaeUk2ZXlKRFZDSTZleUppYjJSNVgyWnlaV1Z6ZEdGdVpHbHVaeUk2SWs5bVppSXNJbUp2WkhsZmVXRjNJanAwY25WbExDSmliMlI1WDNsaGQxOXZjSFJwYjI1eklqcGJJa3BwZEhSbGNpSXNJbjRpWFN3aVkyaHZhMlVpT2lKRGRYTjBiMjBpTENKamFHOXJaVEZmTVNJNk5pNHdMQ0pqYUc5clpURmZNaUk2TWpJdU1Dd2lZMmh2YTJVeFh6TWlPalF1TUN3aVkyaHZhMlV4WHpRaU9qRTBMakFzSW1Ob2IydGxNVjgxSWpvMUxqQXNJbU5vYjJ0bE1WODJJam8wTGpBc0ltTm9iMnRsWDJaeWIyMGlPakUyTGpBc0ltTm9iMnRsWDIxbGRHaHZaQ0k2SWxObGNYVmxiblJwWVd3aUxDSmphRzlyWlY5emJHbGtaWElpT2pFMkxqQXNJbU5vYjJ0bFgzTnNhV1JsY25NaU9qWXVNQ3dpWTJodmEyVmZkRzhpT2pFeUxqQXNJbU4xYzNSdmJWOWphRzlyWlNJNmRISjFaU3dpWkdWc1lYa2lPblJ5ZFdVc0ltUmxiR0Y1WHpFaU9qSXVNQ3dpWkdWc1lYbGZNaUk2TVM0d0xDSmtaV3hoZVY4eklqb3hMakFzSW1SbGJHRjVYelFpT2pFdU1Dd2laR1ZzWVhsZk5TSTZNaTR3TENKa1pXeGhlVjgySWpveUxqQXNJbVJsYkdGNVgyTjFjM1J2YlY5emJHbGtaWEp6SWpveUxqQXNJbVJsYkdGNVgyUmxabUYxYkhRaU9qWXVNQ3dpWkdWc1lYbGZiRzluYVdNaU9pSkVaV1poZFd4MElpd2laR1ZzWVhsZmJXVjBhRzlrSWpvaVJHVm1ZWFZzZENJc0ltUmxiR0Y1WDNKaGJtUnZiVjl0WVhnaU9qZ3VNQ3dpWkdWc1lYbGZjbUZ1Wkc5dFgyMXBiaUk2Tnk0d0xDSm1jbTl0WDJ4cGJXbDBJam8xT0M0d0xDSnNaV1owWDJ4cGJXbDBJam8yTUM0d0xDSnNhVzFwZEY5dGIyUmxJam9pVTNkcGRHTm9JaXdpYldGNElqb3dMakFzSW0xaGVHbHRkVzFmYkdsdGFYUWlPall3TGpBc0ltMXBiaUk2TFRFMUxqQXNJbTFwYm1sdGRXMWZiR2x0YVhRaU9qWXdMakFzSW0xdlpHVWlPaUpUZEdGMGFXTWlMQ0p0YjJSbFgzSmhibVJ2YlNJNk5DNHdMQ0p0YjJSbFgzUnBZMnR6SWpveE1TNHdMQ0p0YjJScFptbGxjaUk2SWxOd2FXNGlMQ0p0YjJScFptbGxjbDlqZFhOMGIyMWZjMnhwWkdWeWN5STZNaTR3TENKdGIyUnBabWxsY2w5dGIyUmxJam9pUkdWbVlYVnNkQ0lzSW0xdlpHbG1hV1Z5WDI5bVpuTmxkQ0k2TFRFd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZNU0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6SWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4eklqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTkNJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYelVpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxODJJam93TGpBc0ltOW1abk5sZENJNk1DNHdMQ0p5WVc1a2IyMXBlbVVpT25SeWRXVXNJbkpwWjJoMFgyeHBiV2wwSWpvMk1DNHdMQ0p6WWw5emNHVmxaQ0k2TVM0d0xDSnphVzVsZDJGMlpWOXpjR1ZsWkNJNk5TNHdMQ0owYjE5c2FXMXBkQ0k2TlRndU1Dd2llV0YzWDJ4bFpuUWlPaTB5TlM0d0xDSjVZWGRmYlc5a1pTSTZNaTR3TENKNVlYZGZjbWxuYUhRaU9qUXlMakI5TENKVUlqcDdJbUp2WkhsZlpuSmxaWE4wWVc1a2FXNW5Jam9pVDJabUlpd2lZbTlrZVY5NVlYY2lPblJ5ZFdVc0ltSnZaSGxmZVdGM1gyOXdkR2x2Ym5NaU9sc2lTbWwwZEdWeUlpd2lmaUpkTENKamFHOXJaU0k2SWtOMWMzUnZiU0lzSW1Ob2IydGxNVjh4SWpvMkxqQXNJbU5vYjJ0bE1WOHlJam95TWk0d0xDSmphRzlyWlRGZk15STZOQzR3TENKamFHOXJaVEZmTkNJNk1UUXVNQ3dpWTJodmEyVXhYelVpT2pVdU1Dd2lZMmh2YTJVeFh6WWlPalF1TUN3aVkyaHZhMlZmWm5KdmJTSTZNVFl1TUN3aVkyaHZhMlZmYldWMGFHOWtJam9pVTJWeGRXVnVkR2xoYkNJc0ltTm9iMnRsWDNOc2FXUmxjaUk2TVRZdU1Dd2lZMmh2YTJWZmMyeHBaR1Z5Y3lJNk5pNHdMQ0pqYUc5clpWOTBieUk2TVRJdU1Dd2lZM1Z6ZEc5dFgyTm9iMnRsSWpwMGNuVmxMQ0prWld4aGVTSTZkSEoxWlN3aVpHVnNZWGxmTVNJNk1pNHdMQ0prWld4aGVWOHlJam93TGpBc0ltUmxiR0Y1WHpNaU9qQXVNQ3dpWkdWc1lYbGZOQ0k2TUM0d0xDSmtaV3hoZVY4MUlqb3lMakFzSW1SbGJHRjVYellpT2pJdU1Dd2laR1ZzWVhsZlkzVnpkRzl0WDNOc2FXUmxjbk1pT2pJdU1Dd2laR1ZzWVhsZlpHVm1ZWFZzZENJNk5pNHdMQ0prWld4aGVWOXNiMmRwWXlJNklrUmxabUYxYkhRaUxDSmtaV3hoZVY5dFpYUm9iMlFpT2lKRVpXWmhkV3gwSWl3aVpHVnNZWGxmY21GdVpHOXRYMjFoZUNJNk9DNHdMQ0prWld4aGVWOXlZVzVrYjIxZmJXbHVJam8zTGpBc0ltWnliMjFmYkdsdGFYUWlPalU0TGpBc0lteGxablJmYkdsdGFYUWlPall3TGpBc0lteHBiV2wwWDIxdlpHVWlPaUpUZDJsMFkyZ2lMQ0p0WVhnaU9qQXVNQ3dpYldGNGFXMTFiVjlzYVcxcGRDSTZOakF1TUN3aWJXbHVJam90TVRVdU1Dd2liV2x1YVcxMWJWOXNhVzFwZENJNk5qQXVNQ3dpYlc5a1pTSTZJbE4wWVhScFl5SXNJbTF2WkdWZmNtRnVaRzl0SWpvMExqQXNJbTF2WkdWZmRHbGphM01pT2pFeExqQXNJbTF2WkdsbWFXVnlJam9pVTNCcGJpSXNJbTF2WkdsbWFXVnlYMk4xYzNSdmJWOXpiR2xrWlhKeklqb3lMakFzSW0xdlpHbG1hV1Z5WDIxdlpHVWlPaUpFWldaaGRXeDBJaXdpYlc5a2FXWnBaWEpmYjJabWMyVjBJam90TVRBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxOHhJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk1pSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpNaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTgwSWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZOU0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6WWlPakF1TUN3aWIyWm1jMlYwSWpvd0xqQXNJbkpoYm1SdmJXbDZaU0k2ZEhKMVpTd2ljbWxuYUhSZmJHbHRhWFFpT2pZd0xqQXNJbk5pWDNOd1pXVmtJam94TGpBc0luTnBibVYzWVhabFgzTndaV1ZrSWpvMUxqQXNJblJ2WDJ4cGJXbDBJam8xT0M0d0xDSjVZWGRmYkdWbWRDSTZMVEkxTGpBc0lubGhkMTl0YjJSbElqb3lMakFzSW5saGQxOXlhV2RvZENJNk5ESXVNSDE5TENKRGNtOTFZMmhwYm1jaU9uc2lRMVFpT25zaVltOWtlVjltY21WbGMzUmhibVJwYm1jaU9pSlBabVlpTENKaWIyUjVYM2xoZHlJNmRISjFaU3dpWW05a2VWOTVZWGRmYjNCMGFXOXVjeUk2V3lKS2FYUjBaWElpTENKK0lsMHNJbU5vYjJ0bElqb2lRM1Z6ZEc5dElpd2lZMmh2YTJVeFh6RWlPall1TUN3aVkyaHZhMlV4WHpJaU9qSXlMakFzSW1Ob2IydGxNVjh6SWpvMExqQXNJbU5vYjJ0bE1WODBJam94TkM0d0xDSmphRzlyWlRGZk5TSTZPUzR3TENKamFHOXJaVEZmTmlJNk5DNHdMQ0pqYUc5clpWOW1jbTl0SWpvNExqQXNJbU5vYjJ0bFgyMWxkR2h2WkNJNklsTmxjWFZsYm5ScFlXd2lMQ0pqYUc5clpWOXpiR2xrWlhJaU9qRTJMakFzSW1Ob2IydGxYM05zYVdSbGNuTWlPall1TUN3aVkyaHZhMlZmZEc4aU9qSXlMakFzSW1OMWMzUnZiVjlqYUc5clpTSTZkSEoxWlN3aVpHVnNZWGtpT25SeWRXVXNJbVJsYkdGNVh6RWlPakl1TUN3aVpHVnNZWGxmTWlJNk1DNHdMQ0prWld4aGVWOHpJam93TGpBc0ltUmxiR0Y1WHpRaU9qQXVNQ3dpWkdWc1lYbGZOU0k2TWk0d0xDSmtaV3hoZVY4Mklqb3lMakFzSW1SbGJHRjVYMk4xYzNSdmJWOXpiR2xrWlhKeklqb3lMakFzSW1SbGJHRjVYMlJsWm1GMWJIUWlPamN1TUN3aVpHVnNZWGxmYkc5bmFXTWlPaUpFWldaaGRXeDBJaXdpWkdWc1lYbGZiV1YwYUc5a0lqb2lSR1ZtWVhWc2RDSXNJbVJsYkdGNVgzSmhibVJ2YlY5dFlYZ2lPakV3TGpBc0ltUmxiR0Y1WDNKaGJtUnZiVjl0YVc0aU9qVXVNQ3dpWm5KdmJWOXNhVzFwZENJNk5qQXVNQ3dpYkdWbWRGOXNhVzFwZENJNk5UZ3VNQ3dpYkdsdGFYUmZiVzlrWlNJNklsTjBZWFJwWXlJc0ltMWhlQ0k2TUM0d0xDSnRZWGhwYlhWdFgyeHBiV2wwSWpvMk1DNHdMQ0p0YVc0aU9pMHhOUzR3TENKdGFXNXBiWFZ0WDJ4cGJXbDBJam8yTUM0d0xDSnRiMlJsSWpvaVUzUmhkR2xqSWl3aWJXOWtaVjl5WVc1a2IyMGlPalF1TUN3aWJXOWtaVjkwYVdOcmN5STZOQzR3TENKdGIyUnBabWxsY2lJNklsTndhVzRpTENKdGIyUnBabWxsY2w5amRYTjBiMjFmYzJ4cFpHVnljeUk2TXk0d0xDSnRiMlJwWm1sbGNsOXRiMlJsSWpvaVJHVm1ZWFZzZENJc0ltMXZaR2xtYVdWeVgyOW1abk5sZENJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYekVpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxOHlJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk15STZMVEUxTGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk5DSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpVaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTgySWpvd0xqQXNJbTltWm5ObGRDSTZNQzR3TENKeVlXNWtiMjFwZW1VaU9uUnlkV1VzSW5KcFoyaDBYMnhwYldsMElqbzFPQzR3TENKellsOXpjR1ZsWkNJNk1TNHdMQ0p6YVc1bGQyRjJaVjl6Y0dWbFpDSTZOUzR3TENKMGIxOXNhVzFwZENJNk5qQXVNQ3dpZVdGM1gyeGxablFpT2kweU55NHdMQ0o1WVhkZmJXOWtaU0k2TWk0d0xDSjVZWGRmY21sbmFIUWlPalF3TGpCOUxDSlVJanA3SW1KdlpIbGZabkpsWlhOMFlXNWthVzVuSWpvaVQyWm1JaXdpWW05a2VWOTVZWGNpT25SeWRXVXNJbUp2WkhsZmVXRjNYMjl3ZEdsdmJuTWlPbHNpZmlKZExDSmphRzlyWlNJNklrTjFjM1J2YlNJc0ltTm9iMnRsTVY4eElqbzJMakFzSW1Ob2IydGxNVjh5SWpveU1pNHdMQ0pqYUc5clpURmZNeUk2TkM0d0xDSmphRzlyWlRGZk5DSTZNVFF1TUN3aVkyaHZhMlV4WHpVaU9qa3VNQ3dpWTJodmEyVXhYellpT2pRdU1Dd2lZMmh2YTJWZlpuSnZiU0k2T0M0d0xDSmphRzlyWlY5dFpYUm9iMlFpT2lKVFpYRjFaVzUwYVdGc0lpd2lZMmh2YTJWZmMyeHBaR1Z5SWpveE5pNHdMQ0pqYUc5clpWOXpiR2xrWlhKeklqbzJMakFzSW1Ob2IydGxYM1J2SWpveU1pNHdMQ0pqZFhOMGIyMWZZMmh2YTJVaU9uUnlkV1VzSW1SbGJHRjVJanAwY25WbExDSmtaV3hoZVY4eElqb3lMakFzSW1SbGJHRjVYeklpT2pFdU1Dd2laR1ZzWVhsZk15STZNUzR3TENKa1pXeGhlVjgwSWpveExqQXNJbVJsYkdGNVh6VWlPakl1TUN3aVpHVnNZWGxmTmlJNk1pNHdMQ0prWld4aGVWOWpkWE4wYjIxZmMyeHBaR1Z5Y3lJNk1pNHdMQ0prWld4aGVWOWtaV1poZFd4MElqbzVMakFzSW1SbGJHRjVYMnh2WjJsaklqb2lSR1ZtWVhWc2RDSXNJbVJsYkdGNVgyMWxkR2h2WkNJNklrUmxabUYxYkhRaUxDSmtaV3hoZVY5eVlXNWtiMjFmYldGNElqb3hNQzR3TENKa1pXeGhlVjl5WVc1a2IyMWZiV2x1SWpvMUxqQXNJbVp5YjIxZmJHbHRhWFFpT2pZd0xqQXNJbXhsWm5SZmJHbHRhWFFpT2pZd0xqQXNJbXhwYldsMFgyMXZaR1VpT2lKVGRHRjBhV01pTENKdFlYZ2lPakF1TUN3aWJXRjRhVzExYlY5c2FXMXBkQ0k2TmpBdU1Dd2liV2x1SWpvdE1UVXVNQ3dpYldsdWFXMTFiVjlzYVcxcGRDSTZOakF1TUN3aWJXOWtaU0k2SWxOMFlYUnBZeUlzSW0xdlpHVmZjbUZ1Wkc5dElqbzBMakFzSW0xdlpHVmZkR2xqYTNNaU9qUXVNQ3dpYlc5a2FXWnBaWElpT2lKVGNHbHVJaXdpYlc5a2FXWnBaWEpmWTNWemRHOXRYM05zYVdSbGNuTWlPak11TUN3aWJXOWthV1pwWlhKZmJXOWtaU0k2SWtOMWMzUnZiU0lzSW0xdlpHbG1hV1Z5WDI5bVpuTmxkQ0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6RWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4eUlqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTXlJNkxURTFMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTkNJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYelVpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxODJJam93TGpBc0ltOW1abk5sZENJNk1DNHdMQ0p5WVc1a2IyMXBlbVVpT25SeWRXVXNJbkpwWjJoMFgyeHBiV2wwSWpvMk1DNHdMQ0p6WWw5emNHVmxaQ0k2TVM0d0xDSnphVzVsZDJGMlpWOXpjR1ZsWkNJNk5TNHdMQ0owYjE5c2FXMXBkQ0k2TmpBdU1Dd2llV0YzWDJ4bFpuUWlPaTB5Tnk0d0xDSjVZWGRmYlc5a1pTSTZNaTR3TENKNVlYZGZjbWxuYUhRaU9qUXdMakI5ZlN3aVJuSmxaWE4wWVc1a2FXNW5JanA3SWtOVUlqcDdJbUZzYkc5M1gzTjBZWFJsSWpwMGNuVmxMQ0ppYjJSNVgyWnlaV1Z6ZEdGdVpHbHVaeUk2SWs5bVppSXNJbUp2WkhsZmVXRjNJanAwY25WbExDSmliMlI1WDNsaGQxOXZjSFJwYjI1eklqcGJJa3BwZEhSbGNpSXNJbjRpWFN3aVkyaHZhMlVpT2lKRVpXWmhkV3gwSWl3aVkyaHZhMlV4WHpFaU9qSXVNQ3dpWTJodmEyVXhYeklpT2pJdU1Dd2lZMmh2YTJVeFh6TWlPakl1TUN3aVkyaHZhMlV4WHpRaU9qSXVNQ3dpWTJodmEyVXhYelVpT2pJdU1Dd2lZMmh2YTJVeFh6WWlPakl1TUN3aVkyaHZhMlZmWm5KdmJTSTZNVFl1TUN3aVkyaHZhMlZmYldWMGFHOWtJam9pVW1GdVpHOXRJaXdpWTJodmEyVmZjMnhwWkdWeUlqb3hOaTR3TENKamFHOXJaVjl6Ykdsa1pYSnpJam95TGpBc0ltTm9iMnRsWDNSdklqb3hOaTR3TENKamRYTjBiMjFmWTJodmEyVWlPbVpoYkhObExDSmtaV3hoZVNJNlptRnNjMlVzSW1SbGJHRjVYekVpT2pBdU1Dd2laR1ZzWVhsZk1pSTZNQzR3TENKa1pXeGhlVjh6SWpvd0xqQXNJbVJsYkdGNVh6UWlPakF1TUN3aVpHVnNZWGxmTlNJNk1DNHdMQ0prWld4aGVWODJJam93TGpBc0ltUmxiR0Y1WDJOMWMzUnZiVjl6Ykdsa1pYSnpJam95TGpBc0ltUmxiR0Y1WDJSbFptRjFiSFFpT2pBdU1Dd2laR1ZzWVhsZmJHOW5hV01pT2lKRVpXWmhkV3gwSWl3aVpHVnNZWGxmYldWMGFHOWtJam9pUkdWbVlYVnNkQ0lzSW1SbGJHRjVYM0poYm1SdmJWOXRZWGdpT2pBdU1Dd2laR1ZzWVhsZmNtRnVaRzl0WDIxcGJpSTZNQzR3TENKbWNtOXRYMnhwYldsMElqbzJNQzR3TENKc1pXWjBYMnhwYldsMElqbzJNQzR3TENKc2FXMXBkRjl0YjJSbElqb2lVM1JoZEdsaklpd2liV0Y0SWpvd0xqQXNJbTFoZUdsdGRXMWZiR2x0YVhRaU9qWXdMakFzSW0xcGJpSTZNQzR3TENKdGFXNXBiWFZ0WDJ4cGJXbDBJam8yTUM0d0xDSnRiMlJsSWpvaVUzUmhkR2xqSWl3aWJXOWtaVjl5WVc1a2IyMGlPalF1TUN3aWJXOWtaVjkwYVdOcmN5STZOQzR3TENKdGIyUnBabWxsY2lJNklrUnBjMkZpYkdWa0lpd2liVzlrYVdacFpYSmZZM1Z6ZEc5dFgzTnNhV1JsY25NaU9qSXVNQ3dpYlc5a2FXWnBaWEpmYlc5a1pTSTZJa1JsWm1GMWJIUWlMQ0p0YjJScFptbGxjbDl2Wm1aelpYUWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4eElqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTWlJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYek1pT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxODBJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk5TSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpZaU9qQXVNQ3dpYjJabWMyVjBJam93TGpBc0luSmhibVJ2YldsNlpTSTZabUZzYzJVc0luSnBaMmgwWDJ4cGJXbDBJam8yTUM0d0xDSnpZbDl6Y0dWbFpDSTZNUzR3TENKemFXNWxkMkYyWlY5emNHVmxaQ0k2TlM0d0xDSjBiMTlzYVcxcGRDSTZOakF1TUN3aWVXRjNYMnhsWm5RaU9qQXVNQ3dpZVdGM1gyMXZaR1VpT2pFdU1Dd2llV0YzWDNKcFoyaDBJam93TGpCOUxDSlVJanA3SW1Gc2JHOTNYM04wWVhSbElqcDBjblZsTENKaWIyUjVYMlp5WldWemRHRnVaR2x1WnlJNklrOW1aaUlzSW1KdlpIbGZlV0YzSWpwMGNuVmxMQ0ppYjJSNVgzbGhkMTl2Y0hScGIyNXpJanBiSWtwcGRIUmxjaUlzSW40aVhTd2lZMmh2YTJVaU9pSkVaV1poZFd4MElpd2lZMmh2YTJVeFh6RWlPakl1TUN3aVkyaHZhMlV4WHpJaU9qSXVNQ3dpWTJodmEyVXhYek1pT2pJdU1Dd2lZMmh2YTJVeFh6UWlPakl1TUN3aVkyaHZhMlV4WHpVaU9qSXVNQ3dpWTJodmEyVXhYellpT2pJdU1Dd2lZMmh2YTJWZlpuSnZiU0k2TVRZdU1Dd2lZMmh2YTJWZmJXVjBhRzlrSWpvaVVtRnVaRzl0SWl3aVkyaHZhMlZmYzJ4cFpHVnlJam94Tmk0d0xDSmphRzlyWlY5emJHbGtaWEp6SWpveUxqQXNJbU5vYjJ0bFgzUnZJam94Tmk0d0xDSmpkWE4wYjIxZlkyaHZhMlVpT21aaGJITmxMQ0prWld4aGVTSTZabUZzYzJVc0ltUmxiR0Y1WHpFaU9qQXVNQ3dpWkdWc1lYbGZNaUk2TUM0d0xDSmtaV3hoZVY4eklqb3dMakFzSW1SbGJHRjVYelFpT2pBdU1Dd2laR1ZzWVhsZk5TSTZNQzR3TENKa1pXeGhlVjgySWpvd0xqQXNJbVJsYkdGNVgyTjFjM1J2YlY5emJHbGtaWEp6SWpveUxqQXNJbVJsYkdGNVgyUmxabUYxYkhRaU9qQXVNQ3dpWkdWc1lYbGZiRzluYVdNaU9pSkVaV1poZFd4MElpd2laR1ZzWVhsZmJXVjBhRzlrSWpvaVJHVm1ZWFZzZENJc0ltUmxiR0Y1WDNKaGJtUnZiVjl0WVhnaU9qQXVNQ3dpWkdWc1lYbGZjbUZ1Wkc5dFgyMXBiaUk2TUM0d0xDSm1jbTl0WDJ4cGJXbDBJam8yTUM0d0xDSnNaV1owWDJ4cGJXbDBJam8yTUM0d0xDSnNhVzFwZEY5dGIyUmxJam9pVTNSaGRHbGpJaXdpYldGNElqb3dMakFzSW0xaGVHbHRkVzFmYkdsdGFYUWlPall3TGpBc0ltMXBiaUk2TUM0d0xDSnRhVzVwYlhWdFgyeHBiV2wwSWpvMk1DNHdMQ0p0YjJSbElqb2lVM1JoZEdsaklpd2liVzlrWlY5eVlXNWtiMjBpT2pRdU1Dd2liVzlrWlY5MGFXTnJjeUk2TkM0d0xDSnRiMlJwWm1sbGNpSTZJa1JwYzJGaWJHVmtJaXdpYlc5a2FXWnBaWEpmWTNWemRHOXRYM05zYVdSbGNuTWlPakl1TUN3aWJXOWthV1pwWlhKZmJXOWtaU0k2SWtSbFptRjFiSFFpTENKdGIyUnBabWxsY2w5dlptWnpaWFFpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxOHhJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk1pSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpNaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTgwSWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZOU0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6WWlPakF1TUN3aWIyWm1jMlYwSWpvd0xqQXNJbkpoYm1SdmJXbDZaU0k2Wm1Gc2MyVXNJbkpwWjJoMFgyeHBiV2wwSWpvMk1DNHdMQ0p6WWw5emNHVmxaQ0k2TVM0d0xDSnphVzVsZDJGMlpWOXpjR1ZsWkNJNk5TNHdMQ0owYjE5c2FXMXBkQ0k2TmpBdU1Dd2llV0YzWDJ4bFpuUWlPakF1TUN3aWVXRjNYMjF2WkdVaU9qRXVNQ3dpZVdGM1gzSnBaMmgwSWpvd0xqQjlmU3dpVEdWbmFYUWdRVUVpT25zaVExUWlPbnNpWVd4c2IzZGZjM1JoZEdVaU9uUnlkV1VzSW1KdlpIbGZabkpsWlhOMFlXNWthVzVuSWpvaVVHVmxheUJTWldGc0lpd2lZbTlrZVY5NVlYY2lPblJ5ZFdVc0ltSnZaSGxmZVdGM1gyOXdkR2x2Ym5NaU9sc2lTbWwwZEdWeUlpd2lVbUZ1Wkc5dGFYcGxJRXBwZEhSbGNpSXNJa0Z1ZEdrZ1FuSjFkR1ZtYjNKalpTSXNJbjRpWFN3aVkyaHZhMlVpT2lKRVpXWmhkV3gwSWl3aVkyaHZhMlV4WHpFaU9qSXVNQ3dpWTJodmEyVXhYeklpT2pJdU1Dd2lZMmh2YTJVeFh6TWlPakl1TUN3aVkyaHZhMlV4WHpRaU9qSXVNQ3dpWTJodmEyVXhYelVpT2pJdU1Dd2lZMmh2YTJVeFh6WWlPakl1TUN3aVkyaHZhMlZmWm5KdmJTSTZNVFl1TUN3aVkyaHZhMlZmYldWMGFHOWtJam9pVW1GdVpHOXRJaXdpWTJodmEyVmZjMnhwWkdWeUlqb3hOaTR3TENKamFHOXJaVjl6Ykdsa1pYSnpJam95TGpBc0ltTm9iMnRsWDNSdklqb3hOaTR3TENKamRYTjBiMjFmWTJodmEyVWlPbVpoYkhObExDSmtaV3hoZVNJNlptRnNjMlVzSW1SbGJHRjVYekVpT2pBdU1Dd2laR1ZzWVhsZk1pSTZNQzR3TENKa1pXeGhlVjh6SWpvd0xqQXNJbVJsYkdGNVh6UWlPakF1TUN3aVpHVnNZWGxmTlNJNk1DNHdMQ0prWld4aGVWODJJam93TGpBc0ltUmxiR0Y1WDJOMWMzUnZiVjl6Ykdsa1pYSnpJam95TGpBc0ltUmxiR0Y1WDJSbFptRjFiSFFpT2pBdU1Dd2laR1ZzWVhsZmJHOW5hV01pT2lKRVpXWmhkV3gwSWl3aVpHVnNZWGxmYldWMGFHOWtJam9pUkdWbVlYVnNkQ0lzSW1SbGJHRjVYM0poYm1SdmJWOXRZWGdpT2pBdU1Dd2laR1ZzWVhsZmNtRnVaRzl0WDIxcGJpSTZNQzR3TENKbWNtOXRYMnhwYldsMElqbzJNQzR3TENKc1pXWjBYMnhwYldsMElqbzJNQzR3TENKc2FXMXBkRjl0YjJSbElqb2lVM1JoZEdsaklpd2liV0Y0SWpvd0xqQXNJbTFoZUdsdGRXMWZiR2x0YVhRaU9qWXdMakFzSW0xcGJpSTZNQzR3TENKdGFXNXBiWFZ0WDJ4cGJXbDBJam8yTUM0d0xDSnRiMlJsSWpvaVUzUmhkR2xqSWl3aWJXOWtaVjl5WVc1a2IyMGlPalF1TUN3aWJXOWtaVjkwYVdOcmN5STZOQzR3TENKdGIyUnBabWxsY2lJNklrSnZZbkp2SWl3aWJXOWthV1pwWlhKZlkzVnpkRzl0WDNOc2FXUmxjbk1pT2pJdU1Dd2liVzlrYVdacFpYSmZiVzlrWlNJNklrUmxabUYxYkhRaUxDSnRiMlJwWm1sbGNsOXZabVp6WlhRaU9pMDFMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTVNJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYeklpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxOHpJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk5DSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpVaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTgySWpvd0xqQXNJbTltWm5ObGRDSTZNVGd3TGpBc0luSmhibVJ2YldsNlpTSTZabUZzYzJVc0luSnBaMmgwWDJ4cGJXbDBJam8yTUM0d0xDSnpZbDl6Y0dWbFpDSTZNUzR3TENKemFXNWxkMkYyWlY5emNHVmxaQ0k2TlM0d0xDSjBiMTlzYVcxcGRDSTZOakF1TUN3aWVXRjNYMnhsWm5RaU9qQXVNQ3dpZVdGM1gyMXZaR1VpT2pFdU1Dd2llV0YzWDNKcFoyaDBJam93TGpCOUxDSlVJanA3SW1Gc2JHOTNYM04wWVhSbElqcDBjblZsTENKaWIyUjVYMlp5WldWemRHRnVaR2x1WnlJNklsQmxaV3NnVW1WaGJDSXNJbUp2WkhsZmVXRjNJanAwY25WbExDSmliMlI1WDNsaGQxOXZjSFJwYjI1eklqcGJJa3BwZEhSbGNpSXNJbEpoYm1SdmJXbDZaU0JLYVhSMFpYSWlMQ0pCYm5ScElFSnlkWFJsWm05eVkyVWlMQ0orSWwwc0ltTm9iMnRsSWpvaVJHVm1ZWFZzZENJc0ltTm9iMnRsTVY4eElqb3lMakFzSW1Ob2IydGxNVjh5SWpveUxqQXNJbU5vYjJ0bE1WOHpJam95TGpBc0ltTm9iMnRsTVY4MElqb3lMakFzSW1Ob2IydGxNVjgxSWpveUxqQXNJbU5vYjJ0bE1WODJJam95TGpBc0ltTm9iMnRsWDJaeWIyMGlPakUyTGpBc0ltTm9iMnRsWDIxbGRHaHZaQ0k2SWxKaGJtUnZiU0lzSW1Ob2IydGxYM05zYVdSbGNpSTZNVFl1TUN3aVkyaHZhMlZmYzJ4cFpHVnljeUk2TWk0d0xDSmphRzlyWlY5MGJ5STZNVFl1TUN3aVkzVnpkRzl0WDJOb2IydGxJanBtWVd4elpTd2laR1ZzWVhraU9tWmhiSE5sTENKa1pXeGhlVjh4SWpvd0xqQXNJbVJsYkdGNVh6SWlPakF1TUN3aVpHVnNZWGxmTXlJNk1DNHdMQ0prWld4aGVWODBJam93TGpBc0ltUmxiR0Y1WHpVaU9qQXVNQ3dpWkdWc1lYbGZOaUk2TUM0d0xDSmtaV3hoZVY5amRYTjBiMjFmYzJ4cFpHVnljeUk2TWk0d0xDSmtaV3hoZVY5a1pXWmhkV3gwSWpvd0xqQXNJbVJsYkdGNVgyeHZaMmxqSWpvaVJHVm1ZWFZzZENJc0ltUmxiR0Y1WDIxbGRHaHZaQ0k2SWtSbFptRjFiSFFpTENKa1pXeGhlVjl5WVc1a2IyMWZiV0Y0SWpvd0xqQXNJbVJsYkdGNVgzSmhibVJ2YlY5dGFXNGlPakF1TUN3aVpuSnZiVjlzYVcxcGRDSTZOakF1TUN3aWJHVm1kRjlzYVcxcGRDSTZOakF1TUN3aWJHbHRhWFJmYlc5a1pTSTZJbE4wWVhScFl5SXNJbTFoZUNJNk1DNHdMQ0p0WVhocGJYVnRYMnhwYldsMElqbzJNQzR3TENKdGFXNGlPakF1TUN3aWJXbHVhVzExYlY5c2FXMXBkQ0k2TmpBdU1Dd2liVzlrWlNJNklsTjBZWFJwWXlJc0ltMXZaR1ZmY21GdVpHOXRJam8wTGpBc0ltMXZaR1ZmZEdsamEzTWlPalF1TUN3aWJXOWthV1pwWlhJaU9pSkNiMkp5YnlJc0ltMXZaR2xtYVdWeVgyTjFjM1J2YlY5emJHbGtaWEp6SWpveUxqQXNJbTF2WkdsbWFXVnlYMjF2WkdVaU9pSkVaV1poZFd4MElpd2liVzlrYVdacFpYSmZiMlptYzJWMElqb3ROUzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpFaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh5SWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZNeUk2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6UWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4MUlqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTmlJNk1DNHdMQ0p2Wm1aelpYUWlPakU0TUM0d0xDSnlZVzVrYjIxcGVtVWlPbVpoYkhObExDSnlhV2RvZEY5c2FXMXBkQ0k2TmpBdU1Dd2ljMkpmYzNCbFpXUWlPakV1TUN3aWMybHVaWGRoZG1WZmMzQmxaV1FpT2pVdU1Dd2lkRzlmYkdsdGFYUWlPall3TGpBc0lubGhkMTlzWldaMElqb3dMakFzSW5saGQxOXRiMlJsSWpveExqQXNJbmxoZDE5eWFXZG9kQ0k2TUM0d2ZYMHNJbEoxYm01cGJtY2lPbnNpUTFRaU9uc2lZbTlrZVY5bWNtVmxjM1JoYm1ScGJtY2lPaUpQWm1ZaUxDSmliMlI1WDNsaGR5STZkSEoxWlN3aVltOWtlVjk1WVhkZmIzQjBhVzl1Y3lJNld5SkthWFIwWlhJaUxDSitJbDBzSW1Ob2IydGxJam9pUkdWbVlYVnNkQ0lzSW1Ob2IydGxNVjh4SWpvNExqQXNJbU5vYjJ0bE1WOHlJam95TWk0d0xDSmphRzlyWlRGZk15STZNVEF1TUN3aVkyaHZhMlV4WHpRaU9qSXVNQ3dpWTJodmEyVXhYelVpT2pVdU1Dd2lZMmh2YTJVeFh6WWlPakUxTGpBc0ltTm9iMnRsWDJaeWIyMGlPakUyTGpBc0ltTm9iMnRsWDIxbGRHaHZaQ0k2SWxKaGJtUnZiU0lzSW1Ob2IydGxYM05zYVdSbGNpSTZNVFl1TUN3aVkyaHZhMlZmYzJ4cFpHVnljeUk2Tmk0d0xDSmphRzlyWlY5MGJ5STZNVFl1TUN3aVkzVnpkRzl0WDJOb2IydGxJanBtWVd4elpTd2laR1ZzWVhraU9uUnlkV1VzSW1SbGJHRjVYekVpT2pJdU1Dd2laR1ZzWVhsZk1pSTZNQzR3TENKa1pXeGhlVjh6SWpvd0xqQXNJbVJsYkdGNVh6UWlPakF1TUN3aVpHVnNZWGxmTlNJNk1pNHdMQ0prWld4aGVWODJJam95TGpBc0ltUmxiR0Y1WDJOMWMzUnZiVjl6Ykdsa1pYSnpJam95TGpBc0ltUmxiR0Y1WDJSbFptRjFiSFFpT2pndU1Dd2laR1ZzWVhsZmJHOW5hV01pT2lKRVpXWmhkV3gwSWl3aVpHVnNZWGxmYldWMGFHOWtJam9pUkdWbVlYVnNkQ0lzSW1SbGJHRjVYM0poYm1SdmJWOXRZWGdpT2pJdU1Dd2laR1ZzWVhsZmNtRnVaRzl0WDIxcGJpSTZNaTR3TENKbWNtOXRYMnhwYldsMElqbzJNQzR3TENKc1pXWjBYMnhwYldsMElqbzJNQzR3TENKc2FXMXBkRjl0YjJSbElqb2lVM1JoZEdsaklpd2liV0Y0SWpvd0xqQXNJbTFoZUdsdGRXMWZiR2x0YVhRaU9qWXdMakFzSW0xcGJpSTZNQzR3TENKdGFXNXBiWFZ0WDJ4cGJXbDBJam8yTUM0d0xDSnRiMlJsSWpvaVUzUmhkR2xqSWl3aWJXOWtaVjl5WVc1a2IyMGlPalF1TUN3aWJXOWtaVjkwYVdOcmN5STZOQzR3TENKdGIyUnBabWxsY2lJNklrUnBjMkZpYkdWa0lpd2liVzlrYVdacFpYSmZZM1Z6ZEc5dFgzTnNhV1JsY25NaU9qSXVNQ3dpYlc5a2FXWnBaWEpmYlc5a1pTSTZJa1JsWm1GMWJIUWlMQ0p0YjJScFptbGxjbDl2Wm1aelpYUWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4eElqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTWlJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYek1pT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxODBJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk5TSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpZaU9qQXVNQ3dpYjJabWMyVjBJam93TGpBc0luSmhibVJ2YldsNlpTSTZabUZzYzJVc0luSnBaMmgwWDJ4cGJXbDBJam8yTUM0d0xDSnpZbDl6Y0dWbFpDSTZNUzR3TENKemFXNWxkMkYyWlY5emNHVmxaQ0k2TlM0d0xDSjBiMTlzYVcxcGRDSTZOakF1TUN3aWVXRjNYMnhsWm5RaU9pMHlOaTR3TENKNVlYZGZiVzlrWlNJNk1TNHdMQ0o1WVhkZmNtbG5hSFFpT2pReExqQjlMQ0pVSWpwN0ltSnZaSGxmWm5KbFpYTjBZVzVrYVc1bklqb2lUMlptSWl3aVltOWtlVjk1WVhjaU9uUnlkV1VzSW1KdlpIbGZlV0YzWDI5d2RHbHZibk1pT2xzaVNtbDBkR1Z5SWl3aWZpSmRMQ0pqYUc5clpTSTZJa1JsWm1GMWJIUWlMQ0pqYUc5clpURmZNU0k2T0M0d0xDSmphRzlyWlRGZk1pSTZNakl1TUN3aVkyaHZhMlV4WHpNaU9qRXdMakFzSW1Ob2IydGxNVjgwSWpveUxqQXNJbU5vYjJ0bE1WODFJam8xTGpBc0ltTm9iMnRsTVY4Mklqb3hOUzR3TENKamFHOXJaVjltY205dElqb3hOaTR3TENKamFHOXJaVjl0WlhSb2IyUWlPaUpTWVc1a2IyMGlMQ0pqYUc5clpWOXpiR2xrWlhJaU9qRTJMakFzSW1Ob2IydGxYM05zYVdSbGNuTWlPall1TUN3aVkyaHZhMlZmZEc4aU9qRTJMakFzSW1OMWMzUnZiVjlqYUc5clpTSTZabUZzYzJVc0ltUmxiR0Y1SWpwMGNuVmxMQ0prWld4aGVWOHhJam95TGpBc0ltUmxiR0Y1WHpJaU9qQXVNQ3dpWkdWc1lYbGZNeUk2TUM0d0xDSmtaV3hoZVY4MElqb3dMakFzSW1SbGJHRjVYelVpT2pJdU1Dd2laR1ZzWVhsZk5pSTZNaTR3TENKa1pXeGhlVjlqZFhOMGIyMWZjMnhwWkdWeWN5STZNaTR3TENKa1pXeGhlVjlrWldaaGRXeDBJam80TGpBc0ltUmxiR0Y1WDJ4dloybGpJam9pUkdWbVlYVnNkQ0lzSW1SbGJHRjVYMjFsZEdodlpDSTZJa1JsWm1GMWJIUWlMQ0prWld4aGVWOXlZVzVrYjIxZmJXRjRJam95TGpBc0ltUmxiR0Y1WDNKaGJtUnZiVjl0YVc0aU9qSXVNQ3dpWm5KdmJWOXNhVzFwZENJNk5qQXVNQ3dpYkdWbWRGOXNhVzFwZENJNk5qQXVNQ3dpYkdsdGFYUmZiVzlrWlNJNklsTjBZWFJwWXlJc0ltMWhlQ0k2TUM0d0xDSnRZWGhwYlhWdFgyeHBiV2wwSWpvMk1DNHdMQ0p0YVc0aU9qQXVNQ3dpYldsdWFXMTFiVjlzYVcxcGRDSTZOakF1TUN3aWJXOWtaU0k2SWxOMFlYUnBZeUlzSW0xdlpHVmZjbUZ1Wkc5dElqbzBMakFzSW0xdlpHVmZkR2xqYTNNaU9qUXVNQ3dpYlc5a2FXWnBaWElpT2lKQ2IySnlieUlzSW0xdlpHbG1hV1Z5WDJOMWMzUnZiVjl6Ykdsa1pYSnpJam95TGpBc0ltMXZaR2xtYVdWeVgyMXZaR1VpT2lKRVpXWmhkV3gwSWl3aWJXOWthV1pwWlhKZmIyWm1jMlYwSWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZNU0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6SWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4eklqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTkNJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYelVpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxODJJam93TGpBc0ltOW1abk5sZENJNk1DNHdMQ0p5WVc1a2IyMXBlbVVpT21aaGJITmxMQ0p5YVdkb2RGOXNhVzFwZENJNk5qQXVNQ3dpYzJKZmMzQmxaV1FpT2pFdU1Dd2ljMmx1WlhkaGRtVmZjM0JsWldRaU9qVXVNQ3dpZEc5ZmJHbHRhWFFpT2pZd0xqQXNJbmxoZDE5c1pXWjBJam90TWpZdU1Dd2llV0YzWDIxdlpHVWlPakl1TUN3aWVXRjNYM0pwWjJoMElqbzBNUzR3Zlgwc0lsTnNiM2RwYm1jaU9uc2lRMVFpT25zaVltOWtlVjltY21WbGMzUmhibVJwYm1jaU9pSlBabVlpTENKaWIyUjVYM2xoZHlJNmRISjFaU3dpWW05a2VWOTVZWGRmYjNCMGFXOXVjeUk2V3lKS2FYUjBaWElpTENKK0lsMHNJbU5vYjJ0bElqb2lSR1ZtWVhWc2RDSXNJbU5vYjJ0bE1WOHhJam95TGpBc0ltTm9iMnRsTVY4eUlqb3lMakFzSW1Ob2IydGxNVjh6SWpveUxqQXNJbU5vYjJ0bE1WODBJam95TGpBc0ltTm9iMnRsTVY4MUlqb3lMakFzSW1Ob2IydGxNVjgySWpveUxqQXNJbU5vYjJ0bFgyWnliMjBpT2pFMkxqQXNJbU5vYjJ0bFgyMWxkR2h2WkNJNklsSmhibVJ2YlNJc0ltTm9iMnRsWDNOc2FXUmxjaUk2TVRZdU1Dd2lZMmh2YTJWZmMyeHBaR1Z5Y3lJNk1pNHdMQ0pqYUc5clpWOTBieUk2TVRZdU1Dd2lZM1Z6ZEc5dFgyTm9iMnRsSWpwbVlXeHpaU3dpWkdWc1lYa2lPblJ5ZFdVc0ltUmxiR0Y1WHpFaU9qTXVNQ3dpWkdWc1lYbGZNaUk2TUM0d0xDSmtaV3hoZVY4eklqb3dMakFzSW1SbGJHRjVYelFpT2pBdU1Dd2laR1ZzWVhsZk5TSTZOaTR3TENKa1pXeGhlVjgySWpvNExqQXNJbVJsYkdGNVgyTjFjM1J2YlY5emJHbGtaWEp6SWpvMkxqQXNJbVJsYkdGNVgyUmxabUYxYkhRaU9qSXVNQ3dpWkdWc1lYbGZiRzluYVdNaU9pSkVaV1poZFd4MElpd2laR1ZzWVhsZmJXVjBhRzlrSWpvaVEzVnpkRzl0SWl3aVpHVnNZWGxmY21GdVpHOXRYMjFoZUNJNk1pNHdMQ0prWld4aGVWOXlZVzVrYjIxZmJXbHVJam95TGpBc0ltWnliMjFmYkdsdGFYUWlPall3TGpBc0lteGxablJmYkdsdGFYUWlPall3TGpBc0lteHBiV2wwWDIxdlpHVWlPaUpUZEdGMGFXTWlMQ0p0WVhnaU9qQXVNQ3dpYldGNGFXMTFiVjlzYVcxcGRDSTZOakF1TUN3aWJXbHVJam93TGpBc0ltMXBibWx0ZFcxZmJHbHRhWFFpT2pZd0xqQXNJbTF2WkdVaU9pSlRkR0YwYVdNaUxDSnRiMlJsWDNKaGJtUnZiU0k2TkM0d0xDSnRiMlJsWDNScFkydHpJam8wTGpBc0ltMXZaR2xtYVdWeUlqb2lRbTlpY204aUxDSnRiMlJwWm1sbGNsOWpkWE4wYjIxZmMyeHBaR1Z5Y3lJNk5TNHdMQ0p0YjJScFptbGxjbDl0YjJSbElqb2lRM1Z6ZEc5dElpd2liVzlrYVdacFpYSmZiMlptYzJWMElqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTVNJNkxURXlMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTWlJNk1UY3VNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh6SWpvdE16a3VNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTgwSWpvdE5URXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTgxSWpvME1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYellpT2pBdU1Dd2liMlptYzJWMElqb3dMakFzSW5KaGJtUnZiV2w2WlNJNmRISjFaU3dpY21sbmFIUmZiR2x0YVhRaU9qWXdMakFzSW5OaVgzTndaV1ZrSWpveExqQXNJbk5wYm1WM1lYWmxYM053WldWa0lqbzFMakFzSW5SdlgyeHBiV2wwSWpvMk1DNHdMQ0o1WVhkZmJHVm1kQ0k2TFRJM0xqQXNJbmxoZDE5dGIyUmxJam94TGpBc0lubGhkMTl5YVdkb2RDSTZNemd1TUgwc0lsUWlPbnNpWW05a2VWOW1jbVZsYzNSaGJtUnBibWNpT2lKUFptWWlMQ0ppYjJSNVgzbGhkeUk2ZEhKMVpTd2lZbTlrZVY5NVlYZGZiM0IwYVc5dWN5STZXeUpLYVhSMFpYSWlMQ0orSWwwc0ltTm9iMnRsSWpvaVJHVm1ZWFZzZENJc0ltTm9iMnRsTVY4eElqb3lMakFzSW1Ob2IydGxNVjh5SWpveUxqQXNJbU5vYjJ0bE1WOHpJam95TGpBc0ltTm9iMnRsTVY4MElqb3lMakFzSW1Ob2IydGxNVjgxSWpveUxqQXNJbU5vYjJ0bE1WODJJam95TGpBc0ltTm9iMnRsWDJaeWIyMGlPakUyTGpBc0ltTm9iMnRsWDIxbGRHaHZaQ0k2SWxKaGJtUnZiU0lzSW1Ob2IydGxYM05zYVdSbGNpSTZNVFl1TUN3aVkyaHZhMlZmYzJ4cFpHVnljeUk2TWk0d0xDSmphRzlyWlY5MGJ5STZNVFl1TUN3aVkzVnpkRzl0WDJOb2IydGxJanBtWVd4elpTd2laR1ZzWVhraU9uUnlkV1VzSW1SbGJHRjVYekVpT2pNdU1Dd2laR1ZzWVhsZk1pSTZNQzR3TENKa1pXeGhlVjh6SWpvd0xqQXNJbVJsYkdGNVh6UWlPakF1TUN3aVpHVnNZWGxmTlNJNk5pNHdMQ0prWld4aGVWODJJam80TGpBc0ltUmxiR0Y1WDJOMWMzUnZiVjl6Ykdsa1pYSnpJam8yTGpBc0ltUmxiR0Y1WDJSbFptRjFiSFFpT2pJdU1Dd2laR1ZzWVhsZmJHOW5hV01pT2lKRVpXWmhkV3gwSWl3aVpHVnNZWGxmYldWMGFHOWtJam9pUTNWemRHOXRJaXdpWkdWc1lYbGZjbUZ1Wkc5dFgyMWhlQ0k2TWk0d0xDSmtaV3hoZVY5eVlXNWtiMjFmYldsdUlqb3lMakFzSW1aeWIyMWZiR2x0YVhRaU9qWXdMakFzSW14bFpuUmZiR2x0YVhRaU9qWXdMakFzSW14cGJXbDBYMjF2WkdVaU9pSlRkR0YwYVdNaUxDSnRZWGdpT2pBdU1Dd2liV0Y0YVcxMWJWOXNhVzFwZENJNk5qQXVNQ3dpYldsdUlqb3dMakFzSW0xcGJtbHRkVzFmYkdsdGFYUWlPall3TGpBc0ltMXZaR1VpT2lKVGRHRjBhV01pTENKdGIyUmxYM0poYm1SdmJTSTZOQzR3TENKdGIyUmxYM1JwWTJ0eklqbzBMakFzSW0xdlpHbG1hV1Z5SWpvaVFtOWljbThpTENKdGIyUnBabWxsY2w5amRYTjBiMjFmYzJ4cFpHVnljeUk2TlM0d0xDSnRiMlJwWm1sbGNsOXRiMlJsSWpvaVEzVnpkRzl0SWl3aWJXOWthV1pwWlhKZmIyWm1jMlYwSWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZNU0k2TFRFeUxqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZNaUk2TVRjdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxOHpJam90TXprdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxODBJam90TlRFdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxODFJam8wTUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6WWlPakF1TUN3aWIyWm1jMlYwSWpvd0xqQXNJbkpoYm1SdmJXbDZaU0k2ZEhKMVpTd2ljbWxuYUhSZmJHbHRhWFFpT2pZd0xqQXNJbk5pWDNOd1pXVmtJam94TGpBc0luTnBibVYzWVhabFgzTndaV1ZrSWpvMUxqQXNJblJ2WDJ4cGJXbDBJam8yTUM0d0xDSjVZWGRmYkdWbWRDSTZMVEkzTGpBc0lubGhkMTl0YjJSbElqb3hMakFzSW5saGQxOXlhV2RvZENJNk16Z3VNSDE5TENKVGJtVmhhMmx1WnlJNmV5SkRWQ0k2ZXlKaWIyUjVYMlp5WldWemRHRnVaR2x1WnlJNklrOW1aaUlzSW1KdlpIbGZlV0YzSWpwMGNuVmxMQ0ppYjJSNVgzbGhkMTl2Y0hScGIyNXpJanBiSWtwcGRIUmxjaUlzSW40aVhTd2lZMmh2YTJVaU9pSkRkWE4wYjIwaUxDSmphRzlyWlRGZk1TSTZNVGd1TUN3aVkyaHZhMlV4WHpJaU9qRTRMakFzSW1Ob2IydGxNVjh6SWpveE5TNHdMQ0pqYUc5clpURmZOQ0k2TVRjdU1Dd2lZMmh2YTJVeFh6VWlPamt1TUN3aVkyaHZhMlV4WHpZaU9qRTFMakFzSW1Ob2IydGxYMlp5YjIwaU9qRTJMakFzSW1Ob2IydGxYMjFsZEdodlpDSTZJbE5sY1hWbGJuUnBZV3dpTENKamFHOXJaVjl6Ykdsa1pYSWlPakUyTGpBc0ltTm9iMnRsWDNOc2FXUmxjbk1pT2pZdU1Dd2lZMmh2YTJWZmRHOGlPakUyTGpBc0ltTjFjM1J2YlY5amFHOXJaU0k2ZEhKMVpTd2laR1ZzWVhraU9uUnlkV1VzSW1SbGJHRjVYekVpT2pVdU1Dd2laR1ZzWVhsZk1pSTZOaTR3TENKa1pXeGhlVjh6SWpveExqQXNJbVJsYkdGNVh6UWlPakV1TUN3aVpHVnNZWGxmTlNJNk1pNHdMQ0prWld4aGVWODJJam95TGpBc0ltUmxiR0Y1WDJOMWMzUnZiVjl6Ykdsa1pYSnpJam95TGpBc0ltUmxiR0Y1WDJSbFptRjFiSFFpT2pjdU1Dd2laR1ZzWVhsZmJHOW5hV01pT2lKRVpXWmhkV3gwSWl3aVpHVnNZWGxmYldWMGFHOWtJam9pUTNWemRHOXRJaXdpWkdWc1lYbGZjbUZ1Wkc5dFgyMWhlQ0k2Tmk0d0xDSmtaV3hoZVY5eVlXNWtiMjFmYldsdUlqbzFMakFzSW1aeWIyMWZiR2x0YVhRaU9qVTRMakFzSW14bFpuUmZiR2x0YVhRaU9qWXdMakFzSW14cGJXbDBYMjF2WkdVaU9pSlRkMmwwWTJnaUxDSnRZWGdpT2pBdU1Dd2liV0Y0YVcxMWJWOXNhVzFwZENJNk5qQXVNQ3dpYldsdUlqb3RNVEl1TUN3aWJXbHVhVzExYlY5c2FXMXBkQ0k2TmpBdU1Dd2liVzlrWlNJNklsUnBZMnR6SWl3aWJXOWtaVjl5WVc1a2IyMGlPalF1TUN3aWJXOWtaVjkwYVdOcmN5STZPUzR3TENKdGIyUnBabWxsY2lJNklsTndhVzRpTENKdGIyUnBabWxsY2w5amRYTjBiMjFmYzJ4cFpHVnljeUk2TWk0d0xDSnRiMlJwWm1sbGNsOXRiMlJsSWpvaVJHVm1ZWFZzZENJc0ltMXZaR2xtYVdWeVgyOW1abk5sZENJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYekVpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxOHlJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk15STZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpRaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTgxSWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZOaUk2TFRFMkxqQXNJbTltWm5ObGRDSTZNQzR3TENKeVlXNWtiMjFwZW1VaU9uUnlkV1VzSW5KcFoyaDBYMnhwYldsMElqbzJNQzR3TENKellsOXpjR1ZsWkNJNk1URXVNQ3dpYzJsdVpYZGhkbVZmYzNCbFpXUWlPalV1TUN3aWRHOWZiR2x0YVhRaU9qVTRMakFzSW5saGQxOXNaV1owSWpvdE1qSXVNQ3dpZVdGM1gyMXZaR1VpT2pJdU1Dd2llV0YzWDNKcFoyaDBJam8wTXk0d2ZTd2lWQ0k2ZXlKaWIyUjVYMlp5WldWemRHRnVaR2x1WnlJNklrOW1aaUlzSW1KdlpIbGZlV0YzSWpwMGNuVmxMQ0ppYjJSNVgzbGhkMTl2Y0hScGIyNXpJanBiSWtwcGRIUmxjaUlzSW40aVhTd2lZMmh2YTJVaU9pSkRkWE4wYjIwaUxDSmphRzlyWlRGZk1TSTZPQzR3TENKamFHOXJaVEZmTWlJNk1UZ3VNQ3dpWTJodmEyVXhYek1pT2pjdU1Dd2lZMmh2YTJVeFh6UWlPakUzTGpBc0ltTm9iMnRsTVY4MUlqbzRMakFzSW1Ob2IydGxNVjgySWpvMUxqQXNJbU5vYjJ0bFgyWnliMjBpT2pFMkxqQXNJbU5vYjJ0bFgyMWxkR2h2WkNJNklsTmxjWFZsYm5ScFlXd2lMQ0pqYUc5clpWOXpiR2xrWlhJaU9qRTJMakFzSW1Ob2IydGxYM05zYVdSbGNuTWlPall1TUN3aVkyaHZhMlZmZEc4aU9qRTJMakFzSW1OMWMzUnZiVjlqYUc5clpTSTZkSEoxWlN3aVpHVnNZWGtpT25SeWRXVXNJbVJsYkdGNVh6RWlPakl1TUN3aVpHVnNZWGxmTWlJNk1pNHdMQ0prWld4aGVWOHpJam93TGpBc0ltUmxiR0Y1WHpRaU9qQXVNQ3dpWkdWc1lYbGZOU0k2TWk0d0xDSmtaV3hoZVY4Mklqb3lMakFzSW1SbGJHRjVYMk4xYzNSdmJWOXpiR2xrWlhKeklqb3lMakFzSW1SbGJHRjVYMlJsWm1GMWJIUWlPamN1TUN3aVpHVnNZWGxmYkc5bmFXTWlPaUpFWldaaGRXeDBJaXdpWkdWc1lYbGZiV1YwYUc5a0lqb2lRM1Z6ZEc5dElpd2laR1ZzWVhsZmNtRnVaRzl0WDIxaGVDSTZOaTR3TENKa1pXeGhlVjl5WVc1a2IyMWZiV2x1SWpvMUxqQXNJbVp5YjIxZmJHbHRhWFFpT2pZd0xqQXNJbXhsWm5SZmJHbHRhWFFpT2pZd0xqQXNJbXhwYldsMFgyMXZaR1VpT2lKVGQybDBZMmdpTENKdFlYZ2lPakF1TUN3aWJXRjRhVzExYlY5c2FXMXBkQ0k2TmpBdU1Dd2liV2x1SWpvdE1UQXVNQ3dpYldsdWFXMTFiVjlzYVcxcGRDSTZOakF1TUN3aWJXOWtaU0k2SWxScFkydHpJaXdpYlc5a1pWOXlZVzVrYjIwaU9qUXVNQ3dpYlc5a1pWOTBhV05yY3lJNk1USXVNQ3dpYlc5a2FXWnBaWElpT2lKVGNHbHVJaXdpYlc5a2FXWnBaWEpmWTNWemRHOXRYM05zYVdSbGNuTWlPall1TUN3aWJXOWthV1pwWlhKZmJXOWtaU0k2SWtOMWMzUnZiU0lzSW0xdlpHbG1hV1Z5WDI5bVpuTmxkQ0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6RWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4eUlqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTXlJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYelFpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxODFJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk5pSTZMVEUyTGpBc0ltOW1abk5sZENJNk1DNHdMQ0p5WVc1a2IyMXBlbVVpT25SeWRXVXNJbkpwWjJoMFgyeHBiV2wwSWpvMk1DNHdMQ0p6WWw5emNHVmxaQ0k2TVRFdU1Dd2ljMmx1WlhkaGRtVmZjM0JsWldRaU9qVXVNQ3dpZEc5ZmJHbHRhWFFpT2pRNExqQXNJbmxoZDE5c1pXWjBJam90TWpJdU1Dd2llV0YzWDIxdlpHVWlPakl1TUN3aWVXRjNYM0pwWjJoMElqbzBOQzR3Zlgwc0lsTjBZVzVrYVc1bklqcDdJa05VSWpwN0ltSnZaSGxmWm5KbFpYTjBZVzVrYVc1bklqb2lUMlptSWl3aVltOWtlVjk1WVhjaU9uUnlkV1VzSW1KdlpIbGZlV0YzWDI5d2RHbHZibk1pT2xzaVNtbDBkR1Z5SWl3aWZpSmRMQ0pqYUc5clpTSTZJa1JsWm1GMWJIUWlMQ0pqYUc5clpURmZNU0k2TWk0d0xDSmphRzlyWlRGZk1pSTZNaTR3TENKamFHOXJaVEZmTXlJNk1pNHdMQ0pqYUc5clpURmZOQ0k2TWk0d0xDSmphRzlyWlRGZk5TSTZNaTR3TENKamFHOXJaVEZmTmlJNk1pNHdMQ0pqYUc5clpWOW1jbTl0SWpveE5pNHdMQ0pqYUc5clpWOXRaWFJvYjJRaU9pSlNZVzVrYjIwaUxDSmphRzlyWlY5emJHbGtaWElpT2pFMkxqQXNJbU5vYjJ0bFgzTnNhV1JsY25NaU9qSXVNQ3dpWTJodmEyVmZkRzhpT2pFMkxqQXNJbU4xYzNSdmJWOWphRzlyWlNJNlptRnNjMlVzSW1SbGJHRjVJanAwY25WbExDSmtaV3hoZVY4eElqbzFMakFzSW1SbGJHRjVYeklpT2pBdU1Dd2laR1ZzWVhsZk15STZNQzR3TENKa1pXeGhlVjgwSWpvd0xqQXNJbVJsYkdGNVh6VWlPak11TUN3aVpHVnNZWGxmTmlJNk1pNHdMQ0prWld4aGVWOWpkWE4wYjIxZmMyeHBaR1Z5Y3lJNk5TNHdMQ0prWld4aGVWOWtaV1poZFd4MElqbzNMakFzSW1SbGJHRjVYMnh2WjJsaklqb2lSR1ZtWVhWc2RDSXNJbVJsYkdGNVgyMWxkR2h2WkNJNklrUmxabUYxYkhRaUxDSmtaV3hoZVY5eVlXNWtiMjFmYldGNElqb3lMakFzSW1SbGJHRjVYM0poYm1SdmJWOXRhVzRpT2pJdU1Dd2labkp2YlY5c2FXMXBkQ0k2TmpBdU1Dd2liR1ZtZEY5c2FXMXBkQ0k2TmpBdU1Dd2liR2x0YVhSZmJXOWtaU0k2SWxOMFlYUnBZeUlzSW0xaGVDSTZNQzR3TENKdFlYaHBiWFZ0WDJ4cGJXbDBJam8yTUM0d0xDSnRhVzRpT2pBdU1Dd2liV2x1YVcxMWJWOXNhVzFwZENJNk5qQXVNQ3dpYlc5a1pTSTZJbE4wWVhScFl5SXNJbTF2WkdWZmNtRnVaRzl0SWpvMExqQXNJbTF2WkdWZmRHbGphM01pT2pRdU1Dd2liVzlrYVdacFpYSWlPaUpFYVhOaFlteGxaQ0lzSW0xdlpHbG1hV1Z5WDJOMWMzUnZiVjl6Ykdsa1pYSnpJam95TGpBc0ltMXZaR2xtYVdWeVgyMXZaR1VpT2lKRVpXWmhkV3gwSWl3aWJXOWthV1pwWlhKZmIyWm1jMlYwSWpvMU1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYekVpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxOHlJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk15STZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpRaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTgxSWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZOaUk2TUM0d0xDSnZabVp6WlhRaU9qQXVNQ3dpY21GdVpHOXRhWHBsSWpwbVlXeHpaU3dpY21sbmFIUmZiR2x0YVhRaU9qWXdMakFzSW5OaVgzTndaV1ZrSWpveExqQXNJbk5wYm1WM1lYWmxYM053WldWa0lqbzFMakFzSW5SdlgyeHBiV2wwSWpvMk1DNHdMQ0o1WVhkZmJHVm1kQ0k2TFRJeUxqQXNJbmxoZDE5dGIyUmxJam95TGpBc0lubGhkMTl5YVdkb2RDSTZORFl1TUgwc0lsUWlPbnNpWW05a2VWOW1jbVZsYzNSaGJtUnBibWNpT2lKUFptWWlMQ0ppYjJSNVgzbGhkeUk2ZEhKMVpTd2lZbTlrZVY5NVlYZGZiM0IwYVc5dWN5STZXeUpLYVhSMFpYSWlMQ0orSWwwc0ltTm9iMnRsSWpvaVJHVm1ZWFZzZENJc0ltTm9iMnRsTVY4eElqb3lMakFzSW1Ob2IydGxNVjh5SWpveUxqQXNJbU5vYjJ0bE1WOHpJam95TGpBc0ltTm9iMnRsTVY4MElqb3lMakFzSW1Ob2IydGxNVjgxSWpveUxqQXNJbU5vYjJ0bE1WODJJam95TGpBc0ltTm9iMnRsWDJaeWIyMGlPakUyTGpBc0ltTm9iMnRsWDIxbGRHaHZaQ0k2SWxKaGJtUnZiU0lzSW1Ob2IydGxYM05zYVdSbGNpSTZNVFl1TUN3aVkyaHZhMlZmYzJ4cFpHVnljeUk2TWk0d0xDSmphRzlyWlY5MGJ5STZNVFl1TUN3aVkzVnpkRzl0WDJOb2IydGxJanBtWVd4elpTd2laR1ZzWVhraU9uUnlkV1VzSW1SbGJHRjVYekVpT2pVdU1Dd2laR1ZzWVhsZk1pSTZNUzR3TENKa1pXeGhlVjh6SWpveExqQXNJbVJsYkdGNVh6UWlPakV1TUN3aVpHVnNZWGxmTlNJNk15NHdMQ0prWld4aGVWODJJam95TGpBc0ltUmxiR0Y1WDJOMWMzUnZiVjl6Ykdsa1pYSnpJam8xTGpBc0ltUmxiR0Y1WDJSbFptRjFiSFFpT2pZdU1Dd2laR1ZzWVhsZmJHOW5hV01pT2lKRVpXWmhkV3gwSWl3aVpHVnNZWGxmYldWMGFHOWtJam9pUkdWbVlYVnNkQ0lzSW1SbGJHRjVYM0poYm1SdmJWOXRZWGdpT2pJdU1Dd2laR1ZzWVhsZmNtRnVaRzl0WDIxcGJpSTZNaTR3TENKbWNtOXRYMnhwYldsMElqbzJNQzR3TENKc1pXWjBYMnhwYldsMElqbzJNQzR3TENKc2FXMXBkRjl0YjJSbElqb2lVM1JoZEdsaklpd2liV0Y0SWpvd0xqQXNJbTFoZUdsdGRXMWZiR2x0YVhRaU9qWXdMakFzSW0xcGJpSTZNQzR3TENKdGFXNXBiWFZ0WDJ4cGJXbDBJam8yTUM0d0xDSnRiMlJsSWpvaVUzUmhkR2xqSWl3aWJXOWtaVjl5WVc1a2IyMGlPalF1TUN3aWJXOWtaVjkwYVdOcmN5STZOQzR3TENKdGIyUnBabWxsY2lJNklrUnBjMkZpYkdWa0lpd2liVzlrYVdacFpYSmZZM1Z6ZEc5dFgzTnNhV1JsY25NaU9qSXVNQ3dpYlc5a2FXWnBaWEpmYlc5a1pTSTZJa1JsWm1GMWJIUWlMQ0p0YjJScFptbGxjbDl2Wm1aelpYUWlPalV3TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk1TSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpJaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh6SWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZOQ0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6VWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4Mklqb3dMakFzSW05bVpuTmxkQ0k2TUM0d0xDSnlZVzVrYjIxcGVtVWlPbVpoYkhObExDSnlhV2RvZEY5c2FXMXBkQ0k2TmpBdU1Dd2ljMkpmYzNCbFpXUWlPakV1TUN3aWMybHVaWGRoZG1WZmMzQmxaV1FpT2pVdU1Dd2lkRzlmYkdsdGFYUWlPall3TGpBc0lubGhkMTlzWldaMElqb3RNakl1TUN3aWVXRjNYMjF2WkdVaU9qSXVNQ3dpZVdGM1gzSnBaMmgwSWpvME5pNHdmWDE5TENKbWNtVmxjM1JoYm1ScGJtY2lPbnNpWW05a2VWOW1jeUk2ZEhKMVpTd2laR2x6WVdKc1pYSnpJanBiSW40aVhTd2ljSEpsWm1WeVgyMWhiblZoYkNJNmRISjFaU3dpYzNkcGRHTm9JanBtWVd4elpTd2llV0YzWDIxdlpDSTZkSEoxWlgxOUxDSnRZV2x1SWpwN0ltRmtaR2wwYVc5dVlXd2lPbnNpYkdWbmFYUmZZV0VpT25zaVpXNWhZbXhsWkNJNlptRnNjMlVzSW0xdlpHVWlPaUpNYjJOaGJDQldhV1YzSW4wc0ltMWhiblZoYkY5NVlYY2lPbnNpYVc1MlpYSjBaWElpT25SeWRXVXNJbk5sYkdWamRDSTZJa1JwYzJGaWJHVmtJaXdpYzNSaGRHbGpJanBtWVd4elpYMHNJbk5oWm1WZmFHVmhaQ0k2ZXlKb1pXbG5hSFFpT2pVd0xqQXNJbk4wWVhSbGN5STZXeUphWlhWeklpd2lTMjVwWm1VaUxDSitJbDBzSW5OM2FYUmphQ0k2Wm1Gc2MyVjlMQ0ozWVhKdGRYQmZZV0VpT25zaWJHVm1kRjk1WVhjaU9pMHpOUzR3TENKd2FYUmphQ0k2SWtScGMyRmliR1ZrSWl3aWNtRnVaMlVpT2pNMk1DNHdMQ0p5YVdkb2RGOTVZWGNpT2pZM0xqQXNJbk5sYkdWamRDSTZJa1JwYzJGaWJHVmtJaXdpYzNCbFpXUWlPakV5T0M0d0xDSjVZWGNpT2lKVGNHbHVJbjE5TENKamIyNW1hV2QxY21VaU9uc2ljM1JoZEdVaU9pSlRkR0Z1WkdsdVp5SXNJblJsWVcwaU9qRXVNSDE5ZlN3aWFXNW1ieUk2ZXlKd2NtVnpaWFJ6SWpwN0lteHBjM1FpT2pVdU1Dd2libUZ0WlNJNkltUnpZV1JoYzJSaGMyUWlmU3dpZDJGMFpYSnRZWEpySWpwN0ltTnZiRzl5SWpwYklrbHVibVZ5SWl3aUl6QXdNREF3TURBd0lpd2lmaUpkTENKamIyeHZjbDh4SWpvaUkwWkdNREF3TUVaR0lpd2lZMjlzYjNKZk1pSTZJaU5HUmtaR1JrWkdSaUlzSW1OdmJHOXlYMjRpT2lJalJVWkZSRGhDUmtZaUxDSmxabVpsWTNSeklqcGJJbjRpWFN3aVptOXVkQ0k2SWtSbFptRjFiSFFpTENKbmJHbDBZMmdpT25SeWRXVXNJbTF2WkdVaU9sc3hMakFzTWk0d0xETXVNQ3dpZmlKZExDSnlZV2x1WW05M0lqcG1ZV3h6WlN3aWMzQmxaV1FpT2pRdU1Dd2lkR1Y0ZENJNklrZFBRVlJNUXlKOWZTd2liV2x6WXlJNmV5SmhhVzFpYjNRaU9uc2labUZyWldSMVkyc2lPbnNpWm5KbFpYcGxYM0JsY21sdlpDSTZkSEoxWlN3aWRXNXNiMk5ySWpwMGNuVmxmU3dpWjNKbGJtRmtaVjl5Wld4bFlYTmxJanA3SW1OdmJHeHBjMmx2Ymw5cGJtWnZJanBtWVd4elpTd2laR0Z0WVdkbElqb3dMakFzSW0xdmJHeDVYMlJwYzNSaGJtTmxJam94TURBdU1Dd2ljM2RwZEdOb0lqcG1ZV3h6Wlgwc0lteGhkR1Z1WTNraU9uc2ljM2RwZEdOb0lqcDBjblZsZlN3aWJHOW5aMmx1WnlJNmV5SmpiMnh2Y25NaU9uc2lhR2wwSWpvaUkwRkNRelpHTUVaR0lpd2liV2x6Y3lJNklpTkJRa00yUmpGR1JpSjlMQ0pqZFhOMGIyMXBlbUYwYVc5dUlqcDdJbkJ5WldacGVDSTZJbXhqYzJWdWMyVWlmU3dpYlc5a1pTSTZleUp6Wld4bFkzUWlPbHNpUVdsdFltOTBJaXdpZmlKZGZTd2ljM2RwZEdOb0lqcDBjblZsZlgwc0ltMXZkbVZ0Wlc1MElqcDdJbUYxZEc5emQybDBZMmdpT25zaVpHbHpkR0Z1WTJWZmMyeHBaR1Z5SWpvMU1EQXVNQ3dpYzNkcGRHTm9JanBtWVd4elpTd2lkSEpwWjJkbGNuTWlPbHNpZmlKZExDSjNaV0Z3YjI1ZmMyVnNaV04wSWpvaWMzTm5NRGdpZlN3aVpXUm5aVjl4ZFdsamExOXpkRzl3SWpwbVlXeHpaU3dpWm1Gc2JGOWtZVzFoWjJVaU9uUnlkV1VzSW1aaGMzUmZiR0ZrWkdWeUlqcDBjblZsZlN3aWNHeGhlV1Z5WDJGdWFXMWhkR2x2Ym5NaU9uc2labUZzYkdsdVp5STZleUoyWVd4MVpTSTZNQzR3ZlN3aWFXNTBaWEp3YjJ4aGRHbHZiaUk2TVM0d0xDSnFhWFIwWlhKZmJHVm5jeUk2ZXlKbWNtOXRJam94TURBdU1Dd2ljM2RwZEdOb0lqcDBjblZsTENKMGJ5STZOall1TUgwc0lteGxZVzVwYm1jaU9uc2lkbUZzZFdVaU9qRXdNQzR3ZlgxOUxDSjJhWE4xWVd4eklqcDdJbUZrWkc5dWN5STZXeUpTWlcxdmRtVWdVMnhsWlhabGN5SXNJa3RsWlhBZ1RXOWtaV3dnVkhKaGJuTndZWEpsYm1ONUlpd2lmaUpkTENKaGMzQmxZM1JmY21GMGFXOGlPbnNpYzNkcGRHTm9JanAwY25WbExDSjJZV3gxWlNJNk1UTXpMakI5TENKa1lXMWhaMlZmYVc1a2FXTmhkRzl5SWpwN0ltMXBibDl2Ym14NUlqcG1ZV3h6WlN3aWMzZHBkR05vSWpwbVlXeHpaWDBzSW1ocGRHMWhjbXRsY2lJNmV5SmpiMnh2Y2lJNld5SXlSQ0lzSWlOR1JrWkdSa1pHUmlJc0luNGlYU3dpYzJWc1pXTjBJanBiSWpKRUlpd2lNMFFpTENKK0lsMHNJblJwYldVaU9qRXdMakI5TENKdFlXNTFZV3hmWVhKeWIzZHpJanA3SW1OdmJHOXlJam9pSTBaR1JrWkdSa1pHSWl3aVptOXVkQ0k2SWtSbFptRjFiSFFpTENKdlptWnpaWFFpT2pNMUxqQXNJbk4zYVhSamFDSTZabUZzYzJVc0luTjViV0p2YkhNaU9uc2labTl5ZDJGeVpDSTZJbDRpTENKc1pXWjBJam9pUENJc0luSnBaMmgwSWpvaVBpSjlmU3dpYzJOdmNHVmZiM1psY214aGVTSTZleUpoYm1sdFlYUnBiMjRpT25SeWRXVXNJbU52Ykc5eWN5STZleUpsWkdkbElqb2lJekF3TURBd01EQXdJaXdpYldGcGJpSTZJaU00TlRnMU9EVkVOaUo5TENKbllYQWlPalV1TUN3aWJHVnVaM1JvSWpveU9EZ3VNQ3dpYjNCMGFXOXVjeUk2V3lKK0lsMHNJbk4zYVhSamFDSTZkSEoxWlgwc0luTnJaV1YwWDJsdVpHbGpZWFJ2Y25NaU9uc2lZbTl0WWlJNmRISjFaU3dpWm1WaGRIVnlaWE1pT2xzaVJtOXlZMlVnYzJGbVpTQndiMmx1ZENJc0lrWnZjbU5sSUdKdlpIa2dZV2x0SWl3aVVHbHVaeUJ6Y0dsclpTSXNJa1J2ZFdKc1pTQjBZWEFpTENKRWRXTnJJSEJsWldzZ1lYTnphWE4wSWl3aVJuSmxaWE4wWVc1a2FXNW5JaXdpVDI0Z2MyaHZkQ0JoYm5ScExXRnBiU0lzSWsxcGJtbHRkVzBnWkdGdFlXZGxJRzkyWlhKeWFXUmxJaXdpZmlKZExDSnpkMmwwWTJnaU9tWmhiSE5sZlN3aWMydDVZbTk0SWpvaVRtbG5hSFFpTENKMlpXeHZZMmwwZVY5M1lYSnVhVzVuSWpwN0ltTnZiRzl5SWpvaUkwWkdSa1pHUmtaR0lpd2ljM2RwZEdOb0lqcG1ZV3h6Wlgwc0luWnBaWGR0YjJSbGJGOWphR0Z1WjJWeUlqcDdJbVp2ZGlJNk5UZ3dMakFzSW14bFpuUWlPbVpoYkhObExDSnpkMmwwWTJnaU9uUnlkV1VzSW5naU9qSXVNQ3dpZVNJNk55NHdMQ0o2SWpveU5TNHdmWDE5IiwibmFtZSI6ImRzYWRhc2Rhc2QiLCJ0aW1lIjoxNzc0ODA2MDE2LjB9",
				name = "100%BOBERLC"
			},
			[2] = {
				data = "eyJhdXRob3IiOiJWXzEiLCJjb25maWciOiJleUpoYm5ScFlXbHRJanA3SW1GdVoyeGxjeUk2ZXlKaGJuUnBYMkp5ZFhSbFptOXlZMlVpT25zaWJXOWtaU0k2SWsxbGRHRWlMQ0p1YjNScFpua2lPbVpoYkhObExDSnpkR0YwWlhNaU9sc2lVM1JoYm1ScGJtY2lMQ0pTZFc1dWFXNW5JaXdpVTJ4dmQybHVaeUlzSWtOeWIzVmphR2x1WnlJc0lsTnVaV0ZyYVc1bklpd2lRV2x5SWl3aVFXbHlJRU55YjNWamFHbHVaeUlzSWt4bFoybDBJRUZCSWl3aWZpSmRMQ0p6ZDJsMFkyZ2lPblJ5ZFdVc0luUnBiV1Z2ZFhRaU9qTXdMakI5TENKaWNtVmhhMTlzWXlJNmV5SmthWE5oWW14bFgyOXVYMmR5Wlc1aFpHVWlPblJ5ZFdVc0ltaHBaR1ZmYzJodmRITWlPaUpDY21WaGF5Qk1ReUlzSW5ObGJHVmpkQ0k2V3lKVGRHRnVaR2x1WnlJc0lsSjFibTVwYm1jaUxDSlRiRzkzYVc1bklpd2lRM0p2ZFdOb2FXNW5JaXdpVTI1bFlXdHBibWNpTENKQmFYSWlMQ0pCYVhJZ1EzSnZkV05vYVc1bklpd2lUR1ZuYVhRZ1FVRWlMQ0pHY21WbGMzUmhibVJwYm1jaUxDSitJbDE5TENKaWRXbHNaR1Z5SWpwN0lrRnBjaUk2ZXlKRFZDSTZleUppYjJSNVgyWnlaV1Z6ZEdGdVpHbHVaeUk2SWs5bVppSXNJbUp2WkhsZmVXRjNJanAwY25WbExDSmliMlI1WDNsaGQxOXZjSFJwYjI1eklqcGJJa3BwZEhSbGNpSXNJbjRpWFN3aVkyaHZhMlVpT2lKRVpXWmhkV3gwSWl3aVkyaHZhMlV4WHpFaU9qSXVNQ3dpWTJodmEyVXhYeklpT2pJdU1Dd2lZMmh2YTJVeFh6TWlPakl1TUN3aVkyaHZhMlV4WHpRaU9qSXVNQ3dpWTJodmEyVXhYelVpT2pJdU1Dd2lZMmh2YTJVeFh6WWlPakl1TUN3aVkyaHZhMlZmWm5KdmJTSTZNVFl1TUN3aVkyaHZhMlZmYldWMGFHOWtJam9pVW1GdVpHOXRJaXdpWTJodmEyVmZjMnhwWkdWeUlqb3hOaTR3TENKamFHOXJaVjl6Ykdsa1pYSnpJam95TGpBc0ltTm9iMnRsWDNSdklqb3hOaTR3TENKamRYTjBiMjFmWTJodmEyVWlPbVpoYkhObExDSmtaV3hoZVNJNmRISjFaU3dpWkdWc1lYbGZNU0k2TWk0d0xDSmtaV3hoZVY4eUlqb3hMakFzSW1SbGJHRjVYek1pT2pFdU1Dd2laR1ZzWVhsZk5DSTZNUzR3TENKa1pXeGhlVjgxSWpveUxqQXNJbVJsYkdGNVh6WWlPakl1TUN3aVpHVnNZWGxmWTNWemRHOXRYM05zYVdSbGNuTWlPakl1TUN3aVpHVnNZWGxmWkdWbVlYVnNkQ0k2Tnk0d0xDSmtaV3hoZVY5c2IyZHBZeUk2SWt4bFoyRmplU0lzSW1SbGJHRjVYMjFsZEdodlpDSTZJbEpoYm1SdmJTSXNJbVJsYkdGNVgzSmhibVJ2YlY5dFlYZ2lPalF1TUN3aVpHVnNZWGxmY21GdVpHOXRYMjFwYmlJNk5DNHdMQ0ptY205dFgyeHBiV2wwSWpvMk1DNHdMQ0pzWldaMFgyeHBiV2wwSWpvMk1DNHdMQ0pzYVcxcGRGOXRiMlJsSWpvaVUzUmhkR2xqSWl3aWJXRjRJam93TGpBc0ltMWhlR2x0ZFcxZmJHbHRhWFFpT2pZd0xqQXNJbTFwYmlJNk1DNHdMQ0p0YVc1cGJYVnRYMnhwYldsMElqbzJNQzR3TENKdGIyUmxJam9pVTNSaGRHbGpJaXdpYlc5a1pWOXlZVzVrYjIwaU9qUXVNQ3dpYlc5a1pWOTBhV05yY3lJNk5DNHdMQ0p0YjJScFptbGxjaUk2SWtScGMyRmliR1ZrSWl3aWJXOWthV1pwWlhKZlkzVnpkRzl0WDNOc2FXUmxjbk1pT2pJdU1Dd2liVzlrYVdacFpYSmZiVzlrWlNJNklrUmxabUYxYkhRaUxDSnRiMlJwWm1sbGNsOXZabVp6WlhRaU9pMHhNeTR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpFaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh5SWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZNeUk2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6UWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4MUlqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTmlJNk1DNHdMQ0p2Wm1aelpYUWlPakF1TUN3aWNtRnVaRzl0YVhwbElqcG1ZV3h6WlN3aWNtbG5hSFJmYkdsdGFYUWlPall3TGpBc0luTmlYM053WldWa0lqb3hMakFzSW5OcGJtVjNZWFpsWDNOd1pXVmtJam8xTGpBc0luUnZYMnhwYldsMElqbzJNQzR3TENKNVlYZGZiR1ZtZENJNkxUSXhMakFzSW5saGQxOXRiMlJsSWpveUxqQXNJbmxoZDE5eWFXZG9kQ0k2TXpVdU1IMHNJbFFpT25zaVltOWtlVjltY21WbGMzUmhibVJwYm1jaU9pSlBabVlpTENKaWIyUjVYM2xoZHlJNmRISjFaU3dpWW05a2VWOTVZWGRmYjNCMGFXOXVjeUk2V3lKS2FYUjBaWElpTENKK0lsMHNJbU5vYjJ0bElqb2lSR1ZtWVhWc2RDSXNJbU5vYjJ0bE1WOHhJam95TGpBc0ltTm9iMnRsTVY4eUlqb3lMakFzSW1Ob2IydGxNVjh6SWpveUxqQXNJbU5vYjJ0bE1WODBJam95TGpBc0ltTm9iMnRsTVY4MUlqb3lMakFzSW1Ob2IydGxNVjgySWpveUxqQXNJbU5vYjJ0bFgyWnliMjBpT2pFMkxqQXNJbU5vYjJ0bFgyMWxkR2h2WkNJNklsSmhibVJ2YlNJc0ltTm9iMnRsWDNOc2FXUmxjaUk2TVRZdU1Dd2lZMmh2YTJWZmMyeHBaR1Z5Y3lJNk1pNHdMQ0pqYUc5clpWOTBieUk2TVRZdU1Dd2lZM1Z6ZEc5dFgyTm9iMnRsSWpwbVlXeHpaU3dpWkdWc1lYa2lPblJ5ZFdVc0ltUmxiR0Y1WHpFaU9qSXVNQ3dpWkdWc1lYbGZNaUk2TUM0d0xDSmtaV3hoZVY4eklqb3dMakFzSW1SbGJHRjVYelFpT2pBdU1Dd2laR1ZzWVhsZk5TSTZNaTR3TENKa1pXeGhlVjgySWpveUxqQXNJbVJsYkdGNVgyTjFjM1J2YlY5emJHbGtaWEp6SWpveUxqQXNJbVJsYkdGNVgyUmxabUYxYkhRaU9qY3VNQ3dpWkdWc1lYbGZiRzluYVdNaU9pSk1aV2RoWTNraUxDSmtaV3hoZVY5dFpYUm9iMlFpT2lKU1lXNWtiMjBpTENKa1pXeGhlVjl5WVc1a2IyMWZiV0Y0SWpvMExqQXNJbVJsYkdGNVgzSmhibVJ2YlY5dGFXNGlPalF1TUN3aVpuSnZiVjlzYVcxcGRDSTZOakF1TUN3aWJHVm1kRjlzYVcxcGRDSTZOakF1TUN3aWJHbHRhWFJmYlc5a1pTSTZJbE4wWVhScFl5SXNJbTFoZUNJNk1DNHdMQ0p0WVhocGJYVnRYMnhwYldsMElqbzJNQzR3TENKdGFXNGlPakF1TUN3aWJXbHVhVzExYlY5c2FXMXBkQ0k2TmpBdU1Dd2liVzlrWlNJNklsTjBZWFJwWXlJc0ltMXZaR1ZmY21GdVpHOXRJam8wTGpBc0ltMXZaR1ZmZEdsamEzTWlPalF1TUN3aWJXOWthV1pwWlhJaU9pSkVhWE5oWW14bFpDSXNJbTF2WkdsbWFXVnlYMk4xYzNSdmJWOXpiR2xrWlhKeklqb3lMakFzSW0xdlpHbG1hV1Z5WDIxdlpHVWlPaUpFWldaaGRXeDBJaXdpYlc5a2FXWnBaWEpmYjJabWMyVjBJam90TVRNdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxOHhJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk1pSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpNaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTgwSWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZOU0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6WWlPakF1TUN3aWIyWm1jMlYwSWpvd0xqQXNJbkpoYm1SdmJXbDZaU0k2Wm1Gc2MyVXNJbkpwWjJoMFgyeHBiV2wwSWpvMk1DNHdMQ0p6WWw5emNHVmxaQ0k2TVM0d0xDSnphVzVsZDJGMlpWOXpjR1ZsWkNJNk5TNHdMQ0owYjE5c2FXMXBkQ0k2TmpBdU1Dd2llV0YzWDJ4bFpuUWlPaTB5TVM0d0xDSjVZWGRmYlc5a1pTSTZNaTR3TENKNVlYZGZjbWxuYUhRaU9qTTFMakI5ZlN3aVFXbHlJRU55YjNWamFHbHVaeUk2ZXlKRFZDSTZleUppYjJSNVgyWnlaV1Z6ZEdGdVpHbHVaeUk2SWs5bVppSXNJbUp2WkhsZmVXRjNJanAwY25WbExDSmliMlI1WDNsaGQxOXZjSFJwYjI1eklqcGJJa3BwZEhSbGNpSXNJbjRpWFN3aVkyaHZhMlVpT2lKRVpXWmhkV3gwSWl3aVkyaHZhMlV4WHpFaU9qRXVNQ3dpWTJodmEyVXhYeklpT2pJeUxqQXNJbU5vYjJ0bE1WOHpJam8wTGpBc0ltTm9iMnRsTVY4MElqb3hOQzR3TENKamFHOXJaVEZmTlNJNk5TNHdMQ0pqYUc5clpURmZOaUk2TkM0d0xDSmphRzlyWlY5bWNtOXRJam95TGpBc0ltTm9iMnRsWDIxbGRHaHZaQ0k2SWxKaGJtUnZiU0lzSW1Ob2IydGxYM05zYVdSbGNpSTZNVFl1TUN3aVkyaHZhMlZmYzJ4cFpHVnljeUk2TWk0d0xDSmphRzlyWlY5MGJ5STZNakl1TUN3aVkzVnpkRzl0WDJOb2IydGxJanAwY25WbExDSmtaV3hoZVNJNmRISjFaU3dpWkdWc1lYbGZNU0k2TWk0d0xDSmtaV3hoZVY4eUlqb3hMakFzSW1SbGJHRjVYek1pT2pFdU1Dd2laR1ZzWVhsZk5DSTZNUzR3TENKa1pXeGhlVjgxSWpveUxqQXNJbVJsYkdGNVh6WWlPakl1TUN3aVpHVnNZWGxmWTNWemRHOXRYM05zYVdSbGNuTWlPakl1TUN3aVpHVnNZWGxmWkdWbVlYVnNkQ0k2Tmk0d0xDSmtaV3hoZVY5c2IyZHBZeUk2SWt4bFoyRmplU0lzSW1SbGJHRjVYMjFsZEdodlpDSTZJbEpoYm1SdmJTSXNJbVJsYkdGNVgzSmhibVJ2YlY5dFlYZ2lPalV1TUN3aVpHVnNZWGxmY21GdVpHOXRYMjFwYmlJNk15NHdMQ0ptY205dFgyeHBiV2wwSWpveU9DNHdMQ0pzWldaMFgyeHBiV2wwSWpvMk1DNHdMQ0pzYVcxcGRGOXRiMlJsSWpvaVUzUmhkR2xqSWl3aWJXRjRJam93TGpBc0ltMWhlR2x0ZFcxZmJHbHRhWFFpT2pZd0xqQXNJbTFwYmlJNkxURTFMakFzSW0xcGJtbHRkVzFmYkdsdGFYUWlPall3TGpBc0ltMXZaR1VpT2lKVGRHRjBhV01pTENKdGIyUmxYM0poYm1SdmJTSTZOQzR3TENKdGIyUmxYM1JwWTJ0eklqb3hNUzR3TENKdGIyUnBabWxsY2lJNklrUnBjMkZpYkdWa0lpd2liVzlrYVdacFpYSmZZM1Z6ZEc5dFgzTnNhV1JsY25NaU9qSXVNQ3dpYlc5a2FXWnBaWEpmYlc5a1pTSTZJa1JsWm1GMWJIUWlMQ0p0YjJScFptbGxjbDl2Wm1aelpYUWlPaTAxTGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk1TSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpJaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh6SWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZOQ0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6VWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4Mklqb3dMakFzSW05bVpuTmxkQ0k2TUM0d0xDSnlZVzVrYjIxcGVtVWlPbVpoYkhObExDSnlhV2RvZEY5c2FXMXBkQ0k2TmpBdU1Dd2ljMkpmYzNCbFpXUWlPakUwTGpBc0luTnBibVYzWVhabFgzTndaV1ZrSWpvMUxqQXNJblJ2WDJ4cGJXbDBJam8xT0M0d0xDSjVZWGRmYkdWbWRDSTZMVEl4TGpBc0lubGhkMTl0YjJSbElqb3lMakFzSW5saGQxOXlhV2RvZENJNk5ESXVNSDBzSWxRaU9uc2lZbTlrZVY5bWNtVmxjM1JoYm1ScGJtY2lPaUpQWm1ZaUxDSmliMlI1WDNsaGR5STZkSEoxWlN3aVltOWtlVjk1WVhkZmIzQjBhVzl1Y3lJNld5SkthWFIwWlhJaUxDSitJbDBzSW1Ob2IydGxJam9pUkdWbVlYVnNkQ0lzSW1Ob2IydGxNVjh4SWpveExqQXNJbU5vYjJ0bE1WOHlJam95TWk0d0xDSmphRzlyWlRGZk15STZOQzR3TENKamFHOXJaVEZmTkNJNk1UUXVNQ3dpWTJodmEyVXhYelVpT2pVdU1Dd2lZMmh2YTJVeFh6WWlPalF1TUN3aVkyaHZhMlZmWm5KdmJTSTZNaTR3TENKamFHOXJaVjl0WlhSb2IyUWlPaUpTWVc1a2IyMGlMQ0pqYUc5clpWOXpiR2xrWlhJaU9qRTJMakFzSW1Ob2IydGxYM05zYVdSbGNuTWlPakl1TUN3aVkyaHZhMlZmZEc4aU9qSXlMakFzSW1OMWMzUnZiVjlqYUc5clpTSTZkSEoxWlN3aVpHVnNZWGtpT25SeWRXVXNJbVJsYkdGNVh6RWlPakl1TUN3aVpHVnNZWGxmTWlJNk1TNHdMQ0prWld4aGVWOHpJam94TGpBc0ltUmxiR0Y1WHpRaU9qRXVNQ3dpWkdWc1lYbGZOU0k2TWk0d0xDSmtaV3hoZVY4Mklqb3lMakFzSW1SbGJHRjVYMk4xYzNSdmJWOXpiR2xrWlhKeklqb3lMakFzSW1SbGJHRjVYMlJsWm1GMWJIUWlPall1TUN3aVpHVnNZWGxmYkc5bmFXTWlPaUpNWldkaFkza2lMQ0prWld4aGVWOXRaWFJvYjJRaU9pSlNZVzVrYjIwaUxDSmtaV3hoZVY5eVlXNWtiMjFmYldGNElqbzFMakFzSW1SbGJHRjVYM0poYm1SdmJWOXRhVzRpT2pNdU1Dd2labkp2YlY5c2FXMXBkQ0k2TWpndU1Dd2liR1ZtZEY5c2FXMXBkQ0k2TmpBdU1Dd2liR2x0YVhSZmJXOWtaU0k2SWxOMFlYUnBZeUlzSW0xaGVDSTZNQzR3TENKdFlYaHBiWFZ0WDJ4cGJXbDBJam8yTUM0d0xDSnRhVzRpT2kweE5TNHdMQ0p0YVc1cGJYVnRYMnhwYldsMElqbzJNQzR3TENKdGIyUmxJam9pVTNSaGRHbGpJaXdpYlc5a1pWOXlZVzVrYjIwaU9qUXVNQ3dpYlc5a1pWOTBhV05yY3lJNk1URXVNQ3dpYlc5a2FXWnBaWElpT2lKRWFYTmhZbXhsWkNJc0ltMXZaR2xtYVdWeVgyTjFjM1J2YlY5emJHbGtaWEp6SWpveUxqQXNJbTF2WkdsbWFXVnlYMjF2WkdVaU9pSkVaV1poZFd4MElpd2liVzlrYVdacFpYSmZiMlptYzJWMElqb3ROUzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpFaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh5SWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZNeUk2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6UWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4MUlqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTmlJNk1DNHdMQ0p2Wm1aelpYUWlPakF1TUN3aWNtRnVaRzl0YVhwbElqcG1ZV3h6WlN3aWNtbG5hSFJmYkdsdGFYUWlPall3TGpBc0luTmlYM053WldWa0lqb3hOQzR3TENKemFXNWxkMkYyWlY5emNHVmxaQ0k2TlM0d0xDSjBiMTlzYVcxcGRDSTZOVGd1TUN3aWVXRjNYMnhsWm5RaU9pMHlNUzR3TENKNVlYZGZiVzlrWlNJNk1pNHdMQ0o1WVhkZmNtbG5hSFFpT2pReUxqQjlmU3dpUTNKdmRXTm9hVzVuSWpwN0lrTlVJanA3SW1KdlpIbGZabkpsWlhOMFlXNWthVzVuSWpvaVQyWm1JaXdpWW05a2VWOTVZWGNpT25SeWRXVXNJbUp2WkhsZmVXRjNYMjl3ZEdsdmJuTWlPbHNpU21sMGRHVnlJaXdpZmlKZExDSmphRzlyWlNJNklrUmxabUYxYkhRaUxDSmphRzlyWlRGZk1TSTZOaTR3TENKamFHOXJaVEZmTWlJNk1qSXVNQ3dpWTJodmEyVXhYek1pT2pRdU1Dd2lZMmh2YTJVeFh6UWlPakUwTGpBc0ltTm9iMnRsTVY4MUlqbzVMakFzSW1Ob2IydGxNVjgySWpvMExqQXNJbU5vYjJ0bFgyWnliMjBpT2pndU1Dd2lZMmh2YTJWZmJXVjBhRzlrSWpvaVUyVnhkV1Z1ZEdsaGJDSXNJbU5vYjJ0bFgzTnNhV1JsY2lJNk1UWXVNQ3dpWTJodmEyVmZjMnhwWkdWeWN5STZOaTR3TENKamFHOXJaVjkwYnlJNk1qSXVNQ3dpWTNWemRHOXRYMk5vYjJ0bElqcDBjblZsTENKa1pXeGhlU0k2ZEhKMVpTd2laR1ZzWVhsZk1TSTZNaTR3TENKa1pXeGhlVjh5SWpveExqQXNJbVJsYkdGNVh6TWlPakV1TUN3aVpHVnNZWGxmTkNJNk1TNHdMQ0prWld4aGVWODFJam95TGpBc0ltUmxiR0Y1WHpZaU9qSXVNQ3dpWkdWc1lYbGZZM1Z6ZEc5dFgzTnNhV1JsY25NaU9qSXVNQ3dpWkdWc1lYbGZaR1ZtWVhWc2RDSTZPUzR3TENKa1pXeGhlVjlzYjJkcFl5STZJa3hsWjJGamVTSXNJbVJsYkdGNVgyMWxkR2h2WkNJNklsSmhibVJ2YlNJc0ltUmxiR0Y1WDNKaGJtUnZiVjl0WVhnaU9qZ3VNQ3dpWkdWc1lYbGZjbUZ1Wkc5dFgyMXBiaUk2TWk0d0xDSm1jbTl0WDJ4cGJXbDBJam8yTUM0d0xDSnNaV1owWDJ4cGJXbDBJam8yTUM0d0xDSnNhVzFwZEY5dGIyUmxJam9pVTNSaGRHbGpJaXdpYldGNElqb3dMakFzSW0xaGVHbHRkVzFmYkdsdGFYUWlPall3TGpBc0ltMXBiaUk2TFRFMUxqQXNJbTFwYm1sdGRXMWZiR2x0YVhRaU9qWXdMakFzSW0xdlpHVWlPaUpUZEdGMGFXTWlMQ0p0YjJSbFgzSmhibVJ2YlNJNk5DNHdMQ0p0YjJSbFgzUnBZMnR6SWpvMExqQXNJbTF2WkdsbWFXVnlJam9pUkdsellXSnNaV1FpTENKdGIyUnBabWxsY2w5amRYTjBiMjFmYzJ4cFpHVnljeUk2TXk0d0xDSnRiMlJwWm1sbGNsOXRiMlJsSWpvaVEzVnpkRzl0SWl3aWJXOWthV1pwWlhKZmIyWm1jMlYwSWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZNU0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6SWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4eklqb3RNVFV1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4MElqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTlNJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYellpT2pBdU1Dd2liMlptYzJWMElqb3dMakFzSW5KaGJtUnZiV2w2WlNJNmRISjFaU3dpY21sbmFIUmZiR2x0YVhRaU9qWXdMakFzSW5OaVgzTndaV1ZrSWpveExqQXNJbk5wYm1WM1lYWmxYM053WldWa0lqbzFMakFzSW5SdlgyeHBiV2wwSWpvMk1DNHdMQ0o1WVhkZmJHVm1kQ0k2TFRJMExqQXNJbmxoZDE5dGIyUmxJam95TGpBc0lubGhkMTl5YVdkb2RDSTZORFF1TUgwc0lsUWlPbnNpWW05a2VWOW1jbVZsYzNSaGJtUnBibWNpT2lKUFptWWlMQ0ppYjJSNVgzbGhkeUk2ZEhKMVpTd2lZbTlrZVY5NVlYZGZiM0IwYVc5dWN5STZXeUorSWwwc0ltTm9iMnRsSWpvaVJHVm1ZWFZzZENJc0ltTm9iMnRsTVY4eElqbzJMakFzSW1Ob2IydGxNVjh5SWpveU1pNHdMQ0pqYUc5clpURmZNeUk2TkM0d0xDSmphRzlyWlRGZk5DSTZNVFF1TUN3aVkyaHZhMlV4WHpVaU9qa3VNQ3dpWTJodmEyVXhYellpT2pRdU1Dd2lZMmh2YTJWZlpuSnZiU0k2T0M0d0xDSmphRzlyWlY5dFpYUm9iMlFpT2lKVFpYRjFaVzUwYVdGc0lpd2lZMmh2YTJWZmMyeHBaR1Z5SWpveE5pNHdMQ0pqYUc5clpWOXpiR2xrWlhKeklqbzJMakFzSW1Ob2IydGxYM1J2SWpveU1pNHdMQ0pqZFhOMGIyMWZZMmh2YTJVaU9uUnlkV1VzSW1SbGJHRjVJanAwY25WbExDSmtaV3hoZVY4eElqb3lMakFzSW1SbGJHRjVYeklpT2pFdU1Dd2laR1ZzWVhsZk15STZNUzR3TENKa1pXeGhlVjgwSWpveExqQXNJbVJsYkdGNVh6VWlPakl1TUN3aVpHVnNZWGxmTmlJNk1pNHdMQ0prWld4aGVWOWpkWE4wYjIxZmMyeHBaR1Z5Y3lJNk1pNHdMQ0prWld4aGVWOWtaV1poZFd4MElqbzVMakFzSW1SbGJHRjVYMnh2WjJsaklqb2lUR1ZuWVdONUlpd2laR1ZzWVhsZmJXVjBhRzlrSWpvaVVtRnVaRzl0SWl3aVpHVnNZWGxmY21GdVpHOXRYMjFoZUNJNk9DNHdMQ0prWld4aGVWOXlZVzVrYjIxZmJXbHVJam95TGpBc0ltWnliMjFmYkdsdGFYUWlPall3TGpBc0lteGxablJmYkdsdGFYUWlPall3TGpBc0lteHBiV2wwWDIxdlpHVWlPaUpUZEdGMGFXTWlMQ0p0WVhnaU9qQXVNQ3dpYldGNGFXMTFiVjlzYVcxcGRDSTZOakF1TUN3aWJXbHVJam90TVRVdU1Dd2liV2x1YVcxMWJWOXNhVzFwZENJNk5qQXVNQ3dpYlc5a1pTSTZJbE4wWVhScFl5SXNJbTF2WkdWZmNtRnVaRzl0SWpvMExqQXNJbTF2WkdWZmRHbGphM01pT2pRdU1Dd2liVzlrYVdacFpYSWlPaUpFYVhOaFlteGxaQ0lzSW0xdlpHbG1hV1Z5WDJOMWMzUnZiVjl6Ykdsa1pYSnpJam96TGpBc0ltMXZaR2xtYVdWeVgyMXZaR1VpT2lKRGRYTjBiMjBpTENKdGIyUnBabWxsY2w5dlptWnpaWFFpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxOHhJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk1pSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpNaU9pMHhOUzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpRaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTgxSWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZOaUk2TUM0d0xDSnZabVp6WlhRaU9qQXVNQ3dpY21GdVpHOXRhWHBsSWpwMGNuVmxMQ0p5YVdkb2RGOXNhVzFwZENJNk5qQXVNQ3dpYzJKZmMzQmxaV1FpT2pFdU1Dd2ljMmx1WlhkaGRtVmZjM0JsWldRaU9qVXVNQ3dpZEc5ZmJHbHRhWFFpT2pZd0xqQXNJbmxoZDE5c1pXWjBJam90TWpRdU1Dd2llV0YzWDIxdlpHVWlPakl1TUN3aWVXRjNYM0pwWjJoMElqbzBOQzR3Zlgwc0lrWnlaV1Z6ZEdGdVpHbHVaeUk2ZXlKRFZDSTZleUpoYkd4dmQxOXpkR0YwWlNJNmRISjFaU3dpWW05a2VWOW1jbVZsYzNSaGJtUnBibWNpT2lKUFptWWlMQ0ppYjJSNVgzbGhkeUk2ZEhKMVpTd2lZbTlrZVY5NVlYZGZiM0IwYVc5dWN5STZXeUpLYVhSMFpYSWlMQ0orSWwwc0ltTm9iMnRsSWpvaVJHVm1ZWFZzZENJc0ltTm9iMnRsTVY4eElqb3lMakFzSW1Ob2IydGxNVjh5SWpveUxqQXNJbU5vYjJ0bE1WOHpJam95TGpBc0ltTm9iMnRsTVY4MElqb3lMakFzSW1Ob2IydGxNVjgxSWpveUxqQXNJbU5vYjJ0bE1WODJJam95TGpBc0ltTm9iMnRsWDJaeWIyMGlPakUyTGpBc0ltTm9iMnRsWDIxbGRHaHZaQ0k2SWxKaGJtUnZiU0lzSW1Ob2IydGxYM05zYVdSbGNpSTZNVFl1TUN3aVkyaHZhMlZmYzJ4cFpHVnljeUk2TWk0d0xDSmphRzlyWlY5MGJ5STZNVFl1TUN3aVkzVnpkRzl0WDJOb2IydGxJanBtWVd4elpTd2laR1ZzWVhraU9tWmhiSE5sTENKa1pXeGhlVjh4SWpvd0xqQXNJbVJsYkdGNVh6SWlPakF1TUN3aVpHVnNZWGxmTXlJNk1DNHdMQ0prWld4aGVWODBJam93TGpBc0ltUmxiR0Y1WHpVaU9qQXVNQ3dpWkdWc1lYbGZOaUk2TUM0d0xDSmtaV3hoZVY5amRYTjBiMjFmYzJ4cFpHVnljeUk2TWk0d0xDSmtaV3hoZVY5a1pXWmhkV3gwSWpvd0xqQXNJbVJsYkdGNVgyeHZaMmxqSWpvaVJHVm1ZWFZzZENJc0ltUmxiR0Y1WDIxbGRHaHZaQ0k2SWtSbFptRjFiSFFpTENKa1pXeGhlVjl5WVc1a2IyMWZiV0Y0SWpvd0xqQXNJbVJsYkdGNVgzSmhibVJ2YlY5dGFXNGlPakF1TUN3aVpuSnZiVjlzYVcxcGRDSTZOakF1TUN3aWJHVm1kRjlzYVcxcGRDSTZOakF1TUN3aWJHbHRhWFJmYlc5a1pTSTZJbE4wWVhScFl5SXNJbTFoZUNJNk1DNHdMQ0p0WVhocGJYVnRYMnhwYldsMElqbzJNQzR3TENKdGFXNGlPakF1TUN3aWJXbHVhVzExYlY5c2FXMXBkQ0k2TmpBdU1Dd2liVzlrWlNJNklsTjBZWFJwWXlJc0ltMXZaR1ZmY21GdVpHOXRJam8wTGpBc0ltMXZaR1ZmZEdsamEzTWlPalF1TUN3aWJXOWthV1pwWlhJaU9pSkVhWE5oWW14bFpDSXNJbTF2WkdsbWFXVnlYMk4xYzNSdmJWOXpiR2xrWlhKeklqb3lMakFzSW0xdlpHbG1hV1Z5WDIxdlpHVWlPaUpFWldaaGRXeDBJaXdpYlc5a2FXWnBaWEpmYjJabWMyVjBJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk1TSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpJaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh6SWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZOQ0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6VWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4Mklqb3dMakFzSW05bVpuTmxkQ0k2TUM0d0xDSnlZVzVrYjIxcGVtVWlPbVpoYkhObExDSnlhV2RvZEY5c2FXMXBkQ0k2TmpBdU1Dd2ljMkpmYzNCbFpXUWlPakV1TUN3aWMybHVaWGRoZG1WZmMzQmxaV1FpT2pVdU1Dd2lkRzlmYkdsdGFYUWlPall3TGpBc0lubGhkMTlzWldaMElqb3dMakFzSW5saGQxOXRiMlJsSWpveExqQXNJbmxoZDE5eWFXZG9kQ0k2TUM0d2ZTd2lWQ0k2ZXlKaGJHeHZkMTl6ZEdGMFpTSTZkSEoxWlN3aVltOWtlVjltY21WbGMzUmhibVJwYm1jaU9pSlBabVlpTENKaWIyUjVYM2xoZHlJNmRISjFaU3dpWW05a2VWOTVZWGRmYjNCMGFXOXVjeUk2V3lKS2FYUjBaWElpTENKK0lsMHNJbU5vYjJ0bElqb2lSR1ZtWVhWc2RDSXNJbU5vYjJ0bE1WOHhJam95TGpBc0ltTm9iMnRsTVY4eUlqb3lMakFzSW1Ob2IydGxNVjh6SWpveUxqQXNJbU5vYjJ0bE1WODBJam95TGpBc0ltTm9iMnRsTVY4MUlqb3lMakFzSW1Ob2IydGxNVjgySWpveUxqQXNJbU5vYjJ0bFgyWnliMjBpT2pFMkxqQXNJbU5vYjJ0bFgyMWxkR2h2WkNJNklsSmhibVJ2YlNJc0ltTm9iMnRsWDNOc2FXUmxjaUk2TVRZdU1Dd2lZMmh2YTJWZmMyeHBaR1Z5Y3lJNk1pNHdMQ0pqYUc5clpWOTBieUk2TVRZdU1Dd2lZM1Z6ZEc5dFgyTm9iMnRsSWpwbVlXeHpaU3dpWkdWc1lYa2lPbVpoYkhObExDSmtaV3hoZVY4eElqb3dMakFzSW1SbGJHRjVYeklpT2pBdU1Dd2laR1ZzWVhsZk15STZNQzR3TENKa1pXeGhlVjgwSWpvd0xqQXNJbVJsYkdGNVh6VWlPakF1TUN3aVpHVnNZWGxmTmlJNk1DNHdMQ0prWld4aGVWOWpkWE4wYjIxZmMyeHBaR1Z5Y3lJNk1pNHdMQ0prWld4aGVWOWtaV1poZFd4MElqb3dMakFzSW1SbGJHRjVYMnh2WjJsaklqb2lSR1ZtWVhWc2RDSXNJbVJsYkdGNVgyMWxkR2h2WkNJNklrUmxabUYxYkhRaUxDSmtaV3hoZVY5eVlXNWtiMjFmYldGNElqb3dMakFzSW1SbGJHRjVYM0poYm1SdmJWOXRhVzRpT2pBdU1Dd2labkp2YlY5c2FXMXBkQ0k2TmpBdU1Dd2liR1ZtZEY5c2FXMXBkQ0k2TmpBdU1Dd2liR2x0YVhSZmJXOWtaU0k2SWxOMFlYUnBZeUlzSW0xaGVDSTZNQzR3TENKdFlYaHBiWFZ0WDJ4cGJXbDBJam8yTUM0d0xDSnRhVzRpT2pBdU1Dd2liV2x1YVcxMWJWOXNhVzFwZENJNk5qQXVNQ3dpYlc5a1pTSTZJbE4wWVhScFl5SXNJbTF2WkdWZmNtRnVaRzl0SWpvMExqQXNJbTF2WkdWZmRHbGphM01pT2pRdU1Dd2liVzlrYVdacFpYSWlPaUpFYVhOaFlteGxaQ0lzSW0xdlpHbG1hV1Z5WDJOMWMzUnZiVjl6Ykdsa1pYSnpJam95TGpBc0ltMXZaR2xtYVdWeVgyMXZaR1VpT2lKRVpXWmhkV3gwSWl3aWJXOWthV1pwWlhKZmIyWm1jMlYwSWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZNU0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6SWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4eklqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTkNJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYelVpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxODJJam93TGpBc0ltOW1abk5sZENJNk1DNHdMQ0p5WVc1a2IyMXBlbVVpT21aaGJITmxMQ0p5YVdkb2RGOXNhVzFwZENJNk5qQXVNQ3dpYzJKZmMzQmxaV1FpT2pFdU1Dd2ljMmx1WlhkaGRtVmZjM0JsWldRaU9qVXVNQ3dpZEc5ZmJHbHRhWFFpT2pZd0xqQXNJbmxoZDE5c1pXWjBJam93TGpBc0lubGhkMTl0YjJSbElqb3hMakFzSW5saGQxOXlhV2RvZENJNk1DNHdmWDBzSWt4bFoybDBJRUZCSWpwN0lrTlVJanA3SW1Gc2JHOTNYM04wWVhSbElqcDBjblZsTENKaWIyUjVYMlp5WldWemRHRnVaR2x1WnlJNklsQmxaV3NnVW1WaGJDSXNJbUp2WkhsZmVXRjNJanAwY25WbExDSmliMlI1WDNsaGQxOXZjSFJwYjI1eklqcGJJa3BwZEhSbGNpSXNJbEpoYm1SdmJXbDZaU0JLYVhSMFpYSWlMQ0pCYm5ScElFSnlkWFJsWm05eVkyVWlMQ0orSWwwc0ltTm9iMnRsSWpvaVJHVm1ZWFZzZENJc0ltTm9iMnRsTVY4eElqb3lMakFzSW1Ob2IydGxNVjh5SWpveUxqQXNJbU5vYjJ0bE1WOHpJam95TGpBc0ltTm9iMnRsTVY4MElqb3lMakFzSW1Ob2IydGxNVjgxSWpveUxqQXNJbU5vYjJ0bE1WODJJam95TGpBc0ltTm9iMnRsWDJaeWIyMGlPakUyTGpBc0ltTm9iMnRsWDIxbGRHaHZaQ0k2SWxKaGJtUnZiU0lzSW1Ob2IydGxYM05zYVdSbGNpSTZNVFl1TUN3aVkyaHZhMlZmYzJ4cFpHVnljeUk2TWk0d0xDSmphRzlyWlY5MGJ5STZNVFl1TUN3aVkzVnpkRzl0WDJOb2IydGxJanBtWVd4elpTd2laR1ZzWVhraU9tWmhiSE5sTENKa1pXeGhlVjh4SWpvd0xqQXNJbVJsYkdGNVh6SWlPakF1TUN3aVpHVnNZWGxmTXlJNk1DNHdMQ0prWld4aGVWODBJam93TGpBc0ltUmxiR0Y1WHpVaU9qQXVNQ3dpWkdWc1lYbGZOaUk2TUM0d0xDSmtaV3hoZVY5amRYTjBiMjFmYzJ4cFpHVnljeUk2TWk0d0xDSmtaV3hoZVY5a1pXWmhkV3gwSWpvd0xqQXNJbVJsYkdGNVgyeHZaMmxqSWpvaVJHVm1ZWFZzZENJc0ltUmxiR0Y1WDIxbGRHaHZaQ0k2SWtSbFptRjFiSFFpTENKa1pXeGhlVjl5WVc1a2IyMWZiV0Y0SWpvd0xqQXNJbVJsYkdGNVgzSmhibVJ2YlY5dGFXNGlPakF1TUN3aVpuSnZiVjlzYVcxcGRDSTZOakF1TUN3aWJHVm1kRjlzYVcxcGRDSTZOakF1TUN3aWJHbHRhWFJmYlc5a1pTSTZJbE4wWVhScFl5SXNJbTFoZUNJNk1DNHdMQ0p0WVhocGJYVnRYMnhwYldsMElqbzJNQzR3TENKdGFXNGlPakF1TUN3aWJXbHVhVzExYlY5c2FXMXBkQ0k2TmpBdU1Dd2liVzlrWlNJNklsTjBZWFJwWXlJc0ltMXZaR1ZmY21GdVpHOXRJam8wTGpBc0ltMXZaR1ZmZEdsamEzTWlPalF1TUN3aWJXOWthV1pwWlhJaU9pSkNiMkp5YnlJc0ltMXZaR2xtYVdWeVgyTjFjM1J2YlY5emJHbGtaWEp6SWpveUxqQXNJbTF2WkdsbWFXVnlYMjF2WkdVaU9pSkVaV1poZFd4MElpd2liVzlrYVdacFpYSmZiMlptYzJWMElqb3ROUzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpFaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh5SWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZNeUk2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6UWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4MUlqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTmlJNk1DNHdMQ0p2Wm1aelpYUWlPakU0TUM0d0xDSnlZVzVrYjIxcGVtVWlPbVpoYkhObExDSnlhV2RvZEY5c2FXMXBkQ0k2TmpBdU1Dd2ljMkpmYzNCbFpXUWlPakV1TUN3aWMybHVaWGRoZG1WZmMzQmxaV1FpT2pVdU1Dd2lkRzlmYkdsdGFYUWlPall3TGpBc0lubGhkMTlzWldaMElqb3dMakFzSW5saGQxOXRiMlJsSWpveExqQXNJbmxoZDE5eWFXZG9kQ0k2TUM0d2ZTd2lWQ0k2ZXlKaGJHeHZkMTl6ZEdGMFpTSTZkSEoxWlN3aVltOWtlVjltY21WbGMzUmhibVJwYm1jaU9pSlFaV1ZySUZKbFlXd2lMQ0ppYjJSNVgzbGhkeUk2ZEhKMVpTd2lZbTlrZVY5NVlYZGZiM0IwYVc5dWN5STZXeUpLYVhSMFpYSWlMQ0pTWVc1a2IyMXBlbVVnU21sMGRHVnlJaXdpUVc1MGFTQkNjblYwWldadmNtTmxJaXdpZmlKZExDSmphRzlyWlNJNklrUmxabUYxYkhRaUxDSmphRzlyWlRGZk1TSTZNaTR3TENKamFHOXJaVEZmTWlJNk1pNHdMQ0pqYUc5clpURmZNeUk2TWk0d0xDSmphRzlyWlRGZk5DSTZNaTR3TENKamFHOXJaVEZmTlNJNk1pNHdMQ0pqYUc5clpURmZOaUk2TWk0d0xDSmphRzlyWlY5bWNtOXRJam94Tmk0d0xDSmphRzlyWlY5dFpYUm9iMlFpT2lKU1lXNWtiMjBpTENKamFHOXJaVjl6Ykdsa1pYSWlPakUyTGpBc0ltTm9iMnRsWDNOc2FXUmxjbk1pT2pJdU1Dd2lZMmh2YTJWZmRHOGlPakUyTGpBc0ltTjFjM1J2YlY5amFHOXJaU0k2Wm1Gc2MyVXNJbVJsYkdGNUlqcG1ZV3h6WlN3aVpHVnNZWGxmTVNJNk1DNHdMQ0prWld4aGVWOHlJam93TGpBc0ltUmxiR0Y1WHpNaU9qQXVNQ3dpWkdWc1lYbGZOQ0k2TUM0d0xDSmtaV3hoZVY4MUlqb3dMakFzSW1SbGJHRjVYellpT2pBdU1Dd2laR1ZzWVhsZlkzVnpkRzl0WDNOc2FXUmxjbk1pT2pJdU1Dd2laR1ZzWVhsZlpHVm1ZWFZzZENJNk1DNHdMQ0prWld4aGVWOXNiMmRwWXlJNklrUmxabUYxYkhRaUxDSmtaV3hoZVY5dFpYUm9iMlFpT2lKRVpXWmhkV3gwSWl3aVpHVnNZWGxmY21GdVpHOXRYMjFoZUNJNk1DNHdMQ0prWld4aGVWOXlZVzVrYjIxZmJXbHVJam93TGpBc0ltWnliMjFmYkdsdGFYUWlPall3TGpBc0lteGxablJmYkdsdGFYUWlPall3TGpBc0lteHBiV2wwWDIxdlpHVWlPaUpUZEdGMGFXTWlMQ0p0WVhnaU9qQXVNQ3dpYldGNGFXMTFiVjlzYVcxcGRDSTZOakF1TUN3aWJXbHVJam93TGpBc0ltMXBibWx0ZFcxZmJHbHRhWFFpT2pZd0xqQXNJbTF2WkdVaU9pSlRkR0YwYVdNaUxDSnRiMlJsWDNKaGJtUnZiU0k2TkM0d0xDSnRiMlJsWDNScFkydHpJam8wTGpBc0ltMXZaR2xtYVdWeUlqb2lRbTlpY204aUxDSnRiMlJwWm1sbGNsOWpkWE4wYjIxZmMyeHBaR1Z5Y3lJNk1pNHdMQ0p0YjJScFptbGxjbDl0YjJSbElqb2lSR1ZtWVhWc2RDSXNJbTF2WkdsbWFXVnlYMjltWm5ObGRDSTZMVFV1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4eElqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTWlJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYek1pT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxODBJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk5TSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpZaU9qQXVNQ3dpYjJabWMyVjBJam94T0RBdU1Dd2ljbUZ1Wkc5dGFYcGxJanBtWVd4elpTd2ljbWxuYUhSZmJHbHRhWFFpT2pZd0xqQXNJbk5pWDNOd1pXVmtJam94TGpBc0luTnBibVYzWVhabFgzTndaV1ZrSWpvMUxqQXNJblJ2WDJ4cGJXbDBJam8yTUM0d0xDSjVZWGRmYkdWbWRDSTZNQzR3TENKNVlYZGZiVzlrWlNJNk1TNHdMQ0o1WVhkZmNtbG5hSFFpT2pBdU1IMTlMQ0pTZFc1dWFXNW5JanA3SWtOVUlqcDdJbUp2WkhsZlpuSmxaWE4wWVc1a2FXNW5Jam9pVDJabUlpd2lZbTlrZVY5NVlYY2lPblJ5ZFdVc0ltSnZaSGxmZVdGM1gyOXdkR2x2Ym5NaU9sc2lTbWwwZEdWeUlpd2lmaUpkTENKamFHOXJaU0k2SWtSbFptRjFiSFFpTENKamFHOXJaVEZmTVNJNk9DNHdMQ0pqYUc5clpURmZNaUk2TWpJdU1Dd2lZMmh2YTJVeFh6TWlPakV3TGpBc0ltTm9iMnRsTVY4MElqb3lMakFzSW1Ob2IydGxNVjgxSWpvMUxqQXNJbU5vYjJ0bE1WODJJam94TlM0d0xDSmphRzlyWlY5bWNtOXRJam94Tmk0d0xDSmphRzlyWlY5dFpYUm9iMlFpT2lKU1lXNWtiMjBpTENKamFHOXJaVjl6Ykdsa1pYSWlPakUyTGpBc0ltTm9iMnRsWDNOc2FXUmxjbk1pT2pZdU1Dd2lZMmh2YTJWZmRHOGlPakUyTGpBc0ltTjFjM1J2YlY5amFHOXJaU0k2Wm1Gc2MyVXNJbVJsYkdGNUlqcDBjblZsTENKa1pXeGhlVjh4SWpveUxqQXNJbVJsYkdGNVh6SWlPakV1TUN3aVpHVnNZWGxmTXlJNk1TNHdMQ0prWld4aGVWODBJam94TGpBc0ltUmxiR0Y1WHpVaU9qSXVNQ3dpWkdWc1lYbGZOaUk2TWk0d0xDSmtaV3hoZVY5amRYTjBiMjFmYzJ4cFpHVnljeUk2TWk0d0xDSmtaV3hoZVY5a1pXWmhkV3gwSWpvNExqQXNJbVJsYkdGNVgyeHZaMmxqSWpvaVJHVm1ZWFZzZENJc0ltUmxiR0Y1WDIxbGRHaHZaQ0k2SWtSbFptRjFiSFFpTENKa1pXeGhlVjl5WVc1a2IyMWZiV0Y0SWpveUxqQXNJbVJsYkdGNVgzSmhibVJ2YlY5dGFXNGlPakl1TUN3aVpuSnZiVjlzYVcxcGRDSTZOakF1TUN3aWJHVm1kRjlzYVcxcGRDSTZOakF1TUN3aWJHbHRhWFJmYlc5a1pTSTZJbE4wWVhScFl5SXNJbTFoZUNJNk1DNHdMQ0p0WVhocGJYVnRYMnhwYldsMElqbzJNQzR3TENKdGFXNGlPakF1TUN3aWJXbHVhVzExYlY5c2FXMXBkQ0k2TmpBdU1Dd2liVzlrWlNJNklsTjBZWFJwWXlJc0ltMXZaR1ZmY21GdVpHOXRJam8wTGpBc0ltMXZaR1ZmZEdsamEzTWlPalF1TUN3aWJXOWthV1pwWlhJaU9pSkVhWE5oWW14bFpDSXNJbTF2WkdsbWFXVnlYMk4xYzNSdmJWOXpiR2xrWlhKeklqb3lMakFzSW0xdlpHbG1hV1Z5WDIxdlpHVWlPaUpFWldaaGRXeDBJaXdpYlc5a2FXWnBaWEpmYjJabWMyVjBJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk1TSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpJaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh6SWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZOQ0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6VWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4Mklqb3dMakFzSW05bVpuTmxkQ0k2TUM0d0xDSnlZVzVrYjIxcGVtVWlPbVpoYkhObExDSnlhV2RvZEY5c2FXMXBkQ0k2TmpBdU1Dd2ljMkpmYzNCbFpXUWlPakV1TUN3aWMybHVaWGRoZG1WZmMzQmxaV1FpT2pVdU1Dd2lkRzlmYkdsdGFYUWlPall3TGpBc0lubGhkMTlzWldaMElqb3RNall1TUN3aWVXRjNYMjF2WkdVaU9qRXVNQ3dpZVdGM1gzSnBaMmgwSWpvME1TNHdmU3dpVkNJNmV5SmliMlI1WDJaeVpXVnpkR0Z1WkdsdVp5STZJazltWmlJc0ltSnZaSGxmZVdGM0lqcDBjblZsTENKaWIyUjVYM2xoZDE5dmNIUnBiMjV6SWpwYklrcHBkSFJsY2lJc0luNGlYU3dpWTJodmEyVWlPaUpFWldaaGRXeDBJaXdpWTJodmEyVXhYekVpT2pndU1Dd2lZMmh2YTJVeFh6SWlPakl5TGpBc0ltTm9iMnRsTVY4eklqb3hNQzR3TENKamFHOXJaVEZmTkNJNk1pNHdMQ0pqYUc5clpURmZOU0k2TlM0d0xDSmphRzlyWlRGZk5pSTZNVFV1TUN3aVkyaHZhMlZmWm5KdmJTSTZNVFl1TUN3aVkyaHZhMlZmYldWMGFHOWtJam9pVW1GdVpHOXRJaXdpWTJodmEyVmZjMnhwWkdWeUlqb3hOaTR3TENKamFHOXJaVjl6Ykdsa1pYSnpJam8yTGpBc0ltTm9iMnRsWDNSdklqb3hOaTR3TENKamRYTjBiMjFmWTJodmEyVWlPbVpoYkhObExDSmtaV3hoZVNJNmRISjFaU3dpWkdWc1lYbGZNU0k2TWk0d0xDSmtaV3hoZVY4eUlqb3dMakFzSW1SbGJHRjVYek1pT2pBdU1Dd2laR1ZzWVhsZk5DSTZNQzR3TENKa1pXeGhlVjgxSWpveUxqQXNJbVJsYkdGNVh6WWlPakl1TUN3aVpHVnNZWGxmWTNWemRHOXRYM05zYVdSbGNuTWlPakl1TUN3aVpHVnNZWGxmWkdWbVlYVnNkQ0k2T0M0d0xDSmtaV3hoZVY5c2IyZHBZeUk2SWtSbFptRjFiSFFpTENKa1pXeGhlVjl0WlhSb2IyUWlPaUpFWldaaGRXeDBJaXdpWkdWc1lYbGZjbUZ1Wkc5dFgyMWhlQ0k2TWk0d0xDSmtaV3hoZVY5eVlXNWtiMjFmYldsdUlqb3lMakFzSW1aeWIyMWZiR2x0YVhRaU9qWXdMakFzSW14bFpuUmZiR2x0YVhRaU9qWXdMakFzSW14cGJXbDBYMjF2WkdVaU9pSlRkR0YwYVdNaUxDSnRZWGdpT2pBdU1Dd2liV0Y0YVcxMWJWOXNhVzFwZENJNk5qQXVNQ3dpYldsdUlqb3dMakFzSW0xcGJtbHRkVzFmYkdsdGFYUWlPall3TGpBc0ltMXZaR1VpT2lKVGRHRjBhV01pTENKdGIyUmxYM0poYm1SdmJTSTZOQzR3TENKdGIyUmxYM1JwWTJ0eklqbzBMakFzSW0xdlpHbG1hV1Z5SWpvaVJHbHpZV0pzWldRaUxDSnRiMlJwWm1sbGNsOWpkWE4wYjIxZmMyeHBaR1Z5Y3lJNk1pNHdMQ0p0YjJScFptbGxjbDl0YjJSbElqb2lSR1ZtWVhWc2RDSXNJbTF2WkdsbWFXVnlYMjltWm5ObGRDSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpFaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh5SWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZNeUk2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6UWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4MUlqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTmlJNk1DNHdMQ0p2Wm1aelpYUWlPakF1TUN3aWNtRnVaRzl0YVhwbElqcG1ZV3h6WlN3aWNtbG5hSFJmYkdsdGFYUWlPall3TGpBc0luTmlYM053WldWa0lqb3hMakFzSW5OcGJtVjNZWFpsWDNOd1pXVmtJam8xTGpBc0luUnZYMnhwYldsMElqbzJNQzR3TENKNVlYZGZiR1ZtZENJNkxUSTJMakFzSW5saGQxOXRiMlJsSWpveExqQXNJbmxoZDE5eWFXZG9kQ0k2TkRFdU1IMTlMQ0pUYkc5M2FXNW5JanA3SWtOVUlqcDdJbUp2WkhsZlpuSmxaWE4wWVc1a2FXNW5Jam9pVDJabUlpd2lZbTlrZVY5NVlYY2lPblJ5ZFdVc0ltSnZaSGxmZVdGM1gyOXdkR2x2Ym5NaU9sc2lTbWwwZEdWeUlpd2lmaUpkTENKamFHOXJaU0k2SWtSbFptRjFiSFFpTENKamFHOXJaVEZmTVNJNk1pNHdMQ0pqYUc5clpURmZNaUk2TWk0d0xDSmphRzlyWlRGZk15STZNaTR3TENKamFHOXJaVEZmTkNJNk1pNHdMQ0pqYUc5clpURmZOU0k2TWk0d0xDSmphRzlyWlRGZk5pSTZNaTR3TENKamFHOXJaVjltY205dElqb3hOaTR3TENKamFHOXJaVjl0WlhSb2IyUWlPaUpTWVc1a2IyMGlMQ0pqYUc5clpWOXpiR2xrWlhJaU9qRTJMakFzSW1Ob2IydGxYM05zYVdSbGNuTWlPakl1TUN3aVkyaHZhMlZmZEc4aU9qRTJMakFzSW1OMWMzUnZiVjlqYUc5clpTSTZabUZzYzJVc0ltUmxiR0Y1SWpwMGNuVmxMQ0prWld4aGVWOHhJam96TGpBc0ltUmxiR0Y1WHpJaU9qQXVNQ3dpWkdWc1lYbGZNeUk2TUM0d0xDSmtaV3hoZVY4MElqb3dMakFzSW1SbGJHRjVYelVpT2pZdU1Dd2laR1ZzWVhsZk5pSTZPQzR3TENKa1pXeGhlVjlqZFhOMGIyMWZjMnhwWkdWeWN5STZOaTR3TENKa1pXeGhlVjlrWldaaGRXeDBJam95TGpBc0ltUmxiR0Y1WDJ4dloybGpJam9pUkdWbVlYVnNkQ0lzSW1SbGJHRjVYMjFsZEdodlpDSTZJa04xYzNSdmJTSXNJbVJsYkdGNVgzSmhibVJ2YlY5dFlYZ2lPakl1TUN3aVpHVnNZWGxmY21GdVpHOXRYMjFwYmlJNk1pNHdMQ0ptY205dFgyeHBiV2wwSWpvMk1DNHdMQ0pzWldaMFgyeHBiV2wwSWpvMk1DNHdMQ0pzYVcxcGRGOXRiMlJsSWpvaVUzUmhkR2xqSWl3aWJXRjRJam93TGpBc0ltMWhlR2x0ZFcxZmJHbHRhWFFpT2pZd0xqQXNJbTFwYmlJNk1DNHdMQ0p0YVc1cGJYVnRYMnhwYldsMElqbzJNQzR3TENKdGIyUmxJam9pVTNSaGRHbGpJaXdpYlc5a1pWOXlZVzVrYjIwaU9qUXVNQ3dpYlc5a1pWOTBhV05yY3lJNk5DNHdMQ0p0YjJScFptbGxjaUk2SWtKdlluSnZJaXdpYlc5a2FXWnBaWEpmWTNWemRHOXRYM05zYVdSbGNuTWlPalV1TUN3aWJXOWthV1pwWlhKZmJXOWtaU0k2SWtOMWMzUnZiU0lzSW0xdlpHbG1hV1Z5WDI5bVpuTmxkQ0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6RWlPaTB4TWk0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6SWlPakUzTGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk15STZMVE01TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk5DSTZMVFV4TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk5TSTZOREF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4Mklqb3dMakFzSW05bVpuTmxkQ0k2TUM0d0xDSnlZVzVrYjIxcGVtVWlPblJ5ZFdVc0luSnBaMmgwWDJ4cGJXbDBJam8yTUM0d0xDSnpZbDl6Y0dWbFpDSTZNUzR3TENKemFXNWxkMkYyWlY5emNHVmxaQ0k2TlM0d0xDSjBiMTlzYVcxcGRDSTZOakF1TUN3aWVXRjNYMnhsWm5RaU9pMHlOeTR3TENKNVlYZGZiVzlrWlNJNk1TNHdMQ0o1WVhkZmNtbG5hSFFpT2pNNExqQjlMQ0pVSWpwN0ltSnZaSGxmWm5KbFpYTjBZVzVrYVc1bklqb2lUMlptSWl3aVltOWtlVjk1WVhjaU9uUnlkV1VzSW1KdlpIbGZlV0YzWDI5d2RHbHZibk1pT2xzaVNtbDBkR1Z5SWl3aWZpSmRMQ0pqYUc5clpTSTZJa1JsWm1GMWJIUWlMQ0pqYUc5clpURmZNU0k2TWk0d0xDSmphRzlyWlRGZk1pSTZNaTR3TENKamFHOXJaVEZmTXlJNk1pNHdMQ0pqYUc5clpURmZOQ0k2TWk0d0xDSmphRzlyWlRGZk5TSTZNaTR3TENKamFHOXJaVEZmTmlJNk1pNHdMQ0pqYUc5clpWOW1jbTl0SWpveE5pNHdMQ0pqYUc5clpWOXRaWFJvYjJRaU9pSlNZVzVrYjIwaUxDSmphRzlyWlY5emJHbGtaWElpT2pFMkxqQXNJbU5vYjJ0bFgzTnNhV1JsY25NaU9qSXVNQ3dpWTJodmEyVmZkRzhpT2pFMkxqQXNJbU4xYzNSdmJWOWphRzlyWlNJNlptRnNjMlVzSW1SbGJHRjVJanAwY25WbExDSmtaV3hoZVY4eElqb3pMakFzSW1SbGJHRjVYeklpT2pBdU1Dd2laR1ZzWVhsZk15STZNQzR3TENKa1pXeGhlVjgwSWpvd0xqQXNJbVJsYkdGNVh6VWlPall1TUN3aVpHVnNZWGxmTmlJNk9DNHdMQ0prWld4aGVWOWpkWE4wYjIxZmMyeHBaR1Z5Y3lJNk5pNHdMQ0prWld4aGVWOWtaV1poZFd4MElqb3lMakFzSW1SbGJHRjVYMnh2WjJsaklqb2lSR1ZtWVhWc2RDSXNJbVJsYkdGNVgyMWxkR2h2WkNJNklrTjFjM1J2YlNJc0ltUmxiR0Y1WDNKaGJtUnZiVjl0WVhnaU9qSXVNQ3dpWkdWc1lYbGZjbUZ1Wkc5dFgyMXBiaUk2TWk0d0xDSm1jbTl0WDJ4cGJXbDBJam8yTUM0d0xDSnNaV1owWDJ4cGJXbDBJam8yTUM0d0xDSnNhVzFwZEY5dGIyUmxJam9pVTNSaGRHbGpJaXdpYldGNElqb3dMakFzSW0xaGVHbHRkVzFmYkdsdGFYUWlPall3TGpBc0ltMXBiaUk2TUM0d0xDSnRhVzVwYlhWdFgyeHBiV2wwSWpvMk1DNHdMQ0p0YjJSbElqb2lVM1JoZEdsaklpd2liVzlrWlY5eVlXNWtiMjBpT2pRdU1Dd2liVzlrWlY5MGFXTnJjeUk2TkM0d0xDSnRiMlJwWm1sbGNpSTZJa0p2WW5Kdklpd2liVzlrYVdacFpYSmZZM1Z6ZEc5dFgzTnNhV1JsY25NaU9qVXVNQ3dpYlc5a2FXWnBaWEpmYlc5a1pTSTZJa04xYzNSdmJTSXNJbTF2WkdsbWFXVnlYMjltWm5ObGRDSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpFaU9pMHhNaTR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpJaU9qRTNMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTXlJNkxUTTVMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTkNJNkxUVXhMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTlNJNk5EQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTgySWpvd0xqQXNJbTltWm5ObGRDSTZNQzR3TENKeVlXNWtiMjFwZW1VaU9uUnlkV1VzSW5KcFoyaDBYMnhwYldsMElqbzJNQzR3TENKellsOXpjR1ZsWkNJNk1TNHdMQ0p6YVc1bGQyRjJaVjl6Y0dWbFpDSTZOUzR3TENKMGIxOXNhVzFwZENJNk5qQXVNQ3dpZVdGM1gyeGxablFpT2kweU55NHdMQ0o1WVhkZmJXOWtaU0k2TVM0d0xDSjVZWGRmY21sbmFIUWlPak00TGpCOWZTd2lVMjVsWVd0cGJtY2lPbnNpUTFRaU9uc2lZbTlrZVY5bWNtVmxjM1JoYm1ScGJtY2lPaUpQWm1ZaUxDSmliMlI1WDNsaGR5STZkSEoxWlN3aVltOWtlVjk1WVhkZmIzQjBhVzl1Y3lJNld5SkthWFIwWlhJaUxDSitJbDBzSW1Ob2IydGxJam9pUkdWbVlYVnNkQ0lzSW1Ob2IydGxNVjh4SWpvNExqQXNJbU5vYjJ0bE1WOHlJam94T0M0d0xDSmphRzlyWlRGZk15STZOeTR3TENKamFHOXJaVEZmTkNJNk1UY3VNQ3dpWTJodmEyVXhYelVpT2pndU1Dd2lZMmh2YTJVeFh6WWlPalV1TUN3aVkyaHZhMlZmWm5KdmJTSTZNVFl1TUN3aVkyaHZhMlZmYldWMGFHOWtJam9pVTJWeGRXVnVkR2xoYkNJc0ltTm9iMnRsWDNOc2FXUmxjaUk2TVRZdU1Dd2lZMmh2YTJWZmMyeHBaR1Z5Y3lJNk5pNHdMQ0pqYUc5clpWOTBieUk2TVRZdU1Dd2lZM1Z6ZEc5dFgyTm9iMnRsSWpwMGNuVmxMQ0prWld4aGVTSTZkSEoxWlN3aVpHVnNZWGxmTVNJNk5TNHdMQ0prWld4aGVWOHlJam8yTGpBc0ltUmxiR0Y1WHpNaU9qRXVNQ3dpWkdWc1lYbGZOQ0k2TVM0d0xDSmtaV3hoZVY4MUlqb3lMakFzSW1SbGJHRjVYellpT2pJdU1Dd2laR1ZzWVhsZlkzVnpkRzl0WDNOc2FXUmxjbk1pT2pJdU1Dd2laR1ZzWVhsZlpHVm1ZWFZzZENJNk55NHdMQ0prWld4aGVWOXNiMmRwWXlJNklreGxaMkZqZVNJc0ltUmxiR0Y1WDIxbGRHaHZaQ0k2SWtOMWMzUnZiU0lzSW1SbGJHRjVYM0poYm1SdmJWOXRZWGdpT2pZdU1Dd2laR1ZzWVhsZmNtRnVaRzl0WDIxcGJpSTZOUzR3TENKbWNtOXRYMnhwYldsMElqbzJNQzR3TENKc1pXWjBYMnhwYldsMElqbzJNQzR3TENKc2FXMXBkRjl0YjJSbElqb2lVM1JoZEdsaklpd2liV0Y0SWpvd0xqQXNJbTFoZUdsdGRXMWZiR2x0YVhRaU9qWXdMakFzSW0xcGJpSTZMVEV3TGpBc0ltMXBibWx0ZFcxZmJHbHRhWFFpT2pZd0xqQXNJbTF2WkdVaU9pSlRkR0YwYVdNaUxDSnRiMlJsWDNKaGJtUnZiU0k2TkM0d0xDSnRiMlJsWDNScFkydHpJam94TWk0d0xDSnRiMlJwWm1sbGNpSTZJa1JwYzJGaWJHVmtJaXdpYlc5a2FXWnBaWEpmWTNWemRHOXRYM05zYVdSbGNuTWlPall1TUN3aWJXOWthV1pwWlhKZmJXOWtaU0k2SWtOMWMzUnZiU0lzSW0xdlpHbG1hV1Z5WDI5bVpuTmxkQ0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6RWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4eUlqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTXlJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYelFpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxODFJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk5pSTZMVEUyTGpBc0ltOW1abk5sZENJNk1DNHdMQ0p5WVc1a2IyMXBlbVVpT25SeWRXVXNJbkpwWjJoMFgyeHBiV2wwSWpvMk1DNHdMQ0p6WWw5emNHVmxaQ0k2TVRFdU1Dd2ljMmx1WlhkaGRtVmZjM0JsWldRaU9qVXVNQ3dpZEc5ZmJHbHRhWFFpT2pRNExqQXNJbmxoZDE5c1pXWjBJam90TVRrdU1Dd2llV0YzWDIxdlpHVWlPakl1TUN3aWVXRjNYM0pwWjJoMElqbzBNQzR3ZlN3aVZDSTZleUppYjJSNVgyWnlaV1Z6ZEdGdVpHbHVaeUk2SWs5bVppSXNJbUp2WkhsZmVXRjNJanAwY25WbExDSmliMlI1WDNsaGQxOXZjSFJwYjI1eklqcGJJa3BwZEhSbGNpSXNJbjRpWFN3aVkyaHZhMlVpT2lKRVpXWmhkV3gwSWl3aVkyaHZhMlV4WHpFaU9qZ3VNQ3dpWTJodmEyVXhYeklpT2pFNExqQXNJbU5vYjJ0bE1WOHpJam8zTGpBc0ltTm9iMnRsTVY4MElqb3hOeTR3TENKamFHOXJaVEZmTlNJNk9DNHdMQ0pqYUc5clpURmZOaUk2TlM0d0xDSmphRzlyWlY5bWNtOXRJam94Tmk0d0xDSmphRzlyWlY5dFpYUm9iMlFpT2lKVFpYRjFaVzUwYVdGc0lpd2lZMmh2YTJWZmMyeHBaR1Z5SWpveE5pNHdMQ0pqYUc5clpWOXpiR2xrWlhKeklqbzJMakFzSW1Ob2IydGxYM1J2SWpveE5pNHdMQ0pqZFhOMGIyMWZZMmh2YTJVaU9uUnlkV1VzSW1SbGJHRjVJanAwY25WbExDSmtaV3hoZVY4eElqbzFMakFzSW1SbGJHRjVYeklpT2pZdU1Dd2laR1ZzWVhsZk15STZNQzR3TENKa1pXeGhlVjgwSWpvd0xqQXNJbVJsYkdGNVh6VWlPakl1TUN3aVpHVnNZWGxmTmlJNk1pNHdMQ0prWld4aGVWOWpkWE4wYjIxZmMyeHBaR1Z5Y3lJNk1pNHdMQ0prWld4aGVWOWtaV1poZFd4MElqbzNMakFzSW1SbGJHRjVYMnh2WjJsaklqb2lUR1ZuWVdONUlpd2laR1ZzWVhsZmJXVjBhRzlrSWpvaVEzVnpkRzl0SWl3aVpHVnNZWGxmY21GdVpHOXRYMjFoZUNJNk5pNHdMQ0prWld4aGVWOXlZVzVrYjIxZmJXbHVJam8xTGpBc0ltWnliMjFmYkdsdGFYUWlPall3TGpBc0lteGxablJmYkdsdGFYUWlPall3TGpBc0lteHBiV2wwWDIxdlpHVWlPaUpUZEdGMGFXTWlMQ0p0WVhnaU9qQXVNQ3dpYldGNGFXMTFiVjlzYVcxcGRDSTZOakF1TUN3aWJXbHVJam90TVRBdU1Dd2liV2x1YVcxMWJWOXNhVzFwZENJNk5qQXVNQ3dpYlc5a1pTSTZJbE4wWVhScFl5SXNJbTF2WkdWZmNtRnVaRzl0SWpvMExqQXNJbTF2WkdWZmRHbGphM01pT2pFeUxqQXNJbTF2WkdsbWFXVnlJam9pUkdsellXSnNaV1FpTENKdGIyUnBabWxsY2w5amRYTjBiMjFmYzJ4cFpHVnljeUk2Tmk0d0xDSnRiMlJwWm1sbGNsOXRiMlJsSWpvaVEzVnpkRzl0SWl3aWJXOWthV1pwWlhKZmIyWm1jMlYwSWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZNU0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6SWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4eklqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTkNJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYelVpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxODJJam90TVRZdU1Dd2liMlptYzJWMElqb3dMakFzSW5KaGJtUnZiV2w2WlNJNmRISjFaU3dpY21sbmFIUmZiR2x0YVhRaU9qWXdMakFzSW5OaVgzTndaV1ZrSWpveE1TNHdMQ0p6YVc1bGQyRjJaVjl6Y0dWbFpDSTZOUzR3TENKMGIxOXNhVzFwZENJNk5EZ3VNQ3dpZVdGM1gyeGxablFpT2kweE9TNHdMQ0o1WVhkZmJXOWtaU0k2TWk0d0xDSjVZWGRmY21sbmFIUWlPalF3TGpCOWZTd2lVM1JoYm1ScGJtY2lPbnNpUTFRaU9uc2lZbTlrZVY5bWNtVmxjM1JoYm1ScGJtY2lPaUpQWm1ZaUxDSmliMlI1WDNsaGR5STZkSEoxWlN3aVltOWtlVjk1WVhkZmIzQjBhVzl1Y3lJNld5SkthWFIwWlhJaUxDSitJbDBzSW1Ob2IydGxJam9pUkdWbVlYVnNkQ0lzSW1Ob2IydGxNVjh4SWpveUxqQXNJbU5vYjJ0bE1WOHlJam95TGpBc0ltTm9iMnRsTVY4eklqb3lMakFzSW1Ob2IydGxNVjgwSWpveUxqQXNJbU5vYjJ0bE1WODFJam95TGpBc0ltTm9iMnRsTVY4Mklqb3lMakFzSW1Ob2IydGxYMlp5YjIwaU9qRTJMakFzSW1Ob2IydGxYMjFsZEdodlpDSTZJbEpoYm1SdmJTSXNJbU5vYjJ0bFgzTnNhV1JsY2lJNk1UWXVNQ3dpWTJodmEyVmZjMnhwWkdWeWN5STZNaTR3TENKamFHOXJaVjkwYnlJNk1UWXVNQ3dpWTNWemRHOXRYMk5vYjJ0bElqcG1ZV3h6WlN3aVpHVnNZWGtpT25SeWRXVXNJbVJsYkdGNVh6RWlPalV1TUN3aVpHVnNZWGxmTWlJNk1DNHdMQ0prWld4aGVWOHpJam93TGpBc0ltUmxiR0Y1WHpRaU9qQXVNQ3dpWkdWc1lYbGZOU0k2TXk0d0xDSmtaV3hoZVY4Mklqb3lMakFzSW1SbGJHRjVYMk4xYzNSdmJWOXpiR2xrWlhKeklqbzFMakFzSW1SbGJHRjVYMlJsWm1GMWJIUWlPamN1TUN3aVpHVnNZWGxmYkc5bmFXTWlPaUpNWldkaFkza2lMQ0prWld4aGVWOXRaWFJvYjJRaU9pSlNZVzVrYjIwaUxDSmtaV3hoZVY5eVlXNWtiMjFmYldGNElqbzRMakFzSW1SbGJHRjVYM0poYm1SdmJWOXRhVzRpT2pRdU1Dd2labkp2YlY5c2FXMXBkQ0k2TmpBdU1Dd2liR1ZtZEY5c2FXMXBkQ0k2TmpBdU1Dd2liR2x0YVhSZmJXOWtaU0k2SWxOMFlYUnBZeUlzSW0xaGVDSTZNQzR3TENKdFlYaHBiWFZ0WDJ4cGJXbDBJam8yTUM0d0xDSnRhVzRpT2pBdU1Dd2liV2x1YVcxMWJWOXNhVzFwZENJNk5qQXVNQ3dpYlc5a1pTSTZJbE4wWVhScFl5SXNJbTF2WkdWZmNtRnVaRzl0SWpvMExqQXNJbTF2WkdWZmRHbGphM01pT2pRdU1Dd2liVzlrYVdacFpYSWlPaUpFYVhOaFlteGxaQ0lzSW0xdlpHbG1hV1Z5WDJOMWMzUnZiVjl6Ykdsa1pYSnpJam95TGpBc0ltMXZaR2xtYVdWeVgyMXZaR1VpT2lKRVpXWmhkV3gwSWl3aWJXOWthV1pwWlhKZmIyWm1jMlYwSWpvMU1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYekVpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxOHlJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk15STZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpRaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTgxSWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZOaUk2TUM0d0xDSnZabVp6WlhRaU9qQXVNQ3dpY21GdVpHOXRhWHBsSWpwbVlXeHpaU3dpY21sbmFIUmZiR2x0YVhRaU9qWXdMakFzSW5OaVgzTndaV1ZrSWpveExqQXNJbk5wYm1WM1lYWmxYM053WldWa0lqbzFMakFzSW5SdlgyeHBiV2wwSWpvMk1DNHdMQ0o1WVhkZmJHVm1kQ0k2TFRFMkxqQXNJbmxoZDE5dGIyUmxJam95TGpBc0lubGhkMTl5YVdkb2RDSTZNelV1TUgwc0lsUWlPbnNpWW05a2VWOW1jbVZsYzNSaGJtUnBibWNpT2lKUFptWWlMQ0ppYjJSNVgzbGhkeUk2ZEhKMVpTd2lZbTlrZVY5NVlYZGZiM0IwYVc5dWN5STZXeUpLYVhSMFpYSWlMQ0orSWwwc0ltTm9iMnRsSWpvaVJHVm1ZWFZzZENJc0ltTm9iMnRsTVY4eElqb3lMakFzSW1Ob2IydGxNVjh5SWpveUxqQXNJbU5vYjJ0bE1WOHpJam95TGpBc0ltTm9iMnRsTVY4MElqb3lMakFzSW1Ob2IydGxNVjgxSWpveUxqQXNJbU5vYjJ0bE1WODJJam95TGpBc0ltTm9iMnRsWDJaeWIyMGlPakUyTGpBc0ltTm9iMnRsWDIxbGRHaHZaQ0k2SWxKaGJtUnZiU0lzSW1Ob2IydGxYM05zYVdSbGNpSTZNVFl1TUN3aVkyaHZhMlZmYzJ4cFpHVnljeUk2TWk0d0xDSmphRzlyWlY5MGJ5STZNVFl1TUN3aVkzVnpkRzl0WDJOb2IydGxJanBtWVd4elpTd2laR1ZzWVhraU9uUnlkV1VzSW1SbGJHRjVYekVpT2pVdU1Dd2laR1ZzWVhsZk1pSTZNUzR3TENKa1pXeGhlVjh6SWpveExqQXNJbVJsYkdGNVh6UWlPakV1TUN3aVpHVnNZWGxmTlNJNk15NHdMQ0prWld4aGVWODJJam95TGpBc0ltUmxiR0Y1WDJOMWMzUnZiVjl6Ykdsa1pYSnpJam8xTGpBc0ltUmxiR0Y1WDJSbFptRjFiSFFpT2pjdU1Dd2laR1ZzWVhsZmJHOW5hV01pT2lKTVpXZGhZM2tpTENKa1pXeGhlVjl0WlhSb2IyUWlPaUpTWVc1a2IyMGlMQ0prWld4aGVWOXlZVzVrYjIxZmJXRjRJam80TGpBc0ltUmxiR0Y1WDNKaGJtUnZiVjl0YVc0aU9qUXVNQ3dpWm5KdmJWOXNhVzFwZENJNk5qQXVNQ3dpYkdWbWRGOXNhVzFwZENJNk5qQXVNQ3dpYkdsdGFYUmZiVzlrWlNJNklsTjBZWFJwWXlJc0ltMWhlQ0k2TUM0d0xDSnRZWGhwYlhWdFgyeHBiV2wwSWpvMk1DNHdMQ0p0YVc0aU9qQXVNQ3dpYldsdWFXMTFiVjlzYVcxcGRDSTZOakF1TUN3aWJXOWtaU0k2SWxOMFlYUnBZeUlzSW0xdlpHVmZjbUZ1Wkc5dElqbzBMakFzSW0xdlpHVmZkR2xqYTNNaU9qUXVNQ3dpYlc5a2FXWnBaWElpT2lKRWFYTmhZbXhsWkNJc0ltMXZaR2xtYVdWeVgyTjFjM1J2YlY5emJHbGtaWEp6SWpveUxqQXNJbTF2WkdsbWFXVnlYMjF2WkdVaU9pSkVaV1poZFd4MElpd2liVzlrYVdacFpYSmZiMlptYzJWMElqbzFNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpFaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh5SWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZNeUk2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6UWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4MUlqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTmlJNk1DNHdMQ0p2Wm1aelpYUWlPakF1TUN3aWNtRnVaRzl0YVhwbElqcG1ZV3h6WlN3aWNtbG5hSFJmYkdsdGFYUWlPall3TGpBc0luTmlYM053WldWa0lqb3hMakFzSW5OcGJtVjNZWFpsWDNOd1pXVmtJam8xTGpBc0luUnZYMnhwYldsMElqbzJNQzR3TENKNVlYZGZiR1ZtZENJNkxURTJMakFzSW5saGQxOXRiMlJsSWpveUxqQXNJbmxoZDE5eWFXZG9kQ0k2TXpVdU1IMTlmU3dpWm5KbFpYTjBZVzVrYVc1bklqcDdJbUp2WkhsZlpuTWlPblJ5ZFdVc0ltUnBjMkZpYkdWeWN5STZXeUorSWwwc0luQnlaV1psY2w5dFlXNTFZV3dpT25SeWRXVXNJbk4zYVhSamFDSTZabUZzYzJVc0lubGhkMTl0YjJRaU9uUnlkV1Y5ZlN3aWJXRnBiaUk2ZXlKaFpHUnBkR2x2Ym1Gc0lqcDdJbXhsWjJsMFgyRmhJanA3SW1WdVlXSnNaV1FpT21aaGJITmxMQ0p0YjJSbElqb2lURzlqWVd3Z1ZtbGxkeUo5TENKdFlXNTFZV3hmZVdGM0lqcDdJbWx1ZG1WeWRHVnlJanAwY25WbExDSnpaV3hsWTNRaU9pSkVhWE5oWW14bFpDSXNJbk4wWVhScFl5STZabUZzYzJWOUxDSnpZV1psWDJobFlXUWlPbnNpYUdWcFoyaDBJam8xTUM0d0xDSnpkR0YwWlhNaU9sc2lXbVYxY3lJc0lrdHVhV1psSWl3aWZpSmRMQ0p6ZDJsMFkyZ2lPbVpoYkhObGZTd2lkMkZ5YlhWd1gyRmhJanA3SW14bFpuUmZlV0YzSWpvdE16VXVNQ3dpY0dsMFkyZ2lPaUpFYVhOaFlteGxaQ0lzSW5KaGJtZGxJam96TmpBdU1Dd2ljbWxuYUhSZmVXRjNJam8yTnk0d0xDSnpaV3hsWTNRaU9pSkVhWE5oWW14bFpDSXNJbk53WldWa0lqb3hNamd1TUN3aWVXRjNJam9pVTNCcGJpSjlmU3dpWTI5dVptbG5kWEpsSWpwN0luTjBZWFJsSWpvaVUzUmhibVJwYm1jaUxDSjBaV0Z0SWpveExqQjlmWDBzSW1sdVptOGlPbnNpY0hKbGMyVjBjeUk2ZXlKc2FYTjBJam8xTGpBc0ltNWhiV1VpT2lKa2MyRmtZWE5rWVhOa0luMHNJbmRoZEdWeWJXRnlheUk2ZXlKamIyeHZjaUk2V3lKSmJtNWxjaUlzSWlNd01EQXdNREF3TUNJc0luNGlYU3dpWTI5c2IzSmZNU0k2SWlOR1JqQXdNREJHUmlJc0ltTnZiRzl5WHpJaU9pSWpSa1pHUmtaR1JrWWlMQ0pqYjJ4dmNsOXVJam9pSTBJek9URkNSa1pHSWl3aVpXWm1aV04wY3lJNld5SitJbDBzSW1admJuUWlPaUpFWldaaGRXeDBJaXdpWjJ4cGRHTm9JanBtWVd4elpTd2liVzlrWlNJNld6RXVNQ3d5TGpBc015NHdMQ0orSWwwc0luSmhhVzVpYjNjaU9tWmhiSE5sTENKemNHVmxaQ0k2TkM0d0xDSjBaWGgwSWpvaVRHTlRaVzV6WlNKOWZTd2liV2x6WXlJNmV5SmhhVzFpYjNRaU9uc2labUZyWldSMVkyc2lPbnNpWm5KbFpYcGxYM0JsY21sdlpDSTZkSEoxWlN3aWRXNXNiMk5ySWpwMGNuVmxmU3dpWjNKbGJtRmtaVjl5Wld4bFlYTmxJanA3SW1OdmJHeHBjMmx2Ymw5cGJtWnZJanBtWVd4elpTd2laR0Z0WVdkbElqb3dMakFzSW0xdmJHeDVYMlJwYzNSaGJtTmxJam94TURBdU1Dd2ljM2RwZEdOb0lqcG1ZV3h6Wlgwc0lteGhkR1Z1WTNraU9uc2ljM2RwZEdOb0lqcDBjblZsZlN3aWJHOW5aMmx1WnlJNmV5SmpiMnh2Y25NaU9uc2lhR2wwSWpvaUkwUTNRamxFT1VaR0lpd2liV2x6Y3lJNklpTkVPRUk1UkRsR1JpSjlMQ0pqZFhOMGIyMXBlbUYwYVc5dUlqcDdJbkJ5WldacGVDSTZJbXhqYzJWdWMyVWlmU3dpYlc5a1pTSTZleUp6Wld4bFkzUWlPbHNpUVdsdFltOTBJaXdpZmlKZGZTd2ljM2RwZEdOb0lqcDBjblZsZlgwc0ltMXZkbVZ0Wlc1MElqcDdJbUYxZEc5emQybDBZMmdpT25zaVpHbHpkR0Z1WTJWZmMyeHBaR1Z5SWpvMU1EQXVNQ3dpYzNkcGRHTm9JanBtWVd4elpTd2lkSEpwWjJkbGNuTWlPbHNpZmlKZExDSjNaV0Z3YjI1ZmMyVnNaV04wSWpvaWMzTm5NRGdpZlN3aVpXUm5aVjl4ZFdsamExOXpkRzl3SWpwbVlXeHpaU3dpWm1Gc2JGOWtZVzFoWjJVaU9uUnlkV1VzSW1aaGMzUmZiR0ZrWkdWeUlqcDBjblZsZlN3aWNHeGhlV1Z5WDJGdWFXMWhkR2x2Ym5NaU9uc2labUZzYkdsdVp5STZleUoyWVd4MVpTSTZNQzR3ZlN3aWFXNTBaWEp3YjJ4aGRHbHZiaUk2TVM0d0xDSnFhWFIwWlhKZmJHVm5jeUk2ZXlKbWNtOXRJam94TURBdU1Dd2ljM2RwZEdOb0lqcDBjblZsTENKMGJ5STZOall1TUgwc0lteGxZVzVwYm1jaU9uc2lkbUZzZFdVaU9qRXdNQzR3ZlgxOUxDSjJhWE4xWVd4eklqcDdJbUZrWkc5dWN5STZXeUpTWlcxdmRtVWdVMnhsWlhabGN5SXNJa3RsWlhBZ1RXOWtaV3dnVkhKaGJuTndZWEpsYm1ONUlpd2lmaUpkTENKaGMzQmxZM1JmY21GMGFXOGlPbnNpYzNkcGRHTm9JanAwY25WbExDSjJZV3gxWlNJNk1UTXpMakI5TENKa1lXMWhaMlZmYVc1a2FXTmhkRzl5SWpwN0ltMXBibDl2Ym14NUlqcG1ZV3h6WlN3aWMzZHBkR05vSWpwbVlXeHpaWDBzSW1ocGRHMWhjbXRsY2lJNmV5SmpiMnh2Y2lJNld5SXlSQ0lzSWlOR1JrWkdSa1pHUmlJc0luNGlYU3dpYzJWc1pXTjBJanBiSWpKRUlpd2lNMFFpTENKK0lsMHNJblJwYldVaU9qRXdMakI5TENKdFlXNTFZV3hmWVhKeWIzZHpJanA3SW1OdmJHOXlJam9pSTBaR1JrWkdSa1pHSWl3aVptOXVkQ0k2SWtSbFptRjFiSFFpTENKdlptWnpaWFFpT2pNMUxqQXNJbk4zYVhSamFDSTZabUZzYzJVc0luTjViV0p2YkhNaU9uc2labTl5ZDJGeVpDSTZJbDRpTENKc1pXWjBJam9pUENJc0luSnBaMmgwSWpvaVBpSjlmU3dpYzJOdmNHVmZiM1psY214aGVTSTZleUpoYm1sdFlYUnBiMjRpT25SeWRXVXNJbU52Ykc5eWN5STZleUpsWkdkbElqb2lJekF3TURBd01EQXdJaXdpYldGcGJpSTZJaU00TlRnMU9EVkVOaUo5TENKbllYQWlPalV1TUN3aWJHVnVaM1JvSWpveU9EZ3VNQ3dpYjNCMGFXOXVjeUk2V3lKK0lsMHNJbk4zYVhSamFDSTZkSEoxWlgwc0luTnJaV1YwWDJsdVpHbGpZWFJ2Y25NaU9uc2lZbTl0WWlJNmRISjFaU3dpWm1WaGRIVnlaWE1pT2xzaVJtOXlZMlVnYzJGbVpTQndiMmx1ZENJc0lrWnZjbU5sSUdKdlpIa2dZV2x0SWl3aVVHbHVaeUJ6Y0dsclpTSXNJa1J2ZFdKc1pTQjBZWEFpTENKRWRXTnJJSEJsWldzZ1lYTnphWE4wSWl3aVJuSmxaWE4wWVc1a2FXNW5JaXdpVDI0Z2MyaHZkQ0JoYm5ScExXRnBiU0lzSWsxcGJtbHRkVzBnWkdGdFlXZGxJRzkyWlhKeWFXUmxJaXdpZmlKZExDSnpkMmwwWTJnaU9tWmhiSE5sZlN3aWMydDVZbTk0SWpvaVRtbG5hSFFpTENKMlpXeHZZMmwwZVY5M1lYSnVhVzVuSWpwN0ltTnZiRzl5SWpvaUkwWkdSa1pHUmtaR0lpd2ljM2RwZEdOb0lqcG1ZV3h6Wlgwc0luWnBaWGR0YjJSbGJGOWphR0Z1WjJWeUlqcDdJbVp2ZGlJNk5UTTNMakFzSW14bFpuUWlPblJ5ZFdVc0luTjNhWFJqYUNJNmRISjFaU3dpZUNJNkxURXhMakFzSW5raU9qUTVMakFzSW5vaU9qRXlMakI5ZlgwPSIsIm5hbWUiOiJkc2FkYXNkYXNkIiwidGltZSI6MTc3NDgwNjAxNi4wfQ==",
				name = "METABOBRIK67"
			},
			[3] = {
				data = "eyJhdXRob3IiOiJWXzEiLCJjb25maWciOiJleUpoYm5ScFlXbHRJanA3SW1GdVoyeGxjeUk2ZXlKaGJuUnBYMkp5ZFhSbFptOXlZMlVpT25zaWJXOWtaU0k2SWsxbGRHRWlMQ0p1YjNScFpua2lPbVpoYkhObExDSnpkR0YwWlhNaU9sc2lVM1JoYm1ScGJtY2lMQ0pTZFc1dWFXNW5JaXdpVTJ4dmQybHVaeUlzSWtOeWIzVmphR2x1WnlJc0lsTnVaV0ZyYVc1bklpd2lRV2x5SWl3aVFXbHlJRU55YjNWamFHbHVaeUlzSWt4bFoybDBJRUZCSWl3aWZpSmRMQ0p6ZDJsMFkyZ2lPblJ5ZFdVc0luUnBiV1Z2ZFhRaU9qTXdMakI5TENKaWNtVmhhMTlzWXlJNmV5SmthWE5oWW14bFgyOXVYMmR5Wlc1aFpHVWlPblJ5ZFdVc0ltaHBaR1ZmYzJodmRITWlPaUpDY21WaGF5Qk1ReUlzSW5ObGJHVmpkQ0k2V3lKVGRHRnVaR2x1WnlJc0lsSjFibTVwYm1jaUxDSlRiRzkzYVc1bklpd2lRM0p2ZFdOb2FXNW5JaXdpVTI1bFlXdHBibWNpTENKQmFYSWlMQ0pCYVhJZ1EzSnZkV05vYVc1bklpd2lUR1ZuYVhRZ1FVRWlMQ0pHY21WbGMzUmhibVJwYm1jaUxDSitJbDE5TENKaWRXbHNaR1Z5SWpwN0lrRnBjaUk2ZXlKRFZDSTZleUppYjJSNVgyWnlaV1Z6ZEdGdVpHbHVaeUk2SWs5bVppSXNJbUp2WkhsZmVXRjNJanAwY25WbExDSmliMlI1WDNsaGQxOXZjSFJwYjI1eklqcGJJa3BwZEhSbGNpSXNJbjRpWFN3aVkyaHZhMlVpT2lKRVpXWmhkV3gwSWl3aVkyaHZhMlV4WHpFaU9qSXVNQ3dpWTJodmEyVXhYeklpT2pJdU1Dd2lZMmh2YTJVeFh6TWlPakl1TUN3aVkyaHZhMlV4WHpRaU9qSXVNQ3dpWTJodmEyVXhYelVpT2pJdU1Dd2lZMmh2YTJVeFh6WWlPakl1TUN3aVkyaHZhMlZmWm5KdmJTSTZNVFl1TUN3aVkyaHZhMlZmYldWMGFHOWtJam9pVW1GdVpHOXRJaXdpWTJodmEyVmZjMnhwWkdWeUlqb3hOaTR3TENKamFHOXJaVjl6Ykdsa1pYSnpJam95TGpBc0ltTm9iMnRsWDNSdklqb3hOaTR3TENKamRYTjBiMjFmWTJodmEyVWlPbVpoYkhObExDSmtaV3hoZVNJNmRISjFaU3dpWkdWc1lYbGZNU0k2TWk0d0xDSmtaV3hoZVY4eUlqb3hMakFzSW1SbGJHRjVYek1pT2pFdU1Dd2laR1ZzWVhsZk5DSTZNUzR3TENKa1pXeGhlVjgxSWpveUxqQXNJbVJsYkdGNVh6WWlPakl1TUN3aVpHVnNZWGxmWTNWemRHOXRYM05zYVdSbGNuTWlPakl1TUN3aVpHVnNZWGxmWkdWbVlYVnNkQ0k2Tmk0d0xDSmtaV3hoZVY5c2IyZHBZeUk2SWtSbFptRjFiSFFpTENKa1pXeGhlVjl0WlhSb2IyUWlPaUpFWldaaGRXeDBJaXdpWkdWc1lYbGZjbUZ1Wkc5dFgyMWhlQ0k2TWk0d0xDSmtaV3hoZVY5eVlXNWtiMjFmYldsdUlqb3lMakFzSW1aeWIyMWZiR2x0YVhRaU9qWXdMakFzSW14bFpuUmZiR2x0YVhRaU9qWXdMakFzSW14cGJXbDBYMjF2WkdVaU9pSlRkR0YwYVdNaUxDSnRZWGdpT2pBdU1Dd2liV0Y0YVcxMWJWOXNhVzFwZENJNk5qQXVNQ3dpYldsdUlqb3dMakFzSW0xcGJtbHRkVzFmYkdsdGFYUWlPall3TGpBc0ltMXZaR1VpT2lKVGRHRjBhV01pTENKdGIyUmxYM0poYm1SdmJTSTZOQzR3TENKdGIyUmxYM1JwWTJ0eklqbzBMakFzSW0xdlpHbG1hV1Z5SWpvaVJHbHpZV0pzWldRaUxDSnRiMlJwWm1sbGNsOWpkWE4wYjIxZmMyeHBaR1Z5Y3lJNk1pNHdMQ0p0YjJScFptbGxjbDl0YjJSbElqb2lSR1ZtWVhWc2RDSXNJbTF2WkdsbWFXVnlYMjltWm5ObGRDSTZMVEV6TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk1TSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpJaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh6SWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZOQ0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6VWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4Mklqb3dMakFzSW05bVpuTmxkQ0k2TUM0d0xDSnlZVzVrYjIxcGVtVWlPbVpoYkhObExDSnlhV2RvZEY5c2FXMXBkQ0k2TmpBdU1Dd2ljMkpmYzNCbFpXUWlPakV1TUN3aWMybHVaWGRoZG1WZmMzQmxaV1FpT2pVdU1Dd2lkRzlmYkdsdGFYUWlPall3TGpBc0lubGhkMTlzWldaMElqb3RNVFl1TUN3aWVXRjNYMjF2WkdVaU9qSXVNQ3dpZVdGM1gzSnBaMmgwSWpvek5TNHdmU3dpVkNJNmV5SmliMlI1WDJaeVpXVnpkR0Z1WkdsdVp5STZJazltWmlJc0ltSnZaSGxmZVdGM0lqcDBjblZsTENKaWIyUjVYM2xoZDE5dmNIUnBiMjV6SWpwYklrcHBkSFJsY2lJc0luNGlYU3dpWTJodmEyVWlPaUpFWldaaGRXeDBJaXdpWTJodmEyVXhYekVpT2pJdU1Dd2lZMmh2YTJVeFh6SWlPakl1TUN3aVkyaHZhMlV4WHpNaU9qSXVNQ3dpWTJodmEyVXhYelFpT2pJdU1Dd2lZMmh2YTJVeFh6VWlPakl1TUN3aVkyaHZhMlV4WHpZaU9qSXVNQ3dpWTJodmEyVmZabkp2YlNJNk1UWXVNQ3dpWTJodmEyVmZiV1YwYUc5a0lqb2lVbUZ1Wkc5dElpd2lZMmh2YTJWZmMyeHBaR1Z5SWpveE5pNHdMQ0pqYUc5clpWOXpiR2xrWlhKeklqb3lMakFzSW1Ob2IydGxYM1J2SWpveE5pNHdMQ0pqZFhOMGIyMWZZMmh2YTJVaU9tWmhiSE5sTENKa1pXeGhlU0k2ZEhKMVpTd2laR1ZzWVhsZk1TSTZNaTR3TENKa1pXeGhlVjh5SWpvd0xqQXNJbVJsYkdGNVh6TWlPakF1TUN3aVpHVnNZWGxmTkNJNk1DNHdMQ0prWld4aGVWODFJam95TGpBc0ltUmxiR0Y1WHpZaU9qSXVNQ3dpWkdWc1lYbGZZM1Z6ZEc5dFgzTnNhV1JsY25NaU9qSXVNQ3dpWkdWc1lYbGZaR1ZtWVhWc2RDSTZOaTR3TENKa1pXeGhlVjlzYjJkcFl5STZJa1JsWm1GMWJIUWlMQ0prWld4aGVWOXRaWFJvYjJRaU9pSkVaV1poZFd4MElpd2laR1ZzWVhsZmNtRnVaRzl0WDIxaGVDSTZNaTR3TENKa1pXeGhlVjl5WVc1a2IyMWZiV2x1SWpveUxqQXNJbVp5YjIxZmJHbHRhWFFpT2pZd0xqQXNJbXhsWm5SZmJHbHRhWFFpT2pZd0xqQXNJbXhwYldsMFgyMXZaR1VpT2lKVGRHRjBhV01pTENKdFlYZ2lPakF1TUN3aWJXRjRhVzExYlY5c2FXMXBkQ0k2TmpBdU1Dd2liV2x1SWpvd0xqQXNJbTFwYm1sdGRXMWZiR2x0YVhRaU9qWXdMakFzSW0xdlpHVWlPaUpUZEdGMGFXTWlMQ0p0YjJSbFgzSmhibVJ2YlNJNk5DNHdMQ0p0YjJSbFgzUnBZMnR6SWpvMExqQXNJbTF2WkdsbWFXVnlJam9pUkdsellXSnNaV1FpTENKdGIyUnBabWxsY2w5amRYTjBiMjFmYzJ4cFpHVnljeUk2TWk0d0xDSnRiMlJwWm1sbGNsOXRiMlJsSWpvaVJHVm1ZWFZzZENJc0ltMXZaR2xtYVdWeVgyOW1abk5sZENJNkxURXpMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTVNJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYeklpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxOHpJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk5DSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpVaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTgySWpvd0xqQXNJbTltWm5ObGRDSTZNQzR3TENKeVlXNWtiMjFwZW1VaU9tWmhiSE5sTENKeWFXZG9kRjlzYVcxcGRDSTZOakF1TUN3aWMySmZjM0JsWldRaU9qRXVNQ3dpYzJsdVpYZGhkbVZmYzNCbFpXUWlPalV1TUN3aWRHOWZiR2x0YVhRaU9qWXdMakFzSW5saGQxOXNaV1owSWpvdE1UWXVNQ3dpZVdGM1gyMXZaR1VpT2pJdU1Dd2llV0YzWDNKcFoyaDBJam96TlM0d2ZYMHNJa0ZwY2lCRGNtOTFZMmhwYm1jaU9uc2lRMVFpT25zaVltOWtlVjltY21WbGMzUmhibVJwYm1jaU9pSlBabVlpTENKaWIyUjVYM2xoZHlJNmRISjFaU3dpWW05a2VWOTVZWGRmYjNCMGFXOXVjeUk2V3lKS2FYUjBaWElpTENKK0lsMHNJbU5vYjJ0bElqb2lSR1ZtWVhWc2RDSXNJbU5vYjJ0bE1WOHhJam94TUM0d0xDSmphRzlyWlRGZk1pSTZNVEF1TUN3aVkyaHZhMlV4WHpNaU9qRTRMakFzSW1Ob2IydGxNVjgwSWpvM0xqQXNJbU5vYjJ0bE1WODFJam94TUM0d0xDSmphRzlyWlRGZk5pSTZNakl1TUN3aVkyaHZhMlZmWm5KdmJTSTZNVFl1TUN3aVkyaHZhMlZmYldWMGFHOWtJam9pVW1GdVpHOXRJaXdpWTJodmEyVmZjMnhwWkdWeUlqb3hOaTR3TENKamFHOXJaVjl6Ykdsa1pYSnpJam95TGpBc0ltTm9iMnRsWDNSdklqb3hNaTR3TENKamRYTjBiMjFmWTJodmEyVWlPbVpoYkhObExDSmtaV3hoZVNJNmRISjFaU3dpWkdWc1lYbGZNU0k2TWk0d0xDSmtaV3hoZVY4eUlqb3hMakFzSW1SbGJHRjVYek1pT2pFdU1Dd2laR1ZzWVhsZk5DSTZNUzR3TENKa1pXeGhlVjgxSWpveUxqQXNJbVJsYkdGNVh6WWlPakl1TUN3aVpHVnNZWGxmWTNWemRHOXRYM05zYVdSbGNuTWlPakl1TUN3aVpHVnNZWGxmWkdWbVlYVnNkQ0k2Tnk0d0xDSmtaV3hoZVY5c2IyZHBZeUk2SWtSbFptRjFiSFFpTENKa1pXeGhlVjl0WlhSb2IyUWlPaUpTWVc1a2IyMGlMQ0prWld4aGVWOXlZVzVrYjIxZmJXRjRJam94TkM0d0xDSmtaV3hoZVY5eVlXNWtiMjFmYldsdUlqbzVMakFzSW1aeWIyMWZiR2x0YVhRaU9qWXdMakFzSW14bFpuUmZiR2x0YVhRaU9qWXdMakFzSW14cGJXbDBYMjF2WkdVaU9pSlRkMmwwWTJnaUxDSnRZWGdpT2kweE1TNHdMQ0p0WVhocGJYVnRYMnhwYldsMElqbzJNQzR3TENKdGFXNGlPakF1TUN3aWJXbHVhVzExYlY5c2FXMXBkQ0k2TmpBdU1Dd2liVzlrWlNJNklsTjBZWFJwWXlJc0ltMXZaR1ZmY21GdVpHOXRJam8wTGpBc0ltMXZaR1ZmZEdsamEzTWlPakV4TGpBc0ltMXZaR2xtYVdWeUlqb2lVM0JwYmlJc0ltMXZaR2xtYVdWeVgyTjFjM1J2YlY5emJHbGtaWEp6SWpvMUxqQXNJbTF2WkdsbWFXVnlYMjF2WkdVaU9pSkRkWE4wYjIwaUxDSnRiMlJwWm1sbGNsOXZabVp6WlhRaU9pMHhNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpFaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh5SWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZNeUk2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6UWlPaTA0TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk5TSTZOUzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpZaU9qQXVNQ3dpYjJabWMyVjBJam93TGpBc0luSmhibVJ2YldsNlpTSTZkSEoxWlN3aWNtbG5hSFJmYkdsdGFYUWlPall3TGpBc0luTmlYM053WldWa0lqb3hMakFzSW5OcGJtVjNZWFpsWDNOd1pXVmtJam8xTGpBc0luUnZYMnhwYldsMElqbzJNQzR3TENKNVlYZGZiR1ZtZENJNkxUSTNMakFzSW5saGQxOXRiMlJsSWpveUxqQXNJbmxoZDE5eWFXZG9kQ0k2TkRBdU1IMHNJbFFpT25zaVltOWtlVjltY21WbGMzUmhibVJwYm1jaU9pSlBabVlpTENKaWIyUjVYM2xoZHlJNmRISjFaU3dpWW05a2VWOTVZWGRmYjNCMGFXOXVjeUk2V3lKS2FYUjBaWElpTENKK0lsMHNJbU5vYjJ0bElqb2lSR1ZtWVhWc2RDSXNJbU5vYjJ0bE1WOHhJam94TUM0d0xDSmphRzlyWlRGZk1pSTZNVEF1TUN3aVkyaHZhMlV4WHpNaU9qRTRMakFzSW1Ob2IydGxNVjgwSWpvM0xqQXNJbU5vYjJ0bE1WODFJam94TUM0d0xDSmphRzlyWlRGZk5pSTZNakl1TUN3aVkyaHZhMlZmWm5KdmJTSTZNVFl1TUN3aVkyaHZhMlZmYldWMGFHOWtJam9pVW1GdVpHOXRJaXdpWTJodmEyVmZjMnhwWkdWeUlqb3hOaTR3TENKamFHOXJaVjl6Ykdsa1pYSnpJam95TGpBc0ltTm9iMnRsWDNSdklqb3hNaTR3TENKamRYTjBiMjFmWTJodmEyVWlPbVpoYkhObExDSmtaV3hoZVNJNmRISjFaU3dpWkdWc1lYbGZNU0k2TWk0d0xDSmtaV3hoZVY4eUlqb3dMakFzSW1SbGJHRjVYek1pT2pBdU1Dd2laR1ZzWVhsZk5DSTZNQzR3TENKa1pXeGhlVjgxSWpveUxqQXNJbVJsYkdGNVh6WWlPakl1TUN3aVpHVnNZWGxmWTNWemRHOXRYM05zYVdSbGNuTWlPakl1TUN3aVpHVnNZWGxmWkdWbVlYVnNkQ0k2Tnk0d0xDSmtaV3hoZVY5c2IyZHBZeUk2SWtSbFptRjFiSFFpTENKa1pXeGhlVjl0WlhSb2IyUWlPaUpFWldaaGRXeDBJaXdpWkdWc1lYbGZjbUZ1Wkc5dFgyMWhlQ0k2T0M0d0xDSmtaV3hoZVY5eVlXNWtiMjFmYldsdUlqbzNMakFzSW1aeWIyMWZiR2x0YVhRaU9qWXdMakFzSW14bFpuUmZiR2x0YVhRaU9qWXdMakFzSW14cGJXbDBYMjF2WkdVaU9pSlRkMmwwWTJnaUxDSnRZWGdpT2kweE1TNHdMQ0p0WVhocGJYVnRYMnhwYldsMElqbzJNQzR3TENKdGFXNGlPakF1TUN3aWJXbHVhVzExYlY5c2FXMXBkQ0k2TmpBdU1Dd2liVzlrWlNJNklsTjBZWFJwWXlJc0ltMXZaR1ZmY21GdVpHOXRJam8wTGpBc0ltMXZaR1ZmZEdsamEzTWlPakV4TGpBc0ltMXZaR2xtYVdWeUlqb2lVM0JwYmlJc0ltMXZaR2xtYVdWeVgyTjFjM1J2YlY5emJHbGtaWEp6SWpvMUxqQXNJbTF2WkdsbWFXVnlYMjF2WkdVaU9pSkRkWE4wYjIwaUxDSnRiMlJwWm1sbGNsOXZabVp6WlhRaU9pMHhNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpFaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh5SWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZNeUk2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6UWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4MUlqb3RNVEV1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4Mklqb3dMakFzSW05bVpuTmxkQ0k2TUM0d0xDSnlZVzVrYjIxcGVtVWlPblJ5ZFdVc0luSnBaMmgwWDJ4cGJXbDBJam8yTUM0d0xDSnpZbDl6Y0dWbFpDSTZNUzR3TENKemFXNWxkMkYyWlY5emNHVmxaQ0k2TlM0d0xDSjBiMTlzYVcxcGRDSTZOakF1TUN3aWVXRjNYMnhsWm5RaU9pMHlOeTR3TENKNVlYZGZiVzlrWlNJNk1pNHdMQ0o1WVhkZmNtbG5hSFFpT2pReUxqQjlmU3dpUTNKdmRXTm9hVzVuSWpwN0lrTlVJanA3SW1KdlpIbGZabkpsWlhOMFlXNWthVzVuSWpvaVQyWm1JaXdpWW05a2VWOTVZWGNpT25SeWRXVXNJbUp2WkhsZmVXRjNYMjl3ZEdsdmJuTWlPbHNpU21sMGRHVnlJaXdpZmlKZExDSmphRzlyWlNJNklrUmxabUYxYkhRaUxDSmphRzlyWlRGZk1TSTZOaTR3TENKamFHOXJaVEZmTWlJNk1qSXVNQ3dpWTJodmEyVXhYek1pT2pRdU1Dd2lZMmh2YTJVeFh6UWlPakUwTGpBc0ltTm9iMnRsTVY4MUlqbzVMakFzSW1Ob2IydGxNVjgySWpvMExqQXNJbU5vYjJ0bFgyWnliMjBpT2pndU1Dd2lZMmh2YTJWZmJXVjBhRzlrSWpvaVUyVnhkV1Z1ZEdsaGJDSXNJbU5vYjJ0bFgzTnNhV1JsY2lJNk1UWXVNQ3dpWTJodmEyVmZjMnhwWkdWeWN5STZOaTR3TENKamFHOXJaVjkwYnlJNk1qSXVNQ3dpWTNWemRHOXRYMk5vYjJ0bElqcG1ZV3h6WlN3aVpHVnNZWGtpT25SeWRXVXNJbVJsYkdGNVh6RWlPakl1TUN3aVpHVnNZWGxmTWlJNk1TNHdMQ0prWld4aGVWOHpJam94TGpBc0ltUmxiR0Y1WHpRaU9qRXVNQ3dpWkdWc1lYbGZOU0k2TWk0d0xDSmtaV3hoZVY4Mklqb3lMakFzSW1SbGJHRjVYMk4xYzNSdmJWOXpiR2xrWlhKeklqb3lMakFzSW1SbGJHRjVYMlJsWm1GMWJIUWlPamt1TUN3aVpHVnNZWGxmYkc5bmFXTWlPaUpFWldaaGRXeDBJaXdpWkdWc1lYbGZiV1YwYUc5a0lqb2lVbUZ1Wkc5dElpd2laR1ZzWVhsZmNtRnVaRzl0WDIxaGVDSTZPQzR3TENKa1pXeGhlVjl5WVc1a2IyMWZiV2x1SWpvMkxqQXNJbVp5YjIxZmJHbHRhWFFpT2pZd0xqQXNJbXhsWm5SZmJHbHRhWFFpT2pZd0xqQXNJbXhwYldsMFgyMXZaR1VpT2lKVGQybDBZMmdpTENKdFlYZ2lPakF1TUN3aWJXRjRhVzExYlY5c2FXMXBkQ0k2TmpBdU1Dd2liV2x1SWpvd0xqQXNJbTFwYm1sdGRXMWZiR2x0YVhRaU9qWXdMakFzSW0xdlpHVWlPaUpUZEdGMGFXTWlMQ0p0YjJSbFgzSmhibVJ2YlNJNk5DNHdMQ0p0YjJSbFgzUnBZMnR6SWpvMExqQXNJbTF2WkdsbWFXVnlJam9pVTNCcGJpSXNJbTF2WkdsbWFXVnlYMk4xYzNSdmJWOXpiR2xrWlhKeklqbzBMakFzSW0xdlpHbG1hV1Z5WDIxdlpHVWlPaUpEZFhOMGIyMGlMQ0p0YjJScFptbGxjbDl2Wm1aelpYUWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4eElqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTWlJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYek1pT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxODBJam90TVRZdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxODFJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk5pSTZNQzR3TENKdlptWnpaWFFpT2pBdU1Dd2ljbUZ1Wkc5dGFYcGxJanAwY25WbExDSnlhV2RvZEY5c2FXMXBkQ0k2TmpBdU1Dd2ljMkpmYzNCbFpXUWlPakV1TUN3aWMybHVaWGRoZG1WZmMzQmxaV1FpT2pVdU1Dd2lkRzlmYkdsdGFYUWlPall3TGpBc0lubGhkMTlzWldaMElqb3RNVGt1TUN3aWVXRjNYMjF2WkdVaU9qSXVNQ3dpZVdGM1gzSnBaMmgwSWpvek5TNHdmU3dpVkNJNmV5SmliMlI1WDJaeVpXVnpkR0Z1WkdsdVp5STZJazltWmlJc0ltSnZaSGxmZVdGM0lqcDBjblZsTENKaWIyUjVYM2xoZDE5dmNIUnBiMjV6SWpwYklrcHBkSFJsY2lJc0luNGlYU3dpWTJodmEyVWlPaUpFWldaaGRXeDBJaXdpWTJodmEyVXhYekVpT2pZdU1Dd2lZMmh2YTJVeFh6SWlPakl5TGpBc0ltTm9iMnRsTVY4eklqbzBMakFzSW1Ob2IydGxNVjgwSWpveE5DNHdMQ0pqYUc5clpURmZOU0k2T1M0d0xDSmphRzlyWlRGZk5pSTZOQzR3TENKamFHOXJaVjltY205dElqbzRMakFzSW1Ob2IydGxYMjFsZEdodlpDSTZJbE5sY1hWbGJuUnBZV3dpTENKamFHOXJaVjl6Ykdsa1pYSWlPakUyTGpBc0ltTm9iMnRsWDNOc2FXUmxjbk1pT2pZdU1Dd2lZMmh2YTJWZmRHOGlPakl5TGpBc0ltTjFjM1J2YlY5amFHOXJaU0k2Wm1Gc2MyVXNJbVJsYkdGNUlqcDBjblZsTENKa1pXeGhlVjh4SWpveUxqQXNJbVJsYkdGNVh6SWlPakF1TUN3aVpHVnNZWGxmTXlJNk1DNHdMQ0prWld4aGVWODBJam93TGpBc0ltUmxiR0Y1WHpVaU9qSXVNQ3dpWkdWc1lYbGZOaUk2TWk0d0xDSmtaV3hoZVY5amRYTjBiMjFmYzJ4cFpHVnljeUk2TWk0d0xDSmtaV3hoZVY5a1pXWmhkV3gwSWpvNUxqQXNJbVJsYkdGNVgyeHZaMmxqSWpvaVJHVm1ZWFZzZENJc0ltUmxiR0Y1WDIxbGRHaHZaQ0k2SWxKaGJtUnZiU0lzSW1SbGJHRjVYM0poYm1SdmJWOXRZWGdpT2pVdU1Dd2laR1ZzWVhsZmNtRnVaRzl0WDIxcGJpSTZOeTR3TENKbWNtOXRYMnhwYldsMElqbzJNQzR3TENKc1pXWjBYMnhwYldsMElqbzJNQzR3TENKc2FXMXBkRjl0YjJSbElqb2lVM1JoZEdsaklpd2liV0Y0SWpvd0xqQXNJbTFoZUdsdGRXMWZiR2x0YVhRaU9qWXdMakFzSW0xcGJpSTZNQzR3TENKdGFXNXBiWFZ0WDJ4cGJXbDBJam8yTUM0d0xDSnRiMlJsSWpvaVUzUmhkR2xqSWl3aWJXOWtaVjl5WVc1a2IyMGlPalF1TUN3aWJXOWtaVjkwYVdOcmN5STZOQzR3TENKdGIyUnBabWxsY2lJNklsTndhVzRpTENKdGIyUnBabWxsY2w5amRYTjBiMjFmYzJ4cFpHVnljeUk2TkM0d0xDSnRiMlJwWm1sbGNsOXRiMlJsSWpvaVEzVnpkRzl0SWl3aWJXOWthV1pwWlhKZmIyWm1jMlYwSWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZNU0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6SWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4eklqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTkNJNkxURXlMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTlNJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYellpT2pBdU1Dd2liMlptYzJWMElqb3dMakFzSW5KaGJtUnZiV2w2WlNJNmRISjFaU3dpY21sbmFIUmZiR2x0YVhRaU9qWXdMakFzSW5OaVgzTndaV1ZrSWpveExqQXNJbk5wYm1WM1lYWmxYM053WldWa0lqbzFMakFzSW5SdlgyeHBiV2wwSWpvMk1DNHdMQ0o1WVhkZmJHVm1kQ0k2TFRFNUxqQXNJbmxoZDE5dGIyUmxJam95TGpBc0lubGhkMTl5YVdkb2RDSTZNekV1TUgxOUxDSkdjbVZsYzNSaGJtUnBibWNpT25zaVExUWlPbnNpWVd4c2IzZGZjM1JoZEdVaU9uUnlkV1VzSW1KdlpIbGZabkpsWlhOMFlXNWthVzVuSWpvaVQyWm1JaXdpWW05a2VWOTVZWGNpT25SeWRXVXNJbUp2WkhsZmVXRjNYMjl3ZEdsdmJuTWlPbHNpU21sMGRHVnlJaXdpZmlKZExDSmphRzlyWlNJNklrUmxabUYxYkhRaUxDSmphRzlyWlRGZk1TSTZNaTR3TENKamFHOXJaVEZmTWlJNk1pNHdMQ0pqYUc5clpURmZNeUk2TWk0d0xDSmphRzlyWlRGZk5DSTZNaTR3TENKamFHOXJaVEZmTlNJNk1pNHdMQ0pqYUc5clpURmZOaUk2TWk0d0xDSmphRzlyWlY5bWNtOXRJam94Tmk0d0xDSmphRzlyWlY5dFpYUm9iMlFpT2lKU1lXNWtiMjBpTENKamFHOXJaVjl6Ykdsa1pYSWlPakUyTGpBc0ltTm9iMnRsWDNOc2FXUmxjbk1pT2pJdU1Dd2lZMmh2YTJWZmRHOGlPakUyTGpBc0ltTjFjM1J2YlY5amFHOXJaU0k2Wm1Gc2MyVXNJbVJsYkdGNUlqcG1ZV3h6WlN3aVpHVnNZWGxmTVNJNk1DNHdMQ0prWld4aGVWOHlJam93TGpBc0ltUmxiR0Y1WHpNaU9qQXVNQ3dpWkdWc1lYbGZOQ0k2TUM0d0xDSmtaV3hoZVY4MUlqb3dMakFzSW1SbGJHRjVYellpT2pBdU1Dd2laR1ZzWVhsZlkzVnpkRzl0WDNOc2FXUmxjbk1pT2pJdU1Dd2laR1ZzWVhsZlpHVm1ZWFZzZENJNk1DNHdMQ0prWld4aGVWOXNiMmRwWXlJNklrUmxabUYxYkhRaUxDSmtaV3hoZVY5dFpYUm9iMlFpT2lKRVpXWmhkV3gwSWl3aVpHVnNZWGxmY21GdVpHOXRYMjFoZUNJNk1DNHdMQ0prWld4aGVWOXlZVzVrYjIxZmJXbHVJam93TGpBc0ltWnliMjFmYkdsdGFYUWlPall3TGpBc0lteGxablJmYkdsdGFYUWlPall3TGpBc0lteHBiV2wwWDIxdlpHVWlPaUpUZEdGMGFXTWlMQ0p0WVhnaU9qQXVNQ3dpYldGNGFXMTFiVjlzYVcxcGRDSTZOakF1TUN3aWJXbHVJam93TGpBc0ltMXBibWx0ZFcxZmJHbHRhWFFpT2pZd0xqQXNJbTF2WkdVaU9pSlRkR0YwYVdNaUxDSnRiMlJsWDNKaGJtUnZiU0k2TkM0d0xDSnRiMlJsWDNScFkydHpJam8wTGpBc0ltMXZaR2xtYVdWeUlqb2lSR2x6WVdKc1pXUWlMQ0p0YjJScFptbGxjbDlqZFhOMGIyMWZjMnhwWkdWeWN5STZNaTR3TENKdGIyUnBabWxsY2w5dGIyUmxJam9pUkdWbVlYVnNkQ0lzSW0xdlpHbG1hV1Z5WDI5bVpuTmxkQ0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6RWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4eUlqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTXlJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYelFpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxODFJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk5pSTZNQzR3TENKdlptWnpaWFFpT2pBdU1Dd2ljbUZ1Wkc5dGFYcGxJanBtWVd4elpTd2ljbWxuYUhSZmJHbHRhWFFpT2pZd0xqQXNJbk5pWDNOd1pXVmtJam94TGpBc0luTnBibVYzWVhabFgzTndaV1ZrSWpvMUxqQXNJblJ2WDJ4cGJXbDBJam8yTUM0d0xDSjVZWGRmYkdWbWRDSTZNQzR3TENKNVlYZGZiVzlrWlNJNk1TNHdMQ0o1WVhkZmNtbG5hSFFpT2pBdU1IMHNJbFFpT25zaVlXeHNiM2RmYzNSaGRHVWlPblJ5ZFdVc0ltSnZaSGxmWm5KbFpYTjBZVzVrYVc1bklqb2lUMlptSWl3aVltOWtlVjk1WVhjaU9uUnlkV1VzSW1KdlpIbGZlV0YzWDI5d2RHbHZibk1pT2xzaVNtbDBkR1Z5SWl3aWZpSmRMQ0pqYUc5clpTSTZJa1JsWm1GMWJIUWlMQ0pqYUc5clpURmZNU0k2TWk0d0xDSmphRzlyWlRGZk1pSTZNaTR3TENKamFHOXJaVEZmTXlJNk1pNHdMQ0pqYUc5clpURmZOQ0k2TWk0d0xDSmphRzlyWlRGZk5TSTZNaTR3TENKamFHOXJaVEZmTmlJNk1pNHdMQ0pqYUc5clpWOW1jbTl0SWpveE5pNHdMQ0pqYUc5clpWOXRaWFJvYjJRaU9pSlNZVzVrYjIwaUxDSmphRzlyWlY5emJHbGtaWElpT2pFMkxqQXNJbU5vYjJ0bFgzTnNhV1JsY25NaU9qSXVNQ3dpWTJodmEyVmZkRzhpT2pFMkxqQXNJbU4xYzNSdmJWOWphRzlyWlNJNlptRnNjMlVzSW1SbGJHRjVJanBtWVd4elpTd2laR1ZzWVhsZk1TSTZNQzR3TENKa1pXeGhlVjh5SWpvd0xqQXNJbVJsYkdGNVh6TWlPakF1TUN3aVpHVnNZWGxmTkNJNk1DNHdMQ0prWld4aGVWODFJam93TGpBc0ltUmxiR0Y1WHpZaU9qQXVNQ3dpWkdWc1lYbGZZM1Z6ZEc5dFgzTnNhV1JsY25NaU9qSXVNQ3dpWkdWc1lYbGZaR1ZtWVhWc2RDSTZNQzR3TENKa1pXeGhlVjlzYjJkcFl5STZJa1JsWm1GMWJIUWlMQ0prWld4aGVWOXRaWFJvYjJRaU9pSkVaV1poZFd4MElpd2laR1ZzWVhsZmNtRnVaRzl0WDIxaGVDSTZNQzR3TENKa1pXeGhlVjl5WVc1a2IyMWZiV2x1SWpvd0xqQXNJbVp5YjIxZmJHbHRhWFFpT2pZd0xqQXNJbXhsWm5SZmJHbHRhWFFpT2pZd0xqQXNJbXhwYldsMFgyMXZaR1VpT2lKVGRHRjBhV01pTENKdFlYZ2lPakF1TUN3aWJXRjRhVzExYlY5c2FXMXBkQ0k2TmpBdU1Dd2liV2x1SWpvd0xqQXNJbTFwYm1sdGRXMWZiR2x0YVhRaU9qWXdMakFzSW0xdlpHVWlPaUpUZEdGMGFXTWlMQ0p0YjJSbFgzSmhibVJ2YlNJNk5DNHdMQ0p0YjJSbFgzUnBZMnR6SWpvMExqQXNJbTF2WkdsbWFXVnlJam9pUkdsellXSnNaV1FpTENKdGIyUnBabWxsY2w5amRYTjBiMjFmYzJ4cFpHVnljeUk2TWk0d0xDSnRiMlJwWm1sbGNsOXRiMlJsSWpvaVJHVm1ZWFZzZENJc0ltMXZaR2xtYVdWeVgyOW1abk5sZENJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYekVpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxOHlJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk15STZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpRaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTgxSWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZOaUk2TUM0d0xDSnZabVp6WlhRaU9qQXVNQ3dpY21GdVpHOXRhWHBsSWpwbVlXeHpaU3dpY21sbmFIUmZiR2x0YVhRaU9qWXdMakFzSW5OaVgzTndaV1ZrSWpveExqQXNJbk5wYm1WM1lYWmxYM053WldWa0lqbzFMakFzSW5SdlgyeHBiV2wwSWpvMk1DNHdMQ0o1WVhkZmJHVm1kQ0k2TUM0d0xDSjVZWGRmYlc5a1pTSTZNUzR3TENKNVlYZGZjbWxuYUhRaU9qQXVNSDE5TENKTVpXZHBkQ0JCUVNJNmV5SkRWQ0k2ZXlKaGJHeHZkMTl6ZEdGMFpTSTZkSEoxWlN3aVltOWtlVjltY21WbGMzUmhibVJwYm1jaU9pSlFaV1ZySUZKbFlXd2lMQ0ppYjJSNVgzbGhkeUk2ZEhKMVpTd2lZbTlrZVY5NVlYZGZiM0IwYVc5dWN5STZXeUpLYVhSMFpYSWlMQ0pTWVc1a2IyMXBlbVVnU21sMGRHVnlJaXdpUVc1MGFTQkNjblYwWldadmNtTmxJaXdpZmlKZExDSmphRzlyWlNJNklrUmxabUYxYkhRaUxDSmphRzlyWlRGZk1TSTZNaTR3TENKamFHOXJaVEZmTWlJNk1pNHdMQ0pqYUc5clpURmZNeUk2TWk0d0xDSmphRzlyWlRGZk5DSTZNaTR3TENKamFHOXJaVEZmTlNJNk1pNHdMQ0pqYUc5clpURmZOaUk2TWk0d0xDSmphRzlyWlY5bWNtOXRJam94Tmk0d0xDSmphRzlyWlY5dFpYUm9iMlFpT2lKU1lXNWtiMjBpTENKamFHOXJaVjl6Ykdsa1pYSWlPakUyTGpBc0ltTm9iMnRsWDNOc2FXUmxjbk1pT2pJdU1Dd2lZMmh2YTJWZmRHOGlPakUyTGpBc0ltTjFjM1J2YlY5amFHOXJaU0k2Wm1Gc2MyVXNJbVJsYkdGNUlqcG1ZV3h6WlN3aVpHVnNZWGxmTVNJNk1DNHdMQ0prWld4aGVWOHlJam93TGpBc0ltUmxiR0Y1WHpNaU9qQXVNQ3dpWkdWc1lYbGZOQ0k2TUM0d0xDSmtaV3hoZVY4MUlqb3dMakFzSW1SbGJHRjVYellpT2pBdU1Dd2laR1ZzWVhsZlkzVnpkRzl0WDNOc2FXUmxjbk1pT2pJdU1Dd2laR1ZzWVhsZlpHVm1ZWFZzZENJNk1DNHdMQ0prWld4aGVWOXNiMmRwWXlJNklrUmxabUYxYkhRaUxDSmtaV3hoZVY5dFpYUm9iMlFpT2lKRVpXWmhkV3gwSWl3aVpHVnNZWGxmY21GdVpHOXRYMjFoZUNJNk1DNHdMQ0prWld4aGVWOXlZVzVrYjIxZmJXbHVJam93TGpBc0ltWnliMjFmYkdsdGFYUWlPall3TGpBc0lteGxablJmYkdsdGFYUWlPall3TGpBc0lteHBiV2wwWDIxdlpHVWlPaUpUZEdGMGFXTWlMQ0p0WVhnaU9qQXVNQ3dpYldGNGFXMTFiVjlzYVcxcGRDSTZOakF1TUN3aWJXbHVJam93TGpBc0ltMXBibWx0ZFcxZmJHbHRhWFFpT2pZd0xqQXNJbTF2WkdVaU9pSlRkR0YwYVdNaUxDSnRiMlJsWDNKaGJtUnZiU0k2TkM0d0xDSnRiMlJsWDNScFkydHpJam8wTGpBc0ltMXZaR2xtYVdWeUlqb2lRbTlpY204aUxDSnRiMlJwWm1sbGNsOWpkWE4wYjIxZmMyeHBaR1Z5Y3lJNk1pNHdMQ0p0YjJScFptbGxjbDl0YjJSbElqb2lSR1ZtWVhWc2RDSXNJbTF2WkdsbWFXVnlYMjltWm5ObGRDSTZMVFV1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4eElqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTWlJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYek1pT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxODBJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk5TSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpZaU9qQXVNQ3dpYjJabWMyVjBJam94T0RBdU1Dd2ljbUZ1Wkc5dGFYcGxJanBtWVd4elpTd2ljbWxuYUhSZmJHbHRhWFFpT2pZd0xqQXNJbk5pWDNOd1pXVmtJam94TGpBc0luTnBibVYzWVhabFgzTndaV1ZrSWpvMUxqQXNJblJ2WDJ4cGJXbDBJam8yTUM0d0xDSjVZWGRmYkdWbWRDSTZNQzR3TENKNVlYZGZiVzlrWlNJNk1TNHdMQ0o1WVhkZmNtbG5hSFFpT2pBdU1IMHNJbFFpT25zaVlXeHNiM2RmYzNSaGRHVWlPblJ5ZFdVc0ltSnZaSGxmWm5KbFpYTjBZVzVrYVc1bklqb2lVR1ZsYXlCU1pXRnNJaXdpWW05a2VWOTVZWGNpT25SeWRXVXNJbUp2WkhsZmVXRjNYMjl3ZEdsdmJuTWlPbHNpU21sMGRHVnlJaXdpVW1GdVpHOXRhWHBsSUVwcGRIUmxjaUlzSWtGdWRHa2dRbkoxZEdWbWIzSmpaU0lzSW40aVhTd2lZMmh2YTJVaU9pSkVaV1poZFd4MElpd2lZMmh2YTJVeFh6RWlPakl1TUN3aVkyaHZhMlV4WHpJaU9qSXVNQ3dpWTJodmEyVXhYek1pT2pJdU1Dd2lZMmh2YTJVeFh6UWlPakl1TUN3aVkyaHZhMlV4WHpVaU9qSXVNQ3dpWTJodmEyVXhYellpT2pJdU1Dd2lZMmh2YTJWZlpuSnZiU0k2TVRZdU1Dd2lZMmh2YTJWZmJXVjBhRzlrSWpvaVVtRnVaRzl0SWl3aVkyaHZhMlZmYzJ4cFpHVnlJam94Tmk0d0xDSmphRzlyWlY5emJHbGtaWEp6SWpveUxqQXNJbU5vYjJ0bFgzUnZJam94Tmk0d0xDSmpkWE4wYjIxZlkyaHZhMlVpT21aaGJITmxMQ0prWld4aGVTSTZabUZzYzJVc0ltUmxiR0Y1WHpFaU9qQXVNQ3dpWkdWc1lYbGZNaUk2TUM0d0xDSmtaV3hoZVY4eklqb3dMakFzSW1SbGJHRjVYelFpT2pBdU1Dd2laR1ZzWVhsZk5TSTZNQzR3TENKa1pXeGhlVjgySWpvd0xqQXNJbVJsYkdGNVgyTjFjM1J2YlY5emJHbGtaWEp6SWpveUxqQXNJbVJsYkdGNVgyUmxabUYxYkhRaU9qQXVNQ3dpWkdWc1lYbGZiRzluYVdNaU9pSkVaV1poZFd4MElpd2laR1ZzWVhsZmJXVjBhRzlrSWpvaVJHVm1ZWFZzZENJc0ltUmxiR0Y1WDNKaGJtUnZiVjl0WVhnaU9qQXVNQ3dpWkdWc1lYbGZjbUZ1Wkc5dFgyMXBiaUk2TUM0d0xDSm1jbTl0WDJ4cGJXbDBJam8yTUM0d0xDSnNaV1owWDJ4cGJXbDBJam8yTUM0d0xDSnNhVzFwZEY5dGIyUmxJam9pVTNSaGRHbGpJaXdpYldGNElqb3dMakFzSW0xaGVHbHRkVzFmYkdsdGFYUWlPall3TGpBc0ltMXBiaUk2TUM0d0xDSnRhVzVwYlhWdFgyeHBiV2wwSWpvMk1DNHdMQ0p0YjJSbElqb2lVM1JoZEdsaklpd2liVzlrWlY5eVlXNWtiMjBpT2pRdU1Dd2liVzlrWlY5MGFXTnJjeUk2TkM0d0xDSnRiMlJwWm1sbGNpSTZJa0p2WW5Kdklpd2liVzlrYVdacFpYSmZZM1Z6ZEc5dFgzTnNhV1JsY25NaU9qSXVNQ3dpYlc5a2FXWnBaWEpmYlc5a1pTSTZJa1JsWm1GMWJIUWlMQ0p0YjJScFptbGxjbDl2Wm1aelpYUWlPaTAxTGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk1TSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpJaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh6SWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZOQ0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6VWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4Mklqb3dMakFzSW05bVpuTmxkQ0k2TVRnd0xqQXNJbkpoYm1SdmJXbDZaU0k2Wm1Gc2MyVXNJbkpwWjJoMFgyeHBiV2wwSWpvMk1DNHdMQ0p6WWw5emNHVmxaQ0k2TVM0d0xDSnphVzVsZDJGMlpWOXpjR1ZsWkNJNk5TNHdMQ0owYjE5c2FXMXBkQ0k2TmpBdU1Dd2llV0YzWDJ4bFpuUWlPakF1TUN3aWVXRjNYMjF2WkdVaU9qRXVNQ3dpZVdGM1gzSnBaMmgwSWpvd0xqQjlmU3dpVW5WdWJtbHVaeUk2ZXlKRFZDSTZleUppYjJSNVgyWnlaV1Z6ZEdGdVpHbHVaeUk2SWs5bVppSXNJbUp2WkhsZmVXRjNJanAwY25WbExDSmliMlI1WDNsaGQxOXZjSFJwYjI1eklqcGJJa3BwZEhSbGNpSXNJbjRpWFN3aVkyaHZhMlVpT2lKRVpXWmhkV3gwSWl3aVkyaHZhMlV4WHpFaU9qZ3VNQ3dpWTJodmEyVXhYeklpT2pJeUxqQXNJbU5vYjJ0bE1WOHpJam94TUM0d0xDSmphRzlyWlRGZk5DSTZNaTR3TENKamFHOXJaVEZmTlNJNk5TNHdMQ0pqYUc5clpURmZOaUk2TVRVdU1Dd2lZMmh2YTJWZlpuSnZiU0k2TVRZdU1Dd2lZMmh2YTJWZmJXVjBhRzlrSWpvaVVtRnVaRzl0SWl3aVkyaHZhMlZmYzJ4cFpHVnlJam94Tmk0d0xDSmphRzlyWlY5emJHbGtaWEp6SWpvMkxqQXNJbU5vYjJ0bFgzUnZJam94Tmk0d0xDSmpkWE4wYjIxZlkyaHZhMlVpT21aaGJITmxMQ0prWld4aGVTSTZkSEoxWlN3aVpHVnNZWGxmTVNJNk1pNHdMQ0prWld4aGVWOHlJam94TGpBc0ltUmxiR0Y1WHpNaU9qRXVNQ3dpWkdWc1lYbGZOQ0k2TVM0d0xDSmtaV3hoZVY4MUlqb3lMakFzSW1SbGJHRjVYellpT2pJdU1Dd2laR1ZzWVhsZlkzVnpkRzl0WDNOc2FXUmxjbk1pT2pJdU1Dd2laR1ZzWVhsZlpHVm1ZWFZzZENJNk55NHdMQ0prWld4aGVWOXNiMmRwWXlJNklrUmxabUYxYkhRaUxDSmtaV3hoZVY5dFpYUm9iMlFpT2lKRVpXWmhkV3gwSWl3aVpHVnNZWGxmY21GdVpHOXRYMjFoZUNJNk1pNHdMQ0prWld4aGVWOXlZVzVrYjIxZmJXbHVJam95TGpBc0ltWnliMjFmYkdsdGFYUWlPall3TGpBc0lteGxablJmYkdsdGFYUWlPall3TGpBc0lteHBiV2wwWDIxdlpHVWlPaUpUZEdGMGFXTWlMQ0p0WVhnaU9qQXVNQ3dpYldGNGFXMTFiVjlzYVcxcGRDSTZOakF1TUN3aWJXbHVJam93TGpBc0ltMXBibWx0ZFcxZmJHbHRhWFFpT2pZd0xqQXNJbTF2WkdVaU9pSlRkR0YwYVdNaUxDSnRiMlJsWDNKaGJtUnZiU0k2TkM0d0xDSnRiMlJsWDNScFkydHpJam8wTGpBc0ltMXZaR2xtYVdWeUlqb2lRbTlpY204aUxDSnRiMlJwWm1sbGNsOWpkWE4wYjIxZmMyeHBaR1Z5Y3lJNk1pNHdMQ0p0YjJScFptbGxjbDl0YjJSbElqb2lSR1ZtWVhWc2RDSXNJbTF2WkdsbWFXVnlYMjltWm5ObGRDSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpFaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh5SWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZNeUk2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6UWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4MUlqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTmlJNk1DNHdMQ0p2Wm1aelpYUWlPakF1TUN3aWNtRnVaRzl0YVhwbElqcG1ZV3h6WlN3aWNtbG5hSFJmYkdsdGFYUWlPall3TGpBc0luTmlYM053WldWa0lqb3hMakFzSW5OcGJtVjNZWFpsWDNOd1pXVmtJam8xTGpBc0luUnZYMnhwYldsMElqbzJNQzR3TENKNVlYZGZiR1ZtZENJNkxUSTJMakFzSW5saGQxOXRiMlJsSWpveUxqQXNJbmxoZDE5eWFXZG9kQ0k2TkRFdU1IMHNJbFFpT25zaVltOWtlVjltY21WbGMzUmhibVJwYm1jaU9pSlBabVlpTENKaWIyUjVYM2xoZHlJNmRISjFaU3dpWW05a2VWOTVZWGRmYjNCMGFXOXVjeUk2V3lKS2FYUjBaWElpTENKK0lsMHNJbU5vYjJ0bElqb2lSR1ZtWVhWc2RDSXNJbU5vYjJ0bE1WOHhJam80TGpBc0ltTm9iMnRsTVY4eUlqb3lNaTR3TENKamFHOXJaVEZmTXlJNk1UQXVNQ3dpWTJodmEyVXhYelFpT2pJdU1Dd2lZMmh2YTJVeFh6VWlPalV1TUN3aVkyaHZhMlV4WHpZaU9qRTFMakFzSW1Ob2IydGxYMlp5YjIwaU9qRTJMakFzSW1Ob2IydGxYMjFsZEdodlpDSTZJbEpoYm1SdmJTSXNJbU5vYjJ0bFgzTnNhV1JsY2lJNk1UWXVNQ3dpWTJodmEyVmZjMnhwWkdWeWN5STZOaTR3TENKamFHOXJaVjkwYnlJNk1UWXVNQ3dpWTNWemRHOXRYMk5vYjJ0bElqcG1ZV3h6WlN3aVpHVnNZWGtpT25SeWRXVXNJbVJsYkdGNVh6RWlPakl1TUN3aVpHVnNZWGxmTWlJNk1DNHdMQ0prWld4aGVWOHpJam93TGpBc0ltUmxiR0Y1WHpRaU9qQXVNQ3dpWkdWc1lYbGZOU0k2TWk0d0xDSmtaV3hoZVY4Mklqb3lMakFzSW1SbGJHRjVYMk4xYzNSdmJWOXpiR2xrWlhKeklqb3lMakFzSW1SbGJHRjVYMlJsWm1GMWJIUWlPamd1TUN3aVpHVnNZWGxmYkc5bmFXTWlPaUpFWldaaGRXeDBJaXdpWkdWc1lYbGZiV1YwYUc5a0lqb2lSR1ZtWVhWc2RDSXNJbVJsYkdGNVgzSmhibVJ2YlY5dFlYZ2lPakl1TUN3aVpHVnNZWGxmY21GdVpHOXRYMjFwYmlJNk1pNHdMQ0ptY205dFgyeHBiV2wwSWpvMk1DNHdMQ0pzWldaMFgyeHBiV2wwSWpvMk1DNHdMQ0pzYVcxcGRGOXRiMlJsSWpvaVUzUmhkR2xqSWl3aWJXRjRJam93TGpBc0ltMWhlR2x0ZFcxZmJHbHRhWFFpT2pZd0xqQXNJbTFwYmlJNk1DNHdMQ0p0YVc1cGJYVnRYMnhwYldsMElqbzJNQzR3TENKdGIyUmxJam9pVTNSaGRHbGpJaXdpYlc5a1pWOXlZVzVrYjIwaU9qUXVNQ3dpYlc5a1pWOTBhV05yY3lJNk5DNHdMQ0p0YjJScFptbGxjaUk2SWtKdlluSnZJaXdpYlc5a2FXWnBaWEpmWTNWemRHOXRYM05zYVdSbGNuTWlPakl1TUN3aWJXOWthV1pwWlhKZmJXOWtaU0k2SWtSbFptRjFiSFFpTENKdGIyUnBabWxsY2w5dlptWnpaWFFpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxOHhJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk1pSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpNaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTgwSWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZOU0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6WWlPakF1TUN3aWIyWm1jMlYwSWpvd0xqQXNJbkpoYm1SdmJXbDZaU0k2Wm1Gc2MyVXNJbkpwWjJoMFgyeHBiV2wwSWpvMk1DNHdMQ0p6WWw5emNHVmxaQ0k2TVM0d0xDSnphVzVsZDJGMlpWOXpjR1ZsWkNJNk5TNHdMQ0owYjE5c2FXMXBkQ0k2TmpBdU1Dd2llV0YzWDJ4bFpuUWlPaTB5Tmk0d0xDSjVZWGRmYlc5a1pTSTZNaTR3TENKNVlYZGZjbWxuYUhRaU9qUXhMakI5ZlN3aVUyeHZkMmx1WnlJNmV5SkRWQ0k2ZXlKaWIyUjVYMlp5WldWemRHRnVaR2x1WnlJNklrOW1aaUlzSW1KdlpIbGZlV0YzSWpwMGNuVmxMQ0ppYjJSNVgzbGhkMTl2Y0hScGIyNXpJanBiSWtwcGRIUmxjaUlzSW40aVhTd2lZMmh2YTJVaU9pSkVaV1poZFd4MElpd2lZMmh2YTJVeFh6RWlPakl1TUN3aVkyaHZhMlV4WHpJaU9qSXVNQ3dpWTJodmEyVXhYek1pT2pJdU1Dd2lZMmh2YTJVeFh6UWlPakl1TUN3aVkyaHZhMlV4WHpVaU9qSXVNQ3dpWTJodmEyVXhYellpT2pJdU1Dd2lZMmh2YTJWZlpuSnZiU0k2TVRZdU1Dd2lZMmh2YTJWZmJXVjBhRzlrSWpvaVVtRnVaRzl0SWl3aVkyaHZhMlZmYzJ4cFpHVnlJam94Tmk0d0xDSmphRzlyWlY5emJHbGtaWEp6SWpveUxqQXNJbU5vYjJ0bFgzUnZJam94Tmk0d0xDSmpkWE4wYjIxZlkyaHZhMlVpT21aaGJITmxMQ0prWld4aGVTSTZkSEoxWlN3aVpHVnNZWGxmTVNJNk15NHdMQ0prWld4aGVWOHlJam93TGpBc0ltUmxiR0Y1WHpNaU9qQXVNQ3dpWkdWc1lYbGZOQ0k2TUM0d0xDSmtaV3hoZVY4MUlqbzJMakFzSW1SbGJHRjVYellpT2pndU1Dd2laR1ZzWVhsZlkzVnpkRzl0WDNOc2FXUmxjbk1pT2pZdU1Dd2laR1ZzWVhsZlpHVm1ZWFZzZENJNk1pNHdMQ0prWld4aGVWOXNiMmRwWXlJNklrUmxabUYxYkhRaUxDSmtaV3hoZVY5dFpYUm9iMlFpT2lKRGRYTjBiMjBpTENKa1pXeGhlVjl5WVc1a2IyMWZiV0Y0SWpveUxqQXNJbVJsYkdGNVgzSmhibVJ2YlY5dGFXNGlPakl1TUN3aVpuSnZiVjlzYVcxcGRDSTZOakF1TUN3aWJHVm1kRjlzYVcxcGRDSTZOakF1TUN3aWJHbHRhWFJmYlc5a1pTSTZJbE4wWVhScFl5SXNJbTFoZUNJNk1DNHdMQ0p0WVhocGJYVnRYMnhwYldsMElqbzJNQzR3TENKdGFXNGlPakF1TUN3aWJXbHVhVzExYlY5c2FXMXBkQ0k2TmpBdU1Dd2liVzlrWlNJNklsTjBZWFJwWXlJc0ltMXZaR1ZmY21GdVpHOXRJam8wTGpBc0ltMXZaR1ZmZEdsamEzTWlPalF1TUN3aWJXOWthV1pwWlhJaU9pSkNiMkp5YnlJc0ltMXZaR2xtYVdWeVgyTjFjM1J2YlY5emJHbGtaWEp6SWpvMUxqQXNJbTF2WkdsbWFXVnlYMjF2WkdVaU9pSkRkWE4wYjIwaUxDSnRiMlJwWm1sbGNsOXZabVp6WlhRaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh4SWpvdE1USXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh5SWpveE55NHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYek1pT2kwek9TNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYelFpT2kwMU1TNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYelVpT2pRd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZOaUk2TUM0d0xDSnZabVp6WlhRaU9qQXVNQ3dpY21GdVpHOXRhWHBsSWpwMGNuVmxMQ0p5YVdkb2RGOXNhVzFwZENJNk5qQXVNQ3dpYzJKZmMzQmxaV1FpT2pFdU1Dd2ljMmx1WlhkaGRtVmZjM0JsWldRaU9qVXVNQ3dpZEc5ZmJHbHRhWFFpT2pZd0xqQXNJbmxoZDE5c1pXWjBJam90TWpjdU1Dd2llV0YzWDIxdlpHVWlPakV1TUN3aWVXRjNYM0pwWjJoMElqb3pPQzR3ZlN3aVZDSTZleUppYjJSNVgyWnlaV1Z6ZEdGdVpHbHVaeUk2SWs5bVppSXNJbUp2WkhsZmVXRjNJanAwY25WbExDSmliMlI1WDNsaGQxOXZjSFJwYjI1eklqcGJJa3BwZEhSbGNpSXNJbjRpWFN3aVkyaHZhMlVpT2lKRVpXWmhkV3gwSWl3aVkyaHZhMlV4WHpFaU9qSXVNQ3dpWTJodmEyVXhYeklpT2pJdU1Dd2lZMmh2YTJVeFh6TWlPakl1TUN3aVkyaHZhMlV4WHpRaU9qSXVNQ3dpWTJodmEyVXhYelVpT2pJdU1Dd2lZMmh2YTJVeFh6WWlPakl1TUN3aVkyaHZhMlZmWm5KdmJTSTZNVFl1TUN3aVkyaHZhMlZmYldWMGFHOWtJam9pVW1GdVpHOXRJaXdpWTJodmEyVmZjMnhwWkdWeUlqb3hOaTR3TENKamFHOXJaVjl6Ykdsa1pYSnpJam95TGpBc0ltTm9iMnRsWDNSdklqb3hOaTR3TENKamRYTjBiMjFmWTJodmEyVWlPbVpoYkhObExDSmtaV3hoZVNJNmRISjFaU3dpWkdWc1lYbGZNU0k2TXk0d0xDSmtaV3hoZVY4eUlqb3dMakFzSW1SbGJHRjVYek1pT2pBdU1Dd2laR1ZzWVhsZk5DSTZNQzR3TENKa1pXeGhlVjgxSWpvMkxqQXNJbVJsYkdGNVh6WWlPamd1TUN3aVpHVnNZWGxmWTNWemRHOXRYM05zYVdSbGNuTWlPall1TUN3aVpHVnNZWGxmWkdWbVlYVnNkQ0k2TWk0d0xDSmtaV3hoZVY5c2IyZHBZeUk2SWtSbFptRjFiSFFpTENKa1pXeGhlVjl0WlhSb2IyUWlPaUpEZFhOMGIyMGlMQ0prWld4aGVWOXlZVzVrYjIxZmJXRjRJam95TGpBc0ltUmxiR0Y1WDNKaGJtUnZiVjl0YVc0aU9qSXVNQ3dpWm5KdmJWOXNhVzFwZENJNk5qQXVNQ3dpYkdWbWRGOXNhVzFwZENJNk5qQXVNQ3dpYkdsdGFYUmZiVzlrWlNJNklsTjBZWFJwWXlJc0ltMWhlQ0k2TUM0d0xDSnRZWGhwYlhWdFgyeHBiV2wwSWpvMk1DNHdMQ0p0YVc0aU9qQXVNQ3dpYldsdWFXMTFiVjlzYVcxcGRDSTZOakF1TUN3aWJXOWtaU0k2SWxOMFlYUnBZeUlzSW0xdlpHVmZjbUZ1Wkc5dElqbzBMakFzSW0xdlpHVmZkR2xqYTNNaU9qUXVNQ3dpYlc5a2FXWnBaWElpT2lKQ2IySnlieUlzSW0xdlpHbG1hV1Z5WDJOMWMzUnZiVjl6Ykdsa1pYSnpJam8xTGpBc0ltMXZaR2xtYVdWeVgyMXZaR1VpT2lKRGRYTjBiMjBpTENKdGIyUnBabWxsY2w5dlptWnpaWFFpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxOHhJam90TVRJdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxOHlJam94Tnk0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6TWlPaTB6T1M0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6UWlPaTAxTVM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6VWlPalF3TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk5pSTZNQzR3TENKdlptWnpaWFFpT2pBdU1Dd2ljbUZ1Wkc5dGFYcGxJanAwY25WbExDSnlhV2RvZEY5c2FXMXBkQ0k2TmpBdU1Dd2ljMkpmYzNCbFpXUWlPakV1TUN3aWMybHVaWGRoZG1WZmMzQmxaV1FpT2pVdU1Dd2lkRzlmYkdsdGFYUWlPall3TGpBc0lubGhkMTlzWldaMElqb3RNamN1TUN3aWVXRjNYMjF2WkdVaU9qRXVNQ3dpZVdGM1gzSnBaMmgwSWpvek9DNHdmWDBzSWxOdVpXRnJhVzVuSWpwN0lrTlVJanA3SW1KdlpIbGZabkpsWlhOMFlXNWthVzVuSWpvaVQyWm1JaXdpWW05a2VWOTVZWGNpT25SeWRXVXNJbUp2WkhsZmVXRjNYMjl3ZEdsdmJuTWlPbHNpU21sMGRHVnlJaXdpZmlKZExDSmphRzlyWlNJNklrUmxabUYxYkhRaUxDSmphRzlyWlRGZk1TSTZPQzR3TENKamFHOXJaVEZmTWlJNk1UZ3VNQ3dpWTJodmEyVXhYek1pT2pjdU1Dd2lZMmh2YTJVeFh6UWlPakUzTGpBc0ltTm9iMnRsTVY4MUlqbzRMakFzSW1Ob2IydGxNVjgySWpvMUxqQXNJbU5vYjJ0bFgyWnliMjBpT2pFMkxqQXNJbU5vYjJ0bFgyMWxkR2h2WkNJNklsTmxjWFZsYm5ScFlXd2lMQ0pqYUc5clpWOXpiR2xrWlhJaU9qRTJMakFzSW1Ob2IydGxYM05zYVdSbGNuTWlPall1TUN3aVkyaHZhMlZmZEc4aU9qRTJMakFzSW1OMWMzUnZiVjlqYUc5clpTSTZabUZzYzJVc0ltUmxiR0Y1SWpwMGNuVmxMQ0prWld4aGVWOHhJam94TVM0d0xDSmtaV3hoZVY4eUlqbzFMakFzSW1SbGJHRjVYek1pT2pFdU1Dd2laR1ZzWVhsZk5DSTZNUzR3TENKa1pXeGhlVjgxSWpveUxqQXNJbVJsYkdGNVh6WWlPakl1TUN3aVpHVnNZWGxmWTNWemRHOXRYM05zYVdSbGNuTWlPakl1TUN3aVpHVnNZWGxmWkdWbVlYVnNkQ0k2Tnk0d0xDSmtaV3hoZVY5c2IyZHBZeUk2SWtSbFptRjFiSFFpTENKa1pXeGhlVjl0WlhSb2IyUWlPaUpEZFhOMGIyMGlMQ0prWld4aGVWOXlZVzVrYjIxZmJXRjRJam8yTGpBc0ltUmxiR0Y1WDNKaGJtUnZiVjl0YVc0aU9qVXVNQ3dpWm5KdmJWOXNhVzFwZENJNk5qQXVNQ3dpYkdWbWRGOXNhVzFwZENJNk5qQXVNQ3dpYkdsdGFYUmZiVzlrWlNJNklsTjBZWFJwWXlJc0ltMWhlQ0k2TFRFekxqQXNJbTFoZUdsdGRXMWZiR2x0YVhRaU9qWXdMakFzSW0xcGJpSTZNVFV1TUN3aWJXbHVhVzExYlY5c2FXMXBkQ0k2TmpBdU1Dd2liVzlrWlNJNklsTjBZWFJwWXlJc0ltMXZaR1ZmY21GdVpHOXRJam8wTGpBc0ltMXZaR1ZmZEdsamEzTWlPakV5TGpBc0ltMXZaR2xtYVdWeUlqb2lNeTFYWVhraUxDSnRiMlJwWm1sbGNsOWpkWE4wYjIxZmMyeHBaR1Z5Y3lJNk5pNHdMQ0p0YjJScFptbGxjbDl0YjJSbElqb2lSR1ZtWVhWc2RDSXNJbTF2WkdsbWFXVnlYMjltWm5ObGRDSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpFaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh5SWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZNeUk2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6UWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4MUlqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTmlJNkxURTJMakFzSW05bVpuTmxkQ0k2TUM0d0xDSnlZVzVrYjIxcGVtVWlPblJ5ZFdVc0luSnBaMmgwWDJ4cGJXbDBJam8yTUM0d0xDSnpZbDl6Y0dWbFpDSTZNVEV1TUN3aWMybHVaWGRoZG1WZmMzQmxaV1FpT2pVdU1Dd2lkRzlmYkdsdGFYUWlPalE0TGpBc0lubGhkMTlzWldaMElqb3RNakl1TUN3aWVXRjNYMjF2WkdVaU9qSXVNQ3dpZVdGM1gzSnBaMmgwSWpvek9TNHdmU3dpVkNJNmV5SmliMlI1WDJaeVpXVnpkR0Z1WkdsdVp5STZJazltWmlJc0ltSnZaSGxmZVdGM0lqcDBjblZsTENKaWIyUjVYM2xoZDE5dmNIUnBiMjV6SWpwYklrcHBkSFJsY2lJc0luNGlYU3dpWTJodmEyVWlPaUpFWldaaGRXeDBJaXdpWTJodmEyVXhYekVpT2pndU1Dd2lZMmh2YTJVeFh6SWlPakU0TGpBc0ltTm9iMnRsTVY4eklqbzNMakFzSW1Ob2IydGxNVjgwSWpveE55NHdMQ0pqYUc5clpURmZOU0k2T0M0d0xDSmphRzlyWlRGZk5pSTZOUzR3TENKamFHOXJaVjltY205dElqb3hOaTR3TENKamFHOXJaVjl0WlhSb2IyUWlPaUpUWlhGMVpXNTBhV0ZzSWl3aVkyaHZhMlZmYzJ4cFpHVnlJam94Tmk0d0xDSmphRzlyWlY5emJHbGtaWEp6SWpvMkxqQXNJbU5vYjJ0bFgzUnZJam94Tmk0d0xDSmpkWE4wYjIxZlkyaHZhMlVpT21aaGJITmxMQ0prWld4aGVTSTZkSEoxWlN3aVpHVnNZWGxmTVNJNk1URXVNQ3dpWkdWc1lYbGZNaUk2TlM0d0xDSmtaV3hoZVY4eklqb3dMakFzSW1SbGJHRjVYelFpT2pBdU1Dd2laR1ZzWVhsZk5TSTZNaTR3TENKa1pXeGhlVjgySWpveUxqQXNJbVJsYkdGNVgyTjFjM1J2YlY5emJHbGtaWEp6SWpveUxqQXNJbVJsYkdGNVgyUmxabUYxYkhRaU9qY3VNQ3dpWkdWc1lYbGZiRzluYVdNaU9pSkVaV1poZFd4MElpd2laR1ZzWVhsZmJXVjBhRzlrSWpvaVEzVnpkRzl0SWl3aVpHVnNZWGxmY21GdVpHOXRYMjFoZUNJNk5pNHdMQ0prWld4aGVWOXlZVzVrYjIxZmJXbHVJam8xTGpBc0ltWnliMjFmYkdsdGFYUWlPall3TGpBc0lteGxablJmYkdsdGFYUWlPall3TGpBc0lteHBiV2wwWDIxdlpHVWlPaUpUZEdGMGFXTWlMQ0p0WVhnaU9pMHhNeTR3TENKdFlYaHBiWFZ0WDJ4cGJXbDBJam8yTUM0d0xDSnRhVzRpT2pFMUxqQXNJbTFwYm1sdGRXMWZiR2x0YVhRaU9qWXdMakFzSW0xdlpHVWlPaUpUZEdGMGFXTWlMQ0p0YjJSbFgzSmhibVJ2YlNJNk5DNHdMQ0p0YjJSbFgzUnBZMnR6SWpveE1pNHdMQ0p0YjJScFptbGxjaUk2SWpNdFYyRjVJaXdpYlc5a2FXWnBaWEpmWTNWemRHOXRYM05zYVdSbGNuTWlPall1TUN3aWJXOWthV1pwWlhKZmJXOWtaU0k2SWtSbFptRjFiSFFpTENKdGIyUnBabWxsY2w5dlptWnpaWFFpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxOHhJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk1pSTZNQzR3TENKdGIyUnBabWxsY2w5emJHbGtaWEp6WHpNaU9qQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTgwSWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZOU0k2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6WWlPaTB4Tmk0d0xDSnZabVp6WlhRaU9qQXVNQ3dpY21GdVpHOXRhWHBsSWpwMGNuVmxMQ0p5YVdkb2RGOXNhVzFwZENJNk5qQXVNQ3dpYzJKZmMzQmxaV1FpT2pFeExqQXNJbk5wYm1WM1lYWmxYM053WldWa0lqbzFMakFzSW5SdlgyeHBiV2wwSWpvME9DNHdMQ0o1WVhkZmJHVm1kQ0k2TFRJeUxqQXNJbmxoZDE5dGIyUmxJam95TGpBc0lubGhkMTl5YVdkb2RDSTZNemt1TUgxOUxDSlRkR0Z1WkdsdVp5STZleUpEVkNJNmV5SmliMlI1WDJaeVpXVnpkR0Z1WkdsdVp5STZJazltWmlJc0ltSnZaSGxmZVdGM0lqcDBjblZsTENKaWIyUjVYM2xoZDE5dmNIUnBiMjV6SWpwYklrcHBkSFJsY2lJc0luNGlYU3dpWTJodmEyVWlPaUpFWldaaGRXeDBJaXdpWTJodmEyVXhYekVpT2pJdU1Dd2lZMmh2YTJVeFh6SWlPakl1TUN3aVkyaHZhMlV4WHpNaU9qSXVNQ3dpWTJodmEyVXhYelFpT2pJdU1Dd2lZMmh2YTJVeFh6VWlPakl1TUN3aVkyaHZhMlV4WHpZaU9qSXVNQ3dpWTJodmEyVmZabkp2YlNJNk1UWXVNQ3dpWTJodmEyVmZiV1YwYUc5a0lqb2lVbUZ1Wkc5dElpd2lZMmh2YTJWZmMyeHBaR1Z5SWpveE5pNHdMQ0pqYUc5clpWOXpiR2xrWlhKeklqb3lMakFzSW1Ob2IydGxYM1J2SWpveE5pNHdMQ0pqZFhOMGIyMWZZMmh2YTJVaU9tWmhiSE5sTENKa1pXeGhlU0k2ZEhKMVpTd2laR1ZzWVhsZk1TSTZOUzR3TENKa1pXeGhlVjh5SWpvd0xqQXNJbVJsYkdGNVh6TWlPakF1TUN3aVpHVnNZWGxmTkNJNk1DNHdMQ0prWld4aGVWODFJam96TGpBc0ltUmxiR0Y1WHpZaU9qSXVNQ3dpWkdWc1lYbGZZM1Z6ZEc5dFgzTnNhV1JsY25NaU9qVXVNQ3dpWkdWc1lYbGZaR1ZtWVhWc2RDSTZOaTR3TENKa1pXeGhlVjlzYjJkcFl5STZJa1JsWm1GMWJIUWlMQ0prWld4aGVWOXRaWFJvYjJRaU9pSkVaV1poZFd4MElpd2laR1ZzWVhsZmNtRnVaRzl0WDIxaGVDSTZNaTR3TENKa1pXeGhlVjl5WVc1a2IyMWZiV2x1SWpveUxqQXNJbVp5YjIxZmJHbHRhWFFpT2pZd0xqQXNJbXhsWm5SZmJHbHRhWFFpT2pZd0xqQXNJbXhwYldsMFgyMXZaR1VpT2lKVGRHRjBhV01pTENKdFlYZ2lPakF1TUN3aWJXRjRhVzExYlY5c2FXMXBkQ0k2TmpBdU1Dd2liV2x1SWpvd0xqQXNJbTFwYm1sdGRXMWZiR2x0YVhRaU9qWXdMakFzSW0xdlpHVWlPaUpUZEdGMGFXTWlMQ0p0YjJSbFgzSmhibVJ2YlNJNk5DNHdMQ0p0YjJSbFgzUnBZMnR6SWpvMExqQXNJbTF2WkdsbWFXVnlJam9pUkdsellXSnNaV1FpTENKdGIyUnBabWxsY2w5amRYTjBiMjFmYzJ4cFpHVnljeUk2TWk0d0xDSnRiMlJwWm1sbGNsOXRiMlJsSWpvaVJHVm1ZWFZzZENJc0ltMXZaR2xtYVdWeVgyOW1abk5sZENJNk5UQXVNQ3dpYlc5a2FXWnBaWEpmYzJ4cFpHVnljMTh4SWpvd0xqQXNJbTF2WkdsbWFXVnlYM05zYVdSbGNuTmZNaUk2TUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6TWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4MElqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTlNJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYellpT2pBdU1Dd2liMlptYzJWMElqb3dMakFzSW5KaGJtUnZiV2w2WlNJNlptRnNjMlVzSW5KcFoyaDBYMnhwYldsMElqbzJNQzR3TENKellsOXpjR1ZsWkNJNk1TNHdMQ0p6YVc1bGQyRjJaVjl6Y0dWbFpDSTZOUzR3TENKMGIxOXNhVzFwZENJNk5qQXVNQ3dpZVdGM1gyeGxablFpT2kweU1pNHdMQ0o1WVhkZmJXOWtaU0k2TWk0d0xDSjVZWGRmY21sbmFIUWlPalEyTGpCOUxDSlVJanA3SW1KdlpIbGZabkpsWlhOMFlXNWthVzVuSWpvaVQyWm1JaXdpWW05a2VWOTVZWGNpT25SeWRXVXNJbUp2WkhsZmVXRjNYMjl3ZEdsdmJuTWlPbHNpU21sMGRHVnlJaXdpZmlKZExDSmphRzlyWlNJNklrUmxabUYxYkhRaUxDSmphRzlyWlRGZk1TSTZNaTR3TENKamFHOXJaVEZmTWlJNk1pNHdMQ0pqYUc5clpURmZNeUk2TWk0d0xDSmphRzlyWlRGZk5DSTZNaTR3TENKamFHOXJaVEZmTlNJNk1pNHdMQ0pqYUc5clpURmZOaUk2TWk0d0xDSmphRzlyWlY5bWNtOXRJam94Tmk0d0xDSmphRzlyWlY5dFpYUm9iMlFpT2lKU1lXNWtiMjBpTENKamFHOXJaVjl6Ykdsa1pYSWlPakUyTGpBc0ltTm9iMnRsWDNOc2FXUmxjbk1pT2pJdU1Dd2lZMmh2YTJWZmRHOGlPakUyTGpBc0ltTjFjM1J2YlY5amFHOXJaU0k2Wm1Gc2MyVXNJbVJsYkdGNUlqcDBjblZsTENKa1pXeGhlVjh4SWpvMUxqQXNJbVJsYkdGNVh6SWlPakV1TUN3aVpHVnNZWGxmTXlJNk1TNHdMQ0prWld4aGVWODBJam94TGpBc0ltUmxiR0Y1WHpVaU9qTXVNQ3dpWkdWc1lYbGZOaUk2TWk0d0xDSmtaV3hoZVY5amRYTjBiMjFmYzJ4cFpHVnljeUk2TlM0d0xDSmtaV3hoZVY5a1pXWmhkV3gwSWpvM0xqQXNJbVJsYkdGNVgyeHZaMmxqSWpvaVJHVm1ZWFZzZENJc0ltUmxiR0Y1WDIxbGRHaHZaQ0k2SWtSbFptRjFiSFFpTENKa1pXeGhlVjl5WVc1a2IyMWZiV0Y0SWpveUxqQXNJbVJsYkdGNVgzSmhibVJ2YlY5dGFXNGlPakl1TUN3aVpuSnZiVjlzYVcxcGRDSTZOakF1TUN3aWJHVm1kRjlzYVcxcGRDSTZOakF1TUN3aWJHbHRhWFJmYlc5a1pTSTZJbE4wWVhScFl5SXNJbTFoZUNJNk1DNHdMQ0p0WVhocGJYVnRYMnhwYldsMElqbzJNQzR3TENKdGFXNGlPakF1TUN3aWJXbHVhVzExYlY5c2FXMXBkQ0k2TmpBdU1Dd2liVzlrWlNJNklsTjBZWFJwWXlJc0ltMXZaR1ZmY21GdVpHOXRJam8wTGpBc0ltMXZaR1ZmZEdsamEzTWlPalF1TUN3aWJXOWthV1pwWlhJaU9pSkVhWE5oWW14bFpDSXNJbTF2WkdsbWFXVnlYMk4xYzNSdmJWOXpiR2xrWlhKeklqb3lMakFzSW0xdlpHbG1hV1Z5WDIxdlpHVWlPaUpFWldaaGRXeDBJaXdpYlc5a2FXWnBaWEpmYjJabWMyVjBJam8xTUM0d0xDSnRiMlJwWm1sbGNsOXpiR2xrWlhKelh6RWlPakF1TUN3aWJXOWthV1pwWlhKZmMyeHBaR1Z5YzE4eUlqb3dMakFzSW0xdlpHbG1hV1Z5WDNOc2FXUmxjbk5mTXlJNk1DNHdMQ0p0YjJScFptbGxjbDl6Ykdsa1pYSnpYelFpT2pBdU1Dd2liVzlrYVdacFpYSmZjMnhwWkdWeWMxODFJam93TGpBc0ltMXZaR2xtYVdWeVgzTnNhV1JsY25OZk5pSTZNQzR3TENKdlptWnpaWFFpT2pBdU1Dd2ljbUZ1Wkc5dGFYcGxJanBtWVd4elpTd2ljbWxuYUhSZmJHbHRhWFFpT2pZd0xqQXNJbk5pWDNOd1pXVmtJam94TGpBc0luTnBibVYzWVhabFgzTndaV1ZrSWpvMUxqQXNJblJ2WDJ4cGJXbDBJam8yTUM0d0xDSjVZWGRmYkdWbWRDSTZMVEl5TGpBc0lubGhkMTl0YjJSbElqb3lMakFzSW5saGQxOXlhV2RvZENJNk5EWXVNSDE5ZlN3aVpuSmxaWE4wWVc1a2FXNW5JanA3SW1KdlpIbGZabk1pT25SeWRXVXNJbVJwYzJGaWJHVnljeUk2V3lKK0lsMHNJbkJ5WldabGNsOXRZVzUxWVd3aU9uUnlkV1VzSW5OM2FYUmphQ0k2Wm1Gc2MyVXNJbmxoZDE5dGIyUWlPblJ5ZFdWOWZTd2liV0ZwYmlJNmV5SmhaR1JwZEdsdmJtRnNJanA3SW14bFoybDBYMkZoSWpwN0ltVnVZV0pzWldRaU9tWmhiSE5sTENKdGIyUmxJam9pVEc5allXd2dWbWxsZHlKOUxDSnRZVzUxWVd4ZmVXRjNJanA3SW1sdWRtVnlkR1Z5SWpwMGNuVmxMQ0p6Wld4bFkzUWlPaUpFYVhOaFlteGxaQ0lzSW5OMFlYUnBZeUk2Wm1Gc2MyVjlMQ0p6WVdabFgyaGxZV1FpT25zaWFHVnBaMmgwSWpvMU1DNHdMQ0p6ZEdGMFpYTWlPbHNpV21WMWN5SXNJa3R1YVdabElpd2lmaUpkTENKemQybDBZMmdpT25SeWRXVjlMQ0ozWVhKdGRYQmZZV0VpT25zaWJHVm1kRjk1WVhjaU9pMHpOUzR3TENKd2FYUmphQ0k2SWtScGMyRmliR1ZrSWl3aWNtRnVaMlVpT2pNMk1DNHdMQ0p5YVdkb2RGOTVZWGNpT2pZM0xqQXNJbk5sYkdWamRDSTZJa1JwYzJGaWJHVmtJaXdpYzNCbFpXUWlPakV5T0M0d0xDSjVZWGNpT2lKVGNHbHVJbjE5TENKamIyNW1hV2QxY21VaU9uc2ljM1JoZEdVaU9pSlRkR0Z1WkdsdVp5SXNJblJsWVcwaU9qRXVNSDE5ZlN3aWFXNW1ieUk2ZXlKd2NtVnpaWFJ6SWpwN0lteHBjM1FpT2pVdU1Dd2libUZ0WlNJNkltUnpZV1JoYzJSaGMyUWlmU3dpZDJGMFpYSnRZWEpySWpwN0ltTnZiRzl5SWpwYklrbHVibVZ5SWl3aUl6QXdNREF3TURBd0lpd2lmaUpkTENKamIyeHZjbDh4SWpvaUkwWkdNREF3TUVaR0lpd2lZMjlzYjNKZk1pSTZJaU5HUmtaR1JrWkdSaUlzSW1OdmJHOXlYMjRpT2lJak56TTNNemN6UmtZaUxDSmxabVpsWTNSeklqcGJJbjRpWFN3aVptOXVkQ0k2SWtSbFptRjFiSFFpTENKbmJHbDBZMmdpT21aaGJITmxMQ0p0YjJSbElqcGJNUzR3TERJdU1Dd3pMakFzSW40aVhTd2ljbUZwYm1KdmR5STZabUZzYzJVc0luTndaV1ZrSWpvMExqQXNJblJsZUhRaU9pSnNZMkp2ZVhNdVkyOXRJbjE5TENKdGFYTmpJanA3SW1GcGJXSnZkQ0k2ZXlKbVlXdGxaSFZqYXlJNmV5Sm1jbVZsZW1WZmNHVnlhVzlrSWpwMGNuVmxMQ0oxYm14dlkyc2lPblJ5ZFdWOUxDSm5jbVZ1WVdSbFgzSmxiR1ZoYzJVaU9uc2lZMjlzYkdsemFXOXVYMmx1Wm04aU9tWmhiSE5sTENKa1lXMWhaMlVpT2pBdU1Dd2liVzlzYkhsZlpHbHpkR0Z1WTJVaU9qRXdNQzR3TENKemQybDBZMmdpT21aaGJITmxmU3dpYkdGMFpXNWplU0k2ZXlKemQybDBZMmdpT25SeWRXVjlMQ0pzYjJkbmFXNW5JanA3SW1OdmJHOXljeUk2ZXlKb2FYUWlPaUlqT1VVNVJUbEZSa1lpTENKdGFYTnpJam9pSXpsRk9VVTVSVVpHSW4wc0ltTjFjM1J2YldsNllYUnBiMjRpT25zaWNISmxabWw0SWpvaUluMHNJbTF2WkdVaU9uc2ljMlZzWldOMElqcGJJa0ZwYldKdmRDSXNJbjRpWFgwc0luTjNhWFJqYUNJNmRISjFaWDE5TENKdGIzWmxiV1Z1ZENJNmV5SmhkWFJ2YzNkcGRHTm9JanA3SW1ScGMzUmhibU5sWDNOc2FXUmxjaUk2TlRBd0xqQXNJbk4zYVhSamFDSTZabUZzYzJVc0luUnlhV2RuWlhKeklqcGJJbjRpWFN3aWQyVmhjRzl1WDNObGJHVmpkQ0k2SW5Oelp6QTRJbjBzSW1Wa1oyVmZjWFZwWTJ0ZmMzUnZjQ0k2Wm1Gc2MyVXNJbVpoYkd4ZlpHRnRZV2RsSWpwMGNuVmxMQ0ptWVhOMFgyeGhaR1JsY2lJNmRISjFaWDBzSW5Cc1lYbGxjbDloYm1sdFlYUnBiMjV6SWpwN0ltWmhiR3hwYm1jaU9uc2lkbUZzZFdVaU9qQXVNSDBzSW1sdWRHVnljRzlzWVhScGIyNGlPamt1TUN3aWFtbDBkR1Z5WDJ4bFozTWlPbnNpWm5KdmJTSTZNQzR3TENKemQybDBZMmdpT25SeWRXVXNJblJ2SWpvMU1DNHdmU3dpYkdWaGJtbHVaeUk2ZXlKMllXeDFaU0k2TVRBd0xqQjlmWDBzSW5acGMzVmhiSE1pT25zaVlXUmtiMjV6SWpwYklsSmxiVzkyWlNCVGJHVmxkbVZ6SWl3aVMyVmxjQ0JOYjJSbGJDQlVjbUZ1YzNCaGNtVnVZM2tpTENKK0lsMHNJbUZ6Y0dWamRGOXlZWFJwYnlJNmV5SnpkMmwwWTJnaU9uUnlkV1VzSW5aaGJIVmxJam94TXpNdU1IMHNJbVJoYldGblpWOXBibVJwWTJGMGIzSWlPbnNpYldsdVgyOXViSGtpT21aaGJITmxMQ0p6ZDJsMFkyZ2lPbVpoYkhObGZTd2lhR2wwYldGeWEyVnlJanA3SW1OdmJHOXlJanBiSWpKRUlpd2lJMFpHUmtaR1JrWkdJaXdpZmlKZExDSnpaV3hsWTNRaU9sc2lNa1FpTENJelJDSXNJbjRpWFN3aWRHbHRaU0k2TVRBdU1IMHNJbTFoYm5WaGJGOWhjbkp2ZDNNaU9uc2lZMjlzYjNJaU9pSWpSa1pHUmtaR1JrWWlMQ0ptYjI1MElqb2lSR1ZtWVhWc2RDSXNJbTltWm5ObGRDSTZNelV1TUN3aWMzZHBkR05vSWpwbVlXeHpaU3dpYzNsdFltOXNjeUk2ZXlKbWIzSjNZWEprSWpvaVhpSXNJbXhsWm5RaU9pSThJaXdpY21sbmFIUWlPaUkrSW4xOUxDSnpZMjl3WlY5dmRtVnliR0Y1SWpwN0ltRnVhVzFoZEdsdmJpSTZkSEoxWlN3aVkyOXNiM0p6SWpwN0ltVmtaMlVpT2lJak1EQXdNREF3TURBaUxDSnRZV2x1SWpvaUl6WXdOakEyTUVaR0luMHNJbWRoY0NJNk5TNHdMQ0pzWlc1bmRHZ2lPakk0T0M0d0xDSnZjSFJwYjI1eklqcGJJbjRpWFN3aWMzZHBkR05vSWpwMGNuVmxmU3dpYzJ0bFpYUmZhVzVrYVdOaGRHOXljeUk2ZXlKaWIyMWlJanAwY25WbExDSm1aV0YwZFhKbGN5STZXeUpHYjNKalpTQnpZV1psSUhCdmFXNTBJaXdpUm05eVkyVWdZbTlrZVNCaGFXMGlMQ0pRYVc1bklITndhV3RsSWl3aVJHOTFZbXhsSUhSaGNDSXNJa1IxWTJzZ2NHVmxheUJoYzNOcGMzUWlMQ0pHY21WbGMzUmhibVJwYm1jaUxDSlBiaUJ6YUc5MElHRnVkR2t0WVdsdElpd2lUV2x1YVcxMWJTQmtZVzFoWjJVZ2IzWmxjbkpwWkdVaUxDSitJbDBzSW5OM2FYUmphQ0k2Wm1Gc2MyVjlMQ0p6YTNsaWIzZ2lPaUpPYVdkb2RDSXNJblpsYkc5amFYUjVYM2RoY201cGJtY2lPbnNpWTI5c2IzSWlPaUlqUmtaR1JrWkdSa1lpTENKemQybDBZMmdpT21aaGJITmxmU3dpZG1sbGQyMXZaR1ZzWDJOb1lXNW5aWElpT25zaVptOTJJam8yT0RBdU1Dd2liR1ZtZENJNlptRnNjMlVzSW5OM2FYUmphQ0k2ZEhKMVpTd2llQ0k2TFRZdU1Dd2llU0k2TFRrdU1Dd2llaUk2TVRBdU1IMTlmUT09IiwibmFtZSI6ImRzYWRhc2Rhc2QiLCJ0aW1lIjoxNzc0ODA2MDE2LjB9",
				name = "DELAYED777"
			}
		}
		local t98 = {
			pui.string("\a{Small Text}•\r  Delay"),
			pui.string("\a{Small Text}•\r  Meta"),
			pui.string("\a{Small Text}•\r  MetaLc")
		}
		local s7 = "\a{Small Text}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

		function t8.save_database()
			-- upvalues: s6 (copy), v153 (copy)
			db[s6] = v153
		end

		for _, v in pairs(t97) do
			if not v153[v.name] then
				v153[v.name] = v.data
			end
		end

		for _, v in pairs(t98) do
			if v153[v] then
				v153[v] = nil
			end
		end

		local function v161(p61)
			-- upvalues: base64 (copy)
			return base64.encode(json.stringify(p61))
		end
		local function v162(p62)
			-- upvalues: base64 (copy)
			return json.parse(base64.decode(p62))
		end
		local function v163(p63, p64)
			-- upvalues: s7 (copy)
			if p63 == s7 then
				error(("u cant %s separator"):format(p64), 2)
			end
		end
		local function v164(p65, p66)
			if p65:gsub(" ", "") == "" then
				error(("u cant %s config with empty name"):format(p66), 2)
			end
		end
		local function v165(p67)
			-- upvalues: v45 (copy), v153 (copy), v162 (copy), t6 (copy)
			if p67 ~= nil then
				local v421 = v153[p67]

				if v421 ~= nil then
					local v422 = v162(v421)
					local v423 = common.get_date("%m/%d %H:%M", v422.time)

					t6.info.presets.information.creator:name(" \v" .. v422.author .. " ")
					t6.info.presets.information.date:name(" \v" .. v423 .. " ")

					return
				end

				return
			end

			v45("Unable to find preset", true)
		end
		local function v166()
			-- upvalues: t97 (copy), s7 (copy), v153 (copy), t6 (copy), v165 (copy)
			local t99 = {}

			for _, v in pairs(t97) do
				t99[#t99 + 1] = v.name
			end

			t99[#t97 + 1] = s7

			for k, _ in pairs(v153) do
				local v429 = false

				for _, v in ipairs(t99) do
					if v == k then
						v429 = true

						break
					end
				end

				if not v429 then
					t99[#t99 + 1] = k
				end
			end

			t6.info.presets.list:update(t99)

			local list = t6.info.presets.list
			local v433 = list:list()[list:get()]

			if v433 ~= nil then
				local v434 = v433
				local v435 = false

				for _, v in ipairs(t97) do
					if v433 == v.name or v433 == s7 then
						v435 = true

						break
					end
				end

				if v435 then
					v433 = ""
				end

				if v433 ~= "" then
					v165(v434)
				end

				t6.info.presets.name:set(v433)
				t6.info.presets.load:disabled(v434 == s7)
				t6.info.presets.save:disabled(v435)
				t6.info.presets.export:disabled(v435)
				t6.info.presets.delete:disabled(v435)
				t6.info.presets.information.creator_text:visibility(not v435)
				t6.info.presets.information.creator:visibility(not v435)
				t6.info.presets.information.date_text:visibility(not v435)
				t6.info.presets.information.date:visibility(not v435)

				return
			end
		end
		local function v167(p68, p69)
			-- upvalues: v153 (copy), t8 (copy), v166 (copy)
			v153[p68] = p69
			t8.save_database()
			v166()
		end

		t6.info.presets.create:set_callback(function()
			-- upvalues: t6 (copy), v164 (copy), v163 (copy), v153 (copy), v45 (copy), t7 (copy), v161 (copy), pui (copy), v6 (copy), v167 (copy)
			local v440 = t6.info.presets.name:get()

			if v440 == "" then
				v440 = t6.info.presets.list:list()[t6.info.presets.list:get()]
			end

			v164(v440, "create")
			v163(v440, "create")

			if v153[v440] == nil then
				local t100 = {
					name = v440,
					config = v161(pui.save()),
					author = v6,
					time = common.get_unixtime()
				}

				t7.new({
					[1] = "Created preset with name - ",
					[2] = v440
				})
				v167(v440, v161(t100))

				return
			end

			v45("Preset already exists", true)
			t7.new({
				[1] = "Preset already exists"
			})
		end)
		t6.info.presets.load:set_callback(function()
			-- upvalues: t6 (copy), v164 (copy), v163 (copy), v153 (copy), v45 (copy), t7 (copy), v162 (copy), pui (copy)
			local v442 = t6.info.presets.name:get()

			if v442 == "" then
				v442 = t6.info.presets.list:list()[t6.info.presets.list:get()]
			end

			v164(v442, "load")
			v163(v442, "load")

			local v443 = v153[v442]

			if v443 ~= nil then
				local v444 = v162(v443)
				local v445 = v162(v444.config)

				pui.load(v445)
				t7.new({
					[1] = "Loaded ",
					[2] = nil,
					[3] = "'s config - ",
					[2] = v444.author,
					[4] = v442
				})

				return
			end

			v45("Unable to find preset", true)
			t7.new({
				[1] = "Unable to find preset"
			})
		end)
		t6.info.presets.save:set_callback(function()
			-- upvalues: t6 (copy), v164 (copy), v163 (copy), v153 (copy), v45 (copy), t7 (copy), v162 (copy), v161 (copy), pui (copy), v167 (copy)
			local v446 = t6.info.presets.name:get()

			if v446 == "" then
				v446 = t6.info.presets.list:list()[t6.info.presets.list:get()]
			end

			v164(v446, "save")
			v163(v446, "save")

			local v447 = v153[v446]

			if v447 ~= nil then
				local v448 = v162(v447)

				v448.config = v161(pui.save())
				v448.name = v448.name or "undefined"
				v167(v446, v161(v448))
				t7.new({
					[1] = "Overwrote ",
					[2] = nil,
					[3] = "'s config - ",
					[2] = v448.author,
					[4] = v446
				})

				return
			end

			v45("Unable to find preset", true)
			t7.new({
				[1] = "Unable to find preset"
			})
		end)
		t6.info.presets.import:set_callback(function()
			-- upvalues: clipboard (copy), v45 (copy), t7 (copy), v162 (copy), v167 (copy)
			local v449 = clipboard.get():sub(1, 8) == "lcsense_" and clipboard.get():sub(9) or nil

			if v449 ~= nil and v449:gsub(" ", "") ~= "" then
				local v450 = v162(v449)

				v167(v450.name, v449)
				t7.new({
					[1] = "Imported ",
					[2] = nil,
					[3] = "'s config - ",
					[2] = v450.author,
					[4] = v450.name
				})

				return
			end

			v45("Unable to find clipboard data", true)
			t7.new({
				[1] = "Unable to find clipboard data"
			})
		end)
		t6.info.presets.export:set_callback(function()
			-- upvalues: t6 (copy), v164 (copy), v163 (copy), v153 (copy), v45 (copy), t7 (copy), v162 (copy), clipboard (copy)
			local v451 = t6.info.presets.name:get()

			if v451 == "" then
				v451 = t6.info.presets.list:list()[t6.info.presets.list:get()]
			end

			v164(v451, "export")
			v163(v451, "export")

			local v452 = v153[v451]

			if v452 ~= nil then
				local v453 = v162(v452)

				clipboard.set("lcsense_" .. v452)
				t7.new({
					[1] = "Copied ",
					[2] = nil,
					[3] = "'s config - ",
					[2] = v453.author,
					[4] = v451
				})

				return
			end

			v45("Unable to find preset.", true)
			t7.new({
				[1] = "Unable to find preset."
			})
		end)
		t6.info.presets.delete:set_callback(function()
			-- upvalues: t6 (copy)
			t6.info.presets.create:disabled(true)
			t6.info.presets.load:disabled(true)
			t6.info.presets.save:disabled(true)
			t6.info.presets.import:disabled(true)
			t6.info.presets.export:disabled(true)
			t6.info.presets.delete:disabled(true)
			t6.info.presets.list:disabled(true)
			t6.info.presets.delete_confirm:visibility(true)
			t6.info.presets.delete_cancel:visibility(true)
		end)
		t6.info.presets.delete_confirm:set_callback(function()
			-- upvalues: t6 (copy), v164 (copy), v163 (copy), v153 (copy), v167 (copy)
			t6.info.presets.delete:name()

			local v454 = t6.info.presets.name:get()

			if v454 == "" then
				v454 = t6.info.presets.list:list()[t6.info.presets.list:get()]
			end

			v164(v454, "delete")
			v163(v454, "delete")

			if v153[v454] then
				v167(v454, nil)
				t6.info.presets.delete_confirm:visibility(false)
				t6.info.presets.delete_cancel:visibility(false)
				t6.info.presets.create:disabled(false)
				t6.info.presets.load:disabled(false)
				t6.info.presets.save:disabled(false)
				t6.info.presets.import:disabled(false)
				t6.info.presets.export:disabled(false)
				t6.info.presets.delete:disabled(false)
				t6.info.presets.list:disabled(false)

				return
			end
		end)
		t6.info.presets.delete_cancel:set_callback(function()
			-- upvalues: t6 (copy)
			t6.info.presets.create:disabled(false)
			t6.info.presets.load:disabled(false)
			t6.info.presets.save:disabled(false)
			t6.info.presets.import:disabled(false)
			t6.info.presets.export:disabled(false)
			t6.info.presets.delete:disabled(false)
			t6.info.presets.list:disabled(false)
			t6.info.presets.delete_confirm:visibility(false)
			t6.info.presets.delete_cancel:visibility(false)
		end)
		t6.info.presets.list:set_callback(v166, true)
		t6.info.presets.delete_confirm:visibility(false)
		t6.info.presets.delete_cancel:visibility(false)
		t8.save_database()

		local t101 = {
			[1] = 1,
			[2] = 3,
			[3] = 5,
			[4] = 7,
			[5] = 10,
			[6] = 15,
			[7] = 20
		}

		local function v169(p70)
			-- upvalues: t101 (copy)
			local n2 = 1
			local huge = math.huge

			for i = 1, #t101 do
				local v459 = math.abs(p70 - t101[i])

				if v459 < huge then
					n2 = i
					huge = v459
				end
			end

			return n2
		end

		t9.find_closest = v169

		function t9.get_random_tick(p71, p72)
			-- upvalues: v169 (copy), t101 (copy)
			if p71 > 1 and not (p72 <= 0) then
				local v462 = v169(p71)
				local v463 = #t101
				local v464 = math.floor(v463 * p72 / 200 + 0.5)
				local v465 = math.max(1, v462 - v464)
				local v466 = math.min(v463, v462 + v464)

				return t101[math.random(v465, v466)]
			end

			return p71
		end

		t2.is_moving = false
		t2.is_airborne = false
		t2.is_crouched = false
		t2.duck_amount = 0
		t2.team = 0

		function t2.net_update_end()
			-- upvalues: t2 (copy)
			local v467 = entity.get_local_player()

			if v467 ~= nil and v467:is_alive() then
				local v468 = v467:get_anim_state()

				if v468 ~= nil then
					local v469 = v467:get_player_weapon()

					if v469 ~= nil then
						v469:get_weapon_info()

						local m_flDuckAmount = v467.m_flDuckAmount
						local _ = v467.m_fFlags

						t2.velocity = v467.m_vecVelocity:length2d()

						if globals.choked_commands == 0 then
							t2.duck_amount = m_flDuckAmount
						end

						t2.team = v467.m_iTeamNum
						t2.is_moving = not (t2.velocity <= 4)
						t2.is_crouched = not (t2.duck_amount <= 0.45)
						t2.is_airborne = not v468.on_ground or not not v468.landed_on_ground_this_frame

						return
					end

					return
				end

				return
			end
		end
		function t10.get(p73, p74, p75)
			-- upvalues: t6 (copy), t1 (copy)
			if not p74 then
				p74 = false
			end

			if not p75 then
				p75 = false
			end

			local v475 = entity.get_local_player()

			if v475 ~= nil and v475:is_alive() then
				local v476 = v475:get_anim_state()

				if v476 ~= nil then
					local m_flDuckAmount = v475.m_flDuckAmount
					local v478 = v475.m_vecVelocity:length2d()
					local v479 = v476.on_ground and not v476.landed_on_ground_this_frame
					local v480 = v475.m_iTeamNum == 2 and "T" or "CT"
					local v481 = t6.antiaim.angles.builder["Legit AA"][v480]
					local v482 = t6.antiaim.angles.builder.Freestanding[v480]

					if not p73 or not p75 and not v481.allow_state:get() then
						if not t6.antiaim.angles.freestanding.switch:get() or p74 or not v482.allow_state:get() then
							if not v479 then
								return m_flDuckAmount > 0 and "Air Crouching" or "Air"
							end

							if not t1.antiaim.misc.slow_walk:get() then
								if not (v478 < 5) then
									if not (m_flDuckAmount > 0) then
										return "Running"
									end

									return "Sneaking"
								end

								if not (m_flDuckAmount > 0) then
									return "Standing"
								end

								return "Crouching"
							end

							return "Slowing"
						end

						return "Freestanding"
					end

					return "Legit AA"
				end

				return
			end
		end

		local t102 = {
			Right = 90,
			Left = -90,
			Forward = 180
		}

		function t11.think()
			-- upvalues: t6 (copy), t102 (copy)
			local v483 = t6.antiaim.main.additional.manual_yaw.select:get()

			if v483 ~= "Disabled" then
				local v484 = t102[v483]

				if v484 then
					return true, v484
				end

				return false, 0
			end

			return false, 0
		end
		function t11.update(_, p77, _)
			-- upvalues: t11 (copy), t6 (copy)
			local v488, v489 = t11.think()
			local v490 = t6.antiaim.main.additional.manual_yaw.static:get()
			local v491 = t6.antiaim.main.additional.manual_yaw.inverter:get()

			if v488 then
				p77.yaw_offset = v489
				p77.yaw_base = "Local View"

				if v490 then
					p77.yaw_modifier = "Disabled"
					rage.antiaim:inverter(v491)
				end
			end
		end
		function t12.think(_)
			-- upvalues: t6 (copy), t10 (copy)
			local v493 = entity.get_local_player()

			if v493 ~= nil and v493:is_alive() then
				local v494 = v493:get_player_weapon()

				if v494 ~= nil then
					if t6.antiaim.main.additional.safe_head.switch:get() then
						local v495 = entity.get_threat()

						if v495 ~= nil and v495:is_alive() then
							local v496 = v494:get_classname()
							local v497 = v496 == "CKnife"
							local v498 = v496 == "CWeaponTaser"
							local v499 = v493:get_origin() - v495:get_origin()
							local v500 = t6.antiaim.main.additional.safe_head.height:get()

							return {
								["Air Crouch"] = t10.get() == "Air Crouching",
								Zeus = v498,
								Knife = v497,
								["Height Advantage"] = not (v500 > v499.z)
							}
						end

						return
					end

					return
				end

				return
			end
		end
		function t12.update(p80, p81, _)
			-- upvalues: t12 (copy), t6 (copy)
			local v504 = t12.think(p80)

			if v504 ~= nil then
				for k, v in pairs(v504) do
					if t6.antiaim.main.additional.safe_head.states:get(k) and v then
						p81.body_yaw = true
						p81.yaw_offset = 0
						p81.left_limit = 1
						p81.right_limit = 1
						p81.body_yaw_options = {}
						p81.yaw_modifier = "Disabled"
					end
				end

				return
			end
		end

		local n3 = 0

		function t13.think()
			-- upvalues: t6 (copy)
			local v507 = entity.get_local_player()

			if v507 ~= nil and v507:is_alive() then
				local v508 = entity.get_game_rules()

				if v508 ~= nil then
					if t6.antiaim.main.additional.warmup_aa.select:get() ~= "Disabled" then
						local v509 = true

						for i = 1, globals.max_players do
							local v511 = entity.get(i)

							if v511 ~= nil then
								local v512 = v511:get_resource()

								if v512.m_bConnected and v512.m_bConnected == true and v511:is_enemy() and v511:is_alive() then
									v509 = false

									break
								end
							end
						end

						local v513 = v508.m_bWarmupPeriod or (v509 or v508.m_bWarmupPeriod)

						return {
							Warmup = v508.m_bWarmupPeriod,
							["No Enemies"] = v509,
							Force = v513
						}
					end

					return
				end

				return
			end
		end
		function t13.update(_, p84, _)
			-- upvalues: t13 (copy), t6 (copy), n3 (ref)
			local v517 = t13.think()

			if v517 ~= nil then
				local v518 = t6.antiaim.main.additional.warmup_aa.select:get()

				if v518 ~= "Disabled" then
					local v519 = t6.antiaim.main.additional.warmup_aa.yaw:get()
					local v520 = t6.antiaim.main.additional.warmup_aa.range:get()
					local v521 = t6.antiaim.main.additional.warmup_aa.speed:get()
					local v522 = t6.antiaim.main.additional.warmup_aa.left_yaw:get()
					local v523 = t6.antiaim.main.additional.warmup_aa.right_yaw:get()

					if v517[v518] and v518 ~= "Disabled" then
						p84.pitch = t6.antiaim.main.additional.warmup_aa.pitch:get()
						p84.yaw = "Backward"
						p84.yaw_modifier = "Disabled"

						if v519 ~= "L&R" then
							if v519 == "Distortion" then
								if globals.tickcount % v521 == 0 then
									n3 = utils.random_int(-v520, v520)
								end

								p84.yaw_offset = n3
							end

							if v519 == "Spin" then
								p84.yaw_offset = globals.framecount * (v521 * 0.1) % v520
							end

							p84.body_yaw = false
						else
							p84.body_yaw = true
							p84.body_yaw_options = {
								[1] = "Jitter"
							}
							p84.yaw_offset = rage.antiaim:inverter() and v522 or v523
						end
					end

					return
				end

				return
			end
		end

		t14.is_working = false

		local function v172(p86, p87)
			local v526 = p87:get_eye_position()
			local entity2 = utils.trace_line(v526, v526 + vector():angles(p86.view_angles) * 128, p87, 1174421515).entity

			if entity2 ~= nil then
				local v528 = entity2:get_classname()
				local t103 = {
					[1] = "CDEagle",
					[2] = "Weapon",
					[3] = "Door",
					[4] = "Hostage"
				}
				local v530 = false

				for _, v in pairs(t103) do
					if v528:find(v) then
						v530 = true

						return v530
					end
				end

				return v530
			end

			return false
		end
		local function v173(p88)
			if p88.m_iTeamNum == 3 then
				local v534 = p88:get_origin()
				local v535 = entity.get_entities("CPlantedC4")

				for i = 1, #v535 do
					local v537 = v535[i]

					if v537 == nil then
						return false
					end

					local v538 = v537:get_origin()

					if v537.m_bBombTicking and v538:dist(v534) < 87.5 then
						return true
					end
				end

				return false
			end

			return false
		end
		local function v174(p89, p90, p91)
			-- upvalues: v172 (copy), v173 (copy)
			if not p91 or p91:get_classname() ~= "CC4" then
				if not v172(p89, p90) then
					if not v173(p90) then
						return false
					end

					return true
				end

				return true
			end

			return true
		end

		function t14.think(p92)
			-- upvalues: t6 (copy), v174 (copy)
			if t6.antiaim.main.additional.legit_aa.enabled:get() then
				local v543 = entity.get_local_player()

				if v543 ~= nil and v543:is_alive() then
					local v544 = v543:get_player_weapon()

					if v544 ~= nil then
						if p92.in_use then
							if not v174(p92, v543, v544) then
								return true
							end

							return false
						end

						return false
					end

					return false
				end

				return false
			end

			return false
		end
		function t14.update(p93, p94, _)
			-- upvalues: t14 (copy), t6 (copy)
			local v548 = t14.think(p93)

			t14.is_working = v548

			if v548 then
				p93.in_use = false
				p94.pitch = "Disabled"
				p94.yaw_base = t6.antiaim.main.additional.legit_aa.mode:get()

				return
			end
		end

		local n4 = 1
		local n5 = 0

		function t15.think(p96)
			-- upvalues: t14 (copy), t10 (copy), t6 (copy)
			t14.think(p96)

			local v550 = t10.get(t14.is_working, false, false)

			if t6.antiaim.angles.break_lc.select:get(v550) then
				local v551 = entity.get_local_player()

				if v551 ~= nil and v551:is_alive() then
					local v552 = v551:get_player_weapon()

					if v552 ~= nil then
						if not t6.antiaim.angles.break_lc.disable_on_grenade:get() or v552:get_weapon_info().weapon_type ~= 9 then
							return true
						end

						return false
					end

					return false
				end

				return false
			end

			return false
		end
		function t15.update(p97, p98, p99)
			-- upvalues: t15 (copy), n5 (ref), n4 (ref), t9 (copy), t6 (copy)
			if t15.think(p97) then
				local v556 = p99.choke:get()
				local v557 = p99.custom_choke:get()
				local v558 = p99.choke_slider:get()
				local v559 = p99.choke_randomize:get()
				local v560 = p99.choke_method:get()
				local v561 = p99.choke_from:get()
				local v562 = p99.choke_to:get()
				local v563 = p99.choke_sliders:get()

				if p97.choked_commands == 0 then
					n5 = n5 + 1

					local v564 = p99["choke1_" .. n4]:get() or 1

					if v563 >= math.max(v564, 1) then
						n5 = 0
						n4 = n4 + 1

						if v563 < n4 then
							n4 = 1
						end
					end
				end

				if v556 ~= "Custom" then
					p98.lag_options = "Always On"
				else
					if v557 then
						if v560 ~= "Random" then
							local v565 = p99["choke1_" .. n4]:get() or 1

							p97.force_defensive = globals.tickcount % v565 == 0
						else
							p97.force_defensive = globals.tickcount % math.random(v561, v562) == 0
						end
					else
						local v566 = t9.get_random_tick(v558, v559)

						p97.force_defensive = globals.tickcount % v566 == 0
					end

					p98.lag_options = "Always On"
				end

				p98.hs_options = t6.antiaim.angles.break_lc.hide_shots:get()

				return
			end

			p98.lag_options = nil
			p98.hs_options = nil
		end
	end

	function t16.think(_)
		-- upvalues: t10 (copy), t14 (copy), t6 (copy)
		local v568 = t10.get(t14.is_working, true)

		if not t6.antiaim.angles.freestanding.disablers:get(v568) then
			if t6.antiaim.angles.freestanding.switch:get() then
				return true
			end

			return false
		end

		return false
	end
	function t16.update(p101, p102, _)
		-- upvalues: t16 (copy), t6 (copy)
		local v572 = t16.think(p101)

		p102.freestanding = v572

		if v572 then
			p102.body_freestanding = t6.antiaim.angles.freestanding.body_fs:get()
			p102.disable_yaw_modifiers = t6.antiaim.angles.freestanding.yaw_mod:get()
		end
	end

	local t104 = {
		stage = 0,
		time = -1,
		offset = 0,
		tick = 0
	}

	local function v178()
		-- upvalues: t104 (ref)
		t104.time = -1
		t104.offset = 0
		t104.stage = 0
	end
	local function v179(p104)
		-- upvalues: t6 (copy), t104 (ref), t7 (copy)
		if t6.antiaim.angles.anti_bruteforce.switch:get() then
			local v574 = entity.get(p104.userid, true)

			if v574 ~= nil then
				if t104.time ~= -1 then
					if v574 ~= t104.target then
						return
					end

					if t6.antiaim.angles.anti_bruteforce.notify:get() then
						t7.new({
							[1] = "Reset antibrute due to",
							[2] = " target death"
						}, color(255, 0, 0), "sparkles")
					end

					return
				end

				return
			end

			return
		end
	end

	function t17.bullet_impact(p105)
		-- upvalues: t6 (copy), t104 (ref), t7 (copy)
		if t6.antiaim.angles.anti_bruteforce.switch:get() then
			local v576 = entity.get_local_player()

			if v576 ~= nil and v576:is_alive() then
				local v577 = entity.get(p105.userid, true)

				if v577 ~= nil and v577:is_alive() and v577:is_enemy() then
					t104 = t104 or {
						stage = 0,
						time = -1,
						offset = 0,
						tick = 0
					}

					local tickcount = globals.tickcount

					if tickcount ~= t104.tick then
						local v579 = v576:simulate_movement()
						local v580 = v577:get_eye_position()

						if not (v579.origin:closest_ray_point(v580, (vector(p105.x, p105.y, p105.z))):dist(v579.origin) > 45) then
							t104.tick = tickcount
							t104.target = v577
							t104.time = globals.realtime + t6.antiaim.angles.anti_bruteforce.timeout:get()
							t104.stage = t104.stage + 1

							if t104.stage >= 15 then
								t104.stage = 0
							end

							local v581 = t6.antiaim.angles.anti_bruteforce.mode:get()

							if v581 ~= "Increasing" then
								if v581 ~= "Decreasing" then
									if v581 ~= "Alternating" then
										t104.offset = math.random(0, 1) == 1 and math.random(-5, -10) or math.random(5, 10)
									else
										t104.offset = t104.stage * 2 * (rage.antiaim:inverter() and 1 or -1)
									end
								else
									t104.offset = math.random(-10, 5)
								end
							else
								t104.offset = math.random(5, 10)
							end

							if t6.antiaim.angles.anti_bruteforce.notify:get() then
								t7.new({
									[1] = "Antibrute updated by ",
									[2] = nil,
									[3] = " (stage: ",
									[4] = nil,
									[5] = " | offset: ",
									[6] = nil,
									[7] = ")",
									[2] = v577:get_name(),
									[4] = t104.stage,
									[6] = t104.offset
								}, nil, "sparkles")
							end

							return
						end

						return
					end

					return
				end

				return
			end

			return
		end
	end
	function t17.player_death(p106)
		-- upvalues: v179 (copy), v178 (copy)
		v179(p106)
		v178()
	end
	function t17.update(_, p108)
		-- upvalues: t6 (copy), t104 (ref)
		if t6.antiaim.angles.anti_bruteforce.switch:get() then
			if not (t104.time - globals.realtime <= 0) then
				p108.yaw_offset = (p108.yaw_offset or 0) + t104.offset

				return
			end

			return
		end
	end

	local t105 = {}
	local t106 = {
		unoverride = function(_)
			-- upvalues: t1 (copy)
			for _, v in pairs(t1.antiaim.angles) do
				v:override()
			end
		end,
		reset = function(p110)
			p110.pitch = nil
			p110.yaw = nil
			p110.yaw_offset = nil
			p110.yaw_base = nil
			p110.yaw_modifier = nil
			p110.modifier_offset = nil
			p110.left_limit = nil
			p110.right_limit = nil
			p110.body_yaw = nil
			p110.body_yaw_options = nil
			p110.disable_yaw_modifiers = nil
			p110.body_freestanding = nil
			p110.freestanding = nil
			p110.freestand_peek = nil
			p110.lag_options = nil
			p110.hs_options = nil
			p110.avoid_backstab = nil
			p110.ignore_inverter = false
		end,
		run = function(p111)
			-- upvalues: t1 (copy)
			local v590 = p111.pitch or "Disabled"

			t1.antiaim.angles.pitch:override(v590)

			local v591 = p111.yaw or "Disabled"

			t1.antiaim.angles.yaw:override(v591)

			local v592 = p111.yaw_offset or 0

			t1.antiaim.angles.yaw_add:override(v592)

			local v593 = p111.yaw_base or "Local View"

			t1.antiaim.angles.yaw_base:override(v593)

			local v594 = p111.yaw_modifier or "Disabled"

			t1.antiaim.angles.yaw_modifier:override(v594)

			local v595 = p111.modifier_offset or 0

			t1.antiaim.angles.modifier_offset:override(v595)

			local v596 = p111.left_limit or 0
			local v597 = p111.right_limit or 0

			t1.antiaim.angles.left_limit:override(v596)
			t1.antiaim.angles.right_limit:override(v597)

			local v598 = p111.body_yaw or false

			t1.antiaim.angles.body_yaw:override(v598)

			local v599 = p111.body_yaw_options or {}

			t1.antiaim.angles.options:override(v599)

			local v600 = p111.disable_yaw_modifiers or false

			t1.antiaim.angles.disable_yaw_modifiers:override(v600)

			local v601 = p111.body_freestanding or false

			t1.antiaim.angles.body_freestanding:override(v601)

			local v602 = p111.freestanding or false

			t1.antiaim.angles.freestanding:override(v602)

			local v603 = p111.freestand_peek or "Off"

			t1.antiaim.angles.freestand_peek:override(v603)

			local v604 = p111.lag_options or "On Peek"

			t1.rage.main.double_tap_lag_options:override(v604)

			local v605 = p111.hs_options or "Favor Fire Rate"

			t1.rage.main.hide_shots_options:override(v605)

			local v606 = p111.avoid_backstab or false

			t1.antiaim.angles.avoid_backstab:override(v606)
		end
	}

	t106:unoverride()

	function t105.create_antiaim()
		-- upvalues: t106 (copy)
		return setmetatable({}, {
			__index = t106
		})
	end

	local v182 = t105.create_antiaim()
	local n6 = 1
	local n7 = 1
	local n8 = 0
	local n9 = 0
	local u187 = false
	local _ = 0
	local n10 = 0
	local u190 = false
	local n11 = 0
	local n12 = 1
	local t107 = {}

	local function v194()
		return {
			last_flip = 0,
			packets = 0,
			state = false
		}
	end

	t107.yaw = v194()
	t107.body = v194()
	t107.limit = v194()

	function t18.get_exploit_values(p112, p113)
		return ({
			[1] = -p112,
			[2] = -p112 / 2,
			[3] = -p112 / 3,
			[4] = p112 / 3,
			[5] = p112 / 2,
			[6] = p112
		})[p113]
	end

	local function v195(p114, p115)
		-- upvalues: t6 (copy)
		local v611 = t6.antiaim.angles.builder[p114]

		if v611 ~= nil then
			return v611[p115]
		end

		return nil
	end
	local function v196()
		-- upvalues: n8 (ref), u187 (ref)
		n8 = 0
		u187 = not u187
	end
	local function v197(p116, p117, p118)
		-- upvalues: t9 (copy)
		if globals.choked_commands == 0 then
			p116.packets = p116.packets + 1

			if (rage.exploit:get() < 1 and 1 or (p118 and t9.get_random_tick(p117, p118) or p117)) <= p116.packets - p116.last_flip then
				p116.state = not p116.state
				p116.last_flip = p116.packets
			end
		end

		return p116.state
	end
	local function v198(p119, p120, p121, p122)
		if not (p120 <= 0) then
			local v619 = p119 + (math.random() * 2 - 1) * 15 * (p120 / 100)

			if p121 and p122 then
				v619 = math.clamp(v619, p121, p122)
			end

			return v619
		end

		return p119
	end
	local function v199(p123, p124, p125, p126)
		-- upvalues: n10 (ref), n6 (ref), v198 (copy), n11 (ref), u190 (ref), v197 (copy), t107 (copy), n8 (ref), u187 (ref), v196 (copy)
		if p123.choked_commands == 0 then
			n10 = n10 + 1
		end

		p124.pitch = "Down"
		p124.yaw = "Backward"
		p124.yaw_base = "At Target"

		local v624 = p125.yaw_mode:get()
		local v625 = p125.delay:get()
		local v626 = p125.yaw_left:get()
		local v627 = p125.yaw_right:get()
		local v628 = p125.yaw_random:get()
		local v629 = p125.delay_logic:get()
		local v630 = p125.delay_method:get()
		local v631 = p125.delay_default:get()
		local v632 = p125.delay_randomize:get()
		local v633 = p125.delay_random_min:get()
		local v634 = p125.delay_random_max:get()
		local v635 = p125.delay_custom_sliders:get()
		local v636 = p125["delay_" .. n6]:get() or 1
		local v637 = math.max(v636, 1)
		local n13 = 1.95

		if v624 ~= 1 then
			if v624 ~= 2 then
				return
			end

			local v639 = v198(v626, v628, -180, 180)
			local v640 = v198(v627, v628, -180, 180)

			if not v625 then
				p124.yaw_offset = p126.m_flPoseParameter[11] * 120 - 60 > 0 and v639 or v640
			elseif v629 ~= "Legacy" then
				if p123.choked_commands == 0 then
					n8 = n8 + 1

					if v630 ~= "Default" then
						if v630 ~= "Random" then
							n6 = n6 + 1

							if v635 < n6 then
								n6 = 1
							end

							if n8 >= v637 / n13 then
								v196()
							end
						else
							local v641 = utils.random_int(v633, v634)

							if n8 >= v641 / n13 then
								v196()
							end
						end
					else
						u187 = v197(t107.yaw, v631 / n13, v632)
					end
				end

				rage.antiaim:inverter(u187)
				p124.yaw_offset = u187 and v639 or v640
			else
				if v630 ~= "Default" then
					if v630 ~= "Random" then
						local t108 = {}

						for i = 1, p125.delay_custom_sliders:get() do
							table.insert(t108, p125["delay_" .. i]:get())
						end

						v631 = t108[math.random(1, p125.delay_custom_sliders:get())]
					else
						v631 = math.random(v633, v634)
					end
				end

				if p123.choked_commands == 0 then
					n11 = n11 + 1

					if v630 ~= "Default" then
						if v631 <= n11 then
							n11 = 0
							u190 = not u190
						end
					else
						u190 = v197(t107.yaw, v631, v632)
					end
				end

				rage.antiaim:inverter(u190)
				p124.yaw_offset = u190 and v639 or v640
			end

			return
		end

		local v644 = p125.offset:get()
		local v645 = p125.yaw_random:get()

		p124.yaw_offset = v198(v644, v645, -180, 180)
	end
	local function v200(_, p128, p129)
		-- upvalues: t1 (copy), v197 (copy), t107 (copy)
		local v649 = p129.body_yaw:get()
		local v650 = p129.body_yaw_options:get()
		local v651 = p129.mode:get()
		local v652 = p129.mode_ticks:get()
		local v653 = p129.mode_ticks_randomize:get()
		local v654 = p129.mode_random:get()

		if v651 ~= "Static" then
			if v651 ~= "Ticks" or t1.antiaim.misc.fake_duck:get() then
				if v651 == "Random" and not t1.antiaim.misc.fake_duck:get() then
					p128.body_yaw = v654 == utils.random_int(0, v654)
				end
			else
				local v655 = not (globals.tickcount % v652 <= 1)

				if v652 > 0 and not v197(t107.body, v652, v653) then
					v655 = false
				end

				p128.body_yaw = v655
			end
		else
			p128.body_yaw = v649
		end

		local v656 = p129.limit_mode:get()
		local v657 = p129.minimum_limit:get()
		local v658 = p129.maximum_limit:get()
		local v659 = p129.limit_delay:get()
		local v660 = p129.limit_delay_randomize:get()
		local v661 = p129.from_limit:get()
		local v662 = p129.to_limit:get()
		local v663 = p129.sinewave_speed:get()
		local v664 = rage.antiaim:inverter()
		local n14 = 0
		local n15 = 0

		if v656 ~= "Static" then
			if v656 ~= "Random" then
				if v656 ~= "Switch" then
					if v656 ~= "Sinewave" then
						if v656 == "Delay" then
							local v667 = v197(t107.limit, v659, v660)

							n14 = v667 and v661 or v662
							n15 = v667 and v661 or v662
						end
					else
						n14 = math.sin(globals.curtime * v663) * v661
						n15 = math.sin(globals.curtime * v663) * v662
					end
				else
					n14 = v664 and v661 or v662
					n15 = v664 and v661 or v662
				end
			else
				n14 = math.random(v657, v658)
				n15 = math.random(v657, v658)
			end
		else
			n14 = p129.left_limit:get()
			n15 = p129.right_limit:get()
		end

		p128.left_limit = n14
		p128.right_limit = n15
		p128.freestand_peek = p129.body_freestanding:get()
		p128.body_yaw_options = v650
	end
	local function v201(p130, p131, p132)
		-- upvalues: n7 (ref), n12 (ref), v198 (copy), t18 (copy), n9 (ref)
		local v671 = p132.modifier:get()
		local v672 = p132.modifier_mode:get()
		local v673 = p132.modifier_custom_sliders:get()
		local v674 = p132.modifier_offset:get()
		local v675 = p132.modifier_random:get()
		local v676 = p132.modifier_min:get()
		local v677 = p132.modifier_max:get()
		local v678 = p132["modifier_sliders_" .. n7]:get() or 1
		local v679 = math.max(v678, 1)

		if p130.choked_commands == 0 then
			n12 = n12 + 1

			if n12 >= 7 then
				n12 = 1
			end
		end

		p131.yaw_modifier = v671 == "Bobro" and "3-Way" or v671

		if v672 ~= "Default" then
			if v672 ~= "Min/Max" then
				if v672 ~= "Custom" then
					return
				end

				if p130.choked_commands == 0 then
					n9 = n9 + 1

					if v679 <= n9 then
						n9 = 0
						n7 = n7 + 1

						if v673 < n7 then
							n7 = 1
						end
					end
				end

				local v680 = p132["modifier_sliders_" .. n7]:get()
				local v681 = v198(v680, v675, -180, 180)
				local v682 = t18.get_exploit_values(v681, n12)

				p131.modifier_offset = v671 == "Bobro" and v682 or v681

				return
			end

			local v683 = math.random(v676, v677)

			p131.modifier_offset = v671 == "Bobro" and t18.get_exploit_values(v683, n12) or v683

			return
		end

		local v684 = v198(v674, v675, -180, 180)

		p131.modifier_offset = v671 == "Bobro" and t18.get_exploit_values(v684, n12) or v684
	end
	local function v202(p133, p134, p135)
		-- upvalues: v182 (copy), v195 (copy), v199 (copy), v200 (copy), v201 (copy), t17 (copy), t13 (copy), t14 (copy), t12 (copy), t15 (copy), t11 (copy), t16 (copy), t6 (copy)
		v182:reset()

		local v688 = p135.m_iTeamNum == 2 and "T" or "CT"
		local v689 = v195(p134, v688)

		if v689 ~= nil then
			v182.avoid_backstab = true
			v199(p133, v182, v689, p135)
			v200(p133, v182, v689)
			v201(p133, v182, v689)
			t17.update(p133, v182)
			t13.update(p133, v182, v689)

			if not t14.think(p133) then
				t12.update(p133, v182, v689)
			end

			t14.update(p133, v182, v689)
			t15.update(p133, v182, v689)

			local v690 = t11.think()
			local v691 = t16.think()

			if not t6.antiaim.angles.freestanding.prefer_manual:get() or not v690 then
				if v691 ~= true then
					t11.update(p133, v182, v689)
				else
					t16.update(p133, v182, v689)
				end
			else
				t11.update(p133, v182, v689)
			end

			v182:run()

			return
		end
	end

	function t18.update(p136)
		-- upvalues: t14 (copy), t10 (copy), v202 (copy)
		local v693 = entity.get_local_player()
		local v694 = t14.think(p136)
		local v695 = t10.get(v694)

		v202(p136, v695, v693)
	end

	local v203 = ffi.typeof("        struct {\n            float  m_flLayerAnimtime;\n            float  m_flLayerFadeOuttime;\n            void  *m_pDispatchedStudioHdr;\n            int    m_nDispatchedSrc;\n            int    m_nDispatchedDst;\n            int    m_nOrder;\n            int    m_nSequence;\n            float  m_flPrevCycle;\n            float  m_flWeight;\n            float  m_flWeightDeltaRate;\n            float  m_flPlaybackRate;\n            float  m_flCycle;\n            int    m_pOwner;\n            int    m_nInvalidatePhysicsBits;\n        } **\n    ")

	t19.command_number = 0

	local t109 = {}

	local function v205(p137)
		if p137 then
			local num = tonumber(ffi.cast("uintptr_t", p137))

			return num and (num > 65536 and not (num >= 140737488355327))
		end

		return false
	end
	local function v206(p138)
		return p138 and p138[11] == p138[11]
	end
	local function v207(p139)
		-- upvalues: v46 (copy), v205 (copy)
		local v703 = v46(p139:get_index())

		if v205(v703) then
			local v704 = ffi.cast("uintptr_t*", v703 + 9896)[0]

			if v205(v704) then
				return v704
			end

			return
		end
	end
	local function v208(p140, p141, p142)
		-- upvalues: v206 (copy), t19 (copy)
		if v206(p140) then
			local v708 = t19.command_number % 3 == 0
			local v709 = p142 == 2 and (p141 >= 65 and not (p141 > 78)) or p141 >= 70 and not (p141 > 87)
			local v710 = v708 and 0.6 or -0.6
			local v711 = v708 and 0 or 2

			if p141 ~= 8 then
				if not v709 then
					p140[3] = p140[3] + v710
				end

				p140[7] = p140[7] + (v709 and v711 or v710)
			end

			p140[11] = p140[11] + v710 * 0.5

			return
		end
	end
	local function v209(p143)
		-- upvalues: t109 (ref), v47 (copy), v205 (copy), v48 (copy)
		if not t109[p143] then
			local v713 = v47(p143)

			if v205(v713) then
				local v714 = v48(v713)

				if v205(v714) then
					if not (v714.numHitboxSets <= 0) then
						local v715 = ffi.cast("mstudiohitboxset_t*", ffi.cast("uintptr_t", v714) + v714.hitboxSetIndex)

						if v715 and not (v715.numhitboxes <= 0) then
							local v716 = ffi.cast("mstudiobbox_t*", ffi.cast("uintptr_t", v715) + v715.hitboxindex)
							local t110 = {}

							for i = 0, v715.numhitboxes - 1 do
								local bone = v716[i].bone

								if bone and bone >= 0 and bone < v714.numBones then
									table.insert(t110, bone)
								end
							end

							t109[p143] = t110

							return t110
						end

						return
					end

					return
				end

				return
			end

			return
		end

		return t109[p143]
	end
	local function v210(p144)
		-- upvalues: v207 (copy), v209 (copy), v208 (copy)
		if p144 ~= nil and p144:is_alive() then
			local m_nModelIndex = p144.m_nModelIndex

			if m_nModelIndex and m_nModelIndex ~= nil then
				local v722 = v207(p144)

				if v722 then
					local v723 = v209(m_nModelIndex)

					if v723 and #v723 ~= 0 then
						local v724 = ffi.cast("float*", v722)

						for _, v in ipairs(v723) do
							local v727 = v724 + v * 12

							v208(v727, v, p144.m_iTeamNum)
						end

						return
					end

					return
				end

				return
			end

			return
		end
	end

	local u211 = false

	local function v212(p145)
		-- upvalues: v203 (copy)
		return ffi.cast(v203, ffi.cast("uintptr_t", p145[0]) + 10640)[0]
	end

	function t19.createmove(p146)
		-- upvalues: u211 (ref), t19 (copy), t6 (copy), t1 (copy)
		u211 = p146.in_use
		t19.command_number = p146.command_number

		if t6.misc.player_animations.jitter_legs.switch:get() then
			t1.antiaim.misc.leg_movement:override(p146.command_number % 3 == 0 and "Walking" or "Sliding")

			return
		end

		t1.antiaim.misc.leg_movement:override()
	end

	t19.smoothed_pose_p = {}
	t19.smoothed_layers = {}

	for i = 0, 12 do
		t19.smoothed_pose_p[i] = 0
		t19.smoothed_layers[i] = 0
	end

	function t19.post_update_clientside_animation(p147)
		-- upvalues: v212 (copy), t6 (copy), u211 (ref), t19 (copy), v210 (copy)
		local v731 = entity.get_local_player()

		if v731 ~= nil and v731:is_alive() then
			if p147 ~= nil and p147:is_alive() then
				if p147 == v731 then
					local v732 = p147:get_player_weapon()

					if v732 ~= nil then
						local v733 = v212(p147)

						if v733 ~= nil then
							local v734 = v731.m_hGroundEntity == nil
							local m_vecVelocity = v731.m_vecVelocity
							local n16 = 0.01
							local v737 = t6.misc.player_animations.leaning.value:get()
							local v738 = t6.misc.player_animations.falling.value:get()
							local v739 = t6.misc.player_animations.jitter_legs.switch:get()
							local v740 = t6.misc.player_animations.jitter_legs.from:get()
							local v741 = t6.misc.player_animations.jitter_legs.to:get()
							local v742 = t6.misc.player_animations.interpolation:get()

							if v737 ~= -1 and m_vecVelocity:length2d() > 4 then
								v733[12].m_flWeight = v737 * n16
							end

							if v739 and m_vecVelocity:length2d() > 2 then
								p147.m_flPoseParameter[0] = (globals.tickcount % 3 == 0 and v740 or v741) * n16
							end

							if v738 ~= -1 then
								p147.m_flPoseParameter[6] = v738 * n16
							end

							if v732:get_classname() == "CC4" and u211 then
								v733[10].m_flWeight = 1
								v733[10].m_nSequence = 200
								v733[10].m_flCycle = 0.1
							end

							if v742 > 0 then
								local v743 = globals.tickinterval * v742

								for i = 0, 12 do
									t19.smoothed_pose_p[i] = v743 * t19.smoothed_pose_p[i] + (1 - v743) * p147.m_flPoseParameter[i]
									p147.m_flPoseParameter[i] = t19.smoothed_pose_p[i]
								end

								for i = 0, 12 do
									t19.smoothed_layers[i] = v743 * t19.smoothed_layers[i] + (1 - v743) * v733[i].m_flWeight
									v733[i].m_flWeight = t19.smoothed_layers[i]
								end
							end

							if (v734 and t6.misc.player_animations.skeet.enables:get("Air") or not v734 and t6.misc.player_animations.skeet.enables:get("Ground")) and m_vecVelocity:length2d() > 2 then
								v210(v731)
							end

							return
						end

						return
					end

					return
				end

				return
			end

			return
		end
	end

	local t111 = {
		[1] = "player_spawn",
		[2] = "player_death",
		[3] = "round_prestart",
		[4] = "round_start",
		[5] = "level_init",
		[6] = "map_load",
		[7] = "map_change"
	}

	for i = 1, #t111 do
		events[t111[i]](function(p148)
			-- upvalues: t109 (ref)
			if p148 == nil or not p148.userid then
				t109 = {}
			else
				local v697 = entity.get(p148.userid, true)

				if v697 ~= nil and v697 == entity.get_local_player() then
					t109 = {}
				end
			end
		end)
	end
end

function t20.createmove(p149)
	-- upvalues: t6 (copy), t1 (copy)
	if t6.misc.helpers.fakeduck.unlock:get() then
		if t1.antiaim.misc.fake_duck:get() then
			local forwardmove = p149.forwardmove
			local sidemove = p149.sidemove

			if not (math.abs(forwardmove) <= 1) or math.abs(sidemove) > 1 then
				local v749 = 450 / vector(forwardmove, sidemove):length2d()

				p149.forwardmove = forwardmove * v749
				p149.sidemove = sidemove * v749
			end

			return
		end

		return
	end
end
function t21.createmove(p150)
	-- upvalues: t6 (copy), t1 (copy)
	if t6.misc.helpers.fakeduck.freeze_period:get() then
		if t1.antiaim.misc.fake_duck:get() then
			local v751 = entity.get_game_rules()

			if v751 ~= nil then
				if v751.m_bFreezePeriod then
					p150.in_duck = not (p150.choked_commands < 7)
					p150.send_packet = not p150.choked_commands == 14

					return
				end

				return
			end

			return
		end

		return
	end
end
function t21.override_view(p151)
	-- upvalues: t6 (copy), t1 (copy)
	if t6.misc.helpers.fakeduck.freeze_period:get() then
		if t1.antiaim.misc.fake_duck:get() then
			local v753 = entity.get_local_player()

			if v753 ~= nil and v753:is_alive() then
				local v754 = entity.get_game_rules()

				if v754 then
					if v754.m_bFreezePeriod then
						p151.camera = p151.camera - v753.m_vecViewOffset + vector(0, 0, 64)

						return
					end

					return
				end

				return
			end

			return
		end

		return
	end
end

local n17 = 0.5

local function v217()
	-- upvalues: n17 (copy)
	local v755 = utils.net_channel()

	if v755 ~= nil then
		if not v755.is_loopback then
			if v755.is_timing_out then
				local v756 = v755.time - v755.time_since_last_received

				if not (v756 < n17) then
					return v756
				end

				return 0
			end

			return 0
		end

		return 0
	end

	return 0
end

function t22.draw()
	-- upvalues: t6 (copy), v217 (copy), v49 (copy), t4 (copy)
	if t6.misc.misc.logging.mode.select:get(2) then
		local v757 = v217()

		if v757 ~= 0 then
			local v758 = globals.realtime * 1.25
			local v759 = v49 * vector(0.5, 0.175)
			local v760, v761, v762, v763 = ui.get_style()["Link Active"]:unpack()
			local v764 = math.max(v763, 55)
			local v765 = string.format("Time without connection: %.1fs", v757)
			local v766 = string.upper(v765)
			local s8 = "d"
			local v768 = render.measure_text(2, s8, v766)

			v759.x = v759.x - v768.x * 0.5

			local v769 = t4.wave(v766, v758, v760, v761, v762, v764, 71, 71, 71, v764)

			render.text(2, v759, color(v760, v761, v762, v764), s8, v769)

			return
		end

		return
	end
end

local t112 = {
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
}
local t113 = {
	inferno = "Burned",
	hegrenade = "Naded",
	taser = "Zeused",
	knife = "Knifed"
}
local _ = {
	inferno = "fire",
	hegrenade = "bomb",
	taser = "bolt-lightning ",
	knife = "sword"
}

t23.data = {}
t23.id = 0

local function v221(p152, p153)
	local t114 = {}

	t114[#t114 + 1] = "\a"
	t114[#t114 + 1] = p153
	t114[#t114 + 1] = p152
	t114[#t114 + 1] = "\aDEFAULT"

	return table.concat(t114)
end
local function v222(p154)
	-- upvalues: t6 (copy)
	if not p154 then
		return t6.misc.misc.logging.colors.hit:get()
	end

	return t6.misc.misc.logging.colors.miss:get()
end

function t23.aim_fire(p155)
	-- upvalues: t23 (copy)
	local v775 = entity.get_local_player()

	if v775 ~= nil and v775:is_alive() then
		t23.id = t23.id + 1

		if t23.id > 100 then
			t23.id = 1
		end

		t23.data[t23.id] = {
			id = p155.id,
			target = p155.target,
			tick = globals.server_tick
		}

		return
	end
end

local function v223(p156, p157)
	-- upvalues: v222 (copy), t6 (copy), t112 (copy), v221 (copy)
	local target = p156.target

	if target ~= nil then
		local v779 = v222(false):to_hex()
		local v780 = v222(true):to_hex()
		local s9 = "\aDEFAULT"

		if p156.damage == p156.wanted_damage or not string.format("(%s)", p156.wanted_damage) then
		end

		if not (target.m_iHealth <= 0) then
		end

		local v782 = p156.hitgroup ~= p156.wanted_hitgroup and string.format("(%s)", p156.wanted_hitgroup) or ""
		local v783 = "\a737373FF•" .. s9
		local v784 = "\a737373FF›" .. s9
		local v785 = t6.misc.misc.logging.customization.prefix:get()
		local v786 = v785:gsub(" ", "") == "" and "" or "\a" .. v779 .. v785 .. s9
		local v787 = t112[p156.hitgroup] or "?"
		local v788 = t112[p156.wanted_hitgroup] or "?"

		if v787 == "generic" then
			v787 = v788
		end

		math.max(globals.server_tick - p157.tick - 1, 0)

		local v789 = math.floor(to_time(p156.backtrack) * 1000)

		print_raw(("%s %s Hit %s in the %s for %s damage %sbt: %s %s hc: %s %s sp: %s %s delay: %sms%s"):format(v786, v784, v221(target:get_name(), v779), v221(v787, v779), v221(p156.damage, v779), v221("(", "737373FF"), v221(tostring(p156.backtrack) .. "t", v779), v783, v221(tostring(p156.hitchance) .. "%", v779), v783, v221(string.format("%.2f", p156.spread or 0) .. "°", v779), v783, v221(tostring(to_time(v789) * 1000) .. "ms", v779), v221(")", "737373FF")))

		if v782 ~= "" then
			print_raw(("\t\tMismatched %sgroup: %s %s dmg: %s%s"):format(v221("(", "737373FF"), v221(v788, v780), v783, v221(p156.wanted_damage, v780), v221(")", "737373FF")))
		end

		common.add_event(("Hit %s in the %s for %s damage %sbt: %s %s hc: %s %s delay: %s%s"):format(v221(target:get_name(), v779), v221(v787, v779), v221(p156.damage, v779), v221("(", "737373FF"), v221(tostring(p156.backtrack) .. "t", v779), v783, v221(tostring(p156.hitchance) .. "%", v779), v783, v221(tostring(to_time(v789) * 1000) .. "ms", v779), v221(")", "737373FF")), v221(ui.get_icon("check"), v779))

		return
	end
end
local function v224(p158, p159)
	-- upvalues: v222 (copy), t6 (copy), t112 (copy), v221 (copy)
	local target = p158.target

	if target ~= nil then
		local v793 = v222(false):to_hex()
		local v794 = v222(true):to_hex()
		local s10 = "\aDEFAULT"
		local v796 = "\a737373FF•" .. s10
		local v797 = "\a737373FF›" .. s10
		local v798 = t6.misc.misc.logging.customization.prefix:get()
		local v799 = v798:gsub(" ", "") == "" and "" or "\a" .. v793 .. v798 .. s10
		local v800 = t112[p158.hitgroup] or "?"
		local v801 = t112[p158.wanted_hitgroup] or "?"

		if v800 == "generic" then
		end

		math.max(globals.server_tick - p159.tick - 1, 0)

		local v802 = math.floor(to_time(p158.backtrack) * 1000)

		print_raw(("%s %s Missed %s in the %s for %s damage due to %s %sbt: %s %s hc: %s %s sp: %s %s delay: %s%s"):format(v799, v797, v221(target:get_name(), v794), v221(v801, v794), v221(p158.wanted_damage, v794), v221(p158.state, v794), v221("(", "737373FF"), v221(tostring(p158.backtrack) .. "t", v794), v796, v221(tostring(p158.hitchance) .. "%", v794), v796, v221(string.format("%.2f", p158.spread or 0) .. "°", v794), v796, v221(tostring(to_time(v802) * 1000) .. "ms", v794), v221(")", "737373FF")))
		common.add_event(("Missed %s in the %s for %s damage due %s %sbt: %s %s hc: %s %s delay: %s%s"):format(v221(target:get_name(), v794), v221(v801, v794), v221(p158.wanted_damage, v794), v221(p158.state, v794), v221("(", "737373FF"), v221(tostring(p158.backtrack) .. "t", v794), v796, v221(tostring(p158.hitchance) .. "%", v794), v796, v221(tostring(to_time(v802) * 1000) .. "ms", v794), v221(")", "737373FF")), v221(ui.get_icon("x"), v794))

		return
	end
end

function t23.player_hurt(p160)
	-- upvalues: t6 (copy), t112 (copy), v222 (copy), t113 (copy), v221 (copy)
	if t6.misc.misc.logging.switch:get() then
		if t6.misc.misc.logging.mode.select:get(1) then
			local v804 = entity.get_local_player()

			if v804 ~= nil then
				local v805 = entity.get(p160.attacker, true)

				if v805 ~= nil then
					if v804 == v805 then
						local v806 = entity.get(p160.userid, true)

						if v806 ~= nil then
							if (t112[p160.hitgroup] or "?") == "generic" then
								local s11 = "\aDEFAULT"
								local v808 = v222(false):to_hex()

								v222(true):to_hex()

								local v809 = t6.misc.misc.logging.customization.prefix:get()
								local v810 = v809:gsub(" ", "") == "" and "" or "\a" .. v808 .. v809 .. s11
								local v811 = "\a737373FF›" .. s11

								if not t113[p160.weapon] then
									error(("unknown weapon %s"):format(p160.weapon), 2)
								end

								print_raw(("%s %s %s %s for %s damage (%s remaining)"):format(v810, v811, t113[p160.weapon], v221(v806:get_name(), v808), v221(p160.dmg_health, v808), v221(p160.health, v808)))
								common.add_event(("%s %s for %s damage (%s remaining)"):format(t113[p160.weapon], v221(v806:get_name(), v808), v221(p160.dmg_health, v808), v221(p160.health, v808)), v221(ui.get_icon("circle-check"), v808))

								return
							end

							return
						end

						return
					end

					return
				end

				return
			end

			return
		end

		return
	end
end
function t23.update(p161)
	-- upvalues: t6 (copy), t23 (copy), v224 (copy), v223 (copy)
	if t6.misc.misc.logging.switch:get() then
		if t6.misc.misc.logging.mode.select:get(1) then
			local server_tick = globals.server_tick

			for k, v in pairs(t23.data) do
				if math.abs(to_time(server_tick - v.tick)) > 2 then
					t23.data[k] = nil
				end
			end

			local v816 = nil
			local id = p161.id

			for _, v in pairs(t23.data) do
				if id == v.id then
					v816 = v

					break
				end
			end

			if v816 ~= nil then
				if p161.target ~= nil then
					if p161.state == nil then
						v223(p161, v816)

						return
					end

					v224(p161, v816)

					return
				end

				return
			end

			return
		end

		return
	end
end

t24.window = t3.new("watermark", vector(v49.x / 2, v49.y * 0.8))

local v225 = render.load_font("Arial bold", 13, "ad")
local n18 = 0

function t24.frame()
	-- upvalues: t24 (copy), t6 (copy), v225 (copy), s1 (copy), t4 (copy), n18 (ref), t5 (copy)
	local window = t24.window
	local watermark = t6.info.watermark
	local t115 = {
		Bold = 4,
		Console = 3,
		Small = 2,
		Default = 1,
		Unique = v225
	}
	local t116 = {
		color(255, 0, 0, 255),
		color(255, 127, 0, 255),
		color(255, 255, 0, 255),
		color(0, 255, 0, 255),
		color(0, 0, 255, 255),
		color(75, 0, 130, 255),
		color(148, 0, 211, 255)
	}
	local v824 = t6.info.watermark.speed:get() * 0.01
	local v825 = globals.realtime * v824
	local n19 = 1
	local v827, v828, v829, v830 = t6.info.watermark.color:get("Outter")[1]:unpack()
	local v831, v832, v833, v834 = t6.info.watermark.color:get("Inner")[1]:unpack()
	local v835 = t6.info.watermark.mode:get(1) and (t6.info.watermark.text:get():gsub(" ", "") ~= "" and t6.info.watermark.text:get()) or s1

	if t6.info.watermark.glitch:get() then
		v835 = t4.glitch(v835)
	end

	local v836 = t4.wave(v835, v825, v827, v828, v829, v830, v831, v832, v833, v834)

	if not t6.info.watermark.mode:get(2) or not t6.info.watermark.effects:get("Gradient") then
		local t117 = {}

		t117[#t117 + 1] = "\a"
		t117[#t117 + 1] = t6.info.watermark.color_n:get():to_hex()
		t117[#t117 + 1] = v835
		v836 = table.concat(t117)
	end

	if t6.info.watermark.effects:get("Gradient") then
		local v838 = -(globals.realtime * v824)

		if not t6.info.watermark.rainbow:get() then
			v836 = t4.gradient(v835, v838, t6.info.watermark.color_1:get(), t6.info.watermark.color_2:get())
		else
			v836 = t4.gradient(v835, v838, unpack(t116))
		end
	end

	if t6.info.watermark.effects:get("Pulse") then
		local v839 = globals.realtime * 1.5

		n19 = math.abs(math.sin(v839))
	end

	local n20 = 1

	if watermark.mode:get(3) then
		n20 = t115[watermark.font:get()]
	end

	local v841 = window:is_dragging()

	n18 = t5.interp(n18, v841 and 0.6 or 1, 0.05)

	local position = window.position
	local v843 = render.measure_text(1, nil, v836)

	render.text(n20, position, color(255, 255 * n18 * n19), nil, v836)
	window:update(v843)
end
function t25.draw()
	-- upvalues: s1 (copy), pui (copy), t4 (copy)
	if not (ui.get_alpha() <= 0) then
		local v844 = s1
		local v845 = v844:len()
		local v846 = v844:gsub(" ", "")

		if v845 == 0 or v846 == "" then
			v844 = s1
		end

		local v847 = globals.realtime * 1.6
		local v848, v849, v850, v851 = pui.get_style()["Link Active"]:unpack()
		local v852 = t4.wave(v844, v847, v848, v849, v850, v851, v848, v849, v850, v851 * 0.5)

		ui.sidebar(v852, "moon-stars")

		return
	end
end

local n21 = 0
local n22 = 0
local v229 = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")

function t26.draw()
	-- upvalues: t6 (copy), n21 (ref), t5 (copy), n22 (ref), v229 (copy), v49 (copy)
	local v853 = entity.get_local_player()

	if v853 ~= nil and v853:is_alive() then
		if v853:get_player_weapon() ~= nil then
			local v854 = t6.visuals.scope_overlay.switch:get()
			local m_bIsScoped = v853.m_bIsScoped

			n21 = t5.interp(n21, v854, 0.05)
			n22 = t5.interp(n22, v854 and m_bIsScoped, 0.05)

			if not (n21 <= 0) then
				v229:override("Remove All")

				local v856 = n21 * n22
				local v857 = v49 * 0.5
				local v858 = t6.visuals.scope_overlay.gap:get() * v49.y * (1 / v49.y)
				local v859 = t6.visuals.scope_overlay.length:get() * v49.y * (1 / v49.y)
				local v860 = math.floor(v858)
				local v861 = math.floor(v859)
				local v862 = v861 - v860
				local v863 = t6.visuals.scope_overlay.colors.main:get()
				local v864 = t6.visuals.scope_overlay.colors.edge:get()

				if t6.visuals.scope_overlay.options:get(2) then
					local v865 = v864

					v864 = v863:clone()
					v863 = v865
				end

				v863.a = v863.a * v856
				v864.a = v864.a * v856

				local n23 = 45
				local v867 = t6.visuals.scope_overlay.options:get(1)

				if v867 and t6.visuals.scope_overlay.animation:get() and v853.m_vecVelocity:length2d() >= 5 then
					n23 = globals.framecount % 360
				end

				if v867 then
					render.push_rotation(n23)
				end

				render.gradient(vector(v857.x, v857.y - v860 + 1), vector(v857.x + 1, v857.y - v861 * v856), v863, v863, v864, v864)
				render.gradient(vector(v857.x, v857.y + v860), vector(v857.x + 1, v857.y + v861 * v856), v863, v863, v864, v864)
				render.gradient(vector(v857.x - v860 + 1, v857.y), vector(v857.x - v860 + 1 - v862 * v856, v857.y + 1), v863, v864, v863, v864)
				render.gradient(vector(v857.x + v860, v857.y), vector(v857.x + v860 + v862 * v856 + 1, v857.y + 1), v863, v864, v863, v864)

				if v867 then
					render.pop_rotation()
				end

				return
			end

			v229:override()

			return
		end

		return
	end
end

local n24 = 0
local n25 = 0
local n26 = 0
local n27 = 0

function t27.draw()
	-- upvalues: v49 (copy), t6 (copy), n24 (ref), t5 (copy), n25 (ref), n26 (ref), n27 (ref)
	local v868 = entity.get_local_player()

	if v868 ~= nil and v868:is_alive() then
		local v869 = v49 / 2
		local v870 = t6.visuals.manual_arrows.switch:get()
		local v871 = t6.antiaim.main.additional.manual_yaw.select:get()
		local v872 = ({
			Small = 2,
			Default = 1,
			Bold = 4,
			Console = 3
		})[t6.visuals.manual_arrows.font:get()]
		local v873 = t6.visuals.manual_arrows.offset:get()

		n24 = t5.interp(n24, v870, 0.05)

		if not (n24 <= 0) then
			local v874 = t6.visuals.manual_arrows.color:get()

			n25 = t5.interp(n25, v871 == "Left", 0.05)
			n26 = t5.interp(n26, v871 == "Right", 0.05)
			n27 = t5.interp(n27, v871 == "Forward", 0.05)

			if n25 > 0 then
				render.text(v872, v869 + vector(-10, 0) - vector(v873, 0), v874:alpha_modulate(n25 * v874.a * n24), "c", t6.visuals.manual_arrows.symbols.left:get())
			end

			if n26 > 0 then
				render.text(v872, v869 + vector(12, 0) + vector(v873, 0), v874:alpha_modulate(n26 * v874.a * n24), "c", t6.visuals.manual_arrows.symbols.right:get())
			end

			if n27 > 0 then
				render.text(v872, v869 + vector(0, -10) - vector(0, v873), v874:alpha_modulate(n27 * v874.a * n24), "c", t6.visuals.manual_arrows.symbols.forward:get())
			end

			return
		end

		return
	end
end

local t118 = {}
local n28 = 19
local n29 = 353
local v237 = render.load_font("Calibri Bold", vector(25, 23.5, 0), "da")
local v238 = render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg", vector(30, 30))

local function v239(p162)
	local v876 = ui.get_binds()

	for i = 1, #v876 do
		local v878 = v876[i]

		if v878 then
			local name = v878.name

			if p162 == "Dormant aimbot" then
				name = name:sub(#"\a{Link Active}" + 5 + #"\aDEFAULT", #name)
			end

			if string.lower(name) == string.lower(p162) and v878.active then
				return true
			end
		end
	end

	return false
end
local function v240(p163, p164, p165, p166)
	-- upvalues: t118 (ref)
	t118[#t118 + 1] = {
		text = p164,
		color = p163,
		progress = p165 or nil,
		icon = p166 or nil
	}
end
local function v241(p167)
	return p167:get() or p167:get_override()
end
local function v242()
	-- upvalues: v241 (copy), t1 (copy)
	local v885 = utils.net_channel()

	if v885 ~= nil then
		local v886 = (v885.sequence_nr[0] + v885.sequence_nr[1]) / math.min(math.max(v241(t1.misc.other.fake_latency) * 0.001 + 0, 0.001), 0.2)

		return math.clamp(-1.7014636E+38, math.min(math.max(v886, 0), 1), v886)
	end
end
local function v243(p168, p169)
	local n30 = 0.5

	if p169 > 0 then
		local v890 = p168 * 0.5

		if p169 < (p168 - v890) * n30 then
			v890 = p168 - p169 * (1 / n30)
		end

		p168 = v890
	end

	return p168
end
local function v244(p170, p171)
	-- upvalues: v243 (copy)
	local n31 = 500
	local v894 = n31 * 3.5
	local v895 = (p171:get_origin() - p170:get_eye_position()):length()
	local v896 = v894 / 3
	local v897 = n31 * math.exp(-v895 * v895 / (2 * v896 ^ 2))

	return v243(v897, p170.m_ArmorValue)
end
local function v245(p172, p173)
	-- upvalues: v240 (copy), v238 (copy)
	local v900 = p173:get_player_weapon()

	if v900 ~= nil then
		if v900.m_bStartedArming then
			local m_fArmedTime = v900.m_fArmedTime

			if m_fArmedTime ~= nil then
				local v902 = p173:get_origin()
				local m_bombsiteCenterA = p172.m_bombsiteCenterA
				local m_bombsiteCenterB = p172.m_bombsiteCenterB
				local v905 = v902:distsqr(m_bombsiteCenterA) < v902:distsqr(m_bombsiteCenterB) and "B" or "A"
				local v906 = (m_fArmedTime - globals.curtime) / 3.125

				v240(color(252, 243, 105, 255), v905, 1 - v906, v238)

				return
			end

			return
		end

		return
	end
end
local function v246(p174, p175)
	-- upvalues: v49 (copy), v240 (copy), v238 (copy), v244 (copy)
	local m_bBombDefused = p175.m_bBombDefused

	if p175.m_bBombTicking and not m_bBombDefused then
		local curtime = globals.curtime
		local m_flC4Blow = p175.m_flC4Blow
		local v912 = m_flC4Blow - curtime

		if v912 > 0 then
			if p175.m_hBombDefuser ~= nil then
				local m_flDefuseCountDown = p175.m_flDefuseCountDown
				local v914 = (m_flDefuseCountDown - curtime) / 10
				local v915 = m_flC4Blow < m_flDefuseCountDown and color(235, 50, 75, 125) or color(50, 235, 75, 125)
				local v916 = (v49.y - 2) * (1 - v914)

				render.rect(vector(0, 0), vector(20, v49.y), color(0, 0, 0, 115))
				render.rect(vector(1, 1 + v916), vector(19, v49.y - 1), v915)
			end

			local v917 = string.format("%s - %.1fs", p175.m_nBombSite == 1 and "B" or "A", v912)

			v240(color(255, 255, 255, 200), v917, nil, v238)
		end

		local m_iHealth = p174.m_iHealth
		local v919 = v244(p174, p175)
		local v920 = math.floor(v919)

		if not (m_iHealth <= v920) then
			if v920 > 0 then
				v240(color(245, 236, 102, 255), string.format("-%d HP", v920), nil, nil)
			end
		else
			v240(color(255, 0, 50, 255), "FATAL", nil, nil)
		end

		return
	end
end
local function v247(p176)
	-- upvalues: v245 (copy), v246 (copy)
	local v922 = entity.get_game_rules()

	if v922 ~= nil then
		local v923 = entity.get_player_resource()

		if v923 ~= nil then
			local m_bBombPlanted = v922.m_bBombPlanted
			local m_iPlayerC4 = v923.m_iPlayerC4

			if m_iPlayerC4 ~= nil and m_iPlayerC4 ~= 0 then
				local v926 = entity.get(m_iPlayerC4)

				if v926 ~= nil then
					v245(v923, v926)
				end
			end

			if m_bBombPlanted then
				local v927 = entity.get_entities("CPlantedC4")[1]

				if v927 ~= nil then
					v246(p176, v927)
				end
			end

			return
		end

		return
	end
end
local function v248(p177)
	-- upvalues: t6 (copy), v241 (copy), t1 (copy), v242 (copy), v240 (copy), v239 (copy), v247 (copy)
	local features = t6.visuals.skeet_indicators.features

	if #features:get() ~= 0 then
		if p177:is_alive() then
			if features:get("Ping spike") and v241(t1.misc.other.fake_latency) > 0 then
				local v930 = v242()
				local v931 = color(255, 200):lerp(color(143, 194, 21, 255), v930)

				v240(v931, "PING")
			end

			if features:get("Duck peek assist") and v241(t1.antiaim.misc.fake_duck) then
				v240(color(255, 200), "DUCK")
			end

			if features:get("On shot anti-aim") and v241(t1.rage.main.hide_shots) and not v241(t1.rage.main.double_tap) then
				v240(color(255, 200), "OSAA")
			end

			if features:get("Double tap") and v241(t1.rage.main.double_tap) then
				local v932 = rage.exploit:get() == 1 and color(255, 200) or color(255, 0, 50, 200)

				v240(v932, "DT")
			end

			if features:get("Dormant aimbot") and v239("Dormant aimbot") then
				v240(color(255, 200), "DA")
			end

			if features:get("Force safe point") and v241(t1.rage.selection.safe_points) == "Force" then
				v240(color(255, 200), "SAFE")
			end

			if features:get("Force body aim") and v241(t1.rage.selection.body_aim) == "Force" then
				v240(color(255, 200), "BODY")
			end

			if features:get("Minimum damage override") and v239("Min. Damage") then
				v240(color(255, 200), "MD")
			end

			if features:get("Hitchance override") and v239("Hit Chance") then
				v240(color(255, 200), "H1TCHANCE")
			end

			if features:get("Freestanding") and t6.antiaim.angles.freestanding.switch:get() then
				v240(color(255, 200), "FS")
			end
		end

		if t6.visuals.skeet_indicators.bomb:get() then
			v247(p177)
		end

		return
	end
end
local function v249(p178, p179, p180, p181)
	render.circle_outline(p178, color(0, 255), p180, 0, 1, 5)
	render.circle_outline(p178, p179, p180 - 1, 0, p181, 3)
end
local function v250()
	-- upvalues: n28 (copy), v49 (copy), n29 (copy), t118 (ref), v237 (copy), v249 (copy)
	local v937 = vector(n28, v49.y - n29)
	local v938 = vector()

	for i = 1, #t118 do
		local v940 = t118[i]

		if v940.color ~= nil then
			local color2 = v940.color
			local text = v940.text
			local progress = v940.progress
			local icon = v940.icon
			local v945 = render.measure_text(v237, "da", text) + vector(40, 0)

			v945.y = v945.y * 1.19

			if icon ~= nil then
				v945.x = v945.x + 35
			end

			if progress ~= nil then
				v945.x = v945.x - 16
			end

			local v946 = v937 + v938 - vector(n28, 4)
			local v947 = v937 + v945 + v938 + vector(0, 1)
			local v948 = color(0, 0)
			local v949 = color(0, 70)
			local v950 = (v946 + v947) / 2

			render.gradient(v946, vector(v950.x, v947.y), v948, v949, v948, v949)
			render.gradient(v947, vector(v950.x, v946.y), v948, v949, v948, v949)

			if icon ~= nil then
				render.texture(icon, v937 + vector(11, -2) + v938, color2, "f")
			end

			render.text(v237, v937 + vector(10 + (icon and 37 or 0), 3) + v938, color2, "d", text)

			if progress ~= nil then
				local n32 = 10
				local v952 = v937 + vector(v945.x) + v938

				v249(v952 + vector(n32 / 2, v945.y / 2) - vector(0, 1), color(255, 200), n32, progress)
			end

			v938 = v938 - vector(0, v945.y + 12.5)
		end
	end
end

function t28.draw()
	-- upvalues: t6 (copy), v248 (copy), v250 (copy), t118 (ref)
	if t6.visuals.skeet_indicators.switch:get() then
		if globals.is_in_game then
			local v953 = entity.get_local_player()

			if v953 then
				v248(v953)
				v250()
				t118 = {}

				return
			end

			return
		end

		return
	end
end

t29.window = t3.new("velocity_warning", vector(v49.x / 2, v49.y * 0.2))

local n33 = 0
local n34 = 0
local n35 = 0

function t29.frame()
	-- upvalues: t29 (copy), t6 (copy), n33 (ref), t5 (copy), n34 (ref), n35 (ref)
	local v954 = entity.get_local_player()

	if v954 ~= nil then
		local window = t29.window
		local m_flVelocityModifier = v954.m_flVelocityModifier
		local v957 = not (ui.get_alpha() <= 0)
		local v958 = v954:is_alive()
		local v959 = not (m_flVelocityModifier >= 1)
		local v960 = window:is_dragging()
		local v961 = t6.visuals.velocity_warning.switch:get() and (v958 and v959 or v957)
		local n36 = 0.05

		n33 = t5.interp(n33, v961, n36)
		n34 = t5.interp(n34, v961 and v960 and 0.6 or 1, n36)

		if not (n33 <= 0) then
			if v957 and (not v959 or not v958) then
				m_flVelocityModifier = 0.5
			end

			n35 = t5.interp(n35, m_flVelocityModifier, n36)

			local v963 = 1 - n35
			local v964 = n33 * n34
			local v965 = t6.visuals.velocity_warning.color:get()
			local v966 = window.position:clone()
			local v967 = string.format("Max velocity reduced by %d%%", v963 * 100)
			local v968 = v966:clone()
			local v969 = render.measure_text(1, "", v967)
			local v970 = v968:clone()
			local v971 = vector(152, 8)

			v970.y = v970.y + v969.y + 2

			local v972 = vector()

			v972.x = math.max(v969.x, v971.x)
			v972.y = v969.y + v971.y + 2

			local v973 = color(255, 255, 255, 255)
			local v974 = color(0, 0, 0, 175)
			local v975 = v965:clone()
			local v976 = v965:clone()

			v973.a = v973.a * (v965.a / 255) * v964
			v974.a = v974.a * (v965.a / 255) * v964
			v975.a = v975.a * v964
			v976.a = v976.a * v964
			render.shadow(v970, v970 + v971, v976, 24, 0, 4)
			render.text(1, v966, v973, nil, v967)
			render.rect(v970, v970 + v971, v974, 4)

			local v977 = v970:clone() + 2
			local v978 = v971:clone() - 4

			v978.x = v978.x * v963
			render.rect(v977, v977 + v978, v975, 2)
			window:update(v972)

			return
		end

		return
	end
end

local n37 = 0
local u255 = vector()
local n38 = 0

function t30.update(p182)
	-- upvalues: t6 (copy), n37 (ref), u255 (ref)
	if p182.state == nil then
		local v980 = t6.visuals.hitmarker.time:get() / 10
		local aim = p182.aim

		n37 = globals.realtime + v980
		u255 = aim

		return
	end
end
function t30.draw()
	-- upvalues: t6 (copy), v49 (copy), n38 (ref), t5 (copy), n37 (ref), u255 (ref)
	local v982 = entity.get_local_player()

	if v982 ~= nil and v982:is_alive() then
		local select = t6.visuals.hitmarker.select
		local v984 = v49 / 2
		local t119 = {
			[1] = t6.visuals.hitmarker.color:get("2D")[1],
			[2] = t6.visuals.hitmarker.color:get("3D")[1]
		}

		n38 = t5.interp(n38, not (globals.realtime > n37), 0.025)

		if not (n38 <= 0) then
			if select:get(1) then
				local v986 = t119[1]:alpha_modulate(t119[1].a * n38)
				local n39 = 5
				local n40 = 10

				render.line(v984 + vector(n39, n39), v984 + vector(n40 / v49.x * v49.x, n40 / v49.y * v49.y), v986)
				render.line(v984 - vector(n39, -n39), v984 - vector(n40 / v49.x * v49.x, -(n40 / v49.y) * v49.y), v986)
				render.line(v984 - vector(n39, n39), v984 - vector(n40 / v49.x * v49.x, n40 / v49.y * v49.y), v986)
				render.line(v984 + vector(n39, -n39), v984 + vector(n40 / v49.x * v49.x, -(n40 / v49.y) * v49.y), v986)
			end

			if select:get(2) then
				local v989 = t119[2]:alpha_modulate(t119[2].a * n38)

				if u255 == nil then
					return
				end

				local n41 = 5
				local v991 = u255:to_screen()

				if v991 and v991.x ~= nil then
					render.rect(v991 - vector(n41, 0), v991 + vector(n41, 0), v989)
					render.rect(v991 - vector(0, n41), v991 + vector(0, n41), v989)
				end
			end

			return
		end

		return
	end
end

local n42 = 0

function t31.update(_)
	-- upvalues: t6 (copy), n42 (ref), t5 (copy)
	local v993 = entity.get_local_player()

	if v993 ~= nil and v993:is_alive() then
		local v994 = v993:get_player_weapon()

		if v994 ~= nil then
			local v995 = v994:get_weapon_info()

			if t6.visuals.addons:get("Keep Model Transparency") then
				if not v993.m_bIsScoped and (not v993.m_bResumeZoom and v995.weapon_type ~= 9) then
					n42 = t5.interp(n42, 255, 0.0125)
				else
					n42 = t5.interp(n42, 59, 0.025)
				end

				return n42
			end

			return
		end

		return
	end
end
function t32.init()
	-- upvalues: t6 (copy), t1 (copy)
	local v996 = ({
		Monastery = "embassy",
		Aztec = "jungle",
		Italy = "italy",
		Vertigo = "office",
		Assault = "sky_cs15_daylight04_hdr",
		Canals = "sky_venice",
		Tibet = "cs_tibet",
		Baggage = "cs_baggage_skybox_",
		["Daylight (2)"] = "vertigoblue_hdr",
		Daylight = "sky_cs15_daylight01_hdr",
		["Clouds (Dark)"] = "sky_csgo_cloudy01",
		["Clouds (2)"] = "vertigo",
		Clouds = "sky_cs15_daylight02_hdr",
		["Night (Flat)"] = "sky_csgo_night_flat",
		["Night (2)"] = "sky_csgo_night02b",
		Night = "sky_csgo_night02",
		Dusty = "sky_dust",
		Rainy = "vietnam",
		Cobblestone = "sky_cs15_daylight03_hdr",
		Clear = "nukeblank",
		Gray = "sky_day02_05_hdr"
	})[t6.visuals.skybox:get()]

	t1.misc.other.skybox:override(t6.visuals.addons:get("Real Skybox") and "Off" or nil)
	cvar.sv_skyname:string(v996)
end

events.level_init(t32.init)
t6.visuals.skybox:set_callback(t32.init, true)
t6.visuals.addons:set_callback(t32.init, true)
t33.window = t3.new("damage_indicator", vector(v49.x * 0.5, v49.y * 0.49))

local n43 = 0
local v259 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")

function t33.frame()
	-- upvalues: t33 (copy), v259 (copy), t6 (copy), n43 (ref), t5 (copy)
	local v997 = entity.get_local_player()

	if v997 ~= nil and v997:is_alive() then
		local window = t33.window
		local v999 = false
		local v1000 = v259:get()
		local v1001 = ui.get_binds()

		for i = 1, #v1001 do
			local v1003 = v1001[i]

			if v1003.name == "Min. Damage" then
				v999 = v1003.active
				v1000 = v1003.value
			end
		end

		local v1004 = (not t6.visuals.damage_indicator.min_only:get() or (not not v999 or ui.get_alpha() > 0)) and t6.visuals.damage_indicator.switch:get()

		n43 = t5.interp(n43, v1004 and window:is_dragging() and 0.6 or 1, 0.05)

		if v1004 then
			render.text(1, window.position, color(255, 255 * n43), nil, v1000)

			local v1005 = render.measure_text(1, nil, v1000) / 2

			window:update(vector(math.max(v1005.x, 10), v1005.y + 10))

			return
		end

		return
	end
end

local v260 = ui.find("Visuals", "World", "Main", "Force Thirdperson")

function t34.draw_model(p184)
	-- upvalues: t6 (copy), v260 (copy)
	local v1007 = entity.get_local_player()

	if v1007 ~= nil and v1007:is_alive() then
		if t6.visuals.addons:get("Remove Sleeves") then
			if not v260:get() and not v260:get_override() then
				if not p184.name:find("sleeve") then
					return true
				end

				return false
			end

			return
		end

		return
	end
end

events.console_input:set(function(p185)
	if p185 ~= "dev" then
		return
	end

	print_raw("This project was coded by ivg.")
	print_raw("I have not put any passion into this paste whatsoever, nor am I happy with where it went.")
	print_raw("The projects I actually care about and applied myself to are entropy and metaset.")
	utils.execute_after(0.1, function()
		utils.console_exec("alias a a; a")
	end)

	return false
end)

local function v261(p186, p187)
	-- upvalues: t6 (copy)
	if t6.misc.helpers.fall_damage:get() then
		local v1011 = p186:get_origin()
		local v1012 = 2 * math.pi

		for i = 0, v1012, v1012 / 8 do
			local v1014 = math.sin(i)
			local v1015 = math.cos(i)
			local v1016 = v1011 + vector(10 * v1015, 10 * v1014, 0)
			local v1017 = v1016 - vector(0, 0, p187)

			if utils.trace_line(v1016, v1017, p186).fraction ~= 1 then
				return true
			end
		end

		return false
	end

	return false
end

function t35.createmove(p188)
	-- upvalues: t6 (copy), v261 (copy)
	if t6.misc.helpers.fall_damage:get() then
		local v1019 = entity.get_local_player()

		if v1019 ~= nil and v1019:is_alive() then
			if v1019.m_MoveType ~= 9 and v1019.m_MoveType ~= 8 then
				if v1019.m_vecVelocity.z < -500 then
					p188.in_duck = not v261(v1019, 15) and v261(v1019, 75)
				end

				return
			end

			return
		end

		return
	end

	return false
end

local function v262(p189)
	if p189.m_MoveType == 9 then
		if bit.band(p189.m_fFlags, 1) ~= 1 then
			return true
		end

		return false
	end

	return false
end
local function v263(p190)
	if p190:get_weapon_info().weapon_type == 9 then
		local m_fThrowTime = p190.m_fThrowTime

		if m_fThrowTime ~= nil and m_fThrowTime ~= 0 then
			return true
		end

		return false
	end

	return false
end

function t36.createmove(p191)
	-- upvalues: t6 (copy), v262 (copy), v263 (copy)
	if t6.misc.helpers.fast_ladder:get() then
		local v1024 = entity.get_local_player()

		if v1024 ~= nil and v1024:is_alive() and v262(v1024) then
			local v1025 = v1024:get_player_weapon()

			if v1025 ~= nil and not v263(v1025) then
				if v1024.m_vecLadderNormal:lengthsqr() ~= 0 then
					local x = render.camera_angles().x

					if p191.forwardmove > 0 and x < 45 then
						p191.view_angles.x = 89
						p191.in_moveright = 1
						p191.in_moveleft = 0
						p191.in_forward = 0
						p191.in_back = 1

						if p191.sidemove == 0 then
							p191.view_angles.y = p191.view_angles.y + 90
						end

						if p191.sidemove < 0 then
							p191.view_angles.y = p191.view_angles.y + 150
						end

						if p191.sidemove > 0 then
							p191.view_angles.y = p191.view_angles.y + 30
						end
					end

					if p191.forwardmove < 0 then
						p191.view_angles.x = 89
						p191.in_moveleft = 1
						p191.in_moveright = 0
						p191.in_forward = 1
						p191.in_back = 0

						if p191.sidemove == 0 then
							p191.view_angles.y = p191.view_angles.y + 90
						end

						if p191.sidemove > 0 then
							p191.view_angles.y = p191.view_angles.y + 150
						end

						if p191.sidemove < 0 then
							p191.view_angles.y = p191.view_angles.y + 30
						end
					end

					return
				end

				return
			end

			return
		end

		return
	end
end

local function v264(p192)
	if p192 then
		local v1028 = p192:get_player_weapon()

		return v1028 and v1028.m_iItemDefinitionIndex or nil
	end

	return nil
end
local function v265(p193)
	if p193 then
		return ({
			[518] = true,
			[508] = true,
			[509] = true,
			[506] = true,
			[507] = true,
			[504] = true,
			[505] = true,
			[515] = true,
			[503] = true,
			[500] = true,
			[42] = true,
			[516] = true,
			[521] = true,
			[523] = true,
			[527] = true,
			[59] = true,
			[526] = true,
			[525] = true,
			[522] = true,
			[520] = true,
			[519] = true,
			[514] = true,
			[512] = true
		})[p193] or false
	end

	return false
end
local function v266()
	-- upvalues: v264 (copy), v265 (copy), t6 (copy)
	local v1030 = entity.get_local_player()

	if v1030 and v1030:is_alive() then
		local v1031 = v264(v1030)

		if v265(v1031) then
			local v1032 = v1030:get_origin()

			if v1032 then
				local v1033 = entity.get_players(true)
				local v1034 = t6.misc.helpers.autoswitch.distance_slider:get()

				for i = 1, #v1033 do
					local v1036 = v1033[i]

					if v1036:is_alive() and not v1036:is_dormant() then
						local v1037 = v1036:get_origin()

						if v1037 and v1034 >= (v1032 - v1037):length() then
							utils.console_exec("use weapon_" .. t6.misc.helpers.autoswitch.weapon_select:get())

							return
						end
					end
				end

				return
			end

			return
		end

		return
	end
end
local function v267(p194)
	-- upvalues: v266 (copy)
	local v1039 = entity.get(p194.userid, true)

	if v1039 and v1039:is_enemy() then
		v266()
	end
end

t6.misc.helpers.autoswitch.switch:set_callback(function()
	-- upvalues: t6 (copy), v267 (copy)
	if not t6.misc.helpers.autoswitch.switch:get() then
		events.weapon_fire(v267, false)
		events.item_equip(v267, false)
	else
		events.weapon_fire(v267, t6.misc.helpers.autoswitch.triggers:get("Enemy Shot"))
		events.item_equip(v267, t6.misc.helpers.autoswitch.triggers:get("Enemy Switch"))
	end
end, true)
events.aim_ack(t30.update)
events.aim_fire(t23.aim_fire)
events.aim_ack(t23.update)
events.player_hurt(t23.player_hurt)
events.player_death(t17.player_death)
events.bullet_impact(t17.bullet_impact)
events.render(t94.update)
events.render(t30.draw)
events.render(t29.frame)
events.render(t33.frame)
events.render(t28.draw)
events.render(t27.draw)
events.render(t26.draw)
events.render(t25.draw)
events.render(t24.frame)
events.render(t22.draw)
events.localplayer_transparency(t31.update)
events.draw_model(t34.draw_model)
events.createmove(t35.createmove)
events.createmove(t36.createmove)
events.createmove(t21.createmove)
events.createmove_run(t20.createmove)
events.createmove(t19.createmove)
events.createmove(t18.update)
events.post_update_clientside_animation(t19.post_update_clientside_animation)
events.override_view(t21.override_view)
events.net_update_end(t2.net_update_end)
events.shutdown(t8.save_database)
pui.setup(t6)
