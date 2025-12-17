Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430F535E521
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 13:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976995; cv=none; b=FnoWxdiiEQOBJQ45cz1WA3XalWEnGHmuJrqlkwA6s4+Fth5U7qzW3MZImO2FBo48dNnGQkJ0MN7K6kNMpReeVJw9laQaLP0jLkS0YU9UkBUM/ZbZjoH0YQ6gqY25c9FDJH4NkE6raAYEnTXH6OgukAJyowKSLnfd6FsWhVaQETw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976995; c=relaxed/simple;
	bh=k//VXwjKpLf4ePq4urW6+vTHmlvuTAt7wiEtxM65XeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DSO2psCv3MQDy82fwEszxVZ7lQIYJDk62n/1lZvuPn4JEP+BzV3wQw0L1AjlEwVHtLWRXG4GOvM34js0fNXRmxoYW5tqNA/p6KtjBW+a27afO8JWR7dDE5Sl3QiTn2Tktlu16F3Faq+D9nGVYuJaS11bdOfKC7F3+EEyYHLqH6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fFVSTUtx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JupX8u29; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fFVSTUtx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JupX8u29"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL0Om330813
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 13:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nY+m1HxvRLCAvE+BIW+be1ykVerj/S4gZuW5Um71+iQ=; b=fFVSTUtxIORa/1x0
	Vl9aw/R0wZzUrGqX+H2hhUs6/ZN1Siz/FFGT0GQxnCG+EqWOibdq24WdhzvVyr2w
	nTfafcOuEbTxVa9yWSGI7A8akL68gGx0YS1XQurCYjKiuVx0zmPgOH54X4x8NQAL
	srQWPG/cOioCyGoQADDA8gTg/FOAjp6Cemkmhoeh+JsIBK9vMU08Rkeopw8QLYZp
	H+OtgQBGevHfuoEbM+l0HZtJrOO/F4buS8Bo6AXM3kY7eg8DPA1wGp2ioNO690ss
	9k2YxEksHwMGrYEcg3wumqtO3sPvQ1uJ2mmnadgGWznVqDX5oJDZRr+olHJwdGDM
	JYMxqQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e0hnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 13:09:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso13103371cf.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 05:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765976991; x=1766581791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nY+m1HxvRLCAvE+BIW+be1ykVerj/S4gZuW5Um71+iQ=;
        b=JupX8u29sHCh5B3C7DXdt93lRWtZ8AnRSefhLnwmP+N/Koc1RHYufKkto3kvTIF7zG
         TsbXImyA6Bw/qiFTwngu0KOC1j/mfZsmY6TocylLpRpxsPoxuOhSkb/hUyMA+q2nPo5O
         EAeVBGP5kr0joHm3Qug2Whe0+vuj0iw8mzwgREDiYQY0bV9vBCh0pDRJ3BzExSN9Yq5P
         jmZS+QBLX2WVXKs1NI7hg7Rnwaz9PKWUugckKH9Q/k8/IGD6066FPIHEVV7M1wi9pXRV
         e9S//0CORWJbzDSeBkp2+giYmSrUV8RRewEf32ltInM13WUFqkWa7R99ew6c8vBZQorO
         hbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765976991; x=1766581791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nY+m1HxvRLCAvE+BIW+be1ykVerj/S4gZuW5Um71+iQ=;
        b=Ui1u0j2X0QRTX/GV5EEgQhhYAlxnb9RSluX6NykcVMh+9cJZNccRlDcccOlhtwwIVg
         oV++L0CGAk3dboVrRkth1pSLRzVphYoFLKL92F87BTo3Bcc2rAbhk9HuU6+5rAJOPDxy
         T6MfU73AEAVUl7/GHkUmniQgzALLB+e1tR/jplF2ATQoZ98dMnaLgAxz71L1/kfT5Zja
         eThDpKWLAK2eqrbDzeVyvQ7tkrtbAbL9dNzvM2FT6DKS0FMOF9aZ5ELGWT4UWne6SC6u
         HtJ9yIw2fWKeOZHpdX1yN8cYpzN0gbk5RGfXOc6ejwIm2LGA8VYMNYtP8mQSyZpwMDu4
         Avzw==
X-Forwarded-Encrypted: i=1; AJvYcCUrh6SADJgMxRyO0TzeY9Cq4my+ueDHMbsJM1oHECZkYGQtXusknq4YrhZi133f7QtD+zKspdwmnF8N85EMxc7s@vger.kernel.org
X-Gm-Message-State: AOJu0YywB6pAh757sQDxkhvU1ZFS75flSr6SapPBklTm7+19bG7vetT4
	nAUsL/0FrbKC29Wh6a+TZkHLrNsDXUh59x4uqf10kKit65UINSCd96FgnvkYpjwRmTWf7RAig4j
	B/qdi9EOGCbeF+scpF/YzHXQPuJhBqWBjPC9K6NYVywuAiNlR3qHlvETARiWLEGRkdirNzzh3
X-Gm-Gg: AY/fxX4tnUMayxXTRBgl/esD7PGPQXEOA9pfvlIGYVDT1Tz6JofySQM4lSTJCIXExP2
	kHyxqc1bKeLz4m2GIRTg972WbM0wdsBSD1BIUzPcNV5zxOqXILEEVWYdN2o9q3PiqePN3T245iG
	Gx4TCnC3yM3sl/W2pIHgvb9u5xa5ZSB6dLL4BYXMX8/Rn6wfc9yNwfmQOQgplEUgq4oZ+xipW5d
	70rbyLIsLXm285c21v9E4id/n+QxIbY5H1KlxtwpkjeZJB4YiCEiqdY3bRQxiZAXlYrE0gqmkdr
	BoTSFURCB4SEpC+PSaBu6VVh6uNgaU+lqfigJs7qgnwF1k1BHe2uDBADt19AIpUmlu5azfdmWjH
	O/J7xcPkUE0d2wFIyAK/lJaGGzXEq7QmBIEAu4ZJq2I+3nNjV3mEUx6L9nhZp5a+ibA==
X-Received: by 2002:ac8:588c:0:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4f1d04ec585mr193474341cf.4.1765976990877;
        Wed, 17 Dec 2025 05:09:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFOIgftumFt2rPagd7WMAwupyG927hYvjfHGYbMJ2mFWjjolrhO9f+WryJIAq0yWn9bWnTKg==
X-Received: by 2002:ac8:588c:0:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4f1d04ec585mr193473791cf.4.1765976990115;
        Wed, 17 Dec 2025 05:09:50 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29eb69sm2014690266b.6.2025.12.17.05.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 05:09:49 -0800 (PST)
Message-ID: <0560bae7-f825-4bd4-bb9a-b7d145b0e621@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:09:46 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-11-8e8e9fb0eca0@oss.qualcomm.com>
 <86f3cb9f-e42d-40f9-9103-1a4953c66c71@oss.qualcomm.com>
 <20251124152538.wt3kzztqmpr76hsx@hu-mojha-hyd.qualcomm.com>
 <4376b7cf-7088-412b-8596-bdec5bdc273d@oss.qualcomm.com>
 <20251204122806.s7lnqffgcrd7usem@hu-mojha-hyd.qualcomm.com>
 <e78feaff-0b48-42b6-a824-0f102a6ac9cc@oss.qualcomm.com>
 <sysdgcspvxhytyudknnyj4hu6lc47we5ijkrsssi6askysqyo2@bdzl5cvzc4be>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <sysdgcspvxhytyudknnyj4hu6lc47we5ijkrsssi6askysqyo2@bdzl5cvzc4be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwMSBTYWx0ZWRfXziNz+q7mc4gR
 MSvzIxYzJdA8bzLz2LodFgAbTrvoWgyneRz8TcTLW3taAeX5GIFo53/Cp0MW/xRyd++u/jkh7lx
 8l99Z0kuSHKeRJ73sWaBlkJ+5sqOi4L031dUmBvWZygNFvm+MHpOnX+dBToK244ztiXwwlzdHZk
 agJ+8b7+Peqcg6zTL558isQGIy5hss8E2UVh11FHG5sRNkU3k8vUyvcQ1R/+wkySHF8b+A6i615
 nB0oyEev3JALPBWL2oS3oDUJ6Yqa3wfp3dUX+Ikex3+1nrr0UMh+zFVlKxJ+leja9NNsJOlHFnB
 JogfMqLsFoIH2P9ImrnTNWjYfB4QBdnzqpWgogVPXbwPprkqj18NdybgpzOnOTnJqluxbxdShC9
 d4prri/Y1oJ0+OqSd4RmgZiw2+3nvQ==
X-Proofpoint-GUID: K7i_C6ErnSznTjL5bpDc1GPT7vxr53Yc
X-Proofpoint-ORIG-GUID: K7i_C6ErnSznTjL5bpDc1GPT7vxr53Yc
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=6942ab9f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6YH-TVDjK5cHQ1zWBw4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170101

On 12/5/25 11:17 PM, Bjorn Andersson wrote:
> On Fri, Dec 05, 2025 at 02:15:00PM +0100, Konrad Dybcio wrote:
>> On 12/4/25 1:28 PM, Mukesh Ojha wrote:
>>> On Wed, Dec 03, 2025 at 01:36:32PM +0100, Konrad Dybcio wrote:
>>>> On 11/24/25 4:25 PM, Mukesh Ojha wrote:
>>>>> On Mon, Nov 24, 2025 at 12:48:31PM +0100, Konrad Dybcio wrote:
>>>>>> On 11/21/25 12:01 PM, Mukesh Ojha wrote:
>>>>>>> Qualcomm remote processor may rely on Static and Dynamic resources for
>>>>>>> it to be functional. Static resources are fixed like for example,
>>>>>>> memory-mapped addresses required by the subsystem and dynamic
>>>>>>> resources, such as shared memory in DDR etc., are determined at
>>>>>>> runtime during the boot process.
>>>>>>>
>>>>>>> For most of the Qualcomm SoCs, when run with Gunyah or older QHEE
>>>>>>> hypervisor, all the resources whether it is static or dynamic, is
>>>>>>> managed by the hypervisor. Dynamic resources if it is present for a
>>>>>>> remote processor will always be coming from secure world via SMC call
>>>>>>> while static resources may be present in remote processor firmware
>>>>>>> binary or it may be coming qcom_scm_pas_get_rsc_table() SMC call along
>>>>>>> with dynamic resources.
>>
>> [...]
>>
>>> Just to avoid iteration, are you suggesting that we can keep this
>>> guesswork as part of __qcom_scm_pas_get_rsc_table() and start with
>>> something smaller than SZ_16K?
>>>
>>> I kind of agree with the first part, but SZ_16K was the recommended size
>>> from the firmware for Lemans to start with, in order to pass the SMC
>>> successfully on the first try. However, the same size was failing for
>>> Glymur, and it required a second attempt with the correct size.
>>
>> It depends on the payload, which you're probably much more familiar with.
>> If 95% of them will be closer to e.g. 1K in size, it perhaps makes sense
>> to use up the additional few dozen cycles on our amazingly fast CPUs and
>> retry as necessary, instead of blindly reserving a whole bunch of memory.
>>
> 
> Those "few dozen cycles", is tasked with sending messages to RPMh for
> voting and unvoting the buses, then tzmem will hopefully hit the
> genpool, twice, and then radix updates, and then more genpool updated
> and more radix tree work. And then of course there's the one context
> switch to secure world.
> 
> If we don't have space in the genpool, we're going to grow
> dma_alloc_coherent, extend the genpool, call secure world to register
> the new tzmem. And then for all those cases where the allocation wasn't
> enough, the retry (with updated size) will not fit in the
> PAGE_ALIGN(size) genpool that was created, so we'll do this twice.
> 
> Fortunately the tzmem growing should only happen on first remoteproc
> boot, but I think it's a bit optimistic to say "a few dozen"...
> 
> 
> The drawback with making it 16KB is that we're not going to test that
> error path very often. But the more idiomatic form of first calling with
> a size of 0, then allocate and pass the proper size, seems a bit
> wasteful to me as well - in particular if we do it anew each subsystem
> boot.
> 
> PS. 16KB is 0.03% of the ADSP carveout (or 3% of the ADSP DeviceTree
> carveout...).

Hm, perhaps 16 is not a bad choice then

Konrad
