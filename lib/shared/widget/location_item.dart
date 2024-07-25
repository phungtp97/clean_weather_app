import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:josh_weather/feature/domain/domain.dart';
import 'package:josh_weather/shared/shared.dart';

class LocationItemWidget extends StatelessWidget {
  final Iterable<Placemark>? locations;
  final VoidCallback onTap;

  final VoidCallback? onDelete;

  const LocationItemWidget(
      {super.key, required this.locations, required this.onTap, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Palette.lightBackground1,
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.hardEdge,
        margin: Dimens.locationSearch(context).itemMargin,
        child: Dismissible(
          key: UniqueKey(),
          dismissThresholds: const {DismissDirection.endToStart: 0.5},
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              onDelete?.call();
            }
          },
          background: Container(
            color: Colors.red,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.delete, color: Colors.white),
                SizedBox(width: 16),
              ],
            ),
          ),
          direction: onDelete != null
              ? DismissDirection.endToStart
              : DismissDirection.none,
          child: ListTile(
              title: locations != null
                  ? '${locations!.first.country}'.text(
                      style: context.textTheme.bodyMedium
                          ?.copyWith(color: Palette.textLight))
                  : Center(
                      child: const CircularProgressIndicator().square(24),
                    ),
              subtitle:
                  '${(locations?.first.subAdministrativeArea ?? locations?.first.subLocality ?? '')} ${(locations?.first.administrativeArea ?? locations?.first.country ?? '')} ${(locations?.first.locality ?? locations?.first.country ?? '')}'
                      .trim()
                      .text(
                          style: context.textTheme.bodySmall
                              ?.copyWith(color: Palette.textLight)),
              trailing: '${locations?.first.isoCountryCode}'.text(
                  style: context.textTheme.bodySmall
                      ?.copyWith(color: Palette.textLight)),
              onTap: onTap),
        ));
  }
}
