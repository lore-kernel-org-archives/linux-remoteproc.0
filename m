Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E603161B3
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Feb 2026 10:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114526; cv=none; b=SJQnXlXhY4Oy731l6GXx68g9bjNeIyF3AtyEnI77mRorWr70x3U6DKEPN3gC7+qE8YZQ02TnjMw0cLrgqpoQPIXd9GzC0NAtG+0BLLre4hUN5HimuwrY8wxMce4QUt/yE3uyTk98k8fTTyokHKlkTTKJTmwOOe+ursijBPF6iRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114526; c=relaxed/simple;
	bh=qEFM7daAPsJB3GfUD8Tro22tVIStm7Ar+14i/HI/sNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pfQ9hvOUOl+dEdeFC+25KyoZmT9cg5I4bKCSOREc7AAHRe2ccKf6y/+SR6VQNYHXU0uZr07Bp+VnE7phUfW6V1GNuPTbHGoRuA5sDyV6aJK/fu2IwBnqY9B54qcKScABK1egQwG1Bw/SJ4G89j158Vf9Gbr466w+oSaVC9ZxjR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hkyg21rS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=graTx+mS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkyg21rS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="graTx+mS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6138nmsI848284
	for <linux-remoteproc@vger.kernel.org>; Tue, 3 Feb 2026 10:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qEFM7daAPsJB3GfUD8Tro22tVIStm7Ar+14i/HI/sNw=; b=hkyg21rSCaTK8tN9
	YIqF1XO13sRRKKrG/XwM9PYI2csgViv8kJ+iJT6l6owrOfAgrQSw06WVKYIBkCG5
	z0FYc3faxV+9HlHApTQ6JWCkhqJSRPJVVeLADrsWmaoMCqRV/Y+u6ra1a0NiOJYU
	h+aOYMIC4KQqhCSRtlyu6vb58KcSj7lPudWsJbaTse/EBTTBoX3bkMRDTv+OU+1x
	JotFJe0oGou2am83Ti8hiNE8bpmf0auHh/xEwPQnZRowoM5wIBHAZVZArdy7QEFR
	qVQt2h0Em7C/sgJVWug0dmgwUfJhX1zoTpsQGk4hlr/5261/9ZkJZQo0g1pTf/j8
	vGslNQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3dutgb26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 03 Feb 2026 10:28:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c53892a195so86355585a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Feb 2026 02:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770114522; x=1770719322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qEFM7daAPsJB3GfUD8Tro22tVIStm7Ar+14i/HI/sNw=;
        b=graTx+mSZXUe5E2PON9MFWCrq4O+bONQ6bvWp5zacm0/6eRNPkuWdn2NOjMf2wy2+s
         BISfDrKb1GgWzsP2s1frlYAdnRgOFPUGCZQldengxHIddRY7E/jsx/7TtvycHXe1itDQ
         2xgtE6q6FTvkKODEr/ZCAydAfIilAMSWKuo9e/FG/pxVH/DP575namMjhxVpu5b0KXL5
         +hOFttPZGDJt6oZZKt226zbhrLm/r4NY1p4ix0UZj4EpP6pWSbdyqKRWSLU4iyTFh6Aj
         M7sfoFxU3ETBZfIX5GGzI1woeylX/glAcrLRUtPUM6LLf4BlBSnyHsD+AxmD8ZUXn+wH
         nIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770114522; x=1770719322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEFM7daAPsJB3GfUD8Tro22tVIStm7Ar+14i/HI/sNw=;
        b=BMRaPfbx+fmMLG0UH+03sYWPvE5DROTorZewa7l4zr7mN52Svw75dkcSzaGuYjI0tw
         6i7VAZuYbRYe1aOzVKxC5OdrzP+82xUHdj29AW2OAiqw+aeEWHEMuRygxmpGFU/5OMEu
         aJCldjOExnNFufWPqAjx2myTBa7D9103Gmk/Shm+GMZVKTHS9Mqdtlan4QHC1p65tx3B
         RQIm8YvsTurjxmkkTzkHMabveovfABHV5OH8uI6NQK56AGd3rKwoWC3g2skRAISFN7Gn
         jJ+tKPGVHmmuVC1c+so0kifRr3PG9cuVOHojUJbTlreHHKS6yYse6ppMF9DEVWj2gMSI
         7GWA==
X-Forwarded-Encrypted: i=1; AJvYcCXv9HVIZYYFZn+IR9TbbrdxRQN6GOTOcrJVjoZOnUefnMHCA1bB7Kvuu3yncsqeMUrrPlLP2Ek6gYa4xDzjqBvj@vger.kernel.org
X-Gm-Message-State: AOJu0YyhHXMYD59ezb6rLc4kzy/JTT2MPMf0nGn1lG+1B2NN6EnuWQIy
	rFExD2FGNy9qYYlILeW7vE2MyIKit0/Q7HDK9DxfQhZiSSy/kF3yi2laizyG7pR3LEGj7GrMBRE
	R0EgywjoCA9TrDqGRa5KaFvNybnORp13ZnFRRv2vZv66w/hyZ4zjNAJxU6wFTbA/Os7gPc+JAMZ
	5nlKje
X-Gm-Gg: AZuq6aLcO6tOFrMcitztethAXZwSZQsTKKAWT7u5B4+5/R5zy59AOgkYzkt7aFOlvlp
	+j/vw9rt6DhVbpASUTeMABEtZ5qk6rUBHVZ0A9uAOUwklLuKxViIYuSRh+flAYQLbRuEMW9EH1L
	YyOjXAu/DNiVyzA58gnwDcF2xxvZsPYvFXB59GjOvzMiPnP7vBmRQnm32mKJ++nOaUgaS9RSw25
	WAPjrttrFptSGzhrFfK4Ra3uVFi2/hJR6zFaBq2Qgmtho9MZxgIroy8tf0Yavh0jWuwOjNfYe++
	LALwQW1du6ttmG5QRSSlBm+j0Rxsqf/wspvsXs42vmk8lGfcoT0XvkWTSbwkDrqRrGyXLip8tqk
	HFV9EHMWCm43Jk+yYYtmB+d6WLBYzSxSRYlBd+J4Z+ywpgVL5Ggk8d/nxBFk3Mb0ArYw=
X-Received: by 2002:a05:620a:7011:b0:8c6:a719:d16f with SMTP id af79cd13be357-8c9eb277e82mr1456673985a.4.1770114521892;
        Tue, 03 Feb 2026 02:28:41 -0800 (PST)
X-Received: by 2002:a05:620a:7011:b0:8c6:a719:d16f with SMTP id af79cd13be357-8c9eb277e82mr1456672685a.4.1770114521501;
        Tue, 03 Feb 2026 02:28:41 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbefc56e8sm1009803166b.15.2026.02.03.02.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 02:28:40 -0800 (PST)
Message-ID: <dd590fd1-cb73-49e1-8df6-4b3d5c57e053@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 11:28:38 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] remoteproc: qcom_q6v5_mss: Add MSM8940
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
 <20260107-mss-v4-9-9f4780345b6f@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107-mss-v4-9-9f4780345b6f@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA4MyBTYWx0ZWRfX/NdVQsgKFRT3
 q4kaDPtn2KY7rfTtR3iN6tnJn9H3Fuma9XBGwYa4l0eHb/cw3KwWfYC31qGOkmUi1O5uGIWfhcL
 JXToRzo7ZfjXlXhpsjX1qkAtpg2aZXsH7ROrvUgZdZ64oFN9MIWe7LETVt6UUzsqHbSiD7LnNxx
 5A23Q3bVwGCTV2cHfiiH0TicjEO4DibNJAoQ+/Y0MzVVIpCVlF5UK08ECHZgwZglkZPN0mB3oiF
 KHDSKISGGFwUQbPremO56qeQgq6xCYUpHoTTGBtE89gtP6xu6Eod2mgSaH/nMrZMVcgSs5Qi3Wc
 fFWH85rPakowm3qP5eMymMinwJoswKb4sXGNhdFXO5gSDQeqaZ/lRbTAS1j3qXLs7/uo1FQStrJ
 d9ptWsBd1CYaUJ0DyQ3KyXa3sKsXajuT0MWDSBsG6f8HnVX6QUg9m8J2BY13/HydxOXFLEg9CUl
 Xh42u3//7oIy7SEf14g==
X-Authority-Analysis: v=2.4 cv=FrgIPmrq c=1 sm=1 tr=0 ts=6981cdda cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=06MASDJmLU4VXX63p4MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Sr5Dc6LrD5zDbVYR_0W1Nmk9n8ehy9oh
X-Proofpoint-GUID: Sr5Dc6LrD5zDbVYR_0W1Nmk9n8ehy9oh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030083

On 1/7/26 12:34 PM, Barnabás Czémán wrote:
> Add support for MSM8940 MSS it is similar for MSM8937 MSS
> without inrush current mitigation.

I'd be curious if we can simplify that by skipping it

but

I'm not willing to take risks on skewing away from the existing
well-tested init sequence on a black box..

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
