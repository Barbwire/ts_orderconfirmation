<a class="btn btn-default _blank"
   href="{$link->getAdminLink('AdminPdf')|escape:'html':'UTF-8'}&amp;submitAction=generateOrderConfirmationPDF&amp;id_order={$id_order}">
    <i class="icon-file"></i>
	{l s='Order confirmation' mod='ts_orderconfirmation'}
</a>