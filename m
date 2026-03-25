Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD70434D929
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 19:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466007; cv=none; b=cGb5NYnJ72BkQMOtUIxlms85+BH4otnvlt3ogKfjNOTmrKY4vlclklnXwlr9tXmdnUTkW9aeE4QME1QGJ0a7zg/2w3afK+Uj+deSN37e1rgn0Wcwkp3cwWxRfFyYlo0+Iv19MZcNB0rH54J35Y/9bm3Di2tMC4ylJPabpdXP1d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466007; c=relaxed/simple;
	bh=TQpf7rGLYB28JZgXmqsXqpuMJvlr923sKHW6YRlAH9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pd+HHKlaLLRqQQ4xCs7wZ0CXyFEeGjOqlAClmdk1gxXOAZ6WdSQuVwNDhggPQAx/O0B8TE+FabtOsTOzS/PfqsqBwq9mKQW+gMzt3z3Aqy1+B3c//JnYPOHxwv521kuUpYJcqFHV2c4vikQgXldzfY1zh3bWqU8VQ2O3yE0lpnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XVleKZYf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MakCZ1X2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVleKZYf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MakCZ1X2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH2qS1257937
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 19:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3m7jT5meLy7
	Wm5ePWiUB0lWAoGMjspztPS7ae/zcuzU=; b=XVleKZYfGpbpk6i3CO0MRKSdsX/
	Cz5JXS2Aj8nDy020NtjKXU5Bh3hEpwnwrgXWW9x074NOKdvgOl9X/o4Qgl+C1j/0
	v7JS13d7mdDQV0bzVgSGLTRxiCJFCF1GLAmGFSL7f41v0gx32/YPr9kQ0dFKfRZs
	1CbkqIU8mA3K7Cr/tLb3JYaMjoeLuseMYrgU8PXZJrVwjKYo1F8MAZwGcFkjLO4E
	ZAAmvDDVmNZbb6KsdKU+L1zE4D8O1W3ZLPs9Y572ionBxM8WLTpoQ8fhRMt9uWMp
	ja92esdfChcrs6SX5PaXbhWlARqonV8aSBzAvfDPPvzZ+rR+akiwRS5tAwA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dm2t1ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 19:13:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35c1874336aso968370a91.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 12:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774466005; x=1775070805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3m7jT5meLy7Wm5ePWiUB0lWAoGMjspztPS7ae/zcuzU=;
        b=MakCZ1X2d2d0hK1/0jM1nwHD0Sdzo6e0sud0kNlZKE5Ks1Ltpk+SuMpnVJzqXAPZFb
         E/hoN96WrYkryCsLwER5RibmIt0S3GsqfnKRCrDKBrWDj++lktLsuU9bx2FNFyHN6s3e
         PA1FBkHqSwmBbjZhbR0pNz3fYmbHNLTk8Ba44Reho4J1ckuIRxAxNXX0lVg7e2vq3AOY
         zSQUtvRIdmWtz6VCl1WKd8R4n3OkQoWwzIWmwcrXUssdO1LdYitpHCvzdHLieROfXFlD
         zrW96dlLuwbG2FHv83oop6VDemIwG1mMVF8B4xlFsn9VNgSGoOj5DYDhEOg+2rMtTI8X
         ACNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466005; x=1775070805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3m7jT5meLy7Wm5ePWiUB0lWAoGMjspztPS7ae/zcuzU=;
        b=Ta3jGy27zvGUaJRKUJJUSfrghSIu34HAXIevzK6ZRbual2x8ADsbHLM02y4d4/nLGf
         VPFgMXZAvsmgIoCsWeMBMszKp4wFLkP1hHfPsh4cyeO5c5YZTws9hOE7s+pxCmocPYMc
         evSb+11va1QxlYFaSyzo5AIxdNxd+B8eiHVMUzYJxBwyZN3W9qRIwGNWWTb5rnfJly6A
         sX0aBTgjQWIA+mx8kMjvwBMUWHerSU417Y8mbA5T2hXlrq2bZcN0Truwn6kfLZEeNO3/
         JGmoO63/CSxlIIea50uw77ZE/bA+ELjtOJ7W1gqKZINbfUFbmw9fbaj+1FGhDTZEYcCR
         6/pg==
X-Forwarded-Encrypted: i=1; AJvYcCVWqXSFsOgCx+ILiXr8yq+XK2vwUq1DVFSpFA3WaRMilxAgUGxv/3lWgPbp9Ret55aWdLzd2mZ0hSVhWiIKM24Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyCmosAL6SD4pyhX9lJZSueTicznPdjyso02xUo8dr/vDzNXLEi
	dWfQdpj4wt+x4jVBOEPffOahwqihPnE2ULNjVSu9eD0VVTVKa7e0nYVhCa3v+PsJuIrisXyuqtt
	paXDla76Dyzc/MZEAhtJ5PVi3ukhYSEaFglnZCYmrBastDgm8OJFNUp3Pn7OVs1YecxI/IaY7
X-Gm-Gg: ATEYQzy5A0/1Gu58+/KpxuMtGH+6Sf3QOQsFu5JnuFIK/d79JfXSnwxNpsG8I695cKN
	C2aDNKJjf73o2jFXuq+YFbFZds3l7F+VRgR8lG66/iUsEtfm+nV9clc2DQAls+yPUqhvWnNeHSb
	AGc5uV4ma59krORFbKOovP/TyuAIqnpnpqY65Iim58O/HBLKoByn4OjMAfXeOO9StqLtSv1Bzzq
	m7/rVCnBvimUjMiRtC9qmi9x5wiNM27wbsdStgOoHC38TJc6xSh4cCcyTlLVfSLa9CZhc2XX3CW
	431V7CmsGRRq9hPtYEp6/S0UJ0hL2PdiGJk0MV+V6uROU3mk00uAIP4I8QXaiD1r0pIQUHaXXSi
	WSODY5nzrxBGsF33Rm2O1UY4TxIRPNdB4IHAgvZ1yLYwxzuGj
X-Received: by 2002:a17:90b:4c81:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-35c0ddad8c6mr3937529a91.20.1774466005382;
        Wed, 25 Mar 2026 12:13:25 -0700 (PDT)
X-Received: by 2002:a17:90b:4c81:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-35c0ddad8c6mr3937500a91.20.1774466004788;
        Wed, 25 Mar 2026 12:13:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c1dd36ef9sm76379a91.4.2026.03.25.12.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:13:24 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] remoteproc: qcom: pas: Drop unused dtb_mem_region field
Date: Thu, 26 Mar 2026 00:43:01 +0530
Message-ID: <20260325191301.164579-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com>
References: <20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE0MCBTYWx0ZWRfX48NuVG7EZcdb
 1Cedo0YtvB6RC/kejS9t7kdJzhkdYNnAJtCRSoEDWSPF9D0IsZwA+fdGiO+X7pXgFvRIpCq7a+e
 1/Zqq+OGRG2Ca9uznlkL60lka67jerYiwa9QYGC3AWy3zPU6ZYBx+K8bjINWvVyDGE55zG2LaVL
 PEeaYpP4KmhDYgq6PNuPNwU4o9R6WX+iaeBK9K25FqGqU2Igvccc2eazJKptEUik11REBUz6NxW
 fW4U4nbjXCgFW8Wfvgd/Zw7ZUTZ1DurIiLPlljekyLzcNgxQ5e1b1yFe9LyCNimwQc7qFAUBhZl
 THuIrHN0Q4wg6MWoBImCJlDTcjem+wX14p9nYMZCDIS7U8qKtmOq90i0RngnbbUJ4F2AwmVYuW2
 3O739am3uvW9uMz+oNNzKfTrmQU319WR5Q/G8FB01vSbC6S2NvwRtbR8meoTRwVeCfhMHYqUhtj
 UrVaxzUH2B+ZZ0yeYfA==
X-Proofpoint-GUID: 4wTwVbtaVM7JmdtB_nrTrd3aMbVzJ6bY
X-Authority-Analysis: v=2.4 cv=Fo0IPmrq c=1 sm=1 tr=0 ts=69c433d6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Lqr_36QtIFBVL_bOULEA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 4wTwVbtaVM7JmdtB_nrTrd3aMbVzJ6bY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250140

dtb_mem_region is no longer referenced after the ioremap was moved
to respective places where mapping is required. Remove it from
struct qcom_pas.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
changes in v2:
 - New change.

 drivers/remoteproc/qcom_q6v5_pas.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index c8c143fea1b4..0c9183ea06f5 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -100,8 +100,9 @@ struct qcom_pas {
 	phys_addr_t mem_reloc;
 	phys_addr_t dtb_mem_reloc;
 	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
+
 	void *mem_region;
-	void *dtb_mem_region;
+
 	size_t mem_size;
 	size_t dtb_mem_size;
 	size_t region_assign_size[MAX_ASSIGN_COUNT];
-- 
2.53.0

