#include "NW_I0_GENERIC"
#include "our_constants"

void Tx_DetermineCombatRound( object oIntruder = OBJECT_INVALID, int nAI_Difficulty = 10 )
{
    return;
}

void Tx_UserDefined( int Event )
{
    return;
}

void Tx_Initialize( string sColor )
{
    SetTeamName( sColor, "UNDEFINED-x-" + GetStringLowerCase( sColor ) );
}
