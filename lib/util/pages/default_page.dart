import 'package:bakery_order_system/config/measurements/screen_breakpoints.dart';
import 'package:bakery_order_system/routing/bloc/navigation_bloc.dart';
import 'package:bakery_order_system/routing/pageType.dart';
import 'package:bakery_order_system/util/widgets/default_app_bar.dart';
import 'package:bakery_order_system/util/widgets/default_side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({Key? key, required this.selectedPage});

  static Page page({required PageType pageType}) {
    return MaterialPage(
      child: DefaultPage(selectedPage: pageType),
    );
  }

  final PageType selectedPage;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    final theme = Theme.of(context);
    var size = MediaQuery.of(context).size;

    return Scaffold(
        key: _key,
        drawer: (getDeviceType(size) == DeviceScreenType.desktop)
            ? null
            : Drawer(
                width: 200,
                child: DefaultSideMenu(),
              ),
        body: getValueForScreenType<Widget>(
            context: context,
            desktop: Row(
              children: [DefaultSideMenu(), selectedPage.page],
            ),
            mobile: Column(
              children: [const DefaultAppBar(), selectedPage.page],
            )));
  }
}
