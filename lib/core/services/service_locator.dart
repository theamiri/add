import 'package:aidra_drive/core/api/api_client.dart';
import 'package:aidra_drive/core/constant/strings.dart';
import 'package:aidra_drive/features/authentication/data/data_source/auth_local_datasource.dart';
import 'package:aidra_drive/features/authentication/data/data_source/auth_remote_datasource.dart';
import 'package:aidra_drive/features/authentication/data/data_source/credentials_local_datasource.dart';
import 'package:aidra_drive/features/authentication/data/repository_impl/auth_repository_impl.dart';
import 'package:aidra_drive/features/authentication/domain/repository/auth_repository.dart';
import 'package:aidra_drive/features/authentication/domain/use_cases/load_current_user_usecase.dart';
import 'package:aidra_drive/features/authentication/domain/use_cases/load_user_credentials_usecase.dart';
import 'package:aidra_drive/features/authentication/domain/use_cases/signin_usecase.dart';
import 'package:aidra_drive/features/authentication/domain/use_cases/signout_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //api
  sl.registerSingleton<ApiClient>(ApiClient(Strings.baseUrl));

  //authBloc
  sl.registerSingleton<AuthLocalDataSource>(AuthLocalDataSource());
  sl.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSource());
  sl.registerSingleton<CredentialsLocalDataSource>(
    CredentialsLocalDataSource(),
  );
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<SignOutUseCase>(SignOutUseCase());
  sl.registerSingleton<LoadCurrentUserUseCase>(LoadCurrentUserUseCase());
  sl.registerSingleton<LoadUserCredentialsUseCase>(
    LoadUserCredentialsUseCase(),
  );
}
