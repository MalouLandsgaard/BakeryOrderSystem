import 'package:bakery_order_system/config/setup/ioc.dart';
import 'package:bakery_order_system/config/theme/theme.dart';
import 'package:bakery_order_system/features/orders/data/order_repo.dart';
import 'package:bakery_order_system/features/products/bloc/product_bloc.dart';
import 'package:bakery_order_system/features/products/data/product_repo.dart';
import 'package:bakery_order_system/routing/bloc/navigation_bloc.dart';
import 'package:bakery_order_system/routing/pageType.dart';
import 'package:bakery_order_system/util/pages/default_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await IOC.setupMain();

  runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ProductRepository>(
          create: (_) => ProductRepository(),
        ),
        RepositoryProvider<OrderRepository>(
          create: (_) => OrderRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NavigationBloc>(create: (_) => NavigationBloc()),
          BlocProvider<ProductBloc>(
              create: (context) =>
                  ProductBloc(context.read<ProductRepository>())),
        ],
        child: const BakeryApp(),
      )));
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
