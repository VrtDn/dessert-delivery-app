import 'package:dessert_delivery_app/hive_db.dart';
import 'package:flutter/material.dart';

class CardInfoScreen extends StatefulWidget {
  const CardInfoScreen({super.key, required this.callback});

  @override
  _CardInfoScreenState createState() => _CardInfoScreenState();
  final Function() callback;
}

class _CardInfoScreenState extends State<CardInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter card number';
    } else if (value.length != 16) {
      return 'Card number must be 16 digits';
    }
    return null;
  }

  String? validateExpiryDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter expiry date';
    } else if (!RegExp(r'^(0[1-9]|1[0-2])\/?([0-9]{4}|[0-9]{2})$')
        .hasMatch(value)) {
      return 'Expiry date must be MM/YY';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter name';
    }
    return null;
  }

  Widget buildPasswordField(String hint, TextEditingController controller,
      var validator, IconData icon) {
    return Container(
      height: 52,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(icon),
          hintText: hint,
          hintStyle: const TextStyle(
              fontFamily: 'BalooThambi2', color: Colors.black, fontSize: 16),
          filled: true,
          fillColor: Colors.white,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
        ),
        style: const TextStyle(
          fontFamily: 'BalooThambi2',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Card Information',
          style: TextStyle(fontFamily: 'BalooThambi'),
        ),
        leading: GestureDetector(
          onTap: (){
            widget.callback();
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/icons/arrow_left_icon.png", height: 8, width: 8,),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Card number',
                  style: TextStyle(fontFamily: 'BalooThambi2', fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                buildPasswordField('**** **** **** ****', _cardNumberController,
                    validateCardNumber, Icons.numbers_outlined),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Expiry date',
                  style: TextStyle(fontFamily: 'BalooThambi2', fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                buildPasswordField('MM / YY', _expiryDateController,
                    validateExpiryDate, Icons.date_range_outlined),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Name',
                  style: TextStyle(fontFamily: 'BalooThambi2', fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                buildPasswordField('First name', _firstNameController,
                    validateName, Icons.person_2),
                const SizedBox(
                  height: 10,
                ),
                buildPasswordField('Last name', _lastNameController,
                    validateName, Icons.person_2),
                const SizedBox(height: 32.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        HiveDB().createCard({
                          "number": _cardNumberController.text,
                          "date": _expiryDateController.text,
                          "first": _firstNameController.text,
                          "last": _lastNameController.text,
                        }, _cardNumberController.text);
                        widget.callback();
                        Navigator.pop(context);

                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff7851A1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 120.0),
                    ),
                    child: const Text(
                      'create card',
                      style: TextStyle(
                        fontFamily: 'BalooThambi',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
