import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoverpayClean/src/presentation/blocs/login/login_bloc.dart';
import 'package:hoverpayClean/src/shared/config/di.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _bloc = sl<LoginBloc>();

  String email;
  String password;

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
      ),
      body: body(),
    );
  }

  Widget body() {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [form()],
            ),
          );
        },
      ),
    );
  }

  Widget form() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            suffixIcon: Icon(Icons.email),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onChanged: handleEmailChange,
        ),
        SizedBox(height: 10.0),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: Icon(Icons.donut_small),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onChanged: handlePasswordChange,
        ),
        RaisedButton(child: Text('Login'), elevation: 5.0, onPressed: doLogin)
      ],
    );
  }

  void doLogin() {
    _bloc.add(DoLogin(email: email, password: password));
  }

  void handleEmailChange(String value) => setState(() => email = value);

  void handlePasswordChange(String value) => setState(() => password = value);
}
