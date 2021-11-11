import 'package:crypto_mobile_application/src/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/coins_bloc/coins_bloc.dart';
import '../../blocs/coins_bloc/coins_state.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../constants/text_style.dart';
import '../../widgets/coin_card.dart';
import '../../widgets/search_bar.dart';
import '../detail_screen/detail_screen.dart';

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
                  BlocBuilder<CoinsBloc, CoinsState>(builder: (context, state) {
                    if (state is CoinsLoadSuccess) {
                      return SearchBar(state.listCoins!);
                    }
                    return SearchBar([]);
                  }),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
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
                          if (state is CoinsLoadSuccess) {
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
                                        state.listCoins![index].current_price!,
                                    price_change: state
                                        .listCoins![index].price_change_24h!,
                                    onTap: () => {
                                      Navigator.pushNamed(
                                        context,
                                        RouteConstant.detailRoute,
                                      )
                                    },
                                  ),
                                );
                              },
                            );
                          } else if (state is CoinsLoadInProgress) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is CoinsLoadFailure) {
                            return Center(
                              child: Text(
                                state.error!,
                                style: TextStylesApp.listCoinsError,
                              ),
                            );
                          }
                          return Center(child: Text(StringData.emptyList));
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
