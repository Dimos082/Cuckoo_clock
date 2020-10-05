# Define a time and date format (12 hours)
$time = Get-Date -Format "h:mm"

# Assign a cuckoo sound to a function
$PlayWav=New-Object System.Media.SoundPlayer
$PlayWav.SoundLocation=’http://wmail.fhl.net/openwebmail/sounds/cuckoo.wav’
  
# Make it sound in correspondence to number of hours (1-12 format) like real cuckoo clock does
# + 1 time cuckoo sound each time is is :30 minutes
switch ($time){
    1:00 {$PlayWav.playsync(); Break}
    2:00   {1..2 | % {$PlayWav.playsync()}; Break}
    3:00   {1..3 | % {$PlayWav.playsync()}; Break}
    4:00   {1..4 | % {$PlayWav.playsync()}; Break}
    5:00   {1..5 | % {$PlayWav.playsync()}; Break}
    6:00   {1..6 | % {$PlayWav.playsync()}; Break}
    7:00   {1..7 | % {$PlayWav.playsync()}; Break}
    8:00   {1..8 | % {$PlayWav.playsync()}; Break}
    9:00   {1..9 | % {$PlayWav.playsync()}; Break}
    10:00 {1..10 | % {$PlayWav.playsync()}; Break}
    11:00 {1..11 | % {$PlayWav.playsync()}; Break}
    12:00 {1..12 | % {$PlayWav.playsync()}; Break}
    $time {$PlayWav.playsync();Break}
  } 

# Adding a voice engine to the clock
Add-Type -AssemblyName System.Speech
$SpeechSynth = New-Object System.Speech.Synthesis.SpeechSynthesizer
$SpeechSynth.Speak("The time is")
$SpeechSynth.Speak($time)

# To make it run correctly in Jenkins you need to enable "Build pereodically" checkbox under "Building triggers" 
# And put the following into "Schedule" field:
# 0 * * * * 
# 30 * * * *
