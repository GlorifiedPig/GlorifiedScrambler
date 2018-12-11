
net.Receive( "GSSendScrambleMessage", function()
    local tableIndex = net.ReadTable()
    
    if( tableIndex[3] >= 2 ) then
        chat.AddText( Color( 255, 55, 55 ), "[GlorifiedScrambler] ", Color( 204, 124, 255 ), "First person to type '", Color( 255, 215, 0 ), tableIndex[1], Color( 204, 124, 255 ), "' wins up to ", Color( 0, 255, 0 ), "$" .. ( tableIndex[2] * tableIndex[3] ), Color( 204, 124, 255 ), " and ", Color( 155, 155, 255 ), tostring( tableIndex[4] ), Color( 204, 124, 255 ), " scramble points." )
    else
        if( tableIndex[3] > 0 ) then
            chat.AddText( Color( 255, 55, 55 ), "[GlorifiedScrambler] ", Color( 204, 124, 255 ), "First person to type '", Color( 255, 215, 0 ), tableIndex[1], Color( 204, 124, 255 ), "' wins ", Color( 0, 255, 0 ), "$" .. tableIndex[3], Color( 204, 124, 255 ), " and ", Color( 155, 155, 255 ), tostring( tableIndex[4] ), Color( 204, 124, 255 ), " scramble points." )
        else
            chat.AddText( Color( 255, 55, 55 ), "[GlorifiedScrambler] ", Color( 204, 124, 255 ), "First person to type '", Color( 255, 215, 0 ), tableIndex[1], Color( 204, 124, 255 ), "' loses ", Color( 0, 255, 0 ), "$" .. math.abs( tableIndex[3] ), Color( 204, 124, 255 ), " and ", Color( 155, 155, 255 ), tostring( math.abs( tableIndex[4] ) ), Color( 204, 124, 255 ), " scramble points." )
        end
    end
end )

net.Receive( "GSSendWinnerMessage", function()
    local winner = net.ReadEntity()
    local amtWon = net.ReadTable()
    local tableIndex = net.ReadTable()
    local timeTaken = net.ReadFloat()
    local newStats = net.ReadTable()

    if( tableIndex[3] > 0 ) then
        chat.AddText( Color( 255, 55, 55 ), "[GlorifiedScrambler] ", Color( 255, 215, 0 ), winner:Nick(), Color( 204, 124, 255 ), " typed the word in time and won ", Color( 0, 255, 0 ), "$" .. amtWon[1], Color( 204, 125, 255 ), "." )
        if( winner == LocalPlayer() ) then
            chat.AddText( Color( 204, 124, 255 ), "Congratulations. You won ", Color( 0, 255, 0 ), "$" .. amtWon[1], Color( 204, 125, 255 ), " and ", Color( 255, 215, 0 ), tostring( tableIndex[4] ), Color( 204, 125, 255 ), " scramble points." )
            chat.AddText( Color( 204, 124, 255 ), "You now have ", Color( 0, 255, 0 ), tostring( newStats[1] ), Color( 204, 125, 255 ), " wins and ", Color( 255, 215, 0 ), tostring( newStats[2] ), Color( 204, 125, 255 ), " scramble points." )
        end
    else
        chat.AddText( Color( 255, 55, 55 ), "[GlorifiedScrambler] ", Color( 255, 215, 0 ), winner:Nick(), Color( 204, 124, 255 ), " typed the word in time and lost ", Color( 0, 255, 0 ), "$" .. amtWon[1], Color( 204, 125, 255 ), "." )
        if( winner == LocalPlayer() ) then
            chat.AddText( Color( 204, 124, 255 ), "You lost ", Color( 255, 0, 0 ), "$" .. amtWon[1], Color( 204, 125, 255 ), " and ", Color( 255, 215, 0 ), tostring( math.abs( tableIndex[4] ) ), Color( 204, 125, 255 ), " scramble points." )
            chat.AddText( Color( 204, 124, 255 ), "You now have ", Color( 0, 255, 0 ), tostring( newStats[1] ), Color( 204, 125, 255 ), " wins and ", Color( 255, 215, 0 ), tostring( newStats[2] ), Color( 204, 125, 255 ), " scramble points." )
        end
    end
end )

net.Receive( "GSSendEndingMessage", function()
    chat.AddText( Color( 255, 55, 55 ), "[GlorifiedScrambler] ", Color( 204, 124, 255 ), "Nobody typed the word in time." )
end )