
console.log("gardens.js here");

$(document).ready(function() {

  const $gardens = $(".list-group").children();

  $gardens.each(function() {
    var $links = $(this).find('href');
  
    console.log($links);
  });
}
);
