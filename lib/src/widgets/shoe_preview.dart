import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/pages/shoe_detail.dart';

class ShoePreview extends StatelessWidget {
  final bool fullScreen;

  const ShoePreview({this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          if (!fullScreen) Navigator.push(context, MaterialPageRoute(builder: (context) => ShoeDetailPage()));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: fullScreen ? 5 : 30,
            vertical: fullScreen ? 0 : 5,
          ),
          child: Container(
            width: double.infinity,
            height: (!fullScreen) ? 410 : 430,
            decoration: BoxDecoration(
              color: Color(0xffFFCF53),
              borderRadius: (!fullScreen)
                  ? BorderRadius.circular(50)
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
            ),
            child: Column(
              children: [
                _ShoeWithShadow(),
                if (!fullScreen) _ShoeSizes(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final assetImage = Provider.of<ShoeModel>(context).assetImage;
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 0,
            child: _Shadow(),
          ),
          Image(image: AssetImage(assetImage)),
        ],
      ),
    );
  }
}

class _Shadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.45,
      child: Container(
        width: 230,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Color(0xffEAA14E), blurRadius: 40),
          ],
        ),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SizesBox(7),
          _SizesBox(7.5),
          _SizesBox(8),
          _SizesBox(8.5),
          _SizesBox(9),
          _SizesBox(9.5),
        ],
      ),
    );
  }
}

class _SizesBox extends StatefulWidget {
  final double size;

  const _SizesBox(this.size);

  @override
  __SizesBoxState createState() => __SizesBoxState();
}

class __SizesBoxState extends State<_SizesBox> {
  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return GestureDetector(
      onTap: () {
        Provider.of<ShoeModel>(context, listen: false).size = widget.size;
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: widget.size == shoeModel.size ? Color(0xffF1A23A) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (widget.size == shoeModel.size)
              BoxShadow(
                color: Color(0xffF1A23A),
                blurRadius: 10,
                offset: Offset(0, 5),
              )
          ],
        ),
        child: Center(
          child: Text(
            '${widget.size.toString().replaceAll('.0', '')}',
            style: TextStyle(
              color: widget.size == shoeModel.size ? Colors.white : Color(0xffFFCF53),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
