import 'package:appentusfluttertest/modal/home_model.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'home.dart';

class CommanCode {
  static CircularProgressIndicator circularProgress() {
    return CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(COLORS.APP_THEME_COLOR),
    );
  }

  // static GestureDetector internetErrorText(Function callback) {
  //   return GestureDetector(
  //     onTap: callback,
  //     child: Center(
  //       child: Text(MESSAGES.INTERNET_ERROR),
  //     ),
  //   );
  // }

  static Padding homeGrid(
      AsyncSnapshot<List<HomeModel>> snapshot, Function gridClicked) {
    return Padding(
      padding:
          EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0, top: 10.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: snapshot.data?.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: CardView(snapshot.data![index]),
            onTap: () {} /*=> gridClicked(context, snapshot.data![index])*/,
          );
        },
      ),
    );
  }

  static TextButton retryButton(Function fetch) {
    return TextButton(
      child: Text(
        MESSAGES.INTERNET_ERROR_RETRY,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.normal),
      ),
      onPressed: () => fetch(),
    );
  }
}
