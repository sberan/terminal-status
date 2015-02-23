CliStatusView = require './cli-status-view'

module.exports =
  cliStatusView: null

  activate: (state) ->
    createStatusEntry = =>
      @cliStatusView = new CliStatusView(state.cliStatusViewState)

    atom.packages.once 'activated', ->
      createStatusEntry()

  deactivate: ->
    @cliStatusView.destroy()

  # serialize: ->
  #   cliStatusViewState: @cliStatusView.serialize()

  configDefaults:
    'WindowHeight': 300
