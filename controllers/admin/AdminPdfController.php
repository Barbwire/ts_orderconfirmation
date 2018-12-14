<?php
/**
 * Created by PhpStorm.
 * User: Barb
 * Date: 13.12.2018
 * Time: 11:43
 */

class AdminPdfController extends AdminPdfControllerCore
{
    public function processGenerateOrderConfirmationPDF()
    {
        if (Tools::isSubmit('id_order')) {
            $this->generateOrderConfirmationPDFByIdOrder((int)Tools::getValue('id_order'));
        } else {
            die(Tools::displayError('Order Confirmation could not be created.'));
        }
    }

    public function generateOrderConfirmationPDFByIdOrder($id_order)
    {
        $order = new Order((int)$id_order);
        if (!Validate::isLoadedObject($order)) {
            throw new PrestaShopException('Can\'t load Order object');
        }
        $this->generatePDF(array($order), 'OrderConfirmation');
    }
}