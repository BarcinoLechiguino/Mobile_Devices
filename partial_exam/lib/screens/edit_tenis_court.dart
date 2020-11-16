import 'package:flutter/material.dart';
import 'package:partial_exam/model/tenis_court.dart';

class EditCourt 
{
  TenisCourt  court;                                        // null => no court
  bool        lights_enabled;                               // true => lights on
  String      player;
  EditCourt({this.court, this.lights_enabled, this.player});
}

class EditTenisCourtScreen extends StatefulWidget 
{
  final TenisCourt  court;
  final bool        enable_lights;
  final String      new_player;
  
  EditTenisCourtScreen({this.court, this.enable_lights = false, this.new_player = "Free"});

  @override
  _EditTenisCourtScreenState createState() => _EditTenisCourtScreenState();
}

class _EditTenisCourtScreenState extends State<EditTenisCourtScreen> 
{
  int                   _index;
  bool                  _lights_enabled;
  TextEditingController _new_player_controller;

  @override
  void initState() 
  {
     _index = widget.court.court_num;
     _new_player_controller   = TextEditingController(text: widget.court.player,);

     if (widget.enable_lights)
     {
        _lights_enabled = true;
     }
     else
     {
       _lights_enabled = false;
     }
    super.initState();
  }

  @override
  void dispose() 
  {
    _new_player_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar( title: Text("Edit TenisCourt"),),
      body: Padding
      (
        padding: EdgeInsets.all(24),
        child: Column
        (
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: 
          [
            TextField
            (
              controller: _new_player_controller,
              decoration: InputDecoration
              (
                labelText: 'Full Name',
              ),
            ),
            SizedBox(height: 16),
            SizedBox(height: 16),
            Row
            (
              children: [
                Checkbox
                (
                  value: _lights_enabled,
                  onChanged: (new_value) 
                  {
                    setState(() 
                    {
                      _lights_enabled = new_value;
                    });
                  },
                ),
                Text('Enable Lights'),
              ],
            ),
            Spacer(),
            FlatButton
            (
              color: Theme.of(context).primaryColor,
              child: Text("Save Tenis Court",
                style: TextStyle
                (
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              onPressed: () 
              {
                Navigator.of(context).pop(
                  EditCourt
                  (
                    court: TenisCourt(_index, _lights_enabled, _new_player_controller.text,),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
