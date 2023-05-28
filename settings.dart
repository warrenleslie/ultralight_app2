import 'package:about/about.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isIos = Theme.of(context).platform == TargetPlatform.iOS;       // The platform that user interaction should adapt to target.

    const Widget aboutPage = AboutPage(       // Creates an about box.
      title: Text('License'),
      applicationVersion: 'Version {{ version }}, build #{{ buildNumber }}',
      applicationDescription: Text(
        'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE..',
        textAlign: TextAlign.justify,
      ),
      applicationLegalese: 'Ultralight Beam Holdings, {{ year }}',
      children: <Widget>[
        MarkdownPageListTile(
          filename: 'README.md',            // The markdown # asset file to load.
          title: Text('View Readme'),
          icon: Icon(Icons.all_inclusive),
        ),
      ],
    );

    if (isIos) {
      return const CupertinoApp(
        title: 'About demo',
        home: aboutPage,
      );
    }

    return const CupertinoApp(
      title: 'About demo',
      debugShowCheckedModeBanner: false,
      home: aboutPage,
    );
  }
}