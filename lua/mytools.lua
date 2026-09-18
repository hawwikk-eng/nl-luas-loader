local world_to_screen = render.world_to_screen
local _ = rage.exploit
local get_binds = ui.get_binds
local get_alpha = ui.get_alpha
local _ = entity.get_players
local _ = entity.get
local _ = entity.get_entities
local _ = entity.get_game_rules
local _ = common.set_clan_tag
local _ = common.is_button_down
local get_username = common.get_username
local _ = common.get_date
local cast = ffi.cast
local _ = ffi.typeof
local _ = render.gradient
local text2 = render.text
local texture = render.texture
local rect_outline = render.rect_outline
local _ = render.rect
local get_local_player = entity.get_local_player
local create = ui.create
local get_style = ui.get_style
local _ = math.floor
local _ = math.abs
local _ = math.max
local _ = math.ceil
local _ = math.min
local random = math.random
local _ = utils.trace_bullet
local screen_size = render.screen_size
local _ = render.load_font
local _ = render.load_image_from_file
local measure_text = render.measure_text
local _ = render.poly
local _ = render.poly_blur
local add_notify = common.add_notify
local _ = common.add_event
local _ = utils.console_exec
local _ = utils.execute_after
local create_interface = utils.create_interface
local trace_line = utils.trace_line
local find = ui.find
local _ = entity.get_threat
local format = string.format
local get_player_resource = entity.get_player_resource
local get_unixtime = common.get_unixtime
local insert = table.insert
local clipboard = require("neverlose/clipboard")
local base64 = require("neverlose/base64")
local drag_system = require("neverlose/drag_system")
local smoothy = require("neverlose/smoothy")
local get_defensive = require("neverlose/get_defensive")
local md5 = require("neverlose/md5")

require("neverlose/inspect")

local events = require("neverlose/events")

require("table.clear")
require("neverlose/websockets")
require("neverlose/sec-base64")
require("neverlose/md5");
(function()
	-- upvalues: get_style (copy)
	cvar.clear:call()
	print_raw("\a" ..
	get_style("Link Active"):to_hex() .. "mytools \a85858DFF· \aDEFAULTWelcome, " .. common.get_username() .. "!")
end)()
ffi.cdef(
"    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n\n    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder; //0x0014\n        int m_nSequence; //0x0018\n        float m_flPrevCycle; //0x001C\n        float m_flWeight; //0x0020\n        float m_flWeightDeltaRate; //0x0024\n        float m_flPlaybackRate; //0x0028\n        float m_flCycle; //0x002C\n        void *m_pOwner; //0x0030\n        char  pad_0038[4]; //0x0034\n    } c_animlayers;\n")

local function v55(p1, p2, p3)
	if p1 < p2 and p2 then
		p1 = p2
	end

	if p3 < p1 and p3 then
		p1 = p3
	end

	return p1
end

function lerp(p4, p5, p6)
	return p5 * (1 - p4) + p6 * p4
end

function contains(p7, p8)
	for i = 1, #p7 do
		if p8 == p7[i] then
			return true
		end
	end
end

files.create_folder("nl/scripts/mytools")

local v56 = ffi.cast(ffi.typeof("uintptr_t**"), utils.create_interface("client.dll", "VClientEntityList003"))
local v57 = (function(p9, p10)
	return function(...)
		-- upvalues: p9 (copy), p10 (copy)
		return p9(p10, ...)
	end
end)(ffi.cast("get_client_entity_t", v56[0][3]), v56)
local v58 = ffi.cast(ffi.typeof("void***"), utils.create_interface("engine.dll", "VEngineClient014"))
local v59 = ffi.cast(ffi.typeof("bool(__thiscall*)(void*)"), v58[0][11])
local v60 = render.load_font("Calibri Bold", vector(25, 22, -1), "a, d")
local v61 = render.load_font("Verdana", 20, "a")

render.load_font("Verdana", 13, "a, d, b")
ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"):set("Quick Switch", "Auto Pistols")

local v62 = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"):get()
local v63 = get_style("Link Active"):to_hex()

get_style("Link"):to_hex()

local t1 = {}
local u65 = smoothy.new(anim_tbl)
local t2 = {}
local t3 = {}
local t4 = {}

function check_windows()
	-- upvalues: t4 (ref), t3 (copy)
	t4 = {}

	for i = 1, 4 do
		if ui.find("Miscellaneous", "Main", "Other", "Windows"):get()[i] ~= nil and not contains(t3, ui.find("Miscellaneous", "Main", "Other", "Windows"):get()[i]) then
			table.insert(t4, ui.find("Miscellaneous", "Main", "Other", "Windows"):get()[i])
		end
	end

	ui.find("Miscellaneous", "Main", "Other", "Windows"):set(t4)
end

function t2.math_breathe(p11, p12)
	return math.abs(math.sin(globals.realtime * (p12 or 1) % math.pi + (p11 or 0)))
end

function t2.typing_text(p13, p14)
	-- upvalues: format (copy)
	length = #p13:gsub("[\128-\191]", "")
	num = 0
	result = ""

	for match in p13:gmatch(".[\128-\191]*") do
		num = num + 1
		factor = num / length
		result = format("%s\a%s%s", result, p14(num, length, match, factor):to_hex(), match)
	end

	return result
end

function t2.gradient_text(p15, p16, p17)
	-- upvalues: t2 (copy)
	return t2.typing_text(p15, function(_, _, _, p21)
		-- upvalues: p16 (copy), p17 (copy)
		return p16:lerp(p17, p21)
	end)
end

function t2.gradient(p22, p23, p24, p25)
	-- upvalues: t2 (copy)
	return t2.typing_text(p22, function(_, _, _, p29)
		-- upvalues: t2 (copy), p25 (copy), p23 (copy), p24 (copy)
		interpolation = t2.math_breathe(p29, p25)

		return p23:lerp(p24, interpolation)
	end)
end

function t2.static_gradient(p30, p31, p32)
	-- upvalues: t2 (copy)
	return t2.gradient_text(p30, p31, p32)
end

local function v69(p33, p34, p35, p36, p37, ...)
	-- upvalues: t1 (copy), u65 (ref), smoothy (copy)
	table.concat({ ... })

	if t1[p33] == nil then
		t1[p33] = 0
		u65 = smoothy.new(t1)
	end

	local v202 = u65(0.1, {
		[p33] = render.measure_text(p35, nil, ...)
	})[p33]
	local v203 = render.measure_text(p35, nil, ...)

	render.push_clip_rect(vector(p34.x - v203.x, p34.y - v202.y / 2), vector(p34.x + v202.x / 2, p34.y + v202.y / 2),
		true)
	render.text(p35, vector(p34.x - v202.x / 2, p34.y - v202.y / 2), p36, p37, ...)
	render.pop_clip_rect()
end
local function v70(p38)
	if type(getmetatable(p38)) ~= "table" or not p38.__type then
		if type(p38) == "boolean" then
			p38 = p38 and 1 or 0
		end

		return type(p38)
	end

	return p38.__type.name:lower()
end

local v71 = new_class():struct("cheat")({
	version = "Release",
	screen_size = screen_size(),
	username = get_username()
}):struct("impt")({
	play_sound = function(p39, p40)
		-- upvalues: cast (copy), create_interface (copy)
		local v207 = cast("void***", create_interface("engine.dll", "IEngineSoundClient003")) or
		error("Failed to find IEngineSoundClient003!")

		return cast("void(__thiscall*)(void*, const char*, float, int, int, float)", v207[0][12])(v207, p39, p40, 100, 0,
			0)
	end
}):struct("menu")({
	var_update = {},
	init = function(p41)
		-- upvalues: create (copy), events (copy), get_style (copy), add_notify (copy), base64 (copy), v70 (copy), get_alpha (copy), t2 (copy), screen_size (copy)
		local v209 = create("General", "Tabs")
		local v210 = create("General", "Info", 2)
		local v211 = create("General", "Settings", 1)
		local v212 = create("General", "Links", 2)
		local v213 = create("General", "Local Presets", 1)
		local v214 = create("General", "Local Configs", 1)
		local v215 = create("General", "Cloud Configs", 2)
		local v216 = create("General", "Cheat Additionals", 2)
		local v217 = create("General", "AA Misc", 1)
		local v218 = create("General", "Anti Aim Settings", 2)
		local v219 = create("General", "Conditions", 2)
		local v220 = create("General", "Misc", 2)
		local v221 = create("General", "Rage Bot", 1)
		local v222 = create("General", "Indicators", 2)
		local v223 = create("General", "Other", 1)

		v210:label("\a{Link Active}\239\128\135   \aDEFAULTWelcome, \a{Link Active}" .. common.get_username() .. "!")
		v210:label("\a{Link Active}\239\132\166   \aDEFAULTScript Build: \a{Link Active}" .. p41.cheat.version .. "")
		v210:label("\a{Link Active}\239\132\161   \aDEFAULTLast Update: \a{Link Active}28.05.2026 17:09 GMT+3")
		events.pre_render:set(function()
			-- upvalues: get_style (copy), p41 (copy), events (copy)
			local t5 = {
				active_color = get_style()["Link Active"],
				link = get_style().Link
			}

			if t5.link ~= p41.var_update.link or t5.active_color ~= p41.var_update.active_color then
				events.on_style_change:call()
			end

			p41.var_update = t5
		end)

		local t6 = {}
		local v225 = files.read("nl/scripts/mytools/mytools.config")
		local ok, result2 = pcall(function()
			-- upvalues: v225 (copy)
			return json.parse(v225)
		end)
		local t7

		if ok and #result2 ~= 0 then
			t7 = {}

			for i = 1, #result2 do
				table.insert(t7, result2[i].name)
			end
		else
			t7 = {
				[1] = "\a{Link Active}Mytools. \aCBC9C9FFCreate preset."
			}
		end

		v209:list("", {
			[1] = "\239\134\146   Information",
			[2] = "\239\134\146   Configurations",
			[3] = "\239\148\133   Anti-Aims",
			[4] = "\239\148\191   Visuals",
			[5] = "\239\148\191     \aDEFAULTMiscellaneous"
		}):set_callback(function(p42)
			-- upvalues: v216 (copy), v214 (copy), v213 (copy), v210 (copy), v212 (copy), v217 (copy), v218 (copy), v219 (copy), v220 (copy), v221 (copy), v222 (copy), v223 (copy), v215 (copy), v211 (copy)
			if p42:get() ~= 1 then
				if p42:get() ~= 2 then
					if p42:get() ~= 3 then
						if p42:get() ~= 4 then
							if p42:get() == 5 then
								p42:update({
									[1] = "\239\131\171      Information",
									[2] = "\239\129\187     Configurations",
									[3] = "\239\148\133    Anti-Aims",
									[4] = "\239\148\191     \aDEFAULTVisuals",
									[5] = "\a{Link Active}\239\130\133    \aDEFAULTMiscellaneous"
								})
								v216:visibility(false)
								v214:visibility(false)
								v213:visibility(false)
								v210:visibility(false)
								v212:visibility(false)
								v217:visibility(false)
								v218:visibility(false)
								v219:visibility(false)
								v220:visibility(true)
								v221:visibility(true)
								v222:visibility(false)
								v223:visibility(false)
								v215:visibility(false)
								v211:visibility(false)
							end
						else
							p42:update({
								[1] = "\239\131\171      Information",
								[2] = "\239\129\187     Configurations",
								[3] = "\239\148\133    Anti-Aims",
								[4] = "\a{Link Active}\239\148\191     \aDEFAULTVisuals",
								[5] = "\239\130\133    \aDEFAULTMiscellaneous"
							})
							v216:visibility(false)
							v214:visibility(false)
							v213:visibility(false)
							v210:visibility(false)
							v212:visibility(false)
							v217:visibility(false)
							v218:visibility(false)
							v219:visibility(false)
							v220:visibility(false)
							v221:visibility(false)
							v222:visibility(true)
							v223:visibility(true)
							v215:visibility(false)
							v211:visibility(false)
						end
					else
						p42:update({
							[1] = "\239\131\171      Information",
							[2] = "\239\129\187     Configurations",
							[3] = "\a{Link Active}\239\148\133    \aDEFAULTAnti-Aims",
							[4] = "\239\148\191     Visuals",
							[5] = "\239\130\133    \aDEFAULTMiscellaneous"
						})
						v216:visibility(false)
						v214:visibility(false)
						v213:visibility(false)
						v210:visibility(false)
						v212:visibility(false)
						v217:visibility(true)
						v218:visibility(true)
						v219:visibility(true)
						v220:visibility(false)
						v221:visibility(false)
						v222:visibility(false)
						v223:visibility(false)
						v215:visibility(false)
						v211:visibility(false)
					end
				else
					p42:update({
						[1] = "\239\131\171      Information",
						[2] = "\a{Link Active}\239\129\187     \aDEFAULTConfigurations",
						[3] = "\239\148\133    Anti-Aims",
						[4] = "\239\148\191     Visuals",
						[5] = "\239\130\133    \aDEFAULTMiscellaneous"
					})
					v216:visibility(true)
					v214:visibility(true)
					v213:visibility(true)
					v210:visibility(false)
					v212:visibility(false)
					v217:visibility(false)
					v218:visibility(false)
					v219:visibility(false)
					v220:visibility(false)
					v221:visibility(false)
					v222:visibility(false)
					v223:visibility(false)
					v215:visibility(true)
					v211:visibility(false)
				end
			else
				p42:update({
					[1] = "\a{Link Active}\239\131\171      \aDEFAULTInformation",
					[2] = "\239\129\187     Configurations",
					[3] = "\239\148\133    Anti-Aims",
					[4] = "\239\148\191     Visuals",
					[5] = "\239\130\133    \aDEFAULTMiscellaneous"
				})
				v216:visibility(false)
				v214:visibility(false)
				v213:visibility(false)
				v210:visibility(true)
				v212:visibility(true)
				v217:visibility(false)
				v218:visibility(false)
				v219:visibility(false)
				v220:visibility(false)
				v221:visibility(false)
				v222:visibility(false)
				v223:visibility(false)
				v215:visibility(false)
				v211:visibility(true)
			end
		end, true)
		t6.preset_list = v213:list("", t7)
		t6.preset_name = v213:input("Name: ")
		t6.save_preset = v213:button("\a{Link Active}\239\131\135", function()
			-- upvalues: p41 (copy)
			p41.config_system:save()
		end, true)
		t6.delete_preset = v213:button("\a{Link Active}\239\139\173", function()
			-- upvalues: p41 (copy)
			p41.config_system:delete()
		end, true)
		t6.load_preset = v213:button("            Load            ", function()
			-- upvalues: p41 (copy)
			p41.config_system:load()
		end)
		t6.import_preset = v213:button("\a{Link Active}\239\149\175", function()
			-- upvalues: p41 (copy)
			p41.config_system:import()
		end, true)
		t6.export_preset = v213:button("\a{Link Active}\239\149\174", function()
			-- upvalues: add_notify (copy), p41 (copy)
			add_notify("mytools", "\a89F2CAFF✔\239\184\143 Successfully Exported Your Config")
			p41.impt.play_sound("physics/wood/wood_plank_impact_hard4.wav", 0.12)
			p41.config_system:export()
		end, true)
		skip_data = v214:selectable("Skip import data:", {
			[1] = "Anti-Aims",
			[2] = "Ragebot",
			[3] = "Misc/Vis"
		})
		skip_data:tooltip("Does not import the tabs that are selected.")
		t6.import_preset1 = v214:button("\a{Link Active}\239\149\175  \aDEFAULTImport", function()
			-- upvalues: p41 (copy)
			p41.config_system:import()
		end, true)
		t6.export_preset1 = v214:button("\a{Link Active}\239\149\174  \aDEFAULTExport", function()
			-- upvalues: add_notify (copy), p41 (copy)
			add_notify("mytools", "\a89F2CAFF✔\239\184\143 Successfully Exported Your Config")
			p41.impt.play_sound("physics/wood/wood_plank_impact_hard4.wav", 0.12)
			p41.config_system:export()
		end, true)

		local s1 =
		"W3sibmFtZSI6IkN1c3RvbSBQaXRjaCIsInRhYiI6ImFudGlhaW1zIiwidmFyIjowLjB9LHsibmFtZSI6IltBdXRvVFBdIERlbGF5IiwidGFiIjoiYW50aWFpbXMiLCJ2YXIiOjEuMH0seyJuYW1lIjoiQ3VzdG9tIFlhdyIsInRhYiI6ImFudGlhaW1zIiwidmFyIjowLjB9LHsibmFtZSI6Ilx1MDAwN3tMaW5rIEFjdGl2ZX3vlIQgICBcdTAwMDdERUZBVUxUU2FmZSBIZWFkIiwidGFiIjoiYW50aWFpbXMiLCJ2YXIiOlsiQm9tYiIsIktuaWZlIC8gVGFzZXIiLCJGYWtlLUxhZyJdfSx7Im5hbWUiOiJEaXNhYmxlIFlhdyBNb2RpZmllcnMiLCJ0YWIiOiJhbnRpYWltcyIsInZhciI6ZmFsc2V9LHsibmFtZSI6IkRpc2FibGUgb24gTWFudWFscyIsInRhYiI6ImFudGlhaW1zIiwidmFyIjp0cnVlfSx7Im5hbWUiOiJDdXJyZW50IENvbmRpdGlvbiIsInRhYiI6ImFudGlhaW1zIiwidmFyIjoiQWlyIENyb3VjaCJ9LHsibmFtZSI6Ik9uIEdyb3VuZCIsInRhYiI6ImFudGlhaW1zIiwidmFyIjoiRm9sbG93IERpcmVjdGlvbiJ9LHsibmFtZSI6IkUtU3BhbSB3aGlsZSBTYWZlIEhlYWQiLCJ0YWIiOiJhbnRpYWltcyIsInZhciI6dHJ1ZX0seyJuYW1lIjoiXHUwMDA3e0xpbmsgQWN0aXZlfe+HniAgIFx1MDAwN0RFRkFVTFRGb3JjZSBCcmVhayBMQyIsInRhYiI6ImFudGlhaW1zIiwidmFyIjp0cnVlfSx7Im5hbWUiOiJcdTAwMDd7TGluayBBY3RpdmV974GHICAgXHUwMDA3REVGQVVMVEZyZWVzdGFuZGluZyIsInRhYiI6ImFudGlhaW1zIiwidmFyIjpmYWxzZX0seyJuYW1lIjoiQ29uZGl0aW9ucyIsInRhYiI6ImFudGlhaW1zIiwidmFyIjpbIkluIEFpciIsIlN0YW5kaW5nIiwiQ3JvdWNoaW5nIiwiQ3JvdWNoIE1vdmUiXX0seyJuYW1lIjoiQm9keSBGcmVlc3RhbmRpbmciLCJ0YWIiOiJhbnRpYWltcyIsInZhciI6ZmFsc2V9LHsibmFtZSI6IllvdSBhcmUgdXNpbmcgYW4gYXV0b21hdGljIHByZXNldCwgeW91IGRvbid0IG5lZWQgdG8gYWRqdXN0IGl0LiBKdXN0IHByZXNzIGl0IGFuZCBnbyBwbGF5LiIsInRhYiI6ImFudGlhaW1zIiwidmFyIjoyMTczOTg1MTUyLjB9LHsibmFtZSI6Ilx1MDAwN3tMaW5rIEFjdGl2ZX3ukrsgICBcdTAwMDdERUZBVUxURGVmZW5zaXZlIEFBIiwidGFiIjoiYW50aWFpbXMiLCJ2YXIiOnRydWV9LHsibmFtZSI6Ilx1MDAwN3tMaW5rIEFjdGl2ZX3vhK4gICBcdTAwMDdERUZBVUxUVHdlYWtzIiwidGFiIjoiYW50aWFpbXMiLCJ2YXIiOlsiQm9tYnNpdGUgRSBGaXgiLCJMZWdpdCBBQSIsIkRpcy4gQUEgb24gV2FybXVwIiwiTm8gRmFsbCBEYW1hZ2UiXX0seyJuYW1lIjoiVHlwZSIsInRhYiI6ImFudGlhaW1zIiwidmFyIjoiUHJlc2V0cyJ9LHsibmFtZSI6IkluIEFpciIsInRhYiI6ImFudGlhaW1zIiwidmFyIjoiU3RhdGljIn0seyJuYW1lIjoiXHUwMDA3e0xpbmsgQWN0aXZlfe+KmiAgIFx1MDAwN0RFRkFVTFRBbmltLiBCcmVha2VycyIsInRhYiI6ImFudGlhaW1zIiwidmFyIjp0cnVlfSx7Im5hbWUiOiJTbGlkaW5nIE9uIFNsb3ctV2FsayIsInRhYiI6ImFudGlhaW1zIiwidmFyIjp0cnVlfSx7Im5hbWUiOiJQaXRjaCIsInRhYiI6ImFudGlhaW1zIiwidmFyIjoiU2VtaSBVcCJ9LHsibmFtZSI6Ik1vdmUgTGVhbiIsInRhYiI6ImFudGlhaW1zIiwidmFyIjpmYWxzZX0seyJuYW1lIjoiRGlzYWJsZSBZYXcgTW9kLiIsInRhYiI6ImFudGlhaW1zIiwidmFyIjpmYWxzZX0seyJuYW1lIjoiTW92ZSBMZWFuIEZvcmNlIiwidGFiIjoiYW50aWFpbXMiLCJ2YXIiOjAuMH0seyJuYW1lIjoiRGlzYWJsZXJzIiwidGFiIjoiYW50aWFpbXMiLCJ2YXIiOlsiTWFudWFscyIsIkdyZW5hZGVzIl19LHsibmFtZSI6IllhdyIsInRhYiI6ImFudGlhaW1zIiwidmFyIjoiU3BpbiJ9LHsibmFtZSI6Ilx1MDAwN3tMaW5rIEFjdGl2ZX3ukr4gICBcdTAwMDdERUZBVUxUTWFudWFsIEFBIiwidGFiIjoiYW50aWFpbXMiLCJ2YXIiOiJEaXNhYmxlZCJ9LHsibmFtZSI6Ilx1MDAwN3tMaW5rIEFjdGl2ZX3vk78gICBcdTAwMDdERUZBVUxUTW9kZSIsInRhYiI6ImFudGlhaW1zIiwidmFyIjoiQ29uZGl0aW9uYWwifSx7Im5hbWUiOiJbQXV0b1RQXSBXZWFwb25zIiwidGFiIjoiYW50aWFpbXMiLCJ2YXIiOltdfSx7Im5hbWUiOiJIaXRjaGFuY2UgQWRkaXRpb25hbHMiLCJ0YWIiOiJyYWdlYm90IiwidmFyIjpmYWxzZX0seyJuYW1lIjoiQ29uZGl0aW9uIiwidGFiIjoicmFnZWJvdCIsInZhciI6W119LHsibmFtZSI6IkN1c3RvbSBFdmVudCBMb2dzIiwidGFiIjoicmFnZWJvdCIsInZhciI6dHJ1ZX0seyJuYW1lIjoiU2VsZWN0IExvZyIsInRhYiI6InJhZ2Vib3QiLCJ2YXIiOlsiQ29uc29sZSJdfSx7Im5hbWUiOiJObyBzY29wZSIsInRhYiI6InJhZ2Vib3QiLCJ2YXIiOjU1LjB9LHsibmFtZSI6IlVubG9jayBGYWtlIExhdGVuY3kiLCJ0YWIiOiJyYWdlYm90IiwidmFyIjpmYWxzZX0seyJuYW1lIjoiUHVyY2hhc2UgTG9ncyIsInRhYiI6InJhZ2Vib3QiLCJ2YXIiOnRydWV9LHsibmFtZSI6IkRpc2FibGUgR2xvdyIsInRhYiI6InJhZ2Vib3QiLCJ2YXIiOnRydWV9LHsibmFtZSI6IlJldm9sdmVyIEhlbHBlciIsInRhYiI6InJhZ2Vib3QiLCJ2YXIiOnRydWV9LHsibmFtZSI6IkFpciIsInRhYiI6InJhZ2Vib3QiLCJ2YXIiOjU1LjB9LHsibmFtZSI6IlNjcmVlbiBMb2dzIENvbG9yIiwidGFiIjoicmFnZWJvdCIsInZhciI6IjkwOTdGRkZGIn0seyJuYW1lIjoiR2xvdyBPZmZzZXQiLCJ0YWIiOiJ2aXN1YWxzIiwidmFyIjo0MC4wfSx7Im5hbWUiOiJBc3BlY3QgUmF0aW8iLCJ0YWIiOiJ2aXN1YWxzIiwidmFyIjoxNTAuMH0seyJuYW1lIjoiV2luZG93cyIsInRhYiI6InZpc3VhbHMiLCJ2YXIiOltdfSx7Im5hbWUiOiJwb3N4ZG1nIiwidGFiIjoidmlzdWFscyIsInZhciI6OTY1LjB9LHsibmFtZSI6InBvc3lkbWciLCJ0YWIiOiJ2aXN1YWxzIiwidmFyIjo1MjUuMH0seyJuYW1lIjoiRGFtYWdlIEluZGljYXRvciIsInRhYiI6InZpc3VhbHMiLCJ2YXIiOmZhbHNlfSx7Im5hbWUiOiJEYW1hZ2UgRm9udCIsInRhYiI6InZpc3VhbHMiLCJ2YXIiOiJTbWFsbCJ9LHsibmFtZSI6IkFpbWJvdCBNYXJrZXJzIiwidGFiIjoidmlzdWFscyIsInZhciI6dHJ1ZX0seyJuYW1lIjoiRGlzYWJsZSBEYW1hZ2UgQW5pbWF0aW9uIiwidGFiIjoidmlzdWFscyIsInZhciI6ZmFsc2V9LHsibmFtZSI6IktpYml0IEhpdCBNYXJrZXIiLCJ0YWIiOiJ2aXN1YWxzIiwidmFyIjpmYWxzZX0seyJuYW1lIjoiVmVsb2NpdHkgSW5kaWNhdG9yIiwidGFiIjoidmlzdWFscyIsInZhciI6ZmFsc2V9LHsibmFtZSI6IjNEIE1pc3MgTWFya2VyIiwidGFiIjoidmlzdWFscyIsInZhciI6ZmFsc2V9LHsibmFtZSI6IlZlbG9jaXR5IENvbG9yIiwidGFiIjoidmlzdWFscyIsInZhciI6IjkxQjJFRkZGIn0seyJuYW1lIjoiT1QgRGFtYWdlIE1hcmtlciIsInRhYiI6InZpc3VhbHMiLCJ2YXIiOnRydWV9LHsibmFtZSI6InBvc3h2ZWxvY2l0eSIsInRhYiI6InZpc3VhbHMiLCJ2YXIiOjkwMC4wfSx7Im5hbWUiOiJDb25zb2xlIENvbG9yIENoYW5nZXIiLCJ0YWIiOiJ2aXN1YWxzIiwidmFyIjpmYWxzZX0seyJuYW1lIjoicG9zeXZlbG9jaXR5IiwidGFiIjoidmlzdWFscyIsInZhciI6MjUwLjB9LHsibmFtZSI6IkNvbnNvbGUgQ29sb3IiLCJ0YWIiOiJ2aXN1YWxzIiwidmFyIjoiRkZGRkZGRkYifSx7Im5hbWUiOiI1MDAkIEluZGljYXRvcnMiLCJ0YWIiOiJ2aXN1YWxzIiwidmFyIjpbIkRvdWJsZSB0YXAiLCJEb3JtYW50IGFpbWJvdCIsIk1pbmltdW0gZGFtYWdlIiwiUGluZyBzcGlrZSIsIkZha2UgZHVjayIsIkZyZWVzdGFuZGluZyIsIkhpdCBQZXJjZW50YWdlIiwiQm9tYiBpbmZvIiwiQm9keSBhaW0iLCJIaWRlIHNob3RzIl19LHsibmFtZSI6Ik9mZnNldCBaIiwidGFiIjoidmlzdWFscyIsInZhciI6LTE1LjB9LHsibmFtZSI6Ik9mZnNldCBZIiwidGFiIjoidmlzdWFscyIsInZhciI6MC4wfSx7Im5hbWUiOiJXaWRnZXRzIENvbG9yIiwidGFiIjoidmlzdWFscyIsInZhciI6Ijk2OTZGRkZGIn0seyJuYW1lIjoiQnVpbGQgQ29sb3IiLCJ0YWIiOiJ2aXN1YWxzIiwidmFyIjoiRDdBMzZGRkYifSx7Im5hbWUiOiJwb3N4IiwidGFiIjoidmlzdWFscyIsInZhciI6MTUwLjB9LHsibmFtZSI6IlNjb3BlIE92ZXJsYXkiLCJ0YWIiOiJ2aXN1YWxzIiwidmFyIjpmYWxzZX0seyJuYW1lIjoicG9zeSIsInRhYiI6InZpc3VhbHMiLCJ2YXIiOjE1MC4wfSx7Im5hbWUiOiJTZWxlY3QgU3R5bGUiLCJ0YWIiOiJ2aXN1YWxzIiwidmFyIjoiRGVmYXVsdCJ9LHsibmFtZSI6InBvc3gxIiwidGFiIjoidmlzdWFscyIsInZhciI6MjUwLjB9LHsibmFtZSI6Ik9uLVNjcmVlbiBJbmRpY2F0b3JzIiwidGFiIjoidmlzdWFscyIsInZhciI6ZmFsc2V9LHsibmFtZSI6InBvc3kxIiwidGFiIjoidmlzdWFscyIsInZhciI6MjUwLjB9LHsibmFtZSI6IkluZGljYXRvciBDb2xvciIsInRhYiI6InZpc3VhbHMiLCJ2YXIiOiJGRkZGRkZGRiJ9LHsibmFtZSI6IlZpZXdtb2RlbCBDaGFuZ2VyIiwidGFiIjoidmlzdWFscyIsInZhciI6ZmFsc2V9LHsibmFtZSI6IlNjb3BlIEdhcCIsInRhYiI6InZpc3VhbHMiLCJ2YXIiOjcuMH0seyJuYW1lIjoiRk9WIiwidGFiIjoidmlzdWFscyIsInZhciI6NjguMH0seyJuYW1lIjoiRm9udCIsInRhYiI6InZpc3VhbHMiLCJ2YXIiOiJEZWZhdWx0In0seyJuYW1lIjoiT2Zmc2V0IFgiLCJ0YWIiOiJ2aXN1YWxzIiwidmFyIjoyNS4wfSx7Im5hbWUiOiJTZWxlY3QiLCJ0YWIiOiJ2aXN1YWxzIiwidmFyIjoiRGVmYXVsdCJ9LHsibmFtZSI6IlNjb3BlIFNpemUiLCJ0YWIiOiJ2aXN1YWxzIiwidmFyIjoxMDUuMH0seyJuYW1lIjoiRXhjbHVkZSBMaW5lIiwidGFiIjoidmlzdWFscyIsInZhciI6W119LHsibmFtZSI6IlNjb3BlIENvbG9yIiwidGFiIjoidmlzdWFscyIsInZhciI6IkZGRkZGRkZGIn0seyJuYW1lIjoiV2lkZ2V0cyIsInRhYiI6InZpc3VhbHMiLCJ2YXIiOmZhbHNlfSx7Im5hbWUiOiJVbm11dGUgU2lsZW5jZWQgUGxheWVycyIsInRhYiI6Im1pc2MiLCJ2YXIiOnRydWV9LHsibmFtZSI6Ik1pbi4gRGFtYWdlIiwidGFiIjoibWlzYyIsInZhciI6MzAuMH0seyJuYW1lIjoiXHUwMDA3e0xpbmsgQWN0aXZlfe+ggiAgIFx1MDAwN0RFRkFVTFRFbmFibGUgQ2hlYXQgQ29uZmlnIFN0ZWFsZXIiLCJ0YWIiOiJtaXNjIiwidmFyIjpmYWxzZX0seyJuYW1lIjoiTmFkZSBUaHJvdyBGaXgiLCJ0YWIiOiJtaXNjIiwidmFyIjp0cnVlfSx7Im5hbWUiOiJUcmFzaCBUYWxrIiwidGFiIjoibWlzYyIsInZhciI6dHJ1ZX0seyJuYW1lIjoiR3JlbmFkZSBSZWxlYXNlIiwidGFiIjoibWlzYyIsInZhciI6dHJ1ZX0seyJuYW1lIjoiRGlzYWJsZSBvbiBXYXJtdXAiLCJ0YWIiOiJtaXNjIiwidmFyIjp0cnVlfSx7Im5hbWUiOiJDbGFuIFRhZyIsInRhYiI6Im1pc2MiLCJ2YXIiOnRydWV9LHsibmFtZSI6IllhdyBNb2RpZmllciAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiRGlzYWJsZWQifSx7Im5hbWUiOiJZYXcgTW9kZSAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiRGVmYXVsdCJ9LHsibmFtZSI6IlNldHRpbmdzICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJEZWZhdWx0In0seyJuYW1lIjoiT2Zmc2V0ICMxICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiTW9kZSAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiU3RhdGljIn0seyJuYW1lIjoiT2Zmc2V0ICMyICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiUGl0Y2ggIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6IkRpc2FibGVkIn0seyJuYW1lIjoiMSBXYXkgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MC4wfSx7Im5hbWUiOiIyIFdheSAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjowLjB9LHsibmFtZSI6IjMgV2F5ICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiWWF3ICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJEaXNhYmxlZCJ9LHsibmFtZSI6IjQgV2F5ICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiNSBXYXkgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MC4wfSx7Im5hbWUiOiJCYXNlICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJMb2NhbCBWaWV3In0seyJuYW1lIjoiSW52ZXJ0ZXIgQUEgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6ZmFsc2V9LHsibmFtZSI6IkxlZnQgTGltaXQgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6NjAuMH0seyJuYW1lIjoiU3dhcCBjb21wYXRpYmxlIHdpdGggaW52ZXJ0ZXIgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6ZmFsc2V9LHsibmFtZSI6IlJpZ2h0IExpbWl0ICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjYwLjB9LHsibmFtZSI6Ik9mZnNldCAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjowLjB9LHsibmFtZSI6IkZha2UgT3B0aW9ucyAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjpbXX0seyJuYW1lIjoiRW5hYmxlIENvbmRpdGlvbiAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjp0cnVlfSx7Im5hbWUiOiJPZmZzZXQgUiAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjowLjB9LHsibmFtZSI6IkJvZHkgWWF3ICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOmZhbHNlfSx7Im5hbWUiOiJEZWxheSB0aWNrcyAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoxMi4wfSx7Im5hbWUiOiJGcmVlc3RhbmQgRFMgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6Ik9mZiJ9LHsibmFtZSI6IllhdyBNb2RpZmllciAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6IkRpc2FibGVkIn0seyJuYW1lIjoiWWF3IE1vZGUgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJEZWxheWVkIn0seyJuYW1lIjoiU2V0dGluZ3MgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJEZWZhdWx0In0seyJuYW1lIjoiT2Zmc2V0ICMxICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjowLjB9LHsibmFtZSI6Ik1vZGUgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJTdGF0aWMifSx7Im5hbWUiOiJPZmZzZXQgIzIgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiUGl0Y2ggICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJEb3duIn0seyJuYW1lIjoiMSBXYXkgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiMiBXYXkgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiMyBXYXkgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiWWF3ICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiQmFja3dhcmQifSx7Im5hbWUiOiI0IFdheSAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MC4wfSx7Im5hbWUiOiI1IFdheSAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MC4wfSx7Im5hbWUiOiJCYXNlICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiQXQgVGFyZ2V0In0seyJuYW1lIjoiSW52ZXJ0ZXIgQUEgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOmZhbHNlfSx7Im5hbWUiOiJMZWZ0IExpbWl0ICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjo2MC4wfSx7Im5hbWUiOiJTd2FwIGNvbXBhdGlibGUgd2l0aCBpbnZlcnRlciAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6ZmFsc2V9LHsibmFtZSI6IlJpZ2h0IExpbWl0ICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjo2MC4wfSx7Im5hbWUiOiJPZmZzZXQgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOi0yMC4wfSx7Im5hbWUiOiJGYWtlIE9wdGlvbnMgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOltdfSx7Im5hbWUiOiJFbmFibGUgQ29uZGl0aW9uICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjp0cnVlfSx7Im5hbWUiOiJPZmZzZXQgUiAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MjcuMH0seyJuYW1lIjoiQm9keSBZYXcgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOnRydWV9LHsibmFtZSI6IkRlbGF5IHRpY2tzICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjo2LjB9LHsibmFtZSI6IkZyZWVzdGFuZCBEUyAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6Ik9mZiJ9LHsibmFtZSI6IllhdyBNb2RpZmllciAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJDZW50ZXIifSx7Im5hbWUiOiJZYXcgTW9kZSAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJMZWZ0L1JpZ2h0In0seyJuYW1lIjoiU2V0dGluZ3MgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiRGVmYXVsdCJ9LHsibmFtZSI6Ik9mZnNldCAjMSAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOi01OC4wfSx7Im5hbWUiOiJNb2RlICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6IlN0YXRpYyJ9LHsibmFtZSI6Ik9mZnNldCAjMiAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiUGl0Y2ggICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiRG93biJ9LHsibmFtZSI6IjEgV2F5ICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MC4wfSx7Im5hbWUiOiIyIFdheSAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiMyBXYXkgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjowLjB9LHsibmFtZSI6IllhdyAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJCYWNrd2FyZCJ9LHsibmFtZSI6IjQgV2F5ICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MC4wfSx7Im5hbWUiOiI1IFdheSAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiQmFzZSAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJBdCBUYXJnZXQifSx7Im5hbWUiOiJJbnZlcnRlciBBQSAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOmZhbHNlfSx7Im5hbWUiOiJMZWZ0IExpbWl0ICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MzYuMH0seyJuYW1lIjoiU3dhcCBjb21wYXRpYmxlIHdpdGggaW52ZXJ0ZXIgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjpmYWxzZX0seyJuYW1lIjoiUmlnaHQgTGltaXQgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjozNi4wfSx7Im5hbWUiOiJPZmZzZXQgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjotNi4wfSx7Im5hbWUiOiJGYWtlIE9wdGlvbnMgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjpbIkppdHRlciJdfSx7Im5hbWUiOiJFbmFibGUgQ29uZGl0aW9uICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6dHJ1ZX0seyJuYW1lIjoiT2Zmc2V0IFIgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoxMC4wfSx7Im5hbWUiOiJCb2R5IFlhdyAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOnRydWV9LHsibmFtZSI6IkRlbGF5IHRpY2tzICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MTIuMH0seyJuYW1lIjoiRnJlZXN0YW5kIERTICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6Ik9mZiJ9LHsibmFtZSI6IllhdyBNb2RpZmllciAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiQ2VudGVyIn0seyJuYW1lIjoiWWF3IE1vZGUgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6IkxlZnQvUmlnaHQifSx7Im5hbWUiOiJTZXR0aW5ncyAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiRGVmYXVsdCJ9LHsibmFtZSI6Ik9mZnNldCAjMSAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjowLjB9LHsibmFtZSI6Ik1vZGUgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6IlN0YXRpYyJ9LHsibmFtZSI6Ik9mZnNldCAjMiAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjowLjB9LHsibmFtZSI6IlBpdGNoICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJEb3duIn0seyJuYW1lIjoiMSBXYXkgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MC4wfSx7Im5hbWUiOiIyIFdheSAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjowLjB9LHsibmFtZSI6IjMgV2F5ICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiWWF3ICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJCYWNrd2FyZCJ9LHsibmFtZSI6IjQgV2F5ICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiNSBXYXkgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MC4wfSx7Im5hbWUiOiJCYXNlICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJBdCBUYXJnZXQifSx7Im5hbWUiOiJJbnZlcnRlciBBQSAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjpmYWxzZX0seyJuYW1lIjoiTGVmdCBMaW1pdCAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjo1NC4wfSx7Im5hbWUiOiJTd2FwIGNvbXBhdGlibGUgd2l0aCBpbnZlcnRlciAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjpmYWxzZX0seyJuYW1lIjoiUmlnaHQgTGltaXQgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6NTQuMH0seyJuYW1lIjoiT2Zmc2V0ICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOi0zMS4wfSx7Im5hbWUiOiJGYWtlIE9wdGlvbnMgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6WyJKaXR0ZXIiXX0seyJuYW1lIjoiRW5hYmxlIENvbmRpdGlvbiAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjp0cnVlfSx7Im5hbWUiOiJPZmZzZXQgUiAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjo0NS4wfSx7Im5hbWUiOiJCb2R5IFlhdyAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjp0cnVlfSx7Im5hbWUiOiJEZWxheSB0aWNrcyAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoxMi4wfSx7Im5hbWUiOiJGcmVlc3RhbmQgRFMgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6Ik9mZiJ9LHsibmFtZSI6IllhdyBNb2RpZmllciAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6IkNlbnRlciJ9LHsibmFtZSI6IllhdyBNb2RlICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiRGVmYXVsdCJ9LHsibmFtZSI6IlNldHRpbmdzICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiRGVmYXVsdCJ9LHsibmFtZSI6Ik9mZnNldCAjMSAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6LTQ5LjB9LHsibmFtZSI6Ik1vZGUgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJTdGF0aWMifSx7Im5hbWUiOiJPZmZzZXQgIzIgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiUGl0Y2ggICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJEb3duIn0seyJuYW1lIjoiMSBXYXkgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiMiBXYXkgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiMyBXYXkgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiWWF3ICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiQmFja3dhcmQifSx7Im5hbWUiOiI0IFdheSAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MC4wfSx7Im5hbWUiOiI1IFdheSAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MC4wfSx7Im5hbWUiOiJCYXNlICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiQXQgVGFyZ2V0In0seyJuYW1lIjoiSW52ZXJ0ZXIgQUEgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOmZhbHNlfSx7Im5hbWUiOiJMZWZ0IExpbWl0ICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjo2MC4wfSx7Im5hbWUiOiJTd2FwIGNvbXBhdGlibGUgd2l0aCBpbnZlcnRlciAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6ZmFsc2V9LHsibmFtZSI6IlJpZ2h0IExpbWl0ICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjo2MC4wfSx7Im5hbWUiOiJPZmZzZXQgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOi03LjB9LHsibmFtZSI6IkZha2UgT3B0aW9ucyAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6WyJKaXR0ZXIiXX0seyJuYW1lIjoiRW5hYmxlIENvbmRpdGlvbiAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6dHJ1ZX0seyJuYW1lIjoiT2Zmc2V0IFIgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiQm9keSBZYXcgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOnRydWV9LHsibmFtZSI6IkRlbGF5IHRpY2tzICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoxMi4wfSx7Im5hbWUiOiJGcmVlc3RhbmQgRFMgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJPZmYifSx7Im5hbWUiOiJZYXcgTW9kaWZpZXIgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiQ2VudGVyIn0seyJuYW1lIjoiWWF3IE1vZGUgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiRGVmYXVsdCJ9LHsibmFtZSI6IlNldHRpbmdzICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6IkRlZmF1bHQifSx7Im5hbWUiOiJPZmZzZXQgIzEgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjotNDkuMH0seyJuYW1lIjoiTW9kZSAgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJTdGF0aWMifSx7Im5hbWUiOiJPZmZzZXQgIzIgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjowLjB9LHsibmFtZSI6IlBpdGNoICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6IkRvd24ifSx7Im5hbWUiOiIxIFdheSAgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiMiBXYXkgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjowLjB9LHsibmFtZSI6IjMgV2F5ICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MC4wfSx7Im5hbWUiOiJZYXcgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiQmFja3dhcmQifSx7Im5hbWUiOiI0IFdheSAgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiNSBXYXkgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjowLjB9LHsibmFtZSI6IkJhc2UgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiQXQgVGFyZ2V0In0seyJuYW1lIjoiSW52ZXJ0ZXIgQUEgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjpmYWxzZX0seyJuYW1lIjoiTGVmdCBMaW1pdCAgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjYwLjB9LHsibmFtZSI6IlN3YXAgY29tcGF0aWJsZSB3aXRoIGludmVydGVyICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6ZmFsc2V9LHsibmFtZSI6IlJpZ2h0IExpbWl0ICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6NjAuMH0seyJuYW1lIjoiT2Zmc2V0ICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6LTcuMH0seyJuYW1lIjoiRmFrZSBPcHRpb25zICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6WyJKaXR0ZXIiXX0seyJuYW1lIjoiRW5hYmxlIENvbmRpdGlvbiAgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOnRydWV9LHsibmFtZSI6Ik9mZnNldCBSICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MC4wfSx7Im5hbWUiOiJCb2R5IFlhdyAgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOnRydWV9LHsibmFtZSI6IkRlbGF5IHRpY2tzICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MTIuMH0seyJuYW1lIjoiRnJlZXN0YW5kIERTICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6Ik9mZiJ9LHsibmFtZSI6IllhdyBNb2RpZmllciAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiRGlzYWJsZWQifSx7Im5hbWUiOiJZYXcgTW9kZSAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiTGVmdC9SaWdodCJ9LHsibmFtZSI6IlNldHRpbmdzICAgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJEZWZhdWx0In0seyJuYW1lIjoiT2Zmc2V0ICMxICAgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOi02MC4wfSx7Im5hbWUiOiJNb2RlICAgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJTdGF0aWMifSx7Im5hbWUiOiJPZmZzZXQgIzIgICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MC4wfSx7Im5hbWUiOiJQaXRjaCAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiRG93biJ9LHsibmFtZSI6IjEgV2F5ICAgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiMiBXYXkgICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MC4wfSx7Im5hbWUiOiIzIFdheSAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjowLjB9LHsibmFtZSI6IllhdyAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiQmFja3dhcmQifSx7Im5hbWUiOiI0IFdheSAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjowLjB9LHsibmFtZSI6IjUgV2F5ICAgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiQmFzZSAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiQXQgVGFyZ2V0In0seyJuYW1lIjoiSW52ZXJ0ZXIgQUEgICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6ZmFsc2V9LHsibmFtZSI6IkxlZnQgTGltaXQgICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6NjAuMH0seyJuYW1lIjoiU3dhcCBjb21wYXRpYmxlIHdpdGggaW52ZXJ0ZXIgICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6ZmFsc2V9LHsibmFtZSI6IlJpZ2h0IExpbWl0ICAgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjYwLjB9LHsibmFtZSI6Ik9mZnNldCAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjotMzYuMH0seyJuYW1lIjoiRmFrZSBPcHRpb25zICAgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOlsiSml0dGVyIl19LHsibmFtZSI6IkVuYWJsZSBDb25kaXRpb24gICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6dHJ1ZX0seyJuYW1lIjoiT2Zmc2V0IFIgICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MjkuMH0seyJuYW1lIjoiQm9keSBZYXcgICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6dHJ1ZX0seyJuYW1lIjoiRGVsYXkgdGlja3MgICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MTIuMH0seyJuYW1lIjoiRnJlZXN0YW5kIERTICAgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJPZmYifSx7Im5hbWUiOiJZYXcgTW9kaWZpZXIgICAgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJEaXNhYmxlZCJ9LHsibmFtZSI6IllhdyBNb2RlICAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiTGVmdC9SaWdodCJ9LHsibmFtZSI6IlNldHRpbmdzICAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiRGVmYXVsdCJ9LHsibmFtZSI6Ik9mZnNldCAjMSAgICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MC4wfSx7Im5hbWUiOiJNb2RlICAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiU3RhdGljIn0seyJuYW1lIjoiT2Zmc2V0ICMyICAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjowLjB9LHsibmFtZSI6IlBpdGNoICAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoiRG93biJ9LHsibmFtZSI6IjEgV2F5ICAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjowLjB9LHsibmFtZSI6IjIgV2F5ICAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjowLjB9LHsibmFtZSI6IjMgV2F5ICAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjowLjB9LHsibmFtZSI6IllhdyAgICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6IkJhY2t3YXJkIn0seyJuYW1lIjoiNCBXYXkgICAgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiNSBXYXkgICAgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOjAuMH0seyJuYW1lIjoiQmFzZSAgICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6IkF0IFRhcmdldCJ9LHsibmFtZSI6IkludmVydGVyIEFBICAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjpmYWxzZX0seyJuYW1lIjoiTGVmdCBMaW1pdCAgICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6NjAuMH0seyJuYW1lIjoiU3dhcCBjb21wYXRpYmxlIHdpdGggaW52ZXJ0ZXIgICAgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOmZhbHNlfSx7Im5hbWUiOiJSaWdodCBMaW1pdCAgICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6NjAuMH0seyJuYW1lIjoiT2Zmc2V0ICAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjotMzYuMH0seyJuYW1lIjoiRmFrZSBPcHRpb25zICAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjpbIkppdHRlciJdfSx7Im5hbWUiOiJFbmFibGUgQ29uZGl0aW9uICAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjp0cnVlfSx7Im5hbWUiOiJPZmZzZXQgUiAgICAgICAgIiwidGFiIjoiYW50aWFpbXNfYnVpbGRlciIsInZhciI6MjkuMH0seyJuYW1lIjoiQm9keSBZYXcgICAgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOnRydWV9LHsibmFtZSI6IkRlbGF5IHRpY2tzICAgICAgICAiLCJ0YWIiOiJhbnRpYWltc19idWlsZGVyIiwidmFyIjoxMi4wfSx7Im5hbWUiOiJGcmVlc3RhbmQgRFMgICAgICAgICIsInRhYiI6ImFudGlhaW1zX2J1aWxkZXIiLCJ2YXIiOiJPZmYifV0="

		t6.load_defauls = v214:button("🪐 \aFFFFFFFFDefault", function()
			-- upvalues: s1 (copy), base64 (copy), p41 (copy), v70 (copy), add_notify (copy)
			local ok3, result4 = pcall(function()
				-- upvalues: s1 (copy), base64 (copy), p41 (copy), v70 (copy), add_notify (copy)
				local v778 = s1:gsub("%s", "")
				local v779 = base64.decode(v778)
				local v780 = json.parse(v779)
				local n1 = 0

				local function v782(p43, p44)
					-- upvalues: n1 (ref)
					local ok2, result3 = pcall(function()
						-- upvalues: p43 (copy)
						return p43:name()
					end)

					if not ok2 or result3 ~= p44.name then
						return false
					end

					pcall(function()
						-- upvalues: p43 (copy), p44 (copy)
						p43:set(p44.var)
					end)
					n1 = n1 + 1

					return true
				end

				for _, v in pairs(v780) do
					local v785 = p41.elements[v.tab]

					if v785 then
						for _, v2 in pairs(v785) do
							if v70(v2) ~= "table" then
								v782(v2, v)
							else
								for _, v3 in pairs(v2) do
									if v70(v3) ~= "table" then
										v782(v3, v)
									else
										for _, v4 in pairs(v3) do
											v782(v4, v)
										end
									end
								end
							end
						end
					end
				end

				print("applied:", n1, "of", #v780)
				add_notify("mytools", "\a89F2CAFF✔\239\184\143 Imported: " .. n1 .. "/" .. #v780)
				p41.impt.play_sound("physics/wood/wood_plank_impact_hard4.wav", 0.12)
			end)

			if not ok3 then
				print("load_defauls error:", tostring(result4))
				add_notify("mytools", "\aFF8B7AFF❌ " .. tostring(result4))
			end
		end, true)
		t6.save_preset:tooltip("Save / Create Preset")
		t6.delete_preset:tooltip("Delete Preset")
		t6.import_preset:tooltip("Import")
		t6.export_preset:tooltip("Export")
		t6.neverlose_config = v212:button("\a{Link Active}\239\131\150  \aDEFAULTNeverlose CFG ", function()
			panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/K9Hwhmc9eH")
		end, true)
		t6.youtube = v212:button("\a{Link Active}\239\133\167  \aDEFAULTYoutube ", function()
			panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/K9Hwhmc9eH")
		end, true)
		t6.projects = v212:button("\a{Link Active}\239\130\174  \aDEFAULTOur Projects ", function()
			panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/K9Hwhmc9eH")
		end, true)
		events.render:set(function()
			-- upvalues: get_alpha (copy), get_style (copy), t2 (copy), p41 (copy)
			if not (get_alpha() < 0.3) then
				link_color = get_style()["Link Active"]
				text = t2.gradient("mytools", color(173, 173, 173), color(link_color.r, link_color.g, link_color.b), 1.5)
				ui.sidebar(text .. "\aADADADFF • \a{Link Active}" .. p41.cheat.version .. "", "\239\150\190")

				return
			end
		end)

		local t8 = {
			antiaims = {},
			ragebot = {},
			visuals = {},
			misc = {},
			antiaims_builder = {}
		}

		get_style("Link Active"):to_hex()
		t8.misc.config_stealer = v216:switch("\a{Link Active}\239\160\130   \aDEFAULTEnable Cheat Config Stealer")
		t8.misc.muteunmute = v220:switch("Unmute Silenced Players")
		t8.misc.muteunmute:tooltip("Removes mute from all players who are muted for abuse, updating on round start.")
		t8.visuals.on_screen = v222:switch("On-Screen Indicators")

		local v232 = t8.visuals.on_screen:create()

		t8.visuals.select = v232:combo("Select", {
			[1] = "Disable",
			[2] = "Default"
		}, 0)
		t8.visuals.fonts = v232:combo("Font", {
			[1] = "Small",
			[2] = "Default"
		})
		t8.visuals.indicator_color = v232:color_picker("Indicator Color", color(255, 255, 255))
		t8.visuals.build_color = v232:color_picker("Build Color", color(215, 163, 111))
		t8.visuals.glow_px = v232:slider("Glow Offset", 0, 100, 40, nil, "px")
		t8.visuals.dmg_indx = v232:slider("posxdmg", 0, screen_size().x, 965)
		t8.visuals.dmg_indy = v232:slider("posydmg", 0, screen_size().y, 525)
		t8.visuals.dmg_indx:visibility(false)
		t8.visuals.dmg_indy:visibility(false)
		t8.visuals.select:set_callback(function(p45)
			-- upvalues: t8 (ref)
			t8.visuals.indicator_color:visibility(p45:get() == "Default")
			t8.visuals.build_color:visibility(p45:get() == "Default")
			t8.visuals.glow_px:visibility(p45:get() == "Default")
			t8.visuals.fonts:visibility(p45:get() == "Default")
		end, true)
		t8.visuals.damage_indicator = v222:switch("Damage Indicator")

		local v233 = t8.visuals.damage_indicator:create()

		t8.visuals.damage_font = v233:combo("Damage Font", "Small", "Default")
		t8.visuals.dis_animation = v233:switch("Disable Damage Animation", false)
		t8.visuals.damage_indicator:set_callback(function(p46)
			-- upvalues: t8 (ref)
			t8.visuals.damage_font:visibility(p46:get())
			t8.visuals.dis_animation:visibility(p46:get())
		end, true)
		t8.visuals.velocity_warning = v222:switch("Velocity Indicator")

		local v234 = t8.visuals.velocity_warning:create()

		t8.visuals.velocity_color = v234:color_picker("Velocity Color", color(145, 178, 239))
		t8.visuals.velocity_x = v234:slider("posxvelocity", 0, screen_size().x, 900)
		t8.visuals.velocity_y = v234:slider("posyvelocity", 0, screen_size().y, 250)
		t8.visuals.velocity_x:visibility(false)
		t8.visuals.velocity_y:visibility(false)
		t8.visuals.sindicators = v222:selectable("500$ Indicators", {
			[1] = "Double tap",
			[2] = "Dormant aimbot",
			[3] = "Minimum damage",
			[4] = "Ping spike",
			[5] = "Fake duck",
			[6] = "Freestanding",
			[7] = "Spectator list",
			[8] = "Hit Percentage",
			[9] = "Bomb info",
			[10] = "Body aim",
			[11] = "Hide shots",
			[12] = "Choked commands"
		}, 0)
		t8.ragebot.aimbot_logging = v221:switch("Custom Event Logs")

		local v235 = t8.ragebot.aimbot_logging:create()

		t8.ragebot.select_log = v235:selectable("Select Log", {
			[1] = "Console",
			[2] = "Screen"
		})
		t8.ragebot.purchases = v235:switch("Purchase Logs", true)
		t8.ragebot.dis_glow = v235:switch("Disable Glow")
		t8.ragebot.accent_color = v235:color_picker("Screen Logs Color", color(144, 151, 255))
		t8.ragebot.select_log:set_callback(function(p47)
			-- upvalues: t8 (ref)
			t8.ragebot.accent_color:visibility(p47:get("Screen"))
			t8.ragebot.dis_glow:visibility(p47:get("Screen"))
		end, true)
		t8.visuals.custom_scope = v223:switch("Scope Overlay")

		local v236 = t8.visuals.custom_scope:create()

		t8.visuals.scope_style = v236:combo("Select Style", {
			[1] = "Default",
			[2] = "Reversed"
		})
		t8.visuals.remove_line = v236:selectable("Exclude Line", {
			[1] = "Left",
			[2] = "Right",
			[3] = "Up",
			[4] = "Down"
		})
		t8.visuals.scope_gap = v236:slider("Scope Gap", 0, 500, 7)
		t8.visuals.scope_size = v236:slider("Scope Size", 0, 1000, 105)
		t8.visuals.scope_color = v236:color_picker("Scope Color", color(255, 255, 255))
		t8.visuals.solus_widgets = v223:switch("Widgets")

		local v237 = t8.visuals.solus_widgets:create()

		t8.visuals.solus_widgets_s = v237:selectable("Windows", {
			[1] = "Hotkeys",
			[2] = "Spectators"
		})
		t8.visuals.accent_col = v237:color_picker("Widgets Color", color(150, 150, 255))
		t8.visuals.pos_x_s = v237:slider("posx", 0, screen_size().x, 150)
		t8.visuals.pos_y_s = v237:slider("posy", 0, screen_size().y, 150)
		t8.visuals.pos_x1_s = v237:slider("posx1", 0, screen_size().x, 250)
		t8.visuals.pos_y1_s = v237:slider("posy1", 0, screen_size().y, 250)
		t8.visuals.pos_x_s:visibility(false)
		t8.visuals.pos_y_s:visibility(false)
		t8.visuals.pos_x1_s:visibility(false)
		t8.visuals.pos_y1_s:visibility(false)
		t8.visuals.viewmodel_changer = v220:switch("Viewmodel Changer")

		local v238 = t8.visuals.viewmodel_changer:create()

		t8.visuals.viewmodel_fov = v238:slider("FOV", -100, 100, 68)
		t8.visuals.viewmodel_x = v238:slider("Offset X", -150, 150, 25, 0.1)
		t8.visuals.viewmodel_y = v238:slider("Offset Y", -150, 150, 0, 0.1)
		t8.visuals.viewmodel_z = v238:slider("Offset Z", -150, 150, -15, 0.1)
		v238:button("Reset values to default", function()
			-- upvalues: t8 (ref)
			t8.visuals.viewmodel_fov:set(68)
			t8.visuals.viewmodel_x:set(25)
			t8.visuals.viewmodel_y:set(0)
			t8.visuals.viewmodel_z:set(-15)
		end)
		t8.visuals.viewmodel_aspectratio = v220:slider("Aspect Ratio", 0, 200, 0, 0.01, function(p48)
			if p48 ~= 0 then
				return
			end

			return "Off"
		end)
		t8.misc.killsay = v220:switch("Trash Talk")

		local v239 = t8.misc.killsay:create()

		t8.misc.killsay_disablers = v239:switch("Disable on Warmup", false)
		t8.misc.clantag_changer = v220:switch("Clan Tag")
		t8.visuals.markers = v223:switch("Aimbot Markers", false)

		local v240 = t8.visuals.markers:create()

		t8.visuals.kibit_marker = v240:switch("Kibit Hit Marker")
		t8.visuals.miss_marker = v240:switch("3D Miss Marker")
		t8.visuals.ot_marker = v240:switch("OT Damage Marker")
		t8.visuals.console_changer = v223:switch("Console Color Changer")

		local v241 = t8.visuals.console_changer:create()

		t8.visuals.console_color = v241:color_picker("Console Color", color(255, 255, 255, 255))
		t8.misc.grenade_release = v220:switch("Grenade Release")

		local v242 = t8.misc.grenade_release:create()

		t8.misc.min_dmg = v242:slider("Min. Damage", 0, 50, 50)
		t8.misc.grenade_release:tooltip(
		"Throws a grenade when it is possible to inflict minimum damage specified in script settings, in case of a molotov if molotov will hit the enemy. Works with grenade prediction enabled.")
		t8.misc.grenade_fix = v220:switch("Nade Throw Fix")
		t8.misc.grenade_fix:tooltip("Fix the moment when you try to throw a grenade and it is not thrown.")
		t8.antiaims.antiaim_mode = v218:combo("\a{Link Active}\239\147\191   \aDEFAULTMode", {
			[1] = "Disabled",
			[2] = "Classic Jitter",
			[3] = "Defensive Preset",
			[4] = "Conditional"
		})
		t8.antiaims.manual_aa = v218:combo("\a{Link Active}\238\146\190   \aDEFAULTManual AA", {
			[1] = "Disabled",
			[2] = "Left",
			[3] = "Right",
			[4] = "Forward"
		})

		local v243 = t8.antiaims.manual_aa:create()

		t8.antiaims.disablermanual = v243:switch("Disable Yaw Modifiers")
		t8.antiaims.condition = v219:combo("Current Condition", {
			[1] = "Global",
			[2] = "Standing",
			[3] = "Moving",
			[4] = "Slow motion",
			[5] = "Air",
			[6] = "Air Crouch",
			[7] = "Crouch",
			[8] = "Crouch Move"
		}, 0)
		t8.antiaims.tp = v218:label(
		"You are using an automatic preset, you don't need to adjust it. Just press it and go play.")
		t8.antiaims.antiaims_tweaks = v217:selectable("\a{Link Active}\239\132\174   \aDEFAULTTweaks", {
			[1] = "Bombsite E Fix",
			[2] = "Legit AA",
			[3] = "Dis. AA on Warmup",
			[4] = "Avoid Backstab",
			[5] = "Fluctuate Fake Lag",
			[6] = "Auto Teleport",
			[7] = "Fast Ladder",
			[8] = "No Fall Damage"
		})

		local v244 = t8.antiaims.antiaims_tweaks:create()

		t8.antiaims.weapons = v244:selectable("[AutoTP] Weapons", "Pistols", "Auto Snipers", "AWP", "SSG-08",
			"Heavy Pistols", "Knife/Taser")
		t8.antiaims.delayticks = v244:slider("[AutoTP] Delay", 1, 16, 1, nil, "t")
		t8.antiaims.antiaims_tweaks:set_callback(function(p49)
			-- upvalues: t8 (ref)
			t8.antiaims.weapons:visibility(p49:get("Auto Teleport"))
			t8.antiaims.delayticks:visibility(p49:get("Auto Teleport"))
		end, true)
		t8.antiaims.safehead = v217:selectable("\a{Link Active}\239\148\132   \aDEFAULTSafe Head", {
			[1] = "Bomb",
			[2] = "Knife / Taser",
			[3] = "Fake-Lag",
			[4] = "Crouching"
		})
		t8.antiaims.force_lag = v217:switch("\a{Link Active}\239\135\158   \aDEFAULTForce Break LC")

		local v245 = t8.antiaims.force_lag:create()

		t8.antiaims.lag_conditions = v245:selectable("Conditions", {
			[1] = "In Air",
			[2] = "Standing",
			[3] = "Moving",
			[4] = "Slow Walking",
			[5] = "Crouching",
			[6] = "Crouch Move"
		})
		t8.antiaims.defensive_aa = v217:switch("\a{Link Active}\238\146\187   \aDEFAULTDefensive AA", false)

		local v246 = t8.antiaims.defensive_aa:create()

		t8.antiaims.defensive_type = v246:combo("Type", {
			[1] = "Presets",
			[2] = "Custom"
		})
		t8.antiaims.defensive_pitch = v246:combo("Pitch", {
			[1] = "Disabled",
			[2] = "Up",
			[3] = "Down",
			[4] = "Semi Up",
			[5] = "Semi Down",
			[6] = "Random"
		})
		t8.antiaims.defensive_yaw = v246:combo("Yaw", {
			[1] = "Disabled",
			[2] = "Sideways",
			[3] = "Opposite",
			[4] = "Spin",
			[5] = "Random",
			[6] = "3-Way",
			[7] = "5-Way"
		})
		t8.antiaims.custom_pitch = v246:slider("Custom Pitch", -89, 89, 0)
		t8.antiaims.custom_yaw = v246:slider("Custom Yaw", -180, 180, 0)
		t8.antiaims.defensive_disablers = v246:selectable("Disablers", {
			[1] = "Manuals",
			[2] = "Grenades"
		})
		t8.antiaims.espam = v246:switch("E-Spam while Safe Head")
		t8.antiaims.defensive_type:set_callback(function(p50)
			-- upvalues: t8 (ref)
			t8.antiaims.defensive_pitch:visibility(p50:get() == "Presets")
			t8.antiaims.defensive_yaw:visibility(p50:get() == "Presets")
			t8.antiaims.custom_pitch:visibility(p50:get() == "Custom")
			t8.antiaims.custom_yaw:visibility(p50:get() == "Custom")
		end, true)
		t8.antiaims.freestanding = v217:switch("\a{Link Active}\239\129\135   \aDEFAULTFreestanding")

		local v247 = t8.antiaims.freestanding:create()

		t8.antiaims.body_freestanding = v247:switch("Body Freestanding")
		t8.antiaims.disable_manual = v247:switch("Disable on Manuals")
		t8.antiaims.yawmodif = v247:switch("Disable Yaw Mod.")
		t8.antiaims.anim_breakers = v217:switch("\a{Link Active}\239\138\154   \aDEFAULTAnim. Breakers")

		local v248 = t8.antiaims.anim_breakers:create()

		t8.antiaims.type_legs_ground = v248:combo("On Ground", {
			[1] = "Disable",
			[2] = "Follow Direction",
			[3] = "Moon Walk",
			[4] = "Jitter"
		})
		t8.antiaims.type_legs_air = v248:combo("In Air", {
			[1] = "Disable",
			[2] = "Static",
			[3] = "Moon Walk"
		})
		t8.antiaims.static_slow = v248:switch("Sliding On Slow-Walk")
		t8.antiaims.custom_move = v248:switch("Move Lean")
		t8.antiaims.move_lean = v248:slider("Move Lean Force", 0, 100, 0, nil, "%")
		t8.antiaims.custom_move:set_callback(function(p51)
			-- upvalues: t8 (ref)
			t8.antiaims.move_lean:visibility(p51:get())
		end, true)
		t8.ragebot.rev_help = v221:switch("Revolver Helper")
		t8.ragebot.rev_help:tooltip(
		"Shows \"DMG+\" indicator next to opponent if you can give 100 damage an opponent with a revolver.\nYou can edit indicator position in esp settings.")
		t8.ragebot.hc_enable = v221:switch("Hitchance Additionals")

		local v249 = t8.ragebot.hc_enable:create()

		t8.ragebot.hc_cond = v249:selectable("Condition", {
			[1] = "Air",
			[2] = "No scope"
		})
		t8.ragebot.hc_air = v249:slider("Air", 0, 100, 55)
		t8.ragebot.hc_ns = v249:slider("No scope", 0, 100, 55)
		t8.ragebot.hc_cond:set_callback(function(p52)
			-- upvalues: t8 (ref)
			t8.ragebot.hc_air:visibility(p52:get("Air"))
			t8.ragebot.hc_ns:visibility(p52:get("No scope"))
		end, true)
		t8.ragebot.fakelatency = v221:switch("Unlock Fake Latency")
		t8.ragebot.fakelatency:tooltip("Removes 100ms limit in ping spike")

		local t9 = {}

		for i = 1, 8 do
			local v252 = string.rep(" ", i)

			t8.antiaims_builder[i] = {}
			t8.antiaims_builder[i].enabled = v219:switch("Enable Condition" .. v252, false)
			t8.antiaims_builder[i].pitch = v219:combo("Pitch" .. v252, {
				[1] = "Disabled",
				[2] = "Down",
				[3] = "Fake Down",
				[4] = "Fake Up"
			})
			t8.antiaims_builder[i].yaw = v219:combo("Yaw" .. v252, {
				[1] = "Disabled",
				[2] = "Backward",
				[3] = "Static"
			})

			local v253 = t8.antiaims_builder[i].yaw:create()

			t8.antiaims_builder[i].base = v253:combo("Base" .. v252, {
				[1] = "Local View",
				[2] = "At Target"
			})
			t8.antiaims_builder[i].type = v253:combo("Yaw Mode" .. v252, {
				[1] = "Default",
				[2] = "Left/Right",
				[3] = "Delayed"
			})
			t8.antiaims_builder[i].delay = v253:switch("Swap compatible with inverter" .. v252)
			t8.antiaims_builder[i].offset_l = v253:slider("Offset" .. v252, -180, 180, 0, nil, "°")
			t8.antiaims_builder[i].offset_r = v253:slider("Offset R" .. v252, -180, 180, 0, nil, "°")
			t8.antiaims_builder[i].per_tick = v253:slider("Delay ticks" .. v252, 3, 24, 12, nil, "t")
			t8.antiaims_builder[i].jyaw = v219:combo("Yaw Modifier" .. v252, {
				[1] = "Disabled",
				[2] = "Center",
				[3] = "Offset",
				[4] = "Random",
				[5] = "Spin",
				[6] = "3-Way",
				[7] = "5-Way"
			})

			local v254 = t8.antiaims_builder[i].jyaw:create()

			t8.antiaims_builder[i].mode = v254:combo("Mode" .. v252, {
				[1] = "Static",
				[2] = "Random (From/To)",
				[3] = "Left/Right"
			})
			t8.antiaims_builder[i].type_mod = v254:combo("Settings" .. v252, {
				[1] = "Default",
				[2] = "Custom"
			})
			t8.antiaims_builder[i].offset_one = v254:slider("Offset #1" .. v252, -180, 180, 0, nil, "°")
			t8.antiaims_builder[i].offset_two = v254:slider("Offset #2" .. v252, -180, 180, 0, nil, "°")
			t8.antiaims_builder[i].way1 = v254:slider("1 Way" .. v252, -180, 180, 0, nil, "°")
			t8.antiaims_builder[i].way2 = v254:slider("2 Way" .. v252, -180, 180, 0, nil, "°")
			t8.antiaims_builder[i].way3 = v254:slider("3 Way" .. v252, -180, 180, 0, nil, "°")
			t8.antiaims_builder[i].way4 = v254:slider("4 Way" .. v252, -180, 180, 0, nil, "°")
			t8.antiaims_builder[i].way5 = v254:slider("5 Way" .. v252, -180, 180, 0, nil, "°")
			t8.antiaims_builder[i].body_yaw = v219:switch("Body Yaw" .. v252, false)

			local v255 = t8.antiaims_builder[i].body_yaw:create()

			t8.antiaims_builder[i].fake_slider_main = v255:slider("Left Limit" .. v252, 0, 60, 60, nil, "°")
			t8.antiaims_builder[i].fake_slider_next = v255:slider("Right Limit" .. v252, 0, 60, 60, nil, "°")
			t8.antiaims_builder[i].fake_op = v255:selectable("Fake Options" .. v252, {
				[1] = "Avoid Overlap",
				[2] = "Jitter",
				[3] = "Randomize Jitter",
				[4] = "Anti Bruteforce"
			}, 0)
			t8.antiaims_builder[i].freestand = v255:combo("Freestand DS" .. v252, {
				[1] = "Off",
				[2] = "Peek Fake",
				[3] = "Peek Real"
			}, 0)
			t8.antiaims_builder[i].inverter = v255:switch("Inverter AA" .. v252, false)
		end

		local antiaims_builder = t8.antiaims_builder

		function t9.hide_all_custom()
			-- upvalues: antiaims_builder (copy)
			for i = 1, 8 do
				for _, v in pairs(antiaims_builder[i]) do
					if v:visibility() then
						v:visibility(false)
					end
				end
			end
		end

		function t9.unhide_cur_custom(_, p54)
			-- upvalues: antiaims_builder (copy)
			if not antiaims_builder[p54].enabled:get() then
				for _, v in pairs(antiaims_builder[p54]) do
					if v:visibility() then
						v:visibility(false)
					end
				end
			else
				for _, v in pairs(antiaims_builder[p54]) do
					if not v:visibility() then
						v:visibility(true)
					end
				end
			end

			antiaims_builder[p54].enabled:visibility(true)
		end

		function t9.unhide_cur_enable_state(_, p56)
			-- upvalues: antiaims_builder (copy)
			antiaims_builder[p56].enabled:visibility(true)
		end

		function t9.strange(_, p58)
			if p58 ~= "Global" then
				if p58 ~= "Standing" then
					if p58 ~= "Moving" then
						if p58 ~= "Slow motion" then
							if p58 ~= "Air" then
								if p58 ~= "Air Crouch" then
									if p58 ~= "Crouch" then
										if p58 ~= "Crouch Move" then
											if p58 ~= "Dormant" then
												return
											end

											return 8
										end

										return 7
									end

									return 6
								end

								return 5
							end

							return 4
						end

						return 3
					end

					return 2
				end

				return 1
			end

			return 0
		end

		function t9.init_handle(_)
			-- upvalues: events (copy), get_alpha (copy), t8 (ref), t9 (ref), antiaims_builder (copy)
			events.pre_render:set(function()
				-- upvalues: get_alpha (copy), t8 (ref), t9 (ref), antiaims_builder (copy)
				if get_alpha() == 1 then
					local v792 = t8.antiaims.antiaim_mode:get()

					t9:hide_all_custom()
					t8.antiaims.condition:visibility(v792 == "Conditional")

					if v792 == "Conditional" then
						t9:unhide_cur_custom(t9:strange(t8.antiaims.condition:get()) + 1)
						t9:unhide_cur_enable_state(t9:strange(t8.antiaims.condition:get()) + 1)

						for i = 1, 8 do
							if antiaims_builder[i].jyaw:get() == "5-Way" or antiaims_builder[i].jyaw:get() == "3-Way" then
								antiaims_builder[i].mode:visibility(false)
							end

							if antiaims_builder[i].jyaw:get() == "3-Way" and antiaims_builder[i].type_mod:get() == "Custom" then
								antiaims_builder[i].offset_one:visibility(false)
								antiaims_builder[i].offset_two:visibility(false)
								antiaims_builder[i].way1:visibility(true)
								antiaims_builder[i].way2:visibility(true)
								antiaims_builder[i].way3:visibility(true)
								antiaims_builder[i].way4:visibility(false)
								antiaims_builder[i].way5:visibility(false)
							end

							if antiaims_builder[i].jyaw:get() == "5-Way" and antiaims_builder[i].type_mod:get() == "Custom" then
								antiaims_builder[i].offset_one:visibility(false)
								antiaims_builder[i].offset_two:visibility(false)
								antiaims_builder[i].way1:visibility(true)
								antiaims_builder[i].way2:visibility(true)
								antiaims_builder[i].way3:visibility(true)
								antiaims_builder[i].way4:visibility(true)
								antiaims_builder[i].way5:visibility(true)
							end

							if antiaims_builder[i].jyaw:get() == "5-Way" and antiaims_builder[i].type_mod:get() == "Default" then
								antiaims_builder[i].offset_two:visibility(false)
								antiaims_builder[i].way1:visibility(false)
								antiaims_builder[i].way2:visibility(false)
								antiaims_builder[i].way3:visibility(false)
								antiaims_builder[i].way4:visibility(false)
								antiaims_builder[i].way5:visibility(false)
							end

							if antiaims_builder[i].jyaw:get() == "3-Way" and antiaims_builder[i].type_mod:get() == "Default" then
								antiaims_builder[i].offset_two:visibility(false)
								antiaims_builder[i].way1:visibility(false)
								antiaims_builder[i].way2:visibility(false)
								antiaims_builder[i].way3:visibility(false)
								antiaims_builder[i].way4:visibility(false)
								antiaims_builder[i].way5:visibility(false)
							end

							if antiaims_builder[i].jyaw:get() ~= "5-Way" and antiaims_builder[i].jyaw:get() ~= "3-Way" then
								antiaims_builder[i].type_mod:visibility(false)
								antiaims_builder[i].way1:visibility(false)
								antiaims_builder[i].way2:visibility(false)
								antiaims_builder[i].way3:visibility(false)
								antiaims_builder[i].way4:visibility(false)
								antiaims_builder[i].way5:visibility(false)
							end

							if antiaims_builder[i].type:get() ~= "Delayed" then
								antiaims_builder[i].per_tick:visibility(false)
								antiaims_builder[i].delay:visibility(false)
							end

							if antiaims_builder[i].type:get() == "Default" then
								antiaims_builder[i].offset_r:visibility(false)
							end

							if antiaims_builder[i].mode:get() == "Static" then
								antiaims_builder[i].offset_two:visibility(false)
							end
						end

						antiaims_builder[1].enabled:visibility(false)
						antiaims_builder[1].enabled:set(true)
						t8.antiaims.condition:visibility(true)
					end

					return
				end
			end)
		end

		p41.global = t6
		p41.info_group = v210
		p41.elements = t8
		p41.antiaim_builder = t9
		t9:init_handle()
	end
}):struct("refs")({
	enable_desync = find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
	yaw_base = find("Aimbot", "Anti Aim", "Angles", "Yaw"),
	pitch = find("Aimbot", "Anti Aim", "Angles", "Pitch"),
	yaw = find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
	fake_op = find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
	base_yaw = find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
	freestand = find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"),
	hidden = find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"),
	slowwalk = find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
	jyaw = find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
	jyaw_slider = find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"),
	fake_duck = find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
	freestanding_def = find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
	left_limit = find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
	right_limit = find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
	dt = find("Aimbot", "Ragebot", "Main", "Double Tap"),
	hs = find("Aimbot", "Ragebot", "Main", "Hide shots"),
	body_aim = find("Aimbot", "Ragebot", "Safety", "Body Aim"),
	safe_point = find("Aimbot", "Ragebot", "Safety", "Safe Points"),
	auto_peek = find("Aimbot", "Ragebot", "Main", "Peek Assist"),
	freestanding_yaw = find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
	hitchance = find("Aimbot", "Ragebot", "Selection", "Hit Chance"),
	min_dmg = find("Aimbot", "Ragebot", "Selection", "Min. Damage"),
	base = find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
	dormantaim = find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"),
	pingspike = find("Miscellaneous", "Main", "Other", "Fake Latency"),
	legmovement = find("Aimbot", "Anti Aim", "Misc", "Leg Movement"),
	logs = find("Miscellaneous", "Main", "Other", "Log Events"),
	inverter1 = find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
	disablers = find("Aimbot", "Ragebot", "Safety", "Body Aim", "Disablers")
}):struct("config_system")({
	init = function(p60)
		-- upvalues: base64 (copy), clipboard (copy), add_notify (copy), v70 (copy)
		local s2 = "nl/scripts/mytools/mytools.config"
		local t10 = {}

		Cipher = {
			encode = function(p61, _)
				-- upvalues: base64 (copy)
				return "[mytools]" .. tostring(base64.encode(p61)) .. "[/mytools]"
			end,
			decode = function(p63, _)
				-- upvalues: base64 (copy)
				local _, stop = p63:find("[mytools]", 1, true)
				local start, _ = p63:find("[/mytools]", 1, true)
				local v650 = p63:sub(stop + 1, start - 1):gsub(" ", "")

				return tostring(base64.decode(v650))
			end
		}

		function t10.import(p65, p66, _)
			-- upvalues: base64 (copy), clipboard (copy), p60 (copy), add_notify (copy), v70 (copy)
			local ok, result5 = pcall(function()
				-- upvalues: base64 (copy), p65 (copy), clipboard (copy)
				return json.parse(base64.decode(type(p65) == "table" and clipboard.get() or p65))
			end)

			if p66 ~= nil then
				ok, result5 = pcall(function()
					-- upvalues: base64 (copy), p66 (copy)
					return json.parse(base64.decode(p66:gsub("%s", "")))
				end)
			end

			if ok then
				for _, v in pairs(result5) do
					for k, v5 in pairs(p60.menu.elements) do
						if (not skip_data:get("Anti-Aims") or string.find(k, "antiaims") ~= nil and string.find(k, "antiaims_builder") ~= nil) and (not skip_data:get("Ragebot") or string.find(k, "ragebot") ~= nil) and ((not skip_data:get("Misc/Vis") or string.find(k, "misc") ~= nil and string.find(k, "visuals") ~= nil) and k == v.tab) then
							for _, v6 in pairs(v5) do
								if v70(v6) ~= "table" then
									if v.name == v6:name() then
										v6:set(v.var)
									end
								else
									for _, v7 in pairs(v6) do
										if v.name == v7:name() then
											v7:set(v.var)
										end
									end
								end
							end
						end
					end
				end

				add_notify("mytools", "\a89F2CAFF✔\239\184\143 Successfully Loaded Your Config")
				p60.impt.play_sound("physics/wood/wood_plank_impact_hard4.wav", 0.12)

				return
			end

			p60.impt.play_sound("error.wav", 0.12)
			add_notify("mytools", "\aFF8B7AFF❌ There was an Error while Loading Your Config!")
		end

		function t10.save()
			-- upvalues: p60 (copy), s2 (copy), add_notify (copy)
			local v664 = p60.menu.global.preset_name:get()
			local _, _ = pcall(function()
				-- upvalues: s2 (copy), p60 (copy), v664 (copy), add_notify (copy)
				local v794 = files.read(s2)
				local ok, result6 = pcall(function()
					-- upvalues: v794 (copy)
					return json.parse(v794)
				end)

				if not ok or #result6 == 0 then
					result6 = {}
				end

				local v797 = p60.menu.global.preset_list:get()
				local v798 = p60.menu.global.preset_list:list()
				local n2 = 0

				if v664:gsub(" ", "") == "" or v664 == "" then
					n2 = 1

					for i = 1, #result6 do
						if result6[i].name == v798[v797] then
							n2 = -1
							result6[i].code = p60.config_system:export()
							files.write(s2, json.stringify(result6))
						end
					end
				end

				for i = 1, #result6 do
					if result6[i].name == v664 then
						result6[i].code = p60.config_system:export()
						files.write(s2, json.stringify(result6))
						p60.menu.global.preset_name:set("")
						n2 = -2

						break
					end
				end

				if v664:gsub(" ", "") ~= "" then
					local v802 = true

					for i = 1, #result6 do
						if result6[i].name == v664 then
							v802 = false
						end
					end

					if v802 then
						table.insert(result6, {
							code = p60.config_system:export(),
							name = v664
						})

						local t11 = {}

						for i = 1, #result6 do
							table.insert(t11, result6[i].name)
						end

						files.write(s2, json.stringify(result6))
						p60.menu.global.preset_list:update(t11)
						p60.menu.global.preset_name:set("")
						n2 = -3
					end
				end

				if n2 ~= 1 then
					if n2 == 0 then
						p60.impt.play_sound("error.wav", 0.12)
						add_notify("mytools", "\aFF8B7AFF❌ There was an Error while Saving Your Config!")
					else
						add_notify("mytools", "\a89F2CAFF✔\239\184\143 Successfully Saved Your Config")
						p60.impt.play_sound("physics/wood/wood_plank_impact_hard4.wav", 0.12)
					end

					return
				end

				p60.impt.play_sound("error.wav", 0.12)
				add_notify("mytools", "\aFF8B7AFF⚠\239\184\143 Enter Valid Config Name!")
			end)
		end

		function t10.delete()
			-- upvalues: p60 (copy), s2 (copy)
			local v667 = p60.menu.global.preset_list:get()
			local v668 = files.read(s2)
			local ok, result7 = pcall(function()
				-- upvalues: v668 (copy)
				return json.parse(v668)
			end)

			if not ok or #result7 == 0 then
				result7 = {}
			end

			table.remove(result7, v667)
			files.write(s2, json.stringify(result7))

			local t12 = {}

			for i = 1, #result7 do
				table.insert(t12, result7[i].name)
			end

			p60.menu.global.preset_list:update(#t12 == 0 and {
				[1] = "\a{Link Active}Mytools. \aCBC9C9FFCreate preset."
			} or t12)
			p60.impt.play_sound("physics/wood/wood_plank_impact_hard4.wav", 0.12)
		end

		function t10.export()
			-- upvalues: p60 (copy), v70 (copy), base64 (copy), clipboard (copy)
			local t13 = {}

			for k, v in pairs(p60.menu.elements) do
				for _, v8 in pairs(v) do
					if v70(v8) ~= "table" then
						table.insert(t13, {
							tab = k,
							name = v8:name(),
							var = v70(v8:get()) == "imcolor" and v8:get():to_hex() or v8:get()
						})
					else
						for _, v9 in pairs(v8) do
							table.insert(t13, {
								tab = k,
								name = v9:name(),
								var = v70(v9:get()) == "imcolor" and v9:get():to_hex() or v9:get()
							})
						end
					end
				end
			end

			local v680 = base64.encode(json.stringify(t13))

			clipboard.set(v680)

			return v680
		end

		function t10.load()
			-- upvalues: p60 (copy), add_notify (copy), base64 (copy), v70 (copy)
			local v681 = p60.menu.global.preset_list:get()
			local v682 = files.read("nl/scripts/mytools/mytools.config")
			local ok, result8 = pcall(json.parse, v682)

			if ok and (type(result8) == "table" and #result8 ~= 0) then
				if result8[v681] and result8[v681].code then
					local v685 = tostring(result8[v681].code):gsub("%s", "")
					local v686 = base64.decode(v685)
					local ok4, result9 = pcall(json.parse, v686)

					if not ok4 then
						local v689 = v686:gsub("\\u(%x%x%x%x)", function(p68)
							local num2 = tonumber(p68, 16)

							if not (num2 < 128) then
								return "\\u" .. p68
							end

							return string.char(num2)
						end)

						ok4, result9 = pcall(json.parse, v689)
					end

					if ok4 and type(result9) == "table" then
						local n3 = 0

						local function v691(p69, p70)
							-- upvalues: n3 (ref)
							local ok5, result10 = pcall(function()
								-- upvalues: p69 (copy)
								return p69:name()
							end)

							if ok5 and result10 == p70.name then
								pcall(function()
									-- upvalues: p69 (copy), p70 (copy)
									p69:set(p70.var)
								end)
								n3 = n3 + 1
							end
						end

						for _, v in pairs(result9) do
							local v694 = p60.menu.elements[v.tab]

							if v694 then
								for _, v10 in pairs(v694) do
									if v70(v10) ~= "table" then
										v691(v10, v)
									else
										for _, v11 in pairs(v10) do
											if v70(v11) ~= "table" then
												v691(v11, v)
											else
												for _, v12 in pairs(v11) do
													v691(v12, v)
												end
											end
										end
									end
								end
							end
						end

						add_notify("mytools", "\a89F2CAFF✔\239\184\143 Preset loaded (" .. n3 .. " values)")
						p60.impt.play_sound("physics/wood/wood_plank_impact_hard4.wav", 0.12)

						return
					end

					p60.impt.play_sound("error.wav", 0.12)
					add_notify("mytools", "\aFF8B7AFF❌ Error while parsing JSON")

					return
				end

				p60.impt.play_sound("error.wav", 0.12)
				add_notify("mytools", "\aFF8B7AFF❌ Preset not found")

				return
			end

			p60.impt.play_sound("error.wav", 0.12)
			add_notify("mytools", "\aFF8B7AFF❌ nl/scripts/mytools/mytools.config not found ")
		end

		p60.save = t10.save
		p60.delete = t10.delete
		p60.import = t10.import
		p60.export = t10.export
		p60.load = t10.load
	end
})

v71.menu:init()
v71.config_system:init()

local t14 = {
	Number = 0
}
local antiaims_builder = v71.menu.elements.antiaims_builder
local t15 = {
	get_velocity = function(_, p72)
		if p72 ~= nil then
			local m_vecVelocity = p72.m_vecVelocity

			if m_vecVelocity.x ~= nil then
				return math.sqrt(m_vecVelocity.x * m_vecVelocity.x + m_vecVelocity.y * m_vecVelocity.y +
				m_vecVelocity.z * m_vecVelocity.z)
			end

			return
		end
	end,
	state = function(_, p74, _, p76)
		-- upvalues: get_local_player (copy), v71 (copy)
		local function v267()
			-- upvalues: get_local_player (copy)
			local m_fFlags = get_local_player().m_fFlags

			if bit.band(m_fFlags, 4) ~= 4 then
				return false
			end

			return true
		end

		if p74 ~= nil then
			local v268 = get_local_player()

			if not (p74 < 5) or p76.in_jump or v267(v268) or v71.refs.fake_duck:get() then
				if not p76.in_jump or v267(v268) then
					if not p76.in_jump or not v267(v268) then
						if not (p74 > 5) or not v267(v268) and not v71.refs.fake_duck:get() then
							if not v267(v268) and not v71.refs.fake_duck:get() then
								if not v71.refs.slowwalk:get() then
									cnds = 3
								else
									cnds = 4
								end
							else
								cnds = 7
							end
						else
							cnds = 8
						end
					else
						cnds = 6
					end
				else
					cnds = 5
				end
			else
				cnds = 2
			end

			return cnds
		end
	end
}

function t15.custom_preset()
	-- upvalues: events (copy), get_local_player (copy), t15 (ref), antiaims_builder (copy), v71 (copy), find (copy), t14 (copy)
	events.createmove:set(function(p77)
		-- upvalues: get_local_player (copy), t15 (ref), antiaims_builder (copy), v71 (copy), find (copy), t14 (copy)
		if get_local_player() ~= nil then
			local v703 = get_local_player()
			local v704 = t15:get_velocity(v703)
			local v705 = t15:state(v704, nil, p77)
			local _ = side

			if antiaims_builder[v705] ~= nil then
				if v71.menu.elements.antiaims.antiaim_mode:get() == "Classic Jitter" or v71.menu.elements.antiaims.antiaim_mode:get() == "Defensive Preset" then
					if v71.menu.elements.antiaims.antiaim_mode:get() ~= "Classic Jitter" then
						if v71.menu.elements.antiaims.antiaim_mode:get() == "Defensive Preset" then
							if v705 ~= 1 then
								if v705 ~= 2 then
									if v705 ~= 3 then
										if v705 ~= 4 then
											if v705 ~= 5 then
												if v705 ~= 6 then
													if v705 == 7 then
														v71.refs.base_yaw:override("At Target")
														v71.refs.pitch:override("Down")
														v71.refs.yaw_base:override("Backward")

														if v71.refs.dt:get() or v71.refs.hs:get() then
															v71.refs.yaw:override(rage.antiaim:inverter() == true and 0 or
															-15)
															v71.refs.jyaw:override("3 Way")
															v71.refs.jyaw_slider:override(math.random(-45, -70))
															v71.refs.fake_op:override({
																[1] = "Jitter"
															})
															v71.refs.left_limit:override(38)
															v71.refs.right_limit:override(29)
															v71.refs.inverter1:override(false)
														else
															v71.refs.yaw:override(0)
															v71.refs.jyaw:override("Disabled")
															v71.refs.jyaw_slider:override(0)
															v71.refs.fake_op:override("")
															v71.refs.left_limit:override(25)
															v71.refs.right_limit:override(25)
															v71.refs.inverter1:override(false)
														end

														v71.refs.hidden:override(true)
														v71.refs.freestand:override("Off")
														v71.refs.enable_desync:override(true)
														find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options")
															:override("Always On")
														find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
															:override("Break LC")
														rage.antiaim:override_hidden_pitch(math.random(-89, 89))
													end
												else
													v71.refs.base_yaw:override("At Target")
													v71.refs.pitch:override("Down")
													v71.refs.yaw_base:override("Backward")

													if v71.refs.dt:get() or v71.refs.hs:get() then
														v71.refs.yaw:override(rage.antiaim:inverter() == true and 15 or
														37)
														v71.refs.jyaw:override("Offset")
														v71.refs.jyaw_slider:override(rage.antiaim:inverter() == true and
														0 or -89)
														v71.refs.fake_op:override({
															[1] = "Jitter"
														})
														v71.refs.left_limit:override(60)
														v71.refs.right_limit:override(60)
													else
														v71.refs.yaw:override(0)
														v71.refs.jyaw:override("Disabled")
														v71.refs.jyaw_slider:override(0)
														v71.refs.fake_op:override("")
														v71.refs.left_limit:override(25)
														v71.refs.right_limit:override(25)
													end

													v71.refs.hidden:override(true)
													v71.refs.freestand:override("Off")
													v71.refs.inverter1:override(false)
													v71.refs.enable_desync:override(true)
													find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options")
														:override("Always On")
													find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):override(
													"Break LC")
													rage.antiaim:override_hidden_pitch(math.random(-89, 89))
												end
											else
												v71.refs.base_yaw:override("At Target")
												v71.refs.pitch:override("Down")
												v71.refs.yaw_base:override("Backward")

												if v71.refs.dt:get() or v71.refs.hs:get() then
													v71.refs.yaw:override(40)
													v71.refs.jyaw:override("Random")
													v71.refs.jyaw_slider:override(rage.antiaim:inverter() == true and 0 or
													-44)
													v71.refs.fake_op:override({
														[1] = "Jitter"
													})
													v71.refs.left_limit:override(60)
													v71.refs.right_limit:override(60)
												else
													v71.refs.yaw:override(0)
													v71.refs.jyaw:override("Disabled")
													v71.refs.jyaw_slider:override(0)
													v71.refs.fake_op:override("")
													v71.refs.left_limit:override(25)
													v71.refs.right_limit:override(25)
												end

												v71.refs.hidden:override(true)
												v71.refs.freestand:override("Off")
												v71.refs.inverter1:override(false)
												v71.refs.enable_desync:override(true)
												find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override(
												"Always On")
												find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):override(
												"Break LC")
												rage.antiaim:override_hidden_pitch(math.random(-89, 89))
											end
										else
											v71.refs.base_yaw:override("At Target")
											v71.refs.pitch:override("Down")
											v71.refs.yaw_base:override("Backward")
											v71.refs.yaw:override(43)
											v71.refs.jyaw:override("Offset")
											v71.refs.jyaw_slider:override(math.random(-65, -85))
											v71.refs.fake_op:override({
												[1] = "Jitter"
											})
											v71.refs.left_limit:override(30)
											v71.refs.right_limit:override(30)
											v71.refs.hidden:override(false)
											v71.refs.freestand:override("Off")
											v71.refs.inverter1:override(false)
											v71.refs.enable_desync:override(true)
											find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override()
											find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):override()
										end
									else
										v71.refs.base_yaw:override("At Target")
										v71.refs.pitch:override("Down")
										v71.refs.yaw_base:override("Backward")
										v71.refs.yaw:override(rage.antiaim:inverter() == true and -25 or 28)
										v71.refs.jyaw:override("Disabled")
										v71.refs.jyaw_slider:override(0)
										v71.refs.fake_op:override({
											[1] = "Jitter"
										})
										v71.refs.left_limit:override(58)
										v71.refs.right_limit:override(58)
										v71.refs.hidden:override(true)
										v71.refs.freestand:override("Off")
										v71.refs.inverter1:override(false)
										v71.refs.enable_desync:override(true)
										rage.antiaim:override_hidden_pitch(math.random(-89, 89))
										find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override()
										find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):override()
									end
								else
									v71.refs.base_yaw:override("At Target")
									v71.refs.pitch:override("Down")
									v71.refs.yaw_base:override("Backward")
									v71.refs.yaw:override(rage.antiaim:inverter() == true and -25 or 28)
									v71.refs.jyaw:override("Disabled")
									v71.refs.jyaw_slider:override(0)
									v71.refs.fake_op:override({
										[1] = "Jitter"
									})
									v71.refs.left_limit:override(58)
									v71.refs.right_limit:override(58)
									v71.refs.hidden:override(false)
									v71.refs.freestand:override("Off")
									v71.refs.inverter1:override(false)
									v71.refs.enable_desync:override(true)
									rage.antiaim:override_hidden_pitch(math.random(-89, 89))
									find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override()
									find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):override()
								end
							else
								v71.refs.pitch:override("Down")
								v71.refs.enable_desync:override(true)
							end
						end
					elseif v705 ~= 1 then
						if v705 ~= 2 then
							if v705 ~= 3 then
								if v705 ~= 4 then
									if v705 ~= 5 then
										if v705 ~= 6 then
											if v705 == 7 then
												v71.refs.base_yaw:override("At Target")
												v71.refs.pitch:override("Down")
												v71.refs.yaw_base:override("Backward")
												v71.refs.yaw:override(0)
												v71.refs.jyaw:override("Center")
												v71.refs.jyaw_slider:override(-15)
												v71.refs.fake_op:override({
													[1] = ""
												})
												v71.refs.left_limit:override(25)
												v71.refs.right_limit:override(25)
												v71.refs.hidden:override(false)
												v71.refs.freestand:override("Off")
												v71.refs.inverter1:override(true)
												v71.refs.enable_desync:override(true)
											end
										else
											v71.refs.base_yaw:override("At Target")
											v71.refs.pitch:override("Down")
											v71.refs.yaw_base:override("Backward")
											v71.refs.yaw:override(rage.antiaim:inverter() == true and 5 or 20)
											v71.refs.jyaw:override("Center")
											v71.refs.jyaw_slider:override(-42)
											v71.refs.fake_op:override({
												[1] = "Jitter"
											})
											v71.refs.left_limit:override(58)
											v71.refs.right_limit:override(58)
											v71.refs.hidden:override(false)
											v71.refs.freestand:override("Off")
											v71.refs.inverter1:override(false)
											v71.refs.enable_desync:override(true)
										end
									else
										v71.refs.base_yaw:override("At Target")
										v71.refs.pitch:override("Down")
										v71.refs.yaw_base:override("Backward")
										v71.refs.yaw:override(35)
										v71.refs.jyaw:override("Offset")
										v71.refs.jyaw_slider:override(-50)
										v71.refs.fake_op:override({
											[1] = "Jitter"
										})
										v71.refs.left_limit:override(60)
										v71.refs.right_limit:override(60)
										v71.refs.hidden:override(false)
										v71.refs.freestand:override("Off")
										v71.refs.inverter1:override(false)
										v71.refs.enable_desync:override(true)
									end
								else
									v71.refs.base_yaw:override("At Target")
									v71.refs.pitch:override("Down")
									v71.refs.yaw_base:override("Backward")
									v71.refs.yaw:override(rage.antiaim:inverter() == true and -30 or 42)
									v71.refs.jyaw:override("Spin")
									v71.refs.jyaw_slider:override(-15)
									v71.refs.fake_op:override({
										[1] = "Jitter"
									})
									v71.refs.left_limit:override(45)
									v71.refs.right_limit:override(45)
									v71.refs.hidden:override(false)
									v71.refs.freestand:override("Off")
									v71.refs.inverter1:override(false)
									v71.refs.enable_desync:override(true)
								end
							else
								v71.refs.base_yaw:override("At Target")
								v71.refs.pitch:override("Down")
								v71.refs.yaw_base:override("Backward")
								v71.refs.yaw:override(rage.antiaim:inverter() == true and -6 or 10)
								v71.refs.jyaw:override("Center")
								v71.refs.jyaw_slider:override(-58)
								v71.refs.fake_op:override({
									[1] = "Jitter"
								})
								v71.refs.left_limit:override(36)
								v71.refs.right_limit:override(36)
								v71.refs.hidden:override(false)
								v71.refs.freestand:override("Off")
								v71.refs.inverter1:override(false)
								v71.refs.enable_desync:override(true)
							end
						else
							v71.refs.base_yaw:override("At Target")
							v71.refs.pitch:override("Down")
							v71.refs.yaw_base:override("Backward")
							v71.refs.yaw:override(rage.antiaim:inverter() == true and -20 or 28)
							v71.refs.jyaw:override("Center")
							v71.refs.jyaw_slider:override(-20)
							v71.refs.fake_op:override({
								[1] = "Jitter"
							})
							v71.refs.left_limit:override(58)
							v71.refs.right_limit:override(58)
							v71.refs.hidden:override(false)
							v71.refs.freestand:override("Off")
							v71.refs.inverter1:override(false)
							v71.refs.enable_desync:override(true)
						end
					else
						v71.refs.pitch:override("Down")
						v71.refs.enable_desync:override(true)
					end

					if v71.menu.elements.antiaims.safehead:get("Crouching") and v705 == 7 then
						v71.refs.yaw:override(0)
						v71.refs.jyaw:override("Disabled")
						v71.refs.jyaw_slider:override(0)
						v71.refs.fake_op:override("")
						v71.refs.left_limit:override(25)
						v71.refs.right_limit:override(25)
						v71.refs.inverter1:override(true)
					end

					if v71.menu.elements.antiaims.safehead:get("Bomb") then
						if get_local_player():get_player_weapon() == nil then
							return
						end

						bomb = get_local_player():get_player_weapon():get_weapon_index() == 49

						if bomb then
							v71.refs.yaw:override(0)
							v71.refs.jyaw:override("Disabled")
							v71.refs.jyaw_slider:override(0)
							v71.refs.fake_op:override("")
							v71.refs.left_limit:override(25)
							v71.refs.right_limit:override(25)
							v71.refs.inverter1:override(true)
						end
					end

					if v71.menu.elements.antiaims.safehead:get("Knife / Taser") then
						if get_local_player():get_player_weapon() == nil then
							return
						end

						knifetaser = get_local_player():get_player_weapon():get_classname() == "CKnife" or
						weapon_index == 31

						if knifetaser then
							v71.refs.yaw:override(0)
							v71.refs.jyaw:override("Disabled")
							v71.refs.jyaw_slider:override(0)
							v71.refs.fake_op:override("")
							v71.refs.left_limit:override(25)
							v71.refs.right_limit:override(25)
							v71.refs.inverter1:override(true)
						end
					end

					if (v71.menu.elements.antiaims.manual_aa:get() == "Right" or v71.menu.elements.antiaims.manual_aa:get() == "Left" or v71.menu.elements.antiaims.manual_aa:get() == "Forward") and v71.menu.elements.antiaims.disablermanual:get() then
						v71.refs.fake_op:override({})
						v71.refs.jyaw:override("Disabled")
					end

					if v71.menu.elements.antiaims.freestanding:get() and v71.menu.elements.antiaims.yawmodif:get() then
						v71.refs.fake_op:override({})
						v71.refs.jyaw:override("Disabled")
					end

					if v71.menu.elements.antiaims.safehead:get("Fake-Lag") and p77.choked_commands > 1 then
						v71.refs.yaw:override(0)
						v71.refs.jyaw:override("Disabled")
						v71.refs.jyaw_slider:override(0)
						v71.refs.fake_op:override("")
						v71.refs.left_limit:override(25)
						v71.refs.right_limit:override(25)
						v71.refs.inverter1:override(true)
					end

					v71.refs.base_yaw:override(v71.menu.elements.antiaims.manual_aa:get() ~= "Disabled" and "Local view" or
					nil)

					if v71.menu.elements.antiaims.manual_aa:get() ~= "Disabled" then
						v71.refs.yaw:override(v71.menu.elements.antiaims.manual_aa:get() == "Left" and -90 or 90)

						if v71.menu.elements.antiaims.manual_aa:get() == "Forward" then
							v71.refs.yaw:override(-180)
						end
					end
				end

				if v71.menu.elements.antiaims.antiaim_mode:get() == "Conditional" then
					local v707 = antiaims_builder[v705].enabled:get() and v705 or 1

					v71.refs.yaw:set(0)
					v71.refs.pitch:override(antiaims_builder[v707].pitch:get())
					v71.refs.yaw_base:override(antiaims_builder[v707].yaw:get())
					v71.refs.base_yaw:override(antiaims_builder[v707].base:get())
					v71.refs.enable_desync:override(antiaims_builder[v707].body_yaw:get())
					v71.refs.left_limit:override(antiaims_builder[v707].fake_slider_main:get())
					v71.refs.right_limit:override(antiaims_builder[v707].fake_slider_next:get())
					v71.refs.inverter1:override(antiaims_builder[v707].inverter:get())

					if antiaims_builder[v707].jyaw:get() ~= "5-Way" then
						if antiaims_builder[v707].jyaw:get() ~= "3-Way" then
							v71.refs.jyaw:override(antiaims_builder[v707].jyaw:get())

							if antiaims_builder[v707].type:get() ~= "Default" then
								if antiaims_builder[v707].type:get() ~= "Left/Right" then
									if antiaims_builder[v707].type:get() == "Delayed" then
										if globals.tickcount % antiaims_builder[v707].per_tick:get() == antiaims_builder[v707].per_tick:get() - 1 then
											some_var = not some_var
										end

										v71.refs.yaw:override(some_var and antiaims_builder[v707].offset_l:get() or
										antiaims_builder[v707].offset_r:get())

										if antiaims_builder[v707].delay:get() then
											v71.refs.inverter1:override(some_var and true or false)
										end
									end
								else
									v71.refs.yaw:override(rage.antiaim:inverter() == true and
									antiaims_builder[v707].offset_l:get() or antiaims_builder[v707].offset_r:get())
								end
							else
								v71.refs.yaw:override(antiaims_builder[v707].offset_l:get())
							end

							if antiaims_builder[v707].mode:get() ~= "Static" then
								if antiaims_builder[v707].mode:get() ~= "Random (From/To)" then
									if antiaims_builder[v707].mode:get() == "Left/Right" then
										v71.refs.jyaw_slider:override(rage.antiaim:inverter() == true and
										antiaims_builder[v707].offset_one:get() or
										antiaims_builder[v707].offset_two:get())
									end
								else
									v71.refs.jyaw_slider:override(math.random(antiaims_builder[v707].offset_one:get(),
										antiaims_builder[v707].offset_two:get()))
								end
							else
								v71.refs.jyaw_slider:override(antiaims_builder[v707].offset_one:get())
							end
						elseif antiaims_builder[v707].type_mod:get() ~= "Custom" then
							if antiaims_builder[v707].type_mod:get() == "Default" then
								v71.refs.jyaw:override(antiaims_builder[v707].jyaw:get())
								v71.refs.jyaw_slider:override(antiaims_builder[v707].offset_one:get())
							end
						else
							local _ = {
								[1] = 0,
								[2] = 0,
								[3] = 0
							}

							v71.refs.jyaw:override("Disabled")
							v71.refs.jyaw_slider:override(0)

							local t16 = {
								antiaims_builder[v707].way1:get(),
								antiaims_builder[v707].way2:get(),
								antiaims_builder[v707].way3:get()
							}
							local v710 = v71.refs.yaw:get()

							t14.Number = t14.Number + 1

							if t14.Number > #t16 then
								t14.Number = 1
							end

							if t16[t14.Number] ~= nil then
								v710 = v710 + t16[t14.Number]
							end

							v71.refs.yaw:override(v710)
						end
					elseif antiaims_builder[v707].type_mod:get() ~= "Custom" then
						if antiaims_builder[v707].type_mod:get() == "Default" then
							v71.refs.jyaw:override(antiaims_builder[v707].jyaw:get())
							v71.refs.jyaw_slider:override(antiaims_builder[v707].offset_one:get())
						end
					else
						local _ = {
							[1] = 0,
							[2] = 0,
							[3] = 0
						}

						v71.refs.jyaw:override("Disabled")
						v71.refs.jyaw_slider:override(0)

						local t17 = {
							antiaims_builder[v707].way1:get(),
							antiaims_builder[v707].way2:get(),
							antiaims_builder[v707].way3:get(),
							antiaims_builder[v707].way4:get(),
							antiaims_builder[v707].way5:get()
						}
						local v713 = v71.refs.yaw:get()

						t14.Number = t14.Number + 1

						if t14.Number > #t17 then
							t14.Number = 1
						end

						if t17[t14.Number] ~= nil then
							v713 = v713 + t17[t14.Number]
						end

						v71.refs.yaw:override(v713)
					end

					v71.refs.fake_op:override(antiaims_builder[v707].fake_op:get())
					v71.refs.freestand:override(antiaims_builder[v707].freestand:get())

					local v714 = v71.menu.elements.antiaims.manual_aa:get()

					if v71.menu.elements.antiaims.safehead:get("Crouching") and v705 == 7 then
						v71.refs.yaw:override(0)
						v71.refs.jyaw:override("Disabled")
						v71.refs.jyaw_slider:override(0)
						v71.refs.fake_op:override("")
						v71.refs.left_limit:override(25)
						v71.refs.right_limit:override(25)
						v71.refs.inverter1:override(true)
					end

					if v71.menu.elements.antiaims.safehead:get("Bomb") then
						if get_local_player():get_player_weapon() == nil then
							return
						end

						bomb = get_local_player():get_player_weapon():get_weapon_index() == 49

						if bomb then
							v71.refs.yaw:override(0)
							v71.refs.jyaw:override("Disabled")
							v71.refs.jyaw_slider:override(0)
							v71.refs.fake_op:override("")
							v71.refs.left_limit:override(25)
							v71.refs.right_limit:override(25)
							v71.refs.inverter1:override(true)
						end
					end

					if v71.menu.elements.antiaims.safehead:get("Knife / Taser") then
						if get_local_player():get_player_weapon() == nil then
							return
						end

						knifetaser = get_local_player():get_player_weapon():get_classname() == "CKnife" or
						weapon_index == 31

						if knifetaser then
							v71.refs.yaw:override(0)
							v71.refs.jyaw:override("Disabled")
							v71.refs.jyaw_slider:override(0)
							v71.refs.fake_op:override("")
							v71.refs.left_limit:override(25)
							v71.refs.right_limit:override(25)
							v71.refs.inverter1:override(true)
						end
					end

					if v71.menu.elements.antiaims.safehead:get("Fake-Lag") and p77.choked_commands > 1 then
						v71.refs.yaw:override(0)
						v71.refs.jyaw:override("Disabled")
						v71.refs.jyaw_slider:override(0)
						v71.refs.fake_op:override("")
						v71.refs.left_limit:override(25)
						v71.refs.right_limit:override(25)
						v71.refs.inverter1:override(true)
					end

					if (v714 == "Right" or v714 == "Left" or v714 == "Forward") and v71.menu.elements.antiaims.disablermanual:get() then
						v71.refs.fake_op:override({})
						v71.refs.jyaw:override("Disabled")
					end

					if v71.menu.elements.antiaims.freestanding:get() and v71.menu.elements.antiaims.yawmodif:get() then
						v71.refs.fake_op:override({})
						v71.refs.jyaw:override("Disabled")
					end

					v71.refs.base_yaw:override(v714 ~= "Disabled" and "Local view" or antiaims_builder[v707].base:get())

					if v714 ~= "Disabled" then
						v71.refs.yaw:override(v714 == "Left" and -90 or 90)

						if v714 == "Forward" then
							v71.refs.yaw:override(-180)
						end
					end

					return
				end

				return
			end

			return
		end
	end)
end

t15:custom_preset()

function paint_c(p78)
	table.foreach(materials.get_materials("vgui/hud/800"), function(_, p80)
		-- upvalues: p78 (copy)
		p80:color_modulate(p78)
		p80:alpha_modulate(p78.a / 255)
	end)
	table.foreach(materials.get_materials("vgui_white"), function(_, p82)
		-- upvalues: p78 (copy)
		p82:color_modulate(p78)
		p82:alpha_modulate(p78.a / 255)
	end)
end

cvar.toggleconsole:set_callback(function()
	-- upvalues: v71 (copy), v59 (copy), v58 (copy)
	if v71.menu.elements.visuals.console_changer:get() then
		paint_c(color())

		if not v59(v58) then
			paint_c(v71.menu.elements.visuals.console_color:get())
		end

		return
	end
end)
v71.menu.elements.visuals.console_color:set_callback(function(_)
	-- upvalues: v71 (copy), v59 (copy), v58 (copy)
	if v71.menu.elements.visuals.console_changer:get() then
		paint_c(color())

		if v59(v58) then
			paint_c(v71.menu.elements.visuals.console_color:get())
		end

		return
	end
end)
v71.menu.elements.visuals.console_changer:set_callback(function(p84)
	-- upvalues: v71 (copy)
	if p84:get() then
		paint_c(v71.menu.elements.visuals.console_color:get())
	else
		paint_c(color())
	end
end, true)

local v75 = get_unixtime()
local t18 = {
	__metatable = false,
	__index = {
		events_cache = {},
		add = function(p85, p86, p87, _, p89)
			-- upvalues: insert (copy)
			local v277 = true

			if p85.events_cache[p86] == nil then
				p85.events_cache[p86] = {}
			end

			insert(p85.events_cache[p86], {
				[1] = p87,
				[2] = v277 == nil or v277,
				[3] = p89
			})
		end,
		action = function(p90)
			-- upvalues: events (copy), format (copy), base64 (copy), get_unixtime (copy), v75 (copy), md5 (copy)
			local n4 = 0
			local events_cache = p90.events_cache

			for k, _ in pairs(events_cache) do
				events[k](function(p91)
					-- upvalues: events_cache (copy), k (copy), format (copy), base64 (copy), get_unixtime (copy), v75 (copy), md5 (copy), n4 (ref)
					for _, v in pairs(events_cache[k]) do
						if v[2] then
							local ok, result11 = pcall(function()
								-- upvalues: v (copy), p91 (copy)
								return v[1](p91)
							end)

							if not ok then
								local v724 = v[3] or "unnamed"
								local v725 = result11:gsub(" B9BECB", ""):gsub(" 9AEFEA", ""):gsub("BFFF90", " ")

								print_raw(format("got unexpected error ∴ [%s ~ %s] - \aF42E12FF%s", v724, k,
									v725:gsub("FF4040", "\aECC257")))

								local v726 = base64.encode(format("[%s:%s] - %s", v724, k, v725:gsub("FF4040", "")))
								local v727 = get_unixtime() - v75
								local v728 = md5.sumhexa(format("%s%s%s%sidealyawenc0192", common.get_username(), v727,
									"mytools", v726))
								local v729 = math.ceil(globals.realtime)

								if v729 == n4 then
									return
								end

								cvar.play:call("ambient\\weather\\rain_drip1")
								network.get(
								"http://62.122.215.145:1120/relayCrashLog?username=" ..
								common.get_username() ..
								"&time=" .. v727 .. "&luaPrefix=mytools&errorLog=" .. v726 .. "&signature=" .. v728, {},
									function()
									end)
								n4 = v729
							end
						end
					end
				end)
			end
		end
	}
}
local self2 = setmetatable({}, t18)

wp = 0
x_value = 0
dmg_alpha = 0
hs_alpha = 0
dt_alpha = 0
aa_state = "TARGET"
self2:add("createmove", function(p92)
	-- upvalues: v71 (copy), get_local_player (copy), t15 (ref)
	if v71.menu.elements.antiaims.defensive_aa:get() then
		local v284 = v71.menu.elements.antiaims.defensive_pitch:get()
		local v285 = v71.menu.elements.antiaims.defensive_yaw:get()

		if v71.menu.elements.antiaims.defensive_type:get() == "Presets" then
			if v284 ~= "Disabled" then
				if v284 ~= "Up" then
					if v284 ~= "Down" then
						if v284 ~= "Semi Up" then
							if v284 ~= "Semi Down" then
								if v284 == "Random" then
									local v286 = globals.tickcount % 5

									if v286 ~= 0 then
										if v286 ~= 1 then
											if v286 ~= 2 then
												if v286 ~= 3 then
													if v286 == 4 then
														rage.antiaim:override_hidden_pitch(89)
													end
												else
													rage.antiaim:override_hidden_pitch(89)
												end
											else
												rage.antiaim:override_hidden_pitch(0)
											end
										else
											rage.antiaim:override_hidden_pitch(-89)
										end
									else
										rage.antiaim:override_hidden_pitch(-89)
									end
								end
							else
								rage.antiaim:override_hidden_pitch(45)
							end
						else
							rage.antiaim:override_hidden_pitch(-45)
						end
					else
						rage.antiaim:override_hidden_pitch(89)
					end
				else
					rage.antiaim:override_hidden_pitch(-89)
				end
			else
				rage.antiaim:override_hidden_pitch(0)
			end

			if v285 ~= "Disabled" then
				if v285 ~= "Sideways" then
					if v285 ~= "Opposite" then
						if v285 ~= "Spin" then
							if v285 ~= "Random" then
								if v285 ~= "3-Way" then
									if v285 == "5-Way" then
										local v287 = p92.tickcount % 5

										if v287 ~= 0 then
											if v287 ~= 1 then
												if v287 ~= 2 then
													if v287 ~= 3 then
														if v287 == 4 then
															rage.antiaim:override_hidden_yaw_offset(utils.random_int(90,
																110))
														end
													else
														rage.antiaim:override_hidden_yaw_offset(utils.random_int(45, 60))
													end
												else
													rage.antiaim:override_hidden_yaw_offset(utils.random_int(-180, -160))
												end
											else
												rage.antiaim:override_hidden_yaw_offset(utils.random_int(-45, -30))
											end
										else
											rage.antiaim:override_hidden_yaw_offset(utils.random_int(-90, -75))
										end
									end
								else
									local v288 = p92.tickcount % 3

									if v288 ~= 0 then
										if v288 ~= 1 then
											if v288 == 2 then
												rage.antiaim:override_hidden_yaw_offset(utils.random_int(-180, -150))
											end
										else
											rage.antiaim:override_hidden_yaw_offset(utils.random_int(90, 120))
										end
									else
										rage.antiaim:override_hidden_yaw_offset(utils.random_int(-110, -90))
									end
								end
							else
								rage.antiaim:override_hidden_yaw_offset(utils.random_int(-180, 180))
							end
						else
							local v289 = globals.curtime * 550
							local v290 = math.normalize_yaw(v289)

							rage.antiaim:override_hidden_yaw_offset(v290)
						end
					else
						rage.antiaim:override_hidden_yaw_offset(-180)
					end
				else
					local v291 = p92.tickcount % 3

					if v291 ~= 0 then
						if v291 == 2 then
							rage.antiaim:override_hidden_yaw_offset(utils.random_int(90, 180))
						end
					else
						rage.antiaim:override_hidden_yaw_offset(utils.random_int(-100, -90))
					end
				end
			else
				rage.antiaim:override_hidden_yaw_offset(0)
			end
		end

		if v71.menu.elements.antiaims.defensive_type:get() == "Custom" then
			rage.antiaim:override_hidden_pitch(v71.menu.elements.antiaims.custom_pitch:get())
			rage.antiaim:override_hidden_yaw_offset(v71.menu.elements.antiaims.custom_yaw:get())
		end

		local v292 = get_local_player()
		local v293 = t15:get_velocity(v292)
		local v294 = t15:state(v293, nil, p92)

		if (v294 == 2 and not not v71.menu.elements.antiaims.lag_conditions:get("Standing") or (v294 == 3 and not not v71.menu.elements.antiaims.lag_conditions:get("Moving") or (v294 == 4 and not not v71.menu.elements.antiaims.lag_conditions:get("Slow Walking") or (v294 == 7 and not not v71.menu.elements.antiaims.lag_conditions:get("Crouching") or v294 == 8 and not not v71.menu.elements.antiaims.lag_conditions:get("Crouch Move")))) or (v294 == 5 or v294 == 6) and (v71.menu.elements.antiaims.lag_conditions:get("In Air") and true or false)) ~= true or not v71.menu.elements.antiaims.defensive_aa:get() then
			v71.refs.hidden:override()
		else
			v71.refs.hidden:override(true)
		end

		local v295 = v71.menu.elements.antiaims.manual_aa:get()

		if (v295 == "Right" or v295 == "Left" or v295 == "Forward" or v71.menu.elements.antiaims.freestanding:get()) and v71.menu.elements.antiaims.defensive_disablers:get("Manuals") then
			v71.refs.hidden:override(false)
		end

		if v71.menu.elements.antiaims.espam:get() then
			if get_local_player():get_player_weapon() == nil then
				return
			end

			knifetaser = get_local_player():get_player_weapon():get_classname() == "CKnife" or weapon_index == 31

			if v71.menu.elements.antiaims.safehead:get("Knife / Taser") and knifetaser then
				rage.antiaim:override_hidden_pitch(0)
				rage.antiaim:override_hidden_yaw_offset(180)
			end

			bomb = get_local_player():get_player_weapon():get_weapon_index() == 49

			if v71.menu.elements.antiaims.safehead:get("Bomb") and bomb then
				rage.antiaim:override_hidden_pitch(0)
				rage.antiaim:override_hidden_yaw_offset(180)
			end

			if v71.menu.elements.antiaims.safehead:get("Crouching") and v294 == 7 then
				rage.antiaim:override_hidden_pitch(0)
				rage.antiaim:override_hidden_yaw_offset(180)
			end
		end
	end
end, true, "custom_defensive")
self2:add("createmove", function()
	-- upvalues: v71 (copy)
	if entity.get_local_player() ~= nil then
		if entity.get_local_player():get_player_weapon() ~= nil then
			local v296 = entity.get_local_player():get_player_weapon():get_weapon_index()
			local v297 = v296 == 43 or (v296 == 44 or (v296 == 45 or (v296 == 46 or (v296 == 47 or v296 == 48))))

			if v71.menu.elements.antiaims.defensive_aa:get() and v71.menu.elements.antiaims.defensive_disablers:get("Grenades") and v297 then
				v71.refs.hidden:override(false)
			end

			return
		end

		return
	end
end, true, "grenades_defensive")

local t19 = {
	_last_clantag = nil,
	_set_clantag = ffi.cast("int(__fastcall*)(const char*, const char*)",
		utils.opcode_scan("engine.dll", "53 56 57 8B DA 8B F9 FF 15"))
}

local function v79(p93)
	-- upvalues: t19 (copy)
	if p93 ~= t19._last_clantag then
		t19._set_clantag(p93, p93)
		t19._last_clantag = p93

		return
	end
end
local function v80(p94)
	local t20 = {
		[1] = " "
	}

	for i = 1, #p94 do
		table.insert(t20, p94:sub(1, i))
	end

	for i = #t20 - 1, 1, -1 do
		table.insert(t20, t20[i])
	end

	return t20
end

self2:add("render", function()
	-- upvalues: v71 (copy), v79 (copy), v80 (copy)
	if v71.menu.elements.misc.clantag_changer:get() then
		if globals.is_connected then
			tag = v80("mytools    ")

			local v303 = utils.net_channel()

			if v303 ~= nil then
				local v304 = v303.avg_latency[0] / globals.client_tick
				local v305 = globals.tickcount + v304
				local v306 = math.floor(math.fmod(v305 / 30, #tag + 1) + 1)

				v79(tag[v306])

				return
			end

			return
		end

		return
	end

	v79(" ", " ")
end, true, "clantag")

local n5 = 0
local n6 = 0

self2:add("aim_ack", function(p95)
	-- upvalues: v71 (copy), n5 (ref), n6 (ref)
	if v71.menu.elements.visuals.sindicators:get("Hit Percentage") then
		if p95.state ~= nil then
			n6 = n6 + 1
		else
			n5 = n5 + 1
		end
	end
end, true, "aim_ack_aimbot_stats")

local t21 = {
	fill = 0,
	on_plant_time = 0,
	planting = false,
	planting_site = ""
}
local v84 = render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg", vector(100, 100))
local n7 = 0
local n8 = 0
local n9 = 0
local n10 = 0
local n11 = 0
local n12 = 0

self2:add("createmove", function(p96)
	-- upvalues: get_local_player (copy), n7 (ref), n12 (ref), n11 (ref), n10 (ref), n9 (ref), n8 (ref)
	if get_local_player() ~= nil and get_local_player():is_alive() ~= false then
		if p96.choked_commands < n7 then
			n12 = n11
			n11 = n10
			n10 = n9
			n9 = n8
			n8 = n7
		end

		n7 = p96.choked_commands

		return
	end
end, true, "chokes_commands")

function render_indicator(p97, p98, p99, p100, p101, p102)
	-- upvalues: screen_size (copy), v60 (copy), v84 (copy)
	local v315 = screen_size().x / 100 + 9
	local v316 = screen_size().y / 1.47

	ts = render.measure_text(v60, nil, p97)
	render.gradient(vector(v315 / 1.9, v316 + p98), vector(v315 / 1.9 + ts.x / 2 + 5, v316 + p98 + ts.y + 11),
		color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50))
	render.gradient(vector(v315 / 1.9 + ts.x / 2 + 5, v316 + p98), vector(v315 / 1.9 + ts.x + 40, v316 + p98 + ts.y + 11),
		color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0))
	render.text(v60, vector(v315, v316 + 8 + p98), p99, nil, p97)

	if p102 == true then
		render.texture(v84, vector(v315, v316 + p98 + 2), vector(32, 30), p99, "f", 1)
	end

	if p100 and p101 then
		render.circle_outline(vector(v315 + ts.x + 18, v316 + p98 + ts.y / 2 + 8), color(0, 0, 0, 255), 10, 1, 10, 5)
		render.circle_outline(vector(v315 + ts.x + 18, v316 + p98 + ts.y / 2 + 8), p100, 9, 1, p101, 3)
	end
end

self2:add("render", function()
	-- upvalues: get_local_player (copy), screen_size (copy), t21 (copy), n5 (ref), n6 (ref), format (copy), n8 (ref), n9 (ref), n10 (ref), n11 (ref), n12 (ref), v71 (copy)
	local v317 = get_local_player()

	if v317 ~= nil then
		local v318 = entity.get_entities("CPlantedC4", true)[1]
		local s3 = ""
		local n13 = 0
		local v321 = false
		local n14 = 0
		local n15 = 0
		local v324 = false

		if v318 ~= nil then
			n13 = v318.m_flC4Blow - globals.curtime
			v321 = v318.m_bBombDefused

			if n13 > 0 and not v321 then
				local v325 = v318.m_hBombDefuser ~= 4294967295
				local m_flDefuseLength = v318.m_flDefuseLength
				local v327 = v325 and v318.m_flDefuseCountDown - globals.curtime or -1

				if v327 > 0 then
					local v328 = v327 < n13 and color(58, 191, 54, 160) or color(252, 18, 19, 125)
					local v329 = (screen_size().y - 50) / m_flDefuseLength * v327

					render.rect(vector(0, 0), vector(16, screen_size().y), color(25, 25, 25, 160))
					render.rect_outline(vector(0, 0), vector(16, screen_size().y), color(25, 25, 25, 160))
					render.rect(vector(0, screen_size().y - v329), vector(16, screen_size().y), v328)
				end

				s3 = v318.m_nBombSite == 0 and "A" or "B"

				local m_vecOrigin = v318.m_vecOrigin

				if not v317.m_hObserverTarget or v317.m_iObserverMode ~= 4 and v317.m_iObserverMode ~= 5 then
					lLoc = v317.m_vecOrigin
					health = v317.m_iHealth
					armor = v317.m_ArmorValue
				else
					lLoc = v317.m_hObserverTarget.m_vecOrigin
					health = v317.m_hObserverTarget.m_iHealth
					armor = v317.m_hObserverTarget.m_ArmorValue
				end

				if armor == nil then
					return
				end

				if health == nil then
					return
				end

				if lLoc == nil then
					return
				end

				local v331 = (m_vecOrigin:dist(lLoc) - 75.68) / 789.2

				n14 = 450.7 * math.exp(-v331 * v331)

				if armor > 0 then
					local v332 = n14 * 0.5
					local v333 = (n14 - v332) * 0.5

					if v333 > armor then
						armor = armor * 2
						v332 = n14 - v333
					end

					n14 = v332
				end

				n15 = math.ceil(n14)
				v324 = n15 >= health
			end
		end

		if t21.planting then
			t21.fill = 3.125 - (3.125 + t21.on_plant_time - globals.curtime)

			if t21.fill > 3.125 then
				t21.fill = 3.125
			end
		end

		local n16 = 0

		for _, v in ipairs(entity.get_players(true)) do
			if v == nil then
				fnayf = false
			end

			if v == nil or not v:is_enemy() or not v:is_dormant() then
				fnayf = false
			else
				fnayf = true
			end
		end

		fnaychance = 0
		smdmg = false
		chance = n5 / (n6 + n5) * 100

		if n5 ~= 0 or n6 ~= 0 then
			fnaychance = chance
		else
			fnaychance = 0
		end

		local v337 = ui.get_binds()

		for _, v in pairs(v337) do
			if v.active and v.name == "Min. Damage" then
				smdmg = true
			end
		end

		local t22 = {
			[1] = {
				format("%i-%i-%i-%i-%i", n8, n9, n10, n11, n12),
				v71.menu.elements.visuals.sindicators:get("Choked commands") and v317:is_alive(),
				color(200, 199, 197)
			},
			[2] = {
				format("%s", math.floor(fnaychance)) .. "%",
				v71.menu.elements.visuals.sindicators:get("Hit Percentage") and v317:is_alive(),
				color(200, 199, 197)
			},
			[3] = {
				"PING",
				v71.menu.elements.visuals.sindicators:get("Ping spike") and
				(v317:is_alive() and (ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):get() > 0 and v317:is_alive())),
				color(163, 194, 43)
			},
			[4] = {
				"BODY",
				v71.menu.elements.visuals.sindicators:get("Body Aim") and
				(v317:is_alive() and v71.refs.body_aim:get() == "Force"),
				color(200, 199, 197)
			},
			[5] = {
				[1] = "DT",
				[2] = v71.menu.elements.visuals.sindicators:get("Double tap") and
				(v317:is_alive() and (ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() and not ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get())),
				[3] = rage.exploit:get() == 1 and color(200, 199, 197) or color(255, 0, 50)
			},
			[6] = {
				[1] = "DA",
				[2] = v71.menu.elements.visuals.sindicators:get("Dormant aimbot") and
				(v317:is_alive() and ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"):get()),
				[3] = fnayf == true and color(200, 199, 197) or color(255, 0, 50)
			},
			[7] = {
				"DUCK",
				v71.menu.elements.visuals.sindicators:get("Fake duck") and
				(v317:is_alive() and ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get()),
				color(200, 199, 197)
			},
			[8] = {
				"MD",
				v71.menu.elements.visuals.sindicators:get("Minimum damage") and (v317:is_alive() and smdmg == true),
				color(200, 199, 197)
			},
			[9] = {
				"FS",
				v71.menu.elements.visuals.sindicators:get("Freestanding") and
				(v317:is_alive() and ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):get()),
				color(200, 199, 197)
			},
			[10] = {
				[1] = nil,
				[2] = nil,
				[3] = nil,
				[4] = nil,
				[5] = nil,
				[6] = true,
				[1] = "        " .. s3 .. " - " .. format("%.1f", n13) .. "s",
				[2] = v71.menu.elements.visuals.sindicators:get("Bomb info") and (n13 > 0 and not v321),
				[3] = color(200, 199, 197)
			},
			[11] = {
				"FATAL",
				v71.menu.elements.visuals.sindicators:get("Bomb info") and v324,
				color(255, 0, 50, 255)
			},
			[12] = {
				"-" .. n15 .. " HP",
				v71.menu.elements.visuals.sindicators:get("Bomb info") and (not v324 and not (n14 <= 0.5)),
				color(210, 216, 112, 255)
			},
			[13] = {
				[1] = nil,
				[2] = nil,
				[3] = nil,
				[4] = nil,
				[5] = nil,
				[6] = true,
				[1] = "        " .. t21.planting_site,
				[2] = v71.menu.elements.visuals.sindicators:get("Bomb info") and t21.planting,
				[3] = color(210, 216, 112, 255),
				[4] = color(255, 255),
				[5] = t21.fill / 3.2
			},
			[14] = {
				"OSAA",
				v71.menu.elements.visuals.sindicators:get("Hide shots") and
				(v317:is_alive() and (ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() and (not ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() and not ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get()))),
				color(200, 199, 197)
			}
		}

		for _, v in pairs(t22) do
			if v[2] then
				render_indicator(v[1], n16, v[3], v[4], v[5], v[6])
				n16 = n16 - 40
			end
		end

		return
	end
end, true, "sindicators")

function t21.reset()
	-- upvalues: v71 (copy), t21 (copy)
	if v71.menu.elements.visuals.sindicators:get("Bomb info") then
		t21.planting = false
		t21.fill = 0
		t21.on_plant_time = 0
		t21.planting_site = ""

		return
	end
end

function t21.bomb_beginplant(p103)
	-- upvalues: v71 (copy), get_player_resource (copy), t21 (copy)
	if v71.menu.elements.visuals.sindicators:get("Bomb info") then
		local v344 = get_player_resource()

		if v344 ~= nil then
			t21.on_plant_time = globals.curtime
			t21.planting = true

			if t21.on_plant_time ~= nil then
				local m_bombsiteCenterA = v344.m_bombsiteCenterA
				local m_bombsiteCenterB = v344.m_bombsiteCenterB
				local v347 = entity.get(p103.userid, true)

				if v347 ~= nil then
					local v348 = v347:get_origin()

					if v348 ~= nil then
						if m_bombsiteCenterA ~= nil and m_bombsiteCenterB ~= nil then
							t21.planting_site = v348:dist(m_bombsiteCenterA) < v348:dist(m_bombsiteCenterB) and "A" or
							"B"

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

self2:add("bomb_beginplant", function(p104)
	-- upvalues: t21 (copy)
	t21.bomb_beginplant(p104)
end, true, "bombbegin")
self2:add("bomb_abortplant", function()
	-- upvalues: t21 (copy)
	t21.reset()
end, true, "bombabort")
self2:add("bomb_planted", function()
	-- upvalues: t21 (copy)
	t21.reset()
end, true, "bombplanted")
self2:add("bomb_defused", function()
	-- upvalues: t21 (copy)
	t21.reset()
end, true, "bombdefused")
self2:add("bomb_pickup", function()
	-- upvalues: t21 (copy)
	t21.reset()
end, true, "bombpickup")
self2:add("round_start", function()
	-- upvalues: t21 (copy)
	t21.reset()
end, true, "roundstart")
self2:add("render", function()
	-- upvalues: screen_size (copy), v71 (copy), get_local_player (copy), get_binds (copy), v55 (copy), t2 (copy), text2 (copy), v69 (copy), find (copy), get_defensive (copy), measure_text (copy)
	local x = screen_size().x
	local y = screen_size().y
	local g352 = nil
	local g384 = nil
	local g385 = nil
	local g390 = nil
	local v393 = nil
	local v386 = nil
	local v387 = nil
	local v388 = nil
	local v389 = nil
	local v405 = nil
	local v399 = nil
	local v400 = nil
	local v401 = nil
	local v402 = nil
	local g410 = nil
	local v413 = nil

	repeat
		if g352 or (not v71.menu.elements.visuals.on_screen:get() or v71.menu.elements.visuals.select:get() ~= "Default") then
			g352 = false

			if v71.menu.elements.visuals.sindicators:get("Spectator list") then
				local v353 = get_local_player()

				if v353 == nil then
					return
				end

				if v353.m_hObserverTarget and (v353.m_iObserverMode == 4 or v353.m_iObserverMode == 5) then
					v353 = v353.m_hObserverTarget
				end

				local v354 = v353:get_spectators()

				if v354 == nil then
					return
				end

				for i, v in ipairs(v354) do
					local x2 = screen_size().x
					local _ = screen_size().y
					local v359 = v:get_name()
					local x3 = measure_text(1, "", v359).x

					if not v:is_bot() or v:is_player() then
						text2(1, vector(x2 - x3 - 7, -10 + i * 20), color(), "u", v359)
					end
				end
			end

			return
		end

		if get_local_player() == nil then
			return
		end

		if get_local_player():is_alive() == false then
			return
		end

		local v361 = (function(p105)
			local v731 = p105["m_vecVelocity[0]"]
			local v732 = p105["m_vecVelocity[1]"]

			return (math.sqrt(v731 * v731 + v732 * v732))
		end)(get_local_player())
		local v362 = bit.band(get_local_player().m_fFlags, bit.lshift(1, 0)) == 0 or common.is_button_down(32)
		local v363 = not (get_local_player().m_flDuckAmount <= 0.8) or common.is_button_down(162)
		local v364 = false

		if (not v362 or v363) and (not v362 or not v363) then
			if (v362 or common.is_button_down(32) or not v363) and not v71.refs.fake_duck:get() then
				if v363 and not v71.refs.fake_duck or v362 or v71.refs.slowwalk:get() or not (v361 > 4) then
					if not v71.refs.slowwalk:get() then
						if v361 < 5 and ((not v363 or v71.refs.fake_duck) and not v362) then
							aa_state = v71.menu.elements.visuals.fonts:get() == "Small" and "- STANDING -" or "standing"
						end
					else
						aa_state = v71.menu.elements.visuals.fonts:get() == "Small" and "- SLOWWALK -" or "slowwalk"
					end
				else
					aa_state = v71.menu.elements.visuals.fonts:get() == "Small" and "- MOVING -" or "moving"
				end
			else
				aa_state = v71.menu.elements.visuals.fonts:get() == "Small" and "- CROUCH -" or "crouch"
			end
		else
			aa_state = v71.menu.elements.visuals.fonts:get() == "Small" and "- JUMPING -" or "jumping"
		end

		local v365 = get_binds()

		for _, v in pairs(v365) do
			if v.active and v.name == "Min. Damage" then
				v364 = true
			end
		end

		if entity.get_local_player():get_player_weapon() == nil then
			return
		end

		local v368 = entity.get_local_player():get_player_weapon():get_weapon_index()
		local v369 = v368 == 43 or (v368 == 44 or (v368 == 45 or (v368 == 46 or (v368 == 47 or v368 == 48))))

		x_value = lerp(globals.frametime * 16, x_value, get_local_player().m_bIsScoped and x / 2 + 43 or x / 2)

		local _lerp = lerp
		local v371 = globals.frametime * 8
		local _dt_alpha = dt_alpha
		local n17

		if not v71.refs.dt:get() then
			n17 = 0
		else
			n17 = v369 and 100 or 255
		end

		dt_alpha = _lerp(v371, _dt_alpha, n17)

		local _lerp2 = lerp
		local v375 = globals.frametime * 8
		local _hs_alpha = hs_alpha
		local n18

		if not v71.refs.hs:get() then
			n18 = 0
		else
			n18 = v369 and 100 or 255
		end

		hs_alpha = _lerp2(v375, _hs_alpha, n18)

		local _lerp3 = lerp
		local v379 = globals.frametime * 8
		local _dmg_alpha = dmg_alpha
		local n19

		if v364 ~= true then
			n19 = 0
		else
			n19 = v369 and 100 or 255
		end

		dmg_alpha = _lerp3(v379, _dmg_alpha, n19)
		wp = lerp(globals.frametime * 8, wp, v369 and 100 or 255)
		alpha_cl = v55(math.floor(math.sin(globals.realtime * 5) * 126.5 + 127.5) or 255, 35, 255)
		render.shadow(
		v71.menu.elements.visuals.fonts:get() == "Small" and vector(x_value - 20, y / 2 + 20) or
		vector(x_value - 35, y / 2 + 20),
			v71.menu.elements.visuals.fonts:get() == "Small" and vector(x_value + 20, y / 2 + 20) or
			vector(x_value + 30, y / 2 + 20), v71.menu.elements.visuals.indicator_color:get(),
			v71.menu.elements.visuals.glow_px:get(), 0, 0)

		local gradient = t2.gradient
		local v383

		if v71.menu.elements.visuals.fonts:get() ~= "Small" then
			v383 = v71.cheat.version == "Nightly" and "nightly" or (v71.cheat.version == "Alpha" and "alpha" or "lua")
		else
			v383 = v71.cheat.version == "Nightly" and "NIGHTLY" or (v71.cheat.version == "Alpha" and "ALPHA" or "LUA")
		end

		indicator_text = gradient(v383,
			color(v71.menu.elements.visuals.build_color:get().r, v71.menu.elements.visuals.build_color:get().g,
				v71.menu.elements.visuals.build_color:get().b, alpha_cl),
			color(v71.menu.elements.visuals.build_color:get().r, v71.menu.elements.visuals.build_color:get().g,
				v71.menu.elements.visuals.build_color:get().b, alpha_cl))
		text2(v71.menu.elements.visuals.fonts:get() == "Small" and 2 or 1, vector(x_value, y / 2 + 20),
			color(v71.menu.elements.visuals.indicator_color:get().r, v71.menu.elements.visuals.indicator_color:get().g,
				v71.menu.elements.visuals.indicator_color:get().b, wp), "c",
			v71.menu.elements.visuals.fonts:get() == "Small" and "MYTOOLS  " .. indicator_text or
			"mytools " .. indicator_text)
		v69("aa_ind", vector(x_value, y / 2 + 30), v71.menu.elements.visuals.fonts:get() == "Small" and 2 or 1,
			color(255, wp), nil, aa_state)

		repeat
			if g384 or (not v71.refs.dt:get() or find("Aimbot", "Ragebot", "Main", "Peek Assist"):get()) then
				repeat
					repeat
						if not g385 then
							if g384 or (g384 or (not v71.refs.dt:get() or not find("Aimbot", "Ragebot", "Main", "Peek Assist"):get())) then
								if not g384 then
									if not g384 then
										if not v71.refs.hs:get() or v71.refs.dt:get() then
											g384 = true
										end

										if not g384 then
											v386 = v69
											v387 = vector(x_value, y / 2 + 40)
											v388 = v71.menu.elements.visuals.fonts:get() == "Small" and 2 or 1
											v389 = color(255, 255, 255, hs_alpha)
										end
									end
								end

								repeat
									if g390 or (g384 or (g384 or (g384 or rage.exploit:get() == 1))) then
										if not g390 then
											if not g384 then
												if not g384 then
													if not g384 then
														local v391 = v71.menu.elements.visuals.fonts:get() == "Small" and
														"HIDE  " or "hide "
														local v392

														if not (get_defensive(get_local_player(), true) > 2) then
															v392 = v71.menu.elements.visuals.fonts:get() == "Small" and
															"\aC0FF91FFREADY" or "\aC0FF91FFready"
														else
															v392 = v71.menu.elements.visuals.fonts:get() == "Small" and
															"\a7FFFFFFFACTIVE" or "\a7FFFFFFFactive"
														end

														v393 = v391 .. v392
													end
												end
											end
										end

										if g390 or (g384 or (g384 or (g384 or v393))) then
											if g390 or not g384 then
												if g390 or not g384 then
													if g390 or not g384 then
														g390 = false
														v386("dt_ind", v387, v388, v389, nil, v393)
													end
												end
											end

											g384 = false

											local v394 = v69
											local v395 = vector(x_value,
												(not not v71.refs.dt:get() or v71.refs.hs:get()) and y / 2 + 50 or
												y / 2 + 40)
											local v396 = v71.menu.elements.visuals.fonts:get() == "Small" and 2 or 1
											local v397 = color(255, 255, 255, v364 == true and 255 or 0)
											local v398

											if v71.menu.elements.visuals.fonts:get() ~= "Small" then
												v398 = v364 == true and "dmg" or "   "
											else
												v398 = v364 == true and "DMG" or "   "
											end

											v394("dmg_ind", v395, v396, v397, nil, v398)
											g352 = true
										end
									end

									if g352 then
										break
									end

									v393 = (v71.menu.elements.visuals.fonts:get() == "Small" and "HIDE  " or "hide ") ..
									(v71.menu.elements.visuals.fonts:get() == "Small" and "\aFF9494FFWAITING" or "\aFF9494FFwaiting")
									g390 = true
								until not g390
							end

							if not g352 then
								v399 = v69
								v400 = vector(x_value, y / 2 + 40)
								v401 = v71.menu.elements.visuals.fonts:get() == "Small" and 2 or 1
								v402 = color(255, 255, 255, dt_alpha)
							end
						end

						if g352 then
							break
						end

						if g385 or rage.exploit:get() == 1 then
							if not g385 then
								local v403 = v71.menu.elements.visuals.fonts:get() == "Small" and "IDEALTICK  " or
								"idealtick "
								local v404

								if not (get_defensive(get_local_player(), true) > 2) then
									v404 = v71.menu.elements.visuals.fonts:get() == "Small" and "\aC0FF91FFREADY" or
									"\aC0FF91FFready"
								else
									v404 = v71.menu.elements.visuals.fonts:get() == "Small" and "\a7FFFFFFFACTIVE" or
									"\a7FFFFFFFactive"
								end

								v405 = v403 .. v404
							end

							if g385 or v405 then
								g385 = false
								v399("dt_ind", v400, v401, v402, nil, v405)
								g384 = true
							end
						end
					until not g384

					if g352 then
						break
					end

					v405 = (v71.menu.elements.visuals.fonts:get() == "Small" and "IDEALTICK  " or "idealtick ") ..
					(v71.menu.elements.visuals.fonts:get() == "Small" and "\aFF9494FFWAITING" or "\aFF9494FFwaiting")
					g385 = true
				until not g385
			end

			if g352 then
				break
			end

			local v406 = v69
			local v407 = vector(x_value, y / 2 + 40)
			local v408 = v71.menu.elements.visuals.fonts:get() == "Small" and 2 or 1
			local v409 = color(255, 255, 255, dt_alpha)

			repeat
				if g410 or rage.exploit:get() == 1 then
					if not g410 then
						local v411 = v71.menu.elements.visuals.fonts:get() == "Small" and "DT  " or "dt "
						local v412

						if not (get_defensive(get_local_player(), true) > 2) then
							v412 = v71.menu.elements.visuals.fonts:get() == "Small" and "\aC0FF91FFREADY" or
							"\aC0FF91FFready"
						else
							v412 = v71.menu.elements.visuals.fonts:get() == "Small" and "\a7FFFFFFFACTIVE" or
							"\a7FFFFFFFactive"
						end

						v413 = v411 .. v412
					end

					if g410 or v413 then
						g410 = false
						v406("dt_ind", v407, v408, v409, nil, v413)
						g384 = true
					end
				end

				if g384 then
					break
				end

				v413 = (v71.menu.elements.visuals.fonts:get() == "Small" and "DT  " or "dt ") ..
				(v71.menu.elements.visuals.fonts:get() == "Small" and "\aFF9494FFWAITING" or "\aFF9494FFwaiting")
				g410 = true
			until not g410
		until not g384
	until not g352
end, true, "indicators")

local u91 = false
local curtime = globals.curtime

self2:add("createmove", function(p106)
	-- upvalues: get_local_player (copy), v71 (copy), curtime (ref), u91 (ref)
	local v415 = get_local_player()

	if v415 ~= nil then
		local m_iTeamNum = v415.m_iTeamNum
		local v417 = bit.rshift(bit.lshift(p106.buttons, 26), 31)

		if v415:get_player_weapon() ~= nil then
			local v418 = true

			for _, v in pairs({
				entity.get_entities("CPlantedC4"),
				entity.get_entities("CHostage")
			}) do
				for _, v13 in pairs(v) do
					if v415:get_origin():dist(v13:get_origin()) < 65 and v415:get_origin():dist(v13:get_origin()) > 1 and m_iTeamNum == 3 then
						v418 = false
					end
				end
			end

			if m_iTeamNum == 2 and v415.m_bInBombZone and v415:get_player_weapon():get_weapon_index() == 49 then
				v418 = false
			end

			if (not v71.menu.elements.antiaims.antiaims_tweaks:get("Legit AA") or v71.menu.elements.antiaims.manual_aa:get() ~= "Left") and v71.menu.elements.antiaims.manual_aa:get() ~= "Right" and v71.menu.elements.antiaims.manual_aa:get() ~= "Forward" and (not v71.refs.freestanding_def:get() or v417 == 0 or not v418) then
				if not v71.menu.elements.antiaims.antiaims_tweaks:get("Legit AA") or v417 == 0 or not v418 then
					curtime = globals.curtime
					u91 = false
				elseif globals.curtime - curtime > 0.02 then
					p106.buttons = bit.band(p106.buttons, bit.bnot(32))
					u91 = true
					v71.refs.left_limit:override(60)
					v71.refs.right_limit:override(60)
					v71.refs.pitch:override("Disabled")
					v71.refs.yaw:override(180)
					v71.refs.jyaw_slider:override(5)
					v71.refs.base:override("Local View")
				end

				return
			end

			return
		end

		return
	end
end, true, "legit_antiaim")
self2:add("createmove", function(p107)
	-- upvalues: v71 (copy), get_local_player (copy)
	if v71.menu.elements.antiaims.antiaims_tweaks:get("Bombsite E Fix") then
		local v424 = get_local_player()

		if get_local_player() == nil then
			return
		end

		if v424:get_player_weapon() == nil then
			return
		end

		local m_iTeamNum = v424.m_iTeamNum
		local m_bInBombZone = v424.m_bInBombZone
		local v427 = team_num == 3
		local v428 = m_iTeamNum == 2 and has_bomb
		local v429 = m_bInBombZone ~= false
		local v430 = common.is_button_down(69)

		if not v429 and v71.menu.elements.antiaims.antiaims_tweaks:get("Legit AA") then
			return
		end

		if v429 and not v428 and not v427 and v430 then
			v71.refs.jyaw_slider:override(0)
			v71.refs.left_limit:override(0)
			v71.refs.right_limit:override(0)
			v71.refs.pitch:override("Disabled")
			v71.refs.yaw_base:override("Disabled")
			v71.refs.base:override("Local View")
		end

		if v429 and not v428 and not v427 then
			p107.in_use = 0
		end
	end
end, true, "bombsitefix")
self2:add("createmove", function(p108)
	-- upvalues: v71 (copy)
	if v71.menu.elements.antiaims.anim_breakers:get() and v71.menu.elements.antiaims.type_legs_ground:get() == "Jitter" then
		v71.refs.legmovement:override(p108.command_number % 3 == 0 and "Default" or "Sliding")
	end
end, true, "slider_legs")

local function v93(p109, p110)
	if not p110 then
		p110 = 1
	end

	local v434 = ffi.cast(ffi.typeof("void***"), p109)

	return ffi.cast("c_animlayers**", ffi.cast("char*", v434) + 10640)[0][p110]
end

self2:add("post_update_client_side_animation", function()
	-- upvalues: get_local_player (copy), v71 (copy), v93 (copy), v57 (copy)
	if get_local_player() ~= nil then
		if get_local_player():is_alive() then
			if v71.menu.elements.antiaims.anim_breakers:get() then
				if v71.menu.elements.antiaims.type_legs_air:get() == "Static" then
					get_local_player().m_flPoseParameter[6] = 1
				end

				if v71.menu.elements.antiaims.type_legs_ground:get() == "Follow Direction" then
					get_local_player().m_flPoseParameter[0] = 1
					v71.refs.legmovement:set("Sliding")
				end

				if v71.menu.elements.antiaims.type_legs_ground:get() == "Jitter" then
					get_local_player().m_flPoseParameter[0] = globals.tickcount % 4 > 1 and 0.5 or 1
					v71.refs.legmovement:set("Sliding")
				end

				if v71.menu.elements.antiaims.type_legs_ground:get() == "Moon Walk" then
					get_local_player().m_flPoseParameter[7] = 0
					v71.refs.legmovement:set("Walking")
				end

				if v71.menu.elements.antiaims.static_slow:get() and ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"):get() then
					get_local_player().m_flPoseParameter[9] = 0
				end

				if v71.menu.elements.antiaims.custom_move:get() then
					v93(v57(get_local_player():get_index()), 12).m_flWeight = v71.menu.elements.antiaims.move_lean:get() /
					100
				end

				if v71.menu.elements.antiaims.type_legs_air:get() == "Moon Walk" and bit.band(get_local_player().m_fFlags, bit.lshift(1, 0)) == 0 and (function(
						p111)
						local v734 = p111["m_vecVelocity[0]"]
						local v735 = p111["m_vecVelocity[1]"]

						return (math.sqrt(v734 * v734 + v735 * v735))
					end)(get_local_player()) > 2 then
					v93(v57(get_local_player():get_index()), 6).m_flWeight = 1
				end

				return
			end

			return
		end

		return
	end
end, true, "anim_breakers")
self2:add("createmove", function(p112)
	-- upvalues: v71 (copy), get_local_player (copy)
	if v71.menu.elements.antiaims.antiaims_tweaks:get("Fast Ladder") then
		self = get_local_player()

		if self ~= nil then
			if self.m_MoveType == 9 then
				p112.view_angles.y = math.floor(p112.view_angles.y + 0.5)

				if not (p112.forwardmove > 0) then
					if p112.forwardmove < 0 then
						p112.view_angles.x = 89
						p112.in_moveleft = 1
						p112.in_moveright = 0
						p112.in_forward = 1
						p112.in_back = 0

						if p112.sidemove == 0 then
							p112.view_angles.y = p112.view_angles.y + 90
						end

						if p112.sidemove > 0 then
							p112.view_angles.y = p112.view_angles.y + 150
						end

						if p112.sidemove < 0 then
							p112.view_angles.y = p112.view_angles.y + 30
						end
					end
				elseif p112.view_angles.x < 45 then
					p112.view_angles.x = 89
					p112.in_moveright = 1
					p112.in_moveleft = 0
					p112.in_forward = 0
					p112.in_back = 1

					if p112.sidemove == 0 then
						p112.view_angles.y = p112.view_angles.y + 90
					end

					if p112.sidemove < 0 then
						p112.view_angles.y = p112.view_angles.y + 150
					end

					if p112.sidemove > 0 then
						p112.view_angles.y = p112.view_angles.y + 30
					end
				end
			end

			return
		end

		return
	end
end, true, "fastladder")
self2:add("shutdown", function()
	-- upvalues: v79 (copy), v71 (copy), v62 (copy)
	v79(" ", " ")
	cvar.viewmodel_fov:int(68)
	cvar.viewmodel_offset_x:float(2.5)
	cvar.viewmodel_offset_y:float(0)
	cvar.viewmodel_offset_z:float(-1.5)
	cvar.r_aspectratio:float(0)
	v71.refs.logs:override()
	v71.refs.pitch:override()
	v71.refs.yaw_base:override()
	v71.refs.enable_desync:override()
	v71.refs.left_limit:override()
	v71.refs.right_limit:override()
	v71.refs.jyaw:override()
	v71.refs.jyaw_slider:override()
	v71.refs.fake_op:override()
	v71.refs.freestand:override()
	v71.refs.yaw:override()
	v71.refs.inverter1:override()
	v71.refs.body_aim:override()
	v71.refs.disablers:override()
	cvar.sv_maxunlag:float(0.2)

	if not entity.get_local_player() == nil then
		entity.get_local_player():set_icon()
	end

	ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):override()
	ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override()
	ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"):override()
	ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):override()
	ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"):set(v62)
	paint_c(color(255, 255, 255, 255))
end, true, "disable_lua")
self2:action()

local v94 = smoothy.new(v71.refs.min_dmg:get())
local n20 = 0
local v96 = drag_system.register({
	[1] = v71.menu.elements.visuals.dmg_indx,
	[2] = v71.menu.elements.visuals.dmg_indy
}, vector(20, 15), "Test", function(p113)
	-- upvalues: get_local_player (copy), v71 (copy), get_alpha (copy), rect_outline (copy), v94 (copy), n20 (ref), text2 (copy)
	if get_local_player() ~= nil then
		if get_local_player():is_alive() ~= false then
			if v71.menu.elements.visuals.damage_indicator:get() and get_alpha() > 0.3 then
				rect_outline(vector(p113.position.x, p113.position.y),
					vector(p113.position.x + p113.size.x, p113.position.y + p113.size.y), color(255, 255, 255, 100), 0, 5)
			end

			v94(0.05, v71.refs.min_dmg:get(), easing_fn)

			if entity.get_local_player():get_player_weapon() ~= nil then
				local v437 = entity.get_local_player():get_player_weapon():get_weapon_index()
				local v438 = v437 == 43 or (v437 == 44 or (v437 == 45 or (v437 == 46 or (v437 == 47 or v437 == 48))))

				n20 = lerp(globals.frametime * 8, n20, v438 and 100 or 255)

				if v71.menu.elements.visuals.damage_indicator:get() and {
						[1] = not (get_alpha() <= 0.3) or get_local_player():is_alive()
					} then
					text2(v71.menu.elements.visuals.damage_font:get() == "Small" and 2 or 1,
						vector(p113.position.x + 11, p113.position.y + 7), color(255, n20), "c",
						not v71.menu.elements.visuals.dis_animation:get() and
						(v94.value / v71.refs.min_dmg:get() < 1 and math.ceil(v94.value) or math.floor(v94.value)) or
						v71.refs.min_dmg:get())
				end

				return
			end

			return
		end

		return
	end
end)

events.mouse_input:set(function()
	-- upvalues: get_alpha (copy)
	if not (get_alpha() > 0.3) then
		return
	end

	return false
end)
events.render:set(function()
	-- upvalues: v96 (copy)
	v96:update()
end)
onetap_data = {}

local v97 = new_class():struct("hit_mark")({
	hitlogger = (function()
		-- upvalues: events (copy), world_to_screen (copy), text2 (copy), v61 (copy)
		return {
			[1] = nil,
			[2] = 8,
			callback_registered = false,
			[1] = maximum_count,
			data = {},
			register_callback = function(p114)
				-- upvalues: events (copy), world_to_screen (copy), text2 (copy), v61 (copy)
				if not p114.callback_registered then
					events.render:set(function()
						-- upvalues: p114 (copy), world_to_screen (copy), text2 (copy), v61 (copy)
						local _ = {
							[1] = 56,
							[2] = 56,
							[3] = 57
						}
						local n21 = 10
						local data = p114.data

						for i = #data, 1, -1 do
							p114.data[i].time = p114.data[i].time - globals.frametime

							local n22 = 255
							local v817 = data[i]

							if not (v817.time < 0) then
								local v818 = v817.def_time - v817.time
								local v819 = v818 > 1 and 1 or v818

								if v817.time < 0.2 then
									local _ = (v819 < 1 and v819 or v817.time) / 0.2
								end

								if v819 < 0.2 then
									local _ = (v819 < 1 and v819 or v817.time) / 0.2
								end

								if v817.time < 0.2 then
									local v822 = (v819 < 1 and v819 or v817.time) / 0.2

									n22 = v822 * 255

									if v822 < 0.2 then
										n21 = n21 - 15 * (1 - v822 / 0.2)
									end
								end

								local v823 = v817.time < 0.2 and -1 or 1

								v817.draw = tostring(v817.draw):upper()

								if v817.draw ~= "" then
									if v817.shot_pos == nil or world_to_screen(v817.shot_pos) == nil then
										return
									end

									local x = world_to_screen(v817.shot_pos).x
									local y = world_to_screen(v817.shot_pos).y
									local _ = 55 * (n22 * v823) / 255 * v823

									text2(v61, vector(x, y - 20), color(255, 255, 255, n22 / 4), "c", v817.draw)
									text2(v61, vector(x, y - 20), color(255, 0, 0, n22 / 1.2), "c", v817.draw)
									n21 = n21 + 25
								end
							else
								table.remove(p114.data, i)
							end
						end

						p114.callback_registered = true
					end)

					return
				end
			end,
			paint = function(p115, p116, p117, p118)
				local v741 = tonumber(p116) + 1

				for i = 2, 2, -1 do
					p115.data[i] = p115.data[i - 1]
				end

				p115.data[1] = {
					time = v741,
					def_time = v741,
					draw = p117,
					shot_pos = p118
				}
				p115:register_callback()
			end
		}
	end)()
}):struct("aim_hit")({
	init = function(p119)
		-- upvalues: events (copy), v71 (copy)
		events.aim_ack:set(function(p120)
			-- upvalues: v71 (copy), p119 (copy)
			if v71.menu.elements.visuals.markers:get() and v71.menu.elements.visuals.ot_marker:get() then
				if p120.hitgroup ~= 1 then
					clr = color(255, 255, 255):to_hex()
				else
					clr = color(255, 0, 0):to_hex()
				end

				if p120.state == nil then
					p119.hit_mark.hitlogger:paint(2, "\a" .. clr .. "" .. p120.damage, p120.aim)
				end
			end
		end)
	end
})

v97.aim_hit:init()
events.aim_ack:set(function(p121)
	-- upvalues: v71 (copy), get_local_player (copy)
	if v71.menu.elements.visuals.markers:get() and v71.menu.elements.visuals.ot_marker:get() and get_local_player() ~= nil and get_local_player():is_alive() and p121.state == nil then
		table.insert(onetap_data, {
			[1] = p121.aim,
			[2] = globals.realtime + 3
		})
	end
end)
events.render:set(function()
	-- upvalues: v71 (copy), get_local_player (copy)
	if v71.menu.elements.visuals.markers:get() and v71.menu.elements.visuals.ot_marker:get() and get_local_player() ~= nil and get_local_player():is_alive() then
		for _, v in pairs(onetap_data) do
			if globals.realtime > v[2] then
				table.remove(onetap_data, 1)
			end

			if v[1]:to_screen() ~= nil then
				render.line(vector(v[1]:to_screen().x + 4, v[1]:to_screen().y + 4),
					vector(v[1]:to_screen().x + 8, v[1]:to_screen().y + 8), color(255, 255, 255, 255))
				render.line(vector(v[1]:to_screen().x - 4, v[1]:to_screen().y + 4),
					vector(v[1]:to_screen().x - 8, v[1]:to_screen().y + 8), color(255, 255, 255, 255))
				render.line(vector(v[1]:to_screen().x + 4, v[1]:to_screen().y - 4),
					vector(v[1]:to_screen().x + 8, v[1]:to_screen().y - 8), color(255, 255, 255, 255))
				render.line(vector(v[1]:to_screen().x - 4, v[1]:to_screen().y - 4),
					vector(v[1]:to_screen().x - 8, v[1]:to_screen().y - 8), color(255, 255, 255, 255))
			end
		end
	end
end)
events.round_prestart:set(function()
	onetap_data = {}
end)
kibit_data = {}
events.aim_ack:set(function(p122)
	-- upvalues: v71 (copy), get_local_player (copy)
	if v71.menu.elements.visuals.markers:get() and v71.menu.elements.visuals.kibit_marker:get() and get_local_player() ~= nil and get_local_player():is_alive() and p122.state == nil then
		table.insert(kibit_data, {
			[1] = p122.aim,
			[2] = globals.realtime + 3
		})
	end
end)
events.render:set(function()
	-- upvalues: v71 (copy), get_local_player (copy)
	if v71.menu.elements.visuals.markers:get() and v71.menu.elements.visuals.kibit_marker:get() and get_local_player() ~= nil and get_local_player():is_alive() then
		for _, v in pairs(kibit_data) do
			if globals.realtime > v[2] then
				table.remove(kibit_data, 1)
			end

			if v[1]:to_screen() ~= nil then
				render.rect(vector(v[1]:to_screen().x - 1, v[1]:to_screen().y - 6),
					vector(v[1]:to_screen().x + 1, v[1]:to_screen().y + 6), color(34, 214, 132, 255))
				render.rect(vector(v[1]:to_screen().x - 6, v[1]:to_screen().y - 1),
					vector(v[1]:to_screen().x + 6, v[1]:to_screen().y + 1), color(108, 182, 203, 255))
			end
		end
	end
end)
events.round_prestart:set(function()
	kibit_data = {}
end)

local t23 = {
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

events.item_purchase:set(function(p123)
	-- upvalues: v71 (copy)
	if v71.menu.elements.ragebot.aimbot_logging:get() and v71.menu.elements.ragebot.purchases:get() then
		local v447 = entity.get(p123.userid, true)
		local weapon = p123.weapon

		if v447 == nil then
			return
		end

		if weapon == "weapon_unknown" then
			return
		end

		if not v447:is_enemy() then
			return
		end

		print_raw(("\a{Link Active}mytools \a85858DFF·\aD5D5D5FF %s bought \aACFF86FF%s"):format(
		string.lower(v447:get_name()), weapon))
		print_dev(("%s bought \aACFF86FF%s\aDEFAULT"):format(v447:get_name(), weapon))
	end
end)
events.aim_ack:set(function(p124)
	-- upvalues: v71 (copy), get_local_player (copy), v63 (copy), t23 (copy), format (copy)
	if v71.menu.elements.ragebot.aimbot_logging:get() and v71.menu.elements.ragebot.select_log:get("Console") then
		get_local_player()

		local v450 = entity.get(p124.target)
		local state = p124.state
		local state2 = p124.state

		if not v450 then
			return
		end

		if v450 == nil then
			return
		end

		local m_iHealth = v450.m_iHealth

		if get_local_player() == nil then
			return
		end

		if state2 == "spread" then
			state2 = "\aFEEA7DFFspread"
		end

		if state2 == "prediction error" then
			state2 = "\aFEEA7DFFpred. error"
		end

		if state2 == "correction" then
			state2 = "\aFF5959FFresolver"
		end

		if state2 == "damage rejection" then
			state2 = "\aFF5959FFdamage rejection"
		end

		if state2 == "misprediction" then
			state2 = "\aFEEA7DFFmisprediction"
		end

		if state2 == "lagcomp failure" then
			state2 = "\aFF5959FFlagcomp failure"
		end

		if state2 == "backtrack failure" then
			state2 = "\aFF5959FFbacktrack failure"
		end

		if state == "correction" then
			state = "resolver"
		end

		if state ~= nil then
			print_dev(("Missed shot in \a{Link Active}" .. v450:get_name() .. "\aDEFAULT's \aDEFAULT%s \aDEFAULTdue to \a{Link Active}" .. state .. " \aDEFAULTΔ: \a{Link Active}%s\aDEFAULT")
			:format(t23[p124.wanted_hitgroup], p124.backtrack))
			print_raw(("\a{Link Active}mytools \a85858DFF· \aD5D5D5FFMissed shot in \a{Link Active}%s\aDEFAULT's \a{Link Active}%s \aDEFAULTdue to " .. state2 .. "\aD5D5D5FF (hc: " .. format("%.f", p124.hitchance) .. " | dmg: " .. format("%.f", p124.wanted_damage) .. " | bt(Δ): %s)")
			:format(string.lower(v450:get_name()), t23[p124.wanted_hitgroup], p124.backtrack))
		else
			print_dev(("Hit \a" .. v63 .. "" .. v450:get_name() .. " \aDEFAULTin the \a" .. v63 .. "%s \aDEFAULTfor \a" .. v63 .. "%d \aDEFAULTdamage (\a" .. v63 .. "" .. m_iHealth .. " \aDEFAULThealth remaining) Δ: \a" .. v63 .. "%s\aDEFAULT")
			:format(t23[p124.hitgroup], p124.damage, p124.backtrack))
			print_raw(("\a{Link Active}mytools \a85858DFF· \aD5D5D5FFHit \a" .. v63 .. "" .. string.lower(v450:get_name()) .. " \aDEFAULTin the \a" .. v63 .. "%s \aDEFAULTfor \a" .. v63 .. "%d\aDEFAULT(\a" .. v63 .. "" .. format("%.f", p124.wanted_damage) .. "\aDEFAULT) damage (\a" .. v63 .. "" .. m_iHealth .. " \aDEFAULThealth remaining) (aim: " .. t23[p124.wanted_hitgroup] .. " | bt(Δ): %s)")
			:format(t23[p124.hitgroup], p124.damage, p124.backtrack))
		end
	end
end)
events.player_hurt:set(function(p125)
	-- upvalues: v71 (copy), get_local_player (copy)
	if v71.menu.elements.ragebot.aimbot_logging:get() and v71.menu.elements.ragebot.select_log:get("Console") then
		local v455 = get_local_player()
		local v456 = entity.get(p125.attacker, true)
		local weapon = p125.weapon
		local s4 = "hit"

		if weapon == "hegrenade" then
			s4 = "Naded"
		end

		if weapon == "inferno" then
			s4 = "Burned"
		end

		if weapon == "knife" then
			s4 = "Knifed"
		end

		if (weapon == "hegrenade" or weapon == "inferno" or weapon == "knife") and v455 == v456 then
			local v459 = entity.get(p125.userid, true)

			print_raw(("\a{Link Active}mytools \a85858DFF· \aD5D5D5FF" .. s4 .. " \a{Link Active}%s \aDEFAULTfor \a{Link Active}%d\aDEFAULT damage (\a{Link Active}%d \aDEFAULThealth remaining)")
			:format(string.lower(v459:get_name()), p125.dmg_health, p125.health))
			print_dev(("" .. s4 .. " \a{Link Active}" .. v459:get_name() .. " \aDEFAULTfor \a{Link Active}%d \aDEFAULTdamage (\a{Link Active}%d \aDEFAULThealth remaining)")
			:format(p125.dmg_health, p125.health))
		end
	end
end)

local v99 = smoothy.new({
	alpha = 0,
	vel_mod = 0
})
local v100 = drag_system.register({
	[1] = v71.menu.elements.visuals.velocity_x,
	[2] = v71.menu.elements.visuals.velocity_y
}, vector(185, 50), "Test1", function(p126)
	-- upvalues: v99 (copy), v71 (copy), get_alpha (copy)
	local v461 = entity.get_local_player()
	local vel_mod = v99.value.vel_mod
	local v463 = math.floor((1 - vel_mod) * 100)
	local alpha = v99.value.alpha

	v99(0.05, {
		vel_mod = not v461 and 0.34 or v461.m_flVelocityModifier,
		alpha = v71.menu.elements.visuals.velocity_warning:get() and (not (v463 == 0 or not v461) or get_alpha() > 0.3) and
		255 or 0
	})

	local ok, result12 = pcall(function()
		-- upvalues: v461 (copy), get_alpha (copy)
		return not v461:is_alive() and get_alpha() ~= 1
	end)

	if not ok or not result12 then
		local v467 = color("EA6868FF"):lerp(color(v71.menu.elements.visuals.velocity_color:get():to_hex()), vel_mod)
		local v468 = string.format("⛔ Max velocity reduced by %i%%", v463)

		render.text(1, vector(p126.position.x + 94, p126.position.y + p126.size.y - 21), color(255, alpha), "c", v468)
		render.shadow(vector(p126.position.x + 7, p126.position.y + p126.size.y - 10),
			vector(p126.position.x + p126.size.x - 7, p126.position.y + p126.size.y - 7), v467:alpha_modulate(alpha), 14,
			0, 3)
		render.rect(vector(p126.position.x + 7, p126.position.y + p126.size.y - 10),
			vector(p126.position.x + p126.size.x - 7, p126.position.y + p126.size.y - 7), color(0, alpha), 3)
		render.rect(vector(p126.position.x + 7, p126.position.y + p126.size.y - 10),
			vector(p126.position.x + p126.size.x * vel_mod - 7, p126.position.y - 7 + p126.size.y),
			v467:alpha_modulate(alpha), 3)

		return
	end
end)

events.render:set(function()
	-- upvalues: v71 (copy), v100 (copy)
	if v71.menu.elements.visuals.velocity_warning:get() then
		v100:update()
	end
end)
events.createmove:set(function()
	-- upvalues: v71 (copy), v62 (copy)
	if v71.menu.elements.misc.grenade_fix:get() then
		if entity.get_local_player() == nil then
			return
		end

		if entity.get_local_player():get_player_weapon() == nil then
			return
		end

		local v469 = entity.get_local_player():get_player_weapon():get_weapon_index()

		if v469 ~= 43 and (v469 ~= 44 and (v469 ~= 45 and (v469 ~= 46 and (v469 ~= 47 and v469 ~= 48)))) then
			ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"):set(v62)
		else
			ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"):set({
				[1] = ""
			})
		end
	end
end)

local n23 = 1

events.player_hurt:set(function(p127)
	-- upvalues: v71 (copy), get_local_player (copy), t23 (copy), v97 (copy), n23 (ref)
	if v71.menu.elements.ragebot.aimbot_logging:get() and v71.menu.elements.ragebot.select_log:get("Screen") and get_local_player() == entity.get(p127.attacker, true) then
		local v471 = entity.get(p127.userid, true)
		local v472 = t23[p127.hitgroup]
		local weapon = p127.weapon

		if weapon == "hegrenade" or weapon == "inferno" or weapon == "knife" then
			return
		end

		if v71.menu.elements.ragebot.aimbot_logging:get() and v71.menu.elements.ragebot.select_log:get("Screen") and not v71.menu.elements.ragebot.select_log:get("Console") then
			print_raw(("\a{Link Active}mytools \a85858DFF· \aD5D5D5FFHit %s in the " .. v472 .. " for %d damage (%d hp remaining)")
			:format(v471:get_name(), p127.dmg_health, p127.health))
		end

		if not (p127.health < 1) then
			v97[#v97 + 1] = {
				[1] = nil,
				[2] = nil,
				[3] = 0,
				[1] = "\aFFFFFFC8Hit \a" ..
				v71.menu.elements.ragebot.accent_color:get():to_hex() ..
				"" ..
				v471:get_name() ..
				" \aFFFFFFC8in the \a" ..
				v71.menu.elements.ragebot.accent_color:get():to_hex() ..
				"" ..
				v472 ..
				" \aFFFFFFC8for \a" ..
				v71.menu.elements.ragebot.accent_color:get():to_hex() ..
				"" ..
				p127.dmg_health ..
				" \aFFFFFFC8damage (\a" ..
				v71.menu.elements.ragebot.accent_color:get():to_hex() .. "" .. p127.health .. " \aFFFFFFC8hp remaining)",
				[2] = globals.tickcount + 300
			}
		else
			v97[#v97 + 1] = {
				[1] = nil,
				[2] = nil,
				[3] = 0,
				[1] = "\aFFFFFFC8Hit \a" ..
				v71.menu.elements.ragebot.accent_color:get():to_hex() ..
				"" ..
				v471:get_name() ..
				" \aFFFFFFC8in the \a" ..
				v71.menu.elements.ragebot.accent_color:get():to_hex() ..
				"" ..
				v472 ..
				" \aFFFFFFC8for \a" ..
				v71.menu.elements.ragebot.accent_color:get():to_hex() ..
				"" ..
				p127.dmg_health ..
				" \aFFFFFFC8damage (\a" .. v71.menu.elements.ragebot.accent_color:get():to_hex() .. "dead\aFFFFFFC8)",
				[2] = globals.tickcount + 300
			}
		end

		n23 = n23 == 999 and 1 or n23 + 1
	end
end)
events.grenade_prediction:set(function(p128)
	-- upvalues: v71 (copy)
	if v71.menu.elements.misc.grenade_release:get() then
		if entity.get_local_player() == nil then
			return
		end

		if entity.get_local_player():get_player_weapon() == nil then
			return
		end

		local v475 = entity.get_local_player():get_player_weapon():get_weapon_index()

		if not v475 == 44 or not v475 == 46 then
			return
		end

		if p128.damage >= v71.menu.elements.misc.min_dmg:get() then
			utils.console_exec("+attack")
			utils.execute_after(0.1, function()
				utils.console_exec("-attack")
			end)
		end
	end
end)
events.aim_ack:set(function(p129)
	-- upvalues: v71 (copy), t23 (copy), v63 (copy), v97 (copy), n23 (ref)
	if v71.menu.elements.ragebot.aimbot_logging:get() and v71.menu.elements.ragebot.select_log:get("Screen") then
		player_name = p129.target:get_name()
		hitgroup = t23[p129.hitgroup]
		wanted_hitgroup = t23[p129.wanted_hitgroup]

		local state = p129.state

		if state == "correction" then
			state = "resolver"
		end

		if state == "prediction error" then
			state = "pred. error"
		end

		if state ~= nil and v71.menu.elements.ragebot.aimbot_logging:get() and v71.menu.elements.ragebot.select_log:get("Screen") and not v71.menu.elements.ragebot.select_log:get("Console") then
			print_raw(("\a" .. v63 .. "mytools \a85858DFF· \aD5D5D5FFMissed shot in %s in the %s due to %s"):format(
			string.lower(player_name), wanted_hitgroup, state))
		end

		if state ~= nil then
			v97[#v97 + 1] = {
				[1] = nil,
				[2] = nil,
				[3] = 0,
				[1] = "\aFFFFFFC8Missed shot in \a" ..
				v71.menu.elements.ragebot.accent_color:get():to_hex() ..
				"" ..
				player_name ..
				"'s \aFFFFFFC8" ..
				wanted_hitgroup ..
				" \aFFFFFFC8due to \a" .. v71.menu.elements.ragebot.accent_color:get():to_hex() .. "" .. state .. " ",
				[2] = globals.tickcount + 300
			}
		end

		n23 = n23 == 999 and 1 or n23 + 1
	end
end)
events.render:set(function()
	-- upvalues: v97 (copy), v71 (copy), screen_size (copy), text2 (copy)
	if #v97 > 0 then
		if globals.tickcount >= v97[1][2] then
			if not (v97[1][3] > 0) then
				if v97[1][3] <= 0 then
					table.remove(v97, 1)
				end
			else
				v97[1][3] = v97[1][3] - 20
			end
		end

		if #v97 > 6 then
			table.remove(v97, 1)
		end

		if globals.is_connected == false then
			table.remove(v97, #v97)
		end

		for i = 1, #v97 do
			text_size = render.measure_text(1, nil, v97[i][1]).x

			if v97[i][3] < 255 then
				v97[i][3] = v97[i][3] + 10
			end

			if v71.menu.elements.ragebot.aimbot_logging:get() and v71.menu.elements.ragebot.select_log:get("Screen") then
				if not v71.menu.elements.ragebot.dis_glow:get() then
					render.shadow(
					vector(screen_size().x / 2 - text_size / 2 + 40,
						screen_size().y / 1.29 - v97[i][3] / 45 + 15 * i + 10),
						vector(screen_size().x / 2 - text_size / 2 + text_size + 25,
							screen_size().y / 1.29 - v97[i][3] / 45 + 15 * i + 10),
						color(v71.menu.elements.ragebot.accent_color:get().r,
							v71.menu.elements.ragebot.accent_color:get().g,
							v71.menu.elements.ragebot.accent_color:get().b, 255), 30, 0, 0)
				end

				text2(1,
					vector(screen_size().x / 2 - text_size / 2 + 35, screen_size().y / 1.3 - v97[i][3] / 45 + 15 * i + 10),
					color(255, 255, 255, v97[i][3]), nil, v97[i][1])
			end
		end
	end
end)
events.render:set(function()
	-- upvalues: v71 (copy)
	if v71.menu.elements.visuals.viewmodel_changer:get() then
		cvar.viewmodel_fov:int(v71.menu.elements.visuals.viewmodel_fov:get(), true)
		cvar.viewmodel_offset_x:float(v71.menu.elements.visuals.viewmodel_x:get() / 10, true)
		cvar.viewmodel_offset_y:float(v71.menu.elements.visuals.viewmodel_y:get() / 10, true)
		cvar.viewmodel_offset_z:float(v71.menu.elements.visuals.viewmodel_z:get() / 10, true)
	end

	cvar.r_aspectratio:float(v71.menu.elements.visuals.viewmodel_aspectratio:get() / 100)
end)
v71.menu.elements.visuals.viewmodel_changer:set_callback(function()
	-- upvalues: v71 (copy)
	if not v71.menu.elements.visuals.viewmodel_changer:get() then
		cvar.viewmodel_fov:int(68)
		cvar.viewmodel_offset_x:float(2.5)
		cvar.viewmodel_offset_y:float(0)
		cvar.viewmodel_offset_z:float(-1.5)
	end
end)
v71.menu.elements.ragebot.fakelatency:set_callback(function()
	-- upvalues: v71 (copy)
	if not v71.menu.elements.ragebot.fakelatency:get() then
		cvar.sv_maxunlag:float(0.2)
	else
		cvar.sv_maxunlag:float(0.4)
	end
end, true)

local t24 = {
	screen = screen_size(),
	var = find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"),
	anim_num = 0,
	lerp = function(p130, p131, p132)
		return p130 + (p131 - p130) * p132
	end
}

function t24.on_draw()
	-- upvalues: v71 (copy), get_local_player (copy), t24 (copy)
	if v71.menu.elements.visuals.custom_scope:get() then
		local_player = get_local_player()

		if local_player and local_player:is_alive() and local_player.m_bIsScoped then
			t24.anim_num = t24.lerp(t24.anim_num, 1, 15 * globals.frametime)
		else
			t24.anim_num = t24.lerp(t24.anim_num, 0, 15 * globals.frametime)
		end

		t24.var:override("Remove All")
		t24.offset = v71.menu.elements.visuals.scope_gap:get() * t24.anim_num
		t24.length = v71.menu.elements.visuals.scope_size:get() * t24.anim_num
		t24.col_1 = v71.menu.elements.visuals.scope_color:get()
		t24.width = 1
		t24.col_1.a = t24.col_1.a * t24.anim_num
		t24.start_x = t24.screen.x / 2
		t24.start_y = t24.screen.y / 2

		if v71.menu.elements.visuals.scope_style:get() ~= "Default" then
			render.gradient(vector(t24.start_x - t24.offset, t24.start_y),
				vector(t24.start_x - t24.offset - t24.length, t24.start_y + t24.width), color(255, 255, 255, 0),
				color(t24.col_1.r, t24.col_1.g, t24.col_1.b,
					v71.menu.elements.visuals.remove_line:get("Left") and 0 or t24.col_1.a), color(255, 255, 255, 0),
				color(t24.col_1.r, t24.col_1.g, t24.col_1.b,
					v71.menu.elements.visuals.remove_line:get("Left") and 0 or t24.col_1.a))
			render.gradient(vector(t24.start_x + t24.offset, t24.start_y),
				vector(t24.start_x + t24.offset + t24.length, t24.start_y + t24.width), color(255, 255, 255, 0),
				color(t24.col_1.r, t24.col_1.g, t24.col_1.b,
					v71.menu.elements.visuals.remove_line:get("Right") and 0 or t24.col_1.a), color(255, 255, 255, 0),
				color(t24.col_1.r, t24.col_1.g, t24.col_1.b,
					v71.menu.elements.visuals.remove_line:get("Right") and 0 or t24.col_1.a))
			render.gradient(vector(t24.start_x, t24.start_y + t24.offset),
				vector(t24.start_x + t24.width, t24.start_y + t24.offset + t24.length), color(255, 255, 255, 0),
				color(255, 255, 255, 0),
				color(t24.col_1.r, t24.col_1.g, t24.col_1.b,
					v71.menu.elements.visuals.remove_line:get("Down") and 0 or t24.col_1.a),
				color(t24.col_1.r, t24.col_1.g, t24.col_1.b,
					v71.menu.elements.visuals.remove_line:get("Down") and 0 or t24.col_1.a))
			render.gradient(vector(t24.start_x, t24.start_y - t24.offset),
				vector(t24.start_x + t24.width, t24.start_y - t24.offset - t24.length), color(255, 255, 255, 0),
				color(255, 255, 255, 0),
				color(t24.col_1.r, t24.col_1.g, t24.col_1.b,
					v71.menu.elements.visuals.remove_line:get("Up") and 0 or t24.col_1.a),
				color(t24.col_1.r, t24.col_1.g, t24.col_1.b,
					v71.menu.elements.visuals.remove_line:get("Up") and 0 or t24.col_1.a))
		else
			render.gradient(vector(t24.start_x - t24.offset, t24.start_y),
				vector(t24.start_x - t24.offset - t24.length, t24.start_y + t24.width),
				color(t24.col_1.r, t24.col_1.g, t24.col_1.b,
					v71.menu.elements.visuals.remove_line:get("Left") and 0 or t24.col_1.a), color(255, 255, 255, 0),
				color(t24.col_1.r, t24.col_1.g, t24.col_1.b,
					v71.menu.elements.visuals.remove_line:get("Left") and 0 or t24.col_1.a), color(255, 255, 255, 0))
			render.gradient(vector(t24.start_x + t24.offset, t24.start_y),
				vector(t24.start_x + t24.offset + t24.length, t24.start_y + t24.width),
				color(t24.col_1.r, t24.col_1.g, t24.col_1.b,
					v71.menu.elements.visuals.remove_line:get("Right") and 0 or t24.col_1.a), color(255, 255, 255, 0),
				color(t24.col_1.r, t24.col_1.g, t24.col_1.b,
					v71.menu.elements.visuals.remove_line:get("Right") and 0 or t24.col_1.a), color(255, 255, 255, 0))
			render.gradient(vector(t24.start_x, t24.start_y + t24.offset),
				vector(t24.start_x + t24.width, t24.start_y + t24.offset + t24.length),
				color(t24.col_1.r, t24.col_1.g, t24.col_1.b,
					v71.menu.elements.visuals.remove_line:get("Down") and 0 or t24.col_1.a),
				color(t24.col_1.r, t24.col_1.g, t24.col_1.b,
					v71.menu.elements.visuals.remove_line:get("Down") and 0 or t24.col_1.a), color(255, 255, 255, 0),
				color(255, 255, 255, 0))
			render.gradient(vector(t24.start_x, t24.start_y - t24.offset),
				vector(t24.start_x + t24.width, t24.start_y - t24.offset - t24.length),
				color(t24.col_1.r, t24.col_1.g, t24.col_1.b,
					v71.menu.elements.visuals.remove_line:get("Up") and 0 or t24.col_1.a),
				color(t24.col_1.r, t24.col_1.g, t24.col_1.b,
					v71.menu.elements.visuals.remove_line:get("Up") and 0 or t24.col_1.a), color(255, 255, 255, 0),
				color(255, 255, 255, 0))
		end
	end
end

events.render:set(t24.on_draw)
v71.menu.elements.visuals.custom_scope:set_callback(function()
	-- upvalues: v71 (copy), t24 (copy)
	if not v71.menu.elements.visuals.custom_scope:get() then
		t24.var:override()
	end
end)
events.createmove:set(function()
	-- upvalues: v71 (copy)
	if not v71.menu.elements.antiaims.antiaims_tweaks:get("Fluctuate Fake Lag") then
		ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):override()
	else
		ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):override(globals.tickcount % 9 == 8 and 1 or
		ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):get())
	end
end)
events.createmove:set(function()
	-- upvalues: get_local_player (copy), v71 (copy)
	local v482 = get_local_player()

	if v482 ~= nil then
		if v482:get_player_weapon() ~= nil then
			if not v71.refs.hs:get() then
				local v483 = v482:get_player_weapon():get_weapon_index()
				local v484 = v483 == 2 or
				(v483 == 3 or (v483 == 4 or (v483 == 30 or (v483 == 32 or (v483 == 36 or (v483 == 61 or v483 == 63))))))
				local v485 = v483 == 11 or v483 == 38
				local v486 = v483 == 9
				local v487 = v483 == 40
				local v488 = v483 == 1 or v483 == 64
				local v489 = v482:get_player_weapon():get_classname() == "CKnife" or v483 == 31
				local v490 = entity.get_players(true, false)

				for k, v in pairs({
					[1] = v484,
					[2] = v485,
					[3] = v486,
					[4] = v487,
					[5] = v488,
					[6] = v489,
					[7] = not v484 and (not v485 and (not v486 and (not v487 and (not v488 and not v489))))
				}) do
					if v71.menu.elements.antiaims.antiaims_tweaks:get("Auto Teleport") and v71.menu.elements.antiaims.weapons:get(k) and v and bit.band(v482.m_fFlags, bit.lshift(1, 0)) == 0 then
						for i = 1, #v490 do
							if v490[i]:is_alive() and v490[i]:is_visible(v490[i]:get_origin()) and globals.tickcount % v71.menu.elements.antiaims.delayticks:get() == v71.menu.elements.antiaims.delayticks:get() - 1 then
								rage.exploit:force_teleport()
							end
						end
					end
				end

				return
			end

			return
		end

		return
	end
end)
new_class():struct("killsay")({
	killsay_pharases = {
		[1] = {
			[1] = "⠀1",
			[2] = "nice iq"
		},
		[2] = {
			[1] = "cgb gblfhfc",
			[2] = "спи пидорас"
		},
		[3] = {
			[1] = "пздц",
			[2] = "игрок"
		}
	},
	death_say = {
		[1] = {
			[1] = "фу ты заебал конч"
		},
		[2] = {
			[1] = ")",
			[2] = "хорош)"
		},
		[3] = {
			[1] = "норм трекаешь",
			[2] = "ублюдина"
		},
		[4] = {
			[1] = "а че",
			[2] = "хайдшоты на фд уже не работают?"
		}
	},
	init = function(p133)
		-- upvalues: events (copy), get_local_player (copy), v71 (copy), random (copy)
		events.player_death:set(function(p134)
			-- upvalues: get_local_player (copy), v71 (copy), p133 (copy), random (copy)
			function delayed_msg(p135, p136)
				return utils.execute_after(p135, function()
					-- upvalues: p136 (copy)
					utils.console_exec("say " .. p136)
				end)
			end

			local n24 = 2.3
			local v746 = get_local_player()
			local v747 = entity.get(p134.userid, true)
			local v748 = entity.get(p134.attacker, true)
			local n25 = 0
			local n26 = 0

			if get_local_player() ~= nil then
				local m_bWarmupPeriod = entity.get_game_rules().m_bWarmupPeriod

				if not v71.menu.elements.misc.killsay_disablers:get() or m_bWarmupPeriod ~= true then
					if v71.menu.elements.misc.killsay:get() then
						if v747 ~= v748 and v748 == v746 then
							local v752 = p133.killsay.killsay_pharases[random(1, #p133.killsay.killsay_pharases)]

							for i = 1, #v752 do
								local v754 = v752[i]

								n25 = n25 + #v752[i] / 24 * n24
								delayed_msg(n25, v754)
							end
						end

						if v747 == v746 and v748 ~= v746 then
							local v755 = p133.killsay.death_say[random(1, #p133.killsay.death_say)]

							for i = 1, #v755 do
								local v757 = v755[i]

								n26 = n26 + #v755[i] / 20 * n24
								delayed_msg(n26, v757)
							end
						end

						return
					end

					return
				end

				return
			end
		end)
	end
}).killsay:init()

local v103 = esp.enemy:new_text("R8 Helper", "\a2FD500FFDMG+", function(p137)
	-- upvalues: get_local_player (copy)
	local v496 = get_local_player()
	local v497 = v496:get_origin():dist((p137:get_origin()))

	if v496 then
		if not v496:is_alive() or v496:get_player_weapon():get_weapon_index() ~= 64 or p137.m_ArmorValue ~= 0 then
			return
		end

		if not (v497 < 585) then
			return " "
		end

		return "\a2FD500FFDMG+"
	end
end)

v71.menu.elements.ragebot.rev_help:set_callback(function()
	-- upvalues: v71 (copy), v103 (copy)
	if v71.menu.elements.ragebot.rev_help:get() then
		v103:set(true)
	end

	if not v71.menu.elements.ragebot.rev_help:get() then
		v103:set(false)
	end
end)
events.createmove:set(function(p138)
	-- upvalues: v71 (copy), get_local_player (copy), t15 (ref), find (copy)
	if v71.menu.elements.antiaims.antiaim_mode:get() ~= "Defensive Preset" then
		local v499 = get_local_player()
		local v500 = t15:get_velocity(v499)
		local v501 = t15:state(v500, nil, p138)

		get_local_player()

		if v71.menu.elements.antiaims.force_lag:get() then
			if (v501 == 2 and not not v71.menu.elements.antiaims.lag_conditions:get("Standing") or (v501 == 3 and not not v71.menu.elements.antiaims.lag_conditions:get("Moving") or (v501 == 4 and not not v71.menu.elements.antiaims.lag_conditions:get("Slow Walking") or (v501 == 7 and not not v71.menu.elements.antiaims.lag_conditions:get("Crouching") or v501 == 8 and not not v71.menu.elements.antiaims.lag_conditions:get("Crouch Move")))) or (v501 == 5 or v501 == 6) and (v71.menu.elements.antiaims.lag_conditions:get("In Air") and true or false)) ~= true then
				find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override()
				find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):override()
			else
				find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("Always On")
				find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):override("Break LC")
			end
		end

		return
	end
end)
v71.menu.elements.antiaims.force_lag:set_callback(function(p139)
	-- upvalues: find (copy)
	if not p139:get() then
		find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override()
		find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):override()
	end
end)

function hitchanceoverride(p140)
	-- upvalues: find (copy), v71 (copy), get_local_player (copy)
	local v504 = find("Aimbot", "Ragebot", "Selection", "Hit Chance")

	if v71.menu.elements.ragebot.hc_enable:get() then
		local v505 = get_local_player()

		if v505 then
			local v506 = v505:get_player_weapon()

			if v506 ~= nil then
				local v507 = v506:get_weapon_index() == 38 or
				(v506:get_weapon_index() == 11 or (v506:get_weapon_index() == 9 or v506:get_weapon_index() == 40))

				if v71.menu.elements.ragebot.hc_cond:get("No scope") and not v505.m_bIsScoped and v507 then
					v504:override(v71.menu.elements.ragebot.hc_ns:get())
				end

				if v71.menu.elements.ragebot.hc_cond:get("Air") and p140.in_jump and v507 then
					v504:override(v71.menu.elements.ragebot.hc_air:get())
				end

				if (not v71.menu.elements.ragebot.hc_cond:get("No scope") or p140.in_jump or v505.m_bIsScoped or not v507) and (not v71.menu.elements.ragebot.hc_cond:get("Air") or not p140.in_jump or not v507) then
					v504:override()
				end

				return
			end

			return
		end

		return
	end
end

events.createmove:set(hitchanceoverride)
new_class():struct("custom_miss_logger")({
	hitlogger = (function()
		-- upvalues: events (copy), world_to_screen (copy), text2 (copy)
		return {
			[1] = nil,
			[2] = 8,
			callback_registered = false,
			[1] = maximum_count,
			data = {},
			register_callback = function(p141)
				-- upvalues: events (copy), world_to_screen (copy), text2 (copy)
				if not p141.callback_registered then
					events.render:set(function()
						-- upvalues: p141 (copy), world_to_screen (copy), text2 (copy)
						local _ = {
							[1] = 56,
							[2] = 56,
							[3] = 57
						}
						local n27 = 10
						local data = p141.data

						for i = #data, 1, -1 do
							p141.data[i].time = p141.data[i].time - globals.frametime

							local n28 = 255
							local v834 = data[i]

							if not (v834.time < 0) then
								local v835 = v834.def_time - v834.time
								local v836 = v835 > 1 and 1 or v835

								if v834.time < 0.48 then
									local _ = (v836 < 1 and v836 or v834.time) / 0.48
								end

								if v836 < 0.48 then
									local _ = (v836 < 1 and v836 or v834.time) / 0.48
								end

								if v834.time < 0.48 then
									local v839 = (v836 < 1 and v836 or v834.time) / 0.48

									n28 = v839 * 255

									if v839 < 0.2 then
										n27 = n27 - 15 * (1 - v839 / 0.2)
									end
								end

								local v840 = v834.time < 0.48 and -1 or 1

								v834.draw = tostring(v834.draw):upper()

								if v834.draw ~= "" then
									if v834.shot_pos == nil or world_to_screen(v834.shot_pos) == nil then
										return
									end

									local x = world_to_screen(v834.shot_pos).x
									local y = world_to_screen(v834.shot_pos).y
									local _ = 55 * (n28 * v840) / 255 * v840

									text2(2, vector(x, y), color(255, 145, 145, n28), "",
										"\aFFFFFFFFx   \aDEFAULT" .. v834.draw)
									n27 = n27 + 25
								end
							else
								table.remove(p141.data, i)
							end
						end

						p141.callback_registered = true
					end)

					return
				end
			end,
			paint = function(p142, p143, p144, p145)
				local v764 = tonumber(p143) + 1

				for i = 1, 2, -1 do
					p142.data[i] = p142.data[i - 1]
				end

				p142.data[1] = {
					time = v764,
					def_time = v764,
					draw = p144,
					shot_pos = p145
				}
				p142:register_callback()
			end
		}
	end)()
}):struct("aim_hit")({
	init = function(p146)
		-- upvalues: events (copy), v71 (copy)
		events.aim_ack:set(function(p147)
			-- upvalues: v71 (copy), p146 (copy)
			if p147.state == "correction" then
				p147.state = "resolver"
			end

			if p147.state == "lagcomp failure" then
				p147.state = "lagcomp"
			end

			if v71.menu.elements.visuals.markers:get() and v71.menu.elements.visuals.miss_marker:get() and p147.state ~= nil then
				p146.custom_miss_logger.hitlogger:paint(2, p147.state, p147.aim)
			end
		end)
	end
}).aim_hit:init()
events.createmove:set(function(_)
	-- upvalues: v71 (copy), get_alpha (copy)
	if (v71.menu.elements.antiaims.antiaim_mode:get() == "Classic Jitter" or v71.menu.elements.antiaims.antiaim_mode:get() == "Defensive Preset") and get_alpha() > 0.3 then
		v71.refs.pitch:override()
		v71.refs.yaw:override()
		v71.refs.jyaw:override()
		v71.refs.jyaw_slider:override()
		v71.refs.base:override()
		v71.refs.fake_op:override()
		v71.refs.left_limit:override()
		v71.refs.right_limit:override()
		v71.refs.hidden:override()
	end
end)

local _ = screen_size().x
local _ = screen_size().y;

({})[""] = {
	alpha_k = 0
}
events.render:set(function()
	-- upvalues: v71 (copy), t2 (copy), text2 (copy), screen_size (copy)
	if not v71.menu.elements.visuals.on_screen:get() or v71.menu.elements.visuals.select:get() == "Disable" then
		if not globals.is_in_game then
			return
		end

		idc = t2.gradient("M Y T O O L S", color(), color(61, 115, 235, 255))
		text2(1, vector(25, screen_size().y / 2), color(), nil,
			idc .. ((v71.cheat.version == "Nightly" or v71.cheat.version == "Alpha") and " \aFF7777FF[DEV]" or " "))
	end
end)

function window(p149, p150, p151, p152, p153, p154)
	-- upvalues: v71 (copy), text2 (copy)
	local v516 = render.measure_text(1, "", p153)
	local r = v71.menu.elements.visuals.accent_col:get().r
	local g = v71.menu.elements.visuals.accent_col:get().g
	local b = v71.menu.elements.visuals.accent_col:get().b

	if v71.menu.elements.visuals.solus_widgets:get() then
		render.rect(vector(p149 - 3, p150), vector(p149 + p151 + 6, p150 + 3 + p152), color(0, 0, 0, p154 / 3), 0)
		render.shadow(vector(p149 - 3, p150), vector(p149 + p151 + 6, p150 + 3 + p152), color(r, g, b, p154 / 1.1), 15,
			nil, 0)
		text2(1, vector(p149 + 1 + p151 / 2 + 1 - v516.x / 2, p150 + 1 + p152 / 2 - v516.y / 2),
			color(255, 255, 255, p154), "", p153)
	end
end

local _, _ = pcall(function()
	return render.load_image(network.get(
	"https://cdn.discordapp.com/attachments/766390146479685662/1092052169814986843/star-solid.png"))
end)
local _ = screen_size().x
local _ = screen_size().y
local n29 = 0
local n30 = 1
local n31 = 0
local t25 = {
	[""] = {
		alpha_k = 0
	}
}
local n32 = 0
local v115 = drag_system.register({
	[1] = v71.menu.elements.visuals.pos_x_s,
	[2] = v71.menu.elements.visuals.pos_y_s
}, vector(120, 60), "Test", function(p155)
	-- upvalues: v71 (copy), t3 (copy), get_binds (copy), t25 (copy), text2 (copy), n31 (ref), n30 (ref), get_alpha (copy), n29 (ref)
	if v71.menu.elements.visuals.solus_widgets:get() and v71.menu.elements.visuals.solus_widgets_s:get("Hotkeys") then
		if not contains(t3, "Hotkeys") then
			table.insert(t3, "Hotkeys")
			check_windows()
		end

		local n33 = 0
		local v522 = globals.frametime * 16
		local n34 = 0
		local t26 = {}
		local v525 = get_binds()

		for i = 1, #v525 do
			local v527 = v525[i]
			local v528 = v525[i].mode == 1 and "holding" or (v525[i].mode == 2 and "toggled" or "[?]")
			local value = v525[i].value
			local name = v525[i].name

			if name == "Peek Assist" then
				name = "Quick peek"
			end

			if name == "Edge Jump" then
				name = "Jump at edge"
			end

			if name == "Hide Shots" then
				name = "Hide shots"
			end

			if name == "Min. Damage" then
				name = "Minimum damage"
			end

			if name == "Fake Latency" then
				name = "Ping spike"
			end

			if name == "Fake Duck" then
				name = "Fake duck"
			end

			if name == "Safe Points" then
				name = "Safe point"
			end

			if name == "Body Aim" then
				name = "Body aim"
			end

			if name == "Double Tap" then
				name = "Double tap"
			end

			if name == "Yaw Base" then
				name = "Manual override"
			end

			if name == "Slow Walk" then
				name = "Slow motion"
			end

			if name == "Dormant Aimbot" then
				name = "Dormant aimbot"
			end

			local v531 = render.measure_text(1, "", v528)
			local v532 = render.measure_text(1, "", name)

			if t25[v527.name] == nil then
				t25[v527.name] = {
					alpha_k = 0
				}
			end

			t25[v527.name].alpha_k = lerp(v522, t25[v527.name].alpha_k, v527.active and 255 or 0)
			text2(1, vector(p155.position.x + 3, p155.position.y + 23 + n34), color(255, t25[v527.name].alpha_k), "",
				name)

			if name ~= "Minimum damage" and name ~= "Ping spike" then
				text2(1, vector(p155.position.x + (n31 - v531.x - 8), p155.position.y + 23 + n34),
					color(255, t25[v527.name].alpha_k), "", "[" .. v528 .. "]")
			else
				text2(1,
					vector(p155.position.x + (n31 - v531.x) - render.measure_text(1, nil, value).x + 28,
						p155.position.y + 23 + n34), color(255, t25[v527.name].alpha_k), "", "[" .. value .. "]")
			end

			n34 = n34 + 16 * t25[v527.name].alpha_k / 255

			local v533 = v531.x + v532.x + 18

			if v533 > 119 and n33 < v533 then
				n33 = v533
			end

			if v525.active then
				table.insert(t26, v525)
			end
		end

		n30 = lerp(v522, n30, (not (get_alpha() <= 0) or n34 > 0) and 1 or 0)
		n31 = lerp(v522, n31, math.max(n33, 119))

		if get_alpha() <= 0 and not (n34 > 6) then
			if n34 < 15.99 and ui.get_alpha() == 0 then
				n29 = lerp(v522, n29, 0)
			end
		else
			n29 = lerp(v522, n29, math.max(get_alpha() * 255, n34 > 1 and 255 or 0))
		end

		if get_alpha() or #t26 > 0 then
			window(p155.position.x, p155.position.y, n31, 16, "keybinds", n29)
		end
	end
end)
local ok, result13 = pcall(function()
	return render.load_image(network.get(
	"https://avatars.cloudflare.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_medium.jpg"))
end)
local v118 = drag_system.register({
	[1] = v71.menu.elements.visuals.pos_x1_s,
	[2] = v71.menu.elements.visuals.pos_y1_s
}, vector(120, 60), "Test2", function(p156)
	-- upvalues: v71 (copy), t3 (copy), get_alpha (copy), n32 (ref), get_local_player (copy), ok (copy), result13 (copy), text2 (copy), texture (copy)
	if v71.menu.elements.visuals.solus_widgets:get() and v71.menu.elements.visuals.solus_widgets_s:get("Spectators") then
		if not contains(t3, "Spectators") then
			table.insert(t3, "Spectators")
			check_windows()
		end

		local v535 = globals.frametime * 16

		if not (get_alpha() > 0) then
			if get_alpha() == 0 then
				n32 = lerp(v535, n32, 0)
			end
		else
			n32 = lerp(v535, n32, math.max(get_alpha() * 255, 1 < 0 and 255 or 0))
		end

		window(p156.position.x, p156.position.y, 120, 16, "spectators", n32)

		local v536 = get_local_player()

		if v536 == nil then
			return
		end

		if v536.m_hObserverTarget and (v536.m_iObserverMode == 4 or v536.m_iObserverMode == 5) then
			v536 = v536.m_hObserverTarget
		end

		local v537 = v536:get_spectators()

		if v537 == nil then
			return
		end

		for i, v in ipairs(v537) do
			local v540 = v:get_name()
			local _ = render.measure_text(1, "", v540).x

			name_sub = string.len(v540) > 17 and string.sub(v540, 0, 17) .. "..." or v540

			local v542 = v:get_steam_avatar()

			if v542 == nil or v542.width <= 5 then
				v542 = ok and result13 or ""
			end

			if not v:is_bot() or v:is_player() then
				text2(1, vector(p156.position.x + 17, p156.position.y + 8 + i * 16), color(), "u", name_sub)
				texture(v542, vector(p156.position.x + 1, p156.position.y + 8 + i * 16), vector(12, 12), color(), "f", 0)
			end
		end

		if not (#v536:get_spectators() <= 0) or v536.m_iObserverMode == 4 or v536.m_iObserverMode == 5 then
			window(p156.position.x, p156.position.y, 120, 16, "spectators", 255)
		end
	end
end)

events.render:set(function()
	-- upvalues: v115 (copy), v118 (copy)
	v115:update()
	v118:update()
end)

local function v119(p157)
	-- upvalues: get_local_player (copy), trace_line (copy)
	local x = get_local_player().m_vecOrigin.x
	local y = get_local_player().m_vecOrigin.y
	local z = get_local_player().m_vecOrigin.z
	local v547 = math.pi * 2

	for i = 0, v547, v547 / 8 do
		local v549 = 10 * math.cos(i) + x
		local v550 = 10 * math.sin(i) + y
		local v551 = trace_line(vector(v549, v550, z), vector(v549, v550, z - p157), get_local_player())
		local fraction = v551.fraction
		local _ = v551.entity

		if fraction ~= 1 then
			return true
		end
	end

	return false
end

events.createmove:set(function(p158)
	-- upvalues: v71 (copy), get_local_player (copy), v119 (copy)
	if v71.menu.elements.antiaims.antiaims_tweaks:get("No Fall Damage") then
		me = get_local_player()

		if me ~= nil then
			if not (me.m_vecVelocity.z >= -500) then
				if not v119(15) then
					if v119(75) then
						no_fall_damage = true
					end
				else
					no_fall_damage = false
				end
			else
				no_fall_damage = false
			end

			if me.m_vecVelocity.z < -500 then
				if not no_fall_damage then
					p158.in_duck = 0
				else
					p158.in_duck = 1
				end
			end

			return
		end

		return
	end
end)
v71.menu.elements.antiaims.antiaims_tweaks:set_callback(function(p159)
	if not p159:get("Avoid Backstab") then
		ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"):override()
	else
		ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"):override(true)
	end
end, true)
events.createmove:set(function()
	-- upvalues: v71 (copy)
	if not v71.menu.elements.antiaims.freestanding:get() then
		v71.refs.freestanding_yaw:set(false)
	else
		v71.refs.freestanding_yaw:set(true)
	end

	local v556 = v71.menu.elements.antiaims.manual_aa:get()

	if not v71.menu.elements.antiaims.freestanding:get() or not v71.menu.elements.antiaims.body_freestanding:get() then
		ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"):override()
	else
		ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"):override(true)
	end

	if v71.menu.elements.antiaims.freestanding:get() and v71.menu.elements.antiaims.disable_manual:get() and v71.refs.freestanding_yaw:get() and (v556 == "Right" or v556 == "Left" or v556 == "Forward") then
		v71.refs.freestanding_yaw:set(false)
	end
end)
events.createmove:set(function()
	-- upvalues: get_local_player (copy), v71 (copy)
	if get_local_player() ~= nil then
		local m_bWarmupPeriod = entity.get_game_rules().m_bWarmupPeriod

		if v71.menu.elements.antiaims.antiaims_tweaks:get("Dis. AA on Warmup") and m_bWarmupPeriod then
			v71.refs.enable_desync:override(false)
			v71.refs.yaw:override(math.random(-180, 180))
			v71.refs.yaw_base:override("Static")
			v71.refs.pitch:override("Disabled")
		end

		return
	end
end)

local v120 = db.tab_mover or {}
local t27 = {
	Aimbot = {
		[1] = "Ragebot",
		[2] = "Anti Aim"
	},
	Visuals = {
		[1] = "Players",
		[2] = "World",
		[3] = "Inventory"
	},
	Miscellaneous = {
		[1] = "Main"
	}
}

local function v122(p160, p161)
	for k, v in pairs(p161) do
		if k == p160 or v == p160 then
			return true
		end
	end

	return false
end

local t29 = {
	parse_remote = function(_, p163)
		-- upvalues: v120 (copy)
		network.get(p163, {}, function(p164)
			-- upvalues: v120 (copy)
			local ok6, _ = pcall(function()
				-- upvalues: p164 (copy)
				return json.parse(p164)
			end)

			if ok6 then
				for k, v in pairs(v120) do
					v120[k] = v
				end

				return true
			end

			print_error("url parser error")
		end)
	end,
	export = function(_, p166)
		-- upvalues: t27 (copy), v120 (copy)
		local v566 = p166 or "Last Config"
		local t28 = {}

		for k, v in pairs(t27) do
			t28[k] = {}

			for _, v14 in ipairs(v) do
				local v572 = ui.find(k, v14)

				t28[k][v14] = v572:export()
			end
		end

		local v573 = json.stringify({
			config = t28
		})

		v120[v566] = v573

		return v573
	end,
	import = function(_, p168, p169)
		-- upvalues: t27 (copy), v122 (copy)
		local ok7, result14 = pcall(function()
			-- upvalues: p168 (copy)
			return json.parse(p168)
		end)

		if ok7 then
			for k, v in pairs(t27) do
				local v581 = result14.config[k]

				if v581 ~= nil then
					for _, v15 in pairs(v) do
						if v122(v15, v581) and v122(v15, p169) then
							local ok8, result15 = pcall(function()
								-- upvalues: k (copy), v15 (copy)
								return ui.find(k, v15)
							end)

							if ok8 then
								result15:import(result14.config[k][v15])
							else
								print_error("An error occured: skipped [%s=>%s] - outdated")
							end
						end
					end
				end
			end

			return
		end

		print_error("An error occured: provided config data is outdated")
	end
}
local self3 = setmetatable({}, {
	__metatable = false,
	__index = t29
})
local t30 = {};

(function(p170, p171, p172)
	-- upvalues: t30 (ref)
	local v589 = ui.create(p170, p171)

	p172(t30, v589)
end)("General", "Cheat Additionals", function(p173, p174)
		-- upvalues: t27 (copy), self3 (ref), clipboard (copy), v71 (copy)
		local t31 = {}

		for _, v in pairs(t27) do
			for _, v16 in pairs(v) do
				table.insert(t31, v16)
			end
		end

		p173.mover_tabs = p174:listable("", t31)
		p173.export_btn = p174:button("\a{Link Active}\239\130\147   \aDEFAULTExport Cheat Config", function()
			-- upvalues: self3 (ref), clipboard (copy)
			local v772 = self3:export()

			clipboard.set(v772)
		end, true)
		p173.import_btn = p174:button("\a{Link Active}\239\128\153   \aDEFAULTImport Cheat Config", function()
			-- upvalues: clipboard (copy), p173 (copy), self3 (ref)
			local v773 = clipboard.get()
			local t32 = {}

			for _, v in pairs(p173.mover_tabs:list()) do
				if p173.mover_tabs:get(v) then
					table.insert(t32, v)
				end
			end

			self3:import(v773, t32)
		end, true)
		v71.menu.elements.misc.config_stealer:set_callback(function(p175)
			-- upvalues: p173 (copy)
			p173.mover_tabs:visibility(p175:get())
			p173.export_btn:visibility(p175:get())
			p173.import_btn:visibility(p175:get())
		end, true)
	end)
events.shutdown:set(function()
	-- upvalues: v120 (copy)
	db.tab_mover = v120
end)
v71.menu.elements.ragebot.aimbot_logging:set_callback(function(p176)
	-- upvalues: v71 (copy)
	if not p176:get() then
		v71.refs.logs:override()
	else
		v71.refs.logs:override("")
	end
end, true)
v71.menu.elements.antiaims.antiaim_mode:set_callback(function(p177)
	-- upvalues: v71 (copy), find (copy)
	if p177:get() ~= "Disabled" then
		if p177:get() ~= "Classic Jitter" then
			if p177:get() ~= "Defensive Preset" then
				if p177:get() == "Conditional" then
					v71.menu.elements.antiaims.force_lag:visibility(true)
				end
			else
				v71.menu.elements.antiaims.force_lag:visibility(false)
			end
		else
			v71.menu.elements.antiaims.force_lag:visibility(true)
		end
	else
		v71.menu.elements.antiaims.force_lag:visibility(true)
	end

	v71.menu.elements.antiaims.tp:visibility(p177:get() == "Classic Jitter" or p177:get() == "Defensive Preset")

	if p177:get() ~= "Defensive Preset" then
		find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override()
		find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):override()
	end
end, true)
