Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C9F2E3FE
	for <linux-remoteproc@vger.kernel.org>; Thu,  1 Oct 2026 04:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790829034; cv=none; b=OMXRRZ5rj/XR2YdphJBM0k6YD/dundykVTxjFhgBJ/DLhU5fb+L4FLovFxyKoKgI8TWmbaUHjGD1lWUSG2ZoFwXIJSt5u0Vs/tff1lakY23yvDdMJDA9zzEc1MAxgPaggpZm/X9Rc4soRRVdWHe2/ERHFpw6sF0CWG8ONOFhwTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790829034; c=relaxed/simple;
	bh=A+HAuPGVEEtFzzKIx71J1O6XHYUXXh3Xiiqvz/WV3es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VSwjikmPwmEpisaTvqbMe0d1frZZ3ERj3o5VSQempgLWrC1Q8oEZ5w8vYriZkton+/sIgQSjBTY6AoDLwenPtZZv+1fW2hZ97kYyYMz1L4eLa5jPXlA3O1mZAW1QUYrKBZMedi5a/Co/+V5E7p+QCyxER2G+OnVHdhbetVOes5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2DLjMEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YDxDXOFg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2DLjMEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YDxDXOFg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gDOj1510995
	for <linux-remoteproc@vger.kernel.org>; Thu, 1 Oct 2026 04:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rw9H7CLFAfPrFnYMkSIdA90XBAFg9HVemgdNbtcsSJ4=; b=F2DLjMEmYfSjhk2X
	dxrAswtz4KApnEFFKw39luKImAWqHKPw4tEggoxkSQhe5gP1yTsW/CxVO5ia0mSS
	Qog083o9xcs8b9kX4d7rZL6w2QNQtXvUuCXy4+c0Vkonl94yIfIldcQy6fQo/JOX
	SM5rQjFR7kg+zHYxvflmKBlQCZTF4i20rHBIoeS5HvLRym4rJrBkh/xWP2TJzIjQ
	pMtnnDVrNqaY6/7CIovA8QqshTP/hxGxMJTQUibQIU1m3l4Q09Rt1iCLvbqctL/8
	UuPyF9a5HEGDS4tp8SG7l5TsB/Tc3jnedS0dNeHnqLI0KSjHxhaUoILd8oWEtCv9
	BnGiYA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh59068-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 01 Oct 2026 04:30:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39533bb224cso8543718a91.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 21:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790829032; x=1791433832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rw9H7CLFAfPrFnYMkSIdA90XBAFg9HVemgdNbtcsSJ4=;
        b=YDxDXOFgIY+oEdtvGLlNZxYPhtoM9y5xidKMzB8HjFuBEjEoEKEmwLzDU/G+8KBKl2
         vftpo45RloKlC4O8ADhmZnjAiMdw97kIlljan9coNVg0WyQZxvRQCM/ZtiKF/uzsZ0GP
         KLwY5LI3CnqcDNnGg9nx7YZmKiEVt46SDRa0HBz9GaThhMzAu/BE/3OPKrrlwn9D11pp
         HuP5ZRtLUKuZ/TjNYBivCG66D2c1KcBmAdP1VGORQLbvtxTbhydVsFxG12tgD75fBJO1
         Lk7AAWyZkF594exItNwMx2i9mQs1IHhUDWjRFwf+iF7B43TBzEPcs0M9rJuPOI/sqMm4
         ReSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790829032; x=1791433832;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rw9H7CLFAfPrFnYMkSIdA90XBAFg9HVemgdNbtcsSJ4=;
        b=Ulxb2BGXeuqVSBhEZ+34c4yl5D7SYUseKowqNZNlvj0bXmim3nF603B3CUBoIFjbHr
         ratj4XoGp78jywhgk6RDYKHRlbOXDYEY64i23HiQzS3e5DP2tGy1NIkJxKxGGsdUlHgu
         biSF/kqSoaAa5yoXsWZLipfbRdFwySZlZVirUyj0hqysqXmttFcMSiQ2gyhwYxt8og8e
         C2BOgf6851HcIg1/ESiNgmPfu5EeU5erdGk4DJxoAbNd9KyOHICipjbk+J29PUoQFbbW
         fPlzP5PyQHhMoUj035LZWZ5Zj6ifUyTNA4KVH01HzjyKTJUdiuFM4cayfbTTNe4diFZI
         eDpw==
X-Forwarded-Encrypted: i=1; AKwUvBwc9j03gwdUM2jqgvp5WVtKnmoFUFPcnfGISCao/jZ25RJc0RPbeKvxSRGsF0BL65UYKFrxXRHXIuIjoGMQmkzI@vger.kernel.org
X-Gm-Message-State: AFq9FYIA2DDsA+x7f5N1sTEiaqzUPoaLbUsNf8xyzr889owm1azWdXuu
	8+VgZHmNQ+YhGCFU9gDD1GJCcSPeib3oE3aCBu4MtF2VO88gO4ngjVAaAKrkANJccFoA+66LSWT
	POe6v7PbB+CQVxVbAF7gU6ylGjWBbTP/p/TIgECqJxT7eTn+KUdsexA6dqI++UbQXw/2OcrVE
X-Gm-Gg: AYBFou11vQrbVSUyJI3ufirvpNzUXj2PLPrVCgu81kU2FRFfO9ldRdpYtY5bbl94EYs
	edMZwleyr/zO0/gAOK59/+bwv1R6IqRSn/rIj8ax+U72kqOSYL3L5TPgyP9G437UXJ7fUtxgUat
	J9SqvN44D0srSzmItj7Idasq2y/sZ5hsEefai6hPE3EEcUuajWAOwyRvGCa1QBZsu7P+8wDU0nl
	4QsATohcCNxT6DDuDtGn8773v9eUKfeqmB0QsmBnfsyot83f3doFNv2qGBb3O/0AmC+GBYw2amk
	QsCYHbFYI7zDNh/0ts6rMDAigayC8gGU5IfEp89M484xnKM373oGrhBg/piFd7Z5EOGGASJtTrJ
	odb+maOpGSm9BuGdevrfUdTvehC4xpA==
X-Received: by 2002:a17:90b:3d8f:b0:3a2:11c1:fe77 with SMTP id 98e67ed59e1d1-3a4d1ddb1c9mr2358363a91.67.1790829031755;
        Wed, 30 Sep 2026 21:30:31 -0700 (PDT)
X-Received: by 2002:a17:90b:3d8f:b0:3a2:11c1:fe77 with SMTP id 98e67ed59e1d1-3a4d1ddb1c9mr2358336a91.67.1790829031165;
        Wed, 30 Sep 2026 21:30:31 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f4372f81sm2370864a91.4.2026.09.30.21.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 21:30:30 -0700 (PDT)
Message-ID: <3b766c9e-fcb5-49bc-9238-48caa085b5a5@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:00:25 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_pas: Add QMI TMD cooling
 support for Shikra
To: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
 <20260911-shikra_qmi_tmd-v1-1-96c1cca82f30@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260911-shikra_qmi_tmd-v1-1-96c1cca82f30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rHd1Ck10U1neagPC_kDQV1ASi8H6L9AR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAxNyBTYWx0ZWRfXwaHqxNG4DqxL
 gphGw72uLmmTBzSd+mDb1RJdEu33H3jTqZEQAOphbQv7imMk0IPO44oDR0g218KWzmn3p9lz2vu
 OyeO2kvB5DWX9KnEZ/3Ty2jHfCCN3z8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAxNyBTYWx0ZWRfX7vX160onu4ra
 fDKb8oAGTAzVxCL5kz7UUYsENzCM2AaaHAwm1zkZzLOfMcH1iU0WPUhbPBxQXeDoKgsgJGKqhup
 /DntEbyLaJsqCBrfAwLQNDBSXQyay3+3DMBqsh4WL8wd5KUany8sPEVSWY0xQlHfrXQwOcLNnX7
 n/s0qC2/z+TBEqayuWIOaXOCJJ+TDrhe59gX8rfEoVrhyKtObppMyZeqDeqDkFY82xCvguqIOK1
 cqfpiLCbPlSDYwa/hKXK8S+6bUadNdU0RLKrQPkIi5y2b32OQYj2vnekgndxQDoi07SxL4Vit8s
 wmhFEln6WWZg6gFRDNkf4tYkQmlUMvx6phmL6ddU9Y+aHa6LSXdSjB4DYwHpscr/l5bCLL+lSS7
 NhTXuRZ9KUoNgY83xcH7gHe2tOVmF2TwrFeyoQJEUyHVmOy4ossWeVWmooQGUpoinO12dNmqk5R
 6+EDf72Px3b7qaylXbg==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abde1e8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=K35ozmOADcEJOmzUQUIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: rHd1Ck10U1neagPC_kDQV1ASi8H6L9AR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010017



On 9/11/2026 10:33 AM, Dipa Ramesh Mantre wrote:
> Add QMI TMD instance IDs and cooling device name arrays for CDSP
> and MPSS subsystems on Shikra to enable thermal mitigation support.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> ---
>   drivers/remoteproc/qcom_q6v5_pas.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index a005546c265d..3daaed6ca596 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1660,6 +1660,9 @@ static const struct qcom_pas_data shikra_cdsp_resource = {
>   	.sysmon_name = "cdsp",
>   	.ssctl_id = 0x17,
>   	.smem_host_id = 5,
> +	.tmd_instance_id = 0x43,
> +	.tmd_name = cdsp_tmd_name,
> +	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
>   };
> 

Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

thanks
Gaurav
