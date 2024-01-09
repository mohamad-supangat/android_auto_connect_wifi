// ==UserScript==
// @name            Auto Login Wifi
// @namespace       https://stackoverflow.com
// @version         1.0
// @description     Automatically log in to Wifi Login Page
// @match           *://wifi.jvm/*
// @grant           none
// @require         https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js
// ==/UserScript==

// Replace these with your own credentials
var username = "anggi";
var password = "";

// Wait for the page to load
$(document).ready(function () {
  $("#username").val(username);
  $("#password").val(password);
  $("#loginform").submit();
});

