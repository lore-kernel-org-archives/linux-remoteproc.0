Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4F7313520
	for <linux-remoteproc@vger.kernel.org>; Tue,  2 Dec 2025 13:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764682087; cv=none; b=owXRmv/dMs4VrWx9lUTkawE9tfRwN90MQhpr9Q+sVXRmZWUEu9+Hc8aHeS3BAwizz+AHNUWpEUrEsDS5Z810/OCma/Ly5puu0tMEijTjYcbaJNgTBZEW6FrI68NYtJVIOLUSrhmqJMbhJ/AwyOE5DoPRWRp8LDVbnoDZw1L/MZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764682087; c=relaxed/simple;
	bh=omEADPEFpCtodFUgCY7F/Xae9OmSA4gE2tWXlmUU05E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PuXXbCS8JdjLZXTn8BpK0B/AtDSUhU9rwfhFbr0rIA9wbVNM+4fiQRYg0BhtE8QUjNInAhyWkcMk2LobSNM0HYC9K2iRpN5bfqn9WaBkrxCaY1BlB0WHv4mPv6d6CenILtoexHqcIp+Ea//FTaXW1acnOE6nxTsDklxhGM7YQ5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uh2B1dnl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=edaX3CSg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uh2B1dnl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="edaX3CSg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B28L8xg1494465
	for <linux-remoteproc@vger.kernel.org>; Tue, 2 Dec 2025 13:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cGSZe87CZjxr7Wk/kqndn3Caz/wNBKP+z4zDP6I+8Jg=; b=Uh2B1dnlxaBY9yux
	5+X68KQrLjS/X35pJJMt19asVdm4bvm1I7xG91QmYyTzuqe9KaFZpcMcA9r8fLfm
	hSKZWHLwVjx+7bVsUYuIm4by0PXSClfqXM9wr1rsMP8c8jmV87AfEWTOsiFlPWg8
	tqF5EcotpU4Kkyr5CCDfbt00krB2542m+ccxd65r0jstIlp4kNLIPj9dgIJ08NSo
	30+Bfa2THF5jsS92wLUmYe+v38GeVd6L7fsHTFr+m64vEHYA+j2BNM/Uj8pV5K+Y
	ql/F8/1rOMlrvfY2nbN3OXZzQlT2N6roPxeM/VK16xm32k8tmYSNq2CreeUSkWbs
	FuRYsw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4askbd2gw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 02 Dec 2025 13:28:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b10c2ea0b5so183464485a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Dec 2025 05:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764682084; x=1765286884; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cGSZe87CZjxr7Wk/kqndn3Caz/wNBKP+z4zDP6I+8Jg=;
        b=edaX3CSgRvvL7x1QiUnh7I58GH0Zi91PqOdiuvQSCZuQopkxjbpwphKOfvqxfBwUP7
         J6/+NpANZDbAyDf4qMwDbt1teg+AlVZ9yW0FihC7wpwHIz7Ejnkev87SAJjRZDSLwtGp
         PGW63GWQgNLw1wxZt6GQass31VwmaOVZETS7tkMWtxFpzC1Deae9wDlUWYW13W1FmIk4
         Rwk7l1GeMReKGVgV5Mu1hDaCY/qtDPla95DUwUD86U7RccmoHkjtSh2O86ay/C0AxnxD
         OpHaMoMuNo1i3ICAYsjhGSYBseo9TEuU3/YsEanb1QijciG4/26YDVn3Wj1Y0AivMWsE
         NFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764682084; x=1765286884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cGSZe87CZjxr7Wk/kqndn3Caz/wNBKP+z4zDP6I+8Jg=;
        b=qz876qY5iXvUnP+gRm5CxhlSkKnNRxRve7IXDgRb4kGO2mzF9B5jXH2OaXUR23DjfR
         v7o9kPNMyAEhk0rRVMJpMuD70xCNbBNAYIfYeBxgzScx8CHGaGxDjGb4+QqXmhsibeLL
         ovl+AYzl2Re5hJk77oIWTSZhxCMY+D/Bmg32buso/NTjb0cYrjGMEArmoSDQIuvU/JMI
         5p3aUFE68Mrp02uAsOk8uYN1ixQSsRVpzQFItGyXWWIG9wqCbnTYXkmqXtNUfzxMecv9
         Tg/Yy1QKd4WYPypzoD8AnPR3NWcZ76bgcJQNA5xaghdFVWHyNcA3kMuEljPW8x8awKL7
         NU0g==
X-Forwarded-Encrypted: i=1; AJvYcCVQl2QV1ZsBPE2TJWoT3QQlIJwKM8+US0kZC0M1D4APK0M1beFaFGCrb5y3aTv4OY+5CdfOKixMLOZ7l6P7XEMk@vger.kernel.org
X-Gm-Message-State: AOJu0YyNSbAbE9H8ZbRKRK/7ZylICSSzPxDM7CQxRpXEFdRCLgPjkMIo
	z2utJDSjFs4rr+1pAwDxQajoVyy5emiPEMIMuEzRsP8TJZFrGP0Nevs1YQqPRkcVeBZ6Lxo9o5p
	xiCfg19bRsd/VDRCgaxf4MXer8Fjo7iZxn27qMCRMHd4jlKCTihGHPnU2li+8ZuZamMOl3fgu
X-Gm-Gg: ASbGncsdRy18k3wAqjScqaVGblB/d8Q6WrvGy5HLd6Dv11OPN1XbCcYhbktonHcWGVB
	YNr+zakkZjvSIjgo4p7UxcQcE5WvVC6160bp4rPJ0Tkd/gKVN9hshgmyW59EFHsqADIxSmQFj6K
	LrAlsF/myONTyly7vm0WwrCFixVNZMP6FYCdW3Wr7O+lv0eG4TRFwucamWB3eazr4i4/WhpUOIh
	vHGSicCbNhqI5jkDJOhuTdWVqXS9NjON/XGVPCzPovoch7vzCwrBF+kvsvRzZDTKLLVGGswphIu
	9+r9U6NW/X+vqk/t2+eRrfcs1RtFk6udh1X8076X6vDjWdVpj5IZ8F32X829FHEdrmIzbkWU45U
	OriXVazLhXITfDKbOaQ6oqcBCo3F9t1ZzqOl+OX/KR2iN3HzL6+qaJj5Gmw0Hyb3KLA==
X-Received: by 2002:a05:620a:4490:b0:8b2:1f8d:f11d with SMTP id af79cd13be357-8b341bafcb7mr4289439585a.2.1764682084016;
        Tue, 02 Dec 2025 05:28:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDne9RM5gYuYyIL53Is5J79nlq/wsUZ8mDjrDMvIP+gfH9ZVz1YXpUMUnVdDE7teba51LEBw==
X-Received: by 2002:a05:620a:4490:b0:8b2:1f8d:f11d with SMTP id af79cd13be357-8b341bafcb7mr4289433685a.2.1764682083415;
        Tue, 02 Dec 2025 05:28:03 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a7afb4sm1500312866b.70.2025.12.02.05.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 05:28:02 -0800 (PST)
Message-ID: <bb6f83cc-4f6a-44f8-9997-fb91e7c2b4cb@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 14:27:59 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 0/5] Define VDD_MXC for SC8280XP
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski
 <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251104-topic-8280_mxc-v1-0-df545af0ef94@oss.qualcomm.com>
 <176418784438.1591314.8587929353938909456.b4-ty@kernel.org>
 <20251201201440.GA4041208-robh@kernel.org>
 <CAPDyKFoGQJA5UY-96HvfoA7WMb5wYFXFFfFREpMmK29GE7-Nag@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAPDyKFoGQJA5UY-96HvfoA7WMb5wYFXFFfFREpMmK29GE7-Nag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: REJLZzvoAxIp9ZXkATHr-KU4GKkh_8pb
X-Proofpoint-GUID: REJLZzvoAxIp9ZXkATHr-KU4GKkh_8pb
X-Authority-Analysis: v=2.4 cv=fLg0HJae c=1 sm=1 tr=0 ts=692ee965 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=Dp_8vvBim0L4lL-PpiYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDEwOCBTYWx0ZWRfX7DOjdw8rw1r/
 r3AJj99md0H/vvikIxXpiXSm+di53j56rKYCqrquagGQWlUl7alBeKxE1HQx3EYXHWmr1vhKG8L
 cnbcQztnU3ltYvRSunl99d+uYVdoO3e8Vy6RQNR3CW1NN/YVISAjeWbmsrYkqgc1WpnuMYz/IX7
 bGzMMVOtWXdVJgfMjEEZcKbceTYL/fDWnDAWESBNnNPPtsgBKUwsLPA02i2l4H6ZPESyJn1fUq6
 5blEzzXWVyvciaYhH4L4fB6lpZStYgcm5X0u4eLdQReBGEyBpizafbyVtofvSQd4X7OVPlWkG14
 E9Z759+nfRXgPPmo+MekgzTx5ewu7Qe50Xzip4ntkTuD2QxkEt3UVqafnbYyum8j//+MsIRHHfR
 r7XALopKTffG3Bcq72a+kiC6djTZxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020108

On 12/2/25 10:19 AM, Ulf Hansson wrote:
> On Mon, 1 Dec 2025 at 21:14, Rob Herring <robh@kernel.org> wrote:
>>
>> On Wed, Nov 26, 2025 at 02:10:41PM -0600, Bjorn Andersson wrote:
>>>
>>> On Tue, 04 Nov 2025 20:31:05 +0100, Konrad Dybcio wrote:
>>>> This has somehow been omitted, leading to potentially stale votes.
>>>> On the flip side, the domain will now be powered off, which will
>>>> uncover any omissions we've made in the DTs so far.
>>>>
>>>> Reasonably tested on an x13s without pd_ignore_unused (camera still
>>>> works).
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [2/5] dt-bindings: remoteproc: qcom,sc8280xp-pas: Fix CDSP power desc
>>>       commit: ca079ec3ebed19a12c1bf080496dacbc6fdfbb39
>>
>> This has was picked up, but the .dts change was not, so there's a bunch
>> of new warnings. What's the plan? I know it's separate trees. Can you
>> please take binding and .dts changes like these together if there aren't
>> driver changes?
> 
> I was planning to pick up the driver (pmdomain) and dt doc changes, as
> usual. Although, I was waiting for the discussion to reach consensus
> around dts patch (patch5), maybe it did?
> 
> Björn, perhaps easier if you pick the series via your qc-soc tree and
> send them as fixes? If so, feel free to add my ack on patch4 (the
> pmdomain patch).

FWIW the part where the CDSP power-domain list changes still applies,
even though I was wrong about the CAMCC requiring that too..

I can resend if needed

Konrad
