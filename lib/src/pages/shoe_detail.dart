import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/helpers.dart';
import '../models/shoe_model.dart';
import '../widgets/custom_widgets.dart';

class ShoeDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    changeStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Hero(
                        tag: 'shoe-identifier',
                        child: ShoePreview(fullScreen: true),
                      ),
                      Positioned(
                        top: 80,
                        child: FloatingActionButton(
                          elevation: 0,
                          highlightElevation: 0,
                          backgroundColor: Colors.transparent,
                          onPressed: () {
                            changeStatusDark();
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ShoeDescription(
                        title: 'Nike Air Max 720',
                        description:
                            "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                      ),
                      _BuySection(),
                      _OptionColors(),
                      _SocialAndCart(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialAndCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ShadowedButton(Icon(Icons.star, color: Colors.red, size: 25)),
          _ShadowedButton(Icon(Icons.shopping_cart, color: Colors.grey.withOpacity(0.4), size: 25)),
          _ShadowedButton(Icon(Icons.settings, color: Colors.grey.withOpacity(0.4), size: 25)),
        ],
      ),
    );
  }
}

class _ShadowedButton extends StatelessWidget {
  final Icon icon;

  const _ShadowedButton(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: -5, blurRadius: 20, offset: Offset(0, 10))]),
      child: icon,
    );
  }
}

class _OptionColors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                    left: 90,
                    child: _ColorButton(color: Color(0xff364D56), index: 4, assetImage: 'assets/img/negro.png')),
                Positioned(
                    left: 60,
                    child: _ColorButton(color: Color(0xff2099F1), index: 3, assetImage: 'assets/img/azul.png')),
                Positioned(
                    left: 30,
                    child: _ColorButton(color: Color(0xffFFAD29), index: 2, assetImage: 'assets/img/amarillo.png')),
                _ColorButton(color: Color(0xffC6D642), index: 1, assetImage: 'assets/img/verde.png')
              ],
            ),
          ),
          BuyButton(
            text: 'More related items',
            width: 170,
            height: 30,
            backgroundColor: Color(0xffFFC675),
          ),
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color color;
  final int index;
  final String assetImage;

  const _ColorButton({required this.color, required this.index, required this.assetImage});

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          Provider.of<ShoeModel>(context, listen: false).assetImage = assetImage;
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _BuySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 20),
        child: Row(
          children: [
            Text('\$180.0', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Spacer(),
            Bounce(
              delay: Duration(milliseconds: 200),
              from: 25,
              child: BuyButton(
                text: 'Buy Now',
                width: 120,
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
