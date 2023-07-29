import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/user_model.dart';
import '../service/HiveService.dart';
import '../service/log_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var user = User(emailController.text.toString().trim(),
        passwordController.text.toString().trim());
    HiveService.storeUser(user);
    var userLoad = HiveService.loadUser();
    LogService.d(userLoad.toJson().toString());
  }

  _doSignUp() async {
    String name = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    var user = User(name, password);
    HiveService.storeUser(user);
    var userLoad = HiveService.loadUser();
    LogService.i(userLoad.toJson().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      body: Column(
        children: [
          Container(
            //height: 300,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 70,),

                //IMAGE
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(image: AssetImage("assets/images/image.jpeg",))
                    ),
                  ),
                ),

                const SizedBox(height: 30,),

                const Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text("Welcome", style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),),
                ),

                const SizedBox(height: 10,),

                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                ),

                SizedBox(height: 40,),

                Container(
                  height: 670,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 50,),
                      Padding(
                        padding: EdgeInsets.only(right: 340),
                        child: Container(
                          child: Text("Email", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: "Email"
                          ),
                        ),
                      ),
                      const SizedBox(height: 70,),
                      Padding(
                        padding: const EdgeInsets.only(right: 300),
                        child: Container(
                          child: const Text("Password", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                              hintText: "Password"
                          ),
                        ),
                      ),

                      const SizedBox(height: 40,),
                      
                      const Text("Forget Password ?", style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w600),),

                      const SizedBox(height: 30,),

                      //Sign In
                      TextButton(
                        onPressed: () {
                          _doSignUp();
                        },
                        child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            height: 60,
                            width: 380,
                            //padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),),
                      ),

                      const SizedBox(height: 30,),

                      Row(
                          children: const <Widget>[
                            Expanded(
                                child: Divider(
                                  thickness: 2,
                                  indent: 30,
                                  endIndent: 5,
                                )
                            ),

                            Text("OR", style: TextStyle(color: Colors.grey, fontSize: 18),),

                            Expanded(
                                child: Divider(
                                  thickness: 2,
                                  indent: 5,
                                  endIndent: 30,
                                )
                            ),
                          ]
                      ),

                      const SizedBox(height: 30,),
                      
                      Padding(
                        padding: const EdgeInsets.only(left: 110),
                        child: Row(
                          children: [
                            Icon(FontAwesomeIcons.facebook, color: Colors.blue[900]),
                            const SizedBox(width: 70,),
                            const Icon(FontAwesomeIcons.twitter, color: Colors.blue,),
                            const SizedBox(width: 70,),
                            const Icon(FontAwesomeIcons.instagram, color: Colors.black,)
                          ],
                        ),
                      ),

                      const SizedBox(height: 30,),

                      Container(
                        padding: const EdgeInsets.only(left: 75, top: 20),
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
