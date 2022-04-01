/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/assets/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ({

/***/ "./node_modules/bootstrap.native/dist/components/collapse-native.esm.js":
/*!******************************************************************************!*\
  !*** ./node_modules/bootstrap.native/dist/components/collapse-native.esm.js ***!
  \******************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/*!
  * Native JavaScript for Bootstrap Collapse v3.0.13 (https://thednp.github.io/bootstrap.native/)
  * Copyright 2015-2020 © dnp_theme
  * Licensed under MIT (https://github.com/thednp/bootstrap.native/blob/master/LICENSE)
  */
var transitionEndEvent = 'webkitTransition' in document.head.style ? 'webkitTransitionEnd' : 'transitionend';

var supportTransition = 'webkitTransition' in document.head.style || 'transition' in document.head.style;

var transitionDuration = 'webkitTransition' in document.head.style ? 'webkitTransitionDuration' : 'transitionDuration';

var transitionProperty = 'webkitTransition' in document.head.style ? 'webkitTransitionProperty' : 'transitionProperty';

function getElementTransitionDuration(element) {
  var computedStyle = getComputedStyle(element),
      property = computedStyle[transitionProperty],
      duration = supportTransition && property && property !== 'none'
               ? parseFloat(computedStyle[transitionDuration]) : 0;
  return !isNaN(duration) ? duration * 1000 : 0;
}

function emulateTransitionEnd(element,handler){
  var called = 0, duration = getElementTransitionDuration(element);
  duration ? element.addEventListener( transitionEndEvent, function transitionEndWrapper(e){
              !called && handler(e), called = 1;
              element.removeEventListener( transitionEndEvent, transitionEndWrapper);
            })
           : setTimeout(function() { !called && handler(), called = 1; }, 17);
}

function queryElement(selector, parent) {
  var lookUp = parent && parent instanceof Element ? parent : document;
  return selector instanceof Element ? selector : lookUp.querySelector(selector);
}

function bootstrapCustomEvent(eventName, componentName, related) {
  var OriginalCustomEvent = new CustomEvent( eventName + '.bs.' + componentName, {cancelable: true});
  OriginalCustomEvent.relatedTarget = related;
  return OriginalCustomEvent;
}

function dispatchCustomEvent(customEvent){
  this && this.dispatchEvent(customEvent);
}

function Collapse(element,options) {
  options = options || {};
  var self = this;
  var accordion = null,
      collapse = null,
      activeCollapse,
      activeElement,
      showCustomEvent,
      shownCustomEvent,
      hideCustomEvent,
      hiddenCustomEvent;
  function openAction(collapseElement, toggle) {
    dispatchCustomEvent.call(collapseElement, showCustomEvent);
    if ( showCustomEvent.defaultPrevented ) { return; }
    collapseElement.isAnimating = true;
    collapseElement.classList.add('collapsing');
    collapseElement.classList.remove('collapse');
    collapseElement.style.height = (collapseElement.scrollHeight) + "px";
    emulateTransitionEnd(collapseElement, function () {
      collapseElement.isAnimating = false;
      collapseElement.setAttribute('aria-expanded','true');
      toggle.setAttribute('aria-expanded','true');
      collapseElement.classList.remove('collapsing');
      collapseElement.classList.add('collapse');
      collapseElement.classList.add('show');
      collapseElement.style.height = '';
      dispatchCustomEvent.call(collapseElement, shownCustomEvent);
    });
  }
  function closeAction(collapseElement, toggle) {
    dispatchCustomEvent.call(collapseElement, hideCustomEvent);
    if ( hideCustomEvent.defaultPrevented ) { return; }
    collapseElement.isAnimating = true;
    collapseElement.style.height = (collapseElement.scrollHeight) + "px";
    collapseElement.classList.remove('collapse');
    collapseElement.classList.remove('show');
    collapseElement.classList.add('collapsing');
    collapseElement.offsetWidth;
    collapseElement.style.height = '0px';
    emulateTransitionEnd(collapseElement, function () {
      collapseElement.isAnimating = false;
      collapseElement.setAttribute('aria-expanded','false');
      toggle.setAttribute('aria-expanded','false');
      collapseElement.classList.remove('collapsing');
      collapseElement.classList.add('collapse');
      collapseElement.style.height = '';
      dispatchCustomEvent.call(collapseElement, hiddenCustomEvent);
    });
  }
  self.toggle = function (e) {
    if (e && e.target.tagName === 'A' || element.tagName === 'A') {e.preventDefault();}
    if (element.contains(e.target) || e.target === element) {
      if (!collapse.classList.contains('show')) { self.show(); }
      else { self.hide(); }
    }
  };
  self.hide = function () {
    if ( collapse.isAnimating ) { return; }
    closeAction(collapse,element);
    element.classList.add('collapsed');
  };
  self.show = function () {
    if ( accordion ) {
      activeCollapse = accordion.getElementsByClassName("collapse show")[0];
      activeElement = activeCollapse && (queryElement(("[data-target=\"#" + (activeCollapse.id) + "\"]"),accordion)
                    || queryElement(("[href=\"#" + (activeCollapse.id) + "\"]"),accordion) );
    }
    if ( !collapse.isAnimating ) {
      if ( activeElement && activeCollapse !== collapse ) {
        closeAction(activeCollapse,activeElement);
        activeElement.classList.add('collapsed');
      }
      openAction(collapse,element);
      element.classList.remove('collapsed');
    }
  };
  self.dispose = function () {
    element.removeEventListener('click',self.toggle,false);
    delete element.Collapse;
  };
    element = queryElement(element);
    element.Collapse && element.Collapse.dispose();
    var accordionData = element.getAttribute('data-parent');
    showCustomEvent = bootstrapCustomEvent('show', 'collapse');
    shownCustomEvent = bootstrapCustomEvent('shown', 'collapse');
    hideCustomEvent = bootstrapCustomEvent('hide', 'collapse');
    hiddenCustomEvent = bootstrapCustomEvent('hidden', 'collapse');
    collapse = queryElement(options.target || element.getAttribute('data-target') || element.getAttribute('href'));
    collapse.isAnimating = false;
    accordion = element.closest(options.parent || accordionData);
    if ( !element.Collapse ) {
      element.addEventListener('click',self.toggle,false);
    }
    element.Collapse = self;
}

/* harmony default export */ __webpack_exports__["default"] = (Collapse);


/***/ }),

/***/ "./node_modules/bootstrap.native/dist/components/dropdown-native.esm.js":
/*!******************************************************************************!*\
  !*** ./node_modules/bootstrap.native/dist/components/dropdown-native.esm.js ***!
  \******************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/*!
  * Native JavaScript for Bootstrap Dropdown v3.0.13 (https://thednp.github.io/bootstrap.native/)
  * Copyright 2015-2020 © dnp_theme
  * Licensed under MIT (https://github.com/thednp/bootstrap.native/blob/master/LICENSE)
  */
function queryElement(selector, parent) {
  var lookUp = parent && parent instanceof Element ? parent : document;
  return selector instanceof Element ? selector : lookUp.querySelector(selector);
}

function bootstrapCustomEvent(eventName, componentName, related) {
  var OriginalCustomEvent = new CustomEvent( eventName + '.bs.' + componentName, {cancelable: true});
  OriginalCustomEvent.relatedTarget = related;
  return OriginalCustomEvent;
}

function dispatchCustomEvent(customEvent){
  this && this.dispatchEvent(customEvent);
}

function setFocus (element){
  element.focus ? element.focus() : element.setActive();
}

function Dropdown(element,option) {
  var self = this,
      showCustomEvent,
      shownCustomEvent,
      hideCustomEvent,
      hiddenCustomEvent,
      relatedTarget = null,
      parent, menu, menuItems = [],
      persist;
  function preventEmptyAnchor(anchor) {
    (anchor.href && anchor.href.slice(-1) === '#' || anchor.parentNode && anchor.parentNode.href
      && anchor.parentNode.href.slice(-1) === '#') && this.preventDefault();
  }
  function toggleDismiss() {
    var action = element.open ? 'addEventListener' : 'removeEventListener';
    document[action]('click',dismissHandler,false);
    document[action]('keydown',preventScroll,false);
    document[action]('keyup',keyHandler,false);
    document[action]('focus',dismissHandler,false);
  }
  function dismissHandler(e) {
    var eventTarget = e.target,
          hasData = eventTarget && (eventTarget.getAttribute('data-toggle')
                                || eventTarget.parentNode && eventTarget.parentNode.getAttribute
                                && eventTarget.parentNode.getAttribute('data-toggle'));
    if ( e.type === 'focus' && (eventTarget === element || eventTarget === menu || menu.contains(eventTarget) ) ) {
      return;
    }
    if ( (eventTarget === menu || menu.contains(eventTarget)) && (persist || hasData) ) { return; }
    else {
      relatedTarget = eventTarget === element || element.contains(eventTarget) ? element : null;
      self.hide();
    }
    preventEmptyAnchor.call(e,eventTarget);
  }
  function clickHandler(e) {
    relatedTarget = element;
    self.show();
    preventEmptyAnchor.call(e,e.target);
  }
  function preventScroll(e) {
    var key = e.which || e.keyCode;
    if( key === 38 || key === 40 ) { e.preventDefault(); }
  }
  function keyHandler(e) {
    var key = e.which || e.keyCode,
        activeItem = document.activeElement,
        isSameElement = activeItem === element,
        isInsideMenu = menu.contains(activeItem),
        isMenuItem = activeItem.parentNode === menu || activeItem.parentNode.parentNode === menu,
        idx = menuItems.indexOf(activeItem);
    if ( isMenuItem ) {
      idx = isSameElement ? 0
                          : key === 38 ? (idx>1?idx-1:0)
                          : key === 40 ? (idx<menuItems.length-1?idx+1:idx) : idx;
      menuItems[idx] && setFocus(menuItems[idx]);
    }
    if ( (menuItems.length && isMenuItem
          || !menuItems.length && (isInsideMenu || isSameElement)
          || !isInsideMenu )
          && element.open && key === 27
    ) {
      self.toggle();
      relatedTarget = null;
    }
  }
  self.show = function () {
    showCustomEvent = bootstrapCustomEvent('show', 'dropdown', relatedTarget);
    dispatchCustomEvent.call(parent, showCustomEvent);
    if ( showCustomEvent.defaultPrevented ) { return; }
    menu.classList.add('show');
    parent.classList.add('show');
    element.setAttribute('aria-expanded',true);
    element.open = true;
    element.removeEventListener('click',clickHandler,false);
    setTimeout(function () {
      setFocus( menu.getElementsByTagName('INPUT')[0] || element );
      toggleDismiss();
      shownCustomEvent = bootstrapCustomEvent( 'shown', 'dropdown', relatedTarget);
      dispatchCustomEvent.call(parent, shownCustomEvent);
    },1);
  };
  self.hide = function () {
    hideCustomEvent = bootstrapCustomEvent('hide', 'dropdown', relatedTarget);
    dispatchCustomEvent.call(parent, hideCustomEvent);
    if ( hideCustomEvent.defaultPrevented ) { return; }
    menu.classList.remove('show');
    parent.classList.remove('show');
    element.setAttribute('aria-expanded',false);
    element.open = false;
    toggleDismiss();
    setFocus(element);
    setTimeout(function () {
      element.Dropdown && element.addEventListener('click',clickHandler,false);
    },1);
    hiddenCustomEvent = bootstrapCustomEvent('hidden', 'dropdown', relatedTarget);
    dispatchCustomEvent.call(parent, hiddenCustomEvent);
  };
  self.toggle = function () {
    if (parent.classList.contains('show') && element.open) { self.hide(); }
    else { self.show(); }
  };
  self.dispose = function () {
    if (parent.classList.contains('show') && element.open) { self.hide(); }
    element.removeEventListener('click',clickHandler,false);
    delete element.Dropdown;
  };
  element = queryElement(element);
  element.Dropdown && element.Dropdown.dispose();
  parent = element.parentNode;
  menu = queryElement('.dropdown-menu', parent);
  Array.from(menu.children).map(function (child){
    child.children.length && (child.children[0].tagName === 'A' && menuItems.push(child.children[0]));
    child.tagName === 'A' && menuItems.push(child);
  });
  if ( !element.Dropdown ) {
    !('tabindex' in menu) && menu.setAttribute('tabindex', '0');
    element.addEventListener('click',clickHandler,false);
  }
  persist = option === true || element.getAttribute('data-persist') === 'true' || false;
  element.open = false;
  element.Dropdown = self;
}

/* harmony default export */ __webpack_exports__["default"] = (Dropdown);


/***/ }),

/***/ "./node_modules/bootstrap.native/dist/components/tooltip-native.esm.js":
/*!*****************************************************************************!*\
  !*** ./node_modules/bootstrap.native/dist/components/tooltip-native.esm.js ***!
  \*****************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/*!
  * Native JavaScript for Bootstrap Tooltip v3.0.13 (https://thednp.github.io/bootstrap.native/)
  * Copyright 2015-2020 © dnp_theme
  * Licensed under MIT (https://github.com/thednp/bootstrap.native/blob/master/LICENSE)
  */
var mouseHoverEvents = ('onmouseleave' in document) ? [ 'mouseenter', 'mouseleave'] : [ 'mouseover', 'mouseout' ];

var mouseClickEvents = { down: 'mousedown', up: 'mouseup' };

var supportPassive = (function () {
  var result = false;
  try {
    var opts = Object.defineProperty({}, 'passive', {
      get: function() {
        result = true;
      }
    });
    document.addEventListener('DOMContentLoaded', function wrap(){
      document.removeEventListener('DOMContentLoaded', wrap, opts);
    }, opts);
  } catch (e) {}
  return result;
})();

var passiveHandler = supportPassive ? { passive: true } : false;

var transitionEndEvent = 'webkitTransition' in document.head.style ? 'webkitTransitionEnd' : 'transitionend';

var supportTransition = 'webkitTransition' in document.head.style || 'transition' in document.head.style;

var transitionDuration = 'webkitTransition' in document.head.style ? 'webkitTransitionDuration' : 'transitionDuration';

var transitionProperty = 'webkitTransition' in document.head.style ? 'webkitTransitionProperty' : 'transitionProperty';

function getElementTransitionDuration(element) {
  var computedStyle = getComputedStyle(element),
      property = computedStyle[transitionProperty],
      duration = supportTransition && property && property !== 'none'
               ? parseFloat(computedStyle[transitionDuration]) : 0;
  return !isNaN(duration) ? duration * 1000 : 0;
}

function emulateTransitionEnd(element,handler){
  var called = 0, duration = getElementTransitionDuration(element);
  duration ? element.addEventListener( transitionEndEvent, function transitionEndWrapper(e){
              !called && handler(e), called = 1;
              element.removeEventListener( transitionEndEvent, transitionEndWrapper);
            })
           : setTimeout(function() { !called && handler(), called = 1; }, 17);
}

function queryElement(selector, parent) {
  var lookUp = parent && parent instanceof Element ? parent : document;
  return selector instanceof Element ? selector : lookUp.querySelector(selector);
}

function bootstrapCustomEvent(eventName, componentName, related) {
  var OriginalCustomEvent = new CustomEvent( eventName + '.bs.' + componentName, {cancelable: true});
  OriginalCustomEvent.relatedTarget = related;
  return OriginalCustomEvent;
}

function dispatchCustomEvent(customEvent){
  this && this.dispatchEvent(customEvent);
}

function getScroll() {
  return {
    y : window.pageYOffset || document.documentElement.scrollTop,
    x : window.pageXOffset || document.documentElement.scrollLeft
  }
}

function styleTip(link,element,position,parent) {
  var tipPositions = /\b(top|bottom|left|right)+/,
      elementDimensions = { w : element.offsetWidth, h: element.offsetHeight },
      windowWidth = (document.documentElement.clientWidth || document.body.clientWidth),
      windowHeight = (document.documentElement.clientHeight || document.body.clientHeight),
      rect = link.getBoundingClientRect(),
      scroll = parent === document.body ? getScroll() : { x: parent.offsetLeft + parent.scrollLeft, y: parent.offsetTop + parent.scrollTop },
      linkDimensions = { w: rect.right - rect.left, h: rect.bottom - rect.top },
      isPopover = element.classList.contains('popover'),
      arrow = element.getElementsByClassName('arrow')[0],
      halfTopExceed = rect.top + linkDimensions.h/2 - elementDimensions.h/2 < 0,
      halfLeftExceed = rect.left + linkDimensions.w/2 - elementDimensions.w/2 < 0,
      halfRightExceed = rect.left + elementDimensions.w/2 + linkDimensions.w/2 >= windowWidth,
      halfBottomExceed = rect.top + elementDimensions.h/2 + linkDimensions.h/2 >= windowHeight,
      topExceed = rect.top - elementDimensions.h < 0,
      leftExceed = rect.left - elementDimensions.w < 0,
      bottomExceed = rect.top + elementDimensions.h + linkDimensions.h >= windowHeight,
      rightExceed = rect.left + elementDimensions.w + linkDimensions.w >= windowWidth;
  position = (position === 'left' || position === 'right') && leftExceed && rightExceed ? 'top' : position;
  position = position === 'top' && topExceed ? 'bottom' : position;
  position = position === 'bottom' && bottomExceed ? 'top' : position;
  position = position === 'left' && leftExceed ? 'right' : position;
  position = position === 'right' && rightExceed ? 'left' : position;
  var topPosition,
    leftPosition,
    arrowTop,
    arrowLeft,
    arrowWidth,
    arrowHeight;
  element.className.indexOf(position) === -1 && (element.className = element.className.replace(tipPositions,position));
  arrowWidth = arrow.offsetWidth; arrowHeight = arrow.offsetHeight;
  if ( position === 'left' || position === 'right' ) {
    if ( position === 'left' ) {
      leftPosition = rect.left + scroll.x - elementDimensions.w - ( isPopover ? arrowWidth : 0 );
    } else {
      leftPosition = rect.left + scroll.x + linkDimensions.w;
    }
    if (halfTopExceed) {
      topPosition = rect.top + scroll.y;
      arrowTop = linkDimensions.h/2 - arrowWidth;
    } else if (halfBottomExceed) {
      topPosition = rect.top + scroll.y - elementDimensions.h + linkDimensions.h;
      arrowTop = elementDimensions.h - linkDimensions.h/2 - arrowWidth;
    } else {
      topPosition = rect.top + scroll.y - elementDimensions.h/2 + linkDimensions.h/2;
      arrowTop = elementDimensions.h/2 - (isPopover ? arrowHeight*0.9 : arrowHeight/2);
    }
  } else if ( position === 'top' || position === 'bottom' ) {
    if ( position === 'top') {
      topPosition =  rect.top + scroll.y - elementDimensions.h - ( isPopover ? arrowHeight : 0 );
    } else {
      topPosition = rect.top + scroll.y + linkDimensions.h;
    }
    if (halfLeftExceed) {
      leftPosition = 0;
      arrowLeft = rect.left + linkDimensions.w/2 - arrowWidth;
    } else if (halfRightExceed) {
      leftPosition = windowWidth - elementDimensions.w*1.01;
      arrowLeft = elementDimensions.w - ( windowWidth - rect.left ) + linkDimensions.w/2 - arrowWidth/2;
    } else {
      leftPosition = rect.left + scroll.x - elementDimensions.w/2 + linkDimensions.w/2;
      arrowLeft = elementDimensions.w/2 - ( isPopover ? arrowWidth : arrowWidth/2 );
    }
  }
  element.style.top = topPosition + 'px';
  element.style.left = leftPosition + 'px';
  arrowTop && (arrow.style.top = arrowTop + 'px');
  arrowLeft && (arrow.style.left = arrowLeft + 'px');
}

function Tooltip(element,options) {
  options = options || {};
  var self = this,
      tooltip = null, timer = 0, titleString,
      animationData,
      placementData,
      delayData,
      containerData,
      showCustomEvent,
      shownCustomEvent,
      hideCustomEvent,
      hiddenCustomEvent,
      containerElement,
      containerDataElement,
      modal,
      navbarFixedTop,
      navbarFixedBottom,
      placementClass,
      ops = {};
  function getTitle() {
    return element.getAttribute('title')
        || element.getAttribute('data-title')
        || element.getAttribute('data-original-title')
  }
  function removeToolTip() {
    ops.container.removeChild(tooltip);
    tooltip = null; timer = null;
  }
  function createToolTip() {
    titleString = getTitle();
    if ( titleString ) {
      tooltip = document.createElement('div');
      if (ops.template) {
        var tooltipMarkup = document.createElement('div');
        tooltipMarkup.innerHTML = ops.template.trim();
        tooltip.className = tooltipMarkup.firstChild.className;
        tooltip.innerHTML = tooltipMarkup.firstChild.innerHTML;
        queryElement('.tooltip-inner',tooltip).innerHTML = titleString.trim();
      } else {
        var tooltipArrow = document.createElement('div');
        tooltipArrow.classList.add('arrow');
        tooltip.appendChild(tooltipArrow);
        var tooltipInner = document.createElement('div');
        tooltipInner.classList.add('tooltip-inner');
        tooltip.appendChild(tooltipInner);
        tooltipInner.innerHTML = titleString;
      }
      tooltip.style.left = '0';
      tooltip.style.top = '0';
      tooltip.setAttribute('role','tooltip');
      !tooltip.classList.contains('tooltip') && tooltip.classList.add('tooltip');
      !tooltip.classList.contains(ops.animation) && tooltip.classList.add(ops.animation);
      !tooltip.classList.contains(placementClass) && tooltip.classList.add(placementClass);
      ops.container.appendChild(tooltip);
    }
  }
  function updateTooltip() {
    styleTip(element, tooltip, ops.placement, ops.container);
  }
  function showTooltip() {
    !tooltip.classList.contains('show') && ( tooltip.classList.add('show') );
  }
  function touchHandler(e){
    if ( tooltip && tooltip.contains(e.target) || e.target === element || element.contains(e.target)) ; else {
      self.hide();
    }
  }
  function toggleAction(action){
    action = action ? 'addEventListener' : 'removeEventListener';
    document[action]( 'touchstart', touchHandler, passiveHandler );
    window[action]( 'resize', self.hide, passiveHandler );
  }
  function showAction() {
    toggleAction(1);
    dispatchCustomEvent.call(element, shownCustomEvent);
  }
  function hideAction() {
    toggleAction();
    removeToolTip();
    dispatchCustomEvent.call(element, hiddenCustomEvent);
  }
  function toggleEvents(action) {
    action = action ? 'addEventListener' : 'removeEventListener';
    element[action](mouseClickEvents.down, self.show,false);
    element[action](mouseHoverEvents[0], self.show,false);
    element[action](mouseHoverEvents[1], self.hide,false);
  }
  self.show = function () {
    clearTimeout(timer);
    timer = setTimeout( function () {
      if (tooltip === null) {
        dispatchCustomEvent.call(element, showCustomEvent);
        if (showCustomEvent.defaultPrevented) { return; }
        if(createToolTip() !== false) {
          updateTooltip();
          showTooltip();
          !!ops.animation ? emulateTransitionEnd(tooltip, showAction) : showAction();
        }
      }
    }, 20 );
  };
  self.hide = function () {
    clearTimeout(timer);
    timer = setTimeout( function () {
      if (tooltip && tooltip.classList.contains('show')) {
        dispatchCustomEvent.call(element, hideCustomEvent);
        if (hideCustomEvent.defaultPrevented) { return; }
        tooltip.classList.remove('show');
        !!ops.animation ? emulateTransitionEnd(tooltip, hideAction) : hideAction();
      }
    }, ops.delay);
  };
  self.toggle = function () {
    if (!tooltip) { self.show(); }
    else { self.hide(); }
  };
  self.dispose = function () {
    toggleEvents();
    self.hide();
    element.setAttribute('title', element.getAttribute('data-original-title'));
    element.removeAttribute('data-original-title');
    delete element.Tooltip;
  };
  element = queryElement(element);
  element.Tooltip && element.Tooltip.dispose();
  animationData = element.getAttribute('data-animation');
  placementData = element.getAttribute('data-placement');
  delayData = element.getAttribute('data-delay');
  containerData = element.getAttribute('data-container');
  showCustomEvent = bootstrapCustomEvent('show', 'tooltip');
  shownCustomEvent = bootstrapCustomEvent('shown', 'tooltip');
  hideCustomEvent = bootstrapCustomEvent('hide', 'tooltip');
  hiddenCustomEvent = bootstrapCustomEvent('hidden', 'tooltip');
  containerElement = queryElement(options.container);
  containerDataElement = queryElement(containerData);
  modal = element.closest('.modal');
  navbarFixedTop = element.closest('.fixed-top');
  navbarFixedBottom = element.closest('.fixed-bottom');
  ops.animation = options.animation && options.animation !== 'fade' ? options.animation : animationData || 'fade';
  ops.placement = options.placement ? options.placement : placementData || 'top';
  ops.template = options.template ? options.template : null;
  ops.delay = parseInt(options.delay || delayData) || 200;
  ops.container = containerElement ? containerElement
                          : containerDataElement ? containerDataElement
                          : navbarFixedTop ? navbarFixedTop
                          : navbarFixedBottom ? navbarFixedBottom
                          : modal ? modal : document.body;
  placementClass = "bs-tooltip-" + (ops.placement);
  titleString = getTitle();
  if ( !titleString ) { return; }
  if (!element.Tooltip) {
    element.setAttribute('data-original-title',titleString);
    element.removeAttribute('title');
    toggleEvents(1);
  }
  element.Tooltip = self;
}

/* harmony default export */ __webpack_exports__["default"] = (Tooltip);


/***/ }),

/***/ "./node_modules/intersection-observer/intersection-observer.js":
/*!*********************************************************************!*\
  !*** ./node_modules/intersection-observer/intersection-observer.js ***!
  \*********************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

/**
 * Copyright 2016 Google Inc. All Rights Reserved.
 *
 * Licensed under the W3C SOFTWARE AND DOCUMENT NOTICE AND LICENSE.
 *
 *  https://www.w3.org/Consortium/Legal/2015/copyright-software-and-document
 *
 */
(function() {
'use strict';

// Exit early if we're not running in a browser.
if (typeof window !== 'object') {
  return;
}

// Exit early if all IntersectionObserver and IntersectionObserverEntry
// features are natively supported.
if ('IntersectionObserver' in window &&
    'IntersectionObserverEntry' in window &&
    'intersectionRatio' in window.IntersectionObserverEntry.prototype) {

  // Minimal polyfill for Edge 15's lack of `isIntersecting`
  // See: https://github.com/w3c/IntersectionObserver/issues/211
  if (!('isIntersecting' in window.IntersectionObserverEntry.prototype)) {
    Object.defineProperty(window.IntersectionObserverEntry.prototype,
      'isIntersecting', {
      get: function () {
        return this.intersectionRatio > 0;
      }
    });
  }
  return;
}

/**
 * Returns the embedding frame element, if any.
 * @param {!Document} doc
 * @return {!Element}
 */
function getFrameElement(doc) {
  try {
    return doc.defaultView && doc.defaultView.frameElement || null;
  } catch (e) {
    // Ignore the error.
    return null;
  }
}

/**
 * A local reference to the root document.
 */
var document = (function(startDoc) {
  var doc = startDoc;
  var frame = getFrameElement(doc);
  while (frame) {
    doc = frame.ownerDocument;
    frame = getFrameElement(doc);
  }
  return doc;
})(window.document);

/**
 * An IntersectionObserver registry. This registry exists to hold a strong
 * reference to IntersectionObserver instances currently observing a target
 * element. Without this registry, instances without another reference may be
 * garbage collected.
 */
var registry = [];

/**
 * The signal updater for cross-origin intersection. When not null, it means
 * that the polyfill is configured to work in a cross-origin mode.
 * @type {function(DOMRect|ClientRect, DOMRect|ClientRect)}
 */
var crossOriginUpdater = null;

/**
 * The current cross-origin intersection. Only used in the cross-origin mode.
 * @type {DOMRect|ClientRect}
 */
var crossOriginRect = null;


/**
 * Creates the global IntersectionObserverEntry constructor.
 * https://w3c.github.io/IntersectionObserver/#intersection-observer-entry
 * @param {Object} entry A dictionary of instance properties.
 * @constructor
 */
function IntersectionObserverEntry(entry) {
  this.time = entry.time;
  this.target = entry.target;
  this.rootBounds = ensureDOMRect(entry.rootBounds);
  this.boundingClientRect = ensureDOMRect(entry.boundingClientRect);
  this.intersectionRect = ensureDOMRect(entry.intersectionRect || getEmptyRect());
  this.isIntersecting = !!entry.intersectionRect;

  // Calculates the intersection ratio.
  var targetRect = this.boundingClientRect;
  var targetArea = targetRect.width * targetRect.height;
  var intersectionRect = this.intersectionRect;
  var intersectionArea = intersectionRect.width * intersectionRect.height;

  // Sets intersection ratio.
  if (targetArea) {
    // Round the intersection ratio to avoid floating point math issues:
    // https://github.com/w3c/IntersectionObserver/issues/324
    this.intersectionRatio = Number((intersectionArea / targetArea).toFixed(4));
  } else {
    // If area is zero and is intersecting, sets to 1, otherwise to 0
    this.intersectionRatio = this.isIntersecting ? 1 : 0;
  }
}


/**
 * Creates the global IntersectionObserver constructor.
 * https://w3c.github.io/IntersectionObserver/#intersection-observer-interface
 * @param {Function} callback The function to be invoked after intersection
 *     changes have queued. The function is not invoked if the queue has
 *     been emptied by calling the `takeRecords` method.
 * @param {Object=} opt_options Optional configuration options.
 * @constructor
 */
function IntersectionObserver(callback, opt_options) {

  var options = opt_options || {};

  if (typeof callback != 'function') {
    throw new Error('callback must be a function');
  }

  if (
    options.root &&
    options.root.nodeType != 1 &&
    options.root.nodeType != 9
  ) {
    throw new Error('root must be a Document or Element');
  }

  // Binds and throttles `this._checkForIntersections`.
  this._checkForIntersections = throttle(
      this._checkForIntersections.bind(this), this.THROTTLE_TIMEOUT);

  // Private properties.
  this._callback = callback;
  this._observationTargets = [];
  this._queuedEntries = [];
  this._rootMarginValues = this._parseRootMargin(options.rootMargin);

  // Public properties.
  this.thresholds = this._initThresholds(options.threshold);
  this.root = options.root || null;
  this.rootMargin = this._rootMarginValues.map(function(margin) {
    return margin.value + margin.unit;
  }).join(' ');

  /** @private @const {!Array<!Document>} */
  this._monitoringDocuments = [];
  /** @private @const {!Array<function()>} */
  this._monitoringUnsubscribes = [];
}


/**
 * The minimum interval within which the document will be checked for
 * intersection changes.
 */
IntersectionObserver.prototype.THROTTLE_TIMEOUT = 100;


/**
 * The frequency in which the polyfill polls for intersection changes.
 * this can be updated on a per instance basis and must be set prior to
 * calling `observe` on the first target.
 */
IntersectionObserver.prototype.POLL_INTERVAL = null;

/**
 * Use a mutation observer on the root element
 * to detect intersection changes.
 */
IntersectionObserver.prototype.USE_MUTATION_OBSERVER = true;


/**
 * Sets up the polyfill in the cross-origin mode. The result is the
 * updater function that accepts two arguments: `boundingClientRect` and
 * `intersectionRect` - just as these fields would be available to the
 * parent via `IntersectionObserverEntry`. This function should be called
 * each time the iframe receives intersection information from the parent
 * window, e.g. via messaging.
 * @return {function(DOMRect|ClientRect, DOMRect|ClientRect)}
 */
IntersectionObserver._setupCrossOriginUpdater = function() {
  if (!crossOriginUpdater) {
    /**
     * @param {DOMRect|ClientRect} boundingClientRect
     * @param {DOMRect|ClientRect} intersectionRect
     */
    crossOriginUpdater = function(boundingClientRect, intersectionRect) {
      if (!boundingClientRect || !intersectionRect) {
        crossOriginRect = getEmptyRect();
      } else {
        crossOriginRect = convertFromParentRect(boundingClientRect, intersectionRect);
      }
      registry.forEach(function(observer) {
        observer._checkForIntersections();
      });
    };
  }
  return crossOriginUpdater;
};


/**
 * Resets the cross-origin mode.
 */
IntersectionObserver._resetCrossOriginUpdater = function() {
  crossOriginUpdater = null;
  crossOriginRect = null;
};


/**
 * Starts observing a target element for intersection changes based on
 * the thresholds values.
 * @param {Element} target The DOM element to observe.
 */
IntersectionObserver.prototype.observe = function(target) {
  var isTargetAlreadyObserved = this._observationTargets.some(function(item) {
    return item.element == target;
  });

  if (isTargetAlreadyObserved) {
    return;
  }

  if (!(target && target.nodeType == 1)) {
    throw new Error('target must be an Element');
  }

  this._registerInstance();
  this._observationTargets.push({element: target, entry: null});
  this._monitorIntersections(target.ownerDocument);
  this._checkForIntersections();
};


/**
 * Stops observing a target element for intersection changes.
 * @param {Element} target The DOM element to observe.
 */
IntersectionObserver.prototype.unobserve = function(target) {
  this._observationTargets =
      this._observationTargets.filter(function(item) {
        return item.element != target;
      });
  this._unmonitorIntersections(target.ownerDocument);
  if (this._observationTargets.length == 0) {
    this._unregisterInstance();
  }
};


/**
 * Stops observing all target elements for intersection changes.
 */
IntersectionObserver.prototype.disconnect = function() {
  this._observationTargets = [];
  this._unmonitorAllIntersections();
  this._unregisterInstance();
};


/**
 * Returns any queue entries that have not yet been reported to the
 * callback and clears the queue. This can be used in conjunction with the
 * callback to obtain the absolute most up-to-date intersection information.
 * @return {Array} The currently queued entries.
 */
IntersectionObserver.prototype.takeRecords = function() {
  var records = this._queuedEntries.slice();
  this._queuedEntries = [];
  return records;
};


/**
 * Accepts the threshold value from the user configuration object and
 * returns a sorted array of unique threshold values. If a value is not
 * between 0 and 1 and error is thrown.
 * @private
 * @param {Array|number=} opt_threshold An optional threshold value or
 *     a list of threshold values, defaulting to [0].
 * @return {Array} A sorted list of unique and valid threshold values.
 */
IntersectionObserver.prototype._initThresholds = function(opt_threshold) {
  var threshold = opt_threshold || [0];
  if (!Array.isArray(threshold)) threshold = [threshold];

  return threshold.sort().filter(function(t, i, a) {
    if (typeof t != 'number' || isNaN(t) || t < 0 || t > 1) {
      throw new Error('threshold must be a number between 0 and 1 inclusively');
    }
    return t !== a[i - 1];
  });
};


/**
 * Accepts the rootMargin value from the user configuration object
 * and returns an array of the four margin values as an object containing
 * the value and unit properties. If any of the values are not properly
 * formatted or use a unit other than px or %, and error is thrown.
 * @private
 * @param {string=} opt_rootMargin An optional rootMargin value,
 *     defaulting to '0px'.
 * @return {Array<Object>} An array of margin objects with the keys
 *     value and unit.
 */
IntersectionObserver.prototype._parseRootMargin = function(opt_rootMargin) {
  var marginString = opt_rootMargin || '0px';
  var margins = marginString.split(/\s+/).map(function(margin) {
    var parts = /^(-?\d*\.?\d+)(px|%)$/.exec(margin);
    if (!parts) {
      throw new Error('rootMargin must be specified in pixels or percent');
    }
    return {value: parseFloat(parts[1]), unit: parts[2]};
  });

  // Handles shorthand.
  margins[1] = margins[1] || margins[0];
  margins[2] = margins[2] || margins[0];
  margins[3] = margins[3] || margins[1];

  return margins;
};


/**
 * Starts polling for intersection changes if the polling is not already
 * happening, and if the page's visibility state is visible.
 * @param {!Document} doc
 * @private
 */
IntersectionObserver.prototype._monitorIntersections = function(doc) {
  var win = doc.defaultView;
  if (!win) {
    // Already destroyed.
    return;
  }
  if (this._monitoringDocuments.indexOf(doc) != -1) {
    // Already monitoring.
    return;
  }

  // Private state for monitoring.
  var callback = this._checkForIntersections;
  var monitoringInterval = null;
  var domObserver = null;

  // If a poll interval is set, use polling instead of listening to
  // resize and scroll events or DOM mutations.
  if (this.POLL_INTERVAL) {
    monitoringInterval = win.setInterval(callback, this.POLL_INTERVAL);
  } else {
    addEvent(win, 'resize', callback, true);
    addEvent(doc, 'scroll', callback, true);
    if (this.USE_MUTATION_OBSERVER && 'MutationObserver' in win) {
      domObserver = new win.MutationObserver(callback);
      domObserver.observe(doc, {
        attributes: true,
        childList: true,
        characterData: true,
        subtree: true
      });
    }
  }

  this._monitoringDocuments.push(doc);
  this._monitoringUnsubscribes.push(function() {
    // Get the window object again. When a friendly iframe is destroyed, it
    // will be null.
    var win = doc.defaultView;

    if (win) {
      if (monitoringInterval) {
        win.clearInterval(monitoringInterval);
      }
      removeEvent(win, 'resize', callback, true);
    }

    removeEvent(doc, 'scroll', callback, true);
    if (domObserver) {
      domObserver.disconnect();
    }
  });

  // Also monitor the parent.
  var rootDoc =
    (this.root && (this.root.ownerDocument || this.root)) || document;
  if (doc != rootDoc) {
    var frame = getFrameElement(doc);
    if (frame) {
      this._monitorIntersections(frame.ownerDocument);
    }
  }
};


/**
 * Stops polling for intersection changes.
 * @param {!Document} doc
 * @private
 */
IntersectionObserver.prototype._unmonitorIntersections = function(doc) {
  var index = this._monitoringDocuments.indexOf(doc);
  if (index == -1) {
    return;
  }

  var rootDoc =
    (this.root && (this.root.ownerDocument || this.root)) || document;

  // Check if any dependent targets are still remaining.
  var hasDependentTargets =
      this._observationTargets.some(function(item) {
        var itemDoc = item.element.ownerDocument;
        // Target is in this context.
        if (itemDoc == doc) {
          return true;
        }
        // Target is nested in this context.
        while (itemDoc && itemDoc != rootDoc) {
          var frame = getFrameElement(itemDoc);
          itemDoc = frame && frame.ownerDocument;
          if (itemDoc == doc) {
            return true;
          }
        }
        return false;
      });
  if (hasDependentTargets) {
    return;
  }

  // Unsubscribe.
  var unsubscribe = this._monitoringUnsubscribes[index];
  this._monitoringDocuments.splice(index, 1);
  this._monitoringUnsubscribes.splice(index, 1);
  unsubscribe();

  // Also unmonitor the parent.
  if (doc != rootDoc) {
    var frame = getFrameElement(doc);
    if (frame) {
      this._unmonitorIntersections(frame.ownerDocument);
    }
  }
};


/**
 * Stops polling for intersection changes.
 * @param {!Document} doc
 * @private
 */
IntersectionObserver.prototype._unmonitorAllIntersections = function() {
  var unsubscribes = this._monitoringUnsubscribes.slice(0);
  this._monitoringDocuments.length = 0;
  this._monitoringUnsubscribes.length = 0;
  for (var i = 0; i < unsubscribes.length; i++) {
    unsubscribes[i]();
  }
};


/**
 * Scans each observation target for intersection changes and adds them
 * to the internal entries queue. If new entries are found, it
 * schedules the callback to be invoked.
 * @private
 */
IntersectionObserver.prototype._checkForIntersections = function() {
  if (!this.root && crossOriginUpdater && !crossOriginRect) {
    // Cross origin monitoring, but no initial data available yet.
    return;
  }

  var rootIsInDom = this._rootIsInDom();
  var rootRect = rootIsInDom ? this._getRootRect() : getEmptyRect();

  this._observationTargets.forEach(function(item) {
    var target = item.element;
    var targetRect = getBoundingClientRect(target);
    var rootContainsTarget = this._rootContainsTarget(target);
    var oldEntry = item.entry;
    var intersectionRect = rootIsInDom && rootContainsTarget &&
        this._computeTargetAndRootIntersection(target, targetRect, rootRect);

    var rootBounds = null;
    if (!this._rootContainsTarget(target)) {
      rootBounds = getEmptyRect();
    } else if (!crossOriginUpdater || this.root) {
      rootBounds = rootRect;
    }

    var newEntry = item.entry = new IntersectionObserverEntry({
      time: now(),
      target: target,
      boundingClientRect: targetRect,
      rootBounds: rootBounds,
      intersectionRect: intersectionRect
    });

    if (!oldEntry) {
      this._queuedEntries.push(newEntry);
    } else if (rootIsInDom && rootContainsTarget) {
      // If the new entry intersection ratio has crossed any of the
      // thresholds, add a new entry.
      if (this._hasCrossedThreshold(oldEntry, newEntry)) {
        this._queuedEntries.push(newEntry);
      }
    } else {
      // If the root is not in the DOM or target is not contained within
      // root but the previous entry for this target had an intersection,
      // add a new record indicating removal.
      if (oldEntry && oldEntry.isIntersecting) {
        this._queuedEntries.push(newEntry);
      }
    }
  }, this);

  if (this._queuedEntries.length) {
    this._callback(this.takeRecords(), this);
  }
};


/**
 * Accepts a target and root rect computes the intersection between then
 * following the algorithm in the spec.
 * TODO(philipwalton): at this time clip-path is not considered.
 * https://w3c.github.io/IntersectionObserver/#calculate-intersection-rect-algo
 * @param {Element} target The target DOM element
 * @param {Object} targetRect The bounding rect of the target.
 * @param {Object} rootRect The bounding rect of the root after being
 *     expanded by the rootMargin value.
 * @return {?Object} The final intersection rect object or undefined if no
 *     intersection is found.
 * @private
 */
IntersectionObserver.prototype._computeTargetAndRootIntersection =
    function(target, targetRect, rootRect) {
  // If the element isn't displayed, an intersection can't happen.
  if (window.getComputedStyle(target).display == 'none') return;

  var intersectionRect = targetRect;
  var parent = getParentNode(target);
  var atRoot = false;

  while (!atRoot && parent) {
    var parentRect = null;
    var parentComputedStyle = parent.nodeType == 1 ?
        window.getComputedStyle(parent) : {};

    // If the parent isn't displayed, an intersection can't happen.
    if (parentComputedStyle.display == 'none') return null;

    if (parent == this.root || parent.nodeType == /* DOCUMENT */ 9) {
      atRoot = true;
      if (parent == this.root || parent == document) {
        if (crossOriginUpdater && !this.root) {
          if (!crossOriginRect ||
              crossOriginRect.width == 0 && crossOriginRect.height == 0) {
            // A 0-size cross-origin intersection means no-intersection.
            parent = null;
            parentRect = null;
            intersectionRect = null;
          } else {
            parentRect = crossOriginRect;
          }
        } else {
          parentRect = rootRect;
        }
      } else {
        // Check if there's a frame that can be navigated to.
        var frame = getParentNode(parent);
        var frameRect = frame && getBoundingClientRect(frame);
        var frameIntersect =
            frame &&
            this._computeTargetAndRootIntersection(frame, frameRect, rootRect);
        if (frameRect && frameIntersect) {
          parent = frame;
          parentRect = convertFromParentRect(frameRect, frameIntersect);
        } else {
          parent = null;
          intersectionRect = null;
        }
      }
    } else {
      // If the element has a non-visible overflow, and it's not the <body>
      // or <html> element, update the intersection rect.
      // Note: <body> and <html> cannot be clipped to a rect that's not also
      // the document rect, so no need to compute a new intersection.
      var doc = parent.ownerDocument;
      if (parent != doc.body &&
          parent != doc.documentElement &&
          parentComputedStyle.overflow != 'visible') {
        parentRect = getBoundingClientRect(parent);
      }
    }

    // If either of the above conditionals set a new parentRect,
    // calculate new intersection data.
    if (parentRect) {
      intersectionRect = computeRectIntersection(parentRect, intersectionRect);
    }
    if (!intersectionRect) break;
    parent = parent && getParentNode(parent);
  }
  return intersectionRect;
};


/**
 * Returns the root rect after being expanded by the rootMargin value.
 * @return {ClientRect} The expanded root rect.
 * @private
 */
IntersectionObserver.prototype._getRootRect = function() {
  var rootRect;
  if (this.root && !isDoc(this.root)) {
    rootRect = getBoundingClientRect(this.root);
  } else {
    // Use <html>/<body> instead of window since scroll bars affect size.
    var doc = isDoc(this.root) ? this.root : document;
    var html = doc.documentElement;
    var body = doc.body;
    rootRect = {
      top: 0,
      left: 0,
      right: html.clientWidth || body.clientWidth,
      width: html.clientWidth || body.clientWidth,
      bottom: html.clientHeight || body.clientHeight,
      height: html.clientHeight || body.clientHeight
    };
  }
  return this._expandRectByRootMargin(rootRect);
};


/**
 * Accepts a rect and expands it by the rootMargin value.
 * @param {DOMRect|ClientRect} rect The rect object to expand.
 * @return {ClientRect} The expanded rect.
 * @private
 */
IntersectionObserver.prototype._expandRectByRootMargin = function(rect) {
  var margins = this._rootMarginValues.map(function(margin, i) {
    return margin.unit == 'px' ? margin.value :
        margin.value * (i % 2 ? rect.width : rect.height) / 100;
  });
  var newRect = {
    top: rect.top - margins[0],
    right: rect.right + margins[1],
    bottom: rect.bottom + margins[2],
    left: rect.left - margins[3]
  };
  newRect.width = newRect.right - newRect.left;
  newRect.height = newRect.bottom - newRect.top;

  return newRect;
};


/**
 * Accepts an old and new entry and returns true if at least one of the
 * threshold values has been crossed.
 * @param {?IntersectionObserverEntry} oldEntry The previous entry for a
 *    particular target element or null if no previous entry exists.
 * @param {IntersectionObserverEntry} newEntry The current entry for a
 *    particular target element.
 * @return {boolean} Returns true if a any threshold has been crossed.
 * @private
 */
IntersectionObserver.prototype._hasCrossedThreshold =
    function(oldEntry, newEntry) {

  // To make comparing easier, an entry that has a ratio of 0
  // but does not actually intersect is given a value of -1
  var oldRatio = oldEntry && oldEntry.isIntersecting ?
      oldEntry.intersectionRatio || 0 : -1;
  var newRatio = newEntry.isIntersecting ?
      newEntry.intersectionRatio || 0 : -1;

  // Ignore unchanged ratios
  if (oldRatio === newRatio) return;

  for (var i = 0; i < this.thresholds.length; i++) {
    var threshold = this.thresholds[i];

    // Return true if an entry matches a threshold or if the new ratio
    // and the old ratio are on the opposite sides of a threshold.
    if (threshold == oldRatio || threshold == newRatio ||
        threshold < oldRatio !== threshold < newRatio) {
      return true;
    }
  }
};


/**
 * Returns whether or not the root element is an element and is in the DOM.
 * @return {boolean} True if the root element is an element and is in the DOM.
 * @private
 */
IntersectionObserver.prototype._rootIsInDom = function() {
  return !this.root || containsDeep(document, this.root);
};


/**
 * Returns whether or not the target element is a child of root.
 * @param {Element} target The target element to check.
 * @return {boolean} True if the target element is a child of root.
 * @private
 */
IntersectionObserver.prototype._rootContainsTarget = function(target) {
  var rootDoc =
    (this.root && (this.root.ownerDocument || this.root)) || document;
  return (
    containsDeep(rootDoc, target) &&
    (!this.root || rootDoc == target.ownerDocument)
  );
};


/**
 * Adds the instance to the global IntersectionObserver registry if it isn't
 * already present.
 * @private
 */
IntersectionObserver.prototype._registerInstance = function() {
  if (registry.indexOf(this) < 0) {
    registry.push(this);
  }
};


/**
 * Removes the instance from the global IntersectionObserver registry.
 * @private
 */
IntersectionObserver.prototype._unregisterInstance = function() {
  var index = registry.indexOf(this);
  if (index != -1) registry.splice(index, 1);
};


/**
 * Returns the result of the performance.now() method or null in browsers
 * that don't support the API.
 * @return {number} The elapsed time since the page was requested.
 */
function now() {
  return window.performance && performance.now && performance.now();
}


/**
 * Throttles a function and delays its execution, so it's only called at most
 * once within a given time period.
 * @param {Function} fn The function to throttle.
 * @param {number} timeout The amount of time that must pass before the
 *     function can be called again.
 * @return {Function} The throttled function.
 */
function throttle(fn, timeout) {
  var timer = null;
  return function () {
    if (!timer) {
      timer = setTimeout(function() {
        fn();
        timer = null;
      }, timeout);
    }
  };
}


/**
 * Adds an event handler to a DOM node ensuring cross-browser compatibility.
 * @param {Node} node The DOM node to add the event handler to.
 * @param {string} event The event name.
 * @param {Function} fn The event handler to add.
 * @param {boolean} opt_useCapture Optionally adds the even to the capture
 *     phase. Note: this only works in modern browsers.
 */
function addEvent(node, event, fn, opt_useCapture) {
  if (typeof node.addEventListener == 'function') {
    node.addEventListener(event, fn, opt_useCapture || false);
  }
  else if (typeof node.attachEvent == 'function') {
    node.attachEvent('on' + event, fn);
  }
}


/**
 * Removes a previously added event handler from a DOM node.
 * @param {Node} node The DOM node to remove the event handler from.
 * @param {string} event The event name.
 * @param {Function} fn The event handler to remove.
 * @param {boolean} opt_useCapture If the event handler was added with this
 *     flag set to true, it should be set to true here in order to remove it.
 */
function removeEvent(node, event, fn, opt_useCapture) {
  if (typeof node.removeEventListener == 'function') {
    node.removeEventListener(event, fn, opt_useCapture || false);
  }
  else if (typeof node.detatchEvent == 'function') {
    node.detatchEvent('on' + event, fn);
  }
}


/**
 * Returns the intersection between two rect objects.
 * @param {Object} rect1 The first rect.
 * @param {Object} rect2 The second rect.
 * @return {?Object|?ClientRect} The intersection rect or undefined if no
 *     intersection is found.
 */
function computeRectIntersection(rect1, rect2) {
  var top = Math.max(rect1.top, rect2.top);
  var bottom = Math.min(rect1.bottom, rect2.bottom);
  var left = Math.max(rect1.left, rect2.left);
  var right = Math.min(rect1.right, rect2.right);
  var width = right - left;
  var height = bottom - top;

  return (width >= 0 && height >= 0) && {
    top: top,
    bottom: bottom,
    left: left,
    right: right,
    width: width,
    height: height
  } || null;
}


/**
 * Shims the native getBoundingClientRect for compatibility with older IE.
 * @param {Element} el The element whose bounding rect to get.
 * @return {DOMRect|ClientRect} The (possibly shimmed) rect of the element.
 */
function getBoundingClientRect(el) {
  var rect;

  try {
    rect = el.getBoundingClientRect();
  } catch (err) {
    // Ignore Windows 7 IE11 "Unspecified error"
    // https://github.com/w3c/IntersectionObserver/pull/205
  }

  if (!rect) return getEmptyRect();

  // Older IE
  if (!(rect.width && rect.height)) {
    rect = {
      top: rect.top,
      right: rect.right,
      bottom: rect.bottom,
      left: rect.left,
      width: rect.right - rect.left,
      height: rect.bottom - rect.top
    };
  }
  return rect;
}


/**
 * Returns an empty rect object. An empty rect is returned when an element
 * is not in the DOM.
 * @return {ClientRect} The empty rect.
 */
function getEmptyRect() {
  return {
    top: 0,
    bottom: 0,
    left: 0,
    right: 0,
    width: 0,
    height: 0
  };
}


/**
 * Ensure that the result has all of the necessary fields of the DOMRect.
 * Specifically this ensures that `x` and `y` fields are set.
 *
 * @param {?DOMRect|?ClientRect} rect
 * @return {?DOMRect}
 */
function ensureDOMRect(rect) {
  // A `DOMRect` object has `x` and `y` fields.
  if (!rect || 'x' in rect) {
    return rect;
  }
  // A IE's `ClientRect` type does not have `x` and `y`. The same is the case
  // for internally calculated Rect objects. For the purposes of
  // `IntersectionObserver`, it's sufficient to simply mirror `left` and `top`
  // for these fields.
  return {
    top: rect.top,
    y: rect.top,
    bottom: rect.bottom,
    left: rect.left,
    x: rect.left,
    right: rect.right,
    width: rect.width,
    height: rect.height
  };
}


/**
 * Inverts the intersection and bounding rect from the parent (frame) BCR to
 * the local BCR space.
 * @param {DOMRect|ClientRect} parentBoundingRect The parent's bound client rect.
 * @param {DOMRect|ClientRect} parentIntersectionRect The parent's own intersection rect.
 * @return {ClientRect} The local root bounding rect for the parent's children.
 */
function convertFromParentRect(parentBoundingRect, parentIntersectionRect) {
  var top = parentIntersectionRect.top - parentBoundingRect.top;
  var left = parentIntersectionRect.left - parentBoundingRect.left;
  return {
    top: top,
    left: left,
    height: parentIntersectionRect.height,
    width: parentIntersectionRect.width,
    bottom: top + parentIntersectionRect.height,
    right: left + parentIntersectionRect.width
  };
}


/**
 * Checks to see if a parent element contains a child element (including inside
 * shadow DOM).
 * @param {Node} parent The parent element.
 * @param {Node} child The child element.
 * @return {boolean} True if the parent node contains the child node.
 */
function containsDeep(parent, child) {
  var node = child;
  while (node) {
    if (node == parent) return true;

    node = getParentNode(node);
  }
  return false;
}


/**
 * Gets the parent node of an element or its host element if the parent node
 * is a shadow root.
 * @param {Node} node The node whose parent to get.
 * @return {Node|null} The parent node or null if no parent exists.
 */
function getParentNode(node) {
  var parent = node.parentNode;

  if (node.nodeType == /* DOCUMENT */ 9 && node != document) {
    // If this node is a document node, look for the embedding frame.
    return getFrameElement(node);
  }

  // If the parent has element that is assigned through shadow root slot
  if (parent && parent.assignedSlot) {
    parent = parent.assignedSlot.parentNode
  }

  if (parent && parent.nodeType == 11 && parent.host) {
    // If the parent is a shadow root, return the host element.
    return parent.host;
  }

  return parent;
}

/**
 * Returns true if `node` is a Document.
 * @param {!Node} node
 * @returns {boolean}
 */
function isDoc(node) {
  return node && node.nodeType === 9;
}


// Exposes the constructors globally.
window.IntersectionObserver = IntersectionObserver;
window.IntersectionObserverEntry = IntersectionObserverEntry;

}());


/***/ }),

/***/ "./node_modules/js-cookie/src/js.cookie.js":
/*!*************************************************!*\
  !*** ./node_modules/js-cookie/src/js.cookie.js ***!
  \*************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

var __WEBPACK_AMD_DEFINE_FACTORY__, __WEBPACK_AMD_DEFINE_RESULT__;/*!
 * JavaScript Cookie v2.2.1
 * https://github.com/js-cookie/js-cookie
 *
 * Copyright 2006, 2015 Klaus Hartl & Fagner Brack
 * Released under the MIT license
 */
;(function (factory) {
	var registeredInModuleLoader;
	if (true) {
		!(__WEBPACK_AMD_DEFINE_FACTORY__ = (factory),
				__WEBPACK_AMD_DEFINE_RESULT__ = (typeof __WEBPACK_AMD_DEFINE_FACTORY__ === 'function' ?
				(__WEBPACK_AMD_DEFINE_FACTORY__.call(exports, __webpack_require__, exports, module)) :
				__WEBPACK_AMD_DEFINE_FACTORY__),
				__WEBPACK_AMD_DEFINE_RESULT__ !== undefined && (module.exports = __WEBPACK_AMD_DEFINE_RESULT__));
		registeredInModuleLoader = true;
	}
	if (true) {
		module.exports = factory();
		registeredInModuleLoader = true;
	}
	if (!registeredInModuleLoader) {
		var OldCookies = window.Cookies;
		var api = window.Cookies = factory();
		api.noConflict = function () {
			window.Cookies = OldCookies;
			return api;
		};
	}
}(function () {
	function extend () {
		var i = 0;
		var result = {};
		for (; i < arguments.length; i++) {
			var attributes = arguments[ i ];
			for (var key in attributes) {
				result[key] = attributes[key];
			}
		}
		return result;
	}

	function decode (s) {
		return s.replace(/(%[0-9A-Z]{2})+/g, decodeURIComponent);
	}

	function init (converter) {
		function api() {}

		function set (key, value, attributes) {
			if (typeof document === 'undefined') {
				return;
			}

			attributes = extend({
				path: '/'
			}, api.defaults, attributes);

			if (typeof attributes.expires === 'number') {
				attributes.expires = new Date(new Date() * 1 + attributes.expires * 864e+5);
			}

			// We're using "expires" because "max-age" is not supported by IE
			attributes.expires = attributes.expires ? attributes.expires.toUTCString() : '';

			try {
				var result = JSON.stringify(value);
				if (/^[\{\[]/.test(result)) {
					value = result;
				}
			} catch (e) {}

			value = converter.write ?
				converter.write(value, key) :
				encodeURIComponent(String(value))
					.replace(/%(23|24|26|2B|3A|3C|3E|3D|2F|3F|40|5B|5D|5E|60|7B|7D|7C)/g, decodeURIComponent);

			key = encodeURIComponent(String(key))
				.replace(/%(23|24|26|2B|5E|60|7C)/g, decodeURIComponent)
				.replace(/[\(\)]/g, escape);

			var stringifiedAttributes = '';
			for (var attributeName in attributes) {
				if (!attributes[attributeName]) {
					continue;
				}
				stringifiedAttributes += '; ' + attributeName;
				if (attributes[attributeName] === true) {
					continue;
				}

				// Considers RFC 6265 section 5.2:
				// ...
				// 3.  If the remaining unparsed-attributes contains a %x3B (";")
				//     character:
				// Consume the characters of the unparsed-attributes up to,
				// not including, the first %x3B (";") character.
				// ...
				stringifiedAttributes += '=' + attributes[attributeName].split(';')[0];
			}

			return (document.cookie = key + '=' + value + stringifiedAttributes);
		}

		function get (key, json) {
			if (typeof document === 'undefined') {
				return;
			}

			var jar = {};
			// To prevent the for loop in the first place assign an empty array
			// in case there are no cookies at all.
			var cookies = document.cookie ? document.cookie.split('; ') : [];
			var i = 0;

			for (; i < cookies.length; i++) {
				var parts = cookies[i].split('=');
				var cookie = parts.slice(1).join('=');

				if (!json && cookie.charAt(0) === '"') {
					cookie = cookie.slice(1, -1);
				}

				try {
					var name = decode(parts[0]);
					cookie = (converter.read || converter)(cookie, name) ||
						decode(cookie);

					if (json) {
						try {
							cookie = JSON.parse(cookie);
						} catch (e) {}
					}

					jar[name] = cookie;

					if (key === name) {
						break;
					}
				} catch (e) {}
			}

			return key ? jar[key] : jar;
		}

		api.set = set;
		api.get = function (key) {
			return get(key, false /* read as raw */);
		};
		api.getJSON = function (key) {
			return get(key, true /* read as json */);
		};
		api.remove = function (key, attributes) {
			set(key, '', extend(attributes, {
				expires: -1
			}));
		};

		api.defaults = {};

		api.withConverter = init;

		return api;
	}

	return init(function () {});
}));


/***/ }),

/***/ "./node_modules/lozad/dist/lozad.min.js":
/*!**********************************************!*\
  !*** ./node_modules/lozad/dist/lozad.min.js ***!
  \**********************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

/*! lozad.js - v1.16.0 - 2020-09-06
* https://github.com/ApoorvSaxena/lozad.js
* Copyright (c) 2020 Apoorv Saxena; Licensed MIT */
!function(t,e){ true?module.exports=e():undefined}(this,function(){"use strict";
/**
   * Detect IE browser
   * @const {boolean}
   * @private
   */var g="undefined"!=typeof document&&document.documentMode,f={rootMargin:"0px",threshold:0,load:function(t){if("picture"===t.nodeName.toLowerCase()){var e=t.querySelector("img"),r=!1;null===e&&(e=document.createElement("img"),r=!0),g&&t.getAttribute("data-iesrc")&&(e.src=t.getAttribute("data-iesrc")),t.getAttribute("data-alt")&&(e.alt=t.getAttribute("data-alt")),r&&t.append(e)}if("video"===t.nodeName.toLowerCase()&&!t.getAttribute("data-src")&&t.children){for(var a=t.children,o=void 0,i=0;i<=a.length-1;i++)(o=a[i].getAttribute("data-src"))&&(a[i].src=o);t.load()}t.getAttribute("data-poster")&&(t.poster=t.getAttribute("data-poster")),t.getAttribute("data-src")&&(t.src=t.getAttribute("data-src")),t.getAttribute("data-srcset")&&t.setAttribute("srcset",t.getAttribute("data-srcset"));var n=",";if(t.getAttribute("data-background-delimiter")&&(n=t.getAttribute("data-background-delimiter")),t.getAttribute("data-background-image"))t.style.backgroundImage="url('"+t.getAttribute("data-background-image").split(n).join("'),url('")+"')";else if(t.getAttribute("data-background-image-set")){var d=t.getAttribute("data-background-image-set").split(n),u=d[0].substr(0,d[0].indexOf(" "))||d[0];// Substring before ... 1x
u=-1===u.indexOf("url(")?"url("+u+")":u,1===d.length?t.style.backgroundImage=u:t.setAttribute("style",(t.getAttribute("style")||"")+"background-image: "+u+"; background-image: -webkit-image-set("+d+"); background-image: image-set("+d+")")}t.getAttribute("data-toggle-class")&&t.classList.toggle(t.getAttribute("data-toggle-class"))},loaded:function(){}};function A(t){t.setAttribute("data-loaded",!0)}var m=function(t){return"true"===t.getAttribute("data-loaded")},v=function(t){var e=1<arguments.length&&void 0!==arguments[1]?arguments[1]:document;return t instanceof Element?[t]:t instanceof NodeList?t:e.querySelectorAll(t)};return function(){var r,a,o=0<arguments.length&&void 0!==arguments[0]?arguments[0]:".lozad",t=1<arguments.length&&void 0!==arguments[1]?arguments[1]:{},e=Object.assign({},f,t),i=e.root,n=e.rootMargin,d=e.threshold,u=e.load,g=e.loaded,s=void 0;"undefined"!=typeof window&&window.IntersectionObserver&&(s=new IntersectionObserver((r=u,a=g,function(t,e){t.forEach(function(t){(0<t.intersectionRatio||t.isIntersecting)&&(e.unobserve(t.target),m(t.target)||(r(t.target),A(t.target),a(t.target)))})}),{root:i,rootMargin:n,threshold:d}));for(var c,l=v(o,i),b=0;b<l.length;b++)(c=l[b]).getAttribute("data-placeholder-background")&&(c.style.background=c.getAttribute("data-placeholder-background"));return{observe:function(){for(var t=v(o,i),e=0;e<t.length;e++)m(t[e])||(s?s.observe(t[e]):(u(t[e]),A(t[e]),g(t[e])))},triggerLoad:function(t){m(t)||(u(t),A(t),g(t))},observer:s}}});


/***/ }),

/***/ "./node_modules/sal.js/dist/sal.js":
/*!*****************************************!*\
  !*** ./node_modules/sal.js/dist/sal.js ***!
  \*****************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

!function(e,t){ true?module.exports=t():undefined}(this,(function(){return(()=>{"use strict";var e={855:(e,t,n)=>{function r(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function o(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?r(Object(n),!0).forEach((function(t){a(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):r(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function a(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}n.d(t,{default:()=>E});var s="Sal was not initialised! Probably it is used in SSR.",i="Your browser does not support IntersectionObserver!\nGet a polyfill from here:\nhttps://github.com/w3c/IntersectionObserver/tree/master/polyfill",l={root:null,rootMargin:"0% 50%",threshold:.5,animateClassName:"sal-animate",disabledClassName:"sal-disabled",enterEventName:"sal:in",exitEventName:"sal:out",selector:"[data-sal]",once:!0,disabled:!1},c=[],u=null,d=function(e){e&&e!==l&&(l=o(o({},l),e))},f=function(e){e.classList.remove(l.animateClassName)},b=function(e,t){var n=new CustomEvent(e,{bubbles:!0,detail:t});t.target.dispatchEvent(n)},p=function(){document.body.classList.add(l.disabledClassName)},m=function(){u.disconnect(),u=null},v=function(){return l.disabled||"function"==typeof l.disabled&&l.disabled()},y=function(e,t){e.forEach((function(e){var n=e.target,r=void 0!==n.dataset.salRepeat,o=void 0!==n.dataset.salOnce,a=r||!(o||l.once);e.intersectionRatio>=l.threshold?(function(e){e.target.classList.add(l.animateClassName),b(l.enterEventName,e)}(e),a||t.unobserve(n)):a&&function(e){f(e.target),b(l.exitEventName,e)}(e)}))},O=function(){var e=[].filter.call(document.querySelectorAll(l.selector),(function(e){return!function(e){return e.classList.contains(l.animateClassName)}(e,l.animateClassName)}));return e.forEach((function(e){return u.observe(e)})),e},h=function(){p(),m()},g=function(){document.body.classList.remove(l.disabledClassName),u=new IntersectionObserver(y,{root:l.root,rootMargin:l.rootMargin,threshold:l.threshold}),c=O()},w=function(){var e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};m(),Array.from(document.querySelectorAll(l.selector)).forEach(f),d(e),g()},j=function(){var e=O();c.push(e)};const E=function(){var e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:l;if(d(e),"undefined"==typeof window)return console.warn(s),{elements:c,disable:h,enable:g,reset:w,update:j};if(!window.IntersectionObserver)throw p(),Error(i);return v()?p():g(),{elements:c,disable:h,enable:g,reset:w,update:j}}}},t={};function n(r){if(t[r])return t[r].exports;var o=t[r]={exports:{}};return e[r](o,o.exports,n),o.exports}return n.d=(e,t)=>{for(var r in t)n.o(t,r)&&!n.o(e,r)&&Object.defineProperty(e,r,{enumerable:!0,get:t[r]})},n.o=(e,t)=>Object.prototype.hasOwnProperty.call(e,t),n(855)})().default}));
//# sourceMappingURL=sal.js.map

/***/ }),

/***/ "./node_modules/smooth-scroll/dist/smooth-scroll.min.js":
/*!**************************************************************!*\
  !*** ./node_modules/smooth-scroll/dist/smooth-scroll.min.js ***!
  \**************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

/* WEBPACK VAR INJECTION */(function(global) {var __WEBPACK_AMD_DEFINE_ARRAY__, __WEBPACK_AMD_DEFINE_RESULT__;/*! smooth-scroll v16.1.3 | (c) 2020 Chris Ferdinandi | MIT License | http://github.com/cferdinandi/smooth-scroll */
!(function(e,t){ true?!(__WEBPACK_AMD_DEFINE_ARRAY__ = [], __WEBPACK_AMD_DEFINE_RESULT__ = (function(){return t(e)}).apply(exports, __WEBPACK_AMD_DEFINE_ARRAY__),
				__WEBPACK_AMD_DEFINE_RESULT__ !== undefined && (module.exports = __WEBPACK_AMD_DEFINE_RESULT__)):undefined})("undefined"!=typeof global?global:"undefined"!=typeof window?window:this,(function(C){"use strict";var w={ignore:"[data-scroll-ignore]",header:null,topOnEmptyHash:!0,speed:500,speedAsDuration:!1,durationMax:null,durationMin:null,clip:!0,offset:0,easing:"easeInOutCubic",customEasing:null,updateURL:!0,popstate:!0,emitEvents:!0},L=function(){var n={};return Array.prototype.forEach.call(arguments,(function(e){for(var t in e){if(!e.hasOwnProperty(t))return;n[t]=e[t]}})),n},r=function(e){"#"===e.charAt(0)&&(e=e.substr(1));for(var t,n=String(e),o=n.length,a=-1,r="",i=n.charCodeAt(0);++a<o;){if(0===(t=n.charCodeAt(a)))throw new InvalidCharacterError("Invalid character: the input contains U+0000.");1<=t&&t<=31||127==t||0===a&&48<=t&&t<=57||1===a&&48<=t&&t<=57&&45===i?r+="\\"+t.toString(16)+" ":r+=128<=t||45===t||95===t||48<=t&&t<=57||65<=t&&t<=90||97<=t&&t<=122?n.charAt(a):"\\"+n.charAt(a)}return"#"+r},H=function(){return Math.max(document.body.scrollHeight,document.documentElement.scrollHeight,document.body.offsetHeight,document.documentElement.offsetHeight,document.body.clientHeight,document.documentElement.clientHeight)},q=function(e){return e?(t=e,parseInt(C.getComputedStyle(t).height,10)+e.offsetTop):0;var t},x=function(e,t,n){0===e&&document.body.focus(),n||(e.focus(),document.activeElement!==e&&(e.setAttribute("tabindex","-1"),e.focus(),e.style.outline="none"),C.scrollTo(0,t))},Q=function(e,t,n,o){if(t.emitEvents&&"function"==typeof C.CustomEvent){var a=new CustomEvent(e,{bubbles:!0,detail:{anchor:n,toggle:o}});document.dispatchEvent(a)}};return function(o,e){var O,a,I,M,A={};A.cancelScroll=function(e){cancelAnimationFrame(M),M=null,e||Q("scrollCancel",O)},A.animateScroll=function(a,r,e){A.cancelScroll();var i=L(O||w,e||{}),s="[object Number]"===Object.prototype.toString.call(a),t=s||!a.tagName?null:a;if(s||t){var c=C.pageYOffset;i.header&&!I&&(I=document.querySelector(i.header));var n,o,u,l,d,f,m,h,p=q(I),g=s?a:(function(e,t,n,o){var a=0;if(e.offsetParent)for(;a+=e.offsetTop,e=e.offsetParent;);return a=Math.max(a-t-n,0),o&&(a=Math.min(a,H()-C.innerHeight)),a})(t,p,parseInt("function"==typeof i.offset?i.offset(a,r):i.offset,10),i.clip),y=g-c,v=H(),S=0,E=(n=y,u=(o=i).speedAsDuration?o.speed:Math.abs(n/1e3*o.speed),o.durationMax&&u>o.durationMax?o.durationMax:o.durationMin&&u<o.durationMin?o.durationMin:parseInt(u,10)),b=function(e){var t,n,o;l||(l=e),S+=e-l,f=c+y*(n=d=1<(d=0===E?0:S/E)?1:d,"easeInQuad"===(t=i).easing&&(o=n*n),"easeOutQuad"===t.easing&&(o=n*(2-n)),"easeInOutQuad"===t.easing&&(o=n<.5?2*n*n:(4-2*n)*n-1),"easeInCubic"===t.easing&&(o=n*n*n),"easeOutCubic"===t.easing&&(o=--n*n*n+1),"easeInOutCubic"===t.easing&&(o=n<.5?4*n*n*n:(n-1)*(2*n-2)*(2*n-2)+1),"easeInQuart"===t.easing&&(o=n*n*n*n),"easeOutQuart"===t.easing&&(o=1- --n*n*n*n),"easeInOutQuart"===t.easing&&(o=n<.5?8*n*n*n*n:1-8*--n*n*n*n),"easeInQuint"===t.easing&&(o=n*n*n*n*n),"easeOutQuint"===t.easing&&(o=1+--n*n*n*n*n),"easeInOutQuint"===t.easing&&(o=n<.5?16*n*n*n*n*n:1+16*--n*n*n*n*n),t.customEasing&&(o=t.customEasing(n)),o||n),C.scrollTo(0,Math.floor(f)),(function(e,t){var n=C.pageYOffset;if(e==t||n==t||(c<t&&C.innerHeight+n)>=v)return A.cancelScroll(!0),x(a,t,s),Q("scrollStop",i,a,r),!(M=l=null)})(f,g)||(M=C.requestAnimationFrame(b),l=e)};0===C.pageYOffset&&C.scrollTo(0,0),m=a,h=i,s||history.pushState&&h.updateURL&&history.pushState({smoothScroll:JSON.stringify(h),anchor:m.id},document.title,m===document.documentElement?"#top":"#"+m.id),"matchMedia"in C&&C.matchMedia("(prefers-reduced-motion)").matches?x(a,Math.floor(g),!1):(Q("scrollStart",i,a,r),A.cancelScroll(!0),C.requestAnimationFrame(b))}};var t=function(e){if(!e.defaultPrevented&&!(0!==e.button||e.metaKey||e.ctrlKey||e.shiftKey)&&"closest"in e.target&&(a=e.target.closest(o))&&"a"===a.tagName.toLowerCase()&&!e.target.closest(O.ignore)&&a.hostname===C.location.hostname&&a.pathname===C.location.pathname&&/#/.test(a.href)){var t,n;try{t=r(decodeURIComponent(a.hash))}catch(e){t=r(a.hash)}if("#"===t){if(!O.topOnEmptyHash)return;n=document.documentElement}else n=document.querySelector(t);(n=n||"#top"!==t?n:document.documentElement)&&(e.preventDefault(),(function(e){if(history.replaceState&&e.updateURL&&!history.state){var t=C.location.hash;t=t||"",history.replaceState({smoothScroll:JSON.stringify(e),anchor:t||C.pageYOffset},document.title,t||C.location.href)}})(O),A.animateScroll(n,a))}},n=function(e){if(null!==history.state&&history.state.smoothScroll&&history.state.smoothScroll===JSON.stringify(O)){var t=history.state.anchor;"string"==typeof t&&t&&!(t=document.querySelector(r(history.state.anchor)))||A.animateScroll(t,null,{updateURL:!1})}};A.destroy=function(){O&&(document.removeEventListener("click",t,!1),C.removeEventListener("popstate",n,!1),A.cancelScroll(),M=I=a=O=null)};return (function(){if(!("querySelector"in document&&"addEventListener"in C&&"requestAnimationFrame"in C&&"closest"in C.Element.prototype))throw"Smooth Scroll: This browser does not support the required JavaScript methods and browser APIs.";A.destroy(),O=L(w,e||{}),I=O.header?document.querySelector(O.header):null,document.addEventListener("click",t,!1),O.updateURL&&O.popstate&&C.addEventListener("popstate",n,!1)})(),A}}));
/* WEBPACK VAR INJECTION */}.call(this, __webpack_require__(/*! ./../../webpack/buildin/global.js */ "./node_modules/webpack/buildin/global.js")))

/***/ }),

/***/ "./node_modules/webpack/buildin/global.js":
/*!***********************************!*\
  !*** (webpack)/buildin/global.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports) {

var g;

// This works in non-strict mode
g = (function() {
	return this;
})();

try {
	// This works if eval is allowed (see CSP)
	g = g || new Function("return this")();
} catch (e) {
	// This works if the window reference is available
	if (typeof window === "object") g = window;
}

// g can still be undefined, but nothing to do about it...
// We return undefined, instead of nothing here, so it's
// easier to handle this case. if(!global) { ...}

module.exports = g;


/***/ }),

/***/ "./src/assets/scripts/index.js":
/*!*************************************!*\
  !*** ./src/assets/scripts/index.js ***!
  \*************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


var _tooltipNativeEsm = __webpack_require__(/*! bootstrap.native/dist/components/tooltip-native.esm.js */ "./node_modules/bootstrap.native/dist/components/tooltip-native.esm.js");

var Tooltip = _interopRequireDefault(_tooltipNativeEsm).default;

var _dropdownNativeEsm = __webpack_require__(/*! bootstrap.native/dist/components/dropdown-native.esm.js */ "./node_modules/bootstrap.native/dist/components/dropdown-native.esm.js");

var Dropdown = _interopRequireDefault(_dropdownNativeEsm).default;

var _collapseNativeEsm = __webpack_require__(/*! bootstrap.native/dist/components/collapse-native.esm.js */ "./node_modules/bootstrap.native/dist/components/collapse-native.esm.js");

var Collapse = _interopRequireDefault(_collapseNativeEsm).default;

var _sal = __webpack_require__(/*! sal.js/dist/sal.js */ "./node_modules/sal.js/dist/sal.js");

var sal = _interopRequireDefault(_sal).default;

var _lozad = __webpack_require__(/*! lozad */ "./node_modules/lozad/dist/lozad.min.js");

var lozad = _interopRequireDefault(_lozad).default;

var _smoothScrollMin = __webpack_require__(/*! smooth-scroll/dist/smooth-scroll.min.js */ "./node_modules/smooth-scroll/dist/smooth-scroll.min.js");

var SmoothScroll = _interopRequireDefault(_smoothScrollMin).default;

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

//Add lozad intersection observer polyfill for older browsers
__webpack_require__(/*! intersection-observer */ "./node_modules/intersection-observer/intersection-observer.js"); //Load JS Cookie


const Cookies = __webpack_require__(/*! js-cookie */ "./node_modules/js-cookie/src/js.cookie.js"); //Add native bootstrap components we need only


const observer = lozad(); // lazy loads elements with default selector as '.lozad'

observer.observe(); //Smooth scroll for the Trust Center page

var scroll = new SmoothScroll('a.button.filter-button[href*="#"]');
let lang = window.navigator.languages ? window.navigator.languages[0] : null;
lang = lang || window.navigator.language || window.navigator.browserLanguage || window.navigator.userLanguage;
let shortLang = lang;
if (shortLang.indexOf('-') !== -1) shortLang = shortLang.split('-')[0];
if (shortLang.indexOf('_') !== -1) shortLang = shortLang.split('_')[0]; //Try to automatically send FR/DE/ES traffic to their home page unless they specified a lang pref

if (window.location.pathname === '/') {
  if (typeof Cookies.get('langPref') == 'undefined') {
    if (shortLang !== 'en') {
      if (shortLang === 'fr') window.location = '/fr/';
      if (shortLang === 'es') window.location = '/es/';
      if (shortLang === 'de') window.location = '/de/';
    }
  } else {
    if (Cookies.get('langPref') === 'lang-fr') window.location = '/fr/';
    if (Cookies.get('langPref') === 'lang-es') window.location = '/es/';
    if (Cookies.get('langPref') === 'lang-de') window.location = '/de/';
  }
}

document.addEventListener('DOMContentLoaded', function (e) {
  //assign cookie for lang pref to overide home page auto redirect away from EN
  const langTriggers = document.querySelectorAll('#langDropdown + .dropdown-menu a.dropdown-item');

  for (const langTrigger of langTriggers) {
    langTrigger.addEventListener('click', function (event) {
      Cookies.set('langPref', this.id);
    });
  } //lazy load wistia js


  const wistiaTriggers = document.querySelectorAll('.wistia_embed button,.wistia_embed .button');

  if (wistiaTriggers) {
    window._wq = window._wq || [];

    for (const wistiaTrigger of wistiaTriggers) {
      wistiaTrigger.addEventListener('click', function (event) {
        var ev1 = document.createElement('script');
        ev1.src = '//fast.wistia.com/assets/external/E-v1.js';
        ev1.async = true;
        ev1.charset = 'ISO-8859-1';
        document.head.appendChild(ev1);
        let videoId = event.target.dataset.wistiaId;

        _wq.push({
          id: videoId,
          onReady: function (video) {
            video.play();
          }
        });
      });
    }
  } //force wistia load if wvideo param is set


  const urlParams = new URLSearchParams(window.location.search);
  const wistiaParam = urlParams.get('wvideo');

  if (wistiaParam) {
    console.log(wistiaParam);
    var qv1 = document.createElement('script');
    qv1.src = '//fast.wistia.com/assets/external/E-v1.js';
    qv1.async = true;
    qv1.charset = 'ISO-8859-1';
    document.head.appendChild(qv1);
    let videoId = wistiaParam;

    _wq.push({
      id: videoId,
      onReady: function (video) {
        video.play();
      }
    });
  }

  const doc = document.documentElement;
  var prevScroll = window.scrollY || doc.scrollTop;
  var curScroll;
  var direction = 0;
  var prevDirection = 0;
  const header = document.getElementById('myNavbar');

  const toggleHeader = function (direction, curScroll) {
    if (!document.querySelector('#mainNav').classList.contains('show')) {
      if (direction === 2 && curScroll > 118) {
        header.classList.add('hide');
        prevDirection = direction;
      } else if (direction === 1) {
        header.classList.remove('hide');
        prevDirection = direction;
      }
    }
  };

  const checkScroll = function () {
    /*
     ** Find the direction of scroll
     ** 0 - initial, 1 - up, 2 - down
     */
    curScroll = window.scrollY || doc.scrollTop; // 1 for scrolled up, 2 for scrolled down

    direction = curScroll > prevScroll ? 2 : 1;

    if (direction !== prevDirection) {
      toggleHeader(direction, curScroll);
    }

    prevScroll = curScroll;
  };

  window.addEventListener('scroll', checkScroll); // Non transparent once past header

  const navbar = document.querySelector('.navbar');
  const spot = document.querySelector('.hero-section');
  const firstSection = document.querySelector('main section:first-of-type');
  const options = {
    root: null,
    rootMargin: '0px',
    threshhold: 0
  };

  const handleScroll = entries => {
    const spotIsVisible = entries[0].isIntersecting;

    if (spotIsVisible) {
      navbar.classList.remove('white');
    } else {
      navbar.classList.add('white');
    }
  };

  const observer = new IntersectionObserver(handleScroll, options);

  if (spot) {
    observer.observe(spot);
  } else {
    observer.observe(firstSection);
  } //open all external links in a new tab


  let links = document.links;

  for (var i = 0, linksLength = links.length; i < linksLength; i++) {
    if (links[i].hostname != window.location.hostname && !links[i].classList.contains('login-link')) {
      links[i].target = '_blank';
      links[i].rel = 'noopener';
    }
  }

  let isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent); //swap out cta links for mobile

  if (isMobile) {
    let mobileSignupLinks = document.querySelectorAll('a[data-mobile-signup]');

    if (mobileSignupLinks) {
      mobileSignupLinks.forEach(function (elem) {
        //swap the link with the data-mobile-signup value
        elem.setAttribute('href', elem.dataset.mobileSignup);
        elem.removeAttribute('target');
      });
    }
  } //loop feature videos on hover

  /*let featureClips = document.querySelectorAll('#highlights article');
  if(featureClips) {
    featureClips.forEach(function(elem) {
        elem.addEventListener('mouseover', function(){
          elem.querySelector('video').play();
        });
        elem.addEventListener('mouseout', function(){
          elem.querySelector('video').pause();
        });
    });
  }*/
  //initialize sal.js library used for animations


  sal({
    threshold: 0.33
  }); //init global nav mobile collapse

  let myCollapseInit = new Collapse('button#navcollapse'); //dropdown menus must be manually initialized

  let productDropdown = new Dropdown('#productDropdown', true);
  let resourcesDropdown = new Dropdown('#resourcesDropdown', true);

  if (document.querySelector('#langDropdown')) {
    let langDropdown = new Dropdown('#langDropdown', true);
  } //init tooltip on all elements with title attribute


  let elementsTooltip = document.querySelectorAll('.has-tooltip[title]'); // attach a tooltip for each

  Array.from(elementsTooltip).map(tip => new Tooltip(tip, {
    placement: 'bottom',
    animation: 'slideNfade',
    delay: 200
  }));
  /* TRAKING COOKIES */

  var parseQueryString = function (queryString) {
    var params = {},
        queries,
        temp,
        i,
        l; // Split into key/value pairs

    queries = queryString.split('&'); // Convert the array of strings into an object

    for (i = 0, l = queries.length; i < l; i++) {
      temp = queries[i].split('=');
      params[temp[0]] = temp[1];
    }

    return params;
  };

  var createCookie = function (name, value, days, domain) {
    var expires = '';

    if (days) {
      var date = new Date();
      date.setTime(date.getTime() + days * 24 * 60 * 60 * 1000);
      expires = '; expires=' + date.toGMTString();
    }

    document.cookie = name + '=' + value + expires + '; domain=' + domain + '; path=/';
  };

  var readCookie = function (name) {
    var nameEQ = name + '=';
    var ca = document.cookie.split(';');

    for (var i = 0; i < ca.length; i++) {
      var c = ca[i];

      while (c.charAt(0) == ' ') c = c.substring(1, c.length);

      if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }

    return null;
  };

  var queryString = document.location.search;

  if (queryString.length > 0) {
    queryString = queryString.substring(1);
  } // Track ambassadors


  var queryParams = parseQueryString(queryString);

  if (queryParams['mbsy']) {
    createCookie('mbsy', queryParams['mbsy'], 90, 'agorapulse.com');
  }

  var ambassadorCookie = readCookie('mbsy'); // Track acquisition channels

  var acquisitionSourceCookie = readCookie('acquisition_source');

  if (!acquisitionSourceCookie && document.referrer.search('https?://(.*)www.agorapulse.([^/?]*)') !== 0) {
    var acquisitionCampaign = '';
    var acquisitionMedium = '';
    var acquisitionSource = '';
    var referrer = document.referrer; // Acquisition source

    if (queryParams['utm_source'] && referrer.search('https?://(.*)agorapulse.([^/?]*)') !== 0) {
      // Ignore legacy utm from barometer/contest
      acquisitionSource = queryParams['utm_source'];
    } else if (referrer.length > 0) {
      if (referrer.search('https?://(.*)google.([^/?]*)') === 0) {
        acquisitionSource = 'google';
      } else if (referrer.search('https?://(.*)bing.([^/?]*)') === 0) {
        acquisitionSource = 'bing';
      } else if (referrer.search('https?://(.*)yahoo.([^/?]*)') === 0) {
        acquisitionSource = 'yahoo';
      } else if (referrer.search('https?://(.*)facebook.([^/?]*)') === 0 || referrer.search('https?://(.*)fb.me.([^/?]*)') === 0) {
        acquisitionSource = 'facebook';
      } else if (referrer.search('https?://(.*)twitter.([^/?]*)') === 0 || referrer.search('https?://(.*)t.co.([^/?]*)') === 0) {
        acquisitionSource = 'twitter';
      } else if (referrer.search('https?://(.*)linkedin.([^/?]*)') === 0 || referrer.search('https?://(.*)lnkd.in.([^/?]*)') === 0) {
        acquisitionSource = 'linkedin';
      } else if (referrer.search('https?://(.*)plus.google.([^/?]*)') === 0) {
        acquisitionSource = 'google+';
      } else if (referrer.search('https?://(.*)pinterest.([^/?]*)') === 0) {
        acquisitionSource = 'pinterest';
      } else if (referrer.search('https?://(.*)instagram.([^/?]*)') === 0) {
        acquisitionSource = 'instagram';
      } else if (referrer.search('https?://(.*)agorapulse.([^/?]*)') === 0) {
        acquisitionSource = 'agorapulse';
      }
    }

    if (queryParams['utm_medium']) {
      acquisitionMedium = queryParams['utm_medium'];
    } else if (acquisitionSource === 'google' || acquisitionSource === 'bing' || acquisitionSource === 'yahoo') {
      if (document.location.pathname.indexOf('/blog') > -1) {
        acquisitionMedium = 'organic-blog';
      } else {
        acquisitionMedium = 'organic';
      }
    } else if (acquisitionSource === 'facebook' || acquisitionSource === 'twitter' || acquisitionSource === 'linkedin' || acquisitionSource === 'google+' || acquisitionSource === 'pinterest' || acquisitionSource === 'instagram' || acquisitionSource === 'agorapulse') {
      if (document.location.pathname.indexOf('/blog') > -1) {
        acquisitionMedium = 'social-blog';
      } else {
        acquisitionMedium = 'social';
      }
    }

    if (queryParams['utm_campaign']) {
      acquisitionCampaign = queryParams['utm_campaign'];
    }

    if (acquisitionSource !== '' && acquisitionMedium !== '') {
      createCookie('acquisition_source', acquisitionSource, 90, 'agorapulse.com');
      createCookie('acquisition_medium', acquisitionMedium, 90, 'agorapulse.com');

      if (acquisitionCampaign !== '') {
        createCookie('acquisition_campaign', acquisitionCampaign, 90, 'agorapulse.com');
      }
    }
  } // Hubspot page tagging


  var _hsq = window._hsq = window._hsq || [];

  _hsq.push(['setContentType', 'site-page']);
});

/***/ }),

/***/ "./src/assets/styles/index.scss":
/*!**************************************!*\
  !*** ./src/assets/styles/index.scss ***!
  \**************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

// extracted by mini-css-extract-plugin

/***/ }),

/***/ 0:
/*!**************************************************************************!*\
  !*** multi ./src/assets/scripts/index.js ./src/assets/styles/index.scss ***!
  \**************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

__webpack_require__(/*! C:\Users\Nanie\Desktop\www\agorapulse-www-static\src\assets\scripts\index.js */"./src/assets/scripts/index.js");
module.exports = __webpack_require__(/*! C:\Users\Nanie\Desktop\www\agorapulse-www-static\src\assets\styles\index.scss */"./src/assets/styles/index.scss");


/***/ })

/******/ });
//# sourceMappingURL=index.js.map