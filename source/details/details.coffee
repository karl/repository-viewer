require '../module/module'
angular = require 'angular'

angular.module('app').directive 'appDetails', ->
  restrict: 'E'
  template: require './details.html'
  scope:
    repository: '='
    back: '&'
  # link: (scope, element, attrs) ->
