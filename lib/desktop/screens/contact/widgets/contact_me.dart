import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/desktop/external_widgets/link.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({super.key});

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      height: 400,
      margin: const EdgeInsets.symmetric(vertical: 45, horizontal: 80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withValues(alpha: 0.5),
            Color(0xFF2C2C2C).withValues(alpha: 0.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    
      child: Row(
        children: [
    
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              
                  Text(
                    "Contact Me",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold
                    ),
                  ),
              
                  SizedBox(height: 5),
              
                  Text(
                    "Do you speak Pashto? It's ok if you don't,\nI can understand English too.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
              
                  SizedBox(height: 20),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
              
                      Link(
                        icon: FontAwesomeIcons.envelope,
                        size: 20,
                        color: Colors.white,
                        url: "",
                      ),
              
                      SizedBox(width: 10),
              
                      Text(
                        "skyisblack95@gmail.com",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
              
                  SizedBox(height: 10),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
              
                      Link(
                        icon: FontAwesomeIcons.phone,
                        size: 20,
                        color: Colors.white,
                        url: "",
                      ),
              
                      SizedBox(width: 10),
              
                      Text(
                        "+92 336 9341134",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
              
                  SizedBox(height: 10),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
              
                      Link(
                        icon: FontAwesomeIcons.locationDot,
                        size: 20,
                        color: Colors.white,
                        url: "",
                      ),
              
                      SizedBox(width: 10),
              
                      Text(
                        "Nowshera, KPK / NUST H-12, Islamabad",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
            ),
          ),
    
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                "assets/images/profile.png",
                fit: BoxFit.contain
              ),
            ),
          ),
    
        ],
      ),
    );
  }
}
