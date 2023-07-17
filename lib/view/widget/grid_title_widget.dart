import 'package:flutter/material.dart';

import '../../core/resources/color_manager.dart';
import '../../data/models/movie_model.dart';
import 'cached_network_image_widget.dart';


class GridTitleWidget extends StatelessWidget {
 final MovieModel movie;

  const GridTitleWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GridTile(
                    footer: Container(
                      height: 25,
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: ColorManager.blackOpacity70,
                            offset: Offset(0.0, 14.0),
                            blurRadius: 30,
                            spreadRadius: 15),
                      ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10
                        ),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(
                              double.parse("${movie.rating}")
                                  .toStringAsFixed(1),
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12,
                                color: ColorManager.whiteOpacity80,
                              ),
                            ),
                            const Icon(Icons.star,
                                color: ColorManager.whiteOpacity80, size: 9),
                            Expanded(
                              child: Text(
                                movie.productionData!
                                    .substring(0, 4),
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.whiteOpacity80,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    child: CachedNetworkImageWidget(
                      image: movie.image,
                    ))),
          )),
    );
  }
}
