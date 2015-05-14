/**
 * Model utilizada no grid de usuários
 * 
 * @author Diego Botelho <dibmartins@gmail.com>
 * @since 1.0
 * @copyright (c) 2014, incrudr
 * 
 * @package app/view/users
 */

Ext.require([
    'Ext.data.Store',
    'app.view.users.GridModel',
    'Ext.data.proxy.JsonP',
]);

Ext.define('app.view.users.GridStore', {
    
    extend	: 'Ext.data.Store',
    pageSize	: 9,
    model	: Ext.create('app.view.users.GridModel'),
	    
    proxy : {

	type	: 'jsonp',
	url	: 'http://api.incrudr/users/user/list/',

	reader: {
	    type	    : 'json',
	    rootProperty    : 'items',
	    totalProperty   : 'total_items'
	}
    }
    
});