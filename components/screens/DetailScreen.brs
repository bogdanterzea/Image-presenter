sub init()
    m.title = m.top.findNode("title")
    m.description = m.top.findNode("description")
    m.rankDisplayText = m.top.findNode("rank_display_text")
    m.detailsRectangle = m.top.findNode("details_rectangle")
    m.backgroundPoster = m.top.findNode("background_poster")
    m.rankingInstructionsText = m.top.findNode("instructions_text")
    m.rankDisplayRectangle = m.top.findNode("rank_display_rectangle")
    m.rankingInstructionsRectangle = m.top.findNode("instructions_rectangle")

    setTheme()
end sub

sub onContentChanged(event as Object)
    m.content = event.getData()
    initializeRegistry(m.content)
    populateVisualElements()
end sub

sub initializeRegistry(content as Object)
    m.registrySectionContent = CreateObject("roRegistrySection", "registrySectionContent")
    m.registryAssocArray = parseJson(m.registrySectionContent.Read("registry"))
end sub

sub displayCurrentRank()
    for each item in m.registryAssocArray
        if item = m.content.index.ToStr() then
            m.rankDisplayText.text = "Current rank: "+ m.registryAssocArray[item].rank.ToStr()
        end if
    end for
end sub

sub populateVisualElements()
    m.backgroundPoster.uri = m.content.largeImageUrl
    m.title.text = m.content.title
    m.description.text = m.content.description
    displayCurrentRank()
end sub

sub setTheme()
    colors = getAppColors()
    m.title.color = colors.main
    m.description.color = colors.main
    m.detailsRectangle.color = colors.transparentBlack
    m.rankingInstructionsRectangle.color = colors.transparentBlack
    m.rankingInstructionsText.color = colors.main
    m.rankDisplayText.color = colors.main
    m.rankDisplayRectangle.color = colors.transparentBlack
end sub

function onKeyOptions() as Boolean
    navigate("RankingScreen", m.content)
    return true
end function

function onKeyBack() as Boolean
    navigateBackTo("content_list")
    return true
end function
