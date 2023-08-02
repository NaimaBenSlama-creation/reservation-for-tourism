import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Evaluation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Power BI Link',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Power BI Link'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => _launchURL(
                'https://app.powerbi.com/view?r=eyJrIjoiNjNiYjYzYTEtYjdlMS00ZDU2LWExNjYtODU0MWQxNmI0NWU5IiwidCI6ImRiZDY2NjRkLTRlYjktNDZlYi05OWQ4LTVjNDNiYTE1M2M2MSIsImMiOjl9'),
            child: Text('Ouvrir le lien'),
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false, enableJavaScript: true);
    } else {
      throw 'Impossible d\'ouvrir le lien $url';
    }
  }
}
