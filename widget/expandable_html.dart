// ignore_for_file: avoid_print, import_of_legacy_library_into_null_safe

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
///
/// Simple widget to make expandable content html
/// 26/02/22 Hendriyawan
class ExpandableHtml extends StatefulWidget {
  final String text;
  const ExpandableHtml({this.text = "", Key? key}) : super(key: key);

  @override
  _ExpandableHtmlState createState() => _ExpandableHtmlState();
}

class _ExpandableHtmlState extends State<ExpandableHtml> {
  String? textToDisplay;
  bool _expanded = false;

  ///set toggle expanded
  void _toggleExpanded() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  ///get text to display safety
  String? _getTextToDisplay(String text) {
    String result = (text.length > 250) ? text.substring(0, 250) + '...' : text;
    return result;
  }

  @override
  void initState() {
    ///if the text hash more than a certain number of characters, the text we display will consist of that number of characters;
    ///if it's not longer we display all the text
    print(widget.text.length);

    ///we arbitrarily chose 25 as the length
    textToDisplay = _getTextToDisplay(widget.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Html(
          data: (_expanded) ? widget.text : textToDisplay,
          defaultTextStyle: const TextStyle(fontSize: 13),
        ),
        const SizedBox(
          height: 5,
        ),
        (widget.text.length > 250)
            ? Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    _toggleExpanded();
                  },
                  child: Text(
                    (_expanded) ? 'Show Less' : 'Show More',
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFF1993AB),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}

