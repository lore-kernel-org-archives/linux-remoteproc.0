Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3789740C5A8
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823355; cv=none; b=nm2Cp0dmkgewTiR2yfx4AMubvgKWQ1i7AxPhbKZKN9/abOVLwSaAKkx41cZM7J2Am6srlg2sifjYmPvRH5vJHcBi1/455gRvJ0Zk0GQBDcVhqKFPG0CxNyuvvKvBnGcqFoCU0NaprvxxPANBmVCecPSi/R2kAoddF7f9Z0SurRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823355; c=relaxed/simple;
	bh=yXo31lS3cpuo1i5+M8ce0VVveEoe0x91tJ+wogkxxl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EE3fNA4KeLTcEvNzvtQclfW6g3v3FMpOu/cV6UoIGGHsWpPhREGKS4Nz84oA7EjzmQFm6wzipLjCL/OrGyjH5fd6zxhsZzBAR3A5OCFmXF0+dHvCnSmYjiPesD/gYECD1WHqSLD+zgY8fCXNMrZ+//M4GX7stWpBu8cQor25Mno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDALlAFD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Orz606fr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDALlAFD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Orz606fr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9muMR1604543
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vqgiAyPpNCB0A0IntH53l4iOkxkfpMU8dkDpi4Z9XyI=; b=FDALlAFDR7huBxwd
	WpIQ6SpAtlJNosB/BjBaKCGSCxBr9UYGDgxAea5BPhA/iJxfpFmvJ7NPOpawWx90
	pSel/yL0Hy9QAJ85bUk+hw0x7kvr04y2alpgbaiqNd3LoZygWGn3rcAfEMyWuuQS
	AaPFT6C5b+WfoAzB2ITk9au9cNNvVTfsSpFdP+zhh9thg3RcFEqDJlKYgwufpqxO
	+44/GUDjNzNBntgDtsGCCSZe53+bCRnzDu2qDe+sLpFixkaqrd1yKCNbNQyysm/V
	Rtn5XnXLAFjqIECmh2rqZt1brTWzVH5CiDI1CUZi9idMKEpcEz8dvnZfx8DK6af4
	7fbMVQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f462fj8ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:42:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8ee253caso5231411cf.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 05:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782823353; x=1783428153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vqgiAyPpNCB0A0IntH53l4iOkxkfpMU8dkDpi4Z9XyI=;
        b=Orz606frhU0Kd6MVGdBznMWsI02BYdsp0Alx5whYLA73cjMrJTAWhl6NJIyGhmiRYO
         P4zEfY6ErVJ9xI6hRFB5XAKsAmfxOn9hNfPHi/gnJ8PoYUvygguUoHIWZdmBU7aGn7+C
         0gitjqpg5z1YMm/fL0CPzYZUp1o9tmeNXJrTlbGV3h/fx25qPBqoyYj6jMtcfi0woEY2
         fiklHezuiTUzfc+QM7SwakXs5cakMTvRI4DdD4Q9166w2aYN6tUbbbBU0kGcet5a++2c
         tBO/4RZJXhKddYOTb1+b20WlM75hO090pldLKeNHgz1XmC6ajKZMajj7BcwhJyznRd6f
         XOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823353; x=1783428153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vqgiAyPpNCB0A0IntH53l4iOkxkfpMU8dkDpi4Z9XyI=;
        b=eAHnrJtfNlx57xZaJghSCi9nlZcLPwo6/0b/sd4bFH6dH6cX1JjNeFOWQNA9J/Q+xL
         GlvpR64R+t4g8b0NaVlMcrtDS9KtKluQLCAqRMDXdHBE8p5ZmLzAwGakPfr+5qBYEtG4
         zOHQfPRju4hT81eX2tGquxChfBW+5GvQbjFkffvbaUfHA91yJvqY5r2Ya1ea53plvLrf
         npkpm+U5PtHd2YwdiJisH8dqhANH2TZC9xrMg08zSmtMMHPiv3/Foiki6RQM5j0A+9Zd
         k682qjTtR9vxJRtJ1ZF7/qfTw854FxHPFXx80QHh1GPTZlqfeTqafHO8JRxEYMkGnxVV
         1OBg==
X-Forwarded-Encrypted: i=1; AFNElJ+zsCpEySj211SUWhdC+xqTV961tjRYMEPl2pJxsNX4NQYL4Ktet3VUXFLa86T8Mx63dVCjvbFsV7LiaOIhlAYU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz34YXEpR3+xwpCgKVKCEgtChzIzbKhZfTUidutXfrYxbwwtF3z
	uMim8HY7eBzgvfobiMvtIm97ZhTfnXmu3Km73heStvu6dn7YW9OuKjU7JfLHjKZirU+IdyDGhCD
	D/c/JpRlp7+V1dzSorZbw0B4+408/khUqIgTlPYkfmW4qJbeuyB9FdyjgAPnXcW3MWNE/hvkZ
X-Gm-Gg: AfdE7clwaBfBcWXumkmjagaqAiiPPHD6wkXmhD33WRfM9b+LwxhmX158R30KNfLYieL
	TB+fKHjOqXgO0V6lXtxixn+2sayKhzkwQavcrJff1MrV5eBO6mcWswXy4B46kLzzlkseVt4fjY+
	ThE7yi7FguqHpgtwnHqWORPkiydvMXiPuTCV8vUk/OEYSd98crTZF4Jtq2NXigttaHITFMQ+iyB
	nbBIMr+YjJ1IqJf1wqDG1V9/UV2kfVJnJUnRKy283wOwAWcA8vBVJAgOvVpWrVW0hD5miMyf3sn
	yrd7C5R5s89Vs3aH2u3H2PoNlOg3lvtXUyPUeM1AXIizjmCh4RJGI/olqJfmn9dbRzscjYMvgpp
	bvmvXdIFPC38qUZhwT/NyAIDYJyB8dXkZIPI=
X-Received: by 2002:ac8:7fc9:0:b0:51c:215:3e81 with SMTP id d75a77b69052e-51c10754ef1mr27550601cf.4.1782823352544;
        Tue, 30 Jun 2026 05:42:32 -0700 (PDT)
X-Received: by 2002:ac8:7fc9:0:b0:51c:215:3e81 with SMTP id d75a77b69052e-51c10754ef1mr27549891cf.4.1782823351774;
        Tue, 30 Jun 2026 05:42:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f4c19esm118502566b.51.2026.06.30.05.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:42:30 -0700 (PDT)
Message-ID: <c251430d-2184-4ecc-8d05-9cb47533e5ec@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:42:25 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/14] media: qcom: Pass proper PAS ID to
 set_remote_state API
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-11-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-11-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfX0RGvJPI3kWp7
 XJdDQwzzH2qDyXV4lU7LSprslMHrOhrYuyGPnTXoCUiweOvGHpDPE8ql7osO63OuuJoFzhQxAIW
 Y3Wc+igyqqA0WP4iWEQxqETVg9UY1b3Zuav325wf5JkKG8FJtb2h1He4etbl9P6OYzwyA8rNl0H
 itWoiLG5/LQLY4impuukQ9cGof8fuUf4Ff4Yp/PkJnPgw5fNSTJCPa2WpmKEfs/yV8xOJ2LsSXu
 GDUtgKJ3b7pyHAVEVt7pgy2+WY22P+pePM4mU2MHn9Oau7E8bjUOBzC9lxQXwyUnGDJp3GZwI01
 Hgshw0RRSBqtivfPo2MMVabd4zi8ty9IPaL2WIgAM2UtsM85mijhAXFPdc4BQHlSMDoGTYPHV4A
 cDCO7UwZ5LbTNBVhph2Hnrgq608wpwCLMxGl7cprZpMNx/oQpufViNH4PpVzY84q/eoAcUvbtvm
 Lwtl6ojCTbWHd7RO30g==
X-Proofpoint-ORIG-GUID: 96nzw7fqJeW121dFxGYN4S-q8i7NxXLN
X-Authority-Analysis: v=2.4 cv=JqbBas4C c=1 sm=1 tr=0 ts=6a43b9b9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XI7qjyBPQyksM17I1wMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 96nzw7fqJeW121dFxGYN4S-q8i7NxXLN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfXxOcEg48vrlea
 N9lwzM0GmUWAIjdb/y/zBOPgTnFtvV0l40dBLQfBg5Sw2TG4Ct8J4fmU1xNcRXqoWZ13KSgA9Lv
 MqHKwsKCYh9cGYSmYcT9PxuRh86zygc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300116

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> As per testing the SCM backend just ignores it while OP-TEE makes
> use of it to for proper book keeping purpose.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
>  drivers/media/platform/qcom/venus/firmware.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index ea9654dd679e..d2e7ba4f37e3 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -110,5 +110,5 @@ int iris_fw_unload(struct iris_core *core)
>  
>  int iris_set_hw_state(struct iris_core *core, bool resume)
>  {
> -	return qcom_pas_set_remote_state(resume, 0);
> +	return qcom_pas_set_remote_state(resume, IRIS_PAS_ID);
>  }
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 3a38ff985822..3c0727ea137d 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -59,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>  	int ret;
>  
>  	if (core->use_tz) {
> -		ret = qcom_pas_set_remote_state(resume, 0);
> +		ret = qcom_pas_set_remote_state(resume, VENUS_PAS_ID);

This should not be in the middle of a mildly related series..
The PAS IDs should be centralized into a single header. And the
name of the driver shouldn't be part of the define. I would guesstimate
that on the secure side it's probably called VPU or VIDEO

Konrad
