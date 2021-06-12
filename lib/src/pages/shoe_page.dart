import 'package:flutter/material.dart';

import '../helpers/helpers.dart';
import '../widgets/custom_widgets.dart';

class ShoePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    changeStatusDark();
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(text: 'For You!'),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Hero(
                    tag: 'shoe-identifier',
                    child: ShoePreview(),
                  ),
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                ],
              ),
            ),
          ),
          AddCartButton(amount: 180.0)
        ],
      ),
    );
  }
}
