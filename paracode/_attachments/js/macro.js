$(function() {
    //function toggle_src(a, img){
    //    var href = $(a).attr('href');
    //    var src = $(img).attr('src');
    //    $(img).attr('src', href);
    //    $(a).attr('href', src);
    //    return false
    //};

    function sort_by(attribute) {
        function sort_by_attr(a, b){
            return $(a).attr(attribute) > $(b).attr(attribute) ? 1 : -1;
        };
        $('div#outer ul li').sort(sort_by_attr).appendTo('div#outer ul');

        $('.tag').remove();
        var current_attr;
        $('div#outer ul li').each(function() {
            var this_attr = $(this).attr(attribute);
            if (this_attr !== current_attr) {
                current_attr = this_attr;
                var foo = $('<div></div>');
                foo.addClass('tag');
                foo.text(this_attr);
                foo.prependTo(this);
            };
        });
        return false
    }
    function spread_by(attribute) {
        var offset = 30;
        var values = []
        $('div#outer ul li').each(function() {
            var attr = $(this).attr(attribute);
            var index = $.inArray(attr, values);
            if (index === -1) {
                values.push(attr);
                index = values.length - 1;
            };
            $(this).css('margin-top', 50 + index * offset);
            //$(this).css('padding-bottom', 3000);
        });
        $('.tag2').remove();
        var current_attr;
        $('div#outer ul li').each(function() {
            var this_attr = $(this).attr(attribute);
            if (this_attr !== current_attr) {
                current_attr = this_attr;
                var foo = $('<div></div>');
                foo.addClass('tag2');
                foo.text(this_attr);
                foo.prependTo(this);
            };
        });
    }
    (function() {
        var keys = [];
        $('div#outer ul li').each(function() {
            $.each(this.attributes, function(i, attr) {
                if ($.inArray(attr.name, keys) === -1) {
                    keys.push(attr.name);
                };
            });
        });
        //var nav = $('<nav>');
        //var sort = $('<select>');
        //for (var i = 0; i < keys.length; i++) {
            //$('<option>' + keys[i] +'</option>')
                //.attr('value', keys[i])
                //.appendTo(sort);
        //};
        //var clone = sort.clone();
        //clone.attr('name', 'sort_by');
        //sort.attr('name', 'spread_by');
        //$('<label for="sort_by">Sort by</label>').appendTo(nav);
        //clone.appendTo(nav);
        //$('<label for="spread_by">Spread by</label>').appendTo(nav);
        //sort.appendTo(nav);
        //nav.prependTo('div#outer');
        $('select[name="spread_by"]').change(function() {
            spread_by($(this).val());
            return false;
        });
        $('select[name="sort_by"]').change(function() {
            sort_by($(this).val());
            return false;
        });

    })();

    extradata = ["id", "data-colorspace", "data-flashpixversion", "data-componentsconfiguration", "data-exifversion", "data-exiftag", "data-ycbcrpositioning", "data-software", "data-resolutionunit", "data-xresolution"];

    $('div#outer li').hover(function() {
        var prefix = "data-"; 
        var $infos = $("dl#infos").empty()
        $.each(this.attributes, function(i, attr) {
            if (attr.name.substring(0, prefix.length) === prefix
                    && attr.value !== "-") {
                if ($.inArray(attr.name, extradata) == -1 ){ // checks if metadata is not a superfluous one!
                    $infos.append("<dt>" + attr.name.substring(prefix.length, attr.name.length) + "</dt>")
                        .append("<dd>" + attr.value + "</dd>")
                }
            };
        });
    }, function() {
        var $infos = $("dl#infos").empty()
    });

    var current_a, current_img;
    $("div#outer li").hover(function(evt) {
        evt.stopPropagation();
        current_a = $(this).find('a');
        current_img = current_a.find('img');
        //toggle_src(current_a, current_img);
    }, function(evt) {
        evt.stopPropagation();
        current_a = $(this).find('a');
        current_img = current_a.find('img');
        //toggle_src(current_a, current_img);
    });
    $("div#outer li").click(function(evt) {
        evt.preventDefault();
        evt.stopPropagation();
        
        $(this).zoomTo({
            //root: $('div#bla'),
            targetsize: 0.8,
            scalemode: "both",
            duration: 1000,
            easing: "ease",
            nativeanimation: true
        });
        
        //try {
            //toggle_src(current_a, current_img);
        //} catch (e) {

        //}

        //current_a = $(this).find('a');
        //current_img = current_a.find('img');
        //toggle_src(current_a, current_img);
    });

    $("body").click(function(evt) {
        evt.stopPropagation();
        $(this).zoomTo({targetsize: 1});
        //toggle_src(current_a, current_img);
    });
});
