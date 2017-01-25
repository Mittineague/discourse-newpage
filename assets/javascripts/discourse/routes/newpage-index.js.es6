import { ajax } from 'discourse/lib/ajax';
export default Discourse.Route.extend({
  model(opts) {
  	return ajax("/newpage");
  },

  setupController(controller, model) {
    controller.setProperties({ model });
  }
});