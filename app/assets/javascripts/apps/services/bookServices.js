BookShop.factory("BookFactory", function($resource,serverConfig) {

    return $resource(serverConfig.url+ "books/:id", { id: '@id' }, {
        index:   { method: 'GET', isArray: true, responseType: 'json' }
    });
})