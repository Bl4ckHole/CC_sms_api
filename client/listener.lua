tArgs={...}
os.loadAPI("smsAPI")

while true do
	sender, message = smsAPI.listener()
	smsAPI.sendAck(sender)
end
