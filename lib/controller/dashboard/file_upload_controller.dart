import 'package:ighty_support/utils/all_imports.dart';
import 'package:ighty_support/utils/app_string.dart';

class FileFolder {
  final String name;
  final String date;
  final IconData icon;

  FileFolder({
    required this.name,
    required this.date,
    required this.icon,
  });
}

class FileUploadController extends GetxController {
  final RxList<FileFolder> folders = <FileFolder>[
    FileFolder(
      name: AppString.pictures,
      date: 'January 10, 2026',
      icon: Icons.folder_rounded,
    ),
    FileFolder(
      name: AppString.videos,
      date: 'January 10, 2026',
      icon: Icons.folder_rounded,
    ),
    FileFolder(
      name: AppString.documents,
      date: 'January 10, 2026',
      icon: Icons.folder_rounded,
    ),
  ].obs;

  void onFolderTap(FileFolder folder) {
    // TODO: implement folder action
    print('Tapped on ${folder.name}');
  }

  void onMenuTap(FileFolder folder) {
    // TODO: implement menu action
    print('Menu tapped for ${folder.name}');
  }
}
