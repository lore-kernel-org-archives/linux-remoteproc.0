Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B7B3C4B83
	for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2026 07:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161548; cv=none; b=IqSPfrf/nJv/R80DpT2eOFAPewHrK6FQLITWnUUzrxEInUOTK45G/CoSbgz6ObtrpBnP42L8AjQuMNyqymK30jpTi8pdJNoLmdsaJzFbZyi7FZrXfIH6BQwUpLi70SzlPeFpp6mSH7xYJCmDxyQxQ6AIxmRb2PwIFuBOklLYxAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161548; c=relaxed/simple;
	bh=9ZtS3Kh7B2FsHHDwTz+hVkE2XOpi6R4tkIHivT6iElU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELXx9B/1by/oac0EFnnkNpl4VhBtFi0g1O3Pj86tGCSbz3KliSYipgqtbLS3hkv4LTHkIZw7/JeDa9aILMa/gj6toHZn9hRjpFhdBoZ1O4sNWAPVKt7ELiZG6eX9FiAWM5pGe1s3VqVJOtoNl8Y/ABA1a+TtjtqeXW+Rr33on0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AuPORapr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCerx+y4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AuPORapr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aCerx+y4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V75rm63543654
	for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2026 07:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tcTXj+RZIfINLYSFGhJYozsiKVrp1yzyjRmTapCZ3/Q=; b=AuPORaprObe/vXoM
	zlxzxDwDlLbi6AO4sF6Obq4Z/HYZP8RKkKHTMflRT64uTA/YbIEL9fdIic6uI0K/
	ermtNrhx+WzIgNnSBTClXXbC93qQkOnVwHSU1qAWUgAtPawHDXIWbRBy/ffdHVLa
	Bw9y5cjNvXcy6LsKOZNugLNsTbYoC4MFpf7OnuSKgaLYjzt2e68KZcb8BoshukY0
	oYHK8pGIOBS4tdLFLot1v2GLDcqolt4uTejq61nuySWvIvaLsvoCoA4JbMlR3GEE
	fgCB4QmEff+6y5fLItPhQ4fnZYTqkp1HzPMicsHMlKz3ztSBy5+WOe+P4Y17ybBs
	R3bJxg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4x083h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2026 07:32:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-938fd633df7so88027685a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2026 00:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788161545; x=1788766345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tcTXj+RZIfINLYSFGhJYozsiKVrp1yzyjRmTapCZ3/Q=;
        b=aCerx+y4gLGLzZwjVu6/qUsxeAGU7R0baGxTSW2PfBMXD2d1J17i7ysh9HN97enJgZ
         OaG0ebXOf1GQ0ePwowlqZM9nYmLPHyeBwztsV7QGy44UGKf24nPZkHiskssRKhCtscRu
         S5Dn+3wq60Dp5R6Uz93q+Shl2o2sxZfLzsaQzO2vBMd60Y6kT3Cf/hQMEDfH9CMiKKSR
         s/0WgFkAU92yW/ldJVqqsik8VyDV1Ck6AI3J+QeuKKEKZa6sho99rDNrWeJB7mHf9LVY
         fgkGokXY3BZ/TDhCi3kKT7ZQSg6/LcOkJGDRikEqJlPkpR6A7nb6cQFchBZDSJAcmJNI
         R5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161545; x=1788766345;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcTXj+RZIfINLYSFGhJYozsiKVrp1yzyjRmTapCZ3/Q=;
        b=sHdpruHKek2lWqgTLp2evDBOLpj5BOiWHEtS1VQzffMxqzOxujwG5Cui7t78Lr8JLZ
         o2TBQbIJwKhe5aaGcZt9bkdu4e6/tr26zs7d1ypAGbPSV7GcStqEReJsCOTSHXxcJJCo
         hsohkmvyT86j89qKrtCVAhwvr86aK7h1eoueQ7y+CDqaPXAq4E4auu7jIrBvscuUNdxa
         b5mOvA6xjr0iCBIWQTw4tM0dvBdpo2XHyfx86t0DSzkv6rxxo2VfxudaSa7S2JASf7H3
         NxEFZK0KHs/E/nrBjJCezgpAMYdNz7wu90pY6oXvLqecMaomDWkQCw31PLMTic/zlh71
         yj3A==
X-Forwarded-Encrypted: i=1; AHgh+RoVLMQ8khAYKYHT97bg2gfTLYGfuEpIg8ORCYXuT4uIZWP9YZALaILCIliJCKcXydYdPXbQ5mHYBCBjxCHViCL+@vger.kernel.org
X-Gm-Message-State: AFuF++kxhqtZ/IreVkhO2WNVxoDmAfunIb0bZ21FoNb9oNK2Ys+Koaq3
	O3OocPFX8NTTNwyrQtk2+vtNf7Cs0O0eJpnut/w7X7wghTjKenkMNLWWJiBSAQY9ez+NPf1meQn
	dYdHPzR8cHTmpAtnkGsnNarNaXezNwxpehU8FaAIX6mTciNOd50/OQZuMxqKFP7sfIWcAgDqq
X-Gm-Gg: AR+sD131DaI3klprGSHzkn6uw8uHPvtoyJm3tXuuFaaHiXxav19zcNn2/p6VMmtJERb
	rwrpnlrrgVrfZw/LKFgeOhKfeWVft7vonwCWsoWfhYO37cwurE/Em2XE1XNho99Kg/Cg/Kq6/8H
	ncOC0xywdKsp1R2XhntF91sHfWmFkq60UruevUiygbBobexTcjQleumeuCFfyLz0UaFOBXkGjvl
	5fmdyRNEgOvh9XboEZ19fWjEziYToEO/3TqtqqmTVnD/4FF6puhyafJMW9x2Kz4NvqpCy0NUJNZ
	y22zYO4IDiWQBZ/yTRNeMVSlgccgC5PTx+KSpXnntRv5bfN9szaYBBTKi//m8IzyDgJx2kwFA9l
	dXtKxqNJGWSsZYbuf5fjoxw==
X-Received: by 2002:a05:620a:178f:b0:939:287f:301b with SMTP id af79cd13be357-939287f308cmr777591785a.5.1788161544710;
        Mon, 31 Aug 2026 00:32:24 -0700 (PDT)
X-Received: by 2002:a05:620a:178f:b0:939:287f:301b with SMTP id af79cd13be357-939287f308cmr777589085a.5.1788161544110;
        Mon, 31 Aug 2026 00:32:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f249468sm389389166b.56.2026.08.31.00.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:32:23 -0700 (PDT)
Message-ID: <4f016e11-ad28-40d8-983a-ecc5330f4273@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:32:21 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom_wcnss: Fix error check after
 devm_ioremap_wc() switch
To: Lucas Sproule <lucas.sproule.42@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260827072735.2262888-1-lucas.sproule.42@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827072735.2262888-1-lucas.sproule.42@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MyBTYWx0ZWRfX/n4KnZ/I+ost
 NDiO2ndruG214yKvpAv68LriMDasKwOyf3E6tTJ6c2n96Qf28XGdKn9tSJbK2p0DZ/2HkqoLRbc
 WvYiPtVYqSc9nU9pQeVjeLCJ5YFH+jo=
X-Proofpoint-ORIG-GUID: S_NxIGTjfKUmCXfNjnvovWCCgyfXTSqA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MyBTYWx0ZWRfXxsS516bPB8tH
 HstBNq5g0srKYwDWa4mlAeyRMX3Hi6XHJ4Howg+xqG+UAGrUSZM9iLq4pmqXURLA13OrQ3ZukQ8
 DYMoU2QpooctItLTpKn+wX9CyhifktxEmI70Uu3S6NGbdMIvoi8zfVtNAjQaBMvDn7k8hv2SZ0u
 ccjT6LAbm4Mzx+r+nXqNHmeJUPhnE2j8GwgAVl+j0JyIOMEoGhemmV2RsTlowqWVmgvkyB4UOcn
 uPvD4I4LsPuVjxfbpTEWYsXIQIdgJoYniA5W0bd6ePuWUoBtd0f3xxIvCCLbDrRTLoB3DabKmFF
 QM42ilYR9HhX5YYlopSsPOh1VVctiN4xek+jwCSkt6gIGnRLAGvpgZpthVTIFuP188PAhLKTjt+
 tKX0JLbdilWvE7f0PUar7tZDJpHIbjGT2rAi1qSLIluZEFrgc1FWWl9THUmkkk9VZV/h1vBSw1q
 SQ6/9Aurp+jqWd7GIPA==
X-Authority-Analysis: v=2.4 cv=Iqsutr/g c=1 sm=1 tr=0 ts=6a952e09 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JRWF6Yl71vgolxuYvxYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: S_NxIGTjfKUmCXfNjnvovWCCgyfXTSqA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310063

On 8/27/26 9:27 AM, Lucas Sproule wrote:
> Commit f9b888599418 ("remoteproc: qcom_wcnss: Fix reserved region
> mapping failure") switched back from devm_ioremap_resource_wc() to
> devm_ioremap_wc(), but kept the IS_ERR() check that had been added to
> match the resource variant.
> 
> devm_ioremap_wc() returns NULL on failure rather than an error pointer,
> so IS_ERR() never fires and wcnss_alloc_memory_region() returns success
> with wcnss->mem_region left NULL.  Probe completes, and every subsequent
> firmware boot then fails with a bare -EINVAL from qcom_mdt_load_no_init(),
> masking the real mapping failure.
> 
> Check for NULL instead, and return -ENOMEM to match the other remoteproc
> drivers.
> 
> Fixes: f9b888599418 ("remoteproc: qcom_wcnss: Fix reserved region mapping failure")
> Cc: stable@vger.kernel.org # v7.0+
> Signed-off-by: Lucas Sproule <lucas.sproule.42@gmail.com>
> ---
>  drivers/remoteproc/qcom_wcnss.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index c856a92af43c..90747af237f7 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -542,9 +542,9 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
>   wcnss->mem_phys = wcnss->mem_reloc = res.start;
>   wcnss->mem_size = resource_size(&res);
>   wcnss->mem_region = devm_ioremap_wc(wcnss->dev, wcnss->mem_phys, wcnss->mem_size);
> - if (IS_ERR(wcnss->mem_region)) {
> + if (!wcnss->mem_region) {
>     dev_err(wcnss->dev, "unable to map memory region: %pR\n", &res);
> -   return PTR_ERR(wcnss->mem_region);
> +   return -ENOMEM;
>   }

It seems like whatever program you used to send this patch messed up its
contents by squashing the whitespace - I would recommend using the b4
tool:

https://b4.docs.kernel.org/en/latest/index.html

for the patch itself, please carry my:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
