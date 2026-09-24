void main()
{
    ClearAllActions();
    effect eDeath = EffectDeath( TRUE, TRUE );
    ApplyEffectToObject( DURATION_TYPE_TEMPORARY, eDeath, OBJECT_SELF, 10.0 );
}
