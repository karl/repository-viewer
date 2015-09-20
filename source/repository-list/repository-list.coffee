require '../module/module'
angular = require 'angular'

require './repository-list.less'
angular.module('app').directive 'appRepositoryList', ->
  restrict: 'E'
  template: require './repository-list.html'
  scope:
    repositories: '='
    repositoryClick: '&'
  link: (scope, element, attrs) ->

    scope.clicked = (repository) ->
      scope.repositoryClick repository: repository
