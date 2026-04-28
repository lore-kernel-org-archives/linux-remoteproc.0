Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C6732694E
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Apr 2026 16:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394399; cv=none; b=H/ijWHwp/93YVtLFjxafsb6Ajs69z6VXeIFqS1Qy2oRRVYoFgCZ5gTkKYSYYFrUGrrEYKb7y//QsfGAyYGahaGWwhXjAyzA81dejEegOPLQ4+cJRkNU59y2lQx/HwzGs1PLYwQCQvhRYyvHN9rKBisof5vOsa8VRngDnRE3ek24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394399; c=relaxed/simple;
	bh=qZzhuuormOf8Rul9WUs1IcMncFOwAXE+8P8hcP9siEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5X8Te9tlpHV7oMysRTS88Nbcq/805a5CxUPoL1XZNlxe7qCvOe75I4RQzNVYrURxjh/W0S2yjaVU6Gk3CzmlL2iccFupkcFR0i29/r0VE494TfUgflPSQRNMTjF8bHFBs5slqLKBCl4E4HCXe7g9fnnIbx6EVzppRbziFGN+5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7SzQjo2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYkd7M3l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7SzQjo2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYkd7M3l"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsTXF1796697
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Apr 2026 16:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vS7MZwC/c/EdYfGyVktKa95cOMof7DSqpzppE9rq4aQ=; b=f7SzQjo2A6gvPSWl
	4RSvhk1zwSXT5U1plZ2fJ5UTix3BYVLRUWvlmwud43vB0Z+JYf/OqNXL/5AbOrrG
	8mTZis37OGV2svwSeXhojxzhKhDvnGF3b0NiEXfvTbiVqOxmmpWe0YZeJUfcimO2
	n40R+UEiqXUZsBVkMiItGY+y6VBrQ/XMMw9sIwJ7f8R4Fx0xZhUcwQ9k0dURvFK0
	GOw8air9IRe8GaiBlW3fY3MeOVtlGFz5MVK/HPDRUIrGLlxSkYc/7l2YnYrMRUU2
	KF5YlhvY6ijYL26viLxaEbmRPQepuH9rTNJD1l7hW2aLWwIXa0ExsIIEXCCL58Lr
	gpo/pw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttt2sncq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Apr 2026 16:39:57 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2e60238adb1so29393062eec.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Apr 2026 09:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777394396; x=1777999196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vS7MZwC/c/EdYfGyVktKa95cOMof7DSqpzppE9rq4aQ=;
        b=PYkd7M3l2rol7qbMxfQktGLF9kkFmuNQpkXpinnffGbsC1qXZNJk7uSRfnxgQKPVfC
         rHq6CLx/9kkDCpOBNHoyu1q11eHWl9A2kVRampazY3cVLo1zowGy7HHGHAd4N4sbmJKX
         yquzHKnc/lYscara73DVETctt+Qq0J029iAplhnZ9jfIfE3GB8u3/4X1EmtvnrAPJQ4Y
         qPj7RjEph9ryUgsSAw+Ymu/t+fOPOMpFo1LewPm2fujRmtUfINf5bN34coUk/A5ubaFS
         TrjRy9vG4oxbYYtTa5uM42ArxgdWfC61tjcZQHDrz0b1W+wdwrOGWS2KPp29wFHwUP8M
         lVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777394396; x=1777999196;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vS7MZwC/c/EdYfGyVktKa95cOMof7DSqpzppE9rq4aQ=;
        b=LvFxxWsuxwnsFykS2BmWxRp8HalRS1oriCxIcBicAk98/fi/5YxT6dpvYKuQWd0xjA
         hr+mqaky8rCgXnrhy/ZOSQolRg2vvYWDA3jkZd5PO/PIV0IS/l5FTpwUdk8lvLH1HTv9
         RFv76L8hSiRH7i4uWmK7luYSw+jERihH4wesj5QWcUtcnwWoHD5Gaxii7AJrxq9V10h7
         KtvkNfOQukjzD3vQdvM6dUY17aSFjq6+oLiQvXhIRUIUqGpaSDXb8llddglwahxp8tza
         VcAhu6F0Rl8TMgFv6otdTxkhdlQF5609BE8enti7+DNZlz5EVJVSfKMwmgNGipbOQQgo
         jWrg==
X-Forwarded-Encrypted: i=1; AFNElJ99hB00ZPVJ5cYbxsmkANZ3oOnCjrhR9TZYbDug5mDS/crMn90gfK6XP1kddwLn7+7JjST4oHCc4kueFHuy094y@vger.kernel.org
X-Gm-Message-State: AOJu0YyseFs6QbnsdlQjZ9h/dG7vqpPEGebwLLmOyUDv0QWGbV6CwpXQ
	sVg43wSvhHnd0DjDLSZbAekjWHUOQbRYc47GYxlwZTxY1Aex7M/U0cl1hpicEp0IHPjZMPMUpy9
	QfkF/KCR0pNuxEzwsbwKGtxiKxB8xa0TeeZM/Kko6YqY3u1dloJk6Ygq//AQNgnzZg5Qezfzk8e
	T7hR83
X-Gm-Gg: AeBDiet2YGJ5YuXx5Ve0h79UU7fC9/fst+lfckGM3QvS+H6HVvBpjnnUJBPyX8aHIzj
	1wPEyyb5JpXWNoskerxWquF3WADudlvZiAKSiBlIq56c9aQM3luwg2KqHIngpNvIq5ty9nyYJ4O
	86ueSPBUaaee/ahOIUx1qchnSe8Uzn06qfROu+nzDMxh2XYa94HCvpYjTABKmpqYcu3wEid2+/W
	TBpoG6WxyTmS8btmRDWf6ox3l/uD3V8psJ2LnNrSMhdiTNv4Nyrq3ox3n8KyoEarnqxV7JQAbIQ
	4n7JWOriCMJMzAlHQ/Jd1o2FVekhqwfl+2om/jwRQXTrDeDsl6dU+lBtHGwkIt4oHp99o1/94UT
	RPFIRDxDO8hceiSJNtoHHS8vzej9nOx3QHSMgTAQ7gdDPKyeh40vw/SS8X6wtrDQEH+K3q5Y2EE
	BvsidMQ31eBdPgqMv2EaoHS0X6
X-Received: by 2002:a05:693c:3006:b0:2ea:3370:6e51 with SMTP id 5a478bee46e88-2ed09fb0d22mr1787711eec.4.1777394395817;
        Tue, 28 Apr 2026 09:39:55 -0700 (PDT)
X-Received: by 2002:a05:693c:3006:b0:2ea:3370:6e51 with SMTP id 5a478bee46e88-2ed09fb0d22mr1787668eec.4.1777394395038;
        Tue, 28 Apr 2026 09:39:55 -0700 (PDT)
Received: from [192.168.1.47] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a0ce878sm2622054eec.16.2026.04.28.09.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:39:54 -0700 (PDT)
Message-ID: <e8c37614-354f-40d3-be3c-983f45e5bb3f@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 09:39:51 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] wifi: ath: Use the unified QMI service ID instead
 of defining it locally
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, konradybcio@kernel.org,
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
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316171419.2619620-3-daniel.lezcano@oss.qualcomm.com>
 <51e28a7f-8362-4bf1-9b9a-9af9cda1d748@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <51e28a7f-8362-4bf1-9b9a-9af9cda1d748@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbIkiCE8 c=1 sm=1 tr=0 ts=69f0e2dd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yneryZK0HH5dXzgVxAEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: JK7LEcDtLKajB7MkXRHJxCS0_IDNMTkK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2MCBTYWx0ZWRfX8nTMHEKV/P0o
 VKIgJJfoxQIqH4SXQFDM9KxGzAyQf3iwqMnfHdzdg11ocsASoyrXmra5s98lqnnL19fLilGiCWT
 scmYHhH3+lkNDm5b+6Mj1UHPk8Ta4QKP2VD2UWij3jM/57V1jWRhFLuDjhA3wPYBaBCe24b7dgB
 Josl4pWSBLPywPHq+yueX7LS+HuoP2ljwzWF+6ifM7QS280UbQqlBXJuLfu8BsYaPjY95qVHnQW
 J8nz4LSFfa9rqL76QEedWr7BpTcLBqjqYC4LPvmZfm7vU0vgWo2xi2whaIAyLIA2e58GBIEnsal
 T7yeWaW+uPjvTbceS4A51GjHNZQrgFsG0BJ42D16w4FT/cFVOV73JIjxZKx6tiKcE5pW8P4XoLj
 l458fdoItYmqDhjypAo/adanUskOmgdhL9x7ScXSIvpd6Mk2JkY+YcXtTwdzBtJxD9CAQsIvDbP
 QHBUt+9sL4urrFaQrdg==
X-Proofpoint-GUID: JK7LEcDtLKajB7MkXRHJxCS0_IDNMTkK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280160

On 3/19/2026 7:26 AM, Jeff Johnson wrote:
> On 3/16/2026 10:14 AM, Daniel Lezcano wrote:
>> Instead of defining a local macro with a custom name for the QMI
>> service identifier, use the one provided in qmi.h and remove the
>> locally defined macro.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> Bjorn,
> Feel free to take this through your tree since I don't think it will conflict
> with anything in mine and it will take time for the definition to propagate
> back to my tree via the normal workflow (which I would prefer over merging the
> immutable branch).
> 
> Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Now NAK...

The definitions have now propagated back to my tree, so I'll now take this
patch through my tree.

/jeff
