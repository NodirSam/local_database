import 'package:flutter/material.dart';
import 'package:local_database/service/log_service.dart';

import '../model/user_model.dart';
import '../service/HiveService.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  var nameController = TextEditingController();
  var passwordController = TextEditingController();


  // @override
  // void initState() {
  //   super.initState();
  //   //Use Hive Service
  //   var user = User("1112", "adad@gmail.com", "adasdasdad");
  //
  //   GetService.storeUser(user);
  //   var user2 = GetService.loadUser();
  //
  //   // HiveService.storeUser(user);
  //   // var user2 = HiveService.loadUser();
  //   LogService.i(user2.toJson().toString());
  //
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var user = User(nameController.text.toString().trim(),
        passwordController.text.toString().trim());
    HiveService.storeUser(user);
    var user2 = HiveService.loadUser();
    LogService.i(user2.toJson().toString());
  }

  _doSignUp() async {
    String name = nameController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    var user = User(name, password);
    HiveService.storeUser(user);
    var user2 = HiveService.loadUser();
    LogService.i(user2.toJson().toString());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 150,),

            //IMAGE
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(image: AssetImage("assets/images/image.jpeg",))
              ),
            ),

            const SizedBox(height: 15,),
            
            const Text("Welcome Back!", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),

            const SizedBox(height: 10,),
            
            const Text("Sign in to continuo", style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),),

            const SizedBox(height: 30,),

            //name
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              width: 400,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(25)),
              child: TextField(
                controller: nameController,
                style: const TextStyle(color: Colors.blue),
                decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: "User Name",
                    //border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 17, color: Colors.grey)),
              ),
            ),

            const SizedBox(height: 20,),

            //password
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              width: 400,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25)),
              child: TextField(
                controller: passwordController,
                style: const TextStyle(color: Colors.blue),
                decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: "Password",
                    //border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 17, color: Colors.grey)),
              ),
            ),

            const SizedBox(height: 30,),
            
            const Text("Forgot Password?", style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),),

            const SizedBox(height: 55,),

            //button
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: Colors.blue[900],
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue,
                    Colors.cyanAccent,
                  ]
                )
              ),
              child: IconButton(
                onPressed: (){
                  _doSignUp();
                },
                icon: const Icon(Icons.arrow_right_alt, size: 50, color: Colors.white,),
              ),
            ),
            
            const SizedBox(height: 70,),
            
            Container(
              padding: const EdgeInsets.only(left: 75, top: 90),
              child: Row(
                children: const [
                  Text("Don't have an account?", style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),),
                  SizedBox(width: 5,),
                  Text("SIGN UP", style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),),
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
