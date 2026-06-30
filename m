Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCF340DFAF
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823424; cv=none; b=Dj9MC83qlxBWTrf7s5q95InugnE51VWgV9w7+NYSUzXANKV/qOX+8IzQXfoNDa5uTdEcglEjgtc6xCO3FtS8dky2Higr1IFY6fS6HoDPlZu0fqTSNIyQJZj359YrT1QiRocvxrdqafE1/OMhLYTP4QDO+nDElg8ZwGhM7PP7+T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823424; c=relaxed/simple;
	bh=BgY00mBvxWkHejgPkucyLWTBpsCWCY5fK1NqMPCqd+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OC9EQ7xyw8V8emMdaFExC/3e/TyNhb0L3HPGEl5DNmx/zzy4g5cehLtNYtbesmjhDpHHJzrFR9LOHCAUVvpb7au4GblmozDgHtY5JV5txfrMneQyKaWQvDYtIwddigQ6QwRulzSrrb2Wvl61wsAqcShM7bubCFn694W3tCNzcYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F3n0sFhN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UedqZOc+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F3n0sFhN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UedqZOc+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mtv31611941
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	40HebzjMVnQxUW0qFO0coiRdTK0hbU3rpwuRRVO0fek=; b=F3n0sFhNv4vOtoPY
	BXpZieU5OTwgT+HxAP0Ui+awldHBAbEr4vblIJ9IdeTx7g2gtRrx1GseILh+9/Zz
	aUmOUzW30aW1DfxX0b6aivoylCA8dyu5nTTHJxTXKFcXYQeJpUqRYcH+cRLQPY2L
	mgBawKtvZMT/4MLeuXXScRU9UDEzx2vtpgQNU524wiU4QVKVdS2TJuOs1bU1B4gY
	PP3d9nugzR1z9WpP3ZipFIsVzxeM8o5ivIptJ8TRF5ogVjGNk69Bk7kkhKrB4KZH
	SX87UJJTfzONkxOeiEhrA3XT5VKplB3UT3HP8JIyDOMh/eDIuUKMKAkX4IkMSFbr
	Mib4eA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gtn84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:43:42 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bdcef50495so3956e0c.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 05:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782823421; x=1783428221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=40HebzjMVnQxUW0qFO0coiRdTK0hbU3rpwuRRVO0fek=;
        b=UedqZOc+rqU/MtSH03B7AJY779it/pTkJP4J5i28GgIC0o8ho1o3hdu4M12l3vyfjN
         kbplrwRR4jfH0cFYyJzfnokej6LAbjM6XJQ3iRiaorwK271KhRx313fiiDeJo7iCRz8g
         VIZPshhB1UvppaFlaV2hZi5NF2mjdfCVxJqd2ZagYf/sjh/SIZZ50IZ7jIvogIqfZSX9
         sMCQQRJMpzeUwgcDy3NZ1OIdWSgb/8a7JlIC1kQht9dQIVSEzXt0B/R3wo5fFUn0fgxr
         tUVDb+oBKfz81nK0FtNw/e66791FhD5e/BrMVGI5lxzBOZlJJ0kviYWKk0V374K5Ja06
         SZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823421; x=1783428221;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=40HebzjMVnQxUW0qFO0coiRdTK0hbU3rpwuRRVO0fek=;
        b=bkPZi2Mzsyat7hihE0orHCpmnjPKg9QwRpaFlFedHGYJV7uH9G/SK/d/6AWHezUG7b
         LsFT4aikAuctkg2KZuMib/zxRgZVlg9xl0mVJQbo0e7+R4VVqoj+rzoCn8PTTT6X2pe7
         073T1IYjjNSHcUThNOldBF1IowZYp5eazyGcNNVOg1sY/7cbLQVXxOGvSvuuq808+oPy
         86D90vCT7ZGlXNKPb863kkCftLb/Vixybz/O1l/fknJ2bPenI/MitaHJD0bH9UWkKyDO
         ldMSld7CChgtFS8O8mWup8H4U0V1eaZFGvEmTxgYt8JKnVSHyEZTH7CiH9GOtzAULLYo
         f46w==
X-Forwarded-Encrypted: i=1; AHgh+RpePWv71+zL/aDkv/zfeWpobUilFT6Z6MqaMDLlTP1mBk6k7p5zm6O+jN/fBjcfge1d6ULz2si34Lw98Xhko4ti@vger.kernel.org
X-Gm-Message-State: AOJu0YzO+T6llLmAGjQB4G+IF/b6m/tFGRRIxJR1KmNhKebuCCmy2QRd
	tFTV8ikNSGiVX221QO3r8x1/M2KIgHmSE1xAZM9M3+RrxzmKSIrGWUisQ1XfPkCUen5jYdI6UNO
	pZmET00L93S6wSlAWn/599h/gLphg1JP2DZ3JzFPHgBsvKsrjTTYW+61/usiOfGtxBQ/JuB01
X-Gm-Gg: AfdE7ckAsqe5o/HsqtvEKYtzHrHrCkxv+LKLBWY5AqrGgekzbnefSaiOYdzFCSjEUrf
	yZmiC7yaC/HGgX8JrvQgLmWly4gy6XvhX0tDRkEdwN6wF14HuaGKD90Ko578WCXXKlw6UXZcDph
	wvnQrYlKFkB8jJcNIvGD8K7ra/rCfZqHoFDXEV5wPquTPCHnDM1rtEeW8SzeIn67OkUfI9CnfNK
	Bin8Y7pHeDp9Gnh9KLkdGOY/70MaXBM0MxRETyz/NkqFS6FpY5itNxVHmwQ+4eniFuCOUXKLPTK
	rFJhdVGEzVaqo6VHzk/NZGTfTPlkXuQ7tLgy9ZTJjIJ2f31JUgqBTBCEG8GOUMYsLTF4665Gpg1
	l5kSZJQTa5p11XJh6eyNiOjUuZXOkzIOJWww=
X-Received: by 2002:a05:6122:860e:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5bdbe9a7662mr493230e0c.0.1782823420996;
        Tue, 30 Jun 2026 05:43:40 -0700 (PDT)
X-Received: by 2002:a05:6122:860e:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5bdbe9a7662mr493224e0c.0.1782823420597;
        Tue, 30 Jun 2026 05:43:40 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c968400sm1127666a12.25.2026.06.30.05.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:43:39 -0700 (PDT)
Message-ID: <e05fdb45-0ebf-4dee-8d25-05dfc65042fd@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:43:35 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/14] net: ipa: Switch to generic PAS TZ APIs
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
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Alex Elder <elder@riscstar.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-12-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-12-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExOCBTYWx0ZWRfXxlsz3qYnHg9q
 I/sn9pRmwJbC3He7XFGwTWgAt19T72pwnR6fR8uN0qWkW12r5qhBOrcUSRJ+UkQmW2NAi2AA6hB
 Teb+zIyQYHBvZbs9+DJQj+7IWiDcs4w=
X-Proofpoint-ORIG-GUID: Bj25gs1hs3tOI7V_o2EwG8SpztoJUzNn
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a43b9fe cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=smRyAmGWe8i0dDVrb1gA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExOCBTYWx0ZWRfX85g6GnB3CYmd
 +FDnZZgAv1Db/vCqFj5G3mU0uGahfpSGQODHCOdTVQWUkZeh77sr6ZNk3ThlzMTFNTInrql5tf1
 /hxEYL5boJrtxbReioWqrsYkB0a6FwvPkwA9XZ+49pvsT4D+VZJCWztwY4irSdhEyUZxBo2TW+C
 eNtmnYf1MJyPgysXe9aGN3LxZjDn3CEK9SZU7GU60B9YL/Pug8t6Q0mPqsUzSXz+Y+vS/n2N3Qd
 ogD/+TkrowehO1qyHQv6ytIcBX9mXBbo0NyorOzsIrJfffXm0EKwdTl+V7Y6+ZIfPxCwTu6li5L
 MVcjPutJwVi9g4lIk5hhQi6ODSJS6pGgFYIClNbjROPteWdU62fiSgmo9GxdL23/4/P56BP7uTw
 OWbVmCYbmnkH7x6TxvXbGuIyioMg206RynGOr0A/Dn8oshl5gY2ZgL1ghIqrpUp1Yk7RlZHAWNs
 pzvh5R+/lT9OtTT8bHg==
X-Proofpoint-GUID: Bj25gs1hs3tOI7V_o2EwG8SpztoJUzNn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300118

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch ipa client driver over to generic PAS TZ APIs. Generic PAS TZ
> service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/net/ipa/Kconfig    |  2 +-
>  drivers/net/ipa/ipa_main.c | 13 ++++++++-----
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ipa/Kconfig b/drivers/net/ipa/Kconfig
> index 01d219d3760c..a9aff1b7977d 100644
> --- a/drivers/net/ipa/Kconfig
> +++ b/drivers/net/ipa/Kconfig
> @@ -6,7 +6,7 @@ config QCOM_IPA
>  	depends on QCOM_RPROC_COMMON || (QCOM_RPROC_COMMON=n && COMPILE_TEST)
>  	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
>  	select QCOM_MDT_LOADER
> -	select QCOM_SCM
> +	select QCOM_PAS

"meh" for the reasons stated on rproc patches

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

