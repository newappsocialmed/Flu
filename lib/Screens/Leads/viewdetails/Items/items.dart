import 'package:flu/Bloc/getData/get_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Items extends StatelessWidget {
  final int ind;
  const Items({super.key, required this.ind});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDataBloc, GetDataState>(
      builder: (context, state) {
        var invent = state.data[ind]['items']['inventory'];
        var custom = state.data[ind]['items']['customItems'];
        return ListView.builder(
            itemCount: invent.length + 1,
            itemBuilder: (context, ind) {
              if (ind == invent.length) {
                return custom['items'].length > 0
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 15),
                            child: CustomExpansionTile(
                              isExpanded: ind == 0,
                              title: const Text('Custom Items',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              trailing: const Icon(Icons.keyboard_arrow_up),
                              backgroundColor: Colors.grey[300],
                              children: <Widget>[
                                for (int i = 0; i < custom['items'].length; i++)
                                  Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          custom['items'][i]['item_name'],
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              custom['items'][i]
                                                  ['item_description'],
                                              style: const TextStyle(
                                                  color: Colors.grey),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(children: [
                                              Text(
                                                "L: ${custom['items'][i]['item_length']} ft",
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                  "W: ${custom['items'][i]['item_width']} ft",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                  "H: ${custom['items'][i]['item_height']} ft",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ])
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Divider(),
                                      )
                                    ],
                                  )
                              ],
                            ),
                          ),
                        ],
                      )
                    : Container();
              } else {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 15),
                      child: CustomExpansionTile(
                        isExpanded: ind == 0,
                        title: Text(invent[ind]['displayName'],
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        trailing: const Icon(Icons.keyboard_arrow_up),
                        backgroundColor: Colors.grey[300],
                        children: <Widget>[
                          for (int i = 0;
                              i < invent[ind]['category'].length; i++)
                            Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    invent[ind]['category'][i]['displayName'],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                for (int j = 0;
                                    j <
                                        invent[ind]['category'][i]['items']
                                            .length;
                                    j++)
                                  if (invent[ind]['category'][i]['items'][j]
                                          ['qty'] !=
                                      0)
                                    ListTile(
                                      title: Text(
                                        invent[ind]['category'][i]['items'][j]
                                            ['displayName'],
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        (invent[ind]['category'][i]['items'][j]
                                                    ['typeOptions'] !=
                                                null)
                                            ? invent[ind]['category'][i]
                                                    ['items'][j]['typeOptions']
                                                .replaceAll(", ", "|")
                                            : invent[ind]['category'][i]
                                                ['items'][j]['name'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      trailing: Text(
                                        invent[ind]['category'][i]['items'][j]
                                                ['qty']
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            });
      },
    );
  }
}

class CustomExpansionTile extends StatefulWidget {
  final Widget title;
  final List<Widget> children;
  final Widget trailing;
  final Color? backgroundColor;
  final bool isExpanded;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.children,
    required this.trailing,
    this.backgroundColor,
    required this.isExpanded,
  });

  @override
  CustomExpansionTileState createState() => CustomExpansionTileState();
}

class CustomExpansionTileState extends State<CustomExpansionTile> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: 55,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  widget.title,
                  const Spacer(),
                  IconButton(  
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    icon: _isExpanded
                        ? const Icon(Icons.keyboard_arrow_up)
                        : const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ),
          ),
          _isExpanded ? Container(
              color: Colors.white,
              child: Column(children: widget.children),
            )
          : Container(),
        ],
      ),
    );
  }
}
