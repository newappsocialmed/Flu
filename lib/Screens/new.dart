import 'package:flutter/material.dart';

class New extends StatelessWidget {
  const New({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.5,
                color: Colors.black,
              ),
              const SizedBox(height: 15,)
            ],
          );
        })
    );
  }
}