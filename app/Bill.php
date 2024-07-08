<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class Bill extends Model
{
    use LogsActivity;

    protected static $logAttributes = ['note', 'price'];

    protected static $logOnlyDirty = true;
    protected static $submitEmptyLogs = false;

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['note', 'price'])
        ->logOnlyDirty()
        ->dontSubmitEmptyLogs()
        ->useLogName('Phiếu chi');
    }
}
