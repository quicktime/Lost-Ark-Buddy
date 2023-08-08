import 'package:flutter/material.dart';
import 'gear/akkan.dart' as akkan;
import 'math.dart' as math;

class CostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          TableCell(child: Text("<CHARACTER>")),
          TableCell(child: Text("<CURRENT ILVL>")),
          TableCell(child: Text("<WANTED ILVL>")),
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
          TableCell(
              child: Image.network(
                  "https://d3planner-assets.maxroll.gg/lost-ark/webp/bk_item_01_151.webp")),
          TableCell(child: Text(akkan.weapon21.iLevel.toString())),
          TableCell(child: Text("1520")), // TODO: roster.character.wantedILvl
          TableCell(child: Text("${math.totalMats(akkan.weapon21)[0]}")),
          TableCell(child: Text("${math.totalMats(akkan.weapon21)[1]}")),
          TableCell(child: Text("${math.totalMats(akkan.weapon21)[2]}")),
          TableCell(child: Text("${math.totalMats(akkan.weapon21)[3]}")),
          TableCell(child: Text("${math.totalMats(akkan.weapon21)[4]}")),
          TableCell(child: Text("${math.totalMats(akkan.weapon21)[5]}")),
        ])
      ],
    );
  }
}
