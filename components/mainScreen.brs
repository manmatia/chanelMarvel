sub init()
  rowListVarible()
  createVarible()
  observerChange()
  m.top.setFocus(true)
end sub

sub rowListVarible()
  m.rowlist = m.top.findNode("marvelRowList")
  m.marvelRowList = m.top.findNode("marvelRowList")
  m.rowlist.content = CreateObject("roSGNode", "RowListContent")
end sub
sub createVarible()
  m.spiderMan = m.top.findNode("spiderMan")
  m.blackPanter = m.top.findNode("blackPanter")
  m.detailSpider = m.top.findNode("detalleSpider")
  m.doctorStrange = m.top.findNode("doctorStrange")
  m.blackWidow = m.top.findNode("blackWidow")
  m.video = m.top.findNode("videoPlayer")
end sub

sub observerChange()
  m.marvelRowList.observeField("itemSelected", "onItemSelectedChanged")
end sub

sub onItemSelectedChanged()
  if m.marvelRowList.rowItemFocused[1] = 0
    m.detailSpider.visible = true
    m.marvelRowList.visible = false
    setVideo()
  end if
  if m.marvelRowList.rowItemFocused[1] = 1
    m.blackPanter.visible = true
    m.marvelRowList.visible = false
  end if
  if m.marvelRowList.rowItemFocused[1] = 2
    m.doctorStrange.visible = true
    m.marvelRowList.visible = false
  end if
  if m.marvelRowList.rowItemFocused[1] = 3
    m.blackWidow.visible = true
    m.marvelRowList.visible = false
  end if
end sub

sub backHome()
  m.detailSpider.visible = false
  m.blackPanter.visible = false
  m.doctorStrange.visible = false
  m.blackWidow.visible = false
  m.video.control = "stop"
  m.marvelRowList.visible = true
  m.rowlist.setFocus(true)
end sub


function onKeyEvent(key as string, press as boolean) as boolean
  print "Key: "; key; ", Press: "; press

  if key = "OK" then
    onItemSelectedChanged()
  else if press and key = "back" then
    backHome()
    return true
  end if

  return false
end function



function setVideo()
  videoContent = createObject("RoSGNode", "ContentNode")
  videoContent.title = "Marvel"
  videoContent.streamformat = "mp4"
  videoContent.URL = "pkg:/images/Spider.mp4"


  m.video.content = videoContent
  m.video.control = "play"
  m.video.focusable = true
  print m.video.content

end function