--[[

Changelog:
	3.01.06
		- Fixed an issue that stopped users being able to edit join dates for members on a sister realm for Combined Realm guilds.
	3.01.05
		- Fixed a bug that would sometimes cause a nil compare error when clicking Find.
	3.01.04
		- Fixed a bug with the new 'Combined Best' alt mode where it was sometimes using worst TimeOffline value instead of best.
	3.01.03
		- Reimplemented the 'Combined Best' alt mode. Thanks to Iverie for reminding me.
		- Removed the -RealmName tag from the end of every player's name on the Promote, Demote and Kick lists. Less clutter is always good.
	3.01.02
		- Due to significant changes in this version, your settings will be reset to default! (Unless you used the alpha or beta of this version, in which case they won't be).
		- Removed the Convert Old Filters stuff as I'm sure nobody needs to use them any more. It's been over two years since the old filter method was phased out.
		- Added a description of the Member Join Dates tab in the main information tab.
	3.01.01 - Beta
		- Due to significant changes in this version, your settings will be reset to default! (Unless you used 3.01.00 Alpha, in which case they won't be reset).
		- Added the ability to change a guild member's Time In Guild date via the Member Join Dates tab in the addon. It also has a list to see all members and their dates, in alphabetical order.
		- Added Time In Guild date support for the Export feature.
		- Fixed a bug where the Time In Guild dates would not be updated for new or removed players.
		- Fixed a bug where the Time In Guild dates for some players would be reset to your current game time on login/reload.
		- Fixed a bug with the Export feature... so that it actually works. Hopefully.
	3.01.00 - Alpha
		- Due to significant changes in this version, your settings will be reset to default!
		- Added "Time In Guild" as an option to promote or demote people by.
		- Added "Time Offline" as an option to promote or demote people by.
		- Remember, this is a ALPHA version, so it will be buggy.
		- Currently only way to edit people's join dates is to open SwynGuildPromoter.lua found in {WoWFolder}\WTF\Account\{youraccount}\SavedVariables. I will add some form of control in later versions.
	3.00.01
		- Timers seem to have automagically fixed themselves. Please let me know if they work or not for you.
		- Added functionality to the timers so that if you have automation on, but decide to turn it off, it actually turns off immediately instead of requiring a reload.
	3.00.00
		- Due to significant changes in this version, your settings will be reset to default!
		- Stopped the spammy automation function. Changed over to the new C_Timer function which doesn't appear to work yet. WIP.
		- Removed all mention of TotalXP and WeeklyXP. They don't exist any more. Promotes and Demotes are now based entirely on Level, Achievement Points and Guild Reputation.
		- Removed Alt Modes "Combined Highest" and "Combined Total" since they only used Total and Weekly XP which as above, is no longer applicable.
	2.06.02
		- Fixed (hopefully) the tainting issues occuring from queueing to battlegrounds. If you still get tainting, please let me know.
		- Added Level statistics to the Rank Settings rank tooltip. It will show the lowest, average, median and highest level for that rank.
	2.06.01
		- Finally fixed the scrolling on the list panels so that when you scroll down with the mouse, they actually scroll down, not up (and vice versa).
		- Typing '/sgp' will now show the UI instead of a list of commands. The old '/sgp show|hide|settings' will still work too, just in case you need them.
	2.06.00
		- Added an Automation settings tab that allows you to automatically promote or demote at various times.
		- Added a setting to allow you to send a guild message after an inactivity kick took place. You will find it in the Guild Remove tab.
		- Fixed a bug with the scale slider. Blizzard apparently removed something I was using for it.
		- Fixed a bug where the statistics for Total and Weekly XP for each rank were not being shown at the end of the Rank tooltips. They should now show properly.
	2.05.05
		- Updated TOC to 5.4
	2.05.04
		- Updated TOC to 5.3
	2.05.03
		- Fixed issue with creating defaults for new guilds
	2.05.02
		- Fixed UI and processing issues with duplicate rank names.
		- Fixed an issue when loading saved settings when guild rank names didnt match saved rank names.
	2.05.01
		- Updated TOC to 5.2
	2.05.00
		- Fixed a bug with the export feature. With any luck it should work as intended now.
		- The addon should no longer revert to default settings if you only change a ranks name. It will still revert to default settings if the number of ranks changes.
		- Implemented a tooltip for each rank header in the Rank Settings tab. This will tell you what each ranks permissions are, as well as various statistics that may be of use.
		- Possibly introduced new bugs. I haven't had a great deal of time to fully test this version. Use 2.04.02 and report the bugs if necessary.
	2.04.02
		- Fixed a bug that allowed you to import settings from someone with a different version of the addon or even someone in a different guild.
	2.04.01
		- Added the ability to convert public and officer notes from the old filter method to the new method.
			- You will find this in the General Settings tab.
	2.04.00
		- Due to significant changes in this version, your settings will be reset to default!
		- Added a General Settings tab within which I added the ability to change the UI's scale.
		- Added a Guild Removal tab within which you'll be able to kick people from the guild based on days offline.
		- Overhauled the Filters.
			- Instead of requiring each filter to be a single word, such as "DNP DND DNL", it now requires 1 word.
			- You start the word with the filter prefix (default !) and then follow that up with the filters.
			- So, instead of the old "DNP DND DNL" you can now change it to "!pdl". Bearing in mind that these are default values.
		- Added two new filters. Do Not Kick and Not An Alt.
			- A person with the Do Not Kick filter (default !k) will be ignored by the new Guild Removal feature.
			- A person with the Not an Alt filter (default !a) will not be considered an alt, even if they have a name in their note. Simplez.
	2.03.00
		- Added a list for each filter into the Filters tab of the settings window. They will show you who is currently being filtered.
	2.02.03
		- Fixed a bug where the Individual Alt Mode was basically being ignored.
	2.02.02
		- The Export, Promote and Demote buttons will be disabled, just like the Find button, if you decide not to reload your UI when critical guild changes occur.
	2.02.01
		- The warning that your settings have been reset due to changes in guild ranks will no longer spam you if you decide not to reload the UI.
		- The Find button will be disabled if you decide not to reload your UI when critical guild changes occur.
	2.02.00 - Beta
		- Changing the number, order or name of guild ranks will cause the saved settings to restore to default.
		- When the settings are restored to default, a warning will pop up to show that it has happened.
		- Added an Export option where you can export your settings to other people.
	2.01.00 - Beta
		- First stable Beta release.

]]
SGP = {
	DefaultSettings = {
		TimeInGuild = 0;
		TimeOffline = 50;
		Level = 0;
		Achievement = 0;
		Reputation = 4; -- 4 is Neutral just for reference. 8 is Exalted.
		Attainable = 0;
		AllowPromote = 0;
		AllowDemote = 0;
		AltNote = 1;
		AltMode = 1;
		FilterPrefix = "!";
		FilterDNP = 3;
		FilterDNPText = "p";
		FilterDND = 3;
		FilterDNDText = "d";
		FilterDNL = 3;
		FilterDNLText = "l";
		FilterDNK = 3;
		FilterDNKText = "k";
		FilterNAA = 3;
		FilterNAAText = "a";
		AutoType = 1;
		AutoMode = 1;
		ExportIgnore = 0;
		InactiveDays = 30;
		InactiveRank = 1;
		InactiveMessageOn = true;
		InactiveMessage = "Don't be alarmed, just kicking people who've been inactive for a long time.";
		Scale = 100;
	};
	Settings = {
		GuildName;
		GuildNumRanks;
		GuildRanks = { };
		MemberJoinTimes = { };
		ReputationList = { };
		MemberList = { };
		MemberTallyList = { };
		InactiveList = { };
		OldFiltersList = { };
		DebugMode = false;
		ForceDefaultSettings = 0;
		ReloadLockdown = false;
		TemporaryImportIgnore = false;
	}; -- Currently in use Settings
	Events = { };
	Version = "3.01.06";
	VersionNumber = 30106;
	UIRendered = nil;
	SettingsLoaded = nil;
	RankFlagsUpdated = nil;
	AutomatedLogin = nil;
	AutomatedTimer = nil;
	AutomatedRepeater = nil;
	JoinTimesFilled = nil;
	KickTimer = nil;
	HEADER = "|cff69CCF0<SGP>|r: ";
	
	Import = { };
	
	PromoteList = { };
	DemoteList = { };
};

SGPFrameStuff = {
	DROPDOWNS = { };
	EDITBOXES = { };
	CHECKBOXES = { };
	BUTTONS = { };
	BUTTONTEXTS = { };
	LISTS = { };
	SLIDERS = { };
	UIFRAME = nil;
	PROMOTELISTFRAME = nil;
	DEMOTELISTFRAME = nil;
	
	ScrollFrameX = 10;
	ScrollFrameY = -10;
	ScrollFrameStep = 30;

	DefaultX = 10;
	MainContentX = 20;
	MainContentX2 = 40;
	
	MainHeaderY = -10;
	MainGeneralTextY = -40;
	MainGeneralDescriptionY = -60;
	MainRanksTextY = -95;
	MainRanksDescriptionY = -115;
	MainAltsTextY = -205;
	MainAltsDescriptionY = -225;
	MainFiltersTextY = -320;
	MainFiltersDescriptionY = -340;
	MainAutoTextY = -500;
	MainAutoDescriptionY = -520;
	MainMemJoinDateTextY = -585;
	MainMemJoinDateDescriptionY = -607;
	MainExportTextY = -660;
	MainExportDescriptionY = -680;
	MainKickTextY = -730;
	MainKickDescriptionY = -750;
	
	-- General Stuff
	ConvertFiltersListWidth = 400;
	ConvertFiltersListHeight = 400;
	
	GeneralManagementHeaderY = -10;
	
	GeneralContentX = 20;
	GeneralContentX2 = 40;
	
	GeneralScaleTextY = -40;
	GeneralScaleDescriptionY = -60;
	GeneralScaleSliderY = -100;
	
	-- Rank Stuff
	RankManagementHeaderY = -10;
	
	RankHeaderX = 20;
	RankContentX = 40;
	RankContentX2 = 210;
	RankContentX3 = 380;
	RankContentX4 = 68;
	RankContentX5 = 242;
	RanksListBaseY = -40;
	
	RanksListHeightOffset = 185;
	RankCheckboxOffset = 20;
	TimeInGuildOffset = 55;
	TimeOfflineOffset = 80;
	LevelOffset = 105;
	ReputationOffset = 130;
	AchievementOffset = 155;
	
	-- Alt Stuff
	AltManagementHeaderY = -10;
	
	AltHeaderX = 20;
	AltContentX = 40;
	AltContentX2 = 180;
	AltContentX3 = 60;
	AltContentX4 = 240;
	
	AltNoteTextY = -40;
	AltNoteDescriptionY = -60;
	AltNoteButtonY = -85;
	AltModeTextY = -130;
	AltModeDescriptionY = -150;
	AltModeButtonY = -175;
	
	-- Filter Stuff
	FilterManagementHeaderY = -10;
	FilterListWidth = 160;
	FilterListHeight = 220;
	
	FilterHeaderX = 20;
	FilterContentX = 40;
	FilterContentX2 = 180;
	FilterContentX3 = 60;
	FilterContentX4 = 260;
	
	FilterListsX1 = 50;
	FilterListsX2 = 220;
	FilterListsX3 = 390;
	
	FilterPrefixTextY = -40;
	FilterPrefixDescriptionY = -60;
	FilterPrefixButtonY = -95;
	FilterDoNotPromoteTextY = -130;
	FilterDoNotPromoteDescriptionY = -150;
	FilterDoNotPromoteButtonY = -205;
	FilterDoNotDemoteTextY = -250;
	FilterDoNotDemoteDescriptionY = -270;
	FilterDoNotDemoteButtonY = -325;
	FilterDoNotListTextY = -370;
	FilterDoNotListDescriptionY = -390;
	FilterDoNotListButtonY = -465;
	FilterDoNotKickTextY = -510;
	FilterDoNotKickDescriptionY = -530;
	FilterDoNotKickButtonY = -605;
	FilterNotAnAltTextY = -650;
	FilterNotAnAltDescriptionY = -670;
	FilterNotAnAltButtonY = -745;
	
	FilterListsTextY = -810;
	FilterListsDescriptionY = -830;
	FilterListsUpdateButtonY = -855;
	FilterListsTextY1 = -910;
	FilterListsTextY2 = -1160;
	FilterListsY1 = -930;
	FilterListsY2 = -1180;
	
	-- Auto Stuff
	AutoManagementHeaderY = -10;
	
	AutoHeaderX = 20;
	AutoContentX = 40;
	AutoContentX2 = 180;
	AutoContentX3 = 60;
	
	AutoTypeTextY = -40;
	AutoTypeDescriptionY = -60;
	AutoTypeButtonY = -115;
	AutoModeTextY = -160;
	AutoModeDescriptionY = -180;
	AutoModeButtonY = -205;
	
	-- MemJoinDate Stuff
	MemJoinDateManagementHeaderY = -10;
	
	MemJoinDateHeaderX = 20;
	MemJoinDateContentX = 40;
	MemJoinDateContentX2 = 140;
	MemJoinDateContentX3 = 60;
	MemJoinDateContentX4 = 280;
	MemJoinDateContentX5 = 140;
	MemJoinDateContentX6 = 180;
	MemJoinDateContentX7 = 220;
	MemJoinDateContentX8 = 350;
	
	MemJoinDateChangeTextY = -40;
	MemJoinDateChangeDescriptionY = -60;
	
	MemJoinDateEditboxY = -105;
	MemJoinDateEditboxY2 = -130;
	MemJoinDateEditboxY3 = -150;
	
	MemJoinDateListTextY = -210;
	MemJoinDateListY = -235;
	MemJoinDateListWidth = 287;
	MemJoinDateListHeight = 300;
	
	-- Export Stuff
	ExportManagementHeaderY = -10;
	
	ExportHeaderX = 20;
	ExportContentX = 40;
	ExportContentX2 = 60;
	ExportContentX3 = 180;
	
	ExportTextY = -40;
	ExportDescriptionY = -60;
	ExportButton1Y = -85;
	ExportButton2Y = -120;
	
	ExportIgnoreTextY = -180;
	ExportIgnoreCheckboxY = -205;
	
	-- Kick Stuff
	KickManagementHeaderY = -10;
	KickListWidth = 287;
	KickListHeight = 300;
	
	KickHeaderX = 20;
	KickContentX = 40;
	KickContentX2 = 60;
	KickContentX3 = 210;
	
	KickTextY = -40;
	KickDescriptionY = -60;
	KickEditboxY = -85;
	KickText2Y = -130;
	KickDescription2Y = -150;
	KickDropdownY = -170;
	KickText3Y = -220;
	KickDescription3Y = -240;
	KickCheckboxY = -265;
	KickEditbox2Y = -290;
	KickText4Y = -330;
	KickButtonY = -355;
	KickListY = -395;
	
	-- UI Stuff
	UIWidth = 240;
	UIHeight = 300;
	UIPadding = 0;
	
	UIX = 0;
	
	UIHeaderY = -35;
	UIFindButtonY = -70;
	UIBothButtonY = -120;
	UIPromoteButtonY = -155;
	UIDemoteButtonY = -190;
	UISettingsButtonY = -240;
	
	-- List Stuff
	UIListWidth = 250;
	
	PromoteListX = 0;
	DemoteListX = 0;
	
	PromoteListTextY = -20;
	PromoteListY = -40;
	DemoteListTextY = -20;
	DemoteListY = -40;
	
};

SGPData = { }; -- Saved Settings

StaticPopupDialogs["SGP_DefaultSettings"] = {
	text = "\n|cff69CCF0Swyn's Guild Promoter|r\n\nYour settings have been reset to default.\nYou will have to set them up again.\n\nReason: %s",
	button1 = "Ok",
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
	preferredIndex = 3,
}
StaticPopupDialogs["SGP_DefaultSettingsReload"] = {
	text = "\n|cff69CCF0Swyn's Guild Promoter|r\n\nYour settings have been reset to default.\n\nThe changes require you to reload the UI.\n\nReason: %s\n\nWant to reload the UI now?",
	button1 = "Yes",
	button2 = "No",
	OnAccept = function()
		ReloadUI();
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
	preferredIndex = 3,
}
StaticPopupDialogs["SGP_ReloadLockdown"] = {
	text = "\n|cff69CCF0Swyn's Guild Promoter|r\n\nThis feature is disabled due to changes made to the guild.\nYou will need to reload your UI in order to restore functionality.",
	button1 = "Ok",
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
	preferredIndex = 3,
}
StaticPopupDialogs["SGP_ImportSettings"] = {
	text = "\n|cff69CCF0Swyn's Guild Promoter|r\n\n%s has offered you settings for this addon.\n\nWould you like to import them?",
	button1 = "Yes",
	button2 = "No",
	OnAccept = function()
		if ( SGP.Import ~= nil ) then
			local sender = SGP.Import[1];
			SGP_DebugEcho("Importing Settings.");
			for i,v in pairs(SGP.Import) do
				if i > 1 then
					SGP_StringToSettings(v);
				end
			end
			-- Now make sure every element has the value it should based on new settings, and then save.
			SGP_FillRenderedOptionsWithSaveData();
			SGP_UpdateSettings();
			SGP_SaveSettings();
			SendAddonMessage("SGP", "Thankyou", "WHISPER", sender);
			ClearTable(SGP.Import);
		end
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
	preferredIndex = 3,
}
StaticPopupDialogs["SGP_ExportedSettings"] = {
	text = "\n|cff69CCF0Swyn's Guild Promoter|r\n\n%s just accepted the settings you gave them.",
	button1 = "Ok",
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
	preferredIndex = 3,
}
StaticPopupDialogs["SGP_ExportIgnore"] = {
	text = "\n|cff69CCF0Swyn's Guild Promoter|r\n\n%s is ignoring exports.",
	button1 = "Ok",
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
	preferredIndex = 3,
}
StaticPopupDialogs["SGP_KickKick"] = {
	text = "\n|cff69CCF0Swyn's Guild Promoter|r\n\nAre you sure you want to kick these people from your guild?",
	button1 = "Yes",
	button2 = "No",
	OnAccept = function()
		SGP_KickKick();
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
	preferredIndex = 3,
}
StaticPopupDialogs["SGP_MemJoinDateInvalidName"] = {
	text = "\n|cff69CCF0Swyn's Guild Promoter|r\n\nThe name you have chosen cannot be found within the current list of members.\nPlease type it exactly as it appears in the guild list.",
	button1 = "Ok",
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
	preferredIndex = 3,
}
StaticPopupDialogs["SGP_MemJoinDateSuccess"] = {
	text = "\n|cff69CCF0Swyn's Guild Promoter|r\n\nYou have successfully changed the join date of the chosen member.",
	button1 = "Ok",
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
	preferredIndex = 3,
}
	
function SGP_ChatEcho(txt)
	DEFAULT_CHAT_FRAME:AddMessage(SGP.HEADER .. txt, 0.25, 1.0, 0.25);
end

function SGP_ErrorEcho(txt)
	DEFAULT_CHAT_FRAME:AddMessage(SGP.HEADER .. txt, 1.0, 0.5, 0.5);
end

function SGP_DebugEcho(txt)
	if (SGP.Settings.DebugMode) then
		DEFAULT_CHAT_FRAME:AddMessage(SGP.HEADER .. txt, 0.75, 1.0, 0.25);
	end
end

function SGP_OnLoad()
	GuildRoster();
	SGPFrame:RegisterEvent("GUILD_ROSTER_UPDATE");
	SGPFrame:RegisterEvent("VARIABLES_LOADED");
end

function SGP_OnEvent(self, event, ...)
	if (event == "VARIABLES_LOADED") then
		SGP_DebugEcho("Variables loaded event triggered.");
		RegisterAddonMessagePrefix("SGP");
	end
	if (event == "GUILD_ROSTER_UPDATE") then
		SGP_DebugEcho("Guild Roster update event triggered.");
		SGP.Settings.GuildName = GetGuildInfo("player");
		if (SGP.Settings.GuildName ~= nil and SGP.Settings.GuildName ~= "") then
			if ( SGP.SettingsLoaded == nil ) then
				if (not SGPData[SGP.Settings.GuildName] or
				    SGPData[SGP.Settings.GuildName] == nil or
					SGPData[SGP.Settings.GuildName].ForceDefaultSettings == nil or
					SGPData[SGP.Settings.GuildName].ForceDefaultSettings ~= SGP.Settings.ForceDefaultSettings) then
					-- We need to make a new guild.
					SGP_CreateNewGuildSaveData(SGP.Settings.GuildName);
				else
					-- We need to load from save data.
					SGP_LoadSettings();
				end
				SGP.SettingsLoaded = true;
			else
				-- If settings are loaded, and we detect any changes, we need to reset to default.
				local numRanks = GuildControlGetNumRanks();
				local ranks = { };
				for i=1,numRanks do -- We include GM here so we can get it's Guild Name if we have to.
					ranks[i] = GuildControlGetRankName(i)..i;
				end
				-- Added check for ReloadLockdown because we only want to warn once, not every time a GuildRosterUpdate event is called, which is about once every 5-10 seconds.
				if ( not SGP.Settings.ReloadLockdown and (SGP.Settings.GuildNumRanks ~= numRanks or not SGP_CompareRanks(ranks, SGP.Settings.GuildRanks)) ) then
					SGP_DebugEcho("For some reason the number of ranks we have listed isn't correct. Ours: " .. SGP.Settings.GuildNumRanks .. ". Real: " .. numRanks .. ".");
					SGP.Settings.ReloadLockdown = true;
					StaticPopup_Show("SGP_DefaultSettingsReload", "The current ranks no longer match saved ranks for this guild.");
				end
			end
			SGP_RenderOptions();
		end
		-- On Login Automation ONLY.
		if ( SGP.UIRendered == true and SGP.SettingsLoaded == true and SGP.AutomatedLogin == nil and SGP.Settings.AutoType ~= nil and SGP.Settings.AutoType >= 2 ) then
			if ( SGP.Settings.AutoMode == 1 ) then
				SGP_AddEvent("SGP_AutomateLogin", 5, function() SGP_ChatEcho("Automating promotes."); SGP_Find(); SGP_Promote(); end);
			elseif ( SGP.Settings.AutoMode == 2 ) then
				SGP_AddEvent("SGP_AutomateLogin", 5, function() SGP_ChatEcho("Automating demotes."); SGP_Find(); SGP_Demote(); end);
			else
				SGP_AddEvent("SGP_AutomateLogin", 5, function() SGP_ChatEcho("Automating promotes and demotes."); SGP_Find(); SGP_Promote(); SGP_Demote(); end);
			end
			SGP.AutomatedLogin = true;
		end
		-- Timered Automation
		if ( SGP.UIRendered == true and SGP.SettingsLoaded == true and SGP.AutomatedRepeater == nil and SGP.Settings.AutoType ~= nil and SGP.Settings.AutoType > 2 ) then
			local autoTimer = 3600; -- 60 minutes.
			if ( SGP.Settings.AutoType == 3 ) then
				autoTimer = 900; -- 15 minutes
			elseif ( SGP.Settings.AutoType == 4 ) then
				autoTimer = 1800; -- 30 minutes
			end
			
			if ( SGP.Settings.AutoMode == 1 ) then
				SGP_AddEvent("SGP_AutomateTimer", autoTimer, function() if(SGP.Settings.AutoType<=2)then SGP.AutomatedRepeater:Cancel(); SGP.AutomatedRepeater=nil; else SGP_ChatEcho("Automating promotes."); SGP_Find(); SGP_Promote(); end end);
			elseif ( SGP.Settings.AutoMode == 2 ) then
				SGP_AddEvent("SGP_AutomateTimer", autoTimer, function() if(SGP.Settings.AutoType<=2)then SGP.AutomatedRepeater:Cancel(); SGP.AutomatedRepeater=nil; else SGP_ChatEcho("Automating demotes."); SGP_Find(); SGP_Demote(); end end);
			else
				SGP_AddEvent("SGP_AutomateTimer", autoTimer, function() if(SGP.Settings.AutoType<=2)then SGP.AutomatedRepeater:Cancel(); SGP.AutomatedRepeater=nil; else SGP_ChatEcho("Automating promotes and demotes."); SGP_Find(); SGP_Promote(); SGP_Demote(); end end);
			end
		end
		-- MemberJoinTimes Populated?
		if ( SGP.UIRendered == true and SGP.SettingsLoaded == true and SGP.JoinTimesFilled == nil and table.getn(SGP.Settings.MemberJoinTimes) == 0 and GetNumGuildMembers() > 0 ) then
			SGP_DebugEcho("Populating MemberJoinTimes: " .. GetNumGuildMembers());
			local memJoinTimes = { };
			for i=1,GetNumGuildMembers() do
				name = GetGuildRosterInfo(i)
				memJoinTimes[i] = {
					Name = name;
					Year = date("%Y");
					Month = date("%m");
					Day = date("%d");
					Hour = date("%H");
					Minute = date("%M");
					Second = date("%S");
				}
			end
			SGP.Settings.MemberJoinTimes = memJoinTimes
			SGP.JoinTimesFilled = true;
			SGP_SaveSettings();
		end
		-- MemberJoinTimes - Do we have new members?
		if ( SGP.UIRendered == true and SGP.SettingsLoaded == true and SGP.JoinTimesFilled == true and table.getn(SGP.Settings.MemberJoinTimes) < GetNumGuildMembers() and GetNumGuildMembers() > 0 ) then
			SGP_DebugEcho("We appear to have at least one new member. Adding them to MemberJoinTimes list " .. table.getn(SGP.Settings.MemberJoinTimes) .. ">" .. GetNumGuildMembers() .. ".");
			-- First, loop through every member, then check if they're already inside MemberJoinTimes
			local tempMemJoinTimes = SGP.Settings.MemberJoinTimes;
			for i=1, GetNumGuildMembers() do
				local name = GetGuildRosterInfo(i);
				local foundName = false;
				for k,v in pairs(tempMemJoinTimes) do
					if (v.Name == name) then
						foundName = true;
						break;
					end
				end
				if ( foundName == false ) then
					local newMember = {
						Name = name;
						Year = date("%Y");
						Month = date("%m");
						Day = date("%d");
						Hour = date("%H");
						Minute = date("%M");
						Second = date("%S");
					}
					table.insert(tempMemJoinTimes, newMember);
				end
			end
			SGP.Settings.MemberJoinTimes = tempMemJoinTimes;
			SGP_SaveSettings();
			SGP_DebugEcho("Just added the new members to the MemberJoinTimes list.");
		end
		-- MemberJoinTimes - Have we removed any members?
		if ( SGP.UIRendered == true and SGP.SettingsLoaded == true and SGP.JoinTimesFilled == true and table.getn(SGP.Settings.MemberJoinTimes) > GetNumGuildMembers() and GetNumGuildMembers() > 0 ) then
			SGP_DebugEcho("At least one member seems to have been kicked or left. Removing them from MemberJoinTimes list " .. table.getn(SGP.Settings.MemberJoinTimes) .. "<" .. GetNumGuildMembers() .. ".");
			-- First, loop through ever member within MemberJoinTimes then check if they're still in the guild.
			local tempMemJoinTimes = SGP.Settings.MemberJoinTimes;
			local toRemove = { };
			for i,v in pairs(tempMemJoinTimes) do
				local foundName = false;
				for k=1, GetNumGuildMembers() do
					local name = GetGuildRosterInfo(k);
					if (v.Name == name) then
						foundName = true;
						break;
					end
				end
				if ( foundName == false ) then
					table.insert(toRemove, i);
				end
			end
			for i,v in pairs(toRemove) do
				if ( tempMemJoinTimes[toRemove[i]] ~= nil ) then
					table.remove(tempMemJoinTimes, toRemove[i]);
				end
			end
			SGP.Settings.MemberJoinTimes = tempMemJoinTimes;
			SGP_SaveSettings();
			SGP_DebugEcho("Just removed the missing members from the MemberJoinTimes list.");
		end
	end
	
	if (event == "CHAT_MSG_ADDON") then
		local msgPrefix, msgMessage, msgType, msgSender = ...;
		if (msgPrefix == "SGP" and msgMessage and msgMessage ~= "") then
			SGP_DebugEcho("SGP chat message addon event triggered by " .. msgSender .. " with message '" .. msgMessage .. "' in the channel '" .. msgType .. "' with prefix '" .. msgPrefix .. "'.");
			-- If we recieve settings, ask if we want to import them.
			local realmName = string.gsub(GetRealmName(), " ", "");
			local n = string.gsub(msgSender, "-"..realmName, "");
			if ( string.find(msgMessage, "START_EXPORT") and string.find(msgMessage, SGP.VersionNumber) and string.find(msgMessage, SGP.Settings.GuildName) and n ~= UnitName("player") and SGP.Settings.ExportIgnore ~= 1 ) then
				ClearTable(SGP.Import);
				table.insert(SGP.Import, msgSender);
			end
			if ( string.sub(msgMessage, 1, 3) == "Exp" and msgSender == SGP.Import[1] and SGP.Settings.ExportIgnore ~= 1 ) then
				table.insert(SGP.Import, msgMessage);
			end
			if ( msgMessage == "END_EXPORT" and msgSender == SGP.Import[1] and SGP.Settings.ExportIgnore ~= 1 ) then
				if (not SGP.Settings.ReloadLockdown) then
					StaticPopup_Show("SGP_ImportSettings", msgSender);
				else
					ClearTable(SGP.Import);
				end
			end
			if ( msgMessage == "Thankyou" and msgSender ~= UnitName("player") ) then
				StaticPopup_Show("SGP_ExportedSettings", msgSender);
			end
			if ( msgMessage == "Anyone out there?" ) then
				SendAddonMessage("SGP", "I am.", "WHISPER", msgSender);
			end
			if ( SGP.Settings.ExportIgnore == 1 and msgSender ~= UnitName("player") ) then
				SendAddonMessage("SGP", "Ignored", "WHISPER", msgSender);
			end
			if ( msgMessage == "Ignored" and msgSender ~= UnitName("player") ) then
				StaticPopup_Show("SGP_ExportIgnore", msgSender);
			end
		end
	end
end

function SGP_CreateNewGuildSaveData(GuildName)
	-- Force Default Settings Chat Output
	-- I really didn't want to do this, but it does mean everyone uses current settings.
	if (SGPData[SGP.Settings.GuildName] ~= nil and (SGPData[SGP.Settings.GuildName].ForceDefaultSettings == nil or SGPData[SGP.Settings.GuildName].ForceDefaultSettings ~= SGP.Settings.ForceDefaultSettings)) then
		StaticPopup_Show("SGP_DefaultSettings", "There were some very extensive changes done to the addon that require brand new settings.");
	end
	
	SGP_DebugEcho("Making new guild save data with name: " .. GuildName .. ".");
	GuildRoster();
	local numRanks = GuildControlGetNumRanks();
	SGP_DebugEcho("New Guild, Num Ranks = " .. numRanks .. ".");
	local ranks = { };
	-- Defaults for when new guild is made.
	for i=1,numRanks do -- We include GM here so we can get it's Guild Name if we have to.
		local tempName = GuildControlGetRankName(i);
		ranks[i] = {
			RankIndex = i;
			RankDisplayName = tempName;
			RankName = tempName..i;
			TimeInGuild = SGP.DefaultSettings.TimeInGuild;
			TimeOffline = SGP.DefaultSettings.TimeOffline;
			Level = SGP.DefaultSettings.Level;
			Achievement = SGP.DefaultSettings.Achievement;
			Reputation = SGP.DefaultSettings.Reputation;
			Attainable = SGP.DefaultSettings.Attainable;
			AllowPromote = SGP.DefaultSettings.AllowPromote;
			AllowDemote = SGP.DefaultSettings.AllowDemote;
		};
	end
	SGP.Settings.MemberJoinTimes = { };
	SGP.Settings.GuildNumRanks = numRanks;
	SGP.Settings.GuildRanks = ranks;
	SGP.Settings.AltNote = SGP.DefaultSettings.AltNote;
	SGP.Settings.AltMode = SGP.DefaultSettings.AltMode;
	SGP.Settings.AltRank = numRanks-1;
	SGP.Settings.FilterPrefix = SGP.DefaultSettings.FilterPrefix;
	SGP.Settings.FilterDNP = SGP.DefaultSettings.FilterDNP;
	SGP.Settings.FilterDNPText = SGP.DefaultSettings.FilterDNPText;
	SGP.Settings.FilterDND = SGP.DefaultSettings.FilterDND;
	SGP.Settings.FilterDNDText = SGP.DefaultSettings.FilterDNDText;
	SGP.Settings.FilterDNL = SGP.DefaultSettings.FilterDNL;
	SGP.Settings.FilterDNLText = SGP.DefaultSettings.FilterDNLText;
	SGP.Settings.FilterDNK = SGP.DefaultSettings.FilterDNK;
	SGP.Settings.FilterDNKText = SGP.DefaultSettings.FilterDNKText;
	SGP.Settings.FilterNAA = SGP.DefaultSettings.FilterNAA;
	SGP.Settings.FilterNAAText = SGP.DefaultSettings.FilterNAAText;
	SGP.Settings.AutoType = SGP.DefaultSettings.Type;
	SGP.Settings.AutoMode = SGP.DefaultSettings.AutoMode;
	SGP.Settings.ExportIngore = SGP.DefaultSettings.ExportIgnore;
	SGP.Settings.InactiveDays = SGP.DefaultSettings.InactiveDays;
	SGP.Settings.InactiveRank = SGP.DefaultSettings.InactiveRank;
	SGP.Settings.InactiveMessageOn = SGP.DefaultSettings.InactiveMessageOn;
	SGP.Settings.InactiveMessage = SGP.DefaultSettings.InactiveMessage;
	SGP.Settings.Scale = SGP.DefaultSettings.Scale;
end

function SGP_SaveSettings()
	GuildRoster();
	local GuildName = SGP.Settings.GuildName;
	if ( SGP.UIRendered ~= nil and GuildName ~= nil ) then
		SGP_DebugEcho("Saving Settings.");

		-- Save to SGPData from Raw data.
		SGPData[GuildName] = {
			ForceDefaultSettings = SGP.Settings.ForceDefaultSettings;
			MemberJoinTimes = SGP.Settings.MemberJoinTimes;
			GuildNumRanks = SGP.Settings.GuildNumRanks;
			GuildRanks = SGP.Settings.GuildRanks;
			AltNote = SGP.Settings.AltNote;
			AltMode = SGP.Settings.AltMode;
			AltRank = SGP.Settings.AltRank;
			FilterPrefix = SGP.Settings.FilterPrefix;
			FilterDNP = SGP.Settings.FilterDNP;
			FilterDNPText = SGP.Settings.FilterDNPText;
			FilterDND = SGP.Settings.FilterDND;
			FilterDNDText = SGP.Settings.FilterDNDText;
			FilterDNL = SGP.Settings.FilterDNL;
			FilterDNLText = SGP.Settings.FilterDNLText;
			FilterDNK = SGP.Settings.FilterDNK;
			FilterDNKText = SGP.Settings.FilterDNKText;
			FilterNAA = SGP.Settings.FilterNAA;
			FilterNAAText = SGP.Settings.FilterNAAText;
			AutoType = SGP.Settings.AutoType;
			AutoMode = SGP.Settings.AutoMode;
			ExportIgnore = SGP.Settings.ExportIgnore;
			InactiveDays = SGP.Settings.InactiveDays;
			InactiveRank = SGP.Settings.InactiveRank;
			InactiveMessageOn = SGP.Settings.InactiveMessageOn;
			InactiveMessage = SGP.Settings.InactiveMessage;
			Scale = SGP.Settings.Scale;
		};
	end
end

function SGP_LoadSettings()
	SGP_DebugEcho("Loading Settings.");
	GuildRoster();
	local GuildName = SGP.Settings.GuildName;
	local GuildNumRanks = GuildControlGetNumRanks();
	-- local GuildRanks = { };
	
    -- SGP_DebugEcho("Guild Ranks Build Array");	
	-- for i=1,GuildNumRanks do
	--	SGP_DebugEcho("Guild Ranks = "..GuildControlGetRankName(i)..i);	
	--	table.insert(GuildRanks, GuildControlGetRankName(i));
	-- end
	
	-- If our saved number of ranks matches, and the list of ranks match, then we're good to go, otherwise, use new data.
	if ( SGPData[GuildName].GuildNumRanks == GuildNumRanks and (SGPData[GuildName].ForceDefaultSettings ~= nil and SGPData[GuildName].ForceDefaultSettings == SGP.Settings.ForceDefaultSettings) ) then
		SGP.Settings.GuildNumRanks = SGPData[GuildName].GuildNumRanks;
		if ( table.getn(SGPData[GuildName].MemberJoinTimes) > 0 ) then
			SGP.Settings.MemberJoinTimes = SGPData[GuildName].MemberJoinTimes;
			SGP.JoinTimesFilled = true;
		else
			SGP.Settings.MemberJoinTimes = { };
			SGP.JoinTimesFilled = nil;
		end
		SGP.Settings.AltNote = SGPData[GuildName].AltNote;
		SGP.Settings.AltMode = SGPData[GuildName].AltMode;
		SGP.Settings.AltRank = SGPData[GuildName].AltRank;
		SGP.Settings.FilterPrefix = SGPData[GuildName].FilterPrefix;
		SGP.Settings.FilterDNP = SGPData[GuildName].FilterDNP;
		SGP.Settings.FilterDNPText = SGPData[GuildName].FilterDNPText;
		SGP.Settings.FilterDND = SGPData[GuildName].FilterDND;
		SGP.Settings.FilterDNDText = SGPData[GuildName].FilterDNDText;
		SGP.Settings.FilterDNL = SGPData[GuildName].FilterDNL;
		SGP.Settings.FilterDNLText = SGPData[GuildName].FilterDNLText;
		SGP.Settings.FilterDNK = SGPData[GuildName].FilterDNK;
		SGP.Settings.FilterDNKText = SGPData[GuildName].FilterDNKText;
		SGP.Settings.FilterNAA = SGPData[GuildName].FilterNAA;
		SGP.Settings.FilterNAAText = SGPData[GuildName].FilterNAAText;
		if ( SGPData[GuildName].AutoType ~= nil and SGPData[GuildName].AutoType ~= "" ) then
			SGP.Settings.AutoType = SGPData[GuildName].AutoType;
			SGP.Settings.AutoMode = SGPData[GuildName].AutoMode;
		else
			SGP.Settings.AutoType = SGP.DefaultSettings.AutoType;
			SGP.Settings.AutoMode = SGP.DefaultSettings.AutoMode;
		end
		SGP.Settings.ExportIgnore = SGPData[GuildName].ExportIgnore;
		SGP.Settings.InactiveDays = SGPData[GuildName].InactiveDays;
		SGP.Settings.InactiveRank = SGPData[GuildName].InactiveRank;
		if ( SGPData[GuildName].InactiveMessage ~= nil and SGPData[GuildName].InactiveMessage ~= "" ) then
			SGP.Settings.InactiveMessageOn = SGPData[GuildName].InactiveMessageOn;
			SGP.Settings.InactiveMessage = SGPData[GuildName].InactiveMessage;
		else
			SGP.Settings.InactiveMessageOn = SGP.DefaultSettings.InactiveMessageOn;
			SGP.Settings.InactiveMessage = SGP.DefaultSettings.InactiveMessage;
		end
		SGP.Settings.Scale = SGPData[GuildName].Scale;
		
		-- If our saved rank names do not match current rank names, simply use the correct ones. As long as the number of ranks remains the same, we shouldn't have any problems.
		-- We don't really need to do this. We could just use current ones anyway. But we'll see.
		
		--if ( SGP_CompareRanks(GuildRanks, SGPData[GuildName].GuildRanks) ) then
		--	SGP_DebugEcho("Guild Ranks = SGPData[GuildName].GuildRanks;");	
		--	SGP.Settings.GuildRanks = SGPData[GuildName].GuildRanks;
		--else
		--	SGP_DebugEcho("Guild Ranks = GuildRanks;");	
		--	SGP.Settings.GuildRanks = GuildRanks;
		--end
		
		-- Update Guild Ranks, we only really care if there are the same number, not the names.
		SGP.Settings.GuildRanks = SGPData[GuildName].GuildRanks;
		for i=1,GuildNumRanks do
			SGP.Settings.GuildRanks[i].RankName = GuildControlGetRankName(i)..i;
			SGP.Settings.GuildRanks[i].RankDisplayName = GuildControlGetRankName(i);
		end
		
		SGP_DebugEcho("Loaded.");
	else 
		SGP_CreateNewGuildSaveData(GuildName);
		StaticPopup_Show("SGP_DefaultSettings", "The current ranks no longer match saved ranks for this guild.");
	end
	
end

function SGP_CompareRanks(ranks,data)
	SGP_DebugEcho("Comparing actual ranks with saved ranks.");
	for i,v in pairs(ranks) do
		if (v ~= data[i].RankName) then
			SGP_DebugEcho("Comparing ranks, they failed to match. a: " .. v .. ". b: " .. data[i].RankName);
			return false;
		end
	end
	return true;
end

function SGP_RenderOptions()
	GuildRoster();
	local GuildName = GetGuildInfo("player");
	
	if ( SGP.UIRendered == nil and GuildName ~= nil ) then
		SGP_DebugEcho("Rendering Options.");
		SGP.UIRendered = true;
		
		-- Main Frame
		
		local ConfigPanel = CreateFrame("FRAME", "SGP_MainFrame");
		ConfigPanel.name = SGPLocal.SGPShort;
		InterfaceOptions_AddCategory(ConfigPanel);
		ConfigPanel:RegisterEvent("CHAT_MSG_ADDON");
		ConfigPanel:SetScript("OnEvent", SGP_OnEvent);
		
		local ConfigScrollFrame = CreateFrame("ScrollFrame", nil, ConfigPanel);
		ConfigScrollFrame:SetPoint("TOPLEFT", SGPFrameStuff.ScrollFrameX, SGPFrameStuff.ScrollFrameY);
		ConfigScrollFrame:SetPoint("BOTTOMRIGHT", SGPFrameStuff.ScrollFrameY, SGPFrameStuff.ScrollFrameX);
		ConfigPanel.scrollframe = ConfigScrollFrame;
		
		local ConfigScrollBar = CreateFrame("Slider", nil, ConfigScrollFrame, "UIPanelScrollBarTemplate");
		ConfigScrollBar:SetPoint("TOPLEFT", ConfigPanel, "TOPRIGHT", -21, -22);
		ConfigScrollBar:SetPoint("BOTTOMLEFT", ConfigPanel, "BOTTOMRIGHT", -21, 21);
		local ConfigScrollBarMax = 250;
		ConfigScrollBar:SetMinMaxValues(1, ConfigScrollBarMax);
		ConfigScrollBar:SetValueStep(1);
		ConfigScrollBar.scrollStep = 1;
		ConfigScrollBar:SetValue(0);
		ConfigScrollBar:SetWidth(16);
		ConfigScrollBar:SetScript("OnValueChanged", function (self, value)
													  self:GetParent():SetVerticalScroll(value);
												  end);
		local ConfigScrollBarTexture = ConfigScrollBar:CreateTexture(nil, "BACKGROUND");
		ConfigScrollBarTexture:SetAllPoints(ConfigScrollBar);
		ConfigScrollBarTexture:SetTexture(0, 0, 0, 0.4);
		ConfigPanel.ConfigScrollBar = ConfigScrollFrame;
		
		ConfigScrollFrame:EnableMouseWheel(true);
		ConfigScrollFrame:SetScript("OnMouseWheel", function(self, delta)
														if delta == 1 then
															if IsShiftKeyDown() then
																ConfigScrollBar:SetValue(1);
															else
																if (ConfigScrollBar:GetValue() - SGPFrameStuff.ScrollFrameStep < 1) then
																	ConfigScrollBar:SetValue(1);
																else
																	ConfigScrollBar:SetValue(ConfigScrollBar:GetValue()-SGPFrameStuff.ScrollFrameStep);
																end
															end
														else
															if IsShiftKeyDown() then
																ConfigScrollBar:SetValue(ConfigScrollBarMax);
															else
																if (ConfigScrollBar:GetValue() + SGPFrameStuff.ScrollFrameStep > ConfigScrollBarMax) then
																	ConfigScrollBar:SetValue(ConfigScrollBarMax);
																else
																	ConfigScrollBar:SetValue(ConfigScrollBar:GetValue()+SGPFrameStuff.ScrollFrameStep);
																end
															end
														end
													end);
		
		local ConfigContentPanel = CreateFrame("Frame", nil, ConfigScrollFrame);
		ConfigContentPanel:SetSize(200, 200);
		ConfigScrollFrame.content = ConfigContentPanel;
		
		ConfigScrollFrame:SetScrollChild(ConfigContentPanel);
		
		-- Stuff to put in Main Content Panel
		
		local MainHeader = ConfigContentPanel:CreateFontString(nil, "ARTWORK", "GameFontGreenLarge");
		MainHeader:SetPoint("TOPLEFT", SGPFrameStuff.DefaultX, SGPFrameStuff.MainHeaderY);
		MainHeader:SetText("Swyn's " .. SGPLocal.GuildPromoter .. " - " .. SGP.Version);
		
		MainGeneralText = ConfigContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		MainGeneralText:SetPoint("TOPLEFT", SGPFrameStuff.MainContentX, SGPFrameStuff.MainGeneralTextY);
		MainGeneralText:SetText(SGPLocal.MainGeneralText);
		
		MainGeneralDescription = ConfigContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		MainGeneralDescription:SetPoint("TOPLEFT", SGPFrameStuff.MainContentX2, SGPFrameStuff.MainGeneralDescriptionY);
		MainGeneralDescription:SetText(SGPLocal.MainGeneralDescription);
		MainGeneralDescription:SetJustifyH("LEFT");
		
		MainRanksText = ConfigContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		MainRanksText:SetPoint("TOPLEFT", SGPFrameStuff.MainContentX, SGPFrameStuff.MainRanksTextY);
		MainRanksText:SetText(SGPLocal.MainRanksText);
		
		MainRanksDescription = ConfigContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		MainRanksDescription:SetPoint("TOPLEFT", SGPFrameStuff.MainContentX2, SGPFrameStuff.MainRanksDescriptionY);
		MainRanksDescription:SetText(SGPLocal.MainRanksDescription);
		MainRanksDescription:SetJustifyH("LEFT");
		
		MainAltsText = ConfigContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		MainAltsText:SetPoint("TOPLEFT", SGPFrameStuff.MainContentX, SGPFrameStuff.MainAltsTextY);
		MainAltsText:SetText(SGPLocal.MainAltsText);
		
		MainAltsDescription = ConfigContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		MainAltsDescription:SetPoint("TOPLEFT", SGPFrameStuff.MainContentX2, SGPFrameStuff.MainAltsDescriptionY);
		MainAltsDescription:SetText(SGPLocal.MainAltsDescription);
		MainAltsDescription:SetJustifyH("LEFT");
		
		MainFiltersText = ConfigContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		MainFiltersText:SetPoint("TOPLEFT", SGPFrameStuff.MainContentX, SGPFrameStuff.MainFiltersTextY);
		MainFiltersText:SetText(SGPLocal.MainFiltersText);
		
		MainFiltersDescription = ConfigContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		MainFiltersDescription:SetPoint("TOPLEFT", SGPFrameStuff.MainContentX2, SGPFrameStuff.MainFiltersDescriptionY);
		MainFiltersDescription:SetText(SGPLocal.MainFiltersDescription);
		MainFiltersDescription:SetJustifyH("LEFT");
		
		MainMemJoinDateText = ConfigContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		MainMemJoinDateText:SetPoint("TOPLEFT", SGPFrameStuff.MainContentX, SGPFrameStuff.MainMemJoinDateTextY);
		MainMemJoinDateText:SetText(SGPLocal.MainMemJoinDateText);
		
		MainMemJoinDateDescription = ConfigContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		MainMemJoinDateDescription:SetPoint("TOPLEFT", SGPFrameStuff.MainContentX2, SGPFrameStuff.MainMemJoinDateDescriptionY);
		MainMemJoinDateDescription:SetText(SGPLocal.MainMemJoinDateDescription);
		MainMemJoinDateDescription:SetJustifyH("LEFT");
		
		MainAutoText = ConfigContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		MainAutoText:SetPoint("TOPLEFT", SGPFrameStuff.MainContentX, SGPFrameStuff.MainAutoTextY);
		MainAutoText:SetText(SGPLocal.MainAutoText);
		
		MainAutoDescription = ConfigContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		MainAutoDescription:SetPoint("TOPLEFT", SGPFrameStuff.MainContentX2, SGPFrameStuff.MainAutoDescriptionY);
		MainAutoDescription:SetText(SGPLocal.MainAutoDescription);
		MainAutoDescription:SetJustifyH("LEFT");
		
		MainExportText = ConfigContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		MainExportText:SetPoint("TOPLEFT", SGPFrameStuff.MainContentX, SGPFrameStuff.MainExportTextY);
		MainExportText:SetText(SGPLocal.MainExportText);
		
		MainExportDescription = ConfigContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		MainExportDescription:SetPoint("TOPLEFT", SGPFrameStuff.MainContentX2, SGPFrameStuff.MainExportDescriptionY);
		MainExportDescription:SetText(SGPLocal.MainExportDescription);
		MainExportDescription:SetJustifyH("LEFT");
		
		MainKickText = ConfigContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		MainKickText:SetPoint("TOPLEFT", SGPFrameStuff.MainContentX, SGPFrameStuff.MainKickTextY);
		MainKickText:SetText(SGPLocal.MainKickText);
		
		MainKickDescription = ConfigContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		MainKickDescription:SetPoint("TOPLEFT", SGPFrameStuff.MainContentX2, SGPFrameStuff.MainKickDescriptionY);
		MainKickDescription:SetText(SGPLocal.MainKickDescription);
		MainKickDescription:SetJustifyH("LEFT");
		
		-- General Scroll and Content Frames
		
		local GeneralPanel = CreateFrame("FRAME","SGP_GeneralFrame");
		GeneralPanel.name = SGPLocal.GeneralPanelName;
		GeneralPanel.parent = ConfigPanel.name;
		InterfaceOptions_AddCategory(GeneralPanel);
		
		local GeneralScrollFrame = CreateFrame("ScrollFrame", nil, GeneralPanel);
		GeneralScrollFrame:SetPoint("TOPLEFT", SGPFrameStuff.ScrollFrameX, SGPFrameStuff.ScrollFrameY);
		GeneralScrollFrame:SetPoint("BOTTOMRIGHT", SGPFrameStuff.ScrollFrameY, SGPFrameStuff.ScrollFrameX);
		GeneralPanel.scrollframe = GeneralScrollFrame;
		
		local GeneralScrollBar = CreateFrame("Slider", nil, GeneralScrollFrame, "UIPanelScrollBarTemplate");
		GeneralScrollBar:SetPoint("TOPLEFT", GeneralPanel, "TOPRIGHT", -21, -22);
		GeneralScrollBar:SetPoint("BOTTOMLEFT", GeneralPanel, "BOTTOMRIGHT", -21, 21);
		local GeneralScrollBarMax = 260;
		GeneralScrollBar:SetMinMaxValues(1, GeneralScrollBarMax);
		GeneralScrollBar:SetValueStep(1);
		GeneralScrollBar.scrollStep = 1;
		GeneralScrollBar:SetValue(0);
		GeneralScrollBar:SetWidth(16);
		GeneralScrollBar:SetScript("OnValueChanged", function (self, value)
													  self:GetParent():SetVerticalScroll(value);
												  end);
		local GeneralScrollBarTexture = GeneralScrollBar:CreateTexture(nil, "BACKGROUND");
		GeneralScrollBarTexture:SetAllPoints(GeneralScrollBar);
		GeneralScrollBarTexture:SetTexture(0, 0, 0, 0.4);
		GeneralPanel.GeneralScrollBar = GeneralScrollFrame;
		
		GeneralScrollFrame:EnableMouseWheel(true);
		GeneralScrollFrame:SetScript("OnMouseWheel", function(self, delta)
														if delta == 1 then
															if IsShiftKeyDown() then
																GeneralScrollBar:SetValue(1);
															else
																if (GeneralScrollBar:GetValue() - SGPFrameStuff.ScrollFrameStep < 1) then
																	GeneralScrollBar:SetValue(1);
																else
																	GeneralScrollBar:SetValue(GeneralScrollBar:GetValue()-SGPFrameStuff.ScrollFrameStep);
																end
															end
														else
															if IsShiftKeyDown() then
																GeneralScrollBar:SetValue(GeneralScrollBarMax);
															else
																if (GeneralScrollBar:GetValue() + SGPFrameStuff.ScrollFrameStep > GeneralScrollBarMax) then
																	GeneralScrollBar:SetValue(GeneralScrollBarMax);
																else
																	GeneralScrollBar:SetValue(GeneralScrollBar:GetValue()+SGPFrameStuff.ScrollFrameStep);
																end
															end
														end
													end);
		
		local GeneralContentPanel = CreateFrame("Frame", nil, GeneralScrollFrame);
		GeneralContentPanel:SetSize(200, 200);
		GeneralScrollFrame.content = GeneralContentPanel;
		
		GeneralScrollFrame:SetScrollChild(GeneralContentPanel);
		
		-- Stuff to put into General Pane.
		
		local GeneralManagementHeader = GeneralContentPanel:CreateFontString(nil, "ARTWORK", "GameFontGreenLarge");
		GeneralManagementHeader:SetPoint("TOPLEFT", SGPFrameStuff.DefaultX, SGPFrameStuff.GeneralManagementHeaderY);
		GeneralManagementHeader:SetText(SGPLocal.GeneralManagementHeader);
		
		local GeneralScaleText = GeneralContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		GeneralScaleText:SetPoint("TOPLEFT", SGPFrameStuff.GeneralContentX, SGPFrameStuff.GeneralScaleTextY);
		GeneralScaleText:SetText(SGPLocal.GeneralScaleText);
		
		local GeneralScaleDescription = GeneralContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		GeneralScaleDescription:SetPoint("TOPLEFT", SGPFrameStuff.GeneralContentX+5, SGPFrameStuff.GeneralScaleDescriptionY);
		GeneralScaleDescription:SetText(SGPLocal.GeneralScaleDescription);
		
		local GeneralScaleSlider = SGP_CreateSlider("ScaleSlider", GeneralContentPanel, 200, 20, SGPFrameStuff.GeneralContentX2, SGPFrameStuff.GeneralScaleSliderY, nil);
		
		-- Ranks Scroll and Content Frames
		
		local RanksPanel = CreateFrame("FRAME","SGP_RanksFrame");
		RanksPanel.name = SGPLocal.RanksPanelName;
		RanksPanel.parent = ConfigPanel.name;
		InterfaceOptions_AddCategory(RanksPanel);
		
		local RanksScrollFrame = CreateFrame("ScrollFrame", nil, RanksPanel);
		RanksScrollFrame:SetPoint("TOPLEFT", SGPFrameStuff.ScrollFrameX, SGPFrameStuff.ScrollFrameY);
		RanksScrollFrame:SetPoint("BOTTOMRIGHT", SGPFrameStuff.ScrollFrameY, SGPFrameStuff.ScrollFrameX);
		RanksPanel.scrollframe = RanksScrollFrame;
		
		local RanksScrollBar = CreateFrame("Slider", nil, RanksScrollFrame, "UIPanelScrollBarTemplate");
		RanksScrollBar:SetPoint("TOPLEFT", RanksPanel, "TOPRIGHT", -21, -22);
		RanksScrollBar:SetPoint("BOTTOMLEFT", RanksPanel, "BOTTOMRIGHT", -21, 21);
		local RanksScrollBarMax = ((SGP.Settings.GuildNumRanks-1)*SGPFrameStuff.RanksListHeightOffset)+(-SGPFrameStuff.RanksListBaseY)-550;
		RanksScrollBar:SetMinMaxValues(1, RanksScrollBarMax);
		RanksScrollBar:SetValueStep(1);
		RanksScrollBar.scrollStep = 1;
		RanksScrollBar:SetValue(0);
		RanksScrollBar:SetWidth(16);
		RanksScrollBar:SetScript("OnValueChanged", function (self, value)
													  self:GetParent():SetVerticalScroll(value);
												  end);
		local RanksScrollBarTexture = RanksScrollBar:CreateTexture(nil, "BACKGROUND");
		RanksScrollBarTexture:SetAllPoints(RanksScrollBar);
		RanksScrollBarTexture:SetTexture(0, 0, 0, 0.4);
		RanksPanel.RanksScrollBar = RanksScrollFrame;
		
		RanksScrollFrame:EnableMouseWheel(true);
		RanksScrollFrame:SetScript("OnMouseWheel", function(self, delta)
														if delta == 1 then
															if IsShiftKeyDown() then
																RanksScrollBar:SetValue(1);
															else
																if (RanksScrollBar:GetValue() - SGPFrameStuff.ScrollFrameStep < 1) then
																	RanksScrollBar:SetValue(1);
																else
																	RanksScrollBar:SetValue(RanksScrollBar:GetValue()-SGPFrameStuff.ScrollFrameStep);
																end
															end
														else
															if IsShiftKeyDown() then
																RanksScrollBar:SetValue(RanksScrollBarMax);
															else
																if (RanksScrollBar:GetValue() + SGPFrameStuff.ScrollFrameStep > RanksScrollBarMax) then
																	RanksScrollBar:SetValue(RanksScrollBarMax);
																else
																	RanksScrollBar:SetValue(RanksScrollBar:GetValue()+SGPFrameStuff.ScrollFrameStep);
																end
															end
														end
													end);
		
		local RanksContentPanel = CreateFrame("Frame", nil, RanksScrollFrame);
		RanksContentPanel:SetSize(200, 200);
		RanksScrollFrame.content = RanksContentPanel;
		
		RanksScrollFrame:SetScrollChild(RanksContentPanel);
		
		-- Stuff to put into Rank Pane.
		
		local RankManagementHeader = RanksContentPanel:CreateFontString(nil, "ARTWORK", "GameFontGreenLarge");
		RankManagementHeader:SetPoint("TOPLEFT", SGPFrameStuff.DefaultX, SGPFrameStuff.RankManagementHeaderY);
		RankManagementHeader:SetText(SGPLocal.RankManagementHeader);
		
		--[[ Reputation Drop Down Menu Contents ]]
		for i=4,8 do
			table.insert(SGP.Settings.ReputationList, getglobal("FACTION_STANDING_LABEL"..i));
		end
		
		-- Loop over every rank (except GM) and display stuff.
		for i=2,GuildControlGetNumRanks() do
			local heightOffset = (i-2) * SGPFrameStuff.RanksListHeightOffset;
			local rankDisplayName = GuildControlGetRankName(i);
			local rankName = rankDisplayName..i;
			-- Rank Text Header:
			local RankHeader = RanksContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
			RankHeader:SetPoint("TOPLEFT", SGPFrameStuff.RankHeaderX, (SGPFrameStuff.RanksListBaseY - heightOffset));
			RankHeader:SetText(rankDisplayName .. ":");
			-- Rank Flags Button:
			GuildControlSetRank(i);
			local rankFlagsTooltip = SGP_GenerateRankFlagTooltip(rankDisplayName, GuildControlGetRankFlags());
			local RankFlagsButton = SGP_CreateCheckbox("RankFlagsButton" .. rankName, RanksContentPanel, "", SGPFrameStuff.RankHeaderX, (SGPFrameStuff.RanksListBaseY - heightOffset + 5), rankFlagsTooltip);
			getglobal("RankFlagsButton"..rankName):SetAlpha(0);
			-- Watch Checkboxes
			local RankAttainableCheckbox = SGP_CreateCheckbox("Attainable" .. rankName, RanksContentPanel, SGPLocal.AttainableText, SGPFrameStuff.RankContentX, (SGPFrameStuff.RanksListBaseY - heightOffset - SGPFrameStuff.RankCheckboxOffset), SGPLocal.AttainableTooltip);
			local RankAllowPromoteCheckbox = SGP_CreateCheckbox("AllowPromote" .. rankName, RanksContentPanel, SGPLocal.AllowPromoteText, SGPFrameStuff.RankContentX2, (SGPFrameStuff.RanksListBaseY - heightOffset - SGPFrameStuff.RankCheckboxOffset), SGPLocal.AllowPromoteTooltip);
			local RankAllowDemoteCheckbox = SGP_CreateCheckbox("AllowDemote" .. rankName, RanksContentPanel, SGPLocal.AllowDemoteText, SGPFrameStuff.RankContentX3, (SGPFrameStuff.RanksListBaseY - heightOffset - SGPFrameStuff.RankCheckboxOffset), SGPLocal.AllowDemoteTooltip);
			-- TimeInGuild, TimeOffline, Level, Achievement and Reputation Texts.
			local TimeInGuildText = RanksContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
			TimeInGuildText:SetPoint("TOPLEFT", SGPFrameStuff.RankContentX4, (SGPFrameStuff.RanksListBaseY - heightOffset - SGPFrameStuff.TimeInGuildOffset));
			TimeInGuildText:SetText(SGPLocal.Minimum .. " " .. SGPLocal.TimeInGuild);
			local TimeOfflineText = RanksContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
			TimeOfflineText:SetPoint("TOPLEFT", SGPFrameStuff.RankContentX4, (SGPFrameStuff.RanksListBaseY - heightOffset - SGPFrameStuff.TimeOfflineOffset));
			TimeOfflineText:SetText(SGPLocal.Maximum .. " " .. SGPLocal.TimeOffline);
			local LevelText = RanksContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
			LevelText:SetPoint("TOPLEFT", SGPFrameStuff.RankContentX4, (SGPFrameStuff.RanksListBaseY - heightOffset - SGPFrameStuff.LevelOffset));
			LevelText:SetText(SGPLocal.Minimum .. " " .. SGPLocal.Level);
			local AchievementText = RanksContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
			AchievementText:SetPoint("TOPLEFT", SGPFrameStuff.RankContentX4, (SGPFrameStuff.RanksListBaseY - heightOffset - SGPFrameStuff.AchievementOffset));
			AchievementText:SetText(SGPLocal.Minimum .. " " .. SGPLocal.Achievement);
			local ReputationText = RanksContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
			ReputationText:SetPoint("TOPLEFT", SGPFrameStuff.RankContentX4, (SGPFrameStuff.RanksListBaseY - heightOffset - SGPFrameStuff.ReputationOffset));
			ReputationText:SetText(SGPLocal.Minimum .. " " .. SGPLocal.Reputation);
			-- TimeInGuild, TimeOffline, Level and Achievement Editboxes.
			local TimeInGuildEditbox = SGP_CreateEditbox("MinTimeInGuild" .. rankName, RanksContentPanel, 120, 20, SGPFrameStuff.RankContentX5, (SGPFrameStuff.RanksListBaseY - heightOffset - SGPFrameStuff.TimeInGuildOffset + 6), nil);
			local LevelEditbox = SGP_CreateEditbox("MaxTimeOffline" .. rankName, RanksContentPanel, 120, 20, SGPFrameStuff.RankContentX5, (SGPFrameStuff.RanksListBaseY - heightOffset - SGPFrameStuff.TimeOfflineOffset + 6), nil);
			local LevelEditbox = SGP_CreateEditbox("MinLevel" .. rankName, RanksContentPanel, 40, 20, SGPFrameStuff.RankContentX5, (SGPFrameStuff.RanksListBaseY - heightOffset - SGPFrameStuff.LevelOffset + 6), nil);
			local AchievementEditbox = SGP_CreateEditbox("MinAchievement" .. rankName, RanksContentPanel, 70, 20, SGPFrameStuff.RankContentX5, (SGPFrameStuff.RanksListBaseY - heightOffset - SGPFrameStuff.AchievementOffset + 6), nil);
			-- Reputation DropDownMenu.
			local ReputationEditbox = SGP_CreateDropDownButton("MinReputation" .. rankName, RanksContentPanel, "TOPLEFT", 130, SGPFrameStuff.RankContentX5 - 22, (SGPFrameStuff.RanksListBaseY - heightOffset - SGPFrameStuff.ReputationOffset + 9), SGP.Settings.ReputationList, nil);
		end
		
		-- Alts Scroll and Content Frames
		
		local AltsPanel = CreateFrame("FRAME","SGP_AltsFrame");
		AltsPanel.name = SGPLocal.AltsPanelName;
		AltsPanel.parent = ConfigPanel.name;
		InterfaceOptions_AddCategory(AltsPanel);
		
		local AltsScrollFrame = CreateFrame("ScrollFrame", nil, AltsPanel);
		AltsScrollFrame:SetPoint("TOPLEFT", SGPFrameStuff.ScrollFrameX, SGPFrameStuff.ScrollFrameY);
		AltsScrollFrame:SetPoint("BOTTOMRIGHT", SGPFrameStuff.ScrollFrameY, SGPFrameStuff.ScrollFrameX);
		AltsPanel.scrollframe = AltsScrollFrame;
		
		local AltsScrollBar = CreateFrame("Slider", nil, AltsScrollFrame, "UIPanelScrollBarTemplate");
		AltsScrollBar:SetPoint("TOPLEFT", AltsPanel, "TOPRIGHT", -21, -22);
		AltsScrollBar:SetPoint("BOTTOMLEFT", AltsPanel, "BOTTOMRIGHT", -21, 21);
		local AltsScrollBarMax = 1;
		AltsScrollBar:SetMinMaxValues(1, AltsScrollBarMax);
		AltsScrollBar:SetValueStep(1);
		AltsScrollBar.scrollStep = 1;
		AltsScrollBar:SetValue(0);
		AltsScrollBar:SetWidth(16);
		AltsScrollBar:SetScript("OnValueChanged", function (self, value)
													  self:GetParent():SetVerticalScroll(value);
												  end);
		local AltsScrollBarTexture = AltsScrollBar:CreateTexture(nil, "BACKGROUND");
		AltsScrollBarTexture:SetAllPoints(AltsScrollBar);
		AltsScrollBarTexture:SetTexture(0, 0, 0, 0.4);
		AltsPanel.AltsScrollBar = AltsScrollFrame;
		
		AltsScrollFrame:EnableMouseWheel(true);
		AltsScrollFrame:SetScript("OnMouseWheel", function(self, delta)
														if delta == 1 then
															if IsShiftKeyDown() then
																AltsScrollBar:SetValue(1);
															else
																if (AltsScrollBar:GetValue() - SGPFrameStuff.ScrollFrameStep < 1) then
																	AltsScrollBar:SetValue(1);
																else
																	AltsScrollBar:SetValue(AltsScrollBar:GetValue()-SGPFrameStuff.ScrollFrameStep);
																end
															end
														else
															if IsShiftKeyDown() then
																AltsScrollBar:SetValue(AltsScrollBarMax);
															else
																if (AltsScrollBar:GetValue() + SGPFrameStuff.ScrollFrameStep > AltsScrollBarMax) then
																	AltsScrollBar:SetValue(AltsScrollBarMax);
																else
																	AltsScrollBar:SetValue(AltsScrollBar:GetValue()+SGPFrameStuff.ScrollFrameStep);
																end
															end
														end
													end);
		
		local AltsContentPanel = CreateFrame("Frame", nil, AltsScrollFrame);
		AltsContentPanel:SetSize(200, 200);
		AltsScrollFrame.content = AltsContentPanel;
		
		AltsScrollFrame:SetScrollChild(AltsContentPanel);
		
		-- Stuff to put into Alts Pane.
		
		local AltManagementHeader = AltsContentPanel:CreateFontString(nil, "ARTWORK", "GameFontGreenLarge");
		AltManagementHeader:SetPoint("TOPLEFT", SGPFrameStuff.AltHeaderX, SGPFrameStuff.AltManagementHeaderY);
		AltManagementHeader:SetText(SGPLocal.AltManagementHeader);
		
		local AltNoteText = AltsContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		AltNoteText:SetPoint("TOPLEFT", SGPFrameStuff.AltContentX, SGPFrameStuff.AltNoteTextY);
		AltNoteText:SetText(SGPLocal.AltNoteText);
		
		local AltNoteDescription = AltsContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		AltNoteDescription:SetPoint("TOPLEFT", SGPFrameStuff.AltContentX+5, SGPFrameStuff.AltNoteDescriptionY);
		AltNoteDescription:SetText(SGPLocal.AltNoteDescription);
		
		local AltNoteButton = SGP_CreateDropDownButton("AltNoteButton", AltsContentPanel, "TOPLEFT", 180, SGPFrameStuff.AltContentX3, SGPFrameStuff.AltNoteButtonY, SGPLocal.AltNoteButtonItems, SGPLocal.AltNoteButtonTooltips);
		
		local AltModeText = AltsContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		AltModeText:SetPoint("TOPLEFT", SGPFrameStuff.AltContentX, SGPFrameStuff.AltModeTextY);
		AltModeText:SetText(SGPLocal.AltModeText);
		
		local AltModeDescription = AltsContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		AltModeDescription:SetPoint("TOPLEFT", SGPFrameStuff.AltContentX+5, SGPFrameStuff.AltModeDescriptionY);
		AltModeDescription:SetText(SGPLocal.AltModeDescription);
		
		local AltModeButton = SGP_CreateDropDownButton("AltModeButton", AltsContentPanel, "TOPLEFT", 180, SGPFrameStuff.AltContentX3, SGPFrameStuff.AltModeButtonY, SGPLocal.AltModeButtonItems, SGPLocal.AltModeButtonTooltips);
		
		local Ranks = { };
		for i,v in pairs(SGP.Settings.GuildRanks) do
			if ( i > 1 ) then
				table.insert(Ranks, v.RankDisplayName);
			end
		end
		local AltRankButton = SGP_CreateDropDownButton("AltRankButton", AltsContentPanel, "TOPLEFT", 130, SGPFrameStuff.AltContentX4, SGPFrameStuff.AltModeButtonY, Ranks, nil);
		
		-- Filters Scroll and Content Frames
		
		local FiltersPanel = CreateFrame("FRAME","SGP_FiltersFrame");
		FiltersPanel.name = SGPLocal.FiltersPanelName;
		FiltersPanel.parent = ConfigPanel.name;
		InterfaceOptions_AddCategory(FiltersPanel);
		
		local FiltersScrollFrame = CreateFrame("ScrollFrame", nil, FiltersPanel);
		FiltersScrollFrame:SetPoint("TOPLEFT", SGPFrameStuff.ScrollFrameX, SGPFrameStuff.ScrollFrameY);
		FiltersScrollFrame:SetPoint("BOTTOMRIGHT", SGPFrameStuff.ScrollFrameY, SGPFrameStuff.ScrollFrameX);
		FiltersPanel.scrollframe = FiltersScrollFrame;
		
		local FiltersScrollBar = CreateFrame("Slider", nil, FiltersScrollFrame, "UIPanelScrollBarTemplate");
		FiltersScrollBar:SetPoint("TOPLEFT", FiltersPanel, "TOPRIGHT", -21, -22);
		FiltersScrollBar:SetPoint("BOTTOMLEFT", FiltersPanel, "BOTTOMRIGHT", -21, 21);
		local FiltersScrollBarMax = 860;
		FiltersScrollBar:SetMinMaxValues(1, FiltersScrollBarMax);
		FiltersScrollBar:SetValueStep(1);
		FiltersScrollBar.scrollStep = 1;
		FiltersScrollBar:SetValue(0);
		FiltersScrollBar:SetWidth(16);
		FiltersScrollBar:SetScript("OnValueChanged", function (self, value)
													  self:GetParent():SetVerticalScroll(value);
												  end);
		local FiltersScrollBarTexture = FiltersScrollBar:CreateTexture(nil, "BACKGROUND");
		FiltersScrollBarTexture:SetAllPoints(FiltersScrollBar);
		FiltersScrollBarTexture:SetTexture(0, 0, 0, 0.4);
		FiltersPanel.FiltersScrollBar = FiltersScrollFrame;
		
		FiltersScrollFrame:EnableMouseWheel(true);
		FiltersScrollFrame:SetScript("OnMouseWheel", function(self, delta)
														if delta == 1 then
															if IsShiftKeyDown() then
																FiltersScrollBar:SetValue(1);
															else
																if (FiltersScrollBar:GetValue() - SGPFrameStuff.ScrollFrameStep < 1) then
																	FiltersScrollBar:SetValue(1);
																else
																	FiltersScrollBar:SetValue(FiltersScrollBar:GetValue()-SGPFrameStuff.ScrollFrameStep);
																end
															end
														else
															if IsShiftKeyDown() then
																FiltersScrollBar:SetValue(FiltersScrollBarMax);
															else
																if (FiltersScrollBar:GetValue() + SGPFrameStuff.ScrollFrameStep > FiltersScrollBarMax) then
																	FiltersScrollBar:SetValue(FiltersScrollBarMax);
																else
																	FiltersScrollBar:SetValue(FiltersScrollBar:GetValue()+SGPFrameStuff.ScrollFrameStep);
																end
															end
														end
													end);
		
		local FiltersContentPanel = CreateFrame("Frame", nil, FiltersScrollFrame);
		FiltersContentPanel:SetSize(200, 200);
		FiltersScrollFrame.content = FiltersContentPanel;
		
		FiltersScrollFrame:SetScrollChild(FiltersContentPanel);
		
		-- Stuff to put into Filter Pane.
		
		local FilterManagementHeader = FiltersContentPanel:CreateFontString(nil, "ARTWORK", "GameFontGreenLarge");
		FilterManagementHeader:SetPoint("TOPLEFT", SGPFrameStuff.FilterHeaderX, SGPFrameStuff.FilterManagementHeaderY);
		FilterManagementHeader:SetText(SGPLocal.FilterManagementHeader);
		
		-- Filter Prefix
		local FilterPrefixText = FiltersContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		FilterPrefixText:SetPoint("TOPLEFT", SGPFrameStuff.FilterContentX, SGPFrameStuff.FilterPrefixTextY);
		FilterPrefixText:SetText(SGPLocal.FilterPrefixText);
		
		local FilterPrefixDescription = FiltersContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		FilterPrefixDescription:SetPoint("TOPLEFT", SGPFrameStuff.FilterContentX+5, SGPFrameStuff.FilterPrefixDescriptionY);
		FilterPrefixDescription:SetText(SGPLocal.FilterPrefixDescription);
		FilterPrefixDescription:SetJustifyH("LEFT");
		
		local FilterPrefixButton = SGP_CreateDropDownButton("FilterPrefixButton", FiltersContentPanel, "TOPLEFT", 80, SGPFrameStuff.FilterContentX3, SGPFrameStuff.FilterPrefixButtonY, SGPLocal.FilterPrefixButtonItems, nil);
		
		-- DoNotPromote Filter
		local FilterDoNotPromoteText = FiltersContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		FilterDoNotPromoteText:SetPoint("TOPLEFT", SGPFrameStuff.FilterContentX, SGPFrameStuff.FilterDoNotPromoteTextY);
		FilterDoNotPromoteText:SetText(SGPLocal.FilterDoNotPromoteText);
		
		local FilterDoNotPromoteDescription = FiltersContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		FilterDoNotPromoteDescription:SetPoint("TOPLEFT", SGPFrameStuff.FilterContentX+5, SGPFrameStuff.FilterDoNotPromoteDescriptionY);
		FilterDoNotPromoteDescription:SetText(SGPLocal.FilterDoNotPromoteDescription);
		FilterDoNotPromoteDescription:SetJustifyH("LEFT");
		
		local FilterDoNotPromoteButton = SGP_CreateDropDownButton("FilterDoNotPromoteButton", FiltersContentPanel, "TOPLEFT", 180, SGPFrameStuff.FilterContentX3, SGPFrameStuff.FilterDoNotPromoteButtonY, SGPLocal.FilterDoNotPromoteButtonItems, SGPLocal.FilterDoNotPromoteButtonTooltips);
		local FilterDoNotPromoteEditbox = SGP_CreateEditbox("FilterDoNotPromoteEditbox", FiltersContentPanel, 70, 20, SGPFrameStuff.FilterContentX4, SGPFrameStuff.FilterDoNotPromoteButtonY-4);
		
		-- DoNotDemote Filter
		local FilterDoNotDemoteText = FiltersContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		FilterDoNotDemoteText:SetPoint("TOPLEFT", SGPFrameStuff.FilterContentX, SGPFrameStuff.FilterDoNotDemoteTextY);
		FilterDoNotDemoteText:SetText(SGPLocal.FilterDoNotDemoteText);
		
		local FilterDoNotDemoteDescription = FiltersContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		FilterDoNotDemoteDescription:SetPoint("TOPLEFT", SGPFrameStuff.FilterContentX+5, SGPFrameStuff.FilterDoNotDemoteDescriptionY);
		FilterDoNotDemoteDescription:SetText(SGPLocal.FilterDoNotDemoteDescription);
		FilterDoNotDemoteDescription:SetJustifyH("LEFT");
		
		local FilterDoNotDemoteButton = SGP_CreateDropDownButton("FilterDoNotDemoteButton", FiltersContentPanel, "TOPLEFT", 180, SGPFrameStuff.FilterContentX3, SGPFrameStuff.FilterDoNotDemoteButtonY, SGPLocal.FilterDoNotDemoteButtonItems, SGPLocal.FilterDoNotDemoteButtonTooltips);
		local FilterDoNotDemoteEditbox = SGP_CreateEditbox("FilterDoNotDemoteEditbox", FiltersContentPanel, 70, 20, SGPFrameStuff.FilterContentX4, SGPFrameStuff.FilterDoNotDemoteButtonY-4);
		
		-- DoNotList Filter
		local FilterDoNotListText = FiltersContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		FilterDoNotListText:SetPoint("TOPLEFT", SGPFrameStuff.FilterContentX, SGPFrameStuff.FilterDoNotListTextY);
		FilterDoNotListText:SetText(SGPLocal.FilterDoNotListText);
		
		local FilterDoNotListDescription = FiltersContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		FilterDoNotListDescription:SetPoint("TOPLEFT", SGPFrameStuff.FilterContentX+5, SGPFrameStuff.FilterDoNotListDescriptionY);
		FilterDoNotListDescription:SetText(SGPLocal.FilterDoNotListDescription);
		FilterDoNotListDescription:SetJustifyH("LEFT");
		
		local FilterDoNotListButton = SGP_CreateDropDownButton("FilterDoNotListButton", FiltersContentPanel, "TOPLEFT", 180, SGPFrameStuff.FilterContentX3, SGPFrameStuff.FilterDoNotListButtonY, SGPLocal.FilterDoNotListButtonItems, SGPLocal.FilterDoNotListButtonTooltips);
		local FilterDoNotListEditbox = SGP_CreateEditbox("FilterDoNotListEditbox", FiltersContentPanel, 70, 20, SGPFrameStuff.FilterContentX4, SGPFrameStuff.FilterDoNotListButtonY-4);
		
		-- DoNotKick Filter
		local FilterDoNotKickText = FiltersContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		FilterDoNotKickText:SetPoint("TOPLEFT", SGPFrameStuff.FilterContentX, SGPFrameStuff.FilterDoNotKickTextY);
		FilterDoNotKickText:SetText(SGPLocal.FilterDoNotKickText);
		
		local FilterDoNotKickDescription = FiltersContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		FilterDoNotKickDescription:SetPoint("TOPLEFT", SGPFrameStuff.FilterContentX+5, SGPFrameStuff.FilterDoNotKickDescriptionY);
		FilterDoNotKickDescription:SetText(SGPLocal.FilterDoNotKickDescription);
		FilterDoNotKickDescription:SetJustifyH("LEFT");
		
		local FilterDoNotKickButton = SGP_CreateDropDownButton("FilterDoNotKickButton", FiltersContentPanel, "TOPLEFT", 180, SGPFrameStuff.FilterContentX3, SGPFrameStuff.FilterDoNotKickButtonY, SGPLocal.FilterDoNotKickButtonItems, SGPLocal.FilterDoNotKickButtonTooltips);
		local FilterDoNotKickEditbox = SGP_CreateEditbox("FilterDoNotKickEditbox", FiltersContentPanel, 70, 20, SGPFrameStuff.FilterContentX4, SGPFrameStuff.FilterDoNotKickButtonY-4);
		
		-- NotAnAlt Filter
		local FilterNotAnAltText = FiltersContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		FilterNotAnAltText:SetPoint("TOPLEFT", SGPFrameStuff.FilterContentX, SGPFrameStuff.FilterNotAnAltTextY);
		FilterNotAnAltText:SetText(SGPLocal.FilterNotAnAltText);
		
		local FilterNotAnAltDescription = FiltersContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		FilterNotAnAltDescription:SetPoint("TOPLEFT", SGPFrameStuff.FilterContentX+5, SGPFrameStuff.FilterNotAnAltDescriptionY);
		FilterNotAnAltDescription:SetText(SGPLocal.FilterNotAnAltDescription);
		FilterNotAnAltDescription:SetJustifyH("LEFT");
		
		local FilterNotAnAltButton = SGP_CreateDropDownButton("FilterNotAnAltButton", FiltersContentPanel, "TOPLEFT", 180, SGPFrameStuff.FilterContentX3, SGPFrameStuff.FilterNotAnAltButtonY, SGPLocal.FilterNotAnAltButtonItems, SGPLocal.FilterNotAnAltButtonTooltips);
		local FilterNotAnAltEditbox = SGP_CreateEditbox("FilterNotAnAltEditbox", FiltersContentPanel, 70, 20, SGPFrameStuff.FilterContentX4, SGPFrameStuff.FilterNotAnAltButtonY-4);
		
		-- Filter Lists
		local FilterListsText = FiltersContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		FilterListsText:SetPoint("TOPLEFT", SGPFrameStuff.FilterContentX, SGPFrameStuff.FilterListsTextY);
		FilterListsText:SetText(SGPLocal.FilterListsText);
		
		local FilterListsDescription = FiltersContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		FilterListsDescription:SetPoint("TOPLEFT", SGPFrameStuff.FilterContentX+5, SGPFrameStuff.FilterListsDescriptionY);
		FilterListsDescription:SetText(SGPLocal.FilterListsDescription);
		
		local FilterListsUpdateButton = SGP_CreateButton("FilterListsUpdateButton", FiltersContentPanel, "TOPLEFT", 100, 30, SGPLocal.FilterListsUpdateButton, SGPFrameStuff.FilterContentX+20, SGPFrameStuff.FilterListsUpdateButtonY);
		
		local FilterListsDNPText = FiltersContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		FilterListsDNPText:SetPoint("TOPLEFT", SGPFrameStuff.FilterListsX1, SGPFrameStuff.FilterListsTextY1);
		FilterListsDNPText:SetText(SGPLocal.FilterDoNotPromoteText);
		
		local FilterListsDNDText = FiltersContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		FilterListsDNDText:SetPoint("TOPLEFT", SGPFrameStuff.FilterListsX2, SGPFrameStuff.FilterListsTextY1);
		FilterListsDNDText:SetText(SGPLocal.FilterDoNotDemoteText);
		
		local FilterListsDNLText = FiltersContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		FilterListsDNLText:SetPoint("TOPLEFT", SGPFrameStuff.FilterListsX3, SGPFrameStuff.FilterListsTextY1);
		FilterListsDNLText:SetText(SGPLocal.FilterDoNotListText);
		
		local FilterListsDNKText = FiltersContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		FilterListsDNKText:SetPoint("TOPLEFT", SGPFrameStuff.FilterListsX1, SGPFrameStuff.FilterListsTextY2);
		FilterListsDNKText:SetText(SGPLocal.FilterDoNotKickText);
		
		local FilterListsNAAText = FiltersContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		FilterListsNAAText:SetPoint("TOPLEFT", SGPFrameStuff.FilterListsX2, SGPFrameStuff.FilterListsTextY2);
		FilterListsNAAText:SetText(SGPLocal.FilterNotAnAltText);
		
		local FilterListsDNPScrollingFrame = SGP_CreateScrollingMessageFrame("SGPListFrameFilterDNP", FiltersContentPanel, "TOPLEFT", SGPFrameStuff.FilterListWidth, SGPFrameStuff.FilterListHeight, SGPFrameStuff.FilterListsX1-5, SGPFrameStuff.FilterListsY1);
		local FilterListsDNDScrollingFrame = SGP_CreateScrollingMessageFrame("SGPListFrameFilterDND", FiltersContentPanel, "TOPLEFT", SGPFrameStuff.FilterListWidth, SGPFrameStuff.FilterListHeight, SGPFrameStuff.FilterListsX2-5, SGPFrameStuff.FilterListsY1);
		local FilterListsDNLScrollingFrame = SGP_CreateScrollingMessageFrame("SGPListFrameFilterDNL", FiltersContentPanel, "TOPLEFT", SGPFrameStuff.FilterListWidth, SGPFrameStuff.FilterListHeight, SGPFrameStuff.FilterListsX3-5, SGPFrameStuff.FilterListsY1);
		local FilterListsDNKScrollingFrame = SGP_CreateScrollingMessageFrame("SGPListFrameFilterDNK", FiltersContentPanel, "TOPLEFT", SGPFrameStuff.FilterListWidth, SGPFrameStuff.FilterListHeight, SGPFrameStuff.FilterListsX1-5, SGPFrameStuff.FilterListsY2);
		local FilterListsNAAScrollingFrame = SGP_CreateScrollingMessageFrame("SGPListFrameFilterNAA", FiltersContentPanel, "TOPLEFT", SGPFrameStuff.FilterListWidth, SGPFrameStuff.FilterListHeight, SGPFrameStuff.FilterListsX2-5, SGPFrameStuff.FilterListsY2);
		
		-- Auto Scroll and Content Frames
		
		local AutoPanel = CreateFrame("FRAME","SGP_AutoFrame");
		AutoPanel.name = SGPLocal.AutoPanelName;
		AutoPanel.parent = ConfigPanel.name;
		InterfaceOptions_AddCategory(AutoPanel);
		
		local AutoScrollFrame = CreateFrame("ScrollFrame", nil, AutoPanel);
		AutoScrollFrame:SetPoint("TOPLEFT", SGPFrameStuff.ScrollFrameX, SGPFrameStuff.ScrollFrameY);
		AutoScrollFrame:SetPoint("BOTTOMRIGHT", SGPFrameStuff.ScrollFrameY, SGPFrameStuff.ScrollFrameX);
		AutoPanel.scrollframe = AutoScrollFrame;
		
		local AutoScrollBar = CreateFrame("Slider", nil, AutoScrollFrame, "UIPanelScrollBarTemplate");
		AutoScrollBar:SetPoint("TOPLEFT", AutoPanel, "TOPRIGHT", -21, -22);
		AutoScrollBar:SetPoint("BOTTOMLEFT", AutoPanel, "BOTTOMRIGHT", -21, 21);
		local AutoScrollBarMax = 1;
		AutoScrollBar:SetMinMaxValues(1, AutoScrollBarMax);
		AutoScrollBar:SetValueStep(1);
		AutoScrollBar.scrollStep = 1;
		AutoScrollBar:SetValue(0);
		AutoScrollBar:SetWidth(16);
		AutoScrollBar:SetScript("OnValueChanged", function (self, value)
													  self:GetParent():SetVerticalScroll(value);
												  end);
		local AutoScrollBarTexture = AutoScrollBar:CreateTexture(nil, "BACKGROUND");
		AutoScrollBarTexture:SetAllPoints(AutoScrollBar);
		AutoScrollBarTexture:SetTexture(0, 0, 0, 0.4);
		AutoPanel.AutoScrollBar = AutoScrollFrame;
		
		AutoScrollFrame:EnableMouseWheel(true);
		AutoScrollFrame:SetScript("OnMouseWheel", function(self, delta)
														if delta == 1 then
															if IsShiftKeyDown() then
																AutoScrollBar:SetValue(1);
															else
																if (AutoScrollBar:GetValue() - SGPFrameStuff.ScrollFrameStep < 1) then
																	AutoScrollBar:SetValue(1);
																else
																	AutoScrollBar:SetValue(AutoScrollBar:GetValue()-SGPFrameStuff.ScrollFrameStep);
																end
															end
														else
															if IsShiftKeyDown() then
																AutoScrollBar:SetValue(AutoScrollBarMax);
															else
																if (AutoScrollBar:GetValue() + SGPFrameStuff.ScrollFrameStep > AutoScrollBarMax) then
																	AutoScrollBar:SetValue(AutoScrollBarMax);
																else
																	AutoScrollBar:SetValue(AutoScrollBar:GetValue()+SGPFrameStuff.ScrollFrameStep);
																end
															end
														end
													end);
		
		local AutoContentPanel = CreateFrame("Frame", nil, AutoScrollFrame);
		AutoContentPanel:SetSize(200, 200);
		AutoScrollFrame.content = AutoContentPanel;
		
		AutoScrollFrame:SetScrollChild(AutoContentPanel);
		
		-- Stuff to put into Auto Pane.
		
		local AutoManagementHeader = AutoContentPanel:CreateFontString(nil, "ARTWORK", "GameFontGreenLarge");
		AutoManagementHeader:SetPoint("TOPLEFT", SGPFrameStuff.AutoHeaderX, SGPFrameStuff.AutoManagementHeaderY);
		AutoManagementHeader:SetText(SGPLocal.AutoManagementHeader);
		
		local AutoTypeText = AutoContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		AutoTypeText:SetPoint("TOPLEFT", SGPFrameStuff.AutoContentX, SGPFrameStuff.AutoTypeTextY);
		AutoTypeText:SetText(SGPLocal.AutoTypeText);
		
		local AutoTypeDescription = AutoContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		AutoTypeDescription:SetPoint("TOPLEFT", SGPFrameStuff.AutoContentX+5, SGPFrameStuff.AutoTypeDescriptionY);
		AutoTypeDescription:SetText(SGPLocal.AutoTypeDescription);
		AutoTypeDescription:SetJustifyH("LEFT");
		
		local AutoTypeButton = SGP_CreateDropDownButton("AutoTypeButton", AutoContentPanel, "TOPLEFT", 180, SGPFrameStuff.AutoContentX3, SGPFrameStuff.AutoTypeButtonY, SGPLocal.AutoTypeButtonItems, SGPLocal.AutoTypeButtonTooltips);
		
		local AutoModeText = AutoContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		AutoModeText:SetPoint("TOPLEFT", SGPFrameStuff.AutoContentX, SGPFrameStuff.AutoModeTextY);
		AutoModeText:SetText(SGPLocal.AutoModeText);
		
		local AutoModeDescription = AutoContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		AutoModeDescription:SetPoint("TOPLEFT", SGPFrameStuff.AutoContentX+5, SGPFrameStuff.AutoModeDescriptionY);
		AutoModeDescription:SetText(SGPLocal.AutoModeDescription);
		
		local AutoModeButton = SGP_CreateDropDownButton("AutoModeButton", AutoContentPanel, "TOPLEFT", 180, SGPFrameStuff.AutoContentX3, SGPFrameStuff.AutoModeButtonY, SGPLocal.AutoModeButtonItems, SGPLocal.AutoModeButtonTooltips);
		
		-- MemJoinDate Scroll and Content Frames
		
		local MemJoinDatePanel = CreateFrame("FRAME","SGP_MemJoinDateFrame");
		MemJoinDatePanel.name = SGPLocal.MemJoinDatePanelName;
		MemJoinDatePanel.parent = ConfigPanel.name;
		InterfaceOptions_AddCategory(MemJoinDatePanel);
		
		local MemJoinDateScrollFrame = CreateFrame("ScrollFrame", nil, MemJoinDatePanel);
		MemJoinDateScrollFrame:SetPoint("TOPLEFT", SGPFrameStuff.ScrollFrameX, SGPFrameStuff.ScrollFrameY);
		MemJoinDateScrollFrame:SetPoint("BOTTOMRIGHT", SGPFrameStuff.ScrollFrameY, SGPFrameStuff.ScrollFrameX);
		MemJoinDatePanel.scrollframe = MemJoinDateScrollFrame;
		
		local MemJoinDateScrollBar = CreateFrame("Slider", nil, MemJoinDateScrollFrame, "UIPanelScrollBarTemplate");
		MemJoinDateScrollBar:SetPoint("TOPLEFT", MemJoinDatePanel, "TOPRIGHT", -21, -22);
		MemJoinDateScrollBar:SetPoint("BOTTOMLEFT", MemJoinDatePanel, "BOTTOMRIGHT", -21, 21);
		local MemJoinDateScrollBarMax = 1;
		MemJoinDateScrollBar:SetMinMaxValues(1, MemJoinDateScrollBarMax);
		MemJoinDateScrollBar:SetValueStep(1);
		MemJoinDateScrollBar.scrollStep = 1;
		MemJoinDateScrollBar:SetValue(0);
		MemJoinDateScrollBar:SetWidth(16);
		MemJoinDateScrollBar:SetScript("OnValueChanged", function (self, value)
													  self:GetParent():SetVerticalScroll(value);
												  end);
		local MemJoinDateScrollBarTexture = MemJoinDateScrollBar:CreateTexture(nil, "BACKGROUND");
		MemJoinDateScrollBarTexture:SetAllPoints(MemJoinDateScrollBar);
		MemJoinDateScrollBarTexture:SetTexture(0, 0, 0, 0.4);
		MemJoinDatePanel.MemJoinDateScrollBar = MemJoinDateScrollFrame;
		
		MemJoinDateScrollFrame:EnableMouseWheel(true);
		MemJoinDateScrollFrame:SetScript("OnMouseWheel", function(self, delta)
														if delta == 1 then
															if IsShiftKeyDown() then
																MemJoinDateScrollBar:SetValue(1);
															else
																if (MemJoinDateScrollBar:GetValue() - SGPFrameStuff.ScrollFrameStep < 1) then
																	MemJoinDateScrollBar:SetValue(1);
																else
																	MemJoinDateScrollBar:SetValue(MemJoinDateScrollBar:GetValue()-SGPFrameStuff.ScrollFrameStep);
																end
															end
														else
															if IsShiftKeyDown() then
																MemJoinDateScrollBar:SetValue(MemJoinDateScrollBarMax);
															else
																if (MemJoinDateScrollBar:GetValue() + SGPFrameStuff.ScrollFrameStep > MemJoinDateScrollBarMax) then
																	MemJoinDateScrollBar:SetValue(MemJoinDateScrollBarMax);
																else
																	MemJoinDateScrollBar:SetValue(MemJoinDateScrollBar:GetValue()+SGPFrameStuff.ScrollFrameStep);
																end
															end
														end
													end);
		
		local MemJoinDateContentPanel = CreateFrame("Frame", nil, MemJoinDateScrollFrame);
		MemJoinDateContentPanel:SetSize(200, 200);
		MemJoinDateScrollFrame.content = MemJoinDateContentPanel;
		
		MemJoinDateScrollFrame:SetScrollChild(MemJoinDateContentPanel);
		
		-- Stuff to put into MemJoinDate Pane.
		
		local MemJoinDateManagementHeader = MemJoinDateContentPanel:CreateFontString(nil, "ARTWORK", "GameFontGreenLarge");
		MemJoinDateManagementHeader:SetPoint("TOPLEFT", SGPFrameStuff.MemJoinDateHeaderX, SGPFrameStuff.MemJoinDateManagementHeaderY);
		MemJoinDateManagementHeader:SetText(SGPLocal.MemJoinDateManagementHeader);
		
		local MemJoinDateChangeText = MemJoinDateContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		MemJoinDateChangeText:SetPoint("TOPLEFT", SGPFrameStuff.MemJoinDateContentX, SGPFrameStuff.MemJoinDateChangeTextY);
		MemJoinDateChangeText:SetText(SGPLocal.MemJoinDateChangeText);
		
		local MemJoinDateChangeDescription = MemJoinDateContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		MemJoinDateChangeDescription:SetPoint("TOPLEFT", SGPFrameStuff.MemJoinDateContentX+5, SGPFrameStuff.MemJoinDateChangeDescriptionY);
		MemJoinDateChangeDescription:SetText(SGPLocal.MemJoinDateChangeDescription);
		MemJoinDateChangeDescription:SetJustifyH("LEFT");
		
		local MemJoinDateNameText = MemJoinDateContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		MemJoinDateNameText:SetPoint("TOPLEFT", SGPFrameStuff.MemJoinDateContentX3+5, SGPFrameStuff.MemJoinDateEditboxY);
		MemJoinDateNameText:SetText(SGPLocal.MemJoinDateNameText);
		local MemJoinDateNameEditbox = SGP_CreateEditbox("MemJoinDateNameEditbox", MemJoinDateContentPanel, 120, 20, SGPFrameStuff.MemJoinDateContentX2+10, SGPFrameStuff.MemJoinDateEditboxY+6);
		
		local MemJoinDateDateText = MemJoinDateContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		MemJoinDateDateText:SetPoint("TOPLEFT", SGPFrameStuff.MemJoinDateContentX3+5, SGPFrameStuff.MemJoinDateEditboxY3);
		MemJoinDateDateText:SetText(SGPLocal.MemJoinDateDateText);
		
		local MemJoinDateDayText = MemJoinDateContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		MemJoinDateDayText:SetPoint("TOPLEFT", SGPFrameStuff.MemJoinDateContentX5+10, SGPFrameStuff.MemJoinDateEditboxY2);
		MemJoinDateDayText:SetText(SGPLocal.MemJoinDateDayText);
		local MemJoinDateDayEditbox = SGP_CreateEditbox("MemJoinDateDayEditbox", MemJoinDateContentPanel, 28, 20, SGPFrameStuff.MemJoinDateContentX5+10, SGPFrameStuff.MemJoinDateEditboxY3+6);
		
		local MemJoinDateMonthText = MemJoinDateContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		MemJoinDateMonthText:SetPoint("TOPLEFT", SGPFrameStuff.MemJoinDateContentX6+10, SGPFrameStuff.MemJoinDateEditboxY2);
		MemJoinDateMonthText:SetText(SGPLocal.MemJoinDateMonthText);
		local MemJoinDateMonthEditbox = SGP_CreateEditbox("MemJoinDateMonthEditbox", MemJoinDateContentPanel, 28, 20, SGPFrameStuff.MemJoinDateContentX6+10, SGPFrameStuff.MemJoinDateEditboxY3+6);
		
		local MemJoinDateYearText = MemJoinDateContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		MemJoinDateYearText:SetPoint("TOPLEFT", SGPFrameStuff.MemJoinDateContentX7+10, SGPFrameStuff.MemJoinDateEditboxY2);
		MemJoinDateYearText:SetText(SGPLocal.MemJoinDateYearText);
		local MemJoinDateYearEditbox = SGP_CreateEditbox("MemJoinDateYearEditbox", MemJoinDateContentPanel, 40, 20, SGPFrameStuff.MemJoinDateContentX7+10, SGPFrameStuff.MemJoinDateEditboxY3+6);
		
		local MemJoinDateGetButton = SGP_CreateButton("MemJoinDateGetButton", MemJoinDateContentPanel, "TOPLEFT", 60, 30, SGPLocal.MemJoinDateGetButtonText, SGPFrameStuff.MemJoinDateContentX4, SGPFrameStuff.MemJoinDateEditboxY+10);
		local MemJoinDateSetButton = SGP_CreateButton("MemJoinDateSetButton", MemJoinDateContentPanel, "TOPLEFT", 60, 30, SGPLocal.MemJoinDateSetButtonText, SGPFrameStuff.MemJoinDateContentX4, SGPFrameStuff.MemJoinDateEditboxY3+10);
		
		local MemJoinDateListText = MemJoinDateContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		MemJoinDateListText:SetPoint("TOPLEFT", SGPFrameStuff.MemJoinDateContentX, SGPFrameStuff.MemJoinDateListTextY);
		MemJoinDateListText:SetText(SGPLocal.MemJoinDateListText);
		
		local MemJoinDateListButton = SGP_CreateButton("MemJoinDateListButton", MemJoinDateContentPanel, "TOPLEFT", 80, 30, SGPLocal.MemJoinDateListButtonText, SGPFrameStuff.MemJoinDateContentX8, SGPFrameStuff.MemJoinDateListY-2);
		
		local MemJoinDateListSMF = SGP_CreateScrollingMessageFrame("SGPListFrameMemJoinDate", MemJoinDateContentPanel, "TOPLEFT", SGPFrameStuff.MemJoinDateListWidth, SGPFrameStuff.MemJoinDateListHeight, SGPFrameStuff.MemJoinDateContentX3, SGPFrameStuff.MemJoinDateListY);
		
		-- Export Scroll and Content Frames
		
		local ExportPanel = CreateFrame("FRAME","SGP_ExportFrame");
		ExportPanel.name = SGPLocal.ExportPanelName;
		ExportPanel.parent = ConfigPanel.name;
		InterfaceOptions_AddCategory(ExportPanel);
		
		local ExportScrollFrame = CreateFrame("ScrollFrame", nil, ExportPanel);
		ExportScrollFrame:SetPoint("TOPLEFT", SGPFrameStuff.ScrollFrameX, SGPFrameStuff.ScrollFrameY);
		ExportScrollFrame:SetPoint("BOTTOMRIGHT", SGPFrameStuff.ScrollFrameY, SGPFrameStuff.ScrollFrameX);
		ExportPanel.scrollframe = ExportScrollFrame;
		
		local ExportScrollBar = CreateFrame("Slider", nil, ExportScrollFrame, "UIPanelScrollBarTemplate");
		ExportScrollBar:SetPoint("TOPLEFT", ExportPanel, "TOPRIGHT", -21, -22);
		ExportScrollBar:SetPoint("BOTTOMLEFT", ExportPanel, "BOTTOMRIGHT", -21, 21);
		local ExportScrollBarMax = 1;
		ExportScrollBar:SetMinMaxValues(1, ExportScrollBarMax);
		ExportScrollBar:SetValueStep(1);
		ExportScrollBar.scrollStep = 1;
		ExportScrollBar:SetValue(0);
		ExportScrollBar:SetWidth(16);
		ExportScrollBar:SetScript("OnValueChanged", function (self, value)
													  self:GetParent():SetVerticalScroll(value);
												  end);
		local ExportScrollBarTexture = ExportScrollBar:CreateTexture(nil, "BACKGROUND");
		ExportScrollBarTexture:SetAllPoints(ExportScrollBar);
		ExportScrollBarTexture:SetTexture(0, 0, 0, 0.4);
		ExportPanel.ExportScrollBar = ExportScrollFrame;
		
		ExportScrollFrame:EnableMouseWheel(true);
		ExportScrollFrame:SetScript("OnMouseWheel", function(self, delta)
														if delta == 1 then
															if IsShiftKeyDown() then
																ExportScrollBar:SetValue(1);
															else
																if (ExportScrollBar:GetValue() - SGPFrameStuff.ScrollFrameStep < 1) then
																	ExportScrollBar:SetValue(1);
																else
																	ExportScrollBar:SetValue(ExportScrollBar:GetValue()-SGPFrameStuff.ScrollFrameStep);
																end
															end
														else
															if IsShiftKeyDown() then
																ExportScrollBar:SetValue(ExportScrollBarMax);
															else
																if (ExportScrollBar:GetValue() + SGPFrameStuff.ScrollFrameStep > ExportScrollBarMax) then
																	ExportScrollBar:SetValue(ExportScrollBarMax);
																else
																	ExportScrollBar:SetValue(ExportScrollBar:GetValue()+SGPFrameStuff.ScrollFrameStep);
																end
															end
														end
													end);
		
		local ExportContentPanel = CreateFrame("Frame", nil, ExportScrollFrame);
		ExportContentPanel:SetSize(200, 200);
		ExportScrollFrame.content = ExportContentPanel;
		
		ExportScrollFrame:SetScrollChild(ExportContentPanel);
		
		-- Stuff to put into Export Pane.
		
		local ExportManagementHeader = ExportContentPanel:CreateFontString(nil, "ARTWORK", "GameFontGreenLarge");
		ExportManagementHeader:SetPoint("TOPLEFT", SGPFrameStuff.ExportHeaderX, SGPFrameStuff.ExportManagementHeaderY);
		ExportManagementHeader:SetText(SGPLocal.ExportManagementHeader);
		
		local ExportText = ExportContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		ExportText:SetPoint("TOPLEFT", SGPFrameStuff.ExportContentX, SGPFrameStuff.ExportTextY);
		ExportText:SetText(SGPLocal.ExportText);
		
		local ExportDescription = ExportContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		ExportDescription:SetPoint("TOPLEFT", SGPFrameStuff.ExportContentX+5, SGPFrameStuff.ExportDescriptionY);
		ExportDescription:SetText(SGPLocal.ExportDescription);
		
		local ExportButton1 = SGP_CreateDropDownButton("ExportButton1", ExportContentPanel, "TOPLEFT", 100, SGPFrameStuff.ExportContentX2, SGPFrameStuff.ExportButton1Y, SGPLocal.ExportButtonItems, SGPLocal.ExportButtonTooltips);
		local ExportEditbox = SGP_CreateEditbox("ExportEditbox", ExportContentPanel, 170, 20, SGPFrameStuff.ExportContentX3, SGPFrameStuff.ExportButton1Y-3);
		
		local ExportButton2 = SGP_CreateButton("ExportButton2", ExportContentPanel, "TOPLEFT", 120, 30, SGPLocal.ExportButtonText, SGPFrameStuff.ExportContentX2+15, SGPFrameStuff.ExportButton2Y);
		
		local ExportIgnoreText = ExportContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		ExportIgnoreText:SetPoint("TOPLEFT", SGPFrameStuff.ExportContentX, SGPFrameStuff.ExportIgnoreTextY);
		ExportIgnoreText:SetText(SGPLocal.ExportIgnoreText);
		
		local ExportIgnoreCheckbox = SGP_CreateCheckbox("ExportIgnoreCheckbox", ExportContentPanel, SGPLocal.ExportIgnoreCheckboxText, SGPFrameStuff.ExportContentX2, SGPFrameStuff.ExportIgnoreCheckboxY, SGPLocal.ExportIgnoreCheckboxTooltip);
		
		-- Kick Scroll and Content Frames
		
		local KickPanel = CreateFrame("FRAME","SGP_KickFrame");
		KickPanel.name = SGPLocal.KickPanelName;
		KickPanel.parent = ConfigPanel.name;
		InterfaceOptions_AddCategory(KickPanel);
		
		local KickScrollFrame = CreateFrame("ScrollFrame", nil, KickPanel);
		KickScrollFrame:SetPoint("TOPLEFT", SGPFrameStuff.ScrollFrameX, SGPFrameStuff.ScrollFrameY);
		KickScrollFrame:SetPoint("BOTTOMRIGHT", SGPFrameStuff.ScrollFrameY, SGPFrameStuff.ScrollFrameX);
		KickPanel.scrollframe = KickScrollFrame;
		
		local KickScrollBar = CreateFrame("Slider", nil, KickScrollFrame, "UIPanelScrollBarTemplate");
		KickScrollBar:SetPoint("TOPLEFT", KickPanel, "TOPRIGHT", -21, -22);
		KickScrollBar:SetPoint("BOTTOMLEFT", KickPanel, "BOTTOMRIGHT", -21, 21);
		local KickScrollBarMax = 160;
		KickScrollBar:SetMinMaxValues(1, KickScrollBarMax);
		KickScrollBar:SetValueStep(1);
		KickScrollBar.scrollStep = 1;
		KickScrollBar:SetValue(0);
		KickScrollBar:SetWidth(16);
		KickScrollBar:SetScript("OnValueChanged", function (self, value)
													  self:GetParent():SetVerticalScroll(value);
												  end);
		local KickScrollBarTexture = KickScrollBar:CreateTexture(nil, "BACKGROUND");
		KickScrollBarTexture:SetAllPoints(KickScrollBar);
		KickScrollBarTexture:SetTexture(0, 0, 0, 0.4);
		KickPanel.KickScrollBar = KickScrollFrame;
		
		KickScrollFrame:EnableMouseWheel(true);
		KickScrollFrame:SetScript("OnMouseWheel", function(self, delta)
														if delta == 1 then
															if IsShiftKeyDown() then
																KickScrollBar:SetValue(1);
															else
																if (KickScrollBar:GetValue() - SGPFrameStuff.ScrollFrameStep < 1) then
																	KickScrollBar:SetValue(1);
																else
																	KickScrollBar:SetValue(KickScrollBar:GetValue()-SGPFrameStuff.ScrollFrameStep);
																end
															end
														else
															if IsShiftKeyDown() then
																KickScrollBar:SetValue(KickScrollBarMax);
															else
																if (KickScrollBar:GetValue() + SGPFrameStuff.ScrollFrameStep > KickScrollBarMax) then
																	KickScrollBar:SetValue(KickScrollBarMax);
																else
																	KickScrollBar:SetValue(KickScrollBar:GetValue()+SGPFrameStuff.ScrollFrameStep);
																end
															end
														end
													end);
		
		local KickContentPanel = CreateFrame("Frame", nil, KickScrollFrame);
		KickContentPanel:SetSize(200, 200);
		KickScrollFrame.content = KickContentPanel;
		
		KickScrollFrame:SetScrollChild(KickContentPanel);
		
		-- Stuff to put into Kick Pane.
		
		local KickManagementHeader = KickContentPanel:CreateFontString(nil, "ARTWORK", "GameFontGreenLarge");
		KickManagementHeader:SetPoint("TOPLEFT", SGPFrameStuff.KickHeaderX, SGPFrameStuff.KickManagementHeaderY);
		KickManagementHeader:SetText(SGPLocal.KickManagementHeader);
		
		local KickText = KickContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		KickText:SetPoint("TOPLEFT", SGPFrameStuff.KickContentX, SGPFrameStuff.KickTextY);
		KickText:SetText(SGPLocal.KickText);
		
		local KickDescription = KickContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		KickDescription:SetPoint("TOPLEFT", SGPFrameStuff.KickContentX+5, SGPFrameStuff.KickDescriptionY);
		KickDescription:SetText(SGPLocal.KickDescription);
		
		local KickEditbox = SGP_CreateEditbox("KickEditbox", KickContentPanel, 70, 20, SGPFrameStuff.KickContentX2+10, SGPFrameStuff.KickEditboxY);
		
		local KickText2 = KickContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		KickText2:SetPoint("TOPLEFT", SGPFrameStuff.KickContentX, SGPFrameStuff.KickText2Y);
		KickText2:SetText(SGPLocal.KickText2);
		
		local KickDescription2 = KickContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		KickDescription2:SetPoint("TOPLEFT", SGPFrameStuff.KickContentX+5, SGPFrameStuff.KickDescription2Y);
		KickDescription2:SetText(SGPLocal.KickDescription2);
		
		local KickRankButton = SGP_CreateDropDownButton("KickRankButton", KickContentPanel, "TOPLEFT", 130, SGPFrameStuff.KickContentX2-15, SGPFrameStuff.KickDropdownY, Ranks, nil);
		
		local KickText3 = KickContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		KickText3:SetPoint("TOPLEFT", SGPFrameStuff.KickContentX, SGPFrameStuff.KickText3Y);
		KickText3:SetText(SGPLocal.KickText3);
		
		local KickDescription3 = KickContentPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		KickDescription3:SetPoint("TOPLEFT", SGPFrameStuff.KickContentX+5, SGPFrameStuff.KickDescription3Y);
		KickDescription3:SetText(SGPLocal.KickDescription3);
		
		local KickMessageCheckbox = SGP_CreateCheckbox("KickMessagesCheckbox", KickContentPanel, SGPLocal.KickMessageCheckboxText, SGPFrameStuff.KickContentX2, SGPFrameStuff.KickCheckboxY, SGPLocal.KickMessageCheckboxTextTooltip);
		
		local KickMessageEditbox = SGP_CreateEditbox("KickMessagesEditbox", KickContentPanel, 300, 20, SGPFrameStuff.KickContentX2+10, SGPFrameStuff.KickEditbox2Y);
		
		local KickText4 = KickContentPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		KickText4:SetPoint("TOPLEFT", SGPFrameStuff.KickContentX, SGPFrameStuff.KickText4Y);
		KickText4:SetText(SGPLocal.KickText4);
		
		local KickFindButton = SGP_CreateButton("KickFindButton", KickContentPanel, "TOPLEFT", 130, 30, SGPLocal.KickFindButtonText, SGPFrameStuff.KickContentX2, SGPFrameStuff.KickButtonY);
		
		local KickListSMF = SGP_CreateScrollingMessageFrame("SGPListFrameKick", KickContentPanel, "TOPLEFT", SGPFrameStuff.KickListWidth, SGPFrameStuff.KickListHeight, SGPFrameStuff.KickContentX2, SGPFrameStuff.KickListY);
		
		local KickKickButton = SGP_CreateButton("KickKickButton", KickContentPanel, "TOPLEFT", 130, 30, SGPLocal.KickKickButtonText, SGPFrameStuff.KickContentX3, SGPFrameStuff.KickButtonY);
		
		-- Main UI.
		
		local UI = CreateFrame("Frame", "UIFrame", UIParent);
		UI:SetMovable(true);
		UI:EnableMouse(true);
		UI:RegisterForDrag("LeftButton");
		UI:SetScript("OnDragStart", UI.StartMoving);
		UI:SetScript("OnDragStop", UI.StopMovingOrSizing);
		UI:SetSize(SGPFrameStuff.UIWidth, SGPFrameStuff.UIHeight);
		UI:SetPoint("CENTER", 0, 0);
		UI:SetBackdrop({bgFile = "Interface\\ChatFrame\\ChatFrameBackground", 
									edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", 
									tile = true,
									tileSize = 4,
									edgeSize = 16,
									insets = { 10, 10, 10, 10}});
		UI:SetBackdropColor(0.1,0.1,0.1,0.9);
		UI:SetBackdropBorderColor(1,1,1,0.5);
		
		local UIHeader = UI:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge");
		UIHeader:SetPoint("TOP", UI, "TOP", SGPFrameStuff.UIX, SGPFrameStuff.UIHeaderY);
		UIHeader:SetText(SGPLocal.SGPLong);
		
		local UIFindButton = SGP_CreateButton("UIFindButton", UI, "TOP", 180, 30, SGPLocal.UIFindButton, SGPFrameStuff.UIX, SGPFrameStuff.UIFindButtonY);
		local UIBothButton = SGP_CreateButton("UIBothButton", UI, "TOP", 180, 30, SGPLocal.UIBothButton, SGPFrameStuff.UIX, SGPFrameStuff.UIBothButtonY);
		local UIPromoteButton = SGP_CreateButton("UIPromoteButton", UI, "TOP", 180, 30, SGPLocal.UIPromoteButton .. ": 0", SGPFrameStuff.UIX, SGPFrameStuff.UIPromoteButtonY);
		local UIDemoteButton = SGP_CreateButton("UIDemoteButton", UI, "TOP", 180, 30, SGPLocal.UIDemoteButton .. ": 0", SGPFrameStuff.UIX, SGPFrameStuff.UIDemoteButtonY);
		local UISettingsButton = SGP_CreateButton("UISettingsButton", UI, "TOP", 180, 30, SGPLocal.UISettingsButton, SGPFrameStuff.UIX, SGPFrameStuff.UISettingsButtonY);
		
		local UIClose = CreateFrame("Button", nil, UIFrame, "UIPanelCloseButton");
		UIClose:SetPoint("TOPRIGHT", UIFrame, "TOPRIGHT", -4, -4);
		
		SGPFrameStuff.UIFRAME = UIFrame;
		UIFrame:Hide();
		
		-- Promote List Frame
		local UIPromoteList = CreateFrame("Frame", "UIPromoteList", UI);
		UIPromoteList:SetSize(SGPFrameStuff.UIListWidth, SGPFrameStuff.UIHeight);
		UIPromoteList:SetPoint("TOPLEFT", UI, "TOPLEFT", (0 - SGPFrameStuff.UIListWidth - SGPFrameStuff.UIPadding), 0);
		UIPromoteList:SetBackdrop({bgFile = "Interface\\ChatFrame\\ChatFrameBackground", 
									edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", 
									tile = true,
									tileSize = 4,
									edgeSize = 16,
									insets = { 10, 10, 10, 10}});
		UIPromoteList:SetBackdropColor(0.1,0.1,0.1,0.9);
		UIPromoteList:SetBackdropBorderColor(1,1,1,0.5);
		
		local UIPromoteListClose = CreateFrame("Button", nil, UIPromoteList, "UIPanelCloseButton");
		UIPromoteListClose:SetPoint("TOPRIGHT", UIPromoteList, "TOPRIGHT", -4, -4);
		
		local UIPromoteScrollingFrameText = UIPromoteList:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		UIPromoteScrollingFrameText:SetPoint("CENTER", UIPromoteList, "TOP", SGPFrameStuff.PromoteListX, SGPFrameStuff.PromoteListTextY);
		UIPromoteScrollingFrameText:SetText(SGPLocal.PromoteList);
		
		local UIPromoteScrollingFrame = SGP_CreateScrollingMessageFrame("SGPListFramePromote", UIPromoteList, "TOP", (SGPFrameStuff.UIListWidth - 30), (SGPFrameStuff.UIHeight - 55), SGPFrameStuff.PromoteListX, SGPFrameStuff.PromoteListY);
		
		SGPFrameStuff.PROMOTELISTFRAME = UIPromoteList;
		SGPFrameStuff.PROMOTELISTFRAME:Hide();
		
		-- Demote List Frame
		local UIDemoteList = CreateFrame("Frame", "UIDemoteList", UI);
		UIDemoteList:SetSize(SGPFrameStuff.UIListWidth, SGPFrameStuff.UIHeight);
		UIDemoteList:SetPoint("TOPLEFT", UI, "TOPRIGHT", SGPFrameStuff.UIPadding, 0);
		UIDemoteList:SetBackdrop({bgFile = "Interface\\ChatFrame\\ChatFrameBackground", 
									edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", 
									tile = true,
									tileSize = 4,
									edgeSize = 16,
									insets = { 10, 10, 10, 10}});
		UIDemoteList:SetBackdropColor(0.1,0.1,0.1,0.9);
		UIDemoteList:SetBackdropBorderColor(1,1,1,0.5);
		
		local UIDemoteListClose = CreateFrame("Button", nil, UIDemoteList, "UIPanelCloseButton");
		UIDemoteListClose:SetPoint("TOPRIGHT", UIDemoteList, "TOPRIGHT", -4, -4);
		
		local UIDemoteScrollingFrameText = UIDemoteList:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		UIDemoteScrollingFrameText:SetPoint("CENTER", UIDemoteList, "TOP", SGPFrameStuff.DemoteListX, SGPFrameStuff.DemoteListTextY);
		UIDemoteScrollingFrameText:SetText(SGPLocal.DemoteList);
		
		local UIDemoteScrollingFrame = SGP_CreateScrollingMessageFrame("SGPListFrameDemote", UIDemoteList, "TOP", (SGPFrameStuff.UIListWidth - 30), (SGPFrameStuff.UIHeight - 55), SGPFrameStuff.DemoteListX, SGPFrameStuff.DemoteListY);
		
		SGPFrameStuff.DEMOTELISTFRAME = UIDemoteList;
		SGPFrameStuff.DEMOTELISTFRAME:Hide();
		
		-- Now make sure every element has the value it should based on current settings.
		SGP_FillRenderedOptionsWithSaveData();
		SGP_SaveSettings();
		SGP_ChatEcho("Swyn's Guild Promoter loaded. Type /sgp for a list of commands.");
	end
end

function SGP_FillRenderedOptionsWithSaveData()
	SGP_DebugEcho("Filling elements to match current settings.");
	
	-- General Stuff
	SGPFrameStuff.SLIDERS["ScaleSlider"]:SetValue(SGP.Settings.Scale);
	getglobal("UIFrame"):SetScale(SGP.Settings.Scale/100);
	
	-- Ranks Stuff
	for i,v in pairs(SGP.Settings.GuildRanks) do
		if (i > 1) then	
			SGPFrameStuff.CHECKBOXES["Attainable"..v.RankName]:SetChecked(v.Attainable);
			SGPFrameStuff.CHECKBOXES["AllowPromote"..v.RankName]:SetChecked(v.AllowPromote);
			SGPFrameStuff.CHECKBOXES["AllowDemote"..v.RankName]:SetChecked(v.AllowDemote);
			SGPFrameStuff.EDITBOXES["MinTimeInGuild"..v.RankName]:SetNumber(v.TimeInGuild);
			SGPFrameStuff.EDITBOXES["MaxTimeOffline"..v.RankName]:SetNumber(v.TimeOffline);
			SGPFrameStuff.EDITBOXES["MinLevel"..v.RankName]:SetNumber(v.Level);
			SGPFrameStuff.EDITBOXES["MinAchievement"..v.RankName]:SetNumber(v.Achievement);
			-- Updating Dropdown Menu's requires opening them first, so they can be read.
			ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["MinReputation"..v.RankName]);
			SGPFrameStuff.DROPDOWNS["MinReputation"..v.RankName]:SetSelectedID(v.Reputation-3); -- -3 to Offset that in the DDM, Neutral is 1 and in the FACTION_STANDING_LABEL, Neutral is 4.
			ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["MinReputation"..v.RankName]);
		end
	end
			
	-- Alts Stuff
	-- Updating Dropdown Menu's requires opening them first, so they can be read.
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["AltNoteButton"]);
	SGPFrameStuff.DROPDOWNS["AltNoteButton"]:SetSelectedID(SGP.Settings.AltNote);
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["AltNoteButton"]);
	
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["AltModeButton"]);
	SGPFrameStuff.DROPDOWNS["AltModeButton"]:SetSelectedID(SGP.Settings.AltMode);
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["AltModeButton"]);
	
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["AltRankButton"]);
	SGPFrameStuff.DROPDOWNS["AltRankButton"]:SetSelectedID(SGP.Settings.AltRank);
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["AltRankButton"]);
	if ( SGP.Settings.AltMode ~= 2 ) then
		SGPFrameStuff.DROPDOWNS["AltRankButton"]:Hide();
	else
		SGPFrameStuff.DROPDOWNS["AltRankButton"]:Show();
	end
	
	-- Filters Stuff
	-- Updating Dropdown Menu's requires opening them first, so they can be read.
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterPrefixButton"]);
	SGPFrameStuff.DROPDOWNS["FilterPrefixButton"]:SetSelectedID(SGP.Settings.FilterPrefix);
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterPrefixButton"]);
	
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterDoNotPromoteButton"]);
	SGPFrameStuff.DROPDOWNS["FilterDoNotPromoteButton"]:SetSelectedID(SGP.Settings.FilterDNP);
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterDoNotPromoteButton"]);
	SGPFrameStuff.EDITBOXES["FilterDoNotPromoteEditbox"]:SetText(SGP.Settings.FilterDNPText);
	if ( SGP.Settings.FilterDNP == 1 ) then
		SGPFrameStuff.EDITBOXES["FilterDoNotPromoteEditbox"]:Hide();
	else
		SGPFrameStuff.EDITBOXES["FilterDoNotPromoteEditbox"]:Show();
	end
	
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterDoNotDemoteButton"]);
	SGPFrameStuff.DROPDOWNS["FilterDoNotDemoteButton"]:SetSelectedID(SGP.Settings.FilterDND);
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterDoNotDemoteButton"]);
	SGPFrameStuff.EDITBOXES["FilterDoNotDemoteEditbox"]:SetText(SGP.Settings.FilterDNDText);
	if ( SGP.Settings.FilterDND == 1 ) then
		SGPFrameStuff.EDITBOXES["FilterDoNotDemoteEditbox"]:Hide();
	else
		SGPFrameStuff.EDITBOXES["FilterDoNotDemoteEditbox"]:Show();
	end
	
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterDoNotListButton"]);
	SGPFrameStuff.DROPDOWNS["FilterDoNotListButton"]:SetSelectedID(SGP.Settings.FilterDNL);
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterDoNotListButton"]);
	SGPFrameStuff.EDITBOXES["FilterDoNotListEditbox"]:SetText(SGP.Settings.FilterDNLText);
	if ( SGP.Settings.FilterDNL == 1 ) then
		SGPFrameStuff.EDITBOXES["FilterDoNotListEditbox"]:Hide();
	else
		SGPFrameStuff.EDITBOXES["FilterDoNotListEditbox"]:Show();
	end
	
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterDoNotKickButton"]);
	SGPFrameStuff.DROPDOWNS["FilterDoNotKickButton"]:SetSelectedID(SGP.Settings.FilterDNK);
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterDoNotKickButton"]);
	SGPFrameStuff.EDITBOXES["FilterDoNotKickEditbox"]:SetText(SGP.Settings.FilterDNKText);
	if ( SGP.Settings.FilterDNK == 1 ) then
		SGPFrameStuff.EDITBOXES["FilterDoNotKickEditbox"]:Hide();
	else
		SGPFrameStuff.EDITBOXES["FilterDoNotKickEditbox"]:Show();
	end
	
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterNotAnAltButton"]);
	SGPFrameStuff.DROPDOWNS["FilterNotAnAltButton"]:SetSelectedID(SGP.Settings.FilterNAA);
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterNotAnAltButton"]);
	SGPFrameStuff.EDITBOXES["FilterNotAnAltEditbox"]:SetText(SGP.Settings.FilterNAAText);
	if ( SGP.Settings.FilterNAA == 1 ) then
		SGPFrameStuff.EDITBOXES["FilterNotAnAltEditbox"]:Hide();
	else
		SGPFrameStuff.EDITBOXES["FilterNotAnAltEditbox"]:Show();
	end
	
	-- Automation Stuff
	-- Updating Dropdown Menu's requires opening them first, so they can be read.
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["AutoTypeButton"]);
	SGPFrameStuff.DROPDOWNS["AutoTypeButton"]:SetSelectedID(SGP.Settings.AutoType);
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["AutoTypeButton"]);
	
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["AutoModeButton"]);
	SGPFrameStuff.DROPDOWNS["AutoModeButton"]:SetSelectedID(SGP.Settings.AutoMode);
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["AutoModeButton"]);
	
	-- Export Stuff
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["ExportButton1"]);
	SGPFrameStuff.DROPDOWNS["ExportButton1"]:SetSelectedID(1);
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["ExportButton1"]);
	SGPFrameStuff.EDITBOXES["ExportEditbox"]:Hide();
	
	SGPFrameStuff.CHECKBOXES["ExportIgnoreCheckbox"]:SetChecked(SGP.Settings.ExportIgnore);
	
	-- Kick Stuff
	SGPFrameStuff.EDITBOXES["KickEditbox"]:SetNumber(SGP.Settings.InactiveDays);
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["KickRankButton"]);
	SGPFrameStuff.DROPDOWNS["KickRankButton"]:SetSelectedID(SGP.Settings.InactiveRank);
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["KickRankButton"]);
	
	SGPFrameStuff.CHECKBOXES["KickMessagesCheckbox"]:SetChecked(SGP.Settings.InactiveMessageOn);
	SGPFrameStuff.EDITBOXES["KickMessagesEditbox"]:SetText(SGP.Settings.InactiveMessage);
	if ( SGP.Settings.InactiveMessageOn ) then
		SGPFrameStuff.EDITBOXES["KickMessagesEditbox"]:Show()
	else
		SGPFrameStuff.EDITBOXES["KickMessagesEditbox"]:Hide()
	end
end

function SGP_UpdateSettings()
	SGP_DebugEcho("Updating current settings to reflect elements.");
	
	-- General Stuff
	SGP.Settings.Scale = SGPFrameStuff.SLIDERS["ScaleSlider"]:GetValue(); -- Rounds so we don't have decimals.
	getglobal("UIFrame"):SetScale(SGP.Settings.Scale/100);
	
	-- Ranks Stuff
	for i,v in pairs(SGP.Settings.GuildRanks) do
		if (i > 1) then
			v.Attainable = SGPFrameStuff.CHECKBOXES["Attainable"..v.RankName]:GetChecked();
			v.AllowPromote = SGPFrameStuff.CHECKBOXES["AllowPromote"..v.RankName]:GetChecked();
			v.AllowDemote = SGPFrameStuff.CHECKBOXES["AllowDemote"..v.RankName]:GetChecked();
			v.TimeInGuild = SGPFrameStuff.EDITBOXES["MinTimeInGuild"..v.RankName]:GetNumber();
			v.TimeOffline = SGPFrameStuff.EDITBOXES["MaxTimeOffline"..v.RankName]:GetNumber();
			v.Level = SGPFrameStuff.EDITBOXES["MinLevel"..v.RankName]:GetNumber();
			v.Achievement = SGPFrameStuff.EDITBOXES["MinAchievement"..v.RankName]:GetNumber();
			-- Updating Dropdown Menu's requires opening them first, so they can be read.
			ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["MinReputation"..v.RankName]);
			v.Reputation = SGPFrameStuff.DROPDOWNS["MinReputation"..v.RankName]:GetSelectedID()+3; -- +3 to Offset that in the DDM, Neutral is 1 and in the FACTION_STANDING_LABEL, Neutral is 4.
			ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["MinReputation"..v.RankName]);
		end
	end
	
	-- Alts Stuff
	-- Updating Dropdown Menu's requires opening them first, so they can be read.
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["AltNoteButton"]);
	SGP.Settings.AltNote = SGPFrameStuff.DROPDOWNS["AltNoteButton"]:GetSelectedID();
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["AltNoteButton"]);
	
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["AltModeButton"]);
	SGP.Settings.AltMode = SGPFrameStuff.DROPDOWNS["AltModeButton"]:GetSelectedID();
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["AltModeButton"]);
	
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["AltRankButton"]);
	SGP.Settings.AltRank = SGPFrameStuff.DROPDOWNS["AltRankButton"]:GetSelectedID();
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["AltRankButton"]);
	if ( SGP.Settings.AltMode ~= 2 ) then
		SGPFrameStuff.DROPDOWNS["AltRankButton"]:Hide();
	else
		SGPFrameStuff.DROPDOWNS["AltRankButton"]:Show();
	end
	
	-- Filters Stuff
	-- Updating Dropdown Menu's requires opening them first, so they can be read.
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterPrefixButton"]);
	SGP.Settings.FilterPrefix = SGPFrameStuff.DROPDOWNS["FilterPrefixButton"]:GetSelectedID();
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterPrefixButton"]);
	
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterDoNotPromoteButton"]);
	SGP.Settings.FilterDNP = SGPFrameStuff.DROPDOWNS["FilterDoNotPromoteButton"]:GetSelectedID();
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterDoNotPromoteButton"]);
	SGP.Settings.FilterDNPText = SGPFrameStuff.EDITBOXES["FilterDoNotPromoteEditbox"]:GetText();
	if ( SGP.Settings.FilterDNP == 1 ) then
		SGPFrameStuff.EDITBOXES["FilterDoNotPromoteEditbox"]:Hide();
	else
		SGPFrameStuff.EDITBOXES["FilterDoNotPromoteEditbox"]:Show();
	end
	
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterDoNotDemoteButton"]);
	SGP.Settings.FilterDND = SGPFrameStuff.DROPDOWNS["FilterDoNotDemoteButton"]:GetSelectedID();
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterDoNotDemoteButton"]);
	SGP.Settings.FilterDNDText = SGPFrameStuff.EDITBOXES["FilterDoNotDemoteEditbox"]:GetText();
	if ( SGP.Settings.FilterDND == 1 ) then
		SGPFrameStuff.EDITBOXES["FilterDoNotDemoteEditbox"]:Hide();
	else
		SGPFrameStuff.EDITBOXES["FilterDoNotDemoteEditbox"]:Show();
	end
	
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterDoNotListButton"]);
	SGP.Settings.FilterDNL = SGPFrameStuff.DROPDOWNS["FilterDoNotListButton"]:GetSelectedID();
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterDoNotListButton"]);
	SGP.Settings.FilterDNLText = SGPFrameStuff.EDITBOXES["FilterDoNotListEditbox"]:GetText();
	if ( SGP.Settings.FilterDNL == 1 ) then
		SGPFrameStuff.EDITBOXES["FilterDoNotListEditbox"]:Hide();
	else
		SGPFrameStuff.EDITBOXES["FilterDoNotListEditbox"]:Show();
	end
	
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterDoNotKickButton"]);
	SGP.Settings.FilterDNK = SGPFrameStuff.DROPDOWNS["FilterDoNotKickButton"]:GetSelectedID();
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterDoNotKickButton"]);
	SGP.Settings.FilterDNKText = SGPFrameStuff.EDITBOXES["FilterDoNotKickEditbox"]:GetText();
	if ( SGP.Settings.FilterDNK == 1 ) then
		SGPFrameStuff.EDITBOXES["FilterDoNotKickEditbox"]:Hide();
	else
		SGPFrameStuff.EDITBOXES["FilterDoNotKickEditbox"]:Show();
	end
	
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterNotAnAltButton"]);
	SGP.Settings.FilterNAA = SGPFrameStuff.DROPDOWNS["FilterNotAnAltButton"]:GetSelectedID();
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["FilterNotAnAltButton"]);
	SGP.Settings.FilterNAAText = SGPFrameStuff.EDITBOXES["FilterNotAnAltEditbox"]:GetText();
	if ( SGP.Settings.FilterNAA == 1 ) then
		SGPFrameStuff.EDITBOXES["FilterNotAnAltEditbox"]:Hide();
	else
		SGPFrameStuff.EDITBOXES["FilterNotAnAltEditbox"]:Show();
	end
	
	-- Automation Stuff
	-- Updating Dropdown Menu's requires opening them first, so they can be read.
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["AutoTypeButton"]);
	SGP.Settings.AutoType = SGPFrameStuff.DROPDOWNS["AutoTypeButton"]:GetSelectedID();
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["AutoTypeButton"]);
	
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["AutoModeButton"]);
	SGP.Settings.AutoMode = SGPFrameStuff.DROPDOWNS["AutoModeButton"]:GetSelectedID();
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["AutoModeButton"]);
	
	-- Export Stuff
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["ExportButton1"]);
	local exportMode = SGPFrameStuff.DROPDOWNS["ExportButton1"]:GetSelectedID();
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["ExportButton1"]);
	if ( exportMode == 3 ) then
		SGPFrameStuff.EDITBOXES["ExportEditbox"]:Show();
	else
		SGPFrameStuff.EDITBOXES["ExportEditbox"]:Hide();
	end
	
	SGP.Settings.ExportIgnore = SGPFrameStuff.CHECKBOXES["ExportIgnoreCheckbox"]:GetChecked();
	
	-- Kick Stuff
	SGP.Settings.InactiveDays = SGPFrameStuff.EDITBOXES["KickEditbox"]:GetNumber();
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["KickRankButton"]);
	SGP.Settings.InactiveRank = SGPFrameStuff.DROPDOWNS["KickRankButton"]:GetSelectedID();
	ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["KickRankButton"]);
	
	SGP.Settings.InactiveMessageOn = SGPFrameStuff.CHECKBOXES["KickMessagesCheckbox"]:GetChecked();
	SGP.Settings.InactiveMessage = SGPFrameStuff.EDITBOXES["KickMessagesEditbox"]:GetText();
	if ( SGP.Settings.InactiveMessageOn ) then
		SGPFrameStuff.EDITBOXES["KickMessagesEditbox"]:Show()
	else
		SGPFrameStuff.EDITBOXES["KickMessagesEditbox"]:Hide()
	end
		
	
	-- Save Settings once they've been updated.
	SGP_SaveSettings();
end

function SGP_CreateCheckbox(name, parent, text, offsetX, offsetY, tooltips)
	local cb = CreateFrame("CheckButton", name, parent, "ChatConfigCheckButtonTemplate");
	cb:SetPoint("TOPLEFT", parent, "TOPLEFT", offsetX, offsetY);
	if (tooltips ~= nil) then
		cb.tooltip = tooltips;
	end
	cb:SetScript("OnClick", function(self)
									   SGP_UpdateSettings();
								   end);
	
	local font = cb:CreateFontString("CheckFont"..name, "OVERLAY", "GameFontHighlightSmall");
	font:SetText(text);
	font:SetPoint("LEFT", cb, "RIGHT", 4, 1);
	
	SGPFrameStuff.CHECKBOXES[name] = cb;
end

function SGP_CreateEditbox(name, parent, width, height, offsetX, offsetY, tooltip)
	local eb = CreateFrame("EditBox", name, parent, "InputBoxTemplate");
	eb:SetPoint("TOPLEFT", parent, "TOPLEFT", offsetX, offsetY);
	if ( string.find(name, "MinLevel") or string.find(name, "KickEditbox") or string.find(name, "ConvertFilters") ) then
		eb:SetMaxLetters(3);
	elseif ( string.find(name, "Filter") ) then
		eb:SetMaxLetters(1);
	elseif ( string.find(name, "MinAchievement") ) then
		eb:SetMaxLetters(7);
	elseif ( string.find(name, "KickMessage") ) then
		eb:SetMaxLetters(150);
	elseif ( string.find(name, "Time") ) then
		eb:SetMaxLetters(10);
	elseif ( string.find(name, "MemJoinDate") ) then
		if ( string.find(name, "Name") ) then
			eb:SetMaxLetters(80);
		elseif ( string.find(name, "Year") ) then
			eb:SetMaxLetters(4);
		else
			eb:SetMaxLetters(2);
		end
	else
		eb:SetMaxLetters(22);
	end
	eb:SetWidth(width);
	eb:SetHeight(height);
	eb:SetAutoFocus(false);
	if (tooltip ~= nil) then
		eb.tooltip = tooltip;
	end
	eb:SetScript("OnEnterPressed", function(self)
									   eb:SetCursorPosition(0);
									   eb:ClearFocus();
								   end);
	eb:SetScript("OnEditFocusLost", function(self)
										SGP_UpdateSettings();
									    eb:SetCursorPosition(0);
									    eb:ClearFocus();
								    end);
	eb:SetScript("OnTextSet", function(self)
								  eb:SetCursorPosition(0);
								  eb:ClearFocus();
							  end);
	if ( not string.find(name, "Filter") and not string.find(name, "Export") and not string.find(name, "KickMessage") and not string.find(name, "MemJoinDateName") ) then
		eb:SetNumeric();
		eb:Insert(0);
	else
		eb:SetText("");
	end
	if string.find(name, "GeneralConvertFiltersDNPEditbox") then eb:SetText("DNP"); end
	if string.find(name, "GeneralConvertFiltersDNDEditbox") then eb:SetText("DND"); end
	if string.find(name, "GeneralConvertFiltersDNLEditbox") then eb:SetText("DNL"); end
	eb:SetCursorPosition(0);
	eb:ClearFocus();
	
	SGPFrameStuff.EDITBOXES[name] = eb;
end

function SGP_CreateDropDownButton(name, parent, pos, width, offsetX, offsetY, items, tooltips)
	local ddm = CreateFrame("Button", name, parent, "UIDropDownMenuTemplate");

	ddm:ClearAllPoints();
	ddm:SetPoint(pos, parent, pos, offsetX, offsetY);
	ddm:Show();
	
	local function OnClick(self)
		ddm:SetSelectedID(self:GetID());
		SGP_UpdateSettings();
	end
	
	local info = { };
	local function initialize(self, level)
		-- local info = UIDropDownMenu_CreateInfo();
		for i = 1, #items do
			local v = items[i];
			
			info.text = v;
			info.value = v;
			info.func = OnClick;
			
			info.tooltipOnButton = tooltips and 1 or nil;
			info.tooltipTitle = tooltips and v or nil;
			info.tooltipText = tooltips and tooltips[i] or nil;
			
			info.selected = i == ddm.selected;
			
			UIDropDownMenu_AddButton(info, level);
		end
	end
	
	ddm.selected = 1;
	
	function ddm:SetSelectedID(id)
		self.selected = id;
		UIDropDownMenu_SetText(ddm, items[id]);
	end
	
	function ddm:GetSelectedID()
		return self.selected;
	end

	UIDropDownMenu_Initialize(ddm, initialize);
	UIDropDownMenu_SetWidth(ddm, width-24);
	UIDropDownMenu_SetButtonWidth(ddm, width);
	UIDropDownMenu_JustifyText(ddm, "LEFT");
					
	SGPFrameStuff.DROPDOWNS[name] = ddm;
	
end

function SGP_CreateButton(name, parent, pos, width, height, text, offsetX, offsetY)
	local b = CreateFrame("Button", name, parent, "UIPanelButtonTemplate");
	b:SetWidth(width);
	b:SetHeight(height);
	b:SetPoint(pos, parent, pos, offsetX, offsetY);
	
	-- Find
	if name == "UIFindButton" then
		b:SetScript("OnClick", SGP_Find);
	end
	-- Promote and Demote
	if name == "UIBothButton" then
		b:SetScript("OnClick", function()
						if ( not SGP.Settings.ReloadLockdown ) then
							SGP_Promote();
							SGP_Demote();
						else
							StaticPopup_Show("SGP_ReloadLockdown");
						end
					end);
	end
	-- Promote
	if name == "UIPromoteButton" then
		b:SetScript("OnClick", SGP_Promote);
	end
	-- Demote
	if name == "UIDemoteButton" then
		b:SetScript("OnClick", SGP_Demote);
	end
	-- Settings
	if name == "UISettingsButton" then
		b:SetScript("OnClick", function()
								   InterfaceOptionsFrame_OpenToCategory(SGPLocal.SGPShort);
							   end);
	end
	-- Convert Filters
	if name == "GeneralConvertFiltersFindButton" then
		b:SetScript("OnClick", SGP_FindOldFilters);
	end
	if name == "GeneralConvertFiltersConvertButton" then
		b:SetScript("OnClick", SGP_ConvertOldFilters);
	end
	-- Update Filter Lists
	if name == "FilterListsUpdateButton" then
		b:SetScript("OnClick", SGP_UpdateFilterLists);
	end
	-- MemJoinDate
	if name == "MemJoinDateGetButton" then
		b:SetScript("OnClick", SGP_MemJoinDateGet);
	end
	if name == "MemJoinDateSetButton" then
		b:SetScript("OnClick", SGP_MemJoinDateSet);
	end
	if name == "MemJoinDateListButton" then
		b:SetScript("OnClick", SGP_UpdateMemJoinDateList);
	end
	-- Export
	if name == "ExportButton2" then
		b:SetScript("OnClick", SGP_Export);
	end
	-- Kick Find Button
	if name == "KickFindButton" then
		b:SetScript("OnClick", SGP_KickFind);
	end
	-- Kick Kick Button
	if name == "KickKickButton" then
		b:SetScript("OnClick", function()
								   StaticPopup_Show("SGP_KickKick");
							   end);
	end
	
	local font = b:CreateFontString(nil,"OVERLAY","GameFontHighlight");
	font:SetText(text);
	font:SetPoint("CENTER");
	
	SGPFrameStuff.BUTTONS[name] = b;
	SGPFrameStuff.BUTTONTEXTS[name] = font;
end

function SGP_CreateScrollingMessageFrame(name, parent, pos, width, height, topOffsetX, topOffsetY)
	local smf = CreateFrame("ScrollingMessageFrame", name, parent);
	smf:SetPoint(pos, parent, pos, topOffsetX, topOffsetY-3);
	smf:SetWidth(width-6);
	smf:SetHeight(height-6);
	smf:SetMaxLines(1000);
	smf:SetFading(false);
	smf:SetJustifyH("LEFT");
	smf:SetFontObject("GameFontHighlightSmall");
	smf:SetIndentedWordWrap(true);
	smf:SetInsertMode("TOP");
	smf:SetScript("OnMouseWheel", function(self, delta)
		if delta == 1 then
			if IsShiftKeyDown() then
				smf:ScrollToBottom();
			else
				smf:ScrollDown();
			end
		else
			if IsShiftKeyDown() then
				smf:ScrollToTop();
			else
				smf:ScrollUp();
			end
		end
		end);
	
	smf:SetBackdrop({bgFile = "Interface\\ChatFrame\\ChatFrameBackground", 
								tile = true,
								tileSize = 2});
	if (not string.find(name, "SGPListFrameFilter")) then
		smf:SetBackdropColor(0.0,0.0,0.0,0.8);
	else
		smf:SetBackdropColor(0.0,0.0,0.0,1.0);
	end
		
	SGPFrameStuff.LISTS[name] = smf;
end

function SGP_CreateSlider(name, parent, width, height,  topOffsetX, topOffsetY, tooltips)
	local s = CreateFrame("Slider", name, parent, "OptionsSliderTemplate");
	s:SetPoint("TOPLEFT", parent, "TOPLEFT", topOffsetX, topOffsetY);
	s:SetWidth(width);
	s:SetHeight(height);
	s:SetOrientation("HORIZONTAL");
	if (tooltips ~= nil) then
		s.tooltipText = tooltips;
	end
	getglobal(s:GetName() .. "Low"):SetText("50%");
	getglobal(s:GetName() .. "High"):SetText("150%");
	getglobal(s:GetName() .. "Text"):SetText("100%");
	s:SetMinMaxValues(50, 150);
	s:SetStepsPerPage(5);
	s:SetValueStep(5);
	s:SetValue(100);
	s:Show();
	s:SetScript("OnValueChanged", function()
								getglobal(s:GetName() .. "Text"):SetText(math.floor(s:GetValue()+0.5) .. "%");
							end);
	s:SetScript("OnMouseUp", SGP_UpdateSettings);
	SGPFrameStuff.SLIDERS[name] = s;
end

SLASH_SGP1 = '/sgp';
function SlashCmdList.SGP(msg, editbox)
	if msg == 'show' then
		SGPFrameStuff.UIFRAME:Show();
	elseif msg == 'hide' then
		SGPFrameStuff.UIFRAME:Hide();
	elseif msg == 'settings' then
		InterfaceOptionsFrame_OpenToCategory(SGPLocal.SGPShort);
	else
		SGPFrameStuff.UIFRAME:Show();
	end
end

function SGP_UpdateFilterLists()
	SGP_DebugEcho("Updating Filter Lists.");
	SGPFrameStuff.LISTS["SGPListFrameFilterDNP"]:Clear();
	SGPFrameStuff.LISTS["SGPListFrameFilterDND"]:Clear();
	SGPFrameStuff.LISTS["SGPListFrameFilterDNL"]:Clear();
	SGPFrameStuff.LISTS["SGPListFrameFilterDNK"]:Clear();
	SGPFrameStuff.LISTS["SGPListFrameFilterNAA"]:Clear();
	
	-- MemberList won't always be populated, so use own.
	for i=1,GetNumGuildMembers() do
		local Name, Rank, _, _, _, _, Note, OfficerNote, _, _, ClassFileName = GetGuildRosterInfo(i);
		local filters = SGP_GetFilters(Note, OfficerNote);
		-- Are we DNP?
		if ( filters.DNP ) then
			SGPFrameStuff.LISTS["SGPListFrameFilterDNP"]:AddMessage("|c" .. SGP_GetClassColour(ClassFileName) .. Name .. "|r |cffFFFFFF" .. Rank .. "|r");
		end
		-- Are we DND?
		if ( filters.DND ) then
			SGPFrameStuff.LISTS["SGPListFrameFilterDND"]:AddMessage("|c" .. SGP_GetClassColour(ClassFileName) .. Name .. "|r |cffFFFFFF" .. Rank .. "|r");
		end
		-- Are we DNL?
		if ( filters.DNL ) then
			SGPFrameStuff.LISTS["SGPListFrameFilterDNL"]:AddMessage("|c" .. SGP_GetClassColour(ClassFileName) .. Name .. "|r |cffFFFFFF" .. Rank .. "|r");
		end
		-- Are we DNK?
		if ( filters.DNK ) then
			SGPFrameStuff.LISTS["SGPListFrameFilterDNK"]:AddMessage("|c" .. SGP_GetClassColour(ClassFileName) .. Name .. "|r |cffFFFFFF" .. Rank .. "|r");
		end
		-- Are we NAA?
		if ( filters.NAA ) then
			SGPFrameStuff.LISTS["SGPListFrameFilterNAA"]:AddMessage("|c" .. SGP_GetClassColour(ClassFileName) .. Name .. "|r |cffFFFFFF" .. Rank .. "|r");
		end
	end
end

function SGP_ClearLists(msg)
	if (msg == "All" or msg == "Promote") then
		ClearTable(SGP.PromoteList);
		SGPFrameStuff.LISTS["SGPListFramePromote"]:Clear();
	end
	if (msg == "All" or msg == "Demote") then
		ClearTable(SGP.DemoteList);
		SGPFrameStuff.LISTS["SGPListFrameDemote"]:Clear();
	end
	if (msg == "Kick") then
		ClearTable(SGP.Settings.InactiveList);
		SGPFrameStuff.LISTS["SGPListFrameKick"]:Clear();
	end
	if (table.getn(SGP.PromoteList) == 0) then
		SGPFrameStuff.PROMOTELISTFRAME:Hide();
	end
	if (table.getn(SGP.DemoteList) == 0) then
		SGPFrameStuff.DEMOTELISTFRAME:Hide();
	end
end

function ClearTable(TABLE)
	for i,v in pairs(TABLE) do
		TABLE[i] = nil;
	end
end

function SGP_ShowLists()
	local members = SGP.Settings.MemberList;
	local membersTally = SGP.Settings.MemberTallyList;
	local rn = string.gsub(GetRealmName(), " ", "");

	for i,v in pairs(SGPFrameStuff.LISTS) do
		if (v:GetName() == "SGPListFramePromote") then
			for k,x in pairs(SGP.PromoteList) do
				local filters = SGP_GetFilters(x.Note, x.OfficerNote);
				if ( not filters.DNL ) then
					 -- AltText starts as empty.
					local altText = "";
					-- If we have a main, use that as AltText.
					local main = SGP_MainName(x.Name, x.Note, x.OfficerNote);
					local mainIndex = SGP_NameIndex(SGP.Settings.MemberTallyList, main);
					if (mainIndex ~= nil and x.Name ~= SGP.Settings.MemberTallyList[mainIndex].Name) then
						altText = "|cffFA06B8(|r|c" .. SGP_GetClassColour(SGP.Settings.MemberTallyList[mainIndex].Name) .. SGP.Settings.MemberTallyList[mainIndex].Name .. "|r|cffFA06B8)|r ";
					end
					local n = string.gsub(x.Name, "-"..rn, "");
					v:AddMessage("|c" .. SGP_GetClassColour(x.ClassFileName) .. n .. "|r " .. altText .. "|cffFFFFFF" .. x.Rank .. "|r |cffFA06B8>|r |cffFFFFFF" .. GuildControlGetRankName(x.NewRankIndex) .. "|r");
				end
			end
		elseif (v:GetName() == "SGPListFrameDemote") then
			for l,y in pairs(SGP.DemoteList) do
				local filters = SGP_GetFilters(y.Note, y.OfficerNote);
				if ( not filters.DNL ) then
					 -- AltText starts as empty.
					local altText = "";
					-- If we have a main, use that as AltText.
					local main = SGP_MainName(y.Name, y.Note, y.OfficerNote);
					local mainIndex = SGP_NameIndex(SGP.Settings.MemberTallyList, main);
					if (mainIndex ~= nil and y.Name ~= SGP.Settings.MemberTallyList[mainIndex].Name) then
						altText = "|cffFA06B8(|r|c" .. SGP_GetClassColour(SGP.Settings.MemberTallyList[mainIndex].Name) .. SGP.Settings.MemberTallyList[mainIndex].Name .. "|r|cffFA06B8)|r ";
					end
					local n = string.gsub(y.Name, "-"..rn, "");
					v:AddMessage("|c" .. SGP_GetClassColour(y.ClassFileName) .. n .. "|r " .. altText .. "|cffFFFFFF" .. y.Rank .. "|r |cffFA06B8>|r |cffFFFFFF" .. GuildControlGetRankName(y.NewRankIndex) .. "|r");
				end
			end
		end
	end
	-- If PromoteList has people in it, and SGPListFramePromote has people in it, show it. (Just in case everyone in the list is DNL filtered)
	if (table.getn(SGP.PromoteList) > 0 and SGPFrameStuff.LISTS["SGPListFramePromote"]:GetCurrentLine() >= 0) then
		SGPFrameStuff.PROMOTELISTFRAME:Show();
	end
	-- If DemoteList has people in it, and SGPListFrameDemote has people in it, show it. (Just in case everyone in the list is DNL filtered)
	if (table.getn(SGP.DemoteList) > 0 and SGPFrameStuff.LISTS["SGPListFrameDemote"]:GetCurrentLine() >= 0) then
		SGPFrameStuff.DEMOTELISTFRAME:Show();
	end
end

function SGP_GetClassColour(name)
	if (name ~= nil) then
		-- If name is a ClassFileName, return the colour.
		if ( RAID_CLASS_COLORS[name] ~= nil ) then
			return RAID_CLASS_COLORS[name].colorStr;
		end
		-- Otherwise, we're probably a guildies name, so check the guild roster for anyone by that name.
		for i,v in pairs(SGP.Settings.MemberList) do
			if ( v.Name == name ) then
				return RAID_CLASS_COLORS[v.ClassFileName].colorStr;
			end
		end
	end
	-- If we're here then we're most likely an arbitrary name, in which case, return white.
	return "ff999999";
end

function SGP_GetFilters(note, onote)
	SGP_DebugEcho("Getting filters. Note: '" .. note .. "' OfficerNote: '" .. onote .. "'.");
	-- This is just to find whether a note contains a filter. This doesn't control whether that filter is on, what note is being sent or whatever.
	-- The idea is to send it either the public note, officer note, or both combined (note .. " " .. onote) and the sender deals with whether a filter is on or not.
	local filters = {
				DNP = false;
				DND = false;
				DNL = false;
				DNK = false;
				NAA = false;
			};
	local filterPrefix;
	if     SGP.Settings.FilterPrefix == 2 then
		filterPrefix = "^";
	elseif SGP.Settings.FilterPrefix == 3 then
		filterPrefix = "@";
	elseif SGP.Settings.FilterPrefix == 4 then
		filterPrefix = ">";
	elseif SGP.Settings.FilterPrefix == 5 then
		filterPrefix = "<";
	else
		filterPrefix = "!";
	end
	-- Get any filters that might exist in either note.
	local noteFilterWord = nil;
	local onoteFilterWord = nil;
	if (note ~= nil and note ~= "") then
		for w in string.gmatch(note, "[!^@><]%w+") do
			SGP_DebugEcho("Word: '" .. w .. "'. First Letter: '" .. string.sub(w,1,1) .. "'.");
			if ( string.sub(w, 1, 1) == filterPrefix and string.len(w) > 1 ) then
				noteFilterWord = w;
			end
		end
	end
	if (onote ~= nil and onote ~= "") then
		for w in string.gmatch(onote, "[!^@><]%w+") do
			if ( string.sub(w, 1, 1) == filterPrefix and string.len(w) > 1 ) then
				onoteFilterWord = w;
			end
		end
	end
	-- Debug
	if noteFilterWord ~= nil then SGP_DebugEcho("Note Filter Word: '" .. noteFilterWord .. "'."); end
	if onoteFilterWord ~= nil then SGP_DebugEcho("Officer Note Filter Word: '" .. onoteFilterWord .. "'."); end
	-- Now work out whether we should filter out this person filter by filter.
	-- DNP
	if ( ((SGP.Settings.FilterDNP == 3 or SGP.Settings.FilterDNP == 4) and onoteFilterWord ~= nil and string.find(onoteFilterWord, SGP.Settings.FilterDNPText)) or
		 ((SGP.Settings.FilterDNP == 2 or SGP.Settings.FilterDNP == 4) and noteFilterWord ~= nil and string.find(noteFilterWord, SGP.Settings.FilterDNPText)) )then
		filters.DNP = true;
	end
	-- DND
	if ( ((SGP.Settings.FilterDND == 3 or SGP.Settings.FilterDND == 4) and onoteFilterWord ~= nil and string.find(onoteFilterWord, SGP.Settings.FilterDNDText)) or
		 ((SGP.Settings.FilterDND == 2 or SGP.Settings.FilterDND == 4) and noteFilterWord ~= nil and string.find(noteFilterWord, SGP.Settings.FilterDNDText)) )then
		filters.DND = true;
	end
	-- DNL
	if ( ((SGP.Settings.FilterDNL == 3 or SGP.Settings.FilterDNL == 4) and onoteFilterWord ~= nil and string.find(onoteFilterWord, SGP.Settings.FilterDNLText)) or
		 ((SGP.Settings.FilterDNL == 2 or SGP.Settings.FilterDNL == 4) and noteFilterWord ~= nil and string.find(noteFilterWord, SGP.Settings.FilterDNLText)) )then
		filters.DNL = true;
	end
	-- DNK
	if ( ((SGP.Settings.FilterDNK == 3 or SGP.Settings.FilterDNK == 4) and onoteFilterWord ~= nil and string.find(onoteFilterWord, SGP.Settings.FilterDNKText)) or
		 ((SGP.Settings.FilterDNK == 2 or SGP.Settings.FilterDNK == 4) and noteFilterWord ~= nil and string.find(noteFilterWord, SGP.Settings.FilterDNKText)) )then
		filters.DNK = true;
	end
	-- NAA
	if ( ((SGP.Settings.FilterNAA == 3 or SGP.Settings.FilterNAA == 4) and onoteFilterWord ~= nil and string.find(onoteFilterWord, SGP.Settings.FilterNAAText)) or
		 ((SGP.Settings.FilterNAA == 2 or SGP.Settings.FilterNAA == 4) and noteFilterWord ~= nil and string.find(noteFilterWord, SGP.Settings.FilterNAAText)) )then
		filters.NAA = true;
	end
	-- Now return the filters.
	return filters;
end

function SGP_ReplaceWord(Match, Replace, String)
	return string.gsub( String, "%w+", function(s) if(s == Match) then return Replace end return s end );
end

function SGP_FindOldFilters()
	SGP_DebugEcho("Finding Old Filters.");
	ClearTable(SGP.Settings.OldFiltersList);
	SGPFrameStuff.LISTS["SGPGeneralConvertFiltersList"]:Clear();
	
	local DNP = SGPFrameStuff.EDITBOXES["GeneralConvertFiltersDNPEditbox"]:GetText() and SGPFrameStuff.EDITBOXES["GeneralConvertFiltersDNPEditbox"]:GetText() or "DNP";
	local DND = SGPFrameStuff.EDITBOXES["GeneralConvertFiltersDNDEditbox"]:GetText() and SGPFrameStuff.EDITBOXES["GeneralConvertFiltersDNDEditbox"]:GetText() or "DND";
	local DNL = SGPFrameStuff.EDITBOXES["GeneralConvertFiltersDNLEditbox"]:GetText() and SGPFrameStuff.EDITBOXES["GeneralConvertFiltersDNLEditbox"]:GetText() or "DNL";
	SGP_DebugEcho("DNP: " .. DNP .. " |cffFA06B8>|r DND: " .. DND .. " |cffFA06B8>|r DNL: " .. DNL);
	
	local filterPrefix;
	if     SGP.Settings.FilterPrefix == 2 then
		filterPrefix = "^";
	elseif SGP.Settings.FilterPrefix == 3 then
		filterPrefix = "@";
	elseif SGP.Settings.FilterPrefix == 4 then
		filterPrefix = ">";
	elseif SGP.Settings.FilterPrefix == 5 then
		filterPrefix = "<";
	else
		filterPrefix = "!";
	end
	
	for i=1,GetNumGuildMembers() do
		local Name, Rank, _, _, _, _, Note, OfficerNote, _, _, ClassFileName = GetGuildRosterInfo(i);
		SGP_DebugEcho("Name: " .. Name .. " Note: " .. Note .. " OfficerNote: " .. OfficerNote);
		local person = {
					Index = i;
					Name = Name;
					Rank = Rank;
					OldNote = Note;
					NewNote = Note;
					OldOfficerNote = OfficerNote;
					NewOfficerNote = OfficerNote;
					Class = ClassFileName;
				}
		if (Note ~= nil and Note ~= "") then
			local addDNP, addDND, addDNL = false, false, false;
			local oldNote = person.OldNote;
			local newNote = person.OldNote;
			-- Replace any DNP's.
			newNote = SGP_ReplaceWord(DNP, "", oldNote);
			if (newNote ~= oldNote) then addDNP = true; end
			oldNote = newNote;
			-- Replace any DND's.
			newNote = SGP_ReplaceWord(DND, "", oldNote);
			if (newNote ~= oldNote) then addDND = true; end
			oldNote = newNote;
			-- Replace any DNL's.
			newNote = SGP_ReplaceWord(DNL, "", oldNote);
			if (newNote ~= oldNote) then addDNL = true; end
			oldNote = newNote;
			-- Now add new filters.
			if (addDNP or addDND or addDNL) then
				newNote = newNote .. " " .. filterPrefix;
				if addDNP then newNote = newNote .. SGP.Settings.FilterDNPText; end
				if addDND then newNote = newNote .. SGP.Settings.FilterDNDText; end
				if addDNL then newNote = newNote .. SGP.Settings.FilterDNLText; end
			end
			if ( newNote ~= person.OldNote ) then
				-- Now remove needless whitespace.
				newNote = newNote:gsub("%s+", " "); -- Changes 1 or more space into 1 space. Stops double or tripple spacing etc.
				newNote = newNote:gsub("^%s+", ""); -- Remove spaces from start of string.
				newNote = newNote:gsub("%s+$", ""); -- Remove spaces from the end of a string.
			end
			person.NewNote = newNote;
		end
		if (OfficerNote ~= nil and OfficerNote ~= "") then
			local addDNP, addDND, addDNL = false, false, false;
			local oldNote = person.OldOfficerNote;
			local newNote = person.OldOfficerNote;
			-- Replace any DNP's.
			newNote = SGP_ReplaceWord(DNP, "", oldNote);
			if (newNote ~= oldNote) then addDNP = true; end
			oldNote = newNote;
			-- Replace any DND's.
			newNote = SGP_ReplaceWord(DND, "", oldNote);
			if (newNote ~= oldNote) then addDND = true; end
			oldNote = newNote;
			-- Replace any DNL's.
			newNote = SGP_ReplaceWord(DNL, "", oldNote);
			if (newNote ~= oldNote) then addDNL = true; end
			oldNote = newNote;
			-- Now add new filters.
			if (addDNP or addDND or addDNL) then
				newNote = newNote .. " " .. filterPrefix;
				if addDNP then newNote = newNote .. SGP.Settings.FilterDNPText; end
				if addDND then newNote = newNote .. SGP.Settings.FilterDNDText; end
				if addDNL then newNote = newNote .. SGP.Settings.FilterDNLText; end
			end
			if ( newNote ~= person.OldOfficerNote ) then
				-- Now remove needless whitespace.
				newNote = newNote:gsub("%s+", " "); -- Changes 1 or more space into 1 space. Stops double or tripple spacing etc.
				newNote = newNote:gsub("^%s+", ""); -- Remove spaces from start of string.
				newNote = newNote:gsub("%s+$", ""); -- Remove spaces from the end of a string.
			end
			person.NewOfficerNote = newNote;
		end
		if (person.OldNote ~= person.NewNote or person.OldOfficerNote ~= person.NewOfficerNote) then
			table.insert(SGP.Settings.OldFiltersList, person);
			local noteAdd = "";
			local onoteAdd = "";
			if ( person.OldNote ~= person.NewNote ) then
				noteAdd = noteAdd .. " |cffFA06B8>|r Old Note: \"" .. person.OldNote .. "\" |cffFA06B8>|r New Note: \"" .. person.NewNote .. "\"";
			end
			if ( person.OldOfficerNote ~= person.NewOfficerNote ) then
				onoteAdd = onoteAdd .. " |cffFA06B8>|r Old Officer Note: \"" .. person.OldOfficerNote .. "\" |cffFA06B8>|r New Officer Note: \"" .. person.NewOfficerNote .. "\"";
			end
			SGPFrameStuff.LISTS["SGPGeneralConvertFiltersList"]:AddMessage("|c" .. SGP_GetClassColour(person.Class) .. person.Name .. "|r" .. noteAdd .. onoteAdd);
		end
	end
end

function SGP_GenerateRankFlagTooltip(rankName, ...)
	local output = ""
	
	local function outVal(val)
		if val ~= nil then
			return "|c" .. SGP_GetClassColour("HUNTER") .. "Yes|r";
		else
			return "|c" .. SGP_GetClassColour("DEATHKNIGHT") .. "No|r";
		end
	end
	local function goldLimitColour(val)
		if val > 0 then
			return "|c" .. SGP_GetClassColour("HUNTER") .. val .. "g|r";
		else
			return "|c" .. SGP_GetClassColour("DEATHKNIGHT") .. val .. "g|r";
		end
	end
	
	for i = 1, select("#", ...) do
		if i==1 then output = rankName; end
		output = output .. "\n|cffFFFFFF" .. _G["GUILDCONTROL_OPTION"..i] .. ":|r " .. outVal(select(i, ...)) .. "|cffFFFFFF.|r";
		if _G["GUILDCONTROL_OPTION"..i] == "Withdraw Gold" then
			output = output .. "\n|cffFFFFFF" .. "Withdraw/Repair Funds:|r " .. goldLimitColour(GetGuildBankWithdrawGoldLimit()) .. "|cffFFFFFF.|r";
		end
	end
	return output;
end

function SGP_ConvertOldFilters()
	local editPub, editOff = CanEditPublicNote(), CanEditOfficerNote();
	-- Partial note change warnings.
	if (editPub and not editOff) then
		SGP_ErrorEcho("You do not have the permissions to edit officer notes. Only public notes will be changed.");
	elseif (not editPub and editOff) then
		SGP_ErrorEcho("You do not have the permissions to edit public notes. Only officer notes will be changed.");
	end
	-- Get on with it.
	if (not editPub and not editOff) then
		SGP_ErrorEcho("You do not have the permissions to edit public or officer notes. No notes will be changed.");
	else
		SGP_ChatEcho("Converting old filters into new filters.");
		for i,v in pairs(SGP.Settings.OldFiltersList) do
			if editPub then
				GuildRosterSetPublicNote(v.Index, v.NewNote);
			end
			if editOff then
				GuildRosterSetOfficerNote(v.Index, v.NewOfficerNote);
			end
		end
	end
	ClearTable(SGP.Settings.OldFiltersList);
	SGPFrameStuff.LISTS["SGPGeneralConvertFiltersList"]:Clear();
end

function SGP_NameIndex(table, name)
	for i,v in pairs(table) do
		if( name == v.Name ) then
			return i;
		end
	end
	return nil;
end

function SGP_FirstWord(String)
	-- this should return just the first word of the words contained in String
	return string.match( String, "%w+" );
end

function SGP_MainName(name, note, officerNote)
	-- get the "main"'s name
	-- Note: For option 3, public note has preference over officer note
	local mainName = "";
	SGP_DebugEcho("SGP_MainName "..name..", note='"..note.."', onote='"..officerNote.."'");
	
	local filters = SGP_GetFilters(note, officerNote);
	
	if (SGP.Settings.AltMode ~= 1 and not filters.NAA) then
		if (SGP.Settings.AltNote == 1 or SGP.Settings.AltNote == 3) then
			mainName = SGP_FirstWord(note);
		end
		if (SGP.Settings.AltNote == 2 or (SGP.Settings.AltNote == 3 and (mainName == "" or mainName == nil))) then
			mainName = SGP_FirstWord(officerNote);
		end
	end
	-- fallback to character name
	if (mainName == "" or mainName == nil) then
		mainName = name;
	end
	return mainName;
end

function SGP_SettingsToString()
	local exportStrings = { };
	local exportString = "";
	local function addSetting(expString, addition)
		return (expString .. addition .. ";");
	end
	
	exportString = addSetting(exportString, "Exp0");
	exportString = addSetting(exportString, SGP.Settings.AltNote);
	exportString = addSetting(exportString, SGP.Settings.AltMode);
	exportString = addSetting(exportString, SGP.Settings.AltRank);
	exportString = addSetting(exportString, SGP.Settings.FilterPrefix);
	exportString = addSetting(exportString, SGP.Settings.FilterDNP);
	exportString = addSetting(exportString, SGP.Settings.FilterDNPText);
	exportString = addSetting(exportString, SGP.Settings.FilterDND);
	exportString = addSetting(exportString, SGP.Settings.FilterDNDText);
	exportString = addSetting(exportString, SGP.Settings.FilterDNL);
	exportString = addSetting(exportString, SGP.Settings.FilterDNLText);
	exportString = addSetting(exportString, SGP.Settings.FilterDNK);
	exportString = addSetting(exportString, SGP.Settings.FilterDNKText);
	exportString = addSetting(exportString, SGP.Settings.FilterNAA);
	exportString = addSetting(exportString, SGP.Settings.FilterNAAText);
	exportString = addSetting(exportString, SGP.Settings.ForceDefaultSettings);
	exportString = addSetting(exportString, SGP.Settings.GuildNumRanks);
	exportString = addSetting(exportString, SGP.Settings.InactiveDays);
	exportString = addSetting(exportString, SGP.Settings.InactiveRank);
	table.insert(exportStrings, exportString);
	
	exportString = "";
	exportString = addSetting(exportString, "Exp1");
	local IMO = 0;
	if ( SGP.Settings.InactiveMessageOn ) then
		IMO = 1;
	end
	exportString = addSetting(exportString, IMO);
	exportString = addSetting(exportString, SGP.Settings.InactiveMessage);
	exportString = addSetting(exportString, SGP.Settings.AutoType);
	exportString = addSetting(exportString, SGP.Settings.AutoMode);
	table.insert(exportStrings, exportString);
	
	for i,v in pairs(SGP.Settings.GuildRanks) do
		local AT = 0;
		if ( v.Attainable ) then
			AT = 1;
		end
		local AP = 0;
		if ( v.AllowPromote ) then
			AP = 1;
		end
		local AD = 0;
		if ( v.AllowDemote ) then
			AD = 1;
		end
		exportString = "";
		exportString = addSetting(exportString, "Exp" .. v.RankIndex+1);
		exportString = addSetting(exportString, v.RankIndex .. ";" ..
												v.RankName .. ";" ..
												AT .. ";" ..
												AP .. ";" ..
												AD .. ";" ..
												v.TimeInGuild .. ";" ..
												v.TimeOffline .. ";" ..
												v.Level .. ";" ..
												v.Achievement .. ";" ..
												v.Reputation);
		table.insert(exportStrings, exportString);
	end
	
	for i,v in pairs(SGP.Settings.MemberJoinTimes) do
		exportString = "";
		exportString = addSetting(exportString, "Exp" .. table.getn(SGP.Settings.GuildRanks)+1+i);
		exportString = addSetting(exportString, v.Name);
		exportString = addSetting(exportString, v.Year);
		exportString = addSetting(exportString, v.Month);
		exportString = addSetting(exportString, v.Day);
		exportString = addSetting(exportString, v.Hour);
		exportString = addSetting(exportString, v.Minute);
		exportString = addSetting(exportString, v.Second);
		table.insert(exportStrings, exportString);
	end
	
	return exportStrings;
end

function SGP_StringToSettings(str)
	local function cutLastCharOffWord(wrd)
		return string.sub(wrd, 1, -2);
	end

	local words = { };
	for word in string.gmatch(str, "[%w%s%!%^%@%>%<]+;") do
		table.insert(words, cutLastCharOffWord(word));
	end

	local name = "";
	local tempMemJoinTimes = SGP.Settings.MemberJoinTimes;
	
	local num;
	for i,v in pairs(words) do
		if i == 1 then
			num = tonumber(string.sub(v, 4));
		end
		if num ~= nil then
			-- If we're the first string.
			if num == 0 then
				if     i ==  2 then SGP.Settings.AltNote = tonumber(v);
				elseif i ==  3 then SGP.Settings.AltMode = tonumber(v);
				elseif i ==  4 then SGP.Settings.AltRank = tonumber(v);
				elseif i ==  5 then SGP.Settings.FilterPrefix = v;
				elseif i ==  6 then SGP.Settings.FilterDNP = tonumber(v);
				elseif i ==  7 then SGP.Settings.FilterDNPText = v;
				elseif i ==  8 then SGP.Settings.FilterDND = tonumber(v);
				elseif i ==  9 then SGP.Settings.FilterDNDText = v;
				elseif i == 10 then SGP.Settings.FilterDNL = tonumber(v);
				elseif i == 11 then SGP.Settings.FilterDNLText = v;
				elseif i == 12 then SGP.Settings.FilterDNK = tonumber(v);
				elseif i == 13 then SGP.Settings.FilterDNKText = v;
				elseif i == 14 then SGP.Settings.FilterNAA = tonumber(v);
				elseif i == 15 then SGP.Settings.FilterNAAText = v;
				elseif i == 16 then SGP.Settings.ForceDefaultSettings = tonumber(v);
				elseif i == 17 then SGP.Settings.GuildNumRanks = tonumber(v);
				elseif i == 18 then SGP.Settings.InactiveDays = tonumber(v);
				elseif i == 19 then SGP.Settings.InactiveRank = tonumber(v);
				end
			-- Second String....
			elseif num == 1 then
				if	   i ==  2 then
					if tonumber(v) == 1 then SGP.Settings.InactiveMessageOn = true;
					else SGP.Settings.InactiveMessageOn = false;
					end
				elseif i ==  3 then SGP.Settings.InactiveMessage = v;
				elseif i ==  4 then SGP.Settings.AutoType = tonumber(v);
				elseif i ==  5 then SGP.Settings.AutoMode = tonumber(v);
				end
			-- Guild Rank Strings....
			elseif ( num > 1 and num <= table.getn(SGP.Settings.GuildRanks)+1 ) then
				local realnum = num - 1; -- Because we increased it by 1 during the export.
				if     i ==  2 then SGP.Settings.GuildRanks[realnum].RankIndex = tonumber(v);
				elseif i ==  3 then SGP.Settings.GuildRanks[realnum].RankName = v;
				elseif i ==  4 then
					if tonumber(v) == 1 then SGP.Settings.GuildRanks[realnum].Attainable = true;
					else SGP.Settings.GuildRanks[realnum].Attainable = false;
					end
				elseif i ==  5 then
					if tonumber(v) == 1 then SGP.Settings.GuildRanks[realnum].AllowPromote = true;
					else SGP.Settings.GuildRanks[realnum].AllowPromote = false;
					end
				elseif i ==  6 then
					if tonumber(v) == 1 then SGP.Settings.GuildRanks[realnum].AllowDemote = true;
					else SGP.Settings.GuildRanks[realnum].AllowDemote = false;
					end
				elseif i ==  7 then SGP.Settings.GuildRanks[realnum].TimeInGuild = tonumber(v);
				elseif i ==  8 then SGP.Settings.GuildRanks[realnum].TimeOffline = tonumber(v);
				elseif i ==  9 then SGP.Settings.GuildRanks[realnum].Level = tonumber(v);
				elseif i == 10 then SGP.Settings.GuildRanks[realnum].Achievement = tonumber(v);
				elseif i == 11 then SGP.Settings.GuildRanks[realnum].Reputation = tonumber(v);
				end
			elseif ( num > table.getn(SGP.Settings.GuildRanks)+1 ) then
				if i == 2 then
					name = v;
				end
				for k,w in pairs(tempMemJoinTimes) do
					if w.Name == name then
						if     i == 3 then w.Year = v;
						elseif i == 4 then w.Month = v;
						elseif i == 3 then t.Year = v;
						elseif i == 4 then t.Month = v;
						elseif i == 5 then t.Day = v;
						elseif i == 6 then t.Hour = v;
						elseif i == 7 then t.Minute = v;
						elseif i == 8 then t.Second = v;
						end
					end
				end
			end
		end
	end
end

function SGP_AddEvent(eventName, eventTime, eventCode)
	SGP_DebugEcho("Adding Event: " .. eventName .. ". Duration: " .. eventTime .. ".");
	if ( eventName == "SGP_AutomateLogin" ) then
		SGP.AutomatedTimer = C_Timer.After(eventTime, eventCode);
	elseif ( eventName == "SGP_AutomateTimer" ) then
		SGP.AutomatedRepeater = C_Timer.NewTicker(eventTime, eventCode, 999);
	elseif ( eventName == "SGP_KickMessage" ) then
		SGP.KickTimer = C_Timer.After(eventTime, eventCode);
	end
	SGP_DebugEcho("Finished Adding Event: " .. eventName .. ".");
end

--[[ STUFF THAT ACTUALLY DOES STUFF ]]--
function SGP_Find()
	SGP_ClearLists("All");
	if ( not SGP.Settings.ReloadLockdown ) then
		SGP_DebugEcho("Finding people to promote or demote.");
		
		-- Up to date Guild Member Lists. One with everyone, one with only people with notes (smaller list so I can find alt's).
		local Members = { };
		local MembersTally = { };
		for i=1, GetNumGuildMembers() do
			local name, rank, rankIndex, level, class, zone, note, 
				  officerNote, online, status, classFileName, 
				  achievementPoints, achievementRank, isMobile, canSoR, repStanding = GetGuildRosterInfo(i);
			local yearsOff, monthsOff, daysOff, hoursOff = GetGuildRosterLastOnline(i);
			yearsOff = yearsOff and yearsOff or 0;
			monthsOff = monthsOff and monthsOff or 0;
			daysOff = daysOff and daysOff or 0;
			hoursOff = hoursOff and hoursOff or 0;
			if (online) then
				yearsOff = 0;
				monthsOff = 0;
				daysOff = 0;
				hoursOff = 0;
			end
			local currentTime = time();
			-- Time Offline calculations...
			local timeOff;
			timeOff = time{year=tonumber(date("%Y"))-yearsOff, month=tonumber(date("%m"))-monthsOff, day=tonumber(date("%d"))-daysOff, hour=tonumber(date("%H"))-hoursOff};
			timeOff = SGP_CalculateTimeDifference(timeOff, currentTime);
			-- TimeInGuild calculations.
			local timeInGuild;
			for i,v in pairs(SGP.Settings.MemberJoinTimes) do
				if ( v.Name == name ) then
					timeInGuild = v;
				end
			end
			if ( timeInGuild ~= nil and type(timeInGuild) == "table" ) then
				timeInGuild = time{year=timeInGuild.Year, month=timeInGuild.Month, day=timeInGuild.Day, hour=timeInGuild.Hour, min=timeInGuild.Minute, sec=timeInGuild.Second};
			else
				timeInGuild = currentTime;
			end
			timeInGuild = SGP_CalculateTimeDifference(timeInGuild, currentTime);
			local member = {
						Name = name;
						Class = class;
						ClassFileName = classFileName;
						Index = i;
						Rank = rank;
						RankIndex = rankIndex+1; -- rankIndex is 0 based index. GuildControlGetRankName is 1 based index. So add 1 to compensate.
						TimeInGuild = timeInGuild;
						TimeOffline = timeOff;
						Level = level;
						Achievement = achievementPoints;
						Reputation = repStanding;
						Note = note;
						OfficerNote = officerNote;
						NewRankIndex = rankIndex+1;
					};
			table.insert(Members, member);
			
			-- find "main" in MemberSums - add it if needed
		
			local nameTally = SGP_MainName(name, note, officerNote);
			
			local memberTally = {
						Name = nameTally;
						TimeInGuild = 0;
						TimeOffline = -1;
						Level = 0;
						Achievement = 0;
						Reputation = 4;
					};
			
			mainIndex = SGP_NameIndex(MembersTally, nameTally);
				
			if mainIndex == nil then
				table.insert(MembersTally, memberTally);
				mainIndex = table.getn( MembersTally );
			end

			MembersTally[mainIndex].Name = nameTally;
			if ( SGP.Settings.AltMode == 3 ) then
				-- Combined Highest
				if ( MembersTally[mainIndex].TimeInGuild < timeInGuild ) then
					MembersTally[mainIndex].TimeInGuild = timeInGuild;
				end
				if ( MembersTally[mainIndex].TimeOffline < 0 or MembersTally[mainIndex].TimeOffline > timeOff ) then
					MembersTally[mainIndex].TimeOffline = timeOff;
				end
				if ( MembersTally[mainIndex].Level < level ) then
					MembersTally[mainIndex].Level = level;
				end
				if ( MembersTally[mainIndex].Achievement < achievementPoints ) then
					MembersTally[mainIndex].Achievement = achievementPoints;
				end
				if ( MembersTally[mainIndex].Reputation < repStanding ) then
					MembersTally[mainIndex].Reputation = repStanding;
				end
			else
				MembersTally[mainIndex].TimeInGuild = timeInGuild;
				MembersTally[mainIndex].TimeOffline = timeOff;
				MembersTally[mainIndex].Level = level;
				MembersTally[mainIndex].Achievement = achievementPoints;
				MembersTally[mainIndex].Reputation = repStanding;
			end
		end
		SGP.Settings.MemberList = Members;
		SGP.Settings.MemberTallyList = MembersTally;
		
		SGP_CalculateRankChanges(Members,MembersTally);
		
		SGPFrameStuff.BUTTONTEXTS["UIPromoteButton"]:SetText(SGPLocal.UIPromoteButton .. ": " .. table.getn(SGP.PromoteList));
		SGPFrameStuff.BUTTONTEXTS["UIDemoteButton"]:SetText(SGPLocal.UIDemoteButton .. ": " .. table.getn(SGP.DemoteList));
		
		SGP_ShowLists();
	else
		StaticPopup_Show("SGP_ReloadLockdown");
	end
end

function SGP_CalculateRankChanges(MemberList,MemberTallyList)
	local PlayerGuildName, PlayerGuildRankName, PlayerGuildRankIndex = GetGuildInfo("player");
	PlayerGuildRankIndex = PlayerGuildRankIndex + 1; -- PlayerGuildRankIndex is 0 based index. GuildControlGetRankName is 1 based index. So add one to compensate.
	
	local Alts = { };
	
	-- Cycle through everyone.
	for i,v in pairs(MemberList) do
		-- Ignore if their rank is greater than or equal to the player's rank - because we wouldn't be able to mod their rank even if we wanted to.
		if (v.RankIndex > PlayerGuildRankIndex) then
			-- Check if Alt Contribution is on.
			local mainName = SGP_MainName(v.Name, v.Note, v.OfficerNote);
			local mainIndex = SGP_NameIndex(MemberTallyList, mainName);
			local Level = 0;
			local TimeInGuild = 0;
			local TimeOffline = 0;
			local Achievement = 0;
			local Reputation = 4;
			if (mainIndex ~= nil) then
				if( mainIndex <= table.getn( MemberTallyList )) then
					Level = MemberTallyList[mainIndex].Level;
					TimeInGuild = MemberTallyList[mainIndex].TimeInGuild;
					TimeOffline = MemberTallyList[mainIndex].TimeOffline;
					Achievement = MemberTallyList[mainIndex].Achievement;
					Reputation = MemberTallyList[mainIndex].Reputation;
				end
			end
			local CurrentRankIndex = v.RankIndex;
			
			-- Find out the New Rank Index to work out whether this person should be promoted, demoted or nothing.
			local NewRankIndex = SGP_RankModifierCalculator(CurrentRankIndex, TimeInGuild, TimeOffline, Level, Achievement, Reputation);
			
			if (v.Name ~= mainName and SGP.Settings.AltMode == 2) then
				NewRankIndex = SGP.Settings.AltRank+1; -- Add 1 because the AltRank list doesn't contain the GM.
			end
				
			v.NewRankIndex = NewRankIndex;
			local filters = SGP_GetFilters(v.Note, v.OfficerNote);
			
			if (NewRankIndex > CurrentRankIndex and SGP.Settings.GuildRanks[CurrentRankIndex].AllowDemote and not filters.DND) then
				-- Demote
				table.insert(SGP.DemoteList, v);
			elseif (NewRankIndex < CurrentRankIndex and SGP.Settings.GuildRanks[CurrentRankIndex].AllowPromote and not filters.DNP) then
				-- Promote
				table.insert(SGP.PromoteList, v);
			end
		end
	end
end

function SGP_RankModifierCalculator(CurrIndex, TimeInGuild, TimeOffline, Level, Achievement, Reputation)
	local PlayerGuildName, PlayerGuildRankName, PlayerGuildRankIndex = GetGuildInfo("player");
	PlayerGuildRankIndex = PlayerGuildRankIndex + 1; -- PlayerGuildRankIndex is 0 based index. GuildControlGetRankName is 1 based index. So add one to compensate.
	
	-- Because Blizzard are stupid, some people have -1 Achievement points. Lets assume that's 0.
	if (Achievement < 0) then
		Achievement = 0;
	end
	
	for i=(PlayerGuildRankIndex+1),SGP.Settings.GuildNumRanks do
		local CurrTimeInGuildMin = SGP.Settings.GuildRanks[i].TimeInGuild;
		local CurrTimeOfflineMax = SGP.Settings.GuildRanks[i].TimeOffline;
		local CurrLevelMin = SGP.Settings.GuildRanks[i].Level;
		local CurrAchievementMin = SGP.Settings.GuildRanks[i].Achievement;
		local CurrReputationMin = SGP.Settings.GuildRanks[i].Reputation;
		-- If the rank is attainable and we have the required values.
		if (SGP.Settings.GuildRanks[i].Attainable and TimeInGuild >= CurrTimeInGuildMin and TimeOffline <= CurrTimeOfflineMax and Level >= CurrLevelMin and Achievement >= CurrAchievementMin and Reputation >= CurrReputationMin) then
			local NewRankIndex = i;
			return NewRankIndex;
		end
	end
	-- If we're here then we either cannot change this person's rank, or something went the hell wrong. Assume they stay the same rank.
	return CurrIndex;
end

function SGP_CalculateTimeDifference(date1, date2)
	local d1, d2;
	if ( type(d1) == "table" ) then
		d1 = time{year=date1.Year, month=date1.Month, day=date1.Day, hour=date1.Hour, min=date1.Minute, sec=date1.Second};
	else
		d1 = date1;
	end
	if ( type(d2) == "table" ) then
		local d2 = time{year=date2.Year, month=date2.Month, day=date2.Day, hour=date2.Hour, min=date2.Minute, sec=date2.Second};
	else
		d2 = date2;
	end
	local difference = difftime(d2, d1);
	local diffInDays = difference / 86400; -- 60*60*24 (seconds into days).
	return diffInDays;
end

function SGP_Export()
	if ( not SGP.Settings.ReloadLockdown ) then
		ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["ExportButton1"]);
		local exportMode = SGPFrameStuff.DROPDOWNS["ExportButton1"]:GetSelectedID();
		ToggleDropDownMenu(1, nil, SGPFrameStuff.DROPDOWNS["ExportButton1"]);
		
		local exportName = SGPFrameStuff.EDITBOXES["ExportEditbox"]:GetText();
		
		local stringsToExport = SGP_SettingsToString();
		
		local startExport = "START_EXPORT " .. SGP.VersionNumber .. " " .. SGP.Settings.GuildName;
		local endExport = "END_EXPORT";
		
		if (exportMode == 1) then
			SendAddonMessage("SGP", startExport, "GUILD");
			for i,v in pairs(stringsToExport) do
				SendAddonMessage("SGP", v, "GUILD");
			end
			SendAddonMessage("SGP", endExport, "GUILD");
		elseif (exportMode == 2) then
			if UnitName("target") ~= nil and UnitName("target") ~= "" then
				SendAddonMessage("SGP", startExport, "WHISPER", UnitName("target"));
				for i,v in pairs(stringsToExport) do
					SendAddonMessage("SGP", v, "WHISPER", UnitName("target"));
				end
				SendAddonMessage("SGP", endExport, "WHISPER", UnitName("target"));
			else
				SGP_ErrorEcho("Cannot export settings due to having no target.");
			end
		elseif (exportMode == 3) then
			if (exportName ~= nil and exportName ~= "") then
				SendAddonMessage("SGP", startExport, "WHISPER", exportName);
				for i,v in pairs(stringsToExport) do
					SendAddonMessage("SGP", v, "WHISPER", exportName);
				end
				SendAddonMessage("SGP", endExport, "WHISPER", exportName);
			else
				SGP_ErrorEcho("Cannot export settings due to having nobody to whisper.");
			end
		end
	else
		StaticPopup_Show("SGP_ReloadLockdown");
	end
end

function SGP_Promote()
	if ( not SGP.Settings.ReloadLockdown ) then
		if ( not CanGuildPromote() ) then
			SGP_ErrorEcho("Failed to promote. You do not have the permissions to do that.");
		else
			SGP_ChatEcho("Promoting all under-ranked members.");
			for i,v in pairs(SGP.PromoteList) do
				SetGuildMemberRank(v.Index, v.NewRankIndex);
			end
			SGP_ClearLists("Promote");
			SGPFrameStuff.BUTTONTEXTS["UIPromoteButton"]:SetText(SGPLocal.UIPromoteButton .. ": 0");
		end
	else
		StaticPopup_Show("SGP_ReloadLockdown");
	end
end

function SGP_Demote()
	if ( not SGP.Settings.ReloadLockdown ) then
		if ( not CanGuildDemote() ) then
			SGP_ErrorEcho("Failed to demote. You do not have the permissions to do that.");
		else
			SGP_ChatEcho("Demoting all over-ranked members.");
			for i,v in pairs(SGP.DemoteList) do
				SetGuildMemberRank(v.Index, v.NewRankIndex);
			end
			SGP_ClearLists("Demote");
			SGPFrameStuff.BUTTONTEXTS["UIDemoteButton"]:SetText(SGPLocal.UIDemoteButton .. ": 0");
		end
	else
		StaticPopup_Show("SGP_ReloadLockdown");
	end
end

function SGP_KickFind()
	SGP_ClearLists("Kick");
	local _, _, PlayerGuildRankIndex = GetGuildInfo("player");
	local rn = string.gsub(GetRealmName(), " ", "");
	
	for i=1,GetNumGuildMembers() do
		local years, months, days = GetGuildRosterLastOnline(i);
		years, months, days = years and years or 0, months and months or 0, days and days or 0;
		doff = (((years*12)+months)*30.5)+days;
		if (doff >= SGP.Settings.InactiveDays) then
			local name, rank, rankIndex, _, _, _, Note, OfficerNote, _, _, classFileName = GetGuildRosterInfo(i)
			local person = {
				Name = name;
				Rank = rank;
				Class = classFileName;
				DaysOff = doff;
			}
			local filters = SGP_GetFilters(Note, OfficerNote);
			if ( not filters.DNK and PlayerGuildRankIndex < rankIndex and SGP.Settings.InactiveRank <= rankIndex) then
				-- If they're a lower rank than the player, add them. (Both are 0 index, so no need to add 1)
				-- Also, if they're an equal or lower rank than the inactive rank limit. (Note that the Dropdown doesn't include the GM, so acts like a 0 index, even though it isn't)
				table.insert(SGP.Settings.InactiveList, person);
			end
		end
	end
	
	if (table.getn(SGP.Settings.InactiveList) > 0) then
		for i,v in pairs(SGP.Settings.InactiveList) do
			local n = string.gsub(v.Name, "-"..rn, "");
			SGPFrameStuff.LISTS["SGPListFrameKick"]:AddMessage("|c" .. SGP_GetClassColour(v.Class) .. n .. "|r " .. v.Rank .. "|r |cffFA06B8>|r |cffFFFFFF" .. v.DaysOff .. " Days.|r");
		end
	end
end

function SGP_KickKick()
	if ( not CanGuildRemove() ) then
		SGP_ErrorEcho("Failed to remove. You do not have the permissions to kick people.");
	else
		SGP_ChatEcho("Removing all inactive members from the guild.");
		if (table.getn(SGP.Settings.InactiveList) > 0) then
			for i,v in pairs(SGP.Settings.InactiveList) do
				GuildUninvite(v.Name);
			end
			if ( SGP.Settings.InactiveMessageOn ) then
				SGP_AddEvent("SGP_KickMessage", 2, function() SendChatMessage(SGP.Settings.InactiveMessage, "GUILD"); end)
			end
		end
	end
	SGP_ClearLists("Kick");
end

function SGP_MemJoinDateGet()
	local name = SGPFrameStuff.EDITBOXES["MemJoinDateNameEditbox"]:GetText();
	for i,v in pairs(SGP.Settings.MemberJoinTimes) do
		local realmName = string.gsub(GetRealmName(), " ", "");
		local n = string.gsub(v.Name, "%-"..realmName, "");
		if (n == name or v.Name == name) then
			SGPFrameStuff.EDITBOXES["MemJoinDateDayEditbox"]:SetText(v.Day);
			SGPFrameStuff.EDITBOXES["MemJoinDateMonthEditbox"]:SetText(v.Month);
			SGPFrameStuff.EDITBOXES["MemJoinDateYearEditbox"]:SetText(v.Year);
			return
		end
	end
	StaticPopup_Show("SGP_MemJoinDateInvalidName");
end

function SGP_MemJoinDateSet()
	local name = SGPFrameStuff.EDITBOXES["MemJoinDateNameEditbox"]:GetText();
	local tempMemJoinTimes = SGP.Settings.MemberJoinTimes;
	for i,v in pairs(tempMemJoinTimes) do
		local realmName = string.gsub(GetRealmName(), " ", "");
		local n = string.gsub(v.Name, "%-"..realmName, "");
		if (n == name or v.Name == name) then
			tempMemJoinTimes[i].Day = SGPFrameStuff.EDITBOXES["MemJoinDateDayEditbox"]:GetText();
			tempMemJoinTimes[i].Month = SGPFrameStuff.EDITBOXES["MemJoinDateMonthEditbox"]:GetText();
			tempMemJoinTimes[i].Year = SGPFrameStuff.EDITBOXES["MemJoinDateYearEditbox"]:GetText();
			SGP.Settings.MemberJoinTimes = tempMemJoinTimes;
			StaticPopup_Show("SGP_MemJoinDateSuccess");
			return
		end
	end
	StaticPopup_Show("SGP_MemJoinDateInvalidName");
end

function SGP_UpdateMemJoinDateList()
	SGP_DebugEcho("Updating MemJoinDate List.");
	SGPFrameStuff.LISTS["SGPListFrameMemJoinDate"]:Clear();
	local tempMemJoinTimes = SGP.Settings.MemberJoinTimes;
	
	local sortFunc = function(a, b) return a.Name > b.Name; end
	table.sort(tempMemJoinTimes, sortFunc);
	
	-- MemberList won't always be populated, so use own.
	for i,v in pairs(tempMemJoinTimes) do
		local ClassFileName = "";
		for k=1, GetNumGuildMembers() do
			local name, _, _, _, _, _, _, _, _, _, classFileName = GetGuildRosterInfo(k);
			if ( name == v.Name) then
				ClassFileName = classFileName;
			end
		end
		local realmName = string.gsub(GetRealmName(), " ", "");
		local n = string.gsub(v.Name, "%-"..realmName, "");
		SGPFrameStuff.LISTS["SGPListFrameMemJoinDate"]:AddMessage("|c" .. SGP_GetClassColour(ClassFileName) .. n .. "|r |c" .. SGP_GetClassColour(ClassFileName) .. v.Day .. "|r.|c" .. SGP_GetClassColour(ClassFileName) .. v.Month .. "|r.|c" .. SGP_GetClassColour(ClassFileName) .. v.Year .. "|r");
	end
end