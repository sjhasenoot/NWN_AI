#include "NW_I0_GENERIC"
#include "our_constants"

void T4_DetermineCombatRound( object oIntruder = OBJECT_INVALID, int nAI_Difficulty = 10 )
{
    return;
}

void T4_UserDefined( int Event )
{
    return;
}

void T4_Initialize( string sColor )
{
    SetTeamName( sColor, "UNDEFINED-4-" + GetStringLowerCase( sColor ) );
}
