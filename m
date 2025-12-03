Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F92C2BE059
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Dec 2025 12:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764763784; cv=none; b=GivspNeR1rN/62mCSkiJzMnNrkrGmdkrTpPm62LQbKgIhddhemFcNwyCTa0JsXenR0usFgIEYZKQZ7AYHbVUdjO18w3dE+cl9ankZPxLgyt/YE2Oax0ePSD9RykKOH7hdjzQ5Znfc/y664yIfNpt/4tTkXaMJa7cXUQPp1t8O/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764763784; c=relaxed/simple;
	bh=jKREOrMEea/Dvf8aCV8zVWNQRNNGIL1A9YE3nPwj6Ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mno1si88hS26PaM0oeP6l5LMASpdKLmFb3/z5jHu+iFIYbPUTMZmG0JczrQuwh8FqSHcroLYaJpqGg3zCWvt7v8M654Lb9iuQHYtFXtJqninG+9lZsYV+3sXjT8FZyZUl7lDjIp7SHFeEFMEmkqwZZeL1CHakYPztyTkbMr19aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RptEFBwL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SQ3oZ+c7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RptEFBwL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SQ3oZ+c7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3B3Drd1374569
	for <linux-remoteproc@vger.kernel.org>; Wed, 3 Dec 2025 12:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oOIwtlbSfFO1paT2asaWBjRDgzfRuNe9uiSWK8bXW1s=; b=RptEFBwL/mRbv2u9
	csWogUpq8z4lhKAIjRduAx42B5sGQJX1KZuxUhJbezhu7vusAo869J4evqm1P3K3
	savVPCrLUGQewp59J0OME03a4p0OP2dCdQDMr27mwpo218DhQPTk4PbWv/wE4NTS
	y9/kTv7wXRf/Z7m0ZEwpXNHTYmKqjB2cdQ67FeJ5KnjNxQ3MMWiP2nfTSJeI/D89
	X5fdn4vOPH0tyOGJ1sMN2nJBxpcCaIlx6JdkuOb4TZ+jB5cRqKW76jPN4SF6h4fs
	ZePZ2ac8QvW3Dyn/ZzFAiVkZFTCK1Q5+IwUa5aYEzDmDRQ0ufGfGxU+Njty5GSfj
	a28m7w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0b85hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 03 Dec 2025 12:09:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b5ff26d6a9so4328185a.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Dec 2025 04:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764763781; x=1765368581; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oOIwtlbSfFO1paT2asaWBjRDgzfRuNe9uiSWK8bXW1s=;
        b=SQ3oZ+c7D+c/Ek7mP/ldVZKlMT9RagW/1MsWvgNoEa+69P0ApW60nHQIlK34kQi+gd
         hUSG68E1A6vVljSV7VkWI2G/kJBAy72AzQDLOt7F2DV0rLhy3XtsfCMEfx8M4zmETj+3
         1aD7G0M4JYGCqa00A3JfwpE4DBMC7ApUGoYUzajSDr3lKP4P2q/vZ2gEpG7hZsj/SuNM
         oBxNa7K5WWbO+aGCelTUGQy70eExIUel4t1ABwrWw/9lAx10+L7PEbgULJRoGaYvFKV5
         YE/9//zdHektKIcyyjza7b0xwrMWqrGUDA3NwdHP4hcKO55Wo5bbflAImGP8IOxxbVY6
         mYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764763781; x=1765368581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOIwtlbSfFO1paT2asaWBjRDgzfRuNe9uiSWK8bXW1s=;
        b=DJTvUd7iBgk1cTv94dVivgMbCwnxOrTaDg6BGnolW6E6p9vZ7niKBHHigMo8fna5l9
         A8SQR0evAfSZdeTIDP85nFLj9/ipU+8yJoMQ5BR5sicHQ1RuodI70PQd4xW4IoMIX2ag
         hLncwTfHP8jbA5MdU3ecOH8We+GJy8+CwgOCQmXevl4X7FKCVMbQ1j9IUclobP/IQM9X
         hmqotCeuv6lzOoMEaIj5DUJsE+fzAkYoRd14xRY/h46W8Osx8D1x08wiY3XOG7I73Wxs
         9r2/J1o47hyLcTuRlradeY+Bg3mVu8H0rxsImNvfDBGRS7SnIGUSGhOPhUUdwJiCGJW9
         jDLg==
X-Forwarded-Encrypted: i=1; AJvYcCWuR0IAaGoyiteBlxmYj867ST9wpm1TCFWTBdoyeXePB80OQ/KAtBnY5Nn4b98HvLB1TNamOmorgQAkfEzWiud7@vger.kernel.org
X-Gm-Message-State: AOJu0YzCcl5FdlTzGXN/H5Xa2rZ20eJ+XlrOxH5weYO6xzPxkq02qL0v
	Gp3flB7WhMgOIp4Mb5MK5EosoguifUslD2QdY19AS4xeGaudhUuoJY86Uhqueqp/28h7WKBLZt2
	w4YoGiv+G33euv5CM4O3oRMzIucaWaRSiO1LBDIAiebZnzA6FDkpUj7c3anELPOsY9ljVUrt3
X-Gm-Gg: ASbGncvKkzWkEhEQ5Or1C3g9ce4zb5w+7slg3CKRlEh6LgJeMydtg83X8FsAgcOIHti
	6HQLe/ErAthv/AAgfQi2oNT2Y99O3M3F5IkrklHUksRUvx+uVjOGbwOpTfaUNqk5w0i6teFOwog
	HJvoE1/3Nxl8/DdUrBo3uowlPPidDtk3IPjiXDfA2x3TdeB9uZF0OLNC0jSXT5nBm9dWDT0l/f2
	jud8BkmvEaSjJR+be+7mUzom9b+Ssmi+T3VdWfv5bB+cUxJ+ninXU1qEdzHV9NrPXLtaVyEeoBV
	tQec1HOEDBwWvR69xoRuZ0nIasRqXtVcgpz5kh52qEVwIwlf7DmLN/fjSsTqQLYhGR3I0SVIzVw
	NY3qG6J6Jv+7i2K256dIRHbtA+/bvP/VAZmkTEqAwHgdBSHfP3dH00c+eC1KMnkunzQ==
X-Received: by 2002:a05:620a:d8e:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8b5f94f5814mr83771485a.7.1764763781431;
        Wed, 03 Dec 2025 04:09:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/tQNWpWIfm/aDbuyctvia+8c7GjAosDE+DztBcruSp1YGOG7lD7uBXr/D5xbZQQkBr8OI2w==
X-Received: by 2002:a05:620a:d8e:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8b5f94f5814mr83767685a.7.1764763780870;
        Wed, 03 Dec 2025 04:09:40 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647510508d4sm18021174a12.26.2025.12.03.04.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 04:09:40 -0800 (PST)
Message-ID: <c743b023-21ac-4e59-97d3-982c1467c8cc@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 13:09:38 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] remoteproc: qcom_q6v5_wcss: drop redundant
 wcss_q6_bcr_reset
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, p.zabel@pengutronix.de,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Govind Singh <govinds@codeaurora.org>
Cc: linux-kernel@vger.kernel.org
References: <20251202162626.1135615-1-mr.nuke.me@gmail.com>
 <20251202162626.1135615-2-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251202162626.1135615-2-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69302886 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=DUJM-m3_rXbjdIdpYt4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: m54iSBXDi5OuFRtT8izQD3xLrU6Izvzl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA5NiBTYWx0ZWRfX1tGppTQKY13+
 UiTdsdWwBbWLbXhUSN630K0+qypUbQJB3xqc0khOa/A/vhdHWG1LRg8R8FLghOGRP5J1dFG30jL
 RBhc3lSFMa4s3mq27AEDKWZWC1V9a8X9HSex+ceSVgUr6jgZCUng2DeU5lxl0kD6L8bD5rirnOl
 9H9iaoDbCtL9bk7sJCxCl6Xdcxf7TNLx7EDopauf8c3oDm8QZc7rVKoJrkG5rmm5MnGgGbF3L75
 q5IIZJrfrUntfORNXs9DyPS9y8EOBpg3lPHWneu1UCfNdnYygJYvBii93CjBcBrVJWPlMytWDT+
 GzoVyu68gfMicaVBwmot5FT4sUzRNx0vyD/LYIHBT+rauMU3eXaZuAoUSb2jY5vzHn55ahRTFQV
 IXjjUyJsovtW70s+UtPZU2Y8Sdt1wg==
X-Proofpoint-GUID: m54iSBXDi5OuFRtT8izQD3xLrU6Izvzl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030096

On 12/2/25 5:26 PM, Alexandru Gagniuc wrote:
> The wcss_q6_bcr_reset used on QCS404, and wcss_q6_reset used on IPQ
> are the same. "BCR reset" is redundant, and likely a mistake. Use the
> documented "wcss_q6_reset" instead. Drop ".wcss_q6_reset_required"
> from the descriptor, since all targets now need it.
> 
> Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---

[...]

> -	wcss->wcss_q6_bcr_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_bcr_reset");
> -	if (IS_ERR(wcss->wcss_q6_bcr_reset)) {
> -		dev_err(wcss->dev, "unable to acquire wcss_q6_bcr_reset\n");
> -		return PTR_ERR(wcss->wcss_q6_bcr_reset);
> +	wcss->wcss_q6_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_reset");
> +	if (IS_ERR(wcss->wcss_q6_reset)) {

This changes the bindings expectations

*however*

it actually fixes the driver to consume the intended ones (qcom,q6v5.txt)
(not even yaml!!!) which houses the description of the qcs404 wcss lists
wcss_q6_reset and *not* "wcss_q6_bcr_reset"

Please add a paragraph mentioning this in the commit message and add my

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
