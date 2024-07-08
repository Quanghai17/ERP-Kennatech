<?php

namespace App\Http\Controllers;

use App\Customer;
use App\Order;
use App\Product;
use Illuminate\Http\Request;
use App\TotalAmount;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $total = TotalAmount::first();
        $orders = Order::all();
        $products = Product::all();
        $customers = Customer::all();
        return view('home.index', compact('total', 'orders', 'products', 'customers'));
    }
}
