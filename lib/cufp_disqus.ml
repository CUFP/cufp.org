open Core.Std
open Async.Std
module Html = Cufp_html

let script_text = "
  var disqus_shortname = 'cufp';

  (function() {
    var dsq = document.createElement('script');
    dsq.type = 'text/javascript';
    dsq.async = true;
    dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
   })();
"

let html =
  let open Html in
  [
    div ~a:["id", "disqus_thread"] [];
    script ~a:["type","text/javascript"] [data script_text];
  ]
