{CompositeDisposable} = require 'atom'
osc                   = require 'node-osc'
provider              = require './atom-sonic-autocomplete'

module.exports = AtomSonic =
  subscriptions: null
  provide: -> provider

  activate: (state) ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add(atom.commands.add 'atom-workspace',
      'atom-sonic:play-file':      => @play('getText'),
      'atom-sonic:play-selection': => @play('getSelectedText'),
      'atom-sonic:stop':           => @stop())

  deactivate: ->
    @subscriptions.dispose()

  play: (selector) ->
    editor = atom.workspace.getActiveTextEditor()
    source = editor[selector]()
    @send '/run-code', '0', source
    atom.notifications.addSuccess "Sent source code to Sonic Pi."

  stop: ->
    @send '/stop-all-jobs'
    atom.notifications.addInfo "Told Sonic Pi to stop playing."

  send: (args...) ->
    client = new osc.Client('localhost', 4557)
    client.send args..., -> client.kill()
