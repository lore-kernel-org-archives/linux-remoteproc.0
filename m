Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EA93195EC
	for <linux-remoteproc@vger.kernel.org>; Fri,  7 Nov 2025 10:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762512429; cv=none; b=S2HgLbmF9QNtOkbGWB72Gc/KpwMSIQMzgU2Pz7F+hpQYnWZQnYA0MFMULzTtGWVxnJXdvLi/ny3KFm4K9Go/IHwcutGAmzxOu3ffwI9A4FNHmbGCuuzHShH48lWj1gXk9F9x68Dz/NxcNxqzGsBs9/Pte2EQME3HXCZilo0ZBbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762512429; c=relaxed/simple;
	bh=5IK8RZHfjPF/UHfY+oixKY429zs+fYo3a6pLKo6eKg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BpuiRT2qCiL1UNjoCh01ifGoXZURXkni7bqHZcgGdM8zGaihLto7hrkXt9phc2r0/mSqszLqk8A03NBde6KQ4nIIjZtodD2L8OJFmH1njTOiYWwtRB1JX0byTDPkqSNjAm7Gce1CRhsgjjgWJQv3y3CUI8WoEX4in00M3ogA2CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZxjAZa4f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmsdOCxc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxjAZa4f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZmsdOCxc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A75ZQBD528491
	for <linux-remoteproc@vger.kernel.org>; Fri, 7 Nov 2025 10:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dIHOZvzi4E5EsAkZDn1XATnMDVaEEEIARQJGPB/JU9w=; b=ZxjAZa4f7mtmONPW
	ErmgE26ODqDURmIFU2UUiKJNWDzvNxwxTHGwqOrK02FY93zjU8FmfpD6FrfUbgCU
	Bc8dj27iYKWuZ50NMDl2/8Oqy0WpZpQZ3icBScgVphbDpwWePjegGNlnG/cp+COI
	omeBznjo8LJtz9JpcAVCtGGcx+TGJQgL9SwCuSRAqQ8Wx2RVBrTH/jNRnUICuAcl
	LhX53Bh8zHBXbLWT8TluWGdLDuebM9vRouKPcAp7Brswpiy+M5LzL9md7bMsaclo
	kT+mLgiW/8G84BLOe/ypxc9dbII8xg8pCrAEUNO9ugQagng5l4kRtMKIdvvbhEid
	obNeCw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a905htq20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 07 Nov 2025 10:47:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed861df509so1787321cf.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 07 Nov 2025 02:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762512426; x=1763117226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dIHOZvzi4E5EsAkZDn1XATnMDVaEEEIARQJGPB/JU9w=;
        b=ZmsdOCxcB5H5sSForMSEH87sUQkStVn7cOlx05yi/4Qihe1Ky1/kOUviBGd5YO3s5W
         yjIqI4z/jH5noYf6TLQJAV1RRx9tN5gWMaECU4sH36WiEGfZACXBbd/k5jVelbSxVaEq
         R//P1yNjp/DLFckAPEHkzeuia3Qgmz23nl84WCLE2WMTzyCMQV61q/QzNCu3tRQ3oxc4
         AQ7u9jg4pFre8MuVM1RhQD3gw29x9scbd/fiRRjHsoUO2rFQ06uLhwVi4yZaIHirs0ft
         huay82eB3MidcfXEjbP5NMIJ8mibd4+2+UxrqT8nfmZp7BB/V6VrwGPRSH8NARmLbPJA
         gRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762512426; x=1763117226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIHOZvzi4E5EsAkZDn1XATnMDVaEEEIARQJGPB/JU9w=;
        b=WWsPFbe1PBmS93OJKtlfQozyZrN1+nE8m8pwdYHajkm41Df7+RqewAX6yYJNAImDP2
         /q62fNG9wKKt+5sLAzgpXhhVhHa9Mua18azD5lg8ZOq0+r06qM4bkuvgeEHKFVWRpQXa
         EDCCYYBzxG5rWSpWZZVVz3ZNqceMz257cAKN6MtGyA2e7FP2at+Z5PUX+WxBIP+i2y3p
         UEwxRV642fMhmREHbVCbVwT/iHWp2dJbNd+G+FJ7qVu04FARSL2IiOaGS21/gGUAAP1r
         kvTSYvzH99XubbsN2SyXAzeqROCLwePflIY4oKwBts3oe6uSFSb1I4k9pRM3EhFdAnKl
         P9Eg==
X-Forwarded-Encrypted: i=1; AJvYcCXNzUU8LrBQMfgAKyZiy28i4cgnSUm2UQUfH10hqOrB/tsmTYddkRqIx3pUaQ4+r/FKzcB7GHo4aTySYQ43gzq5@vger.kernel.org
X-Gm-Message-State: AOJu0YzAzkaOE7EDnN7rE3TJ3WNaDuBgx9PcZCT4JgfwwZKcdL9Dwn5I
	6NT+GBggICfOxix+3Hoi2Se/GYsMBzfwGsmhmiY0/OcYnCrykBBvu8qxFC2p8Xc1CM+hlv2rBgn
	SCJe9qx9aiMqquxdF/2b9/RzPZV/As7byTyHerTXPnxosQW6cXIx4QwihdkqeIlcp2EkbUPnH
X-Gm-Gg: ASbGncui14xQ8lr6b1V8Iwh/7RATR/8O8LTIjeSluYcE7QAZYNgfYEcdoKTsRgBVNKd
	PfrQkvah291hCjDg+ZcK0AkOLQHxhrHV6rMq0GpG3ndXaAkvtv/74Y/xseKdvttSgVfH+/a9m2U
	WGwu10ZSwHR39NJSFrvwEes3S+v/MlNK/kwMsERvyWn1A1UT7lwDYnQrvUk1DV1cejS3Vik1K4C
	Zs0dSaLe/2TTb2MAQiZY0KNaNRh8mCvULTaeC47HaDHR8qDPKrAtj4MOAAOcRsMYXPgb7pGMUkR
	KG4xBzmK/YXHjd2zGZNakfeXvdLt+DwtONMBoVXMIe3fcsTAIiLHxGEaSentUKK0qwqqYUwpKhP
	G23SZsBLvTYaAoit2PqhTLH+52FebaXDxS33Z2mUu5zh7aQ1I+WpnHuZQ
X-Received: by 2002:ac8:588f:0:b0:4b5:e4dc:1ee5 with SMTP id d75a77b69052e-4ed949427a0mr22179321cf.3.1762512426100;
        Fri, 07 Nov 2025 02:47:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoxSnMWMtBwQXfeE2aIAOpjt2jjGXuUkOeuQMREJLvNPefUZXyxg0VWuhBA5nLVm4h0jmrNw==
X-Received: by 2002:ac8:588f:0:b0:4b5:e4dc:1ee5 with SMTP id d75a77b69052e-4ed949427a0mr22179101cf.3.1762512425599;
        Fri, 07 Nov 2025 02:47:05 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d456sm218152066b.39.2025.11.07.02.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:47:04 -0800 (PST)
Message-ID: <89e65adf-fdd4-4b98-a220-fb0f77dae7c6@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:47:02 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/14] remoteproc: pas: Extend parse_fw callback to
 fetch resources via SMC call
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
 <20251104-kvm_rproc_v6-v6-12-7017b0adc24e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251104-kvm_rproc_v6-v6-12-7017b0adc24e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4NyBTYWx0ZWRfX1IiPuRQoaLSX
 vm4kf+uc53m9APxAfPt2T59uk60MreHX0cGbipvFbtHOBNRMgHkrAiPGezOMsAVpT6i+yb0eJAG
 AkU/RGf4xZrK6lc4i2fjeffEyPIhXzSgFI6owy5i5wdLsZz7mWWLjRg8fcnUJzxpl4TjdX8U7EP
 kYK6tu74QlRdbBnhOLbXf3knrXt59cZnPeGaXBZfiuNU2jMqX9z+emb6TlbrdDiOOZiaENo699E
 /0wmayZ0P8hyOAU63Co/trpiabcV/W9ndpCZ/aYbeIBS4qMYZ9eQ5+f3QtD6d+m4ZldMdrFuhGh
 mQJnXozUkwq9k5vg8h1n53linC53+fQVYox/IC4LDBipA9K5Em0TdJZpQpwqg1fgjGKK+EpuAZc
 aRqeAhzFEmX8NFgqEZPYuoEcZPJtCQ==
X-Proofpoint-GUID: kubnM8TRHMaQcvYybcQgZY-lNaIKTdtC
X-Authority-Analysis: v=2.4 cv=GMAF0+NK c=1 sm=1 tr=0 ts=690dce2b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=DHMX3CF8R6px0_vBxB8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: kubnM8TRHMaQcvYybcQgZY-lNaIKTdtC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070087

On 11/4/25 8:35 AM, Mukesh Ojha wrote:
> Qualcomm remote processor may rely on static and dynamic resources for
> it to be functional. For most of the Qualcomm SoCs, when run with Gunyah
> or older QHEE hypervisor, all the resources whether it is static or
> dynamic, is managed by the hypervisor. Dynamic resources if it is
> present for a remote processor will always be coming from secure world
> via SMC call while static resources may be present in remote processor
> firmware binary or it may be coming from SMC call along with dynamic
> resources.

[...]

> +	/*
> +	 * Qualcomm remote processor may rely on static and dynamic resources for
> +	 * it to be functional. For most of the Qualcomm SoCs, when run with Gunyah
> +	 * or older QHEE hypervisor, all the resources whether it is static or dynamic,
> +	 * is managed by present hypervisor. Dynamic resources if it is present for
> +	 * a remote processor will always be coming from secure world via SMC call
> +	 * while static resources may be present in remote processor firmware binary
> +	 * or it may be coming from SMC call along with dynamic resources.

How about:

"""
The resources consumed by Qualcomm remote processors fall into two categories:
static (such as the memory carveouts for the rproc firmware) and dynamic (like
shared memory pools).

Both are managed by a Qualcomm hypervisor (such as QHEE or Gunyah), if one is
present.

Otherwise, a resource table must be retrieved via an SCM call. That table will
list all dynamic resources (if any) and possibly the static ones.
The static resources may also come from a resource table embedded in the rproc
firmware instead.
"""

?

> +	 *
> +	 * Here, we call rproc_elf_load_rsc_table() to check firmware binary has resources
> +	 * or not and if it is not having then we pass NULL and zero as input resource
> +	 * table pointer and size respectively to the argument of qcom_scm_pas_get_rsc_table()
> +	 * and this is even true for Qualcomm remote processor who does follow remoteproc
> +	 * framework.
> +	 */
> +	ret = qcom_scm_pas_get_rsc_table(pas->pas_ctx, table, table_sz, &output_rt,
> +					 &output_rt_size);
> +	if (ret) {
> +		dev_err(pas->dev, "Error in getting resource table: %d\n", ret);
> +		return ret;
> +	}
> +
> +	kfree(rproc->cached_table);

Would this not simply discard the firmware binary table in the "split case"?

Konrad

> +	rproc->cached_table = output_rt;
> +	rproc->table_ptr = rproc->cached_table;
> +	rproc->table_sz = output_rt_size;
> +
> +	return ret;
> +}
> +
>  static unsigned long qcom_pas_panic(struct rproc *rproc)
>  {
>  	struct qcom_pas *pas = rproc->priv;
> @@ -425,7 +481,7 @@ static const struct rproc_ops qcom_pas_ops = {
>  	.start = qcom_pas_start,
>  	.stop = qcom_pas_stop,
>  	.da_to_va = qcom_pas_da_to_va,
> -	.parse_fw = qcom_register_dump_segments,
> +	.parse_fw = qcom_pas_parse_firmware,
>  	.load = qcom_pas_load,
>  	.panic = qcom_pas_panic,
>  };
> @@ -435,7 +491,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
>  	.start = qcom_pas_start,
>  	.stop = qcom_pas_stop,
>  	.da_to_va = qcom_pas_da_to_va,
> -	.parse_fw = qcom_register_dump_segments,
> +	.parse_fw = qcom_pas_parse_firmware,
>  	.load = qcom_pas_load,
>  	.panic = qcom_pas_panic,
>  	.coredump = qcom_pas_minidump,
> 
