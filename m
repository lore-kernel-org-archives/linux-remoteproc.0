Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4071D1EFFA8
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Apr 2025 06:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870377; cv=none; b=WDb46oIqfbTyhurNihUCvbW8YwCKWZDGTpB3Tdlv4b5/362pdI3wlZ9k1xWp/Y3FY0Rmb6tgwH5wD9f0czp4ZD0DI3PfVPpSVrpD8rMXEVk/W3Vqo6sBjbxh47VtYNlqrzSPjN96K17p4yPfGlvKte1I26peRZxBL+ht2Ohvwyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870377; c=relaxed/simple;
	bh=K6JlKN4Lehfeo7/IgjBbBJZ4i/sDc76rVOVUFC0wEk4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QgPzMWx4rEB6sNRGjI1lAOeTE/4OZzvbrSUgHz+c8UiImSxzLPAYkhsEdnYJBdQREl2axPK9wtOilclwvZs/NvzN3Wb2lWmnWOSAVoni7UNO7RwWQun6lg9ddftNyWhzlgV1plcgU14Rw14ekClCR9az9qvQfjVct8s8DuzLlk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJM3GWka; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJM3GWka"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5l6Oa009473
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Apr 2025 06:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cVdY2Xlz5w/
	QgZdOw7KOmCcBvgh9bp3qa2yY8aPT/pI=; b=UJM3GWkaYEARHv0xaoxXXbWUvTD
	wQZ6uuKwzPUtznjna4oqc3tZoTaW6EW4KpfAgTZ2DT9/mAhXwixM5UATVP+pjutd
	REZny30L5JKd/ot3DO1+2y5d+bw7ercoQ/P7k1Wv6d4Jt0ShcQHSseIum6mg9ZXX
	vTy35Q6dIdEj9QfCw50gkpQAcLI/Jksw8daXPKMuwt9Ow9GmozcURjyMDS7oXp5E
	5Z++59xG7DzED+0V+ylCWZDAHNu5MAuhxcwJwKFFQUEe9dEkm1MfQ0VFB9eLD8gQ
	cr7hap9QMdvhyfHUgFGSUQWnLY1E359u6vIn4xEJGKCJKQJ6KPoM0t0Zp/g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvb4a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Apr 2025 06:12:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2265a09dbfcso8466785ad.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Apr 2025 23:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744870374; x=1745475174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVdY2Xlz5w/QgZdOw7KOmCcBvgh9bp3qa2yY8aPT/pI=;
        b=f6Qm8VuksnxZn7bfcOnNwvLyqtbjaGA2PeGSh80QwgMzsXltQjK9i97CwI+I++wupH
         it0WRnWq/Yd0DZMOW73jb/LhIB/PoMmsa0mva9hhBI7YQF3wplHac6UdyKuulMvux4sn
         Kmys3KBUbYbndOw6sxOIf7fGsNvf6z5gO+GaKMzUW5HYH6ZvVY4+nzZUaX2YzglQ23Ps
         79foTV/MoWFCt5+9lddeJRQ2PMmZzp2mWs9k9FvDHZsMWmXolq8xvRAIbdQsii5oitaM
         Fnz8YPKfrF/RK8VOvYLv/LVnqqal75Pmhr7w0luVSxQqJbGOEcsKBWTP/Wg/GTXS53g5
         xGiA==
X-Forwarded-Encrypted: i=1; AJvYcCVHqRB44YNKDzBGyvX3lkZdU38jk7tomE9WdY7L99Q3Me2dyCM4++VRtUrMOUFJbUMTqGg2wLRpKVtfoeOmfTyp@vger.kernel.org
X-Gm-Message-State: AOJu0YwiM5X2Vc1fa0oA9pUL8c3jUhmgpWhgc3wQnMnRffKsW69f71R/
	Nsvcr2EhDxbi+4V6NgZPETKJr7TzjUeeN1Or9UYEf0MapphcLu49ASwAFVwHQHVrjiDBvHqXlao
	p8NIx4t8hMfWvOBlRrtS1XhGP1WozIwszyHhJpnV9npCLyj5Ejf7TCfVtk1LaLwW8Ek5M
X-Gm-Gg: ASbGncubZzPmyRYDUZuVKnEEXHcrhzS9RRcsztzd+IPtFneqC8sgIl4p2rnIJPJYVfE
	p1rEn6LLSxXLGu6Elc6QkNWZml09ExVqbH91liRt8OSqRzuupNfh2QfdDhy9V8gJheiNXtEmVed
	6fZnR7bbHneUHv9UTD8Fd+fU+c9W5bXxTc02xPm48Ficc6EddZhKRvK9dZMxSrAj0nW8T34ht7A
	pStt9qwHGCN4MyFx2vSZl1/lDlTHahChpx0G9WSzENi2ZsVQaZNLGSOTj6/5XiBsEB+G9whVYNu
	kCxnFFL/aBsiGK7zC2AkXYVNaMvaZrJ8VUPj5Yv9tSyWbB9zj+pSsCrDCyHG/olxwv5SEwHS8rr
	3fA13gAKFzeNPk9qJ81HY4GX2O2sGFVXmDNc=
X-Received: by 2002:a17:903:1ca:b0:224:584:6f05 with SMTP id d9443c01a7336-22c359742d1mr71015395ad.41.1744870374435;
        Wed, 16 Apr 2025 23:12:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPhQFbsgVqQATdvECdaf4CnkQYmYXwZ5Oi7KEqji3xtIABf4UA/Dkum/8ctsbZxFsAROasGQ==
X-Received: by 2002:a17:903:1ca:b0:224:584:6f05 with SMTP id d9443c01a7336-22c359742d1mr71015165ad.41.1744870374115;
        Wed, 16 Apr 2025 23:12:54 -0700 (PDT)
Received: from hu-gokulsri-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcee11sm25159725ad.191.2025.04.16.23.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 23:12:53 -0700 (PDT)
From: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com,
        gokul.sriram.p@oss.qualcomm.com
Subject: [PATCH V5 1/6] firmware: qcom_scm: ipq5332: add support to pass metadata size
Date: Thu, 17 Apr 2025 11:42:40 +0530
Message-Id: <20250417061245.497803-2-gokul.sriram.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RyNdZQlYgOLoQj3-cRl0BvJZDnHQ4mYJ
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=68009be7 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=uWiwPwd6ELW8fYEcJRYA:9 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RyNdZQlYgOLoQj3-cRl0BvJZDnHQ4mYJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170046

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

IPQ5332 security software running under trustzone requires metadata size.
With new command support added in TrustZone that includes a size parameter,
pass metadata size as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
---
changes since v3:
        - corrected arrangement of variable assignemnts as per comments
          in qcom_scm.c

 drivers/firmware/qcom/qcom_scm.c | 17 +++++++++++++----
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc4d67e4c4a6..456e4de538b2 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -583,9 +583,6 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	int ret;
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
-		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
-		.args[0] = peripheral,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
@@ -617,7 +614,19 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	if (ret)
 		goto disable_clk;
 
-	desc.args[1] = mdata_phys;
+	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					 QCOM_SCM_PIL_PAS_INIT_IMAGE_V2)) {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE_V2;
+		desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW, QCOM_SCM_VAL);
+		desc.args[0] = peripheral;
+		desc.args[1] = mdata_phys;
+		desc.args[2] = size;
+	} else {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE;
+		desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW);
+		desc.args[0] = peripheral;
+		desc.args[1] = mdata_phys;
+	}
 
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 	qcom_scm_bw_disable();
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index 097369d38b84..0f40e5828a67 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -96,6 +96,7 @@ struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
 
 #define QCOM_SCM_SVC_PIL		0x02
 #define QCOM_SCM_PIL_PAS_INIT_IMAGE	0x01
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
 #define QCOM_SCM_PIL_PAS_MEM_SETUP	0x02
 #define QCOM_SCM_PIL_PAS_AUTH_AND_RESET	0x05
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
-- 
2.34.1

