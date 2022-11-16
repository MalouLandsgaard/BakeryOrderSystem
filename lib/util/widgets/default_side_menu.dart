import 'package:bakery_order_system/config/measurements/space.dart';
import 'package:bakery_order_system/routing/bloc/navigation_bloc.dart';
import 'package:bakery_order_system/routing/pageType.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultSideMenu extends StatelessWidget {
  DefaultSideMenu({super.key});

  late PageType _pageSelected;
  late ThemeData _theme;

  @override
  Widget build(BuildContext context) {
    var navBloc = context.read<NavigationBloc>();
    _pageSelected = navBloc.state.selectedPage;
    _theme = Theme.of(context);

    return Container(
      width: 200,
      padding: EdgeInsets.all(DEFAULTPADDINGVALUE / 2),
      color: _theme.colorScheme.surface,
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(DEFAULTPADDINGVALUE),
          child: Text(
            "Maizie",
            style: _theme.textTheme.titleLarge,
          ),
        ),
        const VerticalSpace.small(),
        Wrap(
          children: List.generate(
              _pageList.length,
              (index) => _menuItem(
                  onPressed: () =>
                      navBloc.add(PageSelected(pageType: _pageList[index])),
                  page: _pageList[index])),
        ),
        const Spacer(),
      ]),
    );
  }

  Widget _menuItem({
    required PageType page,
    VoidCallback? onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color:
              _pageSelected == page ? _theme.primaryColor : Colors.transparent,
        ),
        padding: const EdgeInsets.all(DEFAULTPADDINGVALUE / 2),
        child: Row(
          children: [
            Text(_symbols[page] ?? _symbols[PageType.none]!,
                style: _theme.textTheme.titleSmall!.copyWith(
                  fontSize: 16,
                )),
            const HorizontalSpace.small(),
            Expanded(
                child: Text(
              page.pageTitle,
              style: _theme.textTheme.titleSmall!.copyWith(
                  fontSize: 14,
                  color: _pageSelected == page
                      ? _theme.colorScheme.onPrimary
                      : null),
            )),
          ],
        ),
      ),
    );
  }

  final List<PageType> _pageList = [
    PageType.orders,
    PageType.history,
    PageType.messages,
    PageType.products,
    PageType.settings,
  ];

  final Map<PageType, String> _symbols = {
    PageType.none: "⛔",
    PageType.orders: "🍽️",
    PageType.history: "🧾",
    PageType.messages: "📞",
    PageType.products: "🧁",
    PageType.settings: "⚙️",
  };
}
