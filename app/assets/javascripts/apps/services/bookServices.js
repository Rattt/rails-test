BookShop.factory("BookFactory", function($resource,serverConfig) {

    return $resource(serverConfig.url+ "books/:id", { id: '@id' }, {
        show:    { method: 'GET', isArray: false },
        index:   { method: 'GET', isArray: true, responseType: 'json' },
        update:  { method: 'PUT', responseType: 'json' }
    });
})