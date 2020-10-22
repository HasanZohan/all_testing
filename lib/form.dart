import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _name;
  String _age;
  String _phoneNumber;
  String _email;
  String _password;

  //TextEditingController ectrl = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool showPassword = true;

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name",
          prefixIcon: Icon(Icons.account_circle),
          //hintStyle: TextStyle(color: Colors.grey),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      //maxLength: 10,
      validator: (String value) {
        _name = value;
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildAge() {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Your Age",
          prefixIcon: Icon(Icons.attribution_sharp),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      maxLength: 3,
      keyboardType: TextInputType.number,
      validator: (String value) {
        _age = value;
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _age = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Phone Number",
          prefixIcon: Icon(Icons.add_to_home_screen),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        _phoneNumber = value;
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          prefixIcon: Icon(Icons.email),
          //hintStyle: TextStyle(color: Colors.grey),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
          child: Icon(
            showPassword ? Icons.visibility : Icons.visibility_off,
          ),
        ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          prefixIcon: Icon(Icons.lock),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      keyboardType: TextInputType.visiblePassword,
      obscureText: showPassword,
      validator: (String value) {
        _password = value;
        if (value.isEmpty) {
          return 'Password is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _buildConfirmPassword() {
    return TextFormField(
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            child: Icon(
              showPassword ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Confirm Password",
          prefixIcon: Icon(Icons.lock),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      keyboardType: TextInputType.visiblePassword,
      obscureText: showPassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }
        if (value == _password) {
          // print(value);
          // print(_password);
          return null;
        }
        return "Password doesn't Match";
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Sign Up Form",
            textAlign: TextAlign.center,
          )),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 25.0),
              _buildName(),
              SizedBox(height: 25.0),
              _buildAge(),
              SizedBox(height: 10.0),
              _buildPhoneNumber(),
              SizedBox(height: 25.0),
              _buildEmail(),
              SizedBox(height: 25.0),
              _buildPassword(),
              SizedBox(height: 25.0),
              _buildConfirmPassword(),
              SizedBox(height: 35),
              RaisedButton(
                color: Colors.green,
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();

                  print(_name);
                  print(_age);
                  print(_phoneNumber);
                  print(_email);
                  print(_password);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );

                  _formKey.currentState.reset();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _emailCheck;
  String _passwordCheck;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool showPassword = true;

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          prefixIcon: Icon(Icons.email),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        //else if (value == _email) {}

        return null;
      },
      onSaved: (String value) {
        _emailCheck = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            child: Icon(
              showPassword ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          prefixIcon: Icon(Icons.lock),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      keyboardType: TextInputType.visiblePassword,
      obscureText: showPassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _passwordCheck = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Sign Up Form",
            textAlign: TextAlign.center,
          )),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildEmail(),
              SizedBox(height: 25.0),
              _buildPassword(),
              SizedBox(height: 35),
              RaisedButton(
                color: Colors.green,
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();

                  print(_emailCheck);
                  print(_passwordCheck);

                  _formKey.currentState.reset();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
