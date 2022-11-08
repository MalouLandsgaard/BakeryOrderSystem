import 'package:bakery_order_system/main.dart';
import 'package:bakery_order_system/routing/pageType.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState(selectedPage: PageType.none)) {
    on<PageSelected>((event, emit) {
      emit(state.copyWith(pageType: event.pageType));
    });
  }
}
