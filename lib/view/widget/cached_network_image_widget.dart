import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/resources/color_manager.dart';
import '../../core/resources/image_network_name.dart';

class CachedNetworkImageWidget extends StatefulWidget {
  CachedNetworkImageWidget({Key? key,this.colorIcon=ColorManager.blackDark,this.width, this.height, this.image})
      : super(key: key);
  String? image;
  Color? colorIcon;
  double? height,width;

  @override
  State<CachedNetworkImageWidget> createState() =>
      _CachedNetworkImageWidgetState();
}

class _CachedNetworkImageWidgetState extends State<CachedNetworkImageWidget> {
  double newKey = 0;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: widget.height,
      width: widget.width,
      key: ValueKey(widget.image!.isEmpty
          ? widget.image
          : widget.image! + newKey.toString()),
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
            ),
          ),
        );
      },
      imageUrl: widget.image!.isEmpty
          ? 'https://0.0.0.0/2'
          : ImageNetworkName.rootImages + widget.image!,
      errorWidget: (context, url, error) {
        if (widget.image!.isNotEmpty) {
          newKey++;
        }

        if (error.toString() == "Failed host lookup: 'image.tmdb.org'") {
          return GestureDetector(
            onTap: () {},
            child: Container(
              height: double.infinity,
              child: Center(
                  child: Icon(
                    Icons.wifi_off,
                    size: 30,
                    color: widget.colorIcon,
                  )),
            ),
          );
        }
        return GestureDetector(
          onTap: () {},
          child: Center(
            child: Icon(
              Icons.image_not_supported,
              size: 30,
              color: widget.colorIcon,
            ),
          ),
        );
      },
      placeholder: (context, url) {
        return const Center(
          child: CircularProgressIndicator(color: ColorManager.deepOrange),
        );
      },
    );
  }
}
