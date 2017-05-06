
SGPLocal = {
	-- General Stuff
	SGPShort = "Swyn's GuildPromoter";
	SGPLong = "Swyn's Guild Promoter";
	GuildPromoter = "Guild Promoter";
	
	-- Main Stuff
	MainGeneralText = "General Settings Tab:";
	MainGeneralDescription = "In this tab you'll find general settings that don't really fit anywhere\n" ..
							 "else and they should be fairly intuitive.";
	MainRanksText = "Rank Settings Tab:";
	MainRanksDescription = "In this tab you'll be able to change which ranks this mod manages.\n\n" ..
						   "If a rank is set to attainable, any person being promoted or demoted will have\n" ..
						   "their attributes checked against the rank's settings. A person must pass every\n" ..
						   "one of the rank's settings in order to become that rank.\n\n" ..
						   "In order for someone of a rank to be liable for promotes or demotes, you must\n" ..
						   "check the Allow Promotes or Allow Demotes checkboxes.";
	MainAltsText = "Alt Settings Tab:";
	MainAltsDescription = "In this tab you'll be able to change how this mod deals with alts.\n\n" ..
						  "An alt is either someone who has their main's name or an arbitrary name\n" ..
						  "in whichever note you've chosen the mod to look in.\n\n" ..
						  "The name must be the first word in the note and if you choose to use\n" ..
						  "an arbitrary name, all of that person's characters must have the same\n" ..
						  "arbitrary name. e.g. Jane, even if none of the characters are called Jane.";
	MainFiltersText = "Filter Settings Tab:";
	MainFiltersDescription = "In this tab you'll be able to customise how the mod manages filters.\n\n" ..
							 "A filter will allow someone to be ignored by a certain feature of the addon.\n\n" ..
							 "You filter someone by first putting the prefix text (default !) and follow it\n" ..
							 "with the filter text. For example '!d' will stop someone from from being\n"..
							 "automatically demoted by the addon.\n\n" ..
							 "Using this new method you can combine filters into one word.\n" ..
							 "For example, if you wish to filter someone from promotes, the UI lists and kicks\n" ..
							 "you would put '!plk' in their respective note.\n\n" ..
							 "Please note that the filters have to be seperated from other words by spaces\n" ..
							 "otherwise they won't be recognised.";
	MainAutoText = "Automation Tab:";
	MainAutoDescription = "In this tab you'll be able to let the addon automate the promotion or demotion of\n" ..
						  "guild members.\n\n" ..
						  "You can choose from either never, on login, or at timed intervals, and whether you\n" ..
						  "want to promote, demote, or do both during the automation.";
	MainMemJoinDateText = "Member Join Dates Tab:";
	MainMemJoinDateDescription = "In this tab you'll be able to view and modify the join date for every member within the guild.\n\n" ..
								 "Just type in the member's name and use the 'Get' or 'Set' buttons to view or change their date.\n" ..
								 "There is also a list that you can use to view all members.";
	MainExportText = "Export Tab:";
	MainExportDescription = "In this tab you'll be able to export your settings to other people.\n\n" ..
							"This allows the GM and officers to promote knowing they have the same settings.";
	MainKickText = "Guild Remove Tab:";
	MainKickDescription = "In this tab you'll be able to kick people from the guild based on their time offline.\n\n" ..
						  "You can set the highest rank to be checked for inactives so you can save some higher\n" ..
						  "ranked people if you wish.";
					
	-- General Stuff
	GeneralPanelName = "General Settings";
	GeneralManagementHeader = "General Settings:";
	GeneralScaleText = "UI Scale:";
	GeneralScaleDescription = "Set the scale percentage of the SGP user interface.";
	GeneralScaleItems = {50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150};

	-- Rank Stuff
	RanksPanelName = "Rank Settings";
	RankManagementHeader = "Rank Settings:";
	AttainableText = "Attainable?";
	AttainableTooltip = "Allows people to be promoted or demoted to this rank if they meet the requirements.\n\nTurning this off means people cannot become this rank automatically.";
	AllowPromoteText = "Allow Promotes?";
	AllowPromoteTooltip = "Allows people on this rank to be promoted if they meet the requirements of a higher rank.\n\nTurning this off means people on this rank cannot be promoted.";
	AllowDemoteText = "Allow Demotes?";
	AllowDemoteTooltip = "Allows people on this rank to be demoted if they no longer meet the requirements of this rank.\n\nTurning this off means people on this rank cannot be demoted.";
	
	Minimum = "Minimum";
	Maximum = "Maximum";
	TimeInGuild = "Time In Guild (days):";
	TimeOffline = "Time Offline (days):";
	Level = "Level:";
	Achievement = "Achievement Points:";
	Reputation = "Guild Reputation:";
	
	-- Alt Stuff

	AltsPanelName = "Alt Settings";
	AltManagementHeader = "Alt Settings:";
	
	AltNoteText = "Main Name Location:";
	AltNoteDescription = "Where to look for the main's name to determine if a character is an alt?";
	AltNoteButtonItems = {"Public Note", "Officer Note", "Public and Officer Notes"};
	AltNoteButtonTooltips = {"Will only search in the Public note when looking for the main's name.",
							 "Will only search in the Officer note when looking for the main's name.",
							 "Will search in both the Public and Officer notes when looking for the main's name.\n\nNote that the name only needs to be in one of the notes to be found."};
	
	AltModeText = "Alt Mode:";
	AltModeDescription = "Choose how this mod deals with alts.";
	
	AltModeButtonItems = {"Individual", "Alt Rank", "Combined Best"};
	AltModeButtonTooltips = {"Alts will be promoted based on their own values.\n\nNote that this will ignore the Public and Officer notes of all guild members.", -- Individual Tooltip
							 "Alts will be moved to the designated Alt Rank.", -- Alt Rank Tooltip
							 "Alts and their Main will have their rank based on the best of each\nvalue among all their characters.\n\nNote that it may use the highest Level from one character, the\nhighest Reputation from another and the lowest Time Offline from another."}; -- Combined Best

	-- Filter Stuff
	
	FiltersPanelName = "Filter Settings";
	FilterManagementHeader = "Filter Settings:";
	
	FilterPrefixText = "Filter Prefix:";
	FilterPrefixDescription = "The filter prefix is what you put before the filter block.\nPlease see the Filter Settings Tab information in the main settings window for more details.";
	FilterPrefixButtonItems = {"!", "^", "@", ">", "<"};
	FilterDoNotPromoteText = "Do Not Promote:";
	FilterDoNotPromoteDescription = "Choose whether to use this filter, and if so, where to look for it. Then choose what text to look for.\nIf this filter is on and found in a person's note, they will not be promoted.\n\nBe aware that it is case sensitive.";
	FilterDoNotPromoteButtonItems = {"Don't use this Filter", "Public Note", "Officer Note", "Public and Officer Notes"};
	FilterDoNotPromoteButtonTooltips = {"Will not search anybody for this filter.",
										"Will only search in the Public note when looking for the filter text.",
										"Will only search in the Officer note when looking for the filter text.",
										"Will search in both the Public and Officer note when looking for the filter text.\n\nNote that the text only needs to be in one of the notes to be found."};
	FilterDoNotDemoteText = "Do Not Demote:";
	FilterDoNotDemoteDescription = "Choose whether to use this filter, and if so, where to look for it. Then choose what text to look for.\nIf this filter is on and found in a person's note, they will not be demoted.\n\nBe aware that it is case sensitive.";
	FilterDoNotDemoteButtonItems = {"Don't use this Filter", "Public Note", "Officer Note", "Public and Officer Notes"};
	FilterDoNotDemoteButtonTooltips = {"Will not search anybody for this filter.",
									   "Will only search in the Public note when looking for the filter text.",
									   "Will only search in the Officer note when looking for the filter text.",
									   "Will search in both the Public and Officer notes when looking for the filter text.\n\nNote that the text only needs to be in one of the notes to be found."};
	FilterDoNotListText = "Do Not List:";
	FilterDoNotListDescription = "Choose whether to use this filter, and if so, where to look for it. Then choose what text to look for.\nIf this filter is on and found in a person's note, they will not be listed even if they are eligible for\npromotions or demotions.\nGood for hiding people without authenticators.\n\nBe aware that it is case sensitive.";
	FilterDoNotListButtonItems = {"Don't use this Filter", "Public Note", "Officer Note", "Public and Officer Notes"};
	FilterDoNotListButtonTooltips = {"Will not search anybody for this filter.",
									 "Will only search in the Public note when looking for the filter text.",
									 "Will only search in the Officer note when looking for the filter text.",
									 "Will search in both the Public and Officer notes when looking for the filter text.\n\nNote that the text only needs to be in one of the notes to be found."};
	FilterDoNotKickText = "Do Not Kick:";
	FilterDoNotKickDescription = "Choose whether to use this filter, and if so, where to look for it. Then choose what text to look for.\nIf this filter is on and found in a person's note, they will not be kicked by the Guild Removal feature\neven if they are considered inactive.\nUseful for people who've gone on holiday, but you want to keep in the guild.\n\nBe aware that it is case sensitive.";
	FilterDoNotKickButtonItems = {"Don't use this Filter", "Public Note", "Officer Note", "Public and Officer Notes"};
	FilterDoNotKickButtonTooltips = {"Will not search anybody for this filter.",
									 "Will only search in the Public note when looking for the filter text.",
									 "Will only search in the Officer note when looking for the filter text.",
									 "Will search in both the Public and Officer notes when looking for the filter text.\n\nNote that the text only needs to be in one of the notes to be found."};
	FilterNotAnAltText = "Not an Alt:";
	FilterNotAnAltDescription = "Choose whether to use this filter, and if so, where to look for it. Then choose what text to look for.\nIf this filter is on and found in a person's note, they will not be considered an alt, regardless of\nwhat is in their notes.\nGood for when this addon mistakenly thinks someone is an alt due to text in one of their notes.\n\nBe aware that it is case sensitive.";
	FilterNotAnAltButtonItems = {"Don't use this Filter", "Public Note", "Officer Note", "Public and Officer Notes"};
	FilterNotAnAltButtonTooltips = {"Will not search anybody for this filter.",
									 "Will only search in the Public note when looking for the filter text.",
									 "Will only search in the Officer note when looking for the filter text.",
									 "Will search in both the Public and Officer notes when looking for the filter text.\n\nNote that the text only needs to be in one of the notes to be found."};
	FilterListsText = "Filter Lists:";
	FilterListsDescription = "These lists simply show you which of your guild members are currently being filtered.";
	FilterListsUpdateButton = "Update Lists";
	
	-- Auto Stuff

	AutoPanelName = "Automation";
	AutoManagementHeader = "Automation Settings:";
	
	AutoTypeText = "When to Automate:";
	AutoTypeDescription = "When would you like automation to occur?\n\n" .. 
						  "Please be aware that turning off automation or changing what gets automated won't take effect\nuntil after a reload or logout.";
	AutoTypeButtonItems = {"Never", "Login", "Every 15 Minutes", "Every 30 Minutes", "Every Hour"};
	AutoTypeButtonTooltips = {"Will never automate.",
							 "Will only automatically just after you log in.",
							 "Will automate every 15 minutes.",
							 "Will automate every 30 minutes.",
							 "Will automate every hour."};
	
	AutoModeText = "What to Automate:";
	AutoModeDescription = "What do you want to be automated?";
	
	AutoModeButtonItems = {"Promote Only", "Demote Only", "Promote and Demote"};
	AutoModeButtonTooltips = {"Automation will only promote people.",
							 "Automation will only demote people.",
							 "Automation will both promote and demote people."};
							 
	-- MemJoinDate Stuff
	
	MemJoinDatePanelName = "Member Join Dates";
	MemJoinDateManagementHeader = "Member Join Dates:";
	
	MemJoinDateChangeText = "Change a Date:";
	MemJoinDateChangeDescription = "Type in the name of a player whose date you wish to change, fill in the new date and click 'Set'.\n\n" ..
								   "Use 'Get' to find a specific player's join date.";
	MemJoinDateNameText = "Name:";
	MemJoinDateDateText = "Date:";
	MemJoinDateDayText = "DD";
	MemJoinDateMonthText = "MM";
	MemJoinDateYearText = "YYYY";
	MemJoinDateGetButtonText = "Get";
	MemJoinDateSetButtonText = "Set";
	
	MemJoinDateListText = "All Members:";
	MemJoinDateListButtonText = "Refresh";
	
	-- Export Stuff
	ExportPanelName = "Export";
	ExportManagementHeader = "Export:";
	
	ExportText = "Broadcast Options:";
	ExportDescription = "Choose where to broadcast your settings.";
	ExportButtonItems = {"Guild", "Target", "Whisper"};
	ExportButtonTooltips = {"Will export your settings to every guild member who has this addon.",
							"Will export your settings to your current target.",
							"Will export your settings to a specific person."};
	ExportButtonText = "Export";
	
	ExportIgnoreText = "Ignore Imports:";
	ExportIgnoreCheckboxText = "Ignore all Imports";
	ExportIgnoreCheckboxTooltip = "Checking this will stop you from recieving other people's exports.\n\nDoing this may cause you to have different settings from other guild members.";
	
	-- Kick Stuff
	KickPanelName = "Guild Removal";
	KickManagementHeader = "Guild Removal:";
	
	KickText = "Days Offline:";
	KickDescription = "Select the cut-off for number of days to be eligible for guild removal.";
	KickText2 = "Highest Inactive Rank:";
	KickDescription2 = "Select the highest rank that can be eligible for guild removal.";
	KickText3 = "Post-Kick Message:";
	KickDescription3 = "If turned on, this setting will allow you to post a message into guild\nchat letting members know that an inactivity kick just took place.";
	KickMessageCheckboxText = "Send a post-kick message?";
	KickMessageCheckboxTextTooltip = "Turns on or off the sending of post-kick messages.";
	KickText4 = "Find and Remove:";
	KickFindButtonText = "Find Inactives";
	KickKickButtonText = "Remove Inactives";

	-- UI Stuff
	UIFindButton = "Find";
	UIBothButton = "Promote and Demote";
	UIPromoteButton = "Only Promote";
	UIDemoteButton = "Only Demote";
	UISettingsButton = "Settings";
	
	-- List Stuff
	PromoteList = "Promote List";
	DemoteList = "Demote List";
	
};