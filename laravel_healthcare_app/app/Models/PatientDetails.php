<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PatientDetails extends Model
{
    use HasFactory;

    protected $fillable = [
        'patient_id',        
        'bio_data',
        'status',
    ];

    public function user() {
        return $this->belongsTo(User::class);
    }
}
