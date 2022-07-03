import 'package:flutter/cupertino.dart';

/**
 * Navigation
 */
 enum ViewType{
//   AUTHENTIFCATION,
//   INSCRIPTION_USR,
//   MODIFCATION_USR,
//   HOME_USR
  AUTHENTIFCATION(endpoint: '/authentification'),
  INSCRIPTION_USR(endpoint: '/inscription'),
  MODIFCATION_USR(endpoint: '/mofification'),
  HOME_USR(endpoint:'/home');

  const ViewType({required this.endpoint});
  final String endpoint;
}
