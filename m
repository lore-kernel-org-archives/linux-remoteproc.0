Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9172638BA
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 00:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769732366; cv=none; b=FDP2varEhwNcGZlrwUYy3Zz4LLQaVZ/h0xJhbfJJidhznLmCeXGdFVg86ZWgnFjOofEUkQmrTj4jspThF6r0J8SbBs6zgZK8WWxXn/Qe/cBxGWAy/LgvZuRpceEYoqlH8twGRPa+Bbk6XA0xspUOw0H/tX6OcLB4nAsfdzUfEwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769732366; c=relaxed/simple;
	bh=EKiQzoEkzljnc+viujwGwJeys/BQXOjyz6zoi4u0dvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsYU4texbDJCUH20TztefadKxL/nYQ/+l9Rd1DdA6Dk5yNrx+L3CKXZ+CP6VIQlp5tNC4kN/HxgjczGh5uG2k4VhW5BvBjTEhGBpaw3BbuJm3TqfXMPnaA2nlwQrxMrpLpElfu5w/KwijurSn1Z9QNtNsQMRbmo/UhYVQCZcyzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J2FHjCEJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BxDyUWCA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J2FHjCEJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BxDyUWCA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TI3JL63641923
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 00:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9CJ43V4EbjuhLmiO2IaWAjx4
	TLOb/s8qWCGW7bqpIoc=; b=J2FHjCEJbteIYvp8WoUyPUf3glmqk75C/mRhATyt
	gNMdyEOI2/mhyxqc1f4dp6R7vLOYGZ97FgPAJ4ilXwSp03Ia+y4ltnq6M3LDKe5n
	GGZq2dknd60+rIQlwsC1njurnivFpDusv4DxR38rpnIAZS6yGn8WSX7KbWpdCpR5
	OrUqzN4mKsBKKaHzMrHygX4a/yANTBf7FcLpJsarxextHIbsy50Vm3jYPqjuSA7n
	4ic0/qn1SqlJoYWXbeovMh3hqy3/pXuOc/EZvWR8Ab8JVROq4bPyhom/jg0jyUX4
	knXRCZL3n2DIA4gzmbGoDJcqaPihz612oJYFTojY7NqUDQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05sr2hfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 00:19:22 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-124a5098029so8372251c88.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 16:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769732361; x=1770337161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9CJ43V4EbjuhLmiO2IaWAjx4TLOb/s8qWCGW7bqpIoc=;
        b=BxDyUWCAE7RSEm/iDPX8d2vETfM5sj1V5ZJTeYiH0UpZBEApN/nM8ETrFVqTCeHI0S
         90EdZsqTFfWuG8MiuWKKpzEgOjVpz6yAWSrtUpjdc3yt4M5atpD4gyA1iszLu3aiGbi/
         9MosZ7rqTJ3ZVEBQcMzHXSfDBhLrCzo4IPV4rMzF3PxGx0LnlnrA+5PbUPLmLdix2vb0
         vS1vnvQS12TAhTF2BbSSGDDBXoFAJ0eswYP9jDRHiSBwZfPzi6WYURfuB3lhzyS0xTDu
         y+U4sV+JJhfLwdicZgT4r9249PYqYygUpqxJ2xB0A2HZwiQuBP+lypvxNhn73rt/HXUB
         tiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769732361; x=1770337161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CJ43V4EbjuhLmiO2IaWAjx4TLOb/s8qWCGW7bqpIoc=;
        b=kkwGH/m6USAtE1j9NqJB5nmIokD30A9krCrQfiXQHB9rFi3jLpfkhPhvcovyGry1YA
         Wms3KZ/dlIrI4LZH5Yv4BsLpjlJTlZ+mg0zWW+G2wHmooOEu+yTNxUZBgMD7HQmcHykf
         mbI+Nz1F0DwP+H05nzHRoffqhdieV0MOZQ7C1JRrZ5n0KeQ4GCQzS+rnM2CUZfcUnD3I
         ULqZ65M2Xau/pBM7vyTzSxi04P2hFGIiy/M0BMLqaKUaCzGloTjqrNKI5frUA7fSh5LH
         8tEIU66A1zuTgHreQRKlVCsbGcUZN5sVxTgs6YOMDYfWxnwqo6tTluygVf95hUnIZhgG
         Tb7A==
X-Forwarded-Encrypted: i=1; AJvYcCXCwjpOrgaHS71LrP6+w2OOB9e0xSD0J/2jo3WuqFTfM9pp/QS10dz8tanODNjU05yryh0ySzMet1OEcP+s4C7Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzaTvAI3jlAzjDK/QoVXc7p/H4WrdeL0EdG6QJfymvv1/TlPZYu
	mPgqzQxzgwdUissHpkzReEDETD/8qc1blLJi9fkdb0et/Bq3Zvc0oMJAeXF0wzbFq6fvHW/2Vcd
	c7FXNE4XH8q21Va0LDuImNR0X4YBu5Aa+3g1qS4ajUgQYaQ3BZxR0tsBQMTQ/tECi4jwBg7fPs9
	DWEbr2
X-Gm-Gg: AZuq6aLwEmPV27fL+qW+jUbjiw07aHrBT1hPliqdkTjpqNH7ctdSCx5E5Jm10yCIW+Q
	jDwSSZVqhQpcnP9rmlJ0OrpvGXaFMxOInGrulp+xHhArAuVecT/HE0W6waGsBY1QtKgCiVw59Yx
	ENuOtxh920wV4h8R5b2tt3kUboZ3PkJ/MUJzCYNRGcCKd4d0sciz4CluN68yeVOLDQPFCc1rvL5
	l4tZGYYFM3e/Ywbf3RTRe667U0PZjJyWILo/mIbRzl1yYkKkCBNEbIfB2q1CHSyd6cfFPqXJcsu
	75y9FqqJA18jgQV03bFrGOZ+IUKA3bHBJRBzPDrYL+Hicxa3mtaAvoNQb0KxUg/WnYz90KZa6d1
	3HWTRWhTvZfermtLmViet+EA/o2CWx6F3+w7jiTwmsaukNJJ8tF/lU22jWZoOH+g=
X-Received: by 2002:a05:7022:438a:b0:119:e569:f274 with SMTP id a92af1059eb24-125c1021a87mr570953c88.29.1769732361340;
        Thu, 29 Jan 2026 16:19:21 -0800 (PST)
X-Received: by 2002:a05:7022:438a:b0:119:e569:f274 with SMTP id a92af1059eb24-125c1021a87mr570937c88.29.1769732360795;
        Thu, 29 Jan 2026 16:19:20 -0800 (PST)
Received: from hu-clew-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d8ba78sm8163033c88.8.2026.01.29.16.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 16:19:20 -0800 (PST)
Date: Thu, 29 Jan 2026 16:19:18 -0800
From: Chris Lew <christopher.lew@oss.qualcomm.com>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/5] rpmsg: Replace sprintf() with sysfs_emit() in sysfs
 show
Message-ID: <aXv5BipphkogvzkZ@hu-clew-lv.qualcomm.com>
References: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
 <20251217065112.18392-2-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217065112.18392-2-zhongqiu.han@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAwMCBTYWx0ZWRfX25ux+idR7L19
 oAUYnkpDKqOhfeqFxXdwicd0vcdrlgXLcoMC6saEZNzJ7G2kY/U/9TAd0O7IrahVOqHG5wK/TXy
 VMDpy2ruCM7yx7yH8URu33z5K044TRpnroWoQdq90RkUP78Xr7N27xw4F3GVIeX9+Q9pOtr3voK
 nnIyI8Gd2UA0Nff/V8q7O8lcfipSYdgD3yXSJ0C/AYPPHPtKTbe9T+75YfP7jxv26s1Bc+qI7um
 XRrsJQjhodyQWc7aaFFJiVuaBQ60mJc8NUTVehRcjUmR9u19vzTTKn+JzXUaXfUA8xAncf0KsjC
 mwWJTTPCoyeVUBMSkHcRPiWW1IwMayS916JyCsplV21iB4RGixV1i4wX+tvO0NtwLJs5Ry9bNmA
 VFLcr7ZIziEbKCTaZ+zO1DIjx6SxPrzvsMh5EjY1iEzh8/bFexY9QZvU8gbpIQsN6qUHpnxilAh
 m7JsJOz3ATrs60BTnaw==
X-Proofpoint-ORIG-GUID: h1SRSC32X9anxoLSQiqaRBn4-phTi42x
X-Authority-Analysis: v=2.4 cv=UsJu9uwB c=1 sm=1 tr=0 ts=697bf90a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=APNczDZykQHC8614KWwA:9
 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: h1SRSC32X9anxoLSQiqaRBn4-phTi42x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1011
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300000

On Wed, Dec 17, 2025 at 02:51:08PM +0800, Zhongqiu Han wrote:
> Use sysfs_emit() instead of sprintf() in sysfs attribute show functions.
> sysfs_emit() is the recommended API for sysfs output as it provides buffer
> overflow protection and proper formatting.
> 
> No functional changes.
> 
> Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> ---
>  drivers/rpmsg/qcom_smd.c   | 2 +-
>  drivers/rpmsg/rpmsg_char.c | 6 +++---
>  drivers/rpmsg/rpmsg_core.c | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Chris Lew <christopher.lew@oss.qualcomm.com>
