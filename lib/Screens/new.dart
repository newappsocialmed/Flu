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
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(DateFormat('MMM').format(DateTime.parse(state.data[ind]['moving_on'])))
                        ],
                      ),
                      const Divider(
                        height: 1,
                        color: Colors.grey,
                      )
                    ],
                  );
                }));
      },
    );
  }
}
