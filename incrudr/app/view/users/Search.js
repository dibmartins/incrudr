/**
 * Especialização do componente window
 * 
 * @author Diego Botelho <dibmartins@gmail.com>
 * @since 1.0
 * @copyright (c) 2014, incrudr
 * 
 * @package app/view/usuarios
 */

Ext.require([
    'app.overrides.window.Window',
    'app.view.users.SearchController',
    'app.view.users.SearchModel',
    'app.view.users.Grid',
    'Ext.form.Panel',
    'Ext.form.FieldSet',
]);

Ext.define('app.view.users.Search', {
    
    extend	: 'app.overrides.window.Window',
    title	: 'Usuários',
    controller	: 'users-search',
    width	: '70%',
    height	: '80%',
    
    items: [{
	    xtype	: 'form',
	    title	: 'Acesso',
	    header	: false,
	    bodyPadding	: 0,
	    layout	: 'border',
	    items: [
		{
		    title	    : 'Filtros',
		    region	    : 'west',
		    flex	    : .4,
		    bodyPadding	    : 10,
		    collapsible	    : true,
		    collapsed	    : true,
		    split	    : true,
		    titleCollapse   : true,
		    items: [{
			xtype		: 'textfield',
			width		: '100%',
			name		: 'login',
			fieldLabel	: 'Login',
			labelWidth	: 50,
			displayLabel	: false,
			allowBlank	: false
		    },{
			xtype	    : 'textfield',
			width	    : '100%',
			name	    : 'login',
			fieldLabel  : 'Login',
			labelWidth  : 50,
			allowBlank  : false
		    },{
			xtype	    : 'textfield',
			width	    : '100%',
			name	    : 'login',
			fieldLabel  : 'Login',
			labelWidth  : 50,
			allowBlank  : false
		    },{
			xtype	    : 'textfield',
			width	    : '100%',
			name	    : 'login',
			fieldLabel  : 'Login',
			labelWidth  : 50,
			allowBlank  : false
		    }],
		    buttons: [{
			text	: 'Buscar',
			glyph	: 'xf0c7@FontAwesome',
			handler	: 'onOptionsClick'
		    },
		    {
			text	: 'Limpar',
			iconCls	: 'fa fa-save',
			handler	: 'onCloseClick'
		    }]
		},
		{
		    region  : 'center',
		    layout  : 'fit',
		    items: [
			{
			xtype		: 'grid-users',
			flex		: 1,
			maintainFlex	: false,
			collapsible	: true
		    }]
		},
		{
		    region: 'south',
		    buttons: [{
			text	: 'Fechar',
			glyph	: 'xf0c7@FontAwesome',
			handler	: 'onCloseClick'
		    }]
		}
	    ]

	}]
});