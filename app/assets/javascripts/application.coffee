# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https:#github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require chosen
#= require leaflet
#= require bootstrap

#= require_tree .



window.MakerMap = {}
exports = MakerMap


MakerMap.setup = () ->
  $(".chosen-select").chosen()

  options = {
    align: 'center',
    autoResize: false,
    comparator: null,
    container: $('body'),
    direction: undefined,
    ignoreInactiveItems: true,
    itemWidth: 0,
    fillEmptySpace: false,
    flexibleWidth: 0,
    offset: 2,
    onLayoutChanged: undefined,
    outerOffset: 0,
    possibleFilters: [],
    resizeDelay: 50,
    verticalOffset: undefined
  }
  $('.wookmarkable').wookmark(options)

  # Bring online fancy markdown editor
  if $("textarea").length > 0
    editor = new Editor()
    editor.render()

  return


# Fire setup event whenever the page loads
$(document).ready( MakerMap.setup )
$(document).on('page:load', MakerMap.setup )
