// import 'package:dartz/dartz.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../../core/errors/failure.dart';

// String userKey = "USER_KEY_STATION";

// abstract class UserLoaclDataSource {
//   Future<Either<Failure, bool>> saveUser(String data);
// }

// class UserLoaclDataSourceImpl extends UserLoaclDataSource {
//   SharedPreferences sharedPreferences;
//   UserLoaclDataSourceImpl({
//     required this.sharedPreferences,
//   });

//   @override
//   Future<Either<Failure, bool>> saveUser(String data) async {
//     try{
//       return Right(await sharedPreferences.setString(userKey, data));
//     }catch(e){
//       return Left(CacheFailure());
//     }
//   }
// }
