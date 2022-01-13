import 'package:fsmusic_flutter/pages/basic/base_validate_error.dart';

extension SToValidate on String {
  ValidateSOrNot toValidate() => ValidateSOrNot(this, needValidate: true);
  ValidateSOrNot toNoValidate() => ValidateSOrNot(this);
}
