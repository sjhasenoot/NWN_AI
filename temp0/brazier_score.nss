#include "our_constants"

void main()
{
    SpeakString( "The red team has scored " + IntToString( GetScore( COLOR_RED ) ) +
        " and the blue team has scored " + IntToString( GetScore( COLOR_BLUE ) ) + "." );
    return;
}
