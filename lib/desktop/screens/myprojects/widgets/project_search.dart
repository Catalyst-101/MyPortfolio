import 'package:flutter/material.dart';
import 'package:portfolio/desktop/screens/myprojects/widgets/project_card.dart';

class ProjectSearch extends StatefulWidget {
  const ProjectSearch({super.key});

  @override
  State<ProjectSearch> createState() => _ProjectSearchState();
}

class _ProjectSearchState extends State<ProjectSearch> {
  final List<Project> projects = [
    Project("Portfolio Website", "A responsive portfolio built with Flutter Web.", "assets/images/profile.png", "https://example.com", "https://github.com/example", "Frontend", "11/08/2025", isNew: true),
    Project("E-Commerce App", "Full-stack mobile app with cart and payments.", "assets/images/profile.png", "https://example.com", "https://github.com/example", "Full Stack Mobile", "05/08/2025"),
    Project("Blog Platform", "A full stack web blog system.", "assets/images/profile.png", "https://example.com", "https://github.com/example", "Full Stack Web", "28/07/2025"),
    Project("Game", "Tank battle game in C++ SFML.", "assets/images/profile.png", "https://example.com", "https://github.com/example", "Other", "11/06/2025"),
    Project("Game", "Tank battle game in C++ SFML.", "assets/images/profile.png", "https://example.com", "https://github.com/example", "Other", "11/06/2025"),
    Project("Game", "Tank battle game in C++ SFML.", "assets/images/profile.png", "https://example.com", "https://github.com/example", "Other", "11/06/2025"),
  ];

  String selectedCategory = "All";
  String searchQuery = "";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Project> featured = projects.take(2).toList();
    List<Project> filteredProjects = projects.where((p) {
      final matchesCategory = selectedCategory == "All" || p.category == selectedCategory || (selectedCategory == "New" && p.isNew);
      final matchesSearch = p.title.toLowerCase().contains(searchQuery.toLowerCase()) || p.description.toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Center(child: Text("My Projects", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center)),
            const SizedBox(height: 6),
            const Center(child: Text("A collection of my works in frontend, full-stack, and mobile apps.", style: TextStyle(fontSize: 16, color: Colors.white70), textAlign: TextAlign.center)),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      hintText: "Search projects...",
                      hintStyle: const TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: const Color(0xFF2A2A2A),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.white54)
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.white, width: 1.5),
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        searchQuery = val;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                DropdownButtonHideUnderline(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                    decoration: BoxDecoration(color: const Color(0xFF2A2A2A), borderRadius: BorderRadius.circular(15)),
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(15),
                      dropdownColor: const Color(0xFF2A2A2A),
                      value: selectedCategory,
                      items: ["All", "New", "Frontend", "Full Stack Web", "Full Stack Mobile", "Other"]
                          .map((cat) => DropdownMenuItem(value: cat, child: Text(cat, style: const TextStyle(color: Colors.white))))
                          .toList(),
                      onChanged: (val) {
                        if (val != null) {
                          setState(() {
                            selectedCategory = val;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (isLoading) ...[
              const Center(child: CircularProgressIndicator(color: Colors.deepOrange)),
              const SizedBox(height: 12),
              const Center(child: Text("Getting the projects...", style: TextStyle(color: Colors.white54)))
            ] else if (filteredProjects.isEmpty) ...[
              const Center(child: Text("No projects found.", style: TextStyle(color: Colors.white54, fontSize: 18)))
            ] else ...[
              const Text("Featured Projects", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 16),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: featured.map((p) => SizedBox(
                      width: constraints.maxWidth > 900 ? (constraints.maxWidth - 64) / 3 : constraints.maxWidth > 600 ? (constraints.maxWidth - 32) / 2 : constraints.maxWidth,
                      child: ProjectCard(project: p),
                    )).toList(),
                  );
                },
              ),
              const SizedBox(height: 32),
              const Text("All Projects", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 16),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: filteredProjects.map((p) => SizedBox(
                      width: constraints.maxWidth > 900 ? (constraints.maxWidth - 64) / 3 : constraints.maxWidth > 600 ? (constraints.maxWidth - 32) / 2 : constraints.maxWidth,
                      child: ProjectCard(project: p),
                    )).toList(),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
