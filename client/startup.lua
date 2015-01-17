tArgs={...}
local pseudo = nil
print("Please enter your pseudo")
pseudo = read()

periph = peripheral.getNames()
side = nil
for u,v in pairs(periph) do
	if peripheral.getType(u) == "modem" then
		side = u
	end
end

if side == nil then
	error("No modem is connected to the computer")
elseif not peripheral.call(side,"isWireless") then
	error("The modem is not wireless")
end

rednet.open(side)
rednet.host("SMS",pseudo)
