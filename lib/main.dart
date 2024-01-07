import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'mainpage.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyLoginPage(),
    );
  }
}
class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyLoginPageState createState() => _MyLoginPageState();
}
class _MyLoginPageState extends State<MyLoginPage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  // ignore: non_constant_identifier_names
  final firstname_controller = TextEditingController();
  // ignore: non_constant_identifier_names
  final lastname_controller = TextEditingController();

 final gender_controller = TextEditingController();

 final password_controller = TextEditingController();

  final date_of_birth_controller = TextEditingController();


  SharedPreferences? logindata;
  bool? newuser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }
  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata!.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyDashboard()));
    }
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    firstname_controller.dispose();
    lastname_controller.dispose();
    date_of_birth_controller.dispose();
    gender_controller.dispose();
   // date_of_birth_controller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration by KM"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Registration Page",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text(
                "WELCOME",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: firstname_controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'firstname',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: lastname_controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'lastname',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: gender_controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'gender',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: password_controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: date_of_birth_controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'dob',
                  ),
                ),
              ),
              MaterialButton(
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  String firstname = firstname_controller.text;
                  String lastname = lastname_controller.text;
                  String gender = gender_controller.text;
                  String password = password_controller.text;
                  String dob = date_of_birth_controller.text;
                  
                  if (firstname != '' && lastname != '') {
                    print('Successfull');
                   
                    logindata!.setBool('login', false);
                    logindata!.setString('firstname', firstname);
                    logindata!.setString('lastname', lastname);
                    logindata!.setString('gender', gender);
                    logindata!.setString('password', password);
                    logindata!.setString('dob', dob);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyDashboard()));
                  }
                },
                child: const Text("Log-In"),
              )
            ],
          ),
        ),
      ),
    );
  }
}


