
$(function() {
  $( "#autocomplete" ).autocomplete({
      source: function( request, response ) {
          $.ajax({
              dataType: "json",
              type : 'Get',
              url: 'http://bases.gouv2.fr/bases/search?q='+request.term,
              success: function(data) {
                  $('autocomplete').removeClass('ui-autocomplete-loading');  
                  // hide loading image
  
                  response(data);
              },
              error: function(data) {
                  $('autocomplete').removeClass('ui-autocomplete-loading');  
              }
          });
      },
      minLength: 4
  });
});

var replaceWith = $('<textarea name="temp" cols="100" rows="10"/>'),
    connectWith = $('input[name="hiddenField"]');
    
    
$(function() {
  $( "#autocomplete" ).on( "autocompleteselect", function( event, ui ) {
    
    // Clear previous display
    $("#main-panel").empty();
    $("#main-panel").append('<h1 class="page-header" id="base_nom"></h1>'+
          '<h2 id="base_acronyme"></h2>'+
          '<h3 id="base_gestionnaire"></h3>'+
          '<p id="base_description"></p>'+
          '<ul id="base_textes"></ul>'+
          '<ul id="base_alimentation"></ul>'+
          '<p id="base_url"></p>'+
          '<p id="base_references"></p>'+
          '<p id="base_datasets"></p>'+
          '<p id="base_wikidata"></p>'+
          '<p id="base_commentaire"></p>');
    
    $('#base_nom').text("");
    $('#base_gestionnaire').text("");
    $('#base_acronyme').text("");
    $('#base_description').text("");
    $('#base_description').show();
    replaceWith.hide();
    
// Inline edit du champ description: http://jsfiddle.net/egstudio/aFMWg/1/
$(function() {
  $( "#base_description" ).click(function() {
     $("#base_description").hide();
     replaceWith.show();
     $("#base_description").after(replaceWith);
     replaceWith.val($("#base_description").text());
     replaceWith.focus();
     replaceWith.blur(function() {
       $.ajax({
         dataType: "json",
         type : 'Get',
         url: 'http://bases.gouv2.fr/bases/update?base='+$("#base_nom").text()+'&attribut=description&valeur='+replaceWith.val()
         
       });
       $('#base_description').show();
       replaceWith.hide();
       $("#base_description").text(replaceWith.val());
       
       });
  });
});

// Inline edit du champ nom
$(function() {
  $( "#base_nom" ).click(function() {
     $("#base_nom").hide();
     replaceWith.show();
     $("#base_nom").after($('<textarea id="base_nom_edit" cols="100" rows="1"/>'));
     $("#base_nom_edit").val($("#base_nom").text());
     $("#base_nom_edit").focus();
     $("#base_nom_edit").blur(function() {
       
       $('#base_nom').show();
       $("#base_nom_edit").hide();
       
       $.ajax({
         dataType: "json",
         type : 'Get',
         url: 'http://bases.gouv2.fr/bases/update?base='+$("#base_nom").text()+'&attribut=nom&valeur='+$("#base_nom_edit").val()
         
       });
       
       $("#base_nom").text($("#base_nom_edit").val());
       
     });
  });
});
    
    //Afficher les données relatives à la base
    $.getJSON("http://bases.gouv2.fr/bases?q="+$(ui)[0].item.value, function(json){
      $('#base_nom').text(json.nom);
      $('#base_acronyme').text(json.acronyme);
      $('#base_gestionnaire').text(json.gestionnaire);
      $('#base_description').text(json.description);
      $('#base_textes').text(json.textes);
      $('#base_alimentation').text(json.alimentation);
      $('#base_url').text(json.url);
      $('#base_references').text(json.references);
      $('#base_commentaire').text(json.commentaire);
      $('#base_datasets').text(json.datasets);
      $('#base_wikidata').text(json.wikidata);
    });
  
} ); });

$(function() {
  $("#visualisations").click(function() {
    console.log("OKOKOK");
    $("#main-panel").empty();
  });
});