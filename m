Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB193CF032
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175214; cv=none; b=rCq7JF4RtPGSN/bG7DEcndSC43JuJ5LPCQj6UXirQexHeOo4bH4ImwrIg41lcbOmaDlMy8KoqaQQzFoUdzAv/spjxqOVXGhSHn0KOhnoAiDDs4qT1qiK6H9heY/a1GbDHLaVYKnGzUyMjtfIYgoWz5cqVcOaDjIWHL4hOhe1BbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175214; c=relaxed/simple;
	bh=15K5IP1vUFgQ5ahLz1o6QIvx9EGIvH4eeubXmdEOEjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YqRvXuY3h3EPQhlGi49FSq0VOCjqIxK2JiIkLUgu5W7jcYXOYBK1MGrJ+SVijAhIR/XRZLBIz/JpZWywE42qN2E2NrGHpKsr/pDPmhsHV5icZ+Xc7TNKUl8mdBObJxbRNY8SxzmrECWkN3FdR6dDSa3YlmV5kOTv3imPYVpb0Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NDZTYHiw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aMXEPoGy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NDZTYHiw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aMXEPoGy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4sLBS254044
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	181vtMHDizQN14Sm20ahawzl/5RDy+3nFLNw102hucc=; b=NDZTYHiwpj6J/gA0
	WIIIBDpPK1iJujHaySfZEq3pTE4hy5D9QRTEadIS/Eqw15ZFB2WVRCeEChKJnsPh
	JIDe4pQ93Ny+mcLs0mTC3ERqUpJdML3/TGY+8jcIpdNkPkrIb+VfDbaeZSfNzR+B
	Z/tbHdWaEXcCaaFpF8T2eNcm5xKuihuhHrIU9obh9z5BznpwpLjCbd93JTQm6+VV
	3MD/ankY4D3UyGKYN8bazCxcaGUbniHu/i8quiMstAw+A4R2Hi1vb+t3i/jYc/1M
	/k8nqQ73A2bktT8Noz/ZP6rVutRllh7lvszYkHyAbFU5YOQe2x30Kh+KqgDkK+We
	HQnFwQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8h87rjg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:20:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdd327d970so1609169eec.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 00:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175211; x=1779780011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=181vtMHDizQN14Sm20ahawzl/5RDy+3nFLNw102hucc=;
        b=aMXEPoGy84sR92S02DnSJv5zuonYbKmOG6SPpn+rt6y8NHjHXc+xE8kZdkAn7eVsVe
         rmhlt4tFIyjFU4FgT93qA26//P1deWP7aPnpbK89ii5CEMPFEefDvEefiBvYcqHj0arF
         oDKxB6MFdlDVZ+YXy2JbiVjEWm630vvGI/49GvgAFYVIg6aM+Lru4r9v+LZ1HJujVVgj
         emSN5wYefYmdl6z2SgXL16ll3pRN/XOi5tiEdYfDa4dwwXbtSaZ7XxQP+ENNIQuv9aMQ
         i0gl21CEL31/KoQ6j+Vawt2xs3S44tZpFxrLa9g5Cp5UFP/iSviO3CCtLM5fGASCMAnQ
         mhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175211; x=1779780011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=181vtMHDizQN14Sm20ahawzl/5RDy+3nFLNw102hucc=;
        b=lmKckrZkO84UKfZwTJn4IGIvLNxgCaM+KPkshsllq2FbGO4umsQRjnxaZ8O3g85oWv
         9s+IJOwOc+o6oFR0qBNSQyZvHc6PGNtzxc/mahGIsare9B7qKpGDbIEMChiSSQgnFdxz
         BNTICKc20hpjACk8g9EFYtYt9SGnjMKm5KV/1OAG7bE9fJbPa8Sbl/5OYwHejo9UNOoF
         O2aZ9j4E6rmIzc+gBDSVnbpR9zdhODYXCZbwRGFKiVu3y9SJ1ddMYvWqylt5O3Ar2TIS
         FXt1lh7/5BaPVBUd4DJsNB1dOgW8ZePeR6P12IJQ3jyVwqCnIrfqEXDuWgTNqn5QfMpq
         EFuA==
X-Forwarded-Encrypted: i=1; AFNElJ/lYc68qgWwGo4ZVwD+xVeD5kWAQEC72A6hAmOcZkbYxaAJnF9vBIgoL+9raexiSkq7eAcs4OeLe5dxRqdnJhsE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ayr9OEe5YK0c7mtKJfvjI2ztQKl4/niMVFdiAMO4iJsVp70w
	4bmPC447QdGTyr0vH2sJuxSvs8cxuKTZeeaZiCv2cDIymO8wwteorhkOAvLOewlrQ+TtSCQFcUO
	qPCUSU3ABZLHArE6ybXyJEk59Cha5wZvFdgKtjbmHm6CtHHjxYjfued2xOeUsWxXRSrAAbGr9
X-Gm-Gg: Acq92OHkA6zQcCCYkltUYKEJOqttUNI67kSIH+sgmsWFZpHvboJseU9sjXDJoUeaXPp
	B6GYTWDAGP3Xf9hji0dTkSpA3V/NDfAFStNHN4lPtlRL1byF/zcjf73O+IDSn8HcrzhW+Zd3U2r
	3cun3uO6hNW++o/JBwpEWyyuLXM6PbBXIcKH2sWi4xCAEEo3Zd0SEmOjkYGIh7T2XnbjDmB0OtZ
	6k6hVv0ekUUqtGp4AuyepkJMRGBs/MgIri2ACpRxuTwUZakWawKr+xA0/813XvXqGnPnu3SFucs
	IlC5R8i1vnLgjiidfKf8Lsyl7ybWK48WOKfrGSi990of+Oni+pt5mVUoSsnM/q7MymJBz0km4gx
	0/N8NWQhKNzgZZa98bCVGgCfRwanvDnviCD2F2hn2CA/wrimpTDguOlD+7VawceOk8tZsDztw
X-Received: by 2002:a05:7300:a897:b0:2ed:a58c:942 with SMTP id 5a478bee46e88-303978ad90cmr7498113eec.8.1779175211314;
        Tue, 19 May 2026 00:20:11 -0700 (PDT)
X-Received: by 2002:a05:7300:a897:b0:2ed:a58c:942 with SMTP id 5a478bee46e88-303978ad90cmr7498094eec.8.1779175210849;
        Tue, 19 May 2026 00:20:10 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bcd0csm16438595eec.24.2026.05.19.00.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:20:10 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 19 May 2026 00:20:04 -0700
Subject: [PATCH v2 3/3] remoteproc: core: cancel crash_handler work in
 rproc_add() error path
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-rproc-attach-issue-v2-3-caa1eaf75081@oss.qualcomm.com>
References: <20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com>
In-Reply-To: <20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779175207; l=703;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=15K5IP1vUFgQ5ahLz1o6QIvx9EGIvH4eeubXmdEOEjc=;
 b=ObV/HZB+ATu9c6aifjNcY1ruOoBKe4q84+p52UJnIpBtDD4PFIFlf2u4BMa36ELP9qPJuBLtC
 58MMCH9vtEaAvtaXvZiyrHtoUWswvIQrkooHxx5ZLfyiC4n8v8vhpDE
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: e-Kq80elFXveuuIjQPvCHtZgmcVX_f8L
X-Proofpoint-ORIG-GUID: e-Kq80elFXveuuIjQPvCHtZgmcVX_f8L
X-Authority-Analysis: v=2.4 cv=a9sAM0SF c=1 sm=1 tr=0 ts=6a0c0f2c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VRyQhUk9NtpfCekB4XAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MCBTYWx0ZWRfX6WcdS50uTS1F
 quUb29EmeElTltb+H2DwX5Ml6NTMBbdMSxSah+xrUtg5Qeeq01TdBcb4RTisWh2r6oazo7hwRfu
 vtRfdOq1LOmLTXq/7F7t32XA+q1VqTPwfpwwzWMhjgxLYiwlW9VCkFrju3uKqh8tvaAiv4CJ7rD
 coD1iuYYwH4PqR+BAUpGqlH5IKvkfzyz7dgWqV4TD3mBRQPsGfKV99OXFNxluoQlWboOOvLsLUA
 A/EXpn4M9D5ieOzIkyge61ILVfQTElskhRUXwb2uA/CdReCRWIzvEAjIJSF3qad20KGSAHcaalH
 orJ4Ly6QE7tVl+d0xFwF7z3gGZiMRZ+hnnhhOjsufurwP66bo/jzo67tCdF/h6TTuyruj64++w9
 TBp+XqzPFvjPTNtTCwFeIEcUJMkoAHRkHFSpUncTezb3Xw1juninLN3799djOxt9lPi+hBVKF9N
 TvRG5L3pMEyIt9/t1tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190070

Ensure crash_handler work is cancelled before tearing down rproc resources
to avoid accessing freed memory.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/remoteproc_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 6e23cb11e515..abaa3786731b 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2327,6 +2327,7 @@ int rproc_add(struct rproc *rproc)
 	return 0;
 
 rproc_remove_dev:
+	cancel_work_sync(&rproc->crash_handler);
 	rproc_delete_debug_dir(rproc);
 	device_del(dev);
 rproc_remove_cdev:

-- 
2.34.1

