Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596074;
	b=5VJGDSeqnl7oHXW0afDEzZrnV0vTUChW3UX0BvYBHbnhIuYUprIZMQumd/ZhuEYWQgMm
	 tIiuWiwgdKlicjuigmec13IdvHbErsPBv3X2/cSwLuemgUGL40pbWoulJrr+axRW7UbVu
	 60Uz5qwW2vPm1IDamWJ7xJGmRL2cxSuk7EuS5S+BAHpZ/XTprscQV7j5PHMnjp2kXURtc
	 K7sHXVVK2SYEM3konhIomNmDMQarXawP1WWWnpPV9Mj7jEqoJF/5SP41Yw5megl4XEbIW
	 yMfKE3IXPeC42R1fSpelKl2eSWDZHBg/6R+7eNS/9L47q7rJK6hIF+HRWOMm2B9+kbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596074;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0iSH72bVkObJ6XNgFyC1IcqJNSUQhJ9lsse8nsmCQfg=;
	b=J+wAdUmdcC7teqPU0ryTTnrHwr7+UIQOGhOTvpSxR6X7L/TycvqSDRzah1zURLUyVkcc
	 zSaSPA7/TkJKqMgAxcuBveuEx5kw+u9O3H8ZECJA2aqGh0/8vtCL/+51gprqMAu6BhZ49
	 pp2d0eILDOnC0/g1EbbeiqRcmDmM4JbASoRfCK+tKE7SLOGUoiGKd5rfdrndAP0Q2wxj7
	 2QslpzLA9KTnFQITNObi4ti8YAhU7+h1koywQEwUEGQIJngZIqRGXcKNdQywvi8gOobOo
	 5t5ncnHb/ygYGA+vfQq9VvMf6706Inby0Sx35Hq4oGiHvL/O/Dp0FQXSW20w0b2SejQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nMKw03Ef;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JSrGZdFi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E5D60A6F66
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 18:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20E5D60A6F66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nMKw03Ef;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JSrGZdFi
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRLs31725171
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 18:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0iSH72bVkOb
	J6XNgFyC1IcqJNSUQhJ9lsse8nsmCQfg=; b=nMKw03EfbnLviR49OfokSBHZcX1
	3teGDzpcCErjbqy9PXFzmTwRaCV4+5x73O2NLnI/SKSfL4f2qZCpqc1QgU1yTAzZ
	bohP8oY2w7ysZYL4GeijVUVGjZY7i2fnxwZk4l3Y/fDVLpLWCVutBIrsxHb731+o
	cuGLy05Q3tQXaVx6N9MSEc6TSvYZ0Xwd7O4lyB85OjohreZ1Syo+huuxomIbZpA2
	lqiWOG+DWIpRlTAc9+m3ZF92IJCT954ZJedL0k4CgQ5wYF0T/Cb1c5E4opbQy3g+
	fr3Er1PGcfsphCEtqUsbEpgch8yp6k9CapUKDewaQDt+WybJVlFtR8LyAlA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx1bp9q7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 18:54:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d1353fdcdso5685958eec.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 10:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596072; x=1795200872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0iSH72bVkObJ6XNgFyC1IcqJNSUQhJ9lsse8nsmCQfg=;
        b=JSrGZdFiDkpbCuRGhVn9KZJeMsNNqNJkszqfdkyZ721lmPoXc18gesTudQe1f/R8W2
         tPFfHFCJDE4ZYUhuDbD5u9FIjSG/fhw7dNGqr3n9Jrza/dNnXebfDIRvvSxE+bRbxctC
         stpK7GCvS3ipI947fRtLLV7ZSunZ7daBNxCLtmNV/en1DLqfEL28Z1ZKazqzaHmvgpfX
         uz3kYMx7ZHzUH1EauhL3BeGVFY6GMn12KSgnbG1V7TY7nyNXeDqSs9czyQqPuT937Gml
         AKLX+898vVB+/y3zEnzshecxiFHEbL8nAmdRjEeifQHhihLaLa6sTtwM0SnI1id1S41t
         uWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596072; x=1795200872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0iSH72bVkObJ6XNgFyC1IcqJNSUQhJ9lsse8nsmCQfg=;
        b=Nv9TGRg8nVprw5bw72Li5YOYm2ZfTnVMeSwbRoJ6I7aLbEfDWc7D+2dNv1/WmN4D3B
         SYfFczCAxIkcyr//JaXFjXmtVF5qjbB5Zv4qz5EViCTUk23NipXuTpe6Z2CKJK6SHgs5
         3R4uSoKnJ9s9GdSDRkPBf9VT8qnWJ9uFfqXsNVeJYacs7WlANmbo1Ej7cmbJrtmkK3NB
         Z7PVPaTld9M/LS3EeCk6eRMh7fgZliFmfrK/rdvmmObK4+Xg2QZjt3dBUL+eViCY3m3p
         RrVP0jAOuj0rYQ3aPY+NKUZunsDMN8IU5E+wgr5Z5U6GqyL+a0zD7U94XJkoxYwZoGWH
         T8Gw==
X-Forwarded-Encrypted: i=1; AL+hErGcGXGBTpmmEvoirM3x41WuzYJDcQZmYmyNGPvC3OnZeWq+qtb2VcepAsRq6iRyC6v/34qknY6y+2CVMz7a776K@vger.kernel.org
X-Gm-Message-State: APuU4Z+m0jOO4vxcVi3sqPEcGczk4Yo0toNaDBF0FNSHPwVK4PRtbSj2
	2fv1AU5EAyCF5dGFchSZfAXQ4ES+uw27HqpxHRwXCBJ87i+n4pSRIfiofG7YVNcXng0XItY1N/+
	/insAZ8+vX3HZk8R7BQzzFrrCjja56rcyYVntyW4RWSgdXwv4OKQqjALwG2fnOKiyM56gqb1v
X-Gm-Gg: AYBFou2Hdp1ImXrq4J48GvLnxvR6BHbBiTE+x2gtr0y0WdW0Gc701Glz9P57T+XkpCU
	HSMdzGUdBrxnZAzdQcE5HcuHhJwsYamaR6lJAsCGK8L2L30uQPMleEZY1qyElzj0/hxEDUcXhLT
	QH4jAdSuSGp2SNYsEaq+fFixckYkwHxGhh1YsL1VvdV2p4i5kff80EMl39qBzoGV03h44MGinho
	4TAuutGTvN6iHK3gNUn4UeR+0+JydPjmpvYTm8+uzbyTSk9Yvy4ePhjtKW6QwTWar+09uf9yK0T
	drMNjXYK8jHzsRJF6RhunAI/NJRGsygbjn0bpBjZ6DOCxYKVZA0gUVS5D5GMWYSDV8VQjUebSik
	7IkBqJ8PgZ3aNj7+t13m5uN94TppSAkLiMNGkNbawvpjPRHAMCO8PGs27k3fZAxXEjfuwNFBICK
	g=
X-Received: by 2002:a05:7300:c594:b0:36f:a72d:29f with SMTP id 5a478bee46e88-37967ae6bf2mr3452315eec.34.1794596071728;
        Fri, 13 Nov 2026 10:54:31 -0800 (PST)
X-Received: by 2002:a05:7300:c594:b0:36f:a72d:29f with SMTP id 5a478bee46e88-37967ae6bf2mr3452284eec.34.1794596071051;
        Fri, 13 Nov 2026 10:54:31 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:30 -0800 (PST)
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
Subject: [PATCH v2 8/9] soc: qcom: mdt_loader: remove qcom_mdt_load()
Date: Sat, 14 Nov 2026 00:20:08 +0530
Message-ID: <20261113185009.157893-9-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=W9ytxhWk c=1 sm=1 tr=0 ts=6af75ce9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=GTbpKQ6npsRNubDcNtEA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: _u2lmSVfY_gOxDr7eLdhXr-Dkkp5Ak19
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX3ndkUxPTaVMn
 eCXy7v+vj0HqvMzsVjEC4tXcvQ/jNtosWoC9kA0UD5luTAD4L++nsqzs7dX5As36suN7rf66pnT
 I6XfUxThwoMMB7xg8ZeJrGCnc/SeS8c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX+2EvQDkfhwKy
 Ii+2fA6kh5RPl8/XG9DLsJO2uYotZl+p2s3Mx9XAnwzs9fPAwRXNb15ktAuxpby6IjQ4WMGWJAq
 MN3B8ynrgekKn1WLxsp+8BgferM7fQfHOsSlBRkroKX2eQVyX1CAumw3/kkIe90Qi/n27ZE38zY
 xu7pZUzFhwceUbqsrnz8c8m610vXBnux86F5syVX2J3rdPJkhr3Je7+XO+U3zwcWeh81SPlCRjb
 8gYEAumKgM6bzw8qnyuU1Omy3Yu+xqbCTX7Oaf2qD52/foB6TKxCaCL3JSF3tc8h36FYcvSSNeL
 aKhkfpK5NzizTDorjzyC84TLvhZ9C9gMN1Wi5RvRn5NV+P9/2mbn7vi/DmvnO3ZUYTqyTkBdg5D
 WzIH2BqRAftpbiQ7BSt9yvc6WA7eFHUVasu3SmWbFMPrsp3DrLZu5u6gKWskbuyGsWUCck8+Lfc
 9Pt5YbfJ725hZcFkcOA==
X-Proofpoint-ORIG-GUID: _u2lmSVfY_gOxDr7eLdhXr-Dkkp5Ak19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

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
index c6ec67e1da09..fd638833b17e 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -329,7 +329,8 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw)
  * @dev:	device handle to associate resources with
  * @fw:		firmware object for the mdt file
  * @fw_name:	name of the firmware, for construction of segment file names
- * @mem_region:	allocated memory region to load firmware into
+ * @mem_region:	virtual address of the memory region to load firmware into,
+ *		or NULL to have the region mapped internally with ioremap_wc()
  * @mem_phys:	physical address of allocated memory region
  * @mem_size:	size of the allocated memory region
  * @reloc_base:	adjusted physical address after relocation
@@ -344,6 +345,7 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
 	const struct elf32_hdr *ehdr;
+	void __iomem *mapped = NULL;
 	phys_addr_t mem_reloc;
 	phys_addr_t min_addr = PHYS_ADDR_MAX;
 	ssize_t offset;
@@ -353,12 +355,22 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
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
@@ -437,39 +449,13 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
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
@@ -489,21 +475,14 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
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

