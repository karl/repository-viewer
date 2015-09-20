assert = require 'assert'
_ = require 'lodash'
Promise = require 'bluebird'
RepositoryService = require './repository-service.coffee'

describe 'RepositoryService', ->
  describe 'getAllForUser', ->
    it 'should return repositories with subcribers_count', ->

      repositories = [{
        name: 'test-repository'
      }]

      fullRepository =
        name: 'test-repository'
        subcribers_count: 1

      mockHttp =
        get: (url) ->
          if _.startsWith url, 'https://api.github.com/search/'
            Promise.resolve data:
              items: repositories
          else
            Promise.resolve data: fullRepository

      repositoryService = new RepositoryService(mockHttp)
      repositoryService.getAllForUser 'testuser'
        .then (repositories) ->
          assert.equal 1, repositories[0].subcribers_count
