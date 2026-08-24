Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEF53EC686
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 07:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787555166; cv=none; b=EvqkcXsQah+Psrtj+KoM+5269oSIJYagYIBduvAZXk0a26N6v2oAC0M1rS4f5ckMwFodRX3OuPCgvQGhnaalWU7pxliIxr/cAgz5Zs3HPfXHzMmVDcI8t99R4u+IVuqcOC0jW0FzlC5/Fg5bn7XipaP8tCBO1fB06eI2dFVGR1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787555166; c=relaxed/simple;
	bh=fFbBdZsBn9cYbR38sV1mk2Del8rxzLUumOQEDYuzHUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LQpufnbzQcr1xOWq54f7uE8BvA6A052TXsdjv/cur8EcDOyLSf/X65lSPtYgcQ22OmKvMbJIrOUeegxvubSd09JhEZfQAviw748kGqkF+4p60sPqIQUlF5GXwvK0/N64yT0TTXAIFLBg7D+/F0gqebj05tlx7a63pt56PMsx0Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVb73bNJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MPhF6bZW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVb73bNJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MPhF6bZW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RGhi1008312
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 07:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G8PGqfABGUV1c9BbZPowg1NQDNpEwLnOTxCBQoBl8Uw=; b=SVb73bNJdegVvLfs
	LhG9ra4PJbsTkynGUShSV674zHzovCqAB87jZspJBVe0GKGmLXt8C2fMtP0eujAD
	Qv5iZr8xntMuJjAuy2Mvs4+VYl02dxNbay54Z8Ks1+9h7IqN4iFmeyCUxNgx0GkO
	E2iZIwOD+6n6M0e6kpqL/UooJCyZxWDudW2BLLatCwEyUt4vRvwHOBFewoZso3hV
	cqu9qURLrtBkwK9B9uZOiG6d3wF5BfujOg+Ip/dXiC/Dbc49YjOla9iz66PhqCxD
	RYSMaGfP0iSCMF1YZolFTUSLn7pS1xrdi76TiDarr0zWNLZIPALSfMYh4WygZMH1
	2uR6Rg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74xhdnuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 07:06:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e024d2129so1854391b3a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 00:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787555164; x=1788159964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8PGqfABGUV1c9BbZPowg1NQDNpEwLnOTxCBQoBl8Uw=;
        b=MPhF6bZWhsNkwzTididohdY5wIw6sm+HXtHQaGzr/QokxNTeZJfMA+iHFZgBAhzNdi
         Blo/DPMXbFK5ge1ZEIuT2yTWZweRSaz0d285i9eADZ1vZDgkOe7X1WWRSkr8u9HLM9dL
         L34F8edKZJBGC0rnLLK3R12Gm9PEPZpfuY/jSrCAqGEbEOAZE66iZ/8AMY1gafEKYeeC
         T7EwtK7TOFNw9JuW9Ylj/tNfcYsZAn4seqS6FqBpSCOXDbjst6HfZlXaOFuA4RbY6VTw
         KjWTyID4CcYzV5E28B+EKavxzYTausofFcaq+IcLd4PnrG0qAWJ7zzzIBoe3ayoIs3ip
         QK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787555164; x=1788159964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8PGqfABGUV1c9BbZPowg1NQDNpEwLnOTxCBQoBl8Uw=;
        b=JRS4xXsY/yADyoiLsg4+KdtcTyE84UgCiLkyd5gbgfJ8aaQzne7Yx63srncIMxFR6c
         dVrZRQSYEpMfDMFgHrGJGPUdhah28NTyS9DHoLbMq0JXopQb5okPgtW1FvsUB/3lH2TH
         g32YoNosFCO2GzO6M5ggvwb0dyw6XvYLTVCCY97i1bQZcqEE+qAxxD2oEhSJvW8Drv04
         teuXFXZ66qw7AiWDGXuq+rcLm7/VJolAshOe34lmjO7XMIhUajko1dXNWxD/ogVDA7xK
         GHfC2kSUJrSYw+pZAIFNaW8jRvlNYEYR6WoPzt4U0dCGVrNgKcc0JPPxS1g8wq1JUFsU
         eEjA==
X-Forwarded-Encrypted: i=1; AHgh+RqI/+j66t85FRzyXoH3D+cbNa12aDZTY8ZgqZbWuZeOIEve//LJVCrzqYa+mZBmQsa0HLj3nvFtUJrYxpsCCumW@vger.kernel.org
X-Gm-Message-State: AFuF++kC6CN2fXSVzCQ+505Sb2OF4ecGyNY2Ar55abxtlAlV/ie8gV7w
	UGjzRrwa5Do3KJtJenunqxGsZA64js2pDA7aS3+imf/sbtv02QbDRfcbOhSRJl8UNivwkxVhbPw
	k0GvwoFvpPPPNlWCQ7hat5BD/avCzroj8gICOJPUdG4A3J+WrSWG7u+7TWspGN+NLUEW9vKQf
X-Gm-Gg: AR+sD11Unf2o6gSs8K73A70GhcfOYCUnah2DzCtDMRih0VCKQ0gwTBdeBrDjOpWqDag
	sDtqnMn2mT3qLljDSBrH0M6f+yWJfIWnJ4tCZ+tjmgYEcHzh4AfjvbYz0LXWGXuQqPAdtPxipWX
	1sVIA5nGX2Ytt4jrDQwl/sAwB+C0YzI6JaE0GXouEkcYhJOcOded/aLT/N02Qks1FRgCiRQDyhT
	buQ0UaKT8/8Ugdt4ItXsIPU4nAr0Q2AYOSJWK3oYFBqjgQR1I+NiuNVR8/sJCWth2H4JHIHHows
	FkQ5CrxZDmR9iQ/cDeNPmiEL0G6T2EjOT5lfGeaPynZNFiyVgY9lYndjw4P01jAwgzoUjWrLMj2
	rmdY85Hg9+jTEpj69/7sCi/Krkjz4ddmQH1scgNBzm83qSXWGND/73Ow=
X-Received: by 2002:a05:6a00:348b:b0:848:4424:2b8e with SMTP id d2e1a72fcca58-851f9a8fb96mr41712165b3a.3.1787555163560;
        Mon, 24 Aug 2026 00:06:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:348b:b0:848:4424:2b8e with SMTP id d2e1a72fcca58-851f9a8fb96mr41712115b3a.3.1787555163244;
        Mon, 24 Aug 2026 00:06:03 -0700 (PDT)
Received: from hu-chunkaid-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f149ef3sm1642178b3a.41.2026.08.24.00.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:06:02 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 00:05:54 -0700
Subject: [PATCH v2 2/2] rpmsg: glink: Request the RX interrupt already
 enabled
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-rpmsg-glink-split-protocol-start-v2-2-362d7c233f66@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787555157; l=3818;
 i=chunkai.deng@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=fFbBdZsBn9cYbR38sV1mk2Del8rxzLUumOQEDYuzHUQ=;
 b=5z5pW4rjQaHMBrdo6p5ssrK1OewbqZ1Mrgw+rWaYrun3losyapT8VYc1DKhFckVRHJKONFJtf
 CCM7Uo3pIFUDjxpEt+LMjyagPqVD0Ukn+/2TkrDxY9Pf7pLjq9M3OeG
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=wWxCpsJRKQeVRzpZ8GLRnUX6ozLMowqE3hiz/j+j9O8=
X-Proofpoint-ORIG-GUID: i4FuZE6uCPy5y7OWx57sZ-eAbnwVnC_S
X-Authority-Analysis: v=2.4 cv=GdQnWwXL c=1 sm=1 tr=0 ts=6a8bed5c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ubEyju5v012Ajf4tItQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2MCBTYWx0ZWRfX7YHx+JGwL0wc
 u6mGls5v6CG4E+V/0xkijLO8f7VQVdyA8XQOFt1lH1TNLDZZ8bcgXDQ4VQb1XPI2eKaBWor7+iv
 4zQJZI6ivezUm5jFDb/Rib4/pgAezAVM4RA2JFX2ro5cQDHnmxsxa19dsPIMvwq7HbWhtqVFVyA
 yLgPWsfhLhtIWgz975L1WanLp65/II8aP91FgOisxoMiD+PttlhyActE3h9j4uqSxknrLmkJB6z
 NV2XJ/nIvUU+aTiuXUv2re/UD9mZ4k/ZOwHI+JjZ2GV8R7ypp9JwYa94c2XbbMs9G5ZWvVwVaEn
 xij/tKFlxZt0qNijZoO4aASI1c1n6Rvmzkt2sNOTF42t8qM3uo5f5+8VTjdKury4hHxKqASQsg0
 PCqBwwTw5ERw/2n2lCvXD80sRM8DJVN0+k+HFjwpBWXCu9YriwEkEcREIluFZFlbVuMOYYTZM9i
 mZthCqBtSnOe20dXnlA==
X-Proofpoint-GUID: i4FuZE6uCPy5y7OWx57sZ-eAbnwVnC_S
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2MCBTYWx0ZWRfX925S1pMmS22G
 8Th+d3dkiSLpxeHhOY9yWwiMUaTPu9T6tkMzmcN+6ihf1jKxIUxlphjpI3wY1fj7UUfULDij02g
 R5YTciCyTfONlYl3Wh7HBZkp4M4bka0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240060

The receive interrupt is requested masked early in probe and enabled
further down, once the glink instance has been stored in the transport.
Now that the version command is no longer sent from
qcom_glink_native_probe(), nothing needs to happen between those two
points.

Request the interrupt where it used to be enabled, and drop
IRQF_NO_AUTOEN along with the enable_irq() call. The RPM error path
becomes a set of labels, the way SMEM already unwinds.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/rpmsg/qcom_glink_rpm.c  | 34 ++++++++++++++++++----------------
 drivers/rpmsg/qcom_glink_smem.c | 19 +++++++++----------
 2 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_rpm.c b/drivers/rpmsg/qcom_glink_rpm.c
index 34f18c3e58c8..a85d78f8283e 100644
--- a/drivers/rpmsg/qcom_glink_rpm.c
+++ b/drivers/rpmsg/qcom_glink_rpm.c
@@ -316,15 +316,6 @@ static int glink_rpm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	rpm->irq = of_irq_get(dev->of_node, 0);
-	ret = devm_request_irq(dev, rpm->irq, qcom_glink_rpm_intr,
-			       IRQF_NO_SUSPEND | IRQF_NO_AUTOEN,
-			       "glink-rpm", rpm);
-	if (ret) {
-		dev_err(dev, "failed to request IRQ\n");
-		return ret;
-	}
-
 	rpm->mbox_client.dev = dev;
 	rpm->mbox_client.knows_txdone = true;
 	rpm->mbox_chan = mbox_request_channel(&rpm->mbox_client, 0);
@@ -356,17 +347,28 @@ static int glink_rpm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rpm);
 
-	enable_irq(rpm->irq);
-
-	ret = qcom_glink_native_start(glink);
+	rpm->irq = of_irq_get(dev->of_node, 0);
+	ret = devm_request_irq(dev, rpm->irq, qcom_glink_rpm_intr,
+			       IRQF_NO_SUSPEND, "glink-rpm", rpm);
 	if (ret) {
-		disable_irq(rpm->irq);
-		qcom_glink_native_remove(glink);
-		mbox_free_channel(rpm->mbox_chan);
-		return ret;
+		dev_err(dev, "failed to request IRQ\n");
+		goto err_glink_remove;
 	}
 
+	ret = qcom_glink_native_start(glink);
+	if (ret)
+		goto err_disable_irq;
+
 	return 0;
+
+err_disable_irq:
+	disable_irq(rpm->irq);
+
+err_glink_remove:
+	qcom_glink_native_remove(glink);
+	mbox_free_channel(rpm->mbox_chan);
+
+	return ret;
 }
 
 static void glink_rpm_remove(struct platform_device *pdev)
diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 28f6cfda6352..2d6fa2d3a99b 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -304,15 +304,6 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 		goto err_put_dev;
 	}
 
-	smem->irq = of_irq_get(smem->dev.of_node, 0);
-	ret = devm_request_irq(&smem->dev, smem->irq, qcom_glink_smem_intr,
-			       IRQF_NO_SUSPEND | IRQF_NO_AUTOEN,
-			       "glink-smem", smem);
-	if (ret) {
-		dev_err(&smem->dev, "failed to request IRQ\n");
-		goto err_put_dev;
-	}
-
 	smem->mbox_client.dev = &smem->dev;
 	smem->mbox_client.knows_txdone = true;
 	smem->mbox_chan = mbox_request_channel(&smem->mbox_client, 0);
@@ -346,7 +337,13 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 
 	smem->glink = glink;
 
-	enable_irq(smem->irq);
+	smem->irq = of_irq_get(smem->dev.of_node, 0);
+	ret = devm_request_irq(&smem->dev, smem->irq, qcom_glink_smem_intr,
+			       IRQF_NO_SUSPEND, "glink-smem", smem);
+	if (ret) {
+		dev_err(&smem->dev, "failed to request IRQ\n");
+		goto err_glink_remove;
+	}
 
 	ret = qcom_glink_native_start(glink);
 	if (ret)
@@ -356,6 +353,8 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 
 err_disable_irq:
 	disable_irq(smem->irq);
+
+err_glink_remove:
 	qcom_glink_native_remove(glink);
 
 err_free_mbox:

-- 
2.43.0

