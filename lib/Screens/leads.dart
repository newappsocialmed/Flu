import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class Leads extends StatelessWidget {
  const Leads({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.08,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 212, 211, 211),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image(
                      height: 10,
                      image: AssetImage('assets/images/c.png')
                    ),
                  )
                ),
                const SizedBox(width: 10,),
                const Text('Leads', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                const Spacer(),
                const badges.Badge(
                  badgeContent: Text('99'),
                  child: Icon(Icons.notifications_outlined, size: 30,),
                ),
                const SizedBox(width: 15,),
                const Icon(Icons.search, size: 30,),
              ],
            ),
          ),
        )
      ],
    );
  }
}