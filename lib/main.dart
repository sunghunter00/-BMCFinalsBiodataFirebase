import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biodata App',
      home: BiodataForm(),
    );
  }
}

class BiodataForm extends StatefulWidget {
  @override
  _BiodataFormState createState() => _BiodataFormState();
}

class _BiodataFormState extends State<BiodataForm> {
  final _formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final ageCtrl = TextEditingController();
  final genderCtrl = TextEditingController();
  final birthdateCtrl = TextEditingController();
  final contactCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final schoolCtrl = TextEditingController();
  final courseCtrl = TextEditingController();
  final yearCtrl = TextEditingController();
  final skillsCtrl = TextEditingController();
  final hobbiesCtrl = TextEditingController();
  final foodCtrl = TextEditingController();

  bool loading = false;

  Future<void> saveData() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => loading = true);
    try {
      await FirebaseFirestore.instance.collection('biodata').add({
        'name': nameCtrl.text,
        'age': ageCtrl.text,
        'gender': genderCtrl.text,
        'birthdate': birthdateCtrl.text,
        'contactNumber': contactCtrl.text,
        'email': emailCtrl.text,
        'address': addressCtrl.text,
        'school': schoolCtrl.text,
        'course': courseCtrl.text,
        'yearLevel': yearCtrl.text,
        'skills': skillsCtrl.text,
        'hobbies': hobbiesCtrl.text,
        'favoriteFood': foodCtrl.text,
        'createdAt': FieldValue.serverTimestamp(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Saved to Firebase boss!')),
      );
      _formKey.currentState!.reset();
      nameCtrl.clear(); ageCtrl.clear(); genderCtrl.clear(); birthdateCtrl.clear();
      contactCtrl.clear(); emailCtrl.clear(); addressCtrl.clear(); schoolCtrl.clear();
      courseCtrl.clear(); yearCtrl.clear(); skillsCtrl.clear(); hobbiesCtrl.clear(); foodCtrl.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Biodata App'), backgroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Student Biodata Form', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              const Text('Personal Information', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
              TextFormField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Full Name'), validator: (v) => v!.isEmpty ? 'Required' : null),
              Row(
                children: [
                  Expanded(child: TextFormField(controller: ageCtrl, decoration: const InputDecoration(labelText: 'Age'))),
                  const SizedBox(width: 10),
                  Expanded(child: TextFormField(controller: genderCtrl, decoration: const InputDecoration(labelText: 'Gender'))),
                ],
              ),
              TextFormField(controller: birthdateCtrl, decoration: const InputDecoration(labelText: 'Birthdate (e.g., Month Day, Year)')),
              TextFormField(controller: contactCtrl, decoration: const InputDecoration(labelText: 'Contact Number')),
              TextFormField(controller: emailCtrl, decoration: const InputDecoration(labelText: 'Email Address')),
              TextFormField(controller: addressCtrl, decoration: const InputDecoration(labelText: 'Address')),
              const SizedBox(height: 20),
              const Text('Educational Background', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
              TextFormField(controller: schoolCtrl, decoration: const InputDecoration(labelText: 'School / University Name')),
              TextFormField(controller: courseCtrl, decoration: const InputDecoration(labelText: 'Course / Program (e.g., BSIT)')),
              TextFormField(controller: yearCtrl, decoration: const InputDecoration(labelText: 'Year Level (e.g., 3rd Year)')),
              const SizedBox(height: 20),
              const Text('Skills & Hobbies', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
              TextFormField(controller: skillsCtrl, decoration: const InputDecoration(labelText: 'Skills (e.g., Flutter, Dart, SQL)')),
              TextFormField(controller: hobbiesCtrl, decoration: const InputDecoration(labelText: 'Hobbies & Interests')),
              TextFormField(controller: foodCtrl, decoration: const InputDecoration(labelText: 'Favorite Food')),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: loading ? null : saveData,
                  child: loading ? const CircularProgressIndicator() : const Text('Save Biodata to Firebase'),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
