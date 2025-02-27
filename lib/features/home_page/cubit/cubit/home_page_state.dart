part of 'home_page_cubit.dart';

enum DashboardPageState { orders, profile, settings, qr }

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.initial() = _Initial;
  const factory HomePageState.error() = _Error;
  const factory HomePageState.loaded(
      {@Default(DashboardPageState.orders) dashboardPageState}) = _Loaded;

  const HomePageState._();
}
