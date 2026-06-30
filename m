Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D683F5BD8
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 10:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815962; cv=none; b=TElACnfM1DTrXLiRxtwQkm/CNvkhfDlf84iMjDwHJCQOU9bO7gFa6qKY7722Ff8xbncTQQ9FCCUWz+Bkb82L/bh7DX9B8MMxGsdhwlbNyDumjm3XsIxPRIRB2O7RKlEOmzr11kEhAo4KF5vKJVb4EBqlLYgnqYMufKpGHYrZDzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815962; c=relaxed/simple;
	bh=SSgV13BOWb5nS2Fpmd/8MZ5Xw/5W1uB5JUh+6AiJA7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJqF/XL0YgXisf3QLe8eaNYm12rekm1dTbmxvTv8EPUhQQVZrrUDp+OHW5XOzUz3HZYEIMHBhUaUi6zZSR7Q9rz1shhEcMixlzQjV9pQgtzD9g9Nwc7ZgaiBZJhpZ6IZ+d8IX/Virs0DFgbrvbwT8+Dq17d5kb7eVDRooWg+tDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hHoJy0Gd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g79XJbTg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hHoJy0Gd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g79XJbTg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mt5J1522278
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 10:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u+IixcZnrCq0YCBcT04603GxKzb/cwi1U8yD4nVob/w=; b=hHoJy0GdpI7sLRRp
	KdIXFy54L+WbOkJuva/pydKLahhMIbTrT7EOhyvxEcyKU+kcideHKBtKSLS4iOxn
	NCrfvAQXRkTUaKYfB8FdYIGkJGgR2uB7lui6QOOqsbvTlgPckoDLTgvQ3RmCpcUV
	KYxAGg/nARMOdXydXvycoyNfaNTO3wqtuNyn3C7UPPLZmwJRhuj/EY4icm8RjKwh
	0ZnFk6fM/DjAcUywvO57E6/taLYAFWB2yaVKu3Lkw2yl2v5Vc998/H1sHRI10Jqw
	JUY6sZb3/TOeczq3WpbwYpJ4TjFf8mRl+jpeZ0WTkW/o2vw4kXvQJ4L6gqcrD/+z
	AYx4tw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw92vgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 10:39:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6cb57d25so3646285a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 03:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815956; x=1783420756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+IixcZnrCq0YCBcT04603GxKzb/cwi1U8yD4nVob/w=;
        b=g79XJbTgTFexJZFDoRNQ60kIsPDQB77x3IpVj4bV8cdpumnkIBvHDeArnw7iSx37tA
         du9JlspbNAwjLM2xk0QIJWbJ5pvd1tYcdENbSj8iuO8KVT/VUCPOvdnmJnZtCqGcUAuK
         4oHU4ubHAbfkuIjEvSTEdP8hiPgX/teVp+aeGQMPXtRL60HI2xp/bAYsLv0RaeFfMai4
         K3OrfSJ6Op/thI8vIyoZs/Sz0Dx0AMsJE46bPCHvR7VbWmSKWqxrmu9yfmTk4TS6iU4+
         w/R2XnbBW9lhUbH8TuhEEsmv2K6h4Trl7ANvLc730Y/zKcPVCHiNguziK2M3caIdh8PV
         RuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815956; x=1783420756;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+IixcZnrCq0YCBcT04603GxKzb/cwi1U8yD4nVob/w=;
        b=BIuvEDUdGB5uhtIoSKLWEGzT+uKOsZQ4K0mqYrS+zuddf74Oy0B/RVZQ4GNQcaKJSj
         EU8uvT8j+zH+cdy0nGO5gcrGpGtYioPrv0EizXVLnGHqmRmiF0r3ldznd804DJpEArc4
         850dkcL/QZp/RZBTlfCqbSl2D+NT9uErfENk9WPInh6QBQu+gJBeQ1DEDpLNFDqc72pM
         4RBJeU6UjpIWchnzNgAhwNvFVX/DwmpFQHAvV6twFc8sxDl+PEI4tI+eikDsyseqXqI0
         DtJvp5HPMASrhU/tLbOruSpySuWPBEH/Gbo5MSz0DLBTaGiU/IUZQOq/2EOHdcXxtUri
         TIbg==
X-Forwarded-Encrypted: i=1; AFNElJ9GvkHV6NaZfgY3B6sjm2yHlMW84CxAbbZ4aOawh236iJy5pNPVgiz8Y7nMdIi6YeGYX4ngidoXONN+BxXI1Jjf@vger.kernel.org
X-Gm-Message-State: AOJu0YxZOvz435zL4YIoAtfOxZ4yE9O91d0zyKCs0+6Atk4mQo8IqmE+
	/ofltVXEPxnkZDXxosx8steYiShxJmQGzFzP6+vtLeAGOLBaO/b0BvJkn31jVsmzm8/PksFABWF
	QcUJZK4Yu4xjfJp9JYtbOXks8XHRis4SsuCR/eXuM2a77GqND/9C1/VjGMYiD1rBtGXc1TSHZWc
	pElUgv
X-Gm-Gg: AfdE7cnyWIB79KXt7w4oYdk+IJZt+0ZGyUNyCcpvZLL+P3Svp2e0aTwinC3CmShkwYB
	9zK/+pNH6HH16KyuJZncE1AKvU1fQw3bhrRTtF6Dhea9l2LnBl7OIqt6P3T/M7FRvBObPTLuaJZ
	3xMsgz8JEC3ROZ/VBtG983YMbvp279rYebQjNWRiIlkE5ukEvWflhAwIGLXVVGeg8iA+lnWzABS
	RcOnYH09EcnL8NDFtGdQWX6hczhqHx6lMMeCYlsta4Wur0RjJ5CHglbdYuSyRou7yoOuxKMVjbh
	V2C3Cu5TcBAvaxKciiyOlLJvXYkzUTZgCaLOQU5YVt+ZF2lmjtMDTTnCjUzzHHSlsCXGyL1rfLN
	VYIH4CQy6Uyz2RqJ9m7C13+1uU3IU+0Nvils=
X-Received: by 2002:ac8:5e52:0:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c108197a8mr23711091cf.6.1782815956080;
        Tue, 30 Jun 2026 03:39:16 -0700 (PDT)
X-Received: by 2002:ac8:5e52:0:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c108197a8mr23710881cf.6.1782815955621;
        Tue, 30 Jun 2026 03:39:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f47394sm101229866b.43.2026.06.30.03.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:39:14 -0700 (PDT)
Message-ID: <1c5c6399-e4cb-4d33-8fb7-fdfde0b33e19@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:39:12 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] firmware: qcom: scm: introduce keep_mdt_buf flag
 in PAS context
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-7-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430191253.4052025-7-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NiBTYWx0ZWRfX9R+etuY6WOsW
 GExw+AHZPoQ0hSP5itjVC+RO4Ps2uSGz8HK7ffKtCgR9/ETig8KiAX1DsQLrT73Ay35OQl04LJ2
 bOhDQ056OX0gDw29PXRN5opFIDhixxQ=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a439cd4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=I3VYQ2l06oOMjfKrlQAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: qbRHPF9nE3cq9KfJDTCVtYHoS8jHssfi
X-Proofpoint-ORIG-GUID: qbRHPF9nE3cq9KfJDTCVtYHoS8jHssfi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NiBTYWx0ZWRfX7PdV/upcAD5y
 iO27bveWn6tiGWJjxhZFApzS+OKNGNCudJhQ6K08FjEw4FcQX3TpqSBWdRVUNqXhYNq65tRZMKW
 1ppDEHS0K1Pn3p+p8nmXgxnsMAxyRlwyFWrEr7XfTvYz+mJCzrNFCBEk6sfLr0zaksx+TXT0TI0
 58bt5x3vy2KxisB8FSHIshstzdk+1wUOCFSdlYarqPomueRsfgC9aAQSSt1FLWRKhXkIuW4C0xv
 gNcfVvTQS7xvpRqtkfiqYnM5kIHeAEhFzpTCByWuwW3x5iSoIiueDoXymhZS1PQFofwTCg+94mk
 a7QETBESXWy/K6J6XPPUrO69Ymr75t3xbc08p/JQffeXH4fcVOYf2MSYGPlvlrTBDEs69Z8FKE/
 0NtGdzwW4cQ8woorskSLl6MneivUDkyMg/t2OyEGXzLNEjw77D9xNan4GsRq9SvZ8nz98xOLzNJ
 MNRya0e3zpqc7apKlnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300096

On 4/30/26 9:12 PM, Mukesh Ojha wrote:
> The PAS image initialization path always retains the metadata buffer
> when a valid qcom_scm_pas_context is provided, even if the caller does
> not require it. This implicit behavior leads to unclear buffer ownership
> and forces new users of qcom_mdt_pas_load() to manually release
> metadata, which is error‑ prone and incorrect.
> 
> Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
> retention explicit.  Metadata buffers are now freed by default and are
> only preserved when this flag is set. qcom_q6v5_pas enables this during
> probe for contexts that require retained metadata for subsequent PAS
> operations, while existing callers continue to work unchanged.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]

>  	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res);
> -	if (ret < 0 || !ctx) {
> +
> +	/*
> +	 * Some clients still pass the PAS context as NULL. Until all clients
> +	 * switch to qcom_mdt_pas_load() and provide a valid PAS context, check
> +	 * for NULL before dereferencing it.
> +	 *
> +	 * When a valid context is provided, metadata handling differs across
> +	 * clients. For example, modem clients pass metadata to TrustZone that
> +	 * must not be freed until the authentication and reset SMCs are
> +	 * invoked, as the buffers remain locked until then.
> +	 *
> +	 * Other clients free their metadata immediately after the PAS_INIT
> +	 * SMC call. Therefore, keep_mdt_buf should be set to true for modem
> +	 * clients and false for others.

You say this...

[...]

> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -669,6 +669,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>  		return PTR_ERR(pas->pas_ctx);
>  
>  	pas->pas_ctx->use_tzmem = rproc->has_iommu;
> +	pas->pas_ctx->keep_mdt_buf = true;
>  	if (!pas->dtb_pas_id)
>  		return 0;
>  
> @@ -688,6 +689,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>  		return PTR_ERR(pas->dtb_pas_ctx);
>  
>  	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
> +	pas->dtb_pas_ctx->keep_mdt_buf = true;

And you set it globally for all PAS rprocs

Konrad
