function redirect(url) {
    window.location = url;
}

// Function written by <laug (at) via.ecp.fr>
// See http://www.via.ecp.fr/spamproof.js
function spamproof() {
    var spans=document.getElementsByTagName("span");
    if (spans) {
        for (var i=0; i<spans.length; i++) {
            var span=spans[i];
            var css=span.getAttribute("class");
            var title=span.getAttribute("title");
            if (!css) css=span.getAttribute("className");
            if (css) {
                if (css.indexOf("spamproof")>=0) {
                    var email=span.innerHTML.replace(/<[^>]+>/g,"");
                    email=email.replace(/ \(at\) /g, "@");
                    email=email.replace(/ \(dot\) /g, ".");
                    email=email.replace(/\(at\)/g, "@");
                    email=email.replace(/\(dot\)/g, ".");
                    if (!title || title=="") title=email;
                    if(title=="notanemail"){
                        html=email;
                    } else {
                        html='<a href="mailto:'+email+'">'+title+'</a>';
                    }
                    span.innerHTML=html;
                }
            }
        }
    }
}
