Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBD92F7EEF
	for <linux-remoteproc@vger.kernel.org>; Thu,  4 Jun 2026 21:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780606938; cv=none; b=AofE2tiy4BNpsqd/xsGVtP+K60U3sfHNbitTugJLfJoXeAQosI/jcBPewICdsOYwyNujovIz1RTe0EbVM3Y3RrP9MBHsRs4misBrm1apd9VqCeDVwasx+A1ypjmjj6448tOiVLwPpe86Bw1npovmMAAUb6urCQsYslqy4QrEXfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780606938; c=relaxed/simple;
	bh=1Mnqpms2o44uk1778jDhw/oChgvu+1zcxrO/eA7pYOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6mhmdrzEpti40PHDazHosHuXEwkCYpxx1r8qA0pAyMl9RbWkmDevlaIG3FDV3rMIAU1MzfKqq01526AfqjRF48ovzUOpoRoDa2TWt35FVBbEh4nIYtynrKLzywSL5ujSjN0LFjfvtDK5xw2JslG+cXfLG9HhF6QOgfQ9aF0bpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jif3TTHi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V8F3FheN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jif3TTHi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V8F3FheN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654IUe5u2478030
	for <linux-remoteproc@vger.kernel.org>; Thu, 4 Jun 2026 21:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+J7VoHerHsoGih65b4TQk9xRPzpJ4VqqpsrxtPUKxA0=; b=Jif3TTHiDkOjim6C
	07P+SqvzsVQVBbWcP95eX+1XNv6SqrO9qO6eygasz/h3pI3Oh7mxD80Rb3ezLBOs
	2XDNoWPcAe+eVZpjOachA2VNnImA6jMFXDW9gsBNOmnsmH37ezZBttGePAxsu3IH
	f5EId//qQgc6gaG4LhwIMhkIXVHTVIemPwNOCkjw5Mr7rOovtlMIAVteDZFdIt5Q
	sXPdDgLsljvjgSE8+C73bjWKB9CB+5AvtVwEKlo/UnkV6x/SxL4MUwdP689oAof4
	hQ7DMpn/oEAFLGtvkqM5FJ1XmN0TwqnZql4e0dDozal16uCQs+cPAhyP9o/QxyuJ
	HNhLCw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek4hvkp1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 04 Jun 2026 21:02:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304ec73b015so2463909eec.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 Jun 2026 14:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780606936; x=1781211736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+J7VoHerHsoGih65b4TQk9xRPzpJ4VqqpsrxtPUKxA0=;
        b=V8F3FheN9yh8Vmw9YDXFLVofwd+R8vgVRIaHxXs36PWcH7WZsDwVWpnJeIADdjUtMe
         aVzDAQs1AaMRf29JhpCMbA74J5nGIWJkTVwB/eesakDSzw5FJT2Kd8/rOX3fqQK5SIw6
         jJI6JhaaOC6n+NjFpGuDZgY6Q1Y1UwW7ETLLu5F/+HZQlpxzlyRtIJTHCDazrk1iDink
         Pw2nU2+V5RXwzZ0QgF6NHGz3WFp9fuuXRTN/jPG/VAonp5kI3BJLrTbAekcmkdJZLYqS
         ORU5HpoG297doWOAXJ/I1msSQ7R+OnLr9p/UPt6ryJaUqenwYG+aWvF9VCMSjSvET8w7
         8kbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780606936; x=1781211736;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+J7VoHerHsoGih65b4TQk9xRPzpJ4VqqpsrxtPUKxA0=;
        b=EYHsCOAllkJWW5CmFXigofKmT3Gk449JJ4DX4geumJ/Pv4azJBiZfzFmiEPpXzfLPR
         7rjaG0j+MiiGYdLcltWyqSpXQuooXG0SJ6DSfRCQIr2ZB2PZN5xwXIfm75KqkTZtpuw3
         UEWiXA7RNTDwUcZ4XJr8ePIPZLeP6FrUrKHA6b0G5+o6c09VO3yydJ5IxKinXs5qAGM5
         Laq1Y1v1KokwifGVluhS/8pFvHo32chylOUkgFn7wY/N0tClegVxvV3ttZm9XHE0SNiY
         dqvMO0lzMv/O5T4cc9/S4r/H9F0sWvm4f+OMqzZQF5bNMqaHFMfcysEI7oaCrpmNG6TF
         ZIqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+SU7AabIc9El1VCmiHciJ3wPfK80zzciJudkkxzrNZFDpQ0Ff9c+QY3+uaFTLS6ew7TO9zy5KwyYeISj7BZjaA@vger.kernel.org
X-Gm-Message-State: AOJu0YxWmgQsVfu9QYkk5ggaLNUxpoX7tkOnmzGbhq0yJXIiRmu6ZxKl
	Vh4k0SUvyA0cgF3+Yb3BosFKIc96uKm591R3iFXDhL+CTRkOC5hLbm18u82HpbddWy0HgdEHC2e
	U0NU2T5sshd1Oql0VW2GF2r5151NCJYeS3I3hl62norSz16AXbkNOwrgmwKkXlslrMiyfLNWB
X-Gm-Gg: Acq92OHdEfdQqbNs6wFwrqmoNJaK2G1nvrhewrWwIzSKCa+Sky59mhfAbRq25qNjW4Z
	yqf0/Q+GKh2mWWcHs7BvdYNJhyVM1W6mbc5NGpo41dqHh1y/FfU+aiaLPifKk0ufpj23kWipFuZ
	8sBGZEBKZV0zFKIl/ylNwGtoHZH75Wn3pn0SoMb941ja/Z846FwB00lIvqadXeId//BEJl2eh1/
	649VUJ7cnhMg2QMrKrfLrBCfOFf9ZuIcI8f3W3injg1aSR1R9iZV/+MKI/NhzPHUNIK3izcsKsQ
	wTNU/5szFhLaqIRmw/5OuK33NljhkuMdOOcLfWpvS2A/u5fzcEP+9Yv+AsuuB2oC1gQzUX7M4sc
	k9n7JrIF+ip6XkF4fimJogC/lx3fm7BFtSS6XxPKpUjD4WDo/dIGSJt2+ZU3aVJEt/CmZH+0ee2
	XUCAcYKtK1kLbIuTF6ty5yzxCh
X-Received: by 2002:a05:7301:9bc5:b0:2e7:c701:aa85 with SMTP id 5a478bee46e88-3077b47c994mr232151eec.17.1780606935978;
        Thu, 04 Jun 2026 14:02:15 -0700 (PDT)
X-Received: by 2002:a05:7301:9bc5:b0:2e7:c701:aa85 with SMTP id 5a478bee46e88-3077b47c994mr232121eec.17.1780606935447;
        Thu, 04 Jun 2026 14:02:15 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df349d8sm5820083eec.22.2026.06.04.14.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 14:02:14 -0700 (PDT)
Message-ID: <9d3728cf-bf4b-4ba0-8c71-831d908072a9@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 14:02:13 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/1] remoteproc: qcom: Add NOTIFY_FATAL event type to
 SSR subdevice
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: quic_varada@quicinc.com, quic_srichara@quicinc.com,
        quic_viswanat@quicinc.com, quic_mojha@quicinc.com
References: <20240820060943.277260-1-quic_gokulsri@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20240820060943.277260-1-quic_gokulsri@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GMkthOGhTJUdENL7mzctSRUCm48sRS2G
X-Proofpoint-ORIG-GUID: GMkthOGhTJUdENL7mzctSRUCm48sRS2G
X-Authority-Analysis: v=2.4 cv=Zp/d7d7G c=1 sm=1 tr=0 ts=6a21e7d8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=Be1Yk5Ofpn9B-WBGvlcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDIwNiBTYWx0ZWRfXy0qGciBdfVMo
 SCaw3mV92U03XwSa1VxcJQkapPEDp+IXtBrLTaCrzCyA+GvB5iNA7UjTeP7F++lYKVgUVoGB+RI
 P4ihHpF+cWWbj3UVCZkHluAOFMAFf+MA4Nphj7fHmxkW/yvEUxg3uu5Qgz6QPk6kx/4ZOrl++Ph
 HF7GgA/krtarkDf9qtgAz1qmvMk5pZqyUWUcUpr/7a3TXJHe1RQPSkigE5JVneUiCH5jkgdJkIs
 e9GNCyjAUP7MsxAKnfvC2at6fkQXyGBemutzCE1Nnz5O9I6uiJmcVWMji6Y8/pkUlBh5I5Vjf17
 Es908uWrycXZjh0ytJc38Z2jzrO3XPPSbBuScLv0Xu0f7fExZzoDR3/b+VFJ51ce2h1vBO12DGf
 pRM3Oi6g7U2G76PsdFXvGPxOWzMXLyYigrnTw7mBcQdo2HuelaMiOjQMchqc2wSBcxbdjd5qGJk
 O3FLTzswNc0Zqjd5OVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040206

On 8/19/2024 11:09 PM, Gokul Sriram Palanisamy wrote:
> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> 
> Currently the SSR subdevice notifies the client driver on crash of the
> rproc from the recovery workqueue using the BEFORE_SHUTDOWN event.
> However, the client driver might be interested to know that the device
> has crashed immediately to pause any further transactions with the
> rproc. This calls for an event to be sent to the driver in the IRQ
> context as soon as the rproc crashes.
> 
> Add NOTIFY_FATAL event to SSR subdevice to atomically notify rproc has

Almost 2 years later and I'm finally seeing the ath12k patch in internal
review that uses this.

I was confused when the ath12k code didn't actually have any references to
"NOTIFY_FATAL" and then I got a build error due to a missing
QCOM_SSR_NOTIFY_CRASH.

So all instance of NOTIFY_FATAL in the subject and commit text should be
changed to NOTIFY_CRASH.

And as was noted by Dmitry, this patch should be packaged with the ath12k
patch when it leaves internal review.

