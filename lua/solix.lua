--dumpbytofukcerlips
local function v1(p1)
	local ok, result = pcall(require, p1)

	if not ok then
		print_raw("\aff0000C8Error cant be automatically sent!")
		print_raw("\aff0000C8Error CONTACT SUPPORT OR OWNER/CODER FAST AND PROVIDE SCREENSHOT!")
		error("Error: Failed to require '" .. p1 .. "' - Module not found!", 2)
	end

	return result
end

local v2 = v1("neverlose/pui")

v1("neverlose/anti_aim")

local v3 = v1("neverlose/clipboard")
local v4 = v1("neverlose/mtools")
local v5 = v1("neverlose/base64")
local v6 = v1("neverlose/gradient")
local v7 = v1("neverlose/bomb")

v1("neverlose/csgo_weapons")

local rich_presence_ok, v8 = pcall(require, "neverlose/rich_presence")

if not rich_presence_ok then
	print_raw("\affaa00C8Warning: 'neverlose/rich_presence' could not be loaded; shared icon disabled.")
	print_raw(tostring(v8))
	v8 = nil
end
local v9 = v1("neverlose/websockets")
local v10 = v1("neverlose/nl_json")
local v11 = v1("neverlose/better_json")
local v12 = v1("neverlose/lerp")
local v13 = v1("neverlose/drag_system")
local v14 = v1("neverlose/gif_decode")
local v15 = v1("neverlose/file")
local lagrecord = require("neverlose/lagrecord");

(lagrecord ^ lagrecord.SIGNED).set_update_callback(function(p2)
	if p2 ~= entity.get_local_player() then
		return
	end

	return true
end)
ffi.cdef("    typedef struct {\n        float x, y, z;\n    } Vector;\n\n    typedef struct {\n        float x, y, z;\n    } QAngle;\n\n    typedef struct {\n        char  pad_0000[20];\n        int order; //0x0014\n        int sequence; //0x0018\n        float prev_cycle; //0x001C\n        float weight; //0x0020 -- this\n        float weight_delta_rate; //0x0024\n        float playback_rate; //0x0028\n        float cycle; //0x002C\n        void *owner; //0x0030\n        char  pad_0038[4]; //0x0034\n    } c_animlayers;\n\n    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder;\n        int m_nSequence;\n        float m_flPrevCycle;\n        float m_flWeight;\n        float m_flWeightDeltaRate;\n        float m_flPlaybackRate;\n        float m_flCycle;\n        void *m_pOwner;\n        char  pad_0038[4];\n    } animstate_layer_t;\n\n    typedef void(__thiscall* AddLineOverlayAlpha)(void*, const Vector& origin, const Vector& dest, int r, int g, int b, int a, bool noDepthTest, float duration);\n    typedef void(__thiscall* DrawPill_t)(void*, const Vector& mins, const Vector& max, float& diameter, int r, int g, int b, int a, float duration);\n    typedef void*(__thiscall* GetClientEntity_t)(void*, int);\n\n    bool CreateDirectoryA(const char* lpPathName, void* lpSecurityAttributes);\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);  \n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n    \n    // Game Focus Windows API\n    int GetForegroundWindow();\n    bool FlashWindow(int hwnd, bool invert);\n    void SwitchToThisWindow(int hwnd, bool unknown);\n    int FindWindowA(const char* class, const char* name);\n")
ffi.typeof("uintptr_t**")

local v17 = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)")
local u18 = nil

if not (function()
	local ok, _ = pcall(function()
		return utils.create_interface("client.dll", "VClientEntityList003")
	end)

	if ok then
		return true
	end

	print_raw("\aff0000C8FFI Error: Failed to initialize entity list interface!")

	return false
end)() then
	print_raw("\aff0000C8FFI Error: Critical FFI components failed to load!")
end

math.maxlerp = 1.5555555555555556

function math.lerp(p3, p4, p5)
	if p3 ~= p4 then
		local v165 = globals.frametime * 100
		local v166 = p5 * math.min(v165, math.maxlerp)
		local v167 = p3 + (p4 - p3) * v166

		if not (math.abs(v167 - p4) < 0.01) then
			return v167
		end

		return p4
	end

	return p4
end

local function v19(p6, p7, p8)
	if p6 ~= p7 then
		return p6 + (p7 - p6) * p8
	end

	return p7
end

local t1 = {
	base_speed = 0.095,
	_list = {}
}

function t1.new(p9, p10, p11, p12)
	-- upvalues: t1 (copy)
	if not p11 then
		p11 = t1.base_speed
	end

	if t1._list[p9] == nil then
		t1._list[p9] = p12 and p12 or 0
	end

	t1._list[p9] = math.lerp(t1._list[p9], p10, p11)

	return t1._list[p9]
end

local x = render.screen_size().x
local y = render.screen_size().y
local t2 = {}

local function v24()
	-- upvalues: t2 (copy), v19 (copy), x (copy), y (copy)
	local n1 = 0

	if t2 and #t2 ~= 0 then
		for i = #t2, 1, -1 do
			local v177 = t2[i]

			if v177 then
				if v177.time + 2 > globals.realtime then
					v177.alpha = v19(v177.alpha, 255, 0.095)
				end

				local str = tostring(v177.text)
				local v179 = v177.color or color(255, 255, 255, 255)
				local v180 = render.measure_text(1, "", tostring(str)).x / 2

				render.rect(vector(x / 2 - v180 - 10, y / 1.21 - n1 - 6), vector(x / 2 + v180 + 10, y / 1.21 - n1 + 20), color(15, 15, 15, v177.alpha), 12)
				render.shadow(vector(x / 2 - v180 - 10, y / 1.21 - n1 - 6), vector(x / 2 + v180 + 10, y / 1.21 - n1 + 20), color(v179.r, v179.g, v179.b, v177.alpha * 0.8), 13, 0, 12)
				render.text(1, vector(x / 2 - v180, y / 1.21 - n1), color(255, 255, 255, v177.alpha), nil, str)
				n1 = n1 + 35 * v177.alpha / 255

				if v177.time + 3 < globals.realtime then
					v177.alpha = v19(v177.alpha, 0, 0.095)
				end

				if not (v177.alpha >= 1) or #t2 > 5 then
					table.remove(t2, i)
				end
			else
				table.remove(t2, i)
			end
		end

		return
	end
end

events.render:set(function()
	-- upvalues: v24 (copy)
	v24()
end);
(function(p13)
	ffi.C.CreateDirectoryA(p13, nil)
end)("nl\\solix\\")
v4.Network.Download("https://raw.githubusercontent.com/suzune1337/asdaskdkadkadk/refs/heads/main/FIFZB0x.png", "nl\\solix\\bottomimage.png", true, 97)
v4.Network.Download("https://raw.githubusercontent.com/suzune1337/asdaskdkadkadk/refs/heads/main/FIFL5TF.png", "nl\\solix\\topimage.png", true, 97)
v4.Network.Download("https://github.com/suzunehvh/ewfsdfsfs/raw/refs/heads/main/Lora.ttf", "nl\\solix\\Lora.ttf", true, 97)
v4.Network.Download("https://fontsforyou.com/downloads/99851-smallestpixel7", "nl\\solix\\pixel.ttf", true, 97)
solix = solix or {}
solix.rich_presence = {}

if v8 then
	solix.rich_presence.key = v8.SetKey("cokseviyorum")
	solix.rich_presence.delay = v8.SetRequestDelay(5)
end
solix.sharedfunc = solix.sharedfunc or {}

local t3 = {
	top = { vector(263.15789473684214, 260.5263157894737) }
}
local t4 = {
	top = {}
}

t4.top[1] = render.load_image_from_file("nl\\solix\\topimage.png", t3.top[1])

local t5 = {
	[1] = "If i could rate the lua i would rate it 10/10 but im just an AI that has no soul and created by solix",
	[2] = "If you really wanna be unhittable my tip would be understand the anti-aimbot and use tick-switcher and play with the desync L&R",
	[3] = "To be honest people now days just ideal tick if you can't beat them join them!",
	[4] = "Your scout missed? Don't worry, just blame the tick and toggle Air Lag harder.",
	[5] = "Resolver Improvments is so good it probably has a PhD in missing fakelag.",
	[6] = "I saw your config. Now I understand why your KD is negative.",
	[7] = "Manuals on. Backwards. Now pray to solix that freestand chooses the right side.",
	[8] = "This Lua has more defensive options than you have IQ points.",
	[9] = "Trash talk enabled. Confidence boosted. Still 0 kills.",
	[10] = "Don't worry, LC prediction box knows you'll die before you do.",
	[11] = "Activate Penetration Circle and pretend you know what multi-point means.",
	[12] = "Shared Icon on. Now your entire team can lose in sync.",
	[13] = "Jump scout isn't broken, you are.",
	[14] = "Ideal tickers be like: 'Skill issue? Never heard of it.'",
	[15] = "Toggle clantag and indicators to flex while getting backstabbed.",
	[16] = "Avoid Backstab: true. Awareness: false.",
	[17] = "Hideshots on, peek the awper. Great idea, right?",
	[18] = "Crosshair indicator glowing, ego growing.",
	[19] = "Freestanding picked the wrong side again? Blame the moon phase.",
	[20] = "Auto mute/unmute — because even the Lua knows other's talk too much.",
	[21] = "Fastladder so fast you skipped brain day.",
	[22] = "6 Yaw Modifier modes and tons of options for defensive and Yaw, and you still get resolved by skeet defaults.",
	[23] = "Solix made me say this: 'Try Defensive Builder, not your 2018 Jitter preset.'",
	[24] = "Your config is so bad, even resolver improvements starts aiming at the floor.",
	[25] = "Missed every shot? At least your scope overlay looks cool.",
	[26] = "Damage Indicator says 0 — again.",
	[27] = "The Lua does everything except carry you. That part's on you.",
	[28] = nil,
	[29] = "Clantag enabled. Server still thinks you're garbage.",
	[30] = "More configs than hours played — impressive dedication to mediocrity.",
	[31] = "Neverlose Lua can't fix your game sense bro.",
	[32] = "Even the penetration circle dodges your targets.",
	[33] = "'Resolver Improvments' misses? Yeah, that's definitely your config and not your ego.",
	[34] = "Manual anti-aim: for people who like to be wrong 50% of the time.",
	[35] = "You're still hittable — maybe try aiming next.",
	[36] = "Trash talk delay set to 1s, just like your reaction time.",
	[37] = "The Lua updates more than your plays do.",
	[38] = "Freestanding says left. Resolver says right. You say 'wtf?'",
	[39] = "Still blaming hitreg? Try blaming your config next.",
	[40] = "You enabled aspect ratio, not awareness ratio.",
	[41] = "Auto hideshots on. Still no kills. Interesting.",
	[28] = "You turned on modern indicators — too bad there's no one to impress at " .. common.get_system_time().hours .. ":" .. common.get_system_time().minutes .. "."
}
local n2 = 0
local s1 = ""
local realtime = globals.realtime
local n3 = 0
local u32 = t5[math.random(1, #t5)]

events.render:set(function()
	-- upvalues: v12 (copy), realtime (ref), n3 (ref), u32 (ref), s1 (ref), t4 (copy), t5 (copy)
	local v182 = ui.get_position()
	local n4 = 232
	local v184 = v182.x + 220
	local v185 = v182.y - 184

	if ui.get_alpha() ~= 1 then
		v12.lerp("texture", 0, 10)
		s1 = ""
		n3 = 0
		realtime = globals.realtime
		u32 = t5[math.random(1, #t5)]
	else
		v12.lerp("texture", 255, 10)

		local v186 = v12.get("texture")

		if v186 == nil then
			return
		end

		local realtime2 = globals.realtime

		if realtime2 - realtime > 0.025 and n3 < #u32 then
			n3 = n3 + 1
			s1 = u32:sub(1, n3)
			realtime = realtime2
		end

		render.measure_text(1, nil, s1)

		local t6 = {}

		if not (n4 < render.measure_text(1, nil, s1).x) then
			t6[1] = s1
		else
			local s2 = ""

			for match in s1:gmatch("%S+") do
				local v191 = s2 == "" and match or s2 .. " " .. match

				if not (n4 < render.measure_text(1, nil, v191).x) then
					s2 = v191
				else
					table.insert(t6, s2)
					s2 = match
				end
			end

			table.insert(t6, s2)
		end

		local _ = #t6 * 30

		render.texture(t4.top[1], vector(v182.x, v185), nil, color(255, 255, 255, v186))

		for i, v in ipairs(t6) do
			local v195 = render.measure_text(1, nil, v)
			local v196 = v185 + (i - 1) * 30

			render.blur(vector(v184, v196), vector(v184 + 10 + v195.x, v196 + 20), 5, 1, 5)
			render.rect(vector(v184, v196), vector(v184 + 10 + v195.x, v196 + 20), color(0, 0, 0, math.min(v186, 100)), 5, false)
			render.rect_outline(vector(v184, v196), vector(v184 + 10 + v195.x, v196 + 20), color(0, 0, 0, math.min(v186, 100)), 2, 3, false)
			render.text(1, vector(v184 + 5, v196 + 2), color(255, 255, 255, v186), nil, v)
		end
	end
end)

local v33 = v6.text_animate("Solix ' Beta", -2, {
	color(178, 59, 59, 255),
	color(255, 255, 255)
})

events.render:set(function()
	-- upvalues: v33 (copy), v2 (copy)
	v33:animate()
	v2.sidebar(v33:get_animated_text(), ui.get_icon("heart", color(255, 255, 255)))
end)

local _ = render.screen_size().x
local y2 = render.screen_size().y
local t7 = {
	enableaanl = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"),
	disable = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
	pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
	yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
	base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
	yawoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
	backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
	hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"),
	modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
	modoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"),
	bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
	inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
	leftlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
	rightlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
	options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
	fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
	fss = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"),
	fsb = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"),
	fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
	sw = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
	leg = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"),
	pa = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"),
	dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
	hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
	var = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"),
	immediate = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"),
	hslag = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"),
	dtlag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
	dtl = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"),
	fl = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"),
	scope = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"),
	fov = ui.find("Visuals", "World", "Main", "Field of View"),
	spike = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"),
	dormant = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"),
	dmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"),
	clantag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"),
	pistols_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "Pistols", "Hit Chance"),
	auto_snipers_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"),
	awp_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"),
	ssg08_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"),
	silent_aim = v2.find("Aimbot", "Ragebot", "Main", "Enabled", "Silent Aim"),
	revolver_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "R8 Revolver", "Hit Chance"),
	bodyaim = v2.find("Aimbot", "Ragebot", "Safety", "Body Aim"),
	safepoints = v2.find("Aimbot", "Ragebot", "Safety", "Safe Points"),
	override_zoom = {
		force_viewmodel = ui.find("Visuals", "World", "Main", "Override Zoom", "Force Viewmodel"),
		scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
	}
}
local t8 = {
	colors = {
		accent = color("#8FBCD7D8"),
		white = color("#FFFFFF"),
		red = color("FA3F3F6F")
	},
	inform = {
		update = "29.08.2025",
		build = "Beta",
		name = "Solix",
		username = common.get_username()
	}
}

v2.colors.accent = t8.colors.accent
v2.colors.white = t8.colors.white
v2.colors.red = t8.colors.red

local t9 = {
	menulist = {},
	reference = {},
	profile = {},
	antiaim = {},
	visuals = {},
	others = {},
	reference = {
		antiaim = {
			conditions = {
				[1] = "\v\f<earth-americas>   \226\128\138\226\128\138\226\128\138\226\128\138\rGlobal",
				[2] = " \v\239\134\131     \226\128\138\226\128\138\rStand",
				[3] = "\v\239\156\140    \226\128\138\226\128\138\226\128\138\rMove",
				[4] = "\226\128\138\v\239\149\148     \226\128\138\226\128\138\rSlow Walk",
				[5] = "\226\128\138\v\239\134\147   \226\128\138\226\128\138\rCrouch",
				[6] = "\226\128\138\v\238\139\142   \226\128\138\226\128\138\226\128\138\rCrouch Move",
				[7] = "\226\128\138\v\238\149\134    \226\128\138\226\128\138\rAir",
				[8] = "\226\128\138\v\238\149\135  \226\128\138\226\128\138\rAir+"
			}
		}
	}
}
local v39 = db.SolixBeta or {}

v39.config_list = v39.config_list or {
	[1] = "Default"
}
v39.ui_list = v39.ui_list or {
	[1] = "Default"
}
v39.config_list[1] = "W3siYW5nZWxzIjp7InNlbGVjdG9yIjoi4oCKXHUwMDA3e0xpbmsgQWN0aXZlfe6VhyAg4oCK4oCKXHUwMDA3REVGQVVMVEFpcisifSwiZXhwbG9pdHMiOnsiZGVmZW5zaXZlX2ZsaWNrIjpmYWxzZSwic2FmZV9oZWFkIjp0cnVlLCJzbHhfYW5pbSI6dHJ1ZSwifmRlZmVuc2l2ZV9mbGljayI6eyJvcHRpb25zIjpbIn4iXSwicGl0Y2giOiJEb3duIiwidGltZSI6NC4wLCJ1bm1hdGNoZWRfbW9kZSI6ZmFsc2UsInlhdyI6IkRlZmF1bHQifSwifnNhZmVfaGVhZCI6eyJzYWZlaGVhZF9mbGljayI6ZmFsc2UsIndlYXBvbnMiOlsiS25pZmUiLCJaZXVzIiwiR3JlbmFkZSIsIn4iXX0sIn5zbHhfYW5pbSI6eyJhaXJfY29tYm8iOiJLYW5nYXJvbyIsImppdHRlcl9jb21ibyI6IlNsb3cgSml0dGVyIiwib3RoZXJfY29tYm8iOlsiUGl0Y2ggMCBvbiBsYW5kIiwiRWFydGhxdWFrZSIsIlNtb290aGluZyIsIn4iXSwic2xpZGVyX2ppdHRlciI6ODAuMCwid2Fsa19jb21ibyI6IkppdHRlciJ9fSwiZXh0cmEiOnsiZm9yY2VkZWYiOnRydWV9LCJob3RrZXlzIjp7ImF2b2lkYmFja3N0YWIiOnRydWUsImZyZWVzdGFuZGluZyI6ZmFsc2UsIn5mcmVlc3RhbmRpbmciOnsiZnJlZXN0YW5kX2JhaXQiOmZhbHNlLCJmcmVlc3RhbmRpbmdfZGlzYWJsZXJzIjpbIuKAilx1MDAwN3tMaW5rIEFjdGl2ZX3vhpMgICDigIrigIpcdTAwMDdERUZBVUxUQ3JvdWNoIiwi4oCKXHUwMDA3e0xpbmsgQWN0aXZlfe6LjiAgIOKAiuKAiuKAilx1MDAwN0RFRkFVTFRDcm91Y2ggTW92ZSIsIuKAilx1MDAwN3tMaW5rIEFjdGl2ZX3ulYYgICAg4oCK4oCKXHUwMDA3REVGQVVMVEFpciIsIuKAilx1MDAwN3tMaW5rIEFjdGl2ZX3ulYcgIOKAiuKAilx1MDAwN0RFRkFVTFRBaXIrIiwifiJdLCJ5YXdtb2RpZmllciI6ZmFsc2V9fX0sW3siYm9keV95YXciOlsifiJdLCJkZWZlbnNpdmVfbGFiZWwiOnsiZW5hYmxlIjpmYWxzZSwib3NhYSI6ZmFsc2UsInBpdGNoIjoiRGlzYWJsZWQiLCJwaXRjaF9hbmdsZSI6ODUuMCwicGl0Y2hfbGVmdF92YWx1ZSI6LTQ1LjAsInBpdGNoX21pbl9tYXgiOmZhbHNlLCJwaXRjaF9yaWdodF92YWx1ZSI6NDUuMCwicGl0Y2hfc3BlZWQiOjEuMCwicGl0Y2hfdGlja3NfdmFsdWUiOjIuMCwidGlja3NfZGVmIjoyLjAsIndoZW5faGl0dGFibGUiOmZhbHNlLCJ5YXciOiJEaXNhYmxlZCIsInlhd19hbmdsZSI6OTAuMCwieWF3X2xlZnRfdmFsdWUiOi05MC4wLCJ5YXdfbWluX21heCI6ZmFsc2UsInlhd19yaWdodF92YWx1ZSI6OTAuMCwieWF3X3NwZWVkIjoxLjB9LCJvdmVycmlkZSI6ZmFsc2UsInlhdyI6ImRlZmF1bHQiLCJ5YXdfYmFzZSI6MS4wLCJ5YXdfZGVmYXVsdF92YWx1ZSI6MC4wLCJ5YXdfZGVsYXlfZW5hYmxlMSI6ZmFsc2UsInlhd19sZWZ0X3ZhbHVlIjowLjAsInlhd19tb2RpZmllciI6ImRpc2FibGVkIiwieWF3X21vZGlmaWVyX3ZhbHVlIjowLjAsInlhd19yaWdodF92YWx1ZSI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfcmFuZG9taXphdGlvbiI6MC4wLCJib2R5X3lhd192YWx1ZSI6MC4wLCJib2R5X3lhd192YWx1ZTIiOjAuMCwieWF3X2RlbGF5X2VuYWJsZSI6MS4wfSwifnlhd19kZWxheV9lbmFibGUxIjp7InRpY2tzIjoyLjB9fSx7ImJvZHlfeWF3IjpbIn4iXSwiZGVmZW5zaXZlX2xhYmVsIjp7ImVuYWJsZSI6dHJ1ZSwib3NhYSI6dHJ1ZSwicGl0Y2giOiJQcm9ncmVzc2l2ZSIsInBpdGNoX2FuZ2xlIjo4OS4wLCJwaXRjaF9sZWZ0X3ZhbHVlIjotNDUuMCwicGl0Y2hfbWluX21heCI6ZmFsc2UsInBpdGNoX3JpZ2h0X3ZhbHVlIjo0NS4wLCJwaXRjaF9zcGVlZCI6Ni4wLCJwaXRjaF90aWNrc192YWx1ZSI6Mi4wLCJ0aWNrc19kZWYiOjIuMCwid2hlbl9oaXR0YWJsZSI6ZmFsc2UsInlhdyI6IlNwaW4gdjIiLCJ5YXdfYW5nbGUiOjkwLjAsInlhd19sZWZ0X3ZhbHVlIjotOTAuMCwieWF3X21pbl9tYXgiOmZhbHNlLCJ5YXdfcmlnaHRfdmFsdWUiOjkwLjAsInlhd19zcGVlZCI6Ni4wfSwib3ZlcnJpZGUiOnRydWUsInlhdyI6ImRlZmF1bHQiLCJ5YXdfYmFzZSI6MS4wLCJ5YXdfZGVmYXVsdF92YWx1ZSI6MC4wLCJ5YXdfZGVsYXlfZW5hYmxlMSI6ZmFsc2UsInlhd19sZWZ0X3ZhbHVlIjowLjAsInlhd19tb2RpZmllciI6ImRpc2FibGVkIiwieWF3X21vZGlmaWVyX3ZhbHVlIjowLjAsInlhd19yaWdodF92YWx1ZSI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfcmFuZG9taXphdGlvbiI6MC4wLCJib2R5X3lhd192YWx1ZSI6MC4wLCJib2R5X3lhd192YWx1ZTIiOjAuMCwieWF3X2RlbGF5X2VuYWJsZSI6MS4wfSwifnlhd19kZWxheV9lbmFibGUxIjp7InRpY2tzIjoyLjB9fSx7ImJvZHlfeWF3IjpbIn4iXSwiZGVmZW5zaXZlX2xhYmVsIjp7ImVuYWJsZSI6ZmFsc2UsIm9zYWEiOmZhbHNlLCJwaXRjaCI6IkRpc2FibGVkIiwicGl0Y2hfYW5nbGUiOjg1LjAsInBpdGNoX2xlZnRfdmFsdWUiOi00NS4wLCJwaXRjaF9taW5fbWF4IjpmYWxzZSwicGl0Y2hfcmlnaHRfdmFsdWUiOjQ1LjAsInBpdGNoX3NwZWVkIjoxLjAsInBpdGNoX3RpY2tzX3ZhbHVlIjoyLjAsInRpY2tzX2RlZiI6Mi4wLCJ3aGVuX2hpdHRhYmxlIjpmYWxzZSwieWF3IjoiRGlzYWJsZWQiLCJ5YXdfYW5nbGUiOjkwLjAsInlhd19sZWZ0X3ZhbHVlIjotOTAuMCwieWF3X21pbl9tYXgiOmZhbHNlLCJ5YXdfcmlnaHRfdmFsdWUiOjkwLjAsInlhd19zcGVlZCI6MS4wfSwib3ZlcnJpZGUiOnRydWUsInlhdyI6IlRpY2sgU3dpdGNoZXIiLCJ5YXdfYmFzZSI6MS4wLCJ5YXdfZGVmYXVsdF92YWx1ZSI6MC4wLCJ5YXdfZGVsYXlfZW5hYmxlMSI6dHJ1ZSwieWF3X2xlZnRfdmFsdWUiOjMyLjAsInlhd19tb2RpZmllciI6ImRpc2FibGVkIiwieWF3X21vZGlmaWVyX3ZhbHVlIjowLjAsInlhd19yaWdodF92YWx1ZSI6LTMyLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19yYW5kb21pemF0aW9uIjowLjAsImJvZHlfeWF3X3ZhbHVlIjowLjAsImJvZHlfeWF3X3ZhbHVlMiI6MC4wLCJ5YXdfZGVsYXlfZW5hYmxlIjoxLjB9LCJ+eWF3X2RlbGF5X2VuYWJsZTEiOnsidGlja3MiOjE1LjB9fSx7ImJvZHlfeWF3IjpbIn4iXSwiZGVmZW5zaXZlX2xhYmVsIjp7ImVuYWJsZSI6dHJ1ZSwib3NhYSI6dHJ1ZSwicGl0Y2giOiJTaW5lIFdhdmUiLCJwaXRjaF9hbmdsZSI6ODkuMCwicGl0Y2hfbGVmdF92YWx1ZSI6LTQ1LjAsInBpdGNoX21pbl9tYXgiOmZhbHNlLCJwaXRjaF9yaWdodF92YWx1ZSI6NDUuMCwicGl0Y2hfc3BlZWQiOjIuMCwicGl0Y2hfdGlja3NfdmFsdWUiOjIuMCwidGlja3NfZGVmIjoyLjAsIndoZW5faGl0dGFibGUiOmZhbHNlLCJ5YXciOiJIZWxpeCIsInlhd19hbmdsZSI6MTgwLjAsInlhd19sZWZ0X3ZhbHVlIjotOTAuMCwieWF3X21pbl9tYXgiOmZhbHNlLCJ5YXdfcmlnaHRfdmFsdWUiOjkwLjAsInlhd19zcGVlZCI6My4wfSwib3ZlcnJpZGUiOnRydWUsInlhdyI6ImRlZmF1bHQiLCJ5YXdfYmFzZSI6MS4wLCJ5YXdfZGVmYXVsdF92YWx1ZSI6MC4wLCJ5YXdfZGVsYXlfZW5hYmxlMSI6ZmFsc2UsInlhd19sZWZ0X3ZhbHVlIjowLjAsInlhd19tb2RpZmllciI6ImRpc2FibGVkIiwieWF3X21vZGlmaWVyX3ZhbHVlIjowLjAsInlhd19yaWdodF92YWx1ZSI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfcmFuZG9taXphdGlvbiI6MC4wLCJib2R5X3lhd192YWx1ZSI6MC4wLCJib2R5X3lhd192YWx1ZTIiOjAuMCwieWF3X2RlbGF5X2VuYWJsZSI6MS4wfSwifnlhd19kZWxheV9lbmFibGUxIjp7InRpY2tzIjoyLjB9fSx7ImJvZHlfeWF3IjpbIn4iXSwiZGVmZW5zaXZlX2xhYmVsIjp7ImVuYWJsZSI6dHJ1ZSwib3NhYSI6dHJ1ZSwicGl0Y2giOiJVcCIsInBpdGNoX2FuZ2xlIjo4NS4wLCJwaXRjaF9sZWZ0X3ZhbHVlIjotNDUuMCwicGl0Y2hfbWluX21heCI6ZmFsc2UsInBpdGNoX3JpZ2h0X3ZhbHVlIjo0NS4wLCJwaXRjaF9zcGVlZCI6MS4wLCJwaXRjaF90aWNrc192YWx1ZSI6Mi4wLCJ0aWNrc19kZWYiOjIuMCwid2hlbl9oaXR0YWJsZSI6ZmFsc2UsInlhdyI6IlNpZGV3YXlzIiwieWF3X2FuZ2xlIjo5MC4wLCJ5YXdfbGVmdF92YWx1ZSI6LTkwLjAsInlhd19taW5fbWF4IjpmYWxzZSwieWF3X3JpZ2h0X3ZhbHVlIjo5MC4wLCJ5YXdfc3BlZWQiOjEuMH0sIm92ZXJyaWRlIjp0cnVlLCJ5YXciOiJkZWZhdWx0IiwieWF3X2Jhc2UiOjEuMCwieWF3X2RlZmF1bHRfdmFsdWUiOjAuMCwieWF3X2RlbGF5X2VuYWJsZTEiOmZhbHNlLCJ5YXdfbGVmdF92YWx1ZSI6MC4wLCJ5YXdfbW9kaWZpZXIiOiJkaXNhYmxlZCIsInlhd19tb2RpZmllcl92YWx1ZSI6MC4wLCJ5YXdfcmlnaHRfdmFsdWUiOjAuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X3JhbmRvbWl6YXRpb24iOjAuMCwiYm9keV95YXdfdmFsdWUiOjU4LjAsImJvZHlfeWF3X3ZhbHVlMiI6NTguMCwieWF3X2RlbGF5X2VuYWJsZSI6MS4wfSwifnlhd19kZWxheV9lbmFibGUxIjp7InRpY2tzIjoyLjB9fSx7ImJvZHlfeWF3IjpbIn4iXSwiZGVmZW5zaXZlX2xhYmVsIjp7ImVuYWJsZSI6dHJ1ZSwib3NhYSI6dHJ1ZSwicGl0Y2giOiJVcCIsInBpdGNoX2FuZ2xlIjo4NS4wLCJwaXRjaF9sZWZ0X3ZhbHVlIjotNDUuMCwicGl0Y2hfbWluX21heCI6ZmFsc2UsInBpdGNoX3JpZ2h0X3ZhbHVlIjo0NS4wLCJwaXRjaF9zcGVlZCI6MS4wLCJwaXRjaF90aWNrc192YWx1ZSI6Mi4wLCJ0aWNrc19kZWYiOjIuMCwid2hlbl9oaXR0YWJsZSI6ZmFsc2UsInlhdyI6IlNpZGV3YXlzIiwieWF3X2FuZ2xlIjo5MC4wLCJ5YXdfbGVmdF92YWx1ZSI6LTkwLjAsInlhd19taW5fbWF4IjpmYWxzZSwieWF3X3JpZ2h0X3ZhbHVlIjo5MC4wLCJ5YXdfc3BlZWQiOjEuMH0sIm92ZXJyaWRlIjp0cnVlLCJ5YXciOiJkZWZhdWx0IiwieWF3X2Jhc2UiOjEuMCwieWF3X2RlZmF1bHRfdmFsdWUiOjAuMCwieWF3X2RlbGF5X2VuYWJsZTEiOmZhbHNlLCJ5YXdfbGVmdF92YWx1ZSI6MC4wLCJ5YXdfbW9kaWZpZXIiOiJkaXNhYmxlZCIsInlhd19tb2RpZmllcl92YWx1ZSI6MC4wLCJ5YXdfcmlnaHRfdmFsdWUiOjAuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X3JhbmRvbWl6YXRpb24iOjAuMCwiYm9keV95YXdfdmFsdWUiOjU4LjAsImJvZHlfeWF3X3ZhbHVlMiI6NTguMCwieWF3X2RlbGF5X2VuYWJsZSI6MS4wfSwifnlhd19kZWxheV9lbmFibGUxIjp7InRpY2tzIjoyLjB9fSx7ImJvZHlfeWF3IjpbIn4iXSwiZGVmZW5zaXZlX2xhYmVsIjp7ImVuYWJsZSI6dHJ1ZSwib3NhYSI6dHJ1ZSwicGl0Y2giOiJTd2F5IiwicGl0Y2hfYW5nbGUiOjg5LjAsInBpdGNoX2xlZnRfdmFsdWUiOi00NS4wLCJwaXRjaF9taW5fbWF4IjpmYWxzZSwicGl0Y2hfcmlnaHRfdmFsdWUiOjQ1LjAsInBpdGNoX3NwZWVkIjo1LjAsInBpdGNoX3RpY2tzX3ZhbHVlIjoyLjAsInRpY2tzX2RlZiI6Mi4wLCJ3aGVuX2hpdHRhYmxlIjpmYWxzZSwieWF3IjoiU3BpbiIsInlhd19hbmdsZSI6OTAuMCwieWF3X2xlZnRfdmFsdWUiOi05MC4wLCJ5YXdfbWluX21heCI6ZmFsc2UsInlhd19yaWdodF92YWx1ZSI6OTAuMCwieWF3X3NwZWVkIjo4LjB9LCJvdmVycmlkZSI6dHJ1ZSwieWF3IjoiZGVmYXVsdCIsInlhd19iYXNlIjoxLjAsInlhd19kZWZhdWx0X3ZhbHVlIjowLjAsInlhd19kZWxheV9lbmFibGUxIjpmYWxzZSwieWF3X2xlZnRfdmFsdWUiOjAuMCwieWF3X21vZGlmaWVyIjoiZGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfdmFsdWUiOjAuMCwieWF3X3JpZ2h0X3ZhbHVlIjowLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19yYW5kb21pemF0aW9uIjowLjAsImJvZHlfeWF3X3ZhbHVlIjowLjAsImJvZHlfeWF3X3ZhbHVlMiI6MC4wLCJ5YXdfZGVsYXlfZW5hYmxlIjoxLjB9LCJ+eWF3X2RlbGF5X2VuYWJsZTEiOnsidGlja3MiOjIuMH19LHsiYm9keV95YXciOlsifiJdLCJkZWZlbnNpdmVfbGFiZWwiOnsiZW5hYmxlIjp0cnVlLCJvc2FhIjp0cnVlLCJwaXRjaCI6IkN1c3RvbSIsInBpdGNoX2FuZ2xlIjotNDYuMCwicGl0Y2hfbGVmdF92YWx1ZSI6LTQ1LjAsInBpdGNoX21pbl9tYXgiOmZhbHNlLCJwaXRjaF9yaWdodF92YWx1ZSI6NDUuMCwicGl0Y2hfc3BlZWQiOjEuMCwicGl0Y2hfdGlja3NfdmFsdWUiOjIuMCwidGlja3NfZGVmIjoyLjAsIndoZW5faGl0dGFibGUiOmZhbHNlLCJ5YXciOiJTaWRld2F5cyIsInlhd19hbmdsZSI6NTEuMCwieWF3X2xlZnRfdmFsdWUiOi05MC4wLCJ5YXdfbWluX21heCI6ZmFsc2UsInlhd19yaWdodF92YWx1ZSI6OTAuMCwieWF3X3NwZWVkIjoxLjB9LCJvdmVycmlkZSI6dHJ1ZSwieWF3IjoiZGVmYXVsdCIsInlhd19iYXNlIjoxLjAsInlhd19kZWZhdWx0X3ZhbHVlIjowLjAsInlhd19kZWxheV9lbmFibGUxIjpmYWxzZSwieWF3X2xlZnRfdmFsdWUiOjAuMCwieWF3X21vZGlmaWVyIjoiZGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfdmFsdWUiOjAuMCwieWF3X3JpZ2h0X3ZhbHVlIjowLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19yYW5kb21pemF0aW9uIjowLjAsImJvZHlfeWF3X3ZhbHVlIjowLjAsImJvZHlfeWF3X3ZhbHVlMiI6MC4wLCJ5YXdfZGVsYXlfZW5hYmxlIjoxLjB9LCJ+eWF3X2RlbGF5X2VuYWJsZTEiOnsidGlja3MiOjIuMH19XSx7Im1pc2MiOnsiYWltbG9ncyI6dHJ1ZSwiY2xhbnRhZ19zd2l0Y2giOnRydWUsImNsaWVudHNpZGVfbmlja25hbWUiOmZhbHNlLCJmYWtlbGF0ZW5jeSI6MC4wLCJmYXN0bGFkZGVyIjp0cnVlLCJmcHNfYm9vc3QiOmZhbHNlLCJnYW1lX2ZvY3VzIjpmYWxzZSwia2lsbHNheSI6dHJ1ZSwibXV0ZXJldGFyZHMiOiJEaXNhYmxlZCIsInNoYXJlZF9pY29uX3RvZ2dsZSI6dHJ1ZSwifmFpbWxvZ3MiOnsiaGl0X2NvbG9yIjoiIzczQ0Y0RkZGIiwibWlzc19jb2xvciI6IiNDQzNEM0RGRiIsInNlbGVjdCI6WyJDb25zb2xlIiwiTGVmdCBUb3AiLCJTY3JlZW4iLCJ+Il19LCJ+Y2xpZW50c2lkZV9uaWNrbmFtZSI6eyJuaWNrbmFtZSI6ImkgbG92ZSBzb2xpeCJ9LCJ+Z2FtZV9mb2N1cyI6eyJmbGFza19nYW1lX2ljb24iOmZhbHNlLCJzd2l0Y2hfdG9fZ2FtZSI6ZmFsc2V9LCJ+a2lsbHNheSI6eyJwaHJhc2VfbGlzdCI6MS4wLCJwaHJhc2VzIjoiIiwic3R5bGUiOiJSYW5kb20ifX0sInJhZ2Vib3QiOnsiUmVzb2x2ZXIiOmZhbHNlLCJhZGFwdGl2ZV9zaWxlbnQiOnRydWUsImF1dG9faGlkZV9zaG90cyI6dHJ1ZSwiYXV0b190ZWxlcG9ydCI6ZmFsc2UsImN1c3RvbV9mYWtlZHVjayI6dHJ1ZSwiZmFrZWR1Y2tfZWRnZXlhdyI6dHJ1ZSwiZmFzdGlkZWFsIjpmYWxzZSwiZm9yd2FyZF9mYWtlZHVjayI6ZmFsc2UsImZvcndhcmRhYnVzZXRyYWNrIjp7ImFudGlncyI6ZmFsc2UsImFudGlubCI6ZmFsc2UsImxhZ2NvbXBfYm94IjpmYWxzZX0sImZyZWV6ZXRpbWVfZmFrZWR1Y2siOnRydWUsImhpdGNoYW5jZSI6ZmFsc2UsIm5hZGVfZml4IjpmYWxzZSwicHJlZGljdGlvbiI6ZmFsc2UsInNhZmV0eV90YXNlciI6ZmFsc2UsIn5SZXNvbHZlciI6eyJSZXNvbHZlcmd1bnMiOlsifiJdLCJyZXNvbHZlcnZlcnNpb24iOiJWMSJ9LCJ+YWRhcHRpdmVfc2lsZW50Ijp7ImFkYXB0aXZlX2ZvdiI6NS4wfSwifmF1dG9faGlkZV9zaG90cyI6eyJzdGF0ZXMiOlsiU3RhbmQiLCJTbG93d2FsayIsIkR1Y2siLCJEdWNrIG1vdmUiLCJ+Il0sIndlYXBvbnMiOlsiU1NHLTA4IiwifiJdfSwifmF1dG9fdGVsZXBvcnQiOnsiYXV0b190ZWxlcG9ydF9kZWxheSI6MS4wfSwifmN1c3RvbV9mYWtlZHVjayI6eyJzY2FsZSI6MTUwLjB9LCJ+ZmFzdGlkZWFsIjp7InRpbWUiOjEwMC4wLCJ3ZWFwb25zIjpbIn4iXX0sIn5oaXRjaGFuY2UiOnsiYXV0b19zbmlwZXJzX2Fpcl9hbW91bnQiOjAuMCwiYXV0b19zbmlwZXJzX25vX3Njb3BlX2Ftb3VudCI6MC4wLCJhd3BfYWlyX2Ftb3VudCI6MC4wLCJhd3Bfbm9fc2NvcGVfYW1vdW50IjowLjAsImN1cnJlbnRfd2VhcG9uIjoxLjAsImVuYWJsZV9hdXRvX3NuaXBlcnMiOmZhbHNlLCJlbmFibGVfYXdwIjpmYWxzZSwiZW5hYmxlX3Bpc3RvbHMiOmZhbHNlLCJlbmFibGVfcmV2b2x2ZXIiOmZhbHNlLCJlbmFibGVfc3NnMDgiOmZhbHNlLCJwaXN0b2xzX2Fpcl9hbW91bnQiOjAuMCwicmV2b2x2ZXJfYWlyX2Ftb3VudCI6MC4wLCJzc2cwOF9haXJfYW1vdW50IjowLjAsInNzZzA4X25vX3Njb3BlX2Ftb3VudCI6MC4wfSwifnByZWRpY3Rpb24iOnsicGluZ192YXJpYXRpb24iOiJMb3cgPCA0NSIsInByZWRpY3Rpb25fdHlwZSI6IkRpc2FibGVkIn0sIn5zYWZldHlfdGFzZXIiOnsiZGlzdGFuY2UiOjcwMC4wLCJ3ZWFwb25zIjoxLjB9fSwic2VsZWN0b3IiOjMuMCwidmlzdWFscyI6eyJhbmltYXRlZF9naWYiOmZhbHNlLCJhc3BlY3Rfc3dpdGNoIjp0cnVlLCJoaXRfbWFya2VyIjp0cnVlLCJpbmRpY2F0b3JzX3N3aXRjaCI6dHJ1ZSwia2VlcF9tb2RlbF90cmFuc3BhcmVuY3kiOmZhbHNlLCJsYWdjb21wX2RlYnVnIjp0cnVlLCJtaW5fZGFtYWdlIjp0cnVlLCJwZW5ldHJhdGlvbl9jaXJjbGUiOmZhbHNlLCJzY29wZV9vdmVybGF5Ijp0cnVlLCJzbHhpbmRpY2F0b3IiOnRydWUsInNvbHVzX3VpIjp0cnVlLCJ2aWV3bW9kZWwiOnRydWUsIn5hbmltYXRlZF9naWYiOnsiZ2lmX29mZnNldF94IjoyMDAuMCwiZ2lmX29mZnNldF95IjowLjAsImdpZl9zaXplIjoxNzAuMCwiZ2lmX3VybCI6Imh0dHBzOi8vdXBsb2FkLW9zLWJicy5ob3lvbGFiLmNvbS91cGxvYWQvMjAyMC8wNy8xOS8xMDk2Mjc2LzVkNTU1NzU1NDhhMzBjYTIxZmNkYjUwMjg1YjljNjk0XzY0NjU4MDg5MjkzNDMwNTk3MTMuZ2lmIn0sIn5hc3BlY3Rfc3dpdGNoIjp7ImFzcGVjdF92YWx1ZSI6MTQuMH0sIn5oaXRfbWFya2VyIjp7ImNvbCI6IiNGRkZGRkZGRiJ9LCJ+aW5kaWNhdG9yc19zd2l0Y2giOnsiYWRkcyI6WyJ+Il0sImNvbG9yIjoiI0UwNTQ1NEMxIiwidHlwZWluZGljIjoiTW9kZXJuIn0sIn5rZWVwX21vZGVsX3RyYW5zcGFyZW5jeSI6eyJjdXN0b21pemFibGUxIjo1MC4wfSwifmxhZ2NvbXBfZGVidWciOnsiYm94X2NvbG9yIjoiIzJGNzVEREZGIiwidGV4dF9jb2xvciI6IiNGRjJEMkRGRiJ9LCJ+c2NvcGVfb3ZlcmxheSI6eyJyZW1vdmVfbGluZSI6WyJ+Il0sInNjb3BlX2NvbG9yIjoiI0ZGRkZGRkZGIiwic2NvcGVfZ2FwIjo3LjAsInNjb3BlX3NpemUiOjEwNS4wLCJzY29wZV9zdHlsZSI6IlN0cmFpZ2h0In0sIn5zb2x1c191aSI6eyJhY2NlbnRfY29sb3IiOiIjRTA1NDU0QzEiLCJjdXN0b21fbmFtZSI6ImJlcmtmb2N1czQ0IiwicG9zX3giOjE1MC4wLCJwb3NfeDEiOjI1MC4wLCJwb3NfeSI6MTUwLjAsInBvc195MSI6MjUwLjAsIndpZGdldHMiOlsiV2F0ZXJtYXJrIiwiS2V5YmluZHMiLCJTcGVjdGF0b3IgbGlzdCIsIn4iXX0sIn52aWV3bW9kZWwiOnsiZm92Ijo0Ny4wLCJ2aWV3bW9kZWxfaW5zY29wZSI6dHJ1ZSwieCI6NDUuMCwieSI6MjAuMCwieiI6OS4wfX19XQ=="
t9.menulist = {
	profile = {
		profile = v2.create("\aFFFFFFFF\f<house>", "profile", 1),
		about = v2.create("\aFFFFFFFF\f<house>", "about", 2),
		config_list = v2.create("\aFFFFFFFF\f<house>", "config", 2),
		config_buttons = v2.create("\aFFFFFFFF\f<house>", "config", 2),
		socials = v2.create("\aFFFFFFFF\f<house>", "socials", 2)
	},
	antiaim = {
		enable = v2.create("\aFFFFFFFF\f<user-shield>", "\n\n\n\n\n\n\n", 1),
		hotkeys = v2.create("\aFFFFFFFF\f<user-shield>", "\n\n", 1),
		exploits = v2.create("\aFFFFFFFF\f<user-shield>", "\n\n\n\n\n\n\n\n\n", 1),
		extra = v2.create("\aFFFFFFFF\f<user-shield>", "\n", 1),
		builder = {
			conditions = v2.create("\aFFFFFFFF\f<user-shield>", "\n\n\n\n", 2),
			yaw = v2.create("\aFFFFFFFF\f<user-shield>", "\n\n\n", 2),
			yaw_mod = v2.create("\aFFFFFFFF\f<user-shield>", "\n\n\n\n\n", 2),
			defensive = v2.create("\aFFFFFFFF\f<user-shield>", "\n\n\n\n\n\n", 2)
		}
	},
	others = {
		main = v2.create("\aFFFFFFFF\f<gear>", "Others", 1),
		ragebot = v2.create("\aFFFFFFFF\f<gear>", "Ragebot", 2),
		ragebot2 = v2.create("\aFFFFFFFF\f<gear>", "Extra", 1),
		ragebot3 = v2.create("\aFFFFFFFF\f<gear>", "Fakeduck Addons", 2),
		visuals = v2.create("\aFFFFFFFF\f<gear>", "Visuals", 2),
		misc = v2.create("\aFFFFFFFF\f<gear>", "Misc", 2),
		visuals2 = v2.create("\aFFFFFFFF\f<gear>", "Extra", 1)
	}
}
solix.ServerInfo = {
	discord_key = "",
	Online_Users = 0
}
t9.profile = {
	image = t9.menulist.profile.profile:texture(render.load_image_from_file("nl\\solix\\bottomimage.png")),
	selector = t9.menulist.profile.profile:list("", {
		[1] = "About",
		[2] = "Config"
	}),
	user = t9.menulist.profile.about:label("\v\f<user-secret>\a\r     Welcome back!"),
	user_button = t9.menulist.profile.about:button(" " .. t8.inform.username, nil, true),
	build = t9.menulist.profile.about:label("\v\f<database>\r     \a\rCurrent Build"),
	build_button = t9.menulist.profile.about:button(" " .. t8.inform.build, nil, true),
	update = t9.menulist.profile.about:label("\v\f<calendar-lines-pen>\r    \a\rLast Update  "),
	update_button = t9.menulist.profile.about:button(" " .. t8.inform.update, nil, true),
	show_online_users = t9.menulist.profile.about:label("\v\f<users-line>\r   \a\rOnline User's  Loading...", nil, true),
	join = t9.menulist.profile.socials:label("\v\f<share-from-square>\a\r  Join us"),
	discord_link = t9.menulist.profile.socials:button("\v\f<discord>\a\r  Discord Server", function()
		panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/resolver")
	end, true, "Join to our discord!"),
	getkey = t9.menulist.profile.socials:label("\v\f<share-from-square>\a\r  Link Discord"),
	discord_key = t9.menulist.profile.socials:button("\v\f<discord>\a\r  Copy Key", function()
		GetDiscordKey()
	end, true, "Get discord key!"),
	join3 = t9.menulist.profile.socials:label("\v\f<share-from-square>\a\r  Channels"),
	youtube_link = t9.menulist.profile.socials:button("\v\f<youtube>\a\r  suzune", function()
		panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/@suzunehvh")
	end, true, "Subscribe to my channel!"),
	youtube_link1 = t9.menulist.profile.socials:button("\v\f<youtube>\a\r  frosty", function()
		panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/@solixyy1212")
	end, true, "Subscribe to my channel!"),
	join2 = t9.menulist.profile.socials:label("\v\f<share-from-square>\a\r  Links"),
	style_link = t9.menulist.profile.socials:button("\v\f<code>\a\r Solix Theme", function()
		panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/getitem?c=hCCNSoKgOXY8jBoL-Ru2ODfi5Ss")
	end, true, "Solix Theme for Neverlose"),
	configs_link = t9.menulist.profile.socials:button("\v\f<gears>\a\r  Config", function()
		panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=h5G6nA")
	end, true, "My Main Config for Neverlose"),
	config_list = t9.menulist.profile.config_list:list("", v39.ui_list),
	input = t9.menulist.profile.config_buttons:input("\v\f<pen-to-square>\r  Name"),
	load = t9.menulist.profile.config_buttons:button("\v\f<list-check>\r  Load ", nil, true, "load configuration"),
	import = t9.menulist.profile.config_buttons:button("\v\f<file-import>\r  Import", nil, true, "import configuration"),
	export = t9.menulist.profile.config_buttons:button("\v\f<file-export>\r  Export", nil, true, "export configuration"),
	create = t9.menulist.profile.config_buttons:button("\v\f<layer-plus>\r  Create", nil, true, "create configuration"),
	save = t9.menulist.profile.config_buttons:button("\v\f<floppy-disk>\r  Save", nil, true, "save configuration"),
	delete = t9.menulist.profile.config_buttons:button("\v\f<trash>\r  Delete", nil, true, "delete configuration")
}
t9.others = {
	selector = t9.menulist.others.main:list("", {
		[1] = "Ragebot",
		[2] = "Visuals",
		[3] = "Misc"
	}),
	ragebot = {
		Resolver = t9.menulist.others.ragebot:switch("\226\128\138\v\f<user-plus>\a\r  Ragebot Improvements", false, "The Ragebot Improvements is currently in beta and may reduce FPS.", function(p14)
			return {
				Resolverlabel1 = p14:label("The Ragebot Improvements is currently in beta and may reduce FPS."),
				Resolverlabel2 = p14:label("Version: 0.1\nBuild: EXPERIMENTAL"),
				forceresetresolverdata = p14:button("Force reset resolver data", function()
					force_reset_data()
				end),
				resolverversion = p14:combo("\v•  \r Version", "V1", "V2"),
				Resolverguns = p14:selectable("\v•  \r Resolver boost on", {
					[1] = "Pistols",
					[2] = "AutoSnipers",
					[3] = "AWP",
					[4] = "SSG-08",
					[5] = "Desert Eagle",
					[6] = "Snipers",
					[7] = "Rifles",
					[8] = "SMGs",
					[9] = "Shotguns",
					[10] = "Machineguns",
					[11] = "AK-47",
					[12] = "M4A1/M4A4",
					[13] = "R8 Revolver",
					[14] = "AUG/SG 553",
					[15] = "Taser [BODY RESOLVER]"
				})
			}
		end),
		adaptive_silent = t9.menulist.others.ragebot:switch("\226\128\138\v\f<gun>\r\226\128\138\226\128\138\226\128\138\226\128\138Adaptive Silent", false, function(p15)
			return {
				adaptive_fov = p15:slider("\v\f<arrow-turn-down-right> \r  Fov", 1, 180, 5, 1, "°")
			}
		end),
		auto_hide_shots = t9.menulist.others.ragebot:switch("\226\128\138\v\f<shuffle>\a\r  \226\128\138\226\128\138Auto Hide Shots", false, "Auto Hide Shots in selected state & weapons. use hideshots on Break LC.", function(p16)
			return {
				states = p16:selectable("\v•  \r State", {
					[1] = "Stand",
					[2] = "Move",
					[3] = "Slowwalk",
					[4] = "Duck",
					[5] = "Duck move",
					[6] = "In Air",
					[7] = "Air Crouch"
				}),
				weapons = p16:selectable("\v•  \r Weapons", {
					[1] = "SMG",
					[2] = "Rifles",
					[3] = "Pistols",
					[4] = "SSG-08",
					[5] = "AWP",
					[6] = "Auto Snipers",
					[7] = "Desert Eagle"
				})
			}
		end),
		fastideal = t9.menulist.others.ragebot:switch("\226\128\138\v\f<horse>\r  \226\128\138Faster Ideal Tick", false, function(p17)
			return {
				weapons = p17:selectable("\v•  \r Quick-Switch", "SSG-08", "AWP", "Desert Eagle", "R8 Revolver"),
				time = p17:slider("\v•  \r Weapon Equip", 1, 500, 100, 1, "ms")
			}
		end),
		hitchance = t9.menulist.others.ragebot:switch("\v\f<dice>\a\r \226\128\138\226\128\138Hitchance", false, "Automatically adjusts hitchance based on player state and weapon.", function(p18)
			return {
				current_weapon = p18:list("\n", {
					[1] = "Pistols",
					[2] = "Auto-Snipers",
					[3] = "AWP",
					[4] = "SSG-08",
					[5] = "R8 Revolver"
				}),
				enable_pistols = p18:switch("\v\f<arrow-turn-down-right> \r  Override \vPistols", false),
				pistols_air_amount = p18:slider("\v•  \r In-Air", 0, 100, 0, 1, "%"),
				enable_auto_snipers = p18:switch("\v\f<arrow-turn-down-right> \r  Override \vAuto-Snipers", false),
				auto_snipers_no_scope_amount = p18:slider("\v•  \r No-Scope", 0, 100, 0, 1, "%"),
				auto_snipers_air_amount = p18:slider("\v•  \r In-Air", 0, 100, 0, 1, "%"),
				enable_awp = p18:switch("\v\f<arrow-turn-down-right> \r  Override \vAWP", false),
				awp_no_scope_amount = p18:slider("\v•  \r No-Scope", 0, 100, 0, 1, "%"),
				awp_air_amount = p18:slider("\v•  \r In-Air", 0, 100, 0, 1, "%"),
				enable_ssg08 = p18:switch("\v\f<arrow-turn-down-right> \r  Override \vSSG-08", false),
				ssg08_no_scope_amount = p18:slider("\v•  \r No-Scope", 0, 100, 0, 1, "%"),
				ssg08_air_amount = p18:slider("\v•  \r In-Air", 0, 100, 0, 1, "%"),
				enable_revolver = p18:switch("\v\f<arrow-turn-down-right> \r  Override \vR8 Revolver", false),
				revolver_air_amount = p18:slider("\v•  \r In-Air", 0, 100, 0, 1, "%")
			}
		end),
		freezetime_fakeduck = t9.menulist.others.ragebot3:switch("\226\128\138\v\f<snowflakes>\r\226\128\138\226\128\138\226\128\138FD in Freezetime"),
		custom_fakeduck = t9.menulist.others.ragebot3:switch("\226\128\138\v\f<gauge-circle-plus>  \rCustom FD Speed", false, function(p19)
			return {
				scale = p19:slider("\v\f<arrow-turn-down-right> \r  Scale", 15, 150, 150, nil, function(p20)
					if p20 ~= 15 then
						if p20 ~= 80 then
							if p20 ~= 150 then
								return nil
							end

							return "Fast"
						end

						return "Default"
					end

					return "Slow"
				end)
			}
		end),
		fakeduck_edgeyaw = t9.menulist.others.ragebot3:switch("\226\128\138\v\f<person-walking-arrow-loop-left>\r\226\128\138\226\128\138\226\128\138Edge Yaw on FD"),
		forward_fakeduck = t9.menulist.others.ragebot3:switch("\226\128\138\v\f<person-walking-arrow-right>\r\226\128\138\226\128\138\226\128\138Forward on FD"),
		safety_taser = t9.menulist.others.ragebot2:switch("\226\128\138\v\f<shield>\r\226\128\138\226\128\138\226\128\138\226\128\138\226\128\138Safety Taser", false, "Automatically switches to taser when enemy is close with taser.", function(p21)
			return {
				weapons = p21:list("Item to swap to", {
					[1] = "\226\128\138\226\128\138\v\f<bolt>\r  \226\128\138Taser",
					[2] = "\226\128\138\v\f<gun>\r  Pistol"
				}),
				distance = p21:slider("\226\128\138\v\f<radar>\r  Range", 10, 2500, 700, 1, "units")
			}
		end),
		nade_fix = t9.menulist.others.ragebot2:switch("\226\128\138\v\f<bomb>\r\226\128\138\226\128\138\226\128\138\226\128\138\226\128\138Nade Fix", false, "Disables Double Tap and Hide Shots when holding grenades to prevent throwing issues."),
		auto_teleport = t9.menulist.others.ragebot2:switch("\226\128\138\v\f<transporter>  \r\226\128\138\226\128\138Auto Teleport", false, "\226\128\138\v\f<circle-info>   \226\128\138\rAutomatically teleports when threat is detected.", function(p22)
			return {
				auto_teleport_delay = p22:slider("\v\f<arrow-turn-down-right> \r  Delay", 1, 20, 1)
			}
		end),
		forwardabusetrack = t9.menulist.others.ragebot2:label("\226\128\138\v\f<shield>\a\r   Forwardtrack Abuse", false, " \f<circle-info>    \rNew airlag exploit against skeet/neverlose etc.", function(p23)
			return {
				antigs = p23:switch(" \v\f<transporter>\a\r   Anti GS", false, " \f<circle-info>    \rUse this against skeet/gs"),
				antinl = p23:switch(" \v\f<transporter>\a\r   Anti NL", false, " \f<circle-info>    \rUse this against neverlose/primo etc."),
				lagcomp_box = p23:switch("\226\128\138\226\128\138\v\f<person-rays>\a\r   Lagcomp box", false, " \f<circle-info>    \rOnShot Lagcomp Box")
			}
		end),
		prediction = t9.menulist.others.ragebot:switch(" \v\f<transporter-1>\r  \226\128\138Predict", false, "Advanced prediction system, select the modes depend on your ping and pc.", function(p24)
			return {
				ping_variation = p24:combo("\v\f<arrow-turn-down-right> \r  In-game Ping", {
					[1] = "High > 45",
					[2] = "Low < 45"
				}),
				prediction_type = p24:combo("\nawp setting", {
					[1] = "Disabled",
					[2] = "Low",
					[3] = "Medium",
					[4] = "High",
					[5] = "Ultimate"
				})
			}
		end)
	},
	visuals = {
		aspect_switch = t9.menulist.others.visuals:switch("\226\128\138\v\f<crop>\a\r  \226\128\138 Aspect Ratio", false, "Adjusts your screen's aspect ratio to stretch or compress the game view.", function(p25)
			return {
				aspect_value = p25:slider("\v\f<arrow-turn-down-right> \r  Value", 0, 50, 10, 1, function(p26)
					return string.format("%.1f", p26 / 10)
				end)
			}
		end),
		scope_overlay = t9.menulist.others.visuals:switch("\226\128\138\v\f<circle-dot>\r   \226\128\138\a\rScope Overlay", false, "Customizes the scope overlay when zoomed in.", function(p27)
			return {
				scope_style = p27:combo("\v•  \r Select Style", {
					[1] = "Straight",
					[2] = "Reversed"
				}),
				remove_line = p27:selectable("\v•  \r Exclude Line", {
					[1] = "Left",
					[2] = "Right",
					[3] = "Top",
					[4] = "Bottom"
				}),
				scope_gap = p27:slider("\v•  \r Scope Gap", 0, 500, 7),
				scope_size = p27:slider("\v•  \r Scope Size", 0, 1000, 105),
				scope_color = p27:color_picker("\v•  \r Scope Color", color(255, 255, 255))
			}
		end),
		viewmodel = t9.menulist.others.visuals:switch("\226\128\138\v\f<hand>\a\r   \226\128\138Viewmodel", false, "Adjusts the viewmodel position and field of view.", function(p28)
			return {
				fov = p28:slider("\v•  \r Viewmodel FOV", 0, 120, 68),
				x = p28:slider("\v•  \r X offset", -200, 200, 25, 0.1),
				y = p28:slider("\v•  \r Y offset", -200, 200, 20, 0.1),
				z = p28:slider("\v•  \r Z offset", -200, 200, -20, 0.1),
				viewmodel_inscope = p28:switch("\v\f<arrow-turn-down-right> \r  Viewmodel in scope", false)
			}
		end),
		slxindicator = t9.menulist.others.visuals2:switch("\v\f<bars-progress>\r    Modern Indicators"),
		penetration_circle = t9.menulist.others.visuals2:switch("\v\f<circle-dot>\a\r   \226\128\138\226\128\138Penetration Circle", false, "Displays a circle indicating bullet penetration potential."),
		min_damage = t9.menulist.others.visuals:switch("\226\128\138\v\f<burst>\a\r   \226\128\138Damage Indicator", false, "Displays the minimum damage value on screen."),
		indicators_switch = t9.menulist.others.visuals:switch("\226\128\138\v\f<rectangle-history>\a\r  \226\128\138\226\128\138Crosshair Indicators", false, "Displays visual crosshair cues for anti-aim status, desync status and keybinds.", function(p29)
			return {
				adds = p29:selectable("\v•  \r Indicator Adds", {
					[1] = "Desync bar",
					[2] = "Fade on scope"
				}),
				typeindic = p29:combo("\v•  \r Type", {
					[1] = "Modern",
					[2] = "Pixel"
				}),
				color = p29:color_picker("\v•  \r Indicator Accent", color(161, 129, 181, 193))
			}
		end),
		solus_ui = t9.menulist.others.visuals:switch(" \v\f<window-maximize>\a\r  \226\128\138\226\128\138Solus UI", false, "Modern UI elements including watermark, keybinds, and spectator list.", function(p30)
			return {
				widgets = p30:selectable("\v•  \r Widgets", {
					[1] = "Watermark",
					[2] = "Keybinds",
					[3] = "Spectator list"
				}),
				custom_name = p30:input("\v•  \r Username", "" .. common.get_username() .. ""),
				accent_color = p30:color_picker("\v•  \r Accent color", color(161, 129, 181, 193)),
				pos_x = p30:slider("Keybinds X", 0, render.screen_size().x, 150),
				pos_y = p30:slider("Keybinds Y", 0, render.screen_size().y, 150),
				pos_x1 = p30:slider("Spectator X", 0, render.screen_size().x, 250),
				pos_y1 = p30:slider("Spectator Y", 0, render.screen_size().y, 250)
			}
		end),
		hit_marker = t9.menulist.others.visuals2:switch("\v\f<bullseye-arrow>\r  \226\128\138\226\128\138\226\128\138Hit Marker", false, "Shows a hit marker when you hit an enemy.", function(p31)
			return {
				col = p31:color_picker("\v\f<arrow-turn-down-right> \r  Color", color(255, 255, 255, 255))
			}
		end),
		keep_model_transparency = t9.menulist.others.visuals:switch(" \226\128\138\v\f<person-falling>\r   Custom Transparency", false, "Customize the transparency of the model.", function(p32)
			return {
				customizable1 = p32:slider("\v\f<arrow-turn-down-right> \r  Transparency", 0, 150, 50)
			}
		end),
		animated_gif = t9.menulist.others.visuals:switch("\226\128\138\226\128\138\v\f<image>\r  \226\128\138\226\128\138Animated GIF", false, "Displays an animated GIF above your player.", function(p33)
			return {
				gif_url = p33:input("\v\f<arrow-turn-down-right> \r  GIF URL", "https://upload-os-bbs.hoyolab.com/upload/2020/07/19/1096276/5d55575548a30ca21fcdb50285b9c694_6465808929343059713.gif"),
				gif_size = p33:slider("\v•  \r Size", 50, 500, 170, 1, function(p34)
					return string.format("%.0f", p34)
				end),
				gif_offset_x = p33:slider("\v•  \r X Offset", -200, 200, 200, 1, function(p35)
					return string.format("%.0f", p35)
				end),
				gif_offset_y = p33:slider("\v•  \r Y Offset", -200, 200, 0, 1, function(p36)
					return string.format("%.0f", p36)
				end)
			}
		end),
		lagcomp_debug = t9.menulist.others.visuals:switch("\226\128\138\v\f<box-open>\r  \226\128\138LC Predict", false, "Displays a box that will show where the enemy will teleport.", function(p37)
			return {
				box_color = p37:color_picker("\v•  \r Box Color", color(47, 117, 221, 255)),
				text_color = p37:color_picker("\v•  \r Text Color", color(255, 45, 45, 255))
			}
		end)
	},
	misc = {
		muteretards = t9.menulist.others.misc:combo("\v\f<microphone-slash>\a\r\226\128\138\226\128\138\226\128\138\226\128\138\226\128\138Auto Mute", {
			[1] = "Disabled",
			[2] = "Mute",
			[3] = "Unmute"
		}),
		killsay = t9.menulist.others.misc:switch("\226\128\138\226\128\138\v\f<trash>\a\r \226\128\138\226\128\138\226\128\138\226\128\138\226\128\138Killsay", false, "Automatically sends custom messages when you kill an enemy.", function(p38)
			return {
				phrases = p38:input("\v\f<arrow-turn-down-right> \r  Text", ""),
				style = p38:combo("\v\f<arrow-turn-down-right> \r  Style", "Random", "Sequence"),
				add_phrase = p38:button("Add Phrase"),
				remove_phrase = p38:button("Remove Phrase"),
				refresh_phrases = p38:button("Refresh Phrases"),
				phrase_list = p38:list("\v\f<list>\r  Phrases", {})
			}
		end),
		shared_icon_toggle = t9.menulist.others.misc:switch("\226\128\138\v\f<tower-broadcast>\a\r\226\128\138\226\128\138\226\128\138\226\128\138\226\128\138Shared Icon"),
		fastladder = t9.menulist.others.misc:switch("\226\128\138\226\128\138\v\f<person-running>\a\r\226\128\138\226\128\138\226\128\138\226\128\138\226\128\138\226\128\138Fast Ladder", false, "Enables faster ladder climbing with optimized movement."),
		fps_boost = t9.menulist.others.misc:switch("\226\128\138\226\128\138\v\f<chart-line-up>\r  \226\128\138\226\128\138FPS Boost", false, "Changes some cvars to boost FPS."),
		clantag_switch = t9.menulist.others.misc:switch("\226\128\138\226\128\138\v\f<tags>\a\r\226\128\138\226\128\138\226\128\138\226\128\138\226\128\138Clantag", false, "Enable's clantag."),
		aimlogs = t9.menulist.others.misc:switch("\226\128\138\226\128\138\v\f<clipboard-list>|\a\r\226\128\138\226\128\138\226\128\138\226\128\138\226\128\138\226\128\138Logs", false, function(p39)
			return {
				select = p39:selectable("\v•  \r Select", "Console", "Left Top", "Screen"),
				hit_color = p39:color_picker("\v•  \r Hit Color", color("73CF4FFF")),
				miss_color = p39:color_picker("\v•  \r Miss Color", color("CC3D3DFF"))
			}
		end),
		clientside_nickname = t9.menulist.others.misc:switch("\226\128\138\226\128\138\v\f<share-nodes>\r \226\128\138\226\128\138\226\128\138\226\128\138\226\128\138Clientside Nickname", false, function(p40)
			return {
				nickname = p40:input("\v\f<arrow-turn-down-right> \r  Nickname", "i love solix")
			}
		end),
		game_focus = t9.menulist.others.misc:switch("\226\128\138\v\f<sword>    \rGame focus", false, "Automatically switch to game and flash game icon on round start.", function(p41)
			return {
				switch_to_game = p41:switch("\v\f<window>    \rSwitch to game", false),
				flask_game_icon = p41:switch("\v\f<lightbulb-on>   \rFlash game icon", false)
			}
		end),
		fakelatency = t9.menulist.others.misc:slider("\226\128\138\226\128\138\v\f<satellite-dish>\a\r  \226\128\138\226\128\138\226\128\138Ping Unlocker", 0, 200, 0, 1, function(p42)
			if p42 ~= 0 then
				return
			end

			return "Off"
		end)
	}
}
t9.others.ragebot.Resolver:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
})
t9.others.ragebot.Resolver.Resolverlabel1:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.Resolver)
t9.others.ragebot.Resolver.Resolverlabel2:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.Resolver)
t9.others.ragebot.Resolver.forceresetresolverdata:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.Resolver)
t9.others.ragebot.Resolver.resolverversion:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.Resolver)
t9.others.ragebot.Resolver.Resolverguns:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.Resolver)
t9.others.ragebot.auto_hide_shots:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
})
t9.others.ragebot.auto_hide_shots.states:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.auto_hide_shots)
t9.others.ragebot.auto_hide_shots.weapons:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.auto_hide_shots)
t9.others.ragebot.auto_teleport:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
})
t9.others.ragebot.auto_teleport.auto_teleport_delay:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.auto_teleport)
t9.others.ragebot.fastideal:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
})
t9.others.ragebot.fastideal.weapons:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.fastideal)
t9.others.ragebot.fastideal.time:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.fastideal)
t9.others.ragebot.hitchance:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
})
t9.others.ragebot.hitchance.current_weapon:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.hitchance)
t9.others.ragebot.hitchance.enable_pistols:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.hitchance, {
	[1] = nil,
	[2] = 1,
	[1] = t9.others.ragebot.hitchance.current_weapon
})
t9.others.ragebot.hitchance.enable_auto_snipers:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.hitchance, {
	[1] = nil,
	[2] = 2,
	[1] = t9.others.ragebot.hitchance.current_weapon
})
t9.others.ragebot.hitchance.enable_awp:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.hitchance, {
	[1] = nil,
	[2] = 3,
	[1] = t9.others.ragebot.hitchance.current_weapon
})
t9.others.ragebot.hitchance.enable_ssg08:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.hitchance, {
	[1] = nil,
	[2] = 4,
	[1] = t9.others.ragebot.hitchance.current_weapon
})
t9.others.ragebot.hitchance.enable_revolver:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.hitchance, {
	[1] = nil,
	[2] = 5,
	[1] = t9.others.ragebot.hitchance.current_weapon
})
t9.others.ragebot.hitchance.pistols_air_amount:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.hitchance, {
	[1] = nil,
	[2] = 1,
	[1] = t9.others.ragebot.hitchance.current_weapon
}, t9.others.ragebot.hitchance.enable_pistols)
t9.others.ragebot.hitchance.auto_snipers_air_amount:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.hitchance, {
	[1] = nil,
	[2] = 2,
	[1] = t9.others.ragebot.hitchance.current_weapon
}, t9.others.ragebot.hitchance.enable_auto_snipers)
t9.others.ragebot.hitchance.auto_snipers_no_scope_amount:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.hitchance, {
	[1] = nil,
	[2] = 2,
	[1] = t9.others.ragebot.hitchance.current_weapon
}, t9.others.ragebot.hitchance.enable_auto_snipers)
t9.others.ragebot.hitchance.awp_air_amount:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.hitchance, {
	[1] = nil,
	[2] = 3,
	[1] = t9.others.ragebot.hitchance.current_weapon
}, t9.others.ragebot.hitchance.enable_awp)
t9.others.ragebot.hitchance.awp_no_scope_amount:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.hitchance, {
	[1] = nil,
	[2] = 3,
	[1] = t9.others.ragebot.hitchance.current_weapon
}, t9.others.ragebot.hitchance.enable_awp)
t9.others.ragebot.hitchance.ssg08_air_amount:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.hitchance, {
	[1] = nil,
	[2] = 4,
	[1] = t9.others.ragebot.hitchance.current_weapon
}, t9.others.ragebot.hitchance.enable_ssg08)
t9.others.ragebot.hitchance.ssg08_no_scope_amount:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.hitchance, {
	[1] = nil,
	[2] = 4,
	[1] = t9.others.ragebot.hitchance.current_weapon
}, t9.others.ragebot.hitchance.enable_ssg08)
t9.others.ragebot.hitchance.revolver_air_amount:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.hitchance, {
	[1] = nil,
	[2] = 5,
	[1] = t9.others.ragebot.hitchance.current_weapon
}, t9.others.ragebot.hitchance.enable_revolver)
t9.others.ragebot.adaptive_silent:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
})
t9.others.ragebot.adaptive_silent.adaptive_fov:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.adaptive_silent)
t9.others.ragebot.freezetime_fakeduck:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
})
t9.others.ragebot.custom_fakeduck:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
})
t9.others.ragebot.custom_fakeduck.scale:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.custom_fakeduck)
t9.others.ragebot.fakeduck_edgeyaw:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
})
t9.others.ragebot.forward_fakeduck:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
})
t9.others.ragebot.safety_taser:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
})
t9.others.ragebot.safety_taser.weapons:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.safety_taser)
t9.others.ragebot.safety_taser.distance:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.safety_taser)
t9.others.ragebot.nade_fix:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
})
t9.others.ragebot.forwardabusetrack:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
})
t9.others.ragebot.prediction:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
})
t9.others.ragebot.prediction.ping_variation:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.prediction)
t9.others.ragebot.prediction.prediction_type:depend({
	[1] = nil,
	[2] = 1,
	[1] = t9.others.selector
}, t9.others.ragebot.prediction)
t9.others.visuals.aspect_switch:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
})
t9.others.visuals.aspect_switch.aspect_value:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.aspect_switch)
t9.others.visuals.min_damage:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
})
t9.others.visuals.scope_overlay:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
})
t9.others.visuals.scope_overlay.scope_style:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.scope_overlay)
t9.others.visuals.scope_overlay.remove_line:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.scope_overlay)
t9.others.visuals.scope_overlay.scope_gap:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.scope_overlay)
t9.others.visuals.scope_overlay.scope_size:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.scope_overlay)
t9.others.visuals.scope_overlay.scope_color:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.scope_overlay)
t9.others.visuals.viewmodel:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
})
t9.others.visuals.viewmodel.fov:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.viewmodel)
t9.others.visuals.viewmodel.x:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.viewmodel)
t9.others.visuals.viewmodel.y:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.viewmodel)
t9.others.visuals.viewmodel.z:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.viewmodel)
t9.others.visuals.viewmodel.viewmodel_inscope:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.viewmodel)
t9.others.visuals.penetration_circle:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
})
t9.others.visuals.indicators_switch:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
})
t9.others.visuals.indicators_switch.adds:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.indicators_switch)
t9.others.visuals.indicators_switch.typeindic:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.indicators_switch)
t9.others.visuals.indicators_switch.color:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.indicators_switch)
t9.others.visuals.slxindicator:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
})
t9.others.visuals.keep_model_transparency:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
})
t9.others.visuals.keep_model_transparency.customizable1:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.keep_model_transparency)
t9.others.visuals.solus_ui:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
})
t9.others.visuals.solus_ui.widgets:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.solus_ui)
t9.others.visuals.solus_ui.custom_name:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.solus_ui)
t9.others.visuals.solus_ui.accent_color:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.solus_ui)
t9.others.visuals.solus_ui.pos_x:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.solus_ui)
t9.others.visuals.solus_ui.pos_y:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.solus_ui)
t9.others.visuals.solus_ui.pos_x1:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.solus_ui)
t9.others.visuals.solus_ui.pos_y1:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.solus_ui)
t9.others.visuals.hit_marker:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
})
t9.others.visuals.hit_marker.col:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.hit_marker)
t9.others.visuals.animated_gif:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
})
t9.others.visuals.animated_gif.gif_url:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.animated_gif)
t9.others.visuals.animated_gif.gif_size:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.animated_gif)
t9.others.visuals.animated_gif.gif_offset_x:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.animated_gif)
t9.others.visuals.animated_gif.gif_offset_y:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.animated_gif)
t9.others.visuals.lagcomp_debug:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
})
t9.others.visuals.lagcomp_debug.box_color:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.lagcomp_debug)
t9.others.visuals.lagcomp_debug.text_color:depend({
	[1] = nil,
	[2] = 2,
	[1] = t9.others.selector
}, t9.others.visuals.lagcomp_debug)
t9.others.misc.muteretards:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
})
t9.others.misc.shared_icon_toggle:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
})
t9.others.misc.fastladder:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
})
t9.others.misc.fps_boost:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
})
t9.others.misc.clantag_switch:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
})
t9.others.misc.aimlogs:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
})
t9.others.misc.aimlogs.select:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
}, t9.others.misc.aimlogs)
t9.others.misc.aimlogs.hit_color:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
}, t9.others.misc.aimlogs)
t9.others.misc.aimlogs.miss_color:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
}, t9.others.misc.aimlogs)
t9.others.misc.clientside_nickname:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
})
t9.others.misc.clientside_nickname.nickname:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
}, t9.others.misc.clientside_nickname)
t9.others.misc.game_focus:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
})
t9.others.misc.game_focus.switch_to_game:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
}, t9.others.misc.game_focus)
t9.others.misc.game_focus.flask_game_icon:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
}, t9.others.misc.game_focus)
t9.others.misc.fakelatency:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
})
t9.others.misc.killsay:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
})
t9.others.misc.killsay.phrases:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
}, t9.others.misc.killsay)
t9.others.misc.killsay.style:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
}, t9.others.misc.killsay)
t9.others.misc.killsay.add_phrase:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
}, t9.others.misc.killsay)
t9.others.misc.killsay.remove_phrase:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
}, t9.others.misc.killsay)
t9.others.misc.killsay.refresh_phrases:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
}, t9.others.misc.killsay)
t9.others.misc.killsay.phrase_list:depend({
	[1] = nil,
	[2] = 3,
	[1] = t9.others.selector
}, t9.others.misc.killsay)
t9.others.visuals.indicators_switch.typeindic:set_callback(function()
	-- upvalues: t9 (copy)
	t9.others.visuals.indicators_switch.adds:visibility(t9.others.visuals.indicators_switch.typeindic:get() == "Pixel")
end)
t9.others.visuals.indicators_switch.adds:visibility(t9.others.visuals.indicators_switch.typeindic:get() == "Pixel")
require("neverlose/gradient")
entity.get_local_player()

local sv_maxusrcmdprocessticks = cvar.sv_maxusrcmdprocessticks
local u41 = false
local n5 = 0
local n6 = 8
local n7 = 8
local n8 = 30
local n9 = 1
local n10 = 3
local n11 = 4096
local t10 = {}
local t11 = {}

local function v51(p43)
	if not (p43 < 0) then
		if not (p43 > 1) then
			return p43
		end

		return 1
	end

	return 0
end
local function v52(p44, p45, p46, p47, p48)
	local t12 = {
		vector(p44.x - p45, p44.y - p46, p44.z - p47),
		vector(p44.x + p45, p44.y - p46, p44.z - p47),
		vector(p44.x + p45, p44.y + p46, p44.z - p47),
		vector(p44.x - p45, p44.y + p46, p44.z - p47),
		vector(p44.x - p45, p44.y - p46, p44.z + p47),
		vector(p44.x + p45, p44.y - p46, p44.z + p47),
		vector(p44.x + p45, p44.y + p46, p44.z + p47),
		vector(p44.x - p45, p44.y + p46, p44.z + p47)
	}
	local t13 = {
		[1] = {
			[1] = 1,
			[2] = 2
		},
		[2] = {
			[1] = 2,
			[2] = 3
		},
		[3] = {
			[1] = 3,
			[2] = 4
		},
		[4] = {
			[1] = 4,
			[2] = 1
		},
		[5] = {
			[1] = 5,
			[2] = 6
		},
		[6] = {
			[1] = 6,
			[2] = 7
		},
		[7] = {
			[1] = 7,
			[2] = 8
		},
		[8] = {
			[1] = 8,
			[2] = 5
		},
		[9] = {
			[1] = 1,
			[2] = 5
		},
		[10] = {
			[1] = 2,
			[2] = 6
		},
		[11] = {
			[1] = 3,
			[2] = 7
		},
		[12] = {
			[1] = 4,
			[2] = 8
		}
	}

	for _, v in ipairs(t13) do
		local v235 = render.world_to_screen(t12[v[1]])
		local v236 = render.world_to_screen(t12[v[2]])

		if v235 and v236 then
			render.line(v235, v236, color(150, 150, 150, p48))
		end
	end
end
local function v53(p49)
	-- upvalues: t9 (copy), sv_maxusrcmdprocessticks (copy), u41 (ref), n5 (ref)
	if not t9.others.ragebot.forwardabusetrack.antigs:get() or t9.others.ragebot.forwardabusetrack.antinl:get() or not p49.in_jump then
		ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):override()
		ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override()
		ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override()
		ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"):override()
		ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override()
		ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"):override()
		ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"):override(true)
		ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):override()
	else
		ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("On Peek")
		ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):override(1)
		ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(0)
		ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override(true)
		ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"):override(false)
		ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override(1)
		ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"):override(0)
		ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"):override(false)

		if not entity.get_local_player() then
			return
		end

		sv_maxusrcmdprocessticks:int(19)

		if p49.in_jump then
			if globals.tickcount % 4 ~= 0 then
				ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"):override(false)
				rage.exploit:allow_charge(true)
				rage.exploit:force_charge()
				p49.force_defensive = true
				u41 = true
				n5 = globals.tickcount + 2
			else
				rage.exploit:force_teleport()
				ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"):override(true)
				rage.exploit:allow_charge(false)
				p49.force_defensive = false
				u41 = false
			end
		end
	end
end
local function v54(p50)
	-- upvalues: t9 (copy), sv_maxusrcmdprocessticks (copy), n5 (ref)
	if t9.others.ragebot.forwardabusetrack.antinl:get() and not t9.others.ragebot.forwardabusetrack.antigs:get() then
		ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(0)
		p50.force_defensive = false
		ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("On Peek")
		ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):override(17)
		ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(0)
		ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override(true)
		ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"):override(false)
		ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override(1)
		ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"):override(0)
		ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"):override(false)

		if not entity.get_local_player() then
			return
		end

		if not p50.in_jump then
			ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):override()
		elseif globals.tickcount % 2 ~= 1 then
			sv_maxusrcmdprocessticks:int(19)
			ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):override(false)
			n5 = globals.tickcount + 2
		else
			sv_maxusrcmdprocessticks:int(16)
			ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):override(true)
		end
	end
end

events.bullet_fire:set(function(p51)
	-- upvalues: t9 (copy), t10 (copy)
	if t9.others.ragebot.forwardabusetrack.lagcomp_box:get() then
		local v241 = entity.get_local_player()

		if v241 then
			local entity2 = p51.entity

			if entity2 and entity2 ~= v241 and entity2:is_enemy() then
				local v243 = entity2:get_eye_position() or (entity2:get_origin() or p51.origin)

				if v243 then
					t10[entity2:get_index()] = {
						best_dist = 0,
						eye = vector(v243.x, v243.y, v243.z),
						expire = globals.realtime + 0.12
					}

					return
				end

				return
			end

			return
		end

		return
	end
end)
events.bullet_impact:set(function(p52)
	-- upvalues: t9 (copy), t10 (copy)
	if t9.others.ragebot.forwardabusetrack.lagcomp_box:get() then
		local v245 = entity.get_local_player()

		if v245 then
			local v246 = entity.get(p52.userid, true)

			if v246 and v246 ~= v245 and v246:is_enemy() then
				local v247 = v246:get_index()
				local v248 = t10[v247]

				if not v248 then
					local v249 = v246:get_eye_position() or v246:get_origin()

					if not v249 then
						return
					end

					v248 = {
						best_dist = 0,
						eye = vector(v249.x, v249.y, v249.z),
						expire = globals.realtime + 0.1
					}
					t10[v247] = v248
				end

				local v250 = vector(p52.x or 0, p52.y or 0, p52.z or 0)
				local v251 = v250.x - v248.eye.x
				local v252 = v250.y - v248.eye.y
				local v253 = v250.z - v248.eye.z
				local v254 = math.sqrt(v251 * v251 + v252 * v252 + v253 * v253)

				if v254 >= (v248.best_dist or 0) then
					v248.best_dist = v254
					v248.best = v250
				end

				v248.expire = globals.realtime + 0.06

				return
			end

			return
		end

		return
	end
end)

local function v55(p53)
	-- upvalues: t10 (copy), v51 (copy), n11 (copy), t11 (copy), n10 (copy)
	local v256 = t10[p53]

	if v256 and v256.best then
		local v257 = entity.get_local_player()

		if v257 then
			local v258 = v257.m_vecOrigin or v257:get_origin()
			local v259 = v257.m_vecVelocity or vector(0, 0, 0)
			local v260 = vector(v256.best.x - v256.eye.x, v256.best.y - v256.eye.y, v256.best.z - v256.eye.z)
			local v261 = v260.x * v260.x + v260.y * v260.y + v260.z * v260.z
			local best = v256.best

			if v261 > 1E-06 then
				local v263 = vector(v258.x - v256.eye.x, v258.y - v256.eye.y, v258.z - v256.eye.z)
				local v264 = (v263.x * v260.x + v263.y * v260.y + v263.z * v260.z) / v261
				local v265 = v51(v264)

				best = vector(v256.eye.x + v260.x * v265, v256.eye.y + v260.y * v265, v256.eye.z + v260.z * v265)
			end

			local v266 = best.x - v258.x
			local v267 = best.y - v258.y
			local v268 = best.z - v258.z

			if not (v266 * v266 + v267 * v267 + v268 * v268 > n11 * n11) then
				local x2 = v259.x
				local y3 = v259.y
				local v271 = math.sqrt(x2 * x2 + y3 * y3)
				local n12 = 0

				if v271 > 1E-06 then
					local v273 = x2 / v271
					local v274 = y3 / v271
					local v275 = best.x - v258.x
					local v276 = best.y - v258.y

					n12 = (v275 * v273 + v276 * v274) / v271 * 2.2
				end

				if not (n12 > 2) then
					t11[#t11 + 1] = {
						t = globals.realtime,
						center = best,
						secs = n12
					}

					if #t11 > n10 then
						table.remove(t11, 1)
					end

					t10[p53] = nil

					return
				end

				t10[p53] = nil

				return
			end

			t10[p53] = nil

			return
		end

		t10[p53] = nil

		return
	end
end

events.render:set(function()
	-- upvalues: t9 (copy), t10 (copy), v55 (copy), t11 (copy), n9 (copy), v52 (copy), n6 (copy), n7 (copy), n8 (copy)
	if not t9.others.ragebot.forwardabusetrack.lagcomp_box:get() then
		return
	end

	local realtime3 = globals.realtime

	for k, v in pairs(t10) do
		if realtime3 >= v.expire then
			v55(k)
		end
	end

	if t11[1] then
		for i = #t11, 1, -1 do
			local v281 = t11[i]
			local v282 = realtime3 - v281.t

			if not (v282 > n9) then
				local v283 = math.floor(255 * (1 - v282 / n9) + 0.5)

				v52(v281.center, n6, n7, n8, math.min(v283, 220))

				local v284 = render.world_to_screen(v281.center)

				if v284 then
					local v285 = string.format("%.2fs", v281.secs or 0)

					render.text(4, v284 + vector(0, -14, 0), color(0, 0, 0, v283), "c", v285)
					render.text(4, v284 + vector(0, -15, 0), color(255, 255, 255, v283), "c", v285)
				end
			else
				table.remove(t11, i)
			end
		end

		return
	end
end)
events.createmove:set(function(p54)
	-- upvalues: v53 (copy), v54 (copy), t9 (copy), sv_maxusrcmdprocessticks (copy)
	v53(p54)
	v54(p54)

	if not t9.others.ragebot.forwardabusetrack.antigs:get() and not t9.others.ragebot.forwardabusetrack.antinl:get() then
		sv_maxusrcmdprocessticks:int(16)
		ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):override()
		ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override()
		ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):override()
		ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):override()
		ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override()
		ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override()
		ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override()
		ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"):override()
		ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override()
		ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"):override()
		ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"):override()
	end
end)

local function v56()
	local v286 = entity.get_local_player()

	if v286 and v286:is_alive() then
		local huge = math.huge
		local v288 = nil
		local v289 = v286:get_origin()

		for _, v in ipairs(entity.get_players(true)) do
			if v:is_alive() and v:is_enemy() then
				local v292 = v289:dist(v:get_origin())

				if v292 < huge then
					huge = v292
					v288 = v
				end
			end
		end

		return v288
	end

	return nil
end
local function v57()
	-- upvalues: t9 (copy), v56 (copy)
	if t9.others.ragebot.safety_taser:get() then
		if v56() and entity.get_local_player() then
			local v293 = entity.get_local_player():get_origin()

			if not (v56():get_hitbox_position(1):dist(v293) < t9.others.ragebot.safety_taser.distance:get()) or not v56():is_alive() then
				alreadypulledtaser = 0
			else
				if v56():get_player_weapon() == nil then
					return
				end

				if v56():get_player_weapon():get_weapon_info().weapon_name == "weapon_taser" then
					render.text(1, vector(render.screen_size().x / 2, render.screen_size().y / 2 + 30), color(255, 255, 255, 255), "c", v56():get_name() .. " Safety Triggered")
					alreadypulledtaser = alreadypulledtaser + 1

					if alreadypulledtaser > 1 then
						return
					end

					if t9.others.ragebot.safety_taser.weapons:get() ~= 1 then
						if t9.others.ragebot.safety_taser.weapons:get() == 2 then
							utils.console_exec("slot2")
						end
					else
						utils.console_exec("use weapon_taser")
					end
				end
			end

			return
		end

		alreadypulledtaser = 0

		return
	end

	alreadypulledtaser = 0
end

events.createmove:set(function()
	-- upvalues: v57 (copy)
	v57()
end)

local function v58()
	-- upvalues: t9 (copy), t7 (copy)
	if t9.others.ragebot.nade_fix:get() then
		local v294 = entity.get_local_player()

		if v294 and v294:is_alive() then
			local v295 = v294:get_player_weapon()

			if v295 then
				local weapon_name = v295:get_weapon_info().weapon_name

				if weapon_name ~= "weapon_smokegrenade" and weapon_name ~= "weapon_hegrenade" and weapon_name ~= "weapon_flashgrenade" and weapon_name ~= "weapon_incgrenade" and weapon_name ~= "weapon_molotov" then
					t7.dt:override()
					t7.hs:override()
				else
					t7.dt:override(false)
					t7.hs:override(false)
				end

				return
			end

			return
		end

		return
	end
end

events.createmove:set(function()
	-- upvalues: v58 (copy)
	v58()
end);
({
	fakeduck_ref = v2.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
	createmove_run = function(p55, p56)
		-- upvalues: t9 (copy)
		if p55.fakeduck_ref:get() then
			local v299 = entity.get_local_player()

			if v299 and v299:is_alive() then
				local m_vecVelocity = v299.m_vecVelocity

				if not (math.abs(m_vecVelocity.y) <= 10) or math.abs(m_vecVelocity.x) > 10 then
					local v301 = vector(p56.forwardmove, p56.sidemove)

					if v301:length() > 0 then
						v301:normalize()

						local v302 = t9.others.ragebot.custom_fakeduck.scale:get()

						p56.forwardmove = v301.x * v302
						p56.sidemove = v301.y * v302
					end
				end

				return
			end

			return
		end
	end,
	init = function(p57)
		-- upvalues: t9 (copy)
		local function v304(p58)
			-- upvalues: p57 (copy)
			p57:createmove_run(p58)
		end

		t9.others.ragebot.custom_fakeduck:set_callback(function(p59)
			-- upvalues: v304 (copy)
			if not p59:get() then
				events.createmove_run(v304, false)
			else
				events.createmove_run(v304)
			end
		end, true)
	end
}):init();
({
	hurt_time = 0,
	render = function(p60)
		-- upvalues: t9 (copy)
		if globals.is_in_game and not (p60.hurt_time <= 0) then
			local n13 = 1

			if p60.hurt_time < 0.25 then
				n13 = p60.hurt_time / 0.25
			end

			local v307 = t9.others.visuals.hit_marker.col:get()
			local v308 = render.screen_size() * 0.5

			v307.a = v307.a * n13
			render.line(vector(v308.x - 10, v308.y - 10), vector(v308.x - 5, v308.y - 5), v307)
			render.line(vector(v308.x + 10, v308.y - 10), vector(v308.x + 5, v308.y - 5), v307)
			render.line(vector(v308.x + 10, v308.y + 10), vector(v308.x + 5, v308.y + 5), v307)
			render.line(vector(v308.x - 10, v308.y + 10), vector(v308.x - 5, v308.y + 5), v307)
			p60.hurt_time = math.max(p60.hurt_time - globals.frametime, 0)

			return
		end
	end,
	player_hurt = function(p61, p62)
		local v311 = entity.get_local_player()
		local v312 = entity.get(p62.userid, true)
		local v313 = entity.get(p62.attacker, true)

		if v312 ~= v311 and v313 == v311 then
			p61.hurt_time = 0.5

			return
		end
	end,
	setup = function(p63)
		-- upvalues: t9 (copy)
		local function v315()
			-- upvalues: p63 (copy)
			p63:render()
		end
		local function v316(p64)
			-- upvalues: p63 (copy)
			p63:player_hurt(p64)
		end

		t9.others.visuals.hit_marker:set_callback(function(p65)
			-- upvalues: p63 (copy), v315 (copy), v316 (copy)
			local v980 = p65:get()

			if not v980 then
				p63.hurt_time = 0
			end

			events.render(v315, v980)
			events.player_hurt(v316, v980)
		end, true)
	end
}):setup()

local u59 = false

local function v60()
	-- upvalues: t9 (copy), t7 (copy)
	local v317 = entity.get_local_player()

	if v317 and v317:is_alive() then
		local v318 = render.camera_position()
		local v319 = render.camera_angles()
		local v320 = vector():angles(v319)
		local huge = math.huge

		for _, v in ipairs(entity.get_players(true)) do
			local v324 = v:get_hitbox_position(1):dist_to_ray(v318, v320)

			if v324 < huge then
				huge = v324
			end
		end

		if huge ~= math.huge and not (huge > t9.others.ragebot.adaptive_silent.adaptive_fov:get() * 10) then
			t7.silent_aim:override(false)

			return
		end

		t7.silent_aim:override()

		return
	end
end

t9.others.ragebot.adaptive_silent:set_callback(function(p66)
	-- upvalues: u59 (ref), v60 (copy), t7 (copy)
	local v326 = p66:get()

	if not v326 or u59 then
		if not v326 and u59 then
			u59 = false
			events.render(v60, false)
			t7.silent_aim:override()
		end
	else
		u59 = true
		events.render(v60, true)
	end
end, true);
({
	current_tick = 0,
	ref_hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
	ref_double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
	ref_fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
	update_current_tick = function(p67)
		if p67.current_tick >= 14 then
			p67.current_tick = 0
		end

		p67.current_tick = p67.current_tick + 1
	end,
	shutdown = function(p68)
		if p68.ref_hide_shots then
			p68.ref_hide_shots:override()
		end

		if p68.ref_double_tap then
			p68.ref_double_tap:override()
		end
	end,
	createmove = function(p69, p70)
		-- upvalues: t9 (copy)
		local v331 = t9.others.ragebot.freezetime_fakeduck:get()
		local v332 = p69.ref_fake_duck:get()
		local v333 = entity.get_game_rules and entity.get_game_rules() or nil
		local v334 = v333 and v333.m_bFreezePeriod

		if not v331 or (not v332 or not v334) then
			if p69._was_active then
				if p69.ref_hide_shots then
					p69.ref_hide_shots:override()
				end

				if p69.ref_double_tap then
					p69.ref_double_tap:override()
				end

				p69._was_active = false
			end
		else
			p69:update_current_tick()
			p70.in_duck = not (p69.current_tick <= 7)
			p70.send_packet = p69.current_tick == 14

			if p69.ref_hide_shots then
				p69.ref_hide_shots:override(false)
			end

			if p69.ref_double_tap then
				p69.ref_double_tap:override(false)
			end

			p69._was_active = true
		end
	end,
	override_view = function(p71, p72)
		-- upvalues: t9 (copy)
		if t9.others.ragebot.freezetime_fakeduck:get() and p71.ref_fake_duck:get() then
			local v337 = entity.get_game_rules and entity.get_game_rules() or nil

			if v337 and v337.m_bFreezePeriod then
				local v338 = entity.get_local_player()

				if v338 then
					local v339 = v338:get_origin()

					if v339 and p72.camera then
						p72.camera.z = v339.z + 64
					end

					return
				end

				return
			end

			return
		end
	end,
	setup = function(p73)
		events.shutdown(function()
			-- upvalues: p73 (copy)
			p73:shutdown()
		end, true)
		events.override_view(function(p74)
			-- upvalues: p73 (copy)
			p73:override_view(p74)
		end, true)
		events.createmove(function(p75)
			-- upvalues: p73 (copy)
			p73:createmove(p75)
		end, true)
	end
}):setup()

local function v61()
	-- upvalues: t9 (copy)
	if not t9.others.misc.fps_boost:get() then
		cvar.r_shadows:int(1)
		cvar.cl_csm_static_prop_shadows:int(1)
		cvar.cl_csm_shadows:int(1)
		cvar.cl_csm_world_shadows:int(1)
		cvar.cl_foot_contact_shadows:int(1)
		cvar.cl_csm_viewmodel_shadows:int(1)
		cvar.cl_csm_rope_shadows:int(1)
		cvar.cl_csm_sprite_shadows:int(1)
		cvar.r_dynamic:int(1)
		cvar.cl_autohelp:int(1)
		cvar.r_eyesize:int(1)
		cvar.r_eyeshift_z:int(1)
		cvar.r_eyeshift_y:int(1)
		cvar.r_eyeshift_x:int(1)
		cvar.r_eyemove:int(1)
		cvar.r_eyegloss:int(1)
		cvar.r_drawtracers_firstperson:int(1)
		cvar.r_drawtracers:int(1)
		cvar.fog_enable_water_fog:int(1)
		cvar.mat_postprocess_enable:int(1)
		cvar.cl_disablefreezecam:int(1)
		cvar.cl_freezecampanel_position_dynamic:int(1)
		cvar.r_drawdecals:int(1)
		cvar.muzzleflash_light:int(1)
		cvar.r_drawropes:int(1)
		cvar.r_drawsprites:int(1)
		cvar.cl_disablehtmlmotd:int(1)
		cvar.cl_freezecameffects_showholiday:int(1)
		cvar.cl_bob_lower_amt:int(1)
		cvar.cl_detail_multiplier:int(1)
		cvar.mat_drawwater:int(1)
	else
		cvar.r_shadows:int(0)
		cvar.cl_csm_static_prop_shadows:int(0)
		cvar.cl_csm_shadows:int(0)
		cvar.cl_csm_world_shadows:int(0)
		cvar.cl_foot_contact_shadows:int(0)
		cvar.cl_csm_viewmodel_shadows:int(0)
		cvar.cl_csm_rope_shadows:int(0)
		cvar.cl_csm_sprite_shadows:int(0)
		cvar.r_dynamic:int(0)
		cvar.cl_autohelp:int(0)
		cvar.r_eyesize:int(0)
		cvar.r_eyeshift_z:int(0)
		cvar.r_eyeshift_y:int(0)
		cvar.r_eyeshift_x:int(0)
		cvar.r_eyemove:int(0)
		cvar.r_eyegloss:int(0)
		cvar.r_drawtracers_firstperson:int(0)
		cvar.r_drawtracers:int(0)
		cvar.fog_enable_water_fog:int(0)
		cvar.mat_postprocess_enable:int(0)
		cvar.cl_disablefreezecam:int(0)
		cvar.cl_freezecampanel_position_dynamic:int(0)
		cvar.r_drawdecals:int(0)
		cvar.muzzleflash_light:int(0)
		cvar.r_drawropes:int(0)
		cvar.r_drawsprites:int(0)
		cvar.cl_disablehtmlmotd:int(0)
		cvar.cl_freezecameffects_showholiday:int(0)
		cvar.cl_bob_lower_amt:int(0)
		cvar.cl_detail_multiplier:int(0)
		cvar.mat_drawwater:int(0)
	end
end

events.render:set(function()
	-- upvalues: v61 (copy)
	v61()
end)

local function v62(_)
	-- upvalues: t9 (copy)
	if t9.others.visuals.keep_model_transparency:get() then
		local v342 = entity.get_local_player()

		if v342 and v342:is_alive() then
			if not v342.m_bIsScoped and not v342.m_bResumeZoom then
				return
			end

			return t9.others.visuals.keep_model_transparency.customizable1:get()
		end

		return
	end
end

t9.others.visuals.keep_model_transparency:set_callback(function(p77)
	-- upvalues: v62 (copy)
	if p77:get() then
		events.localplayer_transparency(v62, true)
	end
end)

if events.aim_fire then
	events.aim_fire:set(function()
		-- upvalues: t9 (copy), t7 (copy)
		local v344 = entity.get_local_player()

		if v344 and v344:is_alive() then
			local v345 = v344:get_player_weapon()

			if v345 then
				local v346 = v345:get_weapon_index()
				local v347 = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist")
				local fastideal = t9.others.ragebot.fastideal

				if fastideal:get() == true and v347:get() == true and t7.dt:get() == true and (v346 == 40 or v346 == 9 or v346 == 1 or v346 == 64) then
					if v346 == 40 and fastideal.weapons:get("SSG-08") == false then
						return
					end

					if v346 == 9 and fastideal.weapons:get("AWP") == false then
						return
					end

					if v346 == 1 and fastideal.weapons:get("Desert Eagle") == false then
						return
					end

					if v346 == 64 and fastideal.weapons:get("R8 Revolver") == false then
						return
					end

					utils.console_exec("use weapon_knife")

					if rage and rage.exploit and rage.exploit.force_teleport then
						rage.exploit:force_teleport()
					end

					utils.execute_after(1, function()
						-- upvalues: v346 (copy)
						if v346 == 40 or v346 == 9 then
							utils.console_exec("+attack2")
						end
					end)
					utils.execute_after(1.4, function()
						-- upvalues: v346 (copy)
						if v346 == 40 or v346 == 9 then
							utils.console_exec("-attack2")
						end
					end)
					utils.execute_after(fastideal.time:get() / 1000, function()
						-- upvalues: v346 (copy)
						if v346 ~= 40 then
							if v346 ~= 9 then
								if v346 ~= 1 then
									if v346 == 64 then
										utils.console_exec("use weapon_deagle")
									end
								else
									utils.console_exec("use weapon_deagle")
								end
							else
								utils.console_exec("use weapon_awp")
							end
						else
							utils.console_exec("use weapon_ssg08")
						end
					end)
				end

				return
			end

			return
		end
	end)
end

local function v63()
	-- upvalues: t9 (copy)
	entity.get_players(false, true, function(p78)
		-- upvalues: t9 (copy)
		steamid = p78:get_player_info().steamid64

		if t9.others.misc.muteretards:get() ~= "Mute" then
			if t9.others.misc.muteretards:get() == "Unmute" and panorama.FriendsListAPI.IsSelectedPlayerMuted(steamid) then
				panorama.FriendsListAPI.ToggleMute(steamid)
			end
		elseif not panorama.FriendsListAPI.IsSelectedPlayerMuted(steamid) then
			panorama.FriendsListAPI.ToggleMute(steamid)
		end
	end)
end

t9.others.misc.muteretards:set_callback(function()
	-- upvalues: t9 (copy), v63 (copy)
	if t9.others.misc.muteretards == "Disabled" then
		events.createmove:unset(v63())
	else
		events.createmove:set(v63())
	end
end)

local function v64(_)
	local v350 = entity.get_local_player()

	if v350 and v350:is_alive() then
		local m_fFlags = v350.m_fFlags
		local m_vecVelocity = v350.m_vecVelocity
		local v353 = math.sqrt(m_vecVelocity.x * m_vecVelocity.x + m_vecVelocity.y * m_vecVelocity.y)

		if bit.band(m_fFlags, 1) ~= 0 then
			if not v350.m_bDucked then
				if not (v353 > 5) then
					return "STAND"
				end

				return "MOVE"
			end

			if not (v353 > 5) then
				return "DUCK"
			end

			return "DUCK-MOVE"
		end

		if not v350.m_bDucked then
			return "AIR"
		end

		return "AIR-C"
	end

	return "UNKNOWN"
end
local function v65(p80)
	-- upvalues: t9 (copy), v64 (copy), t7 (copy)
	local v355 = entity.get_local_player()

	if v355 ~= nil and v355:is_alive() then
		local v356 = v355:get_player_weapon()

		if v356 ~= nil then
			local v357 = v356:get_weapon_index()

			if v357 ~= nil then
				if not t9.others.ragebot.hitchance:get() then
					t7.pistols_hitchance:override()
					t7.auto_snipers_hitchance:override()
					t7.awp_hitchance:override()
					t7.ssg08_hitchance:override()
					t7.revolver_hitchance:override()
				else
					if v64(p80) ~= "AIR-C" and v64(p80) ~= "AIR" then
						t7.pistols_hitchance:override()
						t7.auto_snipers_hitchance:override()
						t7.awp_hitchance:override()
						t7.ssg08_hitchance:override()
						t7.revolver_hitchance:override()
					else
						if t9.others.ragebot.hitchance.enable_pistols:get() and (v357 == 1 or v357 == 2 or v357 == 3 or v357 == 4 or v357 == 32 or v357 == 36 or v357 == 61) then
							t7.pistols_hitchance:override(t9.others.ragebot.hitchance.pistols_air_amount:get())
						end

						if t9.others.ragebot.hitchance.enable_auto_snipers:get() and (v357 == 38 or v357 == 11) then
							t7.auto_snipers_hitchance:override(t9.others.ragebot.hitchance.auto_snipers_air_amount:get())
						end

						if t9.others.ragebot.hitchance.enable_awp:get() and v357 == 9 then
							t7.awp_hitchance:override(t9.others.ragebot.hitchance.awp_air_amount:get())
						end

						if t9.others.ragebot.hitchance.enable_ssg08:get() and v357 == 40 then
							t7.ssg08_hitchance:override(t9.others.ragebot.hitchance.ssg08_air_amount:get())
						end

						if t9.others.ragebot.hitchance.enable_revolver:get() and v357 == 64 then
							t7.revolver_hitchance:override(t9.others.ragebot.hitchance.revolver_air_amount:get())
						end
					end

					if v355.m_bIsScoped and v64(p80) ~= "AIR-C" and v64(p80) ~= "AIR" then
						t7.pistols_hitchance:override()
						t7.auto_snipers_hitchance:override()
						t7.awp_hitchance:override()
						t7.ssg08_hitchance:override()
						t7.revolver_hitchance:override()
					elseif v64(p80) ~= "AIR-C" and v64(p80) ~= "AIR" then
						if t9.others.ragebot.hitchance.enable_auto_snipers:get() and (v357 == 38 or v357 == 11) then
							t7.auto_snipers_hitchance:override(t9.others.ragebot.hitchance.auto_snipers_no_scope_amount:get())
						end

						if t9.others.ragebot.hitchance.enable_awp:get() and v357 == 9 then
							t7.awp_hitchance:override(t9.others.ragebot.hitchance.awp_no_scope_amount:get())
						end

						if t9.others.ragebot.hitchance.enable_ssg08:get() and v357 == 40 then
							t7.ssg08_hitchance:override(t9.others.ragebot.hitchance.ssg08_no_scope_amount:get())
						end
					else
						if t9.others.ragebot.hitchance.enable_pistols:get() and (v357 == 1 or v357 == 2 or v357 == 3 or v357 == 4 or v357 == 32 or v357 == 36 or v357 == 61) then
							t7.pistols_hitchance:override(t9.others.ragebot.hitchance.pistols_air_amount:get())
						end

						if t9.others.ragebot.hitchance.enable_auto_snipers:get() and (v357 == 38 or v357 == 11) then
							t7.auto_snipers_hitchance:override(t9.others.ragebot.hitchance.auto_snipers_air_amount:get())
						end

						if t9.others.ragebot.hitchance.enable_awp:get() and v357 == 9 then
							t7.awp_hitchance:override(t9.others.ragebot.hitchance.awp_air_amount:get())
						end

						if t9.others.ragebot.hitchance.enable_ssg08:get() and v357 == 40 then
							t7.ssg08_hitchance:override(t9.others.ragebot.hitchance.ssg08_air_amount:get())
						end

						if t9.others.ragebot.hitchance.enable_revolver:get() and v357 == 64 then
							t7.revolver_hitchance:override(t9.others.ragebot.hitchance.revolver_air_amount:get())
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
local function v66()
	local v358 = entity.get_local_player()

	if v358 ~= nil and v358:is_alive() then
		local t14 = {}
		local t15 = {}
		local v361 = v358:get_eye_position()

		for i = 18, 360, 18 do
			local v363 = math.normalize_yaw(i)
			local v364 = v361 + vector():angles(0, v363) * 198
			local v365 = utils.trace_line(v361, v364, v358, 33570827)

			table.insert(t15, v361:dist(v365.end_pos))

			if v365.fraction < 0.3 then
				t14[#t14 + 1] = {
					last_trace = v364,
					max_yaw = v363
				}
			end
		end

		table.sort(t15)

		if t15[1] and t15[1] < 45 then
			table.sort(t14, function(p81, p82)
				return not (p82.max_yaw <= p81.max_yaw)
			end)

			local v366 = nil

			if #t14 > 2 then
				v366 = (v361 - t14[1].last_trace / 2):angles()
			end

			if v366 then
				local v367 = math.normalize_yaw(v366.y - render.camera_angles().y)

				if math.abs(v367) <= 89 then
					v367 = 0
					render.camera_angles().y = math.normalize_yaw(v366.y + 180)
				end

				local v368 = -render.camera_angles().y

				return (math.normalize_yaw(v368 + v366.y + v367 + 180))
			end
		end

		return
	end
end
local function v67(p83)
	-- upvalues: t9 (copy)
	if t9.others.ragebot.auto_teleport:get() and entity.get_local_player() then
		local m_fFlags = entity.get_local_player().m_fFlags
		local v371 = bit.band(m_fFlags, 1) == 1
		local in_jump = p83.in_jump
		local in_duck = p83.in_duck

		if entity.get_threat(true) ~= nil and (in_jump or in_duck and (in_jump or not v371)) then
			if globals.tickcount % (t9.others.ragebot.auto_teleport.auto_teleport_delay:get() * 3) ~= 0 then
				if entity.get_threat(false) ~= nil then
					rage.exploit:force_charge()
				end
			else
				rage.exploit:force_teleport()
			end
		end

		return
	end
end

events.createmove:set(function(p84)
	-- upvalues: v67 (copy)
	v67(p84)
end)

function solix.sharedfunc.scoreboard()
	-- upvalues: t9 (copy), v8 (copy)
	if v8 and globals.is_in_game and t9.others.misc.shared_icon_toggle:get() then
		for _, v in pairs(entity.get_players()) do
			local v377 = v:get_xuid()

			if not v8.GetRichSearch(v377, "eylul<3") then
				if v8.GetRichSearch(v377, "cokseviyorum") then
					table.insert({}, v)
					v:set_icon("https://iili.io/FIKTvyl.png")
				end
			else
				table.insert({}, v)
				v:set_icon("https://iili.io/FIK4X71.md.jpg")
			end
		end

		return
	end
end
function solix.sharedfunc.resetscoreboard()
	for _, v in pairs(entity.get_players()) do
		v:set_icon("")
	end
end

local u68 = false

local function v69()
	-- upvalues: t9 (copy), u68 (ref), v69 (copy)
	local v380 = t9.others.misc.shared_icon_toggle:get()

	if v380 ~= u68 then
		u68 = v380

		if v380 then
			if globals.is_in_game then
				solix.sharedfunc.scoreboard()
			end
		else
			solix.sharedfunc.resetscoreboard()
		end
	end

	utils.execute_after(1, v69)
end

v69()
events.round_start:set(function()
	-- upvalues: t9 (copy)
	if t9.others.misc.shared_icon_toggle:get() then
		solix.sharedfunc.resetscoreboard()
		utils.execute_after(1, function()
			solix.sharedfunc.scoreboard()
		end)

		return
	end

	solix.sharedfunc.resetscoreboard()
end)
events.round_end:set(function()
	-- upvalues: t9 (copy)
	if t9.others.misc.shared_icon_toggle:get() then
		solix.sharedfunc.resetscoreboard()
		utils.execute_after(1, function()
			solix.sharedfunc.scoreboard()
		end)

		return
	end

	solix.sharedfunc.resetscoreboard()
end)
events.shutdown:set(function()
	solix.sharedfunc.resetscoreboard()
end)
render.load_font("Verdana", 16, "ad")

local v70 = render.load_font("Calibri", 24, "bad")
local v71 = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\000d\000\000\000\\\b\003\000\000\000\175\021\224\166\000\000\000\001sRGB\001\217\201,\127\000\000\000\tpHYs\000\000\v\019\000\000\v\019\001\000\154\156\024\000\000\002\223PLTE\000\000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255v\153it\000\000\000\245tRNS\000\001C\147X\006Z\251\255\253\150\004\213\249\002\014\227\024\022\234+\027\2396)sr\030\242?uk \235\2442!\246G/\231\2267^\183\015#\248Q\b\179\154}\247c\000pz\193%n-\224b\252\194(v\174\136\v\201]~\250\233'\\\223\0181\132\216\140\207\151:\138\003\172\218\028l.B\143{\161K\149\016\202\019U=\0263\nNi\130\187A\199\128\135\145\158\166\170\134\127_&\220\254I\232\023\195F\137\146\186,\192\184\163\159\168\175\177\181\188\212|\243\157$\r\142[\005\217\209\153\241\204\203\155O\020\206\197\205\0250\245\a\222\021\164\029\017\229\131*\160q\214\208\198\185\169mR5\221\f\228d\237\191\196\141w\133\139\144\238\230\165x\236\t`\031\129\171\156\1528aJ\1784L\219\167\210E9S\176\240\189\148M\180DT>\162\"Yj\225\215\173@H;\190et4r\001\212\000\000\anIDATx\156\237\154\249[\212F\024\199\179\"2+\139\138X\208B\229\016T(B\017\016\149\"(V,\136\020\005\228\180\028\197 `E\188Q\001\161\136\136\162\162xq\021\021\v\136x\v\021T\020\207\nx\182\181\213Z\219\218\235\015hf&\187\155\132\221%\134\165\207\211>\190\191d\231\155\247}?9f\146w&K\016\002L4@k\160\182\144\1927\177A:@<\184\159\025\186\018\000\128\222\144\254\133\f\029FA\128~\255B\134\027@\200\136\254\133\188c\b!F\154K8r\212\187=\014\217\216\004B\222\227\168\162\145\163M\205\0041\244\205\001\176\024\195\017-\173 d,G\0297\030\000k\027!\144\247a:\219\tl\209\206\030\170\031\176E\135\137Pt\020\002\177\019\195P'\142\232\f\197I,M\234\162\003\197\201B \132+\f\021\179o\203\020=(\186\177\180\169\227\161\230n&\b\226\225\t\131\167905/\164MgJ\1863\160\004f\nb\016\222\031\162h\031\1666\002I\179\024\138\212\195\023J~\179\133A\1369(\163\255\\\134\244\017\146\2301\020\203\000$\205\023\252\168\249\024\197\a2\226\131\144\178@!\004/DJ\200'B\025D(\186\003\022\139\020\202b\1482L!\140E\002\b\023\204\144\221\149\b\133\178\004\t\145\242v\020\246\136\142\017\014!\198\196B\139S\bK\145\240\169\188\029\159\144\232\150\228\248Yr\031\024o\237\127cR\227P\219e\131D\178f\130\169\155\019I\146)\203#\177\005\166\166\165\243\180\136@\024\160\181\226s\151\149\025l\134\254tw\170W\219{\225\150\003i\0154a\171\024}|\200\148\249\1712\145\186\026\vnb\1410\168'\181\183\140a\182`\r\173\025\172\197\202:\r1\128\243z\156\208{\131\191L\178ZBc\253\213\005\190\145\133\162|\027\205\229B\214&\217\185\025\240\203\016\176yKv\142\194\"\178\211r\211\023n\205\155\152\191%\235\139\002\236\178\r\229\147Gx\146Q\242\155T\200\aa\161\246m\020\139\157R\152\016\207\237E\f\015^}\203z\a\015H1\003\226\183s\023\211\131W\231*\217\1654;\027\162%\135\024jq\ne>\f \017)\201\205\133\004\162\006\245\138\2032\210\229x\240\130\236V\199\144A\246\160\198\222\210\213\\\004O\200>>\144\253\168Qv@\137\a/\200A>\144\237\170=xA\014\241\129\164\246\017\018\r=c\226\014\031\017\137\202+f\014%*\195K\141\2275\r)\128\158\185\133:U\213\195\253\128\213rbR\166x\141bBACr\250\b\145H)\207/\0010\1699z\f\150u\199\169\159\181\\\200\137\190B\2248\177\252*+\214Adc\016\184\150\152\189\160\196g\130\166!uj\139\\\rA\002\130\255\005H\136\218E\014\026\130\v\217\241\195\170J\n\234\2475\184\158\156\145\222\184g\222\169\166\211KE\252 g\028x@\178U\028\180\161\027?\136\251Y\030\1444UWf\149J\1369\170y\246\226\198\185(\030\144tU\016\019U\144\204\243(D\130[\023\212.\164\244\006\137V\005\1858\129\t\017_\202kn\025\205\176\150\201\219f\145I_\167l\184\220\220\186\209\150\003\017[\180]q/\145H\014\187\230_m\189f\218\020\163\002\210nD\\/R@xY#\130\028\245V\210\221\149\a\180JE\2257\004A\148\154\204\197j\243\172\184\142\202\168Q\168QeF\148_\024\203\128\024\238'o\230\154P\221\172\153$\179\157\169n\1775)\233\150\0145J\195H\242\182/_H\189\017~\141\215\192\134\175\135\148\184\003\2382 \247\224>\018\1282\184\r\003zA\212F\186\005\180u\192\246I\236\147\219\027\164t(nI\191\129\173\251\193Dg;X\196\128\160\197\173.\000:\241\214\031\213\189\129\160\027=\t\"\177\207\131^ z\176\160\220q\249\161D\210N\181*:\b\221\019xiN\006\129gE<\002\000M>\031\211\213\203m\176\170\018n\181\248A\242\168\031\218\247\233\132\153\205T\030g6\228\017tm\002\224\t\220.\161\235\176[t\209\151\141}\210z\129\192K~O\214\005\252k\b\"\021\176!\167j)s\002 \220L\191\186\166\017T\148\r\175^Zt\b\152\aA\157\158\024\\\237\005r\154\186\027\r2\200dj\134\225*\145H\236\168\189y\018\019\021\029\182\167\225\a\228\001eo\005\180\127\0285;\170\163}\205\217\207\169\193\188!\248Q\223\176\220X\005\004\206_\002i\223\167\236\2537\145\168S%\t\248\150\218zvKJ,\160` \169k\1636\206%\146\238\n:\016\215]V\160\221\173Gy\142\246\195\005\178\140v\236\219\016K\027\236\213F\177\223!\1779FZi3\r\000\199\179\196\245\228n\000\190\175\021\233\006\237\005\190\231\227\137\029\207\218p ^\127\132\135\240\195]e\144h\216%\203\031Z\177N\031\222\248\131\244o8\248\136\213\000\160:(\020\248\161Zt\006\176F\195+\021\251\224\021\029<\169\n\235\232\t\017\255\b\127\206\029\240<6\150\005\145\202z\215c\184?\025\128\169p\251\002\004\160\154z?=N\232\219\134\215\166\134\225FHS0\023\002\206X\210M\017\251Ld\144\197p_\023=^d\1311\130\030\249?a\159\021(A\183,<\253\165\148\003\001u\003\241\027\214L9\164\v\238\243\001\224g\184}\005\174\160\213\194<p\f\245Dz\020\135\163\004\151\229\243\195\170\004.\004\000\251\137\197$\025\246\vPj\005\023)+\001\224\215\173\2179\233\212\173\v\137\200y\144o\b|/A\221\016\251\188\194\t-\159\202\186\027(\158\203\133\244\213<\159\208\025w%\148f\210Z>=\r\180\214\020d\141\151\252\234T'\214\209SQzy\239t\183\250X\222\214\200,e\143\\\195\a/\251@0\213\189O\185\197\021\021\021\133\006~U\191\217\177F\006a\214\178\207\1760W>k\030\017\219\023kJ~\253\250\197\166\145Jf\138\218\157q\241=\213\183\246_1o\023\146$\157|\024\139\253/Ih\191+\132?\160\v9]mU\174\222\018\209w$\2413\133\242\002\245\221\249\n\2259\238\205\166\194!\165(\193no\133b\131\148\020\133\160\189\f)\209jg1\234l\016\138\247e~\186,GR\018C\233D\175*O7n0O\187\142\015\210\145\185\022\213\243s\211\144\227H\170W\182x\195\195n\160;r\193\146\169y\161\167_\vS\138\169G\020\015a\144?Q\240$)S\203@e\188\v\203\2399\002\175\019\244W\128\181\232Dl\217k\005Eh\2212\145\165iG@\205\190K\bd%\f=W\203\022\241\183_\206\165\233@\175\140@!\1442\0249\135#v\160\242n'G\253\139\186`:\161B \186\145V\134N\220\133\149\0264\241\230|`&\028\254\014(\189\167\185\191g\028A%\227z\141\229Sj\213~\016\162\193\127\022(3\252G\f\203\222\029\251b\186p\150\225\171v\209[\003VLA\166\2453\131\136iM\191\147\209\187\155\220\254\001Q\1440+D^\186l\000\000\000\000IEND\174B`\130", vector(32, 27))

local function v72(p85, p86, p87, p88)
	-- upvalues: v70 (copy), y2 (copy)
	render.measure_text(v70, "bad", p85)

	local v385 = y2 - 350

	if not p88 then
		render.blur(vector(19, v385 - 350 - p87 + 350), vector(32 + render.measure_text(v70, "bad", p85).x, v385 - 345 - p87 + 28 + 350), 1.5, 0.9, 10)
		render.rect_outline(vector(18, v385 - 350 - p87 + 350), vector(33 + render.measure_text(v70, "bad", p85).x, v385 - 345 - p87 + 28 + 350), color(34, 34, 34, 55), 0.9, 10)
		render.text(v70, vector(25, v385 - 344 - p87 + 350), p86, "bad", p85)
	else
		render.blur(vector(19, v385 - 350 - p87 + 350), vector(32 + render.measure_text(v70, "bad", p85).x, v385 - 345 - p87 + 28 + 350), 1.5, 0.9, 10)
		render.rect_outline(vector(18, v385 - 350 - p87 + 350), vector(33 + render.measure_text(v70, "bad", p85).x, v385 - 345 - p87 + 28 + 350), color(34, 34, 34, 55), 0.9, 10)
		render.text(v70, vector(26, v385 - 343 - p87 + 350), color(0, 0, 0, 150), "bad", p85)
		render.text(v70, vector(25, v385 - 344 - p87 + 350), p86, "bad", p85)
	end
end

function get_bind(p89)
	local v387 = false
	local n14 = 0
	local v389 = ui.get_binds()

	for i = 1, #v389 do
		if p89 == v389[i].name and v389[i].active then
			v387 = true
			n14 = v389[i].value
		end
	end

	return {
		[1] = v387,
		[2] = n14
	}
end

events.render:set(function()
	-- upvalues: t9 (copy), y2 (copy), v72 (copy), t7 (copy), v71 (copy), v7 (copy), v70 (copy)
	if t9.others.visuals.slxindicator:get() then
		local v391 = entity.get_local_player()

		if v391 == nil or not v391:is_alive() then
			return
		end

		local v392 = v391:get_player_weapon()

		if not v392 or v392 == nil then
			return
		end

		local n15 = 0
		local n16 = 41
		local v395 = y2 - 350

		if t9.others.misc.fakelatency:get() > 0 then
			v72(ui.get_icon("signal-stream") .. " PING", color(150, 189, 18, 255), n15)
			n15 = n15 + n16
		end

		if not t7.dt:get() then
			if t7.hs:get() and not t7.dt:get() then
				v72(ui.get_icon("eye-slash") .. " OSAA", color(215, 215, 215, 255), n15)
				n15 = n15 + n16
			end
		else
			v72(ui.get_icon("transporter-1") .. " DT", rage.exploit:get() == 1 and color(215, 215, 215, 255) or color(255, 0, 0, 255), n15)
			n15 = n15 + n16
		end

		if t7.fs:get() then
			v72(ui.get_icon("person-walking-arrow-loop-left") .. " FS", color(215, 215, 215, 255), n15)
			n15 = n15 + n16
		end

		if t7.bodyaim:get() == "Force" then
			v72(ui.get_icon("vest-patches") .. " BODY", color(215, 215, 215, 255), n15)
			n15 = n15 + n16
		end

		if get_bind("Min. Damage")[1] then
			v72(ui.get_icon("person-praying") .. " MD", color(215, 215, 215, 255), n15)
			n15 = n15 + n16
		end

		if get_bind("Hit Chance")[1] then
			v72(ui.get_icon("crosshairs-simple") .. " HC", color(215, 215, 215, 255), n15)
			n15 = n15 + n16
		end

		if t7.fakeduck:get() then
			v72(ui.get_icon("circle-down") .. " DUCK", color(215, 215, 215, 255), n15)
			n15 = n15 + n16
		end

		local v396 = #entity.get_players(true, false) ~= #entity.get_players(true, true)

		if t7.dormant:get() then
			if not v396 then
				v72(ui.get_icon("eye") .. " DA", color(255, 0, 0, 255), n15)
			else
				v72(ui.get_icon("eye") .. " DA", color(215, 215, 215, 255), n15)
			end

			n15 = n15 + n16
		end

		if t7.safepoints:get() == "Force" then
			v72(ui.get_icon("bullseye-pointer") .. " SAFE", color(215, 215, 215, 255), n15)
			n15 = n15 + n16
		end

		local v397 = entity.get_entities("CPlantedC4")[1]

		if v397 ~= nil then
			local v398 = (v397.m_flC4Blow - globals.curtime) * 10 / 10
			local m_bBombDefused = v397.m_bBombDefused

			if math.floor(v398) >= -1 and not m_bBombDefused then
				local v400 = v397.m_hBombDefuser ~= 4294967295
				local m_flDefuseLength = v397.m_flDefuseLength
				local v402 = v400 and math.floor((v397.m_flDefuseCountDown - globals.curtime) * 10) / 10 or -1

				if v402 > 0 and not abort_defuse then
					local v403 = v402 < math.floor(v398) and color(58, 191, 54, 160) or color(252, 18, 19, 125)
					local v404 = (v395 - 50) / m_flDefuseLength * v402

					render.rect(vector(0, 0), vector(16, v395), color(25, 25, 25, 160))
					render.rect(vector(0, v395 - v404), vector(16, v395), v403)
				end

				local v405 = v397.m_nBombSite == 0 and "A" or "B"
				local m_iHealth = v391.m_iHealth
				local m_ArmorValue = v391.m_ArmorValue
				local v408 = ((function(p90, p91)
					local x3 = p90.x
					local y4 = p90.y
					local z = p90.z
					local x4 = p91.x
					local y5 = p91.y
					local z2 = p91.z
					local v994 = x3 - x4
					local v995 = y4 - y5
					local v996 = z - z2

					return math.sqrt(v994 * v994 + v995 * v995 + v996 * v996)
				end)(v397.m_vecOrigin, v391.m_vecOrigin) - 75.68) / 789.2
				local v409 = 450.7 * math.exp(-v408 * v408)

				if m_ArmorValue > 0 then
					local v410 = v409 * 0.5
					local v411 = (v409 - v410) * 0.5

					if m_ArmorValue < v411 then
						local _ = m_ArmorValue * 2

						v410 = v409 - v411
					end

					v409 = v410
				end

				local v413 = math.ceil(v409)
				local v414 = m_iHealth <= v413

				if v398 > 0.01 then
					v72(ui.get_icon("land-mine-on") .. " " .. v405 .. " - " .. string.format("%.1f", v398 >= 0 and v398 or 0) .. "s", color(215, 215, 215, 255), n15, v71)
					n15 = n15 + n16

					if not v414 then
						if v409 > 0.5 then
							v72(ui.get_icon("monitor-waveform") .. "  -" .. v413 .. " HP", color(255, 240, 100, 255), n15)
							n15 = n15 + n16
						end
					else
						v72(ui.get_icon("circle-exclamation") .. "  FATAL", color(255, 0, 0, 255), n15)
						n15 = n15 + n16
					end
				end
			end
		end

		if v7.state == false then
			v72(ui.get_icon("land-mine-on") .. " " .. v7.site, color(255, 240, 100, 255), n15, v71)
			ts = render.measure_text(v70, "bad", v7.site) + vector(20, 0)

			local _ = n15 + n16
		end
	end
end)
t9.others.misc.fakelatency:set_callback(function(p92)
	local sv_maxunlag = cvar.sv_maxunlag

	if not p92:get() then
		sv_maxunlag:float(0.2, true)
		ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):override(0)
		ui.find("Miscellaneous", "Main", "Other", "Fake Latency")
	else
		sv_maxunlag:float(0.4, true)
		ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):override(p92:get())
		ui.find("Miscellaneous", "Main", "Other", "Fake Latency")
	end
end)

local t16 = {
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

local function v74(p93)
	-- upvalues: t9 (copy), t16 (copy), t2 (copy)
	if t9.others.misc.aimlogs:get() ~= false then
		local _ = p93.id
		local v420 = entity.get(p93.target)
		local _ = p93.damage
		local _ = p93.wanted_damage
		local v423 = t16[p93.hitgroup]
		local v424 = t16[p93.wanted_hitgroup]
		local hitchance = p93.hitchance
		local state = p93.state
		local backtrack = p93.backtrack

		if v420 then
			if v420 ~= nil then
				local _ = v420.m_iHealth
				local s3 = "hit"
				local v430 = p93.weapon or "unknown"

				if v430 == "hegrenade" then
					s3 = "naded"
				end

				if v430 == "inferno" then
					s3 = "burned"
				end

				if v430 == "knife" then
					s3 = "knifed"
				end

				if state ~= nil then
					if t9.others.misc.aimlogs.select:get("Screen") then
						table.insert(t2, 1, {
							alpha = 0,
							text = "\a" .. t9.others.misc.aimlogs.miss_color:get():to_hex() .. "solix |\aDEFAULT Missed \a" .. t9.others.misc.aimlogs.miss_color:get():to_hex() .. "shot\aDEFAULT due to \a" .. t9.others.misc.aimlogs.miss_color:get():to_hex() .. "" .. state .. "",
							time = globals.realtime,
							color = t9.others.misc.aimlogs.miss_color:get()
						})
					end

					if t9.others.misc.aimlogs.select:get("Left Top") then
						print_dev("missed shot\a" .. t9.others.misc.aimlogs.miss_color:get():to_hex() .. " " .. string.lower(v420:get_name()) .. "\aDEFAULT r: \a" .. t9.others.misc.aimlogs.miss_color:get():to_hex() .. "" .. state .. "\aDEFAULT hitbox: \a" .. t9.others.misc.aimlogs.miss_color:get():to_hex() .. "" .. v424 .. " \aDEFAULTbt: \a" .. t9.others.misc.aimlogs.miss_color:get():to_hex() .. "" .. backtrack .. "\aDEFAULT")
					end

					if t9.others.misc.aimlogs.select:get("Console") then
						print_raw("\aFF0000D8solix\aDEFAULT • missed shot\a" .. t9.others.misc.aimlogs.miss_color:get():to_hex() .. " " .. string.lower(v420:get_name()) .. "\aDEFAULT r: \a" .. t9.others.misc.aimlogs.miss_color:get():to_hex() .. "" .. state .. "\aDEFAULT hitbox: \a" .. t9.others.misc.aimlogs.miss_color:get():to_hex() .. "" .. v424 .. " \aDEFAULTbt: \a" .. t9.others.misc.aimlogs.miss_color:get():to_hex() .. "" .. backtrack .. "\aDEFAULT")
					end
				else
					if t9.others.misc.aimlogs.select:get("Screen") then
						table.insert(t2, 1, {
							alpha = 0,
							text = "\a" .. t9.others.misc.aimlogs.hit_color:get():to_hex() .. "solix |\aDEFAULT Hit \a" .. t9.others.misc.aimlogs.hit_color:get():to_hex() .. "" .. v420:get_name() .. "\aDEFAULT in the \a" .. t9.others.misc.aimlogs.hit_color:get():to_hex() .. "" .. v423 .. "\aDEFAULT for \a" .. t9.others.misc.aimlogs.hit_color:get():to_hex() .. "" .. math.floor(p93.damage) .. "",
							time = globals.realtime,
							color = t9.others.misc.aimlogs.hit_color:get()
						})
					end

					if t9.others.misc.aimlogs.select:get("Left Top") then
						print_dev("" .. s3 .. "\a" .. t9.others.misc.aimlogs.hit_color:get():to_hex() .. " " .. string.lower(v420:get_name()) .. "\aDEFAULT hitbox: \a" .. t9.others.misc.aimlogs.hit_color:get():to_hex() .. "" .. v423 .. " \aDEFAULTdmg: \a" .. t9.others.misc.aimlogs.hit_color:get():to_hex() .. "" .. math.floor(p93.damage) .. "\aDEFAULT bt: \a" .. t9.others.misc.aimlogs.hit_color:get():to_hex() .. "" .. backtrack .. "\aDEFAULT hc: \a" .. t9.others.misc.aimlogs.hit_color:get():to_hex() .. "" .. math.floor(hitchance) .. "%\aDEFAULT")
					end

					if t9.others.misc.aimlogs.select:get("Console") then
						print_raw("\aFF0000D8solix\aDEFAULT • " .. s3 .. "\a" .. t9.others.misc.aimlogs.hit_color:get():to_hex() .. " " .. string.lower(v420:get_name()) .. "\aDEFAULT hitbox: \a" .. t9.others.misc.aimlogs.hit_color:get():to_hex() .. "" .. v423 .. " \aDEFAULTdmg: \a" .. t9.others.misc.aimlogs.hit_color:get():to_hex() .. "" .. math.floor(p93.damage) .. "\aDEFAULT bt: \a" .. t9.others.misc.aimlogs.hit_color:get():to_hex() .. "" .. backtrack .. "\aDEFAULT hc: \a" .. t9.others.misc.aimlogs.hit_color:get():to_hex() .. "" .. math.floor(hitchance) .. "%\aDEFAULT")
					end
				end

				return
			end

			return
		end

		return
	end
end

local t17 = {
	meow = false,
	locals = {
		resolveractive = false,
		has_logged_miss = false,
		missed_shots_logs = {},
		successful_shots_logs = {},
		player_headscales = {},
		aim_shot_logs = {},
		last_states = {},
		players_states = {},
		last_known_states = {},
		weapon_name_mappings = {
			weapon_tec9 = "Pistols",
			weapon_fiveseven = "Pistols",
			weapon_p250 = "Pistols",
			weapon_usp_silencer = "Pistols",
			weapon_hkp2000 = "Pistols",
			weapon_glock = "Pistols",
			weapon_taser = "Taser",
			weapon_mag7 = "Shotguns",
			weapon_sawedoff = "Shotguns",
			weapon_xm1014 = "Shotguns",
			weapon_nova = "Shotguns",
			weapon_negev = "Machineguns",
			weapon_m249 = "Machineguns",
			weapon_scar20 = "AutoSnipers",
			weapon_g3sg1 = "AutoSnipers",
			weapon_awp = "AWP",
			weapon_ssg08 = "SSG-08",
			weapon_aug = "AUG/SG 553",
			weapon_sg556 = "AUG/SG 553",
			weapon_ak47 = "AK-47",
			weapon_m4a1_silencer = "M4A1/M4A4",
			weapon_m4a1 = "M4A1/M4A4",
			weapon_galilar = "Rifles",
			weapon_famas = "Rifles",
			weapon_bizon = "SMGs",
			weapon_p90 = "SMGs",
			weapon_ump45 = "SMGs",
			weapon_mp5sd = "SMGs",
			weapon_mp7 = "SMGs",
			weapon_mac10 = "SMGs",
			weapon_mp9 = "SMGs",
			weapon_revolver = "R8 Revolver",
			weapon_deagle = "Desert Eagle",
			weapon_cz75a = "Pistols"
		}
	}
}

local function v76(p94)
	-- upvalues: t17 (copy), t9 (copy)
	local v432 = t17.locals.weapon_name_mappings[p94]

	if v432 then
		for _, v in ipairs(t9.others.ragebot.Resolver.Resolverguns:get()) do
			if v432 == v then
				return true, v432
			end
		end

		return false, v432
	end

	return false
end

anti_aim_state = {}
anti_aim_state.FLAGS = {
	DUCKING = 263,
	ON_GROUND = 257,
	IN_AIR_DUCKING = 262,
	IN_AIR = 256
}
anti_aim_state.STATES = {
	WALK = 2,
	AIR_DUCK = 6,
	STAND = 1,
	DUCK = 4,
	AIR = 5,
	SLOW_WALK = 3
}

local function v77(p95)
	for k, v in pairs(anti_aim_state.STATES) do
		if v == p95 then
			return k
		end
	end

	return "Unknown State"
end
local function v78(p96)
	-- upvalues: v77 (copy), t17 (copy)
	if p96 then
		if not p96:is_alive() then
			return t17.locals.last_known_states[p96] or "DEAD"
		end

		local v439 = p96.m_vecVelocity:length2d()
		local m_fFlags = p96.m_fFlags
		local v441 = ({
			[anti_aim_state.FLAGS.ON_GROUND] = {
				[not (v439 >= 3)] = anti_aim_state.STATES.STAND,
				[v439 > 3 and not (v439 >= 81)] = anti_aim_state.STATES.SLOW_WALK,
				[not (v439 <= 81)] = anti_aim_state.STATES.WALK
			},
			[anti_aim_state.FLAGS.DUCKING] = anti_aim_state.STATES.DUCK,
			[anti_aim_state.FLAGS.IN_AIR] = v439 < 10 and anti_aim_state.STATES.STAND or anti_aim_state.STATES.AIR,
			[anti_aim_state.FLAGS.IN_AIR_DUCKING] = v439 < 10 and anti_aim_state.STATES.DUCK or anti_aim_state.STATES.AIR_DUCK
		})[m_fFlags]
		local v442 = nil

		if v441 then
			if type(v441) ~= "table" then
				v442 = v77(v441)
			else
				for k, v in pairs(v441) do
					if k then
						v442 = v77(v)

						break
					end
				end
			end
		end

		if v442 then
			t17.locals.players_states[p96] = t17.locals.players_states[p96] or {}
			table.insert(t17.locals.players_states[p96], v442)
			t17.locals.last_known_states[p96] = v442

			if #t17.locals.players_states[p96] > 100 then
				table.remove(t17.locals.players_states[p96], 1)
			end
		end

		return v442
	end

	return false
end
local function v79(p97)
	-- upvalues: v78 (copy), t9 (copy), t17 (copy)
	local v446 = p97.m_vecVelocity:length2d()
	local v447 = v78(p97)
	local n17 = 0
	local v450

	if not t9.others.ragebot.Resolver.resolverversion:get(1) then
		if v447 then
			if v447 ~= "STAND" then
				if v447 ~= "WALK" then
					if v447 ~= "SLOW_WALK" then
						if v447 ~= "DUCK" then
							if v447 ~= "AIR" then
								if v447 == "AIR_DUCK" then
									n17 = math.random(70, 90)
								end
							else
								n17 = math.random(60, 70)
							end
						else
							n17 = math.random(60, 80)
						end
					else
						n17 = math.random(30, 60)
					end
				else
					n17 = math.random(10, 50)
				end
			else
				n17 = math.random(1, 55)
			end
		end

		local v449 = n17 + v446 / math.random(6, 10)

		v450 = math.max(5, math.min(100, v449))
	else
		if v447 then
			if v447 ~= "STAND" then
				if v447 ~= "WALK" then
					if v447 ~= "SLOW_WALK" then
						if v447 ~= "DUCK" then
							if v447 ~= "AIR" then
								if v447 == "AIR_DUCK" then
									n17 = 90
								end
							else
								n17 = 70
							end
						else
							n17 = 80
						end
					else
						n17 = 60
					end
				else
					n17 = 50
				end
			else
				n17 = 55
			end
		end

		local v451 = n17 + v446 / 10

		v450 = math.max(40, math.min(100, v451))
	end

	t17.locals.player_headscales[p97] = t17.locals.player_headscales[p97] or {}

	if v450 > 0 then
		table.insert(t17.locals.player_headscales[p97], v450)

		if #t17.locals.player_headscales[p97] > 10 then
			table.remove(t17.locals.player_headscales[p97], 1)
		end
	end

	for i = #t17.locals.player_headscales[p97], 1, -1 do
		if t17.locals.player_headscales[p97][i] > 0 then
			v450 = t17.locals.player_headscales[p97][i]

			break
		end
	end

	if v450 == 0 then
		print(string.format("Error: No valid headscale values for %s. All values in the array are zero or invalid.", p97:get_name()))
	end

	return v450
end

function force_reset_data()
	-- upvalues: t17 (copy)
	print("Resolver data reseted due to force reset")
	t17.locals.players_states = {}
	t17.locals.last_known_states = {}
	t17.locals.last_states = {}
	t17.locals.missed_shots_logs = {}
	t17.locals.successful_shots_logs = {}
	t17.locals.last_missed_player = nil
	t17.locals.has_logged_miss = false
	t17.locals.player_headscales = {}
	t17.locals.aim_shot_logs = {}
end

local function v80()
	-- upvalues: t9 (copy), v79 (copy), v78 (copy), t17 (copy), v76 (copy)
	if t9.others.ragebot.Resolver:get() then
		local v453 = entity.get_threat()
		local v454 = entity.get_local_player()

		if v454 and v454:is_alive() and v453 then
			local v455 = v453:get_name()
			local v456 = v79(v453)

			if v456 then
				local v457 = v78(v453)

				v78(v454)

				local v458 = v457 and v457.name or "Unknown"
				local headscale = nil

				if t17.locals.successful_shots_logs[v455] then
					for _, v in ipairs(t17.locals.successful_shots_logs[v455]) do
						if v458 == v.state then
							headscale = v.headscale

							break
						end
					end
				end

				local v462 = false

				if t17.locals.missed_shots_logs[v455] then
					for _, v in ipairs(t17.locals.missed_shots_logs[v455]) do
						if v458 == v.state and v456 == v.headscale then
							v462 = true

							break
						end
					end
				end

				local v465 = v454:get_player_weapon()

				if v465 then
					local weapon_name = v465:get_weapon_info().weapon_name

					if weapon_name ~= "weapon_taser" then
						local v467, v468 = v76(weapon_name)

						if v468 == nil then
							return
						end

						if v468 == nil then
							return
						end

						if not v467 then
							t17.locals.resolveractive = false
							ui.find("Aimbot", "Ragebot", "Selection", v468, "Multipoint", "Head Scale"):override()
						else
							t17.locals.resolveractive = true

							if not headscale then
								if v462 then
									t17.locals.resolveractive = false
									ui.find("Aimbot", "Ragebot", "Selection", v468, "Multipoint", "Head Scale"):override()
								else
									ui.find("Aimbot", "Ragebot", "Selection", v468, "Multipoint", "Head Scale"):override(math.floor(v456))
								end
							else
								ui.find("Aimbot", "Ragebot", "Selection", v468, "Multipoint", "Head Scale"):override(math.floor(headscale))
							end
						end

						ui.find("Aimbot", "Ragebot", "Selection", "Taser", "Multipoint", "Body Scale"):override()
					else
						ui.find("Aimbot", "Ragebot", "Selection", "Taser", "Multipoint", "Body Scale"):override(math.floor(v456))
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
local function v81(p98)
	-- upvalues: v78 (copy), v79 (copy), t17 (copy)
	local target = p98.target
	local v471 = target and target:get_name()

	if v471 and target then
		local v472 = v78(target) or "UNO"
		local v473 = v79(target)

		if v472 and v473 then
			t17.locals.aim_shot_logs[v471] = t17.locals.aim_shot_logs[v471] or {}
			table.insert(t17.locals.aim_shot_logs[v471], {
				shot_id = p98.id,
				state = v472,
				headscale = v473,
				damage = p98.damage,
				hitchance = p98.hitchance,
				hitgroup = p98.hitgroup,
				aim_position = p98.aim,
				angle = p98.angle
			})
			print(string.format("Shot at %s | State: %s | Headscale: %d | Damage: %d | Hitchance: %d", v471, v472, v473, p98.damage, p98.hitchance))

			return
		end

		return
	end
end
local function v82(p99)
	-- upvalues: t17 (copy)
	local target = p99.target

	if target then
		local v476 = target:get_name()

		if not v476 then
			return
		end

		local v477 = nil

		if t17.locals.aim_shot_logs[v476] then
			for _, v in ipairs(t17.locals.aim_shot_logs[v476]) do
				if v.shot_id == p99.id then
					v477 = v

					break
				end
			end
		end

		if not v477 then
			print("No matching shot data found.")

			return
		end

		local headscale = v477.headscale
		local state = v477.state

		if p99.hitgroup ~= 1 or not (p99.damage > 99) or p99.state then
			if v476 ~= t17.locals.last_missed_player or not t17.locals.has_logged_miss then
				t17.locals.missed_shots_logs[v476] = t17.locals.missed_shots_logs[v476] or {}
				table.insert(t17.locals.missed_shots_logs[v476], {
					headscale = math.floor(headscale),
					state = state
				})
				t17.locals.last_missed_player = v476
				t17.locals.has_logged_miss = true
				print(string.format("Shot missed on %s with Headscale: %d | State: %s", v476, headscale, state))
			end
		else
			t17.locals.successful_shots_logs[v476] = t17.locals.successful_shots_logs[v476] or {}
			table.insert(t17.locals.successful_shots_logs[v476], {
				headscale = math.floor(headscale),
				state = state
			})
			print(string.format("Hit and killed %s with Headscale: %d | State: %s", v476, headscale, state))
		end
	end
end

events.aim_fire:set(function(p100)
	-- upvalues: t9 (copy), v81 (copy)
	if t9.others.ragebot.Resolver:get() then
		v81(p100)
	end
end)
events.aim_ack:set(function(p101)
	-- upvalues: v74 (copy), t9 (copy), v82 (copy)
	v74(p101)

	if t9.others.ragebot.Resolver:get() then
		v82(p101)
	end
end)
events.createmove:set(function(_)
	-- upvalues: t9 (copy), v80 (copy)
	if t9.others.ragebot.Resolver:get() then
		v80()
	end
end)

local function v83()
	-- upvalues: t9 (copy)
	if t9.others.visuals.min_damage:get() then
		local v485 = entity.get_local_player()

		if v485 and v485:is_alive() then
			if not common.is_button_down(9) then
				local t18 = {
					x = render.screen_size().x,
					y = render.screen_size().y
				}
				local v487 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get()

				render.text(1, vector(t18.x / 2 + 6, t18.y / 2.08), color(255, 255, 255, 255), nil, v487)

				return
			end

			return
		end

		return
	end
end

events.render:set(function()
	-- upvalues: v83 (copy)
	v83()
end)

local t19 = {
	anim_num = 0,
	lerp = function(p103, p104, p105)
		return p103 + (p104 - p103) * p105
	end
}

function t19.setup()
	-- upvalues: t9 (copy), t7 (copy), t19 (copy)
	if t9.others.visuals.scope_overlay:get() then
		t7.override_zoom.scope_overlay:override("remove all")

		local v491 = entity.get_local_player()

		if v491 and v491:is_alive() and v491.m_bIsScoped then
			t19.anim_num = t19.lerp(t19.anim_num, 1, 15 * globals.frametime)
		else
			t19.anim_num = t19.lerp(t19.anim_num, 0, 15 * globals.frametime)
		end

		t19.offset = t9.others.visuals.scope_overlay.scope_gap:get() * t19.anim_num
		t19.length = t9.others.visuals.scope_overlay.scope_size:get() * t19.anim_num
		t19.col_1 = t9.others.visuals.scope_overlay.scope_color:get()
		t19.width = 1
		t19.col_1.a = t19.col_1.a * t19.anim_num
		t19.start_x = render.screen_size().x / 2
		t19.start_y = render.screen_size().y / 2

		if t9.others.visuals.scope_overlay.scope_style:get() ~= "Straight" then
			render.gradient(vector(t19.start_x - t19.offset, t19.start_y), vector(t19.start_x - t19.offset - t19.length, t19.start_y + t19.width), color(255, 255, 255, 0), color(t19.col_1.r, t19.col_1.g, t19.col_1.b, t9.others.visuals.scope_overlay.remove_line:get("Left") and 0 or t19.col_1.a), color(255, 255, 255, 0), color(t19.col_1.r, t19.col_1.g, t19.col_1.b, t9.others.visuals.scope_overlay.remove_line:get("Left") and 0 or t19.col_1.a))
			render.gradient(vector(t19.start_x + t19.offset, t19.start_y), vector(t19.start_x + t19.offset + t19.length, t19.start_y + t19.width), color(255, 255, 255, 0), color(t19.col_1.r, t19.col_1.g, t19.col_1.b, t9.others.visuals.scope_overlay.remove_line:get("Right") and 0 or t19.col_1.a), color(255, 255, 255, 0), color(t19.col_1.r, t19.col_1.g, t19.col_1.b, t9.others.visuals.scope_overlay.remove_line:get("Right") and 0 or t19.col_1.a))
			render.gradient(vector(t19.start_x, t19.start_y + t19.offset), vector(t19.start_x + t19.width, t19.start_y + t19.offset + t19.length), color(255, 255, 255, 0), color(255, 255, 255, 0), color(t19.col_1.r, t19.col_1.g, t19.col_1.b, t9.others.visuals.scope_overlay.remove_line:get("Bottom") and 0 or t19.col_1.a), color(t19.col_1.r, t19.col_1.g, t19.col_1.b, t9.others.visuals.scope_overlay.remove_line:get("Bottom") and 0 or t19.col_1.a))
			render.gradient(vector(t19.start_x, t19.start_y - t19.offset), vector(t19.start_x + t19.width, t19.start_y - t19.offset - t19.length), color(255, 255, 255, 0), color(255, 255, 255, 0), color(t19.col_1.r, t19.col_1.g, t19.col_1.b, t9.others.visuals.scope_overlay.remove_line:get("Top") and 0 or t19.col_1.a), color(t19.col_1.r, t19.col_1.g, t19.col_1.b, t9.others.visuals.scope_overlay.remove_line:get("Top") and 0 or t19.col_1.a))
		else
			render.gradient(vector(t19.start_x - t19.offset, t19.start_y), vector(t19.start_x - t19.offset - t19.length, t19.start_y + t19.width), color(t19.col_1.r, t19.col_1.g, t19.col_1.b, t9.others.visuals.scope_overlay.remove_line:get("Left") and 0 or t19.col_1.a), color(255, 255, 255, 0), color(t19.col_1.r, t19.col_1.g, t19.col_1.b, t9.others.visuals.scope_overlay.remove_line:get("Left") and 0 or t19.col_1.a), color(255, 255, 255, 0))
			render.gradient(vector(t19.start_x + t19.offset, t19.start_y), vector(t19.start_x + t19.offset + t19.length, t19.start_y + t19.width), color(t19.col_1.r, t19.col_1.g, t19.col_1.b, t9.others.visuals.scope_overlay.remove_line:get("Right") and 0 or t19.col_1.a), color(255, 255, 255, 0), color(t19.col_1.r, t19.col_1.g, t19.col_1.b, t9.others.visuals.scope_overlay.remove_line:get("Right") and 0 or t19.col_1.a), color(255, 255, 255, 0))
			render.gradient(vector(t19.start_x, t19.start_y + t19.offset), vector(t19.start_x + t19.width, t19.start_y + t19.offset + t19.length), color(t19.col_1.r, t19.col_1.g, t19.col_1.b, t9.others.visuals.scope_overlay.remove_line:get("Bottom") and 0 or t19.col_1.a), color(t19.col_1.r, t19.col_1.g, t19.col_1.b, t9.others.visuals.scope_overlay.remove_line:get("Bottom") and 0 or t19.col_1.a), color(255, 255, 255, 0), color(255, 255, 255, 0))
			render.gradient(vector(t19.start_x, t19.start_y - t19.offset), vector(t19.start_x + t19.width, t19.start_y - t19.offset - t19.length), color(t19.col_1.r, t19.col_1.g, t19.col_1.b, t9.others.visuals.scope_overlay.remove_line:get("Top") and 0 or t19.col_1.a), color(t19.col_1.r, t19.col_1.g, t19.col_1.b, t9.others.visuals.scope_overlay.remove_line:get("Top") and 0 or t19.col_1.a), color(255, 255, 255, 0), color(255, 255, 255, 0))
		end

		return
	end
end

events.render:set(function()
	-- upvalues: t19 (copy), t9 (copy)
	t19.setup()

	if working and t9.others.visuals.penetration_circle:get() then
		local v492 = entity.get_local_player()

		if globals.is_in_game and v492 and v492:is_alive() then
			RenderCircle(camera_position, direction, v492, render_color)
		else
			working = false
		end
	end
end)

local n18 = 0

t9.others.visuals.viewmodel:set_callback(function(p106)
	-- upvalues: t9 (copy)
	if not p106:get() then
		utils.console_exec("viewmodel_presetpos 1")
	else
		cvar.viewmodel_fov:float(t9.others.visuals.viewmodel.fov:get(), true)
		cvar.viewmodel_offset_x:float(t9.others.visuals.viewmodel.x:get() / 10, true)
		cvar.viewmodel_offset_y:float(t9.others.visuals.viewmodel.y:get() / 10, true)
		cvar.viewmodel_offset_z:float(t9.others.visuals.viewmodel.z:get() / 10, true)
	end
end)

if t9.others.visuals.viewmodel:get() then
	cvar.viewmodel_fov:float(t9.others.visuals.viewmodel.fov:get(), true)
	cvar.viewmodel_offset_x:float(t9.others.visuals.viewmodel.x:get() / 10, true)
	cvar.viewmodel_offset_y:float(t9.others.visuals.viewmodel.y:get() / 10, true)
	cvar.viewmodel_offset_z:float(t9.others.visuals.viewmodel.z:get() / 10, true)
end

events.createmove:set(function()
	-- upvalues: t9 (copy), n18 (ref), t7 (copy)
	if t9.others.visuals.viewmodel:get() then
		if not (n18 >= 64) then
			n18 = n18 + 1
		else
			n18 = 0
			cvar.viewmodel_fov:float(t9.others.visuals.viewmodel.fov:get(), true)
			cvar.viewmodel_offset_x:float(t9.others.visuals.viewmodel.x:get() / 10, true)
			cvar.viewmodel_offset_y:float(t9.others.visuals.viewmodel.y:get() / 10, true)
			cvar.viewmodel_offset_z:float(t9.others.visuals.viewmodel.z:get() / 10, true)
		end

		t7.override_zoom.force_viewmodel:set(t9.others.visuals.viewmodel.viewmodel_inscope:get())

		return
	end
end)
t9.others.visuals.viewmodel.fov:set_callback(function()
	-- upvalues: t9 (copy)
	if t9.others.visuals.viewmodel:get() then
		cvar.viewmodel_fov:float(t9.others.visuals.viewmodel.fov:get(), true)
	end
end)
t9.others.visuals.viewmodel.x:set_callback(function()
	-- upvalues: t9 (copy)
	if t9.others.visuals.viewmodel:get() then
		cvar.viewmodel_offset_x:float(t9.others.visuals.viewmodel.x:get() / 10, true)
	end
end)
t9.others.visuals.viewmodel.y:set_callback(function()
	-- upvalues: t9 (copy)
	if t9.others.visuals.viewmodel:get() then
		cvar.viewmodel_offset_y:float(t9.others.visuals.viewmodel.y:get() / 10, true)
	end
end)
t9.others.visuals.viewmodel.z:set_callback(function()
	-- upvalues: t9 (copy)
	if t9.others.visuals.viewmodel:get() then
		cvar.viewmodel_offset_z:float(t9.others.visuals.viewmodel.z:get() / 10, true)
	end
end)

local trace_line = utils.trace_line
local abs = math.abs
local floor = math.floor
local n19 = 1174421507

local function v90(p107, ...)
	p107.a = 100
	render.poly(p107, ...)
	p107.a = 255
	render.poly_line(p107, ...)
end

local v91 = (function()
	local t20 = {}
	local n20 = 0

	return function(p108)
		-- upvalues: n20 (ref), t20 (copy)
		n20 = rawget(t20, p108)

		if not n20 then
			n20 = 1 / math.cos(math.asin(p108))
			rawset(t20, p108, n20)

			return n20
		end

		return n20
	end
end)()
local v92 = (function()
	-- upvalues: trace_line (copy), n19 (copy), abs (copy), v91 (copy), v90 (copy)
	local v497 = vector(0, 0, 0)
	local v498 = vector(0, 0, 0)
	local u499 = vector(0, 0, 0)
	local u500 = vector(0, 0, 0)
	local t21 = {}
	local t22 = {}

	for i = 0, 2 * math.pi, 2 * math.pi / 30 do
		table.insert(t22, {
			[1] = 6 * math.cos(i),
			[2] = 6 * math.sin(i)
		})
	end

	local v504 = #t22

	return function(p109, p110, p111, p112)
		-- upvalues: trace_line (copy), n19 (copy), u499 (ref), u500 (ref), abs (copy), v504 (copy), t21 (copy), t22 (copy), v497 (copy), v498 (copy), v91 (copy), v90 (copy)
		local v1002 = trace_line(p109, p109 + p110:scaled(10000), p111, n19)

		u499 = v1002.end_pos
		u500 = v1002.plane.normal

		if not (abs(u500.z) >= 0.99) then
			v497.x = -u500.y
			v497.y = u500.x
			v498.x = u500.z * u500.x
			v498.y = u500.z * u500.y
			v498.z = u500.y * v497.x - u500.x * u500.x

			for i = 1, v504 do
				rawset(t21, i, (u499 + (v497 * t22[i][1] + v498 * t22[i][2]) * v91(u500.z)):to_screen())
			end
		else
			for i = 1, v504 do
				rawset(t21, i, (u499 + vector(t22[i][1], t22[i][2], 0)):to_screen())
			end
		end

		rawset(t21, v504 + 1, t21[1])
		pcall(v90, p112, unpack(t21))
	end
end)()
local v93 = (function()
	-- upvalues: trace_line (copy), n19 (copy), abs (copy), floor (copy)
	local v505 = color(55, 155, 255)
	local v506 = color(200, 255, 55)
	local v507 = color(255, 55, 55)

	return function(p113, p114, p115, p116)
		-- upvalues: trace_line (copy), n19 (copy), v505 (copy), abs (copy), floor (copy), v506 (copy), v507 (copy)
		local v1009 = p115 + p116:scaled(p114)
		local v1010 = trace_line(p115, v1009, p113, n19)
		local _, v1012 = utils.trace_bullet(p113, p115, v1009, p113)

		if not v1012.entity or v1012.entity:get_classname() ~= "CCSPlayer" then
			local end_pos = v1010.end_pos

			for _ = 1, 4 do
				if abs((end_pos + p116):dist(v1009)) <= 10 then
					return floor(p115:dist(v1012.end_pos)) > floor(p115:dist(end_pos)) and v506 or v507
				end

				local v1015 = trace_line(end_pos + p116, v1009, p113, n19)

				if v1015.end_pos:dist(v1010.end_pos) > 30 then
					return floor(p115:dist(v1012.end_pos)) > floor(p115:dist(end_pos)) and v506 or v507
				end

				end_pos = v1015.end_pos
			end

			return floor(p115:dist(v1012.end_pos)) > floor(p115:dist(end_pos)) and v506 or v507
		end

		return v505
	end
end)()
local u94 = vector()
local u95 = vector()
local u96 = false
local u97 = color()

events.createmove:set(function()
	-- upvalues: t9 (copy), u96 (ref), u97 (ref), v93 (copy), u94 (ref), u95 (ref)
	if t9.others.visuals.penetration_circle:get() then
		local v508 = entity.get_local_player()

		if v508 and v508:is_alive() then
			local v509 = v508:get_player_weapon()

			if v509 then
				local v510 = v509:get_weapon_info()
				local weapon_type = v510.weapon_type

				if weapon_type ~= 0 and weapon_type ~= 7 and weapon_type ~= 9 then
					u96 = true
					u97 = v93(v508, v510.range, u94, u95)

					return
				end

				u96 = false

				return
			end

			u96 = false

			return
		end

		u96 = false

		return
	end

	u96 = false
end)
events.render:set(function()
	-- upvalues: u96 (ref), t9 (copy), v92 (copy), u94 (ref), u95 (ref), u97 (ref)
	if u96 and t9.others.visuals.penetration_circle:get() then
		local v512 = entity.get_local_player()

		if globals.is_in_game and v512 and v512:is_alive() then
			v92(u94, u95, v512, u97)

			return
		end

		u96 = false

		return
	end
end)
events.override_view:set(function(p117)
	-- upvalues: u94 (ref), u95 (ref)
	u94 = p117.camera
	u95 = vector():angles(p117.view)
end);
({
	WEAPONTYPE_SNIPER_RIFLE = 5,
	WEAPONTYPE_RIFLE = 3,
	WEAPONTYPE_SUBMACHINEGUN = 2,
	WEAPONTYPE_PISTOL = 1,
	ref_hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
	ref_double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
	ref_slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
	get_weapon_type = function(p118, p119)
		local v516 = p119:get_weapon_info()

		if v516 ~= nil then
			local weapon_type = v516.weapon_type
			local v518 = p119:get_weapon_index()

			if weapon_type ~= p118.WEAPONTYPE_SUBMACHINEGUN then
				if weapon_type ~= p118.WEAPONTYPE_RIFLE then
					if weapon_type ~= p118.WEAPONTYPE_PISTOL then
						if weapon_type ~= p118.WEAPONTYPE_SNIPER_RIFLE then
							return nil
						end

						if v518 ~= 40 then
							if v518 ~= 9 then
								return "Auto Snipers"
							end

							return "AWP"
						end

						return "SSG-08"
					end

					if v518 ~= 1 then
						return "Pistols"
					end

					return "Desert Eagle"
				end

				return "Rifles"
			end

			return "SMG"
		end

		return nil
	end,
	get_state = function(p120)
		local v520 = entity.get_local_player()

		if v520 and v520:is_alive() then
			local v521 = v520.m_vecVelocity:length2d()
			local v522 = not (v520.m_flDuckAmount <= 0.5)
			local m_fFlags = v520.m_fFlags
			local v524 = bit.band(m_fFlags, 1) == 0

			if not v524 or not v522 then
				if not v524 then
					if not p120.ref_slowwalk:get() then
						if not v522 or not (v521 < 5) then
							if not v522 then
								if not (v521 < 5) then
									return "Move"
								end

								return "Stand"
							end

							return "Duck Move"
						end

						return "Duck"
					end

					return "Slowwalk"
				end

				return "In Air"
			end

			return "Air Crouch"
		end

		return nil
	end,
	should_update = function(p121)
		-- upvalues: t9 (copy)
		local auto_hide_shots = t9.others.ragebot.auto_hide_shots

		if auto_hide_shots and auto_hide_shots:get() then
			if p121.ref_double_tap:get() then
				local v527 = entity.get_local_player()

				if v527 and v527:is_alive() then
					local v528 = v527:get_player_weapon()

					if v528 then
						local v529 = p121:get_weapon_type(v528)

						if v529 and auto_hide_shots.weapons:get(v529) then
							local v530 = p121:get_state()

							if v530 and auto_hide_shots.states:get(v530) then
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
	end,
	shutdown = function(p122)
		if p122.ref_hide_shots then
			p122.ref_hide_shots:override()
		end

		if p122.ref_double_tap then
			p122.ref_double_tap:override()
		end
	end,
	createmove = function(p123, _)
		if not p123:should_update() then
			p123:shutdown()
		else
			if p123.ref_hide_shots then
				p123.ref_hide_shots:override(true)
			end

			if p123.ref_double_tap then
				p123.ref_double_tap:override(false)
			end
		end
	end,
	setup = function(p125)
		-- upvalues: t9 (copy)
		local auto_hide_shots = t9.others.ragebot.auto_hide_shots

		if auto_hide_shots then
			local function v536()
				-- upvalues: p125 (copy)
				p125:shutdown()
			end
			local function v537(p126)
				-- upvalues: p125 (copy)
				p125:createmove(p126)
			end

			auto_hide_shots:set_callback(function(p127)
				-- upvalues: v536 (copy), v537 (copy), p125 (copy)
				if not p127:get() then
					p125:shutdown()
					events.shutdown:unset(v536)
					events.createmove:unset(v537)
				else
					events.shutdown:set(v536)
					events.createmove:set(v537)
				end
			end)

			return
		end

		print("Error: auto_hide_shots UI reference not found")
	end
}):setup();
(function()
	-- upvalues: t7 (copy), t9 (copy)
	local function u538(p128, p129, p130)
		return p128 + (p129 - p128) * (globals.frametime * p130 * 175)
	end

	function math.lerp(p131, p132, p133)
		return p131 + (p132 - p131) * globals.frametime * p133
	end

	local function v539(p134, p135)
		local v1031 = globals.realtime * (p135 or 1) % math.pi
		local v1032 = math.sin(v1031 + (p134 or 0))

		return (math.abs(v1032))
	end

	local t23 = {
		data = {}
	}

	function t23.lerp(p136, p137, p138)
		-- upvalues: t23 (copy)
		if type(p136) ~= "userdata" then
			return (p137 - p136) * (globals.frametime * p138 * 175) + p136
		end

		local t24 = {
			[1] = 0,
			[2] = 0,
			[3] = 0,
			[4] = 0
		}

		for i, v in ipairs({
			[1] = "r",
			[2] = "g",
			[3] = "b",
			[4] = "a"
		}) do
			t24[i] = t23.lerp(p136[v], p137[v], p138)
		end

		return color(unpack(t24))
	end
	function t23.new(p139, p140, p141)
		-- upvalues: t23 (copy)
		if t23.data[p139] == nil then
			t23.data[p139] = p140
		end

		t23.data[p139] = t23.lerp(t23.data[p139], p140, p141)

		return t23.data[p139]
	end

	local v541 = (function()
		local t25 = {}
		local pow = math.pow
		local sin = math.sin
		local cos = math.cos
		local pi = math.pi
		local sqrt = math.sqrt
		local abs2 = math.abs
		local asin = math.asin

		local function v1050(p142, p143, p144, p145)
			-- upvalues: pow (copy)
			return p144 * pow(p142 / p145, 2) + p143
		end
		local function v1051(p146, p147, p148, p149)
			local v1217 = p146 / p149

			return -p148 * v1217 * (v1217 - 2) + p147
		end
		local function v1052(p150, p151, p152, p153)
			-- upvalues: pow (copy)
			return p152 * pow(p150 / p153, 3) + p151
		end
		local function v1053(p154, p155, p156, p157)
			-- upvalues: pow (copy)
			return p156 * (pow(p154 / p157 - 1, 3) + 1) + p155
		end
		local function v1054(p158, p159, p160, p161)
			-- upvalues: pow (copy)
			return p160 * pow(p158 / p161, 4) + p159
		end
		local function v1055(p162, p163, p164, p165)
			-- upvalues: pow (copy)
			return -p164 * (pow(p162 / p165 - 1, 4) - 1) + p163
		end
		local function v1056(p166, p167, p168, p169)
			-- upvalues: pow (copy)
			return p168 * pow(p166 / p169, 5) + p167
		end
		local function v1057(p170, p171, p172, p173)
			-- upvalues: pow (copy)
			return p172 * (pow(p170 / p173 - 1, 5) + 1) + p171
		end
		local function v1058(p174, p175, p176, p177)
			-- upvalues: cos (copy), pi (copy)
			return -p176 * cos(p174 / p177 * pi / 2) + p176 + p175
		end
		local function v1059(p178, p179, p180, p181)
			-- upvalues: sin (copy), pi (copy)
			return p180 * sin(p178 / p181 * pi / 2) + p179
		end
		local function v1060(p182, p183, p184, p185)
			-- upvalues: pow (copy)
			if p182 ~= 0 then
				return p184 * pow(2, 10 * (p182 / p185 - 1)) + p183 - p184 * 0.001
			end

			return p183
		end
		local function v1061(p186, p187, p188, p189)
			-- upvalues: pow (copy)
			if p186 ~= p189 then
				return p188 * 1.001 * (-pow(2, -10 * p186 / p189) + 1) + p187
			end

			return p187 + p188
		end
		local function v1062(p190, p191, p192, p193)
			-- upvalues: sqrt (copy), pow (copy)
			return -p192 * (sqrt(1 - pow(p190 / p193, 2)) - 1) + p191
		end
		local function v1063(p194, p195, p196, p197)
			-- upvalues: sqrt (copy), pow (copy)
			return p196 * sqrt(1 - pow(p194 / p197 - 1, 2)) + p195
		end
		local function v1064(p198, p199, p200, p201)
			-- upvalues: abs2 (copy), pi (copy), asin (copy)
			local v1334 = p198 or p201 * 0.3

			if not p199 then
				p199 = 0
			end

			if not (p199 < abs2(p200)) then
				return v1334, p199, v1334 / (2 * pi) * asin(p200 / p199)
			end

			return v1334, p200, v1334 / 4
		end
		local function v1065(p202, p203, p204, p205, p206, p207)
			-- upvalues: v1064 (copy), pow (copy), sin (copy), pi (copy)
			if p202 ~= 0 then
				local v1341 = p202 / p205

				if v1341 ~= 1 then
					local v1342, v1343, v1344 = v1064(p207, p206, p204, p205)
					local v1345 = v1341 - 1

					return -(v1343 * pow(2, 10 * v1345) * sin((v1345 * p205 - v1344) * 2 * pi / v1342)) + p203
				end

				return p203 + p204
			end

			return p203
		end
		local function v1066(p208, p209, p210, p211, p212, p213)
			-- upvalues: v1064 (copy), pow (copy), sin (copy), pi (copy)
			if p208 ~= 0 then
				local v1352 = p208 / p211

				if v1352 ~= 1 then
					local v1353, v1354, v1355 = v1064(p213, p212, p210, p211)

					return v1354 * pow(2, -10 * v1352) * sin((v1352 * p211 - v1355) * 2 * pi / v1353) + p210 + p209
				end

				return p209 + p210
			end

			return p209
		end
		local function v1067(p214, p215, p216, p217, p218)
			if not p218 then
				p218 = 1.70158
			end

			local v1378 = p214 / p217

			return p216 * v1378 * v1378 * ((p218 + 1) * v1378 - p218) + p215
		end
		local function v1068(p219, p220, p221, p222, p223)
			if not p223 then
				p223 = 1.70158
			end

			local v1384 = p219 / p222 - 1

			return p221 * (v1384 * v1384 * ((p223 + 1) * v1384 + p223) + 1) + p220
		end
		local function v1069(p224, p225, p226, p227)
			local v1402 = p224 / p227

			if not (v1402 < 0.36363636363636365) then
				if not (v1402 < 0.7272727272727273) then
					if not (v1402 < 0.9090909090909091) then
						local v1403 = v1402 - 0.9545454545454546

						return p226 * (7.5625 * v1403 * v1403 + 0.984375) + p225
					end

					local v1404 = v1402 - 0.8181818181818182

					return p226 * (7.5625 * v1404 * v1404 + 0.9375) + p225
				end

				local v1405 = v1402 - 0.5454545454545454

				return p226 * (7.5625 * v1405 * v1405 + 0.75) + p225
			end

			return p226 * 7.5625 * v1402 * v1402 + p225
		end
		local function v1070(p228, p229, p230, p231)
			-- upvalues: v1069 (copy)
			return p230 - v1069(p231 - p228, 0, p230, p231) + p229
		end

		t25.easing = {
			linear = function(p232, p233, p234, p235)
				return p234 * p232 / p235 + p233
			end,
			inQuad = v1050,
			outQuad = v1051,
			inOutQuad = function(p236, p237, p238, p239)
				-- upvalues: pow (copy)
				local v1222 = p236 / p239 * 2

				if not (v1222 < 1) then
					return -p238 / 2 * ((v1222 - 1) * (v1222 - 3) - 1) + p237
				end

				return p238 / 2 * pow(v1222, 2) + p237
			end,
			outInQuad = function(p240, p241, p242, p243)
				-- upvalues: v1051 (copy), v1050 (copy)
				if not (p240 < p243 / 2) then
					return v1050(p240 * 2 - p243, p241 + p242 / 2, p242 / 2, p243)
				end

				return v1051(p240 * 2, p241, p242 / 2, p243)
			end,
			inCubic = v1052,
			outCubic = v1053,
			inOutCubic = function(p244, p245, p246, p247)
				local v1239 = p244 / p247 * 2

				if not (v1239 < 1) then
					local v1240 = v1239 - 2

					return p246 / 2 * (v1240 * v1240 * v1240 + 2) + p245
				end

				return p246 / 2 * v1239 * v1239 * v1239 + p245
			end,
			outInCubic = function(p248, p249, p250, p251)
				-- upvalues: v1053 (copy), v1052 (copy)
				if not (p248 < p251 / 2) then
					return v1052(p248 * 2 - p251, p249 + p250 / 2, p250 / 2, p251)
				end

				return v1053(p248 * 2, p249, p250 / 2, p251)
			end,
			inQuart = v1054,
			outQuart = v1055,
			inOutQuart = function(p252, p253, p254, p255)
				-- upvalues: pow (copy)
				local v1257 = p252 / p255 * 2

				if not (v1257 < 1) then
					return -p254 / 2 * (pow(v1257 - 2, 4) - 2) + p253
				end

				return p254 / 2 * pow(v1257, 4) + p253
			end,
			outInQuart = function(p256, p257, p258, p259)
				-- upvalues: v1055 (copy), v1054 (copy)
				if not (p256 < p259 / 2) then
					return v1054(p256 * 2 - p259, p257 + p258 / 2, p258 / 2, p259)
				end

				return v1055(p256 * 2, p257, p258 / 2, p259)
			end,
			inQuint = v1056,
			outQuint = v1057,
			inOutQuint = function(p260, p261, p262, p263)
				-- upvalues: pow (copy)
				local v1274 = p260 / p263 * 2

				if not (v1274 < 1) then
					return p262 / 2 * (pow(v1274 - 2, 5) + 2) + p261
				end

				return p262 / 2 * pow(v1274, 5) + p261
			end,
			outInQuint = function(p264, p265, p266, p267)
				-- upvalues: v1057 (copy), v1056 (copy)
				if not (p264 < p267 / 2) then
					return v1056(p264 * 2 - p267, p265 + p266 / 2, p266 / 2, p267)
				end

				return v1057(p264 * 2, p265, p266 / 2, p267)
			end,
			inSine = v1058,
			outSine = v1059,
			inOutSine = function(p268, p269, p270, p271)
				-- upvalues: cos (copy), pi (copy)
				return -p270 / 2 * (cos(pi * p268 / p271) - 1) + p269
			end,
			outInSine = function(p272, p273, p274, p275)
				-- upvalues: v1059 (copy), v1058 (copy)
				if not (p272 < p275 / 2) then
					return v1058(p272 * 2 - p275, p273 + p274 / 2, p274 / 2, p275)
				end

				return v1059(p272 * 2, p273, p274 / 2, p275)
			end,
			inExpo = v1060,
			outExpo = v1061,
			inOutExpo = function(p276, p277, p278, p279)
				-- upvalues: pow (copy)
				if p276 ~= 0 then
					if p276 ~= p279 then
						local v1307 = p276 / p279 * 2

						if not (v1307 < 1) then
							return p278 / 2 * 1.0005 * (-pow(2, -10 * (v1307 - 1)) + 2) + p277
						end

						return p278 / 2 * pow(2, 10 * (v1307 - 1)) + p277 - p278 * 0.0005
					end

					return p277 + p278
				end

				return p277
			end,
			outInExpo = function(p280, p281, p282, p283)
				-- upvalues: v1061 (copy), v1060 (copy)
				if not (p280 < p283 / 2) then
					return v1060(p280 * 2 - p283, p281 + p282 / 2, p282 / 2, p283)
				end

				return v1061(p280 * 2, p281, p282 / 2, p283)
			end,
			inCirc = v1062,
			outCirc = v1063,
			inOutCirc = function(p284, p285, p286, p287)
				-- upvalues: sqrt (copy)
				local v1324 = p284 / p287 * 2

				if not (v1324 < 1) then
					local v1325 = v1324 - 2

					return p286 / 2 * (sqrt(1 - v1325 * v1325) + 1) + p285
				end

				return -p286 / 2 * (sqrt(1 - v1324 * v1324) - 1) + p285
			end,
			outInCirc = function(p288, p289, p290, p291)
				-- upvalues: v1063 (copy), v1062 (copy)
				if not (p288 < p291 / 2) then
					return v1062(p288 * 2 - p291, p289 + p290 / 2, p290 / 2, p291)
				end

				return v1063(p288 * 2, p289, p290 / 2, p291)
			end,
			inElastic = v1065,
			outElastic = v1066,
			inOutElastic = function(p292, p293, p294, p295, p296, p297)
				-- upvalues: v1064 (copy), pow (copy), sin (copy), pi (copy)
				if p292 ~= 0 then
					local v1362 = p292 / p295 * 2

					if v1362 ~= 2 then
						local v1363, v1364, v1365 = v1064(p297, p296, p294, p295)
						local v1366 = v1362 - 1

						if not (v1366 < 0) then
							return v1364 * pow(2, -10 * v1366) * sin((v1366 * p295 - v1365) * 2 * pi / v1363) * 0.5 + p294 + p293
						end

						return -0.5 * v1364 * pow(2, 10 * v1366) * sin((v1366 * p295 - v1365) * 2 * pi / v1363) + p293
					end

					return p293 + p294
				end

				return p293
			end,
			outInElastic = function(p298, p299, p300, p301, p302, p303)
				-- upvalues: v1066 (copy), v1065 (copy)
				if not (p298 < p301 / 2) then
					return v1065(p298 * 2 - p301, p299 + p300 / 2, p300 / 2, p301, p302, p303)
				end

				return v1066(p298 * 2, p299, p300 / 2, p301, p302, p303)
			end,
			inBack = v1067,
			outBack = v1068,
			inOutBack = function(p304, p305, p306, p307, p308)
				local v1390 = (p308 or 1.70158) * 1.525
				local v1391 = p304 / p307 * 2

				if not (v1391 < 1) then
					local v1392 = v1391 - 2

					return p306 / 2 * (v1392 * v1392 * ((v1390 + 1) * v1392 + v1390) + 2) + p305
				end

				return p306 / 2 * v1391 * v1391 * ((v1390 + 1) * v1391 - v1390) + p305
			end,
			outInBack = function(p309, p310, p311, p312, p313)
				-- upvalues: v1068 (copy), v1067 (copy)
				if not (p309 < p312 / 2) then
					return v1067(p309 * 2 - p312, p310 + p311 / 2, p311 / 2, p312, p313)
				end

				return v1068(p309 * 2, p310, p311 / 2, p312, p313)
			end,
			inBounce = v1070,
			outBounce = v1069,
			inOutBounce = function(p314, p315, p316, p317)
				-- upvalues: v1070 (copy), v1069 (copy)
				if not (p314 < p317 / 2) then
					return v1069(p314 * 2 - p317, 0, p316, p317) * 0.5 + p316 * 0.5 + p315
				end

				return v1070(p314 * 2, 0, p316, p317) * 0.5 + p315
			end,
			outInBounce = function(p318, p319, p320, p321)
				-- upvalues: v1069 (copy), v1070 (copy)
				if not (p318 < p321 / 2) then
					return v1070(p318 * 2 - p321, p319 + p320 / 2, p320 / 2, p321)
				end

				return v1069(p318 * 2, p319, p320 / 2, p321)
			end
		}

		local function v1071(p322, p323, p324)
			-- upvalues: v1071 (copy)
			if not p324 then
				p324 = p323
			end

			local mt = getmetatable(p323)

			if mt and getmetatable(p322) == nil then
				setmetatable(p322, mt)
			end

			for k, v in pairs(p323) do
				if type(v) ~= "table" then
					p322[k] = p324[k]
				else
					p322[k] = v1071({}, v, p324[k])
				end
			end

			return p322
		end
		local function v1072(p325, p326, p327)
			-- upvalues: v1071 (copy), v1072 (copy)
			if not p327 then
				p327 = {}
			end

			for k, v in pairs(p326) do
				local v1429 = type(v)
				local v1430 = v1071({}, p327)

				table.insert(v1430, tostring(k))

				if v1429 ~= "number" then
					if v1429 ~= "table" then
						assert(v1429 == "number", "Parameter '" .. table.concat(v1430, "/") .. "' must be a number or table of numbers")
					else
						v1072(p325[k], v, v1430)
					end
				else
					assert(type(p325[k]) == "number", "Parameter '" .. table.concat(v1430, "/") .. "' is missing from subject or isn't a number")
				end
			end
		end
		local function v1073(p328, p329, p330, p331)
			-- upvalues: v1072 (copy)
			assert(type(p328) == "number" and not (p328 <= 0), "duration must be a positive number. Was " .. tostring(p328))

			local v1435 = type(p329)

			assert(v1435 == "table" or v1435 == "userdata", "subject must be a table or userdata. Was " .. tostring(p329))
			assert(type(p330) == "table", "target must be a table. Was " .. tostring(p330))
			assert(type(p331) == "function", "easing must be a function. Was " .. tostring(p331))
			v1072(p329, p330)
		end
		local function v1074(p332)
			-- upvalues: t25 (copy)
			if not p332 then
				p332 = "linear"
			end

			if type(p332) == "string" then
				local v1437 = p332

				p332 = t25.easing[v1437]

				if type(p332) ~= "function" then
					error("The easing function name '" .. v1437 .. "' is invalid")
				end
			end

			return p332
		end
		local function v1075(p333, p334, p335, p336, p337, p338)
			-- upvalues: v1075 (copy)
			for k, v in pairs(p334) do
				if type(v) ~= "table" then
					p333[k] = p338(p336, p335[k], v - p335[k], p337)
				else
					v1075(p333[k], v, p335[k], p336, p337, p338)
				end
			end
		end

		local t26 = {}
		local t27 = {
			__index = t26
		}

		function t26.set(p339, p340)
			-- upvalues: v1071 (copy), v1075 (copy)
			assert(type(p340) == "number", "clock must be a positive number or 0")
			p339.initial = p339.initial or v1071({}, p339.target, p339.subject)
			p339.clock = p340

			if not (p339.clock <= 0) then
				if not (p339.clock >= p339.duration) then
					v1075(p339.subject, p339.target, p339.initial, p339.clock, p339.duration, p339.easing)
				else
					p339.clock = p339.duration
					v1071(p339.subject, p339.target)
				end
			else
				p339.clock = 0
				v1071(p339.subject, p339.initial)
			end

			return not (p339.clock < p339.duration)
		end
		function t26.reset(p341)
			return p341:set(0)
		end
		function t26.update(p342, p343)
			assert(type(p343) == "number", "dt must be a number")

			return p342:set(p342.clock + p343)
		end
		function t25.new(p344, p345, p346, p347)
			-- upvalues: v1074 (copy), v1073 (copy), t27 (copy)
			local v1455 = v1074(p347)

			v1073(p344, p345, p346, v1455)

			return setmetatable({
				clock = 0,
				duration = p344,
				subject = p345,
				target = p346,
				easing = v1455
			}, t27)
		end

		return t25
	end)()
	local t28 = {}
	local t29 = {
		state = 0,
		manual = 0,
		scope = 0,
		solixmodern = 0,
		line = 0
	}

	local function v544()
		-- upvalues: t28 (copy)
		for _, v in pairs(t28) do
			v:update(globals.frametime)
		end
	end

	local t30 = {
		name = "Solix",
		version = "Beta"
	}
	local t31 = {
		name_states = {
			[0] = "Standing",
			[1] = "Moving",
			[2] = "Air",
			[3] = "Crouching",
			[4] = "Slowwalk",
			[5] = "Air+C"
		}
	}
	local t32 = {
		onground_ticks = 0,
		in_air = function(p348)
			return bit.band(p348.m_fFlags, 1) == 0
		end,
		on_ground = function(p349, p350)
			if bit.band(p349.m_fFlags, 1) ~= 1 then
				_conditions_.onground_ticks = 0
			else
				_conditions_.onground_ticks = _conditions_.onground_ticks + 1
			end

			return not (p350 >= _conditions_.onground_ticks)
		end,
		velocity = function(p351)
			local m_vecVelocity = p351.m_vecVelocity

			return (math.sqrt(m_vecVelocity.x * m_vecVelocity.x + m_vecVelocity.y * m_vecVelocity.y))
		end,
		is_crouching = function(p352)
			return not (p352.m_flDuckAmount <= 0.8)
		end
	}
	local s4 = "stand"
	local v549 = true

	local function v550(p353)
		-- upvalues: t7 (copy)
		if p353 then
			local m_vecVelocity = p353.m_vecVelocity
			local v1088 = math.sqrt(m_vecVelocity.x * m_vecVelocity.x + m_vecVelocity.y * m_vecVelocity.y)
			local m_fFlags = p353.m_fFlags
			local v1090 = bit.band(m_fFlags, 1) == 1
			local v1091 = not (p353.m_flDuckAmount <= 0.8)

			if v1090 or not v1091 then
				if v1090 then
					if not v1091 then
						if not t7.sw:get() then
							if not (v1088 > 2) then
								return 0
							end

							return 1
						end

						return 4
					end

					return 3
				end

				return 2
			end

			return 5
		end

		return 0
	end

	events.createmove:set(function()
		-- upvalues: t32 (copy), v549 (copy), s4 (ref), t7 (copy)
		local v1092 = entity.get_local_player()

		if v1092 then
			local m_vecVelocity = v1092.m_vecVelocity
			local v1094 = math.floor(m_vecVelocity:length())

			if not (v1094 < 2) or t32.is_crouching(v1092) or t32.in_air(v1092) or not v549 then
				if not t7.sw:get() or t32.is_crouching(v1092) or t32.in_air(v1092) or not v549 then
					if not (v1094 > 2) or t7.sw:get() or t32.is_crouching(v1092) or t32.in_air(v1092) or not v549 then
						if not t32.is_crouching(v1092) or t32.in_air(v1092) or not v549 then
							if not t32.in_air(v1092) or t32.is_crouching(v1092) or not v549 then
								if t32.in_air(v1092) and t32.is_crouching(v1092) then
									s4 = "air+c"
								end
							else
								s4 = "air"
							end
						else
							s4 = "crouch"
						end
					else
						s4 = "move"
					end
				else
					s4 = "slowwalk"
				end
			else
				s4 = "stand"
			end

			return
		end
	end)
	events.createmove:set(function()
		-- upvalues: t32 (copy), v549 (copy), s4 (ref), t7 (copy)
		local v1095 = entity.get_local_player()

		if v1095 then
			local m_vecVelocity = v1095.m_vecVelocity
			local v1097 = math.floor(m_vecVelocity:length())

			if not (v1097 < 2) or t32.is_crouching(v1095) or t32.in_air(v1095) or not v549 then
				if not (v1097 > 2) or not t7.sw:get() or t32.is_crouching(v1095) or t32.in_air(v1095) or not v549 then
					if not (v1097 > 2) or t7.sw:get() or t32.is_crouching(v1095) or t32.in_air(v1095) or not v549 then
						if not t32.is_crouching(v1095) or t32.in_air(v1095) or not v549 then
							if not t32.in_air(v1095) or t32.is_crouching(v1095) or not v549 then
								if t32.in_air(v1095) and t32.is_crouching(v1095) then
									s4 = "air+c"
								end
							else
								s4 = "air"
							end
						else
							s4 = "crouch"
						end
					else
						s4 = "move"
					end
				else
					s4 = "slowwalk"
				end
			else
				s4 = "standing"
			end

			return
		end
	end)

	local v551 = render.load_font("nl\\solix\\Lora.ttf", 14, "adi")
	local v552 = render.load_font("nl\\solix\\Lora.ttf", 11, "ad")

	render.load_font("nl\\solix\\pixel.ttf", 10, "")

	local v553 = render.load_font("nl\\solix\\pixel.ttf", 10, "o")
	local t33 = {
		cross_indicators_1 = function(p354, p355, p356, p357, p358, p359, p360, _)
			render.text(2, vector(render.screen_size().x / 2 + p359, render.screen_size().y / 2 + 20 + p360), color(p355, p356, p357, p358), "c", p354)
		end,
		cross_indicators_2 = function(p362, p363, p364, p365, p366, p367, p368, _)
			render.text(1, vector(render.screen_size().x / 2 + p367, render.screen_size().y / 2 + 20 + p368), color(p363, p364, p365, p366), "c", p362)
		end,
		cross_indicators_3 = function(p370, p371, p372, p373, p374, p375, p376, _)
			-- upvalues: v551 (copy)
			render.text(v551, vector(render.screen_size().x / 2 + p375, render.screen_size().y / 2 + 20 + p376), color(p371, p372, p373, p374), "c", p370)
		end
	}
	local n21 = 0
	local n22 = 3
	local t34 = {}
	local n23 = 0
	local n24 = 0
	local n25 = 0
	local n26 = 0
	local n27 = 0
	local s5 = "standing"

	local function v564(p378, p379, p380)
		return p378 + (p379 - p378) * p380
	end
	local function v565(p381, p382, p383)
		return p383 < p381 and p383 or (p381 < p382 and p382 or p381)
	end
	local function v566(p384, p385, p386, p387, p388, p389, p390, p391, p392)
		local s6 = ""
		local v1138 = (p388 - p384) / (#p392 - 1)
		local v1139 = (p389 - p385) / (#p392 - 1)
		local v1140 = (p390 - p386) / (#p392 - 1)
		local v1141 = (p391 - p387) / (#p392 - 1)

		for i = 1, #p392 do
			s6 = s6 .. ("\a%02x%02x%02x%02x%s"):format(p384, p385, p386, p387, p392:sub(i, i))
			p384 = p384 + v1138
			p385 = p385 + v1139
			p386 = p386 + v1140
			p387 = p387 + v1141
		end

		return s6
	end
	local function v567(p393, p394, p395, p396, p397, p398, p399, p400, p401)
		-- upvalues: n24 (ref), n23 (ref), t34 (copy), n22 (copy), v565 (copy), t9 (copy)
		if n24 <= 0 then
			n23 = 0
		end

		if n24 <= 1 then
			n23 = n23 + 1
		end

		if not t34[p393] then
			t34[p393] = {}
		end

		for i = 1, n22 do
			if not t34[p393][i] then
				t34[p393][i] = 0
			end
		end

		local v1153 = entity.get_local_player()
		local v1154 = v1153 and v1153.m_bIsScoped or false

		if v1154 then
			t34[p393][1] = v565(t34[p393][1] - render.measure_text(p394, p395, p393).x / 30, 0, render.measure_text(p394, p395, p393).x / 2 + 2 + p401)
		else
			t34[p393][1] = v565(t34[p393][1] + render.measure_text(p394, p395, p393).x / 30, 0, render.measure_text(p394, p395, p393).x / 2 + 2 + p401)
		end

		if (not p396 or not v1153 or not v1153:is_alive()) and not (ui.get_alpha() > 0) or not t9.others.visuals.indicators_switch:get() then
			t34[p393][2] = v565(t34[p393][2] - 10, 0, 255)
			t34[p393][3] = v565(t34[p393][3] - 0.25, 0, 7)
		else
			t34[p393][3] = v565(t34[p393][3] + 0.25, 0, 7)

			if not v1154 or not t9.others.visuals.indicators_switch.adds:get("Fade on scope") then
				t34[p393][2] = v565(t34[p393][2] + 10, 0, 255)
			else
				t34[p393][2] = v565(t34[p393][2] + 10, 0, 125)
			end
		end

		n23 = n23 + t34[p393][3]

		if p397 then
			render.text(p394, vector(render.screen_size().x / 2 + 2 - t34[p393][1] + p400 + p401, render.screen_size().y / 2 + 7 + n23), color(p399.r, p399.g, p399.b, t34[p393][2]), p395, p393)
		end

		render.text(p394, vector(render.screen_size().x / 2 + 2 - t34[p393][1] + p401, render.screen_size().y / 2 + 7 + n23), color(p398.r, p398.g, p398.b, t34[p393][2]), p395, p393)
		n24 = n24 + 1
	end
	local function v568()
		-- upvalues: t9 (copy), n21 (ref), u538 (ref), t23 (copy), t28 (copy), v541 (copy), t29 (copy), t33 (copy), t30 (copy), v539 (copy), v550 (copy), t31 (copy), v552 (copy), t7 (copy), n24 (ref), n25 (ref), v565 (copy), n26 (ref), n27 (ref), v564 (copy), v567 (copy), v566 (copy), v553 (copy), t34 (copy), n23 (ref), s5 (copy)
		if t9.others.visuals.indicators_switch.typeindic:get() ~= "Modern" then
			n24 = 0

			local s7 = "READY"

			if rage.exploit:get() < 0.98 then
				s7 = "CHARGE"
			end

			if rage.exploit:get() == 0 then
				s7 = "ACTIVE"
			end

			local v1156 = entity.get_local_player()

			if not v1156 then
				return
			end

			if v1156.m_bIsScoped then
				n25 = v565(n25 - 2, -2, 24)
			else
				n25 = v565(n25 + 2, -2, 24)
			end

			local anti_aim = require("neverlose/anti_aim")

			n26 = math.abs(anti_aim.get_desync_delta()) / 1.2
			n27 = v564(n27, n26, globals.frametime * 3)

			if n27 > 58 then
				n27 = 58
			end

			if n27 < 5 then
				n27 = 5
			end

			local v1158 = false
			local v1159 = ui.get_binds()

			for i = 1, #v1159 do
				if v1159[i].name == "Minimum Damage" then
					v1158 = true
				end
			end

			local v1161 = "DT " .. s7

			if t7.dt:get() and t7.pa:get() then
				v1161 = "Idealtick"
			end

			local color2 = t9.others.visuals.indicators_switch.color

			v567("Solix" .. v566(color2:get().r, color2:get().g, color2:get().b, 255, color2:get().r, color2:get().g, color2:get().b, 255, "Beta") .. "", v553, "ba", true, false, color(255, 255, 255), color(133, 41, 16), 1, 0)

			local v1163 = t34["Solix" .. v566(color2:get().r, color2:get().g, color2:get().b, 255, color2:get().r, color2:get().g, color2:get().b, 255, "Beta") .. ""][2]

			if t9.others.visuals.indicators_switch.adds:get("Desync bar") then
				render.gradient(vector(render.screen_size().x / 2 - n25, render.screen_size().y / 2 + n23 + 18), vector(render.screen_size().x / 2 - n25 + 50 - 4, render.screen_size().y / 2 + n23 + 23), color(41, 41, 41, v1163), color(41, 41, 41, v1163), color(41, 41, 41, v1163), color(41, 41, 41, v1163), 4)
				render.gradient(vector(render.screen_size().x / 2 + 1 - n25, render.screen_size().y / 2 + n23 + 19), vector(render.screen_size().x / 2 - n25 + n27 - 5, render.screen_size().y / 2 + n23 + 22), color(color2:get().r, color2:get().g, color2:get().b, v1163), color(color2:get().r, color2:get().g, color2:get().b, v1163), color(color2:get().r, color2:get().g, color2:get().b, v1163), color(color2:get().r + 20, color2:get().g + 20, color2:get().b + 20, v1163), 4)
				n23 = n23 + 6
			end

			v567("" .. s5 .. "", v553, "ba", true, false, color(color2:get().r, color2:get().g, color2:get().b), color(39, 45, 139), 1, 0)
			v567(v1161, v553, "a", t7.dt:get(), false, color(255, 255, 255), color(111, 111, 111), 1, 0)
			v567("ONSHOT", v553, "a", t7.hs:get(), false, color(255, 255, 255), color(111, 111, 111), 1, 0)
			v567("AUTO", v553, "a", t7.pa:get() and not t7.dt:get(), false, color(255, 255, 255), color(111, 111, 111), 1, 0)
			v567("DMG", v553, "a", v1158, false, color(255, 255, 255), color(111, 111, 111), 1, 0)
		else
			local v1164 = entity.get_local_player()

			if v1164 == nil or not v1164:is_alive() then
				return
			end

			if v1164:get_player_weapon() == nil then
				return
			end

			local x5 = render.screen_size().x
			local y6 = render.screen_size().y
			local n28 = 0
			local m_bIsScoped = v1164.m_bIsScoped

			if not m_bIsScoped then
				n21 = u538(n21, 0, 0.023)
			elseif not (n21 < 1) then
				n21 = 1
			else
				n21 = u538(n21, 1.1, 0.023)
			end

			local v1169 = t9.others.visuals.indicators_switch.color:get()
			local v1170 = v1164:get_player_weapon():get_classname()
			local v1171 = t23.new("a_a", (v1170 == "CHEGrenade" or (v1170 == "CIncendiaryGrenade" or (v1170 == "CMolotovGrenade" or v1170 == "CSmokeGrenade"))) and 70 or 255, 0.057)

			t28.solixmodern = v541.new(0.2, t29, {
				solixmodern = m_bIsScoped and 46 or 0
			}, "linear")

			local solixmodern = t29.solixmodern

			t23.new("pulse", globals.tickcount % 20 > 2 and 255 or 100, 0.078)
			t33.cross_indicators_3(t30.name:lower(), 255, 255, 255, v1171, -12 + solixmodern, n28, true)
			t33.cross_indicators_3(t30.version:lower(), v1169.r, v1169.g, v1169.b, math.max(v539(0, 2), 0.2) * v1171, render.measure_text(1, "c", t30.name:lower()).x / 2 + 3 + solixmodern, n28, true)

			local v1173 = n28 + 12
			local v1174 = v550(v1164)
			local t35 = {
				[1] = {
					[1] = t31.name_states[v1174]:lower(),
					[2] = render.measure_text(v552, "c", t31.name_states[v1174]:lower()).x
				}
			}

			for _, v in ipairs(t35) do
				t28.state = v541.new(0.2, t29, {
					state = m_bIsScoped and v[2] / 2 + 11 or 0
				}, "linear")

				local state = t29.state

				render.text(v552, vector(render.screen_size().x / 2 + 1 + state, render.screen_size().y / 2 + 21 + v1173), color(255, 255, 255, v1171), "c", v[1])
				v1173 = v1173 + 12
			end

			t28.line = v541.new(0.2, t29, {
				line = m_bIsScoped and 27 or 0
			}, "linear")

			local line = t29.line

			render.gradient(vector(x5 / 2 - 15 + line, y6 / 2 + 18 + v1173), vector(x5 / 2 + 3 + line, y6 / 2 + 20 + v1173), color(v1169.r, v1169.g, v1169.b, 0), color(v1169.r, v1169.g, v1169.b, 255), color(v1169.r, v1169.g, v1169.b, 0), color(v1169.r, v1169.g, v1169.b, 255))
			render.gradient(vector(x5 / 2 + 3 + line, y6 / 2 + 18 + v1173), vector(x5 / 2 + 15 + line, y6 / 2 + 20 + v1173), color(v1169.r, v1169.g, v1169.b, 255), color(v1169.r, v1169.g, v1169.b, 0), color(v1169.r, v1169.g, v1169.b, 255), color(v1169.r, v1169.g, v1169.b, 0))

			local v1180 = v1173 + 12

			t23.new("dt_col", rage.exploit:get() == 1 and color(132, 210, 16) or color(255, 75, 75), 0.1)

			local t36 = {
				[1] = {
					text = "ping",
					color = {
						[1] = v1169.r,
						[2] = v1169.g,
						[3] = v1169.b
					},
					bool = not (t9.others.misc.fakelatency:get() <= 0),
					measure = render.measure_text(v552, "", "ping").x
				},
				[2] = {
					text = "da",
					color = {
						[1] = 255,
						[2] = 255,
						[3] = 255
					},
					bool = t7.dormant:get(),
					measure = render.measure_text(v552, "", "da").x
				},
				[3] = {
					text = "dt",
					color = {
						[1] = v1169.r,
						[2] = v1169.g,
						[3] = v1169.b
					},
					bool = t7.dt:get(),
					measure = render.measure_text(v552, "", "dt").x
				},
				[4] = {
					text = "min",
					color = {
						[1] = v1169.r,
						[2] = v1169.g,
						[3] = v1169.b
					},
					bool = get_bind("Min. Damage")[1],
					measure = render.measure_text(v552, "", "min").x
				},
				[5] = {
					text = "hc",
					color = {
						[1] = v1169.r,
						[2] = v1169.g,
						[3] = v1169.b
					},
					bool = get_bind("Hit Chance")[1],
					measure = render.measure_text(v552, "", "hc").x
				},
				[6] = {
					text = "osaa",
					color = {
						[1] = v1169.r,
						[2] = v1169.g,
						[3] = v1169.b
					},
					bool = t7.hs:get() and not t7.dt:get(),
					measure = render.measure_text(v552, "", "osaa").x
				},
				[7] = {
					text = "fs",
					color = {
						[1] = v1169.r,
						[2] = v1169.g,
						[3] = v1169.b
					},
					bool = t7.fs:get(),
					measure = render.measure_text(v552, "", "fs").x
				},
				[8] = {
					text = "body",
					color = {
						[1] = v1169.r,
						[2] = v1169.g,
						[3] = v1169.b
					},
					bool = t7.bodyaim:get() == "Force",
					measure = render.measure_text(v552, "", "body").x
				},
				[9] = {
					text = "safe",
					color = {
						[1] = v1169.r,
						[2] = v1169.g,
						[3] = v1169.b
					},
					bool = t7.safepoints:get() == "Force",
					measure = render.measure_text(v552, "", "safe").x
				}
			}

			for _, v in ipairs(t36) do
				local v1184 = t23.new("alpha_" .. v.text:lower(), t9.others.visuals.indicators_switch:get() and v.bool and 1 or 0, 0.02)
				local v1185 = string.format("%.0f", t23.new("anim_" .. v.text:lower(), v.bool and t9.others.visuals.indicators_switch:get() and 13 or 0, 0.092))

				render.text(v552, vector(x5 / 2 + 1 + (v.measure / 2 + 12) * n21, y6 / 2 + 17 + v1180), color(v.color[1], v.color[2], v.color[3], v1171 * v1184), "c", v.text:lower())
				v1180 = v1180 + v1185
			end
		end
	end

	events.render:set(function()
		-- upvalues: t9 (copy), v544 (copy), v568 (copy)
		if t9.others.visuals.indicators_switch:get() then
			v544()
			v568()

			return
		end
	end)
end)()
t9.antiaim = {
	extra = {
		forcedef = t9.menulist.antiaim.builder.defensive:switch("\226\128\138\v\f<shield>\a\r   \226\128\138\226\128\138Force LC")
	},
	hotkeys = {
		avoidbackstab = t9.menulist.antiaim.hotkeys:switch("\226\128\138\v\f<knife>\a\r  \226\128\138\226\128\138\226\128\138Avoid backstab"),
		freestanding = t9.menulist.antiaim.hotkeys:switch("\v\f<person-walking-arrow-loop-left>\r  \226\128\138\226\128\138Freestanding", false, function(p402)
			return {
				freestanding_disablers = p402:selectable("\v•  \r Disablers", {
					[1] = " \v\239\134\131     \226\128\138\226\128\138\rStand",
					[2] = "\v\239\156\140    \226\128\138\226\128\138\226\128\138\rMove",
					[3] = "\226\128\138\v\239\149\148     \226\128\138\226\128\138\rSlow Walk",
					[4] = "\226\128\138\v\239\134\147   \226\128\138\226\128\138\rCrouch",
					[5] = "\226\128\138\v\238\139\142   \226\128\138\226\128\138\226\128\138\rCrouch Move",
					[6] = "\226\128\138\v\238\149\134    \226\128\138\226\128\138\rAir",
					[7] = "\226\128\138\v\238\149\135  \226\128\138\226\128\138\rAir+"
				}),
				yawmodifier = p402:switch("\v•  \r Force static"),
				freestand_bait = p402:switch("\v•  \r FS Bait")
			}
		end)
	},
	exploits = {
		defensive_flick = t9.menulist.antiaim.exploits:switch("\v\f<keycdn>\a\r\226\128\138\226\128\138\226\128\138\226\128\138\226\128\138\226\128\138\226\128\138Flick Exploit", false, function(p403)
			local t37 = {
				pitch = p403:combo("\v•  \r Pitch", {
					[1] = "Down",
					[2] = "Zero",
					[3] = "Up",
					[4] = "Flow"
				}),
				yaw = p403:combo("\v•  \r Yaw", {
					[1] = "Default",
					[2] = "Minimal",
					[3] = "Extended",
					[4] = "Random"
				}),
				unmatched_mode = p403:switch("\v•  \r Legit Mode"),
				time = p403:slider("\v•  \r Ticks", 1, 20, 4, 1, function(p404)
					return p404 .. "t"
				end),
				options = p403:selectable("\v•  \r Options \n defensive flick", {
					[1] = "Jitter"
				})
			}

			t37.time:depend({
				[2] = false,
				[1] = t37.unmatched_mode
			})

			return t37, true
		end),
		safe_head = t9.menulist.antiaim.exploits:switch("\226\128\138\v\f<user-helmet-safety>\a\r\226\128\138\226\128\138\226\128\138\226\128\138\226\128\138\226\128\138\226\128\138Safe Head", false, function(p405)
			return {
				weapons = p405:selectable("\226\128\138\v\f<gun>\r \226\128\138\226\128\138\226\128\138Weapons", {
					[1] = "Knife",
					[2] = "Zeus",
					[3] = "Grenade"
				}),
				safehead_flick = p405:switch("\226\128\138\v\f<shield>\r  \226\128\138\226\128\138\226\128\138Flick")
			}
		end),
		slx_anim = t9.menulist.antiaim.exploits:switch("\226\128\138\v\f<street-view>\r\226\128\138\226\128\138\226\128\138\226\128\138\226\128\138\226\128\138Anim Breaker", false, nil, function(p406)
			local t38 = {
				jitter_combo = p406:combo("\226\128\138\v\f<person-running>\r  \226\128\138 Ground", "Disabled", "Static", "Walking", "Fast Jitter", "Slow Jitter"),
				slider_jitter = p406:slider("\226\128\138\v\f<pen-nib>\r   Slider", 0, 100, 80),
				air_combo = p406:combo("\226\128\138\226\128\138\v\f<child-dress>\r\226\128\138\226\128\138\226\128\138\226\128\138\226\128\138\226\128\138Air", "Disabled", "Static", "Kangaroo", "Walking"),
				walk_combo = p406:combo("\226\128\138\226\128\138\v\f<person-walking-with-cane>\r  \226\128\138\226\128\138Slow Walking", "Disabled", "Static", "Jitter"),
				other_combo = p406:selectable(" \v\f<gear>\r   Additions", "Pitch 0 on land", "Earthquake", "Arrested", "Goblin", "Pooping", "Wave", "Flashed", "Ultimate Safe Head", "Smoothing")
			}

			t38.slider_jitter:visibility(t38.jitter_combo:get() == "Slow Jitter")
			t38.jitter_combo:set_callback(function()
				-- upvalues: t38 (copy)
				t38.slider_jitter:visibility(t38.jitter_combo:get() == "Slow Jitter")
			end)

			return t38
		end)
	},
	angels = {
		selector = t9.menulist.antiaim.builder.conditions:combo("\226\128\138\v\f<chart-bar>\a\r   \226\128\138States", t9.reference.antiaim.conditions)
	}
}
t9.profile.selector:set(2)

local function v98()
	-- upvalues: t9 (copy)
	local t39 = {
		[1] = nil,
		[2] = 1,
		[1] = t9.profile.selector
	}
	local t40 = {
		[1] = nil,
		[2] = 2,
		[1] = t9.profile.selector
	}

	t9.profile.user:depend(t39)
	t9.profile.build:depend(t39)
	t9.profile.update:depend(t39)
	t9.profile.user_button:depend(t39)
	t9.profile.build_button:depend(t39)
	t9.profile.update_button:depend(t39)
	t9.profile.show_online_users:depend(t39)
	t9.profile.config_list:depend(t40)
	t9.profile.input:depend(t40)
	t9.profile.load:depend(t40)
	t9.profile.import:depend(t40)
	t9.profile.export:depend(t40)
	t9.profile.create:depend(t40)
	t9.profile.save:depend(t40)
	t9.profile.delete:depend(t40)
end

v98()
t9.profile.selector:set_callback(function()
	-- upvalues: v98 (copy)
	v98()
end)
t9.others.selector:set(1);
(function()
	-- upvalues: t9 (copy)
	local _ = {
		[1] = nil,
		[2] = 1,
		[1] = t9.others.selector
	}
	local _ = {
		[1] = nil,
		[2] = 2,
		[1] = t9.others.selector
	}
	local _ = {
		[1] = nil,
		[2] = 3,
		[1] = t9.others.selector
	}
end)()
solix_builder = {}

for i, _ in ipairs(t9.reference.antiaim.conditions) do
	solix_builder[i] = {}
	solix_builder[i].override = t9.menulist.antiaim.builder.conditions:switch("\226\128\138\v\f<share>\a\r\226\128\138\226\128\138\226\128\138\226\128\138\226\128\138Override \a[gray]States"):depend({
		[1] = t9.antiaim.angels.selector,
		[2] = t9.reference.antiaim.conditions[i]
	})
	solix_builder[i].yaw = t9.menulist.antiaim.builder.yaw:combo("\226\128\138\v\f<list>\a\r   \226\128\138Yaw", {
		[1] = "default",
		[2] = "L/R",
		[3] = "Tick Switcher"
	}):depend(solix_builder[i].override, {
		[1] = t9.antiaim.angels.selector,
		[2] = t9.reference.antiaim.conditions[i]
	})
	solix_builder[i].yaw_base = t9.menulist.antiaim.builder.yaw:slider("\226\128\138\v\f<arrows-turn-to-dots>\r  \226\128\138\226\128\138Yaw Base\n" .. t9.reference.antiaim.conditions[i], 1, 2, 1, 1, function(p407)
		if p407 ~= 1 then
			if p407 ~= 2 then
				return
			end

			return "Local View"
		end

		return "At Targets"
	end):depend(solix_builder[i].override, {
		[1] = t9.antiaim.angels.selector,
		[2] = t9.reference.antiaim.conditions[i]
	})
	solix_builder[i].yaw_default_value = t9.menulist.antiaim.builder.yaw:slider("\v\f<terminal>\a\r   \226\128\138Value", -90, 90, 0):depend(solix_builder[i].override, {
		[1] = t9.antiaim.angels.selector,
		[2] = t9.reference.antiaim.conditions[i]
	}, {
		[1] = nil,
		[2] = "default",
		[1] = solix_builder[i].yaw
	})
	solix_builder[i].yaw_left_value = t9.menulist.antiaim.builder.yaw:slider("\226\128\138\v\f<arrow-left>\a\r    \226\128\138Left", -90, 90, 0):depend(solix_builder[i].override, {
		[1] = t9.antiaim.angels.selector,
		[2] = t9.reference.antiaim.conditions[i]
	}, {
		[1] = nil,
		[2] = "L/R",
		[3] = "Tick Switcher",
		[1] = solix_builder[i].yaw
	})
	solix_builder[i].yaw_right_value = t9.menulist.antiaim.builder.yaw:slider("\226\128\138\v\f<arrow-right>\a\r    \226\128\138Right", -90, 90, 0):depend(solix_builder[i].override, {
		[1] = t9.antiaim.angels.selector,
		[2] = t9.reference.antiaim.conditions[i]
	}, {
		[1] = nil,
		[2] = "L/R",
		[3] = "Tick Switcher",
		[1] = solix_builder[i].yaw
	})
	solix_builder[i].yaw_delay_enable1 = t9.menulist.antiaim.builder.yaw:switch("\v\f<wave-triangle>\a\r   Delayed", false, function(p408)
		return {
			ticks = p408:slider("Ticks", 1, 32, 2)
		}
	end):depend(solix_builder[i].override, {
		[1] = t9.antiaim.angels.selector,
		[2] = t9.reference.antiaim.conditions[i]
	}, {
		[1] = nil,
		[2] = "L/R",
		[3] = "Tick Switcher",
		[1] = solix_builder[i].yaw
	})
	solix_builder[i].yaw_modifier = t9.menulist.antiaim.builder.yaw_mod:combo("\226\128\138\v\f<list>\a\r  \226\128\138\226\128\138Modifiers", {
		[1] = "disabled",
		[2] = "center",
		[3] = "offset",
		[4] = "random",
		[5] = "spin",
		[6] = "3-way",
		[7] = "5-way"
	}):depend(solix_builder[i].override, {
		[1] = t9.antiaim.angels.selector,
		[2] = t9.reference.antiaim.conditions[i]
	})
	solix_builder[i].yaw_modifier_value = t9.menulist.antiaim.builder.yaw_mod:slider("\v\f<terminal>\a\r   \226\128\138Value", -90, 90, 0):depend(solix_builder[i].override, {
		[1] = t9.antiaim.angels.selector,
		[2] = t9.reference.antiaim.conditions[i]
	})
	solix_builder[i].body_yaw = t9.menulist.antiaim.builder.yaw:selectable("\v\f<people-arrows>\a\r \226\128\138\226\128\138\226\128\138\226\128\138Body Yaw", {
		[1] = "Avoid Overlap",
		[2] = "Jitter",
		[3] = "Randomize Jitter",
		[4] = "Anti Bruteforce"
	}, false, function(p409)
		-- upvalues: i (copy), t9 (copy)
		return {
			yaw_delay_enable = p409:slider("\v•  \r Delay", 1, 10, 0, 1, "t"):depend(solix_builder[i].override, {
				[1] = t9.antiaim.angels.selector,
				[2] = t9.reference.antiaim.conditions[i]
			}),
			body_yaw_value = p409:slider("\v•  \r Left", 0, 58, 0, 1, "°"):depend(solix_builder[i].override, {
				[1] = t9.antiaim.angels.selector,
				[2] = t9.reference.antiaim.conditions[i]
			}),
			body_yaw_value2 = p409:slider("\v•  \r Right", 0, 58, 0, 1, "°"):depend(solix_builder[i].override, {
				[1] = t9.antiaim.angels.selector,
				[2] = t9.reference.antiaim.conditions[i]
			}),
			body_yaw_randomization = p409:slider("\v•  \r Randomize", 0, 100, 0, 1, "%"):depend(solix_builder[i].override, {
				[1] = t9.antiaim.angels.selector,
				[2] = t9.reference.antiaim.conditions[i]
			})
		}
	end):depend(solix_builder[i].override, {
		[1] = t9.antiaim.angels.selector,
		[2] = t9.reference.antiaim.conditions[i]
	})
	solix_builder[i].defensive_label = t9.menulist.antiaim.builder.defensive:label("\226\128\138\v\f<shield>\a\r   \226\128\138\226\128\138Defensive Builder", function(p410)
		-- upvalues: i (copy), t9 (copy)
		local v754 = p410:switch("\v•  \rEnable"):depend(solix_builder[i].override, {
			[1] = t9.antiaim.angels.selector,
			[2] = t9.reference.antiaim.conditions[i]
		})
		local v755 = p410:switch("\v•  \rWhen Hittable"):depend(solix_builder[i].override, {
			[1] = t9.antiaim.angels.selector,
			[2] = t9.reference.antiaim.conditions[i]
		})
		local v756 = p410:switch("\v•  \rOn OSAA"):depend(solix_builder[i].override, {
			[1] = t9.antiaim.angels.selector,
			[2] = t9.reference.antiaim.conditions[i]
		})
		local v757 = p410:combo("\v•  \rPitch", {
			[1] = "Disabled",
			[2] = "Custom",
			[3] = "Up",
			[4] = "Down",
			[5] = "Zero",
			[6] = "Random",
			[7] = "Progressive",
			[8] = "Pulse",
			[9] = "Random Pulse",
			[10] = "Adaptive Pulse",
			[11] = "Zig Zag",
			[12] = "Sway",
			[13] = "Chaos",
			[14] = "Microflick",
			[15] = "L/R",
			[16] = "Tick Jitter",
			[17] = "Sine Wave",
			[18] = "Exponential",
			[19] = "Spiral",
			[20] = "Waveform",
			[21] = "Neural Network",
			[22] = "Gravity Well"
		}):depend(solix_builder[i].override, {
			[1] = t9.antiaim.angels.selector,
			[2] = t9.reference.antiaim.conditions[i]
		})
		local v758 = p410:switch("\v\f<arrow-turn-down-right> \r Min/Max"):depend(solix_builder[i].override, {
			[1] = t9.antiaim.angels.selector,
			[2] = t9.reference.antiaim.conditions[i]
		})
		local v759 = p410:slider("\v\f<arrow-turn-down-right> \r Value", -89, 89, 85):depend(solix_builder[i].override, {
			[1] = t9.antiaim.angels.selector,
			[2] = t9.reference.antiaim.conditions[i]
		})
		local v760 = p410:slider("\v\f<arrow-turn-down-right> \r From", -89, 89, -45):depend(solix_builder[i].override, {
			[1] = t9.antiaim.angels.selector,
			[2] = t9.reference.antiaim.conditions[i]
		})
		local v761 = p410:slider("\v\f<arrow-turn-down-right> \r To", -89, 89, 45):depend(solix_builder[i].override, {
			[1] = t9.antiaim.angels.selector,
			[2] = t9.reference.antiaim.conditions[i]
		})
		local v762 = p410:slider("\v\f<arrow-turn-down-right> \r Speed", 0.1, 10, 1):depend(solix_builder[i].override, {
			[1] = t9.antiaim.angels.selector,
			[2] = t9.reference.antiaim.conditions[i]
		})
		local v763 = p410:slider("\v\f<arrow-turn-down-right> \r Pitch Ticks", 0, 32, 2):depend(solix_builder[i].override, {
			[1] = t9.antiaim.angels.selector,
			[2] = t9.reference.antiaim.conditions[i]
		})
		local v764 = p410:combo("\v•  \rYaw", {
			[1] = "Disabled",
			[2] = "Spin",
			[3] = "Spin v2",
			[4] = "Sideways",
			[5] = "Random",
			[6] = "Progressive",
			[7] = "Sticky Oscillator",
			[8] = "Chaos",
			[9] = "L/R",
			[10] = "Tick Jitter",
			[11] = "Weighted Jitter",
			[12] = "Fade Jitter",
			[13] = "Sway",
			[14] = "Random Step",
			[15] = "Helix",
			[16] = "Echo Chamber",
			[17] = "Resonance"
		}):depend(solix_builder[i].override, {
			[1] = t9.antiaim.angels.selector,
			[2] = t9.reference.antiaim.conditions[i]
		})
		local v765 = p410:switch("\v\f<arrow-turn-down-right> \r Min/Max"):depend(solix_builder[i].override, {
			[1] = t9.antiaim.angels.selector,
			[2] = t9.reference.antiaim.conditions[i]
		})

		return {
			enable = v754,
			when_hittable = v755,
			osaa = v756,
			pitch = v757,
			pitch_min_max = v758,
			pitch_angle = v759,
			pitch_speed = v762,
			pitch_left_value = v760,
			pitch_right_value = v761,
			pitch_ticks_value = v763,
			yaw = v764,
			yaw_min_max = v765,
			yaw_angle = p410:slider("\v\f<arrow-turn-down-right> \r Value", -180, 180, 90):depend(solix_builder[i].override, {
				[1] = t9.antiaim.angels.selector,
				[2] = t9.reference.antiaim.conditions[i]
			}),
			yaw_speed = p410:slider("\v\f<arrow-turn-down-right> \r Speed", 0.1, 10, 1):depend(solix_builder[i].override, {
				[1] = t9.antiaim.angels.selector,
				[2] = t9.reference.antiaim.conditions[i]
			}),
			yaw_left_value = p410:slider("\v\f<arrow-turn-down-right> \r From", -180, 180, -90):depend(solix_builder[i].override, {
				[1] = t9.antiaim.angels.selector,
				[2] = t9.reference.antiaim.conditions[i]
			}),
			yaw_right_value = p410:slider("\v\f<arrow-turn-down-right> \r To", -180, 180, 90):depend(solix_builder[i].override, {
				[1] = t9.antiaim.angels.selector,
				[2] = t9.reference.antiaim.conditions[i]
			}),
			ticks_def = p410:slider("\v\f<arrow-turn-down-right> \r Ticks", 0, 32, 2):depend(solix_builder[i].override, {
				[1] = t9.antiaim.angels.selector,
				[2] = t9.reference.antiaim.conditions[i]
			}, {
				[1] = nil,
				[2] = "Tick Jitter",
				[1] = v764
			})
		}
	end):depend(solix_builder[i].override, {
		[1] = t9.antiaim.angels.selector,
		[2] = t9.reference.antiaim.conditions[i]
	})
end

local function v101()
	-- upvalues: t9 (copy)
	for i, _ in ipairs(t9.reference.antiaim.conditions) do
		local v582 = solix_builder[i].defensive_label.yaw:get()
		local v583 = solix_builder[i].defensive_label.pitch:get()

		solix_builder[i].defensive_label.pitch_angle:visibility(v583 ~= "Disabled" and (v583 ~= "Down" and (v583 ~= "Up" and (v583 ~= "Zero" and not solix_builder[i].defensive_label.pitch_min_max:get()))))
		solix_builder[i].defensive_label.pitch_min_max:visibility(v583 ~= "Disabled" and (v583 ~= "Down" and (v583 ~= "Up" and v583 ~= "Zero")))
		solix_builder[i].defensive_label.pitch_speed:visibility(v583 ~= "Disabled" and (v583 == "Progressive" or (v583 == "Pulse" or (v583 == "Zig Zag" or (v583 == "Random Pulse" or (v583 == "Sway" or (v583 == "Microflick" or (v583 == "Adaptive Pulse" or (v583 == "Sine Wave" or (v583 == "Exponential" or (v583 == "Spiral" or (v583 == "Waveform" or (v583 == "Neural Network" or v583 == "Gravity Well")))))))))))))
		solix_builder[i].defensive_label.yaw_min_max:visibility(v582 ~= "Disabled" and (v582 == "Random" or (v582 == "Progressive" or (v582 == "Sideways" or (v582 == "L/R" or (v582 == "Tick Jitter" or (v582 == "Weighted Jitter" or (v582 == "Sway" or (v582 == "Fade Jitter" or (v582 == "Random Step" or (v582 == "Helix" or (v582 == "Echo Chamber" or v582 == "Resonance"))))))))))))
		solix_builder[i].defensive_label.yaw_angle:visibility(v582 ~= "Disabled" and ((v582 == "Random" or (v582 == "Progressive" or (v582 == "Sideways" or (v582 == "L/R" or (v582 == "Tick Jitter" or (v582 == "Weighted Jitter" or (v582 == "Sway" or (v582 == "Fade Jitter" or (v582 == "Random Step" or (v582 == "Helix" or (v582 == "Echo Chamber" or v582 == "Resonance"))))))))))) and not solix_builder[i].defensive_label.yaw_min_max:get()))
		solix_builder[i].defensive_label.yaw_speed:visibility(v582 ~= "Disabled" and (v582 == "Spin" or (v582 == "Spin v2" or (v582 == "Progressive" or (v582 == "Random Step" or (v582 == "Sway" or (v582 == "Helix" or (v582 == "Echo Chamber" or v582 == "Resonance"))))))))
		solix_builder[i].defensive_label.yaw_left_value:visibility(v582 ~= "Disabled" and ((v582 == "Random" or (v582 == "Progressive" or (v582 == "Sideways" or (v582 == "L/R" or (v582 == "Tick Jitter" or (v582 == "Weighted Jitter" or (v582 == "Sway" or (v582 == "Fade Jitter" or (v582 == "Random Step" or (v582 == "Helix" or (v582 == "Echo Chamber" or v582 == "Resonance"))))))))))) and solix_builder[i].defensive_label.yaw_min_max:get()))
		solix_builder[i].defensive_label.yaw_right_value:visibility(v582 ~= "Disabled" and ((v582 == "Random" or (v582 == "Progressive" or (v582 == "Sideways" or (v582 == "L/R" or (v582 == "Tick Jitter" or (v582 == "Weighted Jitter" or (v582 == "Sway" or (v582 == "Fade Jitter" or (v582 == "Random Step" or (v582 == "Helix" or (v582 == "Echo Chamber" or v582 == "Resonance"))))))))))) and solix_builder[i].defensive_label.yaw_min_max:get()))
		solix_builder[i].defensive_label.ticks_def:visibility(v582 ~= "Disabled" and v582 == "Tick Jitter")
		solix_builder[i].defensive_label.pitch_left_value:visibility(v583 ~= "Disabled" and (v583 ~= "Down" and (v583 ~= "Up" and (v583 ~= "Zero" and solix_builder[i].defensive_label.pitch_min_max:get()))))
		solix_builder[i].defensive_label.pitch_right_value:visibility(v583 ~= "Disabled" and (v583 ~= "Down" and (v583 ~= "Up" and (v583 ~= "Zero" and solix_builder[i].defensive_label.pitch_min_max:get()))))
		solix_builder[i].defensive_label.pitch_ticks_value:visibility(v583 ~= "Disabled" and v583 == "Tick Jitter")
	end
end
local function v102()
	-- upvalues: t7 (copy), t9 (copy)
	local v584 = entity.get_local_player()

	if v584 and v584:is_alive() then
		local m_fFlags = v584.m_fFlags
		local m_flDuckAmount = v584.m_flDuckAmount
		local m_vecVelocity = v584.m_vecVelocity
		local v588 = math.sqrt(m_vecVelocity.x ^ 2 + m_vecVelocity.y ^ 2)
		local v589 = bit.band(m_fFlags, 1) == 1
		local v590 = not (m_flDuckAmount <= 0.7)
		local v591 = not (v588 <= 5)

		if not t7.fakeduck:get() then
			if v589 or not v590 then
				if v589 then
					if not v590 or not v591 then
						if not v590 then
							if not v589 or not t7.sw:get() or not v591 then
								if not v589 or v591 then
									if not v589 or not v591 then
										return t9.reference.antiaim.conditions[1]
									end

									return t9.reference.antiaim.conditions[3]
								end

								return t9.reference.antiaim.conditions[2]
							end

							return t9.reference.antiaim.conditions[4]
						end

						return t9.reference.antiaim.conditions[5]
					end

					return t9.reference.antiaim.conditions[6]
				end

				return t9.reference.antiaim.conditions[7]
			end

			return t9.reference.antiaim.conditions[8]
		end

		return t9.reference.antiaim.conditions[10]
	end

	return "not connected"
end
local function v103()
	-- upvalues: v102 (copy), t9 (copy)
	local v592 = v102()

	for i = 2, #t9.reference.antiaim.conditions do
		if solix_builder[i].override:get() and v592 == t9.reference.antiaim.conditions[i] then
			return i
		end
	end

	return 1
end
local function v104(p411, p412, p413, p414)
	-- upvalues: t7 (copy)
	local v598 = not (globals.tickcount % (8 + p414 / 2) <= 4 + p414 / 4)

	t7.options:override({})

	if p411.send_packet and p411.choked_commands < 1 then
		t7.yawoffset:override(v598 and p412 or p413)
		t7.inverter:override(v598)
	end
end
local function v105(_, p416, p417, p418)
	-- upvalues: n2 (ref), t7 (copy)
	n2 = not (p418 >= globals.client_tick % 30)

	if not n2 then
		t7.yawoffset:override(p417)
	else
		t7.yawoffset:override(p416)
	end
end
local function v106(_, p420, p421)
	-- upvalues: t7 (copy)
	t7.options:override("jitter")
	t7.yawoffset:override(rage.antiaim:inverter() and p420 or p421)
	t7.inverter:override(false)
end
local function v107(p422, p423)
	local v608 = p422 - p422 * p423 / 100
	local v609 = p422 + p422 * p423 / 100

	return math.random(v608, v609)
end
local function v108(p424, p425)
	-- upvalues: t7 (copy), v107 (copy), v104 (copy), v106 (copy), v105 (copy), t9 (copy)
	t7.enableaanl:override(true)
	t7.pitch:override("down")
	t7.yaw:override("backward")
	t7.base:override(solix_builder[p425].yaw_base:get() == 1 and "At Target" or "Local view")
	t7.bodyyaw:override(true)

	local v612 = solix_builder[p425].yaw:get()
	local v613 = solix_builder[p425].yaw_modifier:get()
	local v614 = solix_builder[p425].yaw_modifier_value:get()
	local v615 = solix_builder[p425].body_yaw:get()
	local v616 = solix_builder[p425].body_yaw.yaw_delay_enable:get()
	local v617 = solix_builder[p425].body_yaw.body_yaw_value:get()
	local v618 = solix_builder[p425].body_yaw.body_yaw_value2:get()
	local v619 = solix_builder[p425].body_yaw.body_yaw_randomization:get() / 100
	local tickcount = globals.tickcount
	local v621 = not rage.antiaim:inverter()

	local function v622(p426)
		-- upvalues: v619 (copy), v107 (copy)
		return v619 > 0 and v107(p426, v619 * 100) or p426
	end;

	(function()
		-- upvalues: v622 (copy), v617 (copy), v618 (copy), v615 (copy), t7 (copy), v621 (copy), tickcount (copy), v616 (copy)
		local v1188 = v622(v617)
		local v1189 = v622(v618)
		local s8

		if v615 ~= "Avoid Overlap" then
			if v615 ~= "Jitter" then
				if v615 ~= "Randomize Jitter" then
					if v615 ~= "Anti Bruteforce" then
						s8 = "static"
						t7.inverter:override(v621)
						t7.leftlimit:override(v1188)
						t7.rightlimit:override(v1189)
					else
						s8 = "jitter"

						local v1191 = tickcount % 8 < 4 and v1188 or v1189

						if rage.antiaim:is_bruteforced() then
							v1191 = -v1191
						end

						t7.inverter:override(not (tickcount % 8 >= 4))
						t7.leftlimit:override(v1191)
						t7.rightlimit:override(v1191)
					end
				else
					s8 = "jitter"

					local v1192 = math.random(v1188, v1189)

					t7.inverter:override(not (tickcount % 6 >= 3))
					t7.leftlimit:override(v1192)
					t7.rightlimit:override(v1192)
				end
			else
				s8 = "jitter"

				local v1193 = tickcount % 4 < 2 and v1188 or v1189

				t7.inverter:override(not (tickcount % 4 >= 2))
				t7.leftlimit:override(v1193)
				t7.rightlimit:override(v1193)
			end
		else
			s8 = "static"
			t7.inverter:override(v621)
			t7.leftlimit:override(v1188)
			t7.rightlimit:override(v1189)
		end

		if v616 > 1 then
			local v1194 = math.floor(tickcount / v616) % 2 == 0

			t7.inverter:override(v1194)
		end

		t7.options:override(s8)
	end)()

	if v612 ~= "L/R" then
		if v612 ~= "Tick Switcher" then
			t7.options:override("static")
			t7.yawoffset:override(solix_builder[p425].yaw_default_value:get())
		else
			v105(p424, solix_builder[p425].yaw_left_value:get(), solix_builder[p425].yaw_right_value:get(), solix_builder[p425].yaw_delay_enable1.ticks:get())
		end
	elseif not solix_builder[p425].yaw_delay_enable1:get() then
		v106(p424, solix_builder[p425].yaw_left_value:get(), solix_builder[p425].yaw_right_value:get())
	else
		v104(p424, solix_builder[p425].yaw_left_value:get(), solix_builder[p425].yaw_right_value:get(), solix_builder[p425].yaw_delay_enable1.ticks:get())
	end

	if v613 == "disabled" then
		t7.modifier:override("disabled")
		t7.modoffset:override(0)
	elseif not solix_builder[p425].yaw_delay_enable1:get() then
		t7.modifier:override(v613)
		t7.modoffset:override(v614)
	else
		t7.modifier:override(v613)
		t7.modoffset:override(v614)
	end

	t7.backstab:override(t9.antiaim.hotkeys.avoidbackstab:get())
end
local function v109(p427)
	-- upvalues: t9 (copy), t7 (copy)
	if not t9.antiaim.extra.forcedef:get(p427 - 1) then
		t7.dtlag:override("On Peek")
	else
		t7.dtlag:override("Always On")
	end
end
local function v110(p428, p429, p430, p431, p432, p433, p434)
	local v631 = entity.get_local_player()

	if v631 and v631:is_alive() then
		local tickcount = globals.tickcount
		local curtime = globals.curtime
		local x6 = v631.m_vecVelocity.x
		local y7 = v631.m_vecVelocity.y
		local v636 = math.sqrt(x6 * x6 + y7 * y7)
		local v637 = p428:get()
		local v638 = p429:get()
		local v639 = p430:get()
		local v640 = p431:get()
		local v641 = p432:get()
		local v642 = p433:get()
		local v643 = p434:get()

		if v637 ~= "Disabled" then
			if v637 ~= "Up" then
				if v637 ~= "Down" then
					if v637 ~= "Zero" then
						if v637 ~= "Custom" then
							if v637 ~= "Random" then
								if v637 ~= "Progressive" then
									if v637 ~= "Pulse" then
										if v637 ~= "Zig Zag" then
											if v637 ~= "Random Pulse" then
												if v637 ~= "Adaptive Pulse" then
													if v637 ~= "Sway" then
														if v637 ~= "Chaos" then
															if v637 ~= "Microflick" then
																if v637 ~= "L/R" then
																	if v637 ~= "Tick Jitter" then
																		if v637 ~= "Sine Wave" then
																			if v637 ~= "Exponential" then
																				if v637 ~= "Spiral" then
																					if v637 ~= "Waveform" then
																						if v637 ~= "Neural Network" then
																							if v637 ~= "Gravity Well" then
																								return 0
																							end

																							if not v638 then
																								local v644 = 1 / (1 + math.abs(math.sin(curtime * v640 * 1.7)))

																								return math.sin(curtime * v640 * 2.6) * v644 * v639
																							end

																							local v645 = 1 / (1 + math.abs(math.sin(curtime * v640 * 1.7)))
																							local v646 = math.sin(curtime * v640 * 2.6) * v645

																							return v641 + (v642 - v641) * (v646 + 1) * 0.5
																						end

																						if not v638 then
																							local v647 = math.sin(curtime * v640 * 2.8)
																							local v648 = math.tanh(v647 * 0.7)

																							return math.sin(v648 * v640 * 1.6) * v639
																						end

																						local v649 = math.sin(curtime * v640 * 2.8)
																						local v650 = math.tanh(v649 * 0.7)
																						local v651 = math.sin(v650 * v640 * 1.6)

																						return v641 + (v642 - v641) * (v651 + 1) * 0.5
																					end

																					if not v638 then
																						return (math.sin(curtime * v640 * 2.3) + math.sin(curtime * v640 * 1.9 * 2.7)) * 0.5 * v639
																					end

																					local v652 = (math.sin(curtime * v640 * 2.3) + math.sin(curtime * v640 * 1.9 * 2.7)) * 0.5

																					return v641 + (v642 - v641) * (v652 + 1) * 0.5
																				end

																				if not v638 then
																					return math.sin(curtime * v640 * 2.1) * math.cos(curtime * v640 * 1.7) * v639
																				end

																				return math.sin(curtime * v640 * 2.1) * math.cos(curtime * v640 * 1.7) * (v642 - v641) * 0.5 + (v641 + v642) * 0.5
																			end

																			if not v638 then
																				return v639 * ((math.exp(math.sin(curtime * v640 * 1.8) * 0.5) - 1) / (math.exp(0.5) - 1))
																			end

																			local v653 = math.exp(math.sin(curtime * v640 * 1.8) * 0.5) - 1

																			return v641 + (v642 - v641) * (v653 / (math.exp(0.5) - 1))
																		end

																		if not v638 then
																			return math.sin(curtime * v640 * 2.5) * v639
																		end

																		return math.sin(curtime * v640 * 2.5) * (v642 - v641) * 0.5 + (v641 + v642) * 0.5
																	end

																	if not v638 then
																		return tickcount % v643 < 4 and v639 or -v639
																	end

																	return tickcount % v643 < 4 and v641 or v642
																end

																if not v638 then
																	return tickcount % 4 < 2 and v639 or -v639
																end

																return tickcount % 4 < 2 and v641 or v642
															end

															if not v638 then
																local v654 = v640 * (5 + v636 * 0.005)

																return math.sin(curtime * v654) * v639 * 0.1 + math.random(-10, 10) * 0.02
															end

															local v655 = v640 * (5 + v636 * 0.005)

															return math.sin(curtime * v655) * (v642 - v641) * 0.1 + math.random(-10, 10) * 0.02 + (v641 + v642) * 0.5
														end

														if not v638 then
															return (curtime * 7 % 2 - 1) * v639
														end

														return (curtime * 7 % 2 - 1) * (v642 - v641) * 0.5 + (v641 + v642) * 0.5
													end

													if not v638 then
														return math.sin(curtime * v640 * 1.3 + v636 * 0.002) * v639
													end

													return math.sin(curtime * v640 * 1.3 + v636 * 0.002) * (v642 - v641) * 0.5 + (v641 + v642) * 0.5
												end

												if not v638 then
													local v656 = v640 * (2 + v636 * 0.005)

													return math.floor(curtime * v656) % 2 == 0 and v639 or -v639
												end

												local v657 = v640 * (2 + v636 * 0.005)
												local v658 = math.floor(curtime * v657) % 2
												local _ = (v642 - v641) * (0.5 + math.min(v636 * 0.002, 0.5))

												return v658 == 0 and v641 or v642
											end

											if not v638 then
												local v660 = math.floor(curtime * v640 * 2.5) % 3

												return v660 == 0 and v639 or (v660 == 1 and 0 or -v639)
											end

											local v661 = math.floor(curtime * v640 * 2.5) % 3

											return v661 == 0 and v641 or (v661 == 1 and (v641 + v642) * 0.5 or v642)
										end

										if not v638 then
											return curtime * (v640 * (4 + v636 * 0.008)) % 2 < 1 and v639 or -v639
										end

										return curtime * (v640 * (4 + v636 * 0.008)) % 2 < 1 and v641 or v642
									end

									if not v638 then
										return math.floor(curtime * v640 * 3) % 2 == 0 and v639 or -v639
									end

									return math.floor(curtime * v640 * 3) % 2 == 0 and v641 or v642
								end

								if not v638 then
									local v662 = curtime * v640 * 0.5 + v636 * 0.001

									return math.sin(v662) * v639
								end

								local v663 = curtime * v640 * 0.5 + v636 * 0.001

								return math.sin(v663) * (v642 - v641) * 0.5 + (v641 + v642) * 0.5
							end

							if not v638 then
								return math.random(-v639, v639)
							end

							return math.random(v641, v642)
						end

						if not v638 then
							return v639
						end

						return math.random(v641, v642)
					end

					return 0
				end

				return 89
			end

			return -89
		end

		return 0
	end

	return 0
end
local function v111(p435, p436, p437, p438, p439, p440, p441)
	local v671 = entity.get_local_player()

	if v671 and v671:is_alive() then
		local tickcount = globals.tickcount
		local curtime = globals.curtime
		local x7 = v671.m_vecVelocity.x
		local y8 = v671.m_vecVelocity.y
		local v676 = math.sqrt(x7 * x7 + y8 * y8)
		local v677 = p435:get()
		local v678 = p436:get()
		local v679 = p437:get()
		local v680 = p438:get()
		local v681 = p439:get()
		local v682 = p440:get()
		local v683 = p441:get()

		if v677 ~= "Disabled" then
			if v677 ~= "Sticky Oscillator" then
				if v677 ~= "Spin" then
					if v677 ~= "Spin v2" then
						if v677 ~= "Random" then
							if v677 ~= "Progressive" then
								if v677 ~= "Sideways" then
									if v677 ~= "Chaos" then
										if v677 ~= "L/R" then
											if v677 ~= "Tick Jitter" then
												if v677 ~= "Weighted Jitter" then
													if v677 ~= "Sway" then
														if v677 ~= "Fade Jitter" then
															if v677 ~= "Random Step" then
																if v677 ~= "Helix" then
																	if v677 ~= "Echo Chamber" then
																		if v677 ~= "Resonance" then
																			if v677 ~= "Echo Chamber" then
																				return 0
																			end

																			if not v678 then
																				local v684 = math.sin(curtime * v680 * 2.1)
																				local v685 = math.sin(curtime * v680 * 1.7) * 0.7
																				local v686 = math.sin(curtime * v680 * 1.3) * 0.5

																				return (v684 + v685 + v686) * v679 * 0.455
																			end

																			local v687 = math.sin(curtime * v680 * 2.1)
																			local v688 = math.sin(curtime * v680 * 1.7) * 0.7
																			local v689 = math.sin(curtime * v680 * 1.3) * 0.5
																			local v690 = v687 + v688 + v689

																			return v681 + (v682 - v681) * (v690 + 2.2) * 0.227
																		end

																		if not v678 then
																			return (math.sin(curtime * v680 * 2.8) + math.sin(curtime * v680 * 1.9 * 2) * 0.6) * v679
																		end

																		local v691 = math.sin(curtime * v680 * 2.8) + math.sin(curtime * v680 * 1.9 * 2) * 0.6

																		return v681 + (v682 - v681) * (v691 + 1.6) * 0.313
																	end

																	if not v678 then
																		local v692 = math.sin(curtime * v680 * 2.1)
																		local v693 = math.sin(curtime * v680 * 1.7) * 0.7
																		local v694 = math.sin(curtime * v680 * 1.3) * 0.5

																		return (v692 + v693 + v694) * v679 * 0.455
																	end

																	local v695 = math.sin(curtime * v680 * 2.1)
																	local v696 = math.sin(curtime * v680 * 1.7) * 0.7
																	local v697 = math.sin(curtime * v680 * 1.3) * 0.5
																	local v698 = v695 + v696 + v697

																	return v681 + (v682 - v681) * (v698 + 2.2) * 0.227
																end

																if not v678 then
																	local v699 = math.sin(curtime * v680 * 2.1)
																	local v700 = math.cos(curtime * v680 * 2.1)

																	return math.atan2(v700, v699) * 180 / math.pi * v679 / 180
																end

																local v701 = math.sin(curtime * v680 * 2.1)
																local v702 = math.cos(curtime * v680 * 2.1)
																local v703 = math.atan2(v702, v701) * 180 / math.pi

																return v681 + (v682 - v681) * (v703 + 180) / 360
															end

															if not v678 then
																return ({
																	[1] = nil,
																	[2] = nil,
																	[3] = 0,
																	[1] = -v679,
																	[2] = -v679 * 0.6,
																	[4] = v679 * 0.6,
																	[5] = v679
																})[math.floor(curtime * v680 * 3) % 5 + 1]
															end

															return ({
																[1] = v681,
																[2] = v681 * 0.6,
																[3] = (v681 + v682) / 2,
																[4] = v682 * 0.6,
																[5] = v682
															})[math.floor(curtime * v680 * 3) % 5 + 1]
														end

														if not v678 then
															local v704 = (math.sin(curtime * 0.5) + 1) / 2

															return (math.random() < 0.5 and v679 or -v679) * v704 + (1 - v704) * 0
														end

														local v705 = (math.sin(curtime * 0.5) + 1) / 2

														return (math.random() < 0.5 and v681 or v682) * v705 + (1 - v705) * ((v681 + v682) / 2)
													end

													if not v678 then
														local v706 = math.random() * 0.5
														local v707 = (math.sin(curtime * v680 * 1.2 + v706) + 1) / 2

														return -v679 * (1 - v707) + v679 * v707
													end

													local v708 = math.random() * 0.5
													local v709 = (math.sin(curtime * v680 * 1.2 + v708) + 1) / 2

													return v681 * (1 - v709) + v682 * v709
												end

												if not v678 then
													return curtime * 7 % 2 < 0.7 and v679 or -v679
												end

												return curtime * 7 % 2 < 0.7 and v681 or v682
											end

											if not v678 then
												return tickcount % v683 < 4 and v679 or -v679
											end

											return tickcount % v683 < 4 and v681 or v682
										end

										if not v678 then
											return tickcount % 4 < 2 and v679 or -v679
										end

										return tickcount % 4 < 2 and v681 or v682
									end

									return (curtime * 7 % 2 - 1) * 180
								end

								if not v678 then
									return curtime * 10 % 1 < 0.5 and -v679 or v679
								end

								return curtime * 10 % 1 < 0.5 and v681 or v682
							end

							if not v678 then
								return math.sin(curtime * v680 * 1.5 + v676 * 0.002) * v679 * 0.95
							end

							local v710 = curtime * v680 * 1.5 + v676 * 0.002

							return math.sin(v710) * (v682 - v681) * 0.5 + (v681 + v682) * 0.5
						end

						if not v678 then
							return math.random(-v679, v679)
						end

						return math.random(v681, v682)
					end

					return curtime * (v680 * 45 + v676 * 0.08) % 360 * 0.95
				end

				return curtime * v680 * 90 % 360 - 180
			end

			local v711 = 0.15 + math.random(0.05, 0.2)
			local v712 = math.random()
			local n29 = 0.5
			local v714 = curtime % (v711 + n29)
			local v715 = math.floor(curtime / v711) % 2

			if not (v714 < n29) or not (v712 < 0.5) then
				return v715 == 0 and -107 or 107
			end

			return v712 < 0.15 and -107 or 107
		end

		return 0
	end

	return 0
end
local function v112()
	local v716 = entity.get_local_player()

	if v716 and v716:is_alive() then
		if entity.get_threat(true) == nil then
			return false
		end

		return true
	end

	return false
end
local function v113(_, p443)
	-- upvalues: v112 (copy), t7 (copy), v110 (copy), v111 (copy)
	local defensive_label = solix_builder[p443].defensive_label
	local v720

	if not defensive_label.when_hittable:get() then
		v720 = defensive_label.enable:get()
	else
		v720 = v112()
	end

	if not v720 then
		t7.hidden:override(false)
	else
		t7.hidden:override(true)
	end

	if not defensive_label.osaa:get() then
		t7.hslag:override("favor fire rate")
	else
		t7.hslag:override("Break LC")
	end

	if v720 then
		rage.antiaim:override_hidden_pitch(v110(defensive_label.pitch, defensive_label.pitch_min_max, defensive_label.pitch_angle, defensive_label.pitch_speed, defensive_label.pitch_left_value, defensive_label.pitch_right_value, defensive_label.pitch_ticks_value))
		rage.antiaim:override_hidden_yaw_offset(v111(defensive_label.yaw, defensive_label.yaw_min_max, defensive_label.yaw_angle, defensive_label.yaw_speed, defensive_label.yaw_left_value, defensive_label.yaw_right_value, defensive_label.ticks_def))
	end
end
local function v114()
	return solix_builder
end
local function v115(p444, _)
	-- upvalues: t9 (copy), t7 (copy)
	if t9.antiaim.exploits.defensive_flick:get() then
		if not (rage.exploit:get() < 1) then
			if not t7.sw:get() then
				t7.inverter:override()
			else
				t7.yawoffset:override(0)
				t7.modifier:override("Disabled")
				t7.modoffset:override(0)
				t7.bodyyaw:override(true)
				t7.leftlimit:override(60)
				t7.rightlimit:override(60)

				if not t9.antiaim.exploits.defensive_flick.options:get("Jitter") then
					t7.options:override("")
					t7.inverter:override()
					t7.fs:override(false)
				else
					t7.options:override("Jitter")
					t7.inverter:override()
					t7.fs:override(false)
				end

				local v723 = t9.antiaim.exploits.defensive_flick.pitch:get()

				if v723 ~= "Down" then
					if v723 ~= "Zero" then
						if v723 ~= "Up" then
							if v723 == "Flow" then
								rage.antiaim:override_hidden_pitch(math.random(-45, 45))
							end
						else
							rage.antiaim:override_hidden_pitch(-89)
						end
					else
						rage.antiaim:override_hidden_pitch(0)
					end
				else
					rage.antiaim:override_hidden_pitch(89)
				end

				local v724 = t9.antiaim.exploits.defensive_flick.yaw:get()
				local v725 = rage.antiaim:inverter()

				if v724 ~= "Default" then
					if v724 ~= "Minimal" then
						if v724 ~= "Extended" then
							if v724 == "Random" then
								rage.antiaim:override_hidden_yaw_offset(v725 and math.random(79, 104) or math.random(-104, -79))
							end
						else
							rage.antiaim:override_hidden_yaw_offset(v725 and 90 or -90)
						end
					else
						rage.antiaim:override_hidden_yaw_offset(v725 and 60 or -60)
					end
				else
					rage.antiaim:override_hidden_yaw_offset(v725 and 79 or -79)
				end

				t7.hidden:override(true)

				if not t9.antiaim.exploits.defensive_flick.unmatched_mode:get() then
					local v726 = t9.antiaim.exploits.defensive_flick.time:get()

					p444.force_defensive = p444.command_number % (3 + v726) == 0
				end

				t7.dtlag:override("Always On")
				t7.hslag:override("Break LC")
			end

			return
		end

		return
	end
end

events.createmove:set(function(p446)
	-- upvalues: v103 (copy), v108 (copy), v109 (copy), v113 (copy), v115 (copy), v65 (copy), v102 (copy), t9 (copy), t7 (copy), v66 (copy), v114 (copy)
	if entity.get_local_player() then
		local v728 = v103()

		v108(p446, v728)
		v109(v728)
		v113(p446, v728)
		v115(p446, v728)
		v65(p446)

		local v729 = v102()

		if not t9.antiaim.hotkeys.freestanding:get() or t9.antiaim.hotkeys.freestanding.freestanding_disablers:get(v729) then
			t7.fs:override(false)
		else
			t7.fs:override(true)

			if t9.antiaim.hotkeys.freestanding.yawmodifier:get() then
				t7.yawoffset:override(5)
				t7.modifier:override("Offset")
				t7.modoffset:override(0)
				t7.leftlimit:override(60)
				t7.rightlimit:override(60)
				t7.inverter:override(false)
				t7.hidden:override(false)
			end

			if t9.antiaim.hotkeys.freestanding.freestand_bait:get() then
				rage.antiaim:override_hidden_pitch(-89)
				rage.antiaim:override_hidden_yaw_offset(-180)
			end
		end

		local v730 = entity.get_local_player()

		if t9.antiaim.exploits.safe_head:get() and v730 and v730:is_alive() then
			local v731 = v730:get_player_weapon()

			if v731 then
				local v732 = v731:get_classname() or ""
				local v733 = bit.band(v730.m_fFlags, 1) == 0
				local weapons = t9.antiaim.exploits.safe_head.weapons
				local v735 = false

				if weapons:get("Knife") and string.match(v732, "Knife") then
					v735 = true
				end

				if weapons:get("Zeus") and string.match(v732, "Taser") then
					v735 = true
				end

				if weapons:get("Grenade") and string.match(v732, "Grenade") then
					v735 = true
				end

				if v733 and v735 then
					t7.yawoffset:override(0)
					t7.base:override("At Target")
					t7.options:override("")
					t7.inverter:override(false)
					t7.leftlimit:override(0)
					t7.rightlimit:override(0)
					t7.hidden:override(false)
				end

				if t9.antiaim.exploits.safe_head.safehead_flick:get() then
					local match = string.match(v732, "Knife")
					local match2 = string.match(v732, "Taser")
					local v738 = v730.m_bDucked or false
					local v739 = v730.m_bJumping or false
					local v740 = bit.band(v730.m_fFlags, 1) ~= 0

					if (match or match2) and v738 and (v739 or not v740) then
						t7.dtlag:override("Always on")
						t7.hidden:set(true)
						t7.leftlimit:override(42)
						t7.rightlimit:override(42)
						rage.antiaim:override_hidden_yaw_offset(-180)
						rage.antiaim:override_hidden_pitch(-89)
					end
				end
			end
		end

		if not t9.others.ragebot.fakeduck_edgeyaw:get() or not t7.fakeduck:get() then
			if t9.others.ragebot.forward_fakeduck:get() and t7.fakeduck:get() then
				t7.yawoffset:override(180)
				t7.modoffset:override(0)
				t7.base:override("Local View")
			end
		else
			t7.yawoffset:set(v66())
			t7.base:override("Local View")
			t7.fss:set(true)
			t7.fsb:set(true)
			t7.options:set("")
			t7.inverter:set(false)
			t7.modoffset:set(0)
		end

		v114()

		return
	end
end)

local t41 = {
	ground_ticks = 1,
	end_time = 0
}

events.post_update_clientside_animation:set(function()
	-- upvalues: u18 (ref), v17 (copy), t9 (copy), t7 (copy), t41 (copy)
	local v741 = entity.get_local_player()

	if not (math.sqrt(v741.m_vecVelocity.x ^ 2 + v741.m_vecVelocity.y ^ 2) <= 5) then
	end

	if bit.band(v741.m_fFlags, 1) == 0 then
	end

	local v742 = bit.band(v741.m_fFlags, 1)

	u18 = v17(v741:get_index())

	if t9.antiaim.exploits.slx_anim:get() then
		if t9.antiaim.exploits.slx_anim.air_combo:get() ~= "Static" then
			if t9.antiaim.exploits.slx_anim.air_combo:get() ~= "Kangaroo" then
				if t9.antiaim.exploits.slx_anim.air_combo:get() == "Walking" then
					ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", u18) + 10640)[0][6].m_flWeight = 1
				end
			else
				v741.m_flPoseParameter[6] = utils.random_float(0, 1)
			end
		else
			v741.m_flPoseParameter[6] = 1
		end

		if t9.antiaim.exploits.slx_anim.jitter_combo:get() ~= "Walking" then
			if t9.antiaim.exploits.slx_anim.jitter_combo:get() ~= "Static" then
				if t9.antiaim.exploits.slx_anim.jitter_combo:get() ~= "Fast Jitter" then
					if t9.antiaim.exploits.slx_anim.jitter_combo:get() == "Slow Jitter" then
						t7.leg:override("Sliding")
						v741.m_flPoseParameter[0] = globals.tickcount % 4 > 1 and t9.antiaim.exploits.slx_anim.slider_jitter:get() / 100 or 1
					end
				else
					t7.leg:override("Sliding")
					v741.m_flPoseParameter[0] = utils.random_float(0, 1)
				end
			else
				t7.leg:override("Sliding")
				v741.m_flPoseParameter[0] = 0
			end
		else
			t7.leg:override("Walking")
			v741.m_flPoseParameter[7] = 1
		end

		if t9.antiaim.exploits.slx_anim.walk_combo:get() ~= "Jitter" then
			if t9.antiaim.exploits.slx_anim.walk_combo:get() == "Static" then
				v741.m_flPoseParameter[9] = 0
			end
		else
			v741.m_flPoseParameter[9] = utils.random_float(0, 1)
		end

		if not t9.antiaim.exploits.slx_anim.other_combo:get("Pitch 0 on land") then
			if not t9.antiaim.exploits.slx_anim.other_combo:get("Earthquake") then
				if not t9.antiaim.exploits.slx_anim.other_combo:get("Arrested") then
					if not t9.antiaim.exploits.slx_anim.other_combo:get("Goblin") then
						if not t9.antiaim.exploits.slx_anim.other_combo:get("Pooping") then
							if not t9.antiaim.exploits.slx_anim.other_combo:get("Wave") then
								if not t9.antiaim.exploits.slx_anim.other_combo:get("Flashed") then
									if not t9.antiaim.exploits.slx_anim.other_combo:get("Ultimate Safe Head") then
										if t9.antiaim.exploits.slx_anim.other_combo:get("Smoothing") then
											local v743 = ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", u18) + 10640)[0]

											v743[10].m_flWeight = 0
											v743[10].m_flCycle = 0
										end
									else
										local v744 = ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", u18) + 10640)[0]

										v744[6].m_nSequence = 217
										v744[6].m_flWeight = 1
										v744[6].m_flCycle = 0
										v744[6].m_flPlaybackRate = 500
										v741.m_flPoseParameter[0] = 0.6
										v741.m_flPoseParameter[1] = 1
									end
								else
									local v745 = ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", u18) + 10640)[0]

									v745[10].m_flWeight = 1
									v745[10].m_flCycle = 1
									v745[10].m_nSequence = 225
								end
							else
								local v746 = ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", u18) + 10640)[0]

								v746[10].m_nSequence = 10
								v746[10].m_flWeight = 1
								v746[10].m_flCycle = 0.5
							end
						else
							local v747 = ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", u18) + 10640)[0]

							v747[10].m_nSequence = 11
							v747[10].m_flWeight = 1
							v747[10].m_flCycle = 1
						end
					else
						local v748 = ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", u18) + 10640)[0]

						v748[10].m_nSequence = 12
						v748[10].m_flWeight = 1
						v748[10].m_flCycle = 1
					end
				else
					local v749 = ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", u18) + 10640)[0]

					v749[10].m_flWeight = 1
					v749[10].m_flCycle = 1
					v749[10].m_nSequence = 232
				end
			else
				v741.m_flPoseParameter[6] = globals.tickcount % 4 > 1 and math.random(math.random(0.1, 5), 5) / 10 or math.random(0.1, 1)
			end
		else
			if v742 ~= 1 then
				t41.ground_ticks = 0
				t41.end_time = globals.curtime + 1
			else
				t41.ground_ticks = t41.ground_ticks + 1
			end

			if t41.ground_ticks > ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):get() + 1 and t41.end_time > globals.curtime then
				v741.m_flPoseParameter[12] = 0.5
			end
		end
	end
end)
events.render:set(function()
	-- upvalues: v101 (copy)
	v101()
end)
t9.others.visuals.aspect_switch:set_callback(function()
	-- upvalues: t9 (copy)
	local v766 = t9.others.visuals.aspect_switch:get()

	cvar.r_aspectratio:float(v766 and t9.others.visuals.aspect_switch.aspect_value:get() / 10 or 0)
end)
t9.others.visuals.aspect_switch.aspect_value:set_callback(function()
	-- upvalues: t9 (copy)
	if t9.others.visuals.aspect_switch:get() then
		cvar.r_aspectratio:float(t9.others.visuals.aspect_switch.aspect_value:get() / 10)
	end
end)
events.shutdown:set(function()
	cvar.r_aspectratio:float(0)
end)

local t42 = {
	sequence = {
		[1] = "$     ",
		[2] = "s0    ",
		[3] = "sol   ",
		[4] = "soli  ",
		[5] = "solix ",
		[6] = "solix ",
		[7] = "Solix ",
		[8] = "soLix ",
		[9] = "soliX ",
		[10] = "sOlix ",
		[11] = "solIx ",
		[12] = "$olix ",
		[13] = "solix ",
		[14] = "olix  ",
		[15] = "lix   ",
		[16] = "ix    ",
		[17] = "x     ",
		[18] = "      ",
		[19] = "     S"
	}
}

function t42.get_clantag()
	-- upvalues: t42 (copy)
	if utils.net_channel() ~= nil then
		local v767 = math.floor(math.fmod((globals.tickcount + utils.net_channel().latency[0] / globals.tickinterval) / 16, #t42.sequence + 1) + 1)

		return t42.sequence[v767]
	end

	return nil
end
function t42.update()
	-- upvalues: t42 (copy), t9 (copy)
	local v768 = t42.get_clantag()

	if v768 ~= t42.last_tag and v768 ~= nil then
		if not t9.others.misc.clantag_switch:get() then
			common.set_clan_tag(" ")
		else
			common.set_clan_tag(v768)
		end

		t42.last_tag = v768

		return
	end
end

events.render:set(function()
	-- upvalues: t42 (copy)
	t42.update()
end)
events.shutdown:set(function()
	cvar.r_aspectratio:float(0)
	common.set_clan_tag(" ")
end);
({
	player_info_t = ffi.typeof("        struct {\n            int64_t         unknown;\n            int64_t         steamID64;\n            char            szName[128];\n            int             userId;\n            char            szSteamID[20];\n            char            pad_0x00A8[0x10];\n            unsigned long   iSteamID;\n            char            szFriendsName[128];\n            bool            fakeplayer;\n            bool            ishltv;\n            unsigned int    customfiles[4];\n            unsigned char   filesdownloaded;\n        } *\n    "),
	BaseLocalClient = ffi.cast("uintptr_t**", utils.opcode_scan("engine.dll", "A1 ? ? ? ? 0F 28 C1 F3 0F 5C 80 ? ? ? ? F3 0F 11 45 ? A1 ? ? ? ? 56 85 C0 75 04 33 F6 EB 26 80 78 14 00 74 F6 8B 4D 08 33 D2 E8 ? ? ? ? 8B F0 85 F6", 1)),
	GetStringUserData = utils.get_vfunc(11, "void*(__thiscall*)(void*, int, int*)"),
	ui = t9.others.misc,
	restore_nickname = function(p447)
		if p447.previous_name ~= nil then
			p447:apply_nickname(p447.previous_name)
			p447.previous_name = nil

			return
		end
	end,
	apply_nickname = function(p448, p449)
		local v772 = entity.get_local_player()

		if v772 ~= nil then
			local v773 = p448.BaseLocalClient[0][0]

			if v773 ~= nil then
				local v774 = ffi.cast("void***", v773 + 21184)[0]

				if v774 ~= nil then
					local v775 = p448.GetStringUserData(v774, v772:get_index() - 1, nil)

					if v775 ~= nil then
						local v776 = ffi.cast(p448.player_info_t, v775)

						if v776 ~= nil then
							local v777 = ffi.string(v776[0].szName)

							if v777 ~= p449 and p448.previous_name == nil then
								p448.previous_name = v777
							end

							ffi.copy(v776[0].szName, p449, #p449 + 1)

							return
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
	end,
	shutdown = function(p450)
		p450:restore_nickname()
	end,
	level_init = function(p451)
		local v780 = p451.ui.clientside_nickname.nickname:get()

		p451:restore_nickname()

		if v780 ~= "" then
			p451:apply_nickname(v780)
		end
	end,
	setup = function(p452)
		local clientside_nickname = p452.ui.clientside_nickname

		local function v783()
			-- upvalues: p452 (copy)
			p452:shutdown()
		end
		local function v784()
			-- upvalues: p452 (copy)
			p452:level_init()
		end
		local function v785(p453)
			-- upvalues: p452 (copy)
			local v1196 = p453:get()

			if v1196 ~= "" then
				p452:apply_nickname(v1196)
			else
				p452:restore_nickname()
			end
		end

		clientside_nickname:set_callback(function(p454)
			-- upvalues: p452 (copy), clientside_nickname (copy), v785 (copy), v783 (copy), v784 (copy)
			local v1198 = p454:get()

			if not v1198 then
				p452:restore_nickname()
			end

			if not v1198 then
				clientside_nickname.nickname:unset_callback(v785)
			else
				clientside_nickname.nickname:set_callback(v785, true)
			end

			events.shutdown(v783, v1198)
			events.level_init(v784, v1198)
		end, true)
	end
}):setup()

local function v118(p455)
	lp = entity.get_local_player()

	if lp then
		if lp.m_MoveType == 9 and p455.view_angles.x < 15 then
			if p455.sidemove == 0 and p455.forwardmove > 0 then
				p455.view_angles.x = 89
				p455.view_angles.y = p455.view_angles.y - 90
				p455.in_forward = false
				p455.in_back = true
				p455.in_moveleft = true
			end

			if p455.forwardmove == 0 and p455.sidemove ~= 0 then
				p455.view_angles.x = 89

				if not (p455.sidemove < 0) then
					if p455.sidemove > 0 then
						p455.in_back = p455.in_moveright
					end
				else
					p455.in_back = p455.in_moveleft
				end
			end

			if p455.forwardmove > 0 and p455.sidemove ~= 0 then
				p455.view_angles.x = 89

				if not (p455.sidemove < 0) then
					if p455.sidemove > 0 then
						p455.view_angles.y = p455.view_angles.y + 45
						p455.in_forward = false
						p455.in_back = true
					end
				else
					p455.view_angles.y = p455.view_angles.y - 45
					p455.in_forward = false
					p455.in_back = true
				end
			end
		end

		return
	end
end

events.createmove(function(p456)
	-- upvalues: t9 (copy), v118 (copy)
	if t9.others.misc.fastladder:get() == true then
		v118(p456)
	end
end)

local v119 = v2.setup({
	[1] = t9.antiaim,
	[2] = solix_builder,
	[3] = t9.others
}, true)
local t43 = {
	backup = 1
}

local function v121(_)
	-- upvalues: v39 (copy), t9 (copy)
	local t44 = {}

	for i, v in ipairs(v39.ui_list) do
		t44[i] = v:gsub("^>>%s+", ""):gsub(">>%s+", "")
	end

	t9.profile.config_list:update(t44)
end

v121(1)
t9.profile.create:set_callback(function()
	-- upvalues: t9 (copy), v39 (copy), v119 (copy), v5 (copy), v121 (copy)
	local v792 = t9.profile.input:get()

	if v792 ~= "" then
		for _, v in pairs(v39.ui_list) do
			if v792 == v:gsub("^>>%s+", ""):gsub(">>%s+", "") then
				print_raw("Failed to create config: config with this name already exists")
				utils.console_exec("play resource\\warning.wav")

				return
			end
		end

		local v795 = v119:save()
		local v796 = "Solix_" .. v5.encode(json.stringify(v795))

		table.insert(v39.ui_list, v792)
		table.insert(v39.config_list, v796)
		t9.profile.input:set("")
		db.SolixBeta = v39
		v121(#v39.ui_list)
		cvar.play:call("ambient\\tones\\elev1")

		return
	end

	print_raw("Failed to create config: empty config name")
	utils.console_exec("play resource\\warning.wav")
end)
t9.profile.save:set_callback(function()
	-- upvalues: t9 (copy), t43 (copy), v119 (copy), v5 (copy), v39 (copy), v121 (copy)
	if t9.profile.config_list:get() ~= 1 then
		t43.backup = t9.profile.config_list:get()

		local v797 = v119:save()
		local v798 = "Solix_" .. v5.encode(json.stringify(v797))

		for k, _ in pairs(v39.config_list) do
			if k == t9.profile.config_list:get() then
				v39.config_list[k] = v798
			end
		end

		db.SolixBeta = v39
		v121(t9.profile.config_list:get())
		cvar.play:call("ambient\\tones\\elev1")

		return
	end

	print_raw("Failed to save config: you can't change default config")
	utils.console_exec("play resource\\warning.wav")
end)
t9.profile.load:set_callback(function()
	-- upvalues: t43 (copy), t9 (copy), v39 (copy), v5 (copy), v119 (copy), v121 (copy)
	t43.backup = t9.profile.config_list:get()

	local v801 = v39.config_list[t9.profile.config_list:get()]:gsub("Solix_", "")
	local v802 = json.parse(v5.decode(v801))

	v119:load(v802)
	t9.profile.config_list:set(t43.backup)
	t9.profile.input:set("")
	v121(t43.backup)
	cvar.play:call("ambient\\tones\\elev1")
end)
t9.profile.delete:set_callback(function()
	-- upvalues: t9 (copy), v39 (copy), v121 (copy)
	if t9.profile.config_list:get() ~= 1 then
		for k, _ in pairs(v39.config_list) do
			if k == t9.profile.config_list:get() then
				table.remove(v39.config_list, k)
				table.remove(v39.ui_list, k)
			end
		end

		db.SolixBeta = v39
		v121(1)
		cvar.play:call("ambient\\tones\\elev1")

		return
	end

	print_raw("Failed to delete config: you can't delete default config")
	utils.console_exec("play resource\\warning.wav")
end)
t9.profile.export:set_callback(function()
	-- upvalues: v119 (copy), v5 (copy), v3 (copy)
	local v805 = json.stringify(v119:save())
	local v806 = v5.encode(v805)

	v3.set(v806)
	cvar.play:call("ambient\\tones\\elev1")
end)
t9.profile.import:set_callback(function()
	-- upvalues: v3 (copy), v5 (copy), v119 (copy)
	local ok, result = pcall(function()
		-- upvalues: v3 (copy), v5 (copy), v119 (copy)
		local v1199 = v3.get()
		local v1200 = v5.decode(v1199)

		v119:load(json.parse(v1200))
	end)

	if not ok then
		print("Failed to import config: ", result)
	else
		cvar.play:call("ambient\\tones\\elev1")
	end
end)

local v122 = common.get_username()
local u123 = nil

local function v124()
	local v809 = utils.net_channel()

	if v809 then
		local v810 = v809:get_server_info()

		if v810 and v810.address then
			return v810.address
		end
	end

	return "0.0.0.0"
end
local function v125()
	return globals.is_in_game
end

local n30 = 5000
local n31 = 300000
local u128 = common.get_timestamp()
local u129 = u128 + n30

local function v130()
	-- upvalues: v122 (copy), v125 (copy), v124 (copy), u123 (ref), v10 (copy)
	local t45 = {
		username = v122,
		in_server = v125(),
		server_ip = v124()
	}

	if u123 then
		u123:send(v10.encode(t45))
	end
end
local function v131()
	-- upvalues: u123 (ref), u129 (ref), n30 (copy), u128 (ref), n31 (copy)
	if u123 then
		local v812 = common.get_timestamp()

		if v812 >= u129 then
			u123:send("ping")
			u123:send("get_online_users")

			if solix.ServerInfo.discord_key == "" then
				u123:send("key_get")
			end

			u129 = v812 + n30
		end

		if v812 - u128 > n31 then
			print("No pong in 5 minutes, closing websocket")
			u123:close(1000, "Ping timeout")
			u123 = nil
		end

		return
	end
end

u123 = v9.connect("wss://api.nigger.beauty/socket?token=" .. "my_real_token_123" .. "&username=" .. v122, {
	open = function(_)
		-- upvalues: v130 (copy), u128 (ref), u129 (ref), n30 (copy)
		v130()
		u128 = common.get_timestamp()
		u129 = u128 + n30
	end,
	message = function(_, p460)
		-- upvalues: v10 (copy), u128 (ref), t9 (copy)
		if p460 == "Access denied due to cloudflare" then
			common.unload_script()
		end

		local v816 = v10.decode(p460)

		if v816.type == "pong" then
			u128 = common.get_timestamp()
		end

		if v816.type == "key_response" then
			solix.ServerInfo.discord_key = v816.key
		end

		if v816.type == "online_users_count" then
			solix.ServerInfo.Online_Users = v816.count
			t9.profile.show_online_users:name("\v\f<users-line>\r    \a\rOnline User's  " .. v816.count .. "")
		end

		if v816.type == "error" then
			print("[API] Error got: " .. v816.error .. "")
		end
	end,
	error = function(_, p462)
		print("[API] : " .. tostring(p462))
	end,
	close = function(_, p464, p465, p466)
		local t46 = {
			event = "close",
			code = p464,
			reason = p465,
			was_clean = p466
		}

		if p465 == "Access denied due to cloudflare" then
			common.unload_script()
		end

		print("[API] Closed due to:" .. t46.reason .. " CODE[" .. t46.code .. "]")
	end
})

function GetDiscordKey()
	-- upvalues: u123 (ref), v3 (copy)
	if solix.ServerInfo.discord_key ~= "" then
		v3.set(tostring(solix.ServerInfo.discord_key))
	elseif u123 then
		u123:send("key_get")
	end
end

local function v132()
	-- upvalues: v6 (copy)
	local v824 = v6.text_animate("solix", -2, {
		color(255, 255, 255),
		color(255, 255, 255)
	})

	render.text(16, vector(render.screen_size().x / 2, render.screen_size().y / 2 * 1.98 - 5), color(255), "c", v824:get_animated_text())
	v824:animate()
end

events.render:set(function()
	-- upvalues: v131 (copy), v132 (copy)
	v131()
	v132()
end)
events.shutdown:set(function()
	-- upvalues: u123 (ref)
	if u123 then
		u123:close(1000, "Client closed lua")
	end
end)

local function v133(p467, p468, p469)
	return p468 * (1 - p467) + p469 * p467
end
local function v134(p470, p471, p472, p473, p474, p475)
	-- upvalues: t9 (copy)
	if t9.others.visuals.solus_ui:get() then
		local v834 = render.measure_text(1, "", p474)
		local r = t9.others.visuals.solus_ui.accent_color:get().r
		local g = t9.others.visuals.solus_ui.accent_color:get().g
		local b = t9.others.visuals.solus_ui.accent_color:get().b
		local r2 = t9.others.visuals.solus_ui.accent_color:get().r
		local g2 = t9.others.visuals.solus_ui.accent_color:get().g
		local b2 = t9.others.visuals.solus_ui.accent_color:get().b

		render.rect_outline(vector(p470 - 1, p471), vector(p470 + p472 + 4, p471 + p473 + 1), color(r, g, b, p475 / 5), 1, 4)
		render.rect(vector(p470 + 3, p471), vector(p470 + p472, p471 + 1), color(r2, g2, b2, p475), 4)
		render.rect(vector(p470, p471 + 1), vector(p470 + p472 + 3, p471 + 16), color(0, 0, 0, p475 / 4), 4)
		render.circle_outline(vector(p470 + 3, p471 + 3), color(r2, g2, b2, p475), 4, 190, 0.33, 1)
		render.circle_outline(vector(p470 + p472, p471 + 3), color(r2, g2, b2, p475), 4, 260, 0.3, 1)
		render.gradient(vector(p470 - 1, p471 + 2), vector(p470, p471 + p473 - 4), color(r2, g2, b2, p475), color(r2, g2, b2, 0), color(r2, g2, b2, p475 / 2), color(r2, g2, b2, 0))
		render.gradient(vector(p470 + p472 + 3, p471 + 2), vector(p470 + p472 + 4, p471 + p473 - 4), color(r2, g2, b2, p475), color(r2, g2, b2, 0), color(r2, g2, b2, p475 / 2), color(r2, g2, b2, 0))
		render.text(1, vector(p470 + 1 + p472 / 2 + 1 - v834.x / 2, p471 + p473 / 2 - v834.y / 2), color(255, 255, 255, p475), "", p474)

		return
	end
end

local x8 = render.screen_size().x
local _ = render.screen_size().y
local n32 = 0
local n33 = 1
local n34 = 0
local t47 = {
	[""] = {
		alpha_k = 0
	}
}

events.render:set(function()
	-- upvalues: t9 (copy), v134 (copy), x8 (copy)
	if t9.others.visuals.solus_ui:get() and t9.others.visuals.solus_ui.widgets:get("Watermark") then
		math.floor(1 / globals.tickinterval)

		local v841 = t9.others.visuals.solus_ui.custom_name:get()

		function get_ping()
			local v1201 = utils.net_channel()

			if v1201 ~= nil then
				return math.floor(v1201.latency[1] * 1000)
			end

			return 0
		end

		local v842 = common.get_date("%H:%M")
		local v843 = not globals.is_in_game and "" or " | " .. get_ping() .. "ms"
		local v844 = "Solix \a" .. color(t9.others.visuals.solus_ui.accent_color:get().r, t9.others.visuals.solus_ui.accent_color:get().g, t9.others.visuals.solus_ui.accent_color:get().b, 255):to_hex() .. "Beta \aFFFFFFFF| " .. v841 .. v843 .. " | " .. v842
		local x9 = render.measure_text(1, "", v844).x

		v134(x8 - x9 - 19, 10, x9 + 4, 16, v844, 255)
	end
end)

local v141 = v13.register({
	[1] = t9.others.visuals.solus_ui.pos_x,
	[2] = t9.others.visuals.solus_ui.pos_y
}, vector(120, 60), "Test", function(p476)
	-- upvalues: t9 (copy), t47 (copy), v133 (copy), n34 (ref), n33 (ref), n32 (ref), v134 (copy)
	if t9.others.visuals.solus_ui:get() and t9.others.visuals.solus_ui.widgets:get("Keybinds") then
		local n35 = 0
		local v848 = globals.frametime * 16
		local n36 = 0
		local t48 = {}
		local v851 = ui.get_binds()

		for i = 1, #v851 do
			local v853 = v851[i]
			local v854 = v851[i].mode == 1 and "holding" or (v851[i].mode == 2 and "toggled" or "[?]")
			local value = v851[i].value
			local name = v851[i].name

			if name == "Peek Assist" then
				name = "Quick peek assist"
			end

			if name == "Edge Jump" then
				name = "Jump at edge"
			end

			if name == "Hide Shots" then
				name = "On shot anti-aim"
			end

			if name == "Minimum Damage" then
				name = "Minimum damage"
			end

			if name == "Fake Latency" then
				name = "Ping spike"
			end

			if name == "Fake Duck" then
				name = "Duck peek assist"
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

			local v857 = render.measure_text(1, "", v854)
			local v858 = render.measure_text(1, "", name)

			if t47[v853.name] == nil then
				t47[v853.name] = {
					alpha_k = 0
				}
			end

			t47[v853.name].alpha_k = v133(v848, t47[v853.name].alpha_k, v853.active and 255 or 0)

			if t9.others.visuals.solus_ui:get() then
				render.text(1, vector(p476.position.x + 3, p476.position.y + 19 + n36), color(255, t47[v853.name].alpha_k), "", name)

				if name ~= "Minimum damage" and name ~= "Ping spike" then
					render.text(1, vector(p476.position.x + (n34 - v857.x - 8), p476.position.y + 19 + n36), color(255, t47[v853.name].alpha_k), "", "[" .. v854 .. "]")
				else
					render.text(1, vector(p476.position.x + (n34 - v857.x) - render.measure_text(1, nil, value).x + 28, p476.position.y + 19 + n36), color(255, t47[v853.name].alpha_k), "", "[" .. value .. "]")
				end
			end

			n36 = n36 + 16 * t47[v853.name].alpha_k / 255

			local v859 = v857.x + v858.x + 18

			if v859 > 119 and n35 < v859 then
				n35 = v859
			end

			if v851.active then
				table.insert(t48, v851)
			end
		end

		n33 = v133(v848, n33, (not (ui.get_alpha() <= 0) or n36 > 0) and 1 or 0)
		n34 = v133(v848, n34, math.max(n35, 119))

		if ui.get_alpha() <= 0 and not (n36 > 6) then
			if n36 < 15.99 and ui.get_alpha() == 0 then
				n32 = v133(v848, n32, 0)
			end
		else
			n32 = v133(v848, n32, math.max(ui.get_alpha() * 255, n36 > 1 and 255 or 0))
		end

		if ui.get_alpha() or #t48 > 0 then
			v134(p476.position.x, p476.position.y, n34, 16, "keybinds", n32)
		end
	end
end)
local v142 = v13.register({
	[1] = t9.others.visuals.solus_ui.pos_x1,
	[2] = t9.others.visuals.solus_ui.pos_y1
}, vector(120, 60), "Test2", function(p477)
	-- upvalues: t9 (copy), v134 (copy)
	if t9.others.visuals.solus_ui:get() and t9.others.visuals.solus_ui.widgets:get("Spectator list") then
		local n37 = 120

		if n37 > 149 and n37 > max_width then
			max_width = n37
		end

		if not (ui.get_alpha() <= 0.3) or ui.get_alpha() > 0.3 and not globals.is_in_game then
			v134(p477.position.x, p477.position.y, n37, 16, "spectators", 255)
		end

		local v862 = entity.get_local_player()

		if v862 == nil then
			return
		end

		v862:get_spectators()

		if v862.m_hObserverTarget and (v862.m_iObserverMode == 4 or v862.m_iObserverMode == 5) then
			v862 = v862.m_hObserverTarget
		end

		local v863 = v862:get_spectators()

		if v863 == nil then
			return
		end

		for k, v in pairs(v863) do
			local v866 = v:get_name()
			local _ = render.measure_text(1, "", v866).x

			name_sub = string.len(v866) > 17 and string.sub(v866, 0, 17) .. "..." or v866

			local v868 = v:get_steam_avatar()

			if v868 == nil or v868.width <= 5 then
				v868 = fnay
			end

			if not v:is_bot() or v:is_player() then
				render.text(1, vector(p477.position.x + 17, p477.position.y + 7 + k * 15), color(), "u", name_sub)
				render.texture(v868, vector(p477.position.x + 1, p477.position.y + 7 + k * 15), vector(12, 12), color(), "f", 0)
			end
		end

		if not (#v862:get_spectators() <= 0) or v862.m_iObserverMode == 4 or v862.m_iObserverMode == 5 then
			v134(p477.position.x, p477.position.y, n37, 16, "spectators", 255)
		end
	end
end)

events.render:set(function()
	-- upvalues: t9 (copy), v141 (copy), v142 (copy)
	if t9.others.visuals.solus_ui:get() then
		t9.others.visuals.solus_ui.pos_x:visibility(false)
		t9.others.visuals.solus_ui.pos_y:visibility(false)
		t9.others.visuals.solus_ui.pos_x1:visibility(false)
		t9.others.visuals.solus_ui.pos_y1:visibility(false)
		v141:update()
		v142:update()
		t9.others.visuals.solus_ui.accent_color:visibility(t9.others.visuals.solus_ui.widgets:get("Watermark") or (t9.others.visuals.solus_ui.widgets:get("Keybinds") or t9.others.visuals.solus_ui.widgets:get("Spectator list")))
		t9.others.visuals.solus_ui.custom_name:visibility(t9.others.visuals.solus_ui.widgets:get("Watermark"))
	end
end)

local u143 = nil
local s9 = ""

local function v145(p478)
	-- upvalues: s9 (ref), u143 (ref), v14 (copy)
	if p478 ~= s9 or not u143 then
		local ok, result = pcall(network.get, p478)

		if ok and result then
			local ok2, result2 = pcall(v14.load_gif, result)

			if ok2 and result2 then
				u143 = result2
				s9 = p478

				return result2
			end

			return nil
		end

		return nil
	end

	return u143
end

events.render:set(function()
	-- upvalues: t9 (copy), u143 (ref), s9 (ref), v145 (copy)
	if t9.others.visuals.animated_gif:get() then
		local v874 = entity.get_local_player()

		if v874 and v874:is_alive() then
			local v875 = t9.others.visuals.animated_gif.gif_url:get()

			if v875 ~= "" then
				local v876 = v145(v875)

				if v876 then
					local v877 = v874:get_origin()

					v877.z = v877.z + 80

					local v878 = render.world_to_screen(v877)

					if v878 then
						local v879 = t9.others.visuals.animated_gif.gif_size:get()
						local v880 = t9.others.visuals.animated_gif.gif_offset_x:get()
						local v881 = t9.others.visuals.animated_gif.gif_offset_y:get()

						v878.x = v878.x + v880
						v878.y = v878.y + v881
						v876:draw(globals.curtime, v878, vector(v879, v879), color(255, 255, 255, 255))

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

	u143 = nil
	s9 = ""
end)

local u146 = false

local function v147()
	-- upvalues: u146 (ref), t9 (copy)
	if not u146 then
		local v882 = ffi.load("user32")
		local v883 = v882.FindWindowA("Valve001", "Counter-Strike: Global Offensive - Direct3D 9")

		local function v884()
			-- upvalues: v882 (copy), v883 (copy)
			return v882.GetForegroundWindow() == v883
		end
		local function v885()
			-- upvalues: v884 (copy), v882 (copy), v883 (copy)
			if not v884() then
				v882.FlashWindow(v883, true)
			end
		end
		local function v886()
			-- upvalues: v884 (copy), v882 (copy), v883 (copy)
			if not v884() then
				v882.SwitchToThisWindow(v883, false)
			end
		end

		events.round_start:set(function()
			-- upvalues: t9 (copy), v885 (copy), v886 (copy)
			local game_focus = t9.others.misc.game_focus

			if game_focus:get() then
				if game_focus.flask_game_icon:get() then
					v885()
				end

				if game_focus.switch_to_game:get() then
					utils.execute_after(1, v886)
				end

				return
			end
		end)
		u146 = true

		return
	end
end
local function v148()
	-- upvalues: t9 (copy), u146 (ref), v147 (copy)
	local game_focus = t9.others.misc.game_focus

	if (game_focus.switch_to_game:get() or game_focus.flask_game_icon:get()) and not u146 then
		v147()
	end
end

t9.others.misc.game_focus.switch_to_game:set_callback(v148)
t9.others.misc.game_focus.flask_game_icon:set_callback(v148)
v148()

local t49 = {}
local n38 = 1
local s10 = "nl/solix/trashtalk.json"
local t50 = {
	[1] = "1",
	[2] = "ez",
	[3] = "dog",
	[4] = "pwned",
	[5] = "boring asf",
	[6] = "free kill",
	[7] = "nn kid",
	[8] = "quit",
	[9] = "get good",
	[10] = "sit",
	[11] = "so bad",
	[12] = "bad",
	[13] = "nice gaysex",
	[14] = "npc",
	[15] = "bot",
	[16] = "owned dog",
	[17] = "try again",
	[18] = "stay down",
	[19] = "sybau",
	[20] = "no diff",
	[21] = "nice peek u sell?",
	[22] = "pray harder",
	[23] = "nice lagcomp",
	[24] = "botik",
	[25] = "nice aa",
	[26] = "slowass",
	[27] = "hold this L",
	[28] = "just quit",
	[29] = "free round",
	[30] = "newcomer",
	[31] = "nice kd",
	[32] = "cringe config",
	[33] = "your lua wont save you",
	[34] = "pasted and wasted",
	[35] = "solix diff",
	[36] = "AI cfg",
	[37] = "play roblox",
	[38] = "you trying?",
	[39] = "wyd dumbass",
	[40] = "keep cry",
	[41] = "clown",
	[42] = "owned",
	[43] = "folded",
	[44] = "dropped",
	[45] = "u sold",
	[46] = "peek again",
	[47] = "go play cs2",
	[48] = "trash aa",
	[49] = "paster",
	[50] = "ur done",
	[51] = "ez dump",
	[52] = "fake peek",
	[53] = "shhh",
	[54] = "sit boy",
	[55] = "done for",
	[56] = "sleep",
	[57] = "you wish",
	[58] = "cry harder",
	[59] = "ping abuser",
	[60] = "tap out"
}

function loadPhrases()
	-- upvalues: v15 (copy), s10 (copy), t49 (ref), v11 (copy), t9 (copy), n38 (ref), t50 (copy)
	if not v15.exists(s10) then
		t49 = {}

		for _, v in ipairs(t50) do
			table.insert(t49, v)
		end

		savePhrases()
		t9.others.misc.killsay.phrase_list:update(t49)
	else
		local v890 = v15.open(s10, "r")

		if v890 then
			local v891 = v890:read()

			v890:close()
			t49 = v11.parse(v891)
			t9.others.misc.killsay.phrase_list:update(t49)
			n38 = 1
		end
	end
end
function savePhrases()
	-- upvalues: v11 (copy), t49 (ref), v15 (copy), s10 (copy)
	local v892 = v11.stringify(t49)
	local v893 = v15.open(s10, "w")

	if v893 then
		v893:write(v892)
		v893:close()
	end
end
function onAddPhraseClick()
	-- upvalues: t9 (copy), t49 (ref)
	local v894 = t9.others.misc.killsay.phrases:get()

	if v894 ~= "" then
		table.insert(t49, v894)
		common.add_notify("Solix Lua", "Added phrase to killsay!")
		t9.others.misc.killsay.phrase_list:update(t49)
		t9.others.misc.killsay.phrases:set("")
		savePhrases()
	end
end
function onRemovePhraseClick()
	-- upvalues: t9 (copy), t49 (ref)
	local v895 = t9.others.misc.killsay.phrase_list:get()

	if v895 ~= nil then
		table.remove(t49, v895)
		common.add_notify("Solix Lua", "Removed phrase from killsay!")
		t9.others.misc.killsay.phrase_list:update(t49)
		savePhrases()
	end
end
function refreshphrasesclick()
	-- upvalues: v15 (copy), s10 (copy), t49 (ref), v11 (copy), t9 (copy), n38 (ref)
	if v15.exists(s10) then
		local v896 = v15.open(s10, "r")

		if v896 then
			local v897 = v896:read()

			v896:close()
			t49 = v11.parse(v897)
			t9.others.misc.killsay.phrase_list:update(t49)
			n38 = 1
		end
	end
end

local function v153()
	-- upvalues: t49 (ref), t9 (copy), n38 (ref)
	if #t49 ~= 0 then
		if t9.others.misc.killsay.style:get() ~= "Random" then
			if t9.others.misc.killsay.style:get() ~= "Sequence" then
				return t49[1]:gsub("\"", "")
			end

			local v898 = t49[n38]:gsub("\"", "")

			n38 = n38 % #t49 + 1

			return v898
		end

		return t49[utils.random_int(1, #t49)]:gsub("\"", "")
	end

	return "1"
end

t9.others.misc.killsay.add_phrase:set_callback(onAddPhraseClick)
t9.others.misc.killsay.remove_phrase:set_callback(onRemovePhraseClick)
t9.others.misc.killsay.refresh_phrases:set_callback(refreshphrasesclick)
loadPhrases()
events.player_death:set(function(p479)
	-- upvalues: t9 (copy), v153 (copy)
	if t9.others.misc.killsay:get() and entity.get_local_player() == entity.get(p479.attacker, true) then
		utils.console_exec("say \"" .. v153() .. "\"")
	end
end)

local function v154(p480)
	return math.floor(p480 / globals.tickinterval)
end;

({
	sv_gravity = cvar.sv_gravity,
	sv_jump_impulse = cvar.sv_jump_impulse,
	sim_ticks = {},
	net_data = {},
	esp_data = {},
	extrapolate = function(p481, p482, p483, p484)
		local tickinterval = globals.tickinterval
		local v906 = p481.sv_gravity:float() * tickinterval
		local v907 = p481.sv_jump_impulse:float() * tickinterval
		local m_vecVelocity = p482.m_vecVelocity
		local v909 = m_vecVelocity.z > 0 and -v906 or v907

		for _ = 1, p484 do
			local v911 = p483

			p483 = vector(p483.x + m_vecVelocity.x * tickinterval, p483.y + m_vecVelocity.y * tickinterval, p483.z + (m_vecVelocity.z + v909) * tickinterval)

			if utils.trace_line(v911, p483).fraction <= 0.99 then
				return v911
			end
		end

		return p483
	end,
	get_active_players = function(_, p486)
		local m_iObserverMode = p486.m_iObserverMode

		if m_iObserverMode ~= 0 and m_iObserverMode ~= 1 and m_iObserverMode ~= 2 and m_iObserverMode ~= 6 then
			local t51 = {}

			if m_iObserverMode == 4 or m_iObserverMode == 5 then
				local v916 = entity.get_player(false, true)
				local m_iTeamNum = p486.m_hObserverTarget.m_iTeamNum

				for i = 1, #v916 do
					local v919 = v916[i]

					if v919 ~= p486 and m_iTeamNum ~= v919.m_iTeamNum then
						table.insert(t51, v919)
					end
				end
			end

			return t51
		end

		return entity.get_players(true, true)
	end,
	render = function(p487)
		-- upvalues: t9 (copy)
		local lagcomp_debug = t9.others.visuals.lagcomp_debug
		local v922 = entity.get_local_player()

		if v922 ~= nil and v922:is_alive() then
			local v923 = lagcomp_debug.box_color:get()
			local v924 = lagcomp_debug.text_color:get()

			if #p487:get_active_players(v922) ~= 0 then
				for k, v in pairs(p487.net_data) do
					local v927 = entity.get(k)

					if v927 ~= nil and (v927:is_alive() and v927:is_enemy()) then
						if v.lagcomp then
							local predicted_origin = v.predicted_origin
							local v929 = predicted_origin + v927.m_vecMins
							local v930 = predicted_origin + v927.m_vecMaxs
							local t52 = {
								vector(v929.x, v929.y, v929.z),
								vector(v929.x, v930.y, v929.z),
								vector(v930.x, v930.y, v929.z),
								vector(v930.x, v929.y, v929.z),
								vector(v929.x, v929.y, v930.z),
								vector(v929.x, v930.y, v930.z),
								vector(v930.x, v930.y, v930.z),
								vector(v930.x, v929.y, v930.z)
							}
							local t53 = {
								[1] = {
									[1] = 0,
									[2] = 1
								},
								[2] = {
									[1] = 1,
									[2] = 2
								},
								[3] = {
									[1] = 2,
									[2] = 3
								},
								[4] = {
									[1] = 3,
									[2] = 0
								},
								[5] = {
									[1] = 5,
									[2] = 6
								},
								[6] = {
									[1] = 6,
									[2] = 7
								},
								[7] = {
									[1] = 1,
									[2] = 4
								},
								[8] = {
									[1] = 4,
									[2] = 8
								},
								[9] = {
									[1] = 0,
									[2] = 4
								},
								[10] = {
									[1] = 1,
									[2] = 5
								},
								[11] = {
									[1] = 2,
									[2] = 6
								},
								[12] = {
									[1] = 3,
									[2] = 7
								},
								[13] = {
									[1] = 5,
									[2] = 8
								},
								[14] = {
									[1] = 7,
									[2] = 8
								},
								[15] = {
									[1] = 3,
									[2] = 4
								}
							}

							for i = 1, #t53 do
								if i == 1 then
									local v934 = v927:get_origin()
									local v935 = render.world_to_screen(v929)
									local v936 = render.world_to_screen(v934)

									if v935 ~= nil and v936 ~= nil then
										render.line(v935, v936, v923)
									end
								end

								local v937 = t52[t53[i][1]]
								local v938 = t52[t53[i][2]]

								if v937 ~= nil and v938 ~= nil then
									local v939 = render.world_to_screen(v937)
									local v940 = render.world_to_screen(v938)

									if v939 ~= nil and v940 ~= nil then
										render.line(v939, v940, v923)
									end
								end
							end
						end

						local v941 = v927:get_bbox()

						if v941 ~= nil and (v941.pos1 ~= nil and (v941.pos2 ~= nil and v941.alpha ~= nil)) then
							local n39 = 0

							if p487.esp_data[k] > 0 then
								p487.esp_data[k] = p487.esp_data[k] - globals.frametime * 2
								p487.esp_data[k] = p487.esp_data[k] < 0 and 0 or p487.esp_data[k]
								n39 = p487.esp_data[k]
							end

							local v943 = v.tickbase or not (p487.esp_data[k] <= 0)
							local lagcomp = v.lagcomp

							if not v943 or v.lagcomp then
								n39 = v941.alpha
							end

							local t54 = {
								[0] = "",
								[1] = "LAG COMP BREAKER",
								[2] = "SHIFTING TICKBASE"
							}

							if v941.alpha > 0 then
								local v946 = v927:get_name() == "" and -8 or 0
								local v947 = v941.pos2.x - v941.pos1.x
								local v948 = vector(v941.pos1.x + v947 / 2, v941.pos1.y - 18 + v946)
								local v949 = v924:clone()

								v949.a = v949.a * n39

								local v950 = t54[v943 and 2 or (lagcomp and 1 or 0)]

								render.text(1, v948, v949, "c", v950)
							end
						end
					end
				end

				return
			end

			return
		end
	end,
	net_update_end = function(p488)
		-- upvalues: v154 (copy)
		if entity.get_local_player() ~= nil then
			local v952 = entity.get_players(true, true)

			for i = 1, #v952 do
				local v954 = v952[i]
				local v955 = v954:get_index()
				local v956 = p488.sim_ticks[v955]

				if not v954:is_dormant() and v954:is_alive() then
					local m_vecOrigin = v954.m_vecOrigin
					local v958 = v154(v954.m_flSimulationTime)

					if v956 ~= nil then
						local v959 = v958 - v956.tick

						if not (v959 >= 0) or v959 > 0 and v959 <= 64 then
							local _ = v954.m_fFlags
							local v961 = (m_vecOrigin - v956.origin):length2dsqr()
							local v962 = p488:extrapolate(v954, m_vecOrigin, v959 - 1)

							if v959 < 0 then
								p488.esp_data[v955] = 1
							end

							p488.net_data[v955] = {
								tick = v959 - 1,
								origin = m_vecOrigin,
								predicted_origin = v962,
								tickbase = not (v959 >= 0),
								lagcomp = not (v961 <= 4096)
							}
						end
					end

					if p488.esp_data[v955] == nil then
						p488.esp_data[v955] = 0
					end

					p488.sim_ticks[v955] = {
						tick = v958,
						origin = m_vecOrigin
					}
				else
					p488.sim_ticks[v955] = nil
					p488.net_data[v955] = nil
					p488.esp_data[v955] = nil
				end
			end

			return
		end
	end,
	setup = function(p489)
		-- upvalues: t9 (copy)
		local function v964()
			-- upvalues: p489 (copy)
			p489:render()
		end
		local function v965()
			-- upvalues: p489 (copy)
			p489:net_update_end()
		end

		t9.others.visuals.lagcomp_debug:set_callback(function(p490)
			-- upvalues: v964 (copy), v965 (copy)
			local v1204 = p490:get()

			events.render(v964, v1204)
			events.net_update_end(v965, v1204)
		end, true)
	end
}):setup()

local function v155()
	-- upvalues: t9 (copy)
	local v966 = entity.get_local_player()

	if v966 then
		if v966:get_player_weapon() ~= nil then
			local t55 = {
				Ultimate = 0.031,
				High = 0.029125,
				Medium = 0.027525,
				Low = 0.025626,
				Disabled = 0.015625
			}

			if not t9.others.ragebot.prediction:get() then
				cvar.cl_interp:float(0.015625)
				cvar.cl_interp_ratio:int(2)
				cvar.cl_interpolate:int(1)
			else
				local v968 = t9.others.ragebot.prediction.prediction_type:get()
				local v969 = t55[v968] or 0.015625

				if t9.others.ragebot.prediction.ping_variation:get() ~= "Low < 45" then
					if t9.others.ragebot.prediction.ping_variation:get() == "High > 45" then
						cvar.cl_interp:float(0.02)
						cvar.cl_interp_ratio:int(0)
						cvar.cl_interpolate:int(0)
					end
				else
					cvar.cl_interpolate:int(0)
					cvar.cl_interp_ratio:int(v968 == "Ultimate" and 0 or 1)
					cvar.cl_interp:float(v969)
				end
			end

			return
		end

		return
	end
end

events.createmove:set(function(p491)
	-- upvalues: v155 (copy)
	v155(p491)
end)
events.mouse_input:set(function()
	if not (ui.get_alpha() > 0.3) then
		return
	end

	return false
end)
