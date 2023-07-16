import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revisino_sqflite/data/models/dp-model.dart';
import 'package:revisino_sqflite/data/resources/dp-service/dp-helper.dart';

import 'add-contact-states.dart';

class ContactCubit extends Cubit<ContactStates> {
  ContactCubit() : super(InitialState());
  static ContactCubit get(context) => BlocProvider.of(context);

  final DatabaseHelper database = DatabaseHelper.instance;
  List<FriendContact> contacts = [];
  List<FriendContact> search = [];
  Future<int> insertDatabase(FriendContact contact) async {
    return await database.insertDatabase(contact).then((value) {
      emit(InsertingSuccessState());
      return value;
    });
  }

  Future<List<FriendContact>> getDatabase() async {
    contacts = await database.getDatabase();
    emit(GettingDpSuccessState());
    print(contacts);
    return contacts;
  }
  Future<List<FriendContact>> searchDatabase(String name) async {
    search = await database.searchDatabase(name);
    emit(SearchingDbSuccessState());
    return search;
  }
}
