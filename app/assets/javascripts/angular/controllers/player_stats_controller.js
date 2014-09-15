playerStats.controller("playerStatsController", ["$scope", "$http",function($scope, $http){
  var path = location.pathname + ".json";
  $http.get(path).success(function(data){
    $scope.columns = data.player_stat_column;
    $scope.players = data.players;
  });
}]);
