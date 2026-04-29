Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8146D2EC54C
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 14:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777471215; cv=none; b=r1/h4M18eZCc2vosFezUJZhGY2PoZtV4jy10wKtZtXClWZwJEwZTd/QrKpX9v1c3BfVAmHW8stIosaTCWJHQ3jrWUBewvhp5oGAu+0BgqvJAllpqH43TQoBEwh1fwqDRxdhJnbrwzbMO9j8RCqB9KAHZctis/ZjTbRuv9yWGUZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777471215; c=relaxed/simple;
	bh=5yQPAUjn3VunEoidQeZB/XrTAnrzeavxXWZHanAVIvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVqL4INgc64KoDRPrZzw2vKemf4HnKTOC/GdInnM5KxSBapSox4GxDXCNNN2z+zEdVXSJ7L1F5tovZ2qkkgQpIWM8se3bX/1UQCBTKS8gpeQTwyRME1Eyohd4wYmHHG0ZIJ5CtdCEHgZQEnXVVSMOwbBZTgJ0gWvAawDplmXn8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZVjkz/bw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBnaAOXO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZVjkz/bw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QBnaAOXO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q7DL1721242
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 14:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YKH9dv7wKtC1p8ZEO04m+kEL
	X8b+zwv/sQpT8PdfGig=; b=ZVjkz/bwitIknIzBQGGYWMnjd+c7U3oo1VDD3ojE
	amdiGSdp8vi58LpqyydYMnBfvL8uamZ8WIYrelSlx2yLPdTEBOa2u20SKht8H31S
	rCBw4E8wCS+ccd6xz/bLRB8HZ3sjjR/CxRL9FhkuuOOdnvzRrymGZEyukKJ/adAg
	VXFsgNc/BcJCVi9QDz5cbpgzNVQMrf9kHGqjuSMKWUA68mslDXOcT1Scn3oUrQ0N
	VnucAWp6lTQ0s2WEiNpo1fwxuo1B4dYbqmecD2AHb2BbvD0DiQg309g1Nz6CblUF
	emwubpt8x6BGtRXRW72mh8KyG5jTGgq91yiJJSyh+Yx8gQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua732ahq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 14:00:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82d40278103so8286755b3a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 07:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777471211; x=1778076011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YKH9dv7wKtC1p8ZEO04m+kELX8b+zwv/sQpT8PdfGig=;
        b=QBnaAOXObISyRoShr1qq3LCMGfheq2m30a+xsaNiJjaxhf3GFvGibEIAl6YTMvLE2I
         SH23IxtHf8QWqayT5wAhENVZqZuibr2J0tZ9nDc+90KZAK860Fl7F+WnGKtOp4bJhxUT
         fzBk7+Y7fQx5GVlzPPbmAv6BA3KBfModclTCG+bSMLVVbtdhgjaqG5X/8LMWyNH6kYj5
         ZqJAZ8l81F2k7fLBleLBNq2v3Eiwu/qSY9watkYlf/1B8svcaMrZHpUbuJ2QfFddqi+3
         Q36lV9YS4ArmIUo/fsM0W1ivL6dFCFTcCUvD0pC6B26aws/TcyQ32lwinhaMS24X0tqI
         waCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777471211; x=1778076011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKH9dv7wKtC1p8ZEO04m+kELX8b+zwv/sQpT8PdfGig=;
        b=N1CUvlc20IxZCbhjHSwBWKlRgln7x2iB/PZTbG43YuA0nEOzqFVloDNQXdos7W1CcA
         FOaoB4AUl7WU1A58wG5G66X80spHPpvuOJYk8uEAvteB8pp8bRzL7NTXwAQiaf0YkSBf
         AF7PLCZWfXalGaCg+OLiE6ROcH84ax8EH+WrGe4Ihcxh3aPWXgRj+qnVlianw1Yav5Be
         RBEE8H9Sc1F/n9jWS1RDcjJMfVGoqrnvcfqNLCSXo2z7xFcKrxIIRi3R6K6qKNS9y3m/
         U/8Q7VRura1s7YANsWxbezsAFAKZgqdjo+SVak9zHCVQxzoJJ8jqZhIFltwuJMtLJ1Yu
         3KRg==
X-Forwarded-Encrypted: i=1; AFNElJ9xFfdy/CiAbqDFYOqjoSJ53shlhkhjKngF5YGJiGKAVQXUDFUnRS8kRfCHqA5rThytE+LuX0aWjp6olb5Uiuso@vger.kernel.org
X-Gm-Message-State: AOJu0YwDtUyTET5ARRVYhHAGNPjsbZek8qOt2A7xZdZV5KJDIkwIMRO5
	ArMjwfPkjZXHuzN3Tohk7QcwT3qQ/dIg/bTpTZsXiz9alRcgYBGhAsFSJngMvQavmWqU/YyjER4
	3tEwIU7sEth1GP5FWXIm4l/Qmqg1gS14ydDrnlxXRL0G6WQ9xjSCgw8qIm55HwdOh6Wg7WnC3
X-Gm-Gg: AeBDiesWRvZSamo3zw9PMDFjvQfTS6atqdZons2I13q6Vl6vE2CigZG7yCdW6b5/yjM
	nyfhZQ03hTdZZVXbrHiNwCxdjdoKEp1AU5cg9wxgZ2mtvmsVV20bODsLBHN4eZSeSu2gBJDj32Y
	vz14aOiexr7v5Ev0tkI4gYnvdZYr/9JX1Lkw0jPt229cV/XE+hD1NWQ5dHHVRov4Jd904X+WD9/
	73CEZ5wbEKUA44LO9xBxIm9PxQnjudMOFNPDcYt+/htgdOVGc4MgpjNn+WVDSrSqELTjo48JrrG
	1aH++8DwIfY7J5avGEAdqe8NK0Xy367CqgRdNehyhZ25h9K33K/bGOh9UCJgJJVbgi3VTgNAaRx
	5rT7uKcEAnviBf+rwA3uNC1dGAnIzO7L9XnuqcRbZeTiSVcfVXB/4SLd5IAY=
X-Received: by 2002:a05:6a00:4286:b0:82f:316:3208 with SMTP id d2e1a72fcca58-834ddbf1ebamr8578653b3a.29.1777471211013;
        Wed, 29 Apr 2026 07:00:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:4286:b0:82f:316:3208 with SMTP id d2e1a72fcca58-834ddbf1ebamr8578551b3a.29.1777471210136;
        Wed, 29 Apr 2026 07:00:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed80ec94sm2268304b3a.52.2026.04.29.06.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:00:09 -0700 (PDT)
Date: Wed, 29 Apr 2026 19:29:54 +0530
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
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 10/15] drm/msm: Switch to generic PAS TZ APIs
Message-ID: <20260429135954.nvr6nyfadsjeymyt@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-11-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-11-sumit.garg@kernel.org>
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f20eec cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=DQeyY4SaC-8ekjbwpG4A:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0MSBTYWx0ZWRfX8V3HZE95poPI
 jVbeXY2wQg4oADKbqxERLQd4Q4WW1KVrwwG8vziyokPClSkdh1Y5WCFW9TLke/bR/hUaLuZD6sd
 Ct2wbV2rn9x/Skec0RI5akXlctvKfTzlTfrv2nIrh7q4WFwF7aUVZVt7cMAi2rZKc7s6ubVoKkx
 GNG6tvjegJQ9sBeq7A1xRK3nuHLZRnZFrYlkJE64PsJqjhJ4YwKJjh+dD9tpFuB4CYtpfD/y4c5
 i2T6ng28x/1pX6sDrDvpjKoGr6t8etYrZsO5lpF02BSxEKWizN6KJrLLvBSBSPFSdKnPOpMKbGS
 dhYXrZA6xJZ4bsNfnjXa35KAuGRdiOC6TvGDaZ3qyLMc7qO6uTFG7VB/yRuWFgI14nfkbS8JLkS
 uhASxDeyCqJd1lXxM2URLMZqTTk4IqK/N5QlB3nfUkDWKE/4prlN6k3xGH2xn7XzioRPAU03uhe
 8wug1TFJCETKWiq9kvg==
X-Proofpoint-GUID: Zlff7ZTfaHranKPxN2iz5rLBjGrvdF_5
X-Proofpoint-ORIG-GUID: Zlff7ZTfaHranKPxN2iz5rLBjGrvdF_5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290141

On Mon, Apr 27, 2026 at 03:25:58PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch drm/msm client drivers over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Kconfig             |  1 +
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  4 ++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 ++++++-----
>  3 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gdrivers/gpu/drm/msm/Kconfigpu/drm/msm/Kconfig
> index 250246f81ea9..09469d56513b 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -21,6 +21,7 @@ config DRM_MSM
>  	select SHMEM
>  	select TMPFS
>  	select QCOM_SCM

do we need this ?

> +	select QCOM_PAS
>  	select QCOM_UBWC_CONFIG
>  	select WANT_DEV_COREDUMP
>  	select SND_SOC_HDMI_CODEC if SND_SOC
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 79acae11154a..b556da823897 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -5,7 +5,7 @@
>  #include <linux/kernel.h>
>  #include <linux/types.h>
>  #include <linux/cpumask.h>
> -#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/pm_opp.h>
>  #include <linux/nvmem-consumer.h>
>  #include <linux/slab.h>
> @@ -653,7 +653,7 @@ static int a5xx_zap_shader_resume(struct msm_gpu *gpu)
>  	if (adreno_is_a506(adreno_gpu))
>  		return 0;
>  
> -	ret = qcom_scm_set_remote_state(SCM_GPU_ZAP_SHADER_RESUME, GPU_PAS_ID);
> +	ret = qcom_pas_set_remote_state(SCM_GPU_ZAP_SHADER_RESUME, GPU_PAS_ID);
>  	if (ret)
>  		DRM_ERROR("%s: zap-shader resume failed: %d\n",
>  			gpu->name, ret);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 66f80f2d12f9..6d68edf0578c 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -8,6 +8,7 @@
>  
>  #include <linux/ascii85.h>
>  #include <linux/interconnect.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/firmware/qcom/qcom_scm.h>

do we need this ?

>  #include <linux/kernel.h>
>  #include <linux/of_reserved_mem.h>
> @@ -146,10 +147,10 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>  		goto out;
>  
>  	/* Send the image to the secure world */
> -	ret = qcom_scm_pas_auth_and_reset(pasid);
> +	ret = qcom_pas_auth_and_reset(pasid);
>  
>  	/*
> -	 * If the scm call returns -EOPNOTSUPP we assume that this target
> +	 * If the pas call returns -EOPNOTSUPP we assume that this target
>  	 * doesn't need/support the zap shader so quietly fail
>  	 */
>  	if (ret == -EOPNOTSUPP)
> @@ -175,9 +176,9 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
>  	if (!zap_available)
>  		return -ENODEV;
>  
> -	/* We need SCM to be able to load the firmware */
> -	if (!qcom_scm_is_available()) {
> -		DRM_DEV_ERROR(&pdev->dev, "SCM is not available\n");
> +	/* We need PAS to be able to load the firmware */
> +	if (!qcom_pas_is_available()) {
> +		DRM_DEV_ERROR(&pdev->dev, "Qcom PAS is not available\n");
>  		return -EPROBE_DEFER;
>  	}
>  
> -- 
> 2.51.0
> 

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> 

-- 
-Mukesh Ojha
