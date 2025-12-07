import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_client.dart';
import '../services/about_service.dart';

final aboutProvider = FutureProvider.autoDispose((ref) async {
  final chopperClient = ref.watch(chopperClientProvider);
  final service = AboutService.create(chopperClient);
  final response = await service.getAboutData();
  return response.body ?? {};
});

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(aboutProvider);

    return Scaffold(
      body: Column(
        children: [
          //Header (same layout as Events)
          SafeArea(
            bottom: false,
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.deepPurple.shade100,
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage("assets/school_logo.png"),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About Us",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ✅ Page content
          Expanded(
            child: asyncData.when(
              data: (data) => ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Mission & header content
                  const SizedBox(height: 8),
                  _buildSection(
                    icon: Icons.contact_mail,
                    title: 'Contact Information',
                    content: data['contact'] != null
                        ? "Address: ${data['contact']['address']}\n"
                        "Phone: ${data['contact']['phone']}\n"
                        "Email: ${data['contact']['email']}\n"
                        "Website: ${data['contact']['website']}"
                        : "Address: 123 Tech Boulevard, Innovation City\n"
                        "Phone: (800) 123-NERD\n"
                        "Email: info@nerdtechschool.edu\n"
                        "Website: www.nerdtechschool.edu",
                  ),
                  const SizedBox(height: 12),

                  _buildBioTile(
                    name: data['principal']?['name'] ?? "Dr. Ada Lovelace",
                    title:
                    data['principal']?['title'] ?? "School Principal",
                    bio: data['principal']?['bio'] ??
                        "An inspiring leader dedicated to advancing STEM education for all students.",
                  ),

                  const SizedBox(height: 12),

                  if (data['divisions'] != null)
                    ...List.from(data['divisions']).map((division) {
                      return _buildDivisionTile(
                        divisionName: division['name'] ?? "Division",
                        leader: division['leader'] ?? "N/A",
                        contact: division['contact'] ?? "Not available",
                        programs:
                        List<String>.from(division['programs'] ?? []),
                      );
                    }),

                  const SizedBox(height: 12),

                  _buildSection(
                    icon: Icons.support_agent,
                    title: 'Helpdesk',
                    content: data['helpdesk'] ??
                        "For technical support, contact helpdesk@nerdtechschool.edu or call (800) 555-HELP.",
                  ),
                  const SizedBox(height: 12),

                  _buildSection(
                    icon: Icons.history_edu,
                    title: 'Our History',
                    content: data['history'] ??
                        "Founded in 1985, NERD Tech School grew from a small coding club into a leader in STEM education.",
                  ),
                ],
              ),
              loading: () =>
              const Center(child: CircularProgressIndicator.adaptive()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.deepPurple, size: 28),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(content, style: const TextStyle(fontSize: 16, height: 1.4)),
          ],
        ),
      ),
    );
  }

  Widget _buildBioTile({
    required String name,
    required String title,
    required String bio,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.deepPurple.shade50,
      child: ListTile(
        leading: const CircleAvatar(
          radius: 26,
          backgroundImage: AssetImage("assets/school_logo.png"),
        ),
        title: Text(name,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text("$title\n\n$bio",
            style: const TextStyle(fontSize: 14, height: 1.4)),
      ),
    );
  }

  Widget _buildDivisionTile({
    required String divisionName,
    required String leader,
    required String contact,
    required List<String> programs,
  }) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Text(
        divisionName,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
      subtitle: Text('Leader: $leader'),
      children: [
        ListTile(
          leading: const Icon(Icons.email),
          title: Text('Contact: $contact'),
        ),
        ...programs.map(
              (p) => ListTile(
            leading: const Icon(Icons.arrow_right),
            title: Text(p),
          ),
        ),
      ],
    );
  }
}
