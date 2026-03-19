Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD0E35AC05
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 04:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773895070; cv=none; b=OKx06rKAVfCNvViUDNcWQH4em94zX6FkD6T7ASzaLTEQ3uTnVP1A/aFc8LASnjffqQk5ZPMIONzV7WSeE/HS7VN9pwGJRXmpvTNfPspvd2IrbNhtTaywCt1YaOW+KAv8ZOKrrzeA/eQxncLvy8Rw0GAP97epWtG1OE8gYi6A+88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773895070; c=relaxed/simple;
	bh=cmMSZeDXqRan3ei9vzz6JIOlqcGgmceZeu86SUGwXMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HoCbn7JpOhQSx6FK9ROUxNaaGJS0mpnKzys/xp4VKIpfhKFmyXculisF8rQPTn+XZsbnTI5tOBZOgye3RzGfYSoSTZD8ijim9DvxGDO+ZFaoEnEsSDdBhElWoAk+dpLp/6dscsQWrgtDvBebxgMdMTgol0aiAbuykYY8YZBuFeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lclRnoxX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxr7WSla; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lclRnoxX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxr7WSla"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J34Ykr1622555
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 04:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NQjq1Ng9PQOrFTaY6ozNnjl/amsYw4NBu3i1KeR0fF4=; b=lclRnoxXVTOj6Tkr
	2FCrK3KP7gwihK3aZfuvqHKc6l1cx8zQuSkj+CuI98dUg+3MgC340O0yN9lqVDUn
	/ofhgPZkhSF//GgEiMFsjKMPw9F+sj3iHS1gmA8mwxFVu+hQuIgXGtG1X0qFLQI8
	ioxi6xjmoyg3+sIWIF0a/umrHO01mBK1zLVy9hFY5NdNfwCJ2R3Yy0mx32M+vmd6
	15CTj1oVNT9qgoGDo95I7ck3ej5iWGINg3q4tIlQ5moRo+ZmYoK+wsoxBeYonULy
	aH2cQs9JIoZbqv2rTEbRcZQT0hpIalHd1rUBLEp1y9oXLNuQbp8fab/qcFhdfjzT
	z9QUkg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00f9hr74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 04:37:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adef9d486bso8920855ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 21:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773895067; x=1774499867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NQjq1Ng9PQOrFTaY6ozNnjl/amsYw4NBu3i1KeR0fF4=;
        b=bxr7WSla8rYsIeYLrXTflXAeeip4XnmGZNyUkPmt7aS+fM44Gf6FdM8mEsen7fLb4D
         9T6IuvUTgLhsYsuT4nFSPDkjQXdIXpoZoDTDLFcmd0BHMIL1ujEw2gmSv6i45iVM8f4Y
         3Q+YRpwf9AsoyucXzhYcY24tGSNY8DjKJ/imyp4ls2lRYF8UnuNmRl0UGH3A84hnsUkB
         4U3TqQeXXTGNx01TaMm7zlniGToYXVu6ItkSg3JDTfEAplusH6cw623jOtYGn/sVp5+J
         LsU1Vb8E8rLGZfQoJ85FhpgvqWC8T5OuSo1Ng00XERDxWCg2uXJiDLIWtzcsHYLFSRL0
         P5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773895067; x=1774499867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQjq1Ng9PQOrFTaY6ozNnjl/amsYw4NBu3i1KeR0fF4=;
        b=gWsEfUli/JnKVWzvROMNdDuz2c6ko8ocfa+qvd0U1sJSRke1RKJIbjb7FJg2vu7JOX
         7CSVsFHocuDadneEeRo8AEAeJ9FWJoWfCR5AFnrLr/rof6BQWlCpxmEa76QLo/gT3ypx
         CKqLhP5tXzC+Z4shbGYFeR719Ut3eaVtdzcDha7jCRGAPDGg67U+prfjqO0TGCEvbN4A
         /KotBO1jP+f4GwDxEX/YU7uQNQN4uwYTTe96yJOrcHVr100oCRWDQRyUIPT66sVm5aQ2
         2uhCOVTgmg9Cm/oFSPVGQrO3G3zuYSZ/GQ6rF/eiUw2pfqt7fsaW8Zt/HTNjHPCIBzw0
         d9eA==
X-Forwarded-Encrypted: i=1; AJvYcCXh0jLJ0yGZDRw9hV3NW+ml5ikYfFFhrh+Z1x8gyqtX7r3QKzhjrmYAEGroZEk2s9d+Zh2s7t5yhVexUGRjG1Fh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh/JEyWk/A/rrmxyZiGuxikFstCVHLC7cyturql40JUwvMZ3kC
	y8nWt/9+78rcYB+WX7ixw4xC/weJAMKObTdk3eM7pseQ6qiCtovilaTbldwavgxDrgfOgRoVJTc
	F3QfJy75OO5lg5skxgL2nu0bJNiqAJCEOcVt6Q+8fTwnQ3MSpNfVuYjMZtrXJu7k7e6mQ+3F4
X-Gm-Gg: ATEYQzyPnSedY3ayJH+yYr2QMaw7VDK7veRjzwJWEkWPPoNT9Yi9sAPtmTUcjcDvoYT
	lyJn7aB2tV3B4CqyM6lb/mkyaOnRsid7cHy6EdaAy5lYQrl7tTLydzo97hDgYe4JwjgiZPP6u59
	YTFio1Bw0MtJM2nHGPBpm/rQtELwfHrlP0TcAqk4WQ+bkN7uQNNRPCIb0ZB9d5V/r76j0sDae6Z
	9Q68LxeExwIX/kf3/3ZCGnaWju8al6kfljF+DvlHEUl2e1z0PYzGx121Tqv9Scq96l9MXIqKr8M
	3xLV33dNpUyMnXi7dtCTUuhf8GAIhXsaRIqzbYiivFgQjNsTXl54E3bY3aMYEYfzNr2XKXthWZS
	zGjoGXXrtun6/qSAe9qMYXOaGZfUg7I1FzHrD3Rjiz7DtlhlK6L3Mkw5wjMe983UXJhEpwn+d4u
	jjlGv5dOOUMZ1aGGAn
X-Received: by 2002:a17:903:18b:b0:2b0:606b:6fd3 with SMTP id d9443c01a7336-2b06e323679mr61201225ad.5.1773895066809;
        Wed, 18 Mar 2026 21:37:46 -0700 (PDT)
X-Received: by 2002:a17:903:18b:b0:2b0:606b:6fd3 with SMTP id d9443c01a7336-2b06e323679mr61200995ad.5.1773895066311;
        Wed, 18 Mar 2026 21:37:46 -0700 (PDT)
Received: from [10.133.33.168] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e627132sm45911235ad.74.2026.03.18.21.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 21:37:45 -0700 (PDT)
Message-ID: <e7d29f1e-a5de-4e5c-a94b-2248a83c5451@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:37:41 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] dt-bindings: remoteproc: qcom: move interrupts and
 interrupt-names list out of pas-common
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-2-0a91575e0e7e@oss.qualcomm.com>
 <i57ns2ythkhvizdceqks3zaojo73rrdbscjdat2fgeajwkuvyd@rqmvt5b4enyl>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <i57ns2ythkhvizdceqks3zaojo73rrdbscjdat2fgeajwkuvyd@rqmvt5b4enyl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAzMyBTYWx0ZWRfXz1iuYvZWeBpY
 Felib8EgDQUvSPVhaA1L6jW+3kzHrfpsMg4uCpWUNrSM/f5fG/o0TIt0TCUfCMOYlIzxnNPvEoc
 nF4MUg/CrnkeLvMRjh21piSTxv0yC6CNK621asyZuJmUrf9mraTxy+aQfsPQ0QtMrvYc95pC8jU
 Wxa/OKT017B+rY63KlqlbyVaKnI4NU6CgmqsenjCiv2x6mOCFsHeEmBAArj3o2c/dp76ftinzdh
 e4gYlHhp8bMsCM/Q5QT8JAUilQjH0ytPT/Bz3JDkmM2lluT03z/y1uZbFyqF+N8H3aez6w5Bcz+
 1QSN4IeEfIcTKCtQ1tT61vtTgZP/fz4OFcDM08Xynp5kNnYlLwhsx9kHBGNQa7ZrdxXYogNGAs7
 ET4flRnVfK0HCrU27WZN/an3vrHI1Eo4XsX3XPp/rIPdJIdZiRMPpVvZ6HaOpDWjs/6ZJ1sbc7B
 iCHlJo1VRFRHBZm9xTA==
X-Proofpoint-GUID: 3aD2xzOmzCzTNZloGGFz5DcmMfShh3j1
X-Proofpoint-ORIG-GUID: 3aD2xzOmzCzTNZloGGFz5DcmMfShh3j1
X-Authority-Analysis: v=2.4 cv=MJttWcZl c=1 sm=1 tr=0 ts=69bb7d9b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zgz-R09rLuGx3neTn8MA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190033



On 3/13/2026 9:38 AM, Dmitry Baryshkov wrote:
> On Tue, Mar 10, 2026 at 03:03:18AM -0700, Jingyi Wang wrote:
>> Move interrupts and interrupt-names list out of pas-common since they
>> will be redefined differently for Kaanapali SoCCP.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,adsp.yaml    | 14 ++++++++++++--
>>   .../bindings/remoteproc/qcom,milos-pas.yaml          | 18 ++++++++++++++----
>>   .../bindings/remoteproc/qcom,pas-common.yaml         | 16 ++--------------
>>   .../bindings/remoteproc/qcom,qcs404-pas.yaml         | 14 ++++++++++++--
>>   .../bindings/remoteproc/qcom,sa8775p-pas.yaml        | 14 ++++++++++++--
>>   .../bindings/remoteproc/qcom,sc7180-pas.yaml         | 20 ++++++++++++++++++++
>>   .../bindings/remoteproc/qcom,sc8280xp-pas.yaml       | 20 ++++++++++++++++++++
>>   .../bindings/remoteproc/qcom,sdx55-pas.yaml          | 16 ++++++++++++++--
>>   .../bindings/remoteproc/qcom,sm6115-pas.yaml         | 20 ++++++++++++++++++++
>>   .../bindings/remoteproc/qcom,sm6350-pas.yaml         | 20 ++++++++++++++++++++
>>   .../bindings/remoteproc/qcom,sm6375-pas.yaml         | 20 ++++++++++++++++++++
>>   .../bindings/remoteproc/qcom,sm8150-pas.yaml         | 20 ++++++++++++++++++++
>>   .../bindings/remoteproc/qcom,sm8350-pas.yaml         | 20 ++++++++++++++++++++
>>   .../bindings/remoteproc/qcom,sm8550-pas.yaml         | 20 ++++++++++++++++++++
>>   14 files changed, 226 insertions(+), 26 deletions(-)
>>
> 
> 
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
>> index 66b455d0a8e3..cb0a61fc301d 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
>> @@ -48,6 +48,26 @@ properties:
>>       maxItems: 1
>>       description: Firmware name for the Hexagon core
>>   
>> +  interrupts:
>> +    minItems: 5

Hi Dmitry,

> 
> Initially I stumled upon this (and dropped a note in the other email
> that I noticed a problem with the series). This minItems looked like the
> underspecified property, buf after checking it seems that this schema is
> written in a way that covers DSPs having both 5 and 6 interrupts.
> 
> So... most likely the schemas for DSPs might be reworked / optimized to
> cover modems separately from the other DSPs, but it's a separate topic.
> Let's settle on the SoCCP topic first.
> 

Per my understanding, we can continue with the current change for soccp binding?

Thanks,
Jingyi

>> +    items:
>> +      - description: Watchdog interrupt
>> +      - description: Fatal interrupt
>> +      - description: Ready interrupt
>> +      - description: Handover interrupt
>> +      - description: Stop acknowledge interrupt
>> +      - description: Shutdown acknowledge interrupt
>> +
>> +  interrupt-names:
>> +    minItems: 5
>> +    items:
>> +      - const: wdog
>> +      - const: fatal
>> +      - const: ready
>> +      - const: handover
>> +      - const: stop-ack
>> +      - const: shutdown-ack
>> +
>>   required:
>>     - compatible
>>     - reg
> 

