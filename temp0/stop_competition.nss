#include "our_constants"

// Removes area effects
void RemoveEffects()
{
    object oTmp = GetFirstObjectInArea();

    while (GetIsObjectValid( oTmp ))
    {
        if (GetObjectType( oTmp ) == OBJECT_TYPE_AREA_OF_EFFECT)
            ActionDoCommand( DestroyObject( oTmp, 0.0 ) );
        oTmp = GetNextObjectInArea();
    }
}

void StopCompetition()
{
    effect eVis = EffectVisualEffect( VFX_IMP_FLAME_M );
    int i;
    int j;
    for (j = 0; j < 2; ++j)
    {
        string sColor = COLOR_RED;
        if (j == 1)
            sColor = COLOR_BLUE;
        string sLowerCaseColor = GetStringLowerCase( sColor );

        for (i = 1; i <= 7; ++i)
        {
            object oNPC = GetObjectByTag( "NPC_" + sColor + "_" + IntToString( i ) );
            if (GetIsObjectValid( oNPC ))
            {
                AssignCommand( oNPC, ClearAllActions() );
                ApplyEffectAtLocation( DURATION_TYPE_INSTANT, eVis, GetLocation( oNPC ) );
                DestroyObject( oNPC, 0.0 );
            }
        }

        object oOgre = GetObjectByTag( "OGRE_" + sColor );
        if (GetIsObjectValid( oOgre ))
        {
             AssignCommand( oOgre, ClearAllActions() );
             ApplyEffectAtLocation( DURATION_TYPE_INSTANT, eVis, GetLocation( oOgre ) );
             DestroyObject( oOgre, 0.0 );
        }
    }

    RemoveEffects();

    object oBrazier = GetObjectByTag( "BRAZIER" );
    if (!GetIsObjectValid( oBrazier ))
        return;

    PlayAnimation( ANIMATION_PLACEABLE_DEACTIVATE );
    SetLocalInt( oBrazier, "NW_L_AMION", 0 );
    effect eEffect = GetFirstEffect( oBrazier );
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        if (GetEffectType(eEffect) == EFFECT_TYPE_VISUALEFFECT)
            RemoveEffect( oBrazier, eEffect );
        eEffect = GetNextEffect( oBrazier );
    }

    string sScore = "The competition is over. The final scores are as follows: " +
        GetTeamName( COLOR_RED ) + ":" + IntToString( GetScore( COLOR_RED ) ) +
        " " + GetTeamName( COLOR_BLUE ) + ":" + IntToString( GetScore( COLOR_BLUE ) );
    AssignCommand( oBrazier, SpeakString( sScore, TALKVOLUME_SHOUT ) );
}
