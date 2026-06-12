Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39BA349CC5
	for <linux-remoteproc@vger.kernel.org>; Fri, 12 Jun 2026 11:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781262560; cv=none; b=aL/0Faf6Mzqn0TOxvSTNclLPiTGU6Xg8qD9E9B/NcXIBk1iwj5d1aDhXVUyYxaJBnCBEfWr+0knWuEuIOjfsN2kCqVNlSf9gNXAjPRXbuSYRgF7QgzIYwA3jmdJqAr0PXJ2gNLM8LXxQMunSfGy4rzMcF7IkXGS/YaR3gnOYh4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781262560; c=relaxed/simple;
	bh=wDfw/CHOszIITkuDLVx+ZNe5U6VnWJtQo2HJs2z4j0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WNfjnVsyWKQlehETlqlCFhDNIBM163f2lRKISgKF6XW5+poKWGnsUTbUVPP7+y1zadWVhJpx7L3lMgycWewrbu1FWerf60QDWs50ZROVvxO+dpcoPxKFma66ED3tyhsFinq2gNKRybvDZyObTEcI+9QOxJmZaq32CHYHd5loBfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=deeruX93; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECFl+ZI8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="deeruX93";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECFl+ZI8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CB3mdw3506199
	for <linux-remoteproc@vger.kernel.org>; Fri, 12 Jun 2026 11:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Qcl8DraQ+00AIYY2fkfL1G
	yLlyuwfktofxLDB/8usWc=; b=deeruX93h5+BVbZDTOAfGp4iI/IJzDJdycC1H6
	toB6/GoPzxuKljb1bv5PKP4ngSuzTWTILEC5dxpkdSuiayAIWvRbKIto67YtmJHB
	qSvboP6pa+ih1Jl9YSnBXJ6RtzltMDqLoC3saDvf2hJz2wwiiLA5iXm/T4C8ZAsY
	2/H4QZOLkCbw6b1tBAkNveZq6bdwjlR12c4zZxj6ZVNPhUgLAYNI8MgjSBeiTyyF
	s76k+Tuc6iqM4gsTb2Oi77meG9y2ZZXRLpVarNoDOx8qq6CmxxfowrFgRVrQOkCo
	wqddWq6HujE49zLEmJsgApnIglOqOPNf97XbFXholcNaZ89Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd3882-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 12 Jun 2026 11:09:18 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5b344b4e8a8so1063835e0c.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Jun 2026 04:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781262557; x=1781867357; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qcl8DraQ+00AIYY2fkfL1GyLlyuwfktofxLDB/8usWc=;
        b=ECFl+ZI81eAuxbGky4z2Ed9kFFcim2g4DU/Dc7Y/NItbX73Q+c0WYqJzJW+fPvTGUF
         b/kVjYCQAnEBhqsJBbqdLcDTnCKZP7yopKH6Al3XnS2siqywRnOjXLQWt5fLwlY++fg7
         B6YZdPrpyzKrrVPRregG9Ajx1vWmPiR6tOG/nEPrGBx1isX4GqWl1RSjCzmOfT/tsIpU
         9PWD7pxfCZVRFC10I4kwZpO1r9pwLKxEybtPr7hjjRcetqJm178+KEo6bqSgm5lpaTHm
         2xT2bJUVW+E9LTG78Efwjn5OGMoW1JM4nHg7jJVFNNGNILmBhxG6n2LBrbjCFWQjWVSy
         ulbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781262557; x=1781867357;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qcl8DraQ+00AIYY2fkfL1GyLlyuwfktofxLDB/8usWc=;
        b=GwUa3tqjpQxj0pvew63lE3etcOKzc8XzNQIQtXpoyg2C4UewvOo7xGsPrfcvRdId+k
         +qZt3Koo8AxfDcss6gRZTHYOF/BWPYQngcrF+d3ExMceBc6smSzJllu5RBBk1QxaF1QR
         uAh6O1jTMw7dzLNRpeJ9IfNGA2TH59bn0mq6SRgmCWLhbNFM4s6GjVtBtnphLx3n9/j/
         1bjQvunvOOEwYa7zFlkpPpUpCGe7GJ4/h3kslmHEzB7tvhF4/4DR0eHVebuB8ppyszWB
         McFvp1a2CjfIt0Tlj5A+9OIRtwdKcGihlA3UqEPuUOD44/4YqrDur/oOfbY3fRLmxbM+
         beTg==
X-Forwarded-Encrypted: i=1; AFNElJ8kTLKyO/3mVsD1qS5CUOlrWf54bAFF67mhF9maQPX0m5bX9h2A9c/eZ6MudSYVOKM/7XITsgasrsqCprfwiuBb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+gmHUbPDmFEjrdF+gIlG7upsXbDMV3QCQZti3ujhTEErZIaxn
	/dib32H3pZCCNL9DxUVR3iDy74Q+LiApKWm+4PBu01MsSdPXgQzmhY+DdnYP5S5psu+eMioytQe
	d3CAYp9tng32NtiunY8w9LzWwb15MqPgdL2WY9XruS0TENm57wbkPuZKXSqNK6HtXNpdJcik3xC
	ucSB1G
X-Gm-Gg: Acq92OG4A//vAiQMn/grZIEgvoqPzsIK0ZEu1DuAWbUZ3WPsy3AUEOmngjaWKxwdlEC
	t0iO7FO0srKn9iS4LA2ALB/q6ZO99qnfAAjAUNZ6g1Yb9KgVOE3RmJRV35k1sscUt3O1qn8sVJe
	AqHojG5weokH4p2Da0rvUFE2I0Qv465A6AzC1H181uY3mXyexiVg3BnoxW0ChfYLoVQV9HL3TH/
	dxSuj98vTdqApdCtyfSes1rR6fyjp3AWqiovxt22IL6HEwBRD268LwqyovW+lkFlFZAjtB59Zdl
	6xEl4p4XQ+bt28+PJgCjyYrhjh6tB5pCjc7j178J9M1MHogiBiEVs/orwC+9M6omB/rTo1v1X2E
	zt2F5qUf6hJPwt7+x0i7A/PZtdg==
X-Received: by 2002:a05:6102:571a:b0:636:46ee:2f10 with SMTP id ada2fe7eead31-71e88b14374mr955997137.9.1781262556885;
        Fri, 12 Jun 2026 04:09:16 -0700 (PDT)
X-Received: by 2002:a05:6102:571a:b0:636:46ee:2f10 with SMTP id ada2fe7eead31-71e88b14374mr955974137.9.1781262556225;
        Fri, 12 Jun 2026 04:09:16 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea843d6fsm60403635e9.14.2026.06.12.04.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 04:09:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 14:09:08 +0300
Subject: [PATCH] remoteproc: qcom: q6v5: Make handover IRQ one-shot
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rproc-q6v5-handover-irq-one-shot-v1-1-bb688f4446b3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANPoK2oC/yXNQQrCMBCF4auUWTuQhCaiVxEXNhntuEjamTYIp
 Xdv1OXHg/9toCRMCtduA6HKyiU32FMHcXzkFyGnZnDGBROsQ5mkRJxD9dj2VCoJssxYMqGOZcG
 zvxjrk6F+MNAyk9CTP7+L2/1vXYc3xeXbhX0/AJ45ztmEAAAA
X-Change-ID: 20260612-rproc-q6v5-handover-irq-one-shot-759015d0e4b0
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4898;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wDfw/CHOszIITkuDLVx+ZNe5U6VnWJtQo2HJs2z4j0s=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqK+jV7qxQNpcpjAllpg5rbTBFeP9P6/lBxRkci
 e5LaW9h9gaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaivo1QAKCRAbX0TJAJUV
 Vo1fD/sEgplgbXh7o5EulS8PYvqjR+SU04OQCTsvKR0nKWaHFOInj1VJsm/56cTHBME4W+3H+ah
 Ju3eDQa58o/DHjq9xCRsRqDlsj1d5loPf96pQTDSRfFfcp9p3ipuONFsHrMlZrA3MMr9uEuqCE1
 rsiIG9YgxHJaXD8FpeEL0wl3vNfYVMTrsoOmedQrZYDp/4z6PyP113dq5o+iVHKnMeVOCO8aCcI
 qFgWeblqGyQyofqilJAmLlYONJ8hjzBQZCYBesYC6lOiUp6a762tLwXOcRK1QFipNfxwWyWWCo6
 ZJGSo52mvVHEs57TyC/I4GvnhU8Mse/DK1+mY/Lc65unYpTB387e22z75H0GbPVRu8AWgOiR8m8
 7ZZ/zBHPayO0re3qrEVET4WdESJoIRYxicAron9dU+iayLbcnpDi40VQhEaxON67eBAc5P3xCK9
 nSdBL0ipdEU0dawbAnpbFCfRBTrSoGIoaMoTxASOacUXo9wxnXfAZ/B7KUIjbLjsquaH35ddcua
 +4A/6xpwqK1Z7axNFOiRu57JGVnKHVCMN9WhHHcKNDd4YzQNUfITfF6pKQfFqdkJ3nraEpVQOg/
 kNUcHyeNMhimX8/YWWLSiajpbRR1yWDKA/Fe34iNDpbJ14gEiLJUONgSIiX2mdoGDeMRdXku5TR
 boanDYHkyy7YzPg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: e9WiYQH2DLG8MJQY19Y-BO6nUe9TmgBc
X-Proofpoint-GUID: e9WiYQH2DLG8MJQY19Y-BO6nUe9TmgBc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEwMSBTYWx0ZWRfX4lgxjwjpugE7
 xIWXaDtnBcPmRgZ3ArLlnkwlL5iTfAJ/b3gElGNqS6iwyQTvY1aka2/tdJyT/XjdqDPQJnTCLtE
 RW1rzaEV88JLbLLZgLRi9UADbbGTmoaQFRVwTc5jMCoNCp0/xbGdTNCfJkMGkDMi8l+pynrUBCh
 p53vdpOe5aODw+O07gFgmr0QG9r6xyxd6hMjLt3SsVVh2QiDczbqIS6Ywr6/R0Tu/B5FiKm7psB
 n3o7rFEzpYqIeeiZCH7l4mVru7OxbgCTuY19ejpo95U49PsMHFUu1VsSu8xe5+Y1FUjfLLYY/s/
 JVTImdkFhEDTDul9ptnw+nE1bp/r9csOSJzMb571vqmq7wCBKrB8ZPQ322ss2OMFYjYoOqKRIZ0
 dfwtEucNzcBDa9bgMPqIWhFD13HgD3B86voAjkCy0DkLN8B9mal3E9CkZZpr7Y02ej45sPeB7wR
 VWwB7owiozFAih1oEvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEwMSBTYWx0ZWRfX+BN2tyIbd05T
 gRB8VdzJijk1d6daseJurMwcouAl281Zt+iVmJZK6UJwBVer8GuAO4GNjzAJlaWlCFG3kTfUdps
 fRQie73YjznntEpyrRrBnE6HaJ5A3oQ=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2be8de cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=etdG8aBnbEAUIrYLCckA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120101

The handover interrupt is expected to be consumed once during each prepare
cycle. If the remote processor keeps signalling handover after the first
event, qcom_q6v5 currently logs the duplicate interrupt repeatedly while
leaving the IRQ enabled.

Track the handover IRQ enable state explicitly and route all handover IRQ
enable/disable operations through idempotent helpers. Request the handover
IRQ with IRQF_NO_AUTOEN so it is only enabled through the helper during
prepare. The handover handler disables it after marking handover as issued,
while unprepare disables and synchronizes it before checking whether
handover was issued.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5.c | 54 ++++++++++++++++++++++++++++++++++--------
 drivers/remoteproc/qcom_q6v5.h |  4 ++++
 2 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 58d5b85e58cd..c66cca05c250 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -36,6 +36,40 @@ static int q6v5_load_state_toggle(struct qcom_q6v5 *q6v5, bool enable)
 	return ret;
 }
 
+static void q6v5_handover_irq_enable(struct qcom_q6v5 *q6v5)
+{
+	unsigned long flags;
+	bool enable = false;
+
+	spin_lock_irqsave(&q6v5->handover_lock, flags);
+	if (!q6v5->handover_irq_enabled) {
+		q6v5->handover_irq_enabled = true;
+		enable = true;
+	}
+	spin_unlock_irqrestore(&q6v5->handover_lock, flags);
+
+	if (enable)
+		enable_irq(q6v5->handover_irq);
+}
+
+static void q6v5_handover_irq_disable(struct qcom_q6v5 *q6v5, bool sync)
+{
+	unsigned long flags;
+	bool disable = false;
+
+	spin_lock_irqsave(&q6v5->handover_lock, flags);
+	if (q6v5->handover_irq_enabled) {
+		q6v5->handover_irq_enabled = false;
+		disable = true;
+	}
+	spin_unlock_irqrestore(&q6v5->handover_lock, flags);
+
+	if (disable)
+		disable_irq_nosync(q6v5->handover_irq);
+	if (sync)
+		synchronize_irq(q6v5->handover_irq);
+}
+
 /**
  * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
  * @q6v5:	reference to qcom_q6v5 context to be reinitialized
@@ -64,7 +98,7 @@ int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5)
 	q6v5->running = true;
 	q6v5->handover_issued = false;
 
-	enable_irq(q6v5->handover_irq);
+	q6v5_handover_irq_enable(q6v5);
 
 	return 0;
 }
@@ -78,7 +112,8 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_prepare);
  */
 int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5)
 {
-	disable_irq(q6v5->handover_irq);
+	q6v5_handover_irq_disable(q6v5, true);
+
 	q6v5_load_state_toggle(q6v5, false);
 
 	/* Disable interconnect vote, in case handover never happened */
@@ -164,18 +199,15 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
 {
 	struct qcom_q6v5 *q6v5 = data;
 
-	if (q6v5->handover_issued) {
-		dev_err(q6v5->dev, "Handover signaled, but it already happened\n");
-		return IRQ_HANDLED;
-	}
+	q6v5->handover_issued = true;
+
+	q6v5_handover_irq_disable(q6v5, false);
 
 	if (q6v5->handover)
 		q6v5->handover(q6v5);
 
 	icc_set_bw(q6v5->path, 0, 0);
 
-	q6v5->handover_issued = true;
-
 	return IRQ_HANDLED;
 }
 
@@ -256,6 +288,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 	q6v5->crash_reason = crash_reason;
 	q6v5->handover = handover;
 
+	spin_lock_init(&q6v5->handover_lock);
+
 	init_completion(&q6v5->start_done);
 	init_completion(&q6v5->stop_done);
 
@@ -304,13 +338,13 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 
 	ret = devm_request_threaded_irq(&pdev->dev, q6v5->handover_irq,
 					NULL, q6v5_handover_interrupt,
-					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					IRQF_TRIGGER_RISING | IRQF_ONESHOT |
+					IRQF_NO_AUTOEN,
 					"q6v5 handover", q6v5);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to acquire handover IRQ\n");
 		return ret;
 	}
-	disable_irq(q6v5->handover_irq);
 
 	q6v5->stop_irq = platform_get_irq_byname(pdev, "stop-ack");
 	if (q6v5->stop_irq < 0)
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 5a859c41896e..8991ff090579 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -5,6 +5,7 @@
 
 #include <linux/kernel.h>
 #include <linux/completion.h>
+#include <linux/spinlock.h>
 #include <linux/soc/qcom/qcom_aoss.h>
 
 struct icc_path;
@@ -29,6 +30,9 @@ struct qcom_q6v5 {
 	int handover_irq;
 	int stop_irq;
 
+	/* Protects handover_irq_enabled against stop/handover races. */
+	spinlock_t handover_lock;
+	bool handover_irq_enabled;
 	bool handover_issued;
 
 	struct completion start_done;

---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260612-rproc-q6v5-handover-irq-one-shot-759015d0e4b0

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

