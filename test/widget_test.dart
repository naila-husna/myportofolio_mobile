import 'dart:convert';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';

void main() {
  final project = <String, dynamic>{
    'id': 'a-project-id',
    'title': 'Portofolio',
    'description': 'Aplikasi portofolio pribadi',
    'tech_stack': 'Flutter, Django',
    'project_url': 'https://example.com',
    'project_image_url': '',
  };

  ApiClient api({bool empty = false}) => ApiClient(
    client: MockClient((request) async {
      if (request.url.path.endsWith('auth/token/')) {
        return http.Response(jsonEncode({'token': 'test-token'}), 200);
      }
      if (request.url.path.endsWith('auth/logout/')) {
        return http.Response('', 204);
      }
      if (request.method == 'POST') {
        expect(request.headers['authorization'], 'Token test-token');
        final body = jsonDecode(request.body) as Map<String, dynamic>;
        expect(body.containsKey('id'), isFalse);
        expect(body['tech_stack'], 'Flutter, Django');
        return http.Response(jsonEncode({...body, 'id': 'new-project'}), 201);
      }
      return http.Response(jsonEncode(empty ? [] : [project]), 200);
    }),
  );

  Future<void> login(WidgetTester tester) async {
    await tester.enterText(find.byType(TextFormField).at(0), 'owner');
    await tester.enterText(find.byType(TextFormField).at(1), 'password');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pumpAndSettle();
  }

  test('Logout tetap menghapus sesi saat API menolak token', () async {
    final client = ApiClient(
      client: MockClient((request) async {
        return http.Response('{"detail":"Invalid token"}', 401);
      }),
    );
    final auth = AuthState(client, initialToken: 'expired-token');
    var notified = false;
    auth.addListener(() => notified = true);
    await auth.logout();
    expect(auth.token, isNull);
    expect(auth.isLoggedIn, isFalse);
    expect(notified, isTrue);
    auth.dispose();
    client.close();
  });

  testWidgets('Daftar dapat dicoba ulang setelah API gagal', (tester) async {
    var requests = 0;
    final client = ApiClient(
      client: MockClient((request) async {
        requests++;
        return requests == 1
            ? http.Response('Server error', 500)
            : http.Response(jsonEncode([project]), 200);
      }),
    );
    await tester.pumpWidget(MyApp(apiClient: client));
    await tester.tap(find.text('Lihat Proyek'));
    await tester.pumpAndSettle();
    expect(find.text('Retry'), findsOneWidget);
    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();
    expect(find.text('Portofolio'), findsOneWidget);
    expect(requests, 2);
    client.close();
  });

  testWidgets('Daftar publik membuka detail proyek', (tester) async {
    await tester.pumpWidget(MyApp(apiClient: api()));
    expect(find.text('Naila Husna'), findsOneWidget);
    await tester.tap(find.text('Lihat Proyek'));
    await tester.pumpAndSettle();
    expect(find.text('Portofolio'), findsOneWidget);
    await tester.tap(find.text('Portofolio'));
    await tester.pumpAndSettle();
    expect(find.text('Tech Stack: Flutter, Django'), findsOneWidget);
    expect(find.byType(Image), findsNothing);
  });

  testWidgets('Daftar kosong tetap mendukung refresh', (tester) async {
    await tester.pumpWidget(MyApp(apiClient: api(empty: true)));
    await tester.tap(find.text('Lihat Proyek'));
    await tester.pumpAndSettle();
    expect(find.text('No projects found.'), findsOneWidget);
    expect(find.byType(RefreshIndicator), findsOneWidget);
  });

  testWidgets('Form meminta login lalu menyimpan proyek melalui API', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(500, 1400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MyApp(apiClient: api()));
    await tester.tap(find.text('Tambah Proyek'));
    await tester.pumpAndSettle();
    expect(find.text('Add Project Form'), findsNothing);
    await login(tester);
    expect(find.text('Add Project Form'), findsOneWidget);
    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'Portofolio');
    await tester.enterText(fields.at(1), 'Aplikasi portofolio pribadi');
    await tester.enterText(fields.at(2), 'Flutter, Django');
    await tester.enterText(fields.at(3), 'invalid-url');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(
      find.text('Masukkan URL http atau https yang valid!'),
      findsOneWidget,
    );
    expect(find.byType(AlertDialog), findsNothing);
    await tester.enterText(fields.at(3), 'https://example.com');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Proyek berhasil ditambahkan!'), findsOneWidget);
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    for (final field in tester.widgetList<EditableText>(
      find.byType(EditableText),
    )) {
      expect(field.controller.text, isEmpty);
    }
  });

  testWidgets('Login dan logout dari menu memperbarui sesi', (tester) async {
    await tester.pumpWidget(MyApp(apiClient: api()));
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();
    await login(tester);
    expect(find.text('Logout'), findsOneWidget);
    await tester.tap(find.text('Logout'));
    await tester.pumpAndSettle();
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Berhasil logout.'), findsOneWidget);
  });
}
