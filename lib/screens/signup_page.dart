import 'package:fhouse/resources/auth.dart';
import 'package:fhouse/screens/homepage.dart';
import 'package:fhouse/screens/login_page.dart';
import 'package:fhouse/utils/universal_variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  final AuthImplementation auth;

  const SignupPage({Key key, this.auth}) : super(key: key);
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String email, password;
  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            'Fuoye House',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 25,
              fontWeight: FontWeight.bold,
              color: UniversalVariables.mainColor,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: emailInputController,
        validator: emailValidator,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email, color: UniversalVariables.barColor),
          labelText: 'Email',
          hintText: "john.doe@gmail.com",
        ),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: pwdInputController,
        validator: pwdValidator,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: UniversalVariables.barColor,
          ),
          labelText: 'Password',
          hintText: "********",
        ),
      ),
    );
  }

  Widget _buildConfirmPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: confirmPwdInputController,
        validator: pwdValidator,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: UniversalVariables.barColor,
          ),
          labelText: 'Password',
          hintText: "********",
        ),
      ),
    );
  }

  Widget _buildJambRegRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: jambRegInputController,
        validator: jmbRegValidator,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: UniversalVariables.barColor,
          ),
          labelText: 'Jamb Reg. Number',
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = _registerFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      setState(() {
        _isLoading = true;
      });

      if (_registerFormKey.currentState.validate()) {
        if (pwdInputController.text == confirmPwdInputController.text) {
          String userId = await widget.auth
              .signUp(emailInputController.text, pwdInputController.text);
          //dialogBox.information(context, "Congratulations,", " you are logged in successfully");
          widget.auth.getCurrentUser().then((FirebaseUser user) {
            widget.auth
                .addDataToDb(
                    user, jambRegInputController.text, pwdInputController.text)
                .then((result) => {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                          (_) => false),
                      emailInputController.clear(),
                      jambRegInputController.clear(),
                      pwdInputController.clear(),
                      confirmPwdInputController.clear()
                    })
                .catchError((err) => print(err))
                .catchError((err) => print(err));
            setState(() {
              _isLoading = false;
            });
          });
          print("Login userId = $userId");
          setState(() {
            _isLoading = false;
          });
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Error"),
                  content: Text("The passwords do not match"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Close"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              });
        }
      }
    }
  }

  Widget _buildSignupButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(bottom: 20, top: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: UniversalVariables.barColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {
              validateAndSubmit();
            },
            child: Text(
              "Sign Up",
              style: TextStyle(
                color: UniversalVariables.mainColor,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: UniversalVariables.mainColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "SignUp",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 30,
                        color: UniversalVariables.barColor,
                      ),
                    ),
                  ],
                ),
                _buildEmailRow(),
                _buildJambRegRow(),
                _buildPasswordRow(),
                _buildConfirmPasswordRow(),
                _buildSignupButton(),
                //  _buildOrRow(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 40),
          child: FlatButton(
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage())),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(
                    color: UniversalVariables.barColor,
                    fontSize: MediaQuery.of(context).size.height / 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'Login',
                  style: TextStyle(
                    color: UniversalVariables.barColor,
                    fontSize: MediaQuery.of(context).size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ]),
            ),
          ),
        ),
      ],
    );
  }

  bool _isLoading = false;
  Widget showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  // TextEditingController firstNameInputController;
  TextEditingController jambRegInputController;
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;

  @override
  initState() {
    // firstNameInputController = new TextEditingController();
    jambRegInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();
    super.initState();
  }

  String emailValidator(String value) {
    // This is just a regular expression for email addresses
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      // So, the email is valid
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  String jmbRegValidator(String value) {
    if (value.length < 8) {
      return 'Reg. Number must be longer than 6 characters';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                color: UniversalVariables.barColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(70),
                  bottomRight: const Radius.circular(70),
                ),
              ),
            ),
          ),
          showCircularProgress(),
          Form(
            key: _registerFormKey,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildLogo(),
                  _buildContainer(),
                  _buildLoginBtn(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
