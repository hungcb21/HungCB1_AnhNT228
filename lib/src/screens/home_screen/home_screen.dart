import 'package:crypto_mobile_application/src/blocs/coins_bloc/coins_bloc.dart';
import 'package:crypto_mobile_application/src/blocs/coins_bloc/coins_state.dart';
import 'package:crypto_mobile_application/src/constants/colors.dart';
import 'package:crypto_mobile_application/src/constants/strings.dart';
import 'package:crypto_mobile_application/src/constants/text_style.dart';
import 'package:crypto_mobile_application/src/screens/detail_screen/detail_screen.dart';
import 'package:crypto_mobile_application/src/widgets/coin_cart.dart';
import 'package:crypto_mobile_application/src/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              child: Column(
                children: [
                  SearchBar([]),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                decoration: BoxDecoration(
                  color: ColorsApp.backgroundBottomColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: const Text(
                        StringData.listCoinsTitle,
                        style: TextStylesApp.listCoinsTitle,
                      ),
                    ),
                    Flexible(
                      child: BlocBuilder<CoinsBloc, CoinsState>(
                        builder: (BuildContext context, state) {
                          if (state is ListCoinsLoaded) {
                            return ListView.builder(
                              itemCount: state.listCoins!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: CoinCard(
                                    image: state.listCoins![index].image!,
                                    name: state.listCoins![index].name!,
                                    symbol: state.listCoins![index].symbol!,
                                    price:
                                        state.listCoins![index].current_price,
                                    price_change: state
                                        .listCoins![index].price_change_24h,
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen()));
                                    },
                                  ),
                                );
                              },
                            );
                          } else if (state is ListCoinsLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is ListCoinsLoadFail) {
                            return Center(
                              child: Text(
                                state.error!,
                                style: TextStylesApp.listCoinsError,
                              ),
                            );
                          }
                          return Center(child: Text(StringData.listEmpty));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
