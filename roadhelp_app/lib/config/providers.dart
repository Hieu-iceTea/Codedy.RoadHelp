import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:roadhelp/providers/auth_provider.dart';

import '/providers/authority_provider.dart';
import '/providers/district_provider.dart';
import '/providers/garage_image_provider.dart';
import '/providers/garage_provider.dart';
import '/providers/issue_provider.dart';
import '/providers/province_provider.dart';
import '/providers/rating_garage_provider.dart';
import '/providers/rating_issue_provider.dart';
import '/providers/user_provider.dart';
import '/providers/ward_provider.dart';

// We use name route
// All our routes will be available here
final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => AuthProvider(),
  ),
  ChangeNotifierProxyProvider<AuthProvider, AuthorityProvider>(
    create: (ctx) => AuthorityProvider(null, []),
    update: (ctx, authProvider, previousData) => AuthorityProvider(
      authProvider,
      previousData != null ? previousData.items : [],
    ),
  ),
  ChangeNotifierProxyProvider<AuthProvider, DistrictProvider>(
    create: (ctx) => DistrictProvider(null, []),
    update: (ctx, authProvider, previousData) => DistrictProvider(
      authProvider,
      previousData != null ? previousData.items : [],
    ),
  ),
  ChangeNotifierProxyProvider<AuthProvider, GarageImageProvider>(
    create: (ctx) => GarageImageProvider(null, []),
    update: (ctx, authProvider, previousData) => GarageImageProvider(
      authProvider,
      previousData != null ? previousData.items : [],
    ),
  ),
  ChangeNotifierProxyProvider<AuthProvider, GarageProvider>(
    create: (ctx) => GarageProvider(null, []),
    update: (ctx, authProvider, previousData) => GarageProvider(
      authProvider,
      previousData != null ? previousData.items : [],
    ),
  ),
  ChangeNotifierProxyProvider<AuthProvider, IssueProvider>(
    create: (ctx) => IssueProvider(null, []),
    update: (ctx, authProvider, previousData) => IssueProvider(
      authProvider,
      previousData != null ? previousData.items : [],
    ),
  ),
  ChangeNotifierProxyProvider<AuthProvider, ProvinceProvider>(
    create: (ctx) => ProvinceProvider(null, []),
    update: (ctx, authProvider, previousData) => ProvinceProvider(
      authProvider,
      previousData != null ? previousData.items : [],
    ),
  ),
  ChangeNotifierProxyProvider<AuthProvider, RatingGarageProvider>(
    create: (ctx) => RatingGarageProvider(null, []),
    update: (ctx, authProvider, previousData) => RatingGarageProvider(
      authProvider,
      previousData != null ? previousData.items : [],
    ),
  ),
  ChangeNotifierProxyProvider<AuthProvider, RatingIssueProvider>(
    create: (ctx) => RatingIssueProvider(null, []),
    update: (ctx, authProvider, previousData) => RatingIssueProvider(
      authProvider,
      previousData != null ? previousData.items : [],
    ),
  ),
  ChangeNotifierProxyProvider<AuthProvider, UserProvider>(
    create: (ctx) => UserProvider(null, []),
    update: (ctx, authProvider, previousData) => UserProvider(
      authProvider,
      previousData != null ? previousData.items : [],
    ),
  ),
  ChangeNotifierProxyProvider<AuthProvider, WardProvider>(
    create: (ctx) => WardProvider(null, []),
    update: (ctx, authProvider, previousData) => WardProvider(
      authProvider,
      previousData != null ? previousData.items : [],
    ),
  ),
];
