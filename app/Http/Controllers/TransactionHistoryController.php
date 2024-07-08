<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\TransactionHistory;
use App\TotalAmount;

class TransactionHistoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $transactions = TransactionHistory::latest()->get();
        // dd($loanproducts);
        return view('transactionhistory.index', compact('transactions'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $total = TotalAmount::first();
        return view('transactionhistory.create', compact('total'));
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
            'borrower' => 'price',
            'type' => 'required',
        ]);

        $transaction = new TransactionHistory();
        $transaction->type = $request->type;
        $transaction->price = $request->price;
        $transaction->note = $request->note;

        if ($request->type == 'in') {
            $total = TotalAmount::find($request->totalamoutId);
            $total->update(['total_amount' => $total->total_amount + $request->price]);
        } elseif ($request->type == 'out') {

            $total = TotalAmount::find($request->totalamoutId);
            if ($total->total_amount < $request->price) {
                return back()->with('error', 'Số tiền vượt quá số dư');
            } else {
                $total->update(['total_amount' => $total->total_amount - $request->price]);
            }

        } else {
            return back()->with('error', 'Có lỗi xảy ra: ');
        }

        $transaction->save();

        return redirect()->back()->with('message', 'Giao dịch thành công');
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
        //
    }
}
