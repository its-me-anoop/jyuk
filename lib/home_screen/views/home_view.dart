import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/navigation_bar.dart';
import '../../widgets/section_view.dart';
import 'featured_list_view.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(slivers: [
        CupertinoSliverNavigationBar(
          backgroundColor: Colors.transparent,
          largeTitle: Text("Jesus Youth UK"),
          stretch: true,
        ),
        SliverList(
            delegate: SliverChildListDelegate.fixed([
          SectionView(
            child: FeaturedListView(),
            height: 464,
          ),
        ]))
      ]),
      bottomNavigationBar: AppNavigationBar(),
    );
  }
}
