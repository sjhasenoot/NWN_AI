#include "NW_I0_GENERIC"
#include "our_constants"

void T12_DetermineCombatRound( object oIntruder = OBJECT_INVALID, int nAI_Difficulty = 10 )
{
    return;
}

void T12_UserDefined( int Event )
{
    return;
}

void T12_Initialize( string sColor )
{
    SetTeamName( sColor, "UNDEFINED-12-" + GetStringLowerCase( sColor ) );
}
