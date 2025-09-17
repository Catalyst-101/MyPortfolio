import 'package:flutter/material.dart';
import 'package:portfolio/desktop/external_widgets/gradient_scaffold.dart';
import 'package:portfolio/desktop/screens/home_page/widgets/aboutme_widget.dart';
import 'package:portfolio/desktop/screens/home_page/widgets/body.dart';
import 'package:portfolio/desktop/external_widgets/footer.dart';
import 'package:portfolio/desktop/screens/home_page/widgets/faqs_section.dart';
import 'package:portfolio/desktop/screens/home_page/widgets/khan_news.dart';
import 'package:portfolio/desktop/screens/home_page/widgets/portfolio_timeline.dart';
import 'package:portfolio/desktop/screens/home_page/widgets/skill_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> 
{

  @override
  Widget build(BuildContext context) 
  {
    return GradientScaffold(
      route: "/",
      children: [

        Body(),
      
        SizedBox(height: 150),

        // KhanNews(),

        // SizedBox(height: 100),

        AboutMeWidget(),

        SizedBox(height: 100),

        PortfolioTimeline(),

        SizedBox(height: 100),

        SkillsSection(),

        SizedBox(height: 100),

        FAQSection(),

        SizedBox(height: 100),

        CustomFooter(),

      ],
    );
  }
}
