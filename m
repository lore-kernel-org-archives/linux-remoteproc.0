Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2193845B0
	for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2026 08:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575763; cv=none; b=c7uUthGYnnNbgkg5VH7jF9Ul8Z3x+iw4QFEafEg6++ZjT/FF9ZXW+m7gacAUoYfTnrAbfjD3CqGav5g2iXajxw09BnJWNSgi3O45YjGesEhXEmVApmj/IDpZk32ZGwykjtC8Lkm1WQL2KtLUpYHbO30ItV3HMDeFwablsH79wNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575763; c=relaxed/simple;
	bh=/VsQN4XVPGeArCNXsSMOUGuMEsA3np4OZ+t7QDMzjXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r2KM4+cfwfSflNVySK/+ziIxe9YHEN8bcAPFyk9cROVrt2IBLEuAExsVw7ZPu0GCwsQnIHduxFebV9cP+0Id1TmiuHZTpHbmPqurq2nTx5thl57zHhX6v/dskg3uvwwEKWOM2OijguTmrHtkb8iAD1bO2XqfNt7uIcd8BD9dIp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lhnMUiLw; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lhnMUiLw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=gZFWGCc+QN5NQ5
	spvS6bX+zjGm1rbhV4VCgMWO+xCXo=; b=lhnMUiLwVC5CISeFyseppRdX2iJrrd
	3wozMPqq6smTutCY5J/OBM77fn56qEA8oNlhYxaOH/3ynxtVdted2Bfnygdzcl8g
	5XaDehI8qTrd8i4zAqKawLS0hvjGr4K+aVE5Mjj9GCjAgacHRL7L6IqK7BkBm61E
	VWxTSuhBvux/Q+5Se2s6JSxHmVhZgZX7Lpqf0pinfvg9Bb8N/GYXKX2qMqSl166y
	qFhEj9MgdizRQxKjhJnrxu+yhSVIsFPg80Yhb0lqYY/IIh7yzItb1cSXF8MxHNKz
	ax5XdFaBMrmvsO2SQ8Fqqe9Q/BKwz9oNREwFSLtyehZt51dfkfOEtZ+w==
Received: (qmail 2912974 invoked from network); 12 May 2026 10:49:05 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 May 2026 10:49:05 +0200
X-UD-Smtp-Session: l3s3148p1@M0F675pRjoEujns3
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH] hwspinlock: propagate errno when registering single lock
Date: Tue, 12 May 2026 10:48:23 +0200
Message-ID: <20260512084856.30497-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hwspin_lock_register_single() always returns 0 despite checking the
result from radix_tree_insert(). Propagate the errno to make sanity
checks in callers of this function actually meaningful.

Fixes: 300bab9770e2 ("hwspinlock/core: register a bank of hwspinlocks in a single API call")
Link: https://sashiko.dev/#/patchset/20260319105947.6237-1-wsa%2Brenesas%40sang-engineering.com # review of patch 14
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index cc8e952a6772..a509b73da190 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -472,7 +472,7 @@ static int hwspin_lock_register_single(struct hwspinlock *hwlock, int id)
 
 out:
 	mutex_unlock(&hwspinlock_tree_lock);
-	return 0;
+	return ret;
 }
 
 static struct hwspinlock *hwspin_lock_unregister_single(unsigned int id)
-- 
2.47.3

