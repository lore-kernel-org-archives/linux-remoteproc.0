Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31AA340411
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 02:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785466640; cv=none; b=Rd0YEeA2ajVx4Gc3Z0M08beDapHk8HVn3rpLhI0zHNY1aqqyNpeM0qXbcQUfcKo3ggQqdK6qsIkou87YBbscxVIQCMwXqFGd4JhusUG98THVYchdSfxrE1UkoaRyKguPPLq7vzZLaMuzMfgEfatOf1Ksgk4MJHh1dUOwG4CL3nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785466640; c=relaxed/simple;
	bh=1HHCXQe0C3d+iNiV0NrY9YBbMRp/LYW6A+MfF4P77BI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dij2ii2TgJFncSoeG7xjywK/KnLFaGEfvPQItGdi4nMWFzVwtrvVxDZNeSTiM9wAQLELjt2bo+xfHbJGwAy78PR0Fuf/FixzqhFmhF4Nl/SbbSUy2+TG9rkOGGTi+MfPIO9Uws2jzjjCkeCKIGI7LiXT+nhXEqOZR2f6nd8PCA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bb9anXoK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kRW+iHXE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bb9anXoK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kRW+iHXE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V2uSmj2729798
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 02:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8Noa/PSXBZI
	kBi6Z2fWL+n39a3H2u8qSgQfPCHK8uOo=; b=bb9anXoKVS0p8aY4c738TEPrPa8
	V6Gn5vrFi67BJggz2qyEEAjZlTLRfVTAHoZlWUXjcAD15yJWua24tOeGY2nhrUfa
	wG3Cx3f0wr2iIW5GPA6NnNHrYO11hcZWmfa8jNML+AdhBsSgYdCyMq3zeex9HFi/
	BMMwYqFaRQbZEpkKELxh3QHK6mZH/9NUlREAiJeSalFkIaKtibLBVIwGJsLoQQA7
	avj2xkxPxmUWT+fI5zZtVV28g5n4eo4hKqlQVh3L5cjEMa5xCI7vPOG8dZkNtQ/X
	QgEUmmcjo0z2uPHond130oiYFe9x94FuIehjZRZBvVwbXI0MhH3pVciDvfw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frkc5g03t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 02:57:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso555976a91.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 19:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785466636; x=1786071436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Noa/PSXBZIkBi6Z2fWL+n39a3H2u8qSgQfPCHK8uOo=;
        b=kRW+iHXEOJkyucyXYjBCBfK8rNIxoUuejQT7Xk1TcIB3k3HB5eoZMN2zdyRnW9j6fd
         q6BpW/uWCNVQHNrX7qXEQ1yl/e03DMSasr6WI2JGFGM9pS5tprCGOlCYMJ8r5rsW9ogR
         Mcb2/iMlOVPtvkVct+btVK69bIwLjB29gNfm2b8Un83sAT1q1/hVAOE3X+XF7CKJMU8f
         gNQwezElRFxeJV4KO4O8Gxf1F8hMvRs+11Y2qmTbk2v24RZmIaCQXnZo36tjM5ha7IgA
         gOrlhZfSK7U/UnWVxO6QCuD2fv+wlDK7fJfYIgMUp4OdTY5HKEQZNtxIeYG5sljGsTFA
         H32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785466636; x=1786071436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Noa/PSXBZIkBi6Z2fWL+n39a3H2u8qSgQfPCHK8uOo=;
        b=KjXT3JpSi4ol5z5Ul90atWPmyymS4kMv2PQ0pyxSEUiC2qm+jingQeNM6ytq+IBmKb
         08yKFmnbxhcFJMIYoRTfYToL4qQmdmR56TG2CVvSrj0nssQy2yc4+9e35qlWYhmWNJKW
         V1F2iZXFVHh1rP6qRX/RRIMm5yFWX2xWCYI2+7EEGhBIHGzxwZjy4HtP1VMwR+TBL+ID
         K0FERbjh0KNexrNSeFRqI+f1fNijEyuSSG/2QQ04tTMs3v7a64ceuq1qdTWc3Wgk51i1
         OrIUePTwYf4Frv1JiYV1egzVmorz4XKZZam4us5HZ12tnmPwN4kMtD5o2pla9BM6vYMY
         hFxg==
X-Forwarded-Encrypted: i=1; AHgh+Rp01Oiki3dHKmJssf9a4gQf/+dDlCcWZEM4eH9xl2V5u5+UocvKX+SxPmmqahwbWN1+PeVVZ9X1rSvCSu5J89K4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7qgk1TCP2TMvzkWAtHx/1Nt5J8tuvM5Ei5bVG69dca1YWnz97
	gQkkKgNPol+HgPjaHlLbb03Yy04vnkvVLowB/KbulqNvshu8YsYkLwS2QUcWc1597aoG1ugZHow
	dCURqIyKX9bHZ832ELWnEhuoBG/jWjgga7rxlXtXzGXNx5EsRt6+ts/a0bNAOOlLXFXwjna87
X-Gm-Gg: AR+sD11qqgJwDgB4qvkit+lQlzmQ3siNwYJPlRZ/EpGGCLMghcJiBf+swwDfujH32A3
	Qj/bLLkJS6O3O9CbHvdqvFDyfyonwgqPaSgqapm6RIzdhAyC/fo22bvoF9vbMQBlWcZwCS2eplg
	TcLsHCx2cjc7bWn6CQ+u03g+J+sveQtyf69ASGgayOgxh1mqhJ9rF1bw7y4LXpQczTzsXAy05ii
	RMRXyce59o4sV92N15nWeeDS45za5SY0nLXHXG+6nk2QRoCdzZFyNFmJveHF0N+0RDh+++VM6zF
	TuaqvBQ3X6NBXVA8Aassna1wubTQZrjkbxksRoR4cngz18Z+3aQElOksc3qoiUWwMMHwOmHLfez
	uz1xWbdYEAYFOy6pvZ0r7WdE/vzFa6zRSyEmUm26T4+WcO/MijAqjVlwpzrVM
X-Received: by 2002:a17:90b:2ec8:b0:37f:fda5:8d9a with SMTP id 98e67ed59e1d1-38fb1392505mr296202a91.25.1785466636550;
        Thu, 30 Jul 2026 19:57:16 -0700 (PDT)
X-Received: by 2002:a17:90b:2ec8:b0:37f:fda5:8d9a with SMTP id 98e67ed59e1d1-38fb1392505mr296187a91.25.1785466636037;
        Thu, 30 Jul 2026 19:57:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fa748fbc6sm558519c88.8.2026.07.30.19.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 19:57:15 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] remoteproc: qcom: q6v5_pas: Fix unbalanced handover IRQ enable on attach
Date: Fri, 31 Jul 2026 10:56:53 +0800
Message-ID: <20260731025655.2642860-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731025655.2642860-1-shengchao.guo@oss.qualcomm.com>
References: <20260731025655.2642860-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAxNSBTYWx0ZWRfX3qTHuER7Q8is
 MF2bHNZbLPitCf4URmfRiO3OKbi/ztzJlXIBYUyFTqkc9FGUW3Qjx2JyYKEhyHB1aVGqE6g9JIC
 JI9xflWCCjw9KqZqKI0bTpoTCYPCL39KSdjX4BiF5ODuFY1xvkBAfv6lbstMVknm6QIF9hMWba0
 IaK1E49Tk9fIm+VXnAkLUBwwJQxZA3b3cGMJeFKH6DUtKVYBVb5ZRXWTQHihO6vrgd1yAxvSJGH
 ze2OFBOJIYg+xMp39J7vlOpy4PogGXYoqILTHjlq0c8H+bTk0yZ/WGtCKzLLBIL/CREujQ7C1pO
 eMJrIvL8cGQ7FisZUle0UDTcM/ZHjamH42YFcG4f9aZT5F/CU7SBAREv6sjrcpRj46bVP8NyhYs
 8KNz48iB9MAgOUvSkBRvVl2gLiF227cxTnhxqmy88qQdDToyU7BoA85Ehr2iBBJAjKej0q21Uyf
 BfKN3S/uFqpK6AKbeJA==
X-Proofpoint-GUID: ARRSewUUbBPY_Y_YqsUzj7OAxRnvbGZI
X-Proofpoint-ORIG-GUID: ARRSewUUbBPY_Y_YqsUzj7OAxRnvbGZI
X-Authority-Analysis: v=2.4 cv=Bs2tB4X5 c=1 sm=1 tr=0 ts=6a6c0f0d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VxEfS49kFKWyPJpONhUA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAxNSBTYWx0ZWRfX5XeW2Dl2HJH3
 JqS9yfuMyOoV695O4q+PGfxU0K3BK9PlPgnxrw2bSlhVEM5RSf4inwcBA3JMexNAiWcbhouAsgm
 +pQ1W/iMwurF1Edhy8ZuqYwwcE/qDzM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310015

commit bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ
one-shot") introduced tracked, idempotent enable/disable helpers for
the handover IRQ, gated on a new q6v5->handover_irq_enabled flag. It
converted qcom_q6v5_prepare()/unprepare() and the handover ISR to use
these helpers, but missed qcom_pas_attach(), which still toggles the
IRQ directly via enable_irq()/disable_irq() without updating the
tracked state.

This desyncs the real IRQ enable depth from handover_irq_enabled for
any remoteproc that boots up already attached (e.g. ADSP started by
the bootloader). qcom_pas_attach()'s raw enable_irq() leaves the IRQ
enabled while handover_irq_enabled stays false, so a subsequent
stop's qcom_q6v5_unprepare() sees the flag as false and skips
disabling the IRQ. The next start's qcom_q6v5_prepare() then calls
enable_irq() on an IRQ that was never disabled, producing:

  WARNING: Unbalanced enable for IRQ ...

Additionally, any handover interrupt latched by hardware before probe
and delivered once qcom_pas_attach() unmasks it is no longer
suppressed (the ISR's early-return-if-already-issued guard was
replaced by irq disable-after-first-fire), so it runs the handover
callback and disables proxy power-domains/clocks that attach() never
enabled, causing genpd runtime PM usage-count underflow warnings.

Route qcom_pas_attach()'s IRQ handling through the same
qcom_q6v5_handover_irq_enable()/qcom_q6v5_handover_irq_disable()
helpers (now exported) used elsewhere, keeping handover_irq_enabled
in sync with the real IRQ state.

Fixes: bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ one-shot")
Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5.c     | 21 ++++++++++++++++-----
 drivers/remoteproc/qcom_q6v5.h     |  2 ++
 drivers/remoteproc/qcom_q6v5_pas.c |  4 ++--
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index fe148b4b3775..10fa38f264c8 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -36,7 +36,11 @@ static int q6v5_load_state_toggle(struct qcom_q6v5 *q6v5, bool enable)
 	return ret;
 }
 
-static void q6v5_handover_irq_enable(struct qcom_q6v5 *q6v5)
+/**
+ * qcom_q6v5_handover_irq_enable() - idempotently enable the handover IRQ
+ * @q6v5:	reference to qcom_q6v5 context
+ */
+void qcom_q6v5_handover_irq_enable(struct qcom_q6v5 *q6v5)
 {
 	unsigned long flags;
 	bool enable = false;
@@ -51,8 +55,14 @@ static void q6v5_handover_irq_enable(struct qcom_q6v5 *q6v5)
 	if (enable)
 		enable_irq(q6v5->handover_irq);
 }
+EXPORT_SYMBOL_GPL(qcom_q6v5_handover_irq_enable);
 
-static void q6v5_handover_irq_disable(struct qcom_q6v5 *q6v5, bool sync)
+/**
+ * qcom_q6v5_handover_irq_disable() - idempotently disable the handover IRQ
+ * @q6v5:	reference to qcom_q6v5 context
+ * @sync:	whether to synchronize against an in-flight handler
+ */
+void qcom_q6v5_handover_irq_disable(struct qcom_q6v5 *q6v5, bool sync)
 {
 	unsigned long flags;
 	bool disable = false;
@@ -69,6 +79,7 @@ static void q6v5_handover_irq_disable(struct qcom_q6v5 *q6v5, bool sync)
 	if (sync)
 		synchronize_irq(q6v5->handover_irq);
 }
+EXPORT_SYMBOL_GPL(qcom_q6v5_handover_irq_disable);
 
 /**
  * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
@@ -98,7 +109,7 @@ int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5)
 	q6v5->running = true;
 	q6v5->handover_issued = false;
 
-	q6v5_handover_irq_enable(q6v5);
+	qcom_q6v5_handover_irq_enable(q6v5);
 
 	return 0;
 }
@@ -112,7 +123,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_prepare);
  */
 int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5)
 {
-	q6v5_handover_irq_disable(q6v5, true);
+	qcom_q6v5_handover_irq_disable(q6v5, true);
 
 	q6v5_load_state_toggle(q6v5, false);
 
@@ -201,7 +212,7 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
 
 	q6v5->handover_issued = true;
 
-	q6v5_handover_irq_disable(q6v5, false);
+	qcom_q6v5_handover_irq_disable(q6v5, false);
 
 	if (q6v5->handover)
 		q6v5->handover(q6v5);
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 8991ff090579..24263cb514ab 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -53,6 +53,8 @@ void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5);
 
 int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
+void qcom_q6v5_handover_irq_enable(struct qcom_q6v5 *q6v5);
+void qcom_q6v5_handover_irq_disable(struct qcom_q6v5 *q6v5, bool sync);
 int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
 int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
 unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a4b233d92efb..0f1ffd4b6182 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -521,7 +521,7 @@ static int qcom_pas_attach(struct rproc *rproc)
 	int ret;
 
 	pas->q6v5.handover_issued = true;
-	enable_irq(pas->q6v5.handover_irq);
+	qcom_q6v5_handover_irq_enable(&pas->q6v5);
 
 	pas->q6v5.running = true;
 	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
@@ -567,7 +567,7 @@ static int qcom_pas_attach(struct rproc *rproc)
 	pas->rproc->state = RPROC_OFFLINE;
 	ret = -EINVAL;
 disable_running:
-	disable_irq(pas->q6v5.handover_irq);
+	qcom_q6v5_handover_irq_disable(&pas->q6v5, true);
 	pas->q6v5.running = false;
 
 	return ret;
-- 
2.43.0

