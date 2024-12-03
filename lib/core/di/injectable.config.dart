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
import 'package:hangman_game/features/leaderboard/data/datasources/remote/leaderboard_remote_data_source.dart'
    as _i25;
import 'package:hangman_game/features/leaderboard/data/repositories/leaderboard_repository_impl.dart'
    as _i216;
import 'package:hangman_game/features/leaderboard/domain/index.dart' as _i617;
import 'package:hangman_game/features/leaderboard/domain/usecases/fetch_top_scores_usecase.dart'
    as _i540;
import 'package:hangman_game/features/leaderboard/index.dart' as _i618;
import 'package:hangman_game/features/leaderboard/ui/blocs/leaderboard_bloc.dart'
    as _i1065;
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
import 'package:hangman_game/features/main_menu/data/datasources/remote/main_menu_remote_data_source.dart'
    as _i804;
import 'package:hangman_game/features/main_menu/data/repositories/main_menu_repository_impl.dart'
    as _i1072;
import 'package:hangman_game/features/main_menu/domain/usecases/get_words_usecase.dart'
    as _i981;
import 'package:hangman_game/features/main_menu/domain/usecases/logout_usecase.dart'
    as _i994;
import 'package:hangman_game/features/main_menu/index.dart' as _i192;
import 'package:hangman_game/features/main_menu/ui/blocs/main_menu_bloc.dart'
    as _i607;
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
    gh.factory<_i25.LeaderboardRemoteDataSource>(() =>
        _i25.LeaderboardRemoteDataSourceImpl(supabase: gh<_i454.Supabase>()));
    gh.factory<_i1018.HomeRemoteDataSource>(
        () => _i1018.HomeRemoteDataSourceImpl(supabase: gh<_i454.Supabase>()));
    gh.factory<_i700.LoginRepository>(() => _i245.LoginRepositoryImpl(
        remoteDataSource: gh<_i700.LoginRemoteDataSource>()));
    gh.factory<_i804.MainMenuRemoteDataSource>(() =>
        _i804.MainMenuRemoteDataSourceImpl(supabase: gh<_i454.Supabase>()));
    gh.factory<_i693.SubmitLoginUsecase>(
        () => _i693.SubmitLoginUsecase(gh<_i848.LoginRepository>()));
    gh.factory<_i749.HomeRepository>(() => _i160.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i1018.HomeRemoteDataSource>()));
    gh.factory<_i617.LeaderboardRepository>(() =>
        _i216.LeaderboardRepositoryImpl(
            leaderboardRemoteDataSource:
                gh<_i25.LeaderboardRemoteDataSource>()));
    gh.factory<_i540.FetchTopScoresUsecase>(
        () => _i540.FetchTopScoresUsecase(gh<_i618.LeaderboardRepository>()));
    gh.factory<_i500.AddScoreUsecase>(
        () => _i500.AddScoreUsecase(gh<_i232.HomeRepository>()));
    gh.factory<_i192.MainMenuRepository>(() => _i1072.MainMenuRepositoryImpl(
        mainMenuRemoteDataSource: gh<_i192.MainMenuRemoteDataSource>()));
    gh.factory<_i999.HomeBloc>(
        () => _i999.HomeBloc(addScoreUsecase: gh<_i262.AddScoreUsecase>()));
    gh.factory<_i1065.LeaderboardBloc>(() => _i1065.LeaderboardBloc(
        fetchTopScoresUsecase: gh<_i618.FetchTopScoresUsecase>()));
    gh.factory<_i865.LoginBloc>(() =>
        _i865.LoginBloc(submitLoginUsecase: gh<_i700.SubmitLoginUsecase>()));
    gh.factory<_i981.GetWordsUsecase>(
        () => _i981.GetWordsUsecase(gh<_i192.MainMenuRepository>()));
    gh.factory<_i994.LogoutUsecase>(
        () => _i994.LogoutUsecase(gh<_i192.MainMenuRepository>()));
    gh.factory<_i607.MainMenuBloc>(() => _i607.MainMenuBloc(
          logoutUsecase: gh<_i192.LogoutUsecase>(),
          getWordsUsecase: gh<_i981.GetWordsUsecase>(),
        ));
    return this;
  }
}

class _$SupabaseModule extends _i224.SupabaseModule {}
