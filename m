Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017BC37CD2D
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 14:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779461629; cv=none; b=NUyqLXJrXzwiL5P0JbbY7TmRw9TTRmG8MT2+Wkf/EQHtRk7wJsFEHqM9BWq1VsKfJMS11Hq+LYH1jZfgaadS/zGXwlwkAVA6nt8lrnfJ82ce9Y/ZEofrVSH1plgbU6TAehlKSGnesQpML6j0WXm1VpjSw4v5t/PQfmWmOJH7Q9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779461629; c=relaxed/simple;
	bh=/hE5m6idKzPlu3vSzifAN7VDr9wafOIGeMe/a7NlIic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1nBbK4Y5Odgtd3UWa0AeLImgX7wUtW8bf2a+GUwFS5oueSopt7yve4fQoula1ezlNLKtgiEkJjcHkIJTwFDVoTzJXFaWvNTTopsfk+KGNXJohfMUjQdg2swCFB1ylWOtekONgbCPGza7/8miDd8HLREI+bSMoH9UwjYqxnsdBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8qdpqXI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CpJZHWi/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8qdpqXI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CpJZHWi/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MAIqhk1800960
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 14:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pF2WmMrpz+Zv5qLWFq7G/tufi6Y015PPpGb54Rf2fho=; b=A8qdpqXIdD+wK2d0
	ChuGOZuBtcHbqljrLdX+7PwkYJgrw1VaUaDQeupHtAmPznVpxewtMFjg/BVWORqL
	fpm+qwNeIieM+uSkNNEI02Bf49zv1cWp/5WnD1ZyBmtq5cR7pJv7spbfqdlcWWlQ
	p/YW9t8iKcBwnmyCIin3L2GTQHNsq3LRgmKHBv2YILtM0wQ9xz5wcY4E1K4l/t1b
	IXlGqQCdjeFv6kUwfrNPzzd3cNvQT/uqf83dnCxuD3uHbQtQ8W/58FKrkN7UmIWZ
	Ke2d0gw2ZpAdt5fhapSstGj6nyD3wRyBRlYCmT1XdjxM/gve6Ff6GeoVgyR8mEy8
	Od+NlA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean9g10cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 14:53:47 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7cff695e4a3so79064277b3.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 07:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779461626; x=1780066426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pF2WmMrpz+Zv5qLWFq7G/tufi6Y015PPpGb54Rf2fho=;
        b=CpJZHWi/+UzBJRWHTGCY6Jt/p3hoyW8ERdsuu9iG1gFuLaN5nj3GIlwOpHSC8Nitcn
         6QBbIF0JSA+KUxymRUig1l+jZuBolWZtxkzdoLMXd1Ql4e91UXnbu+FQF6KxXEYPLGpv
         wjlsIgbGzZ2ZQfKUlw8N8R1Xjh2EHvvZ+SsGKJeomvi0R6INFQ74fr9WqgRQTYwd5R4U
         iay7VdMcsGh4vHkUvaUpTMtbqplPD7KFQPb15Cf9nGL6ZFHyTMmV9llC0nyGN5SA3CxJ
         xR2AcBDBx+9sBkrQln4g85RBfxPVioA5R9VGJR3ffJm+U5VST/iIAip2u1fYg6Gn94sW
         WCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779461626; x=1780066426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pF2WmMrpz+Zv5qLWFq7G/tufi6Y015PPpGb54Rf2fho=;
        b=ciIPHDvP4XcdSKAeHsZcK3yjN8CpW4YCXxd8jKZYsBuWY6udo0rYeaNeNpKnDNkj66
         efTGjaN0rjyNkVRuSwnZ3ahvr/KdFel0y9LqekVLvBwMHH+H+Jl12MP41+4yYMcCff5W
         fBy4xL7kWyGmB8XxLGthXpPPv8uRbE6I3S9axH1mF9MYfYxhgakPAkvpWgXG6fTHhIiP
         +eUnRZkF5cYf1CRUEVrxS2MDzk4tZSihAVCymvlBqGSZZ4/EP8umBE2eDLw1UGvpILhp
         oK7/IeBmKEtLNT0l6a/Q58ACM/FYAiwxRuPdyqg5iW56BSSqmzB9LLMDDpMXeSuD5eNR
         H7fA==
X-Forwarded-Encrypted: i=1; AFNElJ+3++PheskV5Dy8wfvJP300BHGxEUP4+gFgIYADnnAr5rcIvYbkA/ZxAoDdKqT5NPJyaNWrw7DrBI4+65MEa+C5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7KgTY10ksF8bE1IlSLdw625GYBPY02nSpv0upO66POXGVJdRn
	o/8yJWSOpK75xeKEbPc9ps8SARh31pIhr1Ru2YUnWYgSYYheRSyX+QhQvw8CYKc05QBhSNDf1pw
	/8VmRpyx6m1p/QSSqqfw7ILJbsY3DXVcZYO82j8feVdWERUSjV+VPY5PDQs8plPbKqp3tSS32
X-Gm-Gg: Acq92OHguY/G02a3sXZz+kPYxMi3NBP3pWfSszi1W7ocwQhBwYEigUnG11SsV6erAeT
	amiFaEr90pFJjL5svBgqSDXyVBKRsVrb2oYqizilxwCSRnR4JrViJ1PAYjrTpoT50EEVKfrGMl1
	j+99XLgHx/I0HT8Mm/4oByYsmn2h0J93+BfdBxRr5lThDjlsiBpxA1w4lASkbI2xml9kxECbKqT
	gHuQya5iQvea+hTDqe6KUrSEezASJIcFr8NefOlH9WS4r+hjQM1HhB6xezOgK1ZkuC+bC744ox8
	/x+SZEn9MJ1pIRi84iLX0Sh9mcwbuPlns+bEZ3i+IqQxHFrehlMvhMHNLw37QxyY4khqcU6F3Aw
	oPqxa1neg4Du1rDgd/YtI1phvRiNlTucvTFPrEPaAJWYZyB/N
X-Received: by 2002:a05:690c:6084:b0:7c0:d0ab:28af with SMTP id 00721157ae682-7d3343d787fmr44563867b3.21.1779461626431;
        Fri, 22 May 2026 07:53:46 -0700 (PDT)
X-Received: by 2002:a05:690c:6084:b0:7c0:d0ab:28af with SMTP id 00721157ae682-7d3343d787fmr44563537b3.21.1779461625912;
        Fri, 22 May 2026 07:53:45 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38be2dc9csm8941917b3.24.2026.05.22.07.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 07:53:45 -0700 (PDT)
Message-ID: <c265dfd2-e077-4ac1-993c-e1d7c4dcca8d@oss.qualcomm.com>
Date: Fri, 22 May 2026 20:23:40 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add Shikra remoteproc support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
 <20260514-shikra-rproc-v1-2-9afdedeee002@oss.qualcomm.com>
 <g5wv5mi25l7jyq3vbe3dovriyxguw22m5uvyslkbjbyprbxfnq@kep4x3kxeqmj>
 <fd67b063-a986-4d34-99e6-fe55e72d0187@oss.qualcomm.com>
 <db13f51a-98d5-4793-9c7d-3edccc3a603c@oss.qualcomm.com>
 <zirwveacipcy2wamaqntykkwhhdirw5ln35qkqs7aqrv7v4evl@qyk2tygwrbdu>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <zirwveacipcy2wamaqntykkwhhdirw5ln35qkqs7aqrv7v4evl@qyk2tygwrbdu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wRS0lBZq_HXpcfnlEdXMuK_JqsMTtF0Q
X-Authority-Analysis: v=2.4 cv=B/qJFutM c=1 sm=1 tr=0 ts=6a106dfb cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jH77VO39CjRCDWMup1EA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: wRS0lBZq_HXpcfnlEdXMuK_JqsMTtF0Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE0OCBTYWx0ZWRfX0TMZpg0fy0Qq
 sWH8stp4nOmqg6xKiZcvZVLMSfbWzzSJ6uHg0c2FwEEZrhqkQG4eFn6GkILheVVKPZtth0Xobeh
 oXmwzHcdvbv3mrQdtV1CQhh37ZdJ/t0SoCYoeDcbzXF0YM1Vg0y9BlkXSPcWam+vAEijQQlBBKl
 n9Rm3t1OXbQsb7Dhk0mV+90xgWSDiBe/UCo/csZ4lMKMyzlh5IUgDsbEGFxU47wK3yByceOWniq
 swqLvEFZmUxNZXM8TUveRCzKtbqC7xQWykxABRsrnCWnEJC7jOXzVH4BO3F/or0yz1Lr6QS5DNz
 +OsxEbTViOkZIvFnL1YCJoBSyd+k4iZ03MHzE30bliTMGngJKgEczuMG/yc6ZmukmyXn8IIDJ3j
 pJQBYgjd/HCZIM+A0s2+jgCEfgz7TFhe7Mj26f/7EZSMjm7tpZIhgJY8NlfvYPP35LgUffh9NIo
 U6lFevC2YxHNwsL7F9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220148


On 5/22/2026 7:48 PM, Dmitry Baryshkov wrote:
> On Fri, May 22, 2026 at 02:13:08PM +0200, Konrad Dybcio wrote:
>> On 5/19/26 5:03 PM, Komal Bajaj wrote:
>>> On 5/14/2026 12:48 AM, Dmitry Baryshkov wrote:
>>>> On Thu, May 14, 2026 at 12:17:31AM +0530, Komal Bajaj wrote:
>>>>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>>
>>>>> Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
>>>>> for the Qualcomm Shikra SoC.
>>>>>
>>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>>>> ---
>> [...]
>>
>>> Ack, I'll address it in next revision.
>>>
>>>> point you can use sc8180x_mpss_resource instead.
>>> minidump_id is required for Shikra. (decrypt_shutdown is not applicable and will be removed in the next revision.)
>>> For minidump_id, we still need to use shikra_mpss_resource instead of sc8180x_mpss_resource. <?>
>> Is there a chance the same ID would be applicable to 8180 as well,
>> just that we missed it in the past?
> Do we know, which platforms were the first to support minidump at all?

I am not entirely sure from which target minidump support was 
introduced, but SC8180X does not seem to support it.

Thanks
Komal

>
>> Konrad

