#include "NW_I0_GENERIC"
#include "our_constants"
#include "T1"
#include "T2"
#include "T3"
#include "T4"
#include "T5"
#include "T6"
#include "T7"
#include "T8"
#include "T9"
#include "T10"
#include "T11"
#include "T12"
#include "T13"
#include "T14"
#include "T15"
#include "Tx"

void ActivateDetermineCombatRound( object oIntruder = OBJECT_INVALID, int nAI_Difficulty = 10 )
{
    int iTeam = GetTeamID( GetLocalString( OBJECT_SELF, "COLOR" ) );

    switch (iTeam)
    {
        case 1: T1_DetermineCombatRound( oIntruder, nAI_Difficulty ); break;
        case 2: T2_DetermineCombatRound( oIntruder, nAI_Difficulty ); break;
        case 3: T3_DetermineCombatRound( oIntruder, nAI_Difficulty ); break;
        case 4: T4_DetermineCombatRound( oIntruder, nAI_Difficulty ); break;
        case 5: T5_DetermineCombatRound( oIntruder, nAI_Difficulty ); break;
        case 6: T6_DetermineCombatRound( oIntruder, nAI_Difficulty ); break;
        case 7: T7_DetermineCombatRound( oIntruder, nAI_Difficulty ); break;
        case 8: T8_DetermineCombatRound( oIntruder, nAI_Difficulty ); break;
        case 9: T9_DetermineCombatRound( oIntruder, nAI_Difficulty ); break;
        case 10: T10_DetermineCombatRound( oIntruder, nAI_Difficulty ); break;
        case 11: T11_DetermineCombatRound( oIntruder, nAI_Difficulty ); break;
        case 12: T12_DetermineCombatRound( oIntruder, nAI_Difficulty ); break;
        case 13: T13_DetermineCombatRound( oIntruder, nAI_Difficulty ); break;
        case 14: T14_DetermineCombatRound( oIntruder, nAI_Difficulty ); break;
        case 15: T15_DetermineCombatRound( oIntruder, nAI_Difficulty ); break;
        default: DetermineCombatRound( oIntruder, nAI_Difficulty ); break;
    }
}

void ActivateUserDefined( int Event )
{
    int iTeam = GetTeamID( GetLocalString( OBJECT_SELF, "COLOR" ) );

    switch (iTeam)
    {
        case 1: T1_UserDefined( Event ); break;
        case 2: T2_UserDefined( Event ); break;
        case 3: T3_UserDefined( Event ); break;
        case 4: T4_UserDefined( Event ); break;
        case 5: T5_UserDefined( Event ); break;
        case 6: T6_UserDefined( Event ); break;
        case 7: T7_UserDefined( Event ); break;
        case 8: T8_UserDefined( Event ); break;
        case 9: T9_UserDefined( Event ); break;
        case 10: T10_UserDefined( Event ); break;
        case 11: T11_UserDefined( Event ); break;
        case 12: T12_UserDefined( Event ); break;
        case 13: T13_UserDefined( Event ); break;
        case 14: T14_UserDefined( Event ); break;
        case 15: T15_UserDefined( Event ); break;
    }
}

void ActivateInitialization( string sColor )
{
    int iTeam = GetTeamID( sColor );

    switch (iTeam)
    {
        case 1: T1_Initialize( sColor ); break;
        case 2: T2_Initialize( sColor ); break;
        case 3: T3_Initialize( sColor ); break;
        case 4: T4_Initialize( sColor ); break;
        case 5: T5_Initialize( sColor ); break;
        case 6: T6_Initialize( sColor ); break;
        case 7: T7_Initialize( sColor ); break;
        case 8: T8_Initialize( sColor ); break;
        case 9: T9_Initialize( sColor ); break;
        case 10: T10_Initialize( sColor ); break;
        case 11: T11_Initialize( sColor ); break;
        case 12: T12_Initialize( sColor ); break;
        case 13: T13_Initialize( sColor ); break;
        case 14: T14_Initialize( sColor ); break;
        case 15: T15_Initialize( sColor ); break;
    }
}

void ActivateAreaTeam( int iTeam )
{
    int Event = EVENT_AREA;

    switch (iTeam)
    {
        case 1: T1_UserDefined( Event ); break;
        case 2: T2_UserDefined( Event ); break;
        case 3: T3_UserDefined( Event ); break;
        case 4: T4_UserDefined( Event ); break;
        case 5: T5_UserDefined( Event ); break;
        case 6: T6_UserDefined( Event ); break;
        case 7: T7_UserDefined( Event ); break;
        case 8: T8_UserDefined( Event ); break;
        case 9: T9_UserDefined( Event ); break;
        case 10: T10_UserDefined( Event ); break;
        case 11: T11_UserDefined( Event ); break;
        case 12: T12_UserDefined( Event ); break;
        case 13: T13_UserDefined( Event ); break;
        case 14: T14_UserDefined( Event ); break;
        case 15: T15_UserDefined( Event ); break;
    }
}

void ActivateArea()
{
    ActivateAreaTeam( GetTeamID( COLOR_RED ) );
    ActivateAreaTeam( GetTeamID( COLOR_BLUE ) );
}

