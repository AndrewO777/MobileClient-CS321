import 'package:flutter/material.dart';
import '../models/School.dart';
import '../models/Announcement.dart';
import '../providers/api_service_provider.dart';
import '../providers/notification_manager_provider.dart';
import '../services/cached_school_service.dart';
import '../services/cached_announcement_service.dart';
import '../database/database_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late final CachedSchoolService _schoolService;
  late final CachedAnnouncementService _announcementService;
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    final database = DatabaseProvider.instance;
    final apiService = ref.read(apiServiceProvider);
    _schoolService = CachedSchoolService(apiService, database);
    _announcementService = CachedAnnouncementService(apiService, database);
    final nm = ref.read(notificationManagerProvider);
    nm.initialize();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await Future.wait([
      _schoolService.loadSchool(),
      _announcementService.loadAnnouncements(),
    ]);
  }

  Future<void> _refreshData() async {
    setState(() => _isRefreshing = true);
    await Future.wait([
      _schoolService.refreshSchool(),
      _announcementService.refreshAnnouncements(),
    ]);
    setState(() => _isRefreshing = false);
  }

  @override
  Widget build(BuildContext context) {
    // ... rest of the build method stays the same
    return Scaffold(
      body: StreamBuilder<School?>(
        stream: _schoolService.watchSchool(),
        builder: (context, schoolSnapshot) {
          return StreamBuilder<List<Announcement>>(
            stream: _announcementService.watchAnnouncements(),
            builder: (context, announcementSnapshot) {
              // Show loading only if waiting AND no cached data
              final hasSchoolData = schoolSnapshot.hasData && schoolSnapshot.data != null;
              final hasAnnouncementData = announcementSnapshot.hasData &&
                  announcementSnapshot.data != null &&
                  announcementSnapshot.data!.isNotEmpty;

              if (schoolSnapshot.connectionState == ConnectionState.waiting &&
                  !hasSchoolData &&
                  announcementSnapshot.connectionState == ConnectionState.waiting &&
                  !hasAnnouncementData) {
                return const Center(child: CircularProgressIndicator());
              }

              final schoolInfo = schoolSnapshot.data;
              final announcements = announcementSnapshot.data ?? [];

              return RefreshIndicator(
                onRefresh: _refreshData,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xFF6A5ACD),
                              const Color(0xFFA67CBA).withOpacity(0.8),
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            if (_isRefreshing)
                              const Padding(
                                padding: EdgeInsets.only(bottom: 16),
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                ),
                              ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: const CircleAvatar(
                                radius: 60,
                                backgroundImage: AssetImage("assets/school_logo.png"),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              schoolInfo?.name ?? 'NERD Tech School',
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              schoolInfo?.email ?? 'Loading...',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              schoolInfo?.phoneNumber ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.campaign,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 28,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Current Announcements',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            if (announcements.isEmpty)
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(32),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.announcement_outlined,
                                        size: 64,
                                        color: Colors.grey[400],
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        'No announcements available',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            else
                              ...announcements.map((announcement) => Card(
                                margin: const EdgeInsets.only(bottom: 12),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        announcement.title ?? 'No Title',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        announcement.message ?? 'No message available',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          height: 1.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}