import 'package:api_test/provider/provider.dart';
import 'package:api_test/view/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  /// warning はそのままにしない方が良い。
  /// ここならconstをつける。
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 可能ならば final で宣言すること
    var flag = ref.watch(codeProvider);
    return Scaffold(
      body: pages(flag),
    );
  }
}
