
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>YouTube Tools – eMoney Sri Lanka</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="theme-color" content="#dc2626">

<style>
body{
  margin:0;
  font-family:system-ui, Arial, sans-serif;
  background:#020617;
  color:#fff;
}
header{
  background:#dc2626;
  padding:14px;
  text-align:center;
  font-size:20px;
  font-weight:700;
}
.container{
  padding:15px;
}
.card{
  background:#020617;
  border:1px solid #1e293b;
  border-radius:12px;
  padding:15px;
  margin-bottom:15px;
}
h2{
  font-size:18px;
  margin-bottom:10px;
  color:#facc15;
}
input,textarea,button{
  width:100%;
  padding:12px;
  margin-top:8px;
  border-radius:8px;
  border:none;
  font-size:16px;
}
textarea{min-height:120px;}
button{
  background:#22c55e;
  font-weight:700;
  cursor:pointer;
}
button:active{transform:scale(0.98);}
canvas{
  width:100%;
  background:#000;
  border-radius:10px;
  margin-top:10px;
}
.note{
  font-size:13px;
  opacity:.7;
  margin-top:5px;
}
</style>
</head>

<body>

<header>🎬 YouTube Tools App</header>

<div class="container">

  <div class="card">
    <h2>🎯 Video Topic</h2>
    <input id="topic" placeholder="Ex: Make money online Sri Lanka">
  </div>

  <div class="card">
    <h2>🔥 AI Title Generator</h2>
    <button onclick="genTitles()">Generate Titles</button>
    <textarea id="titleOut" placeholder="AI titles here..."></textarea>
  </div>

  <div class="card">
    <h2>🏷 AI Tags Generator</h2>
    <button onclick="genTags()">Generate Tags</button>
    <textarea id="tagOut" placeholder="AI tags here..."></textarea>
  </div>

  <div class="card">
    <h2>📝 AI Description Generator</h2>
    <button onclick="genDesc()">Generate Description</button>
    <textarea id="descOut" placeholder="AI description here..."></textarea>
  </div>

  <div class="card">
    <h2>🖼 Thumbnail Maker</h2>
    <input id="thumbText" placeholder="Thumbnail Text">
    <button onclick="drawThumb()">Draw Thumbnail</button>
    <canvas id="thumb" width="1280" height="720"></canvas>
    <button onclick="downloadThumb()">Download</button>
    <div class="note">1280 × 720 – YouTube Recommended</div>
  </div>

</div>

<script>
/* ================= CONFIG ================= */
const WORKER_URL="https://yt-tools-ai.piyumibagya34.workers.dev";

/* ============ DAILY LIMIT ============ */
function allowAI(){
  let used=Number(localStorage.getItem("ai_used")||0);
  if(used>=5){
    alert("Daily free limit reached 🚫");
    return false;
  }
  localStorage.setItem("ai_used",used+1);
  return true;
}

/* ============ AI CALL ============ */
async function callAI(prompt){
  const res=await fetch(WORKER_URL,{
    method:"POST",
    headers:{"Content-Type":"application/json"},
    body:JSON.stringify({prompt})
  });
  const data=await res.json();
  return data.text;
}

/* ============ AI TOOLS ============ */
async function genTitles(){
  if(!allowAI())return;
  const t=topic.value.trim();
  if(!t)return alert("Enter topic");
  titleOut.value="Generating...";
  titleOut.value=await callAI(
    `Generate 5 viral YouTube titles.
     Language: Sinhala-English mix.
     Topic: ${t}`
  );
}

async function genTags(){
  if(!allowAI())return;
  const t=topic.value.trim();
  if(!t)return alert("Enter topic");
  tagOut.value="Generating...";
  tagOut.value=await callAI(
    `Generate 30 SEO YouTube tags, comma separated.
     Topic: ${t}`
  );
}

async function genDesc(){
  if(!allowAI())return;
  const t=topic.value.trim();
  if(!t)return alert("Enter topic");
  descOut.value="Generating...";
  descOut.value=await callAI(
    `Write a YouTube description in Sinhala-English mix.
     Topic: ${t}
     Include intro, bullet points, CTA, hashtags`
  );
}

/* ============ THUMBNAIL ============ */
const c=document.getElementById("thumb");
const ctx=c.getContext("2d");

function drawThumb(){
  const txt=thumbText.value||"NEW VIDEO";
  ctx.fillStyle="#020617";
  ctx.fillRect(0,0,c.width,c.height);
  ctx.textAlign="center";
  ctx.textBaseline="middle";
  ctx.font="bold 100px sans-serif";
  ctx.strokeStyle="#000";
  ctx.lineWidth=10;
  ctx.fillStyle="#fff";
  ctx.strokeText(txt,c.width/2,c.height/2);
  ctx.fillText(txt,c.width/2,c.height/2);
}

function downloadThumb(){
  const a=document.createElement("a");
  a.href=c.toDataURL("image/png");
  a.download="thumbnail.png";
  a.click();
}
</script>

</body>
</html>
