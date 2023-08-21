app.controller("auth-ctrl", function($scope, $http) {
	$http.get(`/rest/authorities`).then(resp => {
		$scope.db = resp.data;
		console.log(resp.data)
	})

	$scope.index_of = function(username, roles) {
		return $scope.db.authorities
			.findIndex(a => a.accounts.username == username && a.roles.id == roles);
	}

	$scope.update = function(username, roles) {
		var index = $scope.index_of(username, roles);
		if (index >= 0) {
			var id = $scope.db.authorities[index].id;
			$http.delete(`/rest/authorities/${id}`).then(resp => {
				$scope.db.authorities.splice(index, 1);
			})
		}
		else {
			var authorities = {
				accounts: { username: username },
				roles: { id: roles }
			};
			$http.post(`/rest/authorities`, authorities).then(resp => {
				$scope.db.authorities.push(resp.data);
			});
		}
	}
});