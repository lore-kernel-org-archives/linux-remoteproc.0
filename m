Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6B23ED3CF
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 14:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287905; cv=none; b=now1R9tPIT96Wrm82KaHcbbgSX+3QzwmFAOF7EMRZRzOr1OvW2UjHBnRMy2tLcq8E3CwUYxH3bNoOzS4JPjZ/L+wb66RaNu8ha47L6K7UTkp4iTmfTckRr+mjrMHMbEn2dGMYcaW0ZJDUZRNEw85xPni+S9uG4UQKwRaLHw+gS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287905; c=relaxed/simple;
	bh=FsVUdbSzSx9jPUGY2s9OqpULF/+wIcka8xKo7D0C9c0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H49ff2e3KavvzSy6RiFIHlGAAOnWW3cDqXSe4xkHLi4bd6Kjtlax+sUYMH0AQma0dGG4rHIVDoOxUorRlEL6Pa+XtV/CtEzqkkyTqCOWu2Uo8VekkbTvAtlZrOmlZCsibAnkYwzOJwlWLqmfXX5LEbunEJR+qQbtfwXt15+xHKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZFBsK7+3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UBqBVaIa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFBsK7+3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UBqBVaIa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDuacI3680440
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 14:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yKcmQDfR/npPKndzl7IHMRMKYE2zN4P2OcICOy+8nwI=; b=ZFBsK7+3P2CsvLYe
	KZAGOk7uAJK+q0wx9YoSmZgIqwseZlAlJxh8LI8bqPEQG7iL0O6yZdbUMuLLbQOs
	gbtDFnLqjlvfI2BX0FS8FkE5cJNiAIwrB3JWz7a5HtVQx+NzJNxxP8EXz9NnSdJr
	ZvymeDupZfDx2cr8rK3f46eAmVGL4FYNS/1NCq0keFHQdmx73iJ9Ohb2c53nebuL
	TwOH3+bj1VeF0WdkTjAEIg2ZiS18wLkofIMzxif2a5+TTFssLQTBrgHe2FLrAu76
	TKrDyBHnIYxXQ7cjDZk6JMS0ztqIRgo+U1LS0olCosQi1EOuT6iK81ZrnkXv4u9H
	90LaRQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j05h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 14:38:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba718173d1so79805945ad.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 07:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779287902; x=1779892702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKcmQDfR/npPKndzl7IHMRMKYE2zN4P2OcICOy+8nwI=;
        b=UBqBVaIagSCXWlWK5/+HfucJ7hNGDjRFpCA08MFhgnmHSx9g14uaruYj2DScoHbDlz
         hKyzlVdkY/cZVxNIkJkDcDqZPMej2LuI3BAhcq7c2uUWqQxV8KxCR3zf/F67oLTDXQ9t
         v36/TBtiKwjCCttZ8eJpBp03j3TeNohhe0cyD55w+1riyzkGFFJ88Io3XE1rE5/GPl59
         FZGewg5xrKdmJjXCmJMLKdR+yaE7oy0LpZDCRQc+0CrN0VDvlN0we87kjJQ3okxEjnhP
         zenU4CZLybRgqnrHRjQObMJbhUInvQmnzMndgCMECQClDUZec9Nn1W05uicesC4/aDUo
         WegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287902; x=1779892702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yKcmQDfR/npPKndzl7IHMRMKYE2zN4P2OcICOy+8nwI=;
        b=INIGCYOqZCozMRPP54hMf4hOb8rOPbNM6rLThEzcmvknUAxvBoPy6Rww7cUiu+Ez/7
         bjCvJoVzgo/pIy/agX1Ror1N6IzT6/epXnDVGotZngrGw4oMO0kc3Y1AygoZ+wnTalNb
         06Jd9dbJm/wNks+31MNaTn2V3jS9eFGCgDatxJS2K4f24xjUe9yRutYkzOC8iYx6oWTv
         SB2lrZUL3rdxsYn9DOujmvCoSwf7vK22UmWIeG0jrpRUqvS9BTibwuDaYAUCqbglK37h
         QU0CEwg4RACpn55slJtRenoAeXjd5PumHvk8Tf1yQVUZtOwjb70NMF7bopNsP9H33cKF
         rLyA==
X-Forwarded-Encrypted: i=1; AFNElJ/4F7YwP3ZXLnU6ONwyZ5hzfs2GC7n/qXCfqF6b5sZE3ZStLxcXo3Ew3u1sN/r9qo45yhDawoAiIv2BlBEqEpLM@vger.kernel.org
X-Gm-Message-State: AOJu0YyCNwa4qzDhdwTs37m1h8nB5wzSl+EG4bh0mzRdMaEzJdX8KrIj
	sj1+k6I+UZAxweZD7u1YlVvkcJhABOAcTQmeQ9LWnt90LKXEKNtoOuZOXUHaFiso1cbTIclrt9Y
	64rSeVnxf6UxKISuk8civ+jbXuLWY2aiuL/puvn30DmBkkBM2428M3npGx3tVuhYKRfquCjfd
X-Gm-Gg: Acq92OGC4IjQATmJtu7ERRIMwShePVk+gfgFx7vvFBGtWV4POZbaHLYdPoUUHElZtVH
	aX7no28D9U0MNazrJo8APG9rNXJmKTN6Z6cFTBkzSwpLV6Uo8Dsotb7eEtDvUY0qpzD3DWfXzti
	bJzaktCxlhck2Pj6hu9+52Rz/HKaLd5JpT6DBhG1FuKrIrYyHk5nEYRnmwFkf38KxS8HA1XRkhZ
	13YMCfRUSz3UFxZSe6re1UwR/B9CU94VXJotWOHcD0/A+Zdk2EBzxuPwgrwj2ExwEaSkpA115rB
	g6eSf2G1z+R8jlO9wFGlgTp6odXsrJ3OjiUI59OcHhoatQj8xk0EdGQOwZW1DQqxRZJI4u3tMKK
	82omTCN5At4h/qyRQKy8QMddXWysPRv+acxqb
X-Received: by 2002:a17:903:2984:b0:2ba:67f7:9326 with SMTP id d9443c01a7336-2bd7e81a6c0mr261769445ad.9.1779287902456;
        Wed, 20 May 2026 07:38:22 -0700 (PDT)
X-Received: by 2002:a17:903:2984:b0:2ba:67f7:9326 with SMTP id d9443c01a7336-2bd7e81a6c0mr261768975ad.9.1779287901867;
        Wed, 20 May 2026 07:38:21 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fc60sm232999015ad.9.2026.05.20.07.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:38:21 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 20 May 2026 20:08:06 +0530
Subject: [PATCH v2 2/2] remoteproc: qcom: pas: Add Shikra remoteproc
 support
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-shikra-rproc-v2-2-583a2e413a3a@oss.qualcomm.com>
References: <20260520-shikra-rproc-v2-0-583a2e413a3a@oss.qualcomm.com>
In-Reply-To: <20260520-shikra-rproc-v2-0-583a2e413a3a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779287888; l=2606;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=7Vr/MjWP11ciYBD6+jT458Y7hd8+s57u0eTOWIEG8Iw=;
 b=yGueLdjKiGsrG2uBFpIL/4+BqONi2wG/5HoZTOs8Yi5j2yo3dIiOHp6/BMsUDKmzYm0h4+a/P
 lvE6DGUi+PNDzznC3HWUYZG/5KwxCGYE6/jbo8GPF1sresPOyTPPpG/
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0dc75f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=5sj8McGL5gorvj79y9wA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Y4NbeyZ3IMaDuE0HbjO26uwsYTVqh_my
X-Proofpoint-ORIG-GUID: Y4NbeyZ3IMaDuE0HbjO26uwsYTVqh_my
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0MiBTYWx0ZWRfX/ACLuW5k6buE
 nxdEOmYCCu1yIaYl4IxsXyYffu9F4j7FjrXB6GdBXuNxgEOC7re1Uz4PwKDgddsSq/XdHz7jDJT
 6jmP3nVglehaV5Ea4bfdItxnD/RJR2byNxjMtTEut6RQleVExuFMUOd2ShfDa4jwBnpGROY69dm
 w2qI0gdVJcT2C4KLoX667cQ6/owAXXHAHaYtiFStO2yn/dvifCmSwHvy9wvqlocDXIvj9ZLf9mq
 kz42s6aKtze7YmnRX99uOQ248b45ChkndQ+16i5DyjEn5T/1HwRErsFxgz2LdyQixIjTf1xyfJf
 Z7iFM8P7ktjeCCgY1zllK2h5/lQ034cIyC59Ztqp7AGTyifIJZR6mRIM+oVTQzGghBMl5s6sEfL
 dCmaOAAqv0pal6FzRPkVURgIa9GXqy4PHojp0HJv9zR95JSxtqH5LYAl5s9lZolH8NJncbUYTma
 Q1/5k1SwtJd1hF5YbhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200142

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
for the Qualcomm Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..0101f1db6458 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1457,6 +1457,51 @@ static const struct qcom_pas_data sc7280_wpss_resource = {
 	.ssctl_id = 0x19,
 };
 
+static const struct qcom_pas_data shikra_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mbn",
+	.pas_id = 18,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char *[]){
+		"cx",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+};
+
+static const struct qcom_pas_data shikra_lpaicp_resource = {
+	.crash_reason_smem = 682,
+	.firmware_name = "lpaicp.mbn",
+	.dtb_firmware_name = "lpaicp_dtb.mbn",
+	.pas_id = 0x56,
+	.dtb_pas_id = 0x57,
+	.minidump_id = 0,
+	.auto_boot = true,
+	.ssr_name = "lpaicp",
+	.sysmon_name = "lpaicp",
+};
+
+static const struct qcom_pas_data shikra_mpss_resource = {
+	.crash_reason_smem = 421,
+	.firmware_name = "qdsp6sw.mbn",
+	.pas_id = 4,
+	.minidump_id = 3,
+	.auto_boot = false,
+	.proxy_pd_names = (char *[]){
+		"cx",
+		NULL
+	},
+	.load_state = "modem",
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x12,
+};
+
 static const struct qcom_pas_data sm8650_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
@@ -1571,6 +1616,9 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init },
 	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource },
 	{ .compatible = "qcom,sdx75-mpss-pas", .data = &sm8650_mpss_resource },
+	{ .compatible = "qcom,shikra-cdsp-pas", .data = &shikra_cdsp_resource },
+	{ .compatible = "qcom,shikra-lpaicp-pas", .data = &shikra_lpaicp_resource },
+	{ .compatible = "qcom,shikra-mpss-pas", .data = &shikra_mpss_resource },
 	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,sm6115-mpss-pas", .data = &sc8180x_mpss_resource },

-- 
2.34.1

