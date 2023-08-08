import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'cost_page.dart';
import 'lostarkmarket.dart';
import 'math.dart' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Lost Ark Buddy',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var items;
  final String url =
      "https://www.lostarkmarket.online/api/export-market-live/North%20America%20West?category=Enhancement%20Material";

  void importMarketdata() async {
    final response = await http.get(Uri.parse(url));
    items = Items.itemsFromJson(response.body);
    math.updateGearCosts(items);
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = PricesPage();
        break;
      case 1:
        page = CostPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class PricesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var items = appState.items;
    var theme = Theme.of(context);

    if (items == null) {
      return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'No Prices Listed. Please Refresh Market Data',
            style: theme.textTheme.displaySmall!
                .copyWith(color: theme.colorScheme.inversePrimary),
          ),
          SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              appState.importMarketdata();
            },
            icon: Icon(Icons.refresh),
            label: Text('Refresh Market Data'),
          ),
        ]),
      );
    } else {
      return ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                'Market Items',
                style: theme.textTheme.headline4,
              ),
            ),
          ),
          for (var item in items)
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                children: [
                  Text(item.name),
                  Spacer(),
                  Image.network(item.image),
                  SizedBox(width: 10),
                  Text(item.avgPrice.toString()),
                ],
              ),
            ),
        ],
      );
    }
  }
}



    // return Center(
    //   child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    //     Text(
    //       (math.totalGoldCost(relicArmor19) * 5 +
    //               math.totalGoldCost(relicWeapon19))
    //           .toString(),
    //       style: theme.textTheme.displaySmall!
    //           .copyWith(color: theme.colorScheme.inversePrimary),
    //     ),
    //   ]),
    // );

    // return ListView(children: [
    //   Padding(
    //     padding: const EdgeInsets.all(20),
    //     child: Center(
    //       child: Row(
    //         children: [
    //         // Roster.character.class,
    //         // Roster.character.currentILvl,
    //         // Roster.character.wantedILvl,
    //         // Silver image
    //         // Gold image
    //         // Shards image
    //         // Fusion mat image
    //         // Crystal image
    //         // Crystal2 image?
    //         // Leapstone image
    //         Text("Silver: ${math.totalMats(relicArmor19)[0]}"),
    //         Spacer(),
    //         Text("Gold: ${math.totalMats(relicArmor19)[1]}"),
    //         Spacer(),
    //         Text("Shards: ${math.totalMats(relicArmor19)[2]}"),
    //         Spacer(),
    //         Text("Fusions: ${math.totalMats(relicArmor19)[3]}"),
    //         Spacer(),
    //         Text("Crystals: ${math.totalMats(relicArmor19)[4]}"),
    //         Spacer(),
    //         Text("Leapstones: ${math.totalMats(relicArmor19)[5]}"),
    //       ],
    //     )),
    //   ),
    //   Center(
    //       child: Row(
    //     children: [
    //       // Hat image
    //       // Current gear level
    //       // Future gear level
    //       // Silver amount
    //       // Gold amount
    //       // Shard amount
    //       // Fusion mat amount
    //       // Crystal amount
    //       // Crystal2 amount?
    //       // Leapstone amount
    //     ],
    //   )),
    //   Center(
    //       child: Row(
    //     children: [
    //       // Shoulder image
    //       // Current gear level
    //       // Future gear level
    //       // Silver amount
    //       // Gold amount
    //       // Shard amount
    //       // Fusion mat amount
    //       // Crystal amount
    //       // Crystal2 amount?
    //       // Leapstone amount
    //     ],
    //   )),
    //   Center(
    //       child: Row(
    //     children: [
    //       // Chest image
    //       // Current gear level
    //       // Future gear level
    //       // Silver amount
    //       // Gold amount
    //       // Shard amount
    //       // Fusion mat amount
    //       // Crystal amount
    //       // Crystal2 amount?
    //       // Leapstone amount
    //     ],
    //   )),
    //   Center(
    //       child: Row(
    //     children: [
    //       // Pant image
    //       // Current gear level
    //       // Future gear level
    //       // Silver amount
    //       // Gold amount
    //       // Shard amount
    //       // Fusion mat amount
    //       // Crystal amount
    //       // Crystal2 amount?
    //       // Leapstone amount
    //     ],
    //   )),
    //   Center(
    //       child: Row(
    //     children: [
    //       // Gloves image
    //       // Current gear level
    //       // Future gear level
    //       // Silver amount
    //       // Gold amount
    //       // Shard amount
    //       // Fusion mat amount
    //       // Crystal amount
    //       // Crystal2 amount?
    //       // Leapstone amount
    //     ],
    //   )),
    //   Center(
    //       child: Row(
    //     children: [
    //       // Weapon image
    //       // Current gear level
    //       // Future gear level
    //       // Silver amount
    //       // Gold amount
    //       // Shard amount
    //       // Fusion mat amount
    //       // Crystal amount
    //       // Crystal2 amount?
    //       // Leapstone amount
    //     ],
    //   )),
    // ]);