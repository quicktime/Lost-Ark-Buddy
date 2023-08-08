import 'package:lost_ark_buddy/honing_material_mbo.dart';

class Gear {
  Gear({
    required this.tier,
    required this.type,
    required this.iLevel,
    required this.requiredXp,
    required this.feedSilver,
    required this.basicSuccessRate,
    required this.crystalsPerHone,
    required this.leapstonesPerHone,
    required this.fusionMaterialsPerHone,
    required this.shardsPerHone,
    required this.goldPerHone,
    required this.silverPerHone,
    required this.crystals,
    required this.leapstones,
    required this.fusionMaterials,
    required this.shards,
  });

  Tier tier;
  Type type;
  int iLevel;
  int requiredXp;
  int feedSilver;
  double basicSuccessRate;
  int crystalsPerHone;
  int leapstonesPerHone;
  int fusionMaterialsPerHone;
  int shardsPerHone;
  int goldPerHone;
  int silverPerHone;
  HoningMaterial crystals;
  HoningMaterial leapstones;
  HoningMaterial fusionMaterials;
  HoningMaterial shards;
}

enum Tier {
  tierOne,
  tierTwo,
  tierThree,
  leg,
  relic,
  brel,
  ancient,
  akkan,
}

enum Type {
  armor,
  weapon,
}
