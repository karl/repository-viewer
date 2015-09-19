require '../module/module'
angular = require 'angular'

angular.module('app').directive 'appRepositoryList', ->
  restrict: 'E'
  template: require './repository-list.html'
  scope:
    repositories: '='
    repositoryClick: '&'
  link: (scope, element, attrs) ->

    scope.clicked = (repository) ->
      scope.repositoryClick repository: repository
