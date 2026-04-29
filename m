Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8C53FD15D
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 13:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777469539; cv=none; b=PLVLwyE7f4+tE/9wkk7rQS3IahIZwMIuKEaPZg8xQbjIU1Zyxj1GSP3P29h9sopH6NY7MtPyme96FfeazoQCj2T1E+NnxJ4VH64dPLoniQJ6Is/f7tY90rcMRQgtjU69zsix+5mvPPRlhlXC+566FOqKSbALbh4yfgWrdSSI/N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777469539; c=relaxed/simple;
	bh=8MlgmCf4zwoh87Y1YqLlhl00eWh9D+mSMPCZDrhBsPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdZmIPFWfHzb5ZLQy5G1W/rYKWYlLDTOl56o26FbQPj7RRM+3PRHcTYQ7SSl25MilS/4hmHCZ5uxp8+mAqIr+bYEAtSUp9F6dDElStRs+/o8D4fi9lIJY3MAO5pW3jZ5CnSG2XLXPmZOh7c2qU+c9VuzLmSANaIccGAQmzAsGhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4ShSk6m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sf2IjMdB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4ShSk6m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sf2IjMdB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pl2q3752353
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 13:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zlXmXqOMWysl75wyJsPWf9ub
	9kxU1RPWgNiLMjMjO54=; b=b4ShSk6mKXAOrKXOdRb8rgeM9x0E3AOsUVpGffLX
	YHTR3NG/VHJbPyYcC95HQFsUhNe0VmjCUK0JBtUkd5xLFcFUvZngpyRLOUulQDSn
	nhS0ymk5Q/TAqTVAiCkTu/K2KoGMmZd4ITeT38pEf4r1FLCOVVHy8E6SudEJgvCz
	sI9DUmIPcJBOLQH36FG8SrtbCgHiNJttNS8RBr4nrKjz79AgT6VAzVj2EmgqUN5c
	AYY8mOcO8yx/QLoMEJWhB7hiq7WTX1D0YnsBoA1Ov1EpE1a3KvY9F8ZZNhTwA9ez
	4ag4G9vhGXxwOxTZimD4kr4NPA+7utKXEk+8SArbJOKdPQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duch1hpr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 13:32:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b454cac322so120668325ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 06:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777469536; x=1778074336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zlXmXqOMWysl75wyJsPWf9ub9kxU1RPWgNiLMjMjO54=;
        b=Sf2IjMdBS5fCVLxyyhgvgK6qb0ioWqEp0KkYtXiJOJRkMVK6ZaI2wnra1npeLkItN5
         q4XvXTyqGblTBySxW8MRSco9jEFfKe2QdoIT7IEH25GLEc3pe1dKEX7jQJdEVoBuI1G1
         /rzcjuJAI5EgZip1YmuA9HScbgeGSpa4c4sLSZm0T24QEAtC6mEh0fakLaCsJO6k+6Yu
         o8LmyFoMabQuCEFjti0hkCjSYmhnBbRQ3eFRRL9WbwOaTBVK1FoeATiXw8XCfZrHrRee
         fKH4Wa9WohIvnq55KuXkYVHLB0RTtW6kI6ur1CjbMfOkBMderdYHjtht7Fm63PoPnEDL
         k6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777469536; x=1778074336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlXmXqOMWysl75wyJsPWf9ub9kxU1RPWgNiLMjMjO54=;
        b=l7kJc8xIHzRJ1Weu2kqRLtgSLS1kGc/BbuXoe1vNx7t/4Fc1Rsng8lgs1JR2g2lQVM
         XdqLag0dcoS8wVVDpp7T6AbBZnUEeoSp54mP1IFuKgsAbDRAJuU3L+YAuy+zeMt3I9B3
         XGoooi9mlwOd6U5JEGM6Z4j8Es0PFRs5WeOFQ9tZQPfvB5xCBVi+JCFCECkUpBohGJvE
         3XBW8t6ZLCkpyVNogHkxiQBjvN5iq4j79V3UHELQ0Vjt3cFhBgeh5FhDXB15avJOusjq
         DCRmhfmwwAB0fLLhAvcqt5TLRWToDDe39aPvSm7w05DQCBJnCOmpeByZn8uU+Sx5oQLh
         m8Og==
X-Forwarded-Encrypted: i=1; AFNElJ8LnuiG0Oz/thrRAaDc5vkFeFOCy/oxeMI94//mOXCXgodtnhH9pbFrq3z5qAtWOlgCQrK87ddzFC9vBfM/7rK/@vger.kernel.org
X-Gm-Message-State: AOJu0YwnLb7bo09CTcRSW45sKizAbDV7gfsg8+J5j3bhRiogWsdaIemc
	sGzf9WSk8znnL5pB7HiHOn2EEmwinLPGgS2oHPsq0tGoRtkhGrM4MWvvKF78wj8sdl67TbGVCV/
	sB/gVPe63Z3vXOvFmiWfRDrZAzQ2RkV4B7bRDMA3mdj2bRq2IzkUXDY74J/V+JmWvd6U6ktdn
X-Gm-Gg: AeBDieuhltNDgwf/ChxIJh+xdFhXsich4gT/R06HbYflBaBzlxOBEJ6Gq1CCXOlizmW
	LwkHbTHLATHC5bImRWqaq75Ps1k6mt9Af17tklN6okzmwITHWCg8OTNnIfY6xTHOAfe4VpkJxa6
	pKhbd6COB/9aOTyuv2ZbTEDh/Y2ER8hxarhM3t3IXoCZfFRdb4l7I2QLajW+DY6+051JUqLzUrL
	guzFFHEhgY9lEPEGEQyBdfsAUl59y8ELYfSLmu8rsWHgWX/VlvjFxBoN1TIbdY8KMpSTaRR4hS3
	pzf2qw4WyTBenqpVUVg4yFeACN66n+zDWeUV8OlJaP3rdDW+a14rklcqjQDK0B0GB7n1GZCe9eG
	BfmxZIOI8jesnsd58PTS+mRicVON0DEIwr8ArA5Vj7Sw/xlWO9qYTm67p3YA=
X-Received: by 2002:a17:903:2283:b0:2b9:86ca:5bf2 with SMTP id d9443c01a7336-2b986ca5cd1mr44795445ad.30.1777469536343;
        Wed, 29 Apr 2026 06:32:16 -0700 (PDT)
X-Received: by 2002:a17:903:2283:b0:2b9:86ca:5bf2 with SMTP id d9443c01a7336-2b986ca5cd1mr44794745ad.30.1777469535665;
        Wed, 29 Apr 2026 06:32:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893f0b7sm25818105ad.40.2026.04.29.06.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:32:13 -0700 (PDT)
Date: Wed, 29 Apr 2026 19:01:57 +0530
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
Subject: Re: [PATCH v4 06/15] remoteproc: qcom_q6v5_mss: Switch to generic
 PAS TZ APIs
Message-ID: <20260429133157.lopr6n5vaik36466@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-7-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-7-sumit.garg@kernel.org>
X-Authority-Analysis: v=2.4 cv=arGCzyZV c=1 sm=1 tr=0 ts=69f20861 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=UXi9AHVq_sPz40Hf2JYA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzNyBTYWx0ZWRfX8+MQP1bMQTGB
 Very/ZB1rKlGhl79dehmWDxKs0YWL+mf19qiYXb9CBa4z8zEfVDuYeVbnJj3UbyrxKrxRxRd6Dz
 p9AN2z0EfcSz0Mc8d7F9HnPdGOi6jALRf5jYpO6iQRvFevTl24MRuagTcYZP8nsy3HKj7ywlgni
 PViXNq5ibDVELfwQUEBVb3G1Vnr6HNeeA7WeT486scOb7KUVIUO76MmszZ2a0zKDv5H0wOvAdFi
 xs9/CDhLUFvApoVGW1DoQuYjFHCMToqWQz3I5fIewipMPYOqAtNoWnXrVzRNPxQDiTJesiDUYBa
 7KhQhlIjlmUeSK2WDZ5ZwKf/R5jhts8Ens0EAaRahfk2m79mVJYwt7fkI5R0wj6HvIClWVQzr3r
 xyW3kUeOwUWg5x6f3sl5Pru6TYoxFgKI5T8+8dAifhPx37Fn9VeCoTaXErdXl2snVlQu99Zj2DD
 necGyB+u3TknxSAfxCA==
X-Proofpoint-GUID: zPkvzXz_xOY-Xwjwz-cVBglqOeLYhslw
X-Proofpoint-ORIG-GUID: zPkvzXz_xOY-Xwjwz-cVBglqOeLYhslw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290137

On Mon, Apr 27, 2026 at 03:25:54PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom_q6v5_mss client driver over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index ae78f5c7c1b6..96888007faa8 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -34,6 +34,7 @@
>  #include "qcom_pil_info.h"
>  #include "qcom_q6v5.h"
>  
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/firmware/qcom/qcom_scm.h>

same here., whether it is needed now ?

>  
>  #define MPSS_CRASH_REASON_SMEM		421
> @@ -1480,7 +1481,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  	}
>  
>  	if (qproc->need_pas_mem_setup) {
> -		ret = qcom_scm_pas_mem_setup(MPSS_PAS_ID, qproc->mpss_phys, qproc->mpss_size);
> +		ret = qcom_pas_mem_setup(MPSS_PAS_ID, qproc->mpss_phys, qproc->mpss_size);
>  		if (ret) {
>  			dev_err(qproc->dev,
>  				"setting up mpss memory failed: %d\n", ret);
> @@ -2077,7 +2078,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  	if (!desc)
>  		return -EINVAL;
>  
> -	if (desc->need_mem_protection && !qcom_scm_is_available())
> +	if (desc->need_mem_protection && !qcom_pas_is_available())
>  		return -EPROBE_DEFER;
>  
>  	mba_image = desc->hexagon_mba_image;

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha
