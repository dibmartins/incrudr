/**
 * Especialização do componente grid
 * 
 * @author Diego Botelho <dibmartins@gmail.com>
 * @since 1.0
 * @copyright (c) 2014, incrudr
 * 
 * @package app/view/users
 */

Ext.require([
    'app.view.users.GridModel',
    'app.view.users.GridStore',
    'app.overrides.grid.Grid'
]);

Ext.define('app.view.users.Grid', {
    
    extend  : 'app.overrides.grid.Grid',
    alias   : 'widget.grid-users',
    store   : Ext.create('app.view.users.GridStore'),
    
    columns : [
	{
	    text	: 'Código',
	    dataIndex	: 'use_id',
	    width	: 80
	},
	{
	    header	: 'Nome',
	    dataIndex	: 'use_name',
	    flex	: .3
	},
	{
	    header	: 'Login',
	    dataIndex	: 'use_login',
	    width	: 200
	},{
	    header	: 'Criado Em',
	    xtype	: 'datecolumn',
	    format	: 'd/m/Y H:i:s',
	    dataIndex	: 'use_created',
	    width	: 200
	}
]});