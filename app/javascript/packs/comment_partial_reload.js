$(document).ready(
  function() {
   setInterval(function() {
     $("#commment_section").load("#comments_section_reload #commment_section");
 }, 60000);
});