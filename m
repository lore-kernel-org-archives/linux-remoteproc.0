Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EF4394783
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 16:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785430409; cv=none; b=kS5xH9LXDLWKIdYTyhPPfcIkgVAXFSDhiQoQKtojItxRFqr3vNnJBTwl4g8QT5B7htoodrE8hJkuFe79G9lG8OB5zwgsT6mBARzPOv5LaI/JPuJ2FizpVXz11SgmiUXskzU8lXP0NAVjae7SrrzGmIjA2k4MkV/4ZVaCtqE+rKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785430409; c=relaxed/simple;
	bh=lsh0IxQXOOgQbNnH10YvgW1N3cCLJtX/jZvaD3IAlhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVOH2n7MfyHJHkR6sjONzgHNNj9edqkqvq7+unb2P6ASp14ArJvi7D5nvAkPUKlVBQMgdjgoH39BKgz7HBAiQS8aCNJXM1PEHoFbrc6ErvM7xPVNg/P4CimFlh6m4jZdQY7PhMFC48ddn5KRxuJVwOM2pVKRxTY6nUwVQE/Z2Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TKVl6K0u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNeFp8vX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TKVl6K0u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNeFp8vX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWWCY1377335
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 16:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BH4vo42HystURrWkRuETQEdEA8r0spbsXweM76sahMo=; b=TKVl6K0ufHC7kpJD
	iHroKTNiKhqR79c+Gk0CD0Iyh9xCuc8m3cgX2jWvq6dv5qFbrHR5/ltGI/vN1e/q
	b1cpILgokT//qO2qJBRkDZXZOfct0nkszDYTWQjmNMGFzC7ombqneEEXBIaP7Sdu
	BCkuSRy1vArgp7KL9dNZ8sj8TFIZBDUuJCMgeQ+4HYqqZVQH3NVO3qxnNgzbULbM
	tatG0juc5rYUxv+OuMUSElMKgfKdkmNyQ/Kj8+iwGtknYer/bmBS5NeHHTnSaQQK
	H3+ILonPbgwnt0fHfGBG12CXOOKTDdG7y7MSJR1NL3MLtTHg/vyHVqr0dTkEL+yh
	GwOVmg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8jmrrg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 16:53:26 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7f5b54da461so566947b3.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 09:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785430406; x=1786035206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BH4vo42HystURrWkRuETQEdEA8r0spbsXweM76sahMo=;
        b=CNeFp8vXvoXVHm6m6e9sbD5E1Rid3pn2FlNzB6apVbjkXyt4LMjmZDVj7kmDJvQ3pL
         IOsoKcwqatG72jPXSFss9oUgy+DqNZ6Jzun+0DmFbQMf9a0vrX8LIui1ELfO8BioARNI
         ktUMLokgqP8qbtqx8B1RSwUggpKT6lcvh27uF26hyq/ddSpt7sZSIsOqzPwEw7NJPwXk
         21OgQCFORaLllOanFdrymYOhrDH47Ip9wkx0HfN6aKn4ZcEDWzc4x758Ejw0qgo0XS+p
         KwLaphXXllyyIUY8k8RRPyZGCWUuXzZ97QfYJyWsthtVnfYZ9/yvgUqcj2KMsfHwpgdN
         MJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785430406; x=1786035206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BH4vo42HystURrWkRuETQEdEA8r0spbsXweM76sahMo=;
        b=YpHVpoBrpqK4wFOp5vG6Yd6dW7NuVF2U3HEyomOzJU/dFpb3eZQaTipjX3zhXZZ1Xe
         iC/6qymOY3uUvNFEvYhMSJp4FnMpxdntiy3wVgqV7QEC7XA9BDlViBN/1jUNq8IPsSg5
         Ykv7gQtEy6+RY/fAODQKLNQpmhRlVf6gDlxRNrPQOYm91OUcJ/l/JKOx9VBuJXHsugbd
         UHyTmsviOTyaujSiKGPwl4MFnkrkMGbsBFbLVzb0WL7leDFeNS6N2mRUufZO5sjyEb5v
         NKw/5juvO1tcf7zRvu0vwxnKR6HOJV1EvwB+QB7asxCKewHemkiIQQr4OJMlMyGW+7WH
         QLTQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlH6DLbhrPZGGwyw28w5SrkmBAqH/JIHE50qLpVk/Aj+bjEH3hrFsoo0wlNU00p3TnrM7nn3LYqFUslwYFtbMN@vger.kernel.org
X-Gm-Message-State: AOJu0YxW3winf+BdjboYCYAGxNYgsxsB+NANrdPmrqkuzJQmOR9duwbS
	DNhCSmlvny+YA8ar4Ca2QI4CJW4imFuUL3IQPU7v3/Suk8lzZrTz5dgyItoN5zIfJlOp/lG7bUw
	faasAjiaFB+/zPF3h2YLx2wbRwns3jFJbtiV3+cDjFFFfKhhv9JZW+aFYfg9rx6hhdxD/wMVg
X-Gm-Gg: AR+sD12wmzojlDWWSSxeO3cVj5rDdVC7IMfKBHfBrBu0hgP/J7BkzNjrNILjd81pGhJ
	SxcdOysfH11bxHmuhzaAlhPC8N0tZI3CO8rcRnmdPKQ0OpIa8LXG30xL1OgO+78TEBS/Fvxfd+O
	9NzG8DMBrV7z1rsVnrlQRW5Eaw/kItLkCLW/kGvDUwM/2EorOX4V4iDS4VuRoUMvvKV/dcCzS0Q
	gsbYCYaPYc9Itx22l5VoJBMz3PULCefNIi2p75F4BNiqtaNw1bmgwdTBAsvaT2VBdiEa2Dg9ZVf
	u7CuF6AzH2/sTDAruEDALWXSIiHxokpPcr0cIqpBsbMpe189QNJ2aOkyCePqlGFtehBoTcV7xA1
	hIerBhQbXJWh+Re7nZ1XYqt4Ez4Z6YAzu5dKwUa/QlfrRcfWbpycIyPzyjTffulSt
X-Received: by 2002:a05:690c:7249:b0:814:5840:2f92 with SMTP id 00721157ae682-81fb8a99832mr25452957b3.48.1785430406269;
        Thu, 30 Jul 2026 09:53:26 -0700 (PDT)
X-Received: by 2002:a05:690c:7249:b0:814:5840:2f92 with SMTP id 00721157ae682-81fb8a99832mr25452477b3.48.1785430405777;
        Thu, 30 Jul 2026 09:53:25 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:2206:62e9:bbc4:c360? ([2a01:cde0:108:24ed:2206:62e9:bbc4:c360])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb891e1a7sm13560187b3.17.2026.07.30.09.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:53:25 -0700 (PDT)
Message-ID: <009be7ea-c886-4029-b09e-efabb94bc153@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:53:18 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/9] arm64: dts: qcom: talos: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
 <20260727-b4-qmi-tmd-v6-7-973cd3a226af@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260727-b4-qmi-tmd-v6-7-973cd3a226af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V4tNF+ni c=1 sm=1 tr=0 ts=6a6b8186 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: CU57NM29RhELNHmiwAYD0UsAcbizwET6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyNiBTYWx0ZWRfX2JVVr9w3OAzO
 rT7HUtRAWpqiDKNwpp/L7TAfFS2mIsTXvjapveIzZWfrjzy2/6DdVSly55HmTyqwRQmZYGw8gk+
 VWOQN91WvUrQoRUaCbYTD/mgldwymWwRLxUTRBIjg7XGSzIYa2llYehjP6ixUnhHh1V7ed4h6Zj
 dajBMU4g/oD+7GGyLBhLLBhoGTZp0z4JN7g4MuUiulFE6/RAU9TEw3nGHf6maPXpJeofyYi6ok3
 J+dRyiKsUD9U3j9usF3MTA9LxDfAKehODMDad/1ifNBerEjXhy5+ycMCBRp/l8ZXOJ481uCFQ7r
 pT51qlOnXXp44cLbWGNdZTwm8OyFE1v+TGPDLJnOcYPNpHk/UJpEzLKPjSTegGo4x/0A6mtYp6g
 JUEp29b/uDXS1SvfbeQDt0rP3pr34frtGCK24FVNP8H2uM1FHi5x3Cb6kdHLpGJA43TMi35sJFa
 94akLTRcgdzKkIXztNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyNiBTYWx0ZWRfX5ikrJ+BctH7i
 KyLnwqEDTGrOEKJn5UnwGqRk3cArov7IFHOmJoYClNh+9JpUDDgmb2urRA2kREDDs8NO00/hnkP
 4nNLaADnzpS02Uzh9JB5l0Tz6b21qXs=
X-Proofpoint-ORIG-GUID: CU57NM29RhELNHmiwAYD0UsAcbizwET6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300126

On 7/27/26 16:22, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in talos.
> 
> Set up CDSP cooling by throttling the cdsp, when it reaches 105°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
