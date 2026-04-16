Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C283BF69E
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2026 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776346427; cv=none; b=cV32QRoim2KKhyNSx5vk3RYrlDPHhvdqiYv+r1qrvE0qnj1IqEmgLjlVy/5JQVYylvgEC5SBejma1dHJsDvm0PqX4tbiw+2En4QSUr+rnhxja9MK0X/bprCqFjQ9g51aRp/VpZGw3MRmA4x/TTLAPfaUdSdN2vN6seRRGM+2oPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776346427; c=relaxed/simple;
	bh=0ZaLZijLXXD3u+xQiSHAIo++4vJ6pw7HiIlwbtIi6Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u7OD+297B7AAPA/LEQ4omYPKMQ4kResBZMqTdgIMwoi39CjQY8VUCLsOtD3DPJtQlRI96DLZuFb6hKAjMY8DeDpA8wXLEiinksRyr7G56N507vj1/Mq9zjEGN/DzteO7R1sG14NpdI13FhO4QIQjR1LaJyyxUK5LxxC7MfoDlyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKzEQMnc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EUdwCwsJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKzEQMnc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EUdwCwsJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8Wtdx3089293
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2026 13:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXaFwYu5q9PT2J3pfkVA8q6GTphn69FAyibCCzM/8SY=; b=GKzEQMncv2jUhCkz
	x+Jg4GUf/bac1n+cAcQmsTl2XyS3PKp0Puq4XK8lcYTZnUDDU/3UbxK16JHy3Te2
	l9V2vkhJZ8S9pk7RMdBFvicR4NFbQygDQfavuwRHQcjEYRPr/6CZk6SYDZKST8J8
	6Fqv01npF9jB4oSSSuqC9E7hmJ64AdQbZXB/OMikK/2wmD4qC8ZFnDdIn6+Y3Qbo
	u0UulKkCQfCyGTLrBcy6L2DNerouofQ3vOl8tgZ/quKkae9eP1RSSZLkTMRpL4/p
	FmUYrZwI5jmjfUc8o18+2hoR5yPhsTnQjXDjQyaotSQZPmyNkUNENNDs2og3LAUy
	i/Ak6Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djp6aa9vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2026 13:33:44 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-610672f7120so355933137.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2026 06:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776346423; x=1776951223; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXaFwYu5q9PT2J3pfkVA8q6GTphn69FAyibCCzM/8SY=;
        b=EUdwCwsJ/kYCxj8mqIXR87kbhohptaD/5umvEyC6tM2nbhAs3pzqX2V9FobiSVea07
         JP5B0ImsxYTIGIWrjKjbxe/iQRp1van6Oqrd4yK958vQMbgGmeGrNd5BoqVLoVKrC76T
         p2ZSSKQTj9Ev74dBzCm3GrCnEL+0a62WRYwnjB08gmIzEVSUHiuG1t9SH2SRO0QvPSL1
         Y0s+DKh7OHJyhn25MjOmGKyuIqdunwF23raUf81B8ZH9BsA2kwnVkirwD9cCfxERseKa
         UR99uAioKngAbNXnKvbXiiilnc8i4P7d5kl/n2YuY0Xh0Wk0DHWeHe0MP8UhQCoDuS/E
         onHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776346423; x=1776951223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXaFwYu5q9PT2J3pfkVA8q6GTphn69FAyibCCzM/8SY=;
        b=KZcWRhveIlLFyuxQ6/o2SwgruP85J/fVdeR7m1dIC1MpDI5FoM8IwJtht8BQiWWYRl
         0CEEsqX71g4bL7kh2uE4zbZDpgweq9tCjw/U2eC5uNZAFJwlXwFzpINEIVQSBOQZiS7O
         BjZjBKB0xKJP6br8GZr09AofgS20nYskUSEBL+CpO1rMfGn9TmZiTps3MYgsyHe8In/C
         MmTerwbShpvswEHGFYChcmH4Wk0j5/yNiJx61ymZqdVXvacqbawgkEtmwfMHLjkfJaD6
         g90gKRGyh72u45Cd3jbnkBHgIPjkiuCYRO7DkPvfq5qzAYfH3Xhs0bd5+0PrP1Nb7BJA
         iJcQ==
X-Forwarded-Encrypted: i=1; AFNElJ9M2BUwPDLQuEwokdY4u7Pm8aq9PS2Z/537wAD/RENgY2E3mpQvJN1Qw9f186XgPr+zyaQ75/9s3s9DLEHGreya@vger.kernel.org
X-Gm-Message-State: AOJu0YyR8p+uGGQP2Sz/YuJR3c2cFtyfiy5E3UuwtjQ3RjtzobttT9Vs
	vdUzByh84HQzm1tvXiOOpLfoqlEAM2ADT14vgUyQLfw3hGhu+QJFjAMUMwU6Wls7gb6NzByFQK1
	KE00wJOtc/vGzrYSALZG+KvD0GnMZMi49nioBouUq2i77LkedutAPLNgxQbVvwt7IaeQx1mf+
X-Gm-Gg: AeBDiesZuEQzj9vsNcv269u4y/GbR1NsezR55jgiec7dlFfaN5vrgofQCWMhG0AjM5T
	GnXywpkVLrbTw23Vzd6MeTE0UysZmQsFD+VeiOKNyKqrDX/Xty1z0LfmSpESeTjXRcLnyo0Yo1s
	Nz0IVoZyXeY99jNNY1IajjU6KF5p1Zl7jfXOlxj1RIlakXYB06EFHuhIV8xmdCXHC0+UCh9T5O8
	2J0F+362kF/FaYQOoo7kfD18PkrTbjAlMQak/EOYbtafpQEMxU0M5IkvREJtbiZcJKCNDEitM1p
	xh0pTIk0rGLc/8mSkRZuNehuAAEV4M0dtLSVvLsuZW5gb/98hcth4XQlNeoQ0Pt6C4RLCvac9Wj
	Yi3kD6ZOToEtoqDt92nIfNwP9iIUvosxZRx3cO6VflCzcH48VmPgjwQqL4Sd5JCwStRZTjlzCLC
	Y+k7ksUqznvtkDQA==
X-Received: by 2002:a05:6102:30bb:b0:610:6eb8:3f8d with SMTP id ada2fe7eead31-61417a43179mr322632137.0.1776346423525;
        Thu, 16 Apr 2026 06:33:43 -0700 (PDT)
X-Received: by 2002:a05:6102:30bb:b0:610:6eb8:3f8d with SMTP id ada2fe7eead31-61417a43179mr322603137.0.1776346423119;
        Thu, 16 Apr 2026 06:33:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1773c3c96sm164875966b.36.2026.04.16.06.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:33:42 -0700 (PDT)
Message-ID: <68a12065-2811-48c2-8aae-95688bb2044e@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:33:39 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: msm8953: fix modem pm domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold
 <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-4-6098dc997d66@mainlining.org>
 <i6lymgal5c62ud3aas3qvzv6fjnjrzuncguwechraahmflr45l@5t5qli3k7npu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <i6lymgal5c62ud3aas3qvzv6fjnjrzuncguwechraahmflr45l@5t5qli3k7npu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tuoDkXcLfhOqV7-KucZx5qQ1EgLK6HxD
X-Authority-Analysis: v=2.4 cv=NuvhtcdJ c=1 sm=1 tr=0 ts=69e0e538 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=T6802ZzQLFeAEQQ1qNIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: tuoDkXcLfhOqV7-KucZx5qQ1EgLK6HxD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyOSBTYWx0ZWRfX38LeXUwvJHQx
 G6jJ1Pe5I7BMx5L+aFL+VMU7D94XdXttzJ6gprcrUU5G0ulX/kT8Sed/NHwzuKYVxYDleJ/Vk2h
 qkfBh4JBTkjpFovkYODLkPhdbKbuUsisllhS2e+LNSkRaLvQtoWmAthriPDBV45sM6CArQwasjG
 gimcsgonYitud6URTalllgVsGYjygdvIwX+90BJg/DfpLu7FdoJV4Lzmw1IlMqrhdMHYiAlTo4A
 neOh80fvdXUdHERZ12vAMak6XpASddgiw89nd4qU1TgBfREvHbIWgpWP3rohAh4V78GE6dkV3D8
 1KjbFjUqCs6R4OG/STQ9Y5G511QxRkvmai6C3en+AWCgnN93JVgM6D2a2Akkc0hh+Yzo7kdIF6X
 O8jnzqL+liO4H3V2c3rPbuRdcPPPQPOKUMUraNa5kOtADbJfTRyEpw+ooVG6/fmvxHvi30NiNqN
 kmD2tmAPIt/MJBSO4Vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160129

On 3/27/26 9:35 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 27, 2026 at 09:11:46PM +0100, Barnabás Czémán wrote:
>> MSM8953 MSS is using mss-supply as regulator.
> 
> "On MSM8953 MSS regulators is controlled using the voltages rather than
> performance levels. Correct DT definition and model the MSS as a
> regulator rather than a power domain".
> 
> Also please squash with the changes actually making use of the
> regulator.


+1

Konrad
