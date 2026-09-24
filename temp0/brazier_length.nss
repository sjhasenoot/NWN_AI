void main()
{
    string sLen = "The competition is currently set to last ";
    int iLen = GetLocalInt( OBJECT_SELF, "COMPETITION_LENGTH" );

    if (iLen <= 0)
        sLen += "indefinitely.";
    else if (iLen == 3600)
        sLen += "1 hour.";
    else if (iLen > 3600)
        sLen += FloatToString( IntToFloat( iLen ) / 3600, 1, 1 ) + " hours.";
    else
        sLen += FloatToString( IntToFloat( iLen ) / 60, 2, 0 ) + " minutes.";

    SpeakString( sLen );

    return;
}
