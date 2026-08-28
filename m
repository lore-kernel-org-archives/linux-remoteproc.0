Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5922537AA9C
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 18:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787940809; cv=none; b=ZIyAQ/wLpzZN2lBy/Nqgg3giq9l5gpMG7cWAmo5skiHf7rEf7aD1xhslY50ZqBH+TXXHissV/1clSmIsP5hwgyQJhUGVHqyjBTwLcypr1sYA9UtonQ3rZoEvNx7Ua1/l2dfhbcn0uJvULp/1s/joENRB8vB7C1MwuPNZjfLCpqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787940809; c=relaxed/simple;
	bh=wYYWSG+g5rJxNGdLsHvUT8ALBgROjTho7i+pGT1YCrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AJZzZi98Dt/AbCB9JBn7zT+hsbshYPxGswugF1oVob1eLn+ew5j2/2EV7AuuU46WdZfjIF6e5KkoTLnWOA3PSqDv3/wP7KHVRKSi3EU8mPjJnbNpHejJjRc58UVI//4GMIzT5jwN5BOOofsH6RrM/mg709fVF29/UG/9J756ams=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jr1l7avN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bd1gaxhK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jr1l7avN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bd1gaxhK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SGJxCu3568385
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 18:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6wyeLvY0Aww/5SEbMa6o+A
	s4j34Z6vghChaACXvQVfU=; b=Jr1l7avNibfrw4kGsGnI42wmSGIAInxEJzxfg6
	gBlLqvYw0pj1hn6EG2TI2zlPcE+WvZcx+PONTjAaXQd4kMJ3mpng/kYmyUwZ5TCo
	KTtIjDaOllU3IZO0FEdPGghslH4mu1z4Sd7Nncp+GGaODU4MCicn2N3u9sGm6Ucr
	xwk9SeHYJzdB1YVSRrI8V09HCyazX2bkaPlGPRuuRo6XRR3HgCN3udW38lY2nksp
	xNPoGH/35rOw5lacQr6PRxIa5ndg4eYIXKQiwklKetjYM6CjNadQnimIiN2o4r+k
	u8Dz1daQqKsy5sSP7cYFxkpMPSKmKZbiGq/RTUhTOQEMAWDA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mxu2hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 18:13:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so1573697a12.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 11:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787940806; x=1788545606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6wyeLvY0Aww/5SEbMa6o+As4j34Z6vghChaACXvQVfU=;
        b=bd1gaxhKRQgkzyN0rzDGg7XB5lmcA38u7WzK7+tallo6i4JAw8kSfP+HU5s3DLsnFb
         LtGHae3+czppRsxJI5TsIGpiSWq5ARwTDjQOXD2XqbnAG2Ktn+j9jVmxkIZSqzWyIHT1
         T+JwgGssxxujptaJUJxUjYj8y8pAlBdCEAVUHv6L75I1ZPcXOmfynRxmojC9jw22dqWS
         ApN+voCYbCW0sVZTC9uUMi2ar4FRdlE3CVgyeujR90eO5MucDMosCs9w7raWsT3ODi0f
         GHG1VHSV72phf5tc9QvRHgTNirMLbf2I2yg1W5rn1trES+klg32h523BlTkDTybY0exs
         WmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787940806; x=1788545606;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6wyeLvY0Aww/5SEbMa6o+As4j34Z6vghChaACXvQVfU=;
        b=aGDcVYzyn3DqyFDQJniowdmrkDZ3JP2lWrcDLxxBIbuMdoajbHfHysC2LygLUbqDTb
         +wpjLt0WfwaAgHWDLG6fOWu/fxk7u2s9HQ/QhNxL88X9tcYRZkjE93qhZmE9FzN5pv45
         tPsoIIK3jIB6G5h7g4G5UKToUKxojWaqbmw+FHyptVS53nJcr+ya54EWh8Ov/jAyCYRx
         5DuUbz0pJU4AEJJ6/jAsStpxl1tTdlCmrn7k4ch6dA4egt6aROWi2pArV7ovIwiE1wfe
         31FO4dcZNLuqse0JTt/QSnVbfhGF6CZj6T6tgUAYNoP58ZBbKauDyYhhcBTrl0KezWO6
         srLw==
X-Forwarded-Encrypted: i=1; AHgh+RqDD1T/ab7uuo7n86wQsyZXPr54HDImloURDzLyRSZmLzmpZZAYe79SwOSbZw+uIBcSBb/4cU76nHR2yY0gscjh@vger.kernel.org
X-Gm-Message-State: AFuF++nERIeoWpLSupW2k15dAf7Ozg8OUSRu53C6Eu7EYnsm3yvglweP
	PIDctgPNh0Zp00XZd6Dcr9Y8qRj+b75PL05jNDMaA1SYnyK8mSdhyIZ14AjZlouAIriHXPygDEy
	lOuSQpPaG5Z/DEPeDKyEq3v2q4cPHBVWZiDEEJ19rCmCOiO5AnD2D07K0iKCdn+RsinvAT0QN
X-Gm-Gg: AR+sD12kKQbUVROfbTLzYHUT8hpCYYSOOOe+0V754dZvOGuLABm5E+V/7HcpwJwwMl5
	VcuBG3ryfZXF4TbfBQh3cC3Y9Pg16wCc2E8/UAJIrCT3MUD7hBT68ppdXLbyoCxUpTblhcUu/Zy
	WxfOg3sMQwuTEWNrTsrTtTMATHZUJ5F2aKWOIAw8DxTgUkyA7INhufZPUO0Tz8XCGCoNO09NZ35
	jym+JXrkUlufuZGDV1v8W4+x1eP4JyYJV2v49qDX2SEfkbJgjv1lGSkBKcDRFBuCVZsmv8acX4N
	qVJzu35g/dse0XsX661QbhIjfpmcw2anTqT0zezmtcHmJPYMNDTPxDnorwZ1Ujagt9KrxC7hPrE
	OAkcojhhylP5/Nxkya+Y11MhHjxI=
X-Received: by 2002:a05:6a20:244f:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3d26839c4b1mr17128037637.16.1787940806038;
        Fri, 28 Aug 2026 11:13:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:244f:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3d26839c4b1mr17127949637.16.1787940805478;
        Fri, 28 Aug 2026 11:13:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f784845sm8575600eec.2.2026.08.28.11.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:13:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/3] remoteproc: qcom_q6v5_pas: Fix unbalanced enable for handover IRQ after attach
Date: Fri, 28 Aug 2026 23:43:09 +0530
Message-ID: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE1OSBTYWx0ZWRfXxHqqCSNKf5T2
 ZahGCNvBEiVmV5ZSfEiTvUmkLwfb5B7UeF06jLfZFHZz9rNVgCxM2vyH/1uPzijEJ8py27EUdv6
 XDlWOAUooYNF/Etbs3D0vMxJb4a/wBS16wNr9h9GkpiFjvEbndlCV+KCz7QHsMBcarZPTglK/5V
 zSEzb0OxTYnO6Q+3SWzL+pxcufC3hdb8YtRVZTDdqTxQcJllpVt/qRnERGqs3wTAboVr6vOokKj
 Oxfjk+/kJJuanUasrPIi5dundJV2Tn3vniQSXTQpUxRCRwwi221tpgtY5YtaasAwAIRsHRDZmJj
 QPt3BZUNXp3WAlY0HXFuSRmBIpXcKpu2PuAtLkW606cnjGB9rfTDwCVHk5c34DX4FC9Gb2R0JXq
 wvIGKIaTOm+5vA59cWnR4qYyw3SZD/nwbXcZ6lpbTIa/YUEX5Mrb5iSqLeRlXB2r1AjXJLcAjFD
 Y2gGibd2YUoRedqfTgg==
X-Authority-Analysis: v=2.4 cv=MONQXsZl c=1 sm=1 tr=0 ts=6a91cfc7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YWewlzZ8vdepzDDFAG0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE1OSBTYWx0ZWRfX8VbBJg/Tj0dF
 HA8FFka7eeDqTVcFikhQSocDeKsRzkcdtn8RqH6JRDXfAsFbIvH+J/B5vYGN4qJnPmtdkr4VkBS
 c35dAWsrtZIh1W2M5NrDe22VJFa2dus=
X-Proofpoint-ORIG-GUID: 9PBOKo62-fbTBklUnkozPL3RcAy_V3Iv
X-Proofpoint-GUID: 9PBOKo62-fbTBklUnkozPL3RcAy_V3Iv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280159

qcom_pas_attach() calls enable_irq() directly for subsystems already
running at kernel probe time, but never sets handover_irq_enabled.
This leaves the IRQ physically enabled with the tracking flag false.

On the first stop+restart cycle, qcom_q6v5_unprepare() consults
handover_irq_enabled, finds it false, and skips the disable_irq_nosync()
call—leaving the IRQ enabled. When qcom_q6v5_prepare() then calls
enable_irq() on the already-enabled IRQ (depth=0), the kernel emits:

  WARNING: Unbalanced enable for IRQ 239

Fix by mirroring the enable_irq()/disable_irq() calls in qcom_pas_attach()
with matching handover_irq_enabled assignments, keeping the flag consistent
with actual hardware state.

Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ca8e61254c44..25942200ba03 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -524,6 +524,7 @@ static int qcom_pas_attach(struct rproc *rproc)
 	int ret;
 
 	pas->q6v5.handover_issued = true;
+	pas->q6v5.handover_irq_enabled = true;
 	enable_irq(pas->q6v5.handover_irq);
 
 	pas->q6v5.running = true;
@@ -570,6 +571,7 @@ static int qcom_pas_attach(struct rproc *rproc)
 	pas->rproc->state = RPROC_OFFLINE;
 	ret = -EINVAL;
 disable_running:
+	pas->q6v5.handover_irq_enabled = false;
 	disable_irq(pas->q6v5.handover_irq);
 	pas->q6v5.running = false;
 
-- 
2.55.0

