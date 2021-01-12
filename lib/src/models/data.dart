import 'package:tollway/src/models/information.dart';
import 'package:tollway/src/models/payment_method.dart';

class Data {
  static final List<PaymentMethodItem> paymentList = [
    PaymentMethodItem(cardId: '12352', cardName: 'Visa'),
    PaymentMethodItem(cardId: '0252314', cardName: 'MasterCard'),
  ];

  static final List<InformationItem> informList = [
    InformationItem(informId: '1212312121', informImage: 'assets/images/info1.png', informLink: ''),
    InformationItem(informId: '7524164552', informImage: 'assets/images/info2.png', informLink: ''),
  ];
}