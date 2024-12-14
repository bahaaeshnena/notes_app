import 'package:flutter/material.dart';
import 'package:tasks_management_pp/const.dart';
import 'package:tasks_management_pp/custom_add_button.dart';
import 'package:tasks_management_pp/custom_app_bar.dart';
import 'package:tasks_management_pp/custom_text_field.dart';
import 'package:tasks_management_pp/database.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  inserData(String title, String content) async {
    await databaseHelper.insertData(title, content);
  }

  // final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBar(
                  title: 'Add Note',
                  isHome: false,
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  controller: titleController,
                  hintText: 'Note Title',
                  icon: Icons.title,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: contentController,
                  hintText: 'Note body',
                  icon: Icons.text_fields,
                ),
                const SizedBox(height: 40),
                CustomButtonAdd(
                  onPressed: () async {
                    // Perform database insertion
                    await inserData(
                        titleController.text, contentController.text);

                    // Check if the widget is still mounted before using the context
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Note added successfully'),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
                        ),
                      );

                      // Navigate back to the previous screen
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
