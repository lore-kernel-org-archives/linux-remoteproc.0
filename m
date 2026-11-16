Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846146;
	b=gF3782U7i+fknLQMM2t4sGl0qhs4ydczt6AhmSaEO+LOSVSpAvO8yMUa9dIyK51TP6/Y
	 N6phiTOwSnykniMmYcagRcDMtYpcZeWXPhEhUnbLw4h6QmPMhCz6yxRMenYIZ7A4fOMTY
	 OGK7azgHNT+DpdL+sOeFZhUo6Ssq1nPmh9qtD6x/+nLqqEz0jcDH9xiKke/+NdVi1+pJN
	 N8tqwi2dyFQKPKxZglWC/ALLuagXbSGZgdJaf6MTA7hago5Yqxca2HuqbJDGhuf6k6smC
	 TbvggVSHHC+BnfEvGCF+pw7UiyjM79245jKNK88ttEUAa43dMEGJFIbPGDrObZZwGqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846146;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uySENDl4qHKLED5Y781UpPB/TLSVGsjWluRr5p+nyD0=;
	b=OUR6kVIdwQm0LUpyKXtRboTmTwS84kt1s8v9PEtW9w4o3tUmks0ZiDI1gMISH0osaWQE
	 FdyA4EKXNZvTOqss9RoV/fYL+AWG9yu0K0yA2C9NUMzpPSV0magK4dZBOvT0Ps/MS4QNV
	 iWdM3brlnU/kAZ6YwSD/bHjQMG2xSEabp3LUIuPVaBJtnpOI4uOqKY8etM2/x9F6BIxeM
	 IyCdylO9/e063HEHFm4Nn6qdPqXeO0Xuffb0woq+0SsxsW2CmIk3ElZkVgc+WVXIppDPv
	 uL1XHCJRb5H/dwoQ6c/Y1EsZlmgy7WaDSBpOHJqSqMCVgERY8lPTOttpceysBUXe8hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1P5lJvN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j9fUUk55;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EB0606A323
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 16:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3EB0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1P5lJvN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j9fUUk55
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIIw92126416
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 16:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uySENDl4qHK
	LED5Y781UpPB/TLSVGsjWluRr5p+nyD0=; b=Q1P5lJvNIeKfL56TfRIjIR9jsbt
	77bTCWfZSMMnZXthPUTgZCdXpi4O2Zen0smhOrBw2karVbUu/j3OLL7aN8MglY0P
	bGJvdD4H3Xu0ByqdwaJVvWSdqOKH41uHf3VhbLRtzbMKAGEFaCkemwzQjUw8ao3l
	G/Sd6Iu4A7qRqNEwx/uhcR+aDj1Db70ZP1ARRIeLTctUDqzGwpb+fbl7kKjxxiFF
	NMBrW3TMolw/qsJAgwxAN2B3Z625QLgJCPte4FneviTa73W5lH1TVWNjC+j2wOKV
	cHQH4ip5qU2JKos01EIjcSpvU2+6j7Tre8SmYWS9yvw9okcMylQgj1en7gA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxx2hnq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 16:22:24 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1aa0fb7f157so4355387c88.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 08:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846144; x=1795450944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uySENDl4qHKLED5Y781UpPB/TLSVGsjWluRr5p+nyD0=;
        b=j9fUUk552vTcQHhrOXK1PfW4lvMW+ea7Y0w8hiMH6T+rJnGKYwOIKO47ySj/1B6bbv
         dKwEfLlkrnOiuG9gtpy+7vt8JkNsEnUvCt0jUmGD2t85xbYTLPxseQEXeyxwW60r80xh
         /z7aYhMHxIAIjCLNTo/Vtj++QwnofOH6TZ6IfeI8JbGmgiPjsqBfhafgJxQBEayOIiGJ
         PBlib8ehQCniJ5pSsJhortNEndUEUo8O9OBowAmgy+gWy43ZlK+A0yw9DhzLVLU+BIPr
         23Okt26HchhJomZh/G+jiBu/mSrxHBnpGWzzgk22YINMuQrDPcXWkj7DjtliLQuD3agY
         hzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846144; x=1795450944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uySENDl4qHKLED5Y781UpPB/TLSVGsjWluRr5p+nyD0=;
        b=kqLKGJjvB4J5UZrqhuVwxLP0vKVX+DungrRGpBZDsF364hucqb5XiAaQNmhqH3SWxt
         fZgE+qXf3CD/ay3z5ukhgopDABcrY55IZ8/JO0G8FPx9sSLQm8MS6UST1ZxrUKsRSmsD
         WSOJihdPioV/h/1mVZJv7Acz1549BkSTTY6QBWy4ziUvgs9cQb4reSXtLgw9YWbinHA4
         4Edyc2tuuE7hEvZAq4tvkyL2l3vnbPbRaMnrDLhzJSCGIKYIIQB5rvm1bgyjHldXjHVK
         6FXqM38pzIpxJKRP/eGsmNs1Kz7qZziRPiobksXUUX1WN2ePeK7/7RamtYXXSztdO+vK
         OxGQ==
X-Forwarded-Encrypted: i=1; AL+hErEMOvx9TeeZTIdlLkGJh+RITgbR76SReaubmD6EGzlGEAmzWANKEpAzES7c4Zloe3/Tedvni7HC9LydBrflT52q@vger.kernel.org
X-Gm-Message-State: APuU4Z+C77EyWfndaS7cCqBlu70cNwd39ZR9v9fOGZugoeeXRh+25nNL
	Fg6vML8kd3s8Pk6I2A34X4vhCSy1Ah5cicVO3M+u6wGMbtKC90cfEwsiefYASoGzjwVsjyCfV94
	Y5dlGr60j09VcPk6vXNQ2+ibrnLZSs9vDn2kRWFb4KGNR5L9WsfVj6g1Iu8o0Zx8OSRqXqWhI
X-Gm-Gg: AYBFou3MN8HjWauOyTrsFSD56ji2psd6LqSSqkpW4JNWKLEDAaEfrQZBLqPmIoHQUwh
	iigK9NiBSNIt4y/TvlMBzRq+MTUDbcM6bGHYrKT5CJeN3hxSN0IOsq/QY0ksDQfo1e79u7ySW/7
	z03TkjG41obpPDOyj4PeFY1PSqv49wxxV3jpkvPUwvVQhScNMDbFkH1GkTbRPcBwppIFK1vpMUG
	UplUtmc5uZwkhhcDTZbOYcw9FjJVjFwKn9XzYtCj5L2mMa00WeB8+f7tsXoDTk1eDJg/c7/2ZEB
	OqJSu2Di42NPko2txzJYYJ8YTl7t04ZcuC7TyTBhYEKId1vhVecLJy3zKt9S3bZqWKJsBYVtB88
	55BSvHJq5FtXyfaQU8EcDHv75TRqOTjyWuYh0zi5FNTPB1h0xUyeCu3L2L70G9kg8SOkZt2/BsS
	oX
X-Received: by 2002:a05:7022:7f1a:b0:1b5:23e7:3387 with SMTP id a92af1059eb24-1b523e75033mr5758253c88.19.1794846143405;
        Mon, 16 Nov 2026 08:22:23 -0800 (PST)
X-Received: by 2002:a05:7022:7f1a:b0:1b5:23e7:3387 with SMTP id a92af1059eb24-1b523e75033mr5758228c88.19.1794846142809;
        Mon, 16 Nov 2026 08:22:22 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:22 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 2/9] remoteproc: qcom_wcnss: migrate to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:41 +0530
Message-ID: <20261116162148.2864501-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R7WWitRX c=1 sm=1 tr=0 ts=6afb2dc0 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=BENypEIf3hN4rM3MEzYA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX9OShUhKnBnaN
 tVguGSUgPv6Ddy4VpDqlNYVFM+SnXGOjAiYeM7V1YmZYHgMY7SHZBRw1DEnDnXCHnzSX3Wp7blW
 SSjXOPz0mH1e8oe3eFQJv6kEFo/epC8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX3iRyJCcW0lkN
 /PjM6qhMUHhzjT2p6t/yQiC3wqbIn8T3hl9a2x08Lx+Daydv+82gWs4yxM4RJRlAnVbMedd3Km5
 bS7J72CzFHfIcxOgZQwT3+/7gk5Haaokwx+FVq3kXJW1saLRnTuVOdxlPbK//pjBF8jK3GfrCLa
 uGATGu5hhzkW4QO8tSvQdQR1oZnS9I/pl+hgFizL+0QYH98TweutaTM90umM+nuCnvhpa+VJg+K
 Hos5lCUhUEMwhKZvjsW8DNL+ZSdCBhxa2gkE+LumnZGk8ueyc4zd/bjpwH3LXTIgvV3+y6Wvj3W
 mq6DB+A6R6a2iD79Sa+GjuTw89tLoK4aljHgotGB0VuBizyrt8ipWm1cim5fpA7i6h9DtCdoJdb
 /YVgUPxYMZhdbIr8TxCmD2m7CTox0MvOjShUC0XMPctWRBTAEUN9z82BlFt/5bM5h3WMlsXZYKU
 VHiI0hV4Lwhs3efGlnw==
X-Proofpoint-GUID: HslsYyRsntyseEReHlcHVRKeUH5LC5Lj
X-Proofpoint-ORIG-GUID: HslsYyRsntyseEReHlcHVRKeUH5LC5Lj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

wcnss_load() calls qcom_mdt_load(), which bundles metadata init,
memory setup, and segment loading into a single API that does not
expose a PAS context, and wcnss_start() calls
qcom_pas_auth_and_reset() for TrustZone authentication, which is
the intended behaviour. However, a new qcom_mdt_pas_load() has
recently been introduced that works with a PAS context and can
handle everything qcom_mdt_load() provides, along with additional
functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to
run while Linux runs at EL2.

Allocate a qcom_pas_context in wcnss_probe() via
devm_qcom_pas_context_alloc() and store it in struct qcom_wcnss.
Replace qcom_mdt_load() with qcom_mdt_pas_load() in wcnss_load()
and replace qcom_pas_auth_and_reset() with
qcom_pas_prepare_and_auth_reset() in wcnss_start(). The existing
devm_ioremap_wc() mapping is retained for wcnss_da_to_va()
address translation.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_wcnss.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 02f38fe29f20..840fa67a6928 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -96,6 +96,7 @@ struct qcom_wcnss {
 	phys_addr_t mem_reloc;
 	void __iomem *mem_region;
 	size_t mem_size;
+	struct qcom_pas_context *pas_ctx;
 
 	struct qcom_rproc_subdev smd_subdev;
 	struct qcom_sysmon *sysmon;
@@ -157,9 +158,7 @@ static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
 	struct qcom_wcnss *wcnss = rproc->priv;
 	int ret;
 
-	ret = qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
-			    (__force void *)wcnss->mem_region, wcnss->mem_phys,
-			    wcnss->mem_size, &wcnss->mem_reloc);
+	ret = qcom_mdt_pas_load(wcnss->pas_ctx, fw, rproc->firmware, &wcnss->mem_reloc);
 	if (ret)
 		return ret;
 
@@ -257,7 +256,7 @@ static int wcnss_start(struct rproc *rproc)
 	wcnss_indicate_nv_download(wcnss);
 	wcnss_configure_iris(wcnss);
 
-	ret = qcom_pas_auth_and_reset(WCNSS_PAS_ID);
+	ret = qcom_pas_prepare_and_auth_reset(wcnss->pas_ctx);
 	if (ret) {
 		dev_err(wcnss->dev,
 			"failed to authenticate image and release reset\n");
@@ -599,6 +598,11 @@ static int wcnss_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	wcnss->pas_ctx = devm_qcom_pas_context_alloc(wcnss->dev, WCNSS_PAS_ID,
+						     wcnss->mem_phys, wcnss->mem_size);
+	if (IS_ERR(wcnss->pas_ctx))
+		return PTR_ERR(wcnss->pas_ctx);
+
 	wcnss->pmu_cfg = mmio + data->pmu_offset;
 	wcnss->spare_out = mmio + data->spare_offset;
 
-- 
2.55.0

