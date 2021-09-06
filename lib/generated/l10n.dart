// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get hm_title {
    return Intl.message(
      'Home',
      name: 'hm_title',
      desc: '',
      args: [],
    );
  }

  /// `Distributed storage devices`
  String get hm_title1 {
    return Intl.message(
      'Distributed storage devices',
      name: 'hm_title1',
      desc: '',
      args: [],
    );
  }

  /// `Cloud`
  String get hm_tab1 {
    return Intl.message(
      'Cloud',
      name: 'hm_tab1',
      desc: '',
      args: [],
    );
  }

  /// `Exclusive`
  String get hm_tab2 {
    return Intl.message(
      'Exclusive',
      name: 'hm_tab2',
      desc: '',
      args: [],
    );
  }

  /// `Union`
  String get hm_tab3 {
    return Intl.message(
      'Union',
      name: 'hm_tab3',
      desc: '',
      args: [],
    );
  }

  /// `Specifications`
  String get hm_detail_tab1 {
    return Intl.message(
      'Specifications',
      name: 'hm_detail_tab1',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get hm_detail_tab2 {
    return Intl.message(
      'Details',
      name: 'hm_detail_tab2',
      desc: '',
      args: [],
    );
  }

  /// `Risk alert`
  String get hm_detail_tab3 {
    return Intl.message(
      'Risk alert',
      name: 'hm_detail_tab3',
      desc: '',
      args: [],
    );
  }

  /// `Remaining copies`
  String get hm_item_syfs {
    return Intl.message(
      'Remaining copies',
      name: 'hm_item_syfs',
      desc: '',
      args: [],
    );
  }

  /// `Product price`
  String get hm_item_cpsj {
    return Intl.message(
      'Product price',
      name: 'hm_item_cpsj',
      desc: '',
      args: [],
    );
  }

  /// `Product cycle`
  String get hm_item_cpzq {
    return Intl.message(
      'Product cycle',
      name: 'hm_item_cpzq',
      desc: '',
      args: [],
    );
  }

  /// `Delivery period`
  String get hm_item_jfq {
    return Intl.message(
      'Delivery period',
      name: 'hm_item_jfq',
      desc: '',
      args: [],
    );
  }

  /// `To buy`
  String get hm_item_qgm {
    return Intl.message(
      'To buy',
      name: 'hm_item_qgm',
      desc: '',
      args: [],
    );
  }

  /// `Service cycle`
  String get hm_tab1_fwzq {
    return Intl.message(
      'Service cycle',
      name: 'hm_tab1_fwzq',
      desc: '',
      args: [],
    );
  }

  /// `surplus：`
  String get hm_tab1_sy {
    return Intl.message(
      'surplus：',
      name: 'hm_tab1_sy',
      desc: '',
      args: [],
    );
  }

  /// `Unit Price：`
  String get hm_tab1_dj {
    return Intl.message(
      'Unit Price：',
      name: 'hm_tab1_dj',
      desc: '',
      args: [],
    );
  }

  /// `Longest period`
  String get hm_tab1_zczq {
    return Intl.message(
      'Longest period',
      name: 'hm_tab1_zczq',
      desc: '',
      args: [],
    );
  }

  /// `Output rule`
  String get hm_tab_ccgz {
    return Intl.message(
      'Output rule',
      name: 'hm_tab_ccgz',
      desc: '',
      args: [],
    );
  }

  /// `Purchase day`
  String get hm_tab_gmr {
    return Intl.message(
      'Purchase day',
      name: 'hm_tab_gmr',
      desc: '',
      args: [],
    );
  }

  /// `Launch time`
  String get hm_tab_sjsj {
    return Intl.message(
      'Launch time',
      name: 'hm_tab_sjsj',
      desc: '',
      args: [],
    );
  }

  /// `Product details`
  String get hm_tab3_title {
    return Intl.message(
      'Product details',
      name: 'hm_tab3_title',
      desc: '',
      args: [],
    );
  }

  /// `First service cycle`
  String get hm_tab3_scfuzq {
    return Intl.message(
      'First service cycle',
      name: 'hm_tab3_scfuzq',
      desc: '',
      args: [],
    );
  }

  /// `Expected daily output`
  String get hm_tab3_yjccr {
    return Intl.message(
      'Expected daily output',
      name: 'hm_tab3_yjccr',
      desc: '',
      args: [],
    );
  }

  /// `Please refer to 24h average calculation output of main network`
  String get hm_tab3_yjccr_text {
    return Intl.message(
      'Please refer to 24h average calculation output of main network',
      name: 'hm_tab3_yjccr_text',
      desc: '',
      args: [],
    );
  }

  /// `Equipment model`
  String get hm_bg_sbxh {
    return Intl.message(
      'Equipment model',
      name: 'hm_bg_sbxh',
      desc: '',
      args: [],
    );
  }

  /// `Output currency`
  String get hm_bg_ccb {
    return Intl.message(
      'Output currency',
      name: 'hm_bg_ccb',
      desc: '',
      args: [],
    );
  }

  /// `Rated space`
  String get hm_bg_edkj {
    return Intl.message(
      'Rated space',
      name: 'hm_bg_edkj',
      desc: '',
      args: [],
    );
  }

  /// `Valid space`
  String get hm_bg_yxkj {
    return Intl.message(
      'Valid space',
      name: 'hm_bg_yxkj',
      desc: '',
      args: [],
    );
  }

  /// `Filling period`
  String get hm_bg_tmq {
    return Intl.message(
      'Filling period',
      name: 'hm_bg_tmq',
      desc: '',
      args: [],
    );
  }

  /// `Service charge`
  String get hm_bg_jsfuf {
    return Intl.message(
      'Service charge',
      name: 'hm_bg_jsfuf',
      desc: '',
      args: [],
    );
  }

  /// `Lease cycle`
  String get hm_bg_zlzq {
    return Intl.message(
      'Lease cycle',
      name: 'hm_bg_zlzq',
      desc: '',
      args: [],
    );
  }

  /// `Note! `
  String get hm_bg_zysx {
    return Intl.message(
      'Note! ',
      name: 'hm_bg_zysx',
      desc: '',
      args: [],
    );
  }

  /// `The actual arrival of the equipment during the term of the contract will be in accordance with the official output and release rules.`
  String get hm_bg_zysx_text {
    return Intl.message(
      'The actual arrival of the equipment during the term of the contract will be in accordance with the official output and release rules.',
      name: 'hm_bg_zysx_text',
      desc: '',
      args: [],
    );
  }

  /// `Message center`
  String get mc_tile {
    return Intl.message(
      'Message center',
      name: 'mc_tile',
      desc: '',
      args: [],
    );
  }

  /// `All read`
  String get mc_action {
    return Intl.message(
      'All read',
      name: 'mc_action',
      desc: '',
      args: [],
    );
  }

  /// `Platform announcement`
  String get mc_ptgg {
    return Intl.message(
      'Platform announcement',
      name: 'mc_ptgg',
      desc: '',
      args: [],
    );
  }

  /// `No platform announcement`
  String get mc_ptgg_empty {
    return Intl.message(
      'No platform announcement',
      name: 'mc_ptgg_empty',
      desc: '',
      args: [],
    );
  }

  /// `Order notification`
  String get mc_ddtz {
    return Intl.message(
      'Order notification',
      name: 'mc_ddtz',
      desc: '',
      args: [],
    );
  }

  /// `No order notice`
  String get mc_ddtz_empty {
    return Intl.message(
      'No order notice',
      name: 'mc_ddtz_empty',
      desc: '',
      args: [],
    );
  }

  /// `You have an order to pay`
  String get mc_dd_dzf {
    return Intl.message(
      'You have an order to pay',
      name: 'mc_dd_dzf',
      desc: '',
      args: [],
    );
  }

  /// `Order number：`
  String get mc_dd_ddh {
    return Intl.message(
      'Order number：',
      name: 'mc_dd_ddh',
      desc: '',
      args: [],
    );
  }

  /// `Order time：`
  String get mc_dd_xdsj {
    return Intl.message(
      'Order time：',
      name: 'mc_dd_xdsj',
      desc: '',
      args: [],
    );
  }

  /// `Click to view`
  String get mc_dd_djck {
    return Intl.message(
      'Click to view',
      name: 'mc_dd_djck',
      desc: '',
      args: [],
    );
  }

  /// `Mine`
  String get mi_title {
    return Intl.message(
      'Mine',
      name: 'mi_title',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get mi_ye {
    return Intl.message(
      'Balance',
      name: 'mi_ye',
      desc: '',
      args: [],
    );
  }

  /// `Invite rewards`
  String get mi_yqjl {
    return Intl.message(
      'Invite rewards',
      name: 'mi_yqjl',
      desc: '',
      args: [],
    );
  }

  /// `Output income`
  String get mi_ccsy {
    return Intl.message(
      'Output income',
      name: 'mi_ccsy',
      desc: '',
      args: [],
    );
  }

  /// `My order`
  String get mi_wddd {
    return Intl.message(
      'My order',
      name: 'mi_wddd',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal`
  String get mi_tx {
    return Intl.message(
      'Withdrawal',
      name: 'mi_tx',
      desc: '',
      args: [],
    );
  }

  /// `Recharge`
  String get mi_cz {
    return Intl.message(
      'Recharge',
      name: 'mi_cz',
      desc: '',
      args: [],
    );
  }

  /// `Invite friends`
  String get mi_yqhy {
    return Intl.message(
      'Invite friends',
      name: 'mi_yqhy',
      desc: '',
      args: [],
    );
  }

  /// `Identity authentication`
  String get mi_sfrz {
    return Intl.message(
      'Identity authentication',
      name: 'mi_sfrz',
      desc: '',
      args: [],
    );
  }

  /// `Account security`
  String get mi_zhaq {
    return Intl.message(
      'Account security',
      name: 'mi_zhaq',
      desc: '',
      args: [],
    );
  }

  /// `Contact customer service`
  String get mi_lxkf {
    return Intl.message(
      'Contact customer service',
      name: 'mi_lxkf',
      desc: '',
      args: [],
    );
  }

  /// `Version update`
  String get mi_bbgx {
    return Intl.message(
      'Version update',
      name: 'mi_bbgx',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get mi_gywm {
    return Intl.message(
      'About us',
      name: 'mi_gywm',
      desc: '',
      args: [],
    );
  }

  /// `Language switching`
  String get mi_yyqh {
    return Intl.message(
      'Language switching',
      name: 'mi_yyqh',
      desc: '',
      args: [],
    );
  }

  /// `Service agreement and privacy policy`
  String get mi_xizc {
    return Intl.message(
      'Service agreement and privacy policy',
      name: 'mi_xizc',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get mi_tudl {
    return Intl.message(
      'Log out',
      name: 'mi_tudl',
      desc: '',
      args: [],
    );
  }

  /// `There's a mine at home. Come and dig it together`
  String get fr_text1 {
    return Intl.message(
      'There\'s a mine at home. Come and dig it together',
      name: 'fr_text1',
      desc: '',
      args: [],
    );
  }

  /// `Join bitx cloud storage mining becomes very simple`
  String get fr_text2 {
    return Intl.message(
      'Join bitx cloud storage mining becomes very simple',
      name: 'fr_text2',
      desc: '',
      args: [],
    );
  }

  /// `Invitation code`
  String get fr_yqm {
    return Intl.message(
      'Invitation code',
      name: 'fr_yqm',
      desc: '',
      args: [],
    );
  }

  /// `Invited`
  String get fr_yljyq {
    return Intl.message(
      'Invited',
      name: 'fr_yljyq',
      desc: '',
      args: [],
    );
  }

  /// `Registration time`
  String get fr_zcsj {
    return Intl.message(
      'Registration time',
      name: 'fr_zcsj',
      desc: '',
      args: [],
    );
  }

  /// `Friend mobile number`
  String get fr_hysjh {
    return Intl.message(
      'Friend mobile number',
      name: 'fr_hysjh',
      desc: '',
      args: [],
    );
  }

  /// `Activity rules`
  String get fr_hdgz {
    return Intl.message(
      'Activity rules',
      name: 'fr_hdgz',
      desc: '',
      args: [],
    );
  }

  /// `1.When you successfully invite new users to register for bitx cloud storage through this activity page, you can get the corresponding invitation reward after each operation of new users：`
  String get fr_hdgz_text {
    return Intl.message(
      '1.When you successfully invite new users to register for bitx cloud storage through this activity page, you can get the corresponding invitation reward after each operation of new users：',
      name: 'fr_hdgz_text',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get fr_fx {
    return Intl.message(
      'Share',
      name: 'fr_fx',
      desc: '',
      args: [],
    );
  }

  /// `Cloud device orders`
  String get wddd_ysbdd {
    return Intl.message(
      'Cloud device orders',
      name: 'wddd_ysbdd',
      desc: '',
      args: [],
    );
  }

  /// `Exclusive device orders`
  String get wddd_dxsbdd {
    return Intl.message(
      'Exclusive device orders',
      name: 'wddd_dxsbdd',
      desc: '',
      args: [],
    );
  }

  /// `Joint device order`
  String get wddd_lhsbdd {
    return Intl.message(
      'Joint device order',
      name: 'wddd_lhsbdd',
      desc: '',
      args: [],
    );
  }

  /// `Holding`
  String get wddd_cyz {
    return Intl.message(
      'Holding',
      name: 'wddd_cyz',
      desc: '',
      args: [],
    );
  }

  /// `Expired`
  String get wddd_ydq {
    return Intl.message(
      'Expired',
      name: 'wddd_ydq',
      desc: '',
      args: [],
    );
  }

  /// `Number of equipment held`
  String get wddd_cysbs {
    return Intl.message(
      'Number of equipment held',
      name: 'wddd_cysbs',
      desc: '',
      args: [],
    );
  }

  /// `To be paid`
  String get wddd_dzf {
    return Intl.message(
      'To be paid',
      name: 'wddd_dzf',
      desc: '',
      args: [],
    );
  }

  /// `In force`
  String get wddd_sxz {
    return Intl.message(
      'In force',
      name: 'wddd_sxz',
      desc: '',
      args: [],
    );
  }

  /// `Expired`
  String get wddd_ygq {
    return Intl.message(
      'Expired',
      name: 'wddd_ygq',
      desc: '',
      args: [],
    );
  }

  /// `No order`
  String get wddd_empty {
    return Intl.message(
      'No order',
      name: 'wddd_empty',
      desc: '',
      args: [],
    );
  }

  /// `Order number：`
  String get wddd_ddh {
    return Intl.message(
      'Order number：',
      name: 'wddd_ddh',
      desc: '',
      args: [],
    );
  }

  /// `Order time：`
  String get wddd_xdsj {
    return Intl.message(
      'Order time：',
      name: 'wddd_xdsj',
      desc: '',
      args: [],
    );
  }

  /// `Cancel order`
  String get wddd_qxdd {
    return Intl.message(
      'Cancel order',
      name: 'wddd_qxdd',
      desc: '',
      args: [],
    );
  }

  /// `Confirm payment`
  String get wddd_qrzf {
    return Intl.message(
      'Confirm payment',
      name: 'wddd_qrzf',
      desc: '',
      args: [],
    );
  }

  /// `Cumulative output income：`
  String get wddd_ljccsy {
    return Intl.message(
      'Cumulative output income：',
      name: 'wddd_ljccsy',
      desc: '',
      args: [],
    );
  }

  /// `Trader Password`
  String get wddd_jymm {
    return Intl.message(
      'Trader Password',
      name: 'wddd_jymm',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the transaction password to complete the payment`
  String get wddd_jymm_text {
    return Intl.message(
      'Please enter the transaction password to complete the payment',
      name: 'wddd_jymm_text',
      desc: '',
      args: [],
    );
  }

  /// `Tips`
  String get dialog_title {
    return Intl.message(
      'Tips',
      name: 'dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get dialog_cancel {
    return Intl.message(
      'Cancel',
      name: 'dialog_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get dialog_confirm {
    return Intl.message(
      'Confirm',
      name: 'dialog_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Please input a password`
  String get dialog_hint {
    return Intl.message(
      'Please input a password',
      name: 'dialog_hint',
      desc: '',
      args: [],
    );
  }

  /// `Add bitx cloud storage wechat customer service`
  String get kf_text1 {
    return Intl.message(
      'Add bitx cloud storage wechat customer service',
      name: 'kf_text1',
      desc: '',
      args: [],
    );
  }

  /// `If you have any questions, please scan QR code and add wechat customer service for any time. Thank you`
  String get kf_text2 {
    return Intl.message(
      'If you have any questions, please scan QR code and add wechat customer service for any time. Thank you',
      name: 'kf_text2',
      desc: '',
      args: [],
    );
  }

  /// `copies`
  String get dw_fen {
    return Intl.message(
      'copies',
      name: 'dw_fen',
      desc: '',
      args: [],
    );
  }

  /// `days`
  String get dw_tian {
    return Intl.message(
      'days',
      name: 'dw_tian',
      desc: '',
      args: [],
    );
  }

  /// `peoples`
  String get dw_ren {
    return Intl.message(
      'peoples',
      name: 'dw_ren',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get dw_bi {
    return Intl.message(
      '',
      name: 'dw_bi',
      desc: '',
      args: [],
    );
  }

  /// `just`
  String get time_gg {
    return Intl.message(
      'just',
      name: 'time_gg',
      desc: '',
      args: [],
    );
  }

  /// `Product details`
  String get tab2_title {
    return Intl.message(
      'Product details',
      name: 'tab2_title',
      desc: '',
      args: [],
    );
  }

  /// `devices`
  String get tab2_item_cpsb {
    return Intl.message(
      'devices',
      name: 'tab2_item_cpsb',
      desc: '',
      args: [],
    );
  }

  /// `currency`
  String get tab2_item_cpb {
    return Intl.message(
      'currency',
      name: 'tab2_item_cpb',
      desc: '',
      args: [],
    );
  }

  /// `cycle`
  String get tab2_item_cpzq {
    return Intl.message(
      'cycle',
      name: 'tab2_item_cpzq',
      desc: '',
      args: [],
    );
  }

  /// `Expected output`
  String get tab2_yjcc {
    return Intl.message(
      'Expected output',
      name: 'tab2_yjcc',
      desc: '',
      args: [],
    );
  }

  /// `Product specifications`
  String get tab2_cpgg {
    return Intl.message(
      'Product specifications',
      name: 'tab2_cpgg',
      desc: '',
      args: [],
    );
  }

  /// `All devices`
  String get tab2_all_devices {
    return Intl.message(
      'All devices',
      name: 'tab2_all_devices',
      desc: '',
      args: [],
    );
  }

  /// `Effective space`
  String get tab2_yxkj {
    return Intl.message(
      'Effective space',
      name: 'tab2_yxkj',
      desc: '',
      args: [],
    );
  }

  /// `Reference node number`
  String get tab2_ckjdh {
    return Intl.message(
      'Reference node number',
      name: 'tab2_ckjdh',
      desc: '',
      args: [],
    );
  }

  /// `Technical service fee`
  String get tab2_jsfwf {
    return Intl.message(
      'Technical service fee',
      name: 'tab2_jsfwf',
      desc: '',
      args: [],
    );
  }

  /// `First time ATM fee`
  String get tab2_scjgf {
    return Intl.message(
      'First time ATM fee',
      name: 'tab2_scjgf',
      desc: '',
      args: [],
    );
  }

  /// `Next ATM fee`
  String get tab2_xcjgf {
    return Intl.message(
      'Next ATM fee',
      name: 'tab2_xcjgf',
      desc: '',
      args: [],
    );
  }

  /// `Launch time`
  String get tab2_launch_time {
    return Intl.message(
      'Launch time',
      name: 'tab2_launch_time',
      desc: '',
      args: [],
    );
  }

  /// `surplus`
  String get tab2_surplus {
    return Intl.message(
      'surplus',
      name: 'tab2_surplus',
      desc: '',
      args: [],
    );
  }

  /// `Buy now`
  String get tab2_buy_now {
    return Intl.message(
      'Buy now',
      name: 'tab2_buy_now',
      desc: '',
      args: [],
    );
  }

  /// `Selected specifications`
  String get buy_select_Spec {
    return Intl.message(
      'Selected specifications',
      name: 'buy_select_Spec',
      desc: '',
      args: [],
    );
  }

  /// `Storage server`
  String get buy_storage_server {
    return Intl.message(
      'Storage server',
      name: 'buy_storage_server',
      desc: '',
      args: [],
    );
  }

  /// `Total price`
  String get buy_total_price {
    return Intl.message(
      'Total price',
      name: 'buy_total_price',
      desc: '',
      args: [],
    );
  }

  /// `First service cycle`
  String get buy_first_service_cycle {
    return Intl.message(
      'First service cycle',
      name: 'buy_first_service_cycle',
      desc: '',
      args: [],
    );
  }

  /// `Speed day`
  String get buy_speed_day {
    return Intl.message(
      'Speed day',
      name: 'buy_speed_day',
      desc: '',
      args: [],
    );
  }

  /// `Number of copies`
  String get buy_buy_fen {
    return Intl.message(
      'Number of copies',
      name: 'buy_buy_fen',
      desc: '',
      args: [],
    );
  }

  /// `Gas encapsulation threshold`
  String get buy_gas_t {
    return Intl.message(
      'Gas encapsulation threshold',
      name: 'buy_gas_t',
      desc: '',
      args: [],
    );
  }

  /// `Submit order`
  String get buy_submit_order {
    return Intl.message(
      'Submit order',
      name: 'buy_submit_order',
      desc: '',
      args: [],
    );
  }

  /// `Cancel order`
  String get order_cancel_order {
    return Intl.message(
      'Cancel order',
      name: 'order_cancel_order',
      desc: '',
      args: [],
    );
  }

  /// `To be paid`
  String get order_to_be_paid {
    return Intl.message(
      'To be paid',
      name: 'order_to_be_paid',
      desc: '',
      args: [],
    );
  }

  /// `Order details`
  String get order_order_detail {
    return Intl.message(
      'Order details',
      name: 'order_order_detail',
      desc: '',
      args: [],
    );
  }

  /// `Order completed`
  String get order_order_completed {
    return Intl.message(
      'Order completed',
      name: 'order_order_completed',
      desc: '',
      args: [],
    );
  }

  /// `Create time`
  String get order_create_time {
    return Intl.message(
      'Create time',
      name: 'order_create_time',
      desc: '',
      args: [],
    );
  }

  /// `Payment time`
  String get order_payment_time {
    return Intl.message(
      'Payment time',
      name: 'order_payment_time',
      desc: '',
      args: [],
    );
  }

  /// `Order number`
  String get order_order_number {
    return Intl.message(
      'Order number',
      name: 'order_order_number',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get order_order_copy {
    return Intl.message(
      'Copy',
      name: 'order_order_copy',
      desc: '',
      args: [],
    );
  }

  /// `Device total price`
  String get order_device_total_price {
    return Intl.message(
      'Device total price',
      name: 'order_device_total_price',
      desc: '',
      args: [],
    );
  }

  /// `Service cycle`
  String get order_service_cycle {
    return Intl.message(
      'Service cycle',
      name: 'order_service_cycle',
      desc: '',
      args: [],
    );
  }

  /// `Refund is not supported after payment. Check the order information`
  String get order_order_mark {
    return Intl.message(
      'Refund is not supported after payment. Check the order information',
      name: 'order_order_mark',
      desc: '',
      args: [],
    );
  }

  /// `Payment method`
  String get order_payment_method {
    return Intl.message(
      'Payment method',
      name: 'order_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `USDT payment`
  String get order_usdt_payment {
    return Intl.message(
      'USDT payment',
      name: 'order_usdt_payment',
      desc: '',
      args: [],
    );
  }

  /// `CNY payment`
  String get order_cny_payment {
    return Intl.message(
      'CNY payment',
      name: 'order_cny_payment',
      desc: '',
      args: [],
    );
  }

  /// `Agree`
  String get sd_agree {
    return Intl.message(
      'Agree',
      name: 'sd_agree',
      desc: '',
      args: [],
    );
  }

  /// `And`
  String get sd_and {
    return Intl.message(
      'And',
      name: 'sd_and',
      desc: '',
      args: [],
    );
  }

  /// `Service agreement`
  String get sd_service_agreement {
    return Intl.message(
      'Service agreement',
      name: 'sd_service_agreement',
      desc: '',
      args: [],
    );
  }

  /// `Consent to purchase`
  String get sd_consent_purchase {
    return Intl.message(
      'Consent to purchase',
      name: 'sd_consent_purchase',
      desc: '',
      args: [],
    );
  }

  /// `Account balance`
  String get sd_account_balance {
    return Intl.message(
      'Account balance',
      name: 'sd_account_balance',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get order_confirm_payment {
    return Intl.message(
      'Payment',
      name: 'order_confirm_payment',
      desc: '',
      args: [],
    );
  }

  /// `Transaction code`
  String get order_traansaction_code {
    return Intl.message(
      'Transaction code',
      name: 'order_traansaction_code',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the transaction password to complete the payment`
  String get order_show_payment {
    return Intl.message(
      'Please enter the transaction password to complete the payment',
      name: 'order_show_payment',
      desc: '',
      args: [],
    );
  }

  /// `Cloud storage`
  String get login_cloud_storage {
    return Intl.message(
      'Cloud storage',
      name: 'login_cloud_storage',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to login`
  String get login_welcome_login {
    return Intl.message(
      'Welcome to login',
      name: 'login_welcome_login',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the phone number`
  String get login_please_phone_number {
    return Intl.message(
      'Please enter the phone number',
      name: 'login_please_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the login password`
  String get login_please_login_password {
    return Intl.message(
      'Please enter the login password',
      name: 'login_please_login_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get login_sign_in {
    return Intl.message(
      'Sign in',
      name: 'login_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Forget the password`
  String get login_forget_pwd {
    return Intl.message(
      'Forget the password',
      name: 'login_forget_pwd',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get login_register {
    return Intl.message(
      'Register',
      name: 'login_register',
      desc: '',
      args: [],
    );
  }

  /// `If you continue to log in, you agree`
  String get login_login_agree {
    return Intl.message(
      'If you continue to log in, you agree',
      name: 'login_login_agree',
      desc: '',
      args: [],
    );
  }

  /// `Cloud storage user agreement`
  String get login_user_agreemnet {
    return Intl.message(
      'Cloud storage user agreement',
      name: 'login_user_agreemnet',
      desc: '',
      args: [],
    );
  }

  /// `Register platform users for more exciting content`
  String get register_platform_users {
    return Intl.message(
      'Register platform users for more exciting content',
      name: 'register_platform_users',
      desc: '',
      args: [],
    );
  }

  /// `Next step`
  String get register_next_step {
    return Intl.message(
      'Next step',
      name: 'register_next_step',
      desc: '',
      args: [],
    );
  }

  /// `Do you have an account? Sign in now`
  String get register_exist_account {
    return Intl.message(
      'Do you have an account? Sign in now',
      name: 'register_exist_account',
      desc: '',
      args: [],
    );
  }

  /// `Registration means consent`
  String get register_zcjdbty {
    return Intl.message(
      'Registration means consent',
      name: 'register_zcjdbty',
      desc: '',
      args: [],
    );
  }

  /// `Find the password`
  String get login_find_pwd {
    return Intl.message(
      'Find the password',
      name: 'login_find_pwd',
      desc: '',
      args: [],
    );
  }

  /// `8-16 digits, including both letters and numbers`
  String get login_rule_pwd {
    return Intl.message(
      '8-16 digits, including both letters and numbers',
      name: 'login_rule_pwd',
      desc: '',
      args: [],
    );
  }

  /// `Please set login password`
  String get login_set_pwd {
    return Intl.message(
      'Please set login password',
      name: 'login_set_pwd',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a new password`
  String get login_new_pwd {
    return Intl.message(
      'Please enter a new password',
      name: 'login_new_pwd',
      desc: '',
      args: [],
    );
  }

  /// `Please set the transaction password`
  String get login_transaction_pwd {
    return Intl.message(
      'Please set the transaction password',
      name: 'login_transaction_pwd',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the new password again`
  String get login_qzcsrxmm {
    return Intl.message(
      'Please enter the new password again',
      name: 'login_qzcsrxmm',
      desc: '',
      args: [],
    );
  }

  /// `Please input SMS verification code`
  String get login_qsrdxyzm {
    return Intl.message(
      'Please input SMS verification code',
      name: 'login_qsrdxyzm',
      desc: '',
      args: [],
    );
  }

  /// `Verifi code`
  String get login_dxyzm {
    return Intl.message(
      'Verifi code',
      name: 'login_dxyzm',
      desc: '',
      args: [],
    );
  }

  /// `SMS verification`
  String get login_dxyz {
    return Intl.message(
      'SMS verification',
      name: 'login_dxyz',
      desc: '',
      args: [],
    );
  }

  /// `Invitation code (optional)`
  String get login_yqm {
    return Intl.message(
      'Invitation code (optional)',
      name: 'login_yqm',
      desc: '',
      args: [],
    );
  }

  /// `Enter invitation code`
  String get login_sryqm {
    return Intl.message(
      'Enter invitation code',
      name: 'login_sryqm',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get login_done {
    return Intl.message(
      'Done',
      name: 'login_done',
      desc: '',
      args: [],
    );
  }

  /// `Recharge`
  String get mine_service_cz {
    return Intl.message(
      'Recharge',
      name: 'mine_service_cz',
      desc: '',
      args: [],
    );
  }

  /// `Recharge quantity`
  String get mine_service_czsl {
    return Intl.message(
      'Recharge quantity',
      name: 'mine_service_czsl',
      desc: '',
      args: [],
    );
  }

  /// `Recharge address`
  String get mine_service_czdz {
    return Intl.message(
      'Recharge address',
      name: 'mine_service_czdz',
      desc: '',
      args: [],
    );
  }

  /// `Recharge record`
  String get mine_service_czjl {
    return Intl.message(
      'Recharge record',
      name: 'mine_service_czjl',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal`
  String get mine_service_tx {
    return Intl.message(
      'Withdrawal',
      name: 'mine_service_tx',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal record`
  String get mine_service_txjl {
    return Intl.message(
      'Withdrawal record',
      name: 'mine_service_txjl',
      desc: '',
      args: [],
    );
  }

  /// `Chain name`
  String get mine_service_lmc {
    return Intl.message(
      'Chain name',
      name: 'mine_service_lmc',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get mine_service_bz {
    return Intl.message(
      'Currency',
      name: 'mine_service_bz',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal address`
  String get mine_service_txdz {
    return Intl.message(
      'Withdrawal address',
      name: 'mine_service_txdz',
      desc: '',
      args: [],
    );
  }

  /// `Fill in the blockchain address`
  String get mine_service_txqkldz {
    return Intl.message(
      'Fill in the blockchain address',
      name: 'mine_service_txqkldz',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal quantity`
  String get mine_service_txsl {
    return Intl.message(
      'Withdrawal quantity',
      name: 'mine_service_txsl',
      desc: '',
      args: [],
    );
  }

  /// `Prompt withdrawal`
  String get mine_service_tstx {
    return Intl.message(
      'Prompt withdrawal',
      name: 'mine_service_tstx',
      desc: '',
      args: [],
    );
  }

  /// `Extract all`
  String get mine_service_qbtq {
    return Intl.message(
      'Extract all',
      name: 'mine_service_qbtq',
      desc: '',
      args: [],
    );
  }

  /// `Copy address`
  String get mine_service_fzdz {
    return Intl.message(
      'Copy address',
      name: 'mine_service_fzdz',
      desc: '',
      args: [],
    );
  }

  /// `Save picture`
  String get mine_service_bctp {
    return Intl.message(
      'Save picture',
      name: 'mine_service_bctp',
      desc: '',
      args: [],
    );
  }

  /// `Service charge`
  String get mine_service_sxf {
    return Intl.message(
      'Service charge',
      name: 'mine_service_sxf',
      desc: '',
      args: [],
    );
  }

  /// `Reminder`
  String get mine_service_wxts {
    return Intl.message(
      'Reminder',
      name: 'mine_service_wxts',
      desc: '',
      args: [],
    );
  }

  /// `Whole`
  String get mine_record_qb {
    return Intl.message(
      'Whole',
      name: 'mine_record_qb',
      desc: '',
      args: [],
    );
  }

  /// `In process`
  String get mine_record_clz {
    return Intl.message(
      'In process',
      name: 'mine_record_clz',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get mine_record_ywc {
    return Intl.message(
      'Completed',
      name: 'mine_record_ywc',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get mine_record_yqx {
    return Intl.message(
      'Cancelled',
      name: 'mine_record_yqx',
      desc: '',
      args: [],
    );
  }

  /// `Customer service telephone numbers`
  String get about_kfdh {
    return Intl.message(
      'Customer service telephone numbers',
      name: 'about_kfdh',
      desc: '',
      args: [],
    );
  }

  /// `Add customer service wechat`
  String get about_tjkfwxh {
    return Intl.message(
      'Add customer service wechat',
      name: 'about_tjkfwxh',
      desc: '',
      args: [],
    );
  }

  /// `Account settings`
  String get about_zhsz {
    return Intl.message(
      'Account settings',
      name: 'about_zhsz',
      desc: '',
      args: [],
    );
  }

  /// `Head portranit`
  String get about_tx {
    return Intl.message(
      'Head portranit',
      name: 'about_tx',
      desc: '',
      args: [],
    );
  }

  /// `Nickname`
  String get about_nc {
    return Intl.message(
      'Nickname',
      name: 'about_nc',
      desc: '',
      args: [],
    );
  }

  /// `Login mobile number`
  String get about_dlsjh {
    return Intl.message(
      'Login mobile number',
      name: 'about_dlsjh',
      desc: '',
      args: [],
    );
  }

  /// `Change nickname`
  String get about_xgnc {
    return Intl.message(
      'Change nickname',
      name: 'about_xgnc',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a nickname`
  String get about_qsrnc {
    return Intl.message(
      'Please enter a nickname',
      name: 'about_qsrnc',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get about_save {
    return Intl.message(
      'Save',
      name: 'about_save',
      desc: '',
      args: [],
    );
  }

  /// `Up to 12 alphanumeric characters or 8 Chinese characters`
  String get about_ncgz {
    return Intl.message(
      'Up to 12 alphanumeric characters or 8 Chinese characters',
      name: 'about_ncgz',
      desc: '',
      args: [],
    );
  }

  /// `Account security`
  String get account_zhaq {
    return Intl.message(
      'Account security',
      name: 'account_zhaq',
      desc: '',
      args: [],
    );
  }

  /// `Login password`
  String get account_zlmm {
    return Intl.message(
      'Login password',
      name: 'account_zlmm',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get account_cz {
    return Intl.message(
      'Reset',
      name: 'account_cz',
      desc: '',
      args: [],
    );
  }

  /// `Transaction code`
  String get account_jymm {
    return Intl.message(
      'Transaction code',
      name: 'account_jymm',
      desc: '',
      args: [],
    );
  }

  /// `Security verification`
  String get account_aqyz {
    return Intl.message(
      'Security verification',
      name: 'account_aqyz',
      desc: '',
      args: [],
    );
  }

  /// `In order to ensure the security of your account, please verify your identity. After verification, proceed to the next step`
  String get account_aqyzts {
    return Intl.message(
      'In order to ensure the security of your account, please verify your identity. After verification, proceed to the next step',
      name: 'account_aqyzts',
      desc: '',
      args: [],
    );
  }

  /// `Send verification code`
  String get account_fsyzm {
    return Intl.message(
      'Send verification code',
      name: 'account_fsyzm',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get account_yzm {
    return Intl.message(
      'Verification Code',
      name: 'account_yzm',
      desc: '',
      args: [],
    );
  }

  /// `SMS verification code has been sent to, please check`
  String get account_yzmts {
    return Intl.message(
      'SMS verification code has been sent to, please check',
      name: 'account_yzmts',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get account_cxfs {
    return Intl.message(
      'Resend',
      name: 'account_cxfs',
      desc: '',
      args: [],
    );
  }

  /// `Get verification code`
  String get account_hqyzm {
    return Intl.message(
      'Get verification code',
      name: 'account_hqyzm',
      desc: '',
      args: [],
    );
  }

  /// `Reset login password`
  String get account_czdlmm {
    return Intl.message(
      'Reset login password',
      name: 'account_czdlmm',
      desc: '',
      args: [],
    );
  }

  /// `Reset transaction password`
  String get account_czjymm {
    return Intl.message(
      'Reset transaction password',
      name: 'account_czjymm',
      desc: '',
      args: [],
    );
  }

  /// `8-16 digits, including both letters and numbers`
  String get account_czgz {
    return Intl.message(
      '8-16 digits, including both letters and numbers',
      name: 'account_czgz',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get account_xmm {
    return Intl.message(
      'New password',
      name: 'account_xmm',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a new password`
  String get account_xmmts {
    return Intl.message(
      'Please enter a new password',
      name: 'account_xmmts',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new password`
  String get account_qrxmm {
    return Intl.message(
      'Confirm new password',
      name: 'account_qrxmm',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the new password again`
  String get account_qzcsrxmm {
    return Intl.message(
      'Please enter the new password again',
      name: 'account_qzcsrxmm',
      desc: '',
      args: [],
    );
  }

  /// `Modification succeeded. Please log in again`
  String get login_tis {
    return Intl.message(
      'Modification succeeded. Please log in again',
      name: 'login_tis',
      desc: '',
      args: [],
    );
  }

  /// `Choose language`
  String get choose_language {
    return Intl.message(
      'Choose language',
      name: 'choose_language',
      desc: '',
      args: [],
    );
  }

  /// `Scan`
  String get scan_title {
    return Intl.message(
      'Scan',
      name: 'scan_title',
      desc: '',
      args: [],
    );
  }

  /// `Photo`
  String get scan_photo {
    return Intl.message(
      'Photo',
      name: 'scan_photo',
      desc: '',
      args: [],
    );
  }

  /// `Device`
  String get dvc_title {
    return Intl.message(
      'Device',
      name: 'dvc_title',
      desc: '',
      args: [],
    );
  }

  /// `Device management`
  String get dvc_gl {
    return Intl.message(
      'Device management',
      name: 'dvc_gl',
      desc: '',
      args: [],
    );
  }

  /// `Profit`
  String get dvc_sys {
    return Intl.message(
      'Profit',
      name: 'dvc_sys',
      desc: '',
      args: [],
    );
  }

  /// `Number of equipment`
  String get dvc_sls {
    return Intl.message(
      'Number of equipment',
      name: 'dvc_sls',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get mi_qb {
    return Intl.message(
      'Wallet',
      name: 'mi_qb',
      desc: '',
      args: [],
    );
  }

  /// `Output income`
  String get dvc_ccsy {
    return Intl.message(
      'Output income',
      name: 'dvc_ccsy',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday's earnings`
  String get dvc_zrsy {
    return Intl.message(
      'Yesterday\'s earnings',
      name: 'dvc_zrsy',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wat_wdqb {
    return Intl.message(
      'Wallet',
      name: 'wat_wdqb',
      desc: '',
      args: [],
    );
  }

  /// `Account balance USDT`
  String get wat_zhye {
    return Intl.message(
      'Account balance USDT',
      name: 'wat_zhye',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal amount`
  String get wat_ktxje {
    return Intl.message(
      'Withdrawal amount',
      name: 'wat_ktxje',
      desc: '',
      args: [],
    );
  }

  /// `登录成功`
  String get login_succ {
    return Intl.message(
      '登录成功',
      name: 'login_succ',
      desc: '',
      args: [],
    );
  }

  /// `暂无消息`
  String get home_zwxx {
    return Intl.message(
      '暂无消息',
      name: 'home_zwxx',
      desc: '',
      args: [],
    );
  }

  /// `公告详情`
  String get message_ggxq {
    return Intl.message(
      '公告详情',
      name: 'message_ggxq',
      desc: '',
      args: [],
    );
  }

  /// `年`
  String get date_year {
    return Intl.message(
      '年',
      name: 'date_year',
      desc: '',
      args: [],
    );
  }

  /// `月`
  String get date_mon {
    return Intl.message(
      '月',
      name: 'date_mon',
      desc: '',
      args: [],
    );
  }

  /// `日`
  String get date_day {
    return Intl.message(
      '日',
      name: 'date_day',
      desc: '',
      args: [],
    );
  }

  /// `时`
  String get date_hou {
    return Intl.message(
      '时',
      name: 'date_hou',
      desc: '',
      args: [],
    );
  }

  /// `分`
  String get date_min {
    return Intl.message(
      '分',
      name: 'date_min',
      desc: '',
      args: [],
    );
  }

  /// `秒`
  String get date_sec {
    return Intl.message(
      '秒',
      name: 'date_sec',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}