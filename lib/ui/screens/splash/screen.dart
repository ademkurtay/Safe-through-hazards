import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:safe_through/data/styles.dart';
import 'package:safe_through/main.dart';
import 'package:safe_through/ui/screens/app/app.dart';
import 'package:safe_through/ui/screens/premium/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final safeThroughCallback = await Apphud.paywallsDidLoadCallback();
      print(safeThroughCallback);
      for (ApphudPaywall safeThroughPaywalls in safeThroughCallback.paywalls) {
        for (ApphudProduct safeThroughProducts
            in safeThroughPaywalls.products ?? []) {
          if (safeThroughProducts.productId == safeThroughSubID) {
            safeThroughSubProduct = safeThroughProducts;
            print(safeThroughProducts);
          }
        }
      }

      final safeThroughFormat = NumberFormat.currency(
          symbol: safeThroughSubProduct.skProduct?.priceLocale.currencySymbol ??
              '\$');
      safeThroughSubPrice = safeThroughFormat
          .format(safeThroughSubProduct.skProduct?.price ?? 1.99);

      final safeThroughAccess = await Apphud.hasPremiumAccess();

      safeThroughSubActive.value = safeThroughAccess;

      if (safeThroughAccess) {
        Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(),
                pageBuilder: (context, _, __) => AppScreen()));
      } else {
        Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(),
                pageBuilder: (context, _, __) => PremiumScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      debugShowCheckedModeBanner: false,
      color: dCheckBackColor,
      builder: (context, child) {
        return const Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CupertinoActivityIndicator(
                  radius: 50,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
