Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3361C211460
	for <linux-remoteproc@vger.kernel.org>; Mon,  7 Apr 2025 09:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017459; cv=none; b=YH+pKJe/nBvbPgFPPR2KiBl+uafiQvykWGSs8fp0yzf+pPZmthFTMA5trebkFcpSwQApEfxhgWOschRK8GLDVY6Hxawwh4vJLH+LPYBidW0grd0ZfvNL50VJGpK04OHLTL0EUzn+bKV0KSrJwBwdBe6R0hlaDS/ao5IlBbk3B4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017459; c=relaxed/simple;
	bh=QU9XKmlg3Q63oHMPSj27z50Nm0jwwOnBo8VBeuxoiy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PWHSZpWSpLUgEubS+hUAW5POEpFUFzGOUFHmHtNcpOC08copDTUh+AAzl+dRiQFaOSCBxge/dNje2/qrNfdY3Cr3E8dwpEF/Weoq1gktcgW8U2wfIGMkeKzFg0RdlT3vkcqc3TIBOBVkbu9KYW17dV6wYam0k9SlyVg6d73Iuns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gp/rUJDl; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gp/rUJDl"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744017444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/S879XubW4aeIBAXUFWkv+U4RmQfwb/eak1SUwWdbBY=;
	b=gp/rUJDliYigIAelHGM9/eZO4JmnohS8kGLqyorLndikcO7JK9Km4S/4qfTn0YBqp/V0a0
	hmTC9TWM0O1kYObQpB/XOiaLB8tp96kHPSj8sEUesTr9G9Kl5CSaOqJUCXSzeuI1RfcS9s
	MSEYYbOGdZMJPnuUroy1Y1IJhjNcHis=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rpmsg: Use strscpy() instead of strscpy_pad()
Date: Mon,  7 Apr 2025 11:17:14 +0200
Message-ID: <20250407091714.743681-1-thorsten.blum@linux.dev>
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

