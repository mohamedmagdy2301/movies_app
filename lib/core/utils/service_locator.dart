import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/features/home/data/data%20sources/local_data_sources_home.dart';
import 'package:movies_app/features/home/data/data%20sources/remote_data_sources_home.dart';
import 'package:movies_app/features/home/data/repo/home_repo_impl.dart';
import 'package:movies_app/features/home/domain/use%20case/fetch_movies_use_case.dart';

final getIt = GetIt.instance;

void setupSericeLocator() {
  getIt.registerSingleton<RemoteDataSourcesHomeImpl>(
    RemoteDataSourcesHomeImpl(
      apiService: ApiService(
        Dio(),
      ),
    ),
  );
  getIt.registerSingleton<FetchMoviesUseCase>(
    FetchMoviesUseCase(
      homeRepoImpl: HomeRepoImpl(
        remoteDataSourcesHomeImpl: getIt.get<RemoteDataSourcesHomeImpl>(),
        localDataSourcesHomeImpl: LocalDataSourcesHomeImpl(),
      ),
    ),
  );
}
