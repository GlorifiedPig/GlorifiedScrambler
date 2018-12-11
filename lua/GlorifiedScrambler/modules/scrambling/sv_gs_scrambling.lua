
function GlorifiedScrambler.StartScramble( tableIndex )
    if( GlorifiedScrambler.ScrambleActive ) then return end
    local tbl = GlorifiedScrambler.config.SCRAMBLE_LIST[tableIndex]

    local msg = tbl[1] local time = tbl[2] local cash = tbl[3] local points = tbl[4]

    for k, v in pairs( player.GetAll() ) do
        GlorifiedScrambler.SendClientMessage( msg, time, cash, points )
    end

    GlorifiedScrambler.ScrambleActive = true

    timer.Simple( time, function()
        if( GlorifiedScrambler.ScrambleActive == true ) then
            GlorifiedScrambler.EndScramble( nil, nil, tbl )
        end
    end )
end

timer.Create( "GlorifiedScramblerAutoStartScramble", GlorifiedScrambler.config.SCRAMBLE_TIME, 0, function()
    GlorifiedScrambler.StartScramble( math.random( 1, #GlorifiedScrambler.config.SCRAMBLE_LIST ) )
end )

function GlorifiedScrambler.EndScramble( winner, timeTaken, tbl )
    GlorifiedScrambler.ScrambleActive = false

    if( winner != nil ) then
        GlorifiedScrambler.SendWinnerMessage( winner, tbl[1], tbl[2], tbl[3], tbl[4], timeTaken )
        ply:AddUPData( "gScrambleWins", 1 )
        ply:AddUPData( "gScramblePoints", tbl[4] )
        ply:addMoney( tbl[3] )
    else
        GlorifiedScrambler.SendEndingMessage()
    end
end

function GlorifiedScrambler.SendScrambleMessage( msg, time, cash, points )

end

function GlorifiedScrambler.SendWinnerMessage( winner, msg, time, cash, points, timeTaken )

end

function GlorifiedScrambler.SendEndingMessage()

end