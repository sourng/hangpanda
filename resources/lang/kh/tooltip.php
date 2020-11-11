<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Tooltip Language Lines
    |--------------------------------------------------------------------------
    |
    | The following language lines are used for various help texts.
    |
    */

    'product_stock_alert' => "ផលិតផល​នៅតិច.<br/><small class='text-muted'>ផ្អែកលើបរិមាណនៃការដាស់តឿនផលិតផលនៅក្នុងអេក្រង់ត្រូវ​បន្ថែមផលិតផល.<br> ទិញផលិតផលនេះមុនពេលស្តុកបញ្ចប់.</small>",

    'payment_dues' => "រង់ចាំការទូទាត់សម្រាប់ការទិញ. <br/><small class='text-muted'>ផ្អែកលើរយៈពេលបង់ប្រាក់របស់អ្នកផ្គត់ផ្គង់. <br/> Showing payments to be paid in 7 days or less.</small>",

    'input_tax' => 'ពន្ធសរុបដែលប្រមូលបានសម្រាប់លក់ក្នុងរយៈពេលដែលបានជ្រើសរើស.',

    'output_tax' => 'ពន្ធសរុបដែលបានបង់សម្រាប់ការទិញក្នុងរយៈពេលដែលបានជ្រើសរើស.',

    'tax_overall' => 'ភាពខុសគ្នារវាងពន្ធដែលប្រមូលបាននិងពន្ធសរុបដែលបានបង់ក្នុងរយៈពេលដែលបានជ្រើសរើស.',

    'purchase_due' => 'ចំនួនទឹកប្រាក់ដែលមិនបានចំណាយសរុបសម្រាប់ការទិញ.',

    'sell_due' => 'ចំនួនសរុបដែលត្រូវទទួលពីការលក់',

    'over_all_sell_purchase' => '-ve value = Amount to pay <br>+ve Value = Amount to receive',

    'no_of_products_for_trending_products' => 'Number of top trending products to be compared in the chart below.',

    'top_trending_products' => "Top selling products of your shop. <br/><small class='text-muted'>Apply filters to know trending products for specific Category, Brand, Business Location etc.</small>",

    'sku' => "Unique product id or Stock Keeping Unit <br><br>Keep it blank to automatically generate sku.<br><small class='text-muted'>You can modify sku prefix in Business settings.</small>",

    'enable_stock' => "Enable or disable stock management for a product. <br><br><small class='text-muted'>Stock Management should be disable mostly for services. Example: Hair-Cutting, Repairing, etc.</small>",

    'alert_quantity' => "Get alert when product stock reaches or goes below the specified quantity.<br><br><small class='text-muted'>Products with low stock will be displayed in dashboard - Product Stock Alert section.</small>",

    'product_type' => '<b>Single product</b>: Product with no variations.
    <br><b>Variable product</b>: Product with variations such as size, color etc.',

    'profit_percent' => "Default profit margin for the product. <br><small class='text-muted'>(<i>You can manage default profit margin in Business Settings.</i>)</small>",

    'pay_term' => "Payments to be paid for purchases/sales within the given time period.<br/><small class='text-muted'>All upcoming or due payments will be displayed in dashboard - Payment Due section</small>",

    'order_status' => 'Products in this purchase will be available for sale only if the <b>Order Status</b> is <b>Items Received</b>.',

    'purchase_location' => 'Business location where the purchased product will be available for sale.',

    'sale_location' => 'Business location from where you want to sell',

    'sale_discount' => "Set 'Default Sale Discount' for all sales in Business Settings. Click on the edit icon below to add/update discount.",

    'sale_tax' => "Set 'Default Sale Tax' for all sales in Business Settings. Click on the edit icon below to add/update Order Tax.",

    'default_profit_percent' => "Default profit margin of a product. <br><small class='text-muted'>Used to calculate selling price based on purchase price entered.<br/> You can modify this value for indivisual products while adding</small>",

    'fy_start_month' => 'Starting month of The Financial Year for your business',

    'business_tax' => 'Registered tax number for your business.',

    'invoice_scheme' => "Invoice Scheme means invoice numbering format. Select the scheme to be used for this business location<br><small class='text-muted'><i>You can add new Invoice Scheme</b> in Invoice Settings</i></small>",

    'invoice_layout' => "Invoice Layout to be used for this business location<br><small class='text-muted'>(<i>You can add new <b>Invoice Layout</b> in <b>Invoice Settings<b></i>)</small>",

    'invoice_scheme_name' => 'Give a short meaningful name to the Invoice Scheme.',

    'invoice_scheme_prefix' => 'Prefix for an Invoice Scheme.<br>A Prefix can be a custom text or current year. Ex: #XXXX0001, #2018-0002',

    'invoice_scheme_start_number' => "Start number for invoice numbering. <br><small class='text-muted'>You can make it 1 or any other number from which numbering will start.</small>",

    'invoice_scheme_count' => 'Total number of invoices generated for the Invoice Scheme',

    'invoice_scheme_total_digits' => 'Length of the Invoice Number excluding Invoice Prefix',

    'tax_groups' => 'Group Tax Rates - defined above, to be used in combination in Purchase/Sell sections.',

    'unit_allow_decimal' => "Decimals allows you to sell the related products in fractions.",

    'print_label' => 'Add products ->Choose informations to show in Labels -> Select Barcode Setting -> Preview Labels -> Print',

    'expense_for' => 'Choose the user for which expense is related to. <i>(Optional)</i><br/><small>Example: Salary of an employee.</small>',
    
    'all_location_permission' => 'If <b>All Locations</b> selected this role will have permission to access all business locations',

    'dashboard_permission' => 'If unchecked only Welcome message will be displayed in Home.',

    'access_locations_permission' => 'Choose all locations this role can access. All data for the selected location will only be displayed to the user.<br/><br/><small>For Example: You can use this to define <i>Store Manager / Cashier / Stock manager / Branch Manager, </i>of particular Location.</small>',

    'print_receipt_on_invoice' => 'Enable or Disable auto-printing of invoice on finalizing',

    'receipt_printer_type' => "<i>Impressão Baseada em Navegador</i>: Mostrar caixa de diálogo de impressão no navegador com visualização da fatura <br/> <br/> <i> Usar Impressora de Recibos Configurada </i>: Selecionar um recibo configurado / impressora térmica para impressão",

    'adjustment_type' => '<i>Normal</i>: Adjustment for normal reasons like Leakage, Damage etc. <br/><br/> <i>Abnormal</i>: Adjustment for reasons like Fire, Accident etc.',

    'total_amount_recovered' => 'Amount recovered from insurance or selling of scraps or others',

    'express_checkout' => 'Mark complete paid & checkout',
    'total_card_slips' => 'Total number of card payments used in this register',
    'total_cheques' => 'Total number of cheques used in this register',

    'capability_profile' => "Support for commands and code pages varies between printer vendors and models. If you're not sure, it's a good idea to use the 'simple' Capability Profile",

    'purchase_different_currency' => 'Select this option if you purchase in a different currency than your business currency',

    'currency_exchange_factor' => "1 Purchase Currency = ? Base Currency <br> <small class='text-muted'>You can enable/disabled 'Purchase in other currency' from business settings.</small>",

    'accounting_method' => 'Accounting method',

    'transaction_edit_days' => 'Number of days from Transaction Date till which a transaction can be edited.',
    'stock_expiry_alert' => "List of stocks expiring in :days days <br> <small class='text-muted'>You can set the no. of days in Business Settings </small>",
    'sub_sku' => "Sku is optional. <br><br><small>Keep it blank to automatically generate sku.<small>",
    'shipping' => "Set shipping details and shipping charges. Click on the edit icon below to add/update shipping details and charges."
];
