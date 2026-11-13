Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572673;
	b=L4uITLWx99G6jJI7F7SR7TjsaZ8qSlufM54FkXLEp7vZiq48nZo2FYMBad0M7x/dxKQk
	 Lexzqzmn13hU+wlLYk/4HSRGqWaSMcuyyaLn8IFisql8oAv/E1qA3atzdYXkkwtiazO6P
	 cxvKemBl1jDnvoH3D/3Gsv2wF89cVSXvx6Hcx+64fi1arJD1mjD3CCQYG5e4vMSiF6rk7
	 P7ecu4o4wjmgll2/1u7+77HcHgXPMKb149ol9rYrytLOjTBhgWAHXtxKLDguN0n4NBmKZ
	 GqPvICwsWEnWM6roEJsNqrihbsh/Zizlf0xnWlzVeMZjFlZ1r9naOUtx7oKZ9f1sBBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572673;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=khMeO+3hnF7JoerFAErBwOXNznfce9mQZqJj+KNKRoI=;
	b=kCnkphX4nIFrj6glI6tKutrcVZfILuNr07pmMbuDiTLmHZWk99G4BuESX398CNkuEd1j
	 eTvKdPsGJclTVbMVbBHgqxQpdoZXNGAYyFqVDjqm0O26gjF7ASQIst1gU1WYaVg2lvLuK
	 aXsQqQM4evzKI+FU9wGjTKW8zlF4r5WHKqgDRPw7/xtRQ6W2rP/7PQoY0rnpt+cwn47/b
	 zniw5R6Kr9yyBRlsaviUbMa0E3e2yOzl53WRmbwPcpC2JnwbxgVZ8mwy+wQyhVR6bScG3
	 BDHnmZW3LB6c29odMow6Gvryzs0+OswmtIFWtn1kgBueZJ7NUwki2HsJQRwA0MoxO4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XdAJQ7ZE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YgL6kuDy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D5D60A5BC4
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 12:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2D5D60A5BC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XdAJQ7ZE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YgL6kuDy
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJa4C3773244
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 12:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	khMeO+3hnF7JoerFAErBwOXNznfce9mQZqJj+KNKRoI=; b=XdAJQ7ZEB6hhne+5
	/pCCL7npKvj8RGv+PwJjKr7VU9qQY2fWTJwG9CHWFuH89U6rVQKU4ddNFjiFOXFQ
	Qdtox4KbX/hJ3nXgpPYcmrzOXphDGJj3Z7jJsn0CeckyKHObkeRpfx5YozepbIo9
	LIOrMUz0g8jH8+Xeap//DF0ZYl+/54FAfpYqDl/AGtOkAl9VWXcN2fBNvbi3Jtad
	cUAxIExr70TlsPneA7k+E6MJcjJqgMoWVWDmupOvkLynm6DCf3Lo0l/ffRuvDXEP
	iBi/pD5tGtw1pbS6mL0y+zi3ZoS5ULgOu2K3yXe4rk7FCt0HCkuWfpMu5rbwlNxP
	qwUscg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2msp5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 12:24:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb91e288d7so959931a12.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 04:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794572672; x=1795177472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khMeO+3hnF7JoerFAErBwOXNznfce9mQZqJj+KNKRoI=;
        b=YgL6kuDykoD08hcibAhygAoL5g+A6v51+ViOGL8WsM7r8kSMFhDqcddR7x3ELFdJ3+
         jYkp+N5Ni3C4kNsqjKArz2j57x3AivV/FWLl3e3wx0yhiodfCwMRPzUmGiRvUcSWjI6q
         cJxJ43rX7MhXQFHp/VP2k8G6pawj4qQTYLUU1VVaeSi++GoGMVNNu7YL5dnjDYyNF5IO
         1A18iLd8Wp25El94tuK1K1oVcybiuscQjSoZEL/9VxqTdAp0gWA0hJp1/59S9xeZbhaZ
         ytwip7ir1C6gBd300mvTRBUPahILnfg0G0iwyflVWg+4FaI+vOQd54M8361UjEqaJZ8F
         yAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572672; x=1795177472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khMeO+3hnF7JoerFAErBwOXNznfce9mQZqJj+KNKRoI=;
        b=OxQTRjGPVQjL9wU785yYxezuQmoUQ/zQKgcQnkzf8RyEV1llyRUamXIswElUcyRHnw
         IX7h0KB7G3d6CE6ZDZmzxwmYejY3YxkFOtjulgt/18o6LLREVeKvOXF/rt4+Gp8hANKx
         aKXW+CuCkbAoh2B6xmi7N4JcF6lI8ilVhjnITMPM2tFwH+PsqIDujgQaHaRNCjMVWS3f
         /dstNQqkvH6ULuqZRpeaxZCpRAeNDD0sWWxFK8QEZUR8WRzHO+Ghveq43jr0RxKj4Ofm
         BLY094UU9vrzrYHvcqsuCVjJ/EeOyhyVnXhD3uaMFfPtvtbF81whO9nXLH9D7FesIwko
         z9AQ==
X-Forwarded-Encrypted: i=1; AL+hErGPmQiE2XEz3tYO80d2/jbFiRXdMaFluCy08ttFdPApalKP6FkyxUzZWjylTjVK3ARCmbwPojVfDr1G31AlBzEo@vger.kernel.org
X-Gm-Message-State: APuU4Z/x2J92b6CDDQ7tQafA0GlEuPCM5gq9JWZrP87lXr5xZRvYW/pa
	fvWMSdGkuuubatqlLUfIhb3bM+3Q1/NxQuNkVsrcHW50Sk+wOSbKE8qhHTh7gGrPVCGtS2z95I1
	drWGyKi0dPL7fBqJuk1w7mZF16kjFLixFnNBsA1IBcbva28kHgr5hAbNJQLmisGdsmJ9bToc9
X-Gm-Gg: AYBFou1I88H4DgP455bq/tIVOLktqBvcZwiGb7GrbPDUKpLl/JypHIwm0Oayx4aSSPt
	GG9egZTjuA5AbBU7kubeNbDxSG4FB0PPmkbf7HUoazFtdrBkNIz1ysHpzLQwJfgtw+tADGQ4ETB
	OFbGt5T0z+o/mNxzcNcytgnn7rRI4jKQeybPZDBAi/rX1JxrWyREPSd87rzQ1JM+CCDX3mOrI61
	/NEwU/xcT4eGLlrOyqWNce0SXWnSLDYNPVsqgIJi/kjAe9PUasMydyqKFqCw5hxh8TPXjKsLpeB
	hqyxgmuhWX/EwWHbz8Nf0NG+YAreLwo3OG4DHiZkElU/uRxNo6yzIrhrqZung5QysvgSFsith6W
	8NaEQeCUjpgOaQy47ZFc/wGYoA+Oh3Sali/89eQ6TNM3KnV7VdUOBsoTjNvQggMBoqhf7T7ldPY
	vLJJ7GTNlEgw==
X-Received: by 2002:a17:90b:1b12:b0:3b0:a3eb:759e with SMTP id 98e67ed59e1d1-3b1b09e5cb0mr1897984a91.17.1794572671700;
        Fri, 13 Nov 2026 04:24:31 -0800 (PST)
X-Received: by 2002:a17:90b:1b12:b0:3b0:a3eb:759e with SMTP id 98e67ed59e1d1-3b1b09e5cb0mr1897965a91.17.1794572671169;
        Fri, 13 Nov 2026 04:24:31 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1870ce8sm1098025a12.9.2026.11.13.04.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:24:30 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 17:54:13 +0530
Subject: [PATCH RFC 2/2] remoteproc: qcom_q6v5_pas: map SOCCP carveout
 privileged-only
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-nord_embedded_el2-v1-2-48f717e97066@oss.qualcomm.com>
References: <20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com>
In-Reply-To: <20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: Uu2TZcOEfvz9kVeT57cQ9dcFUoTd2_9f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX+5XONB1vwaek
 zOjkAKfMK9orL8XugbUcf3vFy8X46+kUWYUEWdU5e4sID6fRAYSIGhXW4Yqk7uCWaFpZ9C8FnRZ
 C71VBDn1JNrxD9qtfCUO30RWL3/AuU173loEmiUTI2bhItNlFRGEc0UJzrDavYK/RDRV63Y1liC
 7QJ0Ajbto7dm4sZreSUjwNMa1NlSCkC3PduRPzs2+3wg35UWbWgSH9dzoScX2H6zcaCXJRfaGPD
 TsBtYlXGKEbdiemGSZtPYC4P9xQXSNnwZoPUp9nwHo/jr0LJM6w6ovfm0ivIK/Ghzs1co6eGjVg
 ZfboTmNHwWrFGQznw9oVXhgN4/6fyRQV1BHcPO6pTw+MWyQYon4LWxPDuS1FSaeb0Q4aPfev11a
 s82RTnqHQ1mUcGeGY8LuVRO6kxlT6VoLTkbu8kLIGAnhnZ+3fYWsx0gbhd6TrdYab6KIOWJ2h0R
 6kbsQcsEJ7guV2W2gPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfXztdMnDoCwnhC
 mY6yy2mKxF0ETKw0zIqXhNWV9MkxnrDQRoEwN01A/QFA1zKfz1vNB+wfin6BaeysxJ4cs/Oy0LV
 QXjHcmsrEYkN6EcUUEE0DL9q87eXL38=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af70180 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=BpH2AGw4GZKVZVB5wQUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: Uu2TZcOEfvz9kVeT57cQ9dcFUoTd2_9f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130048

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

SOCCP is a RISC-V core whose instruction fetches go through the
SMMU in privilege mode

The memory region is mapped with IOMMU_READ | IOMMU_WRITE, which results
in permission fault when SOCCP fetches instruction, append IOMMU_PRIV to
mapping to allow it to fetch instructions.

Other PIL subsystems (e.g. Hexagon Q6) are not affected as their
instruction fetches do not go through the SMMU in privileged mode.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index dfe67f32e537..43218039e3d5 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -84,6 +84,12 @@ struct qcom_pas_data {
 	int region_assign_vmid;
 	bool early_boot;
 	bool needs_tzmem;
+	/*
+	 * flag to map the carveout as privileged-only. Required for
+	 * subsystems such as SOCCP whose instruction fetches go through
+	 * the SMMU in privilege mode.
+	 */
+	bool iommu_priv;
 };
 
 struct qcom_pas {
@@ -112,6 +118,7 @@ struct qcom_pas {
 	int crash_reason_smem;
 	unsigned int smem_host_id;
 	bool decrypt_shutdown;
+	bool iommu_priv;
 	const char *info_name;
 
 	const struct firmware *firmware;
@@ -297,11 +304,16 @@ static void qcom_pas_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, s
 
 static int qcom_pas_map_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
 {
+	struct qcom_pas *pas = rproc->priv;
+	int prot = IOMMU_READ | IOMMU_WRITE;
 	int ret = 0;
 
+	if (pas->iommu_priv)
+		prot |= IOMMU_PRIV;
+
 	if (rproc->has_iommu)
 		ret = iommu_map(rproc->domain, mem_phys, mem_phys, size,
-				IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
+				prot, GFP_KERNEL);
 	return ret;
 }
 
@@ -961,6 +973,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas->info_name = desc->sysmon_name;
 	pas->smem_host_id = desc->smem_host_id;
 	pas->decrypt_shutdown = desc->decrypt_shutdown;
+	pas->iommu_priv = desc->iommu_priv;
 	pas->proxy_pd_performance_states = desc->proxy_pd_performance_states;
 	pas->region_assign_idx = desc->region_assign_idx;
 	pas->region_assign_count = min_t(int, MAX_ASSIGN_COUNT, desc->region_assign_count);
@@ -1708,6 +1721,7 @@ static const struct qcom_pas_data nord_soccp_resource = {
 	.ssr_name = "soccp",
 	.sysmon_name = "soccp",
 	.auto_boot = true,
+	.iommu_priv = true,
 };
 
 static const struct qcom_pas_data sm8450_mpss_resource = {

-- 
2.43.0

