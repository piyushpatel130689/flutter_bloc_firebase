import 'package:flutter/material.dart';
import 'package:piyush_flutter_bloc/data/models/beer_model.dart';

class BeerListItem extends StatelessWidget {
  final BeerModel beer;

  const BeerListItem(this.beer);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(beer.name.toString()),
      subtitle: Text(beer.tagline.toString()),
      childrenPadding: const EdgeInsets.all(16),
      leading: Container(
        margin: EdgeInsets.only(top: 8),
        child: Text(beer.id.toString()),
      ),
      children: [
        Text(
          beer.description.toString(),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20),
        beer.imageUrl == null
            ? Container()
            : Image.network(
                beer.imageUrl.toString(),
                loadingBuilder: (context, widget, imageChunkEvent) {
                  return imageChunkEvent == null
                      ? widget
                      : CircularProgressIndicator();
                },
                height: 300,
              ),
      ],
    );
  }
}
