part of dataSource;

class DataSource implements IDataSource {

  String serverUrl;

  int _lastAdviceId = null;


  //----------------------------------
  //  C O N S T R U C T O R
  //----------------------------------
  DataSource(this.serverUrl) {

  }


  void loadAdvice(Function callback) {
    Map data = {"lastId": _lastAdviceId};

    HttpRequest.request(serverUrl + '/advice/random', method: 'GET', sendData: '')
      .then((HttpRequest request) {
        print(request.status);
        print(request.response);
        callback(request.responseText);
      });
  }
}
