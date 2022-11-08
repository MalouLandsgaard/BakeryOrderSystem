import 'package:bakery_order_system/features/dashboard/presentation/dashboard_view.dart';
import 'package:bakery_order_system/util/pages/not_found_page.dart';
import 'package:flutter/material.dart';

enum PageType { none, orders, history, messages, products, settings }

extension PageTypeMapper on PageType {
  dynamic get page => pages[this] ?? pages[PageType.none]!;

  static Map<PageType, Widget> pages = {
    PageType.none: const NotFoundPage(),
    PageType.orders: const DashboardView(),
    PageType.history: const NotFoundPage(),
    PageType.messages: const NotFoundPage(),
    PageType.products: const NotFoundPage(),
    PageType.settings: const NotFoundPage(),
  };
}
