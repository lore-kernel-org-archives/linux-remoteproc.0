Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA4D3E639E
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 08:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401693; cv=none; b=DpKnRtLD9TDi1aoBUcgT7SCKDmfAUgWssb13Tphol6Ie51t1L2t3B5m79w8d+jn6E0MDdM0SpQUBtGtR0l6HpP5LFYEgTIEqjZY9wSDc/AhwIKbb8tGhTrtHFc4XmIwDjNC+Jj0tmACwIVIHf1VjchFvTb6NOlwvlC0b/6UVZvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401693; c=relaxed/simple;
	bh=yDepBW5TSVc94OiLvHOHEAUQ8yFpRuoV0tAB6eQp938=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G+Ag9vl3DjHI/NuJumWX5jf9N3R0QZfYfVprGcwfkHW/13IAQsGRBqm53F24w5IgQ2Mr7kEvD6yZpWtr+AGDp8U6dX+oujLMpXH6cO9GVeOKYD1xKy1BAWUlhSieyJtQ0qcZZYHRLl7MEClgWngUHbG68pkcqUlocyN0RMTrnDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnCICp6x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F/Ih63y7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnCICp6x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F/Ih63y7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8c24k090429
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 08:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=q27uNBvFXFR
	sroY+VuQWDXW0AfPifGEAVBg+r1u2k74=; b=FnCICp6x1EvRaFuJTDANCO+SuUM
	86eisML1GOvNCBZdrGkVaeFayoZsZLtM83bWrv+z+qCvOPVkCetV+TeEigvkjcdZ
	iwQS2lyi3nqpH576qen+UC2JaEJbAGCBn6rYk1S8wG7ADGv1SPwMb7kfGrc9WwNV
	sXe0iRxMzh56SDQh+jFigb481hBcwMWaNuz+Z27hviqYnmyUWVXMkoF/Yr6hgF2s
	XtncElsgENYHGg2CedZa8L5sWhub1x+m8DmyK/zN/iSSmMTh91azKH5dQOBVVOTl
	WG3f0kFWezpwHOBQ4XKPM1OPZumjeh9XnKYnf8j8cQaZc/QJM/DxY4+kl7Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr39802bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 08:54:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848474825ffso823326b3a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 01:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785401690; x=1786006490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q27uNBvFXFRsroY+VuQWDXW0AfPifGEAVBg+r1u2k74=;
        b=F/Ih63y7DRXDBsYRk7YcWzG3h1tNnvyT5u/q63gH2LD2GqmAAB/yWsG34POCg3Q525
         X8dmZYDW5atrFcvLTjYXZwpSy/dnywvt2wJUMr+vZyk0VNXqNA19vj18gHBXebyz4J2y
         CEeoOBsBo2jF1uWY/Ya2EzDEaYH8UGf9LQyeX6ciQkx/OrkaEPcBsGyfiTtr+hsDS75/
         Z5X2M9qc7Nf7d0CoJTD5Pp6UhqgLVD4+OV7CG62m9FxMvmeXxNOBFpi3uZgLgwSppCVF
         rIwOUtFjdHYnaPmlOkqIUqZl1N2oOcfWI9MeCeW2f8ZZ/HXjoAtLRBbIIwgtOUgg6Ejn
         w03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785401690; x=1786006490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q27uNBvFXFRsroY+VuQWDXW0AfPifGEAVBg+r1u2k74=;
        b=rMAIP2YdD7PvefuBIVMzqJhILI0OxUY3u0tdQPSyEci1ahhBCsI+9bEbVkycj/oRlb
         +hfIJpkQX3KkPmwShHps+u+I/psaxF0n/Ft/yuYlEKc0jQr1Du+aVSCVnVHp4tmL0w88
         piRX7lh57uFA1R5LxZCjWr1UVlvOJWVD3NIzNWOgAO+eBmvBcb3c63dBAxOmMMpPPRYa
         oPIOIaQAfqrxsOiQOL8ySH9183X6Z5qxrVGxXhWKBpQQFmp2Jmt8/nUQHEAh2zjaXggI
         IMz+84S8RIatO+bO/PkS1qvwcwM/fXLYsw1/d8E4AXd6eLeoF4BZiITehx9fd38ffc75
         QK/A==
X-Gm-Message-State: AOJu0YzVoPOAjw8yyGPILijecBTYebyy4jcBvmPtv6fiJYaaddtS4vK1
	G24Oc/8K7EXPPjNO0P38Z+UiQ0pAK8+I0K3qCjrg3IZPxyAhVQ2lc3vemGhJN6C8WADOyxL7Jah
	YWfnF8Hx4baYzjGmM2/rhhBn3uj0tfJoa9CB9SyvHET7dhXEW+st3xa0oB8lJ+93ONR50MioE
X-Gm-Gg: AR+sD10p5CxaKrW0YVp+rbv0nSI6d8zsL2cjXGjA6Jnh+x/l80AVV+4/F60//BnSMHL
	F/QiP7cX1A4Xc/zl+RJxuiFgCDvms1aU61jdkn8KIW5Wshtt+olZP9wMwNMyXQQBqv6F7dtBKAb
	4n57Y2P+v1tT4KFNtb0d/TE03m9qD0YrnuY4xt9fv4tebTQS/YXbB374L2MoGN7S/e2EOQtpG8M
	AFW1mJHLPbyM72nSUUfayfDgI8S4tR6INplxhE0qrBoMhTgCZsGpCasM/YIShKJPNor5s+RauGr
	ePoM5hZGQ1cm7u6Hx9mQ6qcb9bcqydla7jMY6A9lURSbAac/2eOR1FAF5ftSq0feFV6LVY1pojJ
	9pTeHJnNc+WT7dBG1RcNw+1xKNrY=
X-Received: by 2002:a05:6a00:21c5:b0:848:48d0:934 with SMTP id d2e1a72fcca58-84ebdf7f73fmr1398136b3a.18.1785401689848;
        Thu, 30 Jul 2026 01:54:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:21c5:b0:848:48d0:934 with SMTP id d2e1a72fcca58-84ebdf7f73fmr1398111b3a.18.1785401689364;
        Thu, 30 Jul 2026 01:54:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe23120sm2774402b3a.11.2026.07.30.01.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:54:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH 2/3] remoteproc: fix pm_stay_awake called when work is already queued
Date: Thu, 30 Jul 2026 14:24:36 +0530
Message-ID: <20260730085437.1240215-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730085437.1240215-1-mukesh.ojha@oss.qualcomm.com>
References: <20260730085437.1240215-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WOtPmHsR c=1 sm=1 tr=0 ts=6a6b115a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZZkLIo522sJWJ1NZv_oA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2NCBTYWx0ZWRfX40m+FKSLHToC
 LtPz5g6/1GI/YApsYq9HJg264UV8RkvqZjIGFlOb7BoCcL2m1520YDiZWjOFVKCVNSazumXQ/r+
 5VjNMqih3crHZSNamxTOtdPKLry07Ne0w6vy70Z3fsaa0N03bZs7Ihp1mk0wyRLHeuM0xgcfzE7
 f4Q4UQul2MONp3LsyU5+igCU8Riejib0AP+VSxV0gBqpspCjmXPEXddo/KhPoqmgsGxR86L0ls8
 z9eb3kuWDlcgFZrofy07t6QWVUfK27ycDM0uU9zuTB66xNCW5H5hzqsJAowryxm5q+yp4De3oTn
 XM6hhq43O2h5Xne+3+OA4+3Fiasc0xFaD4W8xqaycHrbwk+vQfMVjZ5rG1LTXVSXjy/RqVZFPrI
 mF9t19VeMuccjXQsy7JTMTSFf4y85zkb3br2gqQtdEMEJfFEiMEv8y7mVAiMIMScxFa+qvjH8Sq
 0of1eYV0FiT/5UCABDg==
X-Proofpoint-ORIG-GUID: coq_S-uOVdYAh3hGNBNpPKlDcCmB-sPP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2NCBTYWx0ZWRfXwmrEF9RJfi+g
 Ee95O1nIgLLYqDBoHFdQ6qG43q6eAEWFH75dYIwziPRNftHYTSSKPI/yH1cgCq32tuAElBO01d6
 tqQr900SCRWCYQe+vfxGd8C5nPGFMns=
X-Proofpoint-GUID: coq_S-uOVdYAh3hGNBNpPKlDcCmB-sPP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300064

rproc_report_crash() calls pm_stay_awake() unconditionally before
queue_work().  When multiple crash sources fire simultaneously (e.g.
watchdog and fatal interrupts), the second call enqueues nothing because
the work is already pending, but still increments the wakeup source
active count.  The single pm_relax() that follows when the work runs
leaves the wakeup source with a non-zero count, preventing suspend.

Move pm_stay_awake() inside the queue_work() success path so the
wakeup source is only held when a work item is actually enqueued.

Fixes: a781e5aa5911 ("remoteproc: core: Prevent system suspend during remoteproc recovery")
Cc: stable@vger.kernel.org
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/remoteproc_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ee9354ff69f0..9d36e2f06348 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2754,8 +2754,8 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
 	}
 
 	/* Prevent suspend while the remoteproc is being recovered */
-	pm_stay_awake(rproc->dev.parent);
-	queue_work(rproc_recovery_wq, &rproc->crash_handler);
+	if (queue_work(rproc_recovery_wq, &rproc->crash_handler))
+		pm_stay_awake(rproc->dev.parent);
 	spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
 
 	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
-- 
2.53.0

