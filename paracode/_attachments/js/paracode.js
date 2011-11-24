/*
 * Copyright 2011 Stéphanie Vilayphiou and Alexandre Leray <echo@stdin.fr> for
 * Environ-Mentalism Salon.
 * 
 * This file is part of Closer Commenting.
 * 
 * Closer Commenting is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option)
 * any later version.
 * 
 * Closer Commenting is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 * more details.
 * 
 * You should have received a copy of the GNU General Public License along with
 * Closer Commenting.  If not, see <http://www.gnu.org/licenses/>.
 */


$(document).ready(function() {
    var db = $.couch.db("vj12");
    var elts;  // the last selected nodes
    var lock = true;

    // scrolls to with an animation
    function scrollTo (elt){
     	$('html,body').animate({
            scrollTop: elt.offset().top
        },'slow');
    }

    // wraps each word of the given string in span with (fake) uuid.
    function spanify (str) {
        function gen_uid () {
            var dt = new Date().getMilliseconds();
            var num = Math.random();
            var rnd = Math.round(num*10000000000);
            return dt + rnd;
        };

        var chunks = $.map(str.split(' '), function(a) {
            var uid = 1;
            return '<span class="chunk" id="c_' + gen_uid() + '">' + a + ' </span>'
        });
        return chunks.join();
    }

    // assigns a value specific class to an element
    function setColor (elt, value) {
        if (value <= 10) {
            elt.attr('class', 'tint_' + value);
        } else {
            elt.attr('class', 'tint_10');
        }
        elt.addClass('chunk');
    }

    // gets the parent node of the selected elements
    function getSelectedElements () {
        var sel = rangy.getSelection();
        if (sel.rangeCount) {
            var range = sel.getRangeAt(0);
            var elts = range.getNodes([1]);
            if (elts.length === 0) {
                elts = [range.commonAncestorContainer.parentNode];
            }
            return elts;
        } else {
            return null;
        }
    }

    function getLinks (id) {
        db.view('vj12/foo?startkey=["' + id + '"]&endkey=["' + id + '", {}]', {  
            success: function(data) {  
                // appends links/comments if any
                if (data.rows.length !== 0) {
                    $("div.annotations").remove();
                    
                    // finds where to display the comment 
                    var lastElts = [];
                    var wrap_elt = $('<div class="annotations"></div>');
                    var close_elt = $('<p style="text-align: center;"><a href="#">close comments</a></p><br />');
                    var close_elt2 = $('<p style="text-align: center;"><a href="#">close comments</a></p>');

                    for (i in data.rows) {
                        var value = data.rows[i].value;
                        var entry_elt = $('<div class="comment-entry"></div>');
                        var html;

                        lastElts.push(value.elts[value.elts.length - 1]);
                        
                        html = ''
                        + '<p>' 
                        + '    ' + humaneDate(new Date(value.created_at)).toLowerCase() + ', '
                        
                        if (value.author) {
                            html += ''
                            + '    ' + (value.author ? value.author : 'someone') + ' wrote:'
                        };
                        // closes <p> from date/author
                        html += ''
                        + '</p>';

                        if (value.url) {
                            html += ''
                            + '<p>' 
                            + '    <a href="' + value.url + '" target="_blank">' 
                            + '        ' + (value.title ? value.title : value.url)
                            + '    </a>'
                            + '</p>';
                        };

                        if (value.content) {
                            html += ''
                            + '<p>' 
                            + '    ' + value.content 
                            + '</p>';
                        };

                        entry_elt.append(html);
                        wrap_elt.append(close_elt);
                        wrap_elt.append(entry_elt);
                        wrap_elt.append(close_elt2);
                        close_elt.click(function(event){
                            event.preventDefault();
                            $("div.annotations").remove();
                        });
                        close_elt2.click(function(event){
                            event.preventDefault();
                            $("div.annotations").remove();
                        });
                    };
                    lastElts.sort();
                    //var selector = $.map(lastElts, function(a) { return 'span#' + a }).join(",");
                    //var first = $(selector).first();
                    //wrap_elt.insertAfter(first);
                    wrap_elt.insertAfter($("#" + lastElts[0]));
                    scrollTo($("#" + lastElts[0]));
                }
            }
        });  
    }

    // binds escape key to abord comment edition
    $(window).keyup(function(event) {
        if ((event.which == "27") && (lock == true)) {
            $("div#annotate").hide();
            elts.removeClass('active');
            lock = false;
        }
    });

    // binds keystroke "c" to comment the selection 
    $(window).keypress(function(event) {
        if ((event.which == "99") && (lock == false)) {
            event.preventDefault();

            // gets commentable selected nodes
            elts = $(getSelectedElements())
                .filter('span.chunk');
            if (elts.length === 0) {
                return;
            } else if (elts.length > 400) {
                alert("You might want to be be more specific!");
                return;
            }

            lock = true;  // locks on
            elts.addClass('active');

            // prepares and show up the content form
            $("#url-content").val("http://");
            $("div#annotate").insertAfter(elts[(elts.length - 1)])
                .show();
            scrollTo($(elts[elts.length -1]));
            $('#comment-content').val('')
                .focus();
        }
    });

    // binds click on annotations
    $("span.chunk").live('click', function(event) {
        getLinks($(event.target).attr("id"));
    });

    // binds cancel button to abord comment edition
    $("input.cancel").click(function(event) {
        event.preventDefault();
        $("div#annotate").hide();
        elts.removeClass('active');
        scrollTo($(elts[0]));
        lock = false;
    });

    // submits the comment form
    $("input.submit").click(function(event) {
        event.preventDefault();

        var form_id = $(event.target).closest('form').attr('id');
        var ids = $.map(elts, function(a) {return $(a).attr("id")});

        var doc = {
            'app': 'domino',
            'elts': ids,
            'created_at': new Date().toUTCString(),
        }

        doc.author = $("input#i-am").val();
        doc.title = $("input#url-title").val();
        doc.url = $("input#url-content").val();
        tmp_div = $('<div/>').text($("textarea#comment-content").val());
        // doc.content = spanify(tmp_div.html());
        doc.content = tmp_div.html();

        db.saveDoc(
            doc,
            {
            success: function() { 
                // Updates the color on the commented elements
                db.view('vj12/bar?group=true&startkey="' + ids[0] + '"&endkey="' + ids[(ids.length - 1)] + '"', {  
                    success: function(data) {  
                        for (i in data.rows) {
                            var key = data.rows[i].key;
                            var value = data.rows[i].value;
                            var elt = $('#' + key);
                            setColor(elt, value)
                        }
                    }
                });  
                $("div#annotate").hide();
                elts.removeClass('active');
                scrollTo($(elts[0]));
                lock = false;
            },
        });
    });

    // puts the color on all the elements 
    db.view('vj12/bar?group=true', {  
        success: function(data) {  
            // Sets tint
            for (i in data.rows) {
                var key = data.rows[i].key;
                var value = data.rows[i].value;
                var elt = $('#' + key);
                setColor(elt, value)
            }
        }
    });  
    db.view('vj12/count_links?group=true', {  
        success: function(data) {  
            $("p#comment_count span").html(data.rows.length);
        }
    });  

    lock = false;
});

// vim: set foldmethod=indent :
