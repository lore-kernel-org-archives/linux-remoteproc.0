Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0F240D561
	for <linux-remoteproc@vger.kernel.org>; Wed,  5 Aug 2026 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785923225; cv=none; b=n1QvW7LRCaowykWQdmDyoZj1BjUXK+fBlB4RyFJgQBkld6vxnS3QiYZMXpX4fcVUvZNcaiTAs5ZFFeo2Nw0hCl7iDqo8jZOJ2k3twNjU8GcB71OtzaZXYs8CTyUe84puwqfgJQizfHNOkLllMMAZMRBXpbVXRMYejl50G3evdBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785923225; c=relaxed/simple;
	bh=v+OR/g2WIKdKAOzCMyPBTLhd4+l4DtGt19dXcjU42yU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ETqhDOhv9kruqF0CuXom42bQeEqhksXi4M4PKooiqWVxZZUV21c/v8KGAzwsZyVdbE7wgpmvzXqmqlmpa8+jct1i9FJD7yxpvjob/wVxKo85jlXadc1u62AKM20TnyWOqFu2QRGlYatMQ/cc4JixHv9zeAlxoz63NHw17zCbYJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RtpODAzn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UbHIN57v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RtpODAzn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UbHIN57v"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6759Deo42442024
	for <linux-remoteproc@vger.kernel.org>; Wed, 5 Aug 2026 09:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sLfftjsgZ0ATS3LHc9M6pEfnyeZQZM/mhXGUirf5zlk=; b=RtpODAzn5Jml3utF
	P3vmIJMGVOU0I9i7Y6FUkm99/CfQ+KxQgL3xCJCnL5lNJp1FKVuL1jB//IS59kTP
	t3hJkJXgyX7cBBQsMHg+DyIvTGOiLiX3QnvIyF7RvD+MJ6BDJrUYRs++3cZCR0+g
	W113tAvq8nQ5pAopRFd5AL10qStsAKr5SCrQ3fQ/k/k16fLZEHhqHXopqU7A96vk
	DbwdaKG+8gg/khTOjlhxcf9wH67OV0j4EeEXkNa6hzRaA62vOxiWqsQU2ymLOqnO
	EaQ5hBsE7bnCEDR7fQu7lKx81DB/0t/F0xBPrPr9qRoxtE0iB/sPR/ezfnxHkp8j
	HNcbKg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv2c0852h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 05 Aug 2026 09:47:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so1270694a91.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Aug 2026 02:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785923220; x=1786528020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sLfftjsgZ0ATS3LHc9M6pEfnyeZQZM/mhXGUirf5zlk=;
        b=UbHIN57vNzrqEp6ZmvY3GXnj51oFDljaEcHMED2/gfemw+qCV6G1l8TM7ZsnqPbNMF
         F3XQ1xO0qG4ve5Extiu8VltKt6/jZx0NOhno0luyh8i6+zWL1o2+s1DzKPppp68zxDSZ
         oSSJxeVaiLfAwaVJIiMHWQZrqM7zkv2Foi48tqzITxlfBjIGajlv8Zpn8ToeKV0lebBA
         5iXUtEluGbed8oCUFRBDJisAT66FZ4zzMTotYbOJdKuyDVV3G1INKarRPfrhXjh/CeEJ
         7ljKJGyb7pTeX3oK8QeI++MKeGU3lJvq80QomgAyYOE0mUDo3S4peUmuKlfKw7B2kk7l
         mWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785923220; x=1786528020;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLfftjsgZ0ATS3LHc9M6pEfnyeZQZM/mhXGUirf5zlk=;
        b=jdQ7ilshFu9jrIpMnazd07HHCdMr9D0Kcq0FG1aQbrL4+xi5moIzgx7MOaVZkIKnG0
         Vc7j+U+85FZUvCSLxkai/zqz8iFtgxmZc3kkAo6sCULVYxgMRP4lv93xp623E35iBdKu
         2GAkpqROPRV5h/jwTczbl5Yi6G0zRRjKV3UuNcXLB9PRWX6JnFoBudwLOZyL/PmsbOVz
         lO4wUJYMTkWBxd298TRciSo4aeCM+TDocU4nGvqOmSprDwOEVYaFawFzONvVAov6TNVb
         hSUEjZn+M8vjyhqRzxa/8xW7AP3w+V62l2bFBFXbbTR0wk7paxAabUj5IK+tXJEfhYiz
         nZ5A==
X-Forwarded-Encrypted: i=1; AHgh+RpjmAbmcpBh0DOMDePrhgioT2QK4L8grfaUcxya2aqma5pXXbNnq86Ml/PDByfza6GaEuKb9pD9uHhldwiHnIvt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7EIrvDM/PYnZbH4Cn/5DHMOZYTVJHT1eKuVLoNAmp+KjK4MBW
	8lHjcezq4taOI1GsJHNr0e3Ug8asC4Jqu+afAciIkoclfvN+/Y/0wVyRprveYDHI8EbMawHsjM0
	RfVZ98RtPmy09emH0CV8/d41UPgxBW6tgqoayHNNrPdpK/PGU4Abh5YI02gQsFmMecnhCiKKf
X-Gm-Gg: AR+sD12ZyGjjFVCQyXFvvihsvBcJWuorTxvpfbY+xj7pEeJy4z4Hfj/lRluvdjZ0LvT
	4sRdwUGwjPgNMExG6mPYNBBjyR7lo6QR8FSo/W5TgWesmoECmgCSP2kzkpzFOBunDqBxMgquqdK
	wniTwPEhwklwCPMTr4wZaw609WEIg+cspeNU3K2xKVc901x7Wpt4H9PVPVXrwcvigT14ZVLEaeq
	MUyjsOaj6bFZLIJG+nuOB2AMs4ad8fCqvDlK4EDr4YsZjjAtd4ahFYXPOsYM4Dnlwt70TNYs7ut
	OeGdgCvzDMygTvy8dMV06h01TxS8BKOmPsaqDgTRYTW22w+5Y5C52O7F/AAGg9t7TVEOSkUrgjg
	jgh0wGRZ8UPcsx6D7j0OY46wQVeflg7xECA==
X-Received: by 2002:a17:90b:288b:b0:38e:8050:e63a with SMTP id 98e67ed59e1d1-3903c54d9a2mr5788367a91.6.1785923220030;
        Wed, 05 Aug 2026 02:47:00 -0700 (PDT)
X-Received: by 2002:a17:90b:288b:b0:38e:8050:e63a with SMTP id 98e67ed59e1d1-3903c54d9a2mr5788316a91.6.1785923219589;
        Wed, 05 Aug 2026 02:46:59 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39039141945sm2693692a91.3.2026.08.05.02.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 02:46:59 -0700 (PDT)
Message-ID: <2742d623-6d7e-440d-931c-fcf200cb60dc@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 15:16:53 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: remoteproc: qcom,shikra-pas: Allow
 bam-dmux subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260729-shikra-pas-bam-dmux-binding-v2-1-d85fea84c141@oss.qualcomm.com>
 <20260730-organic-chimpanzee-of-excellence-ebbcca@quoll>
 <c1f8b5bc-6d50-42bc-b671-7e91d76cb975@oss.qualcomm.com>
 <cbc62091-ace6-4e4b-8cae-fdf9b83b118d@kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <cbc62091-ace6-4e4b-8cae-fdf9b83b118d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xOo9Jd4tr1otcPoMlPAcC52-zRITwC2o
X-Authority-Analysis: v=2.4 cv=aOfAb79m c=1 sm=1 tr=0 ts=6a730695 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=hE9VN46VHmwWYIJWFdoA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA3NyBTYWx0ZWRfX8JEbJQtV5xXu
 18EeIigeRIIa0aqhznzrpFNm/z63BenyQemifA3OjTRxUnDAkebx0x/4pXW6bnLybAsY1XlO0wu
 YY2Ng4FyuG5+zt4czlQUBSIAY/h5vf8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA3NyBTYWx0ZWRfX3O34U9W+zwTi
 H/umPQc3tdxPbrexSzuzb3q2b5bpxAnLDLV8fyBfaY3IQsNDmGm567JqlGY0t7E2y3hT69s6LCo
 1H+oQmL9H9MHGllzIwyJEn7VbU98ngkzMwvnYJXxrxgHXGiO0D2S6LPEaf+FuT9eg5hGvMSZ0LJ
 U8BeC5shrdFPI8VT2mjRqDS5B0saB8e9bIrQLxWb1r0ZDGvn68HBXIxJavyBVzVBu7Xs0YHe3hJ
 QP0uhuh6ZD4DhVqTfxf0Ik/Lgi/Mj0KeNmVfguSKiDqCnRnb5KaStMjgiW5woBi7TeUR8oX+/cR
 0OLfeYfeivY7Gzx4/CYE8hWBEHeJT0+ejvL2thhcxfr9BDBQuUlmr0n4LJAr+hrMTvWaaTpExqU
 B9w+SHlx9g+2IGx48gZl1V/AOkfUly9YE4/o6rlBGMKb2Ba9/NHmPZmLl707S0UzJCGHxc2mU9/
 EUIgXQdZhq+meT8xyrQ==
X-Proofpoint-GUID: xOo9Jd4tr1otcPoMlPAcC52-zRITwC2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050077


On 04-08-2026 09:08 pm, Krzysztof Kozlowski wrote:
> On 04/08/2026 17:18, Vishnu Santhosh wrote:
>> On 30-07-2026 12:53 pm, Krzysztof Kozlowski wrote:
>>> On Wed, Jul 29, 2026 at 02:21:01PM +0530, Vishnu Santhosh wrote:
>>>> The BAM-DMUX node lives as a direct child of the modem PAS remoteproc
>>> No, it does not. Look:
>>>
>>>     $  git describe
>>>     next-20260729
>>>     $ git grep bam-dmux
>>>     No child node shown
>> The commit message overstated this. The dt changes are yet to be merged.
>> I'll correct it in v3.
>>
>>> Why isn't this part of Shikra remoteproc commit/patch? How any code
>>> could pass validation otherwise?
>> By the time the BAM-DMUX support was brought up and validated, the
>> remoteproc changes was already in a stable state. Therefore, the
> No, it was not in stable state if it was not merged.
>
>> bam-dmux change is being submitted separately.
> No, bindings should be complete.

Understood on both. I'll correct the commit message to describe this
as enabling the bam-dmux subnode in the binding, rather than
asserting the node already exists in a DT or that this fixes a
failure that doesn't exist today.

>
>>>> node, but qcom,shikra-pas.yaml has unevaluatedProperties: false and
>>>> does not list bam-dmux, so any DT adding this subnode fails schema
>>>> validation.
>>> Fails how? How can I reproduce the error?
>>>
>>> There is no bam-dma in this binding example.
>>>
>>>
>>> Best regards,
>>> Krzysztof
>> Did you mean bam-dmux (the property this patch adds)? If so, I'll add
>> an example with a bam-dmux subnode in v3.
> You claim something fails. Prove it.
>
>
> Best regards,
> Krzysztof

I will fix the commit message, removing the false claim, and will fold
the bam-dmux example node into the yaml in the next revision so
dt_binding_check can be used to verify this patch.


Thanks,
Vishnu

