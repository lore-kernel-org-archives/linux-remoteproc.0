Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B885140FDA0
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823564; cv=none; b=ufyZMavHJQ3LaqbnpwJfm5XlwaXL48/mfYWKREKzWDRje0dUualtWsCddV2pNTwi2MvPj6pud5K6PpzBaALdCQLaYsMONL/4F9ENf7uafZuVAyV0Ryy2aWI4EOwBHsOZkEqGDyc78gLh/tUAXdokO7bgXtXFRF79aoGBQ6PnIvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823564; c=relaxed/simple;
	bh=chBZiGh7yrHmSBv8RUwYVeMHSTVTeDhaR08RhaJsvHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4P0tPm9cH/66MgwM0/a8fJjeW0FTI2BsZDhNIJOLLZVTc89xQTnVgS4q5VbFCv+N+T1noxztaRu71Vaqii8EfzdtY5okmuK26DxPVA6aUbG6y9Zjb5rPLlp1CfjeLK/1/xZ4fmQt4V3tix3QARdkdzx/W3GTJ+ftfty7XHowis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UT9LN4wv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMntgcYH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UT9LN4wv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OMntgcYH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9muPY1522306
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pY1T4mB/1x/HK2e6EPQsvZx0ZxpL5KScVB8u3NbiQqk=; b=UT9LN4wvBVpM64j3
	F2jAsfAILiZjYRi/KlD2eQ0MOKeqL67WC5X0+CrsUEriaIWFUiaGoLlo+n3Pwl9J
	uHDa0/8eFWFat/YWYLfcEJwEd5QF6bX9Z4OwXSJPbGg0GoMUjJkAUkQYMeCuapko
	T5OrkD9h97gJvlQSqmdsZWKCDQzeVfYFjItUkRfQjt7L4093O0XaIj8fw+CsdQzC
	6IzFQuULY5XFAu2s+/EvblbwfMuHoMlkrDqXKEflaNf/oL5S1uzyQqnYyoqrWkwx
	yTqAI/l1hiSsDIEpN5kwtUvgfTLuPIyzfTdhrgxG+nHg7+1/Cl2Pv2f0ACbtuBXG
	VvR2uQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw93dqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:46:01 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73966c839bfso138475137.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 05:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782823561; x=1783428361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pY1T4mB/1x/HK2e6EPQsvZx0ZxpL5KScVB8u3NbiQqk=;
        b=OMntgcYH257QLHSh/HIJ+MQFm9qsxmm+XmK+Y1Iq6ecUdmdRl4MZ3YIczrzS3PjRAl
         nuPA4mDk7ypqSrDazuV9ooVrxfe000mGjsrLzycfo+mB3RY+HB4q9nQij/+7MdUj9EYi
         DLrtStZzR9y4Os0O2O743yF/Co305KNLT1ISNQkhatnLYHe9M5DE0ANeGd7l0KeYf9CL
         3fnCmc2ceLz411iWiVhw35irUmLGswTpGXWTAsYJouw8yevd/ew9gPhCZ6u+b14/vgd8
         mUxUmxLFpL/+4RPffLMX2grQQ5dgTt/3hniJzM4L+pCD3AZHhBhcXN7bt+SoSQy8A6nx
         aPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823561; x=1783428361;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pY1T4mB/1x/HK2e6EPQsvZx0ZxpL5KScVB8u3NbiQqk=;
        b=hN3dUrJ2nVZ4nMz6ayuQb/MJ288Q4gy7HPswFrYPMly+eWdS5WCHi2xAR5tggC6Obm
         Trfg8nT6QRqcdVbvO74n76LttzrJ8N9JJi8yUN4F5TQprvMQ7+B1f42LpW8LWrki8xUA
         Efm8RCCUvFCqClpsoBhKnLrZ4+P0m/bNSnGaNx+Nc6RajiYVrNVuA1r0dhy589IaDmzH
         Oeg9vjLlztQmQDP8ckFibJVsAMdEsALSsAngC4kV5nnXjbXP1AazUWmZ5oVqecMOpJIZ
         6BC8QHdMiRkdrIsCXtg6R1oNyo1XTZWTutgFYo2pB7i0XfqZyj9iPPHqp1XAAFeA5nIq
         MFbw==
X-Forwarded-Encrypted: i=1; AHgh+RrlVS2qkLR0TeEM1hHI2JOwD46qQq+c9sUOZdzzkn+VMlNaZihnNvbtLpw/3zV3ECGvYqtafAXz3h0I8hjP5M32@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1BiLul4cjR2wbzX64EpCunDeNT8armuVSc1ScMkl2pQXuPQLk
	jDu70xU3maWOgANHF1tyjTVi8kr/hWamvOUJNNNUW1hisO72gNVaj7ZXfHbre9pzTlxN7HjxhVo
	x6x++farStsKjbA7CSFaIfmqZaPstG1D4UkUo1fgpG43SbkudzeNQMbX7DUCSnTbGyGRgNCmS
X-Gm-Gg: AfdE7cnBF44VrypSU2mNp5v0akYQQXcShoL856ffGswgd9KkkYSEjMNFU1e2Jg4rfBA
	M5fXD05qS9+6vEFhec9hm8UnrDo26hSXbna69/9pX8IGnvR/uaaZT2rXgMb7ATd/77h+QmeNsR4
	im5KoaucmMMvTgnfC0ejTevxCbTZB4F2Hc7q6668aduBjVjZ079SoLAs0aDaVjWLX5UoweFqgoH
	utdQWKNUZTmbvvo2f/eFOrfZQGA888ojUcHMc9XHpGZY5jCNxx0gWvWwp2fVICRInZlzyvDsTaI
	uZzkoMgKUdRjRdMVkXqCtIBnMVAojV/X1tHR5YDaT0vlkl9lIrlViOIk4TTKrTSN+4cnS9z2m6z
	+8AM1JBMnuC/VAjVAK9lv7xdwdRB9/5stLdA=
X-Received: by 2002:a05:6102:5802:b0:729:5cd5:8cc4 with SMTP id ada2fe7eead31-73a38839d2emr587884137.4.1782823560941;
        Tue, 30 Jun 2026 05:46:00 -0700 (PDT)
X-Received: by 2002:a05:6102:5802:b0:729:5cd5:8cc4 with SMTP id ada2fe7eead31-73a38839d2emr587855137.4.1782823560577;
        Tue, 30 Jun 2026 05:46:00 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c968400sm1131274a12.25.2026.06.30.05.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:45:59 -0700 (PDT)
Message-ID: <b14466a5-a064-4723-8ea0-98239cd50437@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:45:54 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/14] firmware: qcom_scm: Remove SCM PAS wrappers
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
 <20260626133440.692849-14-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-14-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExOCBTYWx0ZWRfXxkQ/o6jPNw26
 Cl7qLIFSfxduhd/Smq/303S/xSKeLxeMMS61yQb/p9eBZCM7RfAyWnhzgDkv8WavMseqxShf3dU
 ikmlECujSLNyArWK+gGbhIOe8jiiezc=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a43ba89 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=n1VOVlC_Xzu4QXtT9DgA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: JfxIajX4tRD6jU9geQO4NuTqAFDrr_8U
X-Proofpoint-ORIG-GUID: JfxIajX4tRD6jU9geQO4NuTqAFDrr_8U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExOCBTYWx0ZWRfX9MAj9cukjn7w
 ZWygt5EqP36OvIe1+i4hTYHLyikV3c3WOA3tUNiaRILNaUydR+PSza8iXg2Kpku1csstnawZWTr
 N6gtG91TYKEXdx6hKMjTntFWmrl1OlQ5wpv4GQkmRgduLcrnAaZ3gRFI00JbQMomVMbB+uE+Kgv
 VjIMDKVUUOnTO+Hsr+JAU2rr2TZ1tdFNqYe0ubrDH3Yv7Hw3K8LzGNiuTRETZtWGylGwAYJkOje
 /UVjN4db+6DIGGzv0IeepIvZr3y17sfsDTUQQX+yfyEg0TNoRRu8u2YUGjqZ5TD30+6lDb6ra/l
 gcNeVCTFpa1B2qVPgIZaN+s5+uNYm5XFBrrfhnCLxZ2RTPw1KJ+lr1Hz5UNLn3qKGsuuP1IJ/dt
 mK43BFVop3bMItVuP5JjEVmZFt0yYs3sjMWqzq1hQg94BbvMGHKzqRdLIQSxpPDAW+PdUKsFlqJ
 +ftuuECLd7UjPTQiANg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300118

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Now since all the Qcom SCM client drivers have been migrated over to
> generic PAS TZ service, let's drop the exported SCM PAS wrappers.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com> # IPQ9650
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
