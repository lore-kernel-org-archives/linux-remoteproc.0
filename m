Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C289647DD54
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 19:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777576413; cv=none; b=DhbYF+Nv307NU7oATHaym52Sxf1x2+5ixWelcJqIybVUlNO5mCZ1qKGZgIo+J43NLzbZpCn5UvvIQSBnZLXM7Ctofr4yqDfJrMcRDmkG6y0yy2zyqzkJngJVueZaipLiU5Q1w4N0AiLVZD6roTgMdtefnDKGvOYfNHLgj+oF6TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777576413; c=relaxed/simple;
	bh=zTTihws/0VZvak5g01RFclHQtHBO7VYsS3WuK2DBoeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UuhooCJ1p1xsM1phiPIVSGp4fR+lsEjPobGn0E3JGoTO+J+szkAXZu+HDh9BfqJjk/Y/i4IcuQUGNmiCM22XbYGV09qgDPqzcIBQqB15lXFWs065MUYYc5N4Mkx+UEIiDKzuLtyaEyGwwYXyXmTx+DZIY0pXAJ9LjZjiCER64go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hCMi/HFe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+mc4Pgi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hCMi/HFe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+mc4Pgi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UIc7Lc1953321
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 19:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+S5J50qjEa5
	nRH2WIvLHmY5/93dfYCrgfWlwwfYk/Nw=; b=hCMi/HFeWHlXYjcVGLd6I6mof1+
	Ef3EGREmiXZTXHoJcQ4XGGRGpzymyDxk4klDaca3EQXVQa6XloXXikwfwNM9v38P
	QBokLjrr06mZXBLmJCrbHa1m4WEGtVJ5rXQw2f53ZeW1dWxX3SgxSw7O9IXSE4vQ
	p8l1zxwfdpVomSBUlouEz7NnofxuvhsTU/kYtvSFc/dUq9OUg4WT2WpBqMDZHIYZ
	v+RQviVJflKk247y9ibuL4Hfn//BBSmfVgN+NwZVfcq3iizw8yygxxPe8hStyReB
	STIibXD9eebMgHy6OaouhejKxgH96ogylGP2p8+XH6mWyTMHbapX/FfgcUg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvchk85f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 19:13:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c797d8c9c2dso1669409a12.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 12:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777576410; x=1778181210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+S5J50qjEa5nRH2WIvLHmY5/93dfYCrgfWlwwfYk/Nw=;
        b=P+mc4PgiUhKU7U2RD7xX3arDXiB7UOaReL9V5VqJZPG1pblsSUqTQ3jqUbhZdvQaOY
         sjFFg3y+ockQvp0S2s8s7oXA7f1PjGhrUvg1gKDLQQ+fiJBaLggICgJXrnAVxf08I0qi
         PgUlBGobXvPthLXKjqtc7hEYzUCoErcsJqvZa+mi3lwxKasqAmOXez/QQI5/QO2oJn8p
         dHNuurNtFopjrflUtWLz4DbYY7tysulOuH9eePtJnpLlZz5BVUZ1yYaMtquYiI/T8KGV
         c6wuNokQRc7hTXvb/MOSBtjqqtvc/7dLC8Zt03+LSI/7X1EWRtRSB6p6KKb+ammfT+bY
         lPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777576410; x=1778181210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+S5J50qjEa5nRH2WIvLHmY5/93dfYCrgfWlwwfYk/Nw=;
        b=qvrqXnDU/d97xKVU9xl43kASwdRBPzvGWBIWeMeAfaXIC7dZhM0OHBnKpJf82N5piz
         pqAwhbyqQrcpN1ym5ifMieUIJImG1KmX1dOiFxgB9RUKsfVhytsPMddCb8OpJhbEr2M1
         kykxHHNeu85JDJKiKvCnUZwjbr2GB7zKZecWowNvuNPVJVTsmzBQ+e/nWqgXKR1uVGtP
         P642+tqeNlDnLy9Y5MgtmY/JvPzI2HS7BR4EBEZyfaJ5mGLkSudf8MMLaCdhH1xvR75u
         K1gL09l+sM3a89Yd/yvUNo/q/Yy4VJHDYC2eYa7D+JIGWWhzE0zXg8SuE8A/y8F0ZXEz
         aisw==
X-Forwarded-Encrypted: i=1; AFNElJ9MZpdCg1KqLPahuDmG593aMXxovkmnsZhmURNSDNOaafqw7ECzD5B+O5jtY+9mVzXSWOPGtiHYeiVqI7UYFWC4@vger.kernel.org
X-Gm-Message-State: AOJu0YwhXC83fs2S6/UaJnJ2XR13JI4TfQiFIZ2rSS194Sh7ws3CaHUb
	7PH5+2zO774HGGdjlEjryOy6fLuwbVUaIZBKXNJbMCwBlgW/bHz+ksb/Hd4iShVT8kG0v7I8DnF
	x87EQ+ntSfUK5wQ64+91l9gCpRl/o86+zmwC6thgUGDJfQwHaQ1tqIZtv3kvyxOdB+qsY2qmK
X-Gm-Gg: AeBDieuMjdK9FO206QgClsru6fd5ljKw9Pr+rtQ5Up0K4eUjyaR8F/urX6yYwCz93bX
	uCfXUBB3+REtPHk/YMJM2iWyG4HPo692YkX84m62d97V/vQyeFJ9VbxJCajIcjEYh9uwcVXm76b
	mmVBs/w/eNSm5YwNTswL8rziZljwQzM8qVFiMuBkaSGFXIpbhiN7/Gq2e1pubM7j1Fp1KB4kFlJ
	NbBPtV2g2Lk4rWwRlE+N7AL2AlukNgkzo1Kx05mIoXpPetyIcKNJlYZW7qfwYNfJtfWz5/ViV3E
	6EfIvS5YkpvR38Zoggumcl5lKld+MixzgHOfrZTt7z1nMoulqk9mKHqUdSIxiMOrtP2wIbTiy3g
	u0mCqSQviQjot50cied8w7KlMJgJ/9fDormh5JQfErwK4Z6S+aINsJs/DbKU=
X-Received: by 2002:a05:6a00:22cc:b0:82c:20be:57e6 with SMTP id d2e1a72fcca58-834fdb2ab1cmr4870736b3a.11.1777576409439;
        Thu, 30 Apr 2026 12:13:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:22cc:b0:82c:20be:57e6 with SMTP id d2e1a72fcca58-834fdb2ab1cmr4870705b3a.11.1777576408796;
        Thu, 30 Apr 2026 12:13:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b485eesm373640b3a.48.2026.04.30.12.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:13:28 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 2/6] remoteproc: qcom: pas: Guard dtb metadata release with dtb_pas_id check
Date: Fri,  1 May 2026 00:42:49 +0530
Message-ID: <20260430191253.4052025-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE5OSBTYWx0ZWRfXxsveP1kBcz6v
 NF88PkQYPUFa78XUFcze7kE9HIxNgzYdn2MSZB1qEvMPGVZxne7+2OHW3gkAXBXQFzncSiw9FzC
 fMINPplAc7O72qiRl2nvMuh/XhVwGIHaHuyIzTH4Dykarm9kNhswIjqEi6OFH30Ohv8tiYxpcYu
 bIFmWsehdUhRh5D442Ra9eRLu61E3bjj2om5qBwOTGX+5/X6uhU1IR5Xq4PG2UphqD0ahFR3DzJ
 A73ijlE+Fom2ISxrNlMlnNfSe+rk0EuSEEEFWiB46Nwo6yiuJ65KAajaBvPvlnZXEb0ajcDqpfH
 gT/+BbKgbpHbIbr2tM38OJEAAz4cTHOeW6/WzS7fg3O36SbVlv95iQhoSuZYATcFh6MhG2vSy48
 IcuCOwivdMe6DuyGQ4R6eMir+KnNbewP3aHWT11VH0m5E13/p0kslxI0IyEPgn9kJltn2nmUTrZ
 GAajjP2qqtH8EnNrtMQ==
X-Authority-Analysis: v=2.4 cv=Zdkt8MVA c=1 sm=1 tr=0 ts=69f3a9da cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=LDFLutnZx2YFYSqWXWMA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: MzOpUgdCZ5hio9VwvMwCXVXxmiGqkDma
X-Proofpoint-GUID: MzOpUgdCZ5hio9VwvMwCXVXxmiGqkDma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300199

All other call sites of qcom_scm_pas_metadata_release() for the DTB
context are guarded by a check on pas->dtb_pas_id, but the call inside
qcom_pas_load() was not. Fix this by moving the call to the guarded
block.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 45be8c5049e1..2785d19408d1 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -243,17 +243,14 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
 					pas->dtb_firmware_name, (__force void *)pas->dtb_mem_region,
 					&pas->dtb_mem_reloc);
-		if (ret)
-			goto release_dtb_metadata;
+		if (ret) {
+			qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
+			release_firmware(pas->dtb_firmware);
+			return ret;
+		}
 	}
 
 	return 0;
-
-release_dtb_metadata:
-	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
-	release_firmware(pas->dtb_firmware);
-
-	return ret;
 }
 
 static void qcom_pas_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
-- 
2.53.0

