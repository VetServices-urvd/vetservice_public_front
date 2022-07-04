import 'package:flutter/cupertino.dart';

/**
 * Navigation route
 */
 enum ViewType{
//   AUTHENTIFCATION,
//   INSCRIPTION_USR,
//   MODIFCATION_USR,
//   HOME_USR
  AUTHENTIFCATION(endpoint: '/authentification', hasMenus:false),
  INSCRIPTION_USR(endpoint: '/inscription', hasMenus:false),
  MODIFCATION_USR(endpoint: '/reset/mdp', hasMenus:false),
  HOME_USR(endpoint:'/home', hasMenus:true),
  MARKETPLACE(endpoint: '/marketplace', hasMenus:true);

  const ViewType({required this.endpoint,required this.hasMenus});
  final String endpoint;
  final bool hasMenus;
}
/**
 * Menus
 */

/**
 * local & session storage
 */

enum SharedKey {
 USER_AUTH, CURRENT_MENU;
}