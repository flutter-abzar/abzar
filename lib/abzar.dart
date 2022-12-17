import 'package:flutter/material.dart';
import 'package:abzar/abzar.dart';

export 'dart:async';
export 'dart:convert';

export 'package:collection/collection.dart';
export 'package:file_picker/file_picker.dart';
export 'package:flutter_local_notifications/flutter_local_notifications.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:get/get.dart';
export 'package:get_storage/get_storage.dart';
export 'package:group_button/group_button.dart';
export 'package:hashtagable/hashtagable.dart';
export 'package:image_cropper/image_cropper.dart';
export 'package:intl/intl.dart';
export 'package:just_audio/just_audio.dart';
export 'package:logger/logger.dart';
export 'package:path_provider/path_provider.dart';
export 'package:persian_tools/persian_tools.dart';
export 'package:share_plus/share_plus.dart';
// export 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:video_player/video_player.dart';

export 'package:collection/collection.dart';
export 'components/components.dart';
export 'utils/utils.dart';
export 'package:permission_handler/permission_handler.dart';
export 'package:gallery_saver/gallery_saver.dart';

void initUtilities() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
}
