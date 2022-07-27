import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:house_record/domain/entity/user_entity.dart';
import 'package:house_record/domain/usecase/create_user_account.dart';
import 'package:house_record/domain/usecase/getuser_accounts.dart';

part 'getuser_state.dart';

class GetuserCubit extends Cubit<GetuserState> {
  GetuserCubit(
    this._getUserAccounts,
    this._createUserAccount,
  ) : super(GetuserInitial());
  final GetUserAccounts _getUserAccounts;
  final CreateUserAccount _createUserAccount;

  void getUserAccounts() async {
    emit(AccountLoading());
    final accounts = _getUserAccounts();

    accounts.listen((event) {
      if (event.isEmpty) {
        emit(AccountEmpty());
      } else {
        emit(AccountLoaded(accounts: event));
      }
    });
  }

  void createUserAccount(UserEntity user) async {
    await _createUserAccount(user);
  }
}
