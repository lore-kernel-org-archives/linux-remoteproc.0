Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A97840F8FC
	for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2026 08:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375415; cv=none; b=JF1IeXxNMVqhqfJjxHUA7WfTFkbKXdkf25ONgTwYZeyPiEviPFRrUggxC9vahBy3iIugNcVxlU3uDt5TNj8bJQhkikSjXZ6ySjArEMn3qg7EH06nO3egmZ9n/psp0StLAXFyQS20QmbLg21zU0Snu3CPjUYjgVamsl1HS7psVvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375415; c=relaxed/simple;
	bh=nr+Ex8WrN5Wz7qxFW5WrMSh2JP60oS1cFwUmSfg+KVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UvuzHhElUfmlLrUrQYZ5+gdDoTQWrNFaJYl+Rb9WMq4lnHSuwPylbHASSWSzt4ixxQttugrcpZwS8EQ8OfeO+vBgh+l7KRc+YbLMS2HJ+wX/6Wj7PkwjuudHse/Yv2HCIWu/1KPIy9HeOYzVLlnsi9tOW2dWa2VncUNgNcNhXsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuwUcd7B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIBGekcu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuwUcd7B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIBGekcu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5is6D4058198
	for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2026 08:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OwxBcHpn3cvKvhr1gRO42X2uan+SBqo736M
	PnhZ2lSQ=; b=FuwUcd7Bm7ncNaKvvBUxpXOUtTbRGeim2+yATkF93Ngn/NA1Q9I
	R9W7CZbui9nzybwiRomKdi0fX3wm3B2bYWR+QCsu5r83raydU0rD0/V7qG1vNt/o
	g5xG6oMCi9CbvzPdZhH8zsFCp2C9aMDBdTSsJNae7sQH/uaYkwd+1seGbfUjzB73
	67FKjmDvITQtM27tJCQkFGQtJdP9trEh71WLGg/HhC1fBvEuAji8W7qIXkZahWq8
	VpDZBs6cs+MKjbqu3iCCrIMyLBAE5DN0VEkEVglYFFySg7fGB0PwSTqevTEs5JUB
	wAm47JU5YZ6bdTgaL3r8+KTC2MvfS2UamcA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hssk5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2026 08:43:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so4606019a12.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2026 01:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789375403; x=1789980203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwxBcHpn3cvKvhr1gRO42X2uan+SBqo736MPnhZ2lSQ=;
        b=NIBGekcuxwrvUcbGI3+5KtCOC2J8udkVi5B+lop3a9v6gGWGUGriK8rMkJqvLDRFcW
         GQ7uXVBfjwl6JoU3lMadkAVJ95NLd/6DxAP75jlxBCRv39YHShS8DvXcro6UQhH5p7pB
         NBRe3ISjeXev6lAjjlz7XGiMX7BIqGEDO6iYe8jvZXyUo/+a2kKC/wf640rtwZDni28V
         4d45KHwZ0PPD4lbmIQqcways7jate1VngntKYLV1PimiWxsHOoUk8yyv2fQl+wrBTvbc
         F3wO4rl/fmmPAlugDrEuOMMi/lH95PH0NjxP0Q4RY9G3PN2C5Wg4cz2/tNuT5lOhmNot
         HDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375403; x=1789980203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwxBcHpn3cvKvhr1gRO42X2uan+SBqo736MPnhZ2lSQ=;
        b=qHbzV9Hh3JkoxYr+R9JD3LzKfwLKJKY1xp7Lq48DS3LhFK8XkGLhyI34lzLTXxgsSI
         TEIhvvtGqhEsyBnBWEQTS/WYZRI4LS/UHQOj5fyOMEw7WFZESWhpUEkEO/Pl6jd/1SIV
         XTtFtXRkaBI2bJJKIyab6QFvf83wgQte9DC6wNLvZ7yJ4SA4OIPIp4uM/zp398UW9/62
         olqztQ7kGlLVvjFUy8I0sfIP5iGw/CQHuN53nOuQdcRJ0QNGr5El4zW2XQuLDXA/izrQ
         HpEp0SfbqDrpe6J6ucZ7JkwIqMKG1gLTM9iQEP5P1FGMubZA8t35ugRwu7gK0TVpCMGa
         4jRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfQZFsVltUP0pTsaVm8asj/c4JaDrvJrvNno0uoWXzvF2bWxCzLkBP0QH/IbVYU0aUQARt1dAY/YmXsH7pYL7o@vger.kernel.org
X-Gm-Message-State: AFuF++nbE/LI4++0szhggI/fUacNz1ohOFusviqAE8i41QHxqkmCmQjF
	OSSB8aJDi5+3boGPWJHEmcE8TlAC1NXvFFu7XXUS7lrYPtrFuobAT3wTqfvXnrOtgu30NdkmS16
	d9+QX72Wf4lpD49QYcPFhNcKllGjOHCnP2AU/2uULrcBhIWZuOx0hWesq6kEG/iONf7Ez6KLN
X-Gm-Gg: AYBFou0watEww11XUKsh9zOiVQXxs0gT/vo7diaTf2J4UBhsV2071Dc7QjR+WKF5pbi
	Po8IhYhhL2N39NRcCcgWaRYOn5LPBKh3FJH/o9F0ky5EYBPz+CtWGN/5beAZ03lEKeFGoqlrh6x
	cVvIkjYF8YL/HZqLZNDmqIXI5JgDjGhAFAFS/ZINXoqn3+I5Lj/924afG8RIVtPT4anICTntFWH
	s7wmbeZaXfoKNKdTEM71rVS147dlkisW/lcnx9WBCq1M3OOjXngAqcR3R8wjSG1NrsADYZAB/xR
	3/FwiLx6HSGaK8jXHzTxrETGHZylqouJhKqYxS316l18ZPIW5JToPh6oEnwKLU3rpDcEenm6skc
	CpAUHcquFsLNg7PWp3nNs0oJWd4k=
X-Received: by 2002:a17:90b:3e4f:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-39dec0bf7a4mr4171796a91.17.1789375402737;
        Mon, 14 Sep 2026 01:43:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3e4f:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-39dec0bf7a4mr4171730a91.17.1789375402241;
        Mon, 14 Sep 2026 01:43:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm44692673c88.12.2026.09.14.01.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:43:21 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v5 0/2] remoteproc: Hawi CDSP support with per-PD proxy performance states
Date: Mon, 14 Sep 2026 14:13:10 +0530
Message-ID: <20260914084312.3812408-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX0sMBlzpYNDtD
 Z95WcH58HdzsfWnRzUGND4mEX6of3MrN9sD/U0re3I5l6J9gbtecm39Ow9p1MqFIwQoMwJ8CPl3
 W5MBTULp4zQ3J7ybOAnAHF/MHsOHSUTkhFLZH3uIlXXpNGMmWa5oAb+vpq9U19ERtBYCHnpPjwx
 k3e7ZwH3jn9ji9X7PnQbHZln61oAvROKeZ5qbukOCIwheNegseUtKMjpeALVo2C20up0vD6umQ8
 QLT6iszKad4TGPEAYQymIzuYIefPvFG2vz0pS2iJRpRzvg/LvETB7pGLPIStdfjMLF9y1vWY5mC
 naRDJXVVhUtv8R2XzY8ddnBwSDDBDwbE6oxNZLzoXEwVnBliztF3VkCVGMc8JpREsm1Kxt3YDpi
 pvosuGY0Yay+8ZtelXXBjx+hUDhMDkV+UIc3nZft87ClnxV9rG9tcObXSPRshVxihKYIESpsION
 CMnvqv+y3JbgOhxHfxg==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7b3ab cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rQWQmZZn-rtmdnU4JWkA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: ix_w6_s_4llnmHbNr0Tr_Hk8eubbbyf7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfXxCsBY5sD3W0C
 /ATKQ8pqvc7CIMxoNa6c9cMfXb03rVnGajx/r2SvHbCZYMdwtjA6DpFZNjRKcba2caLTA/eSh/i
 K0r0QjoP2XEeFUeGfhs/tMLHZeV9Xos=
X-Proofpoint-ORIG-GUID: ix_w6_s_4llnmHbNr0Tr_Hk8eubbbyf7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140121

qcom,hawi-cdsp-pas was initially grouped as a fallback to
qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
Bringup revealed that the NSP proxy power domain on Hawi requires a
specific RPMH performance level that the sm8550 driver data does not
provide, breaking the compatibility contract the fallback string implies.
Maili CDSP shares the same NSP power domain topology as Hawi and must
fall back to qcom,hawi-cdsp-pas rather than qcom,sm8550-cdsp-pas to
inherit the correct cx/mxc/nsp power-domain constraint.

Remove qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block,
add it to the standalone compatible enum, and extend the existing
cx/mxc/nsp power-domain constraint to cover it explicitly. Move
qcom,maili-cdsp-pas from the sm8550-cdsp-pas fallback to a new
hawi-cdsp-pas fallback items block; it is covered by the hawi
cx/mxc/nsp constraint implicitly via the contains check.

This series should be applied on top of 
https://lore.kernel.org/lkml/20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com/
to avoid merge conflict.

---
Changes in v5:
 - Replaced WARN with dev_err as per review comment.
 - Link to v4: https://lore.kernel.org/lkml/20260910150638.3270162-1-mukesh.ojha@oss.qualcomm.com/

Changes in v4:
 - Dropped 1/3 patches from the series as that seems unnecessary.
 - Added maili cdsp pas as fallback to hawi cdsp pas.
 - Added Tested-by tag.
 - Link to v3: https://lore.kernel.org/lkml/20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com/

Changes in v3:
 - Converted warn into failure in 1/3 as per review.
 - Added R-b tag.
 - Link to v2:
   https://lore.kernel.org/lkml/20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com/

Changes in v2:
  - Propagating the err dev_pm_genpd_set_performance_state() as a
    separate commit.
  - Added a binding correction for hawi as it  should be
    standalone one instead of falling back to sm8550.
  - Add num_proxy_pd_performance_states count field with a
    WARN_ON in
    probe to catch mismatch between the array size and the actual
proxy
    PD count at boot time, returning -EINVAL if they diverge.
  - [v1]
    https://lore.kernel.org/lkml/20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com/

Mukesh Ojha (2):
  dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas
    standalone
  remoteproc: qcom_q6v5_pas: add per-PD proxy performance states for
    Hawi CDSP

 .../bindings/remoteproc/qcom,sm8550-pas.yaml  |  8 ++-
 drivers/remoteproc/qcom_q6v5_pas.c            | 49 ++++++++++++++++++-
 2 files changed, 54 insertions(+), 3 deletions(-)

-- 
2.55.0

