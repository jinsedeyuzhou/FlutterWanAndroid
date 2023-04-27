
class PagingController<T> {
  List<T> listItems = [];
  int pageNumber =0;
  bool isLoadingPage = false;
  bool endOfList = false;

  initRefresh() {
    listItems = [];
    pageNumber = 0;
    isLoadingPage = false;
    endOfList = false;
  }

  bool canLoadNextPage() {
    return !isLoadingPage && !endOfList;
  }

  appendItem(List<T> items) {
    listItems.insertAll(0,items);
  }

  appendPage(List<T> items) {
    listItems.addAll(items);
    pageNumber++;
  }

  appendLastPage(List<T> items) {
    listItems.addAll(items);
    endOfList = true;
  }
}
