Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABE725CC75
	for <linux-remoteproc@vger.kernel.org>; Mon,  4 Aug 2025 12:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754311359; cv=none; b=C89pikDc40D55hAqGowYZlfM0nAFenoXgq+3xVRc9CCbP+SAhxI7cFicEkBzQG8Byk1tdbCARUa0kGkcrkx7KmXLkUDhbaS4DR02HNm84QWGumm1gOYppeadc/J2eXqAE29hN9kRSLz7xgvnB10TAiHiiqMBlEigVGUOVA9R3Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754311359; c=relaxed/simple;
	bh=Zji6gWmkzbwh5PxX+NoZLoedb69oac3dHlD8eqjUIwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I75cH3LxLjbe/iBPlaw4WgVdz2gPvu9B7ii2xaoifiY9jJGto83E+p7+kQNHJ+idBqjBDNbg1Sl1dD43yTVueyg1IxQDWtIm9MeikONeAR79ASarkmaikhgsq1aCpAt5uGTWWl+oZxHj+FvupMeFim02L2fvNCvjanazf1Yplxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7exVIPz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7exVIPz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5748Gs1v021687
	for <linux-remoteproc@vger.kernel.org>; Mon, 4 Aug 2025 12:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YQrPurq3NapPqGpZBcgGv8vx6+jrShJaV70ukg80F1s=; b=c7exVIPzI2CFB4ls
	Ro2N6hcdmo5XpVL72/kGHGM1JKERmRO4KImd5QS1fA7jOvTTIQ2Brk0otr0TH4Rm
	SDNB2zfApdSXkumuBKqeN1whURkT/4lvJxaFmPX+u/kcfDxe5pkHEb1WP1vQlscG
	W/uO/ySu9aq6UwXZmdLMKik37WxNJqPJRh6qJ9O7+LzJl8d9ydl7O26qTx1+PbNw
	6jZDf/tvqQJkCFIcrHZjNJPv4U5UHz5Pm1XZ6wJ38OxGyW+g0rZLiXuF5g2IXkBM
	wAs8v9UKV9g+ZJdhuhz3qoPet/nEJwQxDUrSxGG3TDQwGum3MXwFZHCi41Z1KSDy
	tk8wSQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4898cjn7hu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 04 Aug 2025 12:42:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2420cfdafcaso34043145ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Aug 2025 05:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754311355; x=1754916155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQrPurq3NapPqGpZBcgGv8vx6+jrShJaV70ukg80F1s=;
        b=XsMj6S4DOfWWHszphz+pUxniBblQIyjogjCXpBWdNHOTds8Pok12SdUvTxiat+xFkC
         MLxBcOQMsN+YoKM1/tbAT4qoDWKFsNMPmffaBcWQzOTn/+HeQcKP2COWD5a2B+jmjtVP
         8ZfoPSDBFCu0/73fG+m93EfO1NIYVp+dyDGEBoib/6rsxmeSBaweZt/vsLl7PY8uD9Dh
         3HGfeLPhArwm+gyh1zCBlm+8sxq8TRSyJS7u7wzSRJpd7xlmpZyG2IXEIKrBvyus6q6w
         EMtE8hysac49M51kB5fjWmgkHUiB5nC0s7yVad9KTWrz/ZArW8yTr+tbH/GJNkD13sBs
         FoFA==
X-Forwarded-Encrypted: i=1; AJvYcCVd3jbUy69BBg2EJCcqNC6Vdvfia+bdaQsKBYLHdzT7v9VV4q6elnCgjHinrLtGfYdtdjtvcBVOoVE6Lr/vSH+n@vger.kernel.org
X-Gm-Message-State: AOJu0YyaKurXyRUFJ+mt6rEldoK3dXukfq61ycVKaUZZPnhYOU+K13q9
	9u+HqgtO+bsHZBgjE1s9tM1wgOfu11i1Nr0Jb0dv8N3UfaIRygIXO6eu4zkq8X/E/mnTDiCAKux
	IM7FchzhugOqrFv0ddl6mzFjw0j859bo2q0bjGBGNLxzTyK8giqg7BRV0xdo7/l4QQ1qHNaSl
X-Gm-Gg: ASbGncucxMnqj6t9M2hQWlqAbCttWxN1OsC6yU+lDMkHgv0LqnnQfNzn7vQIVHeLOBZ
	kSAVSYOn2BspaJXqlfgCVLQCtdc+TgIgsW7G7ihmFCYBhD5Prdk2YNJOx0BOvdIrkmh/fFTubJQ
	7Lm5rsXygAK6HQdRjfFR3vqy6vxu+EINeomVk6kFvwxak4gg7+TxPyP3wUcpogpdgHknwLqd9oC
	WRzpdJw5jFubvhSTpj68t1WDK82sS+WqcoZqfAoWR7EQVkh9oxQjJOjW01dSoHy+Pps8u2NC1i/
	zMMX08lAaprL6PcLJt4ZqqcWmaRqI/oCiPaeM2JOlTLctcM9JQY7KdEVzD6M/HXr27k=
X-Received: by 2002:a17:903:228c:b0:240:468c:83f1 with SMTP id d9443c01a7336-24247058a7amr131956935ad.44.1754311355578;
        Mon, 04 Aug 2025 05:42:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwWJixm0otAsJ9qW2cKHM5TCYbaZzSEpD0epevLuvlVXQCQHHBcVIx7oFmDiJtStYDErVyGA==
X-Received: by 2002:a17:903:228c:b0:240:468c:83f1 with SMTP id d9443c01a7336-24247058a7amr131956605ad.44.1754311355161;
        Mon, 04 Aug 2025 05:42:35 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef8204sm108876365ad.34.2025.08.04.05.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 05:42:34 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 04 Aug 2025 18:11:49 +0530
Subject: [PATCH 1/3] soc: qcom: mdt_loader: Remove unused parameter
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-mdtloader-changes-v1-1-5e74629a2241@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
In-Reply-To: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754311345; l=1741;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=Zji6gWmkzbwh5PxX+NoZLoedb69oac3dHlD8eqjUIwc=;
 b=5CMkHAbsehPVIWOSELTxsgownCEReC5ZwglVfyzW/9eIgQs/XNLDj6ZF1qXsM5VdS+WuGlu9N
 zC2G+4/yH1sBnaZYv/g3O4obeXNlNDL75iSPYKBPO+lObmjTYAqQATn
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=MNBgmNZl c=1 sm=1 tr=0 ts=6890aabc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=4mQorhOTa8Yjjd-mLDMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 4ZLOKqaaTzJPJJxska9s_w0MuhttAFXB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA2OSBTYWx0ZWRfX+c1Fckh1CONL
 9CFNDYRScgqAG8L9xJ9EeS592gdtNQQ1en73BT634uwMkJRYMr15Yg/I6OHwqNp1so4DWdaSMoM
 rDT1yEEEkm6yyWizlK+MqzQGN1EK/WozdZ6KMtIPSkBUUcSD9rdLUakC7Ama+vNoyX/Lk+uKTGE
 BJRyLYOl1cIDI28bjMJfallUhax8OiKbfOmhXU2zGhF9eQ2tSMqTnD+zxdTSdpYR6VJvnfHKONX
 WG1UKsbFs/NXKfB1DSqQdoEBQMeGVcB77Y83kECj3/g+7AIhrxSpnTYvtM3NePv0j0JG4mk0tHT
 ehl1XHOlhf1v37445zfCiO9H95k6vhzj0KTLIxzVU8wEEaDIzfMg2PDsGnJNk3UhnwQGCrdzkWx
 FyI6H2u/0QWrUSSJMAwixdamUoVjAr6qkOfuhHygZtSQk54JS7uzs0jayXD6B92zKw5yYdmo
X-Proofpoint-GUID: 4ZLOKqaaTzJPJJxska9s_w0MuhttAFXB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040069

commit f4e526ff7e38e ("soc: qcom: mdt_loader: Extract PAS
 operations") move pas specific code from __qcom_mdt_load()
to a separate function qcom_mdt_pas_init() after which the
pas_init variable became unused in __qcom_mdt_load().

Remove pas_init argument from __qcom_mdt_load().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 0ca268bdf1f8..dfd15d189087 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -333,7 +333,7 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_na
 static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 			   const char *fw_name, int pas_id, void *mem_region,
 			   phys_addr_t mem_phys, size_t mem_size,
-			   phys_addr_t *reloc_base, bool pas_init)
+			   phys_addr_t *reloc_base)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
@@ -459,7 +459,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		return ret;
 
 	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
-			       mem_size, reloc_base, true);
+			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load);
 
@@ -482,7 +482,7 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  size_t mem_size, phys_addr_t *reloc_base)
 {
 	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
-			       mem_size, reloc_base, false);
+			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 

-- 
2.50.1

