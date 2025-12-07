import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utilities/auth_controller.dart';
const logtoRedirectUri = 'io.logto://callback';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<bool>>(
      (ref) => AuthController(ref),
    );
