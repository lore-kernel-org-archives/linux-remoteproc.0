Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5F1347BDB
	for <linux-remoteproc@vger.kernel.org>; Tue,  6 Oct 2026 03:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791257796; cv=none; b=vCvtAXT+F8mI90Uq2FfbKNvvw792wES9BKtORUxDU55f+E+izlXBcdwSrH/22iDLJjndmg1vGI+Za8osAmeCntYJFwxerERvnegfMXTYFawafYoMZDfYvzqjJPZx01o5iaoVD/rgmGJwYjNiWG7ATa4KXTAASk8l4JajTppifTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791257796; c=relaxed/simple;
	bh=IVycEbWaIIAU6hDnAaiAzdJ894wy+U9qHn6KMqce47k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=To0H3CW+WtZPjP4isyMljAeIfpLUK4kSxQABJh/B41uIFQV8vbzIjnUWCSVkORHFQWJOu73XsyWLaYbkOVlq5+57L1bYsFkmb4CLHSol0zikY5kQjQr6xQDrTpPK5+xj2vlSxOYsfJ9qgrQKj+vGqjkmBu8LabgQecaWx1OEIX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LuRtL7IW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bQj/A4jw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LuRtL7IW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bQj/A4jw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6963AR5m3210487
	for <linux-remoteproc@vger.kernel.org>; Tue, 6 Oct 2026 03:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RpFZpAke/RZ
	zP0IRMjMKbvE37FuS/4TcCKuUa1p0SyM=; b=LuRtL7IWwVih4vOQQpfMKO/pvH1
	+MEJJmBKwe+56W5LvLqLVmMgY3iu/sqQML9nxvTqWt/I98Azamv7NiW65FI5vDbd
	JTsc1pwZInidV0EhogcswSI5ZpsoG1IMux66eEBTXuRVqqCYeecTZbeklbUndYvu
	GJvdrRvaGsbxYl5fq/hX264ceJxciW3qwawEo5r9GKzzp0lAWjNZQoMyGIyNqSnt
	9DtKIxMsgxCmiK2FLbBla6EVoyxlHZAQDMtQ1OPL3M2wBxPGQvCI4eYkv6eBStRg
	UCs4TL3jp/0Px4dgT+3yX/xaJP70OHHv0OleaX8ncSahUHk/B2lZERCMuSw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4j1nsduj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 06 Oct 2026 03:36:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34ef0362d95so4578083eec.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 20:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791257794; x=1791862594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RpFZpAke/RZzP0IRMjMKbvE37FuS/4TcCKuUa1p0SyM=;
        b=bQj/A4jwF5N3eN2dNHmAP33rBBu9vMLqUHEcUqNnUOdqhLv/DW/lFIwOEZR9QaUlgV
         hEkRG9S8jOY1gYHawlLJVw2mgnihYx3djI9O8y9n1g9UroyVvsdgzhYbPzBMmjukLvt9
         /5kxzQO/qkOWt8KtsgvFPixltBWncHOJenLCpe8EesBrXUOoC2pP1FebnblGk5bKwqb8
         mCgBe5jiYvquN7LAAmEdy1MXLYHzwsrtJiYGw3J5sPV9LyYOXx7kOP7bb4F/zgvHgNre
         YQ6eDsrxVD5qt/cM+fR9OUu8yjuRYP8WTYyYvT15xkjbUdZ7AbAAajkVq8N3ZKIerk0W
         uZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791257794; x=1791862594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RpFZpAke/RZzP0IRMjMKbvE37FuS/4TcCKuUa1p0SyM=;
        b=dAfI97C19PNqbjDKG87jF1Q5g3adOB8ttHo/MEa68/4JEu64gkp6UJX0r0V5NrpItN
         +eXhASwcCSPfvCJrLHjKeEuUrwX5vQyT1Fci/MiC8KA8+J/SVSw/zGYy9nKMdYasvXzR
         1TUMvjkIceqkPBkqgaRj6HY8f5GtqisoZr7vUpDsCPnGUBh05Ek8zu/Ax3g20pCvYyrf
         7dvH1peBm/LR2nADFX1r9YYHVqPUfqTF1X1EzJzgUVn0pzTsFVamG9fj+cjlPVMliJV/
         Hia2zeUu0joRfV51fz9ttQp+3QXBt8tLh/36G794Rf14HE1BhogJ9bGxHRiet/+BdJlA
         4Fuw==
X-Forwarded-Encrypted: i=1; AKwUvBwsrYPikwtRcRisJM8l0lCJKCUX/TDJhThy87a7EVwjFJUZMt4z4O7pWf1x7V1ls8DUgTiJoWMyEwYGEerv5ueE@vger.kernel.org
X-Gm-Message-State: AFuF++mduLgX7i9UWSscGKek25jwQPC9ewPDaOpqEwQOLNdS0jBOVt98
	cerrKl+SelGFnaobULNw0TLrHv2HTXPnzZG3frfs6Sw+uSSrLBAk1XPyG11va7PwMIhiHgn1cDz
	GzylN13BOSXr9qO6OdZUW2xcuwutrwWlrAt+lhlV5odACBzA5VC+VKLFPlaxJ+X1uzFXDc/IO
X-Gm-Gg: AYBFou1kUGvel6rijax/QPuCydoPE8r3t72HO60PS6VjiSTYZOWkwYqnZwEnDw95slk
	5GLJbzI7flVOuMD1NvNZqzTC2Eh11mZzhnWHdbRlTWypE2pSSm9CicI/zi2NAEzQHuxnPQagkpw
	0whnwBZMFwL9JiR2duJYbkjN6RcqoqZ9+5IiSAsUETxGFAGUdXbaqZQQn9qZKTY2kTWCElTo8L0
	U7ZAXYJYn/AZ70954e27PZC72m8ERC92J1ZEXu3p8rO6ZUsoKGUvfCgU6tjl+bsznoZla9leAEu
	CNIeJp63WXP6Ic/uDtXQmpWldbKZPFiBIAt9zIwuu/FRRaA9gzcw5TrE8e9XIOjYSTI1Gp6ZAzM
	mgr9UWcVWXyoYZUxRuRnIA4gQ3zIPD5ggxq09UVicw5pvF/94XvYpR1EWHHs=
X-Received: by 2002:a05:7301:152b:b0:343:8d77:1d97 with SMTP id 5a478bee46e88-35111529a76mr11386174eec.39.1791257793561;
        Mon, 05 Oct 2026 20:36:33 -0700 (PDT)
X-Received: by 2002:a05:7301:152b:b0:343:8d77:1d97 with SMTP id 5a478bee46e88-35111529a76mr11386134eec.39.1791257792953;
        Mon, 05 Oct 2026 20:36:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469fa189sm3279736eec.6.2026.10.05.20.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 20:36:32 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] remoteproc: qcom: pas: Decide early_boot attach at probe time
Date: Tue,  6 Oct 2026 11:35:49 +0800
Message-ID: <20261006033550.2726451-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006033550.2726451-1-shengchao.guo@oss.qualcomm.com>
References: <20261006033550.2726451-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAxNCBTYWx0ZWRfX2jY1XkW3N/sL
 g45y/SrAsXnaZdecGaTi8L5H4pewy59JWHMPUDJ5vSklo0CCpGxXLj/dlTWpXxoGNUOdO1J7VrS
 RRvuV1a5Vj0SPMcfjMUs5WgDN9vm6Dc=
X-Proofpoint-ORIG-GUID: VpTckgkqOWPsoncvJLWwsBUTgDXClrkb
X-Proofpoint-GUID: VpTckgkqOWPsoncvJLWwsBUTgDXClrkb
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ac46cc2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=WnWnooUoZOtDcxsU7t4A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAxNCBTYWx0ZWRfXw7sP1dPOxNi5
 FUEFxsV6EzFF0b/nza9NpWX2SoEjrpu/Zk1fcxnG/QCBGBIIlJP06noF3CuVIak2jG0apSL/Ngc
 4BibgWY5mEZKJe0f+a0i8ogVwY+svt7rxFEZ6IbVr/s0hwezPm7Q9QwAcnDoC3/9TZgm5UWLR0Y
 TQYLb8/4cvg0YDBupLBFnae7dTwuXsWIuB9yOXkPlNB2XJ6ZW9Tqi7ZUyHkjLiIXZbEB/sfM25T
 KJWyTdf+V9WUh7qYDEcKhKVgyKVzjeuaCbVdQJMrU6sjsDzZsSsuZjKZIs/fTWKFXfdscvhdbdf
 HFN8kKU5rAXG5GrKNU6eFnqHP1Wo3w75GHqDEJBIQUGqnU1Kn0ZXWv8tTF6416iMnVlKT4dE3jN
 YsmF2VsnqrqUpIF/5tPW2+BLrirYZg4oSiVoT6bcFb/0wrbIdIgoZoa2NKGuED0avXCAFH6DlzX
 CZXqPO/71jmDg64Yd+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060014

For early_boot subsystems, probe unconditionally marks the rproc
RPROC_DETACHED and qcom_pas_attach() discovers from SMP2P whether the
bootloader actually started the remote. If it did not, attach sets the
state back to RPROC_OFFLINE and fails, expecting the core to boot the
firmware instead. The core does not do that: rproc_boot() treats the
attach failure as fatal and the remote is never started.

This is hit on Nord with firmware where XBL no longer brings ADSP out
of reset. The remote never publishes its inbound SMP2P entries, so the
very first state read fails (debug print below) and the ADSP stays down:

  qcom_q6v5_pas 4c00000.remoteproc: Failed to get fatal_irq state: -19
  remoteproc remoteproc0: can't attach to rproc adsp: -19

The ready, stop-ack and sysmon shutdown-ack signals cannot change while
Linux has not yet interacted with the remote, so there is no reason to
defer the decision to attach time. Check them in probe and only mark
the rproc RPROC_DETACHED when the remote is up and has not been asked
to stop; otherwise leave it RPROC_OFFLINE so the regular firmware boot
path is taken. The ready state is read first so that a missing SMP2P
entry -ENODEV is treated as "not running" before sysmon is queried.

qcom_pas_attach() keeps only the fatal check, since that is the one
signal that has to be acted upon once the rproc is attached.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 64 +++++++++++++++---------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 2e1e39826ffa..8f3d45c604c9 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -550,9 +550,7 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
 static int qcom_pas_attach(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
-	bool ready_state;
 	bool crash_state;
-	bool stop_state;
 	int ret;
 
 	pas->q6v5.handover_issued = true;
@@ -570,42 +568,46 @@ static int qcom_pas_attach(struct rproc *rproc)
 		goto disable_running;
 	}
 
-	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
-				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
-	if (ret)
-		goto disable_running;
-
-	if (stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
-		dev_info(pas->dev, "Subsystem found stop state set. Falling back to start.\n");
-		goto unroll_attach;
-	}
-
-	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
-				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
-	if (ret)
-		goto disable_running;
-
-	if (unlikely(!ready_state)) {
-		/*
-		 * The bootloader may not support early boot, mark the state as
-		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
-		 * start the remoteproc.
-		 */
-		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
-		goto unroll_attach;
-	}
-
 	return 0;
 
-unroll_attach:
-	pas->rproc->state = RPROC_OFFLINE;
-	ret = -EINVAL;
 disable_running:
 	pas->q6v5.running = false;
 
 	return ret;
 }
 
+/*
+ * The bootloader may or may not have started the subsystem. Inspect the
+ * SMP2P state, which is static until Linux interacts with the remote, to
+ * decide whether to attach or to load and start the firmware.
+ */
+static bool qcom_pas_is_running(struct qcom_pas *pas)
+{
+	bool ready_state;
+	bool stop_state;
+	int ret;
+
+	/*
+	 * Check ready first: if the remote never published its SMP2P
+	 * entries the state read fails with -ENODEV.
+	 */
+	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
+	if (ret || !ready_state) {
+		dev_info(pas->dev, "Subsystem not running. Falling back to start.\n");
+		return false;
+	}
+
+	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
+	if (ret || stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
+		dev_info(pas->dev, "Subsystem found stop state set. Falling back to start.\n");
+		return false;
+	}
+
+	return true;
+}
+
 static void qcom_pas_coredump(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -1024,7 +1026,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	if (pas->dtb_pas_id)
 		pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
 
-	if (desc->early_boot)
+	if (desc->early_boot && qcom_pas_is_running(pas))
 		pas->rproc->state = RPROC_DETACHED;
 
 	ret = qcom_pas_setup_tmd(pas, desc);
-- 
2.43.0

