Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FCE274FD3
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Dec 2025 05:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764739105; cv=none; b=mXUX82LiInoKY9T9dum/DAGPl3nMkYFUYj52NzZmWi3R+abHP0txcSkHDntFPKIkuR99PpQq1CF6osHVBRvLNB4BNohocGuyrnrC9KvQY0dKHO3YorSjdLBxK/mxq9O6+QXFcivyjmacdmFiNMLlIqMu4TGUnrfYw9ToWZQBphA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764739105; c=relaxed/simple;
	bh=62uw9xQPaBAhojob+3L4BHIADnVLvsg5vzaBGegjqxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jioUwe2AeFJLZtasBaphM4/U+vR1ifX1sFyFvYdrRgFSu19P5yIIzkAQ10iN7A7yormSMJcDTw88Nq3aC4Las2pTLPYOtj11ZBRXmeP0yidEh4+8VJG2zhKnFqlMtXndBnYLdR3iM+7qE3IaiW9V7h5fgYVW4PSDJSsw2NNTr8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmDV85Jm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHAZ77bp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmDV85Jm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HHAZ77bp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B34uws84130358
	for <linux-remoteproc@vger.kernel.org>; Wed, 3 Dec 2025 05:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MH+8YJ6UjfWQ0lWGbrnx86pqNABPbah03d60J0p42WY=; b=cmDV85JmKcriq2lH
	QNCTJlHTytWd5/hS/ujbAvVm3lKvOoQH0KaW6gfxKyT8//dSDvFtjaaTG15/7Qge
	HzIFMVa8wfTdQB9nOUolVGEBCXgw3p5+XTR1gqiPFMq+bHCsPw8Y4TaAJ2s6JS8U
	Id8lRuUVcUSpALMev1KOGo2PzoFPW/ZtubFA8+SEOWHoOj0FMLyw+drWIs+OC2RD
	F0lnWRB9YyA8dRcwT7mC3uoAvo6vKOOnKblbGUEgsszyfwgOuEbDcDwDBs9ff8FQ
	sJwuemR6qfMWwve7JfZjHcnd+PFuYADNaGHyxrFumpMnS8veRaqnIeokaaPWqGhz
	D7aU7w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at5e79mj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 03 Dec 2025 05:18:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29809acd049so111398485ad.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Dec 2025 21:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764739101; x=1765343901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MH+8YJ6UjfWQ0lWGbrnx86pqNABPbah03d60J0p42WY=;
        b=HHAZ77bpkD2VPQD/We0oPc5P95hUb9sKLFsvnBJnjlpLnfUvAgqZ0/BgONvT9YBCCN
         FMa1EG/67tb80+2kE3GBFIAfVxNPqLKmmAsGbtEy0gTVG4010lZuKJNGkI4vCIRpN0TI
         kczsCpX3e8Dk072oDmHqwsR9TCCGe7DQsQrzFvV7YwxEi8N+CansSlZDzKTyI0Ypr62i
         kk3DUEtDHq40jpP5/5FMA2RYO6nCA+TPCy8TJCqdkOfhE6eRQCAwxZzcjkidmiQAuoiJ
         EFIezV+My7lF5x0WIHHPgKo4y6wznXZydGigMtPdifDLOubWhapyivd9q/e9PKoU6OL9
         6ZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764739101; x=1765343901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MH+8YJ6UjfWQ0lWGbrnx86pqNABPbah03d60J0p42WY=;
        b=q/aIf+G2DPl2z4FUMudEhrs/ZF4jNsnzamx4Kxj2wQohF9z4Kc+m3iMKo6xB5I79Qf
         uT0JPYm9q69GYDJK/8KQsRTo6+ZW6TvMzeMo9OCAlpShAHhjnv1cHQFpMnNfwnWDh2ny
         mT4B0oDzS9+6jglDogv5lCr5pFDpIybg/qqAXA1EVToY8uswy/G/e/g5FtJmezpjSoy6
         CPxHddLhrlZshy92NRal3Xc5fmGs94PJq02zwuDd75Jm8Eejb4wPnTE1my3Q2yZMMXWd
         5PooUUskyGx68ZZhUOGA0B2Yja81jUkaexHEinx4C5BvwUjF8wgOytqRKMSPQOiy//w4
         NSqg==
X-Forwarded-Encrypted: i=1; AJvYcCWpb7mZP0ssVHXudX4BIvxV/hnavDRFFkQGe81SISVzQQH0P2sEKg5/xtAED6SEpIOkn35a0iyf1hInKa53KaWv@vger.kernel.org
X-Gm-Message-State: AOJu0YxJAWYyfDm0/62Kmn3F8GazEQRkn0zvMVTvvOUNxkRTutjiiMgq
	Bq3X9SXNitAy/VtcIB4ADinmj5WH89hK86nkCdjcEFKLA4XAN0VxZjuCDehQiFhvb7VVYxfvxkX
	F0r05QPVGoX99YUyKRhA07fg/AseXBi6j9vMsItvuyjADz7+xNNMFYThTAk1EialT8zPGrknIIj
	I01sFu
X-Gm-Gg: ASbGnctlnPtkgN91uEs+D0Kt/oCOO97mZHokFQQrYG737P18FGlFQYiA4azQjoOIw+M
	ryShGZ7cE+Q/RHts/OmH545HjQK/GAHKaBqGNNNDmEgItZN2u+nDDXy8KewScqODh3PTpVN9AB2
	OqhhwUFDo+PtqHbs8b4eFM5uKW1QUa2WkDFTLdq/BSPWD6Dl1wJisHQjM8UrjvmcIUJRvO5wIoI
	g0eeqbWadgb+MTxPhRzuv99T5m4N7e03Xwd13wxT1hVCoaUa1qWjWuwHC4/nVHkZbgU+EChjW8a
	u12X4jmmM+jPADLESCA9pPy0SOAZpX9t72xpEt240lmjhWBh11ba1FrD+n8fUH0S2yv60Qe+eg6
	6ixvzgkm1JXEDwOrz8JLB7JYy4yil4c2wtcS6ilt9ENp9
X-Received: by 2002:a17:903:384f:b0:269:8f0c:4d86 with SMTP id d9443c01a7336-29d683e1661mr14152195ad.53.1764739101467;
        Tue, 02 Dec 2025 21:18:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQdVExq1PEZYnRLG/KsslWcIb4lne6uC9XORnSf8c9nPEUYZW23KLRKhEqufaoglxWn20B7w==
X-Received: by 2002:a17:903:384f:b0:269:8f0c:4d86 with SMTP id d9443c01a7336-29d683e1661mr14151995ad.53.1764739100975;
        Tue, 02 Dec 2025 21:18:20 -0800 (PST)
Received: from [192.168.0.171] ([49.205.248.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce442744sm170246895ad.23.2025.12.02.21.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 21:18:20 -0800 (PST)
Message-ID: <64dbe824-a94c-4394-8cbe-ebdb7a3c42fd@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 10:48:14 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <0156c327-b867-481e-af24-679f037bfa56@linaro.org>
 <Ux4KioDAyhqgZYleT-eeeFKzuT_qadCIpP3RgyB40apZPX4I9_JwcfY9mebop4gmFcyh4LPw0KQvFzL4zzysJQ==@protonmail.internalid>
 <20251121113751.tnqw5abm5sd2rgr7@hu-mojha-hyd.qualcomm.com>
 <9dfe5343-824d-42c2-aab8-8389602601e9@kernel.org>
 <20251202083650.luk2jpcquq2pcf2r@hu-mojha-hyd.qualcomm.com>
 <623225c2-166a-49a1-9856-d02ed55f1e47@oss.qualcomm.com>
 <bds552pvggsf6jgfyghyigp2fb6zb6hucwqirwye5puctnrhdi@tqw4b2nc3mkg>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <bds552pvggsf6jgfyghyigp2fb6zb6hucwqirwye5puctnrhdi@tqw4b2nc3mkg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDAzOSBTYWx0ZWRfX1Zpmg6yL1eC+
 zQZZIb9vFlAuTcuAiB6xhULrIqJkGNCwp6A6KPT8trmrKDb6O65dJPi5acpnh8CFJXEHtBhdLty
 dtLrp67ZN5imK8dz5WiaS9ZMVgACBWu3Hy6NUpFn4rCMdzRmKKkrmNYtfZx0EC5R+o7lydkRZZC
 GB2cr99QWK+WIXqBTeZ7UheNNP80prP3MguZ5ECLbXQwIi+kNsR5yBzinCEgioUP+zWalVbfoGX
 mmSnfodcCRzjZxpZpMaJ5dLER6zEIrwah1Z8L1rPQCwpvGZ7laOOkhGjJQql0Y/mPeFsoSYiBAy
 6k93vJR7IJN8ZY3ySHtVLZzOWfOLU3J0aGUmZirEu1OQx8TrdkmW4EhCpsAui6yIKCIf/Ga0IF/
 FOS2azp1/hgq5kOrl9BVOYPGk7rGLA==
X-Authority-Analysis: v=2.4 cv=KcrfcAYD c=1 sm=1 tr=0 ts=692fc81e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=pLmqbgbNwPlZRhRGoa80dQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=7mi0SIUTFu-qshqJEZQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WD4n4F7eyWyme0mgsdiUEnsV3E6DGHPA
X-Proofpoint-ORIG-GUID: WD4n4F7eyWyme0mgsdiUEnsV3E6DGHPA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030039


On 12/3/2025 2:54 AM, Bjorn Andersson wrote:
> On Tue, Dec 02, 2025 at 03:43:17PM +0530, Vikash Garodia wrote:
>>
>> On 12/2/2025 2:06 PM, Mukesh Ojha wrote:
>>> On Thu, Nov 27, 2025 at 10:25:23AM +0000, Bryan O'Donoghue wrote:
>>>> On 21/11/2025 11:37, Mukesh Ojha wrote:
>>>>>> Sorry.
>>>>>>
>>>>>> Did we actually come up with a cogent reason to omit the video firmware
>>>>>> loading here ?
>>>>>>
>>>>>> AFAIU it is required for Lemans and Glymur - leaving it out is blocking
>>>>>> getting video stuff done and storing up trouble.
>>>>>>
>>>>>> What exactly is the blockage - is it something you want help with ?
>>>>> I replied to you here[1] and given my reason..till something concluded on
>>>>> "multi-cell IOMMU[2]", I can not add video and block what is working
>>>>> already.
>>>>>
>>>>> [1]
>>>>> https://lore.kernel.org/lkml/20251105081421.f6j7ks5bd4dfgr67@hu-mojha-
>>>>> hyd.qualcomm.com/
>>>>
>>>> Why though ?
>>>>
>>>> You are mixing together the issue of multiple SIDs and the original loading
>>>> of firmware which could easily reuse the venus method of
>>>>
>>>> &iris {
>>>> 	video-firmware {
>>>> 		iommus = <&apss_smmu hex>;
>>>> 	};
>>>> };
>>>
>>> I completely understand what you are saying, and it would be very easy
>>> for me to do that if it gets accepted. However, I doubt that the people
>>> who raised this concern would agree with the approach.
>>>
>>> I’m not sure if the video team would like to pursue pixel/non-pixel/firmware context
>>> banks separately. I’ll leave this to @Vikas to answer.
>>
>> Not exactly as a separate sub-node, but i do like the idea of introducing a
>> simple iommu property, something like this, which Stephan proposed earlier
>> in the discussion [1]
>>
>> firmware-iommus = <&apps_smmu ...>;
>>
>> I understand that we are doing the iommu-map thing, but a property
>> exclusively for firmware like above look much simpler to me.
>>
> 
> "We know we need to find a generic solution to this very problem, but
> while we work on that let's add this quick hack to the ABI"?

I would not call that as hack, rather a simpler solution instead of 
packing everything into the generic iommu-map.

"firmware-iommus" is much more readable to interpret something running 
in el2 mode, than digging into function ids inside iommu-map and then 
matching it up with specific SIDs to confirm.

>> Dmitry/ Bryan/ Krzysztof if you are good with this, we can bring back video
>> in this series. Please share your thoughts on this.
>>
> 
> Please let's keep these concerns separate, so that we don't hold this
> series up further. Even if we choose to go by the subnode approach, in
> the same time frame, it's better to discuss it separately.
> 

ACK.

> Regards,
> Bjorn
> 
>> Regards,
>> Vikash
>>
>> [1] https://lore.kernel.org/lkml/aKooCFoV3ZYwOMRx@linaro.org/
>>
>>>
>>> Also, I do not want the video PIL discussion to be part of this series, as it could
>>> unnecessarily give the impression that this series depends on it.
>>>
>>>>
>>>> That binding got dropped because it was unused in Iris.
>>>>
>>>> https://lore.kernel.org/lkml/05d40a3b-cc13-b704-cac7-0ecbeea0e59d@quicinc.com/
>>>>
>>>> I still fail to see why we are waiting for multi-cell IOMMU to land, when it
>>>> is expected to and what the VPU enablement story is upstream in the
>>>> meantime.
>>>>
>>>> Blocked it seems.
>>>
>>> No, it is ongoing, there will be next version coming.
>>>
>>>>
>>>> ---
>>>> bod
>>>
>>

