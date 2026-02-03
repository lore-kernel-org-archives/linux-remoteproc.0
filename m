Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1D1318139
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Feb 2026 10:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114401; cv=none; b=kpTcAc2jGHFDQHTxf9Nm0FxF7dFf68YeF9E7pC0LG7svMFMCtU9mxsNG8DOSWUPMXBifx3WCI/FjYo+OqhsDBE+dTm8z/B5iEMn4OCegwiZrfxHt0AU9AHhn8oTeQg21cPxnviA21zQmncF6Bnh4mdKSk1oJwIJ4mXUgNUhKmHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114401; c=relaxed/simple;
	bh=16/GwJbSkE5/JP2RAIxk8Yz050uUv1ntm4e5GtYsgUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gnwmYuzeQiaR6ffNyBgpk+0IwlxETOCYyAXcCfBFbjlfWvqX2/EVI6nc4FG249qrCFj5LgBZlDL5OWb0QFVSOzKCKuTQms+rAsPxDOToEffrKDp3bZ9/C9V3+Oul4/ao9uTGyJ+LhuP9t+W1iwtwvvWG5kA10QNGiQMatjEPfUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0XmhYZj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvqPrB7W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0XmhYZj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kvqPrB7W"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613AFpxb3388084
	for <linux-remoteproc@vger.kernel.org>; Tue, 3 Feb 2026 10:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mOypfIEDDwh9J504h/zGHB9o7DyYTIn/LffTBkpBEtc=; b=U0XmhYZj3nbf9OSN
	W79UFKkL84xJCjYSMhMJDc3gJrp9FDSnLcIbl7u8XsJlFeK7gkY971tifCZctRKs
	FQJF9+QgPpFfTVqWLRJpGD9uNU4+FTGrGx4foE2DeguRQMw3/We2B67MYVj/KNOB
	0pZ+ZLvniCy6/8F5lALer0ZZcZJD4bQ0gIZYS/SkQpzbjZzNnfKA+qDCykATFyR4
	cXNQaoPNjlh/PXATH5Ns3CLyDTQAawlysr7jU0Ein3jNVVcglyQj4gasVk7mhUXB
	pWMAWfrXowWwo/THv5thRNK+sdYFQMnKkOTwj55qtfV6nl2sMmslhA9JTmXT6Bf6
	1IoWwA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2xvbu3tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 03 Feb 2026 10:26:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52de12a65so106356485a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Feb 2026 02:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770114398; x=1770719198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mOypfIEDDwh9J504h/zGHB9o7DyYTIn/LffTBkpBEtc=;
        b=kvqPrB7Ww3Ke+vb+xC4i/T9ncwulZR3uyn66xyDGKOv4N6Y7At4Xp/Y1tXUJ2CwC89
         d98Y7YTMZOLdTbt+dja7lRbQEjvP3ENJ3NU3aIidPt2tuWRvQ0gtQke9u4G6zzyw2kW4
         o8k70xjzbh6s18c+7CTBT6RTk8qmATndUVYiiy+TLd6iWjMhMeCxbPfsZEj6cw13CfvK
         xbOjsOcl0HCQdWmMog7z656k6HJrecq/491XuHB534uHD0N4YhLTSWfs560eMEI41wPd
         Bl3f55KKT+MDaSDX0DRhcuqSMVU/GkAvycbL/ah4VVHmrtH2JuI2u1nKCxhlY2WdQDIe
         0K9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770114398; x=1770719198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOypfIEDDwh9J504h/zGHB9o7DyYTIn/LffTBkpBEtc=;
        b=En1kyUVcyi0hJVedP2q4/PnUQST41S/NfBt4qtvdtYq1uiwdMqAt1XoxVUle9Nuxui
         DpptS67Bc/xSYjcwtqGdj+oYYgMbcu8IwkoqtzEqg8a6eq8XStd/1j3sP6DKGYSZNgGf
         WXCOLcyLJoErrO5mp6L/ffSEqNQ9cHKd/NYbZM43H5iwPewvhb5PVm/HoKWkjBvgOKJf
         NZdnAwfTLBljirMtSZ8gtFzkoNgljhlBuxGJvuHs878hFGUtCNonpFxNMkNMTsKRa4CH
         +qXPCPlwCI216pj28ZAmAnSCg4YFN2KYU6m71zzQisrehkwb7zIUvz8julyT6reBv/Tn
         SKpg==
X-Forwarded-Encrypted: i=1; AJvYcCWyne9AXzTlJUUZeO04Fq81aD362RrtLXnrCFIy4xWPtIkidQOLIaSn5fd8isuxjWTleIrn3klSj/JH6Ji2ECP0@vger.kernel.org
X-Gm-Message-State: AOJu0YxjkwiiJeau686ldB628IBq6MTwFR2kqJCJPIEQXffs+FvyjfGo
	/4bhHblHzZuI4m1eVXtFWrbYg0qKp8Up8mohDXloUMwDz4TtIaZ8tPfkaUDJYMslclbCGyCUvBE
	pgrDufQSeKAq8TnCOoW8AqydV9eZQelbTvjVYTw1auSLa/Ok2+F/ePYYQlW3845XvK8Ii76b7
X-Gm-Gg: AZuq6aJbO27H0W3nrOdri0u3QENymBCQUNMkFTQAYf7/x/vVZhIldm+lSUrqwzp12Zq
	eiMkonpCHgH5EPCbbjw489se5KtqX3+GkWYkRCnyDDDisKRax+AL2IuhSlo3a3FGgiiHGgo51EF
	q9vM77VmK8tISdEXXlX/cwsLSrAfVhXSnoQ9fs6O2FRwU6rJ6OiMdXSWrDxyN2ldpIcYEPuSgeM
	mapRLKwvkpbrh7IpfygTYH1IDzelJp1DD01ejOIy31OzmvjvsdD2NT0NNsEBUfubAhzoeWBUlX3
	7Bpm2+5p6HMgpjlVdsRdyYNsonPPl0F3LQAJMkD2PGj219QprRpfKd19I4jCn6qhu0lqzNREv2d
	ayNNsXbBgVZlybSufMNXmR6AF9E2GYc4HXcv5TU0RCdgaOaJpdKa+iwH0PJ9vraP9J3Q=
X-Received: by 2002:a05:620a:4086:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c9eb2fa331mr1413240985a.6.1770114398659;
        Tue, 03 Feb 2026 02:26:38 -0800 (PST)
X-Received: by 2002:a05:620a:4086:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c9eb2fa331mr1413239285a.6.1770114398286;
        Tue, 03 Feb 2026 02:26:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeffed15sm989184666b.31.2026.02.03.02.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 02:26:37 -0800 (PST)
Message-ID: <6fdee2f6-aeb7-4a41-83f3-57a3e458d0af@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 11:26:35 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260107-mss-v4-0-9f4780345b6f@mainlining.org>
 <20260107-mss-v4-3-9f4780345b6f@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107-mss-v4-3-9f4780345b6f@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YqUaUlUQ5gQ6vqTUfLuA3PEfsH_HKFMP
X-Proofpoint-ORIG-GUID: YqUaUlUQ5gQ6vqTUfLuA3PEfsH_HKFMP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA4MyBTYWx0ZWRfX7Hdk092zXzn6
 3bH+TaCg9+t72SWTkgXYP+O1YL/vPPfgrQJ3I9CK3np8E/TAZIS3/KoB9pccUveQB72xHCt2JXH
 92ZM/JwgiLxGu7tAIHZtVAawAZJfhlea//x2cHuTBgUR/uxdYuTq0MniRi9cgRVnKmfB+IsHyeR
 /RyA2VT95IKmwGR7jLhbjiRDZUHSMehLjcNyF13hhJFUQRiXOlolvZpF1mQKiC29sRZqVP8HW7S
 FzyP3tmHJ5YcbQ5Fz6Xul7jLOnHQiv+Lu8ws7np5Hd5w9UxNAJ7OZ71piKwuDTENt/r1RyT1BdQ
 l0r9Pdt2bNbrfOPBVcWKAaUS3qytpb1NS+r5NCEAuV70c22tABUj2zOAN0mAFuLlgj/FfGbIggH
 GGriP1Z3tA3OVHYQf9L63Qv235fYE5uJGkVI+SivUCuMwdV3UqwslSxC1RQ7RrX0CmAiyViKF+A
 FKKztwcXHMU5xN5nJ2g==
X-Authority-Analysis: v=2.4 cv=AurjHe9P c=1 sm=1 tr=0 ts=6981cd5f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=j8Cu_9a8AAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=Zc5E96dWW4SpJKk7na8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=A2jcf3dkIZPIRbEE90CI:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030083

On 1/7/26 12:34 PM, Barnabás Czémán wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> Add support for MDM9607 MSS it have different ACC settings
> and it needs mitigation for inrush current issue.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> [Reword the commit, add necessary flags, rework inrush current mitigation]
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
