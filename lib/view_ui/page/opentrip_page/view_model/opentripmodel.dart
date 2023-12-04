import 'package:flutter_riverpod/flutter_riverpod.dart';

final showCommentContainer = StateProvider(
  (ref) => false,
);
final reloadOpenTripPost = StateProvider(
  (ref) => true,
);
