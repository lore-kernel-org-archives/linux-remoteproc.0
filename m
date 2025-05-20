Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E4122C325
	for <linux-remoteproc@vger.kernel.org>; Tue, 20 May 2025 14:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747752337; cv=none; b=p5J8CgfCTR0LvLf80lnSgMFJylWY8+s6lgsmw7zL34JAZTKj4WFYRzBS+4xjE+sfJwUzD/BzGYDnhkCGVpnI9xwvzAthn/SXeJuBasfQAhOARrM9paL88A4GYCGos60JhN5TLLw6Jr3SbAjvGSVtF6AhFel27rhmCp7i9zH3aW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747752337; c=relaxed/simple;
	bh=AhpNTohfkxb/6HCtk/2e1VKzunmWW2d5HeDbWYTrHCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PoYW/dNGcNO6VMWlq/T71uhI9wSkooVOWvk72Zf39VkGL+HWKym0WkPNoZp6WzmGYsjs9Say9YBxIqhHwIPa06uY1zdtf3dv9xl2eKaUFIPYpaNrNTKGIH7EuHpSoXeR3mf6cENfCrnHD4nJADybqDzGmGPJCkndLFV+wy//x3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bAwQZIKV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bAwQZIKV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K7uN2U011101
	for <linux-remoteproc@vger.kernel.org>; Tue, 20 May 2025 14:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F+UYVkRq7QWAvs/4Psl68WMbM9V3F5w7kl8Oo8qj3QE=; b=bAwQZIKVGRjy+y08
	agztzhNXUygFJYKi4dG8FcP9GA08H7BOQZ3vuq4x83WynM52cZoMHGcIJoFUvYXP
	OX6kv0tSz9WkFavzxTVAq+CYQk+LBPxWQRVbPCEa0hB9pKib201ZVygkmTYSYdeJ
	lLuyMjdqx5FVe0ilJ8H/6ORr6k4UMfIxgV37qr7lmmSvGw+K+7SvtgI368pit6lE
	DXEwLlW0qZdCzKKRIJLpU90C5ZTjoRkf8xR87TglFqQROazOvhHAi+fmKlKoJCRr
	kyeoC0femN2IUnupGSlgaOjUWS1Ko1qwvlaT5wbMYGmXUyGkb8BluDa/FyEQ8dd9
	Y7zdRQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rbt22h32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 20 May 2025 14:45:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so96294896d6.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 May 2025 07:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747752333; x=1748357133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F+UYVkRq7QWAvs/4Psl68WMbM9V3F5w7kl8Oo8qj3QE=;
        b=ftgn9wsDlwpaBEEAV+U4tq1h2gwjXn1U8J/AUwK6aiG17xwmDNCQGxWk+4LveQ/onp
         17e+rSnQN0qM98wVKwK3W+85YKISsOmrt+x/gvGGdnjMK4KjoSXN3Y0RYTFHMbov+Uxq
         y7DA+2nEZy7p+X52xgIv0WYwrg7SnGC0C1ZHIYkIxY33lHWGca0m5QVMJo4mvcu5zBWI
         hwMTcl9nNN8U3wt1V0fTNLyvEjPBIcCgygsKwoGXiF2EM1Ol1Gu5FRLh8hor0rLNG5i4
         atmMRhnmwPk1g4n68Y3E4izks3sK/fAx6tSW4BFmvWqMlpBKzZHo3z953oDcJDa5IurH
         CSHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr/4TbaBQL/8NTGLZLJxQKf8odi0BmZ397Bobjcd3jUkfFG+4VZRWZ8GWjubADgB9kWoWgaCCRbhkd1qY5OZp/@vger.kernel.org
X-Gm-Message-State: AOJu0YyRDEIF+dgzKmcvBbIHxZWXnB/BBKaDezFlZHZfK8YWVC4CZ9dn
	IDxCAy/LBZaJiANe4sowI5SYA9ZUaMhRjmkQIH9uDKHSvDmwBNL+nJn41bEiQgmLx1Sypz64dW4
	EQqpVUUylqWkD3vYYuA32mNkHdWXuqUnkSiy9IjCyaUHwM9AkMqYZCRxghsGmPdy/+IhKo9lf
X-Gm-Gg: ASbGncvAuOl7pTbOA4/6AP4pOnrxBHYMo0hC0V3c09mwOy6bQc9l84xAE8EiiPNC/eS
	ltjnFewrlmiVAPhy8XjAbXJqS6TB+/fft3CmQKrCLsW27eFiLoOHIuMgn8q0emnpR8HDajCUXpn
	GfW3/UZu3AAUNbOEJaTZL8kTJkDwsGQ5fQNyyTqmPQgMjq1HjEpPI3ehhRBx1IcRpDyZo3mdXoK
	Z1mOozAgL7SNcIlC7jJkJU+yFkcpmQIeNhD7/x/EQw9L9Exc3wqVfdbYtIORcjrX80Q1xQyJWji
	0viV+xdqD37qp1BWxtHkwLmBxLZhf4CwWLwAcgeNqD+eLUYATS86dv4gv/nLYXXjihke
X-Received: by 2002:a05:6214:21a5:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-6f8b08cfaf2mr302480816d6.38.1747752333397;
        Tue, 20 May 2025 07:45:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgeJAE3OlzT6P01yBXck+LegPxtMNuwI1oL+8K4BLsmkQnugoNimzkxj/J7I7mt6VdI/ZWFw==
X-Received: by 2002:a05:6214:21a5:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-6f8b08cfaf2mr302480276d6.38.1747752332995;
        Tue, 20 May 2025 07:45:32 -0700 (PDT)
Received: from [10.153.41.224] (176-93-133-115.bb.dnainternet.fi. [176.93.133.115])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085d0dafsm23934011fa.109.2025.05.20.07.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 07:45:32 -0700 (PDT)
Message-ID: <22c32283-768d-441e-b392-bd59a102f000@oss.qualcomm.com>
Date: Tue, 20 May 2025 17:45:31 +0300
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] SC8280XP SLPI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
 <aCr7UzmK7XCjpsOx@hovoldconsulting.com>
 <a49df292-dcc6-457c-a565-984887687341@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <a49df292-dcc6-457c-a565-984887687341@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDExOSBTYWx0ZWRfXykKY1Hzrg1bC
 OWZMmFlCrHLg1aPUEaYUEp/oscIK8Pi4JSBd5cHX3v0MDL3kXprBUcELir30su36ES8jI0f6Jsn
 A9K9qghk5oQcU03khgNEAxIcrlthJCx5kVJQC7arLqtnr2Y5YlEzhje+v4csyyIfFINz2PfXjta
 EJro/KIAB9HHy79SkcGysTPulP5ll7Hy5CmTFipShE6zQ331R4r5ZDcfHzlmk5H2M0TOX8Y7rId
 MxAVSRJiNBGJWnowdJorUWQrOMEs2bTEXnzxFMUlg5JopozdI8LNtd6ijFf4vANOGtL8I9DbvMU
 +OtntkaPgCTaFLezQHqmLRKmOv6bjwh10HKpSiSYtX3Z/CpuKe3xZk/W9a4HD/qjoPXL1KYOTLN
 nNohUQPuK4C2jRpBD5p7jGvWtrf5g39n0GhcRabTCdpHf3P9J5+oVIAKg9b5C+58oIrWKUJ9
X-Proofpoint-GUID: eBgFM3ATCd_l2m3-uTBzFZzhebTcb2mR
X-Proofpoint-ORIG-GUID: eBgFM3ATCd_l2m3-uTBzFZzhebTcb2mR
X-Authority-Analysis: v=2.4 cv=dISmmPZb c=1 sm=1 tr=0 ts=682c958e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=wJfVPMc1y4yLOrLMgEZDyw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=6qslIKx09P05B-qpR40A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 mlxscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=836
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200119

On 20/05/2025 17:29, Konrad Dybcio wrote:
> On 5/19/25 11:35 AM, Johan Hovold wrote:
>> On Sat, May 17, 2025 at 07:27:49PM +0200, Konrad Dybcio wrote:
> 
>>
>>> Konrad Dybcio (4):
>>>        dt-bindings: remoteproc: qcom,sm8350-pas: Add SC8280XP
>>>        arm64: dts: qcom: sc8280xp: Fix node order
>>>        arm64: dts: qcom: sc8280xp: Add SLPI
>>
>>>        arm64: dts: qcom: sc8280xp-crd: Enable SLPI
>>
>> Without firmware this results in errors like:
>>
>> 	remoteproc remoteproc0: slpi is available
>> 	remoteproc remoteproc0: Direct firmware load for qcom/sc8280xp/qcslpi8280.mbn failed with error -2
>> 	remoteproc remoteproc0: powering up slpi
>> 	remoteproc remoteproc0: Direct firmware load for qcom/sc8280xp/qcslpi8280.mbn failed with error -2
>> 	remoteproc remoteproc0: request_firmware failed: -2
>>
>> but enabling for the CRD reference design and requiring users (read:
>> developers) to copy it from Windows should be OK.
> 
> We shouldn't expect non-developers to have the CRD on hand, right? ;)

Non-developers without Windows can extract the firmware from the 
corresponding cabinet file.

-- 
With best wishes
Dmitry
