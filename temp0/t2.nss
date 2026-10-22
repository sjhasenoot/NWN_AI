#include "NW_I0_GENERIC"
#include "our_constants"

void T2_DetermineCombatRound( object oIntruder = OBJECT_INVALID, int nAI_Difficulty = 10 )
{
    return;
}

void T2_UserDefined( int Event )
{
    return;
}

void T2_Initialize( string sColor )
{
    SetTeamName( sColor, "UNDEFINED-2-" + GetStringLowerCase( sColor ) );
}
