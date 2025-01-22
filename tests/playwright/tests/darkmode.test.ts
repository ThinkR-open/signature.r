import { test, expect } from '@playwright/test';

test('Dark mode is working', async ({ page }) => {
  await page.goto('http://localhost:3000/');
  await expect(page.getByLabel('Switch from light to dark mode')).toBeVisible();
  
  await page.getByLabel('Switch from light to dark mode').click();

  await expect(page.getByLabel('Switch from dark to light mode')).toBeVisible();
});