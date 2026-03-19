Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1A836CE16
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 09:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911081; cv=none; b=iqHA7JQHsdiLNufT/JWlzk5alGCDHfm8ozV3bpSuyL2xO+KItjx1sdUD6faSrG9NzFRKE827vEp5GjqJNYmJkhrAaENWkL3XUWprJz41EOfwcoO62D/AHFPK+l2gDeYThhX3rUcGDiOrHshn9P4NsPa48VXLiSmJq9oiXEhpb/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911081; c=relaxed/simple;
	bh=enhm0fgZ7cvpHwKA5IX3tPV2s21d1oH0qHqzq3DhcrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O2XUQCM81J85NIPzvh/QFFPvttf38eEv+qGWp21VHR0NT9zW2KPYLz28muIgyuFiKDYILW7rtpLcM4HA5rJHcC7EaY+QQoBfyRPzpRPluIB4Kc2MjjXbt2+CyMejqlSkZywaHVZ4luNU/IHwzDEN4kCBhR00MLuqpKXVgoD4aIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKtPPF3T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/zpGhzv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKtPPF3T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/zpGhzv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73wKY3368480
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 09:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EH8bY7QD2EKZljMmJ8B7Le3WdFz6YOjIGZw8lo4HuVg=; b=ZKtPPF3TzQXeJCxI
	vQqPEYIW+n4THnio++yCy0Zpdu+66LcC7xdB/QnqocbGxLW7k1ce5fLn+zlp9lQ9
	XIhHU7h0OaJxOZdVDzIcCu9Klei6V0g98WlT+kjPUMYfRdBiEYuWVQCN8ld9hxFf
	Vy1pDB90rA3E+B5NKbYhKlwZ8cQaFZLVw2IsMt5wyZZ36Ny3+jKkz87EUA0B19/Y
	8X6NCs0/cQQyjFud5HJpuEljDBiXbzhQuNNs02jHMtl/P52Z2lxVfvHYk7WfYxcB
	BHotcCZc82HL7QVJai6mwxvmpXknZzIe52riBBcmYd/5VxGUTg6QfP3809c3j/5W
	+0tLSg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00f9jgxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 09:04:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509181cc6ebso8984481cf.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 02:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773911078; x=1774515878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EH8bY7QD2EKZljMmJ8B7Le3WdFz6YOjIGZw8lo4HuVg=;
        b=S/zpGhzv6yNqFc8PhsqBOjXto2RkCYC0h1wUHLUf4Fg4xaSa7RbMoLAbqci6N+pxlp
         So7Jxknw6mBByQ5J5X45/iaMGltUc6TjIE/xURsq1oCWf0KtafrI30wIsUAbgNv9XdRJ
         kB4hH7S9qe9VGmrNB8X+qFy49IMRcsv72SDBQSGOMo9B0DMnb02kyd0zZhMF3ahSJi6l
         VBS6/L7nM9WoBRlwe5Ld8PgsQomg7Cu4j0Osjh3yQaJO0a5VtFZgtRqQNlQP4cEhlrF2
         /8fGwxva8iR/XmLLghrP0kFeUvJZo6cHKw0206oQlMEVO4Iex8JLCLgJDY4lSzx8Hox+
         /kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911078; x=1774515878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EH8bY7QD2EKZljMmJ8B7Le3WdFz6YOjIGZw8lo4HuVg=;
        b=TbnC/1N5R2oojbUnQ8qHuxIK9s7cLvHuqC8yHCrDwZ7f/TmZNPwGsIXlTGKkYiqTVA
         R+Yh6Qh2gzf++wHfj7dVH6PFw4IxMX4x6swDoStgO4yhXPBDo9KRQj4UJ4cq8h1Hg4fg
         vYOynd25zSXJwKbETz4AgkAj11DOhq4l8l6+4VDZxo8+5bRJusSMlxa+meJl+hmAT5aQ
         m7zWhZZjBYKdUXVxxE51vpPmaES2Zjeo/pMwCIlAuG99k49Av3tyxSDmwK+EEWyCjsHr
         zk9P+u15oTOnOOHi515ZQ8GIEwq7PVg7RPqGprTOWrwaSw8EHjR7T4qTPCyREW/xrbfi
         xoUA==
X-Forwarded-Encrypted: i=1; AJvYcCUMSAYV8ldnOHOaZXM1AAItqssaq1Ufl6yzBsKbDWgdK2smloPNnPOtaFpzCAkPTnmdY6r5h46+0GNRbqNk/F6T@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6IS+Aeaa7EKHJAdeYNLzIQqhBneaKsNZtT3VZ9Nrr0O37tXGm
	ZRJF0udr549ssNBDGDdAeaQMuGyzIq+ITDYm8XGYCKhl2n758R0k5VaOaN9v6OOyfBIwNN8x77P
	RGoGZZxSaGiKKMyLJyCylIWSjk+4vByvCoqEjyajJz2etDqiYnzgnjT0x/tZOB1y0ru1/QDFO
X-Gm-Gg: ATEYQzyNGDzySDj4Jo8+Rf1itdytHFjjSBdNBMq+pHDFIncfiRBKouM7VpfnBXWQVyw
	pIs4krmphzKtemZrRU0DuaBtkqf/HWLqL+K1HhznlngkgWfBxa8VA48pEo74VwcR/97jPCoknmt
	pfT7zFvNnWCwk8fW+aiYpmRI461k8Ix0227OXW9fOKv9wimqyf7y01be4kXLIzosEvMUhsWQzkz
	Oeph7e/zENxWC7ShQWOFogkVPeEwNJw4AC9iTFop4a1Zci9aKO0259ssfT7A7I2BcAZgU/AW0Ki
	mR85iGOwSwG0GO9uwyUaP9IYpPz1jT629J6KUFnyqy0BS8LKUEyIlIn4fNytlutTMLprNZTsB35
	inM/75cXTRzdbzBGTXVr3Po3hMk7cmtWOuU5a1Jk2w4R4H9KbqRjSiHwOKeJZE56ssbt7FpFqRS
	hJGBT/0/mh
X-Received: by 2002:a05:622a:30c:b0:509:2ef7:703d with SMTP id d75a77b69052e-50b148b8cefmr85605451cf.63.1773911077902;
        Thu, 19 Mar 2026 02:04:37 -0700 (PDT)
X-Received: by 2002:a05:622a:30c:b0:509:2ef7:703d with SMTP id d75a77b69052e-50b148b8cefmr85605091cf.63.1773911077402;
        Thu, 19 Mar 2026 02:04:37 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba847fsm49542665e9.25.2026.03.19.02.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:04:36 -0700 (PDT)
Message-ID: <74a9bd51-8c35-4996-88ce-8c1995b506e2@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 10:04:35 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ALSA: usb-audio: qcom: Use the unified QMI service
 ID instead of defining it locally
To: andersson@kernel.org, konradybcio@kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316171419.2619620-5-daniel.lezcano@oss.qualcomm.com>
 <875x6ug6yf.wl-tiwai@suse.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <875x6ug6yf.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MSBTYWx0ZWRfX3vG7iApRbi2C
 +Vilty+5126iWoFw/ObSXxRQfAfjRhANZV9BnToMLM0CKauSxrqEzvV1SbzB+g0M/BdBNht0fUQ
 qzwMOBqvo+c7HTgvUZgqNqjdmDgcVWjZ83PRxXqT2LXgsfjZmm8KsRkTJJZ4DT6JAhM2OotINfm
 DyXkxniVlK7BegKgn3H7GpupD1ivFgxPP+BghoZadyQGrFtY/kR+4n5kHLnAZNdBsGyZfR59Raf
 uTVx3OjM3EfnR6czkbTt1Uy6dbghWNu2PvwgCDJRWUBN0Y8HrSbusIRp8qhqwu7om9YThY8lDsj
 nri1qalBbpvy1PYJQMHKL7MF9dmDeDkrnIqi+LC9jm4UmYJvpIl7oplRkew8df0WTXmYw2Y0hgI
 jROYpEZEgu0gVFzlrFEPCqsgt+f49nMDj+rvxGGIDqGNtU5MnmaQMuGdA1McMORDWn6QF3+/eux
 6y/Iyf6Cqay5x8h/Z6A==
X-Proofpoint-GUID: BE-RgM9HaBR2p5o8ESnGBpck8VCObYSP
X-Proofpoint-ORIG-GUID: BE-RgM9HaBR2p5o8ESnGBpck8VCObYSP
X-Authority-Analysis: v=2.4 cv=MJttWcZl c=1 sm=1 tr=0 ts=69bbbc26 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=9ubS0I03ALhbG_YfUWEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190071


Hi Bjorn,

On 3/17/26 10:07, Takashi Iwai wrote:
> On Mon, 16 Mar 2026 18:14:14 +0100,
> Daniel Lezcano wrote:
>>
>> Instead of defining a local macro with a custom name for the QMI
>> service identifier, use the one provided in qmi.h and remove the
>> locally defined macro.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> For the sound bits,
> 
> Reviewed-by: Takashi Iwai <tiwai@suse.de>

This one can be picked up for qcom/for-next

Thanks

   -- Daniel
