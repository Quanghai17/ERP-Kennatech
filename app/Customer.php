<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class Customer extends Model
{
    use LogsActivity;

    protected static $logAttributes = ['name', 'email', 'phone','address', 'note'];

    protected static $logOnlyDirty = true;
    protected static $submitEmptyLogs = false;

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['name', 'email', 'phone','address', 'note'])
        ->logOnlyDirty()
        ->dontSubmitEmptyLogs()
        ->useLogName('Khách Hàng');
    }
}
