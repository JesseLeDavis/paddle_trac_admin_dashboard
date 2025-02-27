import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:csv/csv.dart';
import 'package:file_saver/file_saver.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:paddle_trac_admin_dashboard/collections/partner_buissness.dart';
import 'package:uuid/uuid.dart';

part 'sticker_generator_state.dart';
part 'sticker_generator_cubit.freezed.dart';

@injectable
class StickerGeneratorCubit extends Cubit<StickerGeneratorState> {
  StickerGeneratorCubit() : super(const StickerGeneratorState.initial());

  Future<void> generateCSV({
    required PartnerBusiness business,
    required int stickerCount,
  }) async {
    final businessId = business.uuid;
    const uuid = Uuid();
    final uuids = <String>[];
    final stickerList = <String>[];

    for (var i = 0; i < stickerCount; i++) {
      final newUuid = uuid.v4();
      final formattedUuid = '$businessId-$newUuid';
      final formattedSticker = 'https://paddletrac.com/paddle/$formattedUuid';
      uuids.add(formattedUuid);
      stickerList.add(formattedSticker);
    }

    // Generate CSV for UUIDs
    final uuidCsvData = [
      ...uuids.map((uuid) => [uuid]),
    ];

    final uuidCsvFile = const ListToCsvConverter().convert(uuidCsvData);
    final uuidBytes = Uint8List.fromList(utf8.encode(uuidCsvFile));

    final uuidFileName =
        'paddletrac-uuids-${DateTime.now().toIso8601String()}-$businessId-$stickerCount-orders.csv';

    await FileSaver.instance.saveFile(
      name: uuidFileName,
      bytes: uuidBytes,
      ext: 'csv',
      mimeType: MimeType.csv,
    );

    // Generate CSV for Sticker URLs
    final stickerCsvData = [
      ...stickerList.map((sticker) => [sticker]),
    ];

    final stickerCsvFile = const ListToCsvConverter().convert(stickerCsvData);
    final stickerBytes = Uint8List.fromList(utf8.encode(stickerCsvFile));

    final stickerFileName =
        'paddletrac-stickers-${DateTime.now().toIso8601String()}-$businessId-$stickerCount-orders.csv';

    await FileSaver.instance.saveFile(
      name: stickerFileName,
      bytes: stickerBytes,
      ext: 'csv',
      mimeType: MimeType.csv,
    );
  }
}
