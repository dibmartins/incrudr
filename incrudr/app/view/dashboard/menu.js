/**
 * View resposável pelo menu de usuário
 * 
 * @author Diego Botelho <dibmartins@gmail.com>
 * @since 1.0
 * @copyright (c) 2014, incrudr
 * 
 * @package apps/users
 */
function UserMenuView() {

    var me = this;

    /**
     * Adiciona os eventos aos elementos do documento
     * 
     * @returns void
     */
    this.initialize = function() {

	var session = new Session();
	
	var user = session.getUser();
	
	$('#usermenu-user-name').append(user.use_name);
	
	this.addListeners();
    }

    /**
     * Adiciona os eventos aos elementos do documento
     * 
     * @returns void
     */
    this.addListeners = function() {
	
	$('#usermenu-my-profile').on('click', me.myProfileClick);
	$('#usermenu-logout').on('click', me.logoutClick);
    }

    /**
     * Rotinas a serem executadas ao clicar no item Meu Cadastro
     * 
     * @returns void
     */
    this.myProfileClick = function() {
	
	alert('meu cadastro');
    }

    /**
     * Rotinas a serem executadas ao clicar no item Sair
     * 
     * @returns void
     */
    this.logoutClick = function() {
	
	var confirm = window.confirm('Tem certeza que deseja sair?');
	
	if(!confirm) return;
	
	var session = new Session();
	
	session.destroy();
    }
}