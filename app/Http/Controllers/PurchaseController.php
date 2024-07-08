<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Purchase;
use App\Product;
use App\Supplier;
use App\TotalAmount;
use App\PivotPurchaseProduct;

class PurchaseController extends Controller
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
        $purchases = Purchase::with('products')->with('supplier')->latest()->get();
        return view('purchase.index', compact('purchases'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $total = TotalAmount::first();
        $products = Product::all();
        $suppliers = Supplier::all();
        return view('purchase.create', compact('products', 'suppliers', 'total'));
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
            'total_amount' => 'required',
        ]);

        $purchase = new Purchase();
        $purchase->supplier_id = $request->supplier_id;
        $purchase->total_amount = $request->total_amount;
        $purchase->note = $request->note;

        $purchase->save();

        $total = TotalAmount::find($request->totalamoutId);
        if ($total->total_amount < $request->total_amount) {
            return back()->with('error', 'Số tiền vượt quá số dư');
        } else {
            $total->update(['total_amount' => $total->total_amount - $request->total_amount]);
        }

        foreach ($request->productId as $key => $productId) {
            $product = new PivotPurchaseProduct();
            $product->purchase_id = $purchase->id;
            $product->product_id = $request->productId[$key];
            $product->qty_import = $request->qty[$key];

            $product->save();

            $productDetail = Product::find($productId);
            $productDetail->update(['stock' => $productDetail->stock + $request->qty[$key]]);
            $productDetail->update(['qty_import' => $productDetail->qty_import + $request->qty[$key]]);
        }
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
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $purchase = Purchase::find($id);
        $purchase->delete();
        return redirect()->back();
    }
}
