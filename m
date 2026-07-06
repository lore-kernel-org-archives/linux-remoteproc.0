Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC473BB66C
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 08:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328378; cv=none; b=QecE/yqFef5OaWnxQvySecM+nMdfjB4QQQXknSy0BW8a0lZFxT29s1jt965sb+NaeeNIf30DB9aNtkqg3nQ2lUy57lup8AhwP66oIRGJad++VnCpXXc62f5UqJvwPAO08C5JGH8w9mG+dBuHxPPPjpu6kOxLBuSHtwvBK9h2ACg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328378; c=relaxed/simple;
	bh=gyxOXMMbk++wVl7V69/3mnQLURjaC9RM/JwO65/GSoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NO3UnmtLZFFYT6zaXwzn8dT81Zk66+vm6YXu6URZnqwvebGqxGPqzdh9lgjSfKpMA6aEUL7C6nJmlF7Mt2EFpaCGpgLpmD8OEIw45ColdcAi0Ar+C2MtFSedhJErh86FbmsMDddJXsEpCkVo19x1NeMmRlSBrZlhFja1mE2Jon0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZK49CXW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cHOOIw92; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZK49CXW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cHOOIw92"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6664255l3616551
	for <linux-remoteproc@vger.kernel.org>; Mon, 6 Jul 2026 08:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gyxOXMMbk++wVl7V69/3mnQLURjaC9RM/JwO65/GSoA=; b=pZK49CXWT62Lcuy4
	Bu+DDwFjHtdU53bRO7cjCi1hK/epxPJSjbJ0PI9VM4CjdiqUziN731mrAvxsYnCM
	W8P9n92zyDuL7pNL012LpgTA3wNyXLIHj6waerABuZz0Yi11oEYIYIyNjRfet0nl
	8HemN1JCkIeuPKZfae8UtFZgJhzOgo6S+5IPYhcHtfHn4sEeChYygtjBL97jpCLK
	6OgHBgPzGtojMUybBRdF4KStjZ4mEHUEwzJXcDWaF1xuU6OSUnVaS+iFSKni+/1M
	tfwPmgWOdomKTouW7FdVvJO4HIwLvczAcWLA5PK/7mXGGQoIyiAlcmfyslogcOWX
	Z7wORw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3dd04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 08:59:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8479b7c3adbso4828893b3a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 01:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328363; x=1783933163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gyxOXMMbk++wVl7V69/3mnQLURjaC9RM/JwO65/GSoA=;
        b=cHOOIw92+BgM8uNAoh6xm8AyV9QgQ4c8j4/jVcJAVdjlYd+dXIBehn+qgK5bC+LaYZ
         Prsp7cGMW02ovY8ipBe+1SPsTR10T0g/nNbgV9arAOGy/XBYFx8WqiCfY1x+1a26xlAz
         31CC/1UfcbPIw04j0j5/hZXHfgtlnN/jyYFt2mnRt1jSq3TpFxB1fIMgW2fljM6ocO/q
         EXTnFhcU7WT/Uxw/pwweWkWfFhu3HleEkORRFL3caDPTSuBeZJx/jghjDs4aZ63W4tYB
         3fKzL0AtBceXCuNPEXE+FN+2kwtf0ByFBjIcMNoTbgaZghqij7j0wgPFXdXcbeYHDB4s
         p9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328363; x=1783933163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gyxOXMMbk++wVl7V69/3mnQLURjaC9RM/JwO65/GSoA=;
        b=rRH/KCmKbj698oukk+B2yar9etqURbdKYZx9jHnu3RcbKvzhGli+SwwfpCW17XLbcm
         J4XpFcltywGIgLZv+ILu9b6UZiXhu6b9hfCz6IYkEt8bWdCCKQKa9czYa0MuLEdDDvEA
         3Yh8n1iiz2rDKmcxl814t3UNTJZxu1D/9NActwbznnY2lqXo49pxo9FTZPa7VHNM9G//
         AZNcO6hk6uMUW55aOXf7joC+SL/LWpRVVQAQOn2ZpQNTsmOldEFoxB43L4uchbxQUSeH
         L5cThNoywwgQB1AJTkHI5AuB+06g4/aZoyCNLUtukooIvfzOC/D10YTh9LM/LL96yDdO
         DOiQ==
X-Forwarded-Encrypted: i=1; AHgh+RoLadKzMq7nCWQ6Wm1uvkyYXMY81X/XQAJomvfnCG4hD6TBr00NnNj+eru1hIFNOnfK/U98ItVUE1VrHfDDHWeh@vger.kernel.org
X-Gm-Message-State: AOJu0YwZl+J0i+AwJnLDLPRgihBFKYxFry3UpaSxLR/kXy/E3+GNDCL/
	XDjbt9vEKuMPgNj4g7hiyBPrSBkRzh+JddAzhiDdxCIYZSxAbMBHVtFi1AglMGQOD1pK6+Azy0Z
	jkGpBDXDsdA0x5FjLVD1IPQ7noNySyQ98h1gT2MkzfIiZNEV9arzFdEZkYsIrT6dasBC6OTV4
X-Gm-Gg: AfdE7cklvc1Re8JZnoZ4ddezuc/ZxWAHOevd+lo/QTMN1EfeQFyDsGFmrWM2KajttcK
	JfxgkwwEq5guvAguv8f4bm2/hpmewSNOzow1SNPo9f2j/w3yHgf1l27/dsUI3Hb2wz87YJVj98x
	oke0CiISBjtD+kQccl3001+uwCHbTStzsmwyBOKwzXQOTtu7XFwyqdkStVHf80sqqIMW76QAv/r
	9HAwMhP/vJ4gc6x+yyKAQKZFON2JQuf94xMPfUdi1FLW5IFf2BmbzETI2UyzxIhuy1PyAi6M+RA
	jNGmQTUXHyzbMaiQcZqaoVE0Kd8xFVcWL/OaMd8XLuAcsVeaXT625t4kioXbN5KVro/wFPdU9Tw
	aKplJnXSsUF6hTaiVix1cl0kjx91ScY+Jr+r5jaTN7xyq5/yh47BbF6vG//CexBOa4keyKVy0H2
	THdo9l1Q==
X-Received: by 2002:a05:6a00:aa0a:b0:845:4928:8655 with SMTP id d2e1a72fcca58-847f6f0ad41mr8501240b3a.39.1783328363391;
        Mon, 06 Jul 2026 01:59:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:aa0a:b0:845:4928:8655 with SMTP id d2e1a72fcca58-847f6f0ad41mr8501213b3a.39.1783328362871;
        Mon, 06 Jul 2026 01:59:22 -0700 (PDT)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dbd07csm3418527b3a.54.2026.07.06.01.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:59:22 -0700 (PDT)
Message-ID: <0585ee18-5bd3-424b-93b1-eb841c26b63d@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 16:59:18 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: glink: Split protocol start out of native_probe
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com
References: <20260618-rpmsg-glink-split-protocol-start-v1-1-c4f93986cdb4@oss.qualcomm.com>
 <43293037-99bd-457a-b190-31fb24625b1c@oss.qualcomm.com>
Content-Language: en-US
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
In-Reply-To: <43293037-99bd-457a-b190-31fb24625b1c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfXxDjx8PkyTBgN
 UHfo25rKsX4r2fHKKN92B0CgX0C4h0pv1XV8/+/qjBsrJDDdxT0T0sJhJROPA8krLm4BTBavas4
 GNxSACH0MzCAd5uufglcex6Q5ZQSi4A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfXxKlG1/637PLQ
 VXFLYqJPp12l3JCHfsu3SFoDGte/70QoMgeB/iVrU18RGHiZg4Qj8Uofi84bIJusWcfQaI+Mh4+
 YPalQb5N8iPm+gNRfRMPkTV+E/s1tMrl4jnVSKqtLA1Mk3zrzem3i2pnOT9x7mnUP9zAaz6sEAb
 Zx5mE4e8K+g9GJn1SNSzuas+p46Q0PQVL7kJWdVEZbkS/OKrXd4Mh/PID9OFE3V5eFWJn8A6nTL
 iZLN5cYcuDltx+dKHMpG6h2t266pP46MA9gjlFyl0ReGP/qUmhCJiFGLB5Dy1DoKgoYG1JzbT48
 LincsoN3OQNMeY7Gzk7HghFbLnISNSoxAWgUVzYAKLqHDcp2Xb3nwDjib3ec7pE4WzWxlcWFpHH
 J6Tfv38n4EOKnjOacGdlHvII0e848PO2bTR51yPBSScP5j+9utHIJ7ltleQlJxoJ9uQIYvhoKAH
 vSx3k38a717wI3mwCYQ==
X-Proofpoint-GUID: VGWRgNSRdWqHoQpDyAc3BIRhaoEd1OG0
X-Proofpoint-ORIG-GUID: VGWRgNSRdWqHoQpDyAc3BIRhaoEd1OG0
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b6e6c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7emMc0f38C9vq9mhEe4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060090

On 6/29/2026 8:47 PM, Konrad Dybcio wrote:

> On 6/19/26 7:01 AM, Chunkai Deng wrote:
>> The SMEM and RPM transports request their receive interrupt with
>> IRQF_NO_AUTOEN and enable it only after qcom_glink_native_probe()
>> returns. Since native_probe() sends the initial version command, the
>> remote may ACK before the local IRQ is enabled, stalling the version
>> handshake on a fast remote.
>>
>> Split the protocol start (qcom_glink_send_version() and
>> qcom_glink_create_chrdev()) into a new qcom_glink_native_start().
>> Transports now enable their IRQ first, then call native_start(), so the
>> version ACK is guaranteed to be serviced.
>>
>> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
>> ---
> Would it not be simpler to just move the devm_request_irq a bit down
> and remove the NO_AUTOEN flag then?

Thanks for the suggestion.
I analyzed and verified it locally,but I'd personally still lean towards
keeping the current change as-is. My reasoning:

(1) The IRQ must be live before the version handshake — that's the core
point that can't change. The version command is sent from native_start(),
so we need to request/enable the IRQ first and only then call
native_start(). That ordering is only possible with the version send
kept out of native_probe(), so the split needs to stay.

(2) Dropping IRQF_NO_AUTOEN does make the structure a little simpler,
and functionally it's equivalent, but I'd lean towards keeping the
request-disabled + explicit enable_irq() form. It makes the ordering
constraint visible at the call site: the IRQ is requested up front,
and enable_irq() marks the exact point where the handler becomes safe
to run(glink assigned) and where we want RX servicing to begin. Folding
that into an implicit auto-enable hides that intent, and I think the
explicit form is easier to maintain.

That said, if you'd prefer the simpler form, I'm happy to do the IRQ
cleanup as a separate follow-up patch on top of this fix rather than
mixing the refactor into the race fix.

Best regards,
Chunkai Deng


