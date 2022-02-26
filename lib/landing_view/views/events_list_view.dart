import 'package:flutter/material.dart';

class EventsListView extends StatelessWidget {
  const EventsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 16),
            child: Text("Section Title",
                style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: 240,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 135,
                            width: 240,
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://images.pexels.com/photos/2253831/pexels-photo-2253831.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text("Feb 2022"),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Event Name",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Dolorum reprehenderit quia ad. Itaque repellat est accusantium est. Amet aliquid voluptas dolores nobis. Quibusdam odit deserunt qui. Cupiditate consectetur eos aut quo. Quisquam expedita aut sapiente nihil voluptate soluta aut consequatur.",
                            style: Theme.of(context).textTheme.caption,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
