Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288DC47CA79
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 10:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145246; cv=none; b=r9onDD16/LMVwm2kbQaIAe2K7cRUgcue5oBci+qROZcnIPF/5NqRoEm8FJrLZmCB8TE71p6tR3ijyvvoLcfy4/UhWmPsxqgbLr6y8rhqNk2Uc9Ys6Iy0Sgdtg6I4uuldcI9nEdLzr3aBCelK7vdzI1YeF4+WZVl9uYPt6YMduUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145246; c=relaxed/simple;
	bh=svnknxrvxPFY2XhHHB/7UYk5zvriBKO1HYflPEGoWls=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EmkVDULDi8BqkRt8K+Sfy3AaNG2WwS+mMhK6t8Aslgbc5pIhoakkQT/bO+RevdI0XhuDzCZST4yN6/6XieYYOPZSvO2XL7BAL87/1irPYBkYNTvjxdzmyR9ibdj+UscVDz0ybXPgr/mPwLB6N83wiGfhuD6v6W4LnMkw3kyT4rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kg4flyau; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZUficEH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kg4flyau";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZUficEH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lw9t2219131
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 10:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJlytiMq5O9B5oYpwl9msTwHluCBe8tunjW7J/SptPM=; b=kg4flyauA7YvAGA1
	jUkKTAMXw/CPF+ibJ5mBtCM0lCB3T/mgWwK5NzgGMUod8oXD4S/8hR0yKpDAJTP8
	xpgKweJVxIggcCVA4eybqjPQJcOb9rGW9ZITVAFSCvCiRnqzNrVRdR9Cg36x0fII
	AsQI42QBOfQl20qTA852okbLuZxS8Yxa9FqinMVjDi07j9tWzvRd7YGjF1evbqGy
	Bi/O6ZOoz7atiREFHClHWuPdEpi9V4hhFMFikj5VFCfMv7/Y0y1W4CBZh3DQDtpg
	epDN4tO0BcHte9qWpflDYaKTepK2pEe29Jeid8l4xAPZoEgyaU1xO8ozeZSuzFnZ
	MGfWoA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m3wwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 10:07:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso95335585a.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 03:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792145241; x=1792750041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJlytiMq5O9B5oYpwl9msTwHluCBe8tunjW7J/SptPM=;
        b=cZUficEHSTOEaqBtnWYbpplQBEw5S1faBKZ1FRccMXLUrykTtaSReci7+2cUVRcjQ1
         ECmcmcpWZe9kLlGyq+TZvEoDWo2lYARPZ0ATxSkAfZRWC+zKKsL4KX5Xr/nl1I5RXYeb
         mh/joqrvgJWcUYbYPI7MTUACxvG8jdQEAqeMWUotX9cLhMDZKRVHV9DJgvTP6zcjut4B
         OVP33O7HtWMMgw/d5quEaGvy9rj7480DpkyWNAfzu8TwxDAAmep4BY9SB5tGeQusEQVP
         d3Tsu5mYtZ9yQW2iREFXLPsNszO21schIQhsgO/+XwYtO3eWFPUpBbMQLXeU8Yg6hlnH
         4SVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145241; x=1792750041;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJlytiMq5O9B5oYpwl9msTwHluCBe8tunjW7J/SptPM=;
        b=UNagBGoMAdNICxRdsQHyda4uBp7cG3HbOhL4dyv4B0I64ThkNgOehFltKG46KNXLZt
         P2KKUXZcMZsxb0/Q1s3Ch0F66yMknWNL+cGLvXGgHr2cuqBJIEFcPY0/hZMW8AlmIHnT
         cgU4xkuLx9kGnqtABrybP2JWpHfJS7bEs6SscIRJIIUS7CuUYSzKpa3OsA5OLWwPHZTd
         WUtUMCA9/YIxeg+Revo4Zu7p4+kdrUhUbXsuREcRBFXHLMUwfZgxhJGbbXOhUEE4JDLG
         fD9DEFqfWwJJ3yAGTQ2NYQKea0JdN/dannTHodCc7HN5NPNlP79/ekiBwJPCAA/QFlrL
         YdMw==
X-Forwarded-Encrypted: i=1; AKwUvBwjuReOw2z6bVB3DaeuKIWngiLDeV4YEFp5E3VdjLOmC7h930w3KaommKou6GPH/MUdWCMHI0YepBfJfcIzYXpb@vger.kernel.org
X-Gm-Message-State: AFq9FYIKSnpEKW6q8U353O47MZlQKMoOJLL1LwaDqEFy6rA2ljiBNqXp
	KUMCqGiyUDSOslI4k6rcmmb4b1o1FiBEnbOmYz5PhxdXXEIepRou9t5GOhxwxCvsSlmimD88Q1f
	jlX8ZUBxlhLS1u7wBaHvdLbgLntlfweRwxGTniRTPlQ7TpWUQwTgqEBWVOkzSnBJO1kTil4MM
X-Gm-Gg: AYBFou3ZmvJl4NKBz8IvimVx7OcJAoWQA879iGkNZe8+kJnGtAiHK7DBXjX1wEpU3lP
	ZRuKgMiXlaYrPvU/TTMeswenln9dy338mw3PYupy8ZGgrIiPvM/bLBBaFQD1ow6TIEFIXjf6h6a
	KnI1pOykfXz5xy/FKG6KXBbf2E1bt1krSRZ/UjbzyqdwMV27nApNtIm4Vo9NUlBLSOKTPFjTTX7
	a21vzqBxxktm18qABFBngDr2daUFW4WaVvMNA4lkRNOWQqfz/s6QFps9YHaNwlPbGxh7qLnWKpb
	WKAkfpip3ca0/jqF9TFmOIVUiBA2mi6lCV9kabaNBH9+CaFazUZx68SIFUzv33dzr8Df6rqoc81
	ePAwaf2EIkYmYxkWuR/aDTA==
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr3865353685a.6.1792145241152;
        Fri, 16 Oct 2026 03:07:21 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr3865347685a.6.1792145240560;
        Fri, 16 Oct 2026 03:07:20 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408b4a85b8sm58824166b.0.2026.10.16.03.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:07:19 -0700 (PDT)
Message-ID: <bf35b332-1d7d-4c1f-9347-dcdc3ae5c7f5@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:07:17 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] arm64: dts: qcom: sdm670: add adsp
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-8-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003175659.23536-8-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1f759 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=UiK73t45R7nl48eyPcwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: BQB8EB8tjhk1EzEckdG9pwt7iC51VxXu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MCBTYWx0ZWRfX96SxrqYxRnUU
 ++TEdFYvGpjPZbl1QrqvKAkjbqEZNUIrXJZKjvwDHBYC9+l8IjXNNHwXMhBJVoQY3TuFJGM2jo+
 jZOewWowBigZtCI+zx7GhSy8Wn2Ms2A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MCBTYWx0ZWRfXx9x+TyEC8JTv
 OGRv4FM5haSqCHO3o0mxkR0HfmkzAwVW7DcQAkn+KB/BjcwvMVjyhVQ8md7RZtMkKj5HfXlvG/i
 2QjS+fV8IeJnwOUJWPNKKj30MTWcLDz7f1lfD94byEk9FrA6XcK0Jyz6tBxVaYOvI7XlP2C5uH8
 lqwSu2Aa00t7KWMLPHP99fCnhEuIUuNoyaDVOd1SP3MzNIfJ5HToHI3jd/ep1FUbur/6jwsIROv
 FPtuHV43VKKDe3oO5lMGLsJgx2oKi/oRRhM18KKjendhAEUz/5zkII7qT68D3eX61w0QiCHcyH+
 Ef01+bSHbGv77ns6Uyk5k5hF+DnCXM9mTqinmSbQawJZTNsKSdD4l3jiAT01F08zrTQw/vQPs01
 W9vdqqGkT79NGJrNQDPS59XZq/Uh8Pua5/+ZENSx11+7myLQeUjqUQqMQ6rCS06amOHVHzPQc8e
 QLUFn4l2bd3dvTY57oQ==
X-Proofpoint-GUID: BQB8EB8tjhk1EzEckdG9pwt7iC51VxXu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160040

On 10/3/26 7:56 PM, Richard Acayan wrote:
> The Audio DSP (Digital Signal Processor) is responsible for audio and
> sensors on SDM670. Add this, along with the SMP2P nodes used to
> communicate with it.
> 
> The sleep state is included to prevent the following crash:
> 
>     qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal
> 
> Otherwise, it is unused.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

> +					q6asm: service@7 {
> +						compatible = "qcom,q6asm";
> +						reg = <APR_SVC_ASM>;
> +						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";

1 a line would be neat

> +						q6asmdai: dais {

Please keep a \n between the last property and the following subnode,
file-wide

otherwise looks good

Konrad
