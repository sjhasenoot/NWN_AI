#include "games_and_ai"
#include "stop_competition"

void UpdateScore( string sAltar )
{
    string sClaimer = ClaimerOf( sAltar );
    if (sClaimer == "")
        return;

    int iPoints = 1;
    string sDoubler = ClaimerOf( DOUBLER );
    if (sClaimer == sDoubler)
        iPoints = 2;

    object oAltar = GetObjectByTag( sAltar );
    if (!GetIsObjectValid( oAltar ))
        return;

    int iScore = GetLocalInt( oAltar, "SCORE_" + sClaimer );
    iScore = iScore + iPoints;
    SetLocalInt( oAltar, "SCORE_" + sClaimer, iScore );
}

void UpdateCircle( string sCircle, string sColor )
{
    // Waypoint is the location of the circle
    object oWP = GetObjectByTag( sCircle );
    if (!GetIsObjectValid( oWP ))
        return;

    object oCircle = GetObjectByTag( "SUMMONING_CIRCLE_" + sColor );
    if (!GetIsObjectValid( oCircle ))
        return;

    // Opponent color is the color of the ogre that may spawn
    string sOpponentColor = COLOR_RED;
    if (sColor == COLOR_RED)
        sOpponentColor = COLOR_BLUE;
    string sLowerCaseColor = GetStringLowerCase( sOpponentColor );

    // If the ogre already exists, skip it
    object oOgre = GetObjectByTag( "OGRE_" + sOpponentColor );
    if (GetIsObjectValid( oOgre ))
        return;

    // Check if there are members of the color of the circle present
    // near the circle; if so, the timer will be reset
    int i = 1;
    int iCount = 0;
    while (TRUE)
    {
        object oCreature = GetNearestCreature( CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMAN, oWP, i );
        if (!GetIsObjectValid( oCreature ))
            break;
        if (GetDistanceBetween( oCreature, oWP ) > 2.0)
            break;
        if (sColor == GetLocalString( oCreature, "COLOR" ))
        {
            ++iCount;
            break;
        }
        ++i;
    }

    // Get the time and reset if needed
    int iTimer = GetLocalInt( oWP, "TIMER" ) + 1;
    if (iCount > 0)
        iTimer = 0;

    // Message the timer
    if (iTimer > 0 && iTimer <= 5)
    {
        string sMessage = IntToString( (6 - iTimer)*6 ) +
            " seconds to spawning " + sLowerCaseColor + " ogre";
        AssignCommand( oCircle, SpeakString( sMessage, TALKVOLUME_SHOUT ) );
    }

    // If timer exceeds 5, spawn the ogre and reset the timer
    if (iTimer > 5)
    {
        string sMessage = "Spawning " + sLowerCaseColor + " ogre";
        AssignCommand( oCircle, SpeakString( sMessage, TALKVOLUME_SHOUT ) );
        effect eCreate = EffectVisualEffect( VFX_FNF_SUMMON_UNDEAD );
        location oLocation = GetLocation( oWP );
        ApplyEffectAtLocation( DURATION_TYPE_TEMPORARY, eCreate, oLocation );
        object oNew = CreateObject( OBJECT_TYPE_CREATURE, "ogre" + sLowerCaseColor, oLocation );
        iTimer = 0;
    }
    SetLocalInt( oWP, "TIMER", iTimer );
}

void main()
{
    object oBrazier = GetObjectByTag( "BRAZIER" );
    if (!GetIsObjectValid( oBrazier ))
        return;

    if (!GetLocalInt( oBrazier, "NW_L_AMION" ))
        return;

    int iCompetitionLength = GetLocalInt( oBrazier, "COMPETITION_LENGTH" );
    if (iCompetitionLength > 0)
    {
        int iTimer = GetLocalInt( oBrazier, "TIMER" );
        iTimer += 6;
        if (iTimer >= iCompetitionLength)
        {
            StopCompetition();
            return;
        }
        SetLocalInt( oBrazier, "TIMER", iTimer );
    }

    effect eCreate = EffectVisualEffect( VFX_FNF_SUMMON_UNDEAD );
    effect eParalyze = EffectParalyze();

    int i;
    int j;
    for (i = 1; i <= 7; ++i)
    {
        for (j = 0; j < 2; ++j)
        {
            string sColor = COLOR_RED;
            if (j == 1)
                sColor = COLOR_BLUE;
            string sLowerCaseColor = GetStringLowerCase( sColor );

            object oNPC = GetObjectByTag( "NPC_" + sColor + "_" + IntToString( i ) );
            if (!GetIsObjectValid( oNPC ))
            {
                object oWP = GetObjectByTag( "WP_" + sColor + "_" + IntToString( i ) );
                if (GetIsObjectValid( oWP ))
                {
                    location oLocation = GetLocation( oWP );
                    ApplyEffectAtLocation( DURATION_TYPE_TEMPORARY, eCreate, oLocation );
                    object oNew = CreateObject( OBJECT_TYPE_CREATURE, "npc" + sLowerCaseColor + IntToString( i ), oLocation );
                    ApplyEffectToObject( DURATION_TYPE_TEMPORARY, eParalyze, oNew, 10.0 );
                }
            }
        }
    }

    SpeakString( "HEY THERE! I WORK", TALKVOLUME_SHOUT )

    UpdateScore( ALTAR_RED_1 );
    UpdateScore( ALTAR_RED_2 );
    UpdateScore( ALTAR_BLUE_1 );
    UpdateScore( ALTAR_BLUE_2 );

    UpdateCircle( CIRCLE_RED, COLOR_RED );
    UpdateCircle( CIRCLE_BLUE, COLOR_BLUE );

    string sScore = GetTeamName( COLOR_RED ) + ":" + IntToString( GetScore( COLOR_RED ) ) +
        " " + GetTeamName( COLOR_BLUE ) + ":" + IntToString( GetScore( COLOR_BLUE ) );
    AssignCommand( oBrazier, SpeakString( sScore, TALKVOLUME_SHOUT ) );

    ActivateArea(); // Activate area events for competing teams.
}
