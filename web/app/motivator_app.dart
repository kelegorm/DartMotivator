import 'package:polymer/polymer.dart';
import 'dart:html';

import 'dataSource/lib.dart';

@CustomTag('motivator-app')
class MotivatorApp extends PolymerElement {

  //----------------------------------
  //  P A R T S
  //----------------------------------
  SpanElement messageDisplay;

  @observable
  String message = 'Hi there!';

//  IDataSource _data = new DataSource('http://motivator.apps.kelegorm.ru');
  IDataSource _data = new MockSource();

  //----------------------------------
  //  C O N S T R U C T O R
  //----------------------------------
  MotivatorApp.created() : super.created() {
    messageDisplay =  shadowRoot.querySelector('#messageDisplay') as SpanElement;

    loadAdvice();
  }


  void nextButton_click(MouseEvent event) {
    event.preventDefault();

    loadAdvice();
  }


  void loadAdvice() {
    messageDisplay.classes.add('loading');
    _data.loadAdvice((String advice) {
      message = advice;
      messageDisplay.classes.remove('loading');
    });
  }

}