/**
 * Model resposável pelo acesso a api de usuário
 * 
 * @author Diego Botelho <dibmartins@gmail.com>
 * @since 1.0
 * @copyright (c) 2014, incrudr
 * 
 * @package apps/users
 */
function Session(){
    
    var me = this;
    
    /**
     * Retorna os dados do usuário armazenados na sessão
     * @returns object
     */
    this.setUser = function(response){

	response = JSON.parse(response);

	var pref = response.user.preferences;
	var perm = response.user.permissions;
	
	delete response.user.preferences;
	delete response.user.permissions;

	sessionStorage.setItem('preferences', JSON.stringify(pref));
	sessionStorage.setItem('permissions', JSON.stringify(perm));
	sessionStorage.setItem('user'	    , JSON.stringify(response.user));
    }
    
    /**
     * Retorna os dados do usuário armazenados na sessão
     * @returns object
     */
    this.valid = function(){

	var valid = (sessionStorage.getItem('user') != null);

	return valid;
    }
    
    /**
     * Retorna os dados do usuário armazenados na sessão
     * @returns object
     */
    this.getUser = function(){

	return JSON.parse(sessionStorage.getItem('user'));
    }
    
    /**
     * Retorna os dados do usuário armazenados na sessão
     * @returns object
     */
    this.getPreferences = function(){

	return JSON.parse(sessionStorage.getItem('preferences'));
    }
    
    /**
     * Retorna os dados do usuário armazenados na sessão
     * @returns object
     */
    this.getPermissions = function(){

	return JSON.parse(sessionStorage.getItem('permissions'));
    }
    
    /**
     * Apaga os dados registrados na sessão
     * @returns void
     */
    this.destroy = function(){

	sessionStorage.clear();

	var user = new User();

	user.logout(function(response) {
	    window.location.replace('/login');
	});
    }
}