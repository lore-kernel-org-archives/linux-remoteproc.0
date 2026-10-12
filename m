Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90240359A6C
	for <linux-remoteproc@vger.kernel.org>; Mon, 12 Oct 2026 07:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791433; cv=none; b=ryOL91p761LGHlh6AdlKemlB6Xf4jvYpaQXoJ9QINNfdOXUxmrw/DrA0Vo/j5FsIP1x8p1KHnD5hbkMPXa/Q/PYzXGmDs44zH8CthqMiUatKMQZDdUL78zJU56TCumqlRVq5JaEHfpyUdmkMSE7SXsn6FLZFpMu4jwzIgYqnE0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791433; c=relaxed/simple;
	bh=PxY7s0ef2eTOJq4et3n6pTSS+HM601tQ/kGpwr/Q1D8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LNaY4pEaLbwdtXWcORXfWsvOBJ17zzEeZ9S/wuA646b4N2gH+c0lNbewspSwKixVS8VOUOnTVVKnk07Zb4+ArnRKpbqOfEsKmwRE+Gg/KPflqUvtcKHE8r7Q+6PhK0uTteZg9CDaW6BsPTsWVD1wdLoL8BMZH2+Qf4n0qMduBMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/4QU0Lg; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/4QU0Lg"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so8799255e9.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Oct 2026 00:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791791431; x=1792396231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVxIVgS58v6Z9j6X8602a8nGRWydc8ljk56Wi8nDAZk=;
        b=f/4QU0LgwnIUn0onkp9ulKK0UTOJ13wh8MoMtTs0jhP8x6Qya6LGJ6myRkl7M3jDzZ
         RyZcu+WwvCOFa4vAOrbkqLge1aXTFbdhNREuXenhwaFtr333QDtm49MeTAne5wyZeArx
         chKv+MPs/DWQ0M5uQPy30DxOSS2QCakfNmuZNWnmbm1YjWFPWM3OrjiGIX3UWNmGJapx
         O5i+kic9feTW5Sbt9go7yq5bZiFcaQoOChWxTxhxJs5ZRcol/Ig09y6jKn1tOL8w/3Xi
         r6jwvyQaxBj5VclwLkmuXUp1i+XRnp9UoFh855e545/a/k++rxjNMJOSd3MZlaNvI+5s
         8aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791791431; x=1792396231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVxIVgS58v6Z9j6X8602a8nGRWydc8ljk56Wi8nDAZk=;
        b=h2f07H7D5PbwvbZBisMyeWj6PN/o2Dej6cTDEhziISvx2AaWJNkqEXjQKlvaT38QC+
         PhsRqGAcsW/vD9bviAz99TgIsaZD+qzYNt/HoSDU8mYrMWV0XRY2dXxFvwYFYNWzEuIB
         bJNY1W3DxORCaxNYKbiVgrb++JA3fTFzHEJxBgNYrNOxYjitptTRJ0hb+EqNdrLoUlI3
         gUI0MgnC2k+mxzNzBezYweBe4Tt5w5oTyQNX8MAOgtDOWKGJgpGB6leY7+UCg+XdpgUR
         dtYV4h3OMWjUvJR58fvzdQIbrk5DgWCPJV4ClPxSxn10wg/G/jd27fTTkkOu3vUa0T0t
         bBtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHAVoqJm72/aBS3cTh+4HLuwjW/YpisWF4uHBOHF8BPMFXGGSSxUygFVsRi5dJhx+HdGOjjfwT1H+eUrOUjPMK@vger.kernel.org
X-Gm-Message-State: AFq9FYKYk1NNhjIQ+yaABzaNXd11X+/t6xYq4r7/HlZXD5GUA50vRxHT
	+inVECpNELplV4V1CzBMC4W3WT8hDCqoRjuKTrZT+cnLvRTXUwuuCAUa
X-Gm-Gg: AYBFou221GFlwMC3XV2sh5vRuzQB6DrVIc8zBGWadcEci6s7AE1JA7TD7R2/wbivIZy
	qWWB+QjTS4bLzliLVtIoLZQGAaggpMc5qyprvmVi4XJ6LD5hjym4vDUGPNoninv4792xsT2L9pB
	3bqiadxI1BQquQEXGQR37baDrbNbdEIsFDcrU66gUSrmJJ/lbx6zsFuR1UrKHHkn2bvQiGI2qlT
	FZVgZpOEtzf5Kg6jWuy3ZJJZh5iLPXTuBmjukYoehFm/a2dMzy6y2+C29Xk7DsniF4uj5rhsOLM
	50bggVVYbXWK0Apiz1cYbDih6yeuTr2Xb51pMvuUeuLuxHJvJQ3HVdF4OYEwx9edeu/CW8oxAad
	BR38Xt1rxACetWQvHWiNpQMhwY312uIRvT6qw/IehwsRqs4XM+tFqM/bcgc349Wi4f+N4x0RbM2
	mhyXeFrUTvOImqwP0NiT1DbNBc6u8QonuTOb+vIgVTq5sUWpm8d4u9Fynw3TX7TiVbH3xLw08Ip
	ivFBOET6z1fZ+pBExvdSw==
X-Received: by 2002:a05:600c:4ecc:b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-4a18e4d55f2mr192414765e9.31.1791791430487;
        Mon, 12 Oct 2026 00:50:30 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4778:c500:38e4:cb76:562:f06e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf35930sm263268905e9.13.2026.10.12.00.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:50:30 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] rpmsg: glink: release channel OF node reference
Date: Mon, 12 Oct 2026 10:50:26 +0300
Message-ID: <20261012075026.3265557-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_glink_match_channel() returns a referenced child node, which
qcom_glink_rx_open() stores in rpdev->dev.of_node.

The release callback frees the rpmsg device but never drops the node
reference, so it leaks when the channel device goes away.

Drop the reference in qcom_glink_rpdev_release() before freeing the
device.

Fixes: b4f8e52b89f69 ("rpmsg: Introduce Qualcomm RPM glink driver")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/rpmsg/qcom_glink_native.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 55793fc18293..5142730dabc4 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1623,6 +1623,7 @@ static void qcom_glink_rpdev_release(struct device *dev)
 {
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
 
+	of_node_put(dev->of_node);
 	kfree(rpdev);
 }
 

base-commit: c39c2cdbde1f2ad9e2886167e55ad6b4c4907d7f
-- 
2.43.0

