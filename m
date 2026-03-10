Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B21199D8
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101353; cv=none; b=hUoCKJn2OBC2Lmm84ZIaak9a3yDIp9O4sAdSLyaif/heBXtlpRe9V+ri35z+CWajL+Ib0R1VkkOPlVVWlY0D9+mfr3Nh7PjIGAIjCk6K9Dl3PjMkkKKMQq/sWoS+PwDQRgavrRr30bzejMFO046wPYXsAl0F9by4+lmtSBI+FtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101353; c=relaxed/simple;
	bh=QvXfmbJud8HzeP33fX/kWH1MUfsrhkVzJGAW2ruT4+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVsLpVuLiEN91aenANxjt7IDMgqnEVunIbgYxrZrG3tLRTwSDwPU/ANSynZbxDsuTH/O4tCfsgg2QHuE1fukvS65s1yRK65zW4vJUx+cqjiFO8+kMwvt4AEwfYZy+i2nVg9t0Jr3kRk56CKwNAExT1CcDhXXTxQ+a1yNgxkRMW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUPs77F4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U7zkj9lU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUPs77F4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U7zkj9lU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCDeA2428709
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UzZKnoilqHx4458WKUDAbi2+T8n0C2ogsIPespO3GAw=; b=dUPs77F4pGXERTFD
	81tbz3Mys0cMxTotueTQZHr2XFKWf/Qrv0mB+kbTYqLTg6OKniVnRA7wK2D9ZVdF
	f8J3Pjfj00iYMNPne5rhQ2Ij6e0qFSEruhvUob6MWoygiBwySVHZtzb0fPGhuy+c
	r6GHvu4r2mnszOM4EqEscrBodR7PJJmf7xLXrK7WpKaOQQlEdNrjNZlHrl5mNeZb
	GLKoyRCaJLbuZT+o0k8PpI7lH83lHxqI/XwP1E4oQvNK3n7XgyibmT8jsmm2Bo5H
	FRsh7ENIQv/2QU06wGk/QKHEgYJiesvRZKtqycMfTdMbl21bIm7MhBuE6f4dWR4l
	0GkcIg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1eksdsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:09:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7a25c5a9so1230942685a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 17:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101350; x=1773706150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UzZKnoilqHx4458WKUDAbi2+T8n0C2ogsIPespO3GAw=;
        b=U7zkj9lU8XjQER+Hrn5O1DB2+uuc2eSJuIwZZsliPk3febgqNoNaULUmCfjgYrcqS3
         dV24LrnpirIfcPyIZdDrVRVrEcS9VTd3bAQtxdsYbJeSotZJ+ozz1pZm5HoqMsnzyj2C
         7ZDWvDYzXR6jVqCUNGgVcMLLQAFqlZNDInwfMyaXkK4dFdDJ/uZT+HE3EIg0Yas0MUBy
         LL0I/grzt8Jk4Juzilu4HSBIK3SCzBugJ0L2M57rXEKDsGotweuKuZCUIJAdySF1APD4
         0m95WgBIe7LCeGR73RrsviEiQ/tDR2s1/yKIuX5ZrTZ0eh9iQLltqfs+0M7ho6HAQxiz
         2cgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101350; x=1773706150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzZKnoilqHx4458WKUDAbi2+T8n0C2ogsIPespO3GAw=;
        b=mJ2yqw83VjrHBciEGj4ai2uAc8/wYCtApwB6lYUMF0SDpvJXdxB6mhmTSzTdA02Agq
         9kSH976+cP0riOpwLBNqB12AsBcJtdu50bNALy2kpPtTyOM7OHahfOKX0iX8D3m7zu3w
         yzd9Yre2uelH7xbtAnj1meNrBnYLVC8yoMQbhYSjgWbh/ydY0Jx8Ee0jKW/3HdZeGWwb
         NQeZMKOdmJYTCBWFzKh17hz9bzK3DHzbB5bodL8TdTxyl1j8DBDq++t8IoSar7J8oikV
         PwaWH2cqqQMLgQ/1JyVjEKFDePgaktbXIeLVofpyblS2d9ZDRHm80nCvItTESbBi1uFg
         Msqw==
X-Forwarded-Encrypted: i=1; AJvYcCVyu+YKb3Sm7XZ3FBo/R/E6Rsx4kpeMkav9NnvxPoOu1tvxgX8BTKsxgmOwAwMjZAehkuin7RZqiLeVtY6q9dpB@vger.kernel.org
X-Gm-Message-State: AOJu0YyvuSuwxVMSK2spZU84lAqfhWsFtxWLyMYQUZKYfZKivoeXliWn
	PB1S8ePaBxcbJOQNno6WZMqaTbeoVrnYLjcqBQxPFbHV7KePQxRGKq4PujXUxV7l3bQZi33hbdr
	HJvblMoMEwpkUEXSk75BehWo/WlQIJwbFCJxcLqNLpkxEA+R+VEjcKs3Sq8MH/BLLeZJtWKC5
X-Gm-Gg: ATEYQzza6F15XxuSzOTNoDZurfjUZQ3fLOcgtkr2PPYeMv0sjpFBEcHSy3vyvhMekZZ
	mFjxECd0veoJXlU5CASCEzEac2kukuilxJ3Vh1Oa9fkuS+dJPedYt9vRLSfey1r+miSZDH4ATRQ
	xuY5GfNUqH6QX/r4rQ7sSjtcTbakWHL70IeZ+zbA0FwCWtRwsdIXin8HqEfIUYwSskptndx/qFR
	NhMKKwSvK7ZQDq5wS94G6js991sNUGkLeP6MhLRrC3MApoBJh6LnXNq3O1OIMQeDXxdKqej7Kwn
	gwnzeou4L9LHThtrPZVFDU48eAAx97/9ZgMWOPJfp4zZyJFNME7pRQoP6+tACd6FgERk4rgEzpL
	F52Ut+woo4lWXJZ52P8zZ+527qGhluPMzWsKIA/CE4/w/1n6HqatOVgbEV4jtlvH5ch9ey8q6Kn
	rRYdPhz7B2
X-Received: by 2002:a05:620a:1485:b0:8cd:75df:f2fb with SMTP id af79cd13be357-8cd75dff685mr1012755885a.65.1773101350446;
        Mon, 09 Mar 2026 17:09:10 -0700 (PDT)
X-Received: by 2002:a05:620a:1485:b0:8cd:75df:f2fb with SMTP id af79cd13be357-8cd75dff685mr1012752685a.65.1773101349998;
        Mon, 09 Mar 2026 17:09:09 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d973sm28840297f8f.3.2026.03.09.17.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 17:09:09 -0700 (PDT)
Message-ID: <3283cbae-4100-484c-9b00-1d7111c62456@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 01:09:08 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/8] Group QMI service IDs into the QMI header
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
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
        linux-sound@vger.kernel.org
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <9cc7638f-1232-4cb7-b4d7-cdac66a2f4ba@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <9cc7638f-1232-4cb7-b4d7-cdac66a2f4ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eFmb0tUZO5s1JJM35m-H3WjI_ZrFYWMS
X-Proofpoint-ORIG-GUID: eFmb0tUZO5s1JJM35m-H3WjI_ZrFYWMS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX6+hvOjnmZg1k
 Rsnl6QRj/lF6OKUSoZC/5kNqAXcIVtWrCusXuBNhcayQuG8ogwtiGecTOjNtGfUvZOSSnQA9H4g
 aVKpSe1JdrPfeTsTNDRofU7jqj4riM2eDd/+DzoJ24tItvtCAvEjO9SNqxx22L42iljG41zKbjf
 3Mj+V+/YFfEo/ycFCr1GKSFyuCQPra9v0K8MnJ1AFSKkzKfGzk5Ayuad2sSPtjNG313Zu0OaaFQ
 5cTLw5dCaXuSjy+wmcE7Ljo6520pbLdxwJOjK3kHsYEq7Qp/XER1YnJr5IFYIeCVPvRpUWm7RYA
 TvPl0GEp3GtrcwYmla5fjO/VlirZ3FIRvlJdjcueaW8/n5DSoDVoj4rTCyPPoCF4kX+IKIUwZ8v
 gL3RdDRVyZjuNaKqVMHUJs5Wzqv20z/Z01CPQkiXTTDgm2oizNW9l06v1GMIvIzcOUVeZZmR7VX
 CV0TMlopcM79OX+9Jvg==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69af6127 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=H3M1aXInkkIOK4AFoC4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211

On 3/10/26 00:50, Jeff Johnson wrote:
> On 3/9/2026 4:03 PM, Daniel Lezcano wrote:
>> The different subsystems implementing the QMI service protocol are
>> using their own definition of the service id. It is not a problem but
>> it results on having those duplicated with different names but the
>> same value and without consistency in their name.
>>
>> It makes more sense to unify their names and move the definitions in

[ ... ]

> prefix for wireless drivers is simply wifi: <driver>:
> so s/net: drivers: wireless:/wifi:/

Noted, thanks

>>    remoteproc: qcom: Use the unified QMI service ID instead of defining
>>      it locally
>>    slimbus: qcom-ngd-ctrl: Use the unified QMI service ID instead of
>>      defining it locally
>>    soc: qcom: pdr: Use the unified QMI service ID instead of defining it
>>      locally
>>    ALSA: usb-audio: qcom: Use the unified QMI service ID instead of
>>      defining it locally
>>    samples: qmi: Use the unified QMI service ID instead of defining it
>>      locally
>>
>>   drivers/net/ipa/ipa_qmi.c                      |  6 ++----
>>   drivers/net/wireless/ath/ath10k/qmi.c          |  2 +-
>>   drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h |  1 -
>>   drivers/net/wireless/ath/ath11k/qmi.c          |  2 +-
>>   drivers/net/wireless/ath/ath11k/qmi.h          |  1 -
>>   drivers/net/wireless/ath/ath12k/qmi.c          |  2 +-
>>   drivers/net/wireless/ath/ath12k/qmi.h          |  1 -
>>   drivers/remoteproc/qcom_sysmon.c               |  2 +-
>>   drivers/slimbus/qcom-ngd-ctrl.c                |  5 ++---
>>   drivers/soc/qcom/pdr_interface.c               |  4 ++--
>>   drivers/soc/qcom/pdr_internal.h                |  3 ---
>>   drivers/soc/qcom/qcom_pd_mapper.c              |  2 +-
>>   include/linux/soc/qcom/qmi.h                   | 12 ++++++++++++
>>   samples/qmi/qmi_sample_client.c                |  2 +-
>>   sound/usb/qcom/qc_audio_offload.c              |  2 +-
>>   sound/usb/qcom/usb_audio_qmi_v01.h             |  1 -
> 
> You are touching a lot of subsystems with a single series.
> How do you plan on having these land?
> Do you have a maintainer who will take all of these through their tree?

Yes I thought Bjorn or Konrad would take them with the acked-by from the 
different subsystems
