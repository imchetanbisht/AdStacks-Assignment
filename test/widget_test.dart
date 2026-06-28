import 'package:flutter_test/flutter_test.dart';
import 'package:adstack_assignment/app.dart';

void main() {
  testWidgets('Dashboard loads successfully', (WidgetTester tester) async {

    await tester.pumpWidget(const DashboardApp());

    expect(find.text("Dashboard"), findsOneWidget);
  });
}