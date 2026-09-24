#include "our_constants"

const string RESREF_RED = "plc_magicred";
const string RESREF_BLUE = "plc_magicblue";

void main()
{
    object oWP = GetObjectByTag( "WP_" + GetTag( OBJECT_SELF ) );
    if (!GetIsObjectValid( oWP ))
        return;

    int i = 1;
    int iRed = 0;
    int iBlue = 0;

    while (TRUE)
    {
        object oCreature = GetNearestCreature( CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMAN, oWP, i );
        if (!GetIsObjectValid( oCreature ))
            break;
        if (GetDistanceBetween( oCreature, oWP ) > 2.0)
            break;

        string sColor = GetLocalString( oCreature, "COLOR" );
        if (sColor == COLOR_BLUE)
            ++iBlue;
        else if (sColor == COLOR_RED)
            ++iRed;

        ++i;
    }

    string sColor = "";
    if (iRed > 0 && iBlue <= 0)
        sColor = COLOR_RED;
    else if (iRed <= 0 && iBlue > 0)
        sColor = COLOR_BLUE;
    SetLocalString( oWP, "OWNER", sColor );
    SetLocalString( OBJECT_SELF, "OWNER", sColor );

    object oSparkle = GetObjectByTag( "SPARKLE_" + GetTag( OBJECT_SELF ) );
    string sResRef = "";
    if (GetIsObjectValid( oSparkle ))
        sResRef = GetResRef( oSparkle );

    if (sResRef == RESREF_RED && sColor != COLOR_RED)
    {
        if (GetIsObjectValid( oSparkle ))
        {
            DestroyObject( oSparkle );
            sResRef = "";
        }
    }
    if (sResRef == RESREF_BLUE && sColor != COLOR_BLUE)
    {
        if (GetIsObjectValid( oSparkle ))
        {
            DestroyObject( oSparkle );
            sResRef = "";
        }
    }

    if (sResRef == "")
    {
        if (sColor == COLOR_RED)
            CreateObject( OBJECT_TYPE_PLACEABLE, RESREF_RED, GetLocation( oWP ), FALSE, "SPARKLE_" + GetTag( OBJECT_SELF ) );
        else if (sColor == COLOR_BLUE)
            CreateObject( OBJECT_TYPE_PLACEABLE, RESREF_BLUE, GetLocation( oWP ), FALSE, "SPARKLE_" + GetTag( OBJECT_SELF ) );
    }
}
