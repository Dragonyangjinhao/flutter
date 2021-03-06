// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:flutter/services.dart';
import 'test_step.dart';

Future<TestStepResult> systemNavigatorPop() {
  const BasicMessageChannel<String> channel = const BasicMessageChannel<String>(
    'navigation-test',
    const StringCodec(),
  );

  final Completer<TestStepResult> completer = new Completer<TestStepResult>();

  channel.setMessageHandler((String message) async {
    completer.complete(
        const TestStepResult('System navigation pop', '', TestStatus.ok));
    return '';
  });
  SystemNavigator.pop();
  return completer.future;
}
