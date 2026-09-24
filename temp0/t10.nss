#include "NW_I0_GENERIC"
#include "our_constants"

void T10_DetermineCombatRound( object oIntruder = OBJECT_INVALID, int nAI_Difficulty = 10 )
{
    return;
}

void T10_UserDefined( int Event )
{
    return;
}

void T10_Initialize( string sColor )
{
    SetTeamName( sColor, "UNDEFINED-10-" + GetStringLowerCase( sColor ) );
}
