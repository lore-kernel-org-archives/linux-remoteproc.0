Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779165;
	b=puTBz9wlxLzoVrok6If3KDnsxxmLsZkhJeLl06Iybl4rbh0Jkm0JdNW1xVd4PrpnorzA
	 xS+BmoAWAfWGp/e5InDNPoWbeLatsOby32sFv20LzTDds5PhPOCaUJYAjixF+gaRBkRME
	 HhaPgjr9qqwQsbam3eXOtpkYkQG5afuyCE7M+6vtYBsK0ED2vyQDisYi+d4JHHkf+dtTX
	 UnpjsFAgZBRvZib/tgjpA9b5OVrs53yePuK1l1QG+/slIxMoI2MGpy+TDPF4mgGSnturM
	 TuGpd2JOQc/d/cpHkrPVjnh6JEJ7GuBypF3C5svTormfYCbPhxRyBHaP2uuSrC7vnbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wNNDTMtedEII8GWbR4YeAz1zkI0o7kg6R+YCF+Z2AS4=;
	b=HbXtEglawIkLnVcs01YS8UYFjAIw+b8IP8QIarDJZ4YQvKpGRT4HR45Nf3sMgh7a68TW
	 2HTlvWKaF8PjWVkBM2wqXHVwk3PNYgRKgJiPdoIu/aegLrqiFKdgJGAIgiIizMH8AkQk6
	 1GEORl/7IWTTuUQbUWzjT/phYSwOwxOyB0bVS5wMNi8ESmyKiHCKY0kVGum48yzR3zLBK
	 7r5Qs7c589eNm5RvAox6o/ADM2i7UN7smATAxRovJZP6DNlOW3Yw0svm9+nGwAiYDun5P
	 UNcALKWq8P+Idrafww0VHmpj9Qvjw1wxl0iFDPkzvdcIouG0Ke2i5ujyoCnHlYAGMgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dxIfQMlm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K1S7Dw0W;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77E3606A332
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 11:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B77E3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dxIfQMlm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K1S7Dw0W
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApV311685554
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 11:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNNDTMtedEII8GWbR4YeAz1zkI0o7kg6R+YCF+Z2AS4=; b=dxIfQMlm2Yh8EP9/
	VQScG+IoCxTduN6xSeNmkE8g3kg7nHoxkCiPT+9hVCVux5oJ/Oa0rZVbIDOZeCt4
	BP4LU/wHTnxji77Qx3X2723GjOIJAKvLWGGg3Qq/U4G6yNFciK7D6uciyISptdF2
	hRfxBJizb9qAuUp2WP8FvOrg7ZeeJAXjQpe6q7E+rmg4h2Jz1rCN+v7XusoS+P7b
	YZX98M/wscRHSinV1vUFTfcbx1fwfQvw1T7O1EfNc0R1to89+r1/CEwQPc3STK8T
	ll4D0zdiLXfXOiREJiZnlDJ7poiV7Urq6jyo5sKgEmRS1vv+6dqKwiw5qIgOq5yS
	H2xDiw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k91es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 11:32:43 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so411642e0c.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 03:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779163; x=1796383963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNNDTMtedEII8GWbR4YeAz1zkI0o7kg6R+YCF+Z2AS4=;
        b=K1S7Dw0WiX/sqsAUf29x65I1lbFYJ5zTMQP3R73ZVp9KdTt7+ycdnNJv2/VZNl66PZ
         65psBtSkjQt4D37plip1pQOGCbkzbcKiGAQWGfCkl+bNhSpVWqJwk2JvCraCNYAyfdmX
         NHE1kWMrt3BApxEp3WmOlbEsLYK18OtFtxkOYSu6wy0ZE2eRDvRc/v4JLJF0HU3Su4nf
         7lutw2ZcU0DLL70YpBCDwk272L4WtdjblYBkVQoPdxpT0IjHkx2FztF4p5jMtM6OSW+N
         QldjJe/RgWlizQG59/RT8K1CT1CR6RceDvjZ/e7ibrNyTe4u+iIWyzUkwSv6vnSfhQtG
         1a4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779163; x=1796383963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNNDTMtedEII8GWbR4YeAz1zkI0o7kg6R+YCF+Z2AS4=;
        b=AzQZ7FV7mcoJMEIj3AgVXDIdmOlxlXAViKOtkGkmoSk4291582u1AlbRYstadilS3e
         Mvgs4p8n6tfnyYIK/8k6fWzyMIobX6IxneSx9SMiYvS13Mk81WOBoK2ErlHssB7yAjom
         Tjr5aCubTVY1lcnIDO4oB7mtG+tp7tBjsrMC9d8Ztr5DJi5xg+MfTrYHTmZsWueFvMMI
         S/qjLRKaheG79g3tPXnIJWtvpgNxFiLN0KvbWCDWMLv4DpHRG+OysGkjc0cceD4EhKLt
         G0gWL2RtCulbXo80A3QN27A1rvKysSvV4ZKCWdrLoTQeaQ/zKDW0SDFwRAn6PCJx8PSh
         QAmw==
X-Forwarded-Encrypted: i=1; AL+hErGerWqHMBmjt9xZm+6QFxGZLX71vH61tFplpAwP7o1PyzTtTY7DyVPai1bWVx/Jt6qH2xLvqucfbZWwWyFG9mEm@vger.kernel.org
X-Gm-Message-State: APuU4Z+JvzlLfKSAPf2WYT2XshmL9dNB2MWdCD3efkpdrjt3FykV+aCe
	+0QCPlxDVSFVyGyZHk/KaBlsdjvJW9+3nvz4ARaSXDYt/CjN/TwgjY5NpUdj57JbkdRYYJcFTls
	58dAB05zwixhS4Tz/Vjp1pweV/zFTOzeSlx8OULC7Xn115en8DdxZ8eGZT8DknHjv6dGhQQxWXP
	D9cp98
X-Gm-Gg: AZFdTZfR3iXIyKZrC3YAJew56ZHbWqX3v0ii2CuxUhN70QJ/GH4QLjAHzzmBuzgYX1E
	fRSGilJWcEE1HEiauHANzNLjGSwndcZJoYI+pbX52dYqXCZxJdKC5hIoER+b/ZhC5ofFEyXfUvU
	tWp7oZFZyiuX65Gha1li48g0T/KABXu22X+ZIKwD69kTcACnLZJDsNTxT6ky8VrfXl5ibk8GI8O
	oyYjB3uy2E+o1G8BxtDG7CBkEKrAPTfo5Nsf0smr4IELBst41gKSo7tibejdkdAafdDbTGnvl69
	vgL90fg0i8z11hWmuNC5aHJHgn9LH7E6MtMJGcpI7RnHtoy/u0bPht9o1LF0d9u1bpkNGuT9ON3
	BKBMlXpKTFTq+15B8sJlEhRrYcxQMjosm/O4wyt2O3G+drGP63opS30vtwKBu1H8ylpnEawE=
X-Received: by 2002:a05:6122:4a01:10b0:5ef:d97b:2867 with SMTP id 71dfb90a1353d-5efd97b3b39mr544172e0c.0.1795779162765;
        Fri, 27 Nov 2026 03:32:42 -0800 (PST)
X-Received: by 2002:a05:6122:4a01:10b0:5ef:d97b:2867 with SMTP id 71dfb90a1353d-5efd97b3b39mr544142e0c.0.1795779162302;
        Fri, 27 Nov 2026 03:32:42 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm901356166b.6.2026.11.27.03.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:32:41 -0800 (PST)
Message-ID: <541df6c2-2b98-415d-a57a-2650f03cc495@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:32:39 +0100
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm630: Power the ADSP from the SSC
 CX rail
To: fabricioakio@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Martin Botka <martin.botka1@gmail.com>,
        Alexey Minnekhanov <alexeymin@minlexx.ru>
References: <20261125-sdm660-adsp-proxy-rail-v1-0-b91784c69623@gmail.com>
 <20261125-sdm660-adsp-proxy-rail-v1-2-b91784c69623@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-sdm660-adsp-proxy-rail-v1-2-b91784c69623@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX1HjgsCzhH/4P
 2k6KSo9iGB5VD0Ii/ElCvh4jlM9GcNg3aXd+NCzRfSpBhenQkCDNgrVLKE5fQjZ8Nkj+UTr3BR2
 7LIzo+lDRz/DuAPvCw6VAFNfS78sbHcibALK/AL7aNcO097M4Bi2FiuNMbRkWFLaN6VD3X8TxBW
 J5Ci18Aon8O7qZeE7IuzettZqv0kES1DTvU/lsjK1x6vKg2J1fOHA+prPrB2nTRmokHqcSEoMcP
 7M3m0zMJM75BK82HC8M6M/9mW1woV+lvSMXw3nwh9ES/apfwUw3e8xwEK1V18hE0sJmTpAAZOLc
 8w7VSBTQpbWYKVcQevoqooXG4g4HMTDTXi2YiaoHxElVwtDkPlo8ztQ4Ymrkr2pfZo6LjpFVs76
 xeOv25Rg3bVaC1cl7VTGO+9v4hTfAx9baKmuGkSjfQVi+yX18guE43VzgxYNNDDcFISBN12Dq9k
 mgom3kiS7Bw2NLfYtSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX6YqHyq93yvY/
 lhs/G68Xw+1k78B2RR94Nsz/ng5YCbqt5arfY7H9vsg2dh6xHa2WxwLDvWPmMDIwNn58wOf7pBQ
 WMrO3z4JtfPJLh3idTHq4if9oSMHIbs=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b096a5b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JrArOcoNHQKtsS5ItqMA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: HH3rEb6nZGmeU3tNj1vq8vvf3XCtqxdP
X-Proofpoint-ORIG-GUID: HH3rEb6nZGmeU3tNj1vq8vvf3XCtqxdP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270045

On 11/26/26 3:20 AM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> The ADSP node names RPMPD_VDDCX as its power domain. The rail the ADSP
> needs to boot is the RPM's "rwlc" resource, PM660L LDO9, which is
> RPMPD_SSCCX: with it voted the DSP starts again after a stop, and with
> VDDCX voted it does not.
> 
> Fixes: 7ca2ebc90a46 ("arm64: dts: qcom: sdm630: Add ADSP remoteproc configuration")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
