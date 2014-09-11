part of motivatorModel;

class DataSource implements IDataSource {

  String serverUrl;

  int _lastAdviceId = null;


  //----------------------------------
  //  C O N S T R U C T O R
  //----------------------------------
  DataSource(this.serverUrl) {

  }


  void loadAdvice(Function callback) {

  }
}
