void SetTeamID( string sColor, int iTeam )
{
    object oBrazier = GetObjectByTag( "BRAZIER" );
    if (!GetIsObjectValid( oBrazier ))
        return;
    SetLocalInt( oBrazier, "TEAM_" + sColor, iTeam );
    return;
}


