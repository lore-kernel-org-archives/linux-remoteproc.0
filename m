Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340803559DF
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jan 2026 13:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769519187; cv=none; b=lgs7zZ7SQJRFHR/Tsu1mkttIyXcHX8cuq57sBVf/IArt1OqfnaTfDtaNgXAxOsNWaijLXPYuL4QVX7g7RdzPX1q1ceeFFOAhb2y+KrNR5gmH4Rab1hdVRnERvIQl+aKUR7NUOsSDJt/VddqATdcBZc2xaXzoHyMgau9PQOhdoxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769519187; c=relaxed/simple;
	bh=jgA/Uujf10BhGbOSNIE1krgPvsTZ8w0jjl4lzAXYgUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDPludL49oymJsd6nwij4F/4jZ+09cPrDKoSEhYnAdPU8W3qfYONrmNg952QrGyk+loAi4jVJuvZV2FHxAKSDtFH8DwmKbO+i/GlNXvmy9mA80bavqoN4pdPC7PrPoV5oDZdkiLqCu2peDh6Bl0HMHG6fzhG8CIPDh82yhAXsQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDVdB0Y+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YlFGzprW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDVdB0Y+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YlFGzprW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R9tH9D3857550
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jan 2026 13:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EWLo9Ea+3GkWbisbwaIrDxm7iAQxoGZnDo5vW6pC4rM=; b=YDVdB0Y+tXBhgd7a
	VPs+WZnJhyirwInsxyHT7uC79jySmwLuVgDU5pD2HFTE/YnLwOYTrlqvywJ3y9dM
	nDVX+VnsF++5AR927VsHANK+o17lhrJ8C6cCLowMix4tKmGryfAEEhiQZVBDaut3
	VD84J2XJUujWy7+OhMKzmvoyBBQTgEMMcvxFahxUS3F5LRDzaeRKhWfvdkePb6GE
	sD7z/xUqIkq1JR+gStvuCJN1TB9EgUbmFqsE4C+d7dcIk91/z/sJqWEb3yhvoirw
	Lw5+ENRIpzDzSVEAkL/IoFFQaOJX+5J4iFGQg4QrKvzS0fiQHjiK2LyptKDVKEvv
	cttsRw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxffs2r8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jan 2026 13:06:23 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9414fc8eb29so1272573241.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jan 2026 05:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769519183; x=1770123983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EWLo9Ea+3GkWbisbwaIrDxm7iAQxoGZnDo5vW6pC4rM=;
        b=YlFGzprWFb0FYvvteAmH5YHShrWoVQCmTLdfrPnmji3bsogQST6PHMIWlXcyX77Qc+
         /GXTK22CxYC4Zdqr2SSq2r8eVKdWZWvi3QQZeXnUFDTHRKzAEi9Y5wYewrP42gkbdn9e
         4PQyyIUHT/1sN0lG0v4U/I0JywCFFECjJQSxAabk4PG3Opi8HSVPJnygFcrNumBWO7cQ
         MnL0CM/3pqeGPm+2nMrYe97hrx97Ik63NYv6L92z9tDfQUnWXf2tNlDz4VLQ1JapnSnw
         dCGwNuObCBwhNhsoufkSGcuc+ozV30TlRqs3hvila/HFHovEQog+KsjYISkXMK1CTYaR
         SuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769519183; x=1770123983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWLo9Ea+3GkWbisbwaIrDxm7iAQxoGZnDo5vW6pC4rM=;
        b=OHmQxUUnr9Kgcqkh347e4qPKbPBOcWPHRXOn6sNIxBbZt2AMgDUKxyXDEo43fkFlqa
         rWRR/8ualMUhQsvxPhExGNvqfap2DkP4YktACD86Su1UoMiiG6ixulI8pdyutNZ3lEjW
         bomhCzTYXjRB8DLTdlxESTvb+NHL5be5vx1+Yyq4G2HD0j/rOPwTCnfg4T2hBnLWCadJ
         SMjmDi3c0ybYq7k9tSu6fvqI1G2WcoF+FB3Qrn+RWKmIS2JP2SVCBz9qkDuzGz/1ksiw
         YGsdCtISIqjr2C5sMUhF3LmEzdCVJWzFkYfW4l4fLPLf+meUaaDqxSX5A8UyqNBWUfLA
         2XUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdtrd15Uuh7cIPapYLdTDhw+vVo3PVlDKrVW9Z2X5C9BK7y0b+YG+OgU8Nu6+ML+QzCdAwQ+7Y2pxrJU0i+DDn@vger.kernel.org
X-Gm-Message-State: AOJu0YyzpE3xFq3GTaY2MxSBpmOXyOQjUqyT+ZhdfTwgIa72dHLOp/m3
	To4ckuo5i323ET2QpyP8HHm9bXldV3AxuL4lscBZKmnQQvPCCk9n7OhhusjWe8PqK9u92v/Vr79
	RiJFRazRaWun4Vnn2mVz9dQHnjKktrGnJj3G8Uo63AACCIapNYVDA1RgOcMeJqbM/bgNi+O4Me1
	tPWio8
X-Gm-Gg: AZuq6aLBbSb6FAjYgEC8uZqcjD1E9/Rq18SQXd/6eUXBrK+8iVc9NdyeNC/bfKdAjfy
	XhMfWG+06d5p7KfpcJlAOYkYQN1yT1mmMb19bNyWNhAJUM0OBVCpKpWTx6o8ZZtgEnXTowIi1GE
	+q/UYWwUxbtIENCQA5NSQwT4yKpA2bn8/SKIxGIcx/Jhfk8VK2Zx0aviA+rGENu+1Mcp3HTgU+n
	jXCEKCbSKA9NrLfwuwsVHm8yesVR1XjRfi/PGlN1+9OlRhVN31ahqiRkixRkmvQJclYjgowx9Kl
	mI/0d0P+pYzacMcvd7/VoJ5Rb2iLGuW8X9th3JhL2SoE0IY+ia4sqoLKCmaIua05PK8c9L1uyxt
	xxQdFSNDACu6lZbQJXcRvLXzt11lPZu87MjGKEyP3GXZUrq4Jbru9Vdob5DgrRIJnaAY=
X-Received: by 2002:a05:6122:91d:b0:559:9663:bfb1 with SMTP id 71dfb90a1353d-5667935b4cdmr288163e0c.0.1769519181372;
        Tue, 27 Jan 2026 05:06:21 -0800 (PST)
X-Received: by 2002:a05:6122:91d:b0:559:9663:bfb1 with SMTP id 71dfb90a1353d-5667935b4cdmr288151e0c.0.1769519180836;
        Tue, 27 Jan 2026 05:06:20 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b92b98asm6147030a12.19.2026.01.27.05.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 05:06:19 -0800 (PST)
Message-ID: <6498dc50-c08a-4416-95ff-06a8ca7db6b0@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 14:06:15 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom_wcnss: Fix handling the lack of PD
 regulators in v3
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: Vladimir Lypak <vladimir.lypak@gmail.com>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, llvm@lists.linux.dev
References: <20260126235018.969140-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126235018.969140-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: og_afLfZzyGLmya4aRrNiTea4VpHOO_F
X-Authority-Analysis: v=2.4 cv=YpcChoYX c=1 sm=1 tr=0 ts=6978b84f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q--SMSCEpvHRqS4MLmMA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: og_afLfZzyGLmya4aRrNiTea4VpHOO_F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwNyBTYWx0ZWRfX428eqv3t5h7q
 QARjuCDF65r52BygJsHNl4Ytwpe9VuEazWAOIh9Fu8OTDk6ZIpoBRzvBleuXI4dz+WuENujj5+G
 HqhahSmCrg6Yqy+oNgDmK/vAOniL7lCKYlaqLAuqS860CVKzvEVLJR2iOkEMKV0YH+T6oGorRDw
 Ir3LZ8jxKNY5LlbRmGSZMkNCvotLOucEL9Y4gv9JjDtyM0QXJnrp4BHADmS0D10pAnaFnST04JS
 k3+7srYwqOXxenpwc4TpjbJvC6cKXy0LYo5pZkMri/p6FNDhQlYmlsOZFWtr1TDIwo3WNv+5h8B
 AdyizKgkYpYaTsr1S1lHzZDtTxAM2mycXfB/9jFJIz3bIUfwD6RdJXxNs+QSdOHB36hm9NvCNHj
 AodZRBnT2QB7CGicZa1h+EtP9sbxtSOIu91l4MW2ELnrxbu6KbjaHmCl9XyGloo1bJ3PGY0AOgw
 4ANo6I4qDFxtOlFZ9dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270107

On 1/27/26 12:44 AM, Val Packett wrote:
> The changes introduced to handle single power domain platforms have
> swapped the info pointer increment from num_pd_vregs to num_pds, which
> doesn't change anything for pronto-v1 and v2 where they match, but as
> pronto-v3 has 2 power domains with no PD regulators at all, this would
> shift the pointer past the end of the array.
> 
> This showed up as a difference between GCC- and LLVM-compiled kernels
> on MSM8953/SDM632 devices, where only with LLVM one would get the
> "regulator request with no identifier" error, because the out-of-bounds
> memory ended up being zeroed. Fix by reverting that single line.
> 
> Fixes: 65991ea8a6d1 ("remoteproc: qcom_wcnss: Handle platforms with only single power domain")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> 
> I'm like 99% sure that this (old) line is correct and the change in this one line
> in 65991ea8a6d1 might've been an unintentional/stray one.
> 
> Still, please retest on MSM8974/MSM8226!
> 
> Thanks,
> ~val
> ---
>  drivers/remoteproc/qcom_wcnss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index ee18bf2e8054..5884c5a52af6 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -454,7 +454,7 @@ static int wcnss_init_regulators(struct qcom_wcnss *wcnss,
>  	 * reserve extra space to manage them through the regulator interface.
>  	 */
>  	if (wcnss->num_pds) {
> -		info += wcnss->num_pds;
> +		info += num_pd_vregs;

The existing code is correct in that it skips the wcnss->num_pds
(i.e. "the number of PDs Linux managed to successfully attach to"), out
of the vregs table (which on all-but-pronto_v3_data is a superset of the
PD list, since 15 years ago the regulator framework was used to represent
all power-related RPM resources)

I believe the correct diff would be to check if the length of .pd_names
is >= the length of .vregs and say that it's the backwards-compat case
(which again, pronto_v3 isn't concerned by)

Konrad
