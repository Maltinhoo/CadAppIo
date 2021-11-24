import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {

  const SearchDialog(this.initialText);

  final String initialText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 2,
            left: 15,
            right: 15,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextFormField(
                initialValue: initialText,
                textInputAction: TextInputAction.search,
                autofocus: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  prefixIcon: IconButton(
                    icon: Icon(CupertinoIcons.back),
                    color: Colors.grey,
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  )
                ),
                onFieldSubmitted: (text){
                  Navigator.of(context).pop(text);
                },
              ),
            )
        )
      ],
    );
  }
}
