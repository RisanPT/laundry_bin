import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:laundry_bin/features/serviceability/admin/view/widgets/image_add_service_widget.dart';

class AdminProfilePage extends HookWidget {
  const AdminProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = useState<bool>(false);
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImagePickerForServices(),
            SizedBox(height: 20),
            ListTile(
              title: Text('Opening Time'),
              subtitle: Text('12:00 PM'),
            ),
            ListTile(
              title: Text('Closing Time'),
              subtitle: Text('12:00 AM'),
            ),
            ListTile(
              title: Text('Reset Password'),
            ),
            ListTile(
              title: Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
