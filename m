Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596055;
	b=p08/ZI4mgno+0gajSE97B+s65P35AXsluImxWvLnsH4LWgG9dGOhQoR+48Bih7V1j8jp
	 hHNaiD+klnwZrY8Bpsr6NxP9SDVZEXFmh1kcxsR1U1i4RyIgaIS2i4pwnDGJR03lLzrfX
	 YwfN36pcYCA/+0f936y86W6ZVCtZT2kXXdrVzVPDEGuDrGN8toJqz/nAv+yKPEV68hDDH
	 jB37rRgbakGmKm8lC3J3L7MEvTZyx1vhI348BoTK5/BYEGN5OCIEXZQHbGWPXbM5KkzL+
	 HzcSjxxo/XB+XEbydI2lfn+wC/wwZWiYIDTDw0038ZhdpInBUepDMvg9QeEXltUbqAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596055;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
	b=It5cRrTzy/xJ4ExAGXbq1kma/WgEwTCj+rcPhHQOqDMMcU8nBYpyYwMrxqhNl2PjG10z
	 sALE+EEj3g8+LPdt5sluY8XQvx/yMEq2MCId1g/KvziBc4bp4msFySqbgD0jgJq/Cj9dx
	 kAC83QLIFPVoRjCM8S/8vrXy1qSGvn9glGBIZT+BBDcntAJBIX+HJ1WKJdwIGCzN+G06O
	 DdMIYimMq6/vVpfDFr2zBnWIvzEY11sXjOQ/IACweMS5fXRREoonWODd8SHSouDCG6e10
	 Rp3EnFrwDmwUCFzoc9cNl1k/Ll5bR+bofjNHSwMkE79dNDL+AtwMkc5umiZPcQlBeRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQLzIrhS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNDsz1Br;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0CC60A383A
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 18:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C0CC60A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQLzIrhS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNDsz1Br
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR5OM551894
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 18:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BZVUNIWMPuP
	DdEXUHU9zeRI/d11l8gukZD6tZvmKObo=; b=cQLzIrhSoij3Q3A92ujCBOk6ye4
	qmX/+gDp3wbXyaXnThiusMCKD3rVDNtY+4fr8xgyTpKSDW80LvkXAURGHSV25zed
	40dcT1HGZG+naWL+HVAdRSr3QovZKOb+WzNFyd2IfkBdjqdlD1S2oUQpM2GFU6tf
	jOwA4cYLo6OHq0gKz31H3gF5giQ7IhWrVmt2+S7bYLniTn4JqG9BqLikIlUn+RTo
	r8B9Rv85nFDqt9h7zPqSc9FpscA9TNPYOv6GFVawa5StM/DnjRgjX1GykyPffIG/
	fh/LWgFda52/cqPgn++nPXffKiObpwfDeLL+OI8dz51iCIz3A1OFQlHn4hA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwcc5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 18:54:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3724667bc16so769924eec.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 10:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596052; x=1795200852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
        b=GNDsz1BrswBSh/IYDUdbKQvcjXkD6p2ePaVWazbQLqgv5suTnG6wFkvO4N+LuOYHSC
         R4pS67i51jOV6DhHfSTnpYjPRcXAH0n6Lp89CSYRH0yR9bW12jtfNnkLgx6eyuvlOtF6
         BYVw450h2NyKR4X9EhSacVxNkQ7GlxdQ9fJGliTH4GVrgRazRsNOBAhtR42yKKvBvGwt
         SIL/2evaXcZrTbkveH16FYWikopVMHqCriRwy1MiMwvDXttaPrPZLkoAstWbpoteL4Ii
         2ASyNfmMT4uHSzKF/PnXGUK/BgQl4xfW69boUfY3l0Cxl8pv6EfUeEzOrw/iPrI/LX0v
         Vttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596052; x=1795200852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
        b=OeI+HTLHp27eq+ggC+pRtRCM4rjPat6lL8kLW9VYUnKrhOOfjtL0yLN6rBbZxafEoy
         qjtojpNeh9ycvARYWBHSvdvL6eYeHLc2D44wZt5IfVBvj7OwQdoHC7E8E7a+faPQuaOk
         RGRA9a2wmzOHQeOGe9ShUyww+X/AbaqtKYvG1dSuVoYQPWtZbOGSLgDzwTINNTbeaPZI
         a24hsZVgV1c0IA34J1MivhGJh3PJA6wopwQuj5r+wRrjrJli1iNevicREz79yqaVeWPb
         S3JOJWb1WhhRxD5Wvv/jMvh/g8x43Dw/je8z5nxNsvrWVGYNTlmqry4RdqqT0OtpnPN8
         pifQ==
X-Forwarded-Encrypted: i=1; AL+hErG/QA2TIwfifcc8vsGsHjAGC+9px34CZVQ0iBA7L7YVnL4OI+Pe7B9GLf+pWzKZO3TXT1uhD6Wnr2F8O/1azQDc@vger.kernel.org
X-Gm-Message-State: APuU4Z+8JtvQBa8mxy9bZHkQGJrL/8PaNft+ayQITE9razdqAp/rpzka
	dJr9VhHYuaEWVDLsdk27PDCq1wS4Fsz7Pkeer/AiqCzYkL8/X2x7/vYZM3ZO2qzV2feuAX7pLIl
	Yr/bM4XTH+hRUJ2PPKhqnfZBXz1W3gtIb0JuU10YWRMDGiL79AZK4eKcERjU8AwOYF3zcTdAT
X-Gm-Gg: AYBFou3dbDTaO4tgF2ejl0dKsuqBDnECKgLPVVd13K8krrRZa9RxrrR0wnXch0RBL+C
	wLbP4TtleiilnmYDfdzQXKd8TwAmpzOICSGvUOK00pTb3RFhnKlUCJqrhYRgqeiq5NNs5Uol4dR
	Tpgw1rZC4oEcepLK2LxF9Yk6Q1mrtMRnlm+xK7n6/qd2GLEKpSZgarswTUXmVEa3PbQ7eaCRwlP
	gZTOpoiiFF2wZKfrFm0/N9JuoBxJ7IF47+257ZYPIooaQsYcfKkT/N+K/1HlUnRalVsAIdlHtcC
	RmopMpA1o9d231QlkglIBhwhwuZQjHzHdrKOHwMboRggGrh9zaObQjhGXVq1JmNyWPdubBUGqDy
	SLVYRR1ApOk9+zro2PA8oTaRXuLIc2DwFszSI03k1D85XyBO2ylDueVdjxd/qPSLURwhCQ33Vj7
	Q=
X-Received: by 2002:a05:7301:1527:b0:36c:a26f:83c4 with SMTP id 5a478bee46e88-377e101681cmr5885955eec.13.1794596051530;
        Fri, 13 Nov 2026 10:54:11 -0800 (PST)
X-Received: by 2002:a05:7301:1527:b0:36c:a26f:83c4 with SMTP id 5a478bee46e88-377e101681cmr5885896eec.13.1794596050515;
        Fri, 13 Nov 2026 10:54:10 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:10 -0800 (PST)
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Alex Elder <elder@riscstar.com>
Subject: [PATCH v2 6/9] net: ipa: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Sat, 14 Nov 2026 00:20:06 +0530
Message-ID: <20261113185009.157893-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af75cd4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=P8P2WCEqvqb6tQ3B-mUA:9 a=PxkB5W3o20Ba91AHUih5:22
 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: tQIc8X_4PuLmk_rv3PhWwWDnfAUCF1ZP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXwhy9s7+mmAZx
 jb2c4GdEgN9jlBB4db8n5+3qddaOC/oQzWdF9kXZigbu37Z73eZ6W0ZZF8QRyZFWtSSAVZ/log+
 pr+UYD05TiRgEJ1fUAx1+HDZURWuHwlHOHje8IvRJ9btYlAr7PNC+NHvYGvkL3ypvNCDR+Ktf5L
 uHvxjBzQPBjkBFixMZrO9NoNAmsOjDCSt5Dpr8bDz8VdCM+MO+yAgMKMG1VCAThOG8+iWQThg41
 GRqdbowALf072I4xc1pdo1dYKQQkhXuaPJ/F6s7FRBsstBQczOqElbc5EvRh82rD2HjB5IkaZwN
 dZ7U9o2illQW/22sovOf5TRZ5q56OvD5TnydldDmyf/7QedlPGQBPTYU8Gqsr+utk85J7fcsd52
 sBQYQmbDa+wkL5NFSiIk+IRYCSsHu8txnSwN/F46xUdXYW0j71uk9oLJ8M0wv3IgfB9bUSj+e94
 YehgW+teKSC34gCmNBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX7mXQE+1owDuU
 nsxzHXAQcM+6gC1L5+bm2pmvy7JklxloV4O4TPCDPGCCjJ1XjYAMoh/kUforrQmHQHWtcGDJgH8
 5uO2fQBcI9e2OjMvzPoCuvKvAVkAjy8=
X-Proofpoint-GUID: tQIc8X_4PuLmk_rv3PhWwWDnfAUCF1ZP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

ipa_firmware_load() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
TrustZone authentication, which is the intended behaviour. However, a new
qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence with
qcom_pas_context_init() and qcom_mdt_pas_load() and
qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().

Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/net/ipa/ipa_main.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 14ac2d2faf7c..0a37741c2285 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
 
 static int ipa_firmware_load(struct device *dev)
 {
+	struct qcom_pas_context ctx;
 	const struct firmware *fw;
 	struct resource res;
 	phys_addr_t phys;
 	const char *path;
-	ssize_t size;
-	void *virt;
 	int ret;
 
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
@@ -615,24 +614,18 @@ static int ipa_firmware_load(struct device *dev)
 	}
 
 	phys = res.start;
-	size = (size_t)resource_size(&res);
-	virt = memremap(phys, size, MEMREMAP_WC);
-	if (!virt) {
-		dev_err(dev, "unable to remap firmware memory\n");
-		ret = -ENOMEM;
-		goto out_release_firmware;
-	}
+	qcom_pas_context_init(&ctx, dev, IPA_PAS_ID, phys, resource_size(&res));
 
-	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
+	ret = qcom_mdt_pas_load(&ctx, fw, path, NULL);
 	if (ret) {
 		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
-	} else {
-		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
-		if (ret)
-			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+		goto out_release_firmware;
 	}
 
-	memunmap(virt);
+	ret = qcom_pas_prepare_and_auth_reset(&ctx);
+	if (ret)
+		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+
 out_release_firmware:
 	release_firmware(fw);
 
-- 
2.55.0

