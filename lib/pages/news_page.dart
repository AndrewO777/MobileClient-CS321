import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/SchoolNews.dart';
import '../services/news_service.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final NewsService _newsService = NewsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School News'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder<List<SchoolNews>>(
        future: _newsService.getNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Error state
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      'Error loading news',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () => setState(() {}),
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }

          // Success state
          if (snapshot.hasData) {
            final newsList = snapshot.data!;
            if (newsList.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.newspaper_outlined, size: 64, color: Colors.grey[400]),
                    const SizedBox(height: 16),
                    Text(
                      'No news available',
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                    ),
                  ],
                ),
              );
            }

            // Sort newest
            final sortedNews = [...newsList]
              ..sort((a, b) => b.datePublished.compareTo(a.datePublished));

            return Column(
              children: [
                // Header
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
                  child: RefreshIndicator(
                    onRefresh: () async => setState(() {}),
                    child: ListView.builder(
                      itemCount: sortedNews.length,
                      itemBuilder: (context, index) {
                        final news = sortedNews[index];
                        return ExpansionTile(
                          leading: const Icon(Icons.campaign, color: Colors.deepPurple),
                          title: Text(news.headline ?? 'No Headline'),
                          subtitle: Text(
                            DateFormat('MMM dd, yyyy').format(news.datePublished),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    news.content ?? 'No content available',
                                    style: const TextStyle(height: 1.4),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.person, size: 16, color: Colors.grey[600]),
                                      const SizedBox(width: 4),
                                      Text(
                                        news.author ?? 'Unknown',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(child: Text('No data available.'));
        },
      ),
    );
  }
  }