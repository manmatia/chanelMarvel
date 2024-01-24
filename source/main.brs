sub Main()
    ? "start Marvel Channel "

    screen = CreateObject("roSGScreen")
    m = CreateObject("roAssociativeArray")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)

    scene = screen.CreateScene("MainScreen")
    scene.backgroundColor = ""
    scene.backgroundUri = "pkg:/images/caphd.jpeg"
   
  
   
    screen.show() 
    
    while true
        msg = wait(0, m.port)
        msgType = type(msg)
    
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while
  end sub
  