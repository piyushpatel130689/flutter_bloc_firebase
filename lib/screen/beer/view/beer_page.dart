import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:piyush_flutter_bloc/lib.dart';

class BeerPage extends StatelessWidget {
  //final BeerRepository beerRepository;

  //const BeerPage({Key? key, required this.beerRepository}) : super(key: key);

  // static Route route() {
  //   return MaterialPageRoute<void>(builder: (_) => const BeerPage());
  // }

  final BeerRepository beerRepository = BeerRepository(
    apiClient: ApiClient(httpClient: http.Client()),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Beers',
        style: MyStyles.fontScreenTitleTextBold(),
      )),
      body: Padding(
          padding: const EdgeInsets.only(
              left: SizeConfig.screenPadding,
              right: SizeConfig.screenPadding,
              top: SizeConfig.screenPadding),
          child: BlocProvider<BeerBloc>(
            create: (context) => BeerBloc(
              beerRepository: beerRepository,
            )..add(FetchBeerEvent()),
            child: BeerBody(),
          )),
    );
  }
}
