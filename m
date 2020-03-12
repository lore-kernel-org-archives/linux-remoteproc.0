Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH 08/18] remoteproc: Allocate synchronisation state machine
Date: Thu, 12 Mar 2020 16:11:48 -0600
Message-Id: <20200312221158.3613-9-mathieu.poirier@linaro.org>
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

This patch allocates a synchronisation state machine, either provided or
not by users, in order to enact the proper behavior requested by the
platform or specific scenarios.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 59 +++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 02dbb826aa29..1578a9c70422 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1955,6 +1955,7 @@ static void rproc_type_release(struct device *dev)
 	kfree(rproc->firmware);
 	kfree(rproc->ops);
 	kfree(rproc->sync_ops);
+	kfree(rproc->sync_states);
 	kfree(rproc);
 }
 
@@ -2035,6 +2036,59 @@ static int rproc_alloc_sync_ops(struct rproc *rproc,
 	return 0;
 }
 
+static int rproc_alloc_sync_states(struct rproc *rproc,
+				   const struct rproc_ops *boot_ops,
+				   const struct rproc_ops *sync_ops,
+				   struct rproc_sync_states *sync_states)
+{
+	struct rproc_sync_states *st;
+
+	/* At least one set of operation is needed */
+	if (!boot_ops && !sync_ops)
+		return -EINVAL;
+
+	/* We have a synchronisation state machine, no need to build one */
+	if (sync_states) {
+		st = kmemdup(sync_states, sizeof(*st), GFP_KERNEL);
+		if (!st)
+			return -ENOMEM;
+
+		/* Nothing else to do */
+		goto out;
+	}
+
+	/* Allocate synchronisation state machine */
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return -ENOMEM;
+
+	/*
+	 * We have a boot_ops and no sync_ops - build a state machine that
+	 * does _not_ synchronise with an MCU.
+	 */
+	if (boot_ops && !sync_ops) {
+		st->on_init = st->after_stop = st->after_crash = false;
+		goto out;
+	}
+
+	/*
+	 * We have a sync_ops and an no boot_ops - build a state machine that
+	 * _only_ synchronises with an MCU.
+	 */
+	if (sync_ops && !boot_ops) {
+		st->on_init = st->after_stop = st->after_crash = true;
+		goto out;
+	}
+
+out:
+	rproc->sync_with_mcu = st->on_init;
+	/* And the synchronisation state machine to use */
+	rproc->sync_states = st;
+	/* Tell the core what to do when initialising */
+	rproc_set_mcu_sync_state(rproc, RPROC_SYNC_STATE_INIT);
+	return 0;
+}
+
 static int rproc_alloc_internals(struct rproc *rproc, const char *name,
 				 const struct rproc_ops *boot_ops,
 				 const struct rproc_ops *sync_ops,
@@ -2065,7 +2119,10 @@ static int rproc_alloc_internals(struct rproc *rproc, const char *name,
 			return ret;
 	}
 
-	return 0;
+	/* Finally allocate the synchronisation state machine */
+	ret = rproc_alloc_sync_states(rproc, boot_ops, sync_ops, sync_states);
+
+	return ret;
 }
 
 /**
-- 
2.20.1
