import 'package:flutter/material.dart';

class PersonalDataPage extends StatefulWidget {
  const PersonalDataPage({super.key});

  @override
  State<PersonalDataPage> createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  final String name = '';
  final String email = '';
  final String phone = '';
  final String cpf = '';
  final String password = '';
  final String birthdayDate = '';

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
