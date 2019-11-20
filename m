Return-Path: <krzk@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] rpmsg: Fix Kconfig indentation
Date: Wed, 20 Nov 2019 21:39:44 +0800
Message-Id: <20191120133945.13938-1-krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/rpmsg/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index d0322b41eca5..709276540ef1 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -21,7 +21,7 @@ config RPMSG_QCOM_GLINK_NATIVE
 
 config RPMSG_QCOM_GLINK_RPM
 	tristate "Qualcomm RPM Glink driver"
-        select RPMSG_QCOM_GLINK_NATIVE
+	select RPMSG_QCOM_GLINK_NATIVE
 	depends on HAS_IOMEM
 	depends on MAILBOX
 	help
-- 
2.17.1
