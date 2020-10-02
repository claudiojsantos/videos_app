let options= {
    "controls": true,
    "autoplay": true,
    "preload": "auto",
    "data-setup": {
        "liveui": true,
        "fluid": true
    }
}

let player = videojs("player", options, function () {})

player.on('play', function(){
    $.ajax({
        method: 'get',
        url: `/view_increment/${$("#code").val()}`,
    }).done(function(data){
        alert(data)
    })
})