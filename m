Return-Path: <fabien.dessenne@st.com>
From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH] hwspinlock: ignore disabled device
Date: Thu, 7 Mar 2019 16:53:00 +0100
Message-ID: <1551973980-23547-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Do not wait for hwspinlock device registration if it is not available
for use.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 drivers/hwspinlock/hwspinlock_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 2bad40d..8d63bdc 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -333,6 +333,9 @@ int of_hwspin_lock_get_id(struct device_node *np, int index)
 	if (ret)
 		return ret;
 
+	if (!of_device_is_available(args.np))
+		return -ENOENT;
+
 	/* Find the hwspinlock device: we need its base_id */
 	ret = -EPROBE_DEFER;
 	rcu_read_lock();
-- 
2.7.4
