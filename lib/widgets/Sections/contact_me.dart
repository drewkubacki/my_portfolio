import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactMe extends StatefulWidget {
  const ContactMe({super.key});

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  final emailName = TextEditingController();
  final emailSender = TextEditingController();
  final emailSubject = TextEditingController();
  final emailMessage = TextEditingController();
  var _buttonText = "Send Email";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              offset: const Offset(5, 15),
              color: Colors.black.withOpacity(.1),
              blurRadius: 15,
            )
          ]),
      child: Column(
        children: [
          buildTextField(title: 'Name', controller: emailName),
          buildTextField(title: 'Email', controller: emailSender),
          buildTextField(title: 'Subject', controller: emailSubject),
          buildTextField(
              title: 'Message', controller: emailMessage, maxLines: 5),
          const SizedBox(height: 15),
          ElevatedButton(
            style: ButtonStyle(
              overlayColor: getColor(Theme.of(context).primaryColor,
                  Theme.of(context).highlightColor),
            ),
            onPressed: () {
              sendEmail(
                name: emailName.text,
                email: emailSender.text,
                subject: emailSubject.text,
                message: emailMessage.text,
              );
            },
            child: Text(_buttonText),
          )
        ],
      ),
    );
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    getColor(Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    }

    return MaterialStateProperty.resolveWith(getColor);
  }

  Future sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    const serviceId = 'service_czbk4j9';
    const templateId = 'template_w3subh8';
    const userId = 'Vt1WAS8wuxuoYjksX';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'origin': 'http://localhost',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_subject': subject,
          'user_message': message,
        }
      }),
    );
    if (response.statusCode == 200) {
      setState(() {
        _buttonText = "Sent!";
      });
    } else {
      setState(() {
        _buttonText = "Failed...";
      });
    }
  }

  Widget buildTextField({
    required String title,
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
