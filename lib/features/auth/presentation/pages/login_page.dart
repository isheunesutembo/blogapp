import 'package:blogapp/core/theme/app_pallete.dart';
import 'package:blogapp/features/auth/presentation/pages/signup_page.dart';
import 'package:blogapp/features/auth/presentation/wiidgets/auth_field.dart';
import 'package:blogapp/features/auth/presentation/wiidgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogInPage extends StatefulWidget {
  static route()=>MaterialPageRoute(builder: (context)=>const LogInPage());
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final formKey=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final nameController=TextEditingController();
  final passwordController=TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key:formKey ,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
            const Text("Sign Up",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
            const SizedBox(height: 30,),
         
            const SizedBox(height: 15,),
            AuthTextField(hintText: 'Email',controller: emailController,),
            const SizedBox(height: 15,),
            AuthTextField(hintText: 'Password',controller: passwordController,isObscuredText: true,),
            const SizedBox(height: 20,),
             AuthGradientButton(buttonText: 'Sign Up',onPressed: (){

            },),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, SignUpPage.route());
              },
              child: RichText(text: TextSpan(
                text: 'Don\'t have an account? ',
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                    text: 'Sign Up',
                    style:  Theme.of(context).textTheme.titleMedium
                    ?.copyWith(color: AppPalette.gradient2,
                    fontWeight:FontWeight.bold ),
                    
                    
                  )
                ]
              )),
            )
          ],),
        ),
      )
    );
  }
}