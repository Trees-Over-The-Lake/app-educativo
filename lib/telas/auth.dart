import 'package:educativo/telas/registrar.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

/// Tela de autenticação de login
class _AuthState extends State<Auth> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _formValues = {};

    return Scaffold(
      appBar: AppBar(title: Text('Acesso à conta'),centerTitle: true,),
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(30),
                  child: Column(
            children: [
              Text('Acesse sua conta:'),
              Text(''),
              TextFormField(
                key: ValueKey('email'),
                textCapitalization: TextCapitalization.words,
                enableSuggestions: false,
                initialValue: _formValues['email'],
                decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                validator: (value) {
                  if (_isValidEmail(value)) return 'O email precisa ser válido!';
                  return null;
                },
                onSaved: (value) {
                  _formValues['email'] = value;
                },
              ),
              SizedBox(height: 1,),
              TextFormField(
                key: ValueKey('password'),
                initialValue: _formValues['password'],
                decoration: InputDecoration(labelText: 'Senha', border: OutlineInputBorder()),
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty || value.length < 8)
                    return 'A senha deve ter no mínimo 8 caracteres';
                  return null;
                },
                onSaved: (value) {
                  _formValues['password'] = value;
                },
              ),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: () {}, child: Text('Acessar')),
              ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(Registrar.routeName),
                  child: Text('Registrar')),
            ],
          ),
        ),
      )),
    );
  }

  /// Regex simples de validação de email
  bool _isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}
