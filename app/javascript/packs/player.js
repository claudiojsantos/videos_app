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

$("#btn_play").on("click", function(){
    player.src([{type: "application/x-mpegURL", src: $("#ipt_url").val()}])
    player.play()
})