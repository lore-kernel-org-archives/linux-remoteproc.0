Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFBD336EE5
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 10:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030199; cv=none; b=CotBhgnYca8jfdYOkIJj1oy+ETaucy0h4i0khmdt7Gl+O8iEzC8ZuXSgen4hpj1riXJqTdSz9RG6s2MQV2pMXJYPMBefTYbZ8x2iG1k3GLlnzZC8EzcmeEyQ7ilm9KxsmwR502uN3VYU2sonJ923CUm8QWRnvlE7G8FXIz6yDo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030199; c=relaxed/simple;
	bh=sR2Ps2lw9nzZ+bYua3j4sYHBEEiYZdHNjXgtG1qfdqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NhwrvT2HDQWLidUxKZsjs0RazW2hiRwtic0NdNjZlcQnNb7FgNrxvvfHzgqYKrnYdcvoGmuaosajpxLbvnEzzh6JWKBTIkcASM3Gq2XL63dyaf8kmbmuwfugMI0T+WW4gP06EunDeOM58OT64F5CgOfqwvgjYNXgaaKxyLwYYNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjIwNnrx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cad+GRJ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjIwNnrx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cad+GRJ6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD5SM5k3440860
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 10:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+x3WyP8FcQUjHqUOnYmnesnZx4d2cDTurzD4JP7xHo=; b=JjIwNnrx61Mm6Tzh
	s1Qrt38OMRUDarEuZTDP2kyKNmQAbIvYvkIWjH4ayd53QYkNW0l68yYxOPubsGY7
	GTQhA73MQgw/7dsngh1zlU+qhCH6/XSCbjCBwq5uLSBKJK7W6thXXXZMNxa7Xucl
	mddu7EogHHuIkbdh8qzhUnopD04kZm50qbn7vkaKOlyA+v61ayfXVxEK+ZfPX4Kb
	ClTM5F5iOfZ8U4npksY5Rkofjj3VcZkCz7l71fL0RwpwzHyziswiP+tFXsGu1hYl
	l4sd6TaaoxRQC/jAr06Cm37w9I3Vl6o1bJhvJeur/ygc1SNkzpnCXuiL3UgOv61f
	QBU6gQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9788ybj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 10:36:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a26485fc5dso673390b3a.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 02:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763030195; x=1763634995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+x3WyP8FcQUjHqUOnYmnesnZx4d2cDTurzD4JP7xHo=;
        b=cad+GRJ6p6eN7Y4d7pvtnKiv0ljZTs46OukrwBGK+AKsPJI+ZiuHf8Rdx2FzXyVeSy
         uTjtuibJLUx29HtgQ6c2yr5BEZ0CGi4bR2boIjpeZ8cn/S3mUG2wcrJhBOyIk++h4Br3
         YVl1h/7mr3KE+0KgQlcnpBb/gAY893vMiXV2VYHTPGQDlEPE9ICPf55n9/D9oGVINOlk
         HAe1megVNRyKwMTpeiaTFj2a/n89bh1EqlH5KJQRDSjwVSCQbYT7M+T6YVrA4LP0LjPp
         CwU0etju3BnYhmlGHy1tkwLBmPi0H3VsnawpeXD47t6rL2wYxxdfre2Z9W9pIDn2VxsQ
         oY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030195; x=1763634995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S+x3WyP8FcQUjHqUOnYmnesnZx4d2cDTurzD4JP7xHo=;
        b=CVVsD/xG+ZfuLc6dLjACgvOdheCxubn7UuI5pq5R4N01WCQwWY1HAVjoYs8rs2QzvW
         oBO3R1ZGYb5dTmC3RmIPwiOft/ShI4HRmrnywFiSCcsSbNssb/QoPGGKQpT01GNL77sp
         4UGnK1rtPOJv+WA0qI+JDBgeOyO+MJ3pd608OXO60G3MuhiVq7jvV8zWN22ag2kirFH1
         jIt8qMtL6zbrCViarZvxOhSuJClM2GxKcnUOLbvpVvPrcG9ZE6oGPqpdRhiAwR3OTPS8
         KJgt07qk1UQX6wVmqTrfoxtgZA+XLkMEs8jIjxTsE74KnFDFrwqpI2JXA0Olpc6WtO81
         6SVA==
X-Forwarded-Encrypted: i=1; AJvYcCXCQvzeEj4m6s7hbcRGCYDJInm+OEi8BGQ8GuEctsoJ+iGddtqTBXhsAXF/aISKr/KiuX0ZFT1CIw0OwDgBZBif@vger.kernel.org
X-Gm-Message-State: AOJu0YyTTW2lBM3/oAg/YxrRfPltTUOBGVC2UgH/PJclTk3i/ttW+60P
	FOUPcn33mwg5H3sHXtNDEDqOYpdJhEkuz1+yxbnCTAf+0S++6GlAFQO7SOMCHf9wEECpQPHHpV1
	Cg3yDgCHAuwyp9Nh9IbMBtx7zoLrMPrpEwtXxTiyqesCWcZ2yEqXTqw4QiXE3HLQ8FF77hWiw
X-Gm-Gg: ASbGncueEzlcZ5e11Iz1Hz938l894SxIBJCELOwBCLdCstOpJdrEO+ISx+3SXacuZD9
	XvTF25vO8GoPu0opo1q/pukw5jZ4pLY0hx9P8mI6ersFe7PNZMNpYk9IQ2wAsGD8tbj+skZGqCK
	Kqg7Q3FdPZkd4+dOrsw0E9pFGOa6BCFROh8D++NLiOLv90PNP1Fn6LC1Me96+QMSTn1QlegEBBG
	41UoBmr2Z084BZ7LQUbOUZzmxa8kSEOGaI01GhzljMWJBZ1mSpqHhDjhU2T6ZnfUa8aBFu/cC9J
	2cM8bFPU2TnnfrAhVQRZZ+HWemnXnysDblkQaV/C18N71FKiRxvUd+47iP6cPjA1zkaxLOpw5LF
	thdk0BxkA/jUwuetqLtiH64BePA==
X-Received: by 2002:a05:6a00:12ea:b0:7a2:70f5:c83f with SMTP id d2e1a72fcca58-7b7a2f909afmr7233640b3a.10.1763030195099;
        Thu, 13 Nov 2025 02:36:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIiAV1A4E1ud/5n0c893Cjn+gwxzkTEe2Xfpp4EgzeF/5jmXVI0AQQf0DDA0VLVXEF8QQx3g==
X-Received: by 2002:a05:6a00:12ea:b0:7a2:70f5:c83f with SMTP id d2e1a72fcca58-7b7a2f909afmr7233585b3a.10.1763030194431;
        Thu, 13 Nov 2025 02:36:34 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250d2d16sm1886922b3a.22.2025.11.13.02.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:36:34 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 16:05:57 +0530
Subject: [PATCH v7 07/14] soc: qcom: mdtloader: Remove qcom_mdt_pas_init()
 from exported symbols
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-kvm-rproc-v7-v7-7-df4910b7c20a@oss.qualcomm.com>
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
In-Reply-To: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763030164; l=3542;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=sR2Ps2lw9nzZ+bYua3j4sYHBEEiYZdHNjXgtG1qfdqo=;
 b=Yj547KL64hO2JMhCaMZvDrLUIU5yZdFC89NxuZ9uOydHfVOSzDfU3Z7X+WaBywJu/ywOaHZKw
 ehEoumiE9A7CwGuHC0BAP35lqq5UKZfF5gCLb4u8KW8pr0GQXSBJHWv
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA3OCBTYWx0ZWRfX/GKHVnmF2TCe
 oJC2k5cJlKPkgpBd7D4Msn1afEXXVxc/NX8ixoqHnV7tKTffh400qYn91gzOQ2hx/Wqkx5cXDbq
 QOwGARDernY05tPjlWPIYBKKJjxMWAG79VxBc0iONqwtnbY4XVeglmf3MP3Wrf8g27++jmr2frl
 ogaUz6LCypz7VUxACRkU/M2f61XnTspWyGV9nZQGmQXT97xZ7fasIhwQY/Jd9bmVUY4dZaDnUIA
 RQU831eUNZOkjcchKgvxvFtGuLNEsYIzpujJLnzDJ6IRD5Ky9UeIBkPhOOMXQosqm0d1srWXO+N
 KNe7W+3fj4ynu+0bm/BAgY8Adbne2V0g6Vw1vfmJKsO95rq3F3cmS59FISAGQppk33FEi8yp0TB
 WaFO3599vgsAdaCcctnlLXnDThIwog==
X-Proofpoint-ORIG-GUID: OkWUlMYgW3ejR8FYQOj12vrhIWawJy8q
X-Proofpoint-GUID: OkWUlMYgW3ejR8FYQOj12vrhIWawJy8q
X-Authority-Analysis: v=2.4 cv=PIYCOPqC c=1 sm=1 tr=0 ts=6915b4b4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Z4Sw7GGoVt5sTUwIiKwA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130078

qcom_mdt_pas_init() was previously used only by the remoteproc driver
(drivers/remoteproc/qcom_q6v5_pas.c). Since that driver has now
transitioned to using PAS context-based qcom_mdt_pas_load() function,
making qcom_mdt_pas_init() obsolete for external use.

Removes qcom_mdt_pas_init() from the list of exported symbols and make
it static to limit its scope to internal use within mdtloader.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c       | 13 ++++++-------
 include/linux/soc/qcom/mdt_loader.h | 10 ----------
 2 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index c868b9c416e6..13b52b8064e0 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -238,9 +238,9 @@ EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
  *
  * Returns 0 on success, negative errno otherwise.
  */
-int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
-		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
-		      struct qcom_scm_pas_context *ctx)
+static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
+			       const char *fw_name, int pas_id, phys_addr_t mem_phys,
+			       struct qcom_scm_pas_context *ctx)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
@@ -302,7 +302,6 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 out:
 	return ret;
 }
-EXPORT_SYMBOL_GPL(qcom_mdt_pas_init);
 
 static bool qcom_mdt_bins_are_split(const struct firmware *fw)
 {
@@ -456,7 +455,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 {
 	int ret;
 
-	ret = qcom_mdt_pas_init(dev, fw, firmware, pas_id, mem_phys, NULL);
+	ret = __qcom_mdt_pas_init(dev, fw, firmware, pas_id, mem_phys, NULL);
 	if (ret)
 		return ret;
 
@@ -508,8 +507,8 @@ int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *f
 {
 	int ret;
 
-	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys,
-				ctx);
+	ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys,
+				  ctx);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 7d57746fbbfa..82372e0db0a1 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -15,9 +15,6 @@ struct qcom_scm_pas_context;
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
-int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
-		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
-		      struct qcom_scm_pas_context *pas_ctx);
 int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  const char *fw_name, int pas_id, void *mem_region,
 		  phys_addr_t mem_phys, size_t mem_size,
@@ -40,13 +37,6 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	return -ENODEV;
 }
 
-static inline int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
-				    const char *fw_name, int pas_id, phys_addr_t mem_phys,
-				    struct qcom_scm_pas_context *pas_ctx)
-{
-	return -ENODEV;
-}
-
 static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 				const char *fw_name, int pas_id,
 				void *mem_region, phys_addr_t mem_phys,

-- 
2.50.1

