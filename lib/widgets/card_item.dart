import 'package:flutter/material.dart';
import 'package:insta/utils/colors.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        color: Colors.white,
        child: SizedBox(
            height: 350,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: const FadeInImage(
                          fit: BoxFit.fill,
                          width: 300,
                          height: 200,
                          placeholder: AssetImage(
                              "assets/images/placeholder_image.jpeg"),
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1554995207-c18c203602cb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Luxury Smart House",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Apartment ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                        ),
                        const Icon(Icons.brightness_1,
                            size: 6.0, color: primaryTosca),
                        Text(
                          " For Rent",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "68/4 Parakrama Mawatha, Panadura.",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "\$2500",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: primaryTosca),
                        ),
                        Text(
                          " /month",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.bed,
                          color: primaryPurple,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "4",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.bathtub,
                          color: primaryPurple,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "4",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.square_foot,
                          color: primaryPurple,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "4",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        const Spacer(),
                      ],
                    )
                  ]),
            )),
      ),
    );
  }
}
