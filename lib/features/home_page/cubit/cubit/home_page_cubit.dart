import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_page_state.dart';
part 'home_page_cubit.freezed.dart';

@injectable
class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(const HomePageState.initial()) {
    init();
  }

  Future<void> init() async {
    emit(
      const HomePageState.loaded(),
    );
  }

  void changePage(DashboardPageState dashboardPageState) {
    state.mapOrNull(
      loaded: (loaded) {
        emit(loaded.copyWith(dashboardPageState: dashboardPageState));
      },
    );
  }
}
