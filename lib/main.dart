import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String number;
    print("$number");
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(1, 46, 57, 17),
      body: Container(
        child: Form(
          child: Column(
            children: <Widget>[
              Container(
                height: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  image: DecorationImage(
                    image: AssetImage('Assets/MainImage1.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        child: Container(
                      margin: EdgeInsets.only(top: 100),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 47,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 2, 20, 4),
                            decoration: BoxDecoration(),
                            child: TextFormField(
                              onSaved: (value) => number = value,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Mobile no.",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[500], fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 100, 30, 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "New User?",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        String pin;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  child: Text(
                "By Signing up, you agree to T&C",
                style: TextStyle(color: Colors.white),
              ))
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.fromLTRB(20, 2, 20, 200),
        child: FloatingActionButton(
            elevation: 0.0,
            child: Icon(Icons.arrow_forward),
            backgroundColor: Colors.orange[700],
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogIn()),
              );
            }),
      ),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(1, 46, 57, 17),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(80, 170, 80, 100),
                child: Text(
                  "Enter code",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 39,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(40, 270, 40, 20),
                child: Text(
                    "We have sent you an SMS on your number with 4 digit verification code.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 350, 20, 10),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(),
                          child: PinEntryTextField(
                            onSubmit: (String pin) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Pin"),
                                      content: Text('Pin entered is $pin'),
                                    );
                                  }); //end showDialog()
                            }, // end onSubmit
                          ),
                        ),
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.deepOrange)),
                            color: Colors.deepOrange,
                            textColor: Colors.white,
                            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                            splashColor: Colors.deepOrange,
                            onPressed: () {
                              /*...*/
                            },
                            child: Text(
                              "Submit",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 25, 20, 50),
                      child: Text(
                        "Did not receive the code?",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 60),
                      child: Text(
                        "OTP didn't match. Verify",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(1, 46, 57, 17),
        body: Container(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(100, 200, 110, 10),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 41,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 350, 80, 0),
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Icon(
                            Icons.person_outline,
                            color: Colors.grey[500],
                            size: 33,
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 14, 8, 10),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "User Name",
                                hintStyle: TextStyle(
                                    color: Colors.grey[500], fontSize: 18)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 80, 0),
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 0.1, horizontal: 0.0),
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Icon(
                            Icons.alternate_email,
                            color: Colors.grey[500],
                            size: 28,
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 14, 8, 10),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Mobile no.",
                                hintStyle: TextStyle(
                                    color: Colors.grey[500], fontSize: 18)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(90, 560, 90, 30),
                child: Text("Emain Id already exist", style:  TextStyle(color: Colors.red, fontSize: 17),) ,
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          padding: EdgeInsets.fromLTRB(20, 2, 35, 290),
          child: FloatingActionButton(
              elevation: 0.0,
              child: Icon(Icons.arrow_forward),
              backgroundColor: Colors.orange[700],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              }),
        ));
  }
}
