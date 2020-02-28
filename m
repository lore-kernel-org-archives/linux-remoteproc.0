Return-Path: <elder@linaro.org>
Return-Path: <elder@linaro.org>
From: Alex Elder <elder@linaro.org>
Subject: [PATCH 4/4] remoteproc: return error for bad "recovery" debugfs input
Date: Fri, 28 Feb 2020 12:33:59 -0600
Message-Id: <20200228183359.16229-5-elder@linaro.org>
In-Reply-To: <20200228183359.16229-1-elder@linaro.org>
References: <20200228183359.16229-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

If the value written to the "recovery" debugfs file is not one of
the recognized commands return an error to indicate it's invalid.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/remoteproc/remoteproc_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index e995dc49c231..0d478bfefd9c 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -146,6 +146,8 @@ rproc_recovery_write(struct file *filp, const char __user *user_buf,
 	} else if (!strncmp(buf, "recover", count)) {
 		/* begin the recovery process without changing the flag */
 		rproc_trigger_recovery(rproc);
+	} else {
+		return -EINVAL;
 	}
 
 	return count;
-- 
2.20.1
