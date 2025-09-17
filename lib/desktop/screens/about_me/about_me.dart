import 'package:flutter/material.dart';
import 'package:portfolio/desktop/external_widgets/footer.dart';
import 'package:portfolio/desktop/external_widgets/gradient_scaffold.dart';
import 'package:portfolio/desktop/screens/about_me/widgets/about_me_section.dart';
import 'package:portfolio/desktop/screens/about_me/widgets/education_section.dart';
import 'package:portfolio/desktop/screens/about_me/widgets/job_section.dart';
import 'package:portfolio/desktop/screens/about_me/widgets/tecnical_skills.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      route: "/aboutme",
      children: [

        AboutMeSection(),

        SizedBox(height: 70),

        TechnicalSkills(),

        SizedBox(height: 60),

        EducationSection(),

        SizedBox(height: 60),

        JobSection(),

        SizedBox(height: 100),

        CustomFooter(),
      ],
    );
  }
}
