Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D48751C065
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 11:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065579; cv=none; b=WLsYRFY9CCuy3OODSeqLxMyKwjNyO0+FEyg82hoBfIdK2bgDRsueOfbpLZ/0taBPSJamZvdFmW9RKOe8FcSCv9aUencw0FWT/MBTj+1ew1qW4vd66U7vXRLaMiESNGXYcrgr60jV1qzly00s0/ywEUdK+mkwTT4RuJpTi9SfxX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065579; c=relaxed/simple;
	bh=KsRqpNKyvdGxdAlQ+dQiJscOwjRsmt9DrPpTB9AQPgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XcYVXpdP84LhS3yINiWHLRzJAw2dtf2GVUdqX42kNjFEwgtq6Z1yzClk9etQGfr1cdfzAdZcgpc+Y1+gP9Je2UF2rm1OK32Ckn+z5Ikn6G2wUSsmexaP0S88ohHmThyrWy+wRnjpNR6Z01wV7XQcm+38eyKR6PikbgMf8E/IgJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceTGjTNy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HILrSOm7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceTGjTNy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HILrSOm7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jpZb3408892
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 11:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hz3e3KoQEXOCa1kQuXBEWFHTKLBA2FOGUwTwnrDmVDA=; b=ceTGjTNyUV7B1Alu
	zoT2RM+AO1LOtYqjAyUZtXi6e7Hq0Ft8fXgDB3CiIhxSZk1HySKfH+ZB+svgKsD4
	yCskWG28DM2gumDogbXnJ7lGftiErgEV4QAiyf0BDVuRXB6fm6/i9eb5nqhooNgC
	KLX5bPFRvmUS9cKg+AFQK+p75zavi/Ko3isV/K2hq5RBe6IVRXxOX/RP5xkzdKev
	px46ov4UnFYKcAdS8BA5FsSoliY2awyoj9UMCaJeLETzbFV+OWTwc2woAON0/cI4
	Q6sTyEYD+CcNmdh5CkqGh//QIfauojwR8nD3N5dqZz/9WiME5dgxxQ+OjLgte9Dv
	R2wQrw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn2m81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 11:59:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5356c6d98cbso14501791cf.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 04:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792065575; x=1792670375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz3e3KoQEXOCa1kQuXBEWFHTKLBA2FOGUwTwnrDmVDA=;
        b=HILrSOm7HXvGmDnFpB+cWC5yC1EnO+YiFR3tFtro9vrVPyp0r1A2sQrd6gtT0Rp0O5
         sCs2iAzCSgUtaoPE81CD3ve76J6Wgzs6+9yJNcPXcEbSL/eQs8KbLEOxbaJmCIFvS7Q8
         qfb5wytM3oUKWhdjQ5tF7dUAIdfu9lysEiQw+tsgMCOUbGQA9pZ8htBniJKjOLqYhIbi
         /gcefDbsfne/8MSDxNgXfl514BbTtEjIkuqWUGyHaZGZWujOXit6I127CrKUQdyQe8iQ
         RAkzEqZQNao9rbNdU3k2QOh85fKRzG0g76xnUG/fXbk9Xp4ud36eXYpZ9Wb1MPb4cI8b
         tjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065575; x=1792670375;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hz3e3KoQEXOCa1kQuXBEWFHTKLBA2FOGUwTwnrDmVDA=;
        b=HoQMKMarrysLfRV1aghOP/HSobk9IQ3PS1rfoYGxrNMT4XpAWWKNzdIjkxsHSbMfS1
         vXK8DEL2sw1IGqpAIIUs/11N6TL9YAjp4p8Ha3Jywa4bljs68BWql+iAF47dElR/OCS2
         nzw9gGXwBp0au4vDaNYKUpHEDPwBv3RE3NFpvMJCXn5/Sxgq7sB5IR03JDG+s58cuX0Q
         FAGy4Cs5rf7QPnm619yIAIYZsnRv70mx7D0JS16BZSG22UbWTgXMKOelf21LtpYYDGGN
         LNUq+RCtPQrLVZIcnjxR7c+SlAIfpxhgFo0qxaXroQYfrt01ZH6q4vzcMtJZtLqxMafq
         iZdw==
X-Forwarded-Encrypted: i=1; AKwUvBytb7y1TGV9lRnCK0xgflkCYIFbOoe/9xHu9VN1qRkVnahByJSx13D1UReSfJ7RFfR6HbzkbVJbXpxy80yDT4p3@vger.kernel.org
X-Gm-Message-State: AFq9FYJEJy+8P2DVNazlWt3a7u6CQeV2PJct731LNJn5QfrZf53vCVZO
	uZ5zC8FIqvW3bTAL58ZMarUnTZmLwtheUA22VPZkD3xJ/jVwlMR7wwgctMPOBJmysemW1FRAPb0
	he4wv6KHFUezRAHZAfonlRODlas89f9f5YyefTNFrqCE1KL7D23qONoWLcuaegzBU08tk4ZOP
X-Gm-Gg: AYBFou0nYSmncuxmIPW0BmxOpGO3ASnXDufMat5cMiN9gHRNuZBrSfiCGwWTpYBQWBF
	D4lv9RideDoZQwNo/rGfzF/1JvtAdWeGgcsdKJmSeMdfObeJ8Xv873M30Q4OWl8jMnWKGE1OQ3A
	ch+fkbiVmHJ+VkWOzD1NoRTpxqK0qMeSAIebby+BakX3Kv76slN21/Ecgc4ylgF9m7Bok/U9lOM
	5jceWMPo/aFM8+o6wFDml+z0YoeI3wmdn/8/PTfi8KS0YT/HXNpVxPQQWynlu4s6zaf8vEb90iY
	+yqDht5CA0TQtT4eluu1NSh+5DTrHMAzHYXw12BOjRXeLGYqdEIfBOHappmVZQc5ObljWv11978
	GjTJ/ZAnAx1IQoT4T3LlXGA==
X-Received: by 2002:ac8:59c6:0:b0:51c:2324:666 with SMTP id d75a77b69052e-5359fa50f67mr358234251cf.3.1792065575205;
        Thu, 15 Oct 2026 04:59:35 -0700 (PDT)
X-Received: by 2002:ac8:59c6:0:b0:51c:2324:666 with SMTP id d75a77b69052e-5359fa50f67mr358233841cf.3.1792065574606;
        Thu, 15 Oct 2026 04:59:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda3352a7sm117007266b.59.2026.10.15.04.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 04:59:33 -0700 (PDT)
Message-ID: <bb2f2366-2525-468a-961c-41fb81bf2d15@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:59:31 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: qcom_smd: release channel OF node on device
 destruction
To: Avi Weiss <thnkslprpt@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261013055642.793161-1-thnkslprpt@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013055642.793161-1-thnkslprpt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfXyLU6jiV0/LWs
 dKI2cPPpT5fUVX+nmQqmkYjmEgCLCgx8JbkdFU0N5zYsyUUzMK0jCNFkY76DSjjpOB/qOiokvjh
 L0LkAheW36wXl3NUB3r/SHOyzzg3q4wSiBQwU1ztVfz36JUE+1XzZrVYZZIXP2+xcHu21upWneM
 zEWtit8QR9nM6AfY/RUaqcz0+C4+RwZhHwz4MqVtgm9fN/w/GTxrxQctkrkb+WXnYU8JuOYLE5w
 J1MaJ2CA/ZFOQUCC1Os1NKtUih7p1AEg9G/4oisilqykC9/9R+jSfgcFtHpu5lkw/bZca0FNEax
 uAv3j7mmHj8VntGADrLtrasP83OmEPgKjH8KPV2a7qp3DLVeXroPS6iMqt/SBp0Gns2I8cIsL3O
 aCtk24gy0HKHhIs4LBIat5d7O5Ymv+UZN9bRemimrp7Nf4po8G5smLaLSI492DK4fLh3amy3M6+
 7/HaKSIYN6sMkjC5HpQ==
X-Proofpoint-GUID: 17SwANDOdyO02zPElWLWFH_XGmTDZgsD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfXwsBeoTa33N7j
 Ms2z6Kdg0pmBjYS983mQOAVIxqnqYxDH7vPn/K8TEbJk3wCTQFeJK5ODd8C0uW5bKVAlRXBzCC4
 76SOQFDN+Vrjv3yyvLqeJTHYZNFRbbQ=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0c028 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xj2EYvY_aspI9gx2kb4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 17SwANDOdyO02zPElWLWFH_XGmTDZgsD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150047

On 10/13/26 7:56 AM, Avi Weiss wrote:
> qcom_smd_match_channel() returns a referenced OF child node,
> which is stored in rpdev->dev.of_node. qcom_smd_release_device()
> frees the device without dropping that reference, leaking it
> when the channel device is released.
> 
> Release the OF node reference in the device release callback.
> 
> Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
