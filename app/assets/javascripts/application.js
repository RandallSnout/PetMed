	// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require materialize-sprockets


$(document).ready(function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.login').click(function(){
    	$('#log1').openModal();
    })
    $('.modal-trigger').leanModal();
    $(".dropdown-button").dropdown();

    // $('.register1').click(function(){
    // 	$('#register').openModal();
    // })
    // $('.modal-trigger').leanModal();
    // $(".dropdown-button").dropdown();


    $('.slider').slider({full_width: true});


  });

