Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C1C478E51
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Jun 2026 12:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488104; cv=none; b=gIPuMMK9WDRzV/HSZAjUrFsFhBtcpQLyV4KVGqDK41+qU6ID+sxqa7x8GZqhAZtR3B3NPyCwYEXN8t4iItE6DaanBl5TqiHQjS972bCBXEgpB8DI4pwR6MU//5PH543FMURQWr7AAbGGdRde25cTSWUOXrA1QtrTQxeO5E+T+r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488104; c=relaxed/simple;
	bh=0D2Lcsm728ZtcKAOh5KSWzZ8x40xCyxxBYPn6DtacEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLq5KNmv9phLW3r8EBmI/npLV4ZkjktS9VG+SdIysd45XBu7yF5dR631s4EZav/Ldxttkp9Ayle562ZRsSvYsJxrT7eONSaosC1CuA4xIAYwtxhn4GMBfVs23V1vMMt2FCfeHFIk0XUQd2xTPVbRFj2PwB8Ut2c2GnfYNczqWAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JznB89ln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPJkHYjy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JznB89ln";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PPJkHYjy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6539vObh2367942
	for <linux-remoteproc@vger.kernel.org>; Wed, 3 Jun 2026 12:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZF/YoDviXWXeTNepn/0tosC4
	tnxo/ct3hFoteh4vDXw=; b=JznB89lndnBm2S36waIEPlCzQeQqnzDfHuS1ZPdm
	RTQOKYbsr1hCjpht/yBnD6HKrjDxpgR2VeI6gSI62arDILOi9gFXUT2Ox/isCIze
	UNxRVibLTQMTNnSgO1XOhwv/zaYOFeXmOUS7aZY1795lQTr2FmX8KO/RD2zVGHs9
	KuIfKKIc4iU5p1lmwnHofUy8T6xl07Ii32rCgScVDt/7bCbg2zTRMF4s5X2UPTTB
	Hynueqknd3ICqDH0rjS7he6txuzGOnztU8QA0M6NQKolKPkxg4mmlmZljKcxUTr6
	Jx/6vMGDeA9pDWoOiqAjRfRSr2McAtdQGdtA2igH6zXdEA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3ggf7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 03 Jun 2026 12:01:42 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6da8558a6so1913197a34.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Jun 2026 05:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780488101; x=1781092901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZF/YoDviXWXeTNepn/0tosC4tnxo/ct3hFoteh4vDXw=;
        b=PPJkHYjyFcIxn6slopb0im9fcU52zKYo/AwwLxIIhi5FAWyZIMlKJruSI4f2U8gxb2
         0uQfOdqbjQmH2caqQK6QigF2MVzLYzuGUglI/A/E0nGxkwqhdeeup6c7qF7YfNNFgzmo
         UlgZHCuElChC53UWBslOypFHVQI0ls0BTvRwyvQpBBNKPzZKLleC0Y2xaaDfLiJNplDk
         q/KQvhBazsVwBorEwHfZRqBmJ7DrnWNoT9Rg7DSwBevrqSLmSqAd2v7KVn/w7cmhAwJP
         Wkn2WURWo6cEkRitsGXxa4FAtbG0209o5+m7YYVfzj9DVQuS8H/ReQ8ZieUmbI5YBYVu
         +9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488101; x=1781092901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZF/YoDviXWXeTNepn/0tosC4tnxo/ct3hFoteh4vDXw=;
        b=JbuaGs0f0wOwe5I764pdK1LejklOgiczgJT6DYfqWT3Wd9XwEITJHqwb/3wbSsJ+gf
         fdHiDw3GQ41NOkbG77DIsRUevU8AgGBdPYgA9DJW1pFACo6ourkAVOKRLvpNkq6Mglt2
         TNLaF1Ydnb4skzR3A0M0PG7zJfQOsO7gzaz8w73jEC/3IGSvMkk4RnaKBr1rRwXvVhs8
         X0x1+qdGLAxuA4QOv5TjZJarqecSvzUYs0HC6sXBLfK7rFl1pIq2GjWuwWFKOjbenIAq
         q7X4C/XXKbcyDgGr6Xqc75nkNznrao5WIxopmGySLcULjhMQ/sCjzDDvq2yl0IH7tqAN
         GrVw==
X-Forwarded-Encrypted: i=1; AFNElJ8oCKmbzG6T6rWmOLmyBJLYlHipuhCbm586HeXK5vzUQlSX3DHeldaP6vgqWV1Tkdc9+vfJx+9p6uvhkAS6joXT@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw+blVLLAu7IITjfOrdS459HPOJNdoV+usm0OvNEPRWBG0iGRp
	cdaIlgo/e6KgZhW4KOK6rPxlDcK+dGast5IfWh9utJFKzL2YoRtJ4LRApu/n1tnag62jGRm7XfX
	JRAMaYyivsVjcyjp7yzVOMGiZKMTTLfcMMy5qWs6MZxzu4qowyuCo+x6QrwudrgLCfgL26AnTPA
	LQN2faCOo=
X-Gm-Gg: Acq92OHA0/+8lXIWe6wWcn0vMSWYxAvEOjvEJEqibPHuQ36qEDzvsrrt8eERXriX2Wa
	0WvsrZSlW0ZkfcCEA+TakIh/0G5blKHL9vXKIZrIa9UobuAw64IgUKeKH71wGXHmTFl2e9nYJOD
	bwrBuqYL1i7FExkQSmG4ahsKB545n+0mjVENZGjIegkRmJNXiLJJdMHV43L6zLs/xGc/oY+WuSO
	JjfWRnlW6yMvH0vlyHdWFcvJLPDaBeZl5zAm2wxBSvz1+iVU55Tm/8878+xSi+h5N+SAptu9Qne
	gJJNYbl+sEvOsvIys0WoQiIwUMzO9tUUpJkSMMkgcSmzi6TNySF8+p8Nmb2Qi0/HgcDwtwkXU/I
	Ishoio9/xeflHXZLvkX7aDsqbcKNDz8G3anccUe5fm+1fzRgVwV3kXaAo36qXz1MteaHLTq8OBY
	IpO9DAcFwVPVRnPbLePxqZfxv8ocuZgY5oRNKCtodDezTs2A==
X-Received: by 2002:a05:6830:600d:b0:7d7:ea9f:c0f9 with SMTP id 46e09a7af769-7e6e8fae469mr1781242a34.0.1780488101180;
        Wed, 03 Jun 2026 05:01:41 -0700 (PDT)
X-Received: by 2002:a05:6830:600d:b0:7d7:ea9f:c0f9 with SMTP id 46e09a7af769-7e6e8fae469mr1781208a34.0.1780488100792;
        Wed, 03 Jun 2026 05:01:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcbcsm615672e87.20.2026.06.03.05.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:01:39 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:01:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] rpmsg: glink: smem: Use modulo for FIFO tail
 wrap-around in rx_advance
Message-ID: <frnasys4zgfbdmwd26m3fcfskopugye3s4zii6q2uk2w4in4da@kkrj4ffsgfyn>
References: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
 <20260603-rpmsg-improvements-v1-3-dcfc22ed69f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-rpmsg-improvements-v1-3-dcfc22ed69f7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDExNCBTYWx0ZWRfX3nLOBsyY0EVH
 kkEp8/9NoDYXMjrEPDIki8SRm4+UdG10/nGQthen9jXLKmCL7KL/427opV1HOdrcENqxIfU15gP
 u38qXNGIhtxkUz4iA3s0sT9MY8tmgYA/ryTKdwY29RMWJsFCEPy/z0nRE+ffQ34IF9bmPUxsOEu
 CNQ6i1/3fDtnuZ0YVQdBVUkCDSSf4HAoPii36ECIL2eSxSYD/cpk2BFa8lDpYkInI/Rj/b1Hg6e
 LBQu+bFYqjm+c0G1a859sKq7RUADrXKMT5qi98olGLK9JjdnItkFR9nW/d4sVeGYi+bTeulM08Q
 t0vGPLZX74l06FM8RN5Y4nFds6Zjdfx0Pw0B4BlnAU9GFCCZV0ACGWxxYYits7pVPCIjeTxVfnd
 Cg2SykpjEKfIgnssWcCJdcC23lVS612SUBzWHb6sGeuRUYWYQLvzWmB0+bPz0JhGemUhY1bCbLT
 cp5OiuoqJ8XDsnSebKQ==
X-Proofpoint-GUID: Cbk8kELrftjjngX94t9cM6vGQXrVtbox
X-Proofpoint-ORIG-GUID: Cbk8kELrftjjngX94t9cM6vGQXrVtbox
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a2017a6 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pDmPIOVPWH5ddIUMsd0A:9 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030114

On Wed, Jun 03, 2026 at 06:14:30PM +0800, Chunkai Deng wrote:
> glink_smem_rx_advance() wraps the tail index with a single subtraction,
> which only corrects for one full wrap. The advance count is derived from
> remote-supplied packet fields (up to sizeof(glink_msg) + 0xffff bytes);
> if such a count reaches or exceeds pipe->native.length, the tail remains

Would not such a packet already cause issues as it will overflow the
FIFO?

> outside [0, length) after the subtraction and the next FIFO access uses
> an out-of-bounds offset.
> 
> Use modulo so the tail is always normalised back into [0, length),
> keeping it consistent with the index bounds enforced by the WARN_ON_ONCE
> checks added to the FIFO helpers.
> 
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> ---
>  drivers/rpmsg/qcom_glink_smem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
> index 42ad315d7910..4f143921b719 100644
> --- a/drivers/rpmsg/qcom_glink_smem.c
> +++ b/drivers/rpmsg/qcom_glink_smem.c
> @@ -129,7 +129,7 @@ static void glink_smem_rx_advance(struct qcom_glink_pipe *np,
>  
>  	tail += count;
>  	if (tail >= pipe->native.length)
> -		tail -= pipe->native.length;
> +		tail %= pipe->native.length;
>  
>  	*pipe->tail = cpu_to_le32(tail);
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
