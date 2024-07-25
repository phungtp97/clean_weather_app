import 'dart:math';

import 'package:flutter/material.dart';
import 'package:josh_weather/shared/widget/common_gradient.dart';
import 'package:lottie/lottie.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../shared/shared.dart';
import '../../../../domain/domain.dart';
import 'dart:ui' as ui;

class MainWeatherWidget extends StatefulWidget {
  final WeatherEntity weather;

  final VoidCallback onAdd;

  final VoidCallback onChangeLocation;
  final VoidCallback onSetting;

  final double slideDelta;

  final double height;

  const MainWeatherWidget(
      {super.key,
      required this.weather,
      required this.onAdd,
      required this.onSetting,
      required this.onChangeLocation,
      required this.slideDelta,
      required this.height});

  @override
  State<MainWeatherWidget> createState() => _MainWeatherWidgetState();
}

class _MainWeatherWidgetState extends State<MainWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: Dimens.home(context).mainWeatherMargin,
        padding: Dimens.home(context).mainWeatherPadding,
        height: widget.height - (widget.slideDelta * 150),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            gradient: CommonGradient.primary),
        child: Column(
          children: [
            Row(
              children: [
                Assets.svg.icAdd
                    .svg(
                        width: 24,
                        height: 24,
                        colorFilter: const ui.ColorFilter.mode(
                            Colors.white, ui.BlendMode.srcIn))
                    .center()
                    .square(40)
                    .inkTap(onTap: widget.onAdd),
                Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        child: Material(
                            borderRadius: BorderRadius.circular(20),
                            clipBehavior: Clip.hardEdge,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                (widget.weather.name ?? '')
                                    .text(
                                        style: context.textTheme.bodyLarge
                                            ?.copyWith(color: Palette.primary))
                                    .paddingOnly(left: 10),
                                Assets.svg.icChange
                                    .svg(
                                        width: 14,
                                        height: 14,
                                        colorFilter: const ui.ColorFilter.mode(
                                            Palette.primary,
                                            ui.BlendMode.srcIn))
                                    .center()
                                    .square(30)
                              ],
                            ).inkTap(onTap: widget.onChangeLocation)))
                    .center()
                    .expand(),
                Assets.svg.icMoreVert
                    .svg(
                        width: 24,
                        height: 24,
                        colorFilter: const ui.ColorFilter.mode(
                            Colors.white, ui.BlendMode.srcIn))
                    .center()
                    .square(40)
                    .inkTap(onTap: widget.onSetting),
              ],
            ),
            buildMainContent(),
            const Divider(
              color: Colors.white,
            ).margin(10, 10, 0, 0),
            SizedBox(
              height: 44,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Assets.svg.icWind.svg(
                        width: 24,
                        height: 24,
                        colorFilter: const ui.ColorFilter.mode(
                            Colors.white, ui.BlendMode.srcIn),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      '${widget.weather.wind?.speed} m/s\nWind'
                          .text(style: context.textTheme.bodySmall)
                    ],
                  ).paddingOnly(left: 20).expand(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Assets.svg.icRain.svg(
                        width: 24,
                        height: 24,
                        colorFilter: const ui.ColorFilter.mode(
                            Colors.white, ui.BlendMode.srcIn),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      '${widget.weather.rain?.h1 ?? 0.0} mm\nRain volume'
                          .text(style: context.textTheme.bodySmall)
                    ],
                  ).paddingOnly(left: 20).expand(),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Assets.svg.icPressure.svg(
                        width: 24,
                        height: 24,
                        colorFilter: const ui.ColorFilter.mode(
                            Colors.white, ui.BlendMode.srcIn),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      '${widget.weather.main.pressure} mbar\nPressure'
                          .text(style: context.textTheme.bodySmall)
                    ],
                  ).paddingOnly(left: 20).expand(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Assets.svg.icHumidity.svg(
                        width: 24,
                        height: 24,
                        colorFilter: const ui.ColorFilter.mode(
                            Colors.white, ui.BlendMode.srcIn),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      '${widget.weather.main.humidity} %\nHumidity'
                          .text(style: context.textTheme.bodySmall)
                    ],
                  ).paddingOnly(left: 20).expand(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMainContent() {
    return LayoutBuilder(builder: (context, cs) {
      //slideDelta drives the alignment make it from vertical to horizontal from 0..1
      return Stack(
        children: [
          Align(
              alignment: Alignment.lerp(Alignment.topCenter,
                  Alignment.centerLeft, widget.slideDelta.clamp(0.01, 1.0))!,
              child: SizedBox(
                  height: cs.maxHeight * widget.slideDelta.clamp(0.5, 1.0),
                  width: cs.maxHeight * widget.slideDelta.clamp(0.5, 1.0),
                  child: LottieWeatherWidget(weather: widget.weather))),
          Align(
            alignment: Alignment.lerp(Alignment.bottomCenter,
                Alignment.centerRight, widget.slideDelta.clamp(0.0, 1.0))!,
            child: Container(
              color: Colors.transparent,
              height: cs.maxHeight * widget.slideDelta.clamp(0.55, 1.0),
              width: cs.maxHeight * widget.slideDelta.clamp(0.55, 1.0),
              child: Transform.scale(
                scale: 1 - (0.3 * widget.slideDelta.clamp(0.0, 1.0)),
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.weather.description
                        .capitalize()
                        .text(style: context.textTheme.labelSmall)
                        .paddingOnly(bottom: 8),
                    '${CommonUtil.kelvinToCelcius(widget.weather.main.temp.toDouble(), fractionDigits: 0)}°'
                        .text(
                            style: context.textTheme.displayLarge
                                ?.copyWith(height: 1)),
                    'Feels like ${CommonUtil.kelvinToCelcius(widget.weather.main.feelsLike.toDouble())}'
                        .text(
                            style:
                                context.textTheme.labelSmall?.copyWith(height: 1))
                        .center(),
                  ],
                ),
              ),
            ),
          )
        ],
      );
    }).expand();
  }
}

class LottieWeatherWidget extends StatelessWidget {
  final WeatherEntity weather;

  const LottieWeatherWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cs) {
      double maxSize = min(cs.maxWidth, cs.maxHeight);
      return Stack(
        children: [
          if (weather.sys != null)
            Padding(
              padding: EdgeInsets.all(maxSize * 0.1),
              child: buildMoonOrSun(weather.sys!, maxSize * 0.6),
            ),
          (weather.rain != null &&
                  (weather.rain?.h1 ?? weather.rain?.h3 ?? 0) > 0)
              ? Positioned(
                  top: maxSize * 0.2,
                  left: 0,
                  right: 0,
                  child: LottieBuilder.asset(Assets.lottie.rain,
                      width: maxSize, height: maxSize),
                )
              : SizedBox(width: maxSize, height: maxSize),
          Positioned.fill(
            child: LottieBuilder.asset(Assets.lottie.cloud,
                    width: maxSize * 0.9, height: maxSize * 0.9)
                .align(Alignment.bottomCenter),
          ),
          if (weather.id >= 500 && weather.id < 600)
            Positioned.fill(
              child: Center(
                child: LottieBuilder.asset(Assets.lottie.thunder,
                    width: maxSize / 3, height: maxSize / 3),
              ),
            ),
        ],
      );
    });
  }

  Widget buildMoonOrSun(SysEntity sys, double size) {
    int now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    if (sys.sunrise == null || sys.sunset == null) {
      return const SizedBox.shrink();
    }
    if (sys.sunrise! < now && sys.sunset! > now) {
      return LottieBuilder.asset(
        Assets.lottie.sun,
        width: size,
        height: size,
      );
    } else {
      return LottieBuilder.asset(
        Assets.lottie.moon,
        width: size,
        height: size,
      );
    }
  }
}
