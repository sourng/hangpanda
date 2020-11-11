<?php

namespace App\Http\Middleware;

use Closure;

use Config;
use App;

class Language
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    // public function handle($request, Closure $next)
    // {
    //     $locale = config('app.locale');
    //     if ($request->session()->has('user.language')) {
    //         $locale = $request->session()->get('user.language');
    //     }
    //     App::setLocale($locale);

    //     return $next($request);
    // }

    public function handle($request, Closure $next)
    {
        if(\Session::has('locale')){
        \App::setLocale(\Session::get('locale'));
        //The default Language in Config/App.php is English      
        }
        return $next($request);
    }

}
