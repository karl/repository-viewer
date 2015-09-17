(function() {

  var repos = [];

  $.ajax({
    url: "https://api.github.com/search/repositories?q=user:karl&sort=stars&order=desc"
  }).then(function(results) {
    repos = results.items;

    var html = [];
    $.each(repos, function(index, repo) {
      html = html.concat([
        '<tr data-index="' + index + '">',
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

  $("#repos").on('click', 'tr', function(event) {
    event.preventDefault();

    var index = parseInt($(event.currentTarget).data('index'), 10);
    repo = repos[index];

    console.log(repo);

    $("#repos").hide();
    $("#details").show();
  });

  $("#details").on('click', '.back', function(event) {
    event.preventDefault();
    $("#details").hide();
    $("#repos").show();
  });

})();
