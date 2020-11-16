import 'dart:math';

import 'package:flutter/material.dart';
import 'package:partial_exam/screens/edit_tenis_court.dart';
import 'package:partial_exam/model/tenis_court.dart';

class TenisCourtsScreen extends StatefulWidget 
{
  @override
  _TenisCourtsScreenState createState() => _TenisCourtsScreenState();
}

class _TenisCourtsScreenState extends State<TenisCourtsScreen> 
{
  List<TenisCourt> _courts = [];
  
  void _createCourts(int court_amount)
  {
    for (int i = 0; i < court_amount; ++i)
    {
      _courts.add(TenisCourt(i + 1));
    }
  }

  void _editCourt(int index) 
  {
    Navigator.of(context).push(
        MaterialPageRoute
        (
          builder: (context) => EditTenisCourtScreen(
            court: _courts[index], 
            enable_lights: _courts[index].lights_enabled,
          ),
        ),
      )
        .then((editCourt) 
        {
          setState(() 
          {
            _courts[index] = editCourt.court;
          });
        });
  }

  @override
  Widget build(BuildContext context) 
  {
    if (_courts.length == 0)
    {
      _createCourts(30);
    }
    
    return Scaffold
    (
      appBar: AppBar(title: Text('Tenis Courts Grid')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5,),
        
        itemCount: _courts.length,
        itemBuilder: (context, index) 
        {
          return GestureDetector
          (
            onTap: () 
            {
              _editCourt(index);
            },

            child: Container
            (
              child: Column
              (
                children: [
                  Text('Court ${_courts[index].court_num}'),

                  Text("Lights:" + (_courts[index].lights_enabled ? "On" : "Off")),

                  Text(_courts[index].player),

                  FlatButton(
                    color: Theme.of(context).primaryColor,
                    child: Text("Free Court"),
                    onPressed: ()
                    {
                      setState(() {
                        _courts[index].player = "Free";
                        _courts[index].lights_enabled = false;
                      });
                    }
                  )

                ],
              ),
            )
          );
        },
      ),
    );
  }
}
