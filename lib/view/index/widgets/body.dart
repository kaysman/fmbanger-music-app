import 'package:flutter/material.dart';
import 'package:fmbanger/config/constants.dart';

class IndexBody extends StatelessWidget {
  const IndexBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            labelColor: Constants.primaryColor,
            unselectedLabelColor: Colors.white38,
            tabs: [
              Tab(icon: Text("Top artists")),
              Tab(icon: Text("Top Albums")),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Container(color: Colors.purple),
                Container(color: Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
