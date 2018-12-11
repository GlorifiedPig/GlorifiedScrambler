
local plyMeta = FindMetaTable( "Player" )

if( !plyMeta ) then return end

if ( !sql.TableExists( "playerupdata" ) ) then
	sql.Query( "CREATE TABLE IF NOT EXISTS playerupdata ( infoid TEXT NOT NULL PRIMARY KEY, value TEXT );" )
end

function plyMeta:SetUPData( name, value )
    print('yeet')
	name = Format( "%s[%s]", self:SteamID64(), name )
    sql.Query( "REPLACE INTO playerupdata ( infoid, value ) VALUES ( " .. SQLStr( name ) .. ", " .. SQLStr( value ) .. " )" )
end

function plyMeta:GetUPData( name, default )
	name = Format( "%s[%s]", self:SteamID64(), name )
    local val = sql.QueryValue( "SELECT value FROM playerupdata WHERE infoid = " .. SQLStr( name ) .. " LIMIT 1" )
	if ( val == nil ) then return default end

	return val
end

function plyMeta:AddUPData( name, value )
	if( self:GetUPData( name ) == nil ) then
		self:SetUPData( name, value )
	else
		self:SetUPData( name, self:GetUPData( name ) + value )
	end
end