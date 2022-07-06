//@dart=2.9
// ignore_for_file: prefer_const_constructors
import 'dart:ui';
// Packages

import'package:flutter/material.dart';
import'package:flutter_riverpod/flutter_riverpod.dart';

//Models
import'../model/search_category.dart';

class MainPage extends ConsumerWidget{
 
  double _deviceHeight;
  double _deviceWidth;
  TextEditingController _searchTextFieldController;

  @override
 Widget build(BuildContext context,ScopedReader watch){

   _deviceHeight=MediaQuery.of(context).size.height;
   _deviceWidth=MediaQuery.of(context).size.width;
   _searchTextFieldController=TextEditingController();

    return _buildUI();
 }
 Widget _buildUI(){
    return Scaffold(
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
    width:_deviceHeight* 0.88,
    child:Column(
      mainAxisSize:MainAxisSize.max,
      mainAxisAlignment:MainAxisAlignment.start,
      crossAxisAlignment:CrossAxisAlignment.center,
      children:[
       _topBarWidget(),
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
     onSubmitted:(_input){},
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
      value:SearchCategory.none,
      icon:Icon(
      Icons.menu,color:Colors.white24,),
      onChanged:(value){},
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

}