//-----------------------------------------------------------------
// Licensed Materials - Property of IBM
//
// WebSphere Commerce
//
// (C) Copyright IBM Corp. 2016, 2019 All Rights Reserved.
//
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with
// IBM Corp.
//-----------------------------------------------------------------

/*global jQuery, $, window, setTimeout, clearTimeout, Utils */

/*
 * Carousel (extends $.Widget)
 * Wraps around a third party plugin - Owl Carousel. Owl Carousel is just a jQuery plugin
 * so it's not written as a jQuery UI Widget, otherwise we would extend the Owl Carousel Widget.
 *
 */
(function() {

    /*
     * New options (in addition to ones inherited from $.Widget):
     *
     * OPTIONAL:
     * prevButton: {string}
     *             jQuery selector for the previous button, can have falsy
     *             value if there is no previous button.
     * nextButton: {string}
     *             jQuery selector for the next button, can have falsy value
     *             if there is no previous button.
     * paginationButtons: {string}
     *             jQuery selector for the previous button, can have falsy
     *             value if there are no pagination buttons.
     * overflowVisible: {boolean}
     *             true if content that overflows the container should be shown,
     *             false otherwise.
     * REQUIRED:
     * (None)
     */
    $.widget("wc.Carousel", $.Widget, {
        options: {
            prevButton: null,
            nextButton: null,
            paginationButtons: null,
            contentContainer: "div.content",
            overflowVisible: false,
            owlCarouselOptions: {
                loadedClass: 'owl-loaded owl-carousel owl-carousel owl-theme',
                pagination: false, // We're generating our own pagination control
                dots: false,
                rewind: true,
                touchDrag: false, // Need to disable touch drag if we want this to work
                // with gridster
                mouseDrag: false,
                lazyLoad: true,
                afterMove: function() {
                    if (this.options.paginationButtons) {
                        this.paginationButtons.removeClass("selected")
                            // Highlight the selected element after pagination move
                            .eq(this.owlCarousel._current).attr("class", "selected");
                    }
                }
            }
        },

        /**
         * Attach "this" to a function passed to the owlCarousel option
         */
        _proxyFunction: function(optionName) {
            if ($.isFunction(this.options.owlCarouselOptions[optionName])) {
                this.options.owlCarouselOptions[optionName] = $.proxy(this.options.owlCarouselOptions[optionName], this);
            }
        },

        _create: function() {
            this._super(this);


            // Stores a handle to the underlying Owl Carousel
            this.content = $(this.options.contentContainer, this.element);
            this._proxyFunction("afterMove");
            if (this.options.owlCarouselOptions.singleItem || this.options.owlCarouselOptions.singleItem == 'true') {
                //old version of owl Carousel
                this.options.owlCarouselOptions.items = 1;
            } else {
                this.options.owlCarouselOptions.responsive = this._normalizeColumnCountByWidth();
            }

            this.owlCarousel = this.content.owlCarousel(this.options.owlCarouselOptions).data('owl.carousel');
            //RTC DEFECT#153115 the carousel disableTextSelect event handling result in invocation of event.stopPropagation()
            if ((this.owlCarousel.options.mouseDrag !== false || this.owlCarousel.options.touchDrag !== false) &&
                this.owlCarousel.disabledEvents && typeof this.owlCarousel.disabledEvents === "function") {
                this.owlCarousel.$elem.off("mousedown.disableTextSelect");
                this.owlCarousel.$elem.on("mousedown.disableTextSelect", function(e) {
                    if (!$(e.target).is('input, textarea, select, option')) {
                        e.preventDefault();
                    };
                });
            }

            if (this.options.overflowVisible) {
                $(".owl-stage-outer", this.element).addClass("overflow-visible");
            }

            $(window).resize($.proxy(function() {
                this.owlCarousel.options.responsive = this.options.owlCarouselOptions.responsive;
                this.owlCarousel.refresh();
                this._toggleResponsive();
                this._togglePrevNextButtons();
            }, this));

            this._add_event_handlers();
            this._toggleResponsive();
            this._togglePrevNextButtons();
        },

        /**
         * Show/hide custom pagination buttons depending on the number of items
         * being shown
         */
        _togglePrevNextButtons: function() {
            // Require pagination if the total number of items is greater than
            // the number of items being shown
            if (this.options.owlCarouselOptions.responsive && this.owlCarousel.options.responsive)
                this.options.owlCarouselOptions.items = this.options.owlCarouselOptions.responsive[this.owlCarousel._breakpoint].items;
            var requirePagination = (this.owlCarousel._items.length > this.options.owlCarouselOptions.items);

            if (requirePagination) {
                if (this.options.nextButton) {
                    this.$nextButton.show();
                }
                if (this.options.prevButton) {
                    this.$prevButton.show();
                }
            } else {
                if (this.options.nextButton) {
                    this.$nextButton.hide();
                }
                if (this.options.prevButton) {
                    this.$prevButton.hide();
                }
            }
        },

        _add_event_handlers: function() {
            var carousel = this.owlCarousel;

            this.element.on("resized.owl.carousel", function() {
                console.log("resized");
            });
            // Pagination Controls
            // Previous button
            if (this.options.prevButton) {
                this.$prevButton = $(this.options.prevButton, this.element);
                this.$prevButton.click(function(e) {
                    carousel.prev();
                    carousel.options.afterMove();
                    e.preventDefault();
                });
            }

            // Next button
            if (this.options.nextButton) {
                this.$nextButton = $(this.options.nextButton, this.element);
                this.$nextButton.click(function(e) {
                    carousel.next();
                    carousel.options.afterMove();
                    e.preventDefault();
                });
            }
            if (this.options.paginationButtons) {
                this.paginationButtons = $(this.options.paginationButtons, this.element);
                this.paginationButtons.first().attr("class", "selected");
                this.paginationButtons.each(function(i, button) {
                    $(button).click(function(e) {
                        carousel.to(i);
                        carousel.options.afterMove();
                        e.preventDefault();
                    });
                });
            }


        },

        _destroy: function() {
            this.owlCarousel.destroy();

            // remove the event handlers
            //this.element.off("mouseenter.wcToolTip");
            //this.element.off("mouseleave.wcToolTip");
        },

        _toggleResponsive: function() {
            if (this.options.owlCarouselOptions.responsive && this.owlCarousel.options.responsive) {
                this.options.owlCarouselOptions.items = this.options.owlCarouselOptions.responsive[this.owlCarousel._breakpoint].items;

                if (this.owlCarousel._items.length < this.options.owlCarouselOptions.items) {
                    this.owlCarousel.options.items = this.owlCarousel._items.length;
                    this.owlCarousel.options.responsive = null;
                    this.owlCarousel.refresh();
                }
            }
        },

        _normalizeColumnCountByWidth: function() {
            if (!this.options.columnCountByWidth) {
                return this.options.columnCountByWidth;
            }
            var columnCountByWidth = $.extend({}, this.options.columnCountByWidth);
            var responsive = {};
            $.each(columnCountByWidth, function(breakpoint, items) {
                if (!!items['items']) {
                    //new format
                    responsive = columnCountByWidth;
                    return false;
                }
                responsive[breakpoint] = {
                    "items": items
                };
            });
            return responsive;
        }

    });

}());