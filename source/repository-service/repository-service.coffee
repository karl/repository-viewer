require '../module/module'
angular = require 'angular'

Promise = require 'bluebird'

module.exports = class RepositoryService
  constructor: (@$http) ->
    @base = 'https://api.github.com/'

  getAllForUser: (user) ->
    url = "#{@base}search/repositories?q=user:#{user}&sort=stars&order=desc"
    @$http.get url
      .then (response) =>
        repositories = response.data.items

        # Because the repositories returned from GitHub `search/repositories` and `/user/:name/repos`
        # don't contain the `subcribers_count` field we need to make a call to
        # get each repository individually to get that field.
        # This is horribly inefficient, but I couldn't find any other documented
        # way to get this data.
        Promise.map repositories, (repository) =>
          @$http.get "#{@base}repos/#{user}/#{repository.name}"
            .then (response) ->
              response.data




angular.module('app').factory 'repositoryService', ['$http', ($http) ->
  return new RepositoryService($http)
]
