import { browser, defineBackground } from "#imports";

export default defineBackground(() => {
  browser.runtime.onMessage.addListener(() => {
    // eslint-disable-next-line unicorn/prefer-await
    sendNativeMessage().catch(console.error);
  });
});

async function sendNativeMessage() {
  const response = (await browser.runtime.sendNativeMessage(
    "vimium.ime.native",
    {},
  )) as { status: "completed" } | { status: "failed"; error: string };

  if (response.status === "failed") {
    console.error(response.error);
  }
}
