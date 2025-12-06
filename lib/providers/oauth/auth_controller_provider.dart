import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utilities/auth_controller.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<bool>>(
      (ref) => AuthController(ref),
    );
