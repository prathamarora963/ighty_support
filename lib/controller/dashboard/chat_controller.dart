import 'package:ighty_support/utils/all_imports.dart';

// ── Data Models ───────────────────────────────────────────────────────────────

class ChatMessage {
  final String name;
  final String preview;
  final String time;
  final int unreadCount;
  final bool isOnline;
  final String avatarUrl;

  const ChatMessage({
    required this.name,
    required this.preview,
    required this.time,
    this.unreadCount = 0,
    this.isOnline = false,
    required this.avatarUrl,
  });
}

class ChatGroup {
  final String name;
  final String preview;
  final String time;
  final int unreadCount;
  final List<String> memberAvatars;

  const ChatGroup({
    required this.name,
    required this.preview,
    required this.time,
    this.unreadCount = 0,
    required this.memberAvatars,
  });
}

// ── Controller ────────────────────────────────────────────────────────────────

class ChatController extends GetxController {
  // 0 = Messages, 1 = Groups
  RxInt activeTab = 0.obs;

  void switchTab(int index) => activeTab.value = index;

  // ── Messages ────────────────────────────────────────────────────────────────
  RxList<ChatMessage> messages = <ChatMessage>[
    const ChatMessage(
      name: 'Harrison',
      preview: 'Hi,\nHow are you',
      time: '5 min',
      unreadCount: 1,
      isOnline: true,
      avatarUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
    ),
    const ChatMessage(
      name: 'Steve',
      preview: 'Can we meet in\nLocation',
      time: '8 min',
      unreadCount: 2,
      isOnline: true,
      avatarUrl: 'https://randomuser.me/api/portraits/men/45.jpg',
    ),
    const ChatMessage(
      name: 'Adam',
      preview: 'Hi,\nHow are you',
      time: '10 min',
      unreadCount: 0,
      isOnline: false,
      avatarUrl: 'https://randomuser.me/api/portraits/men/12.jpg',
    ),
    const ChatMessage(
      name: 'Rachel',
      preview: 'Am in the Location, Send me the\nclient contact details',
      time: '15 min',
      unreadCount: 0,
      isOnline: false,
      avatarUrl: 'https://randomuser.me/api/portraits/women/22.jpg',
    ),
    const ChatMessage(
      name: 'Job',
      preview: 'Hi,\nHow are you',
      time: '15 min',
      unreadCount: 10,
      isOnline: true,
      avatarUrl: 'https://randomuser.me/api/portraits/men/55.jpg',
    ),
    const ChatMessage(
      name: 'Jacob',
      preview: 'Can we meet in\nLocation',
      time: '15 min',
      unreadCount: 1,
      isOnline: true,
      avatarUrl: 'https://randomuser.me/api/portraits/men/60.jpg',
    ),
    const ChatMessage(
      name: 'Steve',
      preview: 'Hi,\nHow are you',
      time: '15 min',
      unreadCount: 0,
      isOnline: false,
      avatarUrl: 'https://randomuser.me/api/portraits/men/70.jpg',
    ),
  ].obs;

  // ── Groups ──────────────────────────────────────────────────────────────────
  RxList<ChatGroup> groups = <ChatGroup>[
    const ChatGroup(
      name: 'CCTV Technician Group',
      preview: 'Quisque blandit arcu quis turpis tincidunt facilisis...',
      time: '15 min',
      unreadCount: 10,
      memberAvatars: [
        'https://randomuser.me/api/portraits/men/32.jpg',
        'https://randomuser.me/api/portraits/men/45.jpg',
        'https://randomuser.me/api/portraits/women/22.jpg',
      ],
    ),
    const ChatGroup(
      name: 'IT Support Technician Group',
      preview: 'Quisque blandit arcu quis turpis tincidunt facilisis...',
      time: '25 min',
      unreadCount: 0,
      memberAvatars: [
        'https://randomuser.me/api/portraits/men/55.jpg',
        'https://randomuser.me/api/portraits/men/60.jpg',
        'https://randomuser.me/api/portraits/men/12.jpg',
      ],
    ),
    const ChatGroup(
      name: 'Network Technician Group',
      preview: 'Quisque blandit arcu quis turpis tincidunt facilisis...',
      time: '25 min',
      unreadCount: 0,
      memberAvatars: [
        'https://randomuser.me/api/portraits/men/32.jpg',
        'https://randomuser.me/api/portraits/men/70.jpg',
        'https://randomuser.me/api/portraits/women/22.jpg',
      ],
    ),
    const ChatGroup(
      name: 'Hardware Support Group',
      preview: 'Quisque blandit arcu quis turpis tincidunt facilisis...',
      time: '30 min',
      unreadCount: 0,
      memberAvatars: [
        'https://randomuser.me/api/portraits/men/45.jpg',
        'https://randomuser.me/api/portraits/men/55.jpg',
        'https://randomuser.me/api/portraits/men/60.jpg',
      ],
    ),
    const ChatGroup(
      name: 'Ighty Tech Team',
      preview: 'Quisque blandit arcu quis turpis tincidunt facilisis...',
      time: '37 min',
      unreadCount: 0,
      memberAvatars: [
        'https://randomuser.me/api/portraits/men/12.jpg',
        'https://randomuser.me/api/portraits/men/32.jpg',
        'https://randomuser.me/api/portraits/men/45.jpg',
      ],
    ),
  ].obs;

  RxInt get messageCount => messages.length.obs;
  RxInt get groupCount => groups.length.obs;
}
