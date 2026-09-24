#include "NW_I0_GENERIC"
#include "our_constants"

void T11_DetermineCombatRound( object oIntruder = OBJECT_INVALID, int nAI_Difficulty = 10 )
{
    return;
}

void T11_UserDefined( int Event )
{
    return;
}

void T11_Initialize( string sColor )
{
    SetTeamName( sColor, "UNDEFINED-11-" + GetStringLowerCase( sColor ) );
}
