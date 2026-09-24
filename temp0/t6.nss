#include "NW_I0_GENERIC"
#include "our_constants"

void T6_DetermineCombatRound( object oIntruder = OBJECT_INVALID, int nAI_Difficulty = 10 )
{
    return;
}

void T6_UserDefined( int Event )
{
    return;
}

void T6_Initialize( string sColor )
{
    SetTeamName( sColor, "UNDEFINED-6-" + GetStringLowerCase( sColor ) );
}
