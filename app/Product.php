<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class Product extends Model
{
    protected $fillable = ['stock', 'qty_import', 'qty_export'];

    use LogsActivity;

    protected static $logAttributes = ['name', 'image', 'cost','price','stock','qty_import', 'qty_export', 'note'];

    protected static $logOnlyDirty = true;
    protected static $submitEmptyLogs = false;

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['name', 'image', 'cost','price','stock','qty_import', 'qty_export', 'note'])
        ->logOnlyDirty()
        ->dontSubmitEmptyLogs()
        ->useLogName('Sản Phẩm');
    }
}
