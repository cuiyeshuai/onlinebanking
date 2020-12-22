function showText() {
    console.log("Text is alert")
    window.alert("working!!")

}




var themes = {
    "default": "",
    "cerulean" : "https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/cerulean/bootstrap.min.css",
    "cosmo" : "https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/cosmo/bootstrap.min.css",
    "cyborg" : "https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/cyborg/bootstrap.min.css",
    "flatly" : "https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/flatly/bootstrap.min.css",
    "journal" : "https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/journal/bootstrap.min.css",
    "simplex" : "https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/simplex/bootstrap.min.css",
    "slate" : "https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/slate/bootstrap.min.css",
    "litera" : "https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/litera/bootstrap.min.css",
    "spacelab" : "https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/spacelab/bootstrap.min.css",
    "united" : "https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/united/bootstrap.min.css"
}
$(function(){
   var themesheet = $('<link href="'+themes['default']+'" rel="stylesheet" />');
    themesheet.appendTo('head');
    $('.theme-link').click(function(){
       var themeurl = themes[$(this).attr('data-theme')]; 
        themesheet.attr('href',themeurl);
    });
});


function createCookie(name, value, days) {
    var expires = '',
        date = new Date();
    if (days) {
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = '; expires=' + date.toGMTString();
    }
    document.cookie = name + '=' + value + expires + '; path=/';
}
 
function readCookie(name) {
    var nameEQ = name + '=',
        allCookies = document.cookie.split(';'),
        i,
        cookie;
    for (i = 0; i < allCookies.length; i += 1) {
        cookie = allCookies[i];
        while (cookie.charAt(0) === ' ') {
            cookie = cookie.substring(1, cookie.length);
        }
        if (cookie.indexOf(nameEQ) === 0) {
            return cookie.substring(nameEQ.length, cookie.length);
        }
    }
    return null;
}
 
function eraseCookie(name) {
    createCookie(name, '', -1);
}