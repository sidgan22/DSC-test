import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'disPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
class RegisterForm extends StatefulWidget {
  const RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _agreedToTOS = true;
  final dtnow = DateTime.now();
  TextEditingController emailctrl,namectrl,phctrl,passctrl,dobctrl;
  final format=DateFormat('dd-MM-yyyy');
  bool _obscureText = true;

  void gapi()
  {
    setState(() {

    });
  }
  Widget TextFormFieldBld(int maxlen,bool af,String ht,String lt,Widget ic,TextInputType t1,TextEditingController c1)
  {
    return TextFormField(
      autovalidate: true,
      controller: c1,
      autofocus: af,
      decoration: InputDecoration(
        hintText: ht,
        labelText: lt,
        prefixIcon: ic
      ),
      maxLength: maxlen,
      keyboardType: t1,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child:
                Container(
                  color: Colors.redAccent,
                  child:
                  Image.asset("assets/logo.jpeg"),
                ),
          ),
          const SizedBox(height: 16.0),
          TextFormFieldBld(null, true, 'Email', 'Enter your e-mail ID',Icon(FontAwesomeIcons.envelope),TextInputType.emailAddress,emailctrl),
          const SizedBox(height: 16.0),
          TextFormFieldBld(40, false, 'Full Name', 'Enter your full name', Icon(Icons.people),TextInputType.text,namectrl),
          const SizedBox(height: 16.0),
          TextFormFieldBld(10, false, 'Phone Number', 'Enter phone number', Icon(Icons.phone),TextInputType.number,phctrl),
          const SizedBox(height: 16.0),
          TextFormField(
              autofocus: false,
              controller: passctrl,
              obscureText: _obscureText,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Choose a password',
                labelText: 'Password',
                prefixIcon: Icon(Icons.vpn_key),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    semanticLabel:
                    _obscureText ? 'show password' : 'hide password',
                  ),
                ),
              ),
              ),
          const SizedBox(height: 16.0),
          DateTimePickerFormField(
            inputType: InputType.date,
            editable: true,
            controller: dobctrl,
            format: format,
            decoration: const InputDecoration(
              labelText: 'Date of birth',
              hintText: 'dd-MM-yyyy',
              prefixIcon: Icon(Icons.cake),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: _agreedToTOS,
                  onChanged: _setAgreedToTOS,
                ),
                GestureDetector(
                  onTap: () => _setAgreedToTOS(!_agreedToTOS),
                  child: const Text(
                    'I agree to the Terms of Services and Privacy Policy',
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              const Spacer(),
              OutlineButton(
                highlightedBorderColor: Colors.black,
                onPressed: _submittable() ? _submit : null,
                child: const Text('Register'),
              ),
            ],
          ),
          const SizedBox(height: 16.0,),
          Column(
            children: <Widget>[
              RaisedButton(
                padding: EdgeInsets.all(20.0),
                elevation: 3.0,
                onPressed: gapi,
                color: Colors.red,
                textColor: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.google),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                          "Signup with Google"
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool _submittable() {
    return _agreedToTOS;
  }

  void _submit() {
    _formKey.currentState.validate();
    showDummy();
    print("Done");
  }
  void showDummy()
  {
    Fluttertoast.showToast(
        msg: "This is Colored Toast with android duration of 5 Sec",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }
  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
  }
}
