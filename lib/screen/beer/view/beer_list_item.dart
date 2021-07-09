import 'package:flutter/material.dart';
import 'package:piyush_flutter_bloc/lib.dart';

class BeerListItem extends StatelessWidget {
  const BeerListItem({Key? key, required this.beer}) : super(key: key);

  final BeerModel beer;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        title: Text(beer.name.toString(), style: MyStyles.fontMediumTextBold()),
        subtitle:
            Text(beer.tagline.toString(), style: MyStyles.fontSmallText()),
        childrenPadding: EdgeInsets.all(SizeConfig.listItemPadding),
        // collapsedBackgroundColor: Colors.grey,
        backgroundColor: Colors.black12,
        leading: Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(beer.id.toString()),
        ),
        children: [
          Text(beer.description.toString(),
              textAlign: TextAlign.justify, style: MyStyles.fontSmallText()),
          const SizedBox(height: SizeConfig.verticalSizeBoxSpace),
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
      ),
    );
  }
}
