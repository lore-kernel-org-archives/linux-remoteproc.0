Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A55928030E
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 04:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773895096; cv=none; b=Osuk18LoxX0seuvXE/UBag9VKDvE0bA0D1s7jklbvdmpR8e+EuN4hTtcSXJIpoFfrZvqcEBIXyDoXJ6tIsR5x2q6AniLuve0iwGAFb03rMwollPu7LBIwfNXJCD6WjYHJ5wi1YHUnGVp4UgHNnhC1M6dovDPTZJq7I202sPmOIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773895096; c=relaxed/simple;
	bh=zdItmlgsAf7WnXvqKf/o2M5O4UtcRKrRhA/lmoQMLok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6AXJY9R4ape9TXIc1miL8t84KUIfGHNZM0mYzS3ZBvcwckFqFgQU3xgbNq/0hp4GTtQ0Mix94NmfZTga42/w66gHl/0e31gU7kSdWrY6msMHk5BsuJjdjaf5lU9IrqninGYde+122H7SJO0I9nVMD8SVSlgP1f7KfS9m006X/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jv2LUteG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDblSzWt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jv2LUteG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDblSzWt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J44WY93228150
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 04:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1K2TFZyjMf/NT2Pihlre0XPxbzUAwiHBTFp4fG3Ekeo=; b=jv2LUteGlqGPevSg
	tINZ+lobg+asG/tSeRf6PRVTCtKZG5Yqa+iiksK/L/TfUNKMDVOWaa+4I3atV5+K
	uLMl5DO0HuDJaxutqJIf8DY75rVvj+kNiLKSRaxuehNBq2sUdP2WyTmC1+oKq9n7
	BSk45ilJFAR2jjFYGF8I6/ILD3UzstyyZvQuo/duh4bTF0/uRaMNDabQ0pq3iLDS
	RqIhTYLo5WZ8/1SLPP6cf/rEAX2AEUtkoR+CJCEx4JhDbBTGw+EvWbf2Q6KMSubq
	XXRsZberZIna01UQXNnZZAfSvFRA+K4Crm5RfN3de4KHRBZ5oX0tiISRtxdtJu5x
	0209eA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00eg9rsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 04:38:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a782029b7so803664b3a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 21:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773895094; x=1774499894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1K2TFZyjMf/NT2Pihlre0XPxbzUAwiHBTFp4fG3Ekeo=;
        b=EDblSzWt0vaJ4+9KJGAJ6HKaNdXmYkOZzgZJU5yxnkpTEeKAg4KB8ARJuf7AQ70xxx
         p/T/rEahzx/254ZhkE5WpdgjIhA3EDRZwsh3/UX7WAJ5X4u0kb0n10WODWtcQEU2SmJv
         GftS5+RVXJIeJW3tN4/Y/P5yfaHE1qOSGfa+0ab3NHXKnmTFsPK1CDxXtalKY8XacGgQ
         0ZX2Sa+XSckEL1JhFp3HPRs3By+IEx18peKDDA5NadlgdV3E2uMGj3iu4jJPAiomVo87
         w7PdkyFeGav9u3ZOqkOx9BF5inTq3Nx+Sg+8aBjY+6T82k0/OSZHtRp4MQVNmjPEUND9
         D03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773895094; x=1774499894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1K2TFZyjMf/NT2Pihlre0XPxbzUAwiHBTFp4fG3Ekeo=;
        b=BiBYsrOI2AoIZfT68Y0SBC6MY5Gcslra3TJj43PK7LPa171F83deuW6xxK52KzS93i
         gp4nMS9thqCFzVhj1N2YFLR5k12DH2qgofnrByKb9tps1X+10L+uTmuRM5nPUMDkdB5x
         OnJAZY3kbyoHhz5aYgk+gtfVQshzZuGIAyldj3eECZ9Y6x4ibq52ISPL3BkepKoha9w+
         oQ1bFm/JjTqWtudIwcqPZAnEovn6Ry6XbO+v5Mnr5aV/o6TMHFpK9mpNF67Ray3PPtic
         Aas7njublb+ewb7+KXpepIJdsp/GCoB0ppfVT0k04A0dB//iyuG5luoZ3GD93HC+uzqe
         uKEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWPlerAuQsWcGkdKzvYvOOpMAcwGZ/bRsMFg13typB08WG3O8JzoNTDMUvoOX68EstIT1PGfhMydamUg4IYpxY@vger.kernel.org
X-Gm-Message-State: AOJu0YyWhVRJNQ8dqNuuAFnLoWe0HD/xyZY4V8KSICV8d3NtyxbCF2wi
	NYTdUsLSWxdnxIV7HnbcU0ZZSGoeNk4vcDcDfdWHa+6YVQOnZPWJMHtjS20XM90A+8t6F1YDr2L
	mZdyeMvOUt565ZFzICShlXR3pNSIY4Sa2P+6PFHcuL3eX2LjkQEizn4PDiSUec9s/pSBPfd9i
X-Gm-Gg: ATEYQzw89APeQR4i9wnbtVsue4KfRvX8qJQoeMuJy9zDl7jtFySSqAKorOTn/9JS5na
	4jt97ghJNXo3vwbFk/Ai6fglNM7mzpjz/kRGBoRt7S7JaxsiTc4F6DMXYl62gktTXqzYeJU8bp+
	Kp71wjj9AY516CQW7wJ6DxREPpT1ia7EiBCIxmycSnoHz9P5gbDSmDSeUz3mXJ4yhI1sdA2U7fq
	A+FCjZjFqpODwnszV8pydYi56xmB9gCHhYSg4sFO8FskhAnFX9neTf6Hs6B9pyd6qggXPZ2Gejg
	rCx0ADNFE58jViKb7yofO0GcIG0WUPRHAP4CAj9SroHeO2a7DFnOyY67oreaZ4QElXOBkfRVgZ0
	8tJE/S91MguAItVPkSziHeNeXc/jzJDcX0NdXjR30TkFZjB903cX6iwy/w7EBjqm6nfmwKaBBPL
	aRJ+bjXYh6GkLWorZK
X-Received: by 2002:a05:6a00:180e:b0:82a:110b:e223 with SMTP id d2e1a72fcca58-82a6a925d06mr5279810b3a.0.1773895094081;
        Wed, 18 Mar 2026 21:38:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:180e:b0:82a:110b:e223 with SMTP id d2e1a72fcca58-82a6a925d06mr5279777b3a.0.1773895093643;
        Wed, 18 Mar 2026 21:38:13 -0700 (PDT)
Received: from [10.133.33.168] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbe200bsm5131282b3a.44.2026.03.18.21.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 21:38:13 -0700 (PDT)
Message-ID: <254bac80-dcc3-4c92-a0c3-40a1adcf4ecd@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:38:08 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] dt-bindings: remoteproc: qcom: Add smem properties
 in documents that reference to pas-common
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-3-0a91575e0e7e@oss.qualcomm.com>
 <20260311-meteoric-yellow-pogona-fe5cf2@quoll>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260311-meteoric-yellow-pogona-fe5cf2@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MMNtWcZl c=1 sm=1 tr=0 ts=69bb7db6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ogO5B-f0vwbiwaMq93oA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: KP3BcwF0CxelIJbLo9CGtoHOkExfIv4T
X-Proofpoint-GUID: KP3BcwF0CxelIJbLo9CGtoHOkExfIv4T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAzMyBTYWx0ZWRfX9nCFuymZIvbN
 Gsf9EVSjze/LRjBEI5mbgsI4WVxBRvWCWKdz7gb7DcLHc1GhB08iypW054aqJa1in/CiWQUYm9O
 zm43GFasACO1+upGWmC3ZAMBzYC25Gaexe6pUJEa2Jk3XyKm3CN/AvsOWFYJGVkOP1ksOi29aXo
 EsAHF+DQorJ+14IVt9DsVe7lkFucwW19QVf0gK0WA7c+brBiWLHs5dFNN4BRNyX5zQaCHK/iMwP
 H0HAWKy+nOBxwAOEkktXzKUDtpSUH6wt9j1BHuEl9dplnguGT41OLxrFBX58XTD9OXrfx+bolNu
 uoqSzDy2xacBx4fcUsRKgWqUCoxfwrFHtkyd1qqSYm8Az9BnbBJEu730iUxM12+A3EqxMPByYCf
 xF5GStXp/blBRbpxlLRR4uix1JaCCoOzGqzb2IGio+QfKossVPShwz21DfP+hjc6AkryKX5X6K+
 kJiTUHtWS2IbMIlnHFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190033



On 3/11/2026 2:22 PM, Krzysztof Kozlowski wrote:
> On Tue, Mar 10, 2026 at 03:03:19AM -0700, Jingyi Wang wrote:
>> Kaanapali SoCCP will extend the list for smem properties, add SMEM
>> properties "qcom,smem-states" and "qcom,smem-state-names" to documents
>> that reference to pas-common and add maxItems constraints.
> 
> This change is no-op. pas-common already defines all this.
> 
> This should be squashed with the change changing pas-common.
> 
> Best regards,
> Krzysztof
> 

Well noted.

Thanks,
Jingyi
