/**
 * Model resposável pelo acesso a api de usuário
 * 
 * @author Diego Botelho <dibmartins@gmail.com>
 * @since 1.0
 * @copyright (c) 2014, incrudr
 * 
 * @package apps/users
 */
function User(){
    
    var me = this;
    
    /**
     * Consulta a api para verificar se as credenciais informadas pertencem a um usuário válido
     * @param string login
     * @param string password
     * @param function success
     * @param function fail
     * @param function done
     * @param function aways
     * @returns void
     */
    this.auth = function(login, password, success, fail, done, aways){

	var credentials = {
	    login	 : login, 
	    password : $.sha1(password)
	};

	$.post("http://api.incrudr/users/user/auth/", credentials, success)
	    .done(done).fail(fail).always(aways);
    }
    
    /**
     * Encerra a sessão no servidor
     * @param function success
     * @param function fail
     * @param function done
     * @param function aways
     * @returns void
     */
    this.logout = function(success, fail, done, aways){

	$.post("http://api.incrudr/users/user/logout/", {}, success)
	    .done(done).fail(fail).always(aways);
    }
}