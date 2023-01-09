import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_scrap/Event.dart';
import 'package:web_scrap/myAppBar.dart';
import 'package:url_launcher/url_launcher.dart';

class raceInfo extends StatelessWidget {
  final Event event;

  const raceInfo(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'F1 schedule',
            style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w900,
            fontSize: 25,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 6, 0),
          centerTitle: true,
          leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    iconSize: 20.0,
                    onPressed: () {
                      Navigator.pop(context);
                    },    
          ),
        ),
          body: Center(
          child: ElevatedButton(
            style: style,
            onPressed: () => _launchURL(event.href),
            child: const Text('More Info'),
          ),
        )
          ),
    );
  }
}

_launchURL(String urlcd) async {
  var url = 'https://www.formula1.com$urlcd';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.inAppWebView);
  } else {
    throw 'Could not launch $url';
  }
}
