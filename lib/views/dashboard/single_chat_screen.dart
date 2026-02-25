import 'package:ighty_support/controller/dashboard/single_chat_controller.dart';
import 'package:ighty_support/utils/all_imports.dart';
import 'package:ighty_support/utils/app_string.dart';

class SingleChatScreen extends GetView<SingleChatController> {
  const SingleChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          // ── Contact info ─────────────────────────────────────────────
          _buildContactRow(),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),

          // ── Messages ─────────────────────────────────────────────────
          Expanded(
            child: Obx(() => ListView.builder(
                  controller: controller.scrollController,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  itemCount: controller.messages.length,
                  itemBuilder: (_, i) => _BubbleTile(
                    bubble: controller.messages[i],
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
        text: AppString.chat,
        textSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColor.themeColor,
      ),
    );
  }

  // ── Contact Row ────────────────────────────────────────────────────────────
  Widget _buildContactRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          // Name + subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: controller.contactName,
                  textSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackColor,
                ),
                const SizedBox(height: 2),
                AppText(
                  text: controller.contactSubtitle,
                  textSize: 13,
                  color: const Color(0xFF888888),
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          // Avatar with online dot
          Stack(
            children: [
              ImageView.circle(
                image: controller.contactAvatar,
                width: 52,
                height: 52,
              ),
              Positioned(
                right: 2,
                bottom: 2,
                child: Container(
                  width: 13,
                  height: 13,
                  decoration: BoxDecoration(
                    color: controller.contactOnline
                        ? Colors.green
                        : Colors.grey.shade400,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ],
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
          // Camera
          Icon(Icons.camera_alt_outlined, color: Colors.black54, size: 24),
          const SizedBox(width: 10),
          // Attachment
          Icon(Icons.attach_file_rounded, color: Colors.black54, size: 22),
          const SizedBox(width: 10),
          // Message field
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
          // Send
          GestureDetector(
            onTap: controller.sendMessage,
            child: const Icon(
              Icons.send_outlined,
              color: AppColor.themeColor,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Bubble Tile ───────────────────────────────────────────────────────────────

class _BubbleTile extends StatelessWidget {
  final ChatBubble bubble;
  const _BubbleTile({required this.bubble});

  bool get _isReceived => bubble.type == MessageType.received;

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: _isReceived
          ? _receivedLayout(sw)
          : _sentLayout(sw),
    );
  }

  // ──────────────────────────────────────────────────────────────────────────
  // RECEIVED → grey bubble, avatar on LEFT (beside bubble)
  // ──────────────────────────────────────────────────────────────────────────
  Widget _receivedLayout(double sw) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Avatar beside bubble on the left
        _OnlineAvatar(url: bubble.senderAvatar, online: false, radius: 16),
        const SizedBox(width: 8),
        // Grey bubble
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: sw * 0.65),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            decoration: const BoxDecoration(
              color: Color(0xFFEEEEEE),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(4),
              ),
            ),
            child: Text(
              bubble.text,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  // ──────────────────────────────────────────────────────────────────────────
  // SENT → red bubble RIGHT, avatar on RIGHT (beside bubble), "Read" below
  // ──────────────────────────────────────────────────────────────────────────
  Widget _sentLayout(double sw) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(width: 48),
            // Red bubble
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: sw * 0.65),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 13),
                  decoration: const BoxDecoration(
                    color: AppColor.themeColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                  child: Text(
                    bubble.text,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Avatar beside bubble on the right
            _OnlineAvatar(url: bubble.senderAvatar, online: true, radius: 16),
          ],
        ),
        // "Read" label
        if (bubble.isRead)
          const Padding(
            padding: EdgeInsets.only(top: 4, right: 44),
            child: Text(
              'Read',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: Color(0xFF888888),
              ),
            ),
          ),
      ],
    );
  }
}



// ── Avatar with Online Dot ────────────────────────────────────────────────────

class _OnlineAvatar extends StatelessWidget {
  final String url;
  final bool online;
  final double radius;
  const _OnlineAvatar(
      {required this.url, required this.online, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageView.circle(
          image: url,
          width: radius * 2,
          height: radius * 2,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              color: online ? Colors.green : Colors.grey.shade400,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
