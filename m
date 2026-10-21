Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576795;
	b=Rhoo5s7Oau2HZ/fgZokdTOosJEF8PfP4ShGQXDX7WRsVqwPJMYl5fNp+/t4MSFihcbGc
	 wPHE2pey3QEz6hNhN//6wyIG+FyK4Zys1/UdF+8yojfyPp509khQL/cCxChw/qU1/5Egk
	 Hj6+N1Hi2FA91S22ZL1Ak3yenKdnJ+4C2WmoVdAOb6bD4nGlfPioEJ0rbbdsildcos21a
	 L2Kz4j0fnlZWc+Jcs2iKC4sd038wncU0W5BloxgwUe+MRU3zSa4dvLPlARw9zalehkJS9
	 NXtaWS0wNqMXphJmiqp44f0waFepUwHGBa5ku5cIjoAJXJP06FhhDI8HdHNs3ZriA3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576795;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4yP8ttg+rpEQYuH19+9KQM8ac15FE7RfLZpDf2VWAhg=;
	b=vBGVHM7KJ+d05Ar21/63AazkA9+FT80VofiDEXMkMsNN2FmPUc4U0mp+xN9AEfQLHswz
	 WO6OPzFYSGLQ1d8wD05kS6hD0uWUi4RO81gyA7MB09C9xpXdfePMsYAsFRCj5p59oQuw/
	 eMOcccBI1ItjISv5dSSzUN9sRVJSrnOl9qQRcBKHbMldk/20x5wPjtVs4JQ7TdhLgfq27
	 nTfnHadxdvUnVW6IDdsOyY2+7EFx2bAIdRKFPPl0zc9fS8/1dn+iBe92zK2Ev9ktV7QZf
	 DJIC7MaUud4StB5MhUU+4lvgi7Pqm/0i+Kxt2yYn/I2WyUoIX5NQFQ4UwBC7oIHu8YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jOQ7rFJf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N8ngMJpD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53694606A31A
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 09:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53694606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jOQ7rFJf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N8ngMJpD
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j0co756340
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 09:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4yP8ttg+rpEQYuH19+9KQM8ac15FE7RfLZpDf2VWAhg=; b=jOQ7rFJfoJnRqvLp
	cZvlaCpXNpC2EV4vALOwIWs/r7eZLrNflrlH8fVX0JFAG2qr/4gsdlmRRVlJRWdK
	hIBYEDPVmQdcwtn/ZOjUg4jq0jU+WNez1YfLxGfflCiQLE9Ck63dacgTeyzEysak
	MFoY50OMV9UT7tcYk0UNEIM1YbQvNPS2sRr3eUxebEzeOciBHhrMSPTDIVt+jT0Q
	DBM5nfnUVakz23nftf8OAO45caF6prRog8cfaXbX5B7Bhv0e8eJL7nUiZd0CRbJm
	53SNRckMdyrr3Q2h4BGHt+C1pP5ALpysqOkwGBvxvk+7wLLO/BRN5CEtk1MbRFfq
	d2qvAA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4ubav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 09:59:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93df7a9466bso5100085a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 02:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792576792; x=1793181592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yP8ttg+rpEQYuH19+9KQM8ac15FE7RfLZpDf2VWAhg=;
        b=N8ngMJpDpmqvmCXL7svp5vq14+su31741tUruWUGMusXuozXYSFIuY3PqL76btaMWc
         BQex0rHp424rgZlu1KTNAiQPLealRv6tJtQBSl7hY/15kEq1a1ZX4IBoH9MQOlmPpk3r
         viXd1Nm6VKqmznIPZON3x8uEXJIjWAJdgUGb7u9dyZpwyr4amjBKX1+Cwe3HeQBBdi14
         8Dio6Zwix8rYxf/Js/0SElRUn6qWAlDH1qyG0PJaGGTGvM5t5tCMSLVZA3ARUFBBqPa6
         i3EepNwoNhop+iZUuQep+nAj/+KYmd/DYG6HdgOiX9uvgMooOEc5FsnI8p7Kdj29WaXH
         OFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576792; x=1793181592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4yP8ttg+rpEQYuH19+9KQM8ac15FE7RfLZpDf2VWAhg=;
        b=K1gRxxlgPjc6C/XGIMgaRRBhGOk3evCDbqpVH9El1N59jqjLsd/mBTR4LJ1hQXqAjj
         T12vSzSjNlWc/6e9mQ9dVIvj7F01LPOsn2h0ajgUtFeKZQ2AVLlZI0fmxn3OmVmGwmVp
         otGTmh6f+uYyMMBIjHN7hKsO2WaPtAko2iW1CMHZoW1w7orMehpLwfZTZr9RM7IOhbpN
         vCIQpaGKs/2N8iVVY4IXYvmm9vFBS/d/I/hnviRIawhbr15BUwvvLObJjabwyXcQcY8n
         WqeFPxXWHwDtno44fVFz0RGlYgkdy2OD9JsKTSothD8DHHqS46ZPatdTZ/CrMA81o7Vs
         Yqvg==
X-Forwarded-Encrypted: i=1; AKwUvBwZcOJguu7z54iUg7BV+FVlk9cGB/UZ+SK+/nfI3BOWvKaCwOmcprOu17Vx7i/DycLYKMsbIu91wKQ/r3gK+39q@vger.kernel.org
X-Gm-Message-State: AFq9FYKGB3UtzfWFuiY4IwdYb/aK720rnMrGWlu3kKp0DzloHFCmeZRB
	UcAc0RH7c6cedUEedrCcVeXHjdMCOnOe58FG2XfUifocbQ7FYXgkhkhFCVqCecU0UR7v1sY3bw/
	woSFpeRqLUS0DzYLNo4hOzRVw29Olx0W1XgwTkdK36/Q2evnkH0dnWU4APvSKYJBrvKsLhtec
X-Gm-Gg: AYBFou2Qd/5wfa4CYBgFokLENDaide8R/52ttNZBDWnqV8pdZAKl5ctI70IvqSXGIXW
	+3eqRDMPejGSeb6gflU1K8G5EbL9KqUUpNQ2I3Wf/T7b1KozhaXMZ5gGbVsiWykEnrlgg923FGj
	n26ObjU1ncZbjpIZelap4P9xEW+zMeFWU/juO5Iq7VqGELyUeYett1MBpQ/V7OakVfNx6qRjPmW
	to44tLeJN02WRqb7hqMNpIVpr5agZWFUVvH6A0yLPCSZ5sLugYcdN4p7BrKfXW9fhAPkIaKEbrU
	qKI0hBobQYIoZWv2G4Q0y2PSQubxF+iI5Ie+tgoBJepPJaGEFBiojZujSYv48eboweMRc/gLey8
	mE1l5JZMgO108pXMFx899Tw==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr364454185a.2.1792576792384;
        Wed, 21 Oct 2026 02:59:52 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr364451285a.2.1792576791929;
        Wed, 21 Oct 2026 02:59:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40315506bsm685930a12.29.2026.10.21.02.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:59:51 -0700 (PDT)
Message-ID: <f09674f9-5336-4e0a-bd68-cd9572c8d0b7@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:59:48 +0200
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom_q6v5_wcss: Fix missing subdev cleanup in
 q6v5_wcss_remove()
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261006-b4-q6v5_wcss_remove_subdev_cleanup-v1-1-307f58667679@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261006-b4-q6v5_wcss_remove_subdev_cleanup-v1-1-307f58667679@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4VCKNBBK4i2JmnDtj9RphPaYRDzWBjeM
X-Proofpoint-GUID: 4VCKNBBK4i2JmnDtj9RphPaYRDzWBjeM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX20d6gIQqz3BU
 E5l7K+kBz0UxKtT/G56evWLZWLC0dufTMqsG1eRPA9V2TKMy1p1LNiegROhmFZSGSFeudzTz/g3
 XUc5542/q8TiQi1jmqAihjuyOslFZeI=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad88d19 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=o47FBeiU2xnD7M33FAIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX7fstusXDs79y
 fulptMMSDkshGgGJ8lzJiMOqk5GdV491osTLFjBsg1T2UHlx3haf9swS7UDAtuI3BjE83sw8dmc
 eXTgI6OSkTmmYvmycZlCBAycINSN4/EKb+IlY6ZXW76PSwbAejL2HpAxZ+QQFjrOCXMMMIdEX3M
 8mwbN3GmOhxZDOBjKc+m+HgeJSJQBm77le6ygOmYVjHPOG4jeMLjr97LCiOtBF406MUAN4qBnCr
 uk2ALduTX8Y3jsDvL3T7dS3VbgoEGe2l7/2D4TztbPnf0qyEyVyE4ezuT0rzyo+gj9z65dOZgXV
 G/kGi6nBgDYHnA1tQjyN/wvJ7hxJIIOvFCpSORIp8e/QG4uvliju4uc6eX+bRVNcoWFqugS7y7X
 ac1VsU2ATjs57OoTCrEiOx5GqHgl3UhKpMNyhL9M6p9TchDP6XiK+tJevQDz/+ZuPRjEJR2AupP
 DZhpfc+23LyioanChOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210039

On 10/6/26 9:29 AM, Anup Vishwakarma wrote:
> q6v5_wcss_remove() omits the cleanup for the sysmon, glink, and ssr
> subdevices that are registered in q6v5_wcss_probe(). This leaves these
> subdevices registered in the rproc subdev list after driver unbind,
> which can cause use-after-free if the rproc framework subsequently
> accesses them.
> 
> Additionally, rproc_del() is currently called after the subdev cleanup,
> but it must be called first. rproc_del() internally calls rproc_stop(),
> which invokes rproc_stop_subdevices() and rproc_unprepare_subdevices()
> to run each subdev's stop/unprepare callbacks. If subdevices are removed
> from the list before rproc_del(), those callbacks are never invoked.
> The correct order, as used in sibling drivers such as adsp_remove() and
> wcnss_remove(), is to call rproc_del() first, then remove the subdevices.
> 
> Fix both issues by calling rproc_del() first, then removing all
> registered subdevices. qcom_remove_sysmon_subdev() already handles a
> NULL argument gracefully, so it can be called unconditionally for
> platforms where the sysmon subdev is not registered.
> 
> Fixes: 8a226e2c71bb ("remoteproc: wcss: add support for rpmsg communication")
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
