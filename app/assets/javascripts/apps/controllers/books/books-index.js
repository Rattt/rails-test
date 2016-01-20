BookShop.controller("books-index", function($scope, BookFactory, $window) {

    $scope.books = BookFactory.index()


    $scope.addBook = function() {
        $scope.errorMsg = null;

        book = BookFactory.save($scope.newBook);
            book.$promise
            .then(function(result) {
                $scope.books.push(book)
                $scope.successMsg = ['Запись добавлена'];
            }, function(errorMsg) {
                $scope.errorMsg = errorMsg.data
                // В вверх только при ошибке
                $window.pageYOffset;
            });

        $scope.newBook = {}
    }

    $scope.deleteBook = function(index) {

        book = $scope.books[index]
        BookFactory.delete(book)
        $scope.books.splice(index, 1);
    }
})