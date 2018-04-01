// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on("turbolinks:load", () => {
  var microm = new Microm();
  var mpeg = null;
  var play = document.getElementById('play');
  var pause = document.getElementById('pause');
  var isRecording = false;

  var toggleRecording = function() {
    if (isRecording) {
      play.classList.remove('hidden');
      pause.classList.add('hidden');
    } else {
      play.classList.add('hidden');
      pause.classList.remove('hidden');
    }
    isRecording = !isRecording;
  }

  var startAudioCapture = function(e) {
    if (!isRecording) {
      toggleRecording();
      microm.record()
        .catch(() => { alert('error recording') });
    }
  };

  var endAudioCapture = function(e) {
    if (isRecording) {
      toggleRecording();
      microm.stop().then(function(result) {
        // mpeg = result;

        microm.play();
      });
    }
  };

  play.addEventListener("click", startAudioCapture, true);
  pause.addEventListener("click", endAudioCapture, true);
});
