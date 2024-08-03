import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/helpers/decimalRounder.dart';
import 'package:my_flutter_app/data/data_source/ResponseModel.dart';
import 'package:my_flutter_app/presentation/ui/helper/shimmer/home.dart';
import 'package:my_flutter_app/logic/providers/cryptoDataProvider.dart';
import 'package:provider/provider.dart';

class Cryptocurrencyitems extends StatefulWidget {
  Cryptocurrencyitems({super.key});

  @override
  State<Cryptocurrencyitems> createState() => _CryptocurrencyitemsState();
}

class _CryptocurrencyitemsState extends State<Cryptocurrencyitems> {
  // var defaultChoiceIndex = 0;

  final List<String> _choicesList = [
    'Top MarketCaps',
    'Top Gainers',
    'Top Losers'
  ];

  @override
  Widget build(BuildContext context) {
    final cryptoProvider = Provider.of<CryptoDataProvider>(context);
    var heightScreen = MediaQuery.of(context).size.height;
    var textTheme = Theme.of(context).textTheme;
    var primaryColor = Theme.of(context).primaryColor;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Row(
            children: [
              Consumer<CryptoDataProvider>(
                builder: (context, cryptoDataProvider, child) {
                  return Wrap(
                    spacing: 8,
                    children: List.generate(
                      _choicesList.length,
                      (index) {
                        return ChoiceChip(
                          label: Text(
                            _choicesList[index],
                            style: textTheme.titleSmall,
                          ),
                          selected:
                              cryptoDataProvider.defaultChoiceIndex == index,
                          selectedColor: primaryColor,
                          onSelected: (value) {
                            switch (index) {
                              case 0:
                                cryptoProvider.getTopMarketCapData();
                                break;
                              case 1:
                                cryptoProvider.getTopGainersData();
                                break;
                              case 2:
                                cryptoProvider.getTopLosersData();
                                break;
                            }
                          },
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
        SizedBox(
          height: 500,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 130),
            child: Consumer<CryptoDataProvider>(
              builder: (context, cryptoDataProvider, child) {
                switch (cryptoDataProvider.state.status) {
                  case Status.LOADING:
                    return const ShimmerHomeView();
                  case Status.COMPLETED:
                    List model = cryptoDataProvider
                        .dataCryptoCurrency.data!.cryptoCurrencyList;
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        var number = index + 1;
                        var tokenId = model![index].id;
                        MaterialColor filterColor =
                            DecimalRounder.setColorFilter(
                          model[index].quotes![0].percentChange24H,
                        );

                        var finalPrice = DecimalRounder.removePriceDecimals(
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
                        Icon precentIcon = DecimalRounder.setPrecentChangesIcon(
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
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
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: model.length,
                    );
                  case Status.ERROR:
                    return Text(cryptoDataProvider.state.message);
                  default:
                    return Container();
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
