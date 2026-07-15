Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B0343F8C2
	for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2026 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111031; cv=none; b=Wcrlho3LEKd1CewDC0/JjzL84lIugvfyDdMbEv8vT+tB9wN+GKVN+NKSQloUbjb/QGFbmLzhAK0FaqX6ihFzlXY9Waf2dust191Zq2aOGvcmIgcDZP9+UxPyST2CxZq3n+uNC77C6ksGL1ths85PTWjmpoXPTmgnRMXr03n00d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111031; c=relaxed/simple;
	bh=dolCZFloOHyIdVTD7TrCs6lUgDEHNVgJlSOuABpT9eU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fyxeqUdE5B6nHHSfo0LOp9hsHNsXUBE+TnDYBVCW4Vnyoz4EXD+GipEj1t0xSuiX1/3SWXGSQB5TlyETBArw+CiTlwDZfM7m6Nm9boAwP4Rf3YMrJ3qiiLPgPfEuSHjQpspaXuR7szcwkdRR6sx0/rHv0ci7yncmHUiHM+fR01Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pqiw3VYI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKCG6CXp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pqiw3VYI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKCG6CXp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9Sjiv2269700
	for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2026 10:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	usbf8FGUCBoK4wmdLpHe+mE0Ra/HMX4Li1R3SmnHXbc=; b=Pqiw3VYIXNzB6POK
	teq0KumgRyghnQEzmFvNtSO9JNgqRUVE2GRUoCCoAH8ZAoqGR1n+WGCkNazc4DGA
	U/IVJAsCL0nQn9aczPE5HYsQk6b9HqsAGqZAXqz+1Nh+zR20kZ6WGZk4XTxn8wu2
	OHsHkWin+J5Rgq6HCrfzb1MawHnnpC5zUp017xXoTLfOrEl/UqS4P05PjnEOjdVf
	9TMf1u85q5ht6E9U0DwKkR6o0pzIZ3o8AZXDFeoO5sSNcTupg7DL+OX/xprYLLc0
	kpWB+G6KF92KlBZQ3cKotqHaCl05uHOTpIwpkZqwb8lH+MCvkYwHwTdbhlLCZLbl
	Sqkqew==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9mk54n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2026 10:23:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c27616421so17831421cf.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2026 03:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784111028; x=1784715828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=usbf8FGUCBoK4wmdLpHe+mE0Ra/HMX4Li1R3SmnHXbc=;
        b=OKCG6CXp1geUlOwjpwUNYjbrSDO2Rm94wHCegAwv3rNvvMt6Qte1BEqpNh43VB03zw
         t+8hPybgJZNEcTYLC+psUGev0h3h+XDgQxlFSfxMYKpE1tPZKT3HFcS8kednTgLZlXWl
         mjnsdM52d5XJ3MXP2L/JNd0XvXVZhgAdbFyNkNXIrOZI9wqETvqHjSzMHJEaEIDjInhL
         8SHOvqAXaZBDG9CZF5xRYTf9Ei6nPVwEn9Qkf5SdgV302eNt//M9TasthNLf1Q8prODD
         6jcXgeJ7ONNOPIXDfHLx81oqRVkfKAvnyjLxZIHN7IDB0cv1L3jVFb3GvnXOYQ5uBaOu
         ZOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111028; x=1784715828;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usbf8FGUCBoK4wmdLpHe+mE0Ra/HMX4Li1R3SmnHXbc=;
        b=U/QiQBTtAiXK0+eGQwGyzUHiFiuA1oG7Pa5ZzCfko8aA0anpxN+yhLNRc5kU3WN92w
         +pRZa6qgcJz9+vfHvGJcu+oEliWJj4hMuOWOzRrFTgbmbsnGho4gX/sAQM8T+0hvuqUX
         YcNpys2ZpBeQbltRnyZ7r4XnK1YDDEbIwCjWg80GYo30PcTka5hmE6a0eYInXTuRXfiR
         dMA/ymfrlPx7DjHF7Kd10X9OPFgR4t9XlToqmSQuaMk/QZKfT45jgFHkrVxMl2wE22CU
         T/GHWoSp6SRioBdzzY196l5bc3TMsljZyu1fA4xbQt3cKl2t3wT5Ybwye6yWih9if9Hu
         T51w==
X-Forwarded-Encrypted: i=1; AHgh+RoAWcY/EyCyHdrl1RtWihYLDj5BCT4csPjns4Ect3jo2qB6smZq3Pd/brG4YJd4Q7Pc/s3NsxyeCPY5wuFGskhg@vger.kernel.org
X-Gm-Message-State: AOJu0YzeZC6cDYt38QH+PnlAnuaK2YVoZkTdAwQ3mBmX9qcj45gdmoW7
	CqSfkmnKB5m+kx2vu8beln5gY31Zj4XUc2NtSeDMXImKwjpPtrdSxHWhRrlPaxZH7i/r+UcCZHa
	JubvZBN2yQRJOWirkGquagxriAdIL9Pg2GJi5UEahXvYbaJclaakSlVFAjhm9NJJn0vPO0oOA
X-Gm-Gg: AfdE7ckZLcricQbGfs+n3m93pWDoI9zNDe1Tz9vZ+lol9ucGgcqJf/iwQPqjRgLt34X
	BcgLUGStzzrjkh/mmt6mPtqXXMldMQ+wO5vJmuRnS3qZOeHnCuaRvUDtv02dPUi3UL25aW96o6m
	uQciTpNdn0o7sVy4D2OBtRtCcwiP3YoKm2+TH/KWb2JfKJhbes4dZqkAQlqMeJR9xuT1nPMHroN
	JtfJQBmwnD8b+d0qetFAe4112f6+v/LhKwXE0aXxmDN6FMfkwGAOYGUMYsFgo6fOlI3sEJ4GVki
	1236lD1FSMNZhZV4ILxjHYLDS9umoI6h5xcrkcQfG+IQD4ffbm9tmmkhIPs0DxOwKmH2MYaY1fu
	KWdyoK3gf1i+T4VWgJElVQ5mNzbTMcmxoymY=
X-Received: by 2002:ac8:5f13:0:b0:51c:215:3e81 with SMTP id d75a77b69052e-51cbf0e8ca9mr134730261cf.4.1784111028229;
        Wed, 15 Jul 2026 03:23:48 -0700 (PDT)
X-Received: by 2002:ac8:5f13:0:b0:51c:215:3e81 with SMTP id d75a77b69052e-51cbf0e8ca9mr134730031cf.4.1784111027799;
        Wed, 15 Jul 2026 03:23:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb30f98sm1327760266b.55.2026.07.15.03.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:23:46 -0700 (PDT)
Message-ID: <7218baf4-df73-48f8-bacb-514ac3cafd52@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:23:43 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add Eliza CDSP support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
 <20260714-remoteproc-eliza-cdsp-v1-2-32eb7a1f2c59@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-remoteproc-eliza-cdsp-v1-2-32eb7a1f2c59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwMCBTYWx0ZWRfXw+1yP5LSAKSO
 +uJcdOJwRv8jmzn0LwY4V0oIMA9WPajOGBJx/AvO/So0NooiRPoFV6SstEWr5h4b++3wrHTDckZ
 l870PZUzzVoCu6VpQzCYfsohf0d+3US4Of3zSJZMrL9DbICS4Leqssr9NMcoEdQZ+Y2VWhEjKvC
 TVBB1eZJ04F8/+2aovvCDLGYaYG+epB+qbPxhsCrVg3vDB1eoMu1g4mpBQgW56RJvlO8GWUwbLZ
 eZZnwjwJNFFq8jjI5y3ZJnEDu6mHl6+ragQBCcCIctzOmWULO74xQI3MOUrU8BHpguRTvasm1Jx
 UY/gq6EZeR824YtnhEltMMEu2uB16cZDYbcxLPWwtnfSbIzf2w55vqukS2qQyM5Zhor+a7DN27U
 X2ybez96uP1ExtFdTrhV2gf7VsIJcri/Jq0tYmmKdHrLkF1qKn8Kb7fpWTpqhrKmdU8joe49/wF
 +uEt7xUW0Pf4cBQAgBQ==
X-Proofpoint-ORIG-GUID: s_ILEcuERUaNsksDsbqINmWNSgcdAPZ7
X-Proofpoint-GUID: s_ILEcuERUaNsksDsbqINmWNSgcdAPZ7
X-Authority-Analysis: v=2.4 cv=E+79Y6dl c=1 sm=1 tr=0 ts=6a575fb5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FtAS-mdK90XYVRSJJl4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwMCBTYWx0ZWRfXw+dclLM2NVFC
 ZpUma6YHS14RqPDhc2A1wpY6T2KPH40ClbS+N+xSbwGpFvLZL2IGjozbkV1X9gT69aXSBRvcqCo
 uSLPRRkU4+HpQurqHZQKhRWsaxQx77k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150100

On 7/14/26 2:24 PM, Abel Vesa wrote:
> Add dedicated driver data for the Eliza CDSP remote processor. It looks
> almost the same as for Milos, except Eliza needs region assign.
> Tie the new driver data to the Eliza specific compatible.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
