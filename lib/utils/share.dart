import 'package:share_plus/share_plus.dart';

void shareText(final String text, {final String? subject}) => Share.share(text, subject: subject);

void shareFile(final List<String> pathFiles, final String text) => Share.shareFiles(pathFiles, text: text);
