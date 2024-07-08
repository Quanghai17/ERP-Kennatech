<?php

namespace App\Http\Controllers;

use App\Loanproduct;
use App\Product;
use App\LoanProductDetail;
use Illuminate\Http\Request;

class LoanProductController extends Controller
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
        $loanproducts = Loanproduct::with('products')->latest()->get();
        // dd($loanproducts);
        return view('loanproduct.index', compact('loanproducts'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $products = Product::all();
        return view('loanproduct.create', compact('products'));
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
            'borrower' => 'required',
            'phone' => 'required',
            'borrowed_day' => 'required',
            'pay_day' => 'required',
            'status' => 'required',
            'qty_loan' => 'required'
        ]);


        $loanproduct = new Loanproduct();
        $loanproduct->borrower = $request->borrower;
        $loanproduct->phone = $request->phone;
        $loanproduct->borrowed_day = $request->borrowed_day;
        $loanproduct->pay_day = $request->pay_day;
        $loanproduct->status = $request->status;
        $loanproduct->note = $request->note;

        $loanproduct->save();
        foreach ($request->productId as $key => $productId) {
            $loanproductdetail = new LoanProductDetail();
            $loanproductdetail->loanproduct_id = $loanproduct->id;
            $loanproductdetail->product_id = $request->productId[$key];
            $loanproductdetail->qty_loan = $request->qty_loan[$key];
            $loanproductdetail->qty_returned = $request->qty_returned[$key];
            $loanproductdetail->save();

            if($request->status == 0) {
                $product = Product::find($productId);
                try {
                    if ($product->stock - $request->qty_loan[$key] < 0) {
                        return back()->with('error', 'Số lượng mượn vượt quá số lượng tồn kho');
                    } else {
                        $product->update(['stock' => $product->stock - $request->qty_loan[$key]]);
                    }
                } catch (\Exception $e) {
                    return back()->with('error', 'Có lỗi xảy ra: ' . $e->getMessage());
                }
            }

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
        $products = Product::all();
        $loanproduct = Loanproduct::where('id', $id)->with('products')->first();
        // dd($loanproduct);
        return view('loanproduct.edit', compact('loanproduct', 'products'));
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
        $request->validate([
            'borrower' => 'required',
            'phone' => 'required',
            'borrowed_day' => 'required',
            'pay_day' => 'required',
            'status' => 'required',
        ]);

        //dd($request);

        $loanproduct = Loanproduct::findOrFail($id);
        $loanproduct->borrower = $request->borrower;
        $loanproduct->phone = $request->phone;
        $loanproduct->borrowed_day = $request->borrowed_day;
        $loanproduct->pay_day = $request->pay_day;
        $loanproduct->status = $request->status;
        $loanproduct->note = $request->note;

        $loanproduct->save();
        // dd($request->productId);
        foreach ($request->productId as $key => $productId) {
            $loanproductdetail = LoanProductDetail::findOrFail($request->loanproductdetailId[$key]);
            $loanproductdetail->loanproduct_id = $loanproduct->id;
            $loanproductdetail->product_id = $request->productId[$key];
            $loanproductdetail->qty_loan = $request->qty_loan[$key];
            $loanproductdetail->qty_returned = $request->qty_returned[$key];
            $loanproductdetail->save();

            if($request->status == 1) {
                $product = Product::find($productId);
                $product->update(['stock' => $product->stock + $request->qty_returned[$key]]);
            }
            elseif($request->status == 0) {
                $product = Product::find($productId);
                try {
                    if ($product->stock - $request->qty_loan[$key] < 0) {
                        return back()->with('error', 'Số lượng mượn vượt quá số lượng tồn kho');
                    } else {
                        $product->update(['stock' => $product->stock - $request->qty_loan[$key]]);
                    }
                } catch (\Exception $e) {
                    return back()->with('error', 'Có lỗi xảy ra: ' . $e->getMessage());
                }
            }

        }

        return redirect()->back()->with('message', 'Sửa thành công');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $loanproduct = Loanproduct::find($id);
        $loanproduct->delete();
        return redirect()->back();
    }

}
