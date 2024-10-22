Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B5D84047
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Oct 2024 04:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729570868; cv=none; b=k5aHnw6BT8/JOg56K8Db+HSdD1fgmWx/HrW2jAOlAdGAyxac7PSV1m3dJqeqkwA+cNqtVVGam5fkFcVOhxev/YN+yjtfFgKKkddyDjugoM/9dQrn3TWD52O+PijP4yYslCPqscWFfr16E3woyIhf6DfCs/g9KP1YVNMthqwDSAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729570868; c=relaxed/simple;
	bh=ZZx94kuPsJBqKhSDlU3Qol1h7nTVfSUnlGS8qd2Tcgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=r38TsJyRX96huVtawMybzdwKQ5LdepcrJDBLIt85Uf1LpV5uMulU4vLTpni+FLh+QkIeRzy7e4G7GsufZgycRLEI5QJoZcVHcgrdLfLxygAnm1oerEq3elYSaZC2TD+UveWNGE5gdTCvPxJPNXJ9OADHRuG1lFQPtueK/w2k9sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTT3ehnV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTT3ehnV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49M2Xw9P024011
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Oct 2024 04:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HENcSFiPTx5iVYi4wXblKs
	xcwftxsbQ86miIac1Sdxc=; b=BTT3ehnV1z6yapmJZZBY1Nzam93UHephGLtGny
	DoGRjfnhRqo9SWxlSb5l2e7tYRpfBXmzTCrSgJmPntN9N78UrBW9J9kukcI76u+w
	8ffswpuqWJqidUbojE6BQbap1oMcKX3JgpqA1VheieHhG2orN2gJcTeh29zrd+Fu
	SWcOiNwutJ1m5n5Fba0vhBNasSjqF+CjF++0BcSUjiSNT6iurKMYH38KlPRYHY8a
	9XrVxm6+7Spq/dZT50G2Zo+ISZa38oHUvRP8NKNA5nNf5gWDFMx/Dsnq4ckjHCVZ
	0+N8BJ74LvbV4DegHy3GBsdaqZPK10sB8KPDn+vmJK12mEPg==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42e3cgg77j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Oct 2024 04:21:06 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a3c27c72d5so46297095ab.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Oct 2024 21:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729570865; x=1730175665;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HENcSFiPTx5iVYi4wXblKsxcwftxsbQ86miIac1Sdxc=;
        b=VPEkiiYxxDmU5ZymG0O0AmuQkM7pDaX/BfJ74AcKWWAaycLB+RVKKfiot0jhUsEcxW
         tQkFSKQiHusfxi4sv80pFcvtn2cbSXthP4XjrMKYcGJUk6A0JzWkN2wBqp+mdpIq4EOe
         idOxpRf1MBpJjNmI1QyydEwjZ+4V9QW3mZ1NpwCMWWvu++9HDMWummo7fATr7KkwMqPo
         66x1OxpuIayQTf7V4ytOArluXk5f1HJrFucK7FQpQzvxJasPlUu/zW7Aa3LN/lZMFC6m
         W36t6bc4jPDYWQ0aSf+lcU7178s7DhqZ+2xC5ClSFufYUiT8c8wyxeMk6PG+vKZmBetv
         mRiw==
X-Forwarded-Encrypted: i=1; AJvYcCVTlK+cxqz+TnfV6pPoI5KJeANV0zg6/JNs8LBdWEZftsy51Y2NeCx+8FfYc+e3C3KObvjzABdODxp7anLv45CO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2HyfKXN5Nm/3r4k5UkJrhu7UlllK45aQemvfBnk2GZyxbHIDx
	WRhkm4mTSPCaXm8ohQy6kG2ZEz6RDazG8vQFuUdePWsEg2NGXxEL5kV9hjzZrE3bTomxujGop2x
	dn5uJZHFNAOO57GrV5eeTds62U6sKahxE9U9aXd4Lei1/Udk5xVhmaMwU/qtFK+O8CYqaTObpGI
	aD
X-Received: by 2002:a05:6e02:2169:b0:3a3:b527:e809 with SMTP id e9e14a558f8ab-3a3f406326amr131195985ab.14.1729570865033;
        Mon, 21 Oct 2024 21:21:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5uiaNduHPg+WyNp76ip1D4UiD9rzbbavv5abdTKo3logKNRs+dpMem9fvb6tI30AudDIw1w==
X-Received: by 2002:a05:6e02:2169:b0:3a3:b527:e809 with SMTP id e9e14a558f8ab-3a3f406326amr131195825ab.14.1729570864690;
        Mon, 21 Oct 2024 21:21:04 -0700 (PDT)
Received: from ip-172-31-25-79.us-west-2.compute.internal (ec2-35-81-238-112.us-west-2.compute.amazonaws.com. [35.81.238.112])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeaafd36esm4062644a12.6.2024.10.21.21.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 21:21:04 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 22 Oct 2024 04:21:03 +0000
Subject: [PATCH] remoteproc: qcom: pas: Make remoteproc name human friendly
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-rproc-friendly-name-v1-1-350c82b075cb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC4oF2cC/x2MQQqAMAzAviI9W3BDUfyKeBiz04JO6UCUsb9bP
 IaQZEgkTAnGKoPQzYnPqGDqCvzm4krIizLYxramsRblktNj0Cgu+4vRHYRqvOvN0HkyoOUlFPj
 5r9NcygeSUIgEZQAAAA==
X-Change-ID: 20241022-rproc-friendly-name-410ca7185ce1
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729570864; l=1350;
 i=bjorn.andersson@oss.qualcomm.com; s=20241022; h=from:subject:message-id;
 bh=ZZx94kuPsJBqKhSDlU3Qol1h7nTVfSUnlGS8qd2Tcgg=;
 b=AkHzqQQIe6kZ4eRZ0l4KUW7cv10TNSmawOi7RRnmXynFRX22M+BSpmS2uWx8Kb1Ypsz3TUjSg
 F4W2Rk/T1IVDiwS5VnznSrF7j7c63ihq7clGki3AgOAJi70XlVD8Hno
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=SAhIzN2NcG7kdNPq3QMED+Agjgc2IyfGAldevLwbJnU=
X-Proofpoint-GUID: J5nPoxl0_WoBoX8_aTI6z8EqocRCH_Xn
X-Proofpoint-ORIG-GUID: J5nPoxl0_WoBoX8_aTI6z8EqocRCH_Xn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=965
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220027

The remoteproc "name" property is supposed to present the "human
readable" name of the remoteproc, while using the device name is
readable, it's not "friendly".

Instead, use the "sysmon_name" as the identifier for the remoteproc
instance. It matches the typical names used when we speak about each
instance, while still being unique.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ef82835e98a4efd4bc603cff604d531a51fe9f9c..b2108c3036a33f7e9a63380be3a6e319e76503cc 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -716,7 +716,7 @@ static int adsp_probe(struct platform_device *pdev)
 	if (desc->minidump_id)
 		ops = &adsp_minidump_ops;
 
-	rproc = devm_rproc_alloc(&pdev->dev, pdev->name, ops, fw_name, sizeof(*adsp));
+	rproc = devm_rproc_alloc(&pdev->dev, desc->sysmon_name, ops, fw_name, sizeof(*adsp));
 
 	if (!rproc) {
 		dev_err(&pdev->dev, "unable to allocate remoteproc\n");

---
base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
change-id: 20241022-rproc-friendly-name-410ca7185ce1

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

