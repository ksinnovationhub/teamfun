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
/******/ 	return __webpack_require__(__webpack_require__.s = 9);
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/assets/scripts/pages/agencies.js":
/*!**********************************************!*\
  !*** ./src/assets/scripts/pages/agencies.js ***!
  \**********************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


var _screenshots = __webpack_require__(/*! ../utils/screenshots */ "./src/assets/scripts/utils/screenshots.js");

var screenshotsAccordion = _screenshots.screenshotsAccordion;
document.addEventListener('DOMContentLoaded', function (e) {
  screenshotsAccordion();
});

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

/***/ "./src/assets/styles/pages/agencies.scss":
/*!***********************************************!*\
  !*** ./src/assets/styles/pages/agencies.scss ***!
  \***********************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

// extracted by mini-css-extract-plugin

/***/ }),

/***/ 9:
/*!********************************************************************************************!*\
  !*** multi ./src/assets/scripts/pages/agencies.js ./src/assets/styles/pages/agencies.scss ***!
  \********************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

__webpack_require__(/*! C:\Users\Nanie\Desktop\www\agorapulse-www-static\src\assets\scripts\pages\agencies.js */"./src/assets/scripts/pages/agencies.js");
module.exports = __webpack_require__(/*! C:\Users\Nanie\Desktop\www\agorapulse-www-static\src\assets\styles\pages\agencies.scss */"./src/assets/styles/pages/agencies.scss");


/***/ })

/******/ });
//# sourceMappingURL=agencies.js.map