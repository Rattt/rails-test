BookShop.controller("BookListCtrl", function($scope, BookFactory) {

    $scope.books = BookFactory.index()

    $scope.addBook = function() {
        book = BookFactory.save($scope.newBook)

        $scope.books.push(book)
        $scope.newBook = {}
    }

    $scope.deleteBook = function(index) {

        book = $scope.books[index]
        BookFactory.delete(book)
        $scope.books.splice(index, 1);
    }
})