{**
 * 2007-2018 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/OSL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2018 PrestaShop SA
 * @license   https://opensource.org/licenses/OSL-3.0 Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<table class="product" width="100%" cellpadding="4" cellspacing="0">

	<thead>
	<tr>
		<th class="product header small" width="15%">{l s='Reference' mod='ts_orderconfirmation'}</th>
		<th class="product header small" width="45%">{l s='Product' mod='ts_orderconfirmation'}</th>
		<th class="product header small" width="8%">{l s='Tax Rate' mod='ts_orderconfirmation'}</th>
		<th class="product header-right small" width="12%">{l s='Unit Price' mod='ts_orderconfirmation'} <br /> {l s='(Tax incl.)' mod='ts_orderconfirmation'}</th>
		<th class="product header small" width="8%">{l s='Qty' mod='ts_orderconfirmation'}</th>
		<th class="product header-right small" width="12%">{l s='Total' mod='ts_orderconfirmation'} <br /> {l s='(Tax incl.)' mod='ts_orderconfirmation'}</th>
	</tr>
	</thead>

	<tbody>

	<!-- PRODUCTS -->
	{foreach $order_details as $order_detail}
		{cycle values=["color_line_even", "color_line_odd"] assign=bgcolor_class}
		<tr class="product {$bgcolor_class}">

			<td class="product center">
				{$order_detail.product_reference}
			</td>
			<td class="product left">
				{$order_detail.product_name}
			</td>
			<td class="product center">
				{$order_detail.order_detail_tax_label}
			</td>



			<td class="product right">
				{displayPrice currency=$order->id_currency price=$order_detail.unit_price_tax_incl}
			</td>
			<td class="product center">
				{$order_detail.product_quantity}
			</td>
			<td  class="product right">
				{displayPrice currency=$order->id_currency price=$order_detail.total_price_tax_incl}
			</td>
		</tr>

	{/foreach}
	<!-- END PRODUCTS -->

	<!-- CART RULES -->

	{assign var="shipping_discount_tax_incl" value="0"}
	{foreach from=$cart_rules item=cart_rule name="cart_rules_loop"}
		{if $smarty.foreach.cart_rules_loop.first}
		<tr class="discount">
			<th class="header" colspan="{$layout._colCount}">
				{l s='Discounts' mod='ts_orderconfirmation'}
			</th>
		</tr>
		{/if}
		<tr class="discount">
			<td class="white right" colspan="{$layout._colCount - 1}">
				{$cart_rule.name}
			</td>
			<td class="right white">
				- {displayPrice currency=$order->id_currency price=$cart_rule.value_tax_excl}
			</td>
		</tr>
	{/foreach}

	</tbody>

</table>
