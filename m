Return-Path: <p.zabel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 071/102] remoteproc/keystone: explicitly request exclusive reset control
Date: Wed, 19 Jul 2017 17:26:15 +0200
Message-Id: <20170719152646.25903-72-p.zabel@pengutronix.de>
In-Reply-To: <20170719152646.25903-1-p.zabel@pengutronix.de>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
To: linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
reset lines") started to transition the reset control request API calls
to explicitly state whether the driver needs exclusive or shared reset
control behavior. Convert all drivers requesting exclusive resets to the
explicit API call so the temporary transition helpers can be removed.

No functional changes.

Cc: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/remoteproc/keystone_remoteproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 5f776bfd674a0..920fef072b364 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -410,7 +410,7 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	ksproc->reset = devm_reset_control_get(dev, NULL);
+	ksproc->reset = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(ksproc->reset)) {
 		ret = PTR_ERR(ksproc->reset);
 		goto free_rproc;
-- 
2.11.0
