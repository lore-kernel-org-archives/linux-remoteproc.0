Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316DE39A7FB
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2026 12:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356961; cv=none; b=YJsQ1uQoe8CABqwnR+QmymapbjyJImUHih0xcwvtkii7vgmPhqgke8rrKbQwvqWMofvw2iHWfEoUa9WxDBgypzOywhMwwD6xiZ4cBYZJ+Q+Sumtme2oht53aaIFaKgK3pGV5gTVt2224VECnqnJOEkcJhfWJP69Fep7qSflaL+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356961; c=relaxed/simple;
	bh=OZzCm0pREu38XtnmAUWuZI8sCEhWjQNUyllQZ03yeAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+bdaiEym5fHkRk+WcdM8PYHLlPzIWm0ZOm5Tc+0jVwdpGzGHcdsEwTuI004CRPce2X02SZ6Njo1jboW/YqvTXIAZTCbbxNas56C4NVV3lI4quV0grQuif0AnLAN1KqMHTufHxf8cEskELTodQbqqS4WymlMBkckJ6l8gLFNs7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTTemTDG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TZtrjJ2M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTTemTDG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TZtrjJ2M"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OC381W1817310
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2026 12:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R8roXgboVbXmLAakQqmWnWPH
	OFL6HEqIKar4eXesNtE=; b=gTTemTDG1GsbjCLZHj6Vw8jfyIWzo9yapyLkPjnH
	IINS/aD62jOEF6hwY0Rp8vIVS4tsWZkMZy0YNW2xLnKKLJWsnJ/HW/ApPTdOTVFF
	bxGSalH0wwoivPMnk4u5sJvp6OLLRCoE9/Wq9ZdreZOl+7Uhr0qafFK7KT8KB8dR
	Bzez5AOwy/s3c6pHFIVCqbsu0cECrx56j4JGq5WHdwAhl0hh+E4KmNcC6ApREkEv
	VaE+63U2/P9UTHjr5wVymiEqFs3OJMO1qDil2AZt6hkwBCqxVZcDlj2V8Q0iT/YM
	SzUXNQ4nSYegv/zENHqJu1paIzxJVftuIYbZbbJTCo3WBg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9eg7cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2026 12:55:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b079b4a8c3so42386185ad.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2026 05:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774356958; x=1774961758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R8roXgboVbXmLAakQqmWnWPHOFL6HEqIKar4eXesNtE=;
        b=TZtrjJ2M7zllhtvRuT7wok7jqu7fGzZKB8vyfWFZvJAQOA5CcAMycSXiZ8GSk4hCdG
         N3FATeoGvBSfxbb1Wtu/bULmbWU8YWySWhuI0ApafIXZqJNuYAwZ0uTNc8YfEc0RJsB/
         R/94yx1PkJv5uKtVI1VVr/2NpsO5V0C7TAPL70adBzvcJqs18LBYzqepIYsWov13MDcl
         L9p/RAL0fCP13vW+2Flq+oGEUyaxakUhk1tC2NNeKXrAO4GYB+D5+6I2PN7kLWGUqxgX
         g3t9DueiRDsc5e/2cw+4zw1hWiDViOnlbMLOKV+rRSZ9Vv+9upMA9CWzeA9hgXAwpYNy
         jLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774356958; x=1774961758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8roXgboVbXmLAakQqmWnWPHOFL6HEqIKar4eXesNtE=;
        b=iBxm+KQl8GdNN95h8IKdYZwlTyq1NEefjcgn9W4DThF42UCGIA6iLIRhtyxC6+RlVk
         qWC+1wjU6s8BHuUGet+7I7aoOUNXvWnnyKUpOtVx7SG8yQt+7A24U0ijM8JcmdS/ev9j
         rg8IHnjARhsHC60RB6FV51tOIuaG8fw9Pzfb74VCei/o7bZJb49KMn42G/mCunLjOfkj
         R55VlaeXeulG4dM3eYuOl+j6OAFg6XmJTFkIrhoQv9bGeoz+dFy3Dic01CCEvFOi2XNf
         P6oyLMnF4Dao6DBP6Y3/hXvDkQJnOfMUIabTWxJJeYdQsmUb9g4pF8DThF1LhhNMFhHx
         i6/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNRz4H4/Hea3vDnD3nCeb6XwtM2SStiZ/dKvYbVXfYryCAM0w7I7jhG1hD1etbJ04AzanY/0OeNXkJFln/I6kd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyt6tbn+R8yzMv2DzjNRTsB+mxD4mDRbU52r9OjnaRYELwJBTQ
	ZKwo06gDwWBoFdhkbebFmwnEDEOkn+OxE2+EJGpIk0id6EMIGncHh1Hh8BpmTpLwfIuMiFg3Ueb
	ZS5jbB/h90YLzh1BF2s6PPf9Gj0JkUp2e36vfRA+MqOlwF2b+4GBrMSZUzbOKsXAfzt9FH1QBzQ
	piIYKh
X-Gm-Gg: ATEYQzyRXbmYhBG3i3M5m3U+p7DeewdK4/QTIe1d5DK/MuHU3gnnH43dfvR8nbRTHCT
	lnppypMSrdEbHtsGRGVThwS5pKWFl4QjlPjugh4G2hiJH/uc+UNALuAO65oym7X2LJTtPGz6qN/
	4MbpKB+Uhnj61C6heihJn7PnfaiQv4dZMIvlBxJvZqpDK36mSCFb6msxxDLkZJ3430QUf9G5tTj
	qk84FoYAW4gga4TuSKcRdgDsvZRm13fMSOZefhi8S7NTpvlfmxWan1qeEaSkoBU1lV+LwS6eUDY
	58945fYRKrRHpDAPHEqDvPeYcuDQYouCd010Zn183Uv7ZcBEnzUZSRHS+MDpbCRC6wlx5OCWC1W
	MBu4X8JnBTRbPXCYD9loXzbzNsBJqRrls64k7FpedfvmMu36d
X-Received: by 2002:a17:903:2b04:b0:2b0:51f6:d46e with SMTP id d9443c01a7336-2b0826f6ce5mr154647415ad.15.1774356958356;
        Tue, 24 Mar 2026 05:55:58 -0700 (PDT)
X-Received: by 2002:a17:903:2b04:b0:2b0:51f6:d46e with SMTP id d9443c01a7336-2b0826f6ce5mr154647155ad.15.1774356957830;
        Tue, 24 Mar 2026 05:55:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835298acsm151649845ad.22.2026.03.24.05.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 05:55:57 -0700 (PDT)
Date: Tue, 24 Mar 2026 18:25:52 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Map/unmap subsystem region
 before auth_and_reset
Message-ID: <20260324125552.q6czexiybos2r46x@hu-mojha-hyd.qualcomm.com>
References: <20260310135205.2497789-2-mukesh.ojha@oss.qualcomm.com>
 <202603190738.1VFMgKNm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603190738.1VFMgKNm-lkp@intel.com>
X-Proofpoint-ORIG-GUID: yS1OeSJZw_BkgAacMIjjePDntzQDINAT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMiBTYWx0ZWRfX6bghacY5CWhT
 FmOcSrXuzNnfD6yTjIfdNXbLBKWAYPlP2fv4eHKuzivfvy8DaAt8X/HiT+3iCvMTTZhc0yA/wMO
 a3kTL2PSPnd6AfI+GhIOedsz4ifn2Dj0MTGpmIqm2oCeYRh8nnXGt0lAtNhc1c1YNcD+eA7Jneb
 QeQxj7Dgb2zLuvgoNRU7uGR0hjST6TkmFuQPR7Prxs4PexGaVbQJ6pyPkavj5yYH+FSWXJhrVf3
 TSsveYICkCLD3YKwrioTXihCrcVTXlP39JPQXCsY+pNLyJhXtCei/2f9Hk4JZ1/oYUlrRxxmxVp
 z+bodRh80UPmEQCVFuwPP88N4TrNASuQbxgTCHR09q7eu33kZFhnGNWflcyaa5bfjTLAuFNQR91
 JHKT7LcqeU2sTmDmgNK++TAYDqgNqCtYOkKuxQF8RQtH+7VvOnVQLY71k4dpew96+l7Tmf5e4pQ
 USOaLMcCN+Yn0N+uMtQ==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c289df cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=4kh2CpByiCJpsNi5vckA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: yS1OeSJZw_BkgAacMIjjePDntzQDINAT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240102

On Thu, Mar 19, 2026 at 07:20:26AM +0800, kernel test robot wrote:
[...]

Bjorn,

Some sparse error are even seen without my change, should we fix them ?

-Mukesh
> 
> sparse warnings: (new ones prefixed by >>)
>    drivers/remoteproc/qcom_q6v5_pas.c:141:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mem_region @@     got void [noderef] __iomem * @@
>    drivers/remoteproc/qcom_q6v5_pas.c:141:25: sparse:     expected void *mem_region
>    drivers/remoteproc/qcom_q6v5_pas.c:141:25: sparse:     got void [noderef] __iomem *
>    drivers/remoteproc/qcom_q6v5_pas.c:148:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got void * @@
>    drivers/remoteproc/qcom_q6v5_pas.c:148:45: sparse:     expected void const volatile [noderef] __iomem *src
>    drivers/remoteproc/qcom_q6v5_pas.c:148:45: sparse:     got void *
>    drivers/remoteproc/qcom_q6v5_pas.c:250:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *dtb_mem_region @@     got void [noderef] __iomem * @@
>    drivers/remoteproc/qcom_q6v5_pas.c:250:37: sparse:     expected void *dtb_mem_region
>    drivers/remoteproc/qcom_q6v5_pas.c:250:37: sparse:     got void [noderef] __iomem *
> >> drivers/remoteproc/qcom_q6v5_pas.c:260:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *dtb_mem_region @@
>    drivers/remoteproc/qcom_q6v5_pas.c:260:28: sparse:     expected void volatile [noderef] __iomem *addr
>    drivers/remoteproc/qcom_q6v5_pas.c:260:28: sparse:     got void *dtb_mem_region
>    drivers/remoteproc/qcom_q6v5_pas.c:344:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mem_region @@     got void [noderef] __iomem * @@
>    drivers/remoteproc/qcom_q6v5_pas.c:344:33: sparse:     expected void *mem_region
>    drivers/remoteproc/qcom_q6v5_pas.c:344:33: sparse:     got void [noderef] __iomem *
> >> drivers/remoteproc/qcom_q6v5_pas.c:354:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *mem_region @@
>    drivers/remoteproc/qcom_q6v5_pas.c:354:20: sparse:     expected void volatile [noderef] __iomem *addr
>    drivers/remoteproc/qcom_q6v5_pas.c:354:20: sparse:     got void *mem_region
>    drivers/remoteproc/qcom_q6v5_pas.c:481:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mem_region @@     got void [noderef] __iomem * @@
>    drivers/remoteproc/qcom_q6v5_pas.c:481:25: sparse:     expected void *mem_region
>    drivers/remoteproc/qcom_q6v5_pas.c:481:25: sparse:     got void [noderef] __iomem *
> 
> vim +260 drivers/remoteproc/qcom_q6v5_pas.c
> 
>    124	
>    125	static void qcom_pas_segment_dump(struct rproc *rproc,
>    126					  struct rproc_dump_segment *segment,
>    127					  void *dest, size_t offset, size_t size)
>    128	{
>    129		struct qcom_pas *pas = rproc->priv;
>    130		int total_offset;
>    131	
>    132		total_offset = segment->da + segment->offset + offset - pas->mem_phys;
>    133		if (total_offset < 0 || total_offset + size > pas->mem_size) {
>    134			dev_err(pas->dev,
>    135				"invalid copy request for segment %pad with offset %zu and size %zu)\n",
>    136				&segment->da, offset, size);
>    137			memset(dest, 0xff, size);
>    138			return;
>    139		}
>    140	
>  > 141		pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
>    142		if (!pas->mem_region) {
>    143			dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
>    144				&pas->mem_phys, pas->mem_size);
>    145			return;
>    146		}
>    147	
>    148		memcpy_fromio(dest, pas->mem_region + total_offset, size);
>    149	}
>    150	
>    151	static void qcom_pas_minidump(struct rproc *rproc)
>    152	{
>    153		struct qcom_pas *pas = rproc->priv;
>    154	
>    155		if (rproc->dump_conf == RPROC_COREDUMP_DISABLED)
>    156			return;
>    157	
>    158		qcom_minidump(rproc, pas->minidump_id, qcom_pas_segment_dump);
>    159	}
>    160	
>    161	static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
>    162				       size_t pd_count)
>    163	{
>    164		int ret;
>    165		int i;
>    166	
>    167		for (i = 0; i < pd_count; i++) {
>    168			dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
>    169			ret = pm_runtime_get_sync(pds[i]);
>    170			if (ret < 0) {
>    171				pm_runtime_put_noidle(pds[i]);
>    172				dev_pm_genpd_set_performance_state(pds[i], 0);
>    173				goto unroll_pd_votes;
>    174			}
>    175		}
>    176	
>    177		return 0;
>    178	
>    179	unroll_pd_votes:
>    180		for (i--; i >= 0; i--) {
>    181			dev_pm_genpd_set_performance_state(pds[i], 0);
>    182			pm_runtime_put(pds[i]);
>    183		}
>    184	
>    185		return ret;
>    186	};
>    187	
>    188	static void qcom_pas_pds_disable(struct qcom_pas *pas, struct device **pds,
>    189					 size_t pd_count)
>    190	{
>    191		int i;
>    192	
>    193		for (i = 0; i < pd_count; i++) {
>    194			dev_pm_genpd_set_performance_state(pds[i], 0);
>    195			pm_runtime_put(pds[i]);
>    196		}
>    197	}
>    198	
>    199	static int qcom_pas_shutdown_poll_decrypt(struct qcom_pas *pas)
>    200	{
>    201		unsigned int retry_num = 50;
>    202		int ret;
>    203	
>    204		do {
>    205			msleep(QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS);
>    206			ret = qcom_scm_pas_shutdown(pas->pas_id);
>    207		} while (ret == -EINVAL && --retry_num);
>    208	
>    209		return ret;
>    210	}
>    211	
>    212	static int qcom_pas_unprepare(struct rproc *rproc)
>    213	{
>    214		struct qcom_pas *pas = rproc->priv;
>    215	
>    216		/*
>    217		 * qcom_pas_load() did pass pas_metadata to the SCM driver for storing
>    218		 * metadata context. It might have been released already if
>    219		 * auth_and_reset() was successful, but in other cases clean it up
>    220		 * here.
>    221		 */
>    222		qcom_scm_pas_metadata_release(pas->pas_ctx);
>    223		if (pas->dtb_pas_id)
>    224			qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>    225	
>    226		return 0;
>    227	}
>    228	
>    229	static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>    230	{
>    231		struct qcom_pas *pas = rproc->priv;
>    232		int ret;
>    233	
>    234		/* Store firmware handle to be used in qcom_pas_start() */
>    235		pas->firmware = fw;
>    236	
>    237		if (pas->lite_pas_id)
>    238			qcom_scm_pas_shutdown(pas->lite_pas_id);
>    239		if (pas->lite_dtb_pas_id)
>    240			qcom_scm_pas_shutdown(pas->lite_dtb_pas_id);
>    241	
>    242		if (pas->dtb_pas_id) {
>    243			ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
>    244			if (ret) {
>    245				dev_err(pas->dev, "request_firmware failed for %s: %d\n",
>    246					pas->dtb_firmware_name, ret);
>    247				return ret;
>    248			}
>    249	
>  > 250			pas->dtb_mem_region = ioremap_wc(pas->dtb_mem_phys, pas->dtb_mem_size);
>    251			if (!pas->dtb_mem_region) {
>    252				dev_err(pas->dev, "unable to map dtb memory region: %pa+%zx\n",
>    253					&pas->dtb_mem_phys, pas->dtb_mem_size);
>    254				goto release_dtb_metadata;
>    255			}
>    256	
>    257			ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
>    258						pas->dtb_firmware_name, pas->dtb_mem_region,
>    259						&pas->dtb_mem_reloc);
>  > 260			iounmap(pas->dtb_mem_region);
>    261			pas->dtb_mem_region = NULL;
>    262			if (ret)
>    263				goto release_dtb_metadata;
>    264		}
>    265	
>    266		return 0;
>    267	
>    268	release_dtb_metadata:
>    269		if (pas->dtb_pas_id)
>    270			qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>    271	
>    272		release_firmware(pas->dtb_firmware);
>    273	
>    274		return ret;
>    275	}
>    276	
>    277	static void qcom_pas_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
>    278	{
>    279		if (rproc->has_iommu)
>    280			iommu_unmap(rproc->domain, mem_phys, size);
>    281	}
>    282	
>    283	static int qcom_pas_map_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
>    284	{
>    285		int ret = 0;
>    286	
>    287		if (rproc->has_iommu)
>    288			ret = iommu_map(rproc->domain, mem_phys, mem_phys, size,
>    289					IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
>    290		return ret;
>    291	}
>    292	
>    293	static int qcom_pas_start(struct rproc *rproc)
>    294	{
>    295		struct qcom_pas *pas = rproc->priv;
>    296		int ret;
>    297	
>    298		ret = qcom_q6v5_prepare(&pas->q6v5);
>    299		if (ret)
>    300			return ret;
>    301	
>    302		ret = qcom_pas_pds_enable(pas, pas->proxy_pds, pas->proxy_pd_count);
>    303		if (ret < 0)
>    304			goto disable_irqs;
>    305	
>    306		ret = clk_prepare_enable(pas->xo);
>    307		if (ret)
>    308			goto disable_proxy_pds;
>    309	
>    310		ret = clk_prepare_enable(pas->aggre2_clk);
>    311		if (ret)
>    312			goto disable_xo_clk;
>    313	
>    314		if (pas->cx_supply) {
>    315			ret = regulator_enable(pas->cx_supply);
>    316			if (ret)
>    317				goto disable_aggre2_clk;
>    318		}
>    319	
>    320		if (pas->px_supply) {
>    321			ret = regulator_enable(pas->px_supply);
>    322			if (ret)
>    323				goto disable_cx_supply;
>    324		}
>    325	
>    326		if (pas->dtb_pas_id) {
>    327			ret = qcom_pas_map_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
>    328			if (ret)
>    329				goto disable_px_supply;
>    330	
>    331			ret = qcom_scm_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
>    332			if (ret) {
>    333				dev_err(pas->dev,
>    334					"failed to authenticate dtb image and release reset\n");
>    335				goto unmap_dtb_carveout;
>    336			}
>    337		}
>    338	
>    339		/*
>    340		 * During subsystem restart, when coredump is enabled, region is mapped but
>    341		 * not unmapped there, NULL check to reuse the mapping if its already mapped.
>    342		 */
>    343		if (!pas->mem_region) {
>    344			pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
>    345			if (!pas->mem_region) {
>    346				dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
>    347					&pas->mem_phys, pas->mem_size);
>    348				goto release_pas_metadata;
>    349			}
>    350		}
>    351	
>    352		ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
>    353					pas->mem_region, &pas->mem_reloc);
>  > 354		iounmap(pas->mem_region);
>    355		pas->mem_region = NULL;
>    356		if (ret)
>    357			goto release_pas_metadata;
>    358	
>    359		qcom_pil_info_store(pas->info_name, pas->mem_phys, pas->mem_size);
>    360	
>    361		ret = qcom_pas_map_carveout(rproc, pas->mem_phys, pas->mem_size);
>    362		if (ret)
>    363			goto release_pas_metadata;
>    364	
>    365		ret = qcom_scm_pas_prepare_and_auth_reset(pas->pas_ctx);
>    366		if (ret) {
>    367			dev_err(pas->dev,
>    368				"failed to authenticate image and release reset\n");
>    369			goto unmap_carveout;
>    370		}
>    371	
>    372		ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
>    373		if (ret == -ETIMEDOUT) {
>    374			dev_err(pas->dev, "start timed out\n");
>    375			qcom_scm_pas_shutdown(pas->pas_id);
>    376			goto unmap_carveout;
>    377		}
>    378	
>    379		qcom_scm_pas_metadata_release(pas->pas_ctx);
>    380		if (pas->dtb_pas_id)
>    381			qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>    382	
>    383		/* firmware is used to pass reference from qcom_pas_start(), drop it now */
>    384		pas->firmware = NULL;
>    385	
>    386		return 0;
>    387	
>    388	unmap_carveout:
>    389		qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>    390	release_pas_metadata:
>    391		qcom_scm_pas_metadata_release(pas->pas_ctx);
>    392		if (pas->dtb_pas_id)
>    393			qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>    394	
>    395	unmap_dtb_carveout:
>    396		if (pas->dtb_pas_id)
>    397			qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
>    398	disable_px_supply:
>    399		if (pas->px_supply)
>    400			regulator_disable(pas->px_supply);
>    401	disable_cx_supply:
>    402		if (pas->cx_supply)
>    403			regulator_disable(pas->cx_supply);
>    404	disable_aggre2_clk:
>    405		clk_disable_unprepare(pas->aggre2_clk);
>    406	disable_xo_clk:
>    407		clk_disable_unprepare(pas->xo);
>    408	disable_proxy_pds:
>    409		qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
>    410	disable_irqs:
>    411		qcom_q6v5_unprepare(&pas->q6v5);
>    412	
>    413		/* firmware is used to pass reference from qcom_pas_start(), drop it now */
>    414		pas->firmware = NULL;
>    415	
>    416		return ret;
>    417	}
>    418	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
-Mukesh Ojha
