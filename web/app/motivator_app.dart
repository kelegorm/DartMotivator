import 'package:polymer/polymer.dart';
import 'dart:html';

import 'model/lib.dart';

@CustomTag('motivator-app')
class MotivatorApp extends PolymerElement {

  //----------------------------------
  //  P A R T S
  //----------------------------------
  SpanElement messageDisplay;

  @observable
  String message = 'Hi there!';

  IDataSource _data = new DataSource();

  //----------------------------------
  //  C O N S T R U C T O R
  //----------------------------------
  MotivatorApp.created() : super.created() {
    messageDisplay =  shadowRoot.querySelector('#messageDisplay') as SpanElement;
  }


  void nextButton_click(MouseEvent event) {
    event.preventDefault();

    loadAdvice();
  }


  void loadAdvice() {
//    messageDisplay.classes.add('loading');
//    _data.loadAdvice((Object advice) {
//
//    });
  }

}