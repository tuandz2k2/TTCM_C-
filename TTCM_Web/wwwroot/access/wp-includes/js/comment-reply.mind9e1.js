var addComment = {
    moveForm: function(e, t, n, o) {
        var r, i, d, m = this,
            l = m.I(e),
            a = m.I(n),
            c = m.I("cancel-comment-reply-link"),
            s = m.I("comment_parent"),
            e = m.I("comment_post_ID"),
            p = a.getElementsByTagName("form")[0];
        if (l && a && c && s && p) {
            m.respondId = n, o = o || !1, m.I("wp-temp-form-div") || ((m = document.createElement("div")).id = "wp-temp-form-div", m.style.display = "none", a.parentNode.insertBefore(m, a)), l.parentNode.insertBefore(a, l.nextSibling), e && o && (e.value = o), s.value = t, c.style.display = "", c.onclick = function() {
                var e = addComment,
                    t = e.I("wp-temp-form-div"),
                    n = e.I(e.respondId);
                if (t && n) return e.I("comment_parent").value = "0", t.parentNode.insertBefore(n, t), t.parentNode.removeChild(t), this.style.display = "none", this.onclick = null, !1
            };
            try {
                for (var f = 0; f < p.elements.length; f++)
                    if (r = p.elements[f], d = !1, "getComputedStyle" in window ? i = window.getComputedStyle(r) : document.documentElement.currentStyle && (i = r.currentStyle), (r.offsetWidth <= 0 && r.offsetHeight <= 0 || "hidden" === i.visibility) && (d = !0), "hidden" !== r.type && !r.disabled && !d) { r.focus(); break }
            } catch (e) {}
            return !1
        }
    },
    I: function(e) { return document.getElementById(e) }
};