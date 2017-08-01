Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 1/4] remoteproc/davinci: Switch to platform_get_resource_byname()
Date: Tue, 1 Aug 2017 10:48:41 -0500
Message-ID: <20170801154844.24662-2-s-anna@ti.com>
In-Reply-To: <20170801154844.24662-1-s-anna@ti.com>
References: <20170801154844.24662-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, Robert Tivy <rtivy@ti.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The davinci remoteproc driver currently uses the platform_get_resource()
API for retrieving the IOMEM resources. Switch this function to use the
platform_get_resource_byname() API instead in preparation for adding the
DT support so that the binding can be agnostic of the IOMEM resource
order.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: No changes

 drivers/remoteproc/da8xx_remoteproc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 99539cec1329..280b66d4f622 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -184,12 +184,14 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	bootreg_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	bootreg_res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+						   "host1cfg");
 	bootreg = devm_ioremap_resource(dev, bootreg_res);
 	if (IS_ERR(bootreg))
 		return PTR_ERR(bootreg);
 
-	chipsig_res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	chipsig_res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+						   "chipsig");
 	chipsig = devm_ioremap_resource(dev, chipsig_res);
 	if (IS_ERR(chipsig))
 		return PTR_ERR(chipsig);
-- 
2.13.1
