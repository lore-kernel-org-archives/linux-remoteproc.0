Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E3248F857
	for <linux-remoteproc@vger.kernel.org>; Thu,  3 Sep 2026 10:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432548; cv=none; b=o/U1FO30J9U3oWy70MzAXTrbDSOK1FnZm+OWs2hE5J5OhTEyRoRHHy5hxwC+E2dB2B7AujYUvhVKNm+wFNefsNk6LVk0mwDzX/iFjTwvd7PkFQgLH9OuYwV6U73RnFagHBatN4mtP0EJWuSc9v0aJ2sOMupPb3IpY3udrhdwnxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432548; c=relaxed/simple;
	bh=V7R2HXMAXtnXdXbsrItTEEjblLgRYDlhM4guOgcUeSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PSVa4FbZQTEDt3KNc2vJZqDoSMTPmK1aAJTlqF3/7/CjYwnULY4P0Y+J9eou49Ap+42clcG0fERUyRgMv7NgoocYXcC21x2XvYKCtirLtoY+oZsvywWRz/1b0bvtNR5rHRZr2NhL5YL2WtWuWlE5SkOUO0q3cOD/ZRBNpteP7cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpgeDPV2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i/W2Bltt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FpgeDPV2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i/W2Bltt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHMqm055450
	for <linux-remoteproc@vger.kernel.org>; Thu, 3 Sep 2026 10:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bj77K4p6UpDEEg0r6KB3ffanZ5d4kl8IphnCYqVqFCM=; b=FpgeDPV2TI+lgBUq
	C5W5hyhCqz/4QFsOiT/VfgvEOJOSiVdDeY7p623/nksy7hE2gOHtaGz5cTizWF3/
	zMkHULQvR9j/aS65brIlBeIb/r61zkPPQzOb3lsnranMbulpN1Osvpv+8xe2dDZV
	uD/2fD6UU7kRW5wwY9hd4XUiZ2T1QshqmAsE2XwnKe7EwV/SfDRfGKV0lGhIP32a
	uuwuPPk0I9QRK0xWGXAL39XhMBu3j+FElDHt1BOb/VbZynRCR6Bi4dmdveR+x0v0
	07ut90elCu4qXE3zJmrvwlPqRkxv6Nj6G/FBDS9jaPm48oaGimM/RUDIqgcKyIRq
	98QH1g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdvhj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 03 Sep 2026 10:49:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938fd633df7so43249685a.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Sep 2026 03:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788432544; x=1789037344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bj77K4p6UpDEEg0r6KB3ffanZ5d4kl8IphnCYqVqFCM=;
        b=i/W2BlttVFEglFY2xSV3WlB2b9GNVgj5yOJ+ML52NlK7Z1ZgjzfGgcsUl8Gzs4VCB1
         o7yGtpnOuQ4hHsHHKrEnkihYpCKzfomzf1vYWiME/cctuZN5DEtIRWphWgWs/E1ENI9b
         V2gVo3gVPUHUoq/krhfXmj3UYWHJ3To01+30pWqexBxqzktMELmw2Q1LCi5MFjtPpeNh
         A854dIuzIVfRuUNniblC/Sug5trO8jX6waxob4LHnWvboJ0xjScS9ftvom/FWHn1J4dO
         AUn0KguW0nwVT3eyD4Rxb7httVVyzE3I2542sthBnBKNZN3KqyuT2y8sId/RdjVdzHpa
         7h+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788432544; x=1789037344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bj77K4p6UpDEEg0r6KB3ffanZ5d4kl8IphnCYqVqFCM=;
        b=YqoqfG/V/HyLaksXqgt6KSBC5E4HGKJTgr5EUh9bFzH8YSSbq0uiDQsFC9km+JqWsY
         fXUGUYNXcYAYarI0EvBdxsyuCyD/YsAN4I7AQYws5H5NTPCHvrAZ3wsGU0EVzupl/Yip
         o78I98r6IpxOqO1fCYsR7Gj2nvwkWWaeuBNUkOFfASSnik7VkKrUTetuY7jV0bDGy5+L
         rBt5gBKWWWJGadjCBES/eBPhHAQAXe/EO2I5h3gPP0c8afLvq+l1lA/UFszpuX2SGMIu
         zCVsruWUEn/b6CHihhlkZ8ptudPwvvtvJm6ykvLEIQb92CnrklujPZSa8IdvjL3bLb2I
         kWvA==
X-Forwarded-Encrypted: i=1; AKwUvBzCL8T2BkAjAHl8/K+69VCZfFp019BDBVd+orw8/mgT+AtVvvX0Br9TT+Mib3WqaU/tJNbFklamLpNaNat9u2IL@vger.kernel.org
X-Gm-Message-State: AFuF++mK+Jx/lzTH2LMsNH7vHHu2mxjQ08nXO4CJ/EAZKEMuFfRiE+Tx
	tF9TDx8fJoJR7U5rFK80TQeX0HSPj7mjlcs4zmbq+XTVJfHzBY8IcUU9zoYwkRZHzVRqE34q9np
	36s0gLtQd18iNqAWtDzf6vWiEUxYghn2KJ+AS9NM2SYWUy3c/SCUUoyEpYzdXzmAAnEg/JCy1
X-Gm-Gg: AYBFou06qdKKoYLNM04kx54YYo0sUnqq4Hhghvc4FhIp6z+7mOIRc7bS51jQq8a4BiJ
	ux4pS1R9j524zfKtCSxQKFA1PZ4ZSCYbEQOWWQlmgTsiQ2bZX7hZxF3kNdvspiyZqbW0JJlLVlv
	Am42MU0q71bUhqpCTOqeD1jODVFjKAaehbZiBiiovAEd6r/p1B648JuWloQK4/X9/QaynRl4ylW
	QMED+eMnnBiWT349CW/aSJK3CqHAs/Ada4dc3chpq/EnwMkY1tW5ylVurynMjIrb5dDvvDQc2Px
	w+0O35QS5TIJWaLEulj5aRUamaXsxFv/k8ms+b+jSIKeXNYw+AY+Nwx5LDY/OPqYwT+U+DPV1fP
	VOgNmTpfbNnmTmaRgn8QRFg==
X-Received: by 2002:a05:620a:6013:b0:939:47f4:935a with SMTP id af79cd13be357-9396108a4eemr834208685a.5.1788432544235;
        Thu, 03 Sep 2026 03:49:04 -0700 (PDT)
X-Received: by 2002:a05:620a:6013:b0:939:47f4:935a with SMTP id af79cd13be357-9396108a4eemr834207885a.5.1788432543857;
        Thu, 03 Sep 2026 03:49:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41a028dsm81640866b.27.2026.09.03.03.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 03:49:03 -0700 (PDT)
Message-ID: <e637fadc-7107-4d00-b763-fb9f0839d8b9@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 12:49:00 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] rpmsg: glink: Split protocol start out of
 native_probe
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com, tao.zhang1@oss.qualcomm.com,
        peter.chen@oss.qualcomm.com
References: <20260824-rpmsg-glink-split-protocol-start-v2-0-362d7c233f66@oss.qualcomm.com>
 <20260824-rpmsg-glink-split-protocol-start-v2-1-362d7c233f66@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-rpmsg-glink-split-protocol-start-v2-1-362d7c233f66@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a9950a0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BjwrqDpGRvodBn1_W7QA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: FLy3i3T32dvfg8lZq6zwXRL72GcXhka8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5MyBTYWx0ZWRfX82dtAVUlsyHO
 wztdVBTVC1SXaXGusCm6OkmFIK0R+2oBCPZKF/U1M7a2LEtnSNRmwZA/hMrwcAoVjqWuVBh6GYY
 buwbPqoffHY/9JxShXcwiR+jB5GXECXBlXBsipisW0OV8ga8jJ7AjoL3HD51k2yG1txfZeztIWy
 M7BC6P6ZL5LSngPf9psJmfpvfpfhTEGFGrBWH0s/76ycox+JbiU/QwzjftdsA8p2e8k4hEXMRJS
 D29O92B6kmd69vi67aDcBoJt0H61RpsIASNG3OOStMgR974UyGMKNJ6G7+sJRyQvvetzhQE4YP1
 bpheTnm5o2pEaRMG6q7aBMsie3YQsGx+1k+rzUwj2ymsL3ZYobWYg9CVcZEWmZWQSrOoH+YO/Dw
 QZYGvQkBmgvAp+EYh4qW0rKIcx6ttVRBdSzk2KPIcxwPm2afE7wleBWbdLCdehxiCTQXpYz/NdN
 sNp0NeGhY/Yt9k5GoGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5MyBTYWx0ZWRfX3gP2Cgvfmz93
 Z/D8z4KT4HSp3VcreqfEw4EuHy/wPJo0ir2RBvV5Wbf58KevwhXVcZEWWxymojOsssTEI4EMq1N
 HEVG9E9xlitNLA3dsIUMzvbpns4G1TY=
X-Proofpoint-ORIG-GUID: FLy3i3T32dvfg8lZq6zwXRL72GcXhka8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030093

On 8/24/26 9:05 AM, Chunkai Deng wrote:
> The SMEM and RPM transports request their receive interrupt with
> IRQF_NO_AUTOEN and enable it only once qcom_glink_native_probe() has
> returned. But native_probe() sends the version command, so on a fast
> remote the version ACK can land while the interrupt is still masked. The
> ACK is dropped and the handshake never completes.
> 
> Move the version command and the chrdev registration into a new
> qcom_glink_native_start(), leaving native_probe() to set up the glink
> instance. Both transports enable their interrupt before calling
> native_start().
> 
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> Assisted-by: Claude:claude-opus-5
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
