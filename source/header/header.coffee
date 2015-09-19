require '../module/module'
angular = require 'angular'

angular.module('app').directive 'appHeader', ->
  restrict: 'E'
  template: require './header.html'
  scope: {}
