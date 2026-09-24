#include "NW_I0_GENERIC"
#include "our_constants"

void T13_DetermineCombatRound( object oIntruder = OBJECT_INVALID, int nAI_Difficulty = 10 )
{
    return;
}

void T13_UserDefined( int Event )
{
    return;
}

void T13_Initialize( string sColor )
{
    SetTeamName( sColor, "UNDEFINED-13-" + GetStringLowerCase( sColor ) );
}
