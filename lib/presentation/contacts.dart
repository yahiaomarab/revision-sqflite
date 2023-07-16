import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revisino_sqflite/data/models/dp-model.dart';
import 'package:revisino_sqflite/presentation/add-contact.dart';
import 'package:revisino_sqflite/presentation/search-screen.dart';
import 'package:revisino_sqflite/view-model/cubit/add-contact-states.dart';
import 'package:revisino_sqflite/widgets/component.dart';

import '../view-model/cubit/add-contact-cubit.dart';

class ContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ContactCubit()..getDatabase(),

      child: BlocConsumer<ContactCubit,ContactStates>(
        listener: (context,state){},
        builder: (context,state){
          return  Scaffold(
            backgroundColor: Colors.white38,
            appBar: AppBar(
              title: const Text('Contacts'),
              centerTitle: true,
              backgroundColor: Colors.white30.withOpacity(0.1),
              actions:  [
                IconButton(icon:const Icon(Icons.add,size: 40,),onPressed: (){
                  navTo(context, AddContactsScreen() );
                },),
                IconButton(icon:const Icon(Icons.search,size: 40,),onPressed: (){
                  navTo(context, SearchScreen() );
                },),
              ],
            ),
            body: ListView.separated(
              itemBuilder: (context,index)=>itemContact(ContactCubit.get(context).contacts[index]),
              separatorBuilder: (context,index)=>const SizedBox(height: 15,),
              itemCount: ContactCubit.get(context).contacts.length,
            ),
          );
        },

      ),
    );
  }

}
