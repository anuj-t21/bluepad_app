import 'package:bluepad_app/providers/count.dart';
import 'package:provider/provider.dart';

import '../widgets/likeComment_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final articleWidget = RichText(
    text: new TextSpan(
      style: new TextStyle(
        color: Colors.black,
      ),
      children: <TextSpan>[
        new TextSpan(
          text: 'Crypto Investor Buys \$ 69 Million Beeple NFT Art Work\n\n',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        new TextSpan(
          text:
              'The latest news to do the rounds is about the investor from Singapore, has bought \$ 69 Million Beeple NFT. Now, that sounds too interesting. However, he is not ready to divulge his real name. I a world like ours, anyone can attack him for his funds. I just learnt, that this wealthy investor goes by the name Metakovan. It is a record of sorts in the bitcoin genre. The record-braking digital artwork is connected to an image file, that is connected to a NFT.\n\n'
              'You will be amazed to know how lucrative such bitcoins are getting today. Moreover, they are receiving rave reviews. Christie’s Auction House is behind this huge deal. Metakovan also happens to be the chief investor behind Metapurse. It is nothing, but a Crypto-based fund. It is also the largest NFT in the world. At least, that is what it claims to be. Metakovan has also given an interview on Google Hangouts, and states there, that it is one lucrative deal. It is a big investment. The art work in question is interesting.\n\n'
              'It is a mosaic of 5,000 artworks. It took him the last 13 years to prepare it. Says, Mike Winkelmann, who goes by the artist whose name is Beeple. One can find a variety of images inside the mosaic artwork. There is Abraham Lincoln spanking baby Trump, and more interesting ones. The bidding happened on 25 February. If reports are to be believed, initially things were a bit mellow, however, it shot up in the last ten minutes.\n\n'
              'The latest news to do the rounds is about the investor from Singapore, has bought \$ 69 Million Beeple NFT. Now, that sounds too interesting. However, he is not ready to divulge his real name. I a world like ours, anyone can attack him for his funds. I just learnt, that this wealthy investor goes by the name Metakovan. It is a record of sorts in the bitcoin genre. The record-braking digital artwork is connected to an image file, that is connected to a NFT.\n\n'
              'You will be amazed to know how lucrative such bitcoins are getting today. Moreover, they are receiving rave reviews. Christie’s Auction House is behind this huge deal. Metakovan also happens to be the chief investor behind Metapurse. It is nothing, but a Crypto-based fund. It is also the largest NFT in the world. At least, that is what it claims to be. Metakovan has also given an interview on Google Hangouts, and states there, that it is one lucrative deal. It is a big investment. The art work in question is interesting.\n\n'
              'It is a mosaic of 5,000 artworks. It took him the last 13 years to prepare it. Says, Mike Winkelmann, who goes by the artist whose name is Beeple. One can find a variety of images inside the mosaic artwork. There is Abraham Lincoln spanking baby Trump, and more interesting ones. The bidding happened on 25 February. If reports are to be believed, initially things were a bit mellow, however, it shot up in the last ten minutes.\n\n',
        ),
        new TextSpan(
          text: 'Monetization of NFTs\n\n',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        new TextSpan(
          text:
              'Well, this is not the first time, Metakovan has done this. He has purchased more such Beeple artworks amounting to \$ 2.2 million in December 2020. Moreover, he fractionalized them and locked them with blockchain. No one even got a whiff, of what he was up to. The entire episode has created a sudden gripping interest in NFTs.\n\n'
              'Winkelmann is not ready to divulge any further details yet. Well, Metakovan himself is not planning to sell his shares. This is a historic feat that he has achieved. For the uninitiated, almost 20 million visitors were a part of the auction. And, there were 200 registrations for the bidding. Metakovan was one of them. He has made the payment through ether. This is also a first, for Christie’s. no one has ever received such a large payment in cryptocurrency, in a similar domain.\n\n'
              'This is the third highest amount which has been paid for the artwork of a living artist. So, you can understand, how it is. The entire feeling is simply overwhelming. The amount, that Metakovan has invested in artwork can actually buy a few palaces in France. You could even buy a yacht or an aeroplane, with that amount of money.\n\n'
              'It seems that the market is quite open now.  And, people like Metakovan can do the unimaginable. Metakovan says, that he has no house, or cars. He just loves art and the power of bitcoin. He packs it up and moves on. While the world gushes at him.\n',
        ),
      ],
    ),
  );

  ScrollController _controller;

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange)
      Provider.of<Count>(context, listen: false)
          .toggleMainScreenBottomStatus(true);
    if (_controller.offset < _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange)
      Provider.of<Count>(context, listen: false)
          .toggleMainScreenBottomStatus(false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Count>(context);
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluepad'),
        elevation: 6,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              final snackBar = SnackBar(
                content: Text('You have pressed the home button.'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: articleWidget,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/ArticlePic.jpg'),
            ),
            LikeCommentItem(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: data.reachedMainScreenBottom
            ? deviceSize.height * 0.09
            : deviceSize.height * 0.07,
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.thumb_up),
                    onPressed: () {
                      data.toggleLike(data.likeCount);
                    },
                  ),
                  VerticalDivider(),
                  IconButton(
                    icon: Icon(Icons.comment_bank),
                    onPressed: () {
                      data.toggleComment(data.commentCount);
                    },
                  ),
                ],
              ),
            ),
            if (data.reachedMainScreenBottom)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text('You have reached the bottom!'),
                ),
              )
          ],
        ),
      ),
    );
  }
}
