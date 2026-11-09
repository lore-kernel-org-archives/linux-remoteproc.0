Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233916;
	b=wD65Mj8JSP2l+rLdwNNI3pECKfHd9Y4jDt+PEiZq4gkLQ/P/M4VbgMn8FojkwqO6WqV6
	 TGCMDvC1iMnPo/i/PQgxXqP8Pbs7RkA2/d2zgISeeIrLyWHeH4H2ZLkRasiIzthaPaBEj
	 w2mogHMHfu9KOTYYcgnNvjsypnJNmr5EJWj/HXeFyPCICil9eNSCZe/hLO4xFiW0b+pJB
	 2Z+g4DuYG4ycPQxWl8SimSVsakbrZMfvzuZkG8JZesW+ApAE839srJt9dDr9cxHOAEKZ4
	 yZeNsNNeDmR+lKZLJOCV/csB4Au/CQMRHloI7w7vcixNigKCxYTNcsTMeXb0MNMgcDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Lc3VM76iyCTHCMkYFjd2sM/8FGwGu/9SvJAqXBEZyUc=;
	b=U0LXK8v10xHhmu1zkxZOD4bODb6FcblzIS/L6auJnt/LlKq8ad97H02zpPKSS2lyKkdD
	 25WeVryfdjbU3EAvifbgxwzPo2oQps0H0WsDsX7Tg5E+/XeI8wXX8ik28en5CMzVmopc+
	 mZkqf0vY/3CJG9La9+IphsO4amoQlgDoYt9QmxedVUVoKYfFduiQihSsXQ+GPTUkpXtPB
	 ajA5YUir8FeNzJhAsttmQYJSfre24vGyl2VsChkHc6Q5zyTngkVENEvRMk2N2kRd5Ansi
	 pWOMzNoZQMdxZIhcODQkJVFVweVXD8PKi/m3TNLDICOCX9EO/yeY+owGsFwsEhUlrxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1VAxCzk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DVq6hVWa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E90606A31C
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Nov 2026 14:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0E90606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1VAxCzk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DVq6hVWa
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFBwf022881
	for <linux-remoteproc@vger.kernel.org>; Mon, 9 Nov 2026 14:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lc3VM76iyCTHCMkYFjd2sM/8FGwGu/9SvJAqXBEZyUc=; b=P1VAxCzkWtn9zBeW
	Hsym7T8qt+1IqmD/MD3EU9b5HLMs7+bDuSxKLw6Sjg1irvMCMcDRlZeFEPfaGqPM
	9U92P2R35y58+cbdCp2cGva8+qkOKPs3xSFoku9mRUJxiiMXWaJCkncsfEfzOueL
	0KxiphlprjBSrW4pPh0sMt4QXRgBpHnDfqCBgnpPdfLEBwyVgDxeNZ9WagV9zQYi
	8p80wHU4My15p1ElL8P9F5Kwi6TO2YRMEpr01V/PM5iaNi0Fqi0Q2Dyh9ZFHUIjK
	V6XToE1m6pVtbSXrfTmidieJOI0lFwaTrc9Aca73Iz21C/5GUOUFQ2AOJJ++JOS3
	GFXRFA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydgp6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 09 Nov 2026 14:18:34 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-77f133855b9so22997137.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Nov 2026 06:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794233914; x=1794838714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lc3VM76iyCTHCMkYFjd2sM/8FGwGu/9SvJAqXBEZyUc=;
        b=DVq6hVWaPAFFDPYCX57zwoR9Qq7T8MqrXtwv7/pNytCXwv280LKTyPHN5926jVa1qd
         6grVZgdCMNwIqWM0Q6drVh76gJH0UI/jQfgnHyN61NDJOS2+2Qri/3CNnAdI/h1TRJRo
         184sKhE00Jt8a7ADCnK9vcCF3vkVAJXP8e+ovMVVVbOVJemqbHt+DtFDBwuNbDZ/AvpY
         akpO4uewbFBSDhVssbLOe1NfgABtWh7noG4mCTKA+ni8pxPdkCxVzjH+61t7M5jzUjY/
         SAdOUAVlUY2UUh+w6hcAg/jJFCC01+jtem3B4hKGGaViz+yeVW3vm3/rxGnopGJc2DWS
         UhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233914; x=1794838714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lc3VM76iyCTHCMkYFjd2sM/8FGwGu/9SvJAqXBEZyUc=;
        b=Jbzlp+GaJ60i/7TJvNqfvsK61tL2JMUM04RK2zXgVlPiF3/L8gJr+AQIyU1AuKA6a5
         lzRWebasKs1Wl4m97Ll5menjvkqD0az8fNi6G6PzQ6KIwA6un8i6Z8EeT6rsw88FR5ap
         wuLlAyjPIWwZMjF7lNWGKVSg+LoaYPrisZ+I+XZBbGqpmQ8g2ZUjPqL0G1b25XpM5isx
         5xjJIbntCnyIbYb6RBnn+PPV5iI5rm5C2pXDu8OMNpRgEj1RwTj88JKtg2hSf0eHol6e
         Wx9RuwwcTq9h/DYeY4aimbLmZegXywmK60O1OGBaowD0OGUz51keN930xk3YxcoZyNzZ
         SzgA==
X-Forwarded-Encrypted: i=1; AL+hErG8u7MMPycxD183BTq5WQSKqhopWblyH0aRW1sggAtKvh63CCvWypkpWGuPSXovzR6w1qim+c2FmDNGcUve/CZ4@vger.kernel.org
X-Gm-Message-State: APuU4Z9zn4YPm6Wgnx4yYkUELlQSerWEbaGYLC3hX7/Al5jCBqe8gztp
	Pvhdjiz4JcQPNz2Y26mbjmw571MMs/CM+GXv/bevMfKyIj7ZqBCaVEHzK4Y/SMZ2UxnM9n4jjwk
	ftK9sl6BGi67UcO4pQL3hkz1sUjxuQHKiTssVcfmFh8j03JpmrGVoZgB9z8FeDn11Mw/lRL+CsL
	Ct9/mb
X-Gm-Gg: AYBFou08ytRxfpGnRG4GQ0Fc4U1dH8GN6mqPSq9Ycquoq/lI7fD3qU0HbLDQl8sw8QR
	USUfB+8WJONo3BERb9s+Fr6ckcpvO/FvvJ54cLayJn9HHs1umpuxQF95KUPexGRjn7sGKUMjuMF
	FtcxJ7+g5yCijlDeKbDWz5EutHYDjwYZsnrx+xjjQqVISzpjCXBJU6PbTkF2J8necbpOnPbCVES
	hU22+vECCguDp5084GWS3AACLwChEbXgv9CQPgjbn6LmqcrrFBxxFdcpCiQo67xls9VHuoVXVeq
	YcAUkHusQ7zNE5DIsweJcQXGlUwcjN+SpC4n+qGcqXp/pe0vIDMld0lvpUygzr06PZKZtiBV2Us
	A1ziuWoTzQOyAGHTbBRn/GWQPJOZS7+FoaqheCmxQ/EPzBRQDSHK98okerZI9PHHRx6XurA==
X-Received: by 2002:a05:6102:2922:b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7d2da6441f7mr1258793137.0.1794233914219;
        Mon, 09 Nov 2026 06:18:34 -0800 (PST)
X-Received: by 2002:a05:6102:2922:b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7d2da6441f7mr1258761137.0.1794233913751;
        Mon, 09 Nov 2026 06:18:33 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ed95desm1708817a12.26.2026.11.09.06.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:18:33 -0800 (PST)
Message-ID: <6294c55f-97c6-4f6a-9d2b-3375473ed203@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:18:30 +0100
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
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Release OF node references in
 init_mem
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106-b4-q6v5_mss_of_refs-v1-1-58402c8fafec@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-b4-q6v5_mss_of_refs-v1-1-58402c8fafec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfXwDc1DZF9Zlue
 u1tLFa1wmIO1ccEXkhUdczqKo2oJEXIYiyDKObeHwFT53Dg+BNElYrOsCFAI2xUfn4eIaQFjJSU
 UFP/OLSy5FQrH9ay/TrpUy1zv8ic3d8=
X-Proofpoint-GUID: T7SL3r5Jveh1UjfJUmJHM6JBO15PdTjX
X-Proofpoint-ORIG-GUID: T7SL3r5Jveh1UjfJUmJHM6JBO15PdTjX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX/LuhFw2remcK
 LHidNum10Eo8amhosGtKEjs7bwotu11OZN/GJigYt5qOZCRKOuynkSPr8GesTKZDnYj/lG/7LUT
 Ui0y33T04q/3fjAtwadWRru4nbfVVqhRhfpJaDbPFF/1Jv2OLrigtwuaqNDHN6kgRSZZIn5LE1d
 jzetu43NiNRvQ9vvjoKf+eqXIvmZSUqJvV2ECn5vL0tM6JnQmZAuWRCnncCZ854tkiZ3DbDJeS4
 8y8oGl5pH+FC8sJoqxS3fzfzRGlrFNoGrD9fRxw3ewYmpJl4ysL9Y6vIN6TV3Y5Ydh1RZ8peHAn
 fKGXG5cODrhgGBmxdlo8v//hfwe7nzdnzyAhf7UvEj9Xgz7xG+BFrNE8Ux+65I86oHmgcqSk29P
 kpgbsJ4yreU7vfX3KrHrXGP4T+/69znZDkQHhsQGkbYTZ78aJjPGk+88e6TOiUDSkRYzSr8cTYH
 XZJlJDRcm2q8+MIf/Gg==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1d63a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=nB5WFW7fbi4sKZXQVyoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090056

On 11/6/26 6:45 PM, Anup Vishwakarma wrote:
> q6v5_init_mem() parses the qcom,qaccept-regs and qcom,ext-regs
> (index 1) properties with of_parse_phandle_with_fixed_args(), which
> takes a reference on the returned device-tree node. The two blocks
> copy the integer arguments and never release the node, unlike the
> other parse blocks in the function, which call of_node_put() once the
> node is no longer needed.
> 
> Release the node once the arguments have been copied. The leak
> affects SC7280 boards whose device tree sets these properties.
> 
> Fixes: c842379d00f1 ("remoteproc: mss: q6v5-mss: Add modem support on SC7280")
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
