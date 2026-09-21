Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9132A4D0CE1
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 16:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008597; cv=none; b=ccLOEoPstz0DH0GdKvfiBU015xcp//BRtBx/kHe5wJfkDdDBinIHd55ci4UWDwB/0cQNI7zoHMHSUUjPdJ16N+ZuYDwkf2Q4Fuc0dkWACN0JBIVlH3j5b5l+C3mdB/B/6yAj31tvfFVFBGeHdwTArGlK6pHdEB9BFY7zLaKik5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008597; c=relaxed/simple;
	bh=MmySXDpweXSXT6L0BR75PjecJ7o7GLBlPVL3+j8etyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t1d6lOgWZ7BxL/emFFvxEsuGexDTRjOGCmDz8To4Qw2F8JoFgrJBEsf1hLBSfC5iusFf5e7/5Vhyur4HmwbGAE3a+3jbKxovX9c1Hw1cPEn6I5U+fGq1I9GvYKV1E1SoUyGJ1RO3hkvXGGgNzet9DFJ8d6+4GLoit9qIQIz1W90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IP+YEjC/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RKA32lFa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IP+YEjC/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RKA32lFa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFB6n4886453
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 16:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ybtIJanTpNw1TSyZ50jVLHb3tH7p86yITIKdYXAup8=; b=IP+YEjC/UVES9zH6
	UIE7RS+OP0/45KY5Ov2oaQ4kx/dDVs6EJHCp2+u/kndnYodOzQVFJUwK96LBnxpX
	w86ns7rXYb8MfkKbSnc8tQK8DM1cdUIouV3bpsKiRcemmyDtl63f2Jh8LEZRBcW+
	0eUOb4YolJzlEGLVfeI7Nfuh91qS+vDSzabsO9cIJvOAVgDH3HUcPwqjrGgV3Tvp
	jPE/kROjdoRcoREnA7P4bNY/GiodDuyWR8Q2OWR4Dvyz0qJ8tl16fOiy+Xxhyw9X
	VnC/w6lvRWdB0qh+YdR5NJ4qDrOaq8+JFhe8LaoME3sCTcHtqjXNwYFEWEn7lvPY
	/Yr1wQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj24tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 16:36:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd8920c132so75898085ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 09:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790008589; x=1790613389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ybtIJanTpNw1TSyZ50jVLHb3tH7p86yITIKdYXAup8=;
        b=RKA32lFaBQ6JqOtgI/8HZRNQMG4IO55ftmQ6y9F78pquB1GFF3hogph2jJzJEOcueG
         AV+vbnQz4xOoaGVrDFoTGriuQUA7iWxH68Qimdh5zhmAyXepb7S5LLwrars26PakgO3y
         zrtmcmX4uqohQlW3LQKhDzSgGoA40e5SPOB29bh6sGO50zoiyIPCRPpA33G4o5vExXuh
         GcWvMHHOx/7mHM0nNgV87t98jyuffcoCB40j99ko6bwo7zYVjSGrXlxJfKqlIqzV3L7I
         nbvnAb0D6xeMODHeaLZCgSKUmUqv2Yh2X1ttSnzoY9oEt+yjT55EEu0cEdUbDa7J2adu
         we9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008589; x=1790613389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ybtIJanTpNw1TSyZ50jVLHb3tH7p86yITIKdYXAup8=;
        b=qR/56QdTOouX2/9XgR/+spvHM2iVfrJDTjXtYEeTkuTWg1zwPEMVDJaGHuKfBQvyVN
         bKAN9r53edWQB+jGgF6v72iiXDONgtJxnSIt8fh8cJZIck6vsA+PgTB4DZqdnC1feqhr
         cZlqZl/r6dYibKFHDxnyGaIWNc8CfaPbhuwoGZl/IXyUcRe5vot/7jABCEmlGscEZome
         VHz9aLEQLVnQlqU09vAKrRy5vtLkPymU4a1lvasYpZpaiBsWd5uxWINikslXCnhkK2YH
         NaG5Cj3LxKfgGotUHgbrGDHVwVwXKcXVxBw6iCO+eyydcPRz2t9Uj8aVc05AnRjTfyS4
         r8gA==
X-Forwarded-Encrypted: i=1; AKwUvBwKb1+3Ont9jdJcKWExblp0WOSaCqxTKOJHi7KGwq9+vKejmsrlK5j09SJQJVeTuWw8De1x5Ouw/L9+qnMD0zkr@vger.kernel.org
X-Gm-Message-State: AFuF++ldAoTZ5+/cJoZssenTeFcQd7ax4BrWFcNwd4DC8CMB6gwALpLm
	JU3FvggxyMS516bL51R2rMEwGMhapUVUJQ3UK4avgj+df8huaNnRt3dFwmqDJLlg4xpDg9N0IIQ
	icEd1MQhs23c1wsBkOfCDixQSbpQBEjvNhbWl6izfk2uWPwYYTqBg6UNNz6m649HlmmeggoqG
X-Gm-Gg: AYBFou3iy4O8vZFv+Q3YS40YreCTT5q54SKVUKRdlAQvDMz/yW3hW6Da7/49MGKjUy0
	8fPP+l16RbOYG7dqzl2xSQZfpgv3gK3cpnqI2hNHrJcgJbgE/QV+AwYQGqPQB+OxEwklt4GwPF7
	7PEFEM6PbW+uMN2MAh8YEnAY/2PTXDn0HmDtGD9kByxoi1N7b2nLbPbHiBAII5bSarCCOt7KR5x
	IzNiPzlUo0KTXCy0f8oRt4L0nyUoj2QzJ8sZOW7hKsq9E0zwjwZRt8pEDl2QHAAHobNUSvNhTbQ
	khpHn8hL1WyjllG/stiff90rQD9tTUduDyXiVhcU08LhKhRmt6kZwIO1jTkDSn0+tWFoHC5HAjp
	L+cIXMVkgHvKJH64OjpD6QML0mQkyfE+cZNb8
X-Received: by 2002:a17:902:d584:b0:2df:4827:9695 with SMTP id d9443c01a7336-2df48279700mr45200975ad.46.1790008588614;
        Mon, 21 Sep 2026 09:36:28 -0700 (PDT)
X-Received: by 2002:a17:902:d584:b0:2df:4827:9695 with SMTP id d9443c01a7336-2df48279700mr45200735ad.46.1790008588150;
        Mon, 21 Sep 2026 09:36:28 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba2c5sm37192355ad.49.2026.09.21.09.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:36:27 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 22:06:19 +0530
Subject: [PATCH 2/2] remoteproc: qcom_q6v5_adsp: Fix 64-bit address
 truncation in translation
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-2-f19b4b947bba@oss.qualcomm.com>
References: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-0-f19b4b947bba@oss.qualcomm.com>
In-Reply-To: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-0-f19b4b947bba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790008580; l=1468;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=MmySXDpweXSXT6L0BR75PjecJ7o7GLBlPVL3+j8etyA=;
 b=xv5PUW3JolB673mSXfd87vykzyVX8mVcDJnaz1MZ64L4dvxq8xTFR0TmH1jNigJAataIJjf98
 vrqv7M4USl4BJ6VomOdMdErl6dLx45cktvypnn9jSW4QhHJoZ3Z13bp
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI0MiBTYWx0ZWRfX5cXYq+BawQRZ
 qLAMMftLXFXb/z8mMWAdTdwWA6eCSFR0PJn1zgkU0+alyD/WcSpmLD0uA3Y0MZ1E3lBaNW1YoK9
 BI9r0PA9EhSDITyHO7EKLbC4dD1zMBw=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab15d0d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Eo0ntd768-WPz5Xdes8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: j1n6tpeNwbqL0J1IccgNXeQzBjpNehaS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI0MiBTYWx0ZWRfX/GcfHo2s70rL
 KxqgoVITD+rvTo1GwjEF2b0OXRbDzeG8R4clBmqKpLL6ULd3pfrSk+JgZb4Iy8Y7D/9w0HWzQt2
 qyEPVyqoRRDGlSqDEm85R2l7KwrGzgqEkLr4b8IHStO//P61nDbWeMxWGbk9mosTUX/MvtuYZQj
 RUmqg3rorox8bCjWd9LHwFtoRrcw0y0AZwU25S4agStGH4CxpDMm+vk3cLind/Q/3XTDxk1tvZE
 mSAzzefSZLmmkjdlJuuH/Inf1nDVzRUhwTAcseQMbORdd2m05t/7aSPtaKybIg1VZMpfIcTqd9G
 IO5VaKuSfSDRWOJpluQlIgkst/lBW9QPMaoue3kserb/uOpNMU+5h6XLScKcDcGgQZ+eoI1Ojjs
 DPCBE67lkZ3Z4YORR+naiRLgd0sRa8MDA/fDXYRtkmdArRLrgvdLRU9Rx1WljvDv6DssdJHggaL
 F5yqAdLiHFVjWyethlQ==
X-Proofpoint-ORIG-GUID: j1n6tpeNwbqL0J1IccgNXeQzBjpNehaS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210242

In adsp_da_to_va(), the offset calculation results are stored in a
signed 32-bit integer (offset). On 64-bit architectures, this can
truncate the 64-bit address arithmetic result if the subtraction exceeds
2GB, causing erroneous bounds check failures or invalid pointer
translations.

Fix this by using an unsigned size_t offset and explicit comparison-based
bounds checking. Check that the address is above the base before
subtracting, and use the form (len > mem_size - offset) instead of
(offset + len > mem_size) to avoid unsigned overflow.

Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 46d9169a37f6..b014e7498f63 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -486,10 +486,13 @@ static int adsp_stop(struct rproc *rproc)
 static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_adsp *adsp = rproc->priv;
-	int offset;
+	size_t offset;
+
+	if (da < adsp->mem_reloc)
+		return NULL;
 
 	offset = da - adsp->mem_reloc;
-	if (offset < 0 || offset + len > adsp->mem_size)
+	if (offset > adsp->mem_size || len > adsp->mem_size - offset)
 		return NULL;
 
 	return (__force void *)adsp->mem_region + offset;

-- 
2.43.0

