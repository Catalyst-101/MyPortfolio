import 'package:flutter/material.dart';
import 'package:portfolio/desktop/external_widgets/footer.dart';
import 'package:portfolio/desktop/external_widgets/gradient_scaffold.dart';
import 'package:portfolio/desktop/screens/myprojects/widgets/project_search.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({super.key});

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> 
{
  
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      route: "/myprojects",
      children: [

        ProjectSearch(),

        CustomFooter(),

      ], 
    );
  }
}
