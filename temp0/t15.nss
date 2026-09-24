#include "NW_I0_GENERIC"
#include "our_constants"

void T15_DetermineCombatRound( object oIntruder = OBJECT_INVALID, int nAI_Difficulty = 10 )
{
    return;
}

void T15_UserDefined( int Event )
{
    return;
}

void T15_Initialize( string sColor )
{
    SetTeamName( sColor, "UNDEFINED-15-" + GetStringLowerCase( sColor ) );
}
