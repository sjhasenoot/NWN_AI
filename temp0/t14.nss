#include "NW_I0_GENERIC"
#include "our_constants"

void T14_DetermineCombatRound( object oIntruder = OBJECT_INVALID, int nAI_Difficulty = 10 )
{
    return;
}

void T14_UserDefined( int Event )
{
    return;
}

void T14_Initialize( string sColor )
{
    SetTeamName( sColor, "UNDEFINED-14-" + GetStringLowerCase( sColor ) );
}
