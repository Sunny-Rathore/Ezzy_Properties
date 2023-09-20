import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api_services/address/city_api.dart';
import '../api_services/properties/post_property_api.dart';

class CityDropdown extends StatefulWidget {
  const CityDropdown({super.key});

  @override
  State<CityDropdown> createState() => _CityDropDownState();
}

class _CityDropDownState extends State<CityDropdown> {
  String? selectedCity;
  @override
  Widget build(BuildContext context) {
    final cityApi = Get.put(CityApi());
    final postPropertyApiController = Get.put(PostPropertyApi());
    return FutureBuilder<List<City>>(
      future: cityApi.cityList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Select a city',
              border: OutlineInputBorder(),
            ),
            value: selectedCity,
            onChanged: (value) {
              setState(() {
                selectedCity = value;
              });
              postPropertyApiController.selectCity(selectedCity.toString());
            },
            items: snapshot.data!.map((city) {
              return DropdownMenuItem<String>(
                value: city.cityId,
                child: Text(city.name),
              );
            }).toList(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const Text('');
        }
      },
    );
  }
}
