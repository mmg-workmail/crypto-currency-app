import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/helpers/decimalRounder.dart';
import 'package:my_flutter_app/data/data_source/ResponseModel.dart';
import 'package:my_flutter_app/logic/providers/marketViewProvider.dart';
import 'package:my_flutter_app/presentation/ui/helper/ThemeSwitcher.dart';
import 'package:my_flutter_app/presentation/ui/helper/shimmer/market.dart';
import 'package:provider/provider.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final marketProvider =
        Provider.of<MarketViewprovider>(context, listen: false);
    marketProvider.getAllCryptoData();

    timer = Timer.periodic(const Duration(seconds: 20),
        (Timer t) => marketProvider.getAllCryptoData());
  }

  @override
  void dispose() {
    timer.cancel();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var primaryColor = Theme.of(context).primaryColor;
    var borderColor = Theme.of(context).secondaryHeaderColor;
    TextTheme textTheme = Theme.of(context).textTheme;
    var iconTheme = Theme.of(context).iconTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        actions: const [
          ThemeSwitcher(),
        ],
        iconTheme: iconTheme,
        titleTextStyle: textTheme.titleLarge,
        title: const Text('Market'),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(child: Consumer<MarketViewprovider>(
              builder: (context, marketViewprovider, child) {
                switch (marketViewprovider.state.status) {
                  case Status.LOADING:
                    return const ShimmerMarketView();
                  case Status.COMPLETED:
                    List model = marketViewprovider
                        .dataCryptoCurrency.data!.cryptoCurrencyList;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintStyle: textTheme.bodySmall,
                              prefixIcon: Icon(
                                Icons.search,
                                color: borderColor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: borderColor,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider();
                            },
                            itemCount: model!.length,
                            itemBuilder: (context, index) {
                              var number = index + 1;
                              var tokenId = model![index].id;
                              MaterialColor filterColor =
                                  DecimalRounder.setColorFilter(
                                model[index].quotes![0].percentChange24H,
                              );

                              var finalPrice =
                                  DecimalRounder.removePriceDecimals(
                                model[index].quotes![0].price,
                              );

                              var precentChange =
                                  DecimalRounder.removePercentDecimals(
                                model[index].quotes![0].percentChange24H,
                              );

                              Color precentColor =
                                  DecimalRounder.setPrecentChangesColor(
                                model[index].quotes![0].percentChange24H,
                              );
                              Icon precentIcon =
                                  DecimalRounder.setPrecentChangesIcon(
                                model[index].quotes![0].percentChange24H,
                              );

                              return SizedBox(
                                height: heightScreen * 0.075,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        number.toString(),
                                        style: textTheme.bodySmall,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 15,
                                      ),
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            const Duration(milliseconds: 500),
                                        height: 32,
                                        width: 32,
                                        imageUrl:
                                            "https://s2.coinmarketcap.com/static/img/coins/64x64/$tokenId.png",
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            model[index].name!,
                                            style: textTheme.bodySmall,
                                          ),
                                          Text(
                                            model[index].symbol!,
                                            style: textTheme.labelSmall,
                                          )
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                          filterColor,
                                          BlendMode.srcATop,
                                        ),
                                        child: SvgPicture.network(
                                          "https://s3.coinmarketcap.com/generated/sparklines/web/1d/2781/$tokenId.svg",
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "\$$finalPrice",
                                              style: textTheme.bodySmall,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                precentIcon,
                                                Text(
                                                  "$precentChange%",
                                                  style: GoogleFonts.ubuntu(
                                                    color: precentColor,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    );
                  case Status.ERROR:
                    return Text(marketViewprovider.state.message);
                  default:
                    return Container();
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
