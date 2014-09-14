part of dataSource;

class MockSource implements IDataSource {

  List<Advice> _advices = [
    new Advice('Advice #1', 0),
    new Advice('Advice #2', 1),
    new Advice('Advice #3', 2),
    new Advice('Advice #4', 3),
    new Advice('Advice #5', 4),
    new Advice('Advice #6', 5)
  ];

  int _lastAdviceId = null;


  //----------------------------------
  //  C O N S T R U C T O R
  //----------------------------------
  MockSource() {

  }


  void loadAdvice(Function callback) {
    Advice newAdvice = _getRandomAdvice(_lastAdviceId);
    _lastAdviceId = newAdvice._id;

    callback(newAdvice.text);
  }

  void submitAdvice(String newAdvice) {
    _advices.add(new Advice(newAdvice, _advices.length));
  }

  Advice _getRandomAdvice(int lastAdviceId) {
    int newId = new Random().nextInt(_advices.length - 1);

    if (newId == lastAdviceId) {
      newId++;
    }

    return _advices[newId];
  }
}

class Advice {
  String text;
  int _id;

  Advice(this.text, this._id);

}