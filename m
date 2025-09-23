Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AD9320CAE
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Sep 2025 09:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758621149; cv=none; b=rHmotxsCxNfPiLPSsQS376gYQVepOwHF66S+wVvwRL7NJLHFGzDgQTo+5wzFjOW/SM9DZ2PH0TppFs4hDdkvSEX+Lqlt38LEp97dBKmFaRsPto2NLNd60/asCgU3YiR+bYSQNYFcWRNRM1KLIU01+pWh7ZBDnlaNVgCT/IuQlHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758621149; c=relaxed/simple;
	bh=8Y73+bRj+HMBGZXn1NTOY5Q8D/DFV73lTcEAvuOEtZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYQv2zYmyy3NpjaA500J8SGgMWmwl6/jf+9Ld3ZOsLu6Ymt9bVeuNDOEqFcq1fZTDVcf/uYxFrqwVcUIqw0kPN7zsT4w7jxiWoOupTvIrMXZZEJppo2dFaro+MN9r+PMmtyNXtw5mB0ysnU6F2ytIaG3pQdxtMb4tW3CF1UEJ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fVl7NUrb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fVl7NUrb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8HNk1021317
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Sep 2025 09:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CegpNU3wlAiMj7j/j0CePi4xwfyVk7zXAv3zhvKqTRs=; b=fVl7NUrbE3JXkms6
	Bzkh6wugOyUoigNqqv0syV61yThZECW1Z2EaA1fHeLQuiEl9CqvO8u5IIcMmMgFU
	ZVjhv7WLf81S43eOvrAXwb/QzK4nnthbM+OWpM2MoCjLO/j4AKthjd9kX6ls3YXM
	MTmaqY1qhamdGnkvpRoVfvs7TQz8f9tzRyxV9UlXjgao0LRk7PLuv/jmnLakxUNt
	oj/66A1z2UpRW9P000f6UniX30My3CaYJsQjmF3Um11O8NxjWq9ni0D/mk+vBToD
	717a7Cw0SyX+S7W6o9zPKtO8iCLzHU+wBRJHC5P5ZMZL/xecCVYDboqloDFrCOdJ
	0RDNAw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjsc5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Sep 2025 09:52:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-252afdfafe1so55700735ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Sep 2025 02:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758621145; x=1759225945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CegpNU3wlAiMj7j/j0CePi4xwfyVk7zXAv3zhvKqTRs=;
        b=C9JFVsnl43km7r4WMtLAoprUCLKUqDM6A2ifkhPFlorjGOc/BvzaZ8iHaWB2dtIB9B
         nXW9sK2pQ+EnDv+toXVjsWtRLd/sbNFKpLCl2mEqdcy5u+IFzzC2f4bv7J0TGBEIPb/w
         2veuc9mrhUaPImtDeL7/BG4oOCbhpknZhKYket0Q5vmZE9kZ92ssnvKZwvNG+xrRNZ6/
         pCTyAC05iPibN3Rt75Z35cQ/GhgbWRuiE4k16f//rySqnFEHoaTj8D3TbhhaVZQlhfYS
         2Ds0GQnmaTvcBh9282GVW9skr88mGyxYCLZ94wkBck3P6t7uD3APMFnCpejEGK8iFsSk
         w02g==
X-Gm-Message-State: AOJu0Yxu+eUhpBHUwoGCPP2L4UpeM0wm8mQkPMHsToZxgikzV1mv54A7
	TKVRShSo5M4DtmE87JAmOdPr5U/3Y7oB6Z+Ks/A+Kq1JvFNPLTrKYbQPLnoJc30M3Wj1Ups+9J3
	SCaxZx+SGUFjjFO6vUBgMJm5kMTbOnp7/VGXvZ4IEg7LznmKhQltMntAkXQ28QAjXlmVsFqYzYf
	PMe8rF0/Q=
X-Gm-Gg: ASbGnct2ZkPctWGkXKNWQ7gbLgkG6y1bRXncKXFnzhqcBs0JJvpMX6NI+8/oIWgYYix
	MAKm46rOag8xID/MwIO6hPbn+k9Z06UYcGPWIMRjwNB260WuA6Vhw2qwXxCK9G8qFIRUrhDimgb
	CA7vPPMOEMP1aC5qXfApHIiYTb1KCk+nN9QAtW5Vdp+8sNQ7OzENitVvBy3dVZNERK2etECh933
	gjD9uZvKJA99sJ9TPWxdnVFGkMPvTVZwodc0UEQ8nS9CRbmiffrKeJFAzy4DoCxXuaBHxEYTu23
	BEOmrgOco5fkUyoSMusaShqhXAjV6uFj7Q8lS7DDuxxH9KptI0dk4RGQIZifHLhc7sV/D6NogcT
	rpMtx2QOsUBYmNuAmhRnEGy9URIzWAoI=
X-Received: by 2002:a17:903:41cb:b0:27c:56af:88ea with SMTP id d9443c01a7336-27cc817c4b7mr23923755ad.60.1758621145228;
        Tue, 23 Sep 2025 02:52:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGP5zMBkrF08Ao4U6Os7ZL705YRef6kuCngGJ5bzt+iMXV5WUnMZRGIdXtBk5rCzApJtyTFig==
X-Received: by 2002:a17:903:41cb:b0:27c:56af:88ea with SMTP id d9443c01a7336-27cc817c4b7mr23923575ad.60.1758621144732;
        Tue, 23 Sep 2025 02:52:24 -0700 (PDT)
Received: from [10.133.33.135] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802deb3dsm157677485ad.93.2025.09.23.02.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 02:52:24 -0700 (PDT)
Message-ID: <a8ea8358-29f8-406d-8854-e5adf67a4131@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 17:52:21 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: Fix potential null pointer dereference in
 pru_rproc_set_ctable()
To: Zhen Ni <zhen.ni@easystack.cn>, andersson@kernel.org,
        mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org, stable@vger.kernel.org
References: <20250923083848.1147347-1-zhen.ni@easystack.cn>
 <f6df1f13-518c-418c-b631-cc9452ea4842@oss.qualcomm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <f6df1f13-518c-418c-b631-cc9452ea4842@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hj5SeV65R4d4WfenZnSjEXqtBCUc5jNU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX+fJ4wvjS0L65
 4b+U9WpGDEYohr7vv+jl6b26Ei/hxafcNZEz1Jsa1bd5WuzL5tBIOFyfNwiFF6dROsPGS1FulUC
 3n/2M3HsIcPyPFodpgeGUq5viLwcO4kzMs1EfYOtYkZ3cEzIDCymvILR7QsixU6cqoVmCqAeXSU
 10nTGo65r21qy0EIOynnfjuE/8nn3r226lmIyHOtrlE1WUFVlnkfkci7urjzoG+1XI45VF0jAap
 3Ed1gkkG16jeY4TCITdl8G08/Ujbl0aTImTg5vo2Qm7XbMHAedBi9LFiP9GuwaOouzXKClzI/BA
 sD6cJ83RgpKiZbYxWMOKO6cPFwtDQYJc0dbtsQHNEbz31MmgveH3EFtTzQMhudYdIQ61Q6wZauO
 pTUeUft1
X-Proofpoint-GUID: hj5SeV65R4d4WfenZnSjEXqtBCUc5jNU
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d26dda cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=4y7FVnu2TWKiiZhurccA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

On 9/23/2025 5:40 PM, Zhongqiu Han wrote:
> On 9/23/2025 4:38 PM, Zhen Ni wrote:
>> pru_rproc_set_ctable() accessed rproc->priv before the IS_ERR_OR_NULL
>> check, which could lead to a null pointer dereference. Move the pru
>> assignment, ensuring we never dereference a NULL rproc pointer.
>>
>> Fixes: 102853400321 ("remoteproc: pru: Add pru_rproc_set_ctable() 
>> function")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
> 
> 
> LGTM. Minor style suggestion: consider changing "null" to "NULL" in the
> subject/commit message for consistency with kernel coding style and
> terminology.
> 

Also, for consistency with subsystem tagging conventions, please
consider updating the subject line to:

remoteproc: pru: Fix potential NULL pointer dereference in
pru_rproc_set_ctable()

This makes it clearer that the change is specific to the PRU driver
under remoteproc.


> 
> FWIW. Please feel free to comment or override if needed.
> 
> Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> 
> 
>> ---
>>   drivers/remoteproc/pru_rproc.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/ 
>> pru_rproc.c
>> index 842e4b6cc5f9..5e3eb7b86a0e 100644
>> --- a/drivers/remoteproc/pru_rproc.c
>> +++ b/drivers/remoteproc/pru_rproc.c
>> @@ -340,7 +340,7 @@ EXPORT_SYMBOL_GPL(pru_rproc_put);
>>    */
>>   int pru_rproc_set_ctable(struct rproc *rproc, enum pru_ctable_idx c, 
>> u32 addr)
>>   {
>> -    struct pru_rproc *pru = rproc->priv;
>> +    struct pru_rproc *pru;
>>       unsigned int reg;
>>       u32 mask, set;
>>       u16 idx;
>> @@ -352,6 +352,7 @@ int pru_rproc_set_ctable(struct rproc *rproc, enum 
>> pru_ctable_idx c, u32 addr)
>>       if (!rproc->dev.parent || !is_pru_rproc(rproc->dev.parent))
>>           return -ENODEV;
>> +    pru = rproc->priv;
>>       /* pointer is 16 bit and index is 8-bit so mask out the rest */
>>       idx_mask = (c >= PRU_C28) ? 0xFFFF : 0xFF;
> 


-- 
Thx and BRs,
Zhongqiu Han
