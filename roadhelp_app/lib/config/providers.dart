import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:roadhelp/providers/auth_provider.dart';

import '/providers/authority_provider.dart';
import '/providers/district_provider.dart';
import '/providers/garage_image_provider.dart';
import '/providers/garage_provider.dart';
import '/providers/issues_provider.dart';
import '/providers/province_provider.dart';
import '/providers/rating_garage_provider.dart';
import '/providers/rating_issues_provider.dart';
import '/providers/user_provider.dart';
import '/providers/ward_provider.dart';

// We use name route
// All our routes will be available here
final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => AuthProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => AuthorityProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => DistrictProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => GarageImageProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => GarageProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => IssuesProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => ProvinceProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => RatingGarageProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => RatingIssuesProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => UserProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => WardProvider(),
  ),
];
