// The MIT License (MIT)
//
// Copyright (c) 2019 foxsofter
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.

import 'package:flutter/widgets.dart';

import '../registry/registry_set.dart';
import 'navigator_page_observer.dart';
import 'navigator_page_observer_channel.dart';
import 'navigator_page_route.dart';

class NavigatorPageObservers {
  NavigatorPageObservers(this._entrypoint) {
    _channel = NavigatorPageObserverChannel(this, _entrypoint);
  }

  final observers = RegistrySet<NavigatorPageObserver>();

  final String _entrypoint;
  NavigatorPageObserverChannel _channel;

  void willAppear(
          RouteSettings routeSettings, NavigatorRouteAction routeAction) =>
      _channel.willAppear(routeSettings, routeAction);

  void didAppear(
          RouteSettings routeSettings, NavigatorRouteAction routeAction) =>
      _channel.didAppear(routeSettings, routeAction);

  void willDisappear(
          RouteSettings routeSettings, NavigatorRouteAction routeAction) =>
      _channel.willDisappear(routeSettings, routeAction);

  void didDisappear(
          RouteSettings routeSettings, NavigatorRouteAction routeAction) =>
      _channel.didDisappear(routeSettings, routeAction);
}