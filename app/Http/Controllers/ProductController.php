<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;

class ProductController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }


    public function index()
    {
        $products = Product::latest()->get();
        return view('product.index', compact('products'));
    }

    public function create()
    {
        return view('product.create');
    }

    //Hàm thêm sản phẩm
    public function store(Request $request)
    {
        // dd($request);
        $request->validate([
            'name' => 'required',
            'cost' => 'required',
            'price' => 'required',
            'qty_import' => 'required',
            'qty_export' => 'required',
            'stock' => 'required',
            'image' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);


        $product = new Product();
        $product->name = $request->name;
        $product->cost = $request->cost;
        $product->price = $request->price;
        $product->qty_import = $request->qty_import;
        $product->qty_export = $request->qty_export;
        $product->stock = $request->stock;
        $product->note = $request->note;
        if ($request->hasFile('image')) {
            $extension = $request->image->getClientOriginalExtension();
            $imageName = Str::uuid() . '.' . $extension;
            $path = $request->image->storeAs('public/images/product', $imageName);
            $product->image = Storage::url($path);
        }

        $product->save();

        return redirect()->route('product.index')->with('message', 'Product Created Successfully');
    }

    //Hàm xóa sản phẩm
    public function destroy($id)
    {
        $product = Product::find($id);
        $product->delete();
        return redirect()->back();
    }

    //Hàm sửa sản phẩm
    public function edit($id)
    {
        $product = Product::findOrFail($id);
        return view('product.edit', compact('product'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'cost' => 'required',
            'price' => 'required',
            'qty_import' => 'required',
            'qty_export' => 'required',
            'stock' => 'required',
            'image' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);


        $product = Product::findOrFail($id);
        $product->name = $request->name;
        $product->cost = $request->cost;
        $product->price = $request->price;
        $product->qty_import = $request->qty_import;
        $product->qty_export = $request->qty_export;
        $product->stock = $request->stock;
        $product->note = $request->note;
        if ($request->hasFile('image')) {
            $extension = $request->image->getClientOriginalExtension();
            $imageName = Str::uuid() . '.' . $extension;
            $path = $request->image->storeAs('public/images/product', $imageName);
            $product->image = Storage::url($path);
        }

        $product->save();

        return redirect()->route('product.index')->with('message', 'Product Created Successfully');
    }
}
