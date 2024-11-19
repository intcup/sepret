<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view("inicio");
});

Route::get('/iniciar', function () {
    return view("login");
});
