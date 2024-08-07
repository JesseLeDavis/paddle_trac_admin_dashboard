import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'profile_page_state.dart';
part 'profile_page_cubit.freezed.dart';

@injectable
class ProfilePageCubit extends Cubit<ProfilePageState> {
  ProfilePageCubit() : super(const ProfilePageState.initial());

  Future<void> addUuidsFromCsv() async {
    const filePath = '../../../../assets/sticker_uuids.csv';
    final firestore = FirebaseFirestore.instance;

    // Read the CSV file from assets
    final csvString = await rootBundle.loadString(filePath);
    final csvData = const CsvToListConverter(eol: '\n').convert(csvString);

    // Iterate through each row in the CSV
    for (final row in csvData) {
      // Ensure each row is processed correctly
      if (row.isEmpty) {
        print('Empty row encountered, skipping.');
        continue;
      }

      // Assuming the UUID is the first column in each row
      final uuid = row[0].toString().trim();

      if (uuid.length > 1500) {
        print('Error: UUID $uuid is longer than 1500 bytes.');
        continue;
      }

      // Create the document with the UUID as the document ID
      try {
        await firestore.collection('uuids').doc(uuid).set({
          'isAssigned': false,
          'uuid': uuid,
        });
        print('Added document $uuid successfully.');
      } catch (e) {
        print('Error adding document $uuid: $e');
      }
    }

    print('All UUIDs have been processed.');
  }
}
