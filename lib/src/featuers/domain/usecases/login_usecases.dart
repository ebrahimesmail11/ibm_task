import 'package:ibm_task/src/common/base/app_constants.dart';
import 'package:ibm_task/src/common/base/app_exception.dart';
import 'package:ibm_task/src/common/network/models/login/login_success.dart';
import 'package:ibm_task/src/common/storage/local_storage_helper.dart';
import 'package:ibm_task/src/common/storage/shared_preferences.dart';
import 'package:ibm_task/src/featuers/data/repo/login/login_repo.dart';

abstract class LoginUseCase{
  Future<dynamic> request(String email, String password);
}
class LoginUseCaseImpl implements LoginUseCase{
late LoginRepo repo;

  LoginUseCaseImpl(LoginRepo? repo): repo = repo ?? LoginRepoImpl(null);
  
  @override
  Future request(String email, String password )async {
    try{
      dynamic response =await  repo.getUserData(
        body: {
          "email":email,
          "password":password,
        },
        headers: {
          "Content-Type": "application/json", 
        }
      );
      if(response is LoginSuccess){
        saveUserTokenAndId(response);
      }
     return  response;
    }catch(error){
      if (error.runtimeType == AppException) {
        error as AppException;
      }
      return Future.error(error);
    }
  }
   Future<void> saveUserTokenAndId(LoginSuccess model) async {
    await LocalStorageHelper.write('token', model.data?.token ?? '');
    await LocalStorageHelper.write('id', model.data?.id.toString() ?? '');
    await SharedPref().setBoolean(AppConstants.userAlreadyLoggedInKey, true);
  }
}