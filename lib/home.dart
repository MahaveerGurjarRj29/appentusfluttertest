import 'package:appentusfluttertest/modal/home_model.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView(this.homeModel);
  @required
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Image.network(homeModel.download_url.toString(),
                width: MediaQuery.of(context).size.width * 0.40,
                height: MediaQuery.of(context).size.height * 0.15,
                alignment: Alignment.center,
                fit: BoxFit.fill),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              homeModel.author.toString(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
