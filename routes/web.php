<?php
use Illuminate\Support\Facades\Route;
use TCG\Voyager\Facades\Voyager;
use \App\Http\Controllers\ProductController;
use \App\Http\Controllers\LoanProductController;
use \App\Http\Controllers\TransactionHistoryController;
use \App\Http\Controllers\SupplierController;
use \App\Http\Controllers\CustomerController;
use \App\Http\Controllers\PurchaseController;
use \App\Http\Controllers\OrderController;
use App\Http\Controllers\BillController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::redirect('/', 'http://localhost/ERP_Kenna/public/manager/');

Route::group(['prefix' => 'manager'], function () {
    Voyager::routes();
    Route::get('/', [\App\Http\Controllers\HomeController::class, 'index'])->name('home');
    Route::resource('product', ProductController::class);
    Route::resource('loanproduct', LoanProductController::class);
    Route::resource('transaction', TransactionHistoryController::class);
    Route::resource('supplier', SupplierController::class);
    Route::resource('customer', CustomerController::class);
    Route::resource('purchase', PurchaseController::class);
    Route::resource('order', OrderController::class);
    Route::resource('bill', BillController::class);
});

require __DIR__ . '/auth.php';

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
