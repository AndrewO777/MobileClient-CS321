import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  final List<Map<String, dynamic>> eventsItems = const [
    {
      "title": "Grand Opening of the New Cafeteria!!!",
      "date": "2025-09-28",
      "content":
      "We are excited to announce that a brand new cafeteria has opened, providing healthier food options for students. "
          "Come Visit!"
    },
    {
      "title": "Tech Club Meeting",
      "date": "2025-10-05",
      "content":
      "Join us for our monthly Tech Club meeting. We'll be discussing upcoming competitions and projects."
    },
    {
      "title": "Parent-Teacher Conference",
      "date": "2025-10-15",
      "content":
      "Annual parent-teacher conferences will be held. Please schedule your appointment in advance."
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Sort by date (newest first)
    final sortedEvents = [...eventsItems];
    sortedEvents.sort((a, b) => DateTime.parse(b["date"])
        .compareTo(DateTime.parse(a["date"])));

    return Column(
      children: [
        // Header widget that stays at top
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

        // Events list
        Expanded(
          child: ListView.builder(
            itemCount: sortedEvents.length,
            itemBuilder: (context, index) {
              final item = sortedEvents[index];
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
    );
  }
}