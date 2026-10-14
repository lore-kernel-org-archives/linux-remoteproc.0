Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385893E763E
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 07:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961299; cv=none; b=fGimizoKArIWkrWiJ2PDAGLRIyAPg4kna1LY8lMqV1akTYYb24m4+e1PcOSGZfaVNZNWuVQBSK0r+arJ6vFYZGXX9VuL/ZvxLZhxKBV19FNhVRFdhsNLIOCM+q/1RuNXmeXkgVMhQaxiy8T6BavYIxToOmSXhMy/eXM8faBVKEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961299; c=relaxed/simple;
	bh=/Fi3cEGG/0WdIJfEfuxJy0AklWIXf36cl0GBkUle6nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jonqkovyBjp/VNl3JWx16B+rtpVzzyyhD3VZ38cdHsFjfVsE1+lxiEC9K8kbPkTrb7Wec8yQsGl+lu7UsIrvsk8fny6TV56fHLQcN6pLCdh0NsbryxK3LGQwK/qThOX3jNhQTP/FTPFrsoiMkW3X2PBQpBiKBv2NSrhGUvdm9kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0mE1aka; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NTSloZUq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0mE1aka";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NTSloZUq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E4NegF806654
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 07:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EQisfzLzBS4
	VxQkfKP6jsZVhzhBxlSnN1Kj4T7LYkxI=; b=X0mE1akaMPbKmINU/Mi7VmITNYP
	uEMJE9+/3JNPYfRAdcvoFHlINQ+18yneC1kr0mMsHuOqLDgFr1sfGmFpeIxvjVfI
	sTAIv9ppb07whPd/B/ubwXBemZPM4gkVt8cWicbJDKjI1P+ewDOW5DzUgzribQBa
	72UJrU8dbzEc30uzpypAwzz/GHXlD5Yk4X+CnEOMmvd2ria0k6JhQERmFJSB16Su
	h0v492dANBD6/jU5UqJneryLuomTNgGI2pUV4y8pmzYOha8wMzk/nrM6tfYqL/iL
	Y3Qa7aY1SffYMjriJPPnF08MYJVVich1w/ImFxV2AkVIY4EaDNAMJ6ufN1A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6a3wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 07:01:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so113617a91.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 00:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791961296; x=1792566096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQisfzLzBS4VxQkfKP6jsZVhzhBxlSnN1Kj4T7LYkxI=;
        b=NTSloZUqsHXqHc/4/FyLUTtugCW1+tuP2ox5nEY5mjS7EkeXTg+JsHDFa4cA7gnaSy
         7LI/nT+yg+bYMt9tsRUnM9itip3AXTx1wPP3XkVRD/lc9ONWyA8stUsoeBLhkpcwM9C3
         MDWHEtGlCHoZP/F3acWRHuMKZElxfmaJjI5wCQzdHdnlYVHt0K7MNQFjZ7PUvOrkvfmT
         h/cRkgN8nrwaKVXFRGAucan13HAxszTpmkDTLZGZUJLO2V8jj3/ppchSlRSv22h0xhH1
         qyaSLvcxmyZqmbhJC+ND9LAC8DRqa3XiMcvrGMw0lCyyFCrOhW+feP3Po+gQx4mTQB0B
         Zuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961296; x=1792566096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EQisfzLzBS4VxQkfKP6jsZVhzhBxlSnN1Kj4T7LYkxI=;
        b=D7GHQm0f0qZ/4+d1f26qWznMQ9jg7wN9ZJ3CYZ1mSuSqkO09Y0V+JQhB/kyENHxxKZ
         le1V4m4tsiKt6e8hX/beRjjW7yFfJqsa6Wxf61JqHSiZRJsU7w5DkBJoG232VjxOWRTd
         IFBf6DhKRJnnFVwOC2RM0iqxK8tew31hCb1TlXZRdNZSPMfRAzQuGqoBvVeRDw0Rry5i
         03t9R0s+LVb+mCRll8yrro2odM05WrwpkwvpeW0W92HZ1O9DD/66jTxDOq42mmjKGGFP
         /aZmXThmfz2JIH2naheLnu8nyFcZLrs9mUB6htPVE5QPKqe9VCyl7ez546lErxHB0HTT
         YNAg==
X-Forwarded-Encrypted: i=1; AKwUvByZ2JdO5IF1bx+LpXEuxAHFcQQKB5eVfbEeRmXzdab3mrF0uIt5/y2k0NGcMitgqPqo9Wprd54EUsUNywn6ggXp@vger.kernel.org
X-Gm-Message-State: AFq9FYLCGAyNY9SqIVhoKcp/iDSeFAIJJk34ThTwXCMvcoLrpXAe9SsU
	HlGKN/N3tqExhhESuWGPi4gnodH3lD1WVCcGAXo95Fk9Mtaiwzjzn71TN3uRAwCY8/ATPr4JGzL
	9Mhr07sDCBDMmKyUenYYEHbvm8LPCwamsEfcyG8Dquw37hppWfgliLESsVmMKsE73nkaFHLbe
X-Gm-Gg: AYBFou17mqEdpeAd1cJBqBIz5OKHGqa0uuiCnAjqLRDgNq/riTMsXfa40ZgDb2qTzdn
	9IptnEWG0PB6kh1RhCIeOWHb6t6Ghfo8DdbDzkUO72iTv2ys3pgfwm8mL7jFuzzGDhA9y92OAzM
	eHgWZce/jSJttcUU8yT3vJWreBBF68iHpXMiNWciNbdPo+RONHKN9Vr6JMF5KS3GtqWveYfq4mO
	+B21KFUptN1R/mVZu3k7KrY9UUCKGy28fv/5pOI/wK5EyMAe3lXqNUpPQgsEt3zHMTdencSen9N
	Bg/NytFER/pFmXS/Q47CcitsAuKrSr5868FjB1UXDNMK+dt8g3tywcxf2w1ngnDDD03VYLFypoD
	ymRrG0JInC9t7bsROUyi/F1c44XboEkV5ItUGhBK9IZXd2sxpFnz1HHcn2qE=
X-Received: by 2002:a17:90b:498f:b0:3ab:d26b:c2df with SMTP id 98e67ed59e1d1-3abd26bc4e0mr5183246a91.27.1791961295777;
        Wed, 14 Oct 2026 00:01:35 -0700 (PDT)
X-Received: by 2002:a17:90b:498f:b0:3ab:d26b:c2df with SMTP id 98e67ed59e1d1-3abd26bc4e0mr5183192a91.27.1791961294141;
        Wed, 14 Oct 2026 00:01:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac77441306sm444568a91.2.2026.10.14.00.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:01:31 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 2/2] remoteproc: qcom: pas: Don't fail attach if the remote has crashed
Date: Wed, 14 Oct 2026 15:00:38 +0800
Message-ID: <20261014070038.564879-3-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: -ile1DFAA3cEzH8j6-GQkNZUYGsQ-ZzC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNyBTYWx0ZWRfX3Et+rHYsG/U5
 7r1nbvJjml32kM/my5MV9my8XTpRYylqde4yfQAFvDwUMQdJb8Dy6nMJ5iCUozjFjxA7lZLr8O8
 /52nkQ2c5S9fhAc6i0b/PIDO6CN56ag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNyBTYWx0ZWRfXygFqCNvKzOLY
 AxjaidyyFMBWpQRlrOICsKqCBD5b8ijmeLu9K6ogaY6mjFyfdHvB1Cqs5xAh4iX9Y6w/f8Qw/v0
 jgKCTJGMDktboWkKJACBReFG/cqB+NKeSWUECP/lNN1TqaTofgDBnJbq52K4Q5Zk29+0JCLSRFq
 bQhRHA138m/NqJj6X876tPzNkZ6LuYyn6QwJ1F2LLIbrPdC8O7x0tEs8RsteWmifLYyGaug9nPq
 wG92auGWRl30cITUEkzMpRL4+mguan0qgwvbbEuFH2vg3np37SFqUUJEsTpEmqBIAD8CcaOOiVl
 vAoQWT3n7g9mPBe1fr6qOo5mNcVW+2THRh/d6zm1Ev/3XrdzmIzzwSGbIRGzF0LkHZY+2rhf3xa
 jmvyYDUxoIexW0j31IDjU8PlX1iJOyae5AxOXYOhtJzFK+emdJ5spC5xS+mNevWQDRsiuI0aCGq
 QWMNmo63v4Yv1AoTx3w==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf28d0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=Hl7sYoTBFiHLiXpXmLQA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: -ile1DFAA3cEzH8j6-GQkNZUYGsQ-ZzC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140027

When qcom_pas_attach() finds the fatal SMP2P bit already set, it reports
a crash and then fails the attach. The core unwinds the attach while the
crash work is queued: rproc_boot() drops the power refcount back to 0,
and __rproc_attach()/rproc_attach() unprepare the subdevices, clean up
the resource table and disable the IOMMU. Once rproc_boot() releases
rproc->lock, the crash handler finds the rproc still RPROC_DETACHED,
marks it RPROC_CRASHED and runs rproc_boot_recovery() on top of that
torn-down state:

 - the subdevices are unprepared a second time by rproc_stop(), so SSR
   and sysmon notifiers see a duplicate shutdown;
 - qcom_pas_stop() and the subsequent rproc_start() operate on resources
   that rproc_attach() already released, e.g. iommu_unmap() on a
   disabled domain for rproc->has_iommu;
 - recovery leaves the rproc RPROC_RUNNING with power == 0. A later
   "stop" via sysfs takes power to -1 and returns success without
   stopping anything, so the remote stays running. A following "start"
   then boots the firmware again on the running remote and fails to
   re-add the still registered subdevices:

  sysfs: cannot create duplicate filename '.../qcom_common.pd-mapper.0'
  remoteproc remoteproc0: failed to prepare subdevices for adsp: -17
  remoteproc remoteproc0: Boot failed: -17

A crash found at attach time is no different from one reported by the
fatal interrupt right after attaching. Factor the crash handling out of
q6v5_fatal_interrupt() into qcom_q6v5_report_fatal(), which logs the
SMEM crash reason, clears q6v5.running and reports the crash, and call
it from qcom_pas_attach() before letting the attach succeed. The core
completes the attach with balanced bookkeeping, and the crash handler
then recovers the subsystem through the regular RPROC_ATTACHED ->
RPROC_CRASHED path.  With running cleared, qcom_q6v5_request_stop() does
not wait for a stop ack the dead remote cannot send, and handover_issued
already prevents a spurious handover on stop.

Assisted-by: LLM
Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5.c     | 22 +++++++++++++++++-----
 drivers/remoteproc/qcom_q6v5.h     |  1 +
 drivers/remoteproc/qcom_q6v5_pas.c |  9 ++++++---
 3 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index fe148b4b3775..51b24cbd4336 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -147,15 +147,18 @@ static irqreturn_t q6v5_wdog_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
+/**
+ * qcom_q6v5_report_fatal() - report a fatal error of the remote processor
+ * @q6v5:	reference to qcom_q6v5 context
+ *
+ * Log the crash reason published by the remote in SMEM, mark the remote as
+ * no longer running and report the crash to the remoteproc core.
+ */
+void qcom_q6v5_report_fatal(struct qcom_q6v5 *q6v5)
 {
-	struct qcom_q6v5 *q6v5 = data;
 	size_t len;
 	char *msg;
 
-	if (!q6v5->running)
-		return IRQ_HANDLED;
-
 	msg = qcom_smem_get(QCOM_SMEM_HOST_ANY, q6v5->crash_reason, &len);
 	if (!IS_ERR(msg) && len > 0 && msg[0])
 		dev_err(q6v5->dev, "fatal error received: %s\n", msg);
@@ -164,6 +167,15 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
 
 	q6v5->running = false;
 	rproc_report_crash(q6v5->rproc, RPROC_FATAL_ERROR);
+}
+EXPORT_SYMBOL_GPL(qcom_q6v5_report_fatal);
+
+static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
+{
+	struct qcom_q6v5 *q6v5 = data;
+
+	if (q6v5->running)
+		qcom_q6v5_report_fatal(q6v5);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 8991ff090579..a0507860a21c 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -56,5 +56,6 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
 int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
 unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
+void qcom_q6v5_report_fatal(struct qcom_q6v5 *q6v5);
 
 #endif
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 89450cbdb1ee..c50744bee506 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -562,10 +562,13 @@ static int qcom_pas_attach(struct rproc *rproc)
 		goto disable_running;
 
 	if (crash_state) {
+		/*
+		 * Complete the attach and let the crash handler recover the
+		 * subsystem from the attached state, as for a crash reported
+		 * by the fatal interrupt.
+		 */
 		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
-		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
-		ret = -EINVAL;
-		goto disable_running;
+		qcom_q6v5_report_fatal(&pas->q6v5);
 	}
 
 	return 0;
-- 
2.43.0

