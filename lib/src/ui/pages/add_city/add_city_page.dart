import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../res/l10n/generated/l10n.dart';
import '../../components/buttons/custom_fab.dart';
import 'states/add_city_state.dart';

class AddCityPage extends StatelessWidget {
  const AddCityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final addCityWatcher = ref.watch(addCityState);
      return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).addCityPageTitle),
        ),
        floatingActionButton: CustomFAB(
          icon: Icons.save,
          onTap: () => addCityWatcher.saveForm(),
        ),
        body: FormBuilder(
          key: addCityWatcher.formKey,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormBuilderTextField(
                  name: 'city',
                  decoration: InputDecoration(
                    hintText: S.of(context).hintCity,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      context,
                      errorText: S.of(context).requiredText,
                    ),
                  ]),
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
