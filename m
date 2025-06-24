Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE1429B206
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Jun 2025 13:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771540; cv=none; b=TrEndG2z/9FLNnJVHfIPj8oNLrH0cFJEW/I7xLq2kHX2hY0P239DYjrOIPDzyl4ybputWRFhsk1UtmSKumtrownD+fiuJQhElVi54cy8Gbh8it5oSYfHGZsQsYTkfKj/pRMkcda8yADaqtgEfiaU/njm9GyYBqg6fpnTGhlIze8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771540; c=relaxed/simple;
	bh=O//ctg+SgVaxYLIL04Z2pIwS9W/cpXKX5+4dHW6Gpu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1igYxHJBlqOYurRkXgTxcCyLd9jHNIbyiMrghqknZNbDonqxkdsfD3IsfXpTJVemvyc3HNdMQgK8yZQqmvSMSLRFgCcvrurOrFePoTiTTZMDH/zjf8KTRlvAuS8sxKT5dmkO5SmVE7Oyg6h4vWsYF7XcrVjhC0zmg9NaT/gLKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cbul+x/5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cbul+x/5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OCMhQ2024833
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Jun 2025 13:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	puqnTEAbiwXXvejvFqHMQDxLMczv/myXUOZnE8pspZY=; b=cbul+x/5zDFIJR/D
	zoSVQtmbiMSfUxpe5Joqf9z4WRN/GHRJKQ0dBU6x9qEJg99OMKXfIcwBvH3b1xKS
	ptuT422Jq2dJXuUPeXfMMZZ9nGfBNR7xzhA1qR/x7DySHcMDkT4KHsINHjPxOesO
	WOucqMNUgflVUTjdXu+Vmb2qpVLOlqXYYceD8zYGd3CROzOoQYzyBk64myVEjB51
	v5IqA74RHvP/s6bU1ajNvJFPg8ykX9B+aczmvV7f6QqhGuZGIydJrrDG2aIZVKzy
	z9thC8TevL2Na/Zn9CTrgN8KaVMLSN3ElMgDT1pVpSxE6T4Xxn/aTC2wwa1cOIz7
	tQn4Ag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f8ymu8wb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Jun 2025 13:25:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d097083cc3so167006385a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Jun 2025 06:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771537; x=1751376337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=puqnTEAbiwXXvejvFqHMQDxLMczv/myXUOZnE8pspZY=;
        b=cKdU1jD2MrHdh/Fjp3dDkDN3hEySmRWrMp+jpyQnAb0LCeU2LWUOWdQtGf31wox/Zw
         Xe/mQSossmY9XLCgb3ap5ElYQeZKlmUZ7KtX50+s3xZij7eWCqCTcspei6j4yNSLyVv+
         80E7pjo05GedGlQddIkuNV+XFf2MGeL53LkoEB9cfxWT6q4Nnw5QI6CznJjdcsawONoB
         xltWlzKNJHwU4lREcYSiUql24hks3JiGBgMXO/WUXx7JBV1TJubxamoqAGhT46PLxUQe
         islqSIRPH3ZSDmhZkayR/nWHRwbTa+2NxuI1vuo1HvD00/rg1ZGeZ5AaKx8ZGjpohgys
         LCUg==
X-Forwarded-Encrypted: i=1; AJvYcCWqCKaxVfjrUm2KcRoC4jovEtaa9dJ6V+qLI3vgUqbOE/ooPgAg65Xa7BLQCsxvN/fOPIzhbVjy+f03+zZ9SJIW@vger.kernel.org
X-Gm-Message-State: AOJu0YwyhVB+kGDUWtXnmGLbNwIrNOjwqPU1F/hr1ZC2UvEB4nH5wyC1
	qaGmuHv2YqiIegZBiLvs4y7IdD43YG7c08ai5YrPoUuM3A2PQEQFAUxVUupH8yngvDJFJZqT2t2
	+so6M4RXtjsI2KEIN4o2Ob0BU0okQihlF7YecwOjCmKyjh6U5GEuxT/zcDuMUhlwgvIeFuiAl
X-Gm-Gg: ASbGncsovOCuwdTallPOmDL2U6d1ThACcmmd4CXB+voLyL1P+chG92nS2+g9b22Jlbh
	p19GNcepHnDSiCbM8R6m9SJmrEAZaKjLBTTmSCXNnqu6SJAZKNSNISUZIjtkvgSaAHAD9X1t149
	5IT9TE3c4J8EPWlLZb5THcTG0Nz44/RsGqHYGVPkLVPPer7thP8S7sKgu+jjm/nqF2O8GXQmeWB
	aYeT78Sexv9mCn9UcM5GhcJszVEqZt7oT8TEGe0feX7qgkfIAFHy3VZaekjWnNL6Ss8hLfpXjdo
	X7o6gpf3rms1ZYo8gQa/BXqpZcgXA+aFgvOW0MJunjnugBcOyB4vnC+yDlIsmFFiUdpXMN0ae5Z
	R5Tg=
X-Received: by 2002:a05:620a:1b97:b0:7c0:b018:5941 with SMTP id af79cd13be357-7d3f98f6cc8mr773216785a.7.1750771536996;
        Tue, 24 Jun 2025 06:25:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdrAg7gq+yCMSKsOWWwPNIbmt3jijAcQ2jxJTGwCS226EaL249p7Qlaj5TFZ6lHgo2gEcMWQ==
X-Received: by 2002:a05:620a:1b97:b0:7c0:b018:5941 with SMTP id af79cd13be357-7d3f98f6cc8mr773214385a.7.1750771536510;
        Tue, 24 Jun 2025 06:25:36 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b75b0sm864445466b.126.2025.06.24.06.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:25:36 -0700 (PDT)
Message-ID: <cdf8428f-1407-4482-b946-804ffcdae3c7@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 15:25:33 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974: Start using rpmpd for power
 domains
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <20250621-msm8974-rpmpd-switch-v1-4-0a2cb303c446@lucaweiss.eu>
 <50b0aa77-4ec5-412f-9ce5-6ec613dd0afb@oss.qualcomm.com>
 <d31bf707-0f8c-4f55-927a-a08c5310b7be@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d31bf707-0f8c-4f55-927a-a08c5310b7be@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDExMyBTYWx0ZWRfX+hcXbCETJB0I
 CpUuUcsuE2iwzg1ChG6zQVpAtI/bJJa/11IfOEhSOV8IvGlAIAryZDMLmRe7PhxKvaWOLCZW+jn
 m6A0ZpGWguozmMupCZsH1zOgQeZAG8JfP+j6uRBbwkbtxmPVDdIYOtFRo97TAU7fUtrpUFAIVPt
 rPvRdg5B35ZJPxXWLzQHLuhqRrMv3k59M7N5jhy7odVo/YpiQJcgm+vwSMufgfS6Txz3YuJ6Q46
 /wySOAmfGPADLF0A33rjgT1yOEZAyyAh1lfpnwx8TImbUFyT5qJLGgm4/aXTzeDY3qeH+ksYNQn
 M1kXxTTt+ijFCC2iMbNmJV+SvFn4hGq4SHA0b3ScE4oe6qW2+tkB4ank9lToG67PVKhPEtophw/
 7ncyiGcmtsixJSGP+BEMULRLzTR3IQk10Ftg6Yluc2M3oCu3KAxCemDU7eLtlQxIVT4Qg5+P
X-Proofpoint-ORIG-GUID: saH0DoLgyeV2UogZBZcToW0-LmwHf4Nk
X-Proofpoint-GUID: saH0DoLgyeV2UogZBZcToW0-LmwHf4Nk
X-Authority-Analysis: v=2.4 cv=GLYIEvNK c=1 sm=1 tr=0 ts=685aa752 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=wIXcl6-ah0yuBUIPcu0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240113

On 6/23/25 6:44 PM, Luca Weiss wrote:
> On 23-06-2025 2:39 p.m., Konrad Dybcio wrote:
>> On 6/21/25 3:19 PM, Luca Weiss wrote:
>>> Due to historical reasons all msm8974 boards have used the CX power rail
>>> as regulator instead of going through the power domain framework.
>>>
>>> Since rpmpd has gained msm8974 support quite a bit ago, let's start
>>> using it and replace all usages of pm8841_s2 (CX), pm8841_s4 (GFX) and
>>> for the boards using pma8084 pma8084_s2 (CX), pma8084_s7 (GFX).
>>>
>>> For reference, downstream is using GFX power rail as parent-supply for
>>> mmcc's OXILI_GDSC GDSC which then is used for GPU, but nothing there is
>>> modelled upstream.
>>
>> if you use an opp table with described rpmpd levels and bind the GFX
>> domain to gpucc, it should propagate - check it out
> 
> I don't *really* understand what you mean here. I'd be happy if you provided an example (or better yet, a patch) for this.

sm6115

> 
> Also msm8974 does not have gpucc, only gcc and mmcc.

*oh*... right

You would then have to somehow selectively bind the OXILI_GDSC to
VDD_GX, for which I don't know if we have a good interface today..

Konrad
