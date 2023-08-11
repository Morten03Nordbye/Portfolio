(function() {
    var title = document.title;
    
    function scrollTitle() {
        title = title.substring(1) + title[0];
        document.title = title;
        setTimeout(scrollTitle, 250);  // Scroll every 250ms
    }
    
    // Start the effect
    scrollTitle();
})();
