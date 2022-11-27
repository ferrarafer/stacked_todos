// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todos/helpers/form_validators.dart';

const String TitleValueKey = 'title';
const String DescriptionValueKey = 'description';

final Map<String, TextEditingController> _EditTaskViewTextEditingControllers =
    {};

final Map<String, FocusNode> _EditTaskViewFocusNodes = {};

final Map<String, String? Function(String?)?> _EditTaskViewTextValidations = {
  TitleValueKey: FormValidators.title,
  DescriptionValueKey: FormValidators.description,
};

mixin $EditTaskView on StatelessWidget {
  TextEditingController get titleController =>
      _getFormTextEditingController(TitleValueKey);
  TextEditingController get descriptionController =>
      _getFormTextEditingController(DescriptionValueKey);
  FocusNode get titleFocusNode => _getFormFocusNode(TitleValueKey);
  FocusNode get descriptionFocusNode => _getFormFocusNode(DescriptionValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_EditTaskViewTextEditingControllers.containsKey(key)) {
      return _EditTaskViewTextEditingControllers[key]!;
    }
    _EditTaskViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _EditTaskViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_EditTaskViewFocusNodes.containsKey(key)) {
      return _EditTaskViewFocusNodes[key]!;
    }
    _EditTaskViewFocusNodes[key] = FocusNode();
    return _EditTaskViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    titleController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the dynamic
  void _updateFormData(dynamic model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          TitleValueKey: titleController.text,
          DescriptionValueKey: descriptionController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the dynamic
  void _updateValidationData(dynamic model) => model.setValidationMessages({
        TitleValueKey: _getValidationMessage(TitleValueKey),
        DescriptionValueKey: _getValidationMessage(DescriptionValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _EditTaskViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_EditTaskViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _EditTaskViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _EditTaskViewFocusNodes.values) {
      focusNode.dispose();
    }

    _EditTaskViewTextEditingControllers.clear();
    _EditTaskViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get titleValue => this.formValueMap[TitleValueKey] as String?;
  String? get descriptionValue =>
      this.formValueMap[DescriptionValueKey] as String?;

  bool get hasTitle => this.formValueMap.containsKey(TitleValueKey);
  bool get hasDescription => this.formValueMap.containsKey(DescriptionValueKey);

  bool get hasTitleValidationMessage =>
      this.fieldsValidationMessages[TitleValueKey]?.isNotEmpty ?? false;
  bool get hasDescriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey]?.isNotEmpty ?? false;

  String? get titleValidationMessage =>
      this.fieldsValidationMessages[TitleValueKey];
  String? get descriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey];
}

extension Methods on FormViewModel {
  setTitleValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TitleValueKey] = validationMessage;
  setDescriptionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DescriptionValueKey] = validationMessage;
}
