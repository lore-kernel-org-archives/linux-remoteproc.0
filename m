Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E84284693
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2026 13:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781788866; cv=none; b=KjN5Ff5JTxML3xij1TmkG23KiPqmaAVlpLRClSb1iZvADwjr5jQwO9PuIwGQVSXh5LsAj/azMI4IPAtEj2vgo91WTWrNlLRFLVVaaAJ1I0jOaf/CKRYQMAZBFdBrVMinlb5UnfGSCP52D2JqfMJLEmqI1FbWnp7G4rXjaf8Uy0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781788866; c=relaxed/simple;
	bh=vNBdjxlU+ppYVxObjZABSBqUOEIF651kxgmpq1PcnqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fdMAQzxyzzKRw1zeipxvbwP7H9WAXSLggzV5fWA40RuixQFZIBztLgFX/7+H/Ae/m36AkzoO8nIzFZIi67XpK5VEEKwjydKbsJvOLQdMuNEiExEcQl1X1RNOrSodr67YjjDfVxKfOgORYBG/j1XZ+8bvS7k4bN8qMrw31kWTwWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfXKKsdA; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfXKKsdA"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37cbcf49deaso474097a91.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2026 06:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781788863; x=1782393663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iQcnBImPBTtnYmt9WXdAtfeZcsf+lPgDW7RAiTWI4cE=;
        b=KfXKKsdAbIW8msXI8bm7oncfKPtllmcuaTGN20eeD5EQdlcSgcWTl93mmuRCFEen4P
         WxFIf9C/SonYRBZMhMVtjcstUfMBmFJ76ehOYQ/inIFpULAlFXqfVf07Ikg1SGtbNNYU
         fNdH4kDIK+U5fBEMgxrPsgft4HJ8Y37iUi2S+lz0sD9ZgvmEmhoo9i60qnD9w3icM7VL
         WIiw44GQb4EWC7K6LIlKN+AFeMZFC0SnVK2e0tRGX+DSr3WwINIozAfpZ/TYm3NBhLXp
         Db0JmwGXd6alScTqn+QRCn7EEHeqGPkcAGqW7+/ciraUO/48l1PWqXmonDxr02cIIOcn
         sakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781788863; x=1782393663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQcnBImPBTtnYmt9WXdAtfeZcsf+lPgDW7RAiTWI4cE=;
        b=ZtjZj7cslZvuUUUrR7s2rSO2R3fwALZl4MaNYGRPTy0UpRE1/OO5z1Qcqk2HWchMfw
         1ARucvP5c+gPfwdbqExMNrH9GbXRTbCG3a4Yph3Z0/vzK64iK3tdDeoLnop/+m8z9V2k
         eLdqpIitjObWQmK/2gMlkjP3I9Y79zXDzLjKuurOKMOFXINxGwTiw4fTX8WHTL2JxBMV
         GTC7VXjceXW7i8vPkPW+uDNMWBfSXTR4679mpY3njoxRPPoNLMV3TR38EryEUi2UFWVw
         WCNb2TE7DBIulFiOE9ICJC+FbNrH6DU1ISwTA8IEmWV0DZpuxQuxJIcdCfIW/vbrYrbc
         oFLQ==
X-Forwarded-Encrypted: i=1; AFNElJ938ci2KeGglFPS78YKbrFUTUHMZR0DqIEkGlZFtHlOAJw9qBnBWD3jj3UDTQw+4LGlayjKhgsUlghXfeCRCP/m@vger.kernel.org
X-Gm-Message-State: AOJu0Yws4qS5VjlYdeoAb6yeXsoX8Rx9kvQ805dZS+qd7MzNRh/3FVxr
	q8Yn/hKNZP/6/OTe4JitGzp2CjFVIEbscGXd/zkyC7qP7fmoX9I82vs7
X-Gm-Gg: AfdE7ckxRl1QfS3ZpGBx3xBXMeJYz4gxNLiuGEoF2loWOLx2jE5kfovif+Dy1H86o+Q
	DLkwkftch49DE9nq1UvuHlNe2mtEfBHNZuzfYt+t32j1/7boLzVbUZug0MP6aPJau1xruayTjcO
	5W2LeEKXUwyHxGYtc86mVHPOkWmbU+DkaZETtikDu36CMO3zdwmUanM6Ly/o5tzR6n2mUYy9938
	64slUvPMIf/3NGgRGWW1p328PsWbF3M5NQRvS+tBVguBnfOJLTw+WYQ9rLWlOW+OEh7fIUmngNe
	fnfARlBAmsRoZdyTb/XGAvVzoEBFyQdyWlqg3ISjXPwd653gtcL6LE9BnJ8g/wt13jAVHiOOBUE
	lOSmoXbSyQNqUTupLkPSq17r+120Z1NmGlnzi1pwAkqkwxT2/FzU0Agrdgr7qtwzRGzJw+I46pq
	vNtbfNpUtkYfgM3rFqttFgpS6Ty3N/aVgNvtA50F3T
X-Received: by 2002:a17:90b:4f49:b0:368:6998:b4a9 with SMTP id 98e67ed59e1d1-37ce4537d59mr3751785a91.11.1781788863063;
        Thu, 18 Jun 2026 06:21:03 -0700 (PDT)
Received: from steellegend.taila75641.ts.net ([2401:4900:1c19:e45:6f99:fe25:8bbb:3a22])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c5b377e43sm8256956a91.10.2026.06.18.06.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 06:21:02 -0700 (PDT)
From: Uday Khare <udaykhare77@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Uday Khare <udaykhare77@gmail.com>
Subject: [PATCH 1/4] remoteproc: qcom: Fix glink->node reference leak in qcom_add_glink_subdev
Date: Thu, 18 Jun 2026 18:50:54 +0530
Message-ID: <20260618132054.11010-1-udaykhare77@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In qcom_add_glink_subdev(), the device node reference acquired via
of_get_child_by_name() is stored in glink->node. If the subsequent
kstrdup_const() allocation for glink->ssr_name fails, the function
returns early without calling of_node_put() on glink->node, leaking
the reference count.

Fix this by adding of_node_put(glink->node) on the error path before
returning.

Fixes: cd9fc8f1b35b ("remoteproc: qcom: Pass ssr_name to glink subdevice")
Signed-off-by: Uday Khare <udaykhare77@gmail.com>
---
 drivers/remoteproc/qcom_common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index fd2b6824ad26..8af90d4bdbdf 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -247,8 +247,10 @@ void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink,
 		return;
 
 	glink->ssr_name = kstrdup_const(ssr_name, GFP_KERNEL);
-	if (!glink->ssr_name)
+	if (!glink->ssr_name) {
+		of_node_put(glink->node);
 		return;
+	}
 
 	glink->dev = dev;
 	glink->subdev.start = glink_subdev_start;
-- 
2.54.0

