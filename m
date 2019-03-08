Return-Path: <fabien.dessenne@st.com>
From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH v2] hwspinlock: ignore disabled device
Date: Fri, 8 Mar 2019 17:53:46 +0100
Message-ID: <1552064026-11415-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Do not wait for hwspinlock device registration if it is not available
for use.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
V2: use 'goto out' instead of 'return'

 drivers/hwspinlock/hwspinlock_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 2bad40d..d806307 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -333,6 +333,11 @@ int of_hwspin_lock_get_id(struct device_node *np, int index)
 	if (ret)
 		return ret;
 
+	if (!of_device_is_available(args.np)) {
+		ret = -ENOENT;
+		goto out;
+	}
+
 	/* Find the hwspinlock device: we need its base_id */
 	ret = -EPROBE_DEFER;
 	rcu_read_lock();
-- 
2.7.4
