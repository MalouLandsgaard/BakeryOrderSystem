import 'package:bakery_order_system/routing/bloc/navigation_bloc.dart';
import 'package:bakery_order_system/routing/pageType.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultSideMenu extends StatelessWidget {
  DefaultSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var navBloc = context.read<NavigationBloc>();
    var _pageSelected = navBloc.state.selectedPage;

    return Container(
      width: 200,
      color: Colors.red,
      child: Column(children: [
        Text("SideMenu"),
        Column(
          children: List.generate(
              PageType.values.length,
              (index) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: PageType.values[index] == _pageSelected
                          ? Colors.blue
                          : Colors.red),
                  onPressed: () => navBloc
                      .add(PageSelected(pageType: PageType.values[index])),
                  child: Text(PageType.values[index].name))),
        ),
        Spacer(),
      ]),
    );
  }
}
