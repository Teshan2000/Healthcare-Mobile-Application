<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Appointments extends Model
{
    use HasFactory;

    protected $fillable = [
        'patient_id',
        'doctor_id',
        'date',
        'day',
        'time',        
        'status',
    ];

    public function patient() {
        return $this->belongsTo(PatientDetails::class);
    }
}
