Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915523B8BC4
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 10:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885801; cv=none; b=aDMZsSY//370Pg23rYBlUST99kpNBuU2VVTTB29TFwygnZgJVLJC96fQ9RzgFwx3QB9UMZ5+S45kMHsnCuW4AgvZMMx58Ns8Q7ZG1koFot7iRqHVL1vzUKsn9YLSFL2LY/urubSlev2ZtLZbZNGnpIckWYFoe+G6hXd4LdAbF98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885801; c=relaxed/simple;
	bh=rjo4I26n3c0IXUdbdxD0MoFTbWpgzJ6l+W042Fwrmq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AOBUwD0HqLlqK/VJzAQRS72/vPA1itBculqW5+rXNQTcUmeQjx7nwkarJcIeWuqZq+Jr+aq04OClpzT/fbBL5qfULdeyu0CyHP/9eD9M9HwGFdF9p6JVnfxLXM/AZqZejGUZIyBaLLIHDKkI9mfNSLZ+8tP4YzJ7PUEDmLcdkoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcdrSJl2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NtSDacc6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcdrSJl2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NtSDacc6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9fk5k3475851
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 10:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7BotSoDsAkukhdswcmyp9WdfMfl79/kPupfZf2fAwI4=; b=DcdrSJl2nXO30Y0y
	GDBS8l+hQaSBXlaUW+OKiIh85KP4C4/BqnRQn4rgM6OPuelA03nKcSAJuMZsxoEK
	f5rB1kLvDwNh/ixN6cCkN1a6HM6fvDFMX88MeCnsu9vuz1LoN1H6kNqF9iVZiAhC
	2n4E5iMWhraJaL4pbwSdslLdGxTnjuAJggJmWbCbsk/RNEc+qrZHKrY6PTLCJs/+
	WHVIM+ZrkLadVv/IYiHsR+cmV2wwbkKxC9G+MipmI7viPDER5nf6KtQaZs64TRW0
	Lhzg5DytG5ItwPI6G3Hq8Se6OcpqiWdKPvjiwCOJfDsmJw1chBUMljPXArIJVauT
	UR5i0A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j9e17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 10:03:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530cd3dff25so5862921cf.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 03:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885799; x=1792490599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BotSoDsAkukhdswcmyp9WdfMfl79/kPupfZf2fAwI4=;
        b=NtSDacc6Nj8sPzy1HA7AUJLDOIA79PhrMd3jc2qV9ZSCtnXn7omKHcbQoBXjt174+X
         t0oVQNrVBP+ww1q8962GptqB41wfAWIW8EQFbLUYm4iK3V3UiQ5X/CO7qwYJsU+NclB9
         ksvO8wtBXk9kT6PvB4kKHTVqKlazVmBfab+/V5CMKCHJm7twyE3ogFoJMaZg0kcIR0BB
         0wSgV7LDdBMxrNbNnX7jzn4Mdkp7I4FG6U8pqvBy8rYXCkwj4JYDKK+f9UZ/CPN3vFk+
         cS26xklMWsmeFkyVM74hWOYmDnFSananrjhowrX5zUC3OuJkMujIkscKdXCJHxaZAZ2K
         2dIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885799; x=1792490599;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BotSoDsAkukhdswcmyp9WdfMfl79/kPupfZf2fAwI4=;
        b=a/S7vtfECkxaHstdvPO5rXOWaEqSYx4n3kn4lIwJrWHHrftbb3RGaBTkqlGM72/rs7
         Y+3+IC7v9y1KNkDzYPkFxViG12f3KJPTQWcqEiq+K+bYpnKTtt/UDbKohpl39xCvlPXL
         A6NOGg9g6NX0/aB4ue76sHcmrEg6BPsg6Nvu3kOuikKR1IYQ+RY9pMVoXiYJH9Mit2ey
         Jkm4cQGplpTwdO0QvqFrPJNlt5RfjlhEZTLliHqVUQ0r+yq5MKeQTqkEFvVd4FA14AWP
         ZSFwqGNVBFOhF5Dkry9BYiOEtMp43DOVsLMWuXZiIx+lMp12Xme3vvGQaH/2SJgzaWxp
         Qilg==
X-Forwarded-Encrypted: i=1; AKwUvByPAxigHTeOXByqy7UYF6JyUUBq/r7xgRgEEVHWOvfj2C0YZQw3q2UxEt3hUfcqYzJcFdy8kGFX/T+M+oiBYssh@vger.kernel.org
X-Gm-Message-State: AFq9FYInN0DqmtVC9RF2pIRK+ZB/fvmIOSN6S1iU92QY1BcJL91eMvdL
	UuuMIEUnxj4CfT67PMtw4elYYlZdzY1PLqyGmihFQL3TEMaXW5tcmB4lBr7HKzn9yiGcfK+f63M
	cdKgwg/VNYF/n9LGCUpI4ArGCDdzalgtJMsd3pJq+b/4MG7S0rQPKH8O5pCAIP49uR/p3G7VB
X-Gm-Gg: AYBFou2Zu1jBMDvfN/ugVmCoktfbTELWG64EkmKipAQand9iS16M9tK6jABcBChG3wO
	jKsnuwKQuH9Wv0jFTS2pYPC8mOUogScIqRY8zBDIcocoqkH4VWHwHK+xmXivCHiHmBBYeLcvTZR
	2QJX/urZ1EcvmpZHzUvpiRS6km5ZRcrntOAjChnsGQuYCuiVVph/BZgO4cdHs53w0Kg04oDxUmV
	pz/ue1l5cJpUWilQ1263owrV18zsY8XDoQHtmO3gVQzCM5zTlCCZTYZLljf9oBkTuudAYpqug99
	1BypwjMkA6mQoRs9E/JuT9BFgAYU1rVzShaZnWW6lBMa6dmb5YoiN5Rg6imUOWKAt153+8M2w9/
	WeBxgDhucL3enRvcKtr4uSQ==
X-Received: by 2002:ac8:5e14:0:b0:535:84e3:b33c with SMTP id d75a77b69052e-5359fff77ccmr238294701cf.4.1791885798837;
        Tue, 13 Oct 2026 03:03:18 -0700 (PDT)
X-Received: by 2002:ac8:5e14:0:b0:535:84e3:b33c with SMTP id d75a77b69052e-5359fff77ccmr238294091cf.4.1791885798211;
        Tue, 13 Oct 2026 03:03:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3350fcf309sm352768966b.39.2026.10.13.03.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:03:17 -0700 (PDT)
Message-ID: <b2b51cef-cd88-41d8-b9b6-3c4f5ebf3d59@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:03:13 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support for
 SOCCP on Nord
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
 <20261009-soccp_driver_dtbinding-v1-2-40862f7fc58b@oss.qualcomm.com>
 <77e47222-e633-4d38-b598-8a02921a5d17@oss.qualcomm.com>
 <62d0573e-4085-4a74-b730-faecbe4cacba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <62d0573e-4085-4a74-b730-faecbe4cacba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -tu3VSr9ABOwQDR78HoxDY782uFH5xTh
X-Proofpoint-ORIG-GUID: -tu3VSr9ABOwQDR78HoxDY782uFH5xTh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX7TzeaVJXPOcU
 i45+j5df2Kgw6+qQveoInr30lwmE0+J6LIA4nkHxAXxZ3QDKYeYgy+mPZE6jIrd1hB6Vx1qVSDh
 soelODwnVDfzoDvj+JlbWjkxjGKUtII=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX3pPvSGIQYewi
 JD+c/MvSI6BAF4f6/n8Us/Zu9EdAqp/LBzvHEULJ6eTAxeRpWK2nGZWOkYgJksVajZDbOqfPWZN
 qQwIpddtJ1fP9J4+bEpNh9HZCSEsbis2jG72F8OaLXywx/TZfY2D5pANXNBeoVYsge+zY5+UUx4
 6Ffbrh9JgvISugOFIYapOeQZ/JgBe2Xvia2v8QHGoro1HPytM0bmZyR/nzB6sTUVKEIKVAXs6LV
 AlZSpsYwoHz1TBRgIzWfMi9QQyiTsBS9K6ZtOF6ZFA/SLllw0qYQpK46D5mMF7YwpUYwaM8OC4M
 J+/iOogGBfj7sav9FbjPltUjYEj0pux61zWYPUBOi85w9D1oocdy97krY1gqMkjMV8b84G+3ozH
 rxIZZGPm6z3HmBiQ7LXFaoq471dgP2rrzAbzQE2Z8/IoDIyBjuOwk3QwRyilkDQXMbMgaXRdMRX
 UOgP5svRQ6E4LjqgdWw==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6ace01e7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=CFQHZ4Gs7z3mzJWHRokA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130039

On 10/13/26 11:58 AM, Anurag Pateriya wrote:
> On 10/13/2026 2:27 PM, Konrad Dybcio wrote:
>> On 10/9/26 9:35 AM, Anurag Pateriya wrote:
>>> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
>>> USB Type-C, battery charging and various other functions on Qualcomm SoCs.

[...]

>>>   +static const struct qcom_pas_data nord_soccp_resource = {
>>> +    .crash_reason_smem = 656,
>>> +    .firmware_name = "soccp.mbn",
>>> +    .pas_id = 51,
>>> +    .proxy_pd_names = (char*[]){
>>> +        "cx",
>>> +        "mx",
>>> +        NULL
>>> +    },
>>> +    .ssr_name = "soccp",
>>> +    .sysmon_name = "soccp",
>>> +    .auto_boot = true,
>>
>> No DTB?
>>
>> Konrad
> 
> The base patch isn't merged yet for nord-ride-embedded.dts.
> we need to enable for both rrd and ride-embedded boards.
> I was planning to send them together once nord-ride-embedded.dts is merged.

This is not my question. Remoteprocs on recent SoCs come with split
firmware - MBN for the main part and a separate DTB binary containing
configuration data.

Konrad
