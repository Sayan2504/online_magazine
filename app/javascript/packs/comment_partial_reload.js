$( document ).on("turbolinks:load", function()
{
   setInterval(function() {
     $("#commment_thread").load("/articles/comments_reload");
 }, 2000);
});