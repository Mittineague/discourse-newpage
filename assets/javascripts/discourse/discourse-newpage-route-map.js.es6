export default function() {
  this.route('newpage', function(){
    this.route('index', {path: '/'});
  });
}
