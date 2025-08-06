Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC87029CB49
	for <linux-remoteproc@vger.kernel.org>; Wed,  6 Aug 2025 17:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754501164; cv=none; b=rRoU9IEkiBMtiGdHyDJSMFNh/FHdrvE71mKjWSLaa31A/9641Te/zfskOjsXE05xr6fhep5NpA8FUiOORhm954d+zjSb4TSkUdkR1R+ngvYT/FfDaE38OHte+OUxY8SwmC/hmy6bUn5XQCPjuJqt+eAgswrecJap9HeTwQFBX0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754501164; c=relaxed/simple;
	bh=/1A3AZW8hBz+ePcaAFDA5TXb4qWtbB8oRxr6QzIn/VU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VS4n85j4g8pKt1n2boJKHjVdqLC8bUwyTftUE6l8mYCuuxGn02AfTLoK0WXBumwb6IlrR79AaoesQ5qmng76T2MLly+v2afxOqm06TaxRvpupDA5HJuC3FrlkRTIs7ljfJG8hNnee6CLWA85Sh8Oe58ZaOGKo1+4bojCM+zSNbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fFeiiefY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fFeiiefY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576D4RwI019919
	for <linux-remoteproc@vger.kernel.org>; Wed, 6 Aug 2025 17:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J0kwO+XKJcI
	CduSLZe6gBnukQxiZjQuG4QBPhp437sQ=; b=fFeiiefY0RsI7pQ1xUM5u4gvUfC
	83C+d83g5mv7YxoOeChfwb8U6FcoCHJAajZKntZMZ/PEFXGNfIOvgTvFJgsI3vdp
	dflKyRh3LP9tA3V70uHXknA1qzw8Fsgw54FLafJmjFjOHgUP75PrM1STzDQF8/kY
	OZHTfvNtcJyd7gZ540hzsA6pOabNTPUMZjpSUQaQVIyXsQdIdWT1/woQMSVwhWre
	xsHW5Sy22MVuZYK2e4XdU0EIsSzISkDNHmw9YjvN7s78wC2mQDXqmAVvl9qbMQro
	U4dEAzfeQl2TDcxZSEJyjNQvNpj0gfVti2l3cWlI0Y/KtEyLCkdsnPLfWqA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1bj9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 06 Aug 2025 17:25:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74ea7007866so147632b3a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Aug 2025 10:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754501158; x=1755105958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0kwO+XKJcICduSLZe6gBnukQxiZjQuG4QBPhp437sQ=;
        b=t0HmYskDlMkmsQaqx+k3BYpvR+aneXC3lUAPTiyisYyjGJv9u1shQdIUxrR1IY5XT1
         7EF+6Wq6IxL9oWKT8yLbANyzrqns9dxF6bvNW8g+tCeT7C+weL9eItNMLZ/GIA6CuMjg
         SCnSgtrkIwS5WnKU7mKgJpGDD5ljnLFQnvLMafFPGLH0cvXqrbNoTYy3SGR/x+aROOrz
         EXdqdnBX4ZzokaqgfR11eMi5JuyR1qzFGeYpRADFuv8pA5o9kwxZ4Y52gZ01iFCw1GS1
         hHWsdhraGNg7uDQeMiMLKMxK/V5kwKt/ZSrsHsGq++4RgIcP3vJJpzU07UJt7TI7D5iu
         GJVA==
X-Forwarded-Encrypted: i=1; AJvYcCXlYOOsXHTHJiAb+ZwJrsj3VSmYWZoiywPKGdMZRU0jR9qBhgbtElSs3B1tf3/NxEwdnIwl+LSEa4E9T95J0Fzm@vger.kernel.org
X-Gm-Message-State: AOJu0YxMxbs5K/YmGd47RtDfKSdRX7/m/3FQcWaa+flC0CV+ZgXqBT3Q
	XvdtyGoTLnwnUp6DsUgLDHRRkkjvX8eeBwqZKC+CW5LBfDOAv4oPRPmoT2MUaAhkE17Sr0oNJkO
	e80E2lkRDfSfRI6L559UtZFUhRj9OviN9/KlUg/jh0y2aBpPjxB72vrCo6yjRAbzehOgljC7w
X-Gm-Gg: ASbGncsnQB073sFUmh2Jul0M+bWnciXF1giTUrEXGiQ1ksNR7+nuKc85ENyQefWdzFy
	VB2slZGMLk+JrIK1osHzzAyPoM4ZprsTgg9A+IbI9TQX9MOr5Ku31WnPnPo68mOWFLqWGCsh3QR
	UCJr2WMO4tVDFIbMHOcxXP4dAEIyJFqUjw30iRMRU+dFcXMQyUr8kF27mOwxetgLAzUtUxBdBEx
	SzYOalcFpUBIK0nQRv6TdM9WDVLtkUP2dp0ULjwwfYgjpwboGXOZHhBgqGw0NhUxkG/ELdB+ygU
	eKk+onMJZ5msZvlTN21iu7Watz2W73BP/13IUN8W6g5Tkv4LY9ql8cEdcDgpRkRUkpc=
X-Received: by 2002:a05:6a21:3282:b0:240:66:bfbf with SMTP id adf61e73a8af0-24033169926mr4584772637.32.1754501158232;
        Wed, 06 Aug 2025 10:25:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWT5d2tLsPvTIuVLyXkccfQ0kLVQTUDC6+FpAxVXSC8J88CHJa3SlQ4HRxGVe5A5eMdXLUqg==
X-Received: by 2002:a05:6a21:3282:b0:240:66:bfbf with SMTP id adf61e73a8af0-24033169926mr4584732637.32.1754501157738;
        Wed, 06 Aug 2025 10:25:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f417sm15866210b3a.44.2025.08.06.10.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 10:25:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/4] soc: qcom: mdt_loader: Remove unused parameter
Date: Wed,  6 Aug 2025 22:55:29 +0530
Message-ID: <20250806172531.1865088-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX4UUSQ9qR/yOh
 5SludxE84WFPIO+u5Zk2bjpCYI9PocovhCuklk4TGG650HX7iyNpSCD061ni+jJJOOt4nzTBzRJ
 3iIDt+1OSWw6UaDYMwhyCKdV6JQB3xkOVztbDHml4k/UJMyN8SMLc+9NEMStvHlJ7Gru1dH66Cp
 Ch70AS6QqE8QzdRmvBnwXkxpa05c0dCRamhN++y0DZCCWo2ewgs9Ps0P8uajzzouNiOzh1uAcMM
 BCKp0xd39l+LwyJIf49n1Jsl9d0/IXMzvP1G28seHMWx6qn6XKo/YquO0RgYdH02D4AjXRhlFTj
 n+N7ir6mucWcUgSw7jnohp8FW2+Aakk7WAdYSNCBuOJOy8KV+jluoRIbKtI/2BF8TvvLPtQacZ2
 wGRDumnb
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=68939027 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=qLU0tmo_xPokh9XVZMUA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: LPtp6JItvyoZCKYK_hYQSUYd_c06R9Rl
X-Proofpoint-GUID: LPtp6JItvyoZCKYK_hYQSUYd_c06R9Rl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

commit f4e526ff7e38e ("soc: qcom: mdt_loader: Extract PAS
 operations") move pas specific code from __qcom_mdt_load()
to a separate function qcom_mdt_pas_init() after which the
pas_init variable became unused in __qcom_mdt_load().

Remove pas_init argument from __qcom_mdt_load().

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - Added R-b tag and its order in the series.

 drivers/soc/qcom/mdt_loader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 2a14ba9b0fb6..63af3e97c93b 100644
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

