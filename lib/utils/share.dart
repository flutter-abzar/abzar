import 'package:share_plus/share_plus.dart';

void shareText(final String text, {final String? subject}) => Share.share(text, subject: subject);

void shareFile(final List<XFile> pathFiles, final String text) => Share.shareXFiles(pathFiles, text: text);
