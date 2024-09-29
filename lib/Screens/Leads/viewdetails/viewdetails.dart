import 'package:flu/Screens/Leads/viewdetails/Items/floorinfo.dart';
import 'package:flu/Screens/Leads/viewdetails/Items/items.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class Viewdetails extends StatefulWidget {
  final int ind;
  const Viewdetails({super.key, required this.ind});

  @override
  State<Viewdetails> createState() => _ViewdetailsState();
}

class _ViewdetailsState extends State<Viewdetails>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.14,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18, top: 0, right: 15),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                        const Text(
                          'New Leads',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        const badges.Badge(
                          badgeContent:
                              Text('99', style: TextStyle(color: Colors.white)),
                          child: Icon(Icons.notifications_outlined, size: 30),
                        ),
                        const SizedBox(width: 20),
                        const Icon(Icons.search, size: 30),
                      ],
                    ),
                  ),
                  TabBar(
                    controller: tabController,
                    labelColor: Colors.red,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.red,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Tab(text: 'Items'),
                      Tab(text: 'Floor Info'),
                      Tab(text: 'Send Quote'),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  Items(
                    ind: widget.ind,
                  ),
                  FloorInfo(
                    ind: widget.ind,
                  ),
                  const Center(
                    child: Text('Send Quote'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
