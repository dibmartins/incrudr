/**
 * Especialização do componente window
 * 
 * @author Diego Botelho <dibmartins@gmail.com>
 * @since 1.0
 * @copyright (c) 2014, incrudr
 * 
 * @package app/overrides/window
 */
Ext.define('app.overrides.window.Window', {
    
    extend	: 'Ext.window.Window',
    alias	: 'Incrudr.window.Window',
    height	: 500,
    width	: 600,
    title	: 'Nova Janela',
    closable	: true,
    resizable	: false,
    plain	: false,
    modal	: true,
    layout	: 'fit'
});

