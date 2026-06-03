Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976FF46AECF
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Jun 2026 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487952; cv=none; b=Yekq38cPAM9YgYM1cCSvVe7tFwp6rBDLAZ/AsliWRjK1nHuB0KJ1YgqX+uXSX3LbPMYpGhPChJQrfJyE1j8sah81eehm2M+SrHcbAZAHhc6Z/mH2HYYuHrCIJug9JyjvjZaMV7MBl5/TwD5nmQjVcrIi4ybFs5myTUphGP0EnVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487952; c=relaxed/simple;
	bh=5hh9KAfgDd4Ko8JjvCItCurB2QbuNBkpHgr/whP5+hM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhqE0qYj+S05KHJnyRdGuZkOhB7qoyv8Zp7upUH4OfN+TguuT7BfFHRBiMedlpAivp1mcZfeI2H6x3rBlMdtK2qVkiCPM6n9FHxRzCo8MMJsvYXco9VEIx5JxgrFkwMoFLX4n2UY7DEocMZowMlX+SbMca9506FWokf7icuN+W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DxtnNu5n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Apo7z7w5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxtnNu5n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Apo7z7w5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65395oHC780679
	for <linux-remoteproc@vger.kernel.org>; Wed, 3 Jun 2026 11:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AMOvrnAU3Y8JDA/EwcvMgVe2
	dZ5gqIzQz10gP9VdTl8=; b=DxtnNu5nYKK7bsijlmqVHWFO/BXLduq07gyDOaiV
	Ro7IN7MkPLIb4s8bwaH7JrYWaMw6+SIx8yHeBioMKQqYTcyxlozVMlCfQifRe7Un
	R2/WIWxDNuep/BPVT6E1OW9O3YNK8ZpKdeWI2Zqzzm1Bli8RElP4/5AVnmFJMhxA
	z8ReRd6vnp4zgcoR16ZTAm6lLm0jXGhclDWvSqKcddZnuglLQuvQ+iM135O7aLeP
	a64/Fjz6b+PAt292YzfDhFn3qnMO9EY0QciSDWVWomcUbNfxFkuRx393HUx0LO2V
	IU2akkrju9VXmbLGRq531A+ChP8DWA8TxewXRgf6N+T8+g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejhbb0nye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 03 Jun 2026 11:59:10 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6751c50552dso5054834137.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Jun 2026 04:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780487950; x=1781092750; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AMOvrnAU3Y8JDA/EwcvMgVe2dZ5gqIzQz10gP9VdTl8=;
        b=Apo7z7w5iwlFK4cWANT71CUxBKQSCWQzrT5861AMZVSPfw+KtQ5oc1gMcb9qCrhU+J
         amHgndyorZdSzd2ZP2NHdvD2jZKNjpuvTUTn0i38Va9P/DjO3MDV4rDPoiyq9QkpkIG/
         jgKzbQZEtWkwZiLo/c8ZTRCeL0DBrb7NPa5TESkF/UIDz75UEqC832eELzA8jKiL2oJd
         faMiGthqZ4reztlkVhETVcOiMEdCdPoj9MpqiWRa89HmGXh6625N3Y5jkEambEgtUbPw
         9sMRUtu8GVCKp6ErQJIMt2ns5Rzc7ZTt9fQPr9ntcd30+M5GMwXCe7d4Ei6OuIUg1ZvB
         JuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487950; x=1781092750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMOvrnAU3Y8JDA/EwcvMgVe2dZ5gqIzQz10gP9VdTl8=;
        b=LUOpoxNfpJ9MjgR754QSU5OnowyZDYzw5wDmbS7gvYr37xSaO5A90IRH8pDYhJ3yO9
         EZitm+UM1CWT6mZIdVpkQI0YhN73q/Dv7u/xGVPHFuGj2SDN/7OdYgWd0haoj8S5tw0t
         e5MPLUjving9IJidsJ8MNrejij1e3LHjnSEQJ+hW1luO/uJV5BXAzBb7+C3fRasX2yNG
         RbfBcvR2EJe9vmShZyk4S8YbXpHVd8Zywoq3Fd9CMXWSxx+4Y/RQj0rXsMkXsfbfqqvx
         3no2/+lCYfa7djb+BPoq+FoyETA1sBZuObC49nMRGtJ4UXgWd88AkOnkVZqNenO+bguZ
         c/pQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zkGyHm1fHevjWtywyS52/cS8f/9FCoem+sH+aZRxkuLRLQlOinBHVuioCF/syDsgRrA3xPFk17ZZU0L73t1zS@vger.kernel.org
X-Gm-Message-State: AOJu0YwvkXnCCMxdGrKkrBLNPmONG3mU4cl10x86MqL4LfdwNfV5aWTB
	SSvWSAvrF01exWewrfe0UKHmzZJhRA18SuHvuurXUf1MKdv8mNq4PRBlNp5+1AncRwZa41lZnXh
	BvX0mqLq5Rm3OOdfY5URPcPlPFbacenvqDbPexhlmairja23RfJJhymIb73mUsYU1t9JjpAfe
X-Gm-Gg: Acq92OFbXlnxAC9pEFSreaedqlIrYPYekM+y1jNzpt4CbT7MBEb+T4vlatD8+ywYlnN
	TQoLjm+86/kze+7S9yYZEZU8nicM4mOWzj8GiXMF1iUycf9jkAP3oCkFDn173AYupcXTXGCHmg9
	It0h+URGcRFl+ezh9oZ+UKS9WrSJFxJoFBxyiJpDMoL5sDWXXS4icE+zs4S7AOlT8oodtegjSIe
	uIrPRajMROwOac2piWJh+zFM6pcjlKCdR00DPDZlpzGQMbpNckk1ltKwzC7aDkQzoXWz60sFgDY
	6lHI4rX+M5nSbm1GCTfIRk0rfVtiGj9K5BlozBr5uZecJ+P3dmKM8Rw3qlaqXzXU1hkUjPJaoqc
	jTLlubKPl3BeIDmu5uDHMDe9sf94B7odzJY3vU8pvoO7+3+V9L2HZWXzANb6D1qoSky8zX4i3wE
	iZI5nWy8M9zToT0LIDuuHs8ny8lvt3lQcpFs8+HpjafueTow==
X-Received: by 2002:a05:6102:3a0f:b0:639:6533:65a0 with SMTP id ada2fe7eead31-6ec45050984mr1046701137.18.1780487949766;
        Wed, 03 Jun 2026 04:59:09 -0700 (PDT)
X-Received: by 2002:a05:6102:3a0f:b0:639:6533:65a0 with SMTP id ada2fe7eead31-6ec45050984mr1046696137.18.1780487949331;
        Wed, 03 Jun 2026 04:59:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac07e243sm8898591fa.12.2026.06.03.04.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:59:06 -0700 (PDT)
Date: Wed, 3 Jun 2026 14:59:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] rpmsg: glink: smem: Use device name as IRQ name
Message-ID: <nvuzajxbs6nn7wdm6bu6dhrdylikol7meijnlq2pmi2epvicgj@d6pmwpv5e5ip>
References: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
 <20260603-rpmsg-improvements-v1-1-dcfc22ed69f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-rpmsg-improvements-v1-1-dcfc22ed69f7@oss.qualcomm.com>
X-Proofpoint-GUID: BN-dA8cwTNPD10fcceHnWhUx3jeAGsxR
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a20170e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=M4aA-yYNIiwQogNIN3IA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: BN-dA8cwTNPD10fcceHnWhUx3jeAGsxR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDExNCBTYWx0ZWRfX54nV+OdN7XE2
 qbxhxfVwTjxCoOZc5oFwzPPyH2Jvuzy4vKdP4dvPl7BPFkT1aEHzMbVNWv7b/2w70Igvufspkov
 8vPlrLzXd6IlRLO+t9QlSGMb6mPFp36tUeP8jqqcNjxW9VBTQwzTVqU08OPQyCvYtl3khUHJLnv
 zUYlEuQSvS8FEGIrxM/NUDerTLyYeRFqjQ8qXHjVDcTMX/EN5zufOFZq3p54g0P/p4/ZATW32mu
 POPX+2LZhCbJi6Z/PP3h2J5ArvzBp2WvPg409SCj0RAI3v2FPURarPdrr2q5pc9tjr1ubh6nvBJ
 B6+75DvFRBDrNgYkShs8GBpYPNpWdEWEBY6NfQ3e8cPx8BmQnbtPIOLkcCrUH/EIOoFRaiog+Mx
 QMRyIF8zQ4mf/qpl6AAu3kBj+lMal1r3BcP5zc3odi0XqbePt2wSEzrDaezfp6IxRAzGdWWaL66
 MZx5pGD/FeEJ/olZQHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030114

On Wed, Jun 03, 2026 at 06:14:28PM +0800, Chunkai Deng wrote:
> A SoC typically has multiple remoteprocs (ADSP, MPSS, CDSP, etc.), each
> registering its own SMEM GLINK instance. With the static name "glink-smem"
> all instances appear identically in /proc/interrupts, making it impossible
> to associate an IRQ with a specific remote processor.
> 
> Pass dev_name(&smem->dev) to devm_request_irq() instead. The device name
> is already set to "<parent>:<edge-node>" which uniquely identifies each
> instance without requiring an additional field in the driver struct.
> 
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> ---
>  drivers/rpmsg/qcom_glink_smem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
