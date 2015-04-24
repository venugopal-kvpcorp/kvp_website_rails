(function() {
  this.init_submit_continue = function() {
    var continue_editing_button;
    $("#submit_continue_button").click(submit_and_continue);
    $("form").change(function(e) {
      return $(this).attr("data-changes-made", true);
    });
    if ((continue_editing_button = $("#continue_editing")).length > 0 && continue_editing_button.attr("rel") !== "no-prompt") {
      $("#editor_switch a").click(function(e) {
        if ($("form[data-changes-made]").length > 0) {
          if (!confirm("translation missing: en.js.admin.confirm_changes")) {
            return e.preventDefault();
          }
        }
      });
    }
    return $("input[id=page_custom_slug]").change(function() {
      return $("#submit_continue_button").remove();
    });
  };

}).call(this);
