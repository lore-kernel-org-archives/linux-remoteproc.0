Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA05175A75
	for <linux-remoteproc@vger.kernel.org>; Sat,  6 Jun 2026 00:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780706008; cv=none; b=mXnaPeNKvulkqUh67+TwufN2Nx5T2Mno2n2uSF+YSANk27GPYy7/ev6qQjHpmia5j9KZbhZCikFNSGPoxXJjeE1gYAra7tkwST2O0mpbdQBCr4KBmtQa3ZIMZ2wmEGchaW2nhLVzq+1K/OoEnZcGk7lWB/mHyc9W705/D+7ae8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780706008; c=relaxed/simple;
	bh=sQRBjDxFXr3SfHUmFdjcdaAOIAmTB/unuKO7H8NrGb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMuenRaSBGBLNEAgnfNI4otzrUX8eUoc2YBVuVnVZhCIfjh54XUf+RRQwM0m+7NWkHpS7cuJhITUTZifZ/Im2k2iLXCpIdT/0X4rncegwtHhPBwnWpVemuUe34lZXcm/QO5Av5YP1CZQwoBvbPnlCS2IjVMPfrFb7+OXM034mOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eenqV/qC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VMuHf7ob; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eenqV/qC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VMuHf7ob"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655NtGpi2096792
	for <linux-remoteproc@vger.kernel.org>; Sat, 6 Jun 2026 00:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2cEb65BDmKUbcUgyRPqAttYJTDUaCl9UW5rhJynFMpQ=; b=eenqV/qC61m15tn6
	2tffW4cyC3KQEVfSxK7kIVASuL1UPl7EwYf/4xq1Ez9iWzV5/nmPPkG3HR881zw2
	b3DMF+ssQYSKyzF/+dAEs0nXOWo3xsVx66n6rbbmq2rm2Wct49/Uj7eMUiiE/eA8
	DPaYE+2ONSw+I36xZhc57zm0I5PgXd8WaBSI+L04C2jjhPdqlOWnamqpoJ4sumqx
	hYTK22lQDlyTCb6jqcQwLADc1c0MIpaOVSHfYHoqsWIRozfhPapTq6QTsrTDqw3C
	VqAlyhE5VMhcREcIAMszvSDy44VXBXwQcTER/mM/e3caT1McSJnCFvsOf1Atpv7o
	0YxsSg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eksf8mewp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 06 Jun 2026 00:33:25 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-13815cb1507so205142c88.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 05 Jun 2026 17:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780706005; x=1781310805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2cEb65BDmKUbcUgyRPqAttYJTDUaCl9UW5rhJynFMpQ=;
        b=VMuHf7ob1gjvYOlsp0gNfplJ5AP5w4EZus01LMYUbyTU72XliRlpY7Kz/7beKAbD6e
         aj2lb1bVg4fnd4VX3KbGlveT9+kHEvq4Zg6H++LNadXWSzk6+LqfdUQ90QDMCEhsSrcb
         qM7ZlDJRu6s5NSBWA9KIcPvksi+Ktb2zrR8B/PAV5Cl+m4I0N46ZDgVpDf6gU1sLsjtq
         VW8pRz265ytKaB8S4jqX3eqXpSMRI3drBAWfxrdcyGkAldLZql6/vc6RQq2+Cj6oGIj9
         JkNQ7Dih09ckLYUpxucUNFze/J6567QJyzvL33Wo4Ak4LiFwH8rF58jajq+pVm/Kk9fE
         v2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780706005; x=1781310805;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2cEb65BDmKUbcUgyRPqAttYJTDUaCl9UW5rhJynFMpQ=;
        b=E9lI2VTdgKZqrbC2pYwc74bP2E7F9a0tRzPM4Tc0w8UfglgwigZrHvbyyy/SOekcok
         Acwn7SMXVhlqqlDK337553xVOWq3L9qAk1zOAnj5izNnKRCE8Sn1Ivp3AY8AHhx/VkCU
         vU5kaXqOSWi9+2TiEzY4sE+TeIUYtlsIyWKlW8zqfNAEsqUATBw5UiB9O2QKPPzCqBcS
         Em5cxJrK5OXvJ04q9UKRFFzP2FuV5Wiyhm/DhH554CgtW1zz01mLAicp9++UY87Wdzv2
         r6OIl07UbKKdynF5XVM15AqZ2Rqm2qoXLIQed59ybC5M49EiFhGOgLuKpUbCN3JXx0h7
         qNFg==
X-Forwarded-Encrypted: i=1; AFNElJ/pbZrozUnHWbklcJF/DZUHtbuH27Xefe3azEjygcKV7/GXqE/KTlyAl1FDWUU/Qe8jSSOv0maYobB0SzA/YrCf@vger.kernel.org
X-Gm-Message-State: AOJu0YxjOVPXdQYZOygbE2ewkvi2ArLLin3q7nG5o4DgzZp/iqx/RBPT
	If14a2h5GDr9O1KjZMESGJhBAKf6E00WTPeM0cYGdivJgF2mSUUDo8+mQASmeFS6PEjZzgHesZa
	pOEDBBzKHvPvE/kWCpY6CgvMb5IYvb9+jCfcSWLOkzwatpA13wj/AZkdQuLoWpf2KyjunV7tj
X-Gm-Gg: Acq92OGtk3q09nJ8Quh6ta8ucaoradhrCxra2MAeechIWMqOtxnct+LMDNiMjp8P0YQ
	Rbz8EErT+1DPc1DpTAX11H79M9jNcLby6H+jVQI227tu3XcawjPG58YXmBVkFt/fHUEDfZJWqDs
	FdzusXbef0y1Y9pIVnD45KT3kxCqq4QFqdEDBTbh8ybsDZBkwWM9MQcSgorTVo+/CRwIFp/zKKp
	8mAuiB6OwVB4Jj7Np03wAfkqqNUpifd0I97oDvKNnhDsM2l63TXjOm4fwKNwYafIPNEwkbzwpv3
	fQNdadHO3kUoUJzqsX30GSS1UvMJ3kEo4s4Wk3rYczz8zomD6Sch80xgJQ70yEYugWYtJy6WGt6
	u/F/GIozDlVIBhmHxudZUKv6BLkJWsx89UmvKyIigkVojUbujy0uaODcu3qE8kQPhe7rpw04H+5
	X4CBxVuxLjSkPtv/plAuSkSjFl
X-Received: by 2002:a05:7022:6999:b0:138:104:439b with SMTP id a92af1059eb24-138067234ecmr3107176c88.19.1780706005080;
        Fri, 05 Jun 2026 17:33:25 -0700 (PDT)
X-Received: by 2002:a05:7022:6999:b0:138:104:439b with SMTP id a92af1059eb24-138067234ecmr3107155c88.19.1780706004568;
        Fri, 05 Jun 2026 17:33:24 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f548ade9sm6695047c88.2.2026.06.05.17.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 17:33:24 -0700 (PDT)
Message-ID: <ecad737b-ea4c-4f32-b519-f338cfd6d48e@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 17:33:22 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] remoteproc: qcom_wcnss_iris: Add support for
 WCN3610
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Kerigan Creighton <kerigancreighton@gmail.com>,
        linux-wireless@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, wcn36xx@lists.infradead.org,
        andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260306004344.10968-1-kerigancreighton@gmail.com>
 <20260306004344.10968-3-kerigancreighton@gmail.com>
 <4f94c20c-d06f-48e5-95fb-5380c84a1b99@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4f94c20c-d06f-48e5-95fb-5380c84a1b99@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDAwMyBTYWx0ZWRfX5YPNOc/W6kis
 riEAcHVrIV6sl6OcoZiLykz3FGT5djM2SaLgYUh54rpOwu4EE3kAj8P11Bv09WEpiuBOejBFPTa
 kk9jE8UWXl8CTei8aaalTuMk1Tq7DV/bj8tgYShUB90prsLwBwDJTImj+RIhCBnLI2ZxpOvsjoo
 DWowWeT62EEMxlXadS+EHtQOdSTWfkvZ4WYd2Zk/VEvIYg5RN5U7VgCyUwrJ/dXkpJtZkBPWRNX
 7BezlI20os1xhQ/e0P4szwIQY7UJ6lmJH5DlV4obmp1h5rFd8BMGIhEvZrv0y+5yiCPY99WURon
 hZlMO7RGvlK7HNJeZlxCKZ/OsTH0AonxVGvTcst3T4rUNMQoDlTWSj3pz3qcwrxvKp85xUf+lc9
 36kLMU8kQkT1YxywWpBhQ+QjeTPoK9NaxjCXye0mA1JAYC3xOJLgbp7hIVl7XGdKdNitSEI3xyQ
 BOHst6bD9kOtIEM29uA==
X-Authority-Analysis: v=2.4 cv=K8sS2SWI c=1 sm=1 tr=0 ts=6a236ad6 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=P-IC7800AAAA:8 a=95oUNTv8Wr7FWHs3mqgA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: W7KnJvvcaQgP9otkGvdahDiumJJn5B-Y
X-Proofpoint-GUID: W7KnJvvcaQgP9otkGvdahDiumJJn5B-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060003

On 3/5/2026 11:25 PM, Krzysztof Kozlowski wrote:
> On 06/03/2026 01:43, Kerigan Creighton wrote:
>> WCN3610 has the same regulator requirements as
>> WCN3620, so in qcom_wcnss_iris, we can use wcn3620_data.
>>
>> A separate compatible is needed for WCN3610 because the
>> wcn36xx driver uses it for chip-specific configuration.
>> Specifically, it sets BTC (Bluetooth Coexistence) CFGs,
>> disables ENABLE_DYNAMIC_RA_START_RATE, and disables
>> STA_POWERSAVE for this specific chip for stable
>> functionality.
> 
> This goes to the binding description where you describe the hardware,
> how I asked.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
This series is sitting in my patchwork queue.
Based upon Krzysztof's comments there should be a v4 that moves some
descriptive text from 2/3 to 1/3.

Bjorn: Once v4 lands, do you want to take this series or should I?
(Need to know if I should wait for ACK of 2/3 or give ACK for 3/3).

/jeff
