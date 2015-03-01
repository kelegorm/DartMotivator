part of motivator.data_source;

class DataSource implements IDataSource {

  String serverUrl;

  String _lastAdviceId = '';


  //----------------------------------
  //  C O N S T R U C T O R
  //----------------------------------
  DataSource(this.serverUrl) {

  }


  void loadAdvice(Function callback) {
    String data = "?lastId=$_lastAdviceId";

    HttpRequest.request(serverUrl + '/advice/random' + data, method: 'GET')
    .then((HttpRequest request) {
      var newAdvice = JSON.decode(request.response);
      _lastAdviceId = newAdvice["_id"];
      callback(newAdvice["text"]);
    });
  }

  void submitAdvice(String newAdvice) {
    String data = JSON.encode({"text": newAdvice});
    HttpRequest.request(serverUrl + '/advice', method: 'POST', sendData: data);
  }
}
