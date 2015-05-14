$(document).ready(new LoginView().initialize());

/**
 * View resposável pela interface de login
 * 
 * @author Diego Botelho <dibmartins@gmail.com>
 * @since 1.0
 * @copyright (c) 2014, incrudr
 * 
 * @package apps/users
 */
function LoginView() {

    var me	 = this;
    var keyboard = new window.keypress.Listener();

    /**
     * Adiciona os eventos aos elementos do documento
     * 
     * @returns void
     */
    this.initialize = function() {

	this.addListeners();
    }

    /**
     * Adiciona os eventos aos elementos do documento
     * 
     * @returns void
     */
    this.addListeners = function() {

	$('#btn_enter').on('click', me.auth);
	
	keyboard.simple_combo("enter", me.auth);
    }

    /**
     * Rotinas a serem executadas quando o usuário clica no botão enter
     * @returns void
     */
    this.auth = function(){

	var frm = $('#frm-login').parsley();
	
	if(!frm.validate()) return;

	var user = new User();

	user.auth($('#login').val(), $('#password').val(), me.userFound, me.userNotFound);
    }
    
    /**
     * Rotinas a serem executadas quando o usuário é encontrado
     * @param object response
     * @returns void
     */
    this.userFound = function(response) {
	
	try{
	    var session = new Session();
	    
	    session.setUser(response);
	    
	    window.location.replace('../');
	}
	catch(e){
	    console.log(e);
	}
    }

    /**
     * Rotinas a serem executadas quando o usuário não é encontrado
     * @param object response
     * @returns {undefined}
     */
    this.userNotFound = function(response) {
	
	$.gritter.add({
	    title	: 'Autenticação',
	    text	: 'Usuário não encontrado.',
	    class_name	: 'warning',
	    position	: 'top-right'
	});
    }
}