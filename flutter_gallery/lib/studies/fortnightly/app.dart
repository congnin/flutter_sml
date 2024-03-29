// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:flutter_gallery/data/gallery_options.dart';
import 'package:flutter_gallery/layout/adaptive.dart';
import 'package:flutter_gallery/layout/image_placeholder.dart';
import 'package:flutter_gallery/layout/text_scale.dart';
import 'package:flutter_gallery/l10n/gallery_localizations.dart';
import 'package:flutter_gallery/studies/fortnightly/shared.dart';

const _fortnightlyTitle = 'Fortnightly';

class FortnightlyApp extends StatelessWidget {
  const FortnightlyApp();

  static const String defaultRoute = '/fortnightly';

  @override
  Widget build(BuildContext context) {
    final home = isDisplayDesktop(context)
        ? const _FortnightlyHomeDesktop()
        : const _FortnightlyHomeMobile();
    return MaterialApp(
      title: _fortnightlyTitle,
      debugShowCheckedModeBanner: false,
      theme: buildTheme(context).copyWith(
        platform: GalleryOptions.of(context).platform,
      ),
      home: ApplyTextOptions(child: home),
      routes: {
        FortnightlyApp.defaultRoute: (context) => ApplyTextOptions(child: home),
      },
      initialRoute: FortnightlyApp.defaultRoute,
      // L10n settings.
      localizationsDelegates: GalleryLocalizations.localizationsDelegates,
      supportedLocales: GalleryLocalizations.supportedLocales,
      locale: GalleryOptions.of(context).locale,
    );
  }
}

class _FortnightlyHomeMobile extends StatelessWidget {
  const _FortnightlyHomeMobile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: NavigationMenu(isCloseable: true),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Semantics(
          label: _fortnightlyTitle,
          child: const FadeInImagePlaceholder(
            image: AssetImage(
              'fortnightly/fortnightly_title.png',
              package: 'flutter_gallery_assets',
            ),
            placeholder: SizedBox.shrink(),
            excludeFromSemantics: true,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: GalleryLocalizations.of(context).shrineTooltipSearch,
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            HashtagBar(),
            for (final item in buildArticlePreviewItems(context))
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: item,
              ),
          ],
        ),
      ),
    );
  }
}

class _FortnightlyHomeDesktop extends StatelessWidget {
  const _FortnightlyHomeDesktop();

  @override
  Widget build(BuildContext context) {
    final menuWidth = 200.0;
    final spacer = const SizedBox(width: 20);
    final headerHeight = 40 * reducedTextScale(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: headerHeight,
              child: Row(
                children: [
                  Container(
                    width: menuWidth,
                    alignment: AlignmentDirectional.centerStart,
                    margin: const EdgeInsets.only(left: 12),
                    child: Semantics(
                      label: _fortnightlyTitle,
                      child: Image.asset(
                        'fortnightly/fortnightly_title.png',
                        package: 'flutter_gallery_assets',
                        excludeFromSemantics: true,
                      ),
                    ),
                  ),
                  spacer,
                  Flexible(
                    flex: 2,
                    child: HashtagBar(),
                  ),
                  spacer,
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      alignment: AlignmentDirectional.centerEnd,
                      child: IconButton(
                        icon: const Icon(Icons.search),
                        tooltip: GalleryLocalizations.of(context)
                            .shrineTooltipSearch,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  SizedBox(
                    width: menuWidth,
                    child: NavigationMenu(),
                  ),
                  spacer,
                  Flexible(
                    flex: 2,
                    child: ListView(
                      children: buildArticlePreviewItems(context),
                    ),
                  ),
                  spacer,
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: ListView(
                      children: [
                        ...buildStockItems(context),
                        const SizedBox(height: 32),
                        ...buildVideoPreviewItems(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
