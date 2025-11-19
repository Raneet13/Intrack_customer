import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_header.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<Map<String, dynamic>> notifications = [
    {
      'id': 1,
      'type': 'alert',
      'icon': Icons.warning,
      'iconColor': Colors.orange,
      'title': 'Low Fuel Alert',
      'message': 'MH12AB1234 fuel level below 20%',
      'time': '10 mins ago',
      'read': false,
    },
    {
      'id': 2,
      'type': 'info',
      'icon': Icons.info,
      'iconColor': Colors.blue,
      'title': 'Trip Completed',
      'message': 'KA05CD5678 completed route Mumbai to Pune',
      'time': '1 hour ago',
      'read': false,
    },
    {
      'id': 3,
      'type': 'success',
      'icon': Icons.check_circle,
      'iconColor': Colors.green,
      'title': 'Maintenance Completed',
      'message': 'GJ01EF9012 service completed successfully',
      'time': '3 hours ago',
      'read': true,
    },
    {
      'id': 4,
      'type': 'alert',
      'icon': Icons.speed,
      'iconColor': Colors.red,
      'title': 'Speed Alert',
      'message': 'DL03GH3456 exceeding speed limit (95 km/h)',
      'time': '5 hours ago',
      'read': true,
    },
    {
      'id': 5,
      'type': 'info',
      'icon': Icons.notifications_active,
      'iconColor': Colors.blue,
      'title': 'Subscription Renewal',
      'message': 'Your subscription will expire in 7 days',
      'time': '1 day ago',
      'read': true,
    },
    {
      'id': 6,
      'type': 'info',
      'icon': Icons.person_add,
      'iconColor': Colors.purple,
      'title': 'New Driver Added',
      'message': 'Ramesh Kumar has been added to your fleet',
      'time': '2 days ago',
      'read': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final unreadCount = notifications.where((n) => !n['read']).length;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: MobileHeader(
        title: 'Notifications',
        subtitle: unreadCount > 0 ? '$unreadCount unread' : 'All caught up!',
        canGoBack: true,
        action: [
          if (unreadCount > 0)
            TextButton(
              onPressed: () {
                setState(() {
                  for (var notification in notifications) {
                    notification['read'] = true;
                  }
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('All notifications marked as read'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text(
                'Mark all read',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 14,
                ),
              ),
            ),
        ],
      ),
      body: notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_off_outlined,
                    size: 64,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No notifications',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'You\'re all caught up!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return _buildNotificationItem(notification);
              },
            ),
    );
  }

  Widget _buildNotificationItem(Map<String, dynamic> notification) {
    final isUnread = !notification['read'];

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: isUnread ? Colors.blue.shade50 : Colors.white,
      child: InkWell(
        onTap: () {
          setState(() {
            notification['read'] = true;
          });
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: (notification['iconColor'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  notification['icon'] as IconData,
                  color: notification['iconColor'] as Color,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            notification['title'] as String,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: isUnread ? FontWeight.w600 : FontWeight.w500,
                            ),
                          ),
                        ),
                        if (isUnread)
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification['message'] as String,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      notification['time'] as String,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
