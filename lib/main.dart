import 'package:bakery_order_system/config/theme/theme.dart';
import 'package:bakery_order_system/routing/bloc/navigation_bloc.dart';
import 'package:bakery_order_system/routing/pageType.dart';
import 'package:bakery_order_system/util/pages/default_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flow_builder/flow_builder.dart';

void main() {
  runApp(BlocProvider(
    create: (_) => NavigationBloc(),
    child: const BakeryApp(),
  ));
}

class BakeryApp extends StatelessWidget {
  const BakeryApp({super.key});

  List<Page> onGeneratePages(NavigationState state, List<Page> pages) {
    return [
      DefaultPage.page(pageType: state.selectedPage),
      if (false) DefaultPage.page(pageType: PageType.none)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maizie',
      theme: AppThemeData.appThemeData[AppThemeEnum.lightTheme],
      debugShowCheckedModeBanner: false,
      home: FlowBuilder(
        state: context.watch<NavigationBloc>().state,
        onGeneratePages: onGeneratePages,
      ),
    );
  }
}
