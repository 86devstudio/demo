import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../configs/constants.dart';

class AdmobHelper {
  static initialization() async {
    // ignore: unnecessary_null_comparison
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  static final AdRequest request = AdRequest(
    keywords: Constants.admobKeywords,
    contentUrl: Platform.isAndroid ? Constants.ShareAppAndroidStore : Constants.ShareAppAppleStore,
    nonPersonalizedAds: true,
  );

  static BannerAd? _bannerAd;
  static InterstitialAd? _interstitialAd;

  // ignore: non_constant_identifier_names
  static int num_of_attempt_load = 0;

  static BannerAd getBannerAd() {
    BannerAd ad = BannerAd(
      adUnitId: Platform.isAndroid ? Constants.androidBannerId : Constants.iosBannerId,
      request: request,
      size: AdSize.banner,

      //listener: null,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (Ad ad) => print('Ad loaded.'),
        // Called when an ad request failed.
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          // Dispose the ad here to free resources.
          ad.dispose();
          print('Ad failed to load: $error');
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) => print('Ad opened.'),
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) => print('Ad closed.'),
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) => print('Ad impression.'),
      ),
    );

    return ad;
  }

  static void showBannerAd() {
    if (_bannerAd != null) {
      return;
    }
    _bannerAd = getBannerAd();
    _bannerAd!.load();
  }

  void disposeAds() {
    //print("disposeAds");
    if (_bannerAd != null) {
      _bannerAd!.dispose();
    }
  }

  static void createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: Platform.isAndroid ? Constants.androidInterstitialId : Constants.iosInterstitialId,
        request: request,
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            //print('$ad loaded');
            _interstitialAd = ad;
            num_of_attempt_load = 0;
            _interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            //print('InterstitialAd failed to load: $error.');
            num_of_attempt_load += 1;
            _interstitialAd!.dispose();
            _interstitialAd = null;
            if (num_of_attempt_load <= 2) {
              createInterstitialAd();
            }
          },
        ));
  }

  static void showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) => print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  static void disposeInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.dispose();
      _interstitialAd = null;
      num_of_attempt_load = 0;
    }
  }
}
