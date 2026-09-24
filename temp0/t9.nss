#include "NW_I0_GENERIC"
#include "our_constants"

void T9_DetermineCombatRound( object oIntruder = OBJECT_INVALID, int nAI_Difficulty = 10 )
{
    ClearAllActions();
    return;
}

void T9_UserDefined( int Event )
{
    return;
}

void T9_Initialize( string sColor )
{
    SetTeamName( sColor, "UNDEFINED-9-" + GetStringLowerCase( sColor ) );
}
