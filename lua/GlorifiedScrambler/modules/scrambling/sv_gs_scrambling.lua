
util.AddNetworkString( "GSSendScrambleMessage" )
util.AddNetworkString( "GSSendWinnerMessage" )
util.AddNetworkString( "GSSendEndingMessage" )

function GlorifiedScrambler.StartScramble( tableIndex )
    if( GlorifiedScrambler.ScrambleActive ) then return end
    local tbl = GlorifiedScrambler.config.SCRAMBLE_LIST[tableIndex]

    GlorifiedScrambler.SendScrambleMessage( tbl )

    GlorifiedScrambler.ScrambleActive = true
    GlorifiedScrambler.TimeTaken = 0
    GlorifiedScrambler.CurrentScrambleTbl = tbl

    timer.Create( "GlorifiedScramblerAddTimeCheck", 0.1, tbl[2] * 10, function()
        GlorifiedScrambler.TimeTaken = GlorifiedScrambler.TimeTaken + 0.1
    end )

    timer.Simple( tbl[2], function()
        if( GlorifiedScrambler.ScrambleActive == true ) then
            GlorifiedScrambler.EndScramble( nil, nil, tbl )
        end
    end )
end

timer.Create( "GlorifiedScramblerAutoStartScramble", GlorifiedScrambler.config.SCRAMBLE_TIME, 0, function()
    GlorifiedScrambler.StartScramble( math.random( 1, #GlorifiedScrambler.config.SCRAMBLE_LIST ) )
end )

hook.Add( "PlayerSay", "GlorifiedScramblerPlayerSayTester", function( sender, text )
    if( !GlorifiedScrambler.ScrambleActive ) then return end
    if( text == GlorifiedScrambler.CurrentScrambleTbl[1] ) then
        GlorifiedScrambler.EndScramble( sender, GlorifiedScrambler.TimeTaken, GlorifiedScrambler.CurrentScrambleTbl )
        return ""
    end
end )

function GlorifiedScrambler.EndScramble( winner, timeTaken, tbl )
    GlorifiedScrambler.ScrambleActive = false
    GlorifiedScrambler.TimeTaken = 0
    GlorifiedScrambler.CurrentScrambleTbl = {}

    if( winner != nil ) then
        winner:AddUPData( "gScrambleWins", 1 )
        winner:AddUPData( "gScramblePoints", tbl[4] )

        if( tbl[3] >= 2 ) then
            local amtWon = ( tbl[2] - timeTaken ) * tbl[3]
            GlorifiedScrambler.SendWinnerMessage( winner, amtWon, tbl, timeTaken, { winner:GetUPData( "gScrambleWins" ), winner:GetUPData( "gScramblePoints" ) } )
            winner:addMoney( amtWon )
        else
            GlorifiedScrambler.SendWinnerMessage( winner, tbl[3], tbl, timeTaken, { winner:GetUPData( "gScrambleWins" ), winner:GetUPData( "gScramblePoints" ) } )
            winner:addMoney( tbl[3] )
        end
    else
        GlorifiedScrambler.SendEndingMessage()
    end
end

function GlorifiedScrambler.SendScrambleMessage( tableIndex )
    for k, v in pairs( player.GetAll() ) do
        net.Start( "GSSendScrambleMessage" )
        net.WriteTable( tableIndex )
        net.Send( v )
    end
end

function GlorifiedScrambler.SendWinnerMessage( winner, amtWon, tableIndex, timeTaken, newStats )
    for k, v in pairs( player.GetAll() ) do
        net.Start( "GSSendWinnerMessage" )
        net.WriteEntity( winner )
        net.WriteTable( { math.abs( amtWon ) } )
        net.WriteTable( tableIndex )
        net.WriteFloat( timeTaken )
        net.WriteTable( newStats )
        net.Send( v )
    end
end

function GlorifiedScrambler.SendEndingMessage()
    for k, v in pairs( player.GetAll() ) do
        net.Start( "GSSendEndingMessage" )
        net.Send( v )
    end
end