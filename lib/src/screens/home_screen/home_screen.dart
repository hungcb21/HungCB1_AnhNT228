import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/coins_bloc/coins_bloc.dart';
import '../../blocs/coins_bloc/coins_event.dart';
import '../../blocs/coins_bloc/coins_state.dart';
import '../../constants/app_theme.dart';
import '../../constants/colors.dart';
import '../../constants/routes.dart';
import '../../constants/string_data.dart';
import '../../widgets/coin_card.dart';
import '../../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _heightOfTopContainer = 200;
  final _searchBarPadding = EdgeInsets.fromLTRB(20, 20, 20, 0);
  final _coinListPadding = EdgeInsets.fromLTRB(20, 40, 20, 0);
  final _coinListBorderRadius = BorderRadius.only(
      topRight: Radius.circular(40), topLeft: Radius.circular(40));
  final _coinTitlePadding = EdgeInsets.symmetric(vertical: 20);
  final _coinCardPadding = EdgeInsets.symmetric(vertical: 10);

  @override
  void initState() {
    super.initState();
    context
        .read<CoinsBloc>()
        .add(CoinListRequested(currency: StringData.USD, sparkLine: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: _heightOfTopContainer,
              padding: _searchBarPadding,
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
                padding: _coinListPadding,
                decoration: BoxDecoration(
                    color: ColorsApp.backgroundBottomColor,
                    borderRadius: _coinListBorderRadius),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: _coinTitlePadding,
                      child: Text(StringData.listCoinsTitle,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: AppFontWeight.extraBold)),
                    ),
                    Flexible(
                      child: BlocBuilder<CoinsBloc, CoinsState>(
                        builder: (BuildContext context, state) {
                          if (state is CoinsLoadSuccess) {
                            if (state.listCoins == null) {
                              return Center(child: Text(StringData.emptyList));
                            } else {
                              return RefreshIndicator(
                                onRefresh: () async {
                                  context.read<CoinsBloc>().add(
                                      CoinListRequested(
                                          currency: StringData.USD,
                                          sparkLine: true));
                                },
                                child: ListView.builder(
                                  itemCount: state.listCoins!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: _coinCardPadding,
                                      child: CoinCard(
                                        image: state.listCoins![index].image,
                                        name: state.listCoins![index].name,
                                        symbol: state.listCoins![index].symbol,
                                        price: state.listCoins![index]
                                                .currentPrice ??
                                            0,
                                        priceChange: state.listCoins![index]
                                                .priceChange_24h ??
                                            0,
                                        onTap: () => {
                                          Navigator.pushNamed(context,
                                              RouteConstant.detailRoute,
                                              arguments:
                                                  state.listCoins![index])
                                        },
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          }
                          if (state is CoinsLoadInProgress) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is CoinsLoadFailure) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(state.error!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                            fontWeight: AppFontWeight.extraBold,
                                            color: Colors.red)),
                                FloatingActionButton(
                                  onPressed: () async {
                                    context.read<CoinsBloc>().add(
                                        CoinListRequested(
                                            currency: StringData.USD,
                                            sparkLine: true));
                                  },
                                  child: new Icon(Icons.refresh),
                                  backgroundColor: Colors.red,
                                ),
                              ],
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
