import 'package:logify/logify.dart';
import 'package:receive_intent/receive_intent.dart';

class ShareService {
  Stream<Intent> stream() async* {
    try {
      final receivedIntent = await ReceiveIntent.getInitialIntent();

      if (receivedIntent != null) {
        yield receivedIntent;
      }
    } catch (e, stack) {
      Log.e(e, stack);
    }

    yield* ReceiveIntent.receivedIntentStream.where((event) => event != null).cast<Intent>();
  }
}
