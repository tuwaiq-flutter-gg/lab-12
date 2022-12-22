import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shatha_lab12/controller/database_controller.dart';
import 'package:shatha_lab12/controller/textfield_controller.dart';

class EditInfo extends StatelessWidget {
  const EditInfo({super.key});

  @override
  Widget build(BuildContext context) {
    
    DataBaseController datacontroller = Get.find();
    TextFieldController textController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit your profile'),
        centerTitle: true,
      ),
      body: GetBuilder<DataBaseController>(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: 
                [Column(
                  children: [
            
                    const SizedBox(height: 10,),
            
                    const Center(child: Text('name :'),),
                    Center(child: TextField(
                      decoration: InputDecoration(hintText: datacontroller.name),
                      controller: textController.name,),),
            
                    const SizedBox(height: 10,),
            
                    Center(
                      child: ElevatedButton(onPressed: () {
                        datacontroller.updateName();
                      }, child: const Text('update name')),
                    ),
            
                    const SizedBox(height: 10,),
            
                    const Center(child: Text('email :'),),
                    Center(child: TextField(
                      decoration: InputDecoration(hintText: datacontroller.email),
                      controller: textController.newEmail,),),
            
                    const SizedBox(height: 10,),
            
                    Center(
                      child: ElevatedButton(onPressed: () {
                        datacontroller.updateEmail();
                      }, child: const Text('update email')),
                    ),
            
                    const SizedBox(height: 10,),
            
                    const Center(child: Text('age :'),),
                    Center(child: TextField(
                      decoration: InputDecoration(hintText: datacontroller.age),
                      controller: textController.age,),),
            
                    const SizedBox(height: 10,),
            
                    Center(
                      child: ElevatedButton(onPressed: () {
                        datacontroller.updateAge();
                      }, child: const Text('update age')),
                    ),
            
            
                  ],
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}