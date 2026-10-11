Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B60329B8E1
	for <linux-remoteproc@vger.kernel.org>; Sun, 11 Oct 2026 02:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791685718; cv=none; b=nDGZ1joDzDRbiF8muXVUOX1pOUYx4X2Fl/JdwASU2lVt66yQtuAmgY7bclqGZGIq7hpNjXhEsL27PFxumuj80gj4//IQY6HK8DGcl2lGG+4UDbWmLtavTy/saJAyja8dzUZr4NoZre/WnmPIW3tmkDgUVZr8gm5VaCSa/nSy50o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791685718; c=relaxed/simple;
	bh=etq7+g2rL94QK0gzoUV5j76lq9AirHyTnHCtlBi3LuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kt8mCOkBrzaEkNPcqp79ttyOrfarVM6xMFo5AGU8P27T49HzvcMGkbg9oqHFmtmPJGJVAdVtQsX/TCOL+Vnw5iVPUhyMJI3LVDSza6Aczpzu1sLAirO1dbNohniYQ8ZzAnJ1I1DJILr2nYSUxTnB9sUg3JOM99zS/0l5Fceg9eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UP9xemUO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIT+ZxRy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UP9xemUO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIT+ZxRy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B1prUL1634082
	for <linux-remoteproc@vger.kernel.org>; Sun, 11 Oct 2026 02:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Tsw52ZQ+RZP
	9IDHZvMkKCCM6Ksyer2YkUUSMBBReSdE=; b=UP9xemUOCj2mnhEUyGRstY/Zymm
	9oNmKFW07QH2IFaPQawSYIbDusYBPAGb4IVfFf8pkA9IAl/4KOhNiLQcJ0dcQIVN
	7svRMAFFY1f4YITg/v9c5MxcsSK/9ZPJXy0v67oiJ3LwGEpo5O1yqOwGnYLSuL7T
	wGmg7hR9iw09ILQ7jGsTAUb/TQ8cvILn2QnKxpGALK76u130TKfn3YpfWNgXAgow
	W55GklXvYKcHeUFhrkOzMfzfblZPo+60VE5xbUrjP3JGLrWzHt3yYle4HcrD2nAM
	tBqdE8qDL8g9sDPJqi18P4aETI7l6TilrDn8+AaI5Ov4h6Cc1MOpyb1fsZw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4ea2vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 11 Oct 2026 02:28:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1522724eec.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 10 Oct 2026 19:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791685716; x=1792290516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tsw52ZQ+RZP9IDHZvMkKCCM6Ksyer2YkUUSMBBReSdE=;
        b=NIT+ZxRyzUesx+32ZCSINoD115z9ZYhX4WAYcJCH7DdIGoGrv3au/s7RViq0ssIKBS
         8bM92ZQe/m9Kg7DycUQ6cd6OtTC1Go2Jb8r8/emyLtwvF4CzrIpvCcQDEptdQavvWmA9
         tD4Eln5AaS8M4Fyib00VRqAH15WfhyKPAJxBjzuAhGAM67i6Coq+91sp5xT0fjAN1N0F
         jq/GIBi5ITvU3culbmOVSdLczDcceK5+mcEC3BGILFWoUXiOjBahZwkR/4bWsSer9+j1
         tUqlS+lZzDyt8F5FfaBN0qBsVnc3yZeuuVnkjqCinrXgW/TrqHt/KrmmvwC2V7Q3FOlJ
         dZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791685716; x=1792290516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tsw52ZQ+RZP9IDHZvMkKCCM6Ksyer2YkUUSMBBReSdE=;
        b=ehsPugqRwQDOlcRUoR24L1SXbx8LoanXrXsIRtAprj4D7cxfYTGnUUCMewYC4rnmb9
         LWwRwhy/YyO81zD/vQ/0qWg+IXVTBgUKdGGwJdIhsjTZ7jSlaXeLtBsT8RiQ0vIV8xOs
         uUSqGWH3py5souEfBMSR7NdX0a3LHspciYwUIU2qqUbBbQN58VwioNt3M5PnqjaSipy3
         bkMp+m2eyusFZlVBw+28SQ0kp1lbv03IyJU7U99JcPzgAedTK7NU9Ff5R6GL4qyZ0gQI
         v4cCs+Oay/QIgP+6e6z+po5jMfVoT9XRcKXi9LVkwTaEYV9OfYncLJLQ380Ao5B0m6KX
         8yWQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+UG0NwNKwvZI/Uj22bUKtbathmUM2O4kkMvzapkqFXPqo5gsdfWZqyOHFt/Pnju8zubQIKtnzHevR/1VTGh7K@vger.kernel.org
X-Gm-Message-State: AFq9FYLEQDDFtkJ9Mph4aGVdKs8SyfgseK0e76JrKtBkNnx4zyvqKae/
	zLAuWC1rDRTEZoPEpdQllvYphUZI1b2T80hkwlCZk+ZCGpjVkfmS/hJuChN00/FDW+2vaNbg+8J
	Nd3KpbJwuv4WST8A6lF8UD7QbYY6oofzPcPM8Zk2kIlRizM/TT43HwOFutmmDv3wZnrODAp4S
X-Gm-Gg: AYBFou2+0mLg7DhTnGjyrwo+LrcvK2Ot9Zqv8k+44uvUW35HfUBP6CizLyyV/CzVvHG
	hVJ0gH9536C4+eP7LQLi/+3l+iH8peYo6CXus8rCUMn90SuoPR6G34hD/0UisJ0FGtVtLi7KZDC
	qcm+3GmUz5z0UPdMfkSVmaqwKQMkH9Az+EJkgLPQOYXwkcosmDHPFW5rBEW1/qJZ5RR9zVwN8iS
	UAGkmTd3Tq3t249LjrFcHTX/lSueFONWjNOZBQd9zQYrctuC+1X0tIevii5UhvSSW9n4je2NhXP
	Q2jP1NPbzum/xgMXYInuRh9r1PuztKjBIxsMR0+S5wLD0aXIkX2mf/WUw2+f6ePzU4ZaIcLn5aC
	9ci4LbLBG+5cW0vzBntmcYJd+bIfrUadhV6a26Nm9rsJaEEx+Uta655yIqXQ=
X-Received: by 2002:a05:7300:c7c6:b0:351:7108:c62 with SMTP id 5a478bee46e88-3537e0f3a99mr7693037eec.23.1791685715928;
        Sat, 10 Oct 2026 19:28:35 -0700 (PDT)
X-Received: by 2002:a05:7300:c7c6:b0:351:7108:c62 with SMTP id 5a478bee46e88-3537e0f3a99mr7693008eec.23.1791685715261;
        Sat, 10 Oct 2026 19:28:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm22068243eec.3.2026.10.10.19.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 19:28:35 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/2] remoteproc: qcom: pas: Don't fail attach if the remote has crashed
Date: Sun, 11 Oct 2026 10:28:02 +0800
Message-ID: <20261011022802.4069489-3-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDAwOSBTYWx0ZWRfX/Hiz88ohAgY7
 ywW6AUNHs8FrRiBX32VoZzA9Uiwnp7DDX2d3EcwrWxHJTlWe2EHHaZF+VrTnI9KISsvL/Hi7/fL
 eJN6jcpXR1klby7pNATOzSG6Pw14Rg2jHcFwntmpqQcVNgjA+zE0H9khllvCK8+KuN42Nnq+ODY
 CM0PfolF+aWTRZyExyzuGBQEzSBRBCh5wETHaVXfQ7zbujFMp6N4oMho4LkA3gQzulyvQBDkCJl
 QaljGIc1HioeDgU38QQc97rDrPSEkQVVDsefVYQ8PfMK5fsksRgjd7AByfczp0zpmWT8oe9Qimz
 JUefbzsB05asmVi67C7W9/c81uX6dG2Crr+O6wOi5btiy0hG9mEnPkjg3XE00XFGInTfb0DKi5u
 3jbJC4QPRNKl/qXbNWmIaQ9ardiXK/U4L6s+pInHUQeyfRKBbbGe7X2xxAH9vUArUWVlV9yaL92
 JBk9KDK6TchBWG/9R5w==
X-Proofpoint-ORIG-GUID: Zhitu5XxSvt6wHyFwZRwyJpJuRQWBOdy
X-Proofpoint-GUID: Zhitu5XxSvt6wHyFwZRwyJpJuRQWBOdy
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acaf454 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=3PKELjQNWO5EQmssXgYA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDAwOSBTYWx0ZWRfXwRkyr7IIf5Hv
 MHkHBV8VYsZ4KWPA/QvNlwJYJDzxPmR2pTrlR3rjslb5+cPJFxUMDKby/4ZH1jtF8GOs/UmAXjD
 EAmNk1tILzxoCrrqpgWo6s/xHpIz1R0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110009

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
index 56179b71fd2a..99f627db6bd3 100644
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

