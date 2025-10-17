import 'package:flutter/material.dart';

// Function that returns a Card widget
Widget cardWidget({
  String? userProfile,
  required String? userName,
  required String title,
  required String blog,
  required String createdAt,
    required VoidCallback onEdit,
  required VoidCallback onDelete,
}) {

  bool isFavorited = false;

  return Card(
    color: Color.fromRGBO(31, 29, 33, 1),
    elevation: 0,
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white, width: 1.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage:
                    userProfile != null ? NetworkImage(userProfile) : null,
                child: userProfile == null ? const Icon(Icons.person) : null,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName ?? "Anonymous",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    createdAt,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            blog,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              StatefulBuilder(
                builder: (context, setState) {
                  return IconButton(
                    icon: Icon(
                      isFavorited ? Icons.favorite : Icons.favorite_border,
                      color: isFavorited ? Colors.red : Colors.white,
                      size: 22,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorited = !isFavorited;
                      });
                    },
                  );
                },
              ),
              PopupMenuButton<String>(
                color: Color.fromRGBO(31, 29, 33, 1),
                icon: const Icon(Icons.more_horiz),
                onSelected: (value) {
                  if (value == 'edit') {
                    onEdit();
                  } else if (value == 'delete') {
                    onDelete();
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'edit',
                    padding: EdgeInsets.zero,
                    child: SizedBox(
                      width: 150,
                      height: 30,
                      child: Row(
                        children: const [
                          SizedBox(width: 12),
                          Icon(Icons.edit, size: 18),
                          SizedBox(width: 8),
                          Text(
                            'Edit',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'delete',
                    padding: EdgeInsets.zero,
                    child: SizedBox(
                      width: 150,
                      height: 30,
                      child: Row(
                        children: const [
                          SizedBox(width: 12),
                          Icon(Icons.delete, size: 18),
                          SizedBox(width: 8),
                          Text(
                            'Delete',
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                offset: const Offset(0, 30), //  move the popup a bit lower
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
