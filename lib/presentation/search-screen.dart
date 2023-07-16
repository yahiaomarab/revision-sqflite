import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revisino_sqflite/widgets/component.dart';

import '../view-model/cubit/add-contact-cubit.dart';
import '../view-model/cubit/add-contact-states.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ContactCubit()..getDatabase(),

      child: BlocConsumer<ContactCubit,ContactStates>(
        listener: (context,state){},
        builder:(context,state){
          return Scaffold(
            body: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  textField(
                    text: 'search',
                    hintText: 'find your contact',
                    controller: searchController,
                    type: TextInputType.text,
                    validate: (String? value) {
                      return null;
                    },
                    prefixIcon:  Icons.search,
                    onChanged: (value){
                      ContactCubit.get(context).searchDatabase(value);
                    },
                  ),
                  const SizedBox(height: 30,),
                  Expanded(
                    child: ConditionalBuilder(
                      condition: ContactCubit.get(context).contacts.isNotEmpty,
                      builder:(context)=> ContactCubit.get(context).search.isNotEmpty ?ListView.separated(
                        itemBuilder: (context,index)=>itemContact(ContactCubit.get(context).search[index]),
                        separatorBuilder: (context,index)=>const SizedBox(height: 15,),
                        itemCount: ContactCubit.get(context).search.length,
                      ):ListView.separated(
                        itemBuilder: (context,index)=>itemContact(ContactCubit.get(context).contacts[index]),
                        separatorBuilder: (context,index)=>const SizedBox(height: 15,),
                        itemCount: ContactCubit.get(context).contacts.length,
                      ),
                      fallback: (context)=>Container(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },

      ),
    );
  }
}
