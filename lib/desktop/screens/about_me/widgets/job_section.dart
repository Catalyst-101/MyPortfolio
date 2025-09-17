import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/desktop/screens/about_me/widgets/job_card.dart';

class JobSection extends StatelessWidget {
  const JobSection({super.key});

  Future<List<Map<String, dynamic>>> fetchExperiences() async {
    final snapshot = await FirebaseFirestore.instance.collection("experiences").get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "My Experience",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          FutureBuilder<List<Map<String, dynamic>>>(
            future: fetchExperiences(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(color: Colors.white,));
              }
              if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              }
              final experiences = snapshot.data ?? [];
              if (experiences.isEmpty) {
                return const Center(child: Text("No experience data available.", style: TextStyle(color: Colors.white70)));
              }
              return Column(
                children: experiences.map((exp) {
                  var raw = exp["highlights"];
                  List<String> highlights = [];
                  if (raw is String) {
                    highlights = raw.split(',').map((e) => e.trim()).toList();
                  } else if (raw is List) {
                    highlights = List<String>.from(raw);
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ExperienceCard(
                      roleTitle: exp["roleTitle"] ?? "",
                      companyName: exp["companyName"] ?? "",
                      workMode: exp["workMode"] ?? "",
                      duration: exp["duration"] ?? "",
                      highlights: highlights,
                      image: exp["image_url"] ?? "",
                      certificateLink: exp["certificate_url"] ?? "",
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
