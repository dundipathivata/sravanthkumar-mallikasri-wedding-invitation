<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WEDDING INVITATION</title>
    <style>
        /* Base Styling & Theme */
        :root {
            --bg-color: #e2edd5; /* Sage green background from video */
            --card-bg: #ffffff;
            --text-color: #2c4a3e;
            --accent-color: #f894cd; /* Gold accents */
            --romantic-font: 'Georgia', serif;
        }

        body {
            margin: 0;
            padding: 0;
            background-color: var(--bg-color);
            font-family: var(--romantic-font);
            color: var(--text-color);
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            overflow-x: hidden; /* Prevents horizontal scrollbars from falling flowers */
        }

        /* --- COLORFUL FALLING FLOWERS STYLING --- */
        .flower {
            position: fixed;
            top: -20px;
            z-index: 9999;
            pointer-events: none; /* Allows users to click elements behind the flowers */
            border-radius: 50% 0 50% 50%; /* Traditional petal/flower teardrop shape */
            opacity: 0.85;
            animation: fall linear infinite;
        }

        @keyframes fall {
            0% {
                transform: translateY(0) rotate(0deg) translateX(0);
                opacity: 0.85;
            }
            50% {
                transform: translateY(50vh) rotate(360deg) translateX(40px); /* Swaying motion */
            }
            100% {
                transform: translateY(110vh) rotate(720deg) translateX(-20px);
                opacity: 0;
            }
        }

        /* --- BACKGROUND MUSIC PLAYER BAR --- */
        .music-player {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: rgba(255, 255, 255, 0.95);
            padding: 10px 15px;
            border-radius: 30px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
            display: flex;
            align-items: center;
            gap: 10px;
            z-index: 10000;
            border: 1px solid var(--accent-color);
        }

        .music-btn {
            background: var(--text-color);
            color: white;
            border: none;
            border-radius: 50%;
            width: 35px;
            height: 35px;
            cursor: pointer;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* 1. Envelope Opening Section */
        .envelope-container {
            perspective: 1000px;
            margin: 40px auto;
            cursor: pointer;
            text-align: center;
        }

        .envelope {
            width: 300px;
            height: 200px;
            background: #fdfbf7;
            border: 2px solid #dfd8ca;
            border-radius: 4px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: transform 0.5s ease;
        }

        .envelope::after {
            content: "✨ CLICK TO OPEN ✨";
            font-size: 0.9rem;
            color: var(--accent-color);
            font-weight: bold;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

        /* 2. Main Content Card (Initially Hidden) */
        .invitation-card {
            max-width: 500px;
            width: 90%;
            background: var(--card-bg);
            margin: 20px auto;
            padding: 40px 20px;
            border-radius: 12px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.05);
            text-align: center;
            display: none; /* Controlled by JS */
            animation: slideUp 0.8s ease forwards;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h1 {
            font-size: 2.5rem;
            margin: 10px 0;
            font-weight: normal;
        }

        .gantt-divider {
            color: var(--accent-color);
            font-size: 1.5rem;
            margin: 15px 0;
        }

        /* --- FLORAL IMAGE FRAME STYLING --- */
        .couple-frame-container {
            position: relative;
            width: 220px;
            height: 220px;
            margin: 25px auto;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .floral-border {
            position: absolute;
            width: 100%;
            height: 100%;
            background-image: url('https://www.pngarts.com/files/12/Vector-Floral-Frame-PNG-Image.png'); /* Elegant vector floral circular wreath base */
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            z-index: 2;
            pointer-events: none;
        }

        .couple-photo {
            width: 170px;
            height: 170px;
            border-radius: 50%;
            object-fit: cover;
            z-index: 1;
            border: 3px solid #fff;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        /* 3. Countdown Timer Layout */
        .countdown-container {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin: 30px 0;
            background: #fdfbf7;
            padding: 15px;
            border-radius: 8px;
        }

        .time-box {
            display: flex;
            flex-direction: column;
            align-items: center;
            min-width: 60px;
        }

        .time-box span:first-child {
            font-size: 1.8rem;
            font-weight: bold;
        }

        .time-box span:last-child {
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #888;
        }

        /* 4. Event Schedules Section */
        .event-schedule {
            margin-top: 40px;
            text-align: left;
            padding: 0 10px;
        }

        .event-item {
            border-left: 3px solid var(--accent-color);
            padding-left: 20px;
            margin-bottom: 30px;
            position: relative;
        }

        .event-item h3 {
            margin: 0 0 5px 0;
            color: var(--text-color);
        }

        /* --- SCRATCH CARD INTERACTIVE ELEMENTS --- */
        .scratch-wrapper {
            position: relative;
            display: inline-block;
            margin-top: 5px;
            vertical-align: middle;
            user-select: none;
            -webkit-user-select: none;
        }

        .scratch-canvas {
            position: absolute;
            top: 0;
            left: 0;
            cursor: pointer;
            z-index: 5;
            border-radius: 4px;
        }

        .hidden-time-content {
            display: block;
            background: #fdfbf7;
            padding: 6px 12px;
            font-weight: bold;
            color: var(--text-color);
            border: 1px dashed var(--accent-color);
            border-radius: 4px;
            visibility: hidden; /* Turned visible via JS initialization to avoid layout flashing */
        }

        .scratch-hint {
            font-size: 0.75rem;
            color: var(--accent-color);
            font-style: italic;
            margin-left: 10px;
            display: inline-block;
        }

        /* Map Embed Container */
        .map-container {
            margin-top: 30px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }
    </style>
</head>
<body>

    <audio id="marriageBgm" loop>
        <source src="https://www.image2url.com/r2/default/audio/1781381312878-9b382783-b44c-4716-abf2-b3bef2832ce8.mp3" type="audio/mpeg">
    </audio>

    <div class="music-player">
        <span style="font-size: 0.85rem; font-family: sans-serif;">🎵 LOVE</span>
        <button class="music-btn" id="playBtn" onclick="toggleMusic()">▶️</button>
    </div>

    <div class="envelope-container" id="envelopeWrapper" onclick="openInvitation()">
        <div class="envelope"></div>
    </div>

    <div class="invitation-card" id="mainInvitation">
        <p style="letter-spacing: 2px;">WE INVITE YOU TO CELEBRATE</p>
        
        <h1>SRI MALLIKA</h1>
        <div class="gantt-divider">&</div>
        <h1>SRAVANTH KUMAR's</h1>
        
        <!-- --- EMBEDDED FLORAL PHOTO FRAME --- -->
        <div class="couple-frame-container">
            <div class="floral-border"></div>
            <!-- Replace placeholder below with your sister and bava's photo link -->
            <img src="https://plain-apac-prod-public.komododecks.com/202606/14/XtoUVq7KsDJn1BIrnQha/image.jpg" class="couple-photo" alt="Couple Portrait">
        </div>

        <p style="margin-top: 20px; font-style: italic;">WEDDING TOGETHER WITH THEIR FAMILIES</p>

        <div class="countdown-container">
            <div class="time-box"><span id="days">00</span><span>Days</span></div>
            <div class="time-box"><span id="hours">00</span><span>Hrs</span></div>
            <div class="time-box"><span id="minutes">00</span><span>Min</span></div>
            <div class="time-box"><span id="seconds">00</span><span>Sec</span></div>
        </div>

        <hr style="border: 0; border-top: 1px solid #eee; margin: 30px 0;">

        <h2>Events Schedule</h2>
        <div class="event-schedule">
            <div class="event-item">
                <h3>MEHENDI</h3>
                <p>📅 TUESDAY EVENING, JUNE 16, 2026</p>
                <div class="scratch-wrapper">
                    <div class="hidden-time-content">🕒 04:00 PM onwards</div>
                    <canvas class="scratch-canvas"></canvas>
                </div>
                <span class="scratch-hint">Scratch to reveal time! ✨</span>
            </div>
            <div class="event-item">
                <h3>PELLI KUTHURU</h3>
                <p>📅 WEDNESDAY MORNING, JUNE 17, 2026</p>
                <div class="scratch-wrapper">
                    <div class="hidden-time-content">🕒 07:00 AM onwards</div>
                    <canvas class="scratch-canvas"></canvas>
                </div>
                <span class="scratch-hint">Scratch to reveal time! ✨</span>
            </div>
            <div class="event-item">
                <h3>PELLI KODUKU</h3>
                <p>📅 WEDNESDAY MORNING, JUNE 17, 2026</p>
                <div class="scratch-wrapper">
                    <div class="hidden-time-content">🕒 07:00 AM onwards</div>
                    <canvas class="scratch-canvas"></canvas>
                </div>
                <span class="scratch-hint">Scratch to reveal time! ✨</span>
            </div>
            <div class="event-item">
                <h3>HALDI</h3>
                <p>📅 WEDNESDAY EVENING, JUNE 17, 2026</p>
                <div class="scratch-wrapper">
                    <div class="hidden-time-content">🕒 06:00 PM onwards</div>
                    <canvas class="scratch-canvas"></canvas>
                </div>
                <span class="scratch-hint">Scratch to reveal time! ✨</span>
            </div>
            <div class="event-item">
                <h3>SANGEETH</h3>
                <p>📅 THURSDAY EVENING, JUNE 18, 2026</p>
                <div class="scratch-wrapper">
                    <div class="hidden-time-content">🕒 04:00 PM onwards</div>
                    <canvas class="scratch-canvas"></canvas>
                </div>
                <span class="scratch-hint">Scratch to reveal time! ✨</span>
            </div>
            <div class="event-item">
                <h3>The Wedding (Muhurtham)</h3>
                <h3>AT DWARAKA TIRUMALA ,MANDAPAM 10 </h3>
                <p>📅 FRIDAY, JUNE 19, 2026</p>
                <div class="scratch-wrapper">
                    <div class="hidden-time-content">🕒 09:15 PM</div>
                    <canvas class="scratch-canvas"></canvas>
                </div>
                <span class="scratch-hint">Scratch to reveal Muhurtham! 👑</span>
            </div>
        </div>

        <h2>Where We Celebrate</h2>
        <div class="map-container">
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1908.1966827264184!2d81.25671463136192!3d16.955190455887173!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a365b7ec0000001%3A0x8e25f5e869c3601b!2sSri%20Venkateswara%20Swamy%20Vari%20Devasthanam%20Dwaraka%20Tirumala!5e0!3m2!1sen!2sin!4v1781377509584!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </div>

    <script>
        const audio = document.getElementById("marriageBgm");
        const playBtn = document.getElementById("playBtn");

        // Combined function to open envelope, start music, drop flowers, and initialize canvases
        function openInvitation() {
            document.getElementById('envelopeWrapper').style.display = 'none';
            document.getElementById('mainInvitation').style.display = 'block';
            
            // Handles browser constraints to play music immediately on user interaction click
            audio.play().then(() => {
                playBtn.innerText = "⏸";
            }).catch(err => {
                console.log("Autoplay context waiting on manual play.");
            });

            // Spawns a new flower petal every 300 milliseconds
            setInterval(createFlowerPetal, 300);

            // Initialize the interactive scratch cards now that container card is displayed
            initScratchCards();
        }

        // BGM Playback toggle state controller
        function toggleMusic() {
            if (audio.paused) {
                audio.play();
                playBtn.innerText = "⏸";
            } else {
                audio.pause();
                playBtn.innerText = "▶️";
            }
        }

        // --- FLOWER GENERATION LOGIC ---
        const flowerColors = ['#ffb7c5', '#ff6b8b', '#ffd166', '#f4a261', '#e63946', '#ffccd5'];

        function createFlowerPetal() {
            const flower = document.createElement("div");
            flower.classList.add("flower");
            
            const randomColor = flowerColors[Math.floor(Math.random() * flowerColors.length)];
            flower.style.backgroundColor = randomColor;
            
            const size = Math.random() * 12 + 10 + "px";
            flower.style.width = size;
            flower.style.height = size;
            
            flower.style.left = Math.random() * window.innerWidth + "px";
            
            const speed = Math.random() * 3 + 4 + "s";
            flower.style.animationDuration = speed;
            
            document.body.appendChild(flower);

            setTimeout(() => {
                flower.remove();
            }, parseFloat(speed) * 1000);
        }

        // --- SCRATCH CARD SYSTEM LOGIC ---
        function initScratchCards() {
            const wrappers = document.querySelectorAll('.scratch-wrapper');
            
            wrappers.forEach(wrapper => {
                const content = wrapper.querySelector('.hidden-time-content');
                const canvas = wrapper.querySelector('.scratch-canvas');
                const ctx = canvas.getContext('2d');
                
                // Show the hidden textual content layout container dimensions safely
                content.style.visibility = 'visible';
                
                // Set canvas boundaries perfectly matching text elements dynamically
                const width = content.offsetWidth;
                const height = content.offsetHeight;
                canvas.width = width;
                canvas.height = height;
                
                // Draw luxury matte gold background overlay card layer
                ctx.fillStyle = '#dfba53';
                ctx.fillRect(0, 0, width, height);
                
                // Add stylized textures over gold scratch layer
                ctx.fillStyle = 'rgba(255,255,255,0.2)';
                for (let i = 0; i < 20; i++) {
                    ctx.fillRect(Math.random() * width, Math.random() * height, 4, 4);
                }

                // Scratch track state variables
                let isDrawing = false;

                function scratch(e) {
                    if (!isDrawing) return;
                    
                    // Normalize client touches vs desktop pointer coordinates
                    const rect = canvas.getBoundingClientRect();
                    const x = (e.clientX || e.touches[0].clientX) - rect.left;
                    const y = (e.clientY || e.touches[0].clientY) - rect.top;
                    
                    // Composition property configuration to remove overlay surface area paths
                    ctx.globalCompositeOperation = 'destination-out';
                    ctx.beginPath();
                    ctx.arc(x, y, 16, 0, Math.PI * 2); // 16px thickness brush size
                    ctx.fill();
                }

                // Event Listeners for both Desktop Mouse & Mobile Touch Displays
                canvas.addEventListener('mousedown', () => isDrawing = true);
                canvas.addEventListener('touchstart', () => isDrawing = true);
                
                window.addEventListener('mouseup', () => isDrawing = false);
                window.addEventListener('touchend', () => isDrawing = false);
                
                canvas.addEventListener('mousemove', scratch);
                canvas.addEventListener('touchmove', (e) => {
                    e.preventDefault(); // Prevents bounce scrolling on mobile devices while scratching
                    scratch(e);
                });
            });
        }

        // Live Countdown Clock Logic
        const weddingDate = new Date("JUNE 19, 2026 21:15:00").getTime();

        const timerInterval = setInterval(function() {
            const now = new Date().getTime();
            const distance = weddingDate - now;

            const d = Math.floor(distance / (1000 * 60 * 60 * 24));
            const h = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const m = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            const s = Math.floor((distance % (1000 * 60)) / 1000);

            document.getElementById("days").innerText = d < 10 ? "0" + d : d;
            document.getElementById("hours").innerText = h < 10 ? "0" + h : h;
            document.getElementById("minutes").innerText = m < 10 ? "0" + m : m;
            document.getElementById("seconds").innerText = s < 10 ? "0" + s : s;

            if (distance < 0) {
                clearInterval(timerInterval);
                document.querySelector(".countdown-container").innerHTML = "<h3>The Celebration Has Begun!</h3>";
            }
        }, 1000);
    </script>
</body>
</html>
