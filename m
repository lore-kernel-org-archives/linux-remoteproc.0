Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78A74A7CA7
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 15:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351893; cv=none; b=ZNTAvgcLO8fLskq6udh/iNeTAnUIedGBEJyvJsqGToaT7rz0j5MlggiraWoYLGGNhF6Hr4SMDIuZTnU5hnGJ8yvjOPpg1aLeqXEo8Rmfq3T0g4Nup2+c+xQByuXPpxFfVAcEm+6mwK6n4cpmbU2F/ssWMnhRHP2wsOAjmaMh2IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351893; c=relaxed/simple;
	bh=H8Rbv3eBQpD9WgFbo2yB7uif+cAfBZh5zCbauor89yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hRqLHiVYyfw7Q/5VDof1ka40Y9+MA9bBV6zziG59C0izPt0LgYEF0+wskO7SJPvJmllKVYQUX7x/sGbZooiwEjAxH4JKzG6LnOH+gHfAMZzVHTd5vnkm6d2icIiVjzzu7Hg4MlmntSNhHoNloLQ39YbmnjyWc5R6zZDoZgGD+fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeVZen3y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gD4lnky4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeVZen3y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gD4lnky4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBV8ST425743
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 15:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zS7HAWLYB2K
	PmMHyPqOeaG0eVqDjrURQXru3PTmytm4=; b=WeVZen3y/kyqt4GzvLiaHTnoRyf
	0jttmCryP7WG2a5THrEeUc3ec6gLqFVdEKSR+yOohOfKd6lA0X/5X3fhIFI+ImTu
	qmATk3FdhnabrwfDEVerNCuQiyff1wqt7u5FO+rNOcsDR2t/OnVlnaDeVJRnZBmg
	1GSkG/4WrGVLX56iHdFVVRs2j94RpENvp6Xt8GxuktOt3eWPZbOCXKcpHAy1R8m4
	DglMg+jA6+oHofSdidaJFWRPw5sBwVSRSQ+mHSq28uUxI2Dde3SUVcW3gzhDavmP
	fTke5X/1PEu9HjjDJMudD0IiSiQ12cRZzrNZMpNz8lcWsuQQ4YziFxkmOgQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr5e8y09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 15:58:05 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86a74698972so948125b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 08:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351885; x=1790956685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zS7HAWLYB2KPmMHyPqOeaG0eVqDjrURQXru3PTmytm4=;
        b=gD4lnky44G7cidVoGDIiEKQNCFAhptKnwCvKvTivGcoJDcOR1mufN7SBYQmdpRMxr5
         DKEDQP5YtkG559tfbAputo4JjLvRmQFKcNW9DtJGPF3X43Z6yEb+vwg6wO9FeolSchfG
         rQagNUUPW4k/+VUB+EOUQHyoAB1FUH2r0bw2FltxGWPv41pmB+xscsp7NqEFAy29i7ul
         DK0wPhn5cD/Br44Brg7vxasar3d4D1PNLZjBQrZmOtn/gDmbhoeSz0cS7hterdgfygRh
         pQTV4Ge2E1GZIVTrvWb+Xyisa9puaDpKKfrdzusBdNFN4c36sSv9+IKJaHEi3gIa2iY/
         RILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351885; x=1790956685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zS7HAWLYB2KPmMHyPqOeaG0eVqDjrURQXru3PTmytm4=;
        b=TlMN1Azeh9VxPLEC4wV1xRmSEHHxTlpwDtiO+LnIYukIU2+q3BSz/q+fg4cW8f9rcH
         8TdBP7seEe15GaP/qsx4OWrK8cUEpueMg98s24uMSBz3fPYrPdGgE4wRsEEtDxvpEwXc
         J7dbJp1CBcNWkmoBzKXd0JxFrMjR100oLuFD15tjAWoF35naCwHk9ZpuslMvSarnqZd3
         xq3mZ1irUP9u3lfHzd5iHzkGxRNdxOC14/w0x2i08uQIfrS0RaeztRweY7YAa14bKoVB
         Rjdi3/qxxE6jQiezpXlG54kt6zkA7Rvo+rQqcTObYdxDKvrS+IbIXz44Lv8SkCrzynq4
         XR2g==
X-Forwarded-Encrypted: i=1; AKwUvBwu6O+I+FAzBRFvSF5btk5NTPQmw44AsGfg8UBaRIM8bOZ8tllPOCp9dS39gszxIDewlgNXVxn28XmrXVZ4ZWqf@vger.kernel.org
X-Gm-Message-State: AFuF++nVPBG4TEFUvqFSy8icr5IsnKgpdA0XxivS/Nfkb8hxqFt7EtDb
	s7wbPx8a1BMoPvQ5iIiO8vEzOSsemTmJfIT1S4Bh4mFfPrBnaMYvzCTBaizEaNXNVtXbAbFIGT7
	WsK9XdKr2kPj9KdZLypEOarCl9Wel5CqeR0eldLof1zXiEewLinXKTO2pVU12nMm4rZsnEwoA
X-Gm-Gg: AYBFou2zRudXWHiuWO57+VvOoa/w7jJgISdD0SO1xmRAO87SZwtfYdNjY7I8tD83Fzi
	cF+HexxJGXRlN+PdnFQp8f+30ApyFfaCI2t2Wqc8ruxaLopQeH+LNtDlv82fnHp2YY8T4DcdqWV
	dSTBEc1jSp6VDLvq20xcmk9c9ZlIhmLl92uNuO/0KEw7AeN8mk/PgEQH8ChXj8RQ8Ec6lgU372P
	ZvJ+yBzsoFNZKDmkJ/HiVnVBWCiMgW+dr+HZ1NFk/UnCWnGD5AcjFps/lX2LZEVijl/Url6ROnl
	HypourcDkJdHaIzC8URM3p6758JOk+li9xR8Y3w8/fMhKFblG+jfNIesnG3lu9FAxA22ai01Fub
	e6x5fBGgnBAixD1dgWA0qEDfsUsE=
X-Received: by 2002:a05:6a00:3e27:b0:880:fe7b:bc61 with SMTP id d2e1a72fcca58-880fe7c01afmr530738b3a.50.1790351884762;
        Fri, 25 Sep 2026 08:58:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e27:b0:880:fe7b:bc61 with SMTP id d2e1a72fcca58-880fe7c01afmr530719b3a.50.1790351884190;
        Fri, 25 Sep 2026 08:58:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:58:03 -0700 (PDT)
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
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
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
Subject: [PATCH 1/8] remoteproc: qcom_wcnss: migrate to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Fri, 25 Sep 2026 21:27:30 +0530
Message-ID: <20260925155737.4161358-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX5nNdnRhbBhsS
 ts7TPT9ryMAZqeU4zMKiEeP9b/yAxy5dfv4b/lW0r/uXZjAenW2ybMNrTlstLTUSIFcSTNcsUZa
 L18uKdpTpG5mzZ0ONfSnh+uFGq6NHLU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX6S9WlifAvJ6z
 7Caqfkyd1NvR1uPj33BVAqqT/B+tW5AwcX8WwxdIAfQ7yd5+YdJ/poYWaROjzpdr2LWoPrZ6b9P
 fHCfE0iMTmY2qwKbsELR4v7BgslbutSK7tbRlboEZ0FD/iIAywZdV9WO0+gheTlFe3lyIl7a+8A
 sk4b/TwdAl/RR7YYF85DXZMV5hy9FGCTRMh9yH2fghsXOlLSxLLEAVaK7lE/XkeXnUDisR5s2LL
 IpG7XcSHx94zM7JVfdZbGrO005DNAx5pX5UlWGdgHCRISa6iHs2rVeUR7B7BKodtgQ8GDjyCLtQ
 mrBfooIKCDsP/nYbMGtInxPW42QMfRX6pYMdwWVlJ3FU9Hw/qOV/P/6xfsIaK/rPVQJZ5doVp+X
 WOiHKs5N4c4f+miHo1KvQHh7cfJFdTVsyx+/98yUWkgAuPW/iCUKQjnyb3IQ7VqKp2AJ2GtxbE5
 jhkhIWo0qYfVCLohPJQ==
X-Proofpoint-GUID: xMD8t60LHxjpKswR-IIJMlhEcp08lsuu
X-Proofpoint-ORIG-GUID: xMD8t60LHxjpKswR-IIJMlhEcp08lsuu
X-Authority-Analysis: v=2.4 cv=Hf2B3SE8 c=1 sm=1 tr=0 ts=6ab69a0e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=BENypEIf3hN4rM3MEzYA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250063

wcnss_load() calls qcom_mdt_load() which bundles metadata init, memory
setup, and segment loading into a single API that does not expose a PAS
context, and wcnss_start() calls qcom_pas_auth_and_reset() which skips
the shmbridge prepare step required before TrustZone authentication.

Allocate a qcom_pas_context in wcnss_probe() via
devm_qcom_pas_context_alloc() and store it in struct qcom_wcnss.
Replace qcom_mdt_load() with qcom_mdt_pas_load() in wcnss_load() and
replace qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset()
in wcnss_start().  The existing devm_ioremap_wc() mapping is retained
for wcnss_da_to_va() address translation.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_wcnss.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index c856a92af43c..01f9076aa0b1 100644
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
@@ -600,6 +599,11 @@ static int wcnss_probe(struct platform_device *pdev)
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

