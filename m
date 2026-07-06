Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061FC32D0CC
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 16:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353641; cv=none; b=qaqj+1PVGis82xpYR5MEibzyt+jxMLM2BZ018TQFs/kdazGjxRXNBN0FP0/nP5YMg1exCvY4cxkSmguedNtzDdylCI0HP8IHr8i2YeNNg1gcDeZfV6rjdG9hIsGdAvUybsc7MWOHBpVsf2YyKpmUkOOn6U+mCjIuvJyRlUUXbnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353641; c=relaxed/simple;
	bh=GkZB2kFkducGYXvPaZYByw2eUSJdtvjP2KUbiBQT+Hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CTjDoo8Od2qAoaJnCyZxXGQyOX8UmPUPxeH3e0L6aQaqx0dt4/yFeVw66IDQyE1mm1WoAbe+O936r9NMpGu9LbLLc/9C17PWJ78eEW6AT91b3jKUoRbmdaoj+mt66ufPG17Zgb3hMKtZGhCENj9NXgbqV/a2+QzIjuVn9b10Jpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZK0kGXxM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDOl8fYS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZK0kGXxM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDOl8fYS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFBna947469
	for <linux-remoteproc@vger.kernel.org>; Mon, 6 Jul 2026 16:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GycIZkc5tJBR40OgyU0h+N+3BJXNBJqmCnBI58QvZyA=; b=ZK0kGXxMXKyHEEKQ
	eY65aAB76x/z6AzUPFjhbuA7L1aI0oGaB/VpW/mO27XwWO8o3Wxy0kPUMubC+Sc4
	aQ8cHyEPIPnFlAo899tKNGdMpEET3KaXdgNTxxHb2ophTgtKgR6U6Zkaq7CmMwh1
	x2ki5gvsYgRL0Gom9MVtVZKCAegqQb0Ft8sogGc4Exir3SB+w/zEzlco/dsvZUrZ
	uG1Dn2nLAFW0xBg7gqjur0Q4ycgiawqSj6rR2ndgOAiBUkNhqWdLlxc28daa+728
	y7nzSxgu3GIJSPydaoKdW/N5z2ppV9u89zabqJkDV9UMktn3uxGP9XVbKSNEKuwb
	tJszQQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h523gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 16:00:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1e777a15so6073651cf.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783353638; x=1783958438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GycIZkc5tJBR40OgyU0h+N+3BJXNBJqmCnBI58QvZyA=;
        b=iDOl8fYSURCkKwoHJUglllUHEFdpO5lRC9yh/Cq0OQT25ghXW7PIGYY7ApcPYRQx+o
         59+FJCfrNxIwqSj23h4zuNcF8c21qQ1tiMhmBzNQUuFZh1tczC+L+EvDNOW2ZwB+lPnD
         JgHzqsFlGDHWtTUxVS4EDH7gWaAICpsb4kwakLGwATXBXEomAjebnCrykG+BA1kpsUD6
         XhiobUVcTzr+7D6G4iQXlhSUwzcqqW/+ZSt5eaxxFZRyjxJL8ZE0kPwnequBcHaBzJqH
         YQ5ZWq6m3BnE26g7Rap4k1uGXPgC6FPzBtbc8UXTKxCIoW9SXu/EYYdy8+Z9tvkGGs7n
         CdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353638; x=1783958438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GycIZkc5tJBR40OgyU0h+N+3BJXNBJqmCnBI58QvZyA=;
        b=N26bPRVVK0/xIAqNbqyyXavH8C2XH6wy9QunOZmY6xe6DbucQtp+AmcICRBqxBMQ4E
         TPQFbFS+pD6ERs2bBNmMwrmuIL8TQwLqo0QYz8NvDWhWepltNt3IY2XhuU21YQFMGT2f
         vJ5RGt80mC6WRCPhRhIJIMZ269tszQuG/r3Dyj3P3QKPoZZLqO/HBfyek/2602mS5kfZ
         rSr3RlYRL52uoUirrliN+dLZ4zBwPk0JmNZ3LCbM4gtEpU4xox1rnerkXVlEfyV9k+29
         74pL+aeMqS3t+BV3tkDsWoxrXh7vHqttHmGUqUbJD9nixzeA3xYxXDs0asEHPXdcDyBu
         VcQA==
X-Forwarded-Encrypted: i=1; AHgh+RopGrubOB4sr29AokKASi5yrBP/zDVrpPez0rcJrBfqnQB/of6oaN/Br2YBlGjch3k2LEydCqb358DGZLEXBDmr@vger.kernel.org
X-Gm-Message-State: AOJu0YwVTdOfZckqxK3EAugRoLSf2UXieSG3uTzeXYgmF1c222hmQEST
	tx54ze56cfyeTs37I+nlz480/u7gC5QXCwnkxghSMHUwm70a9ZxVmh8tzZgdvb5omvJFEXHzVts
	Q8F39KBKJ8xa8REeJCerSsxEMrfvLnlEUaF5vl8BkgZhDQpdarc+zdUPmeDPCICpXJL0hglUv
X-Gm-Gg: AfdE7clv92SxJbM5eAz/Gz5Dx91ayq2u/IpfPq3c56XMRbeYhMbCR6Qnu30/3Ye/7x0
	a1ozpahM9U19TUN2A/hlZ3RE4NwjaHqDxMJbEoCVx9Q0SzEWBpBpKBI24JcTjDPqfak5jTW0G9v
	Qy1w8VFk1e10208LQUd5fd1M2ZJS3k9SNZyrdwRRZTlzA1D3yhaGlZOP6lMO4L5F/6Ri6wMGUXr
	Hda6Zoz9OuLHMAQKYLe337OyYIyJFauU9gmhhnB/iLW8yyOBh34+sCPrzhZUC5358QcVVQDVB+z
	975X2yGd8cWF509GAf8fDO6S7vw4ctu5Acr7IJXMbcHw3NU5aMwuYChGAeVnKfdyb8UUCF52wdB
	kIpUUDceKImy5ByvkagJ/+grgUJ2FQ/BBZL4=
X-Received: by 2002:a05:622a:282:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51c4bd95127mr94396021cf.2.1783353637937;
        Mon, 06 Jul 2026 09:00:37 -0700 (PDT)
X-Received: by 2002:a05:622a:282:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51c4bd95127mr94395171cf.2.1783353637311;
        Mon, 06 Jul 2026 09:00:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f5babsm767201566b.60.2026.07.06.09.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 09:00:36 -0700 (PDT)
Message-ID: <901f6be3-9c13-4168-8233-1187f2f2767b@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 18:00:34 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_mss: Make ssctl_id configurable
 per platform
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
 <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-1-f59e728af621@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-1-f59e728af621@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aoyVYPaocXToxak-NBv0EkG0lS4Xe7dz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MiBTYWx0ZWRfX1o6YigBmp5N6
 9Y8spWy4B4WBxNv81Q6VjkS+CyRsF9rjRT6XLjrCWMh7Fp09UFI5lPgzFsZQ7piZX5pw/BE69DX
 1QgzrKfjZw8hM95TYc1DdWaJ2dNThn4=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4bd126 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bjVS6o9MGAhJDIbh6jUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MiBTYWx0ZWRfX+0TmX6PurALq
 mq0+fYZdqpnbxp7+oJoGlbCaAPdEl7WaZlGdejv2dylss7axUyltCirqLshKbCvRiVxM8Zm/EsJ
 Aza8yBLY5Ttm8TG0ia4jphGB3KAPFTFcblZQbsJf0fLjilwL8hJG2l/8c+CacfEuIUktpSYizBZ
 yQ27uINOYey3KhRf28fPERbQB1K/FxbxGzmfKscc4B7j7ZdDUKaOxWYTF27aeJZN3U7+G38th0J
 I9mgv9uiH2gEMfqRhX2EDi+Yr8L2FoFZzmKQe2npG6y0bl/eX8Z9jiqpB2R8DfU5iVmjQKB5uQO
 cJ73ESdp/k4yCovQQtD3bs1B0M2ttdfOVOh1jyZ3Iir19nKPYThRr+lKkzuSNKznNiwndv15Ri1
 h9j98NRqdZlrCuPnMDHZxZYwSCFanBzMwu+r58w124JHaQToNUFBbClk36SB2Ltqnc856oWL8KW
 RAqk/1bKAz65XOkSnqA==
X-Proofpoint-ORIG-GUID: aoyVYPaocXToxak-NBv0EkG0lS4Xe7dz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060162

On 7/6/26 5:37 PM, Stephan Gerhold wrote:
> Currently, qcom_q6v5_mss hardcodes 0x12 as the instance ID for the
> subsystem control (ssctl) QMI service. However, some platforms (e.g.
> MDM9607) provide the service with a different instance ID (0x22).
> 
> Make it possible to override the ssctl_id per platform by adding it to the
> platform-specific rproc_hexagon_res struct. The same pattern also exists
> already inside qcom_q6v5_pas.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
