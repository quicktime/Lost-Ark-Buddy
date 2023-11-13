import 'dart:math';

import 'package:lost_ark_buddy/gear.dart';
import 'package:lost_ark_buddy/honing_material.dart';
import 'package:lost_ark_buddy/honing_material_mbo.dart';
import 'package:lost_ark_buddy/lostarkmarket.dart';
import 'package:lost_ark_buddy/upgrade.dart';

int averageHones(double basicSuccessRate) {
  var counter = 1;
  var cumulativeSuccessRate = 0.0;
  var successRate = basicSuccessRate;
  var prevCumulativeFailRate = 1 - basicSuccessRate;

  while (cumulativeSuccessRate < .6) {
    successRate =
        min(successRate + basicSuccessRate * 0.1, basicSuccessRate * 2);
    var failRate = 1 - successRate;
    var cumulativeFailRate = prevCumulativeFailRate * failRate;
    prevCumulativeFailRate = cumulativeFailRate;
    if (failRate < .6) {
      return counter++;
    }
    cumulativeSuccessRate = 1 - cumulativeFailRate;
    counter++;
  }

  return counter;
}

int totalGoldCost(Gear gear) {
  List<int> mats = totalMats(gear);
  var costOfGold = mats[1];
  var costOfShards = mats[2] / 500 * gear.shards.cost!;
  var costOfFusions = mats[3] * gear.fusionMaterials.cost!;
  var costOfCrystals = mats[4] / 10 * gear.crystals.cost!;
  var costOfLeaps = mats[5] * gear.leapstones.cost!;

  return (costOfGold +
          costOfShards +
          costOfFusions +
          costOfCrystals +
          costOfLeaps)
      .ceil();
}

int costOfMats(double? cost, int matsPerHone, int numberOfAttempts) {
  return (cost! * amountOfMats(matsPerHone, numberOfAttempts)).ceil();
}

List<int> totalMats(Gear gear) {
  var numOfHones = averageHones(gear.basicSuccessRate);
  var amountOfSilver =
      amountOfMats(gear.silverPerHone, numOfHones) + (gear.feedSilver);
  var amountOfGold = amountOfMats(gear.goldPerHone, numOfHones);
  var amountOfShards =
      amountOfMats(gear.shardsPerHone, numOfHones) + gear.requiredXp;
  var amountOfFusionMaterials =
      amountOfMats(gear.fusionMaterialsPerHone, numOfHones);
  var amountOfCrystals = amountOfMats(gear.crystalsPerHone, numOfHones);
  var amountOfLeapstones = amountOfMats(gear.leapstonesPerHone, numOfHones);
  return [
    amountOfSilver,
    amountOfGold,
    amountOfShards,
    amountOfFusionMaterials,
    amountOfCrystals,
    amountOfLeapstones
  ];
}

int amountOfMats(int matsPerHone, int numberOfAttempts) {
  return (matsPerHone * numberOfAttempts.ceil());
}

void updateGearCosts(List<Items> items) {
  for (HoningMaterial honingMaterial in honingMaterials) {
    print(honingMaterial.id);
    var item = items.where((item) => (item.id.contains(honingMaterial.id)));
    honingMaterial.setCost(item.first.avgPrice);
    print(honingMaterial.cost);
  }
}

void updateUpgradeCosts(Gear gear) {
  Gear? upgraded = gear.upgrade;
  Upgrade upgrade = Upgrade(gear: upgraded);
  List<int> mats = totalMats(upgraded!);
  upgrade.setAmountOfSilver(mats[0]);
  upgrade.setAmountOfGold(mats[1]);
  upgrade.setAmountOfShards(mats[2]);
  upgrade.setAmountOfFusionMaterials(mats[3]);
  upgrade.setAmountOfCrystals(mats[4]);
  upgrade.setAmountOfLeapstones(mats[5]);
}
