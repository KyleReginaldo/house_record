import 'package:get_it/get_it.dart';
import 'package:house_record/data/datasource/remote_data_source.dart';
import 'package:house_record/data/repository_impl/repository_impl.dart';
import 'package:house_record/domain/repository/repository.dart';
import 'package:house_record/domain/usecase/add_house_data.dart';
import 'package:house_record/domain/usecase/add_user.dart';
import 'package:house_record/domain/usecase/get_houses.dart';
import 'package:house_record/domain/usecase/login.dart';
import 'package:house_record/domain/usecase/logout.dart';
import 'package:house_record/domain/usecase/register.dart';
import 'package:house_record/domain/usecase/search_payment.dart';
import 'package:house_record/presentation/cubit/house_cubit.dart';

final sl = GetIt.instance;

Future init() async {
  sl.registerFactory(
      () => HouseCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl()));
  sl.registerLazySingleton(() => GetHouses(repo: sl()));
  sl.registerLazySingleton(() => AddHouseData(repo: sl()));
  sl.registerLazySingleton(() => SearchPayment(repo: sl()));
  sl.registerLazySingleton(() => LogIn(repo: sl()));

  sl.registerLazySingleton(() => LogOut(repo: sl()));
  sl.registerLazySingleton(() => AddUser(repo: sl()));
  sl.registerLazySingleton(() => Register(repo: sl()));

  sl.registerLazySingleton<Repository>(() => RepositoryImpl(remote: sl()));

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
}
