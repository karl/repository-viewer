require '../module/module'
angular = require 'angular'

module.exports = class RepositoryService
  constructor: (@$http) ->

  getAll: ->
    url = 'https://api.github.com/search/repositories?q=user:karl&sort=stars&order=desc'
    @$http.get url
      .then (results) ->
        results.data.items




angular.module('app').factory 'repositoryService', ['$http', ($http) ->
  return new RepositoryService($http)
]
