import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defoultTextForme({
  @required String Function(String?) ? validator,
  @required TextInputType?  type,
  @required TextEditingController? controle,
  @required String? textlable,
  @required IconData ? icon,
  Function (String?)?submint,
  Function (String?)?onchange
})=>
    TextFormField(
    validator:validator,
    keyboardType: type,
    onFieldSubmitted: submint,
    onChanged: onchange,
    controller:controle,
    decoration: InputDecoration(
      border:OutlineInputBorder(), labelText: textlable, prefixIcon: Icon(icon),
),
    );





//https://newsapi.org/v2/
// everything?
// q=Apple&apiKey=8264300126e04b3fa7932e458e11b934&from=2022-05-04