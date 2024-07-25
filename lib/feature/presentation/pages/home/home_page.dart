import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:josh_weather/shared/widget/common_bottom_sheet.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../../feature/application/blocs/home/home_bloc.dart';
import '../../../../feature/domain/domain.dart';
import '../../../../feature/presentation/pages/home/components/daily_forecast.dart';
import '../../../../core/core.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/shared.dart';
import 'components/day_title.dart';
import 'components/forecast_item.dart';
import 'components/main_weather.dart';

@Injectable(as: Widget)
@Named(Routes.home)
class HomePage extends StatefulWidget {
  const HomePage() : super(key: null);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeBloc> {
  late final slideDelta =
      useNotifier<double>(key: 'slideDelta', initialValue: 0.0);

  PanelController panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: StreamBuilder<List<MyLocationEntity>?>(
            stream: bloc.locationsStream,
            builder: (context, locationSn) {
              if (!locationSn.hasData) {
                return const CircularProgressIndicator().center();
              }
              if (locationSn.data!.isEmpty) {
                return Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routes.addLocation);
                        },
                        child: 'Add location'
                            .text(style: context.textTheme.bodyMedium)));
              }
              return SlidingUpPanel(
                  minHeight: Dimens.home(context).hourlyForecastHeight +
                      Dimens.home(context).footerHeight,
                  maxHeight: 338,
                  controller: panelController,
                  panelSnapping: true,
                  footer: ValueListenableBuilder(
                      valueListenable: slideDelta,
                      builder: (context, slideDelta, _) {
                        return Transform.translate(
                          offset: Offset.lerp(
                              Offset.zero,
                              Offset(0, Dimens.home(context).footerHeight),
                              slideDelta.clamp(0, 1.0))!,
                          child: GestureDetector(
                            onTap: () {
                              panelController.open();
                            },
                            child: Container(
                              height: Dimens.home(context).footerHeight,
                              width: context.maxWidth,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 4,
                                    offset: const Offset(0, -2),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  'Forecast for 5 days'.text(
                                      style: context.textTheme.labelMedium
                                          ?.copyWith(color: Palette.primary)),
                                  Assets.svg.icDownDouble
                                      .svg(
                                          colorFilter: const ColorFilter.mode(
                                              Palette.primary, BlendMode.srcIn),
                                          width: 20,
                                          height: 20)
                                      .paddingOnly(left: 8)
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                  onPanelSlide: (double pos) {
                    slideDelta.value = pos;
                  },
                  body: LayoutBuilder(builder: (context, cs) {
                    return Column(
                      children: [
                        StreamBuilder<WeatherEntity?>(
                            stream: bloc.weatherStream,
                            builder: (context, snapshot) {
                              return snapshot.data != null
                                  ? buildMainBody(
                                      snapshot.data!, cs, locationSn.data!)
                                  : const CircularProgressIndicator().center();
                            }),
                        const Spacer(),
                        SizedBox(
                          height: Dimens.home(context).hourlyForecastHeight,
                        )
                      ],
                    );
                  }),
                  panel: Column(
                    children: [
                      StreamBuilder<WeatherEntity?>(
                          stream: bloc.weatherStream,
                          builder: (context, snapshot) {
                            return ValueListenableBuilder(
                                valueListenable: slideDelta,
                                builder: (context, slideDelta, _) {
                                  //if(!snapshot.hasData) return const SizedBox();
                                  return SizedBox(
                                    height: Dimens.home(context)
                                            .hourlyForecastHeight *
                                        (1 - slideDelta.clamp(0.0, 0.3)),
                                    child: SingleChildScrollView(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      child: SizedBox(
                                        height: Dimens.home(context)
                                            .hourlyForecastHeight,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            StreamBuilder<WeatherEntity?>(
                                                stream: bloc.weatherStream,
                                                builder: (context, snapshot) {
                                                  return snapshot.data != null
                                                      ? DayTitleWidget(
                                                          weather:
                                                              snapshot.data!)
                                                      : const SizedBox.shrink();
                                                }),
                                            StreamBuilder<List<WeatherEntity>?>(
                                                stream:
                                                    bloc.dailyForecastStream,
                                                builder: (context, snapshot) {
                                                  return snapshot.data != null
                                                      ? DailyForecastWidget(
                                                          weathers:
                                                              snapshot.data!)
                                                      : const SizedBox.shrink();
                                                }),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          }),
                      CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Container(
                                    color: Palette.primary,
                                    padding: const EdgeInsets.all(8),
                                    child: 'Forecast for 5 days'
                                        .text(
                                            style: context.textTheme.labelSmall)
                                        .align(Alignment.centerLeft))
                                .paddingOnly(top: 10),
                          ),
                          StreamBuilder<List<WeatherEntity>?>(
                              stream: bloc.fiveDaysForecastStream,
                              builder: (context, snapshot) {
                                return snapshot.data != null
                                    ? SliverList(
                                        delegate: SliverChildBuilderDelegate(
                                        (context, index) {
                                          final weather = snapshot.data![index];
                                          return ForecastItemWidget(
                                              weather: weather);
                                        },
                                        childCount: snapshot.data!.length,
                                      ))
                                    : const SliverToBoxAdapter();
                              })
                        ],
                      ).expand()
                    ],
                  ));
            }),
      ),
    );
  }

  Widget buildMainBody(WeatherEntity? weather, BoxConstraints cs,
      List<MyLocationEntity> locations) {
    print(
        'locations - ${locations.length} - ${bloc.state.locations?.length}, ${bloc.hashCode}');
    return ValueListenableBuilder(
        valueListenable: slideDelta,
        builder: (context, pos, _) {
          return SizedBox(
              height: cs.maxHeight -
                  Dimens.home(context).footerHeight -
                  Dimens.home(context).hourlyForecastHeight -
                  44,
              child: Stack(
                children: [
                  weather == null
                      ? const CircularProgressIndicator().square(44).center()
                      : Positioned.fill(
                          child: MainWeatherWidget(
                            weather: weather,
                            onAdd: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.addLocation);
                            },
                            onSetting: () {},
                            slideDelta: pos,
                            height: cs.maxHeight -
                                Dimens.home(context).footerHeight -
                                Dimens.home(context).hourlyForecastHeight -
                                44,
                            onChangeLocation: () {
                              showPrimaryBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Column(
                                    children: [
                                      'Select location'
                                          .text(
                                              style:
                                                  context.textTheme.labelMedium)
                                          .paddingOnly(top: 16),
                                      ListView.builder(
                                        itemCount: locations.length,
                                        itemBuilder: (context, index) {
                                          final location = locations[index];
                                          return LocationItemWidget(
                                              onDelete: locations.length > 1
                                                  ? () {
                                                      bloc.removeLocation(
                                                          location);
                                                      Navigator.of(context)
                                                          .pop();
                                                    }
                                                  : null,
                                              locations: [location.placemark],
                                              onTap: () {
                                                bloc.selectPlace(location);
                                                Navigator.of(context).pop();
                                              });
                                        },
                                      ).expand(),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                ],
              ));
        });
  }
}
