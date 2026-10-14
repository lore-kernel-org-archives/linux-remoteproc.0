Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1CF32B109
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 07:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961291; cv=none; b=aVflknO0nhOwzbptAEuYM/MtiG309zoLTeUsIAoz38BGqHLi1tbarppevAFHT8Nw2jfuEpeq1+joFBBWXig4M4aTDvr9VT6ddjC9b9XDQe8KdfPuWM9x2MZ8MhB+p1UbatT0GOgj/gRfdiuRNnevbHqXsMItxpjxE+cAf3EnjUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961291; c=relaxed/simple;
	bh=3vWOkcUbqG9vCsH47NKvAW/YkUVt+P7mpIwWyeSSXK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJc1yBa/GH2dT4361YAYLo4lfklfbqXUrn5DDJloJTbeuie22zw48AeScXLLkvl7T0Vih5z6ecdpPkKqZlTcNd71v58OshVve9M1ZwCvuDqWIuRAF3ix96Ru2xR3Cb1/r7ok9xg02HU7tXGXEowT5knzKg8PKPMIPjsk54c1QFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CWY5R57B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EEKPTIu5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CWY5R57B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EEKPTIu5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E104Ow2874283
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 07:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tyUA7QEAvMm
	55ogS9BkNCuz/w9UcxKy13H7UKICnJdM=; b=CWY5R57B57GoAC5ZuOAJr0I2k+A
	yS4Ar043Vnw3xymcZ6lZHqNN4s2e2+o/bn9ETRjn0YrfvGLkKOBawDSuDAwUiJXL
	e7OX2fe02S+M3OwbtdAKghwyHp5cv2VuuutKC2RQxWOTAgyu7vLiDZo3XaNSv4Zh
	WnyoMPz+SWVhshF3GKF7vIzdqSKv8pRZylwlScGEf7fr3NftQyHjywXgfPrArdR/
	9tlv4TdOqRAg0dc4BmZco7RqMQ2q9ij0XD3XazASOPSGRoCDKwTEWklcoAktnKCJ
	lRdow6wMRYHHP5s4ZJyvngDnYKrr3zlg0ojTyLRnHYVP64v/yP89w0HD8PA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphh7ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 07:01:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so856083a91.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 00:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791961288; x=1792566088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tyUA7QEAvMm55ogS9BkNCuz/w9UcxKy13H7UKICnJdM=;
        b=EEKPTIu5sQlI6NSpqELe7kIsLvK91te+w0pH2RMOfv4Cttfz7lwEEsLF84JaViVQTN
         aebWf5iXhpiTT4u2OsxM6Qxu880LL5Ge+OYv+p+2aW6y3jWpRsPjiAc4jryugXgCK9lA
         XRvlQvTY/pNhL4+HGZitRX3RsNh+Pb4NPKlgVXwvATVED41GxCLcOJqu+JZY5KEbkNp/
         rOz9JGspBQpKLfQELqPHAhJdEAn7QGgeEO+x3pz2AcAN3A6I1Lw8pN966TJjJ3LmG0h4
         HngogaKCeUUKmOs9b+Kj1zkKICT4wpIFuIPjjmoe0TTNS+lcQ8HLOUQeq/xeNcT6oLeT
         P01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961288; x=1792566088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tyUA7QEAvMm55ogS9BkNCuz/w9UcxKy13H7UKICnJdM=;
        b=NSLQ7/SOE4epk5pr+H2Zx3hneOE5S2QaEHl/j8A/7+/sg1qrOSGLPIO0xkU4spNV+k
         30PJ3e+LlLpgJQwcJxWwL0/vj5KasWgptWmmivSs9pr6+9uyPGCnLNGR58zA5mqQZNRh
         Hrs+Aw6Z4jUITu9A4xDl84kb8u3/cRoJUmFpztn4FVYF4QwdeDGUVHPKYaFJmKtWj0fw
         nc3nNDjkaM1ee2485895/WhKdevaVj2a0h5QfMnoOaAbf+YFfKrvYuyJmCE96xZQj2UO
         DFeHIAZLWd0e/n2l9u9QICT8sER7wPyIdueazT/V4Vq4oku+NdK3voz+/dpuVfRgmTZ1
         nk7A==
X-Forwarded-Encrypted: i=1; AKwUvBwfPXQ/xQpn5aHOqHDPYAPpL+Z/59i85lqf+D5wW60fi6wNynw+9+3ZC7jznpRDaLo7FgjsahIe0Lf7SbMo6xCE@vger.kernel.org
X-Gm-Message-State: AFq9FYJwhGEoLb4SeWLHtK9EvWUCDqo72p/mVMrPKdMvqmxyJet82qTV
	l/lhnNdgBzESpqCw61MjB2B9u/bi0mYUvZz9/MQr2VAcWDrLP64XrYqTFQN43d8FOrHYcshimkW
	ewZqKeEYupZ1cdnQ89OuC+az+szr1DPJvCcX4EAOiSJUfO1hLrq7kwSO9HHiOOxvon3Xqjyg/
X-Gm-Gg: AYBFou0P7r6tPlub8Kb7KqyOK7ozT9JZvDiGHDID2GRBJi+RGliAMz4mLckPqRAA7E2
	aLyIfKo4SUt9OvxysGE1ukrK6TpIo8rI734Vq7xb/QHu3zrQYNr5wkMrM7xp3JVUM94CRrOT0Ap
	yXZa170onU8s9hj23zXEv8riDKhD+83OcvGe4AIbBXL7EP+gezO2p1hA+PBbNEAINLI9Gz2M0U8
	HJl7flE9L0Jo7Pti5H0juKLF2IZMmEP0dChJl9rIRkFWC5k/iLKDh3fKPNZ06e40qQaQC1DhA3s
	i9Qf3lwtCQM+NVcgFpq2vGdjWNyTF3pVHCib9LNWXvQOsCs6IGjGsELZ77WJkwKQNaJXO7Lv/Ei
	dU9hdsw+HAa10ePT+OlAD3vS5ACm9OAvpIrfarX4Ez5ro7H9d9Y1/uQ4e4A0=
X-Received: by 2002:a17:90a:d2ce:b0:3a4:97ea:f0da with SMTP id 98e67ed59e1d1-3ab3a735fbcmr12025173a91.17.1791961286944;
        Wed, 14 Oct 2026 00:01:26 -0700 (PDT)
X-Received: by 2002:a17:90a:d2ce:b0:3a4:97ea:f0da with SMTP id 98e67ed59e1d1-3ab3a735fbcmr12025155a91.17.1791961286418;
        Wed, 14 Oct 2026 00:01:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac77441306sm444568a91.2.2026.10.14.00.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:01:21 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 1/2] remoteproc: qcom: pas: Decide early_boot attach at probe time
Date: Wed, 14 Oct 2026 15:00:37 +0800
Message-ID: <20261014070038.564879-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014070038.564879-1-shengchao.guo@oss.qualcomm.com>
References: <20261014070038.564879-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wV2rbwcp9PNxR3NbBdHv9khB1x6Ze8DT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNyBTYWx0ZWRfX9tr7CojD7VF3
 GB+HodicjbZRicQltlVRLtQKNIUcgvcwpI0boOWUqRSYowCPg47CkI6nGqUnAbXZCH4z4YERCqU
 g7BrC7dQJJ4qlFg2UpxL8RkaVtPJ+PM=
X-Proofpoint-ORIG-GUID: wV2rbwcp9PNxR3NbBdHv9khB1x6Ze8DT
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acf28c9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=WnWnooUoZOtDcxsU7t4A:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNyBTYWx0ZWRfX9lw9U/JNHy3k
 A70VCBbCux3afQN4bp2dwgz8blOVNOgdLjXWMOQ5+sfHV5lzFJ1nuSevJXbEpJeETTQiMjKRpOG
 GwOPrFVgpnLfB5mPhLrK5oWZslnx7JEuYorohyMMtoEssjHTfXqRMKJc329hmots5CTHJaGTrx7
 BVLOxwkIIfVpQTRdqkNPpWXYW+qTpD9vrBoIsuIqyiTFuygnWVoB9edovLYo5WN2OaiaZOrG00g
 6HpZPmesMHjQYnBTLKRrEOOd6AkG7NWE506ExbVNueY4Dwih8Or3rFDvG+RdLjvDoxvNeDLZU38
 VS7qzFSFr3tbv1yysIG0Qc8By8MyH21d5X3Esr+2oMZdFLuJSkeb21ipEynai5b/HpuG5a7eGC0
 iFvZMgVWQ0atC1A7xrCZ9+Gw/sIEL8j+vnlHUScGpa1o4458opgoKFXl/gYmq8eLz631ZivMBTV
 +AZhj7qk12PLpR1zNOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140027

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
Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 64 +++++++++++++++---------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 2e1e39826ffa..89450cbdb1ee 100644
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
+		dev_info(pas->dev, "Subsystem not running, not attaching\n");
+		return false;
+	}
+
+	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
+	if (ret || stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
+		dev_info(pas->dev, "Subsystem has stop state set, not attaching\n");
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

