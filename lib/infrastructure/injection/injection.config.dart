// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:local_auth/local_auth.dart' as _i7;
import 'package:paddle_trac_admin_dashboard/collections/admin_sticker_orders_collection.dart'
    as _i8;
import 'package:paddle_trac_admin_dashboard/features/home_page/cubit/cubit/home_page_cubit.dart'
    as _i4;
import 'package:paddle_trac_admin_dashboard/features/orders/cubit/orders_cubit.dart'
    as _i12;
import 'package:paddle_trac_admin_dashboard/features/profile_page/cubit/profile_page_cubit.dart'
    as _i3;
import 'package:paddle_trac_admin_dashboard/features/sign_in/cubit/sign_in_cubit.dart'
    as _i5;
import 'package:paddle_trac_admin_dashboard/infrastructure/injection/injection_module.dart'
    as _i13;
import 'package:paddle_trac_admin_dashboard/infrastructure/secure_local_storage/lsecure_local_storage.dart'
    as _i10;
import 'package:paddle_trac_admin_dashboard/routes/router.dart' as _i9;
import 'package:paddle_trac_admin_dashboard/services/order_service.dart'
    as _i11;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.factory<_i3.ProfilePageCubit>(() => _i3.ProfilePageCubit());
    gh.factory<_i4.HomePageCubit>(() => _i4.HomePageCubit());
    gh.factory<_i5.SignInCubit>(() => _i5.SignInCubit());
    gh.factoryAsync<_i6.SharedPreferences>(() => injectionModule.prefs);
    gh.factory<_i7.LocalAuthentication>(
        () => injectionModule.localAuthentication);
    gh.factory<_i8.AdminStickerOrderCollection>(
        () => _i8.AdminStickerOrderCollection());
    gh.factory<_i9.AppRouter>(() => _i9.AppRouter());
    gh.singleton<_i10.SecureLocalStorage>(() => _i10.SecureLocalStorage());
    gh.singleton<_i11.IOrderService>(
      () => _i11.OrderService(gh<_i8.AdminStickerOrderCollection>()),
      instanceName: 'OrderService',
    );
    gh.factory<_i12.OrdersPageCubit>(() => _i12.OrdersPageCubit(
        gh<_i11.IOrderService>(instanceName: 'OrderService')));
    return this;
  }
}

class _$InjectionModule extends _i13.InjectionModule {}
