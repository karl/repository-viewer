repos = []

$.ajax
  url: 'https://api.github.com/search/repositories?q=user:karl&sort=stars&order=desc'
.then ((results) ->
  repos = results.items
  html = []
  $.each repos, (index, repo) ->
    html = html.concat([
      '<tr data-index="' + index + '">'
      '<td>' + repo.name + '</td>'
      '<td><span class="glyphicon glyphicon-star" aria-hidden="true"></span> ' + repo.stargazers_count + '</td>'
      '<td><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> ' + repo.subscribers_count + '</td>'
      '<td><span class="glyphicon glyphicon-random" aria-hidden="true"></span> ' + repo.forks_count + '</td>'
      '</tr>'
    ])
    return
  $('#repos').html html.join()
  return
), (err) ->
  console.log 'error', err
  return

$('#repos').on 'click', 'tr', (event) ->
  event.preventDefault()
  index = parseInt($(event.currentTarget).data('index'), 10)
  repo = repos[index]
  console.log repo
  $('#repos').hide()
  $('#details').show()
  return

$('#details').on 'click', '.back', (event) ->
  event.preventDefault()
  $('#details').hide()
  $('#repos').show()
  return
