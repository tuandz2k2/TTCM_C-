var passwordStrength;
window.wp = window.wp || {},
    function(s) {
        wp.passwordStrength = {
            meter: function(n, t, e) { return s.isArray(t) || (t = [t.toString()]), n != e && e && 0 < e.length ? 5 : void 0 === window.zxcvbn ? -1 : zxcvbn(n, t).score },
            userInputBlacklist: function() {
                var n, t, e, r, i = [],
                    a = [],
                    o = ["user_login", "first_name", "last_name", "nickname", "display_name", "email", "url", "description", "weblog_title", "admin_email"];
                for (i.push(document.title), i.push(document.URL), t = o.length, n = 0; n < t; n++) 0 !== (r = s("#" + o[n])).length && (i.push(r[0].defaultValue), i.push(r.val()));
                for (e = i.length, n = 0; n < e; n++) i[n] && (a = a.concat(i[n].replace(/\W/g, " ").split(" ")));
                return a = s.grep(a, function(n, t) { return !("" === n || n.length < 4) && s.inArray(n, a) === t })
            }
        }, passwordStrength = wp.passwordStrength.meter
    }(jQuery);