import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class User {
  final String name;
  final String section;

  User(this.name, this.section);
}

class UserManagementScreen extends StatefulWidget {
  @override
  _UserManagementScreenState createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  final List<User> users = [];
  String newName = '';
  String selectedSection = '';
  String modifiedName = '';
  String modifiedSection = '';
  String qrData = '';

  List<String> sections = ["Section 1", "Section 2", "Section 3", "Section 4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Management"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Users",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFFEF774C),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _showCreateUserDialog(context);
                },
                child: Icon(Icons.add),
                style: ElevatedButton.styleFrom(primary: Color(0xFFEF774C)),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text("${user.name} - ${user.section}", style: TextStyle(color: Color(0xFFEF774C))),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _showModifyUserDialog(context, user, index);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _showDeleteUserDialog(context, user, index);
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Color(0xFFEF774C)),
                        onPressed: () {
                          _generateQRCode(user.name); // Generate QR code
                          _showQRCodeDialog(context);
                        },
                        child: const Text("QR Code"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showCreateUserDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Create User", style: TextStyle(color: Color(0xFFEF774C))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(color: Color(0xFFEF774C)),
                ),
                onChanged: (value) {
                  setState(() {
                    newName = value;
                  });
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Section",
                  labelStyle: TextStyle(color: Color(0xFFEF774C)),
                ),
                value: selectedSection.isEmpty ? null : selectedSection,
                items: sections.map((section) {
                  return DropdownMenuItem<String>(
                    value: section,
                    child: Text(section),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSection = value!;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel", style: TextStyle(color: Color(0xFFEF774C))),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (newName.isNotEmpty && selectedSection.isNotEmpty) {
                    users.add(User(newName, selectedSection));
                    newName = '';
                    selectedSection = '';
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text("Continue", style: TextStyle(color: Color(0xFFEF774C))),
            ),
          ],
        );
      },
    );
  }

  void _showModifyUserDialog(BuildContext context, User user, int index) {
    modifiedName = user.name;
    modifiedSection = user.section;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Modify User", style: TextStyle(color: Color(0xFFEF774C))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(color: Color(0xFFEF774C)),
                ),
                controller: TextEditingController(text: modifiedName),
                onChanged: (value) {
                  setState(() {
                    modifiedName = value;
                  });
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Section",
                  labelStyle: TextStyle(color: Color(0xFFEF774C)),
                ),
                value: modifiedSection.isEmpty ? null : modifiedSection,
                items: sections.map((section) {
                  return DropdownMenuItem<String>(
                    value: section,
                    child: Text(section),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    modifiedSection = value!;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel", style: TextStyle(color: Color(0xFFEF774C))),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  users[index] = User(modifiedName, modifiedSection);
                  modifiedName = '';
                  modifiedSection = '';
                });
                Navigator.of(context).pop();
              },
              child: Text("Save Changes", style: TextStyle(color: Color(0xFFEF774C))),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteUserDialog(BuildContext context, User user, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete User", style: TextStyle(color: Color(0xFFEF774C))),
          content: Text("Are you sure you want to delete ${user.name}?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel", style: TextStyle(color: Color(0xFFEF774C))),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  users.removeAt(index); // Delete the user
                  qrData = ''; // Clear QR data
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Delete", style: TextStyle(color: Color(0xFFEF774C))),
            ),
          ],
        );
      },
    );
  }

  void _generateQRCode(String data) {
    setState(() {
      qrData = data;
    });
  }

  void _showQRCodeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("QR Code", style: TextStyle(color: Color(0xFFEF774C))),
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  QrImageView(
                    data: qrData,
                    version: QrVersions.auto,
                    size: 400.0,
                    gapless: false,
                    errorStateBuilder: (cxt, err) {
                      return const Text(
                        'Uh oh! Something went wrong...',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFFEF774C)),
                      );
                    },
                  ),
                  Text("QR Code Data: $qrData", style: TextStyle(color: Color(0xFFEF774C))),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close", style: TextStyle(color: Color(0xFFEF774C))),
            ),
          ],
        );
      },
    );
  }
}