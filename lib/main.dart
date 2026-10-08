import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BiodataForm(),
  ));
}

class BiodataForm extends StatefulWidget {
  @override
  State<BiodataForm> createState() => _BiodataFormState();
}

class _BiodataFormState extends State<BiodataForm> {
  final nameController = TextEditingController(text: 'Rodel Permejo');
  final ageController = TextEditingController(text: '21');
  final addressController = TextEditingController(text: 'Caloocan City');
  final courseController = TextEditingController(text: 'BSIT 301');
  final emailController = TextEditingController(text: 'rodel@email.com');
  
  // Educational Background
  final elementaryController = TextEditingController();
  final highschoolController = TextEditingController();
  final collegeController = TextEditingController(text: 'STI College');
  
  // Skills & Hobbies
  final skillsController = TextEditingController(text: 'Coding, Gaming');
  final hobbiesController = TextEditingController(text: 'Basketball');
  final talentsController = TextEditingController(text: 'Singing');

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(title: Text('Biodata App', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), backgroundColor: Colors.black, centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 10),
            Text('Personal Information', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            TextFormField(controller: nameController, decoration: InputDecoration(labelText: 'Full Name', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: Colors.white)),
            const SizedBox(height: 12),
            TextFormField(controller: ageController, decoration: InputDecoration(labelText: 'Age', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: Colors.white)),
            const SizedBox(height: 12),
            TextFormField(controller: addressController, decoration: InputDecoration(labelText: 'Address', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: Colors.white)),
            const SizedBox(height: 12),
            TextFormField(controller: courseController, decoration: InputDecoration(labelText: 'Course & Section', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: Colors.white)),
            const SizedBox(height: 12),
            TextFormField(controller: emailController, decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: Colors.white)),
            
            const SizedBox(height: 25),
            const Text('Educational Background', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            TextFormField(controller: elementaryController, decoration: InputDecoration(labelText: 'Elementary', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: Colors.white)),
            const SizedBox(height: 12),
            TextFormField(controller: highschoolController, decoration: InputDecoration(labelText: 'High School', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: Colors.white)),
            const SizedBox(height: 12),
            TextFormField(controller: collegeController, decoration: InputDecoration(labelText: 'College', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: Colors.white)),
            
            const SizedBox(height: 25),
            const Text('Skills & Hobbies', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            TextFormField(controller: skillsController, decoration: InputDecoration(labelText: 'Skills', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: Colors.white)),
            const SizedBox(height: 12),
            TextFormField(controller: hobbiesController, decoration: InputDecoration(labelText: 'Hobbies', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: Colors.white)),
            const SizedBox(height: 12),
            TextFormField(controller: talentsController, decoration: InputDecoration(labelText: 'Talents', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: Colors.white)),
            
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                onPressed: loading ? null : () {
                  setState(() => loading = true);
                  Future.delayed(Duration(seconds: 1), (){
                    setState(() => loading = false);
                    showDialog(context: context, builder: (_) => AlertDialog(
                      title: Text('Biodata Saved!'),
                      content: Text('Name: ${nameController.text}\nSaved locally bossing!'),
                      actions: [TextButton(onPressed: ()=>Navigator.pop(context), child: Text('OK'))],
                    ));
                  });
                },
                child: loading ? const CircularProgressIndicator(color: Colors.white) : const Text('Save Biodata', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}
