import 'package:amazon_clone/common/custom_button.dart';
import 'package:amazon_clone/common/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/services/auth_services.dart';
import 'package:flutter/material.dart';

enum Auth{
  signIn ,
  signUp ,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
 const AuthScreen({Key? key}) : super(key: key);
 
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
 final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
 


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }
   
   void signUpUser(){
    authService.signUpUser(
      context: context, 
      email: _emailController.text, 
      password: _passwordController.text, 
      name: _nameController.text
      );
   }

    void signInUser(){
    authService.signInUser(
      context: context, 
      email: _emailController.text, 
      password: _passwordController.text, 
     
      );
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
       body: SafeArea(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [

               const Text('Welcome!!',style: TextStyle(
                 fontSize: 22,
                 fontWeight: FontWeight.w500,
                ),
               ),
               //sign up
               ListTile(
                 tileColor: _auth== Auth.signUp? GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundColor,
                 title: const Text('Create Account',
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                   ),
                 ),
                 leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                   value: Auth.signUp,
                   groupValue: _auth,
                   onChanged: (Auth?val){
                      setState(() {
                        _auth = val!;
                      });
                   },
                 ),
               ),
               if(_auth == Auth.signUp)
                 Container(
                   padding: EdgeInsets.all(8),
                   color: GlobalVariables.backgroundColor,
                 child: Form(
                   key: _signUpFormKey,
                   child: Column(
                     children: [
                       CustomTextField(controller: _nameController, hintText: 'Name',),
                       const SizedBox(height: 10),
                       CustomTextField(controller: _emailController, hintText: 'E-mail',),
                       const SizedBox(height: 10),
                       CustomTextField(controller: _passwordController, hintText: 'Password',),
                       const SizedBox(height: 10),
                       CustomButton(text: 'Sign-Up', onTap: (){
                             if(_signUpFormKey.currentState!.validate()){
                            signUpUser();
                          }
    },),

                     ],

                   ),

                 ),
    ),

               //sign in
               ListTile(
                 tileColor: _auth== Auth.signIn? GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundColor,
                 title: const Text('Sign-In',
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 leading: Radio(
                   activeColor: GlobalVariables.secondaryColor,
                   value: Auth.signIn,
                   groupValue: _auth,
                   onChanged: (Auth?val){
                     setState(() {
                       _auth = val!;
                     });
                   },
                 ),
               ),
               if(_auth == Auth.signIn)
                 Container(
                   padding: EdgeInsets.all(8),
                   color: GlobalVariables.backgroundColor,
                   child: Form(
                     key: _signInFormKey,
                     child: Column(
                       children: [
                         CustomTextField(controller: _emailController, hintText: 'E-mail',),
                         const SizedBox(height: 10),
                         CustomTextField(controller: _passwordController, hintText: 'Password',),
                         const SizedBox(height: 10),
                         CustomButton(text: 'Sign-In', onTap: (){
                            if(_signInFormKey.currentState!.validate()) {
                              signInUser();
                            }
                         },),
                       ],

                     ),

                   ),
                 ),
             ],
           )),
    );
  }
}
