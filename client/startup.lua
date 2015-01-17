tArgs={...}
if type(tArgs[1]) ~= "string" then
	error("Use SMS <pseudo>")
end
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
rednet.host("SMS",tArgs[1])