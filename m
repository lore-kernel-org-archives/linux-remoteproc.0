Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2863D9678
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 10:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691648; cv=none; b=AwpCVCTkfUAFroDy1TzEeDwHbOPPbSml33HDLEw7HuFD19hO292AbdXCYcmw/eaHgOGrmh1VJPg+OBBan9kceW+WRgg9nVARE1cQI7xrsEDfxX5KO4pJDAXz39kKf2hcp5taigOxkvYSdEfL7KCyiAa/s/ULqUvH2d3U9RrQUzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691648; c=relaxed/simple;
	bh=WuP5u/ZoxribT8PGwz8TXVGN3HwyXXM3wzG9TYRQ4K8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V10UssIXEkAEhiGbQNk30wMQBQWA1lg6foc6L0oT1coByhTlJOFVf+Bfr7Gy94QGjozzS05f82F7jFdDcnqm8E0fRKAmD7hPvHaecfee2o07TKH0b9mYhb1VtQmUYYcyM2rNqOg//kF2vJ0xafltWrbXMm2oVXHF19Yk034rpk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TPfnMdTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QVYGQ/2C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TPfnMdTK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QVYGQ/2C"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UlGs1607946
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 10:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cg2K5gQ16+6GwG5qTL6Bdl6HDq+V+fzBEDj9yIQ9kPc=; b=TPfnMdTKWtxk6qw0
	8RCLsC27+b76QXs4DXMpso2qS/qnEb2OYesHWBGHbticyKFhm+RQOhhUfb3s/6QH
	z8HmIpsFrNYkPVP353XvME+GemVM7/NC/bZpby7DPNDebKyQdFXIO0Hz8xeKneKt
	w2pC6bS3Bv2Pw7fbPpOqIQJkrg2ADYUisP6OBxfHKosY5MIoUwOVDQCBPEPQiElS
	vNHmoltvl160K9UYwhc47RJxlku7VJSWUsqej/ms1mUXlbJTiWDhCQM05RpcbbT+
	ib8oScklN/lcu2qUKsYH1XP7aOO1SRS2Oz+CF9wbhwzdkhS7Wh2kUUrH5U+S6+4h
	ahFddQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef22k6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 10:20:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842446a3851so2907376b3a.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 03:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781691640; x=1782296440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cg2K5gQ16+6GwG5qTL6Bdl6HDq+V+fzBEDj9yIQ9kPc=;
        b=QVYGQ/2ChHpHQygK8YbRjhyfARzrQ6ipbQdFaKEGmU70mW8BjQ+r4zybIFgUZOWQbb
         /Q6SrPx5NUlz/KUNWZFy0b4q5nhbLehi0C0kw1ypYO3fayu/v4Kb6ulkpxpTZ9SBjp/q
         XZIucW6lPNteu+4TTdqrTVhZzIAQ37eSqaELtec69o9rySfBWC7oI2/X87/uWXGvZdSV
         NDR0rbdotcbE5XSk9/Jpfy7sI7tI+QnKnuNqwmQHYfdstBOVnnQEf57mM5bkDOXoLOwG
         B64dtG0H++0RgJYe1p++M3aRzV1FhZDHk9a26U7H3YrnQ1DIeoISRg2acOhZFWnhbIPs
         lQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781691640; x=1782296440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cg2K5gQ16+6GwG5qTL6Bdl6HDq+V+fzBEDj9yIQ9kPc=;
        b=kMzBM7jd3seKssNg3KRG+Ffrklf+AtIuSTfZbT7dtbgrv18Hf9rYg027SlW6IR9wky
         +Z8fU2fqfwjwllV4g5xVpW03v8IuJzy7DuqFL92g8Z0kJQ/NvpXDB0kDwC43yltskgjr
         L3eQGbENs8qrlCEfNPRmbkUUsmRCZIM2RxwmGQvSRbHSdAZEOLODBEgmnQbkIS04Tr5J
         Rtlb4ni2HhjrreJUTPKQrpcR012ryj7ZqvgpqvIXGSXQtB6ums8FWb/FZBAHs3KbUTPh
         +sYYSr/BrFe3He1MaWBl1XWOSE+fR5kubAsDAisx3iOkE7Da9GVxrw8b97Lg0md7QBDj
         xqqg==
X-Forwarded-Encrypted: i=1; AFNElJ9F3f1PedvAUOGiFfIz9kxXlUYuTuaESh7+5O9TagVkzY0/ZgJPeUrHvXH5+zFI+xPQRAEh1IwgPA+f+k7Ca5QV@vger.kernel.org
X-Gm-Message-State: AOJu0YwSYX463NEaP7g2N5JwhgYdgm+gqWG1esh0+x76nn3cylEomdex
	yLkh58eW54ecgJueAqga6c5KcWrxe/USWG5PwnHtd4a77zDs9UdZE8V/Ud+ae8I/ycgV/RvZ88J
	nZNeuIN/u9AgE4/6N9RBDzAEHsELPx0dJHfkT4eN0s18uuu7cRZLYecOL7rWxC2mso+L/QOzF
X-Gm-Gg: Acq92OE7Hjl8vE3Bmr5wKD8Lmlt0Klt3DM/FrK+BNyiXRX4wE+fl67CP1QrM3prfDkA
	rJsa65S+8xwAoz2iB8FEHbzEIaCnJELxtSHPZE5RBZWfXl+wDInWXGU24FPlpJt0ugRtp2QohZ0
	DvtrFqNFyU3YF4lV0xp9ER8e6/84ynyrHYxhG4V8xE4d4iGLpODt+ftv/kaAK7UyPHXJzlSCuQC
	jy2yDNPuQZqK2wlk6+zFLPRfi+PNC4eUCvvULob1DULlq61yRag/IHJWINmuLiBk51d2bt9/PHK
	iqBS+wJTuvxtnydekFgext6TM0UsgmIDb19mHbKv9VK60Uw+7t2TRbBdxhybSJ+InieLMkF24bo
	9sKc7WZ/KobJoYDRP4MtOcGuJ8fvrUVnZsGxSJ3Tb4Size8LAYQJtpSpVi2AzxJyrsLG17HsC2o
	8rAK56LA==
X-Received: by 2002:a05:6a00:1397:b0:842:540d:42ea with SMTP id d2e1a72fcca58-84524495c6emr3011232b3a.19.1781691639640;
        Wed, 17 Jun 2026 03:20:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:1397:b0:842:540d:42ea with SMTP id d2e1a72fcca58-84524495c6emr3011203b3a.19.1781691639167;
        Wed, 17 Jun 2026 03:20:39 -0700 (PDT)
Received: from [10.133.33.84] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84531dbbe7fsm370446b3a.14.2026.06.17.03.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:20:38 -0700 (PDT)
Message-ID: <84686669-ec39-46f3-ba28-b6180e630964@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 18:20:35 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] rpmsg: glink: smem: Use modulo for FIFO tail
 wrap-around in rx_advance
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, tony.truong@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com
References: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
 <20260603-rpmsg-improvements-v1-3-dcfc22ed69f7@oss.qualcomm.com>
 <ai8wxequ5yWxoi5H@baldur>
Content-Language: en-US
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
In-Reply-To: <ai8wxequ5yWxoi5H@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5NyBTYWx0ZWRfX2dCL/zG/URfR
 oYUCRSwlhgRKQ7XwaiB3tO3EQJULVuAGwfLO6bpH6IhP2uITX/k3JfLWXWqrEoSSQxK/FMYPJWV
 WUk+qxqy69wQTNzurVoIZyBllC6Xo7c=
X-Proofpoint-ORIG-GUID: hM-MFgV6CwEtSufHS6driMD8YZfSHw0x
X-Proofpoint-GUID: hM-MFgV6CwEtSufHS6driMD8YZfSHw0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5NyBTYWx0ZWRfX002h1qdRcLkW
 7LMthVITZ6qOT6LYNREo1mvi49JDZfsCu4D6iqb1suE50rhI+sGWv590MBz+CyADkpP/AlRw7Yf
 VuCsD4wiDHN9DjIkfiQufjgdEtYmsBWDjZ/CyIlsVIcILXRkGxWwe2RWN43nLFhrdRJ+jTe5hV9
 aNCrzVBE7lZ6IGoy3B0E0Oh24e+DgmwjwuBJOFICPwbqBXW/hxJqumgZKOaUpkadiC6ccCgTCLP
 7EN8qNOMEtxPTue8x4lQxOxf2RWOQOgQDvXUG4AzyJKkUl+XdK9MtBF9KpCqQRKePCSNSRoUzRP
 kA7DK/f7PEjXJ0FcSKtnaxrRNFvXKdncVc5xY5K6kVcTzoJ8Ctgcko9ahEEtXsyutASeWuxLiDB
 7TpHHe4GK11AcfPJuTD0A+RVtnTfYIH0s5n4g3YHZiXglItgBRJsNvRzXUQ6bGkJXnafTlR0wMW
 xUmqMRnDP3mKyGSWgXg==
X-Authority-Analysis: v=2.4 cv=acpRWxot c=1 sm=1 tr=0 ts=6a3274f8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=bMOh1Y247VvR-8fTSPQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170097

On 6/15/2026 6:54 AM, Bjorn Andersson wrote:

> On Wed, Jun 03, 2026 at 06:14:30PM +0800, Chunkai Deng wrote:
>> glink_smem_rx_advance() wraps the tail index with a single subtraction,
>> which only corrects for one full wrap. The advance count is derived from
>> remote-supplied packet fields (up to sizeof(glink_msg) + 0xffff bytes);
>> if such a count reaches or exceeds pipe->native.length, the tail remains
>> outside [0, length) after the subtraction and the next FIFO access uses
>> an out-of-bounds offset.
>>
>> Use modulo so the tail is always normalised back into [0, length),
>> keeping it consistent with the index bounds enforced by the WARN_ON_ONCE
>> checks added to the FIFO helpers.
>>
>> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
>> ---
>>  drivers/rpmsg/qcom_glink_smem.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
>> index 42ad315d7910..4f143921b719 100644
>> --- a/drivers/rpmsg/qcom_glink_smem.c
>> +++ b/drivers/rpmsg/qcom_glink_smem.c
>> @@ -129,7 +129,7 @@ static void glink_smem_rx_advance(struct qcom_glink_pipe *np,
>>  
>>  	tail += count;
>>  	if (tail >= pipe->native.length)
>> -		tail -= pipe->native.length;
>> +		tail %= pipe->native.length;
> It seems unlikely that the "tail" will point to the start of a valid
> header after this. How can we make sure this is more robust?
>
> Regards,
> Bjorn

Agreed -- modulo only normalises the offset arithmetically; the
protocol state is already desynchronised at that point and the tail
won't land on a valid header boundary. The patch hides the symptom
(OOB access) without addressing the underlying issue (a bogus
remote-supplied size).

I'll drop this patch in v2 and keep just the WARN_ON_ONCE patch as a
defensive backstop.

If a proper hardening of the receive path is wanted (e.g. validating
chunk_size against rx_pipe->length on header peek, mirroring the
existing "tlen >= tx_pipe->length" check on the TX side), I'll send
it as a separate patch so it can be discussed on its own.

Thanks,
Chunkai

>>  
>>  	*pipe->tail = cpu_to_le32(tail);
>>  }
>>
>> -- 
>> 2.34.1
>>
