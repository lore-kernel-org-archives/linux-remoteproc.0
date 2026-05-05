Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6873F7A83
	for <linux-remoteproc@vger.kernel.org>; Tue,  5 May 2026 10:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976607; cv=none; b=Gac44d0aJida/UoqG1TdifFnN2h63hbcoDwOLC6FVke7jFfuPw66bN6atg44Zg+q5XExO6yUP+VV9al6L92AQ8Uy9tn1HCYNTex6G7fDkrw49utVPxAxxmD5O9SgI/5bTyjha7NXwqq/A+Alec4QUHsnXC/gTs9NTeEUJgMIQWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976607; c=relaxed/simple;
	bh=4IyXheiZuhNFeKFJAfKgz8H68wJnYYhag/On5nwkq54=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KWBd1BdVq1Afvr8qaAd9T+woECbbpYOa9c/9TJisPPLOr//nl8pygJAvCfMlaZrltiLm2yZ28ossVxhUKgtabny2/BKd4NtqdvHsLnx4hCKUDWIrEBoDatOpRTjwZ6VMU9vlCbPtHDxblLO774wWZVILFDb2l+cbDaHjLAF/X04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMmq/b5g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fOcUfmhP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMmq/b5g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fOcUfmhP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64582tVW1346410
	for <linux-remoteproc@vger.kernel.org>; Tue, 5 May 2026 10:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dE17V8Wkjb9
	0NEl6WtnlLDYqjnI2trV2O4KGboY1n1U=; b=VMmq/b5gU41ECQxFtW3TwEB8cEf
	EJaqIYAmZtt/PmE3Lg3NRQwZMi8fNnUHm1ed7TvH1NE/ocy3m3saHJ6NtLSiViST
	aYrIXz1BhWhYKvpXMOPF2MzX89h2DRLWielpuVIhW48km5x1nhxW1lt+RCrBAcvK
	vd/9c8m77mxqZS+azW9TEPgfvPI2mdyherfDLNa2JaqXbNpM5urrjhmRS/G6lgaA
	btUICvXI0xROWv8UiEp9g+nlrIU5mEVsvv5/DZY53SddokxMGU2hsVHiv4dBsp2s
	oM9VE/DqpGDANh37Uu8uohLgC4mTSoddvbZvl9PNZtZTSUxR+vUChcLbk1A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx2xbk29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 05 May 2026 10:23:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35e56ed5d5bso6791759a91.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 May 2026 03:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976605; x=1778581405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dE17V8Wkjb90NEl6WtnlLDYqjnI2trV2O4KGboY1n1U=;
        b=fOcUfmhPJyYiv+DVyZZjNxapMEFoYN22oyWcjKkWPMrw81yITgNSLHLXz1Jce6EFey
         JT4MiPenhJvNJGfNwdKDF+/Rao6Y6nkAVt4y3mWiQ8YKN+5wYOmkj4MJz9qW/8GhJBAh
         60smwzFDp9GEEgcCgR/0lJiO1q1dvo19rXNkuHcWGc+7jrVtbxpvnKKeefB1MC0SuREa
         1hbbQ7WO003g9Qg3nK7DmxVcweRY8qIisXE4sX+0WSHdmMDDt+Xg0cDsNi6RC0L1p9WL
         2dwRMjyDIx+mQvzoUBSMAg398dh5Ib1mCrtYgzqFFOqaIyC3eKfzDKxQl9DJixULjACw
         5EMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976605; x=1778581405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dE17V8Wkjb90NEl6WtnlLDYqjnI2trV2O4KGboY1n1U=;
        b=HzYgQ/i3vO5+Ei93+Ep1A8Cvc0KqMjgtWiFYZqEfOFllyqI03yD5RITQEzDRjl8XE6
         gChKcks8LVvE/++N2detLI2Ok0lwutH3sNRK1UuryuIEOl8MnwHUiSvozWn9SEbIlv/B
         oNQwEGFKcMqfpBcCpjUAQ6XzzHtVaNFQoEuCMPjJsCRH/+ssE8ikhI3ISfRX2WfbwJDp
         eFz9n3FB4Ja0m8MBAStujtf9nv3PBOtsVjAQczn/fqkyHvIzMvEhnCBkWmP7auA8lmjM
         AmE7FSEy6UcuEx6CtZhGTJy2PZQSE8TtJGUKBd2WuY06i+wjV1rGycVPI83rZlYtkW26
         y19Q==
X-Forwarded-Encrypted: i=1; AFNElJ+whOEsna85NEy3Y0rZ+stqKiM+0KrZYQZLxU3YGJ2TUeXBF7WgZNxL+BKJ71Q1ZF3+8W35VHODOTnv5SIhv7ka@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7qPreg87ejOtKlt1yithUvBhKLu8gn+vtlWsIFTbhpqFKeQcx
	/mJmy74nzcH5EVhs5UG7u+rX6MzzBK6icaZ0EKzS4II3hi50bhC0b025QSFH87UMUjfcMc0cV/G
	2CRIi/N0iMrY7GU4HrtJT1BjCUegyMsvfkZnwgdEEPEbTXDcsFDcXayeuPP28vFTVpQDAEtuy
X-Gm-Gg: AeBDievMlc7gelBtZfg0gd31MrfjJmvEbmtkVuXuQV1tbaTV6yUEDfOaBHA0W5YcaKc
	qFDjpvEU8lepMzypdsvjCU+coK+e6U1KDi9ufyz4UaiHijovWDekb/wlNqfvY8WR2EvUlRbPmNd
	AuQrxEN8gPudhOmL6jrxS7wBryoF8ULs7a10NBnV5f3sEBNO10LmRB7WT5y51KjBm5aXHy04VAG
	QWfFZ4W1AAStceklCLXoAWLTGGiI+o8N3cTzYTSLhGMZ2ay33bIjncP6LPeyt+ywZ41K1uKPr/6
	/39ROBaqgwFzCmRfYGZkTdlEE8LcPubUFnfAEb9OatmZ7p4w9e+dVMj4/KcfJtIheApYCwVENwM
	maae9FGXUZNJl6pRelY+PM1q+mb3mchjNVG1SMHOnBAn/JYEAKGCeki8xcB9o4FURvdDva12TiD
	HmwYTldu2gzDtAx2DevzG6z/w1zhYSWAhSx/LEf5//1GGwza4kSFTOedCeMKdwEA==
X-Received: by 2002:a17:90b:3a91:b0:35e:579a:7e9a with SMTP id 98e67ed59e1d1-365724c1eccmr2380424a91.7.1777976604500;
        Tue, 05 May 2026 03:23:24 -0700 (PDT)
X-Received: by 2002:a17:90b:3a91:b0:35e:579a:7e9a with SMTP id 98e67ed59e1d1-365724c1eccmr2380395a91.7.1777976603990;
        Tue, 05 May 2026 03:23:23 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3656ae05d30sm3299333a91.6.2026.05.05.03.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:23:23 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v12 1/6] firmware: qcom_scm: ipq5332: add support to pass metadata size
Date: Tue,  5 May 2026 15:53:05 +0530
Message-Id: <20260505102310.2925956-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U9eiy+ru c=1 sm=1 tr=0 ts=69f9c51d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Hho1wTqgLjreKoR7ChkA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: pOt5D33Lzzf-vzR_2Lue6qKP6-YvLxDx
X-Proofpoint-GUID: pOt5D33Lzzf-vzR_2Lue6qKP6-YvLxDx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfX8t1gGzv3ANdC
 RPD7Zo3SwDzrj2/y13LGkBfF7BFSSf4xopFW3oifvQNCQGPud1v+UI+GV1X0SIvgKsZqoDmB76t
 kCXs/lLt9s6/Gpy9picrXKlC6FMioha8hapgq806SxcqkjwO3oPUFHJPo7k06KwZwqyHXldAt9w
 nd0G0N4fy+B1LzQSs4iLIKZPsxx7BH6WnBQxTDbjNm1/HkRNJ5AChbCeGp1sN6xCSePnY42uGl+
 P5BylpyIHUsagIzAMV1mZuzJx+7FlE9StpHV25cjFc99+jyOJLj9KwI1WxEIcj3i/o7oo+Emqoe
 4IzfU2KsT8Hm6fVu1D766kV0woItcWPjApDYDj3f64IEoo2d4z+m04Z2oLa3VgGuWnaMVGoqMZ7
 uChzT4/qF+vGTuZuShC64kJe9XLLTsyjvwGmacPu7cVqkzRrlCrlHk+wzvYgSBKd3S+a6kH7Amc
 L/5Gjxpy+jj6HfiltYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050097

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

IPQ5332 security software running under trustzone requires metadata size.
With new command support added in TrustZone that includes a size parameter,
pass metadata size as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v12: Change Manikanta's mail id to oss.qualcomm.com in S-o-b and Author
v11: Rebase to top of tree
v10: Added r-b Dmitry tag
v9: Added signed-off-by tag
---
 drivers/firmware/qcom/qcom_scm.c | 14 +++++++++++---
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9b06a69d3a6d..0edf276ca300 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -605,7 +605,7 @@ struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
 EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
 
 static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
-				     struct qcom_scm_res *res)
+				     struct qcom_scm_res *res, size_t size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
@@ -626,6 +626,14 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
 
 	desc.args[1] = mdata_phys;
 
+	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					 QCOM_SCM_PIL_PAS_INIT_IMAGE_V2)) {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE_V2;
+		desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW,
+					     QCOM_SCM_VAL);
+		desc.args[2] = size;
+	}
+
 	ret = qcom_scm_call(__scm->dev, &desc, res);
 	qcom_scm_bw_disable();
 
@@ -650,7 +658,7 @@ static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
 	memcpy(mdata_buf, metadata, size);
 	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
 
-	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res, size);
 	if (ret < 0)
 		qcom_tzmem_free(mdata_buf);
 	else
@@ -706,7 +714,7 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 
 	memcpy(mdata_buf, metadata, size);
 
-	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res, size);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
 	} else if (ctx) {
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index caab80a73e17..cb80e22a3d90 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
 #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
 #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
 
 #define QCOM_SCM_SVC_IO			0x05
-- 
2.34.1

