Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8D6286422
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 Aug 2025 16:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754671479; cv=none; b=ocWrB+iVW5S8hcyp6r0/WFuxKcaxnbpePMGc32UKuBA0tfXQGL06C4sgTLkBlwzLWUY6aYQ4CiFbv9t9yN5LNNCQmUQ/BYSXJU14whsW9BKzAvJ3zrwLcqHAdoyS5iomyfhte/G4era8QJjY5zgp1LWMsuMW3YQz9n8GoQM076U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754671479; c=relaxed/simple;
	bh=EqzL6rRNfDoERryCSv/CIEvhiAVHF+Sgc/VdogwlX2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qT2aBmtjxEg7AuaUaC5xZxTalDsS05B9xuL7nvyeBwOhj3kVT1GSBdGJSpNRuVpWkFrzJotMukL4Er8eSIWKdSMHLxYtAtifArS6xIz4TBXzduNwwqf6I2QCaoqrPrqRUTRixm+WBNsaq0kWztwmO7pdLDkswWbmukvIpyBFtAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QbecY7Go; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QbecY7Go"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578Eon5k011709
	for <linux-remoteproc@vger.kernel.org>; Fri, 8 Aug 2025 16:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=huQmaFeVLUaz6BrvOTgjq7zFoIFLwTBr1MX
	tCtGIIfA=; b=QbecY7GocBo81F2WWovpuEGiFoR3MJTiATy3z4eN7gM0iq92c2t
	8hm5m4TBvHIH/DRuvSh7R2lIsG3BGx6RkE2xqbb+GflXOmEaGlnM7OIB0tz6Y4rY
	1wwlyFdUaDgU4NwIIgDh5b/N6rMJoqV3vVX/XpkSSF+PsiBq0bOkbOwlGUMAF70k
	004xSI3QGOLF4/u0nnwwX4+eiqdvSRLZM/1VLUVMZPw7P/DCa9RulJrxYjXGhuu0
	tdD5Vs2G8rLopoxZbYa38BBbewMpfxXu/V52EKXNANcDnsXDXLnSpmZB86quwVZJ
	uBruZwBikLFDgclQUetSznREQFtj13jyHwg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cpvy5e4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 08 Aug 2025 16:44:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74ea7007866so2301041b3a.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Aug 2025 09:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754671476; x=1755276276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=huQmaFeVLUaz6BrvOTgjq7zFoIFLwTBr1MXtCtGIIfA=;
        b=lhuT/x3na5qgr9kSvZEIUAwlq88EgWtFfDq+Ekjyq2Wx1H+vSy4Sz7WAy2MS/fNSvI
         sH1se3DjiQ2ZDhsRqWxN4iWMQfQQ411uIR8XplLTlGMYIKcOW7ZZdUncWmxArAtJExDo
         Yri1lcCx+MSK1iVgN5SmdlCjGOL+DAfyw29UkEOWyc61Xa9qPYOS86ranKGcNV7G8ITu
         6+104KVTf1dupyI+1mbIZIcGnQTvzuMhHGDuk5m2a1AIZMEijyzykFEjkwK8sNkMLFRY
         fW5cmFhc8vpfyEu1dt0ej3ynuXtLU2laCpi0dld/VoBy2CmdqiY+rYPZVVJ4YtJTAm0x
         GCtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9E/qsz8OS0i4qOnjVEhCRTeoDGoDiGoj2s4BLZFjd2Rwq1uanc1aTZyA1Jrd+zxCHWvdpqFRhklemEehYxL11@vger.kernel.org
X-Gm-Message-State: AOJu0Yy04BlJ71gV2rkH33+/C8/AXxlouGF/QcZAdGt2d5pbs8kuUL9i
	+qJt6xlUcKk8QmVUqYBf+rjHZ8bCgEYcDdyIKkEwscjxgQzUHGQFqzZXqT0YZAzd2m9Hn8iqOKo
	ZttbeK95ydkN2WGLxTNv1pTaxsEr+8k2PEVHE+IEUfHUYDJOppVC0Mq+XIWjjjDC7VfyTReby
X-Gm-Gg: ASbGnctAbqL+k5HOhCErMHFqUJifYfoblxR8oRV1vnE8iynqZjugZTPZWQOPPUIj1Qt
	zE1GZoVrXI0KMjLM4TsU44w3tZeJs/gJT2xo7Yh1LuETcpDXwekPibdTjO9xkl8HXRnpU9yaWIR
	vkJDiTwezXfj6Tpn23LeekQ2dYdPC7i39/XohyO8HcfMtPOXf7S1EIaAJZLFZUIKkf7xbdcvyWJ
	n5J+p9/lGJRScoY5hhBgQYa7INWYSoekje9xlAA2FTgpOnqBmwtAnbTQRESwgERRjXZiZmoMS8t
	NETJ7WifzKOrH4G922lgUt8VGGPOWg4HIP5XHKFLSIESAe4W6KprhQSgY9420kSp/4Q=
X-Received: by 2002:a05:6a00:92a3:b0:76b:d93a:6a02 with SMTP id d2e1a72fcca58-76c45f67a5dmr5010277b3a.0.1754671475943;
        Fri, 08 Aug 2025 09:44:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRN9mDpNEYryQ+Th1q0Yl+AOPWnFZ0wbyScqj1Kwa64LHrFPfZCQPxWBECZkWS/S3tA3rHhw==
X-Received: by 2002:a05:6a00:92a3:b0:76b:d93a:6a02 with SMTP id d2e1a72fcca58-76c45f67a5dmr5010254b3a.0.1754671475508;
        Fri, 08 Aug 2025 09:44:35 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfd0e78sm20690165b3a.99.2025.08.08.09.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 09:44:35 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom: Update MAX_NUM_OF_SS to 30
Date: Fri,  8 Aug 2025 22:14:17 +0530
Message-ID: <20250808164417.4105659-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TJpFS0la c=1 sm=1 tr=0 ts=68962975 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=evFLFRRwLpfRx6s5WfcA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: bvCWsaR5voY5HayFqnmC--EWVc_F8DvD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA0NiBTYWx0ZWRfX+wiATIOpxFtz
 aUB9TehERHaWcUtwf1FLarB22QPDbBWgCTck6lnHOMxDJo76jRFeolI1mqnkhoecBNo4LeYWdvc
 gbLmwQZhd+uvzxxcnCrUSYOQnCh7Qm0lLJ8G1f5j1Y31HT1U2B9EixPjAC2fK8lbJMKZubWuv5d
 slXbRaKNERvtkbBxi+eNF4fPQUiiDY13jwp+iL1OX0YOhHrigi3LFitAUx1UYdrr1cBbUEzBHPY
 530006X2POjrdtTuExLUxJONr8Xbs7aCfgbSvkwHX6VbUucFqwVHpYIMPzWSOeW75cuiPBTjit5
 UAlywV6dkGYGL+DHWWuuvurgUGi1FoxkRkeeuVbCWKpGFPIdjdJaWAzj/FEO1bSlp5/jivzZRyS
 SZM9RqDh
X-Proofpoint-ORIG-GUID: bvCWsaR5voY5HayFqnmC--EWVc_F8DvD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508070046

In the latest firmware for Qualcomm SoCs, the value of MAX_NUM_OF_SS has
been increased to 30 to accumulate more subsystems.

Let's update so that we should not get array out of bound error when we
test minidump on these SoCs.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 8c8688f99f0a..dbe3bf852585 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -28,7 +28,7 @@
 #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
 #define to_pdm_subdev(d) container_of(d, struct qcom_rproc_pdm, subdev)
 
-#define MAX_NUM_OF_SS           10
+#define MAX_NUM_OF_SS           30
 #define MAX_REGION_NAME_LENGTH  16
 #define SBL_MINIDUMP_SMEM_ID	602
 #define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
-- 
2.50.1

