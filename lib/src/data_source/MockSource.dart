part of motivator.data_source;

class MockSource implements IDataSource {

  List<Advice> _advices = [
    new Advice('Be happy with your work', 0),
    new Advice('If you wont to do a task, check himself why', 1),
    new Advice('Make a time for work, and make a time for a rest', 2),
    new Advice('Just start reading your tasks by 5 minutes and than take a rest. You brain will keep work on tasks', 3),
    new Advice('Split big task on subtasks and make estimation', 4),
    new Advice('C\'mon, just working!', 5)
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
    if (newAdvice == null) return;

    newAdvice = newAdvice.trim();
    if (newAdvice.isEmpty) return;

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