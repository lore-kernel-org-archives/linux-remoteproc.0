Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0981EA7C9
	for <linux-remoteproc@vger.kernel.org>; Tue, 20 May 2025 14:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747751367; cv=none; b=GM+7dyfisRAzym8hjYtqCTb+uEzO7uxqQqx/qrXbNxVdAli5oa3GjhwAsPv+WdAQ2vo2SQq0UwOWmQrrCuTswV3xflJ1GDgPh0CRTF5Yid21NHb4IjWxxHiW4brb/yqBN581p4wJhQdad1T93ZfGyHRXHHuSelBZYUEpWNgH36s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747751367; c=relaxed/simple;
	bh=ejS6ovgsQrYlFQ3gRomd+Ji1tifZg7j6PQr7o/pIqA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pAIs+uee/8tCX3zLYxXXqAPrxAk1RIKy0B/wcabQce4ba2AHhSEuH+2Rx0S+h6jVjW/sQznvXqRyvoKX+7VbpMbnZfz5fPkIqYY7oJih9ilxjI5Hy2knvCfff+5NBY0SsRY5RBLpO2jOBJNJwh2fSoxe/YwSFaungtA2toSyW7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVFm7eyd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVFm7eyd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K7P61S019020
	for <linux-remoteproc@vger.kernel.org>; Tue, 20 May 2025 14:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eTvWyp6sTsoPovqd27mbVAax9KqDto0mtErtu24hwf8=; b=dVFm7eydEyKaxevI
	vfIkMyHij2+KG8/TJdppUEn6/PAJrcB0JRS2Q55gC3y45jHO2eyObmQMmo/2retX
	i2BbeUhagfrA+Dmuj597YjzMVP78MXaDgfl+yIZmd2J2558VgIY0nPg5O2X5xMPp
	xs6pcB35a29K+qIsG9R4fXd+yt6nT0oCMrxZ8TNzxKysb1SCB7TB7kXtbAqH3Ulo
	GQYBfbaD4KPzOiP14qMKeGF7xA4NON4vQg6fZ24Fur76iVEybMXt/GfdFmUnUS+Z
	6z6RZxuqhr8y+M6qAK+LzbKNdxvkxmaplJiFuKiL8qAby26gXS/0su5A6+4PLOa2
	ysvvjQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm50335-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 20 May 2025 14:29:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c547ab8273so95919385a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 May 2025 07:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747751362; x=1748356162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eTvWyp6sTsoPovqd27mbVAax9KqDto0mtErtu24hwf8=;
        b=W7mtsRCIoP5SP0Q5vpApvgLU16xLTTBywgScWBmmfGcPROED5glgQUPWN/8OABD5oC
         9Uk01wQD2VJretg73DlCxC0XLUrfbSLFY+PhdCJHtxzEaQ36a6SX6cQt79gdbApaw5FF
         hS4ZGbq0jK8D5EsZY6q4+Yb4LrdvjHX/Q8PfqV67R9ChNFTvqUcj7M9DYBgMgZbK55XT
         1wJt7s7MgkSZ3oJwNOTtEgOCuGmn6XgUAiSmDjLwEit6PVJyQ27688dQSImU4ASVfxjf
         cZ6k4u8uq9pI3obQl0/A0Hj643CECSyZCJmpbi7n9Z1/RLDsPwURGg+uJ9sc0HX3uWr0
         ae/A==
X-Forwarded-Encrypted: i=1; AJvYcCX5HvR5/KzqN37LAq6MU719J4tVtc1zki9x4NxA7ns8jkgDvbuvDXP1yIEw1FkAeRliICiJ8kxV8+MTlSe3468J@vger.kernel.org
X-Gm-Message-State: AOJu0YwsIo0C+1QOjYqpbPTRRImXELZuXdLzuGfB697aJWBkkXGxrtqI
	r2jg0oZsNUdsF6vDcXCZM2COxqTacNz/WTYrgQYh4tA5AqnigjixZWuhshag9KWA+Lsuo2Z9vWZ
	O92/7w9M1gIGRd+1NWbO7VrrKMF3AUSGWlR4TJFxGPqzEtebEuaBc1vWjDroYDuGzK1+QNOWJ
X-Gm-Gg: ASbGncumHTT8G5EwBjhPt8pk6s19TIb0X708Ykf3uG0ezYY1QTFWblghBtFjcT1rQLE
	2dC13aazLrwP9gjPm+9Gg4I86GAfnZxYCJTq8ZUsFxhWvnKKempDgFKREHhJ1Xh6BNj8JNtbtGO
	VZoxYsKaqXTXlDcDzUDdViD/w4ATULZq3NyYMXhGpQ+F1icMl/RyEMqO/OXIgtQ95IDC9gowcdC
	AUddjSNA2BMv09yyx4vzUmtAaGKVk01KOdqqB4+RvXS5JRWZO73jdm/tqD1H+Ueqs5cXIDXqCxl
	Rh2m+j9UWBA6oq1yh8Sdf5dTx39bAUqCqnopTMDhmv6riLUqMWnaeFWdMT/k7LOFGw==
X-Received: by 2002:a05:620a:4895:b0:7cd:14b:554b with SMTP id af79cd13be357-7cd467c0835mr1061654385a.10.1747751362236;
        Tue, 20 May 2025 07:29:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4MIcwFME3fzluDpcCr0w4MNNLPjzHGz+1z4WA1cnE5MqMZfKL4v0eGPZNm07L4mDAE11zzg==
X-Received: by 2002:a05:620a:4895:b0:7cd:14b:554b with SMTP id af79cd13be357-7cd467c0835mr1061651285a.10.1747751361733;
        Tue, 20 May 2025 07:29:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04e674sm733754866b.24.2025.05.20.07.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 07:29:21 -0700 (PDT)
Message-ID: <a49df292-dcc6-457c-a565-984887687341@oss.qualcomm.com>
Date: Tue, 20 May 2025 16:29:18 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] SC8280XP SLPI
To: Johan Hovold <johan@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
 <aCr7UzmK7XCjpsOx@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aCr7UzmK7XCjpsOx@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682c91c3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=IX2s_8XrF8Sh1HtkrDgA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: bXsHhqJPKwWfIjY4h0nLSwsdWJAbJbt6
X-Proofpoint-GUID: bXsHhqJPKwWfIjY4h0nLSwsdWJAbJbt6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDExNiBTYWx0ZWRfX8naLwr5UeNDt
 2GcwJUIr04OyqiH3+jNphGh+wsfLbxakwmL2Yc5dCIAC0wcR7leX1Hw1tyeA0nucsO7YRGGPcMe
 MzdsMc4i1oBNzdIB5IlEZ+ZPjoah0rGvVAqkmI5lECoxEsvjqn6h7456mCRuT3HN+deRno1VHD/
 hgTpIbuDkDpImbAXKzLbpvWlbBvE+/oap9qlhIUQCsk1JHceg7H76LSterZdU19Mwbp33hpBw8+
 4mBjUczwDkGKUyM0h0KoQXHYd6jiUYg6r0OjXNLbkFdvZxHsR+0KHdFZXvtCTQ8E1jMqIu8g4+p
 4HXG0fRA0/G5asktifcEOLNIkTTl6KyBSS2BMJDWREcWOVq96ZHQGvu0pjxdYxvQWAWLOGGJZub
 uhywv524A717KLJ8q7LQH6kbS1bOtfbGa3yl+eW9TgZdub+snaZlA0NQz4y8n9xTjKuCSYQf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=804 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200116

On 5/19/25 11:35 AM, Johan Hovold wrote:
> On Sat, May 17, 2025 at 07:27:49PM +0200, Konrad Dybcio wrote:
>> SC8280XP features a SLPI, much like its distant relative, SM8350.
> 
> Please get into the habit of spelling out *and* explaining internal
> Qualcomm acronyms like "SLPI" so that your cover letter and commit
> messages makes sense to people outside of Qualcomm.

It's difficult to judge which acronyms are known when half the words I
type on my other computer are TLAs..

> 
> Also say something about whether and how this is useful for anyone
> currently or if it, for example, depends on Qualcomm proprietary user
> space bits.
> 
>> Dmitry Baryshkov (1):
>>       arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: enable sensors DSP
> 
> At first I was worried that missing firmware could cause issues here
> (e.g. drivers not reaching sync state as with venus), but Lenovo has
> indeed released the SLPI firmware already.
> 
> Are there any other potential downsides to enabling this (e.g. before
> anyone can actually use the sensors)?

It's probably only upsides resulting from keeping the rproc in a known state

> 
>> Konrad Dybcio (4):
>>       dt-bindings: remoteproc: qcom,sm8350-pas: Add SC8280XP
>>       arm64: dts: qcom: sc8280xp: Fix node order
>>       arm64: dts: qcom: sc8280xp: Add SLPI
> 
>>       arm64: dts: qcom: sc8280xp-crd: Enable SLPI
> 
> Without firmware this results in errors like:
> 
> 	remoteproc remoteproc0: slpi is available
> 	remoteproc remoteproc0: Direct firmware load for qcom/sc8280xp/qcslpi8280.mbn failed with error -2
> 	remoteproc remoteproc0: powering up slpi
> 	remoteproc remoteproc0: Direct firmware load for qcom/sc8280xp/qcslpi8280.mbn failed with error -2
> 	remoteproc remoteproc0: request_firmware failed: -2
> 
> but enabling for the CRD reference design and requiring users (read:
> developers) to copy it from Windows should be OK.

We shouldn't expect non-developers to have the CRD on hand, right? ;)
