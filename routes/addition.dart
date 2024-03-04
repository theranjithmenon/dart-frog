import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;
  final body = await request.body();
  final jsonBody = jsonDecode(body);
  final sum;
  sum = int.parse(jsonBody['firstNumber'].toString()) +
      int.parse(jsonBody['secondNumber'].toString());
  return Response(
    body: jsonEncode({
      'status': 200,
      'message': 'success',
      'data': {
        'sum': sum.toString(),
      },
    }),
  );
}
