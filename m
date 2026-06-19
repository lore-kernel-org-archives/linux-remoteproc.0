Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C93015A85A
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Jun 2026 05:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781845303; cv=none; b=pkayVyXtMxYOf+Lb/G+NYZhU2Qu8ula+QzYXrxbtevwx6PBwjbO7lXSsRKrHiRkch/nOyuTEAbipB3BaAPBCgr1W7Xa/98B6+JVzKWY9wd072nUNadUopZ+VmSbH+hNMaA1T71x1EEOxXRwfnkzg5/wiqB/w0CnTxg+BrbU4aS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781845303; c=relaxed/simple;
	bh=gRJJKHkavlo6wAUcgkd7tDL0JMH4jNW4P94d0RtG4ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MAQ38a1HAGUwLXckNceFQt2bjltN+KSfUuB7efjA5LupcNEO4oDJqn96aPl/X4zMoUyVClM3CSs7CxRjp+UToxNG1a+vGW4L8SyVMb1WMQxokuHq/qKPGaLPEguI/j68N2mC7AQOi0tVLKaM4kBfRbKPNc8dZWAE1ECgYTDPpbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IqQrBs+q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O6sHwtpT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IqQrBs+q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O6sHwtpT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J2v2rM3465462
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Jun 2026 05:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=37n4L8BkTX+xlkdInVGxTW
	EzyLbrTOzGfYWCRWWK0m4=; b=IqQrBs+qWQctcaPtzAg3r+3HwZ4t00OebpeL/s
	K3Vdn0H+UsJF79xdU0Jq7maj3qXdIIGfHgzEwk6lBLLSJWKt5GFH8GCYlpKfyIzp
	rBKMj1dFK4KpVs22opgzTT1HGBW6vXXLH4dGBvTRZf76GDVurWRhXg9W5QqAjQ2m
	MkT5czB2g7D9rvsI9RxC2/c7oWy6YEVpyiymTPJnZrZJbuHJqeb8lVtIZHAngqq5
	sNlIhWonNbo4jcH467zHwSlTJAsqOGpWcBk3gIA9XS/Hu9NoGQqa4J+R7mwpDukl
	CCaqpy7v78M151+G7kq+LfvavmXtdaMCxqSxkHnnO7C0hTqg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6s9xdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Jun 2026 05:01:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bc5f826f2so3319752eec.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2026 22:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781845300; x=1782450100; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=37n4L8BkTX+xlkdInVGxTWEzyLbrTOzGfYWCRWWK0m4=;
        b=O6sHwtpTrIe+PliRElafzMZL1dAB9RlwxhmGULibgA9yyD2iqBumFh+n9ICjClQn89
         Muu0qzNlSjHW+Mz1lJp0ryCAD/MjaOfoAFOEM+mZGA+I7f30Np3m7P86zaDAjVDxZEs3
         q01yKodawKaOiQIh8sRZX7KfOrimBkW9gFh1KD6RJha8zssjkxlGjzCdECWa/bUywmv4
         0PdyJJ3fq6F0hkSu6a+D/e1laaR22ccKLspcEZbK/v7v4ylQWA7gjOj+4FoaWYgoVKbF
         iCc4Wqzdal4MPqEN0B7drORjZXu/kWLgBl0lEtw82/S+h3iOpxQZ73nuNtJDFilkYcis
         HZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781845300; x=1782450100;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37n4L8BkTX+xlkdInVGxTWEzyLbrTOzGfYWCRWWK0m4=;
        b=qUmA5zTZ616oGYnWq8V4L9aeX8PjvwW7rs5T7+TB1a6dLPP1OUPCutc6+h61/qaGCn
         8fUVOXNY3tn755UCQxdLLoekk0hub0eeRjGNLuyF41ds+tGRU+dQFEYa58M1w+IuLjVj
         2ziQKt//VtVFsW5202CWNBeGyXnne/HRq+GUlQkLYFwxKvn27cxQQqutAH63+bEw7m39
         0J1mztIpdfR2rXzERBEGt245SurmoReUFdCiQVTSNU0n5VIay+8SgFZFgcy6E7UqeqmF
         pZwRf3jc3yaYCc4CycS79N7whRHFoIXYUn6HvclDrsKpDU0mKCXG2zbHsPgSFSQ4csdn
         JVSw==
X-Forwarded-Encrypted: i=1; AFNElJ+OceTho5MORY0Sp40tjw9ParIF62U81u3qxXtsGIHboR6PdNfe0thxfhkZ/j3VyR529/mj5ewOd7eWmIF91XHj@vger.kernel.org
X-Gm-Message-State: AOJu0YwAjGAAgnA93z1Bsuto6Dq9U/50RsuGsn6RfSEElslITmnY3w6m
	epUb/VOgE4CI/MGTag2gzl5uKSP+qXFts9gIxbO90YvTyIeqinFEgBGVxUKdj4gjj8zhKXILIyw
	K1WUGvSBLItd0ZhapP1Beijwo3WFJV1JWr7QvPeNdq7yMBA+erz/ips1C7JcuGHh9iIRd6gF3
X-Gm-Gg: AfdE7ckHXCsIuvlF/lVjuSCtDjG7Ht93IFpdB5SMBsC9dVQf7nD5mT/kjal0sEh/KFB
	LmwaWr2P/3aar2iLDdx79JApFX6d/i01Ce2q+vYdHssg2aC1BkLky6DO7r+4vTawX4saxPYLHgt
	L1RG4Tt33PvoLszhvU/PFqBx5emlkrIsrm+0nNdU3MO5AlhM7o9jW1yF29ZqjzSOBxps3JIIoBM
	dJ0mXwLAxCWeu14bVe6WbTOX2A19i6loxLuvqqjh2PR1KlRFs4iU6s3JAJ/WhhTdGYiabttPY57
	EW4S6OHxpEAh6WpvlsBdwTqTq7CfJhMPj2IdyEYVzvEyl0m0A04uqOiK/OmjVgQa0KA0UNBoNXd
	ibcu2A0nWZy43ZciODylKX5ZFR8CyLxFDOhsFA8YEKpgeHY8Rp1pzvJQsfN0raA6z5w==
X-Received: by 2002:a05:7300:5b95:b0:2ed:e12:376b with SMTP id 5a478bee46e88-30c0d29fafbmr510996eec.33.1781845300001;
        Thu, 18 Jun 2026 22:01:40 -0700 (PDT)
X-Received: by 2002:a05:7300:5b95:b0:2ed:e12:376b with SMTP id 5a478bee46e88-30c0d29fafbmr510980eec.33.1781845299474;
        Thu, 18 Jun 2026 22:01:39 -0700 (PDT)
Received: from hu-chunkaid-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c066cc0ecsm1451978eec.1.2026.06.18.22.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 22:01:39 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:01:37 -0700
Subject: [PATCH] rpmsg: glink: Split protocol start out of native_probe
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-rpmsg-glink-split-protocol-start-v1-1-c4f93986cdb4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADDNNGoC/4WOyw6CMBREf8V07SUt8hBX/odh0RdQBVp7C9EQ/
 t2Cce1mkpNM5sxCUHujkVwOC/F6NmjsGIEdD0R2fGw1GBWZpDQtaEEz8G7AFtrejA9A15sAztt
 gpe0BA/cBTqopMyVULquMxBnndWNeu+JWfxkncdcybLtbozMYrH/vH2a29X6683/dzIABLfOq0
 VoIXomrRUyeE++lHYYkBqnXdf0AJVp5UukAAAA=
X-Change-ID: 20260604-rpmsg-glink-split-protocol-start-3df74dbd5c94
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781845298; l=4370;
 i=chunkai.deng@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=gRJJKHkavlo6wAUcgkd7tDL0JMH4jNW4P94d0RtG4ng=;
 b=MR1pC4sZTubdUcA3O8Xes3UJJhXqhh1+izdbIKQJXrYr4/25VtPuKjLgS38mcT/26Yhf7nhDN
 ZaMxxzeyavrBf3MNQReuetWkoHVokTkaGvb8K0WNiaFlGPnZ7TZSz0Y
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=wWxCpsJRKQeVRzpZ8GLRnUX6ozLMowqE3hiz/j+j9O8=
X-Proofpoint-GUID: gh3R0FlZYGPjjHmreBsWnYIsLUZSulXu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA0MiBTYWx0ZWRfX/xucTRaf8/F3
 KDbkbVWxEOh3fOBZTFq7oix3Vzb+yFEPEHsfjSwrak2jsRYNagHM1G55ht26aTRsC84Mpce4d3d
 XodfMgFAt4A+NjXnml0p6tjH8xhw/Cs0QK2SyrvOi4crU+6vK6/jQrqSRkjsIt68zLWF5sk3cao
 6qyL2bcAWVgffHJ3TaiVjvFUSSkBS9ToLSD7Fcy+5yAZDHVSeWJixRzvMVEOo9hBMvLDUg4hqWg
 LeacfdFoQRcWpjqvsGPra2JCQy74Xf03kPsr/q6zmtbAXEZ92ZlZC1A69bh8Q9I7Il23A5giaWW
 q30xHa83JGwQQyvf7FwDmrrOL6MZ5ZAnoTm2Xu9Mha93fPedGjrxv0grNQ5L6w+LPwWmH30aTjv
 9wL3Huq5hxMR3yqpaFgO3pyrr0KDCF4HnYMA0xVYJwzudraNpx0fKhSKZCT6S/NqVoE40DnDlrP
 XmiIiG/SQsnVd62NQoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA0MiBTYWx0ZWRfX/lXRZXVxEx4R
 4efj7Yz6B4Zsu6UqQ/gwEyVmBzLy751zU3xxzzc1zJBY46knXWarQrzn2dBibc/pqOihO+s53jc
 EAH49ADhl4iwsMaEJ6S6RK56rJVuI+0=
X-Proofpoint-ORIG-GUID: gh3R0FlZYGPjjHmreBsWnYIsLUZSulXu
X-Authority-Analysis: v=2.4 cv=KbzidwYD c=1 sm=1 tr=0 ts=6a34cd35 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=oe6ozcHpWozmWDpEdRcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190042

The SMEM and RPM transports request their receive interrupt with
IRQF_NO_AUTOEN and enable it only after qcom_glink_native_probe()
returns. Since native_probe() sends the initial version command, the
remote may ACK before the local IRQ is enabled, stalling the version
handshake on a fast remote.

Split the protocol start (qcom_glink_send_version() and
qcom_glink_create_chrdev()) into a new qcom_glink_native_start().
Transports now enable their IRQ first, then call native_start(), so the
version ACK is guaranteed to be serviced.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
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
 

---
base-commit: a225caacc36546a09586e3ece36c0313146e7da9
change-id: 20260604-rpmsg-glink-split-protocol-start-3df74dbd5c94

Best regards,
--  
Chunkai Deng <chunkai.deng@oss.qualcomm.com>

