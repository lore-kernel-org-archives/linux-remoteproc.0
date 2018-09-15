Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 5/5] remoteproc/wkup_m3: Set deny_sysfs_ops flag
Date: Fri, 14 Sep 2018 19:37:25 -0500
Message-ID: <20180915003725.17549-6-s-anna@ti.com>
In-Reply-To: <20180915003725.17549-1-s-anna@ti.com>
References: <20180915003725.17549-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The Wakeup M3 remote processor is controlled by the wkup_m3_ipc
client driver, so set the newly introduced 'deny_sysfs_ops' flag
to not allow any overriding of the remoteproc firmware or state
from userspace.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/wkup_m3_rproc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
index 1ada0e51fef6..327757fd4d8f 100644
--- a/drivers/remoteproc/wkup_m3_rproc.c
+++ b/drivers/remoteproc/wkup_m3_rproc.c
@@ -168,6 +168,7 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 	}
 
 	rproc->auto_boot = false;
+	rproc->deny_sysfs_ops = true;
 
 	wkupm3 = rproc->priv;
 	wkupm3->rproc = rproc;
-- 
2.18.0
