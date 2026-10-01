Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E22F3FE359
	for <linux-remoteproc@vger.kernel.org>; Thu,  1 Oct 2026 08:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843983; cv=none; b=dxCU8biVVKPZEHkPllt/UUwRbL9tR5usv0l+noE5tBrM/eyOMTiv4aDvG3ZjeyUM/VNDJRUufA16ZXZqRFjyGiJLePl4A5Q0Oy3yzKk0cAWM0dGxtRP2aJP1bw2NvR9bQ1lbM8vrCWNISX9SUP0mxDkYuMLvPK62j/WJ6Whkfak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843983; c=relaxed/simple;
	bh=2jY4/kzFvO+9VqBwBcRKev2G9WIAnsbUYz9bRalBVRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KKCm+LxLpt92XvPbiNpNetX2960W8UwnYWzig0bbjtz1WJLGG8JijOz4yGNEQOqapcPMyYrTwqutGs9WPcKVMwdOXloLx090TlKwJBqL9XcwIgSTxVKfwSArWDAq/bOP2qbhAzZVzl2UF40lo89qzhE406+McoCIIGlVHPJacQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETWx9IT5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hjj3Yw5u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETWx9IT5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hjj3Yw5u"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xT6U1289199
	for <linux-remoteproc@vger.kernel.org>; Thu, 1 Oct 2026 08:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ViB2hPkPT+eeeH4k92vbHVOqiR+Ad6cvNpNGQw+EvoE=; b=ETWx9IT5nllmdrbl
	RoogQStucaNfYJzhc9Ow4zGR+FZk80CtYt2A6wScmm7A9uQ9lBHW+NaYiTICcO3H
	y22UQvfi50+fUxXfJgMeXv2IVDdboT9Ae9/frg+xIdXH60YvB0HqqQqSN75BgISX
	ZwQ7O2ONmuZKyX3Z+q3bviFO2Mx/pq4kUyGoFwwZ1rmNgyenMjnjHMXOwCSLudsF
	Tfg0CCRGfiPiodsdEZPl5V45XofHw2wurHfuLFlamfivRMfZJYy97HNDSUK/CXQf
	O5VgZV/3ADJ8dRE3N4y5UOBlV9xptigEg6E4M9rlyjEE7BzuDfMG7nALe0ZQusAI
	+j/JtQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjavax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 01 Oct 2026 08:39:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c6abcc2ffso44426685a.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 01 Oct 2026 01:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790843981; x=1791448781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ViB2hPkPT+eeeH4k92vbHVOqiR+Ad6cvNpNGQw+EvoE=;
        b=Hjj3Yw5uGcJyFu2QcRNJpmqhr+EVWmD9GvCBqc2xmiNGdieQkBZH7rVOimcZsbduhE
         7U8ymDLtrSS4Y2pjBRQ9fAndPD+du0tKkozZF5gp68aSavezozO8tyqw7BPMCwlDxV2W
         1xNnuDKZ40SwH/4O6TKQoqOj+dyD6ZrXVSNdWoZq05BbaeKM3TlzIPYBhtSvptE6oMEJ
         NqI7oQdDTKwGTQ4IXFNaNlvUSnHp5fTEvybmCXb2nNpXM9wm2HgLWXyTADaVcxafFlCW
         32BDZUmU2JdZL7wCh3oHHfz1UE8/S/Fftp3Txx2QYczw1Z9QGvS9yBDy+Bm9nd23cb7Z
         KLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843981; x=1791448781;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ViB2hPkPT+eeeH4k92vbHVOqiR+Ad6cvNpNGQw+EvoE=;
        b=EAYLSWa+gQIU8xaGwqJoadIogRUAFyWcEGjzq8KObmSzjW4J8NqTiLc8DEUywWj7VN
         e9P1MopFyJzr16tSHi0jyDQNHmeivBwfaxpkxik9AYdC5gocdpNU/S7L+1L0Amom3WUV
         xGFqdMVI5RIH6WN1Qt0rMOlrNFQVV4d8lWvz2W+yCZkph9CYvf0rpv46hYi2AJhf2k5K
         YI6MvncCaCh2W869g/cp05mgQphORSAsKp0wvEGXZlDVOTz1odao9TrnAIB8Bsh8DRxt
         hJbPITRUEHi2B2MM9rFyTDdHgTlOdT2lUEG4Vjkgezqm1Iopr8TPafaoSAzcXrmrm0/q
         pXmw==
X-Forwarded-Encrypted: i=1; AKwUvByRhFDFinzV3CJ218uhaDN8Cv28QiX67l5EA+KP+UyLwB+yG8M8ZXx9ZYKOi4Uhc7BafvZpfcHm5Rya08OVnRH9@vger.kernel.org
X-Gm-Message-State: AFuF++ndthpvD8MEPIxR3Xlc4MAWxIQGcWyi91Ds7MBof96CQYagRLTj
	fDdxBMgnq0/1gD1EO3aDHUCwkuGajD7OTkqC6srCY2wAgfh1RjChm9fKz9hXA6MifZk9J/zHNrm
	05L/SaTBakQXQh2htiDdKJYZyP1hBNgeeTsTRTiwL+3KjXJSKOJwPbfWujbuhMjBT4/ER+SyxSL
	HxMkKQ
X-Gm-Gg: AYBFou0esNRRp88t3FAKusWnkGfiGQ3A9Cgrx+GSPGjN/cGJYRN/WXxYj4EyaACsJ+1
	zeHkkFV8avsBRK6NA4EbwopnVSqww3DAWFbCMC5jGy5uB5DlVG07N4OXZcdjCG+xZxAIkdkJFB4
	TMgB689foy/1qkngf+p1Z9mTZJDzsb/kNjWn6adG47NFydC43+ZXIfgFd+IMRycuBCUmW/G+YgU
	sMdViiaDmvwc0o5FtvGNLEC+6CnK4452dauvDU4QVa/oJn0wy+Kdf0d8NgU9OEG8WFl+72TI7MF
	WzIzaSrDF38Ng/x+pi8z2mjJJ+FUWiO4WnHyc/pUP55bLEtIswfUKfk6RXY9grzbwESKqYy2pow
	rkE782VGl9mlSo8ABdVdZ4Q==
X-Received: by 2002:a05:620a:1990:b0:93a:14c:329c with SMTP id af79cd13be357-93ca95f973emr717454485a.1.1790843980864;
        Thu, 01 Oct 2026 01:39:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1990:b0:93a:14c:329c with SMTP id af79cd13be357-93ca95f973emr717451385a.1.1790843980369;
        Thu, 01 Oct 2026 01:39:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31dd9fbfsm109857266b.71.2026.10.01.01.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:39:39 -0700 (PDT)
Message-ID: <b1dca609-cc63-4698-b760-bb47646687f5@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:39:37 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] arm64: dts: qcom: sdm670: add digital audio codec
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-11-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922015801.32373-11-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abe1c4d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=GbMiANRL7AQ389lSoXQA:9 a=QEXdDO2ut3YA:10 a=Ql4v02ufxVEA:10
 a=zgiPjhLxNE0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: L0DmtDj_MeyOAf5xMhKGdh_yrMbuql0i
X-Proofpoint-ORIG-GUID: L0DmtDj_MeyOAf5xMhKGdh_yrMbuql0i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX4taa1I6LAffM
 f/AICe8vCWE6/ReEAtfNL5+qw/nNJ/UbtYZzZFPBjWYHtHFZs5iehhnf7iXZGUZnSi8xqe+gIWT
 yRJ19lt1iOBM6NM+YliD9giQMgpzHe4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX54pD6pT/thDV
 CK+sYYyLHmRLS9OYmA5IT9iICFyK0TqoQBEgMKTNmohCSxctPSN2S6c8KlIT0gv14cqUr1g9ZxZ
 pfEU+KJhKLfuGBbZQjqsvOu0B35bCyh9jToVHWKnPt4BppBjbq64gXeqKN7HN3HPWgY+17Urbol
 f0mApd0lqxFOxO0qIRhm2RLPui6M+EJBQ5KXbzaexiHU1NreRYnGH2dHzK+W5GQOKtIvf1pqpii
 OWPgdBBw48KHawfRTpOyvimJMlwKW4QCIoZ4sa8joNFYJsjA0XF06b5252rv0lpAl5guJLjKwNF
 rAvTGghg/CcYja77FLsZqQ7bWy3JpR7QFbZbaBE5x4LToYk6vckobyr7H1xlMNVnJhVIioeoglx
 Amq76hqYscnmbLYJJCa6VT928Itw0a1eV7LwLI9TJZBQ2O7+qfx3CQwQ3WJcmixI9jSgP6NL8yc
 p0pBpcn+zsS/NAOcGjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034

On 9/22/26 3:58 AM, Richard Acayan wrote:
> Add the SDM660 digital audio codec to the SDM670 device tree, as both
> platforms have the same internal sound card.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Please introduce a SoC-specific compatible for 670.

Konrad
