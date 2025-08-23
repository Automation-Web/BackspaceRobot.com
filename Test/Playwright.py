# from playwright.sync_api import sync_playwright
# import time
#
#
#
#
# def run_playwright_script():
#     with sync_playwright() as p:
#         # Step 1: Launch browser (NOT headless so we see it)
#         browser = p.chromium.launch(headless=False, args=["--start-maximized"])
#
#         # Step 2: Create new context for video recording
#         context = browser.new_context(
#             no_viewport=True,
#             record_video_dir="videos/"
#         )
#
#         # Step 3: Open a new page and go to the website
#         page = context.new_page()
#         page.goto("https://practice.expandtesting.com/upload")
#
#         # Step 4: Wait so we can visually see the browser
#         time.sleep(10)  # Wait 10 seconds manually
#
#
#
#
# run_playwright_script()