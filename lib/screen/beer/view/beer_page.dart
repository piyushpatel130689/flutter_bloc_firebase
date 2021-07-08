import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piyush_flutter_bloc/api/apiclient.dart';
import 'package:piyush_flutter_bloc/common/sizeconfig.dart';
import 'package:piyush_flutter_bloc/data/repositories/beer_repository.dart';
import 'package:piyush_flutter_bloc/screen/beer/bloc/beer_bloc.dart';
import 'beer_body.dart';
import 'package:http/http.dart' as http;

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
      appBar: AppBar(title: const Text('Beers')),
      body: Padding(
          padding: const EdgeInsets.all(SizeConfig.screenPadding),
          child: BlocProvider<BeerBloc>(
            create: (context) => BeerBloc(
              beerRepository: beerRepository,
            )..add(BeerFetchEvent()),
            child: BeerBody(),
          )),
    );
  }
}
