sub init()
  m.rowlist = m.top.findNode("marvelRowList")
  m.rowlist.content = CreateObject("roSGNode", "RowListContent")
  m.top.setFocus(true)
  m.spiderMan = m.top.findNode("spiderMan")
  m.firstScreen = m.top.findNode("firstScreen")
  m.detalleScreen = m.top.findNode("detalleScreen")
  m.detailSpider = m.top.findNode("detalleSpider")
  m.detailDoctor = m.top.findNode("detalleDoctor")
  m.detailBlack = m.top.findNode("detalleBlack")
  m.video = m.top.findNode("videoPlayer")
end sub

sub changeVisible()
  m.detalleScreen.visible = true
  m.firstScreen.visible = false
  print "cambio de vista"
end sub

sub changeVisible0()
  m.detailSpider.visible = true
  m.firstScreen.visible = false
  setVideo()
  print "cambio de vista"
end sub
sub changeVisible2()
  m.detailDoctor.visible = true
  m.firstScreen.visible = false
  print "cambio de vista"
end sub
sub changeVisible3()
  m.detailBlack.visible = true
  m.firstScreen.visible = false
  print "cambio de vista"
end sub

sub backHome()
  
  m.detailSpider.visible = false
  m.detalleScreen.visible = false
  m.detailDoctor.visible = false
  m.detailBlack.visible = false
  m.video.control = "stop"
  
  m.firstScreen.visible = true
  m.rowlist = m.top.findNode("marvelRowList")
  m.rowlist.setFocus(true)
  print "Vuelvo a home"
end sub


function onKeyEvent(key as String, press as Boolean) as Boolean
  print "Key: "; key; ", Press: "; press

  if key = "OK" then
    m.rowlist = m.top.findNode("marvelRowList")
    focusedItem = m.rowlist.rowItemSelected
    ? focusedItem
    if focusedItem[1] = 0 then
      changeVisible0()
      m.detailSpider.setFocus(true)
    end if
    if focusedItem[1] = 1 then
      changeVisible()
      m.detalleScreen.setFocus(true)
    end if
    if focusedItem[1] = 2 then
      changeVisible2()
      m.detailDoctor.setFocus(true)
    end if
    if focusedItem[1] = 3 then
      changeVisible3()
      m.detailBlack.setFocus(true)
    end if
  elseif press And key = "back" then

    backHome()
    return true
  end if

  return false
end function



function setVideo()
  videoContent = createObject("RoSGNode", "ContentNode")
  videoContent.title = "Marvel"
  videoContent.streamformat = "mp4"
  videoContent.URL="pkg:/images/Spider.mp4"

  
  m.video.content = videoContent
  m.video.control = "play"
  m.video.focusable = true
  print m.video.content

end function