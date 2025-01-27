Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF907603F
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jan 2025 15:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737990592; cv=none; b=Ph0yMv+M0Q45Z3qUTIzzd3VW8o6AwjAsE0mya4PgPrSiSqUHGpncFqhfuYWmpddZIl6R7SR+SnfHWTYpbFt4Ct/aUNqLG478zQdRHUo8C05G22WxqP2UkZ/W2iYcfC+GCo/UXutT1gvIt7lPo6Qh5zH0rbwiXucNqvgj9rZL+qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737990592; c=relaxed/simple;
	bh=vk6eegcDQlCeAb16eHY+Dyc3eJ/4L2f6+6OSZcJmOo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nvk+CxEiarsMsnB48S4Bw7h4fEAmprvQCpXui0RrpHaNa8V+KfTb/06QFuECjlMUHXy+EcaeijD/wAAEzTxc0jXSVWiepYqARmRQy3PylQ4rMaXnhg21qgJZGbLyVgC1c+ZdGNK6kPvW/Bnd1W02J+VKd/FH/oP0VhzjyD8Htv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VyJWWy5W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VyJWWy5W"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RD3x9u020765
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jan 2025 15:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q1M9K9onRDZHs4xXpD/oUoEIGN1Kl9raP+JdO9Spve0=; b=VyJWWy5WQB+wDHp8
	gcYYoHMy4RjluJgSghJWuSzxuVI+0EXI/LpCDTga+6H8AWRFHCf7rGOwlZbCxPFP
	aBeYqplgUaXbLEesI77zeRB1/GfufqbDfsC7mnh2yK4HPvHQC/R3ZdK/9KhCpRQd
	P0OauqG9rkr9RaiwaWP//QR70bStOGrt3kMMd7G82BEziaxpQjzeg81lSeYqQH77
	+FZlnEFAAHyUe80OpXwGgA2CluXdYxDdzURqaOC6MxwXaFGtPKTuF3Y4HdB1TbOR
	nYUUu1m94SSwXhx6pfQqYX7c5Q/REoXm/OYY/JHICtrsdk7LbwQ7VccHm8zX9FPP
	A9MiYg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44eapq88c2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jan 2025 15:09:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d8e7016630so10577766d6.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jan 2025 07:09:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737990588; x=1738595388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q1M9K9onRDZHs4xXpD/oUoEIGN1Kl9raP+JdO9Spve0=;
        b=HN8pNtxVxptGWQKPdn25hPmAoIkiUovhs3poVY/1swUzMEFQXXrrEcsejCk3a7oVfT
         igiKp4JgUtI9Aue7oZWBBpRH8HdK+gaze3qEBmboOLRFULjflXI1Q59DkT6FkSgv5L/v
         fHoMnfI4lrDjiZhgJiFS4KIw8FO34V2BqDN6BAGixjKoBAIWDGgrH35wSyMucWQY/7Zq
         Er38/Jmn08aqw/MDEUvZ/riXv3n69azt6GNsmduwXA/n9SAE28lgq6b5QGcAuo6alRUg
         3yctfyfdWxGex0yubuPAbNDVyycpV25Rcagg+3etMlGw/NsBvElWrB+F875pQ/9qwzdP
         +IwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDeHGg+zwqzDKKGLZREF+sxKuQ98Wb99TWd1/8A0ZvitPdM63g5ExT8jdTRGoJUDovQB3Sf0jOlnehv/sb0+qZ@vger.kernel.org
X-Gm-Message-State: AOJu0YynX37MB62tNrcQtKx6vj47GJYdg2/CPsqDrFUBCfmIClZQvi3E
	owaYXOiGB3u6oFL/sQOW+2TO3g2AyCpM56g8lZyf7VQFsoA0ZSC8xRt4VAP3O3yJbjFEmwx+vL4
	1fCVyYApdhnFEEEvCBJ8C1adpZhGyBeBXdgA7i5zCYI6fBzKhBxgyOXzynbCewD7t7D3a
X-Gm-Gg: ASbGncuSaoU7p59/k4HnWrvnQpGicf2puOd7BD6hoKQNhYaga/xvMP/5Gz/Va5m5Ckj
	FSpGJuXtUU02WYl0+7qKc9yOaeSw+lqGbrdctcgF6VwqZ4OYA666ltYl/6PhaSYd57MgRLzxNpg
	ATbjIqXQQvyeysyFHOE7ix7WzUw9k+TYDLyMIzvJzNb6ZtPg9evJ46wireS8SleVOelT/pmo997
	MYCXf27rPWrOfshNR8IFdyCSSQAOLm5x8qsEV3y2D6KHRLvKcOIDa6C933JUtrQWP0sbznNbSrg
	lN9xFV21KFkLKc3+XXvX6AQIagPcS9Gv82LM0yebR0gjdXHqM4loOk3Ve00=
X-Received: by 2002:a05:622a:4c:b0:461:3cd2:390 with SMTP id d75a77b69052e-46e12b66c84mr214706891cf.12.1737990588407;
        Mon, 27 Jan 2025 07:09:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvLul3KJuVI1C3G9NdQZ3wh+3aRyv5HreyY2fD6i8wz/7hoATCxR4KvugABSZs/is9GHEAbA==
X-Received: by 2002:a05:622a:4c:b0:461:3cd2:390 with SMTP id d75a77b69052e-46e12b66c84mr214706701cf.12.1737990588042;
        Mon, 27 Jan 2025 07:09:48 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc18618362sm5531741a12.14.2025.01.27.07.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 07:09:47 -0800 (PST)
Message-ID: <befced20-6090-4e79-a60b-af75e88faa27@oss.qualcomm.com>
Date: Mon, 27 Jan 2025 16:09:44 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] ARM: dts: qcom: msm8226-samsung-matisse-common:
 Enable modem
To: Luca Weiss <luca@lucaweiss.eu>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-9-e88d76d6daff@lucaweiss.eu>
 <Z5dVc9yTynAsPDcZ@linaro.org> <5638469.LvFx2qVVIh@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5638469.LvFx2qVVIh@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QdX7fs_bspQwQLFyc-Vzdr1VD9seMac7
X-Proofpoint-GUID: QdX7fs_bspQwQLFyc-Vzdr1VD9seMac7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_07,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501270121

On 27.01.2025 2:34 PM, Luca Weiss wrote:
> On maandag 27 januari 2025 10:44:19 Midden-Europese standaardtijd Stephan 
> Gerhold wrote:
>> On Sun, Jan 26, 2025 at 09:57:28PM +0100, Luca Weiss wrote:
>>> From: Matti Lehtimäki <matti.lehtimaki@gmail.com>
>>>
>>> Enable modem remoteproc on samsung,matisse-wifi & matisselte.
>>>
>>> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>> ---
>>>  arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi | 7 +++++
> ++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-
> common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
>>> index fbd568c7d6b7415d240aa1a2329d07cf9135274c..
> 4155bfb2136022f2a85d69451c34f06ed2a700ac 100644
>>> --- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
>>> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
>>> @@ -225,6 +225,13 @@ &blsp1_uart3 {
>>>  	status = "okay";
>>>  };
>>>  
>>> +&modem {
>>> +	mx-supply = <&pm8226_l3>;
>>> +	pll-supply = <&pm8226_l8>;
>>
>> Hmmmmm, so I was looking at msm8926.dtsi downstream and it seems to
>> override the msm8226.dtsi modem/mss definition [1]:
>>
>>  1. ext-bhs-reg is dropped
>>  2. vdd_mss-supply is added
> 
> That's the same what I found, and have working with more (currently hacky) 
> patches on msm8926-htc-memul. I decided against introducing it with this 
> series since these patches have been pending for too long and initially when I 
> was doing 8926, I wasn't sure how to make this into a proper patch. Now my 
> idea is to introduce a "static const struct rproc_hexagon_res msm8926_mss" 
> with the compatible qcom,msm8926-mss-pil which has these two differences.
> I think that's a better idea than adding some extra conditionals around to 
> make the mss-supply optional and ext-bhs somehow optional in the driver based 
> on dt.

Sounds good. It would then live in msm8926.dtsi which already exists

Konrad
