Return-Path: <colin.king@canonical.com>
From: Colin King <colin.king@canonical.com>
Subject: [PATCH] remoteproc: qcom: fix spelling mistake "Peripherial" -> "Peripheral"
Date: Mon, 26 Nov 2018 14:27:35 +0000
Message-Id: <20181126142735.29294-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the module description text, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/remoteproc/qcom_wcnss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index b0e07e9f42d5..1152da49a18a 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -622,5 +622,5 @@ static void __exit wcnss_exit(void)
 }
 module_exit(wcnss_exit);
 
-MODULE_DESCRIPTION("Qualcomm Peripherial Image Loader for Wireless Subsystem");
+MODULE_DESCRIPTION("Qualcomm Peripheral Image Loader for Wireless Subsystem");
 MODULE_LICENSE("GPL v2");
-- 
2.19.1
