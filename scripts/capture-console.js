const puppeteer = require('puppeteer');

(async () => {
  const url = process.argv[2] || 'https://home-made-recipe-c857f.web.app';
  const browser = await puppeteer.launch({ args: ['--no-sandbox','--disable-setuid-sandbox'] });
  const page = await browser.newPage();

  page.on('console', msg => {
    const type = msg.type();
    const text = msg.text();
    console.log(`[console:${type}] ${text}`);
  });

  page.on('pageerror', err => {
    console.log('[pageerror]', err.toString());
  });

  page.on('requestfailed', req => {
    console.log('[requestfailed]', req.url(), req.failure().errorText);
  });

  console.log('Navigating to', url);
  try {
    const resp = await page.goto(url, { waitUntil: 'networkidle2', timeout: 30000 });
    console.log('HTTP status:', resp.status());
  } catch (e) {
    console.error('Error loading page:', e.message);
  }

  // Wait a bit for any async errors
  await new Promise(r => setTimeout(r, 3000));
  // Touchfile: updated to trigger CI run at 2026-07-06
  // (no functional changes)
  await browser.close();
})();
