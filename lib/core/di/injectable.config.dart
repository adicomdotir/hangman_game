// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
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
    gh.factory<_i358.LoginRemoteDataSource>(
        () => _i358.LoginRemoteDataSourceImpl());
    gh.factory<_i700.LoginRepository>(() => _i245.LoginRepositoryImpl(
        remoteDataSource: gh<_i700.LoginRemoteDataSource>()));
    gh.factory<_i693.SubmitLoginUsecase>(
        () => _i693.SubmitLoginUsecase(gh<_i848.LoginRepository>()));
    gh.factory<_i865.LoginBloc>(() =>
        _i865.LoginBloc(submitLoginUsecase: gh<_i700.SubmitLoginUsecase>()));
    return this;
  }
}
