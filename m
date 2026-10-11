Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526E42F12DA
	for <linux-remoteproc@vger.kernel.org>; Sun, 11 Oct 2026 02:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791685715; cv=none; b=ig+KpK3ZK98YxgQiIuK85HUTkf8tqLcI46dOB6xei8YPrxFFLAPYJYjMFYHb7mXR261SqHez6nNX+cbnI3sVcEYFCYZ2MUrZWlIH6NGtbqvRP7nvaKMxU/rYGLn+LW1MMZ8mQnYApNoTehwEKTSIO07BbfZEcxMhz9+mEEZdzJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791685715; c=relaxed/simple;
	bh=JkJs5cjwoBN8rlOLehu73BkS/JnVO/ZOc7zaJC1P2xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dZsuu6DXPpUxODqeTqW05Gb/wBnvAAFP49jIbbI+F7d2tDUOvZ3XhBwi29k1Tz6yDXFfD6Y/Gwj2FP+q3LIqQsUqPhdjy4gd5Z10CSqZHrGdHeKfqWXIqV+XxbFSiOvdBWwL2MicYieiXYhEER6x8+Ktt3+KsiLnECAluqyVE50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gt9my8yL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j4dAB7Go; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gt9my8yL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j4dAB7Go"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B1pWwv2222647
	for <linux-remoteproc@vger.kernel.org>; Sun, 11 Oct 2026 02:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ycrZJCW/C+c
	BFwnxVGbXP+DEuGIvdHmEJkIies5awEk=; b=Gt9my8yLJ8dw5Airr2HzhdeZcvW
	rvjP5N+OodY2AVB00O4HMqtFacSlZ7hJC1Etsrm3wY2Z7tzOr5P4aahztQvlrURF
	Z2o5v05bUd4gX6pMKu0Mu7oSrrAW80kuDR1lBxp3dg1XoMiNI+S5yCPVRNTjpwTF
	95HFakdrkVXh9pVS6ke3IiOOxB86zygjZhp/kKMq7uEcreiS5W3l9eNZL/BGjA7q
	C9WkUmN8g4Mj3yP4K7zUA5W3/+LxOT5i12zMVDxZZsJ//I5otBsJp7RqIU1XFRgP
	sK35Xkm8SJozxD7/LO9YhpYjzCori0Ao/0X56YDX2iGe2lkmMKQ85u3237A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dk225yk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 11 Oct 2026 02:28:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1522706eec.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 10 Oct 2026 19:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791685713; x=1792290513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycrZJCW/C+cBFwnxVGbXP+DEuGIvdHmEJkIies5awEk=;
        b=j4dAB7Go0QwmFy/LfgDxVEllgN6HCjBVrflFP0m/dSMsStAjSYtb8iyT+am75HYbfF
         3dSojorIXd6Iwxmr2Wy/8Y0O6q5xYVPZOEyOo24qnjBUW5QV7DInDtGX/WjbU8emLjVw
         3d+w83JlQuS//UqO7cgAaKpRY14Xp9SKKlkhlNPogA+iNHfmRakmESVsBXKIMH41qabf
         U0XxDrpym1cwcFHY4o/AvaA6l8nsOV2RsFFj7bpLXKtHdys5nfXeHB7dyeKcPezdrSGG
         o/Vtdhp4Z45pMriRS7qOoO6fH0/9j/td1Pzx61PqbhF5kEep3s6iWRdKeg0s3zjaTeFq
         PjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791685713; x=1792290513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycrZJCW/C+cBFwnxVGbXP+DEuGIvdHmEJkIies5awEk=;
        b=wZjee/rL2DTw6UN0lMp9RAJygeeo9UOJTTdvmZP1SQwgpETw5QWqRvhcCDlX60mxcb
         JJC6/CMNFMT0Kh7CSd6v49tpXhDxExuy+x81vEiF2E0e232YJVuepaKBulvAu3m7lzPg
         b6l8eWF9Yp391RB5c+9vMF3Cr518NO2Oil023cH17TckpaoJJ3Ua6689l/NI2qMSPZyl
         2CiR3yPJtpZrAeDQwedOCJCCV1WE5F1QDJq31yQmvJJQ78z7D8FSGs4+w4Xx64SbKhHY
         ZnXoeaoZFiWtXahlXQtdJCnCKmFyvJVPmGByHpG44GXRU5iovp2t/2+zVE4clib/SkH+
         6zfA==
X-Forwarded-Encrypted: i=1; AKwUvBwwkqbk5m++2lQy6Cs+KA7nOKZIS9dvGY/VH0ccaC0lzHRT/XwLy38Lf4/EIGOMwCLDxnFcOnKrSbv73s2EMERb@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+b0+n3EO5lQcSeLm3Qf5CQnbRcXlF7AaWb9eHEGLn/im0xi62
	ZLRmahN8UngMZi/0BTOG2dlzbkh5ZAw+NHEuagG6pjcRzEGVTwWvp9OjdIU/c8sc9W9XsPLAChd
	urK6Gqfs16mL0CHkh1NpD+RZIe+usdYX3gsRHSUpUDd2F9NRsL1HbBfZ4j/XQqENxQOWxbzZD
X-Gm-Gg: AYBFou3aWb25TuspoFgDd5nH/zAJuIR8bhohWRvyRlRgFPU0d5wE6QDakx2CdsYNOA+
	xzkUYGok/qdigAzUzEsP3qVCp/0wLC6AwxmrzeH3KcYONYts7lD4P91MIxKO+c3ViCQUyA0Kvnb
	7XqNvV5D/XpPjbUnkXpK9a1ZWRP7HLJmzubuoqmdiWzurAmlTAzWmxE63CwmXIVot4zPM2yMuhH
	h6V7p7+lrPQxtrVqFS+z9T8rRqYime7i1BooQsu4KdbZkGgcWW2uMoOxE2I9iZAVq95F9To+CBo
	AcoZ8FviWhpV4UMQ5LQ97rMPA12XD7CqEeZiLGIZpnPinjiOBXTi5yiEk7Xnj23fbjr9L9EmVxs
	osv60CwzfKqGxX4rVA+3Gr12+knMO6ld96cexn2S6GvlGPlKte0mxU04nbbA=
X-Received: by 2002:a05:701b:21ce:b0:151:ece6:b16b with SMTP id a92af1059eb24-16a5dcf6531mr7618988c88.7.1791685712551;
        Sat, 10 Oct 2026 19:28:32 -0700 (PDT)
X-Received: by 2002:a05:701b:21ce:b0:151:ece6:b16b with SMTP id a92af1059eb24-16a5dcf6531mr7618950c88.7.1791685711927;
        Sat, 10 Oct 2026 19:28:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm22068243eec.3.2026.10.10.19.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 19:28:31 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 1/2] remoteproc: qcom: pas: Decide early_boot attach at probe time
Date: Sun, 11 Oct 2026 10:28:01 +0800
Message-ID: <20261011022802.4069489-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011022802.4069489-1-shengchao.guo@oss.qualcomm.com>
References: <20261011022802.4069489-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pVJFYcXQufseQCE6wBTFhrjmHDGVImE7
X-Proofpoint-GUID: pVJFYcXQufseQCE6wBTFhrjmHDGVImE7
X-Authority-Analysis: v=2.4 cv=E6hYNqdl c=1 sm=1 tr=0 ts=6acaf451 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=WnWnooUoZOtDcxsU7t4A:9 a=scEy_gLbYbu1JhEsrz4S:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDAwOSBTYWx0ZWRfX2cUJTet0uAlu
 FOh+8ivuyDHEfzqo0bxX3g2VvnCVyq4k57bxbexis5idgITyNsFxB1vcspkUUhY+6aqT7FnWNX+
 mvJp5jACoVWdlKwIBKPaBXNbXNcdzTnGs/OjQfMSJOjz5nmtNlCTSHpi1BuklSkUTyM9g/AzAu3
 V5VnS+bdFYq4nVmqpM1AJeFMP/473PuGqpG1jH9M3l47Lw0Hfb/ZTWUj32/LDGYLwa/mhltU67D
 4D7Ika0NASHczUb8UoBX0dIIZ39nUBzYgGr4htF0rcGHR3EJPnNo90+C6G47GdnER9qQLztX13g
 xbWkJYKKTFiIKA/NfenTzHJsjgWGVZ8zRTqOzq0a52HyDKxpGSGvZD8yr6Nk4DeAfvUMCuv8n9S
 Ci5HOxAU8dsTtU2oRMdNx1NTMIL8ovsrll5Mjeen0blYE8LCcxmAUsLMkNWg9GG093aVpzAg5mN
 dVR2tsB0xsT7HHUDjWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDAwOSBTYWx0ZWRfX42ciIZVFQJvV
 uC3P+ivH4z2eBYfbstjbKDfCy6g1g/Rwafjd63YeunBkasVhcLew8kz9+hmLiCfgPAmpa2ZDoBb
 bcBJajdFdbYC7BK5Wxqixmgjgte/0os=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110009

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
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 64 +++++++++++++++---------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 2e1e39826ffa..56179b71fd2a 100644
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
+		dev_info(pas->dev, "Subsystem found stop state set, not attaching\n");
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

