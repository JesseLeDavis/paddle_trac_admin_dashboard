// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:local_auth/local_auth.dart' as _i152;
import 'package:paddle_trac_admin_dashboard/collections/admin_sticker_orders_collection.dart'
    as _i273;
import 'package:paddle_trac_admin_dashboard/collections/court_collection.dart'
    as _i996;
import 'package:paddle_trac_admin_dashboard/collections/court_update_collection.dart'
    as _i1034;
import 'package:paddle_trac_admin_dashboard/features/court_update_page/cubit/court_update_cubit.dart'
    as _i284;
import 'package:paddle_trac_admin_dashboard/features/home_page/cubit/cubit/home_page_cubit.dart'
    as _i815;
import 'package:paddle_trac_admin_dashboard/features/orders/cubit/orders_cubit.dart'
    as _i908;
import 'package:paddle_trac_admin_dashboard/features/profile_page/cubit/profile_page_cubit.dart'
    as _i812;
import 'package:paddle_trac_admin_dashboard/features/sign_in/cubit/sign_in_cubit.dart'
    as _i645;
import 'package:paddle_trac_admin_dashboard/features/sticker_generator/cubit/sticker_generator_cubit.dart'
    as _i208;
import 'package:paddle_trac_admin_dashboard/infrastructure/injection/injection_module.dart'
    as _i632;
import 'package:paddle_trac_admin_dashboard/infrastructure/secure_local_storage/lsecure_local_storage.dart'
    as _i412;
import 'package:paddle_trac_admin_dashboard/routes/router.dart' as _i512;
import 'package:paddle_trac_admin_dashboard/services/court_service.dart'
    as _i586;
import 'package:paddle_trac_admin_dashboard/services/court_update_service.dart'
    as _i333;
import 'package:paddle_trac_admin_dashboard/services/order_service.dart'
    as _i624;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.factory<_i812.ProfilePageCubit>(() => _i812.ProfilePageCubit());
    gh.factory<_i815.HomePageCubit>(() => _i815.HomePageCubit());
    gh.factory<_i208.StickerGeneratorCubit>(
        () => _i208.StickerGeneratorCubit());
    gh.factory<_i645.SignInCubit>(() => _i645.SignInCubit());
    gh.factoryAsync<_i460.SharedPreferences>(() => injectionModule.prefs);
    gh.factory<_i152.LocalAuthentication>(
        () => injectionModule.localAuthentication);
    gh.factory<_i996.CourtCollection>(() => _i996.CourtCollection());
    gh.factory<_i1034.CourtUpdateRequestCollection>(
        () => _i1034.CourtUpdateRequestCollection());
    gh.factory<_i273.AdminStickerOrderCollection>(
        () => _i273.AdminStickerOrderCollection());
    gh.factory<_i512.AppRouter>(() => _i512.AppRouter());
    gh.singleton<_i412.SecureLocalStorage>(() => _i412.SecureLocalStorage());
    gh.singleton<_i586.ICourtService>(
      () => _i586.CourtService(gh<_i996.CourtCollection>()),
      instanceName: 'CourtService',
    );
    gh.singleton<_i624.IOrderService>(
      () => _i624.OrderService(gh<_i273.AdminStickerOrderCollection>()),
      instanceName: 'OrderService',
    );
    gh.singleton<_i333.IAdminCourtUpdateRequestService>(
      () => _i333.AdminCourtUpdateRequestService(
        gh<_i1034.CourtUpdateRequestCollection>(),
        gh<_i586.ICourtService>(instanceName: 'CourtService'),
      ),
      instanceName: 'AdminCourtUpdateRequestService',
    );
    gh.factory<_i284.CourtUpdateCubit>(() => _i284.CourtUpdateCubit(
        gh<_i333.IAdminCourtUpdateRequestService>(
            instanceName: 'AdminCourtUpdateRequestService')));
    gh.factory<_i908.OrdersPageCubit>(() => _i908.OrdersPageCubit(
        gh<_i624.IOrderService>(instanceName: 'OrderService')));
    return this;
  }
}

class _$InjectionModule extends _i632.InjectionModule {}
