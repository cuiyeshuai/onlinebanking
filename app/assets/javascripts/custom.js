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