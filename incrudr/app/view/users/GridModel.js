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
    'Ext.data.Model'
]);

Ext.define('app.view.users.GridModel', {

    extend	: 'Ext.data.Model',
    idProperty  : 'use_id',

    fields: [
	{name: 'use_id'		, type: 'int'},
	{name: 'use_name'	, type: 'string'},
	{name: 'use_login'	, type: 'string'},
	{name: 'use_created'	, type: 'date'}
    ]
});