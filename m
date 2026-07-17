Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBB03EF663
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 10:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784285677; cv=none; b=haP6V0STLI+J5zgZfGUD9B0Nl7MBqeV/RNhzf1VhWva9M3tcHK8/tzsiCfZfG8MSdfYrOvwKkz5oIZ2XLesutf6xJtzVB2zUr4HxXCOValD9unMgxzVH6/BklGr9QysuWXd0FmEESYKXdH3JHbpTymdc1mS4JNy+AMRmr8VKPXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784285677; c=relaxed/simple;
	bh=e++fRFLE9xONlyH77w/Q1DtmPMosUmEuqZ3QDq01xak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bF4BByiHVjMhjYVx7ca0FAIlNZJDRNcgLxVQQCUIUC+evPHeCFjhFbReMmjjjCUgcVB+ChgLRV7mj+ZDj/KKOVwxJQIudfJiJ2mlV9sfXuyVB3yF3xd5GfjYWtCk9o+uvniuor7RgXYGHoh29xRzgzCKh6umK6baFhPj0FTTpRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjUJsuUB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QIE3s5BQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjUJsuUB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QIE3s5BQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASjxB1323612
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 10:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gbIOXqvXhHXmY126DaOodYajWxb9I3NsGeAgdKh9VZ8=; b=JjUJsuUBIGkFSVnb
	CBKqo6IhxRT3geWUswYIKZXZjS+RJVtXsx0skqs12O7rIKfyOe5Fo+bCPCmWqKv8
	IIM5nDe8i5JJM0fGyITRf+m1KwNS5dHGmitlWCKamxiORbt1HKwC+tHwu7PSsNRH
	ioU81vQ3JnS7Lkrwy/aSf4sKuTJGlIYrdYa7na6FTJYMvWIHDBp162YUp/QBM8cj
	XcbwJHTz9cF/3aqtcIJWn3gnlhPlRCO5YSh/U37TaniG+PZJTVZHAFaSJs5UMCvn
	bnv1LeqQlO0z7+S/cuVaDaIkGJdBZr8Du+GIAMs1jfRRxoET+pPWCEKTj23M6qMw
	o8zOMA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8kcah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 10:54:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c069f73e4so16311321cf.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 03:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784285671; x=1784890471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbIOXqvXhHXmY126DaOodYajWxb9I3NsGeAgdKh9VZ8=;
        b=QIE3s5BQQuWxeCBZ210LMeqOym7wgjFb3Jt6y28ZCsZSS3Y+n4MaPdlKlHLwfsGRvX
         q+JEPrvegNJiimsdvR1D84aOu2eIKFIHVYS8qT43ncAIln+CKDoGYxvALx1Y8GPC46Oq
         eZ1Ae1B5NDGKmlNBkj7FTOT/nikNHV5f18QciE11/jCuUwA3G4BQnvl2/VrAhc0aBSrC
         CSQCSXPKeOEsH4ztw5+kybAzH4mbhIb77jfvo7Nr/feBbt53EPXdCfw7yLLsCJZ6t27c
         fU2Olzt3a/1mygkqhQUvlnskOu0i8LcocULjmzgltIaTFHVAhVDe4F16bKKcB1IlfkoP
         XHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784285671; x=1784890471;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbIOXqvXhHXmY126DaOodYajWxb9I3NsGeAgdKh9VZ8=;
        b=smhE+JrrWttu+wIQTINJNNGc5B62bAHrEOC14qG6cl6HArLZlCiYzL7ZgkY74IjaeE
         ZKMo9Va4Ub+bYiC6ZgfQmNmYIY18gbMd6xmQNZ3f1PcUTDad7XumXLl5sqTYt+UwkTZ+
         tCspZXv7fUWziDvRjFg+8dk80XmPdH5ygyr+0/shcL+MJXGq0zztuyZqQBhyRd2xbu16
         /B8g7R2UcvMMGG+2nL8WvOKccC+tXmovF7RRe5bH2mcgUJ+jVIiX7M8KUh/o1yHvN6ZS
         CpTucLK5Q6dLnSVdgvtIcRnSfpfV4ut+DIQntm9ZrDUIcrqrs0+hyS5hEHF7zOznek3g
         quyw==
X-Forwarded-Encrypted: i=1; AHgh+Rpx+FWYD/oYyv6BXJvYsv1NwKTsaqyWN4xsdzzNh7r5gZ3/UNtJyuOM2hG2/phQP8RhCj7RnAOft53gFHP8yKkv@vger.kernel.org
X-Gm-Message-State: AOJu0YxQHhs4FOI6TPUigi87bWDoFoZQexZplodgJifODETJXRmjVXoi
	tz/LOKVWCdVlq/2GoiI1wL6z+UGRsyeyo1K7NUOqymdQqbNHiZkIZvCR5qgMJxDCcwBm0g+akMA
	uDDqX00wI1KK273Ho1jepUx9sxy9+HaiCffCsmz1Js2tJFK79WYQDp670q6GSr5XlbhPS41fjXq
	axLkM8
X-Gm-Gg: AfdE7cl0NLyFbzjRinEBmBPpXVMXKwAv8L7u61TslY8Gw6PPdz+mQqq1mRxdxCpDDyu
	OYMe3sXG27cpwZ1DoRfiaRvUCwgHrdIukCrn9DWhIM7ZCVqrZSxFPnoCw3A24oxnDdZNB7pdvND
	plc9MEISSGCvxD2B4t2KAg6KsudgtJRX+CO5Av3br1X/8OrIIXYE0pM5zCTqLW/+k+eJNfifz4j
	EM9CmiNKKBm5W+TO8MeJMrC7Ez86JBvwEgRX5ZtXNbnt48Oy+LRHBwLOWxhjMFkmXS/W+uj5/IG
	pL9EdT3qOhqtVjxl4kzy+WHg3RV5fRV5YD9sdGdtm5JdE7yoShg0ALdq6zIFSfdWeXV1/NSOqDq
	ZaIo021G8XU3Jo8NV56Kj9SBb
X-Received: by 2002:ac8:7e8d:0:b0:51c:857f:9c1c with SMTP id d75a77b69052e-5213f861e63mr12662861cf.11.1784285670804;
        Fri, 17 Jul 2026 03:54:30 -0700 (PDT)
X-Received: by 2002:ac8:7e8d:0:b0:51c:857f:9c1c with SMTP id d75a77b69052e-5213f861e63mr12662631cf.11.1784285670418;
        Fri, 17 Jul 2026 03:54:30 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fee321dsm475960a12.6.2026.07.17.03.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 03:54:29 -0700 (PDT)
Message-ID: <2be76246-3430-4f76-b6a9-11de39a961e7@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 12:54:27 +0200
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
 <43293037-99bd-457a-b190-31fb24625b1c@oss.qualcomm.com>
 <0585ee18-5bd3-424b-93b1-eb841c26b63d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0585ee18-5bd3-424b-93b1-eb841c26b63d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OIzuPWyuCg9LAS5VcnxC_2b9Ejq2gSNC
X-Proofpoint-ORIG-GUID: OIzuPWyuCg9LAS5VcnxC_2b9Ejq2gSNC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEwOCBTYWx0ZWRfX8YRMr7w+QG09
 z6kfpswiF87v42I2hTCDk1Zs84P5KisDtCqIDYXutpOIaxFgIM477Gni4rrklZCwEWuyTZWlBFE
 NsXgUrj3VO7LY65Q1VjEMLERnToNCJA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEwOCBTYWx0ZWRfXy46Vug494Vgp
 dHaZ1RdkZD5UwcRJEF0uGK3IqyVBzrphak0k7o6hjql9KYVjF3Ys5Zn4uAKcCJn4GYkfFsbfJWp
 712WJpjVTTjTCxEWq6d3BQVrxQxRK+Zc8DQhs/6gzsloinCNy14rp/6Pv28gQOIUECm+zSuD1gu
 qkJ6dTeXAA8dK8RkZ3xg5DSeU5f3O6vjMv2/JeZD/Y0B5l/k0xqB5KQJk4iH+fC+7+3N4FXudy/
 bSV2GzWlLNDMsBVU1Bj9JAoHYPiWz4XgV8HCF/sbnflEShv7LsTLTQ0Dk7XcEFqA3u8IAUpQ1em
 czHtfAp40g5lTYuKH07WCEmQ6pXJhQClt5IaOJbMtHDNboNpVm0T/siG7U/9+jxdn/qNpvTxkQc
 fDxaV+I16aHa48+n/EfZnK2YpLjjqDmFtr1HnUtCez20+2QB8SQoY2mTKkdQKjSUus7feWeQv1K
 ks2fwGk5BzldOijLx+Q==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a5a09e7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qV3TpINTj3GmVv13LMoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170108

On 7/6/26 10:59 AM, Chunkai Deng wrote:
> On 6/29/2026 8:47 PM, Konrad Dybcio wrote:
> 
>> On 6/19/26 7:01 AM, Chunkai Deng wrote:
>>> The SMEM and RPM transports request their receive interrupt with
>>> IRQF_NO_AUTOEN and enable it only after qcom_glink_native_probe()
>>> returns. Since native_probe() sends the initial version command, the
>>> remote may ACK before the local IRQ is enabled, stalling the version
>>> handshake on a fast remote.
>>>
>>> Split the protocol start (qcom_glink_send_version() and
>>> qcom_glink_create_chrdev()) into a new qcom_glink_native_start().
>>> Transports now enable their IRQ first, then call native_start(), so the
>>> version ACK is guaranteed to be serviced.
>>>
>>> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
>>> ---
>> Would it not be simpler to just move the devm_request_irq a bit down
>> and remove the NO_AUTOEN flag then?
> 
> Thanks for the suggestion.
> I analyzed and verified it locally,but I'd personally still lean towards
> keeping the current change as-is. My reasoning:
> 
> (1) The IRQ must be live before the version handshake — that's the core
> point that can't change. The version command is sent from native_start(),
> so we need to request/enable the IRQ first and only then call
> native_start(). That ordering is only possible with the version send
> kept out of native_probe(), so the split needs to stay.
> 
> (2) Dropping IRQF_NO_AUTOEN does make the structure a little simpler,
> and functionally it's equivalent, but I'd lean towards keeping the
> request-disabled + explicit enable_irq() form. It makes the ordering
> constraint visible at the call site: the IRQ is requested up front,
> and enable_irq() marks the exact point where the handler becomes safe
> to run(glink assigned) and where we want RX servicing to begin. Folding
> that into an implicit auto-enable hides that intent, and I think the
> explicit form is easier to maintain.
> 
> That said, if you'd prefer the simpler form, I'm happy to do the IRQ
> cleanup as a separate follow-up patch on top of this fix rather than
> mixing the refactor into the race fix.

Please don't paste AI responses into your email client, there's a human
on the other side..

If this patch was also created with the use of a coding agent, it must
be disclosed and follow the rules established in:

Documentation/process/coding-assistants.rst

Konrad
