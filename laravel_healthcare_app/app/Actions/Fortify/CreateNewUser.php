<?php

namespace App\Actions\Fortify;

use App\Models\DoctorDetails;
use App\Models\PatientDetails;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Laravel\Fortify\Contracts\CreatesNewUsers;
use Laravel\Jetstream\Jetstream;

class CreateNewUser implements CreatesNewUsers
{
    use PasswordValidationRules;

    /**
     * Validate and create a newly registered user.
     *
     * @param  array<string, string>  $input
     */
    public function create(array $input): User
    {
        Validator::make($input, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => $this->passwordRules(),
            'terms' => Jetstream::hasTermsAndPrivacyPolicyFeature() ? ['accepted', 'required'] : '',
        ])->validate();

        $user = User::create([
            'name' => $input['name'],
            'email' => $input['email'],
            'type' => 'doctor',
            'password' => Hash::make($input['password']),
        ]);

    
        $doctorInfo = DoctorDetails::create([
            'doctor_id' => $user->id,
            'status' => 'active'
        ]);
        

        /*else if($input['type'] == 'patient') {
            $patientInfo = PatientDetails::create([
                'patient_id' => $user->id,
                'status' => 'active,'
            ]);
        }*/

        return $user;
    }
}
