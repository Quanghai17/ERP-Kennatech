<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class Loanproduct extends Model
{
    public function products()
    {
        return $this->belongsToMany(Product::class, 'loan_product_details', 'loanproduct_id', 'product_id')
                    ->withPivot('qty_loan', 'qty_returned', 'id');
    }

    use LogsActivity;

    protected static $logAttributes = ['borrower', 'note', 'borrowed_day','pay_day','phone'];

    protected static $logOnlyDirty = true;
    protected static $submitEmptyLogs = false;

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['borrower', 'note', 'borrowed_day','pay_day','phone'])
        ->logOnlyDirty()
        ->dontSubmitEmptyLogs()
        ->useLogName('Sản Phẩm Cho Mượn');
    }
}
