$.ajax({
  url: "https://api.github.com/search/repositories?q=user:karl&sort=stars&order=desc"
}).then(function(results) {
  // console.log(results);
  var html = [];
  $.each(results.items, function(index, repo) {
    html = html.concat([
      '<tr>',
        '<td>' + repo.name + '</td>',
        '<td><span class="glyphicon glyphicon-star" aria-hidden="true"></span> ' + repo.stargazers_count + '</td>',
        '<td><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> ' + repo.watchers_count + '</td>',
        '<td><span class="glyphicon glyphicon-random" aria-hidden="true"></span> ' + repo.forks_count + '</td>',
      '</tr>'
    ]);
  });

  $("#repos").html(html.join());

}, function(err) {
  console.log("error", err);
});
