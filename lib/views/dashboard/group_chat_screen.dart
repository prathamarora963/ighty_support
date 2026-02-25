import 'package:ighty_support/controller/dashboard/group_chat_controller.dart';
import 'package:ighty_support/utils/all_imports.dart';
import 'package:ighty_support/utils/app_string.dart';

class GroupChatScreen extends GetView<GroupChatController> {
  const GroupChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          // ── Group info row ───────────────────────────────────────────
          _buildGroupInfoRow(),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),

          // ── Messages list ────────────────────────────────────────────
          Expanded(
            child: Obx(() => ListView.builder(
                  controller: controller.scrollController,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
                  itemCount: controller.messages.length,
                  itemBuilder: (_, i) => _GroupBubble(
                    msg: controller.messages[i],
                  ),
                )),
          ),

          // ── Input bar ────────────────────────────────────────────────
          _buildInputBar(),
        ],
      ),
    );
  }

  // ── AppBar ─────────────────────────────────────────────────────────────────
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFCCCCCC), width: 1.5),
            ),
            child: const Center(
              child: Icon(Icons.arrow_back_ios_new_rounded,
                  size: 15, color: Colors.black),
            ),
          ),
        ),
      ),
      title: AppText(
        text: AppString.groups,
        textSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColor.themeColor,
      ),
    );
  }

  // ── Group Info Row ─────────────────────────────────────────────────────────
  Widget _buildGroupInfoRow() {
    final avatars = controller.memberAvatars;
    final padded = List<String?>.from(avatars);
    while (padded.length < 4) padded.add(null);
    final show = padded.take(4).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // 2×2 avatar grid
          SizedBox(
            width: 64,
            height: 64,
            child: Stack(
              children: [
                _gridAvatar(show[0], 0, 0),
                _gridAvatar(show[1], 33, 0),
                _gridAvatar(show[2], 0, 33),
                _gridAvatar(show[3], 33, 33),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Group name + members
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: controller.groupName,
                  textSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackColor,
                ),
                const SizedBox(height: 3),
                AppText(
                  text: controller.membersPreview,
                  textSize: 13,
                  color: const Color(0xFF888888),
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _gridAvatar(String? url, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1.5),
        ),
        child: ImageView.circle(
          image: url ?? '',
          width: 30,
          height: 30,
          placeholder: 'assets/icons/profile_icon.png',
        ),
      ),
    );
  }

  // ── Input Bar ──────────────────────────────────────────────────────────────
  Widget _buildInputBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 30),
      child: Row(
        children: [
          const Icon(Icons.camera_alt_outlined,
              color: Colors.black54, size: 24),
          const SizedBox(width: 10),
          const Icon(Icons.attach_file_rounded,
              color: Colors.black54, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 42,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(21),
              ),
              child: TextField(
                controller: controller.messageController,
                style: const TextStyle(fontFamily: 'Poppins', fontSize: 14),
                decoration: const InputDecoration(
                  hintText: AppString.typeAMessage,
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xFFBBBBBB),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: InputBorder.none,
                ),
                onSubmitted: (_) => controller.sendMessage(),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: controller.sendMessage,
            child: const Icon(Icons.send_outlined,
                color: AppColor.themeColor, size: 26),
          ),
        ],
      ),
    );
  }
}

// ── Group Bubble ──────────────────────────────────────────────────────────────

class _GroupBubble extends StatelessWidget {
  final GroupMessage msg;
  const _GroupBubble({required this.msg});

  bool get _isMe => msg.sender == GroupMsgSender.me;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: _isMe ? _myLayout(context) : _otherLayout(context),
    );
  }

  // ── OTHER: grey bubble LEFT, their avatar LEFT of bubble ───────────────────
  Widget _otherLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Avatar
        _SmallAvatar(url: msg.senderAvatar),
        const SizedBox(width: 8),
        // Bubble or image
        Flexible(
          child: msg.type == GroupMsgType.image
              ? _imageBubble(isMe: false)
              : _textBubble(isMe: false),
        ),
        // Spacer to prevent full width
        const SizedBox(width: 48),
      ],
    );
  }

  // ── ME: red bubble RIGHT, my avatar RIGHT of bubble ────────────────────────
  Widget _myLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(width: 48),
        Flexible(
          child: msg.type == GroupMsgType.image
              ? _imageBubble(isMe: true)
              : _textBubble(isMe: true),
        ),
        const SizedBox(width: 8),
        // My avatar
        _SmallAvatar(url: msg.senderAvatar),
      ],
    );
  }

  Widget _textBubble({required bool isMe}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      decoration: BoxDecoration(
        color: isMe ? AppColor.themeColor : const Color(0xFFEEEEEE),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomLeft: isMe ? const Radius.circular(20) : const Radius.circular(4),
          bottomRight: isMe ? const Radius.circular(4) : const Radius.circular(20),
        ),
      ),
      child: Text(
        msg.text ?? '',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          color: isMe ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w400,
          height: 1.4,
        ),
      ),
    );
  }

  Widget _imageBubble({required bool isMe}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: ImageView.rect(
        image: msg.imageUrl!,
        width: double.infinity,
        height: 180,
        fit: BoxFit.cover,
        borderRadius: 14,
      ),
    );
  }
}

// ── Small Avatar ──────────────────────────────────────────────────────────────

class _SmallAvatar extends StatelessWidget {
  final String url;
  const _SmallAvatar({required this.url});

  @override
  Widget build(BuildContext context) {
    return ImageView.circle(
      image: url,
      width: 36,
      height: 36,
    );
  }
}
