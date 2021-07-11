class ModelStatus {
  static ModelStatus? _instance;

  List<PageStatus> _list = List.empty(growable: true);

  ModelStatus._internal();

  factory ModelStatus.instance() => _getInstance();

  static ModelStatus _getInstance() {
    if (_instance == null) {
      _instance = ModelStatus._internal();
    }
    return _instance!;
  }

  void init(int length, int current) {
    if (_list.isNotEmpty) return;
    List<PageStatus> pages = List.empty(growable: true);
    List.generate(length, (index) {
      PageStatus status = PageStatus(
        index: index,
        isShow: index == current,
        path: "",
      );
      pages.add(status);
    });
    updatePageStatus(pages);
  }

  PageStatus getPageStatu(int index) => _list[index];

  void setPageStatu(PageStatus page) {
    _list.removeAt(page.index!);
    _list.insert(page.index!, page);
  }

  PageStatus setPageStatuByIndex(int index) {
    _list.forEach((status) {
      status.isShow = _list.indexOf(status) == index;
    });
    return getPageStatu(index);
  }

  PageStatus deleteByIndex(int index) {
    PageStatus status = getPageStatu(index);
    _list.removeAt(index);
    _list.forEach((status) {
      status.index = _list.indexOf(status);
    });
    return status;
  }

  void deletePageStatu(PageStatus status) {
    int index = _list.indexOf(status);
    deleteByIndex(index);
  }

  void addPageStatu(PageStatus status) {
    status.index = _list.length;
    _list.add(status);
  }

  void updatePageStatus(List<PageStatus> data) {
    _list.clear();
    _list.addAll(data);
  }

  List<PageStatus> get list => _list;
}

class PageStatus {
  int? index;
  bool isShow;
  String? path;

  PageStatus({
    this.index,
    this.isShow = false,
    this.path,
  });
}
