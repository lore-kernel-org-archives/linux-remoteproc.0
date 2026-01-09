Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8752DB7BB
	for <linux-remoteproc@vger.kernel.org>; Fri,  9 Jan 2026 04:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767933243; cv=none; b=cW3VxOJUUREhx4+gz/1Ns06exno0gJG+XUJBE5m9vzKOeRs6pzigXVmOiCp8WIydm33Uy818f+11gGpk/TZhuUY86Tja6sIhCYvwBiwZZXCcgHRynNbc7en51WJXnoNAE8V4sDcLAOw4wJI9Lm0fsZHRof1itWC3Yz+8U71kQJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767933243; c=relaxed/simple;
	bh=5f6p0MjIoVb94q6Yxdkk6cMxfowH7rGbCR5LyjqAQyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CG3p0SP2B9MRfA9B+wsU9xLa78L6iY+oVI4YdD+yBt/BLQLQd+H0OjPeMuk9vXZSSyoTsD49l6c1nfIeGs4gsqA3IUptUaoC3VrY51hvlfgjuuDAsrHaJaN21RlnEoMxVD/KHMjlw0Sr+rgtepKOxD3soj4wH3CZJzEopvz6708=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akkoRoVL; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akkoRoVL"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4557f0e5e60so2520147b6e.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 08 Jan 2026 20:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767933240; x=1768538040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRS9gGAPNZv0m+OPKpcvbvMDMuzC8rP8cL50+cIuJ0c=;
        b=akkoRoVL2ooyD0aS66WYGUlwVjVpI6hifX+HiJliL3WQlvlk9qq5xMIPnRXMSXFdS5
         pfKghQQGsescD1Sx/rzRp6ualLsuhK2Ma+stXU4S78hFHEsmYpRthZmJMCBnlXGCcvuj
         Njxca8mYlMvmhjM/HymVZRyzyUoIm2Ab/CZhn1ENywLk5zzZMFsLNrfyqKwbrmIE0pae
         7P1tmCl5OCq1DbTEjkjrn7XcwC5TnfEhhjSaQm0y34MCAxnP4juK5J8ZWqealSYSJIql
         eIxJyd7wg7BEJoiLKS/X7ZbGdUg4RgpIuqdoHTpiC8f2E0C1nrvL1SLgioy3vPNlhfCb
         +vmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767933240; x=1768538040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qRS9gGAPNZv0m+OPKpcvbvMDMuzC8rP8cL50+cIuJ0c=;
        b=Oz27iA0Nlb+h6VQ41NNyVO8W8ZYpCKo0axiQSrq1M9b8IOeR2cyQWIdS5Rq0ef7ZkO
         wTNiQBO868g0thapYsaQQxhK+VBq3ABgDbX08CKre/ALg9F3ZRp69QNmFlFM/NfMwaR5
         wdwSGLYnqN0kw0WJ+HLV41DFCYNJtth/075+yjDsGQxaucatFP91MW1kR5oKOdR+X9XN
         kzgLTxP+N6ltEPkQfqBvrChJOqCLJC8fcHds9MLQx9oKhzJhxpxQXRW06iobsZJtAH8O
         zHzI4/Fwv5aMEzRNmLrQ5bB15oLxqds0a+kXMrtkZ8/b2hnYUtqDgklwscfVuOHtwQ7H
         wCNA==
X-Forwarded-Encrypted: i=1; AJvYcCUY5xGYYu/IgonQURS6SG09mVHaaOyClPC3U3Wg7s99Dokf9Y2H1/c3oFbcohdy4eZi5Z8yB4Y7b436pSQC8hrQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ+B/mDwuA7WrehY798hCgz/wLXsLxkZL8SHLQyAntqPUf8V9b
	ymP+sHTnCeQxpANcSHWhfqW+v7TA/5Tn5wijlvzZqmGMh1/GCK6mKQxK
X-Gm-Gg: AY/fxX7Li4eqvu+E5nL/DPn1oUe3AAdTYPH28YrJRf9PlB0XM0AlhWjU/uEYYO/n69r
	njdXVRHweKkYfH9uy2PdmQMyhOYMCFohTvpcviqbckA0hCNWFTqlWSixNZNpETc70kJ/XxtzoXL
	K/kpbLXgY405rdAS23kP9izSZJL6zOQm8hXIQv5ag5O6yvl0VONqSyKv3V3Qp1mTaX7wAt0pMgT
	gI6OPFIkG8ur0nFE6qdlp6OS72lV6+HOfQKDKS3Fi3QoOStqSJ1Vru/OTfvFdX9iTMTR3kWAX3x
	wJrl7wrFjWzqAt9LDJ9c7c2ZOo9KJm/N1i7B0H9vGGiTj5EFCqfWHz97SM9S55XuiZJXeqO6jDm
	G+DGRNNocBqW9XpCrkN87D/yhdp2rYv+eZIS4oCTeAerYzcJwbvzAt89R69g7VVQvRGBlOXbjjB
	1Mr+MEVXIAFq/WkCp2d6uxSDYKdOUg2+mnOsMliro+cfcLQ0XZYXkUkidUd1gmNfMITK2kJBJKS
	wGMVubDeI2/wBP+LW7BxoBNhtkn
X-Google-Smtp-Source: AGHT+IH8qFTLvCobTc/CYdKIqn0h+JliChB6LnP/bfX/6ft/VEkThcEwU+4hDQ5PgxrGSgk2Rnoa/w==
X-Received: by 2002:a05:6808:6a89:b0:44f:8b8b:5dcd with SMTP id 5614622812f47-45a6be987admr3631854b6e.50.1767933239894;
        Thu, 08 Jan 2026 20:33:59 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa515f4dasm6274421fac.21.2026.01.08.20.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:33:58 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	krzk+dt@kernel.org,
	mturquette@baylibre.com,
	linux-remoteproc@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
	Govind Singh <govinds@codeaurora.org>
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v2 1/9] remoteproc: qcom_q6v5_wcss: drop unused clocks from q6v5 struct
Date: Thu,  8 Jan 2026 22:33:36 -0600
Message-ID: <20260109043352.3072933-2-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three of the clocks from struct q6v5_wcss are not populated, and are
not used. Remove them.

Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
Changes since v1:
 - no changes. Moved patch to the start of series.
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index c27200159a88..07bba47eb084 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -123,10 +123,7 @@ struct q6v5_wcss {
 	struct clk *ahbs_cbcr;
 	struct clk *tcm_slave_cbcr;
 	struct clk *qdsp6ss_abhm_cbcr;
-	struct clk *qdsp6ss_sleep_cbcr;
 	struct clk *qdsp6ss_axim_cbcr;
-	struct clk *qdsp6ss_xo_cbcr;
-	struct clk *qdsp6ss_core_gfmux;
 	struct clk *lcc_bcr_sleep;
 	struct regulator *cx_supply;
 	struct qcom_sysmon *sysmon;
-- 
2.45.1

