//@dart=2.9
// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'dart:ui';
// Packages
import'package:flutter/material.dart';
import'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_project_moviesmania/controllers/main_page_data_controller.dart';
import 'package:movies_project_moviesmania/model/main_page_data.dart';

//Widget
import '../widgets/movie_tile.dart';

//Models
import'../model/search_category.dart';
import '../model/movie.dart';

final mainPageDataControllerProvider = StateNotifierProvider<MainPageDataController>((ref) {
  return MainPageDataController();
  });

class MainPage extends ConsumerWidget{
 
  double _deviceHeight;
  double _deviceWidth;

  MainPageDataController _mainPageDataController;
  MainPageData _mainPageData;

  TextEditingController _searchTextFieldController;

  @override
 Widget build(BuildContext context,ScopedReader watch){

   _deviceHeight=MediaQuery.of(context).size.height;
   _deviceWidth=MediaQuery.of(context).size.width;

   _mainPageDataController = watch(mainPageDataControllerProvider);
   _mainPageData = watch(mainPageDataControllerProvider.state);



   _searchTextFieldController=TextEditingController();

    return _buildUI();
 }
 Widget _buildUI(){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:Colors.black,
      body:Container(
        height:_deviceHeight,
        width:_deviceWidth,
        child:Stack(
        alignment:Alignment.center,
        children:[
          _backgroundWidget(),
          _foregroundWidgets(),
        ],
        ),
        )
    );
 }
 Widget _backgroundWidget(){
  return Container(
    height:_deviceHeight,
   width:_deviceWidth,
   decoration:BoxDecoration(
     borderRadius:BorderRadius.circular(10.0),
      image:DecorationImage(
        image: NetworkImage(
           'https://posterspy.com/wp-content/uploads/2019/09/godzillakong.jpg'),
       fit:BoxFit.cover,
     ),
   ),
    child:BackdropFilter(
      filter:ImageFilter.blur(sigmaX: 15.0,sigmaY:15.0),
      child:Container(
       decoration:BoxDecoration(
         color:Colors.black.withOpacity(0.2),
       ),
       ) 
    ),
  );
}

Widget _foregroundWidgets(){
  return Container(
    padding:EdgeInsets.fromLTRB(0,_deviceHeight*0.02,0,0),
    width:_deviceWidth* 0.88,
    child:Column(
      mainAxisSize:MainAxisSize.max,
      mainAxisAlignment:MainAxisAlignment.end,
      crossAxisAlignment:CrossAxisAlignment.center,
      children:[
       _topBarWidget(),
       Container(
        height: _deviceHeight * 0.83,
        padding: EdgeInsets.symmetric(vertical: _deviceHeight *0.01),
        child: _moviesListViewWidget(),
        )
      ]
    ),
  );
}

Widget _topBarWidget(){
  return Container(
    height:_deviceHeight*0.08,
    decoration:BoxDecoration(
      color:Colors.black54,
      borderRadius:BorderRadius.circular(20.0),
    ),
    child:Row(
      mainAxisSize:MainAxisSize.max,
      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
      crossAxisAlignment:CrossAxisAlignment.center,
      children:[
         _searchFieldWidget(),
         _categorySelectionWidget(),
      ],
    ),
  );
}

Widget _searchFieldWidget(){
  final _border=InputBorder.none;

  return Container(
    
    width:_deviceWidth*0.50,
    height:_deviceHeight*0.05,

    child:TextField(
     controller:_searchTextFieldController,
     onSubmitted:(_input) ==> 
          _mainPageDataController.updateTextSearch(_input),
     style:TextStyle(color:Colors.white),
     decoration:InputDecoration(
       focusedBorder:_border,
       border:_border,
       prefixIcon:Icon(Icons.search,color:Colors.white24),
       hintStyle:TextStyle(color:Colors.white54),
       filled:false,
       fillColor:Colors.white24,
       hintText:'Search ....'
       ),
   ) 
 );
}
 
 Widget _categorySelectionWidget(){
    return DropdownButton(
      dropdownColor: Colors.black38,
      value:_mainPageData.searchCategory,
      icon:Icon(
      Icons.menu,color:Colors.white24,),
      onChanged:(_value) => _value.toString().isNotEmpty ? _mainPageDataController.updateSearchCategory(_value) : null,
       items:[
          DropdownMenuItem(
          child:Text(
               SearchCategory.popular,
               style:TextStyle(color:Colors.white),
              ), 
              value: SearchCategory.popular,
             ),
          DropdownMenuItem(
          child:Text(
                SearchCategory.upcoming,
                style:TextStyle(color:Colors.white),
                ), 
                value: SearchCategory.upcoming,
               ),
           DropdownMenuItem(
            child:Text(
                SearchCategory.none,
                style: TextStyle(color:Colors.white),
                 ),
                 value: SearchCategory.none,
               ),
        ]
    );
  }
  Widget _moviesListViewWidget(){

    final List <Movie> _movies = _mainPageData.movies;

    if(_movies.length != 0){
      return ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (BuildContext _context ,int _count){
          return Padding(padding: EdgeInsets.symmetric(
            vertical: _deviceHeight* 0.01,horizontal: 0),
            child: GestureDetector(
              onTap:(){},
              child: MovieTile(
                movie: _movies[_count],
                height: _deviceHeight *0.20 ,
                width: _deviceWidth * 0.85,
              ),
            ),
          );
        });

    }
    else{
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
    }
  }

}