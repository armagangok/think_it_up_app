// import '../models/word_hive_model.dart';
// import '../services/base_service.dart';

// enum AppMode { debug, release }

// class WordDBRepository implements HiveBaseService {
//   AppMode appMode = AppMode.release;

//   final _currentDBService;
//   final _dbDummyService;

//   @override
//   Future<void> addData(Word word) async {
//     if (appMode == AppMode.debug) {
//       await _dbDummyService.addData(word);
//     } else {
//       await _currentDBService.addData(word);
//     }
//   }

//   @override
//   Future<void> deleteData(int index) async {
//     if (appMode == AppMode.debug) {
//       await _dbDummyService.deleteData(index);
//     } else {
//       await _currentDBService.deleteData(index);
//     }
//   }

//   @override
//   Word getData(int index) {
//     if (appMode == AppMode.debug) {
//       return _dbDummyService.getData(index);
//     } else {
//       return _currentDBService.getData(index);
//     }
//   }

//   @override
//   Future<int> getLanguage() async {
//     if (appMode == AppMode.debug) {
//       return await _dbDummyService.getLanguage();
//     } else {
//       return await _currentDBService.getLanguage();
//     }
//   }

//   @override
//   Future<void> saveLanguage(int index) async {
//     if (appMode == AppMode.debug) {
//       await _dbDummyService.saveLanguage(index);
//     } else {
//       await _currentDBService.saveLanguage(index);
//     }
//   }

//   @override
//   Future<void> setupLanguage() async {
//     if (appMode == AppMode.debug) {
//       await _dbDummyService.setupLanguage();
//     } else {
//       await _currentDBService.setupLanguage();
//     }
//   }
// }
