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
#= require wookmark-jquery
#= require jquery.minicolors


#= require_tree .


window.MakerMap = {}
exports = MakerMap
options = {
  align: 'center',
  autoResize: true,
  comparator: null,
  container: $('.wookmarkable'),
  direction: undefined,
  ignoreInactiveItems: true,
  itemWidth: 300,
  fillEmptySpace: false,
  flexibleWidth: "100%",
  offset: 0,
  onLayoutChanged: undefined,
  outerOffset: 0,
  possibleFilters: [],
  resizeDelay: 10,
  verticalOffset: 20
}

MakerMap.setup = () ->
  $(document).on 'ajax:success', 'a.vote', (status,data,xhr)->
    # the `data` parameter is the decoded JSON object
    $(".votes-count[data-id=#{data.id}]").text ":D"
    return

  # Bring online fancy markdown editor
  if $("textarea").length > 0
    editor = new Editor()
    editor.render()


  $('.wookmarkable').imagesLoaded(
    $('.wookmarkable').wookmark(options)
  )

  return


# Fire setup event whenever the page loads
$(document).ready( MakerMap.setup )
$(document).on('page:load', MakerMap.setup )

$(window).load ->
  $('.wookmarkable').wookmark(options)
