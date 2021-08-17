import 'package:flutter/foundation.dart';
import 'package:gigqo_assignment/model/Track.dart';

class HomePageProvider extends ChangeNotifier {
  bool _isHomePageProcessing = true;
  int _currentPage = 1;
  List<Track> _tracksList = [];
  bool _shouldRefresh = true;

  bool get shouldRefresh => _shouldRefresh;

  setShouldRefresh(bool value) => _shouldRefresh = value;

  int get currentPage => _currentPage;

  setCurrentPage(int page) {
    _currentPage = page;
  }

  bool get isHomePageProcessing => _isHomePageProcessing;

  setIsHomePageProcessing(bool value) {
    _isHomePageProcessing = value;
    notifyListeners();
  }

  List<Track> get postsList => _tracksList;

  setPostsList(List<Track> list, {bool notify = true}) {
    _tracksList = list;
    if (notify) notifyListeners();
  }

  mergePostsList(List<Track> list, {bool notify = true}) {
    _tracksList.addAll(list);
    if (notify) notifyListeners();
  }

  addPost(Track tracks, {bool notify = true}) {
    _tracksList.add(tracks);
    if (notify) notifyListeners();
  }

  Track getPostByIndex(int index) => _tracksList[index];

  int get postsListLength => _tracksList.length;
}
