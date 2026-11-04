Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779428;
	b=U0WIAbln1yH2hoUyHulQMxlkPpkPbuVPeu+WFj4ajwq/pd3b2+cfgP1cXTmsnkp9Xt72
	 WB3RQuB6rYMoZ8jNTiibOhZjPdBT8XnSlK1peJnqlZ76zX06LJYtDnuBbag+swgHLGh20
	 0gU81Q4oieg/AdJ57R1GAm9Y8Rxfzn1Yl6EZpDlNdJO/PUh1VfTa5PoCXAJiszHxNk5dk
	 7njiJHrhwi2Su5ZuKmPJo54N/gcZ3PRP3cpAwixEOM9wXO2aGwQovJYmiePdyoB695+fH
	 A43PFB6uNgllGc2GbtwobG8+0anOZZiTf6A8L1OtfFRtTOSudIPUKfkWrsaTvHiQNvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779428;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ub3W8bOSut/jTHhCRWfRg/xfkegEtxU0Vyo56Bxv8PU=;
	b=B8fZkZQKF6m66EN+Z33fVTnIY8As5AXYJcFLL0l2FRU0iGVJVl8czqjz6hlEC3Rtzzhi
	 nAjGox9Dw3KJw4A/eELM4hiQqlRiGHNhMaWVvpsA2QZowAintvDfpKtHHuIVIvC0pkkqZ
	 Acvl8GBU0cHGUJAkLzjAI5a8k+z9ZqU5I1YZfQThifj8gGRgaUbxJKwrQFr1OISO+kQL8
	 eBO9iE6si8Alxh7+MbKNBaroXQ9MxG3sOKbjt0bsLqwd8oubwBQ/26zYNB6+8c/sp1hk0
	 mbhih1ksw+BnVcfCVXFjU4JytNb9Qc88e1IJoLWHphKFdVILWR4DXgJFXVlevHUk3Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NgIQJR2k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPrMQ0GJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDCB606A32C
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Nov 2026 08:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EDCB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NgIQJR2k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPrMQ0GJ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A475man1191181
	for <linux-remoteproc@vger.kernel.org>; Wed, 4 Nov 2026 08:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ub3W8bOSut/jTHhCRWfRg/xfkegEtxU0Vyo56Bxv8PU=; b=NgIQJR2kMDg6KvMh
	1FVNp5L0EWvVnU5Bq8CVSln3ewpyUsV7Pj/bEHayRAUXLEjpYCDnujxPz1a4fX9U
	X+93cPcL7xDRyiEMLs54jHIv4eMLvw71YfDGWTELeV84byvpUhV4jpe7aDH2RSR1
	KE4oVh/hycHS5OiS1VcKXMCNJwHWQmtnTVXl/w+nNsB4e1pv9iw7AujOawB46pwx
	C9qApE20iw9BDj/GMQM1pfY4Tm+q/8sFJ0Z0Q4yGBuDRO5eUJQznPaae6s6ZS0bl
	z7tTwtEgQwuAN4sogmRxFNw7JF7MQ/RCq5j0K28CmSTcybK5uoNLCUZ2Yvy5j96q
	TJhk1w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pk1c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2026 08:03:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb1091fffso8282385a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2026 00:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779426; x=1794384226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ub3W8bOSut/jTHhCRWfRg/xfkegEtxU0Vyo56Bxv8PU=;
        b=FPrMQ0GJuyaSguLfQ1ZBvEJG+Q43p/9mECrmpdDd1D+HdvVyWZ9ksugmiVgQbXrMxJ
         JrjXcRp8yycicvRuWXpdUfvJ+t4fRVBXlPAdi5GQEdjMSALumxAKS+kdCjNSSSxeywWe
         myri/xG9B+32pA/fvKCIv2bOLbXvuCynWhbEfYQnw2/6PysvbvwdxcjHOuDFPnwDQHQw
         dXcJ0Lvm0QSNiov78I4/GG5lvqN8eLpkjfy+kSR0CQtHmVytQXUpbqseuxjLy+uTLXp8
         irjgsmDVnNtlIgohwK78M+cqisuvSxonP1WkYuTndR1mhJeiDX8KQlALTWFsRPW9FrLx
         Jfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779426; x=1794384226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ub3W8bOSut/jTHhCRWfRg/xfkegEtxU0Vyo56Bxv8PU=;
        b=VFpm2lhccvt2ntL+SgVBsgO2TN+g/LrclEvfmj9BLbV6N3BwQmB6VBKCzPvJvDTD28
         N9t/0pDzVwEh2KGtkPSuy6WAkeBmbrxLIkyMbr6XkWSRDKwq5hQCvundzRi+Tm0VnZEq
         2y/41rCA3dW5XIjc2et3dTJKbMYgT1bh7Rqd/8DdhBPUwwZBwWKtmRVcnF2VMxZ06jQm
         VF1/7gJ5RtmXmY2CE+nf8LTP/nu/lsQBB6oY/hidNlz9SIeq6hL0Q9E2WKBVHb8Rl+KC
         MJHTQHvVKySDrt4T9ploj2S9CUqQMbnK3bII2R3xJaCMnYUVbu0je6kzd7lvQcm/Xkz5
         qZNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjnT4BI0ZRFPCKOIbKYf+yTQiCtboVQ4Ngt7g2GhSq/T6crVy7rcw+NvdJl4wrzNsjwRpY2c4bqeGUPC38Sz5A@vger.kernel.org
X-Gm-Message-State: APuU4Z+SeDSWnrXi2JRzYTjydc2KyRErmtA70FU/ea176Ea1FTLwu8ua
	PMPTVOA6R21l+9DbLoc8f9F2ho8ltahZHxgJS6QJfiC3DwabGBWcNLkaCJRtAdYVg2iEbebMVv3
	18Uf77Hw+pX3/w3S/PNPqFOZDE5K3yQxuKANxLT07JUjNXCoeFQPFYSBI21K9nEFXxM5OVgcY
X-Gm-Gg: AYBFou0iG2/S+vS6LF17Iswhhnu/XYau2HDYVtStufXNVVsXBOcsbmb8f/Y6VgvxJ5N
	curSRyWu4eRKyQ1M0FEzXvxNrPgDYrw88iIUkZFc7vnr2X1Jc25rjeQjXchFw/kMSPZJ2kn6k4N
	ZWsOBz0Y7+XYF6KP5+8kicUIKBi0r580XxksUHnCliRzubyqwrfkzOTYHJiWF+zhTMMqo6kTA2U
	oeHMCKnjYT9XLsN7W1n23eYnlInk4QWjv4R4bUJFRkk7LJeRpUbR6/9Fs2IcPF0PLm2KcxOl6g+
	2wFNjwrZ4z1Eshjh6r88Zml0aJh4x7I7O6QVv34Jv8xJfal2f1kiAswQru36RGkG9+s+QthUlzi
	IrJSKrXEA8/UIA3tLLl7Or4mQ3uXiYJs6CFIlZb5a0Yx8jRESwmXbaNE+x5rPdOmrbm3G
X-Received: by 2002:a05:620a:346:b0:939:9ef4:79eb with SMTP id af79cd13be357-94421872589mr2773130585a.6.1793779426293;
        Wed, 04 Nov 2026 00:03:46 -0800 (PST)
X-Received: by 2002:a05:620a:346:b0:939:9ef4:79eb with SMTP id af79cd13be357-94421872589mr2773125885a.6.1793779425768;
        Wed, 04 Nov 2026 00:03:45 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55abd3da7sm520250a12.1.2026.11.04.00.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:03:44 -0800 (PST)
Message-ID: <1f57f491-56a5-42ad-91c0-9c55e1c6ef4b@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:03:42 +0100
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
Subject: Re: [PATCH v2 2/2] remoteproc: qcom: pas: Add SC8180X SLPI compatible
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20261104080200.135431-1-val@packett.cool>
 <20261104080200.135431-2-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104080200.135431-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMSBTYWx0ZWRfX1+TMsHXULfxU
 uaC8GwsxMcij6YjXKKVsP8Rz3q2T+2IcXQqddcLnOFMb02yVSXTA3gBGMwxzHU+khp21CeX6dVV
 v/Jl/PukQ2f4vI3OqNZrwUOgt/iDj1iF5eOk15LaGDrPxUYiPP1kqN48tqS/uALhTwDzNDoEDts
 czRK4xH3s3gyWlFJL6v5cyhxPz7yBmRq1YbiDdJLVES9pLdmLgsipX0YoLF8Q78Nr1jZxGnY4/b
 eeBXv1CpmtQpseMxp1ueK0RpvJnj0xCAAHTwH9NyDNgy1hiZYsw8TQOkikYDyZCbbJERcGVQgFT
 IqIOZPaykT9tj1A5eFa2HGSlkdoFYyt/5mjS2e5TBqFlC1MFjw1t2J3UhajqV0WgBhA/PL5xaIc
 uGQZS25ZfqkDLCCHCU5GYOPVDNpVMVzcIuAlmc1eCBpfnpx4fydLo6lCKbOn+bfI6RC7hjpaO81
 qT4dVpfnWPBmzKRBWjg==
X-Proofpoint-GUID: C2Msc4hXg6U9aMcKObDLh8qYcJ-a1Cya
X-Proofpoint-ORIG-GUID: C2Msc4hXg6U9aMcKObDLh8qYcJ-a1Cya
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMSBTYWx0ZWRfXzQX0YvXoP7xQ
 nLOKQffQgc1tLXUyhhwQqxZFIkKnwrJ+qN9LrJ4aNQ/ovCqCh9OIuaZY3neFHDeKv33YQXOzNM7
 10bBEWKM74wlkl8GDISa8EttHe3n8Mw=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeae6e3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Uz0uFBkuobC0VEtxzbMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040031

On 11/4/26 9:01 AM, Val Packett wrote:
> The SLPI on the SC8180X is identical to the one on SM8150, reuse the
> same data SM8150 (and SDM845) uses.

fallback to 8150?

Konrad
