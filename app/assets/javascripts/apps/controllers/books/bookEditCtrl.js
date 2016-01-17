BookShop.controller("BookEditCtrl",  function($scope, BookFactory, BookAppInitializer, FileUploader) {
    $scope.uploader = new FileUploader();

    $scope.book = BookAppInitializer.book();

    $scope.updateBook = function() {
        BookFactory.update($scope.book)
    }
})
