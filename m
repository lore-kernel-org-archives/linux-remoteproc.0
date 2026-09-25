Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6D94C0420
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 15:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351957; cv=none; b=COEiVujMGFQnu+MYPk6pISufV2cZRkW8hLPQa2coiSAf2SGwdAjEt+xeDpUw3w5ngSbgDEeHctMXsEGdS/lWhEmnDlJ+CTdX4NKBFE5w4ou8MM3KOw1gHKo9hO2hqVjqgunabeCh44rX03Pj1wIGkDFEt0Tq7kROTV5/U90JxHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351957; c=relaxed/simple;
	bh=TWS0Yx87NBHxxrxYWO6SXYvIYxpyWIRZf+bhCzU+Trs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WHXVAKly5U49ggd5UdYOLtS+/ZJ5QVhQigvMVpKym1zp61iAmuUwA1SUJ5yeXfte5wYn5Wp4DLtVUpIdH4sf9VUkpqgFpH3Au2n7n9D5EPAbKWRGWOlxmgvGiX4DaX0HiDlAnd8k5fM3s9+jblTMPrZIp4G5khgByZTjq60AZsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNeisGAd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZxhOjfYF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNeisGAd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZxhOjfYF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDwvNc3627525
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 15:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i3tD8eNypyv
	tY1j258u6wRodTx6BDbTX1sIc4pY1tDU=; b=CNeisGAdoyvIOSATXZdYhJKtatb
	kX0BKeNK74VUYi1svbbWgIjtQSK2zhIdhrtxgZLmTy25fiQo3r5t9UkyVc8tpdew
	+7px2QosmNDjruUtBU6VIsGHQv9yQLDSWacEKOhax4eVT9J3UQ2WXuqvdw5B/pXl
	+i5HvQ+WQQ3fXMYACHsLIeqOA031S7DOGySn1zKl8pe5gKftvPbKHXlKXazTFQBP
	WTkYcqKVCT+Im6X1UodRM8D0MlFaPtuodGZcrBX08JkqT1lsfdQYQu34TvRpjtcV
	MJjfczCgiJ+f3YFwJAbt7cu8RPP1KOJRDh7Mi4yP4LXcUscPb56syZm+DDw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq3a3vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 15:59:13 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86b4048367cso1242205b3a.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 08:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351953; x=1790956753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3tD8eNypyvtY1j258u6wRodTx6BDbTX1sIc4pY1tDU=;
        b=ZxhOjfYFF4DceWcWNqPBuD/e6vynvFsTAYzuPeAGOjpqw3RTJpfYmgO2FK/cV2azaW
         cAmdQ1Zr5H05X/0IWAUiRhhsRvrBtsiiSsvvOYDYvk/D8m4mPdyV8kueUTtsyJzIPvOK
         a0rJ6T4jtQIkYlLzQeXmBG1aP1EnWsDuxBeXWq2hOgOTfFvRWD9TUxmKaYP5L1/CwN9J
         A338wCynCwcmAv6vhdasKO0Fhj46+T3d0ZV/oABfZh4dtfz2vDOy7MWi/7g3xo29zcvP
         Vy/tJ0X2/mPEAUMjXRUmqwbyxoiyahc+EQ10c/YkFIYmPBciKLzxDW5QrIP6JxQsVdo0
         3luA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351953; x=1790956753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3tD8eNypyvtY1j258u6wRodTx6BDbTX1sIc4pY1tDU=;
        b=joc6E+GN0qOj49eSf6hbKFbMXwzsV5WPbCi/ehNnwxKVlsFtqxKvqrxeJ1YTB53mAw
         rvdJh3UrfxITCoGJQj4CumoF1ZXsB8wVKjxum/zrk2kOzo9rMb/IcUzKrnlwAzC97pB+
         diJET/R1YEBX3rD65rHUx0rPcmeMUubjlf778Qwl6g/RHYACYsYfFyIsOMyhmideiqWo
         cCOg0j+umdismNmclqUZcJBbH+rQy+l+1bt7hrX5Ck3GIhAjudIhh5Ayi2V+xRoTA2zH
         OPEM9yjR2+jKBkvhSs2eztwvU9RonQpE/+uHjXY+aqLqTH6bF6QvCq3A/Pq2WkENuH09
         TgfA==
X-Forwarded-Encrypted: i=1; AKwUvBwi8pXuG+XOWMFHlfUT3gvEZLBK3IvIZQY+FBUzdyynQtEjWXozE5rmvQgHyGNpkNCwc0Z3rihOSJ3vQ0Wb/mGG@vger.kernel.org
X-Gm-Message-State: AFuF++k4uOeEmvlwXboBV72kJvyRy8PgRayLUdfyC/X24+ZmuFoGXWo0
	BisZa7YZfj8uLpVlboSlaznlS4aFZODShRWX+jc6vZKDY3kzRiF2PjXtd3PgGShu7+obXjGXZll
	c0Yw5Qvt+1SbeUF6Xk46bGWWQcWhjAK0DnBEWUrZViTswKcXujg95eW6x+Kv4BKzrAH92DLlG
X-Gm-Gg: AYBFou3KWMvHGIuZk8w/kf8A2lcWFYlOTYpc3NIL5JjW53eO4pqIyreX+iE5lyiOfTU
	kY2mqA0SRRF28gQuUKHN3A9Oy1nOwG0VjC9tf4/bx85A8QUuBdOWtoOiZCCaO0ODEJqYioiJsVD
	PHgPohySQs+qfDrjtu5vFilzC/atHeho7715JDP1IxYwVTaGWBukcCUivOFKiE5+Y55uJsxN+Fx
	K6JdhE1cFfJ/85uS+lriRD8FdO+PuWkSsyg/QYuPBna5jj4nCdIPYdoa12QpMJD//dba2kUrp/W
	LnugaeVMNwUEUhBsXaSY09w4NS87esXPKINX3VwmQCfTDhnMAC1hJX0K7fJAtRiLZ/O5CCbnr3X
	da8jOOwzInHjUadWFkwF2E1gZTPk=
X-Received: by 2002:a05:6a00:44cb:b0:857:7337:5db4 with SMTP id d2e1a72fcca58-8802a0bd308mr1996694b3a.18.1790351952544;
        Fri, 25 Sep 2026 08:59:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:44cb:b0:857:7337:5db4 with SMTP id d2e1a72fcca58-8802a0bd308mr1996641b3a.18.1790351951930;
        Fri, 25 Sep 2026 08:59:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:59:10 -0700 (PDT)
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
Subject: [PATCH 7/8] soc: qcom: mdt_loader: remove qcom_mdt_load()
Date: Fri, 25 Sep 2026 21:27:36 +0530
Message-ID: <20260925155737.4161358-8-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX9F7NljF0slMn
 AnIbjIy6/bENFRjKFQWsxiKF8r61UH8kAHnkqH21xBFYRWVSJsxLBLLgeQFwZZ2WYD6epXAmmZQ
 OZ3gF1uw0W5ZWTBfOCqaQLEj/LyYU6I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX0J/zNNlyzsNv
 pMoqhWZ8r7PcDLP2YBD2XTanRx0gLiLk8NcvfoxvyUDPKrGfBTZ8wNgvbzeSTdjSfGFDFhThL9I
 y+gbwMAMJvX9QiUsAkicKCZ8e/RwCmx/CPDnvTrffOGKcavUViXqTMC81l9S7fBkfnhAGbIZEJX
 17kYlA+VVXCT1oAj4buJ9TrAgU1dfQjKsa2jqDKct2R95NU1PAz3ybI9VHAHmMZQMv1aKfzSmWi
 q7s1Y64sz2tOnDrVVFZqZykljnmruO2JAnFUkxM/K2NIpKNVTqbV7H3Ej1pFQBOXxEtJP5HIBQh
 a47ejXuMDTKAiXVp+U65Wljk8UFwtEfFveUaBQgTFYZvUGZcPfpJKTv0D/ZJV7evWow4hVvJe+l
 GCkHcVTxKy1eLxMmeDan8zxUjZwl5LoqavBckqQr/KRTHyc0t4s22ztYl4aWORm8vVFugJc45vG
 twTCWmMF3N45QGiLhJg==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab69a51 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ZW49mn9jNiMhmSsDLfIA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: tStXiUbuCUToeEpAplvic-nvIjeZVX3x
X-Proofpoint-ORIG-GUID: tStXiUbuCUToeEpAplvic-nvIjeZVX3x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250063

All callers have been migrated to qcom_mdt_pas_load(), which takes an
explicit qcom_pas_context instead of a raw pas_id and delegates memory
setup to the context.  Remove the now-unused qcom_mdt_load() wrapper
along with its EXPORT_SYMBOL_GPL and header declaration.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c       | 59 ++++++++++-------------------
 include/linux/soc/qcom/mdt_loader.h | 12 ------
 2 files changed, 19 insertions(+), 52 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 002100fe2d32..1c7b5906f6ae 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -326,7 +326,8 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw)
  * @dev:	device handle to associate resources with
  * @fw:		firmware object for the mdt file
  * @fw_name:	name of the firmware, for construction of segment file names
- * @mem_region:	allocated memory region to load firmware into
+ * @mem_region:	virtual address of the memory region to load firmware into,
+ *		or NULL to have the region mapped internally with ioremap_wc()
  * @mem_phys:	physical address of allocated memory region
  * @mem_size:	size of the allocated memory region
  * @reloc_base:	adjusted physical address after relocation
@@ -341,6 +342,7 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
 	const struct elf32_hdr *ehdr;
+	void __iomem *mapped = NULL;
 	phys_addr_t mem_reloc;
 	phys_addr_t min_addr = PHYS_ADDR_MAX;
 	ssize_t offset;
@@ -350,12 +352,22 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 	int ret = 0;
 	int i;
 
-	if (!fw || !mem_region || !mem_phys || !mem_size)
+	if (!fw || !mem_phys || !mem_size)
 		return -EINVAL;
 
 	if (!mdt_header_valid(fw))
 		return -EINVAL;
 
+	if (!mem_region) {
+		mapped = ioremap_wc(mem_phys, mem_size);
+		if (!mapped) {
+			dev_err(dev, "unable to map memory region: %pa+%zx\n",
+				&mem_phys, mem_size);
+			return -ENOMEM;
+		}
+		mem_region = (__force void *)mapped;
+	}
+
 	is_split = qcom_mdt_bins_are_split(fw);
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
@@ -434,39 +446,13 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 	if (reloc_base)
 		*reloc_base = mem_reloc;
 
+	if (mapped)
+		iounmap(mapped);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 
-/**
- * qcom_mdt_load() - load the firmware which header is loaded as fw
- * @dev:	device handle to associate resources with
- * @fw:		firmware object for the mdt file
- * @fw_name:	name of the firmware, for construction of segment file names
- * @pas_id:	PAS identifier
- * @mem_region:	allocated memory region to load firmware into
- * @mem_phys:	physical address of allocated memory region
- * @mem_size:	size of the allocated memory region
- * @reloc_base:	adjusted physical address after relocation
- *
- * Returns 0 on success, negative errno otherwise.
- */
-int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-		  const char *fw_name, int pas_id, void *mem_region,
-		  phys_addr_t mem_phys, size_t mem_size,
-		  phys_addr_t *reloc_base)
-{
-	int ret;
-
-	ret = __qcom_mdt_pas_init(dev, fw, fw_name, pas_id, mem_phys, NULL);
-	if (ret)
-		return ret;
-
-	return qcom_mdt_load_no_init(dev, fw, fw_name, mem_region, mem_phys,
-				     mem_size, reloc_base);
-}
-EXPORT_SYMBOL_GPL(qcom_mdt_load);
-
 /**
  * qcom_mdt_pas_load - Loads and authenticates the metadata of the firmware
  * (typically contained in the .mdt file), followed by loading the actual
@@ -486,21 +472,14 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
 int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
 		      const char *firmware, phys_addr_t *reloc_base)
 {
-	void __iomem *mem_region;
 	int ret;
 
 	ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys, ctx);
 	if (ret)
 		return ret;
 
-	mem_region = qcom_pas_ctx_map(ctx);
-	if (!mem_region)
-		return -ENOMEM;
-
-	ret = qcom_mdt_load_no_init(ctx->dev, fw, firmware, (__force void *)mem_region,
-				    ctx->mem_phys, ctx->mem_size, reloc_base);
-	iounmap(mem_region);
-	return ret;
+	return qcom_mdt_load_no_init(ctx->dev, fw, firmware, NULL,
+				     ctx->mem_phys, ctx->mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
 
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 74886f772d46..f49de7b388bc 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -15,10 +15,6 @@ struct qcom_pas_context;
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
-int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-		  const char *fw_name, int pas_id, void *mem_region,
-		  phys_addr_t mem_phys, size_t mem_size,
-		  phys_addr_t *reloc_base);
 
 int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
 		      const char *firmware, phys_addr_t *reloc_base);
@@ -37,14 +33,6 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	return -ENODEV;
 }
 
-static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-				const char *fw_name, int pas_id,
-				void *mem_region, phys_addr_t mem_phys,
-				size_t mem_size, phys_addr_t *reloc_base)
-{
-	return -ENODEV;
-}
-
 static inline int qcom_mdt_pas_load(struct qcom_pas_context *ctx,
 				    const struct firmware *fw, const char *firmware,
 				    phys_addr_t *reloc_base)
-- 
2.55.0

