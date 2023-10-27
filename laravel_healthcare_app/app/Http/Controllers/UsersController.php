<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\DoctorDetails;
use App\Models\PatientDetails;
use Illuminate\Validation\ValidationException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     * 
     *  @return \Illuminate\Http\Response 
     */
    public function index()
    {
        $user = array();
        $user = Auth::user();
        $doctor = User::where('type', 'doctor')->get();
        $doctorData = DoctorDetails::all();

        foreach($doctorData as $data){
            foreach($doctor as $info){
                if($data['doctor_id'] == $info['id']){
                    $data['doctor_name'] = $info['name'];
                    $data['doctor_profile'] = $info['profile_photo_url'];
                }
            }
        }

        $user['doctor'] = $doctorData;

        return $user;
    }


     /**
     * Display the login.
     * 
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        $request->validate([
            'email'=>'required|email',
            'password'=>'required',
        ]);
        
        $user = User::where('email', $request->email)->first();

        if(!$user || ! Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages ([
                'email'=>['The provided credentials are incorrect'],
            ]);
        }

        return $user->createToken($request->email)->plainTextToken;
    }

    /**
     * Display the Register.
     * 
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        $request->validate([
            'name'=>'required|string',
            'email'=>'required|email',
            'password'=>'required',
        ]);

        $user = User::create([
            'name'=>$request->name,
            'email'=>$request->email,
            'type'=>'user',
            'password'=>Hash::make($request->password),
        ]);

        $userInfo = PatientDetails::create([
            'patient_id'=>$user->id,
            'status'=>'active',
        ]);

        return $user;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
