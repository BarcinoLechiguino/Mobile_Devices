import 'package:flutter/material.dart';
import 'package:userlist/screens/edit_user_screen.dart';

import '../model/user.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<User> _users = [
    User("jbond", "James Bond"),
    User("root", "Administrator", true),
    User("ksmith", "Kevin Smith"),
  ];

  void _editUser(int index) {
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (context) => EditUserScreen(
          user: _users[index],
        ),
      ),
    )
        .then((editResult) {
      if (editResult != null) {
        if (editResult.userRemoved) {
          setState(() {
            _users.removeAt(index);
          });
        } else if (editResult.user != null) {
          setState(() {
            _users[index] = editResult.user;
          });
        }
      }
    });
  }

  void _createNewUser(BuildContext context) {
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (context) => EditUserScreen(
          newUser: true,
        ),
      ),
    )
        .then((editResult) {
      if (editResult.user != null) {
        setState(() {
          _users.add(editResult.user);
        });
      }
    });
  }

  void _confirmDeleteUser(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Delete'),
        content: Text(
          'Are you sure you want to delete user "${_users[index].fullname}"?',
        ),
        actions: [
          FlatButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          FlatButton(
            child: Text('Delete'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    ).then((reallyDelete) {
      if (reallyDelete) {
        setState(() => _users.removeAt(index));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List')),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return ListTile(
            title: Text(user.fullname),
            subtitle: Text(user.username),
            trailing: user.isAdmin ? Icon(Icons.verified_user) : null,
            onLongPress: () => _confirmDeleteUser(index),
            onTap: () {
              _editUser(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _createNewUser(context);
        },
      ),
    );
  }
}
