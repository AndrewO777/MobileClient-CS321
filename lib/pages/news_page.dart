import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  final List<Map<String, dynamic>> newsItems = const [
    {
      "title": "New Cafeteria!!!",
      "date": "2025-09-28",
      "content":
      "We are excited to announce that a brand new cafeteria has opened, providing healthier food options for students."
    },
    {
      "title": "We are firing all of our tenured staff...",
      "date": "2025-09-25",
      "content":
      "Important restructuring announcement. Please read the official memo for full details."
    },
    {
      "title": "Free Food on Christmas!",
      "date": "2025-09-20",
      "content":
      "On Christmas Day, the school will provide free meals for students and staff."
    },
    {
      "title": "Local man accused of stealing...",
      "date": "2025-09-18",
      "content":
      "This is a placeholder article. Details pending official confirmation."
    },
    {
      "title": "The Renaissance Men are coming...",
      "date": "2025-09-10",
      "content":
      "The Renaissance Men will perform at the school auditorium. Don't miss this fun event!"
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Sort by date (newest first)
    final sortedNews = [...newsItems];
    sortedNews.sort((a, b) => DateTime.parse(b["date"])
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
                        "News & Announcements",
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

        // News list
        Expanded(
          child: ListView.builder(
            itemCount: sortedNews.length,
            itemBuilder: (context, index) {
              final item = sortedNews[index];
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