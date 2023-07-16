import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revisino_sqflite/data/models/dp-model.dart';
import 'package:revisino_sqflite/view-model/cubit/add-contact-cubit.dart';
import 'package:revisino_sqflite/view-model/cubit/add-contact-states.dart';
import 'package:revisino_sqflite/widgets/component.dart';

class AddContactsScreen extends StatelessWidget {


  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ContactCubit()..getDatabase(),
      child: BlocConsumer<ContactCubit,ContactStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = ContactCubit.get(context);
          return Scaffold(
              body: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        )
                    ),
                    height: MediaQuery.of(context).size.height-(0.289*MediaQuery.of(context).size.height),
                  ),
                  Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 200,horizontal: 40),
                        child: Column(
                          children: [
                            textField(
                                text: 'Name',
                                hintText: 'enter the contact name',
                                controller: nameController,
                                type: TextInputType.text,
                                prefixIcon: Icons.person,
                                validate: (String? value)
                                {
                                  if(value!.isEmpty) 'please write name';
                                  return null;
                                }),
                            const SizedBox(height: 20,),
                            textField(
                                text: 'phone',
                                hintText: 'enter the contact phone',
                                controller: phoneController,
                                type: TextInputType.phone,
                                prefixIcon: Icons.phone,
                                validate: (String? value)
                                {
                                  if(value!.isEmpty) 'please write phone';
                                  return null;
                                }),
                            const SizedBox(height: 20,),
                            textField(
                                text: 'Address',
                                hintText: 'enter the contact address',
                                controller: addressController,
                                type: TextInputType.streetAddress,
                                prefixIcon: Icons.add_location,
                                validate: (String? value)
                                {
                                  if(value!.isEmpty) 'please write address';
                                  return null;
                                }),
                            const SizedBox(height: 50,),
                            button(label: 'save', onTap: (){
                              if(formKey.currentState!.validate())
                              {
                               cubit.insertDatabase(
                                 FriendContact(
                                   name: nameController.text,
                                   phoneNumber: phoneController.text,
                                   address: addressController.text,
                                 ),
                               );
                              }
                            })
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
          );
        },

      ),
    );
  }
}
