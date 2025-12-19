Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021C828726E
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 13:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766150953; cv=none; b=timVbevDdFG+FAC7KWI/3yKD6hYUwQT+XrXZXeTJZAh1tVWQ9bfsrP/L4phmlsjXBJLkIXt/ylUQv1v8GulEder3QbKWfU9/nuwWNN2ZpGJ2lpsJE26Fl3GlOIQ4WcYiiSrJD3o3rqPoynZwJRuv3m0W2yvrwVB8ydYYwIcW8GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766150953; c=relaxed/simple;
	bh=loDuW4HPDcLcwKVVch1Ot7JWnUYxZwlopciQURmDUfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNf5+/SW7HXk83q+R4p7F4pPel4SB7bX1EGahkoX2sbbZ0g0vJGA3OMLRdV/HR5h+EYtMxikMp7gxUywFqMUE/5hj0vWaf6EAf6scGXqTfAkB7Q9sA8mMQncLXKyQu6toHrehzVzr4hZPv0iCOwsA6hYV7MsBy96sSERvjbfb8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nsvncjr9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jto+47gI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nsvncjr9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jto+47gI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBxYJS092107
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 13:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	smbsNpzzUPtc/SPUUqHLhXKLTT45mdFEONj27OKpOSE=; b=nsvncjr9ayxGA4cc
	vqXJvieK71qgrz4T/zlnWS/dWFVKcQvJHKuLTXEsfnwEePVoZ95xcbfSYp5En3ek
	P26tJnv/Rrmi94pfQ/nUBJDmO2H6nqEw2HpaDIFcKWS9WHilYv5ZZ682EMcZ2YDB
	xKf7fBNd4yPfAUy1kWQ+TxhCx9DXJvTCe1kgwdfF4lQsOhYQTbXnZapHNtYrWk65
	D8IVs+OTWHN1sZTjjtCKgMMft5vh/DeZUoPB44t38vVN/s9jwE/VrhZG1jAwJnsb
	SfaSsu3lDo9d7M55ML0wTt14PvFOehRwIpTxdwA6i7L3ZEIiaEebPJr/KI6ebJtB
	18tckg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2eashj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 13:29:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee07f794fcso4036921cf.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 05:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766150950; x=1766755750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=smbsNpzzUPtc/SPUUqHLhXKLTT45mdFEONj27OKpOSE=;
        b=jto+47gIMWI4kveV9x9pTCBy32EBJsZMQ/ihkjlI7tKs/4ow6QDTeVB9cZUUtTxPbd
         15QkcTkJiRGkgoRdlrWqMBn6pyjDzXQ2FIjQ21HZvxfRPJuaGqDZSK9KhdBjEfvugfzy
         b6lNvSdKlcaAEZMQarpCg51cCnNNlM9RrAVTKDzGaUThFFjthHIbK+yb47SNesRYgsAj
         HSb3vxR7NQtgTQ/eDPEDEZK0LjJUFtHJSgmfaDsGK6UpHpJRXv4QlTGHnR9IclDFpYXa
         gJawBq3vbe8fx6YkTTEPAtEhyXfqE1Ri9KqGh3UINSvs5zvUEhiLy+1jLQwuQJjRiWm8
         HhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766150950; x=1766755750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smbsNpzzUPtc/SPUUqHLhXKLTT45mdFEONj27OKpOSE=;
        b=EWnfgCA+Fj4sUjSQmyxNuiXFkW/H8yqH/iRaPpfGrcdVG2vRU4ZOQKHlpkxZIOC8tT
         YqykQpwL/jwpmZlCSEf8VmxMYeR3LcdH/HIwELpiC0Aoqz08lGb2iKNdo/woWLQeg2Gv
         CoeFjQo9IHlRgbTo9y8lPIhlZcsTxR3QC3ES9rgWtwifG8kA8XVGlX/CIJmObWcOMR79
         s0wrG2KC4m3wMSw7IyjAWpVIAvyF9FGo6HB1SIJnwkmVvHT130q+hsb802bgLZQXTLpD
         j0Dpg2cuwEkBAWjHoa5N8FcDUSjpn29bXIhcbrFX1grfz9wIHGxUXTmN+eWlUk0tzxZL
         kuvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwkMC2Ox/YCGEDs5UFwZg6CpBUSOYJ40jE7tzQ/eZQ71CwH347GGlY4J6VrnqE5TLxFAIr6/A0bHA71ED1DrH7@vger.kernel.org
X-Gm-Message-State: AOJu0YyltCJ1m3r56Zy+8GTbh9PpXWuVeQqiwaK1l65NcPuxDIP5LWBV
	fqBRp/Be6YDuRQisKaE5bSIayR9pWY2SnY2+Wq6DbH/aVH5+V44gIalr55UNxeEO3uNjqzJks/U
	yvNeITt7KvpaB/YExKICQNtex2mW3rLjlpDSc+fTaNe0z9Xz+ArNsYDNhM29q1XZZ0eupnIxj
X-Gm-Gg: AY/fxX6zeN8kfXr3l5QUn3b3f/fg6qdn9vb1H3DtpCOnmwB3Ip3rHwadqJwUxg2BSoy
	qygSSvzEPfaaoA+pkLfgMkvlY56bxC3ckhHejeF2yxKFsKkHORJyVqBwYaxg3+5CZ7qWo7/4BlI
	q4pKg6i0bG9UpCgNE11IYkxBdGZDdOMTBcAvWPo+1i6n0fm2ZpOIYZwZViRz7Bu6Jtow+B6d8Q1
	r2pnLv9zoAl6FXvgUFOQAoxV9Vj/ai1v/Qv30IIXDIyhbL+3XREw9UYjvSaU+OBhmL1XCRWcr0k
	8BTXPorcUGFTREuJRqbKpgrk/kmujx/2CDVKYnSzgI+eeD22sWDBV5qbFrIhXYJrRxxexPpnEy8
	QJZmSQquYVfn6apXUMKleVDUBiBEl30YXBfDlzmbbTT+Oe9XQMUFi4NzWNTDeONVlMg==
X-Received: by 2002:ac8:5a81:0:b0:4f0:299b:c785 with SMTP id d75a77b69052e-4f4abe04451mr26372211cf.11.1766150950156;
        Fri, 19 Dec 2025 05:29:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUYKCkJVSrqW1vxhL870X4RtyrSYTxUNubHW+yqc1lN5UG9ZVKaDlqZ/xu0LZwEiRrzY2E+A==
X-Received: by 2002:ac8:5a81:0:b0:4f0:299b:c785 with SMTP id d75a77b69052e-4f4abe04451mr26371831cf.11.1766150949626;
        Fri, 19 Dec 2025 05:29:09 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91056731sm2215197a12.8.2025.12.19.05.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 05:29:09 -0800 (PST)
Message-ID: <5b9cd24e-7eae-4cbb-b013-6ef135902ae7@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 14:29:07 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] remoteproc: qcom_q6v5_wcss: support m3 firmware
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-7-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219043425.888585-7-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDExMSBTYWx0ZWRfX1mhwvhvTTmla
 XNBXD9dUxxYktzPAwKDJ2qeD0FVoc7NiuCT+4uTmYOkUcEONi0P8S77nu6IBtUL5dAzucMa9m5X
 at4xh2WoAqZVUk1WFx/CgHnahjRPWRHJBzNM7Cs5BRaNIyi5szzAIOQ74FQsrP4tq8MUupTQLwf
 GUKTCyalSKKH7fUSZPDjvyQngj6cqAKy06TCfLFAr9di8IG7TxVk5zN2QIIXr1QlIgtJetfx1s8
 7xlPWyJ92McESjUpucjRqvBufviAt4uG2u2IvvLtJP1A1dzRpepa6SKYxFnlolN8sYR74QB6pgm
 gu54GD6j4jmo8g1O3DCx0RLARnRRRPLkvIBk80bftUrSjckAT6T3DU25xx8nN29zBG0J8JQ8q0I
 8vw05o2av2l9tnnssxl+s7bGpvumT7FWGkn9cOLwZMVRS/0Yw8Ywvh+WD7DRF5+Zf3GO55N0N74
 DDsbksp6xO1nQa4a20w==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=69455326 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=N1TvPJiDMy0C9PSbT28A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: HCKS2q60Klh4kpyXOkD45OI7EjO9V30X
X-Proofpoint-GUID: HCKS2q60Klh4kpyXOkD45OI7EjO9V30X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190111

On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
> IPQ8074, IPQ6018, and IPQ9574 support an m3 firmware image in addtion
> to the q6 firmware. The firmware releases from qcom provide both q6
> and m3 firmware for these SoCs. Support loading the m3 firmware image.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  drivers/remoteproc/qcom_q6v5_wcss.c | 44 +++++++++++++++++++++++++----
>  1 file changed, 39 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index b62e97c92d058..265010c5c82cb 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -101,7 +101,8 @@ enum {
>  };
>  
>  struct wcss_data {
> -	const char *firmware_name;
> +	const char *q6_firmware_name;
> +	const char *m3_firmware_name;
>  	unsigned int crash_reason_smem;
>  	u32 version;
>  	bool aon_reset_required;
> @@ -161,6 +162,7 @@ struct q6v5_wcss {
>  	unsigned int crash_reason_smem;
>  	u32 version;
>  	bool requires_force_stop;
> +	const char *m3_firmware_name;
>  
>  	struct qcom_rproc_glink glink_subdev;
>  	struct qcom_rproc_pdm pdm_subdev;
> @@ -922,11 +924,40 @@ static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
>  	return wcss->mem_region + offset;
>  }
>  
> +static int q6v5_wcss_load_aux(struct q6v5_wcss *wcss, const char *fw_name)
> +{
> +	const struct firmware *extra_fw;
> +	int ret;
> +
> +	dev_info(wcss->dev, "loading additional firmware image %s\n", fw_name);

I don't think this log line is useful beyond development

> +
> +	ret = request_firmware(&extra_fw, fw_name, wcss->dev);
> +	if (ret)
> +		return 0;

return ret, perhaps? Unless you want to say that "it's fine if the M3 image
is missing, particularly not to impose any new requirements on existing
setups". But you haven't spelt that out explicitly.

You also haven't provided an explanation as to why the firmware should be
loaded. Is it necessary for some functionality? Is it that case on the
newly-supported IPQ9574?

Konrad
