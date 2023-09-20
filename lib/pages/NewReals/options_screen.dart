import 'package:flutter/material.dart';

class OptionsScreen extends StatefulWidget {
  final int reelTotalLikes;
  final bool liked;
  final String reelId;
  const OptionsScreen(
      {Key? key,
      required this.reelTotalLikes,
      required this.liked,
      required this.reelId})
      : super(key: key);

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  bool test = false;
  @override
  Widget build(BuildContext context) {
    // final likereelProvider =
    //     Provider.of<ReelLikeProvider>(context, listen: false);
    // final reaalDislikeProvider =
    //     Provider.of<ReelDislikeProvider>(context, listen: false);
    // final reelProvider = Provider.of<ReelProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 110),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        child: Icon(Icons.person, size: 18),
                      ),
                      const SizedBox(width: 6),
                      const Text('Skilldren Admin',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              //fontFamily: grandstander,
                              color: Colors.white,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ])),
                      const SizedBox(width: 10),
                      const Icon(Icons.verified, size: 15),
                      const SizedBox(width: 6),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Skilldren is beautiful and fast 💙❤💛 ..',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Icon(
                        Icons.music_note,
                        size: 15,
                      ),
                      Text(
                        'Original Audio - some music track--',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      // if (test == false) {
                      //   await likereelProvider.fetchApi(widget.reelId);
                      //   Fluttertoast.showToast(
                      //       msg: likereelProvider.mydata?.response ?? '');
                      //   reelProvider.fetchAip();
                      //   setState(() {
                      //     test = !test;
                      //   });
                      // } else {
                      //   await reaalDislikeProvider.fetchApi(widget.reelId);
                      //   Fluttertoast.showToast(
                      //       msg: reaalDislikeProvider.mydata?.response ?? '');
                      //   reelProvider.fetchAip();
                      //   setState(() {
                      //     test = !test;
                      //   });
                      // }
                    },
                    child: Icon(
                      test == false ? Icons.favorite_outline : Icons.favorite,
                      color: test == false ? Colors.white : Colors.red,
                    ),
                  ),

                  Text(widget.reelTotalLikes.toString()),
                  const SizedBox(height: 20),
                  // const Icon(Icons.comment_rounded),
                  // const Text('1123'),
                  // const SizedBox(height: 20),
                  Transform(
                    transform: Matrix4.rotationZ(5.8),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
