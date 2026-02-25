import 'package:ighty_support/controller/dashboard/chat_controller.dart';
import 'package:ighty_support/generated/assets.dart';
import 'package:ighty_support/routes/routes_page.dart';
import 'package:ighty_support/utils/all_imports.dart';
import 'package:ighty_support/utils/app_string.dart';

class ChatTab extends GetView<ChatController> {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ── Header ────────────────────────────────────────────────────
          Obx(() => _buildHeader()),

          // ── Toggle Tabs ───────────────────────────────────────────────
          Obx(() => _buildToggleTabs()),

          const SizedBox(height: 8),

          // ── List ──────────────────────────────────────────────────────
          Expanded(
            child: Obx(
              () => controller.activeTab.value == 0
                  ? _MessagesList(messages: controller.messages)
                  : _GroupsList(groups: controller.groups),
            ),
          ),
        ],
      ),
    );
  }

  // ── Header ─────────────────────────────────────────────────────────────────
  Widget _buildHeader() {
    final subtitle = controller.activeTab.value == 0
        ? AppString.letsTalk
        : AppString.letsDiscuss;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 56, 20, 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: AppString.helloUser,
                  textSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColor.blackColor,
                ),
                const SizedBox(height: 4),
                AppText(
                  text: subtitle,
                  textSize: 13,
                  color: const Color(0xFF888888),
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.profileScreen),
            child: Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF0F0F0),
              ),
              child: Image.asset(Assets.iconProfileIcon),
            ),
          ),
        ],
      ),
    );
  }

  // ── Toggle Tabs ────────────────────────────────────────────────────────────
  Widget _buildToggleTabs() {
    final isMessages = controller.activeTab.value == 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 46,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            _TabChip(
              label: '${AppString.messages} (${controller.messageCount})',
              isActive: isMessages,
              onTap: () => controller.switchTab(0),
            ),
            _TabChip(
              label: '${AppString.groups} (${controller.groupCount})',
              isActive: !isMessages,
              onTap: () => controller.switchTab(1),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Tab Chip ──────────────────────────────────────────────────────────────────

class _TabChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _TabChip({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          height: double.infinity,
          decoration: BoxDecoration(
            color: isActive ? AppColor.themeColor : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: AppText(
              text: label,
              textSize: 13,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              color: isActive ? AppColor.whiteColor : AppColor.themeColor,
            ),
          ),
        ),
      ),
    );
  }
}

// ── Messages List ─────────────────────────────────────────────────────────────

class _MessagesList extends StatelessWidget {
  final List<ChatMessage> messages;
  const _MessagesList({required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: messages.length,
      separatorBuilder: (_, __) => const Divider(
        height: 1,
        indent: 80,
        endIndent: 20,
        color: Color(0xFFEEEEEE),
      ),
      itemBuilder: (_, i) => _MessageTile(message: messages[i]),
    );
  }
}

// ── Message Tile ──────────────────────────────────────────────────────────────

class _MessageTile extends StatelessWidget {
  final ChatMessage message;
  const _MessageTile({required this.message});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        AppRoutes.singleChatScreen,
        arguments: {
          'name': message.name,
          'subtitle': 'S1 Tech',
          'avatar': message.avatarUrl,
          'online': message.isOnline,
        },
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar with online dot
            Stack(
              children: [
                ImageView.circle(
                  image: message.avatarUrl,
                  width: 56,
                  height: 56,
                ),
                if (message.isOnline)
                  Positioned(
                    right: 2,
                    bottom: 2,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  )
                else
                  Positioned(
                    right: 2,
                    bottom: 2,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            // Name + preview
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: message.name,
                    textSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                  ),
                  const SizedBox(height: 2),
                  AppText(
                    text: message.preview,
                    textSize: 13,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF888888),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Time + badge
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText(
                  text: message.time,
                  textSize: 12,
                  color: const Color(0xFF888888),
                ),
                const SizedBox(height: 6),
                if (message.unreadCount > 0)
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: AppColor.themeColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: AppText(
                        text: message.unreadCount > 9
                            ? '9+'
                            : '${message.unreadCount}',
                        textSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Groups List ───────────────────────────────────────────────────────────────

class _GroupsList extends StatelessWidget {
  final List<ChatGroup> groups;
  const _GroupsList({required this.groups});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: groups.length,
      separatorBuilder: (_, __) => const Divider(
        height: 1,
        indent: 80,
        endIndent: 20,
        color: Color(0xFFEEEEEE),
      ),
      itemBuilder: (_, i) => _GroupTile(group: groups[i]),
    );
  }
}

// ── Group Tile ────────────────────────────────────────────────────────────────

class _GroupTile extends StatelessWidget {
  final ChatGroup group;
  const _GroupTile({required this.group});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        AppRoutes.groupChatScreen,
        arguments: {
          'groupName': group.name,
          'membersPreview': 'Dianne, Jarvis, Miles, Ursula...',
          'memberAvatars': group.memberAvatars,
        },
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overlapping avatars
            _OverlappingAvatars(avatarUrls: group.memberAvatars),
            const SizedBox(width: 12),
            // Name + preview
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: group.name,
                    textSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                  ),
                  const SizedBox(height: 2),
                  AppText(
                    text: group.preview,
                    textSize: 13,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF888888),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Time + badge
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText(
                  text: group.time,
                  textSize: 12,
                  color: const Color(0xFF888888),
                ),
                const SizedBox(height: 6),
                if (group.unreadCount > 0)
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: AppColor.themeColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: AppText(
                        text: '${group.unreadCount}',
                        textSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Overlapping Avatars (2×2 grid) ───────────────────────────────────────────

class _OverlappingAvatars extends StatelessWidget {
  final List<String> avatarUrls;
  const _OverlappingAvatars({required this.avatarUrls});

  // Pads list to always have 4 entries
  List<String?> get _padded {
    final list = List<String?>.from(avatarUrls);
    while (list.length < 4) list.add(null);
    return list.take(4).toList();
  }

  @override
  Widget build(BuildContext context) {
    const double avatarSize = 30;
    const double gap = 2.0;
    final urls = _padded;

    // 2×2 grid: [TL, TR, BL, BR]
    return SizedBox(
      width: avatarSize * 2 + gap,
      height: avatarSize * 2 + gap,
      child: Stack(
        children: [
          // Top-Left
          Positioned(
            left: 0,
            top: 0,
            child: _Avatar(url: urls[0], size: avatarSize),
          ),
          // Top-Right
          Positioned(
            left: avatarSize + gap,
            top: 0,
            child: _Avatar(url: urls[1], size: avatarSize),
          ),
          // Bottom-Left
          Positioned(
            left: 0,
            top: avatarSize + gap,
            child: _Avatar(url: urls[2], size: avatarSize),
          ),
          // Bottom-Right
          Positioned(
            left: avatarSize + gap,
            top: avatarSize + gap,
            child: _Avatar(url: urls[3], size: avatarSize),
          ),
        ],
      ),
    );
  }
}

// ── Single Avatar ─────────────────────────────────────────────────────────────

class _Avatar extends StatelessWidget {
  final String? url;
  final double size;
  const _Avatar({required this.url, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1.5),
        color: const Color(0xFFE0E0E0),
      ),
      child: ImageView.circle(
        image: url ?? '',
        placeholder: 'assets/icons/profile_icon.png', // Fallback if url is null or empty
        fit: BoxFit.cover,
      ),
    );
  }
}
