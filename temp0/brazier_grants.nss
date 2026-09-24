void main()
{
    object oCreature = GetPCSpeaker();
    effect eImmunity = EffectSpellImmunity( SPELL_ALL_SPELLS );
    effect eSkill = EffectSkillIncrease( SKILL_SPELLCRAFT, 50 );
    effect eVis = EffectVisualEffect( VFX_IMP_RESTORATION_GREATER );
    effect eGlobe = EffectVisualEffect( VFX_DUR_GHOSTLY_VISAGE );
    effect eMove = EffectMovementSpeedIncrease( 99 );
    effect eLink = EffectLinkEffects( eGlobe, eImmunity );
    effect eHaste = EffectHaste();
    effect eInvis = EffectInvisibility( INVISIBILITY_TYPE_IMPROVED );

    effect eParalysis = EffectImmunity( IMMUNITY_TYPE_PARALYSIS );
    effect eFear = EffectImmunity( IMMUNITY_TYPE_FEAR );
    effect eEntangle = EffectImmunity( IMMUNITY_TYPE_ENTANGLE );
    effect eKnockdown = EffectImmunity( IMMUNITY_TYPE_KNOCKDOWN );
    effect eAcid = EffectDamageImmunityIncrease( DAMAGE_TYPE_ACID, 100 );
    effect eBase = EffectDamageImmunityIncrease( DAMAGE_TYPE_BASE_WEAPON, 100 );
    effect eBludg = EffectDamageImmunityIncrease( DAMAGE_TYPE_BLUDGEONING, 100 );
    effect eCold = EffectDamageImmunityIncrease( DAMAGE_TYPE_COLD, 100 );
    effect eDiv = EffectDamageImmunityIncrease( DAMAGE_TYPE_DIVINE, 100 );
    effect eElec = EffectDamageImmunityIncrease( DAMAGE_TYPE_ELECTRICAL, 100 );
    effect eFire = EffectDamageImmunityIncrease( DAMAGE_TYPE_FIRE, 100 );
    effect eMagic = EffectDamageImmunityIncrease( DAMAGE_TYPE_MAGICAL, 100 );
    effect eNega = EffectDamageImmunityIncrease( DAMAGE_TYPE_NEGATIVE, 100 );
    effect ePierce = EffectDamageImmunityIncrease( DAMAGE_TYPE_PIERCING, 100 );
    effect ePosi = EffectDamageImmunityIncrease( DAMAGE_TYPE_POSITIVE, 100 );
    effect eSlash = EffectDamageImmunityIncrease( DAMAGE_TYPE_SLASHING, 100 );
    effect eSonic = EffectDamageImmunityIncrease( DAMAGE_TYPE_SONIC, 100 );
    effect eHP = EffectTemporaryHitpoints( 1000000 );

    effect eSpellcraft = EffectSkillIncrease( SKILL_SPELLCRAFT, 100 );
    effect eLore = EffectSkillIncrease( SKILL_LORE, 100 );

    ApplyEffectAtLocation( DURATION_TYPE_TEMPORARY, eVis, GetLocation( oCreature ) );

    effect eTmp = GetFirstEffect( oCreature );
    while (GetIsEffectValid( eTmp ))
    {
        if (GetEffectCreator( eTmp ) == OBJECT_SELF)
            RemoveEffect( oCreature, eTmp );
        eTmp = GetNextEffect( oCreature );
    }

    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eSkill, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eParalysis, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eFear, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eEntangle, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eKnockdown, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eMove, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eHaste, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eAcid, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eBase, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eBludg, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eCold, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eDiv, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eElec, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eFire, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eMagic, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eNega, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, ePierce, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, ePosi, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eSlash, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eSonic, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eInvis, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eLink, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eHP, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eSpellcraft, oCreature );
    ApplyEffectToObject( DURATION_TYPE_PERMANENT, eLore, oCreature );
}
