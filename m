Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F38371870
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Mar 2026 09:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740257; cv=none; b=Y/x5VNZ8YRUgwROZhMGJSbrQ7/3oCDrE+1SfgLfABXMPqGNCti9pCTBgqMc9ThJAs+Mfy8BPzCR7uUSsAKQ+UXrdhOiSMzL/F1MFbDmbxerNOufxAwL4IjY/ggPpqfSxJIWeaT6b3tgroQW75OdcGVZwGUQjy+KTdOlVwW+OFKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740257; c=relaxed/simple;
	bh=jVZYIYYu5NR2kUW827DS2lDNFxhHlkq/RhwYjreU5TY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HtivbZJTMxaEfY4JVzeOzoqQS9V4i6gr08gaONXEqqswPfzIgZiGf7u+f0wnmpUQd0I/iKtLpOWRNtEr8VFcnt8BuJa/LSeg56G53hS1g03MqRaYZDpV2dPQBfNleyLzETxfSKvOrjACtx844J638guqePhn9Io9c5PLnJTqJ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0028KqX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BEvPHZHk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0028KqX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BEvPHZHk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H97pJt3124594
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Mar 2026 09:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q4LiO/KWyB0NlyXq+QE2s63PD+DYwoW6khx52RDakjA=; b=U0028KqXKvwf6SWU
	C7xG0NhalfELkLxjnlY0jMUkk/Sa7dX27XKQdENvxt/FgMDmZz4ygjw1+VVNZJXX
	Ugbj9gC1dADoAXhut/GKm3gdJnS7WHa78d2Ghj00V/SQI51Zxvor3fRPZ9/JSeZJ
	h9/Ov8Qud++CaLO7cD8t4RzzqOxumIX56xhzbNH/GVM4Egbk1L+U+wCFsyNAJ31q
	xg4XOE+3jp785PrF3zYAuPqjeUQcGjMpo3QSpgYVVjXpYC1b1mISG8TCRiIsRHcN
	efGJYzc7mrQPt6+ySZSMU/IEHSX/xTm0mPMrejpZ2Y7aDOcQXWZXtE1SU4NiVOe3
	NATj5g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmmhgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Mar 2026 09:37:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c3d3f5799so277978046d6.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 Mar 2026 02:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773740255; x=1774345055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q4LiO/KWyB0NlyXq+QE2s63PD+DYwoW6khx52RDakjA=;
        b=BEvPHZHk9j6CasUYw+A2J2fj+Uu8kiGh6xQMcTw8wLhURHfLiLtrIpx8zlzWvcpkB4
         DDOTRn2W8mLwxs8w5HRKrUozydzHduL0cAggdJsvT/v8ZcoMX5f5IprOna+hJoB1vFMr
         S3Fja1srsPfXk4yrYU93snX2xolPZiSM8Jyq5k510puJijCpne6ekZxOkZ56zxPf88vQ
         JoKlL2OOMcmiMEfwIhIzO1XVCikog3e03HhMDTp8kFzSLs3fcp5QH5rLX3nSewYlt/dJ
         ImKPhzfqhHJvCeWmbUtvEdmY4tFZD8CqqhQapdYrWR2ogGKLhm9Pt7sgZ/FUrn822jpv
         SGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773740255; x=1774345055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4LiO/KWyB0NlyXq+QE2s63PD+DYwoW6khx52RDakjA=;
        b=S/KvMLnHwzAiPODE0LQXlTvT4fxMsS4JZpkHP79RBUu/YHQvu64RUeBfkHmviJciD9
         U78J4slkZfM8KWL7sp/LaV9RVSExMalp4oFeUpt5KH2mrm4Z0TSqp2I4lesWRums1vnv
         TgjpW3NduelbC6/4Kh5xYttpUxZZqHQbO+frQ/5nVzx7R8HFLrvA+uGJDItpl3wAII1h
         ZXt69+Kq5rz+GMG7bpfK4if+2Nt29R+zCKDeknEqjuliNM+F64Fg26/oSKrcFGpr9uJU
         jPVI7Y4dY/PsOlbeMRCiqudnDbjri4kFEgviBXL/ym9nZfy8gmkHQajVCE6nbMTxJ25G
         Zmgw==
X-Forwarded-Encrypted: i=1; AJvYcCUPr8flGtjvJ3YStAPYyBCKfYkAUvfSzGyQ0Dmm6e+xId1scYyxzQKzGnd7BOfLWco44th7TskjUWRdbwfrj3Kz@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo/FrxswtiCUJgheneW63pjRbUktlDYf3AF8AzsYth8Z+Fb2fF
	fF3PhqDkgGaqUmAbkhLP+uLq1i/t+ghDq3RTm4aSf7kNRvalUbaWsnQ7qfxh3aX1Y5iChtiKVIV
	zWpZZoqzoNhyUm9VMluvjXe2Wl8XLq+OJsX9pBpOhIvIOQNGBmjElg9+MgfR2GGBnKvk1c05x
X-Gm-Gg: ATEYQzxSmeJN+NmGcAuzYhaxiE8EnyYWaZrHa/kDBgS4Wbf4ex4k41avF8AZoOwHFfZ
	4mUG06ySPzqczSAQgnkMBujnRQzC1trDstDH++XlqYFJ/QzxLnxlrEs3NTCoUoGMI3EI6JEPQe3
	YrOvYsftL5nucd13huOiQj23vIHB12KsSd09gzDujuDMxrgACsG/4+qai7z9RRMUW4DP8GwJMFg
	vnNIGIUmMiSRz1hk8W585rzKNtVtGNoNbgt1TA0X4TP0BrEYiHCVAJfr4OBNRaSYy3eoFEwlpLo
	SzDGReYaSrJeRlBSf1nSm1HlJlougiEl036ekpuTjChn9iGHB1hhE9NxIZPoNODKBj7O+O33+Tj
	7PzYAw/aSjJPvP0bGtSO9bcLe73mHBUuziKEgzaGDYLVIME8D5kJ9cmvJFEh2v2CWMJC5pTEdqT
	FCMkPiGhuf
X-Received: by 2002:a05:620a:29d5:b0:8cd:b317:a0b4 with SMTP id af79cd13be357-8cdb5a6ea0emr1991589085a.27.1773740254692;
        Tue, 17 Mar 2026 02:37:34 -0700 (PDT)
X-Received: by 2002:a05:620a:29d5:b0:8cd:b317:a0b4 with SMTP id af79cd13be357-8cdb5a6ea0emr1991586485a.27.1773740254241;
        Tue, 17 Mar 2026 02:37:34 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:67fb:53f6:20ba:ff45? ([2a05:6e02:1041:c10:67fb:53f6:20ba:ff45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b42bd696dsm16981086f8f.37.2026.03.17.02.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 02:37:33 -0700 (PDT)
Message-ID: <e25754a0-edd2-48a0-abc4-9b45d119ede5@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 10:37:32 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Use the QMI service IDs from the QMI header
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jakub Kicinski <kuba@kernel.org>, konradybcio@kernel.org,
        andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316172251.2d57d0aa@kernel.org>
 <8757aec7-8c36-446a-9a34-f0717f64202a@oss.qualcomm.com>
 <2026031717-ethanol-zoning-80b5@gregkh>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <2026031717-ethanol-zoning-80b5@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4NCBTYWx0ZWRfX1VX76JXKvExl
 NY2MrWoX5cowf/ysfYEdzZ+rjKPFRIYh0UhmcQTcsk0HcX5HPbnXF8TrlES/60HhIvwLgxKGeic
 DvaQMdL++XjGCnV5uU+LCcqzGEbllBcn8phCEf37+MTFYihjctWY5jBjXq6UwB+5iXbd7umHHoe
 JH4UDUpN/rKVB1x4iPwIWW7wTQGwKHx30l6tvoVtWx0F5VNxolonnEpQ1p2V/ddtbN+/TtlGr8Y
 1iAEiyjvRmmm/8bCdJAN9RPQzjVllQLktVKbJbAOHfRB7jcn9Fa/OlrbCo+KSzS4zGe+0tcPv+M
 4mTyAq8vASIsuq674A2S+ZtpRuKxRIZHi3ASw7wZ2kvfPf5S7w+QLsmkWSGgVRtyPyPX+aho8Tu
 1zXrT8xq8RZLoHoEpT2rVKacGT7lYBLSin3ia+jpF40kxVJM4V+UkSiMW15uWP2H+VL31ssWltD
 UjYwlaSt7z8P3zGWobA==
X-Proofpoint-GUID: wgRuKzdLEGXAip6HHFVzSHE0U75v6anG
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b920df cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6xCDiqM1XSE8sYu1eLsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: wgRuKzdLEGXAip6HHFVzSHE0U75v6anG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170084


Hi Greg,

On 3/17/26 10:07, Greg Kroah-Hartman wrote:
> On Tue, Mar 17, 2026 at 09:51:32AM +0100, Daniel Lezcano wrote:
>> On 3/17/26 01:22, Jakub Kicinski wrote:
>>> On Mon, 16 Mar 2026 18:14:10 +0100 Daniel Lezcano wrote:
>>>> This series is based on the immutable branch [1] containing the QMI
>>>> service id definitions along with some drivers using them.
>>>>
>>>> How a patch can be merged ?
>>>
>>> Wait for the dependency to appear in respective trees after the merge
>>> window then repost the patches individually. I'm starting to get
>>> annoyed with all this cross-tree QMI/MHI noise.
>>
>> An ack is simpler for everyone, especially when they are trivial
> 
> Why isn't this 4 different patches, all for different branches/trees as
> there does not seem to be any dependencies here?
> 
> confused,

The dependency is on the definitions posted in v1 in patch1/8 [1]

The first version of this series was bigger. The definitions were in the 
first patch of the initial series. It has been picked up by Bjorn in the 
corresponding tree along with 4 other patches for subsystems he is in 
charge of and let the other patches left.

He put in place an immutable branch for those who want to pick the 
corresponding patch in their tree [2]

I sent this v2 with a subject prefix fixed and a pointer to the 
immutable branch. So people can just ack the patch or use the branch if 
they want to pick it through their tree.

   -- Daniel

[1] 
https://lore.kernel.org/all/20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com/

[2] https://lore.kernel.org/all/abdkE2qWX5Amf5Jo@baldur/


