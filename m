Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 03/19] remoteproc: Add a running independent state
Date: Fri, 24 Mar 2017 12:22:19 -0700
Message-ID: <1490383355-23176-4-git-send-email-jliang@xilinx.com>
In-Reply-To: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
References: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Wendy Liang  <wendy.liang@xilinx.com>, Wendy Liang <jliang@xilinx.com>, Michal Simek" <michal.simek@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wendy Liang <wendy.liang@xilinx.com>

Add a new RPROC_RUNNING_INDEPENDENT state to indicate
the remote already runs and it is started by the remoteproc
driver.

Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 include/linux/remoteproc.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 5eec892..b740b93 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -384,7 +384,8 @@ enum rproc_state {
 	RPROC_RUNNING	= 2,
 	RPROC_CRASHED	= 3,
 	RPROC_DELETED	= 4,
-	RPROC_LAST	= 5,
+	RPROC_RUNNING_INDEPENDENT = 5,
+	RPROC_LAST	= 6,
 };
 
 /**
-- 
1.9.1
