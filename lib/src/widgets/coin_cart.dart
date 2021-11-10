import 'package:crypto_mobile_application/src/constants/text_style.dart';
import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  VoidCallback onTap;
  String? image;
  String name;
  String symbol;
  var price;
  var price_change;

  CoinCard(
      {required this.image,
      required this.onTap,
      required this.name,
      required this.symbol,
      required this.price,
      required this.price_change});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          leading: Image.network(
            image!,
            errorBuilder: (context, error, strackTrace) => Icon(Icons.error),
          ),
          title: Text(
            name,
            style: TextStylesApp.nameCoin,
          ),
          subtitle: Text('${price}  ${symbol.toUpperCase()}'),
          trailing: Text(
            double.parse(price_change.toString()).toStringAsFixed(3),
            style: TextStyle(
                color: price_change.toString().contains('-')
                    ? Colors.red
                    : Colors.green),
          ),
        ),
      ),
    );
  }
}
