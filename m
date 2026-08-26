Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4863420469
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 13:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750277; cv=none; b=XVrs74npg+ZTL8NITqIdT0NuTVwkBiQsHuF/jasrFtdeVfCrV0B9fDaAeZVKCpbts/0ZWMNbnooYm8BVkE5gc3z+jcO+Pyp/5RjqxxPQfFqTszMBl6sFh62CU2JrGINSx2Uhf8JPQmUu7Nrk+BYb8rlyYjHhhXbuvXlVYeR/MiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750277; c=relaxed/simple;
	bh=BYDsTpoHZztHpVH/KB9MIt4S85CTFk7lYHBkXkgV+nA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ht8QKVlpxu3EvzNaQt5G3sx9xyunwkV19D6u2pT6uvYrtQU9KoGRptY5vMggu+jbjy+8Re1Z5Ky05hDediHuVFOjqIFvmTchIpkJuC3YLZhaBt9B1cV+VdEItXAqFaiQ00PyaJHlTRuXfu2zSY3mf0Rt7rdNiP/CqsyERVu9K+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFBmXjrd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kwiBaWuo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gFBmXjrd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kwiBaWuo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDHdRn1617718
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 13:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DELOI9rOA6Bm04F7WLidIklLxMdtsGlI2iiw3Tgfc7I=; b=gFBmXjrd0bXAHG1r
	R8/tATY6zngKD0xcvCkn3tiCgsi6wIGAwzpH0mjUV3GoGyhMdGGKOmfZ6XtxI9hK
	kObU0MuJ4yFt0gUW1SGU9g1TMyxNIQ7PNBb8ZolH2tcO1LNatYFTNLJf3iOMJQNN
	fzhmQVhxLfgWCsbBH+6trMDyDqDk68AD4aPAey98vgRG7oLGVOelxmRnwZtoK4tT
	lmbrnuq4hasJd8uvcIcZvgwAGuQ1jsAL6/dNxrReTNxeFyQ9VmP6SUmVPr9vl9dn
	2U0y+03fmfLeJl4D5UFfo5+Yx293EF+8KPxUQfj5iTLYOkzTJSFJtu0zNtzNtIKP
	SqL6tA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0wbr01k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 13:17:54 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-744e789f00fso29604137.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 06:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787750273; x=1788355073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DELOI9rOA6Bm04F7WLidIklLxMdtsGlI2iiw3Tgfc7I=;
        b=kwiBaWuoMh64vd8BN3Yn8RYp83AUevy8dz1fHV/vKJz8WhVpMS60tYrduGwhY5SI/m
         /Ys+/UWZTuu6Z7FtsUrj706wd3QJKCDFPX59FiJUKeGF22XCCeUoCEIbAgsupvBZGgt9
         d3l/3SLmULMtxPCSX1PjCCa6pozpy8aZ4O4l44jmUgltp2wu4CQ1EJDKQii8Jj9vWoD+
         5KS+shjhKqAZvpYNnKfWYyy5C9gA/OAIGcx03o2wdF6v7FgPUZyOGOOGVTkUlo6W07fR
         MlurjmcUolR1MmdGEImxMNqLI08UKorcF1f97JNZe5bQq4jSExKGxRIZRDfmUrdwY/Qq
         /B3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750273; x=1788355073;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DELOI9rOA6Bm04F7WLidIklLxMdtsGlI2iiw3Tgfc7I=;
        b=sNKu13XT305VLH+YMCQRnMp7W9BHSszk1p0di19bIgMIdYv5X5RZ6Ihqhakpmz90y9
         xQp5hXYfv4GzkJkDmYx9JusPYpURwAdi7BZdvstAvEnUX1LHVXnLqmh1UBIB8Q94sbkM
         4lRQ0c0t/tZvnNMrVSj7qlBTELBHg8FSHvFytWs1j93SewXYQUl49Volq2nO9n2tBNxR
         8YoDaalHk0PxV9oNwkWy4lzk1czq1+A3zYx+H3/8e0OpqN8JyVf1s59/MjRDk4Cj5V4I
         uAp1mvJ9HYGYVFEncFZDaDN5UwMVo7uU9rbZ/33xoPPZIEQxxXAv9KCkx2RgLMe85mLM
         KFsQ==
X-Forwarded-Encrypted: i=1; AHgh+RpgxWQyZ8bxD6x5vF98Dc/H2cYyH9fxWGp5bUco+wgOh2lh4awgPrTSJw2OSRbou/85NWYwWYTdSz4N3DLYq/07@vger.kernel.org
X-Gm-Message-State: AFuF++m6X1qLeMMI35k76txjhFlKevosa4t4caYOpQ2x3W5AYQyct3cN
	scEAtKVtT44MiiQx0kA5rpZE4zMV8Q2oG2TVgvuOhqG4g++W3O8ppBwbXaQ5XIL/8IT0cqyaZ98
	6ZUfCczS4Vm5Qy2qKEwBY05BsXk4eJ5dpArr30sV5bWMcdhCZ7iC2qSWvwlYnoArJ4TYYDMiz
X-Gm-Gg: AR+sD13f7jHJwAybcGvzv4AXfDDcXdJEIZfBOcWiPpwJNKfTXW/f+UZTgE7rDXQFieR
	8a9552l0/oRnk3By5Fa/LtfSRJSpBDjZs950YcHxyyB2rb+tOcSbRdleswRR0/jLN2XcR4fjyUm
	umwej/vsFhuCNwJeZBqzE+olGuX0ExEVo6qsDqJqve4Dvlh96qw0IIFvy5BzUi6CtMle2ATU+rU
	GL1LGYKHa5DHwurrcVWg/2suwJTx3pSlw9sSYsKnuV0w2rEahagQyPMTQH2p1V2HCjbQfx7m1Ip
	13HeAiwruX+iRBma9yCGE5WiI6KjWJHw7T9Mi/8bRNeu1g6FXMINsQTcyxUizSKQBystGNxVBw3
	KhqTu+kz9h1qF0QBsgZCCz6z4
X-Received: by 2002:a05:6102:3166:b0:783:73ba:7df6 with SMTP id ada2fe7eead31-78373ba9fd5mr278623137.1.1787750273478;
        Wed, 26 Aug 2026 06:17:53 -0700 (PDT)
X-Received: by 2002:a05:6102:3166:b0:783:73ba:7df6 with SMTP id ada2fe7eead31-78373ba9fd5mr278603137.1.1787750272973;
        Wed, 26 Aug 2026 06:17:52 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b235csm376838866b.44.2026.08.26.06.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:17:51 -0700 (PDT)
Message-ID: <0d493aed-acb5-4905-83a2-6dbd6349cb49@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:17:48 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] pmdomain: qcom: rpmhpd: Add NMXC power domain for
 Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
 <20260826102746.633076-3-shengchao.guo@oss.qualcomm.com>
 <6b2f4411-9c38-4b82-b605-6b9a047ab973@oss.qualcomm.com>
 <ao7mrrW_ob77EAIp@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ao7mrrW_ob77EAIp@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: c3JdFV4cYva-JI0wHFjX7QaqNHGdVCr3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMCBTYWx0ZWRfXxMh9uIjZe7LL
 mZ15+zpG66h1c3tJZ4DrkjGFD7Rg/Q6ztGn7mFa/4e4rECXaBx+YC9VI2o7TWWDeKcS1S5ngfXE
 P812N9o2wa0EjVciTKXnb1/gmaomuas=
X-Proofpoint-GUID: c3JdFV4cYva-JI0wHFjX7QaqNHGdVCr3
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a8ee782 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=P5qJYf1CprfF32mA9rkA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMCBTYWx0ZWRfXykJi1EakdX7h
 UsTDx5BEwPyepPqDwhsd5cSRdPBgyuOIE8laWlligiGDusM8X++yUjWDlYlGvJ1l97zppmnwzs0
 oK0ZdLvxkpnStLufUbdsYBJ5ZbUzwuztb5rlIPzaq7jJS1ckD9aYgWsK6eZRtBh7C9EWCZk9/pb
 +mXEQ0tnYsQHfDCHsQy5iWdp9AkAwjXF9wFB1mfowkp9eqMsedHrHd8xZLGJUgf1xl/BbuMTcrs
 yWJ0BeXHETQ1RByz8DOnQ8Dsx72TZkzcwv473GaOySZjnJKLDAHVtoib/m9luIfvcfWFV9ifVpm
 B3gN/T/f/RAt/nuhkMM5K1ceCeIZj7b2klN/s8UKyVPQro9XmnavFy7Szzmdq3Fpf8PnC9TYULr
 nCKTXGuSPcrzvoSLBY9foVIhONjwjYCzGpxb1OJhA8Yiksn4bjRReYdTrz0T7X6ToP3/cob7mnh
 Yp3cqGNbPRH0Azc9VJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260110

On 8/26/26 3:14 PM, Shawn Guo wrote:
> On Wed, Aug 26, 2026 at 03:04:33PM +0200, Konrad Dybcio wrote:
>> On 8/26/26 12:27 PM, Shawn Guo wrote:
>>> From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>>>
>>> Add the nmxc.lvl RPMh resource and register it in the Nord power domain
>>> table. Nord supplies the NSP memory rail from this dedicated resource
>>> rather than from the shared MX rail, so consumers need it exposed as its
>>> own power domain.
>>>
>>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>>> ---
>>>  drivers/pmdomain/qcom/rpmhpd.c | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
>>> index 96e4bd2f5a14..717c44d1c39a 100644
>>> --- a/drivers/pmdomain/qcom/rpmhpd.c
>>> +++ b/drivers/pmdomain/qcom/rpmhpd.c
>>> @@ -198,6 +198,11 @@ static struct rpmhpd mxc_ao = {
>>>  	.res_name = "mxc.lvl",
>>>  };
>>>  
>>> +static struct rpmhpd nmxc = {
>>> +	.pd = { .name = "nmxc", },
>>> +	.res_name = "nmxc.lvl",
>>
>> The commandDB sources suggest this shouls be nspmxc.lvl instead..
>>
>> Can you dump /sys/kernel/debug/cmd-db?
> 
> root@qcom-armv8a:~# cat /sys/kernel/debug/cmd-db

[...]

> 0x300a0: nsp3.lvl [00 00 01 00 c0 00 00 01 80 01 a0 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
> 0x300a4: nsp3.tmr
> 0x300b0: nmxc.lvl [00 00 10 00 c0 00 00 01 80 01 a0 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
> 0x300b4: nmxc.tmr

Alright then

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
