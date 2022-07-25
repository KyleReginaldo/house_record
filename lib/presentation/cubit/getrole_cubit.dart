import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:house_record/domain/entity/user_entity.dart';
import 'package:house_record/domain/usecase/getuser_infirestore.dart';

part 'getrole_state.dart';

class GetRoleCubit extends Cubit<UserState> {
  GetRoleCubit(
    this._getUserInFirestore,
  ) : super(UserInitial());
  final GetUserInFirestore _getUserInFirestore;
  void getUserInFirestore(String email) async {
    final user = await _getUserInFirestore(email);
    if (user.role == 'superadmin') {
      emit(Admin(user: user));
    } else if (user.role == 'user') {
      emit(FirestoreUser(user: user));
    }
  }
}
