#include "NW_I0_GENERIC"
#include "our_constants"

// Called every time that the AI needs to take a combat decision. The default is
// a call to the NWN DetermineCombatRound.
void T1_DetermineCombatRound( object oIntruder = OBJECT_INVALID, int nAI_Difficulty = 10 )
{
    DetermineCombatRound( oIntruder, nAI_Difficulty );
}




void T1_testing(){
    string sColor = MyColor( OBJECT_SELF );
    string sMyCirlce = "WP_CIRCLE_" + sColor;
    SpeakString(IntToString(GetTimer(sMyCirlce)), TALKVOLUME_SHOUT);

    if (GetTimer(sMyCirlce) > 2){
        //ClearAllActions(OBJECT_SELF);
        SetLocalString(OBJECT_SELF, "TARGET", sMyCirlce);
    }
    else{
        string sTarget = WpClosestAltarRight(OBJECT_SELF);
        SetLocalString( OBJECT_SELF, "TARGET", sTarget );
    }
}

void T1_UpdateHeatmapPoint(string sLocation, string sDataTarget) {
    object oLocation = GetObjectByTag(sLocation);

    // Get number of players on altar (+2)
    int iNEnemies_onAltar = CheckEnemyGroupingOnTarget(oLocation,2.0); // What should the distance be?
    int iNAllies_onAltar = CheckFriendlyFireOnTarget(oLocation,2.0);
    float fEnemyScore = IntToFloat(iNEnemies_onAltar) * 2.0;
    float fAllyScore = IntToFloat(iNEnemies_onAltar) * 2.0;

    // // Get number of players near altar (+1)
    // int iNEnemies_nearAltar = CheckEnemyGroupingOnTarget(oLocation,10.0) - iNEnemies_onAltar; // What should the distance be?
    // int iNAllies_nearAltar = CheckFriendlyFireOnTarget(oLocation,10.0) - iNAllies_onAltar;
    // fEnemyScore = fEnemyScore + iNEnemies_nearAltar;
    // fAllyScore = fAllyScore + iNAllies_nearAltar;

    // // Get number of players in vague vicinity of altar (+.5)
    // int iNEnemies_vagueVicinity = CheckEnemyGroupingOnTarget(oLocation,20.0) - iNEnemies_onAltar - iNEnemies_nearAltar; // What should the distance be?
    // int iNAllies_vagueVicinity = CheckFriendlyFireOnTarget(oLocation,20.0) - iNAllies_onAltar - iNAllies_nearAltar;
    // fEnemyScore = fEnemyScore + iNEnemies_vagueVicinity * 0.5;
    // fAllyScore = fAllyScore + iNAllies_vagueVicinity * 0.5;

    SetLocalFloat(GetObjectByTag(sDataTarget), sLocation + "_ENEMY", fEnemyScore);
    SetLocalFloat(GetObjectByTag(sDataTarget), sLocation + "_ALLY", fAllyScore);
    // SpeakString(sLocation+" (Heatmap): "+FloatToString(GetLocalFloat(GetObjectByTag(sDataTarget), sLocation + "_ENEMY")), TALKVOLUME_SHOUT);
}

void T1_GetMinHeatmap() {

}

void T1_UpdateHeatmap() {
    // For each waypoint
        // Get number of players on altar (+2)
        // Get number of players near altar (+1)
        // Get number of players in vague vicinity of altar (+.5)

    string sDataTarget = "WP_" + MyColor() + "_4";
    string sLocation = "";

    sLocation = "WP_CIRCLE_RED" ;
    T1_UpdateHeatmapPoint(sLocation, sDataTarget);

    sLocation = "WP_ALTAR_RED_1";
    T1_UpdateHeatmapPoint(sLocation, sDataTarget);

    sLocation = "WP_ALTAR_RED_2";
    T1_UpdateHeatmapPoint(sLocation, sDataTarget);

    sLocation = "WP_DOUBLER";
    T1_UpdateHeatmapPoint(sLocation, sDataTarget);

    sLocation = "WP_ALTAR_BLUE_2";
    T1_UpdateHeatmapPoint(sLocation, sDataTarget);

    sLocation = "WP_ALTAR_BLUE_1";
    T1_UpdateHeatmapPoint(sLocation, sDataTarget);

    sLocation = "WP_CIRCLE_BLUE";
    T1_UpdateHeatmapPoint(sLocation, sDataTarget);
}

void T1_DisplayHeatmapValue (string sWpName, int iXLocationMod = 0, int iYLocationMod = 0,  int nFadeOut = 0x00000000) {
    object oDataObject = GetObjectByTag("WP_" + MyColor() + "_4");

    int iScoreColor = GetLocalInt(oDataObject, "COLOR_WHITE");
    int iLocAddition = 35;

    float iScoreAlly = GetLocalFloat(oDataObject, sWpName+"_ALLY"); // Fetch Ally control score of node

    if (iScoreAlly > 5.0) {
        iScoreColor = GetLocalInt(oDataObject, "COLOR_"+MyColor());
    } else if (iScoreAlly > 0.0) {
        iScoreColor = GetLocalInt(oDataObject, "COLOR_DARK_"+MyColor());
    }

    PostString(GetFirstPC(), FloatToString(iScoreAlly, 2, 1), 35 + iXLocationMod + (MyColor() == "RED") * iLocAddition , 0 + iYLocationMod, SCREEN_ANCHOR_CENTER , 60.0, iScoreColor, nFadeOut);

}

void T1_DisplayHeatmap() {
    // With help from: https://nwnlexicon.com/PostString
    object oDataObject = GetObjectByTag("WP_" + MyColor() + "_4");
    int nFadeOut = 0x00000000;

    // Custom location for different items in heatmap display
    int iLocAddition = 35;
    int iLineWidth = 3;

    PostString(GetFirstPC(), MyColor(), 35 + (MyColor() == "RED") * iLocAddition , 0, SCREEN_ANCHOR_CENTER , 60.0, GetLocalInt(oDataObject, "COLOR_" + MyColor()), nFadeOut);
    
    // WP_CIRCLE_RED
    T1_DisplayHeatmapValue("WP_CIRCLE_RED", 0, iLineWidth * 1);

    // WP_ALTAR_RED_1
    T1_DisplayHeatmapValue("WP_ALTAR_RED_1", -5, iLineWidth * 2);

    // WP_ALTAR_RED_2
    T1_DisplayHeatmapValue("WP_ALTAR_RED_2", 5, iLineWidth * 2);

    // WP_DOUBLER
    T1_DisplayHeatmapValue("WP_DOUBLER", 0, iLineWidth * 3 );

    // WP_ALTAR_BLUE_2
    T1_DisplayHeatmapValue("WP_ALTAR_BLUE_2", -5, iLineWidth * 4);

    // WP_ALTAR_BLUE_1
    T1_DisplayHeatmapValue("WP_ALTAR_BLUE_1", 5, iLineWidth * 4 );
    
    // WP_CIRCLE_BLUE
    T1_DisplayHeatmapValue("WP_CIRCLE_BLUE", 0, iLineWidth * 5);



}

// Called every heartbeat (i.e., every six seconds).
void T1_HeartBeat()
{
    if(IsFighterRight(OBJECT_SELF)){
        T1_testing();
    }
    if (GetIsInCombat())
        return;

    string sTarget = GetLocalString( OBJECT_SELF, "TARGET" );
    if (sTarget == "")
        return;

    object oTarget = GetObjectByTag( sTarget );
    if (!GetIsObjectValid( oTarget ))
        return;



    if (IsMaster()) {
        T1_UpdateHeatmap();
        T1_DisplayHeatmap();
    }
    // If there is a member of my own team close to the target and closer than me,
    // and no enemy is closer and this other member is not in combat and
    // has the same target, then choose a new target.
    float fToTarget = GetDistanceToObject( oTarget );
    int i = 1;
    // int bNewTarget = FALSE;
    // object oCreature = GetNearestObjectToLocation( OBJECT_TYPE_CREATURE, GetLocation( oTarget ), i );
    // while (GetIsObjectValid( oCreature ))
    // {
    //     if (GetLocation( oCreature ) == GetLocation( OBJECT_SELF ))
    //         break;
    //     if (GetDistanceBetween( oCreature, oTarget ) > fToTarget)
    //         break;
    //     if (GetDistanceBetween( oCreature, oTarget ) > 5.0)
    //         break;
    //     if (!SameTeam( oCreature ))
    //         break;
    //     if (GetIsInCombat( oCreature ))
    //         break;
    //     if (GetLocalString( oCreature, "TARGET" ) == sTarget)
    //     {
    //         bNewTarget = TRUE;
    //         break;
    //     }
    //     ++i;
    //     oCreature = GetNearestObjectToLocation( OBJECT_TYPE_CREATURE, GetLocation( oTarget ), i );
    // }

    // if (bNewTarget)
    // {
    //     sTarget = GetRandomTarget();
    //     SetLocalString( OBJECT_SELF, "TARGET", sTarget );
    //     oTarget = GetObjectByTag( sTarget );
    //     if (!GetIsObjectValid( oTarget ))
    //         return;
    //     fToTarget = GetDistanceToObject( oTarget );
    // }

    if (fToTarget > 1.5)
        ActionMoveToLocation( GetLocation( oTarget ), TRUE );
        //ActionMoveToLocation(GetLocation(GetObjectByTag(WpClosestAltarRight(OBJECT_SELF))), TRUE);
    return;
}

// Called when the NPC is spawned.
void T1_Spawn()
{
    string sTarget = WpClosestAltarRight(OBJECT_SELF);
    if (IsWizard(OBJECT_SELF))
        sTarget = WpClosestAltarLeft(OBJECT_SELF); // Send the Wizards elsewhere

    SetLocalString( OBJECT_SELF, "TARGET", sTarget );
    ActionMoveToLocation( GetLocation( GetObjectByTag( GetLocalString(OBJECT_SELF, "TARGET") ) ), TRUE );

    // Set colors (doesn't work in Initialize function for some reason, so it's here.)
    int nColourRed = 0xFF0000FF;
    int nColourBlue = 0x0000FFFF;
    int nColourDarkRed = 0x9B0000FF;
    int nColourGray = 0xFF808080;
    int nColourWhite = 0xFFFFFFFF;
    int nColourDarkBlue = 0x00009BFF;

    SetLocalInt(GetObjectByTag("WP_" + MyColor() + "_4"), "COLOR_RED", nColourRed);
    SetLocalInt(GetObjectByTag("WP_" + MyColor() + "_4"), "COLOR_BLUE", nColourBlue);
    SetLocalInt(GetObjectByTag("WP_" + MyColor() + "_4"), "COLOR_DARK_RED", nColourDarkRed);
    SetLocalInt(GetObjectByTag("WP_" + MyColor() + "_4"), "COLOR_DARK_BLUE", nColourDarkBlue);
    SetLocalInt(GetObjectByTag("WP_" + MyColor() + "_4"), "COLOR_WHITE", nColourWhite);
}


// // Called when the NPC is actively being attacked.
// void T1_In_Battle()
// {
//     if (IsWizard(OBJECT_SELF)){
//         int nIndex;
//         for (nIndex = 1; nIndex <= 3; nIndex++)
//             {
//                 SpeakString("AAAAAAa! I wanna leave!", TALKVOLUME_SHOUT);
//                 TalentFlee(GetLastAttacker(OBJECT_SELF));
//             }
//     }
// }

// This function is called when certain events take place, after the standard
// NWN handling of these events has been performed.
void T1_UserDefined( int Event )
{
    switch (Event)
    {
        // The NPC has just been attacked.
        case EVENT_ATTACKED:
            break;

        // The NPC was damaged.
        case EVENT_DAMAGED:
            break;

        // At the end of one round of combat.
        case EVENT_END_COMBAT_ROUND:
            //T1_In_Battle();
            break;

        // Every heartbeat (i.e., every six seconds).
        case EVENT_HEARTBEAT:
            T1_HeartBeat();
            break;

        // Whenever the NPC perceives a new creature.
        case EVENT_PERCEIVE:
            break;

        // When a spell is cast at the NPC.
        case EVENT_SPELL_CAST_AT:
            break;

        // Whenever the NPC's inventory is disturbed.
        case EVENT_DISTURBED:
            break;

        // Whenever the NPC dies.
        case EVENT_DEATH:
            SpeakString("Wilhelm scream");
            break;

        // When the NPC has just been spawned.
        case EVENT_SPAWN:
            T1_Spawn();
            break;

        // Called once for each team per 6 seconds.
        // Note: You cannot use SpeakString() in this event as the caller is not an object.
        // Instead, if you want to show a text above a create oPC, use FloatingTextStringOnCreature().
        case EVENT_AREA:
            //object oPC = GetFirstPC();
            //FloatingTextStringOnCreature( "T1 Area Event", oPC, FALSE );
            break;
    }

    return;
}

// Called when the fight starts, just before the initial spawning.
void T1_Initialize( string sColor )
{
    SetTeamName( sColor, "Team 1-" + GetStringLowerCase( sColor ) );

}
