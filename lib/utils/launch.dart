import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(final String url, {LaunchMode mode = LaunchMode.platformDefault}) async => launchUrl(
      Uri.parse(url),
      mode: mode,
    );

void launchWhatsApp(final String number, {LaunchMode mode = LaunchMode.platformDefault}) async => await launchURL(
      "https://api.whatsapp.com/send?phone=$number",
      mode: mode,
    );

void launchTelegram(final String id, {LaunchMode mode = LaunchMode.platformDefault}) async => await launchURL(
      "https://t.me/$id",
      mode: mode,
    );

void launchInstagram(final String username, {LaunchMode mode = LaunchMode.platformDefault}) async => await launchURL(
      "https://instagram.com/$username",
      mode: mode,
    );

void call(final String phone) async => await launchURL("tel:$phone");

void sms(final String phone) async => await launchURL("sms:$phone");

void email(final String email, final String subject) {
  String? encodeQueryParameters(
    final Map<String, String> params,
  ) =>
      params.entries
          .map(
            (final MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
          )
          .join('&');

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: email,
    query: encodeQueryParameters(<String, String>{
      'subject': subject,
    }),
  );

  launchURL(emailLaunchUri.toString());
}
