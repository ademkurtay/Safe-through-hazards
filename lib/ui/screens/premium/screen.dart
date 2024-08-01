import 'dart:ui';

import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:safe_through/data/assets.dart';
import 'package:safe_through/main.dart';
import 'package:safe_through/ui/screens/app/app.dart';
import 'package:safe_through/ui/widgets/buttons/continue.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  _closePremScreen() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AppScreen()));
    }
  }

  bool buyLoad = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Spacer(
                    flex: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            _closePremScreen();
                          },
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                              width: 40,
                              height: 40,
                              child: Center(
                                  child: SvgPicture.asset(
                                      DCheckIcons.premClose)))),
                    ],
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  Text(
                    'Additional\nEmergency\nChecklist',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 36,
                        height: 1,
                        fontFamily: '.SF UI Display',
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF4D94FF)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Single Purchase for $safeThroughSubPrice',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        height: 1,
                        fontFamily: '.SF UI Display',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4D94FF)),
                  ),
                  Spacer(
                    flex: 40,
                  ),
                  DContinueButton(
                    width: 191,
                    name: 'Purchase',
                    fontWeight: FontWeight.w600,
                    onTap: () async {
                      setState(() {
                        buyLoad = true;
                      });

                      final safeThroughSubBuy =
                          await Apphud.purchase(product: safeThroughSubProduct);
                      print(safeThroughSubBuy);
                      if (kDebugMode ||
                          (safeThroughSubBuy.nonRenewingPurchase?.isActive ??
                              false)) {
                        safeThroughSubActive.value = true;

                        setState(() {
                          buyLoad = false;
                        });
                        _closePremScreen();
                      }

                      setState(() {
                        buyLoad = false;
                      });
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  DContinueButton(
                    width: 191,
                    name: 'Restore',
                    fontWeight: FontWeight.w600,
                    type: DContinueButtonColorType.white,
                    onTap: () async {
                      setState(() {
                        buyLoad = true;
                      });
                      final safeThroughSubRestore =
                          await Apphud.restorePurchases();
                      if (kDebugMode ||
                          (safeThroughSubRestore.purchases
                              .map((e) => e.isActive)
                              .contains(true))) {
                        safeThroughSubActive.value = true;

                        setState(() {
                          buyLoad = false;
                        });
                        _closePremScreen();
                      }
                      setState(() {
                        buyLoad = true;
                      });
                    },
                  ),
                  Spacer(
                    flex: 40,
                  ),
                  Expanded(
                    flex: 190,
                    child: Center(
                      child: Image.asset(
                        DCheckImages.premium,
                        scale: 3,
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 88,
                  ),
                  SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              safeThroughPP();
                            },
                            behavior: HitTestBehavior.opaque,
                            child: Center(
                              child: Text(
                                'Privacy Policy',
                                style: TextStyle(
                                    fontSize: 16,
                                    height: 24 / 16,
                                    fontFamily: '.SF UI Display',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF4D94FF)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              safeThroughTOU();
                            },
                            behavior: HitTestBehavior.opaque,
                            child: Center(
                              child: Text(
                                'Terms of Use',
                                style: TextStyle(
                                    fontSize: 16,
                                    height: 24 / 16,
                                    fontFamily: '.SF UI Display',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF4D94FF)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 40,
                  ),
                ],
              ),
            ),
          ),
          if (buyLoad)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                color: Colors.black.withOpacity(0.2),
                child: Center(
                  child: CupertinoActivityIndicator(
                    radius: 50,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
