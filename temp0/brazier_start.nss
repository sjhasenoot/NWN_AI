#include "games_and_ai"

void main()
{
    object oSelf = OBJECT_SELF;
    PlayAnimation( ANIMATION_PLACEABLE_ACTIVATE );
    SetLocalInt( OBJECT_SELF, "NW_L_AMION", 1 );
    effect eLight = EffectVisualEffect( VFX_DUR_LIGHT_YELLOW_20 );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eLight, oSelf );

    ActivateInitialization( COLOR_RED );
    ActivateInitialization( COLOR_BLUE );

    object oBrazier = GetObjectByTag( "BRAZIER" );
    if (!GetIsObjectValid( oBrazier ))
        return;

    SetLocalInt( oBrazier, "TIMER", 0 );
}
