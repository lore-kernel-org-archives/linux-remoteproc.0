Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 1/4] remoteproc: st: correct probe error management
Date: Tue, 31 Jan 2017 13:35:53 +0100
Message-ID: <1485866156-6364-2-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1485866156-6364-1-git-send-email-loic.pallardy@st.com>
References: <1485866156-6364-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, hugues.fruchet@st.com, peter.griffin@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

Associated clock is prepared in st_rproc_parse_dt function.
it should be unprepared in case of error during probing.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
Changes from V2:
New patch fixing st_rproc_probe error management

 drivers/remoteproc/st_remoteproc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index da4e152..bdfab49 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -247,7 +247,7 @@ static int st_rproc_probe(struct platform_device *pdev)
 	enabled = st_rproc_state(pdev);
 	if (enabled < 0) {
 		ret = enabled;
-		goto free_rproc;
+		goto free_clk;
 	}
 
 	if (enabled) {
@@ -259,10 +259,12 @@ static int st_rproc_probe(struct platform_device *pdev)
 
 	ret = rproc_add(rproc);
 	if (ret)
-		goto free_rproc;
+		goto free_clk;
 
 	return 0;
 
+free_clk:
+	clk_unprepare(ddata->clk);
 free_rproc:
 	rproc_free(rproc);
 	return ret;
-- 
1.9.1
