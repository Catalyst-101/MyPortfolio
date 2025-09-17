import 'package:flutter/material.dart';
import 'package:portfolio/desktop/external_widgets/footer.dart';
import 'package:portfolio/desktop/external_widgets/gradient_scaffold.dart';
import 'package:portfolio/desktop/screens/contact/widgets/contact_form_section.dart';
import 'package:portfolio/desktop/screens/contact/widgets/contact_me.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> 
{
  
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      route: "/contact",
      children: [

        ContactMe(),

        ContactFormSection(),

        SizedBox(height: 50),

        CustomFooter(),

      ], 
    );
  }
}
