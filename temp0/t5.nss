#include "NW_I0_GENERIC"
#include "our_constants"

void T5_DetermineCombatRound( object oIntruder = OBJECT_INVALID, int nAI_Difficulty = 10 )
{
    return;
}

void T5_UserDefined( int Event )
{
    return;
}

void T5_Initialize( string sColor )
{
    SetTeamName( sColor, "UNDEFINED-5-" + GetStringLowerCase( sColor ) );
}
