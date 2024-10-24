import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatelessWidget {
  // Define the form key outside of build method
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blueGrey.shade300, Colors.white],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Enter your info:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 32),
                        ),
                      ),
                      RegisterFormField(t: 'Full Name'),
                      RegisterFormField(t: 'Email'),
                      RegisterFormField(t: 'Username'),
                      RegisterFormField(t: 'Password'),
                      RegisterFormField(t: 'Confirm Password'),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Choose your categories:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 32),
                        ),
                      ),
                      const CategoriesScreen(),
                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Handle form submission
                            }
                          },
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.brown),
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.white)),
                          child: const Text('Create Account',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class RegisterFormField extends StatelessWidget {
  final String t;

  RegisterFormField({super.key, required this.t});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white60,
          labelText: t,
          border: const OutlineInputBorder(),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $t';
          }
          return null;
        },
      ),
    );
  }
}

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<String> categories = [];
  Map<String, bool> checkedCategories = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  // Function to fetch categories from Fake Store API
  Future<void> fetchCategories() async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'));

    if (response.statusCode == 200) {
      List<String> fetchedCategories =
          List<String>.from(json.decode(response.body));

      // Initialize the checkbox state for each category
      setState(() {
        categories = fetchedCategories;
        checkedCategories = {for (var category in categories) category: false};
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load categories');
    }
  }

  // Toggle checkbox state for a category
  void toggleCheckbox(String category) {
    setState(() {
      checkedCategories[category] = !(checkedCategories[category] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator()) // Loading spinner
        : SizedBox(
            height: 200, // Give the ListView a fixed height
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Checkbox(
                      value: checkedCategories[category],
                      onChanged: (bool? value) {
                        toggleCheckbox(category);
                      },
                    ),
                    title: Text(category),
                  ),
                );
              },
            ),
          );
  }
}
