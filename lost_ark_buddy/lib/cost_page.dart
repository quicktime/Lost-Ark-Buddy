import 'package:flutter/material.dart';
import 'gear/akkan.dart' as akkan;
import 'math.dart' as math;

class CostPage extends StatelessWidget {
  var akkan21WeaponMats = math.totalMats(akkan.weapon21);
  var akkan22WeaponMats = math.totalMats(akkan.weapon22);
  var akkan23WeaponMats = math.totalMats(akkan.weapon23);
  var akkan24WeaponMats = math.totalMats(akkan.weapon24);
  var akkan25WeaponMats = math.totalMats(akkan.weapon25);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        border: TableBorder.all(),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(children: [
            Center(child: Text("<ITEM>")),
            Center(child: Text("<CURRENT ILVL>")),
            Center(child: Text("<WANTED ILVL>")),
            TableCell(
                child: Image.network(
                    "https://d3planner-assets.maxroll.gg/lost-ark/webp/etc_14.webp")),
            TableCell(
                child: Image.network(
                    "https://d3planner-assets.maxroll.gg/lost-ark/webp/money_4.webp")),
            TableCell(
                child: Image.network(
                    "https://d3planner-assets.maxroll.gg/lost-ark/webp/money_13.webp")),
            TableCell(
                child: Image.network(
                    "https://d3planner-assets.maxroll.gg/lost-ark/webp/use_11_29.webp")),
            TableCell(
                child: Image.network(
                    "https://d3planner-assets.maxroll.gg/lost-ark/webp/use_11_15.webp")),
            TableCell(
                child: Image.network(
                    "https://d3planner-assets.maxroll.gg/lost-ark/webp/use_11_17.webp")),
          ]),
          TableRow(children: [
            Center(child: Text("TOTAL")),
            Center(child: Text("20")),
            Center(child: Text("25")),
            Center(
                child: Text(
                    "${akkan21WeaponMats[0] + akkan22WeaponMats[0] + akkan23WeaponMats[0] + akkan24WeaponMats[0] + akkan25WeaponMats[0]}")),
            Center(
                child: Text(
                    "${akkan21WeaponMats[1] + akkan22WeaponMats[1] + akkan23WeaponMats[1] + akkan24WeaponMats[1] + akkan25WeaponMats[2]}")),
            Center(
                child: Text(
                    "${akkan21WeaponMats[2] + akkan22WeaponMats[2] + akkan23WeaponMats[2] + akkan24WeaponMats[2] + akkan25WeaponMats[2]}")),
            Center(
                child: Text(
                    "${akkan21WeaponMats[3] + akkan22WeaponMats[3] + akkan23WeaponMats[3] + akkan24WeaponMats[3] + akkan25WeaponMats[3]}")),
            Center(
                child: Text(
                    "${akkan21WeaponMats[4] + akkan22WeaponMats[4] + akkan23WeaponMats[4] + akkan24WeaponMats[4] + akkan25WeaponMats[4]}")),
            Center(
                child: Text(
                    "${akkan21WeaponMats[5] + akkan22WeaponMats[5] + akkan23WeaponMats[5] + akkan24WeaponMats[5] + akkan25WeaponMats[5]}")),
          ]),
          TableRow(children: [
            TableCell(
                child: Image.network(
                    "https://d3planner-assets.maxroll.gg/lost-ark/webp/bk_item_01_186.webp")),
            Center(child: Text("20")),
            Center(child: Text("21")),
            Center(child: Text("${math.totalMats(akkan.weapon21)[0]}")),
            Center(child: Text("${math.totalMats(akkan.weapon21)[1]}")),
            Center(child: Text("${math.totalMats(akkan.weapon21)[2]}")),
            Center(child: Text("${math.totalMats(akkan.weapon21)[3]}")),
            Center(child: Text("${math.totalMats(akkan.weapon21)[4]}")),
            Center(child: Text("${math.totalMats(akkan.weapon21)[5]}")),
          ]),
          TableRow(children: [
            TableCell(
                child: Image.network(
                    "https://d3planner-assets.maxroll.gg/lost-ark/webp/bk_item_01_186.webp")),
            Center(child: Text(akkan.weapon20.iLevel.toString())),
            Center(child: Text(akkan.weapon21.iLevel.toString())),
            Center(child: Text("${math.totalMats(akkan.weapon22)[0]}")),
            Center(child: Text("${math.totalMats(akkan.weapon22)[1]}")),
            Center(child: Text("${math.totalMats(akkan.weapon22)[2]}")),
            Center(child: Text("${math.totalMats(akkan.weapon22)[3]}")),
            Center(child: Text("${math.totalMats(akkan.weapon22)[4]}")),
            Center(child: Text("${math.totalMats(akkan.weapon22)[5]}")),
          ]),
          TableRow(children: [
            TableCell(
                child: Image.network(
                    "https://d3planner-assets.maxroll.gg/lost-ark/webp/bk_item_01_186.webp")),
            Center(child: Text(akkan.weapon20.iLevel.toString())),
            Center(child: Text(akkan.weapon21.iLevel.toString())),
            Center(child: Text("${math.totalMats(akkan.weapon23)[0]}")),
            Center(child: Text("${math.totalMats(akkan.weapon23)[1]}")),
            Center(child: Text("${math.totalMats(akkan.weapon23)[2]}")),
            Center(child: Text("${math.totalMats(akkan.weapon23)[3]}")),
            Center(child: Text("${math.totalMats(akkan.weapon23)[4]}")),
            Center(child: Text("${math.totalMats(akkan.weapon23)[5]}")),
          ]),
          TableRow(children: [
            TableCell(
                child: Image.network(
                    "https://d3planner-assets.maxroll.gg/lost-ark/webp/bk_item_01_186.webp")),
            Center(child: Text(akkan.weapon20.iLevel.toString())),
            Center(child: Text(akkan.weapon21.iLevel.toString())),
            Center(child: Text("${math.totalMats(akkan.weapon24)[0]}")),
            Center(child: Text("${math.totalMats(akkan.weapon24)[1]}")),
            Center(child: Text("${math.totalMats(akkan.weapon24)[2]}")),
            Center(child: Text("${math.totalMats(akkan.weapon24)[3]}")),
            Center(child: Text("${math.totalMats(akkan.weapon24)[4]}")),
            Center(child: Text("${math.totalMats(akkan.weapon24)[5]}")),
          ]),
          TableRow(children: [
            TableCell(
                child: Image.network(
                    "https://d3planner-assets.maxroll.gg/lost-ark/webp/bk_item_01_186.webp")),
            Center(child: Text(akkan.weapon20.iLevel.toString())),
            Center(child: Text(akkan.weapon21.iLevel.toString())),
            Center(child: Text("${math.totalMats(akkan.weapon25)[0]}")),
            Center(child: Text("${math.totalMats(akkan.weapon25)[1]}")),
            Center(child: Text("${math.totalMats(akkan.weapon25)[2]}")),
            Center(child: Text("${math.totalMats(akkan.weapon25)[3]}")),
            Center(child: Text("${math.totalMats(akkan.weapon25)[4]}")),
            Center(child: Text("${math.totalMats(akkan.weapon25)[5]}")),
          ])
        ],
      ),
    );
  }
}
