import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/address/area_api.dart';
import 'package:property_app/api_services/properties/post_property_api.dart';

class AreaDropdown extends StatefulWidget {
  final String cityId;
  const AreaDropdown({super.key, required this.cityId});

  @override
  State<AreaDropdown> createState() => _CityDropDownState();
}

class _CityDropDownState extends State<AreaDropdown> {
  String? selectedArea;
  @override
  Widget build(BuildContext context) {
    final areaApi = Get.put(AreaApi());
    final postpropertyController = Get.put(PostPropertyApi());
    return FutureBuilder(
      future: areaApi.fetchAreas(widget.cityId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Select a Area',
              border: OutlineInputBorder(),
            ),
            value: selectedArea,
            onChanged: (value) {
              setState(() {
                selectedArea = value;
              });
              postpropertyController.onCityAreaChanged(value!);
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
