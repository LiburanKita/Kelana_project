import 'package:flutter_riverpod/flutter_riverpod.dart';

final tapContentProvider = StateProvider.autoDispose(
  (ref) => false,
);
final tapOpenTripProvider = StateProvider.autoDispose(
  (ref) => false,
);
final isImgPost = StateProvider.autoDispose(
  (ref) => false,
);
final uploadAsOT = StateProvider(
  (ref) => false,
);
final listUploadImg = StateProvider(
  (ref) => [],
);
final titleFieldValueProvider = StateProvider(
  (ref) => '',
);
final descriptionsFieldValueProvider = StateProvider(
  (ref) => '',
);
final priceOTFieldValueProvider = StateProvider(
  (ref) => '',
);
final participantsFieldValueProvider = StateProvider(
  (ref) => '',
);
final isUploadProvider = StateProvider<bool>(
  (ref) => false,
);
