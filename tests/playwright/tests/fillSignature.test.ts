import { test, expect } from '@playwright/test';

test('Fill signature is working', async ({ page }) => {
  await page.goto('http://localhost:3000/');
  await expect(page.getByTestId("appName")).toBeVisible();

  await expect(page.getByTestId('firstname')).toBeVisible();
  await expect(page.getByPlaceholder('John')).toBeEmpty();
  await page.getByPlaceholder('John').click();
  await page.getByPlaceholder('John').fill('Arthur');
  await expect(page.getByTestId('signature-names')).toMatchAriaSnapshot(`- 'cell "Arthur {{lastname}}"'`);

  await page.getByPlaceholder('Doe').fill('Bréant');
  await expect(page.getByTestId('signature-names')).toMatchAriaSnapshot(`- 'cell "Arthur Bréant"'`);

  await page.getByRole('button', { name: 'copy fa-solid icon Copy to' }).click();
  await expect(page.getByText('×Paste the signature in your')).toBeVisible();
});