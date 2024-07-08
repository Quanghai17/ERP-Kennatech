<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class Purchase extends Model
{
    public function products()
    {
        return $this->belongsToMany(Product::class, 'pivot_purchase_products', 'purchase_id', 'product_id')
        ->withPivot('qty_import');
    }

    public function supplier(){
        return $this->belongsTo('App\Supplier');
    }

    use LogsActivity;

    protected static $logAttributes = ['supplier_id', 'total_amount', 'note'];

    protected static $logOnlyDirty = true;
    protected static $submitEmptyLogs = false;

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['supplier_id', 'total_amount', 'note'])
        ->logOnlyDirty()
        ->dontSubmitEmptyLogs()
        ->useLogName('Kho Hàng');
    }
}
