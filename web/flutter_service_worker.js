'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "f2215861df81ddb99cfec1d389af5c2e",
"version.json": "cb0239f6211614b671ba2a6b4e1e780f",
"index.html": "15b990554876400692433e30d842e024",
"/": "15b990554876400692433e30d842e024",
"main.dart.js": "165567928c9c6c0410e13a4bd9698ce3",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "cbc2e630b6ac5f863c36021f3206ed19",
".git/ORIG_HEAD": "3ef8e67dccc38efe32459bf6f5ce80eb",
".git/config": "114ae81c64a6d84c55582babdc1daee0",
".git/objects/95/0a843b25295aa6efe3dfae8d58982464fecf99": "f67b462fa2f2c9b778f52605b80dc002",
".git/objects/92/85f002049577535a40179094faceb07533eecc": "b2c64dade33239d051d9c0a02179a193",
".git/objects/0c/50d306b69372da414b447c0f67af39ebdc6f1b": "575727e23e0af7ff00f7fe89bfe27b6b",
".git/objects/3e/7b6967e12d3b73f3c5c14093b1270b1f220555": "af3924523821cafc5ce2ed1af6c05ff9",
".git/objects/68/04df64c26320fe3664791ba593f49c94b19cbb": "0d98d562d1adcb4bf8a0f8610b94e8bb",
".git/objects/03/eaddffb9c0e55fb7b5f9b378d9134d8d75dd37": "87850ce0a3dd72f458581004b58ac0d6",
".git/objects/9b/500b37f7c7c8468fb558a57f003b4e46c7d20e": "b43245ff28cd31c7e23377d71d83ae18",
".git/objects/04/1797c9c9cbff7f3b088035191dbe0527d2d845": "8d1edb8a63710d67e73f8cd1b8619586",
".git/objects/69/ac045cb903949e516114993f66090a626dbfb1": "f91ae1c08904d2fc952a59c5777b5be2",
".git/objects/69/dd618354fa4dade8a26e0fd18f5e87dd079236": "8cc17911af57a5f6dc0b9ee255bb1a93",
".git/objects/3c/016338ef6f8fe8b6180762b263e3819978feea": "3a2be177792b06b45294898cd75a95a6",
".git/objects/56/65864ccd0c4a6b673d992e331143d72b67c9e5": "cb712c5cd3fdfe8a4bc8ef716e6d3f5c",
".git/objects/56/df5588dab9e624884970ff2911b544fd2e554e": "16a9961c9f660bd59460c48211943332",
".git/objects/3d/89dcfbc1b2d1a1fdb813840d1e1455a4673d85": "5a13c13efff5b32fb749a58ec3c1f14f",
".git/objects/58/f9b2b9ca9013d9919e804a21f2a470006c8ce6": "5539d6395c99fedf1db9973b60570a17",
".git/objects/0b/bf4bc53ab3f18a6b8ed7b7c611eef4cb62b9b1": "ed8b1420e96765c3597fe45da8e41cf2",
".git/objects/93/2a8a36560086da2ff7f63c041ad52778dc5489": "6051a30b335279806d041b5dbccf3949",
".git/objects/bb/68ee6503e1edc60f5443b986f1d5795875f38d": "501f2cd0abac5d27068a3486162428b2",
".git/objects/bb/ab349a2696f978d1eaf88d40e25d6e132ad9f9": "275d76d5a915479e81d11afdbed3bdfb",
".git/objects/d7/9995d7ccea812e3b8d92a41ffcbb718cf29362": "27631963b9013926ebc6b42991c0fcf7",
".git/objects/a5/0cf455190425b7b87f5c62def182b2837eb9fc": "520a491674b42b88a2cb5db04bfa7617",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/f4/ca121a7702b6bb1ff56d0a02ffb64da5e9d437": "0310be56655de93c4c1cf378c5c85e6a",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/c0/d07c8c622cc9da6bdcb1416e82560fa898d1e0": "8af97b79edbe33ef6d5303792ce3a76b",
".git/objects/fd/789b11a5ed3c3ed7890af8f318726715bcf52f": "be458dcb65862bb0cd0be5c355726db5",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/ed/01bdf2955f94e9c9be4f7bcf57ba07445cfc9b": "063d8bef4ae3445f18f56b53d78345d5",
".git/objects/c6/06caa16378473a4bb9e8807b6f43e69acf30ad": "ed187e1b169337b5fbbce611844136c6",
".git/objects/c6/8a9660679b4a2752ed3b2a2fdb3179865c9494": "7779d59adc941ec71b4c2f63084e3595",
".git/objects/ec/b154511634efd1fef3278b84bba5e7a686ed36": "56896d512c302335ba9de12b0c54437e",
".git/objects/ec/4bb95282a8b3d0fbba35719fb39743ec090a43": "a8e9c8d0abb1d425733fad44d5ddb856",
".git/objects/ec/361605e9e785c47c62dd46a67f9c352731226b": "d1eafaea77b21719d7c450bcf18236d6",
".git/objects/27/a297abdda86a3cbc2d04f0036af1e62ae008c7": "51d74211c02d96c368704b99da4022d5",
".git/objects/pack/pack-2f98615a0bd0175475a961e2ddfa4c166dc848ba.rev": "49ca6447fa46a205766c51d69ee0bcb2",
".git/objects/pack/pack-2f98615a0bd0175475a961e2ddfa4c166dc848ba.pack": "c8e6dc12c984ed04c3889e110ebc593f",
".git/objects/pack/pack-2f98615a0bd0175475a961e2ddfa4c166dc848ba.idx": "bf694216a9e390e8daa4bb16ef25a147",
".git/objects/29/c95c6328baca4ac4032fc0655393ab95fd2eb3": "8bc4912ca32514d84d94b4ea1c3b4701",
".git/objects/29/a140144539d9c9b99be26f6c39c44e7938d09d": "f08007fc8a2a22ded0d97385a464c94c",
".git/objects/89/861be31e63ad4344e4446473333c718f78f886": "b2f4247e8a6130c33c1616b4576a3722",
".git/objects/45/269189218ace7a93e50f57386ae4c3d7228b47": "45f45f3072cc0abf1f1e4e432381303b",
".git/objects/1f/65b29d361d5104d95f4cfd65eee182ffb8683e": "8f4a73857bab43da803a75205b53ce42",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/73/7f149c855c9ccd61a5e24ce64783eaf921c709": "1d813736c393435d016c1bfc46a6a3a6",
".git/objects/74/5211a3e0e3e68576b565aefc8cf61f93889af3": "165a4e564251650f289f481f9f6c883f",
".git/objects/8f/e7af5a3e840b75b70e59c3ffda1b58e84a5a1c": "e3695ae5742d7e56a9c696f82745288d",
".git/objects/8f/1b0813ffbbf64757852717cedcd46a66a888ec": "8ab7f0d571da512d3a229947fa547d90",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/4c/e58334859a28c05b16f5dace370165970944de": "097869ab6fc279e64ae30e2a4e280deb",
".git/objects/26/6e09345ef241d6d54f06cab536b26c75266dbb": "f19d84cd29fd542d6f08403d48038c14",
".git/objects/75/779efff818fb82509cebf21a79d8fd4aba7e1b": "afe431b8a917ee52952a7931a1911b6c",
".git/objects/86/7d598072a48b0c81330572ae45bf5867c35798": "dc9f6a5cac92cdff714d2de5b33d9543",
".git/objects/72/1d7a7821807d1c1cce24eadf3054318714c1e6": "5732f519f8d9208665025df18baa3fa5",
".git/objects/2f/6b613f504248db3b94928ce60ad5dbd7bc52c7": "448f9dd95be817383212105a16a80fec",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/9f/f2a29f35dea8bb9d634dff8869738af1b2d1d6": "271cd280b3be18d8b47aea61b9c14a8a",
".git/objects/9f/098723b86b560ac000efec81e4896110a0cab6": "e94e93b300c95f6ba1640e9358e3a9d2",
".git/objects/36/0e911051d939e9d4040ac80a1bd2e56c10c001": "4ad42f3ed2688c63115654a6a2b7f8fa",
".git/objects/5d/3768c73d1e1bc1aa864214d46a1aeb91f2611e": "ca97ba0320b609a3f20cd897ce96ff6b",
".git/objects/91/9a2e3be5f7c49ed1969950ae17ecc1f988fcfe": "dfb6b9b5695e7c3c1426a408182cd5d1",
".git/objects/96/d55a298295023e4bbb9fac5994cc45787956a3": "3b2e56b40b401cb851b5d76d474271fd",
".git/objects/3a/8239bbb4a04a2b356ac04991cbb261d477f204": "5d3cb99d8f8444cec98991df1210bb0d",
".git/objects/08/d51a23f3a98dd161e772010ba2e039e92cddf0": "fc9ababf80298b46579b7ea39d86c078",
".git/objects/6d/5f0fdc7ccbdf7d01fc607eb818f81a0165627e": "2b2403c52cb620129b4bbc62f12abd57",
".git/objects/06/3f66cf7cc2d08f51fa659f2f80db91dba9f0ca": "00503e60d1466d06d4f87099298fd0b6",
".git/objects/39/217f7303f6701991377303da6e6369096a91d1": "82ee2a745d2afd2a09042bd1348f8acc",
".git/objects/55/d539eebbdc22895cee28a3787bf784797c9da1": "497418ca498ae326f09e68bc7829f103",
".git/objects/97/8a4d89de1d1e20408919ec3f54f9bba275d66f": "dbaa9c6711faa6123b43ef2573bc1457",
".git/objects/63/6931bcaa0ab4c3ff63c22d54be8c048340177b": "8cc9c6021cbd64a862e0e47758619fb7",
".git/objects/0f/ca4635a9785c5557e1da5110aa49dccec9d5ee": "141f0574ecd28b1f751a9170727bf0d6",
".git/objects/bf/a00e4175d669f465b4ab2f04fe1d9bb80cce43": "0db8fae6837aa1c2074edaf6e0c5dc56",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/ba/8efd34b39a9d7495ede9fdc87e30df5ef30d78": "9016a5f189f3de6111457f23c5cec60b",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "8f96f41fe1f2721c9e97d75caa004410",
".git/objects/b1/afd5429fbe3cc7a88b89f454006eb7b018849a": "e4c2e016668208ba57348269fcb46d7b",
".git/objects/dc/fef7860ae55f416de9d5b069581c7927e936e2": "741d7a5c17867dc60d9868abadabf1d3",
".git/objects/b6/818640a344966c2fb8e9310ecadc6d399b1d22": "32789117457b468d62bea60d38aedc00",
".git/objects/a9/667ba25b21dbc37ac1492d8303c982f0cb8024": "6a0466f41a26023ee41b28aebea32e16",
".git/objects/a9/d83578a0879e7b3d280d809ca1ac7b64b8829d": "4ec25e78b6e5ba85308e15a3eecc7afb",
".git/objects/af/31ef4d98c006d9ada76f407195ad20570cc8e1": "a9d4d1360c77d67b4bb052383a3bdfd9",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/a8/9a4d0782b161335f0f9cfe6acd98599e3c6697": "10a37e95ee8a94f55b57f945e67acc99",
".git/objects/a6/faa171c3ae3057ad0b6b0614cf4dcf9fb20fc3": "e605c4801f23e7bf9dc7918477df12bb",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/c3/e81f822689e3b8c05262eec63e4769e0dea74c": "8c6432dca0ea3fdc0d215dcc05d00a66",
".git/objects/f7/cd26ecb4b0e27ce9ed8849d471c6a915eb85ed": "cc8701a2c0a2e4c42962cc58630ab60e",
".git/objects/f7/623ce5c10a8d0f007512461a2adad3c2d1acac": "6214741756f39266e2f07301137ac545",
".git/objects/c5/8fcb31d7c9ba455a09baa5ea1bcbf269c493fe": "19f8f7ff268201b92d2d4a4e9c4784b7",
".git/objects/c2/6a615b3d41338c8d6312ab945195f476b47307": "5b8b7bbc81d84190b3ea0fb203c2c7b3",
".git/objects/ce/a8048f4d4b81ddaa612cbb29b6b78796646c47": "08c1a34b7bc906b2c8f4fd440b9591c7",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/79/6763ce60605cef27f337b0760a19e3b1110e71": "70449e6fadbe88746cbe0b3d4b74a948",
".git/objects/2d/fcdbe9f2df0332cee24295b9c0a4cdbf2478b7": "b40637ed7a305a7a7296f4f96b139cc1",
".git/objects/83/65a0f4dfe4a56836d7da906edd95f3c6b623f7": "bd277158611f88662214db81e0fefbd7",
".git/objects/1b/b28a9b00787ed6543240b2ecabe4671c3f246f": "a823ae56bc6dcd6b874aaf0c62b13002",
".git/objects/48/0235863d15ee3cb8b4db7ddca4d11dda8e7b23": "01d3e068e5effacf17825fec3c6262b2",
".git/objects/4f/346c3e43f95e778d7cef3cb6ceede9cd2bf1c8": "99981890f1649c8ef95c28d9e5a27d4e",
".git/objects/4f/b7eff2f53830e51af030d1de71a1f77a5d87e7": "7def3e8995da151a42b25c33b51aa54e",
".git/objects/8d/e474c010199a725b75b6d6e94956969f5b9edb": "fdea80390e78031191d346ecf9fbccdf",
".git/objects/8d/465b28289b1e5dddd225575bb0c5b4b09da771": "ef82d12bec5bbdb541ebd43e9c2beee8",
".git/objects/15/b1b6982c959586ff30c3a073ffe4125f530929": "417f51a36b3c3440cb58b06b3cf6b029",
".git/objects/8c/1fcd31c3ac92ee656041f2a238fbec4a42a604": "71bb9c6d7a5bdc5497001330b904e94d",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/76/2e5ff12d567bc10911bb892c2be448b4b7db06": "a3d4df8fb9739873f5a9ef61b09a5de3",
".git/objects/76/12ef78eb311c270c6b1d1a6a5598172f417137": "c6f2860a972abb128cbb58b1cf164541",
".git/objects/1c/aab6c23a7b634aae906cf1b835bfaed833cea7": "a799b3147d779930cd87cbd27b8527c6",
".git/objects/2b/e9a497c6bd5133c5161b39fca5d131183d206b": "fdb8c1b9a160ccb4278a29d25bb5e477",
".git/objects/47/4f7b3b240c29973171cef7df35b2d23f8c28e3": "7805ebddae591c91440ce14ec0f8842f",
".git/objects/78/e2a080a61698a7ac7fcdfa10ce40c1ee53ae2c": "cec66d4bcff7bda7e3d9631298d92317",
".git/objects/8b/d6481d38ebd1303ad6310188c4bd8e74361a7a": "0004181986b5e52db6566a13cb90851f",
".git/objects/7a/f822cd91d693a252fc759de40dbc5784b18092": "b3f417f64b30e71f1104be54f845a127",
".git/objects/8e/8dbeb41c85321c97f2fb2c642bb53d0a181a09": "bc80f7c96bbf93ef5ab8be073586c2a7",
".git/objects/8e/31768628c220a2c3d0d35323bacb836ae7a91b": "0e77f6ad6b4788a96db4169913f87271",
".git/objects/8e/f55face590067bc67e949b2363cb03a315c4aa": "2ff737c59de8810a825e559bde620e25",
".git/objects/25/8b3eee70f98b2ece403869d9fe41ff8d32b7e1": "05e38b9242f2ece7b4208c191bc7b258",
".git/objects/25/583c26d8d414336c78e109e79d5c24011fdabf": "59a59a8a324003c017038ac62075b0c2",
".git/HEAD": "dde969c6b0fc3624e3a4b179c6f05ec4",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "a7b5604fe1aed8dda05c3153ad3870a5",
".git/logs/refs/heads/web": "b53d25298e90c0be9e8987db65ed7c0b",
".git/logs/refs/heads/me": "79ca25e4a8e09d71a3435cc62a5d3ab9",
".git/logs/refs/remotes/web/web": "a377e82b2a6e143fa9cd009577f14e9a",
".git/logs/refs/remotes/web/master": "6e1a978379efa194d06c5dd0d7eae788",
".git/logs/refs/remotes/web/me": "70663598980c5411d724ac5cf4c21ac8",
".git/logs/refs/remotes/web/main": "3a753d3f9929230c446e76494530a2f5",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/web": "bc2e9a25d40bda73fcdaf27fad6c9f15",
".git/refs/heads/me": "3ef8e67dccc38efe32459bf6f5ce80eb",
".git/refs/remotes/web/web": "bc2e9a25d40bda73fcdaf27fad6c9f15",
".git/refs/remotes/web/master": "2d61622c271974435ab402d8d00735c1",
".git/refs/remotes/web/me": "3ef8e67dccc38efe32459bf6f5ce80eb",
".git/refs/remotes/web/main": "2fd55425f5e5dffdf113c301420e0114",
".git/index": "1df0a1fafc166533c3b8f7a89096e73d",
".git/COMMIT_EDITMSG": "5ee5dbf4089cc9ee061b0750e1966a3a",
".git/FETCH_HEAD": "9402b5ca608ddd3401dd742ff9bfde97",
"assets/AssetManifest.json": "c58bd2b16fcc167bb4f0eb0e5702c150",
"assets/NOTICES": "1dde3335baed8e6e5cd3e2bec4c53a31",
"assets/FontManifest.json": "d20e8ecfc272eec1e28beeb51ad035c6",
"assets/AssetManifest.bin.json": "79df2c5c3ea77844a94f78ea68a7e668",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "ac2b55c7522dc97871fbdd26a1b5111a",
"assets/fonts/MaterialIcons-Regular.otf": "96d7e61396605e3c873938b7844ba4e2",
"assets/assets/images/profile.png": "c55ef2f7748728a287c5644d9d21ebb5",
"assets/assets/fonts/noe.ttf": "30a71dcf9a1c39558ca4e97c92a4b2fa",
"assets/assets/fonts/Rubik.ttf": "6d3102fa33194bef395536d580f91b56",
"assets/assets/fonts/SourGummy.ttf": "c40d2e33ba299c6dc4a70d7655449c9d",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
