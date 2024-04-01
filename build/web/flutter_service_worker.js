'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "6a12c2551fdbdb938589c5795301eff2",
"version.json": "943e4c29d5c7cb9ac48a0e985c769a41",
"index.html": "d600a9d6cd9dbb10c29ce0ae707c1561",
"/": "d600a9d6cd9dbb10c29ce0ae707c1561",
"main.dart.js": "b2b0c2008bf289ae23ee95da7cdc17c1",
"flutter.js": "b12cdd674701e8e0d3758e0f6465c1ce",
"favicon.png": "415554d81c7aa44af1fcd69372d09636",
"icons/Icon-192.png": "5896402340c16892b5554f88f25fb088",
"icons/Icon-maskable-192.png": "5896402340c16892b5554f88f25fb088",
"icons/Icon-maskable-512.png": "ff122f8d1399877553a9713f576bb699",
"icons/Icon-512.png": "ff122f8d1399877553a9713f576bb699",
"manifest.json": "5f90c5fdd8b807dd6397e4dad5b16245",
"assets/images/ic_skill_flutter.png": "1133c0f80f3e3f3175b0fb451fdf3627",
"assets/images/img_xpora.png": "7060ab6b29b1094a6d29b12ce27bd695",
"assets/images/ic_kotlin.png": "901b3d39e1a7aaf96204021ecf30038c",
"assets/images/img_pm.png": "b07456487342bebb8e4dac57b48378af",
"assets/images/ic_skill_firebase.png": "bb1a5d77f49f009a4d411c95fb351764",
"assets/images/raden_logo.png": "8dbbc166109ebac9474c68a4aa70ce4f",
"assets/images/img_octo_v2.png": "770cf178f654bac323a43c60604ecf41",
"assets/images/ic_skill_kotlin.png": "d62a5afa5369001af5d3169b62dcab06",
"assets/images/ic_javascript.png": "e7595fbbe2770ee6c5e47dbc39a54dd6",
"assets/images/img_pfd.png": "81c8fec59886710256f66a32a1bbb987",
"assets/images/ic_skill_android.png": "d375dbb0823519d17a63c679340cd6be",
"assets/images/img_octo_v1.png": "1e98928e82c27cf2ff8d4550d5a516c5",
"assets/images/ic_jira.png": "660c1539b98ead5e2a055ed74a052ec2",
"assets/images/ic_confluence.png": "0caadb3e3b1a6137af14e9ad38a312dc",
"assets/images/ic_go.png": "a1ee5a86251a0b4ac5143c17a3a7c130",
"assets/images/ic_skill_counfluence.png": "260b46f715db6d2589041e370e629471",
"assets/images/ic_prodia.png": "1a73f56330fb5104143f2fae79034a2f",
"assets/images/ic_footer_ig.png": "103742c5d4d523e2c2ac3488e383f278",
"assets/images/img_ethos.png": "aa33eb86b54e1a8a825f9279587830d6",
"assets/images/ic_github.png": "ced57473e1ad70c6adaef3b31ed249de",
"assets/images/ic_footer_linkedin.png": "8c9af29f32db1871eb2aa8ce6ecf720e",
"assets/images/work_milestone.png": "a023ed78580ce4bf79d996cb2e0d1afe",
"assets/images/ic_skill_jira.png": "c31b9f250f995df5f35e0669802ef053",
"assets/images/profile.png": "8c8f0b4af3a17287ff360353af956e90",
"assets/images/ic_bni.png": "c1ae1e97171a47218fa6a27b09be45c7",
"assets/images/ic_octo.png": "39a227d555449d0b75c028fa4ded3e77",
"assets/images/ic_footer_git.png": "02ad4bcbd145a4287bd2df3844ab8a54",
"assets/images/ic_firebase.png": "f9f57903e983912e72a3e4b697593829",
"assets/images/ic_footer_twitter.png": "d99e05847e4a5312277867d5adb5df42",
"assets/images/ic_skill_github.png": "1d86fdc4780b7b9e5e3490a8ee1f03b9",
"assets/images/ic_flutter.png": "bc4d7e16d134e0d9b6ba2afb872cf69e",
"assets/images/ic_skill_bitbucket.png": "0e6ed424def67dd2ce91e63c47335e69",
"assets/images/ic_bitbucket.png": "f7ed6a0b31dcedf71f35c25dafa2902e",
"assets/images/img_banner_section.png": "736da6044ccf59acd6be0966e7325385",
"assets/AssetManifest.json": "2a526a8cac2f0e8a0eac000d2f0d04b4",
"assets/NOTICES": "8dbbdc8f6614ace5b6bfb3ad48a0f14e",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "d40591da2aee778481924352d3ad07b7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "1136b342e75e8a83c9a4c6547e18bbe9",
"assets/fonts/MaterialIcons-Regular.otf": "dd6ff7e8292e86b6a03b856bad9cd50e",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "cbf6a89cd1f4f7829afd09d2d0eeae49",
"canvaskit/canvaskit.js.symbols": "d4d3cc6c2cc9b88d99240ecb6875783b",
"canvaskit/skwasm.wasm": "48b85ec403db5995f1409926864126c2",
"canvaskit/chromium/canvaskit.js.symbols": "bcdcec154e7d466d41e8b0adaa01bac3",
"canvaskit/chromium/canvaskit.js": "2f82009588e8a72043db753d360d488f",
"canvaskit/chromium/canvaskit.wasm": "d2105413146c0bffad1e69eb4a396a56",
"canvaskit/canvaskit.js": "7737f5fc722b6a040ac15271ea8d92fb",
"canvaskit/canvaskit.wasm": "e3cd3f7175233908cd6ba91681c9c6f1",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
