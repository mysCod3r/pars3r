import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config_example/firebase_options.dart';
import 'package:firebase_remote_config_example/remote_item.dart';
import 'package:firebase_remote_config_example/remote_x.dart';
import 'package:firebase_remote_config_example/services/api_remote_config_service.dart';
import 'package:firebase_remote_config_example/services/index.dart';
import 'package:flutter/material.dart';

const _source = RemoteSource.firebase;

/// The [remoteConfigService] is the service used to fetch remote configuration
final IRemoteConfigService remoteConfigService = switch (_source) {
  RemoteSource.firebase => FirebaseRemoteConfigService(),
  RemoteSource.api => ApiRemoteConfigService(),
};

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await remoteConfigService.initialize();
  runApp(const _MyApp());
}

final class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.teal,
            brightness: Brightness.dark,
          ),
        ),
        themeMode: ThemeMode.dark,
        home: const _HomeView(),
      );
}

final class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

final class _HomeViewState extends State<_HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: RemoteItem.values.map((item) {
                return _Item(
                  title: item.name,
                  subtitle: item.read.toString(),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

final class _Item extends StatelessWidget {
  const _Item({required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
