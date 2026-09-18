local v8, t1, t2, t3, t11, t12, t14, u31, u41, t20, t23, t24, t25, t26, t29, t92, t93, t94, t97, t100, t102, t108, gamesense_indicators, n141, n142, n143, n144, n145, v758, t189

do
	local t19

	do
		local csgo_weapons, ai_peek, v413, v414, t138, v416, v417, u419, n31, n32, t139, t140, t141

		do
			local v6, n11, u256, u257, n12, n13, u260, t109, n14, n15, t110, t112, t114, t120, t122, t123, t124, t125, t126, t127, t129, t130, t132, n22

			do
				local t95, t116

				do
					local base64 = require("neverlose/base64")

					csgo_weapons = require("neverlose/csgo_weapons")

					local clipboard = require("neverlose/clipboard")

					do
						local get = clipboard.get

						function clipboard.get(...)
							-- upvalues: get (copy)
							local v899 = get(...)
							local v900 = v899:find("\000")

							if v900 == nil then
								return v899
							end

							return v899:sub(1, v900 - 1)
						end
					end

					local s1 = "\226\128\138"

					function v6(p1, p2)
						for i = 1, #p1 do
							if p2 == p1[i] then
								return i
							end
						end

						return nil
					end

					local function v7(...)
						local s2 = ""

						for i = 1, select("#", ...) do
							s2 = s2 .. select(i, ...)
						end

						return s2
					end

					function v8(p3)
						local v907

						if not (p3 > 0) then
							v907 = math.ceil(p3 - 0.5)
						else
							v907 = math.floor(p3 + 0.5)
						end

						return v907
					end

					t1 = {}

					do
						local v10 = common.get_username()

						t1.name = "angelwings"
						t1.user = v10
					end

					t1.build = "exclusive"
					t2 = {
						lerp = function(p4, p5, p6)
							return p4 + p6 * (p5 - p4)
						end,
						extrapolate = function(p7, p8, p9)
							return p7 + p8 * (p9 * globals.tickinterval)
						end,
						closest_ray_point = function(p10, p11, p12, p13)
							local v918 = p12 - p10
							local v919 = p11 - p10
							local v920 = v919.x * v919.x + v919.y * v919.y
							local v921 = (v918.x * v919.x + v918.y * v919.y) / v920

							if p13 then
								if v921 <= 0 then
									return p10
								end

								if v921 >= 1 then
									return p11
								end
							end

							return p10 + v921 * v919
						end
					}
					t3 = {
						antiaim = {
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
						ragebot = {
							main = {
								hide_shots = {
									ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
									ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
								},
								double_tap = {
									ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
									ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
									ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"),
									ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"),
									ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Quick-Switch")
								}
							},
							selection = {
								min_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
							}
						}
					}

					do
						local t4 = {}
						local t7

						do
							local t6

							do
								local t5 = {}

								t5.__index = t5

								function t5.new(p14)
									return setmetatable({
										count = 0,
										list = {}
									}, p14)
								end

								function t5.__len(p15)
									return p15.count
								end

								function t5.__call(p16, p17, p18)
									if p18 ~= false then
										return p16:set(p17)
									end

									return p16:unset(p17)
								end

								function t5.unset(p19, p20)
									-- upvalues: v6 (copy)
									local v929 = v6(p19.list, p20)

									if v929 ~= nil then
										p19.count = p19.count - 1
										table.remove(p19.list, v929)
									end

									return p19
								end

								function t5.set(p21, p22, p23)
									-- upvalues: v6 (copy)
									if p23 ~= false then
										if not v6(p21.list, p22) then
											p21.count = p21.count + 1
											table.insert(p21.list, p22)
										end

										return p21
									end

									return p21:unset(p22)
								end

								function t5.fire(p24, ...)
									local list = p24.list

									for i = 1, #list do
										list[i](...)
									end

									return p24
								end

								t6 = {}

								local function v16(p25, p26)
									-- upvalues: t5 (copy)
									local v938 = rawget(p25, p26)

									if v938 == nil then
										v938 = t5:new()
										rawset(p25, p26, v938)
									end

									return v938
								end

								function t6.new(_)
									-- upvalues: v16 (copy)
									return setmetatable({}, {
										__index = v16
									})
								end
							end

							function t4.new(_)
								-- upvalues: t6 (copy)
								return t6:new()
							end

							t7 = {}

							local v18 = bit.lshift(1, 0)
							local t8 = {}

							t8.__index = t8

							function t8.__newindex(p29, p30, p31)
								p29[0][p30] = p31
							end

							function t8.__index(p32, p33)
								-- upvalues: t8 (copy), v18 (copy)
								local v946 = rawget(t8, p33)

								if v946 == nil then
									local v947 = rawget(p32, p33)

									if v947 == nil then
										local v948 = p32[0][p33]

										if v948 ~= nil then
											if type(v948) ~= "function" then
												return v948
											end

											local function v949(...)
												-- upvalues: p32 (copy), v18 (copy), v948 (copy)
												local t9 = {}
												local v3439 = select("#", ...)

												for i = 1, v3439 do
													t9[i] = select(i, ...)
												end

												if bit.band(p32.flags, v18) ~= 0 then
													p32:fire_callbacks(t9, v3439)
												end

												if t9[1] == p32 then
													t9[1] = p32[0]
												end

												return v948(unpack(t9, 1, v3439))
											end

											rawset(p32, p33, v949)

											return v949
										end

										return nil
									end

									return v947
								end

								return v946
							end

							function t8.new(p34, p35)
								-- upvalues: v18 (copy)
								local t10 = {
									flags = 0,
									[0] = p35,
									callbacks = {}
								}

								t10.flags = bit.bor(t10.flags, v18)

								return setmetatable(t10, p34)
							end

							function t8.fire_callbacks(p36, ...)
								local v954 = rawget(p36, "callbacks")

								for i = 1, #v954 do
									v954[i](...)
								end

								return p36
							end

							function t8.get_flag(p37, p38)
								return bit.band(p37.flags, p38) ~= 0
							end

							function t8.set_flag(p39, p40, p41)
								if not p41 then
									p39.flags = bit.band(p39.flags, bit.bnot(p40))
								else
									p39.flags = bit.bor(p39.flags, p40)
								end

								return p39
							end

							function t8.set_callback(p42, p43)
								-- upvalues: v6 (copy)
								local v963 = rawget(p42, "callbacks")

								if v6(v963, p43) == nil then
									table.insert(v963, p43)
								end

								return p42
							end

							function t8.unset_callback(p44, p45)
								-- upvalues: v6 (copy)
								local v966 = rawget(p44, "callbacks")
								local v967 = v6(v966, p45)

								if v967 ~= nil then
									table.remove(v966, v967)
								end

								return p44
							end

							t7.group_flags = {
								callbacks = v18
							}

							function t7.cast(p46)
								-- upvalues: t8 (copy)
								return t8:new(p46)
							end

							function t7.create(...)
								-- upvalues: t8 (copy)
								return t8:new(ui.create(...))
							end
						end

						t11 = {}

						do
							local s3 = "ui\\beepclear.wav"
							local s4 = "resource\\warning.wav"
							local play = cvar.play

							local function v24(p47, p48)
								-- upvalues: t1 (copy)
								local v971 = string.format("\a%s[%s]\aDEFAULT", p47:to_hex(), t1.name)

								print_raw(v971 .. " · " .. p48)
							end

							function t11.log(p49)
								-- upvalues: v24 (copy)
								v24(color(255, 255, 255, 200), p49)
							end

							function t11.success(p50)
								-- upvalues: v24 (copy), play (copy), s3 (copy)
								v24(color(250, 137, 250, 255), p50)
								play:call(s3)
							end

							function t11.error(p51)
								-- upvalues: v24 (copy), play (copy), s4 (copy)
								v24(color(250, 0, 50, 255), p51)
								play:call(s4)
							end
						end

						t12 = {}

						do
							local n2

							do
								local render

								do
									local t13 = {}

									function t12.get()
										-- upvalues: t13 (copy)
										return t13
									end

									function t12.add(p52, p53, p54)
										-- upvalues: t13 (copy)
										t13[p52] = {
											[1] = p53,
											[2] = p54
										}
									end

									t14 = {}

									local function v28(p55, p56, p57, p58)
										return p57 * p55 / p58 + p56
									end
									local function v29()
										return globals.frametime
									end
									local function v30(p59, p60, p61, p62, p63)
										if not (p62 <= 0) then
											if not (p63 <= p62) then
												local v987 = p59(p62, p60, p61 - p60, p63)

												if type(v987) == "number" then
													if math.abs(p61 - v987) < 0.001 then
														return p61
													end

													local v988 = v987 % 1

													if v988 < 0.001 then
														return math.floor(v987)
													end

													if v988 > 0.999 then
														return math.ceil(v987)
													end
												end

												return v987
											end

											return p61
										end

										return p61
									end

									function t14.interp(p64, p65, p66, p67)
										-- upvalues: v28 (copy), v30 (copy), v29 (copy)
										if not p67 then
											p67 = v28
										end

										if type(p65) == "boolean" then
											p65 = p65 and 1 or 0
										end

										return v30(p67, p64, p65, v29(), p66)
									end

									u31 = nil
									render = _G.render

									local _ = math.floor
								end

								local v34 = color(0, 0, 0, 0)
								local n1 = 1

								local function v36(p68)
									-- upvalues: n1 (copy)
									if n1 ~= 1 then
										return p68 * n1
									end

									return p68
								end

								n2 = 1

								local t15 = {}
								local alpha_modulate = color().alpha_modulate

								local function v40(p69, p70)
									-- upvalues: n2 (ref), v34 (copy), alpha_modulate (copy)
									if n2 ~= 1 then
										if p70 or n2 ~= 0 then
											return alpha_modulate(p69, n2, true)
										end

										return v34
									end

									return p69
								end

								u31 = setmetatable({
									cheap = false,
									dpi = render.get_scale(2),
									push_alpha = function(p71)
										-- upvalues: t15 (copy), n2 (ref)
										local v997 = #t15

										if v997 > 255 then
											error("alpha stack exceeded 255 objects, report to developers")
										end

										t15[v997 + 1] = p71
										n2 = n2 * t15[v997 + 1] * (t15[v997] or 1)
									end,
									pop_alpha = function()
										-- upvalues: t15 (copy), n2 (ref)
										local v998 = #t15
										local v999 = t15
										local v1000 = v998 - 1

										v999[v998] = nil
										n2 = v1000 == 0 and 1 or t15[v1000] * (t15[v1000 - 1] or 1)
									end,
									get_alpha = function(p72)
										-- upvalues: t15 (copy), n2 (ref)
										if not p72 then
											return n2, #t15
										end

										return t15[p72]
									end,
									screen_size = function(p73)
										-- upvalues: render (copy), n1 (copy)
										return render.screen_size() / (p73 and 1 or n1)
									end,
									measure_text = function(p74, ...)
										-- upvalues: render (copy), n1 (copy)
										return render.measure_text(p74, ...) / n1
									end,
									load_font = function(p75, p76, p77)
										-- upvalues: render (copy)
										return render.load_font(p75, p76, p77 or "")
									end,
									text = function(p78, p79, p80, p81, ...)
										-- upvalues: render (copy), v36 (copy), v40 (copy), u31 (ref)
										render.text(p78, v36(p79), v40(p80), p81, ...)

										if measure ~= true then
											return
										end

										return u31.measure_text(p78, p81, ...)
									end,
									blur = function(p82, p83, p84, p85, p86)
										-- upvalues: u31 (ref), v36 (copy), n2 (ref), render (copy)
										if not u31.cheap then
											if type(p86) ~= "table" then
												p86 = v36(p86 or 0)
											else
												for i = 1, 4 do
													p86[i] = v36(p86[i] or 0)
												end
											end

											local v1017 = (p85 or 1) * n2
											local v1018 = v36(p84 or 2)

											if v1017 > 0 and v1018 > 0 then
												render.blur(v36(p82), v36(p83), v1018, v1017, p86)
											end

											return
										end
									end,
									shadow = function(p87, p88, p89, p90, p91, p92)
										-- upvalues: u31 (ref), render (copy), v36 (copy), v40 (copy)
										if not u31.cheap then
											render.shadow(v36(p87), v36(p88), v40(p89), v36(p90 or 16), v36(p91 or 0),
												v36(p92 or 0))

											return
										end
									end,
									line = function(p93, p94, p95)
										-- upvalues: render (copy), v36 (copy), v40 (copy)
										render.line(v36(p93), v36(p94), v40(p95))
									end,
									rect = function(p96, p97, p98, p99, p100)
										-- upvalues: v36 (copy), render (copy), v40 (copy)
										if type(p99) ~= "table" then
											p99 = v36(p99 or 0)
										else
											for i = 1, 4 do
												p99[i] = v36(p99[i] or 0)
											end
										end

										render.rect(v36(p96), v36(p97), v40(p98), p99, p100 or false)
									end,
									rect_outline = function(p101, p102, p103, p104, p105, p106)
										-- upvalues: v36 (copy), render (copy), v40 (copy)
										if type(p105) ~= "table" then
											p105 = v36(p105 or 0)
										else
											for i = 1, 4 do
												p105[i] = v36(p105[i] or 0)
											end
										end

										render.rect_outline(v36(p101), v36(p102), v40(p103), v36(p104 or 0), p105,
											p106 or false)
									end,
									gradient = function(p107, p108, p109, p110, p111, p112, p113)
										-- upvalues: render (copy), v36 (copy), v40 (copy)
										local v1048 = p111 or p109

										if not p112 then
											p112 = p110
										end

										render.gradient(v36(p107), v36(p108), v40(p109, true), v40(p110, true),
											v40(v1048, true), v40(p112, true), p113 or 0)
									end,
									circle = function(p114, p115, p116, p117, p118)
										-- upvalues: render (copy), v36 (copy), v40 (copy)
										render.circle(v36(p114), v40(p115), v36(p116), p117 or 0, p118 or 1)
									end,
									circle_outline = function(p119, p120, p121, p122, p123, p124)
										-- upvalues: render (copy), v36 (copy), v40 (copy)
										render.circle_outline(v36(p119), v40(p120), v36(p121), p122 or 0, p123 or 1,
											v36(p124 or 1))
									end,
									circle_3d = function(p125, p126, p127, p128, p129)
										-- upvalues: render (copy), v40 (copy)
										render.circle_3d(p125, v40(p126), p127, p128 or 0, p129 or 1, false)
									end,
									circle_3d_outline = function(p130, p131, p132, p133, p134, p135)
										-- upvalues: render (copy), v40 (copy), v36 (copy)
										render.circle_3d_outline(p130, v40(p131), p132, p133 or 0, p134 or 1,
											v36(p135 or 1))
									end,
									circle_3d_gradient = function(p136, p137, p138, p139, p140, p141, p142)
										-- upvalues: render (copy), v40 (copy), v36 (copy)
										render.circle_3d_gradient(p136, v40(p137), v40(p138), p139, p140 or 0, p141 or 1,
											v36(p142 or 1))
									end,
									texture = function(p143, p144, p145, p146, p147, p148)
										-- upvalues: render (copy), v36 (copy), v40 (copy)
										if p143 then
											if not p146 then
												p146 = color()
											end

											render.texture(p143, v36(p144), v36(p145 or vector(p143.width, p143.height)),
												v40(p146), p147 or "", p148 or 0)

											return
										end
									end,
									push_clip_rect = function(p149, p150, p151)
										-- upvalues: render (copy), v36 (copy)
										render.push_clip_rect(v36(p149), v36(p150), p151 or false)
									end
								}, {
									__index = render
								})
							end

							u41 = nil

							local u42 = nil
							local v43 = color(255, 255, 255, 255)

							local function v44(p152, p153, p154)
								return p152.x >= p153.x and
									(p152.x <= p154.x and (p152.y >= p153.y and not (p152.y > p154.y)))
							end

							local v45 = t7.create("##DRAG")

							v45:visibility(false)

							local v46 = u31.screen_size()

							u41 = {
								data = {},
								in_bounds = v44,
								new = function(p155, p156)
									-- upvalues: u41 (ref), v45 (copy), v46 (copy), v8 (copy)
									if type(p156) ~= "table" then
										p156 = {}
									end

									u41[p155.id] = {
										x = v45:slider(p155.id .. "::x", 0, 10000, p155.pos.x / v46.x * 10000),
										y = v45:slider(p155.id .. "::y", 0, 10000, p155.pos.y / v46.y * 10000)
									}
									u41[p155.id].x:set_callback(function(p157)
										-- upvalues: p155 (copy), v8 (copy), v46 (copy)
										p155.pos.x = v8(p157:get() * 0.0001 * v46.x)
									end, true)
									u41[p155.id].y:set_callback(function(p158)
										-- upvalues: p155 (copy), v8 (copy), v46 (copy)
										p155.pos.y = v8(p158:get() * 0.0001 * v46.y)
									end, true)
									p155.__drag = {
										active = false,
										locked = false,
										point = vector(),
										progress = {
											[1] = 0,
											[2] = 0,
											[3] = 0,
											[4] = 0
										},
										border = p156.border or {
											[1] = vector(),
											[2] = oscreen
										},
										rulers = p156.rulers or {},
										on_release = p156.on_release,
										on_held = p156.on_held,
										on_active = p156.on_active,
										config = u41[p155.id]
									}
									events.mouse_input:set(function()
										-- upvalues: p155 (copy)
										if not (ui.get_alpha() > 0) or not p155.__drag.hovered and not p155.__drag.active then
											return
										end

										return false
									end)
									events.dpi_change:set(function(_, _, _)
										-- upvalues: u41 (ref), p155 (copy)
										u41[p155.id].x:set(u41[p155.id].x.value)
										u41[p155.id].y:set(u41[p155.id].y.value)
									end)
								end,
								process = function(p162)
									-- upvalues: u31 (ref), v44 (copy), u42 (ref), t14 (ref), v43 (copy), v46 (copy)
									local __drag = p162.__drag

									if not __drag.locked and ui.get_alpha() ~= 0 then
										local v1094 = ui.get_mouse_position() / u31.dpi
										local v1095 = ui.get_position()
										local v1096 = ui.get_size()
										local v1097 = ui.get_alpha() > 0 and common.is_button_down(1)
										local v1098 = v44(v1094, p162.pos, p162.pos + p162.size) and
											not v44(v1094, v1095 / u31.dpi, (v1095 + v1096) / u31.dpi)

										if v1097 and __drag.ready == nil then
											local v1099 = p162.pos - v1094

											__drag.init = p162.pos:clone()
											__drag.point = v1099
											__drag.ready = v1098
										end

										if not v1097 or not __drag.ready then
											if not v1097 then
												if __drag.active and __drag.on_release then
													__drag.on_release(p162, __drag)
												end

												__drag.active = false
												u42 = nil
												__drag.aligning = nil
												__drag.init = nil
												__drag.point = nil
												__drag.ready = nil
											end
										else
											if u42 == nil and __drag.on_held then
												__drag.on_held(p162, __drag)
											end

											u42 = __drag.ready and (u42 == nil and p162.id) or u42
											__drag.active = u42 == p162.id
										end

										local v1100 = p162.pos * u31.dpi
										local v1101 = p162.size * u31.dpi

										__drag.hovered = v1098 or __drag.active

										local t16 = {}
										local v1103 = v1100 + v1101 * 0.5
										local v1104 = __drag.point and (__drag.point + v1094) * u31.dpi or v1100

										__drag.progress[1] = t14.interp(__drag.progress[1], __drag.active, 0.1)
										__drag.progress[2] = t14.interp(__drag.progress[2],
											__drag.active or __drag.hovered, 0.1)

										local v1105 = __drag.progress[1]
										local v1106 = __drag.progress[2]

										u31.push_alpha(ui.get_alpha())
										u31.rect(p162.pos - 4, p162.pos + p162.size + 4,
											v43:alpha_modulate(0.1 * (v1106 * 0.65 + 0.35), true), 6)
										u31.rect_outline(p162.pos - 5, p162.pos + p162.size + 5,
											v43:alpha_modulate(0.3 * v1105, true), 1, 7)
										u31.push_alpha(v1105)

										if v1105 > 0 and not common.is_button_down(162) then
											local v1107 = (v1104 + v1101 * 0.5) / u31.dpi

											for _, v in ipairs(__drag.rulers) do
												v[4] = v[4] or {
													[1] = 0
												}

												local v1110 = v[2] / u31.dpi
												local v1111 = not (math.abs(v[1] and v1107.x - v1110.x or v1107.y - v1110.y) >= 10 * u31.dpi)
												local v1112 = v[1] and vector(v1110.x + 1, v[3] / u31.dpi) or
													vector(v[3] / u31.dpi, v1110.y + 1)
												local v1113 = v[1] and 1 or 2

												if not t16[v1113] then
													t16[v1113] = v1111 and
														(v[1] and v1110.x - p162.size.x * 0.5 or v1110.y - p162.size.y * 0.5) or
														nil
												end

												local v1114 = math.abs(v[1] and v1103.x - v1110.x or v1103.y - v1110.y)

												__drag.progress[4] = t14.interp(__drag.progress[4],
													v1111 or not (v1114 >= 10 * u31.dpi), 0.1)

												local v1115 = __drag.progress[4] * 0.35 + 0.1

												u31.rect(v1110, v1112, v43:alpha_modulate(v1115, true))
											end

											if __drag.border[3] then
												local v1116 = utilities.in_bounds(p162.pos, __drag.border[1],
													__drag.border[2] - p162.size * 0.5 - 1)

												__drag.progress[3] = t14.interp(__drag.progress[3], not v1116, 0.1)

												local v1117 = __drag.progress[3]

												u31.rect_outline(__drag.border[1] / u31.dpi, __drag.border[2] / u31.dpi,
													v43:alpha_modulate(v1117 * 0.75 + 0.25, true), 1, 4)
											end
										end

										u31.pop_alpha()
										u31.pop_alpha()

										if __drag.active then
											local v1118 = v1104 / u31.dpi

											if common.is_button_down(160) then
												local v1119 = __drag.init:to(v1118)
												local v1120 = math.abs(v1119.y)
												local v1121 = math.abs(v1119.x)

												if __drag.aligning == nil then
													if not (v1120 > 0.9) then
														if v1121 > 0.9 then
															__drag.aligning = 1
														end
													else
														__drag.aligning = 0
													end
												end

												if __drag.aligning ~= 0 then
													if __drag.aligning == 1 then
														v1118.y = __drag.init.y
														u31.rect(vector(0, v1118.y + p162.size.y * 0.5),
															vector(v46.x, v1118.y + p162.size.y * 0.5 + 1),
															color(255, 64))
													end
												else
													v1118.x = __drag.init.x
													u31.rect(vector(v1118.x + p162.size.x * 0.5, 0),
														vector(v1118.x + p162.size.x * 0.5 + 1, v46.y), color(255, 64))
												end
											end

											local v1122 = t16[1] or v1118.x

											v1118.y = t16[2] or v1118.y
											v1118.x = v1122

											local v1123 = (__drag.border[1] - v1101 * 0.5) / u31.dpi
											local v1124 = (__drag.border[2] - v1101 * 0.5) / u31.dpi

											p162:set_position(
												math.clamp(v1118.x, v1123.x, math.min(v1124.x, v46.x - p162.size.x)),
												(math.clamp(v1118.y, v1123.y, math.min(v1124.y, v46.y - p162.size.y))))

											if __drag.on_active then
												__drag.on_active(p162, __drag, v1118)
											end
										end

										return
									end
								end
							}

							local t17 = nil

							t17 = {
								update = function(_)
									return 1
								end,
								paint = function(_, _, _)
								end,
								set_position = function(p167, p168, p169)
									-- upvalues: u31 (ref)
									local v1132

									if type(p168) ~= "userdata" then
										v1132 = p168
									else
										v1132 = p168.x
										p169 = p168.y
									end

									local v1133 = u31.screen_size()

									if not p167.__drag then
										local pos = p167.pos
										local pos2 = p167.pos
										local v1136 = v1132 or p167.pos.x

										pos2.y = p169 or p167.pos.y
										pos.x = v1136
									else
										if v1132 then
											p167.__drag.config.x:set(v1132 / v1133.x * 10000)
										end

										if p169 then
											p167.__drag.config.y:set(p169 / v1133.y * 10000)
										end
									end
								end,
								get_drag_position = function(p170)
									-- upvalues: u31 (ref)
									local v1138 = p170.__drag and p170.__drag.config

									if v1138 then
										local v1139 = u31.screen_size()
										local v1140 = v1138.x:get()
										local v1141 = v1138.y:get()

										return vector(v1140 * 0.0001 * v1139.x, v1141 * 0.0001 * v1139.y)
									end

									return p170.pos
								end,
								get_drag_size = function(p171)
									return p171.size:clone()
								end,
								__call = function(p172)
									-- upvalues: u31 (ref), u41 (ref), t17 (ref)
									local __list = p172.__list
									local __drag = p172.__drag

									if __list then
										local v1146 = __list.collect()

										__list.active = 0
										__list.items = v1146

										for i = 1, #__list.items do
											if __list.items[i].active then
												__list.active = __list.active + 1
											end
										end
									end

									p172.alpha = p172:update()
									u31.push_alpha(p172.alpha)

									if p172.alpha > 0 then
										if __drag then
											u41.process(p172)
										end

										if __list then
											t17.traverse(p172)
										end

										p172:paint(p172.pos, p172.pos + p172.size)
									end

									u31.pop_alpha()
								end,
								enlist = function(p173, p174, p175, p176)
									p173.__list = {
										active = 0,
										longest = 0,
										items = {},
										progress = setmetatable({}, {
											__mode = "k"
										}),
										minwidth = p173.size.x,
										collect = p174,
										paint = p175,
										rev = p176
									}
								end,
								traverse = function(p177)
									-- upvalues: u31 (ref)
									local __list = p177.__list
									local n3 = 0

									vector()
									__list.longest = 0
									__list.active = 0

									for i = 1, #__list.items do
										local v1156 = __list.items[i]
										local v1157 = v1156.name or i

										__list.progress[v1157] = __list.progress[v1157] or {
											[1] = 0
										}

										local v1158 = anima.condition(__list.progress[v1157], v1156.active, 6, {
											[1] = {
												[1] = 1,
												[2] = 3
											},
											[2] = {
												[1] = 2,
												[2] = 3
											}
										})

										if v1158 > 0 then
											u31.push_alpha(v1158)

											local v1159 = __list.paint(p177, v1156, n3, v1158)

											u31.pop_alpha()

											local v1160 = __list.active + 1

											n3 = n3 + v1159.y * v1158
											__list.active = v1160
											__list.longest = math.max(__list.longest, v1159.x)
										end
									end

									p177.size.x = anima.lerp(p177.size.x, math.max(__list.longest, __list.minwidth), 10,
										0.5)
								end,
								lock = function(p178, p179)
									if p178.__drag then
										p178.__drag.locked = p179 and true or false

										return
									end
								end
							}
							t17.__index = t17
							t19 = {
								new = function(p180, p181, p182, p183)
									-- upvalues: u41 (ref), t17 (ref)
									local t18 = {
										alpha = 1,
										id = p180,
										pos = p181,
										size = p182,
										progress = {
											[1] = 0
										}
									}

									if p183 then
										u41.new(t18, type(p183) == "table" and p183 or nil)
									end

									return setmetatable(t18, t17)
								end
							}
							t20 = {}

							local function v50(p184)
								local t21 = {}
								local n4 = 0

								for match in string.gmatch(p184, ".[\128-\191]*") do
									n4 = n4 + 1
									t21[n4] = match
								end

								return t21, n4
							end

							function t20.gradient(p185, p186, p187, p188)
								-- upvalues: v50 (copy)
								local t22 = {}
								local v1177, v1178 = v50(p185)
								local v1179 = 1 / (v1178 - 1)
								local v1180 = p188.r - p187.r
								local v1181 = p188.g - p187.g
								local v1182 = p188.b - p187.b
								local v1183 = p188.a - p187.a

								for i = 1, v1178 do
									local v1185 = v1177[i]
									local v1186 = p186 % 2

									if v1186 > 1 then
										v1186 = 2 - v1186
									end

									local v1187 = p187.r + v1186 * v1180
									local v1188 = p187.g + v1186 * v1181
									local v1189 = p187.b + v1186 * v1182
									local v1190 = p187.a + v1186 * v1183
									local v1191 = string.format("%02x%02x%02x%02x", v1187, v1188, v1189, v1190)

									table.insert(t22, "\a")
									table.insert(t22, v1191)
									table.insert(t22, v1185)
									p186 = p186 + v1179
								end

								return table.concat(t22)
							end
						end

						t23 = {
							recorder = {}
						}
						t24 = {
							aimtools = {
								[1] = "Pistols",
								[2] = "AutoSnipers",
								[3] = "AWP",
								[4] = "SSG-08",
								[5] = "Desert Eagle",
								[6] = "R8 Revolver"
							},
							states = {
								[0] = "Shared",
								[1] = "Standing",
								[2] = "Running",
								[3] = "Slow motion",
								[4] = "Crouching",
								[5] = "Move & Crouching",
								[6] = "Air",
								[7] = "Air & Crouching",
								[8] = "On use",
								[9] = "Fakelag",
								[10] = "Freestanding",
								[11] = "Safe Head",
								[12] = "Manual Yaw",
								[13] = "Warmup AA"
							}
						}
						t25 = {}

						local n6, v66, v67, u76, t80, misc

						do
							local v74, t30

							do
								local t32, settings, presets, recorder, t33, v93

								do
									local v65, state, t34, t35, v92

									do
										local n5, v69, v71

										do
											local v54 = ".\\" .. t1.name

											local function v55(p189)
												return type(p189.type) == "string" and
													(type(p189.link) == "string" and (type(p189.width) == "number" and type(p189.height) == "number"))
											end
											local function v56(p190)
												-- upvalues: v55 (copy), v54 (copy), t25 (ref), u31 (ref)
												return function(p191)
													-- upvalues: v55 (copy), v54 (copy), p190 (copy), t25 (ref), u31 (ref)
													if v55(p191) then
														files.create_folder(v54)

														local v3447 = string.format("%s/%s.%s", v54, p190, p191.type)
														local v3448 = files.read(v3447, true)

														if v3448 == nil then
															network.get(p191.link, {}, function(p192)
																-- upvalues: t25 (ref), p190 (copy), u31 (ref), p191 (copy), v3447 (copy)
																if p192 ~= nil then
																	t25[p190] = u31.load_image(p192,
																		vector(p191.width, p191.height))
																	files.write(v3447, p192, true)

																	return
																end
															end)
														else
															t25[p190] = u31.load_image(v3448,
																vector(p191.width, p191.height))
														end

														return true
													end

													return false
												end
											end

											v56("eva_small")({
												height = 35,
												type = "png",
												width = 35,
												link = "https://cdn.hysteria.one/angelwings/angelwings_eva_img.png"
											})
											v56("billy")({
												height = 185,
												type = "png",
												width = 131,
												link = "https://cdn.hysteria.one/angelwings/billy.png"
											})
											v56("tulen")({
												height = 401,
												type = "png",
												width = 401,
												link = "https://cdn.hysteria.one/angelwings/tulen.png"
											})
											t26 = {}

											local v58 = ({
												illusory = 0,
												live = 2,
												exclusive = 1,
												debug = -1
											})[t1.build:lower()]
											local t27 = {}

											local function v60(p193, p194)
												p193:set(unpack(p194))
												p193:disabled(true)
											end
											local function v61()
												-- upvalues: t27 (copy), v60 (copy)
												for i = 1, #t27 do
													local v1197 = t27[i]

													v60(v1197.item, v1197.value)
												end
											end

											function t26.is_locked(p195)
												-- upvalues: v58 (copy)
												if v58 ~= -1 then
													if p195 ~= -1 then
														return not (p195 > v58)
													end

													return true
												end

												return false
											end

											function t26.push(p196, p197, ...)
												-- upvalues: t26 (ref), t27 (copy), v60 (copy)
												if t26.is_locked(p196) then
													local t28 = { ... }

													if select("#", ...) == 0 then
														t28 = {
															[1] = false
														}
													end

													table.insert(t27, {
														item = p197,
														value = t28
													})
													p197:set_callback(function(p198)
														-- upvalues: v60 (copy), t28 (ref)
														v60(p198, t28)
													end, true)

													return p197
												end

												return p197
											end

											function t26.update()
												-- upvalues: v61 (copy)
												v61()
											end

											utils.execute_after(0, v61)
											events.config_state(function(p199)
												-- upvalues: v61 (copy)
												if p199 == "pre_save" then
													v61()
												end
											end)
											t29 = {}
											n5 = 1
											n6 = 2

											function v65(p200)
												return (string.gsub(p200, "${(.-)}", "\a{Link Active}%1\aDEFAULT"))
											end

											function v66(p201)
												-- upvalues: s1 (copy)
												return string.rep(s1, p201)
											end

											function v67(p202, p203)
												-- upvalues: s1 (copy)
												local v1207 = string.rep(s1, p203)

												return v1207 .. p202 .. v1207
											end

											local function v68(p204, p205, p206, p207, p208)
												-- upvalues: v66 (copy)
												return v66(p207) ..
													"\a" .. p204 .. ui.get_icon(p205) .. v66(p208) .. "\aDEFAULT" .. p206
											end

											function v69(p209, p210, p211, p212)
												-- upvalues: v68 (copy)
												return v68("{Link Active}", p209, p210, p211, p212)
											end

											local function v70(p213, p214, p215, p216)
												-- upvalues: v66 (copy)
												local v1221 = v66(p216)
												local v1222 = v66(3)

												return v1221 ..
													"\a" ..
													p213 .. ui.get_icon(p214) .. v1222 .. "\aDEFAULT" .. p215 .. v1221
											end

											function v71(p217, p218, p219)
												-- upvalues: v70 (copy)
												return v70("{Link Active}", p217, p218, p219)
											end
										end

										local function v72(p220, p221, p222)
											-- upvalues: v66 (copy)
											local v1229 = v66(p222)

											return v1229 .. "\a" .. p220 .. ui.get_icon(p221) .. v1229
										end
										local function v73(p223, p224)
											-- upvalues: v72 (copy)
											return v72("{Link Active}", p223, p224)
										end

										function v74(p225, p226)
											local u1234 = p225:get()

											if #u1234 == 0 then
												if p226 == nil then
													local v1235 = p225:type()
													local v1236 = p225:list()

													if v1235 ~= "selectable" then
														if v1235 == "listable" then
															p226 = {}

															for i = 1, #v1236 do
																p226[i] = i
															end
														end
													else
														p226 = v1236
													end
												end

												u1234 = p226
												p225:set(p226)
											end

											p225:set_callback(function()
												-- upvalues: p225 (copy), u1234 (ref)
												local v3450 = p225:get()

												if not (#v3450 > 0) then
													p225:set(u1234)
												else
													u1234 = v3450
												end
											end)
										end

										t30 = {
											category = t7.create("~", "##CATEGORY", n5),
											info = t7.create("~", "##INFO", n5),
											antiaim = {
												main = t7.create("~", "##AA_MAIN", n5),
												state = t7.create("~", "##AA_STATE", n6),
												recorder = t7.create("~", "##AA_RECORDER", n6),
												settings = t7.create("~", "##AA_SETTINGS", n6),
												presets = t7.create("~", "##AA_PRESETS", n6)
											},
											ragebot = t7.create("~", "##RAGEBOT", n6),
											visuals = t7.create("~", "##VISUALS", n6),
											misc = t7.create("~", "##MISC", n6)
										}
										events.render(function()
											-- upvalues: t20 (ref), t1 (copy)
											local v1238 = ui.get_style()
											local v1239 = color(40, 40, 40, 255)
											local v1240 = v1238["Link Active"]
											local v1241 = -globals.realtime * 0.8
											local v1242 = t20.gradient(t1.name, v1241, v1240, v1239)

											ui.sidebar(v1242, "sparkles")
										end)
										u76 = t30.category:list("##CATEGORY", {
											[1] = "Anti-Aim",
											[2] = "Ragebot",
											[3] = "Visuals",
											[4] = "Misc"
										})
										t29.category = u76

										local t31 = {}
										local v78 = string.lower(t1.build)

										t31.welcome_text = t30.info:label(v69("user",
											v65(string.format("Welcome back, ${%s}", t1.user)), 1, 7))
										t31.welcome_text = t30.info:label(v69("code-branch",
											v65(string.format("Your build is ${%s}", v78)), 1, 7))
										t29.info = t31
										t29.links = {
											label = t30.info:label(v7("\a{Link Active}", "Links")),
											discord = t30.info:button(v73("discord", 10), nil, true),
											youtube = t30.info:button(v73("youtube", 10), nil, true),
											config = t30.info:button(v73("file", 10), nil, true)
										}
										t29.configs = {
											label = t30.info:label(v7("\a{Link Active}", "Config")),
											export = t30.info:button(v71("copy", "Export", 7), nil, true),
											import = t30.info:button(v71("paste", "Import", 7), nil, true),
											default = t30.info:button(v67("Load Default Config", 34), nil, true)
										}
										t32 = {}

										local main = t30.antiaim.main

										state = t30.antiaim.state
										settings = t30.antiaim.settings
										presets = t30.antiaim.presets
										recorder = t30.antiaim.recorder
										t12.add("##ANTIAIM_MAIN", main, "AA")
										t12.add("##ANTIAIM_STATE", state, "AA")
										t12.add("##ANTIAIM_SETTINGS", settings, "AA")
										t32.enabled = main:switch("Enabled")
										t32.mode = main:list("##MODE", {
											[1] = "Main",
											[2] = "Settings",
											[3] = "Presets"
										})
										t33 = {}
										t34 = { unpack(t24.states, 0) }
										t35 = {}
										t33.state = state:combo("State", t34)

										local function v88(p227)
											-- upvalues: t30 (copy)
											t30.info:visibility(p227)
										end
										local function v89(p228)
											-- upvalues: t33 (copy), t34 (copy), t35 (copy), recorder (copy)
											local v1245 = t33.state:get()

											t33.state:visibility(p228)

											local v1246 = false

											for i = 1, #t34 do
												local v1248 = t34[i]
												local v1249 = t33[v1248]
												local v1250 = t35[v1248]
												local v1251 = p228 and v1248 == v1245

												if v1249 ~= nil and v1249.enabled ~= nil then
													v1249.enabled:visibility(v1251)

													if v1251 then
														v1251 = v1249.enabled:get()
													end
												end

												if v1249.bomb_e_fix ~= nil then
													v1249.bomb_e_fix:visibility(v1251)
												end

												local v1252 = v1249.mode:get()

												v1249.mode:visibility(v1251)

												local v1253 = v1252 == "Builder"
												local v1254 = v1252 == "Recorder"

												if v1250 ~= nil then
													if v1250.angles ~= nil then
														v1250.angles:visibility(v1253 and v1251)
													end

													if v1250.defensive ~= nil then
														v1250.defensive:visibility(v1253 and v1251)
													end

													if v1250.recorder ~= nil then
														v1250.recorder:visibility(v1254 and v1251)
													end
												end

												if v1254 and v1251 then
													v1246 = true
												end
											end

											recorder:visibility(v1246)
										end
										local function v90(p229)
											-- upvalues: presets (copy)
											presets:visibility(p229)
										end
										local function v91(p230)
											-- upvalues: settings (copy)
											settings:visibility(p230)
										end

										function v92(p231)
											-- upvalues: t32 (copy), v88 (copy), v89 (copy), v91 (copy), v90 (copy)
											local v1258 = t32.mode:get()
											local v1259 = t32.enabled:get()
											local v1260 = v1258 == 1
											local v1261 = v1258 == 2
											local v1262 = v1258 == 3

											t32.enabled:visibility(p231)
											t32.mode:visibility(p231 and v1259)
											v88(not p231 or not v1259)
											v89(p231 and (v1259 and v1260))
											v91(p231 and (v1259 and v1261))
											v90(p231 and (v1259 and v1262))
										end
									end

									function v93()
										-- upvalues: u76 (ref), v92 (copy)
										local v1263 = u76:get()

										v92(v1263 == 1)
									end

									for i = 1, #t34 do
										local v95 = t34[i]
										local v96 = string.format("##ANGLES_%s", v95)
										local v97 = string.format("##DEFENSIVE_%s", v95)
										local v98 = string.format("##RECORDER_%s", v95)
										local v99 = t7.create("~", v96, n6)
										local v100 = t7.create("~", v97, n6)
										local v101 = t7.create("~", v98, n6)

										local function v102(p232)
											-- upvalues: v95 (copy)
											local v1299 = string.format("##%s", v95)
											local _, stop = string.find(p232[2], "##")

											if stop ~= nil then
												v1299 = v1299 .. string.sub(p232[2], stop + 1)
											end

											p232[2] = p232[2] .. v1299
										end

										local t36 = {}

										state:set_callback(v102)
										v99:set_callback(v102)
										v100:set_callback(v102)
										v101:set_callback(v102)
										t36.mode = state:combo("Mode", {
											[1] = "Builder",
											[2] = "Recorder"
										})
										t36.mode:set_callback(v93)

										if v95 ~= "Shared" then
											state:set_flag(t7.group_flags.callbacks, false)
											t36.enabled = state:switch(string.format("\a{Link Active}Allow %s",
												v95:lower()))
											state:set_flag(t7.group_flags.callbacks, true)
											t36.enabled:set_callback(v93)
										end

										if v95 == "On use" then
											t36.bomb_e_fix = state:switch("Bomb E Fix")
										end

										t36.angles = (function(p233, p234, p235)
											-- upvalues: v65 (copy)
											local t37 = {
												[1] = "Off",
												[2] = "Offset",
												[3] = "Center",
												[4] = "Skitter",
												[5] = "Custom Ways",
												[6] = "Spin",
												[7] = "Random",
												[8] = "Angelic"
											}
											local t38 = {
												[1] = "Off",
												[2] = "Left",
												[3] = "Right",
												[4] = "Jitter",
												[5] = "Random"
											}
											local t39 = {
												[1] = "Left",
												[2] = "Right",
												[3] = "Forward",
												[4] = "Forward-Left",
												[5] = "Forward-Right",
												[6] = "Backward",
												[7] = "Backward-Left",
												[8] = "Backward-Right"
											}

											if p233 == "Move & Crouching" then
												p235.direction = p234:combo(v65("Direction"), {
													"General",
													unpack(t39)
												})
											end

											p235.yaw_offset = p234:slider("Offset", -90, 90, 0, nil, "°")
											p235.add_yaw = p234:switch("Add Yaw")
											p235.yaw_left = p234:slider(v65("${~}   Left##YAW"), -90, 90, 0, nil, "°")
											p235.yaw_right = p234:slider(v65("${~}   Right##YAW"), -90, 90, 0, nil, "°")

											if p233 == "Move & Crouching" then
												for j = 1, #t39 do
													local v1271 = t39[j]

													p235[v1271] = {
														enabled = p234:switch(v65("${~}   Enabled##YAW_") .. v1271),
														yaw_offset = p234:slider(v65("${~}   Offset##YAW_") .. v1271, -90,
															90, 0, nil, "°"),
														yaw_left = p234:slider(v65("${~}   Left##YAW_") .. v1271, -90, 90,
															0, nil, "°"),
														yaw_right = p234:slider(v65("${~}   Right##YAW_") .. v1271, -90,
															90, 0, nil, "°")
													}
												end
											end

											local function v1272()
												-- upvalues: p235 (copy), t39 (copy)
												local v3454 = p235.add_yaw:get()
												local s5 = "General"

												if p235.direction ~= nil then
													s5 = p235.direction:get()
												end

												local v3456 = s5 == "General"

												p235.yaw_offset:visibility(v3456)
												p235.yaw_left:visibility(v3456 and v3454)
												p235.yaw_right:visibility(v3456 and v3454)

												for j = 1, #t39 do
													local v3458 = t39[j]
													local v3459 = p235[v3458]

													if v3459 ~= nil then
														local v3460 = s5 == v3458

														v3459.enabled:visibility(v3460)

														if not v3459.enabled:get() then
															v3460 = false
														end

														v3459.yaw_offset:visibility(v3460)
														v3459.yaw_left:visibility(v3460 and v3454)
														v3459.yaw_right:visibility(v3460 and v3454)
													end
												end
											end

											p235.add_yaw:set_callback(v1272)

											if p235.direction ~= nil then
												p235.direction:set_callback(v1272)

												for j = 1, #t39 do
													local v1274 = p235[t39[j]]

													if v1274 ~= nil then
														v1274.enabled:set_callback(v1272)
													end
												end
											end

											v1272()
											p235.yaw_jitter = p234:combo("Jitter", t37)

											local v1275 = p235.yaw_jitter:create()

											p235.jitter_offset = p234:slider(v65("${~}   Degree"), -90, 90, 0, nil, "°")
											p235.way_count = v1275:slider("Count", 3, 5, 3)
											p235.way_values = {}

											for j = 1, 5 do
												p235.way_values[j] = v1275:slider("Way " .. j, -90, 90, 0, nil, "°")
											end

											local function v1277(p236)
												-- upvalues: p235 (copy)
												local v3462 = p236:get()

												for j = 1, #p235.way_values do
													p235.way_values[j]:visibility(not (j > v3462))
												end
											end

											p235.yaw_jitter:set_callback(function(p237)
												-- upvalues: p235 (copy), v1277 (copy)
												local v3465 = p237:get()
												local v3466 = v3465 == "Off"
												local v3467 = not v3466 and v3465 ~= "Custom Ways"
												local v3468 = not v3466 and v3465 == "Custom Ways"

												p235.jitter_offset:visibility(v3467)
												p235.way_count:visibility(v3468)

												if not v3468 then
													p235.way_count:unset_callback(v1277)
												else
													p235.way_count:set_callback(v1277, true)
												end

												if not v3468 then
													for j = 1, #p235.way_values do
														p235.way_values[j]:visibility(false)
													end
												end
											end, true)
											p235.body_yaw = p234:combo("Body Yaw", t38)

											local v1278 = p235.body_yaw:create()

											p235.invert_chance = v1278:slider("Invert Chance", 1, 100, 100, nil, "%")
											p235.avoid_overlap = v1278:switch("Avoid overlap")
											p235.freestanding_body_yaw = v1278:combo("Freestanding", {
												[1] = "Off",
												[2] = "Peek Fake",
												[3] = "Peek Real"
											})
											p235.left_limit = p234:slider(v65("${~}   Left##BODY_YAW"), 0, 60, 60, nil,
												"°")
											p235.right_limit = p234:slider(v65("${~}   Right##BODY_YAW"), 0, 60, 60, nil,
												"°")
											p235.body_yaw:set_callback(function(p238)
												-- upvalues: p235 (copy)
												local v3471 = p238:get()
												local v3472 = v3471 == "Left"
												local v3473 = v3471 == "Right"
												local v3474 = v3471 == "Jitter"
												local v3475 = v3471 == "Random"

												p235.invert_chance:visibility(v3474)
												p235.left_limit:visibility(v3472 or (v3474 or v3475))
												p235.right_limit:visibility(v3473 or (v3474 or v3475))
											end, true)
											p235.random = p234:slider("Randomization", 0, 100, 0, nil, function(p239)
												return p239 > 0 and p239 .. "%" or "Off"
											end)
											p235.delay = p234:switch("Delay")

											local v1279 = p235.delay:create()

											p235.delay_affect_modifier = v1279:switch("Affect Modifier")
											p235.delay_mode = v1279:combo("Mode", {
												[1] = "Default",
												[2] = "Custom"
											})
											p235.delay_value = v1279:slider("Ticks", 2, 14, 1, nil, "t")
											p235.delay_random = v1279:slider("Random ticks", 0, 14, 0, nil,
												function(p240)
													return p240 > 0 and p240 .. "t" or "Off"
												end)
											p235.delay_count = v1279:slider("Count", 2, 8, 2)
											p235.delay_values = {}

											for j = 1, 8 do
												p235.delay_values[j] = v1279:slider("Slider " .. j, 1, 14, 1, nil, "t")
											end

											local function v1281(p241)
												-- upvalues: p235 (copy)
												local v3477 = p241:get()

												for j = 1, 8 do
													p235.delay_values[j]:visibility(not (j > v3477))
												end
											end

											p235.delay_mode:set_callback(function(p242)
												-- upvalues: p235 (copy), v1281 (copy)
												local v3480 = p242:get()
												local v3481 = v3480 == "Default"
												local v3482 = v3480 == "Custom"

												p235.delay_value:visibility(v3481)
												p235.delay_random:visibility(v3481)
												p235.delay_count:visibility(v3482)

												if not v3482 then
													p235.delay_count:unset_callback(v1281)
												else
													p235.delay_count:set_callback(v1281, true)
												end

												if not v3482 then
													for j = 1, 8 do
														p235.delay_values[j]:visibility(false)
													end
												end
											end, true)

											return p235
										end)(v95, v99, {})

										if v95 ~= "Fakelag" then
											t36.defensive = (function(_, p244, p245)
												-- upvalues: v65 (copy)
												local t40 = {
													[1] = "Off",
													[2] = "Static",
													[3] = "Jitter",
													[4] = "Spin",
													[5] = "Random",
													[6] = "Angelic"
												}
												local t41 = {
													[1] = "Off",
													[2] = "Static",
													[3] = "Spin",
													[4] = "Random",
													[5] = "Left/Right",
													[6] = "Side-Based"
												}
												local t42 = {
													[1] = "Off",
													[2] = "Offset",
													[3] = "Center",
													[4] = "Skitter"
												}

												p245.force_break_lc = p244:switch("Force Break LC")

												local v1288 = p245.force_break_lc:create()

												p245.tickbase = v1288:combo("Tickbase", {
													[1] = "Default",
													[2] = "Ticks",
													[3] = "Random"
												})
												p245.tickbase_ticks = v1288:slider("Ticks", 2, 22, 15, nil, "t")
												p245.tickbase_min = v1288:slider("Min. Ticks", 2, 22, 15, nil, "t")
												p245.tickbase_max = v1288:slider("Max. Ticks", 2, 22, 15, nil, "t")
												p245.tickbase:set_callback(function(p246)
													-- upvalues: p245 (copy)
													local v3486 = p246:get()
													local v3487 = v3486 == "Ticks"
													local v3488 = v3486 == "Random"

													p245.tickbase_ticks:visibility(v3487)
													p245.tickbase_min:visibility(v3488)
													p245.tickbase_max:visibility(v3488)
												end, true)
												p245.enabled = p244:switch("Defensive AA")
												p245.pitch = p244:combo("Pitch", t40)
												p245.pitch_offset_1 = p244:slider(v65("${~}   Angle 1##PITCH"), -89, 89,
													0, nil, "°")
												p245.pitch_offset_2 = p244:slider(v65("${~}   Angle 2##PITCH"), -89, 89,
													0, nil, "°")
												p245.pitch_speed = p244:slider(v65("${~}   Speed##PITCH"), -50, 50, 20,
													0.1)
												p245.yaw = p244:combo("Yaw", t41)
												p245.yaw_left = p244:slider(v65("${~}   Yaw Left##YAW"), -180, 180, 0,
													nil, "°")
												p245.yaw_right = p244:slider(v65("${~}   Yaw Right##YAW"), -180, 180, 0,
													nil, "°")
												p245.yaw_offset = p244:slider(v65("${~}   Yaw Offset##YAW"), 0, 360, 0,
													nil, "°")
												p245.yaw_speed = p244:slider(v65("${~}   Yaw Speed##YAW"), -50, 50, 20,
													0.1)
												p245.yaw_modifier = p244:combo(v65("${~}   Modifier##MOD"), t42)
												p245.modifier_offset = p244:slider(v65("${~}   Degree##MOD"), -180, 180,
													0, nil, "°")
												p245.delay = p244:switch(v65("${~}   Delay##MOD"))

												local v1289 = p245.delay:create()

												p245.delay_affect_modifier = v1289:switch("Affect Modifier")
												p245.delay_mode = v1289:combo("Mode", {
													[1] = "Default",
													[2] = "Custom"
												})
												p245.delay_value = v1289:slider("Ticks", 2, 14, 1, nil, "t")
												p245.delay_random = v1289:slider("Random ticks", 0, 14, 0, nil,
													function(p247)
														return p247 > 0 and p247 .. "t" or "Off"
													end)
												p245.delay_count = v1289:slider("Count", 2, 8, 2)
												p245.delay_values = {}

												for j = 1, 8 do
													p245.delay_values[j] = v1289:slider("Slider " .. j, 1, 14, 1, nil,
														"t")
												end

												local function v1291(p248)
													-- upvalues: p245 (copy)
													local v3490 = p248:get()

													for j = 1, 8 do
														p245.delay_values[j]:visibility(not (j > v3490))
													end
												end

												p245.delay_mode:set_callback(function(p249)
													-- upvalues: p245 (copy), v1291 (copy)
													local v3493 = p249:get()
													local v3494 = v3493 == "Default"
													local v3495 = v3493 == "Custom"

													p245.delay_value:visibility(v3494)
													p245.delay_random:visibility(v3494)
													p245.delay_count:visibility(v3495)

													if not v3495 then
														p245.delay_count:unset_callback(v1291)
													else
														p245.delay_count:set_callback(v1291, true)
													end

													if not v3495 then
														for j = 1, 8 do
															p245.delay_values[j]:visibility(false)
														end
													end
												end, true)
												p245.force_target_yaw = p244:switch("Force Target Yaw")

												local function v1292(p250)
													-- upvalues: p245 (copy)
													local v3498 = p250:get()
													local v3499 = v3498 == "Off"
													local v3500 = v3498 == "Static"

													if v3498 == "Jitter" then
													end

													if v3498 == "Random" then
													end

													local v3501 = v3498 == "Spin"
													local v3502 = v3498 == "Angelic"
													local v3503 = not v3499
													local v3504 = not v3499 and not v3500

													if v3502 then
														v3503 = false
														v3504 = false
														v3501 = false
													end

													p245.pitch_offset_1:visibility(v3503)
													p245.pitch_offset_2:visibility(v3504)
													p245.pitch_speed:visibility(v3501)
												end
												local function v1293(p251)
													-- upvalues: p245 (copy)
													local v3506 = p251:get() ~= "Off"

													p245.modifier_offset:visibility(v3506)
													p245.delay:visibility(v3506)
												end
												local function v1294(p252)
													-- upvalues: p245 (copy), v1293 (copy)
													local v3508 = p252:get()
													local v3509 = v3508 == "Off"
													local v3510 = v3508 == "Spin"
													local v3511 = v3508 == "Left/Right"
													local v3512 = v3508 == "Side-Based"
													local v3513 = v3510 or v3512

													p245.yaw_left:visibility(v3511)
													p245.yaw_right:visibility(v3511)
													p245.yaw_offset:visibility(v3513)
													p245.yaw_speed:visibility(v3510)
													p245.yaw_modifier:visibility(not v3509)

													if v3509 then
														p245.yaw_modifier:unset_callback(v1293)
													else
														p245.yaw_modifier:set_callback(v1293, true)
													end

													if v3509 then
														p245.modifier_offset:visibility(false)
														p245.delay:visibility(false)
													end
												end

												p245.enabled:set_callback(function(p253)
													-- upvalues: p245 (copy), v1292 (copy), v1294 (copy), v1293 (copy)
													local v3515 = p253:get()

													if not v3515 then
														p245.pitch_offset_1:visibility(false)
														p245.pitch_offset_2:visibility(false)
														p245.pitch_speed:visibility(false)
														p245.yaw_left:visibility(false)
														p245.yaw_right:visibility(false)
														p245.yaw_offset:visibility(false)
														p245.yaw_speed:visibility(false)
														p245.yaw_modifier:visibility(false)
														p245.modifier_offset:visibility(false)
														p245.delay:visibility(false)
													end

													if not v3515 then
														p245.pitch:unset_callback(v1292)
														p245.yaw:unset_callback(v1294)
														p245.yaw_modifier:unset_callback(v1293)
													else
														p245.pitch:set_callback(v1292, true)
														p245.yaw:set_callback(v1294, true)
													end

													p245.pitch:visibility(v3515)
													p245.yaw:visibility(v3515)
													p245.force_target_yaw:visibility(v3515)
												end, true)
												p245.flick_enabled = p244:switch("Defensive Flick")
												p245.flick_mode = p244:combo("Mode", {
													[1] = "Default",
													[2] = "Silent"
												})
												p245.flick_pitch = p244:slider("Pitch", -89, 89, 0)
												p245.flick_yaw = p244:slider("Yaw", 0, 180, 120)
												p245.flick_yaw_random = p245.flick_yaw:create():slider("Yaw Random", 0,
													180, 0)
												p245.flick_limit = p244:slider("Limit", 0, 60, 60)
												p245.flick_speed = p244:slider("Speed", 2, 10, 7)
												p245.flick_speed_random = p245.flick_speed:create():slider(
													"Speed Random", 0, 8, 0)
												p245.flick_enabled:set_callback(function(p254)
													-- upvalues: p245 (copy)
													local v3517 = p254:get()

													p245.flick_mode:visibility(v3517)
													p245.flick_pitch:visibility(v3517)
													p245.flick_yaw:visibility(v3517)
													p245.flick_limit:visibility(v3517)
													p245.flick_speed:visibility(v3517)
												end, true)

												return p245
											end)(v95, v100, {})
										end

										t36.recorder = (function(_, p256, p257)
											p257.record = p256:value("record", "[]")
											p257.inverse_inverter = p256:switch("Inverse Inverter")

											return p257
										end)(v95, v101, {})
										state:unset_callback(v102)
										v99:unset_callback(v102)
										v100:unset_callback(v102)
										v101:unset_callback(v102)
										t33[v95] = t36
										t35[v95] = {
											angles = v99,
											defensive = v100,
											recorder = v101
										}
										t12.add(v96, v99, "AA")
										t12.add(v97, v100, "AA")
										t12.add(v98, v101, "AA")
									end
								end

								u76:set_callback(v93)
								t32.enabled:set_callback(v93)
								t32.mode:set_callback(v93)
								t33.state:set_callback(v93)
								v93()
								t32.builder = t33
								t32.recorder = {
									sequence_list = recorder:list("##SEQUENCE_LIST", {}),
									set_start_button = recorder:button(v67("Set Start", 52), nil, true),
									set_end_button = recorder:button(v67("Set End", 53), nil, true),
									save_button = recorder:button(v67("Save", 57), nil, true),
									import_button = recorder:button(v67("Import", 53), nil, true)
								}
								t32.presets = {
									list = presets:list("##PRESET_LIST", {
										[1] = "Empty"
									}),
									name = presets:input("##PRESET_NAME", ""),
									load = presets:button(v67("\a{Link Active}Load", 12), nil, true),
									save = presets:button(v67("Save", 12), nil, true),
									delete = presets:button(v67("\aCD6060FFDelete", 8), nil, true),
									import = presets:button(v67("Import", 19), nil, true),
									export = presets:button(v67("Export", 20), nil, true)
								}

								local t43 = {}
								local t44 = {}
								local t45 = {
									[1] = "Awp",
									[2] = "Auto",
									[3] = "Scout",
									[4] = "Pistol",
									[5] = "Deagle"
								}
								local t46 = {
									[1] = "Standing",
									[2] = "Running",
									[3] = "Slow motion",
									[4] = "Air",
									[5] = "Air & Crouching",
									[6] = "Crouching",
									[7] = "Move & Crouching"
								}

								t44.enabled = settings:switch("Auto Hide Shots")

								local v108 = t44.enabled:create()

								t44.weapons = v108:selectable("Weapons", t45)
								t44.states = v108:selectable("States", t46)
								v74(t44.weapons)
								v74(t44.states, {
									[1] = "Slow motion",
									[2] = "Crouching",
									[3] = "Move & Crouching"
								})
								t26.push(2, t44.enabled)
								t43.auto_hide_shots = t44

								local t47 = {
									enabled = settings:switch("Anti-Bruteforce")
								}
								local v110 = t47.enabled:create()

								t47.refresh_modifier = v110:combo("Refresh Modifier", {
									[1] = "Off",
									[2] = "Adaptive",
									[3] = "Increase",
									[4] = "Decrease"
								})
								t47.refresh_offset = v110:switch("Refresh Offset")
								t47.enforce_delay = v110:switch("Enforce Delay Period")
								t47.duration = v110:slider("Duration", 0, 100, 0, 0.1, function(p258)
									return p258 == 0 and "Inf." or p258 * 0.1 .. "s"
								end)
								t26.push(2, t47.enabled)
								t43.antibrute = t47

								local t48 = {
									enabled = settings:switch("Safe Head")
								}

								t48.states = t48.enabled:create():selectable("Safe Head", {
									[1] = "Standing",
									[2] = "Crouch",
									[3] = "Air Crouch Knife",
									[4] = "Distance"
								})
								v74(t48.states)
								t26.push(2, t48.enabled)
								t43.safe_head = t48

								local t49 = {
									select = settings:combo("Manual Yaw", {
										[1] = "Off",
										[2] = "Left",
										[3] = "Right",
										[4] = "Backward",
										[5] = "Forward"
									})
								}
								local v113 = t49.select:create()

								t49.disable_yaw_modifiers = v113:switch("Disable Yaw Modifiers")
								t49.body_freestanding = v113:switch("Body Freestanding")
								t43.manual_yaw = t49
								t43.disablers = {
									select = settings:selectable("Disablers", {
										[1] = "On Warmup",
										[2] = "Enemies Dead"
									})
								}

								local t50 = {
									enabled = settings:switch("Freestanding")
								}
								local v115 = t50.enabled:create()

								t50.disablers = v115:selectable("Disablers", {
									[1] = "Standing",
									[2] = "Running",
									[3] = "Slow motion",
									[4] = "Crouching",
									[5] = "Air"
								})
								t50.disable_yaw_modifiers = v115:switch("Disable Yaw Modifiers")
								t50.body_freestanding = v115:switch("Body Freestanding")
								t43.freestanding = t50
								t43.edge_yaw = {
									enabled = settings:switch("Edge Yaw")
								}
								t43.invert_flick = {
									enabled = settings:switch("Invert Flick")
								}

								local t51 = {
									value = settings:slider("Roll", -45, 45, 0, nil, "°")
								}
								local v117 = t51.value:create()

								t51.change_on_fakelag = v117:switch("Change on Fakelag")
								t51.fakelag_value = v117:slider("Fakelag Roll", -45, 45, 0, nil, "°")
								t51.change_on_fakelag:set_callback(function(p259)
									-- upvalues: t51 (copy)
									t51.fakelag_value:visibility(p259:get())
								end, true)
								t26.push(2, t51.value, 0)
								t43.roll = t51
								t32.settings = t43
								t29.antiaim = t32
							end

							local t62, visuals, t68, t69, t70

							do
								local t52 = {}
								local ragebot = t30.ragebot

								t12.add("##RAGEBOT", ragebot, "AA")

								local t53 = {}
								local t54 = {
									[1] = "Higher than you",
									[2] = "Lower than you",
									[3] = "Lethal",
									[4] = "After X misses",
									[5] = "HP lower than X"
								}

								t53.enabled = ragebot:switch("Aimtools")

								local v122 = t7.cast(t53.enabled:create())

								t53.flag = v122:switch("Draw Flags")
								t53.weapon = v122:combo("Weapon", t24.aimtools)

								local function v123(p260, p261)
									p260.conditions:visibility(p261)
									p260.max_misses:visibility(p261 and p260.conditions:get("After X misses"))
									p260.lower_hp:visibility(p261 and p260.conditions:get("HP lower than X"))
								end
								local function v124(p262, p263)
									-- upvalues: t54 (copy)
									local v1308 = p262.conditions:get()

									p262.conditions:visibility(p263)

									for i = 1, #t54 do
										local v1310 = t54[i]
										local v1311 = p262[v1310]

										if v1311 ~= nil then
											local v1312 = p263 and v1308 == v1310

											v1311.enabled:visibility(v1312)

											if not v1311.enabled:get() then
												v1312 = false
											end

											if v1311.max_misses ~= nil then
												v1311.max_misses:visibility(v1312)
											end

											if v1311.lower_hp ~= nil then
												v1311.lower_hp:visibility(v1312)
											end

											if v1311.value ~= nil then
												v1311.value:visibility(v1312)
											end
										end
									end
								end
								local function v125(p264, p265)
									-- upvalues: v123 (copy), v124 (copy)
									v123(p264.prefer_body, p265)
									v123(p264.force_safe, p265)
									v124(p264.hit_chance, p265)
									v124(p264.multipoints, p265)
								end
								local function v126(p266, p267)
									-- upvalues: t53 (copy), v125 (copy)
									local v1317 = p267:get()

									for i = 1, #p266 do
										local v1319 = p266[i]
										local v1320 = t53[v1319]
										local v1321 = v1319 == v1317

										v125(v1320, v1321)
									end
								end
								local function u127()
									-- upvalues: v126 (copy), t24 (ref), t53 (copy)
									v126(t24.aimtools, t53.weapon)
								end
								local function v128(p268)
									-- upvalues: v122 (copy), t54 (copy), u127 (ref)
									local t55 = {}

									local function v1324(p269)
										-- upvalues: p268 (copy)
										p269[2] = p269[2] .. string.format("##%s", p268)
									end

									v122:set_callback(v1324)
									t55.conditions = v122:selectable(p268, t54)
									t55.max_misses = v122:slider("\tMax Misses", 1, 10, 2)
									t55.lower_hp = v122:slider("\tLower HP", 0, 100, 80)
									t55.conditions:set_callback(u127)
									v122:unset_callback(v1324)

									return t55
								end
								local function v129(p270, p271, p272, p273)
									-- upvalues: v122 (copy), t54 (copy), u127 (ref)
									local t56 = {}

									local function v1330(p274)
										-- upvalues: p270 (copy)
										p274[2] = p274[2] .. string.format("##%s", p270)
									end

									v122:set_callback(v1330)
									t56.conditions = v122:combo(p270, t54)

									for i = 1, #t54 do
										local v1332 = t54[i]

										local function v1333(p275)
											-- upvalues: v1332 (copy)
											p275[2] = p275[2] .. string.format("##%s", v1332)
										end

										v122:set_callback(v1333)

										local t57 = {
											enabled = v122:switch("\tEnabled")
										}

										if v1332 == "After X misses" then
											t57.max_misses = v122:slider("\tMax Misses", 1, 10, 2)
										end

										if v1332 == "HP lower than X" then
											t57.lower_hp = v122:slider("\tLower HP", 0, 100, 80)
										end

										t57.value = v122:slider("\tValue", p271, p272, p273)
										v122:unset_callback(v1333)
										t57.enabled:set_callback(u127)
										t56[v1332] = t57
									end

									v122:unset_callback(v1330)
									t56.conditions:set_callback(u127)

									return t56
								end

								for i = 1, #t24.aimtools do
									local v131 = t24.aimtools[i]

									local function v132(p276)
										-- upvalues: v131 (copy)
										local v1338 = string.format("##%s", v131)
										local _, stop = string.find(p276[2], "##")

										if stop ~= nil then
											v1338 = v1338 .. string.sub(p276[2], stop + 1)
										end

										p276[2] = p276[2] .. v1338
									end

									v122:set_callback(v132)
									t53[v131] = (function(_, p278)
										-- upvalues: v128 (copy), v129 (copy)
										p278.prefer_body = v128("Prefer Body Aim")
										p278.force_safe = v128("Force Safe Point")
										p278.hit_chance = v129("Hit Chance", 0, 100, 50)
										p278.multipoints = v129("Multipoints", 0, 100, 50)

										return p278
									end)(v131, {})
									v122:unset_callback(v132)
								end

								--t26.push(1, t53.enabled)
								t53.weapon:set_callback(u127, true)
								t52.aimtools = t53

								local t58 = {
									enabled = ragebot:switch("AI Peek")
								}
								local v134 = t58.enabled:create()

								t58.simulation = v134:slider("Simulation", 25, 35, 28, 0.01, "s")
								t58.scan_frequency = v134:slider("Scan Frequency", 0, 30, 2, 0.01, "s")
								t58.hit_chance = v134:slider("Hit Chance", 0, 100, 35, nil, function(p279)
									return p279 == 0 and "Def." or p279 .. "%"
								end)
								t58.weapons = v134:selectable("Weapons", {
									[1] = "AutoSnipers",
									[2] = "AWP",
									[3] = "SSG-08",
									[4] = "Pistols",
									[5] = "R8 Revolver",
									[6] = "Desert Eagle"
								})
								t58.hitboxes = v134:selectable("Hitboxes", {
									[1] = "Head",
									[2] = "Chest",
									[3] = "Stomach",
									[4] = "Arms",
									[5] = "Legs"
								})
								t58.unsafe = v134:switch("Unsafe", false)
								t58.color = v134:color_picker("Color", color(200, 0, 0, 255))
								v74(t58.weapons)
								v74(t58.hitboxes)
								--t26.push(1, t58.enabled)
								t52.ai_peek = t58

								local t59 = {
									enabled = ragebot:switch("Logs")
								}
								local v136 = t59.enabled:create()

								t59.output = v136:selectable("Output", {
									[1] = "Events",
									[2] = "Render",
									[3] = "Console"
								})
								t59.hit_color = v136:color_picker("Hit Color", color(163, 211, 80, 255))
								t59.miss_color = v136:color_picker("Miss Color", color(240, 191, 86, 255))
								t59.background_color = v136:color_picker("Background Color", color(22, 22, 22, 255))
								t59.logo = v136:combo("Logo", {
									[1] = "Off",
									[2] = "!",
									[3] = "Icon",
									[4] = "Text"
								})
								t59.glow = v136:slider("Glow", 0, 150, 100, nil, "%")
								t59.offset = v136:slider("Offset", 1, 144, 60, 5, "px")
								t59.duration = v136:slider("Duration", 1, 8, 5, nil, "s.")
								t59.output:set_callback(function(p280)
									-- upvalues: t59 (copy)
									local v1343 = p280:get("Render")

									t59.background_color:visibility(v1343)
									t59.logo:visibility(v1343)
									t59.glow:visibility(v1343)
									t59.offset:visibility(v1343)
									t59.duration:visibility(v1343)
								end, true)
								t52.logs = t59

								local t60 = {
									enabled = ragebot:switch("Dormant Aimbot")
								}
								local v138 = t60.enabled:create()

								t60.hitboxes = v138:selectable("Hitboxes", {
									[1] = "Head",
									[2] = "Chest",
									[3] = "Stomach",
									[4] = "Legs"
								})
								t60.alpha_modifier = v138:slider("Alpha Modifier", 0, 90, 80, nil, "%")
								t60.minimum_damage = v138:slider("Minimum Damage", 0, 130, 0, nil, function(p281)
									if p281 ~= 0 then
										if not (p281 > 100) then
											return
										end

										return "+" .. p281 - 100
									end

									return "Def."
								end)
								v74(t60.hitboxes)
								--t26.push(1, t60.enabled)
								t52.dormant_aimbot = t60

								local t61 = {
									enabled = ragebot:switch("Force Shot")
								}

								t61.show_indicator = t61.enabled:create():switch("Show Indicator"):tooltip(
									"Requires 'GameSense Indicators' enabled")
								--t26.push(1, t61.enabled)
								--t26.push(1, t61.show_indicator)
								t52.force_shot = t61
								u76:set_callback(function(p282)
									-- upvalues: ragebot (copy)
									local v1346 = p282:get() == 2

									ragebot:visibility(v1346)
								end, true)
								t29.ragebot = t52
								t62 = {}
								visuals = t30.visuals
								t12.add("##VISUALS", visuals, "VISUALS")

								local t63 = {}
								local t64 = {
									[1] = "5:4",
									[2] = "4:3",
									[3] = "16:9",
									[4] = "16:10"
								}
								local t65 = {
									["16:10"] = 160,
									["16:9"] = 177,
									["4:3"] = 133,
									["5:4"] = 125
								}
								local t66 = {}

								for i = 1, #t64 do
									local v147 = t64[i]

									t66[t65[v147]] = v147
								end

								t63.enabled = visuals:switch("Aspect Ratio")

								local v148 = t63.enabled:create()

								t63.value = v148:slider("##VALUE", 1, 200, 177, 0.01, function(p283)
									-- upvalues: t66 (copy)
									return t66[p283] or nil
								end)

								for i = 1, #t64 do
									local v150 = t64[i]
									local v151 = t65[v150]

									v148:button(v67(v150, (math.ceil(#v150 * 1.34))), function()
										-- upvalues: t63 (copy), v151 (copy)
										t63.value:set(v151)
									end, true)
								end

								t62.aspect_ratio = t63

								local t67 = {
									enabled = visuals:switch("Viewmodel")
								}
								local v153 = t67.enabled:create()

								t67.fov = v153:slider("FOV", 2000, 17000, 6800, 0.01)
								t67.offset_x = v153:slider("X", -2000, 2000, 0, 0.01)
								t67.offset_y = v153:slider("Y", -2000, 2000, 0, 0.01)
								t67.offset_z = v153:slider("Z", -2000, 2000, 0, 0.01)
								t67.opposite_knife_hand = v153:switch("Opposite Knife Hand")
								t62.viewmodel = t67
								t68 = {
									enabled = visuals:switch("Indicators")
								}

								local v155 = t68.enabled:create()

								t68.style = v155:list("Style", {
									[1] = "Stars",
									[2] = "Pixel",
									[3] = "りそう"
								})
								t68.offset = v155:slider("Offset", 0, 200, 32, nil, "px")
								t68.accent_color = v155:color_picker("Accent", color(172, 167, 209, 255))
								t68.secondary_color = v155:color_picker("Secondary", color(255, 255, 255, 255))
								t68.style:set_callback(function(p284)
									-- upvalues: t68 (copy)
									t68.offset:visibility(p284:get() ~= 3)
									t68.accent_color:visibility(p284:get() ~= 3)
									t68.secondary_color:visibility(p284:get() ~= 3)
								end, true)
								t62.indicators = t68
								t69 = {
									enabled = visuals:switch("Solus UI")
								}

								local v157 = t69.enabled:create()

								t69.color = v157:color_picker("Color", color(172, 167, 209, 50))
								t69.select = v157:listable("##SELECT", {
									[1] = "Watermark",
									[2] = "Spectators",
									[3] = "Hotkey List",
									[4] = "Anti-aimbot indication",
									[5] = "Frequency update information"
								})
								t69.only_key_state = v157:switch("Only Key State", false)
								v74(t69.select)
								t69.select:set_callback(function(p285)
									-- upvalues: t69 (copy)
									t69.only_key_state:visibility(p285:get("Hotkey List"))
								end, true)
								t62.solus_ui = t69
								t70 = {
									enabled = visuals:switch("Watermark")
								}

								local v159 = t70.enabled:create()

								t70.style = v159:listable("Style", {
									[1] = "Branded",
									[2] = "Corner"
								})
								t70.color = v159:color_picker("Color", color(172, 167, 209, 255))
							end

							v74(t70.style, {
								[1] = "Branded"
							})
							t62.watermark = t70

							local t71 = {
								enabled = visuals:switch("Manual Arrows")
							}
							local v161 = t71.enabled:create()

							t71.style = v161:list("Style", {
								[1] = "Invictus",
								[2] = "Teamskeet",
								[3] = "Modern",
								[4] = "Ambani"
							})
							t71.animate_scope = v161:switch("Animate Scope", true)
							t71.dynamic_mode = v161:switch("Dynamic Mode", true)
							t71.offset = v161:slider("Offset", 5, 150, 40, nil, "px")
							t71.accent_color = v161:color_picker("Accent", color(172, 167, 209, 255))
							t71.secondary_color = v161:color_picker("Secondary", color(255, 255, 255, 255))
							t71.style:set_callback(function(p286)
								-- upvalues: t71 (copy)
								local v1351 = p286:get()

								t71.animate_scope:visibility(v1351 == 3)
								t71.dynamic_mode:visibility(v1351 == 1 or v1351 == 4)
							end, true)
							t62.manual_arrows = t71

							local t72 = {
								enabled = visuals:switch("Custom Scope")
							}
							local v163 = t72.enabled:create()

							t72.offset = v163:slider("Offset", 0, 500, 10, nil, "px")
							t72.position = v163:slider("Position", 0, 500, 105, nil, "px")
							t72.thickness = v163:slider("Thickness", 1, 10, 1, nil, "px")
							t72.accent_color = v163:color_picker("Accent", color(255, 255, 255, 255))
							t72.secondary_color = v163:color_picker("Secondary", color(255, 255, 255, 0))
							t72.extra_options = v163:selectable("Extra Options", {
								[1] = "Rotate Angle",
								[2] = "Dynamic Offset"
							})
							t72.exclude_lines = v163:selectable("Exclude Lines", {
								[1] = "Left",
								[2] = "Top",
								[3] = "Right",
								[4] = "Bottom"
							})
							t62.custom_scope = t72

							local t73 = {
								enabled = visuals:switch("Damage Indicator")
							}
							local v165 = t73.enabled:create()

							t73.if_override = v165:switch("If override")
							t73.font = v165:combo("Font", {
								[1] = "Default",
								[2] = "Alternative"
							})
							t73.offset = v165:slider("Offset", 2, 8, 2, nil, "px")
							t73.active_color = v165:color_picker("Active Color", color(172, 167, 209, 255))
							t73.inactive_color = v165:color_picker("Inactive Color", color(255, 255, 255, 100))
							t73.if_override:set_callback(function(p287)
								-- upvalues: t73 (copy)
								t73.inactive_color:visibility(not p287:get())
							end, true)
							t62.damage_indicator = t73

							local t74 = {
								enabled = visuals:switch("Break LC Indicator")
							}

							--t26.push(1, t74.enabled)
							t62.break_lc_indicator = t74

							local t75 = {
								enabled = visuals:switch("Velocity Warning")
							}
							local v168 = t75.enabled:create()

							t75.color_accent = v168:color_picker("Accent Color", color(255, 255, 255, 200))
							t75.color_secondary = v168:color_picker("Secondary Color", color(150, 150, 150, 255))
							t62.velocity_warning = t75

							local t76 = {
								enabled = visuals:switch("Gamesense Indicators")
							}
							local v170 = t76.enabled:create()

							t76.spectator_list = v170:switch("Spectator List", true)
							t76.feature_list = v170:listable("Indicators", {
								[1] = "Hit/Miss",
								[2] = "Dormant Aimbot",
								[3] = "Damage Override",
								[4] = "Hitchance Override",
								[5] = "Lag Compensation",
								[6] = "Hitbox Override",
								[7] = "Fake Latency",
								[8] = "Fake Angles",
								[9] = "Fake Duck",
								[10] = "Body Aim",
								[11] = "Safe Points",
								[12] = "Freestanding",
								[13] = "Bomb Info",
								[14] = "Hide Shots",
								[15] = "Double Tap"
							})
							v74(t76.feature_list, {
								[1] = "Damage Override",
								[2] = "Fake Latency",
								[3] = "Fake Duck",
								[4] = "Body Aim",
								[5] = "Safe Points",
								[6] = "Freestanding",
								[7] = "Bomb Info",
								[8] = "Hide Shots",
								[9] = "Double Tap"
							})
							t62.gamesense_indicators = t76

							local t77 = {
								enabled = visuals:switch("Kibit Markers")
							}
							local v172 = t77.enabled:create()

							t77.color_x = v172:color_picker("Color X", color(0, 255, 255))
							t77.color_y = v172:color_picker("Color Y", color(0, 255, 0))
							t77.speed = v172:slider("Time", 0, 100, 0, 0.1, "s")
							t62.kibit_markers = t77

							local t78 = {
								enabled = visuals:switch("Grenade Radius")
							}
							local v174 = t78.enabled:create()

							t78.molotov = v174:switch("Molotov", true)
							t78.molotov_color = t78.molotov:color_picker(color(245, 90, 90, 255))
							t78.smoke = v174:switch("Smoke", true)
							t78.smoke_color = t78.smoke:color_picker(color(130, 130, 255, 255))
							--t26.push(1, t78.enabled)
							t78.molotov:set_callback(function(p288)
								-- upvalues: t78 (copy)
								if not p288:get() and not t78.smoke:get() then
									t78.smoke:set(true)
								end
							end)
							t78.smoke:set_callback(function(p289)
								-- upvalues: t78 (copy)
								if not p289:get() and not t78.molotov:get() then
									t78.molotov:set(true)
								end
							end)
							t62.grenade_radius = t78

							local t79 = {
								label = visuals:label("Static Watermark")
							}
							local v176 = t79.label:create()

							t79.style = v176:list("Style", {
								[1] = "Classic",
								[2] = "Modern"
							})
							t79.position = v176:combo("Position", {
								[1] = "Bottom",
								[2] = "Left",
								[3] = "Right"
							})
							t79.remove_spaces = v176:switch("Remove Spaces")
							t79.color = v176:color_picker("Color", color(142, 165, 229, 255))

							local function v177()
								local v1355 = t70.enabled:get() or t68.enabled:get()
								local v1356 = t69.enabled:get() and t69.select:get("Watermark")

								t79.label:disabled(false)
							end

							t70.enabled:set_callback(v177)
							t68.enabled:set_callback(v177)
							t69.enabled:set_callback(v177)
							t69.select:set_callback(v177)
							v177()
							t62.static_watermark = t79
							u76:set_callback(function(p290)
								-- upvalues: visuals (copy)
								local v1358 = p290:get() == 3

								visuals:visibility(v1358)
							end, true)
							t29.visuals = t62
							t80 = {}
							misc = t30.misc
							t12.add("##MISC", misc, "MISC")
							t80.clantag = {
								enabled = misc:switch("Clantag")
							}
							t80.trashtalk = {
								enabled = misc:switch("Trashtalk")
							}

							local t81 = {
								enabled = misc:switch("Fast Ladder")
							}

							t26.push(2, t81.enabled)
							t80.fast_ladder = t81

							local t82 = {
								enabled = misc:switch("Edge Stop")
							}

							--t26.push(1, t82.enabled)
							t80.edge_stop = t82

							local t83 = {
								enabled = misc:switch("Collision Air Duck")
							}

							--t26.push(1, t83.enabled)
							t80.collision_air_duck = t83

							local t84 = {
								enabled = misc:switch("No Fall Damage")
							}

							t26.push(2, t84.enabled)
							t80.no_fall_damage = t84

							local t85 = {
								enabled = misc:switch("Super Toss")
							}

							t26.push(2, t85.enabled)
							t80.super_toss = t85

							local t86 = {
								enabled = misc:switch("Grenade Release")
							}

							t86.damage = t86.enabled:create():slider("Damage", 1, 50, 35, nil, "hp")
							t26.push(2, t86.enabled)
							t80.grenade_release = t86

							local t87 = {
								enabled = misc:switch("Fps Optimize")
							}
							local v187 = t87.enabled:create()

							t87.always_on = v187:switch("Always on")
							t87.detections = v187:selectable("Detections", {
								[1] = "Peeking",
								[2] = "Hit Flag"
							})
							t87.select = v187:selectable("Optimizations", {
								[1] = "Fog",
								[2] = "Blood",
								[3] = "Bloom",
								[4] = "Decals",
								[5] = "Shadows",
								[6] = "Sprites",
								[7] = "Particles",
								[8] = "Ropes",
								[9] = "Dynamic lights",
								[10] = "Map details",
								[11] = "Weapon effects",
								[12] = "Teammates"
							})
							v74(t87.detections)
							v74(t87.select, {
								[1] = "Blood",
								[2] = "Decals",
								[3] = "Sprites",
								[4] = "Ropes",
								[5] = "Dynamic lights",
								[6] = "Weapon effects"
							})
							t87.always_on:set_callback(function(p291)
								-- upvalues: t87 (copy)
								t87.detections:visibility(not p291:get())
							end, true)
							t80.fps_optimize = t87

							local t88 = {
								enabled = misc:switch("Ping Unlocker")
							}

							t88.value = t88.enabled:create():slider("Latency", 0, 200, 0, nil, "ms")
							t26.push(2, t88.enabled)
							t80.ping_unlocker = t88

							local t89 = {
								enabled = misc:switch("Animation Breaker")
							}
							local v190 = t89.enabled:create()

							t89.air_legs = v190:combo("Air Legs", {
								[1] = "Disabled",
								[2] = "Static",
								[3] = "Haram"
							})
							t89.ground_legs = v190:combo("Ground Legs", {
								[1] = "Default",
								[2] = "Static",
								[3] = "Jitter",
								[4] = "Allah",
								[5] = "Kangaroo"
							})
							t89.legs_offset_1 = v190:slider("Offset 1", 0, 100, 100)
							t89.legs_offset_2 = v190:slider("Offset 2", 0, 100, 100)
							t89.body_lean = v190:slider("Body Lean", -1, 100, -1, nil, function(p292)
								return p292 == -1 and "Off" or p292 .. "%"
							end)
							t89.pitch_on_land = v190:switch("Pitch on Land", true)
							t26.push(2, t89.enabled)
							t89.ground_legs:set_callback(function(p293)
								-- upvalues: t89 (copy)
								local v1362 = p293:get() == "Jitter"

								t89.legs_offset_1:visibility(v1362)
								t89.legs_offset_2:visibility(v1362)
							end, true)
							t80.animation_breaker = t89
						end

						local t90 = {
							label = misc:label("Fake Duck")
						}

						t90.options = t90.label:create():selectable("Options", {
							[1] = "Unlock Speed",
							[2] = "On Freezetime"
						})
						t26.push(2, t90.label)
						t26.push(2, t90.options, {})
						t80.fake_duck = t90

						local t91 = {
							label = misc:label("Nickname Generator")
						}
						local v193 = t91.label:create()

						t91.input = v193:input("##INPUT")
						t91.set_button = v193:button(v67("Set", 11), nil, false)
						t91.generate_button = v193:button(v67("Generate", 5), nil, true)
						t91.reset_button = v193:button(v67("Reset", 8), nil, true)
						t80.nickname_generator = t91
						u76:set_callback(function(p294)
							-- upvalues: misc (copy)
							local v1364 = p294:get() == 4

							misc:visibility(v1364)
						end, true)
						t29.misc = t80

						local v194 = ui.get_icon("sparkles")

						t7.create("~", "##COPYRIGHT", n6):label(v7("\a{Link Active}", v194, v66(4), t1.name, "\aDEFAULT",
							" — 2026"))
						t92 = {}

						local n7 = 0
						local n8 = 0

						t92.is_onground = false
						t92.is_moving = false
						t92.is_crouched = false
						t92.is_peeking = false
						t92.is_vulnerable = false
						t92.velocity2d = 0
						t92.duck_amount = 0
						t92.team_num = 0
						t92.sent_packets = 0
						t92.forwardmove = 0
						t92.sidemove = 0

						local function v198(p295)
							-- upvalues: t2 (ref)
							local v1366 = false
							local v1367 = false
							local m_vecVelocity = p295.m_vecVelocity
							local v1369 = p295:get_eye_position()
							local v1370 = t2.extrapolate(v1369, m_vecVelocity, 14)
							local v1371 = entity.get_players(true)
							local v1372 = entity.get_threat(true)

							for i = 1, #v1371 do
								local v1374 = v1371[i]

								if v1374:is_alive() then
									if v1374 ~= v1372 then
										local v1375 = v1374:get_hitbox_position(0)
										local v1376 = t2.extrapolate(v1375, m_vecVelocity, 4)
										local v1377 = utils.trace_bullet(p295, v1370, v1376)

										if v1377 ~= nil and v1377 > 0 then
											v1366 = true

											return v1366, v1367
										end
									else
										v1367 = true
									end
								end
							end

							return v1366, v1367
						end

						events.createmove(function(p296)
							-- upvalues: v198 (copy), n7 (ref), t92 (ref)
							local v1379 = entity.get_local_player()

							if v1379 ~= nil then
								local v1380, v1381 = v198(v1379)

								n7 = v1379.m_fFlags
								t92.velocity2d = v1379.m_vecVelocity:length2d()
								t92.is_peeking = v1380
								t92.is_vulnerable = v1381

								if p296.choked_commands == 0 then
									t92.duck_amount = v1379.m_flDuckAmount
									t92.sent_packets = t92.sent_packets + 1
								end

								t92.is_moving = not (t92.velocity2d <= 3.63)
								t92.is_crouched = not (t92.duck_amount <= 0)
								t92.team_num = v1379.m_iTeamNum
								t92.forwardmove = p296.forwardmove
								t92.sidemove = p296.sidemove

								return
							end
						end)
						events.createmove_run(function(_)
							-- upvalues: n8 (ref), t92 (ref), n7 (ref)
							local v1383 = entity.get_local_player()

							if v1383 ~= nil then
								n8 = v1383.m_fFlags
								t92.is_onground = bit.band(n7, 1) == 1 and bit.band(n8, 1) == 1

								return
							end
						end)
						t93 = {}

						local u200 = nil
						local n9 = 0

						t93.max_defensive_ticks = 0
						t93.defensive_ticks = 0
						t93.teleport_units_sqr = 0

						local function v202(p298)
							-- upvalues: n9 (ref), t93 (ref)
							local m_nTickBase = p298.m_nTickBase

							if math.abs(m_nTickBase - n9) > 64 then
								n9 = 0
							end

							local n10 = 0

							if not (m_nTickBase > n9) then
								if m_nTickBase < n9 then
									n10 = math.min(14, math.max(0, n9 - m_nTickBase - 1))
								end
							else
								n9 = m_nTickBase
							end

							if not (n10 > 0) then
								t93.defensive_ticks = 0
								t93.max_defensive_ticks = 0
							else
								if t93.max_defensive_ticks == 0 then
									t93.max_defensive_ticks = n10
								end

								t93.defensive_ticks = n10
							end
						end
						local function v203(p299, p300)
							-- upvalues: t93 (ref)
							t93.teleport_units_sqr = (p300 - p299):lengthsqr()
						end
						local function v204(p301)
							-- upvalues: u200 (ref), v203 (copy)
							local v1390 = p301:get_simulation_time()

							if v1390 ~= nil then
								local m_vecOrigin = p301.m_vecOrigin

								if u200 ~= nil then
									local v1392 = to_ticks(v1390.current - v1390.old)

									if not (v1392 >= 0) or v1392 > 0 and v1392 <= 64 then
										v203(u200, m_vecOrigin)
									end
								end

								u200 = m_vecOrigin

								return
							end
						end

						events.createmove(function()
							-- upvalues: v202 (copy)
							local v1393 = entity.get_local_player()

							if v1393 ~= nil then
								v202(v1393)

								return
							end
						end)
						events.net_update_start(function()
							-- upvalues: v204 (copy)
							local v1394 = entity.get_local_player()

							if v1394 ~= nil then
								v204(v1394)

								return
							end
						end)
						t94 = {}

						local u206 = nil

						local function v207()
							-- upvalues: t92 (ref), t3 (ref)
							if not t92.is_onground then
								return t92.is_crouched and "Air & Crouching" or "Air"
							end

							if not t3.antiaim.misc.slow_walk:get() then
								if t92.is_moving then
									if not t92.is_crouched then
										return "Running"
									end

									return "Move & Crouching"
								end

								if not t92.is_crouched then
									return "Standing"
								end

								return "Crouching"
							end

							return "Slow motion"
						end

						function t94.get()
							-- upvalues: u206 (ref)
							return u206
						end

						events.createmove(function()
							-- upvalues: u206 (ref), v207 (copy)
							u206 = v207()
						end)
						t95 = {}

						local v209 = t4:new()
						local t96 = {}

						local function v211(p302)
							local tickcount = globals.tickcount
							local v1397 = p302:get_eye_position()

							return {
								tick = tickcount,
								player = p302,
								eye_pos = v1397,
								impacts = {}
							}
						end

						function t95.get_event_bus()
							-- upvalues: v209 (copy)
							return v209
						end

						events.weapon_fire(function(p303)
							-- upvalues: t96 (copy), v211 (copy)
							local v1399 = entity.get(p303.userid, true)

							if v1399 ~= nil then
								table.insert(t96, v211(v1399))

								return
							end
						end)
						events.player_hurt(function(p304)
							-- upvalues: t96 (copy)
							local v1401 = entity.get(p304.userid, true)
							local v1402 = entity.get(p304.attacker, true)

							if v1401 ~= nil and v1402 ~= nil then
								for i = #t96, 1, -1 do
									local v1404 = t96[i]

									if v1402 == v1404.player then
										v1404.victim = v1401
										v1404.damage = p304.dmg_health
										v1404.hitgroup = p304.hitgroup

										return
									end
								end

								return
							end
						end)
						events.bullet_impact(function(p305)
							-- upvalues: t96 (copy)
							local v1406 = entity.get(p305.userid, true)

							if v1406 ~= nil then
								for i = #t96, 1, -1 do
									local v1408 = t96[i]

									if v1406 == v1408.player then
										local v1409 = vector(p305.x, p305.y, p305.z)

										table.insert(v1408.impacts, v1409)

										return
									end
								end

								return
							end
						end)
						events.net_update_start(function()
							-- upvalues: t96 (copy), v209 (copy), t2 (ref)
							local v1410 = entity.get_local_player()

							if v1410 ~= nil then
								local v1411 = nil

								if v1410:is_alive() then
									v1411 = v1410:get_hitbox_position(0)
								end

								for i = 1, #t96 do
									local v1413 = t96[i]
									local v1414 = #v1413.impacts

									if v1414 ~= 0 then
										local eye_pos = v1413.eye_pos
										local v1416 = v1413.impacts[v1414]

										v209.player_shot:fire({
											tick = v1413.tick,
											player = v1413.player,
											victim = v1413.victim,
											eye_pos = eye_pos,
											end_pos = v1416,
											damage = v1413.damage,
											hitgroup = v1413.hitgroup
										})

										if v1411 ~= nil and v1413.player ~= nil and v1413.player:is_enemy() then
											local v1417 = v1411:distsqr((t2.closest_ray_point(eye_pos, v1416, v1411, true)))

											if v1417 <= 6400 then
												local v1418 = math.sqrt(v1417)

												v209.enemy_shot:fire({
													tick = v1413.tick,
													distance = v1418,
													player = v1413.player,
													victim = v1413.victim,
													eye_pos = eye_pos,
													end_pos = v1416,
													damage = v1413.damage,
													hitgroup = v1413.hitgroup
												})
											end
										end
									end
								end

								for i = 1, #t96 do
									t96[i] = nil
								end

								return
							end
						end)
						t97 = {}

						local s6 = "lTZA7O1VkC3wj2YacHuBdMPRE8mtQXpnJKe5Ux9L4SIvNirWohDygszf60FbqG+/="
						local v214 = ".\\" .. t1.name
						local v215 = v214 .. "\\db.dat"
						local t98 = {}

						local function v217()
							-- upvalues: v215 (copy)
							return files.read(v215)
						end
						local function v218(p306, p307)
							-- upvalues: v215 (copy)
							if p307 == nil then
								p307 = false
							end

							return files.write(v215, p306, p307)
						end
						local function v219(p308)
							-- upvalues: base64 (copy), s6 (copy)
							local ok, result = pcall(json.stringify, p308)

							if ok then
								local ok2, result2 = pcall(base64.encode, result, s6)

								if ok2 then
									return true, result2
								end

								return false, result2
							end

							return false, result
						end
						local function v220(p309)
							-- upvalues: base64 (copy), s6 (copy)
							local ok, result = pcall(base64.decode, p309, s6)

							if ok then
								local ok3, result3 = pcall(json.parse, result)

								if ok3 then
									return true, result3
								end

								return false, result3
							end

							return false, result
						end
						local function v221(p310)
							-- upvalues: v214 (copy), v219 (copy), t11 (ref), v218 (copy)
							files.create_folder(v214)

							local v1433, v1434 = v219(p310)

							if v1433 then
								if v218(v1434) then
									return true
								end

								t11.error("Unable to write db")

								return false
							end

							t11.error("Unable to encode data")

							return false
						end

						local t99 = {
							__index = function(_, p312)
								-- upvalues: t98 (ref)
								return t98[p312]
							end,
							__newindex = function(_, p314, p315)
								-- upvalues: t98 (ref), v221 (copy)
								t98[p314] = p315
								v221(t98)
							end
						}

						t98 = (function()
							-- upvalues: v214 (copy), v217 (copy), v221 (copy), t11 (ref), v220 (copy)
							files.create_folder(v214)

							local v1435 = v217()

							if v1435 ~= nil then
								local v1436, v1437 = v220(v1435)

								if v1436 then
									return v1437
								end

								t11.error("Unable to decode db")
								t11.log("Trying to flush db")

								if not v221({}) then
									t11.error("Unable to flush db")
								end

								return {}
							end

							if not v221({}) then
								t11.log("Unable to create db")
							end

							return {}
						end)()
						setmetatable(t97, t99)
						t100 = {}

						local t101 = {}

						function t100.get(p316)
							-- upvalues: t101 (copy)
							if p316 ~= nil then
								return t101[p316:id()]
							end

							return nil
						end

						events.render(function()
							-- upvalues: t101 (copy)
							local v1443 = ui.get_binds()

							for k in pairs(t101) do
								t101[k] = nil
							end

							for i = 1, #v1443 do
								local v1446 = v1443[i]

								t101[v1446.reference:id()] = v1446
							end
						end)

						local links = t29.links

						links.discord:set_callback(function()
							panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/K9Hwhmc9eH")
						end)
						links.youtube:set_callback(function()
							panorama.SteamOverlayAPI.OpenExternalBrowserURL(
								"https://discord.gg/K9Hwhmc9eH")
						end)
						links.config:set_callback(function()
							panorama.SteamOverlayAPI.OpenExternalBrowserURL(
								"https://discord.gg/K9Hwhmc9eH")
						end)
						t102 = {}

						local configs = t29.configs
						local s7 = "MNVaEeiPfvJ4BgzWUmtsRZFS8OXc9kqhy3dobp5IDwuTAG6Kl2Cr7HnY10jxLQ+/="
						local s8 =
						"qCfof7ezm72eRHQNXSfdzdvxSVf2Ba9CBaMlgrN9fowxSVfCgr9nzsyrgrN9foD2BY7ASVf2gsEnBo90goECSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsRHgaEHBaMHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsb7gsRlBrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2goUrgsy7BoEYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2grUYgof1Ba8HSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrE2grBrBofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaRngaMCzsR1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsbnBobnBak9fowxSVfCgr9nzsyrgrN9foDHgY7ASVfrBoblBs82Bav9fowxSVfCgr9nzsyrgrN9foDr4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrbHgoECBoR1gpldzIG9fofYgr80zaBYBeldzoR1ht29foU2zaM2gaRHBrO9fowxSVfCgr9nzsyrgrN9foDrBP7ASVfYgoE1gs9ngrk9fowxSVfCgr9nzsyrgrN9foDGBoeQ4eldzaf2go92go9lSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQNXSfyvdNa95QH8n3wc59dzdvxSVfCBayYgsRYzs8nSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fofCga9HBrU2zsN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCgaBrBsflBsf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsMlBsB0grM2SVfjqHldBo9Ygob1Br9lSVfj4sfnht29foBlzaE2ga80BoN9fowxSVfCgr9nzsyrgrN9foDrgY7ASVfrBo9YgoRYBsUCSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrBr8ngsRCzaB7SVfjqHldBo9Ygob1Br9lSVfjgspQ4eldBrR2gs8HBoE2BeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8ngrBrzsMrzeldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzsfCBs9CBoe9fowxSVfCgr9nzsyrgrN9foDlht29foR2zsy7goM1zZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldgobCgrRngsylSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0Bs8YgrynBpldzIG9fofYgr80zaBYBeldzoNQ4eldzsbHBabYBse9fowxSVfCgr9nzsyrgrN9foDHzPHQfdldfCgNsbkBmZghUYvKkFgDXF0IfoDdqHldBsU0zsMCBa80BZldzIG9fofYgr80zaBYBeldzd7rBS7ASVf2gsB2gafCBr81SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs8lBrB2Bo81geldzIG9fofYgr80zaBYBeldzoNQ4eldBoU2Bry0gsU1geldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCzabnBoRYzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof0gaflzaflgsN9fowxSVfCgr9nzsyrgrN9foDlht29foB2zsM1zaRHgag9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBCzsUnzsylgo39fowxSVfCgr9nzsyrgrN9foDlht29foBHBoBCgs8ngre9fowxSVfCgr9nzsyrgrN9foDlht29foBYBrUYBsfYgap9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrgr8rBrBYgs92SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Bay0gaR1gsUlSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foyrBoE0zaB7BpldzIG9fofYgr80zaBYBeldzoUHht29foy7zsyrBaR7BeldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsS7O3XnZA8F9dzdvxSVf2BrErgof7goy1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsBHzsU0gaBCgZldzIG9fofYgr80zaBYBeldzoNQ4eldBs8Cgob0BsB1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBs87zaE7grB0gHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBrfHzsfHzsb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaBHgr8CzsRHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsMCBr90Bs9YSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoblBrRngaBrBpldzIG9fofYgr80zaBYBeldzoNQ4eldBobYBsBngs9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldBrBHgaM2BrBlBpldzIG9fofYgr80zaBYBeldzo8lht29foBnBoM0BrB1gsg9fowxSVfCgr9nzsyrgrN9foDlht29foBngaU1Ba97gom9fowxSVfCgr9nzsyrgrN9foDlht29foUlgsR7zsyYgae9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldgrBYBsf7BrU1SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghmIvpOSg78F0bXF0IfoDdqHldBsB0zaBYgsb0zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEHBsRHgsfYgsp9fowxSVfCgr9nzsyrgrN9foDlht29fofCgob2gsyrBrN9fowxSVfCgr9nzsyrgrN9foDlht29fofrgrfHBofHgre9fowxSVfCgr9nzsyrgrN9foDlht29fofYBoB1gsB1zsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCzablBs9lBsv9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrErzaElBoE1BeldzIG9fofYgr80zaBYBeldzoNQ4eldBrUHBobCgs9HgpldzIG9fofYgr80zaBYBeldzoNQ4eldBryHBoMrgrynBeldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7BaMrBsM0gav9fowxSVfCgr9nzsyrgrN9foDlht29foUlgr97grB0zsO9fowxSVfCgr9nzsyrgrN9foDlht29fo92BrRHzaB0gZldzIG9fofYgr80zaBYBeldzoNQ4eldgrf7BsfYBoBnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfYzsbHBrBngsO9fowxSVfCgr9nzsyrgrN9foDnBPHQfdldfCgNsbkBmZghsFe6kFeAfep3kCfjfIG9foECBoBngsM7grk9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2BoBngobrzaZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsRHBay1zs97gHldzIG9fofYgr80zaBYBeldzoNQ4eldBs9lgsR1gsf0gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoM1BsE0Ba91geldzIG9fofYgr80zaBYBeldzoNQ4eldBoBYBoyHBaE1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBrMrgrf2Br92BHldzIG9fofYgr80zaBYBeldzoNQ4eldBrUCBaBHBay1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBrUrzsflzaMHgHldzIG9fofYgr80zaBYBeldzoNQ4eldBr9rzsRnza90SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrza9YgoUCgoy2SVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foUCzabHBaU1gsv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7zsErBr91gZldzIG9fofYgr80zaBYBeldzoNQ4eldzsEYgry0BaE1SVfjqHldBo9Ygob1Br9lSVfjgoNQhtfAfdBoUR0PsEZsS7HKk5RyvdNa95QH8n3wc59dzdvxSVfCBr9lgoy2BoR2SVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBoU1za8rBsyrgpldzIG9fofYgr80zaBYBeldzovQ4eldBoRrBaU7zaBHBHldzIG9fofYgr80zaBYBeldzoNQ4eldBo81BsyCza9rSVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0BrR1BoE0BHldzIG9fofYgr80zaBYBeldzoNQ4eldBr82gaBlgr80BeldzIG9fofYgr80zaBYBeldzo8lht29foBYgrRlzs90gsO9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB1gsf7gay1gae9fowxSVfCgr9nzsyrgrN9foDGgsmQ4eldBryHzaB2Bo8lzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnzsb1BoB7gZldzIG9fofYgr80zaBYBeldzoBASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7BaRCgsU1BrU0SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgoR0Bo8rBsUHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnzsf7BsMrBoN9fowxSVfCgr9nzsyrgrN9foDGzP7ASVf1zsECBabHgok9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQWcdNH9nRdzdvxSVf2BafngrUHBoE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Ba8HgoR7Br9CSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foErzaRYBr81Bo39fowxSVfCgr9nzsyrgrN9foDlht29foEnga8YgoErBsp9fowxSVfCgr9nzsyrgrN9foDlht29foE0goUrBrRlBop9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCgrbHgoR7BsfrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgs9YBaECgo39fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBr87Bo8lgsbnBeldzIG9fofYgr80zaBYBeldzo8lht29foBngr90BaE2zs39fowxSVfCgr9nzsyrgrN9foDlht29foUlgay0grbrgrZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BaRlBr80Br87SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BsUCgoMngoN9fowxSVfCgr9nzsyrgrN9foDlht29foUHgab0zsfYgpldzIG9fofYgr80zaBYBeldzoNQ4eldzaU2BrU2go97SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghRIZ6c5p6OCfjfIG9foElzaE1Ba90Bag9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2BoErgrEngsEYSVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBsRrBrU7BoMCzeldzIG9fofYgr80zaBYBeldzo8lht29foE0gaMlzsRnBsk9fowxSVfCgr9nzsyrgrN9foDlht29foflBa91zs80zsm9fowxSVfCgr9nzsyrgrN9foDlht29foflgrRnzsyrgre9fowxSVfCgr9nzsyrgrN9foDlht29fofYBoRCgo8HBsZ9fowxSVfCgr9nzsyrgrN9foDlht29fofYgab2gaM2BoO9fowxSVfCgr9nzsyrgrN9foDCht29foB2gsb1BrE7Bag9fowxSVfCgr9nzsyrgrN9foDr4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrb2zsy1BoEnBpldzIG9fofYgr80zaBYBeldzd7CBP7ASVf7Bs90gs9rgsN9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUnBryCgob1gHldzIG9fofYgr80zaBYBeldzd77gS7ASVfYBrErBoUlgag9fowxSVfCgr9nzsyrgrN9foDlht29fo9HBoU1BaMHzZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghRne5OtNfOFebfoDdqHldBsMngaf2go8nzeldzIG9fofYgr80zaBYBeldzo8lht29foECBsUlBsE2BsZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBs97BoE0gr81BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsb0BsMlBsEYgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflgsbCzaE7Bop9fowxSVfCgr9nzsyrgrN9foDlht29foflzsU1BsBnzsp9fowxSVfCgr9nzsyrgrN9foDGBsNQ4eldBoBCBrBYBoBlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoRnBrUHBrflBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo9CgoElBr9YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy1zsRYgaEYBZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrBsRHzabrgsyrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrB1ga9lza9CBHldzIG9fofYgr80zaBYBeldzoNQ4eldBrb7gab2BrUngHldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgaf1BrEHSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghRn3395ZbfoDdqHldBsf2grU2BoR0BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gsB7go9rgo39fowxSVfCgr9nzsyrgrN9foDlht29foEHBr97zsRlgap9fowxSVfCgr9nzsyrgrN9foDlht29foEYzsyHBsbHgaN9fowxSVfCgr9nzsyrgrN9foDlht29fof1BaUnBoBrgsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof0ga97Bsfrgam9fowxSVfCgr9nzsyrgrN9foDlht29foBlgoE1gsy1zav9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BoMlgrBYgsbnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaflBoECgrR1gZldzIG9fofYgr80zaBYBeldzoNQ4eldgaUHBs8CgsEYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgsM0gaR0gay0SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foRngoM2zay1BZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMngrRYgabYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsBlzsb1zsZ9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQsciQYfiHKkipKcdfjfIG9foErgoU1gaR0Bsv9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrU7gZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gs9CgoBlgaErSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE7BaMHgrRYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zab0gaMrzam9fowxSVfCgr9nzsyrgrN9fow79IZpht29foE0zsEnBsR0gae9fowxSVfCgr9nzsyrgrN9foDlht29foflBr97zs8CBog9fowxSVfCgr9nzsyrgrN9foD7BI7ASVfCBsb7zsEYBof2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrRYgs82Bo8lSVfjqHldBo9Ygob1Br9lSVfj4sB1ht29fofrzsRHga87zZldzIG9fofYgr80zaBYBeldzo8lht29foBlBrElBoyrzsN9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrgr91BrRYzsfHSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foU2BoM1gaB7gse9fowxSVfCgr9nzsyrgrN9foDlht29foy2zsb7BabHgpldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsSHg78F0bXF0IfoDdqHldBsfCgsBnBo82BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gsyCBsMHzsU1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr82zs9lBr8lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsMCzaMnBoE1SVfjqHldBo9Ygob1Br9lSVfjBrgQ4eldBsb7Bsy0Brb7gpldzIG9fofYgr80zaBYBeldzoNQ4eldBo80Ba8rgsB1BZldzIG9fofYgr80zaBYBeldzoeQ4eldBoy0grUHzafnSVfjqHldBo9Ygob1Br9lSVfj4s80ht29fof0ga8lzabngok9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrBa92BaEHBsM2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrBHzaR7gs8rgeldzIG9fofYgr80zaBYBeldzoBASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrzsb0gaEHzaM2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHBo9CBsUlzav9fowxSVfCgr9nzsyrgrN9foDlht29fo80BsfHzsM2gHldzIG9fofYgr80zaBYBeldzoNQ4eldzsfYBa8HgaBlSVfjqHldBo9Ygob1Br9lSVfjgoNQhtfAfdBoUR0RtRevsZQgURpzfoDdqHldBsR7goEHgr97geldzIG9fofYgr80zaBYBeldzoeQ4eldBrUlBrUrgoUlBeldzIG9fofYgr80zaBYBeldzImCkFZQhtfAfdBoUR0RtRevsZQsmZmRtR0PRCfjfIG9foflzabHgaU0zsN9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEYBob1zsyCgsp9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzsy1BrB2zay2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofHgo82goRrgrZ9fowxSVfCgsUCgoblgrk9fowcqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1Bpldz5O3cPgp4eldBsbCzafCzs82SVfjkPvHOt29foE0BrU0gobYgeldzo8ASVfCBablgsEHBaE1SVfjBt29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldz5O3cPgphZ7ASVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BoM1BsU0gsMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgay2ga8nBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCzafrgoE7zabCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foBlzsb2goE0zsp9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foflzsMCBrMYgog9fowxSVfCgr9nzsyrgrN9foD7BP7ASVfCBs9rBa81zaR0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoRCBaR2Brb7gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgsMngaE1gsp9fowxSVfCgr9nzsyrgrN9foD2hSHQ4eldBrRnBob1grb2BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgrRngo9lzsm9fowxSVfCgr9nzsyrgrN9foD2ht29fo97zablgsBngeldzIG9fofHgafnzsMYgHldzpGxSVf2gafYzaRHzaBnSVfjO5eA9nRASVf2grBHgrMnBsyCSVfjBV29foE0BoyCBobnBZldzoEASVf2zsB7zs80grm9foD0BV29foflzsMHBsRlBs39foDl4eldBoB0zsU7BablgZldzoMASVfrBrMYBa81Br8rSVfjO5eA9nZQ4PG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9foDl4eldBsbCzafCzs82SVfjBd29foE0BrU0gobYgeldzoy14eldBoM0BaR2gsM2zeldzoMASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow58F2rOSHk4eldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCgay2ga8nBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCzafrgoE7zabCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foyHBaM0zsRnBHldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4Vfof7ezZEpNtRHhRHmNZERdzdvxSVf2BsM0BrB1BaBnSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2BsbrgryYgoRnSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gaUrBob0gs91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gabYBafHBafHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsR1zsU0gaMnzZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs8YBrRrzsErgHldzIG9fofYgr80zaBYBeldzoNQ4eldBs8YBr9CgrU7BHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs9CgrU7zaUYgZldzIG9fofYgr80zaBYBeldzoNQ4eldBs91goE2ga8rSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE2gobHBaRCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zab1BrUlgablSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsb1BoblgsMnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrB1zs8nzsEnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBngoErBrMngHldzIG9fofYgr80zaBYBeldzoNQ4eldBoBnza82zsfnSVfjqHldBo9Ygob1Br9lSVfjBseQ4eldBoUlBrE0BofCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoR7grRYBafHgHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo8CzaU0gsBHgHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo81gsBCgav9fowxSVfCgr9nzsyrgrN9foDlht29fof1grB7BoBHBaO9fowxSVfCgr9nzsyrgrN9foDlht29foBlzs9lgrU1grZ9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB2BablgrMHzaN9fowxSVfCgr9nzsyrgrN9foDlht29foBrBoM2goMCBrp9fowxSVfCgr9nzsyrgrN9foDlht29foB7BobCzs9YBre9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrzaUCBob1Bsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHzaU1zsE0Bo39fowxSVfCgr9nzsyrgrN9fow79IZpht29foyrBs91BsErgHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7ew9dfjfIG9foElBry1Bsf1BrO9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2BsU7Br97grbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2BrMrzs9Yzse9fowxSVfCgr9nzsyrgrN9foD2ht29foE7gaU0BsU2gsv9fowxSVfCgr9nzsyrgrN9foDGgaZQ4eldBsUHgoR0BofnzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsRrgr9Ygr82geldzIG9fofYgr80zaBYBeldzoNQ4eldBsylgoBlBaElBpldzIG9fofYgr80zaBYBeldzo8lht29foE1BsEnzsRlgsv9fowxSVfCgr9nzsyrgrN9foDlht29fof7BaR2zsU2gap9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgrUCzsRHzaRHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryrBsy1goB7SVfjqHldBo9Ygob1Br9lSVfjBsylht29foBHBayYzaRnBap9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsElBa91gaE7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrR1Bsb7ga97gpldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBrR0Ba80goe9fowxSVfCgr9nzsyrgrN9foD0BP7ASVfrgryrzs9HBrflSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzsfrgrblBsR0SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU2BoRlgobngoZ9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf7Bof1zs8rzsbCSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo8ngs87zaMCSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfYgo87BoRCBsm9fowxSVfCgr9nzsyrgrN9foDGzsNQhtfAfdBomEZimR0stZOeS7ew9dM5fEgCcYZoXip6OCfjfIG9foECgs8lBry2gsg9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2BoylgaEHSVfjqHldBo9Ygob1Br9lSVfjBsfl4eldgaMHBaU1BoEHBeldzIG9foU2grBHBrE2gsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsR1zayHBrMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsbCzsB7za8nSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gofCgrU7BaUnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs91gayYBobHBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE1goy2gryrgoe9fowxSVfCgr9nzsyrgrN9foDlht29foE0Bsy2gaB7zsZ9fowxSVfCgr9nzsyrgrN9foD2ht29fof2Brf1zafngoO9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgaf1goE0zak9fowxSVfCgr9nzsyrgrN9foDlht29fof7zsy2ga9rgam9fowxSVfCgr9nzsyrgrN9foDlht29fof1goBrzaBlgr39fowxSVfCgr9nzsyrgrN9foDlht29fof0BoBnBr9rBsm9fowxSVfCgr9nzsyrgrN9foD2zaNQ4eldBob1gaylBo8rgpldzIG9fofYgr80zaBYBeldzoflht29foBlBrfYzs9nBrv9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrElzsMYBaR1BeldzIG9fofYgr80zaBYBeldzoNQ4eldBrE0Br8HgoR2BpldzIG9fofYgr80zaBYBeldzoeQ4eldBrBHzaRnBs91BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7grMnBsbYgoe9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYzaM2gaUHgoe9fowxSVfCgr9nzsyrgrN9foDlht29fobrgoylBrB2zZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7gCcYZoXip6OCfjfIG9foElBaEYBsb0gsm9fowxSVfCgr9nzsyrgrN9foDlht29foElgrR1BoMHgsO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2zaB2ga80grEYSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1Br9rzaf7zsm9fowxSVfCgr9nzsyrgrN9foD2ht29foE0gsRlgoEngre9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCBsR7BrE0gr8YSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrbCBsR7zs9nSVfjqHldBo9Ygob1Br9lSVfjBsylht29fofngaB0goblBrv9fowxSVfCgr9nzsyrgrN9fow79IZpht29fof1grB7BoBHBaO9fowxSVfCgr9nzsyrgrN9foDlht29fof0zsU7BofHBsv9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBHgsb1goMlgaO9fowxSVfCgr9nzsyrgrN9foDlht29foBnBsf7BoBYBaN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrzaRHza97BsUCSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1zsBHgrylzaZ9fowxSVfCgr9nzsyrgrN9foD2ht29foUCBsf0gaf0zsk9fowxSVfCgr9nzsyrgrN9foDlht29fo8Hza8lBs9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfngoBCgrf7gsZ9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfngoRlgsylgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9nzsM7gsfCgpldzIG9fofYgr80zaBYBeldzoflht29foy1zaBrBoBHgpldzIG9fofYgr80zaBYBeldzoNQ4eldzay0gaflgoR7SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhm5eTOF23OCfjf50Hcild4Vfof7membZzR7pFmZQi95Zp9Ym3c5mwc59dzdvxSVf2Ba8rzsB2BoynSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gaUYzaU7ga82SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1goR7grE2BsO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zabHgofrBrE1SVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE0grRnzay1goe9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zsyCzsMHBaO9fowxSVfCgr9nzsyrgrN9foDlht29foflBrfngoRHgrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgsU0grBCzaEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoU1grE0goM1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoy1gsUYgoR1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsM7gaylzaB7SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBobrga9ngr9CgZldzIG9fofYgr80zaBYBeldzoNQ4eldBrECgrB7BrRCgpldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7za92BafrgpldzIG9fofYgr80zaBYBeldzoNQ4eldBrU7Bs9HgabCSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrUHgaM7goUrzZldzIG9fofYgr80zaBYBeldzoNQ4eldBry0BryCBo80gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB0ga9HBoUngop9fowxSVfCgr9nzsyrgrN9foDlht29fo8rBaMngo81zeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy7gsE0BrMCBHldzIG9fofYgr80zaBYBeldzoflht29fobCBablgo9ngZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7H3cIZ3cVNO8S9dzdvxSVf2BaflBrb7zaU0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsEngaB7zab0gHldzIG9fofYgr80zaBYBeldzoNQ4eldBsU7go92gr8ngpldzIG9fofYgr80zaBYBeldzoNQ4eldBsU1zsyHBsE2gHldzIG9fofYgr80zaBYBeldzoNQ4eldBsRlgaflBrbYgHldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foEngrR2Ba9HgeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2grM1gsR7zs8CSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsM2BsbCBsfHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBofrBsfCBry2BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUlBrE0BofCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoRYBrRYgrE0gZldzIG9fofYgr80zaBYBeldzoNQ4eldBo87zaM2gsB1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoyHBaRrzs87gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrf2BsyrgrM2gHldzIG9fofYgr80zaBYBeldzo8lht29foB7BaBrBsfCBap9fowxSVfCgr9nzsyrgrN9foDlht29foB7BoE2Bob2grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgr82zaM7BoEHSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgaMHgs9lgrU2zZldzIG9fofYgr80zaBYBeldzoNQ4eldgafngaE1za8nzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUngaBCgay7BHldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfHgo92gsRrBsO9fowxSVfCgr9nzsyrgrN9foDCBPHQfdldfCgEmROespgvZbZhsFQnOtM5fEgCcYZoXip6OCfjfIG9foE2grMYBrM2gap9fowxSVfCgr9nzsyrgrN9fow79IZpht29foE7go91BrEHgap9fowxSVfCgr9nzsyrgrN9foDrgoNQ4eldBsR2goMCgayYBHldzIG9fofYgr80zaBYBeldzo8lht29foEngsRrgrBrBsk9fowxSVfCgr9nzsyrgrN9foDlht29foE1Bs8HBoynzsp9fowxSVfCgr9nzsyrgrN9foDCht29foflgry1grR2zaN9fowxSVfCgr9nzsyrgrN9foDlht29fof2gsMnBob2Brv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgs92BrE2gaM0SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCgo97Bo9CBab1SVfjqHldBo9Ygob1Br9lSVfjBS7ASVfCzsBHzaU2BsB1SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0Bryrzsf2gre9fowxSVfCgr9nzsyrgrN9foDGgaZQ4eldBrfYBofrBsR7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrflBs8lBoB0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgaynBoyYBs9HSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr9rgoEHgsb1BZldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYgrU7Bablgsk9fowxSVfCgr9nzsyrgrN9foDlht29foUCgs9rBoBlBHldzIG9fofYgr80zaBYBeldzoNQ4eldgsBCBrf2zsBrSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfnBaB7zsUHBrv9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf1BaB2gsf0gsZ9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldzsbYgaf7ga81SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhsn1ykSgpfoDdqHldBsMnBsMrza8YzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2BoR7BoBrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBs8YBoflBofrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaM1Bob2gsMrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBsbnBsRngsErBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoB2BoRCgs9ngpldzIG9fofYgr80zaBYBeldzoNQ4eldBoRCgsMnzsBnBpldzIG9fofYgr80zaBYBeldzoflht29fofngoElBoE0zae9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgoyHBrf7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoyCgr9nBsRlBZldzIG9fofYgr80zaBYBeldzoNQ4eldBrMlgaBYBoEYBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7gaUHgrfYgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBYBa92zay7Bov9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr92grMrBa9lzeldzIG9fofYgr80zaBYBeldzo8lht29foB0BrR2gsE1geldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB0zs8CBaM0Bs39fowxSVfCgr9nzsyrgrN9foDlht29foU2BobHgoUCgak9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BsbrBoR0za80SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUrgaR2zaEnzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy2gsUnzs8YBpldzIG9fofYgr80zaBYBeldzoNQ4eldzaUYBsM7zaErSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhRIZ6c5p6OCfjfIG9foElgaElza97grO9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsf7Bo9Hgo8YBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsBCgsBnBsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0zsyCBsylgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7grUCgrU2grm9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zaf7zs92gsbrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoMCBr9Hgr91zZldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsBlBo90BoM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrU1gsRrBofYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBo9YBs9CBsblgZldzIG9fofYgr80zaBYBeldzoNQ4eldBoyrBrRnBo9lBZldzIG9fofYgr80zaBYBeldzoNQ4eldBobrzaRrBsyHzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBlgr9Cgsy2BoO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBof7Boy2gsy1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBoU7gsBlBrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgafCBrB7gsU1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgoUnzsbnBaB1SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgaM0BoM2BsyYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7gof7zabrBoO9fowxSVfCgr9nzsyrgrN9foDlht29foUngrfrBrBHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldzaB2gry2BsBYSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhRne5OtNfOFebfoDdqHldBsE7gsMHza91zeldzIG9fofYgr80zaBYBeldzoNQ4eldBsU7gaM1ga8nBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7gaylgrBrgae9fowxSVfCgr9nzsyrgrN9foDlht29foEngrBHBrb2Brk9fowxSVfCgr9nzsyrgrN9foDlht29foEYzsUHBry2gag9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zsbnBsf1BrErSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoE2gsU2gsU7BHldzIG9fofYgr80zaBYBeldzoNQ4eldBofCzaylBrM7BZldzIG9fofYgr80zaBYBeldzoNQ4eldBoU2BoRrzsBrBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofHBsBYBsUrgs39fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCgsRlza87zs9lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoRHzsy0gr9rSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofnzsBnzsBYBsO9fowxSVfCgr9nzsyrgrN9foDlht29foBlgsyHgsf1Bam9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrEnBsR1za9rgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrzaE7Baf1gsm9fowxSVfCgr9nzsyrgrN9foDlht29foBnBsbCBrylgog9fowxSVfCgr9nzsyrgrN9foDlht29foU2grM0BaB7zag9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfnBoUHBsf1gov9fowxSVfCgr9nzsyrgrN9foDlht29fo8rgrU0zaECgZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgoMHBrbHSVfjqHldBo9Ygob1Br9lSVfjBsfl4eldgaMHBaU1BoEHBeldzIG9foU2grBHBrE2gsp9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeSHgD8SvpOVfjfIG9foElzayCza9Czap9fowxSVfCgr9nzsyrgrN9foDlht29foEngsEYzsEHBsp9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2grynBsE7gog9fowxSVfCgr9nzsyrgrN9foDlht29foE0gsU7zaBngs39fowxSVfCgr9nzsyrgrN9foDlht29fof2zaU7BafrBak9fowxSVfCgr9nzsyrgrN9foDlht29fof7goUCzaB0zak9fowxSVfCgr9nzsyrgrN9foDlht29foB2Bsf1gofngeldzIG9fofYgr80zaBYBeldzoNQ4eldBrB2zsb1BoMCgpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgabnBoEHgabYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrR7gaflgrBngeldzIG9fofYgr80zaBYBeldzoNQ4eldBrR1zablzs8YgpldzIG9fofYgr80zaBYBeldzoNQ4eldBryHzab7go87BHldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrza81gry1zsf0SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrblBsMnzsMrgZldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUCBr92gsb2BoZ9fowxSVfCgr9nzsyrgrN9foDlht29foUCzaErBof7go39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7Bob2ga8lBsy1SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgsUHBo9rgaMHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgsynBo9nBry0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgoB0Bo87gayYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsy1goBlBrm9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7membZzR7pFmZQsciQYfiHKkipKcdfjfIG9foEHzsyrBsUlgap9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2goE1gsbHzaEnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2go80goblBs9nSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBsbYgo8YBrbnBHldzIG9fofYgr80zaBYBeldzoNQ4eldBsb1BrfCzs8rgZldzIG9fofYgr80zaBYBeldzoflht29fofrBof2gaBrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBr8nBsBrBa8YSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaM1BaE1zs8YSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof1zsR2zay1gaO9fowxSVfCgr9nzsyrgrN9foDlht29fof0go8lBo9nBrk9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBaErgoyrzay1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBaBYzabHBrfHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBoy2goMYgabrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrBnzsB1goR1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8rBsMrBr92BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgoU0ga9rgoM1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBr80Brynzsy7gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrbYzaUHzsb1BZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foyCgr90BoR1BHldzIG9fofYgr80zaBYBeldzoNQ4eldzsEYzsB0zsB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsMlgoU7BoZ9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgEmROespgvZbZhRYm3c5mwc59dzdvxSVf2BaMYgsb0BrN9fowxSVfCgr9nzsyrgrN9foDlht29foE2Bsf1BaB1Bsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gaMrgsBrza82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gaRYBaylBoMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaMYBsy1zse9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsyHza87gsE7BeldzIG9fofYgr80zaBYBeldzoNQ4eldBofYzaR7grUlSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofrBrbHgaB0Ba39fowxSVfCgr9nzsyrgrN9foDlht29fofrgs82gobnBav9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCgsUlgaB2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgrynza80grO9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrgaErBaUlBoRrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrRlgofYzs91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRlgo87gryHBZldzIG9fofYgr80zaBYBeldzoNQ4eldBr8ngrMlgo91geldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYBaR2zsU7zsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrUrBa82gaBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzaUCBob1Bsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBrBnBo97zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf1Baf0BaB1Brm9fowxSVfCgr9nzsyrgrN9foDlht29fobYBsU2gr82BHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBosRpsUCfjfIG9foE7BrUnzsfngov9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBr8YgoR0zsfHSVfjqHldBo9Ygob1Br9lSVfjBoMlhSHQ4eldBs92zaf7gr9YgHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBa92BaM2BHldzIG9fofYgr80zaBYBeldzoElBP7ASVf2BaMYBsMlBsm9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBoBrBaBngrfCgZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofHgobYgs9lgag9fowxSVfCgr9nzsyrgrN9foDGBS7ASVfrzsfnzaMlBsv9fowxSVfCgr9nzsyrgrN9foD2ht29foylgoblgoBngHldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zaMngoy1BaBHSVfjqHldgaMHBaU1BoEHBeldzIG9foBHBrUCgrfnBoZ9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBof1Brf1go9CBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofrBsBCBsM0Bap9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofngo8HBoBnBrZ9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofYgsBYgoMCzak9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBlgrB1goRnzsO9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBHBr81BoEYza39fowxSVfCgsUCgoblgrk9fowcqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1Bpldz5O3cPgp4eldBsbCzafCzs82SVfjkPvHOt29foE0BrU0gobYgeldzoEASVfCBablgsEHBaE1SVfjBt29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldz5O3cPgphZ7ASVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCzsECBrfrgsy1SVfjqHldBo9Ygob1Br9lSVfjBokQhS7ASVfHBryrBo91gre9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fofCgabCBaUCgsZ9fowxSVfCgr9nzsyrgrN9foDCBaUYht29fofHgrRrgsM7zak9fowxSVfCgr9nzsyrgrN9foDrht29foB1Brb1BsB1grZ9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fo8HgrfYzaBCBpldzIG9foUlgsM7zaf2gsN9fowxSVf2gsB0grR1BaRnSVfjcIZAcV29foB2goU2BrM7zZldz50HcilASVfrgr9rgrb0BrRHSVfjqHldBo9Ygob1Br9lSVfjSVv9fI7ASVfnBrUrBr9rBoN9fow6kF2AhS7ASVfngsbHBaBYzsO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYgafngobHBag9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtURkeUbQRfoDdqHldBsMlgo91BobrBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foEnBo9YgaUlga39fowxSVfCgr9nzsyrgrN9foDCht29foE1zsMlgaE0gom9fowxSVfCgr9nzsyrgrN9foDrgS7ASVfCBs9YBsbrBrv9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1l4eldBs9Ygo9nSVfjBV1l4eldBs9YgoyYSVfjBV1YzaUrBsBYzs90gsMYgaUnhZHQht29foflzsMHBsRlBs39foDlhS7ASVfCBrRlBa80BrN9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCgsfnzaRYgaE0SVfjqHldBo9Ygob1Br9lSVfjBreQ4eldBo81BrRrBoMCzeldzIG9fofYgr80zaBYBeldzofHht29fof0grbngaElgoZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgafHgrRCgsv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgoflgsUYzsm9fowxSVfCgr9nzsyrgrN9foDCzP7ASVfHBoyrgaUCBoO9fowxSVfCgr9nzsyrgrN9foDYhSHQ4eldBoM1zsBCzsf2BeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBoM1zsE7goRCgpldzIG9fofYgr80zaBYBeldzoElBP7ASVfCBay0Brf0BoMnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBablBoBlgr8rSVfjqHldBo9Ygob1Br9lSVfjgS7ASVfrBrU1gsElgsM1SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrBngo90zs9lBpldzIG9fofYgr80zaBYBeldzoZQ4eldBrU7BsUHBsflzZldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oB2Br9CgsRlBsf0zablgaUASVf2gr9ngrO9foDl4oyCgrUHBsMHBaf1BsRCga9ASVf2gr9nzak9foDl4o8rzsf2gs9lgr9YzabrBakQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foB7zs9lBoR1goN9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1lza8CgrUHBsf2Bsf2gaMngd29foEYgr8YgpldzoM6BaynBo97gsECBsECBsUlgo8ASVf2gr9nzak9foDl4oM1gofYgaR2BoE2BoE7Ba8nhZHQht29foflzsMHBsRlBs39foDlhS7ASVf0goU1BoErgrO9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1rBr9CgsU0BsEngoE2gaylgC29foEYgr8YgpldzoM6grU0BaE0gofCzaMCgrB7gV29foEYgr81gHldzoM6zsU2Bs9ngsBrgob0BaBHgIHkhS7ASVfCBablgsEHBaE1SVfjBPHQhS7ASVfCzaR1gsfCBsB7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBoRCgoyHgrU2zZldzIG9fofYgr80zaBYBeldzoEHht29fofYgoBrgaE7Brm9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf7BoMHzab7goy1SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0gry1zsfnBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBs8lzabYBoO9fowxSVfCgr9nzsyrgrN9foDlht29foElgay0grR1Brk9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2Ba9Cgry7grR7SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsE2BoECzaflgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE2BrflBrUlgrv9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2BsRCgs87gr9lSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Bs9nBrRlBr97SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsflBab2goECBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foECgoRlzsRrgr39fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2BoyCBob1BsbYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsf0goUrBoR2gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foErBs92BoU1BZldzIG9fofYgr80zaBYBeldzoylht29foErBo8ngrMrgrv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2BrUlzaM7goblSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsU2BafCgaBrBpldzIG9fofYgr80zaBYBeldzoylht29foE7Bry7grMHBsp9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gaUngr9lzaylSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsU7zaE0gsElBeldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoU1zsMYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEHBrf1BsU2gam9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gsBngaMHBoyrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsUlgs9CgrbYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsR1Ba81gay0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2goE2BrfHzsRCSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBs82BoE1BaMlBpldzIG9fofYgr80zaBYBeldzovQ4eldBs8CBsRYzabrBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEngrM1gsBHBrk9fowxSVfCgr9nzsyrgrN9foDlht29foEngryYBsy1gsN9fowxSVfCgr9nzsyrgrN9foDlht29foEnzsElgsE7gov9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2gob1gaMYga8YSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBs9lBa8YgayCBHldzIG9fofYgr80zaBYBeldzoRlht29foEYBsB0Bofnzav9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2grEHBr9HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs9rzsbrzaE2BpldzIG9fofYgr80zaBYBeldzoRlht29foEYgaBrgaRCgoO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zaf2BrRYzsU2SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsyCzsfCgoyrBpldzIG9fofYgr80zaBYBeldzoRlht29foE1gaE7Brf2zsp9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zaU0BayYgryCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaU0Br91Bay7SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsyHBo9nBa8lgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE1gofHzaf2gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsyngoy0gabCgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE1zaUHzsM2Brv9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zabnBrRrBobnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsb2BaU1gr82geldzIG9fofYgr80zaBYBeldzoRlht29foE0BsyrgrUrgo39fowxSVfCgr9nzsyrgrN9foDlht29foE0Bo9ngoM7Bo39fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2zs92grUHBsBCSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsbYzs8HzsBrgHldzIG9fofYgr80zaBYBeldzovQ4eldBsb1goElBr80BHldzIG9fofYgr80zaBYBeldzoRlht29foflBafCgrM2zsg9fowxSVfCgr9nzsyrgrN9foDCht29foflBobrzsbYBrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaUrgsB7BaR7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoM7grf2BoUnBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflgo81zsR1ga39fowxSVfCgr9nzsyrgrN9foDCht29fof2BaB0BrU1gr39fowxSVfCgr9nzsyrgrN9foDlht29fof2BaUYBsUnBsp9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsE1zaU1zsBYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEngrfHzab7zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEYgoy0Bs81zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoE0BaMlgaUCgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofCBsBCBofCBsm9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBoBHBrE1gab7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBoB0gaM0grMnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBof1BrMlBoB0gpldzIG9fofYgr80zaBYBeldzoRlht29fofCzs91goUHgaO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBrUngoyHgrZ9fowxSVfCgr9nzsyrgrN9foDCht29fofrgsUlgsE0Bsk9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgaMlBobCBZldzIG9fofYgr80zaBYBeldzoylht29fof7gof7BsbnBs39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCgab7goU0gov9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgsR0zayHzs80SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBo8lBaf7go90zeldzIG9fofYgr80zaBYBeldzovQ4eldBo8lBrB1BsbHgZldzIG9fofYgr80zaBYBeldzoRlht29fofnBsUYBayngZldzIG9fofYgr80zaBYBeldzoRlht29fofnBrE7zsUnzag9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCgo8lzs82zaBHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgrf1zaR7grE7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo9rgsBnBsf0gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7BoUCgrfCzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof1gsMYBo9Hzap9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCza87za82zsMYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoyYBab7grRrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoyYgsE2gay1gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof1zsy1Bof2zae9fowxSVfCgr9nzsyrgrN9foDCht29fof0BaEYzabrgav9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzsEngoflzsbCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsE1gaR0BsN9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCzsfngaMngofHSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBobrBr87gsR0gpldzIG9fofYgr80zaBYBeldzovQ4eldBobrgo9YBayHBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof0gsUCBsMYgr39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBaR0zaMCBo39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBayCgr8CgryYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrElBob2gaMrzZldzIG9fofYgr80zaBYBeldzoRlht29foB2BaR7gsBCzsZ9fowxSVfCgr9nzsyrgrN9foDlht29foB2Bs91grbrzse9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBsfHBrElBrRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBsUYBrM2zs9HSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrE7zsfYBaB7geldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHBaR2goflgZldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHBoU1BsUHBpldzIG9fofYgr80zaBYBeldzoRlht29foB2goEYzaElgrN9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrBs9rBrM2BsE7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBsyCzaRngabYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrfrgs8lgrU0gpldzIG9fofYgr80zaBYBeldzoRlht29foBCgaylga8ngrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBo87BrRnBaErSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBoylzsfnBrErSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrf0Bay0goBlBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBaRlgo8HBo39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBrfCBoEHBsE1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrB7grU2BsRnzZldzIG9fofYgr80zaBYBeldzoRlht29foBrgoMHga91Bsp9fowxSVfCgr9nzsyrgrN9foDCht29foBrgoR1zaEYgag9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrgaMlBs8Cgs81SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrUrBrBYzsU1zZldzIG9fofYgr80zaBYBeldzoylht29foB7Bry7gsbngsk9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrgaU7gaf0gofYSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrU7gsbnzsM0SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrUHBsEnzsEYBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB7goflBrUCzaO9fowxSVfCgr9nzsyrgrN9foDCht29foB7zaU2BoyCBrg9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrgayngr9lBsblSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRYBaBnBay0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRYgoE2zsMnBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHzafHgsyrgok9fowxSVfCgr9nzsyrgrN9foDCht29foBHza9rBsfCgHldzIG9fofYgr80zaBYBeldzoRlht29foBnBa9Hza91grv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgoECgsBlgo8rSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrgoEYBs91zsfrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr87gsyrBobrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8nBafCgsElBHldzIG9fofYgr80zaBYBeldzoNQ4eldBr8YzaR7BoflgZldzIG9fofYgr80zaBYBeldzovQ4eldBr81BrR2goflgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBYBaE1BoECgsZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrgrEHzsRHgs9rSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr9ngry0BsMYgpldzIG9fofYgr80zaBYBeldzovQ4eldBr91zaB1BobnBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBYzsBCgsy0zZldzIG9fofYgr80zaBYBeldzoNQ4eldBry7gry7gry2BHldzIG9fofYgr80zaBYBeldzoRlht29foB1gay7go80zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrza8rzaBrBrMnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrzabCBaR0goyrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrblBaBlgrf1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBrblgoB7BaRCBpldzIG9fofYgr80zaBYBeldzoylht29foB0BsU1BofHgpldzIG9fofYgr80zaBYBeldzoylht29foB0Bo9ngo9ngrZ9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrzs9HBo9HBoBrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrzsy0Bs9YBayYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgaMlgrBrza8ngeldzIG9fofYgr80zaBYBeldzoRlht29foUlBsf7Baf1zaZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf7BaR7za9rBeldzIG9fofYgr80zaBYBeldzoylht29foUlzsM7Ba92gr39fowxSVfCgr9nzsyrgrN9foDHBP7ASVf7BsB0Ba92za9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BsRHBrfHBobYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaEYBrBlza91geldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU2za9lBoUCgsp9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf7BoEYgoylzsR0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaf1zsRHBrBCBHldzIG9fofYgr80zaBYBeldzoylht29foUCzabngs8lSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaB2BoM7gsB2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaU7za92gsECSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaUHBrB1zaU0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaU1zaMrzabYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldga97zaRnzaMHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf7zsfrzs8Hzak9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfHBaUYzsUrgsk9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfHBsE0go81BrO9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfHBrUnza9YBoN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfHBrRYBaRrzav9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfHzsB2Bs9ngaO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfHzsyYBoR1BrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfnBsBrgsy0gop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfnBoR7gaBlBok9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfnBrElgsU2grk9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfngafrBsyHBoO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfngs80gsEngsp9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfnzaBCBsfHzsm9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfnzaRrBoBnzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo81zsfCBa9HgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9lBa9Hgrb2BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9CzsBHzsUCgeldzIG9fofYgr80zaBYBeldzoNQ4eldgr82BablzsBCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgry0zsb1Bab0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldza8HBrECzsyCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldza9CgoyYBrZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf0BrE0grU7BrO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf0ga9YgaRYgaO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf0gsB0zsy2gav9fowxSVfCgr9nzsyrgrN9foDCht29fobHgoyrgrfCgpldzIG9fofYgr80zaBYBeldzoRlht29fobYBabYBsR7geldzIG9fofYgr80zaBYBeldzoRlht29fob1zsUYBsBlBeldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgtmRgWRbmeRpQNXSfdzdvxSVf2zay1BrRlzaB7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoRCzs9Yza80geldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7ew9dM5fEgCcYZoXip6OCfjfIG9foE0Baf7BsM0BaO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgry7gaflzsElSVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQhtfAfdBoRbZasHvEmZvhUYvKkFgDXF0IfoDdqHldBrb1zaR7BsR2gpldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29foR0zaU2BsE0BpldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4VfofHveU7QtmEZtS7O3XnZA8F9dzdvxSVfCBsR2BrMngs82SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrfnBo8YBsMnBZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7OCOFZrkie6Oip6OCfjfIG9foflgryCBay0gam9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsU0BrU7BsbnSVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQhtfAfdBoRbZasHvEmZvhsFe6kFeAfep3kCfjfIG9foB7BofCzsy0BHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foR7grB1Bay1zZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7HKk5RyvdNa95QH8n3wc59dzdvxSVf2BsbngoRHgrf2SVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQ4eldBoEHgsM0go8nBZldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4VfofHveU7QtmEZtS7Q6fPZrOtfjfIG9foEnBrR2zaE7Bo39fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVf2grB2goR7BoUlSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhtfAfdBoRbZasHvEmZvhRIZ6c5p6OCfjfIG9foECgsRnBrbCBog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBr8YBaMrgrfrSVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQhtfAfdBoRbZasHvEmZvhRne5OtNfOFebfoDdqHldBo91za8HgrE7gHldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29foBnzsB7zsU2Bsp9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQsXieCOFUdzdvxSVf2grynzsB0goU0SVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQ4eldBsy1BrU2BoUnBZldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4VfofHveU7QtmEZtSHgAcY9ycFQ7XFQ6foDdqHldBsfHBrblBsE1zZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29foBlgrB1gsf0Bsg9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQskie6Oip6OCfjfIG9fof0goRlBrR0grN9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVfngabYgaR1Br39fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgFtZgZUR2sfoDdqHldBsM2gr8rBs9YBeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaf0gsU2Bov9fowxSVfCgr9nzsyrgrN9foDlht29foflBoUngo8rzap9fowxSVfCgr9nzsyrgrN9foDlht29fofYzs80BrU7zag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfCzaMCzaUHgr9YSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrBsRnBs81gry2SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoM6BV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBrBlBaE1grylBpldzIG9fofYgr80zaBYBeldzoElgS7ASVfrBrU1gsElgsM1SVfjqHldBo9Ygob1Br9lSVfjBsNQhS7ASVf2BaRlzsElBrblSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2zsb0gayCzabYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBs9Ygo82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr9ngov9fowxSVfCgr9nzsyrgrN9foDlht29foEYgr8nBHldzIG9fofYgr80zaBYBeldzoNQ4eldBsbrgaRHzsflSVfjqHldBo9Ygob1Br9lSVfjgoylBP7ASVfrgsErBo80Bay1SVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foflga8ngoU1BoZ9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCBs9YBsbrBrv9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBV12zs8lgry7gab7za9nza82gd29foEYgr8YBZldzoM6zaE0goMYzsErgab7BsElBt29foEYgr8YgpldzoM6goR7zsM2zsy2BrRrgrR0zV29foEYgr81gHldzoM6go97gsM0zafrBrfCBobnBSHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBoyHgr9YBrRCBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBnBsy7goECBHldzIG9fofYgr80zaBYBeldzoEChSHQ4eldBofYzaUHgrbrSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2gaB0zayrBsR2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBr81za9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29fofYzs80BrU7zag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV11BsbnBa90BsB7zsU2BsM24eldBs9Ygo9nSVfjBV1ngsU0BaE0zaErgsBYgsb14eldBs9YgoyYSVfjBV1ngrUHBab1BoBrBofCzs82hZHQht29foflzsMHBsRlBs39foDlhS7ASVfrBsRnBs81gry2SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBrB7zaR2BaRlzeldzIG9fofYgr80zaBYBeldzoUlht29foB0BaB2gsylgr39fowxSVfCgr9nzsyrgrN9fow79IZphSHQ4eldBoR2BaU0grUCBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foErgoB1gsUngr39fowxSVfCgr9nzsyrgrN9fow79IZpht29foy1Bsy2Boy1gZldzIG9fofYgr80zaBYBeldzoBCgoB1hSHQ4eldBrfHBsR1gayngZldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsR7gsyCBoylgHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foDl4oB0BoEHgoy0zabYgsBYBoBASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foflzab2BsB1BoN9fowxSVfCgr9nzsyrgrN9foDlht29fofrBsE0gry2gam9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrBrU1gsElgsM1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf7Bo81BobCgaBnSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foB7BrUHgofnBrm9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fof7grblgof7gsN9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBV1YzaUrBsBYzs90gsMYgaUn4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrBoUCBsyrgrf7SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6gsy1BoBHBrE1go8lgrBnBt29foEYgr8YgpldzoM6gsy1BoBHBrE1go8lgrBnBt29foEYgr81gHldzoM6gsy1BoBHBrE1go8lgrBnBSHkhS7ASVfCBablgsEHBaE1SVfjBPHQhS7ASVfrgof7gsECzsp9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCBr8nBoRrBsO9fowxSVfCgsRngoy1Bam9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBV1HBab1BaB0gsMYza8HzsMn4eldBs9YgoyYSVfjBV1HBab1BaB0gsMYza8HzsMnhZHQht29foflzsMHBsRlBs39foDlhS7ASVfCgr9nzsyrgrN9fow79IZpht29foblBobrgsMCzZldzIG9fofHgs8nzaylgeldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oBHBob7BsE1gsfrgsbYgrfASVf2gr9ngrO9foDl4oBHBob7BsE1gsfrgsbYgrfASVf2gr9nzak9foDl4obnBa91gaBYgs8ngrRYBIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBo9Ygob1Br9lSVfjkPvHOSHQht29foB1BafCBr8lzag9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fof2gr92zsBrBpldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oy2zs8lgrb2BrU0gaE2BaEASVf2gr9ngrO9foDl4o8HgablBsb1BsBHBr9HzsyASVf2gr9nzak9foDl4o8YgaRlzsyCBrBCBof0goeQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29fofrgoy1gr90zeldzIG9fofYgr80zaBYBeldzoeQhS7ASVf7Bs8HgrfHgr87SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsMngry1BsElBHldz50HcilASVfCga87BsylBoMYSVfjcIZAcV29foB7gaf7BsMHgpldz50HcilASVfrgry1grU7gr9nSVfjqHldBo9Ygob1Br9lSVfjBs8lht29foUrzsbYBa92zeldz50Hci2Qht29foy7Brb2gry2zZldzIG9foUlgsM7zaf2gsN9fowxSVfCBs9YBsbrBrv9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV11zsylBrbCzaErgoyCgsRn4eldBs9Ygo9nSVfjBV1nga9lgsy1gaUHgo8rgaRC4eldBs9YgoyYSVfjBV1Hgs81gofYgrEHBsElgr90hZHQht29foflzsMHBsRlBs39foDlhS7ASVfCBr81za9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29foBrBaM2za91Bav9fowxSVfCgr9nzsyrgrN9foDlht29foUYgr8lgoR1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf1zaE1Bsf1zaZ9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fofrgoy1gr90zeldzIG9fofYgr80zaBYBeldzoeQ4eldBo90gobrgaU1BHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oy2zs8lgrb2BrU0gaE2BaEASVf2gr9ngrO9foDl4o8HgablBsb1BsBHBr9HzsyASVf2gr9nzak9foDl4o8YgaRlzsyCBrBCBof0goeQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foB2gs82goyYzae9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrBrU1gsElgsM1SVfjqHldBo9Ygob1Br9lSVfjBrvQhSHQfI7="

						local function v230(p317)
							-- upvalues: base64 (copy), s7 (copy)
							local ok, result = pcall(json.stringify, p317)

							if ok then
								local ok4, result4 = pcall(base64.encode, result, s7)

								if ok4 then
									return ok4, result4
								end

								return false, result4
							end

							return false, result
						end
						local function v231(p318)
							-- upvalues: base64 (copy), s7 (copy)
							local ok, result = pcall(base64.decode, p318, s7)

							if ok then
								local ok5, result5 = pcall(json.parse, result)

								if ok5 then
									return true, result5
								end

								return false, result5
							end

							return false, result
						end
						local function v232()
							-- upvalues: t12 (ref)
							local t103 = {}
							local v1459 = t12.get()

							for k, v in pairs(v1459) do
								t103[k] = v[1]:export()
							end

							return t103
						end
						local function v233(p319)
							-- upvalues: t12 (ref), t26 (ref)
							local v1463 = t12.get()

							for k, v in pairs(p319) do
								local v1466 = v1463[k]

								if v1466 ~= nil then
									local v1467 = v1466[1]

									pcall(v1467.import, v1467, v)
								end
							end

							t26.update()
						end

						function t102.encode(_, p321)
							-- upvalues: v230 (copy)
							return v230(p321)
						end

						function t102.decode(_, p323)
							-- upvalues: v231 (copy)
							return v231(p323)
						end

						local function v234(p324)
							local v1475 = string.find(p324, "\000")

							if v1475 ~= nil then
								return p324:sub(1, v1475 - 1)
							end

							return p324
						end

						configs.export:set_callback(function()
							-- upvalues: v230 (copy), v232 (copy), clipboard (copy), t11 (ref)
							local v1472, v1473 = v230(v232())

							if v1472 then
								clipboard.set(v1473)
								t11.success("exported config")

								return
							end
						end)
						configs.import:set_callback(function()
							-- upvalues: clipboard (copy), v234 (copy), v231 (copy), v233 (copy), t11 (ref)
							local v1476 = clipboard.get()
							local v1477 = v234(v1476)
							local v1478, v1479 = v231(v1477)

							if v1478 then
								v233(v1479)
								t11.success("imported config")

								return
							end
						end)
						configs.default:set_callback(function()
							-- upvalues: v231 (copy), s8 (copy), v233 (copy), t11 (ref)
							local v1480, v1481 = v231(s8)

							if v1480 then
								v233(v1481)
								t11.success("imported default config")

								return
							end
						end)
					end

					local presets = t29.antiaim.presets
					local s9 = "presets"
					local v237 = t97[s9] or {}
					local t104 = {}
					local t105 = {}
					local match = string.match

					local function u241(p325)
						-- upvalues: match (copy)
						return match(p325, "^()%s*$") and "" or match(p325, "^%s*(.*%S)")
					end
					local function v242()
						-- upvalues: t97 (ref), s9 (copy), v237 (copy)
						t97[s9] = v237
					end
					local function v243()
						-- upvalues: t12 (ref)
						local t106 = {}
						local v1484 = t12.get()

						for k, v in pairs(v1484) do
							local v1487 = v[1]

							if v[2] == "AA" then
								t106[k] = v1487:export()
							end
						end

						return t106
					end
					local function v244(p326)
						-- upvalues: t12 (ref)
						local v1489 = t12.get()

						for k, v in pairs(p326) do
							local v1492 = v1489[k]

							if v1492 ~= nil then
								local v1493 = v1492[1]

								if v1492[2] == "AA" then
									v1493:import(v)
								end
							end
						end
					end
					local function v245(p327, p328, p329, p330)
						return {
							name = p328,
							author = p327,
							content = p330,
							created_at = p329,
							updated_at = p329
						}
					end
					local function v246(p331)
						-- upvalues: v243 (copy), v245 (copy)
						local v1499 = v243()

						if v1499 ~= nil then
							return v245(common.get_username(), p331, common.get_unixtime(), v1499)
						end

						return nil
					end
					local function v247(p332)
						-- upvalues: t105 (ref)
						for i = #t105, 1, -1 do
							local v1505 = t105[i]

							if p332 == v1505.name then
								return v1505, i
							end
						end

						return nil, -1
					end
					local function v248(p333)
						-- upvalues: t105 (ref)
						return t105[p333]
					end
					local function v249(p334)
						-- upvalues: v247 (copy), u241 (ref), v244 (copy)
						local v1508 = v247(u241(p334))

						if v1508 ~= nil and v1508.content ~= nil then
							v244(v1508.content)
							events.update_records:call()

							return true, v1508
						end

						return false, "Preset is not valid"
					end
					local function v250(p335)
						-- upvalues: u241 (ref), v247 (copy), v246 (copy), v237 (copy), v242 (copy), t104 (copy), v243 (copy)
						local v1510 = u241(p335)
						local v1511, v1512 = v247(v1510)

						if v1511 ~= nil then
							if v1512 == -1 or not (v1512 <= #t104) then
								local v1513 = v243()

								if v1513 ~= nil then
									local v1514 = common.get_unixtime()

									v1511.content = v1513
									v1511.updated_at = v1514
									v242()

									return true, v1511
								end

								return false, "Unable to export config"
							end

							return false, "Can't modify script preset"
						end

						local v1515 = v246(v1510)

						if v1515 ~= nil then
							table.insert(v237, v1515)
							v242()

							return true, v1515
						end

						return false, "Unable to create preset"
					end
					local function v251(p336)
						-- upvalues: v247 (copy), u241 (ref), t104 (copy), v237 (copy)
						local v1517, v1518 = v247(u241(p336))

						if v1518 == -1 or not (v1518 <= #t104) then
							local v1519 = v1518 - #t104

							table.remove(v237, v1519)

							return true, v1517
						end

						return false, "Can't delete script preset"
					end
					local function v252()
						-- upvalues: t105 (ref), t104 (copy)
						local v1520 = #t105

						if v1520 ~= 0 then
							local t107 = {}

							for i = 1, v1520 do
								local name = t105[i].name

								if i <= #t104 then
									name = string.format("%s\a{Link Active}*", name)
								end

								t107[i] = name
							end

							return t107
						end

						return {
							[1] = "Empty"
						}
					end
					local function v253()
						-- upvalues: t105 (ref), t104 (copy), v237 (copy)
						t105 = {}

						for i = 1, #t104 do
							table.insert(t105, t104[i])
						end

						table.sort(v237, function(p337, p338)
							return not (p337.name >= p338.name)
						end)

						for i = 1, #v237 do
							table.insert(t105, v237[i])
						end
					end

					presets.list:set_callback(function(p339)
						-- upvalues: v248 (copy), presets (copy)
						local v1527 = p339:get()

						if v1527 ~= nil and not (v1527 <= 0) then
							local v1528 = v248(v1527)

							if v1528 ~= nil then
								presets.name:set(v1528.name)

								return
							end

							return
						end
					end)
					presets.load:set_callback(function()
						-- upvalues: v249 (copy), presets (copy), t11 (ref)
						local v1529, v1530 = v249(presets.name:get())

						if v1529 then
							events.update_records:call()
							t11.success(string.format("preset %s loaded", v1530.name))

							return
						end

						t11.error(v1530)
					end)
					presets.save:set_callback(function()
						-- upvalues: v250 (copy), presets (copy), t11 (ref), v253 (copy), v252 (copy)
						local v1531, v1532 = v250(presets.name:get())

						if v1531 then
							v253()
							presets.list:update(v252())
							t11.success(string.format("preset %s saved", v1532.name))

							return
						end

						t11.error(v1532)
					end)
					presets.delete:set_callback(function()
						-- upvalues: v251 (copy), presets (copy), t11 (ref), v253 (copy), v252 (copy)
						local v1533, v1534 = v251(presets.name:get())

						if v1533 then
							v253()
							presets.list:update(v252())

							if v1534 ~= nil then
								t11.success(string.format("preset %s deleted", v1534.name))
							end

							return
						end

						t11.error(v1534)
					end)
					presets.export:set_callback(function()
						-- upvalues: v243 (copy), t102 (ref), t11 (ref), clipboard (copy)
						local v1535 = v243()

						if v1535 ~= nil then
							local v1536, v1537 = t102:encode(v1535)

							if v1536 then
								clipboard.set(v1537)
								t11.success("preset exported")

								return
							end

							t11.error("can't encode data")

							return
						end
					end)
					presets.import:set_callback(function()
						-- upvalues: clipboard (copy), t102 (ref), t11 (ref), v244 (copy)
						local v1538 = clipboard.get()
						local v1539, v1540 = t102:decode(v1538)

						if v1539 then
							v244(v1540)
							events.update_records:call()
							t11.success("preset imported")

							return
						end

						t11.error("can't decode data")
					end);
					(function(p340)
						-- upvalues: t102 (ref), t104 (copy)
						if type(p340.content) == "string" then
							local v1501, v1502 = t102:decode(p340.content)

							if not v1501 then
								return
							end

							p340.content = v1502
						end

						table.insert(t104, p340)
					end)(v245("isabel", "Default", -1,
							"qCfof7ezm72eRHQNXSfdzdvxSVf2Ba9CBaMlgrN9fowxSVfCgr9nzsyrgrN9foD2BY7ASVf2gsEnBo90goECSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsRHgaEHBaMHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsb7gsRlBrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2goUrgsy7BoEYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2grUYgof1Ba8HSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrE2grBrBofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaRngaMCzsR1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsbnBobnBak9fowxSVfCgr9nzsyrgrN9foDHgY7ASVfrBoblBs82Bav9fowxSVfCgr9nzsyrgrN9foDr4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrbHgoECBoR1gpldzIG9fofYgr80zaBYBeldzoR1ht29foU2zaM2gaRHBrO9fowxSVfCgr9nzsyrgrN9foDrBP7ASVfYgoE1gs9ngrk9fowxSVfCgr9nzsyrgrN9foDGBoeQ4eldzaf2go92go9lSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQNXSfyvdNa95QH8n3wc59dzdvxSVfCBayYgsRYzs8nSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fofCga9HBrU2zsN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCgaBrBsflBsf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsMlBsB0grM2SVfjqHldBo9Ygob1Br9lSVfj4sfnht29foBlzaE2ga80BoN9fowxSVfCgr9nzsyrgrN9foDrgY7ASVfrBo9YgoRYBsUCSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrBr8ngsRCzaB7SVfjqHldBo9Ygob1Br9lSVfjgspQ4eldBrR2gs8HBoE2BeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8ngrBrzsMrzeldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzsfCBs9CBoe9fowxSVfCgr9nzsyrgrN9foDlht29foR2zsy7goM1zZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldgobCgrRngsylSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0Bs8YgrynBpldzIG9fofYgr80zaBYBeldzoNQ4eldzsbHBabYBse9fowxSVfCgr9nzsyrgrN9foDHzPHQfdldfCgNsbkBmZghUYvKkFgDXF0IfoDdqHldBsU0zsMCBa80BZldzIG9fofYgr80zaBYBeldzd7rBS7ASVf2gsB2gafCBr81SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs8lBrB2Bo81geldzIG9fofYgr80zaBYBeldzoNQ4eldBoU2Bry0gsU1geldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCzabnBoRYzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof0gaflzaflgsN9fowxSVfCgr9nzsyrgrN9foDlht29foB2zsM1zaRHgag9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBCzsUnzsylgo39fowxSVfCgr9nzsyrgrN9foDlht29foBHBoBCgs8ngre9fowxSVfCgr9nzsyrgrN9foDlht29foBYBrUYBsfYgap9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrgr8rBrBYgs92SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Bay0gaR1gsUlSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foyrBoE0zaB7BpldzIG9fofYgr80zaBYBeldzoUHht29foy7zsyrBaR7BeldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsS7O3XnZA8F9dzdvxSVf2BrErgof7goy1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsBHzsU0gaBCgZldzIG9fofYgr80zaBYBeldzoNQ4eldBs8Cgob0BsB1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBs87zaE7grB0gHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBrfHzsfHzsb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaBHgr8CzsRHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsMCBr90Bs9YSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoblBrRngaBrBpldzIG9fofYgr80zaBYBeldzoNQ4eldBobYBsBngs9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldBrBHgaM2BrBlBpldzIG9fofYgr80zaBYBeldzo8lht29foBnBoM0BrB1gsg9fowxSVfCgr9nzsyrgrN9foDlht29foBngaU1Ba97gom9fowxSVfCgr9nzsyrgrN9foDlht29foUlgsR7zsyYgae9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldgrBYBsf7BrU1SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghmIvpOSg78F0bXF0IfoDdqHldBsB0zaBYgsb0zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEHBsRHgsfYgsp9fowxSVfCgr9nzsyrgrN9foDlht29fofCgob2gsyrBrN9fowxSVfCgr9nzsyrgrN9foDlht29fofrgrfHBofHgre9fowxSVfCgr9nzsyrgrN9foDlht29fofYBoB1gsB1zsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCzablBs9lBsv9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrErzaElBoE1BeldzIG9fofYgr80zaBYBeldzoNQ4eldBrUHBobCgs9HgpldzIG9fofYgr80zaBYBeldzoNQ4eldBryHBoMrgrynBeldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7BaMrBsM0gav9fowxSVfCgr9nzsyrgrN9foDlht29foUlgr97grB0zsO9fowxSVfCgr9nzsyrgrN9foDlht29fo92BrRHzaB0gZldzIG9fofYgr80zaBYBeldzoNQ4eldgrf7BsfYBoBnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfYzsbHBrBngsO9fowxSVfCgr9nzsyrgrN9foDnBPHQfdldfCgNsbkBmZghsFe6kFeAfep3kCfjfIG9foECBoBngsM7grk9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2BoBngobrzaZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsRHBay1zs97gHldzIG9fofYgr80zaBYBeldzoNQ4eldBs9lgsR1gsf0gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoM1BsE0Ba91geldzIG9fofYgr80zaBYBeldzoNQ4eldBoBYBoyHBaE1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBrMrgrf2Br92BHldzIG9fofYgr80zaBYBeldzoNQ4eldBrUCBaBHBay1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBrUrzsflzaMHgHldzIG9fofYgr80zaBYBeldzoNQ4eldBr9rzsRnza90SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrza9YgoUCgoy2SVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foUCzabHBaU1gsv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7zsErBr91gZldzIG9fofYgr80zaBYBeldzoNQ4eldzsEYgry0BaE1SVfjqHldBo9Ygob1Br9lSVfjgoNQhtfAfdBoUR0PsEZsS7HKk5RyvdNa95QH8n3wc59dzdvxSVfCBr9lgoy2BoR2SVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBoU1za8rBsyrgpldzIG9fofYgr80zaBYBeldzovQ4eldBoRrBaU7zaBHBHldzIG9fofYgr80zaBYBeldzoNQ4eldBo81BsyCza9rSVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0BrR1BoE0BHldzIG9fofYgr80zaBYBeldzoNQ4eldBr82gaBlgr80BeldzIG9fofYgr80zaBYBeldzo8lht29foBYgrRlzs90gsO9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB1gsf7gay1gae9fowxSVfCgr9nzsyrgrN9foDGgsmQ4eldBryHzaB2Bo8lzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnzsb1BoB7gZldzIG9fofYgr80zaBYBeldzoBASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7BaRCgsU1BrU0SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgoR0Bo8rBsUHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnzsf7BsMrBoN9fowxSVfCgr9nzsyrgrN9foDGzP7ASVf1zsECBabHgok9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQWcdNH9nRdzdvxSVf2BafngrUHBoE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Ba8HgoR7Br9CSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foErzaRYBr81Bo39fowxSVfCgr9nzsyrgrN9foDlht29foEnga8YgoErBsp9fowxSVfCgr9nzsyrgrN9foDlht29foE0goUrBrRlBop9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCgrbHgoR7BsfrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgs9YBaECgo39fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBr87Bo8lgsbnBeldzIG9fofYgr80zaBYBeldzo8lht29foBngr90BaE2zs39fowxSVfCgr9nzsyrgrN9foDlht29foUlgay0grbrgrZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BaRlBr80Br87SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BsUCgoMngoN9fowxSVfCgr9nzsyrgrN9foDlht29foUHgab0zsfYgpldzIG9fofYgr80zaBYBeldzoNQ4eldzaU2BrU2go97SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghRIZ6c5p6OCfjfIG9foElzaE1Ba90Bag9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2BoErgrEngsEYSVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBsRrBrU7BoMCzeldzIG9fofYgr80zaBYBeldzo8lht29foE0gaMlzsRnBsk9fowxSVfCgr9nzsyrgrN9foDlht29foflBa91zs80zsm9fowxSVfCgr9nzsyrgrN9foDlht29foflgrRnzsyrgre9fowxSVfCgr9nzsyrgrN9foDlht29fofYBoRCgo8HBsZ9fowxSVfCgr9nzsyrgrN9foDlht29fofYgab2gaM2BoO9fowxSVfCgr9nzsyrgrN9foDCht29foB2gsb1BrE7Bag9fowxSVfCgr9nzsyrgrN9foDr4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrb2zsy1BoEnBpldzIG9fofYgr80zaBYBeldzd7CBP7ASVf7Bs90gs9rgsN9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUnBryCgob1gHldzIG9fofYgr80zaBYBeldzd77gS7ASVfYBrErBoUlgag9fowxSVfCgr9nzsyrgrN9foDlht29fo9HBoU1BaMHzZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghRne5OtNfOFebfoDdqHldBsMngaf2go8nzeldzIG9fofYgr80zaBYBeldzo8lht29foECBsUlBsE2BsZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBs97BoE0gr81BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsb0BsMlBsEYgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflgsbCzaE7Bop9fowxSVfCgr9nzsyrgrN9foDlht29foflzsU1BsBnzsp9fowxSVfCgr9nzsyrgrN9foDGBsNQ4eldBoBCBrBYBoBlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoRnBrUHBrflBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo9CgoElBr9YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy1zsRYgaEYBZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrBsRHzabrgsyrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrB1ga9lza9CBHldzIG9fofYgr80zaBYBeldzoNQ4eldBrb7gab2BrUngHldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgaf1BrEHSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghRn3395ZbfoDdqHldBsf2grU2BoR0BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gsB7go9rgo39fowxSVfCgr9nzsyrgrN9foDlht29foEHBr97zsRlgap9fowxSVfCgr9nzsyrgrN9foDlht29foEYzsyHBsbHgaN9fowxSVfCgr9nzsyrgrN9foDlht29fof1BaUnBoBrgsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof0ga97Bsfrgam9fowxSVfCgr9nzsyrgrN9foDlht29foBlgoE1gsy1zav9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BoMlgrBYgsbnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaflBoECgrR1gZldzIG9fofYgr80zaBYBeldzoNQ4eldgaUHBs8CgsEYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgsM0gaR0gay0SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foRngoM2zay1BZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMngrRYgabYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsBlzsb1zsZ9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQsciQYfiHKkipKcdfjfIG9foErgoU1gaR0Bsv9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrU7gZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gs9CgoBlgaErSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE7BaMHgrRYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zab0gaMrzam9fowxSVfCgr9nzsyrgrN9fow79IZpht29foE0zsEnBsR0gae9fowxSVfCgr9nzsyrgrN9foDlht29foflBr97zs8CBog9fowxSVfCgr9nzsyrgrN9foD7BI7ASVfCBsb7zsEYBof2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrRYgs82Bo8lSVfjqHldBo9Ygob1Br9lSVfj4sB1ht29fofrzsRHga87zZldzIG9fofYgr80zaBYBeldzo8lht29foBlBrElBoyrzsN9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrgr91BrRYzsfHSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foU2BoM1gaB7gse9fowxSVfCgr9nzsyrgrN9foDlht29foy2zsb7BabHgpldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsSHg78F0bXF0IfoDdqHldBsfCgsBnBo82BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gsyCBsMHzsU1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr82zs9lBr8lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsMCzaMnBoE1SVfjqHldBo9Ygob1Br9lSVfjBrgQ4eldBsb7Bsy0Brb7gpldzIG9fofYgr80zaBYBeldzoNQ4eldBo80Ba8rgsB1BZldzIG9fofYgr80zaBYBeldzoeQ4eldBoy0grUHzafnSVfjqHldBo9Ygob1Br9lSVfj4s80ht29fof0ga8lzabngok9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrBa92BaEHBsM2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrBHzaR7gs8rgeldzIG9fofYgr80zaBYBeldzoBASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrzsb0gaEHzaM2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHBo9CBsUlzav9fowxSVfCgr9nzsyrgrN9foDlht29fo80BsfHzsM2gHldzIG9fofYgr80zaBYBeldzoNQ4eldzsfYBa8HgaBlSVfjqHldBo9Ygob1Br9lSVfjgoNQhtfAfdBoUR0RtRevsZQgURpzfoDdqHldBsR7goEHgr97geldzIG9fofYgr80zaBYBeldzovQ4eldBrUlBrUrgoUlBeldzIG9fofYgr80zaBYBeldzImCkFZQhtfAfdBoUR0RtRevsZQsmZmRtR0PRCfjfIG9foflzabHgaU0zsN9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEYBob1zsyCgsp9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzsy1BrB2zay2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofHgo82goRrgrZ9fowxSVfCgsUCgoblgrk9fowcqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1Bpldz5O3cPgp4eldBsbCzafCzs82SVfjkPvHOt29foE0BrU0gobYgeldzo8ASVfCBablgsEHBaE1SVfjBt29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldz5O3cPgphZ7ASVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BoM1BsU0gsMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgay2ga8nBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCzafrgoE7zabCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foBlzsb2goE0zsp9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foflzsMCBrMYgog9fowxSVfCgr9nzsyrgrN9foD7BP7ASVfCBs9rBa81zaR0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoRCBaR2Brb7gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgsMngaE1gsp9fowxSVfCgr9nzsyrgrN9foD2hSHQ4eldBrRnBob1grb2BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgrRngo9lzsm9fowxSVfCgr9nzsyrgrN9foD2ht29fo97zablgsBngeldzIG9fofHgafnzsMYgHldzpGxSVf2gafYzaRHzaBnSVfjO5eA9nRASVf2grBHgrMnBsyCSVfjBV29foE0BoyCBobnBZldzoEASVf2zsB7zs80grm9foD0BV29foflzsMHBsRlBs39foDl4eldBoB0zsU7BablgZldzoMASVfrBrMYBa81Br8rSVfjO5eA9nZQ4PG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9foDl4eldBsbCzafCzs82SVfjBd29foE0BrU0gobYgeldzoy14eldBoM0BaR2gsM2zeldzoMASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow58F2rOSHk4eldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCgay2ga8nBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCzafrgoE7zabCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foyHBaM0zsRnBHldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4Vfof7ezZEpNtRHhRHmNZERdzdvxSVf2BsM0BrB1BaBnSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2BsbrgryYgoRnSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gaUrBob0gs91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gabYBafHBafHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsR1zsU0gaMnzZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs8YBrRrzsErgHldzIG9fofYgr80zaBYBeldzoNQ4eldBs8YBr9CgrU7BHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs9CgrU7zaUYgZldzIG9fofYgr80zaBYBeldzoNQ4eldBs91goE2ga8rSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE2gobHBaRCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zab1BrUlgablSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsb1BoblgsMnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrB1zs8nzsEnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBngoErBrMngHldzIG9fofYgr80zaBYBeldzoNQ4eldBoBnza82zsfnSVfjqHldBo9Ygob1Br9lSVfjBseQ4eldBoUlBrE0BofCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoR7grRYBafHgHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo8CzaU0gsBHgHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo81gsBCgav9fowxSVfCgr9nzsyrgrN9foDlht29fof1grB7BoBHBaO9fowxSVfCgr9nzsyrgrN9foDlht29foBlzs9lgrU1grZ9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB2BablgrMHzaN9fowxSVfCgr9nzsyrgrN9foDlht29foBrBoM2goMCBrp9fowxSVfCgr9nzsyrgrN9foDlht29foB7BobCzs9YBre9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrzaUCBob1Bsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHzaU1zsE0Bo39fowxSVfCgr9nzsyrgrN9fow79IZpht29foyrBs91BsErgHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7ew9dfjfIG9foElBry1Bsf1BrO9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2BsU7Br97grbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2BrMrzs9Yzse9fowxSVfCgr9nzsyrgrN9foD2ht29foE7gaU0BsU2gsv9fowxSVfCgr9nzsyrgrN9foDGgaZQ4eldBsUHgoR0BofnzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsRrgr9Ygr82geldzIG9fofYgr80zaBYBeldzoNQ4eldBsylgoBlBaElBpldzIG9fofYgr80zaBYBeldzo8lht29foE1BsEnzsRlgsv9fowxSVfCgr9nzsyrgrN9foDlht29fof7BaR2zsU2gap9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgrUCzsRHzaRHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryrBsy1goB7SVfjqHldBo9Ygob1Br9lSVfjBsylht29foBHBayYzaRnBap9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsElBa91gaE7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrR1Bsb7ga97gpldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBrR0Ba80goe9fowxSVfCgr9nzsyrgrN9foD0BP7ASVfrgryrzs9HBrflSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzsfrgrblBsR0SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU2BoRlgobngoZ9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf7Bof1zs8rzsbCSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo8ngs87zaMCSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfYgo87BoRCBsm9fowxSVfCgr9nzsyrgrN9foDGzsNQhtfAfdBomEZimR0stZOeS7ew9dM5fEgCcYZoXip6OCfjfIG9foECgs8lBry2gsg9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2BoylgaEHSVfjqHldBo9Ygob1Br9lSVfjBsfl4eldgaMHBaU1BoEHBeldzIG9foU2grBHBrE2gsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsR1zayHBrMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsbCzsB7za8nSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gofCgrU7BaUnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs91gayYBobHBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE1goy2gryrgoe9fowxSVfCgr9nzsyrgrN9foDlht29foE0Bsy2gaB7zsZ9fowxSVfCgr9nzsyrgrN9foD2ht29fof2Brf1zafngoO9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgaf1goE0zak9fowxSVfCgr9nzsyrgrN9foDlht29fof7zsy2ga9rgam9fowxSVfCgr9nzsyrgrN9foDlht29fof1goBrzaBlgr39fowxSVfCgr9nzsyrgrN9foDlht29fof0BoBnBr9rBsm9fowxSVfCgr9nzsyrgrN9foD2zaNQ4eldBob1gaylBo8rgpldzIG9fofYgr80zaBYBeldzoflht29foBlBrfYzs9nBrv9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrElzsMYBaR1BeldzIG9fofYgr80zaBYBeldzoNQ4eldBrE0Br8HgoR2BpldzIG9fofYgr80zaBYBeldzoeQ4eldBrBHzaRnBs91BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7grMnBsbYgoe9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYzaM2gaUHgoe9fowxSVfCgr9nzsyrgrN9foDlht29fobrgoylBrB2zZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7gCcYZoXip6OCfjfIG9foElBaEYBsb0gsm9fowxSVfCgr9nzsyrgrN9foDlht29foElgrR1BoMHgsO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2zaB2ga80grEYSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1Br9rzaf7zsm9fowxSVfCgr9nzsyrgrN9foD2ht29foE0gsRlgoEngre9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCBsR7BrE0gr8YSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrbCBsR7zs9nSVfjqHldBo9Ygob1Br9lSVfjBsylht29fofngaB0goblBrv9fowxSVfCgr9nzsyrgrN9fow79IZpht29fof1grB7BoBHBaO9fowxSVfCgr9nzsyrgrN9foDlht29fof0zsU7BofHBsv9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBHgsb1goMlgaO9fowxSVfCgr9nzsyrgrN9foDlht29foBnBsf7BoBYBaN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrzaRHza97BsUCSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1zsBHgrylzaZ9fowxSVfCgr9nzsyrgrN9foD2ht29foUCBsf0gaf0zsk9fowxSVfCgr9nzsyrgrN9foDlht29fo8Hza8lBs9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfngoBCgrf7gsZ9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfngoRlgsylgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9nzsM7gsfCgpldzIG9fofYgr80zaBYBeldzoflht29foy1zaBrBoBHgpldzIG9fofYgr80zaBYBeldzoNQ4eldzay0gaflgoR7SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhm5eTOF23OCfjf50Hcild4Vfof7membZzR7pFmZQi95Zp9Ym3c5mwc59dzdvxSVf2Ba8rzsB2BoynSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gaUYzaU7ga82SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1goR7grE2BsO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zabHgofrBrE1SVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE0grRnzay1goe9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zsyCzsMHBaO9fowxSVfCgr9nzsyrgrN9foDlht29foflBrfngoRHgrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgsU0grBCzaEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoU1grE0goM1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoy1gsUYgoR1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsM7gaylzaB7SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBobrga9ngr9CgZldzIG9fofYgr80zaBYBeldzoNQ4eldBrECgrB7BrRCgpldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7za92BafrgpldzIG9fofYgr80zaBYBeldzoNQ4eldBrU7Bs9HgabCSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrUHgaM7goUrzZldzIG9fofYgr80zaBYBeldzoNQ4eldBry0BryCBo80gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB0ga9HBoUngop9fowxSVfCgr9nzsyrgrN9foDlht29fo8rBaMngo81zeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy7gsE0BrMCBHldzIG9fofYgr80zaBYBeldzoflht29fobCBablgo9ngZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7H3cIZ3cVNO8S9dzdvxSVf2BaflBrb7zaU0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsEngaB7zab0gHldzIG9fofYgr80zaBYBeldzoNQ4eldBsU7go92gr8ngpldzIG9fofYgr80zaBYBeldzoNQ4eldBsU1zsyHBsE2gHldzIG9fofYgr80zaBYBeldzoNQ4eldBsRlgaflBrbYgHldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foEngrR2Ba9HgeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2grM1gsR7zs8CSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsM2BsbCBsfHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBofrBsfCBry2BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUlBrE0BofCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoRYBrRYgrE0gZldzIG9fofYgr80zaBYBeldzoNQ4eldBo87zaM2gsB1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoyHBaRrzs87gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrf2BsyrgrM2gHldzIG9fofYgr80zaBYBeldzo8lht29foB7BaBrBsfCBap9fowxSVfCgr9nzsyrgrN9foDlht29foB7BoE2Bob2grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgr82zaM7BoEHSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgaMHgs9lgrU2zZldzIG9fofYgr80zaBYBeldzoNQ4eldgafngaE1za8nzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUngaBCgay7BHldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfHgo92gsRrBsO9fowxSVfCgr9nzsyrgrN9foDCBPHQfdldfCgEmROespgvZbZhsFQnOtM5fEgCcYZoXip6OCfjfIG9foE2grMYBrM2gap9fowxSVfCgr9nzsyrgrN9fow79IZpht29foE7go91BrEHgap9fowxSVfCgr9nzsyrgrN9foDrgoNQ4eldBsR2goMCgayYBHldzIG9fofYgr80zaBYBeldzo8lht29foEngsRrgrBrBsk9fowxSVfCgr9nzsyrgrN9foDlht29foE1Bs8HBoynzsp9fowxSVfCgr9nzsyrgrN9foDCht29foflgry1grR2zaN9fowxSVfCgr9nzsyrgrN9foDlht29fof2gsMnBob2Brv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgs92BrE2gaM0SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCgo97Bo9CBab1SVfjqHldBo9Ygob1Br9lSVfjBS7ASVfCzsBHzaU2BsB1SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0Bryrzsf2gre9fowxSVfCgr9nzsyrgrN9foDGgaZQ4eldBrfYBofrBsR7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrflBs8lBoB0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgaynBoyYBs9HSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr9rgoEHgsb1BZldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYgrU7Bablgsk9fowxSVfCgr9nzsyrgrN9foDlht29foUCgs9rBoBlBHldzIG9fofYgr80zaBYBeldzoNQ4eldgsBCBrf2zsBrSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfnBaB7zsUHBrv9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf1BaB2gsf0gsZ9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldzsbYgaf7ga81SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhsn1ykSgpfoDdqHldBsMnBsMrza8YzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2BoR7BoBrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBs8YBoflBofrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaM1Bob2gsMrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBsbnBsRngsErBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoB2BoRCgs9ngpldzIG9fofYgr80zaBYBeldzoNQ4eldBoRCgsMnzsBnBpldzIG9fofYgr80zaBYBeldzoflht29fofngoElBoE0zae9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgoyHBrf7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoyCgr9nBsRlBZldzIG9fofYgr80zaBYBeldzoNQ4eldBrMlgaBYBoEYBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7gaUHgrfYgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBYBa92zay7Bov9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr92grMrBa9lzeldzIG9fofYgr80zaBYBeldzo8lht29foB0BrR2gsE1geldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB0zs8CBaM0Bs39fowxSVfCgr9nzsyrgrN9foDlht29foU2BobHgoUCgak9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BsbrBoR0za80SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUrgaR2zaEnzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy2gsUnzs8YBpldzIG9fofYgr80zaBYBeldzoNQ4eldzaUYBsM7zaErSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhRIZ6c5p6OCfjfIG9foElgaElza97grO9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsf7Bo9Hgo8YBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsBCgsBnBsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0zsyCBsylgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7grUCgrU2grm9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zaf7zs92gsbrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoMCBr9Hgr91zZldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsBlBo90BoM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrU1gsRrBofYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBo9YBs9CBsblgZldzIG9fofYgr80zaBYBeldzoNQ4eldBoyrBrRnBo9lBZldzIG9fofYgr80zaBYBeldzoNQ4eldBobrzaRrBsyHzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBlgr9Cgsy2BoO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBof7Boy2gsy1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBoU7gsBlBrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgafCBrB7gsU1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgoUnzsbnBaB1SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgaM0BoM2BsyYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7gof7zabrBoO9fowxSVfCgr9nzsyrgrN9foDlht29foUngrfrBrBHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldzaB2gry2BsBYSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhRne5OtNfOFebfoDdqHldBsE7gsMHza91zeldzIG9fofYgr80zaBYBeldzoNQ4eldBsU7gaM1ga8nBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7gaylgrBrgae9fowxSVfCgr9nzsyrgrN9foDlht29foEngrBHBrb2Brk9fowxSVfCgr9nzsyrgrN9foDlht29foEYzsUHBry2gag9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zsbnBsf1BrErSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoE2gsU2gsU7BHldzIG9fofYgr80zaBYBeldzoNQ4eldBofCzaylBrM7BZldzIG9fofYgr80zaBYBeldzoNQ4eldBoU2BoRrzsBrBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofHBsBYBsUrgs39fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCgsRlza87zs9lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoRHzsy0gr9rSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofnzsBnzsBYBsO9fowxSVfCgr9nzsyrgrN9foDlht29foBlgsyHgsf1Bam9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrEnBsR1za9rgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrzaE7Baf1gsm9fowxSVfCgr9nzsyrgrN9foDlht29foBnBsbCBrylgog9fowxSVfCgr9nzsyrgrN9foDlht29foU2grM0BaB7zag9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfnBoUHBsf1gov9fowxSVfCgr9nzsyrgrN9foDlht29fo8rgrU0zaECgZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgoMHBrbHSVfjqHldBo9Ygob1Br9lSVfjBsfl4eldgaMHBaU1BoEHBeldzIG9foU2grBHBrE2gsp9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeSHgD8SvpOVfjfIG9foElzayCza9Czap9fowxSVfCgr9nzsyrgrN9foDlht29foEngsEYzsEHBsp9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2grynBsE7gog9fowxSVfCgr9nzsyrgrN9foDlht29foE0gsU7zaBngs39fowxSVfCgr9nzsyrgrN9foDlht29fof2zaU7BafrBak9fowxSVfCgr9nzsyrgrN9foDlht29fof7goUCzaB0zak9fowxSVfCgr9nzsyrgrN9foDlht29foB2Bsf1gofngeldzIG9fofYgr80zaBYBeldzoNQ4eldBrB2zsb1BoMCgpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgabnBoEHgabYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrR7gaflgrBngeldzIG9fofYgr80zaBYBeldzoNQ4eldBrR1zablzs8YgpldzIG9fofYgr80zaBYBeldzoNQ4eldBryHzab7go87BHldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrza81gry1zsf0SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrblBsMnzsMrgZldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUCBr92gsb2BoZ9fowxSVfCgr9nzsyrgrN9foDlht29foUCzaErBof7go39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7Bob2ga8lBsy1SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgsUHBo9rgaMHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgsynBo9nBry0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgoB0Bo87gayYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsy1goBlBrm9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7membZzR7pFmZQsciQYfiHKkipKcdfjfIG9foEHzsyrBsUlgap9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2goE1gsbHzaEnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2go80goblBs9nSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBsbYgo8YBrbnBHldzIG9fofYgr80zaBYBeldzoNQ4eldBsb1BrfCzs8rgZldzIG9fofYgr80zaBYBeldzoflht29fofrBof2gaBrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBr8nBsBrBa8YSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaM1BaE1zs8YSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof1zsR2zay1gaO9fowxSVfCgr9nzsyrgrN9foDlht29fof0go8lBo9nBrk9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBaErgoyrzay1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBaBYzabHBrfHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBoy2goMYgabrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrBnzsB1goR1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8rBsMrBr92BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgoU0ga9rgoM1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBr80Brynzsy7gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrbYzaUHzsb1BZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foyCgr90BoR1BHldzIG9fofYgr80zaBYBeldzoNQ4eldzsEYzsB0zsB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsMlgoU7BoZ9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgEmROespgvZbZhRYm3c5mwc59dzdvxSVf2BaMYgsb0BrN9fowxSVfCgr9nzsyrgrN9foDlht29foE2Bsf1BaB1Bsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gaMrgsBrza82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gaRYBaylBoMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaMYBsy1zse9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsyHza87gsE7BeldzIG9fofYgr80zaBYBeldzoNQ4eldBofYzaR7grUlSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofrBrbHgaB0Ba39fowxSVfCgr9nzsyrgrN9foDlht29fofrgs82gobnBav9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCgsUlgaB2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgrynza80grO9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrgaErBaUlBoRrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrRlgofYzs91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRlgo87gryHBZldzIG9fofYgr80zaBYBeldzoNQ4eldBr8ngrMlgo91geldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYBaR2zsU7zsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrUrBa82gaBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzaUCBob1Bsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBrBnBo97zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf1Baf0BaB1Brm9fowxSVfCgr9nzsyrgrN9foDlht29fobYBsU2gr82BHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoRbePmRvWZVfjfIG9foElBa8Yzaf0Brv9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2gofYgrU7BaU1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2zablBaU2zs87SVfjqHldBo9Ygob1Br9lSVfjBrZQ4eldBoEYgrE0BrBCSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BV29foEYgr8YgpldzoM6BV29foEYgr81gHldzoM6gry7BrErgrbYzsRlgrU7gIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBoBHBaMnzsBlSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoRCgoyHgrU2zZldzIG9fofYgr80zaBYBeldzoB2ht29fofnzaBHBrflBo39fowxSVfCgr9nzsyrgrN9foDCgS7ASVfCzs90goU2Ba8HSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrUCgs9HBoRCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBr8CBaR7grb7SVfjqHldBo9Ygob1Br9lSVfjBo3Q4eldgsf1BrU7BofnSVfjqHldBo9Ygob1Br9lSVfjgYHQht29foflzabrBobCBsN9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foflzab2ga8HBoO9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBoM1zsBCzsflgpldzIG9fofYgr80zaBYBeldzovQ4eldBoM0BafrBa9nBHldzIG9fofYgr80zaBYBeldzoZQ4eldBrB7zaR2BaRlzeldzIG9fofYgr80zaBYBeldzo8lht29foBrgo8YzsbYBav9fowxSVfCgr9nzsyrgrN9foDHht29foB7gaE7gsECBap9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1rBsBYBoRHBaECzsy0BaU74eldBs9Ygo9nSVfjBV11Bo97gsElgsMCzaEHBoUY4eldBs9YgoyYSVfjBV1nBrbCBsRYBa9Ygry0BrMYhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrgabYBafHza8lSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BaynBo97gsECBsECBsUlgo8ASVf2gr9ngrO9foDl4oM1gofYgaR2BoE2BoE7Ba8n4eldBs9YgoyYSVfjBV1lza8CgrUHBsf2Bsf2gaMngIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldzs87zaf2Br9nSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BrBYBoR7zsE2go82BsU1Ba9ASVf2gr9ngrO9foDl4o97zsM2zs8CBoylBo9rgaUASVf2gr9nzak9foDl4ob7BsEYgoRrBr80zsMrgsOQSSHQ4eldBoM0BaR2gsM2zeldzoNQhSHQ4eldBoyHzaRCBoErgeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9fofHBo81gs97Bsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCgr8rBrU2gaB7SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgaflgsy0ga81zeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCzs91zabCgoe9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaEnBay0grfnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2BaU1zs9HzaBYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsMYBo91ga9HgeldzIG9fofYgr80zaBYBeldzoylht29foE2Bsf2BoyCBaO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2BsBCBaB7Ba9CSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsEHBoRnga9YBeldzIG9fofYgr80zaBYBeldzovQ4eldBsEYgoBHBaBYgeldzIG9fofYgr80zaBYBeldzoylht29foECBaM0Bs82Bog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2Bo8HBabHBr91SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsf1Bof0zaE0gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foECzs87BrfHBsZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2BrEYBsf7zae9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2Brfngo9lBr9CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsB7Baylga80BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7BsMCBoUrBrv9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2gaB1ga9lgsE0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsU7go9YBay1BeldzIG9fofYgr80zaBYBeldzoRlht29foE7gay2zsR2BaN9fowxSVfCgr9nzsyrgrN9foDlht29foE7grf7zablgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gsBCzaE7BsU7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsRrgoUlgsf1BHldzIG9fofYgr80zaBYBeldzoNQ4eldBsR7BaRYBo90gHldzIG9fofYgr80zaBYBeldzoRlht29foEHzaMnzaU1zZldzIG9fofYgr80zaBYBeldzoNQ4eldBs82BsBCgsbHBpldzIG9fofYgr80zaBYBeldzoRlht29foEnBsf2zaMlBav9fowxSVfCgr9nzsyrgrN9foDCht29foEnBoEHgry0BrN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2go9lzaRrgsBYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2go91grE1zaRlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gob2BaR2ga8CSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBs80zaUlgrUngHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEYBaMngrU1Bog9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2grErzsfCgoyCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBs92gsBYgsO9fowxSVfCgr9nzsyrgrN9foDCht29foEYBrb0Bry2Bsv9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2grUrBrUHBo8nSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsyCBsBHgrb7BZldzIG9fofYgr80zaBYBeldzoylht29foE1BobCBo81Brv9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zaU2gaBCBsb0SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsy7zsM1gr91BpldzIG9fofYgr80zaBYBeldzoNQ4eldBsy7zsBYzaM1geldzIG9fofYgr80zaBYBeldzoRlht29foE1gsfYgoMnBaO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2za8CgsyCBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1go81zsU0Bom9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zay7gsblBsBCSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsy0goBHBrf0gpldzIG9fofYgr80zaBYBeldzoRlht29foE0BsM7za9nBsm9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zsE1Br97Br81SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsfYgo8lgaf1SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsbYBs97gsErBpldzIG9fofYgr80zaBYBeldzoRlht29foE0grbngsbrBrk9fowxSVfCgr9nzsyrgrN9foDCht29foE0za82BaBnzsg9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBaMCBo9lBsbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBaf0Brb0grBnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoM7BrRrgaMHgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflga9CBsf7gog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBa8nzabHzaU1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsMrzsB7za91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsM7grE7goE0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoE2zay7zabrgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2go9Cgsy0gap9fowxSVfCgr9nzsyrgrN9foDlht29fof2gr81zsEnzap9fowxSVfCgr9nzsyrgrN9foDlht29fof2zsMlBaU7Bok9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBoErBofCBoE7SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBofrgsB2zaU0geldzIG9fofYgr80zaBYBeldzoNQ4eldBofrzsUlzs9lgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofCzaBlBafrzsO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBobYza87gsUnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoB7go81gs9HSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBrR7BaR2zsEYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoUlBaf0Boe9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfCga8CgaE0goE1SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoU0ga87zs8CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoRHzsy1gsbnzZldzIG9fofYgr80zaBYBeldzoylht29fofnBaMCga8Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fofnBaBrzaE0gsZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCgoE7grM1goZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCgoB2gab7goyrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBo8nBabnBsyrgZldzIG9fofYgr80zaBYBeldzovQ4eldBo9CzayHga92geldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYBrRrgoECzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaf7Bo9CBo39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzaRlgrfYgsy0SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoyngaynBsblgHldzIG9fofYgr80zaBYBeldzoRlht29fof1grM0ga9HBHldzIG9fofYgr80zaBYBeldzoRlht29fof1grR2BsU1zaZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzab1zafCBsy2SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzsM2gry0BrUCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBob2go8CBab0BpldzIG9fofYgr80zaBYBeldzoNQ4eldBob2zaUHzsElSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBobCgoUlgo8CgZldzIG9fofYgr80zaBYBeldzoRlht29fof0BrBngaRHzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof0Br8YgrM1gsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzsR7BoElgr91SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrMHzsylBof1SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrM1Bo9nBo91gHldzIG9fofYgr80zaBYBeldzoRlht29foB2Baf0BsUlBrp9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBsMHgaRrBobHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsEYza90Brb2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrECgsB2BaBHgpldzIG9fofYgr80zaBYBeldzovQ4eldBrE7grBlBsbYgZldzIG9fofYgr80zaBYBeldzoRlht29foB2gabCgrMrgam9fowxSVfCgr9nzsyrgrN9foDlht29foB2gsMHBs8CBaZ9fowxSVfCgr9nzsyrgrN9foDlht29foB2gsf7zaE7gsv9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBs82gry2Ba9lSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrEYBrBlBsE2geldzIG9fofYgr80zaBYBeldzovQ4eldBrE1BoyHgoU0gHldzIG9fofYgr80zaBYBeldzoRlht29foBCBrRnBa97zsO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBoU1BaUngo9nSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrfngaBHgoM2BHldzIG9fofYgr80zaBYBeldzovQ4eldBrf1BabCgoB2BHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBCzsM1zs8rBag9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBrMHBa8ngsf1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrBCBof2gsE2zeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrga97BsEHgop9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBr8lgsUYzaE0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBr8Hzay2grUrSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrUlBaEnBoRnzeldzIG9fofYgr80zaBYBeldzoRlht29foB7BrBrgrb7zap9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrgaB1gaR0goRYSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrU7gaUCzs8CgHldzIG9fofYgr80zaBYBeldzoylht29foB7gaR0goblzZldzIG9fofYgr80zaBYBeldzoRlht29foB7gsE2gob2grv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrga8CBaB7BoynSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrgay7Bsf1BoBrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrU1go9YBaE0BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgrMrgoM1zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgr82Bsblgoe9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsyCgsR1Br8YSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrgsyYBrECBok9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrgoMYgsyYza9CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBr82BoRrBa8nBHldzIG9fofYgr80zaBYBeldzovQ4eldBr82grEYzabCBHldzIG9fofYgr80zaBYBeldzoRlht29foBngaR1Brf0Brm9fowxSVfCgr9nzsyrgrN9foDlht29foBngoMCBoR2Bag9fowxSVfCgr9nzsyrgrN9foDlht29foBngryHgafCBaZ9fowxSVfCgr9nzsyrgrN9foDCht29foBnzaBHBs8CBak9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrM2zaf2BoRHSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr92gsbHgsRYBHldzIG9fofYgr80zaBYBeldzoRlht29foBYgo91zsElgrO9fowxSVfCgr9nzsyrgrN9foDCht29foBYzayrzaf0gov9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrbrBoR1zsp9fowxSVfCgr9nzsyrgrN9foDlht29foB1ga91ga91Bsg9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrzaU1ga8nzsbrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrynBryrBrBlgpldzIG9fofYgr80zaBYBeldzovQ4eldBry0BoMHzs81BHldzIG9fofYgr80zaBYBeldzoRlht29foB0BaMrBa9Czae9fowxSVfCgr9nzsyrgrN9foDlht29foB0Ba8rgaMHBov9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrzsE7zafCgsO9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrzsfYgo8Ygo9HSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrbYgsfYgsfrBHldzIG9fofYgr80zaBYBeldzovQ4eldBrb1zsEYgrM1gHldzIG9fofYgr80zaBYBeldzoRlht29foUlBa9rBryngom9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf7BaECgaMCzayHSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgaMHgayYBrN9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf7BablgaMYBs91SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgaErzsMYBsyYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgaEHgsBCgsf0gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU2grBrBayYzam9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BsyYBaf7BoR0SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgaf2gr81BabHzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUCzabHgsBrBog9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf7Boy0goRnBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUrBsflgaRrBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU7gayYBsR2BpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU7gsBrzay7zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU7zaylBry0gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUYgayHgoylgZldzIG9fofYgr80zaBYBeldzovQ4eldgabCBrbngsyYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgsM7grb7BrRYSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgsE2zs8nzaBnSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgsB7goyYgrflSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgsBHgrMHBryCSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgsbrBsEYgoUnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgsb1grfHzaBnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgoErBrR1zs80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgofHgaUrBafYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgoB2BaR7Bs9YSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgoUCBrE1gsfnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgoRnzsR2goR0SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgoyrBoECgsb7SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgoyHBrfrgop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfnzabCBoMYgsk9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYBaMYgs90BsN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYBobrgsb7Bom9fowxSVfCgr9nzsyrgrN9foDlht29fo9nBsM0BabrBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo91zsb0zaM0zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foyngsB2Bob1BpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foyYBo81grBHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldzsB2zs97gaBnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldzsUYgrUHgrUnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldzsRrzsb1BsUCSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf0gs81Br9CBoO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf0grM0grEHgam9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf0zab7grErBaN9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBoRbZasHvEmZvhUFpCfoDdqHldBsy1zaBHBayrgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofHBobYgrynzsm9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fIHQfdldfCgtmRgWRbmeRpQNXSfyvdNa95QH8n3wc59dzdvxSVf2zsMCgaElzsMnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo91gaUCBab2BeldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7gCcYZoXip6OCfjfIG9foB0zayHgaEHBsO9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVfHzsy7BsE2zsv9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQi8FGpcieIfoDdqHldBoEHBsBlgoRnBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBCgofngrElgoe9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fIHQfdldfCgtmRgWRbmeRpQi95Zp9Ym3c5mwc59dzdvxSVfCBa91BoM1zsU7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoE7zsB7gaE0gpldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7H3cIZ3cVNO8S9dzdvxSVfrgafCBob1zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfHga9rzaM1zap9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fIHQfdldfCgtmRgWRbmeRpQgcYOpfV8yUYvKkFgDXF0IfoDdqHldBsE0go8Hgs9CBZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29fof2gsRlzs8ngoe9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQWcdNH9nRdzdvxSVf2goBHBsy2gaf1SVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQ4eldBs9rBs8Hgaf7BeldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4VfofHveU7QtmEZtSHvHc50wc59dzdvxSVf2BoRHgoB0BofrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBngrMlBr9CBHldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtSHg3O5RytiZ3OVfjfIG9fofYzayngs92gak9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVfrgobrgab7BsE0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhtfAfdBoRbZasHvEmZvhRn3395ZbfoDdqHldBs91gobrzs87zZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29foE1zaB7Bsf7goe9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQsciQYfiHKkipKcdfjfIG9foECgsB0BaE2zap9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVfrBa9rzaRCzsErSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhtfAfdBoRbZasHvEmZvhRYm3c5mwc59dzdvxSVfCzs8HBaBHzs9lSVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQ4eldgoU0grUHzaB1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhtvQ"))
					v253()
					presets.list:update(v252())
					t108 = {}
					n11 = 0
					u256 = false
					u257 = nil
					n12 = 0
					n13 = 0
					u260 = false
					t109 = {
						[1] = -1,
						[2] = 1,
						[3] = 0,
						[4] = -1,
						[5] = 1,
						[6] = 0,
						[7] = -1,
						[8] = 0,
						[9] = 1,
						[10] = -1,
						[11] = 0,
						[12] = 1
					}
					n14 = 0
					n15 = 0
					t110 = {}

					local angles = t3.antiaim.angles
					local t111 = {}

					t111.__index = t111

					function t111.clear(p341)
						for k in pairs(p341) do
							p341[k] = nil
						end
					end

					function t111.copy(p342, p343)
						for k, v in pairs(p343) do
							p342[k] = v
						end
					end

					function t111.unset(_)
						-- upvalues: angles (copy)
						angles.enabled:override()
						angles.pitch:override()
						angles.yaw[1]:override()
						angles.yaw[2]:override()
						angles.yaw[3]:override()
						angles.yaw[4]:override()
						angles.yaw[5]:override()
						angles.yaw_modifier[1]:override()
						angles.yaw_modifier[2]:override()
						angles.body_yaw[1]:override()
						angles.body_yaw[2]:override()
						angles.body_yaw[3]:override()
						angles.body_yaw[4]:override()
						angles.body_yaw[5]:override()
						angles.body_yaw[6]:override()
						angles.freestanding[1]:override()
						angles.freestanding[2]:override()
						angles.freestanding[3]:override()
						angles.extended_angles[1]:override()
						angles.extended_angles[2]:override()
						angles.extended_angles[3]:override()
					end

					function t111.set(p345)
						-- upvalues: angles (copy)
						angles.enabled:override(p345.enabled)
						angles.pitch:override(p345.pitch)
						angles.yaw[1]:override(p345.yaw)
						angles.yaw[2]:override(p345.yaw_base)
						angles.yaw[3]:override(p345.yaw_offset)
						angles.yaw[4]:override(p345.avoid_backstab)
						angles.yaw[5]:override(p345.hidden)
						angles.yaw_modifier[1]:override(p345.yaw_modifier)
						angles.yaw_modifier[2]:override(p345.modifier_offset)
						angles.body_yaw[1]:override(p345.body_yaw)
						angles.body_yaw[2]:override(p345.inverter)
						angles.body_yaw[3]:override(p345.left_limit)
						angles.body_yaw[4]:override(p345.right_limit)
						angles.body_yaw[5]:override(p345.options)
						angles.body_yaw[6]:override(p345.freestanding_body_yaw)
						angles.freestanding[1]:override(p345.freestanding)
						angles.freestanding[2]:override(p345.freestanding_disable_yaw_modifiers)
						angles.freestanding[3]:override(p345.freestanding_body_freestanding)
						angles.extended_angles[1]:override(p345.extended_angles)
						angles.extended_angles[2]:override(p345.extended_angles_pitch)
						angles.extended_angles[3]:override(p345.extended_angles_roll)
					end

					setmetatable(t110, t111)
					t112 = {}

					local u268 = false
					local n16 = 0

					local function v270()
						-- upvalues: u268 (ref)
						u268 = not u268
					end
					local function v271()
						-- upvalues: n16 (ref)
						n16 = n16 + 1
					end
					local function v272(p346)
						-- upvalues: t93 (ref), t110 (copy)
						if p346.force_target_yaw:get() then
							if t93.defensive_ticks ~= 0 then
								t110.yaw_left = -9
								t110.yaw_right = 6
								t110.yaw_modifier = "Disabled"
								t110.modifier_offset = 0
								t110.body_yaw = true
								t110.inverter = false
								t110.left_limit = 60
								t110.right_limit = 60
								t110.options = {}

								return
							end

							return
						end
					end
					local function v273(p347, p348)
						local v1552 = nil

						if p348.delay:get() then
							local v1553 = p348.delay_mode:get()

							if v1553 == "Default" then
								v1552 = p348.delay_value:get()

								local v1554 = p348.delay_random:get()

								if v1554 > 0 then
									v1552 = utils.random_int(v1552, v1554)
								end
							end

							if v1553 == "Custom" then
								local v1555 = p348.delay_count:get()
								local v1556 = math.random(1, v1555)

								if p348.delay_values[v1556] ~= nil then
									v1552 = p348.delay_values[v1556]:get()
								end
							end
						end

						local v1557 = p348.delay_affect_modifier:get()

						p347.delay = v1552
						p347.delay_affects_modifier = v1557
					end
					local function v274(p349, p350)
						-- upvalues: u268 (ref), t2 (ref)
						local v1560 = p350.pitch:get()
						local v1561 = p350.pitch_speed:get()
						local v1562 = p350.pitch_offset_1:get()
						local v1563 = p350.pitch_offset_2:get()

						if v1560 ~= "Off" then
							if v1560 ~= "Static" then
								if v1560 ~= "Jitter" then
									if v1560 ~= "Spin" then
										if v1560 ~= "Random" then
											if v1560 ~= "Angelic" then
												return
											end

											p349.pitch_offset = math.map(math.abs(globals.realtime % 0.3 - 0.15), 0, 0.15,
												-89, 89)

											return
										end

										p349.pitch_offset = utils.random_int(v1562, v1563)

										return
									end

									local v1564 = globals.curtime * v1561 * 0.1

									p349.pitch_offset = t2.lerp(v1562, v1563, v1564 % 1)

									return
								end

								p349.pitch_offset = u268 and v1563 or v1562

								return
							end

							p349.pitch_offset = v1562

							return
						end
					end
					local function v275(p351, p352)
						-- upvalues: n16 (ref), v273 (copy)
						local v1567 = p352.yaw_modifier:get()

						if v1567 ~= "Off" then
							local v1568 = p352.modifier_offset:get()

							if v1567 == "Offset" then
								p351.yaw_offset = 0
								p351.yaw_modifier = "Offset"
								p351.modifier_offset = v1568
							end

							if v1567 == "Center" then
								if not p352.delay_affect_modifier:get() then
									local v1569 = bit.band(n16, 1) ~= 0

									p351.yaw_offset = p351.yaw_offset + (v1569 and v1568 or -v1568) * 0.5
								else
									p351.yaw_left = p351.yaw_left - v1568 * 0.5
									p351.yaw_right = p351.yaw_right + v1568 * 0.5
								end
							end

							if v1567 == "Skitter" then
								p351.yaw_offset = 0
								p351.yaw_modifier = "Skitter"
								p351.modifier_offset = v1568
							end

							v273(p351, p352)

							return
						end
					end
					local function v276(p353, p354)
						-- upvalues: t2 (ref), v275 (copy)
						local v1572 = p354.yaw:get()

						if v1572 ~= "Off" then
							local v1573 = p354.yaw_speed:get()
							local v1574 = p354.yaw_offset:get()

							p353.yaw_left = 0
							p353.yaw_right = 0
							p353.yaw_offset = 0
							p353.delay = 1

							if v1572 == "Static" then
								p353.yaw_offset = v1574
							end

							if v1572 == "Spin" then
								local v1575 = globals.curtime * v1573 * 0.1
								local v1576 = v1574 * 0.5

								p353.yaw_offset = -(180 + t2.lerp(-v1576, v1576, v1575 % 1))
							end

							if v1572 == "Random" then
								local v1577 = math.abs(v1574 * 0.5)

								p353.yaw_offset = 180 + utils.random_int(-v1577, v1577)
							end

							if v1572 == "Left/Right" then
								p353.yaw_offset = 0
								p353.yaw_left = p353.yaw_left + p354.yaw_left:get()
								p353.yaw_right = p353.yaw_right + p354.yaw_right:get()
							end

							if v1572 == "Side-Based" then
								p353.yaw_offset = 0
								p353.yaw_left = p353.yaw_left - 90 + utils.random_int(-v1574, v1574)
								p353.yaw_right = p353.yaw_right + 90 + utils.random_int(-v1574, v1574)
							end

							v275(p353, p354)

							return
						end
					end
					local function v277(p355, p356)
						local v1580 = nil

						if p356.tickbase:get() == "Ticks" then
							v1580 = p356.tickbase_ticks:get()
						end

						if p356.tickbase:get() == "Random" then
							v1580 = utils.random_int(p356.tickbase_min:get(), p356.tickbase_max:get())
						end

						if v1580 ~= nil then
							p355.force_defensive = p355.command_number % v1580 == 0
						end
					end

					function t112.update(_, p358)
						-- upvalues: t110 (copy), t3 (ref), v270 (copy), v271 (copy)
						t110.hidden = false
						t3.ragebot.main.hide_shots[2]:override()
						t3.ragebot.main.double_tap[2]:override()

						if p358.choked_commands == 0 then
							v270()
							v271()
						end
					end

					function t112.apply(_, p360, p361)
						-- upvalues: t110 (copy), t3 (ref), v277 (copy), v272 (copy), v274 (copy), v276 (copy)
						if p361.force_break_lc ~= nil and p361.force_break_lc:get() then
							t110.hidden = true
							t3.ragebot.main.hide_shots[2]:override("Break LC")
							t3.ragebot.main.double_tap[2]:override("Always On")
							v277(p360, p361)
						end

						if not p361.enabled:get() then
							return false
						end

						local t113 = {}

						v272(p361)
						v274(t113, p361)
						v276(t113, p361)
						t110.defensive = t113

						return true
					end

					t114 = {}

					local invert_flick = t29.antiaim.settings.invert_flick
					local n17 = 0

					local function v281()
						if rage.exploit:get() == 1 then
							local v1592 = entity.get_local_player()

							if v1592 ~= nil then
								local v1593 = v1592:get_player_weapon()

								if v1593 ~= nil then
									local v1594 = v1593:get_weapon_info()

									if v1594 ~= nil and not v1594.is_revolver then
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

					function t114.update(_, p363, p364)
						-- upvalues: v281 (copy), n17 (ref), t93 (ref), t110 (copy), invert_flick (copy)
						if p364.flick_enabled:get() then
							if v281() then
								if p363.choked_commands == 0 then
									n17 = n17 + 1
								end

								p363.force_defensive = p363.command_number % 7 == 0

								if t93.defensive_ticks > 0 then
									local v1598 = p364.flick_speed:get()
									local v1599 = p364.flick_speed_random:get()

									if v1599 > 0 then
										local v1600 = v1598 + utils.random_int(-v1599, v1599)

										v1598 = math.clamp(v1600, 2, 10)
									end

									if v1598 < t93.defensive_ticks - t93.max_defensive_ticks then
										return
									end
								end

								local v1601 = p364.flick_limit:get()

								t110.yaw = "Backward"
								t110.yaw_offset = 0
								t110.yaw_left = 0
								t110.yaw_right = 0
								t110.hidden = true
								t110.yaw_modifier = "Disabled"
								t110.modifier_offset = 0
								t110.body_yaw = true
								t110.inverter = false
								t110.left_limit = v1601
								t110.right_limit = v1601
								t110.options = {}

								local t115 = {}
								local v1603 = p364.flick_pitch:get()
								local v1604 = p364.flick_yaw:get()
								local v1605 = p364.flick_yaw_random:get()
								local v1606 = v1604 + utils.random_int(-v1605 * 0.6, v1605 * 0.6)

								t115.pitch_offset = v1603
								t115.yaw_offset = v1606

								local v1607 = invert_flick.enabled:get()

								if p364.flick_mode:get() == "Silent" and bit.band(n17, 1) ~= 0 then
									v1607 = not v1607
								end

								if v1607 then
									t115.yaw_offset = -t115.yaw_offset
								end

								t110.defensive = t115

								return true
							end

							return false
						end

						return false
					end

					t116 = {}

					local recorder = t29.antiaim.recorder
					local builder = t29.antiaim.builder
					local s10 = "dWP7FQ3AEliGeqr98jbUM64XmCfc05gw1JDHhaYBKk2tRxVypInNouvsLZzOST+/="
					local t117 = {}
					local n18 = 0

					local function v288(p365)
						local ok, result = pcall(json.parse, p365)

						if ok then
							return true, result
						end

						return false, "Can't parse data"
					end
					local function v289(p366)
						-- upvalues: base64 (copy), s10 (copy)
						local ok, result = pcall(base64.decode, p366, s10)

						if ok then
							return true, result
						end

						return false, "Can't decode data"
					end
					local function v290(p367, p368, p369)
						-- upvalues: s1 (copy)
						if p367 ~= p368 or p367 ~= p369 then
							if p367 ~= p368 then
								if p367 ~= p369 then
									if not (p368 < p367) or not (p367 < p369) then
										return s1:rep(9)
									end

									return s1:rep(2) .. ui.get_icon("pipe") .. s1:rep(6)
								end

								return ui.get_icon("arrow-up") .. s1:rep(4)
							end

							return ui.get_icon("arrow-down") .. s1:rep(4)
						end

						return ui.get_icon("arrow-right") .. s1:rep(3)
					end
					local function v291(p370)
						-- upvalues: v7 (copy), v290 (copy)
						if p370 ~= nil then
							local data = p370.data
							local sequence_start = p370.sequence_start
							local sequence_end = p370.sequence_end

							if data ~= nil then
								local t118 = {}

								for i = 1, #data do
									local v1634 = data[i]

									t118[i] = v7(v290(i, sequence_start, sequence_end), "\a{Link Active}", i, "\aDEFAULT",
										":", " ", "Yaw: ", "\a{Link Active}", v1634[4], "\aDEFAULT", " ", "Modifier: ",
										"\a{Link Active}", v1634[8], "\aDEFAULT")
								end

								return t118
							end

							return {}
						end

						return {}
					end
					local function v292()
						-- upvalues: builder (copy)
						return builder.state:get()
					end
					local function v293(p371)
						-- upvalues: builder (copy)
						return builder[p371]
					end
					local function v294(p372, p373)
						local ok, result = pcall(json.stringify, p373)

						if ok then
							local recorder2 = p372.recorder

							if recorder2 ~= nil then
								recorder2.record:set(result)

								return true
							end

							return false
						end

						return false
					end
					local function v295(p374, p375, p376)
						p374.pitch = p375[1]
						p374.yaw = p375[2]
						p374.yaw_base = p375[3]
						p374.yaw_offset = p375[4]
						p374.hidden = p375[6]
						p374.yaw_modifier = p375[7]
						p374.modifier_offset = p375[8]
						p374.body_yaw = p375[9]
						p374.inverter = p375[10]
						p374.left_limit = p375[11]
						p374.right_limit = p375[12]
						p374.options = p375[13]
						p374.freestanding_body_yaw = p375[14]
						p374.delay = nil

						if p376 then
							p374.inverter = not p374.inverter
						end
					end
					local function v296()
						-- upvalues: v291 (copy), t23 (ref), recorder (copy)
						local v1644 = v291(t23.recorder)

						recorder.sequence_list:update(v1644)
					end
					local function v297(p377)
						-- upvalues: recorder (copy)
						recorder.sequence_list:visibility(p377)
						recorder.set_start_button:visibility(p377)
						recorder.set_end_button:visibility(p377)
						recorder.save_button:visibility(p377)
						recorder.import_button:visibility(not p377)
					end
					local function v298()
						-- upvalues: t24 (ref), v293 (copy), t117 (copy)
						for i = 0, #t24.states do
							local v1647 = t24.states[i]
							local v1648 = v293(v1647)

							if v1648 ~= nil then
								local recorder3 = v1648.recorder

								if recorder3 ~= nil then
									local v1650 = recorder3.record:get()
									local ok, result = pcall(json.parse, v1650)

									if ok then
										t117[v1647] = result
									end
								end
							end
						end
					end

					function t116.update(_, p379)
						-- upvalues: v293 (copy), t23 (ref), recorder (copy), v295 (copy), t110 (copy), t117 (copy), n18 (ref)
						local v1655 = v293(p379)

						if v1655 ~= nil then
							local recorder4 = v1655.recorder

							if recorder4 ~= nil then
								local data = t23.recorder.data
								local capture = t23.recorder.capture

								if data == nil or capture == nil then
									local v1659 = t117[p379]

									if v1659 ~= nil then
										local v1660 = #v1659

										if globals.choked_commands == 0 then
											if v1660 <= n18 then
												n18 = 0
											end

											n18 = n18 + 1
										end

										local v1661 = v1659[n18]

										if v1661 ~= nil then
											local v1662 = recorder4.inverse_inverter:get()

											v295(t110, v1661, v1662)

											return true
										end

										return false
									end

									return false
								end

								local v1663 = recorder.sequence_list:get()

								if v1663 ~= nil then
									local v1664 = data[v1663]

									if v1664 ~= nil then
										local v1665 = recorder4.inverse_inverter:get()

										v295(t110, v1664, v1665)

										return true
									end

									return false
								end

								return false
							end

							return
						end
					end

					recorder.set_start_button:set_callback(function()
						-- upvalues: t23 (ref), recorder (copy), v296 (copy)
						if t23.recorder.capture ~= nil then
							local v1666 = recorder.sequence_list:get()

							if v1666 > t23.recorder.sequence_end then
								t23.recorder.sequence_end = #t23.recorder.data
							end

							t23.recorder.sequence_start = v1666
							v296()

							return
						end
					end)
					recorder.set_end_button:set_callback(function()
						-- upvalues: t23 (ref), recorder (copy), v296 (copy)
						if t23.recorder.capture ~= nil then
							local v1667 = recorder.sequence_list:get()

							if v1667 < t23.recorder.sequence_start then
								t23.recorder.sequence_start = 1
							end

							t23.recorder.sequence_end = v1667
							v296()

							return
						end
					end)
					recorder.save_button:set_callback(function()
						-- upvalues: v292 (copy), v293 (copy), t23 (ref), v294 (copy), v296 (copy), v297 (copy), v298 (copy)
						local v1668 = v292()

						if v1668 ~= nil then
							local v1669 = v293(v1668)

							if v1669 ~= nil then
								local data = t23.recorder.data

								if data ~= nil then
									local t119 = {}

									for i = t23.recorder.sequence_start, t23.recorder.sequence_end do
										table.insert(t119, data[i])
									end

									v294(v1669, t119)
									t23.recorder.data = nil
									t23.recorder.capture = nil
									t23.recorder.sequence_start = nil
									t23.recorder.sequence_end = nil
									v296()
									v297(false)
									v298()

									return
								end

								return
							end

							return
						end
					end)
					recorder.import_button:set_callback(function()
						-- upvalues: v292 (copy), v293 (copy), clipboard (copy), v289 (copy), v288 (copy), t23 (ref), v297 (copy), v296 (copy)
						local v1673 = v292()

						if v1673 ~= nil then
							if v293(v1673) ~= nil then
								local v1674 = clipboard.get()

								if v1674 ~= nil then
									local v1675, v1676 = v289(v1674)

									if v1675 and v1676 ~= nil then
										local v1677, v1678 = v288(v1676)

										if v1677 and v1678 ~= nil then
											local v1679 = #v1678

											t23.recorder.data = v1678
											t23.recorder.capture = v1673
											t23.recorder.sequence_start = 1
											t23.recorder.sequence_end = v1679
											v297(true)
											v296()

											return
										end

										return
									end

									return
								end

								return nil
							end

							return
						end
					end)
					events.update_records(function()
						-- upvalues: v298 (copy)
						v298()
					end)
					v297(false)
					v298()
				end

				t120 = {}

				local builder = t29.antiaim.builder
				local u301 = nil

				local function v302(p380)
					local t121 = {}

					if p380.x > 0 then
						table.insert(t121, "Forward")
					end

					if p380.x < 0 then
						table.insert(t121, "Backward")
					end

					if p380.y > 0 then
						table.insert(t121, "Right")
					end

					if p380.y < 0 then
						table.insert(t121, "Left")
					end

					return table.concat(t121, "-")
				end
				local function v303(p381)
					-- upvalues: v302 (copy), t92 (ref), t110 (copy)
					local angles = p381.angles
					local v1684 = angles.yaw_offset:get()
					local v1685 = nil
					local v1686 = nil
					local v1687 = angles.random:get()
					local v1688 = angles.add_yaw:get()

					if v1688 then
						v1685 = angles.yaw_left:get()
						v1686 = angles.yaw_right:get()
					end

					if angles.direction ~= nil then
						local v1689 = angles[v302(vector(t92.forwardmove, t92.sidemove))]

						if v1689 ~= nil and v1689.enabled:get() then
							v1684 = v1689.yaw_offset:get()

							if v1688 then
								v1685 = v1689.yaw_left:get()
								v1686 = v1689.yaw_right:get()
							end
						end
					end

					if v1687 > 0 and v1685 ~= nil and v1686 ~= nil then
						local v1690 = v1687 * 0.01
						local v1691 = utils.random_float(-v1690 * 0.6, v1690 * 0.6)

						v1685 = v1685 + v1685 * v1691
						v1686 = v1686 + v1686 * v1691
					end

					t110.yaw = "Backward"
					t110.yaw_offset = v1684
					t110.yaw_left = v1685
					t110.yaw_right = v1686
				end
				local function v304(p382)
					-- upvalues: t110 (copy)
					local angles = p382.angles
					local v1694 = angles.yaw_jitter:get()
					local v1695 = angles.jitter_offset:get()

					if v1694 ~= "Off" then
						local v1696 = angles.random:get()

						if v1696 > 0 then
							local v1697 = v1696 * 0.01

							v1695 = v1695 + v1695 * utils.random_float(-v1697 * 0.6, v1697 * 0.6)
						end

						t110.yaw_modifier = v1694
						t110.modifier_offset = v1695

						if angles.way_values ~= nil then
							t110.way = {}

							for i = 1, angles.way_count:get() do
								t110.way[i] = angles.way_values[i]:get()
							end
						end

						return
					end

					t110.yaw_modifier = "Disabled"
					t110.modifier_offset = nil
				end
				local function v305(p383)
					-- upvalues: t110 (copy)
					local angles = p383.angles
					local v1701 = angles.body_yaw:get()
					local v1702 = angles.left_limit:get()
					local v1703 = angles.right_limit:get()
					local v1704 = v1701 ~= "Off"

					if v1704 then
						t110.options = {}
						t110.left_limit = v1702
						t110.right_limit = v1703

						if v1701 == "Left" then
							t110.inverter = true
							t110.right_limit = v1702
						end

						if v1701 == "Right" then
							t110.inverter = false
							t110.left_limit = v1703
						end

						if v1701 == "Jitter" then
							table.insert(t110.options, "Jitter")
							t110.invert_chance = angles.invert_chance:get()
						end

						if v1701 == "Random" then
							table.insert(t110.options, "Jitter")
							table.insert(t110.options, "Randomize Jitter")
						end

						if angles.avoid_overlap:get() then
							table.insert(t110.options, "Avoid Overlap")
						end

						t110.freestanding_body_yaw = angles.freestanding_body_yaw:get()
					end

					if angles.delay:get() then
						local v1705 = angles.delay_mode:get()
						local v1706 = angles.delay_affect_modifier:get()

						if v1705 == "Default" then
							local v1707 = angles.delay_value:get()
							local v1708 = angles.delay_random:get()

							if v1708 > 0 then
								v1707 = utils.random_int(v1707, v1708)
							end

							t110.delay = v1707
							t110.delay_affects_modifier = v1706
						end

						if v1705 == "Custom" then
							local v1709 = angles.delay_count:get()
							local v1710 = math.random(1, v1709)

							if angles.delay_values[v1710] ~= nil then
								t110.delay = angles.delay_values[v1710]:get()
								t110.delay_affects_modifier = v1706
							end
						end
					end

					t110.body_yaw = v1704
				end

				function t120.get(_, p385)
					-- upvalues: builder (copy)
					return builder[p385]
				end

				function t120.is_active_ex(_, p387)
					return p387.enabled == nil or p387.enabled:get()
				end

				function t120.is_active(p388, p389)
					-- upvalues: t120 (copy)
					local v1717 = p388:get(p389)

					if v1717 ~= nil then
						return t120:is_active_ex(v1717)
					end

					return false
				end

				function t120.get_old_items(_)
					-- upvalues: u301 (ref)
					return u301
				end

				function t120.apply_ex(_, p392)
					-- upvalues: t110 (copy), v303 (copy), v304 (copy), v305 (copy), u301 (ref)
					if p392 ~= nil then
						if p392.angles ~= nil then
							t110.enabled = true
							t110.pitch = "Down"
							t110.yaw_base = "At Target"
							v303(p392)
							v304(p392)
							v305(p392)
						end

						u301 = p392

						return true
					end

					return false
				end

				function t120.apply(p393, p394)
					-- upvalues: t116 (copy)
					local v1723 = p393:get(p394)

					if v1723 ~= nil then
						if p393:is_active_ex(v1723) then
							local v1724 = v1723.mode:get()

							if v1724 == "Builder" then
								p393:apply_ex(v1723)
							end

							if v1724 == "Recorder" then
								t116:update(p394)
							end

							return v1723
						end

						return nil
					end

					return nil
				end

				function t120.update(p395, _)
					-- upvalues: t94 (ref)
					if rage.exploit:get() ~= 1 then
						local v1727 = p395:apply("Fakelag")

						if v1727 ~= nil then
							return v1727
						end
					end

					local v1728 = p395:apply((t94.get()))

					if v1728 == nil then
						return p395:apply("Shared")
					end

					return v1728
				end

				t108.builder = t120
				t122 = {}

				local disablers = t29.antiaim.settings.disablers

				local function v308()
					local v1729 = entity.get_game_rules()

					if v1729 ~= nil then
						return v1729.m_bWarmupPeriod
					end

					return false
				end
				local function v309()
					local v1730 = entity.get_local_player()

					if v1730 ~= nil then
						local m_iTeamNum = v1730.m_iTeamNum
						local v1732 = entity.get_player_resource()

						for i = 1, globals.max_players do
							if v1732.m_bConnected[i] then
								local v1734 = v1732.m_iTeam[i]

								if v1730 ~= i and v1734 ~= m_iTeamNum and v1732.m_bAlive[i] then
									return false
								end
							end
						end

						return true
					end

					return false
				end
				local function v310()
					-- upvalues: disablers (copy), v308 (copy), v309 (copy)
					if not disablers.select:get("On Warmup") or not v308() then
						if not disablers.select:get("Enemies Dead") or not v309() then
							return false
						end

						return true
					end

					return true
				end

				function t122.update(_, _)
					-- upvalues: v310 (copy), t120 (copy), t110 (copy)
					if v310() then
						if t120:apply("Warmup AA") == nil then
							local v1737 = globals.curtime * 5

							t110.pitch = "Disabled"
							t110.yaw = "Backward"
							t110.yaw_offset = 360 * (v1737 % 1)
							t110.yaw_modifier = "Disabled"
							t110.modifier_offset = 0
							t110.body_yaw = false
						end

						return true
					end

					return false
				end

				t123 = {}

				local auto_hide_shots = t29.antiaim.settings.auto_hide_shots
				local n19 = 1
				local n20 = 5

				local function v315()
					-- upvalues: t92 (ref), t3 (ref)
					if t92.is_onground then
						if not t92.is_crouched then
							if not t92.is_moving then
								return "Standing"
							end

							if not t3.antiaim.misc.slow_walk:get() then
								return "Running"
							end

							return "Slow motion"
						end

						if not t92.is_moving then
							return "Crouching"
						end

						return "Move & Crouching"
					end

					if not t92.is_crouched then
						return "Air"
					end

					return "Air & Crouching"
				end
				local function v316(p399)
					-- upvalues: n19 (copy), n20 (copy)
					local v1739 = p399:get_weapon_info()

					if v1739 ~= nil then
						local weapon_type = v1739.weapon_type
						local v1741 = p399:get_weapon_index()

						if weapon_type ~= n19 then
							if weapon_type ~= n20 then
								return nil
							end

							if v1741 ~= 40 then
								if v1741 ~= 9 then
									return "Auto"
								end

								return "Awp"
							end

							return "Scout"
						end

						if v1741 ~= 1 then
							if v1741 ~= 64 then
								return "Pistol"
							end

							return "Revolver"
						end

						return "Deagle"
					end

					return nil
				end
				local function v317()
					-- upvalues: t3 (ref)
					t3.ragebot.main.double_tap[1]:override()
					t3.ragebot.main.hide_shots[1]:override()
				end
				local function v318()
					-- upvalues: t3 (ref)
					t3.ragebot.main.double_tap[1]:override(false)
					t3.ragebot.main.hide_shots[1]:override(true)
				end
				local function v319()
					-- upvalues: t3 (ref), v316 (copy), auto_hide_shots (copy), v315 (copy)
					if not t3.antiaim.misc.fake_duck:get() then
						if not t3.antiaim.misc.fake_duck:get() then
							if t3.ragebot.main.double_tap[1]:get() then
								local v1742 = entity.get_local_player()

								if v1742 ~= nil then
									local v1743 = v1742:get_player_weapon()

									if v1743 ~= nil then
										local v1744 = v316(v1743)

										if v1744 ~= nil and auto_hide_shots.weapons:get(v1744) then
											local v1745 = v315()

											if auto_hide_shots.states:get(v1745) then
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

						return false
					end

					return false
				end

				function t123.update(_, _)
					-- upvalues: auto_hide_shots (copy), v319 (copy), v318 (copy)
					if auto_hide_shots.enabled:get() then
						if v319() then
							v318()

							return
						end

						return
					end
				end

				events.shutdown(function()
					-- upvalues: v317 (copy)
					v317()
				end)
				t124 = {}

				local antibrute = t29.antiaim.settings.antibrute
				local u322 = nil
				local u323 = nil
				local u324 = nil
				local u325 = nil
				local v326 = t95.get_event_bus()

				local function v327()
					-- upvalues: antibrute (copy)
					if not antibrute.refresh_offset:get() then
						return nil
					end

					return math.random(-7, 13)
				end
				local function v328()
					-- upvalues: antibrute (copy)
					local v1748 = antibrute.refresh_modifier:get()

					if v1748 ~= "increase" then
						if v1748 ~= "decrease" then
							if v1748 ~= "adaptive" then
								return nil
							end

							return math.random(-3, 5)
						end

						return math.random(-5, 0)
					end

					return math.random(0, 5)
				end
				local function v329()
					-- upvalues: u322 (ref), u323 (ref), u324 (ref), u325 (ref)
					u322 = nil
					u323 = nil
					u324 = nil
					u325 = nil
				end

				function t124.update(_, _)
					-- upvalues: antibrute (copy), u322 (ref), v329 (copy), u323 (ref), t110 (copy), u324 (ref), u325 (ref)
					if antibrute.enabled:get() then
						if u322 == nil or not (globals.curtime > u322) then
							if u323 ~= nil then
								t110.delay = u323
							end

							if u324 ~= nil and t110.yaw_offset ~= nil then
								t110.yaw_offset = t110.yaw_offset + u324
							end

							if u325 ~= nil and t110.modifier_offset ~= nil then
								t110.modifier_offset = t110.modifier_offset + u325
							end

							return true
						end

						v329()

						return false
					end

					return false
				end

				local function v330()
					-- upvalues: antibrute (copy), u322 (ref), u323 (ref), u324 (ref), v327 (copy), u325 (ref), v328 (copy)
					local v1751 = antibrute.duration:get()

					if v1751 ~= 0 then
						u322 = globals.curtime + v1751 * 0.1
					end

					if antibrute.enforce_delay:get() then
						u323 = math.random(1, 5)
					end

					u324 = v327()
					u325 = v328()
				end
				local function v331(p404)
					-- upvalues: v329 (copy), v326 (copy), v330 (copy)
					local v1753 = p404:get()

					if not v1753 then
						v329()
					end

					v326.enemy_shot:set(v330, v1753)
				end

				t29.antiaim.enabled:set_callback(function(p405)
					-- upvalues: v329 (copy), v326 (copy), v330 (copy), antibrute (copy), v331 (copy)
					local v1755 = p405:get()

					if not v1755 then
						v329()
						v326.enemy_shot:set(v330, false)
					end

					if not v1755 then
						antibrute.enabled:unset_callback(v331)
					else
						antibrute.enabled:set_callback(v331, true)
					end
				end, true)
				t125 = {}

				local roll = t29.antiaim.settings.roll

				local function v334()
					-- upvalues: roll (copy)
					if not roll.change_on_fakelag:get() or rage.exploit:get() == 1 then
						return roll.value:get()
					end

					return roll.fakelag_value:get()
				end

				function t125.update(_, p407)
					-- upvalues: v334 (copy)
					local v1758 = v334()

					if v1758 ~= nil and v1758 ~= 0 then
						p407.view_angles.z = v1758

						return
					end
				end

				t126 = {}

				local u336 = false

				local function v337(p408, p409)
					-- upvalues: u31 (ref), u336 (ref)
					local v1761 = entity.get_local_player()

					if v1761 ~= nil then
						local v1762 = v1761:get_player_weapon()

						if v1762 ~= nil then
							local m_iTeamNum = v1761.m_iTeamNum
							local v1764 = v1761:get_origin()
							local v1765 = v1762:get_weapon_index() == 49

							if not v1761.m_bIsDefusing and not v1761.m_bIsGrabbingHostage then
								if not v1761.m_bInBombZone or p409.bomb_e_fix:get() and not v1765 then
									if m_iTeamNum == 3 and p408.view_angles.x > 15 then
										local v1766 = entity.get_entities("CPlantedC4")

										for i = 1, #v1766 do
											if (v1766[i]:get_origin() - v1764):lengthsqr() < 3844 then
												return false
											end
										end
									end

									local v1768 = u31.camera_angles()
									local v1769 = vector():angles(v1768)
									local v1770 = v1761:get_eye_position()
									local v1771 = v1770 + v1769 * 128
									local v1772 = utils.trace_line(v1770, v1771, v1761, 4294967295, 0)

									if v1772.fraction ~= 1 then
										local entity2 = v1772.entity

										if entity2 == nil then
											return true
										end

										local v1774 = entity2:get_classname()

										if v1774 == "CWorld" then
											return true
										end

										if v1774 == "CFuncBrush" then
											return true
										end

										if v1774 == "CCSPlayer" then
											return true
										end

										if v1774 == "CHostage" and v1770:distsqr((entity2:get_origin())) < 7056 then
											return false
										end

										if not u336 then
											u336 = true

											return false
										end
									end

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

				function t126.update(_, p411)
					-- upvalues: u336 (ref), t120 (copy), v337 (copy), t112 (copy), t114 (copy), t110 (copy)
					if p411.in_use then
						local v1777 = t120:get("On use")

						if v1777 ~= nil then
							if t120:is_active_ex(v1777) then
								if v337(p411, v1777) then
									p411.in_use = false
									t120:apply_ex(v1777)

									if v1777 ~= nil and v1777.defensive ~= nil then
										t112:apply(p411, v1777.defensive)
										t114:update(p411, v1777.defensive)
									end

									if t110.yaw_offset ~= nil then
										t110.yaw_offset = t110.yaw_offset + 180
									end

									t110.pitch = "Disabled"
									t110.yaw_base = "Local View"
									t110.freestanding = false

									return true
								end

								return false
							end

							return false
						end

						return false
					end

					u336 = false

					return false
				end

				t127 = {}

				local manual_yaw = t29.antiaim.settings.manual_yaw
				local t128 = {
					Forward = 180,
					Right = 90,
					Left = -90,
					Backward = 0
				}

				local function v341()
					-- upvalues: t128 (copy), manual_yaw (copy)
					return t128[manual_yaw.select:get()]
				end

				function t127.update(_, p413)
					-- upvalues: v341 (copy), t110 (copy), manual_yaw (copy), t120 (copy), t114 (copy), t112 (copy)
					local v1780 = v341()

					if v1780 ~= nil then
						local v1781 = t110.yaw_offset or 0

						t110.enabled = true
						t110.yaw_offset = v1781 + v1780
						t110.freestanding = false

						if manual_yaw.disable_yaw_modifiers:get() then
							t110.yaw_offset = v1781 + v1780
							t110.yaw_left = 0
							t110.yaw_right = 0
							t110.yaw_modifier = "Disabled"
							t110.modifier_offset = 0
						end

						if manual_yaw.body_freestanding:get() then
							t110.body_yaw = true
							t110.left_limit = 60
							t110.right_limit = 60
							t110.options = {}
							t110.freestanding_body_yaw = "Peek Fake"
						end

						local v1782 = t120:apply("Manual Yaw")

						if v1782 ~= nil then
							t110.yaw_offset = t110.yaw_offset + v1780

							if v1782.defensive ~= nil and (t114:update(p413, v1782.defensive) or t112:apply(p413, v1782.defensive)) then
								local yaw_offset = t110.defensive.yaw_offset

								if yaw_offset ~= nil then
									t110.defensive.yaw_offset = yaw_offset + v1780
								end
							end
						end

						t110.yaw_base = "Local View"

						return true
					end

					return false
				end

				t129 = {}

				local freestanding = t29.antiaim.settings.freestanding

				local function v344()
					-- upvalues: t92 (ref), t3 (ref)
					if t92.is_onground then
						if not t92.is_crouched then
							if not t92.is_moving then
								return "Standing"
							end

							if not t3.antiaim.misc.slow_walk:get() then
								return "Running"
							end

							return "Slow motion"
						end

						return "Crouching"
					end

					return "Air"
				end
				local function v345()
					-- upvalues: freestanding (copy), v344 (copy)
					return freestanding.disablers:get(v344())
				end
				local function v346()
					-- upvalues: freestanding (copy), v345 (copy)
					return freestanding.enabled:get() and not v345()
				end
				local function v347()
					local v1784 = rage.antiaim:get_target(false)
					local v1785 = rage.antiaim:get_target(true)

					if v1784 ~= nil and v1785 ~= nil then
						return v1785 - v1784
					end

					return nil
				end
				local function v348(p414)
					-- upvalues: v347 (copy), t120 (copy), t110 (copy), freestanding (copy), t114 (copy), t112 (copy)
					local v1787 = v347()

					if v1787 ~= nil then
						local v1788 = t120:apply("Freestanding")

						if v1788 ~= nil then
							t110.yaw_offset = (t110.yaw_offset or 0) + v1787

							if v1788.defensive ~= nil and (t114:update(p414, v1788.defensive) or t112:apply(p414, v1788.defensive)) then
								local yaw_offset = t110.defensive.yaw_offset

								if yaw_offset ~= nil then
									t110.defensive.yaw_offset = yaw_offset + v1787
								end
							end

							t110.freestanding = false

							return
						end

						t110.freestanding = true
						t110.freestanding_disable_yaw_modifiers = freestanding.disable_yaw_modifiers:get()
						t110.freestanding_body_freestanding = freestanding.body_freestanding:get()

						return
					end
				end

				function t129.update(_, p416)
					-- upvalues: v346 (copy), t110 (copy), v348 (copy)
					if v346() then
						v348(p416)

						return true
					end

					t110.freestanding = false

					return false
				end

				t130 = {}

				local edge_yaw = t29.antiaim.settings.edge_yaw

				local function v351(p417)
					local v1793 = entity.get_local_player()

					if v1793 ~= nil then
						local v1794 = v1793:get_eye_position()

						if v1794 ~= nil then
							local n21 = 1
							local v1796 = nil
							local t131 = {}

							for i = -180, 179, 45 do
								local v1799 = v1794 + vector():angles(vector(0, i, 0)) * 24
								local v1800 = utils.trace_line(v1794, v1799, v1793)

								if n21 > v1800.fraction and (v1800.entity == nil or not v1800.entity:is_player()) then
									v1796 = i
									n21 = v1800.fraction
								end
							end

							if v1796 ~= nil then
								for i = v1796 - 30, v1796 + 30, 10 do
									local v1802 = v1794 + vector():angles(vector(0, i, 0)) * 24
									local v1803 = utils.trace_line(v1794, v1802, v1793, nil, 1)

									if v1803.fraction < 1 then
										t131[#t131 + 1] = i

										if n21 > v1803.fraction then
											v1796 = i
											n21 = v1803.fraction
										end
									end
								end

								return math.normalize_yaw(v1796 * 2 - p417.move_yaw)
							end

							return nil
						end

						return nil
					end

					return nil
				end

				function t130.update(_, p419)
					-- upvalues: edge_yaw (copy), v351 (copy), t110 (copy)
					if edge_yaw.enabled:get() then
						local v1806 = v351(p419)

						if v1806 ~= nil then
							t110.yaw_offset = (t110.yaw_offset or 0) + v1806

							return true
						end

						return false
					end

					return false
				end

				t132 = {}

				local safe_head = t29.antiaim.settings.safe_head

				n22 = 0

				local function v355(p420)
					local v1808 = p420:get_weapon_info()

					if v1808 ~= nil then
						return v1808.weapon_type == 0 and p420:get_weapon_index() ~= 31
					end

					return false
				end
				local function v356(p421, p422)
					-- upvalues: t92 (ref), v355 (copy)
					local v1811 = p421:get_player_weapon()

					if v1811 ~= nil then
						local v1812 = p421:get_origin()
						local v1813 = p422:get_origin() - v1812
						local v1814 = -v1813.z
						local v1815 = v1813:length2dsqr()

						if not t92.is_onground then
							if not t92.is_crouched or not v355(v1811) then
								return nil
							end

							return "Air Crouch Knife"
						end

						if t92.is_moving and not t92.is_crouched or not (v1814 >= 10) or not (v1815 > 1000000) then
							if not t92.is_crouched then
								if not t92.is_moving and v1814 >= 24 then
									return "Standing"
								end
							elseif v1814 >= 48 then
								return "Crouch"
							end

							return nil
						end

						return "Distance"
					end

					return nil
				end
				local function v357(p423)
					-- upvalues: csgo_weapons (copy)
					local v1817 = p423:get_player_weapon()

					if v1817 ~= nil then
						local v1818 = csgo_weapons(v1817)

						if v1818 ~= nil then
							local v1819 = v1818.max_speed or 250

							if p423.m_bIsScoped then
								v1819 = v1818.max_speed_alt or 250
							end

							if p423.m_flDuckAmount > 0.5 then
								v1819 = v1819 * 0.34
							end

							return v1819
						end

						return nil
					end

					return nil
				end
				local function v358(p424, p425)
					local v1822 = p424:get_origin()
					local v1823 = p425:get_eye_position()
					local v1824 = not (p424.m_flDuckAmount <= 0.5)

					v1822.z = v1822.z + (v1824 and 45 or 60)

					return math.ceil(v1822.z - v1823.z)
				end
				local function v359(p426)
					-- upvalues: t3 (ref)
					if not t3.antiaim.angles.freestanding[1]:get_override() and not t3.antiaim.angles.freestanding[1]:get() then
						if p426 == nil or not entity.is_dormant(p426) then
							return false
						end

						return true
					end

					return true
				end
				local function v360(p427)
					return p427.m_vecVelocity:length2d()
				end
				local function v361(p428)
					return bit.band(p428.m_fFlags, 1) ~= 0
				end
				local function v362(p429, p430)
					-- upvalues: t2 (ref)
					local m_iHealth = p430.m_iHealth

					if m_iHealth ~= nil and not (m_iHealth <= 0) then
						local v1831 = p429:get_eye_position()
						local m_vecVelocity = p429.m_vecVelocity
						local v1833 = p430:get_hitbox_position(3)
						local v1834, v1835 = utils.trace_bullet(p429, v1831, v1833)

						if v1835 ~= nil then
							if p430 ~= v1835.entity then
								v1834 = 0
							end

							if v1834 == nil or not (m_iHealth <= v1834) then
								local v1836 = t2.extrapolate(v1831, m_vecVelocity, 16)
								local v1837, v1838 = utils.trace_bullet(p429, v1836, v1833)

								if p430 ~= v1838.entity then
									v1837 = 0
								end

								if v1837 == nil or not (m_iHealth <= v1837) then
									return false
								end

								return true
							end

							return true
						end

						return
					end

					return false
				end
				local function v363(p431, p432)
					-- upvalues: t2 (ref)
					local m_iHealth = p432.m_iHealth

					if m_iHealth ~= nil and not (m_iHealth <= 0) then
						local v1842 = p431:get_eye_position()
						local m_vecVelocity = p431.m_vecVelocity
						local v1844 = p432:get_hitbox_position(0)
						local v1845, v1846 = utils.trace_bullet(p431, v1842, v1844)

						if v1846 ~= nil then
							if p432 ~= v1846.entity then
								v1845 = 0
							end

							if v1845 == nil or not (m_iHealth <= v1845) then
								local v1847 = t2.extrapolate(v1842, m_vecVelocity, 32)
								local v1848, v1849 = utils.trace_bullet(p431, v1847, v1844)

								if p432 ~= v1849.entity then
									v1848 = 0
								end

								if v1848 == nil or not (m_iHealth <= v1848) then
									return false
								end

								return true
							end

							return true
						end

						return
					end

					return false
				end
				local function v364(p433, p434)
					-- upvalues: v355 (copy), t92 (ref), v358 (copy), v360 (copy), v361 (copy), v362 (copy), v363 (copy), n22 (ref)
					local v1852 = p433.m_iTeamNum == 3
					local v1853 = p433:get_player_weapon()
					local v1854 = v355(v1853)
					local v1855 = t92.is_onground and (not t92.is_moving and not t92.is_crouched)
					local v1856 = v358(p433, p434)

					if not v1854 or (t92.is_onground or not t92.is_crouched) then
						local v1857 = v1855 and not (v1856 < (v1852 and -6 or 20)) or
							t92.is_crouched and (t92.is_onground and not (v1856 < (v1852 and -20 or -4)))
						local v1858 = v360(p434)
						local v1859 = not v361(p434) and not (v1858 <= 75) or not v362(p434, p433)

						if not v1857 or not v1859 then
							return false
						end

						local tickcount = globals.tickcount
						local v1861 = v363(p434, p433)

						if v1861 ~= false then
							if v1861 ~= true then
								return not (tickcount > n22)
							end

							n22 = 0

							return false
						end

						n22 = tickcount + 16

						return true
					end

					return not (v1856 <= (v1852 and -35 or -20))
				end
				local function v365(p435, p436)
					-- upvalues: v357 (copy), t92 (ref)
					local v1864 = p435.m_vecVelocity:length()
					local v1865 = v357(p435) or 250
					local v1866 = p436.in_back and not (p436.forwardmove >= 0)
					local v1867 = p436.in_forward and not (p436.forwardmove <= 0)
					local v1868 = p436.in_moveleft and not (p436.sidemove >= 0)
					local v1869 = p436.in_moveright and not (p436.sidemove <= 0)
					local v1870 = v1864 > 1.1001 and not (v1864 >= v1865 - v1865 * 0.1)

					if not t92.is_onground or (t92.is_moving or t92.is_crouched) then
						if t92.is_onground then
							if not v1867 then
								if not v1866 then
									return v1869 and 38 or (v1868 and 20 or 32)
								end

								return v1869 and 30 or (v1868 and 20 or 30)
							end

							if not v1870 then
								return v1869 and 38 or (v1868 and 14 or 26)
							end

							return v1869 and 33 or (v1868 and 20 or 20)
						end

						return 32
					end

					return 35
				end

				function t132.update(_, p438)
					-- upvalues: safe_head (copy), v356 (copy), v359 (copy), n22 (ref), v364 (copy), t110 (copy), v365 (copy)
					if safe_head.enabled:get() then
						local v1873 = entity.get_local_player()
						local v1874 = entity.get_threat()

						if v1873 ~= nil and v1874 ~= nil then
							local v1875 = v356(v1873, v1874)

							if v1875 ~= nil and safe_head.states:get(v1875) then
								if not v359() then
									if v364(v1873, v1874) then
										t110.pitch = "Down"
										t110.yaw_base = "At Target"
										t110.yaw = "Backward"
										t110.yaw_offset = -v365(v1873, p438) + 45
										t110.yaw_left = 0
										t110.yaw_right = 0
										t110.yaw_modifier = "Off"
										t110.modifier_offset = 0
										t110.body_yaw = true
										t110.left_limit = 0
										t110.right_limit = 0
										t110.options = {}
										t110.freestanding_body_yaw = "Off"
										t110.defensive = nil

										return true
									end

									return
								end

								n22 = 0

								return false
							end

							return false
						end

						return false
					end

					return false
				end
			end

			local function v366()
				-- upvalues: t110 (copy), n14 (ref), v6 (copy), n11 (ref), u256 (ref)
				if rage.exploit:get() == 1 then
					local v1876 = math.max(1, t110.delay or 1)

					n14 = n14 + 1

					if v1876 > n14 then
						return
					end
				end

				local v1877 = true

				if t110.options ~= nil and v6(t110.options, "Randomize Jitter") ~= nil then
					v1877 = utils.random_int(0, 1) == 0
				end

				if t110.invert_chance ~= nil and t110.invert_chance < utils.random_int(0, 100) then
					v1877 = false
				end

				n11 = n11 + 1

				if v1877 then
					u256 = not u256
				end

				n14 = 0
			end
			local function v367()
				-- upvalues: t110 (copy), n15 (ref), n13 (ref), u260 (ref)
				local defensive = t110.defensive
				local n23 = 1

				if defensive ~= nil and defensive.delay ~= nil then
					n23 = math.max(1, defensive.delay)
				end

				n15 = n15 + 1

				if not (n23 > n15) then
					n13 = n13 + 1
					u260 = not u260
					n15 = 0

					return
				end
			end
			local function v368()
				-- upvalues: t110 (copy), u260 (ref), n13 (ref), t109 (copy)
				local defensive = t110.defensive

				if defensive ~= nil then
					if defensive.pitch_offset ~= nil then
						rage.antiaim:override_hidden_pitch(defensive.pitch_offset)
					end

					if defensive.yaw_offset ~= nil then
						local yaw_offset = defensive.yaw_offset

						if t110.yaw_offset ~= nil then
							yaw_offset = yaw_offset - t110.yaw_offset
						end

						if defensive.yaw_left ~= nil and u260 == true then
							yaw_offset = yaw_offset + defensive.yaw_left
						end

						if defensive.yaw_right ~= nil and u260 == false then
							yaw_offset = yaw_offset + defensive.yaw_right
						end

						if defensive.yaw_modifier == "Offset" then
							local modifier_offset = defensive.modifier_offset

							if not u260 then
								modifier_offset = 0
							end

							yaw_offset = yaw_offset + modifier_offset
						end

						if defensive.yaw_modifier == "Center" then
							local v1883 = defensive.modifier_offset * 0.5

							if not u260 then
								v1883 = -v1883
							end

							yaw_offset = yaw_offset + v1883
						end

						if defensive.yaw_modifier == "Skitter" then
							yaw_offset = yaw_offset + defensive.modifier_offset * t109[n13 % #t109 + 1]
						end

						rage.antiaim:override_hidden_yaw_offset(-yaw_offset)
					end

					return
				end
			end
			local function v369()
				-- upvalues: t110 (copy)
				if t110.yaw_left == nil or t110.yaw_right == nil then
					return
				end

				local v1884 = t110.yaw_offset or 0

				if t110.inverter == true then
					t110.yaw_offset = v1884 + t110.yaw_left
				end

				if t110.inverter == false then
					t110.yaw_offset = v1884 + t110.yaw_right
				end
			end
			local function v370()
				-- upvalues: u256 (ref), t110 (copy), t92 (ref), n12 (ref), u257 (ref), n11 (ref), t109 (copy), t2 (ref)
				local v1885 = u256

				if t110.delay_affects_modifier == false then
					v1885 = bit.band(t92.sent_packets, 1) ~= 0
				end

				if t110.yaw_modifier == "Angelic" then
					local t133 = {
						[1] = "Offset",
						[2] = "Random",
						[3] = "Skitter",
						[4] = "Center"
					}
					local modifier_offset = t110.modifier_offset

					if globals.realtime - n12 > 0.15 then
						n12 = globals.realtime
						u257 = t133[math.random(1, #t133)]
					end

					local v1888 = globals.tickcount * 0.2
					local v1889 = u257
					local v1890 = math.floor(math.sin(v1888) * modifier_offset)

					t110.yaw_modifier = v1889
					t110.modifier_offset = v1890
				end

				if t110.yaw_modifier ~= "Offset" then
					if t110.yaw_modifier ~= "Center" then
						if t110.yaw_modifier ~= "Skitter" then
							if t110.yaw_modifier ~= "Custom Ways" then
								if t110.yaw_modifier ~= "Spin" then
									if t110.yaw_modifier ~= "Random" then
										return
									end

									local v1891 = t110.yaw_offset or 0
									local modifier_offset = t110.modifier_offset

									t110.yaw_modifier = "Off"
									t110.modifier_offset = 0
									t110.yaw_offset = v1891 + utils.random_int(-modifier_offset, modifier_offset)

									return
								end

								local v1893 = globals.curtime * 3
								local v1894 = t110.yaw_offset or 0
								local modifier_offset = t110.modifier_offset

								t110.yaw_modifier = "Off"
								t110.modifier_offset = 0
								t110.yaw_offset = v1894 + t2.lerp(-modifier_offset, modifier_offset, v1893 % 1)

								return
							end

							local v1896 = t110.yaw_offset or 0
							local n24 = 0

							if t110.way ~= nil then
								local v1898 = #t110.way
								local v1899 = n11 % v1898 + 1
								local v1900 = t110.way[v1899]

								if v1900 ~= nil then
									n24 = v1900
								end
							end

							t110.yaw_modifier = "Off"
							t110.modifier_offset = 0
							t110.yaw_offset = v1896 + n24

							return
						end

						local v1901 = t109[n11 % #t109 + 1]
						local v1902 = t110.yaw_offset or 0
						local modifier_offset = t110.modifier_offset

						t110.yaw_modifier = "Off"
						t110.modifier_offset = 0
						t110.yaw_offset = v1902 + modifier_offset * v1901

						return
					end

					local v1904 = t110.yaw_offset or 0
					local modifier_offset = t110.modifier_offset

					if not v1885 then
						modifier_offset = -modifier_offset
					end

					t110.yaw_modifier = "Off"
					t110.modifier_offset = 0
					t110.yaw_offset = v1904 + modifier_offset / 2

					return
				end

				local v1906 = t110.yaw_offset or 0
				local modifier_offset = t110.modifier_offset

				t110.yaw_modifier = "Off"
				t110.modifier_offset = 0
				t110.yaw_offset = v1906 + (v1885 and modifier_offset or 0)
			end
			local function v371()
				-- upvalues: t110 (copy), u256 (ref)
				if t110.options ~= nil then
					local v1908 = false
					local t134 = {}

					for i = 1, #t110.options do
						local v1911 = t110.options[i]

						if v1911 ~= "Jitter" then
							if v1911 ~= "Randomize Jitter" then
								table.insert(t134, v1911)
							end
						else
							v1908 = true
						end
					end

					if v1908 then
						t110.inverter = u256
					end

					t110.options = t134

					return
				end
			end
			local function v372(p439)
				-- upvalues: t123 (copy), t122 (copy), t112 (copy), t120 (copy), t124 (copy), t126 (copy), t125 (copy), t127 (copy), t129 (copy), t132 (copy), t130 (copy), t114 (copy)
				t123:update(p439)

				if not t122:update(p439) then
					t112:update(p439)

					local v1913 = t120:update()

					t124:update(p439)

					if not t126:update(p439) then
						t125:update(p439)

						if not t127:update(p439) then
							if not t129:update(p439) then
								if not t132:update(p439) then
									if not t130:update(p439) then
										if v1913 ~= nil and v1913.defensive ~= nil then
											t112:apply(p439, v1913.defensive)
											t114:update(p439, v1913.defensive)
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
			local function v373(p440)
				-- upvalues: v366 (copy), v367 (copy), v371 (copy), v370 (copy), v369 (copy), v368 (copy)
				rage.antiaim:override_hidden_yaw_offset(0)

				if p440.choked_commands == 0 then
					v366()
					v367()
				end

				v371()
				v370()
				v369()
				v368()
			end
			local function v374()
				-- upvalues: t3 (ref), t110 (copy)
				t3.ragebot.main.hide_shots[1]:override()
				t3.ragebot.main.double_tap[1]:override()
				t110:unset()
			end
			local function v375(p441)
				-- upvalues: t3 (ref), t110 (copy), v372 (copy), v373 (copy)
				t3.ragebot.main.hide_shots[1]:override()
				t3.ragebot.main.double_tap[1]:override()
				t110:clear()
				t110:unset()
				v372(p441)
				v373(p441)
				t110:set()
			end

			t29.antiaim.enabled:set_callback(function(p442)
				-- upvalues: t110 (copy), t3 (ref), v374 (copy), v375 (copy)
				local v1917 = p442:get()

				if not v1917 then
					t110:unset()
					t3.ragebot.main.hide_shots[2]:override()
					t3.ragebot.main.double_tap[2]:override()
				end

				events.shutdown(v374, v1917)
				events.createmove(v375, v1917)
			end, true)

			local aimtools = t29.ragebot.aimtools
			local n25 = 1
			local n26 = 3
			local n27 = 6
			local n28 = 7
			local n29 = 1
			local n30 = 5
			local aimtools2 = t24.aimtools
			local t135 = {}
			local t136 = {}

			for i = 1, #aimtools2 do
				(function(p443)
					-- upvalues: t136 (copy)
					t136[p443] = {
						head_scale = ui.find("Aimbot", "Ragebot", "Selection", p443, "Multipoint", "Head Scale"),
						body_scale = ui.find("Aimbot", "Ragebot", "Selection", p443, "Multipoint", "Body Scale"),
						hit_chance = ui.find("Aimbot", "Ragebot", "Selection", p443, "Hit Chance"),
						body_aim = ui.find("Aimbot", "Ragebot", "Safety", p443, "Body Aim"),
						safe_points = ui.find("Aimbot", "Ragebot", "Safety", p443, "Safe Points")
					}
				end)(aimtools2[i])
			end

			local function v387(p444)
				-- upvalues: n29 (copy), n30 (copy)
				local v1920 = p444:get_weapon_info()

				if v1920 ~= nil then
					local weapon_type = v1920.weapon_type
					local v1922 = p444:get_weapon_index()

					if weapon_type ~= n29 then
						if weapon_type ~= n30 then
							return nil
						end

						if v1922 ~= 9 then
							if v1922 ~= 40 then
								return "AutoSnipers"
							end

							return "SSG-08"
						end

						return "AWP"
					end

					if v1922 ~= 1 then
						if v1922 ~= 64 then
							return "Pistols"
						end

						return "R8 Revolver"
					end

					return "Desert Eagle"
				end

				return nil
			end
			local function v388(p445)
				-- upvalues: n25 (copy), n26 (copy), n27 (copy), n28 (copy)
				if p445 ~= n25 then
					if p445 ~= n26 then
						if p445 ~= n27 then
							if p445 ~= n28 then
								return 1
							end

							return 0.75
						end

						return 0.75
					end

					return 1.25
				end

				return 4
			end
			local function v389(p446, p447, p448, p449)
				-- upvalues: v388 (copy), n25 (copy)
				local v1928 = p447 * v388(p448)

				if p446.m_ArmorValue > 0 then
					if p448 ~= n25 then
						v1928 = v1928 * (p449 * 0.5)
					elseif p446.m_bHasHelmet then
						v1928 = v1928 * (p449 * 0.5)
					end
				end

				return v1928
			end
			local function v390(p450, p451, p452, p453, p454)
				-- upvalues: v389 (copy)
				local v1934 = p451 - p450
				local damage = p454.damage
				local armor_ratio = p454.armor_ratio
				local range = p454.range
				local range_modifier = p454.range_modifier
				local v1939 = math.min(range, v1934:length())
				local v1940 = damage * math.pow(range_modifier, v1939 * 0.002)

				return (v389(p452, v1940, p453, armor_ratio))
			end
			local function v391(p455, p456)
				local v1943 = p455:get_origin()
				local v1944 = p456:get_origin()

				return not (v1943.z - v1944.z <= 53)
			end
			local function v392(p457, p458)
				local v1947 = p457:get_origin()

				return not (p458:get_origin().z - v1947.z <= 53)
			end
			local function v393(p459, p460, p461, p462, p463)
				-- upvalues: v390 (copy)
				return not (v390(p459, p460, p461, p462, p463) < p461.m_iHealth)
			end
			local function v394()
				-- upvalues: aimtools2 (copy), t136 (copy)
				for i = 1, #aimtools2 do
					local v1954 = t136[aimtools2[i]]

					v1954.head_scale:override()
					v1954.body_scale:override()
					v1954.hit_chance:override()
					v1954.body_aim:override()
					v1954.safe_points:override()
				end
			end
			local function v395()
				return {
					misses = 0,
					force_safe = false,
					prefer_body = false
				}
			end
			local function v396(p464)
				-- upvalues: t135 (copy)
				return t135[p464]
			end
			local function v397(p465)
				-- upvalues: v396 (copy), v395 (copy), t135 (copy)
				local v1957 = v396(p465)

				if v1957 == nil then
					v1957 = v395()
					t135[p465] = v1957
				end

				return v1957
			end
			local function v398(p466)
				-- upvalues: t135 (copy)
				t135[p466] = nil
			end
			local function v399()
				-- upvalues: t135 (copy), v398 (copy)
				for k in pairs(t135) do
					v398(k)
				end
			end
			local function v400(p467, p468, p469, p470, p471, p472)
				-- upvalues: v391 (copy), v392 (copy), v393 (copy)
				local v1966 = p467:get_eye_position()
				local v1967 = p469:get_hitbox_position(5)
				local v1968 = p468:get_weapon_info()
				local v1969 = p472.body_aim:get() ~= "Force" and
					(p471.conditions:get("Higher than you") and v391(p469, p467) or (p471.conditions:get("Lower than you") and v392(p469, p467) or (p471.conditions:get("Lethal") and v393(v1966, v1967, p469, 3, v1968) or (p471.conditions:get("After X misses") and not (p470.misses <= p471.max_misses:get()) or p471.conditions:get("HP lower than X") and not (p469.m_iHealth >= p471.lower_hp:get())))))

				p472.body_aim:override(v1969 and "Prefer" or nil)
				p470.prefer_body = v1969
			end
			local function v401(p473, p474, p475, p476, p477, p478)
				-- upvalues: v391 (copy), v392 (copy), v393 (copy)
				local v1976 = p473:get_eye_position()
				local v1977 = p475:get_hitbox_position(5)
				local v1978 = p474:get_weapon_info()
				local v1979 = p477.conditions:get("Higher than you") and v391(p475, p473) or
					(p477.conditions:get("Lower than you") and v392(p475, p473) or (p477.conditions:get("Lethal") and v393(v1976, v1977, p475, 3, v1978) or (p477.conditions:get("After X misses") and not (p476.misses <= p477.max_misses:get()) or p477.conditions:get("HP lower than X") and not (p475.m_iHealth >= p477.lower_hp:get()))))

				p478.safe_points:override(v1979 and "Force" or nil)
				p476.force_safe = v1979
			end
			local function v402(p479, p480, p481, p482, p483, p484)
				-- upvalues: v391 (copy), v392 (copy), v393 (copy)
				local v1986 = p479:get_eye_position()
				local v1987 = p481:get_hitbox_position(5)
				local v1988 = p480:get_weapon_info()
				local v1989 = p483["Higher than you"].enabled:get() and
					(v391(p481, p479) and p483["Higher than you"].value:get()) or
					(p483["Lower than you"].enabled:get() and (v392(p481, p479) and p483["Lower than you"].value:get()) or (p483.Lethal.enabled:get() and (v393(v1986, v1987, p481, 3, v1988) and p483.Lethal.value:get()) or (p483["After X misses"].enabled:get() and (p482.misses > p483["After X misses"].max_misses:get() and p483["After X misses"].value:get()) or (p483["HP lower than X"].enabled:get() and (p481.m_iHealth < p483["HP lower than X"].lower_hp:get() and p483["HP lower than X"].value:get()) or nil))))

				p484.hit_chance:override(v1989)
				p482.hit_chance = v1989
			end
			local function v403(p485, p486, p487, p488, p489, p490)
				-- upvalues: v391 (copy), v392 (copy), v393 (copy)
				local v1996 = p485:get_eye_position()
				local v1997 = p487:get_hitbox_position(5)
				local v1998 = p486:get_weapon_info()
				local v1999 = p489["Higher than you"].enabled:get() and
					(v391(p487, p485) and p489["Higher than you"].value:get()) or
					(p489["Lower than you"].enabled:get() and (v392(p487, p485) and p489["Lower than you"].value:get()) or (p489.Lethal.enabled:get() and (v393(v1996, v1997, p487, 3, v1998) and p489.Lethal.value:get()) or (p489["After X misses"].enabled:get() and (p488.misses > p489["After X misses"].max_misses:get() and p489["After X misses"].value:get()) or (p489["HP lower than X"].enabled:get() and (p487.m_iHealth < p489["HP lower than X"].lower_hp:get() and p489["HP lower than X"].value:get()) or nil))))

				p490.head_scale:override(v1999)
				p490.body_scale:override(v1999)
				p488.multipoints = v1999
			end
			local function v404(p491, p492, p493)
				-- upvalues: v387 (copy), aimtools (copy), t136 (copy), v397 (copy), v400 (copy), v401 (copy), v402 (copy), v403 (copy), v394 (copy)
				local v2003 = v387(p493)
				local v2004 = aimtools[v2003]
				local v2005 = t136[v2003]

				if p492 == nil or v2004 == nil or v2005 == nil then
					v394()
				else
					local v2006 = v397(p492:get_index())

					v400(p491, p493, p492, v2006, v2004.prefer_body, v2005)
					v401(p491, p493, p492, v2006, v2004.force_safe, v2005)
					v402(p491, p493, p492, v2006, v2004.hit_chance, v2005)
					v403(p491, p493, p492, v2006, v2004.multipoints, v2005)
				end
			end
			local function v405()
				-- upvalues: v394 (copy)
				v394()
			end
			local function v406()
				-- upvalues: v404 (copy)
				local v2007 = entity.get_local_player()

				if v2007 ~= nil then
					local v2008 = v2007:get_player_weapon()

					if v2008 ~= nil then
						v404(v2007, entity.get_threat(), v2008)

						return
					end

					return
				end
			end
			local function v407()
				-- upvalues: v387 (copy), v396 (copy), u31 (ref)
				local v2009 = entity.get_local_player()

				if v2009 ~= nil and v2009:is_alive() then
					local v2010 = v2009:get_player_weapon()

					if v2010 ~= nil then
						local v2011 = entity.get_threat()
						local v2012 = v387(v2010)

						if v2011 ~= nil and v2012 ~= nil then
							local v2013 = v396(v2011:get_index())

							if v2013 ~= nil then
								local t137 = {}

								if v2013.prefer_body then
									table.insert(t137, "BODY")
								end

								if v2013.force_safe then
									table.insert(t137, "SAFE")
								end

								if v2013.multipoints ~= nil then
									table.insert(t137, v2013.multipoints)
								end

								if v2013.hit_chance ~= nil then
									table.insert(t137, v2013.hit_chance .. "%")
								end

								if #t137 ~= 0 then
									local v2015 = v2011:get_bbox()

									if v2015 ~= nil then
										local pos1 = v2015.pos1
										local pos2 = v2015.pos2
										local alpha = v2015.alpha

										if pos1 ~= nil and pos2 ~= nil and alpha ~= nil then
											local v2019 = vector((v2015.pos1.x + v2015.pos2.x) * 0.5, v2015.pos1.y - 20)

											u31.text(1, v2019, color(255, 255, 255, 200 * alpha), "c",
												table.concat(t137, " + "))

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
			local function v408(p494)
				-- upvalues: v397 (copy)
				local state = p494.state
				local target = p494.target

				if state ~= nil and target ~= nil then
					local v2023 = v397(target:get_index())

					v2023.misses = v2023.misses + 1

					return
				end
			end
			local function v409(p495)
				-- upvalues: v398 (copy)
				local v2025 = entity.get_local_player()
				local v2026 = entity.get(p495.userid, true)

				if v2025 == entity.get(p495.attacker, true) and v2025 ~= v2026 then
					v398(v2026:get_index())

					return
				end
			end
			local function v410(p496)
				-- upvalues: v398 (copy)
				local v2028 = entity.get(p496.userid, true)

				if v2028 ~= nil then
					v398(v2028:get_index())

					return
				end
			end
			local function v411(p497)
				-- upvalues: v407 (copy)
				events.render(v407, p497:get())
			end

			aimtools.enabled:set_callback(function(p498)
				-- upvalues: v394 (copy), v399 (copy), aimtools (copy), v411 (copy), v405 (copy), v406 (copy), v408 (copy), v409 (copy), v410 (copy)
				local v2031 = p498:get()

				if not v2031 then
					v394()
					v399()
				end

				if not v2031 then
					aimtools.flag:unset_callback(v411)
				else
					aimtools.flag:set_callback(v411, true)
				end

				events.shutdown(v405, v2031)
				events.createmove(v406, v2031)
				events.aim_ack(v408, v2031)
				events.player_death(v409, v2031)
				events.player_spawn(v410, v2031)
			end, true)
			ai_peek = t29.ragebot.ai_peek
			v413 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap")
			v414 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
			t138 = {
				ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"),
				ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Auto Stop"),
				ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode")
			}
			v416 = ffi.typeof("float[3]")
			v417 = ffi.typeof("uint8_t[4]")

			local v418 = ffi.typeof(
				"                void(__thiscall*)(\n                    void*,\n                    float origin[3],\n                    float mins[3],\n                    float maxs[3],\n                    float angles[3],\n                    uint8_t face_color[4],\n                    uint8_t edge_color[4],\n                    float duration\n                )\n            ")

			u419 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 21, v418)
			n31 = 1
			n32 = 5

			local n33 = 0
			local n34 = 3
			local n35 = 5
			local n36 = 7
			local n37 = 8
			local n38 = 15
			local n39 = 17

			t139 = {
				Head = {
					[1] = n33
				},
				Chest = {
					[1] = n35
				},
				Stomach = {
					[1] = n34
				},
				Arms = {
					[1] = n39,
					[2] = n38
				},
				Legs = {
					[1] = n37,
					[2] = n36,
					[3] = 10,
					[4] = 9
				}
			}

			local n40 = 6
			local n41 = 7

			t140 = {
				[n33] = 1,
				[n35] = 2,
				[n34] = 3,
				[n37] = n40,
				[n36] = n41,
				[12] = n40,
				[11] = n41,
				[n39] = 4,
				[n38] = 5
			}
			t141 = {}

			local function v434(p499, p500)
				-- upvalues: t141 (ref)
				t141[p499] = p500
			end
			local function v435(p501)
				return {
					body_aim = ui.find("Aimbot", "Ragebot", "Safety", p501, "Body Aim"),
					safe_points = ui.find("Aimbot", "Ragebot", "Safety", p501, "Safe Points"),
					ensure_hitbox_safety = ui.find("Aimbot", "Ragebot", "Safety", p501, "Ensure Hitbox Safety"),
					min_damage = ui.find("Aimbot", "Ragebot", "Selection", p501, "Min. Damage"),
					hit_chance = ui.find("Aimbot", "Ragebot", "Selection", p501, "Hit Chance"),
					head_scale = ui.find("Aimbot", "Ragebot", "Selection", p501, "Multipoint", "Head Scale"),
					body_scale = ui.find("Aimbot", "Ragebot", "Selection", p501, "Multipoint", "Body Scale")
				}
			end

			v434("AutoSnipers", v435("AutoSnipers"))
			v434("AWP", v435("AWP"))
			v434("SSG-08", v435("SSG-08"))
			v434("Desert Eagle", v435("Desert Eagle"))
			v434("R8 Revolver", v435("R8 Revolver"))
			v434("Pistols", v435("Pistols"))
		end

		local u436 = nil
		local n42 = 0
		local u438 = nil

		local function v439(p502)
			return p502[0]
		end
		local function v440()
			-- upvalues: u436 (ref), n42 (ref), u438 (ref)
			u436 = nil
			n42 = 0
			u438 = nil
		end
		local function v441()
			-- upvalues: t141 (ref), v413 (copy), t138 (copy)
			for _, v in pairs(t141) do
				v.body_aim:override()
				v.safe_points:override()
				v.ensure_hitbox_safety:override()
				v.hit_chance:override()
				v.head_scale:override()
				v.body_scale:override()
			end

			v413:override()
			t138[3]:override()
		end
		local function v442()
			-- upvalues: ai_peek (copy), t141 (ref), t138 (copy)
			local v2038 = ai_peek.hit_chance:get()
			local v2039 = ai_peek.unsafe:get()

			for _, v in pairs(t141) do
				if v2039 then
					v.body_aim:override("Default")
					v.safe_points:override("Default")
					v.ensure_hitbox_safety:override({})
				end

				if v2038 ~= 0 then
					v.hit_chance:override(v2038)
				end

				v.head_scale:override(100)
				v.body_scale:override(100)
			end

			t138[3]:override("On Shot")
		end
		local function v443(p503)
			if p503 ~= 1 then
				if p503 ~= 3 then
					if p503 ~= 6 and p503 ~= 7 then
						return 1
					end

					return 0.75
				end

				return 1.25
			end

			return 4
		end
		local function v444(p504, p505, p506, p507, p508)
			-- upvalues: v443 (copy)
			local v2048 = p506 - p505
			local v2049 = math.min(p504.range, v2048:length())
			local v2050 = p504.damage * math.pow(p504.range_modifier, v2049 * 0.002) * v443(p508)

			if p507.m_ArmorValue > 0 and (p508 ~= 1 or p507.m_bHasHelmet) then
				v2050 = v2050 * (p504.armor_ratio / 2)
			end

			return v2050
		end
		local function v445()
			-- upvalues: ai_peek (copy), t139 (copy)
			local t142 = {}
			local v2052 = ai_peek.hitboxes:get()

			for i = 1, #v2052 do
				local v2054 = t139[v2052[i]]

				for j = 1, #v2054 do
					table.insert(t142, v2054[j])
				end
			end

			return t142
		end
		local function v446(p509, p510)
			-- upvalues: n31 (copy), n32 (copy)
			local v2058 = p509:get_weapon_index()
			local weapon_type = p510.weapon_type

			if weapon_type ~= n31 then
				if weapon_type ~= n32 then
					return nil
				end

				if v2058 ~= 9 then
					if v2058 ~= 40 then
						return "AutoSnipers"
					end

					return "SSG-08"
				end

				return "AWP"
			end

			if v2058 ~= 1 then
				if v2058 ~= 64 then
					return "Pistols"
				end

				return "R8 Revolver"
			end

			return "Desert Eagle"
		end
		local function v447(p511, p512, p513, p514, p515)
			-- upvalues: t140 (copy), v444 (copy)
			local t143 = {}
			local m_iHealth = p514.m_iHealth
			local v2067 = p512:get_eye_position()
			local v2068 = p513:get_weapon_info()

			for i = 1, #p511 do
				local v2070 = p511[i]
				local v2071 = t140[v2070] or 0
				local v2072 = p514:get_hitbox_position(v2070)
				local v2073 = v444(v2068, v2067, v2072, p514, v2071)

				if not (p515 > v2073) or m_iHealth <= v2073 then
					table.insert(t143, v2072)
				end
			end

			return t143
		end
		local function v448(p516)
			-- upvalues: v439 (copy)
			if p516 ~= nil and pcall(v439, p516) then
				return true
			end

			return false
		end
		local function v449(p517, p518, p519)
			if p517 ~= nil and p518 ~= nil then
				local v2078 = p519.max_clip1 > 0 and not (p518.m_iClip1 <= 0)
				local v2079 = globals.curtime >= p517.m_flNextAttack and
					not (globals.curtime < p518.m_flNextPrimaryAttack)

				return v2078 and v2079
			end

			return false
		end
		local function v450(p520, p521)
			-- upvalues: ai_peek (copy), n42 (ref)
			local v2082 = ai_peek.scan_frequency:get() * 0.01

			if v2082 > 0 then
				n42 = math.max(0, n42 - globals.frametime)

				if n42 > 0 then
					return false
				end

				n42 = v2082
			end

			if not p520.in_forward and (not p520.in_back and (not p520.in_moveleft and not p520.in_moveright)) then
				local m_fFlags = p521.m_fFlags

				if bit.band(m_fFlags, 1) ~= 0 then
					if not (p521.m_vecVelocity:length2dsqr() > 480) then
						return true
					end

					return false
				end

				return false
			end

			return false
		end
		local function v451(p522, p523)
			return {
				ctx = p522,
				target = p523,
				simtime = 0,
				retreat = -1,
				teleport = 0
			}
		end
		local function v452(p524)
			-- upvalues: u419 (ref), v416 (copy), v417 (copy), ai_peek (copy)
			u419(v416(p524.origin:unpack()), v416(p524.obb_mins:unpack()), v416(p524.obb_maxs:unpack()), v416(), v417(),
				v417(ai_peek.color:get():unpack()), globals.tickinterval * 2)
		end
		local function v453(p525)
			p525.in_forward = true
			p525.in_back = false
			p525.in_moveleft = false
			p525.in_moveright = false
			p525.in_duck = false
			p525.in_jump = false
			p525.in_speed = false
		end
		local function v454(p526, p527, p528)
			return utils.trace_bullet(p526, p527, p528, function(p529)
				-- upvalues: p526 (copy)
				if p529 ~= p526 then
					if p529:is_enemy() then
						return true
					end

					return false
				end

				return false
			end)
		end
		local function v455(p530, p531)
			local v2093 = p530:get_origin()
			local v2094 = (p531:get_origin() - v2093):angles().y + 180

			return v2094 - 90, v2094 + 90
		end
		local function v456(p532, p533, p534, p535, p536)
			-- upvalues: v454 (copy)
			local m_iHealth = p534.m_iHealth

			for i = 1, #p535 do
				local v2102 = p535[i]
				local v2103 = v454(p532, p533, v2102)
				local v2104 = not (p536 > v2103)
				local v2105 = not (m_iHealth > v2103)

				if v2104 or v2105 then
					return v2103
				end
			end

			return nil
		end
		local function v457(p537, p538, p539, p540, p541, p542, p543)
			-- upvalues: v456 (copy)
			p537.view_angles.y = p539
			p538:think(1)

			if bit.band(p538.flags, 1) ~= 0 then
				local v2113 = v456(p540, p538.origin + vector(0, 0, p538.view_offset), p541, p542, p543)

				if v2113 ~= nil then
					p538:think(1)
				end

				return {
					ctx = p538,
					damage = v2113
				}
			end

			return nil
		end
		local function v458(p544, p545, p546, p547, p548)
			-- upvalues: v455 (copy), v457 (copy), v451 (copy)
			local v2119 = true
			local v2120 = true
			local v2121 = p545:simulate_movement(nil, vector(), 1)
			local v2122 = p545:simulate_movement(nil, vector(), 1)
			local v2123, v2124 = v455(p545, p546)

			for _ = 1, 25 do
				if v2119 then
					local v2126 = v457(p544, v2121, v2123, p545, p546, p547, p548)

					if v2126 ~= nil and v2126.damage ~= nil then
						return v451(v2126.ctx, p546)
					end

					if v2126 == nil then
						v2119 = false
					end
				end

				if v2120 then
					local v2127 = v457(p544, v2122, v2124, p545, p546, p547, p548)

					if v2127 ~= nil and v2127.damage ~= nil then
						return v451(v2127.ctx, p546)
					end

					if v2127 == nil then
						v2120 = false
					end
				end
			end
		end
		local function v459(p549, p550, p551, p552, p553)
			-- upvalues: v458 (copy)
			local v2133 = p549.view_angles:clone()
			local forwardmove = p549.forwardmove
			local sidemove = p549.sidemove
			local in_duck = p549.in_duck
			local in_jump = p549.in_jump
			local in_speed = p549.in_speed

			p549.forwardmove = 450
			p549.sidemove = 0
			p549.in_duck = false
			p549.in_jump = false
			p549.in_speed = false

			local v2139 = v458(p549, p550, p551, p552, p553)

			p549.view_angles.y = v2133.y
			p549.forwardmove = forwardmove
			p549.sidemove = sidemove
			p549.in_duck = in_duck
			p549.in_jump = in_jump
			p549.in_speed = in_speed

			return v2139
		end
		local function v460(p554, p555, p556)
			-- upvalues: v414 (copy), v445 (copy), u436 (ref), v448 (copy), v447 (copy), v456 (copy), v450 (copy), v459 (copy)
			local v2143 = v414:get()
			local v2144 = v445()

			if u436 == nil or not v448(u436.target) then
				if v450(p554, p555) then
					local v2145 = entity.get_threat()

					if v2145 ~= nil and not v2145:is_dormant() then
						local m_iHealth = v2145.m_iHealth

						if v2143 >= 100 then
							v2143 = v2143 - 100 + m_iHealth
						end

						local v2147 = v447(v2144, p555, p556, v2145, v2143)

						if not v456(p555, p555:get_eye_position(), v2145, v2147, v2143) then
							local v2148 = v459(p554, p555, v2145, v2147, v2143)

							if v2148 ~= nil then
								u436 = v2148
							end

							return u436 ~= nil
						end

						return false
					end

					return false
				end

				return false
			end

			local ctx = u436.ctx
			local target = u436.target
			local m_iHealth = target.m_iHealth

			if v2143 >= 100 then
				v2143 = v2143 - 100 + m_iHealth
			end

			local v2152 = v447(v2144, p555, p556, target, v2143)

			if v456(p555, ctx.origin + vector(0, 0, ctx.view_offset), target, v2152, v2143) ~= nil then
				u436.simtime = 0
			end

			u436.simtime = u436.simtime + globals.frametime

			return true
		end
		local function v461()
			-- upvalues: v413 (copy)
			rage.exploit:force_teleport()
			v413:override(false)
		end
		local function v462(p557, p558, p559)
			-- upvalues: v453 (copy), v442 (copy)
			local n43 = 450
			local v2157 = p559 - p558:get_origin()
			local v2158 = v2157:angles()
			local v2159 = v2157:length2dsqr()
			local v2160 = not (v2159 >= 10)

			if v2160 then
				local m_vecVelocity = p558.m_vecVelocity

				n43 = -m_vecVelocity:length()
				v2158 = m_vecVelocity:angles()
			end

			p557.move_yaw = v2158.y
			p557.forwardmove = n43
			p557.sidemove = 0
			v453(p557)
			v442()

			return v2160, v2159
		end
		local function v463(p560, p561, p562, p563)
			-- upvalues: v460 (copy), u436 (ref), ai_peek (copy), u438 (ref), v462 (copy), v452 (copy), v449 (copy), v440 (copy), v461 (copy), v441 (copy)
			local v2166 = v460(p560, p561, p562)

			if u436 ~= nil then
				if u436.simtime > ai_peek.simulation:get() * 0.01 then
					v2166 = false
				end

				if p563.weapon_type == 5 and not p561.m_bIsScoped then
					v2166 = false
				end

				if not v2166 or not (u436.retreat <= 0) then
					if v449(p561, p562, p563) then
						if u436.ctx ~= nil and u436.retreat ~= -1 then
							local v2167 = v462(p560, p561, u438)

							if p561.m_vecVelocity:length2dsqr() > 1600 then
								v461()
							end

							u436.retreat = u436.retreat + 1

							if v2167 then
								v441()
								v440()
							end
						end

						return
					end

					v440()

					return
				end

				local ctx = u436.ctx

				if u438 == nil then
					local v2169 = p561:get_origin()
					local v2170 = (ctx.origin - v2169):normalize()
					local obb_mins = ctx.obb_mins
					local obb_maxs = ctx.obb_maxs

					u438 = utils.trace_hull(v2169, ctx.origin - v2170 * 25, obb_mins, obb_maxs, p561, 33636363, 0)
						.end_pos
				end

				u436.retreat = v462(p560, p561, ctx.origin) and 1 or 0
				v452(ctx)

				return
			end
		end
		local function v464(p564)
			-- upvalues: v446 (copy), t138 (copy), ai_peek (copy), v441 (copy), v440 (copy), v463 (copy)
			local v2174 = entity.get_local_player()

			if v2174 ~= nil then
				local v2175 = v2174:get_player_weapon()

				if v2175 ~= nil then
					local v2176 = v2175:get_weapon_info()

					if v2176 ~= nil then
						local v2177 = v446(v2175, v2176)

						if t138[1]:get() and ai_peek.weapons:get(v2177) then
							v463(p564, v2174, v2175, v2176)

							return
						end

						v441()
						v440()

						return
					end

					return
				end

				return
			end
		end
		local function v465()
			-- upvalues: v440 (copy)
			v440()
		end

		ai_peek.enabled:set_callback(function(p565)
			-- upvalues: v441 (copy), v440 (copy), v465 (copy), v464 (copy)
			local v2179 = p565:get()

			if not v2179 then
				v441()
				v440()
			end

			events.aim_fire(v465, v2179)
			events.createmove(v464, v2179)
		end, true)

		local logs = t29.ragebot.logs
		local v467 = string.upper(t1.name:sub(1, 1))
		local v468 = string.lower(t1.name)
		local n44 = 7
		local n45 = 5
		local v471 = n44
		local t144 = {}
		local t145 = {
			[0] = "generic",
			[1] = "head",
			[2] = "chest",
			[3] = "stomach",
			[4] = "left arm",
			[5] = "right arm",
			[6] = "left leg",
			[7] = "right leg",
			[8] = "neck",
			[9] = nil,
			[10] = "gear"
		}
		local t146 = {
			inferno = "burned",
			decoy = "decoyed",
			knife = "knifed",
			molotov = "harmed",
			c4 = "bombed",
			smokegrenade = "harmed",
			incgrenade = "harmed",
			hegrenade = "naded",
			flashbang = "harmed"
		}

		local function v475(p566)
			-- upvalues: logs (copy)
			if logs.output:get("Events") then
				print_dev(p566)

				return
			end
		end
		local function v476(p567, p568)
			-- upvalues: logs (copy), t144 (copy)
			if logs.output:get("Render") then
				local v2183 = logs.duration:get()
				local v2184 = #t144 + 1

				t144[v2184] = {
					alpha = 0,
					text = p568,
					color = p567,
					time = v2183
				}

				return v2184
			end
		end
		local function v477(p569)
			-- upvalues: logs (copy)
			if logs.output:get("Console") then
				print_raw(p569)

				return
			end
		end
		local function v478(p570, p571, p572)
			local v2189 = string.gsub(p570, "${(.-)}", string.format("\a%s%%1\a%s", p571, p572))

			if v2189:sub(1, 1) ~= "\a" then
				v2189 = "\a" .. p572 .. v2189
			end

			return v2189
		end
		local function v479()
			-- upvalues: t144 (copy)
			for i = 1, #t144 do
				t144[i] = nil
			end
		end
		local function v480(p573)
			-- upvalues: v467 (copy), v468 (copy)
			if p573 ~= "Off" then
				if p573 ~= "Icon" then
					if p573 ~= "Text" then
						return p573
					end

					return v468
				end

				return v467
			end

			return nil
		end
		local function v481(p574, p575, p576, p577, p578)
			-- upvalues: u31 (ref), v8 (copy)
			local n46 = 4

			if p577 > 0 then
				local v2198 = math.map(p577, 0, 1.5, 0, 115, true)
				local v2199 = p576:clone()

				v2199.a = v2198 * p578
				u31.shadow(p574, p575, v2199, v8(8 * p577), 0, n46)
			end

			local v2200 = p576:clone()

			v2200.a = v2200.a * p578
			u31.rect(p574, p575, v2200, n46)
		end
		local function v482()
			-- upvalues: logs (copy), t144 (copy), u31 (ref), v480 (copy), t14 (ref), n44 (copy), n45 (copy), v471 (copy), v481 (copy), v8 (copy)
			local v2201 = logs.background_color:get()
			local frametime = globals.frametime
			local v2203 = #t144
			local v2204 = u31.screen_size() / 2

			v2204.y = v2204.y + logs.offset:get() * 5

			local v2205 = logs.logo:get()
			local v2206 = v2205 == "!"
			local v2207 = v480(v2205)
			local n47 = 4
			local s11 = ""
			local v2210 = u31.measure_text(n47, s11, v2207)

			for i = v2203, 1, -1 do
				local v2212 = t144[i]
				local v2213 = v2212.time > 0 and not (v2203 - i >= 6)

				v2212.alpha = t14.interp(v2212.alpha, v2213, 0.075)

				if v2213 then
					v2212.time = v2212.time - frametime
				elseif v2212.alpha <= 0 then
					table.remove(t144, i)
				end
			end

			local n48 = 1
			local s12 = ""
			local v2216 = logs.glow:get() * 0.01

			for i = 1, #t144 do
				local v2218 = t144[i]
				local color2 = v2218.color
				local text = v2218.text
				local alpha = v2218.alpha

				if not v2206 then
					text = text .. " !"
				end

				local v2222 = u31.measure_text(n48, s12, text)
				local v2223 = v2222 + vector(n44, n45) * 2

				if v2207 ~= nil then
					v2223.x = v2223.x + v2210.x + v471
				end

				local v2224 = v2204 - v2223 / 2
				local v2225 = v2224 + vector(n44, n45)
				local v2226 = vector(v2225.x, v2224.y + (v2223.y - v2210.y) / 2)

				v481(v2224, v2224 + v2223, v2201, v2216, alpha)

				if v2207 ~= nil then
					local v2227 = color2:clone()

					v2227.a = v2227.a * alpha
					u31.text(n47, v2226, v2227, s11, v2207)
					v2225.x = v2225.x + v2210.x + v471
				end

				v2225.y = v2224.y + (v2223.y - v2222.y) / 2

				local v2228 = color(255, 255, 255, 255 * alpha)

				u31.text(n48, v2225, v2228, s12, text)
				v2204.y = v2204.y - v8((v2223.y + 5) * alpha)
			end
		end
		local function v483(p579)
			-- upvalues: logs (copy), t145 (copy), v478 (copy), v475 (copy), v477 (copy), v476 (copy)
			local target = p579.target

			if target ~= nil then
				local v2231 = logs.hit_color:get()
				local v2232 = target:get_name()
				local m_iHealth = target.m_iHealth
				local backtrack = p579.backtrack
				local hitchance = p579.hitchance
				local v2236 = p579.damage or 0
				local v2237 = p579.wanted_damage or 0
				local v2238 = t145[p579.hitgroup] or "?"
				local v2239 = t145[p579.wanted_hitgroup] or "?"
				local v2240 = not (v2237 - v2236 <= 10)
				local v2241 = v2239 ~= v2238
				local v2242 = string.format("hit ${%s}'s ${%s} for ${%d} dmg", v2232, v2238, v2236)
				local t147 = {}

				table.insert(t147, string.format("hit: ${%s}", v2232))

				if not v2241 then
					table.insert(t147, string.format("hb: ${%s}", v2238))
				else
					table.insert(t147, string.format("hb: ${%s}/%s", v2238, v2239))
				end

				if not v2240 then
					table.insert(t147, string.format("dmg: ${%d}", v2236))
				else
					table.insert(t147, string.format("dmg: ${%d}/%d", v2236, v2237))
				end

				table.insert(t147, string.format("bt: ${%d}", backtrack))
				table.insert(t147, string.format("hc: ${%d%%}", hitchance))

				if not (m_iHealth <= 0) then
					table.insert(t147, string.format("rph: ${%d}", m_iHealth))
				else
					table.insert(t147, "rph: ${0} (dead)")
				end

				local v2244 = table.concat(t147, "  ")
				local v2245 = v478(v2242, v2231:to_hex(), "c8c8c8ff")
				local v2246 = v478(v2244, v2231:to_hex(), "c8c8c8ff")

				v475(v2246)
				v477(v2246)
				v476(v2231, v2245)

				return
			end
		end
		local function v484(p580)
			-- upvalues: logs (copy), t145 (copy), v478 (copy), v475 (copy), v477 (copy), v476 (copy)
			local target = p580.target

			if target ~= nil then
				local v2249 = logs.miss_color:get()
				local v2250 = target:get_name()
				local state = p580.state
				local hitchance = p580.hitchance
				local backtrack = p580.backtrack
				local v2254 = p580.wanted_damage or 0
				local v2255 = t145[p580.wanted_hitgroup] or "?"
				local v2256 = string.format("missed ${%s}'s ${%s} due to ${%s}", v2250, v2255, state)
				local t148 = {}

				table.insert(t148, string.format("missed: ${%s}", v2250))
				table.insert(t148, string.format("hb: ${%s}", v2255))
				table.insert(t148, string.format("due: ${%s}", state))
				table.insert(t148, string.format("dmg: ${%d}", v2254))
				table.insert(t148, string.format("bt: ${%d}", backtrack))
				table.insert(t148, string.format("hc: ${%d%%}", hitchance))

				local v2258 = table.concat(t148, "  ")
				local v2259 = v478(v2256, v2249:to_hex(), "c8c8c8ff")
				local v2260 = v478(v2258, v2249:to_hex(), "c8c8c8ff")

				v475(v2260)
				v477(v2260)
				v476(v2249, v2259)

				return
			end
		end
		local function v485(p581)
			-- upvalues: v483 (copy), v484 (copy)
			if p581.state ~= nil then
				v484(p581)
			else
				v483(p581)
			end
		end
		local function v486(p582)
			-- upvalues: t146 (copy), logs (copy), v478 (copy), v475 (copy), v477 (copy), v476 (copy)
			local v2263 = entity.get_local_player()
			local v2264 = entity.get(p582.userid, true)

			if v2263 == entity.get(p582.attacker, true) and v2264 ~= v2263 then
				local weapon = p582.weapon
				local v2266 = t146[weapon]

				if v2266 ~= nil then
					local v2267 = logs.hit_color:get()
					local v2268 = v2264:get_name()
					local m_iHealth = v2264.m_iHealth
					local dmg_health = p582.dmg_health
					local v2271 = string.format("%s ${%s} for ${%d} dmg", v2266, v2268, dmg_health)
					local t149 = {}

					table.insert(t149, string.format("harmed: ${%s}", v2268))
					table.insert(t149, string.format("dmg: ${%d}", dmg_health))

					if not (m_iHealth <= 0) then
						table.insert(t149, string.format("rph: ${%d}", m_iHealth))
					else
						table.insert(t149, "rph: ${0} (dead)")
					end

					table.insert(t149, string.format("wep: ${%s}", weapon))

					local v2273 = table.concat(t149, "  ")
					local v2274 = v478(v2271, v2267:to_hex(), "c8c8c8ff")
					local v2275 = v478(v2273, v2267:to_hex(), "c8c8c8ff")

					v475(v2275)
					v477(v2275)
					v476(v2267, v2274)

					return
				end

				return
			end
		end
		local function v487(p583)
			-- upvalues: v479 (copy), v482 (copy)
			local v2277 = p583:get("Render")

			if not v2277 then
				v479()
			end

			events.render(v482, v2277)
		end

		logs.enabled:set_callback(function(p584)
			-- upvalues: v479 (copy), v482 (copy), logs (copy), v487 (copy), v485 (copy), v486 (copy)
			local v2279 = p584:get()

			if not v2279 then
				v479()
			end

			if not v2279 then
				events.render(v482, false)
			end

			if not v2279 then
				logs.output:unset_callback(v487)
			else
				logs.output:set_callback(v487, true)
			end

			events.aim_ack(v485, v2279)
			events.player_hurt(v486, v2279)
		end, true)

		local dormant_aimbot = t29.ragebot.dormant_aimbot
		local v489 = true
		local n49 = 5
		local v491 = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot")
		local v492 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
		local u493 = nil
		local text = nil
		local hitbox = nil
		local u496 = nil
		local alpha = nil
		local u498 = false
		local u499 = false
		local n50 = 1
		local n51 = 0
		local t150 = {
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
		}
		local t151 = {
			[1] = {
				scale = 5,
				hitbox = "Stomach",
				vec = vector(0, 0, 40)
			},
			[2] = {
				scale = 6,
				hitbox = "Chest",
				vec = vector(0, 0, 50)
			},
			[3] = {
				scale = 3,
				hitbox = "Head",
				vec = vector(0, 0, 58)
			},
			[4] = {
				scale = 4,
				hitbox = "Legs",
				vec = vector(0, 0, 20)
			}
		}

		local function v504(p585, p586)
			for i = 1, #p585 do
				if p586 == p585[i] then
					return true
				end
			end

			return false
		end
		local function v505(p587)
			return p587 >= 1 and not (p587 > 6)
		end
		local function v506()
			local t152 = {}
			local v2285 = entity.get_player_resource()

			for i = 1, globals.max_players do
				local v2287 = entity.get(i)

				if v2287 ~= nil and (v2285.m_bConnected[i] and (v2287:is_enemy() and v2287:is_dormant())) then
					table.insert(t152, v2287)
				end
			end

			return t152
		end
		local function v507(p588, p589, p590)
			local v2291 = p588:to(p589):angles()
			local v2292 = math.rad(v2291.y + 90)
			local v2293 = vector(math.cos(v2292), math.sin(v2292), 0) * p590

			return {
				[1] = {
					text = "Middle",
					vec = p589
				},
				[2] = {
					text = "Left",
					vec = p589 + v2293
				},
				[3] = {
					text = "Right",
					vec = p589 - v2293
				}
			}
		end
		local function v508(p591, p592, p593, p594)
			local v2298, v2299 = utils.trace_bullet(p591, p592, p593, p594)

			if v2299 ~= nil then
				local entity3 = v2299.entity

				if entity3 == nil then
					return 0, v2299
				end

				if entity3:is_player() and not entity3:is_enemy() then
					return 0, v2299
				end
			end

			return v2298, v2299
		end
		local function v509(p595)
			-- upvalues: v491 (copy), n51 (copy), v505 (copy), v506 (copy), dormant_aimbot (copy), n50 (ref), v492 (copy), t151 (copy), v504 (copy), v507 (copy), v508 (copy), u493 (ref), hitbox (ref), u496 (ref), text (ref), alpha (ref), v489 (copy), n49 (copy), u499 (ref)
			v491:override(false)

			local v2302 = entity.get_local_player()

			if v2302 ~= nil then
				local v2303 = v2302:get_player_weapon()

				if v2303 ~= nil then
					local v2304 = v2303:get_weapon_info()

					if v2304 ~= nil then
						local v2305 = v2303:get_inaccuracy()

						if v2305 ~= nil then
							local tickcount = globals.tickcount
							local v2307 = v2302:get_eye_position()
							local current = v2302:get_simulation_time().current
							local v2309 = bit.band(v2302.m_fFlags, bit.lshift(1, 0)) ~= 0

							if not (tickcount < n51) then
								if not p595.in_jump or v2309 then
									local weapon_type = v2304.weapon_type

									if v505(weapon_type) and not (v2303.m_iClip1 <= 0) then
										local v2311 = v506()
										local v2312 = dormant_aimbot.hitboxes:get()

										if tickcount % #v2311 == 0 then
											n50 = 1
										else
											n50 = n50 + 1
										end

										local v2313 = v2311[n50]

										if v2313 ~= nil then
											local v2314 = v2313:get_bbox()
											local v2315 = v2313:get_origin()
											local m_flDuckAmount = v2313.m_flDuckAmount
											local v2317 = dormant_aimbot.alpha_modifier:get()
											local v2318 = dormant_aimbot.minimum_damage:get()

											if v2318 == 0 then
												v2318 = v492:get()
											end

											if v2318 >= 100 then
												v2318 = v2318 - 100 + v2313.m_iHealth
											end

											local t153 = {}

											for i = 1, #t151 do
												local v2321 = t151[i]
												local vec = v2321.vec
												local scale = v2321.scale
												local hitbox2 = v2321.hitbox

												if hitbox2 == "Head" then
													vec = vec - vector(0, 0, 10 * m_flDuckAmount)
												end

												if hitbox2 == "Chest" then
													vec = vec - vector(0, 0, 4 * m_flDuckAmount)
												end

												if #v2312 == 0 then
													table.insert(t153, 1, {
														vec = vec,
														scale = scale,
														hitbox = hitbox2
													})
												elseif v504(v2312, hitbox2) then
													table.insert(t153, {
														vec = vec,
														scale = scale,
														hitbox = hitbox2
													})
												end
											end

											if v2304.is_revolver and not (current <= v2303.m_flNextPrimaryAttack) or not (current <= math.max(v2302.m_flNextAttack, v2303.m_flNextPrimaryAttack, v2303.m_flNextSecondaryAttack)) then
												local v2325 = nil
												local v2326 = nil

												if not (v2317 >= math.floor(v2314.alpha * 100) + 5) then
													for i = 1, #t153 do
														local v2328 = t153[i]
														local v2329 = v507(v2307, v2315 + v2328.vec, v2328.scale)

														for j = 1, #v2329 do
															local v2331 = v2329[j]
															local vec = v2331.vec
															local v2333, v2334 = v508(v2302, v2307, vec, function(p596)
																-- upvalues: v2313 (copy)
																return p596 == v2313
															end)

															if (v2334 == nil or not v2334:is_visible()) and v2333 ~= 0 and v2318 < v2333 then
																v2325 = vec
																v2326 = v2333
																u493 = v2313
																hitbox = v2328.hitbox
																u496 = v2333
																text = v2331.text
																alpha = v2314.alpha

																break
															end
														end

														if v2325 and v2326 then
															break
														end
													end

													if v2325 and v2326 then
														local v2335 = v2307:to(v2325):angles()

														p595.block_movement = 1

														if v489 then
															local v2336 = not p595.in_jump and v2309
															local v2337 = v2302.m_bIsScoped or v2302.m_bResumeZoom
															local v2338 = v2304.weapon_type == n49

															if not v2337 and v2338 and v2336 then
																p595.in_attack2 = true
															end
														end

														if v2305 < 0.01 then
															p595.view_angles = v2335
															p595.in_attack = true
															u499 = true
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

									return false
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
		local function v510(p597)
			-- upvalues: u499 (ref), u498 (ref), u493 (ref), hitbox (ref), u496 (ref), text (ref), alpha (ref)
			utils.execute_after(0.03, function()
				-- upvalues: p597 (copy), u499 (ref), u498 (ref), u493 (ref), hitbox (ref), u496 (ref), text (ref), alpha (ref)
				if entity.get(p597.userid, true) == entity.get_local_player() then
					if u499 and not u498 then
						events.dormant_miss:call({
							userid = u493,
							aim_hitbox = hitbox,
							aim_damage = u496,
							aim_point = text,
							accuracy = alpha
						})
					end

					u498 = false
					u499 = false
					u493 = nil
					hitbox = nil
					u496 = nil
					text = nil
					alpha = nil
				end
			end)
		end
		local function v511(p598)
			-- upvalues: u499 (ref), u498 (ref), t150 (copy), text (ref), hitbox (ref), u496 (ref)
			local v2341 = entity.get_local_player()
			local v2342 = entity.get(p598.userid, true)
			local v2343 = entity.get(p598.attacker, true)

			if v2342 ~= nil and v2343 == v2341 then
				local v2344 = v2342:get_bbox()

				if v2344 ~= nil then
					if v2342:is_dormant() and u499 == true then
						u498 = true
						events.dormant_hit:call({
							userid = v2342,
							attacker = v2343,
							health = p598.health,
							armor = p598.armor,
							weapon = p598.weapon,
							dmg_health = p598.dmg_health,
							dmg_armor = p598.dmg_armor,
							hitgroup = p598.hitgroup,
							accuracy = v2344.alpha,
							hitbox = t150[p598.hitgroup],
							aim_point = text,
							aim_hitbox = hitbox,
							aim_damage = u496
						})
					end

					return
				end

				return
			end
		end
		local function v512()
			-- upvalues: v491 (copy)
			v491:override()
		end

		dormant_aimbot.enabled:set_callback(function(p599)
			-- upvalues: v491 (copy), v512 (copy), v509 (copy), v510 (copy), v511 (copy)
			local v2346 = p599:get()

			if not v2346 then
				v491:override()
			end

			events.shutdown(v512, v2346)
			events.createmove(v509, v2346)
			events.weapon_fire(v510, v2346)
			events.player_hurt(v511, v2346)
		end, true)

		local force_shot = t29.ragebot.force_shot
		local v514 = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance")
		local v515 = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance", "Double Tap")
		local v516 = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points")
		local v517 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage", "Delay Shot")
		local v518 = ui.find("Aimbot", "Ragebot", "Safety", "Ensure Hitbox Safety")

		local function v519()
			-- upvalues: force_shot (copy), csgo_weapons (copy), v516 (copy), v517 (copy), v518 (copy), v514 (copy), v515 (copy)
			if force_shot.enabled:get() then
				local v2347 = entity.get_local_player()

				if v2347 ~= nil then
					local v2348 = v2347:get_player_weapon()

					if v2348 ~= nil then
						local v2349 = csgo_weapons(v2348)

						if v2349 ~= nil then
							local m_vecVelocity = v2347.m_vecVelocity
							local m_fFlags = v2347.m_fFlags
							local v2352 = m_vecVelocity:length()
							local v2353 = bit.band(m_fFlags, 4) == 4

							v516:override("Default")
							v517:override(false)
							v518:override({})

							local v2354 = math.floor(math.min(v2349.max_player_speed, v2349.max_player_speed_alt))
							local t154 = {
								cur = math.floor(v2348:get_inaccuracy() * 100),
								stand = math.floor(math.min(v2349.inaccuracy_stand, v2349.inaccuracy_stand_alt) * 100),
								crouch = math.floor(math.min(v2349.inaccuracy_crouch, v2349.inaccuracy_crouch_alt) * 100),
								move = math.floor(math.min(v2349.inaccuracy_move, v2349.inaccuracy_move_alt) * 100)
							}
							local v2356 = v2353 and t154.crouch or t154.stand
							local v2357 = v2356 + (t154.move - v2356) / v2354 * math.min(v2352, v2354 / 2)

							if not (t154.cur - v2357 <= 0) then
								v514:override(nil)
								v515:override(nil)
							else
								v514:override(0)
								v515:override(0)
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

		force_shot.enabled:set_callback(function(p600)
			-- upvalues: v514 (copy), v515 (copy), v516 (copy), v517 (copy), v518 (copy), v519 (copy)
			local v2359 = p600:get()

			if not v2359 then
				v514:override()
				v515:override()
				v516:override()
				v517:override()
				v518:override()
			end

			events.createmove:set(v519, v2359)
		end, true)

		local aspect_ratio = t29.visuals.aspect_ratio
		local r_aspectratio = cvar.r_aspectratio

		local function v522()
			-- upvalues: r_aspectratio (copy)
			r_aspectratio:float(tonumber(r_aspectratio:string()), true)
		end
		local function v523(p601)
			-- upvalues: r_aspectratio (copy)
			r_aspectratio:float(p601, true)
		end
		local function v524()
			-- upvalues: v522 (copy)
			v522()
		end
		local function v525(p602)
			-- upvalues: v523 (copy)
			v523(p602:get() * 0.01)
		end

		aspect_ratio.enabled:set_callback(function(p603)
			-- upvalues: v522 (copy), aspect_ratio (copy), v525 (copy), v524 (copy)
			local v2363 = p603:get()

			if not v2363 then
				v522()
			end

			if not v2363 then
				aspect_ratio.value:unset_callback(v525)
			else
				aspect_ratio.value:set_callback(v525, true)
			end

			events.shutdown(v524, v2363)
		end, true)
	end

	local solus_ui, v604, v605, v606, v609, t165, t167, t170

	do
		local viewmodel = t29.visuals.viewmodel
		local n52 = 0
		local cl_righthand = cvar.cl_righthand
		local viewmodel_fov = cvar.viewmodel_fov
		local viewmodel_offset_x = cvar.viewmodel_offset_x
		local viewmodel_offset_y = cvar.viewmodel_offset_y
		local viewmodel_offset_z = cvar.viewmodel_offset_z
		local u533 = nil

		local function v534(p604)
			return tonumber(p604:string())
		end
		local function v535(p605)
			-- upvalues: cl_righthand (copy)
			if cl_righthand:string() ~= "1" then
				cl_righthand:int(p605 and 1 or 0, true)
			else
				cl_righthand:int(p605 and 0 or 1, true)
			end
		end
		local function v536()
			-- upvalues: viewmodel_fov (copy), v534 (copy), viewmodel_offset_x (copy), viewmodel_offset_y (copy), viewmodel_offset_z (copy), cl_righthand (copy)
			viewmodel_fov:float(v534(viewmodel_fov), false)
			viewmodel_offset_x:float(v534(viewmodel_offset_x), false)
			viewmodel_offset_y:float(v534(viewmodel_offset_y), false)
			viewmodel_offset_z:float(v534(viewmodel_offset_z), false)
			cl_righthand:int(cl_righthand:string() == "1" and 1 or 0, false)
		end
		local function v537()
			-- upvalues: v536 (copy)
			v536()
		end
		local function v538()
			-- upvalues: u533 (ref), n52 (copy), v535 (copy)
			local v2366 = entity.get_local_player()

			if v2366 ~= nil then
				local v2367 = v2366:get_player_weapon()

				if v2367 ~= nil then
					local v2368 = v2367:get_weapon_index()

					if v2368 ~= u533 then
						u533 = v2368

						local v2369 = v2367:get_weapon_info()

						if v2369 == nil then
							return
						end

						local v2370 = v2369.weapon_type == n52

						v535(v2370)
					end

					return
				end

				return
			end
		end
		local function v539(p606)
			-- upvalues: v536 (copy), v538 (copy), v537 (copy)
			if not p606 then
				v536()
			end

			if not p606 then
				events.pre_render(v538, p606)
			end

			events.shutdown(v537, p606)
		end
		local function v540(p607)
			-- upvalues: viewmodel_fov (copy)
			viewmodel_fov:float(p607:get() * 0.01, true)
		end
		local function v541(p608)
			-- upvalues: viewmodel_offset_x (copy)
			viewmodel_offset_x:float(p608:get() * 0.01, true)
		end
		local function v542(p609)
			-- upvalues: viewmodel_offset_y (copy)
			viewmodel_offset_y:float(p609:get() * 0.01, true)
		end
		local function v543(p610)
			-- upvalues: viewmodel_offset_z (copy)
			viewmodel_offset_z:float(p610:get() * 0.01, true)
		end
		local function v544(p611)
			-- upvalues: cl_righthand (copy), u533 (ref), v538 (copy)
			local v2377 = p611:get()

			if v2377 then
				u533 = nil
			else
				cl_righthand:int(cl_righthand:string() == "1" and 1 or 0, false)
			end

			events.pre_render(v538, v2377)
		end

		viewmodel.enabled:set_callback(function(p612)
			-- upvalues: viewmodel (copy), v540 (copy), v541 (copy), v542 (copy), v543 (copy), v544 (copy), v539 (copy)
			local v2379 = p612:get()

			if not v2379 then
				viewmodel.fov:unset_callback(v540)
				viewmodel.offset_x:unset_callback(v541)
				viewmodel.offset_y:unset_callback(v542)
				viewmodel.offset_z:unset_callback(v543)
				viewmodel.opposite_knife_hand:unset_callback(v544)
			else
				viewmodel.fov:set_callback(v540, true)
				viewmodel.offset_x:set_callback(v541, true)
				viewmodel.offset_y:set_callback(v542, true)
				viewmodel.offset_z:set_callback(v543, true)
				viewmodel.opposite_knife_hand:set_callback(v544, true)
			end

			v539(v2379)
		end, true)

		local indicators = t29.visuals.indicators
		local t155 = {}
		local t156 = {
			[1] = {
				[1] = "✦",
				[2] = 0,
				[3] = 10,
				[4] = 0.5
			},
			[2] = {
				[1] = "⋆",
				[2] = -3,
				[3] = 3,
				[4] = 0.2
			},
			[3] = {
				[1] = "★",
				[2] = -1,
				[3] = 8,
				[4] = 0.4
			},
			[4] = {
				[1] = "✦",
				[2] = 0,
				[3] = 6,
				[4] = 0.7
			},
			[5] = {
				[1] = "⋆",
				[2] = -2,
				[3] = 2,
				[4] = 0.3
			},
			[6] = {
				[1] = "★",
				[2] = 1,
				[3] = 7,
				[4] = 0.6
			},
			[7] = {
				[1] = "⋆",
				[2] = 0,
				[3] = 3,
				[4] = 0.2
			},
			[8] = {
				[1] = "✦",
				[2] = 0,
				[3] = 8,
				[4] = 0.7
			},
			[9] = {
				[1] = "⋆",
				[2] = -2,
				[3] = 7,
				[4] = 0.2
			}
		}
		local n53 = 0
		local n54 = 0
		local n55 = 0
		local n56 = 0
		local n57 = 0

		local function v553()
			-- upvalues: t92 (ref), t3 (ref)
			if t92.is_onground then
				if not t92.is_crouched then
					if not t92.is_moving then
						return "stand"
					end

					if not t3.antiaim.misc.slow_walk:get() then
						return "run"
					end

					return "walk"
				end

				if not t92.is_moving then
					return "crouch"
				end

				return "sneak"
			end

			if not t92.is_crouched then
				return "air"
			end

			return "airc"
		end
		local function v554(p613, p614)
			-- upvalues: t156 (copy), u31 (ref), v8 (copy), n54 (ref)
			local realtime = globals.realtime
			local t157 = {}
			local v2384 = #t156
			local n58 = 0
			local n59 = 0

			for i = 1, v2384 do
				local v2388 = t156[i]
				local v2389 = u31.measure_text(1, "", v2388[1])

				n58 = n58 + (v2389.x + v2388[2])
				n59 = math.max(n59, v2389.y + v2388[3])
				t157[i] = v2389
			end

			local v2390 = p613:clone()

			v2390.x = v8(v2390.x - n58 * 0.5 * (1 - n54))

			for i = 1, v2384 do
				local v2392 = t156[i]
				local v2393 = t157[i]
				local v2394 = v2392[1]
				local v2395 = v2392[2]
				local v2396 = v2392[3]
				local v2397 = v2392[4]
				local v2398 = (math.sin(realtime * v2397) * 0.5 + 0.5) * 0.7 + 0.3
				local v2399 = p614:clone()
				local v2400 = v2390:clone()

				v2400.x = v2400.x + v2395
				v2400.y = v2400.y + v2396
				v2399.a = v2399.a * v2398
				u31.text(1, v2400, v2399, "", v2394)
				v2390.x = v2390.x + (v2393.x + v2395)
			end

			p613.y = p613.y + n59 * 0.66
		end
		local function v555(p615, p616, p617)
			-- upvalues: t1 (copy), u31 (ref), t20 (ref), v8 (copy), n54 (ref)
			local n60 = 4
			local name = t1.name
			local s13 = ""
			local v2407 = u31.measure_text(n60, s13, name)
			local v2408 = -globals.realtime * 1.25
			local v2409 = t20.gradient(name, v2408, p616, p617)
			local v2410 = p615:clone()

			v2410.x = v8(v2410.x - v2407.x * 0.5 * (1 - n54))
			u31.text(n60, v2410, p616, s13, v2409)
			p615.y = p615.y + v2407.y
		end
		local function v556(p618, p619, p620)
			-- upvalues: v553 (copy), u31 (ref), v8 (copy), n54 (ref)
			local n61 = 1
			local v2415 = v553()
			local s14 = ""
			local v2417 = u31.measure_text(n61, s14, v2415)
			local v2418 = p619:clone()
			local v2419 = p618:clone()

			v2418.a = v2418.a * p620
			v2419.x = v8(v2419.x - v2417.x * 0.5 * (1 - n54))
			u31.text(n61, v2419, v2418, s14, v2415)
			p618.y = p618.y + v8(v2417.y)
		end
		local function v557(p621, p622, p623)
			-- upvalues: u31 (ref), v8 (copy), n54 (ref)
			local n62 = 1
			local s15 = "dt"
			local s16 = ""
			local v2426 = u31.measure_text(n62, s16, s15)
			local v2427 = p622:clone()
			local v2428 = p621:clone()
			local v2429 = rage.exploit:get()
			local v2430 = v2427:lerp(color(255, 0, 50, 255), 1 - v2429 * v2429)

			v2430.a = v2430.a * p623
			v2428.x = v8(v2428.x - v2426.x * 0.5 * (1 - n54))
			u31.text(n62, v2428, v2430, s16, s15)
			p621.y = p621.y + v8(v2426.y * p623)
		end
		local function v558(p624, p625, p626)
			-- upvalues: u31 (ref), v8 (copy), n54 (ref)
			local n63 = 1
			local s17 = "dmg"
			local s18 = ""
			local v2437 = u31.measure_text(n63, s18, s17)
			local v2438 = p625:clone()
			local v2439 = p624:clone()

			v2438.a = v2438.a * p626
			v2439.x = v8(v2439.x - v2437.x * 0.5 * (1 - n54))
			u31.text(n63, v2439, v2438, s18, s17)
			p624.y = p624.y + v8(v2437.y * p626)
		end
		local function v559(p627, p628, p629)
			-- upvalues: u31 (ref), v8 (copy), n54 (ref)
			local n64 = 1
			local s19 = "osaa"
			local s20 = ""
			local v2446 = u31.measure_text(n64, s20, s19)
			local v2447 = p628:clone()
			local v2448 = p627:clone()

			v2447.a = v2447.a * p629
			v2448.x = v8(v2448.x - v2446.x * 0.5 * (1 - n54))
			u31.text(n64, v2448, v2447, s20, s19)
			p627.y = p627.y + v8(v2446.y * p629)
		end
		local function v560(p630)
			-- upvalues: t100 (ref), t3 (ref), n53 (ref), t14 (ref), n54 (ref), n55 (ref), n56 (ref), n57 (ref)
			local v2450 = p630:is_alive()
			local m_bIsScoped = p630.m_bIsScoped
			local v2452 = t100.get(t3.ragebot.selection.min_damage)
			local v2453 = v2452 ~= nil and (v2452.active or false)
			local v2454 = t3.ragebot.main.double_tap[1]:get()
			local v2455 = t3.ragebot.main.hide_shots[1]:get()

			n53 = t14.interp(n53, v2450, 0.05)
			n54 = t14.interp(n54, m_bIsScoped, 0.05)
			n55 = t14.interp(n55, v2454, 0.05)
			n56 = t14.interp(n56, v2453, 0.05)
			n57 = t14.interp(n57, v2455, 0.05)
		end
		local function v561()
			-- upvalues: u31 (ref), indicators (copy), v8 (copy), n54 (ref), n53 (ref), v554 (copy), v555 (copy), v556 (copy), v557 (copy), n55 (ref), v558 (copy), n56 (ref), v559 (copy), n57 (ref)
			local v2456 = u31.screen_size() * 0.5
			local v2457 = indicators.accent_color:get()
			local v2458 = indicators.secondary_color:get()

			v2456.x = v8(v2456.x + v8(10 * n54))
			v2456.y = v2456.y + indicators.offset:get()
			v2457.a = v2457.a * n53
			v2458.a = v2458.a * n53
			v554(v2456, v2457)
			v555(v2456, v2457, v2458)
			v556(v2456, color(255, 255, 255, 200), n53)
			v557(v2456, color(255, 255, 255, 200), n55 * n53)
			v558(v2456, color(255, 255, 255, 200), n56 * n53)
			v559(v2456, color(255, 255, 255, 200 * (1 - n55 * 0.5)), n57 * n53)
		end

		function t155.on_render()
			-- upvalues: v560 (copy), n53 (ref), v561 (copy)
			local v2459 = entity.get_local_player()

			if v2459 ~= nil then
				v560(v2459)

				if n53 > 0 then
					v561()
				end

				return
			end
		end

		local t158 = {}
		local s21 = ""
		local n65 = 0
		local n66 = 0
		local n67 = 0
		local n68 = 0
		local n69 = 0
		local n70 = 0

		local function v570(p631)
			local v2461 = p631:get_player_weapon()

			if v2461 ~= nil then
				local v2462 = v2461:get_weapon_info()

				if v2462 ~= nil then
					if v2462.type == 9 then
						return true
					end

					return false
				end

				return false
			end

			return false
		end
		local function v571(p632, p633)
			-- upvalues: t2 (ref)
			local v2465 = globals.realtime * 3
			local v2466 = math.abs(math.sin(v2465))

			return t2.lerp(p632, p633, v2466)
		end
		local function v572()
			-- upvalues: t92 (ref), t3 (ref)
			if t92.is_onground then
				if not t92.is_crouched then
					if not t92.is_moving then
						return "-STANDING-"
					end

					if not t3.antiaim.misc.slow_walk:get() then
						return "-MOVING-"
					end

					return "-WALKING-"
				end

				return "-CROUCH-"
			end

			return "-AIR-"
		end
		local function v573()
			-- upvalues: t3 (ref), s21 (ref)
			if not t3.ragebot.main.double_tap[1]:get() then
				if t3.ragebot.main.hide_shots[1]:get() then
					s21 = "HIDE"
				end
			else
				s21 = "DT"
			end

			return s21, color(255, 255, 255, 255)
		end
		local function v574(p634)
			-- upvalues: t93 (ref)
			if p634 ~= 0 then
				if p634 ~= 1 then
					return "CHARGING", color(255, 64, 64, 255):lerp(color(192, 255, 109, 255), p634)
				end

				if not (t93.defensive_ticks > 0) then
					return "READY", color(192, 255, 109, 255)
				end

				return "ACTIVE", color(120, 255, 255, 255)
			end

			return "WAITING", color(255, 64, 64, 255)
		end
		local function v575(p635)
			-- upvalues: v570 (copy), t100 (ref), t3 (ref), n65 (ref), t14 (ref), n66 (ref), n68 (ref), n69 (ref), n70 (ref)
			local v2469 = p635:is_alive()
			local m_bIsScoped = p635.m_bIsScoped
			local v2471 = v570(p635)
			local v2472 = t100.get(t3.ragebot.selection.min_damage)
			local v2473 = v2472 ~= nil and (v2472.active or false)
			local v2474 = t3.ragebot.main.double_tap[1]:get()
			local v2475 = t3.ragebot.main.hide_shots[1]:get()
			local n71 = 0

			if v2469 then
				n71 = v2471 and 0.5 or 1
			end

			n65 = t14.interp(n65, n71, 0.05)
			n66 = t14.interp(n66, m_bIsScoped, 0.05)
			n68 = t14.interp(n68, v2474, 0.03)
			n69 = t14.interp(n69, v2473, 0.03)
			n70 = t14.interp(n70, v2475, 0.03)
		end
		local function v576(p636, p637, p638, p639)
			-- upvalues: u31 (ref), v571 (copy), v8 (copy), n66 (ref)
			local n72 = 2
			local s22 = ""
			local s23 = "ANGELIC"
			local s24 = "YAW"
			local v2485 = u31.measure_text(n72, s22, s23)
			local v2486 = u31.measure_text(n72, s22, s24)
			local v2487 = v2485.x + v2486.x
			local v2488 = math.max(v2485.y, v2486.y)
			local v2489 = p636:clone()
			local v2490 = v2487 * 0.5
			local v2491 = v571(0.25, 1)
			local v2492 = p637:clone()
			local v2493 = p638:clone()

			v2492.a = v2492.a * p639
			v2493.a = v2493.a * p639
			v2492.a = v2492.a * v2491
			v2489.x = v8(v2489.x - v2490 * (1 - n66) + 1)
			u31.text(n72, v2489, v2493, s22, s23)
			v2489.x = v8(v2489.x + v2485.x)
			u31.text(n72, v2489, v2492, s22, s24)
			p636.y = v8(p636.y + (v2488 - 3))
		end
		local function v577(p640, _, p642)
			-- upvalues: v572 (copy), u31 (ref), n67 (ref), t14 (ref), v8 (copy), n66 (ref)
			local n73 = 2
			local s25 = ""
			local v2499 = v572()
			local v2500 = u31.measure_text(n73, s25, v2499)
			local x = v2500.x
			local y = v2500.y

			if not (x > n67) then
				n67 = x
			else
				n67 = t14.interp(n67, x, 0.05)
			end

			local v2503 = p640:clone()
			local v2504 = n67 * 0.5

			v2503.x = v8(v2503.x - v2504 * (1 - n66) + 1)

			local v2505 = color(255, 255, 255, 255)

			v2505.a = v2505.a * p642
			u31.push_clip_rect(v2503, v2503 + vector(n67, y))
			u31.text(n73, v2503, v2505, s25, v2499)
			u31.pop_clip_rect()
			p640.y = v8(p640.y + (y - 3))
		end
		local function v578(p643, p644, p645)
			-- upvalues: v573 (copy), v574 (copy), u31 (ref), v8 (copy), n66 (ref)
			local n74 = 2
			local s26 = ""
			local v2511 = rage.exploit:get()
			local v2512, v2513 = v573()
			local v2514, v2515 = v574(v2511)
			local v2516 = string.format("\a%s%s \a%s%s", v2513:to_hex(), v2512, v2515:to_hex(), v2514)
			local v2517 = u31.measure_text(n74, s26, v2516)
			local x = v2517.x
			local y = v2517.y
			local v2520 = p643:clone()
			local v2521 = x * 0.5

			v2520.x = v8(v2520.x - v2521 * p644 * (1 - n66) + 1)

			local v2522 = color(255, 255, 255, 255)

			v2522.a = v2522.a * p645 * p644

			local v2523 = v2522:clone()

			v2523.a = v2523.a * 0.5
			u31.push_clip_rect(v2520, v2520 + vector(x * p644, y))
			u31.text(n74, v2520, v2523, s26, v2516)
			u31.pop_clip_rect()
			u31.push_clip_rect(v2520, v2520 + vector(x * p644 * v2511, y))
			u31.text(n74, v2520, v2522, s26, v2516)
			u31.pop_clip_rect()
			p643.y = v8(p643.y + (y - 3) * p644)
		end
		local function v579(p646, p647, p648)
			-- upvalues: u31 (ref), v8 (copy), n66 (ref)
			local n75 = 2
			local s27 = ""
			local s28 = "DMG"
			local v2530 = u31.measure_text(n75, s27, s28)
			local x = v2530.x
			local y = v2530.y
			local v2533 = p646:clone()
			local v2534 = x * 0.5

			v2533.x = v8(v2533.x - v2534 * p647 * (1 - n66) + 1)

			local v2535 = color(255, 255, 255, 255)

			v2535.a = v2535.a * p648 * p647
			u31.push_clip_rect(v2533, v2533 + vector(x * p647, y))
			u31.text(n75, v2533, v2535, s27, s28)
			u31.pop_clip_rect()
			p646.y = v8(p646.y + (y - 3) * p647)
		end
		local function v580()
			-- upvalues: u31 (ref), indicators (copy), n68 (ref), n70 (ref), v8 (copy), n66 (ref), v576 (copy), n65 (ref), v577 (copy), v578 (copy), v579 (copy), n69 (ref)
			local v2536 = u31.screen_size() * 0.5
			local v2537 = indicators.accent_color:get()
			local v2538 = indicators.secondary_color:get()
			local v2539 = math.max(n68, n70)

			v2536.x = v8(v2536.x + v8(10 * n66))
			v2536.y = v2536.y + indicators.offset:get()
			v576(v2536, v2537, v2538, n65)
			v577(v2536, color(255, 255, 255, 255), n65)
			v578(v2536, v2539, n65)
			v579(v2536, n69, n65)
		end

		function t158.on_render()
			-- upvalues: v575 (copy), n65 (ref), v580 (copy)
			local v2540 = entity.get_local_player()

			if v2540 ~= nil then
				v575(v2540)

				if n65 > 0 then
					v580()
				end

				return
			end
		end

		local t159 = {}
		local n76 = 0
		local n77 = 0
		local n78 = 0
		local n79 = 0
		local u586 = false
		local u587 = false

		local function v588(p649)
			local v2542 = p649:get_override()

			if v2542 == nil then
				return p649:get()
			end

			return v2542
		end

		local v589 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots")
		local v590 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap")
		local v591 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck")

		local function v592(p650)
			-- upvalues: t29 (ref)
			if p650 ~= nil then
				if t29.antiaim.settings.manual_yaw.select:get() ~= "Off" then
					return false
				end

				return true
			end

			return false
		end
		local function v593(p651)
			-- upvalues: v588 (copy), v590 (copy), v589 (copy), u586 (ref), v592 (copy), u587 (ref), v591 (copy), n76 (ref), t14 (ref), n77 (ref), n78 (ref), n79 (ref)
			local v2545 = p651:is_alive()
			local v2546 = v588(v590)
			local v2547 = v588(v589)
			local n80 = 0

			if v2545 then
				n80 = 1
			end

			u586 = v592(p651)
			u587 = v588(v591)
			n76 = t14.interp(n76, n80, 0.05)
			n77 = t14.interp(n77, rage.exploit:get() == 1, 0.03)
			n78 = t14.interp(n78, v2547, 0.03)
			n79 = t14.interp(n79, v2546, 0.03)

			if not rage.exploit:get() then
				n77 = 0
			end
		end
		local function v594(p652, p653)
			-- upvalues: u586 (ref), u31 (ref), v8 (copy)
			local n81 = 1
			local v2552 = u586 and "てんしのような YAW" or "リセット YAW"
			local s29 = ""
			local v2554 = u31.measure_text(n81, s29, v2552)

			v8(v2554.x)

			local v2555 = v8(v2554.y)
			local t160 = {
				[1] = 218,
				[2] = 118,
				[3] = 0
			}
			local t161 = {
				[1] = 177,
				[2] = 151,
				[3] = 255
			}
			local v2558 = u586 and t160 or t161
			local v2559 = p652:clone()

			v8(v2559.x)
			u31.text(n81, vector(v2559.x, v2559.y), color(v2558[1], v2558[2], v2558[3], 255 * p653), s29, v2552)
			p652.y = p652.y + v2555
		end
		local function v595(p654, p655)
			-- upvalues: u586 (ref), u31 (ref), v8 (copy)
			local n82 = 1
			local v2563 = u586 and "どうてきな" or "デフォルト"
			local s30 = ""
			local v2565 = u31.measure_text(n82, s30, v2563)

			v8(v2565.x)

			local v2566 = v8(v2565.y)
			local t162 = {
				[1] = 209,
				[2] = 139,
				[3] = 230
			}
			local t163 = {
				[1] = 255,
				[2] = 0,
				[3] = 0
			}
			local v2569 = u586 and t162 or t163
			local v2570 = p654:clone()

			v2570.x = v8(v2570.x)
			u31.text(n82, vector(v2570.x, v2570.y), color(v2569[1], v2569[2], v2569[3], 255 * p655), s30, v2563)
			p654.y = p654.y + v2566
		end
		local function v596(p656, p657)
			-- upvalues: u587 (ref), u31 (ref), v8 (copy), n77 (ref), n79 (ref)
			local n83 = 1
			local v2574 = not u587 and "倍の" or "倍の (フェイクダック)"
			local s31 = ""
			local v2576 = u31.measure_text(n83, s31, v2574)

			v8(v2576.x)

			local v2577 = v8(v2576.y)
			local v2578 = n77 == 1 and {
				[1] = 0,
				[2] = 255,
				[3] = 0
			} or {
				[1] = 255,
				[2] = 0,
				[3] = 0
			}
			local v2579 = p656:clone()

			v2579.x = v8(v2579.x)
			u31.text(n83, vector(v2579.x, v2579.y), color(v2578[1], v2578[2], v2578[3], 255 * p657 * n79), s31, v2574)
			p656.y = p656.y + v2577
		end
		local function v597(p658, p659)
			-- upvalues: u587 (ref), u31 (ref), v8 (copy), n78 (ref)
			local n84 = 1
			local v2583 = not u587 and "アンチエイム" or "アンチエイム (フェイクダック)"
			local s32 = ""
			local v2585 = u31.measure_text(n84, s32, v2583)

			v8(v2585.x)

			local v2586 = v8(v2585.y)
			local v2587 = u587 and {
				[1] = 255,
				[2] = 0,
				[3] = 0
			} or {
				[1] = 209,
				[2] = 139,
				[3] = 230
			}
			local v2588 = p658:clone()

			v2588.x = v8(v2588.x)
			u31.text(n84, vector(v2588.x, v2588.y), color(v2587[1], v2587[2], v2587[3], 255 * p659 * n78), s32, v2583)
			p658.y = p658.y + v2586
		end
		local function v598()
			-- upvalues: u31 (ref), n79 (ref), n78 (ref), v588 (copy), v590 (copy), v589 (copy), v594 (copy), n76 (ref), v595 (copy), v596 (copy), v597 (copy)
			local v2589 = u31.screen_size() * 0.5

			math.max(n79, n78)

			local v2590 = v588(v590)
			local v2591 = v588(v589)

			v2589.y = v2589.y + 45
			v594(v2589, n76)
			v595(v2589, n76)

			if v2590 then
				v596(v2589, n76)
			end

			if v2591 and not v2590 then
				v597(v2589, n76)
			end
		end

		function t159.on_render()
			-- upvalues: v593 (copy), n76 (ref), v598 (copy)
			local v2592 = entity.get_local_player()

			if v2592 ~= nil then
				v593(v2592)

				if n76 > 0 then
					v598()
				end

				return
			end
		end

		local function v599(p660)
			-- upvalues: t155 (copy), t158 (copy), t159 (copy)
			local v2594 = p660 == 1
			local v2595 = p660 == 2
			local v2596 = p660 == 3

			events.render(t155.on_render, v2594)
			events.render(t158.on_render, v2595)
			events.render(t159.on_render, v2596)
		end
		local function v600(p661)
			-- upvalues: v599 (copy)
			v599(p661:get())
		end

		indicators.enabled:set_callback(function(p662)
			-- upvalues: v599 (copy), indicators (copy), v600 (copy)
			local v2599 = p662:get()

			if not v2599 then
				v599(nil)
			end

			if not v2599 then
				indicators.style:unset_callback(v600)
			else
				indicators.style:set_callback(v600, true)
			end
		end, true)
		solus_ui = t29.visuals.solus_ui

		local n85 = 5
		local n86 = 1

		function v604(p663, p664)
			local t164 = {}

			for i = 1, p664 do
				t164[i] = p663
			end

			return t164
		end

		function v605(p665, p666, p667)
			if p667 or p666 ~= p665[#p665] then
				table.insert(p665, p666)
				table.remove(p665, 1)
			end
		end

		function v606(p668)
			local n87 = 0
			local n88 = 0

			for _, v in pairs(p668) do
				n88 = n88 + v
				n87 = n87 + 1
			end

			return n88 / n87
		end

		local function v607(p669, p670, p671, p672, p673, ...)
			-- upvalues: u31 (ref)
			u31.rect(vector(p669, p670), vector(p669 + p671, p670 + p672), p673, ...)
		end
		local function v608(p674, p675, p676, p677, p678, p679, p680, ...)
			-- upvalues: u31 (ref)
			local v2624, v2625

			if not p680 then
				v2624 = p678
				v2625 = p678
				p678 = p679
			else
				v2625 = p678
				v2624 = p679
			end

			u31.gradient(vector(p674, p675), vector(p674 + p676, p675 + p677), v2625, v2624, p678, p679, ...)
		end

		function v609(p681, p682, p683, p684)
			-- upvalues: u31 (ref), n85 (copy), v607 (copy), n86 (copy), v608 (copy)
			local x = p681.x
			local y = p681.y
			local v2632 = p682.x - p681.x
			local v2633 = p682.y - p681.y
			local v2634 = p683:alpha_modulate(255 * p684)
			local v2635 = p683:alpha_modulate(50 * p684)

			u31.blur(p681, p682, 0.5, p684, n85)
			u31.rect(p681, p682, color(17, 17, 17, p683.a * p684), n85)
			v607(x + n85, y, v2632 - n85 * 2, n86, v2634)
			v607(x + n85, y + v2633 - n86, v2632 - n85 * 2, n86, v2635)
			u31.circle_outline(vector(x + n85, y + n85), v2634, n85 + 0.5, 180, 0.25, n86)
			u31.circle_outline(vector(x + v2632 - n85, y + n85), v2634, n85 + 0.5, 270, 0.25, n86)
			u31.circle_outline(vector(x + n85, y + v2633 - n85), v2635, n85 + 0.5, 90, 0.25, n86)
			u31.circle_outline(vector(x + v2632 - n85, y + v2633 - n85), v2635, n85 + 0.5, 0, 0.25, n86)
			v608(x, y + n85, n86, v2633 - n85 * 2, v2634, v2635, false)
			v608(x + v2632 - n86, y + n85, n86, v2633 - n85 * 2, v2634, v2635, false)
		end

		t165 = {}

		local n89 = 0

		local function v612()
			-- upvalues: solus_ui (copy)
			return solus_ui.enabled:get() and solus_ui.select:get("Watermark")
		end

		function t165.draw(p685)
			-- upvalues: n89 (ref), t14 (ref), v612 (copy), u31 (ref), v609 (copy), solus_ui (copy)
			local v2637 = p685:clone()

			n89 = t14.interp(n89, v612(), 0.05)

			if not (n89 <= 0) then
				local t166 = {}
				local v2639 = utils.net_channel()
				local v2640 = common.get_system_time()

				table.insert(t166, "angelwings")
				table.insert(t166, common.get_username())

				if v2639 ~= nil then
					table.insert(t166, string.format("delay: %dms", v2639.latency[1] * 1000))
				end

				if v2640 ~= nil then
					table.insert(t166, string.format("%02d:%02d:%02d", v2640.hours, v2640.minutes, v2640.seconds))
				end

				local n90 = 1
				local s33 = ""
				local v2643 = table.concat(t166, " | ")
				local v2644 = u31.measure_text(n90, s33, v2643)
				local v2645 = color(255, 255, 255, 255)
				local v2646 = v2644 + vector(10, 8)

				v2637.x = v2637.x - v2646.x
				v2645.a = v2645.a * n89
				v609(v2637, v2637 + v2646, solus_ui.color:get(), n89)
				u31.text(n90, v2637 + vector(5, 4), v2645, s33, v2643)
				p685.y = p685.y + (v2646.y + 10) * n89

				return
			end
		end

		t167 = {}

		local t168 = {}
		local n91 = 0
		local x = nil
		local v617 = vector(400, 340)
		local v618 = vector(120, 20)
		local v619 = u31.screen_size()
		local u620 = t19.new("spectators", v617, v618, {
			border = {
				vector(0, 0),
				v619:clone()
			}
		})

		function u620.update()
			-- upvalues: n91 (ref)
			return n91
		end

		local function v621()
			-- upvalues: solus_ui (copy)
			return solus_ui.enabled:get() and solus_ui.select:get("Spectators")
		end
		local function v622(p686)
			local m_iObserverMode = p686.m_iObserverMode

			if m_iObserverMode == 4 or m_iObserverMode == 5 then
				local m_hObserverTarget = p686.m_hObserverTarget

				if m_hObserverTarget ~= nil then
					return m_hObserverTarget:get_spectators()
				end
			end

			return p686:get_spectators()
		end
		local function v623(p687, p688)
			-- upvalues: v622 (copy), t168 (copy), u31 (ref), t14 (ref)
			local v2652 = entity.get_local_player()
			local t169 = {}
			local v2654 = false
			local n92 = 0

			if v2652 ~= nil then
				local v2656 = v622(v2652) or {}

				for _, v in pairs(v2656) do
					local v2659 = v:get_index()
					local v2660 = v:get_name()
					local v2661 = v:get_steam_avatar()

					v2654 = true
					t169[v2659] = v
					t168[v2659] = t168[v2659] or {
						alpha = 0,
						name_width = 0,
						name_height = 0,
						name = v2660,
						avatar = v2661
					}

					local v2662 = t168[v2659]
					local v2663 = u31.measure_text(p687, p688, v2660)

					v2662.name = v2660
					v2662.name_width = v2663.x
					v2662.name_height = v2663.y
				end
			end

			for k, v in pairs(t168) do
				local v2666 = t169[k] ~= nil

				v.alpha = t14.interp(v.alpha, v2666, 0.05)

				if not (v.alpha <= 0.01) then
					if (not (v.alpha <= 0) or v2666) and n92 < v.name_width then
						n92 = v.name_width
					end
				else
					t168[k] = nil
				end
			end

			return t168, v2654, n92
		end

		function t167.draw()
			-- upvalues: v623 (copy), v621 (copy), n91 (ref), t14 (ref), u620 (ref), x (ref), v609 (copy), solus_ui (copy), u31 (ref), v8 (copy)
			local n93 = 1
			local s34 = "c"
			local v2669, v2670, v2671 = v623(n93, s34)
			local v2672 = v621() and (v2670 or not (ui.get_alpha() <= 0))

			n91 = t14.interp(n91, v2672, 0.05)

			if not (n91 <= 0) then
				local v2673 = u620:get_drag_position():clone()
				local v2674 = math.max(66, v2671)
				local v2675 = vector(75 + v2674, 20)

				if x == nil then
					x = v2675.x
				end

				x = t14.interp(x, v2675.x, 0.033)
				v2675.x = math.floor(x)
				v609(v2673, v2673 + v2675, solus_ui.color:get(), n91)
				u31.text(n93, v2673 + v2675 / 2 - vector(0, 1), color(255, 255 * n91), s34, "spectators")

				local n94 = 0

				v2673.y = v2673.y + 3

				for _, v in pairs(v2669) do
					local name = v.name
					local avatar = v.avatar
					local v2681 = color(255, 255, 255, 255)
					local v2682 = n91 * v.alpha

					v2681.a = v2681.a * v2682

					local v2683 = vector(v.name_height, v.name_height)
					local v2684 = vector(v2673.x + 5, v2673.y + v2675.y)
					local v2685 = vector(v2673.x + v2675.x - 5 - v2683.x, v2673.y + v2675.y)

					u31.text(n93, v2684, v2681, "", name)

					if avatar ~= nil then
						u31.texture(avatar, v2685, v2683, v2681)
					end

					n94 = math.max(n94, v2682)
					v2675.y = v2675.y + v8(15 * v2682)
				end

				v2675.y = v2675.y + v8(3 * n94)
				u620.size = v2675
				u620()

				return
			end
		end

		t170 = {}

		local t171 = {}
		local n95 = 0
		local x2 = nil
		local v628 = vector(400, 200)
		local v629 = vector(120, 20)
		local v630 = u31.screen_size()
		local u631 = t19.new("hotkey_list", v628, v629, {
			border = {
				vector(0, 0),
				v630:clone()
			}
		})

		function u631.update()
			-- upvalues: n95 (ref)
			return n95
		end

		local function v632()
			-- upvalues: solus_ui (copy)
			return solus_ui.enabled:get() and solus_ui.select:get("Hotkey List")
		end
		local function v633(p689, p690)
			if next(p690) == nil then
				p690 = p689:get()

				if next(p690) == nil then
					p690 = p689:list()
				end
			end

			local t172 = {}

			for i = 1, #p690 do
				t172[#t172 + 1] = p690[i]:sub(1, 1)
			end

			return table.concat(t172, ", ")
		end
		local function v634(p691, p692, p693)
			-- upvalues: solus_ui (copy), v633 (copy)
			if type(p693) ~= "boolean" and not solus_ui.only_key_state:get() then
				if type(p693) ~= "table" then
					return tostring(p693)
				end

				return v633(p691, p693)
			end

			if p692 ~= 1 then
				if p692 ~= 2 then
					return "Enabled"
				end

				return "Toggled"
			end

			return "Holding"
		end
		local function v635(p694, p695)
			-- upvalues: v634 (copy), t171 (copy), u31 (ref), t14 (ref)
			local t173 = {}
			local v2696 = false
			local n96 = 0
			local n97 = 0

			for _, v in pairs(ui.get_binds()) do
				local v2701 = v.reference:id()
				local v2702 = string.format("[%s]", string.lower(v634(v.reference, v.mode, v.value)))
				local name = v.name

				if v.active then
					v2696 = true
					t173[v2701] = v
				end

				t171[v2701] = t171[v2701] or {
					value_width = 0,
					name_width = 0,
					height = 0,
					alpha = 0,
					name = name,
					mode = v.mode,
					value = v.value,
					reference = v.reference
				}

				local v2704 = t171[v2701]
				local v2705 = u31.measure_text(p694, p695, name)
				local v2706 = u31.measure_text(p694, p695, v2702)

				v2704.name = name
				v2704.value = v2702
				v2704.mode = v.mode
				v2704.reference = v.reference
				v2704.height = math.max(v2705.y, v2706.y)
				v2704.name_width = v2705.x
				v2704.value_width = v2706.x
			end

			for k, v in pairs(t171) do
				local v2709 = t173[k] ~= nil

				v.alpha = t14.interp(v.alpha, v2709, 0.05)

				if not (v.alpha <= 0.01) then
					if not (v.alpha <= 0) or v2709 then
						if n96 < v.name_width then
							n96 = v.name_width
						end

						if n97 < v.value_width then
							n97 = v.value_width
						end
					end
				else
					t171[k] = nil
				end
			end

			return t171, v2696, n96, n97
		end

		function t170.draw()
			-- upvalues: v635 (copy), v632 (copy), n95 (ref), t14 (ref), u631 (ref), x2 (ref), v609 (copy), solus_ui (copy), u31 (ref), v8 (copy)
			local n98 = 1
			local s35 = "c"
			local v2712, v2713, v2714 = v635(n98, s35)
			local v2715 = v632() and (v2713 or not (ui.get_alpha() <= 0))

			n95 = t14.interp(n95, v2715, 0.033)

			if not (n95 <= 0) then
				local v2716 = u631:get_drag_position():clone()
				local v2717 = math.max(66, v2714)
				local v2718 = vector(75 + v2717, 20)

				if x2 == nil then
					x2 = v2718.x
				end

				x2 = t14.interp(x2, v2718.x, 0.035)
				v2718.x = math.floor(x2)
				v609(v2716, v2716 + v2718, solus_ui.color:get(), n95)
				u31.text(n98, v2716 + v2718 / 2 - vector(0, 1), color(255, 255 * n95), s35, "keybinds")

				local n99 = 0

				v2716.y = v2716.y + 3

				for _, v in pairs(v2712) do
					local v2722 = v
					local name = v2722.name
					local value = v2722.value
					local v2725 = color(255, 255, 255, 255)
					local v2726 = v2722.alpha * n95

					v2725.a = v2725.a * v2726

					local v2727 = vector(v2716.x + 5, v2716.y + v2718.y)
					local v2728 = vector(v2716.x + v2718.x - 5, v2716.y + v2718.y)

					u31.text(n98, v2727, v2725, "", name)
					u31.text(n98, v2728, v2725, "r", value)
					n99 = math.max(n99, v2722.alpha)
					v2718.y = v2718.y + v8(15 * v2722.alpha)
				end

				v2718.y = v2718.y + v8(3 * n99)
				u631.size = v2718
				u631()

				return
			end
		end
	end

	local t174 = {}
	local n100 = 0
	local n101 = 0
	local n102 = 0
	local v640 = v604(0, 2)
	local v641 = v604(0, 3)
	local n103 = 0
	local n104 = 0
	local n105 = 0
	local n106 = 0
	local n107 = 0
	local n108 = 0
	local u648 = vector()
	local u649 = false
	local u650 = false

	local function v651()
		-- upvalues: solus_ui (copy)
		return solus_ui.enabled:get() and solus_ui.select:get("Anti-aimbot indication")
	end
	local function v652()
		local v2729 = rage.antiaim:get_max_desync()
		local v2730 = rage.antiaim:get_rotation(false)
		local v2731 = rage.antiaim:get_rotation(true)
		local v2732 = math.normalize_yaw(v2731 - v2730)

		return math.clamp(v2732, -v2729, v2729)
	end
	local function v653()
		-- upvalues: n106 (ref)
		local v2733 = n106

		if tonumber(v2733) < 10 then
			v2733 = "  " .. v2733
		end

		return string.format("FL: %s", v2733)
	end
	local function v654()
		-- upvalues: u649 (ref), n102 (ref), t14 (ref), n101 (ref), u650 (ref)
		if not u649 then
			if not u650 then
				n101 = t14.interp(n101, false, 0.05)
				n102 = t14.interp(n102, false, 0.05)

				return
			end

			n101 = t14.interp(n101, false, 0.05)

			local v2734 = not (n101 > 0.01)

			n102 = t14.interp(n102, v2734, 0.05)

			return
		end

		n102 = t14.interp(n102, false, 0.05)

		local v2735 = not (n102 > 0.01)

		n101 = t14.interp(n101, v2735, 0.05)
	end

	function t174.draw(p696)
		-- upvalues: v651 (copy), n100 (ref), t14 (ref), v654 (copy), solus_ui (copy), v653 (copy), v606 (copy), v641 (copy), n108 (ref), n104 (ref), n105 (ref), n103 (ref), u650 (ref), u31 (ref), n101 (ref), n102 (ref), v609 (copy), v640 (copy)
		local v2740 = p696:clone()
		local v2741 = entity.get_local_player()
		local v2742 = v651() and (v2741 ~= nil and v2741:is_alive())

		n100 = t14.interp(n100, v2742, 0.05)
		v654()

		if not (n100 <= 0) then
			local n109 = 1
			local s36 = ""
			local v2745 = solus_ui.color:get()
			local v2746 = v653()
			local v2747 = globals.frametime * 3.75
			local v2748 = 1200 + math.max(0, v606(v641) - 3800)
			local v2749 = math.abs(math.min(n108 - 3800, v2748) / v2748 * 100)

			if v2749 ~= n104 and n105 < globals.realtime then
				n105 = globals.realtime + 0.005
				n104 = n104 + (v2749 < n104 and -1 or 1)
			end

			n103 = n103 + (u650 and v2747 or -v2747)
			n103 = n103 > 1 and 1 or n103
			n103 = n103 < 0 and 0 or n103

			local s37 = " | SHIFTING"
			local v2751 = u31.measure_text(n109, s36, s37)
			local v2752 = " | dst: " .. string.rep(" ", 10)
			local v2753 = u31.measure_text(n109, s36, v2752)
			local v2754 = u31.measure_text(n109, s36, v2746)
			local v2755 = color(255, 255, 255, 255)
			local v2756 = vector(v2754.x + 8, 17)

			v2756.x = v2756.x + v2751.x * n101
			v2756.x = v2756.x + v2753.x * n102
			v2740.x = v2740.x - v2756.x
			v2755.a = v2755.a * n100

			local v2757 = vector(v2740.x + 4, v2740.y + 2)

			v609(v2740, v2740 + v2756, solus_ui.color:get(), n100)
			u31.text(n109, v2757, v2755, s36, v2746)
			v2757.x = v2757.x + v2754.x

			if n101 > 0 then
				local v2758 = v2755:clone()

				v2758.a = v2758.a * math.map(n101, 0.9, 1, 0, 1)
				u31.text(n109, v2757, v2758, s36, s37)
			end

			if n102 > 0 then
				local v2759 = v2755:clone()
				local v2760 = math.map(n102, 0.9, 1, 0, 1)

				v2759.a = v2759.a * v2760

				local v2761 = u31.measure_text(n109, s36, " | dst: ")
				local v2762 = vector(v2757.x + v2761.x + 2, v2757.y + 4)
				local v2763 = v2762 + vector(math.min(100, n104) / 100 * 24, 5)
				local v2764 = v2745:clone()
				local v2765 = v2745:clone()

				v2764.a = 220 * n103 * v2760 * n100
				v2765.a = 25 * n103 * v2760 * n100
				u31.text(n109, v2757, v2759, s36, v2752)
				u31.gradient(v2762, v2763, v2764, v2765, v2764, v2765)
			end

			local v2766 = string.format("FAKE (%.1f°)", v606(v640))
			local v2767 = u31.measure_text(n109, s36, v2766)
			local v2768 = vector(v2767.x + 8, 18)

			v2740.x = v2740.x - v2768.x - 4
			v609(v2740, v2740 + v2768, solus_ui.color:get(), n100)
			u31.text(n109, v2740 + vector(4, 2), v2755, s36, v2766)
			p696.y = p696.y + (v2768.y + 10) * n100

			return
		end
	end

	events.createmove(function(p697)
		-- upvalues: u648 (ref), n108 (ref), v605 (copy), v641 (copy), v640 (copy), v652 (copy), n106 (ref), n107 (ref), u649 (ref), u650 (ref), v606 (copy)
		local v2737 = entity.get_local_player()

		if v2737 ~= nil then
			if p697.choked_commands == 0 then
				local m_vecOrigin = v2737.m_vecOrigin

				if u648 ~= nil then
					n108 = (m_vecOrigin - u648):length2dsqr()
					v605(v641, n108, true)
				end

				v605(v640, math.abs(v652()), true)
				n106 = n107
				u648 = m_vecOrigin
			end

			u649 = rage.exploit:get() == 1
			u650 = not (v606(v641) <= 3200)
			n107 = p697.choked_commands

			return
		end
	end)

	local t175 = {}
	local v656 = (function()
		-- upvalues: u31 (ref)
		return {
			draw = function(_, p699, p700, p701, p702, p703, p704)
				-- upvalues: u31 (ref)
				local clr_1 = p703.clr_1
				local n110 = 0
				local v3534 = p701 - p700

				p703.h = p703.h - p703.thickness

				if p704 then
					u31.rect_outline(vector(p703.x, p703.y),
						vector(p703.x + p703.w - 1, p703.y + p703.h - 1 + p703.thickness), clr_1)
				end

				if n110 ~= v3534 then
					local v3535 = p703.w / (p702 - 1)
					local v3536 = v3534 - n110

					for i = 1, p702 - 1 do
						local v3538 = vector((p699[i] - p700) / v3536, (p699[i + 1] - p700) / v3536)
						local t176 = {
							vector(p703.x + v3535 * (i - 1), p703.y + p703.h - p703.h * v3538.x),
							vector(p703.x + v3535 * i, p703.y + p703.h - p703.h * v3538.y)
						}

						for j = 1, p703.thickness do
							u31.line(vector(t176[1].x, t176[1].y + j - 1), vector(t176[2].x, t176[2].y + j - 1), clr_1)
						end
					end

					return
				end

				u31.line(vector(p703.x, p703.y + p703.h), vector(p703.x + p703.w, p703.y + p703.h), clr_1)
			end,
			draw_histogram = function(_, p706, p707, p708, p709, p710, p711)
				-- upvalues: u31 (ref)
				local v3548 = p708 - p707

				if p711 then
					u31.rect_outline(vector(p710.x, p710.y), vector(p710.x + p710.w - 1, p710.y + p710.h - 1),
						color(255, 255, 255, 255))
				end

				local v3549 = p710.w / (p709 - 1)
				local v3550 = v3548 - 0

				for i = 1, p709 - 1 do
					local v3552 = vector((p706[i] - p707) / v3550, (p706[i + 1] - p707) / v3550)
					local t177 = {
						[1] = vector(math.floor(p710.x + v3549 * (i - 1)), math.floor(p710.y + p710.h - p710.h * v3552.x)),
						[2] = vector(math.floor(p710.x + v3549 * i), math.floor(p710.y + p710.h)),
						isZero = math.floor(p710.y + p710.h) == math.floor(p710.y + p710.h - p710.h * v3552.x)
					}

					if p710.draw_bar ~= "fill" then
						if p710.draw_bar ~= "gradient_fadeout" then
							if p710.draw_bar == "gradient_fadein" then
								local v3554 = p710.clr_1:clone()
								local v3555 = p710.clr_1:clone()

								v3555.a = 0
								u31.gradient(t177[1], t177[2], v3555, v3555, v3554, v3554)
							end
						else
							local v3556 = p710.clr_1:clone()
							local v3557 = p710.clr_1:clone()

							v3557.a = 0
							u31.gradient(t177[1], t177[2], v3556, v3556, v3557, v3557)
						end
					else
						u31.rect(t177[1], t177[2], p710.clr_1)
					end

					if p710.draw_peeks and not t177.isZero then
						u31.line(t177[1], t177[2], p710.clr_2)
					end
				end
			end
		}
	end)()

	local function v657(p712)
		if not (p712 < 1) then
			if not (p712 < 10) then
				return ("%d"):format(p712)
			end

			return ("%.1f"):format(p712)
		end

		return ("%.2f"):format(p712)
	end

	pcall(ffi.cdef,
		"                bool EnumDisplaySettingsA(\n                    unsigned int  lpszDeviceName,\n                    unsigned long iModeNum,\n                    void*         lpDevMode\n                );\n            ")

	local v658 = ffi.typeof(
		"                struct {\n                    char pad_0[120];\n                    unsigned long dmDisplayFrequency;\n                    char pad_1[32];\n                }\n            ")()

	ffi.C.EnumDisplaySettingsA(0, -1, v658)

	local n111 = 0
	local u660 = common.get_timestamp()
	local v661 = v604(0, 90)
	local v662 = v604(0, 30)
	local n112 = 0
	local n113 = 0

	local function v665()
		-- upvalues: solus_ui (copy)
		return solus_ui.enabled:get() and solus_ui.select:get("Frequency update information")
	end
	local function v666()
		-- upvalues: n112 (ref), v605 (copy), v662 (copy), n113 (ref)
		n112 = 0.9 * n112 + 0.09999999999999998 * globals.absoluteframetime
		v605(v662, math.abs(n113 - 1 / n112), true)
		n113 = 1 / n112
	end

	function t175.draw(p713)
		-- upvalues: v666 (copy), v665 (copy), n111 (ref), t14 (ref), solus_ui (copy), v606 (copy), v661 (copy), v658 (copy), v657 (copy), u31 (ref), v609 (copy), v662 (copy), v656 (copy)
		v666()

		local v2772 = p713:clone()
		local v2773 = v665()

		n111 = t14.interp(n111, v2773, 0.05)

		if not (n111 <= 0) then
			local n114 = 1
			local s38 = ""
			local v2776 = solus_ui.color:get()
			local v2777 = v606(v661)
			local num = tonumber(v658.dmDisplayFrequency)
			local v2779 = string.format("%sms / %dhz", v657(v2777), num)
			local v2780 = u31.measure_text(n114, s38, v2779)
			local v2781 = color(255, 255, 255, 255)
			local v2782 = vector(v2780.x + 8, 18)

			v2772.x = v2772.x - v2782.x
			v2781.a = v2781.a * n111
			v609(v2772, v2772 + v2782, solus_ui.color:get(), n111)
			u31.text(n114, vector(v2772.x + 4, v2772.y + 2), v2781, s38, v2779)

			local s39 = "IO | "
			local v2784 = u31.measure_text(n114, s38, s39)
			local v2785 = s39 .. "       "
			local v2786 = u31.measure_text(n114, s38, v2785)
			local v2787 = v2784.x + 4
			local v2788 = vector(v2786.x + 8, 18)
			local t178 = {
				[1] = nil,
				[2] = 1,
				[3] = 3,
				[4] = nil,
				[5] = 0,
				[1] = v2777,
				[4] = v606(v662) / 4
			}

			math.min(unpack(t178))

			local v2790 = math.max(unpack(t178))

			v2772.x = v2772.x - v2788.x

			local v2791 = vector(v2772.x - 4, v2772.y)

			v609(v2791, v2791 + v2788, solus_ui.color:get(), n111)
			u31.text(n114, v2772 + vector(0, 2), v2781, s38, v2785)
			v656:draw_histogram(t178, 0, v2790, #t178, {
				draw_bar = "gradient_fadein",
				draw_peeks = false,
				thickness = 1,
				x = v2772.x - 4 + v2787,
				y = v2772.y + 4,
				w = v2788.x - v2787 - 4,
				h = v2788.y - 8,
				clr_1 = v2776:alpha_modulate(255 * n111),
				clr_2 = color(0, 127, 255, 255 * n111)
			}, false)

			return
		end
	end

	events.pre_render(function()
		-- upvalues: u660 (ref)
		u660 = common.get_timestamp()
	end)
	events.post_render(function()
		-- upvalues: u660 (ref), v605 (copy), v661 (copy)
		local v2770 = common.get_timestamp() - u660

		v605(v661, v2770)
	end)
	events.render(function()
		-- upvalues: u31 (ref), t165 (copy), t167 (copy), t170 (copy), t174 (copy), t175 (copy)
		local v2792 = u31.screen_size()
		local v2793 = vector(v2792.x - 10, 10)

		t165.draw(v2793)
		t167.draw()
		t170.draw()
		t174.draw(v2793)
		t175.draw(v2793)
	end)

	local watermark = t29.visuals.watermark
	local t179 = {}
	local v669 = string.format("%s\a%%s.PINK", string.upper(t1.name))
	local v670 = string.format("VICTIM - %s [\a%%s%s\a%%s]", string.upper(t1.user), string.upper(t1.build))

	function t179.on_render()
		-- upvalues: watermark (copy), u31 (ref), v669 (copy), v670 (copy), t25 (ref)
		local v2794 = watermark.color:get():alpha_modulate(255)
		local v2795 = color()
		local v2796 = v2794:to_hex()
		local v2797 = v2795:to_hex()
		local v2798 = u31.screen_size()
		local n115 = 2
		local s40 = ""
		local t180 = {
			string.format(v669, v2796),
			string.format(v670, v2796, v2797)
		}
		local v2802 = vector(8, v2798.y / 2)

		if t25.eva_small ~= nil then
			local v2803 = vector(35, 35)
			local v2804 = color(255, 255, 255)

			u31.texture(t25.eva_small, v2802, v2803, v2804, "f")
			v2802.x = v2802.x + v2803.x - 4
			v2802.y = v2802.y + v2803.y + 1
		end

		local v2805 = u31.measure_text(n115, s40, t180[1])
		local v2806 = u31.measure_text(n115, s40, t180[2])

		v2805.y = v2805.y - 2
		v2806.y = v2806.y - 2
		v2802.y = v2802.y - v2806.y
		u31.text(n115, v2802, v2795, s40, t180[2])
		v2802.y = v2802.y - (v2805.y - 2)
		u31.text(n115, v2802, v2795, s40, t180[1])
	end

	local t181 = {}
	local n116 = 1
	local n117 = 3
	local n118 = 3
	local n119 = 34
	local n120 = 5
	local v677 = utils.get_vfunc("steamclient.dll", "SteamClient017", 2, "int(__thiscall*)(void*, int)")
	local v678 = utils.get_vfunc("steamclient.dll", "SteamClient017", 8,
		"int*(__thiscall*)(void*, int, int, const char*)")
	local v679 = utils.get_vfunc("steamclient.dll", "SteamClient017", 9, "int*(__thiscall*)(void*, int, const char*)")
	local v680 = utils.get_vfunc(35, "int(__thiscall*)(void*, uint64_t)")
	local v681 = utils.get_vfunc(5, "bool(__thiscall*)(void*, int, uint32_t*, uint32_t*)")
	local v682 = utils.get_vfunc(6, "bool(__thiscall*)(void*, int, unsigned char*, int)")
	local v683 = v678(v677(n116), n116, "SteamFriends015")
	local v684 = v679(n116, "SteamUtils009")
	local v685 = string.format("\a%%s%s\a%%s.pink", string.lower(t1.name))
	local v686 = string.format("build: \a%%s%s", string.lower(t1.build))
	local v687 = string.format("user: \a%%s%s", t1.user)
	local v688 = (function(p714)
		-- upvalues: v680 (copy), v683 (copy), v681 (copy), v684 (copy), v682 (copy), u31 (ref)
		local v2810 = v680(v683, p714)

		if not (v2810 <= 0) then
			local v2811 = ffi.new("unsigned int[?]", 1)
			local v2812 = ffi.new("unsigned int[?]", 1)

			if v681(v684, v2810, v2811, v2812) then
				local v2813 = v2811[0] * v2812[0] * 4
				local v2814 = ffi.new("unsigned char[?]", v2813)

				if v682(v684, v2810, v2814, v2813) then
					local v2815 = ffi.string(v2814, v2813)
					local v2816 = vector(v2811[0], v2812[0])

					return u31.load_image_rgba(v2815, v2816), v2816
				end

				return nil
			end

			return nil
		end

		return nil
	end)((function()
		local MyPersonaAPI = panorama.MyPersonaAPI

		if MyPersonaAPI ~= nil then
			local v2808 = MyPersonaAPI.GetXuid()

			return 76500000000000000ULL + tonumber(v2808:sub(4, -1))
		end

		return 0ULL
	end)())

	function t181.on_render()
		if v688 ~= nil then
			local v2817 = watermark.color:get():alpha_modulate(255)
			local v2818 = color()
			local v2819 = v2817:to_hex()
			local v2820 = v2818:to_hex()
			local v2821 = u31.screen_size()
			local v2822 = vector(v2821.x, 0)
			local n121 = 4
			local s41 = ""
			local v2825 = string.format(v685, v2819, v2820)
			local n122 = 1
			local s42 = ""
			local v2828 = string.format(v686, v2819)
			local n123 = 1
			local s43 = ""
			local v2831 = string.format(v687, v2819)
			local v2832 = u31.measure_text(n121, s41, v2825)
			local v2833 = u31.measure_text(n122, s42, v2828)
			local v2834 = u31.measure_text(n123, s43, v2831)
			local v2835 = vector(n117, n118) * 2 +
				vector(math.max(v2832.x, v2833.x, v2834.x) + n119 + n120, math.max(v2832.y + v2833.y + v2834.y, n119))
			local v2836 = v2835 + vector(10, 0)
			local v2837 = v2822 + vector(-(n117 + n119), (v2835.y - n119) / 2)
			local v2838 = v2822 + vector(-v2836.x, 0)

			u31.gradient(v2838, v2838 + v2836, v2817:alpha_modulate(0), v2817:alpha_modulate(220),
				v2817:alpha_modulate(0), v2817:alpha_modulate(220))
			u31.texture(v688, v2837, vector(n119, n119), color(), "f")

			local v2839 = v2822 + vector(-v2835.x + n117, n118)

			u31.text(n121, v2839, v2818, s41, v2825)
			v2839.y = v2839.y + v2832.y
			u31.text(n122, v2839, v2818, s42, v2828)
			v2839.y = v2839.y + v2833.y
			u31.text(n123, v2839, v2818, s43, v2831)
			v2839.y = v2839.y + v2834.y

			return
		end
	end

	local function v689(p715)
		if p715 == nil then
			p715 = {}
		end

		events.render(t179.on_render, p715.branded == true)
		events.render(t181.on_render, p715.corner == true)
	end
	local function v690(p716)
		v689({
			branded = p716:get("Branded"),
			corner = p716:get("Corner")
		})
	end

	watermark.enabled:set_callback(function(p717)
		local v2843 = p717:get()

		if not v2843 then
			v689(nil)
		end

		if not v2843 then
			watermark.style:unset_callback(v690)
		else
			watermark.style:set_callback(v690, true)
		end
	end, true)

	local manual_arrows = t29.visuals.manual_arrows
	local manual_yaw = t29.antiaim.settings.manual_yaw
	local v693 = u31.load_font("C:\\Windows\\Fonts\\verdana.ttf", vector(16, 16.5, 0), "a")
	local v694 = u31.load_font("C:\\Windows\\Fonts\\calibrib.ttf", vector(25, 23.5, 0), "a")
	local n124 = 0
	local n125 = 0

	local function v697(p718, p719, p720)
		return p718 + p719 * vector():angles(vector(0, p720, 0))
	end
	local function v698()
		if manual_arrows.dynamic_mode:get() then
			local v2847 = manual_arrows.style:get()

			if v2847 == 1 or v2847 == 4 then
				local v2848 = entity.get_local_player()
				local v2849 = entity.get_threat()

				if v2848 ~= nil and v2849 ~= nil then
					local v2850 = u31.camera_angles()
					local m_angEyeAngles = v2849.m_angEyeAngles
					local v2852 = v2848:get_origin()
					local v2853 = v2849:get_origin()
					local v2854 = v697(v2852, 50, v2850.y + 110)
					local v2855 = v697(v2852, 30, v2850.y + 60)
					local v2856 = v697(v2852, 50, v2850.y - 110)
					local v2857 = v697(v2852, 30, v2850.y - 60)
					local v2858 = v697(v2853, 40, m_angEyeAngles.y + 115)
					local v2859 = v697(v2853, 20, m_angEyeAngles.y + 35)
					local v2860 = v697(v2853, 40, m_angEyeAngles.y - 115)
					local v2861 = v697(v2853, 20, m_angEyeAngles.y - 35)
					local v2862 = utils.trace_bullet(v2849, vector(v2858.x, v2858.y, v2858.z + 70), v2854)
					local v2863 = utils.trace_bullet(v2849, vector(v2859.x, v2859.y, v2859.z + 30), v2855)
					local v2864 = utils.trace_bullet(v2849, vector(v2860.x, v2860.y, v2860.z + 70), v2856)
					local v2865 = utils.trace_bullet(v2849, vector(v2861.x, v2861.y, v2861.z + 30), v2857)
					local n126 = 0

					if v2862 == 0 then
						if not (v2865 > 0) then
							if v2864 > 0 then
								n126 = 1
							end
						else
							n126 = 2
						end
					end

					if v2864 == 0 then
						if not (v2863 > 0) then
							if v2862 > 0 then
								n126 = -1
							end
						else
							n126 = -2
						end
					end

					return n126
				end

				return 0
			end

			return 0
		end

		return 0
	end
	local function v699()
		-- upvalues: manual_yaw (copy)
		return manual_yaw.select:get()
	end
	local function v700()
		-- upvalues: n125 (ref), v698 (copy)
		n125 = v698()
	end
	local function v701()
		-- upvalues: manual_arrows (copy), v699 (copy), n125 (ref), u31 (ref), n124 (ref), t14 (ref), v694 (copy), v8 (copy), v693 (copy)
		local v2867 = entity.get_local_player()

		if v2867 ~= nil and v2867:is_alive() then
			local v2868 = manual_arrows.style:get()
			local v2869 = manual_arrows.offset:get()
			local v2870 = manual_arrows.accent_color:get()
			local v2871 = manual_arrows.secondary_color:get()
			local v2872 = v699()
			local v2873 = rage.antiaim:inverter()
			local v2874 = v2872 == "Left" or not (n125 >= 0)
			local v2875 = v2872 == "Right" or not (n125 <= 0)
			local m_bIsScoped = v2867.m_bIsScoped
			local v2877 = u31.screen_size()
			local v2878, v2879 = vector(v2877.x / 2, v2877.y / 2):unpack()
			local v2880 = v2872 ~= nil and v2872 ~= "Off"

			n124 = t14.interp(n124, m_bIsScoped and manual_arrows.animate_scope:get(), 0.05)

			if v2880 or n125 ~= 0 then
				if v2868 == 1 then
					local v2881 = v694
					local s44 = "+"
					local v2883 = n125 == -2 and "<<" or "<"
					local v2884 = n125 == 2 and ">>" or ">"
					local v2885 = u31.measure_text(v2881, s44, v2883)
					local v2886 = u31.measure_text(v2881, s44, v2884)
					local v2887 = v2874 and v2870 or v2871
					local v2888 = v2875 and v2870 or v2871
					local v2889 = vector(v2878 - v2869, v2879 + 1 - v2885.y * 0.5)
					local v2890 = vector(v2878 + v2869, v2879 + 1 - v2886.y * 0.5)

					v2889.x = v2889.x - v2885.x
					u31.text(v2881, v2889, v2887, s44, v2883)
					u31.text(v2881, v2890, v2888, s44, v2884)
				end

				if v2868 == 3 then
					local v2891 = v694
					local s45 = "+"
					local s46 = "\239\132\132"
					local s47 = "\239\132\133"
					local v2895 = u31.measure_text(v2891, s45, s46)
					local v2896 = u31.measure_text(v2891, s45, s47)
					local v2897 = v2874 and v2870 or v2871
					local v2898 = v2875 and v2870 or v2871
					local v2899 = v8(20 * n124)
					local v2900 = v8(20 * n124)

					v2897.a = v2897.a - v2897.a * (0.4 * n124)
					v2898.a = v2898.a - v2898.a * (0.4 * n124)

					local v2901 = vector(v2878 - v2869 - v2899, v2879 - v2895.y * 0.4)
					local v2902 = vector(v2878 + v2869 + v2900, v2879 - v2896.y * 0.4)

					v2901.x = v2901.x - v2895.x
					u31.text(v2891, v2901, v2897, s45, s46)
					u31.text(v2891, v2902, v2898, s45, s47)
				end

				if v2868 == 4 then
					local v2903 = v693
					local s48 = ""
					local v2905 = n125 == -2 and "❮❮" or "❮"
					local v2906 = n125 == 2 and "❯❯" or "❯"
					local v2907 = u31.measure_text(v2903, s48, v2905)
					local v2908 = u31.measure_text(v2903, s48, v2906)
					local v2909 = v2874 and v2870 or v2871
					local v2910 = v2875 and v2870 or v2871
					local v2911 = vector(v2878 - v2869, v2879 - v2907.y * 0.5)
					local v2912 = vector(v2878 + v2869, v2879 - v2908.y * 0.5)

					v2911.x = v2911.x - v2907.x
					u31.text(v2903, v2911, v2909, s48, v2905)
					u31.text(v2903, v2912, v2910, s48, v2906)
				end
			end

			if v2868 == 2 then
				local n127 = 2
				local n128 = 13
				local n129 = 9
				local v2916 = color(35, 35, 35, 150)
				local v2917 = v2874 and v2870 or v2916
				local v2918 = v2875 and v2870 or v2916
				local v2919 = v2873 == true and v2871 or v2916
				local v2920 = v2873 == false and v2871 or v2916
				local v2921 = v2878 - v2869 - n128
				local v2922 = v2878 + v2869 + n128
				local v2923 = vector(v2921 + n127 + 2, v2879 - n129)
				local v2924 = vector(v2922 - n127 - 2, v2879 - n129)
				local v2925 = vector(-n127, n129 * 2)
				local v2926 = vector(n127, n129 * 2)

				u31.poly(v2917, vector(v2921 + 1 - n128, v2879), vector(v2921 + 1, v2879 - n129),
					vector(v2921 + 1, v2879 + n129))
				u31.poly(v2918, vector(v2922 + n128, v2879), vector(v2922, v2879 - n129), vector(v2922, v2879 + n129))
				u31.rect(v2923, v2923 + v2925, v2919)
				u31.rect(v2924, v2924 + v2926, v2920)
			end

			return
		end
	end

	manual_arrows.enabled:set_callback(function(p721)
		-- upvalues: v701 (copy), v700 (copy)
		local v2928 = p721:get()

		events.render(v701, v2928)
		events.createmove(v700, v2928)
	end, true)

	local custom_scope = t29.visuals.custom_scope
	local n130 = 0.000925925925925926
	local v704 = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
	local n131 = 0

	local function v706()
		-- upvalues: n131 (ref), t14 (ref), u31 (ref), custom_scope (copy), n130 (copy), v8 (copy)
		local v2929 = entity.get_local_player()

		if v2929 ~= nil and v2929:is_alive() then
			local v2930 = v2929:get_player_weapon()

			if v2930 ~= nil then
				n131 = t14.interp(n131, v2929.m_bIsScoped, 0.05)

				if n131 ~= 0 then
					local v2931 = u31.screen_size()
					local v2932 = v2931 * 0.5
					local v2933 = custom_scope.accent_color:get()
					local v2934 = custom_scope.secondary_color:get()
					local v2935 = custom_scope.offset:get() * v2931.y * n130
					local v2936 = custom_scope.position:get() * v2931.y * n130
					local v2937 = custom_scope.thickness:get()
					local v2938 = custom_scope.extra_options:get("Rotate Angle")

					if custom_scope.extra_options:get("Dynamic Offset") then
						local v2939 = v2930:get_spread()
						local v2940 = (v2930:get_inaccuracy() + v2939) * 360

						v2935 = v2935 + v2940
						v2936 = v2936 + v2940
					end

					local v2941 = v8(v2935)
					local v2942 = v8(v2936)

					v2933.a = v2933.a * n131
					v2934.a = v2934.a * n131

					if v2938 then
						u31.push_rotation(45)
					end

					if not custom_scope.exclude_lines:get("Top") then
						local v2943 = vector(v2932.x + 0.5 - v2937 * 0.5, v2932.y - v2941 + 1)
						local v2944 = vector(v2932.x + 0.5 + v2937 * 0.5, v2932.y - v2942 + 1)

						u31.gradient(v2943, v2944, v2933, v2933, v2934, v2934)
					end

					if not custom_scope.exclude_lines:get("Bottom") then
						local v2945 = vector(v2932.x + 0.5 - v2937 * 0.5, v2932.y + v2941)
						local v2946 = vector(v2932.x + 0.5 + v2937 * 0.5, v2932.y + v2942)

						u31.gradient(v2945, v2946, v2933, v2933, v2934, v2934)
					end

					if not custom_scope.exclude_lines:get("Left") then
						local v2947 = vector(v2932.x - v2941 + 1, v2932.y + 0.5 - v2937 * 0.5)
						local v2948 = vector(v2932.x - v2942 + 1, v2932.y + 0.5 + v2937 * 0.5)

						u31.gradient(v2947, v2948, v2933, v2934, v2933, v2934)
					end

					if not custom_scope.exclude_lines:get("Right") then
						local v2949 = vector(v2932.x + v2941, v2932.y + 0.5 - v2937 * 0.5)
						local v2950 = vector(v2932.x + v2942, v2932.y + 0.5 + v2937 * 0.5)

						u31.gradient(v2949, v2950, v2933, v2934, v2933, v2934)
					end

					if v2938 then
						u31.pop_rotation()
					end

					return
				end

				return
			end

			return
		end
	end
	local function v707()
		-- upvalues: v704 (copy)
		v704:override()
	end
	local function v708(p722)
		-- upvalues: v704 (copy), v706 (copy), v707 (copy)
		if not p722 then
			v704:override()
		end

		events.render(v706, p722)
		events.shutdown(v707, p722)
	end

	custom_scope.enabled:set_callback(function(p723)
		-- upvalues: v704 (copy), v708 (copy)
		local v2953 = p723:get()

		if v2953 then
			v704:override("Remove All")
		end

		v708(v2953)
	end, true)

	local damage_indicator = t29.visuals.damage_indicator
	local t182 = {
		Default = 1,
		Alternative = 2
	}

	local function v711()
		-- upvalues: t3 (ref)
		local v2954 = t3.ragebot.selection.min_damage:get()

		if v2954 ~= 0 then
			if not (v2954 > 100) then
				return v2954
			end

			return string.format("+%d", v2954 - 100)
		end

		return "A"
	end
	local function v712()
		-- upvalues: t100 (ref), t3 (ref), damage_indicator (copy), u31 (ref), t182 (copy), v711 (copy)
		local v2955 = entity.get_local_player()

		if v2955 ~= nil and v2955:is_alive() then
			local v2956 = t100.get(t3.ragebot.selection.min_damage)

			if v2956 ~= nil and v2956.active or not damage_indicator.if_override:get() then
				local v2957 = v2956 ~= nil and (v2956.active and damage_indicator.active_color:get()) or
					damage_indicator.inactive_color:get()
				local v2958 = (u31.screen_size() / 2):clone()
				local v2959 = t182[damage_indicator.font:get()]

				if v2959 ~= nil then
					local v2960 = damage_indicator.offset:get()
					local s49 = ""
					local v2962 = v711()
					local v2963 = u31.measure_text(v2959, s49, v2962)

					v2958.x = v2958.x + v2960 + 2
					v2958.y = v2958.y - v2960
					v2958.y = v2958.y - v2963.y
					u31.text(v2959, v2958, v2957, s49, v2962)

					return
				end

				return
			end

			return
		end
	end
	local function v713(p724)
		-- upvalues: v712 (copy)
		events.render(v712, p724)
	end

	damage_indicator.enabled:set_callback(function(p725)
		-- upvalues: v713 (copy)
		v713(p725:get())
	end, true)

	local break_lc_indicator = t29.visuals.break_lc_indicator
	local v715 = u31.load_font("Calibri", 11, "ad")
	local n132 = 0
	local n133 = 0
	local s50 = "lc status"
	local u719 = color()
	local n134 = 0
	local n135 = 0
	local n136 = 0
	local u723 = false
	local v724 = u31.screen_size()
	local v725 = vector(60, 30)
	local v726 = vector((v724.x - v725.x) / 2, v724.y * 0.3475)
	local u727 = t19.new("lc_indicator", v726, v725, {
		rulers = {
			[1] = {
				[1] = true,
				[2] = vector(v724.x / 2, 0),
				[3] = v724.y
			}
		},
		border = {
			vector(v724.x * 0.5, 0),
			vector(v724.x * 0.5, v724.y)
		}
	})

	local function v728()
		-- upvalues: t29 (ref), t92 (ref), t108 (ref)
		if t29.antiaim.enabled:get() then
			local v2966 = entity.get_local_player()

			if v2966 ~= nil then
				local v2967 = v2966:get_player_weapon()

				if v2967 ~= nil then
					local v2968 = v2967:get_weapon_info()

					if v2968 ~= nil then
						local weapon_type = v2968.weapon_type
						local v2970 = v2967:get_weapon_index()
						local v2971 = weapon_type == 9
						local v2972 = v2970 == 64

						if not v2971 and not v2972 then
							local v2973 = t108.builder:get_old_items()

							if v2973 ~= nil then
								local defensive = v2973.defensive

								if defensive ~= nil then
									return defensive.force_break_lc:get()
								end

								return false
							end

							return false
						end

						return false
					end

					return
				end

				return
			end

			return
		end

		return not t92.is_onground
	end
	local function v729(p726)
		if not (p726 <= 0) then
			if not (p726 <= 3) then
				if not (p726 <= 6) then
					if not (p726 <= 9) then
						if not (p726 <= 11) then
							if not (p726 <= 12) then
								return "angel lc", color(207, 145, 255)
							end

							return "ideal lc", color(101, 213, 255)
						end

						return "nice", color(122, 241, 182)
					end

					return "good", color(205, 236, 142)
				end

				return "ok", color(255, 255, 255)
			end

			return "bad", color(255, 175, 104)
		end

		return "failed", color(255, 64, 64)
	end
	local function v730()
		-- upvalues: u727 (ref), n133 (ref), s50 (ref), n134 (ref), u719 (ref), n132 (ref), u31 (ref), v715 (copy)
		local v2976 = u727:get_drag_position() + u727:get_drag_size() / 2
		local v2977 = ui.get_alpha()

		if v2977 > 0 then
			n133 = 1
		end

		if not (n133 <= 0) then
			local s51 = ""
			local v2979 = s50
			local v2980 = n134 .. "t"
			local v2981 = u719:clone()
			local v2982 = color(255, 255, 255, 128)

			if n132 == 0 and v2977 > 0 then
				v2979 = "lc status"
				v2981 = color()
			end

			v2982.a = v2982.a * n133
			v2981.a = v2981.a * n133

			local v2983 = u31.measure_text(v715, s51, v2979)
			local v2984 = u31.measure_text(v715, s51, v2980)

			v2976.y = v2976.y - (v2983.y + v2984.y + 1) / 2

			local v2985 = v2976 + vector(-v2983.x * 0.5, 0)
			local v2986 = v2976 + vector(-v2984.x * 0.5, 0)

			v2986.y = v2986.y + (v2983.y + 1)
			u31.text(v715, v2985, v2981, s51, v2979)
			u31.text(v715, v2986, v2982, s51, v2980)
			n132 = math.max(0, n132 - globals.frametime)

			if n132 == 0 then
				n133 = math.max(0, n133 - globals.frametime * 8)
			end

			u727()

			return
		end
	end
	local function v731()
		-- upvalues: n135 (ref), u723 (ref), v728 (copy), n136 (ref), v729 (copy), n132 (ref), n133 (ref), u719 (ref), s50 (ref), n134 (ref), t93 (ref)
		local v2987 = rage.exploit:get()
		local v2988 = v2987 - n135

		if v2988 > 0 then
			u723 = true
		end

		if u723 and v2988 < 0 then
			u723 = false

			if v728() or n136 > 0 then
				local v2989, v2990 = v729(n136)

				n132 = 0.66
				n133 = 1
				u719 = v2990
				s50 = v2989
				n134 = n136
			end
		end

		n135 = v2987
		n136 = t93.defensive_ticks
	end
	local function v732(p727)
		-- upvalues: v730 (copy), v731 (copy)
		events.render(v730, p727)
		events.createmove(v731, p727)
	end

	break_lc_indicator.enabled:set_callback(function(p728)
		-- upvalues: v732 (copy)
		v732(p728:get())
	end, true)

	local velocity_warning = t29.visuals.velocity_warning
	local n137 = 0
	local v735 = u31.screen_size()
	local v736 = vector(130, 12)
	local v737 = vector((v735.x - v736.x) / 2, v735.y * 0.285)
	local u738 = t19.new("velocity_warning", v737, v736, {
		rulers = {
			[1] = {
				[1] = true,
				[2] = vector(v735.x / 2, 0),
				[3] = v735.y
			}
		},
		border = {
			vector(v735.x * 0.5, 0),
			vector(v735.x * 0.5, v735.y)
		}
	})

	local function v739()
		-- upvalues: u738 (ref), velocity_warning (copy), n137 (ref), t14 (ref), t20 (ref), u31 (ref)
		local v2993 = entity.get_local_player()

		if v2993 ~= nil then
			local v2994 = u738:get_drag_position():clone()
			local v2995 = u738:get_drag_size()
			local v2996 = -globals.realtime
			local v2997 = v2993:is_alive()
			local v2998 = not (ui.get_alpha() <= 0)
			local v2999 = velocity_warning.color_accent:get()
			local v3000 = velocity_warning.color_secondary:get()
			local m_flVelocityModifier = v2993.m_flVelocityModifier

			if not v2997 then
				m_flVelocityModifier = 1
			end

			local v3002 = v2998 or v2997 and not (m_flVelocityModifier >= 1)

			n137 = t14.interp(n137, v3002, 0.05)

			if n137 > 0 then
				v2999.a = v2999.a * n137
				v3000.a = v3000.a * n137

				local v3003 = t20.gradient(string.format("%d%%", m_flVelocityModifier * 100), v2996, v2999, v3000)
				local n138 = 1
				local s52 = ""
				local v3006 = string.format("velocity inflicted ~ %s", v3003)
				local v3007 = u31.measure_text(n138, s52, v3006)

				v2994.x = v2994.x + (v2995.x - v3007.x) / 2 + 1
				u31.text(n138, v2994, v2999, s52, v3006)
			end

			u738()

			return
		end
	end
	local function v740(p729)
		-- upvalues: v739 (copy)
		events.render(v739, p729)
	end

	velocity_warning.enabled:set_callback(function(p730)
		-- upvalues: v740 (copy)
		v740(p730:get())
	end, true)

	local grenade_radius = t29.visuals.grenade_radius
	local mp_friendlyfire = cvar.mp_friendlyfire
	local t183 = {}
	local t184 = {}

	local function v745(p731)
		-- upvalues: mp_friendlyfire (copy)
		if mp_friendlyfire:int() ~= 1 then
			local v3011 = entity.get_local_player()
			local m_hOwnerEntity = p731.m_hOwnerEntity

			if m_hOwnerEntity ~= nil and m_hOwnerEntity:is_player() then
				if v3011 ~= m_hOwnerEntity and not m_hOwnerEntity:is_enemy() then
					return true
				end

				return false
			end

			return false
		end

		return false
	end
	local function v746(p732)
		for k in pairs(p732) do
			p732[k] = nil
		end
	end
	local function v747()
		-- upvalues: t183 (copy)
		local v3015 = entity.get_entities("CSmokeGrenadeProjectile")
		local t185 = {}

		for i = 1, #v3015 do
			local v3018 = v3015[i]

			if v3018.m_bDidSmokeEffect then
				local v3019 = v3018:get_index()

				if t183[v3019] == nil then
					local v3020 = v3018:get_origin()

					t183[v3019] = {
						radius = 125,
						alpha = 0,
						index = v3019,
						origin = v3020
					}
				end

				t185[v3019] = true
			end
		end

		for k in pairs(t183) do
			if t185[k] == nil then
				t183[k] = nil
			end
		end
	end
	local function v748()
		-- upvalues: t184 (copy), v745 (copy)
		local v3022 = entity.get_entities("CInferno")
		local t186 = {}

		for i = 1, #v3022 do
			local v3025 = v3022[i]
			local m_fireCount = v3025.m_fireCount

			if m_fireCount ~= 0 then
				local v3027 = v3025:get_index()

				if t184[v3027] == nil then
					local v3028 = v3025:get_origin()
					local v3029 = v745(v3025)

					t184[v3027] = {
						alpha = 0,
						radius = 0,
						fire_count = 0,
						index = v3027,
						origin = v3028,
						friendly = v3029
					}
				end

				local v3030 = t184[v3027]

				if m_fireCount > v3030.fire_count then
					v3030.fire_count = m_fireCount

					local n139 = 0
					local v3032 = nil
					local v3033 = nil
					local t187 = {}
					local n140 = 0

					v3025:get_origin()

					for j = 0, m_fireCount - 1 do
						if v3025.m_bFireIsBurning[j] then
							local v3037 = vector(v3025.m_fireXDelta[j], v3025.m_fireYDelta[j], v3025.m_fireZDelta[j])

							n140 = n140 + 1
							t187[n140] = v3037
						end
					end

					for j = 1, n140 do
						for k = 1, n140 do
							local v3040 = t187[j]
							local v3041 = t187[k]
							local v3042 = (v3041 - v3040):lengthsqr()

							if n139 < v3042 then
								n139 = v3042
								v3032 = v3040
								v3033 = v3041
							end
						end
					end

					if v3032 ~= nil and v3033 ~= nil then
						v3030.radius = math.sqrt(n139) / 2 + 40
					end
				end

				t186[v3027] = true
			end
		end

		for k in pairs(t184) do
			if t186[k] == nil then
				t184[k] = nil
			end
		end
	end
	local function v749()
		-- upvalues: grenade_radius (copy), t183 (copy), u31 (ref), t184 (copy)
		local frametime = globals.frametime
		local v3045 = grenade_radius.smoke_color:get()
		local v3046 = grenade_radius.molotov_color:get()

		for _, v in pairs(t183) do
			v.alpha = math.min(v.alpha + frametime * 4, 1)

			local v3049 = v.radius * v.alpha

			u31.circle_3d_outline(v.origin, v3045, v3049, 0, 1, 1)
		end

		for _, v in pairs(t184) do
			v.alpha = math.min(v.alpha + frametime * 4, 1)

			local v3052 = v.radius * v.alpha

			u31.circle_3d_outline(v.origin, v3046, v3052, 0, 1, 1)

			local v3053 = u31.world_to_screen(v.origin)

			if v3053 ~= nil then
				if not v.teammate then
					u31.text(1, v3053, color(230, 21, 21, 255), "c", "❌")
				else
					u31.text(1, v3053, color(149, 184, 6, 255), "c", "✔")
				end
			end
		end
	end
	local function v750(p733)
		-- upvalues: v746 (copy), t183 (copy), v747 (copy)
		local v3055 = p733:get()

		if not v3055 then
			v746(t183)
		end

		events.net_update_start(v747, v3055)
	end
	local function v751(p734)
		-- upvalues: v746 (copy), t184 (copy), v748 (copy)
		local v3057 = p734:get()

		if not v3057 then
			v746(t184)
		end

		events.net_update_start(v748, v3057)
	end

	grenade_radius.enabled:set_callback(function(p735)
		-- upvalues: v746 (copy), t183 (copy), t184 (copy), v747 (copy), v748 (copy), grenade_radius (copy), v750 (copy), v751 (copy), v749 (copy)
		local v3059 = p735:get()

		if not v3059 then
			v746(t183)
			v746(t184)
			events.net_update_start(v747, false)
			events.net_update_start(v748, false)
		end

		if not v3059 then
			grenade_radius.smoke:unset_callback(v750)
			grenade_radius.molotov:unset_callback(v751)
		else
			grenade_radius.smoke:set_callback(v750, true)
			grenade_radius.molotov:set_callback(v751, true)
		end

		events.render(v749, v3059)
	end, true)
	gamesense_indicators = t29.visuals.gamesense_indicators
	n141 = 380
	n142 = 8
	n143 = 24
	n144 = 4
	n145 = 3
	v758 = u31.load_font("C:\\Windows\\Fonts\\calibrib.ttf", vector(25, 23.5, 0), "a")

	local t188 = {}

	t188.__index = t188

	function t188.new(p736, p737, p738)
		return setmetatable({
			id = p737,
			size = p738
		}, p736)
	end

	function t188.draw(p739, p740, p741, ...)
		-- upvalues: u31 (ref)
		u31.texture(p739.id, p740, p739.size, p741, ...)
	end

	t189 = {
		bomb_c4 = t188:new(({
			bomb_c4 = u31.load_image_from_file("materials\\panorama\\images\\icons\\ui\\bomb_c4.svg", vector(32, 32))
		}).bomb_c4, vector(32, 29))
	}
end

local t190 = {}
local n146 = 100
local n147 = 0
local n148 = 0
local v765 = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot")
local v766 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap")
local v767 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots")
local v768 = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim")
local v769 = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points")
local v770 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
local v771 = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance")
local v772 = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes")
local v773 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck")
local v774 = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding")
local v775 = ui.find("Miscellaneous", "Main", "Other", "Fake Latency")
local feature_list = gamesense_indicators.feature_list

local function v777(p742)
	local v3067 = p742:get_override()

	if v3067 == nil then
		return p742:get()
	end

	return v3067
end
local function v778(p743)
	-- upvalues: t100 (ref)
	local v3069 = t100.get(p743)

	return v3069 ~= nil and v3069.active
end
local function v779()
	-- upvalues: t190 (copy)
	for i = 1, #t190 do
		t190[i] = nil
	end
end
local function v780(p744)
	-- upvalues: u31 (ref), v758 (copy), n144 (copy), t190 (copy), n141 (copy), n142 (copy)
	local v3072 = u31.measure_text(v758, nil, p744.text)
	local v3073 = u31.screen_size()

	v3072.y = v3072.y + n144 * 2

	local v3074 = next(t190) == nil and v3073.y - (v3073.y - n141) / 2 or t190[#t190].offset - n142 - v3072.y

	p744.offset = v3074
	p744.text_size = v3072
	table.insert(t190, p744)

	return v3074
end
local function v781(p745, p746, ...)
	-- upvalues: v780 (copy)
	local v3077 = table.concat({
		p746,
		...
	})

	return v780({
		text = v3077,
		color = p745
	})
end
local function v782(p747, p748)
	local n149 = 0.5

	if p748 > 0 then
		local v3081 = p747 * 0.5

		if p748 < (p747 - v3081) * n149 then
			v3081 = p747 - p748 * (1 / n149)
		end

		p747 = v3081
	end

	return p747
end
local function v783(p749, p750)
	-- upvalues: v782 (copy)
	local n150 = 500
	local v3085 = n150 * 3.5
	local v3086 = (p750:get_origin() - p749:get_eye_position()):length()
	local v3087 = v3085 / 3
	local v3088 = n150 * math.exp(-v3086 * v3086 / (2 * v3087 * v3087)) * 1

	return v782(v3088, p749.m_ArmorValue)
end
local function v784(_)
	-- upvalues: v778 (copy), v770 (copy), v771 (copy), v772 (copy), v775 (copy), v777 (copy), v773 (copy), v774 (copy), t29 (ref), v768 (copy), v769 (copy), v766 (copy), v767 (copy), v765 (copy), v781 (copy), feature_list (copy), t92 (ref), t93 (ref), n146 (ref)
	local v3090 = v778(v770)
	local v3091 = v778(v771)
	local v3092 = v778(v772)
	local v3093 = not (v775:get() <= 0)
	local v3094 = v777(v773)
	local v3095 = v777(v774) or t29.antiaim.settings.freestanding.enabled:get()
	local v3096 = v777(v768) == "Force"
	local v3097 = v777(v769) == "Force"
	local v3098 = v777(v766) and not v3094
	local v3099 = v777(v767) and (not v3094 and not v3098)
	local v3100 = v777(v765)

	if t29.ragebot.force_shot.enabled:get() and t29.ragebot.force_shot.show_indicator:get() then
		v781(color(255, 255, 255, 200), "SHOT")
	end

	if v3093 and feature_list:get("Fake Latency") then
		local v3101 = utils.net_channel()

		if v3101 ~= nil then
			local v3102 = v777(v775)
			local v3103 = math.clamp(v3101.latency[0] + v3101.latency[1], 0.001, 0.2)
			local v3104 = math.clamp(v3102 * 0.001 + v3101.avg_latency[1], 0.001, 0.2)
			local v3105 = math.clamp(v3103 / v3104, 0, 1)
			local v3106

			if not (v3105 < 0.5) then
				v3106 = color(213, 197, 84, 255):lerp(color(143, 194, 21, 255), (v3105 - 0.5) * 2)
			else
				v3106 = color(250, 234, 232, 255):lerp(color(213, 197, 84, 255), v3105 * 2)
			end

			v781(v3106, "PING")
		end
	end

	if v3099 and feature_list:get("Hide Shots") then
		v781(color(255, 255, 255, 200), "OSAA")
	end

	if v3098 and feature_list:get("Double Tap") then
		local v3107 = color(255, 0, 50, 255)

		if rage.exploit:get() == 1 then
			v3107 = color(255, 255, 255, 200)
		end

		v781(v3107, "DT")
	end

	if v3100 and feature_list:get("Dormant Aimbot") then
		v781(color(255, 255, 255, 200), "DA")
	end

	if v3094 and feature_list:get("Fake Duck") then
		v781(color(255, 255, 255, 200), "DUCK")
	end

	if v3097 and feature_list:get("Safe Points") then
		v781(color(255, 255, 255, 200), "SAFE")
	end

	if v3096 and feature_list:get("Body Aim") then
		v781(color(255, 255, 255, 200), "BODY")
	end

	if v3090 and feature_list:get("Damage Override") then
		v781(color(255, 255, 255, 200), "MD")
	end

	if v3091 and feature_list:get("Hitchance Override") then
		v781(color(255, 255, 255, 200), "HITCHANCE OVR")
	end

	if v3092 and feature_list:get("Hitbox Override") then
		v781(color(255, 255, 255, 200), "HITBOX OVR")
	end

	if v3095 and feature_list:get("Freestanding") then
		v781(color(255, 255, 255, 200), "FS")
	end

	if not t92.is_onground and feature_list:get("Lag Compensation") then
		local n151 = 255
		local n152 = 0
		local n153 = 50
		local n154 = 255

		if not (t93.defensive_ticks <= 0) or not (t93.teleport_units_sqr <= 4096) then
			n154 = 200
			n153 = 255
			n152 = 255
			n151 = 255
		end

		v781(color(n151, n152, n153, n154), "LC")
	end

	if feature_list:get("Fake Angles") then
		local v3112 = rage.antiaim:get_max_desync()
		local v3113 = color(196, 15, 15):lerp(color(132, 196, 20), v3112 / 58)

		v781(v3113, "FAKE")
	end

	if feature_list:get("Hit/Miss") then
		v781(color(255, 255, 255, 200), n146 .. "%")
	end
end
local function v785(p752, p753)
	-- upvalues: v780 (copy), t189 (copy)
	local v3116 = p753:get_player_weapon()

	if v3116 ~= nil then
		if v3116.m_bStartedArming then
			local m_fArmedTime = v3116.m_fArmedTime

			if m_fArmedTime ~= nil then
				local v3118 = p753:get_origin()
				local m_bombsiteCenterA = p752.m_bombsiteCenterA
				local m_bombsiteCenterB = p752.m_bombsiteCenterB
				local v3121 = v3118:distsqr(m_bombsiteCenterA) < v3118:distsqr(m_bombsiteCenterB) and "A" or "B"
				local v3122 = (m_fArmedTime - globals.curtime) / 3

				v780({
					text = v3121,
					color = color(252, 243, 105, 255),
					progress = 1 - v3122,
					draw_cmd = t189.bomb_c4
				})

				return
			end

			return
		end

		return
	end
end
local function v786(p754, p755)
	-- upvalues: u31 (ref), v780 (copy), t189 (copy), v783 (copy), v781 (copy)
	local m_bBombDefused = p755.m_bBombDefused

	if p755.m_bBombTicking and not m_bBombDefused then
		local curtime = globals.curtime
		local m_flC4Blow = p755.m_flC4Blow
		local v3128 = m_flC4Blow - curtime

		if v3128 > 0 then
			if p755.m_hBombDefuser ~= nil then
				local v3129 = u31.screen_size()
				local m_flDefuseCountDown = p755.m_flDefuseCountDown
				local v3131 = (m_flDefuseCountDown - curtime) / 10
				local v3132 = m_flC4Blow < m_flDefuseCountDown and color(235, 50, 75, 125) or color(50, 235, 75, 125)
				local v3133 = (v3129.y - 2) * (1 - v3131)

				u31.rect(vector(0, 0), vector(20, v3129.y), color(0, 0, 0, 115))
				u31.rect(vector(1, 1 + v3133), vector(19, v3129.y - 1), v3132)
			end

			local v3134 = string.format("%s - %.1fs", p755.m_nBombSite == 1 and "B" or "A", v3128)

			v780({
				text = v3134,
				color = color(255, 255, 255, 200),
				draw_cmd = t189.bomb_c4
			})
		end

		local m_iHealth = p754.m_iHealth
		local v3136 = v783(p754, p755)
		local v3137 = math.floor(v3136)

		if not (m_iHealth <= v3137) then
			if v3137 > 0 then
				v781(color(252, 243, 105, 255), string.format("-%d HP", v3137))
			end
		else
			v781(color(255, 0, 50, 255), "FATAL")
		end

		return
	end
end
local function v787(p756)
	-- upvalues: v785 (copy), v786 (copy)
	local v3139 = entity.get_game_rules()

	if v3139 ~= nil then
		local v3140 = entity.get_player_resource()

		if v3140 ~= nil then
			local m_bBombPlanted = v3139.m_bBombPlanted
			local m_iPlayerC4 = v3140.m_iPlayerC4

			if m_iPlayerC4 ~= nil and m_iPlayerC4 ~= 0 then
				local v3143 = entity.get(m_iPlayerC4)

				if v3143 ~= nil then
					v785(v3140, v3143)
				end
			end

			if m_bBombPlanted then
				local v3144 = entity.get_entities("CPlantedC4")[1]

				if v3144 ~= nil then
					v786(p756, v3144)
				end
			end

			return
		end

		return
	end
end
local function v788()
	-- upvalues: v784 (copy), feature_list (copy), v787 (copy)
	local v3145 = entity.get_local_player()

	if v3145 ~= nil then
		if v3145:is_alive() then
			v784(v3145)
		end

		if feature_list:get("Bomb Info") then
			v787(v3145)
		end

		return
	end
end
local function v789(p757, p758)
	-- upvalues: u31 (ref)
	local v3148 = (p757 + p758) / 2
	local v3149 = color(0, 0, 0, 0)
	local v3150 = color(0, 0, 0, 50)

	u31.gradient(p757, vector(v3148.x, p758.y), v3149, v3150, v3149, v3150)
	u31.gradient(p758, vector(v3148.x, p757.y), v3149, v3150, v3149, v3150)
end
local function v790(p759, p760, p761, p762, p763, p764)
	-- upvalues: u31 (ref)
	u31.circle_outline(p759, color(0, 0, 0, 255), p761, p762, 1, p764)
	u31.circle_outline(p759, p760, p761 - 1, p762, p763, p764 - 2)
end
local function v791()
	-- upvalues: t190 (copy), n145 (copy), n143 (copy), n144 (copy), v789 (copy), u31 (ref), v758 (copy), v790 (copy)
	for i = 1, #t190 do
		local v3158 = t190[i]

		if v3158.color ~= nil then
			local v3159 = vector(n145, v3158.offset)
			local v3160 = v3159 + vector(n143, n144)
			local v3161 = v3158.text_size + vector(50)
			local color3 = v3158.color
			local draw_cmd = v3158.draw_cmd
			local progress = v3158.progress

			v3160.y = v3160.y + 2

			if draw_cmd ~= nil then
				v3161.x = v3161.x + draw_cmd.size.x + 5
			end

			if progress ~= nil then
				v3161.x = v3161.x + 30
			end

			v789(v3159, v3159 + v3161)

			if draw_cmd ~= nil then
				local v3165 = v3159:clone()

				v3165.x = v3165.x + n143
				v3165.y = v3165.y + (v3161.y - draw_cmd.size.y) / 2
				draw_cmd:draw(v3165, color3, "f")
				v3160.x = v3160.x + draw_cmd.size.x + 5
			end

			u31.text(v758, v3160 + 1, color(0, 0, 0, 128), "", v3158.text)
			u31.text(v758, v3160, color3, "", v3158.text)
			v3160.x = v3160.x + v3158.text_size.x

			if progress ~= nil then
				local v3166 = v3160.x + 10 / 2 + 12
				local v3167 = v3159.y + v3161.y / 2
				local v3168 = vector(v3166, v3167)
				local v3169 = color(255, 255, 255, 200)

				v790(v3168, v3169, 10, 0, progress, 5)
			end
		end
	end
end
local function v792()
	-- upvalues: u31 (ref)
	local v3170 = entity.get_local_player()

	if v3170 ~= nil then
		local v3171 = v3170:get_spectators()

		if v3171 ~= nil then
			local v3172 = u31.screen_size()
			local v3173 = vector(v3172.x - 10, 5)

			for i = 1, #v3171 do
				local v3175 = v3171[i]:get_name()
				local v3176 = color(255, 255, 255, 200)

				u31.text(1, v3173, v3176, "r", v3175)
				v3173.y = v3173.y + 18
			end

			return
		end

		return
	end
end
local function v793()
	-- upvalues: v788 (copy), v791 (copy), v779 (copy)
	if globals.is_in_game then
		v788()
		v791()
	end

	v779()
end
local function v794(p765)
	-- upvalues: n148 (ref), n147 (ref), n146 (ref)
	if p765.state ~= "death" and (p765.state ~= "player death" and p765.state ~= "unregistered shot") then
		n148 = n148 + 1

		if p765.state == nil then
			n147 = n147 + 1
		end

		n146 = math.floor(n147 / math.max(1, n148) * 100)

		return
	end
end
local function v795(p766)
	-- upvalues: v793 (copy), v794 (copy)
	events.render(v793, p766)
	events.aim_ack(v794, p766)
end
local function v796(p767)
	-- upvalues: v792 (copy)
	events.render(v792, p767:get())
end

gamesense_indicators.enabled:set_callback(function(p768)
	-- upvalues: v792 (copy), gamesense_indicators (copy), v796 (copy), v795 (copy)
	local v3181 = p768:get()

	if not v3181 then
		events.render(v792, false)
	end

	if not v3181 then
		gamesense_indicators.spectator_list:unset_callback(v796)
	else
		gamesense_indicators.spectator_list:set_callback(v796, true)
	end

	v795(v3181)
end, true)

local kibit_markers = t29.visuals.kibit_markers
local t191 = {}

local function v799()
	-- upvalues: t191 (copy), u31 (ref), kibit_markers (copy)
	if globals.is_in_game then
		local realtime = globals.realtime

		for i = #t191, 1, -1 do
			if realtime > t191[i].time then
				table.remove(t191, i)
			end
		end

		for i = 1, #t191 do
			local v3185 = t191[i]
			local n155 = 1
			local v3187 = v3185.time - realtime

			if v3187 < 0.7 then
				n155 = v3187 / 0.7
			end

			local v3188 = u31.world_to_screen(v3185.point)

			if v3188 ~= nil then
				local n156 = 1
				local v3190 = 4 + n156
				local v3191 = kibit_markers.color_x:get()
				local v3192 = kibit_markers.color_y:get()
				local v3193 = vector(v3188.x - n156, v3188.y - v3190)
				local v3194 = vector(v3188.x + n156, v3188.y + v3190)
				local v3195 = vector(v3188.x - v3190, v3188.y - n156)
				local v3196 = vector(v3188.x + v3190, v3188.y + n156)

				v3191.a = v3191.a * n155
				v3192.a = v3192.a * n155
				u31.rect(v3195, v3196, v3191)
				u31.rect(v3193, v3194, v3192)
			end
		end

		return
	end
end
local function v800(p769)
	-- upvalues: kibit_markers (copy), t191 (copy)
	local v3198 = globals.realtime + kibit_markers.speed:get() / 10

	table.insert(t191, {
		time = v3198,
		point = p769.aim
	})
end

kibit_markers.enabled:set_callback(function(p770)
	-- upvalues: t191 (copy), v799 (copy), v800 (copy)
	local v3200 = p770:get()

	if not v3200 then
		for i = 1, #t191 do
			t191[i] = nil
		end
	end

	events.render(v799, v3200)
	events.aim_ack(v800, v3200)
end, true)

local static_watermark = t29.visuals.static_watermark
local watermark = t29.visuals.watermark
local indicators = t29.visuals.indicators
local solus_ui = t29.visuals.solus_ui
local t192 = {}
local n157 = 0

local function v807()
	-- upvalues: n157 (ref)
	if not (n157 <= 0) then
		local v3202 = globals.frametime * 1.66

		n157 = math.max(0, n157 - v3202)

		return
	end
end
local function v808()
	-- upvalues: u31 (ref), t1 (copy), n157 (ref)
	local v3203 = u31.screen_size()
	local v3204 = vector(v3203.x * 0.5, v3203.y - 18)
	local n158 = 4
	local s53 = ""
	local name = t1.name
	local v3208 = u31.measure_text(n158, s53, name)
	local v3209 = color(255, 255, 255, 255)

	v3204.x = v3204.x - v3208.x * 0.5
	v3204.y = v3204.y - v3208.y
	u31.text(n158, v3204, v3209, s53, name)

	if n157 > 0 then
		local s54 = ""
		local n159 = 5
		local s55 = "¨˜”*°•"
		local v3213 = u31.measure_text(n158, s54, s55)
		local v3214 = vector(v3204.x - v3213.x - n159, v3204.y)
		local v3215 = vector(v3204.x + v3208.x + n159, v3204.y)
		local v3216 = v3209:clone()

		v3216.a = v3216.a * n157
		u31.text(n158, v3214, v3216, s54, s55)
		u31.text(n158, v3215, v3216, s54, "•°*”˜¨")
	end
end

function t192.on_render()
	-- upvalues: v807 (copy), v808 (copy)
	v807()
	v808()
end

function t192.on_player_death(p771)
	-- upvalues: n157 (ref)
	local v3218 = entity.get_local_player()
	local v3219 = entity.get(p771.userid, true)

	if v3218 == entity.get(p771.attacker, true) and v3219 ~= v3218 then
		n157 = 1

		return
	end
end

local t193 = {}
local n160 = 4

local function v811(p772, p773)
	return p772:gsub(".", "%1" .. p773, #p772 - 1)
end
local function v812()
	-- upvalues: static_watermark (copy), v811 (copy), t20 (ref)
	local s56 = ""
	local s57 = "ANGEL"
	local s58 = "WINGS"

	if not static_watermark.remove_spaces:get() then
		s56 = " "
		s57 = v811(s57, s56)
		s58 = v811(s58, s56)
	end

	return s57 .. s56 .. t20.gradient(s58, -globals.realtime, color(255, 255, 255, 255), color(55, 55, 55, 255))
end
local function v813()
	-- upvalues: t1 (copy)
	return string.format("[%s]", t1.build:upper())
end

function t193.on_render()
	-- upvalues: u31 (ref), static_watermark (copy), v812 (copy), v813 (copy), n160 (copy)
	local n161 = 1
	local s59 = ""
	local v3227 = u31.screen_size()
	local v3228 = static_watermark.color:get()
	local v3229 = static_watermark.position:get()
	local v3230 = v812()
	local v3231 = v813()
	local v3232 = u31.measure_text(n161, s59, v3230)
	local v3233 = u31.measure_text(n161, s59, v3231)

	if v3229 ~= "Bottom" then
		local v3234 = vector(20, v3227.y * 0.5)
		local v3235 = v3232.x + v3233.x + n160
		local v3236 = math.max(v3232.y, v3233.y)

		if v3229 == "Right" then
			v3234.x = v3227.x - v3234.x
			v3234.x = v3234.x - v3235 + 1
		end

		v3234.y = v3234.y - v3236 * 0.5

		local v3237 = v3234:clone()
		local v3238 = v3234:clone()

		v3238.x = v3238.x + v3232.x
		v3238.x = v3238.x + n160
		u31.text(n161, v3237, v3228, s59, v3230)
		u31.text(n161, v3238, color(200, 69, 69), s59, v3231)

		return
	end

	local v3239 = vector(v3227.x * 0.5, v3227.y - 14)
	local v3240 = v3239 - vector(v3232.x * 0.5, v3232.y)

	v3239.y = v3239.y - v3232.y
	v3239.y = v3239.y - n160

	local v3241 = v3239 - vector(v3233.x * 0.5, v3233.y)

	u31.text(n161, v3240, v3228, s59, v3230)
	u31.text(n161, v3241, color(200, 69, 69), s59, v3231)
end

local function v814(p774)
	-- upvalues: t192 (copy), t193 (copy)
	local v3243 = p774 == 1
	local v3244 = p774 == 2

	events.render(t192.on_render, v3243)
	events.render(t193.on_render, v3244)
	events.player_death(t192.on_player_death, v3243)
end
local function v815(p775)
	-- upvalues: static_watermark (copy), v814 (copy)
	local v3246 = p775:get()
	local v3247 = v3246 == 2

	static_watermark.remove_spaces:visibility(v3247)
	static_watermark.position:visibility(v3247)
	static_watermark.color:visibility(v3247)
	v814(v3246)
end
local function v816()
	-- upvalues: watermark (copy), indicators (copy), solus_ui (copy), v814 (copy), static_watermark (copy), v815 (copy)
	local v3248 = watermark.enabled:get() or indicators.enabled:get()
	local v3249 = solus_ui.enabled:get() and solus_ui.select:get("Watermark")
	local v3250 = v3248 or v3249

	if v3250 then
		v814(nil)
	end

	if v3250 then
		static_watermark.style:unset_callback(v815)
	else
		static_watermark.style:set_callback(v815, true)
	end
end

indicators.enabled:set_callback(v816)
watermark.enabled:set_callback(v816)
solus_ui.enabled:set_callback(v816)
solus_ui.select:set_callback(v816)
v816()

local clantag = t29.misc.clantag
local v818 = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag")
local n162 = 0
local t194 = {
	[1] = "",
	[2] = "a",
	[3] = "an",
	[4] = "ang",
	[5] = "ange",
	[6] = "angel",
	[7] = "angelw",
	[8] = "angelwi",
	[9] = "angelwin",
	[10] = "angelwing",
	[11] = "angelwings",
	[12] = "angelwings",
	[13] = "angelwings",
	[14] = "angelwings",
	[15] = "angelwings",
	[16] = "angelwings",
	[17] = "angelwings",
	[18] = "angelwings",
	[19] = "angelwings",
	[20] = "angelwings",
	[21] = "angelwings",
	[22] = "angelwings",
	[23] = "angelwings",
	[24] = "ngelwings",
	[25] = "gelwings",
	[26] = "elwings",
	[27] = "lwings",
	[28] = "wings",
	[29] = "ings",
	[30] = "ngs",
	[31] = "gs",
	[32] = "s",
	[33] = ""
}

local function v821()
	-- upvalues: v8 (copy)
	return v8(globals.curtime * 4)
end
local function v822()
	-- upvalues: v821 (copy), t194 (copy), n162 (ref)
	if globals.is_in_game then
		local v3251 = v821() % #t194 + 1

		if v3251 ~= n162 then
			n162 = v3251
			common.set_clan_tag(t194[v3251] or "")
		end

		return
	end
end

clantag.enabled:set_callback(function(p776)
	-- upvalues: v818 (copy), v822 (copy)
	local v3253 = p776:get()

	if not v3253 then
		common.set_clan_tag("")
	end

	local v3254 = v818
	local override = v3254.override

	if v3253 then
	end

	override(v3254, nil)
	events.net_update_end(v822, v3253)
end, true)

local trashtalk = t29.misc.trashtalk
local n163 = 0
local t195 = {}

network.get("https://cdn.hysteria.one/angelwings/trashtalk.txt", nil, function(p777)
	-- upvalues: t195 (copy)
	if p777 and not string.find(p777, "404") then
		local n164 = 0

		for match in string.gmatch(p777, "(.-)\n") do
			n164 = n164 + 1
			t195[n164] = match
		end

		return
	end
end)

local function v826(p778)
	-- upvalues: t195 (copy), n163 (ref)
	local v3260 = entity.get_local_player()
	local v3261 = entity.get(p778.userid, true)

	if v3260 == entity.get(p778.attacker, true) and v3261 ~= v3260 then
		local v3262 = #t195
		local v3263 = math.random(1, v3262)

		if v3263 == n163 then
			v3263 = v3263 + 1

			if v3263 == v3262 then
				v3263 = 1
			end
		end

		utils.console_exec("say " .. t195[v3263])
		n163 = v3263

		return
	end
end

trashtalk.enabled:set_callback(function(p779)
	-- upvalues: v826 (copy)
	events.player_death(v826, p779:get())
end, true)

local n165 = 9

local function v828(p780)
	local v3266 = p780:get_weapon_info()

	if v3266 ~= nil and v3266.weapon_type == 9 then
		local m_fThrowTime = p780.m_fThrowTime

		if m_fThrowTime ~= nil and m_fThrowTime ~= 0 then
			return true
		end

		return false
	end

	return false
end
local function v829(p781)
	-- upvalues: n165 (copy), v828 (copy), v8 (copy), u31 (ref)
	local v3269 = entity.get_local_player()

	if v3269 ~= nil then
		if v3269.m_MoveType == n165 then
			local v3270 = v3269:get_player_weapon()

			if v3270 ~= nil and not v828(v3270) then
				p781.view_angles.y = v8(p781.view_angles.y)
				p781.view_angles.z = 0

				local m_vecLadderNormal = v3269.m_vecLadderNormal

				if m_vecLadderNormal:lengthsqr() ~= 0 then
					local v3272 = u31.camera_angles()
					local v3273 = m_vecLadderNormal:angles()
					local v3274 = v3273.y - v3272.y + 180
					local v3275 = v3273.x - v3272.x
					local v3276 = math.normalize_yaw(v3274)
					local v3277 = math.clamp(v3275, -89, 89)
					local v3278 = math.abs(v3276)
					local n166 = 89
					local n167 = -90
					local v3281 = not (v3277 >= -45)
					local v3282 = not (v3276 <= 0)
					local v3283 = not (p781.sidemove <= 0)
					local v3284 = not (p781.forwardmove <= 0)

					if not (v3278 > 70) or not (v3278 < 135) then
						if p781.sidemove == 0 and p781.forwardmove ~= 0 then
							if not v3282 then
								n167 = -n167
							end

							if not v3281 then
								v3284 = not v3284
							end

							p781.in_back = not v3284
							p781.in_forward = v3284

							if not v3282 then
								v3284 = not v3284
							end

							p781.in_moveleft = v3284
							p781.in_moveright = not v3284
							p781.view_angles.x = n166
							p781.view_angles.y = math.normalize_yaw(v3273.y + n167)

							return
						end

						return
					end

					if p781.forwardmove == 0 and p781.sidemove ~= 0 then
						if not v3282 then
							n167 = -n167
						end

						if v3282 then
							v3283 = not v3283
						end

						p781.in_back = v3283
						p781.in_forward = not v3283

						if v3282 then
							v3283 = not v3283
						end

						p781.in_moveleft = v3283
						p781.in_moveright = not v3283
						p781.view_angles.x = n166
						p781.view_angles.y = math.normalize_yaw(v3273.y + n167)

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

t29.misc.fast_ladder.enabled:set_callback(function(p782)
	-- upvalues: v829 (copy)
	events.createmove(v829, p782:get())
end, true)

local function v830(p783)
	local v3287 = entity.get_local_player()

	if v3287 ~= nil then
		local v3288 = v3287:simulate_movement()

		v3288:think(5)

		if v3288.velocity.z < 0 then
			p783.block_movement = 2
		end

		return
	end
end

t29.misc.edge_stop.enabled:set_callback(function(p784)
	-- upvalues: v830 (copy)
	events.createmove(v830, p784:get())
end, true)

local function v831(p785)
	local v3291 = entity.get_local_player()

	if v3291 ~= nil then
		local m_fFlags = v3291.m_fFlags

		if bit.band(m_fFlags, 1) == 0 then
			if not p785.in_duck then
				local v3293 = v3291:simulate_movement()

				p785.in_duck = true
				v3293:think(1)

				local v3294 = bit.band(v3293.flags, 1) == 0 and v3293.did_hit_collision
				local v3295 = v3291:simulate_movement()

				p785.in_duck = false
				v3295:think(1)

				local v3296 = bit.band(v3295.flags, 1) == 0 and v3295.did_hit_collision

				if not v3294 and v3296 then
					p785.in_duck = true
				end

				return
			end

			return
		end

		return
	end
end

t29.misc.collision_air_duck.enabled:set_callback(function(p786)
	-- upvalues: v831 (copy)
	events.createmove(v831, p786:get())
end, true)

local no_fall_damage = t29.misc.no_fall_damage
local u833 = false

local function v834(p787, p788)
	local v3300 = p787:get_origin()

	for i = 0, math.pi * 2, math.pi * 2 / 8 do
		local v3302 = math.sin(i)
		local v3303 = math.cos(i)
		local v3304 = v3300 + vector(10 * v3303, 10 * v3302, 0)
		local v3305 = v3304 - vector(0, 0, p788)

		if utils.trace_line(v3304, v3305, p787).fraction ~= 1 then
			return true
		end
	end

	return false
end
local function v835(p789)
	-- upvalues: u833 (ref), v834 (copy)
	local v3307 = entity.get_local_player()

	if v3307 ~= nil then
		if not (v3307.m_vecVelocity.z >= -500) then
			if not v834(v3307, 15) then
				if v834(v3307, 75) then
					u833 = true
				end
			else
				u833 = false
			end
		else
			u833 = false
		end

		if v3307.m_vecVelocity.z < -500 then
			p789.in_duck = u833
		end

		return
	end
end

no_fall_damage.enabled:set_callback(function(p790)
	-- upvalues: v835 (copy)
	events.createmove(v835, p790:get())
end, true)

local n168 = 0.3

local function v837(p791, p792, p793)
	if not (math.abs(p791.x) > math.abs(p791.y)) then
		local v3312 = p791.x / p791.y
		local v3313 = 1 + v3312 * v3312
		local v3314 = -2 * p792.y - 2 * v3312 * p792.x
		local v3315 = p792:length2dsqr() - p793 * p793
		local v3316 = v3314 * v3314 - 4 * v3313 * v3315

		if not (v3316 < 0) then
			if not (v3316 < 0.001) then
				local v3317 = math.sqrt(v3316)
				local v3318 = (-v3314 + v3317) / (2 * v3313)
				local v3319 = v3312 * v3318
				local v3320 = vector(v3319, v3318)
				local v3321 = (-v3314 - v3317) / (2 * v3313)
				local v3322 = v3312 * v3321
				local v3323 = vector(v3322, v3321)

				if not (p791:dot(v3320) > p791:dot(v3323)) then
					return v3323
				end

				return v3320
			end

			local v3324 = -v3314 / (2 * v3313)
			local v3325 = v3312 * v3324

			return vector(v3325, v3324)
		end

		return p792 + (p791 * p792:dot(p791) - p792):normalized() * p793
	end

	local v3326 = p791.y / p791.x
	local v3327 = 1 + v3326 * v3326
	local v3328 = -2 * p792.x - 2 * v3326 * p792.y
	local v3329 = p792:length2dsqr() - p793 * p793
	local v3330 = v3328 * v3328 - 4 * v3327 * v3329

	if not (v3330 < 0) then
		if not (v3330 < 0.001) then
			local v3331 = math.sqrt(v3330)
			local v3332 = (-v3328 + v3331) / (2 * v3327)
			local v3333 = v3326 * v3332
			local v3334 = vector(v3332, v3333)
			local v3335 = (-v3328 - v3331) / (2 * v3327)
			local v3336 = v3326 * v3335
			local v3337 = vector(v3335, v3336)

			if not (p791:dot(v3334) > p791:dot(v3337)) then
				return v3337
			end

			return v3334
		end

		local v3338 = -v3328 / (2 * v3327)
		local v3339 = v3326 * v3338

		return vector(v3338, v3339)
	end

	return p792 + (p791 * p792:dot(p791) - p792):normalized() * p793
end
local function v838(p794, p795, p796, p797)
	-- upvalues: t2 (ref), n168 (copy), v837 (copy)
	local v3344 = vector():angles(p794)
	local v3345 = vector():angles(p794.x - (90 - math.abs(p794.x)) * 10 / 90, p794.y)
	local v3346 = v3345:dot(v3344) / v3344:length()
	local v3347 = math.clamp(p796 * 0.9, 15, 750)
	local v3348 = math.clamp(p797, 0, 1)
	local v3349 = v3347 * t2.lerp(n168, 1, v3348)

	p794.y = (v837(v3345, p795 * 1.25, v3349 * v3346) - p795 * 1.25):angles().y
	p794.x = math.clamp(p794.x + math.clamp(p795.z * 0.1, -20, 20), -89, 89)
end
local function v839(p798, p799)
	local v3352 = math.rad(p799)
	local v3353 = math.cos(v3352)
	local v3354 = math.sin(v3352)
	local v3355 = v3353 * p798.forwardmove + v3354 * p798.sidemove
	local v3356 = v3354 * p798.forwardmove + v3353 * p798.sidemove

	p798.forwardmove = v3355
	p798.sidemove = v3356
end
local function v840(p800)
	-- upvalues: u31 (ref), v838 (copy), v839 (copy)
	local v3358 = entity.get_local_player()

	if v3358 ~= nil then
		local v3359 = v3358:get_player_weapon()

		if v3359 ~= nil then
			local v3360 = v3359:get_weapon_info()

			if v3360 ~= nil and v3360.weapon_type == 9 then
				if v3359.m_fThrowTime ~= 0 then
					if not (v3358.m_nTickBase * globals.tickinterval < v3359.m_fThrowTime) or rage.exploit:get() == 1 then
						local view_angles = p800.view_angles
						local y = view_angles.y
						local v3363 = u31.camera_angles()

						if v3363.x == view_angles.x and v3363.y == view_angles.y then
							v838(view_angles, v3358.m_vecVelocity, v3360.throw_velocity, v3359.m_flThrowStrength)
							v839(p800, math.normalize_yaw(y - view_angles.y))

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
local function v841(p801)
	-- upvalues: v838 (copy)
	local v3365 = entity.get_local_player()

	if v3365 ~= nil then
		local v3366 = v3365:get_player_weapon()

		if v3366 ~= nil then
			local v3367 = v3366:get_weapon_info()

			if v3367 ~= nil and v3367.weapon_type == 9 then
				v838(p801.angles, p801.velocity, v3367.throw_velocity, v3366.m_flThrowStrength)
			end

			return
		end

		return
	end
end

t29.misc.super_toss.enabled:set_callback(function(p802)
	-- upvalues: v840 (copy), v841 (copy)
	local v3369 = p802:get()

	events.createmove(v840, v3369)
	events.grenade_override_view(v841, v3369)
end, true)

local grenade_release = t29.misc.grenade_release
local u843 = nil

local function v844(p803, p804)
	-- upvalues: grenade_release (copy)
	if p803 ~= nil and p804 ~= nil then
		if p803:get_weapon_index() ~= 45 then
			return not (p804 < grenade_release.damage:get())
		end

		return not (p804 <= 0)
	end

	return false
end
local function v845(p805)
	-- upvalues: v844 (copy), u843 (ref)
	local v3373 = entity.get_local_player()

	if v3373 ~= nil then
		local v3374 = v3373:get_player_weapon()

		if v3374 ~= nil then
			if v3374.m_bPinPulled then
				if not (v3374.m_flThrowStrength <= 0) then
					if v844(v3374, u843) then
						p805.in_attack = false
						p805.in_attack2 = false
					end

					u843 = nil

					return
				end

				return
			end

			return
		end

		return
	end
end
local function v846(p806)
	-- upvalues: u843 (ref)
	u843 = p806.damage
end

grenade_release.enabled:set_callback(function(p807)
	-- upvalues: v845 (copy), v846 (copy)
	local v3377 = p807:get()

	events.createmove(v845, v3377)
	events.grenade_prediction(v846, v3377)
end, true)

local fps_optimize = t29.misc.fps_optimize
local u848 = false
local t196 = {}

local function v850(p808)
	assert(type(p808) == "table", "cmds must be a table")
	assert(type(p808.set) == "function", "set must be a function")
	assert(type(p808.unset) == "function", "unset must be a function")

	return {
		set = p808.set,
		unset = p808.unset
	}
end
local function v851(p809, p810)
	-- upvalues: v850 (copy)
	assert(type(p809) == "userdata", "convar must be a userdata")
	assert(type(p810) == "number", "value must be a number")

	local u3381 = nil
	local v3382 = p810

	return v850({
		set = function()
			-- upvalues: u3381 (ref), p809 (copy), v3382 (copy)
			if u3381 == nil then
				u3381 = p809:int()
				p809:int(v3382)
			end
		end,
		unset = function()
			-- upvalues: u3381 (ref), p809 (copy)
			if u3381 ~= nil then
				p809:int(u3381)
				u3381 = nil
			end
		end
	})
end

t196.Fog = {
	v851(cvar.fog_enable, 0),
	v851(cvar.fog_enable_water_fog, 0)
}
t196.Blood = { v851(cvar.violence_hblood, 0) }
t196.Bloom = { v851(cvar.mat_disable_bloom, 1) }
t196.Decals = { v851(cvar.r_drawdecals, 0) }
t196.Shadows = {
	v851(cvar.r_shadows, 0),
	v851(cvar.cl_csm_static_prop_shadows, 0),
	v851(cvar.cl_csm_shadows, 0),
	v851(cvar.cl_csm_world_shadows, 0),
	v851(cvar.cl_foot_contact_shadows, 0),
	v851(cvar.cl_csm_viewmodel_shadows, 0),
	v851(cvar.cl_csm_rope_shadows, 0),
	v851(cvar.cl_csm_sprite_shadows, 0),
	v851(cvar.cl_csm_translucent_shadows, 0),
	v851(cvar.cl_csm_entity_shadows, 0),
	v851(cvar.cl_csm_world_shadows_in_viewmodelcascade, 0)
}
t196.Sprites = { v851(cvar.r_drawsprites, 0) }
t196.Particles = { v851(cvar.r_drawparticles, 0) }
t196.Ropes = { v851(cvar.r_drawropes, 0) }
t196["Dynamic lights"] = { v851(cvar.mat_disable_fancy_blending, 1) }
t196["Map details"] = {
	v851(cvar.func_break_max_pieces, 0),
	v851(cvar.props_break_max_pieces, 0)
}
t196["Weapon effects"] = {
	v851(cvar.muzzleflash_light, 0),
	v851(cvar.r_drawtracers_firstperson, 0)
}
t196.Teammates = { (function(p811)
	-- upvalues: v850 (copy)
	assert(type(p811) == "function", "fn must be a function")

	local t197 = {}

	p811(t197)

	return v850(t197)
end)(function(p812)
		local function v3386(p813)
			local v3559 = entity.get_local_player()

			if v3559 ~= nil then
				local v3560 = v3559:is_alive()

				entity.get_players(false, true, function(p814)
					-- upvalues: v3559 (copy), p813 (copy), v3560 (copy)
					if p814 ~= v3559 and not p814:is_enemy() then
						if not p813 and v3560 then
							p814.m_nRenderMode = 10
						else
							p814.m_nRenderMode = 0
						end
					end
				end)

				return
			end
		end
		local function v3387()
			-- upvalues: v3386 (copy)
			v3386(true)
		end
		local function v3388()
			-- upvalues: v3386 (copy)
			v3386(false)
		end

		function p812.set()
			-- upvalues: v3386 (copy), v3387 (copy), v3388 (copy)
			v3386(false)
			events.shutdown(v3387, true)
			events.net_update_end(v3388, true)
		end

		function p812.unset()
			-- upvalues: v3386 (copy), v3387 (copy), v3388 (copy)
			v3386(true)
			events.shutdown(v3387, false)
			events.net_update_end(v3388, false)
		end
	end) }

local function v852()
	-- upvalues: fps_optimize (copy), t92 (ref)
	if not fps_optimize.always_on:get() then
		if not t92.is_peeking or not fps_optimize.detections:get("Peeking") then
			if not t92.is_vulnerable or not fps_optimize.detections:get("Hit Flag") then
				return false
			end

			return true
		end

		return true
	end

	return true
end
local function v853()
	-- upvalues: u848 (ref), t196 (copy)
	if u848 then
		for _, v in pairs(t196) do
			for i = 1, #v do
				v[i]:unset()
			end
		end

		u848 = false

		return
	end
end
local function v854()
	-- upvalues: u848 (ref), fps_optimize (copy), t196 (copy)
	if not u848 then
		local v3392 = fps_optimize.select:get()

		for i = 1, #v3392 do
			local v3394 = t196[v3392[i]]

			for j = 1, #v3394 do
				v3394[j]:set()
			end
		end

		u848 = true

		return
	end
end
local function v855()
	-- upvalues: v853 (copy)
	v853()
end
local function v856()
	-- upvalues: v852 (copy), v853 (copy), v854 (copy)
	if v852() then
		v854()

		return
	end

	return v853()
end
local function v857(_)
	-- upvalues: v853 (copy), v854 (copy)
	v853()
	v854()
end

fps_optimize.enabled:set_callback(function(p816)
	-- upvalues: fps_optimize (copy), v857 (copy), v853 (copy), v855 (copy), v856 (copy)
	local v3398 = p816:get()

	if not v3398 then
		fps_optimize.select:unset_callback(v857)
	else
		fps_optimize.select:set_callback(v857, true)
	end

	if not v3398 then
		v853()
	end

	events.shutdown(v855, v3398)
	events.net_update_end(v856, v3398)
end, true)

local ping_unlocker = t29.misc.ping_unlocker
local v859 = ui.find("Miscellaneous", "Main", "Other", "Fake Latency")
local sv_maxunlag = cvar.sv_maxunlag

local function v861()
	-- upvalues: v859 (copy), sv_maxunlag (copy)
	v859:override()
	v859:disabled(false)
	sv_maxunlag:float(tonumber(sv_maxunlag:string()), true)
end
local function v862(p817)
	-- upvalues: v859 (copy), sv_maxunlag (copy)
	v859:override(p817)
	v859:disabled(true)
	sv_maxunlag:float(0.4, true)
end
local function v863()
	-- upvalues: v861 (copy)
	v861()
end
local function v864(p818)
	-- upvalues: v862 (copy)
	v862(p818:get())
end

ping_unlocker.enabled:set_callback(function(p819)
	-- upvalues: v861 (copy), ping_unlocker (copy), v864 (copy), v863 (copy)
	local v3402 = p819:get()

	if not v3402 then
		v861()
	end

	if not v3402 then
		ping_unlocker.value:unset_callback(v864)
	else
		ping_unlocker.value:set_callback(v864, true)
	end

	events.shutdown(v863, v3402)
end, true)

local animation_breaker = t29.misc.animation_breaker
local n169 = 2
local n170 = 6
local n171 = 12
local v869 = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
local v870 = ffi.typeof(
	"            struct {\n                float  m_flLayerAnimtime;\n                float  m_flLayerFadeOuttime;\n\n                // dispatch flags\n                void  *m_pDispatchedStudioHdr;\n                int    m_nDispatchedSrc;\n                int    m_nDispatchedDst;\n\n                int    m_nOrder;\n                int    m_nSequence;\n                float  m_flPrevCycle;\n                float  m_flWeight;\n                float  m_flWeightDeltaRate;\n\n                // used for automatic crossfades between sequence changes;\n                float  m_flPlaybackRate;\n                float  m_flCycle;\n                int    m_pOwner;\n                int    m_nInvalidatePhysicsBits;\n            } **\n        ")

local function v871(p820)
	-- upvalues: v870 (copy)
	return ffi.cast(v870, ffi.cast("uintptr_t", p820[0]) + 10640)[0]
end
local function v872(p821)
	-- upvalues: t92 (ref), animation_breaker (copy), v869 (copy)
	if t92.is_onground then
		local v3405 = animation_breaker.ground_legs:get()

		if v3405 == "Static" then
			v869:override("Sliding")
			p821.m_flPoseParameter[0] = 0

			return
		end

		if v3405 == "Jitter" then
			local tickcount = globals.tickcount
			local v3407 = animation_breaker.legs_offset_1:get()
			local v3408 = animation_breaker.legs_offset_2:get()
			local v3409 = 1 / (tickcount % 8 >= 4 and 200 or 400)
			local v3410 = tickcount % 4 >= 2 and v3407 or v3408

			v869:override("Sliding")
			p821.m_flPoseParameter[0] = v3410 * v3409

			return
		end

		if v3405 == "Allah" then
			v869:override("Walking")
			p821.m_flPoseParameter[7] = 0

			return
		end

		if v3405 == "Kangaroo" then
			p821.m_flPoseParameter[3] = math.random()
			p821.m_flPoseParameter[6] = math.random()
			p821.m_flPoseParameter[7] = math.random()
		end
	end

	v869:override()
end
local function v873(p822, p823)
	-- upvalues: animation_breaker (copy), t92 (ref), n170 (copy)
	local v3413 = animation_breaker.air_legs:get()

	if v3413 ~= "Disabled" then
		if not t92.is_onground then
			if v3413 ~= "Static" then
				if v3413 ~= "kangaroo" then
					if v3413 ~= "Haram" then
						return
					end

					if t92.is_moving then
						local v3414 = p823[n170]

						if v3414 ~= nil then
							v3414.m_flWeight = 1

							return
						end

						return
					end

					return
				end

				p822.m_flPoseParameter[3] = math.random()
				p822.m_flPoseParameter[6] = math.random()
				p822.m_flPoseParameter[7] = math.random()

				return
			end

			p822.m_flPoseParameter[6] = 1

			return
		end

		return
	end
end
local function v874(p824)
	-- upvalues: animation_breaker (copy), n171 (copy)
	local v3416 = animation_breaker.body_lean:get()

	if v3416 ~= -1 then
		local v3417 = p824[n171]

		if v3417 ~= nil then
			v3417.m_flWeight = v3416 * 0.1

			return
		end

		return
	end
end
local function v875(p825, p826)
	-- upvalues: animation_breaker (copy), t92 (ref)
	if animation_breaker.pitch_on_land:get() then
		if t92.is_onground then
			if p826.landing then
				p825.m_flPoseParameter[12] = 0.5

				return
			end

			return
		end

		return
	end
end
local function v876(p827)
	-- upvalues: v871 (copy), n169 (copy), v872 (copy), v873 (copy), v875 (copy), v874 (copy)
	local v3421 = entity.get_local_player()

	if v3421 ~= nil and p827 == v3421 then
		local v3422 = p827:get_anim_state()

		if v3422 ~= nil then
			local v3423 = v871(p827)

			if v3423 ~= nil then
				if v3421.m_MoveType == n169 then
					v872(v3421)
					v873(v3421, v3423)
					v875(v3421, v3422)
				end

				v874(v3423)

				return
			end

			return
		end

		return
	end
end

animation_breaker.enabled:set_callback(function(p828)
	-- upvalues: v869 (copy), v876 (copy)
	local v3425 = p828:get()

	if not v3425 then
		v869:override()
	end

	events.post_update_clientside_animation(v876, v3425)
end, true)

local fake_duck = t29.misc.fake_duck
local v878 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots")
local v879 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap")
local v880 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck")
local t198 = {}
local n172 = 0

local function v883()
	-- upvalues: n172 (ref)
	if n172 >= 14 then
		n172 = 0
	end

	n172 = n172 + 1
end
local function v884()
	-- upvalues: v878 (copy), v879 (copy)
	v878:override()
	v879:override()
end
local function v885()
	-- upvalues: v884 (copy)
	v884()
end
local function v886(p829)
	-- upvalues: v880 (copy)
	if v880:get() then
		local v3427 = entity.get_local_player()

		if v3427 ~= nil then
			local v3428 = entity.get_game_rules()

			if v3428 ~= nil and v3428.m_bFreezePeriod then
				p829.camera.z = v3427:get_origin().z + 64

				return
			end

			return
		end

		return
	end
end
local function v887(p830)
	-- upvalues: v880 (copy), v884 (copy), v883 (copy), n172 (ref), v878 (copy), v879 (copy)
	if v880:get() then
		local v3430 = entity.get_game_rules()

		if v3430 ~= nil and v3430.m_bFreezePeriod then
			v883()
			p830.in_duck = not (n172 <= 7)
			p830.send_packet = n172 == 14
			v878:override(false)
			v879:override(false)

			return
		end

		return
	end

	return v884()
end

function t198.update(p831)
	-- upvalues: v885 (copy), v887 (copy), v886 (copy)
	local v3432 = p831:get("On Freezetime")

	events.shutdown(v885, v3432)
	events.createmove(v887, v3432)
	events.override_view(v886, v3432)
end

local t199 = {}

local function v889(p832)
	-- upvalues: v880 (copy)
	if v880:get() then
		local v3434 = vector(p832.forwardmove, p832.sidemove)

		if not (v3434:length2dsqr() < 25) then
			v3434:normalize()
			p832.forwardmove = v3434.x * 150
			p832.sidemove = v3434.y * 150

			return
		end

		return
	end
end

function t199.update(p833)
	-- upvalues: v889 (copy)
	events.createmove_run(v889, p833:get("Unlock Speed"))
end

fake_duck.options:set_callback(function(p834)
	-- upvalues: t198 (copy), t199 (copy)
	t198.update(p834)
	t199.update(p834)
end, true)

local nickname_generator = t29.misc.nickname_generator
local name = cvar.name
local u892 = nil
local t200 = {
	[1] = "бля нормально наваху купил",
	[2] = "я вейп купил",
	[3] = "чд? кд?",
	[4] = "якубовчи567",
	[5] = "блек ангел убившка11",
	[6] = "таракан динис",
	[7] = "жульверик",
	[8] = "яростный минерльный чеченец кажэуал",
	[9] = "снеговой авпкингуля",
	[10] = "mr геймер300",
	[11] = "хсаю вв с первой пу",
	[12] = "куда в хуй",
	[13] = "hasbik style KZ",
	[14] = "60G AJlTaUcKuX 7oP",
	[15] = "4е в Xyя7y",
	[16] = "хсаю даже на тол4ке",
	[17] = "OnlyBaim gang$",
	[18] = "был выебан кизарухвх",
	[19] = "9PoCtHblU KUnKoG",
	[20] = "TTu3дoHюx",
	[21] = "CTaPaя Ho OTTacHeHьKaя",
	[22] = "я выезжаю носопырки",
	[23] = "✪FasTIK✪",
	[24] = "\208\130\206\163\198\138O\197\129\226\136\134G\226\136\134",
	[25] = "︻デ═一 ☭ sniper",
	[26] = "ГуСеЙн ШоУ",
	[27] = "oП Я кРуТоЙ А тЫ ХуЙ",
	[28] = "хуяторубиватор6731",
	[29] = "♕ａｒｔｅｍ １５４",
	[30] = "срега мобилкин",
	[31] = "матвей крабов",
	[32] = "койфовая криветка ебланище",
	[33] = "✧*:･ﾟ✧ 𝐅𝐔𝐂𝐊 𝐘𝐎𝐔 ✧*:･ﾟ✧",
	[34] = "SPASIBO ZA SKEET",
	[35] = "𝐍𝐚𝐀𝐢𝐫𝐌𝐚𝐱",
	[36] = "буйный славик газолир",
	[37] = "лёва таракан-56",
	[38] = "yKpoTuTeJlb_6a6yweK",
	[39] = "anatoly fakeyaw",
	[40] = "Валентин",
	[41] = "Супер Снайпер228",
	[42] = "Заказать педофuла",
	[43] = "Рамзан Кадыров",
	[44] = "проверка на читы",
	[45] = "main nick sanyaKiller228",
	[46] = "Борис Животное",
	[47] = "bmw top",
	[48] = "Дима[RUS]2005",
	[49] = "ислам магомедов",
	[50] = "ТИМАТИХВХ",
	[51] = "eldoradohvh",
	[52] = "бультазар",
	[53] = "я еблан бигити",
	[54] = "pavlo.matvei98",
	[55] = "www.CSGOSETTINGS.ru 111",
	[56] = "мамкаеб2009",
	[57] = "фугас тимоха",
	[58] = "VLAD_ПУСТОЙ",
	[59] = "Велимир (Not Cheater)",
	[60] = "ОпА$нЫй мастер клатчей леха ебать",
	[61] = "KirillMachine",
	[62] = "THIS IS OMLEEEEEEET (◣◢)",
	[63] = "soldier (солдат)",
	[64] = "-----= S.E.N.A.T.O.R =-----",
	[65] = "*-КрYчE_Бога_u_ЦаРя-*",
	[66] = "ᴛʜᴇʙᴇsᴛ",
	[67] = "♥§₭îℒȴ⊕ᗩᙡǞℙℰℜ₳🎆",
	[68] = "GloBal~BaNaN",
	[69] = "Fucking.Ba[nn]Y...",
	[70] = "d[oo]dLeZzzz...",
	[71] = "VIP Sex Energy VIP",
	[72] = "🥑𝕒𝕧𝕒𝕔𝕒𝕕𝕠🥑",
	[73] = "乂...𝔡.𝔦.𝔨.𝔦.y...乂",
	[74] = "\226\149\145\226\152\190 \196\166 \206\158 \226\136\128 \229\141\131 \206\163 \229\176\186\226\149\145",
	[75] = "彡[ᴅᴇᴀᴅ ᴋɪʟʟᴇʀ]彡",
	[76] = "ʀᴇᴘ ɪɴsᴀɴᴇ ᴡɪᴛʜ ᴀᴡᴘ",
	[77] = "Спуди Мун",
	[78] = "ᗫტ₦ℋℱǾℜ",
	[79] = "☢Ď₳ÑǤĒ℟☢",
	[80] = "\196\162\197\151\196\133\197\134\196\143_\226\130\165\196\133\239\174\144\197\167\206\190\197\151",
	[81] = "F@$$$TiK...",
	[82] = "...::::K[RAM]m[ER]::::...",
	[83] = "опер окаянный",
	[84] = "ДОНАТ С PAYPAL",
	[85] = "shelzi228",
	[86] = "фарш",
	[87] = "танцую лезгинку",
	[88] = "OPERуполномоченный",
	[89] = "2 охлажденных яйца",
	[90] = "мазик окаянный",
	[91] = "Ballin' Maut",
	[92] = "Balin`Shprot",
	[93] = "MILLIONAR Balin",
	[94] = "КРАШ ТЕСТ МАРК 2",
	[95] = "\226\128\139HVH RACING",
	[96] = "клубнично-вишневый слоняра",
	[97] = "яблочный гипопотам",
	[98] = "крол ржачный абрикосовый",
	[99] = "Агрессивный карбюратор",
	[100] = "tw1x^zz1^aced1v1",
	[101] = "s1mple",
	[102] = "꧁ℳaⲦⱔɪ℣aẕⱔɪ✞꧂",
	[103] = "•ᴮᴬᴰʙᴏʏツ",
	[104] = "꧁ঔৣ☬✞𝓓𝖔𝖓✞☬ঔৣ꧂",
	[105] = "∆♣\239\184\143JOKER♥\239\184\143∆",
	[106] = "SpraY",
	[107] = "꧁༺₦Ї₦ℑ₳༻꧂",
	[108] = "➢ Iᴍᴍᴏʀᴛᴀʟ",
	[109] = "╾━╤デ╦︻ ₳₭-❹❼ 𝓰𝓸𝓭",
	[110] = "︻デ═一GOD_SK",
	[111] = "🅼*🅰\239\184\143*🆅*🅴*🆁*🅸*🅲*🅺",
	[112] = "༺Leͥgeͣnͫd༻ᴳᵒᵈ",
	[113] = "꧁✪♕BOT♕✪꧂",
	[114] = "🔥𝓖𝓡𝓐𝓢𝓤🔥",
	[115] = "TØXIC",
	[116] = "𝕵𝖆𝔳𝖎𝖎 ✪",
	[117] = "🅴🆉🆉 🅽🅾\239\184\143🅾\239\184\143🅱\239\184\143🆂",
	[118] = "꧁༺J͓̽o͓̽s͓̽I͓̽༻꧂",
	[119] = "♡ AWP – senpai ◕‿◕ [ツ]",
	[120] = "ヅ [OnI-ChaN] FreSH[x]☪\239\184\143",
	[121] = "꧁ᴳᵒᵈSlayer꧂",
	[122] = "༺Leͥgeͣnͫd༻",
	[123] =
	"\226\156\170\226\130\166\208\135\226\130\166\226\132\145\226\130\179\224\188\187\239\184\187\227\131\135\226\149\144\228\184\128",
	[124] = ".S!ckBoY^",
	[125] = "𝕾𝖙𝖚𝖗𝖒𝕽𝖊𝖇𝖊𝖑𝖑",
	[126] = "♥\239\184\143𝓚𝓮𝓝𝓝𝔂𝓢♥\239\184\143",
	[127] = "Snax",
	[128] = "꧁ঔৣ☬✞𝓵𝓮𝓰𝓮𝓷𝓭ˡᵒᵛᵉ ʸᵒᵘ✞☬ঔৣ꧂",
	[129] =
	"\226\153\149\209\149\208\189\209\148 \194\162\206\177\226\132\147\226\132\147 \208\188\209\148 \208\189\206\177\194\162",
	[130] = "✪AnARcHY_",
	[131] = "bl1tz",
	[132] = "Carry Potter",
	[133] = "✪TaCt1CaL",
	[134] = "vk.com/vampire",
	[135] = "ᗰEᗰE ᔕEᑎᔕE",
	[136] = "”*°•.★..Angel_Of_The_Night..★.•°*”˜",
	[137] =
	"\195\177\198\164\195\188\206\178\194\163\207\175 \206\168\208\189\211\185\198\164\209\140 \207\175\194\163\225\131\156\209\143 \194\163\225\131\156\194\163\207\175 j\194\163\194\167\201\165\194\167",
	[138] = "ęβãł țýä √ řøţ",
	[139] = "\229\191\141\227\129\179 1 \208\163\208\159\208\144\208\155 \227\129\179\229\191\141",
	[140] = "MaJIeHkuu_Ho_OnacHekuu",
	[141] =
	"\226\128\162\219\169\219\158\219\169[\204\178\204\133\208\159\204\178\204\133\208\190\204\178\204\133\208\155\204\178\204\133\208\174\204\178\204\133\208\177\204\178\204\133\208\144\204\178\204\133\208\161(\217\191)\204\178\204\133\208\167\204\178\204\133\208\184\204\133\208\162\204\178\204\178\208\144\208\154\204\178\204\133]\219\169\219\158\219\169\226\128\162",
	[142] = "YбИuЦа_КрИпЕrОв",
	[143] = "Теперь я - Ютубер Омлет (◣◢)",
	[144] = "ⒶaŴÞ ︻デ 一 PUTIN",
	[145] = "VAAAAAAAC \208\178 \209\135\208\176\209\130!!! (\227\129\165 \226\151\149\226\128\191\226\151\149 )",
	[146] = "づ 从闩从长丫 仨五闩人",
	[147] = "+Yeb@shu_v_k@shu+",
	[148] = "\194\163\225\131\156\195\191 \207\175\209\143",
	[149] = "AHHAHAHHAHAHH LIFEHACK ♥\239\184\143♥\239\184\143♥\239\184\143♥\239\184\143♥\239\184\143",
	[150] = "ПуЛи_От_БаБуЛи",
	[151] = "ПаРеНь БеЗ сТрАхА",
	[152] = "Н.Е.С.О.К.Р.У.Ш.И.М.Ы.Й",
	[153] = "KpyToI_4elOBeK",
	[154] = "^^Stell^^::.[Pro_Game_Xom9k]",
	[155] = "3Jlou_ЗAdrOT",
	[156] =
	"\195\177\195\188\209\171\194\164\198\164 \195\177\195\188\198\186\209\171\195\165 \207\175\195\191\198\186 \201\177\194\164\208\189\194\164\200\185\209\143",
	[157] =
	"\209\143 \196\183\194\164\208\189\201\165\195\165\206\187 \207\175\206\178\194\164\194\163\195\188 \201\177\195\165\201\177\196\183\194\163 \206\178 \198\164\194\164\207\175",
	[158] = "ⒶaŴÞ ︻デ 一",
	[159] = "комсомольский цыган",
	[160] = "носатый нос райзена",
	[161] = "ашкудишка со вкусом уха",
	[162] = "pepper roni (пицца) со вкусом сметаны",
	[163] = "METAN HVH",
	[164] = "ШВЕДСКИЙ СТОЛ ГРИГОРИЯ ЛЕПСА",
	[165] = "ААААА КЫЗЛАР КУТАК БАС АШАЛАМАНААА БИЛЯЯЯ ЭУУУ",
	[166] = "Z V",
	[167] = "СЛЫШУ ZOV",
	[168] = "ТЮФЯЯЯК (ПАТРИК)",
	[169] = "GuGu_Zha_IIIagu",
	[170] = "GyGaBait",
	[171] = "ebaWu_V_KaWu (Z)",
	[172] = "МАМИНО ПРОТИВОРЕЧИЕ",
	[173] = "Nellячка UwU",
	[174] = "Фильм «Улыбка»",
	[175] = "Котлетосы из zыра",
	[176] = "Какао бобер",
	[177] = "Фальшивая утка",
	[178] = "Рыскание нижней части тела",
	[179] = "гусейн газ",
	[180] = "туалетный утюг",
	[181] = "Газования на удачу",
	[182] = "спираль маны",
	[183] = "Подкова сракотана",
	[184] = "Дупло хомяка",
	[185] = "Бельчий аул",
	[186] = "ЯЗЫК ТЕЛА",
	[187] = "тюльпановые горы радости",
	[188] = "Сыр быб рыр",
	[189] = "ШимпанZе (обидка)",
	[190] = "Ложные отставания",
	[191] = "Вбив / выбив зубов г.Урюпинск",
	[192] = "Гусейн газуй нах",
	[193] = "Зеница око",
	[194] = "Zorix(csgo)",
	[195] = "Пидер пайдер",
	[196] = "Зубы мудрости",
	[197] = "Щекотное теребоньканье",
	[198] = "ZELTR1X",
	[199] = "ZOLDY1337",
	[200] = "K1neXj.",
	[201] = "Evolvex",
	[202] = "ANGELS HVH",
	[203] = "Шестая пятка",
	[204] = "Мозолистый шалопай",
	[205] = "тюремский узурпатор",
	[206] = "Стояк пыхтун",
	[207] = "Натоптыши",
	[208] = "Набрал долгов",
	[209] = "Забив кальянов",
	[210] = "Турничковая забивка",
	[211] = "Тренировка под дождем",
	[212] = "Дрочу стоя",
	[213] = "Йожик жухлый",
	[214] = "Ехидная харя",
	[215] = "Кайфецкий кумарчик",
	[216] = "КАРТОФЕЛЬ",
	[217] = "SANCHEZJ X FIPP",
	[218] = "ГЕОРГИЙ ФАМУТИЛОВ",
	[219] = "АЗАЗАЗАЗА АЗЛАГОР",
	[220] = "Ребенок подкидышь",
	[221] = "ДЕТИ В ПОДВАЛЕ",
	[222] = "СТИВАХА",
	[223] = "Фрост снейк и парниша",
	[224] = "ТИМОФЕЙ И ЕГО ДРУГ ПЬЯНЫЙ ЕГОР",
	[225] = "Заблокированный скайп",
	[226] = "ДОКТОР БРАУН? слушаю.",
	[227] = "АРОМАТ ЗИРАПТОРСА ССЫТ В РАКОВИНУ",
	[228] = "СКАААЙ",
	[229] = "Доктор бабун",
	[230] = "нитрат фабурита",
	[231] = "черноголовка))",
	[232] = "Ссыканье в тазик",
	[233] = "ликтофат натрия",
	[234] = "Мытье в бидоне",
	[235] = "нипортам в раковине",
	[236] = "выгуливать колбасу вместо собаки на балконе",
	[237] = "Гиппопотам сырный",
	[238] = "зупифальный назальный спрей для ногтей",
	[239] = "Пидорские сырники",
	[240] = "гоги на уроги",
	[241] = "GoGiMan777",
	[242] = "Карамельные ноготочки",
	[243] = "деревянное яблоко",
	[244] = "арбузные сланцы",
	[245] = "hey? MACARENAA",
	[246] = "трицерапторс",
	[247] = "Хорошая одежда",
	[248] = "LXNER репир",
	[249] = "Модный приговор",
	[250] = "студент",
	[251] = "Релиз sqwore",
	[252] = "хайперпоп самара",
	[253] = "18двадцетин",
	[254] = "Цитрус от зуда",
	[255] = "Цитриновый кашель",
	[256] = "Тандум верде форте",
	[257] = "ТАБУН ГОСТЕЙ",
	[258] = "ОЛЕГ ТИНЬКОФФ",
	[259] = "SAILOR MOON РОБЕРТ С АРБУЗОМ",
	[260] = "КОЗАХСТАН ЫЫЫЫЫААААААА",
	[261] = "Велимир спиридонов",
	[262] = "Вахид бабев",
	[263] = "Сурикатный тушканчик",
	[264] = "Азиз шавершян",
	[265] = "вильветовый осьминог",
	[266] = "колбаса с лысым мужиком",
	[267] = "деньги и пахучие ноги",
	[268] = "Карась со стразами",
	[269] = "РЫБА МОЕЙ МЕЧТИ",
	[270] = "ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЗЬ",
	[271] = "Тунец от халики",
	[272] = "Камбала в ванне",
	[273] = "кальянизация прошла успешно🌹",
	[274] = "шишка в мышке",
	[275] = "Плотное яблочко",
	[276] = "лопасти микрофона",
	[277] = "Кумарная сессия",
	[278] = "клавиатура информатика",
	[279] = "Пробирка биологички",
	[280] = "зеленое небо в закате",
	[281] = "темное озарение тепла",
	[282] = "пенящее счастье",
	[283] = "со скитулькой в ммулю",
	[284] = "богатые волосы киркорова",
	[285] = "Играю как fifty",
	[286] = "корова римзакса",
	[287] = "Рамоны от сереги",
	[288] = "путильфат гульзантия (привет)",
	[289] = "рафы от Raffaello",
	[290] = "красная машина с деревом от питольды",
	[291] = "Прикольный пудинг от пончика",
	[292] = "кожаная стена",
	[293] = "подстольные полупокеры",
	[294] = "амстердам гильгона",
	[295] = "Звонок на урок",
	[296] = "Табурет очки усы",
	[297] = "Читаю репчагу",
	[298] = "ЧИПСИ ОТ РЕНЕГАТА ТАТАРСКОГО",
	[299] = "ТАТАРСКИЙ MALIK163ONMYNECK",
	[300] = "НОВЫЙ РЕПИР",
	[301] = "ВУМПИР",
	[302] = "носатое уебище",
	[303] = "шестое чувство",
	[304] = "жопный предикт",
	[305] = "ЧИТЕРЫ ИМЕЮТ 6 ЧУВТСВО",
	[306] = "ТРЕТИЙ ГЛАЗ НА ПРАВОЙ ЩЕКЕ",
	[307] = "ПОДБОРОДОК В РАЗВАЛ С НОСОРОГОМ",
	[308] = "ГНИЛОЙ УТЮГ",
	[309] = "ПЬЯНАЯ ДЫНЯ",
	[310] = "БЕШЕНЫЙ КАРТОФЕЛЬ",
	[311] = "Пьяный пылесос",
	[312] = "UWU GANG",
	[313] = "Йобнутий ежик",
	[314] = "Ежик в тумане",
	[315] = "Манул в зоопарке",
	[316] = "темный валет",
	[317] = "нюхнул подмыхарик",
	[318] = "ушасто большие брови",
	[319] = "похожу на яндекс браузер",
	[320] = "Слон на крокодиле",
	[321] = "индюк в масле",
	[322] = "бурдюк с приколом",
	[323] = "киевская котлета",
	[324] = "шило на мыло",
	[325] = "Бабу на камень",
	[326] = "цукерберг панзерфауст 1337",
	[327] = "запорожье 9000",
	[328] = "Москвич 65",
	[329] = "я что похож на абонента",
	[330] = "Серега дурный",
	[331] = "иван нави",
	[332] = "Ответ на том конце",
	[333] = "Свет в начале елки",
	[334] = "сергей факел",
	[335] = "хуйпастрипс",
	[336] = "хуйпачипс",
	[337] = "Хуйпасоль",
	[338] = "Хуйпабургер",
	[339] = "Рис с касымаком",
	[340] = "Скаленаш мотыга",
	[341] = "Скаленаш такыш",
	[342] = "чифирок с горящим котом",
	[343] = "Она с Казахстана",
	[344] = "Насвай не кидаем это харам харам",
	[345] = "усатое позорище",
	[346] = "Утренний намаз под канун нового года",
	[347] = "мы не делаем трап мы делаем большие ногти",
	[348] = "узбек русский",
	[349] = "На носу героин",
	[350] = "Зависимый самовар",
	[351] = "синие волосы покорили небо",
	[352] = "ZV шмаль в плече",
	[353] = "Дефектный перфоратор",
	[354] = "самовыражающий никсвар",
	[355] = "настоящий пубертант",
	[356] = "Gloria damn",
	[357] = "антология антона",
	[358] = "gloria fuck",
	[359] = "cocki яки",
	[360] = "китайский реп",
	[361] = "цуфанзю фамерге (хвх)",
	[362] = "куталбык шурабзик",
	[363] = "тупой урод",
	[364] = "сумка со вкусом витальки",
	[365] = "черепа в афганистане пьют микрофон",
	[366] = "пить еду есть воду",
	[367] = "желтоволосый паспорт",
	[368] = "пиздец меня расперло нахуй чел",
	[369] = "Залог успехов",
	[370] = "Рыба в кляре",
	[371] = "Громофон",
	[372] = "Шуба под селедкой",
	[373] = "Мануал по манулам",
	[374] = "НИКОГДА НЕ ПРОИГРЫВАТЬ",
	[375] = "Пятьдесят",
	[376] = "семьсот десять",
	[377] = "грям арбуса",
	[378] = "вес хача",
	[379] = "1хбет",
	[380] = "yamete kudasai ^^",
	[381] = "Приехала чихуахуа",
	[382] = "чихнул без слез",
	[383] = "альпенист в песке",
	[384] = "Банановый рай",
	[385] = "Желток на чилипиздрике",
	[386] = "Говорящий портсигар",
	[387] = "Перевернутая канарейка",
	[388] = "жесткий кинотеатр",
	[389] = "Зимнее лето",
	[390] = "третий подбородок",
	[391] = "Лью лимонад мимо рта",
	[392] = "Перезаряжаю кефир",
	[393] = "кашляю хэшем",
	[394] = "Молоко 2 литра",
	[395] = "колбаса с капустой да еще и с печеньем",
	[396] = "да и в прикуску cockа кола",
	[397] = "Хитрый ксими",
	[398] = "Новомодный vertu",
	[399] = "интернет кабель",
	[400] = "Телефонный шнур",
	[401] = "шнур для бритья",
	[402] = "Барабашка без катушек",
	[403] = "Мокрое белье",
	[404] = "яйцо со стрипсом в ухе",
	[405] = "мои мысле на мыле они so low",
	[406] = "В ЧЕРНОМ СПИСКЕ",
	[407] = "тики токи от бурмалды",
	[408] = "ушастый шоколад",
	[409] = "мышка логиYECH",
	[410] = "MinYEAT",
	[411] = "МИНЬЕТ",
	[412] = "Гарик до челюсти",
	[413] = "Обидчевый школьник",
	[414] = "ПАБАКА УЛЫБАКА",
	[415] = "УХ-ТЫ-Ж-ЙО!",
	[416] = "Етижи пассатижи",
	[417] = "Шило в рыло",
	[418] = "Лайф в кайф",
	[419] = "КАЙФ ЛАЙФ",
	[420] = "Zahar bobr",
	[421] = "Вера в замая",
	[422] = "15 год это важно",
	[423] = "Коля хейтер",
	[424] = "писюнистый факультет",
	[425] = "всем спать",
	[426] = "вельветовый осьминог",
	[427] = "мясной медвед",
	[428] = "first day with neverlose.cc",
	[429] = "https://discord.gg/K9Hwhmc9eH",
	[430] = "Успешный автомобилист",
	[431] = "автоподбор KZ",
	[432] = "Базовая и полная",
	[433] = "май алмайды!",
	[434] = "Асты таза, стакандары сау"
}

local function v894()
	-- upvalues: u892 (ref)
	if u892 ~= nil then
		common.set_name(u892)
		u892 = nil

		return
	end
end
local function v895()
	-- upvalues: v894 (copy)
	v894()
end

nickname_generator.set_button:set_callback(function()
	-- upvalues: u892 (ref), name (copy), nickname_generator (copy), v895 (copy)
	if u892 == nil then
		u892 = name:string()
	end

	common.set_name(nickname_generator.input:get())
	events.shutdown(v895, true)
end)
nickname_generator.reset_button:set_callback(function()
	-- upvalues: v894 (copy), v895 (copy)
	v894()
	events.shutdown(v895, false)
end)
nickname_generator.generate_button:set_callback(function()
	-- upvalues: t200 (copy), nickname_generator (copy)
	local v3437 = t200[math.random(1, #t200)]

	nickname_generator.input:set(v3437)
end)

local t201 = {
	[1] = "crash",
	[2] = "flush",
	[3] = "buildmodelforworld",
	[4] = "envmap",
	[5] = "demos",
	[6] = "+mat_texture_list",
	[7] = "cc_random",
	[8] = "kdtree_test",
	[9] = "spincycle",
	[10] = "-mat_texture_list",
	[11] = "ai_test_los",
	[12] = "cl_soundscape_printdebuginfo"
}

for i = 1, #t201 do
	local v898 = t201[i]

	cvar[v898]:set_callback(function()
		-- upvalues: i (copy)
		print("\aFF4040FFerror CV" .. i)

		return false
	end)
end
