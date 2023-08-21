var app = angular.module('app', []);

app.controller('ctrl', function($scope, $http) {
	var $cart = $scope.cart = {
		items: [],
		add(id) { // thêm sản phẩm vào giỏ hàng
			var item = this.items.find(item => item.id == id);
			if (item) {
				item.qty++;
				this.saveToLocalStorage();
			}
			else {
				$http.get(`/rest/product/${id}`).then(resp => {
					resp.data.qty = 1;
					this.items.push(resp.data);
					this.saveToLocalStorage();
				})
			}
		},
		remove(id) { // xóa sản phẩm khỏi giỏ hàng
			var index = this.items.findIndex(item => item.id == id);
			this.items.splice(index, 1);
			this.saveToLocalStorage();
		},
		clear() { // Xóa sạch các mặt hàng trong giỏ
			this.items = []
			this.saveToLocalStorage();
		},
		amt_of(item) { // tính thành tiền của 1 sản phẩm
			return item.price * item.qty;
		},
		get count() { // tính tổng số lượng các mặt hàng trong giỏ
			return this.items
				.map(item => item.qty)
				.reduce((total, qty) => total += qty, 0);
		},
		get amount() { // tổng thành tiền các mặt hàng trong giỏ
			return this.items
				.map(item => this.amt_of(item))
				.reduce((total, amt) => total += amt, 0);
		},
		saveToLocalStorage() { // lưu giỏ hàng vào local storage
			var json = JSON.stringify(angular.copy(this.items));
			localStorage.setItem("cart", json);
		},

		loadFromLocalStorage() { // đọc giỏ hàng từ local storage
			var json = localStorage.getItem("cart");
			this.items = json ? JSON.parse(json) : [];

			this.items.forEach(item => {
				this.loadColor(item.id); // Call the loadColor function for each item's ID
			});
			this.items.forEach(item => {
				this.loadSize(item.id); // Call the loadColor function for each item's ID
			});
		},

		// Load image, size, and color for each product

		loadColor(productid) {
			$http.get(`/rest/product/color/${productid}`).then(resp => {
				var item = this.items.find(item => item.id === productid);
				if (item) {
					item.color = resp.data.color; // Assuming color property is returned in the API response
					this.saveToLocalStorage();
					console.log(item.color)
				}
			}).catch(error => {
				console.log("Error loading color:", error);
			});
		},

		loadSize(productid) {
			$http.get(`/rest/product/size/${productid}`).then(resp => {
				var item = this.items.find(item => item.id === productid);
				if (item) {
					item.size = resp.data.size; // Assuming color property is returned in the API response
					this.saveToLocalStorage();
					console.log(item.size)
				}
			}).catch(error => {
				console.log("Error loading size:", error);
			});
		},
	}
	$cart.loadFromLocalStorage();

	// Đặt hàng
	$scope.order = {
		get accounts() {
			return { username: $auth.user.username }
		},
		createDate: new Date(),
		address: "",
		get orderDetail() {
			return $cart.items.map(item => {
				return {
					products: { id: item.id },
					price: item.price,
					quantity: item.qty
				}
			});
		},
		purchase() {
			var order = angular.copy(this);
			// Thực hiện đặt hàng
			$http.post("/rest/orders", order).then(resp => {
				alert("Đặt hàng thành công!");
				$cart.clear();
				location.href = "/order/detail/" + resp.data.id;
			}).catch(error => {
				alert("Đặt hàng lỗi!")
				console.log(error)
			})	
		}
	}

});