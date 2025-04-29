Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A501E231E
	for <linux-remoteproc@vger.kernel.org>; Tue, 29 Apr 2025 10:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745923584; cv=none; b=eH8PNzTMIkyg9qhOcCnB2Yj8tpCZMrhQARg9QbXhNN+aSuGpc0RmhAz72IJHJDV+wFRCEtZwizcfXrFwrBP9MuouH0/oKLKMacqe5F99fqrjkQqMjKQGRaiajcGd4I7ooxttMqh3ZN9Y4LGoLXnHuKuurHoGhp8rgQV+iSxHtP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745923584; c=relaxed/simple;
	bh=QU9XKmlg3Q63oHMPSj27z50Nm0jwwOnBo8VBeuxoiy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dT+YTeriVYlBn5uFwH3XeZdE96vSj2WG52teGBCU3YWQ1wMNJiMnsSXOZIO1q/51y9VP5b0TLj3QT7OgA3bsu17XlT/eZvrej2jILA7B3uwNXIRgTRBL4EGwgO3QcnraF4WweV+yc/YlrwO0EbZI+kPFhoATrqMq3c4jMoPeouo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dmHTViOz; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dmHTViOz"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745923580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/S879XubW4aeIBAXUFWkv+U4RmQfwb/eak1SUwWdbBY=;
	b=dmHTViOzDPlwIs/IR1E8Fwbrssuz8rG4WUbdqQHaGbISLRFdtBfFtj0q3yR5PzPZFzro+M
	ptL6ldgPJciLyu6pWnaaSYTjiH5NuxHFjQW+2LODgOAc6HP428xdUZdz3XcItKus887m3k
	WKdGMlECFXxbNyevSTannaBW6RFSRXQ=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] rpmsg: Use strscpy() instead of strscpy_pad()
Date: Tue, 29 Apr 2025 12:45:43 +0200
Message-ID: <20250429104543.66927-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

kzalloc() already zero-initializes the destination buffer, making
strscpy() sufficient for safely copying the name. The additional NUL-
padding performed by strscpy_pad() is unnecessary.

The size parameter is optional, and strscpy() automatically determines
the size of the destination buffer using sizeof() when the argument is
omitted. RPMSG_NAME_SIZE is equal to sizeof(rpdev->id.name) and can be
removed - remove it.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/rpmsg/qcom_glink_native.c | 2 +-
 drivers/rpmsg/qcom_smd.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index a2f9d85c7156..820a6ca5b1d7 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1663,7 +1663,7 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
 		}
 
 		rpdev->ept = &channel->ept;
-		strscpy_pad(rpdev->id.name, name, RPMSG_NAME_SIZE);
+		strscpy(rpdev->id.name, name);
 		rpdev->src = RPMSG_ADDR_ANY;
 		rpdev->dst = RPMSG_ADDR_ANY;
 		rpdev->ops = &glink_device_ops;
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 40d386809d6b..3c86c5553de6 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1089,7 +1089,7 @@ static int qcom_smd_create_device(struct qcom_smd_channel *channel)
 
 	/* Assign public information to the rpmsg_device */
 	rpdev = &qsdev->rpdev;
-	strscpy_pad(rpdev->id.name, channel->name, RPMSG_NAME_SIZE);
+	strscpy(rpdev->id.name, channel->name);
 	rpdev->src = RPMSG_ADDR_ANY;
 	rpdev->dst = RPMSG_ADDR_ANY;
 
-- 
2.49.0

