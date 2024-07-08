<?php

namespace App\Http\Controllers;

use App\Customer;
use Illuminate\Http\Request;
use App\Order;
use App\PaymentMethod;
use App\Product;
use App\ShippingMethod;
use App\Status;
use App\PivotOrderProduct;
use App\TotalAmount;

class OrderController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $orders = Order::with('products', 'shipping', 'payment', 'status', 'customer')->latest()->get();
        //dd($orders);
        return view('order.index', compact('orders'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $products = Product::all();
        $customers = Customer::all();
        $shipping = ShippingMethod::all();
        $payments = PaymentMethod::all();
        $status = Status::all();
        $total = TotalAmount::first();
        return view('order.create', compact('products', 'customers', 'shipping', 'payments', 'status', 'total'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'phone' => 'required',
            'address' => 'required',
            'total_price' => 'required',
        ]);

        $order = new Order();
        $order->customer_id = $request->customer_id;
        $order->phone = $request->phone;
        $order->address = $request->address;
        $order->note = $request->note;
        $order->total_price = $request->total_price;
        $order->discount = $request->discount;
        $order->shipping_id = $request->shipping_id;
        $order->payment_id = $request->payment_id;
        $order->status_id = $request->status_id;

        $order->save();

        foreach ($request->productId as $key => $productId) {
            $productdetail = new PivotOrderProduct();
            $productdetail->order_id = $order->id;
            $productdetail->product_id = $request->productId[$key];
            $productdetail->qty = $request->qty[$key];

            $productdetail->save();

            if ($request->status_id == 1 || $request->status_id == 2) {
                $product = Product::find($productId);
                try {
                    if ($product->stock - $request->qty[$key] < 0) {
                        return back()->with('error', 'Số lượng mượn vượt quá số lượng tồn kho');
                    } else {
                        $product->update(['stock' => $product->stock - $request->qty[$key]]);
                        $product->update(['qty_export' => $product->qty_export + $request->qty[$key]]);
                    }
                } catch (\Exception $e) {
                    return back()->with('error', 'Có lỗi xảy ra: ' . $e->getMessage());
                }
            }
        }

        // $total = TotalAmount::find($request->totalamoutId);
        // $total->update(['total_amount' => $total->total_amount + $request->total_amount]);

        return redirect()->back()->with('message', 'Thêm bản ghi thành công');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $products = Product::all();
        $customers = Customer::all();
        $shipping = ShippingMethod::all();
        $payments = PaymentMethod::all();
        $status = Status::all();
        $total = TotalAmount::first();
        $order = Order::where('id', $id)->with('products', 'shipping', 'payment', 'status', 'customer')->first();
        // dd($order);
        return view('order.edit', compact('order', 'products', 'customers', 'shipping', 'payments', 'status', 'total'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // dd($request);
        $request->validate([
            'phone' => 'required',
            'address' => 'required',
            'total_price' => 'required',
        ]);

        $order = Order::findOrFail($id);
        $order->customer_id = $request->customer_id;
        $order->phone = $request->phone;
        $order->address = $request->address;
        $order->note = $request->note;
        $order->total_price = $request->total_price;
        $order->discount = $request->discount;
        $order->shipping_id = $request->shipping_id;
        $order->payment_id = $request->payment_id;
        $order->status_id = $request->status_id;

        $order->save();

        foreach ($request->productId as $key => $productId) {
            $productdetail = PivotOrderProduct::findOrFail($request->productdetailId[$key]);
            $productdetail->order_id = $order->id;
            $productdetail->product_id = $request->productId[$key];
            $productdetail->qty = $request->qty[$key];

            $productdetail->save();

            if ($request->status_id == 3) {
                $product = Product::find($productId);

                $product->update(['stock' => $product->stock + $request->qty[$key]]);
                $product->update(['qty_export' => $product->qty_export - $request->qty[$key]]);

                // $total = TotalAmount::find($request->totalamoutId);
                // $total->update(['total_amount' => $total->total_amount - $request->total_price]);

            }
        }

        if ($request->status_id == 2) {
            $total = TotalAmount::find($request->totalamoutId);
            $total->update(['total_amount' => $total->total_amount + $request->total_price]);
        }

        return redirect()->back()->with('message', 'Sửa bản ghi thành công');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $order = Order::find($id);
        $order->delete();
        return redirect()->back();
    }
}
