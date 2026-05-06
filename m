Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C37C2C030E
	for <linux-remoteproc@vger.kernel.org>; Wed,  6 May 2026 05:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778043689; cv=none; b=gFAkF/STEoyNLPA0zcQEm8G3J6fljebajfD33bnDJ8cSH9NESk4SuwJTQvKdVwiDm7zC6vEsfU9QVWDgGWPz84Fom0MAjvgo2c0j9GmsCEGoUy+sKIYJ1LW105uMyzfoZAcFZ8aMOrGq0Mk9H2zCp5b4UFkn0X750UppLWr7POM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778043689; c=relaxed/simple;
	bh=x3imywJXb9KQ30J+Y0NGkFn/oGofziH/knbByycGVA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tHjT9QU8wWZ9YRdESYGwI8Olmh2UxMemZWa9XepFNKO8H1x8wmRUMaeRys5ehdgGr72oAWsDGCCMBPmbQtqxywJrAOvR8IIZkgpn7iXb8lLqEr1jsQoF7x5uL0rMPb3NKyFONPvP+01CCdNprPcQfrwmCLoy1NgRccNCeMi6Rfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GzHL6fEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZ4E1s6C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GzHL6fEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZ4E1s6C"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6462gJ7l3091544
	for <linux-remoteproc@vger.kernel.org>; Wed, 6 May 2026 05:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qpfp4SaaU6j
	oBqSmIz9YG6OU2Zed5b0PfIlvN0JCuFg=; b=GzHL6fEmtJVoLeEfBOk7Mrj3KR3
	d/Kmdr/gygGdrpg46QfAMvIOIxyJTdWGjNpAEPNXxP5D4nfkyTz2o/QilMwJ1GBA
	o4+tcElfx8AtArqE1TqSdzqlsqVoIHHIVNXYu12cGt3EbBxtf7S8c4Z/yE+iFss3
	ETFDZCt678DV7vh65T5YjF3wysYLaH6XGEfSWMlpfzVIWjBuezAPusRq6dDnK45u
	AyGeASNCk3S8E6hhDkG3ux1y/v95EoqMFjUwvltVH/HIFmFWkJpvPMCi41sEAJcP
	kKWWsFaan9hxhRdNUyZnrZ5BFQdzZNFU/ZJBXsb5Mn/7i4Jq05BAUYysbqQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyfct3n9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 06 May 2026 05:01:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-83603145987so1810916b3a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 May 2026 22:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778043686; x=1778648486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpfp4SaaU6joBqSmIz9YG6OU2Zed5b0PfIlvN0JCuFg=;
        b=OZ4E1s6CHKeYKJPS/BamgC/BpsljGKgafO3e8cePsM3ZfLtSbA5rjrO4i4yTE1yJEM
         dV0VkJH6DU+YXZZNDiLVTScoV5NVs2ldwpGOV+Yzz1lzi14MSdQvnSMNjJZg9jN1Pm11
         ffvXzENCLsvct1z7fExuYl16DM3xGNuDxpuXhuc7krntMsh6lZ6zN1i/f8cblnz8WW0j
         8qT2gOLeeJvj2LI8HB9QuUl3RPC9f0cy5hnq5Kktdv0ED2+L7Hk5MEjeK9cp1x150r8L
         xoUnF45grm0wXFoD4klbC9u4MPNl8CTrN3UkzecE3fghrjoKHwZNnTnoyCurbFGP1hNT
         QqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778043686; x=1778648486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qpfp4SaaU6joBqSmIz9YG6OU2Zed5b0PfIlvN0JCuFg=;
        b=eG16+9ylHP8ZDibnoX1skzH8VfUw4W0ceRYMyBqvn6CZ+KEjtgWxhjfXs+cIbd37LA
         5cnG+f3S1LsujuFZ68FVUcgWgRc8yqld7FUshq5RwdqssFOTBMR3lo7ZBcxsyauG8qoG
         sfmxYRVRAwO9uc0/heze+XRHQsfQz2QuHtNsAD2Z2fqjXfC4YGjv2EYdrWL8PB4Wq8j6
         GbCsxFLcxmFY0fCItE2SSaZ7n8BKsNtj16s9GyDX7HQCh1iTSUiZVG6+s3W5/DKbno0W
         mUTbWrVbof+UIwfC4uGR3s7PxxWdDBYwbFHp/f6U5YhVzAuXuQY45vPivW3DEv/iNpzz
         FZFg==
X-Forwarded-Encrypted: i=1; AFNElJ8MMVr2Ob0Q/zLrhjRWHXLtcQaumW14ZJ9JZFe6XUEcNbs8SLxipxntMtv/KKNUByxujZqcEn7mSk5h98ZnqmmZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwWp/AceLh2KbhOjnmBTG+vHYRTUZyO2f26jcQ9hF1o2UaOpKA2
	cZYQk0Vw4jxeAlWGRTSRCKOCUDBsNXAS/3HkzUn+xnY4UvALee67bvEycUYqqRDQamjPIn8U84A
	4FcmwWCMJ44CHsI4h+5WzqnfW80k4/bBrTgeIy/C8K9QgxKvVTK1LwoE2qxsEpQg0/v2qpNwh
X-Gm-Gg: AeBDiesQE07cfVQCBKEIoP1+PjBAwZ/dLzYkeHgKneAlLja8NEGANhWnoHBQcXSNo4k
	w5gQy8HE7bDj3evtpHF2WD6gfERfVEGpBh10Y7A2DOqcrdALgGBcgtowK9TDYsoW+/klOZS6TzH
	fXkA2ETBaJXUAtjd9FQc4XP/3JqEgm9CgOFdRlsIt5aLXH46IigvC341+K8RRBXD6Txn+KSwQgB
	ixnxEIyR4VVUG3p2Q7hMwDXtRo9UFE0tcGeI3o31t1M60WnLwyV1FRWa3acQyo9CD8yyMGBax9K
	lH3Yi6U9Tkr/uUf+hzHOoJwJto74EjQ1Jz6yTVvZbj/kuFFb0JacS+ZydhqdUwpDH/8vxyVOei+
	YmE2ulp/EZQBH/xx2KvyZdGqIdRvzMWQgb7EhR9S8djxTqJGjE6asdlYORRA=
X-Received: by 2002:a05:6a00:2d96:b0:837:acd7:a78 with SMTP id d2e1a72fcca58-83a5b9d8131mr1640503b3a.16.1778043686129;
        Tue, 05 May 2026 22:01:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d96:b0:837:acd7:a78 with SMTP id d2e1a72fcca58-83a5b9d8131mr1640455b3a.16.1778043685478;
        Tue, 05 May 2026 22:01:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcfc0sm4891620b3a.42.2026.05.05.22.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 22:01:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 4/5] firmware: qcom: scm: replace <linux/remoteproc.h> with <linux/rsc_table.h>
Date: Wed,  6 May 2026 10:31:06 +0530
Message-ID: <20260506050107.1985033-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
References: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0ut3-VKH6yMgSpGBo4CxRPX1e_a8-Zvw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA0NiBTYWx0ZWRfX11ARPMOs7Epg
 dQaapzWiDx2WHx8W7v7oD0R6SE0ZeASqV9raSt0vZkXgB0oPJfeYAnePNJ1UhSO84BOCjFrPs4W
 HljifEh9nvB9yVJ7+bWw/Gad2ICRKziE8Q+NX62vKKWOtrWmukXuVDcAAS0G/rcLeDQxRWRT9wB
 liSQ45AAxql3RAzJE6rCyKQUWSnl0I6GKRi0/zoRJ6YkrsOMY0ICwoWauRoQkzs5zfU8VECbQ8O
 LHL6VRhBwh+gQJ0yW798NJ7eUJtx2ZXa0tH/9tJ8zhMWJx8gn/FPXXM13NS/IRVx9uyAq9RDTQ7
 AZC0JyfGci/lRjdkBKYhUGcyXUhWhqLzGocXZ6KCx2ZNp9un6/dt5AmFKImsHQXWedgDM7gl1AL
 vgoOMhM+QV3VirXAlAqnGz0I/tsC+lD207zXr3myeaZ7ySRa6HQZ/a0JNnN7r92YWqy80+pEkCu
 FcdUYh/euaGpdEbyDpA==
X-Proofpoint-ORIG-GUID: 0ut3-VKH6yMgSpGBo4CxRPX1e_a8-Zvw
X-Authority-Analysis: v=2.4 cv=NtXhtcdJ c=1 sm=1 tr=0 ts=69facb26 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=FwMnjOFOIPbINuAMt2AA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060046

qcom_scm.c only uses struct resource_table, which was moved to
<linux/rsc_table.h> by "remoteproc: Move resource table data structure
to its own header". Drop the heavyweight <linux/remoteproc.h> dependency
and include only the header that provides what is actually needed.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 2cae35e7c583..d9ee180388aa 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -27,7 +27,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
-#include <linux/remoteproc.h>
+#include <linux/rsc_table.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
 
@@ -871,7 +871,7 @@ static void *__qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt_tzm,
  * as zero respectively.
  *
  * More about documentation on resource table data structures can be found in
- * include/linux/remoteproc.h
+ * include/linux/rsc_table.h
  *
  * @ctx:	    PAS context
  * @pas_id:	    peripheral authentication service id
-- 
2.53.0

