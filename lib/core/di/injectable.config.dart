// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hangman_game/core/di/injectable.dart' as _i224;
import 'package:hangman_game/features/home/data/datasources/remote/home_remote_data_source.dart'
    as _i1018;
import 'package:hangman_game/features/home/data/repositories/home_repository_impl.dart'
    as _i160;
import 'package:hangman_game/features/home/domain/index.dart' as _i749;
import 'package:hangman_game/features/home/domain/repositories/home_repository.dart'
    as _i232;
import 'package:hangman_game/features/home/domain/usecases/add_score_usecase.dart'
    as _i500;
import 'package:hangman_game/features/home/index.dart' as _i262;
import 'package:hangman_game/features/home/ui/blocs/home_bloc.dart' as _i999;
import 'package:hangman_game/features/login/data/datasources/remote/login_remote_data_source.dart'
    as _i358;
import 'package:hangman_game/features/login/data/repositories/login_repository_impl.dart'
    as _i245;
import 'package:hangman_game/features/login/domain/repositories/login_repository.dart'
    as _i848;
import 'package:hangman_game/features/login/domain/usecases/submit_login_usecase.dart'
    as _i693;
import 'package:hangman_game/features/login/index.dart' as _i700;
import 'package:hangman_game/features/login/ui/blocs/login_bloc.dart' as _i865;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

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
    final supabaseModule = _$SupabaseModule();
    gh.lazySingleton<_i454.Supabase>(() => supabaseModule.supabase());
    gh.factory<_i358.LoginRemoteDataSource>(
        () => _i358.LoginRemoteDataSourceImpl(supabase: gh<_i454.Supabase>()));
    gh.factory<_i1018.HomeRemoteDataSource>(
        () => _i1018.HomeRemoteDataSourceImpl(supabase: gh<_i454.Supabase>()));
    gh.factory<_i700.LoginRepository>(() => _i245.LoginRepositoryImpl(
        remoteDataSource: gh<_i700.LoginRemoteDataSource>()));
    gh.factory<_i693.SubmitLoginUsecase>(
        () => _i693.SubmitLoginUsecase(gh<_i848.LoginRepository>()));
    gh.factory<_i749.HomeRepository>(() => _i160.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i1018.HomeRemoteDataSource>()));
    gh.factory<_i500.AddScoreUsecase>(
        () => _i500.AddScoreUsecase(gh<_i232.HomeRepository>()));
    gh.factory<_i999.HomeBloc>(
        () => _i999.HomeBloc(addScoreUsecase: gh<_i262.AddScoreUsecase>()));
    gh.factory<_i865.LoginBloc>(() =>
        _i865.LoginBloc(submitLoginUsecase: gh<_i700.SubmitLoginUsecase>()));
    return this;
  }
}

class _$SupabaseModule extends _i224.SupabaseModule {}
