import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String name;
  final String? avartarUrl;
  final String? phone;
  final bool isUpload;
  final double size;
  const Avatar(
      {super.key,
      required this.name,
      this.avartarUrl,
      this.phone,
      this.isUpload = false,
      this.size = 120});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: size - 20,
              height: size - 20,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 248, 25, 9),
                shape: BoxShape.circle,
              ),
              child: avartarUrl != null
                  ? ClipOval(
                      child: Image.network(
                        avartarUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Text(
                              name.substring(0, 1).toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Center(
                      child: Text(
                        name.substring(0, 1).toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ),
                    ),
            ),
            if (isUpload)
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.file_upload_outlined,
                    color: Color.fromARGB(255, 248, 25, 9),
                    size: 20,
                  ),
                ),
              ),
          ],
        ),
        if (phone != null)
          SizedBox(
            width: size,
            child: Text(
              phone!,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}
