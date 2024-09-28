import 'package:flu/Bloc/getData/get_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 12),
                    child: Column(
                      children: [
                        SizedBox(
                          child: Row(
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
                              Column(
                                children: [
                                  Row(
                                    children: [Text('Bangalore')],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Divider(
                          height: 1,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  );
                }));
      },
    );
  }
}
