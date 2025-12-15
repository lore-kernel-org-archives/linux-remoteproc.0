Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6938E32825A
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Dec 2025 20:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765831925; cv=none; b=jystx2otdIeiCoHP5dYjps+GPVrPzcoI99b0ntGdX8257sdJgx648ZkJRmaSTD7YH6PcTX2JeWo5mNElHxjHfLvfQ9gjZnpsC3bfyuFTOI/PbmyhFQ12Vu6vN2JCwmZfmPlTyT/Erb/kZkCGGMjKs2XXb5Hl01zz385TxSJJt8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765831925; c=relaxed/simple;
	bh=F0HGmFeCvFDFdqLUT++/PbLDqxh0/4hWuFjrP0Mv2mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5G4nf3IxOXU1Q4w/Ti/LtogYv87o4ltGBbszB2+zAZ6HzdMb/1ww7hmb0sgmI0vwWiNC9+OhhMBEa1lkZmvNpbuyqfbf5EF1mF1EXNJ9lQj8Z/twlNN2omMCQlfJAjxVYsPPyZG2RYy8hG0QBAC1MhS503+WxzXSr9wYQFAlaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXx9Z1Z9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GTKLTcd0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXx9Z1Z9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GTKLTcd0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFGiYUv1268953
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Dec 2025 20:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=URoUYaduLCn0x2dUSjsAdtUx
	WNq54PTEwO8tMWNDZfA=; b=VXx9Z1Z9nQZ1nUvyKg2nGckO65BfhyEE3tOLU+Gr
	VQkwcfnFOS/TXOFOGdKalUia4yDl1Z7U0lHeFY3Jp77ZwmSVEx78J0XVbcR+gmSz
	ED3TQ5mXRRBONZ3R3FVKLbCW1mQ+OSl1zUuf3tre35jv2v67W9GpbKlrmjnyDypc
	stxCn16Cja669a8eacwYQgsQaHtVSGYoSNdxWV0wZXAMqcsb3sAmwHGIAO7gNYns
	ddHMYC3CoIM2/Lj63sryv8yG5fYyXiffHD5Xesft0XEQLpYF8pu0FhurvQisGHo3
	23ypjEhmaWzf0Qnm6hI8wlunJMwXCG0f2GiloEaHLmaXcg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2p46gm4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Dec 2025 20:52:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edb6a94873so72929581cf.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Dec 2025 12:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765831920; x=1766436720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=URoUYaduLCn0x2dUSjsAdtUxWNq54PTEwO8tMWNDZfA=;
        b=GTKLTcd0gnpvnj0y3VGhuCQPEBiVfm6Z1UO7IAQxVfE86FyRClquM6+NouuwZN5/ma
         5fO3I2pOPwQJHJUvRra51hv1NtYcIO1WLsGJgjAMLCYDp+66Ba/JrudIL8d77BCLHnQI
         YpaDKgagVCWIoVOhKUdTGhqXvd52EIeQQSaCYZjUJjuRESI6lnmneS1vaog2utOMZYNB
         1dWMJyL/Igf+Do7ZrduHGEt5Nk8kyk8miH7bkD6SUTPW0p50bYzD6xw8bPS8dVLIoP35
         5kxr+DYfMKc7wK+DD2/2Alx4reQ3th+0ibDeYwr3m3US6yu+R04e4DsRrevXOwdRZZhT
         6mAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765831920; x=1766436720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URoUYaduLCn0x2dUSjsAdtUxWNq54PTEwO8tMWNDZfA=;
        b=HBC5/vbxwH2lyzgAnOVQ4h4GbBTAKzvPsSWCmVwcdR1fMXG9WLL7CiPvqTpwO9hMme
         TQBjgvIOnBwASqnzg0o2IGW6k5vL6Ba07u9/TISMO7EwMBxMKXzkt5LL/N7Eeo+GM/OF
         kmHeUFLAy10iGSSQBy76O+U/5+22in6Vw7V74fmXTdySCzdFnX9Z4piE5Va7VgmOssF9
         tkbWTFUe6T1CXeJ7b6WOhn/Zi0DH3BwKzYF7Ghjb9LvcZP4QimXCMOyOpI2WH9EINRYR
         brxdEXj06hB2au/7tbVo5sA6sA5ih79hXIvhA5gZqPjC5Nlk2FJPc670yWqkv029Sai3
         kKsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBIaMcui3Vv7FQTHAMu22cj2K0izxS/bFm+ZIGx6iplCASt9SOMt+hDXrqYiY94vxoJfEAqn8yw0doMmr6h/1S@vger.kernel.org
X-Gm-Message-State: AOJu0YxlyGyWKfKTbgjbydz82hD3TeFNwK8CdiZ/mdeRFEI9zwuZLw+5
	edphNJj2FVRRhBVxZxVQEPK7ZVNqH2cSwihziID5we4yefRbJN88cHGiqwkXZZaxMVfC7C38vxi
	4SVWvDovJ9aMyTO1okpFshLb74X1/enEc2xQHFrdF1ewhkmtH/iKmDgqDU3Kx+f8y+SX76ISd
X-Gm-Gg: AY/fxX5ZkesBlzNkagBgDDm5aTcEcK9tFyLZOIQ+xZwh949wNDzfFx2JYi/0wK3YyPD
	EOxlrlI0f0WPRESaCA//ie4L83gLQpkqGsSddcTtIy9d3fMy8ZNvH8VrXB6Qm4Y8U7xW2XGYN1U
	PoJUWRuH/4P78Nb+aXhHpCbbYO++MWmoLQWBnrriMpWjfDLgV8DFE01Th4V4HGi/b8n1t03sLhD
	+AJ8sH+smsw9f8FM4heToRBspUUpwKtg8pWtH2gHCZkekGn9eXuJAHvmF3GPceJZkKCdChe3cwJ
	PzlNiB7n16DB5EfEPRqcnmJj/MuKGzSUtBAzzN2zln2206zd1C8j+j44ZdGtOKX8+DOaDLuV8bY
	iHMP1yDTme374nTOgVCKNQF7wAgISqxq9WwtH2i4KTx/uNJPkA9hSgKOIh8j9oyUwKuRhUktJVe
	w3qMGQYG6VE+6lX3MprRRKcjU=
X-Received: by 2002:a05:622a:190a:b0:4f1:ba52:2529 with SMTP id d75a77b69052e-4f1d0466016mr155151421cf.2.1765831920242;
        Mon, 15 Dec 2025 12:52:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrmVCDKx1di47/aS55/yKher3TMRdYD0wsyKcUHHUgfew4Jd4JKdsKJWoXfLO8d/syZI/kGA==
X-Received: by 2002:a05:622a:190a:b0:4f1:ba52:2529 with SMTP id d75a77b69052e-4f1d0466016mr155151181cf.2.1765831919847;
        Mon, 15 Dec 2025 12:51:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da1a4acsm144527e87.32.2025.12.15.12.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 12:51:57 -0800 (PST)
Date: Mon, 15 Dec 2025 22:51:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Subject: Re: [PATCH v7 6/8] arm64: dts: qcom: ipq5332: add nodes to bring up
 q6
Message-ID: <76a7iti26g5kskevykgd4bs7bcqa6uowc56ixdhltt4g3z6xij@dcmtsa35dvrh>
References: <20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com>
 <20251215-ipq5018-wifi-v7-6-ec4adba941b5@outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-ipq5018-wifi-v7-6-ec4adba941b5@outlook.com>
X-Proofpoint-ORIG-GUID: qNWORmLTs6OW5yS2CAFhNl3nNimd0gie
X-Proofpoint-GUID: qNWORmLTs6OW5yS2CAFhNl3nNimd0gie
X-Authority-Analysis: v=2.4 cv=TcybdBQh c=1 sm=1 tr=0 ts=694074f0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=r_DgABtPT30GZMRUrt4A:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE4MCBTYWx0ZWRfX1W5yEhd/5rCC
 cE7w7OoPbBiGruYhY/Q9f/0nAhE+QtBG38NLExI4M6NKkiFUZOJYGwKAP9DWKoBQKjE3nLoWVwg
 B1LQvASCWbt9h1dFXY7Zuhn8EEoehJYKP7hpMp3P2kQ/2oQruKskLmOT3id7ozQ4tl71UdcDrhw
 O1PwZLjjCNKMv+m60GxlGELR7qZEMxY21mtZPSUTrjbJqeUXdhQlYshBTMRBrd1jbNOm0wBVCKq
 R4CS+66zNDz1+C931zPOwokeNVOpP0ggL4on4G8sNEF9RIceM1t/GoKeqZqwXW5pBIupfLxpL2U
 O8SCEJkmmeKQeQs/qPI6PbLx+yklgjHQcdxx9aiNOWqmRCRWJ6vJiptka3Hq4/4xZrbQeyrU3IX
 7+UIbWpR+WNvZpqSEXylqlp1iyCiTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150180

On Mon, Dec 15, 2025 at 10:35:11AM +0400, George Moussalem via B4 Relay wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
