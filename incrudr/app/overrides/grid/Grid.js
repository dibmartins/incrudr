/**
 * Especialização do componente grid
 * 
 * @author Diego Botelho <dibmartins@gmail.com>
 * @since 1.0
 * @copyright (c) 2014, incrudr
 * 
 * @package app/overrides/grid
 */

Ext.require([
    'Ext.grid.Panel',
    'Ext.toolbar.Paging'
]);

Ext.define('app.overrides.grid.Grid', {
    
    extend	: 'Ext.grid.Panel',
    alias	: 'widget.gridx',
    iconCls	: 'icon-grid',
    frame	: false,
    header	: false,
    border	: false,
    dockedItems	: [],
    columns	: [],
    height	: '90%',
    
    bbar : {
	xtype		: 'pagingtoolbar',
	displayInfo	: true,
	displayMsg	: '{0} - {1} de {2}',
	emptyMsg	: "Nenhum registro encontrado",
	beforePageText  : 'Página ',
	afterPageText   : 'de {0}',
	nextText	: 'Próximo',
	prevText	: 'Anterior',
	firstText	: 'Primeira Página',
	lastText	: 'Última Página',
	refreshText	: 'Atualizar',
	prependButtons	: true,
	items:[
	    {
		pressed		: true,
		enableToggle	: true,
		iconCls		: 'button-bbar-add',
		tooltip		: 'Adicionar novo registro'
	    },
	    {
		pressed		: true,
		enableToggle	: true,
		iconCls		: 'button-bbar-edit',
		tooltip		: 'Editar o registro selecionado'
	    },
	    {
		pressed		: true,
		enableToggle	: true,
		iconCls		: 'button-bbar-delete',
		tooltip		: 'Excluir o registro selecionado'
	    },
	    {
		pressed		: true,
		enableToggle	: true,
		iconCls		: 'button-bbar-view',
		tooltip		: 'Visualizar o registro selecionado'
	    },
	    {
		pressed		: true,
		enableToggle	: true,
		iconCls		: 'button-bbar-block',
		tooltip		: 'Bloquear/Inativar o registro selecionado'
	    }
	]
    },
    
    initComponent: function(){

	var me = this;
	
	me.bbar.store = me.store;
	
	me.store.load();

	this.callParent();
    }
});