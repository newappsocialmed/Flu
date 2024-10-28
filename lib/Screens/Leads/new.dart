import 'package:flu/Bloc/getData/get_data_bloc.dart';
import 'package:flu/Screens/Leads/viewdetails/viewdetails.dart';
import 'package:scroll_edge_listener/scroll_edge_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:easy_refresh/easy_refresh.dart';

class New extends StatefulWidget {
  const New({super.key});

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetDataBloc>(context).add(const GetDataEvent.get());
  }

  @override
  Widget build(BuildContext context) {
    Future<void> getData() async{
      BlocProvider.of<GetDataBloc>(context).add(const GetDataEvent.get());
    }
    return BlocBuilder<GetDataBloc, GetDataState>(
      builder: (context, state) {
        return state.status == 'initial' || state.status == 'loading'?
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200]
                ),
              ),
              const CircularProgressIndicator(color: Colors.red,)
            ],
          ),
        )
        :state.status == 'completed' ? ScrollEdgeListener(
          edgeOffset: 500,
          listener: () {
            context.read<GetDataBloc>().add(const GetDataEvent.add());
          },
          child: EasyRefresh(
            header: const CupertinoHeader(),
            footer: const CupertinoFooter(),
            onRefresh: () {
              return getData();
            },
            onLoad: () {
              context.read<GetDataBloc>().add(const GetDataEvent.add());
            },
            child: SizedBox.expand(
                child: ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, ind) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      DateFormat('MMM').format(DateTime.parse(
                                          state.data[ind]['moving_on'])),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      DateFormat('dd').format(DateTime.parse(
                                          state.data[ind]['moving_on'])),
                                      style: const TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Text(
                                      DateFormat('HH:mm').format(DateTime.parse(
                                          state.data[ind]['moving_on'])),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 120, 119, 119)),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                      Row(
                                        children: [
                                          Text(
                                            state.data[ind]['from_address']
                                                    ['fromCity']
                                                .trim(),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            state.data[ind]['estimate_id'],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child:
                                            Text(state.data[ind]['moving_from']),
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/arrow.svg',
                                            height: 40,
                                            colorFilter: const ColorFilter.mode(
                                                Colors.red, BlendMode.srcIn),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                Icons.home,
                                                color: Colors.red,
                                              ),
                                              Text(state.data[ind]
                                                  ['property_size'])
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const ImageIcon(
                                                AssetImage(
                                                    'assets/images/boxes.png'),
                                                color: Colors.red,
                                              ),
                                              Text(
                                                  "${state.data[ind]['total_items']} items")
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const ImageIcon(
                                                AssetImage(
                                                    'assets/images/boxes.png'),
                                                color: Colors.red,
                                              ),
                                              Text(
                                                  "${state.data[ind]['items']['inventory'].length.toString()} boxes")
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const ImageIcon(
                                                AssetImage(
                                                    'assets/images/destination.png'),
                                                color: Colors.red,
                                              ),
                                              Text(state.data[ind]['distance'])
                                            ],
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            state.data[ind]['to_address']
                                                    ['toCity']
                                                .trim(),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Text(state.data[ind]['moving_to']),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            behavior: HitTestBehavior.opaque,
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) => Viewdetails(
                                                            ind: ind,
                                                          )));
                                            },
                                            child: Container(
                                              height: 35,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.34,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border:
                                                    Border.all(color: Colors.red),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'View Details',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            behavior: HitTestBehavior.opaque,
                                            onTap: () {},
                                            child: Container(
                                              height: 35,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.34,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                color: Colors.red,
                                                border:
                                                    Border.all(color: Colors.red),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Submit Quote',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ]))
                              ],
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
                    })),
          ),
        ): Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Data Fetching Failed :(', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      TextButton(
                        onPressed: (){
                          BlocProvider.of<GetDataBloc>(context).add(const GetDataEvent.get());
                        }, 
                        child: const Text('Reload', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),)
                      )
                    ],
                  ),
                );
      },
    );
  }
}
