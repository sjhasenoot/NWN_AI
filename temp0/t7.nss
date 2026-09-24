#include "NW_I0_GENERIC"
#include "our_constants"

void T7_DetermineCombatRound( object oIntruder = OBJECT_INVALID, int nAI_Difficulty = 10 )
{
    return;
}

void T7_UserDefined( int Event )
{
    return;
}

void T7_Initialize( string sColor )
{
    SetTeamName( sColor, "UNDEFINED-7-" + GetStringLowerCase( sColor ) );
}
