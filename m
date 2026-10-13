Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AF73BCD32
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 08:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881865; cv=none; b=DzWv2mQU9eLDtrju17OFZfAqML7sL3wDqEpizHNLIsFx2d+fyixgLiYV1FLanQ1fMs1rhmYn2FrEWK0D8PCFWGcxU6Xa5Hj76bieUC85zXq5BOc31QQgLFusHj1+i/X604ut63vAL64h57d82Rlj+nx5u3S1JiY5Z5yj3EstLjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881865; c=relaxed/simple;
	bh=QnXMdDj8LNbLkg/lz2HpZlfGCPVar7BxEAf5wydzd0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eIE16tr1KoBvhHjjbrfbElnbZwGK8KfvRyY6aQJOM0h4skGb0CL2iNVUizu+PpXo/88ERGTR7LesUsFMFAa1dPU6bPXFT6W0wdeemb6xZtg/H5mxmPKX7B1EMr9vtS6ph1+MJQ+jjDQRCzu+qS4vdLCsgeXtkWD7bCvwuyEflu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PqTICYrM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fp7kRU4u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PqTICYrM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fp7kRU4u"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OWL8015185
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 08:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ge/JV6VZM4mnb+spmEIfQA7e/XZTfZ5TGiGtpW/m7oo=; b=PqTICYrMjyfSv37G
	zNyPV7zmB5FKKpDnrpcJd3YWtlKcASmC+skV/SQKB+XXQnmpCaXKkJz9eQtECPIw
	+tufG27EN9ADrUHt8kDxwmleT+KoHnDKrEFrrIMOE8yeqM1gKtkIWTbJxDddhQAR
	TJxgHQfKigHndmm/t2oKxGKJUwSEK01qrhIs/uveCRacox4KF5VMo8ljg/p6GVPI
	LyaAX627F1/llVtzxR7++CM7fSq3+RoXJubjjwKVHHA/6BhxdMDYPQAhUMZjvNu9
	ZFdeFixIpOno+JLMDpJRBA8oVgIweRncV2APnNDU7iJQBR/F8ht44eS1loG95nTp
	FpMPwg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ugccb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 08:57:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8a9cfe6so35221185a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 01:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881863; x=1792486663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ge/JV6VZM4mnb+spmEIfQA7e/XZTfZ5TGiGtpW/m7oo=;
        b=Fp7kRU4u8QHGoZBPqi8Uv9GWLS/WIwft+oF+K2NOjKShp7KMn7GXG4z3hfw4gff3DH
         cHnUTh5c3j6sNoA1yRS0TApQGK17woeWTmC1k7YmbyrJu30SRUoPWZSDnMrICbvzeHtN
         Lz/b0/V21t+yFlWn6/ZtXEaczLMpup+j0Z2QKFCWokDamAAjoaaN6jZpEbO40PvJ+xdu
         FuI/aVx4ikFWa5m0mseKgM0amZmGykxk/XtJ455mUGwYehJPE6jT+7hZoT68re3lObBJ
         9bc0ULrehyrxvybEDORv7vg/F0DsdqA4I6GGE6mJi80ci5Em94Ttn6Vq4mLzTXNID57j
         LWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881863; x=1792486663;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ge/JV6VZM4mnb+spmEIfQA7e/XZTfZ5TGiGtpW/m7oo=;
        b=AFn/r4JCr1k2/us6Y7wDGei/31CkJjOMLHyZyZXf0SrjXNiptumW8G32z3sksZ8HLG
         NMP/Xf9WMv6gjWUZRtVD+f6j3mnlvlJmGjHvA+wGWW0v6lCmYy9c4D1S9c/a6RhSSz28
         rFbi/QscHTF7azJo5mqCx5cTA1BVk3y57tEoehc39NIUGeszucGO1Pe1a2X4ff6MZ9td
         jPETckunzo96euL/Dw64pBKYp3DmrsDJotkQlSgmk8QVtJGkhSPBENS+xwlLiTOjz+v7
         8rNgv71yss3wTHzKG4OG6P1lT2XsXAdGBiNqnbWzrUfc4D3aPtvDBF1kXdwHOj5BDTP/
         b2qg==
X-Forwarded-Encrypted: i=1; AKwUvByvst2TptPyPFYPd3ResqQR7mnhh+sjXgotMMr2JPVGaY3gDMaa55AeGXjZGljQ1w9ERfaHssq3cDvywH/U/fVl@vger.kernel.org
X-Gm-Message-State: AFq9FYJfQYx1p7lNcMinOY6rCFPafN+fwqpM1DLsZyxE0j/wi4ntd36Y
	7ra/2BFSi+IPcIe3Ys9OTNu0R/OXOXJOAFdBiVxEb67fFBZ3bqwx0gQ+8raW3gqmkfjR2+wODrt
	M/ERbVxdEY9w3aZH0dNBDNmWmD4imnfyekI8GEc8VpAgTpDLdlVHSWcAhBihY1Qhl1GRIvszK
X-Gm-Gg: AYBFou07Iu0lQQ9bYP0bb9qvHWMQDX0//HZ+mxt8zLEIAZpVSxbEexRFJB0pOrD63gk
	NdLh2XXwJjw2Cx5cUH/HNFeOVZVk4uW+QBJDPzWq5G2qh1Jkd9VowkzNNHsl74RLgiv3hMF9QNJ
	WN/GCze2SuMVAxl638ZcD5/l+q5OVymNZoJt3jeLpuV5ylnH820rHmo7HzMnMrxFdvYbemRZFyZ
	rSOtE4f0Al5cTCRCvKU/9aPxVjf9Gngq6u9vCyD7L7BkNB7XFewaolWV0xZ+H5lkkhprsSa2ek/
	xOPbrqL3SiZgOj4ghiP00sO56te+mzkonjFedgknnsQEG4HkwSj9kyU70wsga+iUOTFJmAevT9t
	VbxFY0Df1yyVQIwfm1Dgnxw==
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr2009746685a.5.1791881862790;
        Tue, 13 Oct 2026 01:57:42 -0700 (PDT)
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr2009743385a.5.1791881862288;
        Tue, 13 Oct 2026 01:57:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1c1d9fc0esm2420488a12.4.2026.10.13.01.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:57:41 -0700 (PDT)
Message-ID: <77e47222-e633-4d38-b598-8a02921a5d17@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:57:39 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support for
 SOCCP on Nord
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
 <20261009-soccp_driver_dtbinding-v1-2-40862f7fc58b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-soccp_driver_dtbinding-v1-2-40862f7fc58b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX18Xar3XJZAxx
 KrYbUtp6t5iU99cWSlEIJYp14R58s1c3MX7YGkwXaNeKuycl0+XTniQmhanN6vIr/yAaymwOKup
 xIhOcoiuimQa5tPx6iFsRH6axtLg69WAdasz1QYusckzilG1XgoRknHvgp4KfKwwCsUIOE5zxUL
 kLgfSKKid+pRweXVjelH9OLdOq6klli3HIcHejTDKNAMcS0YlAPyhqbZDGzB1a+tiY+54fskPSH
 8oMhhjLwHza7o8Zxj8Y3Xayl1Mg4FynKzO5ko3/JAvuMNmvyQ3G9qf6IWSrU/amJs9hv+qy5cuu
 SUWWJVHDrZIC7ViruAM5LZiWH3h/x7WLVjM9XUpnZGt5Bt4v55UPOHfufl6yxDIGNlKTtaKvUDj
 Jlb3hqSUAR1YSR1i421EKxxksNTDzK8x3x0sxfZzJvQxIdaQc4r1VmF0bmcFTNzrLgH7jaGJ3xp
 d0uxAbe2pUbx6S+T1Ww==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6acdf287 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pQmoqa-UAMS7fspmYOgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: qZMC5RMiZm9oQbQbt-GwljGJYPS3brlh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfXwNQWJdTyO+n1
 qSG6Pj/poEoffZxZZf/45rS5CcDvHLtIcDxk5YLw1IAT1DJOoeW7+arlnNe3gCf94fXDF5wZDTo
 ITvksPbaZGTEZ3EOEemk1QMQjhChsjI=
X-Proofpoint-GUID: qZMC5RMiZm9oQbQbt-GwljGJYPS3brlh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130035

On 10/9/26 9:35 AM, Anurag Pateriya wrote:
> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
> USB Type-C, battery charging and various other functions on Qualcomm SoCs.

But that's not what it does on this SoC.

> It provides a solution for control-plane processing, reducing per-subsystem
> microcontroller reinvention. Add support for SoCCP PAS loader on Nord
> platform
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index a005546c265d..6fa958044218 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1545,6 +1545,20 @@ static const struct qcom_pas_data nord_cdsp3_resource = {
>  	.smem_host_id = 197,
>  };
>  
> +static const struct qcom_pas_data nord_soccp_resource = {
> +	.crash_reason_smem = 656,
> +	.firmware_name = "soccp.mbn",
> +	.pas_id = 51,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		NULL
> +	},
> +	.ssr_name = "soccp",
> +	.sysmon_name = "soccp",
> +	.auto_boot = true,

No DTB?

Konrad
