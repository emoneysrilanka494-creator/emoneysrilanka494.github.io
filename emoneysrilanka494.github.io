<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MR.StatusVideo - Download WhatsApp Status Videos</title>
<style>
    body{ font-family: Arial,sans-serif; background:#f1f1f1; margin:0; padding:0;}
    header{ background:#000; color:#fff; padding:15px; text-align:center; font-size:22px; font-weight:bold;}
    .container{ max-width:750px; margin:auto; padding:20px;}
    .video-box{ background:#fff; padding:15px; border-radius:10px; box-shadow:0 0 10px rgba(0,0,0,0.1); margin-bottom:20px;}
    video{ width:100%; border-radius:10px;}
    .btn{ display:block; width:100%; padding:12px; margin-top:10px; font-size:18px; font-weight:bold; border:none; border-radius:8px; cursor:pointer; text-align:center; text-decoration:none;}
    .download-btn{ background:#2196f3; color:white;}
    .like-btn{ background:#e91e63; color:white;}
    .share-btn{ background:#4caf50; color:white;}
    #comments div{ background:#e9e9e9; padding:10px; border-radius:6px; margin-top:10px;}
</style>
</head>
<body>

<header>MR.StatusVideo</header>

<div class="container">
<div class="video-box">
<h2>🎬 Watch & Download Status Video</h2>

<video controls>
    <source src="DROPBOX_VIDEO_LINK" type="video/mp4">
</video>

<button class="btn like-btn" onclick="likeVideo()">❤️ Like (<span id="likeCount">0</span>)</button>
<a class="btn download-btn" href="DROPBOX_VIDEO_LINK" download>⬇ Download Video</a>
<button class="btn share-btn" onclick="share()">📤 Share This Video</button>

<hr>
<h3>💬 Add a Comment</h3>
<input type="text" id="commentInput" placeholder="Write a comment..." style="width:100%;padding:10px;border-radius:5px;">
<button class="btn" style="background:#000;color:white;" onclick="addComment()">Post</button>

<div id="comments"></div>
</div>
</div>

<script>
let likeCount=0;
function likeVideo(){likeCount++;document.getElementById("likeCount").innerText=likeCount;}
function addComment(){let text=document.getElementById("commentInput").value;if(text.trim()==="")return;let c=document.createElement("div");c.innerText=text;document.getElementById("comments").appendChild(c);document.getElementById("commentInput").value="";}
function share(){navigator.share({title:'MR.StatusVideo',text:'Check out this cool video!',url:window.location.href}).catch(console.error);}
</script>

</body>
</html>
