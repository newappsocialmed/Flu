import 'package:flu/Bloc/getData/get_data_bloc.dart';
import 'package:flu/Screens/Leads/viewdetails/viewdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class New extends StatelessWidget {
  const New({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDataBloc, GetDataState>(
      builder: (context, state) {
        return SizedBox.expand(
            child: ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, ind) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    DateFormat('MMM').format(DateTime.parse(state.data[ind]['moving_on'])),
                                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                                  ),
                                  Text(
                                    DateFormat('dd').format(DateTime.parse(state.data[ind]['moving_on'])),
                                    style: const TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.red,),
                                  ),
                                  Text(
                                    DateFormat('HH:mm').format(DateTime.parse(state.data[ind]['moving_on'])),
                                    style: const TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(255, 120, 119, 119)),
                                  )
                                ],
                              ),
                              const SizedBox(width: 15,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*0.77,
                                    child: Row(
                                      children: [
                                        Text(state.data[ind]['from_address']['fromCity'].trim(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                                        const Spacer(),
                                        Text(state.data[ind]['estimate_id'], style: const TextStyle(fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*0.7,
                                    child: Text(state.data[ind]['moving_from'], style: const TextStyle(color: Colors.grey),),
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/arrow.svg',
                                        height: 40,
                                        clipBehavior: Clip.none,
                                        colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*0.76,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Icon(Icons.home, color: Colors.red,),
                                                Text(state.data[ind]['property_size'])
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const ImageIcon(AssetImage('assets/images/boxes.png'), color: Colors.red,),
                                                Text("${state.data[ind]['total_items']} items")
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const ImageIcon(AssetImage('assets/images/boxes.png'), color: Colors.red,),
                                                Text("${state.data[ind]['total_items']} boxes")
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const ImageIcon(AssetImage('assets/images/destination.png'), color: Colors.red,),
                                                Text(state.data[ind]['distance'])
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Text(state.data[ind]['to_address']['toCity'].trim(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*0.7,
                                    child: Text(state.data[ind]['moving_to'], style: const TextStyle(color: Colors.grey),),
                                  ),
                                  const SizedBox(height: 10,),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*0.77,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Viewdetails()));
                                          },
                                          child: Container(
                                            height: 35,
                                            width: MediaQuery.of(context).size.width*0.36,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.red)
                                            ),
                                            child: const Center(
                                              child: Text('View Details', style: TextStyle(fontSize: 13, color: Colors.red),),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            
                                          },
                                          child: Container(
                                            height: 35,
                                            width: MediaQuery.of(context).size.width*0.36,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              border: Border.all(color: Colors.red)
                                            ),
                                            child: const Center(child: Text('Submit Quote', style: TextStyle(fontSize: 13, color: Colors.white),),),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          height: 1,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  );
                }
              )
            );
      },
    );
  }
}
