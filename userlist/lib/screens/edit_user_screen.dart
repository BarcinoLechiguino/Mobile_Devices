import 'package:flutter/material.dart';
import 'package:userlist/model/user.dart';

class EditResult {
  User user; // null => cancellat
  bool userRemoved; // true => esborrat
  EditResult({this.user, this.userRemoved});
}

class EditUserScreen extends StatefulWidget {
  final bool newUser;
  final User user;
  EditUserScreen({this.newUser = false, this.user});

  @override
  _EditUserScreenState createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  TextEditingController _fullnameController;
  TextEditingController _usernameController;
  bool _isAdmin;

  @override
  void initState() {
    if (widget.newUser) {
      _fullnameController = TextEditingController();
      _usernameController = TextEditingController();
      _isAdmin = false;
    } else {
      _fullnameController = TextEditingController(
        text: widget.user.fullname,
      );
      _usernameController = TextEditingController(
        text: widget.user.username,
      );
      _isAdmin = widget.user.isAdmin;
    }
    super.initState();
  }

  @override
  void dispose() {
    _fullnameController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.newUser ? "New User..." : "Edit User...",
        ),
        actions: [
          if (!widget.newUser)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Navigator.of(context).pop(
                  EditResult(userRemoved: true),
                );
              },
            ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _fullnameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'username',
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: _isAdmin,
                  onChanged: (newValue) {
                    setState(() {
                      _isAdmin = newValue;
                    });
                  },
                ),
                Text('Administrator'),
              ],
            ),
            Spacer(),
            FlatButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                widget.newUser ? "Create User" : "Save User",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(
                  EditResult(
                    user: User(
                      _usernameController.text,
                      _fullnameController.text,
                      _isAdmin,
                    ),
                    userRemoved: false,
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
