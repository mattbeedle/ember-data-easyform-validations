`import Ember from 'ember'`

Router = Ember.Router.extend
  location: EmberDataEasyformValidationsENV.locationType

Router.map () ->
  @resource 'users', ->
    @route 'new'

`export default Router`
