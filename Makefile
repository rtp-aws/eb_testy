public/js/bundle.js: public/js/script.js
	browserify public/js/script.js -o public/js/bundle.js

runlocal:
	npm run devStart

deploy: public/js/bundle.js
	eb deploy


