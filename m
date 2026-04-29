Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6EB401A0E
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 13:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777470158; cv=none; b=Zhj3bTYWV5QfpXIQkOdGvIWKuaNKUqskgcJMQnolmj3nELjyktqqz/cDjkByyU8ye0XfURWvoRPGTbZWrDLcK/6paIhCnBJWgP4UlJ1bsF+8wibUbu5tBRWDArY4Xmwr7USeeKvdbsBlZ4mxdYoPe5G9EU6aLIdpVP1nTmek6h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777470158; c=relaxed/simple;
	bh=DJ67pB+inv26z87nbeufl52/CsZL8UMBwYrlr7yDzHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s44yfbYPlvk9rqBHjCgm9/8MjxoTJA34Ud5cW2qoJd8daMqv5B2cyn4MIfaaoNmPDYQ/N5z/dWpdvC5XtBFgKCzu/7E0PVUVKu6I9+MsIwg2qGmr/KuUuL/Em3YjNjWvTwPnOiiAWBsXJRB2mXeEoBYiKJTCHQJSAoFhz8sztYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EpSNPWuN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqP331y8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EpSNPWuN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqP331y8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCLxK62485195
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 13:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ey1EcgzCeETB45FN3v8thWWy
	TAMm9RZnJD/dBNt9Ayk=; b=EpSNPWuNBtzVb7wps9/JYMuZXXliIyiIhRH4k3b3
	fNbr63jYxbM6FPtTcoxEhgqF/7A2aELesDquLAiZclTStoHzt6/jtLrKDqLTVyPz
	ihccrqEd9vpCcMJtPsTyOpb2FETVfGm2/yGO4BRdO2sdLwNltiT3l4mP/kM6rvhT
	PIt29gg+3GzVWDQF36bVgTd++vrhGNLtntM5AhNu8FFafIpGsn5FSwJfJG/5vB44
	EUUAK/0foOIhhioQVurmZe/YnNVyNBigsyPRuwXPSjSLfg3Gek8QAN5Cqkg4/+Xz
	4/TFxTuhm5AJG54FtMBE8YwplkQ6ASXW7APdLpczuO4FYA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duhx908e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 13:42:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da1c703d1so14890448a91.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 06:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777470145; x=1778074945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ey1EcgzCeETB45FN3v8thWWyTAMm9RZnJD/dBNt9Ayk=;
        b=SqP331y8kNmV4eVdF/Jb48bFzvJjak+ZES5xN7b9OlDOrImK8I1kfMdJpctTwXq8Cg
         BEQTUOcdYGzqh/pPeuSnVEqFdYvgYm7uqa77xv/IOh/59hEGKQoQ63iQwev/c3OqrNH2
         GBo/y9Qac9nA8sEBkVTMxY9R7Rng7uePKdSHd3ENM0iY7LM4l00jjFZTMZOAiutl3Vdv
         SnPP6Hd6lS+8KbDMpXGcH3rMrN3N1vB9aqT8RiNpg3RGn0yqteTA40Qgut7aravSe/H1
         DtGR2SC0b99qSt8Q4M++l+IKHeYLlvY04rfJYVWQ6FjiTdoj3svQ8ObKd6Gxf6hkrrVs
         JYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777470145; x=1778074945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ey1EcgzCeETB45FN3v8thWWyTAMm9RZnJD/dBNt9Ayk=;
        b=mm+fV08kpxPeuD/s1Xtjpx8nnU6xTNOWoRqgN2zk2C7k2uTD/aRmBK6m4ywF3usQSW
         WpgBdkCcQPLOHrNy8oL0mNOOOCPa0nrqFfw9oI9LYIZqAPhkiVwjvuKE3L8Rtp/woc6/
         CISrirN5VLyj+7mssPQlYHfc48AKmWy231sBuoEC7EG/+ck8KhqFMbn6945Z+X/u1PEf
         rbNA4EpdXJz9jqiTwqnIz/32HBjG/4TOxZ1PFCL+rXtbs+s2DKEvZVl7EXBGvKYOsI3M
         KU5zz2SKI0sp0fM7RA4JL68LkAcoOMkwYC1jfMCfDjT+IkjFsRAwxpMof1TpkgkzHmnT
         9EPA==
X-Forwarded-Encrypted: i=1; AFNElJ+InznSkq9WSCghykVloExOXTR7VlMDiao/aZb1kYygj5QMFRRLs0CDhJhmqC4HJHoCRWm8lOttN1wytzZQBnnI@vger.kernel.org
X-Gm-Message-State: AOJu0YyMagr5HEDdsEXFkipDiJq6x9XqtH4nL3N+cv7E+Wr09mmOaonn
	PeRHZUTz5tMUqNo5vLMmgvoGwb0n4WT18QXzBKrlcsjtXlkn2BXvNump1fewHCAQOQ25LKs2I9l
	FoiLQLSc4eYdPzNO0SGx8+0sbtvzK4m4fTPH9kxpxzBhBJ3RT56/YeS1gWRvP1hl4AluXNuaA
X-Gm-Gg: AeBDieuLZ/B0qhLgwD8uvFv3myaEeOUrjUdNsLphsLj+TM8f86RQ4t37VgYoDTd4JFQ
	fCYPofRkrHYLRqaQJNryEtNAbPGOUDMgEWP6EFggYvBbKPMPg8H2N7wHR5DvoAhZHmcqHiI5Hb5
	gfoDyNlie4l6pKv7675Upn7mkKQ1rnpJpzhfYBOZuvjCEUWjxT9I9tuW04YvQESsGZTL2CfKfQ8
	1J6WvZTC10/p78q6Kt57lEn50eKIZCNZFV2Ul/IAUr1hSbsyxk+QF/HrWrfrRcLwaYICmtjM8Cd
	5q/DDzYzFUZPylRrjqDtm0jTLtt8uTAnLIjcc39wYctHV6idaQA9gdo2aRjJd7R45o31S98dPZU
	dPjr57AT2sGVZbzUl9PMk1HFSR5VnU4IUtdMvT/q+8kUbKEtF9pVd3jKa4b4=
X-Received: by 2002:a17:90b:2ccb:b0:35b:a7be:ae47 with SMTP id 98e67ed59e1d1-3649204fb32mr7693652a91.21.1777470144740;
        Wed, 29 Apr 2026 06:42:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccb:b0:35b:a7be:ae47 with SMTP id 98e67ed59e1d1-3649204fb32mr7693557a91.21.1777470144037;
        Wed, 29 Apr 2026 06:42:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a27f32b1sm1370451a91.5.2026.04.29.06.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:42:23 -0700 (PDT)
Date: Wed, 29 Apr 2026 19:12:08 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v4 07/15] soc: qcom: mdtloader: Switch to generic PAS TZ
 APIs
Message-ID: <20260429134208.pqo67sh3jkvsa5ka@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-8-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-8-sumit.garg@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzOSBTYWx0ZWRfX09chjwwEXPrD
 6mIez8kAHPIlj2OvyQzS9el9nsCABgghsZvOeAT9/EvIjZwjVsHPb0rIz2anN1fWWo4AElffDUG
 KwLZleqkFqqGpRcZX1yWaGB0ByKVXlsfI5QeSuv7ONemwBFpRxdfotD2x+E7XuguR8Ihc9pkSpS
 KPdprbU5JOz3YS29fxHPlOzNUZWyTHTK6xKRF8OCOwZn9XUXwymptW67GcReJ1qqwMpwx2EWQDm
 YFH7nTbapoQod+QliMEWAtr/x4JdonNSdttb7wuhY9wlZEZG+LaOG1hMx4UHnTeg+OM6Cc8sqnj
 mgbeiVQAdoCSAxRBmWgzR0/jzhvo712x9aHoHVcP1YU2TFSINZXT1dbb9uHS1luaIzNP1Xw0cF1
 p68feSSIc0KKp/Bs2EexHQdw5vynUthSbMz24IA4s5lHc2SLyScHHguC8lAY98oRbzh0w+UJHab
 J4r1kg4HxPInUflqU6w==
X-Proofpoint-ORIG-GUID: PO7V2ReQ0ejYJs7IOvi97hU8ry_xTemg
X-Authority-Analysis: v=2.4 cv=O5oJeh9W c=1 sm=1 tr=0 ts=69f20ac1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xqloa5d6wBXDvm8eUWQA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: PO7V2ReQ0ejYJs7IOvi97hU8ry_xTemg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290139

On Mon, Apr 27, 2026 at 03:25:55PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch mdtloader client driver over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c       | 12 ++++++------
>  include/linux/soc/qcom/mdt_loader.h |  6 +++---
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index c004d444d698..fdde7eda538a 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -13,7 +13,7 @@
>  #include <linux/firmware.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> @@ -229,7 +229,7 @@ EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
>  
>  static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>  			       const char *fw_name, int pas_id, phys_addr_t mem_phys,
> -			       struct qcom_scm_pas_context *ctx)
> +			       struct qcom_pas_context *ctx)
>  {
>  	const struct elf32_phdr *phdrs;
>  	const struct elf32_phdr *phdr;
> @@ -271,7 +271,7 @@ static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>  		goto out;
>  	}
>  
> -	ret = qcom_scm_pas_init_image(pas_id, metadata, metadata_len, ctx);
> +	ret = qcom_pas_init_image(pas_id, metadata, metadata_len, ctx);
>  	kfree(metadata);
>  	if (ret) {
>  		/* Invalid firmware metadata */
> @@ -280,7 +280,7 @@ static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>  	}
>  
>  	if (relocate) {
> -		ret = qcom_scm_pas_mem_setup(pas_id, mem_phys, max_addr - min_addr);
> +		ret = qcom_pas_mem_setup(pas_id, mem_phys, max_addr - min_addr);
>  		if (ret) {
>  			/* Unable to set up relocation */
>  			dev_err(dev, "error %d setting up firmware %s\n", ret, fw_name);
> @@ -472,7 +472,7 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
>   * firmware segments (e.g., .bXX files). Authentication of the segments done
>   * by a separate call.
>   *
> - * The PAS context must be initialized using qcom_scm_pas_context_init()
> + * The PAS context must be initialized using qcom_pas_context_init()

Should devm_qcom_pas_context_alloc() now 

>   * prior to invoking this function.
>   *
>   * @ctx:        Pointer to the PAS (Peripheral Authentication Service) context
> @@ -483,7 +483,7 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
> +int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
>  		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
>  {
>  	int ret;
> diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
> index 82372e0db0a1..142409555425 100644
> --- a/include/linux/soc/qcom/mdt_loader.h
> +++ b/include/linux/soc/qcom/mdt_loader.h
> @@ -10,7 +10,7 @@
>  
>  struct device;
>  struct firmware;
> -struct qcom_scm_pas_context;
> +struct qcom_pas_context;
>  
>  #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
>  
> @@ -20,7 +20,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  		  phys_addr_t mem_phys, size_t mem_size,
>  		  phys_addr_t *reloc_base);
>  
> -int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
> +int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
>  		      const char *firmware, void *mem_region, phys_addr_t *reloc_base);
>  
>  int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
> @@ -45,7 +45,7 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  	return -ENODEV;
>  }
>  
> -static inline int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx,
> +static inline int qcom_mdt_pas_load(struct qcom_pas_context *ctx,
>  				    const struct firmware *fw, const char *firmware,
>  				    void *mem_region, phys_addr_t *reloc_base)
>  {
> -- 
> 2.51.0
> 

With above nit

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
