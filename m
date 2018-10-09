Return-Path: <briannorris@chromium.org>
Return-Path: <briannorris@chromium.org>
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH] remoteproc: qcom: q6v5-pil: add SCM probe dependency
Date: Mon,  8 Oct 2018 19:08:05 -0700
Message-Id: <20181009020805.143982-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Brian Norris <briannorris@chromium.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Similar to qcom_q6v5_pas and qcom_wcnss drivers, probe will fail if SCM
is not up.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index a839b07a58b1..8836ca1bc0c1 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1151,6 +1151,9 @@ static int q6v5_probe(struct platform_device *pdev)
 	if (!desc)
 		return -EINVAL;
 
+	if (!qcom_scm_is_available())
+		return -EPROBE_DEFER;
+
 	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_ops,
 			    desc->hexagon_mba_image, sizeof(*qproc));
 	if (!rproc) {
-- 
2.19.0.605.g01d371f741-goog
