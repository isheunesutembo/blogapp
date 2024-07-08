import 'package:blogapp/core/theme/app_pallete.dart';
import 'package:blogapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blogapp/features/auth/presentation/pages/login_page.dart';
import 'package:blogapp/features/auth/presentation/wiidgets/auth_field.dart';
import 'package:blogapp/features/auth/presentation/wiidgets/auth_gradient_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  static route()=>MaterialPageRoute(builder: (context)=>const SignUpPage());
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
            AuthTextField(hintText: 'Name',controller: nameController,),
            const SizedBox(height: 15,),
            AuthTextField(hintText: 'Email',controller: emailController,),
            const SizedBox(height: 15,),
            AuthTextField(hintText: 'Password',controller: passwordController,isObscuredText: true,),
            const SizedBox(height: 20,),
             AuthGradientButton(buttonText: 'Sign Up',onPressed: (){
               if(formKey.currentState!.validate()){
                context.read<AuthBloc>().add(AuthSignUp(email: emailController.text, password: passwordController.text, name: nameController.text));
               }
             },),
            const SizedBox(height: 20,),
            GestureDetector(
                onTap: (){
                  Navigator.push(context, LogInPage.route());
                },
              child: RichText(text: TextSpan(
                text: 'Already have an acoount ? ',
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                    text: 'Sign In',
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