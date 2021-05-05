class ModelStatus {
  static ModelStatus _instance;

  List<PageStatus> _list = List.empty(growable: true);

  ModelStatus._internal();

  factory ModelStatus.instance() => _getInstance();

  static ModelStatus _getInstance() {
    if (_instance == null) {
      _instance = ModelStatus._internal();
    }
    return _instance;
  }

  void init(int length, int current) {
    List<PageStatus> pages = List.empty(growable: true);
    List.generate(length, (index) {
      PageStatus status = PageStatus(
        index: index,
        isShow: index == current,
        path: "",
      );
      pages.add(status);
    });
    ModelStatus.instance().updatePageStatus(pages);
  }

  PageStatus getPageStatu(int index) => _list[index];

  void setPageStatu(PageStatus page) {
    _list.removeAt(page.index);
    _list.insert(page.index, page);
  }

  PageStatus setPageStatuByIndex(int index) {
    List<PageStatus> data = List.empty(growable: true);
    ModelStatus.instance().list.asMap().forEach((key, value) {
      PageStatus status = PageStatus(
        index: key,
        isShow: index == key,
        path: value.path,
      );
      data.add(status);
    });
    ModelStatus.instance().updatePageStatus(data);
    PageStatus status = ModelStatus.instance().getPageStatu(index);
    return status;
  }

  void updatePageStatus(List<PageStatus> data) {
    _list.clear();
    _list.addAll(data);
  }

  List<PageStatus> get list => _list;
}

class PageStatus {
  int index;
  bool isShow;
  String path;

  PageStatus({
    this.index,
    this.isShow = false,
    this.path,
  });
}
