Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4DF3451AA
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771839378; cv=none; b=WNHx3qRctB6p6n+jaofizBVxEJjLiwYlB9rCZevGvGbpA43OT1H1T2rsmrRz0bBV7Vr7mK7EHIvAwff9wlEfLu4KdbWEOveV6OQJF8u/eOD2VYxcuVCh7SLtkpufUPEgd5SoOjKk1QLZbhM0Y6PqfMoGso3TKa4uaPRSpItkLBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771839378; c=relaxed/simple;
	bh=atAGju0p/Xxb5dMVewM+6bW3D/1du1ZkwKdyzISI90Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DfTyykdgbmxzriPEGeVnXIPnrQt1pQcKI3FgIKGSewFDD1/DmNgsTKUx09kQyEbKVcIc4pP+4uzZDwcXtsdIXZ3LkyHKYZkiqXeK+QhSJr6vd/ByGVpl6tFlhRrCnJgaO1iZtUBN+Hasx3sG1gjtbj+U6vXAYjK5u6/s3F0ikAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gz58tQmR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZSmwvoz6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gz58tQmR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZSmwvoz6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9Hrsv1430720
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 09:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SYGjE+XjICFU+//eucHg+2ZzKIQx8dcU/7z9xFG21vM=; b=Gz58tQmRE/iJoV8k
	J0/JttB64qlBpYibGzTX6Zn5lv/n92CMIVAqWDSrmeNiPudLmBZN75cDy8J63hLK
	4DbriMib5EMSLZJLTX4O/1w+RUaUZJ68L/+gA1xYOyAv4Tg9C+7cuaqOWXONE1dj
	d1FSCL+joohBZKHLtbC+GMbCo2XZv3MPl7NBDnItZB9GBGFB4FpG0zKgBW4jGvHN
	bZkSaUNboM+Jyw15QjRwbdIi5R0kzPy7D7BQwYyoboYcEWonC+ptc7Vvwg0jJwsm
	NS0SuxWkESi6z/2lIHAoPx8GtxgNmpSkRpCOH1woyhA+WvZro+4bxDWHETD3B8DS
	HFtj7Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5x7v75m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 09:36:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aad60525deso318844045ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 01:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771839375; x=1772444175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SYGjE+XjICFU+//eucHg+2ZzKIQx8dcU/7z9xFG21vM=;
        b=ZSmwvoz6mSV1PnfBL7Sc89Uib1tZQ5FOir35bPD4H4gWNvuGjZcjVcUolST+F8zxGb
         wOnwO3wviW107x9Rw2bi9iLUoM2B+JilXP7AQZ5yfJuTlxQiwNZ8+fgEJizoqr0qlqJ1
         PCZrhkZ3SjeeixI470EUREcGAPtfRq5AUk4gSkX6tGOWxruP8QbUju6FfRRvdrs/fgNF
         za4LvzSz8OQHrBs/NNUNI0UF65nTxQ8CPMpJuHOMKacgqGDfm3bTVGiGVsoXQLJPKmKw
         rm2v3wRFbKwEVUDlHqQ+SoYfSLGLOUXJaD7yrLIsJJC9wBf6/ppIW+553asY/R5iNFu5
         qsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771839375; x=1772444175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYGjE+XjICFU+//eucHg+2ZzKIQx8dcU/7z9xFG21vM=;
        b=A/dsDwnUWlDoJzSbrdsJ/ezfgG6cO1puoNDPQt3XhwFUOfrPdK3P6/C8vE3pZ5Foh5
         Ohb3usGfv7UJpGVYYxbfcKmBtxdkoNuccsIdjL2vaiRWsnByPT93KWLYZIdgLb/U3nsg
         B9k2JUfxSbk4AUk0E0VZ1YxiTt7ZcR2KlBJn7g/MsojJ9+XqcYNBU4IvrG5ShIcB9GF3
         G6YM+yWERXfrRp2axdTeEVUm5VnGSmBNjtv+sXZqseASpwpLqswqT3ppkxulMmPZycpQ
         28XTC1LGA3Wq1i5bmJKyn1neLMY1ioINO96L4TaB4Tg0yzsnKUhOCSrC6Eu3XJebyxOy
         Z4QQ==
X-Forwarded-Encrypted: i=1; AJvYcCULW8MrAP0VO7AeBSyaiW5yTxfwMTrO4GCbJITu/Kc6gtSSPVV0A+nYKKiWGXQ+sFRFJOTauctL9E4IlAMwgoH6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6lf6FxQCioUcuwkbmKqnI0MQ/d9qZfSHSogJ+Jz+ZjCfgd11n
	YunPHGeuwwOQuXHLnB2QOzPr+HYJ+fRn5fndxangeMsL/GZubdRO39GcSlrhGepwyaqRu2PQhdV
	+hopoojdn0yFXc/SoRmgdVSDZBNMIEh5Z3A3qf2CWzuDAdE1dzZDcbHeoB+bK14o4yTDim9DO
X-Gm-Gg: ATEYQzzQwxkgR80/vFZtUMLKVjK0kq3P5mTmVZFO4a0Xz029bHp4zgV1twJgoYoMAAq
	eI+SoUHeJjFiWmDYyKqUWoYu73oJqy4/IATgBLtLO9wxwjQaU9+7OtG82oERKsFAGR9AOtNMUpt
	34mHNVdpoe2Mt+XyfyyeL+YQKxJrionqiYzg4hY8dfUbZ7tbstqh2AC0HUxoSPWWP8RcZJT+N+4
	I1Wjh1YyqdGqeDYAJFfuJhWSjTbglwd/yF64xFlEGCjsE0cQr8+mgKma0RyZNrABcpG/L+oxxHR
	qha4kpcHG0NsoeyH9EJjlB8D0syB2unZfNTF3zsvElY6riLnc08CJxaRrRh3b3CiO/Vc0Z/zlQP
	rpLLCuhp/B+LHnma+iYws9H7rNb1fJ+0rM4yt7DbDyiN1XKiII89pIrbZSN150Pfw9SuMPSGmLq
	LV6GGV7WOcmdGrGHmNv39qEnSxe0u6JTkx/EWT6dQ=
X-Received: by 2002:a17:902:cece:b0:2aa:f0ec:3701 with SMTP id d9443c01a7336-2ad743e22cfmr80923475ad.2.1771839375152;
        Mon, 23 Feb 2026 01:36:15 -0800 (PST)
X-Received: by 2002:a17:902:cece:b0:2aa:f0ec:3701 with SMTP id d9443c01a7336-2ad743e22cfmr80923205ad.2.1771839374726;
        Mon, 23 Feb 2026 01:36:14 -0800 (PST)
Received: from [10.190.200.237] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503d406sm65521675ad.75.2026.02.23.01.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 01:36:14 -0800 (PST)
Message-ID: <ffecf0ae-f826-4690-8ec5-c19011f2c50b@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 15:06:09 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Glymur ADSP
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-2-sibi.sankar@oss.qualcomm.com>
 <20260205-succinct-honest-badger-52e1b7@quoll>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20260205-succinct-honest-badger-52e1b7@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfXw88g4e0Q3xYf
 OOfPzaxSAM3rc+AL7SgC/9B07DtttUA0lZKFDaiqc6etB19xX21QL5KuUfmL48I7aDbi3NMJl2a
 iQthlW8sRqkE13zrmArguTVmmoDoQ/XddYcdxmWSsaqLUG8PmLwqy/Tqsq79cYNaSnZVwjD4qQJ
 GHapAwCvm9XdMiX4yD5TIqipWoH8HwR5uyr4ycFJILFoZ295zkr/LXgAY56pHsSmA4pWf3W2lUM
 uSE9DOcCA3SYIynniwNorCkqyah4YFVHQvbyRh8G4SGc2eTSd0ciJOtDwL3FnDmH8OklgdPO2Zr
 Hvj4LefBP3A/LpdA+eKXTPPjv5Hrfqvm/KMrIQrPKfMxkCHxOSRzj9cRDKWOztjARDrBFf7HOrd
 +fO5VJfJlXT/NugOhmwpDL2z8kByCfmDozuLTeeiia2uZPJbHRr8lVT1AlJXPxy7GFolheSu/sy
 RpZhPzvBgo0J7vcofgA==
X-Proofpoint-GUID: bNd79n_lPQs0W3h2jy_hPK4egT10xIQa
X-Authority-Analysis: v=2.4 cv=X71f6WTe c=1 sm=1 tr=0 ts=699c1f90 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=njHKLakQ8Vn3IMBtrbEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: bNd79n_lPQs0W3h2jy_hPK4egT10xIQa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230084


On 2/5/2026 4:04 PM, Krzysztof Kozlowski wrote:
> On Thu, Jan 29, 2026 at 05:43:54AM +0530, Sibi Sankar wrote:
>> Document compatible for Qualcomm Glymur ADSP PAS which is fully
>> compatible with Qualcomm Kaanapali ADSP PAS.
>>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>
>> Changes in v3:
>> - A few variants of the SoC are expected to run Linux at EL1 hence the
>>    iommus properties are left optional.
>> - Link to v2: https://lore.kernel.org/all/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com/
>>
>>   .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> index b117c82b057b..fb6e0b4f54e8 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> @@ -29,6 +29,7 @@ properties:
>>             - qcom,x1e80100-cdsp-pas
>>         - items:
>>             - enum:
>> +              - qcom,glymur-adsp-pas
>>                 - qcom,kaanapali-adsp-pas
> There is no such hunk... I think this continues my comments from Sep/Oct
> 2025 that creating such patches, with multiple dependencies makes more
> difficult to review.
Hey Krzysztof, Thanks for taking time to review the series :) I'll give 
some more context here to ensure that your comments were followed and 
this is just a one-off. This patch was held off from the dependent 
Kaanapali patches since it wasn't clear at that time if this SoC would 
be running at EL1. Only with that confirmation and given that dependent 
patch was on the list for a couple of weeks with Rbs, this series got 
posted out. -Sibi
> I mark it as not applicable, please send when your dependencies hit the
> tree so I can review it in proper context.
>
> Best regards,
> Krzysztof
>
