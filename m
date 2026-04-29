Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B823FD147
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 13:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777470232; cv=none; b=TTpQ+oLrUpREVoLsyzs8tmWn12AAn34cI0R7DruQFHog4P/ku9B5YzZGf3o11PwceD50mAKjplxVRstrx89JoDaI7qzZalTFXs+tTD2q/DaW7IeKw1i2eGeRuN9xiNDIfTJRgKJzLrfeu1f4Ll6LP258OVdOlZr7VfxXBmPbMF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777470232; c=relaxed/simple;
	bh=+f2W0byu+VgJjsIBhy66bJHyN85fytLh2R/43wSGVUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GaQYTQ1636i44fv70vD5J9g+yCmGigh8eFWtDIE8nrFy0M/SJQsKVYCtJIsp8gszpm/qhxIindnQV+o4p/Z85LwY1pgEIzgljmjC7dHbiLraSK4lvF0vDU1lgL6gqSIeFNq1gQg79IU6MGyqdyc5twyG3ybrnw2svVHMdXqYNN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGzhSXE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NVb/tOpN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGzhSXE9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NVb/tOpN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q7gc1721227
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 13:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cuo4xCs+Nso8hPGN5nUCptMR
	sALAnh0wyrAaKAyxQ3Y=; b=UGzhSXE9TYwEoCe3o5G9PQphC8ttYY26Fo2LF0O5
	+66oGW0pUoGEOA6LZOG3uPuBclDYD3+Goy39d6kRD8bPKycGbACg/ZIsruC4EbW7
	LkOmnmtGJo20nIPdCJW4B137JylhFtiJ/Kyixc/X+z0gTrF203Ly7o/Nhhc2sVaL
	EzfLVO+pO3UCZHmCuycIN/CtAZAcz4LcuVeiUAAtCnh4fFLawDXoIZZeYi5yZT+I
	czUD3cguivawcB2g2tnYE+vVGgBRGuLh3FUE3+ZHjwETRXOnAUVcvaEkE5tgl732
	JJnQl5xEZ4x28C0O6SbW+PhJ6Vd/871B7ZfqnV6zwChS/A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua7328r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 13:43:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c795fa31e18so6551888a12.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 06:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777470224; x=1778075024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cuo4xCs+Nso8hPGN5nUCptMRsALAnh0wyrAaKAyxQ3Y=;
        b=NVb/tOpNXU72lP2/LU2E3lRZz8dOU3X7j8RAMrfdPGdObQyos54FwR4U6qu0sSi6/T
         KGzjgyTUMJu+nlWT+lHuAr9S2h48+aE1uNgME7/po9TCkCc7RK866PkiTynmBCrh8suv
         3AyyvatxbAIvH+aihcFTjWRLZnm9Kg2gbRiM8nDEpKnq43ZDc1s6Xh2vgi25/jlMqL+0
         50TepSN28knWQ4f8MCqfAUj8CKRvYksEhdskt86U0D4r/PJaRBkLxIulCxCcpuZe3aWs
         BANBzVDa0MdX+f9bs4cs8mkCKk5VgDT58SOfshZM+f0mwRjBduqUwSigs3Ar5pSEnJ0E
         RZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777470224; x=1778075024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cuo4xCs+Nso8hPGN5nUCptMRsALAnh0wyrAaKAyxQ3Y=;
        b=Ir6zYNQhGd+l20mso5u9mPuSRXR/k8qMT8/2+wXRgSmGW+2pVKZfErHKtOWCO1hQro
         CagWbdFG8oux+9jj0WGqeBp/PwDlMriqNA81GCFjPZJCUXSHRtJqhxRenu8dKFw8+ZFC
         aDNB93obpcxFMOPm2b5DLCOKC/bOUXB7azE47O+OMaXc4k2+pZT/YZsUCBBXyVwYLJrd
         yKVkwE6BNNroE05h3cs5gne/95KZoYuGqUqXoVhf7PfCXDNvhynaJ7PJtPYBK8QFfKjD
         UNaeUzdUw7VC4nOyMd2BOW/kGRJDHLhpZSmk4Y4z4i3htOyjPKsPMJRJjCKD/ARoecvh
         T0dw==
X-Forwarded-Encrypted: i=1; AFNElJ90KIokKYBDXvalj/zhec5a8zQo5ulXHGPKljpmpapF0d7+RcBwUlqMiA9yTivhwYJIzhhfVrjLnHcsbf1BJ775@vger.kernel.org
X-Gm-Message-State: AOJu0YymClNeXqA6KLfquFg8qzo7dcHGmEtSJ+UySbqVTkeAM8Ahs9QQ
	hsirKJnu5OpjgVT4SjRAPgYwy2M0p0myMciTVSJgaphPpPdQKa9fNDNcUpHYAajLU4GN2Xq/Tpc
	xlfXw7zab85Saca5IMZtxdsbpg1hTLYHmKr23UaF3DK80fs4OXETGKlcJYLutU1AtxhSs9+UC
X-Gm-Gg: AeBDiev5Ik3CwxG7zw6ydG10Ehz0WdFHst25iVBYHoPlRuwsPbf/d3XprLZoeqfahxQ
	XAU1cZSsJVJfNgQ0Kx2ycJBHkKV9STgjRaJnDyCcSnEMz1lXCt3JgWKZEJ91ZYNgvbetlui/am3
	iNAZE/Tk33PNoCgbv90Klca98vpQYH6PuKHqPKZJx7OQcosY+VagoJGZY1Hah4xgB1APpPWeDn5
	WlCcAVLnvts8L24YxYriUbdQUgA1v/hbOIjWzNw9qMtfLd2OFXVEDtqLBr+K0E59jzVQkyEdYqu
	VRsRc2c8SPBwwPMBVzPs5PuIy1b1tx9zM7rR7fKVsGDywNzY5FbOe/s7mQXnY5wPuCtJ5NSfgf9
	z3v5w+MMw3ypM/oLC39k5E1L66xoYFb7xQlJFWbVb9Zk32Fqu8MCTFrKauLg=
X-Received: by 2002:a17:90b:268f:b0:359:87a8:e65c with SMTP id 98e67ed59e1d1-3649202ea13mr7870200a91.17.1777470224432;
        Wed, 29 Apr 2026 06:43:44 -0700 (PDT)
X-Received: by 2002:a17:90b:268f:b0:359:87a8:e65c with SMTP id 98e67ed59e1d1-3649202ea13mr7870101a91.17.1777470223790;
        Wed, 29 Apr 2026 06:43:43 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a0115143sm3071343a91.3.2026.04.29.06.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:43:43 -0700 (PDT)
Date: Wed, 29 Apr 2026 19:13:27 +0530
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
Subject: Re: [PATCH v4 08/15] remoteproc: qcom_wcnss: Switch to generic PAS
 TZ APIs
Message-ID: <20260429134327.mna45febpcpakfbl@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-9-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-9-sumit.garg@kernel.org>
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f20b11 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FjfCcBgXQK_UEADaTeYA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzOSBTYWx0ZWRfX4b3vXZpgMPFj
 paCkJUicyK7EAUXIrRDAQJvqT9hfjufPFqYxS7eclRgDjeFdOA/M/siBi7M/fh3reqRfGJ7Qkzi
 Uu5XtBQkJmmRHlrnt6Gt4PAlMbklUeE//1DQLAHIiK+ZCQMpem3/Jr96w4iUjaP7GeEe6Fcfkyv
 66fPzdOPWkchhuOGCh/l5NgrRRe0eIe0YbjXz1Jt0ZjoB8ZmrP5jatlFRWoUXO4w/5THlSEuPd5
 ocBils1TnLzGsINyQjZ1onRq1kgaRFeSgYhvja3QZDHAT0C4d2epL7R52oho9oRKN3UIf+Falj2
 EV2Rs/oGUqevzbjrXOJA51+YRKQzEXR0+VcmaJseo2MP4ZrGE9JvzQxAEA11+T46ImyPrql9N4A
 b+cbszmy2EJyYZ7q8MhWvS+ktgSn1U49syRv47fRSZKQ0IDQyMzT90CZvyymgQx4jutTKvuJxbr
 TAcdyi/jAFnQCrXmPqQ==
X-Proofpoint-GUID: ez0xn4UaiojwEzE7vJZ8c68RkAXtsLnv
X-Proofpoint-ORIG-GUID: ez0xn4UaiojwEzE7vJZ8c68RkAXtsLnv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290139

On Mon, Apr 27, 2026 at 03:25:56PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom_wcnss client driver over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_wcnss.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index 4add9037dbd5..0dbdd18ab3dd 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -19,7 +19,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> -#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/remoteproc.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> @@ -257,7 +257,7 @@ static int wcnss_start(struct rproc *rproc)
>  	wcnss_indicate_nv_download(wcnss);
>  	wcnss_configure_iris(wcnss);
>  
> -	ret = qcom_scm_pas_auth_and_reset(WCNSS_PAS_ID);
> +	ret = qcom_pas_auth_and_reset(WCNSS_PAS_ID);
>  	if (ret) {
>  		dev_err(wcnss->dev,
>  			"failed to authenticate image and release reset\n");
> @@ -269,7 +269,7 @@ static int wcnss_start(struct rproc *rproc)
>  	if (wcnss->ready_irq > 0 && ret == 0) {
>  		/* We have a ready_irq, but it didn't fire in time. */
>  		dev_err(wcnss->dev, "start timed out\n");
> -		qcom_scm_pas_shutdown(WCNSS_PAS_ID);
> +		qcom_pas_shutdown(WCNSS_PAS_ID);
>  		ret = -ETIMEDOUT;
>  		goto disable_iris;
>  	}
> @@ -311,7 +311,7 @@ static int wcnss_stop(struct rproc *rproc)
>  					    0);
>  	}
>  
> -	ret = qcom_scm_pas_shutdown(WCNSS_PAS_ID);
> +	ret = qcom_pas_shutdown(WCNSS_PAS_ID);
>  	if (ret)
>  		dev_err(wcnss->dev, "failed to shutdown: %d\n", ret);
>  
> @@ -557,10 +557,10 @@ static int wcnss_probe(struct platform_device *pdev)
>  
>  	data = of_device_get_match_data(&pdev->dev);
>  
> -	if (!qcom_scm_is_available())
> +	if (!qcom_pas_is_available())
>  		return -EPROBE_DEFER;
>  
> -	if (!qcom_scm_pas_supported(WCNSS_PAS_ID)) {
> +	if (!qcom_pas_supported(WCNSS_PAS_ID)) {
>  		dev_err(&pdev->dev, "PAS is not available for WCNSS\n");
>  		return -ENXIO;
>  	}

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha
