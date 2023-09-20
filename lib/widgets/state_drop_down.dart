import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/address/states_api.dart';

import '../api_services/properties/post_property_api.dart';

class StateDropdown extends StatefulWidget {
  const StateDropdown({super.key});

  @override
  State<StateDropdown> createState() => _CityDropDownState();
}

class _CityDropDownState extends State<StateDropdown> {
  String? selectedCity;
  @override
  Widget build(BuildContext context) {
    final statesApi = Get.put(StateApi());
    final postPropertyApiController = Get.put(PostPropertyApi());
    return FutureBuilder<List<States>>(
      future: statesApi.stateList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Select a State',
              border: OutlineInputBorder(),
            ),
            value: selectedCity,
            onChanged: (value) {
              setState(() {
                selectedCity = value;
              });

              postPropertyApiController.selectState(selectedCity.toString());
            },
            items: snapshot.data!.map((states) {
              return DropdownMenuItem<String>(
                value: states.stateId,
                child: Text(states.name),
              );
            }).toList(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
