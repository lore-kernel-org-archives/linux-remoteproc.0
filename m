Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4A238C423
	for <linux-remoteproc@vger.kernel.org>; Mon,  4 May 2026 10:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889003; cv=none; b=utVkj4wwpw/MvnrFjbgkAV/q0DhDzm50JjHFp3wLJ7t/D+evJbj8813Dt7HnlH72BA2CsnZypvkQ3Q0vL7KPukF1nCxN97dGjj3f7AhigrmZfb9LQZtCqbgWsQjjs1EYhHc8TjLGzRaFCpl8ZCag+Ej9JYs2zortMBfDbK84F3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889003; c=relaxed/simple;
	bh=27a4ZBAh2T3+ZHmlpGLT6Yc8QyhrRE74iT7Nbf3wzro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FeHbnFZHNVj4fze9IgeYkXIFZjvsUeWt/3ETT2hCiSsB0yNKwbznam8Dwp2BXgReokMIrUll6XPyIynTUmUhpvqaU8qQA+BPAecBP23L8bhWb8gPIEpmkSsnSBleEA4C719Lq82tAHzFh9AO1tA5+UwRxPQogeNdJcyUGobLVeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blFGahv9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNueDgTT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blFGahv9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UNueDgTT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fbns1219618
	for <linux-remoteproc@vger.kernel.org>; Mon, 4 May 2026 10:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dIOaP3I+69NIYahYhn7ZP8dTcKbC+Rx4d1eqqv57oN4=; b=blFGahv92s0HUYjT
	Ihj7OOX/CnOH7LuU5MlrBldveiHSlAs8JLotz5yKAVYzJHzUZNj7s+B7yxCABZQr
	MIeuOap/tRS5v53jzGhONjBC3KV+HTbV+7D6vRW/eLiAunSL1Um+B/R9wppgekbr
	MEUqeXNAyibnAYw91s8LSCwst+PaDxQLLi/30M6EKIHKDEoyTMDNR1eh+c3v0CxB
	wFIh6v4C/U9MaZmtQffoPeagpZF0l4N3OH3roV/REe8FlXEloX5t8SMrJggV/FkQ
	3AgBiYK4NzS36r3ZDhDDQ7ItYyL7R5m9fW/5iHrSm0iYokJjo0HQnTlVPGvxZXrJ
	gYLCuw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwa1en5qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 04 May 2026 10:03:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-364ef32a758so5383094a91.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 May 2026 03:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777889001; x=1778493801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dIOaP3I+69NIYahYhn7ZP8dTcKbC+Rx4d1eqqv57oN4=;
        b=UNueDgTTtbj4AH2YkZwodrcNhNTVZ4zMXMEJF+rXOP6EwqmQBuQpkok8oO8Ri6AL2H
         pUAhDeaBwcPdur9LtT+l5BIaeM+1Brdq6tUNOjMnZto3WZS4R8QHnbi50i5orSuLdsL8
         vFb0Bv44VjE63//J/5724sJcZKMY7R2LA4bZApNlsyObkq1ChhFFjIqpH8nDfjk4TS7/
         8dnq21r9aAev0d0ahI4YYkNEm/GCIJRQl35ixPGrHx9Tqc/MmaUOQgnR5/5xk5lK4RAJ
         t8gAClJVCgZ+GalIwtQaLbDpIbceplcIjfGYfQ4jdrjPWaxgCDCWjjcLQCRJ1vDA3qaA
         W4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889001; x=1778493801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIOaP3I+69NIYahYhn7ZP8dTcKbC+Rx4d1eqqv57oN4=;
        b=TXCvf1g9GtoyPNaqHCkOY9ByziT6EF5hYWdhkLId4vxLaRCF20kxiWdcmXeBh99w88
         RuI86HTUZHyejh4JkrApBjgsMYH9k6HVj9iMtDPMmH8l2k7U3UZzBFm2cLGT8wfz4NMg
         32lIK5Gpi3/ryNjM4wGAvlZ6mx7Idt5CcL3Hphn3eZ0ERkeiOaLLJypHNrUHWMv0anll
         zrpA3t+86VWmXpxp75DGzU2c5ay2pYDejiGhTbVoyL43K4U60u/D4tQiv9LIriyBP0vM
         gEucxfdFRWqzZTYP6kLp2gBaML6lQ31s7tt2maubZM57RPYXgXsnFTM3B7E3HmHVbR9W
         LkYg==
X-Forwarded-Encrypted: i=1; AFNElJ8T1sSPzjWPG+lOFs7gq1Z3Iq//6ElJt0f6jVK2Ks+NUDtc7cy2+D86xMn+sEoTxiwPSMXXbb1i0SX0ZjkeriJ3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz96Kdr75sFZuvowdqqRjFW6xnCmGG5Vwo7/D5+NC9Y+HSjRj4z
	CQ7JUr8Psi+lTwTY7TPtgPtj3ttmii2Z+KTI2i1dMqLNwUE7zumFOf7L3UUiDG55DMKAhwsuhfT
	HF13Sk70hlraqnw7GCQlpXdC4A/UthmALyEATBTMX5rcv4cC3KFwtuhJgOi6T2XzHlSfHR4z1
X-Gm-Gg: AeBDiesAAFAIsgEVqTj37sMRtHd4Gh437/sOpIz1yu5wMQLpcJii/lj6xgNRyD+mGOA
	p5f5XwWEwNnP3MoIfn2Ngan5P07RUh9DHpJT4H9xYB7PBm/BXbb5coNPtB0GJylUDNqx/2TRO4V
	NFDI3cYMDexGBXIPVbb13pW9g+Il2T8f+IMTmifMBGktiGCDsdtVfoMJLfJ21OEp1hYbqMXpX1Z
	bZbyC5L3i+tQFC43KQVHpfDK363ulcoQpQEKcjgG9wwtk8AmFVeP3BFLfCUnufOohwnY3XHK3mg
	imZIQnuEqSc405881eaICR80FJ19jUZ9HXRNyLWGrhmT7x/Fl3h4ZeRoFXrfpxmRnV+X0jiFPLT
	P+NQEq5HyNxRKBtWMdANX9o48JOfWlTc+gR0I39QH+pdNhO/x6C+TOgU9lPqNHQ==
X-Received: by 2002:a05:6a20:3d11:b0:3a1:76d3:c1b0 with SMTP id adf61e73a8af0-3a7f1cb3fc7mr9308984637.22.1777889000738;
        Mon, 04 May 2026 03:03:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d11:b0:3a1:76d3:c1b0 with SMTP id adf61e73a8af0-3a7f1cb3fc7mr9308931637.22.1777889000200;
        Mon, 04 May 2026 03:03:20 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbba8fefsm8933909a12.7.2026.05.04.03.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 03:03:19 -0700 (PDT)
Message-ID: <ab4b5257-92df-4201-ab04-436ab77b2fd8@oss.qualcomm.com>
Date: Mon, 4 May 2026 15:33:06 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] firmware: qcom: Add a PAS TEE service
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, op-tee@lists.trustedfirmware.org,
        apurupa@qti.qualcomm.com, skare@qti.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-5-sumit.garg@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260427095603.1157963-5-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UO_4yVpMqO_vezFytZRl6jWGOYmpwRN9
X-Proofpoint-GUID: UO_4yVpMqO_vezFytZRl6jWGOYmpwRN9
X-Authority-Analysis: v=2.4 cv=e7U2j6p/ c=1 sm=1 tr=0 ts=69f86ee9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=6olnGIjaqZ5DSDVW89IA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwNSBTYWx0ZWRfX/OdQMKnx/KIi
 xyE9DaQVYlO6C8iJuNwLty58Z6dseIGrxdzsVwRNuKNkZrjbPMrFPp4VLtJmn0OwQvmfPbDIOC8
 hnFGgCwuY7seKlW9u36LG7Nu1XRfrOmIi/rQri9ULOmmlUHER5ABgpPdxPliWQFhG7Fo1v7cS8e
 SQtM1sT5lm5HB2tpYGBZtVeBxDeQmXykF37pzYtVZdhQ1ny8Pj05Dn8CJzfMpNBGBMs8ocFNWWa
 riPxZgnPwuo56bOoQ6fh5v1zwf5+8DCfNKpuHTU4n5/Kep6o3D6PSTzoCZN38TV5M+ciDqldhWm
 LLUIfwGSpq51sUu3tL35K0tornm9PWEAlycC0OKkX74Vp5PVBw4g5G67EUo1Kr98CEUtuJtG681
 Ya8wrAfQeMesOdStshuUCPdeBUpFtrnBW/R7parm+nGmSCvD5JJguyyLAMaUR80UMMu1RFrqb0U
 xqIjXJywm2zDxSNmkMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040105

Hi Sumit,

On 4/27/2026 3:25 PM, Sumit Garg via OP-TEE wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Add support for Peripheral Authentication Service (PAS) driver based
> on TEE bus with OP-TEE providing the backend PAS service implementation.
> 
> The TEE PAS service ABI is designed to be extensible with additional API
> as PTA_QCOM_PAS_CAPABILITIES. This allows to accommodate any future
> extensions of the PAS service needed while still maintaining backwards
> compatibility.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/Kconfig        |  10 +
>  drivers/firmware/qcom/Makefile       |   1 +
>  drivers/firmware/qcom/qcom_pas_tee.c | 479 +++++++++++++++++++++++++++
>  3 files changed, 490 insertions(+)
>  create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c

[...]

> diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c

> +static int qcom_pas_tee_mem_setup(struct device *dev, u32 pas_id,
> +				  phys_addr_t addr, phys_addr_t size)
> +{

[...]

> +
> +	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(dev, "PAS mem setup failed, pas_id: %d, ret: %d, err: 0x%x\n",
> +			pas_id, ret, inv_arg.ret);
> +		return ret ?: -EINVAL;

Following the example from qcom_scm_pas_mem_setup() here:
https://elixir.bootlin.com/linux/v7.0.1/source/drivers/firmware/qcom/qcom_scm.c#L778

I think it should be:
return ret ?: inv_arg.ret;

This way the client (say mdt_loader) knows what error OPTEE PAS service returned.
I can see that is tries to print this error:
https://elixir.bootlin.com/linux/v7.0.1/source/drivers/soc/qcom/mdt_loader.c#L286

With that,
Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal
