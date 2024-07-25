import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:injectable/injectable.dart';
import 'package:josh_weather/shared/widget/common_gradient.dart';
import 'package:josh_weather/shared/widget/location_item.dart';
import 'package:use_state_utils/use_state_utils.dart';

import '../../../../core/core.dart';
import '../../../../shared/shared.dart';
import '../../../application/blocs/blocs.dart';
import '../../../domain/domain.dart';

@Injectable(as: Widget)
@Named(Routes.addLocation)
class AddLocationPage extends StatefulWidget {
  const AddLocationPage() : super(key: null);

  @override
  State createState() => _AddLocationState();
}

class _AddLocationState extends BaseState<AddLocationPage, AddLocationBloc> {
  late final debouncer = Debouncer(milliseconds: 2000);

  @override
  void dispose() {
    debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar.simplePrimary(
          context,
          title: 'Add Location',
        ),
        body: Container(
          margin: Dimens.locationSearch(context).margin,
          padding: Dimens.locationSearch(context).padding,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              gradient: CommonGradient.primary),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Palette.lightBackground1,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  onChanged: (s) {
                    if (s.trim().isEmpty) return;
                    debouncer.run(() {
                      bloc.search(s.trim());
                    });
                  },
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: Palette.textLight),
                  decoration: InputDecoration(
                    hintText: 'Search Location',
                    prefixIcon: const Icon(Icons.search),
                    contentPadding: const EdgeInsets.all(2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Palette.primary, width: 2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              StreamBuilder<List<Location>?>(
                  stream: bloc.locationStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final location = snapshot.data![index];
                          return FutureBuilder<List<Placemark>>(
                            future: placemarkFromCoordinates(
                                location.latitude, location.longitude),
                            builder: (context, snapshot) => LocationItemWidget(
                              locations: snapshot.data,
                              onTap: () {
                                if (snapshot.hasData) {
                                  bloc
                                      .save(MyLocationEntity(
                                          location: location,
                                          placemark: snapshot.data!.first))
                                      .then((value) {
                                    if (value) {
                                      Navigator.of(context).pop();
                                    }
                                  });
                                }
                              },
                            ),
                          );
                        },
                      ).expand();
                    }
                    return const SizedBox();
                  }),
            ],
          ),
        ));
  }
}
