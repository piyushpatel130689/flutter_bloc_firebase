import 'package:flutter/material.dart';
import 'package:piyush_flutter_bloc/lib.dart';

class BeerListItem extends StatelessWidget {
  const BeerListItem({Key? key, required this.beer}) : super(key: key);

  final BeerModel beer;

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
