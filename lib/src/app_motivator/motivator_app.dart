import 'package:polymer/polymer.dart';
import 'dart:html';

import 'package:motivator/data_source.dart';

@CustomTag('motivator-app')
class MotivatorApp extends PolymerElement {

  //----------------------------------
  //  P A R T S
  //----------------------------------

  SpanElement messageDisplay;

  @observable
  String message = '';

  @observable
  bool addAdvicePopup_opened = false;

  @observable
  String submittedAdvice = '';

//  IDataSource _data = new DataSource('http://motivator.apps.kelegorm.ru');
//  IDataSource _data = new DataSource('http://localhost:3000');
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

  void addAdviceButton_click(MouseEvent event) {
    event.preventDefault();
    if (addAdvicePopup_opened == false) {
      addAdvicePopup_opened = true;
    }
  }

  void submitAdviceButton_click(MouseEvent event) {
    submitAdvice(submittedAdvice);
    submittedAdvice = '';
  }

  void loadAdvice() {
    messageDisplay.classes.add('loading');
    _data.loadAdvice((String advice) {
      message = advice;
      messageDisplay.classes.remove('loading');
    });
  }

  submitAdvice(String newAdvice) {
    _data.submitAdvice(newAdvice);
  }
}