<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view("inicio");
});

Route::get('/iniciar', function () {
    return view("login");
});


Route::get('/ayuda', function () {
    return view("ayuda");
});

Route::get('/intranet', function () {
    return view("intranet");
});

Route::get('/recuperar', function () {
    return view("recuperar");
});

Route::get('/registrar', function () {
    return view("registrar");
});
Route::get('/cuenta', function () {
    return view("cuenta");
});
