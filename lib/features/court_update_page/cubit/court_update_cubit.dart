import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:paddle_trac_admin_dashboard/infrastructure/api_error/api_error.dart';
import 'package:paddle_trac_admin_dashboard/models/court_update_request/court_update_request.model.dart';
import 'package:paddle_trac_admin_dashboard/models/court/court.model.dart';
import 'package:paddle_trac_admin_dashboard/services/court_update_service.dart';
import 'package:paddle_trac_admin_dashboard/services/court_service.dart';

part 'court_update_state.dart';
part 'court_update_cubit.freezed.dart';

@injectable
class CourtUpdateCubit extends Cubit<CourtUpdateState> {
  CourtUpdateCubit(
    @Named.from(AdminCourtUpdateRequestService) this._reqService,
    @Named.from(CourtService) this._courtService,
  ) : super(const CourtUpdateState.initial());

  final IAdminCourtUpdateRequestService _reqService;
  final ICourtService _courtService;

  Future<void> fetchRequests() async {
    emit(const CourtUpdateState.loading());
    final res = await _reqService.getAllUpdateRequests();
    res.fold(
      (err) => emit(CourtUpdateState.error(message: err.toString())),
      (list) => emit(
        CourtUpdateState.loaded(
          requests: list,
        ),
      ),
    );
  }

  Future<void> selectRequest(CourtUpdateRequest req) async {
    // 1) mark loading
    emit(
      state.maybeMap(
        loaded: (l) => l.copyWith(
          selectedRequest: req,
          selectedCourt: null,
          courtLoadError: null,
          isCourtLoading: true,
        ),
        orElse: () => state,
      ),
    );

    // 2) fetch the Court
    final either = await _courtService.getCourtById(req.courtId);
    either.fold(
      (err) {
        emit(
          state.maybeMap(
            loaded: (l) => l.copyWith(
              courtLoadError: err,
              isCourtLoading: false,
            ),
            orElse: () => state,
          ),
        );
      },
      (court) {
        emit(
          state.maybeMap(
            loaded: (l) => l.copyWith(
              selectedCourt: court,
              courtLoadError: null,
              isCourtLoading: false,
            ),
            orElse: () => state,
          ),
        );
      },
    );
  }

  Future<void> approveRequest(CourtUpdateRequest req) async {
    emit(const CourtUpdateState.loading());
    final res = await _reqService.approveUpdateRequest(req);
    res.fold(
      (err) => emit(CourtUpdateState.error(message: err.toString())),
      (_) => fetchRequests(),
    );
  }

  Future<void> denyRequest(CourtUpdateRequest req) async {
    emit(const CourtUpdateState.loading());
    final res = await _reqService.denyUpdateRequest(req);
    res.fold(
      (err) => emit(CourtUpdateState.error(message: err.toString())),
      (_) => fetchRequests(),
    );
  }

  // ─────── Editing the review map ───────

  /// Update simple text fields:
  /// 'name', 'address', 'website', 'nets', 'pubOrPriv'
  void updateReviewField(String key, String value) {
    state.maybeMap(
      loaded: (l) {
        final req = l.selectedRequest!;
        final newMap = Map<String, dynamic>.from(req.requestedUpdates)
          ..[key] = value.trim();
        emit(
          l.copyWith(
            selectedRequest: req.copyWith(requestedUpdates: newMap),
          ),
        );
      },
      orElse: () {},
    );
  }

  /// Increment or decrement the courts count,
  /// storing as "X Courts" under key `'courts'`.
  void _changeCourtsBy(int delta) {
    state.maybeMap(
      loaded: (l) {
        final req = l.selectedRequest!;
        final court = l.selectedCourt!;

        // parse original count from "X Courts"
        final origCount = int.tryParse(court.courts.split(' ').first) ?? 0;

        // parse any previous admin change, falling back to origCount
        final prevCountStr =
            (req.requestedUpdates['courts'] as String?)?.split(' ').first;
        final prevCount = prevCountStr != null
            ? int.tryParse(prevCountStr) ?? origCount
            : origCount;

        final updated = (prevCount + delta).clamp(0, 9999);

        final newMap = Map<String, dynamic>.from(req.requestedUpdates)
          ..['courts'] = '$updated Courts';

        emit(
          l.copyWith(
            selectedRequest: req.copyWith(requestedUpdates: newMap),
          ),
        );
      },
      orElse: () {},
    );
  }

  void incrementCourts() => _changeCourtsBy(1);
  void decrementCourts() => _changeCourtsBy(-1);

  /// Toggle an amenity in the review list, producing
  /// a List<String> under key 'amenities'.
  /// Toggle an amenity in the review list, producing
  /// a List<String> under key 'amenities'.
  void toggleReviewAmenity(String amenity) {
    state.maybeMap(
      loaded: (l) {
        final req = l.selectedRequest!;
        final rawString = l.selectedCourt!.amenities;

        // ─── parse the original amenities exactly like user‐facing cubit ───
        final origAmenities = rawString
            .replaceAll('[', '')
            .replaceAll(']', '')
            .split(',')
            .map((e) => e.trim().replaceAll("'", ''))
            .where((e) => e.isNotEmpty)
            .toList();

        // ─── take any previous edits, or fall back to the parsed originals ──
        final current = (req.requestedUpdates['amenities'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            origAmenities;

        // ─── toggle the amenity ────────────────────────────────────────────
        if (current.contains(amenity)) {
          current.remove(amenity);
        } else {
          current.add(amenity);
        }

        // ─── write it back into requestedUpdates ───────────────────────────
        final newMap = Map<String, dynamic>.from(req.requestedUpdates)
          ..['amenities'] = current;

        emit(
          l.copyWith(
            selectedRequest: req.copyWith(requestedUpdates: newMap),
          ),
        );
      },
      orElse: () {},
    );
  }
}
