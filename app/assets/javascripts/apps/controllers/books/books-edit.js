BookShop.controller('books-edit', function ($scope, Upload, serverConfig, BookAppInitializer , $timeout, $window) {

    $scope.book = BookAppInitializer.book();

    $scope.file = null

    $scope.updateBook= function () {

        var file = $scope.file
        file.upload = Upload.upload({
            url: serverConfig.url +'books/upload/' + $scope.book.id,
            method: 'POST',
            fields: {'book[name]': $scope.book.name, 'book[description]': $scope.book.description},
            file: file
        });

        file.upload.then(function (response) {
            $timeout(function () {
                file.result = response.data;
            });
        }, function (response) {
            if (response.status > 0)
                $scope.errorMsg =  response.data;
                // В вверх только при ошибке
                $window.pageYOffset;
        }, function (evt) {
            $scope.successMsg = ['Запись изменена'];
            // Math.min is to fix IE which reports 200% sometimes
            file.progress = Math.min(100, parseInt(100.0 * evt.loaded / evt.total));
        });

    }

});
