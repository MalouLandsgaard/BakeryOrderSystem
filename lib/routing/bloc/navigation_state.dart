part of 'navigation_bloc.dart';

@immutable
class NavigationState extends Equatable {
  const NavigationState({required this.selectedPage});
  final PageType selectedPage;

  @override
  List<Object?> get props => [selectedPage];

  NavigationState copyWith({PageType? pageType}) {
    return NavigationState(selectedPage: pageType ?? selectedPage);
  }
}
