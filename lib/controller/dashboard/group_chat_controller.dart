import 'package:ighty_support/utils/all_imports.dart';

enum GroupMsgType { text, image }
enum GroupMsgSender { me, other }

class GroupMessage {
  final String? text;
  final String? imageUrl;
  final GroupMsgType type;
  final GroupMsgSender sender;
  final String senderAvatar;
  final String senderName;

  const GroupMessage({
    this.text,
    this.imageUrl,
    required this.type,
    required this.sender,
    required this.senderAvatar,
    required this.senderName,
  });
}

class GroupChatController extends GetxController {
  // Group info passed via args
  final String groupName;
  final String membersPreview;
  final List<String> memberAvatars;

  GroupChatController({
    required this.groupName,
    required this.membersPreview,
    required this.memberAvatars,
  });

  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  static const String _myAvatar =
      'https://randomuser.me/api/portraits/men/45.jpg';
  static const String _myName = 'Me';

  final RxList<GroupMessage> messages = <GroupMessage>[
    const GroupMessage(
      text: 'Morbi ullamcorper quis est et.',
      type: GroupMsgType.text,
      sender: GroupMsgSender.other,
      senderAvatar: 'https://randomuser.me/api/portraits/men/32.jpg',
      senderName: 'Dianne',
    ),
    const GroupMessage(
      text: 'Integer quis eros quis erat sed id.',
      type: GroupMsgType.text,
      sender: GroupMsgSender.me,
      senderAvatar: _myAvatar,
      senderName: _myName,
    ),
    const GroupMessage(
      imageUrl:
          'https://images.unsplash.com/photo-1497366216548-37526070297c?w=600&q=80',
      type: GroupMsgType.image,
      sender: GroupMsgSender.other,
      senderAvatar: 'https://randomuser.me/api/portraits/women/22.jpg',
      senderName: 'Ursula',
    ),
    const GroupMessage(
      text: 'In a nulla fermentum.',
      type: GroupMsgType.text,
      sender: GroupMsgSender.me,
      senderAvatar: _myAvatar,
      senderName: _myName,
    ),
    const GroupMessage(
      text: 'Pellentesque a lectus nulla, dapibus luctus arcu nec.',
      type: GroupMsgType.text,
      sender: GroupMsgSender.other,
      senderAvatar: 'https://randomuser.me/api/portraits/men/60.jpg',
      senderName: 'Jarvis',
    ),
  ].obs;

  void sendMessage() {
    final text = messageController.text.trim();
    if (text.isEmpty) return;
    messages.add(GroupMessage(
      text: text,
      type: GroupMsgType.text,
      sender: GroupMsgSender.me,
      senderAvatar: _myAvatar,
      senderName: _myName,
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
