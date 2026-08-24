Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AF03EC6AA
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 07:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787555166; cv=none; b=T1RvWdlKvZb1qWDgpPeoof+XKsLcv2W4KavpahGnz8zWoNEABqHIcJwhlwShWsE8u16fnAPi3U2P2pgamS2AAGRf+shspb3mGT4GbIBLyPAIW+CeIKibVtCG3iUYMPvRAGePrRg7T34njadnFSqtybFRQpWjP1xtMIE/moIOiPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787555166; c=relaxed/simple;
	bh=7GMn7+pY4NrOqBGNfEhN/wEFhTlvXdgKNBf0GUDbwNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FQ2vwwbuZqTi9+pq7de5jCMiZYw7ePXpyreZZYe6oLl7VI5yXAOkAL6ZA7SWN9CypVzNHrPQ/v+aADUSGzuZjSAkAa2XMCHOorvnUZCespsIw+hjUftRFbfoqMrEsrHrwMImU7hJBJR1+MdK5QVPFHCKAsU2UaeBf2rcc8BtNmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AI5PdXYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LkFcXQAJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AI5PdXYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LkFcXQAJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R9ZV1937623
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 07:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tAcnAbP32S5gpYPX5Og5xiDNjJ/HxZkg1tijhne6rng=; b=AI5PdXYXjFQBmbMn
	+St0RY6BMbHSllvHlm+jhhTXTySQsNKlDltcXL0lR+wPfOw+6BhA8BhIIYzGNNbR
	gkQdHxHpjasuBbVnbbMiDh918rOdEZGUKE1gyIYKNB/X8Zr4IH1DylMTp23FShQo
	GDusAIW0kKXn3PsMnROxPhprmpdG3GtKu5mOQuREkffUZmMyL2KP20tt4X0MAvXD
	LrFBmQLXzwMQxbZoiC0RaVg1AONhNxU4cKyYVXQMI1tMT5QKdSmCnydhzGylSQnF
	QWqFWSU+P1YHWMTxH3dONpzfuhFrFlKX/nUA7ljH3QM5AYAXzJINdPKD4NsXdv7V
	LHjpNQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g741qwv60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 07:06:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484b9fb055so2288827b3a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 00:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787555162; x=1788159962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAcnAbP32S5gpYPX5Og5xiDNjJ/HxZkg1tijhne6rng=;
        b=LkFcXQAJIsY4xZDLWFIV/MfAbF29gAB5U0dYhI/8WKMGHijJFnFNfDEt1lccrdWJW7
         65yeX+qPZNE0pA5rLo4019pfvD3yxxfGGaXVNkZZIcnREZl4alYmtKbCdlTbFrZZlU5M
         NqK1yol4iVq5kZt15eyXr/ybJZk8FPLWOPnpLmjnOb/flAWJr/F+LbUxICdmF7FuDBx1
         eYImbdAx4x92H/ivmtHH9IWLzdvv0hDDaU69pdYy4tGvGjgD3kD9ut2pJG9yehv+XH9o
         FhtdepSTStjK8LlBCeW83o8I2g0S+eova5BzjiPcj9UEzHtLrERVdbK1fn0jHNId8/Qa
         rXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787555162; x=1788159962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tAcnAbP32S5gpYPX5Og5xiDNjJ/HxZkg1tijhne6rng=;
        b=RmfQkTIMJQkE4TiPAyYz8x1PTanNAj1zJQc0VSu40ALSBfNbu6GBz2g8RCR/pADgfx
         GNXvBJNjSex25kQbZLZUMVoXWKUazs7SgyEowGw8aHe3mMU44cOCCf3ifGtdep+t2BUG
         oCgRsxljZ/vlZ07upLDonSExwgDOkZaR4EL/Tl+foOlrKkUAOLPN865nnrpvTKclO+20
         yrfC+zn19I7znUD9OYZcV74vfmpWoNBPp8dG1M6297gV65jc7U/R+Q3iQp4h/VIHU/zX
         xxBSfiBmHphNwjSHYosmTjJ+0SjgMnoEN2isoOYUQNYrWXGdouObUAbBh7MgyhZ0vjuI
         Ou8Q==
X-Forwarded-Encrypted: i=1; AHgh+RpuF/5LsYpyOUJcvpthZvAyPkhbR6uLYM+N+hL6W3MPm5fAOOWtgnuStyDfe6SoQmn3lgEx+K+Q43sZbV+UZV7H@vger.kernel.org
X-Gm-Message-State: AFuF++mgWjyQIEr/4ZWNRMUxLa1erz0cY8O05+YGLkiKaKOrV+7VkkzF
	TI+Fg2d86DGwEzLrt5zRH3pXSaErQfSJYGQobbAZyZqDnsNa51dxEHb5QoBT2biIOhPpv8Gs1Hr
	hMfYMgbKfQdKwPbgGClcei10VxMW5i4lRy1t1vZmGERS87DubPjVcznpVXOVXfPXnAErrGE4e
X-Gm-Gg: AR+sD11snEKBLxamDvk2jkw4L3bsWsijzj/H2IpgAHptQWtBSwzLxcKwbfpH8FndmT2
	TWyZiVEGodwgD1+zFpIbEOXkFC6m9+WcjHVE5tYsJBo3y+p6I8Ag4kS3iap+Z9i4Gvk2kdUA2zS
	A7oXqaIC2K+nWvXiQdlD3v9A2RK/M0Q2oFbxyqnNzjzJgtRvItaQuXYgdjofjT5xx8yat/TNMH4
	/yG/9JSfdfXapfdJWAf0jpH+DipTOzTwdUzUCf1GlkHG9MUEitWIih22EFvoAP4+hyfAKJ6GDN4
	mbmuQpE+cbeWbMJCr+hxiGzGLgiJtO4S8Oyr1xW/PZB41itLHYlPcFE9uS2l4O0V5xv5k4Rcuik
	ShBBpQm9gFzMZ/6JrYkBcBQkWdWCQRv4p5hF/9Pk+1xQe1s8rreOIyj4=
X-Received: by 2002:a05:6a00:ba8d:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-851fa018939mr42280435b3a.13.1787555162096;
        Mon, 24 Aug 2026 00:06:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:ba8d:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-851fa018939mr42280353b3a.13.1787555161644;
        Mon, 24 Aug 2026 00:06:01 -0700 (PDT)
Received: from hu-chunkaid-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f149ef3sm1642178b3a.41.2026.08.24.00.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:06:00 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 00:05:53 -0700
Subject: [PATCH v2 1/2] rpmsg: glink: Split protocol start out of
 native_probe
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-rpmsg-glink-split-protocol-start-v2-1-362d7c233f66@oss.qualcomm.com>
References: <20260824-rpmsg-glink-split-protocol-start-v2-0-362d7c233f66@oss.qualcomm.com>
In-Reply-To: <20260824-rpmsg-glink-split-protocol-start-v2-0-362d7c233f66@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com, tao.zhang1@oss.qualcomm.com,
        peter.chen@oss.qualcomm.com,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787555157; l=4229;
 i=chunkai.deng@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=7GMn7+pY4NrOqBGNfEhN/wEFhTlvXdgKNBf0GUDbwNM=;
 b=TdL9EzepQjh26r3EHeZ4Ev45MZucLOUINRa9RkYJJo/ADsyjONx8PJKx5zc/9EHN0Y5WZQaz8
 /pZ/mLtlGN0BrsvqTSuPOrpaYdVtiIMgi/jcGoPku6LCL1ZIb3trsly
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=wWxCpsJRKQeVRzpZ8GLRnUX6ozLMowqE3hiz/j+j9O8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2MCBTYWx0ZWRfX7+aIMjIeFEaO
 2Y3EQDs+rW+DAxwilUSY8HoHCkMRbTgXIQuALduzMaqIbfFLo2b+5k0frEqAhT9hQ2YBgE+jWp5
 ycVvI6YK7zR04bBEJta0ulnhRVL+kU7w3KwO6fHty8PzZJ2JMMIg0IKtjo7P4RPh9KtNyIxJLrJ
 9H4/A3j5BuGtdAAINSKYCjKq42awBNZSvm3Dk8wlHxZSFPYeQdKuq48rLX/3DnqqEgmrxAhnEXP
 n6QD1EWW12uufqH283S0xtLA06Ducf7HBBXRaT+ypWVhW1MTXAth9MM1u4L0/ynPo4+rzVzHDzN
 t8ciRLXjaP5kz9FAJGaxg6elsUAifl/YqC7xy/9hm/IePu6TKHxpLX+i+OwqFz+fkaqWr4+WmB6
 nNu6rUGrh2JZy6gv0DUOwmGQFYgZw2fiSjLk8FqrstIujYg9Ddfnqama/5RctDj14XFBk48n/VN
 VmW86aHNBFnFhdEv7ZA==
X-Authority-Analysis: v=2.4 cv=GvNyPE1C c=1 sm=1 tr=0 ts=6a8bed5b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=DdSiwBDnyMY8Rz7v4E0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: TM7egXP4uZypZzDIWU_4ZZ3h4oh_OSOZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2MCBTYWx0ZWRfXw7/kzMOFiuh/
 H7nBKtNwok9VcXV7lE2Jl+Olyy+PI4xmeBmZnVZRVPCW9c+G+XngOepEbWCdw7G6DC8e7pHHqKn
 ZVLzx/50pOqdn5Df3ncHBD8bis3maRc=
X-Proofpoint-GUID: TM7egXP4uZypZzDIWU_4ZZ3h4oh_OSOZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240060

The SMEM and RPM transports request their receive interrupt with
IRQF_NO_AUTOEN and enable it only once qcom_glink_native_probe() has
returned. But native_probe() sends the version command, so on a fast
remote the version ACK can land while the interrupt is still masked. The
ACK is dropped and the handshake never completes.

Move the version command and the chrdev registration into a new
qcom_glink_native_start(), leaving native_probe() to set up the glink
instance. Both transports enable their interrupt before calling
native_start().

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/rpmsg/qcom_glink_native.c | 32 ++++++++++++++++++++++++++++----
 drivers/rpmsg/qcom_glink_native.h |  1 +
 drivers/rpmsg/qcom_glink_rpm.c    |  8 ++++++++
 drivers/rpmsg/qcom_glink_smem.c   |  8 ++++++++
 4 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index d9d4468e4cbd..2a284b22a037 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1928,17 +1928,41 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 	if (ret)
 		dev_err(dev, "failed to add groups\n");
 
+	return glink;
+}
+EXPORT_SYMBOL_GPL(qcom_glink_native_probe);
+
+/**
+ * qcom_glink_native_start() - start the GLINK protocol handshake
+ * @glink:	glink handle returned by qcom_glink_native_probe()
+ *
+ * Send the initial version command and register the chrdev. This is split
+ * out from qcom_glink_native_probe() so that a transport can enable its
+ * receive interrupt before the version handshake is initiated, ensuring the
+ * version ACK from the remote is not missed.
+ *
+ * Failure to register the chrdev is not fatal and only logged, matching the
+ * previous behaviour of qcom_glink_native_probe().
+ *
+ * Return: 0 on success, negative errno if sending the version command failed.
+ */
+int qcom_glink_native_start(struct qcom_glink *glink)
+{
+	int ret;
+
 	ret = qcom_glink_send_version(glink);
-	if (ret)
-		return ERR_PTR(ret);
+	if (ret) {
+		dev_err(glink->dev, "failed to send version: %d\n", ret);
+		return ret;
+	}
 
 	ret = qcom_glink_create_chrdev(glink);
 	if (ret)
 		dev_err(glink->dev, "failed to register chrdev\n");
 
-	return glink;
+	return 0;
 }
-EXPORT_SYMBOL_GPL(qcom_glink_native_probe);
+EXPORT_SYMBOL_GPL(qcom_glink_native_start);
 
 static int qcom_glink_remove_device(struct device *dev, void *data)
 {
diff --git a/drivers/rpmsg/qcom_glink_native.h b/drivers/rpmsg/qcom_glink_native.h
index 8dbec24de23e..783209980c3a 100644
--- a/drivers/rpmsg/qcom_glink_native.h
+++ b/drivers/rpmsg/qcom_glink_native.h
@@ -35,6 +35,7 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 					   struct qcom_glink_pipe *rx,
 					   struct qcom_glink_pipe *tx,
 					   bool intentless);
+int qcom_glink_native_start(struct qcom_glink *glink);
 void qcom_glink_native_remove(struct qcom_glink *glink);
 void qcom_glink_native_rx(struct qcom_glink *glink);
 
diff --git a/drivers/rpmsg/qcom_glink_rpm.c b/drivers/rpmsg/qcom_glink_rpm.c
index e3ba2c63a5fc..34f18c3e58c8 100644
--- a/drivers/rpmsg/qcom_glink_rpm.c
+++ b/drivers/rpmsg/qcom_glink_rpm.c
@@ -358,6 +358,14 @@ static int glink_rpm_probe(struct platform_device *pdev)
 
 	enable_irq(rpm->irq);
 
+	ret = qcom_glink_native_start(glink);
+	if (ret) {
+		disable_irq(rpm->irq);
+		qcom_glink_native_remove(glink);
+		mbox_free_channel(rpm->mbox_chan);
+		return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 62adc4db2317..28f6cfda6352 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -348,8 +348,16 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 
 	enable_irq(smem->irq);
 
+	ret = qcom_glink_native_start(glink);
+	if (ret)
+		goto err_disable_irq;
+
 	return smem;
 
+err_disable_irq:
+	disable_irq(smem->irq);
+	qcom_glink_native_remove(glink);
+
 err_free_mbox:
 	mbox_free_channel(smem->mbox_chan);
 

-- 
2.43.0

