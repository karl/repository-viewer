require '../module/module'
angular = require 'angular'

require '../header/header'
require '../repository-list/repository-list'
require '../details/details'
require '../repository-service/repository-service'

angular.module('app').directive 'app', ['repositoryService', (repositoryService) ->
  restrict: 'E'
  template: require './app.html'
  scope: {}
  link: (scope, element, attrs) ->

    scope.select = (repository) ->
      scope.currentRepository = repository

    scope.loading = true

    repositoryService.getAllForUser 'karl'
      .then (repositories) ->
        scope.repositories = repositories
        scope.loading = false

      .catch ->
        scope.loading = false
        scope.error = true

]
