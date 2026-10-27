Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109840;
	b=FMss6JxKlFFM81IJ54r986r7wW/tZ9OsS27Yn+SALJTPe7pL0Cxs9CpFM4iXcjfm69vj
	 80LDKtGj1sktoyGjJPm54WlWzWA67ktsfGXQqQcqASnIKYILe2j1z8xBuQXTn1AD8thw+
	 BuEqeNoy3zxLw1f3wc7qTNAYq1s7I9076/+DjlGUCyD0azMa+Ujaa97XNkQAo6d7pX6dF
	 NkLwsAVS7Br0L4I5b2PN5Wzhk00IHdRtXa48v9cWkSnsBDzkqTd6OaoT4hkTGUBBse4MW
	 2AjGzpTSzCiZYdMp+QE7c+lDvxv/2H2E8Q5fZfvqdUY3DwD4hCh5KLoRfeLG+oygSjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z+zcjRUmFJarKKBVLCxCx+rQ5bd46t8d9JLDCiSJycA=;
	b=5UW9lpjB6961VhJBBvCEv7HODv8OMvH/d/12a87rD09njKUkT+pxKes6SdtvEn5uBvhD
	 rS4dlOPZ63MUevHMLavUqrbJzavrgq1RxmnWi584B5h2bbDMMsgBr7EEpIaCwc8WpoFJi
	 oa1HteuyxTLyIvrrF2xfaydgdNd8YRTWt/wUwVLoTmgEt31VKJEFEs08tUvDa4CBmDZKq
	 4gAicnaZ/ZFMyj6yGi2zKBDA0mlK9C9+mwrTWZQEenlbzUbs2pM0vBlCruD+bhqlb0ie5
	 vZUjbYo74XLL1EMW4TcJzr63N9ZJ5hQJgHEg2t4/irpSAmZizLbkf9AhW3OVaOm8m6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UYdyAjbn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UPRljlt7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FC3606A31B
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 14:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9FC3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UYdyAjbn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UPRljlt7
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDo3hb2881598
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 14:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+zcjRUmFJarKKBVLCxCx+rQ5bd46t8d9JLDCiSJycA=; b=UYdyAjbnGesBz71W
	iVQaXe8qeCZ0Rupd2jondt88J1qH9S1pOo/qi3Z4EuXB6lyNRXzynxQMQS4pVt4G
	drLcMBce0anTIO5En/zvLs4tVGWXIY9NjPTFmWHu8yb9glvFqF0YdMZOwnIgjZDH
	DnaTN2t1g6LOMH2FluAsLrZAnoaIHpG9eKxpD4z9ssZZU3FnmrnNXvmep2BSucZz
	6OcrJGb6sN6X1W7IvC1hXQfjjmSU4f+5wjrtlddaZhSN5hBIRFRHqhgdxY868xvu
	L6PsCLS0MF0BP6EyUJ59pD4i0tGfM60Kuc2nenyobOB/cR64DuliVsIpEm8lcVj3
	I5tUTA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbtamy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 14:03:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e876e33e6cso6443205ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 07:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793109837; x=1793714637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+zcjRUmFJarKKBVLCxCx+rQ5bd46t8d9JLDCiSJycA=;
        b=UPRljlt7EyYoa+04TX97q9IZlsTHb6EV/0IkDooKwfJxL3PPxANG2ydSDh+sctpt5t
         TDr6yZevQquyAtbwhkqW/BIqI0snRS2C93/hxopSFKsf325nJ3A37nlww5nviQVxWuNl
         wV4YOkFvz5snBnTIz6JlslWkO2hHyIEzok2C7avVYh53TM6SKhv6Bj8Pj1kTrLSQ0e5f
         pP9diZlTFzXvve2lQpndduUwNv16XcV9Gqh+U7vOspzbOGdFtNZBHhoslTS8C6uDD8gn
         Np+1ZBxcv29Xl2EvUBfhl1sNccvQRc2lYTSz62QEMLFhMqpRA3OmGO+Tr7WXnO+5cxyt
         hlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109837; x=1793714637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+zcjRUmFJarKKBVLCxCx+rQ5bd46t8d9JLDCiSJycA=;
        b=E/4SpR3QvnwZBuDnsC3mJU4ikJhOvmMAHMdOOBc3GF3nfg9Jd8PDp17q0dFCrHouWo
         uhpZluEa4x57QsFQWWW4mrkNrmj3C6Z9iE0vpmtoqPn9njhu4JJZFAe7VRtG7Uv7iZjS
         RO8AyUZmKkYVN5VEuMPvD4bX8Ky9STQTYNv/JpZS8z4JaNAmTT99Df8Iv+DEX3Yc34DV
         S/tLxCQ/y4SPGtm2N6wOnu2ewOQw4yxDhZf3RUNVNpI1QMJg2gO06UJclkRHjM241u9T
         AuwwxfcdnPvJwTKbb6HVnEuK5DENhXm4DqUb/JTomd+lsuaja79h1vjxs/GJAyhxXKZ8
         kSdg==
X-Forwarded-Encrypted: i=1; AKwUvBw+J5VABCuLdEHC8RHD1waHoALJQvwAbxcRtJ+DACFqIYyFRKmH/+GARTspJjEtCVGl5lJ+MXakzB2d7bSEQb/A@vger.kernel.org
X-Gm-Message-State: AFq9FYJz8cErt1cyGEcOhGSiG3k5S9QuBSRPixSbM+1yGR/DdqI1Oh3Z
	2kzL7dG6TDbY9RmVl7FJGUigWTVFL+mplOP/h2SY8w+uRhdm2ksuau4P/Qx/4HFRwZAoQpH57rm
	I+fhD/6Be7vPbmh3UsTSddSTMvePaAKiuHyOIT2mvvtS/6K9fKFTltP084f7DHg66ho6CActm
X-Gm-Gg: AYBFou129LT6f7OhWoPbYtwc3BInJR6gbyWLqFi1ekt15xQoHXGTuhUXo5qJzMj0eNB
	LHTqM4Ub4LflSVG1tFsWA+qS5TY816VCEnRPLDiqtcZ9VuS0UnA5HyuFHTTdRSReyek+PjPDJIa
	NCIB9TdxOtEPO0mBTl0L/dmPD3kByhM4K9udaNg4kJTjfgxx692LqffAqpFkzbDerHTTYFsqcX+
	YoUxRlBxwnrusrA7DCs+GofLLb9IHgpwNDz3vWSegGqPiwfjf2TqrFX+DJe1f+lOEUOcRU+k08W
	PGSX6qovqhU4Y7AKLyTZdb8NKVkVcRQQ/UTSC3vXvbTkM++uIWWxa/9kLSbWVh+OvCBWNHFySP9
	lzX1XpHQrMnHOWh34/UBIE4cW3pmSJmNznqjiUHxA15YPR5Fo7DbCrMzmNiXHERiZ5viMIow=
X-Received: by 2002:a17:903:1b23:b0:2df:8909:f719 with SMTP id d9443c01a7336-2ea9c64401bmr146875745ad.3.1793109836987;
        Tue, 27 Oct 2026 07:03:56 -0700 (PDT)
X-Received: by 2002:a17:903:1b23:b0:2df:8909:f719 with SMTP id d9443c01a7336-2ea9c64401bmr146874635ad.3.1793109836298;
        Tue, 27 Oct 2026 07:03:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca563ca9sm28627e87.17.2026.10.27.07.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:03:55 -0700 (PDT)
Message-ID: <b5f0ea6f-1048-48ed-8df7-2502e7b452f7@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:03:52 +0100
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
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: sdm670: add digital audio
 codec
To: Richard Acayan <mailingradian@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
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
 <20261003175659.23536-11-mailingradian@gmail.com>
 <87839ad6-c489-40b3-bfcc-60c436cd1a6f@oss.qualcomm.com>
 <atYtSXF6QeTkF6pr@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <atYtSXF6QeTkF6pr@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NSBTYWx0ZWRfX/0vFvdGyplT8
 FuvisyhHA5mVi8C0rTDnpQQ+Sqaf33fzo4LnyFVuOKypqqTM2OfcZ4Hskj1bJg1mCoAQ8LeloWN
 BJwiSxJsRiUp5eYYSOPHBeIvLzBOMkg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NSBTYWx0ZWRfXyZM1+7ZhUGyz
 vFHzPcL38c8rOqDeHNYXJ6Lmg9rZdCNBxwtpGKR+1l+Xljass05irsdhkZAqC/9IFQNLsLSV941
 zssoZA/m5sUoPkr13TDu7/D7r9hXCmetUzOF8d9ppAmwpMmG/HFzSNSLz6I2X0gEFOBHJCsnV3I
 MIsk7flkaELrVKfiLSSl7JeFjvmDNNqCbTxqvZG1hgP7CfAUi2HBlhDFzo8tJbJjvDdi/3NM+kM
 hxf5wMA5h6ilUqRj17AQwQAT5Yh9/4AOtJbTE85QYYpizeUXiuTzr8qR0E+ExqsquzFCpfJQNsv
 KBaHD/YvzMm1VpR+7AopDG+dOg+Cqau5MbI17E/D4r1ch0mtQgm+Iz4BSlvEBLx5EZn8YqUH4sq
 Wf5N2syzOxQbykVKzYg9QIYyDeVI1cs8JOQg+O7xtkLQ9i0HVCYAH6l6QZVGey2eUZty06/D4y9
 GyTnS+KPmRRpKWg1bJw==
X-Proofpoint-ORIG-GUID: uxaTEJHjduTGQnQGpyq08IGepsePRzOq
X-Proofpoint-GUID: uxaTEJHjduTGQnQGpyq08IGepsePRzOq
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0af4e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=Jm0Y9y7N4wH0DHTafQoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270055

On 10/19/26 4:46 PM, Richard Acayan wrote:
> On Fri, Oct 16, 2026 at 12:21:10PM +0200, Konrad Dybcio wrote:
>> On 10/3/26 7:56 PM, Richard Acayan wrote:
>>> Add the digital WCD audio codec to the SDM670 device tree.
>>>
>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 15 +++++++++++++++
>>>  1 file changed, 15 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
>>> index 038ef0f73ea9..91188acd16b1 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
>>> @@ -21,6 +21,7 @@
>>>  #include <dt-bindings/power/qcom-rpmpd.h>
>>>  #include <dt-bindings/soc/qcom,apr.h>
>>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>>> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>>>  
>>>  / {
>>>  	interrupt-parent = <&intc>;
>>> @@ -2541,5 +2542,19 @@ data2-pins {
>>>  				};
>>>  			};
>>>  		};
>>> +
>>> +		lpass_codec: audio-codec@62ec0000 {
>>> +			compatible = "qcom,sdm670-wcd-digital-codec",
>>> +				     "qcom,msm8916-wcd-digital-codec";
>>> +			reg = <0 0x62ec0000 0 0x400>;
>>> +
>>> +			clocks = <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>>> +			clock-names = "mclk";
>>
>> This clock configuration is forbidden according to bindings
> 
> It is corrected in patch 11 which is why this isn't caught. I'll move
> the fixed clock to sdm670.dtsi.
> 
>> I'm not expert in audio, but an LLM points me towards
>> LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE
> 
> Does the LLM have access to schematics?

That LLM has access to more than just schematics..

But at the end of the day it's just an LLM. I don't know for sure
and that's why I wrote it that way.

Konrad
