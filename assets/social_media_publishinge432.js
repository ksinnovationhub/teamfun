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
/******/ 	return __webpack_require__(__webpack_require__.s = 6);
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/assets/scripts/pages/social-media-publishing.js":
/*!*************************************************************!*\
  !*** ./src/assets/scripts/pages/social-media-publishing.js ***!
  \*************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


var _video = __webpack_require__(/*! ../utils/video */ "./src/assets/scripts/utils/video.js");

var loadHeroVideo = _video.loadHeroVideo;

var _faq = __webpack_require__(/*! ../utils/faq */ "./src/assets/scripts/utils/faq.js");

var faqAccordion = _faq.faqAccordion;

var _screenshots = __webpack_require__(/*! ../utils/screenshots */ "./src/assets/scripts/utils/screenshots.js");

var screenshotsAccordion = _screenshots.screenshotsAccordion;

var _animations = __webpack_require__(/*! ../utils/animations */ "./src/assets/scripts/utils/animations.js");

var triggerHighlightAnimations = _animations.triggerHighlightAnimations;
document.addEventListener('DOMContentLoaded', function (e) {
  loadHeroVideo();
  faqAccordion();
  screenshotsAccordion();
  triggerHighlightAnimations();
});

/***/ }),

/***/ "./src/assets/scripts/utils/animations.js":
/*!************************************************!*\
  !*** ./src/assets/scripts/utils/animations.js ***!
  \************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
const highlightAnimationIds = ['highlight-first-animation', 'highlight-second-animation', 'highlight-third-animation'];

const isInViewport = exports.isInViewport = element => {
  var bounding = element.getBoundingClientRect();
  return bounding.top >= 0 && bounding.left >= 0 && bounding.bottom <= (window.innerHeight || document.documentElement.clientHeight) && bounding.right <= (window.innerWidth || document.documentElement.clientWidth);
};

const triggerAnimations = animationId => {
  const isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);
  const element = document.getElementById(animationId);

  if (!isMobile) {
    element.addEventListener('mouseover', function () {
      element.firstElementChild.play();
    });
  } else {
    window.addEventListener('scroll', function () {
      if (isInViewport(element)) {
        element.firstElementChild.play();
      }
    });
  }
};

const triggerHighlightAnimations = () => highlightAnimationIds.map(animationId => triggerAnimations(animationId));

exports.triggerAnimations = triggerAnimations;
exports.triggerHighlightAnimations = triggerHighlightAnimations;

/***/ }),

/***/ "./src/assets/scripts/utils/faq.js":
/*!*****************************************!*\
  !*** ./src/assets/scripts/utils/faq.js ***!
  \*****************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});

const faqAccordion = () => {
  //FAQ accordion
  let faqRows = document.querySelectorAll('.faq-row');
  const moreQuestionsBtn = document.querySelector('.more-questions-button');

  if (faqRows.length > 0) {
    if (faqRows.length < 5) {
      moreQuestionsBtn.style.display = 'none';
    }

    faqRows.forEach(item => {
      item.addEventListener('click', event => {
        item.classList.toggle('open-faq');
      });
    }); //FAQ more

    if (moreQuestionsBtn) {
      moreQuestionsBtn.addEventListener('click', event => {
        event.preventDefault();
        moreQuestionsBtn.style.display = 'none';
        document.querySelector('#faqs .module.partial-faq').classList.remove('partial-faq');
      });
    }
  }
};

exports.faqAccordion = faqAccordion;

/***/ }),

/***/ "./src/assets/scripts/utils/screenshots.js":
/*!*************************************************!*\
  !*** ./src/assets/scripts/utils/screenshots.js ***!
  \*************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

const screenshotsAccordion = () => {
  //Screenshots accordion
  const panels = document.querySelectorAll('.feature-row');
  let openedPanel = document.querySelectorAll('.open-feature')[0];

  async function toggleOpen() {
    let currentPanel = document.querySelectorAll('.open-feature')[0];

    if (!this.classList.contains('open-feature')) {
      if (openedPanel) openedPanel.classList.remove('open-feature');
      this.classList.add('open-feature');
      openedPanel = this;
      let featureImg = openedPanel.getAttribute('data-feature-img');
      let featureSkin = openedPanel.getAttribute('data-feature-skin');
      let currentSkin = currentPanel.getAttribute('data-feature-skin');
      let screenshots = document.querySelectorAll('.screenshot');
      let widget = document.querySelector('#home-features');
      let accent = document.querySelector('.bottom-accent');
      screenshots.forEach(function (el) {
        el.style.opacity = 0;
        el.style.transform = 'translateX(20%)';
      });

      if (typeof featureSkin != 'undefined' && featureSkin != null) {
        accent.style.transform = 'scale(0)';
        await sleep(360);
        screenshots.forEach(function (el) {
          el.style.backgroundImage = 'url(' + featureImg + ')';
        });
        await sleep(360);
        widget.classList = featureSkin + ' buddy-' + featureSkin;
        screenshots.forEach(function (el) {
          el.style.opacity = 1;
          el.style.transform = 'none';
        });
        accent.style.opacity = 1;
        accent.style.transform = 'none';
      } else {
        await sleep(360);
        screenshots.forEach(function (el) {
          el.style.backgroundImage = 'url(' + featureImg + ')';
        });
        await sleep(360);
        screenshots.forEach(function (el) {
          el.style.opacity = 1;
          el.style.transform = 'none';
        });
      }
    }
  }

  panels.forEach(panel => panel.addEventListener('click', toggleOpen));
};

exports.screenshotsAccordion = screenshotsAccordion;

/***/ }),

/***/ "./src/assets/scripts/utils/video.js":
/*!*******************************************!*\
  !*** ./src/assets/scripts/utils/video.js ***!
  \*******************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});

const loadHeroVideo = () => {
  //load hero video on product pages
  let isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);
  let heroVideo = document.querySelector('#hero-bg-video source');

  if (heroVideo) {
    let mp4 = document.querySelector('#hero-bg-video');

    if (isMobile) {
      heroVideo.setAttribute('data-src', mp4.dataset.videoMobile);
    } else {
      heroVideo.setAttribute('data-src', mp4.dataset.video);
    }
  }
};

exports.loadHeroVideo = loadHeroVideo;

/***/ }),

/***/ "./src/assets/styles/pages/social-media-publishing.scss":
/*!**************************************************************!*\
  !*** ./src/assets/styles/pages/social-media-publishing.scss ***!
  \**************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

// extracted by mini-css-extract-plugin

/***/ }),

/***/ 6:
/*!**************************************************************************************************************************!*\
  !*** multi ./src/assets/scripts/pages/social-media-publishing.js ./src/assets/styles/pages/social-media-publishing.scss ***!
  \**************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

__webpack_require__(/*! C:\Users\Nanie\Desktop\www\agorapulse-www-static\src\assets\scripts\pages\social-media-publishing.js */"./src/assets/scripts/pages/social-media-publishing.js");
module.exports = __webpack_require__(/*! C:\Users\Nanie\Desktop\www\agorapulse-www-static\src\assets\styles\pages\social-media-publishing.scss */"./src/assets/styles/pages/social-media-publishing.scss");


/***/ })

/******/ });
//# sourceMappingURL=social_media_publishing.js.map