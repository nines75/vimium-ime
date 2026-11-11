import { browser, defineContentScript } from "#imports";

export default defineContentScript({
  matches: ["http://*/*", "https://*/*"],
  main() {
    const observer = new MutationObserver(onHtmlChange);
    observer.observe(document.documentElement, { childList: true });
  },
});

function onHtmlChange(records: MutationRecord[]) {
  for (const record of records) {
    for (const node of record.addedNodes) {
      if (!(node instanceof Element) || node.className !== "vimium-reset")
        continue;

      const vomnibar = node.shadowRoot?.querySelector("iframe.vomnibar-frame");
      if (vomnibar === null || vomnibar === undefined) continue;

      const observer = new MutationObserver(onVomnibarChange);
      observer.observe(vomnibar, {
        attributes: true,
        attributeFilter: ["class"],
        attributeOldValue: true,
      });
    }
  }
}

function onVomnibarChange(records: MutationRecord[]) {
  for (const record of records) {
    const vomnibar = record.target;
    if (
      !(vomnibar instanceof Element) ||
      !vomnibar.className.includes("vimium-ui-component-visible") ||
      record.oldValue?.includes("vimium-ui-component-hidden") !== true
    )
      continue;

    // eslint-disable-next-line unicorn/prefer-await
    browser.runtime.sendMessage({}).catch(console.error);
  }
}
