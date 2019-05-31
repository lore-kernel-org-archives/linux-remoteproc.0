Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 3/3] hwspinlock/omap: Add a trace during probe
Date: Thu, 30 May 2019 21:13:21 -0500
Message-ID: <20190531021321.14025-4-s-anna@ti.com>
In-Reply-To: <20190531021321.14025-1-s-anna@ti.com>
References: <20190531021321.14025-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Add a debug level trace statement in the OMAP HwSpinlock driver
probe function to print the number of hwlocks on a successful
registration.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/hwspinlock/omap_hwspinlock.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index a4d7a7bc863a..14e1a532ebb5 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -140,6 +140,9 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 	if (ret)
 		goto reg_fail;
 
+	dev_dbg(&pdev->dev, "Registered %d locks with HwSpinlock core\n",
+		num_locks);
+
 	return 0;
 
 reg_fail:
-- 
2.21.0
