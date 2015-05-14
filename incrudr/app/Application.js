/**
 * Aplicação Principal ExtJs
 * 
 * @author Diego Botelho <dibmartins@gmail.com>
 * @since 1.0
 * @copyright (c) 2014, incrudr
 * 
 * @package app
 */
Ext.define('Incrudr.Application', {
    
    extend	: 'Ext.app.Application',
    name	: 'Incrudr',
    views	: [],
    stores	: [],
    controllers	: ['Root'],
    
    launch: function () {
	
	Ext.require('app.view.users.Search');
	
	var me = this;
	var keyboard = new window.keypress.Listener();
	
	var session = new Session();
	
	// usuário não está logado, redireciona para tela de autenticação
	if(!session.valid()){
	    
	    window.location.replace('/login');
	    return;
	}

	$('body').css('display', '');

	App.init();
	App.dashBoard();

	me.addListeners();

	var userMenu = new UserMenuView();
	
	userMenu.initialize();
    },
    
    /**
     * Adiciona os eventos aos elementos do documento
     * 
     * @returns void
     */
    addListeners: function() {
	
	$('#menu-usuarios').on('click', this.displayUsers);
    },
    

    /**
     * Rotinas a serem executadas quando o usuário clica no botão enter
     * @returns void
     */
    displayUsers: function(){

	var users = Ext.create('app.view.users.Search');

	users.show();
    }
});
