import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
  }) : super(key: key);
  final String image;
  final String name;
  final String description;

  /*final String image =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Ahsan_Manzil-Front_View.jpg/1280px-Ahsan_Manzil-Front_View.jpg';
  final String name = 'আহসান মঞ্জিল';
  final String des =
      "ইসলামপুরের কুমারটুলী নামে পরিচিত পুরনো ঢাকার বুড়িগঙ্গা নদীর তীরে বর্তমান ইসলামপুরে আহসান মঞ্জিল অবস্থিত। এটি ব্রিটিশ ভারতের উপাধিপ্রাপ্ত ঢাকার নওয়াব পরিবারের বাসভবন ও সদর কাচারি ছিল। অনবদ্য অলঙ্করন সমৃদ্ধ সুরম্য এ ভবনটি ঢাকার অন্যতম শ্রেষ্ঠ স্থাপত্য নিদর্শন।নওয়াব আব্দুল গনির পিতা খাজা আলিমুল্লাহ ১৮৩০ সালে ফরাসিদের নিকট থেকে এই কুঠিটি ক্রয়পূর্বক সংস্কারের মাধ্যমে নিজ বাসভবনের উপযোগী করেন। পরবর্তীতে নওয়াব আব্দুল গনি ১৮৬৯ সালে এই প্রাসাদটি পুন:নির্মাণ করেন এবং প্রিয় পুত্র খাজা আহসানুল্লাহর নামানুসারে এর নামকরণ করেন আহসান মঞ্জিল।";*/
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height * 0.36,
      width: _size.width,
      // color: Colors.white.withOpacity(0.8),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        elevation: 5.0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        )),
        //color: Colors.white.withOpacity(0.8),
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child: Image.network(
                image,
                height: _size.height * 0.28,
                width: _size.width,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 21.0, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
