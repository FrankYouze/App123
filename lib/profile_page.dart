import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String fullName;
  final String email;
  final String password;

  ProfilePage(
      {required this.fullName, required this.email, required this.password});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final  DatabaseReference userData = FirebaseDatabase.instance.ref().child("RegUsers");
  final FirebaseAuth auth = FirebaseAuth.instance;
  Map<String,dynamic> data = {};
  String name = '';
  String email= '';
  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(text: widget.fullName);
    _emailController = TextEditingController(text: widget.email);
    _passwordController = TextEditingController(text: widget.password);


        final User? user = auth.currentUser;
    final uid = user?.uid;
 userData.child(uid!).onValue.listen((event) {
      setState(() {
        data = Map<String, dynamic>.from(
            event.snapshot.value as Map<dynamic, dynamic>);

     //   print("${UserMap['PhoneNumber']} idiii");

        name = data['Name'];
        email = data['PhoneNumber'];
        print(name);
      });
    });

  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage(
                      'assets/image.png'), // Replace with user's profile image if available
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Full Name',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ListTile(
              tileColor: Colors.grey,
              title: Text(name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),
            
              SizedBox(height: 20.0),
              Text(
                'Email',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
    ListTile(
      tileColor: Colors.grey,
      title: Text(email,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),
              SizedBox(height: 20.0),
              Text(
                'Password',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Save the updated profile information
                        setState(() {
                          // Update user profile logic here
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Profile updated successfully!')),
                        );
                      },
                      child: Text('Save Changes'),
                    ),
                    SizedBox(height: 20,),

                       ElevatedButton(
                      onPressed: () {
                        // Save the updated profile information
                        setState(() {
                          // Update user profile logic here
                           FirebaseAuth.instance.signOut();
                        });
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(content: Text('Profile updated successfully!')),
                        // );
                      },
                      child: Text('SIGN OUT'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
