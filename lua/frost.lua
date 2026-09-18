local pui = require("neverlose/pui")
local clipboard = require("neverlose/clipboard")
local base64 = require("neverlose/base64")
local v8, t1, t3, t4, t5, t6, t13, t14, t22, t40

do
	local ffi = require("ffi")
	local v9, skeet_indicators, v207

	do
		local s1 = "Frost"

		do
			local v7, v93, v94, v95, v97, v98, v99, v100

			do
				local v12, visuals, misc, movement, v56, v57, v58

				do
					local s2 = "\226\128\138"

					if math.clamp == nil then
						function math.clamp(p1, p2, p3)
							return math.max(p2, math.min(p3, p1))
						end
					end

					function v7(p4, p5)
						if bitlib == nil or bitlib.band == nil then
							if bit == nil or bit.band == nil then
								return p5 <= p4 % (p5 * 2) and p5 or 0
							end

							return bit.band(p4, p5)
						end

						return bitlib.band(p4, p5)
					end
					function v8(...)
						local s3 = ""

						for i = 1, select("#", ...) do
							s3 = s3 .. select(i, ...)
						end

						return s3
					end
					function v9(p6)
						return math.floor(p6 + 0.5)
					end

					t1 = {}

					do
						local t2 = {}

						function t1.get(p7)
							-- upvalues: t2 (copy)
							local v319 = t2[p7]

							if v319 == nil then
								v319 = ui.get_icon(p7) or ""
								t2[p7] = v319
							end

							return v319
						end
					end

					function v12(p8, p9)
						-- upvalues: v8 (copy), s2 (copy), t1 (ref)
						return v8(string.rep(s2, 2), "\a{Link Active}", t1.get(p8), "\aDEFAULT", string.rep(s2, 6), p9)
					end

					do
						local function v13(...)
							local ok, result = pcall(ui.find, ...)

							if not ok then
								return nil
							end

							return result
						end

						t3 = {
							aa = {
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
									disable_yaw_modifiers = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"),
									body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"),
									extended_angles = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"),
									extended_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"),
									extended_roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll")
								},
								misc = {
									slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
									fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
									leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
								}
							},
							rage = {
								double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
								double_tap_lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
								hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
								hide_shots_options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"),
								dormant_aimbot = v13("Aimbot", "Ragebot", "Main", "Dormant Aimbot"),
								safe_points = v13("Aimbot", "Ragebot", "Safety", "Safe Points"),
								body_aim = v13("Aimbot", "Ragebot", "Safety", "Body Aim"),
								min_damage = v13("Aimbot", "Ragebot", "Selection", "Min. Damage"),
								hit_chance = v13("Aimbot", "Ragebot", "Selection", "Hit Chance")
							},
							misc = {
								fake_latency = v13("Miscellaneous", "Main", "Other", "Fake Latency"),
								auto_peek = v13("Miscellaneous", "Main", "Movement", "Auto Peek") or (v13("Miscellaneous", "Main", "Movement", "Peek Assist") or (v13("Miscellaneous", "Main", "Other", "Auto Peek") or (v13("Miscellaneous", "Main", "Other", "Peek Assist") or (v13("Aimbot", "Ragebot", "Main", "Auto Peek") or v13("Aimbot", "Ragebot", "Main", "Peek Assist")))))
							},
							visuals = {
								scope_overlay = v13("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
							}
						}
					end

					t4 = {
						[1] = {
							[1] = "Local T Agent",
							[2] = "models/player/custom_player/legacy/tm_phoenix.mdl",
							[3] = true
						},
						[2] = {
							[1] = "Local CT Agent",
							[2] = "models/player/custom_player/legacy/ctm_sas.mdl",
							[3] = false
						},
						[3] = {
							[1] = "Blackwolf | Sabre",
							[2] = "models/player/custom_player/legacy/tm_balkan_variantj.mdl",
							[3] = true
						},
						[4] = {
							[1] = "Rezan The Ready | Sabre",
							[2] = "models/player/custom_player/legacy/tm_balkan_variantg.mdl",
							[3] = true
						},
						[5] = {
							[1] = "Maximus | Sabre",
							[2] = "models/player/custom_player/legacy/tm_balkan_varianti.mdl",
							[3] = true
						},
						[6] = {
							[1] = "Dragomir | Sabre",
							[2] = "models/player/custom_player/legacy/tm_balkan_variantf.mdl",
							[3] = true
						},
						[7] = {
							[1] = "Lt. Commander Ricksaw | NSWC SEAL",
							[2] = "models/player/custom_player/legacy/ctm_st6_varianti.mdl",
							[3] = false
						},
						[8] = {
							[1] = "'Two Times' McCoy | USAF TACP",
							[2] = "models/player/custom_player/legacy/ctm_st6_variantm.mdl",
							[3] = false
						},
						[9] = {
							[1] = "Buckshot | NSWC SEAL",
							[2] = "models/player/custom_player/legacy/ctm_st6_variantg.mdl",
							[3] = false
						},
						[10] = {
							[1] = "Seal Team 6 Soldier | NSWC SEAL",
							[2] = "models/player/custom_player/legacy/ctm_st6_variante.mdl",
							[3] = false
						},
						[11] = {
							[1] = "3rd Commando Company | KSK",
							[2] = "models/player/custom_player/legacy/ctm_st6_variantk.mdl",
							[3] = false
						},
						[12] = {
							[1] = "'The Doctor' Romanov | Sabre",
							[2] = "models/player/custom_player/legacy/tm_balkan_varianth.mdl",
							[3] = true
						},
						[13] = {
							[1] = "Michael Syfers | FBI Sniper",
							[2] = "models/player/custom_player/legacy/ctm_fbi_varianth.mdl",
							[3] = false
						},
						[14] = {
							[1] = "Markus Delrow | FBI HRT",
							[2] = "models/player/custom_player/legacy/ctm_fbi_variantg.mdl",
							[3] = false
						},
						[15] = {
							[1] = "Operator | FBI SWAT",
							[2] = "models/player/custom_player/legacy/ctm_fbi_variantf.mdl",
							[3] = false
						},
						[16] = {
							[1] = "Slingshot | Phoenix",
							[2] = "models/player/custom_player/legacy/tm_phoenix_variantg.mdl",
							[3] = true
						},
						[17] = {
							[1] = "Enforcer | Phoenix",
							[2] = "models/player/custom_player/legacy/tm_phoenix_variantf.mdl",
							[3] = true
						},
						[18] = {
							[1] = "Soldier | Phoenix",
							[2] = "models/player/custom_player/legacy/tm_phoenix_varianth.mdl",
							[3] = true
						},
						[19] = {
							[1] = "The Elite Mr. Muhlik | Elite Crew",
							[2] = "models/player/custom_player/legacy/tm_leet_variantf.mdl",
							[3] = true
						},
						[20] = {
							[1] = "Prof. Shahmat | Elite Crew",
							[2] = "models/player/custom_player/legacy/tm_leet_varianti.mdl",
							[3] = true
						},
						[21] = {
							[1] = "Osiris | Elite Crew",
							[2] = "models/player/custom_player/legacy/tm_leet_varianth.mdl",
							[3] = true
						},
						[22] = {
							[1] = "Ground Rebel | Elite Crew",
							[2] = "models/player/custom_player/legacy/tm_leet_variantg.mdl",
							[3] = true
						},
						[23] = {
							[1] = "Special Agent Ava | FBI",
							[2] = "models/player/custom_player/legacy/ctm_fbi_variantb.mdl",
							[3] = false
						},
						[24] = {
							[1] = "B Squadron Officer | SAS",
							[2] = "models/player/custom_player/legacy/ctm_sas_variantf.mdl",
							[3] = false
						},
						[25] = {
							[1] = "Anarchist",
							[2] = "models/player/custom_player/legacy/tm_anarchist.mdl",
							[3] = true
						},
						[26] = {
							[1] = "Anarchist (Variant A)",
							[2] = "models/player/custom_player/legacy/tm_anarchist_varianta.mdl",
							[3] = true
						},
						[27] = {
							[1] = "Anarchist (Variant B)",
							[2] = "models/player/custom_player/legacy/tm_anarchist_variantb.mdl",
							[3] = true
						},
						[28] = {
							[1] = "Anarchist (Variant C)",
							[2] = "models/player/custom_player/legacy/tm_anarchist_variantc.mdl",
							[3] = true
						},
						[29] = {
							[1] = "Anarchist (Variant D)",
							[2] = "models/player/custom_player/legacy/tm_anarchist_variantd.mdl",
							[3] = true
						},
						[30] = {
							[1] = "Pirate",
							[2] = "models/player/custom_player/legacy/tm_pirate.mdl",
							[3] = true
						},
						[31] = {
							[1] = "Pirate (Variant A)",
							[2] = "models/player/custom_player/legacy/tm_pirate_varianta.mdl",
							[3] = true
						},
						[32] = {
							[1] = "Pirate (Variant B)",
							[2] = "models/player/custom_player/legacy/tm_pirate_variantb.mdl",
							[3] = true
						},
						[33] = {
							[1] = "Pirate (Variant C)",
							[2] = "models/player/custom_player/legacy/tm_pirate_variantc.mdl",
							[3] = true
						},
						[34] = {
							[1] = "Pirate (Variant D)",
							[2] = "models/player/custom_player/legacy/tm_pirate_variantd.mdl",
							[3] = true
						},
						[35] = {
							[1] = "Professional",
							[2] = "models/player/custom_player/legacy/tm_professional.mdl",
							[3] = true
						},
						[36] = {
							[1] = "Professional (Variant 1)",
							[2] = "models/player/custom_player/legacy/tm_professional_var1.mdl",
							[3] = true
						},
						[37] = {
							[1] = "Professional (Variant 2)",
							[2] = "models/player/custom_player/legacy/tm_professional_var2.mdl",
							[3] = true
						},
						[38] = {
							[1] = "Professional (Variant 3)",
							[2] = "models/player/custom_player/legacy/tm_professional_var3.mdl",
							[3] = true
						},
						[39] = {
							[1] = "Professional (Variant 4)",
							[2] = "models/player/custom_player/legacy/tm_professional_var4.mdl",
							[3] = true
						},
						[40] = {
							[1] = "Separatist",
							[2] = "models/player/custom_player/legacy/tm_separatist.mdl",
							[3] = true
						},
						[41] = {
							[1] = "Separatist (Variant A)",
							[2] = "models/player/custom_player/legacy/tm_separatist_varianta.mdl",
							[3] = true
						},
						[42] = {
							[1] = "Separatist (Variant B)",
							[2] = "models/player/custom_player/legacy/tm_separatist_variantb.mdl",
							[3] = true
						},
						[43] = {
							[1] = "Separatist (Variant C)",
							[2] = "models/player/custom_player/legacy/tm_separatist_variantc.mdl",
							[3] = true
						},
						[44] = {
							[1] = "Separatist (Variant D)",
							[2] = "models/player/custom_player/legacy/tm_separatist_variantd.mdl",
							[3] = true
						},
						[45] = {
							[1] = "GIGN",
							[2] = "models/player/custom_player/legacy/ctm_gign.mdl",
							[3] = false
						},
						[46] = {
							[1] = "GIGN (Variant A)",
							[2] = "models/player/custom_player/legacy/ctm_gign_varianta.mdl",
							[3] = false
						},
						[47] = {
							[1] = "GIGN (Variant B)",
							[2] = "models/player/custom_player/legacy/ctm_gign_variantb.mdl",
							[3] = false
						},
						[48] = {
							[1] = "GIGN (Variant C)",
							[2] = "models/player/custom_player/legacy/ctm_gign_variantc.mdl",
							[3] = false
						},
						[49] = {
							[1] = "GIGN (Variant D)",
							[2] = "models/player/custom_player/legacy/ctm_gign_variantd.mdl",
							[3] = false
						},
						[50] = {
							[1] = "GSG-9",
							[2] = "models/player/custom_player/legacy/ctm_gsg9.mdl",
							[3] = false
						},
						[51] = {
							[1] = "GSG-9 (Variant A)",
							[2] = "models/player/custom_player/legacy/ctm_gsg9_varianta.mdl",
							[3] = false
						},
						[52] = {
							[1] = "GSG-9 (Variant B)",
							[2] = "models/player/custom_player/legacy/ctm_gsg9_variantb.mdl",
							[3] = false
						},
						[53] = {
							[1] = "GSG-9 (Variant C)",
							[2] = "models/player/custom_player/legacy/ctm_gsg9_variantc.mdl",
							[3] = false
						},
						[54] = {
							[1] = "GSG-9 (Variant D)",
							[2] = "models/player/custom_player/legacy/ctm_gsg9_variantd.mdl",
							[3] = false
						},
						[55] = {
							[1] = "IDF",
							[2] = "models/player/custom_player/legacy/ctm_idf.mdl",
							[3] = false
						},
						[56] = {
							[1] = "IDF (Variant B)",
							[2] = "models/player/custom_player/legacy/ctm_idf_variantb.mdl",
							[3] = false
						},
						[57] = {
							[1] = "IDF (Variant C)",
							[2] = "models/player/custom_player/legacy/ctm_idf_variantc.mdl",
							[3] = false
						},
						[58] = {
							[1] = "IDF (Variant D)",
							[2] = "models/player/custom_player/legacy/ctm_idf_variantd.mdl",
							[3] = false
						},
						[59] = {
							[1] = "IDF (Variant E)",
							[2] = "models/player/custom_player/legacy/ctm_idf_variante.mdl",
							[3] = false
						},
						[60] = {
							[1] = "IDF (Variant F)",
							[2] = "models/player/custom_player/legacy/ctm_idf_variantf.mdl",
							[3] = false
						},
						[61] = {
							[1] = "SWAT",
							[2] = "models/player/custom_player/legacy/ctm_swat.mdl",
							[3] = false
						},
						[62] = {
							[1] = "SWAT (Variant A)",
							[2] = "models/player/custom_player/legacy/ctm_swat_varianta.mdl",
							[3] = false
						},
						[63] = {
							[1] = "SWAT (Variant B)",
							[2] = "models/player/custom_player/legacy/ctm_swat_variantb.mdl",
							[3] = false
						},
						[64] = {
							[1] = "SWAT (Variant C)",
							[2] = "models/player/custom_player/legacy/ctm_swat_variantc.mdl",
							[3] = false
						},
						[65] = {
							[1] = "SWAT (Variant D)",
							[2] = "models/player/custom_player/legacy/ctm_swat_variantd.mdl",
							[3] = false
						},
						[66] = {
							[1] = "SAS",
							[2] = "models/player/custom_player/legacy/ctm_sas.mdl",
							[3] = false
						},
						[67] = {
							[1] = "SAS (Variant A)",
							[2] = "models/player/custom_player/legacy/ctm_sas_varianta.mdl",
							[3] = false
						},
						[68] = {
							[1] = "SAS (Variant B)",
							[2] = "models/player/custom_player/legacy/ctm_sas_variantb.mdl",
							[3] = false
						},
						[69] = {
							[1] = "SAS (Variant C)",
							[2] = "models/player/custom_player/legacy/ctm_sas_variantc.mdl",
							[3] = false
						},
						[70] = {
							[1] = "SAS (Variant D)",
							[2] = "models/player/custom_player/legacy/ctm_sas_variantd.mdl",
							[3] = false
						},
						[71] = {
							[1] = "ST6",
							[2] = "models/player/custom_player/legacy/ctm_st6.mdl",
							[3] = false
						},
						[72] = {
							[1] = "ST6 (Variant A)",
							[2] = "models/player/custom_player/legacy/ctm_st6_varianta.mdl",
							[3] = false
						},
						[73] = {
							[1] = "ST6 (Variant B)",
							[2] = "models/player/custom_player/legacy/ctm_st6_variantb.mdl",
							[3] = false
						},
						[74] = {
							[1] = "ST6 (Variant C)",
							[2] = "models/player/custom_player/legacy/ctm_st6_variantc.mdl",
							[3] = false
						},
						[75] = {
							[1] = "ST6 (Variant D)",
							[2] = "models/player/custom_player/legacy/ctm_st6_variantd.mdl",
							[3] = false
						},
						[76] = {
							[1] = "Balkan (Variant A)",
							[2] = "models/player/custom_player/legacy/tm_balkan_varianta.mdl",
							[3] = true
						},
						[77] = {
							[1] = "Balkan (Variant B)",
							[2] = "models/player/custom_player/legacy/tm_balkan_variantb.mdl",
							[3] = true
						},
						[78] = {
							[1] = "Balkan (Variant C)",
							[2] = "models/player/custom_player/legacy/tm_balkan_variantc.mdl",
							[3] = true
						},
						[79] = {
							[1] = "Balkan (Variant D)",
							[2] = "models/player/custom_player/legacy/tm_balkan_variantd.mdl",
							[3] = true
						},
						[80] = {
							[1] = "Balkan (Variant E)",
							[2] = "models/player/custom_player/legacy/tm_balkan_variante.mdl",
							[3] = true
						},
						[81] = {
							[1] = "Jumpsuit (Variant A)",
							[2] = "models/player/custom_player/legacy/tm_jumpsuit_varianta.mdl",
							[3] = true
						},
						[82] = {
							[1] = "Jumpsuit (Variant B)",
							[2] = "models/player/custom_player/legacy/tm_jumpsuit_variantb.mdl",
							[3] = true
						},
						[83] = {
							[1] = "Jumpsuit (Variant C)",
							[2] = "models/player/custom_player/legacy/tm_jumpsuit_variantc.mdl",
							[3] = true
						},
						[84] = {
							[1] = "Phoenix Heavy",
							[2] = "models/player/custom_player/legacy/tm_phoenix_heavy.mdl",
							[3] = true
						},
						[85] = {
							[1] = "Heavy",
							[2] = "models/player/custom_player/legacy/ctm_heavy.mdl",
							[3] = false
						},
						[86] = {
							[1] = "Leet (Variant A)",
							[2] = "models/player/custom_player/legacy/tm_leet_varianta.mdl",
							[3] = true
						},
						[87] = {
							[1] = "Leet (Variant B)",
							[2] = "models/player/custom_player/legacy/tm_leet_variantb.mdl",
							[3] = true
						},
						[88] = {
							[1] = "Leet (Variant C)",
							[2] = "models/player/custom_player/legacy/tm_leet_variantc.mdl",
							[3] = true
						},
						[89] = {
							[1] = "Leet (Variant D)",
							[2] = "models/player/custom_player/legacy/tm_leet_variantd.mdl",
							[3] = true
						},
						[90] = {
							[1] = "Leet (Variant E)",
							[2] = "models/player/custom_player/legacy/tm_leet_variante.mdl",
							[3] = true
						},
						[91] = {
							[1] = "Phoenix",
							[2] = "models/player/custom_player/legacy/tm_phoenix.mdl",
							[3] = true
						},
						[92] = {
							[1] = "Phoenix (Variant A)",
							[2] = "models/player/custom_player/legacy/tm_phoenix_varianta.mdl",
							[3] = true
						},
						[93] = {
							[1] = "Phoenix (Variant B)",
							[2] = "models/player/custom_player/legacy/tm_phoenix_variantb.mdl",
							[3] = true
						},
						[94] = {
							[1] = "Phoenix (Variant C)",
							[2] = "models/player/custom_player/legacy/tm_phoenix_variantc.mdl",
							[3] = true
						},
						[95] = {
							[1] = "Phoenix (Variant D)",
							[2] = "models/player/custom_player/legacy/tm_phoenix_variantd.mdl",
							[3] = true
						},
						[96] = {
							[1] = "FBI",
							[2] = "models/player/custom_player/legacy/ctm_fbi.mdl",
							[3] = false
						},
						[97] = {
							[1] = "FBI (Variant A)",
							[2] = "models/player/custom_player/legacy/ctm_fbi_varianta.mdl",
							[3] = false
						},
						[98] = {
							[1] = "FBI (Variant C)",
							[2] = "models/player/custom_player/legacy/ctm_fbi_variantc.mdl",
							[3] = false
						},
						[99] = {
							[1] = "FBI (Variant D)",
							[2] = "models/player/custom_player/legacy/ctm_fbi_variantd.mdl",
							[3] = false
						},
						[100] = {
							[1] = "FBI (Variant E)",
							[2] = "models/player/custom_player/legacy/ctm_fbi_variante.mdl",
							[3] = false
						},
						by_name = {},
						t_names = {
							[1] = "Disabled"
						},
						ct_names = {
							[1] = "Disabled"
						}
					}

					for _, v in ipairs(t4) do
						local v18 = v[1]

						t4.by_name[v18] = {
							path = v[2],
							is_t = v[3]
						}

						if not v[3] then
							t4.ct_names[#t4.ct_names + 1] = v18
						else
							t4.t_names[#t4.t_names + 1] = v18
						end
					end

					t5 = {
						roots = {},
						items = {}
					}

					function t5.add_root(p10, p11)
						-- upvalues: t5 (ref)
						if type(p10) == "string" and type(p11) == "table" then
							t5.roots[#t5.roots + 1] = {
								path = p10,
								node = p11
							}

							return
						end
					end
					function t5.add_item(p12, p13)
						-- upvalues: t5 (ref)
						if type(p12) == "string" and p13 ~= nil then
							t5.items[#t5.items + 1] = {
								path = p12,
								item = p13
							}

							return
						end
					end

					t6 = {
						home_icon = t1.get("snowflake"),
						anti_aim_icon = t1.get("star"),
						other_icon = t1.get("paintbrush")
					}
					t6.groups = {
						home = {
							config_system = pui.create(t6.home_icon, v12("folder-open", "Presets"), 1),
							information = pui.create(t6.home_icon, v12("bell-on", "Status"), 2),
							settings = pui.create(t6.home_icon, v12("gear", "Interface"), 2)
						},
						anti_aim = {
							main = pui.create(t6.anti_aim_icon, v12("stars", "State Desk"), 1),
							tweaks = pui.create(t6.anti_aim_icon, v12("bolt-lightning", "Live Tweaks"), 1),
							mode = pui.create(t6.anti_aim_icon, v12("light-switch", "Builder Mode"), 2),
							yaw = pui.create(t6.anti_aim_icon, v12("arrow-right-arrow-left", "Yaw Offsets"), 2),
							yaw_modifier = pui.create(t6.anti_aim_icon, v12("arrows-spin", "Modifier Lab"), 2),
							body_yaw = pui.create(t6.anti_aim_icon, v12("arrows-cross", "Switch Timing"), 2),
							break_lc = pui.create(t6.anti_aim_icon, v12("bolt", "Defensive Layer"), 2)
						},
						other = {
							tabs = pui.create(t6.other_icon, v12("list", "Toolbox"), 1),
							ragebot = pui.create(t6.other_icon, v12("crosshairs", "Combat Tools"), 2),
							visuals = pui.create(t6.other_icon, v12("paintbrush", "Screen Tools"), 2),
							misc = pui.create(t6.other_icon, v12("box", "World Tools"), 2),
							movement = pui.create(t6.other_icon, v12("person-falling", "Movement Tools"), 2)
						}
					}
					t6.information = {}

					do
						local str = tostring(common.get_username() or "unknown")

						t6.information.username = t6.groups.home.information:label(v12("user", v8("User: \v", str)))
						t6.information.last_update = t6.groups.home.information:label(v12("calendar-days", v8("Build date: \v", "03.06.2026")))
						t6.settings = {}

						local settings = t6.groups.home.settings

						t6.settings.watermark = settings:label(v12("stars", "HUD Watermark"), function(p14)
							-- upvalues: s1 (copy)
							return {
								font = p14:combo("Typeface", {
									[1] = "Default",
									[2] = "Small",
									[3] = "Console",
									[4] = "Bold"
								}),
								text = p14:input("Caption", s1),
								effects = p14:selectable("Animation", {
									[1] = "Gradient",
									[2] = "Matrix",
									[3] = "Matrix 2",
									[4] = "Pulse"
								}),
								rainbow = p14:switch("Spectrum"),
								col_a = p14:color_picker("Primary", color(255, 255, 255, 255)),
								col_b = p14:color_picker("Secondary", color(255, 255, 255, 255))
							}
						end)
						t6.settings.watermark.rainbow:depend({
							[1] = nil,
							[2] = "Gradient",
							[1] = t6.settings.watermark.effects
						})
						t6.settings.watermark.col_a:depend({
							[1] = nil,
							[2] = false,
							[1] = t6.settings.watermark.rainbow
						})
						t6.settings.watermark.col_b:depend({
							[1] = nil,
							[2] = "Gradient",
							[1] = t6.settings.watermark.effects
						}, {
							[1] = nil,
							[2] = false,
							[1] = t6.settings.watermark.rainbow
						})
						t6.settings.sidebar = settings:label(v12("sidebar", "Navigation Badge"), function(p15)
							return {
								text = p15:input("Caption", "frost.lua"),
								icon = p15:combo("Symbol", {
									[1] = "snowflake",
									[2] = "house-chimney",
									[3] = "star",
									[4] = "gear",
									[5] = "paintbrush"
								}),
								gradient = p15:switch("Gradient Flow", true),
								speed = p15:slider("Flow Speed", 1, 100, 35, 1, "%"),
								rainbow = p15:switch("Spectrum"),
								col_a = p15:color_picker("Primary", color(160, 220, 255, 255)),
								col_b = p15:color_picker("Secondary", color(255, 255, 255, 255))
							}
						end)
					end

					t6.settings.sidebar.speed:depend({
						[1] = nil,
						[2] = true,
						[1] = t6.settings.sidebar.gradient
					})
					t6.settings.sidebar.rainbow:depend({
						[1] = nil,
						[2] = true,
						[1] = t6.settings.sidebar.gradient
					})
					t6.settings.sidebar.col_a:depend({
						[1] = nil,
						[2] = true,
						[1] = t6.settings.sidebar.gradient
					}, {
						[1] = nil,
						[2] = false,
						[1] = t6.settings.sidebar.rainbow
					})
					t6.settings.sidebar.col_b:depend({
						[1] = nil,
						[2] = true,
						[1] = t6.settings.sidebar.gradient
					}, {
						[1] = nil,
						[2] = false,
						[1] = t6.settings.sidebar.rainbow
					})
					t6.anti_aim = {}

					do
						local main = t6.groups.anti_aim.main
						local tweaks = t6.groups.anti_aim.tweaks
						local mode = t6.groups.anti_aim.mode
						local yaw = t6.groups.anti_aim.yaw
						local yaw_modifier = t6.groups.anti_aim.yaw_modifier
						local body_yaw = t6.groups.anti_aim.body_yaw
						local break_lc = t6.groups.anti_aim.break_lc

						t6.anti_aim.states = {
							[1] = "Stand",
							[2] = "Move",
							[3] = "Air",
							[4] = "Air+",
							[5] = "Crouch",
							[6] = "Crouch+",
							[7] = "Slow",
							[8] = "Freestand",
							[9] = "Manual Yaw",
							[10] = "Safe Head"
						}
						t6.anti_aim.select_state = main:combo(v12("arrow-pointer", "Active state"), t6.anti_aim.states)
						t6.anti_aim.select_state:visibility(false)
						t6.anti_aim.state_buttons = {}

						local u30 = t6.anti_aim.states[1]

						do
							local t7 = {
								[1] = "person",
								[2] = "person-running",
								[3] = "plane-up",
								[4] = "person-falling",
								[5] = "person-praying",
								[6] = "person-falling-burst",
								[7] = "person-walking",
								[8] = "person-rays",
								[9] = "location-arrow",
								[10] = "user-helmet-safety"
							}

							local function v32(p16)
								-- upvalues: t6 (ref), u30 (ref)
								local v331 = t6.anti_aim.select_state:get()

								if v331 ~= p16 then
									u30 = v331
								end

								if not pcall(t6.anti_aim.select_state.set, t6.anti_aim.select_state, p16) then
									for i, v in ipairs(t6.anti_aim.states) do
										if v == p16 then
											pcall(t6.anti_aim.select_state.set, t6.anti_aim.select_state, i)

											return
										end
									end
								end
							end

							for i, v in ipairs(t6.anti_aim.states) do
								local v35 = t1.get(t7[i])

								t6.anti_aim.state_buttons[i] = main:button(v8("\a{Link Active}", v35, "\aDEFAULT"), function()
									-- upvalues: v32 (copy), v (copy)
									v32(v)
								end, true)

								if t6.anti_aim.state_buttons[i].tooltip ~= nil then
									t6.anti_aim.state_buttons[i]:tooltip(v)
								end
							end
						end

						t6.anti_aim.builder = {}

						for i = 1, #t6.anti_aim.states do
							local v37

							do
								do
									t6.anti_aim.builder[i] = {}
									v37 = t6.anti_aim.builder[i]
									v37.override_state = main:switch("Enable \v" .. t6.anti_aim.states[i]):depend({
										[1] = t6.anti_aim.select_state,
										[2] = t6.anti_aim.states[i]
									})
									v37.mode = mode:combo(v12("arrow-down-arrow-up", "State mode\nbuilder_mode" .. t6.anti_aim.states[i]), {
										[1] = "Static",
										[2] = "Jitter"
									}):depend({
										[1] = nil,
										[2] = true,
										[1] = v37.override_state
									}, {
										[1] = t6.anti_aim.select_state,
										[2] = t6.anti_aim.states[i]
									})
									v37.yaw_amount = yaw:slider(v12("arrow-right-arrow-left", "Static offset\nbuilder_yaw_amount" .. t6.anti_aim.states[i]), -180, 180, 0, 1, "°"):depend({
										[1] = nil,
										[2] = true,
										[1] = v37.override_state
									}, {
										[1] = t6.anti_aim.select_state,
										[2] = t6.anti_aim.states[i]
									}, {
										[1] = nil,
										[2] = "Static",
										[1] = v37.mode
									})
									v37.yaw_randomize = v37.yaw_amount:create():slider("Offset spread\nbuilder_yaw_randomize" .. t6.anti_aim.states[i], 0, 100, 0, 1, "%")
									v37.inverter_body = body_yaw:switch(v12("arrow-right-from-arc", "Body inverter")):depend({
										[1] = nil,
										[2] = true,
										[1] = v37.override_state
									}, {
										[1] = t6.anti_aim.select_state,
										[2] = t6.anti_aim.states[i]
									}, {
										[1] = nil,
										[2] = "Static",
										[1] = v37.mode
									}, {
										[1] = t6.anti_aim.select_state,
										[2] = function()
											-- upvalues: t6 (ref)
											return t6.anti_aim.select_state:get() ~= "Safe Head"
										end
									})
									v37.yaw_add_left = yaw:slider(v12("angle-left", "Left offset\nbuilder_yaw_add_left" .. t6.anti_aim.states[i]), -180, 180, 0, 1, "°"):depend({
										[1] = nil,
										[2] = true,
										[1] = v37.override_state
									}, {
										[1] = t6.anti_aim.select_state,
										[2] = t6.anti_aim.states[i]
									}, {
										[1] = nil,
										[2] = "Jitter",
										[1] = v37.mode
									})
									v37.yaw_add_right = yaw:slider(v12("angle-right", "Right offset\nbuilder_yaw_add_right" .. t6.anti_aim.states[i]), -180, 180, 0, 1, "°"):depend({
										[1] = nil,
										[2] = true,
										[1] = v37.override_state
									}, {
										[1] = t6.anti_aim.select_state,
										[2] = t6.anti_aim.states[i]
									}, {
										[1] = nil,
										[2] = "Jitter",
										[1] = v37.mode
									})
									v37.yaw_add_randomize = yaw:slider(v12("arrow-rotate-left", "Randomize\nyaw_add_randomize" .. t6.anti_aim.states[i]), 0, 100, 0, 1, "%"):depend({
										[1] = nil,
										[2] = true,
										[1] = v37.override_state
									}, {
										[1] = t6.anti_aim.select_state,
										[2] = t6.anti_aim.states[i]
									}, {
										[1] = nil,
										[2] = "Jitter",
										[1] = v37.mode
									})
									v37.yaw_modifier = yaw_modifier:combo(v12("arrows-spin", "Modifier type\nbuilder_yaw_modifier" .. t6.anti_aim.states[i]), {
										[1] = "Disabled",
										[2] = "Center",
										[3] = "Random",
										[4] = "Spin",
										[5] = "3-Way",
										[6] = "5-Way"
									}):depend({
										[1] = nil,
										[2] = true,
										[1] = v37.override_state
									}, {
										[1] = t6.anti_aim.select_state,
										[2] = t6.anti_aim.states[i]
									}, {
										[1] = nil,
										[2] = "Jitter",
										[1] = v37.mode
									})

									local v38 = v37.yaw_modifier:create()

									v37.yaw_modifier_mode = v38:combo("Pattern\nbuilder_yaw_modifier_mode" .. t6.anti_aim.states[i], {
										[1] = "Static",
										[2] = "Min/Max",
										[3] = "Sequential"
									}):depend({
										[1] = v37.yaw_modifier,
										[2] = function()
											-- upvalues: v37 (copy)
											return v37.yaw_modifier:get() ~= "Disabled"
										end
									})
									v37.yaw_modifier_amount = v38:slider("Value\nbuilder_yaw_modifier_amount" .. t6.anti_aim.states[i], -180, 180, 0, 1, "°"):depend({
										[1] = v37.yaw_modifier,
										[2] = function()
											-- upvalues: v37 (copy)
											return v37.yaw_modifier:get() ~= "Disabled"
										end
									}, {
										[1] = nil,
										[2] = "Static",
										[1] = v37.yaw_modifier_mode
									})
									v37.yaw_modifier_amount_min = v38:slider("Min value\nbuilder_yaw_modifier_amount_min" .. t6.anti_aim.states[i], -180, 180, 0, 1, "°"):depend({
										[1] = v37.yaw_modifier,
										[2] = function()
											-- upvalues: v37 (copy)
											return v37.yaw_modifier:get() ~= "Disabled"
										end
									}, {
										[1] = nil,
										[2] = "Min/Max",
										[1] = v37.yaw_modifier_mode
									})
									v37.yaw_modifier_amount_max = v38:slider("Max value\nbuilder_yaw_modifier_amount_max" .. t6.anti_aim.states[i], -180, 180, 0, 1, "°"):depend({
										[1] = v37.yaw_modifier,
										[2] = function()
											-- upvalues: v37 (copy)
											return v37.yaw_modifier:get() ~= "Disabled"
										end
									}, {
										[1] = nil,
										[2] = "Min/Max",
										[1] = v37.yaw_modifier_mode
									})
									v37.yaw_modifier_steps = v38:slider("Steps\nbuilder_yaw_modifier_steps" .. t6.anti_aim.states[i], 2, 10, 2, 1, "x"):depend({
										[1] = v37.yaw_modifier,
										[2] = function()
											-- upvalues: v37 (copy)
											return v37.yaw_modifier:get() ~= "Disabled"
										end
									}, {
										[1] = nil,
										[2] = "Sequential",
										[1] = v37.yaw_modifier_mode
									})
									v37.yaw_modifier_sequence = {}

									for j = 1, 10 do
										v37.yaw_modifier_sequence[j] = v38:slider("Step " .. j .. "\nbuilder_yaw_modifier_sequence_" .. j .. t6.anti_aim.states[i], -180, 180, 0, 1, "°"):depend({
											[1] = v37.yaw_modifier,
											[2] = function()
												-- upvalues: v37 (copy)
												return v37.yaw_modifier:get() ~= "Disabled"
											end
										}, {
											[1] = nil,
											[2] = "Sequential",
											[1] = v37.yaw_modifier_mode
										}, {
											[1] = v37.yaw_modifier_steps,
											[2] = function()
												-- upvalues: v37 (copy), j (copy)
												return not (v37.yaw_modifier_steps:get() < j)
											end
										})
									end

									v37.yaw_modifier_shuffle = v38:button("Random steps\nbuilder_yaw_modifier_shuffle" .. t6.anti_aim.states[i], function()
										-- upvalues: v37 (copy)
										for j = 1, v37.yaw_modifier_steps:get() do
											v37.yaw_modifier_sequence[j]:set(utils.random_int(-50, 50))
										end
									end, true):depend({
										[1] = v37.yaw_modifier,
										[2] = function()
											-- upvalues: v37 (copy)
											return v37.yaw_modifier:get() ~= "Disabled"
										end
									}, {
										[1] = nil,
										[2] = "Sequential",
										[1] = v37.yaw_modifier_mode
									})
									v37.yaw_modifier_randomize = v38:slider(v12("arrow-rotate-left", "Randomize\nbuilder_yaw_modifier_randomize") .. t6.anti_aim.states[i], 0, 100, 0, 1, "%"):depend({
										[1] = v37.yaw_modifier,
										[2] = function()
											-- upvalues: v37 (copy)
											return v37.yaw_modifier:get() ~= "Disabled"
										end
									})
								end

								v37.switch_method = body_yaw:combo(v12("arrows-cross", "Switch method\nbuilder_jitter_switch_method" .. t6.anti_aim.states[i]), {
									[1] = "Ticks",
									[2] = "Timing",
									[3] = "Tick Phases",
									[4] = "Smart"
								}):depend({
									[1] = nil,
									[2] = true,
									[1] = v37.override_state
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = t6.anti_aim.states[i]
								}, {
									[1] = nil,
									[2] = "Jitter",
									[1] = v37.mode
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = function()
										-- upvalues: t6 (ref)
										return t6.anti_aim.select_state:get() ~= "Safe Head"
									end
								})

								local v40 = v37.switch_method:create()

								v37.jitter_ticks_mode = v40:combo("Tick pattern\nbuilder_jitter_ticks_mode" .. t6.anti_aim.states[i], {
									[1] = "Static",
									[2] = "Min/Max",
									[3] = "Sequential"
								}):depend({
									[1] = nil,
									[2] = true,
									[1] = v37.override_state
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = t6.anti_aim.states[i]
								}, {
									[1] = nil,
									[2] = "Jitter",
									[1] = v37.mode
								}, {
									[1] = nil,
									[2] = "Ticks",
									[1] = v37.switch_method
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = function()
										-- upvalues: t6 (ref)
										return t6.anti_aim.select_state:get() ~= "Safe Head"
									end
								})
								v37.jitter_speed_ticks = v40:slider(v12("dial-max", "Tick speed\nbuilder_jitter_speed_ticks" .. t6.anti_aim.states[i]), 1, 20, 1, 1, "t"):depend({
									[1] = nil,
									[2] = true,
									[1] = v37.override_state
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = t6.anti_aim.states[i]
								}, {
									[1] = nil,
									[2] = "Jitter",
									[1] = v37.mode
								}, {
									[1] = nil,
									[2] = "Ticks",
									[1] = v37.switch_method
								}, {
									[1] = nil,
									[2] = "Static",
									[1] = v37.jitter_ticks_mode
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = function()
										-- upvalues: t6 (ref)
										return t6.anti_aim.select_state:get() ~= "Safe Head"
									end
								})
								v37.jitter_speed_ticks_min = v40:slider("Min ticks\nbuilder_jitter_speed_ticks_min" .. t6.anti_aim.states[i], 1, 20, 1, 1, "t"):depend({
									[1] = nil,
									[2] = true,
									[1] = v37.override_state
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = t6.anti_aim.states[i]
								}, {
									[1] = nil,
									[2] = "Jitter",
									[1] = v37.mode
								}, {
									[1] = nil,
									[2] = "Ticks",
									[1] = v37.switch_method
								}, {
									[1] = nil,
									[2] = "Min/Max",
									[1] = v37.jitter_ticks_mode
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = function()
										-- upvalues: t6 (ref)
										return t6.anti_aim.select_state:get() ~= "Safe Head"
									end
								})
								v37.jitter_speed_ticks_max = v40:slider("Max ticks\nbuilder_jitter_speed_ticks_max" .. t6.anti_aim.states[i], 1, 20, 1, 1, "t"):depend({
									[1] = nil,
									[2] = true,
									[1] = v37.override_state
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = t6.anti_aim.states[i]
								}, {
									[1] = nil,
									[2] = "Jitter",
									[1] = v37.mode
								}, {
									[1] = nil,
									[2] = "Ticks",
									[1] = v37.switch_method
								}, {
									[1] = nil,
									[2] = "Min/Max",
									[1] = v37.jitter_ticks_mode
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = function()
										-- upvalues: t6 (ref)
										return t6.anti_aim.select_state:get() ~= "Safe Head"
									end
								})
								v37.jitter_speed_ticks_steps = v40:slider("Steps\nbuilder_jitter_speed_ticks_steps" .. t6.anti_aim.states[i], 2, 10, 2, 1, "x"):depend({
									[1] = nil,
									[2] = true,
									[1] = v37.override_state
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = t6.anti_aim.states[i]
								}, {
									[1] = nil,
									[2] = "Jitter",
									[1] = v37.mode
								}, {
									[1] = nil,
									[2] = "Ticks",
									[1] = v37.switch_method
								}, {
									[1] = nil,
									[2] = "Sequential",
									[1] = v37.jitter_ticks_mode
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = function()
										-- upvalues: t6 (ref)
										return t6.anti_aim.select_state:get() ~= "Safe Head"
									end
								})
								v37.jitter_speed_ticks_sequence = {}

								for j = 1, 10 do
									v37.jitter_speed_ticks_sequence[j] = v40:slider("Tick step " .. j .. "\nbuilder_jitter_speed_ticks_sequence_" .. j .. t6.anti_aim.states[i], 1, 20, 1, 1, "t"):depend({
										[1] = nil,
										[2] = true,
										[1] = v37.override_state
									}, {
										[1] = t6.anti_aim.select_state,
										[2] = t6.anti_aim.states[i]
									}, {
										[1] = nil,
										[2] = "Jitter",
										[1] = v37.mode
									}, {
										[1] = nil,
										[2] = "Ticks",
										[1] = v37.switch_method
									}, {
										[1] = nil,
										[2] = "Sequential",
										[1] = v37.jitter_ticks_mode
									}, {
										[1] = v37.jitter_speed_ticks_steps,
										[2] = function()
											-- upvalues: v37 (copy), j (copy)
											return not (v37.jitter_speed_ticks_steps:get() < j)
										end
									}, {
										[1] = t6.anti_aim.select_state,
										[2] = function()
											-- upvalues: t6 (ref)
											return t6.anti_aim.select_state:get() ~= "Safe Head"
										end
									})
								end

								v37.jitter_speed_ticks_shuffle = v40:button("Random ticks\nbuilder_jitter_speed_ticks_shuffle" .. t6.anti_aim.states[i], function()
									-- upvalues: v37 (copy)
									for j = 1, v37.jitter_speed_ticks_steps:get() do
										v37.jitter_speed_ticks_sequence[j]:set(utils.random_int(1, 20))
									end
								end, true):depend({
									[1] = nil,
									[2] = true,
									[1] = v37.override_state
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = t6.anti_aim.states[i]
								}, {
									[1] = nil,
									[2] = "Jitter",
									[1] = v37.mode
								}, {
									[1] = nil,
									[2] = "Ticks",
									[1] = v37.switch_method
								}, {
									[1] = nil,
									[2] = "Sequential",
									[1] = v37.jitter_ticks_mode
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = function()
										-- upvalues: t6 (ref)
										return t6.anti_aim.select_state:get() ~= "Safe Head"
									end
								})
								v37.jitter_speed_ticks_reset = v40:button("Reset ticks\nbuilder_jitter_speed_ticks_reset" .. t6.anti_aim.states[i], function()
									-- upvalues: v37 (copy)
									for j = 1, v37.jitter_speed_ticks_steps:get() do
										v37.jitter_speed_ticks_sequence[j]:set(1)
									end
								end, true):depend({
									[1] = nil,
									[2] = true,
									[1] = v37.override_state
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = t6.anti_aim.states[i]
								}, {
									[1] = nil,
									[2] = "Jitter",
									[1] = v37.mode
								}, {
									[1] = nil,
									[2] = "Ticks",
									[1] = v37.switch_method
								}, {
									[1] = nil,
									[2] = "Sequential",
									[1] = v37.jitter_ticks_mode
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = function()
										-- upvalues: t6 (ref)
										return t6.anti_aim.select_state:get() ~= "Safe Head"
									end
								})
								v37.jitter_timing_mode = v40:combo("Timing pattern\nbuilder_jitter_timing_mode" .. t6.anti_aim.states[i], {
									[1] = "Min/Max",
									[2] = "Sequential"
								}):depend({
									[1] = nil,
									[2] = true,
									[1] = v37.override_state
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = t6.anti_aim.states[i]
								}, {
									[1] = nil,
									[2] = "Jitter",
									[1] = v37.mode
								}, {
									[1] = nil,
									[2] = "Timing",
									[1] = v37.switch_method
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = function()
										-- upvalues: t6 (ref)
										return t6.anti_aim.select_state:get() ~= "Safe Head"
									end
								})
								v37.jitter_speed_timing_min = v40:slider("Min timing\nbuilder_jitter_speed_timing_min" .. t6.anti_aim.states[i], 1, 20, 1, 1, "t"):depend({
									[1] = nil,
									[2] = true,
									[1] = v37.override_state
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = t6.anti_aim.states[i]
								}, {
									[1] = nil,
									[2] = "Jitter",
									[1] = v37.mode
								}, {
									[1] = nil,
									[2] = "Timing",
									[1] = v37.switch_method
								}, {
									[1] = nil,
									[2] = "Min/Max",
									[1] = v37.jitter_timing_mode
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = function()
										-- upvalues: t6 (ref)
										return t6.anti_aim.select_state:get() ~= "Safe Head"
									end
								})
								v37.jitter_speed_timing_max = v40:slider("Max timing\nbuilder_jitter_speed_timing_max" .. t6.anti_aim.states[i], 1, 20, 1, 1, "t"):depend({
									[1] = nil,
									[2] = true,
									[1] = v37.override_state
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = t6.anti_aim.states[i]
								}, {
									[1] = nil,
									[2] = "Jitter",
									[1] = v37.mode
								}, {
									[1] = nil,
									[2] = "Timing",
									[1] = v37.switch_method
								}, {
									[1] = nil,
									[2] = "Min/Max",
									[1] = v37.jitter_timing_mode
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = function()
										-- upvalues: t6 (ref)
										return t6.anti_aim.select_state:get() ~= "Safe Head"
									end
								})
								v37.jitter_speed_timing_steps = v40:slider("Steps\nbuilder_jitter_speed_timing_steps" .. t6.anti_aim.states[i], 2, 10, 2, 1, "x"):depend({
									[1] = nil,
									[2] = true,
									[1] = v37.override_state
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = t6.anti_aim.states[i]
								}, {
									[1] = nil,
									[2] = "Jitter",
									[1] = v37.mode
								}, {
									[1] = nil,
									[2] = "Timing",
									[1] = v37.switch_method
								}, {
									[1] = nil,
									[2] = "Sequential",
									[1] = v37.jitter_timing_mode
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = function()
										-- upvalues: t6 (ref)
										return t6.anti_aim.select_state:get() ~= "Safe Head"
									end
								})
								v37.jitter_speed_timing_sequence = {}

								for j = 1, 10 do
									v37.jitter_speed_timing_sequence[j] = v40:slider("Timing step " .. j .. "\nbuilder_jitter_speed_timing_sequence_" .. j .. t6.anti_aim.states[i], 1, 20, 1, 1, "t"):depend({
										[1] = nil,
										[2] = true,
										[1] = v37.override_state
									}, {
										[1] = t6.anti_aim.select_state,
										[2] = t6.anti_aim.states[i]
									}, {
										[1] = nil,
										[2] = "Jitter",
										[1] = v37.mode
									}, {
										[1] = nil,
										[2] = "Timing",
										[1] = v37.switch_method
									}, {
										[1] = nil,
										[2] = "Sequential",
										[1] = v37.jitter_timing_mode
									}, {
										[1] = v37.jitter_speed_timing_steps,
										[2] = function()
											-- upvalues: v37 (copy), j (copy)
											return not (v37.jitter_speed_timing_steps:get() < j)
										end
									}, {
										[1] = t6.anti_aim.select_state,
										[2] = function()
											-- upvalues: t6 (ref)
											return t6.anti_aim.select_state:get() ~= "Safe Head"
										end
									})
								end

								v37.jitter_speed_timing_shuffle = v40:button("Random timing\nbuilder_jitter_speed_timing_shuffle" .. t6.anti_aim.states[i], function()
									-- upvalues: v37 (copy)
									for j = 1, v37.jitter_speed_timing_steps:get() do
										v37.jitter_speed_timing_sequence[j]:set(utils.random_int(1, 20))
									end
								end, true):depend({
									[1] = nil,
									[2] = true,
									[1] = v37.override_state
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = t6.anti_aim.states[i]
								}, {
									[1] = nil,
									[2] = "Jitter",
									[1] = v37.mode
								}, {
									[1] = nil,
									[2] = "Timing",
									[1] = v37.switch_method
								}, {
									[1] = nil,
									[2] = "Sequential",
									[1] = v37.jitter_timing_mode
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = function()
										-- upvalues: t6 (ref)
										return t6.anti_aim.select_state:get() ~= "Safe Head"
									end
								})
								v37.jitter_speed_timing_reset = v40:button("Reset timing\nbuilder_jitter_speed_timing_reset" .. t6.anti_aim.states[i], function()
									-- upvalues: v37 (copy)
									for j = 1, v37.jitter_speed_timing_steps:get() do
										v37.jitter_speed_timing_sequence[j]:set(1)
									end
								end, true):depend({
									[1] = nil,
									[2] = true,
									[1] = v37.override_state
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = t6.anti_aim.states[i]
								}, {
									[1] = nil,
									[2] = "Jitter",
									[1] = v37.mode
								}, {
									[1] = nil,
									[2] = "Timing",
									[1] = v37.switch_method
								}, {
									[1] = nil,
									[2] = "Sequential",
									[1] = v37.jitter_timing_mode
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = function()
										-- upvalues: t6 (ref)
										return t6.anti_aim.select_state:get() ~= "Safe Head"
									end
								})
								v37.jitter_speed_phases_switch_speed = v40:slider("Phase switch speed\nbuilder_jitter_speed_phases_switch_speed" .. t6.anti_aim.states[i], 1, 20, 1, 1, "t"):depend({
									[1] = nil,
									[2] = true,
									[1] = v37.override_state
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = t6.anti_aim.states[i]
								}, {
									[1] = nil,
									[2] = "Jitter",
									[1] = v37.mode
								}, {
									[1] = nil,
									[2] = "Tick Phases",
									[1] = v37.switch_method
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = function()
										-- upvalues: t6 (ref)
										return t6.anti_aim.select_state:get() ~= "Safe Head"
									end
								})
								v37.jitter_speed_phase_1 = v40:slider("Phase 1\nbuilder_jitter_speed_timing_max" .. t6.anti_aim.states[i], 1, 20, 1, 1, "tp"):depend({
									[1] = nil,
									[2] = true,
									[1] = v37.override_state
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = t6.anti_aim.states[i]
								}, {
									[1] = nil,
									[2] = "Jitter",
									[1] = v37.mode
								}, {
									[1] = nil,
									[2] = "Tick Phases",
									[1] = v37.switch_method
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = function()
										-- upvalues: t6 (ref)
										return t6.anti_aim.select_state:get() ~= "Safe Head"
									end
								})
								v37.jitter_speed_phase_2 = v40:slider("Phase 2\nbuilder_jitter_speed_timing_max" .. t6.anti_aim.states[i], 1, 20, 1, 1, "tp"):depend({
									[1] = nil,
									[2] = true,
									[1] = v37.override_state
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = t6.anti_aim.states[i]
								}, {
									[1] = nil,
									[2] = "Jitter",
									[1] = v37.mode
								}, {
									[1] = nil,
									[2] = "Tick Phases",
									[1] = v37.switch_method
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = function()
										-- upvalues: t6 (ref)
										return t6.anti_aim.select_state:get() ~= "Safe Head"
									end
								})
								v37.jitter_speed_phase_3 = v40:slider("Phase 3\nbuilder_jitter_speed_timing_max" .. t6.anti_aim.states[i], 1, 20, 1, 1, "tp"):depend({
									[1] = nil,
									[2] = true,
									[1] = v37.override_state
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = t6.anti_aim.states[i]
								}, {
									[1] = nil,
									[2] = "Jitter",
									[1] = v37.mode
								}, {
									[1] = nil,
									[2] = "Tick Phases",
									[1] = v37.switch_method
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = function()
										-- upvalues: t6 (ref)
										return t6.anti_aim.select_state:get() ~= "Safe Head"
									end
								})
								v37.jitter_speed_phase_4 = v40:slider("Phase 4\nbuilder_jitter_speed_timing_max" .. t6.anti_aim.states[i], 1, 20, 1, 1, "tp"):depend({
									[1] = nil,
									[2] = true,
									[1] = v37.override_state
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = t6.anti_aim.states[i]
								}, {
									[1] = nil,
									[2] = "Jitter",
									[1] = v37.mode
								}, {
									[1] = nil,
									[2] = "Tick Phases",
									[1] = v37.switch_method
								}, {
									[1] = t6.anti_aim.select_state,
									[2] = function()
										-- upvalues: t6 (ref)
										return t6.anti_aim.select_state:get() ~= "Safe Head"
									end
								})
							end

							v37.break_lc = break_lc:selectable(v12("bolt", "Defensive triggers\nbuilder_break_lc" .. t6.anti_aim.states[i]), {
								[1] = "Double Tap",
								[2] = "Hide Shots"
							}):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.override_state
							}, {
								[1] = t6.anti_aim.select_state,
								[2] = t6.anti_aim.states[i]
							})

							local v43 = v37.break_lc:create()

							v37.break_lc_ticks_mode = v43:combo("Tick pattern\nbuilder_break_lc_ticks_mode" .. t6.anti_aim.states[i], {
								[1] = "Static",
								[2] = "Min/Max",
								[3] = "Random",
								[4] = "Sequential"
							})
							v37.break_lc_ticks_static = v43:slider("Static ticks\nbuilder_break_lc_ticks_static" .. t6.anti_aim.states[i], 1, 32, 16, 1, "t"):depend({
								[1] = nil,
								[2] = "Static",
								[1] = v37.break_lc_ticks_mode
							})
							v37.break_lc_ticks_min = v43:slider("Min ticks\nbuilder_break_lc_ticks_min" .. t6.anti_aim.states[i], 1, 32, 16, 1, "t"):depend({
								[1] = nil,
								[2] = "Min/Max",
								[1] = v37.break_lc_ticks_mode
							})
							v37.break_lc_ticks_max = v43:slider("Max ticks\nbuilder_break_lc_ticks_max" .. t6.anti_aim.states[i], 1, 32, 16, 1, "t"):depend({
								[1] = nil,
								[2] = "Min/Max",
								[1] = v37.break_lc_ticks_mode
							})
							v37.break_lc_ticks_random = v43:slider("Random ceiling\nbuilder_break_lc_ticks_random" .. t6.anti_aim.states[i], 1, 32, 16, 1, "t"):depend({
								[1] = nil,
								[2] = "Random",
								[1] = v37.break_lc_ticks_mode
							})
							v37.break_lc_ticks_seq_steps = v43:slider("Seq steps\nbuilder_break_lc_ticks_seq_steps" .. t6.anti_aim.states[i], 2, 10, 3, 1, "x"):depend({
								[1] = nil,
								[2] = "Sequential",
								[1] = v37.break_lc_ticks_mode
							})
							v37.break_lc_ticks_sequence = {}

							for j = 1, 10 do
								v37.break_lc_ticks_sequence[j] = v43:slider("Step " .. j .. "\nbuilder_break_lc_ticks_sequence_" .. j .. t6.anti_aim.states[i], 1, 32, 16, 1, "t"):depend({
									[1] = nil,
									[2] = "Sequential",
									[1] = v37.break_lc_ticks_mode
								}, {
									[1] = v37.break_lc_ticks_seq_steps,
									[2] = function()
										-- upvalues: v37 (copy), j (copy)
										return not (v37.break_lc_ticks_seq_steps:get() < j)
									end
								})
							end

							v37.break_lc_ticks_seq_shuffle = v43:button("Random seq\nbuilder_break_lc_ticks_seq_shuffle" .. t6.anti_aim.states[i], function()
								-- upvalues: v37 (copy)
								for j = 1, v37.break_lc_ticks_seq_steps:get() do
									v37.break_lc_ticks_sequence[j]:set(utils.random_int(1, 32))
								end
							end, true):depend({
								[1] = nil,
								[2] = "Sequential",
								[1] = v37.break_lc_ticks_mode
							})
							v37.break_lc_hidden_enable = v43:switch("Hidden layer\nbuilder_break_lc_hidden_enable" .. t6.anti_aim.states[i], false)
							v37.break_lc_hidden_pitch = v43:combo("Hidden pitch\nbuilder_break_lc_hidden_pitch" .. t6.anti_aim.states[i], {
								[1] = "Disabled",
								[2] = "Down",
								[3] = "Up",
								[4] = "Half Up",
								[5] = "Half Down",
								[6] = "Sway",
								[7] = "Custom"
							}):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.break_lc_hidden_enable
							})
							v37.break_lc_hidden_pitch_sway_speed = v43:slider("Pitch sway speed\nbuilder_break_lc_hidden_pitch_sway_speed" .. t6.anti_aim.states[i], 1, 32, 8, 1, "t"):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.break_lc_hidden_enable
							}, {
								[1] = nil,
								[2] = "Sway",
								[1] = v37.break_lc_hidden_pitch
							})
							v37.break_lc_hidden_pitch_custom = v43:slider("Custom pitch\nbuilder_break_lc_hidden_pitch_custom" .. t6.anti_aim.states[i], -89, 89, 0, 1, "°"):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.break_lc_hidden_enable
							}, {
								[1] = nil,
								[2] = "Custom",
								[1] = v37.break_lc_hidden_pitch
							})
							v37.break_lc_hidden_yaw = v43:combo("Hidden yaw\nbuilder_break_lc_hidden_yaw" .. t6.anti_aim.states[i], {
								[1] = "Sideways",
								[2] = "Center",
								[3] = "Random",
								[4] = "Spin",
								[5] = "3-Way",
								[6] = "5-Way",
								[7] = "Distortion",
								[8] = "Progressive",
								[9] = "Custom"
							}):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.break_lc_hidden_enable
							})
							v37.break_lc_hidden_yaw_center = v43:slider("Center offset\nbuilder_break_lc_hidden_yaw_center" .. t6.anti_aim.states[i], -180, 180, 0, 1, "°"):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.break_lc_hidden_enable
							}, {
								[1] = nil,
								[2] = "Center",
								[1] = v37.break_lc_hidden_yaw
							})
							v37.break_lc_hidden_yaw_sideways_left = v43:slider("Sideways left\nbuilder_break_lc_hidden_yaw_sideways_left" .. t6.anti_aim.states[i], -90, 90, -90, 1, "°"):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.break_lc_hidden_enable
							}, {
								[1] = nil,
								[2] = "Sideways",
								[1] = v37.break_lc_hidden_yaw
							})
							v37.break_lc_hidden_yaw_sideways_right = v43:slider("Sideways right\nbuilder_break_lc_hidden_yaw_sideways_right" .. t6.anti_aim.states[i], -90, 90, 90, 1, "°"):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.break_lc_hidden_enable
							}, {
								[1] = nil,
								[2] = "Sideways",
								[1] = v37.break_lc_hidden_yaw
							})
							v37.break_lc_hidden_yaw_random_min = v43:slider("Random min\nbuilder_break_lc_hidden_yaw_random_min" .. t6.anti_aim.states[i], -180, 180, -90, 1, "°"):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.break_lc_hidden_enable
							}, {
								[1] = nil,
								[2] = "Random",
								[1] = v37.break_lc_hidden_yaw
							})
							v37.break_lc_hidden_yaw_random_max = v43:slider("Random max\nbuilder_break_lc_hidden_yaw_random_max" .. t6.anti_aim.states[i], -180, 180, 90, 1, "°"):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.break_lc_hidden_enable
							}, {
								[1] = nil,
								[2] = "Random",
								[1] = v37.break_lc_hidden_yaw
							})
							v37.break_lc_hidden_yaw_spin_speed = v43:slider("Spin speed\nbuilder_break_lc_hidden_yaw_spin_speed" .. t6.anti_aim.states[i], 1, 180, 30, 1, "°/t"):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.break_lc_hidden_enable
							}, {
								[1] = nil,
								[2] = "Spin",
								[1] = v37.break_lc_hidden_yaw
							})
							v37.break_lc_hidden_yaw_3way_min = v43:slider("3-way min\nbuilder_break_lc_hidden_yaw_3way_min" .. t6.anti_aim.states[i], -180, 180, -90, 1, "°"):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.break_lc_hidden_enable
							}, {
								[1] = nil,
								[2] = "3-Way",
								[1] = v37.break_lc_hidden_yaw
							})
							v37.break_lc_hidden_yaw_3way_max = v43:slider("3-way max\nbuilder_break_lc_hidden_yaw_3way_max" .. t6.anti_aim.states[i], -180, 180, 90, 1, "°"):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.break_lc_hidden_enable
							}, {
								[1] = nil,
								[2] = "3-Way",
								[1] = v37.break_lc_hidden_yaw
							})
							v37.break_lc_hidden_yaw_5way_min = v43:slider("5-way min\nbuilder_break_lc_hidden_yaw_5way_min" .. t6.anti_aim.states[i], -180, 180, -120, 1, "°"):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.break_lc_hidden_enable
							}, {
								[1] = nil,
								[2] = "5-Way",
								[1] = v37.break_lc_hidden_yaw
							})
							v37.break_lc_hidden_yaw_5way_max = v43:slider("5-way max\nbuilder_break_lc_hidden_yaw_5way_max" .. t6.anti_aim.states[i], -180, 180, 120, 1, "°"):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.break_lc_hidden_enable
							}, {
								[1] = nil,
								[2] = "5-Way",
								[1] = v37.break_lc_hidden_yaw
							})
							v37.break_lc_hidden_yaw_distortion_range = v43:slider("Distortion range\nbuilder_break_lc_hidden_yaw_distortion_range" .. t6.anti_aim.states[i], 0, 180, 90, 1, "°"):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.break_lc_hidden_enable
							}, {
								[1] = nil,
								[2] = "Distortion",
								[1] = v37.break_lc_hidden_yaw
							})
							v37.break_lc_hidden_yaw_distortion_speed = v43:slider("Distortion speed\nbuilder_break_lc_hidden_yaw_distortion_speed" .. t6.anti_aim.states[i], 1, 32, 8, 1, "t"):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.break_lc_hidden_enable
							}, {
								[1] = nil,
								[2] = "Distortion",
								[1] = v37.break_lc_hidden_yaw
							})
							v37.break_lc_hidden_yaw_progressive_min = v43:slider("Progressive min\nbuilder_break_lc_hidden_yaw_progressive_min" .. t6.anti_aim.states[i], -180, 180, -120, 1, "°"):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.break_lc_hidden_enable
							}, {
								[1] = nil,
								[2] = "Progressive",
								[1] = v37.break_lc_hidden_yaw
							})
							v37.break_lc_hidden_yaw_progressive_max = v43:slider("Progressive max\nbuilder_break_lc_hidden_yaw_progressive_max" .. t6.anti_aim.states[i], -180, 180, 120, 1, "°"):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.break_lc_hidden_enable
							}, {
								[1] = nil,
								[2] = "Progressive",
								[1] = v37.break_lc_hidden_yaw
							})
							v37.break_lc_hidden_yaw_progressive_step = v43:slider("Progressive step\nbuilder_break_lc_hidden_yaw_progressive_step" .. t6.anti_aim.states[i], 1, 90, 20, 1, "°"):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.break_lc_hidden_enable
							}, {
								[1] = nil,
								[2] = "Progressive",
								[1] = v37.break_lc_hidden_yaw
							})
							v37.break_lc_hidden_yaw_custom = v43:slider("Custom yaw\nbuilder_break_lc_hidden_yaw_custom" .. t6.anti_aim.states[i], -180, 180, 0, 1, "°"):depend({
								[1] = nil,
								[2] = true,
								[1] = v37.break_lc_hidden_enable
							}, {
								[1] = nil,
								[2] = "Custom",
								[1] = v37.break_lc_hidden_yaw
							})
						end

						t6.anti_aim.tweaks = {}

						local tweaks2 = t6.anti_aim.tweaks

						tweaks2.manual_yaw = tweaks:combo(v12("location-arrow", "Manual direction"), {
							[1] = "Disabled",
							[2] = "Forward",
							[3] = "Left",
							[4] = "Right"
						})
						tweaks2.freestanding = tweaks:switch(v12("person-rays", "Freestanding solver"), false)

						local v46 = tweaks2.freestanding:create()

						tweaks2.freestanding_disable_yaw_modifiers = v46:switch("Lock yaw modifiers\nanti_aim_tweaks_freestanding_disable_yaw_modifiers", true)
						tweaks2.freestanding_body = v46:switch("Body resolver\nanti_aim_tweaks_freestanding_body", false)
						tweaks2.freestanding_disablers = v46:selectable("State disablers\nanti_aim_tweaks_freestanding_disablers", {
							[1] = "Stand",
							[2] = "Move",
							[3] = "Air",
							[4] = "Air+",
							[5] = "Crouch",
							[6] = "Crouch+",
							[7] = "Slow"
						})
						tweaks2.allow_on_use = tweaks:switch(v12("shield-exclamation", "Anti aim on use\nanti_aim_tweaks_allow_on_use"), false)
						tweaks2.allow_on_use_yaw_base = tweaks2.allow_on_use:create():combo("Yaw base\nanti_aim_tweaks_allow_on_use_yaw_base", {
							[1] = "Local View",
							[2] = "At Target"
						}):depend({
							[1] = nil,
							[2] = true,
							[1] = tweaks2.allow_on_use
						})
						tweaks2.roll = tweaks:switch(v12("rotate", "Roll anti aim\nanti_aim_tweaks_roll"), false)
						tweaks2.roll_value = tweaks2.roll:create():slider("Roll\nanti_aim_tweaks_roll_value", -50, 50, 50, 1, "°"):depend({
							[1] = nil,
							[2] = true,
							[1] = tweaks2.roll
						})
						tweaks2.flick_exploit = tweaks:switch(v12("bolt-lightning", "Flick window\nanti_aim_tweaks_flick_exploit"), false)
						tweaks2.safe_head = tweaks:selectable(v12("helmet-safety", "Safe head guard\nanti_aim_tweaks_safe_head"), {
							[1] = "Knife",
							[2] = "Taser"
						})
						tweaks2.anti_bruteforce = tweaks:switch(v12("shield-halved", "Anti bruteforce\nanti_aim_tweaks_anti_bruteforce"), false)

						local v47 = tweaks2.anti_bruteforce:create()

						tweaks2.anti_bruteforce_conditions = v47:selectable("Conditions\nanti_aim_tweaks_anti_bruteforce_conditions", {
							[1] = "Stand",
							[2] = "Move",
							[3] = "Air",
							[4] = "Air+",
							[5] = "Crouch",
							[6] = "Crouch+",
							[7] = "Slow"
						})
						tweaks2.anti_bruteforce_mode = v47:combo("Mode\nanti_aim_tweaks_anti_bruteforce_mode", {
							[1] = "Increase",
							[2] = "Decrease",
							[3] = "Meta"
						})
						tweaks2.anti_bruteforce_time = v47:slider("Duration\nanti_aim_tweaks_anti_bruteforce_time", 1, 20, 8, 1, "s")

						local function v48()
							-- upvalues: tweaks2 (copy)
							local v334 = tweaks2.anti_bruteforce:get()

							tweaks2.anti_bruteforce_conditions:visibility(v334)
							tweaks2.anti_bruteforce_mode:visibility(v334)
							tweaks2.anti_bruteforce_time:visibility(v334)
						end

						tweaks2.anti_bruteforce:set_callback(v48)
						v48()
					end

					t6.other = {}

					local tabs = t6.groups.other.tabs
					local ragebot = t6.groups.other.ragebot

					visuals = t6.groups.other.visuals
					misc = t6.groups.other.misc
					movement = t6.groups.other.movement

					local t8 = {
						[1] = "Combat",
						[2] = "Visuals",
						[3] = "World",
						[4] = "Movement"
					}
					local t9 = {
						[1] = "crosshairs",
						[2] = "paintbrush",
						[3] = "box",
						[4] = "person-falling"
					}

					function v56(p17)
						-- upvalues: t8 (copy), v8 (copy), t1 (ref), t9 (copy), s2 (copy)
						local t10 = {}

						for i, v in ipairs(t8) do
							local v339 = v8(t1.get(t9[i]), string.rep(s2, 4), v)

							t10[i] = i == p17 and v8("\a{Link Active}", v339, "\aDEFAULT") or v8("\a808080FF", v339, "\aDEFAULT")
						end

						return t10
					end

					t6.other.tabs = tabs:list("", v56(1))

					function v57()
						-- upvalues: t6 (ref), t8 (copy)
						local v340 = t6.other.tabs:get()

						if type(v340) ~= "number" then
							if type(v340) == "string" then
								for i, v in ipairs(t8) do
									if v340:find(v, 1, true) then
										return i
									end
								end
							end

							return 1
						end

						return math.clamp(v340, 1, #t8)
					end
					function v58(p18)
						-- upvalues: v57 (copy)
						return function()
							-- upvalues: v57 (copy), p18 (copy)
							return v57() == p18
						end
					end

					t6.other.ragebot = {}
					t6.other.ragebot.auto_weapon_switch = {}

					local auto_weapon_switch = t6.other.ragebot.auto_weapon_switch

					auto_weapon_switch.enabled = ragebot:switch(v12("gun", "Auto weapon switch")):depend({
						t6.other.tabs,
						v58(1)
					})

					local v60 = auto_weapon_switch.enabled:create()

					auto_weapon_switch.triggers = v60:selectable("Triggers", {
						[1] = "Enemy shot",
						[2] = "Enemy visible"
					}):depend({
						[1] = nil,
						[2] = true,
						[1] = auto_weapon_switch.enabled
					})
					auto_weapon_switch.weapons = v60:combo("Weapon to switch", {
						[1] = "Primary",
						[2] = "Secondary",
						[3] = "Knife",
						[4] = "Taser"
					}):depend({
						[1] = nil,
						[2] = true,
						[1] = auto_weapon_switch.enabled
					})
					auto_weapon_switch.delay = v60:slider("Switch delay", 0, 500, 100, 1, "ms"):depend({
						[1] = nil,
						[2] = true,
						[1] = auto_weapon_switch.enabled
					})
					t6.other.ragebot.unlock_fake_latency = ragebot:switch(v12("satellite-dish", "Latency unlock")):depend({
						t6.other.tabs,
						v58(1)
					})
					t6.other.ragebot.ai_peek = {}

					local ai_peek = t6.other.ragebot.ai_peek

					ai_peek.enabled = ragebot:switch(v12("robot", "Peek assistant")):depend({
						t6.other.tabs,
						v58(1)
					})

					local v62 = ai_peek.enabled:create()

					ai_peek.radius = v62:slider("Search radius", 16, 96, 48, 1, "u"):depend({
						[1] = nil,
						[2] = true,
						[1] = ai_peek.enabled
					})
					ai_peek.predict_ticks = v62:slider("Prediction", 1, 16, 6, 1, "t"):depend({
						[1] = nil,
						[2] = true,
						[1] = ai_peek.enabled
					})
					ai_peek.min_damage = v62:slider("Damage floor", 1, 130, 20, 1, "hp"):depend({
						[1] = nil,
						[2] = true,
						[1] = ai_peek.enabled
					})
					ai_peek.speed = v62:slider("Speed", 20, 100, 70, 1, "%"):depend({
						[1] = nil,
						[2] = true,
						[1] = ai_peek.enabled
					})
					ai_peek.require_auto_peek = v62:switch("Require auto peek", false):depend({
						[1] = nil,
						[2] = true,
						[1] = ai_peek.enabled
					})
					ai_peek.box_color = v62:color_picker("Box color", color(105, 205, 255, 180)):depend({
						[1] = nil,
						[2] = true,
						[1] = ai_peek.enabled
					})
					t6.other.ragebot.aim_logging = {}

					local aim_logging = t6.other.ragebot.aim_logging

					aim_logging.enabled = ragebot:switch(v12("bullseye-arrow", "Shot logging")):depend({
						t6.other.tabs,
						v58(1)
					})

					local v64 = aim_logging.enabled:create()

					aim_logging.output = v64:selectable("Destinations", {
						[1] = "Console",
						[2] = "Event",
						[3] = "Notify"
					}):depend({
						[1] = nil,
						[2] = true,
						[1] = aim_logging.enabled
					})
					aim_logging.hitlogs_style = v64:combo("Hitlogs style", {
						[1] = "Default",
						[2] = "Alternative"
					}):depend({
						[1] = nil,
						[2] = true,
						[1] = aim_logging.enabled
					}, {
						[1] = nil,
						[2] = "Event",
						[1] = aim_logging.output
					})
					aim_logging.alternative_hit_color = v64:color_picker("Hit color\nalternative_hit_color", color(0, 255, 0, 255)):depend({
						[1] = nil,
						[2] = true,
						[1] = aim_logging.enabled
					}, {
						[1] = nil,
						[2] = "Event",
						[1] = aim_logging.output
					}, {
						[1] = nil,
						[2] = "Alternative",
						[1] = aim_logging.hitlogs_style
					})
					aim_logging.alternative_miss_color = v64:color_picker("Miss color\nalternative_miss_color", color(255, 0, 0, 255)):depend({
						[1] = nil,
						[2] = true,
						[1] = aim_logging.enabled
					}, {
						[1] = nil,
						[2] = "Event",
						[1] = aim_logging.output
					}, {
						[1] = nil,
						[2] = "Alternative",
						[1] = aim_logging.hitlogs_style
					})
					aim_logging.notify_color = v64:color_picker("Notify color\nnotify_color", color(105, 205, 255, 255)):depend({
						[1] = nil,
						[2] = true,
						[1] = aim_logging.enabled
					}, {
						[1] = nil,
						[2] = "Notify",
						[1] = aim_logging.output
					})
					t6.other.visuals = {}
					t6.other.visuals.scope_overlay = {}

					local scope_overlay = t6.other.visuals.scope_overlay

					scope_overlay.enabled = visuals:switch(v12("crosshairs-simple", "Scope lines")):depend({
						t6.other.tabs,
						v58(2)
					})

					local v66 = scope_overlay.enabled:create()

					scope_overlay.additions = v66:selectable("Line modifiers", {
						[1] = "Inverted",
						[2] = "Rotated",
						[3] = "Animated",
						[4] = "Spread Dependency"
					}):depend({
						[1] = nil,
						[2] = true,
						[1] = scope_overlay.enabled
					})
					scope_overlay.exclude_lines = v66:selectable("Hidden lines", {
						[1] = "Left",
						[2] = "Right",
						[3] = "Top",
						[4] = "Bottom"
					}):depend({
						[1] = nil,
						[2] = true,
						[1] = scope_overlay.enabled
					})
					scope_overlay.size = v66:slider("Size", 0, 300, 50, 1, "px"):depend({
						[1] = nil,
						[2] = true,
						[1] = scope_overlay.enabled
					})
					scope_overlay.gap = v66:slider("Gap", 0, 300, 5, 1, "px"):depend({
						[1] = nil,
						[2] = true,
						[1] = scope_overlay.enabled
					})
					scope_overlay.color = v66:color_picker("Color", color(255, 255, 255, 128)):depend({
						[1] = nil,
						[2] = true,
						[1] = scope_overlay.enabled
					})
					t6.other.visuals.damage_indicator = {}

					local damage_indicator = t6.other.visuals.damage_indicator

					damage_indicator.enabled = visuals:switch(v12("hundred-points", "Damage marker")):depend({
						t6.other.tabs,
						v58(2)
					})

					local v68 = damage_indicator.enabled:create()

					damage_indicator.font = v68:combo("Font", {
						[1] = "Default",
						[2] = "Small",
						[3] = "Console",
						[4] = "Bold"
					}):depend({
						[1] = nil,
						[2] = true,
						[1] = damage_indicator.enabled
					})
					damage_indicator.color = v68:color_picker("Accent", color(255, 255, 255, 255)):depend({
						[1] = nil,
						[2] = true,
						[1] = damage_indicator.enabled
					})
					t6.other.visuals.model_changer = {}

					local model_changer = t6.other.visuals.model_changer

					model_changer.enabled = visuals:switch(v12("user-gear", "Player models")):depend({
						t6.other.tabs,
						v58(2)
					})

					local v70 = model_changer.enabled:create()

					model_changer.t_model = v70:combo("T-side model", t4.t_names):depend({
						[1] = nil,
						[2] = true,
						[1] = model_changer.enabled
					})
					model_changer.ct_model = v70:combo("CT-side model", t4.ct_names):depend({
						[1] = nil,
						[2] = true,
						[1] = model_changer.enabled
					})
				end

				t6.other.visuals.skeet_indicators = {}

				local skeet_indicators2 = t6.other.visuals.skeet_indicators
				local t11 = {
					[1] = "PING",
					[2] = "DT",
					[3] = "OSAA",
					[4] = "DUCK",
					[5] = "DA",
					[6] = "SAFE",
					[7] = "BODY",
					[8] = "MD",
					[9] = "HC",
					[10] = "FS",
					[11] = "C4"
				}

				skeet_indicators2.enabled = visuals:switch(v12("list", "Status indicators")):depend({
					t6.other.tabs,
					v58(2)
				})

				local v73 = skeet_indicators2.enabled:create()

				skeet_indicators2.items = v73:selectable("Visible items", t11)
				skeet_indicators2.customize = v73:switch("Custom text")
				skeet_indicators2.animated = v73:switch("Animated indicators")
				skeet_indicators2.animation_speed = v73:slider("Animation speed", 1, 30, 8, 1, "t"):depend({
					[1] = nil,
					[2] = true,
					[1] = skeet_indicators2.animated
				})

				for i = 1, #t11 - 1 do
					local v75 = t11[i]

					skeet_indicators2[v75] = v73:input(v75, v75)
				end

				local function v76(p19)
					-- upvalues: t11 (copy)
					if #p19:get() == 0 then
						p19:set(t11)
					end
				end
				local function v77()
					-- upvalues: skeet_indicators2 (copy), v76 (copy), t11 (copy)
					local v346 = skeet_indicators2.enabled:get()
					local v347 = skeet_indicators2.customize:get()
					local v348 = skeet_indicators2.animated:get()

					v76(skeet_indicators2.items)
					skeet_indicators2.items:visibility(v346)
					skeet_indicators2.customize:visibility(v346)
					skeet_indicators2.animated:visibility(v346)
					skeet_indicators2.animation_speed:visibility(v346 and v348)

					for i = 1, #t11 - 1 do
						skeet_indicators2[t11[i]]:visibility(v346 and v347)
					end
				end

				skeet_indicators2.enabled:set_callback(v77)
				skeet_indicators2.customize:set_callback(v77)
				skeet_indicators2.animated:set_callback(v77)
				skeet_indicators2.items:set_callback(function()
					-- upvalues: v76 (copy), skeet_indicators2 (copy)
					v76(skeet_indicators2.items)
				end)
				v77()
				t6.other.misc = {}

				local misc2 = t6.other.misc

				misc2.aspect_ratio = {}

				local aspect_ratio = misc2.aspect_ratio

				aspect_ratio.enabled = misc:switch(v12("tv", "Aspect ratio")):depend({
					t6.other.tabs,
					v58(3)
				})

				local v80 = aspect_ratio.enabled:create()

				aspect_ratio.proportion = v80:slider("Ratio value", 0, 200, 0, 0.01, function(p20)
					return ({
						[0] = "Off",
						[125] = "5:4",
						[160] = "16:10",
						[177] = "16:9",
						[150] = "3:2",
						[133] = "4:3"
					})[p20] or string.format("%.2f", p20 * 0.01)
				end)

				local t12 = {
					[1] = {
						[1] = "5:4",
						[2] = 125
					},
					[2] = {
						[1] = "4:3",
						[2] = 133
					},
					[3] = {
						[1] = "3:2",
						[2] = 150
					},
					[4] = {
						[1] = "16:10",
						[2] = 160
					},
					[5] = {
						[1] = "16:9",
						[2] = 177
					}
				}

				for i = 1, #t12 do
					local v83 = t12[i]

					v80:button(v83[1], function()
						-- upvalues: aspect_ratio (copy), v83 (copy)
						aspect_ratio.proportion:set(v83[2])
					end, true):depend({
						[1] = nil,
						[2] = true,
						[1] = aspect_ratio.enabled
					})
				end

				aspect_ratio.proportion:depend({
					[1] = nil,
					[2] = true,
					[1] = aspect_ratio.enabled
				})
				misc2.view_model = {}

				local view_model = misc2.view_model

				view_model.enabled = misc:switch(v12("hand", "Viewmodel editor")):depend({
					t6.other.tabs,
					v58(3)
				})

				local v85 = view_model.enabled:create()

				view_model.fov = v85:slider("FOV", -150, 150, 68, 1):depend({
					[1] = nil,
					[2] = true,
					[1] = view_model.enabled
				})
				view_model.x = v85:slider("X", -200, 200, 0, 0.1):depend({
					[1] = nil,
					[2] = true,
					[1] = view_model.enabled
				})
				view_model.y = v85:slider("Y", -200, 200, 0, 0.1):depend({
					[1] = nil,
					[2] = true,
					[1] = view_model.enabled
				})
				view_model.z = v85:slider("Z", -200, 200, 0, 0.1):depend({
					[1] = nil,
					[2] = true,
					[1] = view_model.enabled
				})
				view_model.reset = v85:button("Reset", function()
					-- upvalues: view_model (copy)
					view_model.fov:set(68)
					view_model.x:set(25)
					view_model.y:set(0)
					view_model.z:set(-15)
				end, true):depend({
					[1] = nil,
					[2] = true,
					[1] = view_model.enabled
				})
				misc2.clantag = misc:switch(v12("tag", "Clan tag")):depend({
					t6.other.tabs,
					v58(3)
				})
				misc2.fps_boost = misc:switch(v12("code-simple", "FPS boost")):depend({
					t6.other.tabs,
					v58(3)
				})
				t6.other.movement = {}

				local movement2 = t6.other.movement

				movement2.no_fall_damage = movement:switch(v12("person-arrow-up-from-line", "Fall damage guard")):depend({
					t6.other.tabs,
					v58(4)
				})
				movement2.fast_ladder = movement:switch(v12("water-ladder", "Fast ladder")):depend({
					t6.other.tabs,
					v58(4)
				})
				movement2.super_toss = movement:switch(v12("bomb", "Super toss")):depend({
					t6.other.tabs,
					v58(4)
				})
				movement2.nade_release = movement:switch(v12("calculator-simple", "Grenade release")):depend({
					t6.other.tabs,
					v58(4)
				})

				local v87 = movement2.nade_release:create()

				movement2.nade_release_he_damage = v87:slider("HE damage", 0, 50, 30, 1, function(p21)
					if p21 ~= 0 then
						return string.format("%d hp", p21)
					end

					return "Off"
				end):depend({
					[1] = nil,
					[2] = true,
					[1] = movement2.nade_release
				})
				movement2.nade_release_molotov_range = v87:slider("Molotov range", 0, 20, 20, 1, function(p22)
					if p22 ~= 0 then
						return string.format("%.1fm", p22 / 10)
					end

					return "Off"
				end):depend({
					[1] = nil,
					[2] = true,
					[1] = movement2.nade_release
				})

				local _ = {
					[1] = "PING",
					[2] = "DT",
					[3] = "OSAA",
					[4] = "DUCK",
					[5] = "DA",
					[6] = "SAFE",
					[7] = "BODY",
					[8] = "MD",
					[9] = "HC",
					[10] = "FS"
				}
				local u89 = false

				t6.other.tabs:set_callback(function(p23)
					-- upvalues: u89 (ref), v57 (copy), v56 (copy)
					if not u89 then
						local v359 = v57()

						u89 = true
						p23:update(v56(v359))
						p23:set(v359)
						u89 = false

						return
					end
				end, true)
				t13 = {
					get_velocity_2d = function(p24)
						local m_vecVelocity = p24.m_vecVelocity

						if m_vecVelocity ~= nil then
							if m_vecVelocity.length2d == nil then
								return math.sqrt((m_vecVelocity.x or 0) * (m_vecVelocity.x or 0) + (m_vecVelocity.y or 0) * (m_vecVelocity.y or 0))
							end

							return m_vecVelocity:length2d()
						end

						return 0
					end
				}
				t14 = {
					data = {
						jitter_side = false,
						ground_ticks = 0,
						sent_packets = 0,
						hidden_yaw = false,
						state_id = 0,
						jitter_ticks_delay = 1,
						jitter_timing_seeded = false,
						tick_counter = 0,
						yaw_base = "At Target",
						pitch = "Down",
						yaw_amount = 0,
						flick_next_command = 0,
						freestanding = false,
						distortion_direction = 1,
						distortion_angle = 0,
						defensive_seq_step = 1,
						spin_angle = 0,
						yaw_modifier_mode = "Disabled",
						yaw_modifier_offset = 0,
						yaw_modifier_step = 1,
						jitter_timing_step = 1,
						jitter_ticks_step = 1,
						inverter = false,
						jitter_ticks_seeded = false,
						body_yaw = true,
						jitter_delay = 1,
						jitter_ticks = 0,
						last_frame_time = globals.realtime
					}
				}

				local function v92(p25)
					-- upvalues: t14 (ref)
					local v363 = p25.yaw_modifier_mode:get()

					if v363 ~= "Min/Max" then
						if v363 ~= "Sequential" then
							return p25.yaw_modifier_amount:get()
						end

						local v364 = p25.yaw_modifier_steps:get()
						local v365 = math.clamp(t14.data.yaw_modifier_step, 1, v364)

						return p25.yaw_modifier_sequence[v365]:get()
					end

					local v366 = p25.yaw_modifier_amount_min:get()
					local v367 = p25.yaw_modifier_amount_max:get()

					if v367 < v366 then
						local v368 = v366

						v366 = v367
						v367 = v368
					end

					return utils.random_int(v366, v367)
				end

				function v93(p26, p27, p28)
					local v372 = (p26 + p27) / 2
					local v373 = p28 % 3

					if v373 ~= 0 then
						if v373 ~= 1 then
							return p27
						end

						return v372
					end

					return p26
				end
				function v94(p29, p30, p31)
					local v377 = (p30 - p29) / 4
					local v378 = p31 % 5

					if v378 ~= 0 then
						if v378 ~= 1 then
							if v378 ~= 2 then
								if v378 ~= 3 then
									return p30
								end

								return p30 - v377
							end

							return p29 + v377 * 2
						end

						return p29 + v377
					end

					return p29
				end
				function v95(p32)
					-- upvalues: v92 (copy), t14 (ref), v93 (copy), v94 (copy)
					local v380 = p32.yaw_modifier:get()

					if v380 ~= "Disabled" then
						local v381 = v92(p32)
						local jitter_side = t14.data.jitter_side
						local n1 = 0
						local s4 = "Disabled"

						if v380 ~= "Center" then
							if v380 ~= "Random" then
								if v380 ~= "Spin" then
									if v380 ~= "3-Way" then
										if v380 == "5-Way" then
											n1 = v94(-v381, v381, t14.data.sent_packets % 5)
										end
									else
										n1 = v93(-v381, v381, t14.data.sent_packets % 3)
									end
								else
									s4 = "Spin"
									n1 = v381
								end
							else
								n1 = utils.random_int(-math.abs(v381), math.abs(v381))
							end
						else
							n1 = jitter_side and -v381 / 2 or v381 / 2
						end

						local v385 = p32.yaw_modifier_randomize:get()

						if v385 > 0 then
							n1 = n1 + (jitter_side and utils.random_int(-v385 / 3, 0) or utils.random_int(0, v385 / 3))
						end

						if s4 == "Disabled" then
							return "Disabled", 0, n1
						end

						return s4, n1, 0
					end

					return "Disabled", 0, 0
				end

				local function v96(p33, p34)
					if p34 < p33 then
						local v388 = p33

						p33 = p34
						p34 = v388
					end

					return utils.random_int(p33, p34)
				end

				function v97(p35)
					-- upvalues: t14 (ref), v96 (copy)
					local v390 = p35.jitter_ticks_mode:get()

					if v390 ~= "Min/Max" then
						if v390 ~= "Sequential" then
							t14.data.jitter_ticks_seeded = false

							return p35.jitter_speed_ticks:get()
						end

						t14.data.jitter_ticks_seeded = false

						local v391 = p35.jitter_speed_ticks_steps:get()
						local v392 = math.clamp(t14.data.jitter_ticks_step, 1, v391)

						return p35.jitter_speed_ticks_sequence[v392]:get()
					end

					if not t14.data.jitter_ticks_seeded then
						t14.data.jitter_ticks_delay = v96(p35.jitter_speed_ticks_min:get(), p35.jitter_speed_ticks_max:get())
						t14.data.jitter_ticks_seeded = true
					end

					return t14.data.jitter_ticks_delay
				end
				function v98(p36)
					-- upvalues: t14 (ref), v96 (copy)
					if p36.jitter_timing_mode:get() ~= "Sequential" then
						if not t14.data.jitter_timing_seeded then
							t14.data.jitter_delay = v96(p36.jitter_speed_timing_min:get(), p36.jitter_speed_timing_max:get())
							t14.data.jitter_timing_seeded = true
						end

						return t14.data.jitter_delay
					end

					t14.data.jitter_timing_seeded = false

					local v394 = p36.jitter_speed_timing_steps:get()
					local v395 = math.clamp(t14.data.jitter_timing_step, 1, v394)

					return p36.jitter_speed_timing_sequence[v395]:get()
				end
				function v99(p37)
					-- upvalues: t14 (ref), t13 (ref)
					local v397 = t14.get_base_state(p37)
					local v398 = t13.get_velocity_2d(p37)

					if v397 ~= 3 and v397 ~= 4 then
						if v397 ~= 2 then
							if v397 ~= 7 then
								if v397 ~= 5 and v397 ~= 6 then
									return 5
								end

								return 4
							end

							return 3
						end

						return v398 > 160 and 2 or 3
					end

					return 1
				end
				function v100(p38)
					-- upvalues: t14 (ref), v96 (copy)
					local v400 = p38.switch_method:get()

					if v400 ~= "Ticks" then
						if v400 ~= "Timing" then
							t14.data.jitter_ticks_seeded = false
							t14.data.jitter_timing_seeded = false
						else
							t14.data.jitter_ticks_seeded = false

							if p38.jitter_timing_mode:get() ~= "Sequential" then
								t14.data.jitter_delay = v96(p38.jitter_speed_timing_min:get(), p38.jitter_speed_timing_max:get())
								t14.data.jitter_timing_seeded = true
							else
								t14.data.jitter_timing_seeded = false

								local v401 = p38.jitter_speed_timing_steps:get()

								t14.data.jitter_timing_step = t14.data.jitter_timing_step % v401 + 1
							end
						end
					else
						t14.data.jitter_timing_seeded = false

						if p38.jitter_ticks_mode:get() ~= "Min/Max" then
							if p38.jitter_ticks_mode:get() == "Sequential" then
								local v402 = p38.jitter_speed_ticks_steps:get()

								t14.data.jitter_ticks_step = t14.data.jitter_ticks_step % v402 + 1
							end
						else
							t14.data.jitter_ticks_delay = v96(p38.jitter_speed_ticks_min:get(), p38.jitter_speed_ticks_max:get())
							t14.data.jitter_ticks_seeded = true
						end
					end
				end
			end

			local function u101()
				-- upvalues: t14 (ref)
				local realtime = globals.realtime
				local v404 = realtime - t14.data.last_frame_time

				t14.data.last_frame_time = realtime

				return math.min(v404, 0.033)
			end
			local function v102(p39, p40, p41)
				-- upvalues: u101 (ref), t14 (ref)
				local v408 = u101()

				t14.data.spin_angle = t14.data.spin_angle + p39 * v408 * 10

				if not (p41 < t14.data.spin_angle) then
					if p40 > t14.data.spin_angle then
						t14.data.spin_angle = t14.data.spin_angle + (p41 - p40)
					end
				else
					t14.data.spin_angle = t14.data.spin_angle - (p41 - p40)
				end

				return t14.data.spin_angle
			end
			local function v103(p42, p43, p44)
				-- upvalues: t14 (ref), u101 (ref)
				if t14.data.progressive_angle == nil then
					t14.data.progressive_angle = p42
				end

				local v412 = u101()

				t14.data.progressive_angle = t14.data.progressive_angle + p44 * v412 * 30

				if not (p43 < t14.data.progressive_angle) then
					if p42 > t14.data.progressive_angle then
						t14.data.progressive_angle = p43
					end
				else
					t14.data.progressive_angle = p42
				end

				return t14.data.progressive_angle
			end
			local function v104(p45, p46, p47)
				-- upvalues: u101 (ref), t14 (ref)
				local v416 = u101()

				t14.data.distortion_angle = t14.data.distortion_angle + p45 * v416 * 10 * t14.data.distortion_direction

				if not (p47 <= t14.data.distortion_angle) then
					if p46 >= t14.data.distortion_angle then
						t14.data.distortion_angle = p46
						t14.data.distortion_direction = 1
					end
				else
					t14.data.distortion_angle = p47
					t14.data.distortion_direction = -1
				end

				return t14.data.distortion_angle
			end
			local function v105(p48, p49, p50)
				local v420 = globals.tickcount / p48
				local v421 = (math.sin(v420) + 1) * 0.5

				return p49 + (p50 - p49) * v421
			end

			function t14.update_ground_ticks(p51, _)
				-- upvalues: v7 (copy), t14 (ref)
				if v7(p51.m_fFlags or 0, 1) == 0 then
					t14.data.ground_ticks = 0
				else
					t14.data.ground_ticks = t14.data.ground_ticks + 1
				end
			end
			function t14.get_base_state(p53)
				-- upvalues: t3 (copy), t13 (ref), t14 (ref)
				if not t3.aa.misc.slow_walk:get() then
					local v425 = t13.get_velocity_2d(p53)
					local v426 = not (t14.data.ground_ticks <= 4)
					local v427 = not ((p53.m_flDuckAmount or 0) <= 0.65)
					local v428 = not (v425 <= 5)

					if v426 then
						if not v427 then
							if not v428 then
								return 1
							end

							return 2
						end

						return v428 and 6 or 5
					end

					return v427 and 4 or 3
				end

				return 7
			end
			function t14.get_state(p54)
				-- upvalues: t6 (ref), t14 (ref)
				local v430 = entity.get_local_player():get_player_weapon()

				v430:get_weapon_info()

				local v431 = v430:get_classname()
				local v432 = v431 == "CWeaponTaser"

				if (v431 ~= "CKnife" or not t6.anti_aim.tweaks.safe_head:get("Knife")) and (not v432 or not t6.anti_aim.tweaks.safe_head:get("Taser")) then
					if t6.anti_aim.tweaks.manual_yaw:get() == "Disabled" then
						local v433 = t14.get_base_state(p54)
						local v434 = t6.anti_aim.states[v433]

						if not t6.anti_aim.tweaks.freestanding:get() or t6.anti_aim.tweaks.freestanding_disablers:get(v434) then
							return v433
						end

						return 8
					end

					return 9
				end

				return 10
			end

			local function v106(p55)
				while p55 > 180 do
					p55 = p55 - 360
				end

				while p55 < -180 do
					p55 = p55 + 360
				end

				return p55
			end

			local u107 = false

			local function v108(p56, p57, p58, p59)
				-- upvalues: t6 (ref), u107 (ref)
				if t6.anti_aim.tweaks.allow_on_use:get() then
					if p56.in_use then
						if p57 ~= nil and p58 ~= nil and p59 ~= nil then
							local v440 = p59.idx == 49
							local m_bIsDefusing = p57.m_bIsDefusing
							local m_bIsGrabbingHostage = p57.m_bIsGrabbingHostage
							local m_bInBombZone = p57.m_bInBombZone

							if not m_bIsDefusing and not m_bIsGrabbingHostage then
								if not m_bInBombZone or not v440 then
									if p57.m_iTeamNum == 3 and p56.view_angles ~= nil and p56.view_angles.x > 25 then
										local v444 = entity.get_entities("CPlantedC4") or {}
										local v445 = p57:get_origin()

										for i = 1, #v444 do
											if (v444[i]:get_origin() - v445):lengthsqr() < 3844 then
												return false
											end
										end
									end

									local v447 = render.camera_angles()
									local v448 = vector():angles(v447)
									local v449 = p57:get_eye_position()
									local v450 = v449 + v448 * 128
									local v451 = utils.trace_line(v449, v450, p57)

									if v451.fraction ~= 1 and v451.entity ~= nil then
										local v452 = v451.entity:get_classname()

										if v452 == "CBaseDoor" or v452 == "CFuncDoor" or v452 == "CFuncDoorRotating" or v452 == "CPropDoorRotating" or v452 == "CHostage" then
											return false
										end

										if v452 == "CWorld" or v452 == "CFuncBrush" or v452 == "CCSPlayer" then
											return true
										end

										if not u107 then
											u107 = true

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

					u107 = false

					return false
				end

				return false
			end
			local function v109(p60, p61, p62, p63)
				-- upvalues: v108 (copy), t14 (ref), t6 (ref), v106 (copy)
				if v108(p60, p61, p62, p63) then
					t14.data.pitch = "Disabled"
					t14.data.yaw_base = t6.anti_aim.tweaks.allow_on_use_yaw_base:get()
					t14.data.yaw_amount = v106(t14.data.yaw_amount + 180)
					t14.data.freestanding = false
					p60.in_use = false

					return
				end
			end

			function t14.on_createmove(p64)
				-- upvalues: t14 (ref), t6 (ref), v97 (copy), v98 (copy), v99 (copy), v100 (copy), v95 (copy), v105 (copy), v102 (copy), v93 (copy), v94 (copy), v104 (copy), v103 (copy), t3 (copy), v109 (copy), v106 (copy)
				local v458 = entity.get_local_player()

				if v458 and v458:is_alive() then
					local v459 = v458:get_player_weapon()

					if v459 and v459 ~= nil then
						local v460 = v459:get_weapon_info()

						v459:get_classname()
						t14.data.pitch = "Down"
						t14.data.yaw_base = "At Target"
						t14.update_ground_ticks(v458, p64)
						t14.data.state_id = t14.get_state(v458)

						local v461 = t6.anti_aim.builder[t14.data.state_id]

						if v461 then
							local v462 = t14.data.state_id == 9
							local v463 = t14.data.state_id == 8

							if v462 or v463 or v461.override_state:get() then
								t14.data.yaw_modifier_mode = "Disabled"
								t14.data.yaw_modifier_offset = 0

								if v461.mode:get() ~= "Static" then
									local n2 = 0

									if v461.switch_method:get() ~= "Ticks" then
										if v461.switch_method:get() ~= "Timing" then
											if v461.switch_method:get() ~= "Tick Phases" then
												if v461.switch_method:get() == "Smart" then
													t14.data.jitter_ticks_seeded = false
													t14.data.jitter_timing_seeded = false
													n2 = v99(v458)
												end
											else
												t14.data.jitter_ticks_seeded = false
												t14.data.jitter_timing_seeded = false

												local v465 = v461.jitter_speed_phases_switch_speed:get()
												local v466 = math.floor(t14.data.sent_packets / v465) % 4 + 1

												if v466 ~= 1 then
													if v466 ~= 2 then
														if v466 ~= 3 then
															n2 = v461.jitter_speed_phase_4:get()
														else
															n2 = v461.jitter_speed_phase_3:get()
														end
													else
														n2 = v461.jitter_speed_phase_2:get()
													end
												else
													n2 = v461.jitter_speed_phase_1:get()
												end
											end
										else
											n2 = v98(v461)
										end
									else
										n2 = v97(v461)
									end

									if p64.choked_commands == 0 then
										t14.data.sent_packets = t14.data.sent_packets + 1
										t14.data.jitter_ticks = t14.data.jitter_ticks + 1
									end

									if globals.choked_commands == 0 and n2 > 0 and n2 <= t14.data.jitter_ticks then
										t14.data.jitter_ticks = 0
										t14.data.jitter_side = not t14.data.jitter_side
										t14.data.yaw_modifier_step = t14.data.yaw_modifier_step + 1

										if t14.data.yaw_modifier_step > v461.yaw_modifier_steps:get() then
											t14.data.yaw_modifier_step = 1
										end

										v100(v461)
									end

									if t6.anti_aim.tweaks.manual_yaw:get() == "Disabled" then
										t14.data.yaw_amount = (t14.data.jitter_side and v461.yaw_add_left:get() or v461.yaw_add_right:get()) + (t14.data.jitter_side and utils.random_int(-v461.yaw_add_randomize:get() / 5, 0) or utils.random_int(0, v461.yaw_add_randomize:get() / 5))

										local v467, v468, v469 = v95(v461)

										t14.data.yaw_modifier_mode = v467
										t14.data.yaw_modifier_offset = v468
										t14.data.yaw_amount = t14.data.yaw_amount + v469
									end

									t14.data.inverter = t14.data.jitter_side
								else
									t14.data.yaw_amount = v461.yaw_amount:get() + utils.random_int(0, v461.yaw_randomize:get())
									t14.data.inverter = v461.inverter_body:get()
								end

								ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override(v461.break_lc:get("Double Tap") and "Always On" or "On Peek")
								ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):override(v461.break_lc:get("Hide Shots") and "Break LC" or "Favor Fire Rate")

								if v461.break_lc_ticks_mode:get() ~= "Static" then
									if v461.break_lc_ticks_mode:get() ~= "Min/Max" then
										if v461.break_lc_ticks_mode:get() ~= "Sequential" then
											p64.force_defensive = globals.tickcount % utils.random_int(1, v461.break_lc_ticks_random:get()) == 0
										else
											local v470 = v461.break_lc_ticks_seq_steps:get()
											local v471 = math.clamp(t14.data.defensive_seq_step, 1, v470)
											local v472 = v461.break_lc_ticks_sequence[v471]:get()

											p64.force_defensive = globals.tickcount % v472 == 0

											if p64.force_defensive then
												t14.data.defensive_seq_step = t14.data.defensive_seq_step % v470 + 1
											end
										end
									else
										local v473 = v461.break_lc_ticks_min:get()
										local v474 = v461.break_lc_ticks_max:get()

										if v474 < v473 then
											local v475 = v473

											v473 = v474
											v474 = v475
										end

										p64.force_defensive = globals.tickcount % utils.random_int(v473, v474) == 0
									end
								else
									p64.force_defensive = globals.tickcount % v461.break_lc_ticks_static:get() == 0
								end

								if not v461.break_lc_hidden_enable:get() then
									t14.data.hidden_yaw = false
								else
									t14.data.tick_counter = t14.data.tick_counter + 1
									t14.data.hidden_yaw = true

									if v461.break_lc_hidden_pitch:get() ~= "Disabled" then
										if v461.break_lc_hidden_pitch:get() ~= "Down" then
											if v461.break_lc_hidden_pitch:get() ~= "Up" then
												if v461.break_lc_hidden_pitch:get() ~= "Half Up" then
													if v461.break_lc_hidden_pitch:get() ~= "Half Down" then
														if v461.break_lc_hidden_pitch:get() ~= "Sway" then
															if v461.break_lc_hidden_pitch:get() == "Sway" then
																rage.antiaim:override_hidden_pitch(v461.break_lc_hidden_pitch_custom:get())
															end
														else
															rage.antiaim:override_hidden_pitch(v105(v461.break_lc_hidden_pitch_sway_speed:get(), -89, 89))
														end
													else
														rage.antiaim:override_hidden_pitch(45)
													end
												else
													rage.antiaim:override_hidden_pitch(-45)
												end
											else
												rage.antiaim:override_hidden_pitch(-89)
											end
										else
											rage.antiaim:override_hidden_pitch(89)
										end
									else
										rage.antiaim:override_hidden_pitch(0)
									end

									if v461.break_lc_hidden_yaw:get() ~= "Sideways" then
										if v461.break_lc_hidden_yaw:get() ~= "Center" then
											if v461.break_lc_hidden_yaw:get() ~= "Random" then
												if v461.break_lc_hidden_yaw:get() ~= "Spin" then
													if v461.break_lc_hidden_yaw:get() ~= "3-Way" then
														if v461.break_lc_hidden_yaw:get() ~= "5-Way" then
															if v461.break_lc_hidden_yaw:get() ~= "Distortion" then
																if v461.break_lc_hidden_yaw:get() ~= "Progressive" then
																	if v461.break_lc_hidden_yaw:get() == "Custom" then
																		rage.antiaim:override_hidden_yaw_offset(v461.break_lc_hidden_yaw_custom:get())
																	end
																else
																	local v476 = v461.break_lc_hidden_yaw_progressive_min:get()
																	local v477 = v461.break_lc_hidden_yaw_progressive_max:get()
																	local v478 = v461.break_lc_hidden_yaw_progressive_step:get()

																	rage.antiaim:override_hidden_yaw_offset(v103(v476, v477, v478))
																end
															else
																local v479 = v461.break_lc_hidden_yaw_distortion_range:get()
																local v480 = v461.break_lc_hidden_yaw_distortion_speed:get()

																rage.antiaim:override_hidden_yaw_offset(v104(v480, -v479, v479))
															end
														else
															local v481 = v461.break_lc_hidden_yaw_5way_min:get()
															local v482 = v461.break_lc_hidden_yaw_5way_max:get()

															rage.antiaim:override_hidden_yaw_offset(v94(v481, v482, t14.data.tick_counter))
														end
													else
														local v483 = v461.break_lc_hidden_yaw_3way_min:get()
														local v484 = v461.break_lc_hidden_yaw_3way_max:get()

														rage.antiaim:override_hidden_yaw_offset(v93(v483, v484, t14.data.tick_counter))
													end
												else
													local v485 = v461.break_lc_hidden_yaw_spin_speed:get()

													rage.antiaim:override_hidden_yaw_offset(v102(v485, -180, 180))
												end
											else
												local v486 = v461.break_lc_hidden_yaw_random_min:get()
												local v487 = v461.break_lc_hidden_yaw_random_max:get()

												rage.antiaim:override_hidden_yaw_offset(math.random(v486, v487))
											end
										else
											rage.antiaim:override_hidden_yaw_offset(t14.data.jitter_side and -v461.break_lc_hidden_yaw_center:get() / 2 or v461.break_lc_hidden_yaw_center:get() / 2)
										end
									else
										local v488 = v461.break_lc_hidden_yaw_sideways_left:get()
										local v489 = v461.break_lc_hidden_yaw_sideways_right:get()

										rage.antiaim:override_hidden_yaw_offset(t14.data.jitter_side and v488 or v489)
									end
								end

								if t6.anti_aim.tweaks.manual_yaw:get() ~= "Forward" then
									if t6.anti_aim.tweaks.manual_yaw:get() ~= "Left" then
										if t6.anti_aim.tweaks.manual_yaw:get() == "Right" then
											t14.data.yaw_amount = 90
										end
									else
										t14.data.yaw_amount = -90
									end
								else
									t14.data.yaw_amount = 180
								end

								if t14.data.state_id ~= 8 then
									t14.data.freestanding = false
								else
									t14.data.freestanding = true
								end

								if t14.data.state_id ~= 10 then
									t14.data.body_yaw = true
								else
									t14.data.body_yaw = false
								end

								if not t6.anti_aim.tweaks.flick_exploit:get() then
									t14.data.flick_next_command = 0
								else
									local v490 = p64.command_number or globals.tickcount

									t14.data.yaw_amount = 0
									t14.data.body_yaw = false
									t14.data.hidden_yaw = true
									t3.rage.double_tap_lag_options:override("Always On")
									t3.rage.hide_shots_options:override("Break LC")
									rage.antiaim:override_hidden_pitch(0)
									rage.antiaim:override_hidden_yaw_offset(-90)

									if not (t14.data.flick_next_command > 0) or v490 > t14.data.flick_next_command + 9 then
										t14.data.flick_next_command = v490 + utils.random_int(8, 9)
									end

									if not (v490 >= t14.data.flick_next_command) then
										p64.force_defensive = false
									else
										p64.force_defensive = true
										t14.data.flick_next_command = v490 + utils.random_int(8, 9)
									end
								end

								v109(p64, v458, v459, v460)

								if t6.anti_aim.tweaks.roll:get() and p64.view_angles ~= nil then
									p64.view_angles.z = t6.anti_aim.tweaks.roll_value:get()
								end

								rage.antiaim:inverter(t14.data.inverter)
								t3.aa.angles.pitch:override(t14.data.pitch)
								t3.aa.angles.yaw:override("Backward")
								t3.aa.angles.yaw_base:override(t14.data.yaw_base)
								t3.aa.angles.yaw_add:override(v106(t14.data.yaw_amount))
								t3.aa.angles.hidden:override(t14.data.hidden_yaw)
								t3.aa.angles.yaw_modifier:override(t14.data.yaw_modifier_mode)
								t3.aa.angles.modifier_offset:override(t14.data.yaw_modifier_offset)
								t3.aa.angles.body_yaw:override(t14.data.body_yaw)
								t3.aa.angles.left_limit:override(60)
								t3.aa.angles.right_limit:override(60)
								t3.aa.angles.options:override("")
								t3.aa.angles.freestanding:override(t14.data.freestanding)
								t3.aa.angles.disable_yaw_modifiers:override(t6.anti_aim.tweaks.freestanding_disable_yaw_modifiers:get())
								t3.aa.angles.body_freestanding:override(t6.anti_aim.tweaks.freestanding_body:get())

								return
							end

							return
						end

						return
					end

					return
				end
			end

			events.createmove(t14.on_createmove)

			local anti_bruteforce = t6.anti_aim.tweaks.anti_bruteforce
			local anti_bruteforce_conditions = t6.anti_aim.tweaks.anti_bruteforce_conditions
			local anti_bruteforce_mode = t6.anti_aim.tweaks.anti_bruteforce_mode
			local anti_bruteforce_time = t6.anti_aim.tweaks.anti_bruteforce_time
			local n3 = 0
			local n4 = 0
			local n5 = 0
			local n6 = 0

			local function v118()
				-- upvalues: t14 (ref), t6 (ref)
				local state_id = t14.data.state_id

				if not (state_id >= 1) or not (state_id <= #t6.anti_aim.states) then
					return "Stand"
				end

				return t6.anti_aim.states[state_id]
			end
			local function v119()
				-- upvalues: anti_bruteforce (copy), v118 (copy), anti_bruteforce_conditions (copy)
				if anti_bruteforce:get() then
					local v492 = v118()

					return anti_bruteforce_conditions:get(v492)
				end

				return false
			end
			local function v120(p65)
				-- upvalues: n3 (ref), v119 (copy), anti_bruteforce_mode (copy), n4 (ref), n5 (ref), anti_bruteforce_time (copy), n6 (ref)
				if n3 ~= globals.tickcount then
					local v494 = entity.get_local_player()

					if v494 and v494:is_alive() then
						local v495 = entity.get(p65.userid, true)

						if v495 and v495:is_enemy() then
							local v496 = v494:get_eye_position()

							if not ((v496:closest_ray_point(v495:get_eye_position(), (vector(p65.x, p65.y, p65.z))) - v496):lengthsqr() > 5625) then
								if v119() then
									local v497 = anti_bruteforce_mode:get()

									if v497 ~= "Increase" then
										if v497 ~= "Decrease" then
											if v497 == "Meta" then
												n4 = math.random(0, 1) == 1 and math.random(-10, -5) or math.random(5, 10)
											end
										else
											n4 = math.random(-10, -5)
										end
									else
										n4 = math.random(5, 10)
									end

									n5 = anti_bruteforce_time:get()
									n6 = n4
									n3 = globals.tickcount

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
			local function v121()
				-- upvalues: v119 (copy), n5 (ref), n4 (ref), n6 (ref), t14 (ref)
				if v119() then
					if not (n5 > 0) then
						n4 = 0
						n6 = 0
					else
						n5 = n5 - globals.frametime
						t14.data.yaw_amount = t14.data.yaw_amount + n6
					end

					return
				end

				n5 = 0
				n4 = 0
				n6 = 0
			end
			local function v122()
				-- upvalues: n5 (ref), n4 (ref), n6 (ref)
				n5 = 0
				n4 = 0
				n6 = 0
			end

			anti_bruteforce:set_callback(function(p66)
				-- upvalues: v120 (copy), v121 (copy), v122 (copy)
				local v499 = p66:get()

				events.bullet_impact(v120, v499)
				events.createmove(v121, v499)
				events.shutdown(v122, v499)
			end, true)

			local no_fall_damage = t6.other.movement.no_fall_damage
			local u124 = false
			local v125 = math.pi * 2
			local v126 = v125 / 8

			local function v127(p67, p68)
				-- upvalues: v125 (copy), v126 (copy)
				local v502 = p67:get_origin()

				for i = 0, v125, v126 do
					local v504 = math.sin(i)
					local v505 = math.cos(i)
					local v506 = v502.x + v505 * 10
					local v507 = v502.y + v504 * 10
					local v508 = vector(v506, v507, v502.z)
					local v509 = v508:clone()

					v509.z = v509.z - p68

					if utils.trace_line(v508, v509, p67).fraction ~= 1 then
						return true
					end
				end

				return false
			end
			local function v128(p69)
				-- upvalues: u124 (ref), v127 (copy)
				local v511 = entity.get_local_player()

				if v511 ~= nil then
					if not (v511.m_vecVelocity.z >= -500) then
						if not v127(v511, 15) then
							if v127(v511, 75) then
								u124 = true
							end
						else
							u124 = false
						end

						p69.in_duck = u124

						return
					end

					u124 = false

					return
				end
			end

			no_fall_damage:set_callback(function(p70)
				-- upvalues: v128 (copy)
				events.createmove(v128, p70:get())
			end, true)
		end

		do
			local n7 = 9

			local function v130(p71)
				local x = render.camera_angles().x

				if p71.forwardmove > 0 and x < 45 then
					p71.view_angles.x = 89
					p71.in_moveright = 1
					p71.in_moveleft = 0
					p71.in_forward = 0
					p71.in_back = 1

					if p71.sidemove == 0 then
						p71.view_angles.y = p71.view_angles.y + 90
					end

					if p71.sidemove < 0 then
						p71.view_angles.y = p71.view_angles.y + 150
					end

					if p71.sidemove > 0 then
						p71.view_angles.y = p71.view_angles.y + 30
					end
				end

				if p71.forwardmove < 0 then
					p71.view_angles.x = 89
					p71.in_moveleft = 1
					p71.in_moveright = 0
					p71.in_forward = 1
					p71.in_back = 0

					if p71.sidemove == 0 then
						p71.view_angles.y = p71.view_angles.y + 90
					end

					if p71.sidemove > 0 then
						p71.view_angles.y = p71.view_angles.y + 150
					end

					if p71.sidemove < 0 then
						p71.view_angles.y = p71.view_angles.y + 30
					end
				end
			end
			local function v131(p72)
				-- upvalues: n7 (copy), v130 (copy)
				local v516 = entity.get_local_player()

				if v516 ~= nil then
					if v516.m_MoveType == n7 then
						v130(p72)

						return
					end

					return
				end
			end

			t6.other.movement.fast_ladder:set_callback(function(p73)
				-- upvalues: v131 (copy)
				events.createmove(v131, p73:get())
			end, true)

			local n8 = 0.3

			local function v133(p74, p75, p76)
				return p74 + p76 * (p75 - p74)
			end
			local function v134(p77, p78, p79, p80)
				-- upvalues: v133 (copy), n8 (copy)
				p77.x = p77.x - 10 + math.abs(p77.x) / 9

				local v525 = vector():angles(p77)
				local v526 = p80 * 1.25
				local v527 = math.clamp(p78 * 0.9, 15, 750)
				local v528 = math.clamp(p79, 0, 1)
				local v529 = v527 * v133(n8, 1, v528)
				local v530 = v525

				for _ = 1, 8 do
					v530 = (v525 * (v530 * v529 + v526):length() - v526) / v529
					v530:normalize()
				end

				local v532 = v530:angles()

				if not (v532.x > -10) then
					v532.x = 1.125 * v532.x + 11.25
				else
					v532.x = 0.9 * v532.x + 9
				end

				return v532
			end
			local function v135(p81)
				-- upvalues: v134 (copy)
				local v534 = entity.get_local_player()

				if v534 ~= nil then
					local v535 = v534:get_player_weapon()

					if v535 ~= nil then
						local v536 = v535:get_weapon_info()

						if v536 ~= nil then
							local v537 = v535.m_flThrowStrength or 1

							p81.angles = v134(p81.angles, v536.throw_velocity, v537, p81.velocity)

							return
						end

						return
					end

					return
				end
			end
			local function v136(p82)
				-- upvalues: v134 (copy)
				if p82.jitter_move == true then
					local v539 = entity.get_local_player()

					if v539 ~= nil then
						local v540 = v539:get_player_weapon()

						if v540 ~= nil then
							local v541 = v540:get_weapon_info()

							if v541 ~= nil and v541.weapon_type == 9 then
								local v542 = (globals.clock_offset or 0) * (globals.tickinterval or (globals.frametime or 0))

								if v540.m_fThrowTime ~= nil and not (v540.m_fThrowTime < globals.curtime - v542) then
									p82.in_speed = true

									local v543 = v539:simulate_movement()

									if v543 ~= nil then
										v543:think()

										local v544 = v540.m_flThrowStrength or 1

										p82.view_angles = v134(p82.view_angles, v541.throw_velocity, v544, v543.velocity)

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

			t6.other.movement.super_toss:set_callback(function(p83)
				-- upvalues: v136 (copy), v135 (copy)
				local v546 = p83:get()

				events.createmove(v136, v546)
				events.grenade_override_view(v135, v546)
			end, true)

			local nade_release = t6.other.movement.nade_release
			local nade_release_he_damage = t6.other.movement.nade_release_he_damage
			local nade_release_molotov_range = t6.other.movement.nade_release_molotov_range
			local t15 = {
				command_unlock_at = 0,
				command = {}
			}

			local function v141(p84)
				if p84 ~= nil and p84.is_player ~= nil then
					return not p84:is_player()
				end

				return true
			end
			local function v142(p85)
				local m_iItemDefinitionIndex = p85.m_iItemDefinitionIndex

				if m_iItemDefinitionIndex == nil and p85.get_weapon_index ~= nil then
					m_iItemDefinitionIndex = p85:get_weapon_index()
				end

				if m_iItemDefinitionIndex == 48 then
					m_iItemDefinitionIndex = 46
				end

				return m_iItemDefinitionIndex
			end
			local function v143(p86)
				-- upvalues: nade_release_he_damage (copy), nade_release_molotov_range (copy)
				if p86 ~= 44 then
					if p86 ~= 46 then
						return false
					end

					return not (nade_release_molotov_range:get() <= 0)
				end

				return not (nade_release_he_damage:get() <= 0)
			end
			local function v144(p87)
				-- upvalues: t15 (copy)
				t15.command.view_angles = p87.view_angles:clone()
				t15.command.move_yaw = p87.move_yaw
				t15.command.forwardmove = p87.forwardmove
				t15.command.sidemove = p87.sidemove
				t15.command.upmove = p87.upmove
				t15.command.in_jump = p87.in_jump
				t15.command.in_duck = p87.in_duck
				t15.command.in_walk = p87.in_walk
				t15.command.in_speed = p87.in_speed
				t15.command.in_left = p87.in_left
				t15.command.in_right = p87.in_right
				t15.command.in_bullrush = p87.in_bullrush
			end
			local function v145(p88)
				-- upvalues: t15 (copy)
				p88.jitter_move = false
				p88.view_angles = t15.command.view_angles
				p88.move_yaw = t15.command.move_yaw
				p88.forwardmove = t15.command.forwardmove
				p88.sidemove = t15.command.sidemove
				p88.upmove = t15.command.upmove
				p88.in_attack = false
				p88.in_attack2 = false
				p88.in_jump = t15.command.in_jump
				p88.in_duck = t15.command.in_duck
				p88.in_walk = t15.command.in_walk
				p88.in_speed = t15.command.in_speed
				p88.in_moveleft = false
				p88.in_moveright = false
				p88.in_forward = false
				p88.in_back = false
				p88.in_left = t15.command.in_left
				p88.in_right = t15.command.in_right
				p88.in_bullrush = t15.command.in_bullrush
			end
			local function v146(p89, p90)
				-- upvalues: v144 (copy), t15 (copy)
				p89.jitter_move = false
				p89.in_attack = false
				p89.in_attack2 = false
				p89.in_moveleft = false
				p89.in_moveright = false
				p89.in_forward = false
				p89.in_back = false
				v144(p89)
				t15.command_unlock_at = globals.tickcount + p90
			end
			local function v147(p91)
				-- upvalues: t15 (copy), v145 (copy)
				if not (t15.command_unlock_at <= globals.tickcount) then
					v145(p91)

					return true
				end

				return false
			end
			local function v148(p92, p93, p94)
				return p92 + p94 * (p93 - p92)
			end
			local function v149(p95, p96, p97, p98)
				-- upvalues: v148 (copy)
				local v563 = p95:clone()

				v563.x = v563.x - 10 + math.abs(v563.x) / 9

				local v564 = vector():angles(v563)
				local v565 = p98 * 1.25
				local v566 = math.clamp(p96 * 0.9, 15, 750)
				local v567 = math.clamp(p97, 0, 1)
				local v568 = v566 * v148(0.3, 1, v567)
				local v569 = v564

				for _ = 1, 8 do
					v569 = (v564 * (v569 * v568 + v565):length() - v565) / v568
					v569:normalize()
				end

				local v571 = v569:angles()

				if not (v571.x > -10) then
					v571.x = 1.125 * v571.x + 11.25
				else
					v571.x = 0.9 * v571.x + 9
				end

				return v571
			end
			local function v150(p99, p100, p101, p102, p103)
				-- upvalues: t6 (ref), v149 (copy), v141 (copy)
				local v577 = p100:simulate_movement()

				if v577 ~= nil then
					if p100.m_MoveType ~= 9 then
						v577:think(p101)
					end

					local origin = v577.origin
					local velocity = v577.velocity

					if p100.m_MoveType == 9 then
						origin = p100.m_vecOrigin
						velocity = vector(0, 0, 0)
					end

					local v580 = math.clamp(p102.m_flThrowStrength or 1, 0, 1)

					if t6.other.movement.super_toss:get() then
						p99 = v149(p99, p103.throw_velocity, v580, velocity)
					end

					local v581 = vector(p99.x - (90 - math.abs(p99.x)) / 9, p99.y)
					local v582 = vector():angles(v581)
					local v583 = origin:clone()

					v583.z = v583.z + (v577.view_offset or 64) - 12 * (1 - v580)

					return utils.trace_hull(v583, v583 + v582 * 22, vector(-2, -2, -2), vector(2, 2, 2), v141, 34095115).end_pos - v582 * 6, v582 * math.clamp(p103.throw_velocity * 0.9, 15, 750) * (v580 * 0.7 + 0.3) + velocity * 1.25
				end

				return nil, nil
			end
			local function v151(p104, p105, p106)
				if p104 ~= 44 then
					if p104 ~= 46 then
						return false
					end

					return not (p106 >= (p105 - 1) * globals.tickinterval)
				end

				return (p105 - 1) * globals.tickinterval > 1.5 and p105 % math.floor(0.2 / globals.tickinterval + 0.5) == 0
			end
			local function v152(p107, p108, p109)
				-- upvalues: v141 (copy), v151 (copy)
				local v590 = cvar.sv_gravity:float() * 0.4
				local v591 = cvar.molotov_throw_detonate_time:float()
				local v592 = math.cos(math.rad(cvar.weapon_molotov_maxdetonateslope:float()))
				local tickinterval = globals.tickinterval
				local v594 = vector(-2, -2, -2)
				local v595 = vector(2, 2, 2)
				local v596 = false
				local n9 = 0
				local v598 = p109 ~= 46

				for i = 1, 256 do
					if p108:length() < 0.1 then
						break
					end

					local v600 = v590 * tickinterval * 0.5
					local v601 = vector(p108.x * tickinterval, p108.y * tickinterval, (p108.z - v600) * tickinterval)

					p108.z = p108.z - v590 * tickinterval

					local v602 = p107 + v601
					local v603 = utils.trace_hull(p107, v602, v594, v595, v141, 34095115)

					if v603.fraction < 1 then
						local normal = v603.plane.normal

						if p109 == 46 and v592 < normal.z then
							p107:init(v603.end_pos:unpack())

							return true, i, false
						end

						local v605 = p108 - normal * p108:dot(normal) * 2

						if math.abs(v605.x) < 0.1 then
							v605.x = 0
						end

						if math.abs(v605.y) < 0.1 then
							v605.y = 0
						end

						if math.abs(v605.z) < 0.1 then
							v605.z = 0
						end

						p108 = v605 * 0.45

						local v606 = p108:lengthsqr()

						if normal.z > 0.7 and v606 > 96000 then
							local v607 = p108:normalized():dot(normal)

							if v607 > 0.5 then
								p108 = p108 * (1.5 - v607)
							end
						end

						if v606 < 400 then
							p108 = vector(0, 0, 0)
						end

						local v608 = (1 - v603.fraction) * tickinterval

						if v608 > 0 and p108:lengthsqr() > 0 then
							v603 = utils.trace_hull(v603.end_pos, v603.end_pos + p108 * v608, v594, v595, v141, 34095115)
						end

						v602 = v603.end_pos
					end

					p107:init(v602:unpack())

					if v596 or v151(p109, i, v591) then
						n9 = i

						break
					end
				end

				local v609 = p109 == 44 and 24 or (p109 == 46 and 128 or nil)

				if v609 ~= nil then
					local v610 = utils.trace_line(p107, p107 - vector(0, 0, v609), v141, 34095115)

					if v610.fraction < 1 then
						p107:init(v610.end_pos:unpack())
						v598 = true
					end
				end

				return v598, n9, v596
			end
			local function v153(p110)
				local v612 = entity.get_player_resource()

				if v612 == nil or v612.m_bConnected[p110:get_index()] then
					if p110.get_network_state ~= nil then
						local v613 = p110:get_network_state()

						if v613 ~= 0 and v613 ~= 1 then
							return false
						end
					end

					local v614 = p110:get_bbox()

					return p110:is_alive() and (v614 == nil or not (v614.alpha <= 0))
				end

				return false
			end
			local function v154(p111)
				-- upvalues: nade_release_he_damage (copy), v153 (copy), v141 (copy)
				p111.z = p111.z + 1

				local v616 = nade_release_he_damage:get()
				local v617 = entity.get_players(true, true)

				for i = 1, #v617 do
					local v619 = v617[i]

					if v619 ~= nil and v153(v619) then
						local v620 = p111:dist(v619:get_origin() + v619.m_vecViewOffset)

						if v620 <= 350 then
							local v621 = v619:get_origin()
							local v622 = v621 + vector(0, 0, 71)
							local v623 = v621 + v619.m_vecViewOffset
							local v624 = v619.m_angEyeAngles ~= nil and v619.m_angEyeAngles.y or 0
							local v625 = vector():angles(vector(0, v624 + 90)) * 16
							local v626 = v623 - v625
							local v627 = v623 + v625
							local t16 = {
								[1] = 0.2,
								[2] = 0.4,
								[3] = 0.1,
								[4] = 0.1,
								[5] = 0.2
							}
							local t17 = {
								[1] = v622,
								[2] = v623,
								[3] = v626,
								[4] = v627,
								[5] = v621
							}
							local n10 = 0

							for j = 1, #t17 do
								if utils.trace_line(p111, t17[j], v141, 1174421507).fraction == 1 then
									n10 = n10 + t16[j]
								end
							end

							if n10 > 0 then
								local v632 = math.exp(-v620 * v620 / 27222.2222222) * 99 * n10
								local v633 = v619.m_ArmorValue or 0

								if v633 > 0 then
									local v634 = v632 * 0.6

									if v633 < (v632 - v634) * 0.5 then
										v634 = v632 - v633 * 2
									end

									v632 = v634
								end

								if v616 <= v632 then
									return true
								end
							end
						end
					end
				end

				return false
			end
			local function v155(p112)
				if p112 > -64 and not (p112 >= 120) then
					local n11 = 22500

					if not (p112 > 72) then
						if p112 < 18 then
							n11 = n11 - 0.90957763236 * (18 - p112) ^ 2
						end
					else
						n11 = n11 - 5.42534722222 * (p112 - 72) ^ 2
					end

					return n11
				end

				return 0
			end
			local function v156(p113, p114, _)
				-- upvalues: v155 (copy)
				for i = 1, #p114 do
					local v641 = p114[i]
					local v642 = v155(p113.z - v641.m_vecOrigin.z)

					if v642 > 0 and v642 >= p113:dist2dsqr(v641.m_vecOrigin) then
						return true
					end
				end

				return false
			end
			local function v157(p116, p117)
				-- upvalues: nade_release_molotov_range (copy), v156 (copy), v153 (copy), v141 (copy)
				local v645 = (nade_release_molotov_range:get() / 10 * 50.85) ^ 2
				local t18 = {}
				local v647 = globals.server_tick or globals.tickcount

				entity.get_entities("CSmokeGrenadeProjectile", true, function(p118)
					-- upvalues: p116 (copy), v647 (copy), p117 (copy), t18 (copy)
					if p118.m_vecOrigin ~= nil and p118.m_nSmokeEffectTickBegin ~= nil and p116:distsqr(p118.m_vecOrigin) <= 44100 and v647 - p118.m_nSmokeEffectTickBegin + p117 < 1112 then
						t18[#t18 + 1] = p118
					end
				end)

				if not v156(p116, t18, p117) then
					local v648 = entity.get_players(true, true)
					local t19 = {}

					for i = 1, #v648 do
						local v651 = v648[i]

						if v651 ~= nil and v153(v651) and p116:distsqr((v651:get_origin())) <= 14400 then
							t19[#t19 + 1] = v651
						end
					end

					for i = 1, #t19 do
						local v653 = t19[i]:get_origin()
						local v654 = p116:dist2dsqr(v653)

						if v654 <= 3600 and math.abs(v653.z - p116.z) <= 100 and v654 <= v645 then
							return true
						end
					end

					local t20 = {}
					local v656 = utils.random_float(0, 0.785)

					for i = v656, 5.495 + v656, 0.785 do
						local v658 = p116 + vector(math.cos(i), math.sin(i), 0) * 60

						v658.z = utils.trace_line(v658 + vector(0, 0, 50), v658 - vector(0, 0, 200), v141, 16387).end_pos.z

						if not v156(v658, t18, p117) and utils.trace_line(p116 + vector(0, 0, 30), v658 + vector(0, 0, 30), v141, 33570819).fraction == 1 then
							t20[#t20 + 1] = v658
						end
					end

					for i = 1, #t19 do
						local v660 = t19[i]:get_origin()

						for j = 1, #t20 do
							local v662 = t20[j]

							if v662:dist2dsqr(v660) <= 3600 and math.abs(v660.z - v662.z) <= 100 and v645 >= p116:dist2dsqr(v660) then
								return true
							end
						end
					end

					return false
				end

				return false
			end
			local function v158(p119)
				-- upvalues: v147 (copy), v142 (copy), v143 (copy), v150 (copy), v152 (copy), v154 (copy), v157 (copy), v146 (copy)
				if not v147(p119) then
					if p119.jitter_move == true then
						local v664 = entity.get_local_player()

						if v664 ~= nil and v664:is_alive() then
							local v665 = v664:get_player_weapon()

							if v665 ~= nil and v665.m_bPinPulled == true then
								local v666 = v142(v665)

								if v143(v666) then
									local v667 = v665:get_weapon_info()

									if v667 ~= nil then
										local v668 = rage.exploit:get() == 1 and 2 or 8
										local v669, v670 = v150(p119.view_angles, v664, v668, v665, v667)

										if v669 ~= nil and v670 ~= nil then
											local v671, v672, v673 = v152(v669, v670, v666)

											if v671 or v673 then
												local v674 = false

												if v666 ~= 44 then
													if v666 == 46 then
														v674 = v157(v669, v668 + v672)
													end
												else
													v674 = v154(v669)
												end

												if v674 or v673 then
													v146(p119, v668)
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

						return
					end

					return
				end
			end

			nade_release:set_callback(function(p120)
				-- upvalues: v158 (copy)
				events.createmove(v158, p120:get())
			end, true)

			local clantag = t6.other.misc.clantag
			local u160 = nil

			local function v161(p121)
				-- upvalues: u160 (ref)
				if p121 ~= u160 then
					common.set_clan_tag(p121)
					u160 = p121

					return
				end
			end

			clantag:set_callback(function(p122)
				-- upvalues: v161 (copy)
				if not p122:get() then
					v161("")
				end
			end, true)
			events.net_update_end(function()
				-- upvalues: clantag (copy), v161 (copy)
				if not clantag:get() then
					v161("")
				else
					v161("frost.lua")
				end
			end)
			events.shutdown(function()
				common.set_clan_tag("")
			end)

			local fps_boost = t6.other.misc.fps_boost
			local t21 = {
				[1] = {
					default_value = 1,
					name = "r_shadows",
					value = 0
				},
				[2] = {
					default_value = 1,
					name = "cl_csm_static_prop_shadows",
					value = 0
				},
				[3] = {
					default_value = 1,
					name = "r_3dsky",
					value = 0
				},
				[4] = {
					default_value = 1,
					name = "fog_enable",
					value = 0
				},
				[5] = {
					default_value = 1,
					name = "fog_enable_water_fog",
					value = 0
				},
				[6] = {
					default_value = 1,
					name = "cl_csm_world_shadows",
					value = 0
				},
				[7] = {
					default_value = 1,
					name = "cl_csm_translucent_shadows",
					value = 0
				},
				[8] = {
					default_value = 1,
					name = "cl_csm_shadows",
					value = 0
				},
				[9] = {
					default_value = 0,
					name = "mat_disable_bloom",
					value = 1
				},
				[10] = {
					default_value = 1,
					name = "cl_csm_world_shadows_in_viewmodelcascade",
					value = 0
				},
				[11] = {
					default_value = 1,
					name = "r_drawdecals",
					value = 0
				},
				[12] = {
					default_value = 1,
					name = "r_eyegloss",
					value = 0
				},
				[13] = {
					default_value = 1,
					name = "r_eyes",
					value = 0
				},
				[14] = {
					default_value = 1,
					name = "r_drawtracers_firstperson",
					value = 0
				},
				[15] = {
					default_value = 1,
					name = "violence_hblood",
					value = 0
				},
				[16] = {
					default_value = 1,
					name = "cl_csm_entity_shadows",
					value = 0
				},
				[17] = {
					default_value = 1,
					name = "cl_foot_contact_shadows",
					value = 0
				},
				[18] = {
					default_value = 1,
					name = "cl_csm_viewmodel_shadows",
					value = 0
				},
				[19] = {
					default_value = 1,
					name = "cl_csm_rope_shadows",
					value = 0
				},
				[20] = {
					default_value = 1,
					name = "cl_csm_sprite_shadows",
					value = 0
				},
				[21] = {
					default_value = 1,
					name = "r_drawropes",
					value = 0
				},
				[22] = {
					default_value = 1,
					name = "r_drawsprites",
					value = 1
				},
				[23] = {
					default_value = 3,
					name = "func_break_max_pieces",
					value = 0
				},
				[24] = {
					default_value = 1,
					name = "r_dynamic",
					value = 0
				},
				[25] = {
					default_value = 1,
					name = "r_dynamiclighting",
					value = 0
				},
				[26] = {
					default_value = 0,
					name = "cl_disable_ragdolls",
					value = 1
				},
				[27] = {
					default_value = 1,
					name = "r_drawparticles",
					value = 1
				},
				[28] = {
					default_value = 1,
					name = "muzzleflash_light",
					value = 0
				},
				[29] = {
					default_value = 1,
					name = "r_eyemove",
					value = 0
				}
			}

			local function v164(p123, p124)
				if p123 ~= nil then
					if p123.int == nil then
						if p123.set_int == nil then
							if p123.float ~= nil then
								p123:float(p124, true)
							end

							return
						end

						p123:set_int(p124)

						return
					end

					p123:int(p124, true)

					return
				end
			end
			local function v165(p125)
				-- upvalues: t21 (copy), v164 (copy)
				for i = 1, #t21 do
					local v682 = t21[i]
					local v683 = cvar[v682.name]

					v164(v683, p125 and v682.value or v682.default_value)
				end
			end

			local n12 = 0

			fps_boost:set_callback(function(p126)
				-- upvalues: v165 (copy)
				v165(p126:get())
			end, true)
			events.render(function()
				-- upvalues: fps_boost (copy), n12 (ref), v164 (copy)
				if fps_boost:get() then
					local realtime = globals.realtime

					if not (realtime - n12 < 0.5) then
						n12 = realtime
						v164(cvar.r_drawsprites, 1)
						v164(cvar.r_drawparticles, 1)

						return
					end

					return
				end
			end)
			events.shutdown(function()
				-- upvalues: v165 (copy)
				v165(false)
			end)
		end

		t22 = {}

		local function v168(p127)
			local t23 = {}
			local n13 = 0

			for match in string.gmatch(p127, ".[\128-\191]*") do
				n13 = n13 + 1
				t23[n13] = match
			end

			return t23, n13
		end

		function t22.gradient(p128, p129, ...)
			-- upvalues: v168 (copy)
			local t24 = {}
			local v693, v694 = v168(p128)

			if not (v694 < 2) then
				local t25 = { ... }
				local v696 = 1 / (v694 - 1)
				local v697 = #t25 - 1

				for i = 1, v694 do
					local v699 = v693[i]
					local v700 = (p129 + i * v696) % 2

					if v700 > 1 then
						v700 = 2 - v700
					end

					local v701 = math.floor(v700 * v697) + 1

					if v701 >= #t25 then
						v701 = #t25 - 1
					end

					local v702 = t25[v701]:lerp(t25[v701 + 1], v700 * v697 % 1)

					t24[#t24 + 1] = "\a" .. v702:to_hex()
					t24[#t24 + 1] = v699
				end

				return table.concat(t24)
			end

			return p128
		end
		function t22.matrix(p130)
			-- upvalues: v168 (copy)
			local s5 = "abcdefghijklmnopqrstuvwxyz0123456789~!@#$%^&*+-/=?_<>"
			local _, v706 = v168(p130)
			local s6 = ""

			for _ = 1, v706 do
				local v709 = math.random(#s5)

				s6 = s6 .. s5:sub(v709, v709)
			end

			local v710 = math.abs(globals.realtime * 0.5 % 2 - 1) * (v706 + 1)
			local v711 = math.clamp(v710, 0, v706)

			return p130:sub(1, v711) .. s6:sub(v711 + 1)
		end
		function t22.matrix2(p131)
			-- upvalues: v168 (copy)
			local s7 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789~!@#$%^&*+-/=?_<>"
			local _, v715 = v168(p131)
			local v716 = math.floor(globals.realtime / 0.12)

			math.randomseed(v716)

			local s8 = ""

			for i = 1, v715 do
				local v719 = p131:sub(i, i)

				if v719 ~= " " then
					if not (math.random(100) > 45) then
						local v720 = math.random(#s7)

						s8 = s8 .. s7:sub(v720, v720)
					else
						s8 = s8 .. v719
					end
				else
					s8 = s8 .. " "
				end
			end

			return s8
		end

		local t26 = {}
		local t27 = {}
		local v171 = render.screen_size()
		local v172 = ui.create("Windows"):visibility(false)
		local u173 = nil
		local u174 = nil
		local t28 = {
			mouse_pos = vector(),
			mouse_pos_prev = vector(),
			mouse_down = false,
			mouse_clicked = false,
			mouse_down_duration = 0,
			mouse_delta = vector(),
			mouse_clicked_pos = vector()
		}

		function t28.update_mouse_inputs()
			-- upvalues: t28 (copy)
			local frametime = globals.frametime
			local v722 = ui.get_mouse_position()
			local v723 = common.is_button_down(1)

			t28.mouse_pos_prev = t28.mouse_pos
			t28.mouse_pos = v722
			t28.mouse_delta = t28.mouse_pos - t28.mouse_pos_prev
			t28.mouse_down = v723
			t28.mouse_clicked = v723 and not (t28.mouse_down_duration >= 0)

			local v724 = t28
			local g725 = nil
			local g727 = nil
			local n14 = nil

			repeat
				if g725 or not v723 then
					g725 = false
					n14 = -1
					g727 = true
				end

				if g727 then
					break
				end

				if not (t28.mouse_down_duration < 0) then
					n14 = t28.mouse_down_duration + frametime

					if not n14 then
						g725 = true
					end
				else
					n14 = 0
				end
			until not g725

			g727 = false
			v724.mouse_down_duration = n14

			if t28.mouse_clicked then
				t28.mouse_clicked_pos = t28.mouse_pos
			end
		end

		local t29 = {}

		t29.__index = t29

		function t29.__new(p132, p133)
			local t30 = {
				name = p133,
				item = {},
				is_dragged = false,
				is_hovered = false,
				pos = vector(),
				size = vector()
			}

			return setmetatable(t30, p132)
		end
		function t29.get_pos(p134)
			return p134.pos
		end
		function t29.set_pos(p135, p136)
			-- upvalues: v171 (copy)
			local v734 = p136:clone()

			v734.x = math.clamp(v734.x, 0, v171.x - p135.size.x)
			v734.y = math.clamp(v734.y, 0, v171.y - p135.size.y)

			if v734 ~= p135.pos then
				p135.item.x:set(v734.x + p135.size.x)
				p135.item.y:set(v734.y + p135.size.y)
			end

			p135.pos = v734

			return p135
		end
		function t29.get_size(p137)
			return p137.size
		end
		function t29.set_size(p138, p139)
			p138.size = p139
			p138:set_pos(p138.pos)

			return p138
		end
		function t29.build(p140, p141)
			-- upvalues: v172 (copy), v171 (copy), t5 (ref), t27 (copy)
			p140.item = {
				x = v172:slider(p140.name .. ":x", 0, v171.x, p141.x),
				y = v172:slider(p140.name .. ":y", 0, v171.y, p141.y)
			}
			p140.pos = vector(p140.item.x:get(), p140.item.y:get())
			t5.add_root("windows." .. p140.name, p140.item)
			table.insert(t27, p140)

			return p140
		end

		local function v177(p142, p143, p144)
			return p142.x >= p143.x and (p142.x <= p144.x and (p142.y >= p143.y and not (p142.y > p144.y)))
		end
		local function v178()
			-- upvalues: t27 (copy), v177 (copy), t28 (copy), u173 (ref)
			local v743 = nil

			if ui.get_alpha() > 0 then
				for i = 1, #t27 do
					local v745 = t27[i]
					local pos = v745.pos
					local size = v745.size

					if v177(t28.mouse_pos, pos, pos + size) then
						v743 = v745
					end
				end
			end

			u173 = v743
		end
		local function v179()
			-- upvalues: t28 (copy), u174 (ref), u173 (ref)
			if t28.mouse_down then
				if t28.mouse_clicked and u173 ~= nil then
					u174 = u173
				end

				return
			end

			u174 = nil
		end
		local function v180()
			-- upvalues: t27 (copy)
			for i = 1, #t27 do
				local v749 = t27[i]

				v749.is_dragged = false
				v749.is_hovered = false
			end
		end
		local function v181()
			-- upvalues: u173 (ref)
			if u173 ~= nil then
				u173.is_hovered = true

				return
			end
		end
		local function v182()
			-- upvalues: u174 (ref), t28 (copy)
			if u174 ~= nil then
				local v750 = u174.pos + t28.mouse_delta

				u174:set_pos(v750)
				u174.is_dragged = true

				return
			end
		end

		function t26.new(p145, p146)
			-- upvalues: t29 (copy)
			return t29:__new(p145, p146)
		end

		events.render(function()
			-- upvalues: t28 (copy), v178 (copy), v179 (copy), v180 (copy), v181 (copy), v182 (copy)
			t28.update_mouse_inputs()
			v178()
			v179()
			v180()
			v181()
			v182()
		end)
		events.createmove(function(p147)
			-- upvalues: u174 (ref), u173 (ref)
			if u174 ~= nil or u173 ~= nil then
				p147.in_attack = false
				p147.in_attack2 = false

				return
			end
		end)

		local sidebar = t6.settings.sidebar
		local u184 = nil
		local u185 = nil
		local v186 = pui.sidebar(sidebar.text:get(), t1.get(sidebar.icon:get()))
		local t31 = {
			color(255, 0, 0, 255),
			color(255, 127, 0, 255),
			color(255, 255, 0, 255),
			color(0, 255, 0, 255),
			color(0, 0, 255, 255),
			color(75, 0, 130, 255),
			color(148, 0, 211, 255)
		}

		events.render(function()
			-- upvalues: sidebar (copy), t1 (ref), s1 (copy), t22 (ref), t31 (copy), u184 (ref), u185 (ref), v186 (copy), pui (copy)
			local v754 = sidebar.text:get() or ""
			local v755 = t1.get(sidebar.icon:get()) or ""

			if v754 == "" then
				v754 = s1
			end

			if sidebar.gradient:get() then
				local v756 = -(globals.realtime * (sidebar.speed:get() / 25))

				if not sidebar.rainbow:get() then
					v754 = t22.gradient(v754, v756, sidebar.col_a:get(), sidebar.col_b:get())
				else
					local v757 = table.unpack or unpack

					v754 = t22.gradient(v754, v756, v757(t31))
				end
			end

			if v754 ~= u184 or v755 ~= u185 then
				if v186 == nil or v186.set == nil then
					pui.sidebar(v754, v755)
				else
					v186:set(v754, v755)
				end

				u184 = v754
				u185 = v755

				return
			end
		end)

		local damage_indicator = t6.other.visuals.damage_indicator
		local t32 = {
			Default = 1,
			Bold = 4,
			Console = 3,
			Small = 2
		}
		local n15 = 4
		local n16 = 4
		local n17 = 0
		local v193 = render.screen_size()
		local v194 = t26.new("damage_indicator"):build(v193 * 0.5)
		local min_damage = t3.rage.min_damage

		local function v196(p148, p149, p150)
			return p148 + ((p149 and 1 or 0) - p148) * math.clamp(p150, 0, 1)
		end
		local function v197()
			-- upvalues: min_damage (copy), v194 (copy), n17 (ref), v196 (copy), damage_indicator (copy), t32 (copy), n15 (copy), n16 (copy)
			local v761 = entity.get_local_player()

			if v761 ~= nil and v761:is_alive() then
				if min_damage ~= nil then
					local v762 = v194:get_pos():clone()
					local v763 = not (ui.get_alpha() <= 0.5)

					n17 = v196(n17, v763, 0.05)

					local v764 = min_damage:get()
					local v765 = damage_indicator.font:get()
					local v766 = damage_indicator.color:get()
					local str = tostring(v764)
					local v768 = t32[v765]
					local v769 = render.measure_text(v768, nil, str) + vector(n15, n16) * 2

					render.text(v768, v762 + v769 * 0.5, v766, "c", str)
					render.rect_outline(v762, v762 + v769, color(255, 255, 255, 255 * n17), 1, 4)
					v194:set_size(v769)

					return
				end

				return
			end
		end

		damage_indicator.enabled:set_callback(function(p151)
			-- upvalues: v197 (copy)
			events.render(v197, p151:get())
		end, true)

		local watermark = t6.settings.watermark
		local t33 = {
			Default = 1,
			Bold = 4,
			Console = 3,
			Small = 2
		}
		local t34 = {
			color(255, 0, 0, 255),
			color(255, 127, 0, 255),
			color(255, 255, 0, 255),
			color(0, 255, 0, 255),
			color(0, 0, 255, 255),
			color(75, 0, 130, 255),
			color(148, 0, 211, 255)
		}
		local n18 = 4
		local n19 = 4
		local v203 = render.screen_size()
		local v204 = t26.new("watermark"):build(vector(8, v203.y * 0.5))

		events.render(function()
			-- upvalues: v204 (copy), watermark (copy), t33 (copy), s1 (copy), t22 (ref), t34 (copy), n18 (copy), n19 (copy)
			local v771 = v204:get_pos():clone()
			local v772 = t33[watermark.font:get()]
			local v773 = watermark.text:get()

			if #v773 == 0 then
				v773 = s1
			end

			local v774 = watermark.col_a:get()
			local v775 = watermark.col_b:get()

			if not watermark.effects:get("Matrix") then
				if watermark.effects:get("Matrix 2") then
					v773 = t22.matrix2(v773)
				end
			else
				v773 = t22.matrix(v773)
			end

			if watermark.effects:get("Gradient") then
				local v776 = -(globals.realtime * 1.5)

				if not watermark.rainbow:get() then
					v773 = t22.gradient(v773, v776, v774, v775)
				else
					local v777 = table.unpack or unpack

					v773 = t22.gradient(v773, v776, v777(t34))
				end
			end

			if watermark.effects:get("Pulse") then
				local v778 = globals.realtime * 3
				local v779 = math.sin(v778) * 0.5 + 0.5

				v774.a = v774.a * v779
			end

			if v772 == 2 then
				v773 = string.upper(v773)
			end

			local v780 = render.measure_text(v772, nil, v773) + vector(n18, n19) * 2

			render.text(v772, v771 + vector(n18, n19), v774, nil, v773)
			v204:set_size(v780)
		end)
		skeet_indicators = t6.other.visuals.skeet_indicators

		local v206 = vector(24, 22, 0)

		v207 = render.load_font("Calibri", v206, "ab")
	end

	local n20 = 520
	local n21 = 8
	local n22 = 24
	local n23 = 4
	local n24 = 3
	local v213 = vector(30, 30)
	local u214 = nil

	pcall(function()
		-- upvalues: u214 (ref), v213 (copy)
		u214 = render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg", v213)
	end)

	local v215 = color(0, 0, 0, 50)
	local v216 = color(0, 0, 0, 0)
	local t35 = {}
	local t36 = {}
	local t37 = {}
	local t38 = nil
	local t39 = nil

	local function v222(p152, p153)
		return color(p152.r, p152.g, p152.b, math.floor(p152.a * p153))
	end
	local function v223(p154, p155, p156)
		local v786 = p155 and 1 or 0

		if type(p155) == "number" then
			v786 = p155
		end

		return p154 + (v786 - p154) * p156
	end
	local function v224(p157, p158)
		-- upvalues: skeet_indicators (copy), t35 (copy), v223 (copy)
		local v789 = p158 == true

		if skeet_indicators.animated:get() then
			local v790 = t35[p157] or 0
			local v791 = v223(v790, v789, 0.08)

			t35[p157] = v791

			return v791
		end

		t35[p157] = v789 and 1 or 0

		return t35[p157]
	end
	local function v225(p159, p160, p161, p162, p163, p164)
		-- upvalues: t36 (copy), t39 (ref), v224 (copy), t38 (ref)
		if not p160 then
			if t36[p159] ~= nil then
				if not p161 then
					p161 = t36[p159].col
				end

				if not p162 then
					p162 = t36[p159].text
				end

				if not p163 then
					p163 = t36[p159].progress
				end

				if not p164 then
					p164 = t36[p159].icon
				end
			end
		else
			t36[p159] = {
				col = p161,
				text = p162,
				progress = p163,
				icon = p164
			}
		end

		if p161 ~= nil and p162 ~= nil then
			if p160 and t39 ~= nil then
				t39[p159] = true
			end

			local v798 = v224(p159, p160)

			if t38 ~= nil and v798 > 0.01 then
				t38[#t38 + 1] = {
					key = p159,
					anim = v798,
					col = p161,
					text = p162,
					progress = p163,
					icon = p164
				}
			end

			return
		end
	end
	local function v226(p165)
		-- upvalues: t39 (ref), v225 (copy)
		if t39 == nil or not t39[p165] then
			v225(p165, false)

			return
		end
	end
	local function v227(p166)
		if p166 ~= nil then
			if p166.get_override ~= nil then
				local v801 = p166:get_override()

				if v801 ~= nil then
					return v801
				end
			end

			return p166:get()
		end

		return nil
	end
	local function v228(p167)
		local v803 = ui.get_binds(true)

		for i = 1, #v803 do
			local v805 = v803[i]
			local value = v805.value
			local reference = v805.reference

			if value == reference:get() and reference:id() == p167:id() then
				return true
			end
		end

		return false
	end
	local function v229()
		local v808 = rawget(_G, "utils")

		if v808 == nil or v808.net_channel == nil then
			return nil
		end

		return v808.net_channel()
	end
	local function v230(p168, p169)
		local n25 = 0.5

		if p169 > 0 then
			local v812 = p168 * 0.5

			if p169 < (p168 - v812) * n25 then
				v812 = p168 - p169 * (1 / n25)
			end

			p168 = v812
		end

		return p168
	end
	local function v231(p170, p171)
		-- upvalues: v230 (copy)
		local n26 = 500
		local v816 = n26 * 3.5
		local v817 = (p171:get_origin() - p170:get_origin()):length()
		local v818 = v816 / 3
		local v819 = n26 * math.exp(-v817 * v817 / (2 * v818 * v818)) * 1

		return v230(v819, p170.m_ArmorValue)
	end
	local function v232(p172, p173, p174, p175, p176, p177, p178)
		-- upvalues: skeet_indicators (copy), t37 (copy), v223 (copy), n22 (copy), n23 (copy), v207 (copy), v213 (copy), v222 (copy), v216 (copy), v215 (copy), v9 (copy), n21 (copy)
		if not p178 then
			p178 = 1
		end

		if not (p178 <= 0.01) then
			local n27 = 18
			local v828 = p172:clone()

			if not skeet_indicators.animated:get() then
				t37[p173] = p172.y
			else
				local v829 = t37[p173]

				if v829 == nil then
					v829 = p172.y
				end

				local v830 = v223(v829, p172.y, 0.08)

				t37[p173] = v830
				v828.y = v830
			end

			local v831 = v828 + vector(0, n27)

			if skeet_indicators.animated:get() then
				v831 = v831 + vector(0, (1 - p178) * n27)
			end

			local v832 = v831 + vector(n22, n23)
			local v833 = render.measure_text(v207, nil, p175)

			v833.y = v833.y + n23 * 2

			local v834 = v833 + vector(50, 2)

			v832.y = v832.y + 3

			if p176 then
				v834.x = v834.x + 30
			end

			if p177 then
				v834.x = v834.x + v213.x + 2
			end

			local v835 = v831 + v834
			local v836 = (v831 + v835) * 0.5

			render.gradient(v831, vector(v836.x, v835.y), v222(v216, p178), v222(v215, p178), v222(v216, p178), v222(v215, p178))
			render.gradient(v835, vector(v836.x, v831.y), v222(v216, p178), v222(v215, p178), v222(v216, p178), v222(v215, p178))

			if p177 then
				local v837 = v831:clone()

				v837.x = v837.x + n22
				v837.y = v837.y + (v834.y - v213.y) * 0.5
				render.texture(p177, v837, v213, v222(p174, p178), "f")
				v832.x = v832.x + v213.x + 6
			end

			render.text(v207, v832 + 1, color(0, 0, 0, math.floor(128 * p178)), nil, p175)
			render.text(v207, v832, v222(p174, p178), nil, p175)
			v832.x = v832.x + v833.x

			if p176 then
				local n28 = 10
				local n29 = 5
				local v840 = color(255, 255, 255, 200)
				local v841 = vector(v832.x + n28 * 0.5 + 12, v831.y + v834.y * 0.5)

				render.circle_outline(v841, color(0, 0, 0, math.floor(255 * p178)), n28, 0, 1, n29)
				render.circle_outline(v841, v222(v840, p178), n28 - 1, 0, p176, n29 - 2)
			end

			p172.y = p172.y - v9(v834.y + n21)

			return
		end
	end
	local function v233(_, p180, p181)
		-- upvalues: v225 (copy), u214 (ref)
		local v845 = p180:get_player_weapon()

		if v845 ~= nil then
			if v845.m_bStartedArming then
				local m_fArmedTime = v845.m_fArmedTime

				if m_fArmedTime ~= nil then
					local v847 = p180:get_origin()
					local m_bombsiteCenterA = p181.m_bombsiteCenterA
					local m_bombsiteCenterB = p181.m_bombsiteCenterB
					local v850 = v847:distsqr(m_bombsiteCenterA) < v847:distsqr(m_bombsiteCenterB) and "A" or "B"
					local v851 = (m_fArmedTime - globals.curtime) / 3

					v225("C4_PLANT", true, color(252, 243, 105, 255), v850, 1 - v851, u214)

					return
				end

				return
			end

			return
		end
	end
	local function v234(_, p183, p184)
		-- upvalues: v225 (copy), u214 (ref), v231 (copy)
		local m_bBombDefused = p184.m_bBombDefused

		if p184.m_bBombTicking and not m_bBombDefused then
			local curtime = globals.curtime
			local m_flC4Blow = p184.m_flC4Blow
			local v858 = m_flC4Blow - curtime

			if v858 > 0 then
				if p184.m_hBombDefuser ~= nil then
					local v859 = render.screen_size()
					local m_flDefuseCountDown = p184.m_flDefuseCountDown
					local v861 = (m_flDefuseCountDown - curtime) / 10
					local v862 = m_flC4Blow < m_flDefuseCountDown and color(235, 50, 75, 125) or color(50, 235, 75, 125)
					local v863 = (v859.y - 2) * v861

					render.rect(vector(0, 0), vector(20, v859.y), color(0, 0, 0, 115))
					render.rect(vector(1, 1 + v863), vector(19, v859.y - 1), v862)
				end

				local v864 = string.format("%s - %.1fs", p184.m_nBombSite == 1 and "B" or "A", v858)

				v225("C4_TIMER", true, color(255, 255, 255, 200), v864, nil, u214)
			end

			local m_iHealth = p183.m_iHealth
			local v866 = v231(p183, p184)
			local v867 = math.floor(v866)

			if not (m_iHealth <= v867) then
				if v867 > 0 then
					v225("C4_DAMAGE", true, color(252, 243, 105, 255), string.format("-%d HP", v867))
				end
			else
				v225("C4_FATAL", true, color(255, 0, 50, 255), "FATAL")
			end

			return
		end
	end
	local function v235(p185, p186)
		-- upvalues: v233 (copy), v234 (copy)
		local v870 = entity.get_game_rules()

		if v870 ~= nil then
			local v871 = entity.get_player_resource()

			if v871 ~= nil then
				local m_bBombPlanted = v870.m_bBombPlanted
				local m_iPlayerC4 = v871.m_iPlayerC4

				if m_iPlayerC4 ~= nil and m_iPlayerC4 ~= 0 then
					local v874 = entity.get(m_iPlayerC4)

					if v874 ~= nil then
						v233(p185, v874, v871)
					end
				end

				if m_bBombPlanted then
					local v875 = entity.get_entities("CPlantedC4")[1]

					if v875 ~= nil then
						v234(p185, p186, v875)
					end
				end

				return
			end

			return
		end
	end
	local function v236(p187, p188)
		-- upvalues: skeet_indicators (copy)
		if not p188 then
			return p187
		end

		return skeet_indicators[p187]:get()
	end
	local function v237()
		-- upvalues: n24 (copy), n20 (copy), skeet_indicators (copy), t38 (ref), t39 (ref), v236 (copy), v227 (copy), t3 (copy), v229 (copy), v225 (copy), v228 (copy), v235 (copy), v226 (copy), v232 (copy)
		local v878 = entity.get_local_player()

		if v878 ~= nil then
			local v879 = render.screen_size()
			local v880 = vector(n24, v879.y - (v879.y - n20) * 0.5)
			local v881 = skeet_indicators.customize:get()

			t38 = {}
			t39 = {}

			local v882 = v878:is_alive()
			local s9 = "PING"

			if skeet_indicators.items:get(s9) then
				local v884 = v236(s9, v881)
				local n30

				if not v882 then
					n30 = 0
				else
					n30 = v227(t3.misc.fake_latency) or 0
				end

				local v886 = false
				local v887 = color(255, 255, 255, 200)

				if n30 > 0 then
					local v888 = v229()

					if v888 ~= nil and v888.latency ~= nil and v888.avg_latency ~= nil then
						local v889 = math.clamp(v888.latency[0] + v888.latency[1], 0.001, 0.2)
						local v890 = math.clamp(n30 * 0.001 + v888.avg_latency[1], 0.001, 0.2)
						local v891 = math.clamp(v889 / v890, 0, 1)

						if not (v891 < 0.5) then
							v887 = color(213, 197, 84, 255):lerp(color(143, 194, 21, 255), (v891 - 0.5) * 2)
						else
							v887 = color(200, 200, 200, 255):lerp(color(213, 197, 84, 255), v891 * 2)
						end

						v886 = true
					end
				end

				v225(s9, v886, v887, v884)
			end

			local s10 = "DT"

			if skeet_indicators.items:get(s10) then
				local v893 = v236(s10, v881)
				local v894 = v882 and (v227(t3.rage.double_tap) and not v227(t3.aa.misc.fake_duck))
				local v895 = color(255, 0, 50, 255)

				if v894 and rage.exploit:get() == 1 then
					v895 = color(255, 255, 255, 200)
				end

				v225(s10, v894, v895, v893)
			end

			local s11 = "OSAA"

			if skeet_indicators.items:get(s11) then
				local v897 = v236(s11, v881)
				local v898 = v882 and (v227(t3.rage.hide_shots) and (not v227(t3.rage.double_tap) and not v227(t3.aa.misc.fake_duck)))

				v225(s11, v898, color(255, 255, 255, 200), v897)
			end

			local s12 = "DUCK"

			if skeet_indicators.items:get(s12) then
				local v900 = v236(s12, v881)
				local v901 = v882 and v227(t3.aa.misc.fake_duck)

				v225(s12, v901, color(255, 255, 255, 200), v900)
			end

			local s13 = "DA"

			if skeet_indicators.items:get(s13) then
				local v903 = v882 and v227(t3.rage.dormant_aimbot)
				local v904 = color(255, 0, 50, 255)

				if v903 and #entity.get_players(true, false) == 0 then
					v904 = color(255, 255, 255, 200)
				end

				v225(s13, v903, v904, "DA")
			end

			local s14 = "SAFE"

			if skeet_indicators.items:get(s14) then
				local v906 = v236(s14, v881)
				local v907 = v882 and v227(t3.rage.safe_points) == "Force"

				v225(s14, v907, color(255, 255, 255, 200), v906)
			end

			local s15 = "BODY"

			if skeet_indicators.items:get(s15) then
				local v909 = v236(s15, v881)
				local v910 = v882 and v227(t3.rage.body_aim) == "Force"

				v225(s15, v910, color(255, 255, 255, 200), v909)
			end

			local s16 = "MD"

			if skeet_indicators.items:get(s16) then
				local v912 = v236(s16, v881)
				local v913 = v882 and v228(t3.rage.min_damage)

				v225(s16, v913, color(255, 255, 255, 200), v912)
			end

			local s17 = "HC"

			if skeet_indicators.items:get(s17) then
				local v915 = v236(s17, v881)
				local v916 = v882 and v228(t3.rage.hit_chance)

				v225(s17, v916, color(255, 255, 255, 200), v915)
			end

			local s18 = "FS"

			if skeet_indicators.items:get(s18) then
				local v918 = v236(s18, v881)
				local v919 = v882 and v227(t3.aa.angles.freestanding)

				v225(s18, v919, color(255, 255, 255, 200), v918)
			end

			if skeet_indicators.items:get("C4") then
				v235(v880, v878)
				v226("C4_PLANT")
				v226("C4_TIMER")
				v226("C4_FATAL")
				v226("C4_DAMAGE")
			end

			for i = 1, #t38 do
				local v921 = t38[i]

				v232(v880, v921.key, v921.col, v921.text, v921.progress, v921.icon, v921.anim)
			end

			t38 = nil
			t39 = nil

			return
		end
	end

	skeet_indicators.enabled:set_callback(function(p189)
		-- upvalues: v237 (copy)
		events.render(v237, p189:get())
	end, true)

	local scope_overlay = t6.other.visuals.scope_overlay
	local n31 = 0

	local function v240(p190, p191, p192)
		return p190 + ((p191 and 1 or 0) - p190) * math.clamp(p192, 0, 1)
	end
	local function v241(p193)
		-- upvalues: t3 (copy)
		if t3.visuals.scope_overlay ~= nil then
			if p193 ~= nil then
				t3.visuals.scope_overlay:override(p193)
			else
				t3.visuals.scope_overlay:override()
			end
		end
	end
	local function v242()
		-- upvalues: n31 (ref), v240 (copy), v241 (copy), scope_overlay (copy)
		local v927 = entity.get_local_player()

		if v927 ~= nil and v927:is_alive() then
			local v928 = v927:get_player_weapon()

			if v928 ~= nil then
				n31 = v240(n31, v927.m_bIsScoped, 0.05)

				if not (n31 <= 0.01) then
					v241("Remove All")

					local v929 = render.screen_size() * 0.5
					local v930 = scope_overlay.size:get() * n31
					local v931 = scope_overlay.gap:get()
					local v932 = scope_overlay.color:get()

					if scope_overlay.additions:get("Spread Dependency") then
						v931 = v931 + v928:get_inaccuracy() * 100
					end

					local v933 = v932:clone()
					local v934 = v932:clone()

					if not scope_overlay.additions:get("Inverted") then
						v933.a = 0
						v934.a = v934.a * n31
					else
						v933.a = v933.a * n31
						v934.a = 0
					end

					local n32 = 0

					if scope_overlay.additions:get("Rotated") then
						n32 = 45
					end

					if scope_overlay.additions:get("Animated") then
						n32 = -(globals.realtime * 100 % 180 - 360)
					end

					if n32 ~= 0 then
						render.push_rotation(n32)
					end

					if not scope_overlay.exclude_lines:get("Top") then
						local v936 = vector(v929.x, v929.y - (v930 + v931))
						local v937 = vector(v936.x + 1, v929.y - v931)

						render.gradient(v936, v937, v933, v933, v934, v934)
					end

					if not scope_overlay.exclude_lines:get("Bottom") then
						local v938 = vector(v929.x, v929.y + v930 + v931)
						local v939 = vector(v938.x + 1, v929.y + v931)

						render.gradient(v938, v939, v933, v933, v934, v934)
					end

					if not scope_overlay.exclude_lines:get("Left") then
						local v940 = vector(v929.x - (v930 + v931), v929.y)
						local v941 = vector(v929.x - v931, v929.y + 1)

						render.gradient(v940, v941, v933, v934, v933, v934)
					end

					if not scope_overlay.exclude_lines:get("Right") then
						local v942 = vector(v929.x + v930 + v931, v929.y)
						local v943 = vector(v929.x + v931, v929.y + 1)

						render.gradient(v942, v943, v933, v934, v933, v934)
					end

					if n32 ~= 0 then
						render.pop_rotation()
					end

					return
				end

				return
			end

			n31 = v240(n31, false, 0.05)

			return
		end

		n31 = v240(n31, false, 0.05)
	end

	scope_overlay.enabled:set_callback(function(p194)
		-- upvalues: n31 (ref), v241 (copy), v242 (copy)
		local v945 = p194:get()

		if not v945 then
			n31 = 0
			v241()
		end

		events.render(v242, v945)
	end, true)
	events.shutdown(function()
		-- upvalues: v241 (copy)
		v241()
	end)

	local model_changer = t6.other.visuals.model_changer

	t40 = {
		initialized = false,
		precached = {}
	}
	ffi.cdef("        typedef struct {\n            void* fnHandle;\n            char szName[260];\n            int nLoadFlags;\n            int nServerCount;\n            int type;\n            int flags;\n            float vecMins[3];\n            float vecMaxs[3];\n            float radius;\n            char pad[0x1C];\n        } model_t;\n\n        typedef int(__thiscall* get_model_index_t)(void*, const char*);\n        typedef const model_t*(__thiscall* find_or_load_model_t)(void*, const char*);\n        typedef int(__thiscall* add_string_t)(void*, bool, const char*, int, const void*);\n        typedef void*(__thiscall* find_table_t)(void*, const char*);\n        typedef void(__thiscall* set_model_index_t)(void*, int);\n        typedef void*(__thiscall* get_client_entity_t)(void*, int);\n    ")

	local v245 = ffi.typeof("void***")

	local function v246(p195, p196)
		local ok, result = pcall(utils.create_interface, p195, p196)

		if not ok then
			return
		end

		return result
	end
	local function v247()
		-- upvalues: t40 (ref), v246 (copy), ffi (copy), v245 (copy)
		if not t40.initialized then
			local v950 = v246("client_panorama.dll", "VClientEntityList003") or v246("client.dll", "VClientEntityList003")
			local v951 = v246("engine.dll", "VModelInfoClient004")
			local v952 = v246("engine.dll", "VEngineClientStringTable001")

			if v950 ~= nil and v951 ~= nil and v952 ~= nil then
				t40.entity_list = ffi.cast(v245, v950)
				t40.model_info = ffi.cast(v245, v951)
				t40.string_table = ffi.cast(v245, v952)
				t40.get_client_entity = ffi.cast("get_client_entity_t", t40.entity_list[0][3])
				t40.get_model_index = ffi.cast("get_model_index_t", t40.model_info[0][2])
				t40.find_or_load_model = ffi.cast("find_or_load_model_t", t40.model_info[0][39])
				t40.find_table = ffi.cast("find_table_t", t40.string_table[0][3])
				t40.initialized = t40.get_client_entity ~= nil and (t40.get_model_index ~= nil and (t40.find_or_load_model ~= nil and t40.find_table ~= nil))

				return t40.initialized
			end

			return false
		end

		return true
	end
	local function v248(p197)
		-- upvalues: t40 (ref), v247 (copy), ffi (copy), v245 (copy)
		if not t40.precached[p197] then
			if v247() then
				local v954 = t40.find_table(t40.string_table, "modelprecache")

				if v954 ~= nil then
					local v955 = ffi.cast(v245, v954)

					if v955 ~= nil then
						local v956 = ffi.cast("add_string_t", v955[0][8])

						if v956 ~= nil then
							t40.find_or_load_model(t40.model_info, p197)

							if v956(v955, false, p197, -1, nil) ~= -1 then
								t40.precached[p197] = true

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

		return true
	end
	local function v249(p198, p199)
		-- upvalues: v247 (copy), t40 (ref), ffi (copy), v245 (copy)
		if v247() then
			local v959 = t40.get_client_entity(t40.entity_list, p198)

			if v959 ~= nil then
				local v960 = ffi.cast(v245, v959)
				local v961 = ffi.cast("set_model_index_t", v960[0][75])

				if v961 ~= nil then
					v961(v960, p199)
				end

				return
			end

			return
		end
	end
	local function v250(p200)
		-- upvalues: model_changer (copy), t4 (ref)
		local m_iTeamNum = p200.m_iTeamNum
		local v964 = nil

		if m_iTeamNum ~= 2 then
			if m_iTeamNum == 3 then
				v964 = model_changer.ct_model:get()
			end
		else
			v964 = model_changer.t_model:get()
		end

		if v964 ~= nil and v964 ~= "Disabled" then
			local v965 = t4.by_name[v964]

			return v965 and v965.path or nil
		end

		return nil
	end
	local function v251()
		-- upvalues: model_changer (copy), v250 (copy), v248 (copy), t40 (ref), v249 (copy)
		if model_changer.enabled:get() then
			local v966 = entity.get_local_player()

			if v966 ~= nil and v966:is_alive() then
				local v967 = v250(v966)

				if v967 ~= nil and not (#v967 <= 5) then
					if v248(v967) then
						local v968 = t40.get_model_index(t40.model_info, v967)

						if v968 ~= nil and v968 ~= -1 and v968 ~= v966.m_nModelIndex then
							v966.m_nModelIndex = v968
							v249(v966:get_index(), v968)
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

	events.pre_render(v251)
	events.net_update_end(v251)

	local aspect_ratio = t6.other.misc.aspect_ratio
	local r_aspectratio = cvar.r_aspectratio
	local v254 = tonumber(r_aspectratio:string()) or 0

	local function v255()
		-- upvalues: r_aspectratio (copy), v254 (copy)
		r_aspectratio:float(v254, true)
	end
	local function v256()
		-- upvalues: aspect_ratio (copy), r_aspectratio (copy), v255 (copy)
		if not aspect_ratio.enabled:get() then
			v255()
		else
			r_aspectratio:float(aspect_ratio.proportion:get() * 0.01, true)
		end
	end

	aspect_ratio.enabled:set_callback(v256, true)
	aspect_ratio.proportion:set_callback(v256, true)
	events.shutdown(v255)
end

local viewmodel_fov = cvar.viewmodel_fov
local viewmodel_offset_x = cvar.viewmodel_offset_x
local viewmodel_offset_y = cvar.viewmodel_offset_y
local viewmodel_offset_z = cvar.viewmodel_offset_z

local function v261(p201)
	return tonumber(p201:string())
end
local function v262()
	-- upvalues: viewmodel_fov (copy), v261 (copy), viewmodel_offset_x (copy), viewmodel_offset_y (copy), viewmodel_offset_z (copy)
	viewmodel_fov:float(v261(viewmodel_fov), true)
	viewmodel_offset_x:float(v261(viewmodel_offset_x), true)
	viewmodel_offset_y:float(v261(viewmodel_offset_y), true)
	viewmodel_offset_z:float(v261(viewmodel_offset_z), true)
end
local function v263(p202)
	-- upvalues: viewmodel_fov (copy)
	viewmodel_fov:float(p202:get(), true)
end
local function v264(p203)
	-- upvalues: viewmodel_offset_x (copy)
	viewmodel_offset_x:float(p203:get() * 0.1, true)
end
local function v265(p204)
	-- upvalues: viewmodel_offset_y (copy)
	viewmodel_offset_y:float(p204:get() * 0.1, true)
end
local function v266(p205)
	-- upvalues: viewmodel_offset_z (copy)
	viewmodel_offset_z:float(p205:get() * 0.1, true)
end
local function v267()
	-- upvalues: v262 (copy)
	v262()
end

t6.other.misc.view_model.enabled:set_callback(function(_)
	-- upvalues: t6 (ref), v263 (copy), v264 (copy), v265 (copy), v266 (copy), v262 (copy), v267 (copy)
	local v975 = t6.other.misc.view_model.enabled:get()

	if not v975 then
		t6.other.misc.view_model.fov:unset_callback(v263)
		t6.other.misc.view_model.x:unset_callback(v264)
		t6.other.misc.view_model.y:unset_callback(v265)
		t6.other.misc.view_model.z:unset_callback(v266)
	else
		t6.other.misc.view_model.fov:set_callback(v263, true)
		t6.other.misc.view_model.x:set_callback(v264, true)
		t6.other.misc.view_model.y:set_callback(v265, true)
		t6.other.misc.view_model.z:set_callback(v266, true)
	end

	if not v975 then
		v262()
	end

	events.shutdown(v267, v975)
end, true)

local t41 = {
	unlock_fake_latency = {}
}
local unlock_fake_latency = t6.other.ragebot.unlock_fake_latency
local sv_maxunlag = cvar.sv_maxunlag

local function v271()
	-- upvalues: sv_maxunlag (copy)
	if sv_maxunlag ~= nil then
		sv_maxunlag:float(tonumber(sv_maxunlag:string()), true)
	end
end
local function v272()
	-- upvalues: sv_maxunlag (copy)
	if sv_maxunlag ~= nil then
		sv_maxunlag:float(0.4, true)
	end
end
local function v273()
	-- upvalues: v271 (copy)
	v271()
end

unlock_fake_latency:set_callback(function(p207)
	-- upvalues: v272 (copy), v271 (copy), v273 (copy)
	local v977 = p207:get()

	if not v977 then
		v271()
	else
		v272()
	end

	events.shutdown(v273, v977)
end, true)
t41.ai_peek = {}

local ai_peek = t6.other.ragebot.ai_peek
local t42 = {
	last_target_index = -1,
	last_shots_fired = 0,
	attack_window_until = 0,
	hold_until = 0,
	peek_started = false,
	return_until = 0,
	returning = false,
	stuck_ticks = 0,
	peek_side = "",
	peek_damage = 0,
	last_distance = math.huge
}

local function v276(p208, p209)
	if math.atan2 == nil then
		if not (p209 > 0) then
			if not (p209 < 0) or not (p208 >= 0) then
				if not (p209 < 0) then
					if not (p208 > 0) then
						if not (p208 < 0) then
							return 0
						end

						return -math.pi * 0.5
					end

					return math.pi * 0.5
				end

				return math.atan(p208 / p209) - math.pi
			end

			return math.atan(p208 / p209) + math.pi
		end

		return math.atan(p208 / p209)
	end

	return math.atan2(p208, p209)
end
local function v277(p210)
	if p210 ~= nil then
		local v981 = p210:get()

		if type(v981) ~= "table" then
			return v981 == true
		end

		return v981.active == true or v981.value == true
	end

	return false
end
local function v278()
	-- upvalues: v277 (copy), t3 (copy)
	if not v277(t3.misc.auto_peek) then
		local v982 = ui.get_binds()

		if type(v982) == "table" then
			for _, v in pairs(v982) do
				local name = v.name

				if type(name) == "string" and name:lower():find("peek", 1, true) and v.active then
					return true
				end
			end

			return false
		end

		return false
	end

	return true
end
local function v279(p211, p212, p213)
	if p211 ~= nil then
		local v989

		if p213 == nil then
			v989 = p211:simulate_movement()
		else
			v989 = p211:simulate_movement(p213, p211.m_vecVelocity, p211.m_fFlags)
		end

		if v989 ~= nil then
			v989:think(p212)

			return v989.origin or (p213 or p211:get_origin())
		end

		return p213 or p211:get_origin()
	end

	return nil
end
local function v280(p214, p215, p216)
	-- upvalues: v279 (copy), ai_peek (copy)
	local v993 = p215 and v279(p215, ai_peek.predict_ticks:get())

	if p214 ~= nil and v993 ~= nil then
		local v994 = p214 + vector(0, 0, 64)
		local t43 = {
			[1] = p215:get_hitbox_position(3),
			[2] = p215:get_hitbox_position(2),
			[3] = p215:get_hitbox_position(5),
			[4] = p215:get_hitbox_position(0),
			[5] = v993 + vector(0, 0, 64)
		}
		local n33 = 0
		local v997 = false

		for i = 1, #t43 do
			local v999 = t43[i]

			if v999 ~= nil then
				local v1000 = utils.trace_line(v994, v999, {
					[1] = p216
				})
				local v1001 = v1000 ~= nil and not ((v1000.fraction or 0) <= 0.92)
				local v1002, v1003 = utils.trace_bullet(p216, v994, v999, {
					[1] = p216
				})

				if type(v1002) == "number" and n33 < v1002 and (v1003 == nil or p215 == v1003.entity) then
					n33 = v1002
					v997 = v1001
				end
			end
		end

		return n33, v997
	end

	return 0, false
end
local function v281(p217, p218)
	-- upvalues: v279 (copy), ai_peek (copy), v276 (copy), v280 (copy)
	local v1006 = p217:get_origin()
	local v1007 = v279(p218, ai_peek.predict_ticks:get())

	if v1006 ~= nil and v1007 ~= nil then
		local v1008 = ai_peek.radius:get()
		local v1009 = nil
		local v1010 = -math.huge
		local n34 = 0
		local s19 = ""
		local v1013 = v1007 - v1006
		local v1014 = math.deg(v276(v1013.y, v1013.x))
		local t44 = {
			[1] = {
				[1] = "left",
				[2] = v1014 - 90
			},
			[2] = {
				[1] = "center",
				[2] = v1014
			},
			[3] = {
				[1] = "right",
				[2] = v1014 + 90
			}
		}

		for i = 1, #t44 do
			local v1017 = t44[i][1]
			local v1018 = math.rad(t44[i][2])
			local v1019 = vector(math.cos(v1018), math.sin(v1018), 0)

			for j = 1, 4 do
				local v1021 = v1008 * j / 4
				local v1022 = v1006 + v1019 * v1021
				local v1023 = utils.trace_line(v1006 + vector(0, 0, 34), v1022 + vector(0, 0, 34), {
					[1] = p217
				})

				if v1023 == nil or (v1023.fraction or 0) > 0.82 then
					local v1024, v1025 = v280(v1022, p218, p217)
					local v1026 = v1022:dist2d(v1007)
					local v1027 = v1024 * 1000 + (v1025 and 25000 or 0) - v1026 - v1021 * 0.35

					if v1010 < v1027 then
						v1010 = v1027
						v1009 = v1022
						n34 = v1024
						s19 = v1017
					end
				end
			end
		end

		if not (n34 < ai_peek.min_damage:get()) then
			return v1009, n34, s19
		end

		return nil, 0, ""
	end

	return nil
end
local function v282(p219)
	-- upvalues: v279 (copy), ai_peek (copy)
	local v1029 = entity.get_threat(false)

	if v1029 == nil or (not v1029:is_alive() or not v1029:is_enemy()) then
		local v1030 = p219:get_origin()
		local v1031 = entity.get_players(true, false)
		local v1032 = nil
		local huge = math.huge

		if v1030 ~= nil and type(v1031) == "table" then
			for i = 1, #v1031 do
				local v1035 = v1031[i]

				if v1035 ~= nil and v1035:is_alive() and v1035:is_enemy() then
					local v1036 = v279(v1035, ai_peek.predict_ticks:get())
					local v1037 = v1036 ~= nil and v1030:dist2d(v1036) or math.huge

					if v1037 < huge then
						huge = v1037
						v1032 = v1035
					end
				end
			end

			return v1032
		end

		return nil
	end

	return v1029
end
local function v283(p220, p221, p222)
	-- upvalues: v276 (copy), ai_peek (copy)
	local v1041 = p221:get_origin()

	if v1041 ~= nil and p222 ~= nil then
		local v1042 = p222 - v1041

		if not (v1042:length2d() < 4) then
			local v1043 = p220.view_angles and p220.view_angles.y or (p221.m_angEyeAngles and p221.m_angEyeAngles.y or 0)
			local v1044 = math.deg(v276(v1042.y, v1042.x))
			local v1045 = math.rad(v1044 - v1043)
			local v1046 = math.clamp(4.5 * ai_peek.speed:get(), 0, 450)

			p220.forwardmove = math.cos(v1045) * v1046
			p220.sidemove = -math.sin(v1045) * v1046

			return
		end

		p220.forwardmove = 0
		p220.sidemove = 0

		return
	end
end
local function v284()
	-- upvalues: t42 (copy)
	t42.start_origin = nil
	t42.returning = false
	t42.return_until = 0
	t42.last_distance = math.huge
	t42.stuck_ticks = 0
	t42.peek_started = false
	t42.hold_until = 0
	t42.attack_window_until = 0
	t42.last_shots_fired = 0
	t42.last_target_index = -1
end
local function v285(p223)
	-- upvalues: t42 (copy)
	if t42.peek_started then
		if t42.start_origin == nil and p223 ~= nil then
			t42.start_origin = p223:get_origin()
		end

		if t42.start_origin ~= nil then
			t42.returning = true
			t42.return_until = globals.tickcount + 32
			t42.hold_until = 0
			t42.attack_window_until = 0
			t42.last_distance = math.huge
			t42.stuck_ticks = 0

			if rage.exploit ~= nil then
				rage.exploit:force_teleport()
			end

			return
		end

		return
	end

	t42.last_distance = math.huge
	t42.stuck_ticks = 0
end
local function v286(p224, p225)
	-- upvalues: t42 (copy), v284 (copy), v283 (copy)
	if t42.returning and t42.start_origin ~= nil then
		local v1050 = p225:get_origin()

		if v1050 ~= nil then
			if v1050:dist2d(t42.start_origin) >= 8 and not (globals.tickcount > t42.return_until) then
				t42.peek_origin = t42.start_origin
				t42.peek_side = "return"
				v283(p224, p225, t42.start_origin)

				return true
			end

			v284()
			p224.forwardmove = 0
			p224.sidemove = 0

			return true
		end

		v284()

		return false
	end

	return false
end
local function v287(p226)
	-- upvalues: t42 (copy), ai_peek (copy), v277 (copy), t3 (copy), v284 (copy), v278 (copy), v286 (copy), v282 (copy), v285 (copy), v281 (copy), v283 (copy)
	t42.target = nil
	t42.peek_origin = nil
	t42.peek_damage = 0
	t42.peek_side = ""

	if ai_peek.enabled:get() and v277(t3.rage.double_tap) then
		if not ai_peek.require_auto_peek:get() or v278() then
			local v1052 = entity.get_local_player()

			if v1052 ~= nil and v1052:is_alive() then
				if t42.start_origin == nil then
					t42.start_origin = v1052:get_origin()
				end

				if not v286(p226, v1052) then
					local v1053 = v282(v1052)

					if v1053 ~= nil and v1053:is_alive() and v1053:is_enemy() then
						local v1054, v1055, v1056 = v281(v1052, v1053)

						if v1054 ~= nil then
							local v1057 = v1052:get_origin()

							if v1057 ~= nil then
								local v1058 = v1057:dist2d(v1054)

								if not (v1058 < 6) then
									if not (v1058 >= t42.last_distance - 0.5) then
										t42.stuck_ticks = 0
									else
										t42.stuck_ticks = t42.stuck_ticks + 1
									end

									t42.last_distance = v1058

									if not (t42.stuck_ticks > 12) then
										t42.target = v1053
										t42.peek_origin = v1054
										t42.peek_damage = v1055
										t42.peek_side = v1056
										t42.peek_started = true
										t42.hold_until = 0
										t42.attack_window_until = globals.tickcount + math.max(ai_peek.predict_ticks:get() + 18, 24)
										t42.last_target_index = v1053.get_index ~= nil and v1053:get_index() or -1
										t42.last_shots_fired = v1052.m_iShotsFired or 0
										v283(p226, v1052, v1054)

										return
									end

									v285(v1052)

									return
								end

								t42.target = v1053
								t42.peek_origin = v1054
								t42.peek_damage = v1055
								t42.peek_side = v1056
								t42.peek_started = true
								t42.last_distance = math.huge
								t42.stuck_ticks = 0

								local v1059 = v1053.get_index ~= nil and v1053:get_index() or -1

								if v1059 ~= t42.last_target_index then
									t42.last_target_index = v1059
									t42.last_shots_fired = v1052.m_iShotsFired or 0
									t42.hold_until = globals.tickcount + 10
									t42.attack_window_until = globals.tickcount + 18
								end

								if not ((v1052.m_iShotsFired or 0) > t42.last_shots_fired) then
									if not (globals.tickcount <= t42.hold_until) then
										if globals.tickcount > t42.attack_window_until then
											v285(v1052)
										end

										return
									end

									p226.forwardmove = 0
									p226.sidemove = 0

									return
								end

								v285(v1052)

								return
							end

							v284()

							return
						end

						if not t42.peek_started or not (globals.tickcount > t42.attack_window_until) then
							t42.last_distance = math.huge
							t42.stuck_ticks = 0
						else
							v285(v1052)
						end

						return
					end

					if not t42.peek_started then
						t42.last_distance = math.huge
						t42.stuck_ticks = 0
					else
						v285(v1052)
					end

					return
				end

				return
			end

			v284()

			return
		end

		v284()

		return
	end

	v284()
end
local function v288()
	-- upvalues: ai_peek (copy), t42 (copy)
	if ai_peek.enabled:get() then
		local v1060 = ai_peek.box_color:get()
		local target = t42.target

		if target ~= nil and target:is_alive() then
			local v1062 = target:get_bbox()

			if v1062 ~= nil and (v1062.alpha or 0) > 0 and v1062.x ~= nil and v1062.y ~= nil and v1062.w ~= nil and v1062.h ~= nil then
				render.rect_outline(vector(v1062.x, v1062.y), vector(v1062.x + v1062.w, v1062.y + v1062.h), v1060, 1, 2)

				if t42.peek_damage > 0 then
					render.text(1, vector(v1062.x + v1062.w * 0.5, v1062.y - 12), v1060, "c", string.format("%s / %d", t42.peek_side, math.floor(t42.peek_damage + 0.5)))
				end
			end
		end

		if t42.peek_origin ~= nil then
			local v1063 = render.world_to_screen(t42.peek_origin + vector(0, 0, 4))

			if v1063 ~= nil then
				render.rect(vector(v1063.x - 3, v1063.y - 3), vector(v1063.x + 3, v1063.y + 3), v1060, 2)
			end
		end

		return
	end
end

ai_peek.enabled:set_callback(function(p227)
	-- upvalues: t42 (copy), v284 (copy), v287 (copy), v288 (copy)
	local v1065 = p227:get()

	if not v1065 then
		t42.target = nil
		t42.peek_origin = nil
		t42.peek_damage = 0
		t42.peek_side = ""
		v284()
	end

	events.createmove(v287, v1065)
	events.render(v288, v1065)
end, true)
t41.auto_weapon_switch = {}

local auto_weapon_switch = t6.other.ragebot.auto_weapon_switch
local n35 = 0
local u291 = false
local n36 = 0
local u293 = false
local t45 = {
	Knife = "slot3",
	Taser = "use weapon_taser",
	Primary = "slot1",
	Secondary = "slot2"
}

local function v295()
	-- upvalues: n35 (ref), auto_weapon_switch (copy), t45 (copy)
	if not (globals.realtime < n35) then
		local v1066 = entity.get_local_player()

		if v1066 and v1066:is_alive() then
			local v1067 = t45[auto_weapon_switch.weapons:get()]

			if v1067 ~= nil then
				local v1068 = auto_weapon_switch.delay:get() * 0.001

				n35 = globals.realtime + v1068 + 0.15
				utils.execute_after(v1068, function()
					-- upvalues: v1067 (copy)
					local v1163 = entity.get_local_player()

					if v1163 ~= nil and v1163:is_alive() then
						utils.console_exec(v1067)

						return
					end
				end)

				return true
			end

			return false
		end

		return false
	end

	return false
end
local function v296(p228, p229)
	if p229 ~= nil and p229:is_alive() then
		local v1071 = p228:get_eye_position()
		local v1072 = p229:get_eye_position()

		if v1071 ~= nil and v1072 ~= nil then
			local v1073 = utils.trace_line(v1071, v1072, p228)

			return v1073 ~= nil and (v1073.entity ~= nil and v1073.entity:get_index() == p229:get_index())
		end

		return false
	end

	return false
end
local function v297(p230)
	-- upvalues: auto_weapon_switch (copy), u291 (ref), n36 (ref)
	if auto_weapon_switch.enabled:get() then
		if auto_weapon_switch.triggers:get("Enemy shot") then
			local v1075 = entity.get_local_player()

			if v1075 and v1075:is_alive() then
				local v1076 = entity.get(p230.userid, true)

				if v1076 and v1076:is_enemy() then
					local v1077 = v1075:get_eye_position()

					if (v1077:closest_ray_point(v1076:get_eye_position(), (vector(p230.x, p230.y, p230.z))) - v1077):lengthsqr() < 6400 then
						u291 = true
						n36 = globals.tickcount
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
local function v298(_)
	-- upvalues: auto_weapon_switch (copy), u291 (ref), n35 (ref), u293 (ref), v296 (copy), v295 (copy), n36 (ref)
	if auto_weapon_switch.enabled:get() then
		local v1079 = entity.get_local_player()

		if v1079 and v1079:is_alive() then
			if not auto_weapon_switch.triggers:get("Enemy visible") then
				u293 = false
			else
				local v1080 = false
				local v1081 = entity.get_players(true, false)

				for i = 1, #v1081 do
					local v1083 = v1081[i]

					if v296(v1079, v1083) then
						v1080 = true

						break
					end
				end

				if not v1080 or u293 then
					if not v1080 then
						u293 = false
					end
				else
					u293 = v295() or u293
				end
			end

			if u291 and globals.tickcount - n36 < 2 then
				v295()
				u291 = false
			end

			return
		end

		return
	end

	u291 = false
	n35 = 0
	u293 = false
end

auto_weapon_switch.enabled:set_callback(function(p232)
	-- upvalues: v298 (copy), v297 (copy)
	local v1085 = p232:get()

	events.createmove(v298, v1085)
	events.bullet_impact(v297, v1085)
end, true)

local t46 = {
	timeout = 5,
	font = 1,
	max_bottom = 6,
	items = {}
}
local t47 = {
	background = color(18, 24, 30, 255),
	glow = color(105, 205, 255, 255),
	logo = color(105, 205, 255, 255),
	text = color(255, 255, 255, 255)
}

local function v301()
	-- upvalues: t6 (ref), t47 (copy)
	if not t6.other.ragebot.aim_logging.notify_color then
		return t47.glow
	end

	return t6.other.ragebot.aim_logging.notify_color:get()
end
local function v302(p233, p234)
	local v1088, v1089, v1090 = p233:unpack()

	return color(v1088, v1089, v1090, math.clamp(p234, 0, 255))
end
local function v303(p235, p236, p237, p238, p239)
	-- upvalues: v301 (copy), v302 (copy), t47 (copy)
	local n37 = 6
	local v1097 = v301()

	render.shadow(vector(p235, p236), vector(p235 + p237, p236 + p238), v302(v1097, p239 * 0.45), 15, 0, n37)
	render.rect(vector(p235, p236), vector(p235 + p237, p236 + p238), v302(t47.background, p239), n37)
end
local function v304(p240, p241, p242)
	return p240 + (p241 - p240) * p242
end

function t46.push(p243)
	-- upvalues: t46 (ref)
	table.insert(t46.items, 1, {
		alpha = 0,
		text = p243,
		y = render.screen_size().y,
		lifetime = globals.realtime + t46.timeout
	})

	while #t46.items > t46.max_bottom do
		table.remove(t46.items)
	end
end

events.render(function()
	-- upvalues: t46 (ref), v304 (copy), v303 (copy), v302 (copy), v301 (copy), t47 (copy)
	if #t46.items ~= 0 then
		local v1102 = render.screen_size()
		local frametime = globals.frametime
		local realtime = globals.realtime
		local v1105 = #t46.items

		for i = #t46.items, 1, -1 do
			local v1107 = t46.items[i]
			local v1108 = v1105 - i + 1

			if not (realtime > v1107.lifetime) then
				local v1109 = v1102.y - 95 - math.max(v1108 - 1, 0) * 32

				v1107.y = v304(v1107.y, v1109, frametime * 7)
				v1107.alpha = v304(v1107.alpha, 255, frametime * 2)
			else
				v1107.y = v304(v1107.y, v1107.y - 10, frametime * 15)
				v1107.alpha = v304(v1107.alpha, 0, frametime * 20)
			end

			if not (v1107.alpha <= 1) then
				local v1110 = "     " .. v1107.text
				local v1111 = render.measure_text(t46.font, nil, v1110)
				local v1112 = v1111.x + 10 + 10
				local n38 = 23
				local v1114 = v1102.x * 0.5 - v1112 * 0.5
				local v1115 = math.ceil(v1107.y)
				local v1116 = math.floor(v1107.alpha + 0.5)
				local v1117 = v1115 + n38 * 0.5 - v1111.y * 0.5

				v303(v1114, v1115, v1112, n38, v1116)
				render.text(t46.font, vector(v1114 + 11, v1117), v302(v301(), v1116), nil, "F")
				render.text(t46.font, vector(v1114 + 8, v1117), v302(t47.text, v1116), nil, v1110)
			else
				table.remove(t46.items, i)
			end
		end

		return
	end
end)

local t48 = {
	timeout = 4,
	max_items = 8,
	items = {},
	font = render.load_font("Tahoma", 11, "abd")
}

function t48.push(p244, p245, p246)
	-- upvalues: t48 (ref)
	render.screen_size()
	table.insert(t48.items, 1, {
		x = 8,
		enter_offset = 20,
		y = 8,
		alpha = 0,
		text = p244,
		lifetime = globals.realtime + t48.timeout,
		is_hit = p245,
		color = p246 or color(255, 255, 255, 255)
	})

	while #t48.items > t48.max_items do
		table.remove(t48.items)
	end
end

events.render(function()
	-- upvalues: t48 (ref)
	if #t48.items ~= 0 then
		local frametime = globals.frametime
		local realtime = globals.realtime

		for i = #t48.items, 1, -1 do
			local v1124 = t48.items[i]
			local v1125 = #t48.items - i + 1

			if not (realtime > v1124.lifetime) then
				v1124.alpha = v1124.alpha + (255 - v1124.alpha) * frametime * 10
				v1124.enter_offset = v1124.enter_offset + (0 - v1124.enter_offset) * frametime * 12
			else
				v1124.alpha = v1124.alpha + (0 - v1124.alpha) * frametime * 12
				v1124.enter_offset = v1124.enter_offset + (30 - v1124.enter_offset) * frametime * 10
			end

			if not (v1124.alpha <= 1) then
				local v1126 = v1124.x - v1124.enter_offset
				local v1127 = v1124.y + (v1125 - 1) * 26
				local v1128 = math.floor(math.clamp(v1124.alpha, 0, 255))
				local color2 = v1124.color
				local v1130 = color(color2.r, color2.g, color2.b, v1128)

				color(0, 0, 0, math.floor(v1128 * 0.6))

				local n39 = 4
				local v1132 = render.measure_text(t48.font, nil, v1124.text)
				local y = v1132.y

				render.gradient(vector(v1126 - 3, v1127 - 3), vector(v1126 + (n39 + v1132.x / 2) + 3, v1127 + y + 3), color(0, 0, 0, math.max(v1128 - 255, 0)), color(0, 0, 0, math.max(v1128 - 150, 0)), color(0, 0, 0, math.max(v1128 - 255, 0)), color(0, 0, 0, math.max(v1128 - 150, 0)), 0)
				render.gradient(vector(v1126 + (n39 + v1132.x / 2) + 3, v1127 - 3), vector(v1126 + (n39 + v1132.x) + 3, v1127 + y + 3), color(0, 0, 0, math.max(v1128 - 150, 0)), color(0, 0, 0, math.max(v1128 - 255, 0)), color(0, 0, 0, math.max(v1128 - 150, 0)), color(0, 0, 0, math.max(v1128 - 255, 0)), 0)
				render.text(t48.font, vector(v1126 + n39, v1127), v1130, nil, v1124.text)
			else
				table.remove(t48.items, i)
			end
		end

		return
	end
end)
t41.aim_logging = {}

local t49 = {
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
local u307 = color(105, 205, 255, 255)

events.aim_ack(function(p247)
	-- upvalues: t6 (ref), t49 (copy), t1 (ref), u307 (ref), v8 (copy), t48 (ref), t46 (ref)
	if t6.other.ragebot.aim_logging.enabled:get() then
		local target = p247.target

		if target ~= nil then
			local v1136 = target:get_name()
			local v1137 = t49[p247.hitgroup] or "generic"
			local v1138 = t49[p247.wanted_hitgroup] or "generic"
			local damage = p247.damage
			local wanted_damage = p247.wanted_damage
			local hitchance = p247.hitchance
			local backtrack = p247.backtrack
			local v1143 = t6.other.ragebot.aim_logging.alternative_hit_color:get():to_hex()
			local v1144 = t6.other.ragebot.aim_logging.alternative_miss_color:get():to_hex()
			local v1145, v1146

			if p247.state ~= nil then
				v1145 = string.format("Missed shot at %s due to %s in the %s for %s damage [hc: %d%% | bt: %dt]", v1136, p247.state, v1138, wanted_damage, hitchance, backtrack)
				event_alternative_text = string.format("" .. t1.get("xmark") .. " Missed shot at \a" .. v1144 .. "%s\aDEFAULT due to \a" .. v1144 .. "%s\aDEFAULT in the \a" .. v1144 .. "%s\aDEFAULT for \a" .. v1144 .. "%s\aDEFAULT damage [hc: \a" .. v1144 .. "%d%%\aDEFAULT | bt: \a" .. v1144 .. "%dt\aDEFAULT]", v1136, p247.state, v1138, wanted_damage, hitchance, backtrack)
				v1146 = string.format("Missed shot at %s due to %s in the %s", v1136, p247.state, v1138)
			else
				v1145 = string.format("Hit %s in the %s(%s) for %s(%s) damage [hc: %d%% | bt: %dt]", v1136, v1137, v1138, damage, wanted_damage, hitchance, backtrack)
				event_alternative_text = string.format("" .. t1.get("check") .. " Hit \a" .. v1143 .. "%s\aDEFAULT in the \a" .. v1143 .. "%s(%s)\aDEFAULT for \a" .. v1143 .. "%s(%s)\aDEFAULT damage [hc: \a" .. v1143 .. "%d%%\aDEFAULT | bt: \a" .. v1143 .. "%dt\aDEFAULT]", v1136, v1137, v1138, damage, wanted_damage, hitchance, backtrack)
				v1146 = string.format("Hit %s in the %s for %s damage", v1136, v1137, damage)
			end

			local output = t6.other.ragebot.aim_logging.output
			local v1148 = t6.other.ragebot.aim_logging.hitlogs_style:get()

			u307 = t6.other.ragebot.aim_logging.notify_color:get()

			if output:get("Console") then
				print_raw(v8("frost • ", v1145))
			end

			if output:get("Event") then
				if v1148 == "Alternative" then
					t48.push(event_alternative_text, p247.state == nil, color(255, 255, 255, 255))
				else
					print_dev(v1145)
				end
			end

			if output:get("Notify") then
				t46.push(v1146)
			end

			return
		end

		return
	end
end)

local v308 = pui.setup({
	[1] = t6
}, true)
local t50 = {}

configdata = db.cfg_dbggg151435143 or {}
configdata.cfg_list = configdata.cfg_list or {
	[1] = {
		[1] = "Default",
		[2] = "W3siYW50aV9haW0iOnsiYnVpbGRlciI6W3siYnJlYWtfbGMiOlsifiJdLCJicmVha19sY19oaWRkZW5fZW5hYmxlIjpmYWxzZSwiYnJlYWtfbGNfaGlkZGVuX3BpdGNoIjoiRGlzYWJsZWQiLCJicmVha19sY19oaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImJyZWFrX2xjX2hpZGRlbl9waXRjaF9zd2F5X3NwZWVkIjo4LjAsImJyZWFrX2xjX2hpZGRlbl95YXciOiJTaWRld2F5cyIsImJyZWFrX2xjX2hpZGRlbl95YXdfM3dheV9tYXgiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfM3dheV9taW4iOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3XzV3YXlfbWF4IjoxMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd181d2F5X21pbiI6LTEyMC4wLCJicmVha19sY19oaWRkZW5feWF3X2NlbnRlciI6MC4wLCJicmVha19sY19oaWRkZW5feWF3X2N1c3RvbSI6MC4wLCJicmVha19sY19oaWRkZW5feWF3X2Rpc3RvcnRpb25fcmFuZ2UiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfZGlzdG9ydGlvbl9zcGVlZCI6OC4wLCJicmVha19sY19oaWRkZW5feWF3X3Byb2dyZXNzaXZlX21heCI6MTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfbWluIjotMTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfc3RlcCI6MjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19yYW5kb21fbWF4Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X3JhbmRvbV9taW4iOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NpZGV3YXlzX2xlZnQiOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NpZGV3YXlzX3JpZ2h0Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NwaW5fc3BlZWQiOjMwLjAsImJyZWFrX2xjX3RpY2tzX21heCI6MTYuMCwiYnJlYWtfbGNfdGlja3NfbWluIjoxNi4wLCJicmVha19sY190aWNrc19tb2RlIjoiU3RhdGljIiwiYnJlYWtfbGNfdGlja3NfcmFuZG9tIjoxNi4wLCJicmVha19sY190aWNrc19zZXFfc3RlcHMiOjMuMCwiYnJlYWtfbGNfdGlja3Nfc2VxdWVuY2UiOlsxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wXSwiYnJlYWtfbGNfdGlja3Nfc3RhdGljIjoxNi4wLCJpbnZlcnRlcl9ib2R5IjpmYWxzZSwiaml0dGVyX3NwZWVkX3BoYXNlXzEiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzIiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzMiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzQiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlc19zd2l0Y2hfc3BlZWQiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzIjoxLjAsImppdHRlcl9zcGVlZF90aWNrc19tYXgiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzX21pbiI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3Nfc2VxdWVuY2UiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJqaXR0ZXJfc3BlZWRfdGlja3Nfc3RlcHMiOjIuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19tYXgiOjEuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19taW4iOjEuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19zZXF1ZW5jZSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImppdHRlcl9zcGVlZF90aW1pbmdfc3RlcHMiOjIuMCwiaml0dGVyX3RpY2tzX21vZGUiOiJTdGF0aWMiLCJqaXR0ZXJfdGltaW5nX21vZGUiOiJNaW4vTWF4IiwibW9kZSI6IkppdHRlciIsIm92ZXJyaWRlX3N0YXRlIjp0cnVlLCJzd2l0Y2hfbWV0aG9kIjoiVGlja3MiLCJ5YXdfYWRkX2xlZnQiOi0zOS4wLCJ5YXdfYWRkX2xlZnRfcmFuZG9taXplIjowLjAsInlhd19hZGRfcmlnaHQiOjM5LjAsInlhd19hZGRfcmlnaHRfcmFuZG9taXplIjowLjAsInlhd19hbW91bnQiOi00OS4wLCJ5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9hbW91bnQiOjAuMCwieWF3X21vZGlmaWVyX2Ftb3VudF9tYXgiOjAuMCwieWF3X21vZGlmaWVyX2Ftb3VudF9taW4iOjAuMCwieWF3X21vZGlmaWVyX21vZGUiOiJTdGF0aWMiLCJ5YXdfbW9kaWZpZXJfcmFuZG9taXplIjowLjAsInlhd19tb2RpZmllcl9zZXF1ZW5jZSI6WzAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMF0sInlhd19tb2RpZmllcl9zdGVwcyI6Mi4wLCJ5YXdfcmFuZG9taXplIjowLjB9LHsiYnJlYWtfbGMiOlsifiJdLCJicmVha19sY19oaWRkZW5fZW5hYmxlIjpmYWxzZSwiYnJlYWtfbGNfaGlkZGVuX3BpdGNoIjoiRGlzYWJsZWQiLCJicmVha19sY19oaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImJyZWFrX2xjX2hpZGRlbl9waXRjaF9zd2F5X3NwZWVkIjo4LjAsImJyZWFrX2xjX2hpZGRlbl95YXciOiJTaWRld2F5cyIsImJyZWFrX2xjX2hpZGRlbl95YXdfM3dheV9tYXgiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfM3dheV9taW4iOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3XzV3YXlfbWF4IjoxMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd181d2F5X21pbiI6LTEyMC4wLCJicmVha19sY19oaWRkZW5feWF3X2NlbnRlciI6MC4wLCJicmVha19sY19oaWRkZW5feWF3X2N1c3RvbSI6MC4wLCJicmVha19sY19oaWRkZW5feWF3X2Rpc3RvcnRpb25fcmFuZ2UiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfZGlzdG9ydGlvbl9zcGVlZCI6OC4wLCJicmVha19sY19oaWRkZW5feWF3X3Byb2dyZXNzaXZlX21heCI6MTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfbWluIjotMTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfc3RlcCI6MjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19yYW5kb21fbWF4Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X3JhbmRvbV9taW4iOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NpZGV3YXlzX2xlZnQiOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NpZGV3YXlzX3JpZ2h0Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NwaW5fc3BlZWQiOjMwLjAsImJyZWFrX2xjX3RpY2tzX21heCI6MTYuMCwiYnJlYWtfbGNfdGlja3NfbWluIjoxNi4wLCJicmVha19sY190aWNrc19tb2RlIjoiU3RhdGljIiwiYnJlYWtfbGNfdGlja3NfcmFuZG9tIjoxNi4wLCJicmVha19sY190aWNrc19zZXFfc3RlcHMiOjMuMCwiYnJlYWtfbGNfdGlja3Nfc2VxdWVuY2UiOlsxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wXSwiYnJlYWtfbGNfdGlja3Nfc3RhdGljIjoxNi4wLCJpbnZlcnRlcl9ib2R5IjpmYWxzZSwiaml0dGVyX3NwZWVkX3BoYXNlXzEiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzIiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzMiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzQiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlc19zd2l0Y2hfc3BlZWQiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzIjoxLjAsImppdHRlcl9zcGVlZF90aWNrc19tYXgiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzX21pbiI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3Nfc2VxdWVuY2UiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJqaXR0ZXJfc3BlZWRfdGlja3Nfc3RlcHMiOjIuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19tYXgiOjEuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19taW4iOjEuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19zZXF1ZW5jZSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImppdHRlcl9zcGVlZF90aW1pbmdfc3RlcHMiOjIuMCwiaml0dGVyX3RpY2tzX21vZGUiOiJTdGF0aWMiLCJqaXR0ZXJfdGltaW5nX21vZGUiOiJNaW4vTWF4IiwibW9kZSI6IkppdHRlciIsIm92ZXJyaWRlX3N0YXRlIjp0cnVlLCJzd2l0Y2hfbWV0aG9kIjoiVGlja3MiLCJ5YXdfYWRkX2xlZnQiOjAuMCwieWF3X2FkZF9sZWZ0X3JhbmRvbWl6ZSI6MC4wLCJ5YXdfYWRkX3JpZ2h0IjowLjAsInlhd19hZGRfcmlnaHRfcmFuZG9taXplIjowLjAsInlhd19hbW91bnQiOjAuMCwieWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfYW1vdW50IjowLjAsInlhd19tb2RpZmllcl9hbW91bnRfbWF4IjowLjAsInlhd19tb2RpZmllcl9hbW91bnRfbWluIjowLjAsInlhd19tb2RpZmllcl9tb2RlIjoiU3RhdGljIiwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZSI6MC4wLCJ5YXdfbW9kaWZpZXJfc2VxdWVuY2UiOlswLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjBdLCJ5YXdfbW9kaWZpZXJfc3RlcHMiOjIuMCwieWF3X3JhbmRvbWl6ZSI6MC4wfSx7ImJyZWFrX2xjIjpbIkRvdWJsZSBUYXAiLCJIaWRlIFNob3RzIiwifiJdLCJicmVha19sY19oaWRkZW5fZW5hYmxlIjpmYWxzZSwiYnJlYWtfbGNfaGlkZGVuX3BpdGNoIjoiRGlzYWJsZWQiLCJicmVha19sY19oaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImJyZWFrX2xjX2hpZGRlbl9waXRjaF9zd2F5X3NwZWVkIjo4LjAsImJyZWFrX2xjX2hpZGRlbl95YXciOiJTaWRld2F5cyIsImJyZWFrX2xjX2hpZGRlbl95YXdfM3dheV9tYXgiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfM3dheV9taW4iOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3XzV3YXlfbWF4IjoxMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd181d2F5X21pbiI6LTEyMC4wLCJicmVha19sY19oaWRkZW5feWF3X2NlbnRlciI6MC4wLCJicmVha19sY19oaWRkZW5feWF3X2N1c3RvbSI6MC4wLCJicmVha19sY19oaWRkZW5feWF3X2Rpc3RvcnRpb25fcmFuZ2UiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfZGlzdG9ydGlvbl9zcGVlZCI6OC4wLCJicmVha19sY19oaWRkZW5feWF3X3Byb2dyZXNzaXZlX21heCI6MTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfbWluIjotMTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfc3RlcCI6MjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19yYW5kb21fbWF4Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X3JhbmRvbV9taW4iOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NpZGV3YXlzX2xlZnQiOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NpZGV3YXlzX3JpZ2h0Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NwaW5fc3BlZWQiOjMwLjAsImJyZWFrX2xjX3RpY2tzX21heCI6MTYuMCwiYnJlYWtfbGNfdGlja3NfbWluIjoxNi4wLCJicmVha19sY190aWNrc19tb2RlIjoiU3RhdGljIiwiYnJlYWtfbGNfdGlja3NfcmFuZG9tIjoxNi4wLCJicmVha19sY190aWNrc19zZXFfc3RlcHMiOjMuMCwiYnJlYWtfbGNfdGlja3Nfc2VxdWVuY2UiOlsxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wXSwiYnJlYWtfbGNfdGlja3Nfc3RhdGljIjoxNi4wLCJpbnZlcnRlcl9ib2R5IjpmYWxzZSwiaml0dGVyX3NwZWVkX3BoYXNlXzEiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzIiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzMiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzQiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlc19zd2l0Y2hfc3BlZWQiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzIjoxLjAsImppdHRlcl9zcGVlZF90aWNrc19tYXgiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzX21pbiI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3Nfc2VxdWVuY2UiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJqaXR0ZXJfc3BlZWRfdGlja3Nfc3RlcHMiOjIuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19tYXgiOjEuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19taW4iOjEuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19zZXF1ZW5jZSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImppdHRlcl9zcGVlZF90aW1pbmdfc3RlcHMiOjIuMCwiaml0dGVyX3RpY2tzX21vZGUiOiJTdGF0aWMiLCJqaXR0ZXJfdGltaW5nX21vZGUiOiJNaW4vTWF4IiwibW9kZSI6IkppdHRlciIsIm92ZXJyaWRlX3N0YXRlIjp0cnVlLCJzd2l0Y2hfbWV0aG9kIjoiVGlja3MiLCJ5YXdfYWRkX2xlZnQiOi0xMi4wLCJ5YXdfYWRkX2xlZnRfcmFuZG9taXplIjowLjAsInlhd19hZGRfcmlnaHQiOjAuMCwieWF3X2FkZF9yaWdodF9yYW5kb21pemUiOjAuMCwieWF3X2Ftb3VudCI6MC4wLCJ5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9hbW91bnQiOjAuMCwieWF3X21vZGlmaWVyX2Ftb3VudF9tYXgiOjAuMCwieWF3X21vZGlmaWVyX2Ftb3VudF9taW4iOjAuMCwieWF3X21vZGlmaWVyX21vZGUiOiJTdGF0aWMiLCJ5YXdfbW9kaWZpZXJfcmFuZG9taXplIjowLjAsInlhd19tb2RpZmllcl9zZXF1ZW5jZSI6WzAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMF0sInlhd19tb2RpZmllcl9zdGVwcyI6Mi4wLCJ5YXdfcmFuZG9taXplIjowLjB9LHsiYnJlYWtfbGMiOlsiRG91YmxlIFRhcCIsIkhpZGUgU2hvdHMiLCJ+Il0sImJyZWFrX2xjX2hpZGRlbl9lbmFibGUiOmZhbHNlLCJicmVha19sY19oaWRkZW5fcGl0Y2giOiJEaXNhYmxlZCIsImJyZWFrX2xjX2hpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiYnJlYWtfbGNfaGlkZGVuX3BpdGNoX3N3YXlfc3BlZWQiOjguMCwiYnJlYWtfbGNfaGlkZGVuX3lhdyI6IlNpZGV3YXlzIiwiYnJlYWtfbGNfaGlkZGVuX3lhd18zd2F5X21heCI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd18zd2F5X21pbiI6LTkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfNXdheV9tYXgiOjEyMC4wLCJicmVha19sY19oaWRkZW5feWF3XzV3YXlfbWluIjotMTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfY2VudGVyIjowLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfY3VzdG9tIjowLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfZGlzdG9ydGlvbl9yYW5nZSI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19kaXN0b3J0aW9uX3NwZWVkIjo4LjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfbWF4IjoxMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19wcm9ncmVzc2l2ZV9taW4iOi0xMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19wcm9ncmVzc2l2ZV9zdGVwIjoyMC4wLCJicmVha19sY19oaWRkZW5feWF3X3JhbmRvbV9tYXgiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcmFuZG9tX21pbiI6LTkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfc2lkZXdheXNfbGVmdCI6LTkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfc2lkZXdheXNfcmlnaHQiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfc3Bpbl9zcGVlZCI6MzAuMCwiYnJlYWtfbGNfdGlja3NfbWF4IjoxNi4wLCJicmVha19sY190aWNrc19taW4iOjE2LjAsImJyZWFrX2xjX3RpY2tzX21vZGUiOiJTdGF0aWMiLCJicmVha19sY190aWNrc19yYW5kb20iOjE2LjAsImJyZWFrX2xjX3RpY2tzX3NlcV9zdGVwcyI6My4wLCJicmVha19sY190aWNrc19zZXF1ZW5jZSI6WzE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjBdLCJicmVha19sY190aWNrc19zdGF0aWMiOjE2LjAsImludmVydGVyX2JvZHkiOmZhbHNlLCJqaXR0ZXJfc3BlZWRfcGhhc2VfMSI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VfMiI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VfMyI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VfNCI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VzX3N3aXRjaF9zcGVlZCI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3MiOjMuMCwiaml0dGVyX3NwZWVkX3RpY2tzX21heCI6NS4wLCJqaXR0ZXJfc3BlZWRfdGlja3NfbWluIjozLjAsImppdHRlcl9zcGVlZF90aWNrc19zZXF1ZW5jZSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImppdHRlcl9zcGVlZF90aWNrc19zdGVwcyI6Mi4wLCJqaXR0ZXJfc3BlZWRfdGltaW5nX21heCI6MS4wLCJqaXR0ZXJfc3BlZWRfdGltaW5nX21pbiI6MS4wLCJqaXR0ZXJfc3BlZWRfdGltaW5nX3NlcXVlbmNlIjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaml0dGVyX3NwZWVkX3RpbWluZ19zdGVwcyI6Mi4wLCJqaXR0ZXJfdGlja3NfbW9kZSI6Ik1pbi9NYXgiLCJqaXR0ZXJfdGltaW5nX21vZGUiOiJNaW4vTWF4IiwibW9kZSI6IkppdHRlciIsIm92ZXJyaWRlX3N0YXRlIjp0cnVlLCJzd2l0Y2hfbWV0aG9kIjoiVGlja3MiLCJ5YXdfYWRkX2xlZnQiOi0zOS4wLCJ5YXdfYWRkX2xlZnRfcmFuZG9taXplIjowLjAsInlhd19hZGRfcmlnaHQiOjQ5LjAsInlhd19hZGRfcmlnaHRfcmFuZG9taXplIjowLjAsInlhd19hbW91bnQiOjAuMCwieWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfYW1vdW50IjowLjAsInlhd19tb2RpZmllcl9hbW91bnRfbWF4IjowLjAsInlhd19tb2RpZmllcl9hbW91bnRfbWluIjowLjAsInlhd19tb2RpZmllcl9tb2RlIjoiU3RhdGljIiwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZSI6MC4wLCJ5YXdfbW9kaWZpZXJfc2VxdWVuY2UiOlswLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjBdLCJ5YXdfbW9kaWZpZXJfc3RlcHMiOjIuMCwieWF3X3JhbmRvbWl6ZSI6MC4wfSx7ImJyZWFrX2xjIjpbIn4iXSwiYnJlYWtfbGNfaGlkZGVuX2VuYWJsZSI6ZmFsc2UsImJyZWFrX2xjX2hpZGRlbl9waXRjaCI6IkRpc2FibGVkIiwiYnJlYWtfbGNfaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJicmVha19sY19oaWRkZW5fcGl0Y2hfc3dheV9zcGVlZCI6OC4wLCJicmVha19sY19oaWRkZW5feWF3IjoiU2lkZXdheXMiLCJicmVha19sY19oaWRkZW5feWF3XzN3YXlfbWF4Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3XzN3YXlfbWluIjotOTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd181d2F5X21heCI6MTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfNXdheV9taW4iOi0xMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19jZW50ZXIiOjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19jdXN0b20iOjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19kaXN0b3J0aW9uX3JhbmdlIjo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X2Rpc3RvcnRpb25fc3BlZWQiOjguMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19wcm9ncmVzc2l2ZV9tYXgiOjEyMC4wLCJicmVha19sY19oaWRkZW5feWF3X3Byb2dyZXNzaXZlX21pbiI6LTEyMC4wLCJicmVha19sY19oaWRkZW5feWF3X3Byb2dyZXNzaXZlX3N0ZXAiOjIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcmFuZG9tX21heCI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19yYW5kb21fbWluIjotOTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19zaWRld2F5c19sZWZ0IjotOTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19zaWRld2F5c19yaWdodCI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19zcGluX3NwZWVkIjozMC4wLCJicmVha19sY190aWNrc19tYXgiOjE2LjAsImJyZWFrX2xjX3RpY2tzX21pbiI6MTYuMCwiYnJlYWtfbGNfdGlja3NfbW9kZSI6IlN0YXRpYyIsImJyZWFrX2xjX3RpY2tzX3JhbmRvbSI6MTYuMCwiYnJlYWtfbGNfdGlja3Nfc2VxX3N0ZXBzIjozLjAsImJyZWFrX2xjX3RpY2tzX3NlcXVlbmNlIjpbMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMF0sImJyZWFrX2xjX3RpY2tzX3N0YXRpYyI6MTYuMCwiaW52ZXJ0ZXJfYm9keSI6dHJ1ZSwiaml0dGVyX3NwZWVkX3BoYXNlXzEiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzIiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzMiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzQiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlc19zd2l0Y2hfc3BlZWQiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzIjoxLjAsImppdHRlcl9zcGVlZF90aWNrc19tYXgiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzX21pbiI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3Nfc2VxdWVuY2UiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJqaXR0ZXJfc3BlZWRfdGlja3Nfc3RlcHMiOjIuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19tYXgiOjEuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19taW4iOjEuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19zZXF1ZW5jZSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImppdHRlcl9zcGVlZF90aW1pbmdfc3RlcHMiOjIuMCwiaml0dGVyX3RpY2tzX21vZGUiOiJTdGF0aWMiLCJqaXR0ZXJfdGltaW5nX21vZGUiOiJNaW4vTWF4IiwibW9kZSI6IkppdHRlciIsIm92ZXJyaWRlX3N0YXRlIjp0cnVlLCJzd2l0Y2hfbWV0aG9kIjoiVGlja3MiLCJ5YXdfYWRkX2xlZnQiOi0xNS4wLCJ5YXdfYWRkX2xlZnRfcmFuZG9taXplIjowLjAsInlhd19hZGRfcmlnaHQiOjU4LjAsInlhd19hZGRfcmlnaHRfcmFuZG9taXplIjowLjAsInlhd19hbW91bnQiOjAuMCwieWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfYW1vdW50IjowLjAsInlhd19tb2RpZmllcl9hbW91bnRfbWF4IjowLjAsInlhd19tb2RpZmllcl9hbW91bnRfbWluIjowLjAsInlhd19tb2RpZmllcl9tb2RlIjoiU3RhdGljIiwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZSI6MC4wLCJ5YXdfbW9kaWZpZXJfc2VxdWVuY2UiOlswLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjBdLCJ5YXdfbW9kaWZpZXJfc3RlcHMiOjIuMCwieWF3X3JhbmRvbWl6ZSI6MC4wfSx7ImJyZWFrX2xjIjpbIn4iXSwiYnJlYWtfbGNfaGlkZGVuX2VuYWJsZSI6ZmFsc2UsImJyZWFrX2xjX2hpZGRlbl9waXRjaCI6IkRpc2FibGVkIiwiYnJlYWtfbGNfaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJicmVha19sY19oaWRkZW5fcGl0Y2hfc3dheV9zcGVlZCI6OC4wLCJicmVha19sY19oaWRkZW5feWF3IjoiU2lkZXdheXMiLCJicmVha19sY19oaWRkZW5feWF3XzN3YXlfbWF4Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3XzN3YXlfbWluIjotOTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd181d2F5X21heCI6MTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfNXdheV9taW4iOi0xMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19jZW50ZXIiOjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19jdXN0b20iOjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19kaXN0b3J0aW9uX3JhbmdlIjo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X2Rpc3RvcnRpb25fc3BlZWQiOjguMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19wcm9ncmVzc2l2ZV9tYXgiOjEyMC4wLCJicmVha19sY19oaWRkZW5feWF3X3Byb2dyZXNzaXZlX21pbiI6LTEyMC4wLCJicmVha19sY19oaWRkZW5feWF3X3Byb2dyZXNzaXZlX3N0ZXAiOjIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcmFuZG9tX21heCI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19yYW5kb21fbWluIjotOTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19zaWRld2F5c19sZWZ0IjotOTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19zaWRld2F5c19yaWdodCI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19zcGluX3NwZWVkIjozMC4wLCJicmVha19sY190aWNrc19tYXgiOjE2LjAsImJyZWFrX2xjX3RpY2tzX21pbiI6MTYuMCwiYnJlYWtfbGNfdGlja3NfbW9kZSI6IlN0YXRpYyIsImJyZWFrX2xjX3RpY2tzX3JhbmRvbSI6MTYuMCwiYnJlYWtfbGNfdGlja3Nfc2VxX3N0ZXBzIjozLjAsImJyZWFrX2xjX3RpY2tzX3NlcXVlbmNlIjpbMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMF0sImJyZWFrX2xjX3RpY2tzX3N0YXRpYyI6MTYuMCwiaW52ZXJ0ZXJfYm9keSI6ZmFsc2UsImppdHRlcl9zcGVlZF9waGFzZV8xIjoxLjAsImppdHRlcl9zcGVlZF9waGFzZV8yIjoxLjAsImppdHRlcl9zcGVlZF9waGFzZV8zIjoxLjAsImppdHRlcl9zcGVlZF9waGFzZV80IjoxLjAsImppdHRlcl9zcGVlZF9waGFzZXNfc3dpdGNoX3NwZWVkIjoxLjAsImppdHRlcl9zcGVlZF90aWNrcyI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3NfbWF4IjoxLjAsImppdHRlcl9zcGVlZF90aWNrc19taW4iOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzX3NlcXVlbmNlIjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaml0dGVyX3NwZWVkX3RpY2tzX3N0ZXBzIjoyLjAsImppdHRlcl9zcGVlZF90aW1pbmdfbWF4Ijo0LjAsImppdHRlcl9zcGVlZF90aW1pbmdfbWluIjozLjAsImppdHRlcl9zcGVlZF90aW1pbmdfc2VxdWVuY2UiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJqaXR0ZXJfc3BlZWRfdGltaW5nX3N0ZXBzIjoyLjAsImppdHRlcl90aWNrc19tb2RlIjoiU3RhdGljIiwiaml0dGVyX3RpbWluZ19tb2RlIjoiTWluL01heCIsIm1vZGUiOiJKaXR0ZXIiLCJvdmVycmlkZV9zdGF0ZSI6dHJ1ZSwic3dpdGNoX21ldGhvZCI6IlRpbWluZyIsInlhd19hZGRfbGVmdCI6LTI5LjAsInlhd19hZGRfbGVmdF9yYW5kb21pemUiOjAuMCwieWF3X2FkZF9yaWdodCI6NDQuMCwieWF3X2FkZF9yaWdodF9yYW5kb21pemUiOjAuMCwieWF3X2Ftb3VudCI6MC4wLCJ5YXdfbW9kaWZpZXIiOiJTcGluIiwieWF3X21vZGlmaWVyX2Ftb3VudCI6Ny4wLCJ5YXdfbW9kaWZpZXJfYW1vdW50X21heCI6MC4wLCJ5YXdfbW9kaWZpZXJfYW1vdW50X21pbiI6MC4wLCJ5YXdfbW9kaWZpZXJfbW9kZSI6IlN0YXRpYyIsInlhd19tb2RpZmllcl9yYW5kb21pemUiOjAuMCwieWF3X21vZGlmaWVyX3NlcXVlbmNlIjpbMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wXSwieWF3X21vZGlmaWVyX3N0ZXBzIjoyLjAsInlhd19yYW5kb21pemUiOjAuMH0seyJicmVha19sYyI6WyJ+Il0sImJyZWFrX2xjX2hpZGRlbl9lbmFibGUiOmZhbHNlLCJicmVha19sY19oaWRkZW5fcGl0Y2giOiJEaXNhYmxlZCIsImJyZWFrX2xjX2hpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiYnJlYWtfbGNfaGlkZGVuX3BpdGNoX3N3YXlfc3BlZWQiOjguMCwiYnJlYWtfbGNfaGlkZGVuX3lhdyI6IlNpZGV3YXlzIiwiYnJlYWtfbGNfaGlkZGVuX3lhd18zd2F5X21heCI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd18zd2F5X21pbiI6LTkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfNXdheV9tYXgiOjEyMC4wLCJicmVha19sY19oaWRkZW5feWF3XzV3YXlfbWluIjotMTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfY2VudGVyIjowLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfY3VzdG9tIjowLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfZGlzdG9ydGlvbl9yYW5nZSI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19kaXN0b3J0aW9uX3NwZWVkIjo4LjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfbWF4IjoxMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19wcm9ncmVzc2l2ZV9taW4iOi0xMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19wcm9ncmVzc2l2ZV9zdGVwIjoyMC4wLCJicmVha19sY19oaWRkZW5feWF3X3JhbmRvbV9tYXgiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcmFuZG9tX21pbiI6LTkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfc2lkZXdheXNfbGVmdCI6LTkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfc2lkZXdheXNfcmlnaHQiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfc3Bpbl9zcGVlZCI6MzAuMCwiYnJlYWtfbGNfdGlja3NfbWF4IjoxNi4wLCJicmVha19sY190aWNrc19taW4iOjE2LjAsImJyZWFrX2xjX3RpY2tzX21vZGUiOiJTdGF0aWMiLCJicmVha19sY190aWNrc19yYW5kb20iOjE2LjAsImJyZWFrX2xjX3RpY2tzX3NlcV9zdGVwcyI6My4wLCJicmVha19sY190aWNrc19zZXF1ZW5jZSI6WzE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjBdLCJicmVha19sY190aWNrc19zdGF0aWMiOjE2LjAsImludmVydGVyX2JvZHkiOmZhbHNlLCJqaXR0ZXJfc3BlZWRfcGhhc2VfMSI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VfMiI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VfMyI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VfNCI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VzX3N3aXRjaF9zcGVlZCI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3MiOjcuMCwiaml0dGVyX3NwZWVkX3RpY2tzX21heCI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3NfbWluIjoxLjAsImppdHRlcl9zcGVlZF90aWNrc19zZXF1ZW5jZSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImppdHRlcl9zcGVlZF90aWNrc19zdGVwcyI6Mi4wLCJqaXR0ZXJfc3BlZWRfdGltaW5nX21heCI6MS4wLCJqaXR0ZXJfc3BlZWRfdGltaW5nX21pbiI6MS4wLCJqaXR0ZXJfc3BlZWRfdGltaW5nX3NlcXVlbmNlIjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaml0dGVyX3NwZWVkX3RpbWluZ19zdGVwcyI6Mi4wLCJqaXR0ZXJfdGlja3NfbW9kZSI6IlN0YXRpYyIsImppdHRlcl90aW1pbmdfbW9kZSI6Ik1pbi9NYXgiLCJtb2RlIjoiSml0dGVyIiwib3ZlcnJpZGVfc3RhdGUiOnRydWUsInN3aXRjaF9tZXRob2QiOiJUaWNrcyIsInlhd19hZGRfbGVmdCI6LTUwLjAsInlhd19hZGRfbGVmdF9yYW5kb21pemUiOjAuMCwieWF3X2FkZF9yaWdodCI6NTAuMCwieWF3X2FkZF9yaWdodF9yYW5kb21pemUiOjAuMCwieWF3X2Ftb3VudCI6MC4wLCJ5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9hbW91bnQiOjAuMCwieWF3X21vZGlmaWVyX2Ftb3VudF9tYXgiOjAuMCwieWF3X21vZGlmaWVyX2Ftb3VudF9taW4iOjAuMCwieWF3X21vZGlmaWVyX21vZGUiOiJTdGF0aWMiLCJ5YXdfbW9kaWZpZXJfcmFuZG9taXplIjowLjAsInlhd19tb2RpZmllcl9zZXF1ZW5jZSI6WzAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMF0sInlhd19tb2RpZmllcl9zdGVwcyI6Mi4wLCJ5YXdfcmFuZG9taXplIjowLjB9LHsiYnJlYWtfbGMiOlsifiJdLCJicmVha19sY19oaWRkZW5fZW5hYmxlIjpmYWxzZSwiYnJlYWtfbGNfaGlkZGVuX3BpdGNoIjoiRGlzYWJsZWQiLCJicmVha19sY19oaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImJyZWFrX2xjX2hpZGRlbl9waXRjaF9zd2F5X3NwZWVkIjo4LjAsImJyZWFrX2xjX2hpZGRlbl95YXciOiJTaWRld2F5cyIsImJyZWFrX2xjX2hpZGRlbl95YXdfM3dheV9tYXgiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfM3dheV9taW4iOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3XzV3YXlfbWF4IjoxMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd181d2F5X21pbiI6LTEyMC4wLCJicmVha19sY19oaWRkZW5feWF3X2NlbnRlciI6MC4wLCJicmVha19sY19oaWRkZW5feWF3X2N1c3RvbSI6MC4wLCJicmVha19sY19oaWRkZW5feWF3X2Rpc3RvcnRpb25fcmFuZ2UiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfZGlzdG9ydGlvbl9zcGVlZCI6OC4wLCJicmVha19sY19oaWRkZW5feWF3X3Byb2dyZXNzaXZlX21heCI6MTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfbWluIjotMTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfc3RlcCI6MjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19yYW5kb21fbWF4Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X3JhbmRvbV9taW4iOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NpZGV3YXlzX2xlZnQiOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NpZGV3YXlzX3JpZ2h0Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NwaW5fc3BlZWQiOjMwLjAsImJyZWFrX2xjX3RpY2tzX21heCI6MTYuMCwiYnJlYWtfbGNfdGlja3NfbWluIjoxNi4wLCJicmVha19sY190aWNrc19tb2RlIjoiU3RhdGljIiwiYnJlYWtfbGNfdGlja3NfcmFuZG9tIjoxNi4wLCJicmVha19sY190aWNrc19zZXFfc3RlcHMiOjMuMCwiYnJlYWtfbGNfdGlja3Nfc2VxdWVuY2UiOlsxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wXSwiYnJlYWtfbGNfdGlja3Nfc3RhdGljIjoxNi4wLCJpbnZlcnRlcl9ib2R5IjpmYWxzZSwiaml0dGVyX3NwZWVkX3BoYXNlXzEiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzIiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzMiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzQiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlc19zd2l0Y2hfc3BlZWQiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzIjoxLjAsImppdHRlcl9zcGVlZF90aWNrc19tYXgiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzX21pbiI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3Nfc2VxdWVuY2UiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJqaXR0ZXJfc3BlZWRfdGlja3Nfc3RlcHMiOjIuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19tYXgiOjEuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19taW4iOjEuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19zZXF1ZW5jZSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImppdHRlcl9zcGVlZF90aW1pbmdfc3RlcHMiOjIuMCwiaml0dGVyX3RpY2tzX21vZGUiOiJTdGF0aWMiLCJqaXR0ZXJfdGltaW5nX21vZGUiOiJNaW4vTWF4IiwibW9kZSI6IlN0YXRpYyIsIm92ZXJyaWRlX3N0YXRlIjpmYWxzZSwic3dpdGNoX21ldGhvZCI6IlRpY2tzIiwieWF3X2FkZF9sZWZ0IjowLjAsInlhd19hZGRfbGVmdF9yYW5kb21pemUiOjAuMCwieWF3X2FkZF9yaWdodCI6MC4wLCJ5YXdfYWRkX3JpZ2h0X3JhbmRvbWl6ZSI6MC4wLCJ5YXdfYW1vdW50IjowLjAsInlhd19tb2RpZmllciI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyX2Ftb3VudCI6MC4wLCJ5YXdfbW9kaWZpZXJfYW1vdW50X21heCI6MC4wLCJ5YXdfbW9kaWZpZXJfYW1vdW50X21pbiI6MC4wLCJ5YXdfbW9kaWZpZXJfbW9kZSI6IlN0YXRpYyIsInlhd19tb2RpZmllcl9yYW5kb21pemUiOjAuMCwieWF3X21vZGlmaWVyX3NlcXVlbmNlIjpbMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wXSwieWF3X21vZGlmaWVyX3N0ZXBzIjoyLjAsInlhd19yYW5kb21pemUiOjAuMH0seyJicmVha19sYyI6WyJ+Il0sImJyZWFrX2xjX2hpZGRlbl9lbmFibGUiOmZhbHNlLCJicmVha19sY19oaWRkZW5fcGl0Y2giOiJEaXNhYmxlZCIsImJyZWFrX2xjX2hpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiYnJlYWtfbGNfaGlkZGVuX3BpdGNoX3N3YXlfc3BlZWQiOjguMCwiYnJlYWtfbGNfaGlkZGVuX3lhdyI6IlNpZGV3YXlzIiwiYnJlYWtfbGNfaGlkZGVuX3lhd18zd2F5X21heCI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd18zd2F5X21pbiI6LTkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfNXdheV9tYXgiOjEyMC4wLCJicmVha19sY19oaWRkZW5feWF3XzV3YXlfbWluIjotMTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfY2VudGVyIjowLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfY3VzdG9tIjowLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfZGlzdG9ydGlvbl9yYW5nZSI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19kaXN0b3J0aW9uX3NwZWVkIjo4LjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfbWF4IjoxMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19wcm9ncmVzc2l2ZV9taW4iOi0xMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19wcm9ncmVzc2l2ZV9zdGVwIjoyMC4wLCJicmVha19sY19oaWRkZW5feWF3X3JhbmRvbV9tYXgiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcmFuZG9tX21pbiI6LTkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfc2lkZXdheXNfbGVmdCI6LTkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfc2lkZXdheXNfcmlnaHQiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfc3Bpbl9zcGVlZCI6MzAuMCwiYnJlYWtfbGNfdGlja3NfbWF4IjoxNi4wLCJicmVha19sY190aWNrc19taW4iOjE2LjAsImJyZWFrX2xjX3RpY2tzX21vZGUiOiJTdGF0aWMiLCJicmVha19sY190aWNrc19yYW5kb20iOjE2LjAsImJyZWFrX2xjX3RpY2tzX3NlcV9zdGVwcyI6My4wLCJicmVha19sY190aWNrc19zZXF1ZW5jZSI6WzE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjBdLCJicmVha19sY190aWNrc19zdGF0aWMiOjE2LjAsImludmVydGVyX2JvZHkiOmZhbHNlLCJqaXR0ZXJfc3BlZWRfcGhhc2VfMSI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VfMiI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VfMyI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VfNCI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VzX3N3aXRjaF9zcGVlZCI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3MiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzX21heCI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3NfbWluIjoxLjAsImppdHRlcl9zcGVlZF90aWNrc19zZXF1ZW5jZSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImppdHRlcl9zcGVlZF90aWNrc19zdGVwcyI6Mi4wLCJqaXR0ZXJfc3BlZWRfdGltaW5nX21heCI6MS4wLCJqaXR0ZXJfc3BlZWRfdGltaW5nX21pbiI6MS4wLCJqaXR0ZXJfc3BlZWRfdGltaW5nX3NlcXVlbmNlIjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaml0dGVyX3NwZWVkX3RpbWluZ19zdGVwcyI6Mi4wLCJqaXR0ZXJfdGlja3NfbW9kZSI6IlN0YXRpYyIsImppdHRlcl90aW1pbmdfbW9kZSI6Ik1pbi9NYXgiLCJtb2RlIjoiU3RhdGljIiwib3ZlcnJpZGVfc3RhdGUiOmZhbHNlLCJzd2l0Y2hfbWV0aG9kIjoiVGlja3MiLCJ5YXdfYWRkX2xlZnQiOjAuMCwieWF3X2FkZF9sZWZ0X3JhbmRvbWl6ZSI6MC4wLCJ5YXdfYWRkX3JpZ2h0IjowLjAsInlhd19hZGRfcmlnaHRfcmFuZG9taXplIjowLjAsInlhd19hbW91bnQiOjAuMCwieWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfYW1vdW50IjowLjAsInlhd19tb2RpZmllcl9hbW91bnRfbWF4IjowLjAsInlhd19tb2RpZmllcl9hbW91bnRfbWluIjowLjAsInlhd19tb2RpZmllcl9tb2RlIjoiU3RhdGljIiwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZSI6MC4wLCJ5YXdfbW9kaWZpZXJfc2VxdWVuY2UiOlswLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjBdLCJ5YXdfbW9kaWZpZXJfc3RlcHMiOjIuMCwieWF3X3JhbmRvbWl6ZSI6MC4wfSx7ImJyZWFrX2xjIjpbIn4iXSwiYnJlYWtfbGNfaGlkZGVuX2VuYWJsZSI6ZmFsc2UsImJyZWFrX2xjX2hpZGRlbl9waXRjaCI6IkRpc2FibGVkIiwiYnJlYWtfbGNfaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJicmVha19sY19oaWRkZW5fcGl0Y2hfc3dheV9zcGVlZCI6OC4wLCJicmVha19sY19oaWRkZW5feWF3IjoiU2lkZXdheXMiLCJicmVha19sY19oaWRkZW5feWF3XzN3YXlfbWF4Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3XzN3YXlfbWluIjotOTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd181d2F5X21heCI6MTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfNXdheV9taW4iOi0xMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19jZW50ZXIiOjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19jdXN0b20iOjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19kaXN0b3J0aW9uX3JhbmdlIjo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X2Rpc3RvcnRpb25fc3BlZWQiOjguMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19wcm9ncmVzc2l2ZV9tYXgiOjEyMC4wLCJicmVha19sY19oaWRkZW5feWF3X3Byb2dyZXNzaXZlX21pbiI6LTEyMC4wLCJicmVha19sY19oaWRkZW5feWF3X3Byb2dyZXNzaXZlX3N0ZXAiOjIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcmFuZG9tX21heCI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19yYW5kb21fbWluIjotOTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19zaWRld2F5c19sZWZ0IjotOTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19zaWRld2F5c19yaWdodCI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19zcGluX3NwZWVkIjozMC4wLCJicmVha19sY190aWNrc19tYXgiOjE2LjAsImJyZWFrX2xjX3RpY2tzX21pbiI6MTYuMCwiYnJlYWtfbGNfdGlja3NfbW9kZSI6IlN0YXRpYyIsImJyZWFrX2xjX3RpY2tzX3JhbmRvbSI6MTYuMCwiYnJlYWtfbGNfdGlja3Nfc2VxX3N0ZXBzIjozLjAsImJyZWFrX2xjX3RpY2tzX3NlcXVlbmNlIjpbMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMF0sImJyZWFrX2xjX3RpY2tzX3N0YXRpYyI6MTYuMCwiaW52ZXJ0ZXJfYm9keSI6ZmFsc2UsImppdHRlcl9zcGVlZF9waGFzZV8xIjoxLjAsImppdHRlcl9zcGVlZF9waGFzZV8yIjoxLjAsImppdHRlcl9zcGVlZF9waGFzZV8zIjoxLjAsImppdHRlcl9zcGVlZF9waGFzZV80IjoxLjAsImppdHRlcl9zcGVlZF9waGFzZXNfc3dpdGNoX3NwZWVkIjoxLjAsImppdHRlcl9zcGVlZF90aWNrcyI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3NfbWF4IjoxLjAsImppdHRlcl9zcGVlZF90aWNrc19taW4iOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzX3NlcXVlbmNlIjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaml0dGVyX3NwZWVkX3RpY2tzX3N0ZXBzIjoyLjAsImppdHRlcl9zcGVlZF90aW1pbmdfbWF4IjoxLjAsImppdHRlcl9zcGVlZF90aW1pbmdfbWluIjoxLjAsImppdHRlcl9zcGVlZF90aW1pbmdfc2VxdWVuY2UiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJqaXR0ZXJfc3BlZWRfdGltaW5nX3N0ZXBzIjoyLjAsImppdHRlcl90aWNrc19tb2RlIjoiU3RhdGljIiwiaml0dGVyX3RpbWluZ19tb2RlIjoiTWluL01heCIsIm1vZGUiOiJTdGF0aWMiLCJvdmVycmlkZV9zdGF0ZSI6dHJ1ZSwic3dpdGNoX21ldGhvZCI6IlRpY2tzIiwieWF3X2FkZF9sZWZ0IjowLjAsInlhd19hZGRfbGVmdF9yYW5kb21pemUiOjAuMCwieWF3X2FkZF9yaWdodCI6MC4wLCJ5YXdfYWRkX3JpZ2h0X3JhbmRvbWl6ZSI6MC4wLCJ5YXdfYW1vdW50IjowLjAsInlhd19tb2RpZmllciI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyX2Ftb3VudCI6MC4wLCJ5YXdfbW9kaWZpZXJfYW1vdW50X21heCI6MC4wLCJ5YXdfbW9kaWZpZXJfYW1vdW50X21pbiI6MC4wLCJ5YXdfbW9kaWZpZXJfbW9kZSI6IlN0YXRpYyIsInlhd19tb2RpZmllcl9yYW5kb21pemUiOjAuMCwieWF3X21vZGlmaWVyX3NlcXVlbmNlIjpbMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wXSwieWF3X21vZGlmaWVyX3N0ZXBzIjoyLjAsInlhd19yYW5kb21pemUiOjAuMH1dLCJzZWxlY3Rfc3RhdGUiOiJTYWZlIEhlYWQiLCJ0d2Vha3MiOnsiYWxsb3dfb25fdXNlIjpmYWxzZSwiYWxsb3dfb25fdXNlX3lhd19iYXNlIjoiTG9jYWwgVmlldyIsImFudGlfYnJ1dGVmb3JjZSI6ZmFsc2UsImFudGlfYnJ1dGVmb3JjZV9jb25kaXRpb25zIjpbIn4iXSwiYW50aV9icnV0ZWZvcmNlX21vZGUiOiJJbmNyZWFzZSIsImFudGlfYnJ1dGVmb3JjZV90aW1lIjo4LjAsImZsaWNrX2V4cGxvaXQiOmZhbHNlLCJmcmVlc3RhbmRpbmciOmZhbHNlLCJmcmVlc3RhbmRpbmdfYm9keSI6ZmFsc2UsImZyZWVzdGFuZGluZ19kaXNhYmxlX3lhd19tb2RpZmllcnMiOnRydWUsImZyZWVzdGFuZGluZ19kaXNhYmxlcnMiOlsifiJdLCJtYW51YWxfeWF3IjoiRGlzYWJsZWQiLCJyb2xsIjpmYWxzZSwicm9sbF92YWx1ZSI6NTAuMCwic2FmZV9oZWFkIjpbIktuaWZlIiwiVGFzZXIiLCJ+Il19fSwib3RoZXIiOnsibWlzYyI6eyJhc3BlY3RfcmF0aW8iOnsiZW5hYmxlZCI6dHJ1ZSwicHJvcG9ydGlvbiI6MTMzLjB9LCJjbGFudGFnIjp0cnVlLCJmcHNfYm9vc3QiOnRydWUsInZpZXdfbW9kZWwiOnsiZW5hYmxlZCI6dHJ1ZSwiZm92Ijo2OC4wLCJ4IjoyNS4wLCJ5IjowLjAsInoiOi0xNS4wfX0sIm1vdmVtZW50Ijp7ImZhc3RfbGFkZGVyIjp0cnVlLCJuYWRlX3JlbGVhc2UiOnRydWUsIm5hZGVfcmVsZWFzZV9oZV9kYW1hZ2UiOjMwLjAsIm5hZGVfcmVsZWFzZV9tb2xvdG92X3JhbmdlIjoyMC4wLCJub19mYWxsX2RhbWFnZSI6dHJ1ZSwic3VwZXJfdG9zcyI6dHJ1ZX0sInJhZ2Vib3QiOnsiYWlfcGVlayI6eyJib3hfY29sb3IiOiIjNjlDREZGQjQiLCJlbmFibGVkIjpmYWxzZSwibWluX2RhbWFnZSI6MjAuMCwicHJlZGljdF90aWNrcyI6Ni4wLCJyYWRpdXMiOjQ4LjAsInJlcXVpcmVfYXV0b19wZWVrIjpmYWxzZSwic3BlZWQiOjcwLjB9LCJhaW1fbG9nZ2luZyI6eyJlbmFibGVkIjp0cnVlLCJoaXRsb2dzX3N0eWxlIjoiQWx0ZXJuYXRpdmUiLCJub3RpZnlfY29sb3IiOiIjNjlDREZGRkYiLCJvdXRwdXQiOlsiQ29uc29sZSIsIkV2ZW50IiwiTm90aWZ5IiwifiJdfSwiYXV0b193ZWFwb25fc3dpdGNoIjp7ImRlbGF5IjoxMDAuMCwiZW5hYmxlZCI6ZmFsc2UsInRyaWdnZXJzIjpbIn4iXSwid2VhcG9ucyI6IlByaW1hcnkifSwidW5sb2NrX2Zha2VfbGF0ZW5jeSI6dHJ1ZX0sInRhYnMiOjQuMCwidmlzdWFscyI6eyJkYW1hZ2VfaW5kaWNhdG9yIjp7ImNvbG9yIjoiI0ZGRkZGRkZGIiwiZW5hYmxlZCI6ZmFsc2UsImZvbnQiOiJEZWZhdWx0In0sIm1vZGVsX2NoYW5nZXIiOnsiY3RfbW9kZWwiOiJEaXNhYmxlZCIsImVuYWJsZWQiOnRydWUsInRfbW9kZWwiOiJQaXJhdGUifSwic2NvcGVfb3ZlcmxheSI6eyJhZGRpdGlvbnMiOlsifiJdLCJjb2xvciI6IiNGRkZGRkY4MCIsImVuYWJsZWQiOnRydWUsImV4Y2x1ZGVfbGluZXMiOlsifiJdLCJnYXAiOjguMCwic2l6ZSI6Mjg4LjB9LCJza2VldF9pbmRpY2F0b3JzIjp7IkJPRFkiOiJCT0RZIiwiREEiOiJEQSIsIkRUIjoiRFQiLCJEVUNLIjoiRFVDSyIsIkZTIjoiRlMiLCJIQyI6IkhDIiwiTUQiOiJNRCIsIk9TQUEiOiJPU0FBIiwiUElORyI6IlBJTkciLCJTQUZFIjoiU0FGRSIsImFuaW1hdGVkIjpmYWxzZSwiYW5pbWF0aW9uX3NwZWVkIjo4LjAsImN1c3RvbWl6ZSI6ZmFsc2UsImVuYWJsZWQiOnRydWUsIml0ZW1zIjpbIlBJTkciLCJEVCIsIk9TQUEiLCJEVUNLIiwiREEiLCJTQUZFIiwiQk9EWSIsIk1EIiwiSEMiLCJGUyIsIkM0IiwifiJdfX19LCJzZXR0aW5ncyI6eyJzaWRlYmFyIjp7ImNvbF9hIjoiI0EwRENGRkZGIiwiY29sX2IiOiIjRkZGRkZGRkYiLCJncmFkaWVudCI6dHJ1ZSwiaWNvbiI6InNub3dmbGFrZSIsInJhaW5ib3ciOmZhbHNlLCJzcGVlZCI6MzUuMCwidGV4dCI6ImZyb3N0Lmx1YSJ9LCJ3YXRlcm1hcmsiOnsiY29sX2EiOiIjRkZGRkZGRkYiLCJjb2xfYiI6IiNGRkZGRkZGRiIsImVmZmVjdHMiOlsiR3JhZGllbnQiLCJNYXRyaXgiLCJ+Il0sImZvbnQiOiJCb2xkIiwicmFpbmJvdyI6dHJ1ZSwidGV4dCI6IkZST1NURURFQlVHQSJ9fX1d"
	}
}
configdata.menu_list = configdata.menu_list or {
	[1] = "Default"
}
configdata.cfg_list[1][2] = "W3siYW50aV9haW0iOnsiYnVpbGRlciI6W3siYnJlYWtfbGMiOlsifiJdLCJicmVha19sY19oaWRkZW5fZW5hYmxlIjpmYWxzZSwiYnJlYWtfbGNfaGlkZGVuX3BpdGNoIjoiRGlzYWJsZWQiLCJicmVha19sY19oaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImJyZWFrX2xjX2hpZGRlbl9waXRjaF9zd2F5X3NwZWVkIjo4LjAsImJyZWFrX2xjX2hpZGRlbl95YXciOiJTaWRld2F5cyIsImJyZWFrX2xjX2hpZGRlbl95YXdfM3dheV9tYXgiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfM3dheV9taW4iOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3XzV3YXlfbWF4IjoxMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd181d2F5X21pbiI6LTEyMC4wLCJicmVha19sY19oaWRkZW5feWF3X2NlbnRlciI6MC4wLCJicmVha19sY19oaWRkZW5feWF3X2N1c3RvbSI6MC4wLCJicmVha19sY19oaWRkZW5feWF3X2Rpc3RvcnRpb25fcmFuZ2UiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfZGlzdG9ydGlvbl9zcGVlZCI6OC4wLCJicmVha19sY19oaWRkZW5feWF3X3Byb2dyZXNzaXZlX21heCI6MTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfbWluIjotMTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfc3RlcCI6MjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19yYW5kb21fbWF4Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X3JhbmRvbV9taW4iOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NpZGV3YXlzX2xlZnQiOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NpZGV3YXlzX3JpZ2h0Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NwaW5fc3BlZWQiOjMwLjAsImJyZWFrX2xjX3RpY2tzX21heCI6MTYuMCwiYnJlYWtfbGNfdGlja3NfbWluIjoxNi4wLCJicmVha19sY190aWNrc19tb2RlIjoiU3RhdGljIiwiYnJlYWtfbGNfdGlja3NfcmFuZG9tIjoxNi4wLCJicmVha19sY190aWNrc19zZXFfc3RlcHMiOjMuMCwiYnJlYWtfbGNfdGlja3Nfc2VxdWVuY2UiOlsxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wXSwiYnJlYWtfbGNfdGlja3Nfc3RhdGljIjoxNi4wLCJpbnZlcnRlcl9ib2R5IjpmYWxzZSwiaml0dGVyX3NwZWVkX3BoYXNlXzEiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzIiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzMiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzQiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlc19zd2l0Y2hfc3BlZWQiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzIjoxLjAsImppdHRlcl9zcGVlZF90aWNrc19tYXgiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzX21pbiI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3Nfc2VxdWVuY2UiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJqaXR0ZXJfc3BlZWRfdGlja3Nfc3RlcHMiOjIuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19tYXgiOjEuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19taW4iOjEuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19zZXF1ZW5jZSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImppdHRlcl9zcGVlZF90aW1pbmdfc3RlcHMiOjIuMCwiaml0dGVyX3RpY2tzX21vZGUiOiJTdGF0aWMiLCJqaXR0ZXJfdGltaW5nX21vZGUiOiJNaW4vTWF4IiwibW9kZSI6IkppdHRlciIsIm92ZXJyaWRlX3N0YXRlIjp0cnVlLCJzd2l0Y2hfbWV0aG9kIjoiVGlja3MiLCJ5YXdfYWRkX2xlZnQiOi0zOS4wLCJ5YXdfYWRkX2xlZnRfcmFuZG9taXplIjowLjAsInlhd19hZGRfcmlnaHQiOjM5LjAsInlhd19hZGRfcmlnaHRfcmFuZG9taXplIjowLjAsInlhd19hbW91bnQiOi00OS4wLCJ5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9hbW91bnQiOjAuMCwieWF3X21vZGlmaWVyX2Ftb3VudF9tYXgiOjAuMCwieWF3X21vZGlmaWVyX2Ftb3VudF9taW4iOjAuMCwieWF3X21vZGlmaWVyX21vZGUiOiJTdGF0aWMiLCJ5YXdfbW9kaWZpZXJfcmFuZG9taXplIjowLjAsInlhd19tb2RpZmllcl9zZXF1ZW5jZSI6WzAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMF0sInlhd19tb2RpZmllcl9zdGVwcyI6Mi4wLCJ5YXdfcmFuZG9taXplIjowLjB9LHsiYnJlYWtfbGMiOlsifiJdLCJicmVha19sY19oaWRkZW5fZW5hYmxlIjpmYWxzZSwiYnJlYWtfbGNfaGlkZGVuX3BpdGNoIjoiRGlzYWJsZWQiLCJicmVha19sY19oaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImJyZWFrX2xjX2hpZGRlbl9waXRjaF9zd2F5X3NwZWVkIjo4LjAsImJyZWFrX2xjX2hpZGRlbl95YXciOiJTaWRld2F5cyIsImJyZWFrX2xjX2hpZGRlbl95YXdfM3dheV9tYXgiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfM3dheV9taW4iOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3XzV3YXlfbWF4IjoxMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd181d2F5X21pbiI6LTEyMC4wLCJicmVha19sY19oaWRkZW5feWF3X2NlbnRlciI6MC4wLCJicmVha19sY19oaWRkZW5feWF3X2N1c3RvbSI6MC4wLCJicmVha19sY19oaWRkZW5feWF3X2Rpc3RvcnRpb25fcmFuZ2UiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfZGlzdG9ydGlvbl9zcGVlZCI6OC4wLCJicmVha19sY19oaWRkZW5feWF3X3Byb2dyZXNzaXZlX21heCI6MTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfbWluIjotMTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfc3RlcCI6MjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19yYW5kb21fbWF4Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X3JhbmRvbV9taW4iOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NpZGV3YXlzX2xlZnQiOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NpZGV3YXlzX3JpZ2h0Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NwaW5fc3BlZWQiOjMwLjAsImJyZWFrX2xjX3RpY2tzX21heCI6MTYuMCwiYnJlYWtfbGNfdGlja3NfbWluIjoxNi4wLCJicmVha19sY190aWNrc19tb2RlIjoiU3RhdGljIiwiYnJlYWtfbGNfdGlja3NfcmFuZG9tIjoxNi4wLCJicmVha19sY190aWNrc19zZXFfc3RlcHMiOjMuMCwiYnJlYWtfbGNfdGlja3Nfc2VxdWVuY2UiOlsxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wXSwiYnJlYWtfbGNfdGlja3Nfc3RhdGljIjoxNi4wLCJpbnZlcnRlcl9ib2R5IjpmYWxzZSwiaml0dGVyX3NwZWVkX3BoYXNlXzEiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzIiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzMiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzQiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlc19zd2l0Y2hfc3BlZWQiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzIjoxLjAsImppdHRlcl9zcGVlZF90aWNrc19tYXgiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzX21pbiI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3Nfc2VxdWVuY2UiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJqaXR0ZXJfc3BlZWRfdGlja3Nfc3RlcHMiOjIuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19tYXgiOjEuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19taW4iOjEuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19zZXF1ZW5jZSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImppdHRlcl9zcGVlZF90aW1pbmdfc3RlcHMiOjIuMCwiaml0dGVyX3RpY2tzX21vZGUiOiJTdGF0aWMiLCJqaXR0ZXJfdGltaW5nX21vZGUiOiJNaW4vTWF4IiwibW9kZSI6IkppdHRlciIsIm92ZXJyaWRlX3N0YXRlIjp0cnVlLCJzd2l0Y2hfbWV0aG9kIjoiVGlja3MiLCJ5YXdfYWRkX2xlZnQiOjAuMCwieWF3X2FkZF9sZWZ0X3JhbmRvbWl6ZSI6MC4wLCJ5YXdfYWRkX3JpZ2h0IjowLjAsInlhd19hZGRfcmlnaHRfcmFuZG9taXplIjowLjAsInlhd19hbW91bnQiOjAuMCwieWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfYW1vdW50IjowLjAsInlhd19tb2RpZmllcl9hbW91bnRfbWF4IjowLjAsInlhd19tb2RpZmllcl9hbW91bnRfbWluIjowLjAsInlhd19tb2RpZmllcl9tb2RlIjoiU3RhdGljIiwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZSI6MC4wLCJ5YXdfbW9kaWZpZXJfc2VxdWVuY2UiOlswLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjBdLCJ5YXdfbW9kaWZpZXJfc3RlcHMiOjIuMCwieWF3X3JhbmRvbWl6ZSI6MC4wfSx7ImJyZWFrX2xjIjpbIkRvdWJsZSBUYXAiLCJIaWRlIFNob3RzIiwifiJdLCJicmVha19sY19oaWRkZW5fZW5hYmxlIjpmYWxzZSwiYnJlYWtfbGNfaGlkZGVuX3BpdGNoIjoiRGlzYWJsZWQiLCJicmVha19sY19oaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImJyZWFrX2xjX2hpZGRlbl9waXRjaF9zd2F5X3NwZWVkIjo4LjAsImJyZWFrX2xjX2hpZGRlbl95YXciOiJTaWRld2F5cyIsImJyZWFrX2xjX2hpZGRlbl95YXdfM3dheV9tYXgiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfM3dheV9taW4iOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3XzV3YXlfbWF4IjoxMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd181d2F5X21pbiI6LTEyMC4wLCJicmVha19sY19oaWRkZW5feWF3X2NlbnRlciI6MC4wLCJicmVha19sY19oaWRkZW5feWF3X2N1c3RvbSI6MC4wLCJicmVha19sY19oaWRkZW5feWF3X2Rpc3RvcnRpb25fcmFuZ2UiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfZGlzdG9ydGlvbl9zcGVlZCI6OC4wLCJicmVha19sY19oaWRkZW5feWF3X3Byb2dyZXNzaXZlX21heCI6MTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfbWluIjotMTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfc3RlcCI6MjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19yYW5kb21fbWF4Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X3JhbmRvbV9taW4iOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NpZGV3YXlzX2xlZnQiOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NpZGV3YXlzX3JpZ2h0Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NwaW5fc3BlZWQiOjMwLjAsImJyZWFrX2xjX3RpY2tzX21heCI6MTYuMCwiYnJlYWtfbGNfdGlja3NfbWluIjoxNi4wLCJicmVha19sY190aWNrc19tb2RlIjoiU3RhdGljIiwiYnJlYWtfbGNfdGlja3NfcmFuZG9tIjoxNi4wLCJicmVha19sY190aWNrc19zZXFfc3RlcHMiOjMuMCwiYnJlYWtfbGNfdGlja3Nfc2VxdWVuY2UiOlsxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wXSwiYnJlYWtfbGNfdGlja3Nfc3RhdGljIjoxNi4wLCJpbnZlcnRlcl9ib2R5IjpmYWxzZSwiaml0dGVyX3NwZWVkX3BoYXNlXzEiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzIiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzMiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzQiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlc19zd2l0Y2hfc3BlZWQiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzIjoxLjAsImppdHRlcl9zcGVlZF90aWNrc19tYXgiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzX21pbiI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3Nfc2VxdWVuY2UiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJqaXR0ZXJfc3BlZWRfdGlja3Nfc3RlcHMiOjIuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19tYXgiOjEuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19taW4iOjEuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19zZXF1ZW5jZSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImppdHRlcl9zcGVlZF90aW1pbmdfc3RlcHMiOjIuMCwiaml0dGVyX3RpY2tzX21vZGUiOiJTdGF0aWMiLCJqaXR0ZXJfdGltaW5nX21vZGUiOiJNaW4vTWF4IiwibW9kZSI6IkppdHRlciIsIm92ZXJyaWRlX3N0YXRlIjp0cnVlLCJzd2l0Y2hfbWV0aG9kIjoiVGlja3MiLCJ5YXdfYWRkX2xlZnQiOi0xMi4wLCJ5YXdfYWRkX2xlZnRfcmFuZG9taXplIjowLjAsInlhd19hZGRfcmlnaHQiOjAuMCwieWF3X2FkZF9yaWdodF9yYW5kb21pemUiOjAuMCwieWF3X2Ftb3VudCI6MC4wLCJ5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9hbW91bnQiOjAuMCwieWF3X21vZGlmaWVyX2Ftb3VudF9tYXgiOjAuMCwieWF3X21vZGlmaWVyX2Ftb3VudF9taW4iOjAuMCwieWF3X21vZGlmaWVyX21vZGUiOiJTdGF0aWMiLCJ5YXdfbW9kaWZpZXJfcmFuZG9taXplIjowLjAsInlhd19tb2RpZmllcl9zZXF1ZW5jZSI6WzAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMF0sInlhd19tb2RpZmllcl9zdGVwcyI6Mi4wLCJ5YXdfcmFuZG9taXplIjowLjB9LHsiYnJlYWtfbGMiOlsiRG91YmxlIFRhcCIsIkhpZGUgU2hvdHMiLCJ+Il0sImJyZWFrX2xjX2hpZGRlbl9lbmFibGUiOmZhbHNlLCJicmVha19sY19oaWRkZW5fcGl0Y2giOiJEaXNhYmxlZCIsImJyZWFrX2xjX2hpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiYnJlYWtfbGNfaGlkZGVuX3BpdGNoX3N3YXlfc3BlZWQiOjguMCwiYnJlYWtfbGNfaGlkZGVuX3lhdyI6IlNpZGV3YXlzIiwiYnJlYWtfbGNfaGlkZGVuX3lhd18zd2F5X21heCI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd18zd2F5X21pbiI6LTkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfNXdheV9tYXgiOjEyMC4wLCJicmVha19sY19oaWRkZW5feWF3XzV3YXlfbWluIjotMTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfY2VudGVyIjowLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfY3VzdG9tIjowLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfZGlzdG9ydGlvbl9yYW5nZSI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19kaXN0b3J0aW9uX3NwZWVkIjo4LjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfbWF4IjoxMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19wcm9ncmVzc2l2ZV9taW4iOi0xMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19wcm9ncmVzc2l2ZV9zdGVwIjoyMC4wLCJicmVha19sY19oaWRkZW5feWF3X3JhbmRvbV9tYXgiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcmFuZG9tX21pbiI6LTkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfc2lkZXdheXNfbGVmdCI6LTkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfc2lkZXdheXNfcmlnaHQiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfc3Bpbl9zcGVlZCI6MzAuMCwiYnJlYWtfbGNfdGlja3NfbWF4IjoxNi4wLCJicmVha19sY190aWNrc19taW4iOjE2LjAsImJyZWFrX2xjX3RpY2tzX21vZGUiOiJTdGF0aWMiLCJicmVha19sY190aWNrc19yYW5kb20iOjE2LjAsImJyZWFrX2xjX3RpY2tzX3NlcV9zdGVwcyI6My4wLCJicmVha19sY190aWNrc19zZXF1ZW5jZSI6WzE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjBdLCJicmVha19sY190aWNrc19zdGF0aWMiOjE2LjAsImludmVydGVyX2JvZHkiOmZhbHNlLCJqaXR0ZXJfc3BlZWRfcGhhc2VfMSI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VfMiI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VfMyI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VfNCI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VzX3N3aXRjaF9zcGVlZCI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3MiOjMuMCwiaml0dGVyX3NwZWVkX3RpY2tzX21heCI6NS4wLCJqaXR0ZXJfc3BlZWRfdGlja3NfbWluIjozLjAsImppdHRlcl9zcGVlZF90aWNrc19zZXF1ZW5jZSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImppdHRlcl9zcGVlZF90aWNrc19zdGVwcyI6Mi4wLCJqaXR0ZXJfc3BlZWRfdGltaW5nX21heCI6MS4wLCJqaXR0ZXJfc3BlZWRfdGltaW5nX21pbiI6MS4wLCJqaXR0ZXJfc3BlZWRfdGltaW5nX3NlcXVlbmNlIjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaml0dGVyX3NwZWVkX3RpbWluZ19zdGVwcyI6Mi4wLCJqaXR0ZXJfdGlja3NfbW9kZSI6Ik1pbi9NYXgiLCJqaXR0ZXJfdGltaW5nX21vZGUiOiJNaW4vTWF4IiwibW9kZSI6IkppdHRlciIsIm92ZXJyaWRlX3N0YXRlIjp0cnVlLCJzd2l0Y2hfbWV0aG9kIjoiVGlja3MiLCJ5YXdfYWRkX2xlZnQiOi0zOS4wLCJ5YXdfYWRkX2xlZnRfcmFuZG9taXplIjowLjAsInlhd19hZGRfcmlnaHQiOjQ5LjAsInlhd19hZGRfcmlnaHRfcmFuZG9taXplIjowLjAsInlhd19hbW91bnQiOjAuMCwieWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfYW1vdW50IjowLjAsInlhd19tb2RpZmllcl9hbW91bnRfbWF4IjowLjAsInlhd19tb2RpZmllcl9hbW91bnRfbWluIjowLjAsInlhd19tb2RpZmllcl9tb2RlIjoiU3RhdGljIiwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZSI6MC4wLCJ5YXdfbW9kaWZpZXJfc2VxdWVuY2UiOlswLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjBdLCJ5YXdfbW9kaWZpZXJfc3RlcHMiOjIuMCwieWF3X3JhbmRvbWl6ZSI6MC4wfSx7ImJyZWFrX2xjIjpbIn4iXSwiYnJlYWtfbGNfaGlkZGVuX2VuYWJsZSI6ZmFsc2UsImJyZWFrX2xjX2hpZGRlbl9waXRjaCI6IkRpc2FibGVkIiwiYnJlYWtfbGNfaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJicmVha19sY19oaWRkZW5fcGl0Y2hfc3dheV9zcGVlZCI6OC4wLCJicmVha19sY19oaWRkZW5feWF3IjoiU2lkZXdheXMiLCJicmVha19sY19oaWRkZW5feWF3XzN3YXlfbWF4Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3XzN3YXlfbWluIjotOTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd181d2F5X21heCI6MTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfNXdheV9taW4iOi0xMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19jZW50ZXIiOjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19jdXN0b20iOjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19kaXN0b3J0aW9uX3JhbmdlIjo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X2Rpc3RvcnRpb25fc3BlZWQiOjguMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19wcm9ncmVzc2l2ZV9tYXgiOjEyMC4wLCJicmVha19sY19oaWRkZW5feWF3X3Byb2dyZXNzaXZlX21pbiI6LTEyMC4wLCJicmVha19sY19oaWRkZW5feWF3X3Byb2dyZXNzaXZlX3N0ZXAiOjIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcmFuZG9tX21heCI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19yYW5kb21fbWluIjotOTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19zaWRld2F5c19sZWZ0IjotOTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19zaWRld2F5c19yaWdodCI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19zcGluX3NwZWVkIjozMC4wLCJicmVha19sY190aWNrc19tYXgiOjE2LjAsImJyZWFrX2xjX3RpY2tzX21pbiI6MTYuMCwiYnJlYWtfbGNfdGlja3NfbW9kZSI6IlN0YXRpYyIsImJyZWFrX2xjX3RpY2tzX3JhbmRvbSI6MTYuMCwiYnJlYWtfbGNfdGlja3Nfc2VxX3N0ZXBzIjozLjAsImJyZWFrX2xjX3RpY2tzX3NlcXVlbmNlIjpbMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMF0sImJyZWFrX2xjX3RpY2tzX3N0YXRpYyI6MTYuMCwiaW52ZXJ0ZXJfYm9keSI6dHJ1ZSwiaml0dGVyX3NwZWVkX3BoYXNlXzEiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzIiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzMiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzQiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlc19zd2l0Y2hfc3BlZWQiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzIjoxLjAsImppdHRlcl9zcGVlZF90aWNrc19tYXgiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzX21pbiI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3Nfc2VxdWVuY2UiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJqaXR0ZXJfc3BlZWRfdGlja3Nfc3RlcHMiOjIuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19tYXgiOjEuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19taW4iOjEuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19zZXF1ZW5jZSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImppdHRlcl9zcGVlZF90aW1pbmdfc3RlcHMiOjIuMCwiaml0dGVyX3RpY2tzX21vZGUiOiJTdGF0aWMiLCJqaXR0ZXJfdGltaW5nX21vZGUiOiJNaW4vTWF4IiwibW9kZSI6IkppdHRlciIsIm92ZXJyaWRlX3N0YXRlIjp0cnVlLCJzd2l0Y2hfbWV0aG9kIjoiVGlja3MiLCJ5YXdfYWRkX2xlZnQiOi0xNS4wLCJ5YXdfYWRkX2xlZnRfcmFuZG9taXplIjowLjAsInlhd19hZGRfcmlnaHQiOjU4LjAsInlhd19hZGRfcmlnaHRfcmFuZG9taXplIjowLjAsInlhd19hbW91bnQiOjAuMCwieWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfYW1vdW50IjowLjAsInlhd19tb2RpZmllcl9hbW91bnRfbWF4IjowLjAsInlhd19tb2RpZmllcl9hbW91bnRfbWluIjowLjAsInlhd19tb2RpZmllcl9tb2RlIjoiU3RhdGljIiwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZSI6MC4wLCJ5YXdfbW9kaWZpZXJfc2VxdWVuY2UiOlswLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjBdLCJ5YXdfbW9kaWZpZXJfc3RlcHMiOjIuMCwieWF3X3JhbmRvbWl6ZSI6MC4wfSx7ImJyZWFrX2xjIjpbIn4iXSwiYnJlYWtfbGNfaGlkZGVuX2VuYWJsZSI6ZmFsc2UsImJyZWFrX2xjX2hpZGRlbl9waXRjaCI6IkRpc2FibGVkIiwiYnJlYWtfbGNfaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJicmVha19sY19oaWRkZW5fcGl0Y2hfc3dheV9zcGVlZCI6OC4wLCJicmVha19sY19oaWRkZW5feWF3IjoiU2lkZXdheXMiLCJicmVha19sY19oaWRkZW5feWF3XzN3YXlfbWF4Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3XzN3YXlfbWluIjotOTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd181d2F5X21heCI6MTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfNXdheV9taW4iOi0xMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19jZW50ZXIiOjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19jdXN0b20iOjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19kaXN0b3J0aW9uX3JhbmdlIjo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X2Rpc3RvcnRpb25fc3BlZWQiOjguMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19wcm9ncmVzc2l2ZV9tYXgiOjEyMC4wLCJicmVha19sY19oaWRkZW5feWF3X3Byb2dyZXNzaXZlX21pbiI6LTEyMC4wLCJicmVha19sY19oaWRkZW5feWF3X3Byb2dyZXNzaXZlX3N0ZXAiOjIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcmFuZG9tX21heCI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19yYW5kb21fbWluIjotOTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19zaWRld2F5c19sZWZ0IjotOTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19zaWRld2F5c19yaWdodCI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19zcGluX3NwZWVkIjozMC4wLCJicmVha19sY190aWNrc19tYXgiOjE2LjAsImJyZWFrX2xjX3RpY2tzX21pbiI6MTYuMCwiYnJlYWtfbGNfdGlja3NfbW9kZSI6IlN0YXRpYyIsImJyZWFrX2xjX3RpY2tzX3JhbmRvbSI6MTYuMCwiYnJlYWtfbGNfdGlja3Nfc2VxX3N0ZXBzIjozLjAsImJyZWFrX2xjX3RpY2tzX3NlcXVlbmNlIjpbMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMF0sImJyZWFrX2xjX3RpY2tzX3N0YXRpYyI6MTYuMCwiaW52ZXJ0ZXJfYm9keSI6ZmFsc2UsImppdHRlcl9zcGVlZF9waGFzZV8xIjoxLjAsImppdHRlcl9zcGVlZF9waGFzZV8yIjoxLjAsImppdHRlcl9zcGVlZF9waGFzZV8zIjoxLjAsImppdHRlcl9zcGVlZF9waGFzZV80IjoxLjAsImppdHRlcl9zcGVlZF9waGFzZXNfc3dpdGNoX3NwZWVkIjoxLjAsImppdHRlcl9zcGVlZF90aWNrcyI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3NfbWF4IjoxLjAsImppdHRlcl9zcGVlZF90aWNrc19taW4iOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzX3NlcXVlbmNlIjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaml0dGVyX3NwZWVkX3RpY2tzX3N0ZXBzIjoyLjAsImppdHRlcl9zcGVlZF90aW1pbmdfbWF4Ijo0LjAsImppdHRlcl9zcGVlZF90aW1pbmdfbWluIjozLjAsImppdHRlcl9zcGVlZF90aW1pbmdfc2VxdWVuY2UiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJqaXR0ZXJfc3BlZWRfdGltaW5nX3N0ZXBzIjoyLjAsImppdHRlcl90aWNrc19tb2RlIjoiU3RhdGljIiwiaml0dGVyX3RpbWluZ19tb2RlIjoiTWluL01heCIsIm1vZGUiOiJKaXR0ZXIiLCJvdmVycmlkZV9zdGF0ZSI6dHJ1ZSwic3dpdGNoX21ldGhvZCI6IlRpbWluZyIsInlhd19hZGRfbGVmdCI6LTI5LjAsInlhd19hZGRfbGVmdF9yYW5kb21pemUiOjAuMCwieWF3X2FkZF9yaWdodCI6NDQuMCwieWF3X2FkZF9yaWdodF9yYW5kb21pemUiOjAuMCwieWF3X2Ftb3VudCI6MC4wLCJ5YXdfbW9kaWZpZXIiOiJTcGluIiwieWF3X21vZGlmaWVyX2Ftb3VudCI6Ny4wLCJ5YXdfbW9kaWZpZXJfYW1vdW50X21heCI6MC4wLCJ5YXdfbW9kaWZpZXJfYW1vdW50X21pbiI6MC4wLCJ5YXdfbW9kaWZpZXJfbW9kZSI6IlN0YXRpYyIsInlhd19tb2RpZmllcl9yYW5kb21pemUiOjAuMCwieWF3X21vZGlmaWVyX3NlcXVlbmNlIjpbMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wXSwieWF3X21vZGlmaWVyX3N0ZXBzIjoyLjAsInlhd19yYW5kb21pemUiOjAuMH0seyJicmVha19sYyI6WyJ+Il0sImJyZWFrX2xjX2hpZGRlbl9lbmFibGUiOmZhbHNlLCJicmVha19sY19oaWRkZW5fcGl0Y2giOiJEaXNhYmxlZCIsImJyZWFrX2xjX2hpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiYnJlYWtfbGNfaGlkZGVuX3BpdGNoX3N3YXlfc3BlZWQiOjguMCwiYnJlYWtfbGNfaGlkZGVuX3lhdyI6IlNpZGV3YXlzIiwiYnJlYWtfbGNfaGlkZGVuX3lhd18zd2F5X21heCI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd18zd2F5X21pbiI6LTkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfNXdheV9tYXgiOjEyMC4wLCJicmVha19sY19oaWRkZW5feWF3XzV3YXlfbWluIjotMTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfY2VudGVyIjowLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfY3VzdG9tIjowLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfZGlzdG9ydGlvbl9yYW5nZSI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19kaXN0b3J0aW9uX3NwZWVkIjo4LjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfbWF4IjoxMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19wcm9ncmVzc2l2ZV9taW4iOi0xMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19wcm9ncmVzc2l2ZV9zdGVwIjoyMC4wLCJicmVha19sY19oaWRkZW5feWF3X3JhbmRvbV9tYXgiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcmFuZG9tX21pbiI6LTkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfc2lkZXdheXNfbGVmdCI6LTkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfc2lkZXdheXNfcmlnaHQiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfc3Bpbl9zcGVlZCI6MzAuMCwiYnJlYWtfbGNfdGlja3NfbWF4IjoxNi4wLCJicmVha19sY190aWNrc19taW4iOjE2LjAsImJyZWFrX2xjX3RpY2tzX21vZGUiOiJTdGF0aWMiLCJicmVha19sY190aWNrc19yYW5kb20iOjE2LjAsImJyZWFrX2xjX3RpY2tzX3NlcV9zdGVwcyI6My4wLCJicmVha19sY190aWNrc19zZXF1ZW5jZSI6WzE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjBdLCJicmVha19sY190aWNrc19zdGF0aWMiOjE2LjAsImludmVydGVyX2JvZHkiOmZhbHNlLCJqaXR0ZXJfc3BlZWRfcGhhc2VfMSI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VfMiI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VfMyI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VfNCI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VzX3N3aXRjaF9zcGVlZCI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3MiOjcuMCwiaml0dGVyX3NwZWVkX3RpY2tzX21heCI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3NfbWluIjoxLjAsImppdHRlcl9zcGVlZF90aWNrc19zZXF1ZW5jZSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImppdHRlcl9zcGVlZF90aWNrc19zdGVwcyI6Mi4wLCJqaXR0ZXJfc3BlZWRfdGltaW5nX21heCI6MS4wLCJqaXR0ZXJfc3BlZWRfdGltaW5nX21pbiI6MS4wLCJqaXR0ZXJfc3BlZWRfdGltaW5nX3NlcXVlbmNlIjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaml0dGVyX3NwZWVkX3RpbWluZ19zdGVwcyI6Mi4wLCJqaXR0ZXJfdGlja3NfbW9kZSI6IlN0YXRpYyIsImppdHRlcl90aW1pbmdfbW9kZSI6Ik1pbi9NYXgiLCJtb2RlIjoiSml0dGVyIiwib3ZlcnJpZGVfc3RhdGUiOnRydWUsInN3aXRjaF9tZXRob2QiOiJUaWNrcyIsInlhd19hZGRfbGVmdCI6LTUwLjAsInlhd19hZGRfbGVmdF9yYW5kb21pemUiOjAuMCwieWF3X2FkZF9yaWdodCI6NTAuMCwieWF3X2FkZF9yaWdodF9yYW5kb21pemUiOjAuMCwieWF3X2Ftb3VudCI6MC4wLCJ5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9hbW91bnQiOjAuMCwieWF3X21vZGlmaWVyX2Ftb3VudF9tYXgiOjAuMCwieWF3X21vZGlmaWVyX2Ftb3VudF9taW4iOjAuMCwieWF3X21vZGlmaWVyX21vZGUiOiJTdGF0aWMiLCJ5YXdfbW9kaWZpZXJfcmFuZG9taXplIjowLjAsInlhd19tb2RpZmllcl9zZXF1ZW5jZSI6WzAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMF0sInlhd19tb2RpZmllcl9zdGVwcyI6Mi4wLCJ5YXdfcmFuZG9taXplIjowLjB9LHsiYnJlYWtfbGMiOlsifiJdLCJicmVha19sY19oaWRkZW5fZW5hYmxlIjpmYWxzZSwiYnJlYWtfbGNfaGlkZGVuX3BpdGNoIjoiRGlzYWJsZWQiLCJicmVha19sY19oaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImJyZWFrX2xjX2hpZGRlbl9waXRjaF9zd2F5X3NwZWVkIjo4LjAsImJyZWFrX2xjX2hpZGRlbl95YXciOiJTaWRld2F5cyIsImJyZWFrX2xjX2hpZGRlbl95YXdfM3dheV9tYXgiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfM3dheV9taW4iOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3XzV3YXlfbWF4IjoxMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd181d2F5X21pbiI6LTEyMC4wLCJicmVha19sY19oaWRkZW5feWF3X2NlbnRlciI6MC4wLCJicmVha19sY19oaWRkZW5feWF3X2N1c3RvbSI6MC4wLCJicmVha19sY19oaWRkZW5feWF3X2Rpc3RvcnRpb25fcmFuZ2UiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfZGlzdG9ydGlvbl9zcGVlZCI6OC4wLCJicmVha19sY19oaWRkZW5feWF3X3Byb2dyZXNzaXZlX21heCI6MTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfbWluIjotMTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfc3RlcCI6MjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19yYW5kb21fbWF4Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X3JhbmRvbV9taW4iOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NpZGV3YXlzX2xlZnQiOi05MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NpZGV3YXlzX3JpZ2h0Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X3NwaW5fc3BlZWQiOjMwLjAsImJyZWFrX2xjX3RpY2tzX21heCI6MTYuMCwiYnJlYWtfbGNfdGlja3NfbWluIjoxNi4wLCJicmVha19sY190aWNrc19tb2RlIjoiU3RhdGljIiwiYnJlYWtfbGNfdGlja3NfcmFuZG9tIjoxNi4wLCJicmVha19sY190aWNrc19zZXFfc3RlcHMiOjMuMCwiYnJlYWtfbGNfdGlja3Nfc2VxdWVuY2UiOlsxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wXSwiYnJlYWtfbGNfdGlja3Nfc3RhdGljIjoxNi4wLCJpbnZlcnRlcl9ib2R5IjpmYWxzZSwiaml0dGVyX3NwZWVkX3BoYXNlXzEiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzIiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzMiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlXzQiOjEuMCwiaml0dGVyX3NwZWVkX3BoYXNlc19zd2l0Y2hfc3BlZWQiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzIjoxLjAsImppdHRlcl9zcGVlZF90aWNrc19tYXgiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzX21pbiI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3Nfc2VxdWVuY2UiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJqaXR0ZXJfc3BlZWRfdGlja3Nfc3RlcHMiOjIuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19tYXgiOjEuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19taW4iOjEuMCwiaml0dGVyX3NwZWVkX3RpbWluZ19zZXF1ZW5jZSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImppdHRlcl9zcGVlZF90aW1pbmdfc3RlcHMiOjIuMCwiaml0dGVyX3RpY2tzX21vZGUiOiJTdGF0aWMiLCJqaXR0ZXJfdGltaW5nX21vZGUiOiJNaW4vTWF4IiwibW9kZSI6IlN0YXRpYyIsIm92ZXJyaWRlX3N0YXRlIjpmYWxzZSwic3dpdGNoX21ldGhvZCI6IlRpY2tzIiwieWF3X2FkZF9sZWZ0IjowLjAsInlhd19hZGRfbGVmdF9yYW5kb21pemUiOjAuMCwieWF3X2FkZF9yaWdodCI6MC4wLCJ5YXdfYWRkX3JpZ2h0X3JhbmRvbWl6ZSI6MC4wLCJ5YXdfYW1vdW50IjowLjAsInlhd19tb2RpZmllciI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyX2Ftb3VudCI6MC4wLCJ5YXdfbW9kaWZpZXJfYW1vdW50X21heCI6MC4wLCJ5YXdfbW9kaWZpZXJfYW1vdW50X21pbiI6MC4wLCJ5YXdfbW9kaWZpZXJfbW9kZSI6IlN0YXRpYyIsInlhd19tb2RpZmllcl9yYW5kb21pemUiOjAuMCwieWF3X21vZGlmaWVyX3NlcXVlbmNlIjpbMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wXSwieWF3X21vZGlmaWVyX3N0ZXBzIjoyLjAsInlhd19yYW5kb21pemUiOjAuMH0seyJicmVha19sYyI6WyJ+Il0sImJyZWFrX2xjX2hpZGRlbl9lbmFibGUiOmZhbHNlLCJicmVha19sY19oaWRkZW5fcGl0Y2giOiJEaXNhYmxlZCIsImJyZWFrX2xjX2hpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiYnJlYWtfbGNfaGlkZGVuX3BpdGNoX3N3YXlfc3BlZWQiOjguMCwiYnJlYWtfbGNfaGlkZGVuX3lhdyI6IlNpZGV3YXlzIiwiYnJlYWtfbGNfaGlkZGVuX3lhd18zd2F5X21heCI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd18zd2F5X21pbiI6LTkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfNXdheV9tYXgiOjEyMC4wLCJicmVha19sY19oaWRkZW5feWF3XzV3YXlfbWluIjotMTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfY2VudGVyIjowLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfY3VzdG9tIjowLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfZGlzdG9ydGlvbl9yYW5nZSI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19kaXN0b3J0aW9uX3NwZWVkIjo4LjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcHJvZ3Jlc3NpdmVfbWF4IjoxMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19wcm9ncmVzc2l2ZV9taW4iOi0xMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19wcm9ncmVzc2l2ZV9zdGVwIjoyMC4wLCJicmVha19sY19oaWRkZW5feWF3X3JhbmRvbV9tYXgiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcmFuZG9tX21pbiI6LTkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfc2lkZXdheXNfbGVmdCI6LTkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfc2lkZXdheXNfcmlnaHQiOjkwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfc3Bpbl9zcGVlZCI6MzAuMCwiYnJlYWtfbGNfdGlja3NfbWF4IjoxNi4wLCJicmVha19sY190aWNrc19taW4iOjE2LjAsImJyZWFrX2xjX3RpY2tzX21vZGUiOiJTdGF0aWMiLCJicmVha19sY190aWNrc19yYW5kb20iOjE2LjAsImJyZWFrX2xjX3RpY2tzX3NlcV9zdGVwcyI6My4wLCJicmVha19sY190aWNrc19zZXF1ZW5jZSI6WzE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjBdLCJicmVha19sY190aWNrc19zdGF0aWMiOjE2LjAsImludmVydGVyX2JvZHkiOmZhbHNlLCJqaXR0ZXJfc3BlZWRfcGhhc2VfMSI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VfMiI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VfMyI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VfNCI6MS4wLCJqaXR0ZXJfc3BlZWRfcGhhc2VzX3N3aXRjaF9zcGVlZCI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3MiOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzX21heCI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3NfbWluIjoxLjAsImppdHRlcl9zcGVlZF90aWNrc19zZXF1ZW5jZSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImppdHRlcl9zcGVlZF90aWNrc19zdGVwcyI6Mi4wLCJqaXR0ZXJfc3BlZWRfdGltaW5nX21heCI6MS4wLCJqaXR0ZXJfc3BlZWRfdGltaW5nX21pbiI6MS4wLCJqaXR0ZXJfc3BlZWRfdGltaW5nX3NlcXVlbmNlIjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaml0dGVyX3NwZWVkX3RpbWluZ19zdGVwcyI6Mi4wLCJqaXR0ZXJfdGlja3NfbW9kZSI6IlN0YXRpYyIsImppdHRlcl90aW1pbmdfbW9kZSI6Ik1pbi9NYXgiLCJtb2RlIjoiU3RhdGljIiwib3ZlcnJpZGVfc3RhdGUiOmZhbHNlLCJzd2l0Y2hfbWV0aG9kIjoiVGlja3MiLCJ5YXdfYWRkX2xlZnQiOjAuMCwieWF3X2FkZF9sZWZ0X3JhbmRvbWl6ZSI6MC4wLCJ5YXdfYWRkX3JpZ2h0IjowLjAsInlhd19hZGRfcmlnaHRfcmFuZG9taXplIjowLjAsInlhd19hbW91bnQiOjAuMCwieWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfYW1vdW50IjowLjAsInlhd19tb2RpZmllcl9hbW91bnRfbWF4IjowLjAsInlhd19tb2RpZmllcl9hbW91bnRfbWluIjowLjAsInlhd19tb2RpZmllcl9tb2RlIjoiU3RhdGljIiwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZSI6MC4wLCJ5YXdfbW9kaWZpZXJfc2VxdWVuY2UiOlswLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjBdLCJ5YXdfbW9kaWZpZXJfc3RlcHMiOjIuMCwieWF3X3JhbmRvbWl6ZSI6MC4wfSx7ImJyZWFrX2xjIjpbIn4iXSwiYnJlYWtfbGNfaGlkZGVuX2VuYWJsZSI6ZmFsc2UsImJyZWFrX2xjX2hpZGRlbl9waXRjaCI6IkRpc2FibGVkIiwiYnJlYWtfbGNfaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJicmVha19sY19oaWRkZW5fcGl0Y2hfc3dheV9zcGVlZCI6OC4wLCJicmVha19sY19oaWRkZW5feWF3IjoiU2lkZXdheXMiLCJicmVha19sY19oaWRkZW5feWF3XzN3YXlfbWF4Ijo5MC4wLCJicmVha19sY19oaWRkZW5feWF3XzN3YXlfbWluIjotOTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd181d2F5X21heCI6MTIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfNXdheV9taW4iOi0xMjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19jZW50ZXIiOjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19jdXN0b20iOjAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19kaXN0b3J0aW9uX3JhbmdlIjo5MC4wLCJicmVha19sY19oaWRkZW5feWF3X2Rpc3RvcnRpb25fc3BlZWQiOjguMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19wcm9ncmVzc2l2ZV9tYXgiOjEyMC4wLCJicmVha19sY19oaWRkZW5feWF3X3Byb2dyZXNzaXZlX21pbiI6LTEyMC4wLCJicmVha19sY19oaWRkZW5feWF3X3Byb2dyZXNzaXZlX3N0ZXAiOjIwLjAsImJyZWFrX2xjX2hpZGRlbl95YXdfcmFuZG9tX21heCI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19yYW5kb21fbWluIjotOTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19zaWRld2F5c19sZWZ0IjotOTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19zaWRld2F5c19yaWdodCI6OTAuMCwiYnJlYWtfbGNfaGlkZGVuX3lhd19zcGluX3NwZWVkIjozMC4wLCJicmVha19sY190aWNrc19tYXgiOjE2LjAsImJyZWFrX2xjX3RpY2tzX21pbiI6MTYuMCwiYnJlYWtfbGNfdGlja3NfbW9kZSI6IlN0YXRpYyIsImJyZWFrX2xjX3RpY2tzX3JhbmRvbSI6MTYuMCwiYnJlYWtfbGNfdGlja3Nfc2VxX3N0ZXBzIjozLjAsImJyZWFrX2xjX3RpY2tzX3NlcXVlbmNlIjpbMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMCwxNi4wLDE2LjAsMTYuMF0sImJyZWFrX2xjX3RpY2tzX3N0YXRpYyI6MTYuMCwiaW52ZXJ0ZXJfYm9keSI6ZmFsc2UsImppdHRlcl9zcGVlZF9waGFzZV8xIjoxLjAsImppdHRlcl9zcGVlZF9waGFzZV8yIjoxLjAsImppdHRlcl9zcGVlZF9waGFzZV8zIjoxLjAsImppdHRlcl9zcGVlZF9waGFzZV80IjoxLjAsImppdHRlcl9zcGVlZF9waGFzZXNfc3dpdGNoX3NwZWVkIjoxLjAsImppdHRlcl9zcGVlZF90aWNrcyI6MS4wLCJqaXR0ZXJfc3BlZWRfdGlja3NfbWF4IjoxLjAsImppdHRlcl9zcGVlZF90aWNrc19taW4iOjEuMCwiaml0dGVyX3NwZWVkX3RpY2tzX3NlcXVlbmNlIjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaml0dGVyX3NwZWVkX3RpY2tzX3N0ZXBzIjoyLjAsImppdHRlcl9zcGVlZF90aW1pbmdfbWF4IjoxLjAsImppdHRlcl9zcGVlZF90aW1pbmdfbWluIjoxLjAsImppdHRlcl9zcGVlZF90aW1pbmdfc2VxdWVuY2UiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJqaXR0ZXJfc3BlZWRfdGltaW5nX3N0ZXBzIjoyLjAsImppdHRlcl90aWNrc19tb2RlIjoiU3RhdGljIiwiaml0dGVyX3RpbWluZ19tb2RlIjoiTWluL01heCIsIm1vZGUiOiJTdGF0aWMiLCJvdmVycmlkZV9zdGF0ZSI6dHJ1ZSwic3dpdGNoX21ldGhvZCI6IlRpY2tzIiwieWF3X2FkZF9sZWZ0IjowLjAsInlhd19hZGRfbGVmdF9yYW5kb21pemUiOjAuMCwieWF3X2FkZF9yaWdodCI6MC4wLCJ5YXdfYWRkX3JpZ2h0X3JhbmRvbWl6ZSI6MC4wLCJ5YXdfYW1vdW50IjowLjAsInlhd19tb2RpZmllciI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyX2Ftb3VudCI6MC4wLCJ5YXdfbW9kaWZpZXJfYW1vdW50X21heCI6MC4wLCJ5YXdfbW9kaWZpZXJfYW1vdW50X21pbiI6MC4wLCJ5YXdfbW9kaWZpZXJfbW9kZSI6IlN0YXRpYyIsInlhd19tb2RpZmllcl9yYW5kb21pemUiOjAuMCwieWF3X21vZGlmaWVyX3NlcXVlbmNlIjpbMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wXSwieWF3X21vZGlmaWVyX3N0ZXBzIjoyLjAsInlhd19yYW5kb21pemUiOjAuMH1dLCJzZWxlY3Rfc3RhdGUiOiJTYWZlIEhlYWQiLCJ0d2Vha3MiOnsiYWxsb3dfb25fdXNlIjpmYWxzZSwiYWxsb3dfb25fdXNlX3lhd19iYXNlIjoiTG9jYWwgVmlldyIsImFudGlfYnJ1dGVmb3JjZSI6ZmFsc2UsImFudGlfYnJ1dGVmb3JjZV9jb25kaXRpb25zIjpbIn4iXSwiYW50aV9icnV0ZWZvcmNlX21vZGUiOiJJbmNyZWFzZSIsImFudGlfYnJ1dGVmb3JjZV90aW1lIjo4LjAsImZsaWNrX2V4cGxvaXQiOmZhbHNlLCJmcmVlc3RhbmRpbmciOmZhbHNlLCJmcmVlc3RhbmRpbmdfYm9keSI6ZmFsc2UsImZyZWVzdGFuZGluZ19kaXNhYmxlX3lhd19tb2RpZmllcnMiOnRydWUsImZyZWVzdGFuZGluZ19kaXNhYmxlcnMiOlsifiJdLCJtYW51YWxfeWF3IjoiRGlzYWJsZWQiLCJyb2xsIjpmYWxzZSwicm9sbF92YWx1ZSI6NTAuMCwic2FmZV9oZWFkIjpbIktuaWZlIiwiVGFzZXIiLCJ+Il19fSwib3RoZXIiOnsibWlzYyI6eyJhc3BlY3RfcmF0aW8iOnsiZW5hYmxlZCI6dHJ1ZSwicHJvcG9ydGlvbiI6MTMzLjB9LCJjbGFudGFnIjp0cnVlLCJmcHNfYm9vc3QiOnRydWUsInZpZXdfbW9kZWwiOnsiZW5hYmxlZCI6dHJ1ZSwiZm92Ijo2OC4wLCJ4IjoyNS4wLCJ5IjowLjAsInoiOi0xNS4wfX0sIm1vdmVtZW50Ijp7ImZhc3RfbGFkZGVyIjp0cnVlLCJuYWRlX3JlbGVhc2UiOnRydWUsIm5hZGVfcmVsZWFzZV9oZV9kYW1hZ2UiOjMwLjAsIm5hZGVfcmVsZWFzZV9tb2xvdG92X3JhbmdlIjoyMC4wLCJub19mYWxsX2RhbWFnZSI6dHJ1ZSwic3VwZXJfdG9zcyI6dHJ1ZX0sInJhZ2Vib3QiOnsiYWlfcGVlayI6eyJib3hfY29sb3IiOiIjNjlDREZGQjQiLCJlbmFibGVkIjpmYWxzZSwibWluX2RhbWFnZSI6MjAuMCwicHJlZGljdF90aWNrcyI6Ni4wLCJyYWRpdXMiOjQ4LjAsInJlcXVpcmVfYXV0b19wZWVrIjpmYWxzZSwic3BlZWQiOjcwLjB9LCJhaW1fbG9nZ2luZyI6eyJlbmFibGVkIjp0cnVlLCJoaXRsb2dzX3N0eWxlIjoiQWx0ZXJuYXRpdmUiLCJub3RpZnlfY29sb3IiOiIjNjlDREZGRkYiLCJvdXRwdXQiOlsiQ29uc29sZSIsIkV2ZW50IiwiTm90aWZ5IiwifiJdfSwiYXV0b193ZWFwb25fc3dpdGNoIjp7ImRlbGF5IjoxMDAuMCwiZW5hYmxlZCI6ZmFsc2UsInRyaWdnZXJzIjpbIn4iXSwid2VhcG9ucyI6IlByaW1hcnkifSwidW5sb2NrX2Zha2VfbGF0ZW5jeSI6dHJ1ZX0sInRhYnMiOjQuMCwidmlzdWFscyI6eyJkYW1hZ2VfaW5kaWNhdG9yIjp7ImNvbG9yIjoiI0ZGRkZGRkZGIiwiZW5hYmxlZCI6ZmFsc2UsImZvbnQiOiJEZWZhdWx0In0sIm1vZGVsX2NoYW5nZXIiOnsiY3RfbW9kZWwiOiJEaXNhYmxlZCIsImVuYWJsZWQiOnRydWUsInRfbW9kZWwiOiJQaXJhdGUifSwic2NvcGVfb3ZlcmxheSI6eyJhZGRpdGlvbnMiOlsifiJdLCJjb2xvciI6IiNGRkZGRkY4MCIsImVuYWJsZWQiOnRydWUsImV4Y2x1ZGVfbGluZXMiOlsifiJdLCJnYXAiOjguMCwic2l6ZSI6Mjg4LjB9LCJza2VldF9pbmRpY2F0b3JzIjp7IkJPRFkiOiJCT0RZIiwiREEiOiJEQSIsIkRUIjoiRFQiLCJEVUNLIjoiRFVDSyIsIkZTIjoiRlMiLCJIQyI6IkhDIiwiTUQiOiJNRCIsIk9TQUEiOiJPU0FBIiwiUElORyI6IlBJTkciLCJTQUZFIjoiU0FGRSIsImFuaW1hdGVkIjpmYWxzZSwiYW5pbWF0aW9uX3NwZWVkIjo4LjAsImN1c3RvbWl6ZSI6ZmFsc2UsImVuYWJsZWQiOnRydWUsIml0ZW1zIjpbIlBJTkciLCJEVCIsIk9TQUEiLCJEVUNLIiwiREEiLCJTQUZFIiwiQk9EWSIsIk1EIiwiSEMiLCJGUyIsIkM0IiwifiJdfX19LCJzZXR0aW5ncyI6eyJzaWRlYmFyIjp7ImNvbF9hIjoiI0EwRENGRkZGIiwiY29sX2IiOiIjRkZGRkZGRkYiLCJncmFkaWVudCI6dHJ1ZSwiaWNvbiI6InNub3dmbGFrZSIsInJhaW5ib3ciOmZhbHNlLCJzcGVlZCI6MzUuMCwidGV4dCI6ImZyb3N0Lmx1YSJ9LCJ3YXRlcm1hcmsiOnsiY29sX2EiOiIjRkZGRkZGRkYiLCJjb2xfYiI6IiNGRkZGRkZGRiIsImVmZmVjdHMiOlsiR3JhZGllbnQiLCJNYXRyaXgiLCJ+Il0sImZvbnQiOiJCb2xkIiwicmFpbmJvdyI6dHJ1ZSwidGV4dCI6IkZST1NURURFQlVHQSJ9fX1d"

function t50.save_config(p248)
	-- upvalues: v308 (copy), base64 (copy)
	if p248 ~= 1 then
		local v1150 = v308:save()

		configdata.cfg_list[p248][2] = base64.encode(json.stringify(v1150))
		cvar.play:call("ambient\\tones\\elev1")
		db.cfg_dbggg151435143 = configdata

		return
	end
end
function t50.update_values(p249)
	local v1152 = configdata.cfg_list[p249][1] .. "\a{Link Active} ~ Loaded"

	for i, v in ipairs(configdata.cfg_list) do
		configdata.menu_list[i] = v[1]
	end

	configdata.menu_list[p249] = v1152
end
function t50.create_config(p250)
	if type(p250) == "string" then
		if p250 ~= nil and p250 ~= "" and p250 ~= " " then
			for i = #configdata.menu_list, 1, -1 do
				if p250 == configdata.menu_list[i] then
					common.add_notify("\vFrost", "Config with this name has already been created")

					return
				end
			end

			if not (#configdata.cfg_list > 6) then
				local t51 = {
					[1] = nil,
					[2] = "",
					[1] = p250
				}

				table.insert(configdata.cfg_list, t51)
				table.insert(configdata.menu_list, p250)
				db.cfg_dbggg151435143 = configdata

				return
			end

			common.add_notify("\vFrost", "Too much configs")

			return
		end

		return
	end
end
function t50.remove_config(p251)
	if p251 ~= 1 then
		local v1159 = configdata.cfg_list[p251][1]

		for i = #configdata.cfg_list, 1, -1 do
			if v1159 == configdata.cfg_list[i][1] then
				table.remove(configdata.cfg_list, i)
				table.remove(configdata.menu_list, i)
			end
		end

		db.cfg_dbggg151435143 = configdata

		return
	end
end
function t50.load_config(p252)
	-- upvalues: v308 (copy), base64 (copy)
	if configdata.cfg_list[p252][2] ~= nil and configdata.cfg_list[p252][2] ~= "" then
		if not (p252 > #configdata.cfg_list) then
			v308:load(json.parse(base64.decode(configdata.cfg_list[p252][2])))
			cvar.play:call("ambient\\tones\\elev1")

			return
		end

		print("Error[data_base[" .. p252 .. "]]")

		return
	end

	print("Error[data_base[" .. p252 .. "]]")
end

configs = {
	cfg_selector = t6.groups.home.config_system:list("", configdata.menu_list),
	name = t6.groups.home.config_system:input("\f<bars>" .. "  Config name"),
	create = t6.groups.home.config_system:button(" \aA3A6DBFF\f<wand-magic-sparkles> ", function()
		-- upvalues: t50 (copy)
		t50.create_config(configs.name:get())
		configs.cfg_selector:update(configdata.menu_list)
	end, true):tooltip("\aA3A6DBFFCreate\aDEFAULT config"),
	remove = t6.groups.home.config_system:button(" \aA86464FF\f<trash-can-xmark> ", function()
		-- upvalues: t50 (copy)
		t50.remove_config(configs.cfg_selector:get())
		configs.cfg_selector:update(configdata.menu_list)
	end, true):tooltip("\aA86464FFRemove\aDEFAULT config"),
	import = t6.groups.home.config_system:button(" \vImport ", function()
		-- upvalues: v308 (copy), base64 (copy), clipboard (copy)
		v308:load(json.parse(base64.decode(clipboard.get())))
		cvar.play:call("ambient\\tones\\elev1")
	end, true),
	export = t6.groups.home.config_system:button(" \vExport ", function()
		-- upvalues: clipboard (copy), base64 (copy), v308 (copy)
		clipboard.set(base64.encode(json.stringify(v308:save())))
		cvar.play:call("ambient\\tones\\elev1")
	end, true),
	save = t6.groups.home.config_system:button(" \a90E190FF\f<download> ", function()
		-- upvalues: t50 (copy)
		t50.save_config(configs.cfg_selector:get())
	end, true):tooltip("\a90E190FFSave\aDEFAULT config"),
	load = t6.groups.home.config_system:button(" \aA3A6DBFF\f<upload> ", function()
		-- upvalues: t50 (copy)
		t50.update_values(configs.cfg_selector:get())
		t50.load_config(configs.cfg_selector:get())
		configs.cfg_selector:update(configdata.menu_list)
	end, true):tooltip("\aA3A6DBFFLoad\aDEFAULT config")
}
