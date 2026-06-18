Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D3030C343
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2026 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781800476; cv=none; b=JL0l8ERSNi7vOyDQBCPRx1gOv1K4kx+lc5dXyjjGwIP/PYQMswRN4jYbeM15qW4MvxW0JFy/wfbj3nnKSP9oDT8WcawPW0XJlCPgcSehLsyP8oC0057ArxSF/i57cQ91JpdAJJik6GmQmTIGkrGDqA4IgzlbI2cAQWY/QTe80uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781800476; c=relaxed/simple;
	bh=2HO0junAiv6XmTaC7/V8bG7OIvjE6Iv9baZKpaKuoBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qHb1oKVHS0v4UA1XF9coKnb15ItKu0+0zs3PJ+MUh7Dsy2DCHRQ+HQWAcU9TeEpjM5IMCdhV1cG6+dTzOe1veJx6csDKhoa3LbNksXJ/7nozqxVbsemplf2Vf12osEHoIwK2Qjpukxa33KiV4EOvCRgrRIRMroQqh1jl4UtOkFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KTs5poz+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KTs5poz+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=4IvXbk1TmGEG8jVjL8ps0UHNzJ/+AxoVlEdp0ifPZyc=; b=KTs5po
	z+zfNkXg8xnbYOK4CxbwWy9sYAqSHJ97IHdpUOpQi+rul0L1Sqte0XOp/z3rdvd4
	JKP6Zsm7JdsT+GJXK0wKlaeSTORqxNU3VXPliWJs7EL7udSEwsH0+yPY9oK5Zv39
	3W4PCJmvILOTOplzdfD2rUVaHhz2DBOe7GSyMuSy33vGiESyz9CPitBgVRvkOZKH
	pIDvYcD++pjXIuyfMUDXnMngmcs+tjkGL7BS4OUhOXCYaEEKhUM1nAJFi6PcgCii
	918LKENmfO7BeizYMWfI19ZaHZjLX/McgSCCCtvvImALJVsvnEr6vWyQSvi7BNn1
	tdprpbIqD3L1nfbg==
Received: (qmail 638240 invoked from network); 18 Jun 2026 18:34:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jun 2026 18:34:27 +0200
X-UD-Smtp-Session: l3s3148p1@VNPmv4lUPr8ujnsq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH 1/2] hwspinlock: reverse logic for used channels
Date: Thu, 18 Jun 2026 18:34:21 +0200
Message-ID: <20260618163422.17604-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260618163422.17604-1-wsa+renesas@sang-engineering.com>
References: <20260618163422.17604-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Having a flag set for an unused channel is irritating. It became
especially confusing while developing debugfs support for this
subsystem. Inverse the logic which makes the current and the future code
easier to follow.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c | 30 ++++++++++++++--------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index cc8e952a6772..7aa597a28eec 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -28,7 +28,7 @@
 #define HWSPINLOCK_RETRY_DELAY_US	100
 
 /* radix tree tags */
-#define HWSPINLOCK_UNUSED	(0) /* tags an hwspinlock as unused */
+#define HWSPINLOCK_USED	(0)
 
 /*
  * A radix tree is used to maintain the available hwspinlock instances.
@@ -42,8 +42,8 @@
  * used as the ID's of the hwspinlock instances).
  *
  * The radix tree API supports tagging items in the tree, which this
- * framework uses to mark unused hwspinlock instances (see the
- * HWSPINLOCK_UNUSED tag above). As a result, the process of querying the
+ * framework uses to mark used hwspinlock instances (see the
+ * HWSPINLOCK_USED tag above). As a result, the process of querying the
  * tree, looking for an unused hwspinlock instance, is now reduced to a
  * single radix tree API call.
  */
@@ -465,7 +465,7 @@ static int hwspin_lock_register_single(struct hwspinlock *hwlock, int id)
 	}
 
 	/* mark this hwspinlock as available */
-	tmp = radix_tree_tag_set(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
+	tmp = radix_tree_tag_clear(&hwspinlock_tree, id, HWSPINLOCK_USED);
 
 	/* self-sanity check which should never fail */
 	WARN_ON(tmp != hwlock);
@@ -482,9 +482,9 @@ static struct hwspinlock *hwspin_lock_unregister_single(unsigned int id)
 
 	mutex_lock(&hwspinlock_tree_lock);
 
-	/* make sure the hwspinlock is not in use (tag is set) */
-	ret = radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
-	if (ret == 0) {
+	/* make sure the hwspinlock is not in use */
+	ret = radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_USED);
+	if (ret) {
 		pr_err("hwspinlock %d still in use (or not present)\n", id);
 		goto out;
 	}
@@ -700,8 +700,8 @@ static int __hwspin_lock_request(struct hwspinlock *hwlock)
 	ret = 0;
 
 	/* mark hwspinlock as used, should not fail */
-	tmp = radix_tree_tag_clear(&hwspinlock_tree, hwlock_to_id(hwlock),
-							HWSPINLOCK_UNUSED);
+	tmp = radix_tree_tag_set(&hwspinlock_tree, hwlock_to_id(hwlock),
+				 HWSPINLOCK_USED);
 
 	/* self-sanity check that should never fail */
 	WARN_ON(tmp != hwlock);
@@ -740,8 +740,8 @@ struct hwspinlock *hwspin_lock_request_specific(unsigned int id)
 	WARN_ON(hwlock_to_id(hwlock) != id);
 
 	/* make sure this hwspinlock is unused */
-	ret = radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
-	if (ret == 0) {
+	ret = radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_USED);
+	if (ret) {
 		pr_warn("hwspinlock %u is already in use\n", id);
 		hwlock = NULL;
 		goto out;
@@ -786,8 +786,8 @@ int hwspin_lock_free(struct hwspinlock *hwlock)
 
 	/* make sure the hwspinlock is used */
 	ret = radix_tree_tag_get(&hwspinlock_tree, hwlock_to_id(hwlock),
-							HWSPINLOCK_UNUSED);
-	if (ret == 1) {
+				 HWSPINLOCK_USED);
+	if (!ret) {
 		dev_err(dev, "%s: hwlock is already free\n", __func__);
 		dump_stack();
 		ret = -EINVAL;
@@ -798,8 +798,8 @@ int hwspin_lock_free(struct hwspinlock *hwlock)
 	pm_runtime_put(dev);
 
 	/* mark this hwspinlock as available */
-	tmp = radix_tree_tag_set(&hwspinlock_tree, hwlock_to_id(hwlock),
-							HWSPINLOCK_UNUSED);
+	tmp = radix_tree_tag_clear(&hwspinlock_tree, hwlock_to_id(hwlock),
+				   HWSPINLOCK_USED);
 
 	/* sanity check (this shouldn't happen) */
 	WARN_ON(tmp != hwlock);
-- 
2.51.0

