$(document).ready(function () {
  $("#preview-copy").click(function () {
    console.log("copying");
    new Clipboard("#preview-copy");
  });
});
