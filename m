Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D85030AACF
	for <linux-remoteproc@vger.kernel.org>; Mon,  1 Dec 2025 11:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764588372; cv=none; b=XvB/3xdfmJcZhfL7Hjv/i9eEFvTW+TrpMz2H0uoob5UdbydBW7qIF5BO0vEWD0VmoN1sGx1r0ZTQyUqHl1Ysn+zyXTyiG1JzVJNTxAyujsOx3NESF2s1k6pO26BWL9kRmsBXcrc9oVxLEa7znfUwL3AbWIHTgNzuGfEB4bPYu2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764588372; c=relaxed/simple;
	bh=6IrxhExvjWk7VDZGjtssM/4IPZXHdt2RLj7laalC52A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UFuuu31VUUtexkLl8F9i5o8KZRlXn+KVevMSS//pKg6u+RKIDyHzunaZc8DfHXetptFk3HZ0pMVOF8+T8YmhzBwjgXlOeu5qjXIzJDbk/emfaYQLemg1O431PuugutqFHokcMYjwZJkWVyV6OiiwvzNCJGF7fTj9wD4nS9BqaMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nfAmd7Vi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i5IbUSVH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nfAmd7Vi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i5IbUSVH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B16ia6n3689155
	for <linux-remoteproc@vger.kernel.org>; Mon, 1 Dec 2025 11:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6iHITTi5XIIODVrghCRc1yjvFpxIOhxT7Us4d1gA4JM=; b=nfAmd7ViG0aMOBTN
	YigiNvAJyi2r6RthztTJpl2trjsdRN7WFBoVWy/HnnENdFZV3jhieb8xYp7YrnGx
	S5R5VYN8O3GPrax7sdyrOhHZd8SAFVR/g1sq3nCpwU2xDaRB3EIhqCDid9zaOHVL
	+lMOQN6xt4nvnXlT5RG6sjzypod3IV1t3R9yvVVMB/3xRlAtlDcBtWnOlvL/MGZE
	gQP6Oivn9VqrMgq3hY8eEuKL8M4gDepzca6yhNe8I7mYwBHyY/zwWW6p+gnjHRou
	Be2HtFGXh8RMih2G20x7yrIXLwWIkhuYU0eTvkQdDHFlivEUbUlMN5gvngm71WLa
	eMGtJw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as6140usv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 01 Dec 2025 11:26:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b196719e0fso63463885a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Dec 2025 03:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764588369; x=1765193169; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6iHITTi5XIIODVrghCRc1yjvFpxIOhxT7Us4d1gA4JM=;
        b=i5IbUSVHWs8khyE1LILtY72EV8ekMdzig050APkm8ktn2eC9Xq4EK3nns9QoK6999D
         2e6waD7FrxWdREuhLW7Mlm1XbiOgdQDwvnjF9DpnkOMWNBqjKGJCeaGKPnjfSEoXmPuC
         TEePYV0bhUfYFRF8kQcYop4UJxdD7c//5y2j/PFYCj3L+qF+E/yvsyaXMMK67GrY6rx1
         HDb6rv/GBTwBauXHbZABNbni9MQvK4iJmmsF+WJx9sfSTFqcQi9l+X9HD0ASVt0grrxA
         BkXZUh/opj3tu360mSn1YrC4DRq8KplhYfSzA/N9gYSAi1AD4cXfUZXAMZv2Y/KARGgG
         jCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764588369; x=1765193169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6iHITTi5XIIODVrghCRc1yjvFpxIOhxT7Us4d1gA4JM=;
        b=j0B/1DDi5A5icebPLTJdiIueDlCvdoR6FtHm3Vd8j8t/hZ2dQXvRF9/Tm6YEYR3hxv
         TvsLTvLkBkmYR/LFxpdpGsu4QHeo8Sf8A2kQnorGAjHZH1RahDYbnOUX+ncJj8Zllmuq
         jvRC8VPxlZjjZ4ZG3QNZcT2LnKtFUihxvSCAe1I9Ww9/YBFcwDPCsJpdLEXBv8KP9MXr
         BjNz04tDSAbyaQlPFtL3HryvTcHmBGL2QL40qoymLTrfqVpE9wDFG8DfwvKhA7Mv2kCY
         IjLhx41wd9LdfaQYhlE85+SAHTZN5gdzF7+97+Tib1E9bXp5UFkEEbaG4JHoyYlE8VAF
         lv6w==
X-Forwarded-Encrypted: i=1; AJvYcCUGDWfMkDpIbzhe5RVtU0u80B2mBN6yBWysTQ/iUBcD6MOZVF1JbFANElVfl04Tb95c1V/N5La28g62gbA/iY4i@vger.kernel.org
X-Gm-Message-State: AOJu0YzngkerSyNTTm3GSrUTpvS6yXvYdTm8i74+Q7BZxgUuj+wfYTwU
	6Xz/vPvWqw+7UyZOvpv1ovb02rk1FzHSTJk5GIGuD0PuqQw+i6TI5vn/BtceIkKT+eL/tmL34bg
	pbxVwA+HbmYxbNc6fI0A4CjzLoiSCfAD4SxtCbb7ZXYwuZyOWXqenuEpjQiuePHW9kpZuxsgZ2c
	CPmhv1
X-Gm-Gg: ASbGncux+XGCwLcVOXuwxJSf6bKw1Ud2PAgKfv8swZ9P7n3gBcYg79QSrooNp5bglOt
	3YyC4OaCA/+LCuuBVN0jdFutOU897FEqyCnpdo+kMbSOUIbwPtpy7icdOfDyhOyFQ6TLe5rPu2b
	toLbER9XR1zPWZfefGKu1qQqQU8pb2QCrMoDu560nlmG+X5abYsiXBbiTU/d9Byf4N2eCa2sRwF
	0fLS0R4y0rcmX51mPONxjwZcdpL/RxT5W8L3LPj9v1lxfBGKnnxJIupcMRFucS63uNzxK8QJ+XG
	DTJ/Ae9NdeOwiC9XUNmYgdTQL/9JZoDNwPPeqjxhGVSYckk4wUcxrIMlPc7cIJN/eo8QiCWT8na
	YjwJW7yKAt56f5vr1Zilysoy6gfJ2K5/+uKvKFb3JwzJDfUTnMy9GeO+O6QybnyRYccA=
X-Received: by 2002:ac8:5882:0:b0:4ee:4214:3226 with SMTP id d75a77b69052e-4ee5890a538mr372423531cf.6.1764588369079;
        Mon, 01 Dec 2025 03:26:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0iAftvGLjyFXZiA99tzCl4Mr6hi928CdZTn8GAf2wQ2WfuHnbnheonipYSpgDlFtmbFSBgg==
X-Received: by 2002:ac8:5882:0:b0:4ee:4214:3226 with SMTP id d75a77b69052e-4ee5890a538mr372423341cf.6.1764588368623;
        Mon, 01 Dec 2025 03:26:08 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90d5dsm12178458a12.12.2025.12.01.03.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 03:26:08 -0800 (PST)
Message-ID: <d5966849-8dbd-4840-a7f2-2b4e70c225e6@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 12:26:06 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] remoteproc: qcom: Fix devm_ioremap_resource_wc()
 checking
To: Dan Carpenter <dan.carpenter@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
References: <cover.1764427595.git.dan.carpenter@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cover.1764427595.git.dan.carpenter@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J/KnLQnS c=1 sm=1 tr=0 ts=692d7b52 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RdW7LjGPuc8P-r_0oSoA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 4TyvBJmCQ9niUWvaLBgC409fetRsPRdS
X-Proofpoint-ORIG-GUID: 4TyvBJmCQ9niUWvaLBgC409fetRsPRdS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA5MyBTYWx0ZWRfXzyxEeeqIP8/k
 oVvvl0oXNTwB1BHb4Y2JgOMoKHIhO+gUAkivnVatwDOk9cTpcxtxtF+9/RdeE5EA9GEoBkTomtI
 YQ5ubyAyF9QRRFiEXoeHVwpISnqNyWOkoUehoggxbNI6xEB2FIFefE4kQznHRdYTkTU0F2Ekpno
 cqCh+l01y1qRQMksci7IIBfBr3BvQLBPXbAAry7UHUXpWYDUvF6KpxtthIVBY6UP8+Vsc9ez0n7
 nPmyzdiLi8PfjDCRo615f0BcGAljFwl9Kvw03UBFvsKLVetf1yHSRtEwEtpGhmd+WrG4oZ8hKm6
 AmJVJ7pJ3a+8HovgNO3lLTmu23MEOV91mtuUAAUVAqs7QupzbkDNYc1h6isKJ99D/axHzk2xxL8
 QACaj5Yrmk1ujGcDpRWNh+QadT7Z8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010093

On 11/29/25 3:50 PM, Dan Carpenter wrote:
> The devm_ioremap_resource_wc() function returns error pointers and not
> NULL.  I don't know, if you'll want to fold these patches all together
> or not.  Or into the original patch, perhaps?

Thanks for catching this!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
