require '../module/module'
angular = require 'angular'

require './details.less'
angular.module('app').directive 'appDetails', ->
  restrict: 'E'
  template: require './details.html'
  scope:
    repository: '='
    back: '&'
  # link: (scope, element, attrs) ->
