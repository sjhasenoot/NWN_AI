#include "our_constants"

void SetAltarScore( string sColor, string sAltar, int iScore )
{
    object oAltar = GetObjectByTag( sAltar );
    if (!GetIsObjectValid( oAltar ))
        return;
    SetLocalInt( oAltar, "SCORE_" + sColor, iScore );
}

void main()
{
    SetAltarScore( COLOR_RED, ALTAR_RED_1, 0 );
    SetAltarScore( COLOR_BLUE, ALTAR_RED_1, 0 );
    SetAltarScore( COLOR_RED, ALTAR_RED_2, 0 );
    SetAltarScore( COLOR_BLUE, ALTAR_RED_2, 0 );
    SetAltarScore( COLOR_RED, ALTAR_BLUE_1, 0 );
    SetAltarScore( COLOR_BLUE, ALTAR_BLUE_1, 0 );
    SetAltarScore( COLOR_RED, ALTAR_BLUE_2, 0 );
    SetAltarScore( COLOR_BLUE, ALTAR_BLUE_2, 0 );
}
