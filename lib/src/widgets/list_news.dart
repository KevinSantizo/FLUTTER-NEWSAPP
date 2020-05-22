import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/my_theme.dart';

class ListNews extends StatelessWidget {

  final List<Article> news;
  const ListNews( this.news);
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.news.length,
      itemBuilder: (BuildContext context, int index) {
        return _New(neww: this.news[index], index: index,);
      },
    );
  }
}

class _New extends StatelessWidget {

  final Article neww;
  final int index;

  const _New({Key key, @required this.neww, @required this.index}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TargetTopBar(neww, index),
        TargetTitle(neww),
        _TargetImage(neww),
        _TargetBody(neww),
        SizedBox(height: 10.0),
        Divider(),
        _TargetButtons()
      ],
    );
  }
}

class _TargetButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: (){},
            fillColor: myTheme.accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Icon(Icons.star_border),
          ),
          VerticalDivider(),
          RawMaterialButton(
            onPressed: (){},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Icon(Icons.more),
          )
        ],
      ),
    );
  }
}

class _TargetBody extends StatelessWidget {
  final Article neww;

  const _TargetBody(this.neww);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text( (neww !=null) ? neww.description : ''),
    );
  }
}

class _TargetImage extends StatelessWidget {
  final Article neww;

  const _TargetImage( this.neww);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0), bottomRight: Radius.circular(50.0)),
        child: Container(
          child: (neww.urlToImage !=null)?
            FadeInImage(  
              placeholder: AssetImage('assets/giphy.gif'),
              image: NetworkImage(neww.urlToImage),
            ) : Image(
              image: AssetImage('assets/no-image.png')
            )
        ),
      ),
    );
  }
}

class TargetTitle extends StatelessWidget {
  final Article neww;
  const TargetTitle(
    this.neww,
  );


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(neww.title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),),
    );
  }
}

class _TargetTopBar extends StatelessWidget {

  final Article neww;
  final int index;


  const _TargetTopBar(this.neww, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: <Widget>[
          Text('${index + 1 } ', style: TextStyle(color: myTheme.accentColor),),
          Text('${neww.source.name}')
        ],
      ),
    );
  }
}