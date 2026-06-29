Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF6A403AE5
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 12:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782737260; cv=none; b=LAWiE9vhh35Tc9r1E7PXqj7iDa7uAajvk8ziUiZxxA1MWCIC+hoWk+kE80d5bGWR7ailSrynZxd0lW81Dvn7or3+9tKLAhkXTTWJGPLsxGsl+2/kHfPsLLUskoGV6IjJc76CxINtZiby/H01QE/JUouz+VTtE+wwfLDUsy6eJlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782737260; c=relaxed/simple;
	bh=uOU7ruRgctPgg/Wix4v7+9GmqLcV0osZIBR40g8/VFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hT0AnHklK4DjNx6MiTZkix4wghSmsLsj2gygBijlFSzFbtcJkpqHoISWJd5mFw92NMoP1Ot/xl/j5MsHHgTbHWriuB9to7ElHOUdy/dbVOKxG/k2rD8AJ6MbV9CaAmCWeNx3JNnZMzGTqEz1TePxUvrF20QIbYN9jlxfRIfgjFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+MEznC2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6WGxBMP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+MEznC2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6WGxBMP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT2cr2646894
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 12:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wQL0usVdCCvSUM4dAKsCdGlSjRRi4QeM00uIctedMDM=; b=Q+MEznC2afK/uQ1D
	Zaoeg6E/nQBpLdYqzu7G9xFCG5/jZ0f0L3UJ7q5jM57nvZZ7K7pANwo1pwwFc717
	c+EzFOXzo2cKG+xk5idbgoZ/f4EyKJ7F45NTiar5gvl9hyIWLUxkDNYUKvdMxDQp
	hrTX7FfdtHDRahWbpecCcqnmDKHSu7rEAN/QtFBIpfHhEQbkAUOtHn62O35ptzou
	aQhop/Ph3jFPWVSYYEP327OX+Nk+xgKOVkp5xqGZ4kTvlopWCjXcF7hm1aLRDw4l
	Tjtn92S2yztOGi3LHy4QCZNLd8QMxtFTzFB7ukFEW9eCy2ExTDv7xUVE54Yj+UOU
	ySymmQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4tsa8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 12:47:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a07295d67so8854701cf.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 05:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782737258; x=1783342058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQL0usVdCCvSUM4dAKsCdGlSjRRi4QeM00uIctedMDM=;
        b=F6WGxBMPAdKmQoHy/YJNvkjGHA5hn+O2sUSISBTMwMPoSBIa8tMcRygh73SRcPVLdN
         2Nm8ijP7/cGoYRBNkYPsR5RBu9ykAtG4NjoWpxPreV617/rfJHXUp9ct4ZrI2oON6Ap3
         YzR2h6GyjdcGDEbF8JMBXLkUJo5ViPoCjVaOXXI8flItc7SPsBfGShrjdx3Le88w4JaD
         IU9W9BsX7r5wdfueO87G8evrrMR9cnpSDmB6feFYbP0QJIaD5p4ORFDGsNXS7hzYhfNZ
         1Nm4aBrXNtWmoiDamI52LGDw1DpxoUGFf9KlH94N7/vd2NOHxq/+6awb2nt5ivvUVnJc
         OPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782737258; x=1783342058;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQL0usVdCCvSUM4dAKsCdGlSjRRi4QeM00uIctedMDM=;
        b=PfbLokkBDfiqGV4uNk9DyjHBqdCDNiVbtDmHyYiDxwPJT+81mkqOZ5BeM5uihM4PBv
         adWKmhxOTd7sNtbn26MQlzp6xo7uP5uYDpxB0oPKLRrFBpRfQSXhZCF95HIByggBhJSo
         tXFOkSQ9wDqwtQ1MhJXawb/nKim5WqHPxklqyc+YJw9OunL36cQrQtjvl2g0r7Vu/m6A
         rSMkoX7pFr+te7blwrEm/TL0Y5JThs2n2h2g8P6SXgc/WpUcrf2jwGKg8tFhspq6RBbL
         0Rj/r6GVvo9XKi7pliHHdIpmPPAv/rynHJKR+oF+Ogndaib0PZVLylceYsHp6UMsZDFr
         Y/Ug==
X-Forwarded-Encrypted: i=1; AFNElJ/zinUnXmBlP8sPwifc219lE8ekliWftKC4ZkU2+AoNS4YCQ1jBI2vrp5gof0S3bg2AXhol61HPsjkQWh4ODgJV@vger.kernel.org
X-Gm-Message-State: AOJu0YzA/Ch4nIHvBwYkSLDOCBknK/C1OgjI0GWMjVr5J2463pTrWNqh
	6dfzQAITBG603TB6J6z5/WR81DzSLEH9/xIALB5Q3P8GzTowbD8n+XOB2Ab3HDy4q8GpBtwiffe
	kXpkqNXYXbC65uRlez3XTo6kB53U74whA/UHDASzCibqW7v969Dt12kDQP07Cl+xPqOcdn3Vt
X-Gm-Gg: AfdE7cnX9AKIu4iqFmYiQxerhIkHVIs/CF6S4gIJAeYgOV/0QP9xfbmfSR7TXPEHfqf
	bfrJpSw60ritOMY+9Tpf84lhoayKExE8OQv59uCoAJmsH8QY7RlcxiwGiriWEJa9/NWSPIKI//n
	/dVAJjr2yX3TCi1TCZ4eHN8ErDi2Q2KHEXnHnlW6ku6oYR/5T+L3oEMuM7djs6MJGAiuILhum+7
	mejPcmYdFvRrY0jgAaWGcx2sD9RWs/he4qXuvSm6kWQW5zzCW9WeU5KfoYuRYSeJkYHIR9SRFzK
	wXFrwTeTGex1JLwqFm68k4nrzqx2UCt5Ka2+kiHF2qO4NeKcGacu9s9mDkA0v5/P8QTkTODlcoa
	eU7MJL5zgXkSq/Mrf2vr6HV3me64rzvxt/wU=
X-Received: by 2002:a05:622a:1aa0:b0:51a:d45e:638d with SMTP id d75a77b69052e-51ad45e6f69mr78096691cf.8.1782737257591;
        Mon, 29 Jun 2026 05:47:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa0:b0:51a:d45e:638d with SMTP id d75a77b69052e-51ad45e6f69mr78096241cf.8.1782737256970;
        Mon, 29 Jun 2026 05:47:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999afcb314sm71531191fa.15.2026.06.29.05.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 05:47:35 -0700 (PDT)
Message-ID: <43293037-99bd-457a-b190-31fb24625b1c@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 14:47:33 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: glink: Split protocol start out of native_probe
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com
References: <20260618-rpmsg-glink-split-protocol-start-v1-1-c4f93986cdb4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260618-rpmsg-glink-split-protocol-start-v1-1-c4f93986cdb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwNSBTYWx0ZWRfX8Kqm0pnLGPzh
 LbtRAhmYHtE/2GZhhVC2RJKg/UL7MoE5lBuRnfU1nMXdBEgesddpPjyYLzLB/vMt8jzir6sHIuH
 sNwPwoN4luNuQOViQoHibNEgdHdmSkUDzsg9dlFkUClwAruXTQkosGA6eThZx/Y76ofuwFxkT/W
 JHr4DnuzqeHvmnq5CKpoajuGtGuKN8LFBm5t3S78p4pdaFf7BTOX0ro3C+TStwHUvG+3mUocrEy
 0c6vvnXqFHthZ8+Ip+Hi5U/HiUacipPUnPYiZ1bv5eYYAX3AdmV+8bmqqFUxBRVV3WmLe77Vps+
 enTlO6cBy3p5hVrgkmgviLncIbc/B73S+nRhEFWQ2uaIXSuG7GUTZWwg9EimSp3zC7aQsDvGWuu
 +t6suncLhKH6NVnBU3UqH7HPaszhc/UMESVq5f+xZj1Wt2/euM5Bodkf51yhAbzDnFoTQ9lLNny
 TK73yw//Rk0FQ9fjNXA==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a42696a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=AXr40cIQNxmEwLS31UYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwNSBTYWx0ZWRfX+iq4AsFCZBNF
 SWGllC3LPAQGMjYqvS1poWygz9DMeZ78afTxXZT3R4pHvsDgFDUd6C+IvPafmuZS1Hb7PfOr/3u
 EUZaUh/zq26KmR7Qx0lXetoGF2TEiMs=
X-Proofpoint-ORIG-GUID: uNfkP1aYtEwsZ7uvMIoEj-yT7DxZ2EXP
X-Proofpoint-GUID: uNfkP1aYtEwsZ7uvMIoEj-yT7DxZ2EXP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290105

On 6/19/26 7:01 AM, Chunkai Deng wrote:
> The SMEM and RPM transports request their receive interrupt with
> IRQF_NO_AUTOEN and enable it only after qcom_glink_native_probe()
> returns. Since native_probe() sends the initial version command, the
> remote may ACK before the local IRQ is enabled, stalling the version
> handshake on a fast remote.
> 
> Split the protocol start (qcom_glink_send_version() and
> qcom_glink_create_chrdev()) into a new qcom_glink_native_start().
> Transports now enable their IRQ first, then call native_start(), so the
> version ACK is guaranteed to be serviced.
> 
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> ---

Would it not be simpler to just move the devm_request_irq a bit down
and remove the NO_AUTOEN flag then?

Konrad
