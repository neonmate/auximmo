// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require unpoly
//= require unpoly-bootstrap3
//= require_tree .


// immobile-state-switcher

$(document).ready(function() {

  function ImmobileStateSwitcher(state_buttons) {

    var $state_buttons = $(state_buttons);

    var initialize = function() {
      $state_buttons.on('click', 'button', function () {
        var immobile_identifier = $(this).data('immobile-identifier');
        var immobile_state = $(this).data('immobile-state');
        update_immobile(this, immobile_identifier, immobile_state);
      })
    };

    var update_immobile = function(current_button, immobile_identifier, immobile_state) {
      $.ajax({
        url: "/immobiles/" + immobile_identifier,
        data : {'immobile_state': immobile_state},
        type : 'PATCH'
      }).done(function() {
        toggle_buttons(current_button);
      });
    }

    var toggle_buttons = function(current_button) {
      var active_class = $(current_button).data('active-class');
      $(current_button).siblings().removeClass().each(function () {
        $(this).addClass('btn btn-default');
      });
      $(current_button).removeClass().addClass(active_class);
    };

    return {
      initialize: initialize
    };
  }

  function CommentUpdater(comment_field) {

    var comment_field = $(comment_field);

    var initialize = function() {
      comment_field.on('change', function () {
        var comment = $(this).val();
        var immobile_identifier = $(this).data('immobile-identifier');
        $.ajax({
          url: "/immobiles/" + immobile_identifier,
          data : {'immobile_comment': comment},
          type : 'PATCH'
        });
      })
    };

    return {
      initialize: initialize
    };
  }


  var immobile_state_checker = ImmobileStateSwitcher('.immobile-state-switcher');
  immobile_state_checker.initialize();

  var comment_updater = CommentUpdater('.immobile-comment');
  comment_updater.initialize();

});