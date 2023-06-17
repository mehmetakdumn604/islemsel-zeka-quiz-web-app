import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.instance.appName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppConstants.instance.appVersion,
                style: const TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: Center(
                  child: Text(
                    AppConstants.instance.appDescription,
                    style: const TextStyle(
                      fontSize: 30.0,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'HAZIRLAYAN: ${AppConstants.instance.preparedBy}',
                style: const TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
