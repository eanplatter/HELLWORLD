local options = {
  type='group',
  args = {
    attend = {
      type = 'text',
      name = 'fuck',
      get = 'ViewAttendance',
      set = 'TakeAttendance',
      desc = 'ATTENDANCE',
      usage = "shrug",
    },
    msg = {
      type = 'text',
      name = 'msg',
      desc = 'The message text to be displayed',
      usage = "<Your message here>",
      get = "GetMessage",
      set = "SetMessage",
    },
  },
}

Hellworld = AceLibrary("AceAddon-2.0"):new(
  "AceConsole-2.0", 
  "AceEvent-2.0", 
  "AceDB-2.0");
Hellworld:RegisterChatCommand({"/hellworld", "/hw", "/attend"}, options)
Hellworld.message = "Welcome to HELLWORLD"
Hellworld:RegisterDB("HellworldDB", "HellworldDBPC")
Hellworld:RegisterDefaults("profile", {
  message = "HELLWORLD: DON'T CARE",
  raids = {},
})

function Hellworld:OnInitialize()
  -- Called when the addon is loaded
end

function Hellworld:OnEnable()
  self:Print("DON'T CARE")
  self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
end

function Hellworld:ZONE_CHANGED_NEW_AREA()
  if GetBindLocation() == GetRealZoneText() then
    self:Print(self.db.profile.message)
  end
  self:Print("You have changed zones!")
end

function Hellworld:OnDisable()
  -- Called when the addon is disabled
end

function Hellworld:GetMessage()
  return self.db.profile.message
end

function Hellworld:SetMessage(newValue)
  self.db.profile.message = newValue
end

function Hellworld:ViewAttendance()
end

function Hellworld:TakeAttendance(newValue)
  self:Print("TAKING RAID ATTENDANCE")
  newRaid = {}
  currentDate = date("%x")
  currentTime = date("%X")
  for i=1, MAX_RAID_MEMBERS do
    name, rank, subgroup, level, class, fileName, 
    zone, online, isDead, role, isML, combatRole = GetRaidRosterInfo(i);
    if name then
      table.insert(newRaid, {
        name = name,
        rank = rank,
        subgroup = subgroup,
        level = level,
        class = class,
        fileName = fileName,
        zone = zone,
        online = online,
        isDead = isDead,
        role = role,
        isML = isML,
        comatRole = combatRole,
      })
    end
  end
  self.db.profile.raids[currentDate][currentTime] = newRaid
  return 
end
