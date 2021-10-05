import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmbanger/config/constants.dart';

class IndexSearch extends StatelessWidget {
  const IndexSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
              "Find your best music",
              style: TextStyle(
                color: Colors.white,
                fontSize: 46.0,
              )
          ),

          const SizedBox(height: 14.0),


          CupertinoTextField(
            placeholder: "Search artist, album or track",
            prefix:const Padding(
              padding: EdgeInsets.only(left: 14.0),
              child: Icon(
                Icons.search,
                size: 32,
                color: Colors.white12,
              ),
            ),
            placeholderStyle:const TextStyle(
              fontWeight: FontWeight.w400,
              color: CupertinoColors.placeholderText,
              fontSize: 18,
            ),
            style:const TextStyle(
              fontWeight: FontWeight.w500,
              color: Constants.primaryColor,
              fontSize: 18,
            ),
            cursorColor: Constants.primaryColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 18.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(28.0),
            ),
          ),
        ],
      ),
    );
  }
}
