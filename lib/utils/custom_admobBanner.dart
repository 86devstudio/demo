import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../services/admob_helper.dart';

class CustomAdmobBanner extends StatelessWidget {
  CustomAdmobBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: AdWidget(
        ad: AdmobHelper.getBannerAd()
          ..load(),
        key: UniqueKey(),
      ),
    );
  }
}
