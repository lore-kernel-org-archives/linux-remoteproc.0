Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E595A40BCD5
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823462; cv=none; b=u637xavVGttBQMvy7DoqPjjEE5Xkxp1XwP7z06/Qt07ybE9uoTv0amMQ3W1xIEPRO9AWMELcSD3c4hIr9fxSeKcRJ4w43osuJAX2BRBOcBu3I9hWeh/7DxucknopbLCWT/ehKyI+qPpdsYqHdRlR654GrnrwDQPKq0D38EEKycY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823462; c=relaxed/simple;
	bh=5NyZE/pdk1UUcfMYTWurDSt/bJg+fnkkgCBYJNkdRJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Is4qKIH+jYRdm3jOlDEJdF75S3LTdEYXJ43mHFNVHtYvkbZR+mFlRtVTktnKJRcWY4HybNLoHMpAlhiQWBB/dH0qN/mZPTZeygMWDjE240/nLXxacMQvWmXEIYi/F83O3uNjACE5ek3Jm7ac/0HButwiAi5yoOiVUja1FBZchbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6o5P/f4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L1mHIhpD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6o5P/f4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L1mHIhpD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mor81541515
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gD9g9o3wLVxWkvqZBA0nQ7MO4qU/Lgf8nSjItSG4AmU=; b=b6o5P/f4dub0N+sh
	VloUIC5/nznDnJpdi25/JuyuvwG2UEzSJKKvywHK0tZrtZT9KUZ/5rxDpzkAbK35
	dsnM/t9aZuxSxU2dRGIZe6jSc+AjUnNQpE9yweYJ2AHh3rx+0/GCQrqKHV9iLFJd
	l0GX/TT5eBf9LEmr4iI2JoKQon7GYA3eQBuKb73gMscfC3mX6KuyV7kA0Qrm0VgR
	Sx/9IGVhVELkU+ss5iFzAVhFhfcrFPin/yM2k3woV5wD5lCojLKYMgWCTLttw8p6
	JC+Z5uAr7lpj3dOpru9IIxbKchWQWwxRHb/JJjqzOKMn80zS9LHcEIdrMlIPnKRX
	7BmsvQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp2fy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:44:19 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-738a934c5daso68187137.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 05:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782823458; x=1783428258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gD9g9o3wLVxWkvqZBA0nQ7MO4qU/Lgf8nSjItSG4AmU=;
        b=L1mHIhpDJyhyAD5WK+a/yfWPlCboP2MsfJZ5XTrUE+Bm8mHjciwfwjw/VytDe4TJeI
         lHSP5+Wb5h+WsX7ilaX9GOhD5UP7vnr3VQ9aB50Tm+oqc1Fqw3cQNF1GjQg396Udgi1y
         a0yvDOnl8TxejxLGH/lzvDgfWZoqk/AHbMfFFLTsDVaIPpYTSrvgFTAmqKO9nBJXu1C6
         XMGmVpqeJBZp15/cFMzoe8ZIS/eeR7R4SNRTJQ6r5O3m0yhnCoW2avQfHwMj0sbaIriR
         gPQTOgn2uqYH74IbT/wkMlYVvFIe4MWMg5L8DZB393Nf/LXkKhufRp64BV9C1YC+AuGO
         BC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823458; x=1783428258;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gD9g9o3wLVxWkvqZBA0nQ7MO4qU/Lgf8nSjItSG4AmU=;
        b=coNzJoTHZH6a+wk/Eyg3u7RVuslvwyhp0b+n75OMKsh6QmKe6y4cZ4nwcR2Q+7xyUq
         luhglASWaPG53OE1pDSGmx5wQHrI3uZMOQ7M8CdUx5XJPvs//pfgUSbb8OUHj+7LM5Iy
         yM+UhCdWB5ZQH0CwT+V4vNGHLSb6hZkuhsm7rJ5D3xC+FI7PcR4cborrXq9x8QSTnfC8
         YF7QI+6lYiu0t4snJafll4e/Ha5XjN0SmwSuTOIVCqe5TOxv08MRahC/wnFMbJUTSskS
         uPek4aFcFWZND6bbd+ERdFykrxpzKacjscS2eQLvZxv76J2eaYNr9Lwf/Dzv+vOv3dAM
         VgWg==
X-Forwarded-Encrypted: i=1; AHgh+RoQ+r++KN/p/rsff0aSQROM065GizereLNetOx0jwVhi4iz70pC5Nl8+YJCB9PNrcToDhipNqGRkmXIrlstndjD@vger.kernel.org
X-Gm-Message-State: AOJu0YyouEMOZfpCU78uKsRt9Z5YfmLiF6RKN0y5QUmgv4UPwZS6jj1r
	nV0/GT1rGuuaBs+y2dg/lueUUdcqRZuXB73LBlzEgzyKTDRFaDe6YjjLbUOX0K6ojmCnFyczVZf
	IRISiq1wtlYQxehPD26kNa7pTu0s910hefsfNqXtluEjoadfiGl51aHaGiM2AZrl0Op+P4Z2d
X-Gm-Gg: AfdE7cmX5MShgNFIfTuNcmvYvMUymwfl0eCTFVtut7ON+N4SmXuG7Uz/NllOdWjdGr/
	71+E9zZqV/LGjL+D4ofIH20bK27dwWbOHlUIETqPhMsLyMpCYLkCHkY7h1jgl9QfwNGQosjdzaL
	sX61jYyE7fZrugldOK9P/K3ZZovzLy71Z77L0HMOe0tsgUq4+SORCleEw8wSkcK9kjOBgLrxmCH
	4pE7yMAcLkvRRIrbcpeUd9mWGqjMtJ7S0wBy+BLxoD/aj7smaaE1Yg/P1LYwDgxmnzrSWDL+EEv
	vxB7h4iXKxJ8cP+B7dnu5NxDwt41pUyEtcBvPSC8Giem7I7/56Fh7j5KOWncGLt19/L4prguBw4
	G8VGiqCmCSV2lUAOvHyKv3b2O2Prl6BCiqMI=
X-Received: by 2002:a05:6102:8082:b0:631:25ab:8bbe with SMTP id ada2fe7eead31-73a38a37b21mr524336137.5.1782823458297;
        Tue, 30 Jun 2026 05:44:18 -0700 (PDT)
X-Received: by 2002:a05:6102:8082:b0:631:25ab:8bbe with SMTP id ada2fe7eead31-73a38a37b21mr524326137.5.1782823457846;
        Tue, 30 Jun 2026 05:44:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c950732sm1117239a12.22.2026.06.30.05.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:44:17 -0700 (PDT)
Message-ID: <ae6518f8-bba9-41fe-a97f-de6001319c0d@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:44:11 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/14] wifi: ath12k: Switch to generic PAS TZ APIs
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
 <20260626133440.692849-13-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-13-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YUFrWR0QIzj1nWO7eV3vMcERbzX2z3Lp
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a43ba23 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=AoAzlOJtnLSqI_VYGEMA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: YUFrWR0QIzj1nWO7eV3vMcERbzX2z3Lp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExOCBTYWx0ZWRfXzlWAc3duQ4mL
 eDb7NpmMi0wIJLKMagz5/+ZWstPQxV4aVnUdSmvjcqBQxuS8ksrXD9CB7MJB0R0LVe+ZKyNquTU
 Eksv0feflm5nGK2kSTFukZ9H7OuVba8gw1U3g7AyAjrkXvMCy3DzoOnzQ5MA9AJHsrrHTRjP8tF
 NAxq6OrsF7LlrDme6290WwTrYt+Skne+12HTUe+17vCemHhDzKglaT5BoXW/cdFlrzHOipfUBDh
 z783LWfN9PVXf8gjZK4uNyI8ZzcgbHQQTCSBXGih/1ViflNXgN85Vou3g6DW+oML/ZJhdGZ+PVb
 al+O3Mum0JPGmGwGd8v4b2rSiZxlsVqPOPCeAwWgCONYrDEhW4bktra5XmdxC28ZHofDsKIO4sX
 eIxm3GzXW+hPbt4sM6ZFJY7zvd3xM8b6tg32JKGwqZ6H8oSN3anUK/4aVvrLSgdrGvdHzDPx+Mm
 s533Pf6VU+TCJTFZbUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExOCBTYWx0ZWRfX18NSoF7p2Tah
 PUarbFxMAdnAd4VUU6ylBG0tp2IS1wwuFZ6JNb1nGM3hc7vxVXxB3+IhthmbyRlIOaEwVFBoNaf
 wejeSrbNkMmUK6oL8fmjs8SuaMliKFw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300118

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch ath12k client driver over to generic PAS TZ APIs. Generic PAS TZ
> service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Acked-by: Jeff Johnson <jjohnson@kernel.org>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/Kconfig |  2 +-
>  drivers/net/wireless/ath/ath12k/ahb.c   | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
> index 4a2b240f967a..0d5d1c55bfc1 100644
> --- a/drivers/net/wireless/ath/ath12k/Kconfig
> +++ b/drivers/net/wireless/ath/ath12k/Kconfig
> @@ -18,7 +18,7 @@ config ATH12K_AHB
>  	bool "Qualcomm ath12k AHB support"
>  	depends on ATH12K && REMOTEPROC
>  	select QCOM_MDT_LOADER
> -	select QCOM_SCM
> +	select QCOM_PAS

"eeh"

[...]

> -		ret = qcom_scm_pas_shutdown(pasid);
> +		ret = qcom_pas_shutdown(pasid);
>  		if (ret)
> -			ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
> -				   ab_ahb->userpd_id);
> +			ath12k_err(ab, "pas shutdown failed for userPD%d: %d\n",

"PAS" - it's an acronym

Konrad
