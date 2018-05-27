local L = AceLibrary('AceLocale-2.2'):new("Hellworld")

L:RegisterTranslations("enUS", function() return {
  ["Slash-Commands"] = { "/hellworld", "/hw" }
  ["HELLWORLD: DON'T CARE"] = true, -- default message
  ["Message"] = true,
  ["The message text to be displayed"] = true,
  ["<your message>"] = true, -- usage
} end)
