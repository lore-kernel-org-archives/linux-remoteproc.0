Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242171F4CB3
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Aug 2026 12:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761096; cv=none; b=eCzapSr+4uIYzUGROa4Hs5hnF8JGOK4R/Be3p1uTsYdYlIbR5kvBhdeXRygxTQVxa1JX0Yq4tfbVM2C9kvaw0o7S2UDXQqv29nBRj/09IqTYdJkiZi0xndduT8y6GU7iCYUcc255lVL3i9SMnONT1nTV0gmS3js+aMD76Kt859Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761096; c=relaxed/simple;
	bh=m0MjEAjAa3m4MAFFaWYqhHdmua9fODvkFTLu52h/HNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juP4xyjVeZAlrkZOdHmI44g5lOrnnqNc6b9tWk8F5EBOPOzKQRFWAbby3uSY1kLNKRI6vj/Rhy4Vai56bGAtqSzbyxxNHEL7ldZg0VcECm6OSH+5UKmQL7lRrnnvqh8VvrrJACe6i9JGpPWQ6/1AfydfO48EgDsI3CJUSEfBPfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rv/7586T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TxfLFqSc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rv/7586T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TxfLFqSc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673C4UZl547865
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Aug 2026 12:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wiEjTOr3Tm8yOp0qFz6uuY1u
	b8uyFumZPZODy1x9kgM=; b=Rv/7586TZlq48QMpNvzBveC6QSqWLykdxbKnItyC
	NcAz9na8VqqzgmTz3GgZokclIMz+6pJ8DKj5ON6+iZU5O5yMs8PwVOGNI16724A2
	A8fehusGD5zgiZNSXiGhTcxJjr5mxgvkzL+2RhRUkcYaKa4YRMI3LikUkf4EEpxJ
	/j499oC5MXABrMiU/d34CWD42A9dVd4DpzucuItUxAxvaAjq4ttJaWRokHaDOGWa
	x5gjKhlPPrIFGTZkIrZhtl8j/YkYqghF0X+bN9W/7ZnuItHcyVVVIkXBnyaAjTra
	qvLIYgb4EhyJJBHsB6TF+3Vyg3rnwBAXkOX/Z3iPbc/hBA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvnhh6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 12:44:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so2378812a12.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 05:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785761092; x=1786365892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wiEjTOr3Tm8yOp0qFz6uuY1ub8uyFumZPZODy1x9kgM=;
        b=TxfLFqScnYoyjCZWB0GLF6D01fHcuUIjWjW3kkX9OuTYS3XXxQ/bMAkeTCHbIsHFlZ
         2zSwrua0Zb3vrqs4UKIYJM/PUnoyI+KaZde3s+hdRwMb79AjV7oxRmBhRW2LhF3oULbk
         ZgY2P2AusRHbgWPbKztWwNeljnfGRPgygjDcIRVRK4+NX03ZKkReWFYR0YaTNhpPZlS4
         DWQtWc1asCZ8Ec/RWk6VZW1NNnt5MvnLFNWKz5MR0rNSa9tYcnlUm8r09iYLLefUt+ZP
         FDSGeYtjA/s8ZY36TB9/A92sWWnkW72c9ri2+Mgj8NFEF40clLNVLEgYBnyvSvYBuKZI
         QG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785761092; x=1786365892;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wiEjTOr3Tm8yOp0qFz6uuY1ub8uyFumZPZODy1x9kgM=;
        b=fY7AIKOvaJQROTZbrdVqh2Gaa2QTwEj7F2BN/JaGqc5AIS3dMNwolaWgaNkXHcLtCk
         bcSe2jkkbV7yU1zeBhPIs7mPxsPWTHZrylfX8JJldsB+lSuZRh/bbxYVLzTM6rUNCAuA
         Q+HA+NF3+feWYmin/dkzxvCElSRzeYRaeI1h/hwA7Iq8mLXjHFS9nTKQN9a9IEGoRhv0
         bgSsYii35JTw6K7/JvMvrar2RDKPSD29msPvqV3HTSLMoLgfTcIHDsrwY7MT3nPN0AFc
         8Oj94UVb4Re1NGouO87JD/vUehmgOpwikMMegzYGhkdE35QrxNXmMC6ebHBzk2i4g0Gn
         Tn/g==
X-Forwarded-Encrypted: i=1; AHgh+Rq2WSxYdKZ1EX/vP53VcyeJm+bAn0dJzhp2e1qDWrw/dm1TbF7NQjOgqy8szr6+v2Mqm3vIEeQoz8/XpWZxATFF@vger.kernel.org
X-Gm-Message-State: AOJu0YyuMjj4wPwDWc/aVjeXfWsfnYFLtXcec8GtoVzxMDTZJbr3rQ/e
	y/lcneYZ0Ksg0ir1pLdo+4n0HK3skLXM6Yy0rUIa/w77LiDLUA8rQI2HBUXYdvh43mgjdUccmV9
	e9chC25WIewk0c/pw5mk2IiveW72Em9T1/pQR28jeqbW8wSyMkte5BCxrpoU9A98AQ8UktYII
X-Gm-Gg: AR+sD103v5/nM9YqhFE4ebVODrnSdRSBTCXW5RXpDPdqi4Ys1/Jn5kkXFT0PIwaN+G8
	nnlE6rvESsclKIdH97D8nrUJtCySPCtqDQ5DzKJ++sWV+wvUkimWRzIK6tgwGl+yurRiRYgvQmh
	fccJTTjbe5IGlhzwn+HsVJaKqvC0oa1b0YJc6GmtOHwS+ycZIO9jzEA7+hmswfxY3BiG4aXTjO4
	iJ/JQ4hAjVFeXdtpteRtKzsnOT8GcapirdQ6MIrwHFpv8i2HNfoq4iUkT+jQiB0h3QTDG9cg4bz
	Wo8Yjoc1+ns/R+xENw+YR78D2nHVbuzBk+lwQKxcujbQcyfY7c6dGwAfpQZA1AyRoMkn3ZXec4J
	7p8w7tmeQ8MpeafEngU9sOKcKylo=
X-Received: by 2002:a05:6a21:4514:b0:3c3:a529:1e44 with SMTP id adf61e73a8af0-3c92a8d6802mr10817195637.57.1785761091594;
        Mon, 03 Aug 2026 05:44:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:4514:b0:3c3:a529:1e44 with SMTP id adf61e73a8af0-3c92a8d6802mr10817145637.57.1785761090937;
        Mon, 03 Aug 2026 05:44:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ddd7a33sm35397081eec.12.2026.08.03.05.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 05:44:50 -0700 (PDT)
Date: Mon, 3 Aug 2026 18:14:42 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v14 3/9] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
Message-ID: <20260803124442.krqtw6si4ujsnuul@hu-mojha-hyd.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803-rproc-v14-3-a1f87b0b0ad2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803-rproc-v14-3-a1f87b0b0ad2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a708d44 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=BXM0GNU5JGEDd1tv9sUA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: NsVdG6ChmsOCE8KIjkAjw7lH4Gmvc5ZO
X-Proofpoint-ORIG-GUID: NsVdG6ChmsOCE8KIjkAjw7lH4Gmvc5ZO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDExNCBTYWx0ZWRfX/UDzUL5nTv5m
 T+ApGMKAhKWmfFkCo2fAP3HGdQqt/YgyAKst0cqFN9So2tWEOE55S+VbJXzFMbCd7lS3aW0u0HX
 vlDaDlg8aQ5eKD+u6GTGIf17ozIBE2eooe4bU2JmsTnpr71YizvssJofkscuFhIc/xMIejWIuP9
 F40aHOIxEt4f2rLylkqxLDu7JlW0UyJx/PtIDRgc7Ix1JO6FYT9amfdXbcHte0po3O5FZZj76Gy
 EDmyL6Nhe5l3GaWsRVLsUm7HvYAg14P7BbcT9Wmph9n6LZUQYm0AggiKwcU8vIv821pxTFsWULr
 apUKMIS+aEiKdLxktKXkNzsw0WArKUlweNVuqVy3k7BIrTkn7jCo+uxtcOCT37xfpWdeUglqwbM
 a5p1DJpuMh9EBXRu2C80usHrXfeDhL9Ti8sVz6+bDsk6ayfqMzJ2lArsf1MjUkNPW8MRRPDrnsQ
 cJJhCBaj0kgBz5Cc/6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDExNCBTYWx0ZWRfXxm9z8jnHzzsF
 ZHM6DCXd8j0VZB3c/oS3XbxGx+mbHCxBKual4+KnOZmQuFu9LpW0BxJ3HnjspWQ02VC0EqBId5z
 VQkysS+40W1UsJP+QqU5OYVw+TQu23c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030114

On Mon, Aug 03, 2026 at 04:16:09PM +0530, Varadarajan Narayanan wrote:
> From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> 
> Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
> SoCs support secure Peripheral Image Loading (PIL).
> 
> Secure PIL image is signed firmware image which only trusted software such
> as TrustZone (TZ) can authenticate and load. Linux kernel will send a
> Peripheral Authentication Service (PAS) request to TZ to authenticate and
> load the PIL images.
> 
> In order to avoid overloading the existing WCSS driver or PAS driver, we
> came up with this new PAS based IPQ WCSS driver.

Can you tell why you need another driver if you are using the same PAS
method and it is using more of everything what PAS already
supports ?

> 
> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> [ Dropped ipq5424 support ]
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>


Author and tested looks weird..here..


> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/remoteproc/Kconfig              |  20 ++
>  drivers/remoteproc/Makefile             |   1 +
>  drivers/remoteproc/qcom_q6v5_wcss_sec.c | 337 ++++++++++++++++++++++++++++++++
>  include/linux/remoteproc.h              |   2 +
>  4 files changed, 360 insertions(+)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 5b56b2dcc725..3feea5bda129 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -267,6 +267,26 @@ config QCOM_Q6V5_WCSS
>  	  Hexagon V5 based WCSS remote processors on e.g. IPQ8074.  This is
>  	  a non-TrustZone wireless subsystem.
>  
> +config QCOM_Q6V5_WCSS_SEC
> +	tristate "Qualcomm Hexagon based WCSS Secure Peripheral Image Loader"
> +	depends on OF && ARCH_QCOM
> +	depends on QCOM_SMEM
> +	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
> +	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
> +	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
> +	select QCOM_MDT_LOADER
> +	select QCOM_PIL_INFO
> +	select QCOM_Q6V5_COMMON
> +	select QCOM_RPROC_COMMON
> +	select QCOM_SCM
> +	help
> +	  Say y here to support the Qualcomm Secure Peripheral Image Loader
> +	  for the Hexagon based remote processors on e.g. IPQ5332.
> +
> +	  This is TrustZone wireless subsystem. The firmware is
> +	  verified and booted with the help of the Peripheral Authentication
> +	  System (PAS) in TrustZone.
> +
>  config QCOM_SYSMON
>  	tristate "Qualcomm sysmon driver"
>  	depends on RPMSG
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index 689686de0d41..f74519ea6502 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_QCOM_Q6V5_ADSP)		+= qcom_q6v5_adsp.o
>  obj-$(CONFIG_QCOM_Q6V5_MSS)		+= qcom_q6v5_mss.o
>  obj-$(CONFIG_QCOM_Q6V5_PAS)		+= qcom_q6v5_pas.o
>  obj-$(CONFIG_QCOM_Q6V5_WCSS)		+= qcom_q6v5_wcss.o
> +obj-$(CONFIG_QCOM_Q6V5_WCSS_SEC)	+= qcom_q6v5_wcss_sec.o
>  obj-$(CONFIG_QCOM_SYSMON)		+= qcom_sysmon.o
>  obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
>  qcom_wcnss_pil-y			+= qcom_wcnss.o
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss_sec.c b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
> new file mode 100644
> index 000000000000..4837825d1717
> --- /dev/null
> +++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
> @@ -0,0 +1,337 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#include <linux/clk.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
> +#include <linux/io.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/qcom/mdt_loader.h>
> +
> +#include "qcom_common.h"
> +#include "qcom_q6v5.h"
> +#include "qcom_pil_info.h"
> +
> +#define WCSS_CRASH_REASON		421
> +
> +#define WCSS_PAS_ID			0x6
> +#define MPD_WCSS_PAS_ID			0xd
> +
> +#define Q6_WAIT_TIMEOUT			(5 * HZ)
> +
> +struct wcss_sec {
> +	struct device *dev;
> +	struct qcom_rproc_glink glink_subdev;
> +	struct qcom_rproc_ssr ssr_subdev;
> +	struct qcom_q6v5 q6;
> +	phys_addr_t mem_phys;
> +	phys_addr_t mem_reloc;
> +	void *mem_region;
> +	size_t mem_size;
> +	const struct wcss_data *desc;
> +};
> +
> +struct wcss_data {
> +	u32 pasid;
> +	const char *ss_name;
> +	bool auto_boot;
> +};
> +
> +static int wcss_sec_start(struct rproc *rproc)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	struct device *dev = wcss->dev;
> +	int ret;
> +
> +	ret = qcom_q6v5_prepare(&wcss->q6);
> +	if (ret)
> +		return ret;
> +
> +	ret = qcom_pas_auth_and_reset(wcss->desc->pasid);
> +	if (ret) {
> +		dev_err(dev, "wcss_reset failed\n");
> +		goto unprepare;
> +	}
> +
> +	ret = qcom_q6v5_wait_for_start(&wcss->q6, msecs_to_jiffies(Q6_WAIT_TIMEOUT));
> +
> +	if (ret == -ETIMEDOUT) {
> +		dev_err(dev, "start timed out\n");
> +		qcom_pas_shutdown(wcss->desc->pasid);
> +		goto unprepare;
> +	}
> +
> +	return 0;
> +
> +unprepare:
> +	qcom_q6v5_unprepare(&wcss->q6);
> +
> +	return ret;
> +}
> +
> +static int wcss_sec_stop(struct rproc *rproc)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	struct device *dev = wcss->dev;
> +	int ret;
> +
> +	ret = qcom_q6v5_request_stop(&wcss->q6, NULL);
> +	if (ret == -ETIMEDOUT)
> +		dev_err(dev, "timed out on wait\n");
> +
> +	ret = qcom_pas_shutdown(wcss->desc->pasid);
> +	if (ret)
> +		dev_err(dev, "Failed to shutdown %d\n", ret);
> +
> +	qcom_q6v5_unprepare(&wcss->q6);
> +
> +	return ret;
> +}
> +
> +static void *wcss_sec_da_to_va(struct rproc *rproc, u64 da, size_t len,
> +			       bool *is_iomem)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	int offset;
> +
> +	offset = da - wcss->mem_reloc;
> +	if (offset < 0 || offset + len > wcss->mem_size)
> +		return NULL;
> +
> +	if (is_iomem)
> +		*is_iomem = true;
> +
> +	return wcss->mem_region + offset;
> +}
> +
> +static int wcss_sec_load(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	struct device *dev = wcss->dev;
> +	int ret;
> +
> +	ret = qcom_mdt_load(dev, fw, rproc->firmware, wcss->desc->pasid, wcss->mem_region,
> +			    wcss->mem_phys, wcss->mem_size, &wcss->mem_reloc);
> +	if (ret)
> +		return ret;
> +
> +	qcom_pil_info_store("wcss", wcss->mem_phys, wcss->mem_size);
> +
> +	return 0;
> +}
> +
> +static unsigned long wcss_sec_panic(struct rproc *rproc)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +
> +	return qcom_q6v5_panic(&wcss->q6);
> +}
> +
> +static void wcss_sec_copy_segment(struct rproc *rproc,
> +				  struct rproc_dump_segment *segment,
> +				  void *dest, size_t offset, size_t size)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	struct device *dev = wcss->dev;
> +
> +	if (!segment->io_ptr)
> +		segment->io_ptr = ioremap_wc(segment->da, segment->size);
> +
> +	if (!segment->io_ptr) {
> +		dev_err(dev, "Failed to ioremap segment %pad size 0x%zx\n",
> +			&segment->da, segment->size);
> +		return;
> +	}
> +
> +	if (offset + size <= segment->size) {
> +		memcpy_fromio(dest, segment->io_ptr + offset, size);
> +	} else {
> +		iounmap(segment->io_ptr);
> +		segment->io_ptr = NULL;
> +	}
> +}
> +
> +static int wcss_sec_dump_segments(struct rproc *rproc,
> +				  const struct firmware *fw)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	struct reserved_mem *rmem = NULL;
> +	struct device_node *node;
> +	int num_segs, index;
> +	int ret;
> +
> +	/*
> +	 * Parse through additional reserved memory regions for the rproc
> +	 * and add them to the coredump segments
> +	 */
> +	num_segs = of_count_phandle_with_args(dev->of_node,
> +					      "memory-region", NULL);
> +	for (index = 0; index < num_segs; index++) {
> +		node = of_parse_phandle(dev->of_node,
> +					"memory-region", index);
> +		if (!node)
> +			return -EINVAL;
> +
> +		rmem = of_reserved_mem_lookup(node);
> +		of_node_put(node);
> +		if (!rmem) {
> +			dev_err(dev, "unable to acquire memory-region index %d num_segs %d\n",
> +				index, num_segs);
> +			return -EINVAL;
> +		}
> +
> +		dev_dbg(dev, "Adding segment 0x%pa size 0x%pa",
> +			&rmem->base, &rmem->size);
> +		ret = rproc_coredump_add_custom_segment(rproc,
> +							rmem->base,
> +							rmem->size,
> +							wcss_sec_copy_segment,
> +							NULL);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct rproc_ops wcss_sec_ops = {
> +	.start = wcss_sec_start,
> +	.stop = wcss_sec_stop,
> +	.da_to_va = wcss_sec_da_to_va,
> +	.load = wcss_sec_load,
> +	.get_boot_addr = rproc_elf_get_boot_addr,
> +	.panic = wcss_sec_panic,
> +	.parse_fw = wcss_sec_dump_segments,
> +};
> +
> +static int wcss_sec_alloc_memory_region(struct wcss_sec *wcss)
> +{
> +	struct device *dev = wcss->dev;
> +	struct resource res;
> +	int ret;
> +
> +	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> +	if (ret) {
> +		dev_err(dev, "unable to acquire memory-region resource\n");
> +		return ret;
> +	}
> +
> +	wcss->mem_phys = res.start;
> +	wcss->mem_reloc = res.start;
> +	wcss->mem_size = resource_size(&res);
> +	wcss->mem_region = devm_ioremap_resource_wc(dev, &res);
> +	if (IS_ERR(wcss->mem_region)) {
> +		dev_err(dev, "unable to map memory region: %pR\n", &res);
> +		return PTR_ERR(wcss->mem_region);
> +	}
> +
> +	return 0;
> +}
> +
> +static int wcss_sec_probe(struct platform_device *pdev)
> +{
> +	const struct wcss_data *desc = of_device_get_match_data(&pdev->dev);
> +	const char *fw_name = NULL;
> +	struct wcss_sec *wcss;
> +	struct clk *sleep_clk;
> +	struct clk *int_clk;
> +	struct rproc *rproc;
> +	int ret;
> +
> +	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
> +				      &fw_name);
> +	if (ret < 0)
> +		return ret;
> +
> +	rproc = devm_rproc_alloc(&pdev->dev, desc->ss_name, &wcss_sec_ops,
> +				 fw_name, sizeof(*wcss));
> +	if (!rproc) {
> +		dev_err(&pdev->dev, "failed to allocate rproc\n");
> +		return -ENOMEM;
> +	}
> +
> +	wcss = rproc->priv;
> +	wcss->dev = &pdev->dev;
> +	wcss->desc = desc;
> +
> +	ret = wcss_sec_alloc_memory_region(wcss);
> +	if (ret)
> +		return ret;
> +
> +	sleep_clk = devm_clk_get_optional_enabled(&pdev->dev, "sleep");
> +	if (IS_ERR(sleep_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(sleep_clk),
> +				     "Failed to get sleep clock\n");
> +
> +	int_clk = devm_clk_get_optional_enabled(&pdev->dev, "interconnect");
> +	if (IS_ERR(int_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(int_clk),
> +				     "Failed to get interconnect clock\n");
> +
> +	ret = qcom_q6v5_init(&wcss->q6, pdev, rproc,
> +			     WCSS_CRASH_REASON, NULL, NULL);
> +	if (ret)
> +		return ret;
> +
> +	qcom_add_glink_subdev(rproc, &wcss->glink_subdev, desc->ss_name);
> +	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, desc->ss_name);
> +
> +	rproc->auto_boot = desc->auto_boot;
> +	rproc->dump_conf = RPROC_COREDUMP_INLINE;
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
> +
> +	ret = devm_rproc_add(&pdev->dev, rproc);
> +	if (ret) {
> +		qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
> +		qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
> +		qcom_q6v5_deinit(&wcss->q6);
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, rproc);
> +
> +	return 0;
> +}
> +
> +static void wcss_sec_remove(struct platform_device *pdev)
> +{
> +	struct rproc *rproc = platform_get_drvdata(pdev);
> +	struct wcss_sec *wcss = rproc->priv;
> +
> +	qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
> +	qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
> +	qcom_q6v5_deinit(&wcss->q6);
> +}
> +
> +static const struct wcss_data wcss_sec_ipq5332_res_init = {
> +	.pasid = MPD_WCSS_PAS_ID,
> +	.ss_name = "q6wcss",
> +};
> +
> +static const struct wcss_data wcss_sec_ipq9574_res_init = {
> +	.pasid = WCSS_PAS_ID,
> +	.ss_name = "q6wcss",
> +};
> +
> +static const struct of_device_id wcss_sec_of_match[] = {
> +	{ .compatible = "qcom,ipq5018-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
> +	{ .compatible = "qcom,ipq5332-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
> +	{ .compatible = "qcom,ipq9574-wcss-sec-pil", .data = &wcss_sec_ipq9574_res_init },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, wcss_sec_of_match);
> +
> +static struct platform_driver wcss_sec_driver = {
> +	.probe = wcss_sec_probe,
> +	.remove = wcss_sec_remove,
> +	.driver = {
> +		.name = "qcom-wcss-secure-pil",
> +		.of_match_table = wcss_sec_of_match,
> +	},
> +};
> +module_platform_driver(wcss_sec_driver);
> +
> +MODULE_DESCRIPTION("Hexagon WCSS Secure Peripheral Image Loader");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index ef711a5b1a7f..cf06b9846309 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -204,6 +204,7 @@ enum rproc_dump_mechanism {
>   * @node:	list node related to the rproc segment list
>   * @da:		device address of the segment
>   * @size:	size of the segment
> + * @io_ptr:	ptr to store the ioremapped dump segment
>   * @priv:	private data associated with the dump_segment
>   * @dump:	custom dump function to fill device memory segment associated
>   *		with coredump
> @@ -215,6 +216,7 @@ struct rproc_dump_segment {
>  	dma_addr_t da;
>  	size_t size;
>  
> +	void __iomem *io_ptr;
>  	void *priv;
>  	void (*dump)(struct rproc *rproc, struct rproc_dump_segment *segment,
>  		     void *dest, size_t offset, size_t size);
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha
