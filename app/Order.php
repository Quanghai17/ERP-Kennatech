<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class Order extends Model
{
    public function products()
    {
        return $this->belongsToMany(Product::class, 'pivot_order_products', 'order_id', 'product_id')->withPivot('qty', 'id');
    }

    public function shipping(){
        return $this->belongsTo('App\ShippingMethod');
    }

    public function payment(){
        return $this->belongsTo('App\PaymentMethod');
    }

    public function status(){
        return $this->belongsTo('App\Status');
    }

    public function customer(){
        return $this->belongsTo('App\Customer');
    }

    use LogsActivity;

    protected static $logAttributes = ['address', 'phone', 'note','shipping_id','payment_id','status_id', 'discount', 'total_price'];

    protected static $logOnlyDirty = true;
    protected static $submitEmptyLogs = false;

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['address', 'phone', 'note','shipping_id','payment_id','status_id', 'discount', 'total_price'])
        ->logOnlyDirty()
        ->dontSubmitEmptyLogs()
        ->useLogName('Đơn Hàng');
    }
}
