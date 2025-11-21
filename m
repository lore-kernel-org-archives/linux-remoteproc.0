Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1616F347BBE
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722895; cv=none; b=ZwvW1rghIF2csZLBxLX9tV7w6iALyHGwkd/JjD9AbFpLvXiez/ZUICnKq0+nqSslTMPVNL+NbkPTxqWLRIauszYioqVHOmVmITWiuOA3gseOeG/4tzfrzQHCYp5Ox5OLY+6vt9ep2RymJoQW5e+2bn5KXuY6nAedfJ55blii0Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722895; c=relaxed/simple;
	bh=4OHWHDjFq2jAK9+Bld2fkj3MwlJ5JU6OOThT1NP9j4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Exlzk2U5q4BFskfMxIHA/+u5yEYZGgU69CStqk4KrhFpRUaiIxhC+i6G1qjqirlCPnYhvZ3ks6ViAAU6M2bmtsIY1tmFl+7ZPFZ2UDPQLmnY18PTa6tEbssN97JDO2l7s65Fg+uMQMeGIPexNzbxy6r6QrzoyLrkcYCN6V4dmQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UPyEXWeF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7S7EC4+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UPyEXWeF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7S7EC4+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL53AB13007810
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AR4qgOv39nCgYv9wQSzT0BQbLvoJwKdb29TlFdA6Xsk=; b=UPyEXWeFnox++Jps
	4cfEqE/nV4MKjvb9BL17/4ELkBp05A49z4fXHO6ELK9ksdBkD7oLWttxgonY1QVT
	DIkBEp/SFXJllulVcYRyAcFHiulxVVDyUmgUnKr/o5m5hXbOqB9AqRHFNYojqxvM
	OMmhWYRtXbZK6TbnzwbjQNADDvsz7DL3SXCFqygFtSJFKrgk7SPfXjh/StX3GMKt
	ql7MIm2qNx4fROaSp3+L36b6SchOndqhS9VRcLiRYeF9EWIXxPpRu2iDfgRohey2
	CRJCPLSc40gO6c4S2D5YWa1rWbvyr2zEJ+mrspLZHi/8AFRauP960K1VEX5C8qxk
	sMZbpg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkf15q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:01:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34188ba5990so5781462a91.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 03:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763722892; x=1764327692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AR4qgOv39nCgYv9wQSzT0BQbLvoJwKdb29TlFdA6Xsk=;
        b=g7S7EC4+IZfVvgnVU0b7MQ1dFY8So1yeAqbkRpxHp6x9Fp5PGdjWJmVrPifZ9BtuSI
         DHXmdTYAP4ssdinDGV2Id4ric3hW6MoazoiK2jIYVT6x5xemrKGQI7CfvQ+vmz+5IrMd
         NjHSnTmM/x7CISzm1kyGVhdNzIqRcsCaCrsFXpeGd5sllgegJiS53UzGwRisGx5wEX3S
         gwj0PvtqxiEbA/e+Xxh/2g/IFDoC7c/gZld9azrp8ptFsqwl5JUt3wPjznKyU3WkL+Q1
         cPKNOWYDAAvNU+7OI1Arl+xaDDuz5M+t+in5RzyeTJOgnWPvTP8oyvkIAeQkIKK7vAY6
         QdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722892; x=1764327692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AR4qgOv39nCgYv9wQSzT0BQbLvoJwKdb29TlFdA6Xsk=;
        b=FKiSoxN+5kT9R+PhNd7AGclzH60FwmV9yS6zYXz39GpkDbT48WCauGqdojyHVUbrxS
         DZmOs6IePrYS3wPihd32OdN5foao8d5SnKu2rru+K/xI5lE/2ntn7LUCBOez6Anceh1D
         oVYqHWrkSbwysYm2oeuY8TtUHatZhzm+/9IeHeug+alDNX3Bj51t8tujioxF/sahIF9T
         anUw1YfWJGOuuiv+JcYOfLdFghswu5mh8WzbRF+J2+9yHOkpt0ztl+XANbJtMx8rgj3S
         oaJ6zDRB/7Qkrhpl87vD6KgFHYs0M+9uM4HpHPwrC5e3nudvVrdA7R+A9/7PhlksxEWU
         M36g==
X-Forwarded-Encrypted: i=1; AJvYcCXo405sv65p5cN7g+l0MBTjdG1fb1U69gX1S+Aq1HQ4+LcUFWAgPIN93VnIQsGqMrqPO/xxUw6m0QIMxJEPXuN/@vger.kernel.org
X-Gm-Message-State: AOJu0YwUQQoheEAwD+jgAThBV0sGCjQk1diZkhR4+p9XUj9B2bg6xhwS
	nUIm8BxLxP+NGiZ8wySaLoO5uE4SR7X3ruDty63t/e7KNoVjy7zeSeu4E1fPAeqA6O2wKb1ixsY
	QctPxwaMriZL5u2+CVH5o9M8RMOkJqj1vZwPdoTEQzcVnwU6ZLSmO0Yi8CPnNckDUb0EGX9WF
X-Gm-Gg: ASbGncvy5OM3iH2JVe0iwyGEm65o34kCxn/UN51BfHvKcH7xDixAy8lJhFNdMUs5KtK
	ReKcWJFmDVB0xHN2yoQJO0waQ4xqmfQAd+x3O1ttsVWzPEmpUUowOhHYAt0j2ohPp3AeNE4mndf
	J6kvJsGuUvNnu4xnM8u+9Nm5DRHJczOBXSIFw9yt0U6MllSJLmp1U43yeHU3Qq0JxbRwMhtICzj
	A3gxFhiM1je5D0X0vgtmwi7+NQpzrv3aqIS+Hl64dwtZ7LnDRs5KWX+EVG2R/K0bl99C/pxEDc7
	wQyWX01Gq8iKAi5g2v7YCc1G2u3re3Et1couEuVFjO+YhHnpQUw6iRdoy6GK6YOtZ5t3bNZEvnc
	JqXGPVCLWs6UUf48sCJVxYw==
X-Received: by 2002:a17:90b:1c01:b0:343:8242:fbaf with SMTP id 98e67ed59e1d1-34733e78facmr2353050a91.10.1763722891802;
        Fri, 21 Nov 2025 03:01:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGruYPbxJ0wdUplhScy6yWFlNJDGF+FcjwecZPTTqfMzUPmK0CRo4jwMemUW9ciMslbAW5Aqw==
X-Received: by 2002:a17:90b:1c01:b0:343:8242:fbaf with SMTP id 98e67ed59e1d1-34733e78facmr2352978a91.10.1763722891133;
        Fri, 21 Nov 2025 03:01:31 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm5191165a91.15.2025.11.21.03.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:01:30 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:31:04 +0530
Subject: [PATCH v8 02/14] firmware: qcom_scm: Remove redundant piece of
 code
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-kvm_rproc_v8-v8-2-8e8e9fb0eca0@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
In-Reply-To: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763722879; l=906;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=4OHWHDjFq2jAK9+Bld2fkj3MwlJ5JU6OOThT1NP9j4s=;
 b=dSHngmywAeCxkVUyGHNZ52W/H47oY9IZYWvOLGsaNXZVJ12FK4UbAJpJe+SIIuVo7yvE6xIhU
 LVHtc8fpvb8ByZ/ZaloRyGt2ND1MZX0KyqyNBk//tLCaQ/9Mrefx7zF
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: O9XHql7PtXTOwCj2PtT86L9BB7zWrCao
X-Authority-Analysis: v=2.4 cv=ApPjHe9P c=1 sm=1 tr=0 ts=6920468d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pWxEDRe995Kf1ot4LjYA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: O9XHql7PtXTOwCj2PtT86L9BB7zWrCao
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfX6fyCMDQkctRG
 3OAA406bjdF9eNb4Vthut3Hu5zULNfbWmz57ybo/2mfPR3Rq8R8MLLekYs24vWxJhGC5FuekCdP
 76YjVt8AoZiRtCN60X3DfoXDZASbO2ZgmtAKktOUGvW54UOKTSF8kdKCV7lSpDCdip1YQnG/5jD
 +xR0ZruUB7JlhyBBRxZx8Fpnyl9yuDj3DaRnqbSzcY0iQkZJYabEp51N/UiSkg5echcjSo4Fyj7
 QBckNUqi0/H1hklt2gyjmYdVu5Osn2XvfszSGUwKagUdyxgMPP94h6Im7VE0MOWvrxiYrsVPjVX
 qmBDb+OnhaS/TEq6c/nbYQK120wuWQC6JM7fS96cB7vpaPL/boUVIhy7JP2SEXdMA5b5WGj2+Hy
 iDIFau80niw5Jks0NiOjbDOk16thrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210084

The qcom_scm_pas_metadata_release() function already frees the allocated
memory and sets ctx->ptr to NULL. Resetting ctx->phys and ctx->size to
zero is unnecessary because the context is expected to be discarded
after release.

Lets removes redundant assignments.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e777b7cb9b12..26969bcd763c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -650,8 +650,6 @@ void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
 	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
 
 	ctx->ptr = NULL;
-	ctx->phys = 0;
-	ctx->size = 0;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
 

-- 
2.50.1

