import 'package:provider/provider.dart';

import 'inject.dart';

export 'package:provider/provider.dart' hide ProxyProvider;

class ProxyProvider<Base, Child extends Base> extends Provider<Base> {
  ProxyProvider({super.key, super.child})
      : super(create: (context) => Provider.of<Child>(context, listen: false));
}

class DiProvider<T extends Object> extends Provider<T> {
  DiProvider({super.key, super.child})
      : super(
          create: (context) {
            try {
              return Provider.of<T>(context, listen: false);
            } on ProviderNotFoundException {
              return get<T>();
            }
          },
        );
}
