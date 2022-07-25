import 'package:flutter/material.dart';

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
                    const Text(
                      "Luxury Smat House",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Apartment . For Rent",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "68/4 Parakrama Mawatha, Panadura.",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "\$2500",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.teal[700]),
                        ),
                        const Text(
                          " /month",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.bed,
                          color: Colors.orange[300],
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          "4",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.bathtub,
                          color: Colors.orange[300],
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          "4",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.square_foot,
                          color: Colors.orange[300],
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          "4",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
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
