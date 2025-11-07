Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E4B2FD673
	for <linux-remoteproc@vger.kernel.org>; Fri,  7 Nov 2025 10:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762510650; cv=none; b=gNylGGESYeC57giFERO7moGMlppPhIJfyt6mu/KQ2hkkYBtSWLAPeRHDP1pY47tt4wSz2jhuEkkLGiOso8AkASxcXIAimlV/d/BOJaL8Rzwt7OLyarVsWLBsJMSiErdC2vGZqrYJuLnGLBAPu3/Rc4M/ojShHRcrviiGT6pjVVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762510650; c=relaxed/simple;
	bh=2qs1VG1n9bjiENuAjdiCJJSJcQywxwAJEW6SFZp+G7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CKGcWmQ9HA/54cgOLBjywg0G3h/UbJa4UFofjeDYNvd7b68CBqN5UF2wmmBgcZwO7NNs8ApZ2c0UD5rNNa6taXf/hyw9kb9WB91hRBQi3yHj5bP7gPiJiknvonhJlKgbB6K+ENK+ktG/r2hU9bhMGQPKSbG8QzRRmfUpd5fpWX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVqfRCZw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YpDDELeJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVqfRCZw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YpDDELeJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A75H98w568016
	for <linux-remoteproc@vger.kernel.org>; Fri, 7 Nov 2025 10:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VB0as2X5rpIdpcXtCyAvYkLDtHq+50iUEPo6nofU0HI=; b=RVqfRCZwtn03rQYw
	y1tVIWooVijUQhG+dkJdwmLnX130OlTFVOPw9wL5FA8dUGq0DWl/BF0RXbKseiYX
	yGDkrhtqhAZQygkom+Sfb2ndqg5iPHHcRV4XsSRoLmiDsFu1d59J7a5cHwccNUu2
	bhFfPQob8kwarW7UFGPqWRHuWDPmJK/7IPPrJ1omQIMfArGBy3UANVjDyF9uG9Po
	2kZTUKATVYi+uJSeB0co/uKZ4qDzyMvl1mlMOhNnKgZr267lYXRwx+Z3rmKK+n70
	5bnBAi+2vdlF8wgpErX2YNHV+gHnbGFw90XCG4B5yYkmUg8DkSX8SmPakVS6k17S
	++RNLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a905qjkxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 07 Nov 2025 10:17:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-88e965f2bbfso20741285a.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 07 Nov 2025 02:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762510647; x=1763115447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VB0as2X5rpIdpcXtCyAvYkLDtHq+50iUEPo6nofU0HI=;
        b=YpDDELeJ1/DmshR+ehv/RQOOKc8HpFcMbhTMT5vG1tcq4zrBtGeISu6wkLHZ4GNqzz
         qStzJec+hyjP878Pp5354lZeWqHOppnC9uFUPaGe3t+Mvk/UWNbUelSSAJOF96BTEjvX
         zu54zRQfBq3WhUHiMsu27GuoD1VEugIMVQZpFUoYMEPd7aukuwLZ/y9RD393gBkW/3X4
         KpCkCCEoxAMrqtmosct+uNkUq3lnJUuO/Fob9XB8XInL3vw92bb8FtmBFA2k8p4rBlmo
         XCQxYsEwXsgWlpCCnfC8LquuPEDdkCjfb6BAeCEVQhiybyPp0rK6f7o/NHtU4H0Oqk+1
         AkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762510647; x=1763115447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VB0as2X5rpIdpcXtCyAvYkLDtHq+50iUEPo6nofU0HI=;
        b=PmFtr/ecJsF8spBhFvo6AbvPtIcfsj7uif/PVyiE7zSDaJWIShG14FlL2oUbjq3FQW
         aZlDmRT62rcnP20h8UejloDzK37i7/AyuakSKc+L427m5t6hl/kQBcK5FAOnHKK6/GVC
         PA6rNIPzjuMUI1av4vZtW/6RpNb6SZn0vnMz6Jvt6r3S57JWjCLyxs7divRdVRP3PZ0i
         3E/+Y06PX/bI+9MQt2stcq1uTUVhX7xqN+Axv2gEW/Kf0xQqIg4T/Z6jWUA3yBo+8hWl
         c7kCGTbV1npqu6UddVBIerHpGY6v9D/hnArZqVYt/3VyU9xndoLJ/3cfTVf+kcV+cGlQ
         apZg==
X-Forwarded-Encrypted: i=1; AJvYcCUWz8Gepio0ZnC9+XiuQWti1c3+BTgUFJa7uQxsFEnTfG/YYt9SRSmzuqd18QN1B+eYQolyu9G5gttEKccHXpaU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw36KClLKXdgNLiH6ivEzBnLrX1ouGr8kKxrkfup9JNcQP+qtgX
	IyYz2WVQVrh2fOPoVb3dJ72nJh9KryGt/3NRIkmS3+LaJ0yW4BYFa1sZdZZjfZPC+XORyb/xjw9
	sMjAuBElwoLCGyGq6EP5px2tz5RccxEmxD2AEVQL8rP6VnkI/zx96WYc6wVBcoCcPwxjISAvZ
X-Gm-Gg: ASbGncvgdRMP23lIMOc1c0GTecBx9klah9i3Yyj9900gVOSPVSbimvrJX0eUgZexczX
	bx+t7V082T4ilqmXq/vCIri42p3lx0YWRfhcAYDZYxnt5FSDVbH1TK5ggjROvLQODsCoRfunraT
	UUEwpmqYvDJ1Zl/KEn7wmJvWvynMMS7F9FbewBSEBn0/db/iNVgCoLO+/7aNFs+8HfOmChem5Qq
	thgTibKiWETQlvbpODq4BPkQv05XrcxQew0Af6LedxtLtoyReWHWfD+G8CbgUL1p51bmxeFx25w
	/QSx907e9eeUouPVkaSB3uxXk5t3o2M6WWD//8jnw5WPbSXQzK3fBLxGhMsj2uKXCMhjV8DA8bu
	mnwoJJmf5jW31U7194eml+FDECyJag59vB7umjEAiwrGlD+rEDhCQfoJF
X-Received: by 2002:a05:622a:15ce:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4ed94a37e04mr19204891cf.8.1762510647122;
        Fri, 07 Nov 2025 02:17:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+bmYMl9sgolDCLtI/3Z/25Cac3Pm5sw0YnJKVwj4DCLlvp+FVu1J9wmfnutrUm1ga/1XlbQ==
X-Received: by 2002:a05:622a:15ce:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4ed94a37e04mr19204671cf.8.1762510646566;
        Fri, 07 Nov 2025 02:17:26 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f813eabsm3712122a12.11.2025.11.07.02.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:17:25 -0800 (PST)
Message-ID: <7a5d188d-989f-4843-a10d-0fbad94a9ef0@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:17:23 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/14] firmware: qcom_scm: Add SHM bridge handling for
 PAS when running without QHEE
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-10-7017b0adc24e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251104-kvm_rproc_v6-v6-10-7017b0adc24e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dURJn1XU6TfVbIovXwXa-WwiJn7LpCOP
X-Proofpoint-GUID: dURJn1XU6TfVbIovXwXa-WwiJn7LpCOP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4MyBTYWx0ZWRfX8actEqqk/vo+
 EpnKmwvoVuyN6wGkPmNZeEeErtmByReFb5DpZaG195sPVG6BE3puElODh7T7bY6agJCvHWxH0Y1
 6GP9AUu8RhJCpx79iDcCBhxT72vCw2joyKnApxSnU3W637M+NxcBz/DDjnMWGtKbodFB7k3X3Qu
 6bWJ9sI0aSW4/CTh86Go9VGkqLDpvQdDw5jt36UJ4hzytxE6Bxm8+mcdRy98mDtzdhDcao3WEEZ
 aMjlbqGRf9ULoNFyIdrL9jukkSK+cXxJTvb+eF5CCUvCexAeZ7oV0JFxJIvfffroN0RsT6HihA8
 poZ6H3Kktv5oA5s8MgW7hQHHk9p/NIsL2yL+8J1YbblKGEU1hRMk0oa5vDVJbMk4viNeDv08o+1
 ElRFOTPq6CIHcxFknQ4xLZz4jseucg==
X-Authority-Analysis: v=2.4 cv=D6lK6/Rj c=1 sm=1 tr=0 ts=690dc738 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rBf8QGEbTI05NIq0_6IA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070083

On 11/4/25 8:35 AM, Mukesh Ojha wrote:
> On SoCs running with a non-Gunyah-based hypervisor, Linux must take
> responsibility for creating the SHM bridge both for metadata (before
> calling qcom_scm_pas_init_image()) and for remoteproc memory (before
> calling qcom_scm_pas_auth_and_reset()). We have taken care the things
> required for qcom_scm_pas_auth_and_reset().
> 
> Lets put these awareness of above conditions into
> qcom_scm_pas_init_image() and qcom_scm_pas_metadata_release().
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index aabdef295492..9d3e45ec73ac 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -625,6 +625,33 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys, void *me
>  	return ret;
>  }
>  
> +static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
> +					    const void *metadata, size_t size)
> +{
> +	struct qcom_scm_pas_metadata *mdt_ctx;
> +	struct qcom_scm_res res;
> +	phys_addr_t mdata_phys;
> +	void *mdata_buf;
> +	int ret;
> +
> +	mdata_buf = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
> +	if (!mdata_buf)
> +		return -ENOMEM;

I'm still a little sour about this function having to be separate just
because we use a different allocator..

Did we conclude that using set_dma_ops(some_tzmem_ops) was not going to
work?

Konrad
