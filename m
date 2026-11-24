Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535128;
	b=orgXsGRdxAnLmnl/t9uz3TEBHPnyNV9yPc1dZJqjYn8OgZBh47Ru7KFibQgSkyaBkPZc
	 2PybV3QVNm21U77DLFnVgKlSo2pOXKlC3kybn739zJ1+Sq/QdiEkS4tG9vRHW/0JmyW0g
	 Os/uIf14FeUeovcjJcSo1jFXGV3qhyA7lJRms3tLsS+V49AEUDEQ6v3A2OSv5ErRzBZ4m
	 /wiErMTEKVmNZ9WwYSZo64qUMaWF5eCoQa4uOyEjfKxO60mrGaiM4NHWFjw0OtU/+KIIo
	 Vgjn/yaTGjF5UjoSXLFDyKMFcshMRuQ62awp/MgXSV/CAx2NZyR9IF/+hmku/eh3hpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3hkJat/Gg3boX44Q1mafJG1F0JYnnq/y7sAswGXXbDI=;
	b=5P5qdrOca3LgoXm/kZ3/hpBM+6M1nlRPSCFW3XuEKDf+nBxnly0fOTxzyeinzbRxVNe9
	 GUDBIpGGthWdkKnJ1xm4JkzeBsf4SrKps3BcF2wLNK5/Y+TL/bDIrw3B71uGB4HHSI3oI
	 pg+Q+eijhox3gxizhQQh3gBcx1syYvNfz+0PVnFLcNgs4nHMYFCCOSZqZ40VPCi/SLi4t
	 R7Vddga7KBJmw0FGVy6RM5lthD6W5xIXeWvLRFDjaWmIrFHpavUpa3jcxI4X5TNWgw4Fv
	 E1IpBjKnOLvUBNxqvGddFxRqy3AGv+RG/xMUhtaR4rcn0xWI3cvePf5Vv6IHxWlozRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T08HQVU+;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8FC606A323
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 15:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F8FC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T08HQVU+
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so2432561b3a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 07:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535128; x=1796139928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3hkJat/Gg3boX44Q1mafJG1F0JYnnq/y7sAswGXXbDI=;
        b=T08HQVU+RG0vW7CTZSiFCGrFWeD1QNQWCYFAfRXlUt8EbYsylC69ARNtHNoxccWMgD
         0XjlKPgKy6YFYTO2xeVhl23Czdkzs2g5Gs4osvH3SV5fLBB1heBG7EhNQZ0cFx7h8Bq1
         XgqV7tZGT1QDqN0WU4wXZEUjXOrJBiiaL9EyKV7FvrSHQrIcFNGVHOsMGDrh6Yg5EY1U
         ltbUUwQDEFYLjWxPd3dR8NUujAmPorV+/4c4O806ocsqOL/CUw6EoS1YP9j+wYiTPy1o
         kJLTi7Q/TzRRISTM2ICkPs77NSR1cQjIjGCAYd+YPEv4LbtnYhznhnBmlvXUbn6MZ81q
         GYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535128; x=1796139928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hkJat/Gg3boX44Q1mafJG1F0JYnnq/y7sAswGXXbDI=;
        b=kvakmnB9Z25gESr8eMxqPn5mdBB2xzeO/rG6zqUOBpjCi9t7mF04uZaIkIh1boZM5N
         OWvJFpFefRs1jQxCJacONxnV9suTG0G67GLwk2CIvOnxh/gL7blBOnSJKF0cZQqfIn9j
         LuSDPE+t29TfO+Opijw5ex0D6demDwOZY/ciMKSOEZVuRy25vvxMEDt22oevyXehlNg7
         w4c1szH0oRd9sba0SY+PF281uWRf822B4yebR3Qwp05dc3veypotanfgeXRzElcKDL1a
         KbLbSoKOXmGL5MBVlG7/vmvXY7vXohjzgL4eERUVk/s6MR7WGM/26QmZI0/uKxyEZlQK
         3b5w==
X-Forwarded-Encrypted: i=1; AL+hErEtghTZFJscrJCTYwS5Aw3NLor8Z7YWywzfeP4C46ZXu6gXYG30bxRjCRbTgyT3yE2atqnLyroh/NWirFKA+TDQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8SSKA1pXump04Oh1KSomwu68yoNsCVOWVWS3TnetS4iLHtF4VT
	gYJSfgK8OkbyuVm7LcSbrI87b5Wde822dHgOC94nwfdQJpvYNFwSjsk=
X-Gm-Gg: AZFdTZd/SJLieZT14tatlyrS5FTAZ5r8Ax9Ls6kfLDievWf1AUbpLzpCmzv4+RtemKW
	gKPpg94rlgZt6rftneY9dEtg/3I7TIZcxuo/eL8RjEUgUp5yI0/93/znOb3xHEQVWaFdCtZwft2
	XuHEMog6+gBjRR1VMgOPVU4e3rwdWxX5s89DjbcaX8QGiUKur6OtiNd6mIUoA/9u3dFGOAmZPtz
	9CDbcOMnX+l81XOuOncANEFK5lU0XkEUyV9qj1VvVckT96NpPwiV7szwVy1AvS/LOdyhJRcc5tW
	fmrnWQU/n4sVXBVW9Rs2it0jgdXMtzQebM+/YmLJm/h4aPkP5CQFx7GeX5Us0mzH8ygyRhJ3KAW
	+7uucSG9msKjjN5lIRnf/z6nVeVKEx4iGjYZEYRdrWHTiIFWBfBp73qVDgtratxy7ecIcBK0pVf
	PmFrUwJUqKx1ChPIkmtfs09D/luLNveG1q1aMCrYy1mFSm7goPHCszCR1V2c32nRRWJHtxMGGY9
	P9AcWHy9N1wIWce5hngPN5JVBKqkS+TongQ10wzUnSf6I67nGnyXBPF1NExmszOA6mpOH21DuHN
	FtM0md9P6hbKTFKCsLjHpLawzko6Amd+LLfU5LvalwVXuK4Iji4H+GrA3zrDqSRvitTq
X-Received: by 2002:a05:6a00:1f17:b0:8a0:f375:d1c0 with SMTP id d2e1a72fcca58-8c87c57b5fcmr12396223b3a.33.1795535127699;
        Tue, 24 Nov 2026 07:45:27 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:5da8:85f0:b5f6:2eae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873f11da2sm7136132b3a.55.2026.11.24.07.45.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 07:45:27 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] remoteproc: qcom: Clear the GLINK node after name allocation failure
Date: Tue, 24 Nov 2026 23:45:21 +0800
Message-ID: <confirmed-20261105-37-9a8d5cd59eb0@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If kstrdup_const() fails, qcom_add_glink_subdev() puts the acquired node
reference and returns without adding the subdevice. However, glink->node
remains set, so qcom_remove_glink_subdev() later treats the subdevice as
registered. It attempts to remove an uninitialized list entry and can
also drop the node reference a second time.

Clear glink->node after the error-path put so that the existing guard in
qcom_remove_glink_subdev() skips a subdevice that was never added.

Fixes: 44f4911ab8e6 ("remoteproc: qcom: Fix glink->node reference leak in qcom_add_glink_subdev")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
AI assistance was used for analysis and patch preparation.

Based on next-20261104 (8b7179210b22).
Compile-tested: arm64, GCC 14.2.0, W=1, drivers/remoteproc/qcom_common.o;
baseline and patched objects built with no warnings.
Static source review; no hardware, boot, or KASAN test was performed.

 drivers/remoteproc/qcom_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 5294e327f1587efc917eb01dde59bd1e723c225e..cb3f6f93c6da85010f89244a6991f4d74ae57dc1 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -255,6 +255,7 @@ void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink,
 	glink->ssr_name = kstrdup_const(ssr_name, GFP_KERNEL);
 	if (!glink->ssr_name) {
 		of_node_put(glink->node);
+		glink->node = NULL;
 		return;
 	}

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
