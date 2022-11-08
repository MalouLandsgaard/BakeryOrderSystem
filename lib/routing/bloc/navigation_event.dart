part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class PageSelected extends NavigationEvent {
  const PageSelected({required this.pageType});

  final PageType pageType;

  @override
  List<Object> get props => [pageType];
}
