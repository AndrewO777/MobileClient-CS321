import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  final List<Map<String, dynamic>> eventsItems = const [
    {
      "title": "Grand Opening of the New Cafeteria!!!",
      "date": "2025-09-28",
      "content":
      "We are excited to announce that a brand new cafeteria has opened, providing healthier food options for students."
          "Come Visit!"
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Sort by date (newest first)
    final sortedevents = [...eventsItems];
    sortedevents.sort((a, b) => DateTime.parse(b["date"])
        .compareTo(DateTime.parse(a["date"])));

    return Scaffold(
      body: Column(
        children: [
          // Wrap header in SafeArea (so camera and info does not cover header)
          SafeArea(
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "NERD Tech School",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Events",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          // events list
          Expanded(
            child: ListView.builder(
              itemCount: sortedevents.length,
              itemBuilder: (context, index) {
                final item = sortedevents[index];
                final date = DateTime.parse(item["date"]);
                return ExpansionTile(
                  leading: const Icon(Icons.campaign, color: Colors.deepPurple),
                  title: Text(item["title"]),
                  subtitle: Text("${date.month}/${date.day}/${date.year}"),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(item["content"]),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}