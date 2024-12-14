import 'package:flutter/material.dart';
import 'package:tasks_management_pp/add_note_view.dart';
import 'package:tasks_management_pp/const.dart';
import 'package:tasks_management_pp/custom_app_bar.dart';
import 'package:tasks_management_pp/custom_container_note.dart';
import 'package:tasks_management_pp/database.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Map<String, dynamic>> notes = []; // قائمة لتخزين الملاحظات

  @override
  void initState() {
    super.initState();
    fetchNotes(); // تحميل البيانات عند بدء الشاشة
  }

  Future<void> fetchNotes() async {
    List<Map<String, dynamic>> data = await databaseHelper.readData();
    setState(() {
      notes = data; // تحديث قائمة الملاحظات
    });
  }

  Future<void> deleteNote(int id) async {
    await databaseHelper.deleteData(id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Note deleted successfully!'),
      ),
    );
    fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(
                  builder: (context) => const AddNoteView(),
                ))
                .then((_) => fetchNotes());
          },
          backgroundColor: buttonColor,
          child: const Icon(
            color: Colors.white,
            Icons.add,
            size: 50,
          ),
        ),
      ),
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: CustomAppBar(
                  title: 'Tasks Management',
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 40)),
              notes.isEmpty
                  ? const SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'No Data',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'JosefinSans'),
                        ),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return CustomContainerNote(
                            onTap: () => deleteNote(notes[index]['id']),
                            title: notes[index]['title'],
                            content: notes[index]['content'],
                          );
                        },
                        childCount: notes.length,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
