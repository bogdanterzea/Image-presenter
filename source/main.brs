sub main()
	m.port = CreateObject("roMessagePort")
	screen = CreateObject("roSGScreen")
	screen.setMessagePort(m.port)
	scene = screen.CreateScene("home_scene")
	screen.Show()

	while(true)
		msg = wait(0, m.port)
		msgType = type(msg)
		if msgType = "roSGScreenEvent"
			if msg.isScreenClosed() then return
		end if
	end while
end sub
