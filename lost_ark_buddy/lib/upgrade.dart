import 'package:lost_ark_buddy/gear.dart';

import 'math.dart';

class Upgrade {
  Upgrade({
    required this.gear,
    this.amountOfSilver,
    this.amountOfGold,
    this.amountOfShards,
    this.amountOfFusionMaterials,
    this.amountOfLeapstones,
  });

  Gear? gear;
  int? amountOfSilver;
  int? amountOfGold;
  int? amountOfShards;
  int? amountOfFusionMaterials;
  int? amountOfCrystals;
  int? amountOfLeapstones;

  void setAmountOfSilver(int silver) {
    amountOfSilver = silver;
  }

  void setAmountOfGold(int gold) {
    amountOfGold = gold;
  }

  void setAmountOfShards(int shards) {
    amountOfShards = shards;
  }

  void setAmountOfFusionMaterials(int fusionMats) {
    amountOfFusionMaterials = fusionMats;
  }

  void setAmountOfCrystals(int crystals) {
    amountOfCrystals = crystals;
  }

  void setAmountOfLeapstones(int leapstones) {
    amountOfLeapstones = leapstones;
  }
}
