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
