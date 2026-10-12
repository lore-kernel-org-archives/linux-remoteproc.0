Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808594756D2
	for <linux-remoteproc@vger.kernel.org>; Mon, 12 Oct 2026 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798621; cv=none; b=nfHFeJRjLu+fIQ+iygUG9Esbw/nUvSUHg59cdPT3U3x1FmuCbCaNo3CLpdf5aCXDKv5V2ZIbTh9G9SltuD4daG3B2Dl61z5L8/h1U45mRPfLUk9S07xb75ryVpYbB9zSPd6uAFKXNEw5w7PC/gxnmR5AxUwVYqlViXYMlaxlcBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798621; c=relaxed/simple;
	bh=bkUoku9vvOCC45/xH4+TO5c/C0lBGGKl0K+LjBajYl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKDjtI6pBEvQiH3WkK+5NN9mPCuQzItrGOOcEmZYh/OPmvq+7PKulDXR+u+6r+5JPXVPMC4sxYISKwUbQ4OXKzgOtELzEeil4iltT0DTKavIWPHbSuP2hlOBi4Gi1WeGkQi8RaStRnIKCjz6jTdiLAbnsjdHAQC0pbE+Pdz9e1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ct8zVjhQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTt+9bnn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ct8zVjhQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cTt+9bnn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8Kc5X1592793
	for <linux-remoteproc@vger.kernel.org>; Mon, 12 Oct 2026 09:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mmYseoi7yS4p0vjT+tNRp8PescPJoKYu+LKWr8PD8bM=; b=ct8zVjhQxysGhVih
	XneGqg/XFRjbzCqBQQFkh5XFWTiZYRtSXVuOQbrBw1TlcOg2JOV4sRMK67etHbIr
	pQE8YphIJmvBSIE9dkdmMZrMosK6ErNtRoZjOxF3xvbN9EGN7MPnLTQSrznqQzed
	tWctd1AR0vT+wqw2evnJyPf+r8YnzToZhTURIIiTY24IVf0pQg7iMEHlD2ojmqjb
	PGqwpGrt9U3nvSyC815dB4YDkonbX7kum1qrrBZ3qAcmOCaL15L73MtVT9/NTvpd
	Zzd1MJpw95yo0qGmMKqNilfqflBKWwO1aBaO0RSGBrNBpLOQvP0KIGW+0mpdoSJ9
	9fFkRA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu13sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 12 Oct 2026 09:50:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4a0017549so2657619a91.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Oct 2026 02:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791798616; x=1792403416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmYseoi7yS4p0vjT+tNRp8PescPJoKYu+LKWr8PD8bM=;
        b=cTt+9bnneodA8YzTBbwWThEz0qk3PMa963D8SusqaQSUbV9mageUyJb6b5HYNqtKeB
         +9SheizQ2sTBsK9jwiqpWXXX5FuLmTPI0VKVmWTpq/R9j86ury6kmIiLnZii9v9nJvwR
         +c8gwkz2lpQigBl/8a/VPnQq3iKY+g1Y16zwi7IbBqp7YRPmho5LdzmiwI3+ek8NI05v
         W11jhpFSTRQcmoIDk63vL89CRRKGcEzT4pOfL6FfQQdylEfYKJEXKkGL64vbfN/cjPAc
         a1iEOfJf9NHrcLqGE/HIee+MA2dINDUpLyf0nh/EJSYn43csGCLvNkwZTNfW0vK6zK+3
         KKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798616; x=1792403416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmYseoi7yS4p0vjT+tNRp8PescPJoKYu+LKWr8PD8bM=;
        b=WkGOsVpxJ6ZXsaDmtK8bX/SoJYWdcHKBhs+080zQqjlWXFFQxdquK66SjgXcmHq1mU
         FrTWwvtiOnOskT8olO+nSyw+L4jtbFnPkTkKlEsP8lwTbTmrVj756c7glnF4fz/Cvo//
         Ak8ofhrXKSL/LHIcNoGYE1I0rKSvs2B24+0dUEnwkFZH+MtJYyGxcagBN3SQ6++2kHHL
         Z73lt5YEDws2VpibeBcKbHbQRiQM95sGUj0szz3FK6R3LD6/WYl/oXZwPnuK1KtJZetR
         8m54viDVvEZKMhn2CdoSwMXxGLAlvaYqKXfQg5P9FpIDd2kE48FdaAHP15x8MKXw4fBO
         qKrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJ0MnwIXE08I9eue1HiC8DA3uTFt8s6O4B6uZ8vas9w4L8RLXAjR86rdlAPAiyj1UVAIzR+my5Pg5LMfBWAsI5@vger.kernel.org
X-Gm-Message-State: AFq9FYKWwzn+NErWZ30RkcKt62z3MG6UIGTLqEyreV/IaC1MAFMeyS+q
	UBH7CJ8ul7uPxyxJyb6DEuYFIaV6tyBsdgYZrWjKsb0iwMp9QdSVZzCe6g7jFMNHB1xKhmzxaoS
	sGw1DIYD5kw7OHicu2/haLmSmWUcy/TJBksgTeP14kACgFqSUWRXNEdE3jVf/9kMIiFZW6toh
X-Gm-Gg: AYBFou20HEpzKe7gzqrHYrbPSvpwDGkx4f7Lrmp98Agi9gcHeW2FguKw9pT8b/mymh4
	TYVlStWqHtH9LBXcv+frG+0k+PFk0X799xM+Gktp/Qvg5iJBJ/cybzV/6QPLJR+OdZCu+JL2ULs
	usMaYAnX2HsJGNuwWzBpxGSF+o8KaFRA2r3Jvb6nE7njuscorsNwbUoOxZOjvGlwBi+7xisQCYc
	eCigz/4orsLPeIiwh/KseVtGsLSCDarF2ahgH70PgPoSi6omsofJC9UV82IIQrX8ms31hlI+k58
	RPsxHfmScVwNzrDv2iPaq5v3wyZ4s+tdwiSXV4bML+t1eyer7zAlRuPnkovkEgDIZwG5NhXP17H
	SC4s5HjmZ7O/+6bf2JOw6g0I1XaUmsWWteuRFH1sWcXA8BY3bTciwyqByIQoAfOJy+FmEio83sj
	qTXWvKoFgNdyI=
X-Received: by 2002:a17:90a:d006:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-3ab3a90e57amr6364582a91.12.1791798616213;
        Mon, 12 Oct 2026 02:50:16 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-3ab3a90e57amr6364571a91.12.1791798615743;
        Mon, 12 Oct 2026 02:50:15 -0700 (PDT)
Received: from [10.79.117.80] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38ff0d34sm16558029a91.14.2026.10.12.02.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:50:15 -0700 (PDT)
Message-ID: <bc6440b9-0226-47ae-9e33-594ab6b92004@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:20:10 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS coredump
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
 <20261009-oob-support-glymur-v1-4-96cc8ffcced3@oss.qualcomm.com>
 <20261012-burrowing-tarsier-of-serenity-3bd5da@quoll>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20261012-burrowing-tarsier-of-serenity-3bd5da@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6accad59 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=NpMNtq8KyP0wiFrzd7MA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzOSBTYWx0ZWRfX2pE+PBB5zimB
 eDVHCOr+9rcw8gfNafyzPLSH4ljA6Hpjbee+YfTxE3sGNOhF1jkfSXb4/S9rFRUCZVgECswaDZ5
 jmpPEr5hkQtdWnFzdUGvyH6P++lANl1XhuDT3A7fp/z9E4OzOJ9jtSpmrNSWjyqwm1TqAs0MMiU
 SnE//c89EPpJLVdSG8bRz0cnj9OlM8OjsNcgmtZkxcLsNgoHjTBalMNAolLkn8HzQmKe4oy7QR7
 CzFNI5SIcRm504IfszoK6RxaWTU2+LW3ceP/i3STFlhTpbgndHyebRJbwEiEM5ZdPuDmE+zabVd
 Y0872e2l2cViONYpXIgdZYjqX4fZHwK8B1FG0+30iIDwntC4CSdO/a0P0bZ26WGqo3iPE8F+gOw
 qJcktM0/Qg4nxw2JNAW9+daBiHPtXUQMW4PSdEkoQNlRtyEzVQAguC3rmWmk5+w4NDLf0D395YI
 okEAeDCpJdpBE+OZtnQ==
X-Proofpoint-ORIG-GUID: dDk7RqaljLTKSm0WSfKBalQIHbfdsPWZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzOSBTYWx0ZWRfX/d5cWrj+Uc1r
 GZHLLZAtVXbvjWwudVYbRRc0n3lpWDbpP0wQAnoGqZ3qnwctvIpzMAbByUXN/T2LLpuYeOBMBHZ
 X6SDav8nwnBKGWAg1xU+ZFvPdcYRGn4=
X-Proofpoint-GUID: dDk7RqaljLTKSm0WSfKBalQIHbfdsPWZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120039



On 10/12/2026 2:26 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 09, 2026 at 12:47:42PM +0530, Anvesh Jain P wrote:
>> Add coredump support for the secure and non-secure OOBMSS carveouts.
>> Register fixed dump segments at probe time for attached-state recovery.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5_pas.c | 85 ++++++++++++++++++++++++++++++++++----
>>  1 file changed, 77 insertions(+), 8 deletions(-)
> 
> Why is this separate from Glymur support? How is your device suppose to
> work without this patch?
> 
> Best regards,
> Krzysztof

This patch is diagnostic-only and is not required for OOBMSS boot or SSR
recovery; without it, the device works but no OOB coredump is collected.

I kept it separate to isolate the optional coredump support. I will make
the subject and description generic for coredump support on PAS
subsystems with secondary processors, rather than limiting it to
Glymur/OOBMSS.

-- 
Best Regards,
Anvesh

