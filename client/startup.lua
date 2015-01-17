tArgs={...}
local pseudo = nil
print("Please enter your pseudo")
pseudo = read()

--periph = peripheral.getNames()
--side = nil
--for u,v in pairs(periph) do
--	if peripheral.getType(u) == "modem" then
--		side = u
--	end
--end

--if side == nil then
--	error("No modem is connected to the computer")
--elseif not peripheral.call(side,"isWireless") then
--	error("The modem is not wireless")
--end

function sendSMS(target, message)
	local ID = rednet.lookup("SMS", target)
	rednet.send(ID, message, "SMS")
end

local modem = peripheral.wrap("back")

rednet.open("back")
rednet.host("SMS",pseudo)
