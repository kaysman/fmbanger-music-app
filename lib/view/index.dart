import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmbanger/config/constants.dart';

import 'widgets/body.dart';
import 'widgets/header.dart';
import 'widgets/search.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Constants.verticalPadding,
            horizontal: Constants.horizontalPadding,
          ),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: IndexHeader(),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: Constants.widgetSpacing),
              ),
              const SliverToBoxAdapter(
                child: IndexSearch(),
              ),

              SliverFillRemaining(
                child: IndexBody(),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
