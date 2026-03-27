Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D8B395279
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 12:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613434; cv=none; b=LVyym71wxvDgZkocqEa/dMsXIqwh1/43GcUBwhkJxRC7mxZQJfp/nlbv3vOPBuY8ztREjztJB+cSyku5NiAAE/DVFQfKhmniAxIW89/NnIn+gDQqMXP/9gBJAiS8Qq0Vth26SOUolKnNWsK6XBk/nsvPaHBvEJLvCfqBCvdum7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613434; c=relaxed/simple;
	bh=7RB9EZqPtA0omj+QCweCs4rq3RGq8GMapB5Xh18U0eU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEB3eBNNeGWOimqoN8Hk/g38d5Z3hZQ29XPWU+hlCycLPxAdEdja+G8vLulv/cuZ0O8nVgS2Wu3f6hmL4iepmdBwUd1PpETVSFCvgrRRXsCWbE9Hw8SmWaT7TaI5f23Wg431+E18NhU0J47/4bgh5e/yL7KRy48QkXWiEPEAQWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Up21IAxv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvUxO/VQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Up21IAxv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvUxO/VQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wuH22846199
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 12:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EE0yGsx0mvjT/GTmYnfC7r+2Fd45Q0DeobTk/gC7vvM=; b=Up21IAxvjvhnBku5
	1WEMR0plcKU/8LVRwfLOzTqQcWm/3I+FpNYWTAfJE0dN62SjCAwOLiTXkpyOBmi1
	F03PkTNDHh3WcdrldG8ULdMLmcQ/Oc1kjap8+L8KgAcO8jdGI2IPNhmq6/HEfpLN
	Hx1h95vFsrzsa8PP4bVyXCHqy6IdyUtoYOcjZ9fVYdltJ9tbzr/xQ7sFTf2LHYD/
	4rqENwzKnPuPHAvJD0+JtODzjxU2VRtX1Vdi6PlvOy8X1W+bHnHXA+pCGN1JHGBI
	j58bnigDIr+KkVbhN90OmOsKB0BKxod3uqxB7+n9v3z69FMEDlvgerGGDdh7lqqG
	2Kv71w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqmxew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 12:10:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35a0337930eso1852757a91.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 05:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774613431; x=1775218231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EE0yGsx0mvjT/GTmYnfC7r+2Fd45Q0DeobTk/gC7vvM=;
        b=fvUxO/VQvvL/PziZXF+Qs2ai1RD5lOKeDkatgXIzIftSVeQ2vdNNI+soJmTBj2bihq
         DeHHtrDWbfYNIsDl8wHYewXXSZVPvZNpH2pJI8nHh3oPlMeftrguCOzmKsEhBZ7BDKUI
         irLB3Zn5onIMXrQKK/cvScZIApgrL8GDWxt5cyodXEfhbaJDJK/t+E9Le2VBP9s++cE1
         mzxK6Yrsjiob9nVhbCT+z6s6OyyByvQtIvMLFBOr4JYBjaQ3hIPiI+O4N7M+1zeEd1Id
         VG2EA94hQKdyyuVhnP1iXhUc9BCI8/l1RJ3kr7mvzev7FVx7+cl3ThDwWqR7sh/jWLms
         ErGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774613431; x=1775218231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EE0yGsx0mvjT/GTmYnfC7r+2Fd45Q0DeobTk/gC7vvM=;
        b=pb5m2uHNjliSpFnL8DKKqr3l8w6u9ebkvKjgyWFaNdwx4iwQSCRHLgE8785kn20lQG
         bJcERHHfSO8bS5zOtOIKM2cz0Yt1F7zUFm8uD9a1uYhA9O5PUirM0cUwkzHGyG+TC9vN
         syGniwkDWdMelKLu/8lQSTykwiceaQSQe84owK3w3sJaru/k7f+LtzcjnmFTzSMgZpFh
         DsysYJg2ts+91lX++hXtvGIEtuj9sn7cuYXZqeSVGCQkLuqrq+FxvBXR+KyOWkkb/bId
         jqkorYKdxG/+wpX4X2oO2taA/OSoYOmVN6De5EbaFTpk+PVzdPxnbTlsbaDiNkQfzS5F
         cx9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfJTZM+xpmcffSSNhTwgg4s9TI/kn/g1w4fP2CZ/QM8Nz/44ksXSAiwi+BC6cB+GJrJY3+LVOaKof+U1JpbvX9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8TkyFqqz3YAK2Fky1T1ufF5n7KzwO8s3GuunnN1ajGQLFeJqI
	1WxzG2osKchwhIlVdHvqt5n1LUelPeMk8U2IAKv+FNI8KgWWvWua2lybLw4u9XFGpFORpYxtsKc
	xBhXogOexsXfXuYJdTB8nVnTvzp/PzMViFaZoihjiffcgyohPBMAuAEyULxrXB7AWHsus0CqM
X-Gm-Gg: ATEYQzz3fmdIzsVvgvZkmuHK/wOorVspeLBUdE9UpChoreGA8prZYmmKkuAurzYhOnO
	CLXNQsaUKKrlQNJo80B/V7W3uH6tA4zDriNtEU1Hs3MK3OZh6JnvkbD0LckULVny6xwwjbDXPBI
	dhAMJwAYpuzlsdl97dDg8Pg9Jd4F7O7egSM5+GbMOUkvM8iOpdJUY2C2WTRullMY+D1CI42PsZm
	lOniqEwhOKe//VJgco83ob5PEYRbGKUO0Q4S8iY+pF3/U8uFVToXaEVrHoV5g5//ApEjUB/P5eW
	M6SErJ7Gg+e1NlfD1U3CbLMkqtzUVuzNCsqhEuassh6XYOZ/mzrrlUq6FIUBdqwwZKb3Jmh7Q53
	+NbhRF6LU3ozb8n1fQSJCezmXHURsTgZrwLN4tM4GRJwWK4dJ2TU=
X-Received: by 2002:a17:90b:1e51:b0:35b:e51a:85af with SMTP id 98e67ed59e1d1-35c2fff2c76mr2299330a91.10.1774613430853;
        Fri, 27 Mar 2026 05:10:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1e51:b0:35b:e51a:85af with SMTP id 98e67ed59e1d1-35c2fff2c76mr2299260a91.10.1774613430257;
        Fri, 27 Mar 2026 05:10:30 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a81757sm6204402a91.6.2026.03.27.05.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:10:29 -0700 (PDT)
Message-ID: <bc7b116d-de41-4b9a-9c84-1010e226bac8@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 17:40:16 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/15] firmware: qcom_scm: Migrate to generic PAS
 service
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260312062756.694390-1-sumit.garg@kernel.org>
 <20260312062756.694390-4-sumit.garg@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260312062756.694390-4-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4MyBTYWx0ZWRfX5k6FxCojUr+L
 RNyqNc8QolaaC8LCtOKYwmXXIYJ3del2YH9t/dPLjs0+ragfMbcrcYvQysiL7IoBpd8pZoB9Mql
 qVYKhdix6l+XucPEgu7Jn92cNJmLVksC0wBkJmOIcbWRDINeVMa8zqoWPcfN4m/RjRvCrPUaJHf
 UvmhQAnUue7zH0+EP0VV4kcpPRPQ46+gnG8h/BTPjjMFVSSZv4EF8/OMKbhdOPBOVXGezG1mwu4
 PObtl0MLTqJJImddOTMbnUNjO3InTds9Z5JRDibx6r/Dozk/WPy6NIOrSKlMQbnn8g+FpYbzqDG
 W90TaKzLAu5yccbK6NZxgU0ziQlI8e8pTIUVACeHIqWFY2/AX5kS0Q7X9cH32fUAaybYtg1Jdhu
 TJX3nlj3V9W9kUBTdXFqYaB3RWV/4PFEeT0k57BvQlzh16wlxordMnwMHZTYc94dqIQe99x/dTs
 f5XbqpXG5kQC2jrHq8g==
X-Proofpoint-GUID: nmfQA_PcgqVRCgR5h75nQuTZp38ZPA-f
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c673b7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=j567PbXuXaTzagYqJJIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: nmfQA_PcgqVRCgR5h75nQuTZp38ZPA-f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270083



On 3/12/2026 11:57 AM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> With the availability of generic PAS service, let's add SCM calls as
> a backend to keep supporting legacy QTEE interfaces. The exported
> qcom_scm* wrappers will get dropped once all the client drivers get
> migrated as part of future patches.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/Kconfig    |   1 +
>  drivers/firmware/qcom/qcom_scm.c | 336 ++++++++++++++-----------------
>  2 files changed, 156 insertions(+), 181 deletions(-)
>

[..]

> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 8fbc96693a55..2d7937ae7c8f 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -13,6 +13,7 @@
>  #include <linux/dma-mapping.h>

[..]

>  
> -/**
> - * devm_qcom_scm_pas_context_alloc() - Allocate peripheral authentication service
> - *				       context for a given peripheral
> - *
> - * PAS context is device-resource managed, so the caller does not need
> - * to worry about freeing the context memory.
> - *
> - * @dev:	  PAS firmware device
> - * @pas_id:	  peripheral authentication service id
> - * @mem_phys:	  Subsystem reserve memory start address
> - * @mem_size:	  Subsystem reserve memory size
> - *
> - * Returns: The new PAS context, or ERR_PTR() on failure.
> - */

Shouldn't we drop the documentation for the exported functions in this file as part of
patch 14/15? After this patch is applied, the devm_qcom_scm_pas_context_alloc() function
still remains exported and available.

Regards,
Harshal
