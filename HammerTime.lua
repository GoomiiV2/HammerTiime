--========================================
-- HammerTime
-- Arkii      28/06/14
--========================================
require "lib/lib_ChatLib"

--=====================
--		Constants    --
--=====================
local WEBFRAME = Component.GetFrame("Web");

--=====================
--		Varables     --
--=====================
local C_LINKTYPE = "-HT-";
local C_ENDCAP = ChatLib.GetEndcapString();
local C_PAIRBREAK = ChatLib.GetLinkTypeIdBreak();
local Name = "";

--=====================
--      Events       --
--=====================
function OnPlayerReady(args)
    Name = Player.GetInfo();
    WEBFRAME:SetUrlFilters("*");
    WEBFRAME:LoadUrl("http://firefall.nyaasync.net/hammertime/Index.html");

    -- So other can hear it if the have this addon :D
    ChatLib.RegisterCustomLinkType(C_LINKTYPE, OnChatPacket)
end

function OnAblityUsed(args)
    if (tostring(args.id) == "34503") then
        Play();
        HammerCast();
    end
end

--=====================
--		Callacks     --
--=====================
function OnChatPacket(args)
    if (Name ~= args.author) then
        Play();
    end
end

--=====================
--		Functions    --
--=====================
function Play()
    WEBFRAME:CallWebFunc('Play', nil);
end

function HammerCast()
    local msg = CreateChatlink(1);
    Chat.SendChannelText("say", msg);
end

function CreateChatlink(id)
    local str = C_ENDCAP..C_LINKTYPE..C_PAIRBREAK..id..C_ENDCAP;
    return str;
end