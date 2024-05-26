import 'package:dio/dio.dart';
import 'package:flutter_app/data/datasources/local_datasource.dart';
import 'package:flutter_app/data/datasources/remote_data_source.dart';
import 'package:flutter_app/data/repositories/repositry_impl.dart';
import 'package:flutter_app/domain/usecases/login_usecase.dart';
import 'package:flutter_app/domain/usecases/signup_usecase.dart';
import 'package:flutter_app/presentation/cubit/authenticate_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/api/api_consumer.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'core/network/network_info.dart';

var sl = GetIt.instance;

Future<void> init() async {
  //*Bloc
  sl.registerLazySingleton(() => AuthenticateCubit(sl(), sl()));

  //!Authenticate
  //usercase
  sl.registerLazySingleton(() => LoginUsecase(repositry: sl<RepositryImpl>()));
  sl.registerLazySingleton(() => SignUpUsecase(repositry: sl<RepositryImpl>()));

  //Repo
  sl.registerLazySingleton(() => RepositryImpl(
      // loaclDataSource: sl<UserLoaclDataSource>(),
      remoteDataSource: sl<RemoteDataSource>()));

  //Datasource
  // sl.registerLazySingleton<UserLoaclDataSource>(() =>
  //   UserLoaclDataSourceImpl(sharedPreferences: sl<SharedPreferences>()));
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(sl<DioConsumer>()));

  //!Core
  //*Api
  //Consumer
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  sl.registerLazySingleton(() => DioConsumer(client: sl()));

  //! External
  // Local
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  //Network
  sl.registerLazySingleton(() => NetworkInfoImpl());
  // Online
  sl.registerLazySingleton(() => AppIntercepters());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => Dio());
}
