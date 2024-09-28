import 'package:flu/Bloc/getData/get_data_bloc.dart';
import 'package:flu/Screens/Leads/new.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';

class Leads extends StatefulWidget {
  const Leads({super.key});

  @override
  State<Leads> createState() => _LeadsState();
}

class _LeadsState extends State<Leads> with TickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetDataBloc>(context).add(const GetDataEvent.get());
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              children: [
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 212, 211, 211),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Image( height: 10, image: AssetImage('assets/images/c.png')),
                    )),
                const SizedBox(
                  width: 10,
                ),
                const Text('Leads', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                const Spacer(),
                const badges.Badge(
                  badgeContent: Text('99', style: TextStyle(color: Colors.white)),
                  child: Icon(Icons.notifications_outlined, size: 30),
                ),
                const SizedBox(width: 20),
                const Icon(Icons.search, size: 30),
              ],
            ),
          ),
        ),
        TabBar(
          controller: tabController,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.red,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'New'),
            Tab(text: 'Follow Up'),
            Tab(text: 'Booked'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: const [
              Center(child: Text('All'),),
              New(),
              Center(child: Text('Follow'),),
              Center(child: Text('Booked'),),
            ],
          ),
        )
      ],
    );
  }
}