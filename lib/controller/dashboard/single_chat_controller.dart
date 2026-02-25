import 'package:ighty_support/utils/all_imports.dart';

enum MessageType { sent, received }

class ChatBubble {
  final String text;
  final MessageType type;
  final String senderAvatar;
  final bool isRead;

  const ChatBubble({
    required this.text,
    required this.type,
    required this.senderAvatar,
    this.isRead = false,
  });
}

class SingleChatController extends GetxController {
  // Contact info passed via arguments
  final String contactName;
  final String contactSubtitle;
  final String contactAvatar;
  final bool contactOnline;

  SingleChatController({
    required this.contactName,
    required this.contactSubtitle,
    required this.contactAvatar,
    required this.contactOnline,
  });

  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  // My own avatar (technician)
  static const String myAvatar =
      'https://randomuser.me/api/portraits/men/32.jpg';

  final RxList<ChatBubble> messages = <ChatBubble>[
    ChatBubble(
      text: 'Morbi ullamcorper quis est et.',
      type: MessageType.received,
      senderAvatar: 'https://randomuser.me/api/portraits/women/22.jpg',
    ),
    ChatBubble(
      text:
          'Integer quis eros quis et, vestibulum lobortis tortor, eleifend eleifend arcu.',
      type: MessageType.sent,
      senderAvatar: myAvatar,
      isRead: true,
    ),
    ChatBubble(
      text: 'In a nulla fermentum.',
      type: MessageType.received,
      senderAvatar: 'https://randomuser.me/api/portraits/women/22.jpg',
    ),
    ChatBubble(
      text: 'Pellentesque a lectus nulla, dapibus luctus arcu nec.',
      type: MessageType.received,
      senderAvatar: 'https://randomuser.me/api/portraits/women/22.jpg',
    ),
  ].obs;

  void sendMessage() {
    final text = messageController.text.trim();
    if (text.isEmpty) return;
    messages.add(ChatBubble(
      text: text,
      type: MessageType.sent,
      senderAvatar: myAvatar,
      isRead: false,
    ));
    messageController.clear();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
