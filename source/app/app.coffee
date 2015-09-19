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

    repositoryService.getAll()
      .then (repositories) ->
        scope.repositories = repositories

      .catch ->
        console.log 'Error loading repositories!'

]
