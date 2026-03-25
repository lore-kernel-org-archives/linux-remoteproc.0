Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE542D5950
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 04:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774413267; cv=none; b=KssTeSFNQ+01jYktm650LJB+yxLzAx0VaV/guhYkGbYoaOOh52ZKh5YBqvELTrSroA9nZk/8IxXpkHYN7yJrJvVVmlh2waKTbUqD9onQDjVvVkQqzLdqbBlRk4u4045VS/lMAHAviX1Sd+JPvG4GDnfuVufEuYhODPaCiWqdXbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774413267; c=relaxed/simple;
	bh=HlMYOavZlom+8UZN2xckPAC6WFBM+19NyvW+PYf27tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qOjo2hJtrRd8QigHNXAMsCfN5tDZ+RzPeRIkHeJf79W48qbBBQsf8QZlPe6LDujHhIdHR4LM0N/WEgrVnQy8odCAB8NiMZSHfZzvvBE8PVjFXjzhFbFhuE/NfS1a6A+SI4jsW41bx7KZL/V9kKiKJfdI52xLkFQN59qrifAEryM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxXtUFqX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=clDNrIpq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxXtUFqX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="clDNrIpq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJngZo2075351
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 04:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EHUp7/16YUMBtKGES+yYYqc2
	0LzNJsKIcI6vCitDSoc=; b=UxXtUFqX1/6g2nxsMa/K3D44muLA4QP/qfif7ikK
	0PfGqXPH2DkXPdFnv2JwH9dBZrMi+CJqXZ0Fx5kAQPk9xIyNvrptcTe2T39UgZRD
	PqQ9HCtVYJnygYaIfjzbz/TXWLO5j1HuJqsSRgROj20zluZNW1VYdXF495ZZnzmo
	kQW5B/W7yOkgLxG3oM1WyUL0pFOI4P4e6nmddPEUOF8OeK5190ahq1G2S+KRAZLx
	FjtOUwxDpHveFbF9HNRmUu11f7KytW5gnm2N/GHuedbMnGAxOs/bt4U7Z2UpMdLK
	7xeadyqyfvYZQ6/nJzG5hnrxVaUQfMPYQJzdZGp34rGkDA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41411e9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 04:34:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b317c40acso114573421cf.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2026 21:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774413264; x=1775018064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EHUp7/16YUMBtKGES+yYYqc20LzNJsKIcI6vCitDSoc=;
        b=clDNrIpqUCNGjlX/2AeX//JhDezeWoIJO2ftoDRICVxfp5pUwECWRovFwdRHJoX5ma
         UREm35ug8PJL87nkwPkXV587opJEB2FqAxVKXsBJRz6Ct209PLt6KGkuKv5E01O+L5Xw
         uXNuiXYiEC3hghzrsFrejaRJI1FnTAEU9gr4Z5rjESO22V2o1YmUT+dckBZ8vZYDzoIn
         zQSBuuWl4i6Dyhs2DYz+mcDLZR+O3YsI+bfjecoXMJBWcQtCIj7qejWut1oG7hG41D6Y
         Slq8G+unvxYxMOjK+F7CjBJ1YXfZ5pH7+0AEFQ52RE82s8k6+4tGJUSgVigyQ4jSDGmB
         QQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774413264; x=1775018064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EHUp7/16YUMBtKGES+yYYqc20LzNJsKIcI6vCitDSoc=;
        b=LjQPll52VRYEBgJ+YhpbALxFDTfr67XvAzCpDK47iTTVcd4CJ+KkcAiqYXXGlL1j8g
         i9wR0qAnjk/0mKZ8mINpCCQZOHcGCxOMK0vt3NQNWusxq5O3xke9v2nzR+u/rYSK77SA
         Io9nXVsYdFruKlvGEkSeod1MbE+Fn7sL43qKdWaLF0MRHHfsuU4yemkkhGwA8zvNlVUN
         wQpsxy4pcPkRhswPxVFPqgwrW/CV0tPboWMjKyS2yqAZhTiowUHNEKGEgqYwe/Ro8Jju
         CzZ+UIxbENwkdTP0CXA6PPwMe3c2QwBVnGHVU5A/de0996PlcOpuFAFBDF/eBOsaHK6r
         9PQA==
X-Forwarded-Encrypted: i=1; AJvYcCWFzzknn/TG4P9rwpmwrz69RNG8JwtrccoFnwBACJof8zG/eU2LOeVk/87AMk5co2QPj78ncGLPIySsxKubwg8d@vger.kernel.org
X-Gm-Message-State: AOJu0YzIw4yA21ijyw5dzDzu1nOWnsZWC9SczleH3qY+cwHZCjDhEvnn
	n1gD8CPQOECquwPiqinNm2oVMnJrxFoh6aq7HXFBZ8VZzfz/URVZN0OxfNiLmSFnU3CtkR4aqod
	x8aeOAjQyXSCwAJLa2zqn0C6CYgB69lbeFyi6mp85PY4RUcLGCqiGoPsS2goyt5VYcvff0RyQ
X-Gm-Gg: ATEYQzzfkyR/ajt/mzJlN1xcA/ieGdJdkv+kYpyIVnByMZt37730VIarmjTJrjG/DL1
	3K5dANV9et4LhNudsDQyrHWTutqyqaManc4COc+6w/rtZ29Lw/iLg3yrgvVuzLEaUoIljI87+4D
	IBBx9WYmliOxzRDqMKmNYFqTGXfsJvD6EmL0wt8pfa+h77nnfLbtrnXwyFR0kPAXNlwQzXqqIXL
	/cyTMmiLzSN7LNHr1iadkIzzLnnTcarBhOb72mEIPxI2sWissRd99AxEQDAS/tbASdKpYrCYDiU
	orzWW5XbgIUnA4s8hHhjCsCJRoOqgHLYB4jOclVuJwWLOaYF69Eqb+wmynk2oQW2keS5NtrvD0+
	+jb+9ii1ZC5PTRFxJ3gWGtTnk2bmxJ01r48d2D1X+dNjva1cUzW2xfsoFIpfDR7ylPnjYxrmYoU
	8ejYPwPD+3J4mVn0gd9/Hf2FvZte3vdgdgCE8=
X-Received: by 2002:a05:622a:4ce:b0:509:1987:7626 with SMTP id d75a77b69052e-50b80ed53b8mr28888421cf.68.1774413263894;
        Tue, 24 Mar 2026 21:34:23 -0700 (PDT)
X-Received: by 2002:a05:622a:4ce:b0:509:1987:7626 with SMTP id d75a77b69052e-50b80ed53b8mr28888091cf.68.1774413263409;
        Tue, 24 Mar 2026 21:34:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207500sm3648167e87.41.2026.03.24.21.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 21:34:21 -0700 (PDT)
Date: Wed, 25 Mar 2026 06:34:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 10/14] drm/msm: Switch to generic PAS TZ APIs
Message-ID: <v4ffww2r4ljqqbmvsc5jcr4ztqjbpfb42xryjeuz4abqiwup3a@2gfeelhjzzz4>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-11-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306105027.290375-11-sumit.garg@kernel.org>
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c365d0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=kPJGyq6PTXsXdZOMel8A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: H2f0TTrISn4EpvurtFZ6biH06WPIrPOK
X-Proofpoint-ORIG-GUID: H2f0TTrISn4EpvurtFZ6biH06WPIrPOK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyOCBTYWx0ZWRfXxPJf/QDxL+ta
 HrLMGFYno0EcRPbojkackyPBC3YZ6begmct+NH06LXVKIe7SHroEJkQLd+LgCP83OAAGLkPbjRa
 yFDw3XZnGveofHq23lvrmoMPW4pc/D7gHug0lBCde+rWGszHud616IV2bXiVFFuFK9yj84MREin
 LFqq47j7C83ZUGQS+ZegOtY7hJAxCfGrIFwo3jOiLvSoww3K1jxm/yqV3OVTa1pJsqtKIvKWZhe
 69iK5La6PB1TZ1UTWHJegIr4rGzP21IKdoYz9Za+xfkfB74vTHPDzyqyHFPV/95YSLOcq0tHYEP
 utoCdy9fONY4BXdF+4IJ8tNV9TXjPj1QIMb0AFEc4WyThIdTQumo3p891Df2/j1bN44var2l8V1
 lkkgYTL9Akr0z+eTeEwZxXLe3eNgdbMb4orMhYHePxpZIjDbYDUGrm0t07CZ9ztBaD6F4p0vBYN
 m45yV9OY7cvYaJrX+jQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250028

On Fri, Mar 06, 2026 at 04:20:23PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch drm/msm client drivers over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  4 ++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 ++++++-----
>  2 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index ef9fd6171af7..3283852f9a14 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -5,7 +5,7 @@
>  #include <linux/kernel.h>
>  #include <linux/types.h>
>  #include <linux/cpumask.h>
> -#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/firmware/qcom/qcom_pas.h>

Missing `select QCOM_PAS`.


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

-- 
With best wishes
Dmitry
