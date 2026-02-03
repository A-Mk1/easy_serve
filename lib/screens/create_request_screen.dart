import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class CreateRequestScreen extends StatefulWidget {
  final String? initialTitle;
  const CreateRequestScreen({super.key, this.initialTitle});

  @override
  State<CreateRequestScreen> createState() => _CreateRequestScreenState();
}

class _CreateRequestScreenState extends State<CreateRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DBHelper dbHelper = DBHelper();

  @override
  void initState() {
    super.initState();
    if (widget.initialTitle != null) {
      titleController.text = widget.initialTitle!;
    }
  }

  void addRequest() async {
    if (_formKey.currentState!.validate()) {
      await dbHelper.insertRequest({
        'title': titleController.text,
        'description': descriptionController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Request Added Successfully')),
      );

      titleController.clear();
      descriptionController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Request')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Title required' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Description required' : null,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: addRequest,
                  child: const Text('Add Request'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
