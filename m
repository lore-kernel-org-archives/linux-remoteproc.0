Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B49A36C0B0
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 09:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910948; cv=none; b=gGt0/HkqY7sCjbSqWNwRySMZkK6H4MMBIiAxFLftxxEY2fOqfAvNPo9EV9QM9B871OpCeLx32dfROtIz+APl+kypCB07/pszFjUwLK6slA0S+2cB3Oxt0Mq7NaKflFkBIDEHzP8XxKpjPYXn8bwOvNaDzh+SuBtT5LgmUceGG8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910948; c=relaxed/simple;
	bh=rFYQ77mBbRdOk2Q3EJ203LJMJt4lPsFrx6TYibicFuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=db0O7hOYfBbjVH34NAbAY2GeQbJR/vEFKMxZoSs3bzlKmlzFstHjxTlytMPJ7BsHkf+gECMrFkOr0JN9PSWSC+WsyJdWD01HTgztj3TECFuTVgfDeH8JkM9IMKXgF7H8yX6wOE8y524efqZWbPKsflwKOTwHTqyCFd2xbPwD+0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SOnVAmL3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Usrvmur0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SOnVAmL3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Usrvmur0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J746us1898948
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 09:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2PPsdradxDFBmU6By8IXsjXvjxWS/JBBTM4uA6mDm84=; b=SOnVAmL3naEmqvxp
	wCam5A5ffUzxVU1QmNFR4kL3wVfl9kBJLap874hNnZL/A10nu8uG3NpMfPSZKbM2
	tOZefy7xFI7IbFBTZC3+UHFn2G+KuWnvWrGjNSSDg3WTW80omdEH/MQd8BVK1BtD
	WD3+ZiQR7pprQ8lVhbIgczFYijPq3rCfgPvdLMQXhuJwso9ZiGB5a6cgLIBossql
	PmQwNA2RP7CCoZ5Wnc2RXGqkpJHV3PRx4KY7bA2jduYZJnGtIsttRlXveyHJC1Qe
	VRqtCjpEZ1tbDfn/Q/uGHLwfF0hDJSTj25jpJpD3s8rZ4EZdpIkRa8Y9XE4RYli2
	8i55zw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyyhgasrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 09:02:26 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94d6c5433a0so8807756241.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773910945; x=1774515745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2PPsdradxDFBmU6By8IXsjXvjxWS/JBBTM4uA6mDm84=;
        b=Usrvmur0ciM525rP5WBv/EbbkC28XEw/GrwJhejDUcrirKaj5EZymTeVwc3vA6DvJD
         /xQUZIqR+6DVrT0/K9a8JRVY9JbLG61L0awN/FA4lQ5+E0B1qoHNoJW4cio7w7HiZt6A
         V+8WOdaR4FmVIyezOj4VCr9hc+86Vlpz0YGjM4V1PWYWMXo4KCoNjhL5pp+ArliDAf7k
         zM83vrb3CO9bqHQ9ov3eu+8gimOieHZkbZNcGg4k5QoIWrk9rp9l2ijPO82e5PIEbZ8p
         /BORM4d7LL75+R5U+8m/BlJ543Xu1IOkQprykiO7KffWGo0fK6uF4SS7Hr3MKb0ITGEY
         jvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910945; x=1774515745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2PPsdradxDFBmU6By8IXsjXvjxWS/JBBTM4uA6mDm84=;
        b=iNtGLoor5hsQO2L/p2VjIXvjQPR0MLyWMx9OtcyVXzpzu4xnPwrO3+lESUBMjRA88x
         5XbGkL1rHK+BEfn5j3Rn7R98juftb++HGH5FMvcEQN5WMjwt7f+1ga1FXVzMmsjVIwok
         0FGCQAw5gklRVWJGb1VkT7ntUzHbcaC8W+7tIy3nE61khYzYVSCKAoT38pjgKtXrROTw
         QYZcew6j+FViamnPng6INWRz1bSZHBM4dkcKK6H+T1j30WVC4HAc8Gmvy2db8fcnfLGZ
         M5T61qFZ2oigir7kDJdS7CdjMgjCSWfikY5oBJ9pag8fy5DDH90t6IJZyZi1ThdCwIog
         Lp+A==
X-Forwarded-Encrypted: i=1; AJvYcCWKJQbt2D9xYhPWPlRXvEctKQHFvP0af80Exthmz+mFOieXdK2KiyF+3ipDj+Hm1fDpll6uzaMHfY5Lcqp51Sww@vger.kernel.org
X-Gm-Message-State: AOJu0YzxJvomG7pK91EH4xRRsulzQQL8Ek3MYZboUTzpQ/Xwe/Svlgg+
	jw+QoIjn9BLV5WqZZkVA/XFUY0kD8sRO9PUYgImonNz8dOlOriunr1geun6FPS1jmALC95OZ875
	/sPFSIPaBr/80ooAfgf6IxjNHZJ/g15+G6CPGbFTizhKTHDQ8gIs93scQHpT2eaUSkRKTZftE
X-Gm-Gg: ATEYQzxEwkJLWk04oj8o1VSWf0zYO9tCuzdXhz9JJr2czeE3W8i89CXj75Mim9wVOwK
	RhRV8IhIypeh8gDpMV11vrMyoXTMHJho15Khtpko4lvJjzUKe61Ex9PmG5VGXpUTwhB+kbHdZHZ
	WwMdu/ZtXD5nWc8iL3jv0WrnbAHIcjQF1fNpDwFN/mxtOy1JCwoIRwIRH77FMR5yFNHjy2JvGNT
	f+iQrX2mBrhNzmdwFtA5nuIdpDNrvVZWy/cGzYwIKLb1GzFurLgjMTNZjUc4vzlSfzjjPhR9U6a
	02XDMt4ivf6ypO5nsSozrJMzDK/+RhjPUlO6Jo5SgLyeV63JctHz8Vv1pZQQro1JmFhEaRU77C6
	SJQ1ohlxW78/dY3IP1aBTbR5cTO8NPRHzRiKtLiKeuN5aGCxpwXPVsBEaZ1ZB5zQnGuX8F1Trcy
	Ahk1CC5PwQ
X-Received: by 2002:a05:6102:8558:20b0:602:91f2:6afe with SMTP id ada2fe7eead31-60291f28930mr1266996137.24.1773910945438;
        Thu, 19 Mar 2026 02:02:25 -0700 (PDT)
X-Received: by 2002:a05:6102:8558:20b0:602:91f2:6afe with SMTP id ada2fe7eead31-60291f28930mr1266966137.24.1773910944965;
        Thu, 19 Mar 2026 02:02:24 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b322d9sm48733435e9.8.2026.03.19.02.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:02:24 -0700 (PDT)
Message-ID: <c26aad81-ac48-4ba1-987b-ab6c271fc095@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 10:02:22 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v1 4/8] remoteproc: qcom: Use the unified QMI
 service ID instead of defining it locally
To: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org
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
 <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
 <177362699063.8490.5627616886098038132.b4-ty@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <177362699063.8490.5627616886098038132.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MSBTYWx0ZWRfX2KYP+zb+n3qZ
 9ictGDR+CB4DkLJjEQgAPHhVovSMDjm1V+KXMShSpzBBOXlgGeGBwU12lxH3o2yi609f75Zx1Dg
 Xc0C4tW7wOAMKoWJTDmnXN1I5VJ6nKifITiYVzg6Zx4PjTAERDVFb7E0Ma0aFIHjenIq/Y7wsmH
 ch4oBrDqmEi7O2+mfwm4FxfDC9ZWD9EtRQ6frv47YT4Drb+IkaJmW+Bw927H8Vu9FXYgsrnckQZ
 y2GSZljWth6GZVr594oExkgn23kQYgmN/FBQ6c08i+sBTa2PbeqlYMEH6/rUNxWKR8zso3AMDtQ
 kKDbUZoEfDlKLomcPzrZp439B2Z+uuxXUDDqJ1q6QIQ7TH2CFwgXM3LBg6zaliHo731jT1KsPaT
 xDJDM5dVSDPW+eFAbCm/Sg72h5B1iCrthI4zRuykuQ9sb1QgJQlfcaIU3E1ULHTFPai1gTKZuYe
 fio47k/Z6El10i50Z+A==
X-Proofpoint-ORIG-GUID: 4ZlaQajJ5SvW7I09X9CBz4MJHjxm2kAM
X-Authority-Analysis: v=2.4 cv=IbSKmGqa c=1 sm=1 tr=0 ts=69bbbba2 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=BdGfMZ6iCwODMfnLSHAA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: 4ZlaQajJ5SvW7I09X9CBz4MJHjxm2kAM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190071


Hi,

On 3/16/26 03:09, Bjorn Andersson wrote:
> 
> On Tue, 10 Mar 2026 00:03:33 +0100, Daniel Lezcano wrote:
>> Instead of defining a local macro with a custom name for the QMI
>> service identifier, use the one provided in qmi.h and remove the
>> locally defined macro.
>>
>>
> 
> Applied, thanks!
> 
> [4/8] remoteproc: qcom: Use the unified QMI service ID instead of defining it locally
>        commit: 95b6c029e56e4d75e2957ce7ac795da29415865b

Just a head up I'm not seeing it in qcom/for-next
