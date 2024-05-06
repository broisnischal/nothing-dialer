import 'package:flutter_test/flutter_test.dart';
import 'package:nothing_dialer/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
